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
