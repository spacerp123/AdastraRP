TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_clotheshop:pay')
AddEventHandler('::{ayzwen}::esx_clotheshop:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('cash', Config.Price)
	TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('you_paid') .. Config.Price)
end)

RegisterServerEvent('::{ayzwen}::esx_clotheshop:saveOutfit')
AddEventHandler('::{ayzwen}::esx_clotheshop:saveOutfit', function(label, skin)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin = skin
		})

		store.set('dressing', dressing)
	end)
end)

RegisterServerEvent('::{ayzwen}::esx_clotheshop:deleteOutfit')
AddEventHandler('::{ayzwen}::esx_clotheshop:deleteOutfit', function(label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		label = label
		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_clotheshop:checkMoney', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getAccount('cash').money >= Config.Price then
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_clotheshop:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_clotheshop:getPlayerDressing', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count = store.count('dressing')
		local labels = {}

		for i = 1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_clotheshop:getPlayerOutfit', function(source, cb, num)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)