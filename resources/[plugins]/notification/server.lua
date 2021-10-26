ESX = nil

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('annoncejob', function(source, args, rawCommand)
    local _source = source
    local CHAR = 'CHAR_Adastra'
    local jobLabel = nil
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == "police" then
        jobLabel = 'LSPD'
        CHAR = 'CHAR_ABIGAIL'
    elseif xPlayer.job.name == "carshop" then
        jobLabel = 'Concessionnaire'
        CHAR = 'CHAR_CARSITE'
    elseif xPlayer.job.name == "mecano" then
        jobLabel = 'Mécano'
        CHAR = 'CHAR_CARSITE3'
    elseif xPlayer.job.name == "swat" then
        jobLabel = 'S.W.A.T'
        CHAR = 'CHAR_ANDREAS'
    elseif xPlayer.job.name == "taxi" then
        jobLabel = 'TAXI'
        CHAR = 'CHAR_TAXI'
    elseif xPlayer.job.name == "ambulance" then
        jobLabel = 'EMS'
        CHAR = 'CHAR_CALL911'
    elseif xPlayer.job.name == "avocat" then
        jobLabel = 'Avocat'
        CHAR = 'CHAR_AMANDA'
    elseif xPlayer.job.name == "tabac" then
        jobLabel = 'Tabac'
        CHAR = 'CHAR_TENIS_COACH'
    elseif xPlayer.job.name == "journalist" then
        jobLabel = 'Weazel News'
        CHAR = 'CHAR_TENIS_COACH'
    elseif xPlayer.job.name == "libragarage" then
        jobLabel = 'LibraGarage'
        CHAR = 'CHAR_CARSITE3'
    elseif xPlayer.job.name == "fbi" then
        jobLabel = 'FBI'
        CHAR = 'CHAR_MULTIPLAYER'
    elseif xPlayer.job.name == "unicorn" then
        jobLabel = 'Unicorn'
        CHAR = 'CHAR_MP_STRIPCLUB_PR'
    elseif xPlayer.job.name == "vigne" then
        jobLabel = 'Vigneron'
        CHAR = 'CHAR_MP_ARMY_CONTACT'
    elseif xPlayer.job.name == "planeshop" then
        jobLabel = 'Concessionnaire Avion'
        CHAR = 'CHAR_PROPERTY_PLANE_SCRAP_YARD'
    elseif xPlayer.job.name == "gouvernement" then
        jobLabel = 'Gouvernement'
        CHAR = 'CHAR_PROPERTY_GOLF_CLUB'
    end
    if jobLabel ~= nil then
        local src = source
        local msg = table.concat(args, " ")
        local args = msg
        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', -1, jobLabel, '~b~Accueil', msg, CHAR, 0)
        PerformHttpRequest('https://discord.comm/api/webhooks/843451458875555870/5ca3io19aNzNx2VDoyLRFMbudOe6wVOJiB9GcM2bf8UKwBEIl7r7y2TDTiCpL_7b1y9L', function(err, text, headers) end, 'POST', json.encode({username = jobLabel.." - Adastra", content = "```ID : " .. source .. "\nJoueur : " .. GetPlayerName(source) .. "\nMessage : " .. msg .. "```"}), { ['Content-Type'] = 'application/json' })  
    else
        TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Avertisement', '~r~ALERTE' , 'Tu n’as pas de métier pour faire une annonce', CHAR, 0)
    end
end, false)
