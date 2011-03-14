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
function private:InitializeJewelcraftingTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(15501, "Aleinia", "Eversong Woods", 48.5, 47.5, "Horde")
	AddTrainer(18751, "Kalaen", "Hellfire Peninsula", 56.8, 37.7, "Horde")
	AddTrainer(18774, "Tatiana", "Hellfire Peninsula", 54.6, 63.6, "Alliance")
	AddTrainer(19063, "Hamanar", "Shattrath City", 35.7, 20.5, "Neutral")
	AddTrainer(19539, "Jazdalaad", "Netherstorm", 44.5, 34, "Neutral")
	AddTrainer(19775, "Kalinda", "Silvermoon City", 90.5, 74.1, "Horde")
	AddTrainer(19778, "Farii", "The Exodar", 45, 24, "Alliance")
	AddTrainer(26915, "Ounhulo", "Howling Fjord", 59.9, 63.8, "Alliance")
	AddTrainer(26960, "Carter Tiffens", "Howling Fjord", 79.3, 28.8, "Horde")
	AddTrainer(26982, "Geba'li", "Borean Tundra", 41.6, 53.4, "Horde")
	AddTrainer(26997, "Alestos", "Borean Tundra", 57.5, 72.3, "Alliance")
	AddTrainer(28701, "Timothy Jones", "Dalaran", 40.5, 35.2, "Neutral")
	AddTrainer(33590, "Oluros", "Icecrown", 71.5, 20.8, "Neutral")
	AddTrainer(33614, 51311, "Shattrath City", 43.6, 90.8, "Neutral")
	AddTrainer(33637, "Kirembri Silvermane", "Shattrath City", 58.1, 75.0, "Neutral")
	AddTrainer(33680, "Nemiha", "Shattrath City", 36.1, 47.7, "Neutral")
	AddTrainer(44582, "Theresa Denman", "Stormwind City", 63.5, 61.6, "Alliance")
	AddTrainer(46675, "Lugrah", "Orgrimmar", 72.49, 34.31, "Horde")

	self.InitializeJewelcraftingTrainers = nil
end
