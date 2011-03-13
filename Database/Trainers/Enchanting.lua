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
function private:InitializeEnchantingTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(1317, "Lucan Cordell", "Stormwind City", 53, 74.3, "Alliance")
	AddTrainer(3011, "Teg Dawnstrider", "Thunder Bluff", 45, 38, "Horde")
	AddTrainer(3345, "Godan", "Orgrimmar", 53.8, 38.5, "Horde")
	AddTrainer(3606, "Alanna Raveneye", "Teldrassil", 36.8, 34.2, "Alliance")
	AddTrainer(4213, "Taladan", "Darnassus", 58.6, 13.2, "Alliance")
	AddTrainer(4616, "Lavinia Crowe", "Undercity", 62.1, 60.5, "Horde")
	AddTrainer(5157, "Gimble Thistlefuzz", "Ironforge", 60, 45.4, "Alliance")
	AddTrainer(5695, "Vance Undergloom", "Tirisfal Glades", 61.7, 51.6, "Horde")
	AddTrainer(7949, "Xylinnia Starshine", "Feralas", 31.6, 44.3, "Alliance")
	AddTrainer(11072, "Kitta Firewind", "Elwynn Forest", 64.9, 70.6, "Alliance")
	AddTrainer(11073, "Annora", "Uldaman", 0, 0, "Neutral")
	AddTrainer(11074, "Hgarth", "Stonetalon Mountains", 49.2, 57.2, "Horde")
	AddTrainer(16160, "Magistrix Eredania", "Eversong Woods", 38.2, 72.6, "Horde")
	AddTrainer(16633, "Sedana", "Silvermoon City", 70, 24, "Horde")
	AddTrainer(16725, "Nahogg", "The Exodar", 40.5, 39.2, "Alliance")
	AddTrainer(18747, "Krugosh", "Hellfire Peninsula", 55.5, 37.6, "Horde")
	AddTrainer(18753, "Felannia", "Hellfire Peninsula", 52.3, 36.1, "Horde")
	AddTrainer(18773, "Johan Barnes", "Hellfire Peninsula", 53.7, 66.1, "Alliance")
	AddTrainer(19251, "Enchantress Volali", "Shattrath City", 43.2, 92.3, "Neutral")
	AddTrainer(19252, "High Enchanter Bardolan", "Shattrath City", 43.2, 92.2, "Neutral")
	AddTrainer(19540, "Asarnan", "Netherstorm", 44.2, 33.7, "Neutral")
	AddTrainer(26906, "Elizabeth Jackson", "Howling Fjord", 58.6, 62.8, "Alliance")
	AddTrainer(26954, "Emil Autumn", "Howling Fjord", 78.7, 28.3, "Horde")
	AddTrainer(26980, "Eorain Dawnstrike", "Borean Tundra", 41.2, 53.9, "Horde")
	AddTrainer(26990, "Alexis Marlowe", "Borean Tundra", 57.6, 71.6, "Alliance")
	AddTrainer(28693, "Enchanter Nalthanis", "Dalaran", 39.1, 40.5, "Neutral")
	AddTrainer(33583, "Fael Morningsong", "Icecrown", 73, 20.6, "Neutral")
	AddTrainer(33610, 51313, "Shattrath City", 43.6, 90.4, "Neutral")
	AddTrainer(33676, "Zurii", "Shattrath City", 36.4, 44.6, "Neutral")

	self.InitializeEnchantingTrainers = nil
end
