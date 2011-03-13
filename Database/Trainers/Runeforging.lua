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
function private:InitializeRuneforgingTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(29194, "Amal'thazad", "Eastern Plaguelands", 80.5, 48.1, "Neutral")
	AddTrainer(29195, "Lady Alistra", "Eastern Plaguelands", 83.7, 44.6, "Neutral")
	AddTrainer(29196, "Lord Thorval", "Eastern Plaguelands", 80.9, 43.8, "Neutral")
	AddTrainer(31084, "Highlord Darion Mograine", "Eastern Plaguelands", 83.5, 49.5, "Neutral")

	self.InitializeRuneforgingTrainers = nil
end
