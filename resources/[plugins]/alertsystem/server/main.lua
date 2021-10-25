TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::alert:sv')
AddEventHandler('::{ayzwen}::alert:sv', function (msg, msg2)
	TriggerClientEvent('::{ayzwen}::SendAlert', -1, msg, msg2)
end)

ESX.AddGroupCommand('alert', 'superadmin', function(source, args, user)
	TriggerClientEvent('::{ayzwen}::alert:Send', source, args[1])
end)