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
function private:InitializeFirstAidTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(2326, "Thamner Pol", "Dun Morogh", 47.2, 52.6, "Alliance")
	AddTrainer(2327, "Shaina Fuller", "Stormwind City", 52.9, 44.8, "Alliance")
	AddTrainer(2329, "Michelle Belle", "Elwynn Forest", 43.4, 65.6, "Alliance")
	AddTrainer(2798, "Pand Stonebinder", "Thunder Bluff", 29.4, 21.5, "Horde")
	AddTrainer(3181, "Fremal Doohickey", "Wetlands", 10.8, 61.3, "Alliance")
	AddTrainer(4211, "Dannelor", "Darnassus", 51.7, 12.6, "Alliance")
	AddTrainer(4591, "Mary Edras", "Undercity", 73.5, 54.8, "Horde")
	AddTrainer(5150, "Nissa Firestone", "Ironforge", 54, 57.8, "Alliance")
	AddTrainer(5759, "Nurse Neela", "Tirisfal Glades", 61.8, 52.8, "Horde")
	AddTrainer(5939, "Vira Younghoof", "Mulgore", 46.8, 60.8, "Horde")
	AddTrainer(5943, "Rawrk", "Durotar", 54.1, 42, "Horde")
	AddTrainer(6094, "Byancie", "Teldrassil", 55.3, 56.8, "Alliance")
	AddTrainer(16272, "Kanaria", "Eversong Woods", 48.5, 47.6, "Horde")
	AddTrainer(16662, "Alestus", "Silvermoon City", 77.6, 71.3, "Horde")
	AddTrainer(16731, "Nus", "The Exodar", 39, 22.5, "Alliance")
	AddTrainer(17214, "Anchorite Fateema", "Azuremyst Isle", 48.5, 51.8, "Alliance")
	AddTrainer(17424, "Anchorite Paetheus", "Bloodmyst Isle", 54.7, 54, "Alliance")
	AddTrainer(18990, "Burko", "Hellfire Peninsula", 22.4, 39.3, "Alliance")
	AddTrainer(18991, "Aresella", "Hellfire Peninsula", 26.3, 62, "Horde")
	AddTrainer(19184, "Mildred Fletcher", "Shattrath City", 66.5, 13.5, "Neutral")
	AddTrainer(19478, "Fera Palerunner", "Blade's Edge Mountains", 53.7, 55, "Horde")
	AddTrainer(22477, "Anchorite Ensham", "Terokkar Forest", 30.8, 75.9, "Neutral")
	AddTrainer(23734, "Anchorite Yazmina", "Howling Fjord", 59.5, 62.3, "Alliance")
	AddTrainer(26956, "Sally Tompkins", "Howling Fjord", 79.4, 29.4, "Horde")
	AddTrainer(26992, "Brynna Wilson", "Borean Tundra", 57.8, 66.5, "Alliance")
	AddTrainer(28706, "Olisarra the Kind", "Dalaran", 37.5, 36.7, "Neutral")
	AddTrainer(29233, "Nurse Applewood", "Borean Tundra", 41.7, 54.5, "Horde")
	AddTrainer(33589, "Joseph Wilson", "Icecrown", 71.5, 22.5, "Neutral")
	AddTrainer(33621, 45542, "Shattrath City", 43.6, 90.4, "Neutral")
	AddTrainer(45540, "Krenk Choplimb", "Orgrimmar", 37.5, 87.3, "Horde")
	AddTrainer(49879, "Doc Zapnozzle", "Azshara", 57.07, 50.71, "Horde")
	AddTrainer(50574, "Amelia Atherton", "Gilneas", 36.8, 65.7, "Alliance")

	self.InitializeFirstAidTrainers = nil
end
