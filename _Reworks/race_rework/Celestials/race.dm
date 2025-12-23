race
	celestial
		name = "Celestial"
		desc = "Through either blessing, curse, or some other contract or agreement, Celestials are mortals- usually humans- who have been granted the powers of the otherworldly races. In spite of this, they are neither inherently holy nor unholy."
		visual = 'Celestial.png'
		passives = list("Tenacity" = 1, "Adrenaline" = 1)
		statPoints = 12
		power = 1
		strength = 1
		endurance = 1
		force = 1
		offense = 1
		defense = 1
		speed = 1
		anger = 1.5
		learning = 1.25
		intellect = 2
		imagination = 1.5
		var/devil_arm_upgrades = 1
		var/sub_devil_arm_upgrades = 0
		proc/checkReward(mob/p)
			var/max = round(p.Potential / 5) + 1
			var/max2 = round(p.Potential / 10) + 1
			if(p.Potential % 5 == 0 || devil_arm_upgrades < max)
				var/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2/da = p.FindSkill(/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2)
				if(devil_arm_upgrades + 1 > max) // not even possible
					return
				devil_arm_upgrades = max
				p << "Your devil arm evolves, toggle it on and off to use it"
				if(da.secondDevilArmPick)
					if(p.Potential % 10 == 0 || sub_devil_arm_upgrades < max2)
						if(sub_devil_arm_upgrades + 1 > max2)
							return
						sub_devil_arm_upgrades = max2
						p << "Your secondary devil arm evolves, toggle it on and off to use it"

		onFinalization(mob/user)
			var/Choice
			..()
			Choice=input(user, "Have you gained the powers of Angels (Ultra Instinct) or Demons (Devil Arms)?", "Celestial Type") in list("Angel", "Demon")
			user.CelestialAscension = Choice
			GiveRacial(user)
		proc/GiveRacial(mob/p)
			switch(p.CelestialAscension)
				if("Angel")
					p.passive_handler.Increase("TechniqueMastery", 1)
					p.passive_handler.Increase("StyleMastery", 2)
					if(!locate(/obj/Skills/Buffs/NuStyle/MortalUI/Mortal_Instinct_Style, p))
						var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/MortalUI/Mortal_Instinct_Style
						p.AddSkill(s)
					p << "You have embarked upon the path of true martial arts mastery: Ultra Instinct."
				if("Demon")
					p.TrueName=input(p, "What is the name of the Demon within?", "Get True Name") as text
					p.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2)
					for(var/transformation/celestial/unlimited_high_tension/HT in p.race.transformations)
						p.race.transformations -=HT
						del HT
