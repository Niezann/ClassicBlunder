obj/Skills/Buffs/NuStyle/Legendary
	Legendary_Stance
		SignatureTechnique=1
		Copyable=0
		StyleEnd=1.15
		StyleStr=1.3
		Enlarge = 1.25
		passives = list("GiantForm" = 1, "DoubleStrike" = 1, "Fa Jin" = 2, "Momentum" = 1, "Hard Style"=1, "Instinct"=2, "Juggernaut" = 1, "PureReduction" = 1,\
						"SweepingStrike" = 1, "Meaty Paws" = 1, "Brutalize" = 1, "LegendarySaiyan" = 1 )
		StyleActive="Legendary Stance"
		Finisher="/obj/Skills/Queue/Finisher/Tengenkotsu"
		verb/Legendary_Stance()
			set hidden=1
			src.Trigger(usr)
	Legacy_Of_The_Fabled_King
		SignatureTechnique=2
		Copyable=0
		StyleEnd=1.25
		StyleStr=1.35
		Enlarge = 1.5
		passives = list("GiantForm" = 1, "DoubleStrike" = 2, "Fa Jin" = 2, "Momentum" = 2, "Hard Style"=1, "Instinct"=3, "Juggernaut" = 1, "PureDamage" = 0.5, "PureReduction" = 1.5,\
						"NoDodge" = 1, "SweepingStrike" = 1, "Brutalize" = 2, "Meaty Paws" = 1.5, "KiControlMastery" = 1,"LegendarySaiyan"=1)
		StyleActive="Legacy Of The Fabled King"
		Finisher="/obj/Skills/Queue/Finisher/Mugen_Tengenkotsu"
		verb/Fabled_King_Stance()
			set hidden=1
			src.Trigger(usr)
	True_Fist_Of_The_Fabled_King
		SignatureTechnique=3
		Copyable=0
		StyleEnd=1.5
		StyleStr=1.5
		Enlarge = 1.75
		passives = list("GiantForm" = 1, "DoubleStrike" = 3, "Fa Jin" = 2, "Momentum" = 3, "Hard Style"=1, "Instinct"=4, "Juggernaut" = 1, "PureDamage" = 1, "PureReduction" = 2,\
						"NoDodge" = 1, "SweepingStrike" = 1, "Brutalize" = 2, "Meaty Paws" = 1.5, "KiControlMastery" = 2,"LegendarySaiyan"=1, "Pride"=1, "Zeal"=1, "Honor"=1)
		StyleActive="Fist Of The Fabled King (True)"
		Finisher="/obj/Skills/Queue/Finisher/Erupting_Mugen_Tengenkotsu"
		verb/Fist_Of_The_Fabled_King_Stance()
			set hidden=1
			src.Trigger(usr)
/mob/Admin3/verb/GiveLegendary()
	var/mob/p = input(src, "Who?") in players
	p << "You have become a Legendary Super Saiyan."
	p.AddSkill(new/obj/Skills/Buffs/NuStyle/Legendary/Legendary_Stance)
	p.passive_handler.Increase("Fabled King", 1)
	p.passive_handler.Increase("True Inheritor", 1)
	p.passive_handler.Increase("Duren", 1)
	p.AngerMessage="grasps the sun."