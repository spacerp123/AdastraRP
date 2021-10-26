TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

local ShopItems = {}

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(data)
		for i = 1, #data, 1 do
			if data[i].name then
				if data[i].limit == -1 then
					data[i].limit = 50
				end

				table.insert(ShopItems, {
					label = data[i].label,
					value = data[i].item,
					price = data[i].price,
					limit = data[i].limit
				})
			else
				print(('::{ayzwen}::esx_shops: invalid item "%s" found!'):format(data[i].item))
			end
		end
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_shops:requestDBItems', function(source, cb)
	cb(ShopItems)
end)

ESX.RegisterServerCallback('::{ayzwen}::esx_shops:canRob', function(source, cb, store)
	local xPlayers = ESX.GetPlayers()
	local cops = 0

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer and (xPlayer.job.name == 'police' or xPlayer.job.name == 'swat') then
			cops = cops + 1
		end
	end

	if cops >= Config.Zones[store].cops then
		if not Config.Zones[store].robbed then
			cb(true, true)
		else
			cb(true, false)
		end
	else
		cb(false)
	end
end)

RegisterServerEvent('::{ayzwen}::esx_shops:buyItem')
AddEventHandler('::{ayzwen}::esx_shops:buyItem', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	amount = ESX.Math.Round(amount)

	if amount < 0 then
		print('esx_shops: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
		return
	end

	local price = 0
	local itemLabel = ''

	for i = 1, #ShopItems, 1 do
		if ShopItems[i].value == itemName then
			price = ShopItems[i].price
			itemLabel = ShopItems[i].label
			break
		end
	end

	price = price * amount

	if xPlayer.getAccount('cash').money >= price then
		if xPlayer.canCarryItem(itemName, amount) then
			xPlayer.removeAccountMoney('cash', price)
			--Config.Zones[zone].reward = Config.Zones[zone].reward + price
			xPlayer.addInventoryItem(itemName, amount)
			TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('bought', amount, itemLabel, ESX.Math.GroupDigits(price)))
			sendToDiscord('Adastra - LOGS', '[SHOPS] ' ..xPlayer.getName().. ' Vient d\'acheter un ITEM | NOM : ' ..itemLabel..' au prix de : ' ..price.. '$', 3145658)
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('player_cannot_hold'))
		end
	else
		TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, _U('not_enough', ESX.Math.GroupDigits(price - xPlayer.getAccount('cash').money)))
	end
end)

RegisterServerEvent('::{ayzwen}::esx_shops:pickUp')
AddEventHandler('::{ayzwen}::esx_shops:pickUp', function(store)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.Zones[store].robbed then
		local reward = math.random(Config.Zones[store].reward[1], Config.Zones[store].reward[2]) --Config.Zones[store].reward

		--Config.Zones[store].reward = 0
		xPlayer.addAccountMoney('dirtycash', reward)

		TriggerClientEvent('esx:showNotification', source, _U('robbery_complete', reward))
		TriggerClientEvent('esx_shops:removePickup', -1, store)
	end
end)

RegisterServerEvent('::{ayzwen}::esx_shops:policeNotif')
AddEventHandler('::{ayzwen}::esx_shops:policeNotif', function(store, coords)
	local _source = source
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer.job.name == 'police' or xPlayer.job.name == 'swat' then
			TriggerClientEvent('::{ayzwen}::esx_shops:msgPolice', xPlayer.source, store, coords)
		end
	end
end)

RegisterServerEvent('::{ayzwen}::esx_shops:rob')
AddEventHandler('::{ayzwen}::esx_shops:rob', function(store)
	local _source = source
	Config.Zones[store].robbed = true
	local xPlayers = ESX.GetPlayers()

	TriggerClientEvent('::{ayzwen}::esx_shops:rob', -1, store)
	Citizen.Wait(12000)
	TriggerClientEvent('::{ayzwen}::esx_shops:robberyOver', _source)

	Citizen.SetTimeout(Config.Zones[store].cooldown * 1000, function()
		Config.Zones[store].robbed = false
		TriggerClientEvent('::{ayzwen}::esx_shops:resetStore', -1, store)
		TriggerClientEvent('::{ayzwen}::esx_shops:removePickup', -1, store)
	end)
end)

function sendToDiscord (name,message,color)
    date_local1 = os.date('%H:%M:%S', os.time())
    local date_local = date_local1
    local DiscordWebHook = "https://discord.comm/api/webhooks/848145628420374598/Ss5ekUyQ77tNIbofIAbD2P_N8PQjzJYYFwK14f4Wi05q9GnlUMv5W3Iu20LMEdN_JzEx"
  
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