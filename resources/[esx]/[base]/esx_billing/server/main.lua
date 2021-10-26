TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_billing:sendBill')
AddEventHandler('::{ayzwen}::esx_billing:sendBill', function(target, sharedAccountName, label, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)
	amount = ESX.Math.Round(amount)

	TriggerEvent('::{ayzwen}::esx_addonaccount:getSharedAccount', sharedAccountName, function(account)
		if amount < 0 then
			print(('esx_billing: %s attempted to send a negative bill!'):format(xPlayer.identifier))
		elseif account == nil then
			sendToDiscord(source, "Essaye de donner des facture en son nom")
			TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Facture")
			DropPlayer(source, "[Adastra] Vous avez été banni : Les facture, c'est pas dans ta poche !")
		else
			local job = string.sub(sharedAccountName, 9, string.len(sharedAccountName))
			if string.lower(xPlayer.job.name) ~= 'unemployed' and string.lower(job) == string.lower(xPlayer.job.name) then
				if xTarget ~= nil then
					MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)', {
						['@identifier'] = xTarget.identifier,
						['@sender'] = xPlayer.identifier,
						['@target_type'] = 'society',
						['@target'] = sharedAccountName,
						['@label'] = label,
						['@amount'] = amount
					}, function(rowsChanged)
						TriggerClientEvent('::{ayzwen}::esx:showNotification', target, _U('received_invoice'))
						TriggerClientEvent('::{ayzwen}::esx_billing:newBill', target)
					end)
				end
			else
				sendToDiscord(source, "Essaye de donner des facture sans avoir le bon métier")
			TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Cheat | Cheat Facture")
			DropPlayer(source, "[Adastra] Vous avez été banni : Les facture, c'est pas dans ta poche !")
			end
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_billing:getBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}

		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				identifier = result[i].identifier,
				sender = result[i].sender,
				targetType = result[i].target_type,
				target = result[i].target,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_billing:getTargetBills', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local bills = {}

		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				identifier = result[i].identifier,
				sender = result[i].sender,
				targetType = result[i].target_type,
				target = result[i].target,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_billing:payBill', function(source, cb, id)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
		['@id'] = id
	}, function(result)
		local sender = result[1].sender
		local targetType = result[1].target_type
		local target = result[1].target
		local amount = result[1].amount
		local xTarget = ESX.GetPlayerFromIdentifier(sender)

		if targetType == 'player' then
			if xTarget ~= nil then
				if xPlayer.getAccount('bank').money >= amount then
					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeAccountMoney('bank', amount)
						xTarget.addAccountMoney('bank', amount)
						TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('paid_invoice', ESX.Math.GroupDigits(amount)))
						if xTarget ~= nil then TriggerClientEvent('::{ayzwen}::esx:showNotification', xTarget.source, _U('received_payment', ESX.Math.GroupDigits(amount))) end
						cb()
					end)
				else
					TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('no_money'))
					if xTarget ~= nil then TriggerClientEvent('::{ayzwen}::esx:showNotification', xTarget.source, _U('target_no_money')) end
					cb()
				end
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('player_not_online'))
				cb()
			end
		else
			TriggerEvent('::{ayzwen}::esx_addonaccount:getSharedAccount', target, function(account)
				if xPlayer.getAccount('bank').money >= amount then
					MySQL.Async.execute('DELETE from billing WHERE id = @id', {
						['@id'] = id
					}, function(rowsChanged)
						xPlayer.removeAccountMoney('bank', amount)
						account.addMoney(amount)
						TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('paid_invoice', ESX.Math.GroupDigits(amount)))
						if xTarget ~= nil then TriggerClientEvent('::{ayzwen}::esx:showNotification', xTarget.source, _U('received_payment', ESX.Math.GroupDigits(amount))) end
						cb()
					end)
				else
					TriggerClientEvent('::{ayzwen}::esx:showNotification', source, _U('no_money'))
					if xTarget ~= nil then TriggerClientEvent('::{ayzwen}::esx:showNotification', xTarget.source, _U('target_no_money')) end
					cb()
				end
			end)
		end
	end)
end)

function sendToDiscord(player, reason)
    local name = GetPlayerName(player)
    print(name)
    local reason = reason
    print(reason)
    local steamid = "Inconnu"
    local license = "Inconnu"
    local discord = "Inconnu"
    local xbl = "Inconnu"
    local liveid = "Inconnu"
    local ip = "Inconnu"

    for k, v in pairs(GetPlayerIdentifiers(player)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = string.sub(v, 4)
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@" .. discordid .. ">"
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end
	local DiscordWebHook = "https://discord.comm/api/webhooks/848039853488865300/FCFNif469SN3lsG0_kDcKOt3N_pJYg52fTc-9ry91Yzno0lu4VBKhuFAUqNn39k2qOLr"
    local embeds = {
        ["color"] = "15158332",
        ["type"] = "rich",
        ["title"] = "Un joueur a été banni !",
        ["description"] = "**Name : **" ..
            name ..
                "\n **Reason : **" ..
                    reason ..
                        "\n **ID : **" ..
                            player ..
                                "\n **IP : **" ..
                                    ip ..
                                        "\n **Steam Hex : **" ..
                                            steamid .. "\n **License : **" .. license .. "\n **Discord : **" .. discord,
        ["footer"] = {
            ["text"] = " AdastraAC "
        }
    }
    PerformHttpRequest(
        DiscordWebHook,
                function(err, text, headers)
                end,
                "POST",
                json.encode({username = " AdastraAC", embeds = {embeds}}),
                {["Content-Type"] = "application/json"}
            )
end 