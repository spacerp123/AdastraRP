-- ###########################################################################
-- ###                                                                       #
-- ###                                                                       #
-- ###                                                                       #
-- ###                           NeoLand RP !!!                              #
-- ###                          discord.gg/g2FFfWUSeF                        #
-- ###                                                                       #
-- ###                                                                       #
-- ###                                                                       #
-- ############################################################################fx_version 'bodacious'
game 'gta5'

this_is_a_map 'yes'

client_script('client/main.lua')

files({
	'timecycle_mods_1.xml'
})

data_file('TIMECYCLEMOD_FILE')('timecycle_mods_1.xml')

data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta'
}

client_script {
    "gabz_mrpd_entitysets.lua"
}

client_script '@protect/xDxDxDxDxD.lua'