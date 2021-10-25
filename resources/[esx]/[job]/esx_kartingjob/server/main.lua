ESX                = nil

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('::{ayzwen}::esx_service:activateService', 'karting', Config.MaxInService)
end

TriggerEvent('::{ayzwen}::esx_society:registerSociety', 'karting', 'Karting', 'society_karting', 'society_karting', 'society_karting', {type = 'private'})

----------------------------------
---- Ajout Gestion Stock Boss ----
----------------------------------

RegisterServerEvent('::{ayzwen}::esx_karting:getStockItem')
AddEventHandler('::{ayzwen}::esx_karting:getStockItem', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_karting', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('::{ayzwen}::esx_karting:getStockItems', function(source, cb)

  TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_karting', function(inventory)
    cb(inventory.items)
  end)

end)

-------------
-- AJOUT 2 --
-------------

RegisterServerEvent('::{ayzwen}::esx_karting:putStockItems')
AddEventHandler('::{ayzwen}::esx_karting:putStockItems', function(itemName, count)

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_karting', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)

--ESX.RegisterServerCallback('::{ayzwen}::esx_karting:putStockItems', function(source, cb)

--  TriggerEvent('::{ayzwen}::esx_addoninventory:getSharedInventory', 'society_policestock', function(inventory)
--    cb(inventory.items)
--  end)

--end)

ESX.RegisterServerCallback('::{ayzwen}::esx_karting:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

RegisterServerEvent('::{ayzwen}::AnnounceKARTINGOuvert')
AddEventHandler('::{ayzwen}::AnnounceKARTINGOuvert', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', xPlayers[i], 'Karting', '~b~Annonce Citoyen', 'Le Karting viens est ouvert !', 'CHAR_CRIS', 8)
	end
end)

RegisterServerEvent('::{ayzwen}::AnnounceKARTINGFermez')
AddEventHandler('::{ayzwen}::AnnounceKARTINGFermez', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', xPlayers[i], 'KARTING', '~b~Annonce Citoyen', 'Le Karting viens de fermer. ', 'CHAR_CRIS', 8)
	end
end)
------------------------------------------------
-- discord shop : https://discord.gg/3wwzfmf  --
-- discord leaks : https://discord.gg/39mJqPU --
--                SP#5201                     --               
------------------------------------------------           
