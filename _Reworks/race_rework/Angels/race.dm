race
	angel
		name = "Angel"
		desc = "An otherworldly race hailing from the Void. There are two varieties: ancient mentors to mortalkind that are said to be masters of martial and spiritual arts alike, and otherworldly guardians of (REDACTED)."
		visual = 'Angels.png'
		locked = TRUE
		power = 5
		strength = 1.5
		endurance = 2
		speed = 1.65
		offense = 1.5
		defense = 1.5
		force = 1.5
		recovery = 1.25
		regeneration = 1
		imagination = 3
		var/devil_arm_upgrades = 1

		passives = list("HolyMod" = 0.5, "StaticWalk" = 1, "SpaceWalk" = 1, "SpiritPower" = 1, "MartialMagic" = 1)
		skills = list()
		onFinalization(mob/user)
			user.Timeless = 1
			var/Choice
			var/Confirm
			while(Confirm!="Yes")
				Choice=input(user, "Are you a Guardian (insert biblically accurate meme here) or a Mentor (adhere more closely to Dragon Ball Canon)?", "Angel Ascension") in list("Guardian", "Mentor")
				switch(Choice)
					if("Guardian")
						Confirm=alert(user, "Do you wish to guard the gates to the world beyond?", "Angel Ascension", "Yes", "No")
						user.GrantGuardianItem(/obj/Items/Sword/Guardian/Sword_of_the_Saint)
					if("Mentor")
						Confirm=alert(user, "Do you wish to mentor humanity and ensure the spiritual arts remain unforgotten?", "Angel  Ascension", "Yes", "No")
						if(!locate(/obj/Skills/Buffs/NuStyle/UnarmedStyle/AngelStyles/Selfless_State, user))
							var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/UnarmedStyle/AngelStyles/Selfless_State
							user.AddSkill(s)
							user << "You have embarked upon the path of true martial arts mastery: Ultra Instinct."
							user.Secret="Ultra Instinct"
							user.UILevel=1
				user.AngelAscension = Choice
				//t1 style/armor unlocked
