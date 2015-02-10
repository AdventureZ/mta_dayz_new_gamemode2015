addEventHandler ("onResourceStart",getResourceRootElement(getThisResource()),
function()
  local allGreenzones = getElementsByType ("radararea")
	for i,v in ipairs (allGreenzones) do
		local r,g,b,a = getRadarAreaColor (v)
		local x,y = getElementPosition (v)
		local sx,sy = getRadarAreaSize (v)
		local col = createColCuboid (x,y, -50, sx,sy, 7500)
		setElementID (col, "greenzoneColshape")
	end
end)

addEventHandler ("onColShapeHit", getRootElement(), 
function(hitElement, matchingDimension)
	if (getElementID (source) == "greenzoneColshape") then
		if (isElement(hitElement)) and (getElementType (hitElement) == "vehicle") then
			setVehicleDamageProof(hitElement, true)
		end
		
		if (isElement(hitElement)) and (getElementType (hitElement) == "player") then
			outputChatBox("Вы вошли в GreenZone", hitElement)
			triggerClientEvent (hitElement, "enableGodMode", hitElement)
			setElementData ( hitElement, "greenZoneGuard", true )
			
			toggleControl (hitElement, "fire", false)
			toggleControl (hitElement, "next_weapon", false)
			toggleControl (hitElement, "previous_weapon", false)
			toggleControl (hitElement, "aim_weapon", false)
			--outputChatBox (getPlayerName(hitElement) .. " , вы вошли в GrenZone")
		else
			local skin = getElementModel (hitElement)
			if skin == 22 then 
				if isElement ( hitElement ) then
					destroyElement(hitElement)
				end
			end
		end
	end
end)

addEventHandler ("onColShapeLeave", getRootElement(), 
function(leaveElement, matchingDimension)
	if (getElementID (source) == "greenzoneColshape") then
		if (isElement(leaveElement)) and (getElementType (leaveElement) == "vehicle") then
			setVehicleDamageProof(leaveElement, false)
		end
	
		if (getElementType (leaveElement) == "player") then
            outputChatBox("Вы вышли из GreenZone", leaveElement)
			triggerClientEvent (leaveElement, "disableGodMode", leaveElement)
			setElementData ( leaveElement, "greenZoneGuard", false )
			toggleControl (leaveElement, "fire", true)
			toggleControl (leaveElement, "next_weapon", true)
			toggleControl (leaveElement, "previous_weapon", true)
			toggleControl (leaveElement, "aim_weapon", true)
	--		outputChatBox("Вы вышли из GrenZone", 255, 255, 255 , true)
		end
	end
end)