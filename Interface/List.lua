-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string
local table = _G.table
local math = _G.math

local bit = _G.bit
local pairs = _G.pairs
local select = _G.select
local type = _G.type

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub	= _G.LibStub
local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local QTip	= LibStub("LibQTip-1.0")
local Dialog	= LibStub("LibDialog-1.0")

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local NUM_RECIPE_LINES	= 25
local SCROLL_DEPTH	= 5
local LISTFRAME_WIDTH	= 295
local LIST_ENTRY_WIDTH	= 286

local CATEGORY_COLORS	= private.CATEGORY_COLORS
local BASIC_COLORS	= private.BASIC_COLORS

local COMMON1		= private.COMMON_FLAGS_WORD1

local A			= private.ACQUIRE_TYPES

local COORD_FORMAT	= "(%.2f, %.2f)"

-------------------------------------------------------------------------------
-- Dialogs.
-------------------------------------------------------------------------------
Dialog:Register("ARL_NotScanned", {
	text = L["NOTSCANNED"],
	buttons = {
		{
			text = _G.OKAY,
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
})

Dialog:Register("ARL_AllFiltered", {
	text = L["ALL_FILTERED"],
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
})

Dialog:Register("ARL_AllKnown", {
	text = L["ARL_ALLKNOWN"],
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
})

Dialog:Register("ARL_AllExcluded", {
	text = L["ARL_ALLEXCLUDED"],
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
})

Dialog:Register("ARL_SearchFiltered", {
	text = L["ARL_SEARCHFILTERED"],
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
})

function private.DismissDialogs()
	Dialog:Dismiss("ARL_NotScanned")
	Dialog:Dismiss("ARL_AllFiltered")
	Dialog:Dismiss("ARL_AllKnown")
	Dialog:Dismiss("ARL_AllExcluded")
	Dialog:Dismiss("ARL_SearchFiltered")
end


-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local ListItem_ShowTooltip

local acquire_tip
local spell_tip

local AcquireTable = private.AcquireTable
local ReleaseTable = private.ReleaseTable
local SetTextColor = private.SetTextColor

-------------------------------------------------------------------------------
-- Frame creation and anchoring
-------------------------------------------------------------------------------
function private.InitializeListFrame()
	local MainPanel	= addon.Frame
	local ListFrame = _G.CreateFrame("Frame", nil, MainPanel)

	MainPanel.list_frame = ListFrame

	ListFrame:SetHeight(335)
	ListFrame:SetWidth(LISTFRAME_WIDTH)
	ListFrame:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 22, -75)
	ListFrame:SetBackdrop({
				      bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
				      tile = true,
				      tileSize = 16,
			      })
	ListFrame:SetBackdropColor(1, 1, 1)
	ListFrame:EnableMouse(true)
	ListFrame:EnableMouseWheel(true)

	-------------------------------------------------------------------------------
	-- Scroll bar.
	-------------------------------------------------------------------------------
	local ScrollBar = _G.CreateFrame("Slider", nil, ListFrame)

	ScrollBar:SetPoint("TOPLEFT", ListFrame, "TOPRIGHT", 5, -11)
	ScrollBar:SetPoint("BOTTOMLEFT", ListFrame, "BOTTOMRIGHT", 5, 12)
	ScrollBar:SetWidth(24)

	ScrollBar:EnableMouseWheel(true)
	ScrollBar:SetOrientation("VERTICAL")

	ScrollBar:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
	ScrollBar:SetMinMaxValues(0, 1)
	ScrollBar:SetValueStep(1)

	ListFrame.scroll_bar = ScrollBar

	local ScrollUpButton = _G.CreateFrame("Button", nil, ScrollBar, "UIPanelScrollUpButtonTemplate")

	ScrollUpButton:SetHeight(16)
	ScrollUpButton:SetWidth(18)
	ScrollUpButton:SetPoint("BOTTOM", ScrollBar, "TOP", 0, -4)

	local ScrollDownButton = _G.CreateFrame("Button", nil, ScrollBar,"UIPanelScrollDownButtonTemplate")

	ScrollDownButton:SetHeight(16)
	ScrollDownButton:SetWidth(18)
	ScrollDownButton:SetPoint("TOP", ScrollBar, "BOTTOM", 0, 4)

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

	ScrollUpButton:SetScript("OnClick", function(self, button, down)
		if _G.IsAltKeyDown() then
			local min_val = ScrollBar:GetMinMaxValues()
			ScrollBar:SetValue(min_val)
		else
			ScrollBar_Scroll(1)
		end
	end)

	ScrollDownButton:SetScript("OnClick", function(self, button, down)
		if _G.IsAltKeyDown() then
			local _, max_val = ScrollBar:GetMinMaxValues()
			ScrollBar:SetValue(max_val)
		else
			ScrollBar_Scroll(-1)
		end
	end)

	ScrollBar:SetScript("OnMouseWheel", function(self, delta)
		ScrollBar_Scroll(delta)
	end)

	ListFrame:SetScript("OnMouseWheel", function(self, delta)
		ScrollBar_Scroll(delta)
	end)

	-- This can be called either from ListFrame's OnMouseWheel script, manually
	-- sliding the thumb, or from clicking the up/down buttons.
	ScrollBar:SetScript("OnValueChanged", function(self, value)
		local min_val, max_val = self:GetMinMaxValues()
		local current_tab = MainPanel.tabs[MainPanel.current_tab]
		local member = "profession_" .. MainPanel.profession .. "_scroll_value"

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
		local clicked_index = self.string_index

		-- Don't do anything if they've clicked on an empty button
		if not clicked_index or clicked_index == 0 then
			return
		end
		local clicked_line = ListFrame.entries[clicked_index]

		if not clicked_line then
			return
		end

		-- First, check if this is a "modified" click, and react appropriately
		if clicked_line.recipe_id and _G.IsModifierKeyDown() then
			local profession_recipes = private.profession_recipe_list[private.ORDERED_PROFESSIONS[MainPanel.profession]]

			if _G.IsControlKeyDown() then
				if _G.IsShiftKeyDown() then
					addon:AddWaypoint(clicked_line.recipe_id, clicked_line.acquire_id, clicked_line.location_id, clicked_line.npc_id)
				else
					local edit_box = _G.ChatEdit_ChooseBoxForSend()

					_G.ChatEdit_ActivateChat(edit_box)
					edit_box:Insert(_G.GetSpellLink(profession_recipes[clicked_line.recipe_id].spell_id))
				end
			elseif _G.IsShiftKeyDown() then
				local crafted_item_id = profession_recipes[clicked_line.recipe_id]:CraftedItemID()

				if crafted_item_id then
					local _, item_link = _G.GetItemInfo(crafted_item_id)

					if item_link then
						local edit_box = _G.ChatEdit_ChooseBoxForSend()

						_G.ChatEdit_ActivateChat(edit_box)
						edit_box:Insert(item_link)
					else
						addon:Print(L["NoItemLink"])
					end
				else
					addon:Print(L["NoItemLink"])
				end
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
				local check_type = clicked_line.type
				local removal_index = clicked_index + 1
				local entry = ListFrame.entries[removal_index]
				local current_tab = MainPanel.tabs[MainPanel.current_tab]

				-- get rid of our expanded lines
				while entry and entry.type ~= check_type do
					-- Headers are never removed.
					if entry.type == "header" then
						break
					end
					current_tab:ModifyEntry(entry, false)
					ReleaseTable(table.remove(ListFrame.entries, removal_index))
					entry = ListFrame.entries[removal_index]
				end
				current_tab:ModifyEntry(clicked_line, false)
				clicked_line.is_expanded = false
			else
				ListFrame:ExpandEntry(clicked_index)
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
				addon:Debug("Error: clicked_line (%s) has no parent.", clicked_line.type or _G.UNKNOWN)
			end
		end
		QTip:Release(acquire_tip)
		spell_tip:Hide()

		ListFrame:Update(nil, true)
	end

	-------------------------------------------------------------------------------
	-- The state and entry buttons and the container frames which hold them.
	-------------------------------------------------------------------------------
	ListFrame.entries = {}
	ListFrame.button_containers = {}
	ListFrame.state_buttons = {}
	ListFrame.entry_buttons = {}

	for index = 1, NUM_RECIPE_LINES do
		local cur_container = _G.CreateFrame("Frame", nil, ListFrame)

		cur_container:SetHeight(16)
		cur_container:SetWidth(LIST_ENTRY_WIDTH)

		local cur_state = _G.CreateFrame("Button", nil, ListFrame)
		cur_state:SetWidth(16)
		cur_state:SetHeight(16)

		local entry_name = ("%s_ListEntryButton%d"):format(FOLDER_NAME, index)
		local cur_entry = _G.CreateFrame("Button", entry_name, cur_container)
		cur_entry:SetWidth(LIST_ENTRY_WIDTH)
		cur_entry:SetHeight(16)

		local highlight_texture = cur_entry:CreateTexture(nil, "BORDER")
		highlight_texture:SetTexture([[Interface\ClassTrainerFrame\TrainerTextures]])
		highlight_texture:SetTexCoord(0.00195313, 0.57421875, 0.75390625, 0.84570313)
		highlight_texture:SetBlendMode("ADD")
		highlight_texture:SetPoint("TOPLEFT", 2, 0)
		highlight_texture:SetPoint("BOTTOMRIGHT", -2, 1)
		cur_entry:SetHighlightTexture(highlight_texture)

		local label = cur_entry:CreateFontString(nil, "ARTWORK")
		label:SetPoint("LEFT", cur_entry, "LEFT", 7, 0)
		label:SetPoint("RIGHT", cur_entry, "RIGHT", -7, 0)
		label:SetFontObject("GameFontNormalSmall")
		label:SetJustifyH("LEFT")
		label:SetJustifyV("CENTER")

		cur_entry:SetFontString(label)
		cur_entry.text = label

		if index == 1 then
			cur_container:SetPoint("TOPLEFT", ListFrame, "TOPLEFT", 0, -3)
			cur_state:SetPoint("LEFT", cur_container, "LEFT", 0, 0)
			cur_entry:SetPoint("LEFT", cur_state, "RIGHT", -3, 0)
		else
			cur_container:SetPoint("TOPLEFT", ListFrame.button_containers[index - 1], "BOTTOMLEFT", 0, 3)
			cur_state:SetPoint("LEFT", cur_container, "LEFT", 0, 0)
			cur_entry:SetPoint("LEFT", cur_state, "RIGHT", -3, 0)
		end
		cur_state.container = cur_container

		cur_state:SetScript("OnClick", ListItem_OnClick)
		cur_entry:SetScript("OnClick", ListItem_OnClick)

		ListFrame.button_containers[index] = cur_container
		ListFrame.state_buttons[index] = cur_state
		ListFrame.entry_buttons[index] = cur_entry
	end

	function ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, entry_expanded, expand_mode)
		entry.type = entry_type

		if parent_entry then
			if parent_entry ~= entry then
				local recipe_id = parent_entry.recipe_id
				local acquire_id = parent_entry.acquire_id
				local location_id = parent_entry.location_id
				local npc_id = parent_entry.npc_id

				-- These checks are necessary: Simply nilling fields will break things.
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

			MainPanel.tabs[MainPanel.current_tab]:ModifyEntry(entry, entry_expanded)

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

	-------------------------------------------------------------------------------
	-- Filter flag data and functions for ListFrame:Initialize()
	-------------------------------------------------------------------------------
	do
		local filter_db		= addon.db.profile.filters

		local binding_filters	= filter_db.binding
		local player_filters	= filter_db.player
		local armor_filters	= filter_db.item.armor
		local weapon_filters	= filter_db.item.weapon
		local obtain_filters	= filter_db.obtain
		local general_filters	= filter_db.general

		local V = private.GAME_VERSIONS
		local EXPANSION_FILTERS = {
			[V.ORIG]	= "expansion0",
			[V.TBC]		= "expansion1",
			[V.WOTLK]	= "expansion2",
			[V.CATA]	= "expansion3",
		}

		local Q = private.ITEM_QUALITIES
		local QUALITY_FILTERS = {
			[Q.COMMON]	= "common",
			[Q.UNCOMMON]	= "uncommon",
			[Q.RARE]	= "rare",
			[Q.EPIC]	= "epic",
		}

		-- HARD_FILTERS and SOFT_FILTERS are used to determine if a recipe should be shown based on the value of the key compared to the value
		-- of its saved_var.
		local ITEM1 = private.ITEM_FLAGS_WORD1
		local HARD_FILTERS = {
			------------------------------------------------------------------------------------------------
			-- Binding flags.
			------------------------------------------------------------------------------------------------
			["itemboe"]	= { flag = COMMON1.IBOE,	field = "common1",	sv_root = binding_filters },
			["itembop"]	= { flag = COMMON1.IBOP,	field = "common1",	sv_root = binding_filters },
			["itemboa"]	= { flag = COMMON1.IBOA,	field = "common1",	sv_root = binding_filters },
			["recipeboe"]	= { flag = COMMON1.RBOE,	field = "common1",	sv_root = binding_filters },
			["recipebop"]	= { flag = COMMON1.RBOP,	field = "common1",	sv_root = binding_filters },
			["recipeboa"]	= { flag = COMMON1.RBOA,	field = "common1",	sv_root = binding_filters },
			------------------------------------------------------------------------------------------------
			-- Player Type flags.
			------------------------------------------------------------------------------------------------
			["melee"]	= { flag = COMMON1.DPS,		field = "common1",	sv_root = player_filters },
			["tank"]	= { flag = COMMON1.TANK,	field = "common1",	sv_root = player_filters },
			["healer"]	= { flag = COMMON1.HEALER,	field = "common1",	sv_root = player_filters },
			["caster"]	= { flag = COMMON1.CASTER,	field = "common1",	sv_root = player_filters },
			------------------------------------------------------------------------------------------------
			-- Armor flags.
			------------------------------------------------------------------------------------------------
			["cloth"]	= { flag = ITEM1.CLOTH,		field = "item1",	sv_root = armor_filters },
			["leather"]	= { flag = ITEM1.LEATHER,	field = "item1",	sv_root = armor_filters },
			["mail"]	= { flag = ITEM1.MAIL,		field = "item1",	sv_root = armor_filters },
			["plate"]	= { flag = ITEM1.PLATE,		field = "item1",	sv_root = armor_filters },
			["trinket"]	= { flag = ITEM1.TRINKET,	field = "item1",	sv_root = armor_filters },
			["cloak"]	= { flag = ITEM1.CLOAK,		field = "item1",	sv_root = armor_filters },
			["ring"]	= { flag = ITEM1.RING,		field = "item1",	sv_root = armor_filters },
			["necklace"]	= { flag = ITEM1.NECK,		field = "item1",	sv_root = armor_filters },
			["shield"]	= { flag = ITEM1.SHIELD,	field = "item1",	sv_root = armor_filters },
			------------------------------------------------------------------------------------------------
			-- Weapon flags.
			------------------------------------------------------------------------------------------------
			["onehand"]	= { flag = ITEM1.ONE_HAND,	field = "item1",	sv_root = weapon_filters },
			["twohand"]	= { flag = ITEM1.TWO_HAND,	field = "item1",	sv_root = weapon_filters },
			["axe"]		= { flag = ITEM1.AXE,		field = "item1",	sv_root = weapon_filters },
			["sword"]	= { flag = ITEM1.SWORD,		field = "item1",	sv_root = weapon_filters },
			["mace"]	= { flag = ITEM1.MACE,		field = "item1",	sv_root = weapon_filters },
			["polearm"]	= { flag = ITEM1.POLEARM,	field = "item1",	sv_root = weapon_filters },
			["dagger"]	= { flag = ITEM1.DAGGER,	field = "item1",	sv_root = weapon_filters },
			["fist"]	= { flag = ITEM1.FIST,		field = "item1",	sv_root = weapon_filters },
			["gun"]		= { flag = ITEM1.GUN,		field = "item1",	sv_root = weapon_filters },
			["staff"]	= { flag = ITEM1.STAFF,		field = "item1",	sv_root = weapon_filters },
			["wand"]	= { flag = ITEM1.WAND,		field = "item1",	sv_root = weapon_filters },
			["thrown"]	= { flag = ITEM1.THROWN,	field = "item1",	sv_root = weapon_filters },
			["bow"]		= { flag = ITEM1.BOW,		field = "item1",	sv_root = weapon_filters },
			["crossbow"]	= { flag = ITEM1.XBOW,		field = "item1",	sv_root = weapon_filters },
		}

		local SOFT_FILTERS = {
			["trainer"]	= { flag = COMMON1.TRAINER,	field = "common1",	sv_root = obtain_filters },
			["vendor"]	= { flag = COMMON1.VENDOR,	field = "common1",	sv_root = obtain_filters },
			["instance"]	= { flag = COMMON1.INSTANCE,	field = "common1",	sv_root = obtain_filters },
			["raid"]	= { flag = COMMON1.RAID,	field = "common1",	sv_root = obtain_filters },
			["seasonal"]	= { flag = COMMON1.SEASONAL,	field = "common1",	sv_root = obtain_filters },
			["quest"]	= { flag = COMMON1.QUEST,	field = "common1",	sv_root = obtain_filters },
			["pvp"]		= { flag = COMMON1.PVP,		field = "common1",	sv_root = obtain_filters },
			["worlddrop"]	= { flag = COMMON1.WORLD_DROP,	field = "common1",	sv_root = obtain_filters },
			["mobdrop"]	= { flag = COMMON1.MOB_DROP,	field = "common1",	sv_root = obtain_filters },
			["discovery"]	= { flag = COMMON1.DISC,	field = "common1",	sv_root = obtain_filters },
			["achievement"]	= { flag = COMMON1.ACHIEVEMENT,	field = "common1",	sv_root = obtain_filters },
			["retired"]	= { flag = COMMON1.RETIRED,	field = "common1",	sv_root = general_filters },
		}

		local REP1 = private.REP_FLAGS_WORD1
		local REP_FILTERS = {
			[REP1.ARGENTDAWN]		= "argentdawn",
			[REP1.CENARION_CIRCLE]		= "cenarioncircle",
			[REP1.THORIUM_BROTHERHOOD]	= "thoriumbrotherhood",
			[REP1.TIMBERMAW_HOLD]		= "timbermaw",
			[REP1.ZANDALAR]			= "zandalar",
			[REP1.ALDOR]			= "aldor",
			[REP1.ASHTONGUE]		= "ashtonguedeathsworn",
			[REP1.CENARION_EXPEDITION]	= "cenarionexpedition",
			[REP1.HELLFIRE]			= "hellfire",
			[REP1.CONSORTIUM]		= "consortium",
			[REP1.KOT]			= "keepersoftime",
			[REP1.LOWERCITY]		= "lowercity",
			[REP1.NAGRAND]			= "nagrand",
			[REP1.SCALE_SANDS]		= "scaleofthesands",
			[REP1.SCRYER]			= "scryer",
			[REP1.SHATAR]			= "shatar",
			[REP1.SHATTEREDSUN]		= "shatteredsun",
			[REP1.SPOREGGAR]		= "sporeggar",
			[REP1.VIOLETEYE]		= "violeteye",
			[REP1.ARGENTCRUSADE]		= "argentcrusade",
			[REP1.FRENZYHEART]		= "frenzyheart",
			[REP1.EBONBLADE]		= "ebonblade",
			[REP1.KIRINTOR]			= "kirintor",
			[REP1.HODIR]			= "sonsofhodir",
			[REP1.KALUAK]			= "kaluak",
			[REP1.ORACLES]			= "oracles",
			[REP1.WYRMREST]			= "wyrmrest",
			[REP1.WRATHCOMMON1]		= "wrathcommon1",
			[REP1.WRATHCOMMON2]		= "wrathcommon2",
			[REP1.WRATHCOMMON3]		= "wrathcommon3",
			[REP1.WRATHCOMMON4]		= "wrathcommon4",
			[REP1.WRATHCOMMON5]		= "wrathcommon5",
		}

		local REP2 = private.REP_FLAGS_WORD2
		local REP_FILTERS_2 = {
			[REP2.ASHEN_VERDICT]		= "ashenverdict",
			[REP2.CATACOMMON1]		= "catacommon1",
			[REP2.CATACOMMON2]		= "catacommon2",
			[REP2.GUARDIANS]		= "guardiansofhyjal",
			[REP2.RAMKAHEN]			= "ramkahen",
			[REP2.EARTHEN_RING]		= "earthenring",
			[REP2.THERAZANE]		= "therazane",
		}

		local CLASS1 = private.CLASS_FLAGS_WORD1
		local CLASS_FILTERS = {
			["deathknight"]	= CLASS1.DK,
			["druid"]	= CLASS1.DRUID,
			["hunter"]	= CLASS1.HUNTER,
			["mage"]	= CLASS1.MAGE,
			["paladin"]	= CLASS1.PALADIN,
			["priest"]	= CLASS1.PRIEST,
			["shaman"]	= CLASS1.SHAMAN,
			["rogue"]	= CLASS1.ROGUE,
			["warlock"]	= CLASS1.WARLOCK,
			["warrior"]	= CLASS1.WARRIOR,
		}

		---Scans a specific recipe to determine if it is to be displayed or not.
		-- For flag info see comments at start of file in comments
		local function CanDisplayRecipe(recipe)
			if addon.db.profile.exclusionlist[recipe.spell_id] and not addon.db.profile.ignoreexclusionlist then
				return false
			end
			local general_filters = filter_db.general

			-------------------------------------------------------------------------------
			-- Stage 1 - Loop through exclusive flags (hard filters).
			-- If one of these does not pass, the recipe is not displayed.
			-------------------------------------------------------------------------------

			-- Display both horde and alliance factions?
			if not general_filters.faction and not private.Player:HasRecipeFaction(recipe) then
				return false
			end

			-- Display all skill levels?
			if not general_filters.skill and recipe.skill_level > private.current_profession_scanlevel then
				return false
			end

			-- Display all specialities?
			if not general_filters.specialty then
				local specialty = recipe.specialty

				if specialty and specialty ~= private.current_profession_specialty then
					return false
				end
			end

			-- Expansion filters.
			if not obtain_filters[EXPANSION_FILTERS[private.GAME_VERSIONS[recipe.genesis]]] then
				return false
			end

			-- Quality filters.
			if not filter_db.quality[QUALITY_FILTERS[recipe.quality]] then
				return false
			end

			-------------------------------------------------------------------------------
			-- Check the hard filter flags
			-------------------------------------------------------------------------------
			for filter, data in pairs(HARD_FILTERS) do
				local bitfield = recipe.flags[data.field]

				if bitfield and bit.band(bitfield, data.flag) == data.flag and not data.sv_root[filter] then
					return false
				end
			end

			-------------------------------------------------------------------------------
			-- Check the reputation filter flags - _all_ of the pertinent reputation or
			-- class flags must be toggled off or the recipe is still shown.
			-------------------------------------------------------------------------------
			local toggled_off, toggled_on = 0, 0

			for flag, name in pairs(REP_FILTERS) do
				local bitfield = recipe.flags.reputation1

				if bitfield and bit.band(bitfield, flag) == flag then
					if filter_db.rep[name] then
						toggled_on = toggled_on + 1
					else
						toggled_off = toggled_off + 1
					end
				end
			end

			if toggled_off > 0 and toggled_on == 0 then
				return false
			end
			toggled_off, toggled_on = 0, 0

			for flag, name in pairs(REP_FILTERS_2) do
				local bitfield = recipe.flags.reputation2

				if bitfield and bit.band(bitfield, flag) == flag then
					if filter_db.rep[name] then
						toggled_on = toggled_on + 1
					else
						toggled_off = toggled_off + 1
					end
				end
			end

			if toggled_off > 0 and toggled_on == 0 then
				return false
			end

			-------------------------------------------------------------------------------
			-- Check the class filter flags
			-------------------------------------------------------------------------------
			local class_filters = filter_db.classes

			toggled_off, toggled_on = 0, 0

			for class, flag in pairs(CLASS_FILTERS) do
				local bitfield = recipe.flags.class1

				if bitfield and bit.band(bitfield, flag) == flag then
					if class_filters[class] then
						toggled_on = toggled_on + 1
					else
						toggled_off = toggled_off + 1
					end
				end
			end

			if toggled_off > 0 and toggled_on == 0 then
				return false
			end

			------------------------------------------------------------------------------------------------
			-- Stage 2
			-- loop through nonexclusive (soft filters) flags until one is true
			-- If one of these is true (ie: we want to see trainers and there is a trainer flag) we display the recipe
			------------------------------------------------------------------------------------------------
			for filter, data in pairs(SOFT_FILTERS) do
				local bitfield = recipe.flags[data.field]

				if bitfield and bit.band(bitfield, data.flag) == data.flag and data.sv_root[filter] then
					return true
				end
			end

			-- If we get here it means that no flags matched our values
			return false
		end

		function ListFrame:Initialize(expand_mode)
			for i = 1, #self.entries do
				ReleaseTable(self.entries[i])
			end
			table.wipe(self.entries)

			-------------------------------------------------------------------------------
			-- Update recipe filters.
			-------------------------------------------------------------------------------
			local general_filters = addon.db.profile.filters.general
			local profession_recipes = private.profession_recipe_list[private.ORDERED_PROFESSIONS[MainPanel.profession]]
			local recipes_known, recipes_known_filtered = 0, 0
			local recipes_total, recipes_total_filtered = 0, 0

			for recipe_id, recipe in pairs(profession_recipes) do
				local can_display = false
				recipe:RemoveState("VISIBLE")

				if not recipe.is_ignored then
					recipes_total = recipes_total + 1

					local is_known

					if MainPanel.is_linked then
						is_known = recipe:HasState("LINKED")
					else
						is_known = recipe:HasState("KNOWN")
					end
					recipes_known = recipes_known + (is_known and 1 or 0)

					can_display = CanDisplayRecipe(recipe)

					if can_display then
						recipes_total_filtered = recipes_total_filtered + 1
						recipes_known_filtered = recipes_known_filtered + (is_known and 1 or 0)

						if not general_filters.known and is_known then
							can_display = false
						end

						if not general_filters.unknown and not is_known then
							can_display = false
						end
					end
				end

				if can_display then
					recipe:AddState("VISIBLE")
				end
			end
			local player = private.Player
			player.recipes_total = recipes_total
			player.recipes_known = recipes_known
			player.recipes_total_filtered = recipes_total_filtered
			player.recipes_known_filtered = recipes_known_filtered

			-------------------------------------------------------------------------------
			-- Mark all exclusions in the recipe database to not be displayed, and update
			-- the player's known and unknown counts.
			-------------------------------------------------------------------------------
			local known_count = 0
			local unknown_count = 0

			for spell_id in pairs(addon.db.profile.exclusionlist) do
				local recipe = profession_recipes[spell_id]

				if recipe then
					if recipe:HasState("KNOWN") then
						known_count = known_count + 1
					else
						unknown_count = unknown_count + 1
					end
				end
			end
			player.excluded_recipes_known = known_count
			player.excluded_recipes_unknown = unknown_count

			-------------------------------------------------------------------------------
			-- Initialize the expand button and entries for the current tab.
			-------------------------------------------------------------------------------
			local current_tab = MainPanel.tabs[addon.db.profile.current_tab]
			local expanded_button = current_tab["expand_button_"..MainPanel.profession]

			if expanded_button then
				MainPanel.expand_button:Expand(current_tab)
			else
				MainPanel.expand_button:Contract(current_tab)
			end
			local recipe_count = current_tab:Initialize(expand_mode)

			-------------------------------------------------------------------------------
			-- Update the progress bar display.
			-------------------------------------------------------------------------------
			local profile = addon.db.profile
			local max_value = profile.includefiltered and player.recipes_total or (player.recipes_total_filtered + (player.recipes_known - player.recipes_known_filtered))
			local cur_value = player.recipes_known	-- Current value will always be what we know regardless of filters.

			if not profile.includeexcluded and not profile.ignoreexclusionlist then
				max_value = max_value - player.excluded_recipes_known
			end
			local progress_bar = MainPanel.progress_bar

			progress_bar:SetMinMaxValues(0, max_value)
			progress_bar:SetValue(cur_value)

			local percentage = cur_value / max_value * 100

			if (math.floor(percentage) < 101) and cur_value >= 0 and max_value >= 0 then
				local results = _G.SINGLE_PAGE_RESULTS_TEMPLATE:format(recipe_count)
				progress_bar.text:SetFormattedText("%d/%d - %1.2f%% (%s)", cur_value, max_value, percentage, results)
			else
				progress_bar.text:SetFormattedText("%s", L["NOT_YET_SCANNED"])
			end
		end
	end	-- do-block

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
			entry:SetWidth(LIST_ENTRY_WIDTH)
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
			MainPanel.expand_button:SetNormalFontObject("GameFontDisableSmall")
			MainPanel.expand_button:Disable()
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
			local editbox_text = MainPanel.search_editbox:GetText()
			local player = private.Player

			if player.recipes_total == 0 then
				if showpopup then
					Dialog:Spawn("ARL_NotScanned")
				end
			elseif player.recipes_known == player.recipes_total then
				if showpopup then
					Dialog:Spawn("ARL_AllKnown")
				end
			elseif (player.recipes_total_filtered - player.recipes_known_filtered) == 0 then
				if showpopup then
					Dialog:Spawn("ARL_AllFiltered")
				end
			elseif player.excluded_recipes_unknown ~= 0 then
				if showpopup then
					Dialog:Spawn("ARL_AllExcluded")
				end
			elseif editbox_text ~= "" and editbox_text ~= _G.SEARCH then
				Dialog:Spawn("ARL_SearchFiltered")
			else
				addon:Print(L["NO_DISPLAY"])
				addon:Debug("Current tab is %s", _G.tostring(addon.db.profile.current_tab))
				addon:Debug("recipes_total check for 0")
				addon:Debug("recipes_total: " .. player.recipes_total)
				addon:Debug("recipes_total check for equal to recipes_total")
				addon:Debug("recipes_known: " .. player.recipes_known)
				addon:Debug("recipes_total: " .. player.recipes_total)
				addon:Debug("recipes_total_filtered - recipes_known_filtered = 0")
				addon:Debug("recipes_total_filtered: " .. player.recipes_total_filtered)
				addon:Debug("recipes_known_filtered: " .. player.recipes_known_filtered)
				addon:Debug("excluded_recipes_unknown ~= 0")
				addon:Debug("excluded_recipes_unknown: " .. player.excluded_recipes_unknown)
			end
			return
		end
		local offset = 0

		private.DismissDialogs()

		MainPanel.expand_button:SetNormalFontObject("GameFontNormalSmall")
		MainPanel.expand_button:Enable()

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
					cur_state:SetNormalTexture([[Interface\MINIMAP\UI-Minimap-ZoomOutButton-Up]])
					cur_state:SetPushedTexture([[Interface\MINIMAP\UI-Minimap-ZoomOutButton-Down]])
					cur_state:SetHighlightTexture([[Interface\MINIMAP\UI-Minimap-ZoomButton-Highlight]])
				else
					cur_state:SetNormalTexture([[Interface\MINIMAP\UI-Minimap-ZoomInButton-Up]])
					cur_state:SetPushedTexture([[Interface\MINIMAP\UI-Minimap-ZoomInButton-Down]])
					cur_state:SetHighlightTexture([[Interface\MINIMAP\UI-Minimap-ZoomButton-Highlight]])
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
				cur_button:SetWidth(LIST_ENTRY_WIDTH - 15)
			end
			cur_button.string_index = string_index
			cur_button:SetText(cur_entry.text)
			cur_button:SetScript("OnEnter", Bar_OnEnter)
			cur_button:SetScript("OnLeave", Bar_OnLeave)
			cur_button:Enable()

			-- This function could possibly have been called from a mouse click or by scrolling. Since, in those cases, the list entries have
			-- changed, the mouse is likely over a different entry - a tooltip should be generated for it.
			if cur_state:IsMouseOver() then
				Button_OnEnter(cur_state)
			elseif cur_button:IsMouseOver() then
				Bar_OnEnter(cur_button)
			end
			button_index = button_index + 1
			string_index = string_index + 1
		end
	end

	-------------------------------------------------------------------------------
	-- Functions and data pertaining to individual list entries.
	-------------------------------------------------------------------------------
	local function CanDisplayFaction(faction)
		if addon.db.profile.filters.general.faction then
			return true
		end
		return (not faction or faction == private.Player.faction or faction == "Neutral")
	end

	-- Padding for list entries/subentries
	local PADDING = "    "

	-- Changes the color of "name" based on faction type.
	local function ColorNameByFaction(name, faction)
		if faction == "Neutral" then
			name = SetTextColor(private.REPUTATION_COLORS["neutral"], name)
		elseif faction == private.Player.faction then
			name = SetTextColor(private.REPUTATION_COLORS["exalted"], name)
		else
			name = SetTextColor(private.REPUTATION_COLORS["hated"], name)
		end
		return name
	end

	local function ExpandTrainerData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local trainer = private.trainer_list[id_num]

		if not trainer or not CanDisplayFaction(trainer.faction) then
			return entry_index
		end

		local name = ColorNameByFaction(trainer.name, trainer.faction)
		local coord_text = ""

		if trainer.coord_x ~= 0 and trainer.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], COORD_FORMAT:format(trainer.coord_x, trainer.coord_y))
		end
		local entry = AcquireTable()

		entry.text = ("%s%s %s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["trainer"], L["Trainer"]) .. ":", name)
		entry.recipe_id = recipe_id
		entry.npc_id = id_num

		entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		entry = AcquireTable()
		entry.text = ("%s%s%s %s"):format(PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], trainer.location), coord_text)
		entry.recipe_id = recipe_id
		entry.npc_id = id_num

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
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
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], COORD_FORMAT:format(vendor.coord_x, vendor.coord_y))
		end
		local entry = AcquireTable()
		local quantity = vendor.item_list[recipe_id]

		entry.text = ("%s%s %s%s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["vendor"], L["Vendor"]) .. ":", name, type(quantity) == "number" and SetTextColor(BASIC_COLORS["white"], (" (%d)"):format(quantity)) or "")
		entry.recipe_id = recipe_id
		entry.npc_id = id_num

		entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		entry = AcquireTable()
		entry.text = ("%s%s%s %s"):format(PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], vendor.location), coord_text)
		entry.recipe_id = recipe_id
		entry.npc_id = id_num

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	-- Mobs can be in instances, raids, or specific mob related drops.
	local function ExpandMobData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local mob = private.mob_list[id_num]
		local coord_text = ""

		if mob.coord_x ~= 0 and mob.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], COORD_FORMAT:format(mob.coord_x, mob.coord_y))
		end
		local entry = AcquireTable()

		entry.text = ("%s%s %s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["mobdrop"], L["Mob Drop"]) .. ":", SetTextColor(private.REPUTATION_COLORS["hostile"], mob.name))
		entry.recipe_id = recipe_id
		entry.npc_id = id_num

		entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		entry = AcquireTable()
		entry.text = ("%s%s%s %s"):format(PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], mob.location), coord_text)
		entry.recipe_id = recipe_id
		entry.npc_id = id_num

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandQuestData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local quest = private.quest_list[id_num]

		if not CanDisplayFaction(quest.faction) then
			return entry_index
		end

		local name = ColorNameByFaction(private.quest_names[id_num], quest.faction)
		local coord_text = ""

		if quest.coord_x ~= 0 and quest.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], COORD_FORMAT:format(quest.coord_x, quest.coord_y))
		end
		local entry = AcquireTable()
		entry.text = ("%s%s %s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["quest"], L["Quest"]) .. ":", name)
		entry.recipe_id = recipe_id

		entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)

		if coord_text == "" and hide_location then
			return entry_index
		end
		entry = AcquireTable()
		entry.text = ("%s%s%s %s"):format(PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], quest.location), coord_text)
		entry.recipe_id = recipe_id

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandSeasonalData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local entry = AcquireTable()
		entry.text = ("%s%s %s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["seasonal"], private.ACQUIRE_NAMES[A.SEASONAL]) .. ":", SetTextColor(CATEGORY_COLORS["seasonal"], private.seasonal_list[id_num].name))
		entry.recipe_id = recipe_id
		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local FACTION_LABELS

	local function ExpandReputationData(entry_index, entry_type, parent_entry, vendor_id, rep_id, rep_level, recipe_id, hide_location, hide_type)
		local rep_vendor = private.vendor_list[vendor_id]

		if not CanDisplayFaction(rep_vendor.faction) then
			return entry_index
		end

		if not FACTION_LABELS then
			local rep_color = private.REPUTATION_COLORS

			FACTION_LABELS = {
				[0] = SetTextColor(rep_color["neutral"], BFAC["Neutral"] .. " : "),
				[1] = SetTextColor(rep_color["friendly"], BFAC["Friendly"] .. " : "),
				[2] = SetTextColor(rep_color["honored"], BFAC["Honored"] .. " : "),
				[3] = SetTextColor(rep_color["revered"], BFAC["Revered"] .. " : "),
				[4] = SetTextColor(rep_color["exalted"], BFAC["Exalted"] .. " : ")
			}
		end

		local name = ColorNameByFaction(rep_vendor.name, rep_vendor.faction)
		local entry = AcquireTable()
		entry.text = ("%s%s %s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["reputation"], _G.REPUTATION) .. ":", SetTextColor(CATEGORY_COLORS["repname"], private.reputation_list[rep_id].name))
		entry.recipe_id = recipe_id
		entry.npc_id = vendor_id

		entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)

		entry = AcquireTable()
		entry.text = PADDING .. PADDING .. FACTION_LABELS[rep_level] .. name
		entry.recipe_id = recipe_id
		entry.npc_id = vendor_id

		entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)

		local coord_text = ""

		if rep_vendor.coord_x ~= 0 and rep_vendor.coord_y ~= 0 then
			coord_text = SetTextColor(CATEGORY_COLORS["coords"], COORD_FORMAT:format(rep_vendor.coord_x, rep_vendor.coord_y))
		end

		if coord_text == "" and hide_location then
			return entry_index
		end
		entry = AcquireTable()
		entry.text = ("%s%s%s%s %s"):format(PADDING, PADDING, PADDING, hide_location and "" or SetTextColor(CATEGORY_COLORS["location"], rep_vendor.location), coord_text)
		entry.recipe_id = recipe_id
		entry.npc_id = vendor_id

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandWorldDropData(entry_index, entry_type, parent_entry, identifier, recipe_id, hide_location, hide_type)
		local drop_location = type(identifier) == "string" and SetTextColor(CATEGORY_COLORS["location"], BZ[identifier])

		if drop_location then
			local recipe_item_id = private.recipe_list[recipe_id]:RecipeItemID()
			local recipe_item_level = recipe_item_id and select(4, _G.GetItemInfo(recipe_item_id))

			if recipe_item_level then
				drop_location = (": %s %s"):format(drop_location, SetTextColor(CATEGORY_COLORS["location"], "(%d - %d)"):format(recipe_item_level - 5, recipe_item_level + 5))
			else
				drop_location = (": %s"):format(drop_location)
			end
		else
			drop_location = ""
		end
		local entry = AcquireTable()
		entry.text = ("%s|c%s%s|r%s"):format(PADDING, select(4, _G.GetItemQualityColor(private.recipe_list[recipe_id].quality)), L["World Drop"], drop_location)
		entry.recipe_id = recipe_id

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandCustomData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local entry = AcquireTable()
		entry.text = PADDING .. SetTextColor(CATEGORY_COLORS["custom"], private.custom_list[id_num].name)
		entry.recipe_id = recipe_id

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandDiscoveryData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local entry = AcquireTable()
		entry.text = PADDING .. SetTextColor(CATEGORY_COLORS["discovery"], private.discovery_list[id_num].name)
		entry.recipe_id = recipe_id

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandAchievementData(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
		local entry = AcquireTable()
		entry.text = ("%s%s %s"):format(PADDING, hide_type and "" or SetTextColor(CATEGORY_COLORS["achievement"], _G.ACHIEVEMENTS) .. ":",
					    SetTextColor(BASIC_COLORS["normal"], select(2, _G.GetAchievementInfo(id_num))))
		entry.recipe_id = recipe_id

		return ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
	end

	local function ExpandAcquireData(entry_index, entry_type, parent_entry, acquire_type, acquire_data, recipe_id, hide_location, hide_type)
		local obtain_filters = addon.db.profile.filters.obtain
		local num_acquire_types = #private.ACQUIRE_STRINGS

		for id_num, info in pairs(acquire_data) do
			local func

			if acquire_type == A.TRAINER and obtain_filters.trainer then
				func = ExpandTrainerData
			elseif acquire_type == A.VENDOR and (obtain_filters.vendor or obtain_filters.pvp) then
				func = ExpandVendorData
			elseif acquire_type == A.MOB_DROP and (obtain_filters.mobdrop or obtain_filters.instance or obtain_filters.raid) then
				func = ExpandMobData
			elseif acquire_type == A.QUEST and obtain_filters.quest then
				func = ExpandQuestData
			elseif acquire_type == A.SEASONAL and obtain_filters.seasonal then
				func = ExpandSeasonalData
			elseif acquire_type == A.REPUTATION then
				for rep_level, level_info in pairs(info) do
					for vendor_id in pairs(level_info) do
						entry_index =  ExpandReputationData(entry_index, entry_type, parent_entry, vendor_id, id_num,
										    rep_level, recipe_id, hide_location, hide_type)
					end
				end
			elseif acquire_type == A.WORLD_DROP and obtain_filters.worlddrop then
				if not hide_type then
					func = ExpandWorldDropData
				end
			elseif acquire_type == A.CUSTOM then
				if not hide_type then
					func = ExpandCustomData
				end
			elseif acquire_type == A.DISCOVERY then
				if not hide_type then
					func = ExpandDiscoveryData
				end
				--@alpha@
			elseif acquire_type == A.ACHIEVEMENT and obtain_filters.achievement then
				func = ExpandAchievementData
			elseif acquire_type > num_acquire_types then
				local entry = AcquireTable()
				entry.text = "Unhandled Acquire Case - Type: " .. acquire_type
				entry.recipe_id = recipe_id

				entry_index = ListFrame:InsertEntry(entry, parent_entry, entry_index, entry_type, true)
				--@end-alpha@
			end

			if func then
				entry_index = func(entry_index, entry_type, parent_entry, id_num, recipe_id, hide_location, hide_type)
			end
		end	-- for
		return entry_index
	end

	-- This function is called when an un-expanded entry in the list has been clicked.
	function ListFrame:ExpandEntry(entry_index, expand_mode)
		local orig_index = entry_index
		local current_entry = self.entries[orig_index]
		local expand_all = expand_mode == "deep"
		local current_tab = MainPanel.tabs[MainPanel.current_tab]
		local prof_name = private.ORDERED_PROFESSIONS[MainPanel.profession]
		local profession_recipes = private.profession_recipe_list[prof_name]

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

				private.SortRecipeList(recipe_list)

				for index = 1, #sorted_recipes do
					local spell_id = sorted_recipes[index]
					local recipe_entry = profession_recipes[spell_id]

					if recipe_entry:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe_entry) then
						local entry = AcquireTable()
						local expand = false
						local type = "subheader"

						if acquire_id == A.WORLD_DROP or acquire_id == A.CUSTOM or acquire_id == A.ACHIEVEMENT or acquire_id == A.DISCOVERY then
							expand = true
							type = "entry"
						end
						local is_expanded = (current_tab[prof_name.." expanded"][spell_id]
								     and current_tab[prof_name.." expanded"][private.ACQUIRE_NAMES[acquire_id]])

						entry.text = recipe_entry:GetDisplayName()
						entry.recipe_id = spell_id
						entry.acquire_id = acquire_id

						entry_index = self:InsertEntry(entry, current_entry, entry_index, type, expand or is_expanded,
									       expand_all or is_expanded)
					end
				end
			elseif current_entry.type == "subheader" then
				for acquire_type, acquire_data in pairs(profession_recipes[current_entry.recipe_id].acquire_data) do
					if acquire_type == acquire_id then
						entry_index = ExpandAcquireData(entry_index, "subentry", current_entry, acquire_type, acquire_data,
										current_entry.recipe_id, false, true)
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

				private.SortRecipeList(recipe_list)

				for index = 1, #sorted_recipes do
					local spell_id = sorted_recipes[index]
					local recipe_entry = profession_recipes[spell_id]

					if recipe_entry:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe_entry) then
						local expand = false
						local type = "subheader"
						local entry = AcquireTable()

						-- Add World Drop entries as normal entries.
						if recipe_list[spell_id] == "world_drop" then
							expand = true
							type = "entry"
						end
						local is_expanded = (current_tab[prof_name.." expanded"][spell_id]
								     and current_tab[prof_name.." expanded"][location_id])

						entry.text = recipe_entry:GetDisplayName()
						entry.recipe_id = spell_id
						entry.location_id = location_id

						entry_index = self:InsertEntry(entry, current_entry, entry_index, type, expand or is_expanded,
									       expand_all or is_expanded)
					end
				end
			elseif current_entry.type == "subheader" then
				local recipe_entry = profession_recipes[current_entry.recipe_id]

				-- World Drops are not handled here because they are of type "entry".
				for acquire_type, acquire_data in pairs(recipe_entry.acquire_data) do
					-- Only expand an acquisition entry if it is from this location.
					for id_num, info in pairs(acquire_data) do
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
							-- Hide the acquire type for this - it will already show up in the location list as
							-- "World Events".
							entry_index = ExpandSeasonalData(entry_index, "subentry", current_entry,
											 id_num, current_entry.recipe_id, true, true)
						elseif acquire_type == A.CUSTOM and private.custom_list[id_num].location == location_id then
							entry_index = ExpandCustomData(entry_index, "subentry", current_entry,
										       id_num, current_entry.recipe_id, true, true)
						elseif acquire_type == A.DISCOVERY and private.discovery_list[id_num].location == location_id then
							entry_index = ExpandDiscoveryData(entry_index, "subentry", current_entry,
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

		for acquire_type, acquire_data in pairs(profession_recipes[recipe_id].acquire_data) do
			entry_index = ExpandAcquireData(entry_index, "entry", current_entry, acquire_type, acquire_data, recipe_id)
		end
		return entry_index
	end
end	-- InitializeListFrame()

-------------------------------------------------------------------------------
-- Tooltip functions and data.
-------------------------------------------------------------------------------
spell_tip = _G.CreateFrame("GameTooltip", "AckisRecipeList_SpellTooltip", _G.UIParent, "GameTooltipTemplate")

-- Font Objects needed for acquire_tip
local narrowFont
local normalFont

do
	local LSM3 = LibStub("LibSharedMedia-3.0", true)

	if LSM3 then
		narrowFont = LSM3:Fetch(LSM3.MediaType.FONT, "Arial Narrow")
		normalFont = LSM3:Fetch(LSM3.MediaType.FONT, "Friz Quadrata TT")
	else
		-- Fix for font issues on koKR
		if _G.GetLocale() == "koKR" then
			narrowFont = "Fonts\\2002.TTF"
			normalFont = "Fonts\\2002.TTF"
		else
			narrowFont = "Fonts\\ARIALN.TTF"
			normalFont = "Fonts\\FRIZQT__.TTF"
		end
	end
	local narrowFontObj = _G.CreateFont(("%s%s"):format(private.addon_name, "narrowFontObj"))
	local normalFontObj = _G.CreateFont(("%s%s"):format(private.addon_name, "normalFontObj"))

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

	local function GetTipFactionInfo(comp_faction)
		local display_tip
		local color

		if comp_faction == "Neutral" then
			color = private.REPUTATION_COLORS["neutral"]
			display_tip = true
		elseif comp_faction == private.Player.faction then
			color = private.REPUTATION_COLORS["exalted"]
			display_tip = true
		else
			color = private.REPUTATION_COLORS["hated"]
			display_tip = addon.db.profile.filters.general.faction
		end
		return display_tip, color
	end

	-------------------------------------------------------------------------------
	-- Functions for adding individual acquire type data to the tooltip.
	-------------------------------------------------------------------------------
	local TOOLTIP_ACQUIRE_FUNCS = {
		[A.TRAINER] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local trainer = private.trainer_list[identifier]

			if not trainer or (location and trainer.location ~= location) then
				return
			end
			local display_tip, name_color = GetTipFactionInfo(trainer.faction)

			if not display_tip then
				return
			end
			addline_func(0, -2, false, L["Trainer"], CATEGORY_COLORS["trainer"], trainer.name, name_color)

			if trainer.coord_x ~= 0 and trainer.coord_y ~= 0 then
				addline_func(1, -2, true, trainer.location, CATEGORY_COLORS["location"], COORD_FORMAT:format(trainer.coord_x, trainer.coord_y), CATEGORY_COLORS["coords"])
			else
				addline_func(1, -2, true, trainer.location, CATEGORY_COLORS["location"], "", CATEGORY_COLORS["coords"])
			end
		end,
		[A.VENDOR] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local vendor = private.vendor_list[identifier]

			if not vendor or (location and vendor.location ~= location) then
				return
			end
			local display_tip, name_color = GetTipFactionInfo(vendor.faction)

			if not display_tip then
				return
			end
			addline_func(0, -1, false, L["Vendor"], CATEGORY_COLORS["vendor"], vendor.name, name_color)

			if vendor.coord_x ~= 0 and vendor.coord_y ~= 0 then
				addline_func(1, -2, true, vendor.location, CATEGORY_COLORS["location"], COORD_FORMAT:format(vendor.coord_x, vendor.coord_y), CATEGORY_COLORS["coords"])
			else
				addline_func(1, -2, true, vendor.location, CATEGORY_COLORS["location"], "", CATEGORY_COLORS["coords"])
			end
			local quantity = vendor.item_list[recipe_id]

			if type(quantity) == "number" then
				addline_func(2, -2, true, L["LIMITED_SUPPLY"], CATEGORY_COLORS["vendor"], ("(%d)"):format(quantity), BASIC_COLORS["white"])
			end
		end,
		[A.MOB_DROP] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local mob = private.mob_list[identifier]

			if not mob or (location and mob.location ~= location) then
				return
			end
			addline_func(0, -1, false, L["Mob Drop"], CATEGORY_COLORS["mobdrop"], mob.name, private.REPUTATION_COLORS["hostile"])

			if mob.coord_x ~= 0 and mob.coord_y ~= 0 then
				addline_func(1, -2, true, mob.location, CATEGORY_COLORS["location"], COORD_FORMAT:format(mob.coord_x, mob.coord_y), CATEGORY_COLORS["coords"])
			else
				addline_func(1, -2, true, mob.location, CATEGORY_COLORS["location"], "", CATEGORY_COLORS["coords"])

			end
		end,
		[A.QUEST] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local quest = private.quest_list[identifier]

			if not quest or (location and quest.location ~= location) then
				return
			end
			local display_tip, name_color = GetTipFactionInfo(quest.faction)

			if not display_tip then
				return
			end
			addline_func(0, -1, false, L["Quest"], CATEGORY_COLORS["quest"], private.quest_names[identifier], name_color)

			if quest.coord_x ~= 0 and quest.coord_y ~= 0 then
				addline_func(1, -2, true, quest.location, CATEGORY_COLORS["location"], COORD_FORMAT:format(quest.coord_x, quest.coord_y), CATEGORY_COLORS["coords"])
			else
				addline_func(1, -2, true, quest.location, CATEGORY_COLORS["location"], "", CATEGORY_COLORS["coords"])
			end
		end,
		[A.SEASONAL] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local hex_color = CATEGORY_COLORS["seasonal"]
			addline_func(0, -1, 0, private.ACQUIRE_NAMES[A.SEASONAL], hex_color, private.seasonal_list[identifier].name, hex_color)
		end,
		[A.REPUTATION] = function(recipe_id, identifier, location, acquire_info, addline_func)
			for rep_level, level_info in pairs(acquire_info) do
				for vendor_id in pairs(level_info) do
					local rep_vendor = private.vendor_list[vendor_id]

					if rep_vendor and (not location or rep_vendor.location == location) then
						local display_tip, name_color = GetTipFactionInfo(rep_vendor.faction)

						if display_tip then
							addline_func(0, -1, false, _G.REPUTATION, CATEGORY_COLORS["reputation"], private.reputation_list[identifier].name, CATEGORY_COLORS["repname"])

							if rep_level == 0 then
								addline_func(1, -2, false, BFAC["Neutral"], private.REPUTATION_COLORS["neutral"], rep_vendor.name, name_color)
							elseif rep_level == 1 then
								addline_func(1, -2, false, BFAC["Friendly"], private.REPUTATION_COLORS["friendly"], rep_vendor.name, name_color)
							elseif rep_level == 2 then
								addline_func(1, -2, false, BFAC["Honored"], private.REPUTATION_COLORS["honored"], rep_vendor.name, name_color)
							elseif rep_level == 3 then
								addline_func(1, -2, false, BFAC["Revered"], private.REPUTATION_COLORS["revered"], rep_vendor.name, name_color)
							else
								addline_func(1, -2, false, BFAC["Exalted"], private.REPUTATION_COLORS["exalted"], rep_vendor.name, name_color)
							end

							if rep_vendor.coord_x ~= 0 and rep_vendor.coord_y ~= 0 then
								addline_func(2, -2, true, rep_vendor.location, CATEGORY_COLORS["location"], COORD_FORMAT:format(rep_vendor.coord_x, rep_vendor.coord_y), CATEGORY_COLORS["coords"])
							else
								addline_func(2, -2, true, rep_vendor.location, CATEGORY_COLORS["location"], "", CATEGORY_COLORS["coords"])
							end
						end
					end
				end
			end
		end,
		[A.WORLD_DROP] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local drop_location = type(identifier) == "string" and BZ[identifier] or _G.UNKNOWN

			if location and drop_location ~= location then
				return
			end
			local recipe = private.recipe_list[recipe_id]
			local recipe_item_id = recipe:RecipeItemID()
			local recipe_item_level = recipe_item_id and select(4, _G.GetItemInfo(recipe_item_id))
			local quality_color = select(4, _G.GetItemQualityColor(recipe.quality)):sub(3)
			local location_text

			if recipe_item_level then
				location_text = ("%s (%d - %d)"):format(drop_location, recipe_item_level - 5, recipe_item_level + 5)
			else
				location_text = drop_location
			end
			addline_func(0, -1, false, L["World Drop"], quality_color, location_text, CATEGORY_COLORS["location"])
		end,
		[A.ACHIEVEMENT] = function(recipe_id, identifier, location, acquire_info, addline_func)
			local recipe = private.recipe_list[recipe_id]
			local _, achievement_name, _, _, _, _, _, achievement_desc = _G.GetAchievementInfo(identifier)

			-- The recipe is an actual reward from an achievement if flagged - else we're just using the text to describe how to get it.
			if recipe:HasFilter("common1", "ACHIEVEMENT") then
				addline_func(0, -1, false, _G.ACHIEVEMENTS, CATEGORY_COLORS["achievement"], achievement_name, BASIC_COLORS["normal"])
			end
			addline_func(0, -1, false, achievement_desc, CATEGORY_COLORS["achievement"])
		end,
		[A.DISCOVERY] = function(recipe_id, identifier, location, acquire_info, addline_func)
			addline_func(0, -1, false, private.discovery_list[identifier].name, CATEGORY_COLORS["discovery"])
		end,
		[A.CUSTOM] = function(recipe_id, identifier, location, acquire_info, addline_func)
			addline_func(0, -1, false, private.custom_list[identifier].name, CATEGORY_COLORS["custom"])
		end,
	}

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
			if not acquire_id or acquire_type == acquire_id then
				local populate_func = TOOLTIP_ACQUIRE_FUNCS[acquire_type]

				for identifier, info in pairs(acquire_data) do
					if populate_func then
						populate_func(recipe_id, identifier, location, info, addline_func)
					else
						addline_func(0, -1, 0, L["Unhandled Recipe"], BASIC_COLORS["normal"])
					end
				end
			end
		end
	end

	-------------------------------------------------------------------------------
	-- Main tooltip function.
	-------------------------------------------------------------------------------
	local function InitSpellTooltip(owner, loc, link)
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
		spell_tip:SetBackdrop(_G.GameTooltip:GetBackdrop())
		spell_tip:SetBackdropColor(_G.GameTooltip:GetBackdropColor())
		spell_tip:SetBackdropBorderColor(_G.GameTooltip:GetBackdropBorderColor())
		spell_tip:SetScale(addon.db.profile.tooltip.scale)
		spell_tip:SetClampedToScreen(true)
		spell_tip:SetHyperlink(link)
		spell_tip:Show()
	end

	local function InitializeTooltips(spell_id)
		local spell_tip_anchor = addon.db.profile.spelltooltiplocation
		local acquire_tip_anchor = addon.db.profile.acquiretooltiplocation
		local spell_link = _G.GetSpellLink(spell_id)
		local MainPanel = addon.Frame

		if acquire_tip_anchor == _G.OFF then
			QTip:Release(acquire_tip)

			-- If we have the spell link tooltip, anchor it to MainPanel instead so it shows
			if spell_tip_anchor == _G.OFF then
				spell_tip:Hide()
			elseif spell_link then
				InitSpellTooltip(MainPanel, spell_tip_anchor, spell_link)
			end
			return
		end
		acquire_tip = QTip:Acquire(private.addon_name.." Tooltip", 2, "LEFT", "LEFT")
		acquire_tip:ClearAllPoints()
		acquire_tip:SetClampedToScreen(true)
		acquire_tip:Clear()
		acquire_tip:SetScale(addon.db.profile.tooltip.scale)

		if _G.TipTac and _G.TipTac.AddModifiedTip then
			-- Pass true as second parameter because hooking OnHide causes C stack overflows -Torhal
			_G.TipTac:AddModifiedTip(acquire_tip, true)
		end

		if acquire_tip_anchor == "Right" then
			acquire_tip:SetPoint("TOPLEFT", MainPanel, "TOPRIGHT", MainPanel.is_expanded and -90 or -35, 0)
		elseif acquire_tip_anchor == "Left" then
			acquire_tip:SetPoint("TOPRIGHT", MainPanel, "TOPLEFT")
		elseif acquire_tip_anchor == "Top" then
			acquire_tip:SetPoint("BOTTOMLEFT", MainPanel, "TOPLEFT")
		elseif acquire_tip_anchor == "Bottom" then
			acquire_tip:SetPoint("TOPLEFT", MainPanel, "BOTTOMLEFT", 0, 55)
		elseif acquire_tip_anchor == "Mouse" then
			local x, y = _G.GetCursorPosition()
			local uiscale = _G.UIParent:GetEffectiveScale()

			acquire_tip:SetPoint("BOTTOMLEFT", _G.UIParent, "BOTTOMLEFT", x / uiscale, y / uiscale)
		end

		-- If we have the spell link tooltip, link it to the acquire tooltip.
		if spell_tip_anchor == _G.OFF then
			spell_tip:Hide()
		elseif spell_link then
			InitSpellTooltip(acquire_tip, spell_tip_anchor, spell_link)
		end
	end

	local BINDING_FLAGS = {
		[COMMON1.IBOE] = L["BOEFilter"],
		[COMMON1.IBOP] = L["BOPFilter"],
		[COMMON1.IBOA] = L["BOAFilter"],
		[COMMON1.RBOE] = L["RecipeBOEFilter"],
		[COMMON1.RBOP] = L["RecipeBOPFilter"],
		[COMMON1.RBOA] = L["RecipeBOAFilter"]
	}

	local NON_COORD_ACQUIRES = {
		[A.WORLD_DROP] = true,
		[A.CUSTOM] = true,
		[A.ACHIEVEMENT] = true,
		[A.DISCOVERY] = true,
	}

	function ListItem_ShowTooltip(owner, list_entry)
		if not list_entry then
			return
		end
		local recipe = private.recipe_list[list_entry.recipe_id]

		if not recipe then
			return
		end
		InitializeTooltips(recipe.spell_id)

		acquire_tip:AddHeader()
		acquire_tip:SetCell(1, 1, "|c"..select(4, _G.GetItemQualityColor(recipe.quality))..recipe.name, "CENTER", 2)

		local recipe_item_texture = recipe.crafted_item_id and _G.select(10, _G.GetItemInfo(recipe.crafted_item_id))

		if recipe_item_texture then
			acquire_tip:AddHeader()
			acquire_tip:SetCell(2, 1, ("|T%s:30:30|t"):format(recipe_item_texture), "CENTER", 2)
		end

		if addon.db.profile.exclusionlist[list_entry.recipe_id] then
			ttAdd(0, -1, true, L["RECIPE_EXCLUDED"], "ff0000")
		end

		-- Add in skill level requirement, colored correctly
		local skill_level = private.current_profession_scanlevel

		if recipe.skill_level > skill_level then
			ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS["normal"], recipe.skill_level, private.DIFFICULTY_COLORS["impossible"])
		elseif skill_level >= recipe.trivial_level then
			ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS["normal"], recipe.skill_level, private.DIFFICULTY_COLORS["trivial"])
		elseif skill_level >= recipe.easy_level then
			ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS["normal"], recipe.skill_level, private.DIFFICULTY_COLORS["easy"])
		elseif skill_level >= recipe.medium_level then
			ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS["normal"], recipe.skill_level, private.DIFFICULTY_COLORS["medium"])
		elseif skill_level >= recipe.optimal_level then
			ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS["normal"], recipe.skill_level, private.DIFFICULTY_COLORS["optimal"])
		else
			ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS["normal"], recipe.skill_level, private.DIFFICULTY_COLORS["trivial"])
		end
		acquire_tip:AddSeparator()

		for flag, label in pairs(BINDING_FLAGS) do
			if _G.bit.band(recipe.flags.common1, flag) == flag then
				ttAdd(0, -1, true, label, BASIC_COLORS["normal"])
			end
		end
		acquire_tip:AddSeparator()

		local recipe_specialty = recipe.specialty

		if recipe_specialty then
			local hex_color = (recipe_specialty == private.current_profession_specialty) and BASIC_COLORS["white"] or private.DIFFICULTY_COLORS["impossible"]

			ttAdd(0, -1, false, _G.ITEM_REQ_SKILL:format(_G.GetSpellInfo(recipe_specialty)), hex_color)
			acquire_tip:AddSeparator()
		end
		ttAdd(0, -1, false, L["Obtained From"] .. " : ", BASIC_COLORS["normal"])

		addon:DisplayAcquireData(list_entry.recipe_id, list_entry.acquire_id, list_entry.location_id, ttAdd)

		if not addon.db.profile.hide_tooltip_hint then
			local HINT_COLOR = "c9c781"
			local acquire_id = list_entry.acquire_id

			acquire_tip:AddSeparator()
			acquire_tip:AddSeparator()

			ttAdd(0, -1, 0, L["ALT_CLICK"], HINT_COLOR)
			ttAdd(0, -1, 0, L["CTRL_CLICK"], HINT_COLOR)
			ttAdd(0, -1, 0, L["SHIFT_CLICK"], HINT_COLOR)

			if not NON_COORD_ACQUIRES[acquire_id] and (_G.TomTom or _G.Cartographer_Waypoints) and (addon.db.profile.worldmap or addon.db.profile.minimap) then
				ttAdd(0, -1, 0, L["CTRL_SHIFT_CLICK"], HINT_COLOR)
			end
		end
		acquire_tip:Show()
	end
end	-- do
