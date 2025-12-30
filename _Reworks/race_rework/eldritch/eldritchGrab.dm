/mob/var/MagicTaken = 0; //holds a realtime

/mob/proc/HasMagicTaken()
	if(!src.MagicTaken) return 0 //if it has never been taken, nope
	if(src.MagicTaken < world.realtime) return 0; //if the time has elapsed, nope
	return 1; //otherwise, yes, it's been stolen

//Used in Grab_Effect()
/mob/proc/EldritchMagicSteal(mob/trg)
    //mechanics
    src.secretDatum.secretVariable["Power From Blood"]++;
    
    trg.MagicTaken = world.realtime + 3 DAYS;
    trg.TotalInjury=90;
    trg.TotalCapacity=100;
    trg.Unconscious(src, "has been debilitated by an unnatural harvesting!");
    src.TotalCapacity=0;
    src.ManaAmount=100;

    //visuals
    var/image/img = image(icon='Novabolt.dmi', pixel_x=-33, pixel_y=-33);
    trg.overlays.Add(img);

    KKTShockwave(M = trg, Size=1);
    KKTShockwave(M = trg, Size=2);
    KKTShockwave(M = trg, Size=3);
    spawn(12)
        LightningBolt(trg, 3);
        spawn(5)
        trg.overlays.Remove(img);

    //output
    OMsg(trg, "[trg]'s mana circuits have been harvested for [src]'s gain!", "[src]([src.key]) harvested [trg]([trg.key])'s mana circuits (Eldritch Secret).");
