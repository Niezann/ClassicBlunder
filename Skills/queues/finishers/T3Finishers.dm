/obj/Skills/Queue/Finisher
    Be_Water
        Stunner = 3
        HarderTheyFall = 4
        SweepStrike = 4
        Finisher = 2
        Combo = 25
        Instinct = 2
        InstantStrikes=2
        DamageMult = 0.2
        Quaking=25
        FollowUp="/obj/Skills/AutoHit/True_One_Inch_Punch"
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Intercepting_Fist"
        BuffAffected = "/obj/Skills/Buffs/SlotlessBuffs/Autonomous/Debuff/Death_Mark"
        HitMessage="looks <i>locked in</i>."

    Big_Boot
        Instinct=2
        Grapple=1
        KBMult=0.001
        SweepStrike=6
        Crushing = 100
        Stunner = 2
        DamageMult = 6
        UnarmedOnly=1
        GrabTrigger="/obj/Skills/Grapple/Tombstone_Piledriver"
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/The_8th_Wonder_Of_The_World"
        HitMessage="places their foot to the face of their fellow wrestler!"
    Erupting_Mugen_Tengenkotsu
        KBMult=7
        KBAdd = 8
        Quaking=9
        DamageMult=10
        HitSparkIcon='fevExplosion.dmi'
        HitSparkX=-32
        HitSparkY=-32
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Legendary_Exhaustion"
        HitMessage="unleashes their pent up legendary power, quaking all of reality with their might!"

    Soul_Seller
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/True_Form/Demon"
        FollowUp="/obj/Skills/AutoHit/Minor_Reality_Corruption"
        HitMessage = "sells their soul for a brief boost to power!"
    Atomic_Dismantling
        FollowUp="/obj/Skills/AutoHit/Atomic_Dismantling"
        BuffAffected="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Dismantled"
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Magnetism"
        HitMessage = "takes apart their foe's defense atomically!"

    Jumbled_Line_Up //Acrobat
        Combo=10
        DamageMult=0.3
        FollowUp="/obj/Skills/Projectile/ThreeShot_Path"
        HitMessage = "hurls skyward a cascade of blades!"
    Clear_Water //Two Heavens as One
        DamageMult=6
        HitSparkIcon='Slash - Zan.dmi'
        HitSparkX=-32
        HitSparkY=-32
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Kensei"
        HitMessage = "ushers in absolute serenity with a humble slash..."
    Divine_Wrath //Fierce Diety
        HarderTheyFall=4
        Stunner=4
        KBMult = 0.0001
        FollowUp="/obj/Skills/AutoHit/Divine_Cleave"
        DamageMult = 1
        Decider = 6
        BuffSelf="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Indomitable_Will"
        BuffAffected="/obj/Skills/Buffs/SlotlessBuffs/Autonomous/QueueBuff/Finisher/Fimbulwinter"
        HitMessage= "unleashes the Fury of the Heavens!"