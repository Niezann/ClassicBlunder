/mob/proc/MultiStrike(secondStrike, thirdStrike, asuraStrike)
    if(!AttackQueue)
        var/dblProb = glob.DOUBLESTRIKECHANCE * GetDoubleStrike()
        var/tripleProb = glob.TRIPLESTRIKECHANCE * GetTripleStrike()
        var/asuraProb = glob.ASURASTRIKECHANCE * GetAsuraStrike()
        if(HasDoubleStrike())
            if(prob(dblProb + tripleProb + asuraProb) && !secondStrike)
                #if DEBUG_MELEE
                log2text("Double Strike", "Double Strike proc'd", "damageDebugs.txt", "[ckey]/[name]")
                #endif
                Melee1(SecondStrike=1)
            if(HasTripleStrike())
                if(prob(tripleProb + asuraProb) && !thirdStrike && secondStrike)
                    #if DEBUG_MELEE
                    log2text("Triple Strike", "Triple Strike proc'd", "damageDebugs.txt", "[ckey]/[name]")
                    #endif
                    Melee1(SecondStrike=1, ThirdStrike=1) // TODO come back to this, this is odd
                if(HasAsuraStrike())
                    if(prob(asuraProb) && !asuraStrike && thirdStrike && secondStrike)
                        #if DEBUG_MELEE
                        log2text("Asura Strike", "Asura Strike proc'd", "damageDebugs.txt", "[ckey]/[name]")
                        #endif
                        Melee1(SecondStrike=1, ThirdStrike=1, AsuraStrike=1)