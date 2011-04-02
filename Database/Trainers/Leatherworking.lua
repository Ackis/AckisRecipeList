-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeLeatherworkingTrainers()
	self:AddTrainer(1385, "Brawn", "Northern Stranglethorn", 37.8, 50.4, "Horde")
	self:AddTrainer(1632, "Adele Fielder", "Elwynn Forest", 46.4, 62.1, "Alliance")
	self:AddTrainer(3007, "Una", "Thunder Bluff", 41.5, 42.6, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3069, "Chaw Stronghide", "Mulgore", 45.5, 57.9, "Horde")
	self:AddTrainer(3365, "Karolek", "Orgrimmar", 62.8, 44.5, "Horde")
	self:AddTrainer(3549, "Shelene Rhobart", "Tirisfal Glades", 65.5, 61, "Horde")
	self:AddTrainer(3605, "Nadyia Maneweaver", "Teldrassil", 41.8, 49.5, "Alliance")
	self:AddTrainer(3967, "Aayndia Floralwind", "Ashenvale", 35.9, 52.1, "Alliance")
	self:AddTrainer(4212, "Telonis", "Darnassus", 60.5, 36.8, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4588, "Arthur Moore", "Undercity", 70.3, 58.5, "Horde")
	self:AddTrainer(5127, "Fimble Finespindle", "Ironforge", 39.8, 33.5, "Alliance")
	self:AddTrainer(5564, "Simon Tanner", "Stormwind City", 71.8, 62.9, "Alliance") -- UPDATED
	self:AddTrainer(5784, "Waldor", "Wailing Caverns", 32.6, 28.5, "Neutral")
	self:AddTrainer(7867, "Thorkaf Dragoneye", "Badlands", 62.6, 57.6, "Horde")
	self:AddTrainer(7868, "Sarah Tanner", "Searing Gorge", 63.7, 75.7, "Alliance")
	self:AddTrainer(7869, "Brumn Winterhoof", "Arathi Highlands", 28.2, 45, "Horde")
	self:AddTrainer(7870, "Caryssia Moonhunter", "Feralas", 89.4, 46.5, "Alliance")
	self:AddTrainer(7871, "Se'Jib", "Northern Stranglethorn", 45.3, 58.7, "Horde")
	self:AddTrainer(8153, "Narv Hidecrafter", "Desolace", 55.3, 56.3, "Horde")
	self:AddTrainer(11097, "Drakk Stonehand", "The Hinterlands", 13.4, 43.4, "Alliance")
	self:AddTrainer(11098, "Hahrana Ironhide", "Feralas", 74.4, 43.1, "Horde")
	self:AddTrainer(16278, "Sathein", "Eversong Woods", 53.5, 51, "Horde")
	self:AddTrainer(16688, "Lynalis", "Silvermoon City", 84, 80.2, "Horde")
	self:AddTrainer(16728, "Akham", "The Exodar", 66, 74.6, "Alliance")
	self:AddTrainer(17442, "Moordo", "Azuremyst Isle", 44.8, 23.8, "Alliance")
	self:AddTrainer(18754, "Barim Spilthoof", "Hellfire Peninsula", 56.2, 38.6, "Horde")
	self:AddTrainer(18771, "Brumman", "Hellfire Peninsula", 54.1, 64, "Alliance")
	self:AddTrainer(19187, "Darmari", "Shattrath City", 66.8, 67.1, "Neutral")
	self:AddTrainer(21087, "Grikka", "Blade's Edge Mountains", 76.8, 65.5, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(26911, "Bernadette Dexter", "Howling Fjord", 59.9, 63.6, "Alliance")
	self:AddTrainer(26961, "Gunter Hansen", "Howling Fjord", 78.3, 28.2, "Horde")
	self:AddTrainer(26996, "Awan Iceborn", "Borean Tundra", 76.3, 37, "Horde")
	self:AddTrainer(26998, "Rosemary Bovard", "Borean Tundra", 57.6, 71.9, "Alliance")
	self:AddTrainer(28700, "Diane Cannings", "Dalaran", 35.7, 28.8, "Neutral")
	self:AddTrainer(29507, "Manfred Staller", "Dalaran", 34.2, 29.5, "Neutral")
	self:AddTrainer(29508, "Andellion", "Dalaran", 34.5, 27.1, "Neutral")
	self:AddTrainer(29509, "Namha Moonwater", "Dalaran", 36.3, 29.4, "Neutral")
	self:AddTrainer(33581, "Kul'de", "Icecrown", 71.8, 20.8, "Neutral")
	self:AddTrainer(33612, 51302, "Shattrath City", 43.8, 90.9, "Neutral")
	self:AddTrainer(33635, "Daenril", "Shattrath City", 41.9, 63.4, "Neutral")
	self:AddTrainer(33681, "Korim", "Shattrath City", 37.6, 28, "Neutral")

	self.InitializeLeatherworkingTrainers = nil
end
