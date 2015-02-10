local spawnPositions = {
{1973.0092773438,-1224.2691650391,23.742050170898},
{1916.8138427734,-483.71810913086,29.249662399292},
{-278.6669921875,-2882.1572265625,32.104232788086},
{-958.5595703125,-2887.9912109375,64.82421875},
{-1816.9375,-2748.18359375,1.7327127456665},
{-2816.166015625,-2439.0546875,2.4004096984863},
{-2941.5673828125,-1206.2373046875,2.7848854064941},
{-2911.51171875,-895.22265625,2.4013109207153},
{-2185.6669921875,2957.380859375,11.474840164185},
{272.2265625,2928.505859375,1.3713493347168},
{2803.943359375,595.9365234375,7.7612648010254},
{2883.7509765625,-178.4658203125,3.2714653015137},
{-233.46484375,-1735.8173828125,1.5520644187927},
{-1056.8720703125,2939.068359375,42.311294555664},
{-66.877227783203,-548.74176025391,19.740741729736},
{1009.7528686523,-74.385948181152,34.531536102295},
}

local playerDataTable = {
{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"food"},
{"thirst"},
{"temperature"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
{"cold"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
{"Wood Pile"},
{"Bandage"},
{"Antidot"},
{"Water Bottle"},
{"Pasta Can"},
{"Beans Can"},
{"Burger"},
{"Box of Matches"},
{"G13 Mag"},
{"M9 SD Mag"},
{".45ACP Round"},
{"G13"},
{"M9 SD"},
{"Winchester 1866"},
{"PPK"},
{"Hunting Knife"},
{"Firefighter Axe"},
{"Pizza"},
{"Rotten Meat"},
{"Morphine"},
{"Soda Bottle"},
{"Empty Gas Canister"},
{"Full Gas Canister"},
{"Roadflare"},
{"Milk"},
{"PPK Mag"},
{"MP5A5 Mag"},
{"AK Mag"},
{"30rnd STANAG"},
{"FlashBang"},
{"Grenade"},
{"Revolver"},
{"Sawn-Off Shotgun"},
{"SPAZ-12 Combat Shotgun"},
{"MP5A5"},
{"Watch"},
{"Medic Kit"},
{"Heat Pack"},
{"Lee Enfield"},
{"PPK"},
--{"TEC-9"},
{"AK-47"},
--{"M136 Rocket Launcher"},
{"Blood Bag"},
{"GPS"},
{"Map"},
{"Toolbox"},
{"Wire Fence"},
{"Tire"},
{"Engine"},
--{"M136 Rocket"},
{"DMR Mag"},
{"Lee Enfield Mag"},
{"M4A1 CCO SD"},
{"DMR"},
--{"Heat-Seeking RPG"},
{"Satchel"},
{"Infrared Goggles"},
{"Night Vision Goggles"},
{"Tent"},
{"Raw Meat"},
{"Cooked Meat"},
{"Camouflage Clothing"},
{"Ghillie Suit"},
{"Civilian Clothing"},
{"Survivor Clothing"},
{"Painkiller"},
{"Empty Water Bottle"},
{"Empty Soda Cans"},
{"Scruffy Burgers"},
{"1866 Slug"},
{"2Rnd. Slug"},
{"SPAZ-12 Pellet"},
{"Radio Device"},
{"Binoculars"},
{"Baseball Bat"},
{"Shovel"},
{"Golf Club"},
}

local vehicleDataTable = {
{"MAX_Slots"},
{"Tire_inVehicle"},
{"Engine_inVehicle"},
{"fuel"},
{"Wood Pile"},
{"Bandage"},
{"Antidot"},
{"Water Bottle"},
{"Pasta Can"},
{"Beans Can"},
{"Burger"},
{"Box of Matches"},
{"G13 Mag"},
{"G13"},
{"M9 SD"},
{".45ACP Round"},
{"Winchester 1866"},
{"PPK"},
{"Hunting Knife"},
{"Morphine"},
{"Firefighter Axe"},
{"Pizza"},
{"Rotten Meat"},
{"Soda Bottle"},
{"Empty Gas Canister"},
{"Full Gas Canister"},
{"Roadflare"},
{"Milk"},
{"PPK Mag"},
{"MP5A5 Mag"},
{"AK Mag"},
{"30rnd STANAG"},
{"FlashBang"},
{"Grenade"},
{"Revolver"},
{"Sawn-Off Shotgun"},
{"SPAZ-12 Combat Shotgun"},
{"MP5A5"},
{"Watch"},
{"Medic Kit"},
{"Heat Pack"},
{"Lee Enfield"},
--{"TEC-9"},
{"AK-47"},
--{"M136 Rocket Launcher"},
{"Blood Bag"},
{"GPS"},
{"Map"},
{"Toolbox"},
{"Wire Fence"},
{"Tire"},
{"Engine"},
--{"M136 Rocket"},
{"DMR Mag"},
{"Lee Enfield Mag"},
{"M4A1 CCO SD"},
{"DMR"},
--{"Heat-Seeking RPG"},
{"Satchel"},
{"Infrared Goggles"},
{"Night Vision Goggles"},
{"Tent"},
{"Raw Meat"},
{"Cooked Meat"},
{"Camouflage Clothing"},
{"Ghillie Suit"},
{"Civilian Clothing"},
{"Survivor Clothing"},
{"Painkiller"},
{"Binoculars"},
{"Empty Water Bottle"},
{"Empty Soda Cans"},
{"Scruffy Burgers"},
{"1866 Slug"},
{"2Rnd. Slug"},
{"SPAZ-12 Pellet"},
{"Assault Pack (ACU)"},
{"Child Briefcase"},
{"Alice Pack"},
{"Radio Device"},
{"Coyote Backpack"},
{"Czech Backpack"},
{"Mountain Backpack"},
{"O.S Pack"},
{"LHT Ghillie Pack"},
{"Krysset Backpack"},
{"Anarchy Assault Pack"},
{"Baseball Bat"},
{"Shovel"},
{"Golf Club"},
}


function spawnDayZPlayer(player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z+0.5, math.random(0,360), 73, 0, 0)
	fadeCamera (player, true)
	setCameraTarget (player, player)
		playerCol = createColSphere(x,y,z,1.5)
		setElementData(player,"playerCol",playerCol)
		attachElements ( playerCol, player, 0, 0, 0 )
		setElementData(playerCol,"parent",player)
		setElementData(playerCol,"player",true)
		local account = getPlayerAccount(player)
		setAccountData(account,"isDead",false)
		setElementData(player,"isDead",false)
		setElementData(player,"logedin",true)
		setElementData(player,"admin",getAccountData(account,"admin") or false)
		setElementData(player,"supporter",getAccountData(account,"supporter") or false)
	----------------------------------
	--Player Items on Start
	for i,data in ipairs(playerDataTable) do
		if data[1] =="Bandage" then
			setElementData(player,data[1],2)	
		elseif data[1] =="Painkiller" then
			setElementData(player,data[1],1)
		elseif data[1] =="Map" then
			setElementData(player,data[1],1)
		elseif data[1] =="GPS" then
			setElementData(player,data[1],1)
		elseif data[1] =="Antidot" then
			setElementData(player,data[1],1)
		elseif data[1] =="Toolbox" then
			setElementData(player,data[1],2)
		elseif data[1] =="Morphine" then
			setElementData(player,data[1],1)			
		elseif data[1] =="MAX_Slots" then
			setElementData(player,data[1],8)	
		elseif data[1] =="skin" then
			setElementData(player,data[1],73)
		elseif data[1] =="blood" then
			setElementData(player,data[1],12000)
		elseif data[1] =="temperature" then
			setElementData(player,data[1],37)
		elseif data[1] =="brokenbone" then
			setElementData(player,data[1],false)	
		elseif data[1] =="pain" then
			setElementData(player,data[1],false)
		elseif data[1] =="cold" then
			setElementData(player,data[1],false)
		elseif data[1] =="infection" then
			setElementData(player,data[1],false)
		elseif data[1] =="food" then
			setElementData(player,data[1],100)
		elseif data[1] =="thirst" then
			setElementData(player,data[1],100)
		elseif data[1] =="currentweapon_1" then
			setElementData(player,data[1],false)
		elseif data[1] =="currentweapon_2" then
			setElementData(player,data[1],false)	
		elseif data[1] =="currentweapon_3" then
			setElementData(player,data[1],false)	
		elseif data[1] =="bandit" then
			setElementData(player,data[1],false)	
		elseif data[1] =="humanity" then
			setElementData(player,data[1],2500)	
		else
			setElementData(player,data[1],0)
		end		
	end
	----------------------------------
end
--addEvent("onPlayerLoginToDayZ",true)
--addEventHandler("onPlayerLoginToDayZ",getRootElement(),spawnDayZPlayer)
--addEventHandler("onPlayerJoin",getRootElement(),spawnDayZPlayer)

function checkBuggedAccount()
	for i,player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if not account then return end
		if getElementData(player,"logedin") then
			if getElementModel(player) == 0 then
				spawnDayZPlayer(player)
				outputChatBox(getPlayerName(player).."s Account is buggy and has been reset.",getRootElement(),22,255,22,true)
			end
		end
	end	
end
setTimer(checkBuggedAccount,90000,0)

function notifyAboutExplosion2()
	for i,player in pairs(getVehicleOccupants(source)) do
		triggerEvent("kilLDayZPlayer",player)
	end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)

function destroyDeadPlayer (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end

function kilLDayZPlayer (killer,headshot,weapon)
pedCol = false
local account = getPlayerAccount(source)
--if getElementData(source,"isInEvent") then removePlayerEvent(source) return end
if not account then return end
	killPed(source)
	triggerClientEvent(source,"hideInventoryManual",source)
	if getElementData(source,"alivetime") > 10 then 
	if not isElementInWater(source) then
	local x,y,z = getElementPosition(source)
	if getDistanceBetweenPoints3D (x,y,z,6000,6000,0) > 200 then
		local x,y,z = getElementPosition(source)
		local rotX,rotY,rotZ = getElementRotation(source)
		local skin = getElementModel(source)
		local ped = createPed(skin,x,y,z,rotZ)
		pedCol = createColSphere(x,y,z,1.5)
		killPed(ped)
		setTimer(destroyDeadPlayer,3600000*0.75,1,ped,pedCol)	
		attachElements (pedCol,ped,0,0,0)
		setElementData(pedCol,"parent",ped)
		setElementData(pedCol,"playername",getPlayerName(source))
		setElementData(pedCol,"deadman",true)
		setElementData(pedCol,"MAX_Slots",getElementData(source,"MAX_Slots"))
		local time = getRealTime()
		local hours = time.hour
		local minutes = time.minute
		setElementData(pedCol,"deadreason",getPlayerName(source).." is dead. Cause of death: "..(weapon or "Unknown")..". Time of death: "..hours..":"..minutes.." o'clock.")
	end	
	end
	end
		if killer then
		if not getElementData(source,"bandit") then
			addPlayerStats (killer,"humanity",math.random(-2500,-1000))
		else
			addPlayerStats (killer,"humanity",math.random(1000,2500))
		end
		setElementData(killer,"murders",getElementData(killer,"murders")+1)
		if getElementData(killer,"humanity") < 0 then
			setElementData(killer,"bandit",true)
		end
		if getElementData(source,"bandit") == true then
			setElementData(killer,"banditskilled",getElementData(killer,"banditskilled")+1)
		end
		if headshot == true then
			setElementData(killer,"headshots",getElementData(killer,"headshots")+1)
		end
		end
		--SetElementDatas
	if pedCol then
		for i,data in ipairs(playerDataTable) do
			local plusData = getElementData(source,data[1])
			if data[1] == "G13 Mag" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "M9 SD Mag" then
				plusData = math.floor(getElementData(source,data[1])/15)
			elseif data[1] == ".45ACP Round" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "PPK Mag" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "MP5A5 Mag" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "AK Mag" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "30rnd STANAG" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "DMR Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "Lee Enfield Mag" then
				plusData = math.floor(getElementData(source,data[1])/10)
			elseif data[1] == "1866 Slug" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "SPAZ-12 Pellet" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "2Rnd. Slug" then
				plusData = math.floor(getElementData(source,data[1])/2)
			end
			setElementData(pedCol,data[1],plusData)
		end
		--Skin
		local skinID = getElementData(source,"skin")
		local skin = getSkinNameFromID(skinID)
		setElementData(pedCol,skin,1)
		--Backpack
		local backpackSlots = getElementData(source,"MAX_Slots")
		if backpackSlots == 12 then
			setElementData(pedCol,"Assault Pack (ACU)",1)
		elseif backpackSlots == 16 then
			setElementData(pedCol,"Child Briefcase",1)		
		elseif backpackSlots == 22 then
			setElementData(pedCol,"Alice Pack",1)
		elseif backpackSlots == 26 then
			setElementData(pedCol,"Czech Backpack",1)
		elseif backpackSlots == 30 then
			setElementData(pedCol,"Mountain Backpack",1)
		elseif backpackSlots == 40 then
			setElementData(pedCol,"O.S Pack",1)	
		elseif backpackSlots == 46 then
			setElementData(pedCol,"LHT Ghillie Pack",1)
		elseif backpackSlots == 50 then
			setElementData(pedCol,"Krysset Backpack",1)
		elseif backpackSlots == 56 then
			setElementData(pedCol,"Anarchy Assault Pack",1)			
		elseif backpackSlots == 80 then
			setElementData(pedCol,"Coyote Backpack",1)
		end
	end
		setTimer(setElementPosition,500,1,source,6000,6000,0)
		triggerClientEvent(source,"onClientPlayerDeathInfo",source)
		setAccountData(account,"isDead",true)
		setElementData(source,"isDead",true)
		triggerClientEvent ( "onRollMessageStart", getRootElement(),"#FFFFFF"..getPlayerName(source).." #FFFFFFwas killed",0,22,255, "died")
		destroyElement(getElementData(source,"playerCol"))
		setTimer(spawnDayZPlayer,5000,1,source)
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)