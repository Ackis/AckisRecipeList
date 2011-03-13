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
function private:InitializeEngineeringTrainers()
	local function AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
		if _G.type(trainer_name) == "number" then
			local entry = private:AddListEntry(private.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
			entry.spell_id = trainer_name
		else
			private:AddListEntry(private.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
		end
	end

	AddTrainer(1676, "Finbus Geargrind", "Duskwood", 77.4, 48.6, "Alliance")
	AddTrainer(1702, "Bronk Guzzlegear", "Dun Morogh", 50.2, 50.4, "Alliance")
	AddTrainer(3290, "Deek Fizzlebizz", "Loch Modan", 45.9, 13.6, "Alliance")
	AddTrainer(3494, "Tinkerwiz", "Northern Barrens", 68.5, 69.2, "Neutral")
	AddTrainer(5174, "Springspindle Fizzlegear", "Ironforge", 68.4, 44, "Alliance")
	AddTrainer(5518, "Lilliam Sparkspindle", "Stormwind City", 62.2, 30.5, "Alliance")
	AddTrainer(7406, "Oglethorpe Obnoticus", "The Cape of Stranglethorn", 43, 72.1, "Neutral")
	AddTrainer(7944, "Tinkmaster Overspark", "Ironforge", 69.8, 50, "Alliance")
	AddTrainer(8126, "Nixx Sprocketspring", "Tanaris", 52.5, 27.3, "Neutral")
	AddTrainer(8736, "Buzzek Bracketswing", "Tanaris", 52.3, 27.7, "Neutral")
	AddTrainer(8738, "Vazario Linkgrease", "Northern Barrens", 68.5, 69.2, "Neutral")
	AddTrainer(11017, "Roxxik", "Orgrimmar", 56.85, 56.54, "Horde")
	AddTrainer(11025, "Mukdrak", "Durotar", 52.2, 40.8, "Horde")
	AddTrainer(11031, "Franklin Lloyd", "Undercity", 75.9, 73.7, "Horde")
	AddTrainer(11037, "Jenna Lemkenilli", "Darkshore", 38.3, 41.1, "Alliance")
	AddTrainer(14742, "Zap Farflinger", "Winterspring", 61.2, 37.6, "Neutral")
	AddTrainer(14743, "Jhordy Lapforge", "Tanaris", 52.3, 26.9, "Neutral")
	AddTrainer(16667, "Danwe", "Silvermoon City", 76.5, 40.9, "Horde")
	AddTrainer(16726, "Ockil", "The Exodar", 54, 92.1, "Alliance")
	AddTrainer(17222, "Artificer Daelo", "Azuremyst Isle", 48, 51, "Alliance")
	AddTrainer(17634, "K. Lee Smallfry", "Zangarmarsh", 68.6, 50.2, "Alliance")
	AddTrainer(17637, "Mack Diver", "Zangarmarsh", 33.9, 51, "Horde")
	AddTrainer(18752, "Zebig", "Hellfire Peninsula", 54.8, 38.5, "Horde")
	AddTrainer(18775, "Lebowski", "Hellfire Peninsula", 55.7, 65.5, "Alliance")
	AddTrainer(19576, "Xyrol", "Netherstorm", 32.5, 66.7, "Neutral")
	AddTrainer(21493, "Kablamm Farflinger", "Netherstorm", 32.9, 63.7, "Neutral")
	AddTrainer(21494, "Smiles O'Byron", "Blade's Edge Mountains", 60.3, 65.2, "Neutral")
	AddTrainer(24868, "Niobe Whizzlespark", "Shadowmoon Valley", 36.7, 54.8, "Alliance")
	AddTrainer(25099, "Jonathan Garrett", "Shadowmoon Valley", 29.2, 28.5, "Horde")
	AddTrainer(25277, "Chief Engineer Leveny", "Borean Tundra", 42.6, 53.7, "Horde")
	AddTrainer(26907, "Tisha Longbridge", "Howling Fjord", 59.7, 64, "Alliance")
	AddTrainer(26955, "Jamesina Watterly", "Howling Fjord", 78.5, 30, "Horde")
	AddTrainer(26991, "Sock Brightbolt", "Borean Tundra", 57.7, 72.2, "Alliance")
	AddTrainer(28697, "Timofey Oshenko", "Dalaran", 39, 27.5, "Neutral")
	AddTrainer(29513, "Didi the Wrench", "Dalaran", 39.5, 25.5, "Neutral")
	AddTrainer(29514, "Findle Whistlesteam", "Dalaran", 39.5, 25.2, "Neutral")
	AddTrainer(33586, "Binkie Brightgear", "Icecrown", 72.1, 20.9, "Neutral")
	AddTrainer(33611, 51306, "Shattrath City", 43.7, 90.1, "Neutral")
	AddTrainer(33634, "Engineer Sinbei", "Shattrath City", 43.1, 64.9, "Neutral")

	self.InitializeEngineeringTrainers = nil
end
