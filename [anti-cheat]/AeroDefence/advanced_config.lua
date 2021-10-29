--[[
#############################################################################################################  
    Welcome to the advanced config!
    These are server side functions which are on an advanced level, only enable these if you actually know what you are doing!!
#############################################################################################################
]]--

TriggerWatcher = {
    --> Trigger Watcher
    Enabled = false,
    Triggers = {
        --[[{ --EXAMPLE!
            Trigger = "esx_taxijob:reward",
            Webhook = "YOURWEBHOOKHERE",
            Log = {
                Always = true,
                Message = "Player took a taxi job reward!"
            },
            BanOnEvent = { -- fake event?
                Enabled = false,
                LogMessage = "Player used a fake event: esx_taxijob:reward!",
                BanMessage = "You were caught using a fake event!"
            },
            ESXAdminsOnly = { --> Only ESX Admins can use this?
                Enabled = false,
                Log = false, 
                LogMessage = "Player using admin event without being admin!",
                Ban = false,
                BanMessage = "You were caught using an event without the required group!",
                GroupsAllowed = {
                    "mod",
                    "admin",
                    "superadmin"
                }
            },
            ESXJobLock = {
                Enabled = false,
                Log = false,
                LogMessage = "Player using job event without having the job!",
                Ban = false,
                BanMessage = "You were caught using an event without the required job!",
                JobsAllowed = {
                    "taxi"
                }
            },
            Arguments = {
                {
                    Name = "RewardMoney",
                    Log = true, --> Needs to have logalways set to true!
                    Limit = {
                        LimitMinimum = 10000,
                        LimitMaximum = 10000,
                        BanOnLimit = true,
                        LogOnLimit = true,
                        MessageOnBan = "You have been banned for trying to spawn money!",
                        LogsMessage = "Player has used this reward with incorrect limits."
                    }
                },
                {
                    Name = "OtherArgument",
                    Log = true, --> Needs to have logalways set to true!
                    Limit = nil
                },
            }
        }]]--
    }
}

--> TimeAt must be in 24 hour format! For example 6:30 pm will be 18:30.
--> Available actions = Stop, Start, Restart
ScriptManager = {
    Enabled = false,
    Scripts = {
        --[[{
            ScriptName = "esx_policejob",
            Automations = {
                {Action = "Start", TimeAt = "20:05", LogThis = true},
                {Action = "restart", TimeAt = "20:10", LogThis = true},
            },
            Webhook = "YOURWEBHOOKHERE",
        }]]
    }
}

