-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeCookingTrainers()
	self:AddTrainer(1355, "Cook Ghilm", Z.DUN_MOROGH, 68.4, 54.5, "Alliance")
	self:AddTrainer(1382, "Mudduk", Z.NORTHERN_STRANGLETHORN, 37.2, 49.2, "Horde")
	self:AddTrainer(1430, "Tomas", Z.ELWYNN_FOREST, 44.3, 66, "Alliance")
	self:AddTrainer(1699, "Gremlock Pilsnor", Z.DUN_MOROGH, 47.6, 52.3, "Alliance")
	self:AddTrainer(2818, "Slagg", Z.ARATHI_HIGHLANDS, 74.1, 33.8, "Horde")
	self:AddTrainer(3026, "Aska Mistrunner", Z.THUNDER_BLUFF, 50.7, 53.1, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3067, "Pyall Silentstride", Z.MULGORE, 45.5, 58.1, "Horde")
	self:AddTrainer(3087, "Crystal Boughman", Z.REDRIDGE_MOUNTAINS, 22.8, 43.6, "Alliance")
	self:AddTrainer(3399, "Zamja", Z.ORGRIMMAR, 57.5, 53.7, "Horde")
	self:AddTrainer(4210, "Alegorn", Z.DARNASSUS, 49.9, 36.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4552, "Eunice Burch", Z.UNDERCITY, 62.3, 44.6, "Horde")
	self:AddTrainer(5159, "Daryl Riknussun", Z.IRONFORGE, 60.1, 36.8, "Alliance")
	self:AddTrainer(5482, "Stephen Ryback", Z.STORMWIND_CITY, 77.2, 53.2, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(6286, "Zarrin", Z.TELDRASSIL, 56.6, 53.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(8306, "Duhng", Z.NORTHERN_BARRENS, 55.4, 61.3, "Horde")
	self:AddTrainer(16253, "Master Chef Mouldier", Z.GHOSTLANDS, 48.3, 30.9, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(16277, "Quarelestra", Z.EVERSONG_WOODS, 48.6, 47.1, "Horde")
	self:AddTrainer(16676, "Sylann", Z.SILVERMOON_CITY, 69.5, 71.5, "Horde")
	self:AddTrainer(16719, "Mumman", Z.THE_EXODAR, 55.6, 27.1, "Alliance")
	self:AddTrainer(17246, "\"Cookie\" McWeaksauce", Z.AZUREMYST_ISLE, 46.7, 70.5, "Alliance")
	self:AddTrainer(18987, "Gaston", Z.HELLFIRE_PENINSULA, 54.1, 63.5, "Alliance")
	self:AddTrainer(18988, "Baxter", Z.HELLFIRE_PENINSULA, 56.8, 37.5, "Horde")
	self:AddTrainer(18993, "Naka", Z.ZANGARMARSH, 78.5, 63, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(19185, "Jack Trapper", Z.SHATTRATH_CITY, 63, 68.5, "Neutral")
	self:AddTrainer(19186, "Kylene", Z.SHATTRATH_CITY, 76.5, 33, "Neutral")
	self:AddTrainer(19369, "Celie Steelwing", Z.SHADOWMOON_VALLEY, 37.2, 58.5, "Alliance")
	self:AddTrainer(26905, "Brom Brewbaster", Z.HOWLING_FJORD, 58.2, 62.1, "Alliance")
	self:AddTrainer(26953, "Thomas Kolichio", Z.HOWLING_FJORD, 78.6, 29.4, "Horde")
	self:AddTrainer(26972, "Orn Tenderhoof", Z.BOREAN_TUNDRA, 42, 54.2, "Horde")
	self:AddTrainer(26989, "Rollick MacKreel", Z.BOREAN_TUNDRA, 57.9, 71.5, "Alliance")
	self:AddTrainer(28705, "Katherine Lee", Z.DALARAN, 40.8, 65.2, "Alliance")
	self:AddTrainer(29631, "Awilo Lon'gomba", Z.DALARAN, 70, 38.6, "Horde")
	self:AddTrainer(33587, "Bethany Cromwell", Z.ICECROWN, 72.4, 20.8, "Neutral")
	self:AddTrainer(33619, 51296, Z.SHATTRATH_CITY, 43.6, 91.1, "Neutral")
	self:AddTrainer(42288, "Robby Flay", Z.STORMWIND_CITY, 50.39, 71.82, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(45550, "Zarbo Porkpatty", Z.ORGRIMMAR, 39, 85.8, "Neutral")
	self:AddTrainer(46709, "Arugi", Z.ORGRIMMAR, 56.5, 61.5, "Horde")
	self:AddTrainer(47405, "The Chef", Z.TIRISFAL_GLADES, 61.2, 52.6, "Horde")
	self:AddTrainer(49789, "Allison", Z.HELLFIRE_PENINSULA, 56.8, 37.4, "Horde")
	self:AddTrainer(54232, "Mrs. Gant", Z.THE_CAPE_OF_STRANGLETHORN, 42.6, 72.8, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(56707, "Chin", Z.THE_JADE_FOREST, 46.2, 45.4, "Neutral")
	self:AddTrainer(58712, "Kol Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 53, 51.3, "Neutral")
	self:AddTrainer(58713, "Anthea Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 52.7, 52, "Neutral")
	self:AddTrainer(58714, "Mei Mei Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 52.6, 51.5, "Neutral")
	self:AddTrainer(58715, "Yan Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 52.5, 51.7, "Neutral")
	self:AddTrainer(58716, "Jian Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 53.3, 51.6, "Neutral")
	self:AddTrainer(58717, "Bobo Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 53.2, 52.2, "Neutral")
	self:AddTrainer(64231, "Sungshin Ironpaw", Z.VALLEY_OF_THE_FOUR_WINDS, 53.6, 51.2, "Neutral")

	self.InitializeCookingTrainers = nil
end
