TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_accessories:pay')
AddEventHandler('::{ayzwen}::esx_accessories:pay', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeAccountMoney('cash', Config.Price)
	TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('you_paid', ESX.Math.GroupDigits(Config.Price)))
end)

RegisterServerEvent('::{ayzwen}::esx_accessories:save')
AddEventHandler('::{ayzwen}::esx_accessories:save', function(skin, accessory)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		store.set('has' .. accessory, true)

		local itemSkin = {}
		local item1 = string.lower(accessory) .. '_1'
		local item2 = string.lower(accessory) .. '_2'
		itemSkin[item1] = skin[item1]
		itemSkin[item2] = skin[item2]

		store.set('skin', itemSkin)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_accessories:get', function(source, cb, accessory)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
		local hasAccessory = (store.get('has' .. accessory) and store.get('has' .. accessory) or false)
		local skin = (store.get('skin') and store.get('skin') or {})
		cb(hasAccessory, skin)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_accessories:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getAccount('cash').money >= Config.Price then
		cb(true)
	else
		cb(false)
	end
end)