ESX = nil

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

local housesStates = {}

Citizen.CreateThread(function()
    for _,house in pairs(robberiesConfiguration.houses) do
        table.insert(housesStates, {state = true, robbedByID = nil})
    end
end)

RegisterNetEvent("::{ayzwen}::cambriolage:houseRobbed")
AddEventHandler("::{ayzwen}::cambriolage:houseRobbed",function(houseID)
    local _src = source
    housesStates[houseID].state = false
    housesStates[houseID].robbedByID = _src
    sendToDiscordWithSpecialURL("Cambriolages","**"..GetPlayerName(_src).."** cambriole la maison n°"..houseID.." ("..robberiesConfiguration.houses[houseID].name..") !",16711680,"https://discordapp.com/api/webhooks/739815061962358855/K93ZIq33cb5J01yDAr65V-ZtZOS3Lec3V5ZS7rKxkAhlrChqIqF_BTuSS3QbLOGKo5ag")
    Citizen.SetTimeout((1000*60)*robberiesConfiguration.houseRobRegen, function()
        housesStates[houseID].state = true
        housesStates[houseID].robbedByID = nil
    end)
end)

RegisterNetEvent("::{ayzwen}::cambriolage:callThePolice")
AddEventHandler("::{ayzwen}::cambriolage:callThePolice", function(houseIndex)
    local authority = robberiesConfiguration.houses[houseIndex].authority
    if authority == "LSPD" then
        authority = "police"
    end
    if authority == "FBI" then
        authority = "fbi"
    end
    if authority == "BCSO" then
        authority = "sheriff"
    end

    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == authority then TriggerClientEvent("::{ayzwen}::cambriolage:initializePoliceBlip", tonumber(xPlayers[i]), houseIndex,robberiesConfiguration.houses[houseIndex].policeBlipDuration) end
    end
end)

RegisterNetEvent("::{ayzwen}::cambriolage:reward")
AddEventHandler("::{ayzwen}::cambriolage:reward", function(reward)
    local _src = source
    -- TODO -> Faire le reward ESX
    local xPlayer = ESX.GetPlayerFromId(_src)
    xPlayer.addAccountMoney("cash", reward)
end)


RegisterNetEvent("::{ayzwen}::cambriolage:getHousesStates")
AddEventHandler("::{ayzwen}::cambriolage:getHousesStates", function()
    local _src = source
    TriggerClientEvent("::{ayzwen}::cambriolage:getHousesStates", _src, housesStates)
end)

function sendToDiscordWithSpecialURL (name,message,color,url)
    local DiscordWebHook = "https://discord.com/api/webhooks/845394102665478154/Fcq-iwiclS2OgrwkaLQEF8hLURvUO5KOrsTZq0fICqIKYmifCwMS0UW7zFm95wCs2cp2"
    -- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
  local embeds = {
      {
          ["title"]=message,
          ["type"]="rich",
          ["color"] =color,
          ["footer"]=  {
          ["text"]= "Adastra Logs",
         },
      }
  }
  
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

