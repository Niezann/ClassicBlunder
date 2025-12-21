globalTracker/var/DISARM_COOLDOWN = 10

mob/var/tmp/lastDisarm=0;
mob/var/tmp/disarm_timer=-10;

mob/proc/DisarmTarget(mob/target)
    if(target.lastDisarm < world.time+(glob.DISARM_COOLDOWN*10))
        src.Disarm(target);

var/disarm_timer = 0//TODO BETWEEN WIPES remove this variable. It is a global variable. This can't be intended behavior


/mob/proc/Disarm(mob/target)
    if(target.EquippedSword() || target.EquippedStaff())
        target.passive_handler.Set("Disarmed", 1);
        target.lastDisarm = world.time;
        target.disarm_timer = src.UsingGladiator() * glob.DISARM_TIMER;
        target << "You've been disarmed!"
    else
        target.Crippled += 10;


/mob/proc/DisarmTick()
    src.disarm_timer--
    if(src.disarm_timer <= 0)
        src.disarm_timer=0;
        if(src.passive_handler["Disarmed"])
            src.passive_handler.Set("Disarmed", 0)
            src << "You regain control of your weapon."
            

