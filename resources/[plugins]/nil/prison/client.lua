ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local isJailedG = false
local jailTimeG = 0

local courtCase = false
local muted = false
local notifyCourtHouseIn = false
local notifyCourtHouseOut = false

RegisterNetEvent("nico:goprison")
AddEventHandler('nico:goprison', function()
  local x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( GetPlayerFromServerId(source) ), true ) )
  local x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( GetPlayerFromServerId(targetPedId) ), true ) )
  local distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
    if jailTime <= 0 then
      return TriggerEvent("chatMessage", "^1Temps invalide, tu dois mettre un montant supérieur à 0.")
    else
      if (distance <= 10) then 
        TriggerServerEvent("nico:goprison", targetPedId, jailTime)
      else
        TriggerEvent('chatMessage', "^1ERREUR: Le Joueur est trop loin de vous")
      end 
    end
end)


RegisterNetEvent("nico:goprison")
AddEventHandler("nico:goprison", function(jailArray)
  local targetPed = PlayerPedId()
  local jailTime = jailArray[1]
  RemoveAllPedWeapons(targetPed, false)
  SetEntityInvincible(GetPlayerPed(targetPed), true)
  SetEntityCoords(targetPed, JailConfig.prisonLocation.x, JailConfig.prisonLocation.y, JailConfig.prisonLocation.z, 0.0, 0.0, 0.0, false)
  isJailedG = true
  jailTimeG = jailTime
  TriggerEvent("chatMessage",  "^2Tu es en prison ^2  ^2pendant ^1" .. jailTime .. " ^2Secondes.")
end)

RegisterNetEvent("nico:godehors")
AddEventHandler("nico:godehors", function()
  local targetPed = PlayerPedId()
  jailTimeG = 0
  isJailedG = false
  SetEntityInvincible(GetPlayerPed(targetPed), false)
  SetEntityCoords(targetPed, JailConfig.prisonEntraceLocation.x, JailConfig.prisonEntraceLocation.y, JailConfig.prisonEntraceLocation.z, 0.0, 0.0, 0.0, false)
  ESX.ShowNotification("Tu as fini ta peine, tu es libérer de la prison.")
end)

RegisterNetEvent("nico:TpPrison")
AddEventHandler("nico:TpPrison", function(pmuted, vector)
  local targetPed = PlayerPedId()
  RemoveAllPedWeapons(targetPed, true)
  SetEntityCoords(targetPed, vector.x, vector.y, vector.z, 0.0, 0.0, 0.0, false)
  SetEntityHeading(targetPed, vector.h)
  FreezeEntityPosition(targetPed, true)
  if pmuted then
    muted = true
  else
    muted = false
    DisableControlAction(0, 245, false)
    DisableControlAction(0, 249, false)
  end
end)

RegisterNetEvent("nico:TpDehors")
AddEventHandler("nico:TpDehors", function(vector)
  local targetPed = PlayerPedId()
  SetEntityCoords(targetPed, vector.x, vector.y, vector.z, 0.0, 0.0, 0.0, false)
  FreezeEntityPosition(targetPed, false)
  muted = false
  DisableControlAction(0, 245, false)
  DisableControlAction(0, 249, false)
end)

  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if muted then
        DisableControlAction(0, 245, true)
        DisableControlAction(0, 249, true)
      end
    end
  end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isJailedG then
      local playerPed = PlayerPedId()
      if GetDistanceBetweenCoords(GetEntityCoords(playerPed), JailConfig.prisonLocation.x, JailConfig.prisonLocation.y, JailConfig.prisonLocation.z) > 15 then
        SetEntityCoords(playerPed, JailConfig.prisonLocation.x, JailConfig.prisonLocation.y, JailConfig.prisonLocation.z, 0.0, 0.0, 0.0, false)
        ESX.ShowNotification("~r~Aller tu retourne dans la cage.")
      end
      Citizen.Wait(1000)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isJailedG then
      if jailTimeG == 0 then
        isJailedG = false
        TriggerServerEvent("nico:godehors", GetPlayerServerId(PlayerId()))
      end
      Citizen.Wait(1000 * 1)
      jailTimeG = jailTimeG - 1
      TriggerServerEvent("nico:updateJailTime", jailTimeG)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if jailTimeG > 0 then
      SetTextFont(0)
      SetTextProportional(1)
      SetTextScale(0.0, 0.4)
      SetTextColour(224, 50, 50, 255)
      SetTextDropshadow(0, 0, 0, 0, 255)
      SetTextEdge(1, 0, 0, 0, 255)
      SetTextDropShadow()
      SetTextOutline()
      SetTextEntry("STRING")
      if isJailedG then
        AddTextComponentString("Temps De Prison Restant: " .. tostring(jailTimeG) .. " Secondes car vous avez fait de la merde")
      else
        AddTextComponentString("Temps De Prison Restant: " .. tostring(jailTimeG) .. " Secondes car vous avez fait de la merde - PAUSE")
      end
      DrawText(0.5, 0.005)
    end
  end
end)



AddEventHandler("playerSpawned", function(spawnInfo)
  TriggerServerEvent("nico:RetourPrison")
end)  