-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

local animDict = 'combat@gestures@gang@pistol_1h@beckon'
local animName = '0'
local prop = 'prop_ballistic_shield'

RegisterNetEvent('fbi:InfoService')
AddEventHandler('fbi:InfoService', function(service, nom)
        if service == 'prise' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Prise de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-8\n~w~Information: ~g~Prise de service.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        elseif service == 'fin' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Fin de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-10\n~w~Information: ~g~Fin de service.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        elseif service == 'pause' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Pause de service', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-6\n~w~Information: ~g~Pause de service.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        elseif service == 'standby' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Mise en standby', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-12\n~w~Information: ~g~Standby, en attente de dispatch.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        elseif service == 'retour' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Bureau', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-19\n~w~Information: ~g~Retour au bureau.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        elseif service == 'refus' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Refus d\'obtempérer', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-30\n~w~Information: ~g~Refus d\'obtempérer / Délit de fuite en cours.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        elseif service == 'crime' then
                PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
                ESX.ShowAdvancedNotification('INFORMATIONS FBI', '~b~Crime en cours', 'Agent: ~g~'..nom..'\n~w~Code: ~g~10-31\n~w~Information: ~g~Crime en cours / poursuite en cours.', 'CHAR_FBI', 8)
                Wait(1000)
                PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        end
end)



Citizen.CreateThread(function()
        WarMenu.CreateMenu('fbimenu', 'Menu FBI')
        WarMenu.CreateSubMenu('citoyenmenu', 'fbimenu', 'Interaction Citoyen')
        WarMenu.CreateSubMenu('vehmenu', 'fbimenu', 'Interaction Vehicule')
        WarMenu.CreateSubMenu('objectmenu', 'fbimenu', 'Gestion objets')
        WarMenu.CreateSubMenu('autremenu', 'fbimenu', 'Autres')
        WarMenu.CreateSubMenu('statusmenu', 'fbimenu', 'Status')
        WarMenu.CreateSubMenu('fouillermenu', 'citoyenmenu', 'Fouiller')
        WarMenu.SetSubTitle('fbimenu', 'ACTION FBI')
        WarMenu.SetTitleBackgroundColor('fbimenu', 0, 81, 255, 150)
        WarMenu.SetTitleBackgroundColor('citoyenmenu', 0, 81, 255, 150)
        WarMenu.SetTitleBackgroundColor('vehmenu', 0, 81, 255, 150)
        WarMenu.SetTitleBackgroundColor('objectmenu', 0, 81, 255, 150)
        WarMenu.SetTitleBackgroundColor('autremenu', 0, 81, 255, 150)
        WarMenu.SetTitleBackgroundColor('fouillermenu', 0, 81, 255, 150)
        WarMenu.SetTitleBackgroundColor('statusmenu', 0, 81, 255, 150)

        while true do
                if WarMenu.IsMenuOpened('fbimenu') then

                        if WarMenu.MenuButton('Alerte FBI', 'statusmenu') then
                        end

                        if WarMenu.MenuButton('Interaction Citoyen', 'citoyenmenu') then
                        end

                        if WarMenu.MenuButton('Interaction Véhicule', 'vehmenu') then
                        end

                        if WarMenu.MenuButton('Gestion Objets', 'objectmenu') then
                        end

                        if WarMenu.MenuButton('Autres', 'autremenu') then
                        end


                        WarMenu.Display()
                elseif WarMenu.IsMenuOpened('citoyenmenu') then
                        if WarMenu.Button('Carte d\'identité') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        WarMenu.CloseMenu()
                                        _TriggerServerEvent('::{ayzwen}::jsfour-idcard:open', GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Fouiller') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                searchedPly = player
                                if distance ~= -1 and distance <= 3.0 then
                                        refreshFouille(player)
                                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:message', GetPlayerServerId(player), _U('being_searched'))
                                        WarMenu.OpenMenu('fouillermenu')
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Escorter') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:drag', GetPlayerServerId(player))
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Mettre dans le véhicule') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:putInVehicle', GetPlayerServerId(player))
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Sortir du véhicule') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:OutVehicle', GetPlayerServerId(player))
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Facturer') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        WarMenu.CloseMenu()
                                        OpenFineMenu(player)
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Licenses') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        WarMenu.CloseMenu()
                                        ShowPlayerLicense(player)
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        if WarMenu.Button('Amendes Impayées') then
                                local player, distance = ESX.Game.GetClosestPlayer()
                                if distance ~= -1 and distance <= 3.0 then
                                        WarMenu.CloseMenu()
                                        OpenUnpaidBillsMenu(player)
                                else
                                        ESX.ShowNotification('~r~Aucun joueur~s~ à proximité')
                                end
                        end

                        WarMenu.Display()
                elseif WarMenu.IsMenuOpened('vehmenu') then
                        local vehicle = ESX.Game.GetVehicleInDirection()

                        if WarMenu.Button('Chercher dans la base de données') then
                                LookupVehicle()
                        end

                        if WarMenu.Button('Informations véhicule') then
                                if DoesEntityExist(vehicle) then
                                        local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                                        WarMenu.CloseMenu()
                                        OpenVehicleInfosMenu(vehicleData)
                                else
                                        ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', '~r~Aucun véhicule~s~ à proximité~s~', 'CHAR_CARSITE', 1)
                                end
                        end

                        if WarMenu.Button('Crocheter le véhicule') then
                                if DoesEntityExist(vehicle) then
                                        local plyPed = PlayerPedId()

                                        TaskStartScenarioInPlace(plyPed, 'WORLD_HUMAN_WELDING', 0, true)
                                        Citizen.Wait(20000)
                                        ClearPedTasksImmediately(plyPed)

                                        SetVehicleDoorsLocked(vehicle, 1)
                                        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                                        ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', 'Véhicule ~g~dévérouillé~s~', 'CHAR_CARSITE', 1)
                                else
                                        ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', '~r~Aucun véhicule~s~ à proximité~s~', 'CHAR_CARSITE', 1)
                                end
                        end

                        if WarMenu.Button('Mettre en fourrière') then
                                local plyPed = PlayerPedId()

                                TaskStartScenarioInPlace(plyPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

                                ClearPedTasks(plyPed)
                                Citizen.Wait(4000)
                                ImpoundVehicle(vehicle)
                                ClearPedTasks(plyPed)
                                ESX.ShowAdvancedNotification('~h~~b~FBI~s~', '~h~Information véhicule~s~', _U'impound_successful', 'CHAR_CARSITE', 1)
                        end

                        WarMenu.Display()
                elseif WarMenu.IsMenuOpened('objectmenu') then
                        if WarMenu.Button(_U'cone') then
                                spawnObject('prop_roadcone02a')
                        end

                        if WarMenu.Button(_U'barrier') then
                                spawnObject('prop_barrier_work05')
                        end

                        if WarMenu.Button(_U'spikestrips') then
                                spawnObject('p_ld_stinger_s')
                        end

                        WarMenu.Display()
                elseif WarMenu.IsMenuOpened('statusmenu') then
                        if WarMenu.Button('Prise de services') then
                                local info = 'prise'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end

                        if WarMenu.Button('Fin de services') then
                                local info = 'fin'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end

                        if WarMenu.Button('Prendre une pause') then
                                local info = 'pause'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end

                        if WarMenu.Button('Prendre un Standby') then
                                local info = 'standby'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end

                        if WarMenu.Button('Retour au bureau') then
                                local info = 'retour'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end


                        if WarMenu.Button('Refus') then
                                local info = 'refus'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end


                        if WarMenu.Button('Un crime') then
                                local info = 'crime'
                                TriggerServerEvent('::{ayzwen}::fbi:PriseEtFinservice', info)
                        end


                        WarMenu.Display()
                elseif WarMenu.IsMenuOpened('autremenu') then
                        if WarMenu.Button('Activer/Désactiver le bouclier') then
                                if shieldActive then
                                        local plyPed = PlayerPedId()

                                        DeleteEntity(shieldEntity)
                                        ClearPedTasksImmediately(plyPed)
                                        SetWeaponAnimationOverride(plyPed, `Default`)

                                        shieldActive = false
                                else
                                        shieldActive = true
                                        local plyPed = PlayerPedId()
                                        local pedPos = GetEntityCoords(plyPed, false)

                                        ESX.Streaming.RequestAnimDict(animDict)

                                        TaskPlayAnim(plyPed, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
                                        RemoveAnimDict(animDict)

                                        ESX.Game.SpawnObject(GetHashKey(prop), pedPos, function(object)
                                                shieldEntity = object
                                                AttachEntityToEntity(shieldEntity, plyPed, GetEntityBoneIndexByName(plyPed, 'IK_L_Hand'), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
                                        end)
                                end
                        end

                        WarMenu.Display()
                elseif WarMenu.IsMenuOpened('fouillermenu') then
                        while fouilleElements == nil do
                                Citizen.Wait(0)
                        end

                        for i = 1, #fouilleElements, 1 do
                                if WarMenu.Button(fouilleElements[i].label) then
                                        _TriggerServerEvent('::{ayzwen}::GangsBuilder:confiscatePlayerItem', GetPlayerServerId(searchedPly), fouilleElements[i].itemType, fouilleElements[i].value, fouilleElements[i].amount)
                                        refreshFouille(searchedPly)
                                end
                        end

                        WarMenu.Display()
                end

                Citizen.Wait(0)
        end
end)

function refreshFouille(thePlayer)
        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getOtherPlayerData', function(data)
                fouilleElements = {}

                for i = 1, #data.accounts, 1 do
                        if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
                                table.insert(fouilleElements, {
                                        label = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
                                        value = 'dirtycash',
                                        itemType = 'item_account',
                                        amount = data.accounts[i].money
                                })

                                break
                        end
                end

                table.insert(fouilleElements, {
                        label = _U('inventory_label'),
                        value = nil
                })

                for i = 1, #data.inventory, 1 do
                        if data.inventory[i].count > 0 then
                                table.insert(fouilleElements, {
                                        label = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
                                        value = data.inventory[i].name,
                                        itemType = 'item_standard',
                                        amount = data.inventory[i].count
                                })
                        end
                end

                table.insert(fouilleElements, {
                        label = _U('guns_label'),
                        value = nil
                })

                for i = 1, #data.weapons, 1 do
                        table.insert(fouilleElements, {
                                label = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
                                value = data.weapons[i].name,
                                itemType = 'item_weapon',
                                amount = data.weapons[i].ammo
                        })
                end
        end, GetPlayerServerId(thePlayer))
end

function spawnObject(name)
        local plyPed = PlayerPedId()
        local coords = GetEntityCoords(plyPed, false) + (GetEntityForwardVector(plyPed) * 1.0)

        ESX.Game.SpawnObject(name, coords, function(obj)
                SetEntityHeading(obj, GetEntityPhysicsHeading(plyPed))
                PlaceObjectOnGroundProperly(obj)
        end)
end