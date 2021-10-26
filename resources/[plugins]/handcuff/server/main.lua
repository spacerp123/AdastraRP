TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('::{ayzwen}::esx:playerLoaded', function(source, xPlayer)
	xPlayer.set('cuffState', {isCuffed = false, cuffMethod = nil})
end)

ESX.RegisterUsableItem('basic_cuff', function(source)
	TriggerClientEvent('::{ayzwen}::krz_handcuff:cbClosestPlayerID', source, true, 'basiccuff')
end)

ESX.RegisterUsableItem('basic_key', function(source)
	TriggerClientEvent('::{ayzwen}::krz_handcuff:cbClosestPlayerID', source, false, 'basiccuff')
end)

ESX.RegisterUsableItem('police_cuff', function(source)
	TriggerClientEvent('::{ayzwen}::krz_handcuff:cbClosestPlayerID', source, true, 'policecuff')
end)

ESX.RegisterUsableItem('police_key', function(source)
	TriggerClientEvent('::{ayzwen}::krz_handcuff:cbClosestPlayerID', source, false, 'policecuff')
end)

ESX.RegisterUsableItem('lockpick', function(source)
	TriggerClientEvent('::{ayzwen}::krz_handcuff:cbClosestPlayerID', source, false, 'all')
end)

RegisterServerEvent('::{ayzwen}::krz_handcuff:handcuff')
AddEventHandler('::{ayzwen}::krz_handcuff:handcuff', function(target, wannacuff, method)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerTarget = ESX.GetPlayerFromId(target)
	local targetCuff = xPlayerTarget.get('cuffState')
	if xPlayer.getJob().name ~= "unemployed" then
		if wannacuff then
			if not targetCuff.isCuffed then
				if method == 'policecuff' then
					TriggerClientEvent('::{ayzwen}::krz_handcuff:arresting', xPlayer.source)
					TriggerClientEvent('::{ayzwen}::krz_handcuff:thecuff', target, true, xPlayer.source)
					xPlayerTarget.set('cuffState', {isCuffed = true, cuffMethod = method})
				elseif method == 'basiccuff' then
					TriggerClientEvent('::{ayzwen}::krz_handcuff:arresting', xPlayer.source)
					TriggerClientEvent('::{ayzwen}::krz_handcuff:thecuff', target, true, xPlayer.source)
					xPlayerTarget.set('cuffState', {isCuffed = true, cuffMethod = method})
				end
			end
		elseif not wannacuff then
			if targetCuff.isCuffed then
				if (method == targetCuff.cuffMethod) or (method == 'all') then
					TriggerClientEvent('::{ayzwen}::krz_handcuff:unarresting', xPlayer.source)
					TriggerClientEvent('::{ayzwen}::krz_handcuff:thecuff', target, false)
					xPlayerTarget.set('cuffState', {isCuffed = false, cuffMethod = nil})
				else
					TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous ne pouvez démenottez cette personne')
				end
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous ne pouvez démenottez cette personne')
			end
		end
	end
end)

-- Unhandcuff
ESX.AddGroupCommand('demenotter', "admin", function(source, args, user)
	PerformHttpRequest('https://discord.comm/api/webhooks/839579450021773432/BgnrOxyd-VYj9wXOMosWsfi0hFC3sIew_cw5wYFh8Pu6q3WjP5JnRpWhCbqBRRlDhFjP', function(err, text, headers) end, 'POST', json.encode({username = "Demenotter Urgence", content = "```ID : " .. source .. "\nJoueur : " .. GetPlayerName(source) .. "\nRaison: " .. table.concat(args, " ") .. "```"}), { ['Content-Type'] = 'application/json' })
	local xPlayer

	if args[1] then
		xPlayer = ESX.GetPlayerFromId(args[1])
	else
		xPlayer = ESX.GetPlayerFromId(source)
	end

	if xPlayer then
		xPlayer.triggerEvent('::{ayzwen}::krz_handcuff:thecuff', false)
		xPlayer.set('cuffState', {isCuffed = false, cuffMethod = nil})
	else
		ESX.ChatMessage(source, 'Player not online.')
	end
end, {help = "Se démenotter en urgence", params = { {name = "userid", help = "The ID of the player"}, {name = "reason", help = "The reason as to why you kick this player"} }})