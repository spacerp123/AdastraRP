local HasAllModelsLoaded = false
local visualVeh = nil
local entity = nil

local function loadedVehicles(vehicles)
    HasAllModelsLoaded = false
    Citizen.CreateThread(function()
        for k,v in pairs(vehicles) do
            local model = GetHashKey(v.name)
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(1) end
        end
        HasAllModelsLoaded = true
    end)
end

openedCatalogueMenu = false

Citizen.CreateThread(function()

    RMenu.Add('catalogue', 'main', RageUI.CreateMenu("Catalogue", "CATÉGORIES", 80, 90))
    RMenu:Get('catalogue', 'main').Closed = function()
        openedCatalogueMenu = false
        FreezeEntityPosition(PlayerPedId(), false)
    end

    for k,v in pairs(ConfigCatalogue.Categories) do
        RMenu.Add('catalogue', 'categories-'..v.name, RageUI.CreateSubMenu(RMenu:Get('catalogue', 'main'), v.label, v.desc))
        RMenu:Get('catalogue', 'categories-'..v.name).Closed = function()
            if visualVeh ~= lastName then 
                DeleteEntity(entity)
            end
        end
    end
   ESX = nil
    while ESX == nil do
        Wait(250)
        TriggerEvent(ConfigCatalogue.esxEvent, function(niceESX) ESX = niceESX end)
    end
end)

function openCatalogueMenu()
    if openedCatalogueMenu then
        FreezeEntityPosition(PlayerPedId(), false)
        openedCatalogueMenu = false
        RageUI.Visible(RMenu:Get('catalogue', 'main'), false)
        return
    else
        FreezeEntityPosition(PlayerPedId(), true)
        openedCatalogueMenu = true
        RageUI.Visible(RMenu:Get('catalogue', 'main'), true)
        Citizen.CreateThread(function()
            ESX = nil
            while ESX == nil do
                Wait(250)
                TriggerEvent(ConfigCatalogue.esxEvent, function(niceESX) ESX = niceESX end)
            end
            while openedCatalogueMenu do
                Wait(1.0)
                RageUI.IsVisible(RMenu:Get('catalogue', 'main'), function()
                    if #ConfigCatalogue.Categories == 0 then
                        RageUI.Separator("")
                        RageUI.Separator("~c~Aucune catégories trouvé !")
                        RageUI.Separator("")
                    else
                        for k,v in pairs(ConfigCatalogue.Categories) do
                            RageUI.Button(v.label, nil, {RightLabel = "Voir ~y~→"}, true, {
                                onActive = function()
                                Visual.Subtitle("~y~Les véhicules sont derrière vous !", 5000)
                                end,
                                onSelected = function()
                                    loadedVehicles(v.vehicles)
                                end
                            }, RMenu:Get('catalogue', 'categories-'..v.name))
                        end
                    end
                end)
                for k,v in pairs(ConfigCatalogue.Categories) do
                    RageUI.IsVisible(RMenu:Get('catalogue', 'categories-'..v.name), function()
                        if not HasAllModelsLoaded then
                            RageUI.Separator("")
                            RageUI.Separator("~y~Je vous prépare les véhicules !")
                            RageUI.Separator("")
                        else
                            local vehicles = v.vehicles
                            for k,v in pairs(vehicles) do
                                niceprice = v.price*2
                                RageUI.Button(GetLabelText(GetDisplayNameFromVehicleModel(v.name)), nil, {RightLabel = "~y~→~s~ "..ESX.Math.GroupDigits(niceprice).." ~g~$~w~"}, true, {
                                    onActive = function()
                                        if visualVeh ~= GetHashKey(v.name) then
                                            DeleteEntity(entity)
                                            local veh = CreateVehicle(GetHashKey(v.name), ConfigCatalogue.Positions.Visual["pos"], ConfigCatalogue.Positions.Visual["heading"], 0, 0)
                                            SetVehicleNumberPlateText(veh, "CONCESS")
                                            SetVehicleDoorsLockedForAllPlayers(veh, true)
                                            entity = veh
                                            FreezeEntityPosition(veh, true)
                                            visualVeh = GetEntityModel(veh)
                                            lastName = v.name
                                        end
                                    end,
                                })
                            end
                        end
                    end)
                end
            end
        end)
    end
end