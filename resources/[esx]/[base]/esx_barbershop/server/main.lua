TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_barbershop:pay')
AddEventHandler('::{ayzwen}::esx_barbershop:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeAccountMoney('cash', Config.Price)
	TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('you_paid') .. '$' .. Config.Price)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getAccount('cash').money >= Config.Price then
		cb(true)
	else
		cb(false)
	end
end)