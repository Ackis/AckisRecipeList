--[[
************************************************************************
Frame.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
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
local ORDERED_PROFESSIONS	= private.ordered_professions

local FILTERMENU_HEIGHT		= 312

local FILTERMENU_SMALL		= 112
local FILTERMENU_LARGE		= 210

local FACTION_HORDE		= BFAC["Horde"]
local FACTION_ALLIANCE		= BFAC["Alliance"]
local FACTION_NEUTRAL		= BFAC["Neutral"]

local CATEGORY_COLORS		= private.category_colors
local BASIC_COLORS		= private.basic_colors

local SF = private.recipe_state_flags

local A = private.acquire_types
local A_MAX = 9

local COMMON1 = private.common_flags_word1

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
local FilterValueMap		-- Assigned in InitializeFrame()

-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local SetTextColor = private.SetTextColor

local ListFrame
local MainPanel

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

	function GenericCreateButton(name, parent, height, width, font_object, label, justify_h, tip_text, noTextures)
		local button = CreateFrame("Button", name, parent)

		button:SetHeight(height)
		button:SetWidth(width)

		if noTextures == 0 then
			button:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
		elseif noTextures == 1 then
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

		if font_object then
			local text = button:CreateFontString(nil, "ARTWORK")
			button:SetFontString(text)
			button.text = text
			text:SetPoint("LEFT", button, "LEFT", 7, 0)
			text:SetPoint("RIGHT", button, "RIGHT", -7, 0)
			text:SetJustifyH(justify_h)

			text:SetFontObject(font_object)
			text:SetText(label)
		end

		if tip_text and tip_text ~= "" then
			SetTooltipScripts(button, tip_text)
		end
		return button
	end
end	-- do

-------------------------------------------------------------------------------
-- Sort functions
-------------------------------------------------------------------------------
local SortRecipeList
do
	local recipe_list = private.recipe_list

	addon.sorted_recipes = {}

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
			textSize,		-- add to or subtract from addon.db.profile.tooltip.acquire_fontsize to get fontsize
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

			fontSize = addon.db.profile.tooltip.acquire_fontsize + textSize

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
		spell_tip:SetScale(addon.db.profile.tooltip.scale)
		spell_tip:SetClampedToScreen(true)
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
	local function Tooltip_AddTrainer(id_num, location, addline_func)
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
			addline_func(0, -2, false, L["Trainer"], CATEGORY_COLORS["trainer"], trainer.name, name_color)
			addline_func(1, -2, true, trainer.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
		end
	end

	local function Tooltip_AddVendor(recipe_id, id_num, location, addline_func)
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
			addline_func(0, -1, false, L["Vendor"], type_color, vendor.name, name_color)
			addline_func(1, -2, true, vendor.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])

			local quantity = vendor.item_list[recipe_id]

			if type(quantity) == "number" then
				addline_func(2, -2, true, L["LIMITED_SUPPLY"], type_color, string.format("(%d)", quantity), BASIC_COLORS["white"])
			end
		end
	end

	local function Tooltip_AddMobDrop(id_num, location, addline_func)
		local mob = private.mob_list[id_num]

		if location and mob.location ~= location then
			return
		end
		local coord_text = ""

		if mob.coord_x ~= 0 and mob.coord_y ~= 0 then
			coord_text = "(" .. mob.coord_x .. ", " .. mob.coord_y .. ")"
		end
		addline_func(0, -1, false, L["Mob Drop"], CATEGORY_COLORS["mobdrop"], mob.name, private.reputation_colors["hostile"])
		addline_func(1, -2, true, mob.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
	end

	local function Tooltip_AddQuest(id_num, location, addline_func)
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
			addline_func(0, -1, false, L["Quest"], type_color, private.quest_names[id_num], name_color)
			addline_func(1, -2, true, quest.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
		end
	end

	local function Tooltip_AddRepVendor(id_num, location, rep_id, rep_level, vendor_id, addline_func)
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
			addline_func(0, -1, false, _G.REPUTATION, CATEGORY_COLORS["reputation"], private.reputation_list[id_num].name, CATEGORY_COLORS["repname"])
			addline_func(1, -2, false, rep_str, type_color, rep_vendor.name, name_color)

			local coord_text = ""

			if rep_vendor.coord_x ~= 0 and rep_vendor.coord_y ~= 0 then
				coord_text = "(" .. rep_vendor.coord_x .. ", " .. rep_vendor.coord_y .. ")"
			end
			addline_func(2, -2, true, rep_vendor.location, CATEGORY_COLORS["location"], coord_text, CATEGORY_COLORS["coords"])
		end
	end

	local function Tooltip_AddWorldDrop(recipe_id, id_num, location, addline_func)
		local drop_location = type(id_num) == "string" and BZ[id_num] or nil

		if location and drop_location ~= location then
			return
		end
		local item_id = private.spell_to_recipe_map[recipe_id]
		local _, item_level

		if item_id then
			_, _, _, item_level = GetItemInfo(item_id)
		end
		local _, _, _, quality_color = GetItemQualityColor(private.recipe_list[recipe_id].quality)
		local type_color = string.gsub(quality_color, "|cff", "")

		if type(id_num) == "string" then
			local location_text = item_level and string.format("%s (%d - %d)", drop_location, item_level - 5, item_level + 5) or drop_location

			addline_func(0, -1, false, L["World Drop"], type_color, location_text, CATEGORY_COLORS["location"])
		else
			local location_text = item_level and string.format("%s (%d - %d)", _G.UNKNOWN, item_level - 5, item_level + 5) or _G.UNKNOWN

			addline_func(0, -1, false, L["World Drop"], type_color, location_text, CATEGORY_COLORS["location"])
		end
	end

	-------------------------------------------------------------------------------
	-- Public API function for displaying a recipe's acquire data.
	-- * The addline_func paramater must be a function which accepts the same
	-- * arguments as ARL's ttAdd function.
	-------------------------------------------------------------------------------
	function addon:DisplayAcquireData(recipe_id, acquire_id, location, addline_func)
		local recipe = private.recipe_list[recipe_id]

		if not recipe then
			return
		end

		for acquire_type, acquire_data in pairs(recipe.acquire_data) do
			local can_display = (not acquire_id or acquire_type == acquire_id)

			if can_display then
				for id_num, info in pairs(acquire_data) do
					if acquire_type == A.TRAINER then
						Tooltip_AddTrainer(id_num, location, addline_func)
					elseif acquire_type == A.VENDOR then
						Tooltip_AddVendor(recipe_id, id_num, location, addline_func)
					elseif acquire_type == A.MOB_DROP then
						Tooltip_AddMobDrop(id_num, location, addline_func)
					elseif acquire_type == A.QUEST then
						Tooltip_AddQuest(id_num, location, addline_func)
					elseif acquire_type == A.SEASONAL then
						color_1 = CATEGORY_COLORS["seasonal"]
						addline_func(0, -1, 0, private.acquire_names[A.SEASONAL], color_1, private.seasonal_list[id_num].name, color_1)
					elseif acquire_type == A.REPUTATION then
						for rep_level, level_info in pairs(info) do
							for vendor_id in pairs(level_info) do
								Tooltip_AddRepVendor(id_num, location, rep_id, rep_level, vendor_id, addline_func)
							end
						end
					elseif acquire_type == A.WORLD_DROP then
						Tooltip_AddWorldDrop(recipe_id, id_num, location, addline_func)
					elseif acquire_type == A.CUSTOM then
						addline_func(0, -1, false, private.custom_list[id_num].name, CATEGORY_COLORS["custom"])
						--@alpha@
					elseif can_display then
						-- Unhandled
						addline_func(0, -1, 0, L["Unhandled Recipe"], BASIC_COLORS["normal"])
						--@end-alpha@
					end
				end	-- for id_num
			end	-- if can_display
		end	-- for acquire_type
	end

	-------------------------------------------------------------------------------
	-- Main tooltip-generating function.
	-------------------------------------------------------------------------------
	local BINDING_FLAGS = {
		[COMMON1.IBOE] = L["BOEFilter"],
		[COMMON1.IBOP] = L["BOPFilter"],
		[COMMON1.IBOA] = L["BOAFilter"],
		[COMMON1.RBOE] = L["RecipeBOEFilter"],
		[COMMON1.RBOP] = L["RecipeBOPFilter"],
		[COMMON1.RBOA] = L["RecipeBOAFilter"]
	}

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
			acquire_tip:SetPoint("TOPLEFT", MainPanel, "TOPRIGHT", MainPanel.is_expanded and -90 or -35, 0)
		elseif acquire_tip_anchor == "Left" then
			acquire_tip:SetPoint("TOPRIGHT", MainPanel, "TOPLEFT")
		elseif acquire_tip_anchor == "Top" then
			acquire_tip:SetPoint("BOTTOMLEFT", MainPanel, "TOPLEFT")
		elseif acquire_tip_anchor == "Bottom" then
			acquire_tip:SetPoint("TOPLEFT", MainPanel, "BOTTOMLEFT", 0, 55)
		elseif acquire_tip_anchor == "Mouse" then
			local x, y = GetCursorPosition()
			local uiscale = UIParent:GetEffectiveScale()

			acquire_tip:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x / uiscale, y / uiscale)
		end
		acquire_tip:SetClampedToScreen(true)

		if _G.TipTac and _G.TipTac.AddModifiedTip then
			-- Pass true as second parameter because hooking OnHide causes C stack overflows -Torhal
			_G.TipTac:AddModifiedTip(acquire_tip, true)
		end
		local _, _, _, quality_color = GetItemQualityColor(recipe.quality)

		acquire_tip:Clear()
		acquire_tip:SetScale(addon.db.profile.tooltip.scale)
		acquire_tip:AddHeader()
		acquire_tip:SetCell(1, 1, quality_color..recipe.name, "CENTER", 2)

		-- check if the recipe is excluded
		if addon.db.profile.exclusionlist[recipe_id] then
			ttAdd(0, -1, true, L["RECIPE_EXCLUDED"], "ff0000")
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
		ttAdd(0, -1, false, string.format("%s:", _G.SKILL_LEVEL), color_1, recipe.skill_level, color_2)

		-- Binding info
		acquire_tip:AddSeparator()
		color_1 = BASIC_COLORS["normal"]

		for flag, label in pairs(BINDING_FLAGS) do
			if bit.band(recipe.flags.common1, flag) == flag then
				ttAdd(0, -1, true, label, color_1)
			end
		end
		acquire_tip:AddSeparator()

		if recipe.specialty then
			local spec = recipe.specialty
			local spec_name = GetSpellInfo(spec)
			local known = (spec == Player["Specialty"])

			ttAdd(0, -1, false, string.format(_G.ITEM_REQ_SKILL, spec_name), known and BASIC_COLORS["white"] or difficulty["impossible"])
			acquire_tip:AddSeparator()
		end

		ttAdd(0, -1, false, L["Obtained From"] .. " : ", BASIC_COLORS["normal"])

		local acquire_id = list_entry.acquire_id
		local location = list_entry.location_id

		addon:DisplayAcquireData(recipe_id, acquire_id, location, ttAdd)

		if not addon.db.profile.hide_tooltip_hint then
			-- Give the tooltip hint a unique color.
			color_1 = "c9c781"

			acquire_tip:AddSeparator()
			acquire_tip:AddSeparator()

			ttAdd(0, -1, 0, L["ALT_CLICK"], color_1)
			ttAdd(0, -1, 0, L["CTRL_CLICK"], color_1)
			ttAdd(0, -1, 0, L["SHIFT_CLICK"], color_1)

			if acquire_id ~= A.WORLD_DROP and acquire_id ~= A.CUSTOM and (_G.TomTom or _G.Cartographer_Waypoints) and (addon.db.profile.worldmap or addon.db.profile.minimap) then
				ttAdd(0, -1, 0, L["CTRL_SHIFT_CLICK"], color_1)
			end
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
local MainPanel
do
	MainPanel = CreateFrame("Frame", "ARL_MainPanel", UIParent)

	-- The panel width changes when contracting and expanding - store it for later use.
	MainPanel.normal_width = 384
	MainPanel.expanded_width = 768

	MainPanel:SetWidth(MainPanel.normal_width)
	MainPanel:SetHeight(512)
	MainPanel:SetFrameStrata("MEDIUM")
	MainPanel:SetToplevel(true)
	MainPanel:SetClampedToScreen(true)
	MainPanel:SetClampRectInsets(0, -35, 0, 53)

	MainPanel:SetHitRectInsets(0, 35, 0, 53)
	MainPanel:EnableMouse(true)
	MainPanel:EnableKeyboard(true)
	MainPanel:SetMovable(true)

	MainPanel.is_expanded = false

	-- Let the user banish the MainPanel with the ESC key.
	table.insert(UISpecialFrames, "ARL_MainPanel")
	addon.Frame = MainPanel

	local top_left = MainPanel:CreateTexture(nil, "ARTWORK")
	top_left:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopLeft")
	top_left:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 0, 0)
	MainPanel.top_left = top_left

	local top_right = MainPanel:CreateTexture(nil, "ARTWORK")
	top_right:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopRight")
	top_right:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", 0, 0)
	MainPanel.top_right = top_right

	local bottom_left = MainPanel:CreateTexture(nil, "ARTWORK")
	bottom_left:SetTexture("Interface\\QuestFrame\\UI-QuestLog-BotLeft")
	bottom_left:SetPoint("BOTTOMLEFT", MainPanel, "BOTTOMLEFT", 0, 0)
	MainPanel.bottom_left = bottom_left

	local bottom_right = MainPanel:CreateTexture(nil, "ARTWORK")
	bottom_right:SetTexture("Interface\\QuestFrame\\UI-QuestLog-BotRight")
	bottom_right:SetPoint("BOTTOMRIGHT", MainPanel, "BOTTOMRIGHT", 0, 0)
	MainPanel.bottom_right = bottom_right

	local title_bar = MainPanel:CreateFontString(nil, "ARTWORK")
	title_bar:SetFontObject("GameFontHighlightSmall")
	title_bar:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 20, -20)
	title_bar:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -40, -20)
	title_bar:SetJustifyH("CENTER")
	MainPanel.title_bar = title_bar

	MainPanel:Hide()
end	-- do block

-------------------------------------------------------------------------------
-- Widget Container frame.
-------------------------------------------------------------------------------
local WidgetContainer = CreateFrame("Frame", nil, MainPanel)
WidgetContainer:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 75, -39)
WidgetContainer:SetHeight(30)
WidgetContainer:SetWidth(275)

-------------------------------------------------------------------------------
-- Tabs
-------------------------------------------------------------------------------
local AcquisitionTab, LocationTab, RecipesTab
do
	local function Tab_Enable(self)
		self.left:ClearAllPoints()
		self.left:SetPoint("BOTTOMLEFT")
		self.left:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-ActiveTab")
		self.middle:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-ActiveTab")
		self.right:SetTexture("Interface\\PAPERDOLLINFOFRAME\\UI-Character-ActiveTab")
		self:Disable()
	end

	function Tab_Disable(self)
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
		end
		addon.db.profile.current_tab = id_num
		MainPanel.current_tab = id_num

		ListFrame:Update(nil, false)
		PlaySound("igCharacterInfoTab")
	end

	-- Expands or collapses a list entry in the current active tab.
	local function Tab_ModifyEntry(self, entry, expanded)
		local member = ORDERED_PROFESSIONS[MainPanel.profession] .. " expanded"

		if entry.acquire_id then
			self[member][private.acquire_names[entry.acquire_id]] = expanded or nil
		end

		if entry.location_id then
			self[member][entry.location_id] = expanded or nil
		end

		if entry.recipe_id then
			self[member][entry.recipe_id] = expanded or nil
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
		tab.ModifyEntry = Tab_ModifyEntry

		tab:ToBack()

		tab:SetScript("OnClick", Tab_OnClick)

		return tab
	end
	AcquisitionTab = CreateTab(1, L["Acquisition"], "TOPLEFT", MainPanel, "BOTTOMLEFT", 4, 81)
	LocationTab = CreateTab(2, L["Location"], "LEFT", AcquisitionTab, "RIGHT", -14, 0)
	RecipesTab = CreateTab(3, _G.TRADESKILL_SERVICE_LEARN, "LEFT", LocationTab, "RIGHT", -14, 0)

	-- Used for Location and Acquisition sort - since many recipes have multiple locations/acquire types it is
	-- necessary to ensure each is counted only once.
	local recipe_registry = {}

	local function FactionTally(source_data, unit_list, location)
		local good, bad = 0, 0

		for id_num in pairs(source_data) do
			local unit_faction = unit_list[id_num].faction

			if not location or unit_list[id_num].location == location then
				if not unit_faction or unit_faction == BFAC[Player.faction] or unit_faction == BFAC["Neutral"] then
					good = good + 1
				else
					bad = bad + 1
				end
			end
		end
		return good, bad
	end

	-------------------------------------------------------------------------------
	-- Variables used to hold tables for sorting the various tabs:
	-- The tables are only sorted once, upon creation.
	-------------------------------------------------------------------------------
	local sorted_acquires
	local sorted_locations

	function AcquisitionTab:Initialize(expand_mode)
		local search_box = MainPanel.search_editbox

		local recipe_count = 0
		local insert_index = 1

		twipe(recipe_registry)

		if not sorted_acquires then
			-- Sorting function: Only used once and then thrown away.
			local function Sort_Acquisition(a, b)
				local acquire_list = private.acquire_list
				local acquire_a = acquire_list[a]
				local acquire_b = acquire_list[b]

				return acquire_a.name < acquire_b.name
			end
			sorted_acquires = {}

			for acquire_name in pairs(private.acquire_list) do
				table.insert(sorted_acquires, acquire_name)
			end
			table.sort(sorted_acquires, Sort_Acquisition)
		end
		local prof_name = ORDERED_PROFESSIONS[MainPanel.profession]

		self[prof_name.." expanded"] = self[prof_name.." expanded"] or {}

		for index = 1, #sorted_acquires do
			local acquire_type = sorted_acquires[index]
			local count = 0

			-- Check to see if any recipes for this acquire type will be shown - otherwise, don't show the type in the list.
			for spell_id, affiliation in pairs(private.acquire_list[acquire_type].recipes) do
				local recipe = private.recipe_list[spell_id]

				if recipe:HasState("VISIBLE") and search_box:MatchesRecipe(recipe) then
					count = count + 1

					if not recipe_registry[recipe] then
						recipe_registry[recipe] = true
						recipe_count = recipe_count + 1
					end
				else
					self[prof_name.." expanded"][spell_id] = nil
				end
			end

			if count > 0 then
				local t = AcquireTable()

				local acquire_str = string.gsub(private.acquire_strings[acquire_type]:lower(), "_", "")
				local color_code = private.category_colors[acquire_str] or "ffffff"
				local is_expanded = self[prof_name.." expanded"][private.acquire_names[acquire_type]]

				t.text = string.format("%s (%d)", SetTextColor(color_code, private.acquire_names[acquire_type]), count)
				t.acquire_id = acquire_type

				insert_index = ListFrame:InsertEntry(t, nil, insert_index, "header", is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name.." expanded"][private.acquire_names[acquire_type]] = nil
			end
		end
		return recipe_count
	end

	function LocationTab:Initialize(expand_mode)
		local search_box = MainPanel.search_editbox

		local recipe_count = 0
		local insert_index = 1

		twipe(recipe_registry)

		if not sorted_locations then
			-- Sorting function: Only used once and then thrown away.
			local function Sort_Location(a, b)
				local location_list = private.location_list
				local loc_a = location_list[a]
				local loc_b = location_list[b]

				return loc_a.name < loc_b.name
			end
			sorted_locations = {}

			for loc_name in pairs(private.location_list) do
				table.insert(sorted_locations, loc_name)
			end
			table.sort(sorted_locations, Sort_Location)
		end
		local prof_name = ORDERED_PROFESSIONS[MainPanel.profession]

		self[prof_name.." expanded"] = self[prof_name.." expanded"] or {}

		for index = 1, #sorted_locations do
			local loc_name = sorted_locations[index]
			local count = 0

			-- Check to see if any recipes for this location will be shown - otherwise, don't show the location in the list.
			for spell_id, affiliation in pairs(private.location_list[loc_name].recipes) do
				local recipe = private.recipe_list[spell_id]

				if recipe:HasState("VISIBLE") and search_box:MatchesRecipe(recipe) then
					local trainer_data = recipe.acquire_data[A.TRAINER]
					local good_count, bad_count = 0, 0
					local fac_toggle = addon.db.profile.filters.general.faction

					if not fac_toggle then
						if trainer_data then
							local good, bad = FactionTally(trainer_data, private.trainer_list, loc_name)

							if good == 0 and bad > 0 then
								bad_count = bad_count + 1
							else
								good_count = good_count + 1
							end
						end
						local vendor_data = recipe.acquire_data[A.VENDOR]

						if vendor_data then
							local good, bad = FactionTally(vendor_data, private.vendor_list, loc_name)

							if good == 0 and bad > 0 then
								bad_count = bad_count + 1
							else
								good_count = good_count + 1
							end
						end
						local quest_data = recipe.acquire_data[A.QUEST]

						if quest_data then
							local good, bad = FactionTally(quest_data, private.quest_list, loc_name)

							if good == 0 and bad > 0 then
								bad_count = bad_count + 1
							else
								good_count = good_count + 1
							end
						end
					end

					if fac_toggle or not (good_count == 0 and bad_count > 0) then
						count = count + 1

						if not recipe_registry[recipe] then
							recipe_registry[recipe] = true
							recipe_count = recipe_count + 1
						end
					end
				else
					self[prof_name.." expanded"][spell_id] = nil
				end
			end

			if count > 0 then
				local t = AcquireTable()

				local is_expanded = self[prof_name.." expanded"][loc_name]

				t.text = string.format("%s (%d)", SetTextColor(private.category_colors["location"], loc_name), count)
				t.location_id = loc_name

				insert_index = ListFrame:InsertEntry(t, nil, insert_index, "header", is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name.." expanded"][loc_name] = nil
			end
		end
		return recipe_count
	end

	function RecipesTab:Initialize(expand_mode)
		local sorted_recipes = addon.sorted_recipes
		local recipe_list = private.recipe_list
		local search_box = MainPanel.search_editbox

		local recipe_count = 0
		local insert_index = 1
		local prof_name = ORDERED_PROFESSIONS[MainPanel.profession]

		self[prof_name.." expanded"] = self[prof_name.." expanded"] or {}

		SortRecipeList(recipe_list, sorted_recipes)

		for i = 1, #sorted_recipes do
			local recipe_index = sorted_recipes[i]
			local recipe = recipe_list[recipe_index]

			if recipe:HasState("VISIBLE") and search_box:MatchesRecipe(recipe) then
				local t = AcquireTable()

				local is_expanded = self[prof_name.." expanded"][recipe_index]

				t.text = recipe:GetDisplayName()
				t.recipe_id = recipe_index

				recipe_count = recipe_count + 1

				insert_index = ListFrame:InsertEntry(t, nil, insert_index, "header", is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name.." expanded"][recipe_index] = nil
			end
		end
		return recipe_count
	end

	MainPanel.tabs = {
		AcquisitionTab,
		LocationTab,
		RecipesTab,
	}
end	-- do-block

-------------------------------------------------------------------------------
-- MainPanel scripts/functions.
-------------------------------------------------------------------------------
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

function MainPanel:ToggleState()
	local x, y = self:GetLeft(), self:GetBottom()

	if self.is_expanded then
		self:SetWidth(self.normal_width)
		self:SetHitRectInsets(0, 35, 0, 53)
		self:SetClampRectInsets(0, -35, 0, 53)

		self.top_left:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopLeft")
		self.top_right:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopRight")
		self.bottom_left:Show()
		self.bottom_right:Show()

		self.xclose_button:ClearAllPoints()
		self.xclose_button:SetPoint("TOPRIGHT", self, "TOPRIGHT", -30, -8)
	else
		self:SetWidth(self.expanded_width)
		self:SetHitRectInsets(0, 90, 0, 53)
		self:SetClampRectInsets(0, -90, 0, 53)

		self.top_left:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Left")
		self.top_right:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Right")
		self.bottom_left:Hide()
		self.bottom_right:Hide()

		self.xclose_button:ClearAllPoints()
		self.xclose_button:SetPoint("TOPRIGHT", self, "TOPRIGHT", -84, -8)
	end
	self.is_expanded = not self.is_expanded

	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y)
	self:UpdateTitle()
end

function MainPanel:UpdateTitle()
	local current_prof = ORDERED_PROFESSIONS[self.profession]

	if not self.is_expanded then
		self.title_bar:SetFormattedText(SetTextColor(BASIC_COLORS["normal"], "ARL (%s) - %s"), addon.version, current_prof)
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
	self.title_bar:SetFormattedText(SetTextColor(BASIC_COLORS["normal"], "ARL (%s) - %s (%d/%d %s)"), addon.version, current_prof, active, total, _G.FILTERS)
end

-------------------------------------------------------------------------------
-- Create the profession-cycling button and assign its values.
-------------------------------------------------------------------------------
local ProfCycle = CreateFrame("Button", nil, MainPanel, "UIPanelButtonTemplate")
ProfCycle:SetWidth(64)
ProfCycle:SetHeight(64)
ProfCycle:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 5, -4)
ProfCycle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

ProfCycle._normal = ProfCycle:CreateTexture(nil, "BACKGROUND")
ProfCycle._pushed = ProfCycle:CreateTexture(nil, "BACKGROUND")
ProfCycle._disabled = ProfCycle:CreateTexture(nil, "BACKGROUND")

MainPanel.prof_button = ProfCycle

-------------------------------------------------------------------------------
-- ProfCycle scripts/functions.
-------------------------------------------------------------------------------
ProfCycle:SetScript("OnClick",
		    function(self, button, down)
			    -- Known professions should be in Player.professions

			    -- This loop is gonna be weird. The reason is because we need to
			    -- ensure that we cycle through all the known professions, but also
			    -- that we do so in order. That means that if the currently displayed
			    -- profession is the last one in the list, we're actually going to
			    -- iterate completely once to get to the currently displayed profession
			    -- and then iterate again to make sure we display the next one in line.
			    -- Further, there is the nuance that the person may not know any
			    -- professions yet at all. Users are so annoying.
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
			    local trade_frame = _G.GnomeWorksFrame or _G.Skillet or _G.MRTSkillFrame or _G.ATSWFrame or _G.CauldronFrame or _G.TradeSkillFrame
			    local is_shown = trade_frame:IsVisible()
			    local sfx

			    PlaySound("igCharacterNPCSelect")

			    -- If not shown, save the current sound effects setting then set it to 0.
			    if not is_shown then
				    sfx = tonumber(GetCVar("Sound_EnableSFX"))
				    SetCVar("Sound_EnableSFX", 0)
			    end
			    CastSpellByName(ORDERED_PROFESSIONS[MainPanel.profession])
			    addon:Scan()

			    if not is_shown then
				    CloseTradeSkill()
				    SetCVar("Sound_EnableSFX", sfx)
			    end
		    end)

function ProfCycle:ChangeTexture(texture)
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
		local current_prof = ORDERED_PROFESSIONS[MainPanel.profession]

		pattern = pattern:lower()

		for index, entry in pairs(private.recipe_list) do
			entry:RemoveState("RELEVANT")

			if entry.profession == current_prof then
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
	ListFrame:Update(nil, false)
end

-- If there is text in the search box, return the recipe's RELEVANT state.
function SearchBox:MatchesRecipe(recipe)
	local editbox_text = self:GetText()

	if editbox_text ~= "" and editbox_text ~= _G.SEARCH then
		return recipe:HasState("RELEVANT")
	end
	return true
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
			    ListFrame:Update(nil, false)
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
					  ListFrame:Update(nil, false)
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
-- Create the expand button and set its scripts.
-------------------------------------------------------------------------------
local ExpandButtonFrame = CreateFrame("Frame", nil, MainPanel)
ExpandButtonFrame:SetWidth(45)
ExpandButtonFrame:SetHeight(20)
ExpandButtonFrame:SetPoint("TOPLEFT", SearchBox, "BOTTOMLEFT", -12, -5)

ExpandButtonFrame.left = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.left:SetWidth(8)
ExpandButtonFrame.left:SetHeight(22)
ExpandButtonFrame.left:SetPoint("TOPLEFT", ExpandButtonFrame, 0, 4)
ExpandButtonFrame.left:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Left")

ExpandButtonFrame.right = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.right:SetWidth(8)
ExpandButtonFrame.right:SetHeight(22)
ExpandButtonFrame.right:SetPoint("TOPRIGHT", ExpandButtonFrame, 0, 4)
ExpandButtonFrame.right:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Right")

ExpandButtonFrame.middle = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.middle:SetHeight(22)
ExpandButtonFrame.middle:SetPoint("LEFT", ExpandButtonFrame.left, "RIGHT")
ExpandButtonFrame.middle:SetPoint("RIGHT", ExpandButtonFrame.right, "LEFT")
ExpandButtonFrame.middle:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Middle")

local ExpandButton = GenericCreateButton(nil, MainPanel, 16, 16, "GameFontNormalSmall", _G.ALL, "LEFT", L["EXPANDALL_DESC"], 2)

MainPanel.expand_all_button = ExpandButton

ExpandButton:SetPoint("LEFT", ExpandButtonFrame.left, "RIGHT", -3, -3)

ExpandButton.text:ClearAllPoints()
ExpandButton.text:SetPoint("LEFT", ExpandButton, "Right", 0, 0)

ExpandButton:SetScript("OnClick",
		       function(self, mouse_button, down)
			       local current_tab = MainPanel.tabs[MainPanel.current_tab]
			       local expanded = current_tab["expand_button_"..MainPanel.profession]
			       local expand_mode

			       if not expanded then
				       if _G.IsShiftKeyDown() then
					       expand_mode = "deep"
				       else
					       expand_mode = "normal"
				       end
			       else
				       local prof_name = ORDERED_PROFESSIONS[MainPanel.profession]

				       table.wipe(current_tab[prof_name.." expanded"])
			       end
			       -- ListFrame:Update() must be called before the button can be expanded or contracted, since
			       -- the button is contracted from there.
			       -- If expand_mode is nil, that means expand nothing.
			       ListFrame:Update(expand_mode, false)

			       if expanded then
				       self:Contract(current_tab)
			       else
				       self:Expand(current_tab)
			       end
		       end)

function ExpandButton:Expand(current_tab)
	current_tab["expand_button_"..MainPanel.profession] = true

	self:SetNormalTexture("Interface\\BUTTONS\\UI-MinusButton-Up")
	self:SetPushedTexture("Interface\\BUTTONS\\UI-MinusButton-Down")
	self:SetHighlightTexture("Interface\\BUTTONS\\UI-PlusButton-Hilight")
	self:SetDisabledTexture("Interface\\BUTTONS\\UI-MinusButton-Disabled")

	SetTooltipScripts(self, L["CONTRACTALL_DESC"])
end

function ExpandButton:Contract(current_tab)
	current_tab["expand_button_"..MainPanel.profession] = nil

	self:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
	self:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
	self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	self:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")

	SetTooltipScripts(self, L["EXPANDALL_DESC"])
end

-------------------------------------------------------------------------------
-- "Skill Level" checkbox.
-------------------------------------------------------------------------------
local SkillToggle = CreateFrame("CheckButton", nil, MainPanel, "UICheckButtonTemplate")
SkillToggle:SetPoint("TOPLEFT", SearchBox, "TOPRIGHT", 0, 0)
SkillToggle:SetHeight(16)
SkillToggle:SetWidth(16)

SkillToggle.text = SkillToggle:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
SkillToggle.text:SetPoint("LEFT", SkillToggle, "RIGHT", 0, 0)

SkillToggle:SetScript("OnClick",
		      function(self, button, down)
			      addon.db.profile.skill_view = not addon.db.profile.skill_view
			      ListFrame:Update(nil, false)
		      end)

SkillToggle:SetScript("OnShow",
		      function(self)
			      self:SetChecked(addon.db.profile.skill_view)
		      end)

SkillToggle:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
SkillToggle:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
SkillToggle:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
SkillToggle:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
SkillToggle:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

SkillToggle.text:SetText(_G.SKILL_LEVEL)
SetTooltipScripts(SkillToggle, L["SKILL_TOGGLE_DESC"], 1)

-------------------------------------------------------------------------------
-- "Display Exclusions" checkbox.
-------------------------------------------------------------------------------
local ExcludeToggle = CreateFrame("CheckButton", nil, MainPanel, "UICheckButtonTemplate")
ExcludeToggle:SetPoint("TOP", SkillToggle, "BOTTOM", 0, 1)
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
MainPanel.xclose_button:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -30, -8)

MainPanel.xclose_button:SetScript("OnClick",
				  function(self, button, down)
					  MainPanel:Hide()
				  end)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_toggle, and set its scripts.
-------------------------------------------------------------------------------
do
	local VALID_CATEGORY = {
		["general"]	= true,
		["obtain"]	= true,
		["binding"]	= true,
		["item"]	= true,
		["quality"]	= true,
		["player"]	= true,
		["rep"]		= true,
		["misc"]	= true,
	}

	local function Toggle_OnClick(self, button, down)
		if MainPanel.is_expanded then
			-- Change the text and tooltip for the filter button
			SetTooltipScripts(self, L["FILTER_OPEN_DESC"])

			-- Hide the category buttons
			for category in pairs(MainPanel.filter_menu) do
				if VALID_CATEGORY[category] then
					MainPanel["menu_toggle_" .. category]:Hide()
				end
			end
			MainPanel.filter_reset:Hide()
			MainPanel.filter_menu:Hide()
		else
			-- Change the text and tooltip for the filter button
			SetTooltipScripts(self, L["FILTER_CLOSE_DESC"])

			local found_active = false

			-- Show the category buttons. If one has been selected, show its information in the panel.
			for category in pairs(MainPanel.filter_menu) do
				local toggle = "menu_toggle_" .. category

				if VALID_CATEGORY[category] then
					MainPanel[toggle]:Show()

					if MainPanel[toggle]:GetChecked() then
						found_active = true
						MainPanel.filter_menu[category]:Show()
						MainPanel.filter_menu:Show()
					end
				end
			end

			-- If nothing was checked, default to the general filters.
			if not found_active then
				MainPanel.menu_toggle_general:SetChecked(true)
				MainPanel.filter_menu.general:Show()
				MainPanel.filter_menu:Show()
			end
			MainPanel.filter_reset:Show()
		end
		MainPanel:ToggleState()
		self:SetTextures()
	end

	local filter_toggle = GenericCreateButton(nil, MainPanel, 24, 24, nil, nil, nil, L["FILTER_OPEN_DESC"], 2)
	filter_toggle:SetPoint("TOPRIGHT", WidgetContainer, "TOPRIGHT", -2, -2)

	filter_toggle:SetScript("OnClick", Toggle_OnClick)

	filter_toggle:SetHighlightTexture([[Interface\CHATFRAME\UI-ChatIcon-BlinkHilight]])
	
	function filter_toggle:SetTextures()
		if MainPanel.is_expanded then
			self:SetNormalTexture([[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Up]])
			self:SetPushedTexture([[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Down]])
			self:SetDisabledTexture([[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Disabled]])
		else
			self:SetNormalTexture([[Interface\BUTTONS\UI-SpellbookIcon-NextPage-Up]])
			self:SetPushedTexture([[Interface\BUTTONS\UI-SpellbookIcon-NextPage-Down]])
			self:SetDisabledTexture([[Interface\BUTTONS\UI-SpellbookIcon-NextPage-Disabled]])
		end
	end
	MainPanel.filter_toggle = filter_toggle
end	-- do-block
-------------------------------------------------------------------------------
-- Create MainPanel.filter_reset and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_reset = GenericCreateButton(nil, MainPanel, 22, 78, "GameFontNormalSmall", _G.RESET, "CENTER", L["RESET_DESC"], 1)
MainPanel.filter_reset:SetPoint("BOTTOMRIGHT", MainPanel, "BOTTOMRIGHT", -95, 80)
MainPanel.filter_reset:Hide()

-- Set all the current options in the filter menu to make sure they are consistent with the SV options.
local function UpdateFilterMarks()
	for filter, info in pairs(FilterValueMap) do
		if info.svroot then
			info.cb:SetChecked(info.svroot[filter])
		end
	end
end

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

	function ResetFilters()
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
			UpdateFilterMarks()
			ListFrame:Update(nil, false)
		end
	end
	MainPanel.filter_reset:SetScript("OnClick", ResetFilters)
end	-- do

-------------------------------------------------------------------------------
-- Function to create and initialize a check-button with the given values. Used in all of
-- the sub-menus of MainPanel.filter_menu
-------------------------------------------------------------------------------
local GenerateCheckBoxes
do
	local function CheckButton_OnClick(self, button, down)
		local script_val = self.script_val

		FilterValueMap[script_val].svroot[script_val] = FilterValueMap[script_val].cb:GetChecked() and true or false
		MainPanel:UpdateTitle()
		ListFrame:Update(nil, false)
	end

	local function CreateCheckButton(parent, ttText, scriptVal, row, col)
		-- set the position of the new checkbox
		local xPos = 2 + ((col - 1) * 175)
		local yPos = -3 - ((row - 1) * 17)

		local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		check:SetPoint("TOPLEFT", parent, "TOPLEFT", xPos, yPos)
		check:SetHeight(24)
		check:SetWidth(24)

		check.text = check:CreateFontString(nil, "OVERLAY", "QuestFontNormalSmall")
		check.text:SetPoint("LEFT", check, "RIGHT", 0, 0)

		check.script_val = scriptVal

		check:SetScript("OnClick", CheckButton_OnClick)

		SetTooltipScripts(check, ttText, 1)

		return check
	end

	function GenerateCheckBoxes(parent, source)
		for section, data in pairs(source) do
			parent[section] = CreateCheckButton(parent, data.tt, section, data.row, data.col)
			parent[section].text:SetText(data.text)
		end
	end
end	-- do

-------------------------------------------------------------------------------
-- Create the ListFrame and set its scripts.
-------------------------------------------------------------------------------
ListFrame = CreateFrame("Frame", "ARL_MainPanelScrollFrame", MainPanel)

MainPanel.scroll_frame = ListFrame

ListFrame:SetHeight(335)
ListFrame:SetWidth(295)
ListFrame:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 22, -75)
ListFrame:SetBackdrop({
			      bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
			      tile = true,
			      tileSize = 16,
		      })
ListFrame:SetBackdropColor(1, 1, 1)
ListFrame:EnableMouse(true)
ListFrame:EnableMouseWheel(true)

ListFrame.entries = {}
ListFrame.button_containers = {}
ListFrame.state_buttons = {}
ListFrame.entry_buttons = {}

-------------------------------------------------------------------------------
-- Sort-mode toggle button.
-------------------------------------------------------------------------------
local SortToggle = GenericCreateButton(nil, MainPanel, 24, 24, nil, nil, nil, L["SORTING_DESC"], 2)

MainPanel.sort_button = SortToggle

SortToggle:SetPoint("LEFT", ExpandButtonFrame, "RIGHT", 0, 2)

SortToggle:SetScript("OnClick",
		     function(self, button, down)
			     local sort_type = addon.db.profile.sorting

			     addon.db.profile.sorting = (sort_type == "Ascending" and "Descending" or "Ascending")

			     self:SetTextures()
			     ListFrame:Update(nil, false)
		     end)

SortToggle:SetHighlightTexture([[Interface\CHATFRAME\UI-ChatIcon-BlinkHilight]])

function SortToggle:SetTextures()
	local sort_type = addon.db.profile.sorting

	if sort_type == "Ascending" then
		self:SetNormalTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollDown-Up]])
		self:SetPushedTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollDown-Down]])
		self:SetDisabledTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollDown-Disabled]])
	else
		self:SetNormalTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollUp-Up]])
		self:SetPushedTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollUp-Down]])
		self:SetDisabledTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollUp-Disabled]])
	end
end

-------------------------------------------------------------------------------
-- Create ListFrame.scroll_bar, and set its scripts.
-------------------------------------------------------------------------------
local ScrollBar = CreateFrame("Slider", nil, ListFrame)

ScrollBar:SetPoint("TOPLEFT", ListFrame, "TOPRIGHT", 5, -11)
ScrollBar:SetPoint("BOTTOMLEFT", ListFrame, "BOTTOMRIGHT", 5, 12)
ScrollBar:SetWidth(24)

ScrollBar:EnableMouseWheel(true)
ScrollBar:SetOrientation("VERTICAL")

ScrollBar:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
ScrollBar:SetMinMaxValues(0, 1)
ScrollBar:SetValueStep(1)

ListFrame.scroll_bar = ScrollBar

-------------------------------------------------------------------------------
-- Create ListFrame.button_up, then set its scripts and textures.
-- Parented to ScrollBar so it hides simultaneously.
-------------------------------------------------------------------------------
local ScrollUpButton = CreateFrame("Button", nil, ScrollBar, "UIPanelScrollUpButtonTemplate")

ScrollUpButton:SetHeight(16)
ScrollUpButton:SetWidth(18)
ScrollUpButton:SetPoint("BOTTOM", ScrollBar, "TOP", 0, -4)

-------------------------------------------------------------------------------
-- Create ListFrame.button_down, then set its scripts and textures.
-- Parented to ScrollBar so it hides simultaneously.
-------------------------------------------------------------------------------
local ScrollDownButton = CreateFrame("Button", nil, ScrollBar,"UIPanelScrollDownButtonTemplate")

ScrollDownButton:SetHeight(16)
ScrollDownButton:SetWidth(18)
ScrollDownButton:SetPoint("TOP", ScrollBar, "BOTTOM", 0, 4)

do
	-- Number of visible lines in the scrollframe.
	local NUM_RECIPE_LINES = 25
	local SCROLL_DEPTH = 5

	local function ScrollBar_Scroll(delta)
		if not ScrollBar:IsShown() then
			return
		end
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
					 if _G.IsAltKeyDown() then
						 local min_val = ScrollBar:GetMinMaxValues()
						 ScrollBar:SetValue(min_val)
					 else
						 ScrollBar_Scroll(1)
					 end
				 end)

	ScrollDownButton:SetScript("OnClick",
				 function(self, button, down)
					 if _G.IsAltKeyDown() then
						 local _, max_val = ScrollBar:GetMinMaxValues()
						 ScrollBar:SetValue(max_val)
					 else
						 ScrollBar_Scroll(-1)
					 end
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
			    function(self, value)
				    local min_val, max_val = self:GetMinMaxValues()
				    local current_tab = MainPanel.tabs[MainPanel.current_tab]
				    local member = "profession_"..MainPanel.profession.."_scroll_value"

				    current_tab[member] = value

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
		ListItem_ShowTooltip(self, ListFrame.entries[self.string_index])
	end

	local function Bar_OnLeave()
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
				addon:AddWaypoint(clicked_line.recipe_id, clicked_line.acquire_id, clicked_line.location_id, clicked_line.npc_id)
			elseif _G.IsShiftKeyDown() then
				local itemID = private.recipe_list[clicked_line.recipe_id].item_id

				if itemID then
					local _, itemLink = _G.GetItemInfo(itemID)

					if itemLink then
						local edit_box = _G.ChatEdit_ChooseBoxForSend()

						_G.ChatEdit_ActivateChat(edit_box)
						edit_box:Insert(itemLink)
					else
						addon:Print(L["NoItemLink"])
					end
				else
					addon:Print(L["NoItemLink"])
				end
			elseif _G.IsControlKeyDown() then
				local edit_box = _G.ChatEdit_ChooseBoxForSend()

				_G.ChatEdit_ActivateChat(edit_box)
				edit_box:Insert(GetSpellLink(private.recipe_list[clicked_line.recipe_id].spell_id))
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
				local current_tab = MainPanel.tabs[MainPanel.current_tab]

				-- get rid of our expanded lines
				while entry and entry.type ~= check_type do
					-- Headers are never removed.
					if entry.type == "header" then
						break
					end
					current_tab:ModifyEntry(entry, false)
					ReleaseTable(table.remove(ListFrame.entries, traverseIndex))
					entry = ListFrame.entries[traverseIndex]

					if not entry then
						break
					end
				end
				current_tab:ModifyEntry(clicked_line, false)
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
				local current_tab = MainPanel.tabs[MainPanel.current_tab]

				parent.is_expanded = false
				current_tab:ModifyEntry(parent, false)

				local child_index = parent_index + 1

				while entries[child_index] and entries[child_index].parent == parent do
					ReleaseTable(table.remove(entries, child_index))
				end
			else
				addon:Debug("Error: clicked_line has no parent.")
			end
		end
		QTip:Release(acquire_tip)
		spell_tip:Hide()

		ListFrame:Update(nil, true)
	end
	local LISTFRAME_WIDTH = ListFrame:GetWidth()

	-------------------------------------------------------------------------------
	-- Create the state/entry buttons and the container frames which hold them.
	-------------------------------------------------------------------------------
	for i = 1, NUM_RECIPE_LINES do
		local cur_container = CreateFrame("Frame", nil, ListFrame)

		cur_container:SetHeight(16)
		cur_container:SetWidth(LISTFRAME_WIDTH)

		local cur_state = GenericCreateButton(nil, ListFrame, 16, 16, nil, nil, nil, nil, 2)
		local cur_entry = GenericCreateButton(nil, ListFrame, 16, LISTFRAME_WIDTH, "GameFontNormalSmall", "Blort", "LEFT", nil, 0)

		if i == 1 then
			cur_container:SetPoint("TOPLEFT", ListFrame, "TOPLEFT", 0, 0)
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

	function ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, entry_expanded, expand_mode)
		entry.type = entry_type

		if parent_entry then
			if parent_entry ~= entry then
				entry.parent = parent_entry

				local recipe_id = parent_entry.recipe_id
				local acquire_id = parent_entry.acquire_id
				local location_id = parent_entry.location_id
				local npc_id = parent_entry.npc_id

				if recipe_id then
					entry.recipe_id = recipe_id
				end

				if acquire_id then
					entry.acquire_id = acquire_id
				end

				if location_id then
					entry.location_id = location_id
				end

				if npc_id then
					entry.npc_id = npc_id
				end
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
			local current_tab = MainPanel.tabs[MainPanel.current_tab]

			entry.is_expanded = true
			table.insert(self.entries, insert_index, entry)

			current_tab:ModifyEntry(entry, entry_expanded)

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

	function ListFrame:Initialize(expand_mode)
		for i = 1, #self.entries do
			ReleaseTable(self.entries[i])
		end
		twipe(self.entries)

		addon:UpdateFilters(MainPanel.is_linked)

		-------------------------------------------------------------------------------
		-- Mark all exclusions in the recipe database to not be displayed, and update
		-- the player's known and unknown counts.
		-------------------------------------------------------------------------------
		local exclusion_list = addon.db.profile.exclusionlist
		local ignored = not addon.db.profile.ignoreexclusionlist
		local recipe_list = private.recipe_list
		local current_prof = ORDERED_PROFESSIONS[MainPanel.profession]
		local known_count = 0
		local unknown_count = 0

		for spell_id in pairs(exclusion_list) do
			local recipe = recipe_list[spell_id]

			if recipe then
				if recipe:HasState("KNOWN") and recipe.profession == current_prof then
					known_count = known_count + 1
				elseif recipe_profession == current_prof then
					unknown_count = unknown_count + 1
				end
			end
		end
		Player.excluded_recipes_known = known_count
		Player.excluded_recipes_unknown = unknown_count

		-------------------------------------------------------------------------------
		-- Initialize the expand button and entries for the current tab.
		-------------------------------------------------------------------------------
		local current_tab = MainPanel.tabs[addon.db.profile.current_tab]
		local expanded_button = current_tab["expand_button_"..MainPanel.profession]

		if expanded_button then
			ExpandButton:Expand(current_tab)
		else
			ExpandButton:Contract(current_tab)
		end
		local recipe_count = current_tab:Initialize(expand_mode)

		-------------------------------------------------------------------------------
		-- Update the progress bar display.
		-------------------------------------------------------------------------------
		local profile = addon.db.profile
		local max_value = profile.includefiltered and Player.recipes_total or Player.recipes_total_filtered
		local cur_value = profile.includefiltered and Player.recipes_known or Player.recipes_known_filtered

		if not profile.includeexcluded and not profile.ignoreexclusionlist then
			max_value = max_value - Player.excluded_recipes_known
		end
		local progress_bar = MainPanel.progress_bar

		progress_bar:SetMinMaxValues(0, max_value)
		progress_bar:SetValue(cur_value)

		local percentage = cur_value / max_value * 100

		if (floor(percentage) < 101) and cur_value >= 0 and max_value >= 0 then
			local results = string.format(_G.SINGLE_PAGE_RESULTS_TEMPLATE, recipe_count)
			progress_bar.text:SetFormattedText("%d/%d - %1.2f%% (%s)", cur_value, max_value, percentage, results)
		else
			progress_bar.text:SetFormattedText("%s", L["NOT_YET_SCANNED"])
		end
	end

	-- Reset the current buttons/lines
	function ListFrame:ClearLines()
		local font_object = addon.db.profile.frameopts.small_list_font and "GameFontNormalSmall" or "GameFontNormal"

		for i = 1, NUM_RECIPE_LINES do
			local entry = self.entry_buttons[i]
			local state = self.state_buttons[i]

			entry.string_index = 0
			entry.text:SetFontObject(font_object)

			entry:SetText("")
			entry:SetScript("OnEnter", nil)
			entry:SetScript("OnLeave", nil)
			entry:SetWidth(LISTFRAME_WIDTH)
			entry:Disable()

			state.string_index = 0

			state:Hide()
			state:SetScript("OnEnter", nil)
			state:SetScript("OnLeave", nil)
			state:Disable()

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
				addon:Debug("Current tab is %s", tostring(addon.db.profile.current_tab))
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
			local max_val = num_entries - NUM_RECIPE_LINES
			local current_tab = MainPanel.tabs[MainPanel.current_tab]
			local scroll_value = current_tab["profession_"..MainPanel.profession.."_scroll_value"] or 0

			scroll_value = math.max(0, math.min(scroll_value, max_val))
			offset = scroll_value

			self.scroll_bar:SetMinMaxValues(0, math.max(0, max_val))
			self.scroll_bar:SetValue(scroll_value)
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
				cur_state:Enable()
			else
				cur_state:Hide()
				cur_state:Disable()
			end
			local cur_container = cur_state.container
			local cur_button = self.entry_buttons[button_index]

			if cur_entry.type == "header" or cur_entry.type == "entry" then
				cur_state:SetPoint("TOPLEFT", cur_container, "TOPLEFT", 0, 0)
			elseif cur_entry.type == "subheader" or cur_entry.type == "subentry" then
				cur_state:SetPoint("TOPLEFT", cur_container, "TOPLEFT", 15, 0)
				cur_button:SetWidth(LISTFRAME_WIDTH - 15)
			end
			cur_button.string_index = string_index
			cur_button:SetText(cur_entry.text)
			cur_button:SetScript("OnEnter", Bar_OnEnter)
			cur_button:SetScript("OnLeave", Bar_OnLeave)
			cur_button:Enable()

			button_index = button_index + 1
			string_index = string_index + 1
		end
		button_index = 1
		string_index = button_index + offset

		-- This function could possibly have been called from a mouse click or by scrolling.
		-- Since, in those cases, the list entries have changed, the mouse is likely over a different entry - a tooltip should be generated for it.
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
		t.npc_id = id_num

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], trainer.location), coord_text)
		t.recipe_id = recipe_id
		t.npc_id = id_num

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
		t.npc_id = id_num

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], vendor.location), coord_text)
		t.recipe_id = recipe_id
		t.npc_id = id_num

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
		t.npc_id = id_num

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		t = AcquireTable()
		t.text = string.format("%s%s%s %s", PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], mob.location), coord_text)
		t.recipe_id = recipe_id
		t.npc_id = id_num

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
		t.npc_id = vendor_id

		entry_index = ListFrame:InsertEntry(t, parent_entry, entry_index, entry_type, true)

		t = AcquireTable()
		t.text = PADDING .. PADDING .. faction_strings[rep_level] .. name
		t.recipe_id = recipe_id
		t.npc_id = vendor_id

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
		t.npc_id = vendor_id

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
		local search_box = MainPanel.search_editbox
		local current_tab = MainPanel.tabs[MainPanel.current_tab]
		local prof_name = ORDERED_PROFESSIONS[MainPanel.profession]

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		entry_index = entry_index + 1

		current_tab:ModifyEntry(current_entry, true)

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

					if recipe_entry:HasState("VISIBLE") and search_box:MatchesRecipe(recipe_entry) then
						local t = AcquireTable()
						local expand = false
						local type = "subheader"

						if acquire_id == A.WORLD_DROP or acquire_id == A.CUSTOM then
							expand = true
							type = "entry"
						end
						local is_expanded = current_tab[prof_name.." expanded"][spell_id] and current_tab[prof_name.." expanded"][private.acquire_names[acquire_id]]

						t.text = recipe_entry:GetDisplayName()
						t.recipe_id = spell_id
						t.acquire_id = acquire_id

						entry_index = self:InsertEntry(t, current_entry, entry_index, type, expand or is_expanded, expand_all or is_expanded)
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

					if recipe_entry:HasState("VISIBLE") and search_box:MatchesRecipe(recipe_entry) then
						local expand = false
						local type = "subheader"
						local t = AcquireTable()

						-- Add World Drop entries as normal entries.
						if recipe_list[spell_id] == "world_drop" then
							expand = true
							type = "entry"
						end
						local is_expanded = current_tab[prof_name.." expanded"][spell_id] and current_tab[prof_name.." expanded"][location_id]

						t.text = recipe_entry:GetDisplayName()
						t.recipe_id = spell_id
						t.location_id = location_id

						entry_index = self:InsertEntry(t, current_entry, entry_index, type, expand or is_expanded, expand_all or is_expanded)
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
do
	local progress_bar = CreateFrame("StatusBar", nil, MainPanel)
	progress_bar:SetWidth(216)
	progress_bar:SetHeight(18)
	progress_bar:SetPoint("BOTTOMLEFT", MainPanel, 17, 80)
	progress_bar:SetBackdrop({
					 bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
					 tile = true,
					 tileSize = 16,
				 })

	progress_bar:SetStatusBarTexture([[Interface\TARGETINGFRAME\UI-StatusBar]])
	progress_bar:SetOrientation("HORIZONTAL")
	progress_bar:SetStatusBarColor(0.37, 0.45, 1.0)

	local border = progress_bar:CreateTexture(nil, "OVERLAY")
	border:SetWidth(288)
	border:SetHeight(78)
	border:SetPoint("TOPLEFT", progress_bar, "TOPLEFT", -36, 31)
	border:SetTexture([[Interface\CastingBar\UI-CastingBar-Border]])

	local text = progress_bar:CreateFontString(nil, "ARTWORK")
	text:SetWidth(195)
	text:SetHeight(14)
	text:SetFontObject("GameFontHighlightSmall")
	text:SetPoint("CENTER", progress_bar, "CENTER", 0, 0)
	text:SetJustifyH("CENTER")
	text:SetJustifyV("CENTER")

	progress_bar.text = text
	MainPanel.progress_bar = progress_bar
end	-- do

-------------------------------------------------------------------------------
-- Create the close button, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.close_button = GenericCreateButton(nil, MainPanel, 24, 111, "GameFontNormalSmall", _G.EXIT, "CENTER", L["CLOSE_DESC"], 1)
MainPanel.close_button:SetPoint("LEFT", MainPanel.progress_bar, "RIGHT", 3, 1)

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
	local saved_link = tskl_list[click_info.realm][click_info.name][arg]

	if click_info.realm ~= _G.GetRealmName() then
		local player_guid = string.gsub(UnitGUID("player"), "0x0+", "")
		local color, trade_id, cur_lev, max_lev, guid, bitmask = string.split(":", saved_link)
		local trade_link = string.join(":", color, trade_id, cur_lev, max_lev, player_guid, bitmask)

		addon:Printf("%s (%s): %s", click_info.name, click_info.realm, trade_link)
	else
		addon:Printf("%s: %s", click_info.name, saved_link)
	end
	click_info.modified = true
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

local EXPANSION_FRAMES = {
	["expansion0"]	= true,
	["expansion1"]	= true,
	["expansion2"]	= true,
}

-------------------------------------------------------------------------------
-- Initializes runtime elements of MainPanel.
-------------------------------------------------------------------------------
local function InitializeFrame()
	-------------------------------------------------------------------------------
	-- Check to see if we're Horde or Alliance, and change the displayed
	-- reputation strings to be faction-correct.
	-------------------------------------------------------------------------------
	local isAlliance = (Player.faction == "Alliance")

	local HonorHold_Thrallmar_Text = isAlliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]
	local Kurenai_Maghar_Text = isAlliance and BFAC["Kurenai"] or BFAC["The Mag'har"]
	local Vanguard_Expedition_Text = isAlliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]
	local SilverCov_Sunreaver_Text = isAlliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]
	local Valiance_Warsong_Text = isAlliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]
	local Frostborn_Taunka_Text = isAlliance and BFAC["The Frostborn"] or BFAC["The Taunka"]
	local Explorer_Hand_Text = isAlliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]

	-------------------------------------------------------------------------------
	-- Create the seven buttons for opening/closing the filter menus
	-------------------------------------------------------------------------------
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
			local rep_menu = MainPanel.filter_menu.rep
			local ChangeFilters = false

			-- Make sure the expansion frames and toggle buttons are hidden/unchecked.
			for expansion in pairs(EXPANSION_FRAMES) do
				rep_menu[expansion]:Hide()
				rep_menu["toggle_" .. expansion]:SetChecked(false)
			end

			local toggle = "menu_toggle_" .. panel

			if not MainPanel[toggle]:GetChecked() then
				-- Display the selected filter_menu category frame
				MainPanel[toggle]:SetChecked(true)
				MainPanel.filter_menu[panel]:Show()

				-- Hide all of the other filter_menu category frames, and un-check them as well.
				for category in pairs(MainPanel.filter_menu) do
					if category ~= panel and CATEGORY_TOOLTIP[category] then
						local tog = "menu_toggle_" .. category

						MainPanel[tog]:SetChecked(false)
						MainPanel.filter_menu[category]:Hide()
					end
				end
				ChangeFilters = true
			else
				MainPanel[toggle]:SetChecked(false)
				ChangeFilters = false
			end

			if ChangeFilters then
				-- Change the filters to the current panel
				MainPanel.filter_menu:Show()
			else
				MainPanel.filter_menu:Hide()
			end
		end

		local function CreateFilterMenuButton(button_texture, category)
			local button_size = 22
			local cButton = CreateFrame("CheckButton", nil, MainPanel)

			cButton:SetWidth(button_size)
			cButton:SetHeight(button_size)
			cButton:SetScript("OnClick",
					  function(self, button, down)
						  -- The button must be unchecked for ToggleFilterMenu() to work correctly.
						  cButton:SetChecked(false)
						  ToggleFilterMenu(category)
					  end)

			local bgTex = cButton:CreateTexture(nil, "BACKGROUND")
			bgTex:SetTexture("Interface/SpellBook/UI-Spellbook-SpellBackground")
			bgTex:SetHeight(button_size + 6)
			bgTex:SetWidth(button_size + 4)
			bgTex:SetTexCoord(0, (43/64), 0, (43/64))
			bgTex:SetPoint("CENTER", cButton, "CENTER", 0, 0)

			local iconTex = cButton:CreateTexture(nil, "BORDER")
			iconTex:SetTexture("Interface/Icons/" .. button_texture)
			iconTex:SetAllPoints(cButton)

			local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
			pushedTexture:SetTexture("Interface/Buttons/UI-Quickslot-Depress")
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)

			local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture("Interface/Buttons/ButtonHilight-Square")
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode("ADD")
			cButton:SetHighlightTexture(highlightTexture)

			local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture("Interface/Buttons/CheckButtonHilight")
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode("ADD")
			cButton:SetCheckedTexture(checkedTexture)

			-- And throw up a tooltip
			SetTooltipScripts(cButton, CATEGORY_TOOLTIP[category])
			cButton:Hide()

			return cButton
		end

		local general = CreateFilterMenuButton("INV_Misc_Note_06", "general")
		general:SetPoint("LEFT", WidgetContainer, "RIGHT", 5, 0)

		local obtain = CreateFilterMenuButton("INV_Misc_Bag_07", "obtain")
		obtain:SetPoint("LEFT", general, "RIGHT", 15, 0)

		local binding = CreateFilterMenuButton("INV_Belt_20", "binding")
		binding:SetPoint("LEFT", obtain, "RIGHT", 15, 0)

		local item = CreateFilterMenuButton("INV_Misc_EngGizmos_19", "item")
		item:SetPoint("LEFT", binding, "RIGHT", 15, 0)

		local quality = CreateFilterMenuButton("INV_Enchant_VoidCrystal", "quality")
		quality:SetPoint("LEFT", item, "RIGHT", 15, 0)

		local player = CreateFilterMenuButton("INV_Misc_GroupLooking", "player")
		player:SetPoint("LEFT", quality, "RIGHT", 15, 0)

		local rep = CreateFilterMenuButton("Achievement_Reputation_01", "rep")
		rep:SetPoint("LEFT", player, "RIGHT", 15, 0)

		local misc = CreateFilterMenuButton("Trade_Engineering", "misc")
		misc:SetPoint("LEFT", rep, "RIGHT", 15, 0)

		-- Assign the buttons as members.
		MainPanel.menu_toggle_general = general
		MainPanel.menu_toggle_obtain = obtain
		MainPanel.menu_toggle_binding = binding
		MainPanel.menu_toggle_item = item
		MainPanel.menu_toggle_quality = quality
		MainPanel.menu_toggle_player = player
		MainPanel.menu_toggle_rep = rep
		MainPanel.menu_toggle_misc = misc
	end	-- do

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu and set its scripts.
	-------------------------------------------------------------------------------
	do
		local filter_menu = CreateFrame("Frame", nil, MainPanel)
		filter_menu:SetWidth(300)
		filter_menu:SetHeight(FILTERMENU_HEIGHT)
		filter_menu:SetFrameStrata("MEDIUM")
		filter_menu:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -135, -60)
		filter_menu:EnableMouse(true)
		filter_menu:EnableKeyboard(true)
		filter_menu:SetMovable(false)
		filter_menu:SetHitRectInsets(5, 5, 5, 5)
		filter_menu:Hide()

		filter_menu:SetScript("OnShow", UpdateFilterMarks)

		function filter_menu:CreateSubMenu(name)
			local submenu = CreateFrame("Frame", nil, self)

			submenu:SetWidth(FILTERMENU_LARGE)
			submenu:SetHeight(FILTERMENU_HEIGHT)
			submenu:EnableMouse(true)
			submenu:EnableKeyboard(true)
			submenu:SetMovable(false)
			submenu:SetPoint("TOPLEFT", self, "TOPLEFT", 17, -16)
			submenu:Hide()

			self[name] = submenu
			return submenu
		end

		MainPanel.filter_menu = filter_menu
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.general, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local general_frame = MainPanel.filter_menu:CreateSubMenu("general")

		-------------------------------------------------------------------------------
		-- Create the general CheckButtons.
		-------------------------------------------------------------------------------
		local general_buttons = {
			["specialty"]	= { tt = L["SPECIALTY_DESC"],	text = L["Specialties"],	row = 1, col = 1 },
			["skill"]	= { tt = L["SKILL_DESC"],	text = _G.SKILL,		row = 1, col = 2 },
			["faction"]	= { tt = L["FACTION_DESC"],	text = _G.FACTION,		row = 2, col = 1 },
			["known"]	= { tt = L["KNOWN_DESC"],	text = L["Show Known"],		row = 2, col = 2 },
			["unknown"]	= { tt = L["UNKNOWN_DESC"],	text = _G.UNKNOWN,		row = 3, col = 1 },
			["retired"]	= { tt = L["RETIRED_DESC"],	text = L["Retired"],		row = 3, col = 2 },
		}
		GenerateCheckBoxes(general_frame, general_buttons)
		general_buttons = nil

		-------------------------------------------------------------------------------
		-- Create the Class toggle and CheckButtons.
		-------------------------------------------------------------------------------
		local class_toggle = GenericCreateButton(nil, general_frame, 20, 105, "GameFontHighlight", L["Classes"] .. ":", "LEFT", L["CLASS_TEXT_DESC"], 0)
		class_toggle:SetPoint("TOPLEFT", MainPanel.filter_menu.general.unknown, "BOTTOMLEFT", -4, -10)
		class_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		class_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		class_toggle:SetScript("OnClick",
				       function(self, button)
					       local classes = addon.db.profile.filters.classes
					       local toggle = (button == "LeftButton") and true or false

					       for class in pairs(classes) do
						       classes[class] = toggle
						       general_frame[class]:SetChecked(toggle)
					       end

					       if toggle == false then
						       local class = strlower(Player["Class"])
						       classes[class] = true
						       general_frame[class]:SetChecked(true)
					       end
					       MainPanel:UpdateTitle()
					       ListFrame:Update(nil, false)
				       end)

		general_frame.class_toggle = class_toggle

		local class_buttons = {
			["deathknight"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],	row = 6,  col = 1 },
			["druid"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["DRUID"],		row = 6,  col = 2 },
			["hunter"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],		row = 7,  col = 1 },
			["mage"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["MAGE"],		row = 7,  col = 2 },
			["paladin"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],		row = 8,  col = 1 },
			["priest"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],		row = 8,  col = 2 },
			["rogue"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],		row = 9,  col = 1 },
			["shaman"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],		row = 9,  col = 2 },
			["warlock"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],		row = 10, col = 1 },
			["warrior"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],		row = 10, col = 2 },
		}
		GenerateCheckBoxes(general_frame, class_buttons)
		class_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.obtain, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local obtain_frame = MainPanel.filter_menu:CreateSubMenu("obtain")

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local obtain_buttons = {
			["instance"]	= { tt = L["INSTANCE_DESC"],		text = _G.INSTANCE,				row = 1, col = 1 },
			["raid"]	= { tt = L["RAID_DESC"],		text = _G.RAID,					row = 1, col = 2 },
			["quest"]	= { tt = L["QUEST_DESC"],		text = L["Quest"],				row = 2, col = 1 },
			["seasonal"]	= { tt = L["SEASONAL_DESC"],		text = private.acquire_names[A.SEASONAL],	row = 2, col = 2 },
			["trainer"]	= { tt = L["TRAINER_DESC"],		text = L["Trainer"],				row = 3, col = 1 },
			["vendor"]	= { tt = L["VENDOR_DESC"],		text = L["Vendor"],				row = 3, col = 2 },
			["pvp"]		= { tt = L["PVP_DESC"],			text = _G.PVP,					row = 4, col = 1 },
			["discovery"]	= { tt = L["DISCOVERY_DESC"],		text = L["Discovery"],				row = 4, col = 2 },
			["worlddrop"]	= { tt = L["WORLD_DROP_DESC"],		text = L["World Drop"],				row = 5, col = 1 },
			["mobdrop"]	= { tt = L["MOB_DROP_DESC"],		text = L["Mob Drop"],				row = 5, col = 2 },
			["expansion0"]	= { tt = L["ORIGINAL_WOW_DESC"],	text = _G.EXPANSION_NAME0,			row = 7, col = 1 },
			["expansion1"]	= { tt = L["BC_WOW_DESC"],		text = _G.EXPANSION_NAME1,			row = 8, col = 1 },
			["expansion2"]	= { tt = L["LK_WOW_DESC"],		text = _G.EXPANSION_NAME2,			row = 9, col = 1 },
		}
		GenerateCheckBoxes(obtain_frame, obtain_buttons)
		obtain_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.binding, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local binding_frame = MainPanel.filter_menu:CreateSubMenu("binding")

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local binding_buttons = {
			["itemboe"]	= { tt = L["BOE_DESC"],		text = L["BOEFilter"],		row = 1, col = 1 },
			["itembop"]	= { tt = L["BOP_DESC"],		text = L["BOPFilter"],		row = 2, col = 1 },
			["recipeboe"]	= { tt = L["RECIPE_BOE_DESC"],	text = L["RecipeBOEFilter"],	row = 3, col = 1 },
			["recipebop"]	= { tt = L["RECIPE_BOP_DESC"],	text = L["RecipeBOPFilter"],	row = 4, col = 1 },
		}
		GenerateCheckBoxes(binding_frame, binding_buttons)
		binding_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.item, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local item_frame = MainPanel.filter_menu:CreateSubMenu("item")

		-------------------------------------------------------------------------------
		-- Create the Armor toggle and CheckButtons
		-------------------------------------------------------------------------------
		local armor_toggle = GenericCreateButton(nil, item_frame, 20, 105, "GameFontHighlight", _G.ARMOR .. ":", "LEFT", L["ARMOR_TEXT_DESC"], 0)
		armor_toggle:SetPoint("TOPLEFT", item_frame, "TOPLEFT", -2, -4)
		armor_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		armor_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		armor_toggle:SetScript("OnClick",
				       function(self, button)
					       local armors = addon.db.profile.filters.item.armor
					       local toggle = (button == "LeftButton") and true or false

					       for armor in pairs(armors) do
						       armors[armor] = toggle
						       item_frame[armor]:SetChecked(toggle)
					       end
					       MainPanel:UpdateTitle()
					       ListFrame:Update(nil, false)
				       end)

		item_frame.armor_toggle = armor_toggle

		local armor_buttons = {
			["cloth"]	= { tt = L["CLOTH_DESC"],	text = L["Cloth"],	row = 2, col = 1 },
			["leather"]	= { tt = L["LEATHER_DESC"],	text = L["Leather"],	row = 2, col = 2 },
			["mail"]	= { tt = L["MAIL_DESC"],	text = L["Mail"],	row = 3, col = 1 },
			["plate"]	= { tt = L["PLATE_DESC"],	text = L["Plate"],	row = 3, col = 2 },
			["cloak"]	= { tt = L["CLOAK_DESC"],	text = L["Cloak"],	row = 4, col = 1 },
			["necklace"]	= { tt = L["NECKLACE_DESC"],	text = L["Necklace"],	row = 4, col = 2 },
			["ring"]	= { tt = L["RING_DESC"],	text = L["Ring"],	row = 5, col = 1 },
			["trinket"]	= { tt = L["TRINKET_DESC"],	text = L["Trinket"],	row = 5, col = 2 },
			["shield"]	= { tt = L["SHIELD_DESC"],	text = L["Shield"],	row = 6, col = 1 },
		}
		GenerateCheckBoxes(item_frame, armor_buttons)
		armor_buttons = nil

		-------------------------------------------------------------------------------
		-- Create the Weapon toggle and CheckButtons
		-------------------------------------------------------------------------------
		local weapon_toggle = GenericCreateButton(nil, item_frame, 20, 105, "GameFontHighlight", L["Weapon"] .. ":", "LEFT", L["WEAPON_TEXT_DESC"], 0)
		weapon_toggle:SetPoint("TOPLEFT", item_frame, "TOPLEFT", -2, -122)

		weapon_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		weapon_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		weapon_toggle:SetScript("OnClick",
					function(self, button)
						local weapons = addon.db.profile.filters.item.weapon
						local toggle = (button == "LeftButton") and true or false

						for weapon in pairs(weapons) do
							weapons[weapon] = toggle

							if FilterValueMap[weapon].svroot then
								item_frame[weapon]:SetChecked(toggle)
							end
						end
						MainPanel:UpdateTitle()
						ListFrame:Update(nil, false)
					end)

		item_frame.weapon_toggle = weapon_toggle

		local weapon_buttons = {
			["onehand"]	= { tt = L["ONEHAND_DESC"],	text = L["One Hand"],						row = 9,  col = 1 },
			["twohand"]	= { tt = L["TWOHAND_DESC"],	text = L["Two Hand"],						row = 9,  col = 2 },
			["dagger"]	= { tt = L["DAGGER_DESC"],	text = L["Dagger"],						row = 10, col = 1 },
			["axe"]		= { tt = L["AXE_DESC"],		text = L["Axe"],						row = 10, col = 2 },
			["mace"]	= { tt = L["MACE_DESC"],	text = L["Mace"],						row = 11, col = 1 },
			["sword"]	= { tt = L["SWORD_DESC"],	text = L["Sword"],						row = 11, col = 2 },
			["polearm"]	= { tt = L["POLEARM_DESC"],	text = L["Polearm"],						row = 12, col = 1 },
			["fist"]	= { tt = L["FIST_DESC"],	text = L["Fist"],						row = 12, col = 2 },
			["staff"]	= { tt = L["STAFF_DESC"],	text = SetTextColor(BASIC_COLORS["grey"], L["Staff"]),		row = 13, col = 1 },
			["wand"]	= { tt = L["WAND_DESC"],	text = L["Wand"],						row = 13, col = 2 },
			["thrown"]	= { tt = L["THROWN_DESC"],	text = L["Thrown"],						row = 14, col = 1 },
			["bow"]		= { tt = L["BOW_DESC"],		text = SetTextColor(BASIC_COLORS["grey"], L["Bow"]),		row = 14, col = 2 },
			["crossbow"]	= { tt = L["CROSSBOW_DESC"],	text = SetTextColor(BASIC_COLORS["grey"], L["Crossbow"]),	row = 15, col = 1 },
			["ammo"]	= { tt = L["AMMO_DESC"],	text = L["Ammo"],						row = 15, col = 2 },
			["gun"]		= { tt = L["GUN_DESC"],		text = L["Gun"],						row = 16, col = 1 },
		}
		GenerateCheckBoxes(item_frame, weapon_buttons)
		weapon_buttons = nil

		-- Some of these are disabled for now, since they currently have no recipes.
		item_frame.staff:Disable()
		item_frame.bow:Disable()
		item_frame.crossbow:Disable()
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.quality, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local quality_frame = MainPanel.filter_menu:CreateSubMenu("quality")

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local function QualityDesc(text)
			return string.format(L["QUALITY_GENERAL_DESC"], text)
		end

		local quality_buttons = {
			["common"]	= { tt = QualityDesc(_G.ITEM_QUALITY1_DESC),	text = _G.ITEM_QUALITY1_DESC,	row = 1, col = 1 },
			["uncommon"]	= { tt = QualityDesc(_G.ITEM_QUALITY2_DESC),	text = _G.ITEM_QUALITY2_DESC,	row = 2, col = 1 },
			["rare"]	= { tt = QualityDesc(_G.ITEM_QUALITY3_DESC),	text = _G.ITEM_QUALITY3_DESC,	row = 3, col = 1 },
			["epic"]	= { tt = QualityDesc(_G.ITEM_QUALITY4_DESC),	text = _G.ITEM_QUALITY4_DESC,	row = 4, col = 1 },
		}
		GenerateCheckBoxes(quality_frame, quality_buttons)
		quality_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.player, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local player_frame = MainPanel.filter_menu:CreateSubMenu("player")
		local tank_desc = string.format(L["ROLE_DESC_FORMAT"], _G.TANK)
		local melee_desc = string.format(L["ROLE_DESC_FORMAT"], _G.MELEE)
		local healer_desc = string.format(L["ROLE_DESC_FORMAT"], _G.HEALER)
		local caster_desc = string.format(L["ROLE_DESC_FORMAT"], _G.DAMAGER)

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local role_buttons = {
			["tank"]	= { tt = tank_desc,	text = _G.TANK,		row = 1, col = 1 },
			["melee"]	= { tt = melee_desc,	text = _G.MELEE,	row = 2, col = 1 },
			["healer"]	= { tt = healer_desc,	text = _G.HEALER,	row = 3, col = 1 },
			["caster"]	= { tt = caster_desc,	text = _G.DAMAGER,	row = 4, col = 1 },
		}
		GenerateCheckBoxes(player_frame, role_buttons)
		role_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local rep_frame = MainPanel.filter_menu:CreateSubMenu("rep")

		local EXPANSION_TOOLTIP = {
			["expansion0"]	= L["FILTERING_OLDWORLD_DESC"],
			["expansion1"]	= L["FILTERING_BC_DESC"],
			["expansion2"]	= L["FILTERING_WOTLK_DESC"],
		}
		-------------------------------------------------------------------------------
		-- This manages the WoW expansion reputation filter menu panel
		-------------------------------------------------------------------------------
		local function ToggleExpansionMenu(panel)
			local toggle = "toggle_" .. panel
			local button = rep_frame[toggle]

			button:SetChecked(not button:GetChecked())

			if not button:GetChecked() then
				button:SetChecked(true)
				rep_frame[panel]:Show()

				-- Hide all of the other expansion frames, and un-check them as well.
				for expansion in pairs(EXPANSION_FRAMES) do
					if expansion ~= panel then
						local tog = "toggle_" .. expansion

						rep_frame[tog]:SetChecked(false)
						rep_frame[expansion]:Hide()
					end
				end
			else
				rep_frame[panel]:Hide()
				button:SetChecked(false)
			end
		end

		-------------------------------------------------------------------------------
		-- Generic function to create expansion buttons.
		-------------------------------------------------------------------------------
		function rep_frame:CreateExpansionButton(texture, expansion)
			local cButton = CreateFrame("CheckButton", nil, self)
			cButton:SetWidth(100)
			cButton:SetHeight(46)
			cButton:SetChecked(false)
			cButton:SetScript("OnClick", function(self, button, down)
							     ToggleExpansionMenu(expansion)
						     end)

			local iconTex = cButton:CreateTexture(nil, "BORDER")

			if texture == "wotlk_logo" then
				iconTex:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\" .. texture)
			else
				iconTex:SetTexture("Interface/Glues/Common/" .. texture)
			end
			iconTex:SetWidth(100)
			iconTex:SetHeight(46)
			iconTex:SetAllPoints(cButton)

			local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
			pushedTexture:SetTexture("Interface/Buttons/UI-Quickslot-Depress")
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)

			local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture("Interface/Buttons/ButtonHilight-Square")
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode("ADD")
			cButton:SetHighlightTexture(highlightTexture)

			local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture("Interface/Buttons/CheckButtonHilight")
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode("ADD")
			cButton:SetCheckedTexture(checkedTexture)

			-- And throw up a tooltip
			SetTooltipScripts(cButton, EXPANSION_TOOLTIP[expansion])

			return cButton
		end

		-------------------------------------------------------------------------------
		-- Create the expansion toggles.
		-------------------------------------------------------------------------------
		local expansion0 = rep_frame:CreateExpansionButton("Glues-WoW-Logo", "expansion0")
		expansion0:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -10)

		local expansion1 = rep_frame:CreateExpansionButton("GLUES-WOW-BCLOGO", "expansion1")
		expansion1:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -60)

		local expansion2 = rep_frame:CreateExpansionButton("Glues-WOW-WotlkLogo", "expansion2")
		expansion2:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -110)

		rep_frame.toggle_expansion0 = expansion0
		rep_frame.toggle_expansion1 = expansion1
		rep_frame.toggle_expansion2 = expansion2
	end	-- do

	-------------------------------------------------------------------------------
	-- Used for the tooltip of every reputation checkbox.
	-------------------------------------------------------------------------------
	local function ReputationDesc(text)
		return string.format(L["SPECIFIC_REP_DESC"], text)
	end

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep.expansion0, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion0_frame = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
		expansion0_frame:SetWidth(150)
		expansion0_frame:SetHeight(280)
		expansion0_frame:EnableMouse(true)
		expansion0_frame:EnableKeyboard(true)
		expansion0_frame:SetMovable(false)
		expansion0_frame:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -30, -16)
		expansion0_frame:Hide()

		MainPanel.filter_menu.rep.expansion0 = expansion0_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local expansion0_buttons = {
			["argentdawn"]		= { tt = ReputationDesc(BFAC["Argent Dawn"]),		text = BFAC["Argent Dawn"],		row = 2, col = 1 },
			["cenarioncircle"]	= { tt = ReputationDesc(BFAC["Cenarion Circle"]),	text = BFAC["Cenarion Circle"],		row = 3, col = 1 },
			["thoriumbrotherhood"]	= { tt = ReputationDesc(BFAC["Thorium Brotherhood"]),	text = BFAC["Thorium Brotherhood"],	row = 4, col = 1 },
			["timbermaw"]		= { tt = ReputationDesc(BFAC["Timbermaw Hold"]),	text = BFAC["Timbermaw Hold"],		row = 5, col = 1 },
			["zandalar"]		= { tt = ReputationDesc(BFAC["Zandalar Tribe"]),	text = BFAC["Zandalar Tribe"],		row = 6, col = 1 },
		}
		GenerateCheckBoxes(expansion0_frame, expansion0_buttons)

		local expansion0_toggle = GenericCreateButton(nil, expansion0_frame, 15, 120, "GameFontHighlight", _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
		expansion0_toggle:SetPoint("TOPLEFT", expansion0_frame, "TOPLEFT", -2, -4)

		expansion0_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		expansion0_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		expansion0_toggle:SetScript("OnClick",
					    function(self, button)
						    local filterdb = addon.db.profile.filters.rep

						    if button == "LeftButton" then
							    for reputation in pairs(expansion0_buttons) do
								    filterdb[reputation] = true
							    end
						    elseif button == "RightButton" then
							    for reputation in pairs(expansion0_buttons) do
								    filterdb[reputation] = false
							    end
						    end

						    for reputation in pairs(expansion0_buttons) do
							    expansion0_frame[reputation]:SetChecked(filterdb[reputation])
						    end
						    MainPanel:UpdateTitle()
						    ListFrame:Update(nil, false)
					    end)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep.expansion1, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion1_frame = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
		expansion1_frame:SetWidth(150)
		expansion1_frame:SetHeight(280)
		expansion1_frame:EnableMouse(true)
		expansion1_frame:EnableKeyboard(true)
		expansion1_frame:SetMovable(false)
		expansion1_frame:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -30, -16)
		expansion1_frame:Hide()

		MainPanel.filter_menu.rep.expansion1 = expansion1_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local expansion1_buttons = {
			["aldor"]		= { tt = ReputationDesc(BFAC["The Aldor"]),			text = BFAC["The Aldor"],		row = 2,	col = 1 },
			["ashtonguedeathsworn"]	= { tt = ReputationDesc(BFAC["Ashtongue Deathsworn"]),		text = BFAC["Ashtongue Deathsworn"],	row = 3,	col = 1 },
			["cenarionexpedition"]	= { tt = ReputationDesc(BFAC["Cenarion Expedition"]),		text = BFAC["Cenarion Expedition"],	row = 4,	col = 1 },
			["consortium"]		= { tt = ReputationDesc(BFAC["The Consortium"]),		text = BFAC["The Consortium"],		row = 5,	col = 1 },
			["hellfire"]		= { tt = ReputationDesc(HonorHold_Thrallmar_Text),		text = HonorHold_Thrallmar_Text,	row = 6,	col = 1 },
			["keepersoftime"]	= { tt = ReputationDesc(BFAC["Keepers of Time"]),		text = BFAC["Keepers of Time"],		row = 7,	col = 1 },
			["nagrand"]		= { tt = ReputationDesc(Kurenai_Maghar_Text),			text = Kurenai_Maghar_Text,		row = 8,	col = 1 },
			["lowercity"]		= { tt = ReputationDesc(BFAC["Lower City"]),			text = BFAC["Lower City"],		row = 9,	col = 1 },
			["scaleofthesands"]	= { tt = ReputationDesc(BFAC["The Scale of the Sands"]),	text = BFAC["The Scale of the Sands"],	row = 10,	col = 1 },
			["scryer"]		= { tt = ReputationDesc(BFAC["The Scryers"]),			text = BFAC["The Scryers"],		row = 11,	col = 1 },
			["shatar"]		= { tt = ReputationDesc(BFAC["The Sha'tar"]),			text = BFAC["The Sha'tar"],		row = 12,	col = 1 },
			["shatteredsun"]	= { tt = ReputationDesc(BFAC["Shattered Sun Offensive"]),	text = BFAC["Shattered Sun Offensive"],	row = 13,	col = 1 },
			["sporeggar"]		= { tt = ReputationDesc(BFAC["Sporeggar"]),			text = BFAC["Sporeggar"],		row = 14,	col = 1 },
			["violeteye"]		= { tt = ReputationDesc(BFAC["The Violet Eye"]),		text = BFAC["The Violet Eye"],		row = 15,	col = 1 },
		}
		GenerateCheckBoxes(expansion1_frame, expansion1_buttons)

		local expansion1_toggle = GenericCreateButton(nil, expansion1_frame, 15, 120, "GameFontHighlight", _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
		expansion1_toggle:SetPoint("TOPLEFT", expansion1_frame, "TOPLEFT", -2, -4)

		expansion1_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		expansion1_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		expansion1_toggle:SetScript("OnClick",
					    function(self,button)
						    local filterdb = addon.db.profile.filters.rep

						    if button == "LeftButton" then
							    for reputation in pairs(expansion1_buttons) do
								    filterdb[reputation] = true
							    end
						    elseif button == "RightButton" then
							    for reputation in pairs(expansion1_buttons) do
								    filterdb[reputation] = false
							    end
						    end

						    for reputation in pairs(expansion1_buttons) do
							    expansion1_frame[reputation]:SetChecked(filterdb[reputation])
						    end
						    MainPanel:UpdateTitle()
						    ListFrame:Update(nil, false)
					    end)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep.expansion2, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion2_frame = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
		expansion2_frame:SetWidth(150)
		expansion2_frame:SetHeight(280)
		expansion2_frame:EnableMouse(true)
		expansion2_frame:EnableKeyboard(true)
		expansion2_frame:SetMovable(false)
		expansion2_frame:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -30, -16)
		expansion2_frame:Hide()

		MainPanel.filter_menu.rep.expansion2 = expansion2_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local function DisabledText(text)
			return SetTextColor(BASIC_COLORS["grey"], text)
		end

		local expansion2_buttons = {
			["wrathcommon1"]	= { tt = ReputationDesc(Vanguard_Expedition_Text),		text = Vanguard_Expedition_Text,		row = 2,	col = 1 },
			["argentcrusade"]	= { tt = ReputationDesc(BFAC["Argent Crusade"]),		text = BFAC["Argent Crusade"],			row = 3,	col = 1 },
			["wrathcommon5"]	= { tt = ReputationDesc(Explorer_Hand_Text),			text = DisabledText(Explorer_Hand_Text),	row = 4,	col = 1 },
			["frenzyheart"]		= { tt = ReputationDesc(BFAC["Frenzyheart Tribe"]),		text = BFAC["Frenzyheart Tribe"],		row = 5,	col = 1 },
			["kaluak"]		= { tt = ReputationDesc(BFAC["The Kalu'ak"]),			text = BFAC["The Kalu'ak"],			row = 6,	col = 1 },
			["kirintor"]		= { tt = ReputationDesc(BFAC["Kirin Tor"]),			text = BFAC["Kirin Tor"],			row = 7,	col = 1 },
			["ebonblade"]		= { tt = ReputationDesc(BFAC["Knights of the Ebon Blade"]),	text = BFAC["Knights of the Ebon Blade"],	row = 8,	col = 1 },
			["oracles"]		= { tt = ReputationDesc(BFAC["The Oracles"]),			text = BFAC["The Oracles"],			row = 9,	col = 1 },
			["wrathcommon2"]	= { tt = ReputationDesc(SilverCov_Sunreaver_Text),		text = DisabledText(SilverCov_Sunreaver_Text),	row = 10,	col = 1 },
			["sonsofhodir"]		= { tt = ReputationDesc(BFAC["The Sons of Hodir"]),		text = BFAC["The Sons of Hodir"],		row = 11,	col = 1 },
			["wrathcommon4"]	= { tt = ReputationDesc(Frostborn_Taunka_Text),			text = DisabledText(Frostborn_Taunka_Text),	row = 12,	col = 1 },
			["wrathcommon3"]	= { tt = ReputationDesc(Valiance_Warsong_Text),			text = DisabledText(Valiance_Warsong_Text),	row = 13,	col = 1 },
			["wyrmrest"]		= { tt = ReputationDesc(BFAC["The Wyrmrest Accord"]),		text = BFAC["The Wyrmrest Accord"],		row = 14,	col = 1 },
			["ashenverdict"]	= { tt = ReputationDesc(BFAC["The Ashen Verdict"]),		text = BFAC["The Ashen Verdict"],		row = 15,	col = 1 },
		}
		GenerateCheckBoxes(expansion2_frame, expansion2_buttons)

		-- Disable these for now, since they have no recipes.
		expansion2_frame.wrathcommon2:Disable()
		expansion2_frame.wrathcommon3:Disable()
		expansion2_frame.wrathcommon4:Disable()
		expansion2_frame.wrathcommon5:Disable()

		local expansion2_toggle = GenericCreateButton(nil, expansion2_frame, 15, 120, "GameFontHighlight", _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
		expansion2_toggle:SetPoint("TOPLEFT", expansion2_frame, "TOPLEFT", -2, -4)

		expansion2_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		expansion2_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		expansion2_toggle:SetScript("OnClick",
					   function(self,button)
						    local filterdb = addon.db.profile.filters.rep

						    if button == "LeftButton" then
							    for reputation in pairs(expansion2_buttons) do
								    filterdb[reputation] = true
							    end
						    elseif button == "RightButton" then
							    for reputation in pairs(expansion2_buttons) do
								    filterdb[reputation] = false
							    end
						    end

						    for reputation in pairs(expansion2_buttons) do
							    expansion2_frame[reputation]:SetChecked(filterdb[reputation])
						    end
						    MainPanel:UpdateTitle()
						    ListFrame:Update(nil, false)
					   end)
	end	-- do-block

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

	local ARL_MiscAltText = MainPanel.filter_menu.misc:CreateFontString("ARL_MiscAltBtn", "OVERLAY", "QuestFontNormalSmall")
	ARL_MiscAltText:SetText(L["Alt-Tradeskills"] .. ":")
	ARL_MiscAltText:SetPoint("TOPLEFT", MainPanel.filter_menu.misc, "TOPLEFT", 5, -8)
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

	local expansion0 = filter_menu.rep.expansion0
	local expansion1 = filter_menu.rep.expansion1
	local expansion2 = filter_menu.rep.expansion2

	FilterValueMap = {
		------------------------------------------------------------------------------------------------
		-- General Options
		------------------------------------------------------------------------------------------------
		["specialty"]		= { cb = filter_menu.general.specialty,		svroot = filterdb.general },
		["skill"]		= { cb = filter_menu.general.skill,		svroot = filterdb.general },
		["faction"]		= { cb = filter_menu.general.faction,		svroot = filterdb.general },
		["known"]		= { cb = filter_menu.general.known,		svroot = filterdb.general },
		["unknown"]		= { cb = filter_menu.general.unknown,		svroot = filterdb.general },
		["retired"]		= { cb = filter_menu.general.retired,		svroot = filterdb.general },
		------------------------------------------------------------------------------------------------
		-- Classes
		------------------------------------------------------------------------------------------------
		["deathknight"]		= { cb = filter_menu.general.deathknight,	svroot = filterdb.classes },
		["druid"]		= { cb = filter_menu.general.druid,		svroot = filterdb.classes },
		["hunter"]		= { cb = filter_menu.general.hunter,		svroot = filterdb.classes },
		["mage"]		= { cb = filter_menu.general.mage,		svroot = filterdb.classes },
		["paladin"]		= { cb = filter_menu.general.paladin,		svroot = filterdb.classes },
		["priest"]		= { cb = filter_menu.general.priest,		svroot = filterdb.classes },
		["rogue"]		= { cb = filter_menu.general.rogue,		svroot = filterdb.classes },
		["shaman"]		= { cb = filter_menu.general.shaman,		svroot = filterdb.classes },
		["warlock"]		= { cb = filter_menu.general.warlock,		svroot = filterdb.classes },
		["warrior"]		= { cb = filter_menu.general.warrior,		svroot = filterdb.classes },
		------------------------------------------------------------------------------------------------
		-- Obtain Options
		------------------------------------------------------------------------------------------------
		["instance"]		= { cb = filter_menu.obtain.instance,		svroot = filterdb.obtain },
		["raid"]		= { cb = filter_menu.obtain.raid,		svroot = filterdb.obtain },
		["quest"]		= { cb = filter_menu.obtain.quest,		svroot = filterdb.obtain },
		["seasonal"]		= { cb = filter_menu.obtain.seasonal,		svroot = filterdb.obtain },
		["trainer"]		= { cb = filter_menu.obtain.trainer,		svroot = filterdb.obtain },
		["vendor"]		= { cb = filter_menu.obtain.vendor,		svroot = filterdb.obtain },
		["pvp"]			= { cb = filter_menu.obtain.pvp,		svroot = filterdb.obtain },
		["discovery"]		= { cb = filter_menu.obtain.discovery,		svroot = filterdb.obtain },
		["worlddrop"]		= { cb = filter_menu.obtain.worlddrop,		svroot = filterdb.obtain },
		["mobdrop"]		= { cb = filter_menu.obtain.mobdrop,		svroot = filterdb.obtain },
		["expansion0"]		= { cb = filter_menu.obtain.expansion0,		svroot = filterdb.obtain },
		["expansion1"]		= { cb = filter_menu.obtain.expansion1,		svroot = filterdb.obtain },
		["expansion2"]		= { cb = filter_menu.obtain.expansion2,		svroot = filterdb.obtain },
		------------------------------------------------------------------------------------------------
		-- Binding Options
		------------------------------------------------------------------------------------------------
		["itemboe"]		= { cb = filter_menu.binding.itemboe,		svroot = filterdb.binding },
		["itembop"]		= { cb = filter_menu.binding.itembop,		svroot = filterdb.binding },
		["recipeboe"]		= { cb = filter_menu.binding.recipeboe,		svroot = filterdb.binding },
		["recipebop"]		= { cb = filter_menu.binding.recipebop,		svroot = filterdb.binding },
		------------------------------------------------------------------------------------------------
		-- Armor Options
		------------------------------------------------------------------------------------------------
		["cloth"]		= { cb = filter_menu.item.cloth,		svroot = filterdb.item.armor },
		["leather"]		= { cb = filter_menu.item.leather,		svroot = filterdb.item.armor },
		["mail"]		= { cb = filter_menu.item.mail,			svroot = filterdb.item.armor },
		["plate"]		= { cb = filter_menu.item.plate,		svroot = filterdb.item.armor },
		["cloak"]		= { cb = filter_menu.item.cloak,		svroot = filterdb.item.armor },
		["necklace"]		= { cb = filter_menu.item.necklace,		svroot = filterdb.item.armor },
		["ring"]		= { cb = filter_menu.item.ring,			svroot = filterdb.item.armor },
		["trinket"]		= { cb = filter_menu.item.trinket,		svroot = filterdb.item.armor },
		["shield"]		= { cb = filter_menu.item.shield,		svroot = filterdb.item.armor },
		------------------------------------------------------------------------------------------------
		-- Weapon Options
		------------------------------------------------------------------------------------------------
		["onehand"]		= { cb = filter_menu.item.onehand,		svroot = filterdb.item.weapon },
		["twohand"]		= { cb = filter_menu.item.twohand,		svroot = filterdb.item.weapon },
		["dagger"]		= { cb = filter_menu.item.dagger,		svroot = filterdb.item.weapon },
		["axe"]			= { cb = filter_menu.item.axe,			svroot = filterdb.item.weapon },
		["mace"]		= { cb = filter_menu.item.mace,			svroot = filterdb.item.weapon },
		["sword"]		= { cb = filter_menu.item.sword,		svroot = filterdb.item.weapon },
		["polearm"]		= { cb = filter_menu.item.polearm,		svroot = filterdb.item.weapon },
		["fist"]		= { cb = filter_menu.item.fist,			svroot = filterdb.item.weapon },
		["staff"]		= { cb = filter_menu.item.staff,		svroot = nil },
		["wand"]		= { cb = filter_menu.item.wand,			svroot = filterdb.item.weapon },
		["thrown"]		= { cb = filter_menu.item.thrown,		svroot = filterdb.item.weapon },
		["bow"]			= { cb = filter_menu.item.bow,			svroot = nil },
		["crossbow"]		= { cb = filter_menu.item.crossbow,		svroot = nil },
		["ammo"]		= { cb = filter_menu.item.ammo,			svroot = filterdb.item.weapon },
		["gun"]			= { cb = filter_menu.item.gun,			svroot = filterdb.item.weapon },
		------------------------------------------------------------------------------------------------
		-- Quality Options
		------------------------------------------------------------------------------------------------
		["common"]		= { cb = filter_menu.quality.common,		svroot = filterdb.quality },
		["uncommon"]		= { cb = filter_menu.quality.uncommon,		svroot = filterdb.quality },
		["rare"]		= { cb = filter_menu.quality.rare,		svroot = filterdb.quality },
		["epic"]		= { cb = filter_menu.quality.epic,		svroot = filterdb.quality },
		------------------------------------------------------------------------------------------------
		-- Role Options
		------------------------------------------------------------------------------------------------
		["tank"]		= { cb = filter_menu.player.tank,		svroot = filterdb.player },
		["melee"]		= { cb = filter_menu.player.melee,		svroot = filterdb.player },
		["healer"]		= { cb = filter_menu.player.healer,		svroot = filterdb.player },
		["caster"]		= { cb = filter_menu.player.caster,		svroot = filterdb.player },
		------------------------------------------------------------------------------------------------
		-- Old World Rep Options
		------------------------------------------------------------------------------------------------
		["argentdawn"]		= { cb = expansion0.argentdawn,			svroot = filterdb.rep },
		["cenarioncircle"]	= { cb = expansion0.cenarioncircle,		svroot = filterdb.rep },
		["thoriumbrotherhood"]	= { cb = expansion0.thoriumbrotherhood,		svroot = filterdb.rep },
		["timbermaw"]		= { cb = expansion0.timbermaw,			svroot = filterdb.rep },
		["zandalar"]		= { cb = expansion0.zandalar,			svroot = filterdb.rep },
		------------------------------------------------------------------------------------------------
		-- The Burning Crusade Rep Options
		------------------------------------------------------------------------------------------------
		["aldor"]		= { cb = expansion1.aldor,			svroot = filterdb.rep },
		["ashtonguedeathsworn"]	= { cb = expansion1.ashtonguedeathsworn,	svroot = filterdb.rep },
		["cenarionexpedition"]	= { cb = expansion1.cenarionexpedition,		svroot = filterdb.rep },
		["consortium"]		= { cb = expansion1.consortium,			svroot = filterdb.rep },
		["hellfire"]		= { cb = expansion1.hellfire,			svroot = filterdb.rep },
		["keepersoftime"]	= { cb = expansion1.keepersoftime,		svroot = filterdb.rep },
		["nagrand"]		= { cb = expansion1.nagrand,			svroot = filterdb.rep },
		["lowercity"]		= { cb = expansion1.lowercity,			svroot = filterdb.rep },
		["scaleofthesands"]	= { cb = expansion1.scaleofthesands,		svroot = filterdb.rep },
		["scryer"]		= { cb = expansion1.scryer,			svroot = filterdb.rep },
		["shatar"]		= { cb = expansion1.shatar,			svroot = filterdb.rep },
		["shatteredsun"]	= { cb = expansion1.shatteredsun,		svroot = filterdb.rep },
		["sporeggar"]		= { cb = expansion1.sporeggar,			svroot = filterdb.rep },
		["violeteye"]		= { cb = expansion1.violeteye,			svroot = filterdb.rep },
		------------------------------------------------------------------------------------------------
		-- Wrath of The Lich King Rep Options
		------------------------------------------------------------------------------------------------
		["argentcrusade"]	= { cb = expansion2.argentcrusade,		svroot = filterdb.rep },
		["frenzyheart"]		= { cb = expansion2.frenzyheart,		svroot = filterdb.rep },
		["ebonblade"]		= { cb = expansion2.ebonblade,			svroot = filterdb.rep },
		["kirintor"]		= { cb = expansion2.kirintor,			svroot = filterdb.rep },
		["sonsofhodir"]		= { cb = expansion2.sonsofhodir,		svroot = filterdb.rep },
		["kaluak"]		= { cb = expansion2.kaluak,			svroot = filterdb.rep },
		["oracles"]		= { cb = expansion2.oracles,			svroot = filterdb.rep },
		["wyrmrest"]		= { cb = expansion2.wyrmrest,			svroot = filterdb.rep },
		["ashenverdict"]	= { cb = expansion2.ashenverdict,		svroot = filterdb.rep },
		["wrathcommon1"]	= { cb = expansion2.wrathcommon1,		svroot = filterdb.rep },
		["wrathcommon2"]	= { cb = expansion2.wrathcommon2,		svroot = nil },
		["wrathcommon3"]	= { cb = expansion2.wrathcommon3,		svroot = nil },
		["wrathcommon4"]	= { cb = expansion2.wrathcommon4,		svroot = nil },
		["wrathcommon5"]	= { cb = expansion2.wrathcommon5,		svroot = nil },
	}
end

-------------------------------------------------------------------------------
-- Displays the main GUI frame.
-------------------------------------------------------------------------------
do
	function MainPanel:Display(profession, is_linked)
		if InitializeFrame then
			InitializeFrame()
			InitializeFrame = nil
		end
		self.is_linked = is_linked

		-------------------------------------------------------------------------------
		-- Set the profession.
		-------------------------------------------------------------------------------
		local prev_profession = self.profession

		if profession == private.mining_name then
		 	self.profession = 11 -- Smelting
			self.prof_name = profession
		else
			for index, name in ipairs(ORDERED_PROFESSIONS) do
				if name == profession then
					self.profession = index
					break
				end
			end
			self.prof_name = nil
		end

		if self.profession ~= prev_profession then
			self.prev_profession = self.profession
		end
		self.prof_button:ChangeTexture(private.profession_textures[self.profession])

		local editbox = SearchBox

		if self.profession ~= self.prev_profession then
			editbox.prev_search = nil
		end
		editbox:SetText(editbox.prev_search or _G.SEARCH)

		-- If there is no current tab, this is the first time the panel has been
		-- shown so things must be initialized. In this case, ListFrame:Update()
		-- will be called by the tab's OnClick handler.
		if not self.current_tab then
			local current_tab = self.tabs[addon.db.profile.current_tab]
			local on_click = current_tab:GetScript("OnClick")

			on_click(current_tab)

			self.current_tab = addon.db.profile.current_tab
		else
			ListFrame:Update(nil, false)
		end
		self.sort_button:SetTextures()
		self.filter_toggle:SetTextures()

		self:UpdateTitle()
		self:Show()
	end

	-------------------------------------------------------------------------------
	-- Restore the panel's position on the screen.
	-------------------------------------------------------------------------------
	local function Reset_Position(self)
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
		self:SetScale(addon.db.profile.frameopts.uiscale)
	end

	MainPanel:SetScript("OnShow", Reset_Position)
end	-- do-block

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
