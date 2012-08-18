-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeRuneforgingTrainers()
	self:AddTrainer(29194, "Amal'thazad", "Eastern Plaguelands", 80.5, 48.1, "Neutral")
	self:AddTrainer(29195, "Lady Alistra", "Eastern Plaguelands", 83.7, 44.6, "Neutral")
	self:AddTrainer(29196, "Lord Thorval", "Eastern Plaguelands", 80.9, 43.8, "Neutral")
	self:AddTrainer(31084, "Highlord Darion Mograine", "Eastern Plaguelands", 83.5, 49.5, "Neutral")

	self.InitializeRuneforgingTrainers = nil
end
