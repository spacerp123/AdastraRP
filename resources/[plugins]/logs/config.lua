Config = {}

Config.AllLogs = true											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "Adastra" 							-- Bot Username
Config.avatar = "https://cdn.discordapp.com/attachments/902943940901224468/902953692892909608/image0.png"				-- Bot Avatar
Config.communtiyName = "Adastra"					-- Icon top of the Embed
Config.communtiyLogo = "https://cdn.discordapp.com/attachments/902943940901224468/902953692892909608/image0.png"		-- Icon top of the Embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.weaponLogDelay = 0		-- delay to wait after someone fired a weapon to check again in ms (put to 0 to disable) Best to keep this at atleast 1000

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs


-- Change color of the default embeds here
-- It used Decimal color codes witch you can get and convert here: https://jokedevil.com/colorPicker
Config.joinColor = "3447003" 		-- Player Connecting
Config.leaveColor = "15158332"		-- Player Disconnected
Config.chatColor = "10592673"		-- Chat Message
Config.shootingColor = "10373"		-- Shooting a weapon
Config.deathColor = "15158332"		-- Player Died
Config.resourceColor = "15461951"	-- Resource Stopped/Started



Config.webhook = {
	all = "https://discord.com/api/webhooks/898275969087971431/lacLQim9xnZjuSAduKWezFsqujcH08zU4SMaQ6YroOX05RJ63HOZU8rezYUPKmlYz63g",
	chat = "https://discord.com/api/webhooks/898267808394264626/cltjX-0OU45690tEuO6YOHSo1Ta4qyRsbShIOrqq38pWfE2Ha2XquWBnCSBFwI4sOd8r",
	joins = "https://discord.com/api/webhooks/898295851275915297/aygaryqusOxurmzi21atKrFHbQr7xWMelUQcgznmEx6ECZtDL6ee5VZxU_ZBLI9vhqWP",
	leaving = "https://discord.com/api/webhooks/898297562870726726/X7GxZAq9FWyY3Y3E2479saH3XS_X7EWuyA9lKovP9_IwirJ5-A4NOFD8bBpqgBefx-rd",
	deaths = "https://discord.com/api/webhooks/898298506597498921/rYdydmqtt0Hqhb8maQaReAqwroLwJ78aGRBXvS6alFqc2khzcgfTEnujJQ815uhJSLhV",
	shooting = "https://discord.com/api/webhooks/898282427640860713/O0kxtQYe-oOAofEBthijmwWYuhGj-LCD3o4MWTUBf4EiXW-LEL9JbLh_lyHmYKxEeagb",
	resources = "https://discord.com/api/webhooks/898298429090967655/LBHwhiQgXxKV1cnAz5IcHrPMy0_QXvo3_rQq51ZxWknjMY5UwnygdG5Dwqaonz68T2Gq",
  }


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.1.0"