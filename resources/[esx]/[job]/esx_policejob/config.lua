Config = {}
Config.Locale = 'fr'

Config.DrawDistance = 10.0
Config.MarkerType = 1
Config.MarkerColor = { r = 50, g = 50, b = 204 }
Config.MarkerSize = vector3(1.5, 1.5, 1.0)

Config.EnablePlayerManagement = true
Config.EnableArmoryManagement = true
Config.EnableESXIdentity = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds = true -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses = true -- enable if you're using esx_license

Config.EnableHandcuffTimer = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer = 10 * 60000 -- 10 mins

Config.EnableJobBlip = true -- enable blips for colleagues, requires esx_society

Config.MaxInService = -1

Config.PoliceStations = {
	LSPD = {
		Blip = {
			Pos = vector3(425.130, -979.558, 30.711),
			Sprite = 60,
			Display = 4,
			Scale = 0.8,
			Colour = 4
		},
		Cloakrooms = {
			vector3(462.32, -999.07, 29.69)
		},
		Armories = {
			vector3(482.75, -996.03, 29.69)
		},
		Vehicles = {
			{
				Spawner = vector3(441.38, -984.09, 24.7),
				SpawnPoint = vector3(431.26, -986.22, 25.7),
				Heading = 180.0
			}
		},
		Helicopters = {
			{
				Spawner = vector3(466.477, -982.819, 42.691),
				SpawnPoint = vector3(450.04, -981.14, 42.691),
				Heading = 0.0
			}
		},
		VehicleDeleters = {
			vector3(437.91, -997.07, 24.7), -- en bas garage lspd
			vector3(462.45, -1014.89, 27.07), -- dehors dans le garage lspd a gauche
			vector3(462.40, -1019.7, 27.104) -- dehors dans le garage lspd a droite
		},
		BossActions = {
			vector3(459.67, -985.46, 29.73)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},
	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	intendent = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	chef = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	recruit = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'police3', label = 'Vapid Interceptor'}
	},
	officer = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'police3', label = 'Vapid Interceptor'},
		{ model = 'code398cvpi', label = 'Ford CVPI'},
		{ model = 'code3bmw', label = 'Moto BMW'},
		{ model = 'code320exp', label = 'Ford Explorer'},
		{ model = 'police', label = 'Police Cruiser'}
	},
	sergeant = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'code3bmw', label = 'Moto BMW'},
		{ model = 'police3', label = 'Vapid Interceptor'},
		{ model = 'police', label = 'Police Cruiser'},
		{ model = 'code398cvpi', label = 'Ford CVPI'},
		{ model = 'code3fpis', label = 'Ford Fpis'},
		{ model = 'code318charg', label = 'Dodge Charger'},
		{ model = 'code320exp', label = 'Ford Explorer'},
		{ model = 'police2', label = 'Police Buffalo'},
		{ model = 'riot', label = 'R.I.O.T'}
	},
	chef = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'code3bmw', label = 'Moto BMW'},
		{ model = 'police3', label = 'Vapid Interceptor'},
		{ model = 'police', label = 'Police Cruiser'},
		{ model = 'code3fpis', label = 'Ford Fpis'},
		{ model = 'code398cvpi', label = 'Ford CVPI'},
		{ model = 'code318charg', label = 'Dodge Charger'},
		{ model = 'code320exp', label = 'Ford Explorer'},
		{ model = 'police2', label = 'Police Buffalo'},
		{ model = 'riot', label = 'R.I.O.T'}
	},
	lieutenant = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'code3bmw', label = 'Moto BMW'},
		{ model = 'police3', label = 'Vapid Interceptor'},
		{ model = 'police', label = 'Police Cruiser'},
		{ model = 'police2', label = 'Police Buffalo'},
		{ model = 'code3fpis', label = 'Ford Fpis'},
		{ model = 'code320exp', label = 'Ford Explorer'},
		{ model = 'code318charg', label = 'Dodge Charger'},
		{ model = 'ghispo2', label = 'Maserati'},
		{ model = 'code398cvpi', label = 'Ford CVPI'},
		{ model = 'policeb', label = 'Moto de Police'}
	},
	intendent = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'code3bmw', label = 'Moto BMW'},
		{ model = 'police3', label = 'Vapid Interceptor'},
		{ model = 'police', label = 'Police Cruiser'},
		{ model = 'police2', label = 'Police Buffalo'},
		{ model = 'policeb', label = 'Moto de Police'},
		{ model = 'code3fpis', label = 'Ford Fpis'},
		{ model = 'code320exp', label = 'Ford Explorer'},
		{ model = 'code318charg', label = 'Dodge Charger'},
		{ model = 'ghispo2', label = 'Maserati'},
		{ model = 'code318tahoe', label = 'Ford Tahoe'},
		{ model = 'code3ram', label = 'Ford Ram'},
		{ model = 'code398cvpi', label = 'Ford CVPI'},
		{ model = 'riot', label = 'R.I.O.T'}
	},
	boss = {
		{ model = 'scorcher', label = 'Vélo'},
		{ model = 'pbike', label = 'Vélo 2'},
		{ model = 'code3bmw', label = 'Moto BMW'},
		{ model = 'police3', label = 'Vapid Interceptor'},
		{ model = 'police', label = 'Police Cruiser'},
		{ model = 'police2', label = 'Police Buffalo'},
		{ model = 'policeb', label = 'Moto de Police'},
		{ model = 'code3fpis', label = 'Ford Fpis'},
		{ model = 'riot', label = 'R.I.O.T'},
		{ model = 'code320exp', label = 'Ford Explorer'},
		{ model = 'code318charg', label = 'Dodge Charger'},
		{ model = 'fbi', label = 'FBI Buffalo'},
		{ model = 'code318tahoe', label = 'Ford Tahoe'},
		{ model = 'code3ram', label = 'Ford Ram'},
		{ model = 'ghispo2', label = 'Maserati'},
		{ model = 'code398cvpi', label = 'Ford CVPI'}
	}
}

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	lieutenant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	boss_wear = {
		male = {
			['tshirt_1'] = 130,  ['tshirt_2'] = 0,
			['torso_1'] = 50,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 114,  ['helmet_2'] = 7,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 14,  ['tshirt_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 49,
			['pants_1'] = 47,   ['pants_2'] = 0,
			['shoes_1'] = 29,   ['shoes_2'] = 0,
			['helmet_1'] = 113,  ['helmet_2'] = 7,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	emeute_wear = {
		male = {
			['tshirt_1'] = 131,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 125,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	inter_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 49,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 96,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 123,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 56,     ['mask_2'] = 1,
			['bproof_1'] = 16,  ['bproof_2'] = 2
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 42,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 18,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 122,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 56,     ['mask_2'] = 1,
			['bproof_1'] = 18,  ['bproof_2'] = 2
		}
	},
 	ceremonie_wear = {
		male = {
			['tshirt_1'] = 60,  ['tshirt_2'] = 0,
			['torso_1'] = 27,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 79,
			['pants_1'] = 59,   ['pants_2'] = 0,
			['shoes_1'] = 21,   ['shoes_2'] = 0,
			['helmet_1'] = 114,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['mask_1'] = 0,     ['mask_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 12,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 12,  ['bproof_2'] = 3
		}
	},
	bullet_wear1 = {
		male = {
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 0
		}
	},
	gilet_wear1 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0
		}
	}
}