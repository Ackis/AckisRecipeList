--[[
************************************************************************
Blacksmithing.lua
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

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitBlacksmithing()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 2018, genesis, quality)
	end

	private:InitializeBlacksmithingTrainers()

	local recipe

	-- Rough Sharpening Stone -- 2660
	recipe = AddRecipe(2660, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2862)
	recipe:SetSkillLevels(1, 1, 15, 35, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Copper Chain Belt -- 2661
	recipe = AddRecipe(2661, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2851)
	recipe:SetSkillLevels(35, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Copper Chain Pants -- 2662
	recipe = AddRecipe(2662, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2852)
	recipe:SetSkillLevels(1, 1, 50, 70, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Copper Bracers -- 2663
	recipe = AddRecipe(2663, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2853)
	recipe:SetSkillLevels(1, 1, 20, 40, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Runed Copper Bracers -- 2664
	recipe = AddRecipe(2664, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2854)
	recipe:SetSkillLevels(90, 90, 115, 127, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Coarse Sharpening Stone -- 2665
	recipe = AddRecipe(2665, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2863)
	recipe:SetSkillLevels(65, 65, 65, 72, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Runed Copper Belt -- 2666
	recipe = AddRecipe(2666, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2857)
	recipe:SetSkillLevels(70, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Runed Copper Breastplate -- 2667
	recipe = AddRecipe(2667, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2881)
	recipe:SetCraftedItemID(2864)
	recipe:SetSkillLevels(80, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rough Bronze Leggings -- 2668
	recipe = AddRecipe(2668, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2865)
	recipe:SetSkillLevels(105, 105, 145, 160, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Rough Bronze Cuirass -- 2670
	recipe = AddRecipe(2670, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2866)
	recipe:SetSkillLevels(105, 105, 145, 160, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Patterned Bronze Bracers -- 2672
	recipe = AddRecipe(2672, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2868)
	recipe:SetSkillLevels(120, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Silvered Bronze Breastplate -- 2673
	recipe = AddRecipe(2673, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5578)
	recipe:SetCraftedItemID(2869)
	recipe:SetSkillLevels(130, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Sharpening Stone -- 2674
	recipe = AddRecipe(2674, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2871)
	recipe:SetSkillLevels(125, 125, 125, 132, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Shining Silver Breastplate -- 2675
	recipe = AddRecipe(2675, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2870)
	recipe:SetSkillLevels(145, 145, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Copper Mace -- 2737
	recipe = AddRecipe(2737, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2844)
	recipe:SetSkillLevels(15, 15, 55, 75, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Copper Axe -- 2738
	recipe = AddRecipe(2738, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2845)
	recipe:SetSkillLevels(20, 20, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Copper Shortsword -- 2739
	recipe = AddRecipe(2739, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2847)
	recipe:SetSkillLevels(25, 25, 65, 85, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Bronze Mace -- 2740
	recipe = AddRecipe(2740, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2848)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Bronze Axe -- 2741
	recipe = AddRecipe(2741, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2849)
	recipe:SetSkillLevels(115, 115, 145, 160, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Bronze Shortsword -- 2742
	recipe = AddRecipe(2742, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2850)
	recipe:SetSkillLevels(120, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Rough Weightstone -- 3115
	recipe = AddRecipe(3115, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3239)
	recipe:SetSkillLevels(1, 1, 15, 35, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Coarse Weightstone -- 3116
	recipe = AddRecipe(3116, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3240)
	recipe:SetSkillLevels(65, 65, 65, 72, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Heavy Weightstone -- 3117
	recipe = AddRecipe(3117, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3241)
	recipe:SetSkillLevels(125, 125, 125, 132, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Heavy Copper Broadsword -- 3292
	recipe = AddRecipe(3292, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3487)
	recipe:SetSkillLevels(95, 95, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Copper Battle Axe -- 3293
	recipe = AddRecipe(3293, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3488)
	recipe:SetSkillLevels(35, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Thick War Axe -- 3294
	recipe = AddRecipe(3294, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3489)
	recipe:SetSkillLevels(70, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Deadly Bronze Poniard -- 3295
	recipe = AddRecipe(3295, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2883)
	recipe:SetCraftedItemID(3490)
	recipe:SetSkillLevels(125, 125, 155, 170, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Bronze Mace -- 3296
	recipe = AddRecipe(3296, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3491)
	recipe:SetSkillLevels(130, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Mighty Iron Hammer -- 3297
	recipe = AddRecipe(3297, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3608)
	recipe:SetCraftedItemID(3492)
	recipe:SetSkillLevels(145, 145, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Copper Chain Boots -- 3319
	recipe = AddRecipe(3319, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3469)
	recipe:SetSkillLevels(20, 20, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Rough Grinding Stone -- 3320
	recipe = AddRecipe(3320, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3470)
	recipe:SetSkillLevels(25, 25, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Copper Chain Vest -- 3321
	recipe = AddRecipe(3321, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3609)
	recipe:SetCraftedItemID(3471)
	recipe:SetSkillLevels(35, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runed Copper Gauntlets -- 3323
	recipe = AddRecipe(3323, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3472)
	recipe:SetSkillLevels(40, 40, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Runed Copper Pants -- 3324
	recipe = AddRecipe(3324, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3473)
	recipe:SetSkillLevels(45, 45, 85, 105, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Gemmed Copper Gauntlets -- 3325
	recipe = AddRecipe(3325, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3610)
	recipe:SetCraftedItemID(3474)
	recipe:SetSkillLevels(60, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Coarse Grinding Stone -- 3326
	recipe = AddRecipe(3326, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3478)
	recipe:SetSkillLevels(75, 75, 75, 87, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Rough Bronze Shoulders -- 3328
	recipe = AddRecipe(3328, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3480)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Silvered Bronze Shoulders -- 3330
	recipe = AddRecipe(3330, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2882)
	recipe:SetCraftedItemID(3481)
	recipe:SetSkillLevels(125, 125, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Silvered Bronze Boots -- 3331
	recipe = AddRecipe(3331, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3482)
	recipe:SetSkillLevels(130, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Silvered Bronze Gauntlets -- 3333
	recipe = AddRecipe(3333, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3483)
	recipe:SetSkillLevels(135, 135, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Green Iron Boots -- 3334
	recipe = AddRecipe(3334, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3611)
	recipe:SetCraftedItemID(3484)
	recipe:SetSkillLevels(145, 145, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Gauntlets -- 3336
	recipe = AddRecipe(3336, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3612)
	recipe:SetCraftedItemID(3485)
	recipe:SetSkillLevels(150, 150, 180, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Grinding Stone -- 3337
	recipe = AddRecipe(3337, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3486)
	recipe:SetSkillLevels(125, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Big Bronze Knife -- 3491
	recipe = AddRecipe(3491, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3848)
	recipe:SetSkillLevels(105, 105, 135, 150, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Hardened Iron Shortsword -- 3492
	recipe = AddRecipe(3492, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12162)
	recipe:SetCraftedItemID(3849)
	recipe:SetSkillLevels(160, 160, 185, 197, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddLimitedVendor(2843, 1, 3356, 1, 5512, 1, 45549, 1)

	-- Jade Serpentblade -- 3493
	recipe = AddRecipe(3493, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3866)
	recipe:SetCraftedItemID(3850)
	recipe:SetSkillLevels(175, 175, 200, 212, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Solid Iron Maul -- 3494
	recipe = AddRecipe(3494, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10858)
	recipe:SetCraftedItemID(3851)
	recipe:SetSkillLevels(155, 155, 180, 192, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TWO_HAND, F.MACE)
	recipe:AddLimitedVendor(1471, 1, 8878, 1, 9179, 1, 26081, 1)

	-- Golden Iron Destroyer -- 3495
	recipe = AddRecipe(3495, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3867)
	recipe:SetCraftedItemID(3852)
	recipe:SetSkillLevels(170, 170, 195, 207, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Moonsteel Broadsword -- 3496
	recipe = AddRecipe(3496, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12163)
	recipe:SetCraftedItemID(3853)
	recipe:SetSkillLevels(180, 180, 205, 217, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TWO_HAND, F.SWORD)
	recipe:AddLimitedVendor(2482, 1)

	-- Frost Tiger Blade -- 3497
	recipe = AddRecipe(3497, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3868)
	recipe:SetCraftedItemID(3854)
	recipe:SetSkillLevels(200, 200, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TWO_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Massive Iron Axe -- 3498
	recipe = AddRecipe(3498, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12164)
	recipe:SetCraftedItemID(3855)
	recipe:SetSkillLevels(185, 185, 210, 222, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddLimitedVendor(1146, 1, 2483, 1)

	-- Shadow Crescent Axe -- 3500
	recipe = AddRecipe(3500, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3869)
	recipe:SetCraftedItemID(3856)
	recipe:SetSkillLevels(200, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Bracers -- 3501
	recipe = AddRecipe(3501, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3835)
	recipe:SetSkillLevels(165, 165, 190, 202, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Green Iron Helm -- 3502
	recipe = AddRecipe(3502, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3836)
	recipe:SetSkillLevels(170, 170, 195, 207, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Golden Scale Coif -- 3503
	recipe = AddRecipe(3503, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6047)
	recipe:SetCraftedItemID(3837)
	recipe:SetSkillLevels(190, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddLimitedVendor(5411, 1)

	-- Green Iron Shoulders -- 3504
	recipe = AddRecipe(3504, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3870)
	recipe:SetCraftedItemID(3840)
	recipe:SetSkillLevels(160, 160, 185, 197, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Golden Scale Shoulders -- 3505
	recipe = AddRecipe(3505, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(3871)
	recipe:SetCraftedItemID(3841)
	recipe:SetSkillLevels(175, 175, 200, 212, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Leggings -- 3506
	recipe = AddRecipe(3506, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3842)
	recipe:SetSkillLevels(155, 155, 180, 192, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Golden Scale Leggings -- 3507
	recipe = AddRecipe(3507, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3872)
	recipe:SetCraftedItemID(3843)
	recipe:SetSkillLevels(170, 170, 195, 207, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Hauberk -- 3508
	recipe = AddRecipe(3508, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3844)
	recipe:SetSkillLevels(180, 180, 205, 217, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Golden Scale Cuirass -- 3511
	recipe = AddRecipe(3511, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3873)
	recipe:SetCraftedItemID(3845)
	recipe:SetSkillLevels(195, 195, 220, 232, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Polished Steel Boots -- 3513
	recipe = AddRecipe(3513, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3874)
	recipe:SetCraftedItemID(3846)
	recipe:SetSkillLevels(185, 185, 210, 222, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Golden Scale Boots -- 3515
	recipe = AddRecipe(3515, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(3875)
	recipe:SetCraftedItemID(3847)
	recipe:SetSkillLevels(200, 200, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Pearl-handled Dagger -- 6517
	recipe = AddRecipe(6517, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5540)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Iridescent Hammer -- 6518
	recipe = AddRecipe(6518, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5543)
	recipe:SetCraftedItemID(5541)
	recipe:SetSkillLevels(140, 140, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Iron Shield Spike -- 7221
	recipe = AddRecipe(7221, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6044)
	recipe:SetCraftedItemID(6042)
	recipe:SetSkillLevels(150, 150, 180, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Iron Counterweight -- 7222
	recipe = AddRecipe(7222, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6045)
	recipe:SetCraftedItemID(6043)
	recipe:SetSkillLevels(165, 165, 190, 202, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.AXE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Golden Scale Bracers -- 7223
	recipe = AddRecipe(7223, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6040)
	recipe:SetSkillLevels(185, 185, 210, 222, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Steel Weapon Chain -- 7224
	recipe = AddRecipe(7224, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6046)
	recipe:SetCraftedItemID(6041)
	recipe:SetSkillLevels(190, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Copper Maul -- 7408
	recipe = AddRecipe(7408, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6214)
	recipe:SetSkillLevels(65, 65, 105, 125, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Rough Bronze Boots -- 7817
	recipe = AddRecipe(7817, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6350)
	recipe:SetSkillLevels(95, 95, 125, 140, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Silver Rod -- 7818
	recipe = AddRecipe(7818, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6338)
	recipe:SetSkillLevels(100, 100, 105, 107, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Ironforge Breastplate -- 8367
	recipe = AddRecipe(8367, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6735)
	recipe:SetCraftedItemID(6731)
	recipe:SetSkillLevels(100, 100, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(1618)

	-- Iron Buckle -- 8768
	recipe = AddRecipe(8768, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7071)
	recipe:SetSkillLevels(150, 150, 150, 152, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Copper Dagger -- 8880
	recipe = AddRecipe(8880, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7166)
	recipe:SetSkillLevels(30, 30, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Barbaric Iron Shoulders -- 9811
	recipe = AddRecipe(9811, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7978)
	recipe:SetCraftedItemID(7913)
	recipe:SetSkillLevels(160, 160, 185, 197, 210)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2752)

	-- Barbaric Iron Breastplate -- 9813
	recipe = AddRecipe(9813, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7979)
	recipe:SetCraftedItemID(7914)
	recipe:SetSkillLevels(160, 160, 185, 197, 210)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOP, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2751)

	-- Barbaric Iron Helm -- 9814
	recipe = AddRecipe(9814, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7980)
	recipe:SetCraftedItemID(7915)
	recipe:SetSkillLevels(175, 175, 200, 212, 225)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2754)

	-- Barbaric Iron Boots -- 9818
	recipe = AddRecipe(9818, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7981)
	recipe:SetCraftedItemID(7916)
	recipe:SetSkillLevels(180, 180, 205, 217, 230)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2753)

	-- Barbaric Iron Gloves -- 9820
	recipe = AddRecipe(9820, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7982)
	recipe:SetCraftedItemID(7917)
	recipe:SetSkillLevels(185, 185, 210, 222, 235)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2755)

	-- Steel Breastplate -- 9916
	recipe = AddRecipe(9916, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7963)
	recipe:SetSkillLevels(200, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Solid Sharpening Stone -- 9918
	recipe = AddRecipe(9918, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7964)
	recipe:SetSkillLevels(200, 200, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Solid Grinding Stone -- 9920
	recipe = AddRecipe(9920, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7966)
	recipe:SetSkillLevels(200, 200, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Solid Weightstone -- 9921
	recipe = AddRecipe(9921, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7965)
	recipe:SetSkillLevels(200, 200, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Heavy Mithril Shoulder -- 9926
	recipe = AddRecipe(9926, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7918)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Heavy Mithril Gauntlet -- 9928
	recipe = AddRecipe(9928, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7919)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Mithril Scale Pants -- 9931
	recipe = AddRecipe(9931, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7920)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Heavy Mithril Pants -- 9933
	recipe = AddRecipe(9933, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7975)
	recipe:SetCraftedItemID(7921)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Steel Plate Helm -- 9935
	recipe = AddRecipe(9935, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7922)
	recipe:SetSkillLevels(215, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Mithril Scale Bracers -- 9937
	recipe = AddRecipe(9937, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7995)
	recipe:SetCraftedItemID(7924)
	recipe:SetSkillLevels(215, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(8161)
	recipe:AddLimitedVendor(8176, 1)

	-- Mithril Shield Spike -- 9939
	recipe = AddRecipe(9939, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(7976)
	recipe:SetCraftedItemID(7967)
	recipe:SetSkillLevels(215, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ornate Mithril Pants -- 9945
	recipe = AddRecipe(9945, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7983)
	recipe:SetCraftedItemID(7926)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ornate Mithril Gloves -- 9950
	recipe = AddRecipe(9950, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7984)
	recipe:SetCraftedItemID(7927)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ornate Mithril Shoulder -- 9952
	recipe = AddRecipe(9952, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7985)
	recipe:SetCraftedItemID(7928)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Truesilver Gauntlets -- 9954
	recipe = AddRecipe(9954, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7938)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Orcish War Leggings -- 9957
	recipe = AddRecipe(9957, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7929)
	recipe:SetSkillLevels(250, 250, 250, 260, 270)
	recipe:AddFilters(F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Heavy Mithril Breastplate -- 9959
	recipe = AddRecipe(9959, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7930)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Mithril Coif -- 9961
	recipe = AddRecipe(9961, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7931)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Mithril Spurs -- 9964
	recipe = AddRecipe(9964, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7989)
	recipe:SetCraftedItemID(7969)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mithril Scale Shoulders -- 9966
	recipe = AddRecipe(9966, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(7991)
	recipe:SetCraftedItemID(7932)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Mithril Boots -- 9968
	recipe = AddRecipe(9968, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7933)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Heavy Mithril Helm -- 9970
	recipe = AddRecipe(9970, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7990)
	recipe:SetCraftedItemID(7934)
	recipe:SetSkillLevels(245, 245, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ornate Mithril Breastplate -- 9972
	recipe = AddRecipe(9972, V.ORIG, Q.UNCOMMON)
	recipe:SetCraftedItemID(7935)
	recipe:SetSkillLevels(260, 260, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Truesilver Breastplate -- 9974
	recipe = AddRecipe(9974, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7939)
	recipe:SetSkillLevels(245, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ornate Mithril Boots -- 9979
	recipe = AddRecipe(9979, V.ORIG, Q.UNCOMMON)
	recipe:SetCraftedItemID(7936)
	recipe:SetSkillLevels(265, 265, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ornate Mithril Helm -- 9980
	recipe = AddRecipe(9980, V.ORIG, Q.UNCOMMON)
	recipe:SetCraftedItemID(7937)
	recipe:SetSkillLevels(265, 265, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Copper Claymore -- 9983
	recipe = AddRecipe(9983, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7955)
	recipe:SetSkillLevels(30, 30, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548, 47418)

	-- Bronze Warhammer -- 9985
	recipe = AddRecipe(9985, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7956)
	recipe:SetSkillLevels(125, 125, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Bronze Greatsword -- 9986
	recipe = AddRecipe(9986, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7957)
	recipe:SetSkillLevels(130, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Bronze Battle Axe -- 9987
	recipe = AddRecipe(9987, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7958)
	recipe:SetSkillLevels(135, 135, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Heavy Mithril Axe -- 9993
	recipe = AddRecipe(9993, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7941)
	recipe:SetSkillLevels(210, 210, 235, 247, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Blue Glittering Axe -- 9995
	recipe = AddRecipe(9995, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7992)
	recipe:SetCraftedItemID(7942)
	recipe:SetSkillLevels(220, 220, 245, 257, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wicked Mithril Blade -- 9997
	recipe = AddRecipe(9997, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8029)
	recipe:SetCraftedItemID(7943)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Big Black Mace -- 10001
	recipe = AddRecipe(10001, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7945)
	recipe:SetSkillLevels(230, 230, 255, 267, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- The Shatterer -- 10003
	recipe = AddRecipe(10003, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7954)
	recipe:SetSkillLevels(235, 235, 260, 272, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Dazzling Mithril Rapier -- 10005
	recipe = AddRecipe(10005, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7993)
	recipe:SetCraftedItemID(7944)
	recipe:SetSkillLevels(240, 240, 265, 277, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Phantom Blade -- 10007
	recipe = AddRecipe(10007, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7961)
	recipe:SetSkillLevels(245, 245, 270, 282, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Runed Mithril Hammer -- 10009
	recipe = AddRecipe(10009, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(8028)
	recipe:SetCraftedItemID(7946)
	recipe:SetSkillLevels(245, 245, 270, 282, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Blight -- 10011
	recipe = AddRecipe(10011, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7959)
	recipe:SetSkillLevels(250, 250, 275, 287, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TWO_HAND, F.POLEARM)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ebon Shiv -- 10013
	recipe = AddRecipe(10013, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(8030)
	recipe:SetCraftedItemID(7947)
	recipe:SetSkillLevels(255, 255, 280, 292, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddVendor(11278)

	-- Truesilver Champion -- 10015
	recipe = AddRecipe(10015, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7960)
	recipe:SetSkillLevels(260, 260, 285, 297, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TWO_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Inlaid Mithril Cylinder -- 11454
	recipe = AddRecipe(11454, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10713)
	recipe:SetCraftedItemID(9060)
	recipe:SetSkillLevels(200, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddCustom("CRAFTED_ENGINEERS")

	-- Golden Scale Gauntlets -- 11643
	recipe = AddRecipe(11643, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9367)
	recipe:SetCraftedItemID(9366)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Silvered Bronze Leggings -- 12259
	recipe = AddRecipe(12259, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10424)
	recipe:SetCraftedItemID(10423)
	recipe:SetSkillLevels(155, 155, 180, 192, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rough Copper Vest -- 12260
	recipe = AddRecipe(12260, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10421)
	recipe:SetSkillLevels(1, 1, 15, 35, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Golden Rod -- 14379
	recipe = AddRecipe(14379, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11128)
	recipe:SetSkillLevels(150, 150, 155, 157, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Truesilver Rod -- 14380
	recipe = AddRecipe(14380, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11144)
	recipe:SetSkillLevels(200, 200, 205, 207, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Dark Iron Pulverizer -- 15292
	recipe = AddRecipe(15292, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(11610)
	recipe:SetCraftedItemID(11608)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TWO_HAND, F.MACE)
	recipe:AddMobDrop(9028)

	-- Dark Iron Mail -- 15293
	recipe = AddRecipe(15293, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11614)
	recipe:SetCraftedItemID(11606)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom("BRD_RANDOM_ROOM")

	-- Dark Iron Sunderer -- 15294
	recipe = AddRecipe(15294, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(11611)
	recipe:SetCraftedItemID(11607)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TWO_HAND, F.AXE)
	recipe:AddMobDrop(9554, 10043)

	-- Dark Iron Shoulders -- 15295
	recipe = AddRecipe(15295, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11615)
	recipe:SetCraftedItemID(11605)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("BRD_RANDOM_ROOM")

	-- Dark Iron Plate -- 15296
	recipe = AddRecipe(15296, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(11612)
	recipe:SetCraftedItemID(11604)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.PLATE)
	recipe:AddMobDrop(9543)

	-- Glinting Steel Dagger -- 15972
	recipe = AddRecipe(15972, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12259)
	recipe:SetSkillLevels(180, 180, 205, 217, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Searing Golden Blade -- 15973
	recipe = AddRecipe(15973, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12261)
	recipe:SetCraftedItemID(12260)
	recipe:SetSkillLevels(190, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dense Grinding Stone -- 16639
	recipe = AddRecipe(16639, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12644)
	recipe:SetSkillLevels(250, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Dense Weightstone -- 16640
	recipe = AddRecipe(16640, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12643)
	recipe:SetSkillLevels(250, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Dense Sharpening Stone -- 16641
	recipe = AddRecipe(16641, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12404)
	recipe:SetSkillLevels(250, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Thorium Armor -- 16642
	recipe = AddRecipe(16642, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12682)
	recipe:SetCraftedItemID(12405)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Belt -- 16643
	recipe = AddRecipe(16643, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12683)
	recipe:SetCraftedItemID(12406)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Bracers -- 16644
	recipe = AddRecipe(16644, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12684)
	recipe:SetCraftedItemID(12408)
	recipe:SetSkillLevels(255, 255, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Radiant Belt -- 16645
	recipe = AddRecipe(16645, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12685)
	recipe:SetCraftedItemID(12416)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Shoulders -- 16646
	recipe = AddRecipe(16646, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12687)
	recipe:SetCraftedItemID(12428)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Imperial Plate Belt -- 16647
	recipe = AddRecipe(16647, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12688)
	recipe:SetCraftedItemID(12424)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Radiant Breastplate -- 16648
	recipe = AddRecipe(16648, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12689)
	recipe:SetCraftedItemID(12415)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Bracers -- 16649
	recipe = AddRecipe(16649, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12690)
	recipe:SetCraftedItemID(12425)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Wildthorn Mail -- 16650
	recipe = AddRecipe(16650, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12691)
	recipe:SetCraftedItemID(12624)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Shield Spike -- 16651
	recipe = AddRecipe(16651, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12692)
	recipe:SetCraftedItemID(12645)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Boots -- 16652
	recipe = AddRecipe(16652, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12693)
	recipe:SetCraftedItemID(12409)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Helm -- 16653
	recipe = AddRecipe(16653, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12694)
	recipe:SetCraftedItemID(12410)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Radiant Gloves -- 16654
	recipe = AddRecipe(16654, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12695)
	recipe:SetCraftedItemID(12418)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fiery Plate Gauntlets -- 16655
	recipe = AddRecipe(16655, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12699)
	recipe:SetCraftedItemID(12631)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Radiant Boots -- 16656
	recipe = AddRecipe(16656, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12697)
	recipe:SetCraftedItemID(12419)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Boots -- 16657
	recipe = AddRecipe(16657, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12700)
	recipe:SetCraftedItemID(12426)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Imperial Plate Helm -- 16658
	recipe = AddRecipe(16658, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12701)
	recipe:SetCraftedItemID(12427)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Radiant Circlet -- 16659
	recipe = AddRecipe(16659, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12702)
	recipe:SetCraftedItemID(12417)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dawnbringer Shoulders -- 16660
	recipe = AddRecipe(16660, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12698)
	recipe:SetCraftedItemID(12625)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Storm Gauntlets -- 16661
	recipe = AddRecipe(16661, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12703)
	recipe:SetCraftedItemID(12632)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(11278)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Leggings -- 16662
	recipe = AddRecipe(16662, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12704)
	recipe:SetCraftedItemID(12414)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Chest -- 16663
	recipe = AddRecipe(16663, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12705)
	recipe:SetCraftedItemID(12422)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Runic Plate Shoulders -- 16664
	recipe = AddRecipe(16664, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12706)
	recipe:SetCraftedItemID(12610)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Runic Plate Boots -- 16665
	recipe = AddRecipe(16665, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12707)
	recipe:SetCraftedItemID(12611)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Demon Forged Breastplate -- 16667
	recipe = AddRecipe(16667, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12696)
	recipe:SetCraftedItemID(12628)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Whitesoul Helm -- 16724
	recipe = AddRecipe(16724, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12711)
	recipe:SetCraftedItemID(12633)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Radiant Leggings -- 16725
	recipe = AddRecipe(16725, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12713)
	recipe:SetCraftedItemID(12420)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runic Plate Helm -- 16726
	recipe = AddRecipe(16726, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12714)
	recipe:SetCraftedItemID(12612)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Helm of the Great Chief -- 16728
	recipe = AddRecipe(16728, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12716)
	recipe:SetCraftedItemID(12636)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lionheart Helm -- 16729
	recipe = AddRecipe(16729, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(12717)
	recipe:SetCraftedItemID(12640)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Leggings -- 16730
	recipe = AddRecipe(16730, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12715)
	recipe:SetCraftedItemID(12429)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Runic Breastplate -- 16731
	recipe = AddRecipe(16731, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12718)
	recipe:SetCraftedItemID(12613)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Runic Plate Leggings -- 16732
	recipe = AddRecipe(16732, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12719)
	recipe:SetCraftedItemID(12614)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Stronghold Gauntlets -- 16741
	recipe = AddRecipe(16741, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(12720)
	recipe:SetCraftedItemID(12639)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchanted Thorium Helm -- 16742
	recipe = AddRecipe(16742, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12725)
	recipe:SetCraftedItemID(12620)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Enchanted Thorium Leggings -- 16744
	recipe = AddRecipe(16744, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12726)
	recipe:SetCraftedItemID(12619)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Enchanted Thorium Breastplate -- 16745
	recipe = AddRecipe(16745, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12727)
	recipe:SetCraftedItemID(12618)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Invulnerable Mail -- 16746
	recipe = AddRecipe(16746, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(12728)
	recipe:SetCraftedItemID(12641)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ornate Thorium Handaxe -- 16969
	recipe = AddRecipe(16969, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12819)
	recipe:SetCraftedItemID(12773)
	recipe:SetSkillLevels(275, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddVendor(11278)

	-- Dawn's Edge -- 16970
	recipe = AddRecipe(16970, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12821)
	recipe:SetCraftedItemID(12774)
	recipe:SetSkillLevels(275, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Huge Thorium Battleaxe -- 16971
	recipe = AddRecipe(16971, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12823)
	recipe:SetCraftedItemID(12775)
	recipe:SetSkillLevels(280, 280, 305, 317, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16724, 16823, 17245, 20124, 20125, 33591, 33609, 33631, 33675, 37072, 44781, 45548)
	recipe:AddVendor(11278)

	-- Enchanted Battlehammer -- 16973
	recipe = AddRecipe(16973, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12824)
	recipe:SetCraftedItemID(12776)
	recipe:SetSkillLevels(280, 280, 305, 317, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.TANK, F.TWO_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blazing Rapier -- 16978
	recipe = AddRecipe(16978, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12825)
	recipe:SetCraftedItemID(12777)
	recipe:SetSkillLevels(280, 280, 305, 317, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Serenity -- 16983
	recipe = AddRecipe(16983, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12827)
	recipe:SetCraftedItemID(12781)
	recipe:SetSkillLevels(285, 285, 310, 322, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddCustom("STRATH_BS_PLANS")

	-- Volcanic Hammer -- 16984
	recipe = AddRecipe(16984, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(12828)
	recipe:SetCraftedItemID(12792)
	recipe:SetSkillLevels(290, 290, 315, 327, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddMobDrop(10119)

	-- Corruption -- 16985
	recipe = AddRecipe(16985, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12830)
	recipe:SetCraftedItemID(12782)
	recipe:SetSkillLevels(290, 290, 315, 327, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.TWO_HAND, F.SWORD)
	recipe:AddCustom("STRATH_BS_PLANS")

	-- Hammer of the Titans -- 16988
	recipe = AddRecipe(16988, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12833)
	recipe:SetCraftedItemID(12796)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddMobDrop(10438)

	-- Arcanite Champion -- 16990
	recipe = AddRecipe(16990, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12834)
	recipe:SetCraftedItemID(12790)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddMobDrop(10899)

	-- Annihilator -- 16991
	recipe = AddRecipe(16991, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12835)
	recipe:SetCraftedItemID(12798)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddMobDrop(9736)

	-- Frostguard -- 16992
	recipe = AddRecipe(16992, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12836)
	recipe:SetCraftedItemID(12797)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.SWORD)
	recipe:AddMobDrop(1844)

	-- Masterwork Stormhammer -- 16993
	recipe = AddRecipe(16993, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12837)
	recipe:SetCraftedItemID(12794)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddMobDrop(10899)

	-- Arcanite Reaper -- 16994
	recipe = AddRecipe(16994, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12838)
	recipe:SetCraftedItemID(12784)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddMobDrop(9596)

	-- Heartseeker -- 16995
	recipe = AddRecipe(16995, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(12839)
	recipe:SetCraftedItemID(12783)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddMobDrop(10997)

	-- Silver Skeleton Key -- 19666
	recipe = AddRecipe(19666, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15869)
	recipe:SetSkillLevels(100, 100, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Golden Skeleton Key -- 19667
	recipe = AddRecipe(19667, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15870)
	recipe:SetSkillLevels(150, 150, 150, 160, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Truesilver Skeleton Key -- 19668
	recipe = AddRecipe(19668, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15871)
	recipe:SetSkillLevels(200, 200, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Arcanite Skeleton Key -- 19669
	recipe = AddRecipe(19669, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15872)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Arcanite Rod -- 20201
	recipe = AddRecipe(20201, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(16206)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fiery Chain Girdle -- 20872
	recipe = AddRecipe(20872, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(17049)
	recipe:SetCraftedItemID(16989)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Fiery Chain Shoulders -- 20873
	recipe = AddRecipe(20873, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(17053)
	recipe:SetCraftedItemID(16988)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Dark Iron Bracers -- 20874
	recipe = AddRecipe(20874, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(17051)
	recipe:SetCraftedItemID(17014)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Dark Iron Leggings -- 20876
	recipe = AddRecipe(20876, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(17052)
	recipe:SetCraftedItemID(17013)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Dark Iron Reaver -- 20890
	recipe = AddRecipe(20890, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(17059)
	recipe:SetCraftedItemID(17015)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.SWORD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Dark Iron Destroyer -- 20897
	recipe = AddRecipe(20897, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(17060)
	recipe:SetCraftedItemID(17016)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.AXE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Sulfuron Hammer -- 21161
	recipe = AddRecipe(21161, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(18592)
	recipe:SetCraftedItemID(17193)
	recipe:SetSkillLevels(300, 300, 325, 337, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.TWO_HAND, F.MACE)
	recipe:AddQuest(7604)

	-- Edge of Winter -- 21913
	recipe = AddRecipe(21913, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(17706)
	recipe:SetCraftedItemID(17704)
	recipe:SetSkillLevels(190, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddSeason("WINTER_VEIL")

	-- Elemental Sharpening Stone -- 22757
	recipe = AddRecipe(22757, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18264)
	recipe:SetCraftedItemID(18262)
	recipe:SetSkillLevels(300, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP)
	recipe:AddCustom("MC_RANDOM")

	-- Heavy Timbermaw Belt -- 23628
	recipe = AddRecipe(23628, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19202)
	recipe:SetCraftedItemID(19043)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.MAIL)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Heavy Timbermaw Boots -- 23629
	recipe = AddRecipe(23629, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19204)
	recipe:SetCraftedItemID(19048)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.MAIL)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.REVERED, 11557)

	-- Girdle of the Dawn -- 23632
	recipe = AddRecipe(23632, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19203)
	recipe:SetCraftedItemID(19051)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ARGENTDAWN, F.PLATE)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Gloves of the Dawn -- 23633
	recipe = AddRecipe(23633, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19205)
	recipe:SetCraftedItemID(19057)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ARGENTDAWN, F.PLATE)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Dark Iron Helm -- 23636
	recipe = AddRecipe(23636, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19206)
	recipe:SetCraftedItemID(19148)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Dark Iron Gauntlets -- 23637
	recipe = AddRecipe(23637, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19207)
	recipe:SetCraftedItemID(19164)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Black Amnesty -- 23638
	recipe = AddRecipe(23638, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19208)
	recipe:SetCraftedItemID(19166)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.DAGGER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Blackfury -- 23639
	recipe = AddRecipe(23639, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19209)
	recipe:SetCraftedItemID(19167)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.TWO_HAND, F.POLEARM)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Ebon Hand -- 23650
	recipe = AddRecipe(23650, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19210)
	recipe:SetCraftedItemID(19170)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.MACE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Blackguard -- 23652
	recipe = AddRecipe(23652, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19211)
	recipe:SetCraftedItemID(19168)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.SWORD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Nightfall -- 23653
	recipe = AddRecipe(23653, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19212)
	recipe:SetCraftedItemID(19169)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.TWO_HAND, F.AXE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Bloodsoul Breastplate -- 24136
	recipe = AddRecipe(24136, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19776)
	recipe:SetCraftedItemID(19690)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bloodsoul Shoulders -- 24137
	recipe = AddRecipe(24137, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19777)
	recipe:SetCraftedItemID(19691)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bloodsoul Gauntlets -- 24138
	recipe = AddRecipe(24138, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19778)
	recipe:SetCraftedItemID(19692)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Darksoul Breastplate -- 24139
	recipe = AddRecipe(24139, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19779)
	recipe:SetCraftedItemID(19693)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Darksoul Leggings -- 24140
	recipe = AddRecipe(24140, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19780)
	recipe:SetCraftedItemID(19694)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Darksoul Shoulders -- 24141
	recipe = AddRecipe(24141, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19781)
	recipe:SetCraftedItemID(19695)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Dark Iron Boots -- 24399
	recipe = AddRecipe(24399, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20040)
	recipe:SetCraftedItemID(20039)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Darkrune Gauntlets -- 24912
	recipe = AddRecipe(24912, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20553)
	recipe:SetCraftedItemID(20549)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddQuest(8323)

	-- Darkrune Helm -- 24913
	recipe = AddRecipe(24913, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20555)
	recipe:SetCraftedItemID(20551)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.PLATE)
	recipe:AddQuest(8323)

	-- Darkrune Breastplate -- 24914
	recipe = AddRecipe(24914, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20554)
	recipe:SetCraftedItemID(20550)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddQuest(8323)

	-- Heavy Obsidian Belt -- 27585
	recipe = AddRecipe(27585, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22209)
	recipe:SetCraftedItemID(22197)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15176)

	-- Jagged Obsidian Shield -- 27586
	recipe = AddRecipe(27586, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22219)
	recipe:SetCraftedItemID(22198)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.SHIELD, F.ONE_HAND)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15471)

	-- Thick Obsidian Breastplate -- 27587
	recipe = AddRecipe(27587, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(22222)
	recipe:SetCraftedItemID(22196)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddMobDrop(15263)

	-- Light Obsidian Belt -- 27588
	recipe = AddRecipe(27588, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22214)
	recipe:SetCraftedItemID(22195)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15176)

	-- Black Grasp of the Destroyer -- 27589
	recipe = AddRecipe(27589, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(22220)
	recipe:SetCraftedItemID(22194)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(15340)

	-- Obsidian Mail Tunic -- 27590
	recipe = AddRecipe(27590, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22221)
	recipe:SetCraftedItemID(22191)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.EXALTED, 15471)

	-- Titanic Leggings -- 27829
	recipe = AddRecipe(27829, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(22388)
	recipe:SetCraftedItemID(22385)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Persuader -- 27830
	recipe = AddRecipe(27830, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(22390)
	recipe:SetCraftedItemID(22384)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Sageblade -- 27832
	recipe = AddRecipe(27832, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(22389)
	recipe:SetCraftedItemID(22383)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Icebane Breastplate -- 28242
	recipe = AddRecipe(28242, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22669)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("NAXX40_GONE")

	-- Icebane Gauntlets -- 28243
	recipe = AddRecipe(28243, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22670)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("NAXX40_GONE")

	-- Icebane Bracers -- 28244
	recipe = AddRecipe(28244, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22671)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("NAXX40_GONE")

	-- Ironvine Breastplate -- 28461
	recipe = AddRecipe(28461, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22766)
	recipe:SetCraftedItemID(22762)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15176)

	-- Ironvine Gloves -- 28462
	recipe = AddRecipe(28462, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22767)
	recipe:SetCraftedItemID(22763)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15176)

	-- Ironvine Belt -- 28463
	recipe = AddRecipe(28463, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22768)
	recipe:SetCraftedItemID(22764)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15176)

	-- Fel Iron Plate Gloves -- 29545
	recipe = AddRecipe(29545, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23482)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Plate Belt -- 29547
	recipe = AddRecipe(29547, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23484)
	recipe:SetSkillLevels(305, 305, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Plate Boots -- 29548
	recipe = AddRecipe(29548, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23487)
	recipe:SetSkillLevels(315, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Plate Pants -- 29549
	recipe = AddRecipe(29549, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23488)
	recipe:SetSkillLevels(315, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Breastplate -- 29550
	recipe = AddRecipe(29550, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23489)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Chain Coif -- 29551
	recipe = AddRecipe(29551, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23493)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Chain Gloves -- 29552
	recipe = AddRecipe(29552, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23491)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Chain Bracers -- 29553
	recipe = AddRecipe(29553, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23494)
	recipe:SetSkillLevels(315, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Chain Tunic -- 29556
	recipe = AddRecipe(29556, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23490)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Hatchet -- 29557
	recipe = AddRecipe(29557, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23497)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Hammer -- 29558
	recipe = AddRecipe(29558, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23498)
	recipe:SetSkillLevels(315, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Fel Iron Greatsword -- 29565
	recipe = AddRecipe(29565, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23499)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Adamantite Maul -- 29566
	recipe = AddRecipe(29566, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23590)
	recipe:SetCraftedItemID(23502)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddVendor(16713)
	recipe:AddLimitedVendor(16670, 1, 19662, 1)

	-- Adamantite Cleaver -- 29568
	recipe = AddRecipe(29568, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23591)
	recipe:SetCraftedItemID(23503)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddVendor(16713)
	recipe:AddLimitedVendor(16670, 1, 19662, 1)

	-- Adamantite Dagger -- 29569
	recipe = AddRecipe(29569, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23592)
	recipe:SetCraftedItemID(23504)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.ONE_HAND, F.DAGGER)
	recipe:AddVendor(16713)
	recipe:AddLimitedVendor(16670, 1, 19662, 1)

	-- Adamantite Rapier -- 29571
	recipe = AddRecipe(29571, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23593)
	recipe:SetCraftedItemID(23505)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.ONE_HAND, F.SWORD)
	recipe:AddVendor(16713)
	recipe:AddLimitedVendor(16670, 1, 19662, 1)

	-- Adamantite Plate Bracers -- 29603
	recipe = AddRecipe(29603, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23594)
	recipe:SetCraftedItemID(23506)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddVendor(19342, 19694)

	-- Adamantite Plate Gloves -- 29605
	recipe = AddRecipe(29605, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23595)
	recipe:SetCraftedItemID(23508)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddVendor(19342, 19694)

	-- Adamantite Breastplate -- 29606
	recipe = AddRecipe(29606, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23596)
	recipe:SetCraftedItemID(23507)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddVendor(19342, 19694)

	-- Enchanted Adamantite Belt -- 29608
	recipe = AddRecipe(29608, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23597)
	recipe:SetCraftedItemID(23510)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.FRIENDLY, 19331)

	-- Enchanted Adamantite Breastplate -- 29610
	recipe = AddRecipe(29610, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23599)
	recipe:SetCraftedItemID(23509)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Enchanted Adamantite Boots -- 29611
	recipe = AddRecipe(29611, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23598)
	recipe:SetCraftedItemID(23511)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Enchanted Adamantite Leggings -- 29613
	recipe = AddRecipe(29613, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23600)
	recipe:SetCraftedItemID(23512)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Flamebane Bracers -- 29614
	recipe = AddRecipe(29614, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23601)
	recipe:SetCraftedItemID(23515)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Flamebane Helm -- 29615
	recipe = AddRecipe(29615, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23602)
	recipe:SetCraftedItemID(23516)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Flamebane Gloves -- 29616
	recipe = AddRecipe(29616, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23603)
	recipe:SetCraftedItemID(23514)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Flamebane Breastplate -- 29617
	recipe = AddRecipe(29617, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23604)
	recipe:SetCraftedItemID(23513)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Felsteel Gloves -- 29619
	recipe = AddRecipe(29619, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23605)
	recipe:SetCraftedItemID(23517)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddMobDrop(18497)

	-- Felsteel Leggings -- 29620
	recipe = AddRecipe(29620, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23606)
	recipe:SetCraftedItemID(23518)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddMobDrop(20900)

	-- Felsteel Helm -- 29621
	recipe = AddRecipe(29621, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23607)
	recipe:SetCraftedItemID(23519)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddMobDrop(18830)

	-- Gauntlets of the Iron Tower -- 29622
	recipe = AddRecipe(29622, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23621)
	recipe:SetCraftedItemID(23532)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Khorium Belt -- 29628
	recipe = AddRecipe(29628, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23608)
	recipe:SetCraftedItemID(23524)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddMobDrop(18203)

	-- Khorium Pants -- 29629
	recipe = AddRecipe(29629, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23609)
	recipe:SetCraftedItemID(23523)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddMobDrop(20878)

	-- Khorium Boots -- 29630
	recipe = AddRecipe(29630, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23610)
	recipe:SetCraftedItemID(23525)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddMobDrop(18873)

	-- Ragesteel Gloves -- 29642
	recipe = AddRecipe(29642, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23611)
	recipe:SetCraftedItemID(23520)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(17136)

	-- Ragesteel Helm -- 29643
	recipe = AddRecipe(29643, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23612)
	recipe:SetCraftedItemID(23521)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(16952)

	-- Ragesteel Breastplate -- 29645
	recipe = AddRecipe(29645, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23613)
	recipe:SetCraftedItemID(23522)
	recipe:SetSkillLevels(370, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(21454, 23305, 23324)

	-- Swiftsteel Gloves -- 29648
	recipe = AddRecipe(29648, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23615)
	recipe:SetCraftedItemID(23526)
	recipe:SetSkillLevels(370, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(18314)

	-- Earthpeace Breastplate -- 29649
	recipe = AddRecipe(29649, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23617)
	recipe:SetCraftedItemID(23527)
	recipe:SetSkillLevels(370, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(17975)

	-- Fel Sharpening Stone -- 29654
	recipe = AddRecipe(29654, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23528)
	recipe:SetSkillLevels(300, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Adamantite Sharpening Stone -- 29656
	recipe = AddRecipe(29656, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23618)
	recipe:SetCraftedItemID(23529)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Felsteel Shield Spike -- 29657
	recipe = AddRecipe(29657, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24002)
	recipe:SetCraftedItemID(23530)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.EXALTED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.EXALTED, 17585)

	-- Felfury Gauntlets -- 29658
	recipe = AddRecipe(29658, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23620)
	recipe:SetCraftedItemID(23531)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Steelgrip Gauntlets -- 29662
	recipe = AddRecipe(29662, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23622)
	recipe:SetCraftedItemID(23533)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Storm Helm -- 29663
	recipe = AddRecipe(29663, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23623)
	recipe:SetCraftedItemID(23534)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Helm of the Stalwart Defender -- 29664
	recipe = AddRecipe(29664, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23624)
	recipe:SetCraftedItemID(23535)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Oathkeeper's Helm -- 29668
	recipe = AddRecipe(29668, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23625)
	recipe:SetCraftedItemID(23536)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Black Felsteel Bracers -- 29669
	recipe = AddRecipe(29669, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23626)
	recipe:SetCraftedItemID(23537)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Bracers of the Green Fortress -- 29671
	recipe = AddRecipe(29671, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23627)
	recipe:SetCraftedItemID(23538)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Blessed Bracers -- 29672
	recipe = AddRecipe(29672, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23628)
	recipe:SetCraftedItemID(23539)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Felsteel Longblade -- 29692
	recipe = AddRecipe(29692, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23629)
	recipe:SetCraftedItemID(23540)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Outland")

	-- Khorium Champion -- 29693
	recipe = AddRecipe(29693, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23630)
	recipe:SetCraftedItemID(23541)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddWorldDrop("Outland")

	-- Fel Edged Battleaxe -- 29694
	recipe = AddRecipe(29694, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23631)
	recipe:SetCraftedItemID(23542)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddWorldDrop("Outland")

	-- Felsteel Reaper -- 29695
	recipe = AddRecipe(29695, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23632)
	recipe:SetCraftedItemID(23543)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddWorldDrop("Outland")

	-- Runic Hammer -- 29696
	recipe = AddRecipe(29696, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23633)
	recipe:SetCraftedItemID(23544)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Fel Hardened Maul -- 29697
	recipe = AddRecipe(29697, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23634)
	recipe:SetCraftedItemID(23546)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Eternium Runed Blade -- 29698
	recipe = AddRecipe(29698, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23635)
	recipe:SetCraftedItemID(23554)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Outland")

	-- Dirge -- 29699
	recipe = AddRecipe(29699, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23636)
	recipe:SetCraftedItemID(23555)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Outland")

	-- Hand of Eternity -- 29700
	recipe = AddRecipe(29700, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(23637)
	recipe:SetCraftedItemID(23556)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Lesser Ward of Shielding -- 29728
	recipe = AddRecipe(29728, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23638)
	recipe:SetCraftedItemID(23575)
	recipe:SetSkillLevels(340, 340, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16583, 19373)

	-- Greater Ward of Shielding -- 29729
	recipe = AddRecipe(29729, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23639)
	recipe:SetCraftedItemID(23576)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18853)

	-- Lesser Rune of Warding -- 32284
	recipe = AddRecipe(32284, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23559)
	recipe:SetSkillLevels(325, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Greater Rune of Warding -- 32285
	recipe = AddRecipe(32285, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25526)
	recipe:SetCraftedItemID(25521)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Fel Iron Rod -- 32655
	recipe = AddRecipe(32655, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25843)
	recipe:SetSkillLevels(300, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Adamantite Rod -- 32656
	recipe = AddRecipe(32656, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25846)
	recipe:SetCraftedItemID(25844)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(19662, 1)

	-- Eternium Rod -- 32657
	recipe = AddRecipe(32657, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25847)
	recipe:SetCraftedItemID(25845)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16583, 19373)

	-- Nether Chain Shirt -- 34529
	recipe = AddRecipe(34529, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23563)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Twisting Nether Chain Shirt -- 34530
	recipe = AddRecipe(34530, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23564)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Breastplate of Kings -- 34533
	recipe = AddRecipe(34533, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28483)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bulwark of Kings -- 34534
	recipe = AddRecipe(34534, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28484)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Fireguard -- 34535
	recipe = AddRecipe(34535, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28425)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blazeguard -- 34537
	recipe = AddRecipe(34537, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28426)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lionheart Blade -- 34538
	recipe = AddRecipe(34538, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28428)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lionheart Champion -- 34540
	recipe = AddRecipe(34540, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28429)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- The Planar Edge -- 34541
	recipe = AddRecipe(34541, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28431)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Black Planar Edge -- 34542
	recipe = AddRecipe(34542, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28432)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lunar Crescent -- 34543
	recipe = AddRecipe(34543, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28434)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Mooncleaver -- 34544
	recipe = AddRecipe(34544, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28435)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Drakefist Hammer -- 34545
	recipe = AddRecipe(34545, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28437)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Dragonmaw -- 34546
	recipe = AddRecipe(34546, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28438)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Thunder -- 34547
	recipe = AddRecipe(34547, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28440)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Deep Thunder -- 34548
	recipe = AddRecipe(34548, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28441)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Fel Weightstone -- 34607
	recipe = AddRecipe(34607, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28420)
	recipe:SetSkillLevels(300, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Adamantite Weightstone -- 34608
	recipe = AddRecipe(34608, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(28632)
	recipe:SetCraftedItemID(28421)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Thick Bronze Darts -- 34979
	recipe = AddRecipe(34979, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29201)
	recipe:SetSkillLevels(100, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Whirling Steel Axes -- 34981
	recipe = AddRecipe(34981, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29202)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Enchanted Thorium Blades -- 34982
	recipe = AddRecipe(34982, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29203)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 7230, 7231, 11177, 11178, 15400, 16583, 16724, 16823, 17245, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Felsteel Whisper Knives -- 34983
	recipe = AddRecipe(34983, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29204)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 16583, 16823, 19341, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675, 37072, 44781, 45548)

	-- Earthforged Leggings -- 36122
	recipe = AddRecipe(36122, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30069)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Windforged Leggings -- 36124
	recipe = AddRecipe(36124, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30070)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Light Earthforged Blade -- 36125
	recipe = AddRecipe(36125, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30071)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Light Skyforged Axe -- 36126
	recipe = AddRecipe(36126, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30072)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Light Emberforged Hammer -- 36128
	recipe = AddRecipe(36128, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30073)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Heavy Earthforged Breastplate -- 36129
	recipe = AddRecipe(36129, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30074)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Stormforged Hauberk -- 36130
	recipe = AddRecipe(36130, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30076)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Windforged Rapier -- 36131
	recipe = AddRecipe(36131, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30077)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Stoneforged Claymore -- 36133
	recipe = AddRecipe(36133, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30086)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Stormforged Axe -- 36134
	recipe = AddRecipe(36134, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30087)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Skyforged Great Axe -- 36135
	recipe = AddRecipe(36135, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30088)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lavaforged Warhammer -- 36136
	recipe = AddRecipe(36136, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30089)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Great Earthforged Hammer -- 36137
	recipe = AddRecipe(36137, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30093)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Embrace of the Twisting Nether -- 36256
	recipe = AddRecipe(36256, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23565)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bulwark of the Ancient Kings -- 36257
	recipe = AddRecipe(36257, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28485)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blazefury -- 36258
	recipe = AddRecipe(36258, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28427)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lionheart Executioner -- 36259
	recipe = AddRecipe(36259, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28430)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wicked Edge of the Planes -- 36260
	recipe = AddRecipe(36260, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28433)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bloodmoon -- 36261
	recipe = AddRecipe(36261, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28436)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Dragonstrike -- 36262
	recipe = AddRecipe(36262, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28439)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Stormherald -- 36263
	recipe = AddRecipe(36263, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28442)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Belt of the Guardian -- 36389
	recipe = AddRecipe(36389, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30321)
	recipe:SetCraftedItemID(30034)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Red Belt of Battle -- 36390
	recipe = AddRecipe(36390, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30322)
	recipe:SetCraftedItemID(30032)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of the Protector -- 36391
	recipe = AddRecipe(36391, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30323)
	recipe:SetCraftedItemID(30033)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Red Havoc Boots -- 36392
	recipe = AddRecipe(36392, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30324)
	recipe:SetCraftedItemID(30031)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Wildguard Breastplate -- 38473
	recipe = AddRecipe(38473, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31390)
	recipe:SetCraftedItemID(31364)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Wildguard Leggings -- 38475
	recipe = AddRecipe(38475, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31391)
	recipe:SetCraftedItemID(31367)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Wildguard Helm -- 38476
	recipe = AddRecipe(38476, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31392)
	recipe:SetCraftedItemID(31368)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Iceguard Breastplate -- 38477
	recipe = AddRecipe(38477, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31393)
	recipe:SetCraftedItemID(31369)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.VIOLETEYE, F.PLATE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 16388)

	-- Iceguard Leggings -- 38478
	recipe = AddRecipe(38478, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31394)
	recipe:SetCraftedItemID(31370)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.VIOLETEYE, F.PLATE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.REVERED, 16388)

	-- Iceguard Helm -- 38479
	recipe = AddRecipe(38479, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31395)
	recipe:SetCraftedItemID(31371)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.VIOLETEYE, F.PLATE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 16388)

	-- Shadesteel Sabots -- 40033
	recipe = AddRecipe(40033, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32441)
	recipe:SetCraftedItemID(32402)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Shadesteel Bracers -- 40034
	recipe = AddRecipe(40034, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32442)
	recipe:SetCraftedItemID(32403)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Shadesteel Greaves -- 40035
	recipe = AddRecipe(40035, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32443)
	recipe:SetCraftedItemID(32404)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Shadesteel Girdle -- 40036
	recipe = AddRecipe(40036, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32444)
	recipe:SetCraftedItemID(32401)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Swiftsteel Bracers -- 41132
	recipe = AddRecipe(41132, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32736)
	recipe:SetCraftedItemID(32568)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Swiftsteel Shoulders -- 41133
	recipe = AddRecipe(41133, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32737)
	recipe:SetCraftedItemID(32570)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("BT_RANDOM")

	-- Dawnsteel Bracers -- 41134
	recipe = AddRecipe(41134, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32738)
	recipe:SetCraftedItemID(32571)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("BT_RANDOM")

	-- Dawnsteel Shoulders -- 41135
	recipe = AddRecipe(41135, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32739)
	recipe:SetCraftedItemID(32573)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Ragesteel Shoulders -- 42662
	recipe = AddRecipe(42662, V.TBC, Q.RARE)
	recipe:SetCraftedItemID(33173)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(21050, 21059, 21060, 21061)

	-- Adamantite Weapon Chain -- 42688
	recipe = AddRecipe(42688, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(35296)
	recipe:SetCraftedItemID(33185)
	recipe:SetSkillLevels(335, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(24664)

	-- Heavy Copper Longsword -- 43549
	recipe = AddRecipe(43549, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(33792)
	recipe:SetCraftedItemID(33791)
	recipe:SetSkillLevels(35, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddQuest(1578)

	-- Hammer of Righteous Might -- 43846
	recipe = AddRecipe(43846, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(33954)
	recipe:SetCraftedItemID(32854)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Sunblessed Gauntlets -- 46140
	recipe = AddRecipe(46140, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35208)
	recipe:SetCraftedItemID(34380)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hard Khorium Battlefists -- 46141
	recipe = AddRecipe(46141, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35209)
	recipe:SetCraftedItemID(34378)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Sunblessed Breastplate -- 46142
	recipe = AddRecipe(46142, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35210)
	recipe:SetCraftedItemID(34379)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hard Khorium Battleplate -- 46144
	recipe = AddRecipe(46144, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35211)
	recipe:SetCraftedItemID(34377)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Cobalt Legplates -- 52567
	recipe = AddRecipe(52567, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39086)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Belt -- 52568
	recipe = AddRecipe(52568, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39087)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Boots -- 52569
	recipe = AddRecipe(52569, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39088)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Chestpiece -- 52570
	recipe = AddRecipe(52570, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39085)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Helm -- 52571
	recipe = AddRecipe(52571, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39084)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Shoulders -- 52572
	recipe = AddRecipe(52572, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39083)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Triangle Shield -- 54550
	recipe = AddRecipe(54550, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40668)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Belt -- 54551
	recipe = AddRecipe(54551, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40669)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Boots -- 54552
	recipe = AddRecipe(54552, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40671)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Breastplate -- 54553
	recipe = AddRecipe(54553, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40672)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Legplates -- 54554
	recipe = AddRecipe(54554, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40674)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Helm -- 54555
	recipe = AddRecipe(54555, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40673)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Shoulders -- 54556
	recipe = AddRecipe(54556, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40675)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Saronite Defender -- 54557
	recipe = AddRecipe(54557, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40670)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Helm -- 54917
	recipe = AddRecipe(54917, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40942)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Boots -- 54918
	recipe = AddRecipe(54918, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40949)
	recipe:SetSkillLevels(380, 380, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Shoulders -- 54941
	recipe = AddRecipe(54941, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40950)
	recipe:SetSkillLevels(385, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Chestpiece -- 54944
	recipe = AddRecipe(54944, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40951)
	recipe:SetSkillLevels(385, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Gauntlets -- 54945
	recipe = AddRecipe(54945, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40952)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Belt -- 54946
	recipe = AddRecipe(54946, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40953)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Legplates -- 54947
	recipe = AddRecipe(54947, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40943)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Cobalt Bracers -- 54948
	recipe = AddRecipe(54948, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40954)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Horned Cobalt Helm -- 54949
	recipe = AddRecipe(54949, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40955)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Reinforced Cobalt Shoulders -- 54978
	recipe = AddRecipe(54978, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41124)
	recipe:SetCraftedItemID(40956)
	recipe:SetSkillLevels(375, 375, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(27333)

	-- Reinforced Cobalt Helm -- 54979
	recipe = AddRecipe(54979, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41123)
	recipe:SetCraftedItemID(40957)
	recipe:SetSkillLevels(375, 375, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(26270)

	-- Reinforced Cobalt Legplates -- 54980
	recipe = AddRecipe(54980, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41120)
	recipe:SetCraftedItemID(40958)
	recipe:SetSkillLevels(375, 375, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(29235)

	-- Reinforced Cobalt Chestpiece -- 54981
	recipe = AddRecipe(54981, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41122)
	recipe:SetCraftedItemID(40959)
	recipe:SetSkillLevels(375, 375, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(28123)

	-- Saronite Protector -- 55013
	recipe = AddRecipe(55013, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41117)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Saronite Bulwark -- 55014
	recipe = AddRecipe(55014, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41113)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Gauntlets -- 55015
	recipe = AddRecipe(55015, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41114)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Saronite Bracers -- 55017
	recipe = AddRecipe(55017, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41116)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Legplates -- 55055
	recipe = AddRecipe(55055, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41126)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Gauntlets -- 55056
	recipe = AddRecipe(55056, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41127)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Boots -- 55057
	recipe = AddRecipe(55057, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41128)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Breastplate -- 55058
	recipe = AddRecipe(55058, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41129)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Honed Cobalt Cleaver -- 55174
	recipe = AddRecipe(55174, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41181)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Cobalt Slicer -- 55177
	recipe = AddRecipe(55177, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41182)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Saronite Ambusher -- 55179
	recipe = AddRecipe(55179, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41183)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Saronite Shiv -- 55181
	recipe = AddRecipe(55181, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41184)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Furious Saronite Beatstick -- 55182
	recipe = AddRecipe(55182, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41185)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Corroded Saronite Edge -- 55183
	recipe = AddRecipe(55183, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41186)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Corroded Saronite Woundbringer -- 55184
	recipe = AddRecipe(55184, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41187)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Saronite Mindcrusher -- 55185
	recipe = AddRecipe(55185, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41188)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Chestplate of Conquest -- 55186
	recipe = AddRecipe(55186, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41189)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Legplates of Conquest -- 55187
	recipe = AddRecipe(55187, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41190)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Sturdy Cobalt Quickblade -- 55200
	recipe = AddRecipe(55200, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41239)
	recipe:SetSkillLevels(380, 380, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Tenderizer -- 55201
	recipe = AddRecipe(55201, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41240)
	recipe:SetSkillLevels(380, 380, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Sure-fire Shuriken -- 55202
	recipe = AddRecipe(55202, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41241)
	recipe:SetSkillLevels(385, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.THROWN)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Forged Cobalt Claymore -- 55203
	recipe = AddRecipe(55203, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41242)
	recipe:SetSkillLevels(385, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Notched Cobalt War Axe -- 55204
	recipe = AddRecipe(55204, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41243)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Deadly Saronite Dirk -- 55206
	recipe = AddRecipe(55206, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41245)
	recipe:SetSkillLevels(405, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.THROWN)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Vengeance Bindings -- 55298
	recipe = AddRecipe(55298, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41355)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Righteous Gauntlets -- 55300
	recipe = AddRecipe(55300, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41356)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Daunting Handguards -- 55301
	recipe = AddRecipe(55301, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41357)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Helm of Command -- 55302
	recipe = AddRecipe(55302, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41344)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Daunting Legplates -- 55303
	recipe = AddRecipe(55303, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41345)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Righteous Greaves -- 55304
	recipe = AddRecipe(55304, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41346)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Bracers -- 55305
	recipe = AddRecipe(55305, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41354)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Pauldrons -- 55306
	recipe = AddRecipe(55306, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41351)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Waistguard -- 55307
	recipe = AddRecipe(55307, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41352)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Walkers -- 55308
	recipe = AddRecipe(55308, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41348)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Gauntlets -- 55309
	recipe = AddRecipe(55309, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41349)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Legplates -- 55310
	recipe = AddRecipe(55310, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41347)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Hauberk -- 55311
	recipe = AddRecipe(55311, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41353)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Savage Saronite Skullshield -- 55312
	recipe = AddRecipe(55312, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41350)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titansteel Destroyer -- 55369
	recipe = AddRecipe(55369, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41257)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titansteel Bonecrusher -- 55370
	recipe = AddRecipe(55370, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41383)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titansteel Guardian -- 55371
	recipe = AddRecipe(55371, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41384)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Titansteel Helm -- 55372
	recipe = AddRecipe(55372, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41386)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Titansteel Helm -- 55373
	recipe = AddRecipe(55373, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41387)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Titansteel Helm -- 55374
	recipe = AddRecipe(55374, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41388)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Spiked Titansteel Treads -- 55375
	recipe = AddRecipe(55375, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41391)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Tempered Titansteel Treads -- 55376
	recipe = AddRecipe(55376, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41392)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Titansteel Treads -- 55377
	recipe = AddRecipe(55377, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41394)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Socket Bracer -- 55628
	recipe = AddRecipe(55628, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Socket Gloves -- 55641
	recipe = AddRecipe(55641, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Eternal Belt Buckle -- 55656
	recipe = AddRecipe(55656, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41611)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titanium Rod -- 55732
	recipe = AddRecipe(55732, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41745)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Bracers -- 55834
	recipe = AddRecipe(55834, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41974)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Gauntlets -- 55835
	recipe = AddRecipe(55835, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41975)
	recipe:SetSkillLevels(370, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titanium Weapon Chain -- 55839
	recipe = AddRecipe(55839, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41976)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titansteel Shanker -- 56234
	recipe = AddRecipe(56234, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42435)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cudgel of Saronite Justice -- 56280
	recipe = AddRecipe(56280, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42443)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titanium Shield Spike -- 56357
	recipe = AddRecipe(56357, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42500)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titansteel Shield Wall -- 56400
	recipe = AddRecipe(56400, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42508)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Bracers -- 56549
	recipe = AddRecipe(56549, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42723)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Pauldrons -- 56550
	recipe = AddRecipe(56550, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42727)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Waistguard -- 56551
	recipe = AddRecipe(56551, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42729)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Walkers -- 56552
	recipe = AddRecipe(56552, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42730)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Gauntlets -- 56553
	recipe = AddRecipe(56553, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42724)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Legplates -- 56554
	recipe = AddRecipe(56554, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42726)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Hauberk -- 56555
	recipe = AddRecipe(56555, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42725)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ornate Saronite Skullshield -- 56556
	recipe = AddRecipe(56556, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42728)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cobalt Skeleton Key -- 59405
	recipe = AddRecipe(59405, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43854)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titanium Skeleton Key -- 59406
	recipe = AddRecipe(59406, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43853)
	recipe:SetSkillLevels(430, 430, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Belt -- 59436
	recipe = AddRecipe(59436, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43860)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Bracers -- 59438
	recipe = AddRecipe(59438, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43864)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Pauldrons -- 59440
	recipe = AddRecipe(59440, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43865)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Brilliant Saronite Helm -- 59441
	recipe = AddRecipe(59441, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43870)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Saronite Spellblade -- 59442
	recipe = AddRecipe(59442, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43871)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Icebane Chestguard -- 61008
	recipe = AddRecipe(61008, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43586)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Icebane Girdle -- 61009
	recipe = AddRecipe(61009, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43587)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Icebane Treads -- 61010
	recipe = AddRecipe(61010, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43588)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Titanium Plating -- 62202
	recipe = AddRecipe(62202, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44938)
	recipe:SetCraftedItemID(44936)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.WRATHCOMMON1, F.SHIELD)
	recipe:AddRepVendor(FAC.HORDE_EXPEDITION, REP.EXALTED, 32565, 32774)
	recipe:AddRepVendor(FAC.ALLIANCE_VANGUARD, REP.EXALTED, 32564, 32773)

	-- Titansteel Spellblade -- 63182
	recipe = AddRecipe(63182, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45085)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(2998, 3174, 3355, 5511, 7230, 7231, 11177, 11178, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Belt of the Titans -- 63187
	recipe = AddRecipe(63187, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45088)
	recipe:SetCraftedItemID(45088)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Battlelord's Plate Boots -- 63188
	recipe = AddRecipe(63188, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45089)
	recipe:SetCraftedItemID(45089)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Plate Girdle of Righteousness -- 63189
	recipe = AddRecipe(63189, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45090)
	recipe:SetCraftedItemID(45090)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Treads of Destiny -- 63190
	recipe = AddRecipe(63190, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45091)
	recipe:SetCraftedItemID(45091)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Indestructible Plate Girdle -- 63191
	recipe = AddRecipe(63191, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45092)
	recipe:SetCraftedItemID(45092)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Spiked Deathdealers -- 63192
	recipe = AddRecipe(63192, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45093)
	recipe:SetCraftedItemID(45093)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Breastplate of the White Knight -- 67091
	recipe = AddRecipe(67091, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47622)
	recipe:SetCraftedItemID(47591)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Saronite Swordbreakers -- 67092
	recipe = AddRecipe(67092, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47623)
	recipe:SetCraftedItemID(47570)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Titanium Razorplate -- 67093
	recipe = AddRecipe(67093, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47624)
	recipe:SetCraftedItemID(47589)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Titanium Spikeguards -- 67094
	recipe = AddRecipe(67094, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47625)
	recipe:SetCraftedItemID(47572)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Sunforged Breastplate -- 67095
	recipe = AddRecipe(67095, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47626)
	recipe:SetCraftedItemID(47593)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Sunforged Bracers -- 67096
	recipe = AddRecipe(67096, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47627)
	recipe:SetCraftedItemID(47574)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Breastplate of the White Knight -- 67130
	recipe = AddRecipe(67130, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47640)
	recipe:SetCraftedItemID(47592)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Saronite Swordbreakers -- 67131
	recipe = AddRecipe(67131, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47641)
	recipe:SetCraftedItemID(47571)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Titanium Razorplate -- 67132
	recipe = AddRecipe(67132, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47644)
	recipe:SetCraftedItemID(47590)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Titanium Spikeguards -- 67133
	recipe = AddRecipe(67133, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47645)
	recipe:SetCraftedItemID(47573)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Sunforged Breastplate -- 67134
	recipe = AddRecipe(67134, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47643)
	recipe:SetCraftedItemID(47594)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Sunforged Bracers -- 67135
	recipe = AddRecipe(67135, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47642)
	recipe:SetCraftedItemID(47575)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom("TOC25_RANDOM")

	-- Puresteel Legplates -- 70562
	recipe = AddRecipe(70562, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49969)
	recipe:SetCraftedItemID(49902)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Protectors of Life -- 70563
	recipe = AddRecipe(70563, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49970)
	recipe:SetCraftedItemID(49905)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Legplates of Painful Death -- 70565
	recipe = AddRecipe(70565, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49971)
	recipe:SetCraftedItemID(49903)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Hellfrozen Bonegrinders -- 70566
	recipe = AddRecipe(70566, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49972)
	recipe:SetCraftedItemID(49906)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Pillars of Might -- 70567
	recipe = AddRecipe(70567, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49973)
	recipe:SetCraftedItemID(49904)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Boots of Kingly Upheaval -- 70568
	recipe = AddRecipe(70568, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49974)
	recipe:SetCraftedItemID(49907)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Folded Obsidium -- 76178
	recipe = AddRecipe(76178, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(65365)
	recipe:SetSkillLevels(425, 425, 450, 452, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Bracers -- 76179
	recipe = AddRecipe(76179, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54850)
	recipe:SetSkillLevels(440, 440, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Gauntlets -- 76180
	recipe = AddRecipe(76180, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54852)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Belt -- 76181
	recipe = AddRecipe(76181, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54853)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Boots -- 76182
	recipe = AddRecipe(76182, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54854)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Shoulders -- 76258
	recipe = AddRecipe(76258, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54876)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Legguards -- 76259
	recipe = AddRecipe(76259, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55022)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Helm -- 76260
	recipe = AddRecipe(76260, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55023)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Breastplate -- 76261
	recipe = AddRecipe(76261, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55024)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Bracers -- 76262
	recipe = AddRecipe(76262, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55025)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Gauntlets -- 76263
	recipe = AddRecipe(76263, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55026)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Belt -- 76264
	recipe = AddRecipe(76264, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55027)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Boots -- 76265
	recipe = AddRecipe(76265, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55028)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Shoulders -- 76266
	recipe = AddRecipe(76266, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55029)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Legguards -- 76267
	recipe = AddRecipe(76267, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55030)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Helm -- 76269
	recipe = AddRecipe(76269, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55031)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Redsteel Breastplate -- 76270
	recipe = AddRecipe(76270, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55032)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Bracers -- 76280
	recipe = AddRecipe(76280, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55033)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Gauntlets -- 76281
	recipe = AddRecipe(76281, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55034)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Belt -- 76283
	recipe = AddRecipe(76283, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55035)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Boots -- 76285
	recipe = AddRecipe(76285, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55036)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Shoulders -- 76286
	recipe = AddRecipe(76286, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55037)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Legguards -- 76287
	recipe = AddRecipe(76287, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55038)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Helm -- 76288
	recipe = AddRecipe(76288, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55039)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Breastplate -- 76289
	recipe = AddRecipe(76289, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55040)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Hardened Obsidium Shield -- 76291
	recipe = AddRecipe(76291, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55041)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Stormforged Shield -- 76293
	recipe = AddRecipe(76293, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55042)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Decapitator's Razor -- 76433
	recipe = AddRecipe(76433, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55043)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Cold-Forged Shank -- 76434
	recipe = AddRecipe(76434, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55044)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Fire-Etched Dagger -- 76435
	recipe = AddRecipe(76435, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55045)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 44781, 45548)

	-- Lifeforce Hammer -- 76436
	recipe = AddRecipe(76436, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55046)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Obsidium Executioner -- 76437
	recipe = AddRecipe(76437, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55052)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Obsidium Skeleton Key -- 76438
	recipe = AddRecipe(76438, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55053)
	recipe:SetSkillLevels(475, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Ebonsteel Belt Buckle -- 76439
	recipe = AddRecipe(76439, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66100)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Pyrium Shield Spike -- 76440
	recipe = AddRecipe(76440, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66101)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Shield Spike -- 76441
	recipe = AddRecipe(76441, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55055)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Pyrium Weapon Chain -- 76442
	recipe = AddRecipe(76442, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66103)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Hardened Elementium Hauberk -- 76443
	recipe = AddRecipe(76443, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66104)
	recipe:SetSkillLevels(515, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Hardened Elementium Girdle -- 76444
	recipe = AddRecipe(76444, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66105)
	recipe:SetSkillLevels(510, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Deathplate -- 76445
	recipe = AddRecipe(76445, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66106)
	recipe:SetSkillLevels(515, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Girdle of Pain -- 76446
	recipe = AddRecipe(76446, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66107)
	recipe:SetSkillLevels(510, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Light Elementium Chestguard -- 76447
	recipe = AddRecipe(76447, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66108)
	recipe:SetSkillLevels(515, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Light Elementium Belt -- 76448
	recipe = AddRecipe(76448, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66109)
	recipe:SetSkillLevels(510, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Spellblade -- 76449
	recipe = AddRecipe(76449, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66110)
	recipe:SetSkillLevels(520, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Hammer -- 76450
	recipe = AddRecipe(76450, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66111)
	recipe:SetSkillLevels(515, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Poleaxe -- 76451
	recipe = AddRecipe(76451, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66112)
	recipe:SetSkillLevels(520, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Bonesplitter -- 76452
	recipe = AddRecipe(76452, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66113)
	recipe:SetSkillLevels(515, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Shank -- 76453
	recipe = AddRecipe(76453, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66114)
	recipe:SetSkillLevels(520, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Earthguard -- 76454
	recipe = AddRecipe(76454, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66115)
	recipe:SetSkillLevels(520, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Elementium Stormshield -- 76455
	recipe = AddRecipe(76455, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66116)
	recipe:SetSkillLevels(520, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Bracers -- 76456
	recipe = AddRecipe(76456, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66117)
	recipe:SetSkillLevels(500, 500, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Gauntlets -- 76457
	recipe = AddRecipe(76457, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66118)
	recipe:SetSkillLevels(505, 505, 515, 517, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Belt -- 76458
	recipe = AddRecipe(76458, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66119)
	recipe:SetSkillLevels(510, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Boots -- 76459
	recipe = AddRecipe(76459, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66120)
	recipe:SetSkillLevels(515, 515, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Shoulders -- 76461
	recipe = AddRecipe(76461, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66121)
	recipe:SetSkillLevels(520, 520, 530, 532, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Legguards -- 76462
	recipe = AddRecipe(76462, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66122)
	recipe:SetSkillLevels(525, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Helm -- 76463
	recipe = AddRecipe(76463, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66123)
	recipe:SetSkillLevels(525, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Pyrium Breastplate -- 76464
	recipe = AddRecipe(76464, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66124)
	recipe:SetSkillLevels(525, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Bracers -- 76465
	recipe = AddRecipe(76465, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66125)
	recipe:SetSkillLevels(500, 500, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Gauntlets -- 76466
	recipe = AddRecipe(76466, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66126)
	recipe:SetSkillLevels(505, 505, 515, 517, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Belt -- 76467
	recipe = AddRecipe(76467, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66127)
	recipe:SetSkillLevels(510, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Boots -- 76468
	recipe = AddRecipe(76468, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66128)
	recipe:SetSkillLevels(515, 515, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Shoulders -- 76469
	recipe = AddRecipe(76469, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66129)
	recipe:SetSkillLevels(520, 520, 530, 532, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Legguards -- 76470
	recipe = AddRecipe(76470, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66130)
	recipe:SetSkillLevels(525, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Helm -- 76471
	recipe = AddRecipe(76471, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66131)
	recipe:SetSkillLevels(525, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Bloodthirsty Ornate Pyrium Breastplate -- 76472
	recipe = AddRecipe(76472, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(66132)
	recipe:SetSkillLevels(525, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Obsidium Bladespear -- 76474
	recipe = AddRecipe(76474, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(55246)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Elementium Rod -- 92375
	recipe = AddRecipe(92375, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(65358)
	recipe:SetSkillLevels(475, 475, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2998, 3136, 3174, 3355, 4258, 5164, 5511, 7230, 7231, 11146, 11177, 11178, 16669, 16823, 20124, 20125, 26564, 26981, 26988, 28694, 29505, 33591, 33609, 33631, 37072, 44781, 45548)

	-- Elementium Gutslicer -- 94718
	recipe = AddRecipe(94718, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(67603)
	recipe:SetSkillLevels(515, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Forged Elementium Mindcrusher -- 94732
	recipe = AddRecipe(94732, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(67606)
	recipe:SetSkillLevels(520, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(2999, 3356, 4597, 5512, 16670, 45549, 46359, 50375, 50382)

	-- Fists of Fury -- 99439
	recipe = AddRecipe(99439, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(69957)
	recipe:SetCraftedItemID(69936)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("FIRELANDS_RANDOM")

	-- Eternal Elementium Handguards -- 99440
	recipe = AddRecipe(99440, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(69958)
	recipe:SetCraftedItemID(69937)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("FIRELANDS_RANDOM")

	-- Holy Flame Gauntlets -- 99441
	recipe = AddRecipe(99441, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(69959)
	recipe:SetCraftedItemID(69938)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("FIRELANDS_RANDOM")

	-- Warboots of Mighty Lords -- 99452
	recipe = AddRecipe(99452, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(69968)
	recipe:SetCraftedItemID(69946)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("FIRELANDS_RANDOM")

	-- Mirrored Boots -- 99453
	recipe = AddRecipe(99453, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(69969)
	recipe:SetCraftedItemID(69947)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("FIRELANDS_RANDOM")

	-- Emberforged Elementium Boots -- 99454
	recipe = AddRecipe(99454, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(69970)
	recipe:SetCraftedItemID(69948)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("FIRELANDS_RANDOM")

	-- Brainsplinter -- 99652
	recipe = AddRecipe(99652, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70166)
	recipe:SetCraftedItemID(70155)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Masterwork Elementium Spellblade -- 99653
	recipe = AddRecipe(99653, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70167)
	recipe:SetCraftedItemID(70156)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Lightforged Elementium Hammer -- 99654
	recipe = AddRecipe(99654, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70168)
	recipe:SetCraftedItemID(70157)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Elementium-Edged Scalper -- 99655
	recipe = AddRecipe(99655, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70169)
	recipe:SetCraftedItemID(70158)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Pyrium Spellward -- 99656
	recipe = AddRecipe(99656, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70170)
	recipe:SetCraftedItemID(70162)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Unbreakable Guardian -- 99657
	recipe = AddRecipe(99657, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70171)
	recipe:SetCraftedItemID(70163)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Masterwork Elementium Deathblade -- 99658
	recipe = AddRecipe(99658, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70172)
	recipe:SetCraftedItemID(70164)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	-- Witch-Hunter's Harvester -- 99660
	recipe = AddRecipe(99660, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70173)
	recipe:SetCraftedItemID(70165)
	recipe:SetSkillLevels(525, 525, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	self.InitBlacksmithing = nil
end
