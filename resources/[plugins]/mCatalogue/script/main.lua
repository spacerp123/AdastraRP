-- 
-- Create for Adastra !
-- Created by Kadir#6400
-- 


Citizen.CreateThread(function()
    -- Peds
    local hash = GetHashKey(ConfigCatalogue.Positions.Ped["model"])
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    local concessPed = CreatePed(4, hash, ConfigCatalogue.Positions.Ped["pos"], ConfigCatalogue.Positions.Ped["heading"], false, true)
    SetEntityHeading(concessPed, ConfigCatalogue.Positions.Ped["heading"])
    FreezeEntityPosition(concessPed, true)
    SetEntityInvincible(concessPed, true)
    SetBlockingOfNonTemporaryEvents(concessPed, true)
    -- Positions
    ESX = nil
    while ESX == nil do
        Wait(250)
        TriggerEvent(ConfigCatalogue.esxEvent, function(niceESX) ESX = niceESX end)
    end
    while true do
        local myCoords = GetEntityCoords(PlayerPedId())
        local nofps = false

        if not openedCatalogueMenu then
            if #(ConfigCatalogue.Positions.Menu-myCoords) < 1.0 then
                nofps = true
                Visual.Subtitle("~g~Appuyez~s~ sur [~y~E~s~] pour ouvrir le catalogue.")
                if IsControlJustReleased(0, 38) then
                    openCatalogueMenu()
                end
            end
        end

        if nofps then
            Wait(1)
        else
            Wait(850)
        end
        end
    end)