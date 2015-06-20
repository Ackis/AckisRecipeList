-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local table = _G.table

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
	local tabID = self:GetID()
	local MainPanel = addon.Frame

	for index in ipairs(MainPanel.tabs) do
		local tab = MainPanel.tabs[index]

		if index == tabID then
			self:ToFront()
		else
			tab:ToBack()
		end
	end
	addon.db.profile.current_tab = tabID
	MainPanel.current_tab = MainPanel.tabs[tabID]

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
	local field = private.CurrentProfession:LocalizedName() .. " expanded"

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

function tab_prototype:ScrollValue(profession)
	return self["profession_" .. profession:Name() .. "_scroll_value"]
end

function tab_prototype:SetScrollValue(profession, value)
	self["profession_" .. profession:Name() .. "_scroll_value"] = value
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
	[private.ACQUIRE_TYPE_IDS.ACHIEVEMENT] = true,
	[private.ACQUIRE_TYPE_IDS.CUSTOM] = true,
	[private.ACQUIRE_TYPE_IDS.DISCOVERY] = true,
	[private.ACQUIRE_TYPE_IDS.RETIRED] = true,
	[private.ACQUIRE_TYPE_IDS.WORLD_DROP] = true,
}

local EXPANSION_PREDICATES = {
	[private.ACQUIRE_TYPE_IDS.TRAINER] = function(obtain_filters, hide_type)
		return obtain_filters.trainer
	end,
	[private.ACQUIRE_TYPE_IDS.VENDOR] = function(obtain_filters, hide_type)
		return obtain_filters.vendor or obtain_filters.pvp
	end,
	[private.ACQUIRE_TYPE_IDS.MOB_DROP] = function(obtain_filters, hide_type)
		return obtain_filters.mobdrop or obtain_filters.instance or obtain_filters.raid
	end,
	[private.ACQUIRE_TYPE_IDS.QUEST] = function(obtain_filters, hide_type)
		return obtain_filters.quest
	end,
	[private.ACQUIRE_TYPE_IDS.WORLD_EVENT] = function(obtain_filters, hide_type)
		return obtain_filters.worldevent
	end,
	[private.ACQUIRE_TYPE_IDS.REPUTATION] = function(obtain_filters, hide_type)
		return true
	end,
	[private.ACQUIRE_TYPE_IDS.WORLD_DROP] = function(obtain_filters, hide_type)
		return obtain_filters.worlddrop and not hide_type
	end,
	[private.ACQUIRE_TYPE_IDS.CUSTOM] = function(obtain_filters, hide_type)
		return not hide_type
	end,
	[private.ACQUIRE_TYPE_IDS.DISCOVERY] = function(obtain_filters, hide_type)
		return not hide_type
	end,
	[private.ACQUIRE_TYPE_IDS.RETIRED] = function(obtain_filters, hide_type)
		return not hide_type
	end,
	[private.ACQUIRE_TYPE_IDS.ACHIEVEMENT] = function(obtain_filters, hide_type)
		return obtain_filters.achievement
	end,
}

local function ExpandAcquireData(entry_index, entry_type, parent_entry, acquire_type_id, acquire_type_data, recipe, hide_location, hide_type)
	local obtain_filters = addon.db.profile.filters.obtain
	for data_identifier, data_info in pairs(acquire_type_data) do
		local predicateFunc = EXPANSION_PREDICATES[acquire_type_id]
		if predicateFunc and predicateFunc(obtain_filters, hide_type) then
			entry_index = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:ExpandListEntry(entry_index, entry_type, parent_entry, data_identifier, data_info, recipe, hide_location, hide_type)
		end
	end

	return entry_index
end

local function InitializeAcquisitionTab()
	local MainPanel = addon.Frame

	-- Used to hold tables for sorting the tab:The tables are only sorted once, upon creation.
	local SortedAcquireTypes

	AcquisitionTab = CreateTab(1, L["Acquisition"], "TOPLEFT", addon.Frame, "BOTTOMLEFT", 4, 81)

	function AcquisitionTab:Initialize(expand_mode)
		local recipe_count = 0
		local insert_index = 1

		table.wipe(recipe_registry)

		if not SortedAcquireTypes then
			SortedAcquireTypes = {}

            for name, acquireType in pairs(private.AcquireTypes) do
				SortedAcquireTypes[#SortedAcquireTypes + 1] = acquireType
            end

			table.sort(SortedAcquireTypes, function(acquireTypeA, acquireTypeB)
                return acquireTypeA:Name() < acquireTypeB:Name()
            end)
		end
		local localizedProfessionName = private.CurrentProfession:LocalizedName()
		local professionRecipes = private.Professions[localizedProfessionName].Recipes

		self[localizedProfessionName .. " expanded"] = self[localizedProfessionName .. " expanded"] or {}

		for index = 1, #SortedAcquireTypes do
			local acquireType = SortedAcquireTypes[index]
			local count = 0

			-- Check to see if any recipes for this acquire type will be shown - otherwise, don't show the type in the list.
			for spell_id, affiliation in acquireType:RecipePairs() do
				local recipe = professionRecipes[spell_id]

				if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
					count = count + 1

					if not recipe_registry[recipe] then
						recipe_registry[recipe] = true
						recipe_count = recipe_count + 1
					end
				else
					self[localizedProfessionName .. " expanded"][spell_id] = nil
				end
			end

			if count > 0 then
				local isAcquireTypeExpanded = self[localizedProfessionName .. " expanded"][acquireType:Name()]
				local listEntry = CreateListEntry("header")
				listEntry:SetAcquireType(acquireType)
				listEntry:SetText("%s (%d)",
					SetTextColor(acquireType:ColorData().hex, acquireType:Name()),
					count
				)

				insert_index = MainPanel.list_frame:InsertEntry(listEntry, insert_index, isAcquireTypeExpanded or expand_mode, isAcquireTypeExpanded or expand_mode)
			else
				self[localizedProfessionName .. " expanded"][acquireType:Name()] = nil
			end
        end

		return recipe_count
	end

	function AcquisitionTab:ExpandListEntry(entry, expand_mode)
		local orig_index = entry.button and entry.button.entry_index or entry.index
		local expand_all = expand_mode == "deep"
		local entry_acquire_type = entry:AcquireType()
        local entry_acquire_type_id = entry_acquire_type:ID()

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		local new_entry_index = orig_index + 1

		self:SaveListEntryState(entry, true)

		if entry:IsHeader() then
			local sorted_recipes = entry_acquire_type:GetSortedRecipes()
            local currentProfession = private.CurrentProfession
            local localizedProfessionName = currentProfession:LocalizedName()

            for index = 1, #sorted_recipes do
				local recipe = currentProfession.Recipes[sorted_recipes[index]]
				if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
					local expand = false
					local entry_type = "subheader"

					if CHILDLESS_ACQUIRE_TYPES_BY_ID[entry_acquire_type_id] then
						expand = true
						entry_type = "entry"
					end
					local is_expanded = (self[localizedProfessionName .." expanded"][recipe] and self[localizedProfessionName .." expanded"][entry_acquire_type:Name()])

					local listEntry = CreateListEntry(entry_type, entry, recipe)
					listEntry:SetAcquireType(entry_acquire_type)
					listEntry:SetText(recipe:GetDisplayName())

					new_entry_index = MainPanel.list_frame:InsertEntry(listEntry, new_entry_index, expand or is_expanded, expand_all or is_expanded)
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
	local SortedLocations

	LocationTab = CreateTab(2, L["Location"], "LEFT", AcquisitionTab, "RIGHT", -14, 0)

	function LocationTab:Initialize(expand_mode)
		local search_box = MainPanel.search_editbox

		local recipe_count = 0
		local insert_index = 1

		table.wipe(recipe_registry)

		if not SortedLocations then
			SortedLocations = {}

			for name, location in pairs(private.Locations) do
				table.insert(SortedLocations, location)
			end

			table.sort(SortedLocations, function(locationA, locationB)
                return locationA:LocalizedName() < locationB:LocalizedName()
            end)
        end
        local currentProfession = private.CurrentProfession
        local localizedProfessionName = currentProfession:LocalizedName()
		local professionRecipes = currentProfession.Recipes

		self[localizedProfessionName .. " expanded"] = self[localizedProfessionName .. " expanded"] or {}

		for index = 1, #SortedLocations do
            local location = SortedLocations[index]
            local localizedLocationName = location:LocalizedName()
			local count = 0

			-- Check to see if any recipes for this location will be shown - otherwise, don't show the location in the list.
            for recipe, affiliation in location:RecipePairs() do
				if recipe:HasState("VISIBLE") and search_box:MatchesRecipe(recipe) then
					local good_count, bad_count = 0, 0
					local showOpposingFaction = addon.db.profile.filters.general.faction

					if not showOpposingFaction then
                        for name, acquireType in pairs(private.AcquireTypes) do
							local acquireData = recipe.acquire_data[acquireType:ID()]

							if acquireData and acquireType:HasCoordinates() then
                                local alignedCount = 0
                                local opposingCount = 0

                                for identifier in pairs(acquireData) do
                                    local entity = acquireType:GetEntity(identifier)
                                    local entityFaction = entity.faction

                                    if not location or entity.location == localizedLocationName then
                                        if not entityFaction or entityFaction == private.Player.faction or entityFaction == "Neutral" then
                                            alignedCount = alignedCount + 1
                                        else
                                            opposingCount = opposingCount + 1
                                        end
                                    end
                                end

                                if alignedCount == 0 and opposingCount > 0 then
									bad_count = bad_count + 1
								else
									good_count = good_count + 1
								end
							end
						end
					end

					if showOpposingFaction or not (good_count == 0 and bad_count > 0) then
						count = count + 1

						if not recipe_registry[recipe] then
							recipe_registry[recipe] = true
							recipe_count = recipe_count + 1
						end
					end
				else
					self[localizedProfessionName .. " expanded"][recipe:SpellID()] = nil
				end
			end

			if count > 0 then
				local listEntry = CreateListEntry("header")

				if localizedLocationName == _G.GetRealZoneText() then
					listEntry:Emphasize(true)
					listEntry:SetText("%s (%d)",
						SetTextColor(private.DIFFICULTY_COLORS.optimal.hex, localizedLocationName),
						count
					)
				else
					listEntry:Emphasize(false)
					listEntry:SetText("%s (%d)",
						SetTextColor(private.CATEGORY_COLORS.location.hex, localizedLocationName),
						count
					)
				end
				listEntry:SetLocationID(localizedLocationName)

				local isLocationExpanded = self[localizedProfessionName .. " expanded"][localizedLocationName]
				insert_index = MainPanel.list_frame:InsertEntry(listEntry, insert_index, isLocationExpanded or expand_mode, isLocationExpanded or expand_mode)
			else
				self[localizedProfessionName .. " expanded"][localizedLocationName] = nil
			end
        end

		return recipe_count
	end

	function LocationTab:ExpandListEntry(entry, expand_mode)
		local orig_index = entry.button and entry.button.entry_index or entry.index
		local expand_all = expand_mode == "deep"
		local localizedLocationName = entry:LocationID()

		-- Entry_index is the position in self.entries that we want to expand. Since we are expanding the current entry, the return
		-- value should be the index of the next button after the expansion occurs
		local new_entry_index = orig_index + 1

		self:SaveListEntryState(entry, true)

		if entry:IsHeader() then
            local currentProfession = private.CurrentProfession
            local localizedProfessionName = currentProfession:LocalizedName()

            local location = private.LocationsByLocalizedName[localizedLocationName]
            local sortedRecipes = location:GetSortedRecipes()
			for index = 1, #sortedRecipes do
				local recipe = currentProfession.Recipes[sortedRecipes[index]]

				if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
					local expand = false
					local entry_type = "subheader"

					-- Add World Drop entries as normal entries.
					if location:GetRecipeAffiliation(recipe) == "world_drop" then
						expand = true
						entry_type = "entry"
					end

					local isLocationExpanded = (self[localizedProfessionName .." expanded"][recipe] and self[localizedProfessionName .." expanded"][localizedLocationName])
					local listEntry = CreateListEntry(entry_type, entry, recipe)
					listEntry:SetText(recipe:GetDisplayName())
					listEntry:SetLocationID(localizedLocationName)

					new_entry_index = MainPanel.list_frame:InsertEntry(listEntry, new_entry_index, expand or isLocationExpanded, expand_all or isLocationExpanded)
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

					if (acquire_type_id == private.ACQUIRE_TYPE_IDS.TRAINER or acquire_type_id == private.ACQUIRE_TYPE_IDS.VENDOR or acquire_type_id == private.ACQUIRE_TYPE_IDS.MOB_DROP or acquire_type_id == private.ACQUIRE_TYPE_IDS.QUEST)
							and acquire_type:GetEntity(data_identifier).location == localizedLocationName then
						execute = true
					elseif (acquire_type_id == private.ACQUIRE_TYPE_IDS.WORLD_EVENT or acquire_type_id == private.ACQUIRE_TYPE_IDS.CUSTOM or acquire_type_id == private.ACQUIRE_TYPE_IDS.DISCOVERY)
							and acquire_type:GetEntity(data_identifier).location == localizedLocationName then
						hide_acquire_type = true
						execute = true
					elseif acquire_type_id == private.ACQUIRE_TYPE_IDS.REPUTATION then
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
        local currentProfession = private.CurrentProfession
        local localizedProfessionName = currentProfession:LocalizedName()
		local professionRecipes = currentProfession.Recipes

		self[localizedProfessionName .. " expanded"] = self[localizedProfessionName .. " expanded"] or {}

		private.SortRecipeList(professionRecipes)

		local sorted_recipes = addon.sorted_recipes
		local recipe_count = 0
		local insert_index = 1

		for i = 1, #sorted_recipes do
			local recipe = professionRecipes[sorted_recipes[i]]

			if recipe and recipe:HasState("VISIBLE") and MainPanel.search_editbox:MatchesRecipe(recipe) then
				local listEntry = CreateListEntry("header", nil, recipe)
				listEntry:SetText(recipe:GetDisplayName())

				recipe_count = recipe_count + 1

				local isRecipeExpanded = self[localizedProfessionName .. " expanded"][recipe]
				insert_index = MainPanel.list_frame:InsertEntry(listEntry, insert_index, isRecipeExpanded or expand_mode, isRecipeExpanded or expand_mode)
			else
				self[localizedProfessionName .. " expanded"][recipe] = nil
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
