--[[ Environment 
-- Time Sync --
Citizen.CreateThread(function()
	while true do
		local _, _, _, hour, minute = GetUtcTime()
		NetworkOverrideClockTime(hour, minute, 0)
		Citizen.Wait(60000)
	end
end)

-- Weather Sync --
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeatherTypeNowPersist('EXTRASUNNY')
	end
end)]]--

local safeZones = {
	vector3(-821.2, -127.65, 28.18), -- SPAWN
	vector3(218.76, -802.87, 30.09), -- PC
	vector3(429.54, -981.86, 30.71), -- LSPD
	vector3(133.2, -147.96, 54.86), -- CARSHOP
	vector3(295.68, -586.45, 43.14), -- HOPITAL
	vector3(-211.34, -1322.06, 30.89), -- MECANO
	vector3(234.42, -863.06, 29.86), -- PC
	vector3(16.58, -1116.03, 29.79), -- AMMU
	vector3(1642.37, 2529.20, 45.56), -- PRISON
	vector3(-53.4, -1112.88, 26.44), -- DEVANT CONCESS
	vector3(1852.50, 2586.00, 45.05), -- PRISON DEHORS
}

local disabledSafeZonesKeys = {
	{group = 2, key = 37, message = 'Vous ne pouvez pas sortir d\'arme en SafeZone'},
	{group = 0, key = 24, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 69, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 92, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 45, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
    {group = 0, key = 44, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
    {group = 0, key = 140, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
    {group = 0, key = 141, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
    {group = 0, key = 142, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 106, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 168, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 160, message = 'Vous ne pouvez pas faire ceci en SafeZone'},
	{group = 0, key = 160, message = 'Vous ne pouvez pas faire ceci en SafeZone'}
}

local notifIn, notifOut = false, false
local closestZone = 1

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end

	while true do
		local plyPed = PlayerPedId()
		local plyCoords = GetEntityCoords(plyPed, false)
		local minDistance = 70000

		for i = 1, #safeZones, 1 do
			local dist = #(safeZones[i] - plyCoords)

			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end

		Citizen.Wait(15000)
	end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end

	while true do
		Citizen.Wait(0)
		local plyPed = PlayerPedId()
		local plyCoords = GetEntityCoords(plyPed, false)
		local dist = #(safeZones[closestZone] - plyCoords)

		if dist <= 50 then
			if not notifIn then
				NetworkSetFriendlyFireOption(false)
				SetCurrentPedWeapon(plyPed, `WEAPON_UNARMED`, true)

				notifIn = true
				notifOut = false
			end
		else
			if not notifOut then
				NetworkSetFriendlyFireOption(true)

				notifOut = true
				notifIn = false
			end
		end

		if notifIn then
			for vehicle in KRZ.Game.EnumerateVehicles() do
				if not IsVehicleSeatFree(vehicle, -1) then
					SetEntityNoCollisionEntity(plyPed, vehicle, true)
					SetEntityNoCollisionEntity(vehicle, plyPed, true)
				end
			end

			DisablePlayerFiring(player, true)

			for i = 1, #disabledSafeZonesKeys, 1 do
				DisableControlAction(disabledSafeZonesKeys[i].group, disabledSafeZonesKeys[i].key, true)

				if IsDisabledControlJustPressed(disabledSafeZonesKeys[i].group, disabledSafeZonesKeys[i].key) then
					SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)

					if disabledSafeZonesKeys[i].message then
						ESX.ShowAdvancedNotification("Informations", "", disabledSafeZonesKeys[i].message, "CHAR_ANDREAS", 1)
					end
				end
			end
		end
	end
end)