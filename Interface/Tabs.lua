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
-- Constants
-------------------------------------------------------------------------------
local ORDERED_PROFESSIONS = private.ORDERED_PROFESSIONS

local A = private.ACQUIRE_TYPES

local frame_meta = { __index = _G.CreateFrame("Button") }
local tab_prototype = _G.setmetatable({}, frame_meta)
local tab_meta = { __index = tab_prototype }

-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local CreateListEntry = private.CreateListEntry
local SetTextColor = private.SetTextColor

-------------------------------------------------------------------------------
-- Helpers
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
		self[field][private.ACQUIRE_NAMES[entry.acquire_id]] = expanded or nil
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

function private.InitializeTabs()
	local MainPanel = addon.Frame

	local AcquisitionTab = CreateTab(1, L["Acquisition"], "TOPLEFT", MainPanel, "BOTTOMLEFT", 4, 81)
	local LocationTab = CreateTab(2, L["Location"], "LEFT", AcquisitionTab, "RIGHT", -14, 0)
	local RecipesTab = CreateTab(3, _G.TRADESKILL_SERVICE_LEARN, "LEFT", LocationTab, "RIGHT", -14, 0)

	-- Used for Location and Acquisition sort - since many recipes have multiple locations/acquire types it is
	-- necessary to ensure each is counted only once.
	local recipe_registry = {}

	local function FactionTally(source_data, unit_list, location)
		local good, bad = 0, 0

		for id_num in pairs(source_data) do
			local unit_faction = unit_list[id_num].faction

			if not location or unit_list[id_num].location == location then
				if not unit_faction or unit_faction == private.Player.faction or unit_faction == "Neutral" then
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
		local recipe_count = 0
		local insert_index = 1

		table.wipe(recipe_registry)

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
				sorted_acquires[#sorted_acquires + 1] = acquire_name
			end
			table.sort(sorted_acquires, Sort_Acquisition)
		end
		local prof_name = ORDERED_PROFESSIONS[MainPanel.current_profession]
		local profession_recipes = private.profession_recipe_list[prof_name]

		self[prof_name .. " expanded"] = self[prof_name .. " expanded"] or {}

		for index = 1, #sorted_acquires do
			local acquire_type = sorted_acquires[index]
			local count = 0

			-- Check to see if any recipes for this acquire type will be shown - otherwise, don't show the type in the list.
			for spell_id, affiliation in pairs(private.acquire_list[acquire_type].recipes) do
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
				local acquire_string = private.ACQUIRE_STRINGS[acquire_type]:lower():gsub("_", "")
				local color_table = private.CATEGORY_COLORS[acquire_string]
				local is_expanded = self[prof_name .. " expanded"][private.ACQUIRE_NAMES[acquire_type]]

				local entry = CreateListEntry("header")
				entry:SetAcquireID(acquire_type)
				entry:SetText("%s (%d)",
					SetTextColor(color_table and color_table.hex or "ffffff", private.ACQUIRE_NAMES[acquire_type]),
					count
				)

				insert_index = MainPanel.list_frame:InsertEntry(entry, insert_index, is_expanded or expand_mode, is_expanded or expand_mode)
			else
				self[prof_name .. " expanded"][private.ACQUIRE_NAMES[acquire_type]] = nil
			end
		end
		return recipe_count
	end

	function LocationTab:Initialize(expand_mode)
		local search_box = MainPanel.search_editbox

		local recipe_count = 0
		local insert_index = 1

		table.wipe(recipe_registry)

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

	MainPanel.tabs = {
		AcquisitionTab,
		LocationTab,
		RecipesTab,
	}

	private.InitializeTabs = nil
end
