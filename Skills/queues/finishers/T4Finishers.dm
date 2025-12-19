/obj/Skills/Queue/Finisher
	The_Blade_of_Chaos
		HarderTheyFall=4
		Stunner=4
		Quaking=12
		DamageMult=8
		InstantStrikes=2
		InstantStrikesDelay = 1
		PushOut=1
		PushOutWaves=2
		HitSparkIcon='Slash - Zan.dmi'
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Ghost_of_Sparta"
		HitSparkX=-32
		HitSparkY=-32
	Demonic_Nine_Flashes
		HitSparkIcon = 'Slash_Multi.dmi'
		InstantStrikes=9
		InstantStrikesDelay = 0.5
		DamageMult=1.5
		Stunner=4
		SpeedStrike=3
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Nine_Sword_Style"
		HitMessage="rushes forward, their aura manifesting six more blades, as they unleash a flurry of blows in the blink of an eye!"
	Jinzen_Senkei
	The_Big_Bang_Punch
		Stunner=1
		DamageMult=5
		HitSparkIcon='fevExplosion.dmi'
		HitSparkX=-32
		HitSparkY=-32
		Explosive=10
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/The_Ultimate_Fist"
		FollowUp="/obj/Skills/AutoHit/Big_Bang_Followup"
	Hyakuretsu_Ken
		Combo=20
		DamageMult=0.8
		Stunner=4
		SpeedStrike=6
		BuffAffected = "/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Debuff/Death_Mark"
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Lightning_Strikes_Twice"
		HitMessage="unleashes a flurry of powerful blows, sealing their target's fate."
	Stone_Cold_Stunner
	Saigo_no_Kyukyoku_Tengenkotsu
		KBMult=20
		KBAdd = 20
		Quaking=12
		DamageMult=20
		HitSparkIcon='fevExplosion.dmi'
		HitSparkX=-32
		HitSparkY=-32
		Explosive=10
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Legendary_Exhaustion"
		HitMessage="unleashes their pent up legendary power, transcending the limits of reason. The sun they grasp within their hand explodes in a brilliant supernova, achieving the ultimate, supreme, final Tengenkotsu!!!!!"
	Stellar_Formation
		SpeedStrike = 2
		SweepStrike = 2
		Quaking=5
		PushOut=1
		DamageMult = 5
		FollowUp="/obj/Skills/Queue/Finisher/Stellar_Evolution"
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Ionization"
		HitMessage = "breaks off into a relentless pursuit!"
	Stellar_Evolution
		Combo=10
		DamageMult = 0.5
		BuffSelf=0
		HitSparkIcon = 'Slash_Multi.dmi'
	Hyper_Goner_Two
		FollowUp="/obj/Skills/Projectile/Even_More_Super_Hyper_Goner_Attack"
		DamageMult = 4
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Final_Boss_Form"
/obj/Skills/Queue/Finisher
	Seiken_Gradalpha
		name = "Seiken Gradalpha"
		Warp = 5
		Combo = 3
		InstantStrikes = 2
		DamageMult = 3
		Instinct = 3
		Shining = 3
		Explosive = 2
		FollowUp = "/obj/Skills/AutoHit/Seiken_Gradalpha2"
		HitMessage = "pierces their foe with converging light!"
	Shining_V_Force
		name = "Shining V Force"
		Warp = 10
		Combo = 5
		InstantStrikes = 5
		DamageMult = 0.5
		Instinct = 5
		Shining = 3
		Explosive = 3
		BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Future_Mode"
		HitMessage = "delivers countless strikes against their foe in the blink of an eye, then fires off a V-shaped beam of light!"
/obj/Skills/AutoHit
	Big_Bang_Followup
		Area="Circle"
		DamageMult=15
		Knockback = 1
		ComboMaster=1
		Stunner=3
		Size=4
		StrOffense=1
		GuardBreak=1
		Rush=5
		PullIn=2
		ControlledRush=8
		TurfErupt=2
		TurfEruptOffset=3
		Instinct=1
		TurfStrike=4
		TurfShift='Dirt1.dmi'
		TurfShiftDuration=1
		ChargeTech = 1
		ActiveMessage="kicks off the ground, turning their feet into rockets, as they launch forward and release the mother of all punches: Forbidden Technique: The Big Bang Punch!!!!"
/obj/Skills/Projectile
	Zone_Attacks
		ZoneAttack=1
		Even_More_Super_Hyper_Goner_Attack
			Blasts=25
			Charge=2
			DamageMult=1.3
			Instinct=1
			AccMult=2
			Explode=1
			Distance=100
			ZoneAttackX=10
			ZoneAttackY=10
			Hover=10
			Variation=0
			ComboMaster=1
			IconLock='ChaosBlast.dmi'
