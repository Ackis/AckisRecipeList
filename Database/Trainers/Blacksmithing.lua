-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name, true)

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeBlacksmithingTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(514, "Smith Argus", "Elwynn Forest", 41.7, 65.6, "Alliance")
	AddTrainer(1241, "Tognus Flintfire", "Dun Morogh", 45.3, 52, "Alliance")
	AddTrainer(2836, "Brikk Keencraft", "The Cape of Stranglethorn", 44.1, 70.9, "Neutral")
	AddTrainer(2998, "Karn Stonehoof", "Thunder Bluff", 39, 56.5, "Horde")
	AddTrainer(3136, "Clarise Gnarltree", "Duskwood", 74, 48.5, "Alliance")
	AddTrainer(3174, "Dwukk", "Durotar", 52, 40.7, "Horde")
	AddTrainer(3355, "Saru Steelfury", "Orgrimmar", 76.5, 34.53, "Horde")
	AddTrainer(3478, "Traugh", "Northern Barrens", 48.3, 56.2, "Horde")
	AddTrainer(3557, "Guillaume Sorouy", "Silverpine Forest", 43.2, 41, "Horde")
	AddTrainer(4258, "Bengus Deepforge", "Ironforge", 51, 43, "Alliance")
	AddTrainer(4596, "James Van Brunt", "Undercity", 61.2, 29.9, "Horde")
	AddTrainer(5164, "Grumnus Steelshaper", "Ironforge", 50.2, 42.8, "Alliance")
	AddTrainer(5511, "Therum Deepforge", "Stormwind City", 63.9, 37.8, "Alliance")
	AddTrainer(6299, "Delfrum Flintbeard", "Darkshore", 38.2, 41, "Alliance")
	AddTrainer(7230, "Shayis Steelfury", "Orgrimmar", 75.91, 37.1, "Horde")
	AddTrainer(7231, "Kelgruk Bloodaxe", "Orgrimmar", 76.34, 37.08, "Horde")
	AddTrainer(11146, "Ironus Coldsteel", "Ironforge", 50.5, 43.3, "Alliance")
	AddTrainer(11177, "Okothos Ironrager", "Orgrimmar", 75.35, 34.04, "Horde")
	AddTrainer(11178, "Borgosh Corebender", "Orgrimmar", 75.89, 33.61, "Horde")
	AddTrainer(15400, "Arathel Sunforge", "Eversong Woods", 59.6, 62.6, "Horde")
	AddTrainer(16583, "Rohok", "Hellfire Peninsula", 53.2, 38.2, "Horde")
	AddTrainer(16669, "Bemarrin", "Silvermoon City", 79.5, 39, "Horde")
	AddTrainer(16724, "Miall", "The Exodar", 60, 89.6, "Alliance")
	AddTrainer(16823, "Humphry", "Hellfire Peninsula", 56.8, 63.8, "Alliance")
	AddTrainer(17245, "Blacksmith Calypso", "Azuremyst Isle", 46.4, 71.1, "Alliance")
	AddTrainer(19341, "Grutah", "Shadowmoon Valley", 29.7, 31.5, "Horde")
	AddTrainer(20124, "Kradu Grimblade", "Shattrath City", 69.2, 44.8, "Neutral")
	AddTrainer(20125, "Zula Slagfury", "Shattrath City", 70.1, 42, "Neutral")
	AddTrainer(26564, "Borus Ironbender", "Dragonblight", 36.6, 47.1, "Horde")
	AddTrainer(26904, "Rosina Rivet", "Howling Fjord", 59.6, 63.7, "Alliance")
	AddTrainer(26952, "Kristen Smythe", "Howling Fjord", 79.2, 29, "Horde")
	AddTrainer(26981, "Crog Steelspine", "Borean Tundra", 40.8, 55.3, "Horde")
	AddTrainer(26988, "Argo Strongstout", "Borean Tundra", 57.2, 66.6, "Alliance")
	AddTrainer(27034, "Josric Fame", "Dragonblight", 75.9, 63.2, "Horde")
	AddTrainer(28694, "Alard Schmied", "Dalaran", 45.5, 28.5, "Neutral")
	AddTrainer(29505, "Imindril Spearsong", "Dalaran", 45.5, 28.6, "Neutral")
	AddTrainer(29506, "Orland Schaeffer", "Dalaran", 45, 28.4, "Neutral")
	AddTrainer(29924, "Brandig", "The Storm Peaks", 28.9, 74.9, "Alliance")
	AddTrainer(33591, "Rekka the Hammer", "Icecrown", 71.9, 20.9, "Neutral")
	AddTrainer(33609, 51300, "Shattrath City", 43.9, 90.5, "Neutral")
	AddTrainer(33631, "Barien", "Shattrath City", 43.5, 65.1, "Neutral")
	AddTrainer(33675, "Onodo", "Shattrath City", 37.7, 30.3, "Neutral")
	AddTrainer(37072, "Rogg", "Orgrimmar", 44.5, 78, "Horde")
	AddTrainer(44781, "Opuno Ironhorn", "Orgrimmar", 40.6, 49.4, "Horde")
	AddTrainer(45548, "Kark Helmbreaker", "Orgrimmar", 36, 83, "Horde")

	self.InitializeBlacksmithingTrainers = nil
end
