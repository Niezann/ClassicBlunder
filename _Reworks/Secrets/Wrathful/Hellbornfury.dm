/*
staggering auto buffs that get better and better up until the best being at 10%,
scaling with potential as well
*/


/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury
	AllOutAttack = 0
	Cooldown = -1
/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/adjust(mob/p)

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_One
	ActiveMessage = "is enveloped in a horrifying power, as you start to understand just what you're fighting against."
	OffMessage = "listlessly gazes forward, eyes starting to glaze over. Perhaps they are starting to understand, too."
	BuffName = "Hellborn Fury"
	//injury
	TooMuchInjury=15
	NeedsInjury=5
	InjuryThreshold=14
	TooLittleInjury=4
	EndMult = 1
	StrMult = 1
	AutoAnger = 1
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, "Instinct" = 2, \
						"LikeWater" = 1 + round(p.Potential/25,1), "AbyssMod" = round(p.Potential/40,1))
		StrMult = 1.15 + (p.Potential/150)
		ForMult = 1.15 + (p.Potential/150)
		OffMult = 1.15 + (p.Potential/200)
		PowerMult = 1.05 + (p.Potential/200)
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
	InjuryThreshold=24
	TooLittleInjury=14
	AutoAnger = 1
	BuffName = "Hellspawn"
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, \
						"LikeWater" = 2 + round(p.Potential/25,1), "Flicker" = 1, "Pursuer" = 1,  "BuffMastery" = 1.5, "PureDamage" = 1, \
						"Instinct" = 3, "AbyssMod" = round(p.Potential/30,1))
		StrMult = 1.25 + (p.Potential/100)
		ForMult = 1.25 + (p.Potential/100)
		OffMult = 1.25 + (p.Potential/200)
		PowerMult = 1.075 + (p.Potential/200)
		if(p.Potential>=100)
			passives["Wrathful"] = 1
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
	InjuryThreshold=39
	AutoAnger = 1
	BuffName = "True Hellspawn"
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, "AngerAdaptiveForce" = round(p.Potential/100), \
						"Powerhouse" = 1 + (p.Potential/75), "Instinct" = 4, "Flicker" = 2, "Pursuer" = 2, "BuffMastery" = 2, "PureDamage" = 2, "AbyssMod" = round(p.Potential/20,1))
		StrMult = 1.35 + (p.Potential/50)
		ForMult = 1.35 + (p.Potential/50)
		OffMult = 1.35 + (p.Potential/50)
		PowerMult = 1.1 + (p.Potential/150)
		EnergyHeal = 0.005 * p.Potential
		if(p.Potential>=75)
			passives["Wrathful"] = 1
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Four
	ActiveMessage = "is no longer who you knew them as. Were they ever that person to begin with?"
	OffMessage = "returns to who they once were, as if nothing happened. But you'll never see them the same way again, will you?"
	//injury
	NeedsInjury=41
	TooLittleInjury=40
	AutoAnger = 1
	BuffName = "Herald of the Depths"
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, "AngerAdaptiveForce" = round(p.Potential/100), \
						"Powerhouse" = 2 + (p.Potential/25), "Instinct" = 5, "Flicker" = 3, "Pursuer" = 3, "BuffMastery" = 3, "PureDamage" = 2.5, "AbyssMod" = round(p.Potential/15,1))
		StrMult = 1.45 + (p.Potential/30)
		ForMult = 1.45 + (p.Potential/30)
		OffMult = 1.45 + (p.Potential/30)
		PowerMult = 1.2 + (p.Potential/75)
		EnergyHeal = 0.01 * p.Potential
		if(p.Potential>=50)
			passives["Wrathful"] = 1
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
	p.passive_handler.Increase("Hellpower", 0.5)
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