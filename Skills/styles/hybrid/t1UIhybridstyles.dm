obj/Skills/Buffs/NuStyle/MortalUIStyles// ~~ Angel-taught basic forms ~~  unlocked via tier progression ~~
	Mortal_Instinct_Sword
		Copyable = 0
		MakesSword = 1
		FlashDraw = 1
		BladeFisting = 1
		IconLock='AuraMysticBig.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		SwordName = "Mortal Instinct Blade"
		SwordIcon = 'Icons/Buffs/Ki-Blade.dmi'
		SwordClass = "Medium"
		passives = list("Instinct" = 1, "Flow" = 1.5, "Parry" = 1, "Deflection" = 1, "Like Water" = 1.5, "Momentum" = 1, "PUSpike" = 10,)
		StyleActive = "Sword of Awareness"
		StyleStr = 1.15
		StyleOff = 1.1
		StyleDef = 1.1
		StyleSpd = 1.2
		PUSpike = 10
		Finisher = "/obj/Skills/Queue/Finisher/Sword_of_Awareness"
		TextColor = "#b4f0ff"
		ActiveMessage = "draws a blade born of mortal awareness!"
		OffMessage = "lets their sword dissolve into light..."
		var/tmp/obj/Items/Sword/EquippedSword
		adjust(mob/p)
			if(altered) return
			if(p.AscensionsUnlocked==2)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 1.5, "Flow" = 1.5, "Parry" = 1.5, "Deflection" = 1, "Like Water" = 1.5, "Momentum" = 1, "PUSpike" = 10, "BlurringStrikes"=1.5, "Iaijutsu" = 1,)
					StyleStr = 1.25
					StyleOff = 1.25
					StyleDef = 1.25
					StyleSpd = 1.35
				if(p.isRace(CELESTIAL))
					passives = list("Deflection" = 1, "Soft Style" = 1, "Flow" = 3, "Instinct" = 1, "CounterMaster" = 1, "BlurringStrikes"=1.5, "Iaijutsu" = 0.5)
					StyleStr = 1.35
					StyleSpd=1.4
					StyleOff=1.15
					StyleDef=1.25
			if(p.AscensionsUnlocked==3)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 2, "Flow" = 2.5, "Parry" = 1.5, "Deflection" = 1, "Like Water" = 2.5, "Momentum" = 1, "PUSpike" = 10, "BlurringStrikes"=2, "Iaijutsu" = 1.5,)
					StyleStr = 1.35
					StyleOff = 1.35
					StyleDef = 1.35
					StyleSpd = 1.5
				if(p.isRace(CELESTIAL))
					passives = list("Deflection" = 1, "Soft Style" = 1, "Flow" = 3, "Instinct" = 1, "CounterMaster" = 1, "BlurringStrikes"=1.5, "Iaijutsu" = 0.5)
					StyleStr = 1.4
					StyleSpd=1.5
					StyleOff=1.15
					StyleDef=1.25
		verb/Attune_Mortal_Blade()
			set category = "Utility"
			if(!usr.BuffOn(src))
				var/classChoice = input(usr, "Choose your preferred sword type.") in list("Light", "Medium", "Heavy")
				SwordClass = classChoice
				var/changeIcon = alert(usr, "Would you like to customize your sword icon?", "Instinct Blade", "Yes", "No")
				if(changeIcon == "Yes")
					SwordIcon = input(usr, "Select an icon for your Instinct Blade.") as icon|null
					src.SwordX = input(usr, "Pixel X offset.") as num
					src.SwordY = input(usr, "Pixel Y offset.") as num
				usr << "Your awareness favors a [SwordClass]-class weapon."
			else
				usr << "You cannot attune your blade while Mortal Instinct Sword is active."
		verb/Mortal_Instinct_Sword()
			set hidden = 1
			adjust(usr)
			src.Trigger(usr)
		Trigger(mob/User)
			if(!EquippedSword)
				var/obj/Items/Sword/newSword
				switch(SwordClass)
					if("Light") newSword = new /obj/Items/Sword/Light
					if("Medium") newSword = new /obj/Items/Sword/Medium
					if("Heavy") newSword = new /obj/Items/Sword/Heavy
					else newSword = new /obj/Items/Sword/Medium
				newSword.icon = SwordIcon
				newSword.pixel_x = SwordX
				newSword.pixel_y = SwordY
				newSword.name = SwordName
				newSword.Unobtainable = 1
				newSword.suffix = "*Equipped*"
				newSword.desc = "A sword forged from pure instinct and divine flow."
				if("Destructable" in newSword.vars) newSword.vars["Destructable"] = 0
				if("ShatterCounter" in newSword.vars) newSword.vars["ShatterCounter"] = 999999
				if("ShatterMax" in newSword.vars) newSword.vars["ShatterMax"] = 999999
				if("SpiritSword" in newSword.vars) newSword.vars["SpiritSword"] = 0.5
				if("SwordAscension" in newSword.vars) newSword.vars["SwordAscension"] = 2
				if("MagicSword" in newSword.vars) newSword.vars["MagicSword"] = 1
				if("Unbreakable" in newSword.vars) newSword.vars["Unbreakable"] = 1
				newSword.Move(User)
				EquippedSword = newSword
				User << "Your [SwordName] manifests as a [SwordClass]-class weapon."
			else
				MiSwordOff(User)
			..()
		proc/MiSwordOff(mob/User)
			if(!User || !EquippedSword) return
			if(OffMessage && TextColor)
				view(User, 10) << "<span style='color:[TextColor]'>[User] [OffMessage]</span>"
			EquippedSword.suffix = null
			var/placement = FLOAT_LAYER - 3
			if(EquippedSword.LayerPriority)
				placement -= EquippedSword.LayerPriority
			if(EquippedSword.EquipIcon)
				var/image/equipImg = image(icon = EquippedSword.EquipIcon, pixel_x = EquippedSword.pixel_x, pixel_y = EquippedSword.pixel_y, layer = placement)
				User.overlays -= equipImg
			else
				var/image/swordImg = image(icon = EquippedSword.icon, pixel_x = EquippedSword.pixel_x, pixel_y = EquippedSword.pixel_y, layer = placement)
				User.overlays -= swordImg
			for(var/obj/Items/Sword/S in User)
				if(S.name == SwordName)
					del(S)
			EquippedSword = null
			User.equippedSword = null

	Mortal_Instinct_Grappling
		Copyable = 0
		NeedsSword = 0
		NoSword = 1
		BladeFisting = 1
		IconLock='AuraMysticBig.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		passives = list("Instinct" = 1, "LikeWater" = 1.5, "Muscle Power" = 2, "Grippy" = 2, "Scoop" = 1, "Iron Grip" = 1, "Momentum" = 1, "Flow" = 1.5, "Deflection" = 0.5, "Reversal" = 0.5)
		StyleActive = "Instinctual Grappling"
		StyleStr = 1.15
		StyleEnd = 1.1
		StyleDef = 1.1
		StyleSpd = 1.15
		StyleOff = 1.1
		Finisher = "/obj/Skills/Queue/Finisher/Instinct_Grapple"
		adjust(mob/p)
			if(p.AscensionsUnlocked==2)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 1, "LikeWater" = 1.5, "Muscle Power" = 2.5, "Grippy" = 2.5, "Scoop" = 2, "Iron Grip" = 2, "Momentum" = 1.5, "Flow" = 1.5, "Deflection" = 0.5, "Reversal" = 0.5)
					StyleStr = 1.35
					StyleEnd = 1.2
					StyleDef = 1.1
					StyleSpd = 1.2
					StyleOff = 1.15
				if(p.isRace(CELESTIAL))
					passives = list("Instinct" = 1, "LikeWater" = 1.5, "Muscle Power" = 2, "Grippy" = 2.5, "Scoop" = 1.5, "Iron Grip" = 2.5, "Momentum" = 1.5, "Flow" = 1.5, "Deflection" = 0.5, "Reversal" = 0.75)
					StyleStr = 1.35
					StyleEnd = 1.2
					StyleDef = 1.15
					StyleSpd = 1.15
					StyleOff = 1.2
			if(p.AscensionsUnlocked==3)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 1, "LikeWater" = 1.5, "Muscle Power" = 3.5, "Grippy" = 3, "Scoop" = 2.5, "Iron Grip" = 2, "Momentum" = 2, "Flow" = 1.5, "Deflection" = 0.5, "Reversal" = 1)
					StyleStr = 1.45
					StyleEnd = 1.3
					StyleDef = 1.1
					StyleSpd = 1.2
					StyleOff = 1.15
				if(p.isRace(CELESTIAL))
					passives = list("Instinct" = 1, "LikeWater" = 1.5, "Muscle Power" = 3, "Grippy" = 2.5, "Scoop" = 2, "Iron Grip" = 2.5, "Momentum" = 2.5, "Flow" = 1.5, "Deflection" = 0.5, "Reversal" = 1.5)
					StyleStr = 1.4
					StyleEnd = 1.35
					StyleDef = 1.15
					StyleSpd = 1.15
					StyleOff = 1.25
		verb/Mortal_Instinct_Grappling()
			set hidden = 1
			adjust(usr)
			src.Trigger(usr)

	Mortal_Instinct_Mystic
		Copyable = 0
		NeedsSword = 0
		NoSword = 1
		BladeFisting = 1
		IconLock='AuraMysticBig.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		passives = list("Instinct" = 1.5, "SpiritFlow" = 2, "LikeWater" = 1.5, "Amplify" = 1, "Flow" = 1.5, "AirBend" = 1, "WaveDancer" = 1, "Rain" = 1, "Burning" = 1, "Freezing" = 1,\
                        "Shocking" = 1, "Shattering" = 1, "MartialMagic" = 1,"PUSpike" = 15)
		StyleActive = "Aetherial Spark"
		StyleFor = 1.15
		StyleOff = 1.1
		StyleDef = 1.1
		StyleSpd = 1.15
		StyleEnd = 1.1
		PUSpike = 15
		Finisher = "/obj/Skills/Queue/Finisher/Dancing_Prism"
		ElementalClass = "Mirror"
		ElementalOffense = "Mirror"
		ElementalDefense = "Mirror"
		adjust(mob/p)
			if(p.AscensionsUnlocked==2)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 1.5, "SpiritFlow" = 2, "LikeWater" = 2, "Amplify" = 1, "Flow" = 2, "AirBend" = 1, "WaveDancer" = 1, "Rain" = 1, "Burning" = 1, "Freezing" = 1,\
			                        "Shocking" = 1, "Shattering" = 1, "MartialMagic" = 1,"PUSpike" = 15)
					StyleFor = 1.35
					StyleOff = 1.15
					StyleDef = 1.15
					StyleSpd = 1.25
					StyleEnd = 1.1
				if(p.isRace(CELESTIAL))
					passives = list("Instinct" = 2, "SpiritFlow" = 2, "LikeWater" = 1.5, "Amplify" = 1, "Flow" = 2, "AirBend" = 1, "WaveDancer" = 1, "Rain" = 1, "Burning" = 1, "Freezing" = 1,\
			                        "Shocking" = 1, "Shattering" = 1, "MartialMagic" = 1,"PUSpike" = 15)
					StyleFor = 1.35
					StyleOff = 1.15
					StyleDef = 1.15
					StyleSpd = 1.25
					StyleEnd = 1.1
			if(p.AscensionsUnlocked==3)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 2.5, "SpiritFlow" = 2, "LikeWater" = 3, "Amplify" = 1, "Flow" = 1.5, "AirBend" = 1, "WaveDancer" = 1, "Rain" = 1, "Burning" = 1, "Freezing" = 1,\
			                        "Shocking" = 1, "Shattering" = 1, "MartialMagic" = 1,"PUSpike" = 15)
					StyleFor = 1.4
					StyleOff = 1.15
					StyleDef = 1.15
					StyleSpd = 1.5
					StyleEnd = 1.1
				if(p.isRace(CELESTIAL))
					passives = list("Instinct" = 3.5, "SpiritFlow" = 2, "LikeWater" = 3, "Amplify" = 1, "Flow" = 1.5, "AirBend" = 1, "WaveDancer" = 1, "Rain" = 1, "Burning" = 1, "Freezing" = 1,\
			                        "Shocking" = 1, "Shattering" = 1, "MartialMagic" = 1,"PUSpike" = 15)
					StyleFor = 1.35
					StyleOff = 1.15
					StyleDef = 1.15
					StyleSpd = 1.5
					StyleEnd = 1.1
		verb/Mortal_Instinct_Mystic()
			set hidden = 1
			adjust(usr)
			src.Trigger(usr)

	Mortal_Instinct_Martial
		Copyable = 0
		NeedsSword = 0
		NoSword = 1
		BladeFisting = 1
		IconLock='AuraMysticBig.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		StyleActive = "Instinctive Palm"
		passives = list("Instinct" = 1.5, "LikeWater" = 1.5, "Momentum" = 1, "Flow" = 1.5, "Pressure" = 1, "Deflection" = 0.5, "CounterMaster" = 0.5, "Interception" = 0.5, "Reversal" = 0.5)
		StyleStr = 1.15
		StyleSpd = 1.15
		StyleOff = 1.1
		StyleDef = 1.1
		StyleEnd = 1.1
		StyleFor = 1.05
		Finisher = "/obj/Skills/Queue/Finisher/Instinct_Palm"
		adjust(mob/p)
			if(p.AscensionsUnlocked==3)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 2, "LikeWater" = 2, "Momentum" = 1.5, "Flow" = 2.5, "Pressure" = 1, "Deflection" = 1.25, "CounterMaster" = 0.75, "Interception" = 1.5, "Reversal" = 0.75)
					StyleStr = 1.25
					StyleSpd = 1.25
					StyleOff = 1.15
					StyleDef = 1.15
					StyleEnd = 1.15
					StyleFor = 1.1
				if(p.isRace(CELESTIAL))
					passives = list("Instinct" = 2.5, "LikeWater" = 2, "Momentum" = 1.5, "Flow" = 2, "Pressure" = 1, "Deflection" = 0.75, "CounterMaster" = 1.25, "Interception" = 0.75, "Reversal" = 1.5)
					StyleStr = 1.25
					StyleSpd = 1.25
					StyleOff = 1.15
					StyleDef = 1.15
					StyleEnd = 1.15
					StyleFor = 1.1
			if(p.AscensionsUnlocked==3)
				if(p.isRace(ANGEL))
					passives = list("Instinct" = 3, "LikeWater" = 2, "Momentum" = 2, "Flow" = 3.5, "Pressure" = 1, "Deflection" = 2, "CounterMaster" = 1.5, "Interception" = 2, "Reversal" = 1.5)
					StyleStr = 1.35
					StyleSpd = 1.35
					StyleOff = 1.2
					StyleDef = 1.2
					StyleEnd = 1.2
					StyleFor = 1.15
				if(p.isRace(CELESTIAL))
					passives = list("Instinct" = 3.5, "LikeWater" = 2, "Momentum" = 2, "Flow" = 3, "Pressure" = 1, "Deflection" = 1.5, "CounterMaster" = 2, "Interception" = 1.5, "Reversal" = 2)
					StyleStr = 1.35
					StyleSpd = 1.35
					StyleOff = 1.2
					StyleDef = 1.2
					StyleEnd = 1.2
					StyleFor = 1.15
		verb/Mortal_Instinct_Martial()
			set hidden = 1
			adjust(usr)
			src.Trigger(usr)