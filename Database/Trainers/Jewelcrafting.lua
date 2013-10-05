-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeJewelcraftingTrainers()
	self:AddTrainer(15501, "Aleinia", Z.EVERSONG_WOODS, 48.5, 47.5, "Horde")
	self:AddTrainer(18751, "Kalaen", Z.HELLFIRE_PENINSULA, 56.8, 37.7, "Horde")
	self:AddTrainer(18774, "Tatiana", Z.HELLFIRE_PENINSULA, 54.6, 63.6, "Alliance")
	self:AddTrainer(19063, "Hamanar", Z.SHATTRATH_CITY, 35.7, 20.5, "Neutral")
	self:AddTrainer(19539, "Jazdalaad", Z.NETHERSTORM, 44.5, 34, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(19775, "Kalinda", Z.SILVERMOON_CITY, 90.5, 74.1, "Horde")
	self:AddTrainer(19778, "Farii", Z.THE_EXODAR, 45, 24, "Alliance")
	self:AddTrainer(26915, "Ounhulo", Z.HOWLING_FJORD, 59.9, 63.8, "Alliance")
	self:AddTrainer(26960, "Carter Tiffens", Z.HOWLING_FJORD, 79.3, 28.8, "Horde")
	self:AddTrainer(26982, "Geba'li", Z.BOREAN_TUNDRA, 41.6, 53.4, "Horde")
	self:AddTrainer(26997, "Alestos", Z.BOREAN_TUNDRA, 57.5, 72.3, "Alliance")
	self:AddTrainer(28701, "Timothy Jones", Z.DALARAN, 40.5, 35.2, "Neutral")
	self:AddTrainer(33590, "Oluros", Z.ICECROWN, 71.5, 20.8, "Neutral")
	self:AddTrainer(33614, 51311, Z.SHATTRATH_CITY, 43.6, 90.8, "Neutral")
	self:AddTrainer(33637, "Kirembri Silvermane", Z.SHATTRATH_CITY, 58.1, 75, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(33680, "Nemiha", Z.SHATTRATH_CITY, 36.1, 47.7, "Neutral")
	self:AddTrainer(44582, "Theresa Denman", Z.STORMWIND_CITY, 63.5, 61.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(46675, "Lugrah", Z.ORGRIMMAR, 72.49, 34.31, "Horde")
	self:AddTrainer(52586, "Hanner Gembold", Z.IRONFORGE, 51, 25.4, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(52645, "Aessa Silverdew", Z.DARNASSUS, 54.2, 30.4, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(52657, "Nahari Cloudchaser", Z.THUNDER_BLUFF, 35.0, 54.0, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(65098, "Mai the Jade Shaper", Z.THE_JADE_FOREST, 48.1, 35.0, "Neutral")

	self.InitializeJewelcraftingTrainers = nil
end
