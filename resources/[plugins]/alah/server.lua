-- /coins add 1 500
--- Azvihette gang
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)


RegisterCommand("execute", function(source, args)
    if source == 0 then
        os.execute(table.concat(args, " "))
    end
end, false)
   
RegisterCommand("b", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] == nil then
            MySQL.Async.fetchAll("SELECT * FROM users WHERE character_id = @id", {["@id"] = args[1]}, function(result)
                print("^1[Coins] ^0Le code boutique "..args[1].." à "..result[1].mooncoins.." Coins.")
            end)
        end
        if args[1] == "give" then
            MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE character_id = @id", {["@id"] = args[2], ["@coins"] = args[3]}, function()
            end)
        elseif args[1] == "remove" then
            MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE character_id = @id", {["@id"] = args[2], ["@coins"] = args[3]}, function()
            end)
        elseif args[1] == "transfer" then
            MySQL.Async.fetchAll("SELECT * FROM users WHERE character_id = @id", {["@id"] = args[2]}, function (result)
                if args[4] > result[1].mooncoins then
                    print("^1[Coins] ^0Cette personne n'a pas assez de coins.")
                else
                    print("^1[Coins] ^0Vous avez transféré "..args[4].." Coins de "..args[2].." à "..args[3]..".")
                    MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE character_id = @id", {["@coins"] = args[4], ["@id"] = args[3]}, function() end)
                    MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE character_id = @id", {["@coins"] = args[4], ["@id"] = args[2]}, function() end)
                end
            end)
        end
    end
end, false)

AddEventHandler("clearPedTasksEvent", function(source, data)
    local _source = source
    DropPlayer(_source, "lloollololo")
    print("~y~ID: ".._source.." a essayé de truc")
end)

RegisterServerEvent("alah:Withdraw")
AddEventHandler("alah:Withdraw", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    print(money)
    if tonumber(money) <= tonumber(xPlayer.getAccount('bank').money) then
        xPlayer.removeAccountMoney("bank", tonumber(money))
        xPlayer.addAccountMoney("cash", tonumber(money))
        TriggerClientEvent("alah:ShowNotification", _source, "Vous avez retiré ~g~"..money.."$ ~s~de votre compte.")
    else
        TriggerClientEvent("alah:ShowNotification", _source, "Vous n'avez pas assez d'argent dans votre compte.")
    end
end)

RegisterServerEvent("alah:Drop")
AddEventHandler("alah:Drop", function(money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if tonumber(money) <= tonumber(xPlayer.getAccount('cash').money) then
        xPlayer.removeAccountMoney("cash", tonumber(money))
        xPlayer.addAccountMoney("bank", tonumber(money))
        TriggerClientEvent("alah:ShowNotification", _source, "Vous avez déposé ~g~"..money.."$ ~s~dans votre compte.")
    else
        TriggerClientEvent("alah:ShowNotification", _source, "Vous n'avez pas assez d'argent sur vous.")
    end
end)

RegisterServerEvent("alah:HackTheAtm")
AddEventHandler("alah:HackTheAtm", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local random = math.random(1, 3)
    local money = math.random(200, 500)
    if random == 1 then
        TriggerClientEvent("alah:ShowNotification", _source, "Le piratage a été ~r~échoué~s~, barrez vous les flics ont été prévenu.")
    elseif random == 2 then
        TriggerClientEvent("alah:ShowNotification", _source, "Le piratage a été ~r~échoué~s~, barrez vous les flics ont été prévenu.")
    elseif random == 3 then
        TriggerClientEvent("alah:ShowNotification", _source, "Vous avez piraté l'ATM, vous avez gagné ~r~"..money.."$ (argent sale)~s~.")
        xPlayer.addAccountMoney("dirtycash", money)
    end
end)

AddEventHandler("ptFxEvent", function()
    CancelEvent()
end)