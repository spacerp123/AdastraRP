TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('::{ayzwen}::esx_service:activateService', 'journalist', Config.MaxInService)
end

TriggerEvent('::{ayzwen}::esx_society:registerSociety', 'journalist', 'Journaliste', 'society_journalist', 'society_journalist', 'society_journalist', {type = 'private'})

RegisterServerEvent('::{ayzwen}::esx_journalist:getStockItem')
AddEventHandler('::{ayzwen}::esx_journalist:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_journalist', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. inventoryItem.label)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
			end
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_journalist:getStockItems', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_journalist', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('::{ayzwen}::esx_journalist:putStockItems')
AddEventHandler('::{ayzwen}::esx_journalist:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_journalist', function(inventory)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. ESX.GetItem(itemName).label)
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_journalist:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_journalist:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types_journalist WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_journalist:getVaultWeapons', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_journalist', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_journalist:addVaultWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeWeapon(weaponName)

	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_journalist', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_journalist:removeVaultWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 1000)

	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_journalist', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

RegisterServerEvent('::{ayzwen}::esx_journalist:annonce')
AddEventHandler('::{ayzwen}::esx_journalist:annonce', function(result)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent("ratelimit", source, "::{ayzwen}::esx_journalist:annonce")

	if xPlayer.job.name == 'journalist' then
		TriggerClientEvent('::{ayzwen}::esx_journalist:annonce', -1, true, result)
		Citizen.Wait(8000)
		TriggerClientEvent('::{ayzwen}::esx_journalist:annonce', -1, false)
	end
end)