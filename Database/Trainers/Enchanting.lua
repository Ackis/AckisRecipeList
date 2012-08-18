-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeEnchantingTrainers()
	self:AddTrainer(1317, "Lucan Cordell", "Stormwind City", 53, 74.3, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(3011, "Teg Dawnstrider", "Thunder Bluff", 45.3, 38.4, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3345, "Godan", "Orgrimmar", 53.8, 38.5, "Horde")
	self:AddTrainer(3606, "Alanna Raveneye", "Teldrassil", 36.8, 34.2, "Alliance")
	self:AddTrainer(4213, "Taladan", "Darnassus", 56.4, 31.0, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4616, "Lavinia Crowe", "Undercity", 62.1, 60.5, "Horde")
	self:AddTrainer(5157, "Gimble Thistlefuzz", "Ironforge", 60, 45.4, "Alliance")
	self:AddTrainer(5695, "Vance Undergloom", "Tirisfal Glades", 61.7, 51.6, "Horde")
	self:AddTrainer(7949, "Xylinnia Starshine", "Feralas", 31.6, 44.3, "Alliance")
	self:AddTrainer(11072, "Kitta Firewind", "Elwynn Forest", 64.9, 70.6, "Alliance")
	self:AddTrainer(11073, "Annora", "Uldaman", 0, 0, "Neutral")
	self:AddTrainer(11074, "Hgarth", "Stonetalon Mountains", 49.2, 57.2, "Horde")
	self:AddTrainer(16160, "Magistrix Eredania", "Eversong Woods", 38.2, 72.6, "Horde")
	self:AddTrainer(16633, "Sedana", "Silvermoon City", 70, 24, "Horde")
	self:AddTrainer(16725, "Nahogg", "The Exodar", 40.5, 39.2, "Alliance")
	self:AddTrainer(18753, "Felannia", "Hellfire Peninsula", 52.3, 36.1, "Horde")
	self:AddTrainer(18773, "Johan Barnes", "Hellfire Peninsula", 53.7, 66.1, "Alliance")
	self:AddTrainer(19251, "Enchantress Volali", "Shattrath City", 43.2, 92.3, "Neutral")
	self:AddTrainer(19252, "High Enchanter Bardolan", "Shattrath City", 43.2, 92.2, "Neutral")
	self:AddTrainer(19540, "Asarnan", "Netherstorm", 44.2, 33.7, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(26906, "Elizabeth Jackson", "Howling Fjord", 58.6, 62.8, "Alliance")
	self:AddTrainer(26954, "Emil Autumn", "Howling Fjord", 78.7, 28.3, "Horde")
	self:AddTrainer(26980, "Eorain Dawnstrike", "Borean Tundra", 41.2, 53.9, "Horde")
	self:AddTrainer(26990, "Alexis Marlowe", "Borean Tundra", 57.6, 71.6, "Alliance")
	self:AddTrainer(28693, "Enchanter Nalthanis", "Dalaran", 39.1, 40.5, "Neutral")
	self:AddTrainer(33583, "Fael Morningsong", "Icecrown", 73, 20.6, "Neutral")
	self:AddTrainer(33610, 51313, "Shattrath City", 43.6, 90.4, "Neutral")
	self:AddTrainer(33633, "Enchantress Andiala", "Shattrath City", 55.6, 74.6, "Neutral")
	self:AddTrainer(33676, "Zurii", "Shattrath City", 36.4, 44.6, "Neutral")

	self.InitializeEnchantingTrainers = nil
end
