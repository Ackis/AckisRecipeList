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

function private:InitializeItemFilters_Leatherworking(parent_panel)
	local MainPanel = addon.Frame

	local armor_toggle = _G.CreateFrame("Button", nil, parent_panel)
	armor_toggle:SetWidth(105)
	armor_toggle:SetHeight(20)
	armor_toggle:SetNormalFontObject("QuestTitleFont")
	armor_toggle:SetHighlightFontObject("QuestTitleFontBlackShadow")
	armor_toggle:SetText(_G.ARMOR .. ":")
	armor_toggle:SetPoint("TOP", parent_panel, "TOP", 0, -7)
	armor_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(armor_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.ARMOR))

	local armor_types = {
		leatherworking_back	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_CLOAK), 	text = _G.INVTYPE_CLOAK,	row = 1, col = 1 },
		leatherworking_chest	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_CHEST), 	text = _G.INVTYPE_CHEST,	row = 1, col = 2 },
		leatherworking_feet	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_FEET), 	text = _G.INVTYPE_FEET,		row = 2, col = 1 },
		leatherworking_hands	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_HAND), 	text = _G.INVTYPE_HAND,		row = 2, col = 2 },
		leatherworking_head	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_HEAD), 	text = _G.INVTYPE_HEAD,		row = 3, col = 1 },
		leatherworking_legs	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_LEGS), 	text = _G.INVTYPE_LEGS,		row = 3, col = 2 },
		leatherworking_shoulder	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_SHOULDER), 	text = _G.INVTYPE_SHOULDER,	row = 4, col = 1 },
		leatherworking_waist	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_WAIST), 	text = _G.INVTYPE_WAIST,	row = 4, col = 2 },
		leatherworking_wrist	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_WRIST), 	text = _G.INVTYPE_WRIST,	row = 5, col = 1 },
	}

	armor_toggle:SetScript("OnClick", function(self, button)
		local toggle = (button == "LeftButton") and true or false

		for item in pairs(armor_types) do
			addon.db.profile.filters.item[item] = toggle
			parent_panel[item]:SetChecked(toggle)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	parent_panel.armor_toggle = armor_toggle

	local armor_panel = _G.CreateFrame("Frame", nil, parent_panel)
	armor_panel:SetHeight(100)
	armor_panel:SetPoint("TOP", armor_toggle, "BOTTOM")
	armor_panel:SetPoint("LEFT", parent_panel, "LEFT")
	armor_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	private.GenerateCheckBoxes(parent_panel, armor_types, armor_panel)

	for item_type in pairs(armor_types) do
		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_leatherworking[item_type],
			svroot = addon.db.profile.filters.item
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
	general_toggle:SetPoint("TOP", armor_panel, "BOTTOM", 0, 0)
	general_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(general_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.GENERAL))

	local general_types = {
		leatherworking_bag		= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_BAG),	text = _G.INVTYPE_BAG,		row = 1, col = 1 },
		leatherworking_created_item	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.NONEQUIPSLOT),	text = _G.NONEQUIPSLOT,		row = 1, col = 2 },
		leatherworking_item_enhancement	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Item Enhancement"]),	text = L["Item Enhancement"],	row = 2, col = 1 },
		leatherworking_materials	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Materials"]),	text = L["Materials"],		row = 2, col = 2 },
	}

	general_toggle:SetScript("OnClick", function(self, button)
		local toggle = (button == "LeftButton") and true or false

		for item in pairs(general_types) do
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

	private.GenerateCheckBoxes(parent_panel, general_types, general_panel)

	for item_type in pairs(general_types) do
		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_leatherworking[item_type],
			svroot = addon.db.profile.filters.item
		}
	end
	self.InitializeItemFilters_Leatherworking = nil
end
