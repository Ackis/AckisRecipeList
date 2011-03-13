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
function private:InitializeSmeltingTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(1681, "Brock Stoneseeker", "Loch Modan", 37.1, 47.8, "Alliance")
	AddTrainer(1701, "Dank Drizzlecut", "Dun Morogh", 69.3, 55.5, "Alliance")
	AddTrainer(3001, "Brek Stonehoof", "Thunder Bluff", 34.5, 57.6, "Horde")
	AddTrainer(3137, "Matt Johnson", "Duskwood", 74, 49.7, "Alliance")
	AddTrainer(3175, "Krunn", "Durotar", 51.9, 40.9, "Horde")
	AddTrainer(3357, "Makaru", "Orgrimmar", 72.31, 34.91, "Horde")
	AddTrainer(3555, "Johan Focht", "Silverpine Forest", 43.4, 40.5, "Horde")
	AddTrainer(4254, "Geofram Bouldertoe", "Ironforge", 50.3, 26, "Alliance")
	AddTrainer(4598, "Brom Killian", "Undercity", 55.8, 37, "Horde")
	AddTrainer(5392, "Yarr Hammerstone", "Dun Morogh", 50, 50.3, "Alliance")
	AddTrainer(5513, "Gelman Stonehand", "Stormwind City", 59.2, 37.7, "Alliance")
	AddTrainer(6297, "Kurdram Stonehammer", "Darkshore", 38.2, 41.1, "Alliance")
	AddTrainer(8128, "Pikkle", "Tanaris", 51.1, 28.1, "Neutral")
	AddTrainer(16663, "Belil", "Silvermoon City", 79.1, 42.9, "Horde")
	AddTrainer(16752, "Muaat", "The Exodar", 60, 87.9, "Alliance")
	AddTrainer(17488, "Dulvi", "Azuremyst Isle", 48.9, 51.1, "Alliance")
	AddTrainer(18747, "Krugosh", "Hellfire Peninsula", 55.5, 37.6, "Horde")
	AddTrainer(18779, "Hurnak Grimmord", "Hellfire Peninsula", 56.7, 63.8, "Alliance")
	AddTrainer(18804, "Prospector Nachlan", "Bloodmyst Isle", 56.3, 54.3, "Alliance")
	AddTrainer(26912, "Grumbol Stoutpick", "Howling Fjord", 59.9, 63.9, "Alliance")
	AddTrainer(26962, "Jonathan Lewis", "Howling Fjord", 79.3, 29, "Horde")
	AddTrainer(26976, "Brunna Ironaxe", "Borean Tundra", 42.6, 53.2, "Horde")
	AddTrainer(26999, "Fendrig Redbeard", "Borean Tundra", 57.5, 66.2, "Alliance")
	AddTrainer(28698, "Jedidiah Handers", "Dalaran", 41.5, 26, "Neutral")
	AddTrainer(33617, 32606, "Shattrath City", 43.6, 90.9, "Neutral")
	AddTrainer(33682, "Fono", "Shattrath City", 36, 48.5, "Neutral")
	AddTrainer(46357, "Gonto", "Orgrimmar", 44.57, 78.61, "Horde")

	self.InitializeSmeltingTrainers = nil
end
