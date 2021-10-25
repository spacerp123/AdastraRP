Config                            = {}
Config.DrawDistance               = 10.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.EnableESXIdentity          = false
Config.Locale                     = 'fr'

Config.Cig = {
  'malbora',
  'gitanes'
}

Config.CigResellChances = {
  malbora = 45,
  gitanes = 55,
}

Config.CigResellQuantity= {
  malbora = {min = 5, max = 10},
  gitanes = {min = 5, max = 10},
}

Config.CigPrices = {
  malbora = {min = 20, max = 35},
  gitanes = {min = 15,   max = 30},
}

Config.CigPricesHigh = {
  malbora = {min = 30, max = 65},
  gitanes = {min = 25,   max = 55},
}

Config.Time = {
	malbora = 5 * 60,
	gitanes = 5 * 60,
}

Config.Blip = {
  Pos     = { x = 2349.91, y = 3134.76, z = 48.20 },
  Sprite  = 79,
  Display = 4,
  Scale   = 0.65,
  Colour  = 2,
}

Config.Zones = {

  TabacActions = {
    Pos   = { x = 2355.90, y = 3143.82, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 255, g = 209, b = 51},
    Type  = 1,
  },

  Garage = {
    Pos   = { x = 2886.9729003906, y = 4609.4565429688, z = 46.987 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Color = {r = 255, g = 209, b = 51},
    Type  = 1,
  },

  Craft = {
    Pos   = { x = 2348.86, y = 3141.46, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 255, g = 209, b = 51},
    Type  = 1,
  },

  Craft2 = {
    Pos   = { x = 2353.97, y = 3139.07, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 255, g = 209, b = 51},
    Type  = 1,
  },

  VehicleSpawnPoint = {
    Pos   = { x = 2356.97, y = 3131.92, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Type  = -1,
  },

  VehicleDeleter = {
    Pos   = { x = 2365.87, y = 3122.69, z = 47.30 },
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
    Color = { r = 255, g = 209, b = 51},
    Type  = 1,
  },

  SellFarm = {
    Pos   = {x = 2340.65, y = 3125.93, z = 47.30},
    Size  = { x = 1.6, y = 1.6, z = 1.0 },
	Color = {r = 255, g = 209, b = 51},
    Name  = "Vente des produits",
    Type  = 1
  },
  
}