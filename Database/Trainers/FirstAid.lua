-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeFirstAidTrainers()
	self:AddTrainer(2326, "Thamner Pol", "Dun Morogh", 47.2, 52.6, "Alliance")
	self:AddTrainer(2327, "Shaina Fuller", "Stormwind City", 52.9, 44.8, "Alliance")
	self:AddTrainer(2329, "Michelle Belle", "Elwynn Forest", 43.4, 65.6, "Alliance")
	self:AddTrainer(2798, "Pand Stonebinder", "Thunder Bluff", 29.7, 21.2, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3181, "Fremal Doohickey", "Wetlands", 10.8, 61.3, "Alliance")
	self:AddTrainer(4211, "Dannelor", "Darnassus", 51.7, 30.4, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4591, "Mary Edras", "Undercity", 73.5, 54.8, "Horde")
	self:AddTrainer(5150, "Nissa Firestone", "Ironforge", 54, 57.8, "Alliance")
	self:AddTrainer(5759, "Nurse Neela", "Tirisfal Glades", 61.8, 52.8, "Horde")
	self:AddTrainer(5939, "Vira Younghoof", "Mulgore", 46.8, 60.8, "Horde")
	self:AddTrainer(5943, "Rawrk", "Durotar", 54.1, 42, "Horde")
	self:AddTrainer(6094, "Byancie", "Teldrassil", 55.3, 56.8, "Alliance")
	self:AddTrainer(16272, "Kanaria", "Eversong Woods", 48.5, 47.6, "Horde")
	self:AddTrainer(16662, "Alestus", "Silvermoon City", 77.6, 71.3, "Horde")
	self:AddTrainer(16731, "Nus", "The Exodar", 39, 22.5, "Alliance")
	self:AddTrainer(17214, "Anchorite Fateema", "Azuremyst Isle", 48.5, 51.8, "Alliance")
	self:AddTrainer(17424, "Anchorite Paetheus", "Bloodmyst Isle", 54.7, 54, "Alliance")
	self:AddTrainer(18990, "Burko", "Hellfire Peninsula", 22.4, 39.3, "Alliance")
	self:AddTrainer(18991, "Aresella", "Hellfire Peninsula", 26.3, 62, "Horde")
	self:AddTrainer(19184, "Mildred Fletcher", "Shattrath City", 66.5, 13.5, "Neutral")
	self:AddTrainer(19478, "Fera Palerunner", "Blade's Edge Mountains", 53.7, 55, "Horde")
	self:AddTrainer(22477, "Anchorite Ensham", "Terokkar Forest", 30.8, 75.9, "Neutral")
	self:AddTrainer(23734, "Anchorite Yazmina", "Howling Fjord", 59.5, 62.3, "Alliance")
	self:AddTrainer(26956, "Sally Tompkins", "Howling Fjord", 79.4, 29.4, "Horde")
	self:AddTrainer(26992, "Brynna Wilson", "Borean Tundra", 57.8, 66.5, "Alliance")
	self:AddTrainer(28706, "Olisarra the Kind", "Dalaran", 37.5, 36.7, "Neutral")
	self:AddTrainer(29233, "Nurse Applewood", "Borean Tundra", 41.7, 54.5, "Horde")
	self:AddTrainer(33589, "Joseph Wilson", "Icecrown", 71.5, 22.5, "Neutral")
	self:AddTrainer(33621, 45542, "Shattrath City", 43.6, 90.4, "Neutral")
	self:AddTrainer(45540, "Krenk Choplimb", "Orgrimmar", 37.5, 87.3, "Horde")
	self:AddTrainer(49879, "Doc Zapnozzle", "Azshara", 57.07, 50.71, "Horde")
	self:AddTrainer(50574, "Amelia Atherton", "Gilneas", 36.8, 65.7, "Alliance")

	self.InitializeFirstAidTrainers = nil
end
