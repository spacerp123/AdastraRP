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

			AddTextEntry('FE_THDR_GTAO', ('~r~g2FFfWUSeF ~w~| Pseudo : ~r~%s~w~ | Votre ID : ~g~%s~w~  '):format(Player.Name, Player.ServerID))

			SetDiscordAppId(835979058382241792)
			SetDiscordRichPresenceAsset('adastra')
			--SetDiscordRichPresenceAssetText("")
			SetDiscordRichPresenceAssetSmall('')
			SetDiscordRichPresenceAssetSmallText('')
			SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/g2FFfWUSeF")
			-- SetDiscordRichPresenceAction(1, "Se connecter", "")
			SetRichPresence(("%s [%s]"):format(Player.Name, Player.ServerID))

			Citizen.Wait(30000)
		end
	end)
end)