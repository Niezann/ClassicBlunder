ascension
	nobody
		one
			unlock_potential = ASCENSION_ONE_POTENTIAL
			onAscension(mob/owner)
				var/type = owner.NobodyOriginType
				var/SMod = 1
				if(!applied)
					switch(type)
						if("Pride")
							owner.race.transformations.Add(new/transformation/nobody/void_super_saiyan())
						if("Spirit")
							owner.race.transformations.Add(new/transformation/nobody/spectral_tension())
						if("Simple")
							SMod = 2.5
					switch(owner.Class)
						if("Samurai")
							speed=0.5 * SMod
							strength=1 * SMod
							endurance=0.5 * SMod
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.5 * SMod
							force=0.5 * SMod
							offense=0.5 * SMod
							defense=0.5 * SMod
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5 * SMod
							endurance=1 * SMod
							passives = list("ManaCapMult" = 0.25, "Brutalize"= 1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5 * SMod
							strength=0.5 * SMod
							offense=0.5 * SMod
							speed=0.5 * SMod
				..()
		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			onAscension(mob/owner)
				var/type = owner.NobodyOriginType
				var/SMod = 1
				if(!applied)
					switch(type)
						if("Pride")
							//
						if("Spirit")
							//
						if("Simple")
							SMod = 2.5
					switch(owner.Class)
						if("Samurai")
							speed=0.5 * SMod
							strength=1 * SMod
							endurance=0.5 * SMod
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.5 * SMod
							force=0.5 * SMod
							offense=0.5 * SMod
							defense=0.5 * SMod
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5 * SMod
							endurance=1 * SMod
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5 * SMod
							strength=0.5 * SMod
							offense=0.5 * SMod
							speed=0.5 * SMod
				..()
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			onAscension(mob/owner)
				var/type = owner.NobodyOriginType
				var/SMod = 1
				if(!applied)
					switch(type)
						if("Pride")
							//
						if("Spirit")
							//
						if("Simple")
							SMod = 2.5
					switch(owner.Class)
						if("Samurai")
							speed=0.5 * SMod
							strength=1 * SMod
							endurance=0.5 * SMod
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Steady" = 1, "Persistence"=1)
						if("Dragon")
							endurance=0.5 * SMod
							force=0.5 * SMod
							offense=0.5 * SMod
							defense=0.5 * SMod
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5 * SMod
							endurance=1 * SMod
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5 * SMod
							strength=0.5 * SMod
							offense=0.5 * SMod
							speed=0.5 * SMod
				..()
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			onAscension(mob/owner)
				var/type = owner.NobodyOriginType
				var/SMod = 1
				if(!applied)
					switch(type)
						if("Pride")
							//
						if("Spirit")
							//
						if("Simple")
							SMod = 2.5
					switch(owner.Class)
						if("Samurai")
							speed=0.5 * SMod
							strength=1 * SMod
							endurance=0.5 * SMod
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Steady" = 1, "Persistence"=1)
						if("Dragon")
							endurance=0.5 * SMod
							force=0.5 * SMod
							offense=0.5 * SMod
							defense=0.5 * SMod
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5 * SMod
							endurance=1 * SMod
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5,  "Unstoppable" = 1)
						if("Imaginary")
							force=0.5 * SMod
							strength=0.5 * SMod
							offense=0.5 * SMod
							speed=0.5 * SMod
				..()
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			onAscension(mob/owner)
				var/type = owner.NobodyOriginType
				var/SMod = 1
				if(!applied)
					switch(type)
						if("Pride")
							//
						if("Spirit")
							//
						if("Simple")
							SMod = 2.5
					switch(owner.Class)
						if("Samurai")
							speed=0.5 * SMod
							strength=1 * SMod
							endurance=0.5 * SMod
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=0.5 * SMod
							force=0.5 * SMod
							offense=0.5 * SMod
							defense=0.5 * SMod
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=0.5 * SMod
							endurance=1 * SMod
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "PridefulRage"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=0.5 * SMod
							strength=0.5 * SMod
							offense=0.5 * SMod
							speed=0.5 * SMod
				..()
		six
			unlock_potential = ASCENSION_SIX_POTENTIAL
			onAscension(mob/owner)
				var/type = owner.NobodyOriginType
				var/SMod = 1
				if(!applied)
					switch(type)
						if("Pride")
							//
						if("Spirit")
							//
						if("Simple")
							SMod = 2.5
					switch(owner.Class)
						if("Samurai")
							speed=1 * SMod
							strength=1 * SMod
							endurance=1 * SMod
							passives = list("SwordAscension" = 1, "GodSpeed"=1, "PureDamage"=1, "Persistence"=1)
						if("Dragon")
							endurance=1 * SMod
							force=1 * SMod
							offense=1 * SMod
							defense=1 * SMod
							passives = list("MovementMastery" = 2, "QuickCast"=1,"TechniqueMastery" = 1, "ManaStats"=1)
						if("Berserker")
							strength=1 * SMod
							endurance=1 * SMod
							passives = list("ManaCapMult" = 0.25, "Brutalize"=1, "Juggernaut" = 0.5)
						if("Imaginary")
							force=1 * SMod
							strength=1 * SMod
							offense=1 * SMod
							speed=1 * SMod
				..()
