/mob/proc/AdjustGrit(option, val)
    var/maxGrit = 20 + (20 * AscensionsAcquired)
    switch(option)
        if("add")
            if(passive_handler["Grit"] + val <= maxGrit)
                passive_handler.Increase("Grit", round(val, 0.1))
        if("sub")
            if(passive_handler["Grit"] - val >= 1)
                passive_handler.Decrease("Grit", round(val, 0.1))
        if("reset")
            passive_handler["Grit"] = 1

/obj/Skills/Buffs/SlotlessBuffs/Racial/Beastkin/The_Grit
	BuffName = "The Grit"
	Cooldown = -1
	NeedsHealth = 50
	ActiveMessage = "channels their grit and prepares for the next attack!"
	ResourceCost = list("Grit", 999) // consumes all grit on use
	adjust(mob/p)
		var/currentGrit = p.passive_handler["Grit"]
		currentGrit/=10
		VaizardHealth = 10+ currentGrit
	verb/The_Grit()
		set category = "Skills"
		if(!usr.BuffOn(src)) adjust(usr)
		Trigger(usr)

/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Heart_of_the_Half_Beast
    TooMuchHealth = 30
    NeedsHealth = 10
    UnrestrictedBuff=1
    Cooldown=-1
    CooldownStatic=1
    CooldownScaling=1
    HealthHeal = 0.5
    StableHeal = 1
    TimerLimit = 10
    ActiveMessage="'s heart begins to pump into overdrive!"
    OffMessage="'s heart can't keep up..."
    proc/getRegenRate(mob/p)
        var/amt = clamp(10+(p.AscensionsAcquired*5), 10, 25);//ranges from 10 to 25
        var/timer = clamp(10-max(0, p.AscensionsAcquired-1), 5, 10);//Ranges from 10 to 5
        HealthHeal = amt / timer;
        WoundHeal = HealthHeal / 2;
        if(p.AscensionsAcquired>=6) timer *= 2;
    Trigger(mob/User, Override)
        getRegenRate(User)
        ..()