/*
Mentor Angels will have 4 tiers of styles:
t1: Selfless State
t2: Ultra Instinct (In-Training)
t3: Perfected Ultra Instinct
t4: Permanent Ultra Instinct

Guardian Angels should gain buffs that equip them with the Armor of God:

t1: the Belt of Truth
t2: the Breastplate of Righteousness and the Sandals of the Gospel of Peace,
t3: the Helmet of Salvation and the Shield of Faith
t4: the Sword of the Spirit (the Word of God)


These will be considered Sagas for Angels but lack 6 tiers.
*/

mob/proc/GrantGuardianItem(path)
	if(!path) return
	var/obj/Items/I = locate(path) in src.contents
	if(!I)
		I = new path
		I.Move(src)
		I.AlignEquip(src)
		src << "<font color='#bfefff'><b>[I.name]</b> manifests in radiant light!</font>"
	else
		I.AlignEquip(src)
//no ascensions
/obj/Items/Sword/Guardian/Sword_of_the_Saint
	passives = list()
	Class = "Medium"
	SubType = "Weapons"
	DamageEffectiveness=1.05
	AccuracyEffectiveness=0.85
	SpeedEffectiveness=1.15
	ShatterCounter=800
	ShatterMax=800
	Ascended = 1
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Sword of the Saint"
	desc = "The Saint’s dulled edge that keeps the peace."
	icon = 'Samurai_sword_3.dmi'
//ascension 1
/obj/Items/Wearables/Guardian/Belt_of_Truth
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Belt of Truth"
	desc = "A radiant girdle that binds the wearer's soul to truth."
	icon = 'MachoBrace.dmi'
//ascension 2
/obj/Items/Armor/Guardian/Breastplate_of_Righteousness
	passives = list("Juggernaut" = 0.25, "Steady" = 0.5)
	Ascended = 2
	Class = "Medium"
	SubType = "Armor"
	DamageEffectiveness=0.75
	AccuracyEffectiveness=0.95
	SpeedEffectiveness=0.85
	ShatterCounter=800
	ShatterMax=800
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Breastplate of Righteousness"
	desc = "A shining cuirass that shields the heart with virtue."
	icon = 'ArmorLight-White.dmi'
/obj/Items/Wearables/Guardian/Sandals_of_Peace
	passives = list("MovemementMastery" = 2, "Purity" = 1)
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Sandals of the Gospel of Peace"
	desc = "Winged sandals that carry serenity wherever you tread."
	icon = 'shoes_mono.dmi'
//ascension 3
/obj/Items/Wearables/Guardian/Helmet_of_Salvation
	passives = list("DebuffResistance" = 0.5, "VenomResistance" = 0.5, "Anaerobic" = 0.25)
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Helmet of Salvation"
	desc = "A helm of light that guards the mind with divine insight."
	icon = 'goldsaintlibra_helmet.dmi'
/obj/Items/Wearables/Guardian/Shield_of_Faith
	Techniques = list(new/obj/Skills/Buffs/SpecialBuffs/Aphotic_Shield)
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Shield of Faith"
	desc = "A radiant shield forged from unwavering belief."
	icon = 'Shield of Faith.dmi'
//ascension 4
/obj/Items/Sword/Guardian/Sword_of_the_Spirit
	Techniques = list(new/obj/Skills/Buffs/SpecialBuffs/The_Ten_Commandments, new/obj/Skills/Buffs/SlotlessBuffs/Autonomous/The_Word_Of_God)
	passives = list()
	Class = "Medium"
	SubType = "Weapons"
	DamageEffectiveness=1.1
	AccuracyEffectiveness=0.95
	SpeedEffectiveness=1.25
	ShatterCounter=800
	ShatterMax=800
	Ascended = 3
	Augmented = 1
	Stealable = 0
	Destructable = 0
	name = "Sword of the Spirit (The Word of God)"
	desc = "The Word made blade - the Spirit’s edge that severs falsehood."
	icon = 'Samurai_sword_3.dmi'



//MENTOR ANGEL STUFF UNDER THIS POINT. DO NOT CALL FAVORITISM BECAUSE IT GOT DONE FIRST!!!! THIS WAS A COMMAND BY OUR DIVINE OVERLORD!
/obj/Skills/Buffs/NuStyle/UnarmedStyle/AngelStyles
	Selfless_State //placeholder because I might implement the Demon Slayer thing. basically baby UI
		Copyable=0
		passives = list("Flow" = 2, "Deflection" = 1, "Soft Style" = 1)
		NeedsSword=0
		StyleSpd=1.15
		StyleDef=1.15
		Finisher = "/obj/Skills/Queue/Finisher/Instinct_Palm"
		IconLock='AuraMysticBig.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		SagaSignature = 1
		SignatureTechnique=1
		NoSword=1
		StyleActive="Selfless State"
		verb/Selfless_State()
			set hidden=1
			src.Trigger(usr)
	Incomplete_Ultra_Instinct
		Copyable=0
		passives = list("Deflection" = 1, "Soft Style" = 1, "Flow" = 3, "Instinct" = 1, "CounterMaster" = 1)
		NeedsSword=0
		StyleSpd=1.25
		StyleOff=1.15
		StyleDef=1.25
		Finisher = "/obj/Skills/Queue/Finisher/Instinct_Palm"
		IconLock='AuraMysticBig.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		SagaSignature = 1
		SignatureTechnique=2
		NoSword=1
		StyleActive="Ultra Instinct (In-Training)"
		verb/Incomplete_Ultra_Instinct()
			set hidden=1
			src.Trigger(usr)
	Ultra_Instinct
		Copyable=0
		passives = list("Flow" = 2, "Deflection" = 1, "Soft Style" = 1, "Flow" = 3, "Instinct" = 3, "CounterMaster" = 3, "Godspeed" = 1)
		NeedsSword=0
		StyleSpd=1.5
		StyleOff=1.5
		StyleDef=1.5
		Finisher = "/obj/Skills/Queue/Finisher/Heavenly_Palm_Transcendence"
		IconLock='GentleDivine.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		SagaSignature = 1
		SignatureTechnique=3
		NoSword=1
		StyleActive="Ultra Instinct (Complete)"
		verb/Ultra_Instinct()
			set hidden=1
			src.Trigger(usr)
	Perfected_Ultra_Instinct //I hope this is as gorked as I intend it on being.
		Copyable=0
		passives = list("Deflection" = 1, "Soft Style" = 1, "LikeWater" = 4, "Flow" = 4, "Instinct" = 4, "CounterMaster" = 5, "Godspeed" = 1)
		NeedsSword=0
		StyleSpd=1.75
		StyleOff=1.75
		StyleDef=1.75
		Finisher = "/obj/Skills/Queue/Finisher/Heavenly_Palm_Transcendence"
		IconLock='GentleDivine.dmi'
		IconLockBlend=4
		LockX=-32
		LockY=-32
		SagaSignature = 1
		SignatureTechnique=4
		NoSword=1
		StyleActive="Perfected Ultra Instinct"
		verb/Perfected_Ultra_Instinct()
			set hidden=1
			src.Trigger(usr)