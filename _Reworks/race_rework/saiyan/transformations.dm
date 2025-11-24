transformation
	saiyan
		var/tier = 0
		super_saiyan
			tier = 1
			form_aura_icon = 'AurasBig.dmi'
			form_aura_icon_state = "SSJ"
			form_aura_x = -32
			form_icon_1_icon = 'SS2Sparks.dmi'
			form_glow_icon = 'Ripple Radiance.dmi'
			form_glow_x = -32
			form_glow_y = -32
			unlock_potential = 40
			passives = list("Instinct" = 1, "Flow" = 1, "Flicker" = 1, "Pursuer" = 2,  "BuffMastery" = 3, "PureDamage" = 1, "PureReduction" = 1)
			angerPoint = 75

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

			mastery_boons(mob/user)
				if(mastery >= 50)
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade2, user)&&user.isRace(SAIYAN))
						user.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade2)
						user << "You can draw out greater power from your mastery over super Saiyan - Grade 2 unlocked!"
				if(mastery >= 75)
					if(!locate(/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade3, user)&&user.isRace(SAIYAN))
						user.AddSkill(new/obj/Skills/Buffs/SpecialBuffs/SuperSaiyanGrade3)
						user << "You can strain past the limits of your Super Saiyan form! Grade 3 Unlocked!"

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

		super_saiyan_2
			tier = 2
			form_aura_icon = 'AurasBig.dmi'
			form_aura_icon_state = "SSJ2"
			form_aura_x = -32
			form_icon_2_icon = 'SS2Sparks.dmi'
			unlock_potential = 55
			autoAnger = TRUE
			passives = list("Instinct" = 1, "Flow" = 1, "Flicker" = 1, "Pursuer" = 2, "BuffMastery" = 1, "PureDamage" = 1, "PureReduction" = 1)
			PUSpeedModifier = 1.5
			adjust_transformation_visuals(mob/user)
				if(user.Hair_Base && !form_hair_icon)
					var/icon/x=new(user.Hair_Base)
					if(x)
						x.Blend(rgb(160,130,0),ICON_ADD)
					form_hair_icon=x
				..()
				if(!form_icon_1)
					form_icon_1 = image(user.Hair_SSJ2)
					form_icon_1.blend_mode=BLEND_MULTIPLY
					form_icon_1.alpha=125
					form_icon_1.color=list(1,0,0, 0,0.82,0, 0,0,0, -0.26,-0.26,-0.26)

			transform_animation(mob/user)
				switch(mastery)
					if(25 to 99)
						user.Quake(10)
					if(10 to 24)
						for(var/mob/Players/T in view(18,user))
							spawn()
								T.Quake(25)
					/*	for(var/turf/T in Turf_Circle(user,3))
							spawn(4)
								new/turf/Dirt1(locate(T.x,T.y,T.z))
							spawn(4)
								Destroy(T)*/
					if(0 to 9)
						for(var/mob/Players/T in view(18,user))
							spawn()
								T.Quake(50)
					/*	for(var/turf/T in Turf_Circle(user,6))
							if(prob(1))
								sleep(0.005)
							spawn(4)
								new/turf/Dirt1(locate(T.x,T.y,T.z))
							spawn(4)
								Destroy(T)*/
				animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=5)
				spawn(5)
					animate(user, color = null, time=5)
				sleep(2)

		super_saiyan_3
			tier = 3
			form_aura_icon = 'AurasBig.dmi'
			form_aura_icon_state = "SSJ2"
			form_aura_x = -32
			form_icon_2_icon = 'SS3Sparks.dmi'
			form_hair_icon = 'Hair_SSj3.dmi'
			form_icon_1_icon = 'Hair_SSj3.dmi'
			passives = list("Flicker" = 1, "Pursuer" = 1, "BuffMastery" = 2, "PureDamage" = 1, "PureReduction" = 1)
			unlock_potential = 65

			adjust_transformation_visuals(mob/user)
				..()
				form_icon_1 = image(user.Hair_SSJ3)
				form_icon_1.blend_mode=BLEND_MULTIPLY
				form_icon_1.alpha=125
				form_icon_1.color=list(1,0,0, 0,0.82,0, 0,0,0, -0.26,-0.26,-0.26)

			transform_animation(mob/user)
				if(mastery < 50)
					user.icon_state=""
					var/image/HF=image(icon=user.race.transformations[2].form_hair, pixel_x=user.race.transformations[2].form_hair_x, pixel_y=user.race.transformations[2].form_hair_y, loc = user)
					HF.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
					HF.color=list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2)
					animate(HF, alpha=0)
					spawn()
						user.Quake(40)
					animate(HF, alpha=210, time=5)
					sleep(5)
					animate(HF, alpha=0, time=5)
					sleep(5)
					animate(HF, alpha=210, time=5)
					sleep(5)
					animate(HF, alpha=0, time=5)
					sleep(5)
					animate(HF, alpha=210, time=5)
					sleep(5)
					animate(HF, alpha=0, time=5)
					sleep(5)
					animate(HF, alpha=210, time=5)
					sleep(5)
					animate(HF, alpha=0, time=5)
					sleep(5)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					spawn()
						user.Earthquake(10,8,24,8,24,999)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					spawn()
						user.Earthquake(10,8,24,8,24,999)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					spawn()
						user.Earthquake(10,8,24,8,24,999)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					spawn()
						user.Earthquake(30,8,24,8,24,999)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					spawn()
						user.Earthquake(60,8,24,8,24,999)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					LightningStrike2(user, Offset=4)
					animate(HF, alpha=210, time=5)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					sleep(5)
					animate(HF, alpha=0, time=5)
					animate(user, color = user.MobColor, time=5)
					sleep(5)
					spawn()
						user.Earthquake(30,16,48,16,48,user.z)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					del HF
					var/ShockSize=5
					for(var/wav=5, wav>0, wav--)
						KenShockwave(user, icon='KenShockwaveGold.dmi', Size=ShockSize, Blend=2, Time=8)
						ShockSize/=2
					spawn(10)
						animate(user, color = user.MobColor, time=30)
				else
					sleep()
					user.Quake(40)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=10)
					var/ShockSize=5
					for(var/wav=5, wav>0, wav--)
						KenShockwave(user, icon='KenShockwaveGold.dmi', Size=ShockSize, Blend=2, Time=8)
						ShockSize/=2
					spawn(10)
						animate(user, color = user.MobColor, time=30)
					sleep(2)

		super_saiyan_4
			tier = 4
			unlock_potential = 80
			autoAnger = 1
			speed = 1.5
			endurance = 1.5
			offense = 1.5
			defense = 1.5
			strength = 1.3
			force = 1.3
			revertToTrans = 0
			var/previousTailIcon
			var/previousTailUnderlayIcon
			var/previousTailWrappedIcon
			var/tailIcon = 'saiyantail_ssj4.dmi'
			var/tailUnderlayIcon = 'saiyantail_ssj4_under.dmi'
			var/tailWrappedIcon = 'saiyantail-wrapped_ssj4.dmi'
			form_icon_1_icon = 'GokentoMaleBase_SSJ4.dmi'
			passives = list("GiantForm" = 1, "SweepingStrike" = 1, "Brutalize" = 3, "Meaty Paws" = 2, "KiControlMastery" = 3, "PureReduction" = 5, "LifeGeneration" = 5, "Unstoppable" = 1, "AllOutAttack" = 1, "Reversal" = 0.3)
			adjust_transformation_visuals(mob/user)
				if(user.Hair_Base && !form_hair_icon)
					var/icon/x=new(user.Hair_Base)
					form_hair_icon=x
				..()

			mastery_boons(mob/user)
				passives = list("GiantForm" = 1, "Juggernaut" = 1+(mastery/25), "BuffMastery" = 5 + (mastery/10), "SweepingStrike" = 1, "Brutalize" = 3, "Meaty Paws" = 2 + (mastery/50), "KiControlMastery" = 3 + (mastery/50), "PureReduction" = 5 + (mastery/10),\
				"LifeGeneration" = 1 + (mastery/15), "Unstoppable" = 1, "AllOutAttack" = 1, "Reversal" = 0.1 + (mastery/200), "Flow" = 4, "Instinct" = 4, "Transformation Power" = clamp(user.AscensionsAcquired * 3, 1, 20))
				speed = 1.5 + (mastery/200)
				endurance = 1.5 + (mastery/200)
				offense = 1.5 + (mastery/200)
				defense = 1.5 + (mastery/200)
				strength = 1.5 + (mastery/200)
				force = 1.5 + (mastery/200)

			transform(mob/user)
				. = ..()
				previousTailIcon = user.TailIcon
				previousTailUnderlayIcon = user.TailIconUnderlay
				previousTailWrappedIcon = user.TailIconWrapped
				user.TailIcon = tailIcon
				user.TailIconUnderlay = tailUnderlayIcon
				user.TailIconWrapped = tailWrappedIcon
				user.Tail(1)

			revert(mob/user)
				. = ..()
				if(!is_active || !user.CanRevert()) return
				user.transActive = 0
				user.TailIcon = previousTailIcon
				user.TailIconUnderlay = previousTailUnderlayIcon
				user.TailIconWrapped = previousTailWrappedIcon
				previousTailIcon = null
				previousTailUnderlayIcon = null
				previousTailWrappedIcon = null
				user.Tail(1)

			transform_animation(mob/user)
				user.Quake(40)
				user.Frozen=1
				KenShockwave2(user, icon='KenShockwaveGold.dmi', Size=10)
				for(var/turf/t in Turf_Circle(user, 18))
					if(prob(50))
						spawn(rand(2,6))
							var/icon/i = icon('RisingRocks.dmi')
							t.overlays+=i
							spawn(rand(20, 60))
								t.overlays-=i
				spawn(10)
					KenShockwave2(user, icon='KenShockwaveGold.dmi', Size=10)
				user.Frozen=0
				animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1,0.9,0.2), time=20)
				sleep(20)

				var/ShockSize = 5
				for(var/wav=5, wav>0, wav--)
					KenShockwave(user, icon='KenShockwaveGold.dmi', Size=ShockSize, Blend=2, Time=10)
					ShockSize/=2
				spawn(10)
					animate(user, color = user.MobColor, time=20)

		super_saiyan_god
			tier = 4
			passives = list("GodKi" = 0.5, "EnergyGeneration" = 1, "Godspeed" = 4, "Flow" = 4, "BackTrack" = 2, "StunningStrike" = 1, "Sunyata" = 1 )
			unlock_potential = 80
			form_aura_icon = 'SSBGlow.dmi'
			form_aura_x = -32
			form_aura_y = -32
			// at full mastery, give the saiyan beyond god buff, then remove ssjgod, and replace it with ssjgb
			mastery_boons(mob/user)
				passives = list("GodKi" = 0.5, "EnergyGeneration" = 5 * (mastery/100), "Godspeed" = 4, "Flow" = 1 + round(mastery/25, 1), \
								 "BackTrack" = round(mastery/50, 1) , "StunningStrike" = 2.5 * (mastery/100), "Sunyata" = 5 * (mastery/100))
			// in order to do first transformation, 4 saiyans need to be giving energy (this is troll, but who cares)
			adjust_transformation_visuals(mob/user)
				if(user.Hair_Base && !form_hair_icon)
					var/icon/x=new(user.Hair_Base)
					if(x)
						x.Blend(rgb(159, 27, 51),ICON_ADD)
					form_hair_icon=x
				..()
			transform_animation(mob/user)
				if(mastery < 75)
					sleep(10)
				//src.Transforming=1
					user.Frozen=2

					user.OMessage(15,"[user] is fully revitalized, as their entire body is surrounded by a gentle aura.","<font color=red>[user]([user.key]) unlocked Super Saiyan Divinity.")
					var/image/GG=image('GodGlow.dmi',pixel_x=-32,pixel_y=-32, loc = user, layer=MOB_LAYER-0.5)
					GG.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
					GG.color=list(1,0,0, 0,1,0, 0,0,1, 0.2,0.2,0.4)
					GG.filters+=filter(type = "drop_shadow", x=0, y=0, color=rgb(190, 34, 55, 37), size = 5)
					animate(GG, alpha=0, transform=matrix()*0.7)
					world << GG
					animate(GG, alpha=255, time=30, transform=matrix()*1)
					animate(user, color = list(0.45,0.6,0.75, 0.64,0.88,1, 0.16,0.21,0.27, 0,0,0), pixel_y=32, time=30)
					sleep(40)

					var/image/GO=image('GodOrb.dmi',pixel_x=-16,pixel_y=-16, loc = user, layer=EFFECTS_LAYER+0.5)
					GO.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
					GO.filters+=filter(type = "drop_shadow", x=0, y=0, color=rgb(190, 34, 55, 156), size = 3)
					animate(GO, alpha=0)
					world << GO
					animate(GO, alpha=255, time=40)
					for(var/mob/Players/T in view(31, user))
						animate(T.client, color=list(0.5,0,0, 0,0.5,0, 0,0,0.5, 0,0,0.1), time = 40)
						spawn(40)
							animate(T.client, color=null, time = 40)
					spawn(10)
						KenShockwave(user, icon='KenShockwaveDivine.dmi', PixelY=24, Size=5, Blend=2)
						animate(GO, color=list(1,0,0, 0,1,0, 0,0,1, 0.8,0.8,0.8), time=30)
					spawn(20)
						KenShockwave(user, icon='KenShockwaveDivine.dmi', PixelY=24, Size=5, Blend=2)
					spawn(30)
						KenShockwave(user, icon='KenShockwaveDivine.dmi', PixelY=24, Size=5, Blend=2)
					spawn(40)
						KenShockwave(user, icon='KenShockwaveDivine.dmi', PixelY=24, Size=5, Blend=2)
					spawn(50)
						KenShockwave(user, icon='KenShockwaveDivine.dmi', PixelY=24, Size=5, Blend=2)
					sleep(50)
					animate(user, color = null)
					sleep(30)
					user.Hairz("Add")
					GG.filters-=filter(type = "drop_shadow", x=0, y=0, color=rgb(190, 34, 55, 37), size = 5)
					GG.filters+=filter(type = "drop_shadow", x=0, y=0, color=rgb(51, 220, 243), size = 1)

					animate(GO, alpha=0, time=10)
					sleep(10)
					animate(user, pixel_y=0, time=30)
					animate(GG, alpha=0, time=50)
					spawn(50)
						GO.filters=null
						del GO
						GG.filters=null
						del GG

					user.Frozen=0
				//user.Transforming=0
				else
					KenShockwave(user, icon='SparkleOrange.dmi', Size=3, PixelX=105, PixelY=100, Blend=2)
					animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 1.5,0.9,0.1), time=5)
					spawn(5)
						spawn(50)
							if(!user.HasKiControl()&&!user.PoweringUp)
								user.Auraz("Remove")
						animate(user, color = null, time=5)

			transform(mob/user)
				if(mastery>=100)
					user.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/SaiyanBeyondGod)
					user << "You are able to use your god boons in base form (Beyond God Buff)"
					user.race.transformations-=src
					del src
				else
					..()


		super_saiyan_blue
			passives = list("GodKi" = 1, "Instinct" = 4, "Brutalize" = 1)
			unlock_potential = 80
			autoAnger = 1
			form_aura_icon = 'SSBGlow.dmi'
			form_aura_x = -32
			form_aura_y = -32
			strength = 1.3
			speed = 1.3
			offense = 1.2
			defense = 1.2
			force = 1.3
			mastery_boons(mob/user)
				passives = list("GodKi" = 0.75, "Instinct" = 4, "Brutalize" = 1.5, "Steady" = 3,  "BuffMastery" = 6, "MovementMastery" = 5, \
								"PureDamage" = 2, "PureReduction" = 1)

				if(mastery >= 100)
					// perfected
					passives = list("GodKi" = 1, "Instinct" = 4, "Brutalize" = 3, "BuffMastery" = 8, "Steady" = 6, "MovementMastery" = 10, \
									"EnergyGeneration" = 3,  "PureDamage" = 2, "PureReduction" = 2, "Godspeed" = 4, "LikeWater" = 8, \
									"BackTrack" = 1 , "StunningStrike" = 2, "Sunyata" = 3)
					if(user.race.ascensions[1].choiceSelected == /ascension/sub_ascension/saiyan/pride) // ssgsse
						passives = list("GodKi" = 1.25, "Brutalize" = 5, "BuffMastery" = 8, "MovementMastery" = 15, "EnergyLeak" = 3, \
								 	"PureDamage" = 3, "PureReduction" = 1, "Godspeed" = 4, "LikeWater" = 10, \
									"Sunyata" = 6)
						strength = 2
						speed = 2
						force = 2

			adjust_transformation_visuals(mob/user)
				if(!form_hair_icon&&user.Hair_Base)
					var/icon/x=new(user.Hair_Base)
					if(x)
						x.MapColors(0.2,0.2,0.2, 0.4,0.4,0.4, 0.07,0.07,0.07, 0.25,0.64,0.89)
					form_hair_icon = x
					form_icon_2_icon = x
				..()
				if(mastery >= 100)
					form_aura_icon = null



			transform(mob/user)
				if(user.CheckSlotless("Beyond God"))
					..()
				else return 0

			transform_animation(mob/user)
				user.SlotlessBuffs["Beyond God"].Trigger(user, TRUE)
				// disable
				user.appearance_flags+=16
				animate(user, color = list(1,0,0, 0,1,0, 0,0,1, 0.9,1,1), time=5)
				user.icon_state=""
				var/image/GG=image('SSBGlow.dmi',pixel_x=-32, pixel_y=-32)
				GG.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
				GG.blend_mode=BLEND_ADD
				GG.color=list(1,0,0, 0,1,0, 0,0,1, 0,0,0)
				GG.alpha=110
				sleep(5)
				user.filters+=filter(type = "blur", size = 0)
				animate(user, color=list(-1.2,-1.2,-1, 1,1,1, -1.4,-1.4,-1.2,  1,1,1), time=3, flags=ANIMATION_END_NOW)
				animate(user.filters[user.filters.len], size = 0.35, time = 3)
				user.overlays+=GG
				spawn()DarknessFlash(user, SetTime=60)
				sleep()
				var/image/GO=image('GodOrb.dmi',pixel_x=-16,pixel_y=-16, loc = user, layer=MOB_LAYER+0.5)
				GO.appearance_flags=KEEP_APART | NO_CLIENT_COLOR | RESET_ALPHA | RESET_COLOR
				GO.filters+=filter(type = "drop_shadow", x=0, y=0, color=rgb(0, 255, 0, 44), size = 3)
				animate(GO, alpha=0, transform=matrix(), color=rgb(0, 255, 0, 134))
				world << GO
				animate(GO, alpha=210, time=1)
				sleep(1)
				animate(GO, transform=matrix()*3, time=60, easing=BOUNCE_EASING | EASE_IN | EASE_OUT, flags=ANIMATION_END_NOW)
				user.Quake(20)
				sleep(20)
				user.Quake(40)
				sleep(20)
				user.Quake(60)
				sleep(20)

				sleep(10)
				user.filters-=filter(type = "blur", ,size = 0.35)
				animate(user, color=list(0,0,0, 0,0,0, 0,0,0, 0.5,0.95,1), time=5, easing=QUAD_EASING)
				sleep(5)
				animate(user, color=null, time=20, easing=CUBIC_EASING)
				sleep(20)
				animate(GO, alpha=0, time=5)
				spawn(5)
					user.overlays-=GG
					GO.filters=null
					del GO
					user.appearance_flags-=16

			revert(mob/user)
				user.transActive = 1
				..()
			//UBuffNeeded