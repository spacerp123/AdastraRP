local busyObjects = {}

AddEventHandler('playerDropped', function()
	local _source = source

	for i = 1, #busyObjects, 1 do
		if busyObjects[i].player == _source then
			table.remove(busyObjects, i)
			break
		end
	end
end)

RegisterServerEvent('::{ayzwen}::ChairBedSystem:Server:Enter')
AddEventHandler('::{ayzwen}::ChairBedSystem:Server:Enter', function(obj)
	local _source = source
	local found = false

	for i = 1, #busyObjects, 1 do
		if (busyObjects[i].id == obj.netId) or (busyObjects[i].player == _source) then
			found = true
			break
		end
	end

	if not found then
		table.insert(busyObjects, {id = obj.netId, player = _source})
		TriggerClientEvent('::{ayzwen}::ChairBedSystem:Client:Animation', _source, obj)
	end
end)

RegisterServerEvent('::{ayzwen}::ChairBedSystem:Server:Leave')
AddEventHandler('::{ayzwen}::ChairBedSystem:Server:Leave', function()
	local _source = source

	for i = 1, #busyObjects, 1 do
		if busyObjects[i].player == _source then
			table.remove(busyObjects, i)
			break
		end
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(250000)
        local allPlayers = GetPlayers()

        for i=1, #allPlayers, 1 do
            local license = nil
            for _,v in pairs(GetPlayerIdentifiers(allPlayers[i])) do
                if string.find(v, "license:") then
                    license = v
                    break
                end
            end
            TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', allPlayers[i], 'Adastra', '~y~Serveur', 'Merci de rejoindre le discord : discord.gg/Adastra', 'CHAR_Adastra', 7)
            --MySQL.Async.execute("UPDATE users SET syltacoin = syltacoin + @coins WHERE identifier = @identifier", {["@coins"] = randomCoins, ["@identifier"] = license}, function() end)
        end
    end
end)