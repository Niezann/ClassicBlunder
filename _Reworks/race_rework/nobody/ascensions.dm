ascension
	nobody
		one
			unlock_potential = ASCENSION_ONE_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.25
							strength=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=0.5, "Persistence"=1)
						if("Dragon")
							endurance=0.25
							force=0.25
							offense=0.25
							defense=0.25
							passives = list("MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1, "ManaStats"=0.5)
						if("Berserker")
							strength=0.25
							endurance=0.5
							passives = list("ManaCapMult" = 0.25, "Brutalize"= 0.5, "Juggernaut" = 0.25)
						if("Imaginary")
							force=0.25
							strength=0.25
							offense=0.25
							speed=0.25
				..()
		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.25
							strength=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=0.5, "PureDamage"=0.5, "Persistence"=1)
						if("Dragon")
							endurance=0.25
							force=0.25
							offense=0.25
							defense=0.25
							passives = list("MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1, "ManaStats"=0.5)
						if("Berserker")
							strength=0.25
							endurance=0.5
							passives = list("ManaCapMult" = 0.25, "Brutalize"=0.5, "Juggernaut" = 0.25)
						if("Imaginary")
							force=0.25
							strength=0.25
							offense=0.25
							speed=0.25
				..()
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.25
							strength=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=0.5, "Steady" = 1, "Persistence"=1)
						if("Dragon")
							endurance=0.25
							force=0.25
							offense=0.25
							defense=0.25
							passives = list("MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.25
							endurance=0.5
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.25, "Unstoppable" = 1)
						if("Imaginary")
							force=0.25
							strength=0.25
							offense=0.25
							speed=0.25
				..()
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.25
							strength=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=0.5, "PureDamage"=1, "Steady" = 1, "Persistence"=1)
						if("Dragon")
							endurance=0.25
							force=0.25
							offense=0.25
							defense=0.25
							passives = list("MovingCharge" = 1, "MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.25
							endurance=0.5
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.25)
						if("Imaginary")
							force=0.25
							strength=0.25
							offense=0.25
							speed=0.25
				..()
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=0.25
							strength=0.5
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.25
							force=0.25
							offense=0.25
							defense=0.25
							passives = list("MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.25
							endurance=0.5
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "PridefulRage"=1, "Juggernaut" = 0.25)
						if("Imaginary")
							force=0.25
							strength=0.25
							offense=0.25
							speed=0.25
				..()
		six
			unlock_potential = ASCENSION_SIX_POTENTIAL
			onAscension(mob/owner)
				if(!applied)
					switch(owner.Class)
						if("Samurai")
							speed=1
							strength=1
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=1
							force=1
							offense=1
							defense=1
							passives = list("MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=1
							endurance=1
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.25)
						if("Imaginary")
							force=1
							strength=1
							offense=1
							speed=1
				..()