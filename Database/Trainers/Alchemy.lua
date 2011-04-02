-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeAlchemyTrainers()
	self:AddTrainer(1215, "Alchemist Mallory", "Elwynn Forest", 39.8, 48.3, "Alliance")
	self:AddTrainer(1246, "Vosur Brakthel", "Ironforge", 66.5, 55.2, "Alliance")
	self:AddTrainer(1386, "Rogvar", "Swamp of Sorrows", 50.0, 56.2, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(1470, "Ghak Healtouch", "Loch Modan", 37, 49.2, "Alliance")
	self:AddTrainer(2132, "Carolai Anise", "Tirisfal Glades", 59.5, 52.2, "Horde")
	self:AddTrainer(2391, "Serge Hinott", "Hillsbrad Foothills", 49.1, 66.4, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(2837, "Jaxin Chong", "The Cape of Stranglethorn", 42.6, 74.8, "Neutral")
	self:AddTrainer(3009, "Bena Winterhoof", "Thunder Bluff", 46.6, 33.2, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3184, "Miao'zan", "Durotar", 55.5, 74, "Horde")
	self:AddTrainer(3347, "Yelmak", "Orgrimmar", 56.7, 33.2, "Horde")
	self:AddTrainer(3603, "Cyndra Kindwhisper", "Teldrassil", 57.6, 60.7, "Alliance")
	self:AddTrainer(3964, "Kylanna", "Ashenvale", 50.8, 67.1, "Alliance")
	self:AddTrainer(4160, "Ainethil", "Darnassus", 53.9, 48.5, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4611, "Doctor Herbert Halsey", "Undercity", 47.7, 73, "Horde")
	self:AddTrainer(4900, "Alchemist Narett", "Dustwallow Marsh", 64, 47.7, "Alliance")
	self:AddTrainer(5177, "Tally Berryfizz", "Ironforge", 66.6, 55.2, "Alliance")
	self:AddTrainer(5499, "Lilyssia Nightbreeze", "Stormwind City", 55.6, 85.9, "Alliance")
	self:AddTrainer(7948, "Kylanna Windwhisper", "Feralas", 32.6, 43.8, "Alliance")
	self:AddTrainer(16161, "Arcanist Sheynathren", "Eversong Woods", 38.2, 72.5, "Horde")
	self:AddTrainer(16588, "Apothecary Antonivich", "Hellfire Peninsula", 52.4, 36.5, "Horde")
	self:AddTrainer(16642, "Camberon", "Silvermoon City", 66.1, 17.4, "Horde")
	self:AddTrainer(16723, "Lucc", "The Exodar", 27.5, 60.9, "Alliance")
	self:AddTrainer(17215, "Daedal", "Azuremyst Isle", 48.5, 51.5, "Alliance")
	self:AddTrainer(18802, "Alchemist Gribble", "Hellfire Peninsula", 53.8, 65.8, "Alliance")
	self:AddTrainer(19052, "Lorokeem", "Shattrath City", 45.4, 19.5, "Neutral")
	self:AddTrainer(26903, "Lanolis Dewdrop", "Howling Fjord", 58.4, 62.3, "Alliance")
	self:AddTrainer(26951, "Wilhelmina Renel", "Howling Fjord", 78.7, 28.5, "Horde")
	self:AddTrainer(26975, "Arthur Henslowe", "Borean Tundra", 41.8, 54.3, "Horde")
	self:AddTrainer(26987, "Falorn Nightwhisper", "Borean Tundra", 57.8, 71.9, "Alliance")
	self:AddTrainer(27023, "Apothecary Bressa", "Dragonblight", 36.2, 48.7, "Horde")
	self:AddTrainer(27029, "Apothecary Wormwick", "Dragonblight", 76.9, 62.2, "Horde")
	self:AddTrainer(28703, "Linzy Blackbolt", "Dalaran", 42.5, 32.1, "Neutral")
	self:AddTrainer(33588, "Crystal Brightspark", "Icecrown", 71.6, 21, "Neutral")
	self:AddTrainer(33608, 51304, "Shattrath City", 44.3, 90.4, "Neutral")
	self:AddTrainer(33630, "Aelthin", "Shattrath City", 38.6, 70.8, "Neutral")
	self:AddTrainer(33674, "Alchemist Kanhu", "Shattrath City", 38.6, 30, "Neutral")

	self.InitializeAlchemyTrainers = nil
end
