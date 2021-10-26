-- CONFIG webhookkkkkk --
local serverstart = "https://discord.comm/api/webhooks/839577654670655529/wVZznI3D4BqDR-xwpxwIxR_58gQVmyenoZ8KlxcWuvXRbE4OEs9Pu3D8AMM6E7HgnHuo" --Logs générall
local chatserver = "https://discord.comm/api/webhooks/839578186148085780/kj8HtOdYXptF4EvoxjB5g8PHgl2F7J_ZNDIlICxhzPH9FuhxXvb_12ElwcY6gfJD1wo5" --Logs générall
local playerconnecting = "https://discord.comm/api/webhooks/839577859672637480/hu-GNZLHSDMxBx9eMVYF7aFO4LD8B2UikVGDtACjdERnsRY9TLY5MqLkE2wN20anTz7w" --Logs co
local playerdiconnect = "https://discord.comm/api/webhooks/839578090841964596/1D9KgOSt2G4IpEsXYt7-ea4E42XArWwawfKfwuK2fW3JEbVVGQP9uGaEuM2vDIKc-zMD" --Logs co
local giveitem = "https://discord.comm/api/webhooks/839578292209057823/mt12K2TmNaJPhBI3joaL5E1hSvoeHB2noXTmMMc_RHybqwKdrLISaQuNeXbryJ0UlJWb" --Logs Give
local giveargent = "https://discord.comm/api/webhooks/839578417603411968/MoaSmQt9ZzoQTz7Q4SOfR-NIYxr8c9eE2CyeOFnbpGK-aVJXQTO0akgE9nl9_a-rcGgF" --Logs Give
local givearme = "https://discord.comm/api/webhooks/839578476143050802/28zVEr_12EVf5zQUOxuBHhSOpeyKQR2Q6gTcXgnuR9msqyY5jhyJjRrlwT0rULAFcRqu" --Logs Give
local mettrecoffreentreprise = "https://discord.comm/api/webhooks/839578535797588020/BFShtrZhR0j3ssdKvmpehUvrPgl0bKmKds-OKk_iUZ-VTq-rgnOwZ7bzG8S1SaziQVKB" --Logs Confisque
local retirecoffreentreprise = "https://discord.comm/api/webhooks/839578661559730216/WAhU2IbRtToprNw_1B8G-vTdTEefWyO2-Bm1IyvHJJGZzIraSgC2qFK6R887wSepGGpC" --Logs Confisque
local blanchireargent = "" --Logs Confisque
local confisquelog = "" --Logs Confisque
local anticheat = "https://discord.comm/api/webhooks/842557772670566442/a9R-ZKpOrSt_gD__invmwBBSMxKmWT7eCrTCN9JsIpSy4uv_vsAGIdgI2FVMbt8yOMgW" --Logs AC
-- CONFIG webhookkkkkk --

TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscord(getwebhookkkkkk, name, message, color)
	if message == nil or message == '' then
		return false
	end

	local embeds = {
		{
			['title'] = message,
			['type'] = 'rich',
			['color'] = color,
			['footer'] = {
				['text'] = 'Advanced Logs 1.2'
			}
		}
	}

	PerformHttpRequest(getwebhookkkkkk, function() end, 'POST', json.encode({username = name, embeds = embeds}), {['Content-Type'] = 'application/json'})
end

sendToDiscord(serverstart, _U('server'), _U('server_start'), Config.green)

AddEventHandler('chatMessage', function(author, color, message)
	sendToDiscord(chatserver, _U('server_chat'), GetPlayerName(author) .. ' : '.. message, Config.grey)
end)

RegisterServerEvent('::{ayzwen}::esx:playerLoaded')
AddEventHandler('::{ayzwen}::esx:playerLoaded', function(source, xPlayer)
	local _source = source
	sendToDiscord(playerconnecting, _U('server_connecting'), "Joueur : " .. GetPlayerName(_source) .. " [" .. _source .. "] (" .. ESX.GetIdentifierFromId(_source) .. ") " .. _('user_connecting'), Config.grey)
end)

AddEventHandler('::{ayzwen}::esx:playerDropped', function(source, xPlayer, reason)
	local _source = source
	sendToDiscord(playerdiconnect, _U('server_disconnecting'), "Joueur : " .. GetPlayerName(_source) .. " [" .. _source .. "] (" .. ESX.GetIdentifierFromId(_source) .. ") " .. _('user_disconnecting') .. '. (' .. reason .. ')', Config.grey)
end)

RegisterServerEvent('::{ayzwen}::esx:giveitemalert')
AddEventHandler('::{ayzwen}::esx:giveitemalert', function(name, nametarget, itemName, amount)
	sendToDiscord(giveitem, _U('server_item_transfer'), name .. ' ' .. _('user_gives_to') .. ' ' .. nametarget .. ' ' .. amount .. ' ' .. ESX.GetItem(itemName).label, Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:giveaccountalert')
AddEventHandler('::{ayzwen}::esx:giveaccountalert', function(name, nametarget, accountName, amount)
	sendToDiscord(giveargent, _U('server_account_transfer', ESX.GetAccountLabel(accountName)), name .. ' ' .. _('user_gives_to') .. ' ' .. nametarget .. ' ' .. amount .. '$', Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:giveweaponalert')
AddEventHandler('::{ayzwen}::esx:giveweaponalert', function(name, nametarget, weaponName)
	sendToDiscord(givearme, _U('server_weapon_transfer'), name .. ' ' .. _('user_gives_to') .. ' ' .. nametarget .. ' ' .. ESX.GetWeaponLabel(weaponName), Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:depositsocietymoney')
AddEventHandler('::{ayzwen}::esx:depositsocietymoney', function(name, amount, societyName)
	sendToDiscord(mettrecoffreentreprise, 'Coffre Entreprise', name .. ' a déposé ' .. amount .. '$ dans le coffre de ' .. societyName, Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:withdrawsocietymoney')
AddEventHandler('::{ayzwen}::esx:withdrawsocietymoney', function(name, amount, societyName)
	sendToDiscord(retirecoffreentreprise, 'Coffre Entreprise', name .. ' a retiré ' .. amount .. '$ dans le coffre de ' .. societyName, Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:washingmoneyalert')
AddEventHandler('::{ayzwen}::esx:washingmoneyalert', function(name, amount)
	sendToDiscord(blanchireargent, _U('server_washingmoney'), name .. ' ' .. _('user_washingmoney') .. ' ' .. amount .. '$', Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:confiscateitem')
AddEventHandler('::{ayzwen}::esx:confiscateitem', function(name, nametarget, itemname, amount, job)
	sendToDiscord(confisquelog, 'Confisquer Item', name .. ' a confisqué ' .. amount .. 'x ' .. itemname .. ' à ' .. nametarget .. ' JOB: ' .. job, Config.orange)
end)

RegisterServerEvent('::{ayzwen}::esx:customDiscordLog')
AddEventHandler('::{ayzwen}::esx:customDiscordLog', function(embedContent, botName, embedColor)
	sendToDiscord(anticheat, botName or 'Report AntiCheat', embedContent or 'Message Vide', embedColor or Config.red)
end)