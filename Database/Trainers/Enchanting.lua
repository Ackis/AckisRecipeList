-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeEnchantingTrainers()
	self:AddTrainer(1317, "Lucan Cordell", Z.STORMWIND_CITY, 53, 74.3, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(3011, "Teg Dawnstrider", Z.THUNDER_BLUFF, 45.3, 38.4, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3345, "Godan", Z.ORGRIMMAR, 53.8, 38.5, "Horde")
	self:AddTrainer(3606, "Alanna Raveneye", Z.TELDRASSIL, 36.8, 34.2, "Alliance")
	self:AddTrainer(4213, "Taladan", Z.DARNASSUS, 56.4, 31, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4616, "Lavinia Crowe", Z.UNDERCITY, 62.1, 60.5, "Horde")
	self:AddTrainer(5157, "Gimble Thistlefuzz", Z.IRONFORGE, 60, 45.4, "Alliance")
	self:AddTrainer(5695, "Vance Undergloom", Z.TIRISFAL_GLADES, 61.7, 51.6, "Horde")
	self:AddTrainer(7949, "Xylinnia Starshine", Z.FERALAS, 31.6, 44.3, "Alliance")
	self:AddTrainer(11072, "Kitta Firewind", Z.ELWYNN_FOREST, 64.9, 70.6, "Alliance")
	self:AddTrainer(11073, "Annora", Z.ULDAMAN, 0, 0, "Neutral")
	self:AddTrainer(11074, "Hgarth", Z.STONETALON_MOUNTAINS, 49.2, 57.2, "Horde")
	self:AddTrainer(16160, "Magistrix Eredania", Z.EVERSONG_WOODS, 38.2, 72.6, "Horde")
	self:AddTrainer(16633, "Sedana", Z.SILVERMOON_CITY, 70, 24, "Horde")
	self:AddTrainer(16725, "Nahogg", Z.THE_EXODAR, 40.5, 39.2, "Alliance")
	self:AddTrainer(18753, "Felannia", Z.HELLFIRE_PENINSULA, 52.3, 36.1, "Horde")
	self:AddTrainer(18773, "Johan Barnes", Z.HELLFIRE_PENINSULA, 53.7, 66.1, "Alliance")
	self:AddTrainer(19251, "Enchantress Volali", Z.SHATTRATH_CITY, 43.2, 92.3, "Neutral")
	self:AddTrainer(19252, "High Enchanter Bardolan", Z.SHATTRATH_CITY, 43.2, 92.2, "Neutral")
	self:AddTrainer(19540, "Asarnan", Z.NETHERSTORM, 44.2, 33.7, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(26906, "Elizabeth Jackson", Z.HOWLING_FJORD, 58.6, 62.8, "Alliance")
	self:AddTrainer(26954, "Emil Autumn", Z.HOWLING_FJORD, 78.7, 28.3, "Horde")
	self:AddTrainer(26980, "Eorain Dawnstrike", Z.BOREAN_TUNDRA, 41.2, 53.9, "Horde")
	self:AddTrainer(26990, "Alexis Marlowe", Z.BOREAN_TUNDRA, 57.6, 71.6, "Alliance")
	self:AddTrainer(28693, "Enchanter Nalthanis", Z.DALARAN, 39.1, 40.5, "Neutral")
	self:AddTrainer(33583, "Fael Morningsong", Z.ICECROWN, 73, 20.6, "Neutral")
	self:AddTrainer(33610, 51313, Z.SHATTRATH_CITY, 43.6, 90.4, "Neutral")
	self:AddTrainer(33633, "Enchantress Andiala", Z.SHATTRATH_CITY, 55.6, 74.6, "Neutral")
	self:AddTrainer(33676, "Zurii", Z.SHATTRATH_CITY, 36.4, 44.6, "Neutral")

	self.InitializeEnchantingTrainers = nil
end
