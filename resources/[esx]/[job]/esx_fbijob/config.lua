Config = {}
Config.Locale = 'fr'

Config.DrawDistance = 10.0
Config.MarkerType = 1
Config.MarkerColor = {r = 50, g = 50, b = 204}
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

Config.FbiStations = {
    FBI = {
        Blip = {
            Pos = vector3(140.51, -746.15, 45.77),
            Sprite = 210,
            Display = 4,
            Scale = 0.6,
            Colour = 5
        },
        Cloakrooms = {
            vector3(152.0, -736.1, 241.1)
        },
        Armories = {
            vector3(143.6, -764.3, 241.1)
        },
        Vehicles = {
            {
                Spawner = vector3(64.76, -737.42, 43.22),
                SpawnPoint = vector3(59.76, -734.42, 44.18),
                Heading = 342.4
            },
            {
                Spawner = vector3(2511.77, -355.8, 93.09),
                SpawnPoint = vector3(2531.0, -364.7, 92.99),
                Heading = -45.0
            }
        },
        Helicopters = {
            {
                Spawner = vector3(208.76, -729.42, 47.08),
                SpawnPoint = vector3(200.76, -729.42, 47.08),
                Heading = -180.0
            },
            {
                Spawner = vector3(2504.89, -428.07, 115.69),
                SpawnPoint = vector3(2511.39, -426.89, 118.33),
                Heading = 50.0
            }
        },
        VehicleDeleters = {
            vector3(188.76, -717.42, 46.08),
            vector3(60.76, -748.42, 43.22)
        },
        BossActions = {
            vector3(148.9, -758.5, 241.1)
        }
    }
}

Config.AuthorizedWeapons = {
    recruit = {
        {weapon = 'WEAPON_SWITCHBLADE', price = 0},
        {weapon = 'WEAPON_APPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_ASSAULTRIFLE', components = {0, 0, nil, 0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_STUNGUN', price = 0},
        {weapon = 'WEAPON_FLASHLIGHT', price = 0}
    },
    officer = {
        {weapon = 'WEAPON_SWITCHBLADE', price = 0},
        {weapon = 'WEAPON_APPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_ASSAULTRIFLE', components = {0, 0, nil, 0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_BULLPUPRIFLE', components = {0, 0, 0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_STUNGUN', price = 0},
        {weapon = 'WEAPON_FLASHLIGHT', price = 0}
    },
    intendent = {
        {weapon = 'WEAPON_SWITCHBLADE', price = 0},
        {weapon = 'WEAPON_APPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_BULLPUPRIFLE', components = {0, 0, 0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_STUNGUN', price = 0},
        {weapon = 'WEAPON_FLASHLIGHT', price = 0}
    },
    boss = {
        {weapon = 'WEAPON_SWITCHBLADE', price = 0},
        {weapon = 'WEAPON_APPISTOL', components = {0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_BULLPUPRIFLE', components = {0, 0, 0, 0, 0, 0, nil}, price = 0},
        {weapon = 'WEAPON_SNIPERRIFLE', price = 0},
        {weapon = 'WEAPON_STUNGUN', price = 0},
        {weapon = 'WEAPON_FLASHLIGHT', price = 0}
    }
}

Config.AuthorizedVehicles = {
    recruit = {
        {model = 'FBI', label = 'Buffalo Banalisée'},
        {model = 'FBI2', label = 'Granger Banalisée'}
    },
    officer = {
        {model = 'FBI', label = 'Buffalo Banalisée'},
        {model = 'FBI2', label = 'Granger Banalisée'}
    },
    intendent = {
        {model = 'FBI', label = 'Buffalo Banalisée'},
        {model = 'FBI2', label = 'Granger Banalisée'}
    },
    boss = {
        {model = 'FBI', label = 'Buffalo Banalisée'},
        {model = 'FBI2', label = 'Granger Banalisée'}
    }
}

Config.Uniforms = {
    recruit_wear = {
            male = {
                    ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
                    ['torso_1'] = 13,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 26,
                    ['pants_1'] = 24,   ['pants_2'] = 0,
                    ['shoes_1'] = 10,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 125,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            },
            female = {
                    ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                    ['torso_1'] = 14,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 6,   ['pants_2'] = 0,
                    ['shoes_1'] = 6,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = 0,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
    },
    officer_wear = {
            male = {
                    ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
                    ['torso_1'] = 13,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 26,
                    ['pants_1'] = 24,   ['pants_2'] = 0,
                    ['shoes_1'] = 10,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 125,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            },
            female = {
                    ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                    ['torso_1'] = 14,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 6,   ['pants_2'] = 0,
                    ['shoes_1'] = 6,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = 0,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
    },
    intendent_wear = {
            male = {
                    ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
                    ['torso_1'] = 13,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 26,
                    ['pants_1'] = 24,   ['pants_2'] = 0,
                    ['shoes_1'] = 10,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 125,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            },
            female = {
                    ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                    ['torso_1'] = 14,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 0,
                    ['pants_1'] = 6,   ['pants_2'] = 0,
                    ['shoes_1'] = 6,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = 0,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
    },
    boss_wear = {
            male = {
                    ['tshirt_1'] = 31,  ['tshirt_2'] = 0,
                    ['torso_1'] = 29,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 1,
                    ['pants_1'] = 24,   ['pants_2'] = 0,
                    ['shoes_1'] = 10,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 29,    ['chain_2'] = 0,
                    ['ears_1'] = -1,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 35,  ['bproof_2'] = 0,
                    ['glasses_1'] = 5,      ['glasses_2'] = 0,
                    ['watches_1'] = 0,      ['watches_2'] = 0
            },
            female = {
                    ['tshirt_1'] = 64,  ['tshirt_2'] = 0,
                    ['torso_1'] = 24,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 27,
                    ['pants_1'] = 6,   ['pants_2'] = 0,
                    ['shoes_1'] = 6,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = 0,     ['ears_2'] = 0,
                    ['mask_1'] = 121,     ['mask_2'] = 0,
                    ['bproof_1'] = 23,  ['bproof_2'] = 3,
                    ['watches_1'] = 0,      ['watches_2'] = 0
            }
    },
    inter_wear = {
            male = {
                    ['tshirt_1'] = 130,  ['tshirt_2'] = 0,
                    ['torso_1'] = 53,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 38,
                    ['pants_1'] = 37,   ['pants_2'] = 0,
                    ['shoes_1'] = 53,   ['shoes_2'] = 0,
                    ['helmet_1'] = 39,  ['helmet_2'] = 2,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = 2,     ['ears_2'] = 0,
                    ['mask_1'] = 46,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0,
                    ['bag_1'] = 0,  ['bag_2'] = 0
            },
            female = {
                    ['tshirt_1'] = 31,  ['tshirt_2'] = 0,
                    ['torso_1'] = 46,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 34,
                    ['pants_1'] = 36,   ['pants_2'] = 0,
                    ['shoes_1'] = 54,   ['shoes_2'] = 0,
                    ['helmet_1'] = 38,  ['helmet_2'] = 2,
                    ['chain_1'] = 0,    ['chain_2'] = 0,
                    ['ears_1'] = 0,     ['ears_2'] = 0,
                    ['mask_1'] = 46,     ['mask_2'] = 0,
                    ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
    },
    ceremonie_wear = {
            male = {
                    ['tshirt_1'] = 60,  ['tshirt_2'] = 0,
                    ['torso_1'] = 27,   ['torso_2'] = 0,
                    ['decals_1'] = 0,   ['decals_2'] = 0,
                    ['arms'] = 79,
                    ['pants_1'] = 25,   ['pants_2'] = 0,
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
                    ['bproof_1'] = 20,  ['bproof_2'] = 9
            },
            female = {
                    ['bproof_1'] = 20,  ['bproof_2'] = 3
            }
    },
    bullet_wear = {
            male = {
                    ['bproof_1'] = 20,  ['bproof_2'] = 9
            },
            female = {
                    ['bproof_1'] = 20,  ['bproof_2'] = 3
            }
    },
    bullet_wear1 = {
            male = {
                    ['bproof_1'] = 20,  ['bproof_2'] = 9
            },
            female = {
                    ['bproof_1'] = 20,  ['bproof_2'] = 3
            }
    },
    gilet_wear = {
            male = {
                    ['tshirt_1'] = 59,  ['tshirt_2'] = 1
            },
            female = {
                    ['tshirt_1'] = 36,  ['tshirt_2'] = 1
            }
    },
    gilet_wear1 = {
            male = {
                    ['tshirt_1'] = 59,  ['tshirt_2'] = 1
            },
            female = {
                    ['tshirt_1'] = 36,  ['tshirt_2'] = 1
            }
    }
}