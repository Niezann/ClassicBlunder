ascension
	celestial
		passives = list()
		one
			unlock_potential = ASCENSION_ONE_POTENTIAL
			passives = list("SpiritPower" = 0.25)
			anger = 0.25
			strength = 0.25
			endurance = 0.25
			speed = 0.25
			recovery = 0.25
			on_ascension_message = "You become more in-tune with your otherworldly nature."
			postAscension(mob/owner)
				..()
				owner.Class = "Pale Imitation"

		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			passives = list("SpiritPower" = 0.25, "TechniqueMastery" = 1)
			strength = 0.25
			force = 0.25
			defense = 0.25
			offense = 0.25
			recovery = 0.25
			anger = 0.1
			on_ascension_message = "You start to better understand your purpose."
			postAscension(mob/owner)
				..()
				if(owner.CelestialAscension=="Demon")
					var/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2/da = owner.FindSkill(/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2)
					if(!da.secondDevilArmPick)
						owner.FindSkill(/obj/Skills/Buffs/SlotlessBuffs/Devil_Arm2).pickSelection(owner, TRUE)
						owner.race?:sub_devil_arm_upgrades = 1
				if(owner.CelestialAscension=="Angel")
					if(!locate(/obj/Skills/Buffs/NuStyle/MortalUI/Incomplete_Ultra_Instinct_Style, owner))
						var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/MortalUI/Incomplete_Ultra_Instinct_Style
						owner.AddSkill(s)
						spawn(5)
							if(!owner || !owner.client)
								return
							var/list/HybridStyleChoices = list(
								"Mortal Instinct Sword" = /obj/Skills/Buffs/NuStyle/MortalUIStyles/Mortal_Instinct_Sword,
								"Mortal Instinct Grappling" = /obj/Skills/Buffs/NuStyle/MortalUIStyles/Mortal_Instinct_Grappling,
								"Mortal Instinct Mystic" = /obj/Skills/Buffs/NuStyle/MortalUIStyles/Mortal_Instinct_Mystic,
								"Mortal Instinct Martial" = /obj/Skills/Buffs/NuStyle/MortalUIStyles/Mortal_Instinct_Martial)
							var/choice = input(owner,"Your angelic awareness manifests as divine instinct, which discipline will guide it?","Choose Your Instinct Style") as null|anything in HybridStyleChoices
							if(!choice)
								return
							var/path = HybridStyleChoices[choice]
							if(!path)
								return
							if(locate(path) in owner.contents)
								return
							var/obj/Skills/Buffs/NuStyle/MortalUIStyles/newStyle = new path(owner)
							owner.contents += newStyle
							switch(choice)
								if("Mortal Instinct Sword")
									owner.HybridChoice = "Sword"
								if("Mortal Instinct Grappling")
									owner.HybridChoice = "Grappling"
								if("Mortal Instinct Mystic")
									owner.HybridChoice = "Mystic"
								if("Mortal Instinct Martial")
									owner.HybridChoice = "Martial"
								else
									owner.HybridChoice = ""
							owner << "<font color='#b4f0ff'><b>You awaken the <u>[choice]</u> within your divine instinct!</b></font>"
				owner.Class = "Lightbringer"
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			passives = list("SpiritPower" = 0.5, "TechniqueMastery" = 2)
			anger = 0.25
			strength = 0.25
			force = 0.25
			endurance = 0.5
			recovery = 0.35
			postAscension(mob/owner)
				..()
				if(owner.CelestialAscension=="Angel")
					if(!locate(/obj/Skills/Buffs/NuStyle/MortalUI/Ultra_Instinct_Style, owner))
						var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/MortalUI/Ultra_Instinct_Style
						owner.AddSkill(s)
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			passives = list("KiControlMastery"=2)
			anger = 0.3
			strength = 0.25
			force = 0.25
			defense = 0.75
			offense = 0.75
			endurance = 0.25
			recovery = 0.3
			speed = 0.75
			postAscension(mob/owner)
				..()
				if(owner.CelestialAscension=="Angel")
					if(!locate(/obj/Skills/Buffs/NuStyle/MortalUI/Perfected_Ultra_Instinct_Style, owner))
						var/obj/Skills/Buffs/NuStyle/s=new/obj/Skills/Buffs/NuStyle/MortalUI/Perfected_Ultra_Instinct_Style
						owner.AddSkill(s)
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			passives = list("SpiritPower" = 1)

			postAscension(mob/owner)
				..()
				owner.Class = "Transcendent"