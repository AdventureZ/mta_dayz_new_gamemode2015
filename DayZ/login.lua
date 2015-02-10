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
{"M136 Rocket"},
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
{"Radio Device"},
{"Baseball Bat"},
{"Shovel"},
{"Golf Club"},
{"Radio Device"},
{"Parachute"},
--[[
{"Diary, Page 1"},
{"Diary, Page 2"},
{"Diary, Page 3"},
{"Diary, Page 4"},
{"Diary, Page 5"},
{"Diary, Page 6"},
{"Diary, Page 7"},
{"Diary, Page 8"},
{"Small Note 1"},
{"Small Note 2"},
{"Small Note 3"},
{"Research Report 1"},
{"Research Report 2"},
{"Letter to Mum"},
]]
}


function playerLogin(username, pass, player)
	local playerID = getAccountData(getPlayerAccount(player),"playerID")
	account = getPlayerAccount(player)
				local x,y,z =  getAccountData(account,"last_x"),getAccountData(account,"last_y"),getAccountData(account,"last_z")
				local skin = getAccountData(account,"skin")
				createZombieTable (player)
				if getAccountData(account,"isDead") then
					spawnDayZPlayer(player)
					return
				end
				spawnPlayer (player, x,y,z, math.random(0,360), skin, 0, 0)
				fadeCamera (player, true)
				setCameraTarget (player, player)
				playerCol = createColSphere(x,y,z,1.5)
				setElementData(player,"playerCol",playerCol)
				attachElements ( playerCol, player, 0, 0, 0 )
				setElementData(playerCol,"parent",player)
				setElementData(playerCol,"player",true)
				for i,data in ipairs(playerDataTable) do
					local elementData = getAccountData(account,data[1])
					setElementData(player,data[1],elementData)
				end
				setElementData(player,"logedin",true)
	--Weapons
--Old Weapons
local weapon = getElementData(player,"currentweapon_1")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), true )
end
local weapon = getElementData(player,"currentweapon_2")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), false )
end
local weapon = getElementData(player,"currentweapon_3")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), false )
end
setPedSkin(getElementData(player,"skin"))

setElementData(player,"admin",getAccountData(account,"admin") or false)
setElementData(player,"supporter",getAccountData(account,"supporter") or false)

end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)

function playerRegister(username, pass, player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 73, 0, 0)
	fadeCamera (player, true)
	setCameraTarget (player, player)
		playerCol = createColSphere(x,y,z,1.5)
		attachElements ( playerCol, player, 0, 0, 0 )
		setElementData(playerCol,"parent",player)
		setElementData(playerCol,"player",true)
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
			setElementData(player,data[1],2)
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
		account = getAccount(username)
		local value = getAccounts()
		local value = #value
		setElementData(player,"playerID",value+1)
		setAccountData(account,"playerID",value+1)
		setElementData(player,"logedin",true)
		createZombieTable (player)
end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)


function saveAccounts () -- Save in the database
	local account = getPlayerAccount(source)
	if account then
	for i,data in ipairs(playerDataTable) do
		setAccountData(account,data[1],getElementData(source,data[1]))
	end
		local x,y,z =  getElementPosition(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		destroyElement(getElementData(source,"playerCol"))
	end	
	setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2 () -- Save in the database
for i, player in ipairs(getElementsByType("player")) do
	local account = getPlayerAccount(player)
	if account then
	for i,data in ipairs(playerDataTable) do
		setAccountData(account,data[1],getElementData(player,data[1]))
	end
		local x,y,z =  getElementPosition(player)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
	end	
	--setElementData(player,"logedin",false)
end	
end
addEventHandler ( "onResourceStop", getRootElement(), saveAccounts2 )

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
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
{"M136 Rocket"},
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
{"Czech Backpack"},
{"Mountain Backpack"},
{"O.S Pack"},
{"LHT Ghillie Pack"},
{"Krysset Backpack"},
{"Anarchy Assault Pack"},
{"Coyote Backpack"},
{"Radio Device"},
{"Baseball Bat"},
{"Shovel"},
{"Golf Club"},
{"Parachute"},
}

--local vehicleManager = getAccount("vehicleManager","ds4f9$")
	--if not vehicleManager then
	--addAccount("vehicleManager","ds4f9$")
	--end

function saveallvehicles(ps,command)
	counter = 0
	counterTent = 0
	--delete Accounts 
	local vehicleManager = getAccount("vehicleManager","ds4f9$")
	--for i = 1, (getAccountData(vehicleManager,"vehicleamount") or 0) do
		--local account = getAccount("vehicle_number_"..i,"ds4f9$")
		--if not account then break end
		--removeAccount (account)
	--end
	--new Accounts + set
	for i, col in ipairs (getElementsByType("colshape")) do
		local veh = getElementData(col,"vehicle")
		local helicrash = getElementData(col,"helicrash")
		local hospitalbox = getElementData(col,"hospitalbox")
		local tent = getElementData(col,"tent")
		if veh and not helicrash or veh and not hospitalbox then
		if tent then
			counterTent = counterTent +1
			account = getAccount("tent_number_"..counterTent,"ds4f9$") or false
			if not account then
				account = addAccount("tent_number_"..counterTent,"ds4f9$")
			end	
			local tent = getElementData(col,"parent")
			local x,y,z = getElementPosition(tent)
			local rx,ry,rz = getElementRotation(tent)
			setAccountData(account,"last_x",x)
			setAccountData(account,"last_y",y)
			setAccountData(account,"last_z",z)
			setAccountData(account,"last_rx",rx)
			setAccountData(account,"last_ry",ry)
			setAccountData(account,"last_rz",rz)
			for i, data in ipairs(vehicleDataTable) do 
				setAccountData(account,data[1],getElementData(col,data[1]))
			end
		else 
		counter = counter +1
		account = getAccount("vehicle_number_"..counter,"ds4f9$") or false
		if not account then
			account = addAccount("vehicle_number_"..counter,"ds4f9$")
		end	
			setAccountData(account,"spawn_x",getElementData(col,"spawn")[2])
			setAccountData(account,"spawn_y",getElementData(col,"spawn")[3])
			setAccountData(account,"spawn_z",getElementData(col,"spawn")[4])
				for i, data in ipairs(vehicleDataTable) do 
					setAccountData(account,data[1],getElementData(col,data[1]))
				end
		local vehicle = getElementData(col,"parent")
		local model = getElementModel(vehicle)
		local x,y,z = getElementPosition(vehicle)
		local rx,ry,rz = getElementRotation(vehicle)
		local health = getElementHealth(vehicle)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		setAccountData(account,"last_rx",rx)
		setAccountData(account,"last_ry",ry)
		setAccountData(account,"last_rz",rz)
		setAccountData(account,"health",health)
		setAccountData(account,"model",model)
		setAccountData(account,"isExploded",getElementData(vehicle,"isExploded") or false)
		end
		end
		setAccountData(vehicleManager,"vehicleamount",counter)
		setAccountData(vehicleManager,"tentamount",counterTent)
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), saveallvehicles)

function doBackup ()
		outputChatBox ("Server Backup...",getRootElement(),27, 89, 224,true)
		saveallvehicles()
		outputChatBox ("Done!",getRootElement(),27, 89, 224,true)
end
function checkDoBackup ()
	if gameplayVariables["backupenabled"] then
		setTimer(doBackup,86400000,0)
	end
end
checkDoBackup()

function createVehicleOnServerStart()
	local vehicleManager = getAccount("vehicleManager","ds4f9$")
	for i = 1, (getAccountData(vehicleManager,"vehicleamount") or 0) do
		wastedVehicle = false
		vehicle = getAccount("vehicle_number_"..i,"ds4f9$")
		if not vehicle then break end
		if getAccountData(vehicle,"isExploded") == true then
			setAccountData(vehicle,"health",1000)
			wastedVehicle = true
		end
			local veh = createVehicle(getAccountData(vehicle,"model"),getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),getAccountData(vehicle,"last_rx"),getAccountData(vehicle,"last_ry"),getAccountData(vehicle,"last_rz"))
			vehCol = createColSphere(getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),4)
			attachElements ( vehCol, veh, 0, 0, 0 )
			setElementData(vehCol,"parent",veh)
			setElementData(veh,"parent",vehCol)
			setElementData(vehCol,"vehicle",true)
			setElementData(vehCol,"MAX_Slots",getAccountData(vehicle,"MAX_Slots"))
			setElementHealth(veh,getAccountData(vehicle,"health"))
		--vehicle_indentifikation
			xxx,yyy,zzz = getAccountData(vehicle,"spawn_x"),getAccountData(vehicle,"spawn_y"),getAccountData(vehicle,"spawn_z")
			setElementData(vehCol,"spawn",{getAccountData(vehicle,"model"),xxx,yyy,zzz})
			if wastedVehicle then
				if getAccountData(vehicle,"model") == 497 then
					item_id = math.random(table.size(hunterSpawns))
					xxx,yyy,zzz = hunterSpawns[item_id][1],hunterSpawns[item_id][2],hunterSpawns[item_id][3]
				end
				if getAccountData(vehicle,"model") == 487 then
					local item_id = math.random(table.size(maverikSpawns))
					x,y,z = maverikSpawns[item_id][1],maverikSpawns[item_id][2],maverikSpawns[item_id][3]
				end
				setElementPosition(veh,xxx,yyy,zzz+1)
				setElementRotation(veh,0,0,0)
				--Engine + Tires
				local tires,engine = getVehicleAddonInfos (getElementModel(veh))
				setElementData(vehCol,"Tire_inVehicle",math.random(0,tires))
				setElementData(vehCol,"Engine_inVehicle",math.random(0,engine))
			end
		--others
			setElementData(vehCol,"fuel",getAccountData(vehicle,"fuel"))
	if not wastedVehicle then
		for i, data in ipairs(vehicleDataTable) do 
			setElementData(vehCol,data[1],getAccountData(vehicle,data[1]))
		end
	else
		if getElementModel(veh) == 433 or getElementModel(veh) == 470 then
			for i,items in ipairs(lootItems["helicrashsides"]) do
				local randomNumber = math.random(1,10)
				if randomNumber == 5 then
					setElementData(vehCol,items[1],math.random(1,2))
				end
			end
		end	
		setElementData(vehCol,"fuel",10)
	end
	end
	for i = 1, (getAccountData(vehicleManager,"tentamount") or 0) do
		tentData = getAccount("tent_number_"..i,"ds4f9$")
		if not tentData then break end
		tent = createObject(3243,getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),0,0,(getAccountData(tentData,"last_rz") or 0))
		setObjectScale(tent,1.3)
		tentCol = createColSphere(getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),4)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"tent",true)
		setElementData(tentCol,"vehicle",true)
		setElementData(tentCol,"MAX_Slots",100)
		for i, data in ipairs(vehicleDataTable) do 
			setElementData(tentCol,data[1],getAccountData(tentData,data[1]))
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), createVehicleOnServerStart)





