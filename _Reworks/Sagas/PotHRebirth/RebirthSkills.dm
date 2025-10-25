//t1 path buffs
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Hero_Heart
	AlwaysOn=1
	PowerMult=1.15
	StrMult=1.15
	ForMult = 1.15
	EndMult = 1.35
	Cooldown = 1
	adjust(mob/p)
		if(altered) return
		passives = list("Tenacity" = round(p.Potential/20,1), "Hardening" = round(p.Potential/20,1))
		EndMult += (p.Potential/200)
		StrMult += (p.Potential/300)
		ForMult += (p.Potential/300)
		PowerMult = 1.15 + (p.Potential/200)
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Hero_Soul
	AlwaysOn=1
	PowerMult=1.15
	StrMult=1.25
	ForMult = 1.15
	SpdMult=1.35
	RecovMult=1.25
	Cooldown = 1
	adjust(mob/p)
		if(altered) return
		passives = list("Instinct" = round(p.Potential/20,1), "Pursuer" = round(p.Potential/20,1))
		SpdMult += (p.Potential/150)
		StrMult += (p.Potential/250)
		ForMult += (p.Potential/250)
		PowerMult = 1.15 + (p.Potential/200)
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Prismatic_Hero
	AlwaysOn=1
	PowerMult=1.1
	StrMult=1.1
	EndMult = 1.1
	ForMult = 1.1
	SpdMult=1.15
	RecovMult=1.5
	Cooldown = 1
	adjust(mob/p)
		if(altered) return
		passives = list("FluidForm" = round(p.Potential/20,1), "LikeWater" = round(p.Potential/20,1)) //cat joke
		SpdMult += (p.Potential/250)
		StrMult += (p.Potential/250)
		ForMult += (p.Potential/250)
		EndMult += (p.Potential/250)
		PowerMult = 1.1 + (p.Potential/230)
	Trigger(mob/User, Override=FALSE)
		adjust(User)
		..()
//t2 path buffs. all one of them
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dont_Stop_Me_Now //first act
	PowerMult=1.15
	StrMult=1.15
	EndMult = 1.15
	ForMult=1.15
	SpdMult=1.15
	Cooldown = 1
	AwakeningRequired=1
	passives = list("BuffMastery" = 1,"KiControlMaster" =1, "TechniqueMastery"=1)
//HE'S GOTTA BE STRONG AND HE'S GOTTA BE FAST AND HE'S GOTTA BE FRESH FROM THE NIGHT
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Temporary_Hero_Heart
	ActiveMessage="awakens a heroic heart!"
	PowerMult=1.15
	StrMult=1.15
	ForMult = 1.15
	EndMult = 1.5
	Cooldown = 1
	TimerLimit = 30
	passives = list("Tenacity" = 1, "Hardening" = 1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Temporary_Hero_Soul
	ActiveMessage="awakens a heroic soul!"
	PowerMult=1.15
	StrMult=1.25
	ForMult = 1.15
	SpdMult=1.35
	RecovMult=1.25
	Cooldown = 1
	TimerLimit = 30
	passives = list("Instinct" = 1, "Pursuer" = 1)
//t3 path buffs
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Shining_Star
	AlwaysOn=1
	StrMult=1.25
	SpdMult=1.15
	Cooldown = 1
	passives = list("Pursuer" = 1,"KiControlMaster" =1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Unwavering_Soul
	AlwaysOn=1
	StrMult=1.1
	EndMult = 1.5
	BioArmor=50
	Cooldown = 1
	passives = list("Unstoppable" =1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Hero_Of_Chaos
	AlwaysOn=1
	AngerPoint=65
	RecovMult=1.75
	Cooldown = 1
	passives = list("FluidForm" = 1, "Controlled Chaos" = 1)

obj/Skills/Buffs/SlotlessBuffs/Autonomous/Axe_of_Justice
	AlwaysOn=1
	EndMult = 1.25
	ForMult=1.5
	Cooldown = 1
	passives = list("Neverending Hope" = 1, "Unstoppable" =1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/We_Are_The_Champions //second act
	StrMult=1.1
	EndMult = 1.1
	ForMult=1.1
	SpdMult=1.15
	Cooldown = 1
	AwakeningRequired=1
	passives = list("BuffMastery" = 1,"KiControlMaster" =1, "TechniqueMastery"=1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/The_Blue_Experience //second act
	ActiveMessage="burns brighter than they should."
	SpdMult=1.5
	Cooldown = 1
	AwakeningRequired=1
	HealthDrain = 0.05
	passives = list("BuffMastery" = 1,"Pursuer" =2, "Godspeed"=2)
//t4 path buffs
obj/Skills/Buffs/SlotlessBuffs/Autonomous/The_Show_Must_Go_On //third act
	StrMult=1.25
	EndMult = 1.25
	ForMult=1.25
	SpdMult=1.25
	Cooldown = 1
	AwakeningRequired=1
	passives = list("BuffMastery" = 1,"KiControlMaster" =1, "TechniqueMastery"=1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Burning_Soul
	ActiveMessage="transforms their passion into fury, their desire to win surpassing all."
	Cooldown = 1
	AwakeningRequired=1
	passives = list("Red Hot Rage" = 1, "Wrathful" = 1)
//debuffs
/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Rebirth/Dissociation
	ActiveMessage="doesn't appear to be all there."
	passives = list("BuffMastery" = -1, "Flow" = -2, "Instinct" = -2)
	SlowAffected = 1
	TimerLimit = 6000
	Cooldown = 4
	AlwaysOn = 1
	IconLock = 'SweatDrop.dmi'
obj/Skills/AutoHit
	var/IsSnowgrave
	var/HahaWhoops
	var/RandomMult
	MakeItCount
		Area="Strike"
		AwakeningSkill=1
		ActNumber=3
		NeedsHealth=25
		Rush=10
		SpecialAttack=1
		CanBeDodged=0
		CanBeBlocked=1
		DamageMult=20
		Stunner=3
		Knockback=0
		WindUp=1
		WindupIcon='Chidori.dmi'
		WindupMessage="vibrates their hand quickly enough to create blue static electricity, all of which focusing into a tiny point within their palm."
		ActiveMessage="bets their future on this one attack!"
		Icon='Chidori.dmi'
		HitSparkIcon='Hit Effect Vampire.dmi'
		HitSparkX=-32
		HitSparkY=-32
		HitSparkSize=1
		ControlledRush=1
		Instinct=1
		verb/Make_It_Count()
			set category="Skills"
			set name="Make It Count (Act 3)"
			if(world.realtime < src.RebirthLastUse+(600*60*24*7))
				usr << "You can only use this technique once every week."
				return
			usr.Activate(src)
			src.RebirthLastUse=world.realtime
			usr.TriggerAwakeningSkill(ActNumber)
	Snowgrave
		ElementalClass="Water"
		ForOffense=1.5
		SpecialAttack=1
		GuardBreak=1
		DamageMult=1500
		Chilling=150
		Stasis=5
		TurfShift='IceGround.dmi'
		Distance=15
		WindUp=0.5
		IsSnowgrave=1
		WindupMessage="casts a spell they don't know.."
	//	ActiveMessage="freezes the area with a destructive chill!"
		Cooldown=90
		Area="Target"
		verb/Snowgrave()
			set category="Skills"
			usr.RebirthHeroType="Yellow"
			if(!altered)
				DamageMult = 600
			usr.Activate(src)
	NeverSeeItComing
		SpecialAttack=1
		GuardBreak=1
		DamageMult=0
		TurfShift='IceGround.dmi'
		Distance=15
		WindUp=0.5
		WindupMessage="casts a spell that nobody can see coming."
		HahaWhoops=1
		ActNumber=1
	//	Area="Target"
		verb/Never_See_It_Coming()
			set category="Skills"
			set name="Never See It Coming (Act 1)"
			if(world.realtime < src.RebirthLastUse+(600*60*24))
				usr << "You can only use this technique once every 24 hours."
				return
			RandomMult=rand(1,10)
			DamageMult=RandomMult
			usr.Activate(src)
			usr.TriggerAwakeningSkill(ActNumber)
	PowerWordGenderDysphoria
		Area="Target"
		NeedsHealth=50
		AdaptRate = 1
		DamageMult = 5
		Distance = 15
		DelayTime = 0
		HitSparkIcon = 'BLANK.dmi'
		TurfDirt = 1
		ShockIcon = 'Icons/NSE/spells/cast/KrysiaHitspark2.dmi'
		Shockwave = 4
		Shockwaves = 1
		PostShockwave = 1
		PreShockwave = 0
		ActNumber=2
		AwakeningSkill=1
		WindupMessage="foreshadows their imminent future, maybe."
		ActiveMessage = "gives the target a perspective on life that they didn't ask for."
		BuffAffected = "/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Rebirth/Dissociation"
		verb/GenderDysphoria()
			set category="Skills"
			set name="Power Word: Gender Dysphoria (Act 2)"
			if(world.realtime < src.RebirthLastUse+(600*60*72))
				usr << "You can only use this technique once every 72 hours."
				return
			if(usr.Health>50)
				usr<<"You can only use this at 50% health or below."
				return
			usr.Activate(src)
			usr.TriggerAwakeningSkill(ActNumber)
			src.RebirthLastUse=world.realtime
	Unleash
		ManaCost=75
		StrOffense=0
		ForOffense=1
		HolyMod=40
		DamageMult=3
		Area="Circle"
		Distance=3
		TurfErupt=2
		TurfEruptOffset=3
//		Slow=1
//		WindUp=1
		WindupIcon='Ripple Radiance.dmi'
		WindupIconUnder=1
		WindupIconX=-32
		WindupIconY=-32
		WindupIconSize=1.3
		Divide=1
		PullIn=25
		WindupMessage="glows with a certain power..."
		ActiveMessage="unleashes a blinding flash of holy light!"
		HitSparkIcon='BLANK.dmi'
		HitSparkX=0
		HitSparkY=0
		verb/Unleah()
			set category="Skills"
			usr.Activate(src)
	Banish
		ManaCost=100
		StrOffense=0
		ForOffense=1
		HolyMod=100
		DamageMult=2
		Area="Circle"
		Distance=5
		TurfErupt=2
		TurfEruptOffset=3
//		Slow=1
//		WindUp=1
		WindupIcon='Ripple Radiance.dmi'
		WindupIconUnder=1
		WindupIconX=-32
		WindupIconY=-32
		WindupIconSize=1.3
		Divide=1
		PullIn=25
		WindupMessage="glows with a certain power..."
		ActiveMessage="banishes all darkness!"
		HitSparkIcon='BLANK.dmi'
		HitSparkX=0
		HitSparkY=0
		verb/Banish()
			set category="Skills"
			if(world.realtime < src.RebirthLastUse+(600*60*168))
				usr << "You can only use this technique once every week."
				return
			src.RebirthLastUse=world.realtime
			usr.Activate(src)
	Burning_Up_Everything
		StrOffense=0
		ForOffense=1
		DamageMult=14
		HealthCost=15
		Area="Circle"
		Distance=8
		TurfErupt=2
		TurfEruptOffset=3
		Scorching = 30
		Slow=1
		WindUp=1
		WindupIcon='Ripple Radiance.dmi'
		WindupIconUnder=1
		WindupIconX=-32
		WindupIconY=-32
		WindupIconSize=1.3
		Divide=1
		PullIn=25
		WindupMessage="sets their heart ablaze..."
		ActiveMessage="burns up everything around them!"
		HitSparkIcon='BLANK.dmi'
		HitSparkX=0
		HitSparkY=0
		Cooldown=3600

		Earthshaking=15
		PreQuake=1
		verb/Burning_Up_Everything()
			set category="Skills"
			usr.Activate(src)
	Scream_of_Fury
		Area="Circle"
		Distance=10
		RedTechnique=1
		AdaptRate = 1
		GuardBreak=1
		DamageMult=6
		Knockback=15
		Cooldown=120
		NeedsHealth=50
		Shockwaves=3
		Shockwave=4
		SpecialAttack=1
		Stunner=3
		HitSparkIcon='BLANK.dmi'
		HitSparkX=0
		HitSparkY=0
		ActiveMessage="lets loose a furious roar!"
		adjust(mob/p)
			if(altered) return
			if(p.passive_handler.Get("Red Hot Rage"))
				Cooldown=10
				RedPUSpike=pick(25, 50)
				DamageMult=5
				ActiveMessage="screams so fucking loud that you start to worry about their mental health. Are they okay?"
				for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Burning_Soul/s in p)
					s.passives["PUSpike"] += RedPUSpike
				p.WeirdAngerStuff()
			else
				Cooldown=150
				RedPUSpike=0
		verb/Scream_of_Fury()
			set category="Skills"
			adjust(usr)
			usr.Activate(src)
	Platinum_Mad
		StrOffense=1
		ForOffense=1
		DamageMult=3
		Area="Circle"
		Distance=12
		TurfErupt=2
		TurfEruptOffset=3
		Scorching = 30
		Slow=1
		WindUp=4
		WindupIcon='Amazing SSj4 Aura.dmi'
		WindupIconX=-32
		WindupIconY=32
		WindupIconSize=2
		Divide=1
		PullIn=25
		WindupMessage="needs just a little more time!"
		ActiveMessage="burns up everything around them, including themselves!"
		HitSparkIcon='BLANK.dmi'
		HitSparkX=0
		HitSparkY=0
	//	Cooldown=30
		Earthshaking=15
		PreQuake=1
		PlatinumMad=1
		verb/Platinum_Mad()
			set category="Skills"
			set hidden=1
			if(world.realtime < src.RebirthLastUse+(600*60*24))
				return
			src.RebirthLastUse=world.realtime
			usr.Activate(src)
mob/proc/TriggerAwakeningSkill(ActNumber)
	if(ActNumber>=1)
		src<< "<b>Fate turns its eye to you, watching with interest.</b>"
		src.AwakeningSkillUsed=1
		src.buffSelf(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Dont_Stop_Me_Now)
	if(ActNumber>=2)
		src<< "<b>You hear the scratching of pen to paper, your story being recorded.</b>"
		src.AwakeningSkillUsed=2
		src.buffSelf(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/We_Are_The_Champions)
	if(ActNumber>=3)
		src<< "<b>The book closes on this chapter. Yet, surely, there is more to be told.</b>"
		src.AwakeningSkillUsed=3
		src.buffSelf(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/The_Show_Must_Go_On)
obj/Skills
	var/AwakeningSkill
	var/ActNumber
	var/RebirthLastUse
	var/RedTechnique
	var/RedPUSpike
	var/PlatinumMad
obj/Skills/Queue
	var/RandomMult
	NeverKnowsBest
		NeedsHealth=75
		Copyable=0
		ActNumber=1
		AwakeningSkill=1
		HitMessage="asks for the strength to shatter fate..."
		DamageMult=0.1
		AccuracyMult =10000
		Duration=5
		KBMult=0.00001
		Cooldown=30
		UnarmedOnly=1
		Launcher=2
		name="Never Knows Best"
		HitSparkIcon='fevExplosion.dmi'
		HitSparkX=-32
		HitSparkY=-32
		verb/NeverKnowsBest()
			set category="Skills"
			set name="Never Knows Best (Act 1)"
			if(world.realtime < src.RebirthLastUse+(600*60*24))
				usr << "You can only use this technique once every 24 hours."
				return
			RandomMult=rand(1,70)
			DamageMult=RandomMult/10
			usr.SetQueue(src)
			usr.TriggerAwakeningSkill(ActNumber)
	FistOfTheRedStar
		NeedsHealth=50
		name="Fist Of The Red Star"
		DamageMult=7
		AccuracyMult = 1.75
		Duration=5
		Shattering=3
		ActNumber=2
		AwakeningSkill=1
		KBAdd=15
		HitMessage="asks for the strength to shatter fate..."
		PushOutIcon='DarkKiai.dmi'
		PushOutWaves=3
		PushOut=1
		HitSparkIcon='BLANK.dmi'
		verb/FistOfTheRedStar()
			set category="Skills"
			set name="Fist Of The Red Star (Act 2)"
			if(world.realtime < src.RebirthLastUse+(600*60*72))
				usr << "You can only use this technique once every 72 hours."
				return
			usr.SetQueue(src)
			usr.TriggerAwakeningSkill(ActNumber)

obj/Skills/Utility
	var/RandomMult
	NeverTooEarly
		Copyable=0
		desc="End your awakening."
		verb/NeverTooEarly()
			set category="Utility"
			set name="Never Too Early"
			if(!usr.AwakeningSkillUsed)
				usr<<"No need."
				return
			if(usr.AwakeningSkillUsed)
				usr.AwakeningSkillUsed=0
				usr.Health=0
	NeverTooLate
		Copyable=0
		ActNumber=1
		icon_state="Heal"
		desc="You ask for a little more time."
		verb/NeverTooLate()
			set category="Utility"
			set name="Never Too Late (Act 1)"
			if(world.realtime < src.RebirthLastUse+(600*60*24))
				src << "You can only use this technique once every 24 hours."
				return
			if(usr.Health>75)
				usr<<"Can't use yet!"
				return
			src.RebirthLastUse=world.realtime
			RandomMult=rand(1,25)
			usr.DoDamage(usr, 10)
			usr.HealHealth(RandomMult)
			usr.TriggerAwakeningSkill(ActNumber)
	TheBlueExperience
		Copyable=0
		ActNumber=2
		icon_state="Heal"
		desc="Shine brightly. Your awakening skill strengthens, but you burn out quicker."
		verb/TheBlueExperience()
			set category="Utility"
			set name="The Blue Experience (Act 2)"
			if(world.realtime < src.RebirthLastUse+(600*60*72))
				src << "You can only use this technique once every 3 days."
				return
			if(usr.Health>50)
				usr<<"Can't use yet!"
				return
			src.RebirthLastUse=world.realtime
			usr.TriggerAwakeningSkill(ActNumber)
			usr.buffSelf(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/The_Blue_Experience)
	Burning_Soul
		Copyable=0
		ActNumber=3
		icon_state="Heal"
		desc="Translate all your power into rage. Your Rebirth skills become faster, but make you more and more angrier. At 500% Fury, your rage explodes outwards, damaging yourself and everyone in view."
		verb/Burning_Soul()
			set category="Utility"
			set name="Red Hot Rage (Act 3)"
			if(world.realtime < src.RebirthLastUse+(600*60*24*7))
				src << "You can only use this technique once every week."
				return
			if(usr.Health>25)
				usr<<"Can't use yet!"
				return
			src.RebirthLastUse=world.realtime
			usr.TriggerAwakeningSkill(ActNumber)
			usr.buffSelf(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Burning_Soul)
	SoulShift
		Copyable=0
		verb/SoulRed()
			set category="Utility"
			set name="SOUL Shift (Red)"
			usr.passive_handler.Set("Determination(Red)", 1)
			usr.passive_handler.Set("Determination(Yellow)", 0)
			usr.passive_handler.Set("Determination(Green)", 0)
			usr<<"You are now using the Red SOUL color."
		verb/SoulYellow()
			set category="Utility"
			set name="SOUL Shift (Yellow)"
			usr.passive_handler.Set("Determination(Red)", 0)
			usr.passive_handler.Set("Determination(Yellow)", 1)
			usr.passive_handler.Set("Determination(Green)", 0)
			usr<<"You are now using the Yellow SOUL color."
	SoulShiftGreen
		Copyable=0
		verb/SoulGreen()
			set category="Utility"
			set name="SOUL Shift (Green)"
			usr.passive_handler.Set("Determination(Red)", 0)
			usr.passive_handler.Set("Determination(Yellow)", 0)
			usr.passive_handler.Set("Determination(Green)", 1)
			usr<<"You are now using the Green SOUL color."
	UltimateHeal
		ManaCost=100
		Cooldown=-1
		icon_state="Heal"
		desc="This allows you to attempt to heal people you are facing. At least it clears their fatigue, right?"
		verb/Ultimate_Heal()
			set category="Utility"
			usr.SkillX("UltimateHeal",src)
	BetterHeal
		ManaCost=75
		Cooldown=-1
		icon_state="Heal"
		desc="A decent, costly heal."
		verb/Better_Heal()
			set category="Utility"
			usr.SkillX("BetterHeal",src)
	HoldingOutForAHero
		ManaCost=100
		Cooldown=-1
		var/buffpicked
		icon_state="Heal"
		desc="Randomly cast Hero Heart or Hero Soul on yourself."
		verb/HoldingOutForAHero()
			set name="Holding Out For a Hero"
			set category="Skill"
			if(usr.ManaAmount<src.ManaCost)
				usr<<"You need [src.ManaCost] ACT to use this."
			src.buffpicked=pick(list(/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Temporary_Hero_Heart, /obj/Skills/Buffs/SlotlessBuffs/Autonomous/Temporary_Hero_Soul))
			usr.buffSelf(src.buffpicked)
obj/Skills/Projectile
	var/PartyReq
	var/PartyReqType
	Rude_Buster
		Distance=40
		ManaCost=50
		DamageMult=4
		Shearing=1
		AccMult=100
		HyperHoming=1
		Dodgeable=-1
		Deflectable=-1
		IconLock='RudeBuster.dmi'
		IconSize=1
		Radius=3
		Homing=1
		verb/Rude_Buster()
			set category="Skills"
			set name="Rude Buster"
			usr.UseProjectile(src)
	Red_Buster
		Distance=40
		Charge=0.25
		ManaCost=50
		DamageMult=8
		PartyReq=1
		PartyReqType="Cyan"
		Shearing=1
		AccMult=100
		HyperHoming=1
		Dodgeable=-1
		Deflectable=-1
		IconLock='RudeBuster.dmi'
		IconSize=1
		Radius=3
		Homing=1
		verb/Red_Buster()
			set category="Skills"
			set name="Red Buster"
			usr.UseProjectile(src)
	Devilsbuster
		Distance=40
		Charge=0
		ManaCost=40
		DamageMult=6
		Shearing=1
		AccMult=50
		HyperHoming=1
		Dodgeable=-1
		Deflectable=-1
		IconLock='RudeBuster.dmi'
		IconSize=1
		Radius=3
		Homing=1
		verb/Devilsbuster()
			set category="Skills"
			set name="Devilsbuster"
			usr.UseProjectile(src)
	Burning_Black
		Distance=40
		Charge=0.25
		ManaCost=100
		DamageMult=16
		Shearing=1
		AccMult=100
		HyperHoming=1
		Dodgeable=-1
		Deflectable=-1
		IconLock='RudeBuster.dmi'
		IconSize=1
		Radius=3
		Homing=1
		Cooldown=180
		verb/Red_Buster()
			set category="Skills"
			set name="Red Buster"
			usr.UseProjectile(src)
	Beams
		TasteTheRainbow //Nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan nyan
			AdaptRate=1
			DamageMult=12
			Immediate=1
			Dodgeable=0
			IconLock='carefully.dmi'
			Cooldown=120
			EnergyCost=5
			Instinct=1
			verb/Taste_The_Rainbow()
				set category="Skills"
				usr.UseProjectile(src)
		Unbelievable_Rage
			DamageMult=10
			Immediate=1
			Dodgeable=0
			IconLock='Pride Beam.dmi'
			Cooldown=120
			Instinct=1
			adjust(mob/p)
				if(altered) return
				if(p.passive_handler.Get("Red Hot Rage"))
					Cooldown=30
					RedPUSpike=pick(25, 50)
					DamageMult=12
					for(var/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Burning_Soul/s in p)
						s.passives["PUSpike"] += RedPUSpike
					p.WeirdAngerStuff()
				else
					Cooldown=120
					RedPUSpike=0
			verb/Unbelievable_Rage()
				set category="Skills"
				adjust(usr)
				usr.UseProjectile(src)

	Zone_Attacks
		Final_Chaos
			Speed = 0.25
			Distance=20
			Blasts=15
			Charge=1
			DamageMult=1.3
			IconLock='Nyan2.dmi'
			Instinct=1
			AccMult=2
			Homing=3
			Explode=1
			ZoneAttackX=3
			ZoneAttackY=3
			Hover=7
			ActNumber=3
			AwakeningSkill=1
			Variation=0
			verb/Final_Chaos()
				set category="Skills"
				set name="Final Chaos (Act 3)"
				if(world.realtime < src.RebirthLastUse+(600*60*168))
					src << "You can only use this technique once every week."
					return
				if(usr.Health>25)
					usr<<"Can't use yet!"
					return
				src.RebirthLastUse=world.realtime
				usr.TriggerAwakeningSkill(ActNumber)
				usr.UseProjectile(src)
obj/Skills/Buffs
	Rebirth
		RemoveSOUL
			MakesSword=1
			SwordName="SOUL Sword"
			SwordIcon='PlaceholderBlackScythe.dmi'
			SwordX=-32
			SwordY=-32
			SwordClass="Medium"
			PowerMult=3
			Cooldown = 1
			HealthCost = 50
			ActiveMessage="tears their heart from their chest."
			OffMessage="places their still-beating heart back into their chest."
			verb/RemoveSOUL()
				set category="Skills"
				adjust(usr)
				src.Trigger(usr)
		BlackShard
			MakesSword=1
			SwordName="Black Shard"
			SwordIcon='BlackShard.dmi'
			SwordX=-32
			SwordY=-32
			SwordClass="Small"
			PowerMult=2
			StrMult=1.3
			Cooldown = 1
			SwordAscension=3
			OffMult=0.5
			passives = list("HolyMod" = 3)
			ActiveMessage="pulls out a small shard of glass that seems barely usable as a weapon."
			OffMessage="puts the black shard away."
			verb/BlackShard()
				set category="Skills"
				adjust(usr)
				src.Trigger(usr)
		Devilsknife
			MakesSword=1
			SwordName="Devilsknife"
			SwordIcon='PlaceholderBlackScythe.dmi'
			BuffTechniques=list("/obj/Skills/Projectile/Rebirth/Devilsbuster")
			SwordX=-32
			SwordY=-32
			SwordClass="Medium"
			PowerMult=1.25
			ForMult=1.15
			StrMult=1.3
			Cooldown = 1
			ActiveMessage="draws forth a skull emblazoned scythe-ax!"
			OffMessage="pockets the weap-... did it just smile at you?!"
			verb/Devilsknife()
				set category="Skills"
				adjust(usr)
				src.Trigger(usr)
				if(prob(2))
					OMsg(usr, "<b>MY HEARTS GO OUT TO ALL YOU SINNERS!</b>")
		JusticeAxe
			MakesSword=1
			SwordName="Axe of Justice"
			SwordIcon='PlaceholderBlackScythe.dmi'
			SwordX=-32
			SwordY=-32
			SwordClass="Heavy"
			PowerMult=1.5
			StrMult=1.45
			SwordAscension=3
			Cooldown = 1
			ActiveMessage="faces fate with the Axe of Justice."
			OffMessage="puts the Axe of Justice away."
			verb/Devilsknife()
				set category="Skills"
				adjust(usr)
				src.Trigger(usr)
		Spookysword
			MakesSword=1
			SwordName="Spookysword"
			SwordIcon='PlaceholderBlackScythe.dmi'
			SwordX=-32
			SwordY=-32
			SwordClass="Medium"
			PowerMult=1.25
			StrMult=1.25
			Cooldown = 1
			ActiveMessage="draws forth a black and orange sword!"
			OffMessage="sheathes their spooky blade!"
			verb/Spookysword()
				set category="Skills"
				adjust(usr)
				src.Trigger(usr)
		ThornRing
			MakesSword=1
			SwordName="Spookysword"
			SwordIcon='PlaceholderBlackScythe.dmi'
			passives = list("DrainlessMana" = 1)
			BuffTechniques=list("/obj/Skills/Projectile/Rebirth/Devilsbuster")
			SwordX=-32
			SwordY=-32
			SwordClass="Small"
			HealthCost = 25
			Cooldown = 1
			ActiveMessage="receives pain to become stronger."
		//	OffMessage="sheathes their spooky blade!"
			verb/Thorn_Ring()
				set category="Skills"
				adjust(usr)
				src.Trigger(usr)
		//	JusticeAxe
obj/Skills/Grapple
	CHAOS_DUNK
		DamageMult=10
		StrRate=1
		TriggerMessage="comes on and slams"
		Effect="Lotus"
		EffectMult=4
		OneAndDone=1
		ThrowMult=0
		ThrowAdd=0
		Cooldown=120
		verb/CHAOS_DUNK()
			set category="Skills"
			src.Activate(usr)