TriggerEvent('::{ayzwen}::esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('::{ayzwen}::esx_kekke_tackle:tryTackle')
AddEventHandler('::{ayzwen}::esx_kekke_tackle:tryTackle', function(target)
	local _source = source
	if target == -1 then
		DropPlayer(_source, "Votre session FiveM rencontre un problème, nous vous conseillons de le relancer afin éviter d'être expulser à nouveau.")
	TriggerClientEvent('::{ayzwen}::esx_kekke_tackle:getTackled', target, _source)
	TriggerClientEvent('::{ayzwen}::esx_kekke_tackle:playTackle', _source)
	end
end)