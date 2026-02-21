/obj/Skills/AutoHit/Lunge
	Area="Wave"
	Distance=5
	DamageMult=3
	Rush=5
	ControlledRush=1
	Cooldown=30
	StrOffense=1
	RushAfterImages=3
	RushNoFlight=1
	ActiveMessage="lunges forward with blinding speed!"
	var/MaxCharges=2
	var/Charges=2
	var/Recharging=0

	verb/Lunge()
		set category="Skills"
		src.Trigger(usr)

	skillDescription()
		..()
		description += "Charges: [Charges]/[MaxCharges]\n"

	adjust(mob/p)
		var/scaling = round(p.Potential / 25)
		Distance = 5 + scaling
		DamageMult = 3 + scaling
		Rush = 5 + scaling

	Trigger(mob/p)
		adjust(p)
		if(Charges <= 0)
			return FALSE
		var/aaa = p.Activate(src)
		return aaa

	Cooldown(modify = 1, Time, mob/p)
		var/mob/m = src.loc
		if(p)
			m = p
		Charges--
		if(Charges <= 0)
			Using = 1
		if(!Time && m)
			if(!CooldownStatic)
				if(glob.SPEED_COOLDOWN_MODE)
					modify /= clamp(glob.SPEED_COOLDOWN_MIN, m.GetSpd()**glob.SPEED_COOLDOWN_EXPONENT, glob.SPEED_COOLDOWN_MAX)
				if(m.HasTechniqueMastery())
					var/TM = m.GetTechniqueMastery() / glob.TECHNIQUE_MASTERY_DIVISOR
					if(TM < 0)
						modify *= clamp(1 + abs(TM), 1.1, glob.TECHNIQUE_MASTERY_LIMIT)
					else if(TM > 0)
						modify /= clamp((1 + TM), 0.1, glob.TECHNIQUE_MASTERY_LIMIT)
			else
				if(m.Hustling())
					modify *= 0.75
			Time = src.Cooldown * 10 * modify
		if(isnull(Time) || Time == 0)
			Time = src.Cooldown * 10
		if(m)
			if(m.PureRPMode)
				return
			if(m.cooldownAnnounce)
				m << "Lunge: [Charges]/[MaxCharges] charges remaining. Next charge in [Time / 10]s."
			if(!Recharging)
				Recharging = 1
				RechargeLoop(Time, m)

	proc/RechargeLoop(Time, mob/m)
		spawn(Time)
			Charges = min(Charges + 1, MaxCharges)
			if(Charges > 0)
				Using = 0
			if(m && m.cooldownAnnounce)
				m << "<font color='white'><b>Lunge charge restored. ([Charges]/[MaxCharges])</b></font color>"
			if(Charges < MaxCharges)
				RechargeLoop(Time, m)
			else
				Recharging = 0

/obj/Skills/AutoHit/Ice_Breath
	ElementalClass="Water"
	StrOffense=0
	ForOffense=2
	SpecialAttack=1
	GuardBreak=0
	DamageMult=15
	Chilling=100
	ObjIcon=1
	Icon='SnowBurst2.dmi'
	IconX=-16
	IconY=-16
	WindUp=0.5
	WindupMessage="breathes deeply..."
	ActiveMessage="lets loose an enormous breath infused with frost!"
	Cooldown=60
	Distance=30
	Slow=1
	Area="Arc"
	verb/Ice_Breath()
		set category="Skills"
		if(!altered)
			DamageMult = 3 + (1.5 * usr.AscensionsAcquired)
			Distance = 6 + (3 * usr.AscensionsAcquired)
			ForOffense = 2 + (0.25 * usr.AscensionsAcquired)
		usr.Activate(src)

/obj/Skills/AutoHit/Fog_Breath
	ElementalClass="Water"
	StrOffense=0
	ForOffense=1
	DamageMult=3
	SpecialAttack=1
	GuardBreak=1
	Slow=1
	Freezing=15
	NoLock=1
	NoAttackLock=1
	Area="Circle"
	Distance=1
	Wander=10
	ObjIcon=1
	Icon='FogBreath.dmi'
	IconX=-16
	IconY=-16
	Size=1.5
	Cooldown=60
	Rounds=40
	DelayTime=5
	HitSparkIcon='BLANK.dmi'
	HitSparkX=0
	HitSparkY=0
	ActiveMessage="releases a chilling fog!"
	verb/Fog_Breath()
		set category="Skills"
		usr.Activate(src)

// Target debuff skills - apply stat-reducing debuffs for 30 seconds
obj/Skills/Buffs/SlotlessBuffs/DemiFiend/TarundaApply
	StrMult=0.75
	ForMult=0.75
	TimerLimit=30
	ActiveMessage="has their strength and fortitude sapped!"
	OffMessage="recovers from the Tarunda debuff."

obj/Skills/Buffs/SlotlessBuffs/DemiFiend/Tarunda
	applyToTarget = new/obj/Skills/Buffs/SlotlessBuffs/DemiFiend/TarundaApply
	AffectTarget=1
	EndYourself=1
	Range=12
	Cooldown=60
	ActiveMessage="saps the target's strength and fortitude!"
	verb/Tarunda()
		set category="Skills"
		if(!usr.Target || usr.Target==usr)
			usr << "You need to target someone else."
			return
		if(!altered)
			adjust(usr)
			applyToTarget?:adjust(usr)
		src.Trigger(usr)

obj/Skills/Buffs/SlotlessBuffs/DemiFiend/SukundaApply
	SpdMult=0.75
	OffMult=0.75
	DefMult=0.75
	TimerLimit=30
	ActiveMessage="has their speed, offense, and defense reduced!"
	OffMessage="recovers from the Sukunda debuff."

obj/Skills/Buffs/SlotlessBuffs/DemiFiend/Sukunda
	applyToTarget = new/obj/Skills/Buffs/SlotlessBuffs/DemiFiend/SukundaApply
	AffectTarget=1
	EndYourself=1
	Range=12
	Cooldown=60
	ActiveMessage="reduces the target's speed, offense, and defense!"
	verb/Sukunda()
		set category="Skills"
		if(!usr.Target || usr.Target==usr)
			usr << "You need to target someone else."
			return
		if(!altered)
			adjust(usr)
			applyToTarget?:adjust(usr)
		src.Trigger(usr)

obj/Skills/Buffs/SlotlessBuffs/DemiFiend/RakundaApply
	EndMult=0.75
	TimerLimit=30
	ActiveMessage="has their endurance sapped!"
	OffMessage="recovers from the Rakunda debuff."

obj/Skills/Buffs/SlotlessBuffs/DemiFiend/Rakunda
	applyToTarget = new/obj/Skills/Buffs/SlotlessBuffs/DemiFiend/RakundaApply
	AffectTarget=1
	EndYourself=1
	Range=12
	Cooldown=60
	ActiveMessage="saps the target's endurance!"
	verb/Rakunda()
		set category="Skills"
		if(!usr.Target || usr.Target==usr)
			usr << "You need to target someone else."
			return
		if(!altered)
			adjust(usr)
			applyToTarget?:adjust(usr)
		src.Trigger(usr)
