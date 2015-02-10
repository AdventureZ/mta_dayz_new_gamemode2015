-- function MSG [1][4] 
function sayy(thePlayer, command, ...)
    if ( hasObjectPermissionTo ( thePlayer, "command.aexec", true ) ) then
                local args = { ... }

                local msg = ""

                for k,v in pairs(args) do

                msg = msg .. ' ' .. v
     end
    if(msg ~= "") then

    outputChatBox ( "#7E0594[ANUNCIO] #746A05†Programador†#0FEED8  " .. getPlayerName(thePlayer) ..  ": #EFF209".. msg, getRootElement(), 255, 165, 0, true )
       end
       else
       outputChatBox ("Você não é Programador!", thePlayer, 193, 13, 13)
    end
end
addCommandHandler("psay", sayy)
-- MSG [2][3]
local supporterMode = {}
local foodd = {}
local thirstt = {}
Supportermode = function(playersource, command)
  -- upvalues: supporterMode , foodd , thirstt
  supporterMode[playersource] = (not supporterMode[playersource] and true)
  if supporterMode[playersource] then
    setElementAlpha(playersource, 0)
    --setElementFrozen(playersource, true)
    foodd[playersource] = getElementData(playersource, "food")
    thirstt[playersource] = getElementData(playersource, "thirst")
  else
    setElementAlpha(playersource, 255)
    setElementFrozen(playersource, false)
  end
  do return end
  outputChatBox("#FFFFFFTU NAO E ADMIN PRA USAR FDP!", playersource, 27, 89, 224, true)
end

addCommandHandler("mxgodz", Supportermode)
StatsSupportermode = function()
  -- upvalues: supporterMode , foodd , thirstt
  for i,player in ipairs(getElementsByType("player")) do
    if supporterMode[player] then
      setElementData(player, "food", foodd[player])
      setElementData(player, "thirst", thirstt[player])
    end
  end
end

setTimer(StatsSupportermode, 60000, 0)
preventCommandSpam = function(commandName)
  if commandName == "login" or commandName == "logout" then
    cancelEvent()
  end
end
-- MSG [3][4]
maikmod = function(playersource, command, ...)
  local msg = table.concat({...}, " ")
  if getAccountData(getPlayerAccount(playersource), "Moderator") == true then
    outputChatBox("#F9D905[ANUNCIO]#C67211 Moderador #E4E119" .. getPlayerName(playersource) .. ": #13F807 " .. msg, getRootElement(), 60, 200, 40, true)
  else
  outputChatBox("#FFFFFFVocê não e #E01BBCfeminina#FFFFFF o suficiente para usar este comando! ", playersource, 27, 89, 224, true)
  end
end

addCommandHandler("msay", maikmod)
-- MSG [4][4]
maikadm = function(playersource, command, ...)
  local msg = table.concat({...}, " ")
  if getAccountData(getPlayerAccount(playersource), "admin") == true then
    outputChatBox("#F9D905[ANUNCIO]#C67211 Admin #E4E119" .. getPlayerName(playersource) .. ": #13F807 " .. msg, getRootElement(), 60, 200, 40, true)
  else
  outputChatBox("#FFFFFFVocê não e #E01BBCfeminina#FFFFFF o suficiente para usar este comando! ", playersource, 27, 89, 224, true)
  end
end

addCommandHandler("asay", maikadm)
-- MSG [5][5]
maiksmod = function(playersource, command, ...)
  local msg = table.concat({...}, " ")
  if getAccountData(getPlayerAccount(playersource), "SuperModerator") == true then
    outputChatBox("#F9D905[ANUNCIO]#C67211 SMod #E4E119" .. getPlayerName(playersource) .. ": #13F807 " .. msg, getRootElement(), 60, 200, 40, true)
  else
  outputChatBox("#FFFFFFVocê não e #E01BBCfeminina#FFFFFF o suficiente para usar este comando! ", playersource, 27, 89, 224, true)
  end
end

addCommandHandler("ssay", maiksmod)
