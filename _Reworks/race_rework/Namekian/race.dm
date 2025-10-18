race
	namekian
		name = "Namekian"
		icon_neuter = list('Namek1.dmi')
		gender_options = list("Neuter")
		desc = "Namekians are green skined humanoids. They survive almost purely on water and photosynthis, and are a peaceful race. But just because they are peaceful does not mean they cannot fight."
		visual = 'Namek.png'

		power = 2
		strength = 1
		endurance = 1
		force = 1
		offense = 1
		defense = 1
		speed = 1
		anger = 1.5
		imagination = 2
		intellect = 1.5
		learning = 1.25
		skills = list(/obj/Skills/Buffs/SlotlessBuffs/Regeneration, /obj/Skills/Queue/Infestation)
		/* /obj/Skills/AutoHit/AntennaBeam */
		classes = list("Warrior", "Dragon")
		class_info = list("Soldiers that use their powers for direct combat.", "Supportive masters that try to aid from the sidelines, and invent unique ways to approaching situations.")
		stats_per_class = list("Warrior" = list(1.75, 1.5, 1.25, 1.25, 1.25, 1.25), "Dragon" = list(1,1,2,1.25,0.75,1))
		onFinalization(mob/user)
			..()
			user.EnhancedHearing = 1
			if(user.Class=="Dragon")
				if(!locate(/obj/Skills/Utility/Inner_Dragon_Wish) in user.contents)
					spawn(20)
						var/obj/Skills/Utility/Inner_Dragon_Wish/W = new /obj/Skills/Utility/Inner_Dragon_Wish(user)
						if(!W) return
						user.contents += W
						W.Cooldown(1, W.Cooldown * 10, user)
						user << "<font color=#77ff77><b>Your inner dragon slumbers, its power not yet ready to awaken.</b></font>"
			for(var/obj/Skills/Buffs/SlotlessBuffs/Regeneration/r in user)
				r.RegenerateLimbs=1