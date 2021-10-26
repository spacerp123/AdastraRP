Config = {}
Config.Locale = 'fr'

Config.DrawDistance = 25.0
Config.MarkerSize = vector3(2.0, 2.0, 1.5)
Config.MarkerColor = {r = 0, g = 255, b = 0, a = 255}
Config.MarkerType = 29

Config.Licenses = {
	['weapon'] = {price = 150000}
}

Config.Categories = {
	{
		label = 'Armes blanches',
		license = 'weapon',
		weapons = {
			{name = "weapon_knife", price = 6750, label = "Couteau"},
			{name = "weapon_bat", price = 10000, label = "Batte de baseball"},
			{name = "weapon_knuckle", price = 6000, label = "Poing americain"},
			{name = "weapon_hatchet", price = 6000, label = "Hachette"},
			{name = "weapon_switchblade", price = 7250, label = "Couteau à cran d'arrêt"},
			{name = "weapon_flashlight", price = 7250, label = "Lampe torche"},
			{name = "weapon_machete", price = 9750, label = "Machette"},
			{name = "weapon_dagger", price = 9750, label = "Poignard"}
		}
	},
	{
		label = 'Armes légères',
		license = 'weapon',
		weapons = {
			{name = "weapon_snspistol", price = 125000, label = "Pétoire"},
			{name = "weapon_heavypistol", price = 250000, label = "Pistolet lourd"},
			{name = "weapon_pistol50", price = 200000, label = "Pistolet Cal.50"},
			{name = "weapon_pistol", price = 150000, label = "Pistolet"}
		}
	}
}

Config.Coords = {
	vector3(-662.180, -934.961, 21.829),
	vector3(810.25, -2157.60, 29.52),
	vector3(1693.44, 3760.16, 34.71),
	vector3(-330.24, 6083.88, 31.45),
	vector3(252.63, -50.00, 69.94),
	vector3(22.09, -1107.28, 29.80),
	vector3(2567.69, 294.38, 108.73),
	vector3(-1117.58, 2698.61, 18.55),
	vector3(842.44, -1033.42, 28.19),
	vector3(-1306.239, -394.018, 34.695)
}