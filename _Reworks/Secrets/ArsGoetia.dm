/obj/Items/Demon_Summoning/ArsGoetia
	name = "Ars Goetia"
	icon = 'Icons/NSE/Icons/Thot_book.dmi'
	var/BloodSacrifice=3
	var/BloodSacrificeCD
	var/DemonSummonCD
	var/DemonRevivalCD
	var/GoetiaOwner
	var/OwnerPassword
/*	verb/Claim_Ownership() //unfinished
		set name= "Ars Goetia: Claim Ownership"
		set category = "Ars Goetia"
		if(!src.OwnerPassword)
			var/Confirm=alert(usr, "You can choose to forcibly claim ownership of the Ars Goetia in exchange for incredible demonic magic, as well as a demonic True Name that will function as a password. However, should anyone else claim ownership over it, you will die, and if it's stolen from you, they will be told your true name. Do you wish to sign this pact?", "Claim Ownership", "Yes", "No")
			if(Confirm=="Yes")
				src.Owner=usr
				usr.ArsGoetiaOwner=1
				user.TrueName=input(user, "As the owner of the Ars Goetia, you have a True Name. It should be kept secret. What is your True Name?", "Get True Name") as text
				src.OwnerPassword=usr.name
				user.client.updateCorruption()
				user.demon.selectPassive(user, "CORRUPTION_PASSIVES", "Buff", TRUE)
				user.demon.selectPassive(user, "CORRUPTION_DEBUFFS", "Debuff")
		else*/
	verb/Blood_Sacrifice(mob/M in get_step(usr, usr.dir))
		set name = "Blood Sacrifice"
		set category = "Ars Goetia"
		if(!M.KO)
			usr << "[M] needs to be KO'd!"
			return
		if(src.BloodSacrificeCD < world.realtime )
			src.BloodSacrifice+= 1
			M.BPPoison=0.5
			M.MortallyWounded+=1
			M.DoDamage(M, 100)
			M.TotalInjury+=85
			src.BloodSacrificeCD = world.realtime + 24 HOURS
		else
			usr << "You're on cooldown till [time2text(src.BloodSacrificeCD, "hh:ss") ]"
	verb/Summon_Demon()
		set name= "Summon Demon"
		set category = "Ars Goetia"
		var/mob/Choice
		if(src.Using)
			return
		if(!usr.Move_Requirements()||usr.KO)
			return
		if(world.realtime<src.DemonSummonCD)
			usr << "It's too soon to use this!  ([round((src.DemonSummonCD-world.realtime)/Hour(1), 0.1)] hours)"
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




		if(!Failure) //wanna do something cool with this but I think I'll just have it straight up summon someone atm
		//	Choice.AddSkill(S)
			Choice<<"<b>You are being summoned by [usr] using the Ars Goetia...</b>"
			spawn()
				for(var/x=0, x<5, x++)
					LightningBolt(Choice)
					sleep(3)
		src.BloodSacrifice--
		src<<"You have [src.BloodSacrifice] sacrifices left stored in the Ars Goetia."
		src.DemonSummonCD=world.realtime+Day(7)
		src.Using=0
		return
	verb/Revive_Demon(mob/A in players)
		set name= "Summon Demon"
		set category = "Ars Goetia"
		if(src.Using)
			return
		if(!usr.Move_Requirements()||usr.KO)
			return
		src.Using=1

		var/Cost=3

		if(src.BloodSacrifice<3)
			usr << "You don't have enough capacity to revive an otherworldly entity!  It takes [Cost] sacrifices to revive someone."
			src.Using=0
			return
		if(A.isRace(DEMON))
			A.loc=locate(usr.x, usr.y-1, usr.z)
			A.Revive()
			src.BloodSacrifice-=3
			src<<"You have [src.BloodSacrifice] sacrifices left stored in the Ars Goetia."
			OMsg(usr, "INSERT COOL FLAVOR TEXT HERE")
			src.Using=0
			src.DemonRevivalCD=world.realtime+Day(1)
		else
			usr<<"This can only be used on Demons."
			return
obj/Skills/Buffs/SlotlessBuffs/Autonomous/Beckoned
	AlwaysOn=1
	TimerLimit=30
	ActiveMessage="starts to fade in and out of reality..."
	OffMessage="suddenly vanishes."
	Cooldown=-1
	WarpZone=1
/*	WarpX=1
	WarpY=1
	WarpZ=1*/