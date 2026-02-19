#define MAGATAMA_SWAP_COOLDOWN 36000 // 1 hour in deciseconds
#define MAGATAMA_COST_ESCALATION 0.25 // +25% base cost per magatama crafted
#define MAGATAMA_DEFAULT_SCALING 0.05 // default additive gain per point of potential per passive

mob/var
	magatama_last_swap = 0
	magatama_last_type
	magatama_crafted = 0

obj/Items/Magatama
	Stealable = 0
	Pickable = 0
	var/list/base_passives = list()
	var/list/passive_scaling = list()
	var/list/ascension_passives = list()
	var/list/magatama_skills = list()
	var/list/ascension_skills = list()
	var/list/scaled_passives
	var/craft_cost = 0
	var/craft_ascension = 0

	Drop()
		usr << "Magatama are bound to your soul and cannot be dropped."
		return

	proc
		potentialBonus(mob/user, rate = MAGATAMA_DEFAULT_SCALING)
			return max(0, (user.Potential - 1) * rate)

		getScaledPassives(mob/user)
			var/list/result = list()
			for(var/p in base_passives)
				var/rate = MAGATAMA_DEFAULT_SCALING
				if(p in passive_scaling)
					rate = passive_scaling[p]
				result[p] = base_passives[p] + potentialBonus(user, rate)
			for(var/level_str in ascension_passives)
				if(user.AscensionsAcquired >= text2num(level_str))
					var/list/asc_list = ascension_passives[level_str]
					for(var/p in asc_list)
						var/rate = MAGATAMA_DEFAULT_SCALING
						if(p in passive_scaling)
							rate = passive_scaling[p]
						if(p in result)
							result[p] += asc_list[p] + potentialBonus(user, rate)
						else
							result[p] = asc_list[p] + potentialBonus(user, rate)
			return result

		grantSkills(mob/user)
			for(var/S in magatama_skills)
				var/obj/Skills/existing = locate(S) in user
				if(!existing)
					user.AddSkill(new S)
			for(var/level_str in ascension_skills)
				if(user.AscensionsAcquired >= text2num(level_str))
					var/list/skill_list = ascension_skills[level_str]
					for(var/S in skill_list)
						var/obj/Skills/existing = locate(S) in user
						if(!existing)
							user.AddSkill(new S)

		revokeSkills(mob/user)
			for(var/S in magatama_skills)
				var/obj/Skills/existing = locate(S) in user
				if(existing) user.DeleteSkill(existing)
			for(var/level_str in ascension_skills)
				var/list/skill_list = ascension_skills[level_str]
				for(var/S in skill_list)
					var/obj/Skills/existing = locate(S) in user
					if(existing) user.DeleteSkill(existing)

		equipMagatama(mob/user)
			suffix = "*Equipped*"
			scaled_passives = getScaledPassives(user)
			user.passive_handler.increaseList(scaled_passives)
			grantSkills(user)
			user.magatama_last_swap = world.realtime
			user.magatama_last_type = type
			user << "You ingest [src]. Its power courses through your veins."

		unequipMagatama(mob/user)
			if(scaled_passives)
				user.passive_handler.decreaseList(scaled_passives)
				scaled_passives = null
			revokeSkills(user)
			suffix = null
			user << "[src]'s influence recedes from your body."

		refreshPassives(mob/user)
			if(suffix != "*Equipped*") return
			if(scaled_passives)
				user.passive_handler.decreaseList(scaled_passives)
			scaled_passives = getScaledPassives(user)
			user.passive_handler.increaseList(scaled_passives)
			revokeSkills(user)
			grantSkills(user)

	ObjectUse(mob/Players/User = usr)
		if(!(src in User))
			return

		if(!User.isRace(/race/demi_fiend))
			User << "Only a Demi-fiend can harness the power of a Magatama."
			return

		if(suffix == "*Equipped*")
			unequipMagatama(User)
			return

		for(var/obj/Items/Magatama/M in User)
			if(M != src && M.suffix == "*Equipped*")
				User << "You already have [M.name] equipped. Unequip it first."
				return

		if(type != User.magatama_last_type && User.magatama_last_swap)
			var/elapsed = world.realtime - User.magatama_last_swap
			if(elapsed < MAGATAMA_SWAP_COOLDOWN)
				var/remaining = (MAGATAMA_SWAP_COOLDOWN - elapsed) / 10
				var/mins = round(remaining / 60)
				var/secs = round(remaining % 60)
				User << "Your body is still adjusting. You must wait [mins]m [secs]s before ingesting a different Magatama."
				return

		equipMagatama(User)

mob/proc/refreshMagatama()
	for(var/obj/Items/Magatama/M in src)
		if(M.suffix == "*Equipped*")
			M.refreshPassives(src)
			return

mob/proc/CraftMagatama()
	set name = "Craft Magatama"
	set category = "Demi-fiend"

	if(!isRace(/race/demi_fiend))
		return

	var/list/craft_names = list()
	var/list/craft_paths = list()
	var/list/craft_costs = list()

	for(var/T in subtypesof(/obj/Items/Magatama))
		var/obj/Items/Magatama/template = new T
		if(template.craft_cost <= 0)
			del template
			continue
		if(template.craft_ascension > src.AscensionsAcquired)
			del template
			continue
		if(locate(T) in src)
			del template
			continue
		var/actual_cost = round(template.craft_cost * (1 + magatama_crafted * MAGATAMA_COST_ESCALATION))
		craft_names += template.name
		craft_paths += T
		craft_costs += actual_cost
		del template

	if(!craft_names.len)
		src << "There are no Magatama available to craft right now."
		return

	var/list/display = list()
	for(var/i = 1; i <= craft_names.len; i++)
		display += "[craft_names[i]] ([Commas(craft_costs[i])] Mana Bits)"
	display += "Cancel"

	var/choice = input(src, "Select a Magatama to craft.", "Craft Magatama") in display
	if(choice == "Cancel" || !choice) return

	var/idx = display.Find(choice)
	if(idx < 1 || idx > craft_names.len) return

	var/cost = craft_costs[idx]
	var/craft_path = craft_paths[idx]

	var/obj/Items/mineral/bits = locate(/obj/Items/mineral) in src
	if(!bits || bits.value < cost)
		src << "You need [Commas(cost)] Mana Bits to craft this Magatama."
		return

	src.TakeMineral(cost)
	var/obj/Items/Magatama/M = new craft_path
	src.AddItem(M)
	magatama_crafted++
	src << "You have crafted [M.name]."

obj/Items/Magatama/Marogareh
	name = "Marogareh"
	desc = "The first Magatama. A writhing, parasitic organism that awakens the demonic potential within its host."
	base_passives = list("UnarmedDamage" = 1, "BlockChance" = 10, "CriticalBlock" = 0.05, "Momentum" = 1)
	passive_scaling = list("BlockChance" = 0.125, "CriticalBlock" = 0.075, "Fa Jin" = 0.5)
	ascension_passives = list("1" = list("Fa Jin" = 1))
	magatama_skills = list(/obj/Skills/Queue/Kinshasa)
	ascension_skills = list("1" = list(/obj/Skills/Queue/Curbstomp))

obj/Items/Magatama/Wadatsumi
	name = "Wadatsumi"
	desc = "A Magatama of frozen seas. Those who ingest it command the bitter cold and the rhythmic power of ocean waves."
	base_passives = list("IceAge" = 30, "Chilling" = 2, "Familiar" = 1, "WaveDance" = 1)
	passive_scaling = list("IceAge" = 0.5, "Chilling" = 0.125, "Familiar" = 0.075)
	ascension_passives = list("1" = list("BlizzardBringer" = 1))
	magatama_skills = list(/obj/Skills/AutoHit/Magic/Blizzard)
	craft_cost = 5000
