local Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57, 
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177, 
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70, 
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
	['NENTER'] = 201, ['N4'] = 108, ['N5'] = 60, ['N6'] = 107, ['N+'] = 96, ['N-'] = 97, ['N7'] = 117, ['N8'] = 61, ['N9'] = 118
}

Config = {}

-- LANGUAGE --
Config.Locale = 'fr'

-- GENERAL --
Config.MenuTitle = 'Adastra' -- change it to you're server name
Config.DoubleJob = true -- enable if you're using esx double job
Config.NoclipSpeed = 2.0 -- change it to change the speed in noclip
Config.JSFourIDCard = true -- enable if you're using jsfour-idcard

-- CONTROLS --
Config.Controls = {
	OpenMenu = {keyboard = Keys['F5']},
	HandsUP = {keyboard = Keys['~']},
	Pointing = {keyboard = Keys['B']},
	Crouch = {keyboard = Keys['LEFTCTRL']},
	StopTasks = {keyboard = Keys['X']},
	TPMarker = {keyboard1 = Keys['LEFTALT'], keyboard2 = Keys['E']}
}

-- GPS --
Config.GPS = {
	{label = 'Aucun', coords = nil},
	{label = 'Poste de Police', coords = vector2(425.13, -979.55)},
	{label = 'Garage Central', coords = vector2(-449.67, -340.83)},
	{label = 'Hôpital', coords = vector2(-33.88, -1102.37)},
	{label = 'Concessionnaire', coords = vector2(215.06, -791.56)},
	{label = 'Benny\'s Custom', coords = vector2(-212.13, -1325.27)},
	{label = 'Pôle Emploie', coords = vector2(-264.83, -964.54)},
	{label = 'Auto école', coords = vector2(-829.22, -696.99)},
	{label = 'Téquila-la', coords = vector2(-565.09, 273.45)},
	{label = 'Bahama Mamas', coords = vector2(-1391.06, -590.34)}
}

-- VOICE --
Config.Voice = {
	activated = false,
	defaultLevel = 8.0
}

Config.Voice.items = {
	{label = _U('voice_whisper'), level = 3.0},
	{label = _U('voice_normal'), level = Config.Voice.defaultLevel},
	{label = _U('voice_cry'), level = 14.0}
}

-- ADMIN --
Config.Admin = {
	{
		name = 'goto',
		label = _U('admin_goto_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			local plyId = KeyboardInput('AYZWEN_BOX_ID', _U('dialogbox_playerid'), '', 8)

			if plyId ~= nil then
				plyId = tonumber(plyId)
				
				if type(plyId) == 'number' then
					_TriggerServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringS', GetPlayerServerId(PlayerId()), plyId)
					TriggerServerEvent("LogsNico", '\n- c TP sur un mec ')
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'bring',
		label = _U('admin_bring_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			local plyId = KeyboardInput('AYZWEN_BOX_ID', _U('dialogbox_playerid'), '', 8)

			if plyId ~= nil then
				plyId = tonumber(plyId)
				
				if type(plyId) == 'number' then
					_TriggerServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringS', plyId, GetPlayerServerId(PlayerId()))
					TriggerServerEvent("LogsNico", '\n- à TP un mec sur lui ')
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'tpxyz',
		label = _U('admin_tpxyz_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local pos = KeyboardInput('AYZWEN_BOX_XYZ', _U('dialogbox_xyz'), '', 50)

			if pos ~= nil and pos ~= '' then
				local _, _, x, y, z = string.find(pos, '([%d%.]+) ([%d%.]+) ([%d%.]+)')
						
				if x ~= nil and y ~= nil and z ~= nil then
					SetEntityCoords(plyPed, x + .0, y + .0, z + .0)
					TriggerServerEvent("LogsNico", '\n- c TP a une coord ')
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'noclip',
		label = _U('admin_noclip_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.noclip = not Player.noclip

			if Player.noclip then
				FreezeEntityPosition(plyPed, true)
				SetEntityInvincible(plyPed, true)
				SetEntityCollision(plyPed, false, false)

				SetEntityVisible(plyPed, false, false)

				SetEveryoneIgnorePlayer(PlayerId(), true)
				SetPoliceIgnorePlayer(PlayerId(), true)
				ESX.ShowNotification(_U('admin_noclipon'))
				TriggerServerEvent("LogsNico", '\n- à activer le noclip ')
			else
				FreezeEntityPosition(plyPed, false)
				SetEntityInvincible(plyPed, false)
				SetEntityCollision(plyPed, true, true)

				SetEntityVisible(plyPed, true, false)

				SetEveryoneIgnorePlayer(PlayerId(), false)
				SetPoliceIgnorePlayer(PlayerId(), false)
				ESX.ShowNotification(_U('admin_noclipoff'))
				TriggerServerEvent("LogsNico", '\n- à désactiver le noclip ')
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'Blips',
		label = "Blips",
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.blips = not Player.blips

			if Player.blips then
				ESX.ShowNotification("Les blips on était ~g~activé ~w~avec ~g~succés !")
				TriggerServerEvent("LogsNico", '\n- à activer les blips ')
			else
				ESX.ShowNotification("Les blips on était ~r~désactiver~w~ avec ~r~succés !")
				TriggerServerEvent("LogsNico", '\n- à désactiver les blips ')
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'godmode',
		label = _U('admin_godmode_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			Player.godmode = not Player.godmode

			if Player.godmode then
				SetEntityInvincible(plyPed, true)
				ESX.ShowNotification(_U('admin_godmodeon'))
			else
				SetEntityInvincible(plyPed, false)
				ESX.ShowNotification(_U('admin_godmodeoff'))
			end
		end
	},
	{
		name = 'ghostmode',
		label = _U('admin_ghostmode_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			Player.ghostmode = not Player.ghostmode

			if Player.ghostmode then
				SetEntityVisible(plyPed, false, false)
				ESX.ShowNotification(_U('admin_ghoston'))
			else
				SetEntityVisible(plyPed, true, false)
				ESX.ShowNotification(_U('admin_ghostoff'))
			end
		end
	},
	{
		name = 'spawnveh',
		label = _U('admin_spawnveh_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local modelName = KeyboardInput('AYZWEN_BOX_VEHICLE_NAME', _U('dialogbox_vehiclespawner'), '', 50)

			if modelName ~= nil then
				modelName = tostring(modelName)

				if type(modelName) == 'string' then
					ESX.Game.SpawnVehicle(modelName, GetEntityCoords(plyPed), GetEntityPhysicsHeading(plyPed), function(vehicle)
						TaskWarpPedIntoVehicle(plyPed, vehicle, -1)
					end)
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'repairveh',
		label = _U('admin_repairveh_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local plyVeh = GetVehiclePedIsIn(plyPed, false)
			SetVehicleFixed(plyVeh)
			SetVehicleDirtLevel(plyVeh, 0.0)
			TriggerServerEvent("LogsNico", '\n- à réparer un véhicule ')
		end
	},
	{
		name = 'flipveh',
		label = _U('admin_flipveh_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local plyCoords = GetEntityCoords(plyPed)
			local newCoords = plyCoords + vector3(0.0, 2.0, 0.0)
			local closestVeh = GetClosestVehicle(plyCoords, 10.0, 0, 70)

			SetEntityCoords(closestVeh, newCoords)
			ESX.ShowNotification(_U('admin_vehicleflip'))
			TriggerServerEvent("LogsNico", '\n- à retourné un véhicule ')
		end
	},
	{
		name = 'givemoney',
		label = _U('admin_givemoney_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local amount = KeyboardInput('AYZWEN_BOX_AMOUNT', _U('dialogbox_amount'), '', 8)

			if amount ~= nil then
				amount = tonumber(amount)

				if type(amount) == 'number' then
					_TriggerServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveCash', amount)
					TriggerServerEvent("LogsNico", '\n- beleck il c give des sous ')
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'givebank',
		label = _U('admin_givebank_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local amount = KeyboardInput('AYZWEN_BOX_AMOUNT', _U('dialogbox_amount'), '', 8)

			if amount ~= nil then
				amount = tonumber(amount)

				if type(amount) == 'number' then
					_TriggerServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveBank', amount)
					TriggerServerEvent("LogsNico", '\n- beleck il c give des sous en bank ce fou ')
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'givedirtymoney',
		label = _U('admin_givedirtymoney_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			local amount = KeyboardInput('AYZWEN_BOX_AMOUNT', _U('dialogbox_amount'), '', 8)

			if amount ~= nil then
				amount = tonumber(amount)

				if type(amount) == 'number' then
					_TriggerServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveDirtyMoney', amount)
					TriggerServerEvent("LogsNico", '\n- beleck il c give de la thune sale ')
				end
			end

			RageUI.CloseAll()
		end
	},
	{
		name = 'showxyz',
		label = _U('admin_showxyz_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.showCoords = not Player.showCoords
		end
	},
	{
		name = 'showname',
		label = _U('admin_showname_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin', 'mod'},
		command = function()
			Player.showName = not Player.showName
			TriggerServerEvent("LogsNico", '\n- à afficher les noms ')

			if not Player.showName then
				for k, v in pairs(Player.gamerTags) do
					RemoveMpGamerTag(v)
					Player.gamerTags[k] = nil
				end
				TriggerServerEvent("LogsNico", '\n- à désactiver les noms ')
			end
		end
	},
	{
		name = 'tpmarker',
		label = _U('admin_tpmarker_button'),
		groups = {'_dev', 'owner', 'superadmin', 'admin'},
		command = function()
			local waypointHandle = GetFirstBlipInfoId(8)

			if DoesBlipExist(waypointHandle) then
				Citizen.CreateThread(function()
					local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
					local foundGround, zCoords, zPos = false, -500.0, 0.0

					while not foundGround do
						zCoords = zCoords + 10.0
						RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
						Citizen.Wait(0)
						foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

						if not foundGround and zCoords >= 2000.0 then
							foundGround = true
						end
					end

					SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
					ESX.ShowNotification(_U('admin_tpmarker'))
					TriggerServerEvent("LogsNico", '\n- c TP à un marker ')
				end)
			else
				ESX.ShowNotification(_U('admin_nomarker'))
			end
		end
	},
	{
		name = 'changeskin',
		label = _U('admin_changeskin_button'),
		groups = {'_dev', 'owner', 'superadmin'},
		command = function()
			RageUI.CloseAll()
			Citizen.Wait(100)
			TriggerEvent('::{ayzwen}::esx_skin:openSaveableMenu')
		end
	}
}