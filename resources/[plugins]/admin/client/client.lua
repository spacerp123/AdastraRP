ESX = {};
local Reports = {}
local ReportNonTraiter = 0
local ReportEnCours = 0
local ReportClose = 0
local PlayerReportSelected = nil
local StaffConnected = 0
local PlayerLoaded = false

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj)
    ESX = obj
end)

AddEventHandler('playerSpawned', function(spawn, isFirstSpawn)
	while not ESX.PlayerLoaded do
		Citizen.Wait(10)
	end

	
end)

local StaffActive = false
local showName = false
local gamerTags = {}
local PlayerList = {}
local currentPlayerSelected = nil
local GroupIndex = 1;
local idtoreport = 1;

function OpenStaffMenu()
    local main = RageUI.CreateMenu("Menu Staff", "Actions Disponibles")
    local principalMain = RageUI.CreateSubMenu(main, "Action principal", "Que voulez-vous faire ?")
    local vehicleMain = RageUI.CreateSubMenu(main, "Action véhicule", "Que voulez-vous faire ?")
    local playerListMain = RageUI.CreateSubMenu(main, "Liste de joueurs", "Selectionner un joueur")
    local staffListMain = RageUI.CreateSubMenu(main, "Liste de staff", "Selectionner un joueur")
    local playerActionMain = RageUI.CreateSubMenu(playerListMain, "Action joueurs", "Que voulez-vous faire ?")
    local reportMenu = RageUI.CreateSubMenu(main, "Report", "Que voulez-vous faire ?")
    local reportList = RageUI.CreateSubMenu(reportMenu, "Liste Des Report", "Report non-traités :")
    local reportAction = RageUI.CreateSubMenu(reportList, "Action", "Que voulez-vous faire ?")

    RageUI.Visible(main, not RageUI.Visible(main))

    while main do
        Citizen.Wait(0)
        RageUI.IsVisible(main, function()
            RageUI.Separator('Connectés : ~g~ '..#PlayerList)
            RageUI.Checkbox('Activer Mode Staff', nil, StaffActive, {}, {
                onChecked = function()
                    TriggerServerEvent("Admin:StaffService", true)
                    StaffActive = true
                end,
                onUnChecked = function()
                    StaffActive = false
                    TriggerServerEvent("Admin:StaffService", false)
                    local targetPed = PlayerPedId()
                end,
            })
            local label
            if StaffActive then 
                label = "~g~activé"
            else
                label = "~r~désactivé"
            end
            RageUI.Separator("↓ JOUEURS ↓")
            RageUI.Button('Joueurs en Lignes', nil, { RightLabel = #PlayerList}, StaffActive, {
                onSelected = function()
                end
            }, playerListMain)
            RageUI.Button('Staffs en Lignes', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                end
            }, staffListMain)
            RageUI.Separator("↓ REPORTS ↓")
            RageUI.Button('Liste Des Reports', nil, { RightLabel = '→→→' }, StaffActive, {
                onSelected = function()
                end
            }, reportMenu)
            RageUI.Separator("↓ AUTRES ↓")
            RageUI.Button('Actions Principal', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                end
            }, principalMain)
            RageUI.Button('Actions Véhicules', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                end
            }, vehicleMain)
        end)
        RageUI.IsVisible(principalMain, function()
            RageUI.Checkbox('Noclip', nil, noclip, {}, {
                onChecked = function()
                    noclip = true
                    ToogleNoClip()
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~g~activé~s~ le Noclip !", "CHAR_Adastra", 7, false, false, nil)
                end,
                onUnChecked = function()
                    noclip = false
                    ToogleNoClip()
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~r~désactiver~s~ le Noclip !", "CHAR_Adastra", 7, false, false, nil)
                end,
                onSelected = function()
                end
            })
            RageUI.Checkbox('Mode invisible', nil, invisible, {}, {
                onChecked = function()
                    invisible = true
                    SetEntityInvincible(GetPlayerPed(-1), true)
                    SetEntityVisible(GetPlayerPed(-1), false, false)
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~g~activé~s~ le mode invisible !", "CHAR_Adastra", 7, false, false, nil)
                end,
                onUnChecked = function()
                    invisible = false
                    SetEntityInvincible(GetPlayerPed(-1), false)
                    SetEntityVisible(GetPlayerPed(-1), true, false)
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~r~désactiver~s~ le mode invisible !", "CHAR_Adastra", 7, false, false, nil)
                end,
                onSelected = function()
                end
            })
            RageUI.Checkbox('Affichez les noms', nil, showName, {}, {
                onChecked = function()
                    showName = true
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~g~activé~s~ les noms des joueurs !", "CHAR_Adastra", 7, false, false, nil)
                end,
                onUnChecked = function()
                    showName = false
                    for targetPlayer, gamerTag in pairs(gamerTags) do
                        RemoveMpGamerTag(gamerTag)
                        gamerTags[targetPlayer] = nil
                    end
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~r~désactiver~s~ les noms des joueurs !", "CHAR_Adastra", 7, false, false, nil)
                end,
            })
        end)
        RageUI.IsVisible(vehicleMain, function()
            RageUI.List('Clear la zone', {
                { Name = "1", Value = 1 },
                { Name = "5", Value = 5 },
                { Name = "10", Value = 10 },
                { Name = "15", Value = 15 },
                { Name = "20", Value = 20 },
                { Name = "25", Value = 25 },
                { Name = "30", Value = 30 },
                { Name = "50", Value = 50 },
                { Name = "100", Value = 100 },
            }, GroupIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    GroupIndex = Index;
                end,
                onSelected = function(Index, Item)
                    local playerPed = PlayerPedId()
                    local radius = Item.Value
                    if radius and tonumber(radius) then
                        radius = tonumber(radius) + 0.01
                        local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(playerPed, false), radius)

                        for i = 1, #vehicles, 1 do
                            local attempt = 0

                            while not NetworkHasControlOfEntity(vehicles[i]) and attempt < 100 and DoesEntityExist(vehicles[i]) do
                                Citizen.Wait(100)
                                NetworkRequestControlOfEntity(vehicles[i])
                                attempt = attempt + 1
                            end

                            if DoesEntityExist(vehicles[i]) and NetworkHasControlOfEntity(vehicles[i]) then
                                ESX.Game.DeleteVehicle(vehicles[i])
                                DeleteEntity(vehicles[i])
                            end
                        end
                    else
                        local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

                        if IsPedInAnyVehicle(playerPed, true) then
                            vehicle = GetVehiclePedIsIn(playerPed, false)
                        end

                        while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
                            Citizen.Wait(100)
                            NetworkRequestControlOfEntity(vehicle)
                            attempt = attempt + 1
                        end

                        if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
                            ESX.Game.DeleteVehicle(vehicle)
                            DeleteEntity(vehicle)
                        end
                    end
                end,
            })
            RageUI.Button('Réparation du véhicule', nil, { }, true, {
                onSelected = function()
                    local plyVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    SetVehicleFixed(plyVeh)
                    SetVehicleDirtLevel(plyVeh, 0.0)
                    TriggerServerEvent("MasterLua:SendLogs", "Repair Vehicle")
                    ESX.ShowAdvancedNotification("Adastra", "~y~Administration", "Vous avez ~g~réparer~s~ le véhicle !", "CHAR_Adastra", 7, false, false, nil)
                end
            })
        end)
        RageUI.IsVisible(playerListMain, function()
            for k, v in ipairs(PlayerList) do
                if v.group == "_dev" then 
                    RageUI.Button(('[%s] ~r~%s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                        onSelected = function()
                            currentPlayerSelected = v
                        end
                    }, playerActionMain)
                elseif v.group == "superadmin" then 
                    RageUI.Button(('[%s] ~o~%s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                        onSelected = function()
                            currentPlayerSelected = v
                        end
                    }, playerActionMain)
                elseif v.group == "admin" then 
                    RageUI.Button(('[%s] ~p~%s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                        onSelected = function()
                            currentPlayerSelected = v
                        end
                    }, playerActionMain)
                elseif v.group == "user" then 
                    RageUI.Button(('[%s] %s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                        onSelected = function()
                            currentPlayerSelected = v
                        end
                    }, playerActionMain)
                end
            end
        end)
        RageUI.IsVisible(staffListMain, function()
            for k, v in ipairs(PlayerList) do
               if v.group == "_dev" then 
                   RageUI.Button(('[%s] ~r~%s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                       onSelected = function()
                           currentPlayerSelected = v
                       end
                   }, playerActionMain)
               elseif v.group == "superadmin" then 
                   RageUI.Button(('[%s] ~o~%s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                       onSelected = function()
                           currentPlayerSelected = v
                       end
                   }, playerActionMain)
               elseif v.group == "admin" then 
                   RageUI.Button(('[%s] ~p~%s'):format(v.id, v.name), nil, { RightLabel = '→→→'}, StaffActive, {
                       onSelected = function()
                           currentPlayerSelected = v
                       end
                   }, playerActionMain)
               end
            end
        end)
        RageUI.IsVisible(playerActionMain, function()
            RageUI.Separator("~b~Nom :~s~ "..currentPlayerSelected.name)
            RageUI.Separator("~b~Id :~s~ "..currentPlayerSelected.id)
            RageUI.Separator("~b~Job :~s~ "..currentPlayerSelected.job)
            RageUI.Button('Se téléporter au joueur', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    TriggerServerEvent("Admin:ActionTeleport", "teleportto", currentPlayerSelected.id)
                end
            })
            RageUI.Button('Téléporter le joueur sur moi', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    TriggerServerEvent("Admin:ActionTeleport", "teleportme", currentPlayerSelected.id)
                end
            })
            RageUI.Button('Le téléporté au Parking Central', nil, { RightLabel = '→→→'}, true, {
                onSelected = function()
                    TriggerServerEvent('Admin:ActionTeleport', "teleportpc", currentPlayerSelected.id)
                    print('prout')
                end
            })
            RageUI.Button('Envoyer un message', nil, { RightLabel = '→→→'}, true, {
                onSelected = function() 
                    message = KeyboardInput('Message à envoyé', ('Message à envoyé'), '', 50)
                    if message then 
                        TriggerServerEvent("Admin:MessageStaff", tostring(message), currentPlayerSelected.id)
                    end
                end
            })
            RageUI.Button('Kick le joueur', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    message = KeyboardInput('Message du kick', ('Message du kick'), '', 50)
                    if message then 
                        TriggerServerEvent("Admin:KickPlayer", tostring(message), currentPlayerSelected.id)
                    end
                end
            })
            RageUI.Separator('Prison.')
            RageUI.List('Mettre en prison', {
                { Name = "300 Secondes", Value = 300 },
                { Name = "600 Secondes", Value = 600 },
                { Name = "1000 Secondes", Value = 1000 },
                { Name = "1200 Secondes", Value = 1200 },
                { Name = "1500 Secondes", Value = 1500 },
                { Name = "1800 Secondes", Value = 1800 },
                { Name = "2000 Secondes", Value = 2100 },
                { Name = "2500 Secondes", Value = 2400 },
            }, GroupIndex, nil, {}, true, {
                onListChange = function(Index, Item)
                    GroupIndex = Index;
                end,
                onSelected = function(Index, Item)
                    local time = Item.Value
                    ExecuteCommand("prison "..currentPlayerSelected.id.." "..time)
                end
            })
            RageUI.Button('Sortir de prison', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    message = KeyboardInput('Tu es sur ?', ('oui/non'), '', 3)
                    if message == 'oui' then
                        ExecuteCommand("sprison "..currentPlayerSelected.id.." ")
                    end
                end
            })
        end)
        RageUI.IsVisible(reportMenu, function()
            RageUI.Separator("~b~Nombre de report non traite :~s~ "..math.floor(ReportNonTraiter))
            RageUI.Separator("~b~Nombre de report en cours :~s~ "..math.floor(ReportEnCours))
            RageUI.Separator("~b~Nombre de report clos :~s~ "..math.floor(ReportClose))
            RageUI.Button('Liste de report', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                end
            }, reportList)
        end)
        RageUI.IsVisible(reportList, function()
            for k,v in pairs(Reports) do 
                local label 
                if v.state then 
                    label = "~g~En cours"
                else 
                    label = "~r~En attente"
                end
                RageUI.Button(k.." - "..v.name, "Raison : "..v.raison.."\nHeure : "..v.heure, { RightLabel = label..' →→→'}, StaffActive, {
                    onSelected = function()
                        PlayerReportSelected = v
                        TriggerServerEvent("Admin:ActionToReport", "takeReport", PlayerReportSelected.id)
                    end
                }, reportAction)
            end
        end)
        RageUI.IsVisible(reportAction, function()
            RageUI.Separator("~b~Nom :~s~ "..PlayerReportSelected.name)
            RageUI.Separator("~b~Id :~s~ "..PlayerReportSelected.id)
            RageUI.Separator("~b~Heure :~s~ "..PlayerReportSelected.heure)
            RageUI.Button('Se téléporter au joueur', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    TriggerServerEvent("Admin:ActionTeleport", "teleportto", PlayerReportSelected.id)
                end
            })
            RageUI.Button('Téléporter le joueur sur moi', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    TriggerServerEvent("Admin:ActionTeleport", "teleportme", PlayerReportSelected.id)
                end
            })
            RageUI.Button('Téléporter le joueur au parking central', nil, { RightLabel = '→→→'}, StaffActive, {
                onSelected = function()
                    TriggerServerEvent("Admin:ActionTeleport", "teleportpc", PlayerReportSelected.id)
                end
            })
            RageUI.Button('Envoyer un message', nil, { RightLabel = '→→→'}, true, {
                onSelected = function() 
                    message = KeyboardInput('Message à envoyé', ('Message à envoyé'), '', 50)
                    if message then 
                        TriggerServerEvent("Admin:MessageStaff", tostring(message), PlayerReportSelected.id)
                    end
                end
            })
            RageUI.Separator("")
            RageUI.Button('Clore le report', nil, { RightLabel = '→→→'}, true, {
                onSelected = function() 
                    TriggerServerEvent("Admin:ActionToReport", "clore", PlayerReportSelected.id)
                    RageUI.CloseAll()
                end
            })
        end)
    end
    if not RageUI.Visible(main) and not RageUI.Visible(principalMain) and not RageUI.Visible(vehicleMain) and not RageUI.Visible(playerListMain) and not RageUI.Visible(playerActionMain) and not RageUI.Visible(reportMenu) and not RageUI.Visible(reportList) and not RageUI.Visible(reportAction) and not RageUI.Visible(staffListMain) and not RageUI.Visible(staffActionMain) then
        main = RMenu:DeleteType('main', true)
        principalMain = RMenu:DeleteType('principalMain', true)
        vehicleMain = RMenu:DeleteType('vehicleMain', true)
        playerListMain = RMenu:DeleteType('playerListMain', true)
        playerActionMain = RMenu:DeleteType('playerActionMain', true)
        staffListMain = RMenu:DeleteType('staffListMain', true)
        staffActionMain = RMenu:DeleteType('staffActionMain', true)
        reportMenu = RMenu:DeleteType('reportMenu', true)
        reportList = RMenu:DeleteType('reportList', true)
        reportAction = RMenu:DeleteType('reportAction', true)
        currentPlayerSelected = nil
    end
end

Citizen.CreateThread(function()
    while true do
        if showName then
            Wait(0)
            for k, v in ipairs(ESX.Game.GetPlayers()) do
                local otherPed = GetPlayerPed(v)

                if otherPed ~= plyPed then
                    if #(GetEntityCoords(plyPed, false) - GetEntityCoords(otherPed, false)) < 5000.0 then
                        gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
                    else
                        RemoveMpGamerTag(gamerTags[v])
                        gamerTags[v] = nil
                    end
                end
            end
        else    
            Wait(800)
        end 
    end
end)



function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
	AddTextEntry(entryTitle, textEntry)
	DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end

RegisterNetEvent("Admin:ActionTeleport")
AddEventHandler('Admin:ActionTeleport', function(action, coords)
    if action == "teleportto" then 
        SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
    elseif action == "teleportme" then 
        SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
    elseif action == "teleportpc" then
        SetEntityCoords(PlayerPedId(), coords, false, false, false, false)
    end
end)

RegisterNetEvent("Admin:RefreshReport")
AddEventHandler('Admin:RefreshReport', function(table, table2, table3, table4)
    Reports = table
    ReportNonTraiter = table2
    ReportEnCours = table3
    ReportClose = table4
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    local PlayerLoaded = true
end)

RegisterNetEvent('admin:addStaff')
AddEventHandler('admin:addStaff', function(nb)
    StaffConnected = nb
end)

RegisterNetEvent('admin:sendMsgReport')
AddEventHandler('admin:sendMsgReport', function(src)
    if (ESX.GetPlayerData()['group'] ~= "user") then
        ESX.ShowNotification('~g~Staff ~w~~n~Un nouveau report à été crée par avec l\'id unique : ['.. src .. ']')
    end
end)

RegisterCommand("admin", function()
    --if not PlayerLoaded then 
    --    return
    --end
    ESX.TriggerServerCallback('Admin:getPlayersList', function(pList, group) 
        if (ESX.GetPlayerData()['group'] ~= "user") then
            PlayerList = pList
            print(json.encode(PlayerList))
            OpenStaffMenu()
        end
	end)
end, false)
RegisterKeyMapping('admin', 'Menu Staff', 'keyboard', 'F10')