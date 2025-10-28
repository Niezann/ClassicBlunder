/obj/Items/Demon_Summoning/ArsGoetia
	name = "Ars Goetia"
	icon = 'Icons/NSE/Icons/Thot_book.dmi'
	var/BloodSacrifice=3
	var/BloodSacrificeCD
	var/DemonSummonCD
	var/DemonRevivalCD
	var/GoetiaOwner
	var/OwnerPassword
	var/GoetiaNumber
	verb/Claim_Ownership()
		set name= "Ars Goetia: Claim Ownership"
		set category = "Ars Goetia"
		if(usr.ArsGoetiaOwner)
			usr<<"You already own this and have no need to claim it."
			return
		if(!src.OwnerPassword)
			var/Confirm=alert(usr, "You can choose to sell your soul to the Ars Goetia in exchange for incredible demonic magic, as well as a demonic True Name that will function as a password. However, should anyone else claim ownership over it, you will die, and if it's stolen from you, they will be know your true name. Do you wish to sign this pact? This is not required to summon or revive Demons.", "Claim Ownership", "Yes", "No")
			if(Confirm=="Yes")
				if(usr.isRace(DEMON)||usr.isRace(ELDRITCH))
					usr<<"Races native to the Depths cannot utilize or claim ownership over the Ars Goetia."
					return
				usr.TrueName=input(usr, "As the owner of the Ars Goetia, you have a True Name that functions as the password to open the book. It should be kept secret. What is your True Name?", "Get True Name") as text
				src.GoetiaOwner=usr.TrueName
				usr.ArsGoetiaOwner=1
				src.OwnerPassword=usr.TrueName
				usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/DemonMagic/DarkMagic)
				usr.passive_handler.Increase("Hellpower" = 0.25)
				usr.client.updateCorruption()
				usr.demon.selectPassive(usr, "CORRUPTION_PASSIVES", "Buff", TRUE)
				usr.demon.selectPassive(usr, "CORRUPTION_DEBUFFS", "Debuff")
		else
			var/AGPass=input(usr,"You must know the True Name of the original owner to claim ownership.") as text
			if(AGPass==src.OwnerPassword)
				if(usr.isRace(DEMON)||usr.isRace(ELDRITCH))
					usr<<"Races native to the Depths cannot claim ownership over the Ars Goetia."
					return
				for(var/mob/M in world)
					if(AGPass==M.TrueName)
						M.Death(src, "the Ars Goetia claiming their soul.")
						src.BloodSacrifice++
				usr.TrueName=input(usr, "As the owner of the Ars Goetia, you have a True Name that functions as the password to open the book. It should be kept secret. What is your True Name?", "Get True Name") as text
				src.GoetiaOwner=usr.TrueName
				usr.ArsGoetiaOwner=1
				src.OwnerPassword=usr.TrueName
				usr.AddSkill(new/obj/Skills/Buffs/SlotlessBuffs/DemonMagic/DarkMagic)
				usr.passive_handler.Increase("Hellpower" = 0.25)
				usr.client.updateCorruption()
				usr.demon.selectPassive(usr, "CORRUPTION_PASSIVES", "Buff", TRUE)
				usr.demon.selectPassive(usr, "CORRUPTION_DEBUFFS", "Debuff")
			else
				usr<<"You guessed incorrectly. The Ars Goetia doesn't appreciate intrusion."
				return

	verb/Blood_Sacrifice(mob/M in get_step(usr, usr.dir))
		set name = "Ars Goetia: Blood Sacrifice"
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
			M.HealthCut+=10
			src.BloodSacrificeCD = world.realtime + 24 HOURS
		else
			usr << "You're on cooldown till [time2text(src.BloodSacrificeCD, "hh:ss") ]"
	verb/Summon_Demon()
		set name= "Ars Goetia: Summon Demon"
		set category = "Ars Goetia"
		var/mob/Choice
		if(usr.isRace(DEMON)||usr.isRace(ELDRITCH))
			usr<<"Races native to the Depths cannot utilize or claim ownership over the Ars Goetia."
			return
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
					if(m.isRace(MAKAIOSHIN))
						usr<<"They are outside of your authority."
						OMsg(usr, "[usr] attempted to invoke the True Name of something they have no authority over, causing magical backlash.")
						usr.DoDamage(usr, 25)
						src.Using=0
						return
					if(m.isRace(CELESTIAL))
						usr<<"The demon they're connected to slumbers and cannot be awoken through mere magic alone."
						src.Using=0
						return
					else
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
		set name= "Ars Goetia: Revive Demon"
		set category = "Ars Goetia"
		if(usr.isRace(DEMON)||usr.isRace(ELDRITCH))
			usr<<"Races native to the Depths cannot utilize or claim ownership over the Ars Goetia."
			return
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
			OMsg(usr, "The Ars Goetia floods [A] with stored up blood, bringing them back from the dead.")
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