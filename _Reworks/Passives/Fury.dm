globalTracker/var/FURY_MAX_ADD = 0.5;
globalTracker/var/FURY_ANGER_EFFECT = 2;
//TODO AFTER WIPE: move other fury globalTrackers here
mob/proc
    //This is used in GetSpd()
    getFuryMult()
        if(!src.passive_handler.Get("Fury")) return 1;//Just for safety, this math shouldn't happen if you don't have the fury passive
        var/maxFuryAdd = (src.passive_handler.Get("Fury") * src.getMaxFuryMult());
        var/addPerStack = (maxFuryAdd / glob.MAX_FURY_STACKS / glob.FURY_ANGER_EFFECT);
        if(src.Anger) addPerStack *= glob.FURY_ANGER_EFFECT;
        . = 1;
        . += (src.Fury * addPerStack);
    
    getMaxFuryMult()
        . = (glob.FURY_MAX_ADD/glob.FURY_MAX_BOON)
    
    //This is used in handlePostDamage()
    FuryAccumulate(acu)//acu is the enemy's accupuncture passive
        if(acu && prob(acu * glob.ACUPUNCTURE_BASE_CHANCE))
            Fury = clamp( Fury - acu/glob.ACUPUNCTURE_DIVISOR, 0 , passive_handler["Relentlessness"] ? 100 : glob.MAX_FURY_STACKS)
        else
            if(prob(glob.BASE_FURY_CHANCE * passive_handler["Fury"]))
                Fury = clamp(Fury + 1 + passive_handler["Fury"]/glob.FURY_DIVISOR, 0, passive_handler["Relentlessness"] ? 100 : glob.MAX_FURY_STACKS)