race
	eldritch
		name = "Eldritch"
		desc = "Distant thoughts, either a dream or a nightmare, made manifest within the soul of a living being. They are chaotic and unstable, only able to imitate mortal life and individuality."
		visual = 'Eldritch.png'

		passives = list("VenomResistance" = 0.25, "Void" = 1, "SoulFire" = 0.25, "DeathField" = 0.5, "VoidField" = 0.5)
		locked = TRUE
		strength = 1.5
		endurance = 2
		speed = 1
		force = 1.5
		offense = 1.5
		defense = 1.5
		regeneration = 2.5
		anger = 1
		intellect = 1.5
		imagination = 0.67
		skills = list(/obj/Skills/Utility/Telepathy, /obj/Skills/Teleport/Traverse_Depths,/obj/Skills/Buffs/SpecialBuffs/FadeIntoShadows)

		onFinalization(mob/user)
			..()
			user.Secret="Eldritch"
			user.giveSecret("Eldritch")
			user.secretDatum.nextTierUp = 999