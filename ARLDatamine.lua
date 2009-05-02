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

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local UnitName = UnitName
local UnitGUID = UnitGUID
local UnitExists = UnitExists
local UnitIsPlayer = UnitIsPlayer
local UnitIsEnemy = UnitIsEnemy
local GetNumTrainerServices = GetNumTrainerServices
local GetTrainerServiceInfo = GetTrainerServiceInfo
local IsTradeskillTrainer = IsTradeskillTrainer
local SetTrainerServiceTypeFilter = SetTrainerServiceTypeFilter
local GetTrainerServiceSkillReq = GetTrainerServiceSkillReq
local GetMerchantNumItems = GetMerchantNumItems
local GetMerchantItemLink = GetMerchantItemLink
local GetMerchantItemInfo = GetMerchantItemInfo
local pairs = pairs
local tconcat = table.concat
local tsort = table.sort
local tinsert = table.insert

local function LoadRecipe()

	local recipelist = addon:GetRecipeTable()
	local dbloaded

	if (not recipelist) then
		if (addon.db.profile.autoloaddb) then
			dbloaded, recipelist = addon:InitRecipeData()
			if (not dbloaded) then
				return
			else
				addon:AddRecipeData(GetSpellInfo(51304))
				addon:AddRecipeData(GetSpellInfo(51300))
				addon:AddRecipeData(GetSpellInfo(51296))
				addon:AddRecipeData(GetSpellInfo(51313))
				addon:AddRecipeData(GetSpellInfo(51306))
				addon:AddRecipeData(GetSpellInfo(45542))
				addon:AddRecipeData(GetSpellInfo(51302))
				addon:AddRecipeData(GetSpellInfo(61422))
				addon:AddRecipeData(GetSpellInfo(51309))
				addon:AddRecipeData(GetSpellInfo(51311))
				addon:AddRecipeData(GetSpellInfo(45363))
				addon:AddRecipeData(GetSpellInfo(53428))
			end
		else
			addon:Print(L["DATAMINER_NODB_ERROR"])
			return
		end
	else
		-- Recipe DB exists, we just need to populate it now
		if (addon.db.profile.autoloaddb) then
			addon:AddRecipeData(GetSpellInfo(51304))
			addon:AddRecipeData(GetSpellInfo(51300))
			addon:AddRecipeData(GetSpellInfo(51296))
			addon:AddRecipeData(GetSpellInfo(51313))
			addon:AddRecipeData(GetSpellInfo(51306))
			addon:AddRecipeData(GetSpellInfo(45542))
			addon:AddRecipeData(GetSpellInfo(51302))
			addon:AddRecipeData(GetSpellInfo(61422))
			addon:AddRecipeData(GetSpellInfo(51309))
			addon:AddRecipeData(GetSpellInfo(51311))
			addon:AddRecipeData(GetSpellInfo(45363))
			addon:AddRecipeData(GetSpellInfo(53428))
		end
	end

	return recipelist

end

-- Description: Parses a trainer, comparing skill levels internal to those on the trainer.

--- Function to compare the skill levels of a trainers recipes with those in the ARL database.
-- @name AckisRecipeList:ScanSkillLevelData
-- @return Does a comparison of the information in your internal ARL database, and those items which are availible on the trainer.  Compares the skill levels between the two.
function addon:ScanSkillLevelData(autoscan)

	-- Are we at a trade skill trainer?
	if (IsTradeskillTrainer()) then

		-- Get internal database
		local recipelist = LoadRecipe()

		if (not recipelist) then
			self:Print(L["DATAMINER_NODB_ERROR"])
			return
		end

		-- Get the initial trainer filters
		local avail = GetTrainerServiceTypeFilter("available")
		local unavail = GetTrainerServiceTypeFilter("unavailable")
		local used = GetTrainerServiceTypeFilter("used")

		-- Clear the trainer filters
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

		for i in pairs(recipelist) do
			local i_name = recipelist[i]["Name"]
			if (t[i_name]) and (t[i_name] ~= recipelist[i]["Level"]) then
				self:Print(L["DATAMINER_SKILLELVEL"]:format(i_name,recipelist[i]["Level"],t[i_name]))
			end
		end

		-- Reset the filters to what they were before
		SetTrainerServiceTypeFilter("available", avail or 0)
		SetTrainerServiceTypeFilter("unavailable", unavail or 0)
		SetTrainerServiceTypeFilter("used", used or 0)

		self:Print("Trainer Skill Level Scan Complete.")
	elseif (not autoscan) then
		self:Print(L["DATAMINER_SKILLLEVEL_ERROR"])
	end

end

-- Description: Parses a trainer, comparing all recipes you can learn with where you can learn them in the database

--- Function to compare which recipes are availible from a trainer and compare with the internal ARL database.
-- @name AckisRecipeList:ScanTrainerData
-- @return Does a comparison of the information in your internal ARL database, and those items which are availible on the trainer.  Compares the acquire information of the ARL database with what is availible on the trainer.
function addon:ScanTrainerData(autoscan)

	-- Make sure the target exists and is a NPC
	if (UnitExists("target") and (not UnitIsPlayer("target")) and (not UnitIsEnemy("player", "target"))) then

		-- Get its name
		local targetname = UnitName("target")
		-- Get the NPC ID
		local targetID = tonumber(string.sub(UnitGUID("target"),-12,-7),16)

		-- Are we at a trade skill trainer?
		if (IsTradeskillTrainer()) then

			-- Get internal database
			local recipelist = LoadRecipe()

			if (not recipelist) then
				self:Print(L["DATAMINER_NODB_ERROR"])
				return
			end

			-- Get the initial trainer filters
			local avail = GetTrainerServiceTypeFilter("available")
			local unavail = GetTrainerServiceTypeFilter("unavailable")
			local used = GetTrainerServiceTypeFilter("used")

			-- Clear the trainer filters
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

			local teach = {}
			local noteach = {}
			local teachflag = false
			local noteachflag = false

			for i in pairs(recipelist) do

				local i_name = recipelist[i]["Name"]
				local acquire = recipelist[i]["Acquire"]
				local flags = recipelist[i]["Flags"]

				-- If the trainer teaches this recipe
				if (t[i_name]) then
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
						tinsert(teach,i)
						teachflag = true
						if (not flags[3]) then
							self:Print(i .. ": Trainer flag needs to be set.")
						end
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
						noteachflag = true
						tinsert(noteach,i)
					end
				end
			end

			if (teachflag) then
				self:Print("Missing entries (need to be added):")
				tsort(teach)

				for i in ipairs(teach) do
					self:Print(L["DATAMINER_TRAINER_TEACH"]:format(teach[i], recipelist[teach[i]]["Name"]))
				end
			end

			if (noteachflag) then
				self:Print("Extra entries (need to be removed):")
				tsort(noteach)

				for i in ipairs(noteach) do
					self:Print(L["DATAMINER_TRAINER_NOTTEACH"]:format(noteach[i], recipelist[noteach[i]]["Name"]))
				end
			end

			-- Reset the filters to what they were before
			SetTrainerServiceTypeFilter("available", avail or 0)
			SetTrainerServiceTypeFilter("unavailable", unavail or 0)
			SetTrainerServiceTypeFilter("used", used or 0)

			self:Print("Trainer Acquire Scan Complete.")
		elseif (not autoscan) then
			self:Print(L["DATAMINER_SKILLLEVEL_ERROR"])
		end
	else
		if (not autoscan) then
			self:Print(L["DATAMINER_TRAINER_NOTTARGETTED"])
		end
	end

end

-- Description: Generates tradeskill links with all recipes.  Used for testing to see if a recipe is missing from the database or not.

--- Generates tradeskill links for all professions so you can scan them for completeness.
-- @name AckisRecipeList:GenerateLinks
-- @return Generates tradeskill links with all recipes.  Used for testing to see if a recipe is missing from the database or not.
function addon:GenerateLinks()

	-- This code adopted from Gnomish Yellow Pages with permission

	local guid = UnitGUID("player")
	local playerGUID = string.gsub(guid,"0x0+", "")

	-- Listing of all tradeskill professions
	local tradelist = {51304, 51300, 51313, 51306, 45363, 51311, 51302, 51309, 51296, 45542}

	local bitmap = {}
	bitmap[45542] = "8bffAA" -- First Aid
	bitmap[51296] = "2/7///7///9////7//////////g+/B" -- Cooking
	bitmap[51306] = "4/////////////3nFA+///9+/P7//f//n//9dgdJgHA87/3f/TolD" -- Engineering
	bitmap[51302] = "e+//////////////v//P+f///3///7/9f9//////////f///////HQ5+////B4//+///////5///////PA/Eg//" -- LW
	bitmap[51304] = "2//v//////f////3//v///////6//////////9////X" -- Alchemy
	--bitmap[51300] = "" -- Blacksmithing
	-- Tailoring
	-- JC
	-- Inscription
	--bitmap[51313] = "4//////////7///////////w//++/9vn7///////3P/t/n//BAB" -- Enchanting
	bitmap[51313] = "4//////////7///////////w//++/9vn7///////3P/t/n//BAD" -- Enchanting

	for i in pairs(tradelist) do

		local tradeName = GetSpellInfo(tradelist[i])
		local tradelink = {}
		tradelink[1] = "|cffffd000|Htrade:"
		tradelink[2] = tradelist[i]
		tradelink[3] = ":450:450:"
		tradelink[4] = playerGUID
		tradelink[5] = ":"
		tradelink[6] = bitmap[tradelist[i]]
		tradelink[7] = "|h["
		tradelink[8] = tradeName
		tradelink[9] = "]|h|r"

		if (bitmap[tradelist[i]]) then
			self:Print(tconcat(tradelink,""))
		else
			self:Print("I don't have the bitmap for " .. tradeName .. " yet.")
		end
		-- /script DEFAULT_CHAT_FRAME:AddMessage(gsub(GetTradeSkillListLink(), "\124", "\124\124"))
	end

end

local ARLDatamineTT = CreateFrame("GameTooltip","ARLDatamineTT",UIParent,"GameTooltipTemplate")

-- Description: Scans the items on a vendor, determining which recipes are availible if any and compares it with the database entries.

--- Scans the items on a vendor, determining which recipes are availible if any and compares it with the database entries.
-- @name AckisRecipeList:ScanVendor
-- @return Obtains all the vendor information on tradeskill recipes and attempts to compare the current vendor with the internal database.

function addon:ScanVendor()

	-- Make sure the target exists and is a NPC
	if (UnitExists("target") and (not UnitIsPlayer("target")) and (not UnitIsEnemy("player", "target"))) then

		-- Get its name
		local targetname = UnitName("target")
		-- Get the NPC ID
		local targetID = tonumber(string.sub(UnitGUID("target"),-12,-7),16)

		GameTooltip_SetDefaultAnchor(ARLDatamineTT, UIParent)

		for i=1,GetMerchantNumItems(),1 do
			local name, _, _, _, numAvailable = GetMerchantItemInfo(i)
			local link = GetMerchantItemLink(i)
			-- Will have to do tooltip scanning here.
			-- Skill level, profession, limited supply
			ARLDatamineTT:SetHyperlink(link)
			for i = 1, ARLDatamineTT:NumLines(),1 do
				local linetext = _G["GameTooltipTextLeft" .. i]
				self:Print(linetext)
			end
		end
		ARLDatamineTT:Hide()
	else
		self:Print(L["DATAMINER_VENDOR_NOTTARGETTED"])
	end

end
