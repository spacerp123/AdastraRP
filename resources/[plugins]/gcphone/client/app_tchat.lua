RegisterNetEvent("::{ayzwen}::gcPhone:tchat_receive")
AddEventHandler("::{ayzwen}::gcPhone:tchat_receive", function(message)
	SendNUIMessage({event = 'tchat_receive', message = message})
end)

RegisterNetEvent("::{ayzwen}::gcPhone:tchat_channel")
AddEventHandler("::{ayzwen}::gcPhone:tchat_channel", function(channel, messages)
	SendNUIMessage({event = 'tchat_channel', messages = messages})
end)

RegisterNUICallback('tchat_addMessage', function(data, cb)
	_TriggerServerEvent('::{ayzwen}::gcPhone:tchat_addMessage', data.channel, data.message)
end)

RegisterNUICallback('tchat_getChannel', function(data, cb)
	_TriggerServerEvent('::{ayzwen}::gcPhone:tchat_channel', data.channel)
end)