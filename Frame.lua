--[[
************************************************************************
Frame.lua
************************************************************************
File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
**AckisRecipeList** provides an interface for scanning professions for missing recipes.
There are a set of functions which allow you make use of the ARL database outside of ARL.
ARL supports all professions currently in World of Warcraft 3.3.2
@class file
@name Frame.lua
************************************************************************
]]--

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string
local sformat = string.format
local strlower = string.lower
local smatch = string.match

local select = _G.select
local type = _G.type

local table = _G.table
local twipe = table.wipe

local ipairs, pairs = _G.ipairs, _G.pairs

local math = _G.math
local floor = math.floor

local tonumber = _G.tonumber
local tostring = _G.tostring

-------------------------------------------------------------------------------
-- Localized Blizzard API.
-------------------------------------------------------------------------------
local GetItemQualityColor = _G.GetItemQualityColor

-- GLOBALS: CreateFrame, GameTooltip, UIParent

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local LibStub = LibStub

local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local QTip	= LibStub("LibQTip-1.0")

-- Set up the private intra-file namespace.
local private	= select(2, ...)

local Player	= private.Player

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local ORDERED_PROFESSIONS = private.ordered_professions

-- To make tabbing between professions easier
local PROFESSION_TEXTURES = {
	"alchemy",	-- 1
	"blacksmith",	-- 2
	"cooking",	-- 3
	"enchant",	-- 4
	"engineer",	-- 5
	"firstaid",	-- 6
	"inscribe",	-- 7
	"jewel",	-- 8
	"leather",	-- 9
	"runeforge",	-- 10
	"smelting",	-- 11
	"tailor",	-- 12
}

local CATEGORY_TEXT = {
	["general"]	= _G.GENERAL,
	["obtain"]	= L["Obtain"],
	["binding"]	= L["Binding"],
	["item"]	= L["Item"],
	["quality"]	= _G.QUALITY,
	["player"]	= _G.ROLE,
	["rep"]		= _G.REPUTATION,
	["misc"]	= _G.MISCELLANEOUS
}

local MAINPANEL_NORMAL_WIDTH	= 293
local MAINPANEL_EXPANDED_WIDTH	= 444

local FILTERMENU_SINGLE_WIDTH	= 136
local FILTERMENU_DOUBLE_WIDTH	= 300
local FILTERMENU_HEIGHT		= 312

local FILTERMENU_SMALL		= 112
local FILTERMENU_LARGE		= 210

local FACTION_HORDE		= BFAC["Horde"]
local FACTION_ALLIANCE		= BFAC["Alliance"]
local FACTION_NEUTRAL		= BFAC["Neutral"]

local CATEGORY_COLORS		= private.category_colors
local BASIC_COLORS		= private.basic_colors

local SF = private.recipe_state_flags

local VIEW_TABS = {
	["Acquisition"] = 1,
	["Location"]	= 2,
	["Name"]	= 3,
}

local TAB_NAMES = {
	"Acquisition",
	"Location",
	"Name",
}

-------------------------------------------------------------------------------
-- Acquire flag constants.
-------------------------------------------------------------------------------
local A = private.acquire_types
local A_MAX = 9

-------------------------------------------------------------------------------
-- Filter flag constants.
-------------------------------------------------------------------------------
local COMMON1 = private.common_flags_word1

local BINDING_FLAGS = {
	[COMMON1.IBOE] = L["BOEFilter"],
	[COMMON1.IBOP] = L["BOPFilter"],
	[COMMON1.IBOA] = L["BOAFilter"],
	[COMMON1.RBOE] = L["RecipeBOEFilter"],
	[COMMON1.RBOP] = L["RecipeBOPFilter"],
	[COMMON1.RBOA] = L["RecipeBOAFilter"]
}

-------------------------------------------------------------------------------
-- Define the static popups we're going to call when people haven't scanned or
-- when current filters are blocking all recipes from being displayed.
-------------------------------------------------------------------------------
StaticPopupDialogs["ARL_NOTSCANNED"] = {
	text = L["NOTSCANNED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLFILTERED"] = {
	text = L["ALL_FILTERED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLKNOWN"] = {
	text = L["ARL_ALLKNOWN"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLEXCLUDED"] = {
	text = L["ARL_ALLEXCLUDED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_SEARCHFILTERED"] = {
	text = L["ARL_SEARCHFILTERED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

-------------------------------------------------------------------------------
-- Variables
-------------------------------------------------------------------------------
local FilterValueMap		-- Assigned in addon:InitializeFrame()

-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local ListFrame

-------------------------------------------------------------------------------
-- Table cache mechanism
-------------------------------------------------------------------------------
local AcquireTable, ReleaseTable
do
	local table_cache = {}

	-- Returns a table
	function AcquireTable()
		local tbl = table.remove(table_cache) or {}
		return tbl
	end

	-- Cleans the table and stores it in the cache
	function ReleaseTable(tbl)
		if not tbl then return end
		twipe(tbl)
		table.insert(table_cache, tbl)
	end
end	-- do block

-------------------------------------------------------------------------------
-- Close all possible pop-up windows
-------------------------------------------------------------------------------
function addon:ClosePopups()
	_G.StaticPopup_Hide("ARL_NOTSCANNED")
	_G.StaticPopup_Hide("ARL_ALLFILTERED")
	_G.StaticPopup_Hide("ARL_ALLKNOWN")
	_G.StaticPopup_Hide("ARL_ALLEXCLUDED")
	_G.StaticPopup_Hide("ARL_SEARCHFILTERED")
end

-------------------------------------------------------------------------------
-- Common to many functions throughout the file.
-------------------------------------------------------------------------------
local function SetTextColor(color_code, text)
	return string.format("|cff%s%s|r", color_code or "ffffff", text)
end

-------------------------------------------------------------------------------
-- Sets show and hide scripts as well as text for a tooltip for the given frame.
-------------------------------------------------------------------------------
local SetTooltipScripts
do
	local HIGHLIGHT_FONT_COLOR = _G.HIGHLIGHT_FONT_COLOR

	local function Show_Tooltip(frame, motion)
		GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
		GameTooltip:SetText(frame.tooltip_text, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
		GameTooltip:Show()
	end

	local function Hide_Tooltip()
		GameTooltip:Hide()
	end

	function SetTooltipScripts(frame, textLabel)
		frame.tooltip_text = textLabel

		frame:SetScript("OnEnter", Show_Tooltip)
		frame:SetScript("OnLeave", Hide_Tooltip)
	end
end	-- do

-------------------------------------------------------------------------------
-- Generic function for creating buttons.
-------------------------------------------------------------------------------
local GenericCreateButton
do
	-- I hate stretchy buttons. Thanks very much to ckknight for this code
	-- (found in RockConfig)

	-- when pressed, the button should look pressed
	local function button_OnMouseDown(this)
		if this:IsEnabled() then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
		end
	end

	-- when depressed, return to normal
	local function button_OnMouseUp(this)
		if this:IsEnabled() then
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

	function GenericCreateButton(bName, parentFrame, bHeight, bWidth, bNormFont, bHighFont, initText, tAlign, tooltipText, noTextures)
		local button = CreateFrame("Button", bName, parentFrame)

		button:SetWidth(bWidth)
		button:SetHeight(bHeight)

		if noTextures == 1 then
			local left = button:CreateTexture(nil, "BACKGROUND")
			button.left = left
			left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])

			local middle = button:CreateTexture(nil, "BACKGROUND")
			button.middle = middle
			middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])

			local right = button:CreateTexture(nil, "BACKGROUND")
			button.right = right
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

			button.__Enable = button.Enable
			button.__Disable = button.Disable
			button.Enable = button_Enable
			button.Disable = button_Disable

			local highlight = button:CreateTexture(nil, "OVERLAY", "UIPanelButtonHighlightTexture")
			button:SetHighlightTexture(highlight)
		elseif noTextures == 2 then
			button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
			button:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
			button:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
			button:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
		elseif noTextures == 3 then
			button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			button:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
			button:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
		end

		local text = button:CreateFontString(nil, "ARTWORK")
		button:SetFontString(text)
		button.text = text
		text:SetPoint("LEFT", button, "LEFT", 7, 0)
		text:SetPoint("RIGHT", button, "RIGHT", -7, 0)
		text:SetJustifyH(tAlign)

		text:SetFontObject(bNormFont)
		text:SetText(initText)

		if tooltipText and tooltipText ~= "" then
			SetTooltipScripts(button, tooltipText)
		end
		return button
	end
end	-- do

-------------------------------------------------------------------------------
-- Sort functions
-------------------------------------------------------------------------------
local SortRecipeList
local SortLocationList
local SortAcquireList
do
	local recipe_list = private.recipe_list
	local location_list = private.location_list
	local acquire_list = private.acquire_list

	addon.sorted_recipes = {}
	addon.sorted_locations = {}
	addon.sorted_acquires = {}

	local function Sort_SkillAsc(a, b)
		local reca, recb = recipe_list[a], recipe_list[b]

		if reca.skill_level == recb.skill_level then
			return reca.name < recb.name
		else
			return reca.skill_level < recb.skill_level
		end
	end

	local function Sort_SkillDesc(a, b)
		local reca, recb = recipe_list[a], recipe_list[b]

		if reca.skill_level == recb.skill_level then
			return reca.name < recb.name
		else
			return recb.skill_level < reca.skill_level
		end
	end

	local function Sort_NameAsc(a, b)
		return recipe_list[a].name < recipe_list[b].name
	end

	local function Sort_NameDesc(a, b)
		return recipe_list[a].name > recipe_list[b].name
	end

	local RECIPE_SORT_FUNCS = {
		["SkillAscending"]	= Sort_SkillAsc,
		["SkillDescending"]	= Sort_SkillDesc,
		["NameAscending"]	= Sort_NameAsc,
		["NameDescending"]	= Sort_NameDesc,
	}

	-- Sorts the recipe_list according to configuration settings.
	function SortRecipeList(recipe_list, sorted_recipes)
		local sort_type = addon.db.profile.sorting
		local skill_view = addon.db.profile.skill_view

		local sort_func = RECIPE_SORT_FUNCS[(skill_view and "Skill" or "Name")..sort_type] or Sort_NameAsc

		twipe(sorted_recipes)

		for n, v in pairs(recipe_list) do
			table.insert(sorted_recipes, n)
		end
		table.sort(sorted_recipes, sort_func)
	end

	local function Sort_Location(a, b)
		local loc_a = location_list[a]
		local loc_b = location_list[b]

		return loc_a.name < loc_b.name
	end

	-- Sorts the location_list by name.
	function SortLocationList()
		local sorted_locations = addon.sorted_locations
		twipe(sorted_locations)

		for loc_name in pairs(private.location_list) do
			table.insert(sorted_locations, loc_name)
		end
		table.sort(sorted_locations, Sort_Location)
	end

	local function Sort_Acquisition(a, b)
		local acquire_a = acquire_list[a]
		local acquire_b = acquire_list[b]

		return acquire_a.name < acquire_b.name
	end

	-- Sorts the acquire_list by name.
	function SortAcquireList()
		local sorted_acquires = addon.sorted_acquires
		twipe(sorted_acquires)

		for acquire_name in pairs(private.acquire_list) do
			table.insert(sorted_acquires, acquire_name)
		end
		table.sort(sorted_acquires, Sort_Acquisition)
	end

end	-- do

-------------------------------------------------------------------------------
-- Tooltip functions and data.
-------------------------------------------------------------------------------
local spell_tip = CreateFrame("GameTooltip", "arlSpellTooltip", UIParent, "GameTooltipTemplate")
local acquire_tip

-- Font Objects needed for acquire_tip
local narrowFont
local normalFont

local ListItem_ShowTooltip
do
	-- Fallback in case the user doesn't have LSM-3.0 installed
	if not LibStub:GetLibrary("LibSharedMedia-3.0", true) then

		local locale = GetLocale()
		-- Fix for font issues on koKR
		if locale == "koKR" then
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
	local narrowFontObj = CreateFont(MODNAME.."narrowFontObj")
	local normalFontObj = CreateFont(MODNAME.."normalFontObj")

	-- I want to do a bit more comprehensive tooltip processing. Things like changing font sizes,
	-- adding padding to the left hand side, and using better color handling. So... this function
	-- will do that for me.
	local function ttAdd(
			leftPad,		-- number of times to pad two spaces on left side
			textSize,		-- add to or subtract from addon.db.profile.frameopts.fontsize to get fontsize
			narrow,			-- if 1, use ARIALN instead of FRITZQ
			str1,			-- left-hand string
			hexcolor1,		-- hex color code for left-hand side
			str2,			-- if present, this is the right-hand string
			hexcolor2)		-- if present, hex color code for right-hand side

		-- are we changing fontsize or narrow?
		local fontSize

		if narrow or textSize ~= 0 then
			local font = narrow and narrowFont or normalFont
			local fontObj = narrow and narrowFontObj or normalFontObj

			fontSize = addon.db.profile.frameopts.fontsize + textSize

			fontObj:SetFont(font, fontSize)
			acquire_tip:SetFont(fontObj)
		end

		-- Add in our left hand padding
		local loopPad = leftPad
		local leftStr = str1

		while loopPad > 0 do
			leftStr = "    " .. leftStr
			loopPad = loopPad - 1
		end
		-- Set maximum width to match fontSize to maintain uniform tooltip size. -Torhal
		local width = math.ceil(fontSize * 37.5)
		local line = acquire_tip:AddLine()

		if str2 then
			width = width / 2

			acquire_tip:SetCell(line, 1, "|cff"..hexcolor1..leftStr.."|r", "LEFT", nil, nil, 0, 0, width, width)
			acquire_tip:SetCell(line, 2, "|cff"..hexcolor2..str2.."|r", "RIGHT", nil, nil, 0, 0, width, width)
		else
			acquire_tip:SetCell(line, 1, "|cff"..hexcolor1..leftStr.."|r", nil, "LEFT", 2, nil, 0, 0, width, width)
		end
	end

	local function SetSpellTooltip(owner, loc, link)
		spell_tip:SetOwner(owner, "ANCHOR_NONE")
		spell_tip:ClearAllPoints()

		if loc == "Top" then
			spell_tip:SetPoint("BOTTOMLEFT", owner, "TOPLEFT")
		elseif loc == "Bottom" then
			spell_tip:SetPoint("TOPLEFT", owner, "BOTTOMLEFT")
		elseif loc == "Left" then
			spell_tip:SetPoint("TOPRIGHT", owner, "TOPLEFT")
		elseif loc == "Right" then
			spell_tip:SetPoint("TOPLEFT", owner, "TOPRIGHT")
		end

		-- Add TipTac Support
		if _G.TipTac and _G.TipTac.AddModifiedTip and not spell_tip.tiptac then
			_G.TipTac:AddModifiedTip(spell_tip)
			spell_tip.tiptac = true
		end

		-- Set the spell tooltip's scale, and copy its other values from GameTooltip so AddOns which modify it will work.
		spell_tip:SetBackdrop(GameTooltip:GetBackdrop())
		spell_tip:SetBackdropColor(GameTooltip:GetBackdropColor())
		spell_tip:SetBackdropBorderColor(GameTooltip:GetBackdropBorderColor())
		spell_tip:SetScale(addon.db.profile.frameopts.tooltipscale)

		spell_tip:SetHyperlink(link)
		spell_tip:Show()
	end

	local function GetTipFactionInfo(comp_faction)
		local display_tip
		local color

		if comp_faction == FACTION_NEUTRAL then
			color = private.reputation_colors["neutral"]
			display_tip = true
		elseif comp_faction == BFAC[Player.faction] then
			color = private.reputation_colors["exalted"]
			display_tip = true
		else
			color = private.reputation_colors["hated"]
			display_tip = addon.db.profile.filters.general.faction
		end
		return display_tip, color
	end

	-------------------------------------------------------------------------------
	-- Functions for adding individual acquire type data to the tooltip.
	-------------------------------------------------------------------------------
	local function Tooltip_AddTrainer(id_num, location)
		local trainer = private.trainer_list[id_num]

		if location and trainer.location ~= location then
			return
		end
		local display_tip, name_color = GetTipFactionInfo(trainer.faction)

		if display_tip then
			local coord_text = ""

			if trainer.coord_x ~= 0 and trainer.coord_y ~= 0 then
				coord_text = "(" .. trainer.coord_x .. ", " .. trainer.coord_y .. ")"
			end
			ttAdd(0, -2, false, L["Trainer"], CATEGORY_COLORS["trainer"], trainer.name, name_color)
			ttAdd(1, -2, true, trainer.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
		end
	end

	local function Tooltip_AddVendor(recipe_id, id_num, location)
		local vendor = private.vendor_list[id_num]

		if location and vendor.location ~= location then
			return
		end
		local type_color = CATEGORY_COLORS["vendor"]
		local display_tip, name_color = GetTipFactionInfo(vendor.faction)

		if display_tip then
			local coord_text = ""

			if vendor.coord_x ~= 0 and vendor.coord_y ~= 0 then
				coord_text = "(" .. vendor.coord_x .. ", " .. vendor.coord_y .. ")"
			end
			ttAdd(0, -1, false, L["Vendor"], type_color, vendor.name, name_color)
			ttAdd(1, -2, true, vendor.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])

			local quantity = vendor.item_list[recipe_id]

			if type(quantity) == "number" then
				ttAdd(2, -2, true, L["LIMITED_SUPPLY"], type_color, string.format("(%d)", quantity), BASIC_COLORS["white"])
			end
		else
			ttAdd(0, -1, false, vendor.faction.." "..L["Vendor"], type_color)
		end
	end

	local function Tooltip_AddMobDrop(id_num, location)
		local mob = private.mob_list[id_num]

		if location and mob.location ~= location then
			return
		end
		local coord_text = ""

		if mob.coord_x ~= 0 and mob.coord_y ~= 0 then
			coord_text = "(" .. mob.coord_x .. ", " .. mob.coord_y .. ")"
		end
		ttAdd(0, -1, false, L["Mob Drop"], CATEGORY_COLORS["mobdrop"], mob.name, private.reputation_colors["hostile"])
		ttAdd(1, -2, true, mob.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
	end

	local function Tooltip_AddQuest(id_num, location)
		local quest = private.quest_list[id_num]

		if location and quest.location ~= location then
			return
		end
		local type_color = CATEGORY_COLORS["quest"]
		local display_tip, name_color = GetTipFactionInfo(quest.faction)

		if display_tip then
			local coord_text = ""

			if quest.coord_x ~= 0 and quest.coord_y ~= 0 then
				coord_text = "(" .. quest.coord_x .. ", " .. quest.coord_y .. ")"
			end
			ttAdd(0, -1, false, L["Quest"], type_color, private.quest_names[id_num], name_color)
			ttAdd(1, -2, true, quest.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
		else
			ttAdd(0, -1, false, quest.faction.." "..L["Quest"], type_color)
		end
	end

	local function Tooltip_AddRepVendor(id_num, location, rep_id, rep_level, vendor_id)
		local rep_vendor = private.vendor_list[vendor_id]

		if location and rep_vendor.location ~= location then
			return
		end
		local display_tip, name_color = GetTipFactionInfo(rep_vendor.faction)

		if display_tip then
			local rep_color = private.reputation_colors
			local rep_str = ""
			local type_color

			if rep_level == 0 then
				rep_str = FACTION_NEUTRAL
				type_color = rep_color["neutral"]
			elseif rep_level == 1 then
				rep_str = BFAC["Friendly"]
				type_color = rep_color["friendly"]
			elseif rep_level == 2 then
				rep_str = BFAC["Honored"]
				type_color = rep_color["honored"]
			elseif rep_level == 3 then
				rep_str = BFAC["Revered"]
				type_color = rep_color["revered"]
			else
				rep_str = BFAC["Exalted"]
				type_color = rep_color["exalted"]
			end
			ttAdd(0, -1, false, _G.REPUTATION, CATEGORY_COLORS["reputation"], private.reputation_list[id_num].name, CATEGORY_COLORS["repname"])
			ttAdd(1, -2, false, rep_str, type_color, rep_vendor.name, name_color)

			local coord_text = ""

			if rep_vendor.coord_x ~= 0 and rep_vendor.coord_y ~= 0 then
				coord_text = "(" .. rep_vendor.coord_x .. ", " .. rep_vendor.coord_y .. ")"
			end
			ttAdd(2, -2, true, rep_vendor.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
		end
	end

	local function Tooltip_AddWorldDrop(recipe_id, id_num, location, quality_color)
		local drop_location = type(id_num) == "string" and BZ[id_num] or nil

		if location and drop_location ~= location then
			return
		end
		local item_id = private.spell_to_recipe_map[recipe_id]
		local _, item_level

		if item_id then
			_, _, _, item_level = GetItemInfo(item_id)
		end
		local type_color = string.gsub(quality_color, "|cff", "")

		if type(id_num) == "string" then
			local location_text = item_level and string.format("%s (%d - %d)", drop_location, item_level - 5, item_level + 5) or drop_location

			ttAdd(0, -1, false, L["World Drop"], type_color, location_text, CATEGORY_COLORS["location"])
		else
			local location_text = item_level and string.format("%s (%d - %d)", _G.UNKNOWN, item_level - 5, item_level + 5) or _G.UNKNOWN

			ttAdd(0, -1, false, L["World Drop"], type_color, location_text, CATEGORY_COLORS["location"])
		end
	end

	-------------------------------------------------------------------------------
	-- Main tooltip-generating function.
	-------------------------------------------------------------------------------
	function ListItem_ShowTooltip(owner, list_entry)
		if not list_entry then
			return
		end
		local recipe_id = list_entry.recipe_id
		local recipe = private.recipe_list[recipe_id]

		if not recipe then
			return
		end
		local spell_tip_anchor = addon.db.profile.spelltooltiplocation
		local acquire_tip_anchor = addon.db.profile.acquiretooltiplocation
		local spell_link = GetSpellLink(recipe.spell_id)
		local MainPanel = addon.Frame

		if acquire_tip_anchor == _G.OFF then
			QTip:Release(acquire_tip)

			-- If we have the spell link tooltip, anchor it to MainPanel instead so it shows
			if spell_tip_anchor ~= _G.OFF and spell_link then
				SetSpellTooltip(MainPanel, spell_tip_anchor, spell_link)
			else
				spell_tip:Hide()
			end
			return
		end
		acquire_tip = QTip:Acquire(MODNAME.." Tooltip", 2, "LEFT", "LEFT")
		acquire_tip:ClearAllPoints()

		if acquire_tip_anchor == "Right" then
			acquire_tip:SetPoint("TOPLEFT", MainPanel, "TOPRIGHT")
		elseif acquire_tip_anchor == "Left" then
			acquire_tip:SetPoint("TOPRIGHT", MainPanel, "TOPLEFT")
		elseif acquire_tip_anchor == "Top" then
			acquire_tip:SetPoint("BOTTOMLEFT", MainPanel, "TOPLEFT")
		elseif acquire_tip_anchor == "Bottom" then
			acquire_tip:SetPoint("TOPLEFT", MainPanel, "BOTTOMLEFT")
		elseif acquire_tip_anchor == "Mouse" then
			local x, y = GetCursorPosition()
			local uiscale = UIParent:GetEffectiveScale()

			acquire_tip:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x / uiscale, y / uiscale)
		end

		if _G.TipTac and _G.TipTac.AddModifiedTip then
			-- Pass true as second parameter because hooking OnHide causes C stack overflows -Torhal
			_G.TipTac:AddModifiedTip(acquire_tip, true)
		end
		local _, _, _, quality_color = GetItemQualityColor(recipe.quality)

		acquire_tip:Clear()
		acquire_tip:SetScale(addon.db.profile.frameopts.tooltipscale)
		acquire_tip:AddHeader()
		acquire_tip:SetCell(1, 1, quality_color..recipe.name, "CENTER", 2)

		-- check if the recipe is excluded
		if addon.db.profile.exclusionlist[recipe_id] then
			ttAdd(0, -1, true, L["RECIPE_EXCLUDED"], "|cffff0000")
		end

		-- Add in skill level requirement, colored correctly
		local color_1 = BASIC_COLORS["normal"]
		local color_2

		local skill_level = Player["ProfessionLevel"]
		local recipe_level = recipe.skill_level
		local optimal_level = recipe.optimal_level
		local medium_level = recipe.medium_level
		local easy_level = recipe.easy_level
		local trivial_level = recipe.trivial_level
		local difficulty = private.difficulty_colors

		if recipe_level > skill_level then
			color_2 = difficulty["impossible"]
		elseif skill_level >= trivial_level then
			color_2 = difficulty["trivial"]
		elseif skill_level >= easy_level then
			color_2 = difficulty["easy"]
		elseif skill_level >= medium_level then
			color_2 = difficulty["medium"]
		elseif skill_level >= optimal_level then
			color_2 = difficulty["optimal"]
		else
			color_2 = difficulty["trivial"]
		end
		ttAdd(0, -1, false, L["Required Skill"] .. " :", color_1, recipe.skill_level, color_2)

		-- Binding info
		acquire_tip:AddSeparator()
		color_1 = BASIC_COLORS["normal"]

		for flag, label in pairs(BINDING_FLAGS) do
			if bit.band(recipe.flags.common1, flag) == flag then
				ttAdd(0, -1, true, label, color_1)
			end
		end
		acquire_tip:AddSeparator()

		ttAdd(0, -1, false, L["Obtained From"] .. " : ", BASIC_COLORS["normal"])

		local playerFaction = Player.faction
		local acquire_id = list_entry.acquire_id
		local location = list_entry.location_id

		for acquire_type, acquire_data in pairs(recipe.acquire_data) do
			local can_display = (not acquire_id or acquire_type == acquire_id)

			if can_display then
				for id_num, info in pairs(acquire_data) do
					if acquire_type == A.TRAINER then
						Tooltip_AddTrainer(id_num, location)
					elseif acquire_type == A.VENDOR then
						Tooltip_AddVendor(recipe_id, id_num, location)
					elseif acquire_type == A.MOB_DROP then
						Tooltip_AddMobDrop(id_num, location)
					elseif acquire_type == A.QUEST then
						Tooltip_AddQuest(id_num, location)
					elseif acquire_type == A.SEASONAL then
						color_1 = CATEGORY_COLORS["seasonal"]
						ttAdd(0, -1, 0, private.acquire_names[A.SEASONAL], color_1, private.seasonal_list[id_num].name, color_1)
					elseif acquire_type == A.REPUTATION then
						for rep_level, level_info in pairs(info) do
							for vendor_id in pairs(level_info) do
								Tooltip_AddRepVendor(id_num, location, rep_id, rep_level, vendor_id)
							end
						end
					elseif acquire_type == A.WORLD_DROP then
						Tooltip_AddWorldDrop(recipe_id, id_num, location, quality_color)
					elseif acquire_type == A.CUSTOM then
						ttAdd(0, -1, false, private.custom_list[id_num].name, CATEGORY_COLORS["custom"])
						--@alpha@
					elseif can_display then
						-- Unhandled
						ttAdd(0, -1, 0, L["Unhandled Recipe"], BASIC_COLORS["normal"])
						--@end-alpha@
					end
				end	-- for id_num
			end	-- if can_display
		end	-- for acquire_type
		acquire_tip:AddSeparator()
		acquire_tip:AddSeparator()

		-- Give the tooltip hint a unique color.
		color_1 = "c9c781"

		ttAdd(0, -1, 0, L["ALT_CLICK"], color_1)
		ttAdd(0, -1, 0, L["CTRL_CLICK"], color_1)
		ttAdd(0, -1, 0, L["SHIFT_CLICK"], color_1)

		if _G.TomTom and (addon.db.profile.worldmap or addon.db.profile.minimap) then
			ttAdd(0, -1, 0, L["CTRL_SHIFT_CLICK"], color_1)
		end
		acquire_tip:Show()

		-- If we have the spell link tooltip, link it to the acquire tooltip.
		if spell_tip_anchor ~= _G.OFF and spell_link then
			SetSpellTooltip(acquire_tip, spell_tip_anchor, spell_link)
		else
			spell_tip:Hide()
		end
	end
end	-- do

-------------------------------------------------------------------------------
-- Create the MainPanel and set its values
-------------------------------------------------------------------------------
local MainPanel = CreateFrame("Frame", "ARL_MainPanel", UIParent)

-- For initial tab setting.
local TranslateSortName

do
	MainPanel:SetWidth(MAINPANEL_NORMAL_WIDTH)
	MainPanel:SetHeight(447)
	MainPanel:SetHitRectInsets(5, 5, 5, 5)

	MainPanel:EnableMouse(true)
	MainPanel:EnableKeyboard(true)
	MainPanel:SetMovable(true)
	MainPanel:SetClampedToScreen(true)

	MainPanel.is_expanded = false

	-- Let the user banish the MainPanel with the ESC key.
	table.insert(UISpecialFrames, "ARL_MainPanel")

	addon.Frame = MainPanel

	MainPanel.backdrop = MainPanel:CreateTexture("AckisRecipeList.bgTexture", "BACKGROUND")
	MainPanel.backdrop:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\main")
	MainPanel.backdrop:SetAllPoints(MainPanel)
	MainPanel.backdrop:SetTexCoord(0, (MAINPANEL_NORMAL_WIDTH/512), 0, (447/512))

	MainPanel.title_bar = MainPanel:CreateFontString(nil, "ARTWORK")
	MainPanel.title_bar:SetFontObject("GameFontHighlightSmall")
	MainPanel.title_bar:ClearAllPoints()
	MainPanel.title_bar:SetPoint("TOP", MainPanel, "TOP", 20, -16)
	MainPanel.title_bar:SetJustifyH("CENTER")

	-------------------------------------------------------------------------------
	-- Tabs
	-------------------------------------------------------------------------------
	local function Tab_Enable(self)
		self:SetFrameStrata("MEDIUM")
		self.left:ClearAllPoints()
		self.left:SetPoint("BOTTOMLEFT")
		self.left:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-ActiveTab")
		self.middle:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-ActiveTab")
		self.right:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-ActiveTab")
		self:Disable()
	end

	function Tab_Disable(self)
		self:SetFrameStrata("LOW")
		self.left:ClearAllPoints()
		self.left:SetPoint("TOPLEFT")
		self.left:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-InactiveTab")
		self.middle:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-InactiveTab")
		self.right:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-InactiveTab")
		self:Enable()
	end

	local function Tab_SetText(self, ...)
		local text = self.Real_SetText(self, ...)
		self:SetWidth(40 + self:GetFontString():GetStringWidth())

		return ...
	end

	local function Tab_OnClick(self, button, down)
		local id_num = self:GetID()

		for index in ipairs(MainPanel.tabs) do
			local tab = MainPanel.tabs[index]

			if index == id_num then
				self:ToFront()
			else
				tab:ToBack()
			end
			addon.db.profile.current_tab = id_num
			ListFrame:Update(nil, false)
			PlaySound("igCharacterInfoTab")
		end
	end

	local function CreateTab(id_num, text, ...)
		local tab = CreateFrame("Button", nil, MainPanel)

		tab:SetID(id_num)
		tab:SetHeight(32)
		tab:SetPoint(...)
		tab:SetFrameLevel(tab:GetFrameLevel() + 4)

		tab.left = tab:CreateTexture(nil, "BORDER")
		tab.left:SetWidth(20)
		tab.left:SetHeight(32)
		tab.left:SetTexCoord(0, 0.15625, 0, 1)

		tab.right = tab:CreateTexture(nil, "BORDER")
		tab.right:SetWidth(20)
		tab.right:SetHeight(32)
		tab.right:SetPoint("TOP", tab.left)
		tab.right:SetPoint("RIGHT", tab)
		tab.right:SetTexCoord(0.84375, 1, 0, 1)

		tab.middle = tab:CreateTexture(nil, "BORDER")
		tab.middle:SetHeight(32)
		tab.middle:SetPoint("LEFT", tab.left, "RIGHT")
		tab.middle:SetPoint("RIGHT", tab.right, "LEFT")
		tab.middle:SetTexCoord(0.15625, 0.84375, 0, 1)

		tab:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight", "ADD")

		local tab_highlight = tab:GetHighlightTexture()
		tab_highlight:ClearAllPoints()
		tab_highlight:SetPoint("TOPLEFT", tab, "TOPLEFT", 8, 1)
		tab_highlight:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", -8, 1)

		tab:SetDisabledFontObject(GameFontHighlightSmall)
		tab:SetHighlightFontObject(GameFontHighlightSmall)
		tab:SetNormalFontObject(GameFontNormalSmall)
		tab.Real_SetText = tab.SetText

		tab.SetText = Tab_SetText
		tab:SetText(text)

		tab.ToFront = Tab_Enable
		tab.ToBack = Tab_Disable

		tab:ToBack()

		tab:SetScript("OnClick", Tab_OnClick)
		return tab
	end

	local AcquireTab = CreateTab(1, L["Acquisition"], "TOPLEFT", MainPanel, "BOTTOMLEFT", 4, 3)
	local LocationTab = CreateTab(2, L["Location"], "LEFT", AcquireTab, "RIGHT", -14, 0)
	local NameTab = CreateTab(3, _G.NAME, "LEFT", LocationTab, "RIGHT", -14, 0)

	MainPanel.tabs = {
		AcquireTab,
		LocationTab,
		NameTab,
	}
	MainPanel:Hide()
end
-------------------------------------------------------------------------------
-- MainPanel scripts/functions.
-------------------------------------------------------------------------------
MainPanel:SetScript("OnShow",
		    function(self)
			    local current_tab = self.tabs[addon.db.profile.current_tab]
			    local on_click = current_tab:GetScript("OnClick")

			    on_click(current_tab)

			    self.sort_button:SetTextures()
		    end)

MainPanel:SetScript("OnHide",
		    function(self)
			    for spell_id, recipe in pairs(private.recipe_list) do
				    recipe:RemoveState("RELEVANT")
				    recipe:RemoveState("VISIBLE")
			    end
			    addon:ClosePopups()
		    end)

MainPanel:SetScript("OnMouseDown", MainPanel.StartMoving)

MainPanel:SetScript("OnMouseUp",
		    function(self, button)
			    self:StopMovingOrSizing()

			    local opts = addon.db.profile.frameopts
			    local from, _, to, x, y = self:GetPoint()

			    opts.anchorFrom = from
			    opts.anchorTo = to

			    if self.is_expanded then
				    if opts.anchorFrom == "TOPLEFT" or opts.anchorFrom == "LEFT" or opts.anchorFrom == "BOTTOMLEFT" then
					    opts.offsetx = x
				    elseif opts.anchorFrom == "TOP" or opts.anchorFrom == "CENTER" or opts.anchorFrom == "BOTTOM" then
					    opts.offsetx = x - 151/2
				    elseif opts.anchorFrom == "TOPRIGHT" or opts.anchorFrom == "RIGHT" or opts.anchorFrom == "BOTTOMRIGHT" then
					    opts.offsetx = x - 151
				    end
			    else
				    opts.offsetx = x
			    end
			    opts.offsety = y
		    end)

function MainPanel:HighlightCategory(target)
	if not target then
		self.filter_menu:Hide()
	end

	for category in pairs(self.filter_menu) do
		local toggle = "menu_toggle_" .. category

		if target == category then
			self[toggle].text:SetText(SetTextColor(BASIC_COLORS["white"], CATEGORY_TEXT[category]))
		elseif category ~= 0 and category ~= "texture" then
			self[toggle]:SetChecked(false)
			self[toggle].text:SetText(SetTextColor(BASIC_COLORS["yellow"], CATEGORY_TEXT[category]))
		end
	end
end

function MainPanel:ToggleState()
	if self.is_expanded then
		self:SetWidth(MAINPANEL_NORMAL_WIDTH)

		self.backdrop:SetTexture([[Interface\Addons\AckisRecipeList\img\main]])
		self.backdrop:SetAllPoints(self)
		self.backdrop:SetTexCoord(0, (MAINPANEL_NORMAL_WIDTH/512), 0, (447/512))

		self.progress_bar:SetWidth(195)
	else
		self:SetWidth(MAINPANEL_EXPANDED_WIDTH)

		self.backdrop:SetTexture([[Interface\Addons\AckisRecipeList\img\expanded]])
		self.backdrop:SetAllPoints(self)
		self.backdrop:SetTexCoord(0, (MAINPANEL_EXPANDED_WIDTH/512), 0, (447/512))

		self.progress_bar:SetWidth(345)
	end
	self.is_expanded = not self.is_expanded

	local x, y = self:GetLeft(), self:GetBottom()

	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y)
	self:UpdateTitle()
end

function MainPanel:SetProfession()
	local prev_profession = self.profession

	if Player.current_prof == private.mining_name then
		self.profession = 11 -- Smelting
	else
		for index, name in ipairs(ORDERED_PROFESSIONS) do
			if name == Player.current_prof then
				self.profession = index
				break
			end
		end
	end

	if self.profession ~= prev_profession then
		self.prev_profession = self.profession
	end
	self.mode_button:ChangeTexture(PROFESSION_TEXTURES[self.profession])
end

function MainPanel:SetPosition()
	local opts = addon.db.profile.frameopts
	local FixedOffsetX = opts.offsetx

	self:ClearAllPoints()

	if opts.anchorTo == "" then	-- no values yet, clamp to whatever frame is appropriate
		if _G.ATSWFrame then
			self:SetPoint("CENTER", _G.ATSWFrame, "CENTER", 490, 0)
		elseif _G.CauldronFrame then
			self:SetPoint("CENTER", _G.CauldronFrame, "CENTER", 490, 0)
		elseif _G.Skillet then
			self:SetPoint("CENTER", _G.SkilletFrame, "CENTER", 468, 0)
		else
			self:SetPoint("TOPLEFT", _G.TradeSkillFrame, "TOPRIGHT", 10, 0)
		end
	else
		if self.is_expanded then
			if opts.anchorFrom == "TOPLEFT" or opts.anchorFrom == "LEFT" or opts.anchorFrom == "BOTTOMLEFT" then
				FixedOffsetX = opts.offsetx
			elseif opts.anchorFrom == "TOP" or opts.anchorFrom == "CENTER" or opts.anchorFrom == "BOTTOM" then
				FixedOffsetX = opts.offsetx + 151/2
			elseif opts.anchorFrom == "TOPRIGHT" or opts.anchorFrom == "RIGHT" or opts.anchorFrom == "BOTTOMRIGHT" then
				FixedOffsetX = opts.offsetx + 151
			end
		end
		self:SetPoint(opts.anchorFrom, UIParent, opts.anchorTo, FixedOffsetX, opts.offsety)
	end
end

function MainPanel:UpdateTitle()
	if not self.is_expanded then
		self.title_bar:SetFormattedText(SetTextColor(BASIC_COLORS["normal"], "ARL (v.%s) - %s"), addon.version, Player.current_prof)
		return
	end
	local total, active = 0, 0

	for filter, info in pairs(FilterValueMap) do
		if info.svroot then
			if info.svroot[filter] == true then
				active = active + 1
			end
			total = total + 1
		end
	end
	self.title_bar:SetFormattedText(SetTextColor(BASIC_COLORS["normal"], "ARL (v.%s) - %s (%d/%d %s)"), addon.version, Player.current_prof, active, total, _G.FILTERS)
end

-------------------------------------------------------------------------------
-- Create the MainPanel.mode_button and assign its values.
-------------------------------------------------------------------------------
MainPanel.mode_button = CreateFrame("Button", nil, MainPanel, "UIPanelButtonTemplate")
MainPanel.mode_button:SetWidth(64)
MainPanel.mode_button:SetHeight(64)
MainPanel.mode_button:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 1, -2)
MainPanel.mode_button:RegisterForClicks("LeftButtonUp", "RightButtonUp")

MainPanel.mode_button._normal = MainPanel.mode_button:CreateTexture(nil, "BACKGROUND")
MainPanel.mode_button._pushed = MainPanel.mode_button:CreateTexture(nil, "BACKGROUND")
MainPanel.mode_button._disabled = MainPanel.mode_button:CreateTexture(nil, "BACKGROUND")

-------------------------------------------------------------------------------
-- MainPanel.mode_button scripts/functions.
-------------------------------------------------------------------------------
MainPanel.mode_button:SetScript("OnClick",
				function(self, button, down)
					-- Known professions should be in Player.professions


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

					local NUM_PROFESSIONS = 12

					-- ok, so first off, if we've never done this before, there is no "current"
					-- and a single iteration will do nicely, thank you
					if button == "LeftButton" then
						-- normal profession switch
						if MainPanel.profession == 0 then
							startLoop = 1
							endLoop = NUM_PROFESSIONS + 1
						else
							startLoop = MainPanel.profession + 1
							endLoop = MainPanel.profession
						end
						local index = startLoop

						while index ~= endLoop do
							if index > NUM_PROFESSIONS then
								index = 1
							elseif Player.professions[ORDERED_PROFESSIONS[index]] then
								displayProf = index
								MainPanel.profession = index
								break
							else
								index = index + 1
							end
						end
					elseif button == "RightButton" then
						-- reverse profession switch
						if MainPanel.profession == 0 then
							startLoop = NUM_PROFESSIONS + 1
							endLoop = 0
						else
							startLoop = MainPanel.profession - 1
							endLoop = MainPanel.profession
						end
						local index = startLoop

						while index ~= endLoop do
							if index < 1 then
								index = NUM_PROFESSIONS
							elseif Player.professions[ORDERED_PROFESSIONS[index]] then
								displayProf = index
								MainPanel.profession = index
								break
							else
								index = index - 1
							end
						end
					end
					local is_shown = TradeSkillFrame:IsVisible()

					CastSpellByName(ORDERED_PROFESSIONS[MainPanel.profession])
					addon:Scan()

					if not is_shown then
						TradeSkillFrame:Hide()
					end
				end)

function MainPanel.mode_button:ChangeTexture(texture)
	local normal, pushed, disabled = self._normal, self._pushed, self._disabled

	normal:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. texture .. [[_up]])
	normal:SetTexCoord(0, 1, 0, 1)
	normal:SetAllPoints(self)
	self:SetNormalTexture(normal)

	pushed:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. texture .. [[_down]])
	pushed:SetTexCoord(0, 1, 0, 1)
	pushed:SetAllPoints(self)
	self:SetPushedTexture(pushed)

	disabled:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. texture .. [[_up]])
	disabled:SetTexCoord(0, 1, 0, 1)
	disabled:SetAllPoints(self)
	self:SetDisabledTexture(disabled)
end

-------------------------------------------------------------------------------
-- Widget Container frames.
-------------------------------------------------------------------------------
local WidgetContainer = CreateFrame("Frame", nil, MainPanel)
WidgetContainer:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 75, -39)
WidgetContainer:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -5, -39)
WidgetContainer:SetHeight(30)

local WidgetContainer2 = CreateFrame("Frame", nil, MainPanel)
WidgetContainer2:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 15, -70)
WidgetContainer2:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -5, -70)
WidgetContainer2:SetHeight(30)

-------------------------------------------------------------------------------
-- Create the expand button and set its scripts.
-------------------------------------------------------------------------------
local ExpandButtonFrame = CreateFrame("Frame", nil, MainPanel)
ExpandButtonFrame:SetWidth(50)
ExpandButtonFrame:SetHeight(28)
ExpandButtonFrame:SetPoint("LEFT", WidgetContainer2, "LEFT", 2, 0)

ExpandButtonFrame.left = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.left:SetWidth(8)
ExpandButtonFrame.left:SetHeight(30)
ExpandButtonFrame.left:SetPoint("TOPLEFT", ExpandButtonFrame, 0, 4)
ExpandButtonFrame.left:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Left")

ExpandButtonFrame.right = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.right:SetWidth(8)
ExpandButtonFrame.right:SetHeight(30)
ExpandButtonFrame.right:SetPoint("TOPRIGHT", ExpandButtonFrame, 0, 4)
ExpandButtonFrame.right:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Right")

ExpandButtonFrame.middle = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.middle:SetHeight(30)
ExpandButtonFrame.middle:SetPoint("LEFT", ExpandButtonFrame.left, "RIGHT")
ExpandButtonFrame.middle:SetPoint("RIGHT", ExpandButtonFrame.right, "LEFT")
ExpandButtonFrame.middle:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Middle")

local ExpandButton = GenericCreateButton(nil, MainPanel, 16, 16, "GameFontNormalSmall", "GameFontHighlightSmall", _G.ALL, "LEFT", L["EXPANDALL_DESC"], 2)

MainPanel.expand_all_button = ExpandButton

ExpandButton:SetPoint("LEFT", ExpandButtonFrame.left, "RIGHT", -3, -3)

ExpandButton.text:ClearAllPoints()
ExpandButton.text:SetPoint("LEFT", ExpandButton, "Right", 0, 0)

ExpandButton:SetScript("OnClick",
		       function(self, mouse_button, down)
			       local expanded = self.is_expanded
			       local expand_mode

			       if not expanded then
				       if _G.IsShiftKeyDown() then
					       expand_mode = "deep"
				       else
					       expand_mode = "normal"
				       end
			       end
			       -- ListFrame:Update() must be called before the button can be expanded or contracted, since
			       -- the button is contracted from there.
			       -- If expand_mode is nil, that means expand nothing.
			       ListFrame:Update(expand_mode, false)

			       if expanded then
				       self:Contract()
			       else
				       self:Expand()
			       end
		       end)

function ExpandButton:Expand()
	self.is_expanded = true

	self:SetNormalTexture("Interface\\BUTTONS\\UI-MinusButton-Up")
	self:SetPushedTexture("Interface\\BUTTONS\\UI-MinusButton-Down")
	self:SetHighlightTexture("Interface\\BUTTONS\\UI-PlusButton-Hilight")
	self:SetDisabledTexture("Interface\\BUTTONS\\UI-MinusButton-Disabled")

	SetTooltipScripts(self, L["CONTRACTALL_DESC"])
end

function ExpandButton:Contract()
	self.is_expanded = nil

	self:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
	self:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
	self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	self:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")

	SetTooltipScripts(self, L["EXPANDALL_DESC"])
end

local SortToggle = GenericCreateButton(nil, MainPanel, 24, 24, "GameFontNormalSmall", "GameFontHighlightSmall", "", "CENTER", L["SORTING_DESC"], 2)

MainPanel.sort_button = SortToggle

SortToggle:SetPoint("LEFT", ExpandButtonFrame.right, "RIGHT", -2, -2)

SortToggle:SetScript("OnClick",
		     function(self, button, down)
			     local sort_type = addon.db.profile.sorting

			     addon.db.profile.sorting = (sort_type == "Ascending" and "Descending" or "Ascending")

			     self:SetTextures()
			     ListFrame:Update(nil, false)
		     end)

function SortToggle:SetTextures()
	local sort_type = addon.db.profile.sorting

	if sort_type == "Ascending" then
		self:SetNormalTexture("Interface\\CHATFRAME\\UI-ChatIcon-ScrollDown-Up")
		self:SetPushedTexture("Interface\\CHATFRAME\\UI-ChatIcon-ScrollDown-Down")
		self:SetHighlightTexture("Interface\\CHATFRAME\\UI-ChatIcon-BlinkHilight")
		self:SetDisabledTexture("Interface\\CHATFRAME\\UI-ChatIcon-ScrollDown-Disabled")
	else
		self:SetNormalTexture("Interface\\CHATFRAME\\UI-ChatIcon-ScrollUp-Up")
		self:SetPushedTexture("Interface\\CHATFRAME\\UI-ChatIcon-ScrollUp-Down")
		self:SetHighlightTexture("Interface\\CHATFRAME\\UI-ChatIcon-BlinkHilight")
		self:SetDisabledTexture("Interface\\CHATFRAME\\UI-ChatIcon-ScrollUp-Disabled")
	end
end


-------------------------------------------------------------------------------
-- The search entry box and associated methods.
-------------------------------------------------------------------------------
local SearchRecipes
do
	local acquire_names = private.acquire_names
	local location_list = private.location_list

	local search_params = {
		["item_id"]	= true,
		["name"]	= true,
		["specialty"]	= true,
		["skill_level"]	= true,
	}
	-- Scans through the recipe database and toggles the flag on if the item is in the search criteria
	function SearchRecipes(pattern)
		if not pattern then
			return
		end
		pattern = pattern:lower()

		for index, entry in pairs(private.recipe_list) do
			entry:RemoveState("RELEVANT")

			if entry.profession == Player.current_prof then
				local found = false

				for field in pairs(search_params) do
					local str = entry[field] and tostring(entry[field]):lower() or nil

					if str and str:find(pattern) then
						entry:AddState("RELEVANT")
						found = true
						break
					end
				end

				if not found then
					for acquire_type in pairs(acquire_names) do
						local str = acquire_names[acquire_type]:lower()

						if str and str:find(pattern) and entry.acquire_data[acquire_type] then
							entry:AddState("RELEVANT")
							found = true
							break
						end
					end
				end

				if not found then
					for location_name in pairs(location_list) do
						local breakout = false

						for spell_id in pairs(location_list[location_name].recipes) do
							if spell_id == entry.spell_id then
								local str = location_name:lower()

								if str and str:find(pattern) then
									entry:AddState("RELEVANT")
									breakout = true
									break
								end
							end
						end

						if breakout then
							break
						end
					end
				end
			end
		end	-- if entry.profession
	end	-- for
end	-- do

-------------------------------------------------------------------------------
-- Search EditBox
-------------------------------------------------------------------------------
local SearchBox = CreateFrame("EditBox", nil, MainPanel, "InputBoxTemplate")

SearchBox:EnableMouse(true)
SearchBox:SetAutoFocus(false)
SearchBox:SetFontObject(ChatFontSmall)
SearchBox:SetWidth(130)
SearchBox:SetHeight(12)
SearchBox:SetPoint("TOPLEFT", WidgetContainer, "TOPLEFT", 0, 0)
SearchBox:Show()

MainPanel.search_editbox = SearchBox

SearchBox:SetText(_G.SEARCH)
SearchBox:SetHistoryLines(10)

-- Resets the SearchBox text and the state of all ListFrame and recipe_list entries.
function SearchBox:Reset()
	local recipe_list = private.recipe_list

	for index, recipe in pairs(recipe_list) do
		recipe:RemoveState("RELEVANT")
	end
	self.prev_search = nil

	self:SetText(_G.SEARCH)
	self:ClearFocus()
	ListFrame:Update(false, false)
end

SearchBox:SetScript("OnEnterPressed",
		    function(self)
			    local searchtext = self:GetText()
			    searchtext = searchtext:trim()

			    if not searchtext or searchtext == "" then
				    self:Reset()
				    return
			    end

			    if searchtext == _G.SEARCH then
				    self:HighlightText()
				    return
			    end
			    self.prev_search = searchtext

			    self:HighlightText()
			    self:AddHistoryLine(searchtext)
			    SearchRecipes(searchtext)
			    ListFrame:Update(false, false)
		    end)

SearchBox:SetScript("OnEditFocusGained",
		    function(self)
			    if self:GetText() == _G.SEARCH then
				    self:HighlightText()
			    end
		    end)

SearchBox:SetScript("OnEditFocusLost",
		    function(self)
			    local text = self:GetText()

			    if text == "" then
				    self:Reset()
				    return
			    end
			    self:AddHistoryLine(text)
		    end)


SearchBox:SetScript("OnTextSet",
		    function(self)
			    local text = self:GetText()

			    if text ~= "" and text ~= _G.SEARCH and text ~= self.prev_search then
				    self:HighlightText()
			    else
				    self:Reset()
			    end
		    end)

do
	local last_update = 0
	local updater = CreateFrame("Frame", nil, UIParent)

	updater:Hide()
	updater:SetScript("OnUpdate",
			  function(self, elapsed)
				  last_update = last_update + elapsed

				  if last_update >= 0.5 then
					  last_update = 0

					  SearchRecipes(SearchBox:GetText())
					  ListFrame:Update(false, false)
					  self:Hide()
				  end
			  end)

	SearchBox:SetScript("OnTextChanged",
			    function(self, is_typed)
				    if not is_typed then
					    return
				    end
				    local text = self:GetText()

				    if text ~= "" and text ~= _G.SEARCH and text ~= self.prev_search then
					    updater:Show()
				    else
					    self:Reset()
				    end
			    end)
end	-- do

-------------------------------------------------------------------------------
-- "Display Exclusions" checkbox.
-------------------------------------------------------------------------------
local ExcludeToggle = CreateFrame("CheckButton", nil, MainPanel, "UICheckButtonTemplate")
ExcludeToggle:SetPoint("TOPLEFT", SearchBox, "BOTTOMLEFT", -5, -5)
ExcludeToggle:SetHeight(16)
ExcludeToggle:SetWidth(16)

ExcludeToggle.text = ExcludeToggle:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
ExcludeToggle.text:SetPoint("LEFT", ExcludeToggle, "RIGHT", 0, 0)

ExcludeToggle:SetScript("OnClick",
			function(self, button, down)
				addon.db.profile.ignoreexclusionlist = not addon.db.profile.ignoreexclusionlist
				ListFrame:Update(nil, false)
			end)

ExcludeToggle:SetScript("OnShow",
			function(self)
				self:SetChecked(addon.db.profile.ignoreexclusionlist)
			end)

ExcludeToggle:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
ExcludeToggle:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
ExcludeToggle:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
ExcludeToggle:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
ExcludeToggle:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

ExcludeToggle.text:SetText(L["Display Exclusions"])
SetTooltipScripts(ExcludeToggle, L["DISPLAY_EXCLUSION_DESC"], 1)

-------------------------------------------------------------------------------
-- Create the X-close button, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.xclose_button = CreateFrame("Button", nil, MainPanel, "UIPanelCloseButton")
MainPanel.xclose_button:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", 5, -6)

MainPanel.xclose_button:SetScript("OnClick",
				  function(self, button, down)
					  MainPanel:Hide()
				  end)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_toggle, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_toggle = GenericCreateButton(nil, MainPanel, 25, 74, "GameFontNormalSmall", "GameFontHighlightSmall", L["FILTER_OPEN"], "CENTER", L["FILTER_OPEN_DESC"], 1)
MainPanel.filter_toggle:SetPoint("TOPRIGHT", WidgetContainer, "TOPRIGHT", 0, 0)

MainPanel.filter_toggle:SetScript("OnClick",
			   function(self, button, down)
				   if MainPanel.is_expanded then
					   -- Change the text and tooltip for the filter button
					   self:SetText(L["FILTER_OPEN"])
					   SetTooltipScripts(self, L["FILTER_OPEN_DESC"])

					   -- Hide the category buttons
					   for category in pairs(MainPanel.filter_menu) do
						   if category ~= 0 and category ~= "texture" then
							   MainPanel["menu_toggle_" .. category]:Hide()
						   end
					   end
					   MainPanel:HighlightCategory(nil)
					   MainPanel.filter_reset:Hide()
				   else
					   -- Change the text and tooltip for the filter button
					   self:SetText(L["FILTER_CLOSE"])
					   SetTooltipScripts(self, L["FILTER_CLOSE_DESC"])

					   -- Show the category buttons
					   for category in pairs(MainPanel.filter_menu) do
						   if category ~= 0 and category ~= "texture" then
							   MainPanel["menu_toggle_" .. category]:Show()
						   end
					   end
					   MainPanel.filter_reset:Show()
				   end
				   MainPanel:ToggleState()
			   end)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_reset and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_reset = GenericCreateButton(nil, MainPanel, 25, 74, "GameFontNormalSmall", "GameFontHighlightSmall", _G.RESET, "CENTER",
					     L["RESET_DESC"], 1)
MainPanel.filter_reset:SetPoint("TOPRIGHT", WidgetContainer2, "TOPRIGHT", 0, 2)
MainPanel.filter_reset:Hide()

do
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

	function addon.resetFilters()
		local filterdb = addon.db.profile.filters

		-- Reset all filters to true.
		recursiveReset(addon.db.profile.filters)

		-- Reset specific filters to false.
		filterdb.general.specialty = false
		filterdb.general.known = false
		filterdb.general.retired = false

		-- Reset all classes to false.
		for class in pairs(filterdb.classes) do
			filterdb.classes[class] = false
		end
		-- Set your own class to true.
		filterdb.classes[strlower(Player["Class"])] = true

		if MainPanel:IsVisible() then
			MainPanel:UpdateTitle()
			MainPanel:HighlightCategory(nil)
			ListFrame:Update(nil, false)
		end
	end
	MainPanel.filter_reset:SetScript("OnClick", addon.resetFilters)
end	-- do

-------------------------------------------------------------------------------
-- Create the seven buttons for opening/closing the filter menus
-------------------------------------------------------------------------------
local CreateFilterMenuButton
do
	local CATEGORY_TOOLTIP = {
		["general"]	= L["FILTERING_GENERAL_DESC"],
		["obtain"]	= L["FILTERING_OBTAIN_DESC"],
		["binding"]	= L["FILTERING_BINDING_DESC"],
		["item"]	= L["FILTERING_ITEM_DESC"],
		["quality"]	= L["FILTERING_QUALITY_DESC"],
		["player"]	= L["FILTERING_PLAYERTYPE_DESC"],
		["rep"]		= L["FILTERING_REP_DESC"],
		["misc"]	= L["FILTERING_MISC_DESC"]
	}

	-- This manages the filter menu panel, as well as checking or unchecking the
	-- buttons that got us here in the first place
	local function ToggleFilterMenu(panel)
		local ChangeFilters = false

		MainPanel.filter_menu.rep.Classic:Hide()
		MainPanel.filter_menu.rep.BC:Hide()
		MainPanel.filter_menu.rep.LK:Hide()

		MainPanel.filter_menu.rep.toggle_originalwow:SetChecked(false)
		MainPanel.filter_menu.rep.toggle_bc:SetChecked(false)
		MainPanel.filter_menu.rep.toggle_wrath:SetChecked(false)

		local toggle = "menu_toggle_" .. panel

		if MainPanel[toggle]:GetChecked() then
			-- Display the selected filter_menu category frame
			MainPanel:HighlightCategory(panel)
			MainPanel.filter_menu[panel]:Show()

			-- Hide all of the other filter_menu category frames
			for category in pairs(MainPanel.filter_menu) do
				if category ~= panel and category ~= 0 and category ~= "texture" then
					MainPanel.filter_menu[category]:Hide()
				end
			end
			ChangeFilters = true
		else
			MainPanel[toggle].text:SetText(SetTextColor(BASIC_COLORS["yellow"], CATEGORY_TEXT[panel]))
			ChangeFilters = false
		end

		if ChangeFilters then
			-- Depending on which panel we're showing, either display one column
			-- or two column
			if panel == "general" or panel == "obtain" or panel == "binding" or panel == "item" or panel == "misc" then
				MainPanel.filter_menu.texture:ClearAllPoints()
				MainPanel.filter_menu:SetWidth(FILTERMENU_DOUBLE_WIDTH)
				MainPanel.filter_menu.texture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_2col]])
				MainPanel.filter_menu.texture:SetAllPoints(MainPanel.filter_menu)
				MainPanel.filter_menu.texture:SetTexCoord(0, (FILTERMENU_DOUBLE_WIDTH/256), 0, (FILTERMENU_HEIGHT/512))
			elseif panel == "player" or panel == "rep" or panel == "quality" then
				MainPanel.filter_menu.texture:ClearAllPoints()
				MainPanel.filter_menu:SetWidth(FILTERMENU_SINGLE_WIDTH)
				MainPanel.filter_menu.texture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_1col]])
				MainPanel.filter_menu.texture:SetAllPoints(MainPanel.filter_menu)
				MainPanel.filter_menu.texture:SetTexCoord(0, (FILTERMENU_SINGLE_WIDTH/256), 0, (FILTERMENU_HEIGHT/512))
			end
			-- Change the filters to the current panel
			MainPanel.filter_menu:Show()
		else
			-- We're hiding, don't bother changing anything
			MainPanel.filter_menu:Hide()
		end
	end

	function CreateFilterMenuButton(button_texture, category)
		local button_size = 30
		local cButton = CreateFrame("CheckButton", nil, MainPanel)

		cButton:SetWidth(button_size)
		cButton:SetHeight(button_size)
		cButton:SetScript("OnClick",
				  function(self, button, down)
					  ToggleFilterMenu(category)
				  end)

		local bgTex = cButton:CreateTexture(nil, "BACKGROUND")
		bgTex:SetTexture('Interface/SpellBook/UI-Spellbook-SpellBackground')
		bgTex:SetHeight(button_size + 6)
		bgTex:SetWidth(button_size + 4)
		bgTex:SetTexCoord(0, (43/64), 0, (43/64))
		bgTex:SetPoint("CENTER", cButton, "CENTER", 0, 0)

		local iconTex = cButton:CreateTexture(nil, "BORDER")
		iconTex:SetTexture('Interface/Icons/' .. button_texture)
		iconTex:SetAllPoints(cButton)

		local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
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
		local cbText = cButton:CreateFontString("cbText", "OVERLAY", "GameFontHighlightSmallRight")
		cbText:SetText(SetTextColor(BASIC_COLORS["yellow"], CATEGORY_TEXT[category]))
		cbText:SetPoint("LEFT", cButton, "RIGHT", 5, 0)
		cbText:SetHeight(14)
		cbText:SetWidth(100)
		cbText:SetJustifyH("LEFT")
		cButton.text = cbText

		-- And throw up a tooltip
		SetTooltipScripts(cButton, CATEGORY_TOOLTIP[category])
		cButton:Hide()

		return cButton
	end
end	-- do

MainPanel.menu_toggle_general = CreateFilterMenuButton("INV_Misc_Note_06", "general")
MainPanel.menu_toggle_general:SetPoint("TOPRIGHT", MainPanel.filter_reset, "BOTTOMLEFT", -25, -18)

MainPanel.menu_toggle_obtain = CreateFilterMenuButton("INV_Misc_Bag_07", "obtain")
MainPanel.menu_toggle_obtain:SetPoint("TOPLEFT", MainPanel.menu_toggle_general, "BOTTOMLEFT", 0, -8)

MainPanel.menu_toggle_binding = CreateFilterMenuButton("INV_Belt_20", "binding")
MainPanel.menu_toggle_binding:SetPoint("TOPLEFT", MainPanel.menu_toggle_obtain, "BOTTOMLEFT", -0, -8)

MainPanel.menu_toggle_item = CreateFilterMenuButton("INV_Misc_EngGizmos_19", "item")
MainPanel.menu_toggle_item:SetPoint("TOPLEFT", MainPanel.menu_toggle_binding, "BOTTOMLEFT", -0, -8)

MainPanel.menu_toggle_quality = CreateFilterMenuButton("INV_Enchant_VoidCrystal", "quality")
MainPanel.menu_toggle_quality:SetPoint("TOPLEFT", MainPanel.menu_toggle_item, "BOTTOMLEFT", -0, -8)

MainPanel.menu_toggle_player = CreateFilterMenuButton("INV_Misc_GroupLooking", "player")
MainPanel.menu_toggle_player:SetPoint("TOPLEFT", MainPanel.menu_toggle_quality, "BOTTOMLEFT", -0, -8)

MainPanel.menu_toggle_rep = CreateFilterMenuButton("Achievement_Reputation_01", "rep")
MainPanel.menu_toggle_rep:SetPoint("TOPLEFT", MainPanel.menu_toggle_player, "BOTTOMLEFT", -0, -8)

MainPanel.menu_toggle_misc = CreateFilterMenuButton("Trade_Engineering", "misc")
MainPanel.menu_toggle_misc:SetPoint("TOPLEFT", MainPanel.menu_toggle_rep, "BOTTOMLEFT", -0, -8)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu = CreateFrame("Frame", "ARL_FilterMenu", MainPanel)
MainPanel.filter_menu:SetWidth(FILTERMENU_DOUBLE_WIDTH)
MainPanel.filter_menu:SetHeight(FILTERMENU_HEIGHT)
MainPanel.filter_menu:SetPoint("TOPLEFT", MainPanel, "TOPRIGHT", -6, -102)
MainPanel.filter_menu:EnableMouse(true)
MainPanel.filter_menu:EnableKeyboard(true)
MainPanel.filter_menu:SetMovable(false)
MainPanel.filter_menu:SetHitRectInsets(5, 5, 5, 5)
MainPanel.filter_menu:Hide()

-- Set all the current options in the filter menu to make sure they are consistent with the SV options.
MainPanel.filter_menu:SetScript("OnShow",
				function()
					for filter, info in pairs(FilterValueMap) do
						if info.svroot then
							info.cb:SetChecked(info.svroot[filter])
						end
					end
					-- Miscellaneous Options
					ARL_IgnoreCB:SetChecked(addon.db.profile.ignoreexclusionlist)
				end)

MainPanel.filter_menu.texture = MainPanel.filter_menu:CreateTexture(nil, "ARTWORK")
MainPanel.filter_menu.texture:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\fly_2col")
MainPanel.filter_menu.texture:SetAllPoints(MainPanel.filter_menu)
MainPanel.filter_menu.texture:SetTexCoord(0, (FILTERMENU_DOUBLE_WIDTH/256), 0, (FILTERMENU_HEIGHT/512))

-------------------------------------------------------------------------------
-- Function to initialize a check-button with the given values. Used in all of
-- the sub-menus of MainPanel.filter_menu
-------------------------------------------------------------------------------
local InitializeCheckButton
do
	local PUSHDOWN = {
		["cloak"]	= true,
		["necklace"]	= true,
		["ring"]	= true,
		["trinket"]	= true,
		["shield"]	= true,
	}
	function InitializeCheckButton(cButton, anchorFrame, ttText, scriptVal, row, col, misc)
		-- set the position of the new checkbox
		local xPos = 2 + ((col - 1) * 100)
		local yPos = -3 - ((row - 1) * 17)

		if PUSHDOWN[scriptVal] then
			yPos = yPos - 5
		end
		cButton:SetPoint("TOPLEFT", anchorFrame, "TOPLEFT", xPos, yPos)
		cButton:SetHeight(24)
		cButton:SetWidth(24)

		cButton:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
		cButton:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
		cButton:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
		cButton:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		cButton:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

		cButton.text = cButton:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
		cButton.text:SetPoint("LEFT", cButton, "RIGHT", 0, 0)

		-- depending if we're on the misc panel or not, set an alternative OnClick method
		if misc == 0 then
			cButton:SetScript("OnClick",
					  function()
						  FilterValueMap[scriptVal].svroot[scriptVal] = FilterValueMap[scriptVal].cb:GetChecked() and true or false
						  MainPanel:UpdateTitle()
						  ListFrame:Update(nil, false)
					  end)
		else
			cButton:SetScript("OnClick",
					  function()
						  addon.db.profile.ignoreexclusionlist = not addon.db.profile.ignoreexclusionlist
						  ListFrame:Update(nil, false)
					  end)
		end
		SetTooltipScripts(cButton, ttText, 1)
	end
end	-- do

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.general, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.general = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.general:SetWidth(FILTERMENU_SMALL)
MainPanel.filter_menu.general:SetHeight(280)
MainPanel.filter_menu.general:EnableMouse(true)
MainPanel.filter_menu.general:EnableKeyboard(true)
MainPanel.filter_menu.general:SetMovable(false)
MainPanel.filter_menu.general:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.general:Hide()

-------------------------------------------------------------------------------
-- Create the CheckButtons for MainPanel.filter_menu.general
-------------------------------------------------------------------------------
MainPanel.filter_menu.general.specialty = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.specialty, MainPanel.filter_menu.general, L["SPECIALTY_DESC"], "specialty", 1, 1, 0)
MainPanel.filter_menu.general.specialty.text:SetText(L["Specialties"])

MainPanel.filter_menu.general.skill = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.skill, MainPanel.filter_menu.general, L["SKILL_DESC"], "skill", 1, 2, 0)
MainPanel.filter_menu.general.skill.text:SetText(_G.SKILL)

MainPanel.filter_menu.general.faction = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.faction, MainPanel.filter_menu.general, L["FACTION_DESC"], "faction", 2, 1, 0)
MainPanel.filter_menu.general.faction.text:SetText(_G.FACTION)

MainPanel.filter_menu.general.known = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.known, MainPanel.filter_menu.general, L["KNOWN_DESC"], "known", 2, 2, 0)
MainPanel.filter_menu.general.known.text:SetText(L["Show Known"])

MainPanel.filter_menu.general.unknown = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.unknown, MainPanel.filter_menu.general, L["UNKNOWN_DESC"], "unknown", 3, 1, 0)
MainPanel.filter_menu.general.unknown.text:SetText(_G.UNKNOWN)

MainPanel.filter_menu.general.retired = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.retired, MainPanel.filter_menu.general, L["RETIRED_DESC"], "retired", 3, 2, 0)
MainPanel.filter_menu.general.retired.text:SetText(L["Retired"])

-------------------------------------------------------------------------------
-- Create the Class toggle and CheckButtons for MainPanel.filter_menu.general
-------------------------------------------------------------------------------
MainPanel.filter_menu.general.class_toggle = GenericCreateButton(nil, MainPanel.filter_menu.general, 20, 105, "GameFontHighlight", "GameFontHighlightSmall",
								 L["Classes"] .. ":", "LEFT", L["CLASS_TEXT_DESC"], 0)
MainPanel.filter_menu.general.class_toggle:SetPoint("TOPLEFT", MainPanel.filter_menu.general.unknown, "BOTTOMLEFT", -4, -10)
MainPanel.filter_menu.general.class_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
MainPanel.filter_menu.general.class_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
MainPanel.filter_menu.general.class_toggle:SetScript("OnClick",
						     function(self, button)
							     local classes = addon.db.profile.filters.classes
							     local general = MainPanel.filter_menu.general
							     local toggle = (button == "LeftButton") and true or false

							     for class in pairs(classes) do
								     classes[class] = toggle
								     general[class]:SetChecked(toggle)
							     end

							     if toggle == false then
								     local class = strlower(Player["Class"])
								     classes[class] = true
								     general[class]:SetChecked(true)
							     end
							     MainPanel:UpdateTitle()
							     ListFrame:Update(nil, false)
						     end)

MainPanel.filter_menu.general.deathknight = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.deathknight, MainPanel.filter_menu.general, L["CLASS_DESC"], "deathknight", 6, 1, 0)
MainPanel.filter_menu.general.deathknight.text:SetText(LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"])

MainPanel.filter_menu.general.druid = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.druid, MainPanel.filter_menu.general, L["CLASS_DESC"], "druid", 6, 2, 0)
MainPanel.filter_menu.general.druid.text:SetText(LOCALIZED_CLASS_NAMES_MALE["DRUID"])

MainPanel.filter_menu.general.hunter = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.hunter, MainPanel.filter_menu.general, L["CLASS_DESC"], "hunter", 7, 1, 0)
MainPanel.filter_menu.general.hunter.text:SetText(LOCALIZED_CLASS_NAMES_MALE["HUNTER"])

MainPanel.filter_menu.general.mage = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.mage, MainPanel.filter_menu.general, L["CLASS_DESC"], "mage", 7, 2, 0)
MainPanel.filter_menu.general.mage.text:SetText(LOCALIZED_CLASS_NAMES_MALE["MAGE"])

MainPanel.filter_menu.general.paladin = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.paladin, MainPanel.filter_menu.general, L["CLASS_DESC"], "paladin", 8, 1, 0)
MainPanel.filter_menu.general.paladin.text:SetText(LOCALIZED_CLASS_NAMES_MALE["PALADIN"])

MainPanel.filter_menu.general.priest = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.priest, MainPanel.filter_menu.general, L["CLASS_DESC"], "priest", 8, 2, 0)
MainPanel.filter_menu.general.priest.text:SetText(LOCALIZED_CLASS_NAMES_MALE["PRIEST"])

MainPanel.filter_menu.general.rogue = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.rogue, MainPanel.filter_menu.general, L["CLASS_DESC"], "rogue", 9, 1, 0)
MainPanel.filter_menu.general.rogue.text:SetText(LOCALIZED_CLASS_NAMES_MALE["ROGUE"])

MainPanel.filter_menu.general.shaman = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.shaman, MainPanel.filter_menu.general, L["CLASS_DESC"], "shaman", 9, 2, 0)
MainPanel.filter_menu.general.shaman.text:SetText(LOCALIZED_CLASS_NAMES_MALE["SHAMAN"])

MainPanel.filter_menu.general.warlock = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.warlock, MainPanel.filter_menu.general, L["CLASS_DESC"], "warlock", 10, 1, 0)
MainPanel.filter_menu.general.warlock.text:SetText(LOCALIZED_CLASS_NAMES_MALE["WARLOCK"])

MainPanel.filter_menu.general.warrior = CreateFrame("CheckButton", nil, MainPanel.filter_menu.general)
InitializeCheckButton(MainPanel.filter_menu.general.warrior, MainPanel.filter_menu.general, L["CLASS_DESC"], "warrior", 10, 2, 0)
MainPanel.filter_menu.general.warrior.text:SetText(LOCALIZED_CLASS_NAMES_MALE["WARRIOR"])

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.obtain, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.obtain = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.obtain:SetWidth(FILTERMENU_SMALL)
MainPanel.filter_menu.obtain:SetHeight(280)
MainPanel.filter_menu.obtain:EnableMouse(true)
MainPanel.filter_menu.obtain:EnableKeyboard(true)
MainPanel.filter_menu.obtain:SetMovable(false)
MainPanel.filter_menu.obtain:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.obtain:Hide()

-------------------------------------------------------------------------------
-- Create the CheckButtons for MainPanel.filter_menu.obtain
-------------------------------------------------------------------------------
MainPanel.filter_menu.obtain.instance = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.instance, MainPanel.filter_menu.obtain, L["INSTANCE_DESC"], "instance", 1, 1, 0)
MainPanel.filter_menu.obtain.instance.text:SetText(_G.INSTANCE)

MainPanel.filter_menu.obtain.raid = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.raid, MainPanel.filter_menu.obtain, L["RAID_DESC"], "raid", 1, 2, 0)
MainPanel.filter_menu.obtain.raid.text:SetText(_G.RAID)

MainPanel.filter_menu.obtain.quest = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.quest, MainPanel.filter_menu.obtain, L["QUEST_DESC"], "quest", 2, 1, 0)
MainPanel.filter_menu.obtain.quest.text:SetText(L["Quest"])

MainPanel.filter_menu.obtain.seasonal = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.seasonal, MainPanel.filter_menu.obtain, L["SEASONAL_DESC"], "seasonal", 2, 2, 0)
MainPanel.filter_menu.obtain.seasonal.text:SetText(private.acquire_names[A.SEASONAL])

MainPanel.filter_menu.obtain.trainer = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.trainer, MainPanel.filter_menu.obtain, L["TRAINER_DESC"], "trainer", 3, 1, 0)
MainPanel.filter_menu.obtain.trainer.text:SetText(L["Trainer"])

MainPanel.filter_menu.obtain.vendor = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.vendor, MainPanel.filter_menu.obtain, L["VENDOR_DESC"], "vendor", 3, 2, 0)
MainPanel.filter_menu.obtain.vendor.text:SetText(L["Vendor"])

MainPanel.filter_menu.obtain.pvp = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.pvp, MainPanel.filter_menu.obtain, L["PVP_DESC"], "pvp", 4, 1, 0)
MainPanel.filter_menu.obtain.pvp.text:SetText(_G.PVP)

MainPanel.filter_menu.obtain.discovery = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.discovery, MainPanel.filter_menu.obtain, L["DISCOVERY_DESC"], "discovery", 4, 2, 0)
MainPanel.filter_menu.obtain.discovery.text:SetText(L["Discovery"])

MainPanel.filter_menu.obtain.worlddrop = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.worlddrop, MainPanel.filter_menu.obtain, L["WORLD_DROP_DESC"], "worlddrop", 5, 1, 0)
MainPanel.filter_menu.obtain.worlddrop.text:SetText(L["World Drop"])

MainPanel.filter_menu.obtain.mobdrop = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.mobdrop, MainPanel.filter_menu.obtain, L["MOB_DROP_DESC"], "mobdrop", 5, 2, 0)
MainPanel.filter_menu.obtain.mobdrop.text:SetText(L["Mob Drop"])

MainPanel.filter_menu.obtain.originalwow = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.originalwow, MainPanel.filter_menu.obtain, L["ORIGINAL_WOW_DESC"], "originalwow", 7, 1, 0)
MainPanel.filter_menu.obtain.originalwow.text:SetText(_G.EXPANSION_NAME0)

MainPanel.filter_menu.obtain.bc = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.bc, MainPanel.filter_menu.obtain, L["BC_WOW_DESC"], "bc", 8, 1, 0)
MainPanel.filter_menu.obtain.bc.text:SetText(_G.EXPANSION_NAME1)

MainPanel.filter_menu.obtain.wrath = CreateFrame("CheckButton", nil, MainPanel.filter_menu.obtain)
InitializeCheckButton(MainPanel.filter_menu.obtain.wrath, MainPanel.filter_menu.obtain, L["LK_WOW_DESC"], "wrath", 9, 1, 0)
MainPanel.filter_menu.obtain.wrath.text:SetText(_G.EXPANSION_NAME2)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.binding, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.binding = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.binding:SetWidth(FILTERMENU_LARGE)
MainPanel.filter_menu.binding:SetHeight(280)
MainPanel.filter_menu.binding:EnableMouse(true)
MainPanel.filter_menu.binding:EnableKeyboard(true)
MainPanel.filter_menu.binding:SetMovable(false)
MainPanel.filter_menu.binding:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.binding:Hide()

-------------------------------------------------------------------------------
-- Create the CheckButtons for MainPanel.filter_menu.binding
-------------------------------------------------------------------------------
MainPanel.filter_menu.binding.itemboe = CreateFrame("CheckButton", nil, MainPanel.filter_menu.binding)
InitializeCheckButton(MainPanel.filter_menu.binding.itemboe, MainPanel.filter_menu.binding, L["BOE_DESC"], "itemboe", 1, 1, 0)
MainPanel.filter_menu.binding.itemboe.text:SetText(L["BOEFilter"])

MainPanel.filter_menu.binding.itembop = CreateFrame("CheckButton", nil, MainPanel.filter_menu.binding)
InitializeCheckButton(MainPanel.filter_menu.binding.itembop, MainPanel.filter_menu.binding, L["BOP_DESC"], "itembop", 2, 1, 0)
MainPanel.filter_menu.binding.itembop.text:SetText(L["BOPFilter"])

MainPanel.filter_menu.binding.recipeboe = CreateFrame("CheckButton", nil, MainPanel.filter_menu.binding)
InitializeCheckButton(MainPanel.filter_menu.binding.recipeboe, MainPanel.filter_menu.binding, L["RECIPE_BOE_DESC"], "recipeboe", 3, 1, 0)
MainPanel.filter_menu.binding.recipeboe.text:SetText(L["RecipeBOEFilter"])

MainPanel.filter_menu.binding.recipebop = CreateFrame("CheckButton", nil, MainPanel.filter_menu.binding)
InitializeCheckButton(MainPanel.filter_menu.binding.recipebop, MainPanel.filter_menu.binding, L["RECIPE_BOP_DESC"], "recipebop", 4, 1, 0)
MainPanel.filter_menu.binding.recipebop.text:SetText(L["RecipeBOPFilter"])

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.item, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.item = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.item:SetWidth(FILTERMENU_LARGE)
MainPanel.filter_menu.item:SetHeight(280)
MainPanel.filter_menu.item:EnableMouse(true)
MainPanel.filter_menu.item:EnableKeyboard(true)
MainPanel.filter_menu.item:SetMovable(false)
MainPanel.filter_menu.item:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.item:Hide()

-------------------------------------------------------------------------------
-- Create the Armor toggle and CheckButtons for MainPanel.filter_menu.item
-------------------------------------------------------------------------------
MainPanel.filter_menu.item.armor_toggle = GenericCreateButton(nil, MainPanel.filter_menu.item, 20, 105, "GameFontHighlight", "GameFontHighlightSmall", _G.ARMOR .. ":",
							      "LEFT", L["ARMOR_TEXT_DESC"], 0)
MainPanel.filter_menu.item.armor_toggle:SetPoint("TOPLEFT", MainPanel.filter_menu.item, "TOPLEFT", -2, -4)
MainPanel.filter_menu.item.armor_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
MainPanel.filter_menu.item.armor_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
MainPanel.filter_menu.item.armor_toggle:SetScript("OnClick",
						  function(self, button)
							  local armors = addon.db.profile.filters.item.armor
							  local items = MainPanel.filter_menu.item
							  local toggle = (button == "LeftButton") and true or false

							  for armor in pairs(armors) do
								  armors[armor] = toggle
								  items[armor]:SetChecked(toggle)
							  end
							  MainPanel:UpdateTitle()
							  ListFrame:Update(nil, false)
						  end)

MainPanel.filter_menu.item.cloth = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.cloth, MainPanel.filter_menu.item, L["CLOTH_DESC"], "cloth", 2, 1, 0)
MainPanel.filter_menu.item.cloth.text:SetText(L["Cloth"])

MainPanel.filter_menu.item.leather = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.leather, MainPanel.filter_menu.item, L["LEATHER_DESC"], "leather", 2, 2, 0)
MainPanel.filter_menu.item.leather.text:SetText(L["Leather"])

MainPanel.filter_menu.item.mail = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.mail, MainPanel.filter_menu.item, L["MAIL_DESC"], "mail", 3, 1, 0)
MainPanel.filter_menu.item.mail.text:SetText(L["Mail"])

MainPanel.filter_menu.item.plate = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.plate, MainPanel.filter_menu.item, L["PLATE_DESC"], "plate", 3, 2, 0)
MainPanel.filter_menu.item.plate.text:SetText(L["Plate"])

MainPanel.filter_menu.item.cloak = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.cloak, MainPanel.filter_menu.item, L["CLOAK_DESC"], "cloak", 4, 1, 0)
MainPanel.filter_menu.item.cloak.text:SetText(L["Cloak"])

MainPanel.filter_menu.item.necklace = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.necklace, MainPanel.filter_menu.item, L["NECKLACE_DESC"], "necklace", 4, 2, 0)
MainPanel.filter_menu.item.necklace.text:SetText(L["Necklace"])

MainPanel.filter_menu.item.ring = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.ring, MainPanel.filter_menu.item, L["RING_DESC"], "ring", 5, 1, 0)
MainPanel.filter_menu.item.ring.text:SetText(L["Ring"])

MainPanel.filter_menu.item.trinket = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.trinket, MainPanel.filter_menu.item, L["TRINKET_DESC"], "trinket", 5, 2, 0)
MainPanel.filter_menu.item.trinket.text:SetText(L["Trinket"])

MainPanel.filter_menu.item.shield = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.shield, MainPanel.filter_menu.item, L["SHIELD_DESC"], "shield", 6, 1, 0)
MainPanel.filter_menu.item.shield.text:SetText(L["Shield"])

-------------------------------------------------------------------------------
-- Create the Weapon toggle and CheckButtons for MainPanel.filter_menu.item
-------------------------------------------------------------------------------
MainPanel.filter_menu.item.weapon_toggle = GenericCreateButton(nil, MainPanel.filter_menu.item, 20, 105, "GameFontHighlight", "GameFontHighlightSmall", L["Weapon"] .. ":",
							       "LEFT", L["WEAPON_TEXT_DESC"], 0)
MainPanel.filter_menu.item.weapon_toggle:SetPoint("TOPLEFT", MainPanel.filter_menu.item, "TOPLEFT", -2, -122)

MainPanel.filter_menu.item.weapon_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
MainPanel.filter_menu.item.weapon_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
MainPanel.filter_menu.item.weapon_toggle:SetScript("OnClick",
						   function(self, button)
							   local weapons = addon.db.profile.filters.item.weapon
							   local items = MainPanel.filter_menu.item
							   local toggle = (button == "LeftButton") and true or false

							   for weapon in pairs(weapons) do
								   weapons[weapon] = toggle

								   if FilterValueMap[weapon].svroot then
									   items[weapon]:SetChecked(toggle)
								   end
							   end
							   MainPanel:UpdateTitle()
							   ListFrame:Update(nil, false)
						   end)

MainPanel.filter_menu.item.onehand = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.onehand, MainPanel.filter_menu.item, L["ONEHAND_DESC"], "onehand", 9, 1, 0)
MainPanel.filter_menu.item.onehand.text:SetText(L["One Hand"])

MainPanel.filter_menu.item.twohand = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.twohand, MainPanel.filter_menu.item, L["TWOHAND_DESC"], "twohand", 9, 2, 0)
MainPanel.filter_menu.item.twohand.text:SetText(L["Two Hand"])

MainPanel.filter_menu.item.dagger = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.dagger, MainPanel.filter_menu.item, L["DAGGER_DESC"], "dagger", 10, 1, 0)
MainPanel.filter_menu.item.dagger.text:SetText(L["Dagger"])

MainPanel.filter_menu.item.axe = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.axe, MainPanel.filter_menu.item, L["AXE_DESC"], "axe", 10, 2, 0)
MainPanel.filter_menu.item.axe.text:SetText(L["Axe"])

MainPanel.filter_menu.item.mace = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.mace, MainPanel.filter_menu.item, L["MACE_DESC"], "mace", 11, 1, 0)
MainPanel.filter_menu.item.mace.text:SetText(L["Mace"])

MainPanel.filter_menu.item.sword = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.sword, MainPanel.filter_menu.item, L["SWORD_DESC"], "sword", 11, 2, 0)
MainPanel.filter_menu.item.sword.text:SetText(L["Sword"])

MainPanel.filter_menu.item.polearm = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.polearm, MainPanel.filter_menu.item, L["POLEARM_DESC"], "polearm", 12, 1, 0)
MainPanel.filter_menu.item.polearm.text:SetText(L["Polearm"])

MainPanel.filter_menu.item.fist = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.fist, MainPanel.filter_menu.item, L["FIST_DESC"], "fist", 12, 2, 0)
MainPanel.filter_menu.item.fist.text:SetText(L["Fist"])

MainPanel.filter_menu.item.staff = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.staff, MainPanel.filter_menu.item, L["STAFF_DESC"], "staff", 13, 1, 0)
MainPanel.filter_menu.item.staff.text:SetText(SetTextColor(BASIC_COLORS["grey"], L["Staff"]))
MainPanel.filter_menu.item.staff:Disable()

MainPanel.filter_menu.item.wand = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.wand, MainPanel.filter_menu.item, L["WAND_DESC"], "wand", 13, 2, 0)
MainPanel.filter_menu.item.wand.text:SetText(L["Wand"])

MainPanel.filter_menu.item.thrown = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.thrown, MainPanel.filter_menu.item, L["THROWN_DESC"], "thrown", 14, 1, 0)
MainPanel.filter_menu.item.thrown.text:SetText(L["Thrown"])

MainPanel.filter_menu.item.bow = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.bow, MainPanel.filter_menu.item, L["BOW_DESC"], "bow", 14, 2, 0)
MainPanel.filter_menu.item.bow.text:SetText(SetTextColor(BASIC_COLORS["grey"], L["Bow"]))
MainPanel.filter_menu.item.bow:Disable()

MainPanel.filter_menu.item.crossbow = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.crossbow, MainPanel.filter_menu.item, L["CROSSBOW_DESC"], "crossbow", 15, 1, 0)
MainPanel.filter_menu.item.crossbow.text:SetText(SetTextColor(BASIC_COLORS["grey"], L["Crossbow"]))
MainPanel.filter_menu.item.crossbow:Disable()

MainPanel.filter_menu.item.ammo = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.ammo, MainPanel.filter_menu.item, L["AMMO_DESC"], "ammo", 15, 2, 0)
MainPanel.filter_menu.item.ammo.text:SetText(L["Ammo"])

MainPanel.filter_menu.item.gun = CreateFrame("CheckButton", nil, MainPanel.filter_menu.item)
InitializeCheckButton(MainPanel.filter_menu.item.gun, MainPanel.filter_menu.item, L["GUN_DESC"], "gun", 16, 1, 0)
MainPanel.filter_menu.item.gun.text:SetText(L["Gun"])

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.quality, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.quality = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.quality:SetWidth(FILTERMENU_SMALL)
MainPanel.filter_menu.quality:SetHeight(280)
MainPanel.filter_menu.quality:EnableMouse(true)
MainPanel.filter_menu.quality:EnableKeyboard(true)
MainPanel.filter_menu.quality:SetMovable(false)
MainPanel.filter_menu.quality:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.quality:Hide()

-------------------------------------------------------------------------------
-- Create the CheckButtons for MainPanel.filter_menu.quality
-------------------------------------------------------------------------------
MainPanel.filter_menu.quality.common = CreateFrame("CheckButton", nil, MainPanel.filter_menu.quality)
InitializeCheckButton(MainPanel.filter_menu.quality.common, MainPanel.filter_menu.quality, string.format(L["QUALITY_GENERAL_DESC"], _G.ITEM_QUALITY1_DESC), "common", 1, 1, 0)
MainPanel.filter_menu.quality.common.text:SetText(_G.ITEM_QUALITY1_DESC)

MainPanel.filter_menu.quality.uncommon = CreateFrame("CheckButton", nil, MainPanel.filter_menu.quality)
InitializeCheckButton(MainPanel.filter_menu.quality.uncommon, MainPanel.filter_menu.quality, string.format(L["QUALITY_GENERAL_DESC"], _G.ITEM_QUALITY2_DESC), "uncommon", 2, 1, 0)
MainPanel.filter_menu.quality.uncommon.text:SetText(_G.ITEM_QUALITY2_DESC)

MainPanel.filter_menu.quality.rare = CreateFrame("CheckButton", nil, MainPanel.filter_menu.quality)
InitializeCheckButton(MainPanel.filter_menu.quality.rare, MainPanel.filter_menu.quality, string.format(L["QUALITY_GENERAL_DESC"], _G.ITEM_QUALITY3_DESC), "rare", 3, 1, 0)
MainPanel.filter_menu.quality.rare.text:SetText(_G.ITEM_QUALITY3_DESC)

MainPanel.filter_menu.quality.epic = CreateFrame("CheckButton", nil, MainPanel.filter_menu.quality)
InitializeCheckButton(MainPanel.filter_menu.quality.epic, MainPanel.filter_menu.quality, string.format(L["QUALITY_GENERAL_DESC"], _G.ITEM_QUALITY4_DESC), "epic", 4, 1, 0)
MainPanel.filter_menu.quality.epic.text:SetText(_G.ITEM_QUALITY4_DESC)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.player, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.player = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.player:SetWidth(FILTERMENU_SMALL)
MainPanel.filter_menu.player:SetHeight(280)
MainPanel.filter_menu.player:EnableMouse(true)
MainPanel.filter_menu.player:EnableKeyboard(true)
MainPanel.filter_menu.player:SetMovable(false)
MainPanel.filter_menu.player:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.player:Hide()

-------------------------------------------------------------------------------
-- Create the CheckButtons for MainPanel.filter_menu.player
-------------------------------------------------------------------------------
MainPanel.filter_menu.player.tank = CreateFrame("CheckButton", nil, MainPanel.filter_menu.player)
InitializeCheckButton(MainPanel.filter_menu.player.tank, MainPanel.filter_menu.player, L["TANKS_DESC"], "tank", 1, 1, 0)
MainPanel.filter_menu.player.tank.text:SetText(_G.TANK)

MainPanel.filter_menu.player.melee = CreateFrame("CheckButton", nil, MainPanel.filter_menu.player)
InitializeCheckButton(MainPanel.filter_menu.player.melee, MainPanel.filter_menu.player, L["MELEE_DPS_DESC"], "melee", 2, 1, 0)
MainPanel.filter_menu.player.melee.text:SetText(_G.MELEE)

MainPanel.filter_menu.player.healer = CreateFrame("CheckButton", nil, MainPanel.filter_menu.player)
InitializeCheckButton(MainPanel.filter_menu.player.healer, MainPanel.filter_menu.player, L["HEALERS_DESC"], "healer", 3, 1, 0)
MainPanel.filter_menu.player.healer.text:SetText(_G.HEALER)

MainPanel.filter_menu.player.caster = CreateFrame("CheckButton", nil, MainPanel.filter_menu.player)
InitializeCheckButton(MainPanel.filter_menu.player.caster, MainPanel.filter_menu.player, L["CASTER_DPS_DESC"], "caster", 4, 1, 0)
MainPanel.filter_menu.player.caster.text:SetText(_G.DAMAGER)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.rep, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.rep = CreateFrame("Frame", nil, MainPanel.filter_menu)
MainPanel.filter_menu.rep:SetWidth(FILTERMENU_SMALL)
MainPanel.filter_menu.rep:SetHeight(280)
MainPanel.filter_menu.rep:EnableMouse(true)
MainPanel.filter_menu.rep:EnableKeyboard(true)
MainPanel.filter_menu.rep:SetMovable(false)
MainPanel.filter_menu.rep:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
MainPanel.filter_menu.rep:Hide()

-------------------------------------------------------------------------------
-- Create the expansion toggles for MainPanel.filter_menu.rep
-------------------------------------------------------------------------------
do
	-------------------------------------------------------------------------------
	-- Generic function to create expansion buttons in MainPanel.filter_menu.rep
	-------------------------------------------------------------------------------
	local function CreateExpansionButton(texture, tooltip_text)
		local cButton = CreateFrame("CheckButton", nil, MainPanel.filter_menu.rep)
		cButton:SetWidth(100)
		cButton:SetHeight(46)
		cButton:SetChecked(false)

		local iconTex = cButton:CreateTexture(nil, "BORDER")

		if texture == "wotlk_logo" then
			iconTex:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\" .. texture)
		else
			iconTex:SetTexture('Interface/Glues/Common/' .. texture)
		end
		iconTex:SetWidth(100)
		iconTex:SetHeight(46)
		iconTex:SetAllPoints(cButton)

		local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
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
		SetTooltipScripts(cButton, tooltip_text)

		return cButton
	end

	-------------------------------------------------------------------------------
	-- Rep Filtering panel switcher
	-------------------------------------------------------------------------------
	local function RepFilterSwitch(whichrep)
		-- 1	MainPanel.filter_menu.rep.toggle_originalwow		Classic Rep
		-- 2	MainPanel.filter_menu.rep.toggle_bc			Burning Crusade
		-- 3	MainPanel.filter_menu.rep.toggle_wrath			Wrath of the Lich King
		local ShowPanel = false

		if whichrep == 1 then
			if MainPanel.filter_menu.rep.toggle_originalwow:GetChecked() then
				ShowPanel = true
				MainPanel.filter_menu.rep.Classic:Show()
				MainPanel.filter_menu.rep.BC:Hide()
				MainPanel.filter_menu.rep.LK:Hide()
				MainPanel.filter_menu.rep.toggle_bc:SetChecked(false)
				MainPanel.filter_menu.rep.toggle_wrath:SetChecked(false)
			else
				ShowPanel = false
			end
		elseif whichrep == 2 then
			if MainPanel.filter_menu.rep.toggle_bc:GetChecked() then
				ShowPanel = true
				MainPanel.filter_menu.rep.Classic:Hide()
				MainPanel.filter_menu.rep.BC:Show()
				MainPanel.filter_menu.rep.LK:Hide()
				MainPanel.filter_menu.rep.toggle_originalwow:SetChecked(false)
				MainPanel.filter_menu.rep.toggle_wrath:SetChecked(false)
			else
				ShowPanel = false
			end
		else -- whichrep == 3 (WotLK)
			if MainPanel.filter_menu.rep.toggle_wrath:GetChecked() then
				ShowPanel = true
				MainPanel.filter_menu.rep.Classic:Hide()
				MainPanel.filter_menu.rep.BC:Hide()
				MainPanel.filter_menu.rep.LK:Show()
				MainPanel.filter_menu.rep.toggle_originalwow:SetChecked(false)
				MainPanel.filter_menu.rep.toggle_bc:SetChecked(false)
			else
				ShowPanel = false
			end
		end
		local texture = MainPanel.filter_menu.texture
		texture:ClearAllPoints()

		if ShowPanel then
			MainPanel.filter_menu:SetWidth(FILTERMENU_DOUBLE_WIDTH)

			texture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_repcol]])
			texture:SetAllPoints(MainPanel.filter_menu)
			texture:SetTexCoord(0, (FILTERMENU_DOUBLE_WIDTH/512), 0, (FILTERMENU_HEIGHT/512))

			MainPanel.filter_menu.rep.Classic:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -7, -14)
			MainPanel.filter_menu.rep.BC:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -7, -14)
			MainPanel.filter_menu.rep.LK:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -7, -14)
		else
			MainPanel.filter_menu:SetWidth(FILTERMENU_SINGLE_WIDTH)

			texture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_1col]])
			texture:SetAllPoints(MainPanel.filter_menu)
			texture:SetTexCoord(0, (FILTERMENU_SINGLE_WIDTH/256), 0, (FILTERMENU_HEIGHT/512))

			MainPanel.filter_menu.rep.Classic:Hide()
			MainPanel.filter_menu.rep.BC:Hide()
			MainPanel.filter_menu.rep.LK:Hide()

			MainPanel.filter_menu.rep.toggle_originalwow:SetChecked(false)
			MainPanel.filter_menu.rep.toggle_bc:SetChecked(false)
			MainPanel.filter_menu.rep.toggle_wrath:SetChecked(false)
		end
	end
	MainPanel.filter_menu.rep.toggle_originalwow = CreateExpansionButton("Glues-WoW-Logo", L["FILTERING_OLDWORLD_DESC"])
	MainPanel.filter_menu.rep.toggle_originalwow:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -10)
	MainPanel.filter_menu.rep.toggle_originalwow:SetScript("OnClick",
				    function()
					    RepFilterSwitch(1)
				    end)

	MainPanel.filter_menu.rep.toggle_bc = CreateExpansionButton("GLUES-WOW-BCLOGO", L["FILTERING_BC_DESC"])
	MainPanel.filter_menu.rep.toggle_bc:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -60)
	MainPanel.filter_menu.rep.toggle_bc:SetScript("OnClick",
						      function()
							      RepFilterSwitch(2)
						      end)

	MainPanel.filter_menu.rep.toggle_wrath = CreateExpansionButton("wotlk_logo", L["FILTERING_WOTLK_DESC"])
	MainPanel.filter_menu.rep.toggle_wrath:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -110)
	MainPanel.filter_menu.rep.toggle_wrath:SetScript("OnClick",
							 function()
								 RepFilterSwitch(3)
							 end)
end	-- do

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.rep.Classic, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.rep.Classic = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
MainPanel.filter_menu.rep.Classic:SetWidth(150)
MainPanel.filter_menu.rep.Classic:SetHeight(280)
MainPanel.filter_menu.rep.Classic:EnableMouse(true)
MainPanel.filter_menu.rep.Classic:EnableKeyboard(true)
MainPanel.filter_menu.rep.Classic:SetMovable(false)
MainPanel.filter_menu.rep.Classic:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -7, -16)
MainPanel.filter_menu.rep.Classic:Hide()

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.rep.BC, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.rep.BC = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
MainPanel.filter_menu.rep.BC:SetWidth(150)
MainPanel.filter_menu.rep.BC:SetHeight(280)
MainPanel.filter_menu.rep.BC:EnableMouse(true)
MainPanel.filter_menu.rep.BC:EnableKeyboard(true)
MainPanel.filter_menu.rep.BC:SetMovable(false)
MainPanel.filter_menu.rep.BC:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -7, -16)
MainPanel.filter_menu.rep.BC:Hide()

-------------------------------------------------------------------------------
-- Create MainPanel.filter_menu.rep.LK, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_menu.rep.LK = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
MainPanel.filter_menu.rep.LK:SetWidth(150)
MainPanel.filter_menu.rep.LK:SetHeight(280)
MainPanel.filter_menu.rep.LK:EnableMouse(true)
MainPanel.filter_menu.rep.LK:EnableKeyboard(true)
MainPanel.filter_menu.rep.LK:SetMovable(false)
MainPanel.filter_menu.rep.LK:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -7, -16)
MainPanel.filter_menu.rep.LK:Hide()


-------------------------------------------------------------------------------
-- Create the ListFrame and set its scripts.
-------------------------------------------------------------------------------
ListFrame = CreateFrame("Frame", "ARL_MainPanelScrollFrame", MainPanel)

MainPanel.scroll_frame = ListFrame

ListFrame:SetHeight(322)
ListFrame:SetWidth(243)
ListFrame:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 20, -97)

ListFrame:EnableMouse(true)
ListFrame:EnableMouseWheel(true)

ListFrame.entries = {}
ListFrame.button_containers = {}
ListFrame.state_buttons = {}
ListFrame.entry_buttons = {}

-------------------------------------------------------------------------------
-- Create ListFrame.scroll_bar, and set its scripts.
-------------------------------------------------------------------------------
local ScrollBar = CreateFrame("Slider", nil, ListFrame)

ScrollBar:SetPoint("TOPLEFT", ListFrame, "TOPRIGHT", 2, -14)
ScrollBar:SetPoint("BOTTOMLEFT", ListFrame, "BOTTOMRIGHT", 2, 16)
ScrollBar:SetWidth(24)

ScrollBar:EnableMouseWheel(true)
ScrollBar:SetOrientation("VERTICAL")

ScrollBar:SetBackdrop({
			      bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
			      edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
			      tile = true,
			      tileSize = 8,
			      edgeSize = 8,
			      insets = {
				      left = 3,
				      right = 3,
				      top = 3,
				      bottom = 3
			      }
		      })
ScrollBar:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
ScrollBar:SetMinMaxValues(0, 1)
ScrollBar:SetValueStep(1)

ListFrame.scroll_bar = ScrollBar

-------------------------------------------------------------------------------
-- Create ListFrame.button_up, then set its scripts and textures.
-- Parented to ScrollBar so it hides simultaneously.
-------------------------------------------------------------------------------
local ScrollUpButton = CreateFrame("Button", nil, ScrollBar, "UIPanelScrollUpButtonTemplate")

ScrollUpButton:SetHeight(18)
ScrollUpButton:SetWidth(20)
ScrollUpButton:SetPoint("TOPLEFT", ListFrame, "TOPRIGHT", 4, 1)

-------------------------------------------------------------------------------
-- Create ListFrame.button_down, then set its scripts and textures.
-- Parented to ScrollBar so it hides simultaneously.
-------------------------------------------------------------------------------
local ScrollDownButton = CreateFrame("Button", nil, ScrollBar,"UIPanelScrollDownButtonTemplate")

ScrollDownButton:SetHeight(18)
ScrollDownButton:SetWidth(20)
ScrollDownButton:SetPoint("BOTTOMLEFT", ListFrame, "BOTTOMRIGHT", 4, -1)

do
	-- Number of visible lines in the scrollframe.
	local NUM_RECIPE_LINES = 24
	local SCROLL_DEPTH = 5

	local highlight = CreateFrame("Frame", nil, UIParent)
	highlight:SetFrameStrata("TOOLTIP")
	highlight:Hide()

	highlight._texture = highlight:CreateTexture(nil, "OVERLAY")
	highlight._texture:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
	highlight._texture:SetBlendMode("ADD")
	highlight._texture:SetAllPoints(highlight)

	local function ScrollBar_Scroll(delta)
		local cur_val = ScrollBar:GetValue()
		local min_val, max_val = ScrollBar:GetMinMaxValues()

		if delta < 0 and cur_val < max_val then
			cur_val = math.min(max_val, cur_val + SCROLL_DEPTH)
			ScrollBar:SetValue(cur_val)
		elseif delta > 0 and cur_val > min_val then
			cur_val = math.max(min_val, cur_val - SCROLL_DEPTH)
			ScrollBar:SetValue(cur_val)
		end
	end

	ScrollUpButton:SetScript("OnClick",
				 function(self, button, down)
					 ScrollBar_Scroll(1)
				 end)

	ScrollDownButton:SetScript("OnClick",
				 function(self, button, down)
					 ScrollBar_Scroll(-1)
				 end)

	ScrollBar:SetScript("OnMouseWheel",
			    function(self, delta)
				    ScrollBar_Scroll(delta)
			    end)

	ListFrame:SetScript("OnMouseWheel",
			    function(self, delta)
				    ScrollBar_Scroll(delta)
			    end)

	-- This can be called either from ListFrame's OnMouseWheel script, manually
	-- sliding the thumb, or from clicking the up/down buttons.
	ScrollBar:SetScript("OnValueChanged",
			    function(self, value, ...)
				    local min_val, max_val = self:GetMinMaxValues()

				    if value == min_val then
					    ScrollUpButton:Disable()
					    ScrollDownButton:Enable()
				    elseif value == max_val then
					    ScrollUpButton:Enable()
					    ScrollDownButton:Disable()
				    else
					    ScrollUpButton:Enable()
					    ScrollDownButton:Enable()
				    end
				    ListFrame:Update(nil, true)
			    end)

	local function Button_OnEnter(self)
		ListItem_ShowTooltip(self, ListFrame.entries[self.string_index])
	end

	local function Button_OnLeave()
		QTip:Release(acquire_tip)
		spell_tip:Hide()
	end

	local function Bar_OnEnter(self)
		highlight:SetParent(self)
		highlight:SetAllPoints(self)
		highlight:Show()
		ListItem_ShowTooltip(self, ListFrame.entries[self.string_index])
	end

	local function Bar_OnLeave()
		highlight:Hide()
		highlight:ClearAllPoints()
		highlight:SetParent(nil)
		QTip:Release(acquire_tip)
		spell_tip:Hide()
	end

	local function ListItem_OnClick(self, button, down)
		local clickedIndex = self.string_index

		-- Don't do anything if they've clicked on an empty button
		if not clickedIndex or clickedIndex == 0 then
			return
		end
		local clicked_line = ListFrame.entries[clickedIndex]
		local traverseIndex = 0

		if not clicked_line then
			return
		end
		-- First, check if this is a "modified" click, and react appropriately
		if clicked_line.recipe_id and _G.IsModifierKeyDown() then
			if _G.IsControlKeyDown() and _G.IsShiftKeyDown() then
				addon:SetupMap(clicked_line.recipe_id)
			elseif _G.IsShiftKeyDown() then
				local itemID = private.recipe_list[clicked_line.recipe_id].item_id

				if itemID then
					local _, itemLink = _G.GetItemInfo(itemID)

					if itemLink then
						_G.ChatFrameEditBox:Insert(itemLink)
					else
						addon:Print(L["NoItemLink"])
					end
				else
					addon:Print(L["NoItemLink"])
				end
			elseif _G.IsControlKeyDown() then
				_G.ChatFrameEditBox:Insert(GetSpellLink(private.recipe_list[clicked_line.recipe_id].spell_id))
			elseif _G.IsAltKeyDown() then
				local exclusion_list = addon.db.profile.exclusionlist
				local recipe_id = clicked_line.recipe_id

				exclusion_list[recipe_id] = (not exclusion_list[recipe_id] and true or nil)
				ListFrame:Update(nil, false)
			end
		elseif clicked_line.type == "header" or clicked_line.type == "subheader" then
			-- three possibilities here (all with no modifiers)
			-- 1) We clicked on the recipe button on a closed recipe
			-- 2) We clicked on the recipe button of an open recipe
			-- 3) we clicked on the expanded text of an open recipe
			if clicked_line.is_expanded then
				traverseIndex = clickedIndex + 1

				local check_type = clicked_line.type
				local entry = ListFrame.entries[traverseIndex]

				-- get rid of our expanded lines
				while entry and entry.type ~= check_type do
					-- Headers are never removed.
					if entry.type == "header" then
						break
					end
					ReleaseTable(table.remove(ListFrame.entries, traverseIndex))
					entry = ListFrame.entries[traverseIndex]

					if not entry then
						break
					end
				end
				clicked_line.is_expanded = false
			else
				ListFrame:ExpandEntry(clickedIndex)
				clicked_line.is_expanded = true
			end
		else
			-- clicked_line is an expanded entry - find the index for its parent, and remove all of the parent's child entries.
			local parent = clicked_line.parent

			if parent then
				local parent_index
				local entries = ListFrame.entries

				for index = 1, #entries do
					if entries[index] == parent then
						parent_index = index
						break
					end
				end

				if not parent_index then
					addon:Debug("clicked_line (%s): parent wasn't found in ListFrame.entries", clicked_line.text)
					return
				end
				parent.is_expanded = false

				local child_index = parent_index + 1

				while entries[child_index] and entries[child_index].parent == parent do
					ReleaseTable(table.remove(entries, child_index))
				end
			else
				addon:Debug("Error: clicked_line has no parent.")
			end
		end
		highlight:Hide()
		highlight:ClearAllPoints()
		highlight:SetParent(nil)
		QTip:Release(acquire_tip)
		spell_tip:Hide()

		ListFrame:Update(nil, true)
	end

	for i = 1, NUM_RECIPE_LINES do
		local cur_container = CreateFrame("Frame", nil, ListFrame)

		cur_container:SetHeight(16)
		cur_container:SetWidth(224)

		local cur_state = GenericCreateButton(nil, ListFrame, 16, 16, "GameFontNormalSmall", "GameFontHighlightSmall", "", "LEFT", "", 2)
		local cur_entry = GenericCreateButton(nil, ListFrame, 16, 224, "GameFontNormalSmall", "GameFontHighlightSmall", "Blort", "LEFT", "", 0)

		if i == 1 then
			cur_container:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 20, -100)
			cur_state:SetPoint("TOPLEFT", cur_container, "TOPLEFT", 0, 0)
			cur_entry:SetPoint("TOPLEFT", cur_state, "TOPRIGHT", -3, 0)
		else
			local prev_container = ListFrame.button_containers[i - 1]

			cur_container:SetPoint("TOPLEFT", prev_container, "BOTTOMLEFT", 0, 3)
			cur_state:SetPoint("TOPLEFT", cur_container, "TOPLEFT", 0, 0)
			cur_entry:SetPoint("TOPLEFT", cur_state, "TOPRIGHT", -3, 0)
		end
		cur_state.container = cur_container

		cur_state:SetScript("OnClick", ListItem_OnClick)
		cur_entry:SetScript("OnClick", ListItem_OnClick)

		ListFrame.button_containers[i] = cur_container
		ListFrame.state_buttons[i] = cur_state
		ListFrame.entry_buttons[i] = cur_entry
	end

	local SKILL_LEVEL_FORMAT = "[%d]"
	local SPELL_ENCHANTING = GetSpellInfo(51313)

	local function FormatRecipeText(recipe_entry)
		local _, _, _, quality_color = GetItemQualityColor(recipe_entry.quality)
		local recipe_name = recipe_entry.name

		if Player.current_prof == SPELL_ENCHANTING then
			recipe_name = string.gsub(recipe_name, _G.ENSCRIBE.." ", "")
		end
		local recipe_string = string.format("%s%s|r", quality_color, recipe_name)

		local skill_level = Player["ProfessionLevel"]
		local recipe_level = recipe_entry.skill_level
		local rep_data = recipe_entry.acquire_data[A.REPUTATION]
		local has_faction = Player:HasProperRepLevel(rep_data)
		local level_text
		local difficulty = private.difficulty_colors

		if not has_faction or recipe_level > skill_level then
			level_text = string.format(SetTextColor(difficulty["impossible"], SKILL_LEVEL_FORMAT), recipe_level)
		elseif skill_level >= recipe_entry.trivial_level then
			level_text = string.format(SetTextColor(difficulty["trivial"], SKILL_LEVEL_FORMAT), recipe_level)
		elseif skill_level >= recipe_entry.easy_level then
			level_text = string.format(SetTextColor(difficulty["easy"], SKILL_LEVEL_FORMAT), recipe_level)
		elseif skill_level >= recipe_entry.medium_level then
			level_text = string.format(SetTextColor(difficulty["medium"], SKILL_LEVEL_FORMAT), recipe_level)
		elseif skill_level >= recipe_entry.optimal_level then
			level_text = string.format(SetTextColor(difficulty["optimal"], SKILL_LEVEL_FORMAT), recipe_level)
		else
			addon:Debug("Skill level color fallback: %s.", recipe_string)
			level_text = string.format(SetTextColor(difficulty["trivial"], SKILL_LEVEL_FORMAT), recipe_level)
		end
		local skill_view = addon.db.profile.skill_view

		recipe_string = skill_view and string.format("%s - %s", level_text, recipe_string) or string.format("%s - %s", recipe_string, level_text)

		if addon.db.profile.exclusionlist[recipe_entry.spell_id] then
			recipe_string = string.format("** %s **", recipe_string)
		end
		return recipe_string
	end

	function ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, entry_expanded, expand_mode)
		entry.type = entry_type

		if parent_entry then
			if parent_entry ~= entry then
				entry.parent = parent_entry
			else
				addon:Debug("Attempting to parent an entry to itself.")
			end
		elseif entry.type ~= "header" then
			addon:Debug("Non-header entry without a parent: %s - %s", entry.type, entry.text)
		end
		local insert_index = entry_index

		-- If we have acquire information for this entry, push the data table into the list
		-- and start processing the acquires.
		if expand_mode then
			entry.is_expanded = true
			table.insert(self.entries, insert_index, entry)

			if entry_type == "header" or entry_type == "subheader" then
				insert_index = self:ExpandEntry(insert_index, expand_mode)
			else
				insert_index = insert_index + 1
			end
		else
			entry.is_expanded = entry_expanded
			table.insert(self.entries, insert_index, entry)
			insert_index = insert_index + 1
		end
		return insert_index
	end

	-- If there is text in the search box, return the recipe's RELEVANT state.
	local function RecipeMatchesSearch(recipe)
		local editbox_text = SearchBox:GetText()

		if editbox_text ~= "" and editbox_text ~= _G.SEARCH then
			return recipe:HasState("RELEVANT")
		end
		return true
	end

	-- Used for Location and Acquisition sort - since many recipes have multiple locations/acquire types it is
	-- necessary to ensure each is counted only once.
	local recipe_registry = {}

	function ListFrame:Initialize(expand_mode)
		local recipe_list = private.recipe_list
		local sort_type = addon.db.profile.sorting
		local current_tab = addon.db.profile.current_tab

		local recipe_count = 0
		local insert_index = 1

		for i = 1, #self.entries do
			ReleaseTable(self.entries[i])
		end
		twipe(self.entries)
		twipe(recipe_registry)

		addon:UpdateFilters(MainPanel.is_linked)
		Player:MarkExclusions()

		ExpandButton:Contract()

		if current_tab == VIEW_TABS["Acquisition"] then
			local sorted_acquires = addon.sorted_acquires
			local current_prof = Player.current_prof

			SortAcquireList()

			for index = 1, #sorted_acquires do
				local acquire_type = sorted_acquires[index]
				local count = 0

				-- Check to see if any recipes for this acquire type will be shown - otherwise, don't show the type in the list.
				for spell_id, affiliation in pairs(private.acquire_list[acquire_type].recipes) do
					local recipe = private.recipe_list[spell_id]

					if recipe:HasState("VISIBLE") and RecipeMatchesSearch(recipe) then
						count = count + 1

						if not recipe_registry[recipe] then
							recipe_registry[recipe] = true
							recipe_count = recipe_count + 1
						end
					end
				end

				if count > 0 then
					local t = AcquireTable()

					local acquire_str = string.gsub(private.acquire_strings[acquire_type]:lower(), "_", "")
					local color_code = private.category_colors[acquire_str] or "ffffff"

					t.text = string.format("%s (%d)", SetTextColor(color_code, private.acquire_names[acquire_type]), count)
					t.acquire_id = acquire_type

					insert_index = self:InsertEntry(t, nil, insert_index, "header", expand_mode, expand_mode)
				end
			end
		elseif current_tab == VIEW_TABS["Location"] then
			local sorted_locations = addon.sorted_locations
			local current_prof = Player.current_prof

			SortLocationList()

			for index = 1, #sorted_locations do
				local loc_name = sorted_locations[index]
				local count = 0

				-- Check to see if any recipes for this location will be shown - otherwise, don't show the location in the list.
				for spell_id, affiliation in pairs(private.location_list[loc_name].recipes) do
					local recipe = private.recipe_list[spell_id]

					if recipe:HasState("VISIBLE") and RecipeMatchesSearch(recipe) then
						count = count + 1

						if not recipe_registry[recipe] then
							recipe_registry[recipe] = true
							recipe_count = recipe_count + 1
						end
					end
				end

				if count > 0 then
					local t = AcquireTable()

					t.text = string.format("%s (%d)", SetTextColor(private.category_colors["location"], loc_name), count)
					t.location_id = loc_name

					insert_index = self:InsertEntry(t, nil, insert_index, "header", expand_mode, expand_mode)
				end
			end
		else
			local sorted_recipes = addon.sorted_recipes

			SortRecipeList(private.recipe_list, sorted_recipes)

			for i = 1, #sorted_recipes do
				local recipe_index = sorted_recipes[i]
				local recipe = recipe_list[recipe_index]

				if recipe:HasState("VISIBLE") and RecipeMatchesSearch(recipe) then
					local t = AcquireTable()

					t.text = FormatRecipeText(recipe)
					t.recipe_id = recipe_index

					recipe_count = recipe_count + 1

					insert_index = self:InsertEntry(t, nil, insert_index, "header", expand_mode, expand_mode)
				end
			end
		end	-- Sort type.

		-- The list always starts at the top.
		ScrollUpButton:Disable()
		self.scroll_bar:SetValue(0)

		local profile = addon.db.profile
		local max_value = profile.includefiltered and Player.recipes_total or Player.recipes_total_filtered
		local cur_value = profile.includefiltered and Player.recipes_known or Player.recipes_known_filtered
		local progress_bar = MainPanel.progress_bar

		if not profile.includeexcluded and not profile.ignoreexclusionlist then
			max_value = max_value - Player.excluded_recipes_known
		end
		progress_bar:SetMinMaxValues(0, max_value)
		progress_bar:SetValue(cur_value)

		local percentage = cur_value / max_value * 100

		if (floor(percentage) < 101) and cur_value >= 0 and max_value >= 0 then
			local results = string.format(_G.SINGLE_PAGE_RESULTS_TEMPLATE, recipe_count)
			progress_bar.text:SetFormattedText("%d / %d - %1.2f%% (%s)", cur_value, max_value, percentage, results)
		else
			progress_bar.text:SetFormattedText("0 / 0 - %s", L["NOT_YET_SCANNED"])
		end
	end

	-- Reset the current buttons/lines
	function ListFrame:ClearLines()
		for i = 1, NUM_RECIPE_LINES do
			local entry = self.entry_buttons[i]
			local state = self.state_buttons[i]

			entry.string_index = 0
			entry:SetText("")
			entry:SetScript("OnEnter", nil)
			entry:SetScript("OnLeave", nil)

			state.string_index = 0
			state:Hide()
			state:SetScript("OnEnter", nil)
			state:SetScript("OnLeave", nil)

			state:ClearAllPoints()
		end
	end

	function ListFrame:Update(expand_mode, refresh)
		if not refresh then
			self:Initialize(expand_mode)
		end

		local num_entries = #self.entries

		if num_entries == 0 then
			self:ClearLines()

			-- disable expand button, it's useless here and would spam the same error again
			ExpandButton:SetNormalFontObject("GameFontDisableSmall")
			ExpandButton:Disable()
			self.scroll_bar:Hide()

			local showpopup = false

			if not addon.db.profile.hidepopup then
				showpopup = true
			end

			-- If we haven't run this before we'll show pop-ups for the first time.
			if addon.db.profile.addonversion ~= addon.version then
				addon.db.profile.addonversion = addon.version
				showpopup = true
			end
			local editbox_text = SearchBox:GetText()

			if Player.recipes_total == 0 then
				if showpopup then
					_G.StaticPopup_Show("ARL_NOTSCANNED")
				end
			elseif Player.recipes_known == Player.recipes_total then
				if showpopup then
					_G.StaticPopup_Show("ARL_ALLKNOWN")
				end
			elseif (Player.recipes_total_filtered - Player.recipes_known_filtered) == 0 then
				if showpopup then
					_G.StaticPopup_Show("ARL_ALLFILTERED")
				end
			elseif Player.excluded_recipes_unknown ~= 0 then
				if showpopup then
					_G.StaticPopup_Show("ARL_ALLEXCLUDED")
				end
			elseif editbox_text ~= "" and editbox_text ~= _G.SEARCH then
				_G.StaticPopup_Show("ARL_SEARCHFILTERED")
			else
				addon:Print(L["NO_DISPLAY"])
				addon:Debug("recipes_total check for 0")
				addon:Debug("recipes_total: " .. Player.recipes_total)
				addon:Debug("recipes_total check for equal to recipes_total")
				addon:Debug("recipes_known: " .. Player.recipes_known)
				addon:Debug("recipes_total: " .. Player.recipes_total)
				addon:Debug("recipes_total_filtered - recipes_known_filtered = 0")
				addon:Debug("recipes_total_filtered: " .. Player.recipes_total_filtered)
				addon:Debug("recipes_known_filtered: " .. Player.recipes_known_filtered)
				addon:Debug("excluded_recipes_unknown ~= 0")
				addon:Debug("excluded_recipes_unknown: " .. Player.excluded_recipes_unknown)
			end
			return
		end
		local offset = 0

		addon:ClosePopups()

		ExpandButton:SetNormalFontObject("GameFontNormalSmall")
		ExpandButton:Enable()

		if num_entries <= NUM_RECIPE_LINES then
			self.scroll_bar:Hide()
		else
			offset = self.scroll_bar:GetValue()

			self.scroll_bar:SetMinMaxValues(0, math.max(0, num_entries - NUM_RECIPE_LINES))
			self.scroll_bar:Show()
		end
		self:ClearLines()

		local button_index = 1
		local string_index = button_index + offset

		-- Populate the buttons with new values
		while button_index <= NUM_RECIPE_LINES and string_index <= num_entries do
			local cur_state = self.state_buttons[button_index]
			local cur_entry = self.entries[string_index]

			if cur_entry.type == "header" or cur_entry.type == "subheader" then
				cur_state:Show()

				if cur_entry.is_expanded then
					cur_state:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
					cur_state:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down")
					cur_state:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
					cur_state:SetDisabledTexture("Interface\\Buttons\\UI-MinusButton-Disabled")
				else
					cur_state:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
					cur_state:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
					cur_state:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
					cur_state:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
				end
				cur_state.string_index = string_index
				cur_state:SetScript("OnEnter", Button_OnEnter)
				cur_state:SetScript("OnLeave", Button_OnLeave)
			else
				cur_state:Hide()
			end
			local cur_container = cur_state.container

			if cur_entry.type == "header" or cur_entry.type == "entry" then
				cur_state:SetPoint("TOPLEFT", cur_container, "TOPLEFT", 0, 0)
			elseif cur_entry.type == "subheader" or cur_entry.type == "subentry" then
				cur_state:SetPoint("TOPLEFT", cur_container, "TOPLEFT", 15, 0)
			end

			local cur_button = self.entry_buttons[button_index]

			cur_button.string_index = string_index
			cur_button:SetText(cur_entry.text)
			cur_button:SetScript("OnEnter", Bar_OnEnter)
			cur_button:SetScript("OnLeave", Bar_OnLeave)

			button_index = button_index + 1
			string_index = string_index + 1
		end
		button_index = 1
		string_index = button_index + offset

		-- This function could possibly have been called from a mouse click or by scrolling.
		-- Since, in those cases, the list entries have changed, the mouse is likely over a different entry - the highlight texture and tooltip should be generated for it.
		while button_index <= NUM_RECIPE_LINES and string_index <= num_entries do
			local cur_state = self.state_buttons[button_index]
			local cur_button = self.entry_buttons[button_index]

			if cur_state:IsMouseOver() then
				Button_OnEnter(cur_state)
				break
			elseif cur_button:IsMouseOver() then
				Bar_OnEnter(cur_button)
				break
			end
			button_index = button_index + 1
			string_index = string_index + 1
		end
	end
	-------------------------------------------------------------------------------
	-- Functions and data pertaining to individual list entries.
	-------------------------------------------------------------------------------
	local faction_strings

	local function CanDisplayFaction(faction)
		if addon.db.profile.filters.general.faction then
			return true
		end
		return (not faction or faction == BFAC[Player.faction] or faction == FACTION_NEUTRAL)
	end

	-- Padding for list entries/subentries
	local PADDING = "    "

	-- Changes the color of "name" based on faction type.
	local function ColorNameByFaction(name, faction)
		if faction == FACTION_NEUTRAL then
			name = SetTextColor(private.reputation_colors["neutral"], name)
		elseif faction == BFAC[Player.faction] then
			name = SetTextColor(private.reputation_colors["exalted"], name)
		else
			name = SetTextColor(private.reputation_colors["hated"], name)
		end
		return name
	end

	local function ExpandTrainerData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local trainer = private.trainer_list[id_num]

		if not CanDisplayFaction(trainer.faction) then
			return entry_index
		end

		local name = ColorNameByFaction(trainer.name, trainer.faction)
		local coord_text = ""

		if trainer.coord_x ~= 0 and trainer.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], "(" .. trainer.coord_x .. ", " .. trainer.coord_y .. ")")
		end
		local t = AcquireTable()

		t.text = string.format("%s%s %s", PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["trainer"], L["Trainer"])..":", name)
		t.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], trainer.location), coord_text)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	-- Right now PVP obtained items are located on vendors so they have the vendor and PVP flag.
	-- We need to display the vendor in the drop down if we want to see vendors or if we want to see PVP
	-- This allows us to select PVP only and to see just the PVP recipes
	local function ExpandVendorData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local vendor = private.vendor_list[id_num]

		if not CanDisplayFaction(vendor.faction) then
			return entry_index
		end

		local name = ColorNameByFaction(vendor.name, vendor.faction)
		local coord_text = ""

		if vendor.coord_x ~= 0 and vendor.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], "(" .. vendor.coord_x .. ", " .. vendor.coord_y .. ")")
		end
		local t = AcquireTable()
		local quantity = vendor.item_list[recipe_id]

		t.text = string.format("%s%s %s%s", PADDING,
				       hide_type and "" or SetTextColor(CATEGORY_COLORS["vendor"], L["Vendor"])..":", name,
				       type(quantity) == "number" and SetTextColor(BASIC_COLORS["white"], string.format(" (%d)", quantity)) or "")
		t.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], vendor.location), coord_text)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	-- Mobs can be in instances, raids, or specific mob related drops.
	local function ExpandMobData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local mob = private.mob_list[id_num]
		local coord_text = ""

		if mob.coord_x ~= 0 and mob.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], "(" .. mob.coord_x .. ", " .. mob.coord_y .. ")")
		end
		local t = AcquireTable()

		t.text = string.format("%s%s %s", PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["mobdrop"], L["Mob Drop"])..":", SetTextColor(private.reputation_colors["hostile"], mob.name))
		t.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], mob.location), coord_text)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandQuestData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local quest = private.quest_list[id_num]

		if not CanDisplayFaction(quest.faction) then
			return entry_index
		end

		local name = ColorNameByFaction(private.quest_names[id_num], quest.faction)
		local coord_text = ""

		if quest.coord_x ~= 0 and quest.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], "(" .. quest.coord_x .. ", " .. quest.coord_y .. ")")
		end
		local t = AcquireTable()

		t.text = string.format("%s%s %s", PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["quest"], L["Quest"])..":", name)
		t.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], quest.location), coord_text)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandSeasonalData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local t = AcquireTable()

		t.text = string.format("%s%s %s", PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["seasonal"], private.acquire_names[A.SEASONAL])..":",
				       SetTextColor(CATEGORY_COLORS["seasonal"], private.seasonal_list[id_num].name))
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandReputationData(entry_index, entry_type, parent_entry, vendor_id, rep_id, rep_level, recipe_id, hide_location, hide_type)
		local rep_vendor = private.vendor_list[vendor_id]

		if not CanDisplayFaction(rep_vendor.faction) then
			return entry_index
		end

		if not faction_strings then
			local rep_color = private.reputation_colors

			faction_strings = {
				[0] = SetTextColor(rep_color["neutral"], FACTION_NEUTRAL .. " : "),
				[1] = SetTextColor(rep_color["friendly"], BFAC["Friendly"] .. " : "),
				[2] = SetTextColor(rep_color["honored"], BFAC["Honored"] .. " : "),
				[3] = SetTextColor(rep_color["revered"], BFAC["Revered"] .. " : "),
				[4] = SetTextColor(rep_color["exalted"], BFAC["Exalted"] .. " : ")
			}
		end

		local name = ColorNameByFaction(rep_vendor.name, rep_vendor.faction)
		local t = AcquireTable()

		t.text = string.format("%s%s %s", PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["reputation"], _G.REPUTATION)..":",
				       SetTextColor(CATEGORY_COLORS["repname"], private.reputation_list[rep_id].name))
		t.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		t = AcquireTable()
		t.text = PADDING .. PADDING .. faction_strings[rep_level] .. name
		t.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		local coord_text = ""

		if rep_vendor.coord_x ~= 0 and rep_vendor.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], "(" .. rep_vendor.coord_x .. ", " .. rep_vendor.coord_y .. ")")
		end

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s%s %s", PADDING, PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], rep_vendor.location), coord_text)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandWorldDropData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)

		local _, _, _, hex_color = GetItemQualityColor(private.recipe_list[recipe_id].quality)
		local drop_location = type(id_num) == "string" and BZ[id_num] or nil

		if drop_location then
			drop_location = string.format(": %s", SetTextColor(CATEGORY_COLORS["location"], drop_location))
		else
			drop_location = ""
		end
		local t = AcquireTable()

		t.text = string.format("%s%s%s|r%s", PADDING, hex_color, L["World Drop"], drop_location)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandCustomData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local t = AcquireTable()

		t.text = PADDING .. SetTextColor(CATEGORY_COLORS["custom"], private.custom_list[id_num].name)
		t.recipe_id = recipe_id

		return ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)
	end

	function ListFrame:ExpandAcquireData(entry_index, entry_type, parent_entry, acquire_type, acquire_data, recipe_id, hide_location, hide_type)
		local obtain_filters = addon.db.profile.filters.obtain

		for id_num, info in pairs(acquire_data) do
			if acquire_type == A.TRAINER and obtain_filters.trainer then
				entry_index = ExpandTrainerData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
			elseif acquire_type == A.VENDOR and (obtain_filters.vendor or obtain_filters.pvp) then
				entry_index = ExpandVendorData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
			elseif acquire_type == A.MOB_DROP and (obtain_filters.mobdrop or obtain_filters.instance or obtain_filters.raid) then
				entry_index = ExpandMobData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
			elseif acquire_type == A.QUEST and obtain_filters.quest then
				entry_index = ExpandQuestData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
			elseif acquire_type == A.SEASONAL and obtain_filters.seasonal then
				entry_index = ExpandSeasonalData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
			elseif acquire_type == A.REPUTATION then
				for rep_level, level_info in pairs(info) do
					for vendor_id in pairs(level_info) do
						entry_index =  ExpandReputationData(entry_index, entry_type, parent_entry, vendor_id, id_num, rep_level, recipe_id, hide_location, hide_type)
					end
				end
			elseif acquire_type == A.WORLD_DROP and obtain_filters.worlddrop then
				if not hide_type then
					entry_index = ExpandWorldDropData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
				end
			elseif acquire_type == A.CUSTOM then
				if not hide_type then
					entry_index = ExpandCustomData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
				end
				--@alpha@
			elseif acquire_type > A_MAX then
				local t = AcquireTable()

				t.text = "Unhandled Acquire Case - Type: " .. acquire_type
				t.recipe_id = recipe_id

				entry_index = self:InsertEntry(t, parent_entry, entry_index, entry_type, true)
				--@end-alpha@
			end
		end	-- for
		return entry_index
	end

	-- This function is called when an un-expanded entry in the list has been clicked.
	function ListFrame:ExpandEntry(entry_index, expand_mode)
		local orig_index = entry_index
		local current_entry = self.entries[orig_index]
		local expand_all = expand_mode == "deep"

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		entry_index = entry_index + 1

		-- This entry was generated using sorting based on Acquisition.
		if current_entry.acquire_id then
			local acquire_id = current_entry.acquire_id

			if current_entry.type == "header" then
				local recipe_list = private.acquire_list[acquire_id].recipes
				local sorted_recipes = addon.sorted_recipes

				SortRecipeList(recipe_list, sorted_recipes)

				for index = 1, #sorted_recipes do
					local spell_id = sorted_recipes[index]
					local recipe_entry = private.recipe_list[spell_id]

					if recipe_entry:HasState("VISIBLE") and RecipeMatchesSearch(recipe_entry) then
						local t = AcquireTable()
						local expand = false
						local type = "subheader"

						if acquire_id == A.WORLD_DROP or acquire_id == A.CUSTOM then
							expand = true
							type = "entry"
						end
						t.text = FormatRecipeText(recipe_entry)
						t.recipe_id = spell_id
						t.acquire_id = acquire_id

						entry_index = self:InsertEntry(t, current_entry, entry_index, type, expand, expand_all)
					end
				end
			elseif current_entry.type == "subheader" then
				for acquire_type, acquire_data in pairs(private.recipe_list[current_entry.recipe_id].acquire_data) do
					if acquire_type == acquire_id then
						entry_index = self:ExpandAcquireData(entry_index, "subentry", current_entry, acquire_type, acquire_data, current_entry.recipe_id, false, true)
					end
				end
			end
			return entry_index
		end

		-- This entry was generated using sorting based on Location.
		if current_entry.location_id then
			local location_id = current_entry.location_id

			if current_entry.type == "header" then
				local recipe_list = private.location_list[location_id].recipes
				local sorted_recipes = addon.sorted_recipes

				SortRecipeList(recipe_list, sorted_recipes)

				for index = 1, #sorted_recipes do
					local spell_id = sorted_recipes[index]
					local recipe_entry = private.recipe_list[spell_id]

					if recipe_entry:HasState("VISIBLE") and RecipeMatchesSearch(recipe_entry) then
						local expand = false
						local type = "subheader"
						local t = AcquireTable()

						-- Add World Drop entries as normal entries.
						if affiliation == "world_drop" then
							expand = true
							type = "entry"
						end
						t.text = FormatRecipeText(recipe_entry)
						t.recipe_id = spell_id
						t.location_id = location_id

						entry_index = self:InsertEntry(t, current_entry, entry_index, type, expand, expand_all)
					end
				end
			elseif current_entry.type == "subheader" then
				local recipe_entry = private.recipe_list[current_entry.recipe_id]

				-- World Drops are not handled here because they are of type "entry".
				for acquire_type, acquire_data in pairs(recipe_entry.acquire_data) do
					for id_num, info in pairs(acquire_data) do
						-- Only expand an acquisition entry if it is from this location.
						if acquire_type == A.TRAINER and private.trainer_list[id_num].location == location_id then
							entry_index = ExpandTrainerData(entry_index, "subentry", current_entry,
											id_num, current_entry.recipe_id, true)
						elseif acquire_type == A.VENDOR and private.vendor_list[id_num].location == location_id then
							entry_index = ExpandVendorData(entry_index, "subentry", current_entry,
										       id_num, current_entry.recipe_id, true)
						elseif acquire_type == A.MOB_DROP and private.mob_list[id_num].location == location_id then
							entry_index = ExpandMobData(entry_index, "subentry", current_entry,
										    id_num, current_entry.recipe_id, true)
						elseif acquire_type == A.QUEST and private.quest_list[id_num].location == location_id then
							entry_index = ExpandQuestData(entry_index, "subentry", current_entry,
										      id_num, current_entry.recipe_id, true)
						elseif acquire_type == A.SEASONAL and private.seasonal_list[id_num].location == location_id then
							-- Hide the acquire type for this - it will already show up in the location list as "World Events".
							entry_index = ExpandSeasonalData(entry_index, "subentry", current_entry,
											 id_num, current_entry.recipe_id, true, true)
						elseif acquire_type == A.CUSTOM and private.custom_list[id_num].location == location_id then
							entry_index = ExpandCustomData(entry_index, "subentry", current_entry,
										       id_num, current_entry.recipe_id, true, true)
						elseif acquire_type == A.REPUTATION then
							for rep_level, level_info in pairs(info) do
								for vendor_id in pairs(level_info) do
									if private.vendor_list[vendor_id].location == location_id then
										entry_index =  ExpandReputationData(entry_index, "subentry", current_entry,
														    vendor_id, id_num, rep_level, current_entry.recipe_id, true)
									end
								end
							end
						end
					end
				end
			end
			return entry_index
		end

		-- Normal entry - expand all acquire types.
		local recipe_id = self.entries[orig_index].recipe_id

		for acquire_type, acquire_data in pairs(private.recipe_list[recipe_id].acquire_data) do
			entry_index = self:ExpandAcquireData(entry_index, "entry", current_entry,
							     acquire_type, acquire_data, recipe_id)
		end
		return entry_index
	end
end	-- do

-------------------------------------------------------------------------------
-- Create MainPanel.progress_bar and set its scripts
-------------------------------------------------------------------------------
MainPanel.progress_bar = CreateFrame("StatusBar", nil, MainPanel)
MainPanel.progress_bar:SetWidth(195)
MainPanel.progress_bar:SetHeight(14)

MainPanel.progress_bar:ClearAllPoints()
MainPanel.progress_bar:SetPoint("BOTTOMLEFT", MainPanel, 17, 7)

MainPanel.progress_bar:SetStatusBarTexture("Interface\\Addons\\AckisRecipeList\\img\\progressbar")
MainPanel.progress_bar:SetOrientation("HORIZONTAL")
MainPanel.progress_bar:SetStatusBarColor(0.25, 0.25, 0.75)

MainPanel.progress_bar.text = MainPanel.progress_bar:CreateFontString(nil, "ARTWORK")
MainPanel.progress_bar.text:SetWidth(195)
MainPanel.progress_bar.text:SetHeight(14)
MainPanel.progress_bar.text:SetFontObject("GameFontHighlightSmall")

MainPanel.progress_bar.text:ClearAllPoints()
MainPanel.progress_bar.text:SetPoint("CENTER", MainPanel.progress_bar, "CENTER", 0, 0)
MainPanel.progress_bar.text:SetJustifyH("CENTER")

-- Default values for the progressbar
do
	local min_value = 0
	local max_value = 100
	local value = 50

	MainPanel.progress_bar:SetMinMaxValues(min_value, max_value)
	MainPanel.progress_bar:SetValue(value)

	MainPanel.progress_bar.text:SetFormattedText("%d / %d - %1.1f%%", value, max_value, value / max_value * 100)
end	-- do

-------------------------------------------------------------------------------
-- Create the close button, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.close_button = GenericCreateButton(nil, MainPanel, 22, 69, "GameFontNormalSmall", "GameFontHighlightSmall", L["Close"], "CENTER", L["CLOSE_DESC"], 1)
MainPanel.close_button:SetPoint("BOTTOMRIGHT", MainPanel, "BOTTOMRIGHT", -4, 3)

MainPanel.close_button:SetScript("OnClick",
				 function(self, button, down)
					 MainPanel:Hide()
				 end)

-------------------------------------------------------------------------------
-- Data used in GenerateClickableTT() and its support functions.
-------------------------------------------------------------------------------
local click_info = {
	anchor = nil,
	change_realm = nil,
	target_realm = nil,
	modified = nil,
	name = nil,
	realm = nil,
}
local clicktip
local GenerateClickableTT	-- Upvalued!

-------------------------------------------------------------------------------
-- Clicktip OnMouseUp scripts.
-------------------------------------------------------------------------------
local function ChangeRealm(cell, arg, button)
	click_info.modified = true
	click_info.realm = nil
	click_info.change_realm = true
	click_info.target_realm = nil
	GenerateClickableTT()
end

local function SelectRealm(cell, arg, button)
	click_info.modified = true

	if click_info.change_realm then
		click_info.target_realm = arg
	end
	click_info.realm = arg
	GenerateClickableTT()
end

local function SelectName(cell, arg, button)
	click_info.modified = true
	click_info.name = arg

	-- Wipe tradeskill information for the selected toon. -Torhal
	if _G.IsAltKeyDown() and button == "LeftButton" then
		local tskl_list = addon.db.global.tradeskill
		tskl_list[click_info.realm][click_info.name] = nil

		-- See if there are any toons left on the realm. If not, nuke it as well.
		local found = false
		for name in pairs(tskl_list[click_info.realm]) do
			found = true
		end
		if not found then
			tskl_list[click_info.realm] = nil
		end
		local anchor = click_info.anchor
		twipe(click_info)
		click_info.anchor = anchor
		GenerateClickableTT()
		return
	end
	GenerateClickableTT()
end

local function SelectProfession(cell, arg, button)
	local tskl_list = addon.db.global.tradeskill
	click_info.modified = true
	addon:Print(click_info.name .. "(" .. click_info.realm .. "):" .. tskl_list[click_info.realm][click_info.name][arg])
end

-------------------------------------------------------------------------------
-- Creates a list of names/alts/etc in a tooltip which can be clicked.
-------------------------------------------------------------------------------
function GenerateClickableTT(anchor)
	local tskl_list = addon.db.global.tradeskill
	local tip = clicktip
	local y, x
	local prealm = _G.GetRealmName()
	local target_realm = prealm

	if click_info.change_realm then
		target_realm = click_info.target_realm
		click_info.change_realm = nil
	end
	tip:Clear()

	if not click_info.realm then
		local other_realms = nil
		local header = nil

		for realm in pairs(tskl_list) do
			if target_realm and realm ~= target_realm then
				other_realms = true
			end

			if not target_realm and realm ~= prealm then
				if not header then
					tip:AddHeader(L["Other Realms"])
					tip:AddSeparator()
					header = true
				end
				y, x = tip:AddLine()
				tip:SetCell(y, x, realm)
				tip:SetCellScript(y, x, "OnMouseUp", SelectRealm, realm)
			elseif realm == target_realm then
				click_info.realm = realm

				tip:AddHeader(realm)
				tip:AddSeparator()

				for name in pairs(tskl_list[click_info.realm]) do
					if name ~= _G.UnitName("player") then
						y, x = tip:AddLine()
						tip:SetCell(y, x, name)
						tip:SetCellScript(y, x, "OnMouseUp", SelectName, name)
					end
				end
			end
		end

		if other_realms then
			tip:AddSeparator()
			y, x = tip:AddLine()
			tip:SetCell(y, x, L["Other Realms"])
			tip:SetCellScript(y, x, "OnMouseUp", ChangeRealm)
		end
		tip:AddSeparator()
	elseif not click_info.name then
		local realm_list = tskl_list[click_info.realm]

		if realm_list then
			tip:AddLine(click_info.realm)
			tip:AddSeparator()

			for name in pairs(realm_list) do
				y, x = tip:AddLine()
				tip:SetCell(y, x, name)
				tip:SetCellScript(y, x, "OnMouseUp", SelectName, name)
			end
			tip:AddSeparator()
		end
	else
		tip:AddHeader(click_info.name)
		tip:AddSeparator()

		for prof in pairs(tskl_list[click_info.realm][click_info.name]) do
			y, x = tip:AddLine()
			tip:SetCell(y, x, prof)
			tip:SetCellScript(y, x, "OnMouseUp", SelectProfession, prof)
		end
		tip:AddSeparator()
	end

	if anchor then
		click_info.anchor = anchor
		tip:SetPoint("TOP", anchor, "BOTTOM")
	else
		tip:SetPoint("TOP", click_info.anchor, "BOTTOM")
	end
	tip:Show()
end

-------------------------------------------------------------------------------
-- Initializes runtime elements of MainPanel.
-------------------------------------------------------------------------------
function addon:InitializeFrame()
	-------------------------------------------------------------------------------
	-- Check to see if we're Horde or Alliance, and change the displayed
	-- reputation strings to be faction-correct.
	-------------------------------------------------------------------------------
	local isAlliance = (Player.faction == "Alliance")

	local HonorHold_Thrallmar_FactionText = isAlliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]
	local Kurenai_Maghar_FactionText = isAlliance and BFAC["Kurenai"] or BFAC["The Mag'har"]
	local Vanguard_Expedition_FactionText = isAlliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]
	local SilverCov_Sunreaver_FactionText = isAlliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]
	local Valiance_Warsong_FactionText = isAlliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]
	local Frostborn_Taunka_FactionText = isAlliance and BFAC["The Frostborn"] or BFAC["The Taunka"]
	local Explorer_Hand_FactionText = isAlliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]


	-------------------------------------------------------------------------------
	-- Flyaway virtual frames to group buttons/text easily (and make them easy to show/hide)
	-------------------------------------------------------------------------------

	-------------------------------------------------------------------------------
	-- Classic Reputations
	-------------------------------------------------------------------------------
	local ARL_Rep_ClassicButton = GenericCreateButton("ARL_Rep_ClassicButton", MainPanel.filter_menu.rep.Classic, 20, 140, "GameFontHighlight", "GameFontHighlightSmall",
							  _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
	ARL_Rep_ClassicButton:SetPoint("TOPLEFT", MainPanel.filter_menu.rep.Classic, "TOPLEFT", -2, -4)

	ARL_Rep_ClassicButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_Rep_ClassicButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_Rep_ClassicButton:SetScript("OnClick",
				   function(self,button)
					   local filterdb = addon.db.profile.filters.rep
					   if button == "LeftButton" then
						   -- Set all Reputations to true
						   filterdb.argentdawn = true
						   filterdb.cenarioncircle = true
						   filterdb.thoriumbrotherhood = true
						   filterdb.timbermaw = true
						   filterdb.zandalar = true
					   elseif button == "RightButton" then
						   -- Set all Reputations to false
						   filterdb.argentdawn = false
						   filterdb.cenarioncircle = false
						   filterdb.thoriumbrotherhood = false
						   filterdb.timbermaw = false
						   filterdb.zandalar = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_RepArgentDawnCB:SetChecked(filterdb.argentdawn)
					   ARL_RepCenarionCircleCB:SetChecked(filterdb.cenarioncircle)
					   ARL_RepThoriumCB:SetChecked(filterdb.thoriumbrotherhood)
					   ARL_RepTimbermawCB:SetChecked(filterdb.timbermaw)
					   ARL_RepZandalarCB:SetChecked(filterdb.zandalar)
					   -- Reset our title
					   MainPanel:UpdateTitle()
					   -- Use new filters
					   ListFrame:Update(nil, false)
				   end)

	local ARL_RepArgentDawnCB = CreateFrame("CheckButton", "ARL_RepArgentDawnCB", MainPanel.filter_menu.rep.Classic, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepArgentDawnCB, MainPanel.filter_menu.rep.Classic, sformat(L["SPECIFIC_REP_DESC"], BFAC["Argent Dawn"]), "argentdawn", 2, 1, 0)
	ARL_RepArgentDawnCBText:SetText(BFAC["Argent Dawn"])
	ARL_RepArgentDawnCBText:SetFont(narrowFont, 11)

	local ARL_RepCenarionCircleCB = CreateFrame("CheckButton", "ARL_RepCenarionCircleCB", MainPanel.filter_menu.rep.Classic, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepCenarionCircleCB, MainPanel.filter_menu.rep.Classic, sformat(L["SPECIFIC_REP_DESC"], BFAC["Cenarion Circle"]), "cenarioncircle", 3, 1, 0)
	ARL_RepCenarionCircleCBText:SetText(BFAC["Cenarion Circle"])
	ARL_RepCenarionCircleCBText:SetFont(narrowFont, 11)

	local ARL_RepThoriumCB = CreateFrame("CheckButton", "ARL_RepThoriumCB", MainPanel.filter_menu.rep.Classic, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepThoriumCB, MainPanel.filter_menu.rep.Classic, sformat(L["SPECIFIC_REP_DESC"], BFAC["Thorium Brotherhood"]), "thoriumbrotherhood", 4, 1, 0)
	ARL_RepThoriumCBText:SetText(BFAC["Thorium Brotherhood"])
	ARL_RepThoriumCBText:SetFont(narrowFont, 11)

	local ARL_RepTimbermawCB = CreateFrame("CheckButton", "ARL_RepTimbermawCB", MainPanel.filter_menu.rep.Classic, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepTimbermawCB, MainPanel.filter_menu.rep.Classic, sformat(L["SPECIFIC_REP_DESC"], BFAC["Timbermaw Hold"]), "timbermaw", 5, 1, 0)
	ARL_RepTimbermawCBText:SetText(BFAC["Timbermaw Hold"])
	ARL_RepTimbermawCBText:SetFont(narrowFont, 11)

	local ARL_RepZandalarCB = CreateFrame("CheckButton", "ARL_RepZandalarCB", MainPanel.filter_menu.rep.Classic, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepZandalarCB, MainPanel.filter_menu.rep.Classic, sformat(L["SPECIFIC_REP_DESC"], BFAC["Zandalar Tribe"]), "zandalar", 6, 1, 0)
	ARL_RepZandalarCBText:SetText(BFAC["Zandalar Tribe"])
	ARL_RepZandalarCBText:SetFont(narrowFont, 11)

	-------------------------------------------------------------------------------
	-- The Burning Crusade Reputations
	-------------------------------------------------------------------------------
	local ARL_Rep_BCButton = GenericCreateButton("ARL_Rep_ClassicButton", MainPanel.filter_menu.rep.BC, 20, 140, "GameFontHighlight", "GameFontHighlightSmall",
						     _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
	ARL_Rep_BCButton:SetPoint("TOPLEFT", MainPanel.filter_menu.rep.BC, "TOPLEFT", -2, -4)

	ARL_Rep_BCButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_Rep_BCButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_Rep_BCButton:SetScript("OnClick",
				   function(self,button)
					   local filterdb = addon.db.profile.filters.rep
					   if button == "LeftButton" then
						   -- Set all Reputations to true
						   filterdb.aldor = true
						   filterdb.ashtonguedeathsworn = true
						   filterdb.cenarionexpedition = true
						   filterdb.consortium = true
						   filterdb.hellfire = true
						   filterdb.keepersoftime = true
						   filterdb.nagrand = true
						   filterdb.lowercity = true
						   filterdb.scaleofthesands = true
						   filterdb.scryer = true
						   filterdb.shatar = true
						   filterdb.shatteredsun = true
						   filterdb.sporeggar = true
						   filterdb.violeteye = true
					   elseif button == "RightButton" then
						   -- Set all Reputations to false
						   filterdb.aldor = false
						   filterdb.ashtonguedeathsworn = false
						   filterdb.cenarionexpedition = false
						   filterdb.consortium = false
						   filterdb.hellfire = false
						   filterdb.keepersoftime = false
						   filterdb.nagrand = false
						   filterdb.lowercity = false
						   filterdb.scaleofthesands = false
						   filterdb.scryer = false
						   filterdb.shatar = false
						   filterdb.shatteredsun = false
						   filterdb.sporeggar = false
						   filterdb.violeteye = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_RepAldorCB:SetChecked(filterdb.aldor)
					   ARL_RepAshtongueCB:SetChecked(filterdb.ashtonguedeathsworn)
					   ARL_RepCenarionExpeditionCB:SetChecked(filterdb.cenarionexpedition)
					   ARL_RepConsortiumCB:SetChecked(filterdb.consortium)
					   ARL_RepHonorHoldCB:SetChecked(filterdb.hellfire)
					   ARL_RepKeepersOfTimeCB:SetChecked(filterdb.keepersoftime)
					   ARL_RepKurenaiCB:SetChecked(filterdb.nagrand)
					   ARL_RepLowerCityCB:SetChecked(filterdb.lowercity)
					   ARL_RepScaleSandsCB:SetChecked(filterdb.scaleofthesands)
					   ARL_RepScryersCB:SetChecked(filterdb.scryer)
					   ARL_RepShatarCB:SetChecked(filterdb.shatar)
					   ARL_RepShatteredSunCB:SetChecked(filterdb.shatteredsun)
					   ARL_RepSporeggarCB:SetChecked(filterdb.sporeggar)
					   ARL_RepVioletEyeCB:SetChecked(filterdb.violeteye)
					   -- Reset our title
					   MainPanel:UpdateTitle()
					   -- Use new filters
					   ListFrame:Update(nil, false)
				   end)

	local ARL_RepAldorCB = CreateFrame("CheckButton", "ARL_RepAldorCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepAldorCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Aldor"]), "aldor", 2, 1, 0)
	ARL_RepAldorCBText:SetText(BFAC["The Aldor"])
	ARL_RepAldorCBText:SetFont(narrowFont, 11)

	local ARL_RepAshtongueCB = CreateFrame("CheckButton", "ARL_RepAshtongueCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepAshtongueCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["Ashtongue Deathsworn"]), "ashtonguedeathsworn", 3, 1, 0)
	ARL_RepAshtongueCBText:SetText(BFAC["Ashtongue Deathsworn"])
	ARL_RepAshtongueCBText:SetFont(narrowFont, 11)

	local ARL_RepCenarionExpeditionCB = CreateFrame("CheckButton", "ARL_RepCenarionExpeditionCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepCenarionExpeditionCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["Cenarion Expedition"]), "cenarionexpedition", 4, 1, 0)
	ARL_RepCenarionExpeditionCBText:SetText(BFAC["Cenarion Expedition"])
	ARL_RepCenarionExpeditionCBText:SetFont(narrowFont, 11)

	local ARL_RepConsortiumCB = CreateFrame("CheckButton", "ARL_RepConsortiumCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepConsortiumCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Consortium"]), "consortium", 5, 1, 0)
	ARL_RepConsortiumCBText:SetText(BFAC["The Consortium"])
	ARL_RepConsortiumCBText:SetFont(narrowFont, 11)

	local ARL_RepHonorHoldCB = CreateFrame("CheckButton", "ARL_RepHonorHoldCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepHonorHoldCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], HonorHold_Thrallmar_FactionText), "hellfire", 6, 1, 0)
	ARL_RepHonorHoldCBText:SetText(HonorHold_Thrallmar_FactionText)
	ARL_RepHonorHoldCBText:SetFont(narrowFont, 11)

	local ARL_RepKeepersOfTimeCB = CreateFrame("CheckButton", "ARL_RepKeepersOfTimeCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepKeepersOfTimeCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["Keepers of Time"]), "keepersoftime", 7, 1, 0)
	ARL_RepKeepersOfTimeCBText:SetText(BFAC["Keepers of Time"])
	ARL_RepKeepersOfTimeCBText:SetFont(narrowFont, 11)

	local ARL_RepKurenaiCB = CreateFrame("CheckButton", "ARL_RepKurenaiCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepKurenaiCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], Kurenai_Maghar_FactionText), "nagrand", 8, 1, 0)
	ARL_RepKurenaiCBText:SetText(Kurenai_Maghar_FactionText)
	ARL_RepKurenaiCBText:SetFont(narrowFont, 11)

	local ARL_RepLowerCityCB = CreateFrame("CheckButton", "ARL_RepLowerCityCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepLowerCityCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["Lower City"]), "lowercity", 9, 1, 0)
	ARL_RepLowerCityCBText:SetText(BFAC["Lower City"])
	ARL_RepLowerCityCBText:SetFont(narrowFont, 11)

	local ARL_RepScaleSandsCB = CreateFrame("CheckButton", "ARL_RepScaleSandsCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepScaleSandsCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Scale of the Sands"]), "scaleofthesands", 10, 1, 0)
	ARL_RepScaleSandsCBText:SetText(BFAC["The Scale of the Sands"])
	ARL_RepScaleSandsCBText:SetFont(narrowFont, 11)

	local ARL_RepScryersCB = CreateFrame("CheckButton", "ARL_RepScryersCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepScryersCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Scryers"]), "scryer", 11, 1, 0)
	ARL_RepScryersCBText:SetText(BFAC["The Scryers"])
	ARL_RepScryersCBText:SetFont(narrowFont, 11)

	local ARL_RepShatarCB = CreateFrame("CheckButton", "ARL_RepShatarCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepShatarCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sha'tar"]), "shatar", 12, 1, 0)
	ARL_RepShatarCBText:SetText(BFAC["The Sha'tar"])
	ARL_RepShatarCBText:SetFont(narrowFont, 11)

	local ARL_RepShatteredSunCB = CreateFrame("CheckButton", "ARL_RepShatteredSunCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepShatteredSunCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["Shattered Sun Offensive"]), "shatteredsun", 13, 1, 0)
	ARL_RepShatteredSunCBText:SetText(BFAC["Shattered Sun Offensive"])
	ARL_RepShatteredSunCBText:SetFont(narrowFont, 11)

	local ARL_RepSporeggarCB = CreateFrame("CheckButton", "ARL_RepSporeggarCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepSporeggarCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["Sporeggar"]), "sporeggar", 14, 1, 0)
	ARL_RepSporeggarCBText:SetText(BFAC["Sporeggar"])
	ARL_RepSporeggarCBText:SetFont(narrowFont, 11)

	local ARL_RepVioletEyeCB = CreateFrame("CheckButton", "ARL_RepVioletEyeCB", MainPanel.filter_menu.rep.BC, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepVioletEyeCB, MainPanel.filter_menu.rep.BC, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Violet Eye"]), "violeteye", 15, 1, 0)
	ARL_RepVioletEyeCBText:SetText(BFAC["The Violet Eye"])
	ARL_RepVioletEyeCBText:SetFont(narrowFont, 11)

	-------------------------------------------------------------------------------
	-- Wrath of the Lich King Reputations
	-------------------------------------------------------------------------------
	local ARL_Rep_LKButton = GenericCreateButton("ARL_Rep_ClassicButton", MainPanel.filter_menu.rep.LK, 20, 140, "GameFontHighlight", "GameFontHighlightSmall",
						     _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
	ARL_Rep_LKButton:SetPoint("TOPLEFT", MainPanel.filter_menu.rep.LK, "TOPLEFT", -2, -4)

	ARL_Rep_LKButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_Rep_LKButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_Rep_LKButton:SetScript("OnClick",
				   function(self,button)
					   local filterdb = addon.db.profile.filters.rep
					   if button == "LeftButton" then
						   -- Set all Reputations to true
						   filterdb.argentcrusade = true
						   filterdb.frenzyheart = true
						   filterdb.ebonblade = true
						   filterdb.kirintor = true
						   filterdb.sonsofhodir = true
						   filterdb.kaluak = true
						   filterdb.oracles = true
						   filterdb.wyrmrest = true
						   filterdb.ashenverdict = true
						   filterdb.wrathcommon1 = true
					   elseif button == "RightButton" then
						   -- Set all Reputations to false
						   filterdb.argentcrusade = false
						   filterdb.frenzyheart = false
						   filterdb.ebonblade = false
						   filterdb.kirintor = false
						   filterdb.sonsofhodir = false
						   filterdb.kaluak = false
						   filterdb.oracles = false
						   filterdb.wyrmrest = false
						   filterdb.ashenverdict = false
						   filterdb.wrathcommon1 = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_RepArgentCrusadeCB:SetChecked(filterdb.argentcrusade)
					   ARL_RepFrenzyheartCB:SetChecked(filterdb.frenzyheart)
					   ARL_RepEbonBladeCB:SetChecked(filterdb.ebonblade)
					   ARL_RepKirinTorCB:SetChecked(filterdb.kirintor)
					   ARL_RepSonsOfHodirCB:SetChecked(filterdb.sonsofhodir)
					   ARL_RepKaluakCB:SetChecked(filterdb.kaluak)
					   ARL_RepOraclesCB:SetChecked(filterdb.oracles)
					   ARL_RepWyrmrestCB:SetChecked(filterdb.wyrmrest)
					   ARL_RepAshenVerdictCB:SetChecked(filterdb.ashenverdict)
					   ARL_WrathCommon1CB:SetChecked(filterdb.wrathcommon1)

					   MainPanel:UpdateTitle()
					   ListFrame:Update(nil, false)
				   end)

	local ARL_WrathCommon1CB = CreateFrame("CheckButton", "ARL_WrathCommon1CB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_WrathCommon1CB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"],  Vanguard_Expedition_FactionText), "wrathcommon1", 2, 1, 0)
	ARL_WrathCommon1CBText:SetText(Vanguard_Expedition_FactionText)
	ARL_WrathCommon1CBText:SetFont(narrowFont, 11)

	local ARL_RepArgentCrusadeCB = CreateFrame("CheckButton", "ARL_RepArgentCrusadeCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepArgentCrusadeCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["Argent Crusade"]), "argentcrusade", 3, 1, 0)
	ARL_RepArgentCrusadeCBText:SetText(BFAC["Argent Crusade"])
	ARL_RepArgentCrusadeCBText:SetFont(narrowFont, 11)

	local ARL_WrathCommon5CB = CreateFrame("CheckButton", "ARL_WrathCommon5CB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_WrathCommon5CB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], Explorer_Hand_FactionText), "wrathcommon5", 4, 1, 0)
	ARL_WrathCommon5CBText:SetText(Explorer_Hand_FactionText)
	ARL_WrathCommon5CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon5CBText:SetText(SetTextColor(BASIC_COLORS["grey"], Explorer_Hand_FactionText))
	ARL_WrathCommon5CB:Disable()

	local ARL_RepFrenzyheartCB = CreateFrame("CheckButton", "ARL_RepFrenzyheartCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepFrenzyheartCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["Frenzyheart Tribe"]), "frenzyheart", 5, 1, 0)
	ARL_RepFrenzyheartCBText:SetText(BFAC["Frenzyheart Tribe"])
	ARL_RepFrenzyheartCBText:SetFont(narrowFont, 11)

	local ARL_RepKaluakCB = CreateFrame("CheckButton", "ARL_RepKaluakCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepKaluakCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Kalu'ak"]), "kaluak", 6, 1, 0)
	ARL_RepKaluakCBText:SetText(BFAC["The Kalu'ak"])
	ARL_RepKaluakCBText:SetFont(narrowFont, 11)

	local ARL_RepKirinTorCB = CreateFrame("CheckButton", "ARL_RepKirinTorCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepKirinTorCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["Kirin Tor"]), "kirintor", 7, 1, 0)
	ARL_RepKirinTorCBText:SetText(BFAC["Kirin Tor"])
	ARL_RepKirinTorCBText:SetFont(narrowFont, 11)

	local ARL_RepEbonBladeCB = CreateFrame("CheckButton", "ARL_RepEbonBladeCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepEbonBladeCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["Knights of the Ebon Blade"]), "ebonblade", 8, 1, 0)
	ARL_RepEbonBladeCBText:SetText(BFAC["Knights of the Ebon Blade"])
	ARL_RepEbonBladeCBText:SetFont(narrowFont, 11)

	local ARL_RepOraclesCB = CreateFrame("CheckButton", "ARL_RepOraclesCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepOraclesCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Oracles"]), "oracles", 9, 1, 0)
	ARL_RepOraclesCBText:SetText(BFAC["The Oracles"])
	ARL_RepOraclesCBText:SetFont(narrowFont, 11)

	local ARL_WrathCommon2CB = CreateFrame("CheckButton", "ARL_WrathCommon2CB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_WrathCommon2CB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], SilverCov_Sunreaver_FactionText), "wrathcommon2", 10, 1, 0)
	ARL_WrathCommon2CBText:SetText(SilverCov_Sunreaver_FactionText)
	ARL_WrathCommon2CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon2CBText:SetText(SetTextColor(BASIC_COLORS["grey"], SilverCov_Sunreaver_FactionText))
	ARL_WrathCommon2CB:Disable()

	local ARL_RepSonsOfHodirCB = CreateFrame("CheckButton", "ARL_RepSonsOfHodirCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepSonsOfHodirCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sons of Hodir"]), "sonsofhodir", 11, 1, 0)
	ARL_RepSonsOfHodirCBText:SetText(BFAC["The Sons of Hodir"])
	ARL_RepSonsOfHodirCBText:SetFont(narrowFont, 11)

	local ARL_WrathCommon4CB = CreateFrame("CheckButton", "ARL_WrathCommon4CB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_WrathCommon4CB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], Frostborn_Taunka_FactionText), "wrathcommon4", 12, 1, 0)
	ARL_WrathCommon4CBText:SetText(Frostborn_Taunka_FactionText)
	ARL_WrathCommon4CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon4CBText:SetText(SetTextColor(BASIC_COLORS["grey"], Frostborn_Taunka_FactionText))
	ARL_WrathCommon4CB:Disable()

	local ARL_WrathCommon3CB = CreateFrame("CheckButton", "ARL_WrathCommon3CB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_WrathCommon3CB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], Valiance_Warsong_FactionText), "wrathcommon3", 13, 1, 0)
	ARL_WrathCommon3CBText:SetText(Valiance_Warsong_FactionText)
	ARL_WrathCommon3CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon3CBText:SetText(SetTextColor(BASIC_COLORS["grey"], Valiance_Warsong_FactionText))
	ARL_WrathCommon3CB:Disable()

	local ARL_RepWyrmrestCB = CreateFrame("CheckButton", "ARL_RepWyrmrestCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepWyrmrestCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Wyrmrest Accord"]), "wyrmrest", 14, 1, 0)
	ARL_RepWyrmrestCBText:SetText(BFAC["The Wyrmrest Accord"])
	ARL_RepWyrmrestCBText:SetFont(narrowFont, 11)

	local ARL_AshenVerdictCB = CreateFrame("CheckButton", "ARL_RepAshenVerdictCB", MainPanel.filter_menu.rep.LK, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_RepAshenVerdictCB, MainPanel.filter_menu.rep.LK, sformat(L["SPECIFIC_REP_DESC"], BFAC["The Ashen Verdict"]), "ashenverdict", 15, 1, 0)
	ARL_RepAshenVerdictCBText:SetText(BFAC["The Ashen Verdict"])
	ARL_RepAshenVerdictCBText:SetFont(narrowFont, 11)

	-------------------------------------------------------------------------------
	-- Miscellaneous Filter Menu
	-------------------------------------------------------------------------------
	MainPanel.filter_menu.misc = CreateFrame("Frame", "ARL_FilterMenu_Misc", MainPanel.filter_menu)
	MainPanel.filter_menu.misc:SetWidth(FILTERMENU_LARGE)
	MainPanel.filter_menu.misc:SetHeight(280)
	MainPanel.filter_menu.misc:EnableMouse(true)
	MainPanel.filter_menu.misc:EnableKeyboard(true)
	MainPanel.filter_menu.misc:SetMovable(false)
	MainPanel.filter_menu.misc:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
	MainPanel.filter_menu.misc:Hide()

	local ARL_MiscText = MainPanel.filter_menu.misc:CreateFontString("ARL_MiscText", "OVERLAY", "GameFontHighlight")
	ARL_MiscText:SetText(_G.MISCELLANEOUS .. ":")
	ARL_MiscText:SetPoint("TOPLEFT", MainPanel.filter_menu.misc, "TOPLEFT", 5, -8)
	ARL_MiscText:SetHeight(14)
	ARL_MiscText:SetWidth(150)
	ARL_MiscText:SetJustifyH("LEFT")

	local ARL_IgnoreCB = CreateFrame("CheckButton", "ARL_IgnoreCB", MainPanel.filter_menu.misc, "UICheckButtonTemplate")
	InitializeCheckButton(ARL_IgnoreCB, MainPanel.filter_menu.misc, L["DISPLAY_EXCLUSION_DESC"], 0, 2, 1, 1)
	ARL_IgnoreCBText:SetText(L["Display Exclusions"])

	local ARL_MiscAltText = MainPanel.filter_menu.misc:CreateFontString("ARL_MiscAltBtn", "OVERLAY", "GameFontNormal")
	ARL_MiscAltText:SetText(L["Alt-Tradeskills"] .. ":")
	ARL_MiscAltText:SetPoint("TOPLEFT", ARL_IgnoreCB, "BOTTOMLEFT", 4, 0)
	ARL_MiscAltText:SetHeight(14)
	ARL_MiscAltText:SetWidth(95)
	ARL_MiscAltText:SetJustifyH("LEFT")

	local ARL_MiscAltBtn = CreateFrame("Button", "ARL_MiscAltBtn", MainPanel.filter_menu.misc)
	ARL_MiscAltBtn:SetPoint("LEFT", ARL_MiscAltText, "RIGHT")
	ARL_MiscAltBtn:SetHeight(22)
	ARL_MiscAltBtn:SetWidth(22)
	ARL_MiscAltBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
	ARL_MiscAltBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
	ARL_MiscAltBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
	ARL_MiscAltBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
	SetTooltipScripts(ARL_MiscAltBtn, L["ALT_TRADESKILL_DESC"], 1)
	ARL_MiscAltBtn:RegisterForClicks("LeftButtonUp")
	ARL_MiscAltBtn:SetScript("OnClick",
				 function(this, button)
					 if clicktip then
						 if not click_info.modified then
							 clicktip = QTip:Release(clicktip)
							 twipe(click_info)
						 else
							 twipe(click_info)
							 GenerateClickableTT(this)
						 end
					 else
						 clicktip = QTip:Acquire("ARL_Clickable", 1, "CENTER")
						 twipe(click_info)

						 if _G.TipTac and _G.TipTac.AddModifiedTip then
							 _G.TipTac:AddModifiedTip(clicktip, true)
						 end
						 GenerateClickableTT(this)
					 end
				 end)
	ARL_MiscAltBtn:SetScript("OnHide",
				 function(this, button)
					 clicktip = QTip:Release(clicktip)
					 twipe(click_info)
				 end)

	-------------------------------------------------------------------------------
	-- Now that everything exists, populate the global filter table
	-------------------------------------------------------------------------------
	local filterdb = addon.db.profile.filters
	local filter_menu = MainPanel.filter_menu

	FilterValueMap = {
		------------------------------------------------------------------------------------------------
		-- General Options
		------------------------------------------------------------------------------------------------
		["specialty"]		= { cb = filter_menu.general.specialty,			svroot = filterdb.general },
		["skill"]		= { cb = filter_menu.general.skill,			svroot = filterdb.general },
		["faction"]		= { cb = filter_menu.general.faction,			svroot = filterdb.general },
		["known"]		= { cb = filter_menu.general.known,			svroot = filterdb.general },
		["unknown"]		= { cb = filter_menu.general.unknown,			svroot = filterdb.general },
		["retired"]		= { cb = filter_menu.general.retired,			svroot = filterdb.general },
		------------------------------------------------------------------------------------------------
		-- Classes
		------------------------------------------------------------------------------------------------
		["deathknight"]		= { cb = filter_menu.general.deathknight,		svroot = filterdb.classes },
		["druid"]		= { cb = filter_menu.general.druid,			svroot = filterdb.classes },
		["hunter"]		= { cb = filter_menu.general.hunter,			svroot = filterdb.classes },
		["mage"]		= { cb = filter_menu.general.mage,			svroot = filterdb.classes },
		["paladin"]		= { cb = filter_menu.general.paladin,			svroot = filterdb.classes },
		["priest"]		= { cb = filter_menu.general.priest,			svroot = filterdb.classes },
		["rogue"]		= { cb = filter_menu.general.rogue,			svroot = filterdb.classes },
		["shaman"]		= { cb = filter_menu.general.shaman,			svroot = filterdb.classes },
		["warlock"]		= { cb = filter_menu.general.warlock,			svroot = filterdb.classes },
		["warrior"]		= { cb = filter_menu.general.warrior,			svroot = filterdb.classes },
		------------------------------------------------------------------------------------------------
		-- Obtain Options
		------------------------------------------------------------------------------------------------
		["instance"]		= { cb = filter_menu.obtain.instance,			svroot = filterdb.obtain },
		["raid"]		= { cb = filter_menu.obtain.raid,			svroot = filterdb.obtain },
		["quest"]		= { cb = filter_menu.obtain.quest,			svroot = filterdb.obtain },
		["seasonal"]		= { cb = filter_menu.obtain.seasonal,			svroot = filterdb.obtain },
		["trainer"]		= { cb = filter_menu.obtain.trainer,			svroot = filterdb.obtain },
		["vendor"]		= { cb = filter_menu.obtain.vendor,			svroot = filterdb.obtain },
		["pvp"]			= { cb = filter_menu.obtain.pvp,			svroot = filterdb.obtain },
		["discovery"]		= { cb = filter_menu.obtain.discovery,			svroot = filterdb.obtain },
		["worlddrop"]		= { cb = filter_menu.obtain.worlddrop,			svroot = filterdb.obtain },
		["mobdrop"]		= { cb = filter_menu.obtain.mobdrop,			svroot = filterdb.obtain },
		["originalwow"]		= { cb = filter_menu.obtain.originalwow,		svroot = filterdb.obtain },
		["bc"]			= { cb = filter_menu.obtain.bc,				svroot = filterdb.obtain },
		["wrath"]		= { cb = filter_menu.obtain.wrath,			svroot = filterdb.obtain },
		------------------------------------------------------------------------------------------------
		-- Binding Options
		------------------------------------------------------------------------------------------------
		["itemboe"]		= { cb = filter_menu.binding.itemboe,			svroot = filterdb.binding },
		["itembop"]		= { cb = filter_menu.binding.itembop,			svroot = filterdb.binding },
		["recipeboe"]		= { cb = filter_menu.binding.recipeboe,			svroot = filterdb.binding },
		["recipebop"]		= { cb = filter_menu.binding.recipebop,			svroot = filterdb.binding },
		------------------------------------------------------------------------------------------------
		-- Armor Options
		------------------------------------------------------------------------------------------------
		["cloth"]		= { cb = filter_menu.item.cloth,			svroot = filterdb.item.armor },
		["leather"]		= { cb = filter_menu.item.leather,			svroot = filterdb.item.armor },
		["mail"]		= { cb = filter_menu.item.mail,				svroot = filterdb.item.armor },
		["plate"]		= { cb = filter_menu.item.plate,			svroot = filterdb.item.armor },
		["cloak"]		= { cb = filter_menu.item.cloak,			svroot = filterdb.item.armor },
		["necklace"]		= { cb = filter_menu.item.necklace,			svroot = filterdb.item.armor },
		["ring"]		= { cb = filter_menu.item.ring,				svroot = filterdb.item.armor },
		["trinket"]		= { cb = filter_menu.item.trinket,			svroot = filterdb.item.armor },
		["shield"]		= { cb = filter_menu.item.shield,			svroot = filterdb.item.armor },
		------------------------------------------------------------------------------------------------
		-- Weapon Options
		------------------------------------------------------------------------------------------------
		["onehand"]		= { cb = filter_menu.item.onehand,			svroot = filterdb.item.weapon },
		["twohand"]		= { cb = filter_menu.item.twohand,			svroot = filterdb.item.weapon },
		["dagger"]		= { cb = filter_menu.item.dagger,			svroot = filterdb.item.weapon },
		["axe"]			= { cb = filter_menu.item.axe,				svroot = filterdb.item.weapon },
		["mace"]		= { cb = filter_menu.item.mace,				svroot = filterdb.item.weapon },
		["sword"]		= { cb = filter_menu.item.sword,			svroot = filterdb.item.weapon },
		["polearm"]		= { cb = filter_menu.item.polearm,			svroot = filterdb.item.weapon },
		["fist"]		= { cb = filter_menu.item.fist,				svroot = filterdb.item.weapon },
		["staff"]		= { cb = filter_menu.item.staff,			svroot = nil },
		["wand"]		= { cb = filter_menu.item.wand,				svroot = filterdb.item.weapon },
		["thrown"]		= { cb = filter_menu.item.thrown,			svroot = filterdb.item.weapon },
		["bow"]			= { cb = filter_menu.item.bow,				svroot = nil },
		["crossbow"]		= { cb = filter_menu.item.crossbow,			svroot = nil },
		["ammo"]		= { cb = filter_menu.item.ammo,				svroot = filterdb.item.weapon },
		["gun"]			= { cb = filter_menu.item.gun,				svroot = filterdb.item.weapon },
		------------------------------------------------------------------------------------------------
		-- Quality Options
		------------------------------------------------------------------------------------------------
		["common"]		= { cb = filter_menu.quality.common,			svroot = filterdb.quality },
		["uncommon"]		= { cb = filter_menu.quality.uncommon,			svroot = filterdb.quality },
		["rare"]		= { cb = filter_menu.quality.rare,			svroot = filterdb.quality },
		["epic"]		= { cb = filter_menu.quality.epic,			svroot = filterdb.quality },
		------------------------------------------------------------------------------------------------
		-- Role Options
		------------------------------------------------------------------------------------------------
		["tank"]		= { cb = filter_menu.player.tank,			svroot = filterdb.player },
		["melee"]		= { cb = filter_menu.player.melee,			svroot = filterdb.player },
		["healer"]		= { cb = filter_menu.player.healer,			svroot = filterdb.player },
		["caster"]		= { cb = filter_menu.player.caster,			svroot = filterdb.player },
		------------------------------------------------------------------------------------------------
		-- Old World Rep Options
		------------------------------------------------------------------------------------------------
		["argentdawn"]		= { cb = ARL_RepArgentDawnCB,		svroot = filterdb.rep },
		["cenarioncircle"]	= { cb = ARL_RepCenarionCircleCB,	svroot = filterdb.rep },
		["thoriumbrotherhood"]	= { cb = ARL_RepThoriumCB,		svroot = filterdb.rep },
		["timbermaw"]		= { cb = ARL_RepTimbermawCB,		svroot = filterdb.rep },
		["zandalar"]		= { cb = ARL_RepZandalarCB,		svroot = filterdb.rep },
		------------------------------------------------------------------------------------------------
		-- BC Rep Options
		------------------------------------------------------------------------------------------------
		["aldor"]		= { cb = ARL_RepAldorCB,		svroot = filterdb.rep },
		["ashtonguedeathsworn"]	= { cb = ARL_RepAshtongueCB,		svroot = filterdb.rep },
		["cenarionexpedition"]	= { cb = ARL_RepCenarionExpeditionCB,	svroot = filterdb.rep },
		["consortium"]		= { cb = ARL_RepConsortiumCB,		svroot = filterdb.rep },
		["hellfire"]		= { cb = ARL_RepHonorHoldCB,		svroot = filterdb.rep },
		["keepersoftime"]	= { cb = ARL_RepKeepersOfTimeCB,	svroot = filterdb.rep },
		["nagrand"]		= { cb = ARL_RepKurenaiCB,		svroot = filterdb.rep },
		["lowercity"]		= { cb = ARL_RepLowerCityCB,		svroot = filterdb.rep },
		["scaleofthesands"]	= { cb = ARL_RepScaleSandsCB,		svroot = filterdb.rep },
		["scryer"]		= { cb = ARL_RepScryersCB,		svroot = filterdb.rep },
		["shatar"]		= { cb = ARL_RepShatarCB,		svroot = filterdb.rep },
		["shatteredsun"]	= { cb = ARL_RepShatteredSunCB,		svroot = filterdb.rep },
		["sporeggar"]		= { cb = ARL_RepSporeggarCB,		svroot = filterdb.rep },
		["violeteye"]		= { cb = ARL_RepVioletEyeCB,		svroot = filterdb.rep },
		------------------------------------------------------------------------------------------------
		-- LK Rep Options
		------------------------------------------------------------------------------------------------
		["argentcrusade"]	= { cb = ARL_RepArgentCrusadeCB,	svroot = filterdb.rep },
		["frenzyheart"]		= { cb = ARL_RepFrenzyheartCB,		svroot = filterdb.rep },
		["ebonblade"]		= { cb = ARL_RepEbonBladeCB,		svroot = filterdb.rep },
		["kirintor"]		= { cb = ARL_RepKirinTorCB,		svroot = filterdb.rep },
		["sonsofhodir"]		= { cb = ARL_RepSonsOfHodirCB,		svroot = filterdb.rep },
		["kaluak"]		= { cb = ARL_RepKaluakCB,		svroot = filterdb.rep },
		["oracles"]		= { cb = ARL_RepOraclesCB,		svroot = filterdb.rep },
		["wyrmrest"]		= { cb = ARL_RepWyrmrestCB,		svroot = filterdb.rep },
		["ashenverdict"]	= { cb = ARL_RepAshenVerdictCB,		svroot = filterdb.rep },
		["wrathcommon1"]	= { cb = ARL_WrathCommon1CB,		svroot = filterdb.rep },
		["wrathcommon2"]	= { cb = ARL_WrathCommon2CB,		svroot = nil },
		["wrathcommon3"]	= { cb = ARL_WrathCommon3CB,		svroot = nil },
		["wrathcommon4"]	= { cb = ARL_WrathCommon4CB,		svroot = nil },
		["wrathcommon5"]	= { cb = ARL_WrathCommon5CB,		svroot = nil },
	}
end

-------------------------------------------------------------------------------
-- Displays the main recipe frame.
-------------------------------------------------------------------------------
function MainPanel:Display(is_linked)
	self:SetPosition()
	self:SetProfession()
	self:SetScale(addon.db.profile.frameopts.uiscale)

	self.is_linked = is_linked

	local editbox = SearchBox

	if self.profession ~= self.prev_profession then
		editbox.prev_search = nil
	end
	editbox:SetText(editbox.prev_search or _G.SEARCH)
	ListFrame:Update(nil, false)

	self:UpdateTitle()
	self:Show()
end

--------------------------------------------------------------------------------
---- Creates a new frame with the contents of a text dump so you can copy and paste
--- Code borrowed from Antiarc (Chatter) with permission
--- @name AckisRecipeList:DisplayTextDump
--- @param RecipeDB The database (array) which you wish read data from.
--- @param profession Which profession are you displaying data for
--- @param text The text to be dumped
--------------------------------------------------------------------------------
do
	local copy_frame = CreateFrame("Frame", "ARLCopyFrame", UIParent)
	copy_frame:SetBackdrop({
				       bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
				       edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
				       tile = true,
				       tileSize = 16,
				       edgeSize = 16,
				       insets = {
					       left = 3,
					       right = 3,
					       top = 5,
					       bottom = 3
				       }
			       })
	copy_frame:SetBackdropColor(0, 0, 0, 1)
	copy_frame:SetWidth(750)
	copy_frame:SetHeight(400)
	copy_frame:SetPoint("CENTER", UIParent, "CENTER")
	copy_frame:SetFrameStrata("DIALOG")

	table.insert(UISpecialFrames, "ARLCopyFrame")

	local scrollArea = CreateFrame("ScrollFrame", "ARLCopyScroll", copy_frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", copy_frame, "TOPLEFT", 8, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -30, 8)

	local edit_box = CreateFrame("EditBox", nil, copy_frame)
	edit_box:SetMultiLine(true)
	edit_box:SetMaxLetters(0)
	edit_box:EnableMouse(true)
	edit_box:SetAutoFocus(true)
	edit_box:SetFontObject(ChatFontNormal)
	edit_box:SetWidth(650)
	edit_box:SetHeight(270)
	edit_box:SetScript("OnEscapePressed",
			   function()
				   copy_frame:Hide()
			   end)
	edit_box:HighlightText(0)

	scrollArea:SetScrollChild(edit_box)

	local close = CreateFrame("Button", nil, copy_frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", copy_frame, "TOPRIGHT")

	copy_frame:Hide()

	function addon:DisplayTextDump(RecipeDB, profession, text)
		local text = (not RecipeDB and not profession) and text or self:GetTextDump(profession)

		if text ~= "" then
			edit_box:SetText(text)
			edit_box:HighlightText(0)
			edit_box:SetCursorPosition(1)
			copy_frame:Show()
		end
	end
end	-- do
