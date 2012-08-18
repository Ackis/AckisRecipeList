-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeBlacksmithingTrainers()
	self:AddTrainer(514, "Smith Argus", "Elwynn Forest", 41.7, 65.6, "Alliance")
	self:AddTrainer(1241, "Tognus Flintfire", "Dun Morogh", 45.3, 52, "Alliance")
	self:AddTrainer(2836, "Brikk Keencraft", "The Cape of Stranglethorn", 44.1, 70.9, "Neutral")
	self:AddTrainer(2998, "Karn Stonehoof", "Thunder Bluff", 39.4, 55.1, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3136, "Clarise Gnarltree", "Duskwood", 74, 48.5, "Alliance")
	self:AddTrainer(3174, "Dwukk", "Durotar", 52, 40.7, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3355, "Saru Steelfury", "Orgrimmar", 76.5, 34.53, "Horde")
	self:AddTrainer(3478, "Traugh", "Northern Barrens", 48.3, 56.2, "Horde")
	self:AddTrainer(3557, "Guillaume Sorouy", "Silverpine Forest", 43.2, 41, "Horde")
	self:AddTrainer(4258, "Bengus Deepforge", "Ironforge", 51, 43, "Alliance")
	self:AddTrainer(4596, "James Van Brunt", "Undercity", 61.2, 29.9, "Horde")
	self:AddTrainer(5164, "Grumnus Steelshaper", "Ironforge", 50.2, 42.8, "Alliance")
	self:AddTrainer(5511, "Therum Deepforge", "Stormwind City", 63.7, 37.0, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(6299, "Delfrum Flintbeard", "Darkshore", 38.2, 41, "Alliance")
	self:AddTrainer(7230, "Shayis Steelfury", "Orgrimmar", 75.91, 37.1, "Horde")
	self:AddTrainer(7231, "Kelgruk Bloodaxe", "Orgrimmar", 76.34, 37.08, "Horde")
	self:AddTrainer(11146, "Ironus Coldsteel", "Ironforge", 50.5, 43.3, "Alliance")
	self:AddTrainer(11177, "Okothos Ironrager", "Orgrimmar", 75.35, 34.04, "Horde")
	self:AddTrainer(11178, "Borgosh Corebender", "Orgrimmar", 75.89, 33.61, "Horde")
	self:AddTrainer(15400, "Arathel Sunforge", "Eversong Woods", 59.6, 62.6, "Horde")
	self:AddTrainer(16583, "Rohok", "Hellfire Peninsula", 53.2, 38.2, "Horde")
	self:AddTrainer(16669, "Bemarrin", "Silvermoon City", 79.5, 39, "Horde")
	self:AddTrainer(16724, "Miall", "The Exodar", 60, 89.6, "Alliance")
	self:AddTrainer(16823, "Humphry", "Hellfire Peninsula", 56.8, 63.8, "Alliance")
	self:AddTrainer(17245, "Blacksmith Calypso", "Azuremyst Isle", 46.4, 71.1, "Alliance")
	self:AddTrainer(19341, "Grutah", "Shadowmoon Valley", 29.7, 31.5, "Horde")
	self:AddTrainer(20124, "Kradu Grimblade", "Shattrath City", 69.2, 44.8, "Neutral")
	self:AddTrainer(20125, "Zula Slagfury", "Shattrath City", 70.1, 42, "Neutral")
	self:AddTrainer(26564, "Borus Ironbender", "Dragonblight", 36.6, 47.1, "Horde")
	self:AddTrainer(26904, "Rosina Rivet", "Howling Fjord", 59.6, 63.7, "Alliance")
	self:AddTrainer(26952, "Kristen Smythe", "Howling Fjord", 79.2, 29, "Horde")
	self:AddTrainer(26981, "Crog Steelspine", "Borean Tundra", 40.8, 55.3, "Horde")
	self:AddTrainer(26988, "Argo Strongstout", "Borean Tundra", 57.2, 66.6, "Alliance")
	self:AddTrainer(27034, "Josric Fame", "Dragonblight", 75.9, 63.2, "Horde")
	self:AddTrainer(28694, "Alard Schmied", "Dalaran", 45.5, 28.5, "Neutral")
	self:AddTrainer(29505, "Imindril Spearsong", "Dalaran", 45.5, 28.6, "Neutral")
	self:AddTrainer(29506, "Orland Schaeffer", "Dalaran", 45, 28.4, "Neutral")
	self:AddTrainer(29924, "Brandig", "The Storm Peaks", 28.9, 74.9, "Alliance")
	self:AddTrainer(33591, "Rekka the Hammer", "Icecrown", 71.9, 20.9, "Neutral")
	self:AddTrainer(33609, 51300, "Shattrath City", 43.9, 90.5, "Neutral")
	self:AddTrainer(33631, "Barien", "Shattrath City", 43.5, 65.1, "Neutral")
	self:AddTrainer(33675, "Onodo", "Shattrath City", 37.7, 30.3, "Neutral")
	self:AddTrainer(37072, "Rogg", "Orgrimmar", 44.5, 78, "Horde")
	self:AddTrainer(44781, "Opuno Ironhorn", "Orgrimmar", 40.6, 49.4, "Horde")
	self:AddTrainer(45548, "Kark Helmbreaker", "Orgrimmar", 36, 83, "Horde")

	self.InitializeBlacksmithingTrainers = nil
end
