TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_kekke_tackle:tryTackle')
AddEventHandler('::{ayzwen}::esx_kekke_tackle:tryTackle', function(target)
	local _source = source
	TriggerClientEvent('::{ayzwen}::esx_kekke_tackle:getTackled', target, _source)
	TriggerClientEvent('::{ayzwen}::esx_kekke_tackle:playTackle', _source)
end)