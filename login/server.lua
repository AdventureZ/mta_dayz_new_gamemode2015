--[[
#---------------------------------------------------------------#
----* DayZ MTA Script server.lua                            *----
----* Script created by: Marwin                             *----
----* New additions and functions by: Unknown               *----
----* WarZone Login Panel                                   *----
#---------------------------------------------------------------#
]]

local root = getRootElement()
tryToLoginPlayer = function(username, password)
  local account = getAccount(username, password)
  if account then
    local accountName = getAccountName(account)
    logIn(source, account, password)
    triggerClientEvent(source, "onPlayerDoneLogin", source, accountName, password)
    triggerEvent("onPlayerDayZLogin", getRootElement(), username, pass, source)
  else
    outputChatBox("[Login]#FF9900 Wrong Passwort or Username", source, 255, 255, 255, true)
  end
end

addEvent("onClientSendLoginDataToServer", true)
addEventHandler("onClientSendLoginDataToServer", root, tryToLoginPlayer)
tryToRegsiterPlayer = function(username, pass)
  if not getAccount(username) then
    theAccount = addAccount(username, pass)
    if theAccount then
      logIn(source, theAccount, pass)
      --outputChatBox("You successfully registered account '" .. username .. "' for player '" .. getPlayerName(source) .. "'#FFFFFF with password '" .. pass .. "'!", source, 255, 255, 255, true)
	  outputChatBox("You successfully registered account '" .. username .. "' for player '" .. getPlayerName(source) .. "'#FFFFFF !", source, 255, 255, 255, true)
      triggerClientEvent(source, "onPlayerDoneLogin", source, username, pass)
      triggerEvent("onPlayerDayZRegister", getRootElement(), username, pass, source)
    else
      reason = "Unknown Error!"
      outputChatBox("[Login]#FF9900 " .. reason, source, 255, 255, 255, true)
    end
  else
    reason = "Account already exists!"
    outputChatBox("[Login]#FF9900 " .. reason, source, 255, 255, 255, true)
  end
end

addEvent("onClientSendRegisterDataToServer", true)
addEventHandler("onClientSendRegisterDataToServer", getRootElement(), tryToRegsiterPlayer)
addEventHandler("onPlayerJoin", getRootElement(), function()
  fadeCamera(source, true)
  setCameraMatrix(source, 2659.2990722656,2730.078125,11.622900009155,2660.2810058594,2730.2053222656,11.483201980591)
end
)
addEvent("requestServerNews", true)
addEventHandler("requestServerNews", root, function()
  -- upvalues: root
  local text1 = get("news1")
  local text2 = get("news2")
  local text3 = get("news3")
  local text4 = get("news4")
  local bool1 = get("news1new")
  local bool2 = get("news2new")
  local bool3 = get("news3new")
  local bool4 = get("news4new")
  triggerClientEvent(source, "onClientGetNews", root, text1, text2, text3, text4, bool1, bool2, bool3, bool4)
end
)

