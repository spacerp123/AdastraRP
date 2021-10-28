TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('::{ayzwen}::esx_location:buy', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false

	for i = 1, #Config.Options, 1 do
		if Config.Options[i].price == price then
			priceAvailable = true
		end
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'Vous avez payez ' .. price .. '$, Bonne route !')
		sendToDiscord('Adastra - LOGS', '[LOCATION] ' ..xPlayer.getName().. '', 3145658)
		cb(true)
	else
		cb(false)
	end
end)


function sendToDiscord (name,message,color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local DiscordWebHook = "https://discord.com/api/webhooks/844676758664904745/CB500x93qFGnzncUl9o4AGnk1HmE7w5eXxe8RC9B5AB_DJoOUpttN-bMMIknqnY7kwTC"
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