--[[
 __      _____    ____  ______ _______       
 \ \    / /__ \  |  _ \|  ____|__   __|/\    
  \ \  / /   ) | | |_) | |__     | |  /  \   
   \ \/ /   / /  |  _ <|  __|    | | / /\ \  
    \  /   / /_  | |_) | |____   | |/ ____ \ 
     \/   |____| |____/|______|  |_/_/    \_\
                                                                                                                                      
𝐂𝐥𝐢𝐞𝐧𝐭 𝐛𝐥𝐚𝐜𝐤𝐥𝐢𝐬𝐭 𝐜𝐨𝐧𝐟𝐢𝐠𝐮𝐫𝐚𝐭𝐢𝐨𝐧, 𝐜𝐡𝐚𝐧𝐠𝐞 𝐭𝐨 𝐲𝐨𝐮𝐫 𝐥𝐢𝐤𝐢𝐧𝐠
--]]


--> Everything here is just blacklisted lists, all options are in config.
--> Do not name anything here anything similar to ant*c*eat etc, this will be easily detected by mod menus :)
PBC = {}


--> Blacklisted Commands
PBC.BlacklistedCommands = {
    "killmenu",
	"chocolate",
	"pk",
	"panickey",
	"killmenu",
	"panik",
	"lynx",
	"brutan",
	"panic",
	"purgemenu",
}

--> Disabled Vehicle Weapons, found here: https://github.com/jevajs/Jeva/blob/master/FiveM%20-%20GTA%20V%20Natives%2C%20Key%20Press%2C%20Giving%20Weapons/code/guns/weapons.lua
--> By default all are disabled
PBC.DisabledVehicleWeapons = {
    "VEHICLE_WEAPON_WATER_CANNON", 
    "VEHICLE_WEAPON_PLAYER_LAZER", 
    "VEHICLE_WEAPON_PLANE_ROCKET", 
    "VEHICLE_WEAPON_ENEMY_LASER", 
    "VEHICLE_WEAPON_TANK", 
    "VEHICLE_WEAPON_SEARCHLIGHT", 
    "VEHICLE_WEAPON_RADAR", 
    "VEHICLE_WEAPON_PLAYER_BUZZARD", 
    "VEHICLE_WEAPON_SPACE_ROCKET", 
    "VEHICLE_WEAPON_TURRET_INSURGENT", 
    "VEHICLE_WEAPON_PLAYER_SAVAGE", 
    "VEHICLE_WEAPON_TURRET_TECHNICAL", 
    "VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE", 
    "VEHICLE_WEAPON_TURRET_VALKYRIE", 
    "VEHICLE_WEAPON_CANNON_BLAZER", 
    "VEHICLE_WEAPON_TURRET_BOXVILLE", 
    "VEHICLE_WEAPON_RUINER_BULLET", 
    "VEHICLE_WEAPON_RUINER_ROCKET", 
    "VEHICLE_WEAPON_HUNTER_MG", 
    "VEHICLE_WEAPON_HUNTER_MISSILE", 
    "VEHICLE_WEAPON_HUNTER_CANNON", 
    "VEHICLE_WEAPON_HUNTER_BARRAGE", 
    "VEHICLE_WEAPON_TULA_NOSEMG", 
    "VEHICLE_WEAPON_TULA_MG", 
    "VEHICLE_WEAPON_TULA_DUALMG", 
    "VEHICLE_WEAPON_TULA_MINIGUN", 
    "VEHICLE_WEAPON_SEABREEZE_MG", 
    "VEHICLE_WEAPON_MICROLIGHT_MG", 
    "VEHICLE_WEAPON_DOGFIGHTER_MG", 
    "VEHICLE_WEAPON_DOGFIGHTER_MISSILE", 
    "VEHICLE_WEAPON_MOGUL_NOSE", 
    "VEHICLE_WEAPON_MOGUL_DUALNOSE", 
    "VEHICLE_WEAPON_MOGUL_TURRET", 
    "VEHICLE_WEAPON_MOGUL_DUALTURRET", 
    "VEHICLE_WEAPON_ROGUE_MG", 
    "VEHICLE_WEAPON_ROGUE_CANNON", 
    "VEHICLE_WEAPON_ROGUE_MISSILE", 
    "VEHICLE_WEAPON_BOMBUSHKA_DUALMG", 
    "VEHICLE_WEAPON_BOMBUSHKA_CANNON", 
    "VEHICLE_WEAPON_HAVOK_MINIGUN", 
    "VEHICLE_WEAPON_VIGILANTE_MG", 
    "VEHICLE_WEAPON_VIGILANTE_MISSILE", 
    "VEHICLE_WEAPON_TURRET_LIMO", 
    "VEHICLE_WEAPON_DUNE_MG", 
    "VEHICLE_WEAPON_DUNE_GRENADELAUNCHER", 
    "VEHICLE_WEAPON_DUNE_MINIGUN", 
    "VEHICLE_WEAPON_TAMPA_MISSILE", 
    "VEHICLE_WEAPON_TAMPA_MORTAR", 
    "VEHICLE_WEAPON_TAMPA_FIXEDMINIGUN", 
    "VEHICLE_WEAPON_TAMPA_DUALMINIGUN", 
    "VEHICLE_WEAPON_HALFTRACK_DUALMG", 
    "VEHICLE_WEAPON_HALFTRACK_QUADMG", 
    "VEHICLE_WEAPON_APC_CANNON", 
    "VEHICLE_WEAPON_APC_MISSILE", 
    "VEHICLE_WEAPON_APC_MG", 
    "VEHICLE_WEAPON_ARDENT_MG", 
    "VEHICLE_WEAPON_TECHNICAL_MINIGUN", 
    "VEHICLE_WEAPON_INSURGENT_MINIGUN",
    "VEHICLE_WEAPON_SPEEDO4_TURRET_MG", 
    "VEHICLE_WEAPON_SPEEDO4_TURRET_MINI", 
    "VEHICLE_WEAPON_SPEEDO4_MG", 
    "VEHICLE_WEAPON_TRAILER_QUADMG", 
    "VEHICLE_WEAPON_TRAILER_MISSILE", 
    "VEHICLE_WEAPON_TRAILER_DUALAA", 
    "VEHICLE_WEAPON_NIGHTSHARK_MG", 
    "VEHICLE_WEAPON_OPPRESSOR_MG", 
    "VEHICLE_WEAPON_OPPRESSOR_MISSILE", 
    "VEHICLE_WEAPON_MOBILEOPS_CANNON", 
    "VEHICLE_WEAPON_AKULA_TURRET_SINGLE", 
    "VEHICLE_WEAPON_AKULA_MISSILE", 
    "VEHICLE_WEAPON_AKULA_TURRET_DUAL", 
    "VEHICLE_WEAPON_AKULA_MINIGUN", 
    "VEHICLE_WEAPON_AKULA_BARRAGE", 
    "VEHICLE_WEAPON_AVENGER_CANNON", 
    "VEHICLE_WEAPON_BARRAGE_TOP_MG", 
    "VEHICLE_WEAPON_BARRAGE_TOP_MINIGUN", 
    "VEHICLE_WEAPON_BARRAGE_REAR_MG", 
    "VEHICLE_WEAPON_BARRAGE_REAR_MINIGUN", 
    "VEHICLE_WEAPON_BARRAGE_REAR_GL", 
    "VEHICLE_WEAPON_CHERNO_MISSILE", 
    "VEHICLE_WEAPON_COMET_MG", 
    "VEHICLE_WEAPON_DELUXO_MG", 
    "VEHICLE_WEAPON_DELUXO_MISSILE", 
    "VEHICLE_WEAPON_KHANJALI_CANNON", 
    "VEHICLE_WEAPON_KHANJALI_CANNON_HEAVY", 
    "VEHICLE_WEAPON_KHANJALI_MG", 
    "VEHICLE_WEAPON_KHANJALI_GL", 
    "VEHICLE_WEAPON_REVOLTER_MG", 
    "VEHICLE_WEAPON_SAVESTRA_MG", 
    "VEHICLE_WEAPON_SUBCAR_MG", 
    "VEHICLE_WEAPON_SUBCAR_MISSILE", 
    "VEHICLE_WEAPON_SUBCAR_TORPEDO",
    "VEHICLE_WEAPON_STROMBERG_MG",
    "VEHICLE_WEAPON_STROMBERG_MISSILE",
    "VEHICLE_WEAPON_STROMBERG_TORPEDO",
    "VEHICLE_WEAPON_THRUSTER_MG", 
    "VEHICLE_WEAPON_THRUSTER_MISSILE", 
    "VEHICLE_WEAPON_VISERIS_MG", 
    "VEHICLE_WEAPON_VOLATOL_DUALMG",
}

--> Blacklisted Weapons, found here: https://wiki.rage.mp/index.php?title=Weapons
PBC.BlacklistedWeapons = {
    "WEAPON_MINIGUN", 
    "WEAPON_RAILGUN", 
    "WEAPON_RAYMINIGUN",
    "weapon_rpg",
    "weapon_grenadelauncher",
    "weapon_grenadelauncher_smoke",
    "weapon_hominglauncher",
    "weapon_stickybomb",
}

--> Blacklisted Keys, found here: https://docs.fivem.net/docs/game-references/controls/
PBC.BlacklistedKeys = {
    213,
}