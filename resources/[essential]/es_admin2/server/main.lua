TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

local groupsRequired = {
	['kick'] = "admin"
}

RegisterServerEvent('::{ayzwen}::es_admin:set')
AddEventHandler('::{ayzwen}::es_admin:set', function(target, command, param)
	local xPlayer, xPlayerTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)

	if command == "group" then
		if xPlayerTarget == nil then
			TriggerClientEvent('chatMessage', xPlayer.source, 'SYSTEM', {255, 0, 0}, "Joueur non trouvé")
		else
			ESX.GroupCanTarget(xPlayer.getGroup(), param, function(canTarget)
				if canTarget then
					TriggerEvent('::{ayzwen}::esx:customDiscordLog', xPlayer.name .. " [" .. xPlayer.source .. "] (" .. xPlayer.identifier .. ") a modifié le groupe de permission de " .. xPlayerTarget.name .. " [" .. xPlayerTarget.source .. "] (" .. xPlayerTarget.identifier .. ") - Ancien : " .. xPlayer.getGroup() .. " / Nouveau : " .. param)
					xPlayerTarget.setGroup(param)
					TriggerClientEvent('chatMessage', xPlayer.source, "SYSTEME", {0, 0, 0}, "Groupe de ^2^*" .. xPlayerTarget.getName() .. "^r^0 a été réglé sur ^2^*" .. param)
				else
					TriggerClientEvent('chatMessage', xPlayer.source, 'SYSTEME', {255, 0, 0}, "Groupe non valide ou groupe insuffisant.")
				end
			end)
		end
	elseif command == "level" then
		if xPlayerTarget == nil then
			TriggerClientEvent('chatMessage', xPlayer.source, 'SYSTEM', {255, 0, 0}, "Joueur non trouvé")
		else
			param = tonumber(param)
			if param ~= nil and param >= 0 then
				if xPlayer.getLevel() >= param then
					TriggerEvent('::{ayzwen}::esx:customDiscordLog', xPlayer.name .. " [" .. xPlayer.source .. "] (" .. xPlayer.identifier .. ") a modifié le niveau de permission de " .. xPlayerTarget.name .. " [" .. xPlayerTarget.source .. "] (" .. xPlayerTarget.identifier .. ") - Ancien : " .. xPlayer.getLevel() .. " / Nouveau : " .. param)
					xPlayerTarget.setLevel(param)
					TriggerClientEvent('chatMessage', xPlayer.source, "SYSTEME", {0, 0, 0}, "Niveau d'autorisation de ^2" .. xPlayerTarget.getName() .. "^0 has been set to ^2 " .. tostring(param))
				else
					TriggerClientEvent('chatMessage', xPlayer.source, 'SYSTEME', {255, 0, 0}, "Niveau insuffisant.")
				end
			else
				TriggerClientEvent('chatMessage', xPlayer.source, 'SYSTEME', {255, 0, 0}, "Niveau invalide.")
			end
		end
	end
end)

-- Rcon commands
AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'setlevel' then
		if (tonumber(args[1]) ~= nil and tonumber(args[1]) >= 0) and (tonumber(args[2]) ~= nil and tonumber(args[2]) >= 0) then
			local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))

			if xPlayer == nil then
				RconPrint("Player not ingame\n")
				CancelEvent()
				return
			end

			TriggerEvent('::{ayzwen}::esx:customDiscordLog', "CONSOLE a modifié le niveau de permission de " .. xPlayer.name .. " [" .. xPlayer.source .. "] (" .. xPlayer.identifier .. ") - Ancien : " .. xPlayer.getLevel() .. " / Nouveau : " .. tostring(args[2]))
			xPlayer.setLevel(tonumber(args[2]))
		else
			RconPrint("Usage: setlevel [user-id] [level]\n")
			CancelEvent()
			return
		end

		CancelEvent()
	elseif commandName == 'setgroup' then
		if (tonumber(args[1]) ~= nil and tonumber(args[1]) >= 0) and (tostring(args[2]) ~= nil) then
			local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))

			if xPlayer == nil then
				RconPrint("Player not ingame\n")
				CancelEvent()
				return
			end

			TriggerEvent('::{ayzwen}::esx:customDiscordLog', "CONSOLE a modifié le groupe de permission de " .. xPlayer.name .. " [" .. xPlayer.source .. "] (" .. xPlayer.identifier .. ") - Ancien : " .. xPlayer.getGroup() .. " / Nouveau : " .. tostring(args[2]))
			xPlayer.setGroup(tostring(args[2]))
		else
			RconPrint("Usage: setgroup [user-id] [group]\n")
			CancelEvent()
			return
		end

		CancelEvent()
	end
end)

-- Report
ESX.AddCommand('report', function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SUPPORT", {0, 0, 255}, " (^2" .. GetPlayerName(source) .. " | " .. source .. "^0) " .. table.concat(args, " "))
	PerformHttpRequest('https://discord.comm/api/webhooks/820712618280353792/uRjDG6uxaU3_FjH6f63dUniA8upgbfUjKKLf3LM6Kb6iIHxF5D01YjH_jMdiMJwZNtBD', function(err, text, headers) end, 'POST', json.encode({username = "LesReportDePD", content = "```ID : " .. source .. "\nName : " .. GetPlayerName(source) .. "\nMessage : " .. table.concat(args, " ") .. "```"}), { ['Content-Type'] = 'application/json' })
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer and xPlayer.getLevel() > 0 and xPlayer.source ~= source then
			TriggerClientEvent('chatMessage', xPlayer.source, "SUPPORT", {0, 0, 255}, " (^2" .. GetPlayerName(source) .. " | " .. source .. "^0) " .. table.concat(args, " "))
		end
	end
end, {help = "Signalez un joueur ou un problème", params = { {name = "report", help = "Ce que vous voulez signalez"} }})

-- Announce
ESX.AddGroupCommand('announce', "admin", function(source, args, user)
	PerformHttpRequest('https://discord.comm/api/webhooks/839579122145689661/_U5x99-J4tfKLqbHvd9dmuWmkjcHE3EUhBWl0Ol3hvvcx83Rp1lrpLUB7RfUIItgCWks', function(err, text, headers) end, 'POST', json.encode({username = "Annonce - Adastra", content = "```ID : " .. source .. "\nJoueur : " .. GetPlayerName(source) .. "\nMessage : " .. table.concat(args, " ") .. "```"}), { ['Content-Type'] = 'application/json' })
	TriggerClientEvent('chatMessage', -1, "ANNONCE", {255, 0, 0}, table.concat(args, " "))
end, {help = "Annoncer un message à l'ensemble du serveur Adastra", params = { {name = "announcement", help = "Le message à annoncer"} }})

-- Kick
ESX.AddGroupCommand('kick', "admin", function(source, args, user)
	if args[1] then
		if GetPlayerName(tonumber(args[1])) then
			local target = tonumber(args[1])
			local reason = args
			table.remove(reason, 1)

			if #reason == 0 then
				reason = "Kick: Vous avez été exclu du serveur."
			else
				reason = "Kick: " .. table.concat(reason, " ")
			end

			TriggerClientEvent('chatMessage', source, "SYSTEME", {255, 0, 0}, "Joueur ^2" .. GetPlayerName(target) .. "^0 a été expulsé (^2" .. reason .. "^0)")
			DropPlayer(target, reason)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEME", {255, 0, 0}, "ID de joueur incorrect!")
		end
	else
		TriggerClientEvent('chatMessage', source, "SYSTEME", {255, 0, 0}, "ID de joueur incorrect!")
	end
end, {help = "Kick un utilisateur avec la raison spécifiée ou sans raison", params = { {name = "userid", help = "L'ID du joueur"}, {name = "reason", help = "The reason as to why you kick this player"} }})

-- Goto
ESX.AddGroupCommand('goto', "admin", function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(args[1])
	TriggerClientEvent("alah:Goto", source, xPlayer.getCoords(false))
end, {help = "Aller sur une personne", params = { {name = "userid", help = "The ID of the player"}, {name = "reason", help = "ftg jvou baise les staff"} }})

ESX.AddGroupCommand('bring', "admin", function(source, args, user)
	-- /bring ID (sa tp l'id sur le staff)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("alah:Bring", args[1], xPlayer.getCoords(false))
end, {help = "Apporter une personne a sois", params = { {name = "userid", help = "The ID of the player"}, {name = "reason", help = "ftg jvou baise les staff"} }})

-- Delgun
ESX.AddGroupCommand('delgun', "admin", function(source, args, user)
	TriggerClientEvent("::{ayzwen}::ayzwen:delgunToggle", source)
end, {help = "Activer la suppression du pistolet"})

ESX.AddGroupCommand('message', "admin", function(source, args, user)
	local target = args[1]
	table.remove(args, 1)
	TriggerClientEvent("alah:Message", target, table.concat(args, " "))
end, {help = "Activer la suppression du pistolet"})

-- Admin Tag
ESX.AddGroupCommand('adminTag', "_dev", function(source, args, user)
	TriggerClientEvent('::{ayzwen}::adminTag:trigger', -1, source, ('%s | %s'):format(GetPlayerName(source), table.concat(args, " ")))
end, {help = "Activer une balise d'administration au-dessus de Head"})