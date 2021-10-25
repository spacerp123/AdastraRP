TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_armour:armorremove')
AddEventHandler('::{ayzwen}::esx_armour:armorremove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('armor', 1)
end)

RegisterServerEvent('::{ayzwen}::esx_armour:handcuffremove')
AddEventHandler('::{ayzwen}::esx_armour:handcuffremove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('handcuff', 1)
end)

ESX.RegisterUsableItem('armor', function(source)
	TriggerClientEvent('::{ayzwen}::esx_armour:armor', source)
end)

ESX.RegisterUsableItem('handcuff', function(source)
	TriggerClientEvent('::{ayzwen}::esx_armour:handcuff', source)
end)

ESX.RegisterUsableItem('cutting_pliers', function(source)
	TriggerClientEvent('::{ayzwen}::esx_armour:cutting_pliers', source)
end)