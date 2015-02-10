function setWeatherConfig()
	local hour,minute = getTime()
    if hour >= 12 and hour <= 14 then
		setWeather(4)
	elseif hour >= 14 and hour <= 17 then
		setWeather(8)
	elseif hour >= 17 and hour <= 20 then
		setWeather(7)
	elseif hour >= 20 and hour <= 21 then
		setWeather(7)
	elseif hour >= 21 and hour <= 23 then
		setWeather(9)
	elseif hour >= 23 and hour <= 3 then
		setWeather(16)
	elseif hour >= 3 and hour <= 5 then
		setWeather(20)
	elseif hour >= 5 and hour <= 7 then
		setWeather(27)
	elseif hour >= 7 and hour <= 10 then
		setWeather(30)
	elseif hour >= 10 and hour <= 12 then
		setWeather(30)
    end
end
setTimer(setWeatherConfig,60000,0)

function checkSetTime()
    local real = getRealTime()
    setTime(real.hour,real.minute)
end
setTimer(checkSetTime,60000,0)

function setWeatherConfig2()
    local real = getRealTime()
    setTime(real.hour,real.minute)
	setTrafficLightsLocked(false)
	setMinuteDuration(60000)
	setTrafficLightState(6)
	setFarClipDistance(300)
	setFogDistance(-50)
end
addEventHandler("onClientResourceStart",getRootElement(),setWeatherConfig2)