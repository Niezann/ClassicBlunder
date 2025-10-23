/obj/Items/Demon_Summoning/ArsGoetia
	name = "Ars Goetia"
	icon = 'Icons/NSE/Icons/Thot_book.dmi'
	var/BloodSacrifice
	var/BloodSacrificeCD
	var/AbsurdSummonCD
	verb/Blood_Sacrifice(mob/M in get_step(usr, usr.dir))
		set name = "Blood Sacrifice"
		set category = "Skills"
		if(!M.KO)
			usr << "[M] needs to be KO'd!"
			return
		if(src.BloodSacrificeCD < world.realtime )
			src.BloodSacrifice+= 1
			M.BPPoison=0.5
			M.MortallyWounded+=1
			M.DoDamage(M, 100)
			M.TotalInjury+=85
			src.BloodSacrificeCD = world.realtime + 4 HOURS
		else
			usr << "You're on cooldown till [time2text(src.BloodSacrificeCD, "hh:ss") ]"
	verb/Summon_Demon()
		set name= "Summon Demon"
		set category = "Utility"
		var/mob/Choice
		if(src.Using)
			return
		if(!usr.Move_Requirements()||usr.KO)
			return
		if(world.realtime<src.AbsurdSummonCD)
			usr << "It's too soon to use this!  ([round((src.AbsurdSummonCD-world.realtime)/Hour(1), 0.1)] hours)"
			return
		src.Using=1

		var/Cost=1

		if(!src.BloodSacrifice)
			usr << "You don't have enough capacity to summon an otherworldly entity!  It takes [Cost] sacrifice to summon a demon."
			src.Using=0
			return

		switch(input(usr, "Summoning this otherworldly entity requires you to inflict or take a mortal wound. Are you sure you want to do it?", "Summon Demon") in list("Yes","No"))
			if("No")
				src.Using=0
				return

		var/Failure=0
		var/Invocation=input(usr, "What True Name do you attempt to invoke?", "Summon Demon") as text
		if(Invocation in glob.trueNames)
			var/Found=0
			for(var/mob/Players/m in world)
				if(m.TrueName==Invocation)
					Found=1
					Choice=m
					break

			if(!Found)
				OMsg(usr, "[usr] invoked a True Name properly, but the being slumbers currently...")
				src.Using=0
				return

		else
			Failure=1
			OMsg(usr, "[usr] attempted to invoke a True Name of no existing being!")




		if(!Failure)
			var/Delay = input(src, "You are being summoned by [usr]! This process cannot be resisted, but you CAN delay it by a minute if you want to finish up whatever you're doing.") in list("Delay", "Go")
			if(Delay=="Delay")
				spawn(60)
					OMsg(Choice, "[Choice] suddenly vanishes.")
					Choice.loc=locate(usr.x, usr.y-1, usr.z)
				spawn()
					for(var/x=0, x<5, x++)
						LightningBolt(Choice)
						sleep(3)
			if(Delay=="Go")
				OMsg(Choice, "[Choice] suddenly vanishes.")
				Choice.loc=locate(usr.x, usr.y-1, usr.z)
				spawn()
					for(var/x=0, x<5, x++)
						LightningBolt(Choice)
						sleep(3)
			OMsg(usr, "[usr] invokes the True Name of [Choice] to compel them to appear!")
		else
			OMsg(usr, "[usr] does not invoke the True Name of [Choice] properly.")
		src.BloodSacrifice--
		src<<"You have [src.BloodSacrifice] sacrifices left stored in the Ars Goetia."
		src.AbsurdSummonCD=world.realtime+Day(1)
		src.Using=0
		return