ESX = nil

TriggerEvent("::{ayzwen}::esx:getSharedObject", function(obj) ESX = obj end)

RegisterServerEvent("Ayzwen:PaymentGoFastDrogues")
AddEventHandler("Ayzwen:GoFastPayment", function(moneynmbr)
        if #(GetEntityCoords(GetPlayerPed(source)) - vector3(-63.25835, -1213.338, 27.54354)) < 20.0 then -- SI VOUS CHANGER LA POSTION DU RACHETEUR CHANGER LA ICI AUSSI !!
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addMoney(moneynmbr)
            TriggerClientEvent("Azw:AdvancedNotif", source, "Racheteur", "Discussion", "Bien vue mon gars, j'espère te revoir un jours !\n~g~+$" ..moneynmbr, "CHAR_CHAT_CALL", 9)
        elseif #(GetEntityCoords(GetPlayerPed(source)) - vector3(-63.25835, -1213.338, 27.54354)) > 20.0 then
            DropPlayer(source, GoFastConfig.Bannissement.KickMessage)
            TriggerEvent(GoFastConfig.Bannissement.NamesEventBAN, GoFastConfig.Bannissement.ReasonBan, source)
    end
end)

RegisterServerEvent("Ayzwen:PaymentGoFastArgent")
AddEventHandler("Ayzwen:PaymentGoFastArgent", function(moneynmbr)
    if #(GetEntityCoords(GetPlayerPed(source)) - vector3(-112.7456, 1881.925, 197.3327)) < 20.0 then -- SI VOUS CHANGER LA POSTION DU RACHETEUR CHANGER LA ICI AUSSI !!
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney("black_money", moneynmbr)
        TriggerClientEvent("Azw:AdvancedNotif", source, "Racheteur", "Discussion", "Bien vue mon gars, j'espère te revoir un jours !\n~r~+$" ..moneynmbr, "CHAR_CHAT_CALL", 9)
    elseif #(GetEntityCoords(GetPlayerPed(source)) - vector3(-112.7456, 1881.925, 197.3327)) > 20.0 then
        DropPlayer(source, GoFastConfig.Bannissement.KickMessage)
        TriggerEvent(GoFastConfig.Bannissement.NamesEventBAN, GoFastConfig.Bannissement.ReasonBan, source)
    end
end)

RegisterServerEvent('Ayzwen:callThePolice')
AddEventHandler('Ayzwen:callThePolice', function(titre, soustitre, msgg, charr, num)
	TriggerClientEvent('esx:showNotification', source, "~r~Un citoyens a avertis la police, fait attention !")
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], titre, soustitre, msgg, charr, num)
		end
	end
end)