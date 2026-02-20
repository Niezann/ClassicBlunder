transformation
	namekian
		Potential_Unleashed
			form_aura_icon = 'AurasBig.dmi'
			form_aura_icon_state = "Heran"
			form_aura_x = -32
			form_glow_icon = 'Ripple Radiance.dmi'
			form_glow_x = -32
			form_glow_y = -32
			passives = list("Instinct" = 2, "Flow" = 2, "Flicker" = 2, "Pursuer" = 3,  "PureDamage" = 2, "PureReduction" = 2)
			speedadd = 0.2
			enduranceadd = 0.2
			offenseadd = 0.2
			defenseadd = 0.2
			strengthadd = 0.2
			forceadd = 0.2
			mastery_boons(mob/user)
				user.transUnlocked=2
				if(user.Potential>=20)
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/SuperNamekian, user))
						user.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/SuperNamekian)
						user << "You have ascended past the limits of a normal Namekian, unlocking Super Namekian!"
		Orange_Namekian//you can thank piccolo for this one, I'm very sorry. LMFAO.
			transform(mob/user, forceTrans)
				if(is_active) return
				if(!user) return
				if(user.Potential<45)
					if(user.Health>=(20+user.Potential/4)) return
				passives = list("Instinct" = round(max(user.AscensionsAcquired/3, 1)), "Flow" = round(max(user.AscensionsAcquired/3, 1)), "Flicker" = round(max(user.AscensionsAcquired, 2)), "Pursuer" = round(max(user.AscensionsAcquired/3, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)), "PureDamage" = round(max(user.AscensionsAcquired/2, 1)), "PureReduction" = round(max(user.AscensionsAcquired/2, 1)))
				speed = 1.2
				offense = 1.15
				defense = 1.15
				..()
			mastery_boons(mob/user)
				switch(mastery)
					if(0 to 24)
						passives = list("Instinct" = round(max(user.AscensionsAcquired/3, 1)), "Flow" = round(max(user.AscensionsAcquired/3, 1)), "Flicker" = round(max(user.AscensionsAcquired, 2)), \
						"Pursuer" = round(max(user.AscensionsAcquired/3, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)),\
						"PureDamage" = round(max(user.AscensionsAcquired/2, 1)), "PureReduction" = round(max(user.AscensionsAcquired/2, 1)))
						speed = 1.3
						offense = 1.2
						defense = 1.2
						strength = 1.2
						force = 1.2
						endurance = 1.2
					if(25 to 49)
						passives = list("Instinct" = round(max(user.AscensionsAcquired/2, 1)), "Flow" = round(max(user.AscensionsAcquired/2, 1)), "Flicker" = round(max(user.AscensionsAcquired, 2)), \
						"Pursuer" = round(max(user.AscensionsAcquired/2, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)),\
						"PureDamage" = round(max(user.AscensionsAcquired/1.5, 1)), "PureReduction" = round(max(user.AscensionsAcquired/1.5, 1)))
						speed = 1.4
						offense = 1.3
						defense = 1.3
						strength = 1.25
						force = 1.25
						endurance = 1.25
					if(50 to 74)
						passives = list("Instinct" = round(max(user.AscensionsAcquired/1.5, 1)), "Flow" = round(max(user.AscensionsAcquired/1.5, 1)), "Flicker" = round(max(user.AscensionsAcquired*1.1, 2)), \
						"Pursuer" = round(max(user.AscensionsAcquired/1.5, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)),\
						"PureDamage" = round(max(user.AscensionsAcquired/1.5, 1)), "PureReduction" = round(max(user.AscensionsAcquired/1.5, 1)),  "MovementMastery" = round(max(user.AscensionsAcquired, 1)))

						speed = 1.5
						offense = 1.3
						defense = 1.3
						strength = 1.3
						force = 1.3
						endurance = 1.3
					if(75 to 99)
						passives = list("Instinct" = round(max(user.AscensionsAcquired, 1)), "Flow" = round(max(user.AscensionsAcquired, 1)), "Flicker" = round(max(user.AscensionsAcquired*1.1, 2)), \
						"Pursuer" = round(max(user.AscensionsAcquired, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)),\
						"PureDamage" = round(max(user.AscensionsAcquired, 1)), "PureReduction" = round(max(user.AscensionsAcquired, 1)),  "MovementMastery" = round(max(user.AscensionsAcquired*1.25, 1)))
						speed = 1.5
						offense = 1.4
						defense = 1.4
						strength = 1.4
						force = 1.4
						endurance = 1.4

					if(100)
						if(user.Potential<60)
							passives = list("Instinct" = round(max(user.AscensionsAcquired, 1)), "Flow" = round(max(user.AscensionsAcquired, 1)), "Flicker" = round(max(user.AscensionsAcquired*1.5, 2)), \
							"Pursuer" = round(max(user.AscensionsAcquired, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)),\
							"PureDamage" = round(max(user.AscensionsAcquired, 1)), "PureReduction" = round(max(user.AscensionsAcquired, 1)),  "MovementMastery" = round(max(user.AscensionsAcquired*1.5, 1)))
						else
							passives = list("Instinct" = round(max(user.AscensionsAcquired, 1)), "Flow" = round(max(user.AscensionsAcquired, 1)), "Flicker" = round(max(user.AscensionsAcquired*1.5, 2)), \
							"Pursuer" = round(max(user.AscensionsAcquired, 1)),  "BuffMastery" = round(max(user.AscensionsAcquired*1.25, 1)),\
							"PureDamage" = round(max(user.AscensionsAcquired, 1)), "PureReduction" = round(max(user.AscensionsAcquired, 1)),  "MovementMastery" = round(max(user.AscensionsAcquired*1.5, 1)), "Orange Namekian"=1)
						speed = 1.5
						offense = 1.5
						defense = 1.5
						strength = 1.5
						force = 1.5
						endurance = 1.5
		//	autoAnger = 1
			form_aura_icon = 'AurasBig.dmi'
			form_aura_icon_state = "Heran"
			form_aura_x = -32
			form_glow_icon = 'Ripple Radiance.dmi'
			form_glow_x = -32
			form_glow_y = -32
			unlock_potential = ASCENSION_FIVE_POTENTIAL

			adjust_transformation_visuals(mob/user)
				if(!form_hair_icon&&user.Hair_Base)
					var/icon/x=new(user.Hair_Base)
					if(x)
						x.MapColors(0.2,0.2,0.2, 0.39,0.39,0.39, 0.07,0.07,0.07, 0.69,0.69,0)
					form_hair_icon = x
					form_icon_2_icon = x
				..()
				form_glow.blend_mode=BLEND_ADD
				form_glow.alpha=40
				form_glow.color=list(1,0,0, 0,0.8,0, 0,0,0, 0.2,0.2,0.2)
				form_icon_2.blend_mode=BLEND_MULTIPLY
				form_icon_2.alpha=125
				form_icon_2.color=list(1,0,0, 0,0.82,0, 0,0,0, -0.26,-0.26,-0.26)

			transform_animation(mob/user)
				if(first_time)
					DarknessFlash(user)
					sleep()
					LightningStrike2(user, Offset=4)
					user.Quake(10)
					sleep(20)
					LightningStrike2(user, Offset=4)
					user.Quake(20)
					sleep(30)
					LightningStrike2(user, Offset=4)
					user.Quake(30)
					user.Quake(50)
					spawn(1)
						LightningStrike2(user, Offset=2)
					spawn(3)
						LightningStrike2(user, Offset=2)
					spawn(5)
						LightningStrike2(user, Offset=2)
				else
					switch(mastery)
						if(50 to 99)
							user.Quake(10)

						if(25 to 49)
							sleep()
							user.Quake(10)
							user.Quake(20)

						if(0 to 24)
							sleep()
							user.Quake(10)
							sleep(20)
							user.Quake(20)
							sleep(30)
							user.Quake(30)

				animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=5)
				spawn(5)
					animate(user, color = null, time=5)
				sleep(2)
