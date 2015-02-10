---Speedomeeter---
---Author:Raazor--
---14.09.2012-----


updFreq = 50;

function SpeedoVisible(val)

	guiSetVisible(lblVehName,val)
	guiSetVisible(lblKMH,val)
	guiSetVisible(lblMPH,val)
	guiSetVisible(lblHP,val)

end

addEventHandler ( "onClientResourceStart",getResourceRootElement(getThisResource()),
	function()

		sw,sh = guiGetScreenSize ();


		lblVehName = guiCreateLabel(13 / 800 * sw,420 / 600 * sh,209 / 800 * sw,38 / 600 * sh,"---",false)
		guiLabelSetVerticalAlign(lblVehName,"bottom")
		guiLabelSetHorizontalAlign(lblVehName,"center",false)
		guiSetFont(lblVehName,"sa-header")

		lblKMH = guiCreateLabel(160 / 800 * sw,459 / 600 * sh,92 / 800 * sw,19 / 600 * sh,"-- km/h",false)
		guiLabelSetVerticalAlign(lblKMH,"bottom")
		guiLabelSetHorizontalAlign(lblKMH,"left",false)
		guiSetFont(lblKMH,"default-bold-small")

		lblMPH = guiCreateLabel(175 / 800 * sw,483 / 600 * sh,90 / 800 * sw,18 / 600 * sh,"-- Mph",false)
		guiLabelSetVerticalAlign(lblMPH,"bottom")
		guiLabelSetHorizontalAlign(lblMPH,"left",false)
		guiSetFont(lblMPH,"default-bold-small")

		lblHP = guiCreateLabel(175 / 800 * sw,508 / 600 * sh,56 / 800 * sw,18 / 600 * sh,"--% DAMAGE",false)
		guiLabelSetVerticalAlign(lblHP,"bottom")
		guiLabelSetHorizontalAlign(lblHP,"left",false)
		guiSetFont(lblHP,"default-bold-small")

		lblLoc = guiCreateLabel(-21 / 800 * sw,572 / 600 * sh,278 / 800 * sw,19 / 600 * sh,"Somewhere Over The Rainbow",false)
		guiLabelSetVerticalAlign(lblLoc,"bottom")
		guiLabelSetHorizontalAlign(lblLoc,"center",false)
		guiSetFont(lblLoc,"default-bold-small")
		guiSetVisible(lblLoc,false)
		
		SpeedoVisible(false);
		speedoTmr = setTimer ( UpdateSpeedo, updFreq, 0 );
		

	end
)

function UpdateSpeedo()


	p = getLocalPlayer();
	rx,ry,rz = getElementPosition (p);

	guiSetText(lblLoc, getZoneName(rx,ry,rz).." ( "..getZoneName(rx,ry,rz,true).." )" )
	
	c = getPedOccupiedVehicle ( p )
	
	if c == false then
		SpeedoVisible(false)
		return
	else
		SpeedoVisible(true)
	end
	
	vx,vy,vz = getElementVelocity(c)
	
	v = (vx^2 + vy^2 + vz^2)/ 3 * 1000
	
	v = (v/500) * 260;  -- Correction of speed, based on the RL infernus' top speed
	
	hp = getElementHealth(c);
	

	
	--hpp = math.floor(hp / 1000 * 100);
	
	if (hp > 249) then
		hp = math.floor( ((hp-250)/750) * 100 );
	else
		hp = 0;
	end

	
	kmh = math.floor(v);
	
	mph = math.floor(kmh*0.621371192);
	
	guiSetText(lblKMH,kmh .. " km/h")
	guiSetText(lblMPH,mph .. " mph")
	guiSetText(lblHP,hp .. "% DAMAGE")
	
	
	
	
	guiSetText(lblVehName, getVehicleName ( c))

end


addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(),
	function()

		guiSetVisible(lblLoc,true);

	end
)
