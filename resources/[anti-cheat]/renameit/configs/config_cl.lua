-- ## BEFORE ASK HELP, MAKE SURE ONESYNC IS ENABLED !! ## --
-- ## BEFORE ASK HELP, MAKE SURE ONESYNC IS ENABLED !! ## --

WsC          	= {}

-- ## ANTI ADMIN STUFF ## -- ( BYPASS YOUR ADMINS )
WsC.AntiBlips = false -- ANTI BLIPS ( DETECT PLAYER WHO ACTIVATE PLAYERS BLIPS )
	WsC.MaxBlips = 10000 -- MAX BLIPS A PLAYER CAN HAVE
WsC.AntiSpectate = false -- ANTI SPECTATE ( DETECT PLAYER WHO SPECTATE PLAYERS )
WsC.AntiFreeCamCheck = 9000 -- HOW MANY DETECTIONS IN FREECAM ON GET A BAN ( how many secs)

-- ## GLOBAL STUFF ## --
WsC.PlayerProtection = false -- ENABLE or DISABLE BASIC PROTECTION ( anti godmode/ anti fire / anti invisible)
WsC.AntiGodMode = false --ANTI GODMODE ?
	WsC.MaxHealth = 200 -- DO NOT TOUCH
	WsC.MaxArmor = 100 -- DO NOT TOUCH
WsC.AntiESX = false -- TURN IT OFF IF YOU USE ESX FRAMEWORK
WsC.AntiResourceRestart = false -- DETECT IF A PLAYER RESTART A RESOURCE
WsC.ResourceNumberCount = false -- DETECT IF A PLAYER HAS A DIFFERENT RESOURCE NUMBER COUNT

WsC.AntiCommandsInjection = true -- DETECT A PLAYER WHO HAVE DIFFERENT COMMANDS LOADED
WsC.AntiNightVisions = false -- DETECT IF A PLAYER IS USING THERMAL VISION OR NIGHT VISION
WsC.AntiNoClip = false -- DETECT A PLAYER IN NOCLIP MODE
WsC.AntiTeleport = false -- DETECT IF A PLAYER IS NOCLIPPING OR TELEPORTING
	WsC.MaxDistanceInOneSecond = 75 -- HOW MANY METERS IN 1 SECOND TO BAN PLAYER WHILE NOCCLIPING
WsC.AntiASI = true -- DETECT ASI MENUS
WsC.VehicleSpeedModifier = false -- DETECT IF A PLAYER CHANGE HIS VEHICLE SPEED
    WsC.SpeedMultiplier = 180.0 -- DETECT x18 SPEED
WsC.AntiNuiDevTools = true -- DETECT IF NUI DEV TOOLS IS OPENED

-- ## WEAPON STUFF ## --
WsC.AntiAimBot = true --DETECT A PLAYER WITH AN AIMBOT
WsC.AntiTriggerBot = true -- DETECT A PLAYER WITH A TRIGGER BOT
WsC.AntiRageBot = true -- DETECT A PLAYER WITH A RAGE BOT
WsC.AntiRapidFire = true -- DETECT A PLAYER WITH RAPID FIRE
WsC.AntiDamageModifier = true -- ENABLE / DISABLE ANTI DAMAGE MODIFIER
	WsC.MaxWeaponDamages = 360 -- MAX WEAPON DAMAGE ( BY DEFAULT 230 IS THE MAX DAMAGE WEAPON IN GTA - SNIPER )
WsC.MaxAmmos = 90000 -- MAX AMMO IN WEAPON TO BAN
WsC.AntiGiveWeaponsESX = true -- ENABLE IF YOU USE ESX AND YOU WANT ANTI GIVE WEAPONS
    WsC.ESXSharedObjectEventName = "::{ayzwen}::esx:getSharedObject" -- YOUR ESX GET SHARED OBJECT EVENT NAME
    WsC.ESXAddWeaponEventName = "::{ayzwen}::esx:addWeapon" -- YOUR ESX ADD WEAPOND EVENT NAME 

-- ## BLACKLISTED STUFF ## --
WsC.BlacklistedWeaponsDetections = true -- ENABLE / DISABLE BlACLISTED WEAPONS
WsC.BlacklistedWeaponsRemove = true -- REMOVE ALL WEAPONS ON A PLAYER WHO HAVE BLACKLISTED WEAPON
WsC.BanBlacklistedWeapon = true -- BAN PLAYER WHO HAVE BLACKLISTED WEAPON
WsC.EnhancedMenusDetections = false -- BAN MENU 

-- ## KEYLOG STUFF ## --
WsC.KeyLog = true -- ENABLE / DISABLE KEY LOGGER
    WsC.ScreenshotWhenAltF8 = true -- SCREENSHOT WHEN PLAYER PRESS ALT + F8 ( EULEN )
    WsC.ScreenshotWhenInsert = true -- SCREENSHOT WHEN PLAYER PRESS INSERT ( EULEN - SOMES MENUS)
    WsC.ScreenshotWhenF8 = false -- SCREENSHOT WHEN PLAYER PRESS F8 ( HAM - RED ENGINE) NOT RECOMMANDED
    WsC.ScreenshotWhenShiftG = true -- SCREENSHOT WHEN PLAYER PRESS SHIFT + G
    WsC.ScreenshotWhenDelete = true -- SCREENSHOT WHEN PLAYER PRESS DELETE

WsC.BlacklistedCommandsDetections = true -- ENABLE / DISABLE BlACLISTED COMMANDS

-- ## PICKUPS ## --
WsC.AntiWeaponsPickup = true  -- ENABLE / DISABLE ANTI WEAPONS PICKUP

-- ## ENTITIES STUFF ##--
WsC.ClearEntitiesCommands = true -- ENABLE / DISABLE CLEAR PEDS,VEHICLES,OBJECTS COMMANDS

WsC.BlacklistedNatives = { -- BLACKLIST FIVEM NATIVES CONTAINED IN MENUS
    "GetTextureResolution",
    "CreateRuntimeTxd",
    "CreateRuntimeTextureFromDuiHandle",
    "GetDuiHandle",
    "CreateDui",
    "SetPedInfiniteAmmo",
    "ShootSingleBulletBetweenCoords",
    "ShootSingleBulletBetweenCoordsIgnoreEntity",
    "ShootSingleBulletBetweenCoordsIgnoreEntityNew",
    "SetSuperJumpThisFrame",
    "SetExplosiveMeleeThisFrame",
    "SetExplosiveAmmoThisFrame",
    "SetHandlingField",
    "SetHandlingInt",
    "SetHandlingFloat",
    "SetHandlingVector",
    "AddExplosion",
    "NetworkExplodeVehicle",
    "SetVehicleBurnout",
    "ShowHeadingIndicatorOnBlip",
    "SetBlipNameToPlayerName",
    "ApplyForceToEntity",
    "load",
}

WsC.BlacklistedGlobalsValues = { -- BLACKLIST GLOBAL FUNCTIONS / STRINGS CONTAINED IN MENUS
    "RapeAllFunc",
    "drawNotification",
    "fuckmedaddy",
    "GetKeyboardInput",
    "_Executor",
    "_Executor_Strings",
    'AlikhanCheats',
    'gaybuild',
    'Plane',
    'LynxEvo',
    'FendinX',
    'LR',
    'Lynx8',
    'MIOddhwuie',
    'ililililil',
    'esxdestroyv2',
    'LiLLL',
    'obl2',
    'HamMafia',
    'Absolute',
    'Absolute_function',
    'TiagoMenu',
    'SkazaMenu',
    'BrutanPremium',
    'b00mMenu',
    'Cience',
    'MaestroMenu',
    'Crusader',
    'NertigelFunc',
    'dreanhsMod',
    'nukeserver',
    'SDefwsWr',
    'FlexSkazaMenu',
    'DynnoFamily',
    'FrostedMenu',
    'frosted_config',
    'FXMenu',
    'CKgang',
    'HoaxMenu',
    'alkomenu',
    'xseira',
    'KoGuSzEk',
    'LynxSeven',
    'lynxunknowncheats',
    'MaestroEra',
    'foriv',
    'ariesMenu',
    'Ham',
    'Hydra',
    'Outcasts666',
    'b00mek',
    'redMENU',
    'rootMenu',
    'xnsadifnias',
    'LDOWJDWDdddwdwdad',
    'moneymany',
    'FlexSkazaMenu',
    'VOITUREMenu',
    'fESX',
    'dexMenu',
    'zzzt',
    'AKTeam',
    'SwagMenu',
    'Gatekeeper',
    'Dopameme',
    'Lux',
    'Swag',
    'SwagUI',
    'Nisi',
    'nigmenu0001',
    'Motion',
    'MMenu',
    'FantaMenuEvo',
    'GRubyMenu',
    'InSec',
    'AlphaVeta',
    'ShaniuMenu',
    'HamHaxia',
    'FendinXMenu',
    'AlphaV',
    'Deer',
    'NyPremium',
    'lIlIllIlI',
    'OnionUI',
    'qJtbGTz5y8ZmqcAg',
    'LuxUI',
    'JokerMenu',
    'IlIlIlIlIlI',
    'SidMenu',
    'GheMenu',
    'INFINITY',
    'klVZJu56hiZnIjg88ekXcEgegjfDvuMv83grKxQiUJJFvN8SHENeK2WaRgTTuafpGe',
    'jailServerLoop',
    'carSpamServer',
    'Dopamine',
    'nofuckinglol',
}