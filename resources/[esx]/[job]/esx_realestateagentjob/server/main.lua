TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('::{ayzwen}::esx_phone:registerNumber', 'realestateagent', _U('client'), false, false)
TriggerEvent('::{ayzwen}::esx_society:registerSociety', 'realestateagent', _U('realtors'), 'society_realestateagent', 'society_realestateagent', 'society_realestateagent', {type = 'private'})

RegisterServerEvent('::{ayzwen}::esx_realestateagentjob:revoke')
AddEventHandler('::{ayzwen}::esx_realestateagentjob:revoke', function(property, owner)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'realestateagent' then
		TriggerEvent('::{ayzwen}::esx_property:removeOwnedPropertyIdentifier', property, owner)
	else
		print(('esx_realestateagentjob: %s attempted to revoke a property!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_realestateagentjob:sell')
AddEventHandler('::{ayzwen}::esx_realestateagentjob:sell', function(target, property, price)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)

	if xPlayer.job.name ~= 'realestateagent' then
		print(('esx_realestateagentjob: %s attempted to sell a property!'):format(xPlayer.identifier))
		return
	end

	if xTarget.getAccount('cash').money >= price then
		xTarget.removeAccountMoney('cash', price)

		TriggerEvent('::{ayzwen}::esx_addonaccount:getSharedAccount', 'society_realestateagent', function(account)
			account.addMoney(price)
		end)
	
		TriggerEvent('::{ayzwen}::esx_property:setPropertyOwned', property, price, false, xTarget.identifier)
	else
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('client_poor'))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_realestateagentjob:rent')
AddEventHandler('::{ayzwen}::esx_realestateagentjob:rent', function(target, property, price)
	local xPlayer = ESX.GetPlayerFromId(target)

	TriggerEvent('::{ayzwen}::esx_property:setPropertyOwned', property, price, true, xPlayer.identifier)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_realestateagentjob:getCustomers', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_ownedproperty:getOwnedProperties', function(properties)
		local xPlayers = ESX.GetPlayers()
		local customers = {}

		for i = 1, #properties, 1 do
			for j = 1, #xPlayers, 1 do
				local result, xPlayer = xpcall(ESX.GetPlayerFromId, function(err)
					print("ERROR:", err)
				end, xPlayers[j])

				if xPlayer and xPlayer.identifier == properties[i].owner then
					table.insert(customers, {
						name = xPlayer.name,
						propertyOwner = properties[i].owner,
						propertyRented = properties[i].rented,
						propertyId = properties[i].id,
						propertyPrice = properties[i].price,
						propertyName = properties[i].name,
						propertyLabel = properties[i].label
					})
				end
			end
		end

		cb(customers)
	end)
end)
