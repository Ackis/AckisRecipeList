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

	if (IsTradeskillTrainer()) then
		SetTrainerServiceTypeFilter("available", 1)
		SetTrainerServiceTypeFilter("unavailable", 1)
		SetTrainerServiceTypeFilter("used", 1)
		local t = {}
		for i=1,GetNumTrainerServices(),1 do
			local name = GetTrainerServiceInfo(i)
			local _,skilllevel = GetTrainerServiceSkillReq(i)
			if not skilllevel then
				skilllevel = 0
			end
			t[name] = skilllevel
		end
		local recipelist = addon:GetRecipeTable()
		for i in pairs(recipelist) do
			local i_name = recipelist[i]["Name"]
			if (t[i_name]) and (t[i_name] ~= recipelist[i]["Level"]) then
				self:Print("DEBUG: Recipe level different! Name: " .. i_name .. " Internal Level: " ..  recipelist[i]["Level"] .. " External Level: " .. t[i_name])
			end
		end
	else
		self:Print("This can only be used for a trade skill trainer.  Dumbass.")
	end

end
