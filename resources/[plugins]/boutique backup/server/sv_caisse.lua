STebex = STebex or {};

---@class STebex.Cache
STebex.Cache = STebex.Cache or {}

---@class STebex.Cache.Case
STebex.Cache.Case = STebex.Cache.Case or {}

function STebex:HasValue(tab, val)
    for i = 1, #tab do
        if tab[i] == val then
            return true
        end
    end
    return false
end

local function random(x, y)
    local u = 0;
    u = u + 1
    if x ~= nil and y ~= nil then
        return math.floor(x + (math.random(math.randomseed(os.time() + u)) * 999999 % y))
    else
        return math.floor((math.random(math.randomseed(os.time() + u)) * 100))
    end
end

local function GenerateLootbox(source, box, list)
    local xPlayer = ESX.GetPlayerFromId(source)
    local chance = random(1, 100)
    local gift = { category = 1, item = 1 }
    local minimalChance = 4

    local identifier = xPlayer.identifier
    minimalChance = 3
    if (STebex.Cache.Case[source] == nil) then
        STebex.Cache.Case[source] = {};
        if (STebex.Cache.Case[source][box] == nil) then
            STebex.Cache.Case[source][box] = {};
        end
    end
    if chance <= minimalChance then
        local rand = random(1, #list[3])
        STebex.Cache.Case[source][box][3] = list[3][rand]
        gift.category = 3
        gift.item = list[3][rand]
    elseif (chance > minimalChance and chance <= 30) or (chance > 80 and chance <= 100) then
        local rand = random(1, #list[2])
        STebex.Cache.Case[source][box][2] = list[2][rand]
        gift.category = 2
        gift.item = list[2][rand]
    else
        local rand = random(1, #list[1])
        STebex.Cache.Case[source][box][1] = list[1][rand]
        gift.category = 1
        gift.item = list[1][rand]
    end
    local finalList = {}
    for _, category in pairs(list) do
        for _, item in pairs(category) do
            local result = { name = item, time = 150 }
            table.insert(finalList, result)
        end
    end
    table.insert(finalList, { name = gift.item, time = 5000 })
    return finalList, gift.item
end

local reward = {
    ["syltacoin_3000"] = { type = "syltacoin", message = "Félicitation, vous avez gagner 3000 ~y~Sylta~f~Coins" },
    ["seasparrow2"] = { type = "vehicle", message = "Félicitation, vous avez gagner Hélicoptère-Cayo" },
    ["rmodrs6"] = { type = "vehicle", message = "Félicitation, vous avez gagner une RS6-C8" },

    ["weapon_specialcarbine"] = { type = "weapon", message = "Félicitation, vous avez gagner une G36-C" },
    ["weapon_carbinerifle"] = { type = "weapon", message = "Félicitation, vous avez gagner une Carabine" },

    ["italirsx"] = { type = "vehicle", message = "Félicitation, vous avez gagner une Itali RSX" }, -- Car
    ["speedo2"] = { type = "vehicle", message = "Félicitation, vous avez gagner un Camion Clown" }, -- Car


    ["bf400"] = { type = "vehicle", message = "Félicitation, vous avez gagner BF 400" },
    ["kart"] = { type = "vehicle", message = "Félicitation, vous avez gagner un Kart" },
}

local box = {
    [1] = {
        [3] = {
            "syltacoin_3000",
            "weapon_specialcarbine",
            "seasparrow2",
            "rmodrs6",
        },
        [2] = {
            "italirsx",
            "speedo2",
            "weapon_carbinerifle",
        },
        [1] = {
            "bf400",
            "kart",
        },
    }
}

RegisterServerEvent('tebex:on-process-checkout-case')
AddEventHandler('tebex:on-process-checkout-case', function()
    local source = source;
    if (source) then
        local xPlayer = ESX.GetPlayerFromId(source)
        local identifier = xPlayer.identifier
        if (xPlayer) then
            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
                if tonumber(result[1].syltacoin) >= tonumber(1500) then
                    local newpoint = result[1].syltacoin - 1500
                    MySQL.Async.execute("UPDATE `users` SET `syltacoin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                    local boxId = 1;
                    local lists, result = GenerateLootbox(source, boxId, box[boxId])
                    local giveReward = {
                        ["syltacoin_3000"] = function(_s, license, player)
                            MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. identifier .."'", {}, function (result)
                                local newpoint = result[1].syltacoin + 3000
                                MySQL.Async.execute("UPDATE `users` SET `syltacoin`= '".. newpoint .."' WHERE `identifier` = '".. identifier .."'", {}, function() end)
                            end)
                        end,
                        ["vehicle"] = function(_s, license, player)
                            local plate = CreateRandomPlateText()
    
                            LiteMySQL:Insert('owned_vehicles', {
                                owner = identifier,
                                plate = plate,
                                vehicle = json.encode({ model = result, plate = plate }),
                                type = 'car',
                                state = 1,
                            })
                            LiteMySQL:Insert('open_car', {
                                owner = identifier,
                                plate = plate
                            });
                        end,
                        ["plane"] = function(_s, license, player)
                            local plate = CreateRandomPlateText()
    
                            LiteMySQL:Insert('owned_vehicles', {
                                owner = identifier,
                                plate = plate,
                                vehicle = json.encode({ model = result, plate = plate }),
                                type = 'aircraft',
                                state = 1,
                            })
                            LiteMySQL:Insert('open_car', {
                                owner = identifier,
                                plate = plate
                            });
                        end,
                        ["weapon"] = function(_s, license, player)
                            xPlayer.addInventoryItem(result, 1)
                        end,
                        ["money"] = function(_s, license, player)
                            local before, after = result:match("([^_]+)_([^_]+)")
                            local quantity = tonumber(after)
                            player.addAccountMoney('bank', quantity)
                        end,
                    }
    
                    local r = reward[result];
    
                    if (r ~= nil) then
                        if (giveReward[r.type]) then
                            giveReward[r.type](source, identifier['license'], xPlayer);
                        else
                            -- FATAL ERROR
                        end
                    else
                        -- FATAL ERROR
                    end
    
                    if (identifier['fivem']) then
                        local before, after = identifier['fivem']:match("([^:]+):([^:]+)")
                        LiteMySQL:Insert('tebex_players_wallet', {
                            identifiers = after,
                            transaction = r.message,
                            price = '0',
                            currency = 'Box',
                            points = 0,
                        });
                    end
                    TriggerClientEvent('tebex:on-open-case', source, lists, result, r.message)
                else
                    --NOTIF PAS ASSEZ DE POINT
                end
            end)  
        else
            print('[Exeception] Failed to retrieve ESX player')
        end
    else
        print('[Exeception] Failed to retrieve source')
    end
end)
local characters = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }
function CreateRandomPlateText()
    local plate = ""
    math.randomseed(GetGameTimer())
    for i = 1, 4 do
        plate = plate .. characters[math.random(1, #characters)]
    end
    plate = plate .. ""
    for i = 1, 3 do
        plate = plate .. math.random(1, 9)
    end
    return plate
end