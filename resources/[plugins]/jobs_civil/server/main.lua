TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("::{ayzwen}::jobs_civil:pay")
AddEventHandler("::{ayzwen}::jobs_civil:pay", function(money, whoim, ntm2)
    local _source = source
    if whoim:len() == 10 and ntm2:len() == 17 then
    if money < 1000 then
        local xPlayer = ESX.GetPlayerFromId(_source)
        TriggerEvent("ratelimit", source, '::{ayzwen}::esx:customDiscordLog', "Joueur : " .. GetPlayerName(_source) .. " [" .. _source .. "] (" .. ESX.GetIdentifierFromId(_source) .. ") - JOBS CIVIL ARGENT : " .. money)
        xPlayer.addAccountMoney('cash', money)
    else
        TriggerEvent('::{ayzwen}::BanSql:ICheatServer', _source)
    end
else
    TriggerEvent('::{ayzwen}::BanSql:ICheatServer', _source)
end
end)

function sendToDiscord (name,message,color)
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1
	local DiscordWebHook = "https://discord.comm/api/webhooks/847986080929808424/r4OA7EkIgYLK3xr0lVKSTPjF78liEUhz5PddMARcq0noXZOnI__P2cYlyxGXdA0By2u7"
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