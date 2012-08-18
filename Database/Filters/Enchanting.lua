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

function private:InitializeItemFilters_Enchanting(parent_panel)
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
		enchanting_boots	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Boots"]),		text = L["Boots"],		row = 1, col = 1},
		enchanting_bracer	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Bracer"]),		text = L["Bracer"],		row = 1, col = 2},
		enchanting_chest	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.INVTYPE_CHEST),	text = _G.INVTYPE_CHEST,	row = 2, col = 1},
		enchanting_cloak	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Cloak"]),		text = L["Cloak"],		row = 2, col = 2},
		enchanting_gloves	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Gloves"]),		text = L["Gloves"],		row = 3, col = 1},
		enchanting_ring		= { tt = L["FILTER_DESC_FORMAT"]:format(L["Ring"]),		text = L["Ring"],		row = 3, col = 2},
		enchanting_shield	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Shield"]),		text = L["Shield"],		row = 4, col = 1},
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
	armor_panel:SetHeight(80)
	armor_panel:SetPoint("TOP", armor_toggle, "BOTTOM")
	armor_panel:SetPoint("LEFT", parent_panel, "LEFT")
	armor_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	private.GenerateCheckBoxes(parent_panel, armor_types, armor_panel)

	for item_type in pairs(armor_types) do
		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_enchanting[item_type],
			svroot = addon.db.profile.filters.item
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

	private.SetTooltipScripts(weapon_toggle, L["GROUP_TOGGLE_FORMAT"]:format(L["Weapon"]))

	local weapon_types = {
		enchanting_2h_weapon	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.ENCHSLOT_2HWEAPON),	text = _G.ENCHSLOT_2HWEAPON,	row = 1, col = 1 },
		enchanting_staff	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Staff"]),		text = L["Staff"],		row = 1, col = 2 },
		enchanting_weapon	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.ENCHSLOT_WEAPON),	text = _G.ENCHSLOT_WEAPON,	row = 2, col = 1 },
	}

	weapon_toggle:SetScript("OnClick", function(self, button)
		local toggle = (button == "LeftButton") and true or false

		for item in pairs(weapon_types) do
			addon.db.profile.filters.item[item] = toggle
			parent_panel[item]:SetChecked(toggle)
		end
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end)

	parent_panel.weapon_toggle = weapon_toggle

	local weapon_panel = _G.CreateFrame("Frame", nil, parent_panel)
	weapon_panel:SetHeight(50)
	weapon_panel:SetPoint("TOP", weapon_toggle, "BOTTOM")
	weapon_panel:SetPoint("LEFT", parent_panel, "LEFT")
	weapon_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	private.GenerateCheckBoxes(parent_panel, weapon_types, weapon_panel)

	for item_type in pairs(weapon_types) do
		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_enchanting[item_type],
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
	general_toggle:SetPoint("TOP", weapon_panel, "BOTTOM", 0, 0)
	general_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

	private.SetTooltipScripts(general_toggle, L["GROUP_TOGGLE_FORMAT"]:format(_G.GENERAL))

	local general_types = {
		enchanting_misc	= { tt = L["FILTER_DESC_FORMAT"]:format(_G.MISCELLANEOUS),	text = _G.MISCELLANEOUS,	row = 1, col = 1 },
		enchanting_oil	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Oil"]),		text = L["Oil"],		row = 1, col = 2 },
		enchanting_rod	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Rod"]),		text = L["Rod"],		row = 2, col = 1 },
		enchanting_wand	= { tt = L["FILTER_DESC_FORMAT"]:format(L["Wand"]),		text = L["Wand"],		row = 2, col = 2 },
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
	general_panel:SetHeight(110)
	general_panel:SetPoint("TOP", general_toggle, "BOTTOM")
	general_panel:SetPoint("LEFT", parent_panel, "LEFT")
	general_panel:SetPoint("RIGHT", parent_panel, "RIGHT")

	private.GenerateCheckBoxes(parent_panel, general_types, general_panel)

	for item_type in pairs(general_types) do
		MainPanel.filter_menu.value_map[item_type] = {
			cb = MainPanel.filter_menu.item.items_enchanting[item_type],
			svroot = addon.db.profile.filters.item
		}
	end
	self.InitializeItemFilters_Enchanting = nil
end
