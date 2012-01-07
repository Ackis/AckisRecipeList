-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-- Functions
local pairs = _G.pairs

-- Libraries
local string = _G.string
local table = _G.table

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local QTip	= LibStub("LibQTip-1.0")

-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local SetTextColor = private.SetTextColor
local SetTooltipScripts = private.SetTooltipScripts

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local FILTERMENU_WIDTH		= 306
local FILTERMENU_HEIGHT		= 343

local EXPANSION_FRAMES = {
	["expansion0"]	= true,
	["expansion1"]	= true,
	["expansion2"]	= true,
	["expansion3"]	= true,
}

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

-------------------------------------------------------------------------------
-- Function to create and initialize a check-button with the given values.
-- Used in all of the sub-menus of MainPanel.filter_menu
-------------------------------------------------------------------------------
do
	local function CheckButton_OnClick(self, button, down)
		local script_val = self.script_val
		local MainPanel = addon.Frame

		MainPanel.filter_menu.value_map[script_val].svroot[script_val] = MainPanel.filter_menu.value_map[script_val].cb:GetChecked() and true or false
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end

	local function CreateCheckButton(parent, anchor_frame, ttText, scriptVal, row, col)
		-- set the position of the new checkbox
		local xPos = 10 + ((col - 1) * 150)
		local yPos = -10 - ((row - 1) * 17)

		local check = _G.CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		check:SetPoint("TOPLEFT", anchor_frame or parent, "TOPLEFT", xPos, yPos)
		check:SetHeight(20)
		check:SetWidth(20)

		check.text = check:CreateFontString(nil, "OVERLAY", "QuestFontNormalSmall")
		check.text:SetPoint("LEFT", check, "RIGHT", 0, 0)

		check.script_val = scriptVal

		check:SetScript("OnClick", CheckButton_OnClick)

		SetTooltipScripts(check, ttText, 1)

		return check
	end

	function private.GenerateCheckBoxes(parent, source, anchor_frame)
		for section, data in pairs(source) do
			parent[section] = CreateCheckButton(parent, anchor_frame, data.tt, section, data.row, data.col)
			parent[section].text:SetText(data.text)
		end
	end
end	-- do

-------------------------------------------------------------------------------
-- Functions for initializing specific filter menu panels.
-------------------------------------------------------------------------------
local function InitializeMenu_General()
	local MainPanel = addon.Frame
	local FilterPanel = MainPanel.filter_menu

end

-- local MENU_CONSTRUCTORS = {
-- 	["general"]	= InitializeMenu_General,
-- 	["obtain"]	= InitializeMenu_Obtain,
-- 	["binding"]	= InitializeMenu_Binding,
-- 	["item"]	= InitializeMenu_Item,
-- 	["quality"]	= InitializeMenu_Quality,
-- 	["player"]	= InitializeMenu_Player,
-- 	["rep"]		= InitializeMenu_Reputation,
-- 	["misc"]	= InitializeMenu_Miscellaneous,
-- }

-- function InitializeFilterMenu(category)
-- 	local init_func = MENU_CONSTRUCTORS[category]

-- 	if init_func then
-- 		init_func()
-- 	end
-- end

-- Set all the current options in the filter menu to make sure they are consistent with the SV options.
function private.UpdateFilterMarks()
	for filter, info in pairs(addon.Frame.filter_menu.value_map) do
		if info.svroot then
			info.cb:SetChecked(info.svroot[filter])
		end
	end
end

function private.InitializeFilterPanel()
	local MainPanel = addon.Frame

	-------------------------------------------------------------------------------
	-- The filter_reset button
	-------------------------------------------------------------------------------
	local filter_reset_name = ("%s_FilterMenuResetButton"):format(FOLDER_NAME)
	local filter_reset = _G.CreateFrame("Button", filter_reset_name, MainPanel, "UIPanelButtonTemplate")
	filter_reset:SetWidth(78)
	filter_reset:SetHeight(22)
	filter_reset:SetPoint("BOTTOMRIGHT", MainPanel, "BOTTOMRIGHT", -95, 78)
	filter_reset:SetText(_G.RESET)
	filter_reset:Hide()

	private.SetTooltipScripts(filter_reset, L["RESET_DESC"])

	MainPanel.filter_reset = filter_reset

	do
		-- Thanks to Antiarc for this code
		local function recursiveReset(t)
			for k, v in pairs(t) do
				if _G.type(v) == "table" then
					recursiveReset(v)
				else
					t[k] = true
				end
			end
		end

		filter_reset:SetScript("OnClick", function(self, button, down)
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
			filterdb.classes[private.Player.class:lower()] = true

			if MainPanel:IsVisible() then
				MainPanel:UpdateTitle()
				private.UpdateFilterMarks()
				MainPanel.list_frame:Update(nil, false)
			end
		end)
	end	-- do

	-------------------------------------------------------------------------------
	-- This manages the filter menu panel, as well as checking or unchecking the
	-- buttons that got us here in the first place
	-------------------------------------------------------------------------------
	local function ToggleFilterMenu(panel)
		local rep_menu = MainPanel.filter_menu.rep

		-- Make sure the expansion frames and toggle buttons are hidden/unchecked.
		for expansion in pairs(EXPANSION_FRAMES) do
			rep_menu[expansion]:Hide()
			rep_menu["toggle_" .. expansion]:SetChecked(false)
		end

		local toggle = "menu_toggle_" .. panel

		if MainPanel[toggle]:GetChecked() then
			MainPanel[toggle]:SetChecked(false)
			MainPanel.filter_menu:Hide()
		else
			MainPanel[toggle]:SetChecked(true)
			MainPanel.filter_menu[panel]:Show()

			-- Hide all of the other filter_menu category frames, and un-check them as well.
			for category in pairs(MainPanel.filter_menu) do
				if category ~= panel and CATEGORY_TOOLTIP[category] then
					MainPanel["menu_toggle_" .. category]:SetChecked(false)
					MainPanel.filter_menu[category]:Hide()
				end
			end
			MainPanel.filter_menu:Show()
		end
	end

	local function CreateFilterMenuButton(button_texture, category)
		local button_size = 22
		local cButton = _G.CreateFrame("CheckButton", nil, MainPanel)

		cButton:SetWidth(button_size)
		cButton:SetHeight(button_size)
		cButton:SetScript("OnClick", function(self, button, down)
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

	-------------------------------------------------------------------------------
	-- Create the seven buttons for opening/closing the filter menus
	-------------------------------------------------------------------------------
	local general = CreateFilterMenuButton("INV_Misc_Note_06", "general")
	general:SetPoint("LEFT", MainPanel.filter_toggle, "RIGHT", 3, 0)

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

	-------------------------------------------------------------------------------
	-- Main filter_menu frame.
	-------------------------------------------------------------------------------
	local FilterPanel = _G.CreateFrame("Frame", nil, MainPanel)
	FilterPanel:SetWidth(FILTERMENU_WIDTH)
	FilterPanel:SetHeight(FILTERMENU_HEIGHT)
	FilterPanel:SetFrameStrata("MEDIUM")
	FilterPanel:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -117, -71)
	FilterPanel:EnableMouse(true)
	FilterPanel:EnableKeyboard(true)
	FilterPanel:SetMovable(false)
	FilterPanel:SetHitRectInsets(5, 5, 5, 5)
	FilterPanel:Hide()

	function FilterPanel:CreateSubMenu(menu_name)
		local submenu = _G.CreateFrame("Frame", nil, self)
		submenu:EnableMouse(true)
		submenu:EnableKeyboard(true)
		submenu:SetMovable(false)
		submenu:SetAllPoints()
		submenu:Hide()

		self[menu_name] = submenu
		return submenu
	end
	MainPanel.filter_menu = FilterPanel

	-------------------------------------------------------------------------------
	-- Create FilterPanel.general, and set its scripts.
	-------------------------------------------------------------------------------
	local general_frame = FilterPanel:CreateSubMenu("general")

	-------------------------------------------------------------------------------
	-- Create the General toggle and CheckButtons.
	-------------------------------------------------------------------------------
	local general_toggle = _G.CreateFrame("Button", nil, general_frame)
	general_toggle:SetWidth(105)
	general_toggle:SetHeight(20)
	general_toggle:SetNormalFontObject("QuestTitleFont")
	general_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	general_toggle:SetText(_G.GENERAL_LABEL .. ":")
	general_toggle:SetPoint("TOP", general_frame, "TOP", 0, -7)
	general_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(general_toggle, L["GENERAL_TEXT_DESC"])

	general_toggle:SetScript("OnClick", function(self, button)
		local filters = addon.db.profile.filters.general
		local toggle = (button == "LeftButton") and true or false

		for filter in pairs(filters) do
			filters[filter] = toggle
			general_frame[filter]:SetChecked(toggle)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	general_frame.general_toggle = general_toggle

	local faction_text = (private.Player.faction == "Alliance") and _G.FACTION_HORDE or _G.FACTION_ALLIANCE
	local faction_desc = L["FACTION_DESC_FORMAT"]:format(faction_text)
	local general_buttons = {
		["specialty"]	= { tt = L["SPECIALTY_DESC"],	text = L["Specialties"],	row = 2, col = 1 },
		["skill"]	= { tt = L["SKILL_DESC"],	text = _G.SKILL,		row = 2, col = 2 },
		["faction"]	= { tt = faction_desc,		text = faction_text,		row = 3, col = 1 },
		["known"]	= { tt = L["KNOWN_DESC"],	text = L["Show Known"],		row = 3, col = 2 },
		["unknown"]	= { tt = L["UNKNOWN_DESC"],	text = _G.UNKNOWN,		row = 4, col = 1 },
		["retired"]	= { tt = L["RETIRED_DESC"],	text = L["Retired"],		row = 4, col = 2 },
	}
	private.GenerateCheckBoxes(general_frame, general_buttons)
	general_buttons = nil

	-------------------------------------------------------------------------------
	-- Create the Class toggle and CheckButtons.
	-------------------------------------------------------------------------------
	local class_toggle = _G.CreateFrame("Button", nil, general_frame)
	class_toggle:SetWidth(105)
	class_toggle:SetHeight(20)
	class_toggle:SetNormalFontObject("QuestTitleFont")
	class_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	class_toggle:SetFormattedText(_G.ITEM_CLASSES_ALLOWED, "")
	class_toggle:SetPoint("TOP", general_frame, "TOP", 0, -80)
	class_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(class_toggle, L["CLASS_TEXT_DESC"])

	class_toggle:SetScript("OnClick", function(self, button)
		local classes = addon.db.profile.filters.classes
		local toggle = (button == "LeftButton") and true or false

		for class in pairs(classes) do
			classes[class] = toggle
			general_frame[class]:SetChecked(toggle)
		end

		if toggle == false then
			local class = private.Player.class:lower()
			classes[class] = true
			general_frame[class]:SetChecked(true)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	general_frame.class_toggle = class_toggle

	local class_buttons = {
		["deathknight"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],	row = 6,  col = 1 },
		["druid"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["DRUID"],		row = 6,  col = 2 },
		["hunter"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["HUNTER"],		row = 7,  col = 1 },
		["mage"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["MAGE"],		row = 7,  col = 2 },
		["paladin"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["PALADIN"],	row = 8,  col = 1 },
		["priest"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["PRIEST"],		row = 8,  col = 2 },
		["rogue"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["ROGUE"],		row = 9,  col = 1 },
		["shaman"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],		row = 9,  col = 2 },
		["warlock"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],	row = 10, col = 1 },
		["warrior"]	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],	row = 10, col = 2 },
	}
	private.GenerateCheckBoxes(general_frame, class_buttons)
	class_buttons = nil

	-------------------------------------------------------------------------------
	-- Create FilterPanel.obtain, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local A = private.ACQUIRE_TYPES
		local obtain_frame = FilterPanel:CreateSubMenu("obtain")

		-------------------------------------------------------------------------------
		-- Create the Acquisition toggle and CheckButtons
		-------------------------------------------------------------------------------
		local obtain_toggle = _G.CreateFrame("Button", nil, obtain_frame)
		obtain_toggle:SetWidth(105)
		obtain_toggle:SetHeight(20)
		obtain_toggle:SetNormalFontObject("QuestTitleFont")
		obtain_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		obtain_toggle:SetText(L["Acquisition"] .. ":")
		obtain_toggle:SetPoint("TOP", obtain_frame, "TOP", 0, -7)
		obtain_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(obtain_toggle, L["ACQUISITION_TEXT_DESC"])

		obtain_toggle:SetScript("OnClick", function(self, button)
			local filters = addon.db.profile.filters.obtain
			local toggle = (button == "LeftButton") and true or false

			for filter in pairs(filters) do
				if not filter:match("expansion") then
					filters[filter] = toggle
					obtain_frame[filter]:SetChecked(toggle)
				end
			end
			MainPanel:UpdateTitle()
			MainPanel.list_frame:Update(nil, false)
		end)

		obtain_frame.obtain_toggle = obtain_toggle

		local version_toggle = _G.CreateFrame("Button", nil, obtain_frame)
		version_toggle:SetWidth(105)
		version_toggle:SetHeight(20)
		version_toggle:SetNormalFontObject("QuestTitleFont")
		version_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		version_toggle:SetText(_G.GAME_VERSION_LABEL .. ":")
		version_toggle:SetPoint("TOP", obtain_frame, "TOP", 0, -130)
		version_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(version_toggle, L["VERSION_TEXT_DESC"])

		version_toggle:SetScript("OnClick", function(self, button)
			local filters = addon.db.profile.filters.obtain
			local toggle = (button == "LeftButton") and true or false

			for filter in pairs(filters) do
				if filter:match("expansion") then
					filters[filter] = toggle
					obtain_frame[filter]:SetChecked(toggle)
				end
			end
			MainPanel:UpdateTitle()
			MainPanel.list_frame:Update(nil, false)
		end)

		obtain_frame.version_toggle = version_toggle

		local obtain_buttons = {
			["instance"]	= { tt = L["INSTANCE_DESC"],		text = _G.INSTANCE,				row = 2, col = 1 },
			["raid"]	= { tt = L["RAID_DESC"],		text = _G.RAID,					row = 2, col = 2 },
			["quest"]	= { tt = L["QUEST_DESC"],		text = L["Quest"],				row = 3, col = 1 },
			["seasonal"]	= { tt = L["SEASONAL_DESC"],		text = private.ACQUIRE_NAMES[A.SEASONAL],	row = 3, col = 2 },
			["trainer"]	= { tt = L["TRAINER_DESC"],		text = L["Trainer"],				row = 4, col = 1 },
			["vendor"]	= { tt = L["VENDOR_DESC"],		text = L["Vendor"],				row = 4, col = 2 },
			["pvp"]		= { tt = L["PVP_DESC"],			text = _G.PVP,					row = 5, col = 1 },
			["discovery"]	= { tt = L["DISCOVERY_DESC"],		text = L["Discovery"],				row = 5, col = 2 },
			["worlddrop"]	= { tt = L["WORLD_DROP_DESC"],		text = L["World Drop"],				row = 6, col = 1 },
			["mobdrop"]	= { tt = L["MOB_DROP_DESC"],		text = L["Mob Drop"],				row = 6, col = 2 },
			["achievement"]	= { tt = L["ACHIEVEMENT_DESC"],		text = _G.ACHIEVEMENTS,				row = 7, col = 1 },
			["expansion0"]	= { tt = L["ORIGINAL_WOW_DESC"],	text = _G.EXPANSION_NAME0,			row = 9, col = 1 },
			["expansion1"]	= { tt = L["BC_WOW_DESC"],		text = _G.EXPANSION_NAME1,			row = 10, col = 1 },
			["expansion2"]	= { tt = L["LK_WOW_DESC"],		text = _G.EXPANSION_NAME2,			row = 11, col = 1 },
			["expansion3"]	= { tt = L["CATA_WOW_DESC"],		text = _G.EXPANSION_NAME3,			row = 12, col = 1 },
		}
		private.GenerateCheckBoxes(obtain_frame, obtain_buttons)
		obtain_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.binding, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local binding_frame = FilterPanel:CreateSubMenu("binding")

		-------------------------------------------------------------------------------
		-- Create the toggle and CheckButtons
		-------------------------------------------------------------------------------
		local binding_toggle = _G.CreateFrame("Button", nil, binding_frame)
		binding_toggle:SetWidth(105)
		binding_toggle:SetHeight(20)
		binding_toggle:SetNormalFontObject("QuestTitleFont")
		binding_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		binding_toggle:SetText(L["Binding"] .. ":")
		binding_toggle:SetPoint("TOP", binding_frame, "TOP", 0, -7)
		binding_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(binding_toggle, L["BINDING_TEXT_DESC"])

		binding_toggle:SetScript("OnClick", function(self, button)
			local filters = addon.db.profile.filters.binding
			local toggle = (button == "LeftButton") and true or false

			for filter in pairs(filters) do
				filters[filter] = toggle
				binding_frame[filter]:SetChecked(toggle)
			end
			MainPanel:UpdateTitle()
			MainPanel.list_frame:Update(nil, false)
		end)

		binding_frame.binding_toggle = binding_toggle

		local binding_buttons = {
			["itemboe"]	= { tt = L["BOE_DESC"],		text = L["BOEFilter"],		row = 2, col = 1 },
			["itembop"]	= { tt = L["BOP_DESC"],		text = L["BOPFilter"],		row = 3, col = 1 },
			["recipeboe"]	= { tt = L["RECIPE_BOE_DESC"],	text = L["RecipeBOEFilter"],	row = 4, col = 1 },
			["recipebop"]	= { tt = L["RECIPE_BOP_DESC"],	text = L["RecipeBOPFilter"],	row = 5, col = 1 },
		}
		private.GenerateCheckBoxes(binding_frame, binding_buttons)
		binding_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.item, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local item_frame = FilterPanel:CreateSubMenu("item")
		item_frame:SetScript("OnHide", function(self)
			local panel = self["items_" .. private.PROFESSION_LABELS[MainPanel.prev_profession]]

			if panel then
				panel:Hide()
			else
				panel = self["items_" .. private.PROFESSION_LABELS[MainPanel.prev_profession]]

				if panel then
					panel:Hide()
				end
			end
		end)

		item_frame:SetScript("OnShow", function(self)
			local sub_panel = self["items_" .. private.PROFESSION_LABELS[MainPanel.profession]]

			if sub_panel then
				sub_panel:Show()
			end
		end)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.quality, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local quality_frame = FilterPanel:CreateSubMenu("quality")

		-------------------------------------------------------------------------------
		-- Create the toggle and CheckButtons
		-------------------------------------------------------------------------------
		local quality_toggle = _G.CreateFrame("Button", nil, quality_frame)
		quality_toggle:SetWidth(105)
		quality_toggle:SetHeight(20)
		quality_toggle:SetNormalFontObject("QuestTitleFont")
		quality_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		quality_toggle:SetText(_G.QUALITY .. ":")
		quality_toggle:SetPoint("TOP", quality_frame, "TOP", 0, -7)
		quality_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(quality_toggle, L["QUALITY_TEXT_DESC"])

		quality_toggle:SetScript("OnClick", function(self, button)
			local filters = addon.db.profile.filters.quality
			local toggle = (button == "LeftButton") and true or false

			for filter in pairs(filters) do
				filters[filter] = toggle
				quality_frame[filter]:SetChecked(toggle)
			end
			MainPanel:UpdateTitle()
			MainPanel.list_frame:Update(nil, false)
		end)

		quality_frame.quality_toggle = quality_toggle

		local function QualityDesc(text)
			return L["QUALITY_GENERAL_DESC"]:format(text)
		end

		local quality_buttons = {
			["common"]	= { tt = QualityDesc(_G.ITEM_QUALITY1_DESC),	text = _G.ITEM_QUALITY1_DESC,	row = 2, col = 1 },
			["uncommon"]	= { tt = QualityDesc(_G.ITEM_QUALITY2_DESC),	text = _G.ITEM_QUALITY2_DESC,	row = 2, col = 2 },
			["rare"]	= { tt = QualityDesc(_G.ITEM_QUALITY3_DESC),	text = _G.ITEM_QUALITY3_DESC,	row = 3, col = 1 },
			["epic"]	= { tt = QualityDesc(_G.ITEM_QUALITY4_DESC),	text = _G.ITEM_QUALITY4_DESC,	row = 3, col = 2 },
		}
		private.GenerateCheckBoxes(quality_frame, quality_buttons)
		quality_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.player, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local player_frame = FilterPanel:CreateSubMenu("player")

		-------------------------------------------------------------------------------
		-- Create the toggle and CheckButtons
		-------------------------------------------------------------------------------
		local role_toggle = _G.CreateFrame("Button", nil, player_frame)
		role_toggle:SetWidth(105)
		role_toggle:SetHeight(20)
		role_toggle:SetNormalFontObject("QuestTitleFont")
		role_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		role_toggle:SetText(_G.LFG_TOOLTIP_ROLES)
		role_toggle:SetPoint("TOP", player_frame, "TOP", 0, -7)
		role_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(role_toggle, L["ROLE_TEXT_DESC"])

		role_toggle:SetScript("OnClick", function(self, button)
			local filters = addon.db.profile.filters.player
			local toggle = (button == "LeftButton") and true or false

			for filter in pairs(filters) do
				filters[filter] = toggle
				player_frame[filter]:SetChecked(toggle)
			end
			MainPanel:UpdateTitle()
			MainPanel.list_frame:Update(nil, false)
		end)

		player_frame.role_toggle = role_toggle

		local role_buttons = {
			["tank"]	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.TANK),		text = _G.TANK,		row = 2, col = 1 },
			["melee"]	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.MELEE),	text = _G.MELEE,	row = 2, col = 2 },
			["healer"]	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.HEALER),	text = _G.HEALER,	row = 3, col = 1 },
			["caster"]	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.DAMAGER),	text = _G.DAMAGER,	row = 3, col = 2 },
		}
		private.GenerateCheckBoxes(player_frame, role_buttons)
		role_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.rep, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local rep_frame = FilterPanel:CreateSubMenu("rep")

		local EXPANSION_TOOLTIP = {
			["expansion0"]	= L["FILTERING_OLDWORLD_DESC"],
			["expansion1"]	= L["FILTERING_BC_DESC"],
			["expansion2"]	= L["FILTERING_WOTLK_DESC"],
			["expansion3"]	= L["FILTERING_CATA_DESC"],
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
			local cButton = _G.CreateFrame("CheckButton", nil, self)
			cButton:SetWidth(100)
			cButton:SetHeight(46)
			cButton:SetChecked(false)
			cButton:SetScript("OnClick", function(self, button, down)
				ToggleExpansionMenu(expansion)
			end)

			local iconTex = cButton:CreateTexture(nil, "BORDER")
			iconTex:SetTexture(([[Interface\Glues\Common\%s]]):format(texture))
			iconTex:SetWidth(100)
			iconTex:SetHeight(46)
			iconTex:SetAllPoints(cButton)

			local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
			pushedTexture:SetTexture([[Interface\Buttons\UI-Quickslot-Depress]])
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)

			local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture([[Interface\Buttons\ButtonHilight-Square]])
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode("ADD")
			cButton:SetHighlightTexture(highlightTexture)

			local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture([[Interface\Buttons\CheckButtonHilight]])
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
		expansion0:SetPoint("TOPLEFT", FilterPanel.rep, "TOPLEFT", 2, -10)

		local expansion1 = rep_frame:CreateExpansionButton("GLUES-WOW-BCLOGO", "expansion1")
		expansion1:SetPoint("TOP", expansion0, "BOTTOM", 0, 0)

		local expansion2 = rep_frame:CreateExpansionButton("Glues-WOW-WotlkLogo", "expansion2")
		expansion2:SetPoint("TOP", expansion1, "BOTTOM", 0, 0)

		local expansion3 = rep_frame:CreateExpansionButton("Glues-WOW-CCLogo", "expansion3")
		expansion3:SetPoint("TOP", expansion2, "BOTTOM", 0, 0)

		rep_frame.toggle_expansion0 = expansion0
		rep_frame.toggle_expansion1 = expansion1
		rep_frame.toggle_expansion2 = expansion2
		rep_frame.toggle_expansion3 = expansion3
	end	-- do

	-------------------------------------------------------------------------------
	-- Check to see if we're Horde or Alliance, and change the displayed
	-- reputation strings to be faction-correct.
	-------------------------------------------------------------------------------
	local isAlliance = (private.Player.faction == "Alliance")

	local HonorHold_Thrallmar_Text = isAlliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]
	local Kurenai_Maghar_Text = isAlliance and BFAC["Kurenai"] or BFAC["The Mag'har"]
	local Vanguard_Expedition_Text = isAlliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]
	local SilverCov_Sunreaver_Text = isAlliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]
	local Valiance_Warsong_Text = isAlliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]
	local Frostborn_Taunka_Text = isAlliance and BFAC["The Frostborn"] or BFAC["The Taunka"]
	local Explorer_Hand_Text = isAlliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]
	local Tol_Barad = isAlliance and BFAC["Baradin's Wardens"] or BFAC["Hellscream's Reach"]
	local Wildhammer_Dragonmaw = isAlliance and BFAC["Wildhammer Clan"] or BFAC["Dragonmaw Clan"]

	-- Used for the tooltip of every reputation checkbox.
	local function ReputationDesc(text)
		return L["SPECIFIC_REP_DESC"]:format(text)
	end

	-- Toggle the SavedVariables and CheckButtons for the given expansion frame.
	local function ToggleExpansionCheckBoxes(handler, button)
		local filterdb = addon.db.profile.filters.rep
		local check_value = (button == "LeftButton") and true or false

		for reputation in pairs(handler.buttons) do
			local check_button = handler.frame[reputation]

			if check_button:IsEnabled() then
				filterdb[reputation] = check_value
				check_button:SetChecked(check_value)
			end
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end
	-------------------------------------------------------------------------------
	-- Create FilterPanel.rep.expansion0, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion0_frame = _G.CreateFrame("Frame", nil, FilterPanel.rep)
		expansion0_frame:SetWidth(200)
		expansion0_frame:SetHeight(FILTERMENU_HEIGHT)
		expansion0_frame:EnableMouse(true)
		expansion0_frame:EnableKeyboard(true)
		expansion0_frame:SetMovable(false)
		expansion0_frame:SetPoint("TOPRIGHT", FilterPanel, "TOPRIGHT", 0, 0)
		expansion0_frame:Hide()

		FilterPanel.rep.expansion0 = expansion0_frame

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
		private.GenerateCheckBoxes(expansion0_frame, expansion0_buttons)

		local expansion0_toggle = _G.CreateFrame("Button", nil, expansion0_frame)
		expansion0_toggle:SetWidth(105)
		expansion0_toggle:SetHeight(20)
		expansion0_toggle:SetNormalFontObject("QuestTitleFont")
		expansion0_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		expansion0_toggle:SetText(_G.REPUTATION .. ":")
		expansion0_toggle:SetPoint("TOPLEFT", expansion0_frame, "TOPLEFT", -2, -7)
		expansion0_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(expansion0_toggle, L["REP_TEXT_DESC"])

		expansion0_toggle.buttons = expansion0_buttons
		expansion0_toggle.frame = expansion0_frame

		expansion0_toggle:SetScript("OnClick", ToggleExpansionCheckBoxes)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.rep.expansion1, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion1_frame = _G.CreateFrame("Frame", nil, FilterPanel.rep)
		expansion1_frame:SetWidth(200)
		expansion1_frame:SetHeight(FILTERMENU_HEIGHT)
		expansion1_frame:EnableMouse(true)
		expansion1_frame:EnableKeyboard(true)
		expansion1_frame:SetMovable(false)
		expansion1_frame:SetPoint("TOPRIGHT", FilterPanel, "TOPRIGHT", -0, -0)
		expansion1_frame:Hide()

		FilterPanel.rep.expansion1 = expansion1_frame

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
		private.GenerateCheckBoxes(expansion1_frame, expansion1_buttons)

		local expansion1_toggle = _G.CreateFrame("Button", nil, expansion1_frame)
		expansion1_toggle:SetWidth(105)
		expansion1_toggle:SetHeight(20)
		expansion1_toggle:SetNormalFontObject("QuestTitleFont")
		expansion1_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		expansion1_toggle:SetText(_G.REPUTATION .. ":")
		expansion1_toggle:SetPoint("TOPLEFT", expansion1_frame, "TOPLEFT", -2, -7)
		expansion1_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(expansion1_toggle, L["REP_TEXT_DESC"])

		expansion1_toggle.buttons = expansion1_buttons
		expansion1_toggle.frame = expansion1_frame

		expansion1_toggle:SetScript("OnClick", ToggleExpansionCheckBoxes)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.rep.expansion2, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion2_frame = _G.CreateFrame("Frame", nil, FilterPanel.rep)
		expansion2_frame:SetWidth(200)
		expansion2_frame:SetHeight(FILTERMENU_HEIGHT)
		expansion2_frame:EnableMouse(true)
		expansion2_frame:EnableKeyboard(true)
		expansion2_frame:SetMovable(false)
		expansion2_frame:SetPoint("TOPRIGHT", FilterPanel, "TOPRIGHT", 0, 0)
		expansion2_frame:Hide()

		FilterPanel.rep.expansion2 = expansion2_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local function DisabledText(text)
			return SetTextColor(private.BASIC_COLORS["grey"], text)
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
		private.GenerateCheckBoxes(expansion2_frame, expansion2_buttons)

		-- Disable these for now, since they have no recipes.
		expansion2_frame.wrathcommon2:Disable()
		expansion2_frame.wrathcommon3:Disable()
		expansion2_frame.wrathcommon4:Disable()
		expansion2_frame.wrathcommon5:Disable()

		local expansion2_toggle = _G.CreateFrame("Button", nil, expansion2_frame)
		expansion2_toggle:SetWidth(105)
		expansion2_toggle:SetHeight(20)
		expansion2_toggle:SetNormalFontObject("QuestTitleFont")
		expansion2_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		expansion2_toggle:SetText(_G.REPUTATION .. ":")
		expansion2_toggle:SetPoint("TOPLEFT", expansion2_frame, "TOPLEFT", -2, -7)
		expansion2_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(expansion2_toggle, L["REP_TEXT_DESC"])

		expansion2_toggle.buttons = expansion2_buttons
		expansion2_toggle.frame = expansion2_frame

		expansion2_toggle:SetScript("OnClick", ToggleExpansionCheckBoxes)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.rep.expansion3, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion3_frame = _G.CreateFrame("Frame", nil, FilterPanel.rep)
		expansion3_frame:SetWidth(200)
		expansion3_frame:SetHeight(FILTERMENU_HEIGHT)
		expansion3_frame:EnableMouse(true)
		expansion3_frame:EnableKeyboard(true)
		expansion3_frame:SetMovable(false)
		expansion3_frame:SetPoint("TOPRIGHT", FilterPanel, "TOPRIGHT", 0, 0)
		expansion3_frame:Hide()

		FilterPanel.rep.expansion3 = expansion3_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local function DisabledText(text)
			return SetTextColor(private.BASIC_COLORS["grey"], text)
		end

		local expansion3_buttons = {
			["catacommon1"]		= { tt = ReputationDesc(Wildhammer_Dragonmaw),			text = DisabledText(Wildhammer_Dragonmaw),		row = 2,	col = 1 },
			["catacommon2"]		= { tt = ReputationDesc(Tol_Barad),				text = DisabledText(Tol_Barad),				row = 3,	col = 1 },
			["guardiansofhyjal"]	= { tt = ReputationDesc(BFAC["Guardians of Hyjal"]),		text = DisabledText(BFAC["Guardians of Hyjal"]),	row = 4,	col = 1 },
			["ramkahen"]		= { tt = ReputationDesc(BFAC["Ramkahen"]),			text = DisabledText(BFAC["Ramkahen"]),			row = 5,	col = 1 },
			["earthenring"]		= { tt = ReputationDesc(BFAC["The Earthen Ring"]),		text = DisabledText(BFAC["The Earthen Ring"]),		row = 6,	col = 1 },
			["therazane"]		= { tt = ReputationDesc(BFAC["Therazane"]),			text = DisabledText(BFAC["Therazane"]),			row = 7,	col = 1 },
		}
		private.GenerateCheckBoxes(expansion3_frame, expansion3_buttons)

		-- Disable them as the data isn't in yet.
		expansion3_frame.catacommon1:Disable()
		expansion3_frame.catacommon2:Disable()
		expansion3_frame.guardiansofhyjal:Disable()
		expansion3_frame.ramkahen:Disable()
		expansion3_frame.earthenring:Disable()
		expansion3_frame.therazane:Disable()

		local expansion3_toggle = _G.CreateFrame("Button", nil, expansion3_frame)
		expansion3_toggle:SetWidth(105)
		expansion3_toggle:SetHeight(20)
		expansion3_toggle:SetNormalFontObject("QuestTitleFont")
		expansion3_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		expansion3_toggle:SetText(_G.REPUTATION .. ":")
		expansion3_toggle:SetPoint("TOPLEFT", expansion3_frame, "TOPLEFT", -2, -7)
		expansion3_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(expansion3_toggle, L["REP_TEXT_DESC"])

		expansion3_toggle.buttons = expansion3_buttons
		expansion3_toggle.frame = expansion3_frame

		expansion3_toggle:SetScript("OnClick", ToggleExpansionCheckBoxes)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Miscellaneous Filter Menu
	-------------------------------------------------------------------------------
	FilterPanel.misc = _G.CreateFrame("Frame", "ARL_FilterMenu_Misc", FilterPanel)
	FilterPanel.misc:SetWidth(FILTERMENU_WIDTH)
	FilterPanel.misc:SetHeight(280)
	FilterPanel.misc:EnableMouse(true)
	FilterPanel.misc:EnableKeyboard(true)
	FilterPanel.misc:SetMovable(false)
	FilterPanel.misc:SetPoint("TOPLEFT", FilterPanel, "TOPLEFT", 17, -16)
	FilterPanel.misc:Hide()

	local ARL_MiscAltText = FilterPanel.misc:CreateFontString("ARL_MiscAltBtn", "OVERLAY", "QuestFontNormalSmall")
	ARL_MiscAltText:SetText(L["Alt-Tradeskills"] .. ":")
	ARL_MiscAltText:SetPoint("TOPLEFT", FilterPanel.misc, "TOPLEFT", 5, -8)
	ARL_MiscAltText:SetHeight(14)
	ARL_MiscAltText:SetWidth(95)
	ARL_MiscAltText:SetJustifyH("LEFT")

	local ARL_MiscAltBtn = _G.CreateFrame("Button", "ARL_MiscAltBtn", FilterPanel.misc)
	ARL_MiscAltBtn:SetPoint("LEFT", ARL_MiscAltText, "RIGHT")
	ARL_MiscAltBtn:SetHeight(22)
	ARL_MiscAltBtn:SetWidth(22)
	ARL_MiscAltBtn:SetNormalTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Up]])
	ARL_MiscAltBtn:SetPushedTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Down]])
	ARL_MiscAltBtn:SetDisabledTexture([[Interface\Buttons\UI-SpellbookIcon-NextPage-Disabled]])
	ARL_MiscAltBtn:SetHighlightTexture([[Interface\Buttons\UI-Common-MouseHilight]])

	SetTooltipScripts(ARL_MiscAltBtn, L["ALT_TRADESKILL_DESC"], 1)

	ARL_MiscAltBtn:RegisterForClicks("LeftButtonUp")

	do
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
				table.wipe(click_info)
				click_info.anchor = anchor
				GenerateClickableTT()
				return
			end
			GenerateClickableTT()
		end

		local function SelectProfession(cell, arg, button)
			local tskl_list = addon.db.global.tradeskill
			local saved_link = tskl_list[click_info.realm][click_info.name][arg]

			if click_info.realm ~= private.REALM_NAME then
				local player_guid = _G.UnitGUID("player"):gsub("0x0+","")
				local color, trade_id, cur_lev, max_lev, guid, bitmask = (":"):split(saved_link)
				local trade_link = (":"):join(color,trade_id,cur_lev,max_lev,player_guid,bitmask)

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
			local target_realm = private.REALM_NAME

			if click_info.change_realm then
				target_realm = click_info.target_realm
				click_info.change_realm = nil
			end
			tip:Clear()

			if not click_info.realm then
				local other_realms
				local header

				for realm in pairs(tskl_list) do
					if target_realm and realm ~= target_realm then
						other_realms = true
					end

					if not target_realm and realm ~= private.REALM_NAME then
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
							if name ~= private.PLAYER_NAME then
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

		ARL_MiscAltBtn:SetScript("OnClick", function(self, button)
			if clicktip then
				if not click_info.modified then
					clicktip = QTip:Release(clicktip)
					table.wipe(click_info)
				else
					table.wipe(click_info)
					GenerateClickableTT(self)
				end
			else
				clicktip = QTip:Acquire("ARL_Clickable", 1, "CENTER")
				table.wipe(click_info)

				if _G.TipTac and _G.TipTac.AddModifiedTip then
					_G.TipTac:AddModifiedTip(clicktip, true)
				end
				GenerateClickableTT(self)
			end
		end)

		ARL_MiscAltBtn:SetScript("OnHide", function(self, button)
			clicktip = QTip:Release(clicktip)
			table.wipe(click_info)
		end)
	end

	-------------------------------------------------------------------------------
	-- Now that everything exists, populate the global filter table
	-------------------------------------------------------------------------------
	local filterdb = addon.db.profile.filters

	local expansion0 = FilterPanel.rep.expansion0
	local expansion1 = FilterPanel.rep.expansion1
	local expansion2 = FilterPanel.rep.expansion2
	local expansion3 = FilterPanel.rep.expansion3

	FilterPanel.value_map = {
		------------------------------------------------------------------------------------------------
		-- General Options
		------------------------------------------------------------------------------------------------
		["specialty"]		= { cb = FilterPanel.general.specialty,		svroot = filterdb.general },
		["skill"]		= { cb = FilterPanel.general.skill,		svroot = filterdb.general },
		["faction"]		= { cb = FilterPanel.general.faction,		svroot = filterdb.general },
		["known"]		= { cb = FilterPanel.general.known,		svroot = filterdb.general },
		["unknown"]		= { cb = FilterPanel.general.unknown,		svroot = filterdb.general },
		["retired"]		= { cb = FilterPanel.general.retired,		svroot = filterdb.general },
		------------------------------------------------------------------------------------------------
		-- Classes
		------------------------------------------------------------------------------------------------
		["deathknight"]		= { cb = FilterPanel.general.deathknight,	svroot = filterdb.classes },
		["druid"]		= { cb = FilterPanel.general.druid,		svroot = filterdb.classes },
		["hunter"]		= { cb = FilterPanel.general.hunter,		svroot = filterdb.classes },
		["mage"]		= { cb = FilterPanel.general.mage,		svroot = filterdb.classes },
		["paladin"]		= { cb = FilterPanel.general.paladin,		svroot = filterdb.classes },
		["priest"]		= { cb = FilterPanel.general.priest,		svroot = filterdb.classes },
		["rogue"]		= { cb = FilterPanel.general.rogue,		svroot = filterdb.classes },
		["shaman"]		= { cb = FilterPanel.general.shaman,		svroot = filterdb.classes },
		["warlock"]		= { cb = FilterPanel.general.warlock,		svroot = filterdb.classes },
		["warrior"]		= { cb = FilterPanel.general.warrior,		svroot = filterdb.classes },
		------------------------------------------------------------------------------------------------
		-- Obtain Options
		------------------------------------------------------------------------------------------------
		["instance"]		= { cb = FilterPanel.obtain.instance,		svroot = filterdb.obtain },
		["raid"]		= { cb = FilterPanel.obtain.raid,		svroot = filterdb.obtain },
		["quest"]		= { cb = FilterPanel.obtain.quest,		svroot = filterdb.obtain },
		["seasonal"]		= { cb = FilterPanel.obtain.seasonal,		svroot = filterdb.obtain },
		["trainer"]		= { cb = FilterPanel.obtain.trainer,		svroot = filterdb.obtain },
		["vendor"]		= { cb = FilterPanel.obtain.vendor,		svroot = filterdb.obtain },
		["pvp"]			= { cb = FilterPanel.obtain.pvp,		svroot = filterdb.obtain },
		["discovery"]		= { cb = FilterPanel.obtain.discovery,		svroot = filterdb.obtain },
		["worlddrop"]		= { cb = FilterPanel.obtain.worlddrop,		svroot = filterdb.obtain },
		["mobdrop"]		= { cb = FilterPanel.obtain.mobdrop,		svroot = filterdb.obtain },
		["achievement"]		= { cb = FilterPanel.obtain.achievement,	svroot = filterdb.obtain },
		["expansion0"]		= { cb = FilterPanel.obtain.expansion0,		svroot = filterdb.obtain },
		["expansion1"]		= { cb = FilterPanel.obtain.expansion1,		svroot = filterdb.obtain },
		["expansion2"]		= { cb = FilterPanel.obtain.expansion2,		svroot = filterdb.obtain },
		["expansion3"]		= { cb = FilterPanel.obtain.expansion3,		svroot = filterdb.obtain },
		------------------------------------------------------------------------------------------------
		-- Binding Options
		------------------------------------------------------------------------------------------------
		["itemboe"]		= { cb = FilterPanel.binding.itemboe,		svroot = filterdb.binding },
		["itembop"]		= { cb = FilterPanel.binding.itembop,		svroot = filterdb.binding },
		["recipeboe"]		= { cb = FilterPanel.binding.recipeboe,		svroot = filterdb.binding },
		["recipebop"]		= { cb = FilterPanel.binding.recipebop,		svroot = filterdb.binding },
		------------------------------------------------------------------------------------------------
		-- Quality Options
		------------------------------------------------------------------------------------------------
		["common"]		= { cb = FilterPanel.quality.common,		svroot = filterdb.quality },
		["uncommon"]		= { cb = FilterPanel.quality.uncommon,		svroot = filterdb.quality },
		["rare"]		= { cb = FilterPanel.quality.rare,		svroot = filterdb.quality },
		["epic"]		= { cb = FilterPanel.quality.epic,		svroot = filterdb.quality },
		------------------------------------------------------------------------------------------------
		-- Role Options
		------------------------------------------------------------------------------------------------
		["tank"]		= { cb = FilterPanel.player.tank,		svroot = filterdb.player },
		["melee"]		= { cb = FilterPanel.player.melee,		svroot = filterdb.player },
		["healer"]		= { cb = FilterPanel.player.healer,		svroot = filterdb.player },
		["caster"]		= { cb = FilterPanel.player.caster,		svroot = filterdb.player },
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
		------------------------------------------------------------------------------------------------
		-- Cataclysm Rep Options
		------------------------------------------------------------------------------------------------
		["catacommon1"]		= { cb = expansion3.catacommon1,		svroot = nil },
		["catacommon2"]		= { cb = expansion3.catacommon2,		svroot = nil },
		["guardiansofhyjal"]	= { cb = expansion3.guardiansofhyjal,		svroot = nil },
		["ramkahen"]		= { cb = expansion3.ramkahen,			svroot = nil },
		["earthenring"]		= { cb = expansion3.earthenring,		svroot = nil },
		["therazane"]		= { cb = expansion3.therazane,			svroot = nil },
	}
	private.InitializeFilterPanel = nil
end
