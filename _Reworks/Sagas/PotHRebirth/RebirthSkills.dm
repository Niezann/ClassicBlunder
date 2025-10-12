//t1 path buffs
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Hero_Heart
	AlwaysOn=1
	PowerMult=1.25
	StrMult=1.15
	EndMult = 1.75
	Cooldown = 1
	passives = list("Tenacity" = 1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Hero_Soul
	AlwaysOn=1
	PowerMult=1.25
	StrMult=1.5
	SpdMult=1.5
	RecovMult=1.5
	Cooldown = 1
	passives = list("Instinct" = 1)
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Prismatic_Hero
	AlwaysOn=1
	PowerMult=1.15
	StrMult=1.15
	EndMult = 1.15
	SpdMult=1.15
	RecovMult=1.75
	Cooldown = 1
	passives = list("FluidForm" = 1)
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
	Cooldown = 1
	passives = list("BioArmor" = 1, "Unstoppable" =1)
//t4 path buffs
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Axe_of_Justice
	AlwaysOn=1
	EndMult = 1.25
	ForMult=1.5
	Cooldown = 1
	passives = list("Neverending Hope" = 1, "Unstoppable" =1)
obj/Skills/AutoHit
	var/IsSnowgrave
	var/HahaWhoops
	var/RandomMult
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
		WindupMessage="casts a spell they don't know.."
		HahaWhoops=1
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
		ActNumber=1
		SpecialAttack=1
		GuardBreak=1
		DamageMult=0
		Distance=15
		WindUp=0.5
		WindupMessage="foreshadows their imminent future, maybe."
		Area="Target"
		verb/GenderDysphoria()
			set category="Skills"
			set name="Power Word: Gender Dysphoria (Act 2)"
			if(world.realtime < src.RebirthLastUse+(600*60*72))
				usr << "You can only use this technique once every 72 hours."
				return
			RandomMult=rand(1,10)
			DamageMult=RandomMult
			usr.Activate(src)
			usr.TriggerAwakeningSkill(ActNumber)
mob/proc/TriggerAwakeningSkill(ActNumber)
	if(ActNumber==1)
		src<< "act 1 placeholder msg lol"
		src.AwakeningSkillUsed=1
obj/Skills
	var/AwakeningSkill
	var/ActNumber
	var/RebirthLastUse
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
			usr.HealHealth(RandomMult)
			usr.TriggerAwakeningSkill(ActNumber)
	TheBlueExperience
		Copyable=0
		ActNumber=2
		icon_state="Heal"
		desc="You ask for a little more time."
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
		desc="A strong, costly heal."
		verb/Better_Heal()
			set category="Utility"
			usr.SkillX("UltimateHeal",src)
obj/Skills/Projectile
	Rude_Buster
		Distance=40
		Charge=0.25
		ManaCost=50
		DamageMult=4
		Shearing=1
		AccMult=100
		HyperHoming=1
		Dodgeable=-1
		Deflectable=-1
		IconLock='RudeBuster.dmi'
		Knockback=1
		IconSize=3
		Radius=3
		Homing=1
		ZoneAttack=1
		ZoneAttackX=0
		ZoneAttackY=0
		FireFromSelf=1
		FireFromEnemy=0
		Striking=1
		verb/Rude_Buster()
			set category="Skills"
			set name="Rude Buster"
			usr.UseProjectile(src)
	Devilsbuster
		Distance=40
		Charge=0
		ManaCost=40
		DamageMult=6
		Shearing=1
		AccMult=50
		HyperHoming=1
		Dodgeable=1
		Deflectable=-1
		IconLock='RudeBuster.dmi'
		Knockback=1
		IconSize=3
		Radius=3
		Homing=1
		ZoneAttack=1
		ZoneAttackX=0
		ZoneAttackY=0
		FireFromSelf=1
		FireFromEnemy=0
		Striking=1
		verb/Devilsbuster()
			set category="Skills"
			set name="Devilsbuster"
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
			SwordIcon='PlaceholderBlackScythe.dmi'
			SwordX=-32
			SwordY=-32
			SwordClass="Small"
			PowerMult=2
			Cooldown = 1
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
			PowerMult=1.15
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