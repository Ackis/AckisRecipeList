-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeCookingTrainers()
	self:AddTrainer(1355, "Cook Ghilm", "Dun Morogh", 68.4, 54.5, "Alliance")
	self:AddTrainer(1382, "Mudduk", "Northern Stranglethorn", 37.2, 49.2, "Horde")
	self:AddTrainer(1430, "Tomas", "Elwynn Forest", 44.3, 66, "Alliance")
	self:AddTrainer(1699, "Gremlock Pilsnor", "Dun Morogh", 47.6, 52.3, "Alliance")
	self:AddTrainer(2818, "Slagg", "Arathi Highlands", 74.1, 33.8, "Horde")
	self:AddTrainer(3026, "Aska Mistrunner", "Thunder Bluff", 50.7, 53.1, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(3067, "Pyall Silentstride", "Mulgore", 45.5, 58.1, "Horde")
	self:AddTrainer(3087, "Crystal Boughman", "Redridge Mountains", 22.8, 43.6, "Alliance")
	self:AddTrainer(3399, "Zamja", "Orgrimmar", 57.5, 53.7, "Horde")
	self:AddTrainer(4210, "Alegorn", "Darnassus", 49.9, 36.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(4552, "Eunice Burch", "Undercity", 62.3, 44.6, "Horde")
	self:AddTrainer(5159, "Daryl Riknussun", "Ironforge", 60.1, 36.8, "Alliance")
	self:AddTrainer(5482, "Stephen Ryback", "Stormwind City", 77.2, 53.2, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(6286, "Zarrin", "Teldrassil", 56.6, 53.6, "Alliance") -- COMPLETELY UPDATED
	self:AddTrainer(8306, "Duhng", "Northern Barrens", 55.4, 61.3, "Horde")
	self:AddTrainer(16253, "Master Chef Mouldier", "Ghostlands", 48.3, 30.9, "Horde") -- COMPLETELY UPDATED
	self:AddTrainer(16277, "Quarelestra", "Eversong Woods", 48.6, 47.1, "Horde")
	self:AddTrainer(16676, "Sylann", "Silvermoon City", 69.5, 71.5, "Horde")
	self:AddTrainer(16719, "Mumman", "The Exodar", 55.6, 27.1, "Alliance")
	self:AddTrainer(17246, "\"Cookie\" McWeaksauce", "Azuremyst Isle", 46.7 , 70.5, "Alliance" )
	self:AddTrainer(18987, "Gaston", "Hellfire Peninsula", 54.1, 63.5, "Alliance")
	self:AddTrainer(18988, "Baxter", "Hellfire Peninsula", 56.8, 37.5, "Horde")
	self:AddTrainer(18993, "Naka", "Zangarmarsh", 78.5, 63, "Neutral") -- COMPLETELY UPDATED
	self:AddTrainer(19185, "Jack Trapper", "Shattrath City", 63, 68.5, "Neutral")
	self:AddTrainer(19186, "Kylene", "Shattrath City", 76.5, 33, "Neutral")
	self:AddTrainer(19369, "Celie Steelwing", "Shadowmoon Valley", 37.2, 58.5, "Alliance")
	self:AddTrainer(26905, "Brom Brewbaster", "Howling Fjord", 58.2, 62.1, "Alliance")
	self:AddTrainer(26953, "Thomas Kolichio", "Howling Fjord", 78.6, 29.4, "Horde")
	self:AddTrainer(26972, "Orn Tenderhoof", "Borean Tundra", 42, 54.2, "Horde")
	self:AddTrainer(26989, "Rollick MacKreel", "Borean Tundra", 57.9, 71.5, "Alliance")
	self:AddTrainer(28705, "Katherine Lee", "Dalaran", 40.8, 65.2, "Alliance")
	self:AddTrainer(29631, "Awilo Lon'gomba", "Dalaran", 70, 38.6, "Horde")
	self:AddTrainer(33587, "Bethany Cromwell", "Icecrown", 72.4, 20.8, "Neutral")
	self:AddTrainer(33619, 51296, "Shattrath City", 43.6, 91.1, "Neutral")
	self:AddTrainer(45550, "Zarbo Porkpatty", "Orgrimmar", 39, 85.8, "Neutral")
	self:AddTrainer(46709, "Arugi", "Orgrimmar", 56.5, 61.5, "Horde")
	self:AddTrainer(47405, "The Chef", "Tirisfal Glades", 61.2, 52.6, "Horde")
	self:AddTrainer(49789, "Allison", "Hellfire Peninsula", 56.8, 37.4, "Horde")
	self:AddTrainer(54232, "Mrs. Gant", "The Cape of Stranglethorn", 42.6, 72.8, "Neutral") -- COMPLETELY UPDATED

	self.InitializeCookingTrainers = nil
end
