--[[
************************************************************************
Runeforging.lua
Runeforging data for all of Ackis Recipe List
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]] --

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub	= _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.FILTER_IDS
local A = private.ACQUIRE_TYPES
local Q = private.ITEM_QUALITIES
local V = private.GAME_VERSIONS

-------------------------------------------------------------------------------
-- Initialize!
-------------------------------------------------------------------------------
function addon:InitRuneforging()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 53428, genesis, quality)
	end

	private:InitializeRuneforgingTrainers()

	local recipe

	-- Rune of Swordshattering -- 53323
	recipe = AddRecipe(53323, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(63, 63, 63, 63, 63)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.PVP)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Lichbane -- 53331
	recipe = AddRecipe(53331, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(60, 60, 60, 60, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.DPS)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Cinderglacier -- 53341
	recipe = AddRecipe(53341, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(55, 55, 55, 55, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.DPS)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Spellshattering -- 53342
	recipe = AddRecipe(53342, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(57, 57, 57, 57, 57)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.PVP)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Razorice -- 53343
	recipe = AddRecipe(53343, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(55, 55, 55, 55, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.DPS)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of the Fallen Crusader -- 53344
	recipe = AddRecipe(53344, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(70, 70, 70, 70, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.DPS)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Swordbreaking -- 54446
	recipe = AddRecipe(54446, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(63, 63, 63, 63, 63)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.PVP)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Spellbreaking -- 54447
	recipe = AddRecipe(54447, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(57, 57, 57, 57, 57)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.PVP)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of the Stoneskin Gargoyle -- 62158
	recipe = AddRecipe(62158, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(72, 72, 72, 72, 72)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.TANK)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of the Nerubian Carapace -- 70164
	recipe = AddRecipe(70164, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(72, 72, 72, 72, 72)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND, F.TANK)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	self.InitRuneforging = nil
end
