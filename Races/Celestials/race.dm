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
			if(p.CelestialAscension=="Demon")
				p.checkDevilArmUpgrades();

		onFinalization(mob/user)
			var/Choice
			..()
			Choice=input(user, "Have you gained the powers of Angels (Master of Arms) or Demons (Devil Arms)?", "Celestial Type") in list("Angel", "Demon")
			user.CelestialAscension = Choice
			GiveRacial(user)
		proc/GiveRacial(mob/p)
			switch(p.CelestialAscension)
				if("Angel")
					p << "You have embarked upon the path of the Master of Arms."
				if("Demon")
					p.TrueName=input(p, "What is the name of the Demon within?", "Get True Name") as text
					p.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2)
