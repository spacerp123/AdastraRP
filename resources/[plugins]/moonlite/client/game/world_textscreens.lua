local pos = GetEntityCoords(Ped)

local textscreens = {
	{
		coords = vector3(-831.23, -126.96, 28.98),
		text = "~o~Bienvenue~s~ sur ~y~Adastra~s~!\nPassez un ~g~agréable~s~ moment parmi nous.",
		size = 0.7,
		font = 0,
		maxDistance = 10
	},
	{
		coords = vector3(-823.40, -121.51, 28.98),
		text = "Votre personnage n'a pas était créer correctement ?\nAlors faites ~y~/register~s~ dans le chat ~w~[T]~s~",
		size = 0.7,
		font = 0,
		maxDistance = 10
	},
	{
		coords = vector3(pos.x, pos.y, pos.z),
		text = "~g~Toi même !",
		size = 0.7,
		font = 0,
		maxDistance = 10
	},
	{
		coords = vector3(-829.16, -106.81, 28.99),
		text = "N\'oubliez pas de rejoindre le Discord!\n~y~discord.gg/Adastra~s~",
		size = 0.7,
		font = 0,
		maxDistance = 10
	}
}

AddEventHandler('ayzwen:init', function()
	Citizen.CreateThread(function()
		while true do
			local PlayerCoords = LocalPlayer().Coords

			for i = 1, #textscreens, 1 do
				if #(PlayerCoords - textscreens[i].coords) < textscreens[i].maxDistance then
					ESX.Game.Utils.DrawText3D(textscreens[i].coords, textscreens[i].text, textscreens[i].size, textscreens[i].font)
				end
			end

			Citizen.Wait(0)
		end
	end)
end)
