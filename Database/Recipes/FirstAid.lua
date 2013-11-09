--[[
************************************************************************
FirstAid.lua
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
local REP = private.REP_LEVELS
local FAC = private.FACTION_IDS
local V = private.GAME_VERSIONS
local Z = private.ZONE_NAMES

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitFirstAid()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, private.PROFESSION_SPELL_IDS.FIRSTAID, genesis, quality)
	end

	private:InitializeFirstAidTrainers()

	local recipe

	-------------------------------------------------------------------------------
	-- Classic.
	-------------------------------------------------------------------------------
	-- Linen Bandage -- 3275
	recipe = AddRecipe(3275, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:SetCraftedItem(1251, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Heavy Linen Bandage -- 3276
	recipe = AddRecipe(3276, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(40, 40, 50, 75, 100)
	recipe:SetCraftedItem(2581, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Wool Bandage -- 3277
	recipe = AddRecipe(3277, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(80, 80, 80, 115, 150)
	recipe:SetCraftedItem(3530, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Wool Bandage -- 3278
	recipe = AddRecipe(3278, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(115, 115, 115, 150, 185)
	recipe:SetCraftedItem(3531, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Silk Bandage -- 7928
	recipe = AddRecipe(7928, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 150, 180, 210)
	recipe:SetCraftedItem(6450, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Silk Bandage -- 7929
	recipe = AddRecipe(7929, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(180, 180, 180, 210, 240)
	recipe:SetRecipeItem(16112, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6451, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Anti-Venom -- 7934
	recipe = AddRecipe(7934, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(80, 80, 80, 115, 150)
	recipe:SetCraftedItem(6452, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Strong Anti-Venom -- 7935
	recipe = AddRecipe(7935, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(130, 130, 130, 165, 200)
	recipe:SetRecipeItem(6454, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6453, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Mageweave Bandage -- 10840
	recipe = AddRecipe(10840, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(210, 210, 210, 240, 270)
	recipe:SetRecipeItem(16113, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(8544, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Mageweave Bandage -- 10841
	recipe = AddRecipe(10841, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(240, 240, 240, 270, 300)
	recipe:SetCraftedItem(8545, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Runecloth Bandage -- 18629
	recipe = AddRecipe(18629, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(260, 260, 260, 290, 320)
	recipe:SetCraftedItem(14529, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Runecloth Bandage -- 18630
	recipe = AddRecipe(18630, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(290, 290, 290, 320, 350)
	recipe:SetCraftedItem(14530, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Powerful Anti-Venom -- 23787
	recipe = AddRecipe(23787, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 330, 360)
	recipe:SetRecipeItem(19442, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(19440, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-------------------------------------------------------------------------------
	-- The Burning Crusade.
	-------------------------------------------------------------------------------
	-- Netherweave Bandage -- 27032
	recipe = AddRecipe(27032, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 330, 347, 365)
	recipe:SetRecipeItem(21992, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21990, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Netherweave Bandage -- 27033
	recipe = AddRecipe(27033, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(330, 330, 360, 367, 375)
	recipe:SetRecipeItem(21993, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21991, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-------------------------------------------------------------------------------
	-- Wrath of the Lich King.
	-------------------------------------------------------------------------------
	-- Frostweave Bandage -- 45545
	recipe = AddRecipe(45545, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 392, 410)
	recipe:SetCraftedItem(34721, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Frostweave Bandage -- 45546
	recipe = AddRecipe(45546, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(390, 390, 400, 405, 410)
	recipe:SetRecipeItem(39152, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(34722, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16731, 17214, 18990, 19478, 23734, 26956, 28706, 29233, 33589, 33621, 45540, 49879, 56796, 59077, 59619, 64482, 66222, 66357)
	recipe:AddWorldDrop(Z.NORTHREND)

	-------------------------------------------------------------------------------
	-- Cataclysm.
	-------------------------------------------------------------------------------
	-- Embersilk Bandage -- 74556
	recipe = AddRecipe(74556, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(53049, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Embersilk Bandage -- 74557
	recipe = AddRecipe(74557, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 485, 505, 525)
	recipe:SetCraftedItem(53050, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Field Bandage: Dense Embersilk -- 74558
	recipe = AddRecipe(74558, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(53051, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Dense Embersilk Bandage -- 88893
	recipe = AddRecipe(88893, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(53051, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-------------------------------------------------------------------------------
	-- Mists of Pandaria.
	-------------------------------------------------------------------------------
	-- Windwool Bandage -- 102697
	recipe = AddRecipe(102697, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Windwool Bandage -- 102698
	recipe = AddRecipe(102698, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 605, 610)
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	-- Heavy Windwool Bandage -- 102699
	recipe = AddRecipe(102699, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetPreviousRankID(102698)
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(447, 686, 2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574, 56796, 59077, 59619, 64482, 66222, 66357)

	self.InitFirstAid = nil
end
