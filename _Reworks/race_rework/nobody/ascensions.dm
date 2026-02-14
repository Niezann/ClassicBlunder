ascension
	nobody
		one
			unlock_potential = ASCENSION_ONE_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.5
							strength=1
							endurance=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.5
							force=0.5
							offense=0.5
							defense=0.5
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"= 1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5
							strength=0.5
							offense=0.5
							speed=0.5
				..()
		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.5
							strength=1
							endurance=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.5
							force=0.5
							offense=0.5
							defense=0.5
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5
							strength=0.5
							offense=0.5
							speed=0.5
				..()
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.5
							strength=1
							endurance=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Steady" = 1, "Persistence"=1)
						if("Dragon")
							endurance=0.5
							force=0.5
							offense=0.5
							defense=0.5
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5
							strength=0.5
							offense=0.5
							speed=0.5
				..()
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.5
							strength=1
							endurance=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Steady" = 1, "Persistence"=1)
						if("Dragon")
							endurance=0.5
							force=0.5
							offense=0.5
							defense=0.5
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5,  "Unstoppable" = 1)
						if("Imaginary")
							force=0.5
							strength=0.5
							offense=0.5
							speed=0.5
				..()
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.5
							strength=1
							endurance=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.5
							force=0.5
							offense=0.5
							defense=0.5
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "PridefulRage"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5
							strength=0.5
							offense=0.5
							speed=0.5
				..()
		six
			unlock_potential = ASCENSION_SIX_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=1
							strength=1
							endurance=1
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=1
							force=1
							offense=1
							defense=1
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=1
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=1
							strength=1
							offense=1
							speed=1
				..()
