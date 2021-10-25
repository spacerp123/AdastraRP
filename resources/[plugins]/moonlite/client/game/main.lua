AddEventHandler('ayzwen:init', function()
	Citizen.CreateThread(function()
		while true do
			local Player = LocalPlayer()

			DisablePlayerVehicleRewards(Player.ID)
			SetPlayerHealthRechargeMultiplier(Player.ID, 0.0)
			SetRunSprintMultiplierForPlayer(Player.ID, 1.0)
			SetSwimMultiplierForPlayer(Player.ID, 1.0)

			if Player.IsDriver then
				SetPlayerCanDoDriveBy(Player.ID, false)
			else
				SetPlayerCanDoDriveBy(Player.ID, true)
			end

			if GetPlayerWantedLevel(Player.ID) ~= 0 then
				ClearPlayerWantedLevel(Player.ID)
			end

			Citizen.Wait(0)
		end
	end)

	Citizen.CreateThread(function()
		while true do
			local Player = LocalPlayer()

			AddTextEntry('FE_THDR_GTAO', ('[~r~FR~w~] ~y~Adastra~w~ | ~b~%s~w~ [~b~%s~w~] | discord.gg/Adastra'):format(Player.Name, Player.ServerID))

			SetDiscordAppId(895737594753724426)
			SetDiscordRichPresenceAsset('adastra')
			--SetDiscordRichPresenceAssetText("")
			SetDiscordRichPresenceAssetSmall('discord')
			SetDiscordRichPresenceAssetSmallText('discord.gg/adastrarp')
			SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/adastrarp")
			SetDiscordRichPresenceAction(1, "Se connecter", "fivem://cfx.re/join/")
			SetRichPresence(("%s [%s]"):format(Player.Name, Player.ServerID))

			Citizen.Wait(30000)
		end
	end)
end)