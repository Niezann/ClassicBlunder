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