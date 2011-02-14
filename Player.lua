-------------------------------------------------------------------------------
-- Player.lua
-- Player functions and data for AckisRecipeList.
-------------------------------------------------------------------------------
-- File date: @file-date-iso@
-- File hash: @file-abbreviated-hash@
-- Project hash: @project-abbreviated-hash@
-- Project version: @project-version@
-------------------------------------------------------------------------------
-- Please see http://www.wowace.com/addons/arl/ for more information.
-------------------------------------------------------------------------------
-- This source code is released under All Rights Reserved.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local table = _G.table

local bit = _G.bit

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
local L			= LibStub("AceLocale-3.1"):GetLocale(MODNAME)

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

			if not player_rep[rep_name] or player_rep[rep_name] < rep_level then
				has_faction = false
			else
				has_faction = true
				break
			end
		end
	end
	return has_faction
end

function Player:HasRecipeFaction(recipe)
	local flagged_horde = recipe:IsFlagged("common1", "HORDE")
	local flagged_alliance = recipe:IsFlagged("common1", "ALLIANCE")

	if self.faction == BFAC["Alliance"] and flagged_horde and not flagged_alliance then
		return false
	elseif self.faction == BFAC["Horde"] and flagged_alliance and not flagged_horde then
		return false
	end
	return true
end

do
	local known_professions = {
		["prof1"]	= false,
		["prof2"]	= false,
		--["archaeology"]	= false,		-- return value for GetProfessions(), it's just not used in arl
		["fishing"]	= false,
		["cooking"]	= false,
		["firstaid"]	= false,
	}

	-- Sets the player's professions. Used when the AddOn initializes and when a profession has been learned or unlearned.
	function Player:SetProfessions()
		local profession_list = self.professions

		for i in pairs(profession_list) do
			profession_list[i] = false
		end
		local known = known_professions

		known.prof1, known.prof2, known.archaeology, known.fishing, known.cooking, known.firstaid = GetProfessions()

		for profession, index in pairs(known_professions) do
			if index then
				local name, icon, rank, maxrank, numspells, spelloffset, skillline = GetProfessionInfo(index)

				if name == private.mining_name then
					name = private.professions["Smelting"]
				end

				if profession_list[name] == false then
					profession_list[name] = true
				end
			end
		end
	end
end	-- do-block
