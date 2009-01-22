--[[

****************************************************************************************

ARLFrame.lua

Frame functions for all of AckisRecipeList

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

****************************************************************************************

]]--

local MODNAME	= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local string = string
local ipairs = ipairs
local tinsert = tinsert
local sformat = string.format

-- local variables for this file. Must be used by multiple functions to be listed here
local currentProfIndex = 0
local currentProfession = ""
local maxVisibleRecipes = 24
local FilterValueMap = {}
local sortedRecipeIndex = {}
local DisplayStrings = {}
local myFaction = ""
local ApplyFilterState = nil

local narrowFont = nil
local normalFont = nil

local pairs = pairs
local GetSpellInfo = GetSpellInfo
local GetSkillLineInfo = GetSkillLineInfo
local GetNumSkillLines = GetNumSkillLines
local ExpandSkillHeader = ExpandSkillHeader
local CollapseSkillHeader = CollapseSkillHeader

-- Fallback in case the user doesn't have LSM-3.0 installed
if (not LibStub:GetLibrary("LibSharedMedia-3.0", true)) then

	local locale = GetLocale()

	-- Fix for font issues on koKR
	if (locale == "koKR") then
		narrowFont = "Fonts\\2002.TTF"
		normalFont = "Fonts\\2002.TTF"
	else
		narrowFont = "Fonts\\ARIALN.TTF"
		normalFont = "Fonts\\FRIZQT__.TTF"
	end

else

	-- Register LSM 3.0
	local LSM3 = LibStub("LibSharedMedia-3.0")

	narrowFont = LSM3:Fetch(LSM3.MediaType.FONT, "Arial Narrow")
	normalFont = LSM3:Fetch(LSM3.MediaType.FONT, "Friz Quadrata TT")

end

-- local versions of the databases storing the recipe information, trainers, vendors, etc
local recipeDB = {}
local trainerDB = {}
local vendorDB = {}
local questDB = {}
local repDB = {}
local seasonDB = {}
local customDB = {}
local mobDB = {}
local allSpecTable = {}
local playerData = {}

local arlTooltip = _G["arlTooltip"]
local arlTooltip2 = _G["arlTooltip2"]

local ARL_SearchText,ARL_LastSearchedText
local ARL_ExpGeneralOptCB,ARL_ExpObtainOptCB,ARL_ExpBindingOptCB,ARL_ExpItemOptCB,ARL_ExpPlayerOptCB,ARL_ExpRepOptCB,ARL_RepOldWorldCB,ARL_RepBCCB,ARL_RepLKCB

-- To make tabbing between professions easier 
local SortedProfessions = { 
	{ name = GetSpellInfo(2259),	texture = "alchemy" },	-- 1 
	{ name = GetSpellInfo(2018),	texture = "blacksmith" }, -- 2 
	{ name = GetSpellInfo(2550),	texture = "cooking" },	-- 3 
	{ name = GetSpellInfo(7411),	texture = "enchant" },	-- 4 
	{ name = GetSpellInfo(4036),	texture = "engineer" },	-- 5 
	{ name = GetSpellInfo(746),		texture = "firstaid" },	-- 6 
	{ name = GetSpellInfo(45357),	texture = "inscribe" },	-- 7 
	{ name = GetSpellInfo(25229),	texture = "jewel" },	-- 8 
	{ name = GetSpellInfo(2108),	texture = "leather" },	-- 9 
	{ name = GetSpellInfo(53428),	texture = "runeforge" }, -- 10 
	{ name = GetSpellInfo(2575),	texture = "smelting" },	-- 11 
	--{ name = GetSpellInfo(2656),	texture = "smelting" },	-- 11 
	{ name = GetSpellInfo(3908),	texture = "tailor" },	-- 12 
} 

local MaxProfessions = 12

-- Some variables I want to use in creating the GUI later... (ZJ 8/26/08)
local ExpButtonText = {
	L["General"],		-- 1
	L["Obtain"],		-- 2
	L["Binding"],		-- 3
	L["Item"],			-- 4
	L["Player Type"],	-- 5
	L["Reputation"]		-- 6
}

local ExpButtonTT = {
	L["FILTERING_GENERAL_DESC"],	-- 1
	L["FILTERING_OBTAIN_DESC"],		-- 2
	L["FILTERING_BINDING_DESC"],	-- 3
	L["FILTERING_ITEM_DESC"],		-- 4
	L["FILTERING_PLAYERTYPE_DESC"],	-- 5
	L["FILTERING_REP_DESC"]			-- 6
}


-- Define the static popups we're going to call when people don't have a
-- scanned or don't are blocking all recipes from being displayed
-- with current filters

StaticPopupDialogs["ARL_NOTSCANNED"] = {
	text = L["NOTSCANNED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLFILTERED"] = {
	text = L["ALL_FILTERED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLKNOWN"] = {
	text = L["ARL_ALLKNOWN"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLEXCLUDED"] = {
	text = L["ARL_ALLEXCLUDED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:CloseWindow()

	addon.Frame:Hide()

end

-- Description: Colours a skill level based on if the player can learn it
-- Expected result: The recipe string is coloured based on if the player has a high enough skill level or faction to learn it
-- Input: The skill, player skill level, if they have the faction, and the string
-- Output: An appropiatly coloured string

local function ColourSkillLevel(recipeSkill, playerSkill, hasFaction, recStr)

	if ((recipeSkill > playerSkill) or (not hasFaction)) then
		return addon:Red(recStr)
	elseif ((playerSkill - recipeSkill) < 20) then
		return addon:Orange(recStr)
	elseif ((playerSkill - recipeSkill) < 30) then
		return addon:Yellow(recStr)
	elseif ((playerSkill - recipeSkill) < 40) then
		return addon:Green(recStr)
	else
		return addon:MidGrey(recStr)
	end

end

-- Description: Function to determine if the player has an appropiate level of faction.
-- Expected result: A boolean value determing if the player can learn the recipe based on faction
-- Input: The database, the index of the recipe, the players faction and reputation levels
-- Output: A boolean indicating if they can learn the recipe or not

local function checkFactions(DB, recipeIndex, playerFaction, playerRep)

	local fac = true
	local acquire = DB[recipeIndex]["Acquire"]

	-- Scan through all acquire types
	for i in pairs(acquire) do

		-- If it's a repuitation type
		if (acquire[i]["Type"] == 6) then

			local repid = acquire[i]["ID"]

			-- If it's Honor Hold/Thrallmar
			if (repid == 946) or (repid == 947) then

				-- If the player is Alliance look at Honor Hold only
				if (playerFaction == BFAC["Alliance"]) then

					repid = 946

				-- If the player is Horde look at Thrallmar only
				else

					repid = 947

				end

			-- If it's Kureni/Mag'har	
			elseif (repid == 941) or (repid == 978) then
				-- If the player is Alliance look at Kureni only
				if (playerFaction == BFAC["Alliance"]) then
					repid = 978
				-- If the player is Horde look at Mag'har only
				else
					repid = 941
				end
			end

			if (not playerRep[repDB[repid]["Name"]]) or (playerRep[repDB[repid]["Name"]] < DB[recipeIndex]["Acquire"][i]["RepLevel"]) then
				fac = false
			else

				-- This means that the faction level is high enough to learn the recipe, so we'll set display to true and leave the loop
				-- This should allow recipes which have multiple reputations to work correctly
				fac = true
				break

			end

		end

	end

	return fac

end

-- Description: Sets the string to display baseed off of what type of sorting is being done.
-- Expected result:  Displayed string will have the skill level located in different areas
-- Input: The skil level of the recipe and the remaining string
-- Output:  A combined string with the skill level integrated into the skill

local function SetSortString(recipeSkill, recStr)

	local sorttype = addon.db.profile.sorting

	if (sorttype == L["Skill"]) then

		return "[" .. recipeSkill .. "] - " .. recStr

	else

		return recStr .. " - [" .. recipeSkill .. "]"

	end

end

-- Description: Parses the recipes and determines which ones to display, and makes them display appropiatly
-- Expected result: Inserts the strings to display for a recipe into the DisplayStrings
-- Input: None
-- Output: DisplayStrings is filled up

local function initDisplayStrings()

	local exclude = addon.db.profile.exclusionlist

	DisplayStrings = nil
	DisplayStrings = {}

	local insertIndex = 1

	for i = 1, #sortedRecipeIndex do

		local recipeIndex = sortedRecipeIndex[i]

		if ((recipeDB[recipeIndex]["Display"] == true) and (recipeDB[recipeIndex]["Search"] == true)) then

			local t = {}

			-- add in recipe difficulty coloring
			local recStr = ""

			if (exclude[recipeIndex] == true) then

				recStr = "** " .. recipeDB[recipeIndex]["Name"] .. " **"

			else

				recStr = recipeDB[recipeIndex]["Name"]

			end

			local recipeSkill = recipeDB[recipeIndex]["Level"]
			local playerSkill = playerData.playerProfessionLevel

			recStr = SetSortString(recipeSkill, recStr)

			local hasFaction = checkFactions(recipeDB, recipeIndex, playerData.playerFaction, playerData["Reputation"])

			t.String = ColourSkillLevel(recipeSkill, playerSkill, hasFaction, recStr)

			t.sID = recipeIndex
			t.IsRecipe = true
			t.IsExpanded = false
			tinsert(DisplayStrings, insertIndex, t)
			insertIndex = insertIndex + 1

		end

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function ClearRecipeButtonTooltip(bIndex)

	local pButton = addon.PlusListButton[bIndex]
	local rButton = addon.RecipeListButton[bIndex]
	pButton:SetScript("OnEnter", function () end)
	pButton:SetScript("OnLeave", function () end)
	rButton:SetScript("OnEnter", function () end)
	rButton:SetScript("OnLeave", function () end)

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- converting from hex to rgb (Thanks Maldivia)

local function toRGB(hex)

	local r, g, b = hex:match("(..)(..)(..)")

	return (tonumber(r,16) / 256) , (tonumber(g,16) / 256) , (tonumber(b,16) / 256)

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- I want to do a bit more comprehensive tooltip processing. Things like changing font sizes,
-- adding padding to the left hand side, and using better color handling. So... this function
-- will do that for me.

local function gttAdd(
	leftPad,		-- number of times to pad two spaces on left side
	textSize,		-- negative number. subtract from 12 to get fontsize
	narrow,			-- if 1, use ARIALN instead of FRITZQ
	wraptext,		-- wraptext for AddLine (0 or 1)
	str1,			-- left hand string
	hexcolor1,		-- hex color code for left hand side
	str2,			-- if present, this is a double line, and this is the right hand string
	hexcolor2)		-- if present, hex color code for right hand side

	-- convert hex colors to r g b components. tooltips are dumb that way

	local a, b, c = toRGB(hexcolor1)
	local d, e, f = 0, 0, 0

	if (hexcolor2) then

		d, e, f = toRGB(hexcolor2)

	end

	-- Add in our left hand padding
	local looppad = leftPad
	local leftStr = str1

	while (looppad > 0) do

		leftStr = "  " .. leftStr
		looppad = looppad - 1

	end

	-- Are we adding a single or double line?
	local double = false

	if (str2) then

		arlTooltip:AddDoubleLine(leftStr, str2, a, b, c, d, e, f)
		double = true

	else

		arlTooltip:AddLine(leftStr, a, b, c, wraptext)

	end

	-- are we changing fontsize or narrow?
	if ((narrow == 1) or (textSize ~= 0)) then

		local font = normalFont

		if (narrow == 1) then

			font = narrowFont

		end

		local fontsize = 11

		if (textSize ~= 0) then

			fontsize = fontsize + textSize

		end
			
		local numlines = arlTooltip:NumLines()
		local mytext1 = _G["arlTooltipTextLeft" .. numlines]
		mytext1:SetFont(font, fontsize)
		if (double == true) then
			local mytext2 = _G["arlTooltipTextRight" .. numlines]
			mytext2:SetFont(font, fontsize)
		end

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function GenerateTooltipContent(owner, rIndex, playerFaction, exclude)

	local clr1, clr2 = "", ""

	arlTooltip:ClearLines()
	arlTooltip:SetOwner(owner, "ANCHOR_RIGHT")
	gttAdd(0, 1, 0, 0, recipeDB[rIndex]["Name"], addon:hexcolor("HIGH"))

	-- check if the recipe is excluded
	if (exclude[rIndex] == true) then

		clr1 = addon:hexcolor("RED")
		gttAdd(0, -1, 1, 0, L["RECIPE_EXCLUDED"], clr1)

	end

	-- Add in skill level requirement, colored correctly
	clr1 = addon:hexcolor("NORMAL")

	local recipeSkill = recipeDB[rIndex]["Level"]
	local playerSkill = playerData.playerProfessionLevel

	if (recipeSkill > playerSkill) then
		clr2 = addon:hexcolor("RED")
	elseif ((playerSkill - recipeSkill) < 20) then
		clr2 = addon:hexcolor("ORANGE")
	elseif ((playerSkill - recipeSkill) < 30) then
		clr2 = addon:hexcolor("YELLOW")
	elseif ((playerSkill - recipeSkill) < 40) then
		clr2 = addon:hexcolor("GREEN") 
	else
		clr2 = addon:hexcolor("MIDGREY")
	end

	gttAdd(0, -1, 0, 0, L["Required Skill"] .. " :", clr1, recipeDB[rIndex]["Level"], clr2)
	-- spacer
	gttAdd(0, 0, 0, 0, ".", addon:hexcolor("BLACK"))
	-- Binding info
	clr1 = addon:hexcolor("NORMAL")

	if (recipeDB[rIndex]["Flags"][36]) then
		gttAdd(0, -1, 1, 0, L["BOEFilter"], clr1)
	end

	if (recipeDB[rIndex]["Flags"][37]) then

		gttAdd(0, -1, 1, 0, L["BOPFilter"], clr1)

	end

	if (recipeDB[rIndex]["Flags"][38]) then

		gttAdd(0, -1, 1, 0, L["BOAFilter"], clr1)

	end

	if (recipeDB[rIndex]["Flags"][40]) then

		gttAdd(0, -1, 1, 0, L["RecipeBOEFilter"], clr1)

	end

	if (recipeDB[rIndex]["Flags"][41]) then

		gttAdd(0, -1, 1, 0, L["RecipeBOPFilter"], clr1)

	end

	if (recipeDB[rIndex]["Flags"][42]) then

		gttAdd(0, -1, 1, 0, L["RecipeBOAFilter"], clr1)

	end

	-- spacer
	gttAdd(0, 0, 0, 0, ".", addon:hexcolor("BLACK"))

	-- obtain info
	gttAdd(0, -1, 0, 0, L["Obtained From"] .. " : ", addon:hexcolor("NORMAL"))

	-- loop through acquire methods, display each
	for k, v in pairs(recipeDB[rIndex]["Acquire"]) do

		-- Trainer
		if (v["Type"] == 1) then
			-- Trainer:				TrainerName
			-- TrainerZone			TrainerCoords
			local trnr = trainerDB[v["ID"]]
			local cStr = ""
			-- Do we want to display this trainer?
			local displaytt = false
			clr1 = addon:hexcolor("TRAINER")
			if (trnr["Faction"] == BFAC["Horde"]) then
				clr2 = addon:hexcolor("HORDE")
				if (playerFaction == BFAC["Horde"]) then
					displaytt = true
				end
			elseif (trnr["Faction"] == BFAC["Alliance"]) then
				clr2 = addon:hexcolor("ALLIANCE")
				if (playerFaction == BFAC["Alliance"]) then
					displaytt = true
				end
			else
				clr2 = addon:hexcolor("NEUTRAL")
			end

			if (displaytt) then
				-- Add the trainer information to the tooltip
				gttAdd(0, -2, 0, 0, L["Trainer"], clr1, trnr["Name"], clr2)
				-- If we have a coordinate, add the coordinates to the tooltop
				if (trnr["Coordx"] ~= 0) and (trnr["Coordy"] ~= 0) then
					cStr = "(" .. trnr["Coordx"] .. ", " .. trnr["Coordy"] .. ")"
				end
				clr1 = addon:hexcolor("NORMAL")
				clr2 = addon:hexcolor("HIGH")
				gttAdd(1, -2, 1, 0, trnr["Location"], clr1, cStr, clr2)
			end

		-- Vendor
		elseif (v["Type"] == 2) then

			-- Vendor:					VendorName
			-- VendorZone				VendorCoords
			local vndr = vendorDB[v["ID"]]
			local cStr = ""

			if (vndr["Coordx"] ~= 0) and (vndr["Coordy"] ~= 0) then
				cStr = "(" .. vndr["Coordx"] .. ", " .. vndr["Coordy"] .. ")"
			end

			clr1 = addon:hexcolor("VENDOR")
			if (vndr["Faction"] == BFAC["Horde"]) then
				clr2 = addon:hexcolor("HORDE")
			elseif (vndr["Faction"] == BFAC["Alliance"]) then
				clr2 = addon:hexcolor("ALLIANCE")
			else
				clr2 = addon:hexcolor("NEUTRAL")
			end

			gttAdd(0, -1, 0, 0, L["Vendor"], clr1, vndr["Name"], clr2)
			clr1 = addon:hexcolor("NORMAL")
			clr2 = addon:hexcolor("HIGH")
			gttAdd(1, -2, 1, 0, vndr["Location"], clr1, cStr, clr2)

		-- Mob Drop
		elseif (v["Type"] == 3) then

			-- Mob Drop:				Mob Name
			-- MobZone					MobCoords
			local mob = mobDB[v["ID"]]
			local cStr = ""

			if (mob["Coordx"] ~= 0) and (mob["Coordy"] ~= 0) then

				cStr = "(" .. mob["Coordx"] .. ", " .. mob["Coordy"] .. ")"

			end

			clr1 = addon:hexcolor("MOBDROP")
			clr2 = addon:hexcolor("HORDE")
			gttAdd(0, -1, 0, 0, L["Mob Drop"], clr1, mob["Name"], clr2)
			clr1 = addon:hexcolor("NORMAL")
			clr2 = addon:hexcolor("HIGH")
			gttAdd(1, -2, 1, 0, mob["Location"], clr1, cStr, clr2)

		-- Quest
		elseif (v["Type"] == 4) then

			-- Quest:					QuestName
			-- QuestZone				QuestCoords
			local qst = questDB[v["ID"]]

			if (qst ~= nil) then

				local cStr = ""

				if (qst["Coordx"] ~= 0) and (qst["Coordy"] ~= 0) then

					cStr = "(" .. qst["Coordx"] .. ", " .. qst["Coordy"] .. ")"

				end

				clr1 = addon:hexcolor("QUEST")

				if (qst["Faction"] == BFAC["Horde"]) then
					clr2 = addon:hexcolor("HORDE")
				elseif (qst["Faction"] == BFAC["Alliance"]) then
					clr2 = addon:hexcolor("ALLIANCE")
				else
					clr2 = addon:hexcolor("NEUTRAL")
				end

				gttAdd(0, -1, 0, 0, L["Quest"], clr1, qst["Name"], clr2)
				clr1 = addon:hexcolor("NORMAL")
				clr2 = addon:hexcolor("HIGH")
				gttAdd(1, -2, 1, 0, qst["Location"], clr1, cStr, clr2)

			end

		-- Seasonal
		elseif (v["Type"] == 5) then

			-- Seasonal:				SeasonEventName
			local ssnname = seasonDB[v["ID"]]["Name"]

			clr1 = addon:hexcolor("SEASON")
			gttAdd(0, -1, 0, 0, L["Seasonal"], clr1, ssnname, clr1)

		-- Reputation
		elseif (v["Type"] == 6) then

			-- Reputation:				Faction
			-- FactionLevel				RepVendor				
			-- RepVendorZone			RepVendorCoords

			local repfac = repDB[v["ID"]]
			local repname = repfac["Name"] -- name
			local rplvl = v["RepLevel"]
			local repvndr = vendorDB[v["RepVendor"]]
			local cStr = ""

			if (repvndr["Coordx"] ~= 0) and (repvndr["Coordy"] ~= 0) then
				cStr = "(" .. repvndr["Coordx"] .. ", " .. repvndr["Coordy"] .. ")"
			end
			
			clr1 = addon:hexcolor("REP")
			clr2 = addon:hexcolor("NORMAL")
			gttAdd(0, -1, 0, 0, L["Reputation"], clr1, repname, clr2)

			local rStr = ""
			if (rplvl == 0) then
				rStr = BFAC["Neutral"]
				clr1 = addon:hexcolor("NEUTRAL")
			elseif (rplvl == 1) then
				rStr = BFAC["Neutral"]
				clr1 = addon:hexcolor("FRIENDLY")
			elseif (rplvl == 2) then
				rStr = BFAC["Honored"]
				clr1 = addon:hexcolor("HONORED")
			elseif (rplvl == 3) then
				rStr = BFAC["Revered"]
				clr1 = addon:hexcolor("REVERED")
			else
				rStr = BFAC["Exalted"]
				clr1 = addon:hexcolor("EXALTED")
			end

			if (repvndr["Faction"] == BFAC["Horde"]) then
				clr2 = addon:hexcolor("HORDE")
			elseif (repvndr["Faction"] == BFAC["Alliance"]) then
				clr2 = addon:hexcolor("ALLIANCE")
			else
				clr2 = addon:hexcolor("NEUTRAL")
			end

			gttAdd(1, -2, 0, 0, rStr, clr1, repvndr["Name"], clr2)
			clr1 = addon:hexcolor("NORMAL")
			clr2 = addon:hexcolor("HIGH")
			gttAdd(2, -2, 1, 0, repvndr["Location"], clr1, cStr, clr2)

		-- World Drop
		elseif (v["Type"] == 7) then

			-- World Drop				RarityLevel
			if (v["ID"] == 1) then

				clr1 = addon:hexcolor("COMMON")

			elseif (v["ID"] == 2) then

				clr1 = addon:hexcolor("UNCOMMON")

			elseif (v["ID"] == 3) then

				clr1 = addon:hexcolor("RARE")

			elseif (v["ID"] == 4) then

				clr1 = addon:hexcolor("EPIC")

			else

				clr1 = addon:hexcolor("NORMAL")

			end

			gttAdd(0, -1, 0, 0, L["World Drop"], clr1)

		-- Custom entry
		elseif (v["Type"] == 8) then

			-- Seasonal:				SeasonEventName
			local customname = customDB[v["ID"]]["Name"]

			clr1 = addon:hexcolor("NORMAL")
			gttAdd(0, -1, 0, 0, customname, clr1)

		-- Unhandled
		else

			clr1 = addon:hexcolor("NORMAL")
			gttAdd(0, -1, 0, 0, L["Unhandled Recipe"], clr1)

		end

	end

	-- Spacer
	gttAdd(0, 0, 0, 0, ".", addon:hexcolor("BLACK"))

	clr1 = addon:hexcolor("NORMAL")

	gttAdd(0, -1, 0, 0, L["ALT_CLICK"], clr1)
	gttAdd(0, -1, 0, 1, L["CTRL_CLICK"], clr1)
	gttAdd(0, -1, 0, 1, L["SHIFT_CLICK"], clr1)

	local spelllink = recipeDB[rIndex]["RecipeLink"]

	if (spelllink) then

		arlTooltip2:SetOwner(arlTooltip, "ANCHOR_NONE")
--		arlTooltip2:ClearAllPoints()
		--arlTooltip2:SetPoint("TOPLEFT", arlTooltip, "TOPRIGHT")
		arlTooltip2:SetPoint("TOPRIGHT", arlTooltip, "TOPLEFT")
		arlTooltip2:SetHyperlink(spelllink)
		arlTooltip2:Show()

	else

		arlTooltip2:Hide()

	end

	arlTooltip:Show()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- This sets the tooltip on the button during a recipelist update

local function SetRecipeButtonTooltip(bIndex)

	local pButton = addon.PlusListButton[bIndex]
	local rButton = addon.RecipeListButton[bIndex]
	local dStringIndex = rButton.sI
	local rIndex = DisplayStrings[dStringIndex].sID
	local playerFaction = playerData.playerFaction
	local exclude = addon.db.profile.exclusionlist

	pButton:SetScript("OnEnter",
			function (pButton)
				GenerateTooltipContent(pButton, rIndex, playerFaction, exclude)
			end
		)

	pButton:SetScript("OnLeave",
			function()
				arlTooltip:Hide()
				arlTooltip2:Hide()
			end
		)

	rButton:SetScript("OnEnter",
			function (rButton)
				GenerateTooltipContent(rButton, rIndex, playerFaction, exclude)
			end
		)

	rButton:SetScript("OnLeave",
			function()
				arlTooltip:Hide()
				arlTooltip2:Hide()
			end
		)

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- Scrollframe update stuff

local function RecipeList_Update()

	-- Clear out the current buttons
	for i = 1, maxVisibleRecipes do

		addon.RecipeListButton[i]:SetText("")
		addon.RecipeListButton[i].sI = 0
		addon.PlusListButton[i]:Hide()
		ClearRecipeButtonTooltip(i)

	end

	local entries = #DisplayStrings

	FauxScrollFrame_Update(ARL_RecipeScrollFrame, entries, maxVisibleRecipes, 16)

	if (entries > 0) then

		-- enable expand button
		ARL_ExpandButton:SetNormalFontObject("GameFontNormalSmall")
		ARL_ExpandButton:Enable()

		-- now fill in our buttons
		local listOffset = FauxScrollFrame_GetOffset(ARL_RecipeScrollFrame)
		local buttonIndex = 1
		local stringsIndex = buttonIndex + listOffset

		local stayInLoop = true

		while (stayInLoop == true) do

			if (DisplayStrings[stringsIndex].IsRecipe) then

				-- display the + symbol
				addon.PlusListButton[buttonIndex]:Show()

				-- Is it expanded or not?
				if (DisplayStrings[stringsIndex].IsExpanded) then

					addon.PlusListButton[buttonIndex]:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
					addon.PlusListButton[buttonIndex]:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down")
					addon.PlusListButton[buttonIndex]:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
					addon.PlusListButton[buttonIndex]:SetDisabledTexture("Interface\\Buttons\\UI-MinusButton-Disabled")

				else

					addon.PlusListButton[buttonIndex]:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
					addon.PlusListButton[buttonIndex]:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
					addon.PlusListButton[buttonIndex]:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
					addon.PlusListButton[buttonIndex]:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")

				end

			else

				addon.PlusListButton[buttonIndex]:Hide()

			end

			addon.RecipeListButton[buttonIndex]:SetText(DisplayStrings[stringsIndex].String)
			addon.RecipeListButton[buttonIndex].sI = stringsIndex

			-- Set the tooltip on the button
			SetRecipeButtonTooltip(buttonIndex)

			buttonIndex = buttonIndex + 1
			stringsIndex = stringsIndex + 1

			if ((buttonIndex > maxVisibleRecipes) or (stringsIndex > entries)) then

				stayInLoop = false

			end

		end

	-- Entries are 0 here, so we have 0 to display
	else
		-- disable expand button, it's useless here and would spam the same error again
		ARL_ExpandButton:SetNormalFontObject("GameFontDisableSmall")
		ARL_ExpandButton:Disable()

		-- If the recipe total is at 0, it means we have not scanned the profession yet
		if (playerData.recipes_total == 0) then
			StaticPopup_Show("ARL_NOTSCANNED")
		-- We know all the recipes
		elseif (playerData.recipes_known == playerData.recipes_total) then
			StaticPopup_Show("ARL_ALLKNOWN")
		-- Our filters are actually filtering something
		elseif ((playerData.recipes_total_filtered - playerData.recipes_known_filtered) ~= 0) then
			StaticPopup_Show("ARL_ALLFILTERED")
		-- Our exclusion list is preventing something from being displayed
		elseif (playerData.excluded_recipes_unknown ~= 0) then
			StaticPopup_Show("ARL_ALLEXCLUDED")
		else
			--@debug@
			addon:Print("DEBUG: recipes_total: " .. playerData.recipes_total)
			addon:Print("DEBUG: recipes_known: " .. playerData.recipes_known)
			addon:Print("DEBUG: recipes_total_filtered: " .. playerData.recipes_total_filtered)
			addon:Print("DEBUG: recipes_known_filtered: " .. playerData.recipes_known_filtered)
			addon:Print("DEBUG: excluded_recipes_unknown: " .. playerData.excluded_recipes_unknown)			
			--@end-debug@
			addon:Print(L["NO_DISPLAY"])
		end

	end
	
end

-- Description: Updates the progress bar based on the number of known / total recipes
-- Expected result: the progression bar shows the correct information based on settings and filters
-- Input: playerdata data structure
-- Output: none

local function SetProgressBar(playerData)

	local pbCur, pbMax

	if (addon.db.profile.includefiltered == true) then

		pbCur = playerData.recipes_known
		pbMax = playerData.recipes_total

	-- We're removing filtered recipes from the final count
	else

		pbCur = playerData.recipes_known_filtered
		pbMax = playerData.recipes_total_filtered

	end

	if (not addon.db.profile.includeexcluded) then

		pbCur = pbCur - playerData.excluded_recipes_known
		pbMax = pbMax - playerData.excluded_recipes_unknown

	end

	ARL_ProgressBar:SetMinMaxValues(0, pbMax)
	ARL_ProgressBar:SetValue(pbCur)
	
	if math.floor(pbCur / pbMax * 100) <101 then
		ARL_ProgressBarText:SetText(pbCur .. " / " .. pbMax .. " - " .. math.floor(pbCur / pbMax * 100) .. "%")
	else
		ARL_ProgressBarText:SetText(pbCur .. " / " .. pbMax .. " - " .. L["NOT_YET_SCANNED"])
	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:ResetGUI()

	addon.db.profile.frameopts.offsetx = 0
	addon.db.profile.frameopts.offsety = 0
	addon.db.profile.frameopts.anchorTo = ""
	addon.db.profile.frameopts.anchorFrom = ""
	addon.db.profile.frameopts.uiscale = 1
	addon.db.profile.frameopts.tooltipscale = .9

end

-- Under various conditions, I'm going to have to redisplay my recipe list
-- This could happen because a filter changes, a new profession is chosen, or
-- a new search occurred. Use this function to do all the dirty work

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function ReDisplay()

	addon:UpdateFilters(recipeDB, allSpecTable, playerData)
	sortedRecipeIndex = addon:SortMissingRecipes(recipeDB)

	if (not addon.db.profile.ignoreexclusionlist) then

		addon:GetExclusions(recipeDB)

	end

	initDisplayStrings()

	SetProgressBar(playerData)

	-- Make sure our expand all button is set to expandall
	ARL_ExpandButton:SetText(L["EXPANDALL"])
	addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

	-- And update our scrollframe
	RecipeList_Update()
	
	-- Make sure our apply button gets disabled
	ApplyFilterState = nil
	ARL_ApplyButton:SetNormalFontObject("GameFontDisableSmall")
	ARL_ApplyButton:Disable()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:CreateScanButton()

	-- Create the scan button
	if (not addon.ScanButton) then
		addon.ScanButton = CreateFrame("Button","addon.ScanButton",UIParent,"UIPanelButtonTemplate")
	end

	-- Add to Skillet interface
	if (Skillet and Skillet:IsActive()) then
		addon.ScanButton:SetParent(SkilletFrame)
		addon.ScanButton:Show()
		Skillet:AddButtonToTradeskillWindow(addon.ScanButton)
		addon.ScanButton:SetWidth(80)
	end

	-- Set some of the common button properties
	addon.ScanButton:SetHeight(20)
	addon.ScanButton:RegisterForClicks("LeftButtonUp")
	addon.ScanButton:SetScript("OnClick",
			function()
				addon:ToggleFrame()
			end
		)

	addon.ScanButton:SetScript("OnEnter",
			function(this)
				GameTooltip_SetDefaultAnchor(GameTooltip, this)
				GameTooltip:SetText(L["SCAN_RECIPES_DESC"])
				GameTooltip:Show()
			end
		)

	addon.ScanButton:SetScript("OnLeave",
			function()
				GameTooltip:Hide()
			end
		)

	addon.ScanButton:SetText(L["Scan"])

	local buttonparent = addon.ScanButton:GetParent()
	local framelevel = buttonparent:GetFrameLevel()
	local framestrata = buttonparent:GetFrameStrata()

	-- Set the frame level of the button to be 1 deeper than its parent
	addon.ScanButton:SetFrameLevel(framelevel + 1)
	addon.ScanButton:SetFrameStrata(framestrata)

	addon.ScanButton:Enable()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:ShowScanButton()

	-- Anchor to ATSW
	if (ATSWFrame) then

		addon.ScanButton:SetParent(ATSWFrame)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("RIGHT", ATSWOptionsButton, "LEFT", 0, 0)
		addon.ScanButton:SetHeight(ATSWOptionsButton:GetHeight())
		addon.ScanButton:SetWidth(90)

	-- Anchor to trade window
	else

		addon.ScanButton:SetParent(TradeSkillFrame)
		addon.ScanButton:ClearAllPoints()

		local loc = addon.db.profile.scanbuttonlocation

		if (loc == L["Right"]) then
			addon.ScanButton:SetPoint("RIGHT",TradeSkillFrameCloseButton,"LEFT",4,0)
		elseif (loc == L["Left"]) then
			addon.ScanButton:SetPoint("LEFT",TradeSkillFramePortrait,"RIGHT",2,12)
		end
		addon.ScanButton:SetWidth(addon.ScanButton:GetTextWidth() + 10)

	end

	addon.ScanButton:Show()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:TooltipDisplay(this, textLabel)

	this:SetScript("OnEnter",
			function (this)
				GameTooltip_SetDefaultAnchor(GameTooltip, this)
				GameTooltip:SetText(textLabel, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				GameTooltip:Show()
			end
		)

	this:SetScript("OnLeave",
			function(this)
				GameTooltip:Hide()
			end
		)

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.numFilters()

	-- IMPORTANT: If the number of filters we're maintaining changes, you'll need to change the FilterValueMap
	-- at the end (of CreateFrame), as well as the following index value:
	local MaxFilters = 87

	local total = 0
	local active = 0

	for i = 1, MaxFilters do
		if ((FilterValueMap[i].svroot == "disabled") or
			 (FilterValueMap[i].svroot == "special case")) then
			-- ignore these filters in the totals
		elseif (FilterValueMap[i].svroot[ FilterValueMap[i].svval ] == true) then
			active = active + 1
			total = total + 1
		else
			total = total + 1
		end
	end
	return active, total

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.resetTitle()

	-- reset the frame title line
	local myTitle = ""
	local addonversion = GetAddOnMetadata("AckisRecipeList", "Version")

	if (addon.Frame._Expanded == true) then

		local aFil, tFil = addon.numFilters()

		myTitle = "ARL (v." .. addonversion .. ") - " .. currentProfession ..
			" (" .. aFil .. "/" .. tFil .. " " .. L["Filters"] .. ")"

	else

		myTitle = "ARL (v." .. addonversion .. ") - " .. currentProfession

	end

	addon.Frame.HeadingText:SetText(addon:Normal(myTitle))

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.filterSwitch(val)

	-- This function is the all-encompassing checkbox handler for the ZJGUI
	local armordb = addon.db.profile.filters.item.armor
	local weapondb = addon.db.profile.filters.item.weapon

	-- Special cases first, then general case
	if (val == 19) then
		-- Armor "All" checkbox
		if (ARL_ArmorAllCB:GetChecked()) then
			armordb.cloth = true
			armordb.leather = true
			armordb.mail = true
			armordb.plate = true
			armordb.cloak = true
			armordb.necklace = true
			armordb.ring = true
			armordb.trinket = true
			armordb.shield = true
			ARL_ArmorClothCB:SetChecked(true)
			ARL_ArmorLeatherCB:SetChecked(true)
			ARL_ArmorMailCB:SetChecked(true)
			ARL_ArmorPlateCB:SetChecked(true)
			ARL_ArmorCloakCB:SetChecked(true)
			ARL_ArmorNecklaceCB:SetChecked(true)
			ARL_ArmorRingCB:SetChecked(true)
			ARL_ArmorTrinketCB:SetChecked(true)
			ARL_ArmorShieldCB:SetChecked(true)
			ARL_ArmorNoneCB:SetChecked(false)
		end
	elseif (val == 20) then
		-- Armor "None" checkbox
		if (ARL_ArmorNoneCB:GetChecked()) then
			armordb.cloth = false
			armordb.leather = false
			armordb.mail = false
			armordb.plate = false
			armordb.cloak = false
			armordb.necklace = false
			armordb.ring = false
			armordb.trinket = false
			armordb.shield = false
			ARL_ArmorClothCB:SetChecked(false)
			ARL_ArmorLeatherCB:SetChecked(false)
			ARL_ArmorMailCB:SetChecked(false)
			ARL_ArmorPlateCB:SetChecked(false)
			ARL_ArmorCloakCB:SetChecked(false)
			ARL_ArmorNecklaceCB:SetChecked(false)
			ARL_ArmorRingCB:SetChecked(false)
			ARL_ArmorTrinketCB:SetChecked(false)
			ARL_ArmorShieldCB:SetChecked(false)
			ARL_ArmorAllCB:SetChecked(false)
		end
	elseif ((val == 21) or (val == 22) or (val == 23) or (val == 24) or
			 (val == 64) or (val == 65) or (val == 66) or (val == 67) or (val == 85)) then
		-- in this case, we need to check if the checkbox we just hit either
		-- makes everthing checked, or everything empty. If so, we check the All/None
		-- checkboxes
		if (FilterValueMap[val].cb:GetChecked()) then
			FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = true
			if ((armordb.cloth == true) and (armordb.leather == true) and
				 (armordb.mail == true) and (armordb.plate == true) and
				 (armordb.cloak == true) and (armordb.necklace == true) and
				 (armordb.ring == true) and (armordb.trinket == true) and
				 (armordb.shield == true)) then
				ARL_ArmorAllCB:SetChecked(true)
			end
			ARL_ArmorNoneCB:SetChecked(false)
		else
			FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = false
			if ((armordb.cloth == false) and (armordb.leather == false) and
				 (armordb.mail == false) and (armordb.plate == false) and
				 (armordb.cloak == false) and (armordb.necklace == false) and
				 (armordb.ring == false) and (armordb.trinket == false) and
				 (armordb.shield == false)) then
				ARL_ArmorNoneCB:SetChecked(true)
			end
			ARL_ArmorAllCB:SetChecked(false)
		end
	elseif (val == 25) then
		-- Weapon "All" special case
		if (ARL_WeaponAllCB:GetChecked()) then
			weapondb.onehand = true
			weapondb.twohand = true
			weapondb.dagger = true
			weapondb.axe = true
			weapondb.mace = true
			weapondb.sword = true
			weapondb.polearm = true
			weapondb.wand = true
			weapondb.thrown = true
			weapondb.ammo = true
			weapondb.fist = true
			ARL_Weapon1HCB:SetChecked(true)
			ARL_Weapon2HCB:SetChecked(true)
			ARL_WeaponDaggerCB:SetChecked(true)
			ARL_WeaponAxeCB:SetChecked(true)
			ARL_WeaponMaceCB:SetChecked(true)
			ARL_WeaponSwordCB:SetChecked(true)
			ARL_WeaponPolearmCB:SetChecked(true)
			ARL_WeaponWandCB:SetChecked(true)
			ARL_WeaponThrownCB:SetChecked(true)
			ARL_WeaponAmmoCB:SetChecked(true)
			ARL_WeaponFistCB:SetChecked(true)
			ARL_WeaponNoneCB:SetChecked(false)
		end
	elseif (val == 26) then
		-- Weapon "None" special case
		if (ARL_WeaponNoneCB:GetChecked()) then
			weapondb.onehand = false
			weapondb.twohand = false
			weapondb.dagger = false
			weapondb.axe = false
			weapondb.mace = false
			weapondb.sword = false
			weapondb.polearm = false
			weapondb.wand = false
			weapondb.thrown = false
			weapondb.ammo = false
			weapondb.fist = false
			ARL_Weapon1HCB:SetChecked(false)
			ARL_Weapon2HCB:SetChecked(false)
			ARL_WeaponDaggerCB:SetChecked(false)
			ARL_WeaponAxeCB:SetChecked(false)
			ARL_WeaponMaceCB:SetChecked(false)
			ARL_WeaponSwordCB:SetChecked(false)
			ARL_WeaponPolearmCB:SetChecked(false)
			ARL_WeaponWandCB:SetChecked(false)
			ARL_WeaponThrownCB:SetChecked(false)
			ARL_WeaponAmmoCB:SetChecked(false)
			ARL_WeaponFistCB:SetChecked(false)
			ARL_WeaponAllCB:SetChecked(false)
		end
	elseif ((val == 34) or (val == 36) or (val == 37)) then
		-- Weapon disable case ... there's really no way to reach this code
	elseif ((val == 27) or (val == 28) or (val == 29) or (val == 30) or (val == 31) or
			 (val == 32) or (val == 33) or (val == 68) or (val == 35) or (val == 38) or (val == 84)) then
		-- we've clicked on a weapon thinger. If all of them are either checked or unchecked,
		-- we should automagically check the "All" or "None" checkbox
		if (FilterValueMap[val].cb:GetChecked()) then
			FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = true
			if ((weapondb.onehand == true) and (weapondb.twohand == true) and
				 (weapondb.dagger == true) and (weapondb.axe == true) and
				 (weapondb.mace == true) and (weapondb.sword == true) and
				 (weapondb.polearm == true) and (weapondb.wand == true) and
				 (weapondb.thrown == true) and (weapondb.ammo == true) and
				 (weapondb.fist == true)) then
				ARL_WeaponAllCB:SetChecked(true)
			end
			ARL_WeaponNoneCB:SetChecked(false)
		else
			FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = false
			if ((weapondb.onehand == false) and (weapondb.twohand == false) and
				 (weapondb.dagger == false) and (weapondb.axe == false) and
				 (weapondb.mace == false) and (weapondb.sword == false) and
				 (weapondb.polearm == false) and (weapondb.wand == false) and
				 (weapondb.thrown == false) and (weapondb.ammo == false) and
				 (weapondb.fist == false)) then
				ARL_WeaponNoneCB:SetChecked(true)
			end
			ARL_WeaponAllCB:SetChecked(false)
		end
	else
		-- General case
		if (FilterValueMap[val].cb:GetChecked()) then
			FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = true
		else
			FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = false
		end
	end

	addon.resetTitle()

	if (not ApplyFilterState) then

		ApplyFilterState = {}

	end

	-- We have this toggled one way
	if (ApplyFilterState[val]) then

		ApplyFilterState[val] = not ApplyFilterState[val]

	-- Hasn't been toggled
	else

		ApplyFilterState[val] = true

	end

	ARL_ApplyButton:SetNormalFontObject("GameFontDisableSmall")
	ARL_ApplyButton:Disable()

	for i,j in pairs(ApplyFilterState) do

		if (j == true) then

			ARL_ApplyButton:SetNormalFontObject("GameFontNormalSmall")
			ARL_ApplyButton:Enable()
			break

		end

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function HideARL_ExpOptCB(ignorevalue)

			ARL_ExpGeneralOptCB.text:SetText(addon:Yellow(ExpButtonText[1])) 
			ARL_ExpObtainOptCB.text:SetText(addon:Yellow(ExpButtonText[2])) 
			ARL_ExpBindingOptCB.text:SetText(addon:Yellow(ExpButtonText[3])) 
			ARL_ExpItemOptCB.text:SetText(addon:Yellow(ExpButtonText[4])) 
			ARL_ExpPlayerOptCB.text:SetText(addon:Yellow(ExpButtonText[5]))
			ARL_ExpRepOptCB.text:SetText(addon:White(ExpButtonText[6]))

	if (ignorevalue ~= "general") then

		ARL_ExpGeneralOptCB:SetChecked(false)
		ARL_ExpGeneralOptCB.text:SetText(addon:Yellow(ExpButtonText[1]))

	else

		ARL_ExpGeneralOptCB.text:SetText(addon:White(ExpButtonText[1]))

	end

	if (ignorevalue ~= "obtain") then

		ARL_ExpObtainOptCB:SetChecked(false)
		ARL_ExpObtainOptCB.text:SetText(addon:Yellow(ExpButtonText[2])) 

	else

		ARL_ExpObtainOptCB.text:SetText(addon:White(ExpButtonText[2]))

	end

	if (ignorevalue ~= "binding") then

		ARL_ExpBindingOptCB:SetChecked(false)
		ARL_ExpBindingOptCB.text:SetText(addon:Yellow(ExpButtonText[3]))

	else

		ARL_ExpBindingOptCB.text:SetText(addon:White(ExpButtonText[3]))

	end

	if (ignorevalue ~= "item") then

		ARL_ExpItemOptCB:SetChecked(false)
		ARL_ExpItemOptCB.text:SetText(addon:Yellow(ExpButtonText[4]))

	else

		ARL_ExpItemOptCB.text:SetText(addon:White(ExpButtonText[4]))

	end

	if (ignorevalue ~= "player") then

		ARL_ExpPlayerOptCB:SetChecked(false)
		ARL_ExpPlayerOptCB.text:SetText(addon:Yellow(ExpButtonText[5]))

	else

		ARL_ExpPlayerOptCB.text:SetText(addon:White(ExpButtonText[5]))

	end

	if (ignorevalue ~= "rep") then

		ARL_ExpRepOptCB:SetChecked(false)
		ARL_ExpRepOptCB.text:SetText(addon:Yellow(ExpButtonText[6]))

	else

		ARL_ExpRepOptCB.text:SetText(addon:White(ExpButtonText[6]))

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.ToggleFilters()

	local xPos = addon.Frame:GetLeft()
	local yPos = addon.Frame:GetBottom()

	if (addon.Frame._Expanded == true) then
		-- Adjust the frame size and texture
--		addon.Frame:Hide()
		addon.Frame:ClearAllPoints()
		addon.Frame:SetWidth(293)
		addon.Frame:SetHeight(447)
		addon.bgTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\main]])
		addon.bgTexture:SetAllPoints(addon.Frame)
		addon.bgTexture:SetTexCoord(0, (293/512), 0, (447/512))
		addon.Frame._Expanded = false
		addon.Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", xPos, yPos)
		-- Change the text and tooltip for the filter button
		ARL_FilterButton:SetText(L["FILTER_OPEN"])
		addon:TooltipDisplay(ARL_FilterButton, L["FILTER_OPEN_DESC"])

		-- Hide my 5 buttons
		ARL_ExpGeneralOptCB:Hide()
		ARL_ExpObtainOptCB:Hide()
		ARL_ExpBindingOptCB:Hide()
		ARL_ExpItemOptCB:Hide()
		ARL_ExpPlayerOptCB:Hide()
		ARL_ExpRepOptCB:Hide()

		-- Uncheck the five buttons
		HideARL_ExpOptCB()

		-- Hide the flyaway panel
		addon.Flyaway:Hide()

		ARL_ResetButton:Hide()
		ARL_ApplyButton:Hide()

		-- and finally, show our frame
--		addon.Frame:Show()
	else

		-- Adjust the frame size and texture
--		addon.Frame:Hide()
		addon.Frame:ClearAllPoints()
		addon.Frame:SetWidth(444)
		addon.Frame:SetHeight(447)
		addon.bgTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\expanded]])
		addon.bgTexture:SetAllPoints(addon.Frame)
		addon.bgTexture:SetTexCoord(0, (444/512), 0, (447/512))
		addon.Frame._Expanded = true
		addon.Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", xPos, yPos)

		-- Change the text and tooltip for the filter button
		ARL_FilterButton:SetText(L["FILTER_CLOSE"])
		addon:TooltipDisplay(ARL_FilterButton, L["FILTER_CLOSE_DESC"])

		-- Show my 5 buttons
		ARL_ExpGeneralOptCB:Show()
		ARL_ExpObtainOptCB:Show()
		ARL_ExpBindingOptCB:Show()
		ARL_ExpItemOptCB:Show()
		ARL_ExpPlayerOptCB:Show()
		ARL_ExpRepOptCB:Show()

		ARL_ResetButton:Show()
		ARL_ApplyButton:Show()

		-- and finally, show our frame
--		addon.Frame:Show()
	end

	-- Reset our title
	addon.resetTitle()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:GenericMakeCB(cButton, anchorFrame, ttText, scriptVal, row, col, logo)

	local pushdown = {
		[64] = 1, [65] = 1, [66] = 1, [67] = 1, [25] = 1, [26] = 1, [27] = 1, [28] = 1, [29] = 1,
		[30] = 1, [31] = 1, [32] = 1, [33] = 1, [34] = 1, [68] = 1, [35] = 1, [36] = 1, [37] = 1,
		[38] = 1, [84] = 1, [85] = 1,
	}
	-- set the position of the new checkbox
	local xPos = 2 + ((col - 1) * 100)
	local yPos = -3 - ((row - 1) * 17)
	if (pushdown[scriptVal]) then yPos = yPos - 5 end
	cButton:SetPoint("TOPLEFT", anchorFrame, "TOPLEFT", xPos, yPos)

	-- depending if we're on the rep logo thingers or not, set the height and an OnClick method
	if (logo == 0) then
		cButton:SetHeight(24)
		cButton:SetWidth(24)
		cButton:SetScript("OnClick", function() addon.filterSwitch(scriptVal) end)
	else
		cButton:SetHeight(46)
		cButton:SetWidth(100)
		cButton:SetScript("OnClick", function() addon.filterSwitch(scriptVal) end)
	end

	addon:TooltipDisplay(cButton, ttText, 1)

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon:GenericCreateButton(
	bName, parentFrame,	bHeight, bWidth,
	anchorFrom, anchorFrame, anchorTo, xOffset, yOffset,
	bNormFont, bHighFont, initText, tAlign, tooltipText, noTextures)

	-- I hate stretchy buttons. Thanks very much to ckknight for this code
	-- (found in RockConfig)

	-- when pressed, the button should look pressed
	local function button_OnMouseDown(this)
		if this:IsEnabled() == 1 then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
		end
	end
	-- when depressed, return to normal
	local function button_OnMouseUp(this)
		if this:IsEnabled() == 1 then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		end
	end

	local function button_Disable(this)
		this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this:__Disable()
		this:EnableMouse(false)
	end

	local function button_Enable(this)
		this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this:__Enable()
		this:EnableMouse(true)
	end

	local button = CreateFrame("Button", bName, parentFrame)

	button:SetWidth(bWidth)
	button:SetHeight(bHeight)

	if (noTextures == 1) then
		local left = button:CreateTexture(button:GetName() .. "_LeftTexture", "BACKGROUND")
		button.left = left
		local middle = button:CreateTexture(button:GetName() .. "_MiddleTexture", "BACKGROUND")
		button.middle = middle
		local right = button:CreateTexture(button:GetName() .. "_RightTexture", "BACKGROUND")
		button.right = right

		left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])

		left:SetPoint("TOPLEFT")
		left:SetPoint("BOTTOMLEFT")
		left:SetWidth(12)
		left:SetTexCoord(0, 0.09375, 0, 0.6875)

		right:SetPoint("TOPRIGHT")
		right:SetPoint("BOTTOMRIGHT")
		right:SetWidth(12)
		right:SetTexCoord(0.53125, 0.625, 0, 0.6875)

		middle:SetPoint("TOPLEFT", left, "TOPRIGHT")
		middle:SetPoint("BOTTOMRIGHT", right, "BOTTOMLEFT")
		middle:SetTexCoord(0.09375, 0.53125, 0, 0.6875)

		button:SetScript("OnMouseDown", button_OnMouseDown)
		button:SetScript("OnMouseUp", button_OnMouseUp)
		button:SetScript("OnEnter", SubControl_OnEnter)
		button:SetScript("OnLeave", SubControl_OnLeave)

		button.__Enable = button.Enable
		button.__Disable = button.Disable
		button.Enable = button_Enable
		button.Disable = button_Disable

		local highlight = button:CreateTexture(button:GetName() .. "_Highlight", "OVERLAY", "UIPanelButtonHighlightTexture")
		button:SetHighlightTexture(highlight)
	elseif (noTextures == 2) then
		button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		button:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
		button:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		button:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
	elseif (noTextures == 3) then
		button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Hilight")
		button:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disable")
	end

	local text = button:CreateFontString(button:GetName() .. "_FontString", "ARTWORK")
	button:SetFontString(text)
	button.text = text
	text:SetPoint("LEFT", button, "LEFT", 7, 0)
	text:SetPoint("RIGHT", button, "RIGHT", -7, 0)
	text:SetJustifyH(tAlign)

	text:SetFontObject(bNormFont)
--	text:SetHighlightFontObject(bHighFont)
--	text:SetDisabledFontObject(GameFontDisableSmall)

	text:SetText(initText)		

	button:SetPoint(anchorFrom, anchorFrame, anchorTo, xOffset, yOffset)

	if (tooltipText ~= "") then

		addon:TooltipDisplay(button, tooltipText)

	end

	return button

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- Generic function for creating my expanded panel buttons

function addon:CreateExpCB(bName, bTex, panelIndex)
	local ExpTextureSize = 34

	if ((bName == "ARL_RepOldWorldCB") or (bName == "ARL_RepBCCB") or (bName == "ARL_RepLKCB")) then
		local cButton = CreateFrame("CheckButton", bName, addon.Fly_Rep) -- , "UICheckButtonTemplate")
			cButton:SetWidth(100)
			cButton:SetHeight(46)
			cButton:SetChecked(false)
	
		local iconTex = cButton:CreateTexture(cButton:GetName() .. "buttonTex", "BORDER")
			if (bName == "ARL_RepLKCB") then
				iconTex:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\" .. bTex)
			else
				iconTex:SetTexture('Interface/Glues/Common/' .. bTex)
			end
			iconTex:SetWidth(100)
			iconTex:SetHeight(46)
			iconTex:SetAllPoints(cButton)

		local pushedTexture = cButton:CreateTexture(cButton:GetName() .. "pTex", "ARTWORK")
			pushedTexture:SetTexture('Interface/Buttons/UI-Quickslot-Depress')
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)
		local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture('Interface/Buttons/ButtonHilight-Square')
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode('ADD')
			cButton:SetHighlightTexture(highlightTexture)
		local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture('Interface/Buttons/CheckButtonHilight')
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode('ADD')
			cButton:SetCheckedTexture(checkedTexture)

		-- And throw up a tooltip
		if (bName == "ARL_RepOldWorldCB") then
			addon:TooltipDisplay(cButton, L["FILTERING_OLDWORLD_DESC"])
		elseif (bName == "ARL_RepBCCB") then
			addon:TooltipDisplay(cButton, L["FILTERING_BC_DESC"])
		else
			addon:TooltipDisplay(cButton, L["FILTERING_WOTLK_DESC"])
		end

		return cButton
	else 
		local cButton = CreateFrame("CheckButton", bName, addon.Frame) -- , "UICheckButtonTemplate")
			cButton:SetWidth(ExpTextureSize)
			cButton:SetHeight(ExpTextureSize)
			cButton:SetScript("OnClick", function() 
				addon.DoFlyaway(panelIndex)
			end)

		local bgTex = cButton:CreateTexture(cButton:GetName() .. "bgTex", "BACKGROUND")
			bgTex:SetTexture('Interface/SpellBook/UI-Spellbook-SpellBackground')
			bgTex:SetHeight(ExpTextureSize + 6)
			bgTex:SetWidth(ExpTextureSize + 4)
			bgTex:SetTexCoord(0, (43/64), 0, (43/64))
			bgTex:SetPoint("CENTER", cButton, "CENTER", 0, 0)
		local iconTex = cButton:CreateTexture(cButton:GetName() .. "iconTex", "BORDER")
			iconTex:SetTexture('Interface/Icons/' .. bTex)
			iconTex:SetAllPoints(cButton)
		local pushedTexture = cButton:CreateTexture(cButton:GetName() .. "pTex", "ARTWORK")
			pushedTexture:SetTexture('Interface/Buttons/UI-Quickslot-Depress')
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)
		local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture('Interface/Buttons/ButtonHilight-Square')
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode('ADD')
			cButton:SetHighlightTexture(highlightTexture)
		local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture('Interface/Buttons/CheckButtonHilight')
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode('ADD')
			cButton:SetCheckedTexture(checkedTexture)
		-- Create the text object to go along with it
		local cbText = cButton:CreateFontString("cbText", "OVERLAY", "GameFontHighlight")
			cbText:SetText(addon:Yellow(ExpButtonText[panelIndex]))
			cbText:SetPoint("LEFT", cButton, "RIGHT", 5, 0)
			cbText:SetHeight(14)
			cbText:SetWidth(100)
			cbText:SetJustifyH("LEFT")
			cButton.text = cbText

		-- And throw up a tooltip
		addon:TooltipDisplay(cButton, ExpButtonTT[panelIndex])
		cButton:Hide()
		return cButton

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

do

	local currentProfession = nil

	function addon:ToggleFrame()

		-- What profession is opened?
		local cprof = GetTradeSkillLine()

		if (addon.Frame and addon.Frame:IsVisible()) then
			-- If we have the same profession open, then we close the scanned window
			if (currentProfession == cprof) then
				addon.Frame:Hide()
			-- If we have a different profession open we do a scan
			else
				addon:AckisRecipeList_Command(false)
				currentProfession = cprof
			end
		else
			currentProfession = cprof
			-- If we click the scan button with the shift key down, we do a text dump
			if (IsShiftKeyDown()) then
				addon:AckisRecipeList_Command(true)
			else
				addon:AckisRecipeList_Command(false)
			end
		end

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- Set the texture on the switcher button.

local function SetSwitcherTexture(tex)

-- This is really only called the first time its displayed. It should reflect the first
-- profession the user has selected, or that shows up in his lists.

-- For now, just display the first texture
	local ARL_S_NTexture = ARL_SwitcherButton:CreateTexture("ARL_S_NTexture", "BACKGROUND")
	ARL_S_NTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_up]])
	ARL_S_NTexture:SetTexCoord(0, 1, 0, 1)
	ARL_S_NTexture:SetAllPoints(ARL_SwitcherButton)
	local ARL_S_PTexture = ARL_SwitcherButton:CreateTexture("ARL_S_PTexture", "BACKGROUND")
	ARL_S_PTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_down]])
	ARL_S_PTexture:SetTexCoord(0, 1, 0, 1)
	ARL_S_PTexture:SetAllPoints(ARL_SwitcherButton)
	local ARL_S_DTexture = ARL_SwitcherButton:CreateTexture("ARL_S_DTexture", "BACKGROUND")
	ARL_S_DTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_up]])
	ARL_S_DTexture:SetTexCoord(0, 1, 0, 1)
	ARL_S_DTexture:SetAllPoints(ARL_SwitcherButton)

	ARL_SwitcherButton:SetNormalTexture(ARL_S_NTexture)
	ARL_SwitcherButton:SetPushedTexture(ARL_S_PTexture)
	ARL_SwitcherButton:SetDisabledTexture(ARL_S_DTexture)

end

	-- Description: Switch the displayed profession in the main panel
	-- Expected result: 
	-- Input: 
	-- Output: 

function addon:SwitchProfs(button)
	-- Known professions should be in playerData["Professions"]

	-- This loop is gonna be weird. The reason is because we need to
	-- ensure that we cycle through all the known professions, but also
	-- that we do so in order. That means that if the currently displayed
	-- profession is the last one in the list, we're actually going to
	-- iterate completely once to get to the currently displayed profession
	-- and then iterate again to make sure we display the next one in line.
	-- Further, there is the nuance that the person may not know any
	-- professions yet at all. User are so annoying.
	local startLoop = 0
	local endLoop = 0
	local displayProf = 0

	-- ok, so first off, if we've never done this before, there is no "current"
	-- and a single iteration will do nicely, thank you
	if button == "LeftButton" then
		-- normal profession switch
		if (currentProfIndex == 0) then
			startLoop = 1
			endLoop = addon.MaxProfessions + 1
		else
			startLoop = currentProfIndex + 1
			endLoop = currentProfIndex
		end
		local index = startLoop
	
		while (index ~= endLoop) do
			if (index > MaxProfessions) then
				index = 1
			else
				if (playerData["Professions"][SortedProfessions[index].name] == true) then
					displayProf = index
					currentProfIndex = index
					break
				else
					index = index + 1
				end
			end
		end
	elseif button == "RightButton" then
		-- reverse profession switch
		if (currentProfIndex == 0) then
			startLoop = addon.MaxProfessions + 1
			endLoop = 0
		else
			startLoop = currentProfIndex - 1
			endLoop = currentProfIndex
		end
		local index = startLoop
	
		while (index ~= endLoop) do
			if (index < 1) then
				index = MaxProfessions
			else
				if (playerData["Professions"][SortedProfessions[index].name] == true) then
					displayProf = index
					currentProfIndex = index
					break
				else
					index = index - 1
				end
			end
		end
	end

	-- Redisplay the button with the new skill
	SetSwitcherTexture(SortedProfessions[currentProfIndex].texture)
	playerData.playerProfession = SortedProfessions[currentProfIndex].name
	currentProfession = playerData.playerProfession

	-- Lets get the new skill level
	-- Expand all headers first

	local NumSkillLines = GetNumSkillLines()
	local expandtable = {}

	for i=NumSkillLines,1,-1 do
		local skillName,_,isExpanded = GetSkillLineInfo(i)
		if (not isExpanded) then
			expandtable[skillName] = true
			ExpandSkillHeader(i)
		end
	end

	NumSkillLines = GetNumSkillLines()

	-- @debug@
	self:Print("DEBUG: Switching professions, getting skill level for: " .. currentProfession .. " (" .. NumSkillLines .. ") skills to examine.")
	--@end-debug@

	-- Get the skill level
	for i=1,NumSkillLines,1 do
		local skillName,_,_,skillRank = GetSkillLineInfo(i)
		if (skillName == currentProfession) then
			-- @debug@
			self:Print("DEBUG: Switching professions, found new skill level for: " .. skillName .. " (" .. skillRank .. ")")
			--@end-debug@
			playerData.playerProfessionLevel = 	skillRank
			break
		end
	end

	-- Collapse expanded headers
	for i=NumSkillLines,1,-1 do
		local skillName,_,isExpanded = GetSkillLineInfo(i)
		if (expandtable[skillName] == true) then
			CollapseSkillHeader(i)
		end
	end

	ReDisplay()
	addon.resetTitle()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function CheckDisplayFaction(filterDB, faction)

	if (filterDB.general.faction ~= true) then

		if ((faction == BFAC[myFaction]) or (faction == BFAC["Neutral"]) or (faction == nil)) then

			return true

		else

			return false

		end

	else

		return true

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function expandEntry(dsIndex)

	-- insertIndex is the position in DisplayStrings that we want
	-- to expand. Since we are expanding the current entry, the return
	-- value should be the index of the next button after the expansion
	-- occurs

	local filterDB = addon.db.profile.filters
	local recipeIndex = DisplayStrings[dsIndex].sID

	dsIndex = dsIndex + 1

	-- Need to loop through the available acquires and put them all in
	for k, v in pairs(recipeDB[recipeIndex]["Acquire"]) do

		local pad = "  "
		local cSte,t,display

		-- set the string based on type of acquire
		--[[ 1 = Trainer , 2 = Vendor, 3 = Mob, 4 = Quest, 5 = Seasonal, 6 = Reputation --]]
		-- Trainer
		if (v["Type"] == 1) then

			-- Trainerdb : 	Trainer: ID, Name, Location, Coords, Faction
			local trnr = trainerDB[v["ID"]]

			display = CheckDisplayFaction(filterDB, trnr["Faction"])

			if (display == true) then

				-- properly colourize
				local tStr = addon:Trainer(L["Trainer"] .. " : ")
				local nStr = ""
				local cStr = ""

				if (trnr["Coordx"] ~= 0) and (trnr["Coordy"] ~= 0) then
					cSte = addon:Coords("(" .. trnr["Coordx"] .. ", " .. trnr["Coordy"] .. ")")
				end

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				if (trnr["Faction"] == BFAC["Horde"]) then
					nStr = addon:Horde(trnr["Name"])
				elseif (trnr["Faction"] == BFAC["Alliance"]) then
					nStr = addon:Alliance(trnr["Name"])
				else
					nStr = addon:Neutral(trnr["Name"])
				end

				t.String = pad .. tStr .. nStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				t.String = pad .. pad .. trnr["Location"] .. " " .. cStr
				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

			end

		-- Vendor
		elseif ((v["Type"] == 2) and (filterDB.obtain.vendor == true)) then

			-- VendorDB : ID, Name, Location, Coords, Faction
			local vndr = vendorDB[v["ID"]]

			display = CheckDisplayFaction(filterDB, vndr["Faction"])

			if (display == true) then

				-- properly colourize
				local tStr = addon:Vendor(L["Vendor"] .. " : ")
				local nStr = ""
				local cStr = ""

				if (vndr["Coordx"] ~= 0) and (vndr["Coordy"] ~= 0) then
					cStr = addon:Coords("(" .. vndr["Coordx"] .. ", " .. vndr["Coordy"] .. ")")
				end

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				if (vndr["Faction"] == BFAC["Horde"]) then
					nStr = addon:Horde(vndr["Name"])
				elseif (vndr["Faction"] == BFAC["Alliance"]) then
					nStr = addon:Alliance(vndr["Name"])
				else
					nStr = addon:Neutral(vndr["Name"])
				end

				t.String = pad .. tStr .. nStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				t.String = pad .. pad .. vndr["Location"] .. " " .. cStr
				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

			end

		-- Mob Drop Obtain
		elseif ((v["Type"] == 3) and ((filterDB.obtain.mobdrop == true) or (filterDB.obtain.instance == true) or (filterDB.obtain.raid == true))) then

			-- MobDB: ID, Name, Zone, Coordx, Coordy
			local mob = mobDB[v["ID"]]

			-- properly colourize
			local tStr = addon:MobDrop(L["Mob Drop"] .. " : ")
			local nStr = ""
			local cStr = ""

			if (mob["Coordx"] ~= 0) and (mob["Coordy"] ~= 0) then
				cStr = addon:Coords("(" .. mob["Coordx"] .. ", " .. mob["Coordy"] .. ")")
			end

			t = {}
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true

			nStr = addon:Red(mob["Name"])
			t.String = pad .. tStr .. nStr

			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

			t = {}
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true

			t.String = pad .. pad .. mob["Location"] .. " " .. cStr
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

		-- Quest Obtain
		elseif ((v["Type"] == 4) and (filterDB.obtain.quest)) then

			-- Quest: ID, Name, Location, Coords to start, Faction

			local qst = questDB[v["ID"]]

			display = CheckDisplayFaction(filterDB, qst["Faction"])

			if (display == true) then

				-- properly colourize
				local tStr = addon:Quest(L["Quest"] .. " : ")
				local nStr = ""
				local cStr = ""

				if (qst["Coordx"] ~= 0) and (qst["Coordy"] ~= 0) then

					cStr = addon:Coords("(" .. qst["Coordx"] .. ", " .. qst["Coordy"] .. ")")

				end

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				if (qst["Faction"] == BFAC["Horde"]) then

					nStr = addon:Horde(qst["Name"])

				elseif (qst["Faction"] == BFAC["Alliance"]) then

					nStr = addon:Alliance(qst["Name"])

				else

					nStr = addon:Neutral(qst["Name"])

				end

				t.String = pad .. tStr .. nStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1
				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true
				t.String = pad .. pad .. qst["Location"] .. " " .. cStr
				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

			end

		-- Seasonal
		elseif (v["Type"] == 5) then

			-- Seasonal: ID, Name
			local ssnname = seasonDB[v["ID"]]["Name"]

			t = {}
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true

			local tStr = addon:Season(L["Seasonal"] .. " : " .. ssnname)

			t.String = pad .. tStr
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

		elseif (v["Type"] == 6) then -- Need to check if we're displaying the currently id'd rep or not as well
			-- Reputation Obtain
			-- Rep: ID, Faction
			-- RepLevel = 0 (Neutral), 1 (Friendly), 2 (Honored), 3 (Revered), 4 (Exalted)
			-- RepVendor - VendorID
			-- Rep: RepName
			--   RepLevel: RepVndrName
			--     RepVndrLoc (Cx,Cy)

			local repfac = repDB[v["ID"]]
			local repname = repfac["Name"] -- name
			local rplvl = v["RepLevel"]
			local repvndr = vendorDB[v["RepVendor"]]

			display = CheckDisplayFaction(filterDB, repvndr["Faction"])

			if (display == true) then

				-- properly colourize
				local tStr = addon:Rep(L["Reputation"] .. " : ")
				local nStr = ""
				local rStr = ""
				local cStr = ""

				if (repvndr["Coordx"] ~= 0) and (repvndr["Coordy"] ~= 0) then

					cStr = addon:Coords("(" .. repvndr["Coordx"] .. ", " .. repvndr["Coordy"] .. ")")

				end

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				t.String = pad .. tStr .. repname
				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				-- RepLevel = 0 (Neutral), 1 (Friendly), 2 (Honored), 3 (Revered), 4 (Exalted)
				if (rplvl == 0) then rStr = addon:Neutral(BFAC["Neutral"] .. " : ")
				elseif (rplvl == 1) then rStr = addon:Friendly(BFAC["Neutral"] .. " : ")
				elseif (rplvl == 2) then rStr = addon:Honored(BFAC["Honored"] .. " : ")
				elseif (rplvl == 3) then rStr = addon:Revered(BFAC["Revered"] .. " : ")
				else rStr = addon:Exalted(BFAC["Exalted"] .. " : ") end

				if (repvndr["Faction"] == BFAC["Horde"]) then

					nStr = addon:Horde(repvndr["Name"])

				elseif (repvndr["Faction"] == BFAC["Alliance"]) then

					nStr = addon:Alliance(repvndr["Name"])

				else

					nStr = addon:Neutral(repvndr["Name"])

				end

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				t.String = pad .. pad .. rStr .. nStr 

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				t = {}
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				t.String = pad .. pad .. pad .. repvndr["Location"] .. " " .. cStr
				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

			end

		-- World Drop
		elseif ((v["Type"] == 7) and (filterDB.obtain.worlddrop == true)) then

			t = {}
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true

			t.String = pad .. addon:RarityColor(v["ID"] + 1, L["World Drop"])
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

		-- Custom
		elseif (v["Type"] == 8) then

			-- Custom: ID, Name
			local customname = customDB[v["ID"]]["Name"]

			t = {}
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true

			local tStr = addon:Normal(customname)

			t.String = pad .. tStr
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

		else

			t = {}
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true

			t.String = "Unhandled Acquire Case"
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

		end

	end
	
	return dsIndex

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.RecipeItem_OnClick(button)

	local clickedIndex = addon.RecipeListButton[button].sI

	-- Don't do anything if they've clicked on an empty button
	if (clickedIndex ~= nil) and (clickedIndex ~= 0) then

		local isRecipe = DisplayStrings[clickedIndex].IsRecipe
		local isExpanded = DisplayStrings[clickedIndex].IsExpanded
		local dString = DisplayStrings[clickedIndex].String
		local clickedSpellIndex = DisplayStrings[clickedIndex].sID
		local traverseIndex = 0

		-- First, check if this is a "modified" click, and react appropriately
		if (IsShiftKeyDown()) then

			local itemID = recipeDB[clickedSpellIndex]["ItemID"]
			local _, itemLink = GetItemInfo(itemID)

			if (itemLink) then

				ChatFrameEditBox:Insert(itemLink)

			else

				addon:Print(L["NoItemLink"])

			end

		elseif (IsControlKeyDown()) then

			ChatFrameEditBox:Insert(recipeDB[clickedSpellIndex]["RecipeLink"])

		elseif (IsAltKeyDown()) then

			-- Code needed here to insert this item into the "Ignore List"
			addon:ToggleExcludeRecipe(clickedSpellIndex)
			ReDisplay()

		else

			-- three possibilities here
			-- 1) We clicked on the recipe button on a closed recipe
			-- 2) We clicked on the recipe button of an open recipe
			-- 3) we clicked on the expanded text of an open recipe
			if (isRecipe) then

				if (isExpanded) then

					-- get rid of our expanded lines
					traverseIndex = clickedIndex + 1

					while (DisplayStrings[traverseIndex].IsRecipe == false) do

						tremove(DisplayStrings, traverseIndex)

						-- if this is the last entry in the whole list, we should break out
						if not DisplayStrings[traverseIndex] then

							break

						end

					end

					DisplayStrings[clickedIndex].IsExpanded = false

				else

					-- add in our expanded lines
					expandEntry(clickedIndex)
					-- set our current recipe to expanded
					DisplayStrings[clickedIndex].IsExpanded = true

				end

			else

				-- this inherently implies that we're on an expanded recipe
				-- first, back up in the list of buttons until we find our recipe line
				traverseIndex = clickedIndex - 1

				while (DisplayStrings[traverseIndex].IsRecipe == false) do

					traverseIndex = traverseIndex - 1

				end

				-- unexpand it
				DisplayStrings[traverseIndex].IsExpanded = false
				-- now remove the expanded lines until we get to a recipe again
				traverseIndex = traverseIndex + 1

				while (DisplayStrings[traverseIndex].IsRecipe == false) do

					tremove(DisplayStrings, traverseIndex)

				end

			end

			-- finally, call our scrollframe updater
			RecipeList_Update()

		end

	end

end

-- Rep Filtering panel switcher
-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.RepFilterSwitch(whichrep)
	-- 1	ARL_RepOldWorldCB		Old World Rep
	-- 2	ARL_RepBCCB				Burning Crusade
	-- 3	ARL_RepLKCB				Wrath of the Lich King
	local ShowPanel = false

	if (whichrep == 1) then

		if (ARL_RepOldWorldCB:GetChecked()) then

			ShowPanel = true
			addon.Fly_Rep_OW:Show()
			addon.Fly_Rep_BC:Hide()
			addon.Fly_Rep_LK:Hide()
			ARL_RepBCCB:SetChecked(false)
			ARL_RepLKCB:SetChecked(false)

		else

			ShowPanel = false

		end

	elseif (whichrep == 2) then

		if (ARL_RepBCCB:GetChecked()) then

			ShowPanel = true
			addon.Fly_Rep_OW:Hide()
			addon.Fly_Rep_BC:Show()
			addon.Fly_Rep_LK:Hide()
			ARL_RepOldWorldCB:SetChecked(false)
			ARL_RepLKCB:SetChecked(false)

		else

			ShowPanel = false

		end

	else -- whichrep == 3 (WotLK)

		if (ARL_RepLKCB:GetChecked()) then

			ShowPanel = true
			addon.Fly_Rep_OW:Hide()
			addon.Fly_Rep_BC:Hide()
			addon.Fly_Rep_LK:Show()
			ARL_RepOldWorldCB:SetChecked(false)
			ARL_RepBCCB:SetChecked(false)

		else

			ShowPanel = false

		end

	end

	if (ShowPanel == true) then

		addon.flyTexture:ClearAllPoints()
		addon.Flyaway:SetWidth(296)
		addon.Flyaway:SetHeight(312)
		addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_repcol]])
		addon.flyTexture:SetAllPoints(addon.Flyaway)
		addon.flyTexture:SetTexCoord(0, (296/512), 0, (312/512))

		addon.Fly_Rep_OW:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -20)
		addon.Fly_Rep_BC:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -20)
		addon.Fly_Rep_LK:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -4)

	else

		addon.flyTexture:ClearAllPoints()
		addon.Flyaway:SetWidth(136)
		addon.Flyaway:SetHeight(312)
		addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_1col]])
		addon.flyTexture:SetAllPoints(addon.Flyaway)
		addon.flyTexture:SetTexCoord(0, (136/256), 0, (312/512))
		addon.Fly_Rep_OW:Hide()
		addon.Fly_Rep_BC:Hide()
		addon.Fly_Rep_LK:Hide()
		ARL_RepOldWorldCB:SetChecked(false)
		ARL_RepBCCB:SetChecked(false)
		ARL_RepLKCB:SetChecked(false)

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.setFlyawayState()

	-- This function sets all the current options in the flyaway panel to make
	-- sure they are consistent with the SV options. This is run every time the
	-- Flyaway panel "OnShow" triggers
	local filterdb = addon.db.profile.filters
	local armordb = filterdb.item.armor
	local weapondb = filterdb.item.weapon
	-- General Options
	ARL_ClassCB:SetChecked(filterdb.general.class)
	ARL_SpecialtyCB:SetChecked(filterdb.general.specialty)
	ARL_LevelCB:SetChecked(filterdb.general.skill)
	ARL_FactionCB:SetChecked(filterdb.general.faction)
	ARL_KnownCB:SetChecked(filterdb.general.known)
	ARL_UnknownCB:SetChecked(filterdb.general.unknown)
	-- Obtain Options
	ARL_InstanceCB:SetChecked(filterdb.obtain.instance)
	ARL_RaidCB:SetChecked(filterdb.obtain.raid)
	ARL_QuestCB:SetChecked(filterdb.obtain.quest)
	ARL_SeasonalCB:SetChecked(filterdb.obtain.seasonal)
	ARL_TrainerCB:SetChecked(filterdb.obtain.trainer)
	ARL_VendorCB:SetChecked(filterdb.obtain.vendor)
	ARL_PVPCB:SetChecked(filterdb.obtain.pvp)
	ARL_DiscoveryCB:SetChecked(filterdb.obtain.discovery)
	ARL_WorldDropCB:SetChecked(filterdb.obtain.worlddrop)
	ARL_MobDropCB:SetChecked(filterdb.obtain.mobdrop)
	-- Binding Options
	ARL_iBoECB:SetChecked(filterdb.binding.itemboe)
	ARL_iBoPCB:SetChecked(filterdb.binding.itembop)
	ARL_rBoECB:SetChecked(filterdb.binding.recipeboe)
	ARL_rBoPCB:SetChecked(filterdb.binding.recipebop)
	-- Armor Options
	if ((armordb.cloth == true) and (armordb.leather == true) and
		 (armordb.mail == true) and (armordb.plate == true) and
		 (armordb.cloak == true) and (armordb.necklace == true) and
		 (armordb.ring == true) and (armordb.trinket == true) and
		 (armordb.shield == true)) then
		ARL_ArmorAllCB:SetChecked(true)
	else
		ARL_ArmorAllCB:SetChecked(false)
	end
	if ((armordb.cloth == false) and (armordb.leather == false) and
		 (armordb.mail == false) and (armordb.plate == false) and
		 (armordb.cloak == false) and (armordb.necklace == false) and
		 (armordb.ring == false) and (armordb.trinket == false) and
		 (armordb.shield == false)) then
		ARL_ArmorNoneCB:SetChecked(true)
	else
		ARL_ArmorNoneCB:SetChecked(false)
	end
	ARL_ArmorClothCB:SetChecked(armordb.cloth)
	ARL_ArmorLeatherCB:SetChecked(armordb.leather)
	ARL_ArmorMailCB:SetChecked(armordb.mail)
	ARL_ArmorPlateCB:SetChecked(armordb.plate)
	ARL_ArmorCloakCB:SetChecked(armordb.cloak)
	ARL_ArmorNecklaceCB:SetChecked(armordb.necklace)
	ARL_ArmorRingCB:SetChecked(armordb.ring)
	ARL_ArmorTrinketCB:SetChecked(armordb.trinket)
	ARL_ArmorShieldCB:SetChecked(armordb.shield)
	-- Weapon Options
	if ((weapondb.onehand == true) and (weapondb.twohand == true) and
		 (weapondb.dagger == true) and (weapondb.axe == true) and
		 (weapondb.mace == true) and (weapondb.sword == true) and
		 (weapondb.polearm == true) and (weapondb.wand == true) and
		 (weapondb.thrown == true) and (weapondb.ammo == true) and
		 (weapondb.fist == true)) then
		ARL_WeaponAllCB:SetChecked(true)
	else
		ARL_WeaponAllCB:SetChecked(false)
	end
	if ((weapondb.onehand == false) and (weapondb.twohand == false) and
		 (weapondb.dagger == false) and (weapondb.axe == false) and
		 (weapondb.mace == false) and (weapondb.sword == false) and
		 (weapondb.polearm == false) and (weapondb.wand == false) and
		 (weapondb.thrown == false) and (weapondb.ammo == false) and
		 (weapondb.fist == false)) then
		ARL_WeaponNoneCB:SetChecked(true)
	else
		ARL_WeaponNoneCB:SetChecked(false)
	end
	ARL_Weapon1HCB:SetChecked(weapondb.onehand)
	ARL_Weapon2HCB:SetChecked(weapondb.twohand)
	ARL_WeaponDaggerCB:SetChecked(weapondb.dagger)
	ARL_WeaponAxeCB:SetChecked(weapondb.axe)
	ARL_WeaponMaceCB:SetChecked(weapondb.mace)
	ARL_WeaponSwordCB:SetChecked(weapondb.sword)
	ARL_WeaponPolearmCB:SetChecked(weapondb.polearm)
	ARL_WeaponWandCB:SetChecked(weapondb.wand)
	ARL_WeaponThrownCB:SetChecked(weapondb.thrown)
	ARL_WeaponAmmoCB:SetChecked(weapondb.ammo)
	ARL_WeaponFistCB:SetChecked(weapondb.fist)
--[[
	--Disable weapon options. Probably don't need to touch these...
	ARL_WeaponStaffCB
	ARL_WeaponBowCB
	ARL_WeaponCrossbowCB ]]--
	-- Player Type Options
	ARL_PlayerTankCB:SetChecked(filterdb.player.tank)
	ARL_PlayerMeleeCB:SetChecked(filterdb.player.melee)
	ARL_PlayerHealerCB:SetChecked(filterdb.player.healer)
	ARL_PlayerCasterCB:SetChecked(filterdb.player.caster)
	-- Old World Rep Options
	ARL_RepArgentDawnCB:SetChecked(filterdb.rep.argentdawn)
	ARL_RepCenarionCircleCB:SetChecked(filterdb.rep.cenarioncircle)
	ARL_RepThoriumCB:SetChecked(filterdb.rep.thoriumbrotherhood)
	ARL_RepTimbermawCB:SetChecked(filterdb.rep.timbermaw)
	ARL_RepZandalarCB:SetChecked(filterdb.rep.zandalar)
	-- BC Rep Options
	ARL_RepAldorCB:SetChecked(filterdb.rep.aldor)
	ARL_RepAshtongueCB:SetChecked(filterdb.rep.ashtonguedeathsworn)
	ARL_RepCenarionExpeditionCB:SetChecked(filterdb.rep.cenarionexpedition)
	ARL_RepConsortiumCB:SetChecked(filterdb.rep.consortium)
	ARL_RepHonorHoldCB:SetChecked(filterdb.rep.hellfire)
	ARL_RepKeepersOfTimeCB:SetChecked(filterdb.rep.keepersoftime)
	ARL_RepKurenaiCB:SetChecked(filterdb.rep.nagrand)
	ARL_RepLowerCityCB:SetChecked(filterdb.rep.lowercity)
	ARL_RepScaleSandsCB:SetChecked(filterdb.rep.scaleofthesands)
	ARL_RepScryersCB:SetChecked(filterdb.rep.scryer)
	ARL_RepShatarCB:SetChecked(filterdb.rep.shatar)
	ARL_RepShatteredSunCB:SetChecked(filterdb.rep.shatteredsun)
	ARL_RepSporeggarCB:SetChecked(filterdb.rep.sporeggar)
	ARL_RepVioletEyeCB:SetChecked(filterdb.rep.violeteye)
-- Below this is WotLK stuff. May need to be changed post beta.
	ARL_RepArgentCrusadeCB:SetChecked(filterdb.rep.argentcrusade)
	ARL_RepFrenzyheartCB:SetChecked(filterdb.rep.frenzyheart)
	ARL_RepEbonBladeCB:SetChecked(filterdb.rep.ebonblade)
	ARL_RepKirinTorCB:SetChecked(filterdb.rep.kirintor)
	ARL_RepSonsOfHodirCB:SetChecked(filterdb.rep.sonsofhodir)
	ARL_RepKaluakCB:SetChecked(filterdb.rep.kaluak)
	ARL_RepOraclesCB:SetChecked(filterdb.rep.oracles)
	ARL_RepWyrmrestCB:SetChecked(filterdb.rep.wyrmrest)
	ARL_RepSilverCovenantCB:SetChecked(filterdb.rep.silvercovenant)
	ARL_RepSunreaversCB:SetChecked(filterdb.rep.sunreavers)
	ARL_RepExplorersLeagueCB:SetChecked(filterdb.rep.explorersleague)
	ARL_RepValianceCB:SetChecked(filterdb.rep.valiance)
	ARL_RepHandOfVengeanceCB:SetChecked(filterdb.rep.handofvengeance)
	ARL_RepTaunkaCB:SetChecked(filterdb.rep.taunka)
	ARL_RepWarsongOffensiveCB:SetChecked(filterdb.rep.warsongoffensive)
	ARL_RepAllianceVanguardCB:SetChecked(filterdb.rep.alliancevanguard)
	ARL_RepHordeExpeditionCB:SetChecked(filterdb.rep.hordeexpedition)
end

-- Description: 
-- Expected result: 
-- Input: 
-- Output:

local function recursiveReset(t)

	-- Thanks to Antiarc for this code

	for k, v in pairs(t) do

		if type(v) == "table" then

			recursiveReset(v)

		else

			t[k] = true

		end

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.resetFilters() 

	local filterdb = addon.db.profile.filters

	-- Reset all filters to true
	recursiveReset(addon.db.profile.filters)

	-- Reset specific filters to false
	filterdb.general.class = false
	filterdb.general.specialty = false
	filterdb.general.known = false

	addon.resetTitle()

	-- Uncheck the five buttons
	HideARL_ExpOptCB()

	-- Hide the flyaway panel
	addon.Flyaway:Hide()

	-- Reset the display
	ReDisplay()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.DoFlyaway(panel)

	-- This is going to manage the flyaway panel, as well as checking or unchecking the
	-- buttons that got us here in the first place
	--
	-- our panels are:
	-- 1	ARL_ExpGeneralOptCB			General Filters
	-- 2	ARL_ExpObtainOptCB			Obtain Filters
	-- 3	ARL_ExpBindingOptCB			Binding Filters
	-- 4	ARL_ExpItemOptCB			Item Filters

	local ChangeFilters = false

	addon.Fly_Rep_OW:Hide()
	addon.Fly_Rep_BC:Hide()
	addon.Fly_Rep_LK:Hide()
	ARL_RepOldWorldCB:SetChecked(false)
	ARL_RepBCCB:SetChecked(false)
	ARL_RepLKCB:SetChecked(false)

	if (panel == 1) then

		if (ARL_ExpGeneralOptCB:GetChecked()) then

			-- uncheck all other buttons
			HideARL_ExpOptCB("general")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Show()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true

		else

			ARL_ExpGeneralOptCB.text:SetText(addon:Yellow(ExpButtonText[1])) 
			ChangeFilters = false

		end

	elseif (panel == 2) then

		if (ARL_ExpObtainOptCB:GetChecked()) then

			HideARL_ExpOptCB("obtain")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Show()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true

		else

			ARL_ExpObtainOptCB.text:SetText(addon:Yellow(ExpButtonText[2])) 
			ChangeFilters = false

		end

	elseif (panel == 3) then

		if (ARL_ExpBindingOptCB:GetChecked()) then

			HideARL_ExpOptCB("binding")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Show()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true

		else

			ARL_ExpBindingOptCB.text:SetText(addon:Yellow(ExpButtonText[3])) 
			ChangeFilters = false

		end

	elseif (panel == 4) then

		if (ARL_ExpItemOptCB:GetChecked()) then

			HideARL_ExpOptCB("item")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Show()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true

		else

			ARL_ExpItemOptCB.text:SetText(addon:Yellow(ExpButtonText[4])) 
			ChangeFilters = false

		end

	elseif (panel == 5) then

		if (ARL_ExpPlayerOptCB:GetChecked()) then

			HideARL_ExpOptCB("player")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Show()
			addon.Fly_Rep:Hide()

			ChangeFilters = true

		else

			ARL_ExpPlayerOptCB.text:SetText(addon:Yellow(ExpButtonText[5])) 
			ChangeFilters = false

		end

	elseif (panel == 6) then

		if (ARL_ExpRepOptCB:GetChecked()) then

			HideARL_ExpOptCB("rep")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Show()

			ChangeFilters = true

		else

			ARL_ExpRepOptCB.text:SetText(addon:Yellow(ExpButtonText[6])) 
			ChangeFilters = false

		end

	end

	if (ChangeFilters == true) then

		-- Depending on which panel we're showing, either display one column
		-- or two column
		if ((panel == 3) or (panel == 4)) then

			addon.flyTexture:ClearAllPoints()
			addon.Flyaway:SetWidth(234)
			addon.Flyaway:SetHeight(312)
			addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_2col]])
			addon.flyTexture:SetAllPoints(addon.Flyaway)
			addon.flyTexture:SetTexCoord(0, (234/256), 0, (312/512))

		elseif ((panel == 1) or (panel == 2) or (panel == 5) or (panel == 6)) then

			addon.flyTexture:ClearAllPoints()
			addon.Flyaway:SetWidth(136)
			addon.Flyaway:SetHeight(312)
			addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_1col]])
			addon.flyTexture:SetAllPoints(addon.Flyaway)
			addon.flyTexture:SetTexCoord(0, (136/256), 0, (312/512))

		end

		-- Change the filters to the current panel
		addon.Flyaway:Show()

	else

		-- We're hiding, don't bother changing anything
		addon.Flyaway:Hide()

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- This does an initial fillup of the DisplayStrings, as above.
-- However, in this case, it expands every recipe

local function expandallDisplayStrings()

	local exclude = addon.db.profile.exclusionlist

	DisplayStrings = nil
	DisplayStrings = {}

	local insertIndex = 1

	for i = 1, #sortedRecipeIndex do

		local recipeIndex = sortedRecipeIndex[i]

		if ((recipeDB[recipeIndex]["Display"] == true) and (recipeDB[recipeIndex]["Search"] == true)) then

			local t = {}

			-- add in recipe difficulty coloring
			local recStr = ""

			if (exclude[recipeIndex] == true) then

				recStr = "** " .. recipeDB[recipeIndex]["Name"] .. " **"

			else

				recStr = recipeDB[recipeIndex]["Name"]

			end

			local recipeSkill = recipeDB[recipeIndex]["Level"]
			local playerSkill = playerData.playerProfessionLevel

			recStr = SetSortString(recipeSkill, recStr)

			local hasFaction = checkFactions(recipeDB, recipeIndex, playerData.playerFaction, playerData["Reputation"])

			t.String = ColourSkillLevel(recipeSkill, playerSkill, hasFaction, recStr)

			t.sID = sortedRecipeIndex[i]
			t.IsRecipe = true

			if (recipeDB[recipeIndex]["Acquire"]) then

				-- we have acquire information for this. push the title entry into the strings
				-- and start processing the acquires
				t.IsExpanded = true
				tinsert(DisplayStrings, insertIndex, t)
				insertIndex = expandEntry(insertIndex)

			else

				t.IsExpanded = false
				tinsert(DisplayStrings, insertIndex, t)
				insertIndex = insertIndex + 1

			end

		end

	end

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

function addon.ExpandAll_Clicked()

	-- Called when the expand all button is clicked
	if (ARL_ExpandButton:GetText() == L["EXPANDALL"]) then
		ARL_ExpandButton:SetText(L["CONTRACTALL"])
		addon:TooltipDisplay(ARL_ExpandButton, L["CONTRACTALL_DESC"])
		expandallDisplayStrings()
	else
		ARL_ExpandButton:SetText(L["EXPANDALL"])
		addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])
		initDisplayStrings()
	end
	RecipeList_Update()

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function ARL_DD_Sort_OnClick( button, value )
	CloseDropDownMenus()
	addon.db.profile.sorting = value
	ARL_DD_SortText:SetText( L["Sort"] .. ": " .. value )
	ReDisplay()
end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 

local function ARL_DD_Sort_Initialize()

	local k

	k = L["Name"]
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = ( addon.db.profile.sorting == k )
		UIDropDownMenu_AddButton( info )
	k = L["Skill"]
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = ( addon.db.profile.sorting == k )
		UIDropDownMenu_AddButton( info )
	k = L["Acquisition"]
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = ( addon.db.profile.sorting == k )
		UIDropDownMenu_AddButton( info )
	k = L["Location"]
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = ( addon.db.profile.sorting == k )
		UIDropDownMenu_AddButton( info )
	ARL_DD_SortText:SetText( L["Sort"] .. ": " .. addon.db.profile.sorting )

end

-- Description: Saves the frame position into the database 
-- Expected result: Frame coordinates are saved
-- Input: None
-- Output: Database values updated with frame position

local function SaveFramePosition()

	local opts = addon.db.profile.frameopts
	local from, _, to, x, y = addon.Frame:GetPoint()
	opts.anchorFrom = from
	opts.anchorTo = to
	opts.offsetx = x
	opts.offsety = y

end

-- Description: 
-- Expected result: 
-- Input: 
-- Output: 
-- Creates the initial frame to display recipes into

function addon:CreateFrame(

	rDB,		-- RecipeList
	sortedRI,	-- sortedindex
	cPlayer,	-- playerdata
	asTable,	-- AllSpecialtiesTable
	trList,		-- TrainerList
	vList,		-- VendorList
	qList,		-- QuestList
	rList,		-- ReputationList
	sList,		-- SeasonalList
	mList,		-- MobList
	cList)		-- Customlist

--[[
	cPlayer is a table containing:
		.playerProfession == player profession which has been opened
		.playerProfessionLevel == skill level of profession
		.playerSpecialty == Specialty if any or ""
		.totalRecipes == Total recipes added to the database
		.foundRecipes == Total recipes found that the player knows
		.otherRecipes == Total non-profession recipes in the database
		.filteredRecipes == Total recipes filtered
		.playerFaction == Faction of the player
		["Professions"] == list of all professions with the ones the player knows set as true
		["Reputation"] == Reputation levels, what I had in current ARLform was if you didn't have the rep level, it would display it in red
--]]

	myFaction = cPlayer.playerFaction

	local HonorHold_Thrallmar_FactionText = ""
	local Kurenai_Maghar_FactionText = ""

	-- Values for the progressbar (defaults)
	local pbMin = 0
	local pbMax = 100
	local pbCur = 50

	sortedRecipeIndex = sortedRI
	recipeDB = rDB
	allSpecTable = asTable
	playerData = cPlayer
	currentProfession = playerData.playerProfession
	trainerDB = trList
	vendorDB = vList
	questDB = qList
	repDB = rList
	seasonDB = sList
	mobDB = mList
	customDB = cList

	-- reset current display items
	DisplayStrings = {}

	-- get our current profession's index
	for k, v in pairs(SortedProfessions) do

		if (v.name == currentProfession) then

			currentProfIndex = k
			break

		end

	end

	-- Adding a check in to see if we're Horde or Alliance, and change the displayed reputation
	-- strings to be faction correct (eg, Honor Hold / Thrallmar)
	if (myFaction == "Alliance") then

		HonorHold_Thrallmar_FactionText = BFAC["Honor Hold"]
		Kurenai_Maghar_FactionText = BFAC["Kurenai"]

	else

		HonorHold_Thrallmar_FactionText = BFAC["Thrallmar"]
		Kurenai_Maghar_FactionText = BFAC["The Mag'har"]

	end

	if (not addon.Frame) then

		-- Create the main frame
		addon.Frame = CreateFrame("Frame", "AckisRecipeList.Frame", UIParent)

		--Allows ARL to be closed with the Escape key
		tinsert(UISpecialFrames, "AckisRecipeList.Frame")

		addon.Frame:SetWidth(293)
		addon.Frame:SetHeight(447)

		addon.bgTexture = addon.Frame:CreateTexture("AckisRecipeList.bgTexture", "ARTWORK")
		addon.bgTexture:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\main")
		addon.bgTexture:SetAllPoints(addon.Frame)
		addon.bgTexture:SetTexCoord(0, (293/512), 0, (447/512))
		addon.Frame:SetFrameStrata("DIALOG")
		addon.Frame:SetHitRectInsets(5, 5, 5, 5)

		addon.Frame:EnableMouse(true)
		addon.Frame:EnableKeyboard(true)
		addon.Frame:SetMovable(true)

		addon.Frame:SetScript("OnMouseDown",
				function()
					addon.Frame:StartMoving()
				end
			)

		addon.Frame:SetScript("OnHide", function() self:CloseWindow() end)
		addon.Frame:SetScript("OnMouseUp",
				function()
					addon.Frame:StopMovingOrSizing()
					SaveFramePosition()
				end
			)

		addon.Frame:ClearAllPoints()

		local opts = self.db.profile.frameopts

		if ( opts.anchorTo == "" ) then
			-- no values yet, clamp to whatever frame is appropriate
			if (ATSWFrame) then
				-- Anchor frame to ATSW
				addon.Frame:SetPoint("CENTER", ATSWFrame, "CENTER", 490, 0)
			elseif (Skillet) then
				-- Anchor frame to Skillet
				addon.Frame:SetPoint("CENTER", SkilletFrame, "CENTER", 468, 0)
			else
				-- Anchor to default tradeskill frame
				addon.Frame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", 10, 0 )
			end
		else
			addon.Frame:SetPoint( opts.anchorFrom, UOParent, opts.anchorTo, opts.offsetx, opts.offsety )
		end

		addon.Frame:Show()
		addon.Frame._Expanded = false

		addon.Frame.HeadingText = addon.Frame:CreateFontString("addon.Frame.HeadingText", "ARTWORK")
			
		addon.Frame.HeadingText:SetFontObject("GameFontHighlightSmall")
		addon.Frame.HeadingText:ClearAllPoints()
		addon.Frame.HeadingText:SetPoint("TOP", addon.Frame, "TOP", 20, -16)
		addon.Frame.HeadingText:SetJustifyH("CENTER")

		local ARL_SwitcherButton = CreateFrame("Button", "ARL_SwitcherButton", addon.Frame, "UIPanelButtonTemplate")
			ARL_SwitcherButton:SetWidth(64)
			ARL_SwitcherButton:SetHeight(64)
			ARL_SwitcherButton:SetPoint("TOPLEFT", addon.Frame, "TOPLEFT", 1, -2)
			ARL_SwitcherButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			ARL_SwitcherButton:SetScript("OnClick",
				function(self, button)
					addon:SwitchProfs(button)
				end
			)

		-- Stuff in the non-expanded frame (or both)
		local ARL_CloseXButton = CreateFrame("Button", "ARL_CloseXButton", addon.Frame, "UIPanelCloseButton")
			ARL_CloseXButton:SetScript("OnClick",
				function(this)
					this:GetParent():Hide()
				end
			)
			ARL_CloseXButton:SetPoint("TOPRIGHT", addon.Frame, "TOPRIGHT", 5, -6)

		local ARL_FilterButton = addon:GenericCreateButton("ARL_FilterButton", addon.Frame,
			25, 90, "TOPRIGHT", addon.Frame, "TOPRIGHT", -8, -40, "GameFontNormalSmall",
			"GameFontHighlightSmall", L["FILTER_OPEN"], "CENTER", L["FILTER_OPEN_DESC"], 1)
			ARL_FilterButton:SetScript("OnClick", addon.ToggleFilters)

		local ARL_DD_Sort = CreateFrame( "Frame", "ARL_DD_Sort", addon.Frame, "UIDropDownMenuTemplate" )
		ARL_DD_Sort:SetPoint( "TOPLEFT", addon.Frame, "TOPLEFT", 55, -39 )
		ARL_DD_Sort:SetHitRectInsets(16, 16, 0, 0)
		ARL_DD_SortText:SetText( L["Sort"] .. ": " .. addon.db.profile.sorting )
		UIDropDownMenu_SetWidth( ARL_DD_Sort, 100 )

		local ARL_ExpandButton = addon:GenericCreateButton("ARL_ExpandButton", addon.Frame,
			21, 40, "TOPRIGHT", ARL_DD_Sort, "BOTTOMLEFT", -2, -1, "GameFontNormalSmall",
			"GameFontHighlightSmall", L["EXPANDALL"], "CENTER", L["EXPANDALL_DESC"], 1)
			ARL_ExpandButton:SetScript("OnClick", addon.ExpandAll_Clicked)

		local ARL_SearchButton = addon:GenericCreateButton("ARL_SearchButton", addon.Frame,
			25, 74, "TOPLEFT", ARL_DD_Sort, "BOTTOMRIGHT", 12, 1, "GameFontDisableSmall",
			"GameFontHighlightSmall", L["Search"], "CENTER", L["SEARCH_DESC"], 1)
			ARL_SearchButton:Disable()
			ARL_SearchButton:SetScript("OnClick",
				function(this)

					local searchtext = ARL_SearchText:GetText()
					searchtext = searchtext:trim()

					if (searchtext ~= "") then

						ARL_LastSearchedText = searchtext

						addon:SearchRecipeDB(recipeDB, searchtext)
						initDisplayStrings()
						RecipeList_Update()

						ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
						ARL_SearchButton:Disable()

					end

				end
			)

		local ARL_ClearButton = addon:GenericCreateButton("ARL_ClearButton", addon.Frame,
			28, 28, "RIGHT", ARL_SearchButton, "LEFT", 3, -1, "GameFontNormalSmall",
			"GameFontHighlightSmall", "", "CENTER", L["CLEAR_DESC"], 3)
			ARL_ClearButton:SetScript("OnClick",
				function()

					addon:ResetSearch(recipeDB)
					ARL_SearchText:SetText(L["SEARCH_BOX_DESC"])

					-- Make sure our expand all button is set to expandall
					ARL_ExpandButton:SetText(L["EXPANDALL"])
					addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

					-- Make sure to clear the focus of the searchbox
					ARL_SearchText:ClearFocus()

					-- Disable the search button since we're not searching for anything now
					ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
					ARL_SearchButton:Disable()

					-- Make sure to clear text for last search
					ARL_LastSearchedText = ""

					initDisplayStrings()
					RecipeList_Update()

				end
			)
		ARL_SearchText = CreateFrame("EditBox", "ARL_SearchText", addon.Frame, "InputBoxTemplate")
			ARL_SearchText:SetText(L["SEARCH_BOX_DESC"])
			ARL_SearchText:SetScript("OnEnterPressed",
				function(this)

					local searchtext = ARL_SearchText:GetText()
					searchtext = searchtext:trim()
					
					if (searchtext ~= "") and (searchtext ~= L["SEARCH_BOX_DESC"]) then

						ARL_LastSearchedText = searchtext

						addon:SearchRecipeDB(recipeDB, searchtext)
						initDisplayStrings()
						RecipeList_Update()

						ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
						ARL_SearchButton:Disable()

					end

				end
			)
			ARL_SearchText:SetScript("OnEditFocusGained",
				function(this)

					if (this:GetText() == L["SEARCH_BOX_DESC"]) then

						this:SetText("")

					end

				end
			)
			ARL_SearchText:SetScript("OnEditFocusLost",
				function(this)

					if (this:GetText() == "") then

						this:SetText(L["SEARCH_BOX_DESC"])

					end

				end
			)
			ARL_SearchText:SetScript("OnTextChanged",
				function(this)

					if (this:GetText() ~= "" and this:GetText() ~= L["SEARCH_BOX_DESC"] and this:GetText() ~= ARL_LastSearchedText) then

						ARL_SearchButton:SetNormalFontObject("GameFontNormalSmall")
						ARL_SearchButton:Enable()
						
					else

						ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
						ARL_SearchButton:Disable()

					end

				end
			)
			ARL_SearchText:EnableMouse(true)
			ARL_SearchText:SetAutoFocus(false)
			ARL_SearchText:SetFontObject(ChatFontNormal)
			ARL_SearchText:SetWidth(135)
			ARL_SearchText:SetHeight(12)
			ARL_SearchText:SetPoint("RIGHT", ARL_ClearButton, "LEFT", 4, -1)
			ARL_SearchText:Show()

		local ARL_CloseButton = addon:GenericCreateButton("ARL_CloseButton", addon.Frame,
			22, 69, "BOTTOMRIGHT", addon.Frame, "BOTTOMRIGHT", -4, 3, "GameFontNormalSmall",
			"GameFontHighlightSmall", L["Close"], "CENTER", L["CLOSE_DESC"], 1)
			ARL_CloseButton:SetScript("OnClick",
				function(this)
					this:GetParent():Hide()
				end
			)

		-- ProgressBar for our skills
		local ARL_ProgressBar = CreateFrame("StatusBar", "ARL_ProgressBar", addon.Frame)
			ARL_ProgressBar:SetWidth(194)
			ARL_ProgressBar:SetHeight(14)
			ARL_ProgressBar:ClearAllPoints()
			ARL_ProgressBar:SetPoint("BOTTOMLEFT", addon.Frame, 17, 7)
			ARL_ProgressBar:SetStatusBarTexture("Interface\\Addons\\AckisRecipeList\\img\\progressbar")
			ARL_ProgressBar:SetOrientation("HORIZONTAL")
			ARL_ProgressBar:SetStatusBarColor(0.25, 0.25, 0.75)

			ARL_ProgressBar:SetMinMaxValues(pbMin, pbMax)
			ARL_ProgressBar:SetValue(pbCur)

		local ARL_ProgressBarText = ARL_ProgressBar:CreateFontString("ARL_ProgressBarText", "ARTWORK")
			ARL_ProgressBarText:SetWidth(194)
			ARL_ProgressBarText:SetHeight(14)
			ARL_ProgressBarText:SetFontObject("GameFontHighlightSmall")
			ARL_ProgressBarText:ClearAllPoints()
			ARL_ProgressBarText:SetPoint("CENTER", ARL_ProgressBar, "CENTER", 0, 0)
			ARL_ProgressBarText:SetJustifyH("CENTER")
 			ARL_ProgressBarText:SetText(pbCur .. " / " .. pbMax .. " - " .. math.floor(pbCur / pbMax * 100) .. "%")

		-- I'm going to use my own tooltip for recipebuttons
		arlTooltip = CreateFrame("GameTooltip", "arlTooltip", addon.Frame, "GameTooltipTemplate")
		arlTooltip2 = CreateFrame("GameTooltip", "arlTooltip2", addon.Frame, "GameTooltipTemplate")

		-- The main recipe list buttons and scrollframe
		addon.PlusListButton = {}
		addon.RecipeListButton = {}

		for i = 1, maxVisibleRecipes do

			local Temp_Plus = addon:GenericCreateButton("ARL_PlusListButton" .. i, addon.Frame,
				16, 16, "TOPLEFT", addon.Frame, "TOPLEFT", 20, -100, "GameFontNormalSmall",
				"GameFontHighlightSmall", "", "LEFT", "", 2)

			local Temp_Recipe = addon:GenericCreateButton("ARL_RecipeListButton" .. i, addon.Frame,
				16, 224, "TOPLEFT", addon.Frame, "TOPLEFT", 37, -100, "GameFontNormalSmall",
				"GameFontHighlightSmall", "Blort", "LEFT", "", 0)

			if not (i == 1) then

				Temp_Plus:SetPoint("TOPLEFT", addon.PlusListButton[i-1], "BOTTOMLEFT", 0, 3)
				Temp_Recipe:SetPoint("TOPLEFT", addon.RecipeListButton[i-1], "BOTTOMLEFT", 0, 3)

			end

			Temp_Plus:SetScript("OnClick",
				function ()
					addon.RecipeItem_OnClick(i)
				end
			)

			Temp_Recipe:SetScript("OnClick",
				function ()
					addon.RecipeItem_OnClick(i)
				end
			)

			addon.PlusListButton[i] = Temp_Plus
			addon.RecipeListButton[i] = Temp_Recipe

		end

		local ARL_RecipeScrollFrame = CreateFrame("ScrollFrame", "ARL_RecipeScrollFrame", addon.Frame, "FauxScrollFrameTemplate")
		ARL_RecipeScrollFrame:SetHeight(322)
		ARL_RecipeScrollFrame:SetWidth(243)
		ARL_RecipeScrollFrame:SetPoint("TOPLEFT", addon.Frame, "TOPLEFT", 20, -97)
		ARL_RecipeScrollFrame:SetScript("OnVerticalScroll",
			function(self, arg1)
				FauxScrollFrame_OnVerticalScroll(self, arg1, 16, RecipeList_Update)
			end
		)

		-- Stuff that appears on the main frame only when expanded

		local ARL_ResetButton = addon:GenericCreateButton("ARL_ResetButton", addon.Frame,
			25, 90, "TOPRIGHT", ARL_FilterButton, "BOTTOMRIGHT", 0, -2, "GameFontNormalSmall",
			"GameFontHighlightSmall", L["Reset"], "CENTER", L["RESET_DESC"], 1)
			ARL_ResetButton:SetScript("OnClick", addon.resetFilters)
			ARL_ResetButton:Hide()

		local ARL_ApplyButton = addon:GenericCreateButton("ARL_ApplyButton", addon.Frame,
			22, 69, "RIGHT", ARL_CloseButton, "LEFT", -82, 0, "GameFontDisableSmall",
			"GameFontHighlightSmall", L["Apply"], "CENTER", L["APPLY_DESC"], 1)
			ARL_ApplyButton:SetScript("OnClick", ReDisplay)
			ARL_ApplyButton:Hide()

		-- EXPANDED : 5 buttons for opening/closing the flyaway

		ARL_ExpGeneralOptCB = addon:CreateExpCB("ARL_ExpGeneralOptCB", "INV_Misc_Note_06", 1)
		ARL_ExpGeneralOptCB:SetPoint("TOPRIGHT", ARL_FilterButton, "BOTTOMLEFT", -1, -50)

		ARL_ExpObtainOptCB = addon:CreateExpCB("ARL_ExpObtainOptCB", "Spell_Shadow_MindRot", 2)
		ARL_ExpObtainOptCB:SetPoint("TOPLEFT", ARL_ExpGeneralOptCB, "BOTTOMLEFT", 0, -8)

		ARL_ExpBindingOptCB = addon:CreateExpCB("ARL_ExpBindingOptCB", "INV_Belt_20", 3)
		ARL_ExpBindingOptCB:SetPoint("TOPLEFT", ARL_ExpObtainOptCB, "BOTTOMLEFT", -0, -8)

		ARL_ExpItemOptCB = addon:CreateExpCB("ARL_ExpItemOptCB", "INV_Misc_EngGizmos_19", 4)
		ARL_ExpItemOptCB:SetPoint("TOPLEFT", ARL_ExpBindingOptCB, "BOTTOMLEFT", -0, -8)

		ARL_ExpPlayerOptCB = addon:CreateExpCB("ARL_ExpPlayerOptCB", "INV_Misc_GroupLooking", 5)
		ARL_ExpPlayerOptCB:SetPoint("TOPLEFT", ARL_ExpItemOptCB, "BOTTOMLEFT", -0, -8)

		ARL_ExpRepOptCB = addon:CreateExpCB("ARL_ExpRepOptCB", "INV_Scroll_05", 6)
		ARL_ExpRepOptCB:SetPoint("TOPLEFT", ARL_ExpPlayerOptCB, "BOTTOMLEFT", -0, -8)

		-- Frame for the flyaway pane
		addon.Flyaway = CreateFrame("Frame", "addon.Flyaway", addon.Frame)
			addon.Flyaway:SetWidth(234)
			addon.Flyaway:SetHeight(312)

			addon.flyTexture = addon.Flyaway:CreateTexture("AckisRecipeList.flyTexture", "ARTWORK")
			addon.flyTexture:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\fly_2col")
			addon.flyTexture:SetAllPoints(addon.Flyaway)
			addon.flyTexture:SetTexCoord(0, (234/256), 0, (312/512))
			addon.Flyaway:SetHitRectInsets(5, 5, 5, 5)

			addon.Flyaway:EnableMouse(true)
			addon.Flyaway:EnableKeyboard(true)
			addon.Flyaway:SetMovable(false)

			addon.Flyaway:ClearAllPoints()
			addon.Flyaway:SetPoint("TOPLEFT", addon.Frame, "TOPRIGHT", -6, -102)

			addon.Flyaway:SetScript("OnShow", addon.setFlyawayState) 
			addon.Flyaway:Hide()

		-- Flyaway virtual frames to group buttons/text easily (and make them easy to show/hide)

		addon.Fly_General = CreateFrame("Frame", "addon.Fly_General", addon.Flyaway)
			addon.Fly_General:SetWidth(210)
			addon.Fly_General:SetHeight(280)
			addon.Fly_General:EnableMouse(true)
			addon.Fly_General:EnableKeyboard(true)
			addon.Fly_General:SetMovable(false)
			addon.Fly_General:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
			addon.Fly_General:Hide()
--			() Class Specific recipes
--			() Craft Specialty recipes
--			() All skill levels
--			() Cross-Faction
--			() Known	  () Unknown		
			local ARL_ClassCB = CreateFrame("CheckButton", "ARL_ClassCB", addon.Fly_General, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ClassCB, addon.Fly_General, L["CLASS_DESC"], 1, 1, 1, 0)
				ARL_ClassCBText:SetText(L["Classes"])
			local ARL_SpecialtyCB = CreateFrame("CheckButton", "ARL_SpecialtyCB", addon.Fly_General, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_SpecialtyCB, addon.Fly_General, L["SPECIALTY_DESC"], 2, 2, 1, 0)
				ARL_SpecialtyCBText:SetText(L["Specialties"])
			local ARL_LevelCB = CreateFrame("CheckButton", "ARL_LevelCB", addon.Fly_General, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_LevelCB, addon.Fly_General, L["SKILL_DESC"], 3, 3, 1, 0)
				ARL_LevelCBText:SetText(L["Skill"])
			local ARL_FactionCB = CreateFrame("CheckButton", "ARL_FactionCB", addon.Fly_General, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_FactionCB, addon.Fly_General, L["FACTION_DESC"], 4, 4, 1, 0)
				ARL_FactionCBText:SetText(L["Faction"])
			local ARL_KnownCB = CreateFrame("CheckButton", "ARL_KnownCB", addon.Fly_General, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_KnownCB, addon.Fly_General, L["KNOWN_DESC"], 5, 5, 1, 0)
				ARL_KnownCBText:SetText(L["Known"])
			local ARL_UnknownCB = CreateFrame("CheckButton", "ARL_UnknownCB", addon.Fly_General, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_UnknownCB, addon.Fly_General, L["UNKNOWN_DESC"], 6, 6, 1, 0)
				ARL_UnknownCBText:SetText(L["Unknown"])

		addon.Fly_Obtain = CreateFrame("Frame", "addon.Fly_Obtain", addon.Flyaway)
			addon.Fly_Obtain:SetWidth(210)
			addon.Fly_Obtain:SetHeight(280)
			addon.Fly_Obtain:EnableMouse(true)
			addon.Fly_Obtain:EnableKeyboard(true)
			addon.Fly_Obtain:SetMovable(false)
			addon.Fly_Obtain:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
			addon.Fly_Obtain:Hide()
--			() Instance	() Raid
--			() Quest		() Seasonal
--			() Trainer		() Vendor
--			() PVP		() Discovery
--			() World Drop	() Mob Drop
			local ARL_InstanceCB = CreateFrame("CheckButton", "ARL_InstanceCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_InstanceCB, addon.Fly_Obtain, L["INSTANCE_DESC"], 7, 1, 1, 0)
				ARL_InstanceCBText:SetText(L["Instance"])
			local ARL_RaidCB = CreateFrame("CheckButton", "ARL_RaidCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RaidCB, addon.Fly_Obtain, L["RAID_DESC"], 8, 2, 1, 0)
				ARL_RaidCBText:SetText(L["Raid"])
			local ARL_QuestCB = CreateFrame("CheckButton", "ARL_QuestCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_QuestCB, addon.Fly_Obtain, L["QUEST_DESC"], 9, 3, 1, 0)
				ARL_QuestCBText:SetText(L["Quest"])
			local ARL_SeasonalCB = CreateFrame("CheckButton", "ARL_SeasonalCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_SeasonalCB, addon.Fly_Obtain, L["SEASONAL_DESC"], 10, 4, 1, 0)
				ARL_SeasonalCBText:SetText(L["Seasonal"])
			local ARL_TrainerCB = CreateFrame("CheckButton", "ARL_TrainerCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_TrainerCB, addon.Fly_Obtain, L["TRAINER_DESC"], 11, 5, 1, 0)
				ARL_TrainerCBText:SetText(L["Trainer"])
			local ARL_VendorCB = CreateFrame("CheckButton", "ARL_VendorCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_VendorCB, addon.Fly_Obtain, L["VENDOR_DESC"], 12, 6, 1, 0)
				ARL_VendorCBText:SetText(L["Vendor"])
			local ARL_PVPCB = CreateFrame("CheckButton", "ARL_PVPCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_PVPCB, addon.Fly_Obtain, L["PVP_DESC"], 13, 7, 1, 0)
				ARL_PVPCBText:SetText(L["PVP"])
			local ARL_DiscoveryCB = CreateFrame("CheckButton", "ARL_DiscoveryCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_DiscoveryCB, addon.Fly_Obtain, L["DISCOVERY_DESC"], 14, 8, 1, 0)
				ARL_DiscoveryCBText:SetText(L["Discovery"])
			local ARL_WorldDropCB = CreateFrame("CheckButton", "ARL_WorldDropCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WorldDropCB, addon.Fly_Obtain, L["WORLD_DROP_DESC"], 39, 9, 1, 0)
				ARL_WorldDropCBText:SetText(L["World Drop"])
			local ARL_MobDropCB = CreateFrame("CheckButton", "ARL_MobDropCB", addon.Fly_Obtain, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_MobDropCB, addon.Fly_Obtain, L["MOB_DROP_DESC"], 40, 10, 1, 0)
				ARL_MobDropCBText:SetText(L["Mob Drop"])

		addon.Fly_Binding = CreateFrame("Frame", "addon.Fly_Binding", addon.Flyaway)
			addon.Fly_Binding:SetWidth(210)
			addon.Fly_Binding:SetHeight(280)
			addon.Fly_Binding:EnableMouse(true)
			addon.Fly_Binding:EnableKeyboard(true)
			addon.Fly_Binding:SetMovable(false)
			addon.Fly_Binding:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
			addon.Fly_Binding:Hide()
--			() Crafted Item is Bind on Equip
--			() Crafted Item is Bind on Pickup
--			() Recipe is Bind on Equip
--			() Recipe is Bind on Pickup
			local ARL_iBoECB = CreateFrame("CheckButton", "ARL_iBoECB", addon.Fly_Binding, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_iBoECB, addon.Fly_Binding, L["BOE_DESC"], 15, 1, 1, 0)
				ARL_iBoECBText:SetText(L["BOEFilter"])
			local ARL_iBoPCB = CreateFrame("CheckButton", "ARL_iBoPCB", addon.Fly_Binding, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_iBoPCB, addon.Fly_Binding, L["BOP_DESC"], 16, 2, 1, 0)
				ARL_iBoPCBText:SetText(L["BOPFilter"])
			local ARL_rBoECB = CreateFrame("CheckButton", "ARL_rBoECB", addon.Fly_Binding, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_rBoECB, addon.Fly_Binding, L["RECIPE_BOE_DESC"], 17, 3, 1, 0)
				ARL_rBoECBText:SetText(L["RecipeBOEFilter"])
			local ARL_rBoPCB = CreateFrame("CheckButton", "ARL_rBoPCB", addon.Fly_Binding, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_rBoPCB, addon.Fly_Binding, L["RECIPE_BOP_DESC"], 18, 4, 1, 0)
				ARL_rBoPCBText:SetText(L["RecipeBOPFilter"])

		addon.Fly_Item = CreateFrame("Frame", "addon.Fly_Item", addon.Flyaway)
			addon.Fly_Item:SetWidth(210)
			addon.Fly_Item:SetHeight(280)
			addon.Fly_Item:EnableMouse(true)
			addon.Fly_Item:EnableKeyboard(true)
			addon.Fly_Item:SetMovable(false)
			addon.Fly_Item:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -10)
			addon.Fly_Item:Hide()
--			Armor:
--				() All		() None
--				() Cloth	() Leather
--				() Mail	() Plate
--
--				() Cloak	() Necklace
--				() Rings	() Trinkets 
--				() Shield
			local ARL_ArmorText = addon.Fly_Item:CreateFontString("ARL_ArmorText", "OVERLAY", "GameFontHighlight")
				ARL_ArmorText:SetText(L["Armor"] .. ":")
				ARL_ArmorText:SetPoint("TOPLEFT", addon.Fly_Item, "TOPLEFT", 5, -8)
				ARL_ArmorText:SetHeight(14)
				ARL_ArmorText:SetWidth(150)
				ARL_ArmorText:SetJustifyH("LEFT")
			local ARL_ArmorAllCB = CreateFrame("CheckButton", "ARL_ArmorAllCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorAllCB, addon.Fly_Item, L["ARMOR_ALL_DESC"], 19, 2, 1, 0)
				ARL_ArmorAllCBText:SetText(L["All"])
			local ARL_ArmorNoneCB = CreateFrame("CheckButton", "ARL_ArmorNoneCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorNoneCB, addon.Fly_Item, L["ARMOR_NONE_DESC"], 20, 2, 2, 0)
				ARL_ArmorNoneCBText:SetText(L["None"])
			local ARL_ArmorClothCB = CreateFrame("CheckButton", "ARL_ArmorClothCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorClothCB, addon.Fly_Item, L["CLOTH_DESC"], 21, 3, 1, 0)
				ARL_ArmorClothCBText:SetText(L["Cloth"])
			local ARL_ArmorLeatherCB = CreateFrame("CheckButton", "ARL_ArmorLeatherCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorLeatherCB, addon.Fly_Item, L["LEATHER_DESC"], 22, 3, 2, 0)
				ARL_ArmorLeatherCBText:SetText(L["Leather"])
			local ARL_ArmorMailCB = CreateFrame("CheckButton", "ARL_ArmorMailCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorMailCB, addon.Fly_Item, L["MAIL_DESC"], 23, 4, 1, 0)
				ARL_ArmorMailCBText:SetText(L["Mail"])
			local ARL_ArmorPlateCB = CreateFrame("CheckButton", "ARL_ArmorPlateCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorPlateCB, addon.Fly_Item, L["PLATE_DESC"], 24, 4, 2, 0)
				ARL_ArmorPlateCBText:SetText(L["Plate"])

			local ARL_ArmorCloakCB = CreateFrame("CheckButton", "ARL_ArmorCloakCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorCloakCB, addon.Fly_Item, L["CLOAK_DESC"], 64, 5, 1, 0)
				ARL_ArmorCloakCBText:SetText(L["Cloak"])
			local ARL_ArmorNecklaceCB = CreateFrame("CheckButton", "ARL_ArmorNecklaceCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorNecklaceCB, addon.Fly_Item, L["NECKLACE_DESC"], 65, 5, 2, 0)
				ARL_ArmorNecklaceCBText:SetText(L["Necklace"])
			local ARL_ArmorRingCB = CreateFrame("CheckButton", "ARL_ArmorRingCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorRingCB, addon.Fly_Item, L["RING_DESC"], 66, 6, 1, 0)
				ARL_ArmorRingCBText:SetText(L["Ring"])
			local ARL_ArmorTrinketCB = CreateFrame("CheckButton", "ARL_ArmorTrinketCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorTrinketCB, addon.Fly_Item, L["TRINKET_DESC"], 67, 6, 2, 0)
				ARL_ArmorTrinketCBText:SetText(L["Trinket"])
			local ARL_ArmorShieldCB = CreateFrame("CheckButton", "ARL_ArmorShieldCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_ArmorShieldCB, addon.Fly_Item, L["SHIELD_DESC"], 85, 7, 1, 0)
				ARL_ArmorShieldCBText:SetText(L["Shield"])
--			Weapon:
--				() All		() None
--				() 1H		() 2H
--				() Dagger	() Axe
--				() Mace	() Sword
--				() Polearm	() Thrown
--				() Bow	() Crossbow
--				() Staff
			local ARL_WeaponText = addon.Fly_Item:CreateFontString("ARL_WeaponText", "OVERLAY", "GameFontHighlight")
				ARL_WeaponText:SetText(L["Weapon"] .. ":")
				ARL_WeaponText:SetPoint("TOPLEFT", addon.Fly_Item, "TOPLEFT", 5, -133)
				ARL_WeaponText:SetHeight(14)
				ARL_WeaponText:SetWidth(150)
				ARL_WeaponText:SetJustifyH("LEFT")
			local ARL_WeaponAllCB = CreateFrame("CheckButton", "ARL_WeaponAllCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponAllCB, addon.Fly_Item, L["WEAPON_ALL_DESC"], 25, 9, 1, 0)
				ARL_WeaponAllCBText:SetText(L["All"])
			local ARL_WeaponNoneCB = CreateFrame("CheckButton", "ARL_WeaponNoneCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponNoneCB, addon.Fly_Item, L["WEAPON_NONE_DESC"], 26, 9, 2, 0)
				ARL_WeaponNoneCBText:SetText(L["None"])
			local ARL_Weapon1HCB = CreateFrame("CheckButton", "ARL_Weapon1HCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_Weapon1HCB, addon.Fly_Item, L["ONEHAND_DESC"], 27, 10, 1, 0)
				ARL_Weapon1HCBText:SetText(L["One Hand"])
			local ARL_Weapon2HCB = CreateFrame("CheckButton", "ARL_Weapon2HCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_Weapon2HCB, addon.Fly_Item, L["TWOHAND_DESC"], 28, 10, 2, 0)
				ARL_Weapon2HCBText:SetText(L["Two Hand"])
			local ARL_WeaponDaggerCB = CreateFrame("CheckButton", "ARL_WeaponDaggerCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponDaggerCB, addon.Fly_Item, L["DAGGER_DESC"], 29, 11, 1, 0)
				ARL_WeaponDaggerCBText:SetText(L["Dagger"])
			local ARL_WeaponAxeCB = CreateFrame("CheckButton", "ARL_WeaponAxeCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponAxeCB, addon.Fly_Item, L["AXE_DESC"], 30, 11, 2, 0)
				ARL_WeaponAxeCBText:SetText(L["Axe"])
			local ARL_WeaponMaceCB = CreateFrame("CheckButton", "ARL_WeaponMaceCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponMaceCB, addon.Fly_Item, L["MACE_DESC"], 31, 12, 1, 0)
				ARL_WeaponMaceCBText:SetText(L["Mace"])
			local ARL_WeaponSwordCB = CreateFrame("CheckButton", "ARL_WeaponSwordCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponSwordCB, addon.Fly_Item, L["SWORD_DESC"], 32, 12, 2, 0)
				ARL_WeaponSwordCBText:SetText(L["Sword"])
			local ARL_WeaponPolearmCB = CreateFrame("CheckButton", "ARL_WeaponPolearmCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponPolearmCB, addon.Fly_Item, L["POLEARM_DESC"], 33, 13, 1, 0)
				ARL_WeaponPolearmCBText:SetText(L["Polearm"])
			local ARL_WeaponFistCB = CreateFrame("CheckButton", "ARL_WeaponFistCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponFistCB, addon.Fly_Item, L["FIST_DESC"], 84, 13, 2, 0)
				ARL_WeaponFistCBText:SetText(L["Fist"])
			local ARL_WeaponStaffCB = CreateFrame("CheckButton", "ARL_WeaponStaffCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponStaffCB, addon.Fly_Item, L["STAFF_DESC"], 34, 14, 1, 0)
				ARL_WeaponStaffCBText:SetText(L["Staff"])
				-- Disabled for now...
				ARL_WeaponStaffCBText:SetText(addon:Grey(L["Staff"]))
				ARL_WeaponStaffCB:Disable()
			local ARL_WeaponWandCB = CreateFrame("CheckButton", "ARL_WeaponWandCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponWandCB, addon.Fly_Item, L["WAND_DESC"], 68, 14, 2, 0)
				ARL_WeaponWandCBText:SetText(L["Wand"])
			local ARL_WeaponThrownCB = CreateFrame("CheckButton", "ARL_WeaponThrownCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponThrownCB, addon.Fly_Item, L["THROWN_DESC"], 35, 15, 1, 0)
				ARL_WeaponThrownCBText:SetText(L["Thrown"])
			local ARL_WeaponBowCB = CreateFrame("CheckButton", "ARL_WeaponBowCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponBowCB, addon.Fly_Item, L["BOW_DESC"], 36, 15, 2, 0)
				ARL_WeaponBowCBText:SetText(L["Bow"])
				-- Disabled for now...
				ARL_WeaponBowCBText:SetText(addon:Grey(L["Bow"]))
				ARL_WeaponBowCB:Disable()
			local ARL_WeaponCrossbowCB = CreateFrame("CheckButton", "ARL_WeaponCrossbowCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponCrossbowCB, addon.Fly_Item, L["CROSSBOW_DESC"], 37, 16, 1, 0)
				ARL_WeaponCrossbowCBText:SetText(L["Crossbow"])
				-- Disabled for now...
				ARL_WeaponCrossbowCBText:SetText(addon:Grey(L["Crossbow"]))
				ARL_WeaponCrossbowCB:Disable()
			local ARL_WeaponAmmoCB = CreateFrame("CheckButton", "ARL_WeaponAmmoCB", addon.Fly_Item, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_WeaponAmmoCB, addon.Fly_Item, L["AMMO_DESC"], 38, 16, 2, 0)
				ARL_WeaponAmmoCBText:SetText(L["Ammo"])

		addon.Fly_Player= CreateFrame("Frame", "addon.Fly_Player", addon.Flyaway)
			addon.Fly_Player:SetWidth(112)
			addon.Fly_Player:SetHeight(280)
			addon.Fly_Player:EnableMouse(true)
			addon.Fly_Player:EnableKeyboard(true)
			addon.Fly_Player:SetMovable(false)
			addon.Fly_Player:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
			addon.Fly_Player:Hide()
--			() Tank	  () Melee DPS
--			() Healer	  () Caster DPS
			local ARL_PlayerTankCB = CreateFrame("CheckButton", "ARL_PlayerTankCB", addon.Fly_Player, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_PlayerTankCB, addon.Fly_Player, L["TANKS_DESC"], 41, 1, 1, 0)
				ARL_PlayerTankCBText:SetText(L["Tanks"])
			local ARL_PlayerMeleeCB = CreateFrame("CheckButton", "ARL_PlayerMeleeCB", addon.Fly_Player, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_PlayerMeleeCB, addon.Fly_Player, L["MELEE_DPS_DESC"], 42, 2, 1, 0)
				ARL_PlayerMeleeCBText:SetText(L["Melee DPS"])
			local ARL_PlayerHealerCB = CreateFrame("CheckButton", "ARL_PlayerHealerCB", addon.Fly_Player, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_PlayerHealerCB, addon.Fly_Player, L["HEALERS_DESC"], 43, 3, 1, 0)
				ARL_PlayerHealerCBText:SetText(L["Healers"])
			local ARL_PlayerCasterCB = CreateFrame("CheckButton", "ARL_PlayerCasterCB", addon.Fly_Player, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_PlayerCasterCB, addon.Fly_Player, L["CASTER_DPS_DESC"], 44, 4, 1, 0)
				ARL_PlayerCasterCBText:SetText(L["Caster DPS"])

		addon.Fly_Rep = CreateFrame("Frame", "addon.Fly_Rep", addon.Flyaway)
			addon.Fly_Rep:SetWidth(112)
			addon.Fly_Rep:SetHeight(280)
			addon.Fly_Rep:EnableMouse(true)
			addon.Fly_Rep:EnableKeyboard(true)
			addon.Fly_Rep:SetMovable(false)
			addon.Fly_Rep:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
			addon.Fly_Rep:Hide()

			ARL_RepOldWorldCB = addon:CreateExpCB("ARL_RepOldWorldCB", "Glues-WoW-Logo", 1)
			ARL_RepOldWorldCB:SetPoint("TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -10)
			ARL_RepOldWorldCB:SetScript("OnClick", function()
				addon.RepFilterSwitch(1)
			end)

			ARL_RepBCCB = addon:CreateExpCB("ARL_RepBCCB", "GLUES-WOW-BCLOGO", 1)
			ARL_RepBCCB:SetPoint("TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -60)
			ARL_RepBCCB:SetScript("OnClick", function()
				addon.RepFilterSwitch(2)
			end)

			ARL_RepLKCB = addon:CreateExpCB("ARL_RepLKCB", "wotlk_logo", 1)
			ARL_RepLKCB:SetPoint("TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -110)
			ARL_RepLKCB:SetScript("OnClick", function()
				addon.RepFilterSwitch(3)
			end)

			addon.Fly_Rep_OW= CreateFrame("Frame", "addon.Fly_Rep_OW", addon.Fly_Rep)
			addon.Fly_Rep_OW:SetWidth(150)
			addon.Fly_Rep_OW:SetHeight(280)
			addon.Fly_Rep_OW:EnableMouse(true)
			addon.Fly_Rep_OW:EnableKeyboard(true)
			addon.Fly_Rep_OW:SetMovable(false)
			addon.Fly_Rep_OW:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16)
			addon.Fly_Rep_OW:Hide()
--			() Argent Dawn
--			() Cenarion Circle
--			() Thorium Brotherhood
--			() Timbermaw Hold
--			() Zandalar Tribe
			local ARL_RepArgentDawnCB = CreateFrame("CheckButton", "ARL_RepArgentDawnCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepArgentDawnCB, addon.Fly_Rep_OW,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Argent Dawn"]), 45, 1, 1, 0)
				ARL_RepArgentDawnCBText:SetText(BFAC["Argent Dawn"])
				ARL_RepArgentDawnCBText:SetFont(narrowFont, 11)
			local ARL_RepCenarionCircleCB = CreateFrame("CheckButton", "ARL_RepCenarionCircleCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepCenarionCircleCB, addon.Fly_Rep_OW,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Cenarion Circle"]), 46, 2, 1, 0)
				ARL_RepCenarionCircleCBText:SetText(BFAC["Cenarion Circle"])
				ARL_RepCenarionCircleCBText:SetFont(narrowFont, 11)
			local ARL_RepThoriumCB = CreateFrame("CheckButton", "ARL_RepThoriumCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepThoriumCB, addon.Fly_Rep_OW,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Thorium Brotherhood"]), 47, 3, 1, 0)
				ARL_RepThoriumCBText:SetText(BFAC["Thorium Brotherhood"])
				ARL_RepThoriumCBText:SetFont(narrowFont, 11)
			local ARL_RepTimbermawCB = CreateFrame("CheckButton", "ARL_RepTimbermawCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepTimbermawCB, addon.Fly_Rep_OW,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Timbermaw Hold"]), 48, 4, 1, 0)
				ARL_RepTimbermawCBText:SetText(BFAC["Timbermaw Hold"])
				ARL_RepTimbermawCBText:SetFont(narrowFont, 11)
			local ARL_RepZandalarCB = CreateFrame("CheckButton", "ARL_RepZandalarCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepZandalarCB, addon.Fly_Rep_OW,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Zandalar Tribe"]), 49, 5, 1, 0)
				ARL_RepZandalarCBText:SetText(BFAC["Zandalar Tribe"])
				ARL_RepZandalarCBText:SetFont(narrowFont, 11)

			addon.Fly_Rep_BC= CreateFrame("Frame", "addon.Fly_Rep_BC", addon.Fly_Rep)
			addon.Fly_Rep_BC:SetWidth(150)
			addon.Fly_Rep_BC:SetHeight(280)
			addon.Fly_Rep_BC:EnableMouse(true)
			addon.Fly_Rep_BC:EnableKeyboard(true)
			addon.Fly_Rep_BC:SetMovable(false)
			addon.Fly_Rep_BC:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16)
			addon.Fly_Rep_BC:Hide()
--			() The Aldor
--			() Ashtongue Deathsworn
--			() Cenarion Expedition
--			() The Consortium
--			() Honor Hold / Thrallmar
--			() Keepers of Time
--			() Kurenai / The Mag'har
--			() Lower City
--			() The Scale of the Sands
--			() The Scryers
--			() The Sha'tar
--			() Shattered Sun Offensive
--			() Sporeggar
--			() The Violet Eye
			local ARL_RepAldorCB = CreateFrame("CheckButton", "ARL_RepAldorCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepAldorCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Aldor"]), 50, 1, 1, 0)
				ARL_RepAldorCBText:SetText(BFAC["The Aldor"])
				ARL_RepAldorCBText:SetFont(narrowFont, 11)
			local ARL_RepAshtongueCB = CreateFrame("CheckButton", "ARL_RepAshtongueCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepAshtongueCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Ashtongue Deathsworn"]), 51, 2, 1, 0)
				ARL_RepAshtongueCBText:SetText(BFAC["Ashtongue Deathsworn"])
				ARL_RepAshtongueCBText:SetFont(narrowFont, 11)
			local ARL_RepCenarionExpeditionCB = CreateFrame("CheckButton", "ARL_RepCenarionExpeditionCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepCenarionExpeditionCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Cenarion Expedition"]), 52, 3, 1, 0)
				ARL_RepCenarionExpeditionCBText:SetText(BFAC["Cenarion Expedition"])
				ARL_RepCenarionExpeditionCBText:SetFont(narrowFont, 11)
			local ARL_RepConsortiumCB = CreateFrame("CheckButton", "ARL_RepConsortiumCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepConsortiumCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Consortium"]), 53, 4, 1, 0)
				ARL_RepConsortiumCBText:SetText(BFAC["The Consortium"])
				ARL_RepConsortiumCBText:SetFont(narrowFont, 11)
			local ARL_RepHonorHoldCB = CreateFrame("CheckButton", "ARL_RepHonorHoldCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepHonorHoldCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], HonorHold_Thrallmar_FactionText), 54, 5, 1, 0)
				ARL_RepHonorHoldCBText:SetText(HonorHold_Thrallmar_FactionText)
				ARL_RepHonorHoldCBText:SetFont(narrowFont, 11)
			local ARL_RepKeepersOfTimeCB = CreateFrame("CheckButton", "ARL_RepKeepersOfTimeCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepKeepersOfTimeCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Keepers of Time"]), 55, 6, 1, 0)
				ARL_RepKeepersOfTimeCBText:SetText(BFAC["Keepers of Time"])
				ARL_RepKeepersOfTimeCBText:SetFont(narrowFont, 11)
			local ARL_RepKurenaiCB = CreateFrame("CheckButton", "ARL_RepKurenaiCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepKurenaiCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], Kurenai_Maghar_FactionText), 56, 7, 1, 0)
				ARL_RepKurenaiCBText:SetText(Kurenai_Maghar_FactionText)
				ARL_RepKurenaiCBText:SetFont(narrowFont, 11)
			local ARL_RepLowerCityCB = CreateFrame("CheckButton", "ARL_RepLowerCityCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepLowerCityCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Lower City"]), 57, 8, 1, 0)
				ARL_RepLowerCityCBText:SetText(BFAC["Lower City"])
				ARL_RepLowerCityCBText:SetFont(narrowFont, 11)
			local ARL_RepScaleSandsCB = CreateFrame("CheckButton", "ARL_RepScaleSandsCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepScaleSandsCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Scale of the Sands"]), 58, 9, 1, 0)
				ARL_RepScaleSandsCBText:SetText(BFAC["The Scale of the Sands"])
				ARL_RepScaleSandsCBText:SetFont(narrowFont, 11)
			local ARL_RepScryersCB = CreateFrame("CheckButton", "ARL_RepScryersCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepScryersCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Scryers"]), 59, 10, 1, 0)
				ARL_RepScryersCBText:SetText(BFAC["The Scryers"])
				ARL_RepScryersCBText:SetFont(narrowFont, 11)
			local ARL_RepShatarCB = CreateFrame("CheckButton", "ARL_RepShatarCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepShatarCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sha'tar"]), 60, 11, 1, 0)
				ARL_RepShatarCBText:SetText(BFAC["The Sha'tar"])
				ARL_RepShatarCBText:SetFont(narrowFont, 11)
			local ARL_RepShatteredSunCB = CreateFrame("CheckButton", "ARL_RepShatteredSunCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepShatteredSunCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Shattered Sun Offensive"]), 61, 12, 1, 0)
				ARL_RepShatteredSunCBText:SetText(BFAC["Shattered Sun Offensive"])
				ARL_RepShatteredSunCBText:SetFont(narrowFont, 11)
			local ARL_RepSporeggarCB = CreateFrame("CheckButton", "ARL_RepSporeggarCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepSporeggarCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Sporeggar"]), 62, 13, 1, 0)
				ARL_RepSporeggarCBText:SetText(BFAC["Sporeggar"])
				ARL_RepSporeggarCBText:SetFont(narrowFont, 11)
			local ARL_RepVioletEyeCB = CreateFrame("CheckButton", "ARL_RepVioletEyeCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepVioletEyeCB, addon.Fly_Rep_BC,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Violet Eye"]), 63, 14, 1, 0)
				ARL_RepVioletEyeCBText:SetText(BFAC["The Violet Eye"])
				ARL_RepVioletEyeCBText:SetFont(narrowFont, 11)

			-- Everything below here is WotLK stuff. May need to be changed after beta.
			addon.Fly_Rep_LK= CreateFrame("Frame", "addon.Fly_Rep_LK", addon.Fly_Rep)
			addon.Fly_Rep_LK:SetWidth(150)
			addon.Fly_Rep_LK:SetHeight(280)
			addon.Fly_Rep_LK:EnableMouse(true)
			addon.Fly_Rep_LK:EnableKeyboard(true)
			addon.Fly_Rep_LK:SetMovable(false)
			addon.Fly_Rep_LK:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16)
			addon.Fly_Rep_LK:Hide()
--			() Argent Crusade
--			() Frenzyheart Tribe
--			() Knights of the Ebon Blade
--			() Kirin Tor
--			() The Sons of Hodir
--			() The Kalu'ak
--			() The Oracles
--			() The Wyrmrest Accord
--			() The Silver Covenant
--			() The Sunreavers
--			() Explorer's League
--			() Valiance Expedition
--			() The Hand of Vengeance
--			() The Taunka
--			() Warsong Offensive
--			() Alliance Vanguard
--			() Horde Expedition
			local ARL_RepArgentCrusadeCB = CreateFrame("CheckButton", "ARL_RepArgentCrusadeCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepArgentCrusadeCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Argent Crusade"]), 69, 1, 1, 0)
				ARL_RepArgentCrusadeCBText:SetText(BFAC["Argent Crusade"])
				ARL_RepArgentCrusadeCBText:SetFont(narrowFont, 11)
			local ARL_RepFrenzyheartCB = CreateFrame("CheckButton", "ARL_RepFrenzyheartCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepFrenzyheartCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Frenzyheart Tribe"]), 70, 2, 1, 0)
				ARL_RepFrenzyheartCBText:SetText(BFAC["Frenzyheart Tribe"])
				ARL_RepFrenzyheartCBText:SetFont(narrowFont, 11)
			local ARL_RepEbonBladeCB = CreateFrame("CheckButton", "ARL_RepEbonBladeCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepEbonBladeCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Knights of the Ebon Blade"]), 71, 3, 1, 0)
				ARL_RepEbonBladeCBText:SetText(BFAC["Knights of the Ebon Blade"])
				ARL_RepEbonBladeCBText:SetFont(narrowFont, 11)
			local ARL_RepKirinTorCB = CreateFrame("CheckButton", "ARL_RepKirinTorCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepKirinTorCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Kirin Tor"]), 72, 4, 1, 0)
				ARL_RepKirinTorCBText:SetText(BFAC["Kirin Tor"])
				ARL_RepKirinTorCBText:SetFont(narrowFont, 11)
			local ARL_RepSonsOfHodirCB = CreateFrame("CheckButton", "ARL_RepSonsOfHodirCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepSonsOfHodirCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sons of Hodir"]), 73, 5, 1, 0)
				ARL_RepSonsOfHodirCBText:SetText(BFAC["The Sons of Hodir"])
				ARL_RepSonsOfHodirCBText:SetFont(narrowFont, 11)
			local ARL_RepKaluakCB = CreateFrame("CheckButton", "ARL_RepKaluakCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepKaluakCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Kalu'ak"]), 74, 6, 1, 0)
				ARL_RepKaluakCBText:SetText(BFAC["The Kalu'ak"])
				ARL_RepKaluakCBText:SetFont(narrowFont, 11)
			local ARL_RepOraclesCB = CreateFrame("CheckButton", "ARL_RepOraclesCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepOraclesCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Oracles"]), 75, 7, 1, 0)
				ARL_RepOraclesCBText:SetText(BFAC["The Oracles"])
				ARL_RepOraclesCBText:SetFont(narrowFont, 11)
			local ARL_RepWyrmrestCB = CreateFrame("CheckButton", "ARL_RepWyrmrestCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepWyrmrestCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Wyrmrest Accord"]), 76, 8, 1, 0)
				ARL_RepWyrmrestCBText:SetText(BFAC["The Wyrmrest Accord"])
				ARL_RepWyrmrestCBText:SetFont(narrowFont, 11)
			local ARL_RepSilverCovenantCB = CreateFrame("CheckButton", "ARL_RepSilverCovenantCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepSilverCovenantCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Silver Covenant"]), 77, 9, 1, 0)
				ARL_RepSilverCovenantCBText:SetText(BFAC["The Silver Covenant"])
				ARL_RepSilverCovenantCBText:SetFont(narrowFont, 11)
			local ARL_RepSunreaversCB = CreateFrame("CheckButton", "ARL_RepSunreaversCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepSunreaversCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sunreavers"]), 78, 10, 1, 0)
				ARL_RepSunreaversCBText:SetText(BFAC["The Sunreavers"])
				ARL_RepSunreaversCBText:SetFont(narrowFont, 11)
			local ARL_RepExplorersLeagueCB = CreateFrame("CheckButton", "ARL_RepExplorersLeagueCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepExplorersLeagueCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Explorers' League"]), 79, 11, 1, 0)
				ARL_RepExplorersLeagueCBText:SetText(BFAC["Explorers' League"])
				ARL_RepExplorersLeagueCBText:SetFont(narrowFont, 11)
			local ARL_RepValianceCB = CreateFrame("CheckButton", "ARL_RepValianceCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepValianceCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Valiance Expedition"]), 80, 12, 1, 0)
				ARL_RepValianceCBText:SetText(BFAC["Valiance Expedition"])
				ARL_RepValianceCBText:SetFont(narrowFont, 11)
			local ARL_RepHandOfVengeanceCB = CreateFrame("CheckButton", "ARL_RepHandOfVengeanceCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepHandOfVengeanceCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Hand of Vengeance"]), 81, 13, 1, 0)
				ARL_RepHandOfVengeanceCBText:SetText(BFAC["The Hand of Vengeance"])
				ARL_RepHandOfVengeanceCBText:SetFont(narrowFont, 11)
			local ARL_RepTaunkaCB = CreateFrame("CheckButton", "ARL_RepTaunkaCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepTaunkaCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["The Taunka"]), 82, 14, 1, 0)
				ARL_RepTaunkaCBText:SetText(BFAC["The Taunka"])
				ARL_RepTaunkaCBText:SetFont(narrowFont, 11)
			local ARL_RepWarsongOffensiveCB = CreateFrame("CheckButton", "ARL_RepWarsongOffensiveCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepWarsongOffensiveCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Warsong Offensive"]), 83, 15, 1, 0)
				ARL_RepWarsongOffensiveCBText:SetText(BFAC["Warsong Offensive"])
				ARL_RepWarsongOffensiveCBText:SetFont(narrowFont, 11)
			local ARL_RepAllianceVanguardCB = CreateFrame("CheckButton", "ARL_RepAllianceVanguardCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepAllianceVanguardCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Alliance Vanguard"]), 86, 16, 1, 0)
				ARL_RepAllianceVanguardCBText:SetText(BFAC["Alliance Vanguard"])
				ARL_RepAllianceVanguardCBText:SetFont(narrowFont, 11)
			local ARL_RepHordeExpeditionCB = CreateFrame("CheckButton", "ARL_RepHordeExpeditionCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
				addon:GenericMakeCB(ARL_RepHordeExpeditionCB, addon.Fly_Rep_LK,
					sformat(L["SPECIFIC_REP_DESC"], BFAC["Horde Expedition"]), 87, 17, 1, 0)
				ARL_RepHordeExpeditionCBText:SetText(BFAC["Horde Expedition"])
				ARL_RepHordeExpeditionCBText:SetFont(narrowFont, 11)

		-- Now that everything exists, populate the global filter table
		local filterdb = addon.db.profile.filters

		FilterValueMap = {
		-- General Options
			[1]  = { cb = ARL_ClassCB,					svroot = filterdb.general,		svval = "class" },
			[2]  = { cb = ARL_SpecialtyCB,				svroot = filterdb.general,		svval = "specialty" },
			[3]  = { cb = ARL_LevelCB,					svroot = filterdb.general,		svval = "skill" },
			[4]  = { cb = ARL_FactionCB,				svroot = filterdb.general,		svval = "faction" },
			[5]  = { cb = ARL_KnownCB,					svroot = filterdb.general,		svval = "known" },
			[6]  = { cb = ARL_UnknownCB,				svroot = filterdb.general,		svval = "unknown" },
		-- Obtain Options
			[7]  = { cb = ARL_InstanceCB,				svroot = filterdb.obtain,		svval = "instance" },
			[8]  = { cb = ARL_RaidCB,					svroot = filterdb.obtain,		svval = "raid" },
			[9]  = { cb = ARL_QuestCB,					svroot = filterdb.obtain,		svval = "quest" },
			[10] = { cb = ARL_SeasonalCB,				svroot = filterdb.obtain,		svval = "seasonal" },
			[11] = { cb = ARL_TrainerCB,				svroot = filterdb.obtain,		svval = "trainer" },
			[12] = { cb = ARL_VendorCB,					svroot = filterdb.obtain,		svval = "vendor" },
			[13] = { cb = ARL_PVPCB,					svroot = filterdb.obtain,		svval = "pvp" },
			[14] = { cb = ARL_DiscoveryCB,				svroot = filterdb.obtain,		svval = "discovery" },
			[39] = { cb = ARL_WorldDropCB,				svroot = filterdb.obtain,		svval = "worlddrop" },
			[40] = { cb = ARL_MobDropCB,				svroot = filterdb.obtain,		svval = "mobdrop" },
		-- Binding Options
			[15] = { cb = ARL_iBoECB,					svroot = filterdb.binding,		svval = "itemboe" },
			[16] = { cb = ARL_iBoPCB,					svroot = filterdb.binding,		svval = "itembop" },
			[17] = { cb = ARL_rBoECB,					svroot = filterdb.binding,		svval = "recipeboe" },
			[18] = { cb = ARL_rBoPCB,					svroot = filterdb.binding,		svval = "recipebop" },
		-- Armor Options
			[19] = { cb = ARL_ArmorAllCB,				svroot = "special case",		svval = "" },
			[20] = { cb = ARL_ArmorNoneCB,				svroot = "special case",		svval = "" },
			[21] = { cb = ARL_ArmorClothCB,				svroot = filterdb.item.armor,	svval = "cloth" },
			[22] = { cb = ARL_ArmorLeatherCB,			svroot = filterdb.item.armor,	svval = "leather" },
			[23] = { cb = ARL_ArmorMailCB,				svroot = filterdb.item.armor,	svval = "mail" },
			[24] = { cb = ARL_ArmorPlateCB,				svroot = filterdb.item.armor,	svval = "plate" },
			[64] = { cb = ARL_ArmorCloakCB,				svroot = filterdb.item.armor,	svval = "cloak" },
			[65] = { cb = ARL_ArmorNecklaceCB,			svroot = filterdb.item.armor,	svval = "necklace" },
			[66] = { cb = ARL_ArmorRingCB,				svroot = filterdb.item.armor,	svval = "ring" },
			[67] = { cb = ARL_ArmorTrinketCB,			svroot = filterdb.item.armor,	svval = "trinket" },
			[85] = { cb = ARL_ArmorShieldCB,			svroot = filterdb.item.armor,	svval = "shield" },
		-- Weapon Options
			[25] = { cb = ARL_WeaponAllCB,				svroot = "special case",		svval = "" },
			[26] = { cb = ARL_WeaponNoneCB,				svroot = "special case",		svval = "" },
			[27] = { cb = ARL_Weapon1HCB,				svroot = filterdb.item.weapon,	svval = "onehand" },
			[28] = { cb = ARL_Weapon2HCB,				svroot = filterdb.item.weapon,	svval = "twohand" },
			[29] = { cb = ARL_WeaponDaggerCB,			svroot = filterdb.item.weapon,	svval = "dagger" },
			[30] = { cb = ARL_WeaponAxeCB,				svroot = filterdb.item.weapon,	svval = "axe" },
			[31] = { cb = ARL_WeaponMaceCB,				svroot = filterdb.item.weapon,	svval = "mace" },
			[32] = { cb = ARL_WeaponSwordCB,			svroot = filterdb.item.weapon,	svval = "sword" },
			[33] = { cb = ARL_WeaponPolearmCB,			svroot = filterdb.item.weapon,	svval = "polearm" },
			[84] = { cb = ARL_WeaponFistCB,				svroot = filterdb.item.weapon,	svval = "fist" },
			[34] = { cb = ARL_WeaponStaffCB,			svroot = "disabled",			svval = "" },
			[68] = { cb = ARL_WeaponWandCB,				svroot = filterdb.item.weapon,	svval = "wand" },
			[35] = { cb = ARL_WeaponThrownCB,			svroot = filterdb.item.weapon,	svval = "thrown" },
			[36] = { cb = ARL_WeaponBowCB,				svroot = "disabled",			svval = "" },
			[37] = { cb = ARL_WeaponCrossbowCB,			svroot = "disabled",			svval = "" },
			[38] = { cb = ARL_WeaponAmmoCB,				svroot = filterdb.item.weapon,	svval = "ammo" },
		-- Player Type Options
			[41] = { cb = ARL_PlayerTankCB,				svroot = filterdb.player,		svval = "tank" },
			[42] = { cb = ARL_PlayerMeleeCB,			svroot = filterdb.player,		svval = "melee" },
			[43] = { cb = ARL_PlayerHealerCB,			svroot = filterdb.player,		svval = "healer" },
			[44] = { cb = ARL_PlayerCasterCB,			svroot = filterdb.player,		svval = "caster" },
		-- Old World Rep Options
			[45] = { cb = ARL_RepArgentDawnCB,			svroot = filterdb.rep,			svval = "argentdawn" },
			[46] = { cb = ARL_RepCenarionCircleCB,		svroot = filterdb.rep,			svval = "cenarioncircle" },
			[47] = { cb = ARL_RepThoriumCB,				svroot = filterdb.rep,			svval = "thoriumbrotherhood" },
			[48] = { cb = ARL_RepTimbermawCB,			svroot = filterdb.rep,			svval = "timbermaw" },
			[49] = { cb = ARL_RepZandalarCB,			svroot = filterdb.rep,			svval = "zandalar" },
		-- BC Rep Options
			[50] = { cb = ARL_RepAldorCB,				svroot = filterdb.rep,			svval = "aldor" },
			[51] = { cb = ARL_RepAshtongueCB,			svroot = filterdb.rep,			svval = "ashtonguedeathsworn" },
			[52] = { cb = ARL_RepCenarionExpeditionCB,	svroot = filterdb.rep,			svval = "cenarionexpedition" },
			[53] = { cb = ARL_RepConsortiumCB,			svroot = filterdb.rep,			svval = "consortium" },
			[54] = { cb = ARL_RepHonorHoldCB,			svroot = filterdb.rep,			svval = "hellfire" },
			[55] = { cb = ARL_RepKeepersOfTimeCB,		svroot = filterdb.rep,			svval = "keepersoftime" },
			[56] = { cb = ARL_RepKurenaiCB,				svroot = filterdb.rep,			svval = "nagrand" },
			[57] = { cb = ARL_RepLowerCityCB,			svroot = filterdb.rep,			svval = "lowercity" },
			[58] = { cb = ARL_RepScaleSandsCB,			svroot = filterdb.rep,			svval = "scaleofthesands" },
			[59] = { cb = ARL_RepScryersCB,				svroot = filterdb.rep,			svval = "scryer" },
			[60] = { cb = ARL_RepShatarCB,				svroot = filterdb.rep,			svval = "shatar" },
			[61] = { cb = ARL_RepShatteredSunCB,		svroot = filterdb.rep,			svval = "shatteredsun" },
			[62] = { cb = ARL_RepSporeggarCB,			svroot = filterdb.rep,			svval = "sporeggar" },
			[63] = { cb = ARL_RepVioletEyeCB,			svroot = filterdb.rep,			svval = "violeteye" },
		-- LK Rep Options (may need to be changed after beta.
			[69] = { cb = ARL_RepArgentCrusadeCB,		svroot = filterdb.rep,			svval = "argentcrusade" },
			[70] = { cb = ARL_RepFrenzyheartCB,			svroot = filterdb.rep,			svval = "frenzyheart" },
			[71] = { cb = ARL_RepEbonBladeCB,			svroot = filterdb.rep,			svval = "ebonblade" },
			[72] = { cb = ARL_RepKirinTorCB,			svroot = filterdb.rep,			svval = "kirintor" },
			[73] = { cb = ARL_RepSonsOfHodirCB,			svroot = filterdb.rep,			svval = "sonsofhodir" },
			[74] = { cb = ARL_RepKaluakCB,				svroot = filterdb.rep,			svval = "kaluak" },
			[75] = { cb = ARL_RepOraclesCB,				svroot = filterdb.rep,			svval = "oracles" },
			[76] = { cb = ARL_RepWyrmrestCB,			svroot = filterdb.rep,			svval = "wyrmrest" },
			[77] = { cb = ARL_RepSilverCovenantCB,		svroot = filterdb.rep,			svval = "silvercovenant" },
			[78] = { cb = ARL_RepSunreaversCB,			svroot = filterdb.rep,			svval = "sunreavers" },
			[79] = { cb = ARL_RepExplorersLeagueCB,		svroot = filterdb.rep,			svval = "explorersleague" },
			[80] = { cb = ARL_RepValianceCB,			svroot = filterdb.rep,			svval = "valiance" },
			[81] = { cb = ARL_RepHandOfVengeanceCB,		svroot = filterdb.rep,			svval = "handofvengeance" },
			[82] = { cb = ARL_RepTaunkaCB,				svroot = filterdb.rep,			svval = "taunka" },
			[83] = { cb = ARL_RepWarsongOffensiveCB,	svroot = filterdb.rep,			svval = "warsongoffensive" },
			[86] = { cb = ARL_RepAllianceVanguardCB,	svroot = filterdb.rep,			svval = "alliancevanguard" },
			[87] = { cb = ARL_RepHordeExpeditionCB,		svroot = filterdb.rep,			svval = "hordeexpedition" },
		}

	end

	-- Initialize dropdown
	ARL_DD_Sort.initialize = ARL_DD_Sort_Initialize

	-- reset the scale
	addon.Frame:SetScale(addon.db.profile.frameopts.uiscale)
	arlTooltip:SetScale(addon.db.profile.frameopts.tooltipscale)
	arlTooltip2:SetScale(addon.db.profile.frameopts.tooltipscale)

	-- We'll be in "ExpandAll" mode to start with. Make sure the button knows that:
	ARL_ExpandButton:SetText(L["EXPANDALL"])
	addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

	-- Reset our addon title text
	addon.resetTitle()

	-- Set the texture on our switcher button correctly
	SetSwitcherTexture(SortedProfessions[currentProfIndex].texture)

	-- Take our sorted list, and fill up DisplayStrings
	initDisplayStrings()

	-- Update our progressbar
	SetProgressBar(cPlayer)

	-- And update our scrollframe
	RecipeList_Update()
	addon.Frame:Show()
	
	-- Make sure our apply button gets disabled
	ApplyFilterState = nil
	ARL_ApplyButton:SetNormalFontObject("GameFontDisableSmall")
	ARL_ApplyButton:Disable()
	
	-- Make sure to reset search gui elements
	ARL_LastSearchedText = ""
	ARL_SearchText:SetText(L["SEARCH_BOX_DESC"])

end


-- Description: Creates a new frame with the contents of a text dump so you can copy and paste
-- Expected result: New frame with all recipes listed and acquire info
-- Input: A text string of what to paste
-- Output: None
-- Creates a frame where you can copy and paste contents from.  Adds the textdump text into that frame.
-- Code stolen from Antiarc and Chatter

function addon:DisplayTextDump(RecipeDB, profession, text)

	local textdump

	-- If we don't send in a RecipeDB and profession, just dump the text
	if (not RecipeDB and profession) then
		textdump = text
	else
		textdump = self:GetTextDump(RecipeDB,profession)
	end

	local PaneBackdrop  = {
		bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 3, right = 3, top = 5, bottom = 3 }
	}

	-- If we haven't created these frames, then lets do so now.
	if (not addon.ARLCopyFrame) then
		addon.ARLCopyFrame = CreateFrame("Frame", "ARLCopyFrame", UIParent)
		tinsert(UISpecialFrames, "ARLCopyFrame")
		addon.ARLCopyFrame:SetBackdrop(PaneBackdrop)
		addon.ARLCopyFrame:SetBackdropColor(0,0,0,1)
		addon.ARLCopyFrame:SetWidth(750)
		addon.ARLCopyFrame:SetHeight(400)
		addon.ARLCopyFrame:SetPoint("CENTER", UIParent, "CENTER")
		addon.ARLCopyFrame:SetFrameStrata("DIALOG")
		
		local scrollArea = CreateFrame("ScrollFrame", "ARLCopyScroll", addon.ARLCopyFrame, "UIPanelScrollFrameTemplate")
		scrollArea:SetPoint("TOPLEFT", addon.ARLCopyFrame, "TOPLEFT", 8, -30)
		scrollArea:SetPoint("BOTTOMRIGHT", addon.ARLCopyFrame, "BOTTOMRIGHT", -30, 8)
		
		addon.ARLCopyFrame.editBox = CreateFrame("EditBox", "ARLCopyEdit", addon.ARLCopyFrame)
		addon.ARLCopyFrame.editBox:SetMultiLine(true)
		addon.ARLCopyFrame.editBox:SetMaxLetters(99999)
		addon.ARLCopyFrame.editBox:EnableMouse(true)
		addon.ARLCopyFrame.editBox:SetAutoFocus(false)
		addon.ARLCopyFrame.editBox:SetFontObject(ChatFontNormal)
		addon.ARLCopyFrame.editBox:SetWidth(650)
		addon.ARLCopyFrame.editBox:SetHeight(270)
		addon.ARLCopyFrame.editBox:SetScript("OnEscapePressed", function() addon.ARLCopyFrame:Hide() end)
		addon.ARLCopyFrame.editBox:SetText(textdump)
		addon.ARLCopyFrame.editBox:HighlightText(0)
		
		scrollArea:SetScrollChild(addon.ARLCopyFrame.editBox)
		
		local close = CreateFrame("Button", nil, addon.ARLCopyFrame, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT",addon.ARLCopyFrame,"TOPRIGHT")
		
		addon.ARLCopyFrame:Show()
	else
		addon.ARLCopyFrame.editBox:SetText(textdump)
		addon.ARLCopyFrame:Show()
	end

end
