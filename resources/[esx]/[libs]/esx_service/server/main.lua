local InService = {}
local MaxInService = {}

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

function GetInServiceCount(name)
	local count = 0

	for k, v in pairs(InService[name]) do
		if v == true then
			count = count + 1
		end
	end

	return count
end

AddEventHandler('::{ayzwen}::esx_service:activateService', function(name, max)
	InService[name] = {}
	MaxInService[name] = max
end)

RegisterServerEvent('::{ayzwen}::esx_service:disableService')
AddEventHandler('::{ayzwen}::esx_service:disableService', function(name)
	InService[name][source] = nil
end)

RegisterServerEvent('::{ayzwen}::esx_service:notifyAllInService')
AddEventHandler('::{ayzwen}::esx_service:notifyAllInService', function(notification, name)
	for k, v in pairs(InService[name]) do
		if v == true then
			TriggerClientEvent('::{ayzwen}::esx_service:notifyAllInService', k, notification, source)
		end
	end
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_service:enableService', function(source, cb, name)
	local inServiceCount = GetInServiceCount(name)

	if inServiceCount >= MaxInService[name] then
		cb(false, MaxInService[name], inServiceCount)
	else
		InService[name][source] = true
		cb(true, MaxInService[name], inServiceCount)
	end
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_service:isInService', function(source, cb, name)
	local isInService = false

	if InService[name][source] then
		isInService = true
	end

	cb(isInService)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_service:getInServiceList', function(source, cb, name)
	cb(InService[name])
end)

AddEventHandler('playerDropped', function()
	local _source = source

	for k, v in pairs(InService) do
		if v[_source] == true then
			v[_source] = nil
		end
	end
end)