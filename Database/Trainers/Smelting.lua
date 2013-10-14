-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeSmeltingTrainers()
	self:AddTrainer(1443, "Stonebreaker Ruian", Z.THE_JADE_FOREST, 27.82, 14.85, "Horde")
	self:AddTrainer(1681, "Brock Stoneseeker", Z.LOCH_MODAN, 37.1, 47.8, "Alliance")
	self:AddTrainer(1701, "Dank Drizzlecut", Z.DUN_MOROGH, 76.6, 53.8, "Alliance")
	self:AddTrainer(3001, "Brek Stonehoof", Z.THUNDER_BLUFF, 34.4, 57.9, "Horde")
	self:AddTrainer(3137, "Matt Johnson", Z.DUSKWOOD, 74, 49.7, "Alliance")
	self:AddTrainer(3175, "Krunn", Z.DUROTAR, 51.9, 40.9, "Horde")
	self:AddTrainer(3357, "Makaru", Z.ORGRIMMAR, 72.31, 34.91, "Horde")
	self:AddTrainer(3555, "Johan Focht", Z.SILVERPINE_FOREST, 43.4, 40.5, "Horde")
	self:AddTrainer(4254, "Geofram Bouldertoe", Z.IRONFORGE, 50.3, 26, "Alliance")
	self:AddTrainer(4598, "Brom Killian", Z.UNDERCITY, 55.8, 37, "Horde")
	self:AddTrainer(5392, "Yarr Hammerstone", Z.DUN_MOROGH, 50, 50.3, "Alliance")
	self:AddTrainer(5513, "Gelman Stonehand", Z.STORMWIND_CITY, 59.5, 37.8, "Alliance")
	self:AddTrainer(6297, "Kurdram Stonehammer", Z.DARKSHORE, 38.2, 41.1, "Alliance")
	self:AddTrainer(8128, "Pikkle", Z.TANARIS, 51, 29.1, "Neutral")
	self:AddTrainer(16663, "Belil", Z.SILVERMOON_CITY, 79.1, 42.9, "Horde")
	self:AddTrainer(16752, "Muaat", Z.THE_EXODAR, 60, 87.9, "Alliance")
	self:AddTrainer(17488, "Dulvi", Z.AZUREMYST_ISLE, 48.9, 51.1, "Alliance")
	self:AddTrainer(18747, "Krugosh", Z.HELLFIRE_PENINSULA, 55.5, 37.6, "Horde")
	self:AddTrainer(18779, "Hurnak Grimmord", Z.HELLFIRE_PENINSULA, 56.7, 63.8, "Alliance")
	self:AddTrainer(18804, "Prospector Nachlan", Z.BLOODMYST_ISLE, 56.3, 54.3, "Alliance")
	self:AddTrainer(26912, "Grumbol Stoutpick", Z.HOWLING_FJORD, 59.9, 63.9, "Alliance")
	self:AddTrainer(26962, "Jonathan Lewis", Z.HOWLING_FJORD, 79.3, 29, "Horde")
	self:AddTrainer(26976, "Brunna Ironaxe", Z.BOREAN_TUNDRA, 42.6, 53.2, "Horde")
	self:AddTrainer(26999, "Fendrig Redbeard", Z.BOREAN_TUNDRA, 57.5, 66.2, "Alliance")
	self:AddTrainer(28698, "Jedidiah Handers", Z.DALARAN, 41.5, 26, "Neutral")
	self:AddTrainer(33617, 32606, Z.SHATTRATH_CITY, 43.6, 90.9, "Neutral")
	self:AddTrainer(33640, "Hanlir", Z.SHATTRATH_CITY, 58, 75, "Neutral")
	self:AddTrainer(33682, "Fono", Z.SHATTRATH_CITY, 36, 48.5, "Neutral")
	self:AddTrainer(46357, "Gonto", Z.ORGRIMMAR, 44.57, 78.61, "Horde")
	self:AddTrainer(52170, "Gizzik Oregrab", Z.ORGRIMMAR, 36.05, 82.58, "Horde")
	self:AddTrainer(52642, "Foreman Pernic", Z.DARNASSUS, 50.6, 33.8, "Alliance")
	self:AddTrainer(65092, "Smeltmaster Ashpaw", Z.THE_JADE_FOREST, 46.09, 29.44, "Alliance")

	self.InitializeSmeltingTrainers = nil
end
