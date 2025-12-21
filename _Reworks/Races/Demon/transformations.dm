transformation
	demon
		devil_trigger
			passives = list("HellRisen" = 0.25, "DemonicDurability" = 2, "PureDamage" = 1, "PureReduction" = 1, "Brutalize" = 2)
			autoAnger = 1
			unlock_potential = 80
			form_aura_icon = 'Amazing Super Demon Aura.dmi'
			form_aura_x = -32
			transformation_message = "usrName pulls their Devil Trigger."
			mastery_boons(mob/user)
				if(mastery >= 25)
					passives = list("GodKi" = 0.25, "HellRisen" = 0.5, "DemonicDurability" = 4, "Brutalize" = 4, "PureDamage" = 3, "PureReduction" = 3)
				if(mastery >= 50)
					passives = list("GodKi" = 0.5, "HellRisen" = 0.75, "DemonicDurability" = 6, "Brutalize" = 5, "PureDamage" = 5, "PureReduction" = 5, "MovementMastery" = 3)
				if(mastery >= 75)
					passives = list("GodKi" = 0.75, "HellRisen" = 0.75, "DemonicDurability" = 6, "Brutalize" = 6, "PureDamage" = 6, "PureReduction" = 6, "MovementMastery" = 6, "TechniqueMastery" = 3, "Steady" = 3)
				if(mastery >= 100)
					passives = list("GodKi" = 1, "HellRisen" = 1, "DemonicDurability" = 6, "Brutalize" = 6, "PureDamage" = 6, "PureReduction" = 6, "MovementMastery" = 6, "TechniqueMastery" = 6, "Steady" = 6, "ManaStats" = 6)
			transform_animation(mob/user)
				var/ShockSize=5
				for(var/wav=5, wav>0, wav--)
					KenShockwave(user, icon='KenShockwaveBloodlust.dmi', Size=ShockSize, Blend=2, Time=8)
					ShockSize/=2
