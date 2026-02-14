ascension
	angel
		passives = list()
		one
			unlock_potential = ASCENSION_ONE_POTENTIAL
			passives = list("HolyMod" = 0.25, "SpiritPower" = 0.25)
			strength = 0.25
			endurance = 0.25
			speed = 0.25
			recovery = 0.25
			on_ascension_message = "Your authority strengthens."
			postAscension(mob/owner)
				..()
				if(owner.AngelAscension == "Guardian")
					owner.GrantGuardianItem(/obj/Items/Wearables/Guardian/Belt_of_Truth)
					owner << "(Please re-equip your Heavenly Armaments to receive their boons.)"
				if(owner.AngelAscension == "Mentor")
					passives["TechniqueMastery"]=1
					passives["StyleMastery"]=2
					passives["GotUpdate22"]=1
				owner.Class = "Principality"
		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			passives = list("HolyMod" = 0.75, "SpiritPower" = 0.25,"SpiritFlow"=1,"CallousedHands"=0.3,"SpiritSword"=0.5,"SpiritHand"=2)
			strength = 0.35
			force = 0.35
			defense = 0.35
			offense = 0.25
			recovery = 0.25
			speed = 0.35
			on_ascension_message = "You grow ever-closer to God."
			postAscension(mob/owner)
				//t2 style
				if(owner.AngelAscension=="Mentor")
					owner.passive_handler.Increase("StyleMastery",1)
					owner << "Your connection to the Heavens reinforce your own understanding of Instinct."
					owner.UILevel=2
				if(owner.AngelAscension == "Guardian")
					owner.GrantGuardianItem(/obj/Items/Armor/Guardian/Breastplate_of_Righteousness)
					owner.GrantGuardianItem(/obj/Items/Wearables/Guardian/Sandals_of_Peace)
					owner << "(Please re-equip your Heavenly Armaments to receive their boons.)"
					owner.passive_handler.Increase("SwordAscension",1)
				..()
				owner.Class = "Power"
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			passives = list("HolyMod" = 1, "SpiritPower" = 0.25, " KiControlMastery"=1,  "CalmAnger" = 1)
			anger = 0.2
			on_ascension_message = "You shall not abide evil."
			postAscension(mob/owner)
				//t3 style/armor, can now teach style
				if(owner.AngelAscension=="Mentor")
					owner << "Your understanding of Instinct is close to completion."
					owner.UILevel=3
				if(owner.AngelAscension == "Guardian")
					owner.GrantGuardianItem(/obj/Items/Wearables/Guardian/Helmet_of_Salvation)
					owner.GrantGuardianItem(/obj/Items/Wearables/Guardian/Shield_of_Faith)
					owner << "(Please re-equip your Heavenly Armaments to receive their boons.)"
				..()
				owner.Class = "Virtue"
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			passives = list("HolyMod" = 2, "TechniqueMastery" = 1, "GodKi"=1)
			on_ascension_message = "You shall not abide evil."
			postAscension(mob/owner)
				//t4 style
				if(owner.AngelAscension=="Mentor")
					owner << "You have fully attuned yourself to your divine Instinct."
					owner.UILevel=4
				if(owner.AngelAscension == "Guardian")
					owner.GrantGuardianItem(/obj/Items/Sword/Guardian/Sword_of_the_Spirit)
					owner << "(Please re-equip your Heavenly Armaments to receive their boons.)"
				..()
				owner.Class = "Dominion"
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			passives = list("SpiritPower" = 0.25)//not sure what to give here. i'll think about it
			on_ascension_message = "When closing your eyes, you bear witness to His heavenly throne."
			postAscension(mob/owner)
				..()
				owner.Class = "Throne"
		six
			unlock_potential = ASCENSION_SIX_POTENTIAL
			passives = list("SpiritPower" = 0.25)//not sure what to give here. i'll think about it
			on_ascension_message = "When closing your eyes, you bear witness to His heavenly throne."
			postAscension(mob/owner)
				..()
				owner.Class = "Divine Right Hand"