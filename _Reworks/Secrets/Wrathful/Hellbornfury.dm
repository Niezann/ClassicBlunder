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
	NeedsHealth = 90
	TooMuchHealth = 91
	HealthThreshold = 75
	BuffName = "Hellborn Fury"
	EndMult = 1
	StrMult = 1
	AutoAnger = 1
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, "Instinct" = 1, "Flow" = 1, \
						"LikeWater" = 1 + round(p.Potential/25,1), "Meaty Paws" = round(p.Potential/20,1))
		StrMult += (p.Potential/150)
		ForMult += (p.Potential/150)
		DefMult = clamp(0.75 + (p.Potential/200),0.75,1)
		SpdMult = clamp(0.75 + (p.Potential/200),0.75,1)
		OffMult = 1.2 + p.Potential/200
		PowerMult = 1 + (p.Potential/200)
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()
		// gain oozaru, but in base

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Two
	ActiveMessage = "slowly loses sight of themselves, as their blood starts to glow. There is no need to hide anymore, when so much is on the line."
	OffMessage = "is ever-silent, their blood starting to stick to the ground. Their self-image falters, but they know what they're doing. And they know why. <b>Do you?</b>"
	NeedsHealth = 75
	TooMuchHealth = 76
	HealthThreshold = 50
	AutoAnger = 1
	BuffName = "Hellspawn"
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, \
						"LikeWater" = 2 + round(p.Potential/25,1), "Flicker" = 1, "Pursuer" = 1,  "BuffMastery" = 1.5, "PureDamage" = 1, \
						"Meaty Paws" = round(p.Potential/20,1), "Instinct" = 2, "Flow" = 2 )
		StrMult += (p.Potential/100)
		ForMult += (p.Potential/100)
		PowerMult = 1 + (p.Potential/200)
		if(p.Potential>=100)
			passives["Wrathful"] = 1
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Three
	ActiveMessage = "'s movements speed up, their eyes glowing red, their blood taking the consistency of a thick tar."
	OffMessage = "finally started acting like who they really are."
	NeedsHealth = 50
	TooMuchHealth = 51
	HealthThreshold = 15
	AutoAnger = 1
	BuffName = "True Hellspawn"
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, "AngerAdaptiveForce" = round(p.Potential/100), \
						"Powerhouse" = 1 + (p.Potential/75), "Instinct" = 3, "Flow" = 3, "Flicker" = 2, "Pursuer" = 2, "BuffMastery" = 2, "PureDamage" = 2)
		StrMult = 1 + (p.Potential/50)
		ForMult = 1 + (p.Potential/50)
		PowerMult = 1 + (p.Potential/150)
		EnergyHeal = 0.005 * p.Potential
		VaizardHealth = (10 * (p.Potential/100))
		if(p.Potential>=75)
			passives["Wrathful"] = 1
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/HellbornFury/Stage_Four
	ActiveMessage = "is no longer who you knew them as. Were they ever that person to begin with?"
	OffMessage = "returns to who they once were, as if nothing happened. But you'll never see them the same way again, will you?"
	NeedsHealth = 15
	TooMuchHealth = 16
	AutoAnger = 1
	BuffName = "Herald of the Depths"
	adjust(mob/p)
		if(altered) return
		passives = list("AutoAnger" = 1, "AngerAdaptiveForce" = round(p.Potential/100), \
						"Powerhouse" = 2 + (p.Potential/25), "Instinct" = 4, "Flow" = 4, "Flicker" = 3, "Pursuer" = 3, "BuffMastery" = 3, "PureDamage" = 2.5)
		StrMult = 1 + (p.Potential/30)
		ForMult = 1 + (p.Potential/30)
		PowerMult = 1 + (p.Potential/75)
		EnergyHeal = 0.01 * p.Potential
		VaizardHealth = (10 * (p.Potential/100))
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
	p.oozaru_type="Demonic"