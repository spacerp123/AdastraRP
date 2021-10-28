Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
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

RegisterNetEvent('alah:ShowAdvancedNotification')
AddEventHandler('alah:ShowAdvancedNotification', function(msg)
    ESX.ShowAdvancedNotification(Config.ServerName, '~y~Récompense Activité', msg, "CHAR_Adastra", 7)
	local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
	if Config.Particle then
		GetActuallyParticul(Config.ParticleCategory)
    	SetPtfxAssetNextCall(Config.ParticleCategory)
		StartParticleFxNonLoopedAtCoord_2(Config.ParticleName, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 5.0, false, false, false)
	end
end)


ESX = nil
local PlayerData = {}

RegisterNetEvent('::{ayzwen}::esx:playerLoaded')
AddEventHandler('::{ayzwen}::esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)







