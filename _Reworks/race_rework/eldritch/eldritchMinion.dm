
/obj/Skills/Utility/Eldritch_Minion

//not used anywhere because i got tired
mob/proc/summonEldritchMinion(dmg=0.05, tier=1)
    if(length(MonkeySoldiers.monkeySoldiers) < tier)
        MonkeySoldiers.monkeySoldiers += new/mob/MonkeySoldier/EldritchMinion(src, dmg, src.getTotalMagicLevel() * 10)
        blobLoop += MonkeySoldiers.monkeySoldiers[length(MonkeySoldiers.monkeySoldiers)]

/mob/MonkeySoldier/EldritchMinion
    New(mob/p, dmg, timer)
        ..(p, dmg, timer)
        //get icon 