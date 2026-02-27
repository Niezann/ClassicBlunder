/ascension/sub_ascension/eldritch/hunter
	passives = list("Duelist" = 0.6, "Brutalize" = 0.6, "GiantSwings"=1)
/ascension/sub_ascension/eldritch/eternal
	passives = list("EnergySteal" = 3, "Pressure" = 1, "Siphon" = 0.6)
/ascension/sub_ascension/eldritch/writhing
	passives = list("Extend" = 1, "Gum Gum" = 1, "FluidForm" = 1)

ascension
	eldritch
		one
			unlock_potential = ASCENSION_ONE_POTENTIAL
			choices = list("Hunter" = /ascension/sub_ascension/eldritch/hunter, "Eternal" = /ascension/sub_ascension/eldritch/eternal, "Writhing" = /ascension/sub_ascension/eldritch/writhing)
			endurance = 0.25
			defense = 0.25
			speed = 0.25
			passives = list("DebuffResistance" = 0.5, "SoulFire" = 0.25, "DeathField" = 2.5, "VoidField" = 2.5, "PureDamage"=1, "PureReduction"=1, "BlockChance"=5, "BuffMastery"=1)
			on_ascension_message = "Your dreams are twisted by chaos... What do you dream of?"
			postAscension(mob/owner)
				owner.secretDatum.tierUp(2, owner)

				switch(owner.race.ascensions[1].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						owner.race.ascensions[3].choices.Remove("Hunter");
					if(/ascension/sub_ascension/eldritch/eternal)
						owner.race.ascensions[3].choices.Remove("Eternal");
					if(/ascension/sub_ascension/eldritch/writhing)
						owner.race.ascensions[3].choices.Remove("Writhing");

				owner.race.ascensions[3].choices.Remove(owner.race.ascensions[1].choiceSelected)//remove subasc from future pick
				..()
		two
			unlock_potential = ASCENSION_TWO_POTENTIAL
			endurance = 0.25
			defense = 0.25
			speed = 0.25
			passives = list("DebuffResistance" = 0.5, "SoulFire" = 0.5, "DeathField" = 2.5, "VoidField" = 2.5, "PureDamage"=1, "PureReduction"=1, "BlockChance"=5, "BuffMastery"=1)
			on_ascension_message = "Your delusions are embraced by mayhem..."
			onAscension(mob/owner)
				switch(owner.race.ascensions[1].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						src.passives["Duelist"] = 0.6;
						src.passives["Brutalize"] = 0.6;
					if(/ascension/sub_ascension/eldritch/eternal)
						src.passives["EnergySteal"] = 3;
						src.passives["Pressure"] = 1;
						src.passives["Siphon"] = 0.6;
				..();
				
			postAscension(mob/owner)
				owner.secretDatum.tierUp(3, owner)
				..()
		three
			unlock_potential = ASCENSION_THREE_POTENTIAL
			choices = list("Hunter" = /ascension/sub_ascension/eldritch/hunter, "Eternal" = /ascension/sub_ascension/eldritch/eternal, "Writhing" = /ascension/sub_ascension/eldritch/writhing)
			strength = 0.25
			endurance = 0.25
			force = 0.25
			offense = 0.25
			defense = 0.25
			speed = 0.25
			enhanceChips = 14;
			passives = list("MovementMastery"=2, "DebuffResistance" = 0.5, "SoulFire" = 1, "DeathField" = 2.5, "VoidField" = 2.5, "PureDamage"=1, "PureReduction"=1, "BlockChance"=5, "CriticalBlock"=0.1, "BuffMastery"=1)
			on_ascension_message = "Your fantasies are bleeding entropy... But what fantasy do you chase?"
			onAscension(mob/owner)
				switch(owner.race.ascensions[1].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						src.passives["Duelist"] = 0.6;
						src.passives["Brutalize"] = 0.6;
					if(/ascension/sub_ascension/eldritch/eternal)
						src.passives["EnergySteal"] = 3;
						src.passives["Pressure"] = 1;
						src.passives["Siphon"] = 0.6;
				..();
			postAscension(mob/owner)
				owner.secretDatum.tierUp(4, owner)
				//there aren't future picks, but if there were, the remove code would have to go here
				..()
		four
			unlock_potential = ASCENSION_FOUR_POTENTIAL
			strength = 0.25
			endurance = 0.25
			force = 0.25
			offense = 0.25
			defense = 0.25
			speed = 0.25
			passives = list("DebuffResistance" = 0.5, "SoulFire" = 1, "DeathField" = 2.5, "VoidField" = 2.5, "PureDamage"=1, "PureReduction"=1, "BlockChance"=5, "CriticalBlock"=0.1, "BuffMastery"=1)
			on_ascension_message = "Your illusory self is beginning to fray at the edges.\nYou can't keep manifesting like this forever...Can you...?"
			onAscension(mob/owner)
				switch(owner.race.ascensions[1].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						src.passives["Duelist"] = 0.6;
						src.passives["Brutalize"] = 0.6;
					if(/ascension/sub_ascension/eldritch/eternal)
						src.passives["EnergySteal"] = 3;
						src.passives["Pressure"] = 1;
						src.passives["Siphon"] = 0.6;
				switch(owner.race.ascensions[3].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						src.passives["Duelist"] = 1.2;
						src.passives["Brutalize"] = 1.2;
					if(/ascension/sub_ascension/eldritch/eternal)
						src.passives["EnergySteal"] = 6;
						src.passives["Pressure"] = 2;
						src.passives["Siphon"] = 0.6
					if(/ascension/sub_ascension/eldritch/writhing)
						src.passives["Extend"] = 1;
						src.passives["Gum Gum"] = 1;
				..();
			postAscension(mob/owner)
				owner.secretDatum.tierUp(5, owner)
				..()
		five
			unlock_potential = ASCENSION_FIVE_POTENTIAL
			strength = 0.25
			endurance = 0.25
			force = 0.25
			offense = 0.25
			defense = 0.25
			speed = 0.25
			passives = list("DebuffReversal" = 1, "SoulFire" = 2, "DeathField" = 2.5, "VoidField" = 2.5, "PureDamage"=1, "PureReduction"=1, "BlockChance"=5, "CriticalBlock"=0.1, "BuffMastery"=1)
			on_ascension_message = "You are."
			onAscension(mob/owner)
				switch(owner.race.ascensions[1].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						src.passives["Duelist"] = 0.6;
						src.passives["Brutalize"] = 0.6;
					if(/ascension/sub_ascension/eldritch/eternal)
						src.passives["EnergySteal"] = 3;
						src.passives["Pressure"] = 1;
						src.passives["Siphon"] = 0.6;
				switch(owner.race.ascensions[3].choiceSelected)
					if(/ascension/sub_ascension/eldritch/hunter)
						src.passives["Duelist"] = 1.2;
						src.passives["Brutalize"] = 1.2;
					if(/ascension/sub_ascension/eldritch/eternal)
						src.passives["EnergySteal"] = 6;
						src.passives["Pressure"] = 2;
						src.passives["Siphon"] = 0.6
					if(/ascension/sub_ascension/eldritch/writhing)
						src.passives["Extend"] = 1;
						src.passives["Gum Gum"] = 1;
				..();
			postAscension(mob/owner)
				owner.secretDatum.tierUp(6, owner)
				..()
		six 
			unlock_potential = ASCENSION_SIX_POTENTIAL
			strength = 0.25
			endurance = 0.75
			force = 0.25
			offense = 0.25
			defense = 0.75
			speed = 0.75
			passives = list("DebuffReversal" = 1, "PureDamage"=5, "BlockChance"=25, "CriticalBlock"=0.25, "BuffMastery"=5, "GiantSwings"=1, "Extend"=1, "Gum Gum"=1, "Pressure"=2, "Siphon"=2, "Brutalize"=2, "Null"=2)
			on_ascension_message = "...unfortunately. ᚾᛁᛖᛊ   ᚾᛜ   ᛖᚣⲔᛊ   ᚾᚺᚣᚾ   ᚣ   ᚹᚱᛜᛒᚳᛊᛖ   ᚪᛜᚱ   ᛊꓦᛊᚱᛉᛜᚢᛊ   ᛊᚳᛢᛊ ᛫"
			postAscension(mob/owner)
				owner.secretDatum.tierUp(7, owner)
				..()
