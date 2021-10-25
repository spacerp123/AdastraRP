TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('::{ayzwen}::esx_service:activateService', 'taxi', Config.MaxInService)
end

TriggerEvent('::{ayzwen}::esx_phone:registerNumber', 'taxi', _U('taxi_client'), true, true)
TriggerEvent('::{ayzwen}::esx_society:registerSociety', 'taxi', 'Taxi', 'society_taxi', 'society_taxi', 'society_taxi', {type = 'public'})

RegisterServerEvent('::{ayzwen}::esx_taxijob:success')
AddEventHandler('::{ayzwen}::esx_taxijob:success', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'taxi' then
		math.randomseed(GetGameTimer())
		local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);
		local societyAccount = nil

		if xPlayer.job.grade >= 3 then
			total = total * 2
		end

		TriggerEvent('::{ayzwen}::esx_addonaccount:getSharedAccount', 'society_taxi', function(account)
			societyAccount = account
		end)

		if societyAccount ~= nil then
			local playerMoney = math.floor(total / 100 * 750)
			local societyMoney = math.floor(total / 100 * 1500)

			xPlayer.addAccountMoney('cash', playerMoney)
			societyAccount.addMoney(societyMoney)

			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_earned') .. playerMoney)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('comp_earned') .. societyMoney)
		else
			xPlayer.addAccountMoney('cash', total)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_earned') .. total)
		end
	end
end)

RegisterServerEvent('::{ayzwen}::esx_taxijob:getStockItem')
AddEventHandler('::{ayzwen}::esx_taxijob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. inventoryItem.label)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
			end
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_taxijob:getStockItems', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('::{ayzwen}::esx_taxijob:putStockItems')
AddEventHandler('::{ayzwen}::esx_taxijob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_taxi', function(inventory)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. ESX.GetItem(itemName).label)
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_taxijob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)