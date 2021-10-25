local CopsConnected = 0
local PlayersHarvestingCoke, PlayersTransformingCoke, PlayersSellingCoke = {}, {}, {}
local PlayersHarvestingMeth, PlayersTransformingMeth, PlayersSellingMeth = {}, {}, {}
local PlayersHarvestingWeed, PlayersTransformingWeed, PlayersSellingWeed = {}, {}, {}
local PlayersHarvestingOpium, PlayersTransformingOpium, PlayersSellingOpium = {}, {}, {}

someRandomGayData = exports['serverdata']:GetData('drugs')

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('::{ayzwen}::dumpIsForGayDude', function(source, cb)
	cb(someRandomGayData)
end)

AddEventHandler('playerDropped', function()
	PlayersHarvestingCoke[source], PlayersTransformingCoke[source], PlayersSellingCoke[source] = nil, nil, nil
	PlayersHarvestingMeth[source], PlayersTransformingMeth[source], PlayersSellingMeth[source] = nil, nil, nil
	PlayersHarvestingWeed[source], PlayersTransformingWeed[source], PlayersSellingWeed[source] = nil, nil, nil
	PlayersHarvestingOpium[source], PlayersTransformingOpium[source], PlayersSellingOpium[source] = nil, nil, nil
end)

function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer and (xPlayer.job.name == 'police' or xPlayer.job.name == 'swat') then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

local function HarvestWeed(xPlayer)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingWeed[xPlayer.source] then
			if xPlayer.canCarryItem('weed', 1) then
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(xPlayer)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('inv_full_weed'))
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startHarvestWeed')
AddEventHandler('::{ayzwen}::esx_drugs:startHarvestWeed', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
		if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
			PlayersHarvestingWeed[source] = true
			TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('pickup_in_prog'))
			HarvestWeed(ESX.GetPlayerFromId(source))
		else
			if pos ~= nil then
				sendToDiscord(source, "Essaye de ramassé de la Weed en de trop loin (> "..#(playerCoords - pos).." de distance)")
			else
				sendToDiscord(source, "Essaye de ramassé de la Weed en de trop loin (position null)")
			end
			TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Rammasage Weed")
			DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
		end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopHarvestWeed')
AddEventHandler('::{ayzwen}::esx_drugs:stopHarvestWeed', function()
	PlayersHarvestingWeed[source] = nil
end)

local function TransformWeed(xPlayer)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingWeed[xPlayer.source] then
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('too_many_pouches'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_pooch', 1)

				TransformWeed(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startTransformWeed')
AddEventHandler('::{ayzwen}::esx_drugs:startTransformWeed', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersTransformingWeed[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('packing_in_prog'))
		TransformWeed(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de traité de la Weed en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de traité de la Weed en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Traitement Weed")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopTransformWeed')
AddEventHandler('::{ayzwen}::esx_drugs:stopTransformWeed', function()
	PlayersTransformingWeed[source] = nil
end)

local function SellWeed(xPlayer)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingWeed[xPlayer.source] then
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('weed_pooch', 1)

				if CopsConnected == 0 then
					xPlayer.addAccountMoney('dirtycash', 250)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_weed'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('dirtycash', 250)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_weed'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('dirtycash', 250)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_weed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('dirtycash', 250)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_weed'))
				elseif CopsConnected >= 4 then
					xPlayer.addAccountMoney('dirtycash', 250)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_weed'))
				end

				SellWeed(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startSellWeed')
AddEventHandler('::{ayzwen}::esx_drugs:startSellWeed', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersSellingWeed[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('sale_in_prog'))
		SellWeed(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de vendre de la Weed en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de vendre de la Weed en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Vente Weed")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopSellWeed')
AddEventHandler('::{ayzwen}::esx_drugs:stopSellWeed', function()
	PlayersSellingWeed[source] = nil
end)

local function HarvestCoke(xPlayer)
	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingCoke[xPlayer.source] then
			if xPlayer.canCarryItem('coke', 1) then
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(xPlayer)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('inv_full_coke'))
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startHarvestCoke')
AddEventHandler('::{ayzwen}::esx_drugs:startHarvestCoke', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersHarvestingCoke[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('pickup_in_prog'))
		HarvestCoke(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de ramassé de la Coke en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de ramassé de la Coke en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Rammasage Coke")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopHarvestCoke')
AddEventHandler('::{ayzwen}::esx_drugs:stopHarvestCoke', function()
	PlayersHarvestingCoke[source] = nil
end)

local function TransformCoke(xPlayer)
	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingCoke[xPlayer.source] then
			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('too_many_pouches'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_pooch', 1)

				TransformCoke(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startTransformCoke')
AddEventHandler('::{ayzwen}::esx_drugs:startTransformCoke', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersTransformingCoke[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('packing_in_prog'))
		TransformCoke(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de traité de la Coke en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de ramassé de la Coke en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Traitement Coke")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopTransformCoke')
AddEventHandler('::{ayzwen}::esx_drugs:stopTransformCoke', function()
	PlayersTransformingCoke[source] = nil
end)

local function SellCoke(xPlayer)
	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingCoke[xPlayer.source] then
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('coke_pooch', 1)

				if CopsConnected == 0 then
					xPlayer.addAccountMoney('dirtycash', 400)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_coke'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('dirtycash', 400)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_coke'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('dirtycash', 400)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_coke'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('dirtycash', 400)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_coke'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('dirtycash', 400)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_coke'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('dirtycash', 400)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_coke'))
				end

				SellCoke(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startSellCoke')
AddEventHandler('::{ayzwen}::esx_drugs:startSellCoke', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersSellingCoke[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('sale_in_prog'))
		SellCoke(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de vendre de la Coke en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de vendre de la Coke en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Vente Coke")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopSellCoke')
AddEventHandler('::{ayzwen}::esx_drugs:stopSellCoke', function()
	PlayersSellingCoke[source] = nil
end)

local function HarvestMeth(xPlayer)
	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingMeth[xPlayer.source] then
			if xPlayer.canCarryItem('meth', 1) then
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(xPlayer)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('inv_full_meth'))
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startHarvestMeth')
AddEventHandler('::{ayzwen}::esx_drugs:startHarvestMeth', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersHarvestingMeth[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('pickup_in_prog'))
		HarvestMeth(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de ramassé de la Meth en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de ramassé de la Meth en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Rammasage Meth")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopHarvestMeth')
AddEventHandler('::{ayzwen}::esx_drugs:stopHarvestMeth', function()
	PlayersHarvestingMeth[source] = nil
end)

local function TransformMeth(xPlayer)
	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingMeth[xPlayer.source] then
			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('too_many_pouches'))
			elseif methQuantity < 5 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_pooch', 1)

				TransformMeth(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startTransformMeth')
AddEventHandler('::{ayzwen}::esx_drugs:startTransformMeth', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersTransformingMeth[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('packing_in_prog'))
		TransformMeth(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de traité de la Meth en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de traité de la Meth en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Traitement Meth")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopTransformMeth')
AddEventHandler('::{ayzwen}::esx_drugs:stopTransformMeth', function()
	PlayersTransformingMeth[source] = nil
end)

local function SellMeth(xPlayer)
	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingMeth[xPlayer.source] then
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('meth_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				elseif CopsConnected == 5 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				elseif CopsConnected >= 6 then
					xPlayer.addAccountMoney('dirtycash', 450)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_meth'))
				end

				SellMeth(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startSellMeth')
AddEventHandler('::{ayzwen}::esx_drugs:startSellMeth', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersSellingMeth[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('sale_in_prog'))
		SellMeth(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de vendre de la Meth en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de vendre de la Meth en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Vente Meth")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopSellMeth')
AddEventHandler('::{ayzwen}::esx_drugs:stopSellMeth', function()
	PlayersSellingMeth[source] = nil
end)

local function HarvestOpium(xPlayer)
	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingOpium[xPlayer.source] then
			if xPlayer.canCarryItem('opium', 1) then
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(xPlayer)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('inv_full_opium'))
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startHarvestOpium')
AddEventHandler('::{ayzwen}::esx_drugs:startHarvestOpium', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersHarvestingOpium[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('pickup_in_prog'))
		HarvestOpium(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de ramassé de l'Opium en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de ramassé de l'Opium en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Rammasage Opium")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopHarvestOpium')
AddEventHandler('::{ayzwen}::esx_drugs:stopHarvestOpium', function()
	PlayersHarvestingOpium[source] = nil
end)

local function TransformOpium(xPlayer)
	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingOpium[xPlayer.source] then
			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('too_many_pouches'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)

				TransformOpium(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startTransformOpium')
AddEventHandler('::{ayzwen}::esx_drugs:startTransformOpium', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersTransformingOpium[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('packing_in_prog'))
		TransformOpium(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de traité de l'Opium en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de traité de l'Opium en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Traitement Opium")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopTransformOpium')
AddEventHandler('::{ayzwen}::esx_drugs:stopTransformOpium', function()
	PlayersTransformingOpium[source] = nil
end)

local function SellOpium(xPlayer)
	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingOpium[xPlayer.source] then
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)

				if CopsConnected == 0 then
					xPlayer.addAccountMoney('dirtycash', 500)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('dirtycash', 500)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('dirtycash', 500)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('dirtycash', 500)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('dirtycash', 500)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('dirtycash', 500)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('sold_one_opium'))
				end

				SellOpium(xPlayer)
			end
		end
	end)
end

RegisterServerEvent('::{ayzwen}::esx_drugs:startSellOpium')
AddEventHandler('::{ayzwen}::esx_drugs:startSellOpium', function(pos)
	local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
		
	if pos ~= nil and #(playerCoords - pos) < Config.ZoneSize.x + 20 then
		PlayersSellingOpium[source] = true
		TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('sale_in_prog'))
		SellOpium(ESX.GetPlayerFromId(source))
	else
		if pos ~= nil then
			sendToDiscord(source, "Essaye de vendre de l'Opium en de trop loin (> "..#(playerCoords - pos).." de distance)")
		else
			sendToDiscord(source, "Essaye de vendre de l'Opium en de trop loin (position null)")
		end
		TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Vente Opium")
		DropPlayer(source, "[Adastra] Vous avez été banni : La drogue c'est mal, surtout avec un cheat !")
	end
end)

RegisterServerEvent('::{ayzwen}::esx_drugs:stopSellOpium')
AddEventHandler('::{ayzwen}::esx_drugs:stopSellOpium', function()
	PlayersSellingOpium[source] = nil
end)

ESX.RegisterUsableItem('weed', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('::{ayzwen}::esx_drugs:onPot', xPlayer.source)
	TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('used_one_weed'))
end)

function sendToDiscord(player, reason)
    local name = GetPlayerName(player)
    print(name)
    local reason = reason
    print(reason)
    local steamid = "Inconnu"
    local license = "Inconnu"
    local discord = "Inconnu"
    local xbl = "Inconnu"
    local liveid = "Inconnu"
    local ip = "Inconnu"

    for k, v in pairs(GetPlayerIdentifiers(player)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = string.sub(v, 4)
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@" .. discordid .. ">"
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end
	local DiscordWebHook = "https://discord.com/api/webhooks/848019477320433725/ALCf3mdPdiEemiupOdVniMJOVUjuEj09Bqm65fodlyymaU0pzO6ApZsFj7PxRNTNUxLT"
    local embeds = {
        ["color"] = "15158332",
        ["type"] = "rich",
        ["title"] = "Un joueur a été banni !",
        ["description"] = "**Name : **" ..
            name ..
                "\n **Reason : **" ..
                    reason ..
                        "\n **ID : **" ..
                            player ..
                                "\n **IP : **" ..
                                    ip ..
                                        "\n **Steam Hex : **" ..
                                            steamid .. "\n **License : **" .. license .. "\n **Discord : **" .. discord,
        ["footer"] = {
            ["text"] = " AdastraAC "
        }
    }
    PerformHttpRequest(
        DiscordWebHook,
                function(err, text, headers)
                end,
                "POST",
                json.encode({username = " AdastraAC", embeds = {embeds}}),
                {["Content-Type"] = "application/json"}
            )
end 