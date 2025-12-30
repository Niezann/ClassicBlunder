#define DEFAULT_ELDRITCH_MINION_ICON 'Icons/Eldritch/EldritchMinion.dmi'
//TODO: remove this between wipes
//I rly didn't need a new object for this
//Its variables are just stored in True Form (buffX)
/obj/Skills/Utility/Eldritch_Minion

mob/proc/summonEldritchMinion(dmg=0.01, tier=1)
    if(length(MonkeySoldiers.monkeySoldiers) < tier)
        MonkeySoldiers.monkeySoldiers += new/mob/MonkeySoldier/EldritchMinion(src, dmg, src.getTotalMagicLevel() * 10)
        blobLoop += MonkeySoldiers.monkeySoldiers[length(MonkeySoldiers.monkeySoldiers)]

mob/proc/BrainBreakMinions(dmg=0.01, tier=6)
    while(length(MonkeySoldiers.monkeySoldiers) < tier)
        var/mob/MonkeySoldier/EldritchMinion/em = new/mob/MonkeySoldier/EldritchMinion(src, dmg, src.getTotalMagicLevel() * 10)
        em.loc = locate(src.Target.loc.x + rand(-3, 3), src.Target.loc.y + rand(-3,3), src.Target.loc.z);
        blobLoop += em;
        MonkeySoldiers.monkeySoldiers += em;

/mob/MonkeySoldier/EldritchMinion
    New(mob/p, dmg, timer)
        ..(p, dmg, timer)
        var/obj/Skills/Buffs/SlotlessBuffs/Eldritch/True_Form/tf = locate(/obj/Skills/Buffs/SlotlessBuffs/Eldritch/True_Form, p);
        if(!tf)
            DEBUGMSG("Error: Eldritch Minion attempted to be summoned by [p] without an Eldritch True Form.")
            del src;
            return;
        src.icon = tf.EldritchMinion;
        src.pixel_x = tf.MinionX;
        src.pixel_y = tf.MinionY;
        src.distanceLimit = max(5, (p.getTotalMagicLevel()/3));
    FlickAttack()
        ..();
        src.target.AddCrippling(max(1, src.owner.getTotalMagicLevel()/6), src.owner);
        src.loc = locate(src.target.loc.x + rand(-2, 2), src.target.loc.y + rand(-2,2), src.target.loc.z);
    