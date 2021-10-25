TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

local StationsPrice = {}

RegisterServerEvent('::{ayzwen}::essence:setToAllPlayerEscense')
AddEventHandler('::{ayzwen}::essence:setToAllPlayerEscense', function(essence, plate)
	TriggerEvent("ratelimit", source, "::{ayzwen}::essence:setToAllPlayerEscense")
	TriggerClientEvent('::{ayzwen}::essence:setEssence', -1, essence, plate)
end)

RegisterServerEvent('::{ayzwen}::essence:buy')
AddEventHandler('::{ayzwen}::essence:buy', function(amount, index, e)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = StationsPrice[index]

	if e then
		price = index
	end
	
	local toPay = ESX.Math.Round(amount * price)

	if toPay > xPlayer.getAccount('cash').money then
		TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', 'Action Impossible', 'Vous n\'avez pas assez d\'argent', 'CHAR_BLOCKED', 2)
	else
		xPlayer.removeAccountMoney('cash', toPay)
		TriggerClientEvent('::{ayzwen}::essence:hasBuying', _source, amount)
		TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', 'Station Service', 'Vous avez payé ~g~$' .. toPay .. '~s~ pour ~b~' .. ESX.Math.Round(amount) .. ' litres d\'essence', 'CHAR_BLANK_ENTRY', 9)
	end
end)

RegisterServerEvent('::{ayzwen}::essence:buyCan')
AddEventHandler('::{ayzwen}::essence:buyCan', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local toPay = petrolCanPrice

	if toPay > xPlayer.getAccount('cash').money then
		TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', 'Action Impossible', 'Vous n\'avez pas assez d\'argent', 'CHAR_BLOCKED', 2)
	else
		xPlayer.removeAccountMoney('cash', toPay)
		xPlayer.addWeapon('WEAPON_PETROLCAN', 250)
		TriggerClientEvent('::{ayzwen}::esx:showAdvancedNotification', _source, 'Adastra', 'Station Service', 'Vous avez payé ~g~$' .. toPay .. '~s~ un ~b~bidon d\'essence', 'CHAR_BLANK_ENTRY', 9)
	end
end)

function round(num, dec)
	local mult = 10 ^ (dec or 0)
	return math.floor(num * mult + 0.5)/mult
end

function renderPrice()
	for i = 0, 34 do
		StationsPrice[i] = round((math.random(110, 165) / 100), 1)
	end
end

renderPrice()