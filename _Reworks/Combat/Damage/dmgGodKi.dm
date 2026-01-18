/mob/proc/godKiModifiers(mob/defender, destructive)
	if(HasGodKi())
		. += GetGodKi() * 10
	if(defender.HasGodKi() && destructive < 2 )
		. -= defender.GetGodKi() * 10
	if(HasGodKi() && defender.HasEndlessNine() && destructive < 2 )
		. -= defender.GetEndlessNine() * 10
	if(defender.HasNull())
		. = 0;