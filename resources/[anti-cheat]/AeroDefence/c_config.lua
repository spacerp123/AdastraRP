-- ###########################################################################
-- ###                                                                       #
-- ###                                                                       #
-- ###                                                                       #
-- ###                           NeoLand RP !!!                              #
-- ###                          discord.gg/g2FFfWUSeF                        #
-- ###                                                                       #
-- ###                                                                       #
-- ###                                                                       #
-- ############################################################################








PC = {}
--[[
 __      _____    ____  ______ _______       
 \ \    / /__ \  |  _ \|  ____|__   __|/\    
  \ \  / /   ) | | |_) | |__     | |  /  \   
   \ \/ /   / /  |  _ <|  __|    | | / /\ \  
    \  /   / /_  | |_) | |____   | |/ ____ \ 
     \/   |____| |____/|______|  |_/_/    \_\                                                            
                                                                                             
    𝐂𝐥𝐢𝐞𝐧𝐭 𝐜𝐨𝐧𝐟𝐢𝐠𝐮𝐫𝐚𝐭𝐢𝐨𝐧, 𝐜𝐡𝐚𝐧𝐠𝐞 𝐭𝐨 𝐲𝐨𝐮𝐫 𝐥𝐢𝐤𝐢𝐧𝐠
--]]

PC.ClientEnabled = true --> Enable Anticheat?
PC.RefreshRate = 1000 --> Time between checks for godmode etc. Lower = Laggier, Higher = Less chance of detecting hackers. Recommended at 10000 (IN MS)

PC.ESX = true --> If you use ESX, set this to true, otherwise false [VERY IMPORTANT FOR CATCHING A FEW MOD MENUS!]

--> ClientSide Protections [REMEMBER TO DISABLE THOSE THAT ARE NORMAL IN YOUR SERVER!]

PC.AntiTurnOffSS = true --> Important! Check to see if the screenshot script is disabled
PC.OffSSTimer = 5000 --> In ms, to check for the screenshot script (plane-ss)


PC.OnScreenWordDetection = true --> IN BETA! USE AT YOUR OWN RISK; RECOMMENDED!
--> Webhook for on screen word detection, only for image uploads, it will be spammed so mute!
PC.OnScreenWebhook = "https://discordapp.com/api/webhooks/902887956291915816/m52l5Qj7VEsqY9nrl5mLbpexaOtBiY-jdZGk3BwolTrtFlsJ7DTWpM_kmXYeA8VGetOB"
PC.NotAllowedWords = {"Absolute", "tiago", "v4.2", "Desudo", "Super Jump", "Magneto", "A B S O L U T E", "Infinite stamina", "Invincible", "Wardrobe Maker", "Blackholer", "if you want to use it just go to the config and enable it","fallout","godmode","modmenu","esxmoney","givearmor","aimbot","troll","trigger","triggerbot","ragebot","ragebot","rapidfire","fuckserver","freecam","execute","superjump","noclip","hack","lynx","absolute","ckgangisontop","lumia1","ISMMENU","HydroMenu","TAJNEMENUMenu","rootMenu","Outcasts666","WaveCheat","NacroxMenu","MarketMenu","topMenu","FlexSkazaMenu","SidMenu","Crown","Lynx8","LynxEvo","Maestro","Tiago","Brutan","redEngine","Unex","Eulen","HamMafia","HamHaxia","Dopamine","Dopameme","redMENU","falcon","Desudo","Onion","explode","Anticheat","Particle","RedStonia","Chocohax","Inyection","Inyected","Dumper","LUAExecutor","Executor","Skid","HoaX","EventBlocker","Cheats","Cheat","Destroyer","Troll Options","Spectate","Wallhack","Exploit","triggers","crosshair","Explosive","Alokas66","HackingSystem!","OnlinePlayers","PanicButton","DestroyMenu","SelfMenu","ServerIP","TeleportTo","GiveSingleWeapon","AirstrikePlayer","TazePlayer","Logged as","The Girls","MADE BY PLANE","Kill Menu"}
PC.OnScreenTimer = 20000

PC.AntiGM = true --> Check for player godmode?
PC.AntiFree = false --> Detect Freecam? Not recommended for servers with character selection in the air!
PC.AntiSpeedHack = true --> Check for speedhack?
PC.AntiSpec = true --> Check for players trying to spectate?
PC.AntiDmgModifier = true --> Check if players try to change damage modifier?
PC.MaxDMGModifier = 1.0 --> Max DMG Modifier for function above, switch to higher if your server uses this!
PC.AntiNight = false --> Anti Night Vision
PC.AntiThermal = false --> Anti Thermal Vision
PC.AntiCheatEngine = true --> Anti Cheat Engine?
PC.AntiRagdoll = false --> Anti NoRagdoll?
PC.AntiKillEngine = true --> Disable other players turning off your engine
PC.AntiSuperJump = true --> Check for super jump (CONFIGURE BAN OR NOT ASWELL AS MESSAGE IN SERVER CONFIG)
PC.AntiBlips = true --> Ban if player has blips
PC.AntiAimAssist2 = false --> Detect Aim Assist?
PC.AntiMenyoo = false --> Anti Menyoo
PC.AntiPedChange = false --> Anti Ped Model Change (Not recommended unless you always have the same model.)
PC.AntiLicenseClears = true --> Anti License Clears
PC.AntiExplosiveBullets = true --> Anti Explosive Bullets
PC.AntiRadar = false --> Anti Map (except in vehicle)
PC.AntiInfiniteStamina = true --> Anti Infinite Stamina
PC.AntiNoclip = true --> Anti Noclip?
PC.AntiInvisibility = false --> Disable Invisibility?
PC.BlockTiny = true --> Block tiny ped modifier?
PC.AntiHS = true --> Block anti headshot?
PC.VehMod = true --> Detect vehicle modifiers?

--> This is a limiter, not a detection
PC.VehicleMaxSpeed = 300 --> Max vehicle speed overall, in KM/H. Set to false if you do not want this.

PC.DisablePickup = true --> Disable player picking up pickups? --> No performance change
PC.RemovePickup = true --> Remove all pickups? --> Disables weapon rain, fps hungry!
PC.PickupTable = { "PICKUP_VEHICLE_WEAPON_APPISTOL", "PICKUP_VEHICLE_WEAPON_ASSAULTSMG", "PICKUP_VEHICLE_WEAPON_COMBATPISTOL", "PICKUP_VEHICLE_WEAPON_GRENADE", "PICKUP_VEHICLE_WEAPON_MICROSMG", "PICKUP_VEHICLE_WEAPON_MOLOTOV", "PICKUP_VEHICLE_WEAPON_PISTOL", "PICKUP_VEHICLE_WEAPON_PISTOL50", "PICKUP_VEHICLE_WEAPON_SAWNOFF", "PICKUP_VEHICLE_WEAPON_SMG", "PICKUP_VEHICLE_WEAPON_SMOKEGRENADE", "PICKUP_VEHICLE_WEAPON_STICKYBOMB", "PICKUP_WEAPON_ADVANCEDRIFLE", "PICKUP_WEAPON_APPISTOL", "PICKUP_WEAPON_ASSAULTRIFLE", "PICKUP_WEAPON_ASSAULTRIFLE_MK2", "PICKUP_WEAPON_ASSAULTSHOTGUN", "PICKUP_WEAPON_ASSAULTSMG", "PICKUP_WEAPON_AUTOSHOTGUN", "PICKUP_WEAPON_BAT", "PICKUP_WEAPON_BATTLEAXE", "PICKUP_WEAPON_BOTTLE", "PICKUP_WEAPON_BULLPUPRIFLE", "PICKUP_WEAPON_BULLPUPRIFLE_MK2", "PICKUP_WEAPON_BULLPUPSHOTGUN", "PICKUP_WEAPON_CARBINERIFLE", "PICKUP_WEAPON_CARBINERIFLE_MK2", "PICKUP_WEAPON_COMBATMG", "PICKUP_WEAPON_COMBATMG_MK2", "PICKUP_WEAPON_COMBATPDW", "PICKUP_WEAPON_COMBATPISTOL", "PICKUP_WEAPON_COMPACTLAUNCHER", "PICKUP_WEAPON_COMPACTRIFLE", "PICKUP_WEAPON_CROWBAR", "PICKUP_WEAPON_DAGGER", "PICKUP_WEAPON_DBSHOTGUN", "PICKUP_WEAPON_DOUBLEACTION", "PICKUP_WEAPON_FIREWORK", "PICKUP_WEAPON_FLAREGUN", "PICKUP_WEAPON_FLASHLIGHT", "PICKUP_WEAPON_GolfClub", "PICKUP_WEAPON_GRENADE", "PICKUP_WEAPON_GRENADELAUNCHER", "PICKUP_WEAPON_GUSENBERG", "PICKUP_WEAPON_HAMMER", "PICKUP_WEAPON_HATCHET", "PICKUP_WEAPON_HEAVYPISTOL", "PICKUP_WEAPON_HEAVYSHOTGUN", "PICKUP_WEAPON_HEAVYSNIPER", "PICKUP_WEAPON_HEAVYSNIPER_MK2", "PICKUP_WEAPON_RPG", "PICKUP_WEAPON_KNIFE", "PICKUP_WEAPON_KNUCKLE", "PICKUP_WEAPON_MACHETE", "PICKUP_WEAPON_MACHINEPISTOL", "PICKUP_WEAPON_MARKSMANPISTOL", "PICKUP_WEAPON_MARKSMANRIFLE", "PICKUP_WEAPON_MARKSMANRIFLE_MK2", "PICKUP_WEAPON_MG", "PICKUP_WEAPON_MICROSMG", "PICKUP_WEAPON_MINIGUN", "PICKUP_WEAPON_MINISMG", "PICKUP_WEAPON_MOLOTOV", "PICKUP_WEAPON_MUSKET", "PICKUP_WEAPON_NIGHTSTICK", "PICKUP_WEAPON_PETROLCAN", "PICKUP_WEAPON_PIPEBOMB", "PICKUP_WEAPON_PISTOL", "PICKUP_WEAPON_PISTOL_MK2", "PICKUP_WEAPON_PISTOL50", "PICKUP_WEAPON_POOLCUE", "PICKUP_WEAPON_PROXMINE", "PICKUP_WEAPON_PUMPSHOTGUN", "PICKUP_WEAPON_PUMPSHOTGUN_MK2", "PICKUP_WEAPON_RAILGUN", "PICKUP_WEAPON_REVOLVER", "PICKUP_WEAPON_REVOLVER_MK2", "PICKUP_WEAPON_RPG", "PICKUP_WEAPON_SAWNOFFSHOTGUN", "PICKUP_WEAPON_SMG", "PICKUP_WEAPON_SMG_MK2", "PICKUP_WEAPON_SMOKEGRENADE", "PICKUP_WEAPON_SNIPERRIFLE", "PICKUP_WEAPON_SNSPISTOL", "PICKUP_WEAPON_SNSPISTOL_MK2", "PICKUP_WEAPON_SPECIALCARBINE", "PICKUP_WEAPON_SPECIALCARBINE_MK2", "PICKUP_WEAPON_STICKYBOMB", "PICKUP_WEAPON_STONE_HATCHET", "PICKUP_WEAPON_STUNGUN", "PICKUP_WEAPON_SWITCHBLADE", "PICKUP_WEAPON_VINTAGEPISTOL", "PICKUP_WEAPON_WRENCH", "PICKUP_AMMO_BULLET_MP", "PICKUP_AMMO_FIREWORK", "PICKUP_AMMO_FIREWORK_MP", "PICKUP_AMMO_FLAREGUN", "PICKUP_AMMO_GRENADELAUNCHER", "PICKUP_AMMO_GRENADELAUNCHER_MP", "PICKUP_AMMO_HOMINGLAUNCHER", "PICKUP_AMMO_MG", "PICKUP_AMMO_MINIGUN", "PICKUP_AMMO_MISSILE_MP", "PICKUP_AMMO_PISTOL", "PICKUP_AMMO_RIFLE", "PICKUP_AMMO_RPG", "PICKUP_AMMO_SHOTGUN", "PICKUP_AMMO_SMG", "PICKUP_AMMO_SNIPER"}
PC.PickupTimer = 300

PC.Devtools = true --> Detect NUI Devtools
PC.AntiExecutors = true --> Disable most of the executors using a simple method (wont ban, only disable)
PC.ResetTimer = 30000 --> How long will it keep the executors disabled per key press? If you do not have any scripts that use FiveM mouse, keep this at 1 to forever disable mouse

PC.AntiSpawnNotScript = true --> Highly recommended, read the text below if you want to decide it.
PC.AntiEulenSpawns = true --> Still experimental, recommended unless it false bans, requires the above to work.
PC.SpawnVehiclesNotScript = true --> Detect vehicles from other scripts? Recommended.
PC.SpawnPropsNotScript = true --> Detect props from other scripts? Recommended.
PC.SpawnPedsNotScript = true --> Detect peds from other scripts? Not recommended.
PC.NotScriptCheck = 3000 --> This will check every ped, prop and vehicle owned by the player, will take performance if set to very low.
--> You will need to place every script that can either spawn a ped, object or vehicle below depending on what you want enabled.
PC.ScriptsSpawn = {
    "esx_", -- or could start with!
    "es_",
    -- OR whole script name
    "mCatalogue",
    "mGoFast",
    "rp-radio"
}

PC.TextDict = true --> Anti TextDict in list below:
PC.Dicts = {
    --"commonmenu", --Fallout menu
    "helicopterhud",
    "deadline",
    --"shopui_title_sm_hangar",
    "rampage_tr_main", -- rampage menu
    "mpleaderboard",
    "digitaloverlay",
    "setMenuProperty",
    "titleBackgroundSprite.dict",
    "bobylebg",
    "mpmissmarkers256",
    "titleBackgroundSprite.dict",
     "mpmissmarkers256",
     "titleBackgroundSprite"
}

PC.NoNamedPtfx = true --> Anti Named Ptfx in list below:
PC.PTFX = {
    "scr_rcbarry2",
    "scr_indep_fireworks",
    "scr_exile1",
    "proj_indep_firework_v2"
}

PC.AntiAnimations = true --> Anti animations in list below:
PC.AntiAnimList = {
	"rcmpaparazzo_2", 
    "shag_loop_poppy"
}

PC.AntiBlacklistedTasks = true --> Prevents players from using Anti-AFK Bypasser cheats or Executing Blacklisted Tasks (https://raw.githubusercontent.com/visibait/gtav-defaultasks/main/tasks)
PC.BlacklistedTasks = {
	100, --> CTaskWanderingScenario (ANTI AFK BYPASS)
	101, --> CTaskWanderingInRadiusScenario (ANTI AFK BYPASS)
	151, --> CTaskCarDriveWander (ANTI AFK BYPASS)
	221, --> CTaskWander (ANTI AFK BYPASS)
	222, --> CTaskWanderInArea (ANTI AFK BYPASS)
}

PC.AntiArmour = true --> Detect when players give themselves / others armour?
PC.AntiFlying = false --> Detect when a player is flying?
PC.AmmoWarning = false --> Check if player has more ammo than limit, also detects infinite ammo
PC.AmmoLimit = 500 --> Ammo limit on server!
PC.NoVDM = true --> Disable VDM Damage
PC.DisableHealthArmourPickup = true --> Disable dropping health and armour pickups to other players

PC.BlacklistCommands = false --> Blacklist Commands? If so, remember to change in the client/blacklist file! (Not recommended, takes ~0.2ms per refresh)
PC.DisableVehicleWeapons = false --> Disable Vehicle Weapons? If so, remember to change in the client/blacklist file! (Turn off, unless your server uses vehicles with weapons.)
PC.VehWepTimer = 1000 --> Timer between checking for vehicle and turning off the weapons
PC.BlacklistWeapons = true --> Blacklist Weapons? If so, remember to change in the client/blacklist file! (Not recommended unless you need it, takes ~0.1ms per refresh)
--> Not recommended unless you know what you are doing
PC.BlacklistKeys = false --> Blacklist Keys? If so, remember to change in the client/blacklist file! (Takes >0.1ms)
PC.KeysTimer = 1 --> Time between checking for clicks
PC.SupressBlacklistedEntities = true --> Stops all blacklisted entities in the serverside blacklist from spawning (Will take all the serverside blacklists and send them to each client for suppression)
--> Turn off these 3 if you notice a change in resmon (MS)
PC.SupressVehicles = true --> Stops the vehicles named ^
PC.SupressPeds = true --> Stops the peds named ^
PC.SupressTimer = 10000 --> Time between suppressions

PC.AntiAimAssist = true --> Disable controller aim assist?
PC.AntiAimAssistTimer = 10 --> Timer between disables

PC.AntiSoloSession = false

--> See here for warn or ban function, if you place a component to true it will ban, otherwise only warn to server!
PC.BanWarn = {
    AntiTurnOffSS = true, --> if a player disables the screenshot script
    ESX = true, --> If a player uses esx sharedobject trigger and your server isnt esx.
    Godmode = true,
    SpeedHack = true,
    AntiSpec = true,
    AntiDmgModifier = true,
    OnScreenWordDetection = true,
    AntiNight = true,
    AntiThermal = true,
    AntiCheatEngine = true,
    AntiRagdoll = true,
    AntiBlips = false,
    AntiAimAssist2 = true,
    AntiMenyoo = true,
    AntiPedChange = true,
    AntiLicenseClears = true,
    AntiExplosiveBullets = true,
    AntiRadar = true,
    AntiAnimations = true,
    NoNamedPtfx = true,
    AntiBlacklistedTasks = true,
    AntiInfiniteStamina = false,
    AntiNoclip = true,
    AntiInvisibility = true,
    VehMod = true,
    Devtools = true,
    BlockTiny = true,
    AntiHS = true,
    AntiFree = true,
    TextDict = true,
    AntiSpawnNotScript = true,
    AntiArmour = true,
    AntiFlying = true,
    AmmoWarning = true,
    BlacklistCommands = true,
    BlacklistWeapons = false,
    BlacklistKeys = true,
}

--> Messages for different stuff
PC.MessagesBan = {
    AntiTurnOffSS = "You have been caught cheating on our server, discord.gg/g2FFfWUSeF",
    ESX = "You have been caught cheating on our server, discord.gg/g2FFfWUSeF",
    Godmode = "You have been caught using GodMode, discord.gg/g2FFfWUSeF",
    SpeedHack = "You have been caught using Speedhacks, discord.gg/g2FFfWUSeF",
    AntiSpec = "You have been caught using Spectator Mode, discord.gg/g2FFfWUSeF",
    AntiDmgModifier = "You have been caught using a Damage Modifier, discord.gg/g2FFfWUSeF",
    OnScreenWordDetection = "You have been caught using a mod menu, discord.gg/g2FFfWUSeF",
    AntiNight = "You have been caught using Night Vision, discord.gg/g2FFfWUSeF",
    AntiThermal = "You have been caught using a Thermal Vision, discord.gg/g2FFfWUSeF",
    AntiCheatEngine = "You have been caught using Cheat Engine, discord.gg/g2FFfWUSeF",
    AntiRagdoll = "You have been caught using AntiRagdoll, discord.gg/g2FFfWUSeF",
    AntiBlips = "You have been caught using Player Blips, discord.gg/g2FFfWUSeF",
    AntiAimAssist2 = "You have been caught using Aim Assist, discord.gg/g2FFfWUSeF",
    AntiMenyoo = "You have been caught using Menyoo, discord.gg/g2FFfWUSeF",
    AntiPedChange = "You have been caught using PedChange, discord.gg/g2FFfWUSeF",
    AntiLicenseClears = "You have been caught using LicenseClears, discord.gg/g2FFfWUSeF",
    AntiExplosiveBullets = "You have been caught using ExplosiveBullets, discord.gg/g2FFfWUSeF",
    AntiRadar = "You have been caught using Radar, discord.gg/g2FFfWUSeF",
    AntiAnimations = "You have been caught using a blacklisted Animation, discord.gg/g2FFfWUSeF",
    NoNamedPtfx = "You have been caught using a blacklisted PTFX, discord.gg/g2FFfWUSeF",
    AntiBlacklistedTasks = "You have been caught using a blacklisted Task, discord.gg/g2FFfWUSeF",
    AntiInfiniteStamina = "You have been caught using Infinite Stamina, discord.gg/g2FFfWUSeF",
    AntiNoclip = "You have been caught using Noclip, discord.gg/g2FFfWUSeF",
    AntiInvisibility = "You have been caught using Invisibility, discord.gg/g2FFfWUSeF",
    VehMod = "You have been caught using Vehicle Modifiers, discord.gg/g2FFfWUSeF",
    Devtools = "You have been caught using Devtools, discord.gg/g2FFfWUSeF",
    BlockTiny = "You have been caught using Tiny, discord.gg/g2FFfWUSeF",
    AntiHS = "You have been caught using AntiHS, discord.gg/g2FFfWUSeF",
    AntiFree = "You have been caught using FreeCam, discord.gg/g2FFfWUSeF",
    TextDict = "You have been using a forbidden text dict, discord.gg/g2FFfWUSeF",
    AntiSpawnNotScript = "You have spawned something using an external script. discord.gg/g2FFfWUSeF",
    AntiArmour = "You have been caught giving Armour, discord.gg/g2FFfWUSeF",
    AntiFlying = "You have been caught using Flying cheats, discord.gg/g2FFfWUSeF",
    AmmoWarning = "You have been caught having more ammo than allowed, discord.gg/g2FFfWUSeF",
    BlacklistCommands = "You have been caught using a Blacklisted Command, discord.gg/g2FFfWUSeF",
    BlacklistWeapons = "You have been caught using a Blacklisted Weapon, discord.gg/g2FFfWUSeF",
    BlacklistKeys = "You have been caught pressing a Blacklisted Key, discord.gg/g2FFfWUSeF"
}

PC.MessagesWarn = {
    AntiTurnOffSS = "Player turned off plane-ss",
    ESX = "Player triggered ESX",
    Godmode = "Player using Godmode.",
    SpeedHack = "Player using Speedhack.",
    AntiSpec = "Player Spectating Others.",
    AntiDmgModifier = "Player using DMG Modifier.",
    OnScreenWordDetection = "Player using a mod menu (ONSCREENWORD)",
    AntiNight = "Player using Night Vision.",
    AntiThermal = "Player using Thermal Vision.",
    AntiCheatEngine = "Player using CheatEngine.",
    AntiRagdoll = "Player using AntiRagdoll.",
    AntiBlips = "Player using PlayerBlips",
    AntiAimAssist2 = "Player using Aim Assist (2).",
    AntiMenyoo = "Player using Menyoo.",
    AntiPedChange = "Player switched Ped model.",
    AntiLicenseClears = "Player using LicenseClears.",
    AntiExplosiveBullets = "Player using ExplosiveBullets.",
    AntiRadar = "Player using Radar.",
    AntiAnimations = "Player using blacklisted animation.",
    NoNamedPtfx = "Player using blacklisted PTFX.",
    AntiBlacklistedTasks = "Player using blacklisted task.",
    AntiInfiniteStamina = "Player using Infinite Stamina.",
    AntiNoclip = "Player using Noclip.",
    AntiInvisibility = "Player using Invisibility.",
    VehMod = "Player using Vehicle Modifiers.",
    Devtools = "Player using Devtools.",
    BlockTiny = "Player using Tiny.",
    AntiHS = "Player using AntiHS.",
    AntiFree = "Player FreeCamming.",
    TextDict = "Player using TextDict.",
    AntiSpawnNotScript = "Player spawned something using a script not listed. (AntiSpawnNotScript)",
    AntiArmour = "Player Armour > 101.",
    AntiFlying = "Player Flying.",
    AmmoWarning = "Player using Ammo over Limit.",
    BlacklistCommands = "Player using a Blacklisted Command.",
    BlacklistWeapons = "Player using a Blacklisted Weapon.",
    BlacklistKeys = "Player pressing a Blacklisted Key."
}