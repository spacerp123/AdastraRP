ESX = nil
local PlayerData = {}

RegisterNetEvent("RedMenu:Notification")
AddEventHandler("RedMenu:Notification", function(message)
    ESX.ShowNotification("~h~⭐ Boutique : " .. message)
end)

RegisterNetEvent('::{ayzwen}::esx:playerLoaded')
AddEventHandler('::{ayzwen}::esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
        ESX.TriggerServerCallback('RedMenu:GetPoint', function(thepoint)
            point = tonumber(thepoint)
        end)

        ESX.TriggerServerCallback('RedMenu:GetCodeBoutique', function(thecode)
            code = thecode
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        ESX.TriggerServerCallback('RedMenu:GetPoint', function(thepoint)
            point = tonumber(thepoint)
        end)

        ESX.TriggerServerCallback('RedMenu:GetCodeBoutique', function(thecode)
            code = thecode
        end)
    end    
end)

function GetActuallyParticul(assetName)
    RequestNamedPtfxAsset(assetName)
    if not (HasNamedPtfxAssetLoaded(assetName)) then
        while not HasNamedPtfxAssetLoaded(assetName) do
            Citizen.Wait(1.0)
        end
        return assetName;
    else
        return assetName;
    end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

RMenu.Add('MenuTrinity', 'home', RageUI.CreateMenu("Boutique", "Achetez des objets"))
RMenu:Get("MenuTrinity", "home").Closed = function()end

RMenu.Add('MenuTrinity', 'roux', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Roux"))
RMenu:Get("MenuTrinity", "roux").Closed = function()end

RMenu.Add('MenuTrinity', 'menuarme', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Armes"))
RMenu:Get("MenuTrinity", "menuarme").Closed = function()end

RMenu.Add('MenuTrinity', 'menueautre', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Objets"))
RMenu:Get("MenuTrinity", "menueautre").Closed = function()end

--[[RMenu.Add('MenuTrinity', 'menuroue', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Roue de la Fortune"))
RMenu:Get("MenuTrinity", "menuroue").Closed = function()end]]

RMenu.Add('MenuTrinity', 'menuarmee', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Armes"))
RMenu:Get("MenuTrinity", "menuarmee").Closed = function()end

RMenu.Add('MenuTrinity', 'caisses', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Caisses"))
RMenu:Get("MenuTrinity", "caisses").Closed = function()end

RMenu.Add('MenuTrinity', 'opencaisse', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Caisses"))
RMenu:Get("MenuTrinity", "opencaisse").Closed = function()end

RMenu.Add('MenuTrinity', 'menuhistory', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Historique"))
RMenu:Get("MenuTrinity", "menuhistory").Closed = function()end

RMenu.Add('MenuTrinity', 'menuvehicule', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Véhicules"))
RMenu:Get("MenuTrinity", "menuvehicule").Closed = function()end

--[[RMenu.Add('MenuTrinity', 'roulette', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Roulette"))
RMenu:Get("MenuTrinity", "roulette").Closed = function()end]]

RMenu.Add('MenuTrinity', 'menuother', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Argent"))
RMenu:Get("MenuTrinity", "menuother").Closed = function()end

RMenu.Add('MenuTrinity', 'menupack', RageUI.CreateSubMenu(RMenu:Get('MenuTrinity', 'home'), "Boutique", "Pack"))
RMenu:Get("MenuTrinity", "menupack").Closed = function()end

local mdrrr = 100
local array = {
    "Rouge",
    "Vert",
    "Noir"
}

local euh = false

local color = nil

local arrayIndex = 1
local wtfMDR = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if euh == true then
            Citizen.Wait(12650)
            euh = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
        RageUI.IsVisible(RMenu:Get('MenuTrinity', 'opencaisse'), true, true, true, function()
            RageUI.ButtonWithStyle("Boite ~r~Adastra", "", {RightLabel = '1500', RightBadge = RageUI.BadgeStyle.Coins}, true, function(h,a,s)
                if s then
                    RageUI.CloseAll()
                    if not HasStreamedTextureDictLoaded("case") then
                        RequestStreamedTextureDict("case", true)
                    end
                    TriggerServerEvent('tebex:on-process-checkout-case')
                end
            end)
        end, function()
            RageUI.CaissePreview('global')
        end)
        RageUI.IsVisible(RMenu:Get('MenuTrinity', 'home'), true, true, true, function()
            RageUI.ButtonWithStyle("~r~AdaCoins", nil, {RightLabel = point}, true,function(h,a,s)
            end)
            RageUI.ButtonWithStyle("~y~Code boutique", nil, {RightLabel = code}, true,function(h,a,s)
            end)
            RageUI.ButtonWithStyle("~g~Historique", nil, {}, true,function(h,a,s)
                if h then
                end
            end, RMenu:Get("MenuTrinity","menuhistory"))
            RageUI.Separator("~b~Catalogue")
            RageUI.ButtonWithStyle("~o~Armes", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MenuTrinity","menuarme"))
            RageUI.ButtonWithStyle("~p~Véhicules", nil, {RightLabel = "~y~Exclusivité"}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MenuTrinity","menuvehicule"))
            RageUI.ButtonWithStyle("~r~Objets", nil, {RightLabel = "~y~Nouveauté"}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MenuTrinity","menueautre"))
            --[[RageUI.ButtonWithStyle("Roue de la Fortune", nil, {RightLabel = "~y~Nouveauté"}, true,function(h,a,s)
                if s then
                end]]
            --end, RMenu:Get("MenuTrinity","menuroue"))
           --RageUI.ButtonWithStyle("Caisse", nil, {RightLabel = "~y~Nouveauté"}, true,function(h,a,s)
           --    if s then
           --    end
           --end, RMenu:Get("MenuTrinity","opencaisse"))
            RageUI.ButtonWithStyle("~g~Argent", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MenuTrinity","menuother"))
            RageUI.ButtonWithStyle("~b~Pack", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MenuTrinity","menupack"))
            --[[RageUI.ButtonWithStyle("Roulette", nil, {}, true,function(h,a,s)
                if s then
                end
            end, RMenu:Get("MenuTrinity","roulette"))]]
        end)

        RageUI.IsVisible(RMenu:Get("MenuTrinity","info"),true,true,true,function()
            RenderInfoMenu()
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MenuTrinity","menuhistory"),true,true,true,function()
            RenderInfoMenu()
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MenuTrinity","menuarme"),true,true,true,function()
            RenderArmeMenu()
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MenuTrinity","menueautre"),true,true,true,function()
            Other()
        end, function()end, 1)

        --[[RageUI.IsVisible(RMenu:Get("MenuTrinity","menuroue"),true,true,true,function()
            Roue()
        end, function()end, 1)]]
        
        RageUI.IsVisible(RMenu:Get("MenuTrinity","menupack"),true,true,true,function()
            RenderPackMenu()
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MenuTrinity","menuarmee"),true,true,true,function()
            while true do
                Citizen.Wait(1000)
            end
        end, function()end, 1)

        RageUI.IsVisible(RMenu:Get("MenuTrinity","menuvehicule"),true,true,true,function()
            RenderVehiculeMenu()
        end, function()end, 1)
        
        RageUI.IsVisible(RMenu:Get("MenuTrinity","menuother"),true,true,true,function()
            RenderUtilsMenu()
        end, function()end, 1)
    end
end)

RageUI.IsVisible(RMenu:Get("MenuTrinity","wow"),true,true,true,function()
    RenderUtilsMenu()
end)

RageUI.IsVisible(RMenu:Get("MenuTrinity","roux"),true,true,true,function()
    RenderUtilsMenu()
end)

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)
        if IsControlJustPressed(1,288) then
            RageUI.Visible(RMenu:Get('MenuTrinity', 'home'), not RageUI.Visible(RMenu:Get('MenuTrinity', 'home'))) 
        end
    end
end)

function RenderPackMenu()
    RageUI.Separator("~r~Pack Gang/Organisation")
    RageUI.Separator("Prix : 5000 ~r~Ada~w~Coins")
    RageUI.Separator("Contenance :")
    RageUI.Separator("~b~QG de Gang, Garage de Gang")
    RageUI.Separator("5 Pistolet")
    RageUI.Separator("")
    RageUI.Separator("~y~Ticket dans #boutique sur Discord")
    RageUI.Separator("ou")
    RageUI.Separator("Site : ~r~https://adastrarp.tebex.io/")
end

function RenderArmeMenu()
    RageUI.ButtonWithStyle("Pistolet Calibre 50", nil, { RightLabel = "500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "cal")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Double Action Revolver [PERM]", nil, { RightLabel = "3000 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "doubleaction")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Marksman Pistol [PERM]", nil, { RightLabel = "3000 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "marksmanpistol")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Heavy Revolver [PERM]", nil, { RightLabel = "3500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "heavyrevolver")            
        end
    end)

    RageUI.ButtonWithStyle("Mini Uzi", nil, { RightLabel = "1000 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("uzi")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "uzi")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Mitrailleuse Gusenberg [PERM]", nil, { RightLabel = "5000 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("gusen")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "gusen")            
        end
    end)

    RageUI.ButtonWithStyle("~y~AK Compact [PERM]", nil, { RightLabel = "4500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("ak")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "compactrifle")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Fusil Avancé [PERM]", nil, { RightLabel = "4500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("fa")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "fa")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Carabine Spéciale [PERM]", nil, { RightLabel = "5000 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cs")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "cs")            
        end
    end)

    RageUI.ButtonWithStyle("~y~Heavy Sniper [PERM]", nil, { RightLabel = "8000 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "heavysniper")            
        end
    end)

end

function RenderInfoMenu()
    RageUI.Separator("~r~Pas fonctionnel pour l'instant")
end

function Roue()
    RageUI.ButtonWithStyle("x1 Ticket", nil, { RightLabel = "500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if s then
            TriggerServerEvent('roue:buyTicket', 1)           
        end
    end)
    RageUI.ButtonWithStyle("x5 Ticket", nil, { RightLabel = "2350 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if s then
            TriggerServerEvent('roue:buyTicket', 5)     
        end
    end)
    RageUI.ButtonWithStyle("x10 Ticket", nil, { RightLabel = "4500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if s then
            TriggerServerEvent('roue:buyTicket', 10)     
        end
    end)
end

function Other()
    RageUI.ButtonWithStyle("x5 ~b~Gilet par balle", nil, { RightLabel = "500", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "gpb")            
        end
    end)
    RageUI.ButtonWithStyle("x10 ~b~Gilet par balle", nil, { RightLabel = "600", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "gpb10")            
        end
    end)
    RageUI.ButtonWithStyle("x5 ~b~Menottes + Clefs", nil, { RightLabel = "500 ", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("cal")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "menottes")            
        end
    end)
end

function RenderUtilsMenu()
    RageUI.ButtonWithStyle("~g~1 000 000 $", nil, { RightLabel = "1200", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("ak")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "1M")            
        end
    end)
    RageUI.ButtonWithStyle("~g~2 000 000 $", nil, { RightLabel = "1800", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("ak")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "2M")            
        end
    end)

    RageUI.ButtonWithStyle("~g~5 000 000 $", nil, { RightLabel = "3600", RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
        if a then
            --RageUI.WeaponPreview("ak")
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                end
            end, "5M")            
        end
    end)
end

local NumberCharset = {}
local Charset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
    local generatedPlate
    local doBreak = false

    while true do
        Citizen.Wait(2)
        math.randomseed(GetGameTimer())
        generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))

        ESX.TriggerServerCallback('::{ayzwen}::esx_vehicleshop:isPlateTaken', function (isPlateTaken)
            if not isPlateTaken then
                doBreak = true
            end
        end, generatedPlate)

        if doBreak then
            break
        end
    end

    return generatedPlate
end


function IsPlateTaken(plate)
    local callback = 'waiting'

    ESX.TriggerServerCallback('::{ayzwen}::esx_vehicleshop:isPlateTaken', function(isPlateTaken)
        callback = isPlateTaken
    end, plate)

    while type(callback) == 'string' do
        Citizen.Wait(0)
    end

    return callback
end

function GetRandomNumber(length)
    Citizen.Wait(1)
    math.randomseed(GetGameTimer())

    if length > 0 then
        return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else
        return ''
    end
end

function GetRandomLetter(length)
    Citizen.Wait(1)
    math.randomseed(GetGameTimer())

    if length > 0 then
        return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    else
        return ''
    end
end

function getVehicleType(model)
    return 'car'
end

function RenderVehiculeMenu()
    for k,v in pairs(Config.Vehicles) do
        RageUI.ButtonWithStyle(v.label, nil, { RightLabel =  v.price , RightBadge = RageUI.BadgeStyle.Coins }, true,function(h,a,s)
            if a then
                RageUI.VehiclePreview(v.name)
            end

            if s then
                ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                    if callback then
                    local pos = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.Game.SpawnVehicle(v.name, vector3(pos.x, pos.y, pos.z), nil, function(vehicle)
                        TaskWarpPedIntoVehicle(GetPlayerPed(PlayerId()), vehicle, -1)
                        local newPlate = GeneratePlate()
                        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                        vehicleProps.plate = newPlate
                        SetVehicleNumberPlateText(vehicle, newPlate)
                        TriggerServerEvent('::{ayzwen}::esx_vehicleshop:setVehicleOwned', vehicleProps, getVehicleType(vehicleProps.model))
                    end)
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~g~Merci de votre achat!")
                    else
                        ESX.ShowNotification("~r~Vous n'avez pas assez de Coins pour acheter ceci.")
                    end

                end, v.name)
            end
        end)
    end
end