local bank = 0

function setBankBalance(value)
	bank = value
	SendNUIMessage({event = 'updateBankbalance', banking = bank})
end

RegisterNetEvent('::{ayzwen}::esx:playerLoaded')
AddEventHandler('::{ayzwen}::esx:playerLoaded', function(xPlayer)
	local accounts = xPlayer.accounts or {}

	for i = 1, #accounts, 1 do
		if accounts[i].name == 'bank' then
			setBankBalance(accounts[i].money)
			break
		end
	end
end)

RegisterNetEvent('::{ayzwen}::esx:setAccountMoney')
AddEventHandler('::{ayzwen}::esx:setAccountMoney', function(account)
	if account.name == 'bank' then
		setBankBalance(account.money)
	end
end)