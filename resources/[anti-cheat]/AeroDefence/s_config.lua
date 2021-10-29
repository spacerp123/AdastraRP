PS = {}
--[[
 __      _____    ____  ______ _______       
 \ \    / /__ \  |  _ \|  ____|__   __|/\    
  \ \  / /   ) | | |_) | |__     | |  /  \   
   \ \/ /   / /  |  _ <|  __|    | | / /\ \  
    \  /   / /_  | |_) | |____   | |/ ____ \ 
     \/   |____| |____/|______|  |_/_/    \_\                                                         
                                                        
    𝐒𝐞𝐫𝐯𝐞𝐫 𝐜𝐨𝐧𝐟𝐢𝐠𝐮𝐫𝐚𝐭𝐢𝐨𝐧, 𝐜𝐡𝐚𝐧𝐠𝐞 𝐭𝐨 𝐲𝐨𝐮𝐫 𝐥𝐢𝐤𝐢𝐧𝐠
--]]

--> Are you using ESX?
PS.UsingESX = true
--> If true, set your trigger, otherwise ignore.
PS.ESXTrigger = "::{ayzwen}::esx:getSharedObject"

PS.ForceSteam = false --> Players must have steam to connect
PS.ForceDiscord = false --> Players must have discord to connect
PS.AllowBans = true --> This will allow Ban functions, otherwise everything will only be warns
-- Recommended to set this to true, otherwise cheaters will blow up your discord with warnings :)

--> Discord

PS.BotName = "Adistra"
PS.EmbedColour = 0x80ffff
PS.Webhooks = {
    InjectionBan = "https://discordapp.com/api/webhooks/902888269681917992/19NtIGoZ9XhX7T7W3iCYqVN1u8EkIjoKv-XF7p3CCj30lNsotb2jUQ5pGZ22ge7AJrtr", --> Bans from the antiinject
    CBan = "https://discordapp.com/api/webhooks/902888340184002631/r1ocpZL1JHqMioVp4HV8Ty_aQp8jNPLx2XtUM5jyrsJk5ZloWqsse38JGLCFJZ79sEs3", --> Bans from the ant*c*eat
    Unbans = "https://discordapp.com/api/webhooks/902888402368733195/81mnlq7-s2ctZcp2vV0YZHw8GA0lI6pc_VPlbUau2EVi6t0TB_gLzFtA48Ctuq4bLARN", --> Unbans
}

--> Anti turn off

PS.TurnOff = true --> Highly recommended, this will make it so people cannot turn off the anticheat clientside.
--> OBS; this could ban players who crash!!!
PS.AntiTurnOffWaitTime = 10000 --> How often should it check if the anticheat is on (Default: 5000)
PS.MaxTime = 10000 --> Max time for the client to respond

--> Serverside Protections

PS.TooFastVehicle = true --> If you wish to disable ramming with vehicle through mod menu.
PS.VehicleMaxSpeed = 100.0 --> Max Velocity for cars getting spawned (Default: 100)

--> Limits

PS.LimitPeds = false --> Limit ped spawns
PS.WhitelistPeds = false --> If you wish to have whitelisted peds that wont count for the limit, set this in the blacklist file!
PS.MaxPeds = 50 --> Max peds of one sort

PS.LimitVehicles = false
PS.WhitelistVehicles = false --> If you wish to have whitelisted vehicles that wont count for the limit, set this in the blacklist file!
PS.MaxVehicles = 50 --> Max vehicles of one sort

PS.LimitObjects = true
PS.WhitelistObjects = false --> If you wish to have whitelisted objects that wont count for the limit, set this in the blacklist file!
PS.MaxObjects = 20 --> Max objects of one sort

PS.LimitParticles = true --> Limit particles?
PS.ParticleLimit = 2 --> Max particles per user within limit

PS.LimitKills = true
PS.KillLimit = 5

PS.AntiSpamEvents = true --> If this is true, it will keep watch on the events below and see if they are spammed.
--> It is resetted at the same time with other limits!
PS.SpamEventsLimit = 3 --> If it exceeds this number within the timer LimitClear.
PS.LimitEvents = {
    "taxi:reward" -- Example of one event that you need to limit check.
}

PS.LimitClear = 10000 --> Time in ms to clear the above tables.

PS.Explosions = true --> Detect Explosions?
PS.LimitExplosions = 3 --> Set to false if you dont want this, otherwise set the limit.
PS.BlacklistExplosions = true --> Blacklist Explosion Types? If so, remember to switch which explosions are blacklisted in the server/blacklist file!
PS.AntiInvisExplosions = true --> Detect invisible explosions?
PS.AntiSilentExplosions = true --> Anti silent explosions?

PS.AntiBlacklistedMessages = true --> Remember to switch which Messages are blacklisted in the server/blacklist file!
PS.AntiBlacklistedTriggers = true --> Remember to switch which triggers are blacklisted in the server/blacklist file!
PS.AntiFakeMessages = true --> See if player tries to send a message with a different name.
PS.AntiBlacklistedMessengers = true --> See if a player tries to send a message with a blacklisted name, remember to switch blacklisted names in the server/blacklist file!
PS.BlacklistVehicles = true --> Blacklist Vehicles? If so, remember to change in the server/blacklist file!
PS.BlacklistProps = true --> Blacklist Props? If so, remember to change in the server/blacklist file!
PS.BlacklistPeds = true --> Blacklist Peds? If so, remember to change in the server/blacklist file!

PS.CannotGiveWeapon = true --> Check if player is giving a weapon to another player through mods.
PS.AntiRemoveWeapon = true --> Disable removing other players weapons

PS.CannotCancelOtherEvent = true --> Disable players from clearing eachothers tasks (kick eachother from vehicle etc.)
PS.CancelOtherImmediatelyOnly = true --> ^ Only if its ClearPedTasksImmidiately and not both.

-- If you use any of these, please set them to true otherwise false!
PS.UsingQalleJail = true
PS.UsingESXJailer = true
PS.UsingJSJail = true

-- If you use ESX, I recommend turning this on:
--> Not tested performance, please check the impact!
PS.CheckHasWeaponESX = true --> Checks if you have the weapon you are damaging with.

PS.AntiVPN = true --> Disable vpns?
PS.VPNLogMessage = "Player Using VPN."
PS.Connecting = "Checking your connection..."
PS.VPNKicked = "You seem to have a VPN, turn it off and try again."

PS.BannedTitle = "You have been banned from this server!"

PS.PicLog = true --> Take screenshot when sending to discord / banning someone
PS.PicOnBan = true --> Show the picture in ban
PS.WaitPicBan = 2000 --> Recommended over 2000 so that the picture actually gets taken before they get banned, set to 0 if you dont have pictures enabled.

PS.ScreenShotAutomatic = false --> Screenshot everyone and send to discord every x seconds?
PS.ScreenShotTimer = 600 --> How much time until it screenshots everyone again (IN SECONDS)?
PS.ScrenShotWebhook = ""

PS.AeroUnbanCommand = "ADUnban" --> Command for unbanning!
PS.AeroReloadCommand = "ADReload" --> Command for reloading banlist, if you unban through sql etc.
--> Admin

PS.ClearVehiclesCommand = "Clearveh" --> nil = disabled, if you want to enable just put the command name instead of nil.
PS.ClearPedsCommand = "Clearped" --> nil = disabled, if you want to enable just put the command name instead of nil.
PS.ClearPropsCommand = "Clearprops" --> nil = disabled, if you want to enable just put the command name instead of nil.

PS.ClearMapAutomatic = true --> Clear the following automatically?
PS.ClearMapTimer = 60 --> Timer for automatic clear, in seconds.
PS.ClearVehicles = false --> Clear the vehicles automatically?
PS.ClearPeds = true --> Clear the peds automatically?
PS.ClearProps = true --> Clear the props automatically?

PS.AntiSoloSession = false --> No solo sessions (Enable this in client config aswell)
PS.SoloKickOnly = false --> Only kick for solo sessions
PS.SoloKickMessage = "You have been kicked for being in a solo session!" --> If only kick, what is the kick message

PS.AdminBypass = true --> Admins won't be affected by anticheat at all if set to true
--> Add admins here with HexID, follow the example.
PS.Admins = {

    --> Example, the functions under the hex are what they can or can not bypass (When you copy, don't forget the commas or to increase the number.)
    --> The functions that aren't for banning or other stuff is if they have access to it, for example ClearPropsCommand.
    [1] = {
        Hex = "STEAMHEXHERE",
        --> You could also create bypass groups, for example Bypass = AdminGroup and create a table at the bottom
        --> If you need help, create a ticket and ask.
        Bypass = {
            Everything = true, --> If this is true, it will bypass everything listed
            ClearVehiclesCommand = true,
            ClearPedsCommand = true,
            ClearPropsCommand = true,
            AntiTurnOffSS = true,
            ESX = true,
            Godmode = true,
            SpeedHack = true,
            AntiSpec = true,
            AntiDmgModifier = true,
            OnScreenWordDetection = true,
            AntiNight = true,
            AntiThermal = true,
            AntiCheatEngine = true,
            AntiRagdoll = true,
            AntiBlips = true,
            AntiAimAssist2 = true,
            AntiMenyoo = true,
            AntiPedChange = true,
            AntiLicenseClears = true,
            AntiExplosiveBullets = true,
            AntiRadar = true,
            AntiInfiniteStamina = true,
            AntiNoclip = true,
            AntiInvisibility = true,
            VehMod = true,
            Devtools = true,
            BlockTiny = true,
            AntiHS = true,
            AntiFree = true,
            AntiSpawnNotScript = true,
            AntiArmour = true,
            AntiFlying = true,
            AmmoWarning = true,
            BlacklistCommands = true,
            BlacklistWeapons = true,
            AntiBlacklistedTasks = true,
            AntiAnimations = true,
            NoNamedPtfx = true,
            TextDict = true,
            BlacklistKeys = true,
            TooFastVehicle = true,
            SuperJump = true,
            LimitPeds = true,
            LimitVehicles = true,
            LimitObjects = true,
            LimitParticles = true,
            LimitKills = true,
            AntiSpamEvents = true,
            LimitExplosions = true,
            BlacklistExplosions = true,
            AntiInvisExplosions = true,
            AntiSilentExplosions = true,
            AntiBlacklistedMessages = true,
            AntiBlacklistedTriggers = true,
            AntiFakeMessages = true,
            AntiBlacklistedMessengers = true,
            BlacklistVehicles = true,
            BlacklistProps = true,
            BlacklistPeds = true,
            CannotGiveWeapon = true,
            AntiRemoveWeapon = true,
            AntiSoloSession = true,
            CannotCancelOtherEvent = true,
            CheckHasWeaponESX = true,
            OtherJail = true,
            InjectionBan = true,
            TurnOff = true,
            AeroUnban = true, -- Allowed to unban?
            ClientSide = true, -- If this is true, it will skip the entire client side of anticheat for this player.
        }
    },
}

PS.ESXAdmins = false --> Import admins from es_admin2 aswell, otherwise only table above^
PS.ESXAdminsBypass = {
    Everything = true, --> If this is true, it will bypass everything listed
    ClearVehiclesCommand = true,
    ClearPedsCommand = true,
    ClearPropsCommand = true,
    AntiTurnOffSS = true,
    ESX = true,
    Godmode = true,
    SpeedHack = true,
    AntiSpec = true,
    AntiDmgModifier = true,
    OnScreenWordDetection = true,
    AntiNight = true,
    AntiThermal = true,
    AntiCheatEngine = true,
    AntiRagdoll = true,
    AntiBlips = true,
    AntiAimAssist2 = true,
    AntiMenyoo = true,
    AntiPedChange = true,
    AntiLicenseClears = true,
    AntiExplosiveBullets = true,
    AntiRadar = true,
    AntiInfiniteStamina = true,
    AntiNoclip = true,
    AntiInvisibility = true,
    VehMod = true,
    Devtools = true,
    BlockTiny = true,
    AntiHS = true,
    AntiFree = true,
    AntiSpawnNotScript = true,
    AntiArmour = true,
    AntiFlying = true,
    AmmoWarning = true,
    BlacklistCommands = true,
    BlacklistWeapons = true,
    AntiBlacklistedTasks = true,
    AntiAnimations = true,
    NoNamedPtfx = true,
    TextDict = true,
    BlacklistKeys = true,
    TooFastVehicle = true,
    SuperJump = true,
    LimitPeds = true,
    LimitVehicles = true,
    LimitObjects = true,
    LimitParticles = true,
    LimitKills = true,
    AntiSpamEvents = true,
    LimitExplosions = true,
    BlacklistExplosions = true,
    AntiInvisExplosions = true,
    AntiSilentExplosions = true,
    AntiBlacklistedMessages = true,
    AntiBlacklistedTriggers = true,
    AntiFakeMessages = true,
    AntiBlacklistedMessengers = true,
    BlacklistVehicles = true,
    BlacklistProps = true,
    BlacklistPeds = true,
    CannotGiveWeapon = true,
    AntiRemoveWeapon = true,
    AntiSoloSession = true,
    CannotCancelOtherEvent = true,
    CheckHasWeaponESX = true,
    OtherJail = true,
    InjectionBan = true,
    TurnOff = true,
    AeroUnban = true, -- Allowed to unban?
    ClientSide = true, -- If this is true, it will skip the entire client side of anticheat for this player.
}

--> See here for warn or ban function, if you place a component to true it will ban, otherwise only warn to server!
PS.BanWarn = {
    TooFastVehicle = true,
    SuperJump = true,
    LimitPeds = true,
    LimitVehicles = true,
    LimitObjects = true,
    LimitParticles = true,
    LimitKills = true,
    AntiSpamEvents = true,
    LimitExplosions = true,
    BlacklistExplosions = true,
    AntiInvisExplosions = true,
    AntiSilentExplosions = true,
    AntiBlacklistedMessages = true,
    AntiBlacklistedTriggers = true,
    AntiFakeMessages = true,
    AntiBlacklistedMessengers = true,
    BlacklistVehicles = true,
    BlacklistProps = true,
    BlacklistPeds = true,
    CannotGiveWeapon = true,
    AntiRemoveWeapon = true,
    AntiSoloSession = true,
    CannotCancelOtherEvent = true,
    CheckHasWeaponESX = true,
    TurnOff = true,
    OtherJail = true, --Recommended true, check so it doesn't use the same jail as you!
}

--> These are all the language settings, there is nothing in the script (language wise) that you can not switch!
PS.EnableStartupMessages = true --> Enable startup messages
PS.StartUpMessages = {
    Init = "ᴀᴄ ɪɴᴛɪᴀʟɪᴢɪɴɢ...",
    InitReady = "ᴀᴄ ɪɴᴛɪᴀʟɪᴢᴇᴅ & ʀᴇᴀᴅʏ",
    BlacklistedMessages = "ʟᴏᴀᴅᴇᴅ ʙʟᴀᴄᴋʟɪsᴛᴇᴅ ᴍᴇssᴀɢᴇs",
    BlacklistedVehicles = "ʟᴏᴀᴅᴇᴅ ʙʟᴀᴄᴋʟɪsᴛᴇᴅ ᴠᴇʜɪᴄʟᴇs",
    BlacklistedPeds = "ʟᴏᴀᴅᴇᴅ ʙʟᴀᴄᴋʟɪsᴛᴇᴅ ᴘᴇᴅs",
    BlacklistedNames = "ʟᴏᴀᴅᴇᴅ ʙʟᴀᴄᴋʟɪsᴛᴇᴅ ɴᴀᴍᴇs",
    BlacklistedProps = "ʟᴏᴀᴅᴇᴅ ʙʟᴀᴄᴋʟɪsᴛᴇᴅ ᴘʀᴏᴘs",
    BlacklistedExplosions = "ʟᴏᴀᴅᴇᴅ ᴇxᴘʟᴏsɪᴏɴ sᴇᴛᴛɪɴɢs",
    BlacklistedTriggers = "ʟᴏᴀᴅᴇᴅ ʙʟᴀᴄᴋʟɪsᴛᴇᴅ ᴛʀɪɢɢᴇʀs",
    ClearingVehicles = "ᴄʟᴇᴀʀɪɴɢ ᴠᴇʜɪᴄʟᴇs..",
    ClearingPeds = "ᴄʟᴇᴀʀɪɴɢ ᴘᴇᴅs..",
    ClearingObjects = "ᴄʟᴇᴀʀɪɴɢ ᴏʙᴊᴇᴄᴛs..",

}
--> Messages for different stuff
PS.MessagesBan = {
    TooFastVehicle = "You have been caught using Ram Modification, discord.gg/g2FFfWUSeF",
    SuperJump = "You have been caught using Super Jump, discord.gg/g2FFfWUSeF",
    LimitPeds = "You have been caught Spamming Peds, discord.gg/g2FFfWUSeF",
    LimitVehicles = "You have been caught Spamming Vehicles, discord.gg/g2FFfWUSeF",
    LimitObjects = "You have been caught Spamming Props, discord.gg/g2FFfWUSeF",
    LimitParticles = "You have been caught Spamming Particles, discord.gg/g2FFfWUSeF",
    LimitKills = "You have been caught Spamkilling, discord.gg/g2FFfWUSeF",
    AntiSpamEvents = "You have been caught Spamming a specific event, discord.gg/g2FFfWUSeF",
    LimitExplosions = "You have been caught Spamming Explosions, discord.gg/g2FFfWUSeF",
    BlacklistExplosions = "You have been caught using a Blacklisted Explosion, discord.gg/g2FFfWUSeF",
    AntiInvisExplosions = "You have been caught using an Invisible Explosion, discord.gg/g2FFfWUSeF",
    AntiSilentExplosions = "You have been caught using a Silent Explosion, discord.gg/g2FFfWUSeF",
    AntiBlacklistedMessages = "You have been caught posting a Blacklisted Message, discord.gg/g2FFfWUSeF",
    AntiBlacklistedTriggers = "You have been caught using a Blacklisted Trigger, discord.gg/g2FFfWUSeF",
    AntiFakeMessages = "You have been caught posting with a Fake Name, discord.gg/g2FFfWUSeF",
    AntiBlacklistedMessengers = "You have been caught posting with a Blacklisted Name, discord.gg/g2FFfWUSeF",
    BlacklistVehicles = "You have been caught using a Blacklisted Vehicle, discord.gg/g2FFfWUSeF,",
    BlacklistProps = "You have been caught spawning a Blacklisted Prop, discord.gg/g2FFfWUSeF,",
    BlacklistPeds = "You have been caught spawning a Blacklisted Ped, discord.gg/g2FFfWUSeF,",
    CannotGiveWeapon = "You have been caught giving a weapon, discord.gg/g2FFfWUSeF",
    AntiRemoveWeapon = "You have been caught removing a weapon, discord.gg/g2FFfWUSeF",
    AntiSoloSession = "You have been caught being in a solo session, discord.gg/g2FFfWUSeF",
    CannotCancelOtherEvent = "You have been caught cancelling other player's weapon, discord.gg/g2FFfWUSeF",
    CheckHasWeaponESX = "You have been caught shooting a weapon that you did not have, discord.gg/g2FFfWUSeF",
    OtherJail = "You have been caught trying to manipulate the jail system, discord.gg/g2FFfWUSeF",
    AntiInjection = "Nice try, you have been caught trying to inject mods.",
    TurnOff = "Nice try, you have been caught trying to turn off the Anticheat."
}

PS.MessagesWarn = {
    TooFastVehicle = "Player ramming with mods.",
    SuperJump = "Player using Super Jump.",
    LimitPeds = "Spamming Peds.",
    LimitVehicles = "Spamming Vehicles.",
    LimitObjects = "Spamming Objects.",
    LimitParticles = "Spamming Particles.",
    LimitKills = "Player spamkilling.",
    AntiSpamEvents = "Spamming event.",
    LimitExplosions = "Spamming Explosions.",
    BlacklistExplosions = "Player using Blacklisted Explosion.",
    AntiInvisExplosions = "Player using an invisible Explosion.",
    AntiSilentExplosions = "Player using silent Explosion.",
    AntiBlacklistedMessages = "Player posted a Blacklisted Message.",
    AntiBlacklistedTriggers = "Player using a Blacklisted Trigger.",
    AntiFakeMessages = "Player posted with a Fake Name.",
    AntiBlacklistedMessengers = "Player posted a Blacklisted Message.",
    BlacklistVehicles = "Player using a Blacklisted Vehicle.",
    BlacklistProps = "Player spawned a Blacklisted Prop.",
    BlacklistPeds = "Player spawned a Blacklisted Ped",
    CannotGiveWeapon = "Player spawned a weapon.",
    AntiRemoveWeapon = "Player despawned a weapon.",
    AntiSoloSession = "Player in a solo session.",
    CannotCancelOtherEvent = "Player cleared other player's events.",
    CheckHasWeaponESX = "Player shot with weapon they did not have.",
    OtherJail = "Player manipulated jail system.",
    AntiInjection = "Player tried to inject.",
    TurnOff = "Player tried to close AeroDefence."
} 

PS.BanSystemMessages = {
    permanently = "Permanently.",
    ford = "for:", --> duration
    Yes = "Yes",
    No = "No",
    start = "^0| ^4ᴘʟᴀɴᴇ ᴅᴇᴠᴇʟᴏᴘᴇᴍᴇɴᴛs ^0| Bansystem & Banlist have both loaded in succesfully.",
    starterror = "^0| ^4ᴘʟᴀɴᴇ ᴅᴇᴠᴇʟᴏᴘᴇᴍᴇɴᴛs ^0| ^1!Bansystem or Banlist have NOT loaded in succesfully!^7",
    banlistloaded = "^0| ^4ᴘʟᴀɴᴇ ᴅᴇᴠᴇʟᴏᴘᴇᴍᴇɴᴛs ^0| ʙᴀɴʟɪsᴛ ʜᴀs sᴜᴄᴄᴇssfᴜʟʟʏ ʟᴏᴀᴅᴇᴅ ɪɴ, ᴛᴏᴛᴀʟ ʙᴀɴs:",
    loaderror     = "^0| ^4ᴘʟᴀɴᴇ ᴅᴇᴠᴇʟᴏᴘᴇᴍᴇɴᴛs ^0| ERROR: The BanList failed to load.",
	isban         = " was banned",
    Already       = "No (Already banned)",
    NoPerm        = "You do not have permission to do this",
    Invalid        = "Invalid BanID",
	isunban       = " was unbanned",
	yourban       = "You have been banned for: ",
	yourpermban   = "You have been permanently banned for the following reason: ",
	youban        = "You are banned from this server for: ",
	forr          = " days. For: ",
	permban       = " permanently for: ",
	by            = "by",
	reason        = "Reason for ban",
    BanInfo       = "Original ban info:",
    Console       = "Console",
    invalidsteam  = "You need to connect with Steam opened.",
    invaliddiscord = "You need to connect with Discord opened."
}

PS.ExtraInfo = true --> Show extra info about player offense in Discord? For example it will show explosion information when they trigger something to do with explosions
PS.Extra = {
    VehMod = "Vehicle Modifier:",
    AntiBlacklistedMessages = "Blacklisted Message:",
    AntiInvisExplosions = "Explosion info:", 
    AntiSilentExplosions = "Explosion info:",
    BlacklistExplosions = "Explosion info:",
    AntiBlacklistedTriggers = "Trigger:",
    AntiFakeMessages = "Fake Name:",
    AntiSpamEvents = "Event:",
    AntiBlacklistedMessengers = "Blacklisted Name:",
    BlacklistVehicles = "Blacklisted Vehicle:",
    BlacklistProps = "Blacklisted Prop:",
    BlacklistPeds = "Blacklisted Ped",
    CannotGiveWeapon = "Extra Info:", CannotCancelOtherEvent = "Extra Info:",
    CheckHasWeaponESX = "Weapon:",
    OtherJail = "Jail System:",
    SpeedHack = "Speed:",
    BlacklistWeapons = "Blacklisted Weapon:",
    BlacklistCommands = "Blacklisted Command:",
    AntiArmour = "Armor Amount:",
    AntiDmgModifier = "Damage Modifier:",
    OnScreenWordDetection = "Word detected:",
    BlacklistKeys = "Blacklisted Key:",
    AntiAnimations = "Blacklisted Animation:",
    NoNamedPtfx = "Blacklisted PTFX:",
    AntiSpawnNotScript = "Info:",
    TextDict = "Texture Dict:",
    AntiBlacklistedTasks = "Blacklisted Task:",
    InjectionBan = "Injection Info:",
    TriggerWatcher = "Information:",
    --> Discord log text:
    Steam = "Steam:",
    SteamLink = "SteamProfile:",
    Rockstar = "Rockstar:",
    DiscordId = "Discord ID:",
    DiscordPing = "Discord @:",
    BanID = "BanID",
    Banned = "Banned?",
    IP = "IP:",
    Issued = "Issued By:",
    OriginalReason = "Ban Reason:",
    Image = "Original Image:",
    FImage = "Full Image",
}

PS.AntiInjectMessages = true --> Messages about antiinject when installing? (Will print every single resource that it skips / installs / uninstalls in)
PS.AntiInjectM = {
    Installationfinished1 = "^2[Plane-AC] Installation has finished. Succesfully installed Anti-Injection in ", Installationfinished2 = " Resources. Skipped: ", Installationfinished3 = " Resources. Enjoy!",
    SkippedRes = "^3[Plane-AC]: Skipped Resource: ",
    AlreadyExist = "(Already exists)",
    Installed = "^2[Plane-AC]: Anti Injection Installed in ",
    Uninstallationfinished1 = "^1[Plane-AC] UNINSTALLATION has finished. Succesfully uninstalled Anti-Injection in ", 
    Doesnt = "(Doesn't Exist)",
    UnInstalled = "^1[Plane-AC]: Anti Injection Uninstalled in "
}


-- Ban Card:
PS.WaitCard = 1500 --> Change this to a higher value if the ban card doesn't pop up or doesn't stay. (Default: 1500)
PS.BanIMG = "https://agiltec.se/wp-content/uploads/blank-profile-picture-973460_640.png" --> Ban Card Logo
PS.BanName = "Adastra" --> Name beside logo, recommended servername
PS.AppealMessage = "https/discord.gg/g2FFfWUSeF" --> Text under name, recommend discord URL or website for appeal.
PS.BanIDText = "Enjoy your VACation! 🏝️ | Ban-ID:"


PS.AntiInjectFileName = "Adastra.lua" --> PLEASE CHANGE THIS AFTER UNINSTALLING / BEFORE INSTALLING OTHERWISE IT WILL BE FUCKED!
PS.table = "planeac" --> TABLE NAME IN SQL; SWITCH THERE ASWELL!
--> IF YOU DONT KNOW WHAT YOURE DOING, TRY TO NOT PLAY WITH THESE FUNCTIONS!