
addGang = function(gangName, gangLeader)
  if not doesGangExists(gangName) then
    if executeSQLInsert("gangs", "'" .. tostring(gangName) .. "','" .. tostring(gangLeader) .. "','0','[ ]'") then
      outputDebugString("Gang system: Gang created name: " .. tostring(gangName) .. ", leader: " .. tostring(gangLeader))
      addGangMember(gangName, gangLeader, "System")
      return true
    else
      return false, "An error has occurred."
    end
  else
    return false, "Gang already exists."
  end
end

removeGang = function(gangName)
  if executeSQLDelete("gangs", "gang_name = '" .. tostring(gangName) .. "'") then
    for index,member in ipairs(executeSQLQuery("SELECT * FROM gang_members WHERE gang_name = '" .. tostring(gangName) .. "'")) do
      removeGangMember(gangName, member.member_account)
    end
    return true
  else
    return false, "An error has occurred."
  end
end

doesGangExists = function(gangName)
  local check = executeSQLSelect("gangs", "*", "gang_name = '" .. tostring(gangName) .. "'")
  if (type(check) == "table" and #check == 0) or not check then
    return false
  else
    return true
  end
end

getGangList = function()
  local data = executeSQLQuery("SELECT * FROM gangs")
  return data
end

getGangMembers = function(gangName)
  if doesGangExists(gangName) then
    local data = executeSQLQuery("SELECT * FROM gang_members WHERE gang_name = '" .. tostring(gangName) .. "'")
    return data
  else
    return false, "The gang doesn't exists."
  end
end

addGangMember = function(gangName, memberAccount, addedBy)
  if not doesGangExists(gangName) then
    return false, "The gang doesn't exists."
  end
  if isGangMember(gangName, memberAccount) then
    return false, "This member already exists."
  end
  if executeSQLInsert("gang_members", "'" .. tostring(gangName) .. "','" .. tostring(memberAccount) .. "','" .. tostring(addedBy) .. "'") then
    local account = getAccount(memberAccount)
    if account and getAccountPlayer(account) then
      setElementData(getAccountPlayer(account), "gang", gangName)
      setTimer(triggerEvent, 200, 1, "onPlayerJoinGang", getAccountPlayer(account), gangName)
    end
    outputDebugString("Gang system: Member added to: " .. tostring(gangName) .. ", account: " .. tostring(memberAccount))
    return true
  else
    return false, "An error has occurred."
  end
end

removeGangMember = function(gangName, memberAccount, kickerName)
  if executeSQLDelete("gang_members", "member_account = '" .. tostring(memberAccount) .. "' AND gang_name = '" .. tostring(gangName) .. "'") then
    local account = getAccount(memberAccount)
    if account and not isGuestAccount(account) then
      local player = getAccountPlayer(account)
      if player then
        if player and kickerName then
          outputChatBox("Gang system: You have been kicked from " .. tostring(gangName) .. " by " .. tostring(kickerName) .. ".", player, 255, 0, 0)
        else
          outputChatBox("Gang system: You have left " .. tostring(gangName) .. ".", player, 255, 0, 0)
        end
        setTimer(triggerEvent, 200, 1, "onPlayerLeaveGang", player, gangName)
        setElementData(player, "gang", "None")
      end
    else
      triggerEvent("onPlayerLeaveGang", memberAccount, gangName)
    end
    return true
  else
    return false, "An error has occurred."
  end
end

isGangMember = function(gangName, memberAccount)
  if doesGangExists(gangName) then
    local check = executeSQLSelect("gang_members", "*", "gang_name = '" .. tostring(gangName) .. "' AND member_account = '" .. tostring(memberAccount) .. "'")
    if (type(check) == "table" and #check == 0) or not check then
      return false, "The member doesn't exists."
    else
      return true
    end
  else
    return false, "The gang doesn't exists."
  end
end

getAccountGang = function(memberAccount)
  local check = executeSQLSelect("gang_members", "*", "member_account = '" .. tostring(memberAccount) .. "'")
  if (type(check) == "table" and #check == 0) or not check then
    return "None"
  else
    return tostring(check[1].gang_name)
  end
end

getGangLeader = function(gangName)
  if doesGangExists(gangName) then
    local data = executeSQLQuery("SELECT gang_leader FROM gangs WHERE gang_name='" .. tostring(gangName) .. "'")
    return tostring(data[1].gang_leader)
  else
    return false, "The gang doesn't exists."
  end
end

editGangSubLeaders = function(gangName, memberAccount, addOrRemove)
  if doesGangExists(gangName) then
    local subLeaders = getGangSubLeaders(gangName)
    local sLeaders = {}
    if subLeaders and subLeaders ~= "[ ]" then
      for index,subLeader in ipairs(fromJSON(subLeaders)) do
        table.insert(sLeaders, subLeader)
      end
    end
    if not addOrRemove then
      for index,subLeader in ipairs(sLeaders) do
        if subLeader == memberAccount then
          table.remove(sLeaders, index)
        end
      end
    else
      table.insert(sLeaders, memberAccount)
    end
    return executeSQLUpdate("gangs", "gang_subleaders = '" .. toJSON(sLeaders) .. "'", "gang_name = '" .. gangName .. "'")
  else
    return false, "The gang doesn't exists."
  end
end

getGangSubLeaders = function(gangName)
  if doesGangExists(gangName) then
    local data = executeSQLQuery("SELECT gang_subleaders FROM gangs WHERE gang_name='" .. tostring(gangName) .. "'")
    return tostring(data[1].gang_subleaders)
  else
    return false, "The gang doesn't exists."
  end
end

isGangSubLeader = function(gangName, memberAccount)
  if doesGangExists(gangName) then
    local subLeaders = getGangSubLeaders(gangName)
    local isSubLeader = false
    if subLeaders and subLeaders == "[ ]" then
      return 
    end
    for index,subLeader in ipairs(fromJSON(subLeaders)) do
      if subLeader == memberAccount then
        isSubLeader = true
      else
        isSubLeader = false
      end
    end
    if isSubLeader then
      return true
    else
      return false, "This member is not a sub leader."
    end
  else
    return false, "The gang doesn't exists."
  end
end

getPlayerFromNamePart = function(playerPart)
  local pl = getPlayerFromName(playerPart)
  if isElement(pl) then
    return pl
  end
  do return end
  for i,v in ipairs(getElementsByType("player")) do
    if string.find(getPlayerName(v), playerPart) then
      return v
    end
  end
end

isPlayerGangInvited = function(thePlayer)
  if invitations[thePlayer] then
    return true, invitations[thePlayer][1], invitations[thePlayer][2]
  else
    return false
  end
end

getPlayersByGang = function(gangName)
  local theTable = {}
  for index,player in pairs(getElementsByType("player")) do
    if getElementData(player, "gang") == tostring(gangName) then
      table.insert(theTable, player)
    end
  end
  return theTable
end


