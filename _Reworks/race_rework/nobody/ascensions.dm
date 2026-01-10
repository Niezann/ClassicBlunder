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
							passives = list("SwordAscension" = 1, "GodSpeed"=0.5)
						if("Dragon")
							endurance=0.25
							force=0.25
							offense=0.25
							defense=0.25
							passives = list("MovementMastery" = 2, "QuickCast"=0.5,"TechniqueMastery" = 1)
						if("Berserker")
							strength=0.25
							endurance=0.5
							passives = list("ManaCapMult" = 0.25)
						if("Imaginary")
							force=0.25
							strength=0.25
							offense=0.25
							speed=0.25
				..()
		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			onAscension(mob/owner)
				// if(!applied)
				// 	switch(owner.Class)
				// 		if("Samurai")
				// 		if("Dragon")
				// 		if("Berserker")
				// 		if("Imaginary")
				// ..()
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			onAscension(mob/owner)
				// if(!applied)
				// 	switch(owner.Class)
				// 		if("Samurai")
				// 		if("Dragon")
				// 		if("Berserker")
				// 		if("Imaginary")
				// ..()
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			onAscension(mob/owner)
				// if(!applied)
				// 	switch(owner.Class)
				// 		if("Samurai")
				// 		if("Dragon")
				// 		if("Berserker")
				// 		if("Imaginary")
				// ..()
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			onAscension(mob/owner)
				// if(!applied)
				// 	switch(owner.Class)
				// 		if("Samurai")
				// 		if("Dragon")
				// 		if("Berserker")
				// 		if("Imaginary")
				// ..()
		six
			unlock_potential = ASCENSION_SIX_POTENTIAL
			onAscension(mob/owner)
				// if(!applied)
				// 	switch(owner.Class)
				// 		if("Samurai")
				// 		if("Dragon")
				// 		if("Berserker")
				// 		if("Imaginary")
				// ..()