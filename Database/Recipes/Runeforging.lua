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
-- AddOn namespace.
-------------------------------------------------------------------------------
local MODNAME = "Ackis Recipe List"
local addon = LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L = LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.filter_flags
local A = private.acquire_types
local Q = private.item_qualities
local V = private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitRuneforging()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 53428, genesis, quality)
	end

	private:InitializeRuneforgingTrainers()

	local recipe

	-- Rune of Swordshattering -- 53323
	recipe = AddRecipe(53323, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Lichbane -- 53331
	recipe = AddRecipe(53331, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Cinderglacier -- 53341
	recipe = AddRecipe(53341, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Spellshattering -- 53342
	recipe = AddRecipe(53342, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Razorice -- 53343
	recipe = AddRecipe(53343, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of the Fallen Crusader -- 53344
	recipe = AddRecipe(53344, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Swordbreaking -- 54446
	recipe = AddRecipe(54446, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of Spellbreaking -- 54447
	recipe = AddRecipe(54447, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of the Stoneskin Gargoyle -- 62158
	recipe = AddRecipe(62158, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	-- Rune of the Nerubian Carapace -- 70164
	recipe = AddRecipe(70164, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 1, 1, 1)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DK, F.TWO_HAND)
	recipe:AddTrainer(29194, 29195, 29196, 31084)

	self.InitRuneforging = nil
end
