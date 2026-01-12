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

				usr.appearance_flags+=16
				animate(usr, color = list(1,0,0, 0,1,0, 0,0,1, 0.9,1,1), time=5)
				usr.icon_state=""
				var/image/GG=image('SSBGlow.dmi',pixel_x=-32, pixel_y=-32)
				GG.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
				GG.blend_mode=BLEND_ADD
				GG.color=list(1,0,0, 0,1,0, 0,0,1, 0,0,0)
				GG.alpha=110
				sleep(5)
				usr.filters+=filter(type = "blur", size = 0)
				animate(usr, color=list(-1.2,-1.2,-1, 1,1,1, -1.4,-1.4,-1.2,  1,1,1), time=3, flags=ANIMATION_END_NOW)
				animate(usr.filters[usr.filters.len], size = 0.35, time = 3)
				usr.overlays+=GG
				spawn()DarknessFlash(usr, SetTime=60)
				sleep()
				var/image/GO=image('GodOrb.dmi',pixel_x=-16,pixel_y=-16, loc = usr, layer=MOB_LAYER+0.5)
				GO.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
				GO.filters+=filter(type = "drop_shadow", x=0, y=0, color=rgb(255, 128, 128, 44), size = 3)
				animate(GO, alpha=0, transform=matrix(), color=rgb(0, 255, 0, 134))
				world << GO
				animate(GO, alpha=210, time=1)
				sleep(1)
				animate(GO, transform=matrix()*3, time=60, easing=BOUNCE_EASING | EASE_IN | EASE_OUT, flags=ANIMATION_END_NOW)
				usr.Quake(20)
				sleep(20)
				usr.Quake(40)
				sleep(20)
				usr.Quake(60)
				sleep(20)

				sleep(10)
				usr.filters-=filter(type = "blur", ,size = 0.35)
				animate(usr, color=list(0,0,0, 0,0,0, 0,0,0, 0.5,0.95,1), time=5, easing=QUAD_EASING)
				sleep(5)
				animate(usr, color=null, time=20, easing=CUBIC_EASING)
				sleep(20)
				animate(GO, alpha=0, time=5)
				spawn(5)
					usr.overlays-=GG
					GO.filters=null
					del GO
					usr.appearance_flags-=16