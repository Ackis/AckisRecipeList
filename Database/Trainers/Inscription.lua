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
function private:InitializeInscriptionTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(26916, "Mindri Dinkles", "Howling Fjord", 58.6, 62.8, "Alliance")
	AddTrainer(26959, "Booker Kells", "Howling Fjord", 79.4, 29.3, "Horde")
	AddTrainer(26977, "Adelene Sunlance", "Borean Tundra", 41.2, 53.9, "Horde")
	AddTrainer(26995, "Tink Brightbolt", "Borean Tundra", 57.6, 71.7, "Alliance")
	AddTrainer(28702, "Professor Pallin", "Dalaran", 41.8, 36.9, "Neutral")
	AddTrainer(30706, "Jo'mah", "Orgrimmar", 56.2, 46.5, "Horde")
	AddTrainer(30709, "Poshken Hardbinder", "Thunder Bluff", 29.2, 22, "Horde")
	AddTrainer(30710, "Zantasia", "Silvermoon City", 69.5, 24, "Horde")
	AddTrainer(30711, "Margaux Parchley", "Undercity", 61, 58.5, "Horde")
	AddTrainer(30713, "Catarina Stanford", "Stormwind City", 49.8, 74.7, "Alliance")
	AddTrainer(30715, "Feyden Darkin", "Darnassus", 58.9, 14.1, "Alliance")
	AddTrainer(30716, "Thoth", "The Exodar", 40.5, 39.1, "Alliance")
	AddTrainer(30717, "Elise Brightletter", "Ironforge", 60.7, 44.9, "Alliance")
	AddTrainer(30721, "Michael Schwan", "Hellfire Peninsula", 53.9, 65.5, "Alliance")
	AddTrainer(30722, "Neferatti", "Hellfire Peninsula", 52.3, 36.1, "Horde")
	AddTrainer(33603, "Arthur Denny", "Icecrown", 71.7, 20.9, "Neutral")
	AddTrainer(33615, 45363, "Shattrath City", 43.5, 90.7, "Neutral")
	AddTrainer(33638, "Scribe Lanloer", "Shattrath City", 56.0, 74.4, "Neutral")
	AddTrainer(33679, "Recorder Lidio", "Shattrath City", 36.2, 44, "Neutral")
	AddTrainer(46716, "Nerog", "Orgrimmar", 55.2, 56.7, "Horde")

	self.InitializeInscriptionTrainers = nil
end
