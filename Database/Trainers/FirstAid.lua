-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeFirstAidTrainers()
	self:AddTrainer(447, "Soraka", Z.THE_JADE_FOREST, 45.4, 85.8, "Alliance")
	self:AddTrainer(686, "Elder Muur", Z.THE_JADE_FOREST, 28.34, 15.35, "Horde")
	self:AddTrainer(2326, "Thamner Pol", Z.DUN_MOROGH, 47.2, 52.6, "Alliance")
	self:AddTrainer(2327, "Shaina Fuller", Z.STORMWIND_CITY, 52.2, 45.4, "Alliance")
	self:AddTrainer(2329, "Michelle Belle", Z.ELWYNN_FOREST, 43.4, 65.6, "Alliance")
	self:AddTrainer(2798, "Pand Stonebinder", Z.THUNDER_BLUFF, 29.7, 21.2, "Horde")
	self:AddTrainer(3181, "Fremal Doohickey", Z.WETLANDS, 10.8, 61.3, "Alliance")
	self:AddTrainer(4211, "Dannelor", Z.DARNASSUS, 51.7, 30.4, "Alliance")
	self:AddTrainer(4591, "Mary Edras", Z.UNDERCITY, 73.5, 54.8, "Horde")
	self:AddTrainer(5150, "Nissa Firestone", Z.IRONFORGE, 54, 57.8, "Alliance")
	self:AddTrainer(5759, "Nurse Neela", Z.TIRISFAL_GLADES, 61.8, 52.8, "Horde")
	self:AddTrainer(5939, "Vira Younghoof", Z.MULGORE, 46.8, 60.8, "Horde")
	self:AddTrainer(5943, "Rawrk", Z.DUROTAR, 54.1, 42, "Horde")
	self:AddTrainer(6094, "Byancie", Z.TELDRASSIL, 55.3, 56.8, "Alliance")
	self:AddTrainer(16272, "Kanaria", Z.EVERSONG_WOODS, 48.5, 47.6, "Horde")
	self:AddTrainer(16662, "Alestus", Z.SILVERMOON_CITY, 77.6, 71.3, "Horde")
	self:AddTrainer(16731, "Nus", Z.THE_EXODAR, 39, 22.5, "Alliance")
	self:AddTrainer(17214, "Anchorite Fateema", Z.AZUREMYST_ISLE, 48.5, 51.8, "Alliance")
	self:AddTrainer(17424, "Anchorite Paetheus", Z.BLOODMYST_ISLE, 54.7, 54, "Alliance")
	self:AddTrainer(18990, "Burko", Z.HELLFIRE_PENINSULA, 22.4, 39.3, "Alliance")
	self:AddTrainer(18991, "Aresella", Z.HELLFIRE_PENINSULA, 26.3, 62, "Horde")
	self:AddTrainer(19184, "Mildred Fletcher", Z.SHATTRATH_CITY, 66.5, 13.5, "Neutral")
	self:AddTrainer(19478, "Fera Palerunner", Z.BLADES_EDGE_MOUNTAINS, 54, 55.1, "Horde")
	self:AddTrainer(22477, "Anchorite Ensham", Z.TEROKKAR_FOREST, 30.8, 75.9, "Neutral")
	self:AddTrainer(23734, "Anchorite Yazmina", Z.HOWLING_FJORD, 59.5, 62.3, "Alliance")
	self:AddTrainer(26956, "Sally Tompkins", Z.HOWLING_FJORD, 79.4, 29.4, "Horde")
	self:AddTrainer(26992, "Brynna Wilson", Z.BOREAN_TUNDRA, 57.8, 66.5, "Alliance")
	self:AddTrainer(28706, "Olisarra the Kind", Z.DALARAN, 37.5, 36.7, "Neutral")
	self:AddTrainer(29233, "Nurse Applewood", Z.BOREAN_TUNDRA, 41.7, 54.5, "Horde")
	self:AddTrainer(33589, "Joseph Wilson", Z.ICECROWN, 71.5, 22.5, "Neutral")
	self:AddTrainer(33621, 45542, Z.SHATTRATH_CITY, 43.6, 90.4, "Neutral")
	self:AddTrainer(45540, "Krenk Choplimb", Z.ORGRIMMAR, 37.5, 87.3, "Horde")
	self:AddTrainer(49879, "Doc Zapnozzle", Z.AZSHARA, 57.07, 50.71, "Horde")
	self:AddTrainer(50574, "Amelia Atherton", Z.GILNEAS, 36.8, 65.7, "Alliance")
	self:AddTrainer(56796, "Angela Leifeld", Z.STORMWIND_CITY, 52.19, 45.36, "Alliance")
	self:AddTrainer(59077, "Apothecary Cheng", Z.KUN_LAI_SUMMIT, 71.6, 92.8, "Neutral")
	self:AddTrainer(59619, "Mishka", Z.THE_JADE_FOREST, 59.91, 86.33, "Alliance")
	self:AddTrainer(66222, "Elder Muur", Z.THE_JADE_FOREST, 28.2, 15.2, "Horde")

	self.InitializeFirstAidTrainers = nil
end
