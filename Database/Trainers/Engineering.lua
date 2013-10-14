-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeEngineeringTrainers()
	self:AddTrainer(1676, "Finbus Geargrind", Z.DUSKWOOD, 77.4, 48.6, "Alliance")
	self:AddTrainer(1702, "Bronk Guzzlegear", Z.DUN_MOROGH, 50.2, 50.4, "Alliance")
	self:AddTrainer(3290, "Deek Fizzlebizz", Z.LOCH_MODAN, 45.9, 13.6, "Alliance")
	self:AddTrainer(3494, "Tinkerwiz", Z.NORTHERN_BARRENS, 68.5, 69.2, "Neutral")
	self:AddTrainer(5174, "Springspindle Fizzlegear", Z.IRONFORGE, 68.4, 44, "Alliance")
	self:AddTrainer(5518, "Lilliam Sparkspindle", Z.STORMWIND_CITY, 62.8, 32, "Alliance")
	self:AddTrainer(7406, "Oglethorpe Obnoticus", Z.THE_CAPE_OF_STRANGLETHORN, 43, 72.1, "Neutral")
	self:AddTrainer(7944, "Tinkmaster Overspark", Z.IRONFORGE, 69.8, 50, "Alliance")
	self:AddTrainer(8126, "Nixx Sprocketspring", Z.TANARIS, 52.4, 28.3, "Neutral")
	self:AddTrainer(8736, "Buzzek Bracketswing", Z.TANARIS, 51.7, 30.4, "Neutral")
	self:AddTrainer(8738, "Vazario Linkgrease", Z.NORTHERN_BARRENS, 68.5, 69.2, "Neutral")
	self:AddTrainer(11017, "Roxxik", Z.ORGRIMMAR, 56.85, 56.54, "Horde")
	self:AddTrainer(11025, "Mukdrak", Z.DUROTAR, 52.2, 40.8, "Horde")
	self:AddTrainer(11031, "Franklin Lloyd", Z.UNDERCITY, 75.9, 73.7, "Horde")
	self:AddTrainer(11037, "Jenna Lemkenilli", Z.DARKSHORE, 38.3, 41.1, "Alliance")
	self:AddTrainer(14742, "Zap Farflinger", Z.WINTERSPRING, 59.7, 49.8, "Neutral")
	self:AddTrainer(14743, "Jhordy Lapforge", Z.TANARIS, 52.2, 27.9, "Neutral")
	self:AddTrainer(16667, "Danwe", Z.SILVERMOON_CITY, 76.5, 40.9, "Horde")
	self:AddTrainer(16726, "Ockil", Z.THE_EXODAR, 54, 92.1, "Alliance")
	self:AddTrainer(17222, "Artificer Daelo", Z.AZUREMYST_ISLE, 48, 51, "Alliance")
	self:AddTrainer(17634, "K. Lee Smallfry", Z.ZANGARMARSH, 68.6, 50.2, "Alliance")
	self:AddTrainer(17637, "Mack Diver", Z.ZANGARMARSH, 34, 50.8, "Horde")
	self:AddTrainer(18752, "Zebig", Z.HELLFIRE_PENINSULA, 54.8, 38.5, "Horde")
	self:AddTrainer(18775, "Lebowski", Z.HELLFIRE_PENINSULA, 55.7, 65.5, "Alliance")
	self:AddTrainer(19576, "Xyrol", Z.NETHERSTORM, 32.5, 66.7, "Neutral")
	self:AddTrainer(21493, "Kablamm Farflinger", Z.NETHERSTORM, 32.9, 63.7, "Neutral")
	self:AddTrainer(21494, "Smiles O'Byron", Z.BLADES_EDGE_MOUNTAINS, 60.3, 65.2, "Neutral")
	self:AddTrainer(24868, "Niobe Whizzlespark", Z.SHADOWMOON_VALLEY, 36.7, 54.8, "Alliance")
	self:AddTrainer(25099, "Jonathan Garrett", Z.SHADOWMOON_VALLEY, 29.2, 28.5, "Horde")
	self:AddTrainer(25277, "Chief Engineer Leveny", Z.BOREAN_TUNDRA, 42.6, 53.7, "Horde")
	self:AddTrainer(26907, "Tisha Longbridge", Z.HOWLING_FJORD, 59.7, 64, "Alliance")
	self:AddTrainer(26955, "Jamesina Watterly", Z.HOWLING_FJORD, 78.5, 30, "Horde")
	self:AddTrainer(26991, "Sock Brightbolt", Z.BOREAN_TUNDRA, 57.7, 72.2, "Alliance")
	self:AddTrainer(28697, "Timofey Oshenko", Z.DALARAN, 39, 27.5, "Neutral")
	self:AddTrainer(29513, "Didi the Wrench", Z.DALARAN, 39.5, 25.5, "Neutral")
	self:AddTrainer(29514, "Findle Whistlesteam", Z.DALARAN, 39.5, 25.2, "Neutral")
	self:AddTrainer(33586, "Binkie Brightgear", Z.ICECROWN, 72.1, 20.9, "Neutral")
	self:AddTrainer(33611, 51306, Z.SHATTRATH_CITY, 43.7, 90.1, "Neutral")
	self:AddTrainer(33634, "Engineer Sinbei", Z.SHATTRATH_CITY, 43.1, 64.9, "Neutral")
	self:AddTrainer(45545, "\"Jack\" Pisarek Slamfix", Z.ORGRIMMAR, 36.34, 86.74, "Horde")
	self:AddTrainer(52636, "Tana Lentner", Z.DARNASSUS, 49.6, 32.3, "Alliance")
	self:AddTrainer(52651, "Engineer Palehoof", Z.THUNDER_BLUFF, 36.1, 59.6, "Horde")
	self:AddTrainer(55143, "Sally Fizzlefury", Z.VALLEY_OF_THE_FOUR_WINDS, 16.1, 83.1, "Neutral")

	self.InitializeEngineeringTrainers = nil
end
