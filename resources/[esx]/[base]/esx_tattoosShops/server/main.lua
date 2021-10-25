TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("::{ayzwen}::tattoos:GetPlayerTattoos_s")
AddEventHandler("::{ayzwen}::tattoos:GetPlayerTattoos_s", function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll("SELECT * FROM playersTattoos WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
		if (result[1] ~= nil) then
			local tattoosList = json.decode(result[1].tattoos)
			TriggerClientEvent("::{ayzwen}::tattoos:getPlayerTattoos", xPlayer.source, tattoosList)
		else
			local tattooValue = json.encode({})
			MySQL.Async.execute("INSERT INTO playersTattoos (identifier, tattoos) VALUES (@identifier, @tattoo)", {['@identifier'] = xPlayer.identifier, ['@tattoo'] = tattooValue})
			TriggerClientEvent("::{ayzwen}::tattoos:getPlayerTattoos", xPlayer.source, {})
		end
	end)
end)

RegisterServerEvent("::{ayzwen}::tattoos:save")
AddEventHandler("::{ayzwen}::tattoos:save", function(tattoosList, price, value)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)

		table.insert(tattoosList, value)

		MySQL.Async.execute("UPDATE playersTattoos SET tattoos = @tattoos WHERE identifier = @identifier", {['@tattoos'] = json.encode(tattoosList), ['@identifier'] = xPlayer.identifier})
		
		TriggerClientEvent("::{ayzwen}::tattoo:buySuccess", xPlayer.source, value)
		TriggerClientEvent("::{ayzwen}::esx:showNotification", xPlayer.source, "~g~&Vous venez d'acheter ce tatouage.")
	else
		TriggerClientEvent("::{ayzwen}::esx:showNotification", xPlayer.source, "~r~Tu n'as pas assez d'argent.")
	end
end)