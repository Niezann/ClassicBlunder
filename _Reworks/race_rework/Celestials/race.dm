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
			if(p.Potential % 5 == 0 || devil_arm_upgrades < max)
				var/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2/da = p.FindSkill(/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2)
				if(devil_arm_upgrades + 1 > max) // not even possible
					return
				devil_arm_upgrades = max
				p << "Your devil arm evolves, toggle it on and off to use it"
				if(da.secondDevilArmPick)
					if(sub_devil_arm_upgrades < round((p.Potential - ASCENSION_TWO_POTENTIAL) / 10) + 1)
						if(p.Potential - ASCENSION_TWO_POTENTIAL % 10 == 0)
							sub_devil_arm_upgrades = round((p.Potential - ASCENSION_TWO_POTENTIAL) / 10) + 1
							p << "Your secondary devil arm evolves, toggle it on and off to use it"

		onFinalization(mob/user)
			var/Choice
			var/Confirm
			while(Confirm!="Yes")
				Choice=input(user, "Have you gained the powers of Angels or Demons?", "Celestial Type") in list("Angel", "Demon")
				user.CelestialAscension = Choice
				switch(user.CelestialAscension)
					if("Angel")
						Confirm=alert(user, "Your body was imparted with the spark of the divine normally reserved for the soul, granting your mind and body natural harmony far beyond that of the average mortal.", "Angel", "Yes", "No")
						if("Yes")
							passives["TechniqueMastery"]=1
							passives["StyleMastery"]=2
							if(!locate(/obj/Skills/Buffs/NuStyle/MortalUI/Mortal_Instinct_Style, user))
								var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/MortalUI/Mortal_Instinct_Style
								user.AddSkill(s)
							user << "You have embarked upon the path of true martial arts mastery: Ultra Instinct."
					if("Demon")
						Confirm=alert(user, "An inert demon has been forcibly implanted in your soul, allowing you to brandish its power as a weapon.", "Demon", "Yes", "No")
						if("Yes")
							user.TrueName=input(user, "What is the name of the Demon within?", "Get True Name") as text
							user.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2)
				user.CelestialAscension = Choice
				user.passive_handler.increaseList(passives)
				for(var/s in skills)
					user.AddSkill(new s)
