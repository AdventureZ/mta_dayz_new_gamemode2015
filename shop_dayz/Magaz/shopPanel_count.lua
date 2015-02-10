inventoryItems = {
["Weapons"] = {
["Primary Weapon"] = {
{"ПКП",4},
{"AKS-74U",3},
{"AKS",3},
{"AKM",3},
{"M200",3},
{"M16A2 + M203",3},
{"M4A1 CCO",3},
{"MK48",4},
{"AS50",3},
{"ACR",3},
{"G36C SD",3},
{"M4A1 Holo",3},
{"SA-58V ACOG",3},
{"SVD Camo",3},
{"CZ550",3},
{"DMR",3},
{"KSVK",3},
{"M24",3},
{"M249 SAW",3},
{"M107",3},
{"M40A3",3},
{"M14",3},
{"JNG-90",5},
{"M240",4},
{"AKM GP",3},
{"G36K",3},
{"Benelli M3",3},
{"SPAZ-12",3},
{"Sawn-Off Shotgun",3},
{"FN SCAR",3},
{"Арбалет",3},
{"Lee Enfield",3},
{"Детонатор", 6}, 
{"C4", 5},
},

["Secondary Weapon"] = {
{"ПМ",2},
{"G17",2},
{"MP5",3},
{"M9 SD",2},
{"PDW",2},
{"Desert Deagle",2},
{"Охотничий нож",1},
{"Топор",2},
{"Бейсбольная бита",2},
{"Лопата",2},
{"Клюшка для гольфа",2},
},

["Specially Weapon"] = {
{"Парашют",1},
{"Tear Gas",1},
{"Граната",1},
{"Бинокль",1}
},

},
["Ammo"] = {
{"ПМ Mag",0.06},
{"M9 SD Mag",0.05},
{"Desert Deagle Mag",0.14},
{"AKM Mag",0.03},
{"STANAG",0.03},
{"G36K Mag",0.03},
{"ПКП Mag",0.01},
{"ACR Mag",0.03},
{"G17 Mag",0.05},
{"MP5 Mag",0.03},
{"SA-58 Mag",0.03},
{"Arrow",0.03},
{"MK48 Mag",0.01},
{"Benelli M3 Mag",0.14},
{"2Rnd. Slug",0.5},
{"SPAZ-12 Slug",0.14},
{"SVD Camo Mag",0.2},
{"CZ550 Mag",0.2},
{"AS50 Mag",0.2},
{"M200 Mag",0.2},
{"DMR Mag",0.2},
{"KSVK Mag",0.2},
{"M24 Mag",0.2},
{"M249 SAW Mag",0.01},
{"M107 Mag",0.2},
{"M40A3 Mag",0.2},
{"M14 Mag",0.1},
{"JNG-90 Mag",0.1},
{"M240 Mag",0.01},
{"Lee Enfield Mag",0.1},},

["Food"] = {
{"Фляга",1},
{"Банка макарон",1},
{"Банка бобов",1},
{"Гамбургер",1},
{"Пицца",1},
{"Банка соды",1},
{"Молоко",1},
{"Сырое мясо",1},
{"Жареное мясо",1},
},

["Pack"] = { 
{"Assault Pack (ACU)",1,"Одеть"},
{"Alice Pack",1,"Одеть"},
{"Czech Backpack",1,"Одеть"},
{"Survival Backpack",1,"Одеть"},
{"Dead Backpack",1,"Одеть"},
{"Mega Backpack",1,"Одеть"},
{"Nova Backpack",1,"Одеть"},
{"Ghillie Backpack",1,"Одеть"},
{"Coyote Backpack",1,"Одеть"},
},

["Items"] = {
{"Дрова",2},
{"Бинт",1,"Перевязаться"},
{"Фаер",1,"Зажечь"},
{"Пустая канистра",2},
{"Наполненная канистра",2},
{"Аптечка",2,"Исп."},
{"Грелка",1,"Исп."},
{"Болеутоляющие",1,"Исп."},
{"Морфий",1,"Исп."},
{"Пакет крови",1,"Исп."},
{"Колючая проволока",1,"Поставить проволоку"},
{"Колесо",2},
{"Двигатель",5},
{"Бензобак",3},
{"Палатка",3,"Разложить"},
{"Армейский камуфляж",1,"Переодется"},
{"Агент призрак",1,"Переодется"},
{"Одежда разведчика",1,"Переодется"},
{"Одежда инженера",1,"Переодется"},
{"Городской камуфляж",1,"Переодется"},
{"Пустынный камуфляж",1,"Переодется"},
{"Гражданская одежда",1,"Переодется"},
{"Полицейская форма",1,"Переодется"},
{"Женская одежда",1,"Переодется"},
{"Женский камуфляж",1,"Переодется"},
{"Одежда мародера",1,"Переодется"},
{"Одежда наёмника",1,"Переодется"},
{"Женский скин",1,"Переодется"},
{"Админ скин",1,"Переодется"},
{"Тяжелая броня",1,"Переодется"},
{"Одежда выжившего",1,"Переодется"},
{"Камуфляж снайпера",1,"Переодется"},
{"Пустая фляга",1,"Наполнить"}, 
{"Пустая банка соды",1},
{"Объедки",1},
{"Болгарка",1},
{"Сейф",3,"Установить"},
},

["Toolbelt"] = {
{"Очки ночного видения",1},
{"Инфокрасные очки",1},
{"Деньги",1},
{"Карта",1},
{"Спички",1,"Поджечь"},
{"Часы",1},
{"GPS",1},
{"Инструменты",1},
{"Рация",1},
},
}









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
    for id, item in ipairs(inventoryItems["Pack"]) do 
    if itema == item[1] then   
     return item[2] 
    end 
   end
	for id, item in ipairs(inventoryItems["Items"]) do
		if itema == item[1] then 
			return item[2]
		end
	end
	return 0
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
 for id, item in ipairs(inventoryItems["Pack"]) do 
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

function getPlayerMaxAviableSlots()
	return getElementData(getLocalPlayer(),"MAX_Slots")
end