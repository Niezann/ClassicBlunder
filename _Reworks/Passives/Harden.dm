globalTracker/var/HARDEN_MAX_ADD = 0.5;
globalTracker/var/HARDEN_MAX_BOON = 5;

//TODO AFTER WIPE: move other harden globalTrackers here
mob/proc
    //This is used in GetEnd()
    getHardenMult()
        if(!src.GetHardening()) return 1;//Just for safety, this math shouldn't happen if you don't have the Harden passive
        var/maxHardenAdd = (src.GetHardening() * src.getMaxHardenMult());
        var/addPerStack = (maxHardenAdd / glob.MAX_HARDEN_STACKS);
        . = 1;
        . += (src.Harden * addPerStack);
    
    getMaxHardenMult()
        . = (glob.HARDEN_MAX_ADD/glob.HARDEN_MAX_BOON)
    
    //This is used in applySoftCC()
    HardenAccumulate(acu)//acu is the enemy's accupuncture passive
        if(acu && prob(acu * glob.ACUPUNCTURE_BASE_CHANCE))
            src.Harden = clamp(src.Harden - acu/glob.ACUPUNCTURE_DIVISOR, 0 , passive_handler["Relentlessness"] ? 100 : glob.MAX_HARDEN_STACKS)
        else
            if(prob(glob.BASE_HARDENING_CHANCE * src.GetHardening()))
                src.Harden = clamp(src.Harden + 1 + src.GetHardening()/glob.HARDEN_DIVISOR, 0, passive_handler["Relentlessness"] ? 100 : glob.MAX_HARDEN_STACKS)