-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- What we _really_ came here to see...
-----------------------------------------------------------------------
function private:InitializeRuneforgingTrainers()
	self:AddTrainer(29194, "Amal'thazad", Z.EASTERN_PLAGUELANDS, 80.5, 48.1, "Neutral")
	self:AddTrainer(29195, "Lady Alistra", Z.EASTERN_PLAGUELANDS, 83.7, 44.6, "Neutral")
	self:AddTrainer(29196, "Lord Thorval", Z.EASTERN_PLAGUELANDS, 80.9, 43.8, "Neutral")
	self:AddTrainer(31084, "Highlord Darion Mograine", Z.EASTERN_PLAGUELANDS, 83.5, 49.5, "Neutral")

	self.InitializeRuneforgingTrainers = nil
end
