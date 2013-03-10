-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeInscriptionTrainers()

	self:AddTrainer(26916, "Mindri Dinkles", Z.HOWLING_FJORD, 58.6, 62.8, "Alliance")
	self:AddTrainer(26959, "Booker Kells", Z.HOWLING_FJORD, 79.4, 29.3, "Horde")
	self:AddTrainer(26977, "Adelene Sunlance", Z.BOREAN_TUNDRA, 41.2, 53.9, "Horde")
	self:AddTrainer(26995, "Tink Brightbolt", Z.BOREAN_TUNDRA, 57.6, 71.7, "Alliance")
	self:AddTrainer(28702, "Professor Pallin", Z.DALARAN, 41.8, 36.9, "Neutral")
	self:AddTrainer(30706, "Jo'mah", Z.ORGRIMMAR, 56.2, 46.5, "Horde")
	self:AddTrainer(30709, "Poshken Hardbinder", Z.THUNDER_BLUFF, 28.7, 20.9, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(30710, "Zantasia", Z.SILVERMOON_CITY, 69.5, 24, "Horde")
	self:AddTrainer(30711, "Margaux Parchley", Z.UNDERCITY, 61, 58.5, "Horde")
	self:AddTrainer(30713, "Catarina Stanford", Z.STORMWIND_CITY, 49.8, 74.7, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(30715, "Feyden Darkin", Z.DARNASSUS, 56.8, 31.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(30716, "Thoth", Z.THE_EXODAR, 40.5, 39.1, "Alliance")
	self:AddTrainer(30717, "Elise Brightletter", Z.IRONFORGE, 60.7, 44.9, "Alliance")
	self:AddTrainer(30721, "Michael Schwan", Z.HELLFIRE_PENINSULA, 53.9, 65.5, "Alliance")
	self:AddTrainer(30722, "Neferatti", Z.HELLFIRE_PENINSULA, 52.3, 36.1, "Horde")
	self:AddTrainer(33603, "Arthur Denny", Z.ICECROWN, 71.7, 20.9, "Neutral")
	self:AddTrainer(33615, 45363, Z.SHATTRATH_CITY, 43.5, 90.7, "Neutral")
	self:AddTrainer(33638, "Scribe Lanloer", Z.SHATTRATH_CITY, 56, 74.4, "Neutral")
	self:AddTrainer(33679, "Recorder Lidio", Z.SHATTRATH_CITY, 36.2, 44, "Neutral")
	self:AddTrainer(46716, "Nerog", Z.ORGRIMMAR, 55.2, 56.7, "Horde")
	self:AddTrainer(62327, "Scribe Rinji", Z.THE_JADE_FOREST, 47.6, 35, "Neutral")
	self:AddTrainer(56065, "Inkmaster Wei", Z.THE_JADE_FOREST, 54.8, 45.0, "Neutral")
	self:AddTrainer(64691, "Lorewalker Huynh", Z.VALE_OF_ETERNAL_BLOSSOMS, 81.9, 29.3, "Neutral")

	self.InitializeInscriptionTrainers = nil
end
