fx_version('bodacious')
game('gta5')

dependency('es_extended')


client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'