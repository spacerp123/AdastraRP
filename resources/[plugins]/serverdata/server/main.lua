local Server = GetConvar('sv_type', 'FA')
local Servers = {
	['DEV'] = {
		webhookkkkkk = "",
		drugs = {
			WeedField = vector3(-124.086, 2791.240, 53.107),
			WeedProcessing = vector3(-1146.794, 4940.908, 222.26),
			WeedDealer = vector3(-1165.25, -1566.83, 4.45),
			CokeField = vector3(-106.441, 1910.979, 196.936),
			CokeProcessing = vector3(722.438, 4190.06, 41.09),
			CokeDealer = vector3(724.99, -1189.87, 24.27),
			MethField = vector3(2434.164, 4969.4897, 42.347),
			MethProcessing = vector3(1391.541, 3603.589, 38.941),
			MethDealer = vector3(-1146.794, 4940.908, 222.268),
			OpiumField = vector3(1444.35, 6332.3, 23.96),
			OpiumProcessing = vector3(2165.724, 3379.376, 46.43),
			OpiumDealer = vector3(3817.0505, 4441.494, 2.810)
		}
	},
	['FA'] = {
		webhookkkkkk = "https://discord.comm/api/webhooks/845956498583584778/TXiqepCdvkhoVW1jmlIac8WbSJ1KJXxv-akvDxShwsSx7-CrHWyo0s0sa9BBz6uOQHtk",
		drugs = {
			WeedField = vector3(2221.92, 5575.87, 53.62), -- Marche
			WeedProcessing = vector3(618.87, 2785.58, 43.48), -- Marche
			WeedDealer = vector3(2123.14, 4785.17, 40.97), -- Marche -- Fin opium
			CokeField = vector3(-2175.26, 4287.46, 49.09), -- Marche
			CokeProcessing = vector3(-2550.98, 2301.42, 33.21), -- Marche
			CokeDealer = vector3(186.46, 2786.97, 45.95), -- Marche
			MethField = vector3(1336.64, 4388.51, 45.03),
			MethProcessing = vector3(726.57, 4170.84, 40.71),
			MethDealer = vector3(1601.0, 3588.24, 39.77),
			OpiumField = vector3(2329.78, 2571.49, 46.68),
			OpiumProcessing = vector3(173.78, 2778.69, 46.08),
			OpiumDealer = vector3(1997.18, 3038.56, 47.03)
		}
	},
	['WL'] = {
		webhookkkkkk = "",
		drugs = {
			WeedField = vector3(-2939.7504, 590.7938, 23.9843),
			WeedProcessing = vector3(9.1790, 52.8179, 71.6338),
			WeedDealer = vector3(-1165.25, -1566.83, 4.45),
			CokeField = vector3(1395.05, 3613.95, 34.98),
			CokeProcessing = vector3(8.7506, -243.1087, 55.8605),
			CokeDealer = vector3(-289.3043, -1080.6926, 23.0211),
			MethField = vector3(-1000.0, -1000.0, -1000.0),
			MethProcessing = vector3(-1000.0, -1000.0, -1000.0),
			MethDealer = vector3(-1000.0, -1000.0, -1000.0),
			OpiumField = vector3(-1000.0, -1000.0, -1000.0),
			OpiumProcessing = vector3(-1000.0, -1000.0, -1000.0),
			OpiumDealer = vector3(-1000.0, -1000.0, -1000.0)
		}
	}
}

exports('GetData', function(key)
	return Servers[Server][key]
end)