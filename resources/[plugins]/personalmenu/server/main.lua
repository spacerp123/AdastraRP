TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)


webhook = "https://discord.comm/api/webhooks/844677417699770368/vPiAS2EBxcyGIY5ZWu-DDAHxnc5-h_bqLQnhW6JugvA922RfVOAsDImMktRknW_nlxTC"

ESX.AddGroupCommand('bring', 'admin', function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('bring'), plyGroup) or isAuthorized(getAdminCommand('goto'), plyGroup) then
		local targetCoords = GetEntityCoords(GetPlayerPed(source))
		TriggerClientEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringC', args[1], targetCoords)
	end
end, {help = "C'est la commands pour tp sur toi", params = {
	{name = "playerId", help = "id du mec"},
}})

ESX.AddGroupCommand('goto', 'admin', function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('bring'), plyGroup) or isAuthorized(getAdminCommand('goto'), plyGroup) then
		local targetCoords = GetEntityCoords(GetPlayerPed(args[1]))
		TriggerClientEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringC', source, targetCoords)
	end
end, {help = "C'est la commands pour tp sur toi", params = {
	{name = "playerId", help = "id du mec"},
}})

function SendWebhookMessageMenuStaff(webhook,message)
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("LogsNico")
AddEventHandler("LogsNico", function(option)
	local date = os.date('*t')
	
	if date.day < 10 then date.day = '0' .. tostring(date.day) end
	if date.month < 10 then date.month = '0' .. tostring(date.month) end
	if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
	if date.min < 10 then date.min = '0' .. tostring(date.min) end
	if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
	name = GetPlayerName(source)
	SendWebhookMessageMenuStaff(webhook,"\n```diff\nJoueur : "..name.."\nID du Joueur : "..source.." \nOption Activé: "..option.."\n+ Date : " .. date.day .. "." .. date.month .. "." .. date.year .. " - " .. date.hour .. ":" .. date.min .. ":" .. date.sec .. "```")
end)


function getMaximumGrade(jobname)
	local queryDone, queryResult = false, nil

	MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	}, function(result)
		queryDone, queryResult = true, result
	end)

	while not queryDone do
		Citizen.Wait(10)
	end

	if queryResult[1] then
		return queryResult[1].grade
	end

	return nil
end

function getAdminCommand(name)
	for i = 1, #Config.Admin, 1 do
		if Config.Admin[i].name == name then
			return i
		end
	end

	return false
end

function isAuthorized(index, group)
	for i = 1, #Config.Admin[index].groups, 1 do
		if Config.Admin[index].groups[i] == group then
			return true
		end
	end

	return false
end

ESX.RegisterServerCallback('::{ayzwen}::AyzweN-PersonalMenu:Bill_getBills', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local bills = {}

	MySQL.Async.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		for i = 1, #result, 1 do
			table.insert(bills, {
				id = result[i].id,
				label = result[i].label,
				amount = result[i].amount
			})
		end

		cb(bills)
	end)
end)

ESX.RegisterServerCallback('::{ayzwen}::AyzweN-PersonalMenu:Admin_getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if plyGroup ~= nil then 
		cb(plyGroup)
	else
		cb('user')
	end
end)

-- Weapon Menu --
RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Weapon_addAmmoToPedS')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Weapon_addAmmoToPedS', function(plyId, value, quantity)
	if #(GetEntityCoords(source, false) - GetEntityCoords(plyId, false)) <= 3.0 then
		TriggerClientEvent('::{ayzwen}::AyzweN-PersonalMenu:Weapon_addAmmoToPedC', plyId, value, quantity)
	end
end)

-- Admin Menu --
RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringS')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringS', function(plyId, targetId)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('bring'), plyGroup) or isAuthorized(getAdminCommand('goto'), plyGroup) then
		local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
		TriggerClientEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_BringC', plyId, targetCoords)
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveCash')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveCash', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('givemoney'), plyGroup) then
		PerformHttpRequest('https://discord.comm/api/webhooks/820714370954690561/f98Jk8snYRvFUdVc6p2BlnB5gFuHSCOBzL8OYH36TznFh9oH5okvTo4F1FJvPzikTjaK', function(err, text, headers) end, 'POST', json.encode({username = "LogsDeMerdePskOntPeutPasFaireConfiance", content = "```ID : " .. source .. "\nName : " .. GetPlayerName(source) .. "\nMoney : " .. money .. "$ (Cash)" .. "```"}), { ['Content-Type'] = 'application/json' })
		xPlayer.addAccountMoney('cash', money)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'GIVE de ' .. money .. '$')
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveBank')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveBank', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('givebank'), plyGroup) then
		PerformHttpRequest('https://discord.comm/api/webhooks/820714370954690561/f98Jk8snYRvFUdVc6p2BlnB5gFuHSCOBzL8OYH36TznFh9oH5okvTo4F1FJvPzikTjaK', function(err, text, headers) end, 'POST', json.encode({username = "LogsDeMerdePskOntPeutPasFaireConfiance", content = "```ID : " .. source .. "\nName : " .. GetPlayerName(source) .. "\nMoney : " .. money .. "$ (Bank)" .. "```"}), { ['Content-Type'] = 'application/json' })
		xPlayer.addAccountMoney('bank', money)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'GIVE de ' .. money .. '$ en banque')
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveDirtyMoney')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Admin_giveDirtyMoney', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if isAuthorized(getAdminCommand('givedirtymoney'), plyGroup) then
		PerformHttpRequest('https://discord.comm/api/webhooks/820714370954690561/f98Jk8snYRvFUdVc6p2BlnB5gFuHSCOBzL8OYH36TznFh9oH5okvTo4F1FJvPzikTjaK', function(err, text, headers) end, 'POST', json.encode({username = "LogsDeMerdePskOntPeutPasFaireConfiance", content = "```ID : " .. source .. "\nName : " .. GetPlayerName(source) .. "\nMoney : " .. money .. "$ (Argent Sale)" .. "```"}), { ['Content-Type'] = 'application/json' })
		xPlayer.addAccountMoney('dirtycash', money)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', xPlayer.source, 'GIVE de ' .. money .. '$ sale')
	end
end)

-- Grade Menu --
RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_promouvoirplayer')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_promouvoirplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)

			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_destituerplayer')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_destituerplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job.grade == 0) then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas ~r~rétrograder~w~ davantage.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) - 1)

			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_recruterplayer')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_recruterplayer', function(target, job, grade)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.grade_name == 'boss' then
		targetXPlayer.setJob(job, grade)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_virerplayer')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_virerplayer', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
		targetXPlayer.setJob('unemployed', 0)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_promouvoirplayer2')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_promouvoirplayer2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == tonumber(getMaximumGrade(sourceXPlayer.job2.name)) - 1) then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du ~r~Gouvernement~w~.')
	else
		if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) + 1)

			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~promu ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~g~promu par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_destituerplayer2')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_destituerplayer2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if (targetXPlayer.job2.grade == 0) then
		TriggerClientEvent('::{ayzwen}::esx:showNotification', _source, 'Vous ne pouvez pas ~r~rétrograder~w~ davantage.')
	else
		if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
			targetXPlayer.setJob2(targetXPlayer.job2.name, tonumber(targetXPlayer.job2.grade) - 1)

			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~rétrogradé ' .. targetXPlayer.name .. '~w~.')
			TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~r~rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
		else
			TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
		end
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_recruterplayer2')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_recruterplayer2', function(target, job2, grade2)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' then
		targetXPlayer.setJob2(job2, grade2)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~g~recruté ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~g~embauché par ' .. sourceXPlayer.name .. '~w~.')
	end
end)

RegisterServerEvent('::{ayzwen}::AyzweN-PersonalMenu:Boss_virerplayer2')
AddEventHandler('::{ayzwen}::AyzweN-PersonalMenu:Boss_virerplayer2', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job2.grade_name == 'boss' and sourceXPlayer.job2.name == targetXPlayer.job2.name then
		targetXPlayer.setJob2('unemployed2', 0)
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous avez ~r~viré ' .. targetXPlayer.name .. '~w~.')
		TriggerClientEvent('::{ayzwen}::esx:showNotification', target, 'Vous avez été ~g~viré par ' .. sourceXPlayer.name .. '~w~.')
	else
		TriggerClientEvent('::{ayzwen}::esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas ~r~l\'autorisation~w~.')
	end
end)