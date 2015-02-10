setElementData(root, "moneyRPMagin", 100000000000000000000)
marker1 = createMarker(-330.7001953125, 1543.2001953125, 65.5, "cylinder", 2,  0, 255, 0, 255 )     
marker2 = createMarker(-2515, -637, 118, "cylinder", 2,  0, 255, 0, 255 )     
marker3 = createMarker(2581, 2792, 2.0, "cylinder", 2,  0, 255, 0, 255 )     
------------- OPen
function AbrirJanela1(hitPlayer)
	triggerClientEvent (hitPlayer,"openWindow",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker1,AbrirJanela1)

function AbrirJanela2(hitPlayer)
	triggerClientEvent (hitPlayer,"openWindow",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker2,AbrirJanela2)

function AbrirJanela3(hitPlayer)
	triggerClientEvent (hitPlayer,"openWindow",getRootElement(),hitPlayer)
end
addEventHandler("onMarkerHit",marker3,AbrirJanela3)