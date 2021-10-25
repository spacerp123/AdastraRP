TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

local Codes = {
    types = {
        [1] = "~g~Information de l'agent",
        [2] = "~o~Statut de l'intervention",
        [3] = "~r~Demande de renforts",
    },

    codes = {
        [1] = "10-4: Affirmatif!",
        [2] = "10-5: Négatif!",
        [3] = "10-6: Pause de service",
        [4] = "10-8: Prise de service",
        [5] = "10-10: Fin de service",
        [6] = "10-19: Retour au poste",

        [7] = "10-13: Officier blessé!",
        [8] = "10-14: Prise d'otage",
        [9] = "10-31: Course poursuite",
        [10] = "10-32: Individu armé",

        [11] = "~r~URGENCE~s~: ~g~Légère~n~",
        [12] = "~r~URGENCE~s~: ~o~Moyenne~n~",
        [13] = "~r~URGENCE~s~: ~r~Maximale~n~~s~> ~r~Toutes les unités doivent se rendre sur les lieux"
    },

}


RegisterServerEvent('::{ayzwen}::renfort')
AddEventHandler('::{ayzwen}::renfort', function(coords, raison)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('::{ayzwen}::renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)

RegisterNetEvent("::{ayzwen}::pz_core:police:code")
AddEventHandler("::{ayzwen}::pz_core:police:code", function(index,type,mugshot, mugshotStr, loc, id)
	local _src = source
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' then
			TriggerClientEvent("::{ayzwen}::pz_core:police:code", xPlayers[i], type, index, Codes.types[type], Codes.codes[index],mugshot, mugshotStr, GetPlayerName(_src),  loc, id)
		end
	end
end)



TriggerEvent('::{ayzwen}::esx_phone:registerNumber', 'police', _U('alert_police'), true, true)
TriggerEvent('::{ayzwen}::esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent('::{ayzwen}::esx_policejob:drag')
AddEventHandler('::{ayzwen}::esx_policejob:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{ayzwen}::esx_policejob:drag', target, xPlayer.source)
		end
	else
		print(('esx_policejob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::police:PriseEtFinservice')
AddEventHandler('::{ayzwen}::police:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('police:InfoService', xPlayers[i], _raison, name)
		end
	end
end)


RegisterServerEvent('::{ayzwen}::esx_policejob:putInVehicle')
AddEventHandler('::{ayzwen}::esx_policejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{ayzwen}::esx_policejob:putInVehicle', target)
		end
	else
		print(('esx_policejob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_policejob:OutVehicle')
AddEventHandler('::{ayzwen}::esx_policejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{ayzwen}::esx_policejob:OutVehicle', target)
		end
	else
		print(('esx_policejob: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_policejob:getStockItem')
AddEventHandler('::{ayzwen}::esx_policejob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_withdrawn', count, inventoryItem.label))
				sendToDiscord('DestinyLife - LOGS', '[POLICE-BITE] ' ..xPlayer.getName().. ' Vient de prendre | NOM : ' ..itemName.. ' NOMBRE : ' ..count.. '', 3145658)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
			end
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getStockItems', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('::{ayzwen}::esx_policejob:putStockItems')
AddEventHandler('::{ayzwen}::esx_policejob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_deposited', count, ESX.GetItem(itemName).label))
			sendToDiscord('DestinyLife - LOGS', '[POLICE-BITE] ' ..xPlayer.getName().. ' Vient de déposer | NOM : ' ..itemName.. ' NOMBRE : ' ..count.. '', 3145658)
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {
			name = GetPlayerName(target),
			job = xPlayer.job,
			job2 = xPlayer.job2,
			inventory = xPlayer.inventory,
			accounts = xPlayer.accounts,
			weapons = xPlayer.loadout,
			firstname = result[1]['firstname'],
			lastname = result[1]['lastname'],
			sex = result[1]['sex'],
			dob = result[1]['dateofbirth'],
			height = result[1]['height']
		}
	
		TriggerEvent('::{ayzwen}::esx_license:getLicenses', target, function(licenses)
			if licenses ~= nil then
				data.licenses = licenses
			end
		end)
	
		cb(data)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getVehicleInfos', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
		['@plate'] = plate
	}, function(result)
		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)
				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then
			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
				['@identifier'] = result[1].owner
			}, function(result2)
				if Config.EnableESXIdentity then
					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
				else
					cb(result2[1].name, true)
				end
			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
		sendToDiscord('DestinyLife - LOGS', '[POLICE-BITE] ' ..xPlayer.getName().. ' Vient de déposer une arme | NOM : ' ..weaponName.. '', 3145658)
	end

	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)
	sendToDiscord('DestinyLife - LOGS', '[POLICE-BITE] ' ..xPlayer.getName().. ' Vient de prendre une arme | NOM : ' ..weaponName.. '', 3145658)

	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i = 1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_policejob:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]

	for i = 1, #authorizedWeapons, 1 do
		if authorizedWeapons[i].weapon == weaponName then
			selectedWeapon = authorizedWeapons[i]
			break
		end
	end

	if not selectedWeapon then
		print(('esx_policejob: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		if type == 1 then
			if xPlayer.getAccount('cash').money >= selectedWeapon.price then
				xPlayer.removeAccountMoney('cash', selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)
				sendToDiscord('DestinyLife - LOGS', '[POLICE-BITE] ' ..xPlayer.getName().. ' Vient de buy une arme | NOM : ' ..weaponName.. '', 3145658)

				cb(true)
			else
				cb(false)
			end
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)
			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getAccount('cash').money >= price then
					xPlayer.removeAccountMoney('cash', price)
					xPlayer.addWeaponComponent(weaponName, component.name)
					sendToDiscord('DestinyLife - LOGS', '[POLICE-BITE] ' ..xPlayer.getName().. ' Vient de custom sur l\'arme | NOM : ' ..weaponName.. ' et à pris l\'objet ' ..component.name.. '', 3145658)

					cb(true)
				else
					cb(false)
				end
			else
				print(('esx_policejob: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('::{ayzwen}::esx_phone:removeNumber', 'police')
	end
end)

-- ALERTE LSPD


RegisterServerEvent('::{ayzwen}::TireEntenduServeur')
AddEventHandler('::{ayzwen}::TireEntenduServeur', function(gx, gy, gz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('TireEntendu', xPlayers[i], gx, gy, gz)
		end
	end
end)


RegisterServerEvent('::{ayzwen}::esx_policejob:message')
AddEventHandler('::{ayzwen}::esx_policejob:message', function(target, msg)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'police' then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', target, msg)
	end
end)

function sendToDiscord (name,message,color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local Discordwebhookkkkkk = ""
	-- Modify here your webhookkkkkk username = name, content = message,embeds = embeds	

local embeds = {
	{
		["title"]=message,
		["type"]="rich",
		["color"] =color,
		["footer"]=  {
			["text"]= "Heure: " ..date_local.. "",
		},
	}
}

	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(Discordwebhookkkkkk, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end 