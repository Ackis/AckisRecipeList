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
local F = private.filter_flags
local A = private.acquire_types
local Q = private.item_qualities
local REP = private.rep_levels
local FAC = private.faction_ids
local V = private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitFirstAid()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 3273, genesis, quality)
	end

	private:InitializeFirstAidTrainers()

	local recipe

	-- Linen Bandage -- 3275
	recipe = AddRecipe(3275, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(1251)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Heavy Linen Bandage -- 3276
	recipe = AddRecipe(3276, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2581)
	recipe:SetSkillLevels(40, 40, 50, 75, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Wool Bandage -- 3277
	recipe = AddRecipe(3277, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3530)
	recipe:SetSkillLevels(80, 80, 80, 115, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Wool Bandage -- 3278
	recipe = AddRecipe(3278, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3531)
	recipe:SetSkillLevels(115, 115, 115, 150, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Silk Bandage -- 7928
	recipe = AddRecipe(7928, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6450)
	recipe:SetSkillLevels(150, 150, 150, 180, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Silk Bandage -- 7929
	recipe = AddRecipe(7929, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16112)
	recipe:SetCraftedItemID(6451)
	recipe:SetSkillLevels(180, 180, 180, 210, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Anti-Venom -- 7934
	recipe = AddRecipe(7934, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6452)
	recipe:SetSkillLevels(80, 80, 80, 115, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Strong Anti-Venom -- 7935
	recipe = AddRecipe(7935, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6454)
	recipe:SetCraftedItemID(6453)
	recipe:SetSkillLevels(130, 130, 130, 165, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mageweave Bandage -- 10840
	recipe = AddRecipe(10840, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16113)
	recipe:SetCraftedItemID(8544)
	recipe:SetSkillLevels(210, 210, 210, 240, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Mageweave Bandage -- 10841
	recipe = AddRecipe(10841, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8545)
	recipe:SetSkillLevels(240, 240, 240, 270, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Runecloth Bandage -- 18629
	recipe = AddRecipe(18629, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(14529)
	recipe:SetSkillLevels(260, 260, 260, 290, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Runecloth Bandage -- 18630
	recipe = AddRecipe(18630, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(14530)
	recipe:SetSkillLevels(290, 290, 290, 320, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Powerful Anti-Venom -- 23787
	recipe = AddRecipe(23787, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19442)
	recipe:SetCraftedItemID(19440)
	recipe:SetSkillLevels(300, 300, 300, 330, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Netherweave Bandage -- 27032
	recipe = AddRecipe(27032, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21992)
	recipe:SetCraftedItemID(21990)
	recipe:SetSkillLevels(300, 300, 330, 347, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Netherweave Bandage -- 27033
	recipe = AddRecipe(27033, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21993)
	recipe:SetCraftedItemID(21991)
	recipe:SetSkillLevels(330, 330, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Frostweave Bandage -- 45545
	recipe = AddRecipe(45545, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34721)
	recipe:SetSkillLevels(350, 350, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Frostweave Bandage -- 45546
	recipe = AddRecipe(45546, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(39152)
	recipe:SetCraftedItemID(34722)
	recipe:SetSkillLevels(400, 400, 400, 430, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddTrainer(2798, 4211, 4591, 5759, 5939, 5943, 19478, 26956, 28706, 29233, 33589, 33621, 45540, 49879)
	recipe:AddWorldDrop("Northrend")

	-- Embersilk Bandage -- 74556
	recipe = AddRecipe(74556, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(34722)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Embersilk Bandage -- 74557
	recipe = AddRecipe(74557, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(53050)
	recipe:SetSkillLevels(475, 475, 485, 505, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Field Bandage: Dense Embersilk -- 74558
	recipe = AddRecipe(74558, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(53051)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Dense Embersilk Bandage -- 88893
	recipe = AddRecipe(88893, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(53051)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	self.InitFirstAid = nil
end
