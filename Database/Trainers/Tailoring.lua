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
function private:InitializeTailoringTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(1103, "Eldrin", "Elwynn Forest", 79.3, 69, "Alliance")
	AddTrainer(1346, "Georgio Bolero", "Stormwind City", 53.2, 81.5, "Alliance")
	AddTrainer(2399, "Daryl Stack", "Hillsbrad Foothills", 58.1, 48.0, "Horde") -- COMPLETELY UPDATED
	AddTrainer(2627, "Grarnik Goodstitch", "The Cape of Stranglethorn", 43.6, 73, "Neutral")
	AddTrainer(3004, "Tepa", "Thunder Bluff", 44.3, 45, "Horde")
	AddTrainer(3363, "Magar", "Orgrimmar", 63.5, 50, "Horde")
	AddTrainer(3484, "Kil'hala", "Northern Barrens", 49.9, 61.2, "Horde")
	AddTrainer(3523, "Bowen Brisboise", "Tirisfal Glades", 52.6, 55.6, "Horde")
	AddTrainer(3704, "Mahani", "Southern Barrens", 41.5, 46.9, "Horde")
	AddTrainer(4159, "Me'lynn", "Darnassus", 59.8, 37.4, "Alliance") -- COMPLETELY UPDATED
	AddTrainer(4193, "Grondal Moonbreeze", "Darkshore", 38.2, 40.5, "Alliance")
	AddTrainer(4576, "Josef Gregorian", "Undercity", 70.7, 30.3, "Horde")
	AddTrainer(4578, "Josephine Lister", "Undercity", 86.5, 22.3, "Horde")
	AddTrainer(5153, "Jormund Stonebrow", "Ironforge", 43.2, 29, "Alliance")
	AddTrainer(9584, "Jalane Ayrole", "Stormwind City", 40.6, 83.9, "Alliance")
	AddTrainer(11052, "Timothy Worthington", "Dustwallow Marsh", 66.22, 51.7, "Alliance")
	AddTrainer(11557, "Meilosh", "Felwood", 65.7, 2.9, "Horde")
	AddTrainer(16366, "Sempstress Ambershine", "Eversong Woods", 37.4, 71.9, "Horde")
	AddTrainer(16640, "Keelen Sheets", "Silvermoon City", 57, 50.1, "Horde")
	AddTrainer(16729, "Refik", "The Exodar", 63, 67.9, "Alliance")
	AddTrainer(17487, "Erin Kelly", "Azuremyst Isle", 46.2, 70.5, "Alliance")
	AddTrainer(18749, "Dalinna", "Hellfire Peninsula", 56.6, 37.1, "Horde")
	AddTrainer(18772, "Hama", "Hellfire Peninsula", 54.1, 63.6, "Alliance")
	AddTrainer(26914, "Benjamin Clegg", "Howling Fjord", 58.6, 62.8, "Alliance")
	AddTrainer(26964, "Alexandra McQueen", "Howling Fjord", 79.4, 30.7, "Horde")
	AddTrainer(26969, "Raenah", "Borean Tundra", 41.6, 53.5, "Horde")
	AddTrainer(27001, "Darin Goodstitch", "Borean Tundra", 57.5, 72.3, "Alliance")
	AddTrainer(28699, "Charles Worth", "Dalaran", 36.5, 33.5, "Neutral")
	AddTrainer(33580, "Dustin Vail", "Icecrown", 73, 20.8, "Neutral")
	AddTrainer(33613, 51309, "Shattrath City", 44, 91.1, "Neutral")
	AddTrainer(33636, "Miralisse", "Shattrath City", 41.6, 63.5, "Neutral")
	AddTrainer(33684, "Weaver Aoa", "Shattrath City", 37.6, 27.2, "Neutral")
	AddTrainer(44783, "Hiwahi Three-Feathers", "Orgrimmar", 38.8, 50.5, "Horde")
	AddTrainer(45559, "Nivi Weavewell", "Orgrimmar", 41.1, 79.7, "Horde")

	self.InitializeTailoringTrainers = nil
end
