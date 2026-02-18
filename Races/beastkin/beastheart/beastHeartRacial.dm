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
	// since grit won't b used elsewhere i could just make it consume the grit on active, but that is sloppy
	// otherwise i can replace the usesX vars and make it 1 variable BUT I AM LAZY AS HELL
	BuffName = "The Grit"
	Cooldown = -1
	NeedsHealth = 50
	ActiveMessage = "channels their grit and prepares for the next attack!"
	ResourceCost = list("Grit", 999) // consumes all grit on use
	adjust(mob/p)
		var/currentGrit = p.passive_handler["Grit"]
		currentGrit/=10
		VaizardHealth = 10+ currentGrit
		BuffName = "The Grit"
	verb/The_Grit()
		set category = "Skills"
		adjust(usr)
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
    //At max asc, and lowest health bracket, heals 1% for 20 seconds
    //Ascs lower the threshold for brackets
    proc/getRegenRate(mob/p)
        var/amt = clamp(p.AscensionsAcquired*10, 10, 25);
        var/timer = p.AscensionsAcquired >= 3 ? clamp(10 - (p.AscensionsAcquired-1), 5, 10) : 10;
        HealthHeal = amt/timer;
        WoundHeal = HealthHeal / 2;
        if(p.AscensionsAcquired>=6) timer *= 2;
    Trigger(mob/User, Override)
        getRegenRate(User)
        ..()