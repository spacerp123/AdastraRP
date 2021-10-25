ESX = nil
local Report = {}
local ReportNonTraiter = 0
local ReportEnCours = 0
local ReportClose = 0
local StaffInService = {}

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Admin:getPlayersList', function(source, cb)
    local pList = {}
    local xPlayerr = ESX.GetPlayerFromId(source)

    for _, playerId in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer ~= nil then
            table.insert(pList, {id = playerId, name = GetPlayerName(playerId), group = xPlayer.getGroup(), job = xPlayer.job.label})
        end
    end
    cb(pList, xPlayerr.group)
end)

RegisterNetEvent("Admin:StaffService")
AddEventHandler('Admin:StaffService', function(reply)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getGroup() ~= "user" then 
        StaffInService[_source] = reply
    else
        TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Le Cheat n'est pas autorisé sur notre serveur [téléportation]")
    end
end)

local StaffConnected = 0
RegisterNetEvent("Admin:PlayerConnected")
AddEventHandler('Admin:PlayerConnected', function()
    local _source = source
    local xGroup = xPlayer.getGroup()

    if xGroup ~= "user" then 
        StaffConnected = StaffConnected + 1
        TriggerClientEvent("admin:addStaff", -1, tonumber(StaffConnected))
    end
end)

AddEventHandler('playerDropped', function(reason)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then
        local xGroup = xPlayer.getGroup()
        if xGroup ~= "user" then
            StaffConnected = StaffConnected - 1
            TriggerClientEvent("admin:addStaff", -1, tonumber(StaffConnected))
        end
	end
end)

RegisterNetEvent("Admin:ActionTeleport")
AddEventHandler('Admin:ActionTeleport', function(action, id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getGroup() ~= "user" then 
        if action == "teleportto" then 
            local ped = GetPlayerPed(id)
            local coord = GetEntityCoords(ped)
            TriggerClientEvent("Admin:ActionTeleport", _source, "teleportto", coord)
        elseif action == "teleportme" then 
            local ped = GetPlayerPed(_source)
            local coord = GetEntityCoords(ped)
            TriggerClientEvent("Admin:ActionTeleport", id, "teleportme", coord)
        elseif action == "teleportpc" then
            local ped = GetPlayerPed(_source)
            local coord = vector3(215.76, -810.12, 30.73)
            TriggerClientEvent("Admin:ActionTeleport", id, "teleportpc", coord)
        end
    else
        TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Le Cheat n'est pas autorisé sur notre serveur [téléportation]")
    end
end)

RegisterNetEvent("Admin:MessageStaff")
AddEventHandler('Admin:MessageStaff', function(message, id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(id)

    if xPlayer.getGroup() ~= "user" then 
        xTarget.showNotification("~r~Message staffs\n~s~"..message)     
    else
        TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Le Cheat n'est pas autorisé sur notre serveur [message]")
    end
end)

RegisterNetEvent("Admin:KickPlayer")
AddEventHandler('Admin:KickPlayer', function(message, id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getGroup() ~= "user" then 
        DropPlayer(id, "\nVous avez été kick par : "..xPlayer.getName().."\nPour : "..message)
    else
        TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Le Cheat n'est pas autorisé sur notre serveur [kick player]")
    end
end)

local function GetDate()
	local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

    return(date.day ..'/'.. date.month ..'/'.. date.year ..' - '.. date.hour ..':'.. date.min ..':'.. date.sec)
end

RegisterCommand("report", function(source, args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if Report[_source] then 
        xPlayer.showNotification("~r~Report\n~s~Vous avez déjà un report en cours")   
    else 
        Report[_source] = {}
        Report[_source].raison = table.concat(args, " ")
        Report[_source].id = _source
        Report[_source].name = GetPlayerName(_source)
        Report[_source].state = false
        Report[_source].heure = GetDate()
        ReportNonTraiter = ReportNonTraiter + 1
        xPlayer.showNotification("~r~Report\n~s~Votre report à été envoyé avec succés !")   
        TriggerClientEvent("Admin:RefreshReport", -1, Report, ReportNonTraiter, ReportEnCours, ReportClose)
        TriggerClientEvent('admin:sendMsgReport', -1, xPlayer.source)
    end
end, false)



RegisterNetEvent("Admin:ActionToReport")
AddEventHandler('Admin:ActionToReport', function(actionType, id)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(id)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() ~= "user" then 
        if actionType == "clore" then 
            Report[id] = nil
            xPlayer.showNotification("~r~Report\n~s~Vous avez fermer le report") 
            if ReportNonTraiter >= 1 then
                ReportNonTraiter = ReportNonTraiter - 1
            end
            ReportEnCours = ReportEnCours - 1
            ReportClose = ReportClose + 1
            if xTarget then 
                xTarget.showNotification("~r~Report\n~g~" .. GetPlayerName(source) .. "~w~ à fermer votre report")   
            end
            TriggerClientEvent("Admin:RefreshReport", -1, Report, ReportNonTraiter, ReportEnCours, ReportClose) 
        elseif actionType == "takeReport" then 
            Report[id].state = true
            ReportNonTraiter = ReportNonTraiter - 1
            ReportEnCours = ReportEnCours + 1
            if xTarget then 
                xTarget.showNotification("~r~Report\n~g~" .. GetPlayerName(source) .. "~w~ viens de prendre ton report")  
            end
            TriggerClientEvent("Admin:RefreshReport", -1, Report, ReportNonTraiter, ReportEnCours, ReportClose) 
        end
    else
        TriggerEvent("::{ayzwen}::BanSql:ICheatServer", source, "Le Cheat n'est pas autorisé sur notre serveur [action sur report]")
    end
end)