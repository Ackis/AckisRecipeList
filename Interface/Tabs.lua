-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local table = _G.table
local string = _G.string

local pairs, ipairs = _G.pairs, _G.ipairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Constants.
-------------------------------------------------------------------------------
local ORDERED_PROFESSIONS = private.ORDERED_PROFESSIONS

local A = private.ACQUIRE_TYPE_IDS

local frame_meta = { __index = _G.CreateFrame("Button") }
local tab_prototype = _G.setmetatable({}, frame_meta)
local tab_meta = { __index = tab_prototype }

-------------------------------------------------------------------------------
-- Imports.
-------------------------------------------------------------------------------
local CreateListEntry = private.CreateListEntry
local SetTextColor = private.SetTextColor


-------------------------------------------------------------------------------
-- Helpers.
-------------------------------------------------------------------------------
local function Tab_OnClick(self, button, down)
	local id_num = self:GetID()
	local MainPanel = addon.Frame

	for index in ipairs(MainPanel.tabs) do
		local tab = MainPanel.tabs[index]

		if index == id_num then
			self:ToFront()
		else
			tab:ToBack()
		end
	end
	addon.db.profile.current_tab = id_num
	MainPanel.current_tab = MainPanel.tabs[id_num]

	MainPanel.list_frame:Update(nil, false)
	_G.PlaySound("igCharacterInfoTab")
end

local function CreateTab(id_num, text, ...)
	local tab = _G.setmetatable(_G.CreateFrame("Button", nil, addon.Frame), tab_meta)

	tab:SetID(id_num)
	tab:SetHeight(32)
	tab:SetPoint(...)
	tab:SetFrameLevel(tab:GetFrameLevel() + 4)

	tab.left = tab:CreateTexture(nil, "BORDER")
	tab.left:SetSize(20, 32)

	tab.right = tab:CreateTexture(nil, "BORDER")
	tab.right:SetSize(20, 32)
	tab.right:SetPoint("TOP", tab.left)
	tab.right:SetPoint("RIGHT", tab)

	tab.middle = tab:CreateTexture(nil, "BORDER")
	tab.middle:SetHeight(32)
	tab.middle:SetPoint("LEFT", tab.left, "RIGHT")
	tab.middle:SetPoint("RIGHT", tab.right, "LEFT")

	tab:SetHighlightTexture([[Interface\PaperDollInfoFrame\UI-Character-Tab-Highlight]], "ADD")

	local tab_highlight = tab:GetHighlightTexture()
	tab_highlight:ClearAllPoints()
	tab_highlight:SetPoint("TOPLEFT", tab, "TOPLEFT", 8, 1)
	tab_highlight:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", -8, 1)

	tab:SetDisabledFontObject(_G.GameFontHighlightSmall)
	tab:SetHighlightFontObject(_G.GameFontHighlightSmall)
	tab:SetNormalFontObject(_G.GameFontNormalSmall)

	tab:SetText(text)
	tab:SetWidth(40 + tab:GetFontString():GetStringWidth())

	tab:ToBack()

	tab:SetScript("OnClick", Tab_OnClick)

	return tab
end

-------------------------------------------------------------------------------
-- Tab methods.
-------------------------------------------------------------------------------
function tab_prototype:ToFront()
	self.left:ClearAllPoints()
	self.left:SetPoint("BOTTOMLEFT")

	self.left:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
	self.left:SetTexCoord(0, 0.15625, 0, 0.546875)

	self.middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
	self.middle:SetTexCoord(0.15625, 0.84375, 0, 0.546875)

	self.right:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
	self.right:SetTexCoord(0.84375, 1, 0, 0.546875)

	self:Disable()
end

function tab_prototype:ToBack()
	self.left:ClearAllPoints()
	self.left:SetPoint("TOPLEFT")

	self.left:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
	self.left:SetTexCoord(0, 0.15625, 0, 1)

	self.middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
	self.middle:SetTexCoord(0.15625, 0.84375, 0, 1)

	self.right:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
	self.right:SetTexCoord(0.84375, 1, 0, 1)

	self:Enable()
end

function tab_prototype:SaveListEntryState(entry, expanded)
	local field = ORDERED_PROFESSIONS[addon.Frame.current_profession] .. " expanded"

	if entry.acquire_id then
		self[field][private.ACQUIRE_TYPES_BY_ID[entry.acquire_id]:Name()] = expanded or nil
	end

	if entry.location_id then
		self[field][entry.location_id] = expanded or nil
	end

	if entry.recipe then
		self[field][entry.recipe] = expanded or nil
	end
end

function tab_prototype:ScrollValue(profession_id)
	return self["profession_" .. profession_id .. "_scroll_value"]
end

function tab_prototype:SetScrollValue(profession_id, value)
	self["profession_" .. profession_id .. "_scroll_value"] = value
end

-------------------------------------------------------------------------------
-- Tab initialization and methods.
-------------------------------------------------------------------------------
local AcquisitionTab
local LocationTab
local RecipesTab

-- Used for Location and Acquisition sort - since many recipes have multiple locations/acquire types it is
-- necessary to ensure each is counted only once.
local recipe_registry = {}

-- Recipes with these acquire types will never show as headers.
local CHILDLESS_ACQUIRE_TYPES_BY_ID = {
	[A.ACHIEVEMENT] = true,
	[A.CUSTOM] = true,
	[A.DISCOVERY] = true,
	[A.RETIRED] = true,
	[A.WORLD_DROP] = true,
}

local function ExpandAcquireData(entry_index, entry_type, parent_entry, acquire_type_id, acquire_type_data, recipe, hide_location, hide_type)
	local obtain_filters = addon.db.profile.filters.obtain
	local num_acquire_types = #private.ACQUIRE_TYPES_BY_ID

	for data_identifier, data_info in pairs(acquire_type_data) do
		local execute

		if acquire_type_id == A.TRAINER and obtain_filters.trainer then
			execute = true
		elseif acquire_type_id == A.VENDOR and (obtain_filters.vendor or obtain_filters.pvp) then
			execute = true
		elseif acquire_type_id == A.MOB_DROP and (obtain_filters.mobdrop or obtain_filters.instance or obtain_filters.raid) then
			execute = true
		elseif acquire_type_id == A.QUEST and obtain_filters.quest then
			execute = true
		elseif acquire_type_id == A.WORLD_EVENTS and obtain_filters.seasonal then
			execute = true
		elseif acquire_type_id == A.REPUTATION then
			execute = true
		elseif acquire_type_id == A.WORLD_DROP and obtain_filters.worlddrop then
			if not hide_type then
				execute = true
			end
		elseif acquire_type_id == A.CUSTOM then
			if not hide_type then
				execute = true
			end
		elseif acquire_type_id == A.DISCOVERY then
			if not hide_type then
				execute = true
			end
		elseif acquire_type_id == A.RETIRED then
			if not hide_type then
				execute = true
			end
		elseif acquire_type_id == A.ACHIEVEMENT and obtain_filters.achievement then
			execute = true
		end

		if execute then
			entry_index = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:ExpandListEntry(entry_index, entry_type, parent_entry, data_identifier, data_info, recipe, hide_location, hide_type)
		end
	end	-- for
	return entry_index
end

local function InitializeAcquisitionTab()
	local MainPanel = addon.Frame

	-- Used to hold tables for sorting the tab:The tables are only sorted once, upon creation.
	local sorted_acquires

	AcquisitionTab = CreateTab(1, L["Acquisition"], "TOPLEFT", addon.Frame, "BOTTOMLEFT", 4, 81)

	function AcquisitionTab:Initialize(expand_mode)
		local recipe_count = 0
		local insert_index = 1

		table.wipe(recipe_registry)

		if not sorted_acquires then
			local ACQUIRE_TYPES_BY_ID = private.ACQUIRE_TYPES_BY_ID

			-- Sorting function: Only used once and then thrown away.
			local function Sort_Acquisition(first_id, second_id)
				return ACQUIRE_TYPES_BY_ID[first_id]:Name() < ACQUIRE_TYPES_BY_ID[second_id]:Name()
			end

			sorted_acquires = {}

			for acquire_type_id = 1, #ACQUIRE_TYPES_BY_ID do
				sorted_acquires[#sorted_acquires + 1] = acquire_type_id
			end
			table.sort(sorted_acquires, Sort_Acquisition)
		end
		local prof_name = ORDERED_PROFESSIONS[MainPanel.current_profession]
		local profession_recipes = private.profession_recipe_list[prof_name]

		self[prof_name .. " expanded"] = self[prof_name .. " expanded"] or {}

		for index = 1, #sorted_acquires do
			local acquire_type_id = sorted_acquires[index]
			local count = 0

			-- Check to see if any recipes for this acquire type will be shown - otherwise, don't show the type in the list.
			for spell_id, affiliation in private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:RecipePairs() do
				local recipe = profession_recipes[spell_id]

				if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
					count = count + 1

					if not recipe_registry[recipe] then
						recipe_registry[recipe] = true
						recipe_count = recipe_count + 1
					end
				else
					self[prof_name .. " expanded"][spell_id] = nil
				end
			end

			if count > 0 then
				local acquire_type = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]
				local acquire_type_name = acquire_type:Name()
				local is_expanded = self[prof_name .. " expanded"][acquire_type_name]

				local entry = CreateListEntry("header")
				entry:SetAcquireType(acquire_type)
				entry:SetText("%s (%d)",
					SetTextColor(acquire_type:ColorData().hex, acquire_type_name),
					count
				)

				insert_index = MainPanel.list_frame:InsertEntry(entry, insert_index, is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name .. " expanded"][private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:Name()] = nil
			end
		end
		return recipe_count
	end

	function AcquisitionTab:ExpandListEntry(entry, expand_mode)
		local orig_index = entry.button and entry.button.entry_index or entry.index
		local expand_all = expand_mode == "deep"
		local prof_name = private.ORDERED_PROFESSIONS[MainPanel.current_profession]
		local entry_acquire_type = entry:AcquireType()
		local entry_acquire_type_id = entry_acquire_type:ID()

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		local new_entry_index = orig_index + 1

		self:SaveListEntryState(entry, true)

		if entry:IsHeader() then
			local sorted_recipes = entry_acquire_type:GetSortedRecipes()
			local profession_recipes = private.profession_recipe_list[prof_name]

			for index = 1, #sorted_recipes do
				local recipe = profession_recipes[sorted_recipes[index]]

				if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
					local expand = false
					local entry_type = "subheader"

					if CHILDLESS_ACQUIRE_TYPES_BY_ID[entry_acquire_type_id] then
						expand = true
						entry_type = "entry"
					end
					local is_expanded = (self[prof_name.." expanded"][recipe] and self[prof_name.." expanded"][entry_acquire_type:Name()])

					local new_entry = CreateListEntry(entry_type, entry, recipe)
					new_entry:SetAcquireType(entry_acquire_type)
					new_entry:SetText(recipe:GetDisplayName())

					new_entry_index = MainPanel.list_frame:InsertEntry(new_entry, new_entry_index, expand or is_expanded, expand_all or is_expanded)
				end
			end
		elseif entry:IsSubHeader() then
			for acquire_type_id, acquire_type_data in pairs(entry.recipe.acquire_data) do
				if acquire_type_id == entry_acquire_type_id then
					new_entry_index = ExpandAcquireData(new_entry_index, "subentry", entry, acquire_type_id, acquire_type_data, entry.recipe, false, true)
				end
			end
		end
		return new_entry_index
	end
end

local function InitializeLocationTab()
	local MainPanel = addon.Frame

	-- Used to hold tables for sorting the tab: The tables are only sorted once upon creation.
	local sorted_locations

	local function FactionTally(acquire_data, acquire_type_id, location)
		local acquire_type = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]
		local good, bad = 0, 0

		for id_num in pairs(acquire_data) do
			local entity = acquire_type:GetEntity(id_num)
			local entity_faction = entity.faction

			if not location or entity.location == location then
				if not entity_faction or entity_faction == private.Player.faction or entity_faction == "Neutral" then
					good = good + 1
				else
					bad = bad + 1
				end
			end
		end
		return good, bad
	end

	LocationTab = CreateTab(2, L["Location"], "LEFT", AcquisitionTab, "RIGHT", -14, 0)

	function LocationTab:Initialize(expand_mode)
		local search_box = MainPanel.search_editbox

		local recipe_count = 0
		local insert_index = 1

		table.wipe(recipe_registry)

		if not sorted_locations then
			-- Sorting function: Only used once and then thrown away.
			local function Sort_Location(a, b)
				local location_list = private.location_list
				return location_list[a].name < location_list[b].name
			end

			sorted_locations = {}

			for loc_name in pairs(private.location_list) do
				table.insert(sorted_locations, loc_name)
			end
			table.sort(sorted_locations, Sort_Location)
		end
		local prof_name = ORDERED_PROFESSIONS[MainPanel.current_profession]
		local profession_recipes = private.profession_recipe_list[prof_name]

		self[prof_name .. " expanded"] = self[prof_name .. " expanded"] or {}

		for index = 1, #sorted_locations do
			local loc_name = sorted_locations[index]
			local count = 0

			-- Check to see if any recipes for this location will be shown - otherwise, don't show the location in the list.
			for spell_id, affiliation in pairs(private.location_list[loc_name].recipes) do
				local recipe = profession_recipes[spell_id]

				if recipe and recipe:HasState("VISIBLE") and search_box:MatchesRecipe(recipe) then
					local good_count, bad_count = 0, 0
					local fac_toggle = addon.db.profile.filters.general.faction

					if not fac_toggle then
						local ACQUIRE_TYPES_BY_ID = private.ACQUIRE_TYPES_BY_ID

						for acquire_type_id = 1, #ACQUIRE_TYPES_BY_ID do
							local acquire_data = recipe.acquire_data[acquire_type_id]

							if acquire_data and ACQUIRE_TYPES_BY_ID[acquire_type_id]:HasCoordinates() then
								local good, bad = FactionTally(acquire_data, acquire_type_id, loc_name)

								if good == 0 and bad > 0 then
									bad_count = bad_count + 1
								else
									good_count = good_count + 1
								end
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
					self[prof_name .. " expanded"][spell_id] = nil
				end
			end

			if count > 0 then
				local entry = CreateListEntry("header")

				if loc_name == _G.GetRealZoneText() then
					entry:Emphasize(true)
					entry:SetText("%s (%d)",
						SetTextColor(private.DIFFICULTY_COLORS.optimal.hex, loc_name),
						count
					)
				else
					entry:Emphasize(false)
					entry:SetText("%s (%d)",
						SetTextColor(private.CATEGORY_COLORS.location.hex, loc_name),
						count
					)
				end
				entry:SetLocationID(loc_name)

				local is_expanded = self[prof_name .. " expanded"][loc_name]
				insert_index = MainPanel.list_frame:InsertEntry(entry, insert_index, is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name .. " expanded"][loc_name] = nil
			end
		end
		return recipe_count
	end

	function LocationTab:ExpandListEntry(entry, expand_mode)
		local orig_index = entry.button and entry.button.entry_index or entry.index
		local expand_all = expand_mode == "deep"
		local location_id = entry:LocationID()

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		local new_entry_index = orig_index + 1

		self:SaveListEntryState(entry, true)

		if entry:IsHeader() then
			local recipe_list = private.location_list[location_id].recipes
			local sorted_recipes = addon.sorted_recipes
			local prof_name = private.ORDERED_PROFESSIONS[MainPanel.current_profession]
			local profession_recipes = private.profession_recipe_list[prof_name]

			private.SortRecipeList(recipe_list)

			for index = 1, #sorted_recipes do
				local recipe_id = sorted_recipes[index]
				local recipe = profession_recipes[recipe_id]

				if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
					local expand = false
					local entry_type = "subheader"

					-- Add World Drop entries as normal entries.
					if recipe_list[recipe_id] == "world_drop" then
						expand = true
						entry_type = "entry"
					end
					local is_expanded = (self[prof_name.." expanded"][recipe] and self[prof_name.." expanded"][location_id])

					local new_entry = CreateListEntry(entry_type, entry, recipe)
					new_entry:SetText(recipe:GetDisplayName())
					new_entry:SetLocationID(location_id)

					new_entry_index = MainPanel.list_frame:InsertEntry(new_entry, new_entry_index, expand or is_expanded, expand_all or is_expanded)
				end
			end
		elseif entry:IsSubHeader() then
			-- World Drops are not handled here because they are of type "entry".
			for acquire_type_id, acquire_data in pairs(entry.recipe.acquire_data) do
				-- Only expand an acquisition entry if it is from this location.
				for data_identifier, data_info in pairs(acquire_data) do
					local acquire_type = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]
					local hide_acquire_type
					local execute

					if (acquire_type_id == A.TRAINER or acquire_type_id == A.VENDOR or acquire_type_id == A.MOB_DROP or acquire_type_id == A.QUEST)
							and acquire_type:GetEntity(data_identifier).location == location_id then
						execute = true
					elseif (acquire_type_id == A.WORLD_EVENTS or acquire_type_id == A.CUSTOM or acquire_type_id == A.DISCOVERY)
							and acquire_type:GetEntity(data_identifier).location == location_id then
						hide_acquire_type = true
						execute = true
					elseif acquire_type_id == A.REPUTATION then
						execute = true
						break
					end

					if execute then
						new_entry_index = acquire_type:ExpandListEntry(new_entry_index, "subentry", entry, data_identifier, data_info, entry.recipe, true, hide_acquire_type)
					end
				end
			end
		end
		return new_entry_index
	end
end

local function InitializeRecipesTab()
	local MainPanel = addon.Frame

	RecipesTab = CreateTab(3, _G.TRADESKILL_SERVICE_LEARN, "LEFT", LocationTab, "RIGHT", -14, 0)

	function RecipesTab:Initialize(expand_mode)
		local prof_name = ORDERED_PROFESSIONS[MainPanel.current_profession]
		local profession_recipes = private.profession_recipe_list[prof_name]

		self[prof_name .. " expanded"] = self[prof_name .. " expanded"] or {}

		private.SortRecipeList(profession_recipes)

		local sorted_recipes = addon.sorted_recipes
		local recipe_count = 0
		local insert_index = 1

		for i = 1, #sorted_recipes do
			local recipe = profession_recipes[sorted_recipes[i]]

			if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
				local entry = CreateListEntry("header", nil, recipe)
				entry:SetText(recipe:GetDisplayName())

				recipe_count = recipe_count + 1

				local is_expanded = self[prof_name .. " expanded"][recipe]
				insert_index = MainPanel.list_frame:InsertEntry(entry, insert_index, is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name .. " expanded"][recipe] = nil
			end
		end
		return recipe_count
	end

	function RecipesTab:ExpandListEntry(entry, expand_mode)
		local orig_index = entry.button and entry.button.entry_index or entry.index

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		local new_entry_index = orig_index + 1
		local recipe = entry.recipe

		self:SaveListEntryState(entry, true)

		for acquire_type_id, acquire_type_data in pairs(recipe.acquire_data) do
			new_entry_index = ExpandAcquireData(new_entry_index, "entry", entry, acquire_type_id, acquire_type_data, recipe)
		end
		return new_entry_index
	end
end

function private.InitializeTabs()
	local MainPanel = addon.Frame
	MainPanel.tabs = {}

	InitializeAcquisitionTab()
	MainPanel.tabs[#MainPanel.tabs + 1] = AcquisitionTab

	InitializeLocationTab()
	MainPanel.tabs[#MainPanel.tabs + 1] = LocationTab

	InitializeRecipesTab()
	MainPanel.tabs[#MainPanel.tabs + 1] = RecipesTab

	private.InitializeTabs = nil
end
