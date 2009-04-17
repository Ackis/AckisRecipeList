--[[

****************************************************************************************

ARLDatamine.lua

In-game datamining functions for ARL

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

****************************************************************************************

]]--


local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local GetNumTrainerServices = GetNumTrainerServices
local GetTrainerServiceInfo = GetTrainerServiceInfo
local IsTradeskillTrainer = IsTradeskillTrainer
local SetTrainerServiceTypeFilter = SetTrainerServiceTypeFilter
local GetTrainerServiceSkillReq = GetTrainerServiceSkillReq
local pairs = pairs

-- Description: Parses a trainer, comparing skill levels internal to those on the trainer.

--- API for external addons to get recipe database from ARL
-- @name AckisRecipeList:ScanSkillLevelData
-- @return Does a comparison of the information in your internal ARL database, and those items which are availible on the trainer.  Compares the skill levels between the two.
function addon:ScanSkillLevelData()

	-- Are we at a trade skill trainer?
	if (IsTradeskillTrainer()) then
		SetTrainerServiceTypeFilter("available", 1)
		SetTrainerServiceTypeFilter("unavailable", 1)
		SetTrainerServiceTypeFilter("used", 1)
		local t = {}
		-- Get the skill levels from the trainer
		for i=1,GetNumTrainerServices(),1 do
			local name = GetTrainerServiceInfo(i)
			local _,skilllevel = GetTrainerServiceSkillReq(i)
			if not skilllevel then
				skilllevel = 0
			end
			t[name] = skilllevel
		end
		-- Get internal database
		local recipelist = addon:GetRecipeTable()
		for i in pairs(recipelist) do
			local i_name = recipelist[i]["Name"]
			if (t[i_name]) and (t[i_name] ~= recipelist[i]["Level"]) then
				self:Print(L["DATAMINER_SKILLELVEL"]:format(i_name,recipelist[i]["Level"],t[i_name]))
			end
		end
	else
		self:Print(L["DATAMINER_SKILLLEVEL_ERROR"])
	end

end

-- Description: Parses a trainer, comparing all recipes you can learn with where you can learn them in the database

--- API for external addons to get recipe database from ARL
-- @name AckisRecipeList:ScanTrainerData
-- @return Does a comparison of the information in your internal ARL database, and those items which are availible on the trainer.  Compares the acquire information of the ARL database with what is availible on the trainer.
function addon:ScanTrainerData()

	-- Make sure the target exists and is a NPC
	if (UnitExists("target") and (not UnitIsPlayer("target")) and (not UnitIsEnemy("player", "target"))) then

		-- Get its name
		local targetname = UnitName("target")
		-- Get the NPC ID
		local targetID = tonumber(string.sub(UnitGUID("target"),-12,-7),16)

		-- Are we at a trade skill trainer?
		if (IsTradeskillTrainer()) then
			SetTrainerServiceTypeFilter("available", 1)
			SetTrainerServiceTypeFilter("unavailable", 1)
			SetTrainerServiceTypeFilter("used", 1)
			local t = {}
			-- Get all the names of recipes from the trainer
			for i=1,GetNumTrainerServices(),1 do
				local name = GetTrainerServiceInfo(i)
				t[name] = true
			end
			-- Dump out trainer info
			self:Print(L["DATAMINER_TRAINER_INFO"]:format(targetname, targetID))
			-- Get internal database
			local recipelist = addon:GetRecipeTable()
			for i in pairs(recipelist) do
				local i_name = recipelist[i]["Name"]
				local acquire = recipelist[i]["Acquire"]
				-- If the trainer teaches this recipe
				if t[i_name] then
					local found = false
					-- Parse acquire info
					for i in pairs(acquire) do
						if (acquire[i]["Type"] == 1) then
							if (acquire[i]["ID"] == targetID) then
								found = true
							end
						end
					end
					if (not found) then
						self:Print(L["DATAMINER_TRAINER_TEACH"]:format(i_name))
					end
				-- Trainer does not teach this recipe
				else
					local found = false
					-- Parse acquire info
					for i in pairs(acquire) do
						if (acquire[i]["Type"] == 1) then
							if (acquire[i]["ID"] == targetID) then
								found = true
							end
						end
					end
					if (found) then
						self:Print(L["DATAMINER_TRAINER_NOTTEACH"]:format(i_name))
					end
				end
			end
		else
			self:Print(L["DATAMINER_SKILLLEVEL_ERROR"])
		end
	else
		self:Print(L["DATAMINER_TRAINER_NOTTARGETTED"])
	end

end
