TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('::{ayzwen}::esx:playerLoaded', function(eventSrc, xPlayer)
	MySQL.Async.fetchAll('SELECT status FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {}

		if result[1].status ~= nil then
			data = json.decode(result[1].status)
		end

		xPlayer.set('status', data)
		TriggerClientEvent('::{ayzwen}::esx_status:load', eventSrc, data)
	end)
end)

AddEventHandler('::{ayzwen}::esx:playerDropped', function(eventSrc, xPlayer)
	local status = xPlayer.get('status')

	MySQL.Async.execute('UPDATE users SET status = @status WHERE identifier = @identifier', {
		['@status'] = json.encode(status),
		['@identifier'] = xPlayer.identifier
	})
end)

RegisterServerEvent('::{ayzwen}::esx_status:update')
AddEventHandler('::{ayzwen}::esx_status:update', function(status)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.set('status', status)
	end
end)

function SaveData()
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer then
			local status = xPlayer.get('status')

			MySQL.Async.execute('UPDATE users SET status = @status WHERE identifier = @identifier', {
				['@status'] = json.encode(status),
				['@identifier'] = xPlayer.identifier
			})
		end
	end

	SetTimeout(10 * 60 * 1000, SaveData)
end

SaveData()