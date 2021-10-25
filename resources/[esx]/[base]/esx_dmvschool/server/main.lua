TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('::{ayzwen}::esx:playerLoaded', function(source)
	TriggerEvent('::{ayzwen}::esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('::{ayzwen}::esx_dmvschool:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('::{ayzwen}::esx_dmvschool:addLicense')
AddEventHandler('::{ayzwen}::esx_dmvschool:addLicense', function(type)
	local _source = source

	TriggerEvent('::{ayzwen}::esx_license:addLicense', _source, type, function()
		TriggerEvent('::{ayzwen}::esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('::{ayzwen}::esx_dmvschool:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('::{ayzwen}::esx_dmvschool:pay')
AddEventHandler('::{ayzwen}::esx_dmvschool:pay', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('cash', price)
	TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('you_paid', price))
end)