function godmodeHandler ( attacker, weapon, bodypart )
	if getElementType(localPlayer) == "player" then
		setElementData(localPlayer, "blood", 12000)
	end
	
	if attacker then 
		if getElementType(attacker) == "player" then
			triggerServerEvent("kilLDayZPlayer", attacker)
		elseif getElementType(attacker) == "ped" then
			if getElementData(attacker,"zombie") then
				triggerServerEvent("onZombieGetsKilled", attacker)
			end
		end
	end
end

addEvent ("enableGodMode",true)
addEventHandler ("enableGodMode",getRootElement(),
function()
	if (source == getLocalPlayer()) then
		addEventHandler ("onClientPlayerDamage", getRootElement(), godmodeHandler)
	end
end)

addEvent ("disableGodMode",true)
addEventHandler ("disableGodMode",getRootElement(),
function()
	if (source == getLocalPlayer()) then
		removeEventHandler ("onClientPlayerDamage", getRootElement(), godmodeHandler)
	end
end)