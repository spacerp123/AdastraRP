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


RegisterNetEvent("::{ayzwen}::pz_core:gouvernement:code")
AddEventHandler("::{ayzwen}::pz_core:gouvernement:code", function(index,type,mugshot, mugshotStr, loc, id)
	local _src = source
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'gouvernement' then
			TriggerClientEvent("::{ayzwen}::pz_core:gouvernement:code", xPlayers[i], type, index, Codes.types[type], Codes.codes[index],mugshot, mugshotStr, GetPlayerName(_src),  loc, id)
		end
	end
end)



TriggerEvent('::{ayzwen}::esx_phone:registerNumber', 'gouvernement', _U('alert_gouvernement'), true, true)
TriggerEvent('::{ayzwen}::esx_society:registerSociety', 'gouvernement', 'Gouvernement', 'society_gouvernement', 'society_gouvernement', 'society_gouvernement', {type = 'public'})

RegisterServerEvent('::{ayzwen}::esx_gouvjob:drag')
AddEventHandler('::{ayzwen}::esx_gouvjob:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'gouvernement' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{ayzwen}::esx_gouvjob:drag', target, xPlayer.source)
		end
	else
		print(('esx_gouvjob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::gouvernement:PriseEtFinservice')
AddEventHandler('::{ayzwen}::gouvernement:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'gouvernement' then
			TriggerClientEvent('gouvernement:InfoService', xPlayers[i], _raison, name)
		end
	end
end)


RegisterServerEvent('::{ayzwen}::esx_gouvjob:putInVehicle')
AddEventHandler('::{ayzwen}::esx_gouvjob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'gouvernement' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{ayzwen}::esx_gouvjob:putInVehicle', target)
		end
	else
		print(('esx_gouvjob: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_gouvjob:OutVehicle')
AddEventHandler('::{ayzwen}::esx_gouvjob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'gouvernement' then
		local xPlayerTarget = ESX.GetPlayerFromId(target)

		if xPlayerTarget.get('cuffState').isCuffed then
			TriggerClientEvent('::{ayzwen}::esx_gouvjob:OutVehicle', target)
		end
	else
		print(('esx_gouvjob: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_gouvjob:getStockItem')
AddEventHandler('::{ayzwen}::esx_gouvjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_gouvernement', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_withdrawn', count, inventoryItem.label))
				sendToDiscord('Adastra - LOGS', '[GOUVERNEMENT] ' ..xPlayer.getName().. ' Vient de prendre | NOM : ' ..itemName.. ' NOMBRE : ' ..count.. '', 3145658)
			else
				TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
			end
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getStockItems', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_gouvernement', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('::{ayzwen}::esx_gouvjob:putStockItems')
AddEventHandler('::{ayzwen}::esx_gouvjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_gouvernement', function(inventory)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('have_deposited', count, ESX.GetItem(itemName).label))
			sendToDiscord('Adastra - LOGS', '[GOUVERNEMENT] ' ..xPlayer.getName().. ' Vient de déposer | NOM : ' ..itemName.. ' NOMBRE : ' ..count.. '', 3145658)
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getOtherPlayerData', function(source, cb, target)
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

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getVehicleInfos', function(source, cb, plate)
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

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getVehicleFromPlate', function(source, cb, plate)
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

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:getArmoryWeapons', function(source, cb)
	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_gouvernement', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
		sendToDiscord('Adastra - LOGS', '[GOUVERNEMENT] ' ..xPlayer.getName().. ' Vient de déposer une arme | NOM : ' ..weaponName.. '', 3145658)
	end

	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_gouvernement', function(store)
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

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)
	sendToDiscord('Adastra - LOGS', '[GOUVERNEMENT] ' ..xPlayer.getName().. ' Vient de prendre une arme | NOM : ' ..weaponName.. '', 3145658)

	TriggerEvent('::{ayzwen}::esx_datastore:getSharedDataStore', 'society_gouvernement', function(store)
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

ESX.RegisterServerCallback('::{ayzwen}::esx_gouvjob:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]

	for i = 1, #authorizedWeapons, 1 do
		if authorizedWeapons[i].weapon == weaponName then
			selectedWeapon = authorizedWeapons[i]
			break
		end
	end

	if not selectedWeapon then
		print(('esx_gouvjob: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		if type == 1 then
			if xPlayer.getAccount('cash').money >= selectedWeapon.price then
				xPlayer.removeAccountMoney('cash', selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)
				sendToDiscord('Adastra - LOGS', '[GOUVERNEMENT] ' ..xPlayer.getName().. ' Vient de buy une arme | NOM : ' ..weaponName.. '', 3145658)

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
					sendToDiscord('Adastra - LOGS', '[GOUVERNEMENT] ' ..xPlayer.getName().. ' Vient de custom sur l\'arme | NOM : ' ..weaponName.. ' et à pris l\'objet ' ..component.name.. '', 3145658)

					cb(true)
				else
					cb(false)
				end
			else
				print(('esx_gouvjob: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('::{ayzwen}::esx_phone:removeNumber', 'gouvernement')
	end
end)

RegisterServerEvent('::{ayzwen}::esx_gouvjob:message')
AddEventHandler('::{ayzwen}::esx_gouvjob:message', function(target, msg)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'gouvernement' then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', target, msg)
	end
end)

-- ALERTE GOUV

RegisterServerEvent('::{ayzwen}::TireEntenduServeur')
AddEventHandler('::{ayzwen}::TireEntenduServeur', function(gx, gy, gz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'gouvernement' then
			TriggerClientEvent('::{ayzwen}::TireEntendu', xPlayers[i], gx, gy, gz)
		end
	end
end)


RegisterServerEvent('::{ayzwen}::PriseAppelServeur')
AddEventHandler('::{ayzwen}::PriseAppelServeur', function(gx, gy, gz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = xPlayer.getName(source)
	local xPlayers = ESX.GetPlayers()
	local firstname = ''
	local lastname = ''

	MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #xPlayers, 1 do
			local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
			if thePlayer.job.name == 'gouvernement' then
				
				TriggerClientEvent('::{ayzwen}::PriseAppel', xPlayers[i], result[1].firstname .. ' ' .. result[1].lastname)
			end
		end
	end)	
end)

function sendToDiscord (name,message,color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local DiscordWebHook = "https://discord.comm/api/webhooks/844676977968807996/g5u5ibtp2yxF69R7ivHwrjI__4bWl7zlT-jMhOPMhJuCowihF5D5qJakWciqIDPYW69G"
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds

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
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end 