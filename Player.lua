-------------------------------------------------------------------------------
-- Player.lua
-- Player functions and data for AckisRecipeList.
-------------------------------------------------------------------------------
-- File date: @file-date-iso@
-- File revision: @file-revision@
-- Project revision: @project-revision@
-- Project version: @project-version@
-------------------------------------------------------------------------------
-- Please see http://www.wowace.com/addons/arl/ for more information.
-------------------------------------------------------------------------------
-- This source code is released under All Rights Reserved.
-------------------------------------------------------------------------------
--- **AckisRecipeList** provides an interface for scanning professions for missing recipes.
-- There are a set of functions which allow you make use of the ARL database outside of ARL.
-- ARL supports all professions currently in World of Warcraft 3.3.2
-- @class file
-- @name Player.lua
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local table = _G.table

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- Localized Blizzard API.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local LibStub = LibStub

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local private		= select(2, ...)

local Player		= private.Player

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local A = private.acquire_types
local F = private.filter_flags

local A_MAX = 9

-------------------------------------------------------------------------------
-- Variables
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
-- Marks all exclusions in the recipe database to not be displayed, updating the
-- player's known and unknown counts.
function Player:MarkExclusions()
	local exclusion_list = addon.db.profile.exclusionlist
	local ignored = not addon.db.profile.ignoreexclusionlist
	local recipe_list = private.recipe_list
	local profession = self.current_prof
	local known_count = 0
	local unknown_count = 0

	for spell_id in pairs(exclusion_list) do
		local recipe = recipe_list[spell_id]

		if recipe then
			if recipe.is_known and recipe.profession == profession then
				known_count = known_count + 1
			elseif recipe_profession == profession then
				unknown_count = unknown_count + 1
			end
		end
	end
	self.excluded_recipes_known = known_count
	self.excluded_recipes_unknown = unknown_count
end

function Player:HasProperRepLevel(rep_data)
	if not rep_data then
		return true
	end
	local is_alliance = Player.faction == BFAC["Alliance"]
	local player_rep = Player["Reputation"]
	local FAC = private.faction_ids
	local has_faction = true

	for rep_id, rep_info in pairs(rep_data) do
		for rep_level in pairs(rep_info) do
			if rep_id == FAC.HONOR_HOLD or rep_id == FAC.THRALLMAR then
				rep_id = is_alliance and FAC.HONOR_HOLD or FAC.THRALLMAR
			elseif rep_id == FAC.MAGHAR or rep_id == FAC.KURENAI then
				rep_id = is_alliance and FAC.KURENAI or FAC.MAGHAR
			end
			local rep_name = private.reputation_list[rep_id].name

			if player_rep[rep_name] and player_rep[rep_name] < rep_level then
				has_faction = false
			else
				has_faction = true
				break
			end
		end
	end
	return has_faction
end

function Player:IsCorrectFaction(recipe_flags)
	if self.faction == BFAC["Alliance"] and recipe_flags[F.HORDE] and not recipe_flags[F.ALLIANCE] then
		return false
	elseif self.faction == BFAC["Horde"] and recipe_flags[F.ALLIANCE] and not recipe_flags[F.HORDE] then
		return false
	end
	return true
end

-- Sets the player's professions. Used when the AddOn initializes and when a profession has been learned or unlearned.
-- TODO: Make the AddOn actually detect when a profession is learned/unlearned, then call this function. -Torhal
function Player:SetProfessions()
	local profession_list = self.professions

	for i in pairs(profession_list) do
		profession_list[i] = false
	end

	for index = 1, 25, 1 do
		local spell_name = GetSpellName(index, BOOKTYPE_SPELL)

		if not spell_name or index == 25 then
			break
		end

		-- Check for false in the profession_list - a nil entry means we don't care about the spell.
		if profession_list[spell_name] == false then
			profession_list[spell_name] = true
		end
	end
end

do
	local GetNumFactions = GetNumFactions
	local GetFactionInfo = GetFactionInfo
	local CollapseFactionHeader = CollapseFactionHeader
	local ExpandFactionHeader = ExpandFactionHeader
	local rep_list = {}

	-- Determines if the player can learn a reputation recipe.
	function Player:SetReputationLevels()
		table.wipe(rep_list)

		-- Number of factions before we expand
		local num_factions = GetNumFactions()

		-- Lets expand all the headers
		for i = num_factions, 1, -1 do
			local name, _, _, _, _, _, _, _, _, isCollapsed = GetFactionInfo(i)

			if isCollapsed then
				ExpandFactionHeader(i)
				rep_list[name] = true
			end
		end

		-- Number of factions with everything expanded
		num_factions = GetNumFactions()

		-- Get the rep levels
		for i = 1, num_factions, 1 do
			local name, _, replevel = GetFactionInfo(i)

			-- If the rep is greater than neutral
			if replevel > 4 then
				-- We use levels of 0, 1, 2, 3, 4 internally for reputation levels, make it correspond here
				self["Reputation"][name] = replevel - 4
			end
		end

		-- Collapse the headers again
		for i = num_factions, 1, -1 do
			local name = GetFactionInfo(i)

			if rep_list[name] then
				CollapseFactionHeader(i)
			end
		end
	end
end	-- do block
