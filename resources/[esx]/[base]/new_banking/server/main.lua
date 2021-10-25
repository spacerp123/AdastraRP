TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::bank:deposit')
AddEventHandler('::{ayzwen}::bank:deposit', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	amount = tonumber(amount)

	if amount == nil or amount <= 0 or amount > xPlayer.getAccount('cash').money then
		TriggerClientEvent('chatMessage', xPlayer.source, "Montant Invalide")
	else
		xPlayer.removeAccountMoney('cash', amount)
		xPlayer.addAccountMoney('bank', tonumber(amount))
	end
end)

RegisterServerEvent('::{ayzwen}::bank:withdraw')
AddEventHandler('::{ayzwen}::bank:withdraw', function(amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerBank = xPlayer.getAccount('bank').money
	amount = tonumber(amount)

	if amount == nil or amount <= 0 or amount > xPlayerBank then
		TriggerClientEvent('chatMessage', xPlayer.source, "Montant Invalide")
	else
		xPlayer.removeAccountMoney('bank', amount)
		xPlayer.addAccountMoney('cash', amount)
	end
end)

RegisterServerEvent('::{ayzwen}::bank:balance')
AddEventHandler('::{ayzwen}::bank:balance', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('::{ayzwen}::bank:refreshbalance', xPlayer.source, xPlayer.getAccount('bank').money)
end)

RegisterServerEvent('::{ayzwen}::bank:transfer')
AddEventHandler('::{ayzwen}::bank:transfer', function(target, amount)
	local sourcePlayer = ESX.GetPlayerFromId(source)
	local targetPlayer = ESX.GetPlayerFromId(target)
	amount = tonumber(amount)

	if targetPlayer then
		if sourcePlayer.source ~= targetPlayer.source then
			if type(amount) == 'number' and amount > 0 and sourcePlayer.getAccount('bank').money >= amount then
				local accountLabel = ESX.GetAccountLabel('bank')

				sourcePlayer.removeAccountMoney('bank', amount)
				targetPlayer.addAccountMoney('bank', amount)

				sourcePlayer.showAdvancedNotification(GetConvar("servername", "Adastra"), "~y~Fleeca Bank", ('Vous avez transféré ~g~$%s~s~ à ~y~%s~s~'):format(ESX.Math.GroupDigits(amount), targetPlayer.name), 'CHAR_BANK_FLEECA', 9)
				targetPlayer.showAdvancedNotification(GetConvar("servername", "Adastra"), "~y~Fleeca Bank", ('Vous avez reçu ~g~$%s~s~ de ~b~%s~s~'):format(ESX.Math.GroupDigits(amount), sourcePlayer.name), 'CHAR_BANK_FLEECA', 9)

				TriggerEvent("::{ayzwen}::esx:giveaccountalert", sourcePlayer.name, targetPlayer.name, 'bank', amount)
			else
				sourcePlayer.showAdvancedNotification(GetConvar("servername", "Adastra"), "~y~Fleeca Bank", '~r~Action Impossible~s~ : Montant Invalide !', 'CHAR_BANK_FLEECA', 9)
			end
		else
			sourcePlayer.showAdvancedNotification(GetConvar("servername", "Adastra"), "~y~Fleeca Bank", '~r~Action Impossible~s~ : Vous ne pouvez pas transférer à vous même !', 'CHAR_BANK_FLEECA', 9)
		end
	else
		sourcePlayer.showAdvancedNotification(GetConvar("servername", "Adastra"), "~y~Fleeca Bank", '~r~Action Impossible~s~ : Compte cible invalide !', 'CHAR_BANK_FLEECA', 9)
	end
end)