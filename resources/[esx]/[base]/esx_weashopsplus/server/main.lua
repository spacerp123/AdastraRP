TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses(source)
	TriggerEvent('::{ayzwen}::esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('::{ayzwen}::esx_weashop:loadLicenses', source, licenses)
	end)
end

AddEventHandler('::{ayzwen}::esx:playerLoaded', function(source)
	LoadLicenses(source)
end)

RegisterServerEvent('::{ayzwen}::esx_weashop:buyLicense')
AddEventHandler('::{ayzwen}::esx_weashop:buyLicense', function(licenseType, categorySelected)
	if not Config.Categories[categorySelected].license then return end
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local price = Config.Licenses[licenseType].price

	if xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)

		TriggerEvent('::{ayzwen}::esx_license:addLicense', _source, licenseType, function()
			LoadLicenses(_source)
		end)
	else
		TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('not_enough'))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_weashop:buyItem')
AddEventHandler('::{ayzwen}::esx_weashop:buyItem', function(itemName, categorySelected)
	if Config.Categories[categorySelected] == nil then return end
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weapons = Config.Categories[categorySelected].weapons
	local weaponInfo, weaponFound = {}, false

	for i = 1, #weapons, 1 do
		if weapons[i].name == itemName then
			weaponInfo, weaponFound = weapons[i], true
		end
	end

	if xPlayer.getAccount('cash').money >= weaponInfo.price then
		xPlayer.removeAccountMoney('cash', weaponInfo.price)
		xPlayer.addWeapon(itemName, 42)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))
	else
		TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('not_enough'))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_weashop:removeClip')
AddEventHandler('::{ayzwen}::esx_weashop:removeClip', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('::{ayzwen}::esx_weashop:useClip', source)
end)