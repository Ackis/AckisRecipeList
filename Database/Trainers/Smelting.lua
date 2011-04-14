-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeSmeltingTrainers()
	self:AddTrainer(1681, "Brock Stoneseeker", "Loch Modan", 37.1, 47.8, "Alliance")
	self:AddTrainer(1701, "Dank Drizzlecut", "Dun Morogh", 69.3, 55.5, "Alliance")
	self:AddTrainer(3001, "Brek Stonehoof", "Thunder Bluff", 34.4, 57.9, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3137, "Matt Johnson", "Duskwood", 74, 49.7, "Alliance")
	self:AddTrainer(3175, "Krunn", "Durotar", 51.9, 40.9, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3357, "Makaru", "Orgrimmar", 72.31, 34.91, "Horde")
	self:AddTrainer(3555, "Johan Focht", "Silverpine Forest", 43.4, 40.5, "Horde")
	self:AddTrainer(4254, "Geofram Bouldertoe", "Ironforge", 50.3, 26, "Alliance")
	self:AddTrainer(4598, "Brom Killian", "Undercity", 55.8, 37, "Horde")
	self:AddTrainer(5392, "Yarr Hammerstone", "Dun Morogh", 50, 50.3, "Alliance")
	self:AddTrainer(5513, "Gelman Stonehand", "Stormwind City", 59.5, 37.8, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(6297, "Kurdram Stonehammer", "Darkshore", 38.2, 41.1, "Alliance")
	self:AddTrainer(8128, "Pikkle", "Tanaris", 51.0, 29.1, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(16663, "Belil", "Silvermoon City", 79.1, 42.9, "Horde")
	self:AddTrainer(16752, "Muaat", "The Exodar", 60, 87.9, "Alliance")
	self:AddTrainer(17488, "Dulvi", "Azuremyst Isle", 48.9, 51.1, "Alliance")
	self:AddTrainer(18747, "Krugosh", "Hellfire Peninsula", 55.5, 37.6, "Horde")
	self:AddTrainer(18779, "Hurnak Grimmord", "Hellfire Peninsula", 56.7, 63.8, "Alliance")
	self:AddTrainer(18804, "Prospector Nachlan", "Bloodmyst Isle", 56.3, 54.3, "Alliance")
	self:AddTrainer(26912, "Grumbol Stoutpick", "Howling Fjord", 59.9, 63.9, "Alliance")
	self:AddTrainer(26962, "Jonathan Lewis", "Howling Fjord", 79.3, 29, "Horde")
	self:AddTrainer(26976, "Brunna Ironaxe", "Borean Tundra", 42.6, 53.2, "Horde")
	self:AddTrainer(26999, "Fendrig Redbeard", "Borean Tundra", 57.5, 66.2, "Alliance")
	self:AddTrainer(28698, "Jedidiah Handers", "Dalaran", 41.5, 26, "Neutral")
	self:AddTrainer(33617, 32606, "Shattrath City", 43.6, 90.9, "Neutral")
	self:AddTrainer(33640, "Hanlir", "Shattrath City", 58.0, 75.0, "Neutral")
	self:AddTrainer(33682, "Fono", "Shattrath City", 36, 48.5, "Neutral")
	self:AddTrainer(46357, "Gonto", "Orgrimmar", 44.57, 78.61, "Horde")

	self.InitializeSmeltingTrainers = nil
end
