obj/Skills/AutoHit/Desperation
	FatalEnding
		NeedsSword=1
		Distance=15
		Gravity=5
		WindUp=1
		WindupMessage="readies their Desperation Move...!"
		DamageMult=10
		StrOffense=1
		ActiveMessage="slashes through their enemy in the blink of an eye, aiming to mortally wound them!"
		Area="Target"
		GuardBreak=1
		PassThrough=1
		MortalBlow=1
		HitSparkIcon='Slash - Zan.dmi'
		HitSparkX=-16
		HitSparkY=-16
		HitSparkTurns=1
		HitSparkSize=3
		Cooldown=300
		EnergyCost=15
		Instinct=1
		NeedsHealth=30
		verb/Fatal_Ending()
			var/asc = usr.AscensionsAcquired
			set category="Skills"
			DamageMult=(10 * (1+asc))
			StrOffense=(1 * (1+asc))
			Cooldown=300-(10*(asc))
			usr.Activate(src)
/obj/Skills/Projectile/Zone_Attacks/Desperation
	UltimaLasers
		EnergyCost=20
		Speed = 2
		Distance=20
		Blasts=30
		Charge=1
		DamageMult=0.8
		ComboMaster=1
		Stunner= 3
		Instinct=1
		AccMult=2
		Homing=3
		Explode=1
		ZoneAttackX=5
		ZoneAttackY=5
		IconLock='UltimaLaser.dmi'
		LockX=0
		LockY=0
		Hover=7
		Variation=0
		Cooldown = 300
		ActiveMessage="fires off an impossible amount of energy bolts!"
		verb/Ultima_Lasers()
			var/asc = usr.AscensionsAcquired
			set category="Skills"
			if(usr.Health>=30)
				usr << "You need to be under 30% HP to use your Desperation Move!"
				return
			DamageMult=0.8*(1+asc/2)
			Cooldown=300-(10*(asc))
			usr.UseProjectile(src)
