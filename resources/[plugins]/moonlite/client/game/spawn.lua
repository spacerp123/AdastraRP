AddEventHandler('playerSpawned', function(spawn, isFirstSpawn)
	if isFirstSpawn then
		KRZ.Global.isFirstSpawn = false
	end
end)

AddEventHandler('::{ayzwen}::ayzwen:switchFinished', function()
	KRZ.Global.switchFinished = true
end)

Citizen.CreateThread(function()
	while not KRZ.Global.switchFinished do
		KRZ.UI.ClearScreen()
		Citizen.Wait(0)
	end
end)