-------------------------------------------------------------------------------
-- Localized Lua API.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string
local math = _G.math
local table = _G.table

local bit = _G.bit
local pairs = _G.pairs
local select = _G.select
local tonumber = _G.tonumber
local tostring = _G.tostring
local type = _G.type

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local QTip = LibStub("LibQTip-1.0")
local Dialog = LibStub("LibDialog-1.0")

-------------------------------------------------------------------------------
-- Imports.
-------------------------------------------------------------------------------
local CreateListEntry = private.CreateListEntry
local SetTextColor = private.SetTextColor

local CATEGORY_COLORS = private.CATEGORY_COLORS
local COORDINATES_FORMAT = private.COORDINATES_FORMAT
local BASIC_COLORS = private.BASIC_COLORS

local A = private.ACQUIRE_TYPE_IDS

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local NUM_RECIPE_LINES	= 25
local SCROLL_DEPTH	= 5
local LISTFRAME_WIDTH	= 295
local LIST_ENTRY_WIDTH	= 286

-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local ListItem_ShowTooltip

local acquire_tip
local spell_tip

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
-- Frame creation and anchoring
-------------------------------------------------------------------------------
function private.InitializeListFrame()
	local MainPanel	= addon.Frame
	local ListFrame = _G.CreateFrame("Frame", nil, MainPanel)
	ListFrame:SetSize(LISTFRAME_WIDTH, 335)
	ListFrame:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 22, -75)
	ListFrame:SetBackdrop({
		bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
		tile = true,
		tileSize = 16,
	})
	ListFrame:SetBackdropColor(1, 1, 1)
	ListFrame:EnableMouse(true)
	ListFrame:EnableMouseWheel(true)
	ListFrame:SetScript("OnHide", function(self)
		if acquire_tip then
			acquire_tip = QTip:Release(acquire_tip)
		end
		spell_tip:Hide()
		self.selected_entry = nil
	end)
	MainPanel.list_frame = ListFrame
	private.list_frame = ListFrame

	-------------------------------------------------------------------------------
	-- Scroll bar.
	-------------------------------------------------------------------------------
	local ScrollBar = _G.CreateFrame("Slider", nil, ListFrame)

	ScrollBar:SetPoint("TOPLEFT", ListFrame, "TOPRIGHT", 5, -11)
	ScrollBar:SetPoint("BOTTOMLEFT", ListFrame, "BOTTOMRIGHT", 5, 12)
	ScrollBar:SetWidth(24)

	ScrollBar:EnableMouseWheel(true)
	ScrollBar:SetOrientation("VERTICAL")

	ScrollBar:SetThumbTexture([[Interface\Buttons\UI-ScrollBar-Knob]])
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

	ScrollUpButton:SetScript("OnClick", function(self, _, _)
		if _G.IsAltKeyDown() then
			local min_val = ScrollBar:GetMinMaxValues()
			ScrollBar:SetValue(min_val)
		else
			ScrollBar_Scroll(1)
		end
	end)

	ScrollDownButton:SetScript("OnClick", function(self, _, _)
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
		MainPanel.current_tab:SetScrollValue(MainPanel.current_profession, value)
		ListFrame:Update(nil, true)
	end)

	local function Bar_OnEnter(self)
		if ListFrame.selected_entry then
			return
		end
		ListItem_ShowTooltip(ListFrame.entries[self.entry_index])
	end

	local function Bar_OnLeave()
		if ListFrame.selected_entry then
			return
		end

		if acquire_tip then
			acquire_tip = QTip:Release(acquire_tip)
		end
		spell_tip:Hide()
	end

	local function ListItem_OnClick(self, button, down)
		local clicked_index = self.entry_index

		if not clicked_index or clicked_index == 0 then
			return
		end
		local entry = ListFrame.entries[clicked_index]
		local recipe = entry.recipe

		if button == "RightButton" and recipe and (not entry.parent or entry.parent.recipe ~= entry.recipe) then
			local old_selected = ListFrame.selected_entry
			local entry_button = entry.button

			ListFrame.selected_entry = nil

			if old_selected and old_selected.button then
				old_selected.button.selected_texture:Hide()
				Bar_OnLeave(old_selected.button)
			end
			Bar_OnEnter(entry_button)

			if old_selected ~= entry then
				entry_button.selected_texture:Show()
				ListFrame.selected_entry = entry
			end
		elseif recipe and _G.IsModifierKeyDown() then
			if _G.IsControlKeyDown() then
				if _G.IsShiftKeyDown() then
					local entry_acquire_type = entry:AcquireType()

					addon:AddWaypoint(recipe, entry_acquire_type and entry_acquire_type:ID() or nil, entry:LocationID(), entry:NPCID())
				else
					local edit_box = _G.ChatEdit_ChooseBoxForSend()

					_G.ChatEdit_ActivateChat(edit_box)
					edit_box:Insert(_G.GetSpellLink(recipe:SpellID()))
				end
			elseif _G.IsShiftKeyDown() then
				local crafted_item_id = recipe:CraftedItem()

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
				local recipe_spell_id = recipe:SpellID()

				exclusion_list[recipe_spell_id] = (not exclusion_list[recipe_spell_id] and true or nil)
				ListFrame:Update(nil, false)
			end
		elseif entry:IsHeader() or entry:IsSubHeader() then
			-- three possibilities here (all with no modifiers)
			-- 1) We clicked on the recipe button on a closed recipe
			-- 2) We clicked on the recipe button of an open recipe
			-- 3) we clicked on the expanded text of an open recipe
			local current_tab = MainPanel.current_tab

			if entry.is_expanded then
				local removal_index = clicked_index + 1
				local target_entry = ListFrame.entries[removal_index]

				while target_entry and target_entry:Type() ~= entry:Type() do
					-- Headers are never removed.
					if target_entry:IsHeader() then
						break
					end
					current_tab:SaveListEntryState(target_entry, false)
					private.ReleaseTable(table.remove(ListFrame.entries, removal_index))
					target_entry = ListFrame.entries[removal_index]
				end
				current_tab:SaveListEntryState(entry, false)
				entry.is_expanded = false
			else
				current_tab:ExpandListEntry(entry)
				entry.is_expanded = true
			end
		else
			-- clicked_line is an expanded entry - remove all of the parent's child entries.
			local parent = entry.parent

			if parent then
				local parent_index = parent.button.entry_index

				if not parent_index then
					addon:Debug("clicked_line (%s): parent wasn't found in ListFrame.entries", entry:Text())
					return
				end
				local current_tab = MainPanel.current_tab

				parent.is_expanded = false
				current_tab:SaveListEntryState(parent, false)

				local child_index = parent_index + 1
				local entries = ListFrame.entries

				while entries[child_index] and entries[child_index].parent == parent do
					private.ReleaseTable(table.remove(entries, child_index))
				end
			else
				addon:Debug("Error: clicked_line (%s) has no parent.", entry:Type() or _G.UNKNOWN)
			end
		end
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
		cur_container:SetSize(LIST_ENTRY_WIDTH, 16)

		local cur_state = _G.CreateFrame("Button", nil, ListFrame)
		cur_state:SetSize(16, 16)

		local cur_entry = _G.CreateFrame("Button", ("%s_ListEntryButton%d"):format(FOLDER_NAME, index), cur_container)
		cur_entry:SetSize(LIST_ENTRY_WIDTH, 16)
		cur_entry:RegisterForClicks("AnyUp")

		local highlight_texture = cur_entry:CreateTexture(nil, "BORDER")
		highlight_texture:SetTexture([[Interface\ClassTrainerFrame\TrainerTextures]])
		highlight_texture:SetTexCoord(0.00195313, 0.57421875, 0.75390625, 0.84570313)
		highlight_texture:SetBlendMode("ADD")
		highlight_texture:SetPoint("TOPLEFT", 2, 0)
		highlight_texture:SetPoint("BOTTOMRIGHT", -2, 1)
		cur_entry:SetHighlightTexture(highlight_texture)

		local selected_texture = cur_entry:CreateTexture(nil, "BORDER")
		selected_texture:SetTexture([[Interface\ClassTrainerFrame\TrainerTextures]])
		selected_texture:SetTexCoord(0.00195313, 0.57421875, 0.84960938, 0.94140625)
		selected_texture:SetBlendMode("ADD")
		selected_texture:SetPoint("TOPLEFT", 2, 0)
		selected_texture:SetPoint("BOTTOMRIGHT", -2, 1)
		cur_entry.selected_texture = selected_texture

		local emphasis_texture = cur_entry:CreateTexture(nil, "BORDER")
		emphasis_texture:SetTexture([[Interface\QUESTFRAME\Ui-QuestLogTitleHighlight]])
		emphasis_texture:SetVertexColor(1, 0.61, 0)
		emphasis_texture:SetBlendMode("ADD")
		emphasis_texture:SetPoint("TOPLEFT", 2, 0)
		emphasis_texture:SetPoint("BOTTOMRIGHT", -2, 1)
		cur_entry.emphasis_texture = emphasis_texture

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
		else
			cur_container:SetPoint("TOPLEFT", ListFrame.button_containers[index - 1], "BOTTOMLEFT", 0, 3)
		end
		cur_state:SetPoint("LEFT", cur_container, "LEFT", 0, 0)
		cur_entry:SetPoint("LEFT", cur_state, "RIGHT", -3, 0)

		cur_state.container = cur_container

		cur_state:SetScript("OnClick", ListItem_OnClick)

		ListFrame.button_containers[index] = cur_container
		ListFrame.state_buttons[index] = cur_state
		ListFrame.entry_buttons[index] = cur_entry
	end

	function ListFrame:InsertEntry(entry, entry_index, entry_expanded, expand_mode)
		local insert_index = entry_index
		entry.index = entry_index

		-- If we have acquire information for this entry, push the data table into the list
		-- and start processing the acquires.
		if expand_mode then
			entry.is_expanded = true
			table.insert(self.entries, insert_index, entry)

			if entry:IsHeader() or entry:IsSubHeader() then
				insert_index = MainPanel.current_tab:ExpandListEntry(entry, expand_mode)
			else
				MainPanel.current_tab:SaveListEntryState(entry, entry_expanded)
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
		function ListFrame:Initialize(expand_mode)
			for i = 1, #self.entries do
				private.ReleaseTable(self.entries[i])
			end
			table.wipe(self.entries)

			-------------------------------------------------------------------------------
			-- Update recipe filters.
			-------------------------------------------------------------------------------
			local general_filters = addon.db.profile.filters.general
			local profession_recipes = private.profession_recipe_list[private.ORDERED_PROFESSIONS[MainPanel.current_profession]]
			local recipes_known, recipes_known_filtered = 0, 0
			local recipes_total, recipes_total_filtered = 0, 0

			for _, recipe in pairs(profession_recipes) do
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

					can_display = recipe:CanDisplay()

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
			local expanded_button = current_tab["expand_button_"..MainPanel.current_profession]

			if acquire_tip then
				acquire_tip = QTip:Release(acquire_tip)
			end
			spell_tip:Hide()
			self.selected_entry = nil

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

	-- Reset the current buttons/lines
	function ListFrame:ClearLines()
		for index = 1, NUM_RECIPE_LINES do
			local entry = self.entry_buttons[index]
			entry.text:SetFontObject(addon.db.profile.frameopts.small_list_font and "GameFontNormalSmall" or "GameFontNormal")
			entry:SetText("")
			entry:SetScript("OnEnter", nil)
			entry:SetScript("OnLeave", nil)
			entry:SetScript("OnClick", nil)
			entry:SetWidth(LIST_ENTRY_WIDTH)
			entry:Disable()
			entry.emphasis_texture:Hide()
			entry.selected_texture:Hide()
			entry.button = nil
			entry.entry_index = 0

			local state = self.state_buttons[index]
			state.entry_index = 0
			state:Hide()
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
			local current_tab = MainPanel.current_tab
			local scroll_value = math.max(0, math.min(current_tab:ScrollValue(MainPanel.current_profession) or 0, max_val))
			offset = scroll_value

			self.scroll_bar:SetMinMaxValues(0, math.max(0, max_val))
			self.scroll_bar:SetValue(scroll_value)
			self.scroll_bar:Show()
		end
		self:ClearLines()

		local button_index = 1
		local entry_index = math.floor(button_index + offset)

		-- Populate the buttons with new values
		while button_index <= NUM_RECIPE_LINES and entry_index <= num_entries do
			local state_button = self.state_buttons[button_index]
			local list_entry = self.entries[entry_index]
			local is_entry = list_entry:IsEntry()
			local is_subentry = not is_entry and list_entry:IsSubEntry()
			local is_header = not is_subentry and list_entry:IsHeader()
			local is_subheader = not is_header and list_entry:IsSubHeader()

			if is_header or is_subheader then
				state_button:Show()

				if list_entry.is_expanded then
					state_button:SetNormalTexture([[Interface\MINIMAP\UI-Minimap-ZoomOutButton-Up]])
					state_button:SetPushedTexture([[Interface\MINIMAP\UI-Minimap-ZoomOutButton-Down]])
				else
					state_button:SetNormalTexture([[Interface\MINIMAP\UI-Minimap-ZoomInButton-Up]])
					state_button:SetPushedTexture([[Interface\MINIMAP\UI-Minimap-ZoomInButton-Down]])
				end
				state_button:SetHighlightTexture([[Interface\MINIMAP\UI-Minimap-ZoomButton-Highlight]])
				state_button.entry_index = entry_index
				state_button:Enable()
			else
				state_button:Hide()
				state_button:Disable()
			end
			local line_button = self.entry_buttons[button_index]

			if list_entry == ListFrame.selected_entry then
				line_button.selected_texture:Show()
			end

			if list_entry:IsEmphasized() then
				line_button.emphasis_texture:Show()
			end

			if is_header or is_entry then
				state_button:SetPoint("TOPLEFT", state_button.container, "TOPLEFT", 0, 0)
			elseif is_subheader or is_subentry then
				state_button:SetPoint("TOPLEFT", state_button.container, "TOPLEFT", 15, 0)
				line_button:SetWidth(LIST_ENTRY_WIDTH - 15)
			end
			list_entry.button = line_button
			line_button.entry_index = entry_index

			line_button:SetText(list_entry:Text())
			line_button:SetScript("OnEnter", Bar_OnEnter)
			line_button:SetScript("OnLeave", Bar_OnLeave)

			line_button:SetScript("OnClick", ListItem_OnClick)
			line_button:Enable()

			-- This function could possibly have been called from a mouse click or by scrolling. Since, in those cases, the list entries have
			-- changed, the mouse is likely over a different entry - a tooltip should be generated for it.
			if line_button:IsMouseOver() then
				Bar_OnEnter(line_button)
			end
			button_index = button_index + 1
			entry_index = entry_index + 1
		end
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
			color_table1,		-- color values for left-hand side
			str2,			-- if present, this is the right-hand string
			color_table2)		-- if present, color vaues for right-hand side

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
		local padding = leftPad
		local left_text = str1

		while padding > 0 do
			left_text = "    " .. left_text
			padding = padding - 1
		end
		-- Set maximum width to match fontSize to maintain uniform tooltip size. -Torhal
		local width = math.ceil(fontSize * 37.5)
		local line = acquire_tip:AddLine()

		if str2 then
			width = width / 2

			acquire_tip:SetCell(line, 1, left_text, "LEFT", nil, nil, 0, 0, width, width)
			acquire_tip:SetCellTextColor(line, 1, color_table1.r, color_table1.g, color_table1.b)

			acquire_tip:SetCell(line, 2, str2, "RIGHT", nil, nil, 0, 0, width, width)
			acquire_tip:SetCellTextColor(line, 2, color_table2.r, color_table2.g, color_table2.b)
		else
			acquire_tip:SetCell(line, 1, left_text, nil, "LEFT", 2, nil, 0, 0, width, width)
			acquire_tip:SetCellTextColor(line, 1, color_table1.r, color_table1.g, color_table1.b)
		end
	end

	-------------------------------------------------------------------------------
	-- Public API function for displaying a recipe's acquire data.
	-- * The addline_func paramater must be a function which accepts the same
	-- * arguments as ARL's ttAdd function.
	-------------------------------------------------------------------------------
	function addon:DisplayAcquireData(recipe_spell_id, acquire_type_id, location, addline_func)
		local recipe = private.recipe_list[recipe_spell_id]
		if not recipe then
			return
		end

		for recipe_acquire_type_id, acquire_data in pairs(recipe.acquire_data) do
			if not acquire_type_id or recipe_acquire_type_id == acquire_type_id then
				local count = 0

				for identifier, info in pairs(acquire_data) do
					private.ACQUIRE_TYPES_BY_ID[recipe_acquire_type_id]:InsertTooltipText(recipe, identifier, location, info, addline_func)
					count = count + 1
				end

				if count == 0 then
					private.ACQUIRE_TYPES_BY_ID[recipe_acquire_type_id]:InsertTooltipText(recipe, nil, location, nil, addline_func)
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
			if acquire_tip then
				acquire_tip = QTip:Release(acquire_tip)
			end

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

	local ITEM_BINDING_TYPES = {
		BIND_ON_EQUIP = L["BOEFilter"],
		BIND_ON_PICKUP = L["BOPFilter"],
	}

	local RECIPE_BINDING_TYPES = {
		BIND_ON_EQUIP = L["RecipeBOEFilter"],
		BIND_ON_PICKUP = L["RecipeBOPFilter"],
	}

	function ListItem_ShowTooltip(list_entry)
		if not list_entry then
			return
		end
		local recipe = list_entry.recipe

		if not recipe then
			return
		end
		InitializeTooltips(recipe:SpellID())

		if not acquire_tip then
			return
		end
		acquire_tip:AddHeader()
		acquire_tip:SetCell(1, 1, recipe.name, "CENTER", 2)
		acquire_tip:SetCellTextColor(1, 1, _G.GetItemQualityColor(recipe.quality))

		local recipe_item_texture = recipe.crafted_item_id and _G.select(10, _G.GetItemInfo(recipe.crafted_item_id))

		if recipe_item_texture then
			acquire_tip:AddHeader()
			acquire_tip:SetCell(2, 1, ("|T%s:30:30|t"):format(recipe_item_texture), "CENTER", 2)
		end

		if addon.db.profile.exclusionlist[recipe:SpellID()] then
			ttAdd(0, -1, true, L["RECIPE_EXCLUDED"], private.DIFFICULTY_COLORS.impossible)
		end

		-- Add in skill level requirement, colored correctly
		local skill_level = private.current_profession_scanlevel
		local color_type

		if recipe.skill_level > skill_level then
			color_type = "impossible"
		elseif skill_level >= recipe.trivial_level then
			color_type = "trivial"
		elseif skill_level >= recipe.easy_level then
			color_type = "easy"
		elseif skill_level >= recipe.medium_level then
			color_type = "medium"
		elseif skill_level >= recipe.optimal_level then
			color_type = "optimal"
		else
			color_type = "trivial"
		end
		ttAdd(0, -1, false, ("%s:"):format(_G.SKILL_LEVEL), BASIC_COLORS.normal, recipe.skill_level, private.DIFFICULTY_COLORS[color_type])
		acquire_tip:AddSeparator()

		local _, recipe_item_binding = recipe:RecipeItem()

		if recipe_item_binding then
			ttAdd(0, -1, true, RECIPE_BINDING_TYPES[recipe_item_binding], BASIC_COLORS.normal)
		end

		local _, crafted_item_binding = recipe:CraftedItem()

		if crafted_item_binding then
			ttAdd(0, -1, true, ITEM_BINDING_TYPES[crafted_item_binding], BASIC_COLORS.normal)
		end

		acquire_tip:AddSeparator()

		local recipe_specialty = recipe.specialty

		if recipe_specialty then
			local color_table = (recipe_specialty == private.current_profession_specialty) and BASIC_COLORS.white or private.DIFFICULTY_COLORS.impossible
			ttAdd(0, -1, false, _G.ITEM_REQ_SKILL:format(_G.GetSpellInfo(recipe_specialty)), color_table)
			acquire_tip:AddSeparator()
		end
		ttAdd(0, -1, false, L["Obtained From"] .. " : ", BASIC_COLORS.normal)

		local entry_acquire_type = list_entry:AcquireType()
		addon:DisplayAcquireData(recipe:SpellID(), entry_acquire_type and entry_acquire_type:ID(), list_entry:LocationID(), ttAdd)

		if not addon.db.profile.hide_tooltip_hint then
			local hint_color = private.CATEGORY_COLORS.hint

			acquire_tip:AddSeparator()
			acquire_tip:AddSeparator()

			ttAdd(0, -1, 0, L["CLICK"], hint_color)
			ttAdd(0, -1, 0, L["ALT_CLICK"], hint_color)
			ttAdd(0, -1, 0, L["CTRL_CLICK"], hint_color)
			ttAdd(0, -1, 0, L["SHIFT_CLICK"], hint_color)

			if recipe:HasCoordinates() and _G.TomTom and (addon.db.profile.worldmap or addon.db.profile.minimap) then
				ttAdd(0, -1, 0, L["CTRL_SHIFT_CLICK"], hint_color)
			end
		end
		acquire_tip:Show()
		acquire_tip:UpdateScrolling(addon.Frame:GetHeight())
	end
end	-- do
