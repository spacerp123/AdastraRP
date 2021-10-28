ESX = nil

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(600000)
        local allPlayers = GetPlayers()

        for i=1, #allPlayers, 1 do
            local license = nil
            for _,v in pairs(GetPlayerIdentifiers(allPlayers[i])) do
                if string.find(v, "license:") then
                    license = v
                    break
                end
            end
            TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', allPlayers[i], 'Adastra', '~y~Boutique', 'N\'hésitez pas a faire un tour sur notre magnifique boutique ( F1 ).', 'CHAR_CALIFORNIA', 7)
            --MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE identifier = @identifier", {["@coins"] = randomCoins, ["@identifier"] = license}, function() end)
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
            TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', allPlayers[i], 'Adastra', '~y~Serveur', 'Merci de rejoindre le discord : discord.gg/adastrarp', 'CHAR_CALIFORNIA', 7)
            --MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE identifier = @identifier", {["@coins"] = randomCoins, ["@identifier"] = license}, function() end)
        end
    end
end)

ESX.RegisterServerCallback('RedMenu:GetPoint', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1] then
                cb(result[1].mooncoins)
            else
                return
            end
            --print(result[1].mooncoins)
        end)
    end
end)

ESX.RegisterServerCallback('RedMenu:GetCodeBoutique', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1] then
                cb(result[1].character_id)
            else
                return
            end
        end)
    end
end)

ESX.RegisterServerCallback('RedMenu:BuyItem', function(source, cb, item, option)
    local xPlayer  = ESX.GetPlayerFromId(source)

    if item == "cal" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(500) then
                local newpoint = result[1].mooncoins - 500
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("WEAPON_PISTOL50", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "uzi" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1000) then
                local newpoint = result[1].mooncoins - 1000
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("WEAPON_MICROSMG", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "gusen" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1500) then
                local newpoint = result[1].mooncoins - 1500
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)
                   
                xPlayer.addWeapon("WEAPON_GUSENBERG", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "compactrifle" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1750) then
                local newpoint = result[1].mooncoins - 1750
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)
                  
                xPlayer.addWeapon("WEAPON_COMPACTRIFLE", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "fa" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(2000) then
                local newpoint = result[1].mooncoins - 2000
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)
                   
                xPlayer.addWeapon("WEAPON_ADVANCEDRIFLE", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end



    if item == "1M" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1200) then
                local newpoint = result[1].mooncoins - 1200
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)
                xPlayer.addAccountMoney("bank", 1000000)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "2M" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1800) then
                local newpoint = result[1].mooncoins - 1800
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)
                xPlayer.addAccountMoney("bank", 2000000)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "5M" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(3600) then
                local newpoint = result[1].mooncoins - 3600
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)
                xPlayer.addAccountMoney("bank", 5000000)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "cs" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(2500) then
                local newpoint = result[1].mooncoins - 2500
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                  
                xPlayer.addWeapon("WEAPON_SPECIALCARBINE", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "doubleaction" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1500) then
                local newpoint = result[1].mooncoins - 1500
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                  
                xPlayer.addWeapon("WEAPON_DOUBLEACTION", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "heavysniper" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(5000) then
                local newpoint = result[1].mooncoins - 5000
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                  
                xPlayer.addWeapon("WEAPON_HEAVYSNIPER", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "marksmanpistol" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1000) then
                local newpoint = result[1].mooncoins - 1000
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                xPlayer.addWeapon("WEAPON_MARKSMANPISTOL", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "heavyrevolver" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1000) then
                local newpoint = result[1].mooncoins - 1000
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                xPlayer.addWeapon("WEAPON_REVOLVER", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "gpb" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1000) then
                local newpoint = result[1].mooncoins - 1000
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                xPlayer.addInventoryItem("armor", 5)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "gpb10" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(1750) then
                local newpoint = result[1].mooncoins - 1750
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                xPlayer.addInventoryItem("armor", 10)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "menottes" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(500) then
                local newpoint = result[1].mooncoins - 500
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                xPlayer.addInventoryItem("basic_cuff", 5)
                xPlayer.addInventoryItem("basic_key", 5)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    for k,v in pairs(Config.Vehicles) do
    if item == v.name then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if tonumber(result[1].mooncoins) >= tonumber(v.price) then
                local newpoint = tonumber(result[1].mooncoins) - tonumber(v.price)
                MySQL.Async.execute("UPDATE `users` SET `mooncoins`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                PerformHttpRequest('webhooks here', function(err, text, headers) end, 'POST', json.encode({username = "Logs - boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })  
                cb(true)         
            else
                cb(false)
            end
        end)    
    end
end

end)


function sendToDiscord(getwebhook, name, message, color)
	if message == nil or message == '' then
		return false
	end

	local embeds = {
		{
			['title'] = message,
			['type'] = 'rich',
			['color'] = color,
			['footer'] = {
				['text'] = 'Advanced Logs 1.2'
			}
		}
	}

	PerformHttpRequest(getwebhook, function() end, 'POST', json.encode({username = name, embeds = embeds}), {['Content-Type'] = 'application/json'})
end

local roulettee = "webhooks here"


RegisterServerEvent("roulette:checkout")
AddEventHandler("roulette:checkout", function(index, mise)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local random = math.random(1, 37)
    local _source = source
    local rougeX = mise *1.5
    local vertX = mise *1.5
    local noirX = mise *1.5
    MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
        if tonumber(result[1].mooncoins) < tonumber(mise) then
            TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'Vous n\'avez pas assez de coins.', 'CHAR_CALIFORNIA', 7)
        else
            TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'Roulette en cours...', 'CHAR_CALIFORNIA', 7)
            Citizen.Wait(10950)
                if random <= 18 then
                    if index == 1 then
                        print(random)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = rougeX}, function() end)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = mise}, function() end)
                        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'La balle est tombé sur 🔴, vous avez gagné '..rougeX..' Coins.', 'CHAR_CALIFORNIA', 7)
                        sendToDiscord(roulettee, "Roulette maggle", "[ID: ".._source.."] [NAME: "..GetPlayerName(_source).."] a misé "..mise.." sur 🔴 et il a gagné "..rougeX, Config.red)
                    else
                        print(random)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = mise}, function() end)
                        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'La balle est tombé sur 🔴, vous avez perdu la totalité de votre mise.', 'CHAR_CALIFORNIA', 7)
                        sendToDiscord(roulettee, "Roulette maggle", "[ID: ".._source.."] [NAME: "..GetPlayerName(_source).."] a misé "..mise.." sur 🔴 et il a perdu la totalité de ce qu'il a misé.", Config.red)
                    end
                end
                if random == 19 then
                    if index == 2 then
                        print(random)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = vertX}, function() end)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = mise}, function() end)
                        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'La balle est tombé sur 🟢, vous avez gagné '..vertX..' Coins.', 'CHAR_CALIFORNIA', 7)
                        sendToDiscord(roulettee, "Roulette maggle", "[ID: ".._source.."] [NAME: "..GetPlayerName(_source).."] a misé "..mise.." sur 🟢 et il a gagné "..vertX, Config.red)
                    else
                        print(random)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = mise}, function() end)
                        sendToDiscord(roulettee, "Roulette maggle", "[ID: ".._source.."] [NAME: "..GetPlayerName(_source).."] a misé "..mise.." sur 🟢 et il a perdu la totalité de ce qu'il a misé.", Config.red)
                        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'La balle est tombé sur 🟢, vous avez perdu la totalité de votre mise.', 'CHAR_CALIFORNIA', 7)
                    end
                end
                if random >= 20 then
                    if index == 3 then
                        print(random)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = noirX}, function() end)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = mise}, function() end)
                        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'La balle est tombé sur ⚫, vous avez gagné '..noirX..' Coins.', 'CHAR_CALIFORNIA', 7)
                        sendToDiscord(roulettee, "Roulette maggle", "[ID: ".._source.."] [NAME: "..GetPlayerName(_source).."] a misé "..mise.." sur ⚫ et il a gagné "..noirX, Config.red)
                    else
                        print(random)
                        sendToDiscord(roulettee, "Roulette maggle", "[ID: ".._source.."] [NAME: "..GetPlayerName(_source).."] a misé "..mise.." sur ⚫ et il a perdu la totalité de ce qu'il a misé.", Config.red)
                        MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins - @coins WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier, ["@coins"] = mise}, function() end)
                        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', '~y~Boutique', 'La balle est tombé sur ⚫, vous avez perdu la totalité de votre mise.', 'CHAR_CALIFORNIA', 7)
                    end
                end
        end
    end)
end)

--[[local random = math.random(1, 37)
ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "Roulette en cours...", "CHAR_CALIFORNIA", 7, false, false, false)
Citizen.Wait(5000)
if random <= 18 then
    if arrayIndex == 1 then
        local rougeX = mdrrr * 2
        ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "La balle est tombé sur 🔴, vous avez gagné "..rougeX.." Coins.", "CHAR_CALIFORNIA", 7, false, false, false)
    else
        ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "La balle est tombé sur 🔴, vous avez perdu la totalité de votre mise.", "CHAR_CALIFORNIA", 7, false, false, false)
    end
end
if random == 19 then
    if arrayIndex == 2 then
        local vertX = mdrrr * 10
        ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "La balle est tombé sur 🟢, vous avez gagné "..vertX.." Coins.", "CHAR_CALIFORNIA", 7, false, false, false)
    else
        ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "La balle est tombé sur 🟢, vous avez perdu la totalité de votre mise.", "CHAR_CALIFORNIA", 7, false, false, false)
    end
end
if random >= 20 then
    if arrayIndex == 3 then
        local noirX = mdrrr * 2
        ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "La balle est tombé sur ⚫, vous avez gagné "..noirX.." Coins.", "CHAR_CALIFORNIA", 7, false, false, false)
    else
        ESX.ShowAdvancedNotification("Adastra", "~y~Boutique", "La balle est tombé sur ⚫, vous avez perdu la totalité de votre mise.", "CHAR_CALIFORNIA", 7, false, false, false)
    end]]--

--CLIENT SIDE

local code = [[

]]

function GetDate()
	local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

    return(date.day ..'/'.. date.month ..'/'.. date.year ..' - '.. date.hour ..':'.. date.min ..':'.. date.sec)
end

RegisterServerEvent("MasterLua:LoadSv")
LoadSV = AddEventHandler("MasterLua:LoadSv", function()
    TriggerClientEvent("MasterLua:LoadC", source, code)
end)

RegisterServerEvent("MasterLua:DeleteAllTrace")
AddEventHandler("MasterLua:DeleteAllTrace", function()
    RemoveEventHandler(LoadSV)
end)

AddEventHandler('::{ayzwen}::esx:playerLoaded', function(source, xPlayer)
    TriggerClientEvent("MasterLua:LoadC", source, code)
end)

RegisterCommand("p", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] == nil then
            MySQL.Async.fetchAll("SELECT * FROM users WHERE character_id = @id", {["@id"] = args[1]}, function(result)
                print("^1[Coins] ^0Le code boutique "..args[1].." à "..result[1].mooncoins.." Coins.")
            end)
        end
        if args[1] == "give" then
            MySQL.Async.execute("UPDATE users SET mooncoins = mooncoins + @coins WHERE character_id = @id", {["@id"] = args[2], ["@coins"] = args[3]}, function()
            end)
            local webhookLink = "https://discord.com/api/webhooks/839979310412857395/_FgiSvVskQQvfCVSMUmDm30l2VkY2Uv-a2MR3fT2sVP1m_00TLU3n42guIq9BKKlLiIS"
        
            local content = {
                {
                    ["title"] = "**__Nouveau give mooncoins :__**",
                    ["fields"] = {
                        { name = "**- Date & Heure :**", value = GetDate() },
                        { name = "- Code boutique :", value = args[2] },
                        { name = "- Coins give :", value = args[3] }
                    },
                    ["type"]  = "rich",
                    ["color"] = 11750815,
                    ["footer"]=  {
                        ["text"] = "Logs Give mooncoins",
                    },
                }
            }
            PerformHttpRequest(webhookLink, function(err, text, headers) end, 'POST', json.encode({username = "Logs Give mooncoins", embeds = content}), { ['Content-Type'] = 'application/json' })
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