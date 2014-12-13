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

local EXPANSION_FRAMES = {}
for index = 1, #private.GAME_VERSION_NAMES do
	EXPANSION_FRAMES[("expansion%d"):format(index - 1)] = true
end

local CATEGORY_TOOLTIP = {
	general	= L["FILTERING_GENERAL_DESC"],
	obtain	= L["FILTERING_OBTAIN_DESC"],
	binding	= L["FILTERING_BINDING_DESC"],
	item	= L["FILTERING_ITEM_DESC"],
	quality	= L["FILTERING_QUALITY_DESC"],
	player	= L["FILTERING_PLAYERTYPE_DESC"],
	rep	= L["FILTERING_REP_DESC"],
	misc	= L["FILTERING_MISC_DESC"]
}

local LFAC = private.LOCALIZED_FACTION_STRINGS_FROM_LABEL

-------------------------------------------------------------------------------
-- Function to create and initialize a check-button with the given values.
-- Used in all of the sub-menus of MainPanel.filter_menu
-------------------------------------------------------------------------------
do
	local function CheckButton_OnClick(self, button, down)
		local value = addon.Frame.filter_menu.value_map[self.script_val]
		value.svroot[self.script_val] = value.cb:GetChecked() and true or false

		addon.Frame:UpdateTitle()
		addon.Frame.list_frame:Update(nil, false)
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
	addon.GenerateCheckBoxes = private.GenerateCheckBoxes -- TODO: Move this somewhere more sensical.
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
			if info.cb then
				info.cb:SetChecked(info.svroot[filter])
			else
				addon:Debug("The filter \"%s\" has an invalid checkbutton definition.", filter)
			end

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
	-- Create the seven buttons for opening/closing the filter menus
	-------------------------------------------------------------------------------
	local toggle_container = _G.CreateFrame("Frame", nil, MainPanel)
	toggle_container:SetSize(283, 22)
	toggle_container:SetPoint("BOTTOM", MainPanel.filter_menu, "TOP", 0, 5)

	local function CreateFilterMenuButton(button_texture, category)
		local button_size = 22
		local button = _G.CreateFrame("CheckButton", nil, toggle_container)
		button:Hide()
		button:SetSize(button_size, button_size)
		button:SetMotionScriptsWhileDisabled(true)

		-- The button must be unchecked for ToggleFilterMenu() to work correctly.
		button:SetScript("OnClick", function(self, mouse_button, down)
			button:SetChecked(false)
			ToggleFilterMenu(category)
		end)

		local bg_texture = button:CreateTexture(nil, "BACKGROUND")
		button.bg_texture = bg_texture
		bg_texture:SetTexture("Interface/SpellBook/UI-Spellbook-SpellBackground")
		bg_texture:SetHeight(button_size + 6)
		bg_texture:SetWidth(button_size + 4)
		bg_texture:SetTexCoord(0, (43/64), 0, (43/64))
		bg_texture:SetPoint("CENTER", button, "CENTER", 0, 0)

		local icon_texture = button:CreateTexture(nil, "BORDER")
		button.icon_texture = icon_texture
		icon_texture:SetTexture("Interface/Icons/" .. button_texture)
		icon_texture:SetAllPoints(button)

		local pushed_texture = button:CreateTexture(nil, "ARTWORK")
		pushed_texture:SetTexture("Interface/Buttons/UI-Quickslot-Depress")
		pushed_texture:SetAllPoints(button)
		button:SetPushedTexture(pushed_texture)

		local highlight_texture = button:CreateTexture()
		highlight_texture:SetTexture("Interface/Buttons/ButtonHilight-Square")
		highlight_texture:SetAllPoints(button)
		highlight_texture:SetBlendMode("ADD")
		button:SetHighlightTexture(highlight_texture)

		local checked_texture = button:CreateTexture()
		checked_texture:SetTexture("Interface/Buttons/CheckButtonHilight")
		checked_texture:SetAllPoints(button)
		checked_texture:SetBlendMode("ADD")
		button:SetCheckedTexture(checked_texture)

		-- And throw up a tooltip
		SetTooltipScripts(button, CATEGORY_TOOLTIP[category])

		return button
	end

	local general = CreateFilterMenuButton("INV_Misc_Note_06", "general")
	general:SetPoint("LEFT", toggle_container, "LEFT", 0, 0)

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

	private.SetTooltipScripts(general_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.GENERAL_LABEL))

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
		faction		= { tt = faction_desc,		text = faction_text,		row = 1, col = 1 },
		known		= { tt = L["KNOWN_DESC"],	text = L["Show Known"],		row = 1, col = 2 },
		skill		= { tt = L["SKILL_DESC"],	text = _G.SKILL,		row = 2, col = 1 },
		specialty	= { tt = L["SPECIALTY_DESC"],	text = L["Specialties"],	row = 2, col = 2 },
		unknown		= { tt = L["UNKNOWN_DESC"],	text = _G.UNKNOWN,		row = 3, col = 1 },
	}

	local general_panel = _G.CreateFrame("Frame", nil, general_frame)
	general_panel:SetHeight(70)
	general_panel:SetPoint("TOP", general_toggle, "BOTTOM")
	general_panel:SetPoint("LEFT", general_frame, "LEFT")
	general_panel:SetPoint("RIGHT", general_frame, "RIGHT")

	private.GenerateCheckBoxes(general_frame, general_buttons, general_panel)

	-------------------------------------------------------------------------------
	-- Create the Class toggle and CheckButtons.
	-------------------------------------------------------------------------------
	local class_toggle = _G.CreateFrame("Button", nil, general_frame)
	class_toggle:SetWidth(105)
	class_toggle:SetHeight(20)
	class_toggle:SetNormalFontObject("QuestTitleFont")
	class_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	class_toggle:SetFormattedText(_G.ITEM_CLASSES_ALLOWED, "")
	class_toggle:SetPoint("TOP", general_panel, "BOTTOM", 0, 0)
	class_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(class_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.CLASS))

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
		deathknight	= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],	row = 1, col = 1 },
		druid		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["DRUID"],		row = 1, col = 2 },
		hunter		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["HUNTER"],		row = 2, col = 1 },
		mage		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["MAGE"],		row = 2, col = 2 },
		monk		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["MONK"],		row = 3, col = 1 },
		paladin		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["PALADIN"],	row = 3, col = 2 },
		priest		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["PRIEST"],		row = 4, col = 1 },
		rogue		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["ROGUE"],		row = 4, col = 2 },
		shaman		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],		row = 5, col = 1 },
		warlock		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],	row = 5, col = 2 },
		warrior		= { tt = L["CLASS_DESC"],	text = _G.LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],	row = 6, col = 1 },
	}

	local class_panel = _G.CreateFrame("Frame", nil, general_frame)
	class_panel:SetHeight(110)
	class_panel:SetPoint("TOP", class_toggle, "BOTTOM")
	class_panel:SetPoint("LEFT", general_frame, "LEFT")
	class_panel:SetPoint("RIGHT", general_frame, "RIGHT")

	private.GenerateCheckBoxes(general_frame, class_buttons, class_panel)

	-------------------------------------------------------------------------------
	-- Create FilterPanel.obtain, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local A = private.ACQUIRE_TYPE_IDS
		local obtain_frame = FilterPanel:CreateSubMenu("obtain")

		-------------------------------------------------------------------------------
		-- Create the Acquisition toggle and CheckButtons
		-------------------------------------------------------------------------------
		local acquire_toggle = _G.CreateFrame("Button", nil, obtain_frame)
		acquire_toggle:SetWidth(105)
		acquire_toggle:SetHeight(20)
		acquire_toggle:SetNormalFontObject("QuestTitleFont")
		acquire_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		acquire_toggle:SetText(L["Acquisition"] .. ":")
		acquire_toggle:SetPoint("TOP", obtain_frame, "TOP", 0, -7)
		acquire_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(acquire_toggle, L["GROUP_TOGGLE_FORMAT"]:format(L["Acquisition"]))

		acquire_toggle:SetScript("OnClick", function(self, button)
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

		obtain_frame.acquire_toggle = acquire_toggle

		local acquire_buttons = {
			achievement	= { tt = L["ACHIEVEMENT_DESC"],		text = _G.ACHIEVEMENTS,					row = 1, col = 1 },
			discovery	= { tt = L["DISCOVERY_DESC"],		text = L["Discovery"],					row = 1, col = 2 },
			instance	= { tt = L["INSTANCE_DESC"],		text = _G.INSTANCE,					row = 2, col = 1 },
			misc1		= { tt = L["MISC_DESC"],		text = _G.MISCELLANEOUS,				row = 2, col = 2 },
			mobdrop		= { tt = L["MOB_DROP_DESC"],		text = L["Mob Drop"],					row = 3, col = 1 },
			pvp		= { tt = L["PVP_DESC"],			text = _G.PVP,						row = 3, col = 2 },
			quest		= { tt = L["QUEST_DESC"],		text = L["Quest"],					row = 4, col = 1 },
			raid		= { tt = L["RAID_DESC"],		text = _G.RAID,						row = 4, col = 2 },
			reputation	= { tt = L["REPUTATION_DESC"],		text = _G.REPUTATION,					row = 5, col = 1 },
			retired		= { tt = L["RETIRED_DESC"],		text = L["Retired"],					row = 5, col = 2 },
			trainer		= { tt = L["TRAINER_DESC"],		text = L["Trainer"],					row = 6, col = 1 },
			vendor		= { tt = L["VENDOR_DESC"],		text = L["Vendor"],					row = 6, col = 2 },
			worlddrop	= { tt = L["WORLD_DROP_DESC"],		text = L["World Drop"],					row = 7, col = 1 },
			seasonal	= { tt = L["SEASONAL_DESC"],		text = private.AcquireTypes.WorldEvents:Name(),		row = 7, col = 2 },
		}

		local acquire_panel = _G.CreateFrame("Frame", nil, obtain_frame)
		acquire_panel:SetHeight(140)
		acquire_panel:SetPoint("TOP", acquire_toggle, "BOTTOM")
		acquire_panel:SetPoint("LEFT", obtain_frame, "LEFT")
		acquire_panel:SetPoint("RIGHT", obtain_frame, "RIGHT")

		private.GenerateCheckBoxes(obtain_frame, acquire_buttons, acquire_panel)

		-------------------------------------------------------------------------------
		-- Create the Version toggle and CheckButtons
		-------------------------------------------------------------------------------
		local version_toggle = _G.CreateFrame("Button", nil, obtain_frame)
		version_toggle:SetWidth(105)
		version_toggle:SetHeight(20)
		version_toggle:SetNormalFontObject("QuestTitleFont")
		version_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		version_toggle:SetText(_G.GAME_VERSION_LABEL .. ":")
		version_toggle:SetPoint("TOP", acquire_panel, "BOTTOM", 0, 0)
		version_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(version_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.GAME_VERSION_LABEL))

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

		local function ExpansionDesc(expansion_text)
			return L["EXPANSION_DESC_FORMAT"]:format(expansion_text)
		end
		obtain_frame.version_toggle = version_toggle

		local version_buttons = {}
		for index = 1, #private.GAME_VERSION_NAMES do
			local expansion_name = _G[("EXPANSION_NAME%d"):format(index - 1)]
			version_buttons[("expansion%d"):format(index - 1)]  = { tt = ExpansionDesc(expansion_name), text = expansion_name, row = index, col = 1 }
		end

		local version_panel = _G.CreateFrame("Frame", nil, obtain_frame)
		version_panel:SetHeight(60)
		version_panel:SetPoint("TOP", version_toggle, "BOTTOM")
		version_panel:SetPoint("LEFT", obtain_frame, "LEFT")
		version_panel:SetPoint("RIGHT", obtain_frame, "RIGHT")

		private.GenerateCheckBoxes(obtain_frame, version_buttons, version_panel)
		ExpansionDesc = nil
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

		private.SetTooltipScripts(binding_toggle, L["GROUP_TOGGLE_FORMAT"]:format(L["Binding"]))

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
			item_bind_on_equip	= { tt = L["BOE_DESC"],		text = L["BOEFilter"],		row = 1, col = 1 },
			item_bind_on_pickup	= { tt = L["BOP_DESC"],		text = L["BOPFilter"],		row = 2, col = 1 },
			recipe_bind_on_equip	= { tt = L["RECIPE_BOE_DESC"],	text = L["RecipeBOEFilter"],	row = 3, col = 1 },
			recipe_bind_on_pickup	= { tt = L["RECIPE_BOP_DESC"],	text = L["RecipeBOPFilter"],	row = 4, col = 1 },
		}

		local binding_panel = _G.CreateFrame("Frame", nil, binding_frame)
		binding_panel:SetHeight(50)
		binding_panel:SetPoint("TOP", binding_toggle, "BOTTOM")
		binding_panel:SetPoint("LEFT", binding_frame, "LEFT")
		binding_panel:SetPoint("RIGHT", binding_frame, "RIGHT")

		private.GenerateCheckBoxes(binding_frame, binding_buttons, binding_panel)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.item, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local item_frame = FilterPanel:CreateSubMenu("item")
		item_frame:SetScript("OnHide", function(self)
			if self.sub_panel then
				self.sub_panel:Hide()
			end
		end)

		item_frame:SetScript("OnShow", function(self)
			local sub_panel = self["items_" .. private.PROFESSION_LABELS[MainPanel.current_profession]]

			if sub_panel then
				sub_panel:Show()
			end
			self.sub_panel = sub_panel
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

		private.SetTooltipScripts(quality_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.QUALITY))

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
			common		= { tt = QualityDesc(_G.ITEM_QUALITY1_DESC),	text = _G.ITEM_QUALITY1_DESC,	row = 1, col = 1 },
			uncommon	= { tt = QualityDesc(_G.ITEM_QUALITY2_DESC),	text = _G.ITEM_QUALITY2_DESC,	row = 1, col = 2 },
			rare		= { tt = QualityDesc(_G.ITEM_QUALITY3_DESC),	text = _G.ITEM_QUALITY3_DESC,	row = 2, col = 1 },
			epic		= { tt = QualityDesc(_G.ITEM_QUALITY4_DESC),	text = _G.ITEM_QUALITY4_DESC,	row = 2, col = 2 },
		}

		local quality_panel = _G.CreateFrame("Frame", nil, quality_frame)
		quality_panel:SetHeight(50)
		quality_panel:SetPoint("TOP", quality_toggle, "BOTTOM")
		quality_panel:SetPoint("LEFT", quality_frame, "LEFT")
		quality_panel:SetPoint("RIGHT", quality_frame, "RIGHT")

		private.GenerateCheckBoxes(quality_frame, quality_buttons, quality_panel)
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

		private.SetTooltipScripts(role_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.ROLE))

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
			tank	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.TANK),		text = _G.TANK,		row = 1, col = 1 },
			melee	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.MELEE),	text = _G.MELEE,	row = 1, col = 2 },
			healer	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.HEALER),	text = _G.HEALER,	row = 2, col = 1 },
			caster	= { tt = L["ROLE_DESC_FORMAT"]:format(_G.DAMAGER),	text = _G.DAMAGER,	row = 2, col = 2 },
		}

		local role_panel = _G.CreateFrame("Frame", nil, player_frame)
		role_panel:SetHeight(50)
		role_panel:SetPoint("TOP", role_toggle, "BOTTOM")
		role_panel:SetPoint("LEFT", player_frame, "LEFT")
		role_panel:SetPoint("RIGHT", player_frame, "RIGHT")

		private.GenerateCheckBoxes(player_frame, role_buttons, role_panel)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create FilterPanel.rep, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local rep_frame = FilterPanel:CreateSubMenu("rep")

		local EXPANSION_TOOLTIPS = {}
		for index = 1, #private.GAME_VERSION_NAMES do
			EXPANSION_TOOLTIPS[("expansion%d"):format(index - 1)] = L["EXPANSION_FILTER_FORMAT"]:format(_G[("EXPANSION_NAME%d"):format(index - 1)])
		end

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
		function rep_frame:CreateExpansionButton(texture, expansion_num)
			local cButton = _G.CreateFrame("CheckButton", nil, self)
			cButton:SetWidth(110)
			cButton:SetHeight(50)
			cButton:SetChecked(false)
			cButton:SetScript("OnClick", function(self, button, down)
				ToggleExpansionMenu(expansion_num)
			end)

			local iconTex = cButton:CreateTexture(nil, "BORDER")
			iconTex:SetTexture(texture)
			iconTex:SetWidth(110)
			iconTex:SetHeight(50)
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
			SetTooltipScripts(cButton, EXPANSION_TOOLTIPS[expansion_num])

			return cButton
		end

		-------------------------------------------------------------------------------
		-- Create the expansion toggles.
		-------------------------------------------------------------------------------
		local expansion_buttons = {}
		for index = 1, #private.GAME_VERSION_NAMES do
			local expansion_button = rep_frame:CreateExpansionButton(private.EXPANSION_LOGO_TEXTURES[index], ("expansion%d"):format(index - 1))
			expansion_buttons[#expansion_buttons + 1] = expansion_button

			if index == 1 then
				expansion_button:SetPoint("TOPLEFT", FilterPanel.rep, "TOPLEFT", 2, -10)
			else
				expansion_button:SetPoint("TOP", expansion_buttons[index - 1], "BOTTOM", 0, 0)
			end

			rep_frame["toggle_expansion" .. index - 1] = expansion_button
		end
	end	-- do

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
	-- Create FilterPanel.rep.expansionX, and set its scripts.
	-------------------------------------------------------------------------------
	local function CreateExpansionFrame(expansion_num)
		local expansion_frame = _G.CreateFrame("Frame", nil, FilterPanel.rep)
		expansion_frame:SetWidth(200)
		expansion_frame:SetHeight(FILTERMENU_HEIGHT)
		expansion_frame:EnableMouse(true)
		expansion_frame:EnableKeyboard(true)
		expansion_frame:SetMovable(false)
		expansion_frame:SetPoint("TOPRIGHT", FilterPanel, "TOPRIGHT", 0, 0)
		expansion_frame:Hide()

		FilterPanel.rep[("expansion%d"):format(expansion_num)] = expansion_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local expansion_buttons = {}
		local reputations = private[("EXPANSION%d_REPUTATIONS"):format(expansion_num)]

		for index = 1, #reputations do
			local rep_name = reputations[index]
			expansion_buttons[rep_name:lower()] = { text = LFAC[rep_name], tt = ReputationDesc(LFAC[rep_name]), row = index + 1, col = 1 }
		end
		private.GenerateCheckBoxes(expansion_frame, expansion_buttons)

		local expansion_toggle = _G.CreateFrame("Button", nil, expansion_frame)
		expansion_toggle:SetWidth(105)
		expansion_toggle:SetHeight(20)
		expansion_toggle:SetNormalFontObject("QuestTitleFont")
		expansion_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
		expansion_toggle:SetText(_G.REPUTATION .. ":")
		expansion_toggle:SetPoint("TOPLEFT", expansion_frame, "TOPLEFT", -2, -7)
		expansion_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

		private.SetTooltipScripts(expansion_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.REPUTATION))

		expansion_toggle.buttons = expansion_buttons
		expansion_toggle.frame = expansion_frame

		expansion_toggle:SetScript("OnClick", ToggleExpansionCheckBoxes)
	end

	for index = 1, #private.GAME_VERSION_NAMES do
		CreateExpansionFrame(index - 1)
	end

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

	-- TODO: Add something here, since the Alt-Tradeskills code has been excised.

	-------------------------------------------------------------------------------
	-- Now that everything exists, populate the global filter table
	-------------------------------------------------------------------------------
	local filterdb = addon.db.profile.filters

	local expansion0 = FilterPanel.rep.expansion0
	local expansion1 = FilterPanel.rep.expansion1
	local expansion2 = FilterPanel.rep.expansion2
	local expansion3 = FilterPanel.rep.expansion3
	local expansion4 = FilterPanel.rep.expansion4
	local expansion5 = FilterPanel.rep.expansion5

	FilterPanel.value_map = {
		------------------------------------------------------------------------------------------------
		-- General Options
		------------------------------------------------------------------------------------------------
		specialty		= { cb = FilterPanel.general.specialty,			svroot = filterdb.general },
		skill			= { cb = FilterPanel.general.skill,			svroot = filterdb.general },
		faction			= { cb = FilterPanel.general.faction,			svroot = filterdb.general },
		known			= { cb = FilterPanel.general.known,			svroot = filterdb.general },
		unknown			= { cb = FilterPanel.general.unknown,			svroot = filterdb.general },
		------------------------------------------------------------------------------------------------
		-- Classes
		------------------------------------------------------------------------------------------------
		deathknight		= { cb = FilterPanel.general.deathknight,		svroot = filterdb.classes },
		druid			= { cb = FilterPanel.general.druid,			svroot = filterdb.classes },
		hunter			= { cb = FilterPanel.general.hunter,			svroot = filterdb.classes },
		mage			= { cb = FilterPanel.general.mage,			svroot = filterdb.classes },
		monk			= { cb = FilterPanel.general.monk,			svroot = filterdb.classes },
		paladin			= { cb = FilterPanel.general.paladin,			svroot = filterdb.classes },
		priest			= { cb = FilterPanel.general.priest,			svroot = filterdb.classes },
		rogue			= { cb = FilterPanel.general.rogue,			svroot = filterdb.classes },
		shaman			= { cb = FilterPanel.general.shaman,			svroot = filterdb.classes },
		warlock			= { cb = FilterPanel.general.warlock,			svroot = filterdb.classes },
		warrior			= { cb = FilterPanel.general.warrior,			svroot = filterdb.classes },
		------------------------------------------------------------------------------------------------
		-- Obtain Options
		------------------------------------------------------------------------------------------------
		achievement		= { cb = FilterPanel.obtain.achievement,		svroot = filterdb.obtain },
		discovery		= { cb = FilterPanel.obtain.discovery,			svroot = filterdb.obtain },
		instance		= { cb = FilterPanel.obtain.instance,			svroot = filterdb.obtain },
		mobdrop			= { cb = FilterPanel.obtain.mobdrop,			svroot = filterdb.obtain },
		pvp			= { cb = FilterPanel.obtain.pvp,			svroot = filterdb.obtain },
		quest			= { cb = FilterPanel.obtain.quest,			svroot = filterdb.obtain },
		raid			= { cb = FilterPanel.obtain.raid,			svroot = filterdb.obtain },
		reputation		= { cb = FilterPanel.obtain.reputation,			svroot = filterdb.obtain },
		retired			= { cb = FilterPanel.obtain.retired,			svroot = filterdb.obtain },
		seasonal		= { cb = FilterPanel.obtain.seasonal,			svroot = filterdb.obtain },
		trainer			= { cb = FilterPanel.obtain.trainer,			svroot = filterdb.obtain },
		vendor			= { cb = FilterPanel.obtain.vendor,			svroot = filterdb.obtain },
		worlddrop		= { cb = FilterPanel.obtain.worlddrop,			svroot = filterdb.obtain },
		misc1			= { cb = FilterPanel.obtain.misc1,			svroot = filterdb.obtain },
		------------------------------------------------------------------------------------------------
		-- Binding Options
		------------------------------------------------------------------------------------------------
		item_bind_on_equip	= { cb = FilterPanel.binding.item_bind_on_equip,	svroot = filterdb.binding },
		item_bind_on_pickup	= { cb = FilterPanel.binding.item_bind_on_pickup,	svroot = filterdb.binding },
		recipe_bind_on_equip	= { cb = FilterPanel.binding.recipe_bind_on_equip,	svroot = filterdb.binding },
		recipe_bind_on_pickup	= { cb = FilterPanel.binding.recipe_bind_on_pickup,	svroot = filterdb.binding },
		------------------------------------------------------------------------------------------------
		-- Quality Options
		------------------------------------------------------------------------------------------------
		common			= { cb = FilterPanel.quality.common,			svroot = filterdb.quality },
		uncommon		= { cb = FilterPanel.quality.uncommon,			svroot = filterdb.quality },
		rare			= { cb = FilterPanel.quality.rare,			svroot = filterdb.quality },
		epic			= { cb = FilterPanel.quality.epic,			svroot = filterdb.quality },
		------------------------------------------------------------------------------------------------
		-- Role Options
		------------------------------------------------------------------------------------------------
		tank			= { cb = FilterPanel.player.tank,			svroot = filterdb.player },
		melee			= { cb = FilterPanel.player.melee,			svroot = filterdb.player },
		healer			= { cb = FilterPanel.player.healer,			svroot = filterdb.player },
		caster			= { cb = FilterPanel.player.caster,			svroot = filterdb.player },
	}

	------------------------------------------------------------------------------------------------
	-- Expansion and Reputation Options
	------------------------------------------------------------------------------------------------
	for expansion_index = 1, #private.GAME_VERSION_NAMES do
		local expansion_name = ("expansion%d"):format(expansion_index - 1)
		FilterPanel.value_map[expansion_name] = {
			cb = FilterPanel.obtain[expansion_name],
			svroot = filterdb.obtain
		}

		local reputations = private[("EXPANSION%d_REPUTATIONS"):format(expansion_index - 1)]
		for reputation_index = 1, #reputations do
			local reputation_name = reputations[reputation_index]:lower()

			FilterPanel.value_map[reputation_name] = {
				cb = FilterPanel.rep[expansion_name][reputation_name],
				svroot = filterdb.rep
			}
		end
	end

	private.InitializeFilterPanel = nil
end
