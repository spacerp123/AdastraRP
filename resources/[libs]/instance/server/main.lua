local instances = {}

function GetInstancedPlayers()
	local players = {}

	for k, v in pairs(instances) do
		for k2, v2 in ipairs(v.players) do
			players[v2] = true
		end
	end

	return players
end

AddEventHandler('playerDropped', function(reason)
	if instances[source] then
		CloseInstance(source)
	end
end)

function CreateInstance(type, player, data)
	TriggerEvent("ratelimit", source, "CreateInstance")
	instances[player] = {
		type = type,
		host = player,
		players = {},
		data = data
	}

	TriggerEvent(':{ayzwen}::instance:onCreate', instances[player])
	TriggerClientEvent(':{ayzwen}::instance:onCreate', player, instances[player])
	TriggerClientEvent(':{ayzwen}::instance:onInstancedPlayersData', -1, GetInstancedPlayers())
end

function CloseInstance(instance)
	if instances[instance] then
		for i = 1, #instances[instance].players do
			TriggerClientEvent(':{ayzwen}::instance:onClose', instances[instance].players[i])
		end

		instances[instance] = nil

		TriggerClientEvent(':{ayzwen}::instance:onInstancedPlayersData', -1, GetInstancedPlayers())
		TriggerEvent(':{ayzwen}::instance:onClose', instance)
	end
end

function AddPlayerToInstance(instance, player)
	TriggerEvent("ratelimit", source, "AddPlayerToInstance")
	local found = false

	for i = 1, #instances[instance].players do
		if instances[instance].players[i] == player then
			found = true
			break
		end
	end

	if not found then
		table.insert(instances[instance].players, player)
	end

	TriggerClientEvent(':{ayzwen}::instance:onEnter', player, instances[instance])

	for i = 1, #instances[instance].players do
		if instances[instance].players[i] ~= player then
			TriggerClientEvent(':{ayzwen}::instance:onPlayerEntered', instances[instance].players[i], instances[instance], player)
		end
	end

	TriggerClientEvent(':{ayzwen}::instance:onInstancedPlayersData', -1, GetInstancedPlayers())
end

function RemovePlayerFromInstance(instance, player)
	TriggerEvent("ratelimit", source, "RemovePlayerFromInstance")

	if instances[instance] then
		TriggerClientEvent(':{ayzwen}::instance:onLeave', player, instances[instance])

		if instances[instance].host == player then
			for i = 1, #instances[instance].players do
				if instances[instance].players[i] ~= player then
					TriggerClientEvent(':{ayzwen}::instance:onPlayerLeft', instances[instance].players[i], instances[instance], player)
				end
			end

			CloseInstance(instance)
		else
			for i = 1, #instances[instance].players do
				if instances[instance].players[i] == player then
					instances[instance].players[i] = nil
				end
			end

			for i = 1, #instances[instance].players do
				if instances[instance].players[i] ~= player then
					TriggerClientEvent(':{ayzwen}::instance:onPlayerLeft', instances[instance].players[i], instances[instance], player)
				end
			end

			TriggerClientEvent(':{ayzwen}::instance:onInstancedPlayersData', -1, GetInstancedPlayers())
		end
	end
end

function InvitePlayerToInstance(instance, type, player, data)
	TriggerClientEvent(':{ayzwen}::instance:onInvite', player, instance, type, data)
end

RegisterServerEvent(':{ayzwen}::instance:create')
AddEventHandler(':{ayzwen}::instance:create', function(type, data)
	CreateInstance(type, source, data)
end)

RegisterServerEvent(':{ayzwen}::instance:close')
AddEventHandler(':{ayzwen}::instance:close', function()
	CloseInstance(source)
end)

RegisterServerEvent(':{ayzwen}::instance:enter')
AddEventHandler(':{ayzwen}::instance:enter', function(instance)
	AddPlayerToInstance(instance, source)
end)

RegisterServerEvent(':{ayzwen}::instance:leave')
AddEventHandler(':{ayzwen}::instance:leave', function(instance)
	RemovePlayerFromInstance(instance, source)
end)

RegisterServerEvent(':{ayzwen}::instance:invite')
AddEventHandler(':{ayzwen}::instance:invite', function(instance, type, player, data)
	InvitePlayerToInstance(instance, type, player, data)
end)