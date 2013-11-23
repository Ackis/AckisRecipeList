-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeTailoringTrainers()
	self:AddTrainer(1103, "Eldrin", Z.ELWYNN_FOREST, 79.3, 69, "Alliance")
	self:AddTrainer(1346, "Georgio Bolero", Z.STORMWIND_CITY, 53.2, 81.5, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(2399, "Daryl Stack", Z.HILLSBRAD_FOOTHILLS, 58.1, 48, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(2627, "Grarnik Goodstitch", Z.THE_CAPE_OF_STRANGLETHORN, 43.6, 73, "Neutral")
	self:AddTrainer(3004, "Tepa", Z.THUNDER_BLUFF, 44.5, 45.3, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3363, "Magar", Z.ORGRIMMAR, 63.5, 50, "Horde")
	self:AddTrainer(3484, "Kil'hala", Z.NORTHERN_BARRENS, 49.9, 61.2, "Horde")
	self:AddTrainer(3523, "Bowen Brisboise", Z.TIRISFAL_GLADES, 52.6, 55.6, "Horde")
	self:AddTrainer(3704, "Mahani", Z.SOUTHERN_BARRENS, 41.5, 46.9, "Horde")
	self:AddTrainer(4159, "Me'lynn", Z.DARNASSUS, 59.8, 37.4, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4576, "Josef Gregorian", Z.UNDERCITY, 70.7, 30.3, "Horde")
	self:AddTrainer(4578, "Josephine Lister", Z.UNDERCITY, 86.5, 22.3, "Horde")
	self:AddTrainer(5153, "Jormund Stonebrow", Z.IRONFORGE, 43.2, 29, "Alliance")
	self:AddTrainer(9584, "Jalane Ayrole", Z.STORMWIND_CITY, 40.4, 84.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(11052, "Timothy Worthington", Z.DUSTWALLOW_MARSH, 66.22, 51.7, "Alliance")
	self:AddTrainer(11557, "Meilosh", Z.FELWOOD, 65.7, 2.9, "Neutral")
	self:AddTrainer(16366, "Sempstress Ambershine", Z.EVERSONG_WOODS, 37.4, 71.9, "Horde")
	self:AddTrainer(16640, "Keelen Sheets", Z.SILVERMOON_CITY, 57, 50.1, "Horde")
	self:AddTrainer(16729, "Refik", Z.THE_EXODAR, 63, 67.9, "Alliance")
	self:AddTrainer(17487, "Erin Kelly", Z.AZUREMYST_ISLE, 46.2, 70.5, "Alliance")
	self:AddTrainer(18749, "Dalinna", Z.HELLFIRE_PENINSULA, 56.6, 37.1, "Horde")
	self:AddTrainer(18772, "Hama", Z.HELLFIRE_PENINSULA, 54.1, 63.6, "Alliance")
	self:AddTrainer(26914, "Benjamin Clegg", Z.HOWLING_FJORD, 58.6, 62.8, "Alliance")
	self:AddTrainer(26964, "Alexandra McQueen", Z.HOWLING_FJORD, 79.4, 30.7, "Horde")
	self:AddTrainer(26969, "Raenah", Z.BOREAN_TUNDRA, 41.6, 53.5, "Horde")
	self:AddTrainer(27001, "Darin Goodstitch", Z.BOREAN_TUNDRA, 57.5, 72.3, "Alliance")
	self:AddTrainer(28699, "Charles Worth", Z.DALARAN, 36.5, 33.5, "Neutral")
	self:AddTrainer(33580, "Dustin Vail", Z.ICECROWN, 73, 20.8, "Neutral")
	self:AddTrainer(33613, 51309, Z.SHATTRATH_CITY, 44, 91.1, "Neutral")
	self:AddTrainer(33636, "Miralisse", Z.SHATTRATH_CITY, 41.6, 63.5, "Neutral")
	self:AddTrainer(33684, "Weaver Aoa", Z.SHATTRATH_CITY, 37.6, 27.2, "Neutral")
	self:AddTrainer(43428, "Faeyrin Willowmoon", Z.DARKSHORE, 50.6, 20.8, "Alliance")
	self:AddTrainer(44783, "Hiwahi Three-Feathers", Z.ORGRIMMAR, 38.8, 50.5, "Horde")
	self:AddTrainer(45559, "Nivi Weavewell", Z.ORGRIMMAR, 41.1, 79.7, "Horde")
	self:AddTrainer(57405, "Silkmaster Tsai", Z.VALLEY_OF_THE_FOUR_WINDS, 62.62, 59.81, "Alliance")

	self.InitializeTailoringTrainers = nil
end
