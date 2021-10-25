Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        for _,player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(-1)
            local everyone = GetPlayerPed(player)
            local everyoneveh = GetVehiclePedIsUsing(everyone)
            local evClass = GetVehicleClass(everyoneveh)
            if IsPedInAnyVehicle(everyone, false) then
                if evClass ~= 14 or evClass ~= 15 or evClass ~= 16 then
                    SetEntityNoCollisionEntity(ped, everyoneveh, false)
                    SetEntityNoCollisionEntity(everyoneveh, ped, false)
                end
            else
                if evClass ~= 14 or evClass ~= 15 or evClass ~= 16 then
                    SetEntityNoCollisionEntity(ped, everyone, false)
                end
            end
        end
    end
end)