-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeJewelcraftingTrainers()
	self:AddTrainer(15501, "Aleinia", "Eversong Woods", 48.5, 47.5, "Horde")
	self:AddTrainer(18751, "Kalaen", "Hellfire Peninsula", 56.8, 37.7, "Horde")
	self:AddTrainer(18774, "Tatiana", "Hellfire Peninsula", 54.6, 63.6, "Alliance")
	self:AddTrainer(19063, "Hamanar", "Shattrath City", 35.7, 20.5, "Neutral")
	self:AddTrainer(19539, "Jazdalaad", "Netherstorm", 44.5, 34, "Neutral")
	self:AddTrainer(19775, "Kalinda", "Silvermoon City", 90.5, 74.1, "Horde")
	self:AddTrainer(19778, "Farii", "The Exodar", 45, 24, "Alliance")
	self:AddTrainer(26915, "Ounhulo", "Howling Fjord", 59.9, 63.8, "Alliance")
	self:AddTrainer(26960, "Carter Tiffens", "Howling Fjord", 79.3, 28.8, "Horde")
	self:AddTrainer(26982, "Geba'li", "Borean Tundra", 41.6, 53.4, "Horde")
	self:AddTrainer(26997, "Alestos", "Borean Tundra", 57.5, 72.3, "Alliance")
	self:AddTrainer(28701, "Timothy Jones", "Dalaran", 40.5, 35.2, "Neutral")
	self:AddTrainer(33590, "Oluros", "Icecrown", 71.5, 20.8, "Neutral")
	self:AddTrainer(33614, 51311, "Shattrath City", 43.6, 90.8, "Neutral")
	self:AddTrainer(33637, "Kirembri Silvermane", "Shattrath City", 58.1, 75.0, "Neutral")
	self:AddTrainer(33680, "Nemiha", "Shattrath City", 36.1, 47.7, "Neutral")
	self:AddTrainer(44582, "Theresa Denman", "Stormwind City", 63.5, 61.6, "Alliance")
	self:AddTrainer(46675, "Lugrah", "Orgrimmar", 72.49, 34.31, "Horde")

	self.InitializeJewelcraftingTrainers = nil
end
