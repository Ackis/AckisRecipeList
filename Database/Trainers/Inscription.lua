-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeInscriptionTrainers()
	self:AddTrainer(26916, "Mindri Dinkles", "Howling Fjord", 58.6, 62.8, "Alliance")
	self:AddTrainer(26959, "Booker Kells", "Howling Fjord", 79.4, 29.3, "Horde")
	self:AddTrainer(26977, "Adelene Sunlance", "Borean Tundra", 41.2, 53.9, "Horde")
	self:AddTrainer(26995, "Tink Brightbolt", "Borean Tundra", 57.6, 71.7, "Alliance")
	self:AddTrainer(28702, "Professor Pallin", "Dalaran", 41.8, 36.9, "Neutral")
	self:AddTrainer(30706, "Jo'mah", "Orgrimmar", 56.2, 46.5, "Horde")
	self:AddTrainer(30709, "Poshken Hardbinder", "Thunder Bluff", 28.7, 20.9, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(30710, "Zantasia", "Silvermoon City", 69.5, 24, "Horde")
	self:AddTrainer(30711, "Margaux Parchley", "Undercity", 61, 58.5, "Horde")
	self:AddTrainer(30713, "Catarina Stanford", "Stormwind City", 49.8, 74.7, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(30715, "Feyden Darkin", "Darnassus", 56.8, 31.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(30716, "Thoth", "The Exodar", 40.5, 39.1, "Alliance")
	self:AddTrainer(30717, "Elise Brightletter", "Ironforge", 60.7, 44.9, "Alliance")
	self:AddTrainer(30721, "Michael Schwan", "Hellfire Peninsula", 53.9, 65.5, "Alliance")
	self:AddTrainer(30722, "Neferatti", "Hellfire Peninsula", 52.3, 36.1, "Horde")
	self:AddTrainer(33603, "Arthur Denny", "Icecrown", 71.7, 20.9, "Neutral")
	self:AddTrainer(33615, 45363, "Shattrath City", 43.5, 90.7, "Neutral")
	self:AddTrainer(33638, "Scribe Lanloer", "Shattrath City", 56.0, 74.4, "Neutral")
	self:AddTrainer(33679, "Recorder Lidio", "Shattrath City", 36.2, 44, "Neutral")
	self:AddTrainer(46716, "Nerog", "Orgrimmar", 55.2, 56.7, "Horde")
	self:AddTrainer(62327, "Scribe Rinji", "Orgrimmar", 55.2, 56.7, "Horde")

	self.InitializeInscriptionTrainers = nil
end
