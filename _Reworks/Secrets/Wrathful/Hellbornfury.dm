/*
staggering auto buffs that get better and better up until the best being at 10%,
scaling with potential as well
*/


/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury
	AllOutAttack = 0
	Cooldown = -1
/obj/Skills/Buffs/SlotlessBuffs/Autonomous
	var/TooLittleHealth=0
/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/adjust(mob/p)

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_One
	ActiveMessage = "is enveloped in a horrifying power, as you start to understand just what you're fighting against."
	OffMessage = "listlessly gazes forward, eyes starting to glaze over. Perhaps they are starting to understand, too."
	BuffName = "Hellborn Fury"
	//injury
	TooMuchInjury=15
	NeedsInjury=5
	TooLittleInjury=4
	EndMult = 1
	StrMult = 1
	adjust(mob/p)
		if(altered) return
		passives = list("CalmAnger" = 1, "Instinct" = 2, "PureDamage" = 1.5,\
						"LikeWater" = 1 + round(p.Potential/25,1), "AbyssMod" = round(p.Potential/40,1), \
						"BleedHit"=0.5, "FavoredPrey" = "Depths", "SlayerMod"= 0.25*(p.AscensionsAcquired+1))
		StrMult = 1.15 + (p.Potential/150)
		ForMult = 1.15 + (p.Potential/150)
		OffMult = 1.15 + (p.Potential/200)
		PowerMult = 1.05 + (p.Potential/200)
		AutoAnger=0
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()
		// gain oozaru, but in base

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Two
	ActiveMessage = "slowly loses sight of themselves, as their blood starts to glow. There is no need to hide anymore, when so much is on the line."
	OffMessage = "is ever-silent, their blood starting to stick to the ground. Their self-image falters, but they know what they're doing. And they know why. <b>Do you?</b>"
	//injury
	TooMuchInjury=25
	NeedsInjury=15
	TooLittleInjury=14
	BuffName = "Hellspawn"
	adjust(mob/p)
		if(altered) return
		passives = list("CalmAnger" = 1, \
						"LikeWater" = 2 + round(p.Potential/25,1), "Flicker" = 1, "Pursuer" = 1, "PureDamage" = 2, \
						"Instinct" = 3, "AbyssMod" = round(p.Potential/30,1), "BleedHit"=0.5, "FavoredPrey" = "Depths","SlayerMod"= 0.25*(p.AscensionsAcquired+1))
		StrMult = 1.2 + (p.Potential/100)
		ForMult = 1.2 + (p.Potential/100)
		OffMult = 1.2 + (p.Potential/200)
		PowerMult = 1.075 + (p.Potential/200)
		AutoAnger=0
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Three
	ActiveMessage = "'s movements speed up, their eyes glowing red, their blood taking the consistency of a thick tar."
	OffMessage = "finally started acting like who they really are."
	//injury
	TooMuchInjury=40
	NeedsInjury=25
	TooLittleInjury=24
	BuffName = "True Hellspawn"
	adjust(mob/p)
		if(altered) return
		passives = list("CalmAnger" = 1, "BleedHit"=0.25, \
						"LikeWater" = 2 + round(p.Potential/20,1),"SlayerMod"= 0.5*(p.AscensionsAcquired+1), \
						"Powerhouse" = 1 + (p.Potential/75), "Instinct" = 4, "Flicker" = 2, "Pursuer" = 2, "PureDamage" = 2.5, "AbyssMod" = round(p.Potential/20,1), "FavoredPrey" = "Depths")
		StrMult = 1.25 + (p.Potential/75)
		ForMult = 1.25 + (p.Potential/75)
		OffMult = 1.25 + (p.Potential/75)
		PowerMult = 1.1 + (p.Potential/150)
		EnergyHeal = 0.005 * p.Potential
		AutoAnger=0
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Four
	ActiveMessage = "is no longer who you knew them as. Were they ever that person to begin with?"
	OffMessage = "returns to who they once were, as if nothing happened. But you'll never see them the same way again, will you?"
	//injury
	NeedsInjury=41
	TooLittleInjury=40
	BuffName = "Herald of the Depths"
	adjust(mob/p)
		if(altered) return
		passives = list("CalmAnger" = 1, "LikeWater" = 2 + round(p.Potential/15,1),"SlayerMod"= 0.5*(p.AscensionsAcquired+1),\
						"Powerhouse" = 2 + (p.Potential/25), "Instinct" = 5, "Flicker" = 3, "Pursuer" = 3, "PureDamage" = 3, "AbyssMod" = round(p.Potential/15,1), "FavoredPrey" = "Beyond")
		StrMult = 1.25 + (p.Potential/50)
		ForMult = 1.25 + (p.Potential/50)
		OffMult = 1.25 + (p.Potential/50)
		PowerMult = 1.15 + (p.Potential/75)
		EnergyHeal = 0.01 * p.Potential
		AutoAnger=0
		if(prob(15)&&p.transUnlocked<2&&p.passive_handler.Get("Herald of the End"))
			p.passive_handler.Increase("The Clock Is Ticking", 0.5)
			p<<"<font color=red><b>You of all people should know how dangerous this power is. The clock is ticking, [p]...</font></b>"
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()
/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Five
	ActiveMessage = "shrouds themselves in darkness, awakening the monster they  were all along."
	OffMessage = "somehow manages to return to normal. Is it over?"
	//injury
	NeedsSSJ=2
	TooLittleHealth=0.1
	BuffName = "Bringer of the Calamity"
	adjust(mob/p)
		if(altered) return
		passives = list("EndlessAnger" = 1, "LikeWater" = 2 + round(p.Potential/15,1),"SlayerMod"= 0.5*(p.AscensionsAcquired+1),\
						"Powerhouse" = 2 + (p.Potential/25), "Instinct" = 5, "Flicker" = 5, "Pursuer" = 5, "PureDamage" = 5, "AbyssMod" = round(p.Potential/15,1), "FavoredPrey" = "Beyond")
		StrMult = 1.25 + (p.Potential/50)
		ForMult = 1.25 + (p.Potential/50)
		OffMult = 1.25 + (p.Potential/50)
		PowerMult = 1.15 + (p.Potential/75)
		AutoAnger=1
		if(p.transUnlocked<2)
			passives = list("InjuryImmune"=1, "EndlessAnger" = 1, "LikeWater" = 2 + round(p.Potential/15,1),"SlayerMod"= 0.5*(p.AscensionsAcquired+1),\
							"Powerhouse" = 2 + (p.Potential/25), "Instinct" = 5, "Flicker" = 5, "Pursuer" = 5, "PureDamage" = 5, "AbyssMod" = round(p.Potential/15,1), "FavoredPrey" = "Beyond")
			Enlarge = 3
			DarkChange=1
			IconTint=list(0.15,0,0, 0.05,0.25,0.15, 0.05,0.05,0.35, 0,0,0)
			BioArmor=500
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()


/mob/Admin3/verb/GiveHellspawn()
	var/mob/p = input(src, "Who?") in players
	p << "You have been given the Hellspawn buff."
	p.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_One)
	p.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Two)
	p.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Three)
	p.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Four)
	p.passive_handler.Increase("HellPower", 0.1)
	p.passive_handler.Increase("Persistence", 2)
	p.passive_handler.Increase("MaimMastery", 1)
	p.AddSkill(new/obj/Skills/False_Moon)
	p.oozaru_type="Demonic"
	for(var/transformation/saiyan/ssj in p.race.transformations)
		if(istype(ssj, /transformation/saiyan/super_saiyan))
			p.race.transformations -= ssj
			del ssj
	for(var/transformation/saiyan/ssj2 in p.race.transformations)
		if(istype(ssj2, /transformation/saiyan/super_saiyan_2))
			p.race.transformations -= ssj2
			del ssj2
	for(var/transformation/saiyan/ssj3 in p.race.transformations)
		if(istype(ssj3, /transformation/saiyan/super_saiyan_3))
			p.race.transformations -= ssj3
			del ssj3
	for(var/transformation/saiyan/ssj4 in p.race.transformations)
		if(istype(ssj4, /transformation/saiyan/super_saiyan_4))
			p.race.transformations -= ssj4
			del ssj4
	for(var/transformation/saiyan/ssjg in p.race.transformations)
		if(istype(ssjg, /transformation/saiyan/super_saiyan_god))
			p.race.transformations -= ssjg
			del ssjg
	for(var/transformation/saiyan/ssjb in p.race.transformations)
		if(istype(ssjb, /transformation/saiyan/super_saiyan_blue))
			p.race.transformations -= ssjb
			del ssjb