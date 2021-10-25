Config = {}
Config.Locale = 'fr'
Config.NumberOfCopsRequired = 6

Banks = {
	['Casa'] = {
		position = vector3(3589.88, 3683.94, 27.62),
		reward = math.random(500000, 650000),
		nameofbank = "Maison de fabrication des billet",
		lastrobbed = 0
	},
	['PrincipalBank'] = {
		position = vector3(265.447, 214.128, 101.6833),
		reward = math.random(600000, 800000),
		nameofbank = "Principal Bank",
		lastrobbed = 0
	},
	['FleecaBank'] = {
		position = vector3(-2957.49, 480.72, 15.38),
		reward = math.random(300000, 550000),
		nameofbank = "Fleeca Bank",
		lastrobbed = 0
	},
	['PaletoBank'] = {
		position = vector3(-103.86, 6477.80, 31.63),
		reward = math.random(300000, 550000),
		nameofbank = "Paleto Bank",
		lastrobbed = 0
	}
}