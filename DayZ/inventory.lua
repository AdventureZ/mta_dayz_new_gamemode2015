--[[
#---------------------------------------------------------------#
----*			DayZ MTA Script inventory.lua			*----
----* This Script is owned by Marwin, you are not allowed to use or own it.
----* Owner: Marwin W., Germany, Lower Saxony, Otterndorf
----* Skype: xxmavxx96
----*														*----
#---------------------------------------------------------------#
]]

inventoryItems = {
["Weapons"] = {
["Primary Weapon"] = {
-- [ID:0000016 - New names for weapons] //L
{"M4A1 CCO SD",3},
{"DMR",3},
{"Winchester 1866",3},
{"SPAZ-12 Combat Shotgun",3},
{"Sawn-Off Shotgun",3},
{"AK-47",3},
--{"Heat-Seeking RPG",5},
--{"M136 Rocket Launcher",5},
{"Lee Enfield",3},
},
["Secondary Weapon"] = {
-- [ID:0000016 - New names for weapons] //L
{"G13",2},
{"M9 SD",2},
{"PPK",2},
--{"TEC-9",2}, -- Removed TEC-9 as part of [ID:0000016 - New names for weapons] //L
{"MP5A5",3},
{"Revolver",2},
{"Hunting Knife",1},
{"Firefighter Axe",2},
-- [ID:0000018 - Melee Weapons + decrease spawning rate for ranged weapons] //L
{"Baseball Bat",2},
{"Shovel",2},
{"Golf Club",2},

},
["Specially Weapon"] = {
{"Parachute",1},
{"FlashBang",1},
{"Grenade",1},
{"Binoculars",1} -- [ID:0000006 - Binoculars] //L
},
},
["Ammo"] = {

--[ID:0000015 - Clips/magazines for weapons] //L
{"G13 Mag",0.085},
{"M9 SD Mag",0.085},
{".45ACP Round",0.085},
{"PPK Mag",0.025},
{"MP5A5 Mag",0.025},
{"AK Mag",0.035},
{"30rnd STANAG",0.035},
{"1866 Slug",0.067},
{"2Rnd. Slug",0.067},
{"SPAZ-12 Pellet",0.067},
{"DMR Mag",0.1},
{"Lee Enfield Mag",0.1},
--{"M136 Rocket",2},


--[[
-- Reference Material for future Ammo!
{"Rocket Ammo",2},
{"Sniper Ammo",0.1},
{"Smg Ammo",0.025},
{"Assault Ammo",0.035},
{"Pistol Ammo",0.085},
{"Shotgun Ammo",0.067},

]]--


},
["Food"] = {
{"Water Bottle",1},
{"Pasta Can",1},
{"Beans Can",1},
{"Burger",1},
{"Pizza",1},
{"Soda Bottle",1},
{"Milk",1},
{"Cooked Meat",1},
{"Rotten Meat",1},
},
["Items"] = {
{"Wood Pile",2}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Bandage",1,"Usar Bandage"},
{"Antidot",1,"Use"},
{"Roadflare",1,"Place"},
{"Empty Gas Canister",2}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Full Gas Canister",2}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Medic Kit",2,"Use"},
{"Heat Pack",1,"Use"},
{"Painkiller",1,"Use"},
{"Morphine",1,"Use"},
{"Blood Bag",1,"Use"},
{"Wire Fence",1,"Build a wire fence"},
{"Raw Meat",1},
{"Tire",2},
{"Engine",5},
{"Tent",3,"Pitch a tent"},
{"Camouflage Clothing",1,"Usar Roupa"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Civilian Clothing",1,"Usar Roupa"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Survivor Clothing",1,"Usar Roupa"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Ghillie Suit",1,"Usar Roupa"}, -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
{"Empty Water Bottle",1,"Fill bottle up"}, 
{"Empty Soda Cans",1},
{"Scruffy Burgers",1},
{"Assault Pack (ACU)",1},
{"Child Briefcase",1},
{"Alice Pack",1},
{"Czech Backpack",1},
{"Mountain Backpack",1},
{"O.S Pack",1},
{"LHT Ghillie Pack",1},
{"Krysset Backpack",1},
{"Anarchy Assault Pack",1},
{"Coyote Backpack",1},
},
["Toolbelt"] = {
{"Night Vision Goggles",1},
{"Infrared Goggles",1},
{"Map",1},
{"Box of Matches",1,"Colocar Fogo"}, -- [ID:	0000005 - Several grammar + spelling mistakes and typos] //L
{"Watch",1},
{"GPS",1},
{"Toolbox",1},
{"Radio Device",1},

--[[
[ID:0000008 - Bottles with Messages] //L
{"Diary, Page 1",1},
{"Diary, Page 2",1},
{"Diary, Page 3",1},
{"Diary, Page 4",1},
{"Diary, Page 5",1},
{"Diary, Page 6",1},
{"Diary, Page 7",1},
{"Diary, Page 8",1},
{"Small Note 1",1},
{"Small Note 2",1},
{"Small Note 3",1},
{"Research Report 1",1},
{"Reseach Report 2",1},
{"Letter to Mum",1},
]]
},
}


------------------------------------------------------------------------------
--INVENTORY
local headline = {}
local gridlistItems = {}
local buttonItems = {}


inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true) -- [ID:0000014 - Remodel Inventory] //L
-- inventoryWindows = guiCreateStaticImage(0.25,0.25,0.5,0.5,"images/scrollmenu_1.png",true) -- [ID:0000014 - Remodel Inventory] //L


headline["loot"] = guiCreateLabel(0.06, 0.05, 0.34, 0.09,"GEAR",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["loot"],"center")
guiSetFont (headline["loot"], "default-bold-small" )

headline["inventory"] = guiCreateLabel(0.60, 0.05, 0.34, 0.09,"INVENTORY",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["inventory"],"center")
guiSetFont (headline["inventory"], "default-bold-small" )

gridlistItems["loot"] = guiCreateGridList (0.03, 0.10, 0.39, 0.83,true,inventoryWindows)
gridlistItems["loot_colum"] = guiGridListAddColumn( gridlistItems["loot"], "Loot", 0.7 )
gridlistItems["loot_colum_amount"] = guiGridListAddColumn( gridlistItems["loot"], "", 0.2 )

gridlistItems["inventory"] = guiCreateGridList (0.57, 0.11, 0.39, 0.83,true,inventoryWindows)
gridlistItems["inventory_colum"] = guiGridListAddColumn( gridlistItems["inventory"], "Inventory", 0.7 )
gridlistItems["inventory_colum_amount"] = guiGridListAddColumn( gridlistItems["inventory"], "", 0.2 )

buttonItems["loot"] = guiCreateButton(0.42, 0.17, 0.04, 0.69, "->", true,inventoryWindows)
buttonItems["inventory"] = guiCreateButton(0.53, 0.17, 0.04, 0.69, "<-", true,inventoryWindows)

headline["slots"] = guiCreateLabel(0.62, 0.94, 0.29, 0.04,"SLOTS:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots"],"center")
guiLabelSetVerticalAlign (headline["slots"],"center")
guiSetFont (headline["slots"], "default-bold-small" )

headline["slots_loot"] = guiCreateLabel(0.07, 0.94, 0.29, 0.04,"SLOTS:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots_loot"],"center")
guiLabelSetVerticalAlign (headline["slots_loot"],"center")
guiSetFont (headline["slots_loot"], "default-bold-small" )

guiSetVisible(inventoryWindows,false)

function showInventory (key,keyState)
if getElementData(getLocalPlayer(),"logedin") then
	if ( keyState == "down" ) then
		guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) == true then
			onClientOpenInventoryStopMenu ()
		else
			hideRightClickInventoryMenu ()
		end
		if isPlayerInLoot() then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = getElementData(getLocalPlayer(),"lootname")
			refreshLoot(col,gearName)
		end
	end
end	
end
bindKey ( "j", "down", showInventory )

function showInventoryManual ()
		guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) == true then
			onClientOpenInventoryStopMenu ()
		end
end

function hideInventoryManual ()
		guiSetVisible(inventoryWindows,false)
		showCursor(false)
		hideRightClickInventoryMenu ()
end
addEvent("hideInventoryManual",true)
addEventHandler("hideInventoryManual",getLocalPlayer(),hideInventoryManual)

function refreshInventoryManual ()
		refreshInventory()
end
addEvent("refreshInventoryManual",true)
addEventHandler("refreshInventoryManual",getLocalPlayer(),refreshInventoryManual)

function refreshLootManual (loot)
		refreshLoot(loot)
end
addEvent("refreshLootManual",true)
addEventHandler("refreshLootManual",getLocalPlayer(),refreshLootManual)

function refreshInventory()
if ( gridlistItems["inventory_colum"] ) then --If the column has been created, fill it with players
	row1,column1 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
	guiGridListClear(gridlistItems["inventory"])
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			--guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"ITEMS", false, false )
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"PRIMARY WEAPON", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"SECONDARY WEAPON", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"SPECIAL WEAPON", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"AMMO", true, false )
		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"FOOD & DRINKS", true, false )
		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"MISC.", true, false )
		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"TOOLBELT", true, false )
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
		if row1 and column1 then
			guiGridListSetSelectedItem ( gridlistItems["inventory"], row1,column1)
		end
		guiSetText(headline["slots"],"SLOTS: "..getPlayerCurrentSlots().."/"..getPlayerMaxAviableSlots()) -- [ID:0000014 - Remodel Inventory] //L
	end
end

function refreshLoot(loot,gearName)
if loot == false then
	guiGridListClear(gridlistItems["loot"])
	guiSetText(headline["loot"],"Empty")
	return
end
if ( gridlistItems["loot_colum"] ) then
	row2,column2 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
	guiGridListClear(gridlistItems["loot"])
	if gearName then
		guiSetText(headline["loot"],gearName)
	end	
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			--guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Weapons", true, false ) -- [ID:0000014 - Remodel Inventory] //L
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"PRIMARY WEAPON", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
				local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"SECONDARY WEAPON", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"SPECIAL WEAPON", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"AMMO", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"FOOD & DRINKS", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"MISC.", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"TOOLBELT", true, false ) -- [ID:0000014 - Remodel Inventory] //L
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end

		if row2 and column2 then
			--guiGridListSetSelectedItem ( gridlistItems["loot"], row2,column2)
		end
		guiSetText(headline["slots_loot"],"SLOTS: "..getLootCurrentSlots(loot).."/"..(getLootMaxAviableSlots(loot)or 0)) -- [ID:0000014 - Remodel Inventory] //L
	end
end


function getPlayerMaxAviableSlots()
return getElementData(getLocalPlayer(),"MAX_Slots")
end

function getLootMaxAviableSlots(loot)
return getElementData(loot,"MAX_Slots")
end

function getPlayerCurrentSlots()
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	return math.floor(current_SLOTS)
end


function getLootCurrentSlots(loot)
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	return math.floor(current_SLOTS)
end

function getItemSlots(itema)
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if itema == item[1] then 
			return item[2]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if itema == item[1] then 
			return item[2]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if itema == item[1] then 
			return item[2]
		end
	end	
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	return false
end

function isToolbeltItem(itema)
local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Toolbelt"]) do
		if itema == item[1] then 
			return true
		end
	end	
	return false
end

vehicleAddonsInfo = {
-- {Model ID, Tires, Engine}
{422,4,1},
{470,4,1},
-- News Cars
{597,4,1}, -- moon
{536,4,1}, -- blade
{483,4,1}, -- camper
{593,3,1}, -- dodo
{463,2,1}, -- freeway
{471,4,1}, -- quad
{571,4,1}, -- Kart
{500,4,1}, -- mesa
{531,4,1}, -- tractor
{420,4,1}, -- taxi
-- News Cars
{468,2,1},
{433,6,1},
{437,6,1},
{509,0,0},
{487,0,1},
{497,0,1},
{453,0,1},
}

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2],veh[3]
		end
	end
end

--OTHER ITEM STUFF
vehicleFuelTable = {
-- {Model ID, Max Fuel}
{422,80},
{470,100},
-- News Cars
{597,50},
{536,40},
{483,55},
{593,45},
{463,30},
{471,30},
{571,30},
{500,35},
{531,60},
{420,40},
-- News Cars
{468,30},
{433,140},
{437,140},
{509,0},
{487,60},
{497,60},
{453,60},
}

function getVehicleMaxFuel(loot)
	local modelID = getElementModel(getElementData(loot,"parent"))
	for i,vehicle in ipairs(vehicleFuelTable) do
		if modelID == vehicle[1] then
			 return vehicle[2]
		end
	end
	return false
end

function onPlayerMoveItemOutOfInventory ()
if playerMovedInInventory then startRollMessage2("Inventory", "Abusing exploits will result in a ban!", 255, 22, 0 ) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
	if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
		if isPlayerInLoot() then
			local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
			local isTent = getElementData(isPlayerInLoot(),"tent")
			if isVehicle and not isTent then
				local veh = getElementData(isPlayerInLoot(),"parent")
				local tires,engine = getVehicleAddonInfos (getElementModel(veh))
				if itemName == "Tire" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or itemName == "Engine" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName.."_inVehicle",isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				elseif isToolbeltItem(itemName) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				else
					startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
					return
				end
			elseif isToolbeltItem(itemName) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())	
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
			elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
				triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
				playerMovedInInventory = true
					setTimer(function()
					playerMovedInInventory = false
				end,700,1)
			else
				startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
				return
			end	
		else
			triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
			playerMovedInInventory = true
			setTimer(function()
				playerMovedInInventory = false
			end,700,1)
		end	
	end
	local gearName = guiGetText(headline["loot"])
	local col = getElementData(getLocalPlayer(),"currentCol")
	setTimer(refreshInventory,200,2)
	if isPlayerInLoot() then
		setTimer(refreshLoot,200,2,col,gearName)
	end
end
addEventHandler ( "onClientGUIClick", buttonItems["inventory"], onPlayerMoveItemOutOfInventory )


--[ID:0000015 - Clips/magazines for weapons] //L
function onPlayerMoveItemOutOFInventory (itemName,loot)
local itemPlus = 1
if itemName == "G13 Mag" then
	itemPlus = 7
elseif itemName == "M9 SD Mag" then
	itemPlus = 15
elseif itemName == ".45ACP Round" then
	itemPlus = 7
elseif itemName == "PPK Mag" then
	itemPlus = 30
elseif itemName == "MP5A5 Mag" then
	itemPlus = 20
elseif itemName == "AK Mag" then
	itemPlus = 30
elseif itemName == "30rnd STANAG" then
	itemPlus = 20
elseif itemName == "1866 Slug" then
	itemPlus = 7
elseif itemName == "2Rnd. Slug" then
	itemPlus = 2
elseif itemName == "SPAZ-12 Pellet" then
	itemPlus = 7
elseif itemName == "DMR Mag" then
	itemPlus = 5
elseif itemName == "Lee Enfield Mag" then
	itemPlus = 10
elseif itemName == "M136 Rocket" then
	itemPlus = 0
elseif itemName == "M4A1 CCO SD" or itemName == "AK-47" or itemName == "DMR" or itemName == "Winchester 1866" or itemName == "SPAZ-12 Combat Shotgun" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "M136 Rocket Launcher" or itemName == "Lee Enfield" then
	triggerServerEvent("removeBackWeaponOnDrop",getLocalPlayer())
end
if loot then 
if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
	if itemName == "Full Gas Canister" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		if getElementData(loot,"fuel")+20 < getVehicleMaxFuel(loot) then
			addingfuel = 20
		elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuel(loot)+15 then
			triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","The tank is full!",255,22,0) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
			return
		else
			addingfuel = getVehicleMaxFuel(loot)-getElementData(loot,"fuel")
		end
		setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
		setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
		setElementData(getLocalPlayer(),"Empty Gas Canister",(getElementData(getLocalPlayer(),"Empty Gas Canister") or 0)+itemPlus) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Filled gas into vehicle!",22,255,0) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		return
	end
end
end
itemName2 = itemName
if itemName == "Tire_inVehicle" then itemName2 = "Tire" end
if itemName == "Engine_inVehicle" then itemName2 = "Engine" end
if (getElementData(getLocalPlayer(),itemName2) or 0)/itemPlus < 1 then
	triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Can't drop this!",255,22,0) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
return
end
	if loot then
		setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+1)
		local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
			end	
		if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
		end
	else
		triggerServerEvent("playerDropAItem",getLocalPlayer(),itemName)
	end
	if itemName == "Tire_inVehicle" then itemName = "Tire" end
	if itemName == "Engine_inVehicle" then itemName = "Engine" end
	setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
	if loot and getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )

function onPlayerMoveItemInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["loot"], guiGridListGetSelectedItem ( gridlistItems["loot"] ), 1 )
if isPlayerInLoot() then
	if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
		if not isToolbeltItem(itemName) then
			if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
				if not playerMovedInInventory then
					triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end,700,1)
				else
					startRollMessage2("Inventory", "Abusing exploits will result in a ban!", 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
					return
				end	
			else
				startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0 ) -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
				return
			end
		else
			playerMovedInInventory = true
			setTimer(function()
				playerMovedInInventory = false
			end,700,1)
			triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
		end
	end
	if isPlayerInLoot() then
		local gearName = guiGetText(headline["loot"])
		local col = getElementData(getLocalPlayer(),"currentCol")
		setTimer(refreshInventory,200,2)
		setTimer(refreshLoot,200,2,col,gearName)
	end
end	
end
addEventHandler ( "onClientGUIClick", buttonItems["loot"], onPlayerMoveItemInInventory )


--[ID:0000015 - Clips/magazines for weapons] //L
function onPlayerMoveItemInInventory (itemName,loot)
local itemPlus = 1
if itemName == "G13 Mag" then
	itemPlus = 7
elseif itemName == "M9 SD Mag" then
	itemPlus = 15
elseif itemName == ".45ACP Round" then
	itemPlus = 7
elseif itemName == "PPK Mag" then
	itemPlus = 30
elseif itemName == "MP5A5 Mag" then
	itemPlus = 20
elseif itemName == "AK Mag" then
	itemPlus = 30
elseif itemName == "30rnd STANAG" then
	itemPlus = 20
elseif itemName == "1866 Slug" then
	itemPlus = 7
elseif itemName == "2Rnd. Slug" then
	itemPlus = 2
elseif itemName == "SPAZ-12 Pellet" then
	itemPlus = 7
elseif itemName == "DMR Mag" then
	itemPlus = 5
elseif itemName == "Lee Enfield Mag" then
	itemPlus = 10
elseif itemName == "M136 Rocket" then
	itemPlus = 0
elseif itemName == "Assault Pack (ACU)" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 12 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 12 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",12)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Child Briefcase" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 16 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 16 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",16)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
elseif itemName == "Alice Pack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 22 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 22 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",22)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Czech Backpack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 26 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 26 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",26)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Mountain Backpack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 30 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 30 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",30)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
elseif itemName == "O.S Pack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 40 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 40 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",40)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "LHT Ghillie Pack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 46 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 46 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",46)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Krysset Backpack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 50 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 50 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",50)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Anarchy Assault Pack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 56 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	if getElementData(getLocalPlayer(),"MAX_Slots") > 56 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",56)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
elseif itemName == "Coyote Backpack" then
	if getElementData(getLocalPlayer(),"MAX_Slots") == 80 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You already have the best backpack!",255,22,0) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
	setElementData(getLocalPlayer(),"MAX_Slots",80)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
end
	if loot then
		--if itemPlus > (getElementData(loot,itemName) or 0) then
			--itemPlus = getElementData(loot,itemName) 
		--end
			setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)+itemPlus) 
			if itemPlus == 0 then
				setElementData(loot,itemName,getElementData(loot,itemName)-0)
			else
				setElementData(loot,itemName,getElementData(loot,itemName)-1)
			end
			local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
			end
	end
	if getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemInInventory", true )
addEventHandler( "onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory )

function onClientOpenInventoryStopMenu ()
triggerEvent("disableMenu",getLocalPlayer())
end

function isPlayerInLoot()
if getElementData(getLocalPlayer(),"loot") then
	return getElementData(getLocalPlayer(),"currentCol")
end
return false
end


------------------------------------------------------------------------------
--right-click menu
function onPlayerPressRightKeyInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName)
	if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
		if itemName == "Box of Matches" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
			if getElementData(getLocalPlayer(),"Wood Pile") == 0 then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
				return
			end
		end
		if itemName == "Bandage" then
			if getElementData(getLocalPlayer(),"bleeding") == 0 then
				return
			end
		end	
		if itemName == "Antidot" then
            if not getElementData(getLocalPlayer(), "infection") then
                return
            end

        end 
		if itemName == "Medic Kit" then
			if getElementData(getLocalPlayer(),"blood") > 10500 then
				return
			end
		end	
		if itemName == "Heat Pack" then
			if getElementData(getLocalPlayer(),"temperature") > 35 then
				return
			end
		end	
		if itemName == "Painkiller" then
			if not getElementData(getLocalPlayer(),"pain") then
				return
			end
		end	
		if itemName == "Morphine" then
			if not getElementData(getLocalPlayer(),"brokenbone") then
				return
			end
		end	
		if itemName == "Blood Bag" then
			--if getElementData(getLocalPlayer(),"blood") < 1150 then
				return
			--end
		end	
		showRightClickInventoryMenu (itemName,itemInfo)
	end
end
bindKey("mouse2","down",onPlayerPressRightKeyInInventory)

function getInventoryInfosForRightClickMenu(itemName)
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Equip Primary Weapon"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Equip Secondary Weapon"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Equip Special Weapon"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
	if itemName == itemInfo[1] then
		return itemName,false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Food"]) do
	if itemName == itemInfo[1] then
		if itemInfo[1] == "Water Bottle" or itemInfo[1] == "Milk" or itemInfo[1] == "Soda Bottle" then
			info = "Drink"
		else
			info = "Eat"
		end
		return itemName,info
	end	
end
for i,itemInfo in ipairs(inventoryItems["Items"]) do
	if itemName == itemInfo[1] then
		return itemName,itemInfo[3] or false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Toolbelt"]) do
	if itemName == itemInfo[1] then
		return itemName,itemInfo[3] or false
	end
end
end

rightclickWindow = guiCreateStaticImage(0,0,0.05,0.0215,"images/scrollmenu_1.png",true)
headline["rightclickmenu"] = guiCreateLabel(0,0,1,1,"",true,rightclickWindow)
guiLabelSetHorizontalAlign (headline["rightclickmenu"],"center")
guiLabelSetVerticalAlign (headline["rightclickmenu"],"center")
guiSetFont (headline["rightclickmenu"], "default-bold-small" )
guiSetVisible(rightclickWindow,false)

function showRightClickInventoryMenu (itemName,itemInfo)
	if itemInfo then
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		guiSetVisible(rightclickWindow,true)
		guiSetText(headline["rightclickmenu"],itemInfo)
		local whith = guiLabelGetTextExtent (headline["rightclickmenu"])
		guiSetPosition(rightclickWindow,screenx,screeny,true)
		local x,y = guiGetSize(rightclickWindow,false)
		guiSetSize(rightclickWindow,whith,y,false)
		guiBringToFront(rightclickWindow)
		setElementData(rightclickWindow,"iteminfo",{itemName,itemInfo})
	end
end

function hideRightClickInventoryMenu ()
	guiSetVisible(rightclickWindow,false)
end


function onPlayerClickOnRightClickMenu (button,state)
    if button == "left" then
        local itemName,itemInfo = getElementData(rightclickWindow,"iteminfo")[1],getElementData(rightclickWindow,"iteminfo")[2]
		hideRightClickInventoryMenu ()
		playerUseItem(itemName,itemInfo)
    end
end
addEventHandler("onClientGUIClick",headline["rightclickmenu"],onPlayerClickOnRightClickMenu,false)

local playerFire = {}
local fireCounter = 0
function playerUseItem(itemName,itemInfo)
	if itemInfo == "Drink" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"thirst")
	elseif itemInfo == "Eat" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"food")	
	elseif itemInfo == "Usar Roupa" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerChangeSkin",getLocalPlayer(),itemName)
	elseif itemName == "Empty Water Bottle" then
		triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)		
	elseif itemName == "Tent" then
		triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
	elseif itemInfo == "Build a wire fence"	then
		triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
	elseif itemName == "Roadflare" then
		triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)	
	elseif itemInfo == "Colocar Fogo" then
		triggerServerEvent("onPlayerMakeAFire",getLocalPlayer(),itemName)	
	elseif itemInfo == "Use" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == "Bandage" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)	
	elseif itemInfo == "Use Googles" then
		triggerServerEvent("onPlayerChangeView",getLocalPlayer(),itemName)	
	elseif itemInfo == "Equip Primary Weapon" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1)
	elseif itemInfo == "Equip Secondary Weapon" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2)
	elseif itemInfo == "Equip Special Weapon" then -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3)
	--[[elseif itemInfo == "Read" then
		triggerServerEvent ("onPlayerReadMessage2",getLocalPlayer(),itemName)]]
	end

end

--[ID:0000015 - Clips/magazines for weapons] //L
weaponAmmoTable = {
--[[
["Pistol Ammo"] = {
{"Pistol",22},
{"Silenced Pistol",23},
{"Revolver",24},
},
]]--


["G13 Mag"] = {
{"G13",22},
},

["M9 SD Mag"] = {
{"M9 SD",23},
},

[".45ACP Round"] = {
{"Revolver",24},
},


--[[
["Smg Ammo"] = {
{"Uzi",28},
{"TEC-9",32},
{"MP5",29},
},
]]


["PPK Mag"] = {
{"PPK",28},
},

["MP5A5 Mag"] = {
{"MP5A5",29},
},


--[[["Assault Ammo"] = {
{"AK-47",30},
{"M4A1 CCO SD",31},
},
]]


["AK Mag"] = {
{"AK-47",30},
},

["30rnd STANAG"] = {
{"M4A1 CCO SD",31},
},


--[[
["Shotgun Ammo"] = {
{"Shotgun",25},
{"Sawn-Off Shotgun",26},
{"SPAZ-12 Combat Shotgun",27},
},
]]

["1866 Slug"] = {
{"Winchester 1866",25},
},

["2Rnd. Slug"] = {
{"Sawn-Off Shotgun",26},
},

["SPAZ-12 Pellet"] = {
{"SPAZ-12 Combat Shotgun",27},
},


--[[
["Sniper Ammo"] = {
{"Country Rifle",33},
{"Sniper Rifle",34},
},
]]

["DMR Mag"] = {
{"DMR",34},
},

["Lee Enfield Mag"] = {
{"Lee Enfield",33},
},


--[[
["Rocket Ammo"] = {
{"Heat-Seeking RPG",36},
{"Rocket Launcher",35},
},
]]


["M136 Rocket"] = {
{"Heat-Seeking RPG",36},
{"M136 Rocket Launcher",35},
},

["others"] = {
{"Parachute",46},
{"Satchel",39},
{"FlashBang",17},
{"Grenade",16},
{"Hunting Knife",4},
{"Firefighter Axe",8},
{"Binoculars",43}, -- [ID:0000006 - Binoculars] //L
-- [ID:0000018 - Melee Weapons + decrease spawning rate for ranged weapons] //L
{"Baseball Bat",5},
{"Shovel",6},
{"Golf Club",2},
},
}

--[ID:0000015 - Clips/magazines for weapons] //L
function getWeaponAmmoType2 (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[2] then
			return weaponData[1],weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["G13 Mag"]) do
		if weaponName == weaponData[2] then
			return "G13 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M9 SD Mag"]) do
		if weaponName == weaponData[2] then
			return "M9 SD Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".45ACP Round"]) do
		if weaponName == weaponData[2] then
			return ".45ACP Round",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["PPK Mag"]) do
		if weaponName == weaponData[2] then
			return "PPK Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["MP5A5 Mag"]) do
		if weaponName == weaponData[2] then
			return "MP5A5 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["AK Mag"]) do
		if weaponName == weaponData[2] then
			return "AK Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["30rnd STANAG"]) do
		if weaponName == weaponData[2] then
			return "30rnd STANAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
		if weaponName == weaponData[2] then
			return "1866 Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["SPAZ-12 Pellet"]) do
		if weaponName == weaponData[2] then
			return "SPAZ-12 Pellet",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
		if weaponName == weaponData[2] then
			return "2Rnd. Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["DMR Mag"]) do
		if weaponName == weaponData[2] then
			return "DMR Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Lee Enfield Mag"]) do
		if weaponName == weaponData[2] then
			return "Lee Enfield Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M136 Rocket"]) do
		if weaponName == weaponData[2] then
			return "M136 Rocket",weaponData[2]
		end
	end
end


function weaponSwitch (weapon)
	if source == getLocalPlayer() then
		local ammoName,_ = getWeaponAmmoType2 (weapon)
		if getElementData(getLocalPlayer(),ammoName) > 0 then
			setElementData(getLocalPlayer(),ammoName,getElementData(getLocalPlayer(),ammoName)-1)
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), weaponSwitch )


-- 	[ID:0000011 - Turn all Radio Stations off] //L
function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)



