TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_truck_inventory:putItem')
AddEventHandler('::{ayzwen}::esx_truck_inventory:putItem', function(itemName, type, count, plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	if plate ~= nil then
		if type == 'item_standard' then
			local playerItem = xPlayer.getInventoryItem(itemName)

			if playerItem.count >= count and count > 0 then
				TriggerEvent('::{ayzwen}::esx_addoninventory:getInventory', 'trunk', plate, function(inventory)
					xPlayer.removeInventoryItem(itemName, count)
					inventory.addItem(itemName, count)
					--TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_deposited', count, inventory.getItem(itemName).label))
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez déposé ~y~x' .. count .. '~s~ ~b~' .. ESX.GetItem(itemName).label .. '~s~')
				end)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, '~r~Action Impossible~s~ : Montant invalide !')
			end
		elseif type == 'item_account' then
			local xAccount = xPlayer.getAccount(itemName)

			if xAccount.money >= count and count > 0 then
				TriggerEvent('::{ayzwen}::esx_addonaccount:getAccount', 'trunk_' .. itemName, plate, function(account)
					xPlayer.removeAccountMoney(itemName, count)
					account.addMoney(count)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez déposé ~g~' .. count .. '$~s~ ~b~' .. ESX.GetAccountLabel(itemName) .. '~s~')
				end)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, '~r~Action Impossible~s~ : Montant invalide !')
			end
		elseif type == 'item_weapon' then
			local weaponName = string.upper(itemName)

			if xPlayer.hasWeapon(weaponName) then
				TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'trunk', plate, function(store)
					local weapons = store.get('weapons') or {}

					table.insert(weapons, {
						name = weaponName,
						ammo = count
					})

					store.set('weapons', weapons)
					xPlayer.removeWeapon(weaponName)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez déposé ~y~x' .. count .. '~s~ ~b~' .. ESX.GetWeaponLabel(itemName) .. '~s~')
				end)
			else
				xPlayer.showNotification('~r~Action Impossible~s~ : Vous ne possédez pas cette arme !')
			end
		end
	end
end)

RegisterServerEvent('::{ayzwen}::esx_truck_inventory:getItem')
AddEventHandler('::{ayzwen}::esx_truck_inventory:getItem', function(itemName, type, count, plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	if plate ~= nil then
		if type == 'item_standard' then
			TriggerEvent('::{ayzwen}::esx_addoninventory:getInventory', 'trunk', plate, function(inventory)
				local inventoryItem = inventory.getItem(itemName)

				if inventoryItem.count >= count and count > 0 then
					if xPlayer.canCarryItem(itemName, count) then
						inventory.removeItem(itemName, count)
						xPlayer.addInventoryItem(itemName, count)
						--TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_withdrawn', count, inventoryItem.label))
						TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez pris ~y~x' .. count .. '~s~ ~b~' .. inventoryItem.label .. '~s~')
					else
						TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, '~r~Action Impossible~s~ : Vous n\'avez pas assez ~y~de place~s~ dans votre inventaire !')
					end
				else
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, '~r~Action Impossible~s~ : Il n\'y a pas assez de ~r~cet objet~s~ dans votre coffre!')
				end
			end)
		elseif type == 'item_account' then
			TriggerEvent('::{ayzwen}::esx_addonaccount:getAccount', 'trunk_' .. itemName, plate, function(account)
				if account.money >= count and count > 0 then
					account.removeMoney(count)
					xPlayer.addAccountMoney(itemName, count)
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez pris ~g~' .. count .. '$~s~ ~b~' .. ESX.GetAccountLabel(itemName) .. '~s~')
				else
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, '~r~Action Impossible~s~ : Montant invalide !')
				end
			end)
		elseif type == 'item_weapon' then
			TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'trunk', plate, function(store)
				local weaponName = string.upper(itemName)

				if not xPlayer.hasWeapon(weaponName) then
					local weapons = store.get('weapons') or {}

					for i = 1, #weapons, 1 do
						if weapons[i].name == weaponName and weapons[i].ammo == count then
							table.remove(weapons, i)

							store.set('weapons', weapons)
							xPlayer.addWeapon(weaponName, count)
							TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez pris ~y~x' .. count .. '~s~ ~b~' .. ESX.GetWeaponLabel(itemName) .. '~s~')
							break
						end
					end
				else
					xPlayer.showNotification('~r~Action Impossible~s~ : Vous possédez déjà cette arme !')
				end
			end)
		end
	end
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_truck_inventory:getTrunkInventory', function(source, cb, plate)
	local dirtycash, items, weapons = 0, {}, {}

	TriggerEvent('::{ayzwen}::esx_addonaccount:getAccount', 'trunk_dirtycash', plate, function(account)
		if account == nil then return end
		dirtycash = account.money
	end)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getInventory', 'trunk', plate, function(inventory)
		if inventory == nil then return end
		items = inventory.items
	end)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'trunk', plate, function(store)
		if store == nil then return end
		weapons = store.get('weapons') or {}
	end)

	cb({
		dirtycash = dirtycash,
		items = items,
		weapons = weapons
	})
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_truck_inventory:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb({
		dirtycash = xPlayer.getAccount('dirtycash').money,
		items = xPlayer.inventory,
		weapons = xPlayer.getLoadout()
	})
end)