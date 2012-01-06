-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

function private:InitializeItemFilters_Blacksmithing(parent_panel)
	local MainPanel = addon.Frame

	local armor_toggle = _G.CreateFrame("Button", nil, parent_panel)
	armor_toggle:SetWidth(105)
	armor_toggle:SetHeight(20)
	armor_toggle:SetNormalFontObject("QuestTitleFont")
	armor_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	armor_toggle:SetText(_G.ARMOR .. ":")
	armor_toggle:SetPoint("TOP", parent_panel, "TOP", 0, -7)
	armor_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(armor_toggle, L["ARMOR_TEXT_DESC"])

	local armor_types = {
		"blacksmithing_mail",
		"blacksmithing_plate",
		"blacksmithing_shield"
	}

	armor_toggle:SetScript("OnClick", function(self, button)
		local toggle = (button == "LeftButton") and true or false

		for index = 1, #armor_types do
			local item = armor_types[index]

			addon.db.profile.filters.item[item] = toggle
			parent_panel[item]:SetChecked(toggle)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	parent_panel.armor_toggle = armor_toggle

	local armor_panel = _G.CreateFrame("Frame", nil, parent_panel)
	armor_panel:SetHeight(50)
	armor_panel:SetPoint("TOP", armor_toggle, "BOTTOM")
	armor_panel:SetPoint("LEFT", parent_panel, "LEFT")
	armor_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	local armor_buttons = {
		["blacksmithing_mail"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Mail"]),	text = L["Mail"],	row = 1, col = 1 },
		["blacksmithing_plate"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Plate"]),	text = L["Plate"],	row = 1, col = 2 },
		["blacksmithing_shield"]	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Shield"]),	text = L["Shield"],	row = 2, col = 1 },
	}
	private.GenerateCheckBoxes(parent_panel, armor_buttons, armor_panel)

	for index = 1, #armor_types do
		local item_type = armor_types[index]

		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_blacksmithing[item_type],
			svroot = addon.db.profile.filters.item
		}

		private.HARD_FILTERS[item_type] = {
			flag = private.ITEM_FLAGS_WORD1[item_type:upper()],
			field = "item1",
			sv_root = addon.db.profile.filters.item
		}
	end

	-------------------------------------------------------------------------------
	-- Create the Weapon toggle and CheckButtons
	-------------------------------------------------------------------------------
	local weapon_toggle = _G.CreateFrame("Button", nil, parent_panel)
	weapon_toggle:SetWidth(105)
	weapon_toggle:SetHeight(20)
	weapon_toggle:SetNormalFontObject("QuestTitleFont")
	weapon_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	weapon_toggle:SetText(L["Weapon"] .. ":")
	weapon_toggle:SetPoint("TOP", armor_panel, "BOTTOM", 0, 0)
	weapon_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(weapon_toggle, L["WEAPON_TEXT_DESC"])

	local weapon_types = {
		"blacksmithing_dagger",
		"blacksmithing_one_hand_axe",
		"blacksmithing_one_hand_mace",
		"blacksmithing_one_hand_sword",
		"blacksmithing_polearm",
		"blacksmithing_thrown",
		"blacksmithing_two_hand_axe",
		"blacksmithing_two_hand_mace",
		"blacksmithing_two_hand_sword"
	}

	weapon_toggle:SetScript("OnClick", function(self, button)
		local toggle = (button == "LeftButton") and true or false

		for index = 1, #weapon_types do
			local item = weapon_types[index]

			addon.db.profile.filters.item[item] = toggle
			parent_panel[item]:SetChecked(toggle)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	parent_panel.weapon_toggle = weapon_toggle

	local weapon_panel = _G.CreateFrame("Frame", nil, parent_panel)
	weapon_panel:SetHeight(110)
	weapon_panel:SetPoint("TOP", weapon_toggle, "BOTTOM")
	weapon_panel:SetPoint("LEFT", parent_panel, "LEFT")
	weapon_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	local weapon_buttons = {
		["blacksmithing_dagger"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Dagger"]),		text = L["Dagger"],		row = 1, col = 1 },
		["blacksmithing_one_hand_axe"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["One-Handed Axe"]),	text = L["One-Handed Axe"],	row = 1, col = 2 },
		["blacksmithing_one_hand_mace"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["One-Handed Mace"]),	text = L["One-Handed Mace"],	row = 2, col = 1 },
		["blacksmithing_one_hand_sword"]	= { tt = L["FILTER_DESC_FORMAT"]:format(L["One-Handed Sword"]),	text = L["One-Handed Sword"],	row = 2, col = 2 },
		["blacksmithing_polearm"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Polearm"]),		text = L["Polearm"],		row = 3, col = 1 },
		["blacksmithing_thrown"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Thrown"]),		text = L["Thrown"],		row = 3, col = 2 },
		["blacksmithing_two_hand_axe"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Two-Handed Axe"]),	text = L["Two-Handed Axe"],	row = 4, col = 1 },
		["blacksmithing_two_hand_mace"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Two-Handed Mace"]),	text = L["Two-Handed Mace"],	row = 4, col = 2 },
		["blacksmithing_two_hand_sword"]	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Two-Handed Sword"]),	text = L["Two-Handed Sword"],	row = 5, col = 1 },
	}
	private.GenerateCheckBoxes(parent_panel, weapon_buttons, weapon_panel)

	for index = 1, #weapon_types do
		local item_type = weapon_types[index]

		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_blacksmithing[item_type],
			svroot = addon.db.profile.filters.item
		}

		private.HARD_FILTERS[item_type] = {
			flag = private.ITEM_FLAGS_WORD1[item_type:upper()],
			field = "item1",
			sv_root = addon.db.profile.filters.item
		}
	end

	-------------------------------------------------------------------------------
	-- Create the General toggle and CheckButtons
	-------------------------------------------------------------------------------
	local general_toggle = _G.CreateFrame("Button", nil, parent_panel)
	general_toggle:SetWidth(105)
	general_toggle:SetHeight(20)
	general_toggle:SetNormalFontObject("QuestTitleFont")
	general_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	general_toggle:SetText(_G.GENERAL .. ":")
	general_toggle:SetPoint("TOP", weapon_panel, "BOTTOM", 0, 0)
	general_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(general_toggle, L["WEAPON_TEXT_DESC"])

	local general_types = {
		"blacksmithing_item_enhancement",
		"blacksmithing_materials",
		"blacksmithing_rod",
		"blacksmithing_skeleton_key",
	}

	general_toggle:SetScript("OnClick", function(self, button)
		local toggle = (button == "LeftButton") and true or false

		for index = 1, #general_types do
			local item = general_types[index]

			addon.db.profile.filters.item[item] = toggle
			parent_panel[item]:SetChecked(toggle)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	parent_panel.general_toggle = general_toggle

	local general_panel = _G.CreateFrame("Frame", nil, parent_panel)
	general_panel:SetHeight(70)
	general_panel:SetPoint("TOP", general_toggle, "BOTTOM")
	general_panel:SetPoint("LEFT", parent_panel, "LEFT")
	general_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	local general_buttons = {
		["blacksmithing_item_enhancement"]	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Item Enhancement"]),	text = L["Item Enhancement"],	row = 1, col = 1 },
		["blacksmithing_materials"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Materials"]),	text = L["Materials"],		row = 1, col = 2 },
		["blacksmithing_rod"]			= { tt = L["FILTER_DESC_FORMAT"]:format(L["Rod"]),		text = L["Rod"],		row = 2, col = 1 },
		["blacksmithing_skeleton_key"]		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Skeleton Key"]),	text = L["Skeleton Key"],	row = 2, col = 2 },
	}
	private.GenerateCheckBoxes(parent_panel, general_buttons, general_panel)

	for index = 1, #general_types do
		local item_type = general_types[index]

		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_blacksmithing[item_type],
			svroot = addon.db.profile.filters.item
		}

		private.HARD_FILTERS[item_type] = {
			flag = private.ITEM_FLAGS_WORD1[item_type:upper()],
			field = "item1",
			sv_root = addon.db.profile.filters.item
		}
	end
	self.InitializeItemFilters_Blacksmithing = nil
end
