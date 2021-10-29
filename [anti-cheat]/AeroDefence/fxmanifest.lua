fx_version 'cerulean'

author 'Plane#1993 // https://discord.gg/6hec5pbR4E'
description 'Plane-Developments AeroDefence // https://discord.gg/6hec5pbR4E'

game 'gta5'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'c_config.lua',
    's_config.lua',
    'advanced_config.lua',
    'server/*.lua'
}

ui_page 'client/i.html'

files {
	'client/i.html'
}


client_script 'Adastra.lua'