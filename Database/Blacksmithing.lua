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
]]--

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F		= private.filter_flags
local A		= private.acquire_types
local Q		= private.item_qualities
local REP	= private.rep_levels
local FAC	= private.faction_ids
local V		= private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, specialty)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 2018, specialty, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitBlacksmithing()
	local recipe

	-- Rough Sharpening Stone -- 2660
	recipe = AddRecipe(2660, 1, 2862, Q.COMMON, V.ORIG, 1, 15, 35, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom(8)

	-- Copper Chain Belt -- 2661
	recipe = AddRecipe(2661, 35, 2851, Q.COMMON, V.ORIG, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Chain Pants -- 2662
	recipe = AddRecipe(2662, 1, 2852, Q.COMMON, V.ORIG, 1, 50, 70, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Bracers -- 2663
	recipe = AddRecipe(2663, 1, 2853, Q.COMMON, V.ORIG, 1, 20, 40, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom(8)

	-- Runed Copper Bracers -- 2664
	recipe = AddRecipe(2664, 90, 2854, Q.COMMON, V.ORIG, 90, 115, 127, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Coarse Sharpening Stone -- 2665
	recipe = AddRecipe(2665, 65, 2863, Q.COMMON, V.ORIG, 65, 65, 72, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Runed Copper Belt -- 2666
	recipe = AddRecipe(2666, 70, 2857, Q.COMMON, V.ORIG, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Runed Copper Breastplate -- 2667
	recipe = AddRecipe(2667, 80, 2864, Q.UNCOMMON, V.ORIG, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rough Bronze Leggings -- 2668
	recipe = AddRecipe(2668, 105, 2865, Q.COMMON, V.ORIG, 105, 145, 160, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Rough Bronze Cuirass -- 2670
	recipe = AddRecipe(2670, 105, 2866, Q.COMMON, V.ORIG, 105, 145, 160, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Patterned Bronze Bracers -- 2672
	recipe = AddRecipe(2672, 120, 2868, Q.COMMON, V.ORIG, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Silvered Bronze Breastplate -- 2673
	recipe = AddRecipe(2673, 130, 2869, Q.UNCOMMON, V.ORIG, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Sharpening Stone -- 2674
	recipe = AddRecipe(2674, 125, 2871, Q.COMMON, V.ORIG, 125, 125, 132, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Shining Silver Breastplate -- 2675
	recipe = AddRecipe(2675, 145, 2870, Q.COMMON, V.ORIG, 145, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Mace -- 2737
	recipe = AddRecipe(2737, 15, 2844, Q.COMMON, V.ORIG, 15, 55, 75, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Axe -- 2738
	recipe = AddRecipe(2738, 20, 2845, Q.COMMON, V.ORIG, 20, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Shortsword -- 2739
	recipe = AddRecipe(2739, 25, 2847, Q.COMMON, V.ORIG, 25, 65, 85, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Bronze Mace -- 2740
	recipe = AddRecipe(2740, 110, 2848, Q.COMMON, V.ORIG, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Bronze Axe -- 2741
	recipe = AddRecipe(2741, 115, 2849, Q.COMMON, V.ORIG, 115, 145, 160, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Bronze Shortsword -- 2742
	recipe = AddRecipe(2742, 120, 2850, Q.COMMON, V.ORIG, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Rough Weightstone -- 3115
	recipe = AddRecipe(3115, 1, 3239, Q.COMMON, V.ORIG, 1, 15, 35, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Coarse Weightstone -- 3116
	recipe = AddRecipe(3116, 65, 3240, Q.COMMON, V.ORIG, 65, 65, 72, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Weightstone -- 3117
	recipe = AddRecipe(3117, 125, 3241, Q.COMMON, V.ORIG, 125, 125, 132, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Copper Broadsword -- 3292
	recipe = AddRecipe(3292, 95, 3487, Q.COMMON, V.ORIG, 95, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Battle Axe -- 3293
	recipe = AddRecipe(3293, 35, 3488, Q.COMMON, V.ORIG, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Thick War Axe -- 3294
	recipe = AddRecipe(3294, 70, 3489, Q.COMMON, V.ORIG, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Deadly Bronze Poniard -- 3295
	recipe = AddRecipe(3295, 125, 3490, Q.UNCOMMON, V.ORIG, 125, 155, 170, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Bronze Mace -- 3296
	recipe = AddRecipe(3296, 130, 3491, Q.COMMON, V.ORIG, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Mighty Iron Hammer -- 3297
	recipe = AddRecipe(3297, 145, 3492, Q.UNCOMMON, V.ORIG, 145, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Copper Chain Boots -- 3319
	recipe = AddRecipe(3319, 20, 3469, Q.COMMON, V.ORIG, 20, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Rough Grinding Stone -- 3320
	recipe = AddRecipe(3320, 25, 3470, Q.COMMON, V.ORIG, 25, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Chain Vest -- 3321
	recipe = AddRecipe(3321, 35, 3471, Q.UNCOMMON, V.ORIG, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runed Copper Gauntlets -- 3323
	recipe = AddRecipe(3323, 40, 3472, Q.COMMON, V.ORIG, 40, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Runed Copper Pants -- 3324
	recipe = AddRecipe(3324, 45, 3473, Q.COMMON, V.ORIG, 45, 85, 105, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Gemmed Copper Gauntlets -- 3325
	recipe = AddRecipe(3325, 60, 3474, Q.UNCOMMON, V.ORIG, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Coarse Grinding Stone -- 3326
	recipe = AddRecipe(3326, 75, 3478, Q.COMMON, V.ORIG, 75, 75, 87, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Rough Bronze Shoulders -- 3328
	recipe = AddRecipe(3328, 110, 3480, Q.COMMON, V.ORIG, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Silvered Bronze Shoulders -- 3330
	recipe = AddRecipe(3330, 125, 3481, Q.UNCOMMON, V.ORIG, 125, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Silvered Bronze Boots -- 3331
	recipe = AddRecipe(3331, 130, 3482, Q.COMMON, V.ORIG, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Silvered Bronze Gauntlets -- 3333
	recipe = AddRecipe(3333, 135, 3483, Q.COMMON, V.ORIG, 135, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Green Iron Boots -- 3334
	recipe = AddRecipe(3334, 145, 3484, Q.UNCOMMON, V.ORIG, 145, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Gauntlets -- 3336
	recipe = AddRecipe(3336, 150, 3485, Q.UNCOMMON, V.ORIG, 150, 180, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Grinding Stone -- 3337
	recipe = AddRecipe(3337, 125, 3486, Q.COMMON, V.ORIG, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Big Bronze Knife -- 3491
	recipe = AddRecipe(3491, 105, 3848, Q.COMMON, V.ORIG, 105, 135, 150, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Hardened Iron Shortsword -- 3492
	recipe = AddRecipe(3492, 160, 3849, Q.COMMON, V.ORIG, 160, 185, 197, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddLimitedVendor(2843, 1, 5512, 1)

	-- Jade Serpentblade -- 3493
	recipe = AddRecipe(3493, 175, 3850, Q.UNCOMMON, V.ORIG, 175, 200, 212, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Solid Iron Maul -- 3494
	recipe = AddRecipe(3494, 155, 3851, Q.COMMON, V.ORIG, 155, 180, 192, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TWO_HAND, F.MACE)
	recipe:AddLimitedVendor(1471, 1, 8878, 1, 9179, 1, 26081, 1)

	-- Golden Iron Destroyer -- 3495
	recipe = AddRecipe(3495, 170, 3852, Q.UNCOMMON, V.ORIG, 170, 195, 207, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Moonsteel Broadsword -- 3496
	recipe = AddRecipe(3496, 180, 3853, Q.COMMON, V.ORIG, 180, 205, 217, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TWO_HAND, F.SWORD)
	recipe:AddLimitedVendor(2482, 1)

	-- Frost Tiger Blade -- 3497
	recipe = AddRecipe(3497, 200, 3854, Q.UNCOMMON, V.ORIG, 200, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TWO_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Massive Iron Axe -- 3498
	recipe = AddRecipe(3498, 185, 3855, Q.COMMON, V.ORIG, 185, 210, 222, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddLimitedVendor(1146, 1, 2483, 1)

	-- Shadow Crescent Axe -- 3500
	recipe = AddRecipe(3500, 200, 3856, Q.UNCOMMON, V.ORIG, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Bracers -- 3501
	recipe = AddRecipe(3501, 165, 3835, Q.COMMON, V.ORIG, 165, 190, 202, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Green Iron Helm -- 3502
	recipe = AddRecipe(3502, 170, 3836, Q.COMMON, V.ORIG, 170, 195, 207, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Golden Scale Coif -- 3503
	recipe = AddRecipe(3503, 190, 3837, Q.COMMON, V.ORIG, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(5411)

	-- Green Iron Shoulders -- 3504
	recipe = AddRecipe(3504, 160, 3840, Q.UNCOMMON, V.ORIG, 160, 185, 197, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Golden Scale Shoulders -- 3505
	recipe = AddRecipe(3505, 175, 3841, Q.RARE, V.ORIG, 175, 200, 212, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Leggings -- 3506
	recipe = AddRecipe(3506, 155, 3842, Q.COMMON, V.ORIG, 155, 180, 192, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Golden Scale Leggings -- 3507
	recipe = AddRecipe(3507, 170, 3843, Q.UNCOMMON, V.ORIG, 170, 195, 207, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Iron Hauberk -- 3508
	recipe = AddRecipe(3508, 180, 3844, Q.COMMON, V.ORIG, 180, 205, 217, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Golden Scale Cuirass -- 3511
	recipe = AddRecipe(3511, 195, 3845, Q.UNCOMMON, V.ORIG, 195, 220, 232, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Polished Steel Boots -- 3513
	recipe = AddRecipe(3513, 185, 3846, Q.UNCOMMON, V.ORIG, 185, 210, 222, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Golden Scale Boots -- 3515
	recipe = AddRecipe(3515, 200, 3847, Q.RARE, V.ORIG, 200, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Pearl-handled Dagger -- 6517
	recipe = AddRecipe(6517, 110, 5540, Q.COMMON, V.ORIG, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Iridescent Hammer -- 6518
	recipe = AddRecipe(6518, 140, 5541, Q.UNCOMMON, V.ORIG, 140, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Iron Shield Spike -- 7221
	recipe = AddRecipe(7221, 150, 6042, Q.UNCOMMON, V.ORIG, 150, 180, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Iron Counterweight -- 7222
	recipe = AddRecipe(7222, 165, 6043, Q.UNCOMMON, V.ORIG, 165, 190, 202, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.AXE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Golden Scale Bracers -- 7223
	recipe = AddRecipe(7223, 185, 6040, Q.COMMON, V.ORIG, 185, 210, 222, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Steel Weapon Chain -- 7224
	recipe = AddRecipe(7224, 190, 6041, Q.UNCOMMON, V.ORIG, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Copper Maul -- 7408
	recipe = AddRecipe(7408, 65, 6214, Q.COMMON, V.ORIG, 65, 105, 125, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Rough Bronze Boots -- 7817
	recipe = AddRecipe(7817, 95, 6350, Q.COMMON, V.ORIG, 95, 125, 140, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Silver Rod -- 7818
	recipe = AddRecipe(7818, 100, 6338, Q.COMMON, V.ORIG, 100, 105, 107, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Ironforge Breastplate -- 8367
	recipe = AddRecipe(8367, 100, 6731, Q.UNCOMMON, V.ORIG, 100, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(1618)

	-- Iron Buckle -- 8768
	recipe = AddRecipe(8768, 150, 7071, Q.COMMON, V.ORIG, 150, 150, 152, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Copper Dagger -- 8880
	recipe = AddRecipe(8880, 30, 7166, Q.COMMON, V.ORIG, 30, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Barbaric Iron Shoulders -- 9811
	recipe = AddRecipe(9811, 160, 7913, Q.UNCOMMON, V.ORIG, 160, 185, 197, 210)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2752)

	-- Barbaric Iron Breastplate -- 9813
	recipe = AddRecipe(9813, 160, 7914, Q.UNCOMMON, V.ORIG, 160, 185, 197, 210)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOP, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2751)

	-- Barbaric Iron Helm -- 9814
	recipe = AddRecipe(9814, 175, 7915, Q.UNCOMMON, V.ORIG, 175, 200, 212, 225)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2754)

	-- Barbaric Iron Boots -- 9818
	recipe = AddRecipe(9818, 180, 7916, Q.UNCOMMON, V.ORIG, 180, 205, 217, 230)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2753)

	-- Barbaric Iron Gloves -- 9820
	recipe = AddRecipe(9820, 185, 7917, Q.UNCOMMON, V.ORIG, 185, 210, 222, 235)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddQuest(2755)

	-- Steel Breastplate -- 9916
	recipe = AddRecipe(9916, 200, 7963, Q.COMMON, V.ORIG, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Solid Sharpening Stone -- 9918
	recipe = AddRecipe(9918, 200, 7964, Q.COMMON, V.ORIG, 200, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Solid Grinding Stone -- 9920
	recipe = AddRecipe(9920, 200, 7966, Q.COMMON, V.ORIG, 200, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Solid Weightstone -- 9921
	recipe = AddRecipe(9921, 200, 7965, Q.COMMON, V.ORIG, 200, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Mithril Shoulder -- 9926
	recipe = AddRecipe(9926, 205, 7918, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Mithril Gauntlet -- 9928
	recipe = AddRecipe(9928, 205, 7919, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Mithril Scale Pants -- 9931
	recipe = AddRecipe(9931, 210, 7920, Q.COMMON, V.ORIG, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Mithril Pants -- 9933
	recipe = AddRecipe(9933, 210, 7921, Q.UNCOMMON, V.ORIG, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Steel Plate Helm -- 9935
	recipe = AddRecipe(9935, 215, 7922, Q.COMMON, V.ORIG, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Mithril Scale Bracers -- 9937
	recipe = AddRecipe(9937, 215, 7924, Q.COMMON, V.ORIG, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(8161, 8176)

	-- Mithril Shield Spike -- 9939
	recipe = AddRecipe(9939, 215, 7967, Q.RARE, V.ORIG, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ornate Mithril Pants -- 9945
	recipe = AddRecipe(9945, 220, 7926, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Ornate Mithril Gloves -- 9950
	recipe = AddRecipe(9950, 220, 7927, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom(48)

	-- Ornate Mithril Shoulder -- 9952
	recipe = AddRecipe(9952, 225, 7928, Q.UNCOMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Truesilver Gauntlets -- 9954
	recipe = AddRecipe(9954, 225, 7938, Q.COMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Orcish War Leggings -- 9957
	recipe = AddRecipe(9957, 250, 7929, Q.COMMON, V.ORIG, 250, 250, 260, 270)
	recipe:AddFilters(F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Heavy Mithril Breastplate -- 9959
	recipe = AddRecipe(9959, 230, 7930, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Mithril Coif -- 9961
	recipe = AddRecipe(9961, 230, 7931, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Mithril Spurs -- 9964
	recipe = AddRecipe(9964, 235, 7969, Q.UNCOMMON, V.ORIG, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mithril Scale Shoulders -- 9966
	recipe = AddRecipe(9966, 235, 7932, Q.RARE, V.ORIG, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Mithril Boots -- 9968
	recipe = AddRecipe(9968, 235, 7933, Q.COMMON, V.ORIG, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Mithril Helm -- 9970
	recipe = AddRecipe(9970, 245, 7934, Q.UNCOMMON, V.ORIG, 245, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ornate Mithril Breastplate -- 9972
	recipe = AddRecipe(9972, 260, 7935, Q.UNCOMMON, V.ORIG, 260, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Truesilver Breastplate -- 9974
	recipe = AddRecipe(9974, 245, 7939, Q.COMMON, V.ORIG, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom(48)

	-- Ornate Mithril Boots -- 9979
	recipe = AddRecipe(9979, 265, 7936, Q.UNCOMMON, V.ORIG, 265, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Ornate Mithril Helm -- 9980
	recipe = AddRecipe(9980, 265, 7937, Q.UNCOMMON, V.ORIG, 265, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Copper Claymore -- 9983
	recipe = AddRecipe(9983, 30, 7955, Q.COMMON, V.ORIG, 30, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Bronze Warhammer -- 9985
	recipe = AddRecipe(9985, 125, 7956, Q.COMMON, V.ORIG, 125, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Bronze Greatsword -- 9986
	recipe = AddRecipe(9986, 130, 7957, Q.COMMON, V.ORIG, 130, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Bronze Battle Axe -- 9987
	recipe = AddRecipe(9987, 135, 7958, Q.COMMON, V.ORIG, 135, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Heavy Mithril Axe -- 9993
	recipe = AddRecipe(9993, 210, 7941, Q.COMMON, V.ORIG, 210, 235, 247, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Blue Glittering Axe -- 9995
	recipe = AddRecipe(9995, 220, 7942, Q.UNCOMMON, V.ORIG, 220, 245, 257, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wicked Mithril Blade -- 9997
	recipe = AddRecipe(9997, 225, 7943, Q.UNCOMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Big Black Mace -- 10001
	recipe = AddRecipe(10001, 230, 7945, Q.COMMON, V.ORIG, 230, 255, 267, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- The Shatterer -- 10003
	recipe = AddRecipe(10003, 235, 7954, Q.COMMON, V.ORIG, 235, 260, 272, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Dazzling Mithril Rapier -- 10005
	recipe = AddRecipe(10005, 240, 7944, Q.UNCOMMON, V.ORIG, 240, 265, 277, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Phantom Blade -- 10007
	recipe = AddRecipe(10007, 245, 7961, Q.COMMON, V.ORIG, 245, 270, 282, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Runed Mithril Hammer -- 10009
	recipe = AddRecipe(10009, 245, 7946, Q.RARE, V.ORIG, 245, 270, 282, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Blight -- 10011
	recipe = AddRecipe(10011, 250, 7959, Q.COMMON, V.ORIG, 250, 275, 287, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.TWO_HAND, F.POLEARM)
	recipe:AddCustom(48)

	-- Ebon Shiv -- 10013
	recipe = AddRecipe(10013, 255, 7947, Q.COMMON, V.ORIG, 255, 280, 292, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddVendor(11278)

	-- Truesilver Champion -- 10015
	recipe = AddRecipe(10015, 260, 7960, Q.COMMON, V.ORIG, 260, 285, 297, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.TWO_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Inlaid Mithril Cylinder -- 11454
	recipe = AddRecipe(11454, 200, 9060, Q.COMMON, V.ORIG, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddCustom(9)

	-- Golden Scale Gauntlets -- 11643
	recipe = AddRecipe(11643, 205, 9366, Q.UNCOMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Silvered Bronze Leggings -- 12259
	recipe = AddRecipe(12259, 155, 10423, Q.UNCOMMON, V.ORIG, 155, 180, 192, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rough Copper Vest -- 12260
	recipe = AddRecipe(12260, 1, 10421, Q.COMMON, V.ORIG, 1, 15, 35, 55)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom(8)

	-- Golden Rod -- 14379
	recipe = AddRecipe(14379, 150, 11128, Q.COMMON, V.ORIG, 150, 155, 157, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Truesilver Rod -- 14380
	recipe = AddRecipe(14380, 200, 11144, Q.COMMON, V.ORIG, 200, 205, 207, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Dark Iron Pulverizer -- 15292
	recipe = AddRecipe(15292, 265, 11608, Q.RARE, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TWO_HAND, F.MACE)
	recipe:AddMobDrop(9028)

	-- Dark Iron Mail -- 15293
	recipe = AddRecipe(15293, 270, 11606, Q.UNCOMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom(25)

	-- Dark Iron Sunderer -- 15294
	recipe = AddRecipe(15294, 275, 11607, Q.RARE, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TWO_HAND, F.AXE)
	recipe:AddMobDrop(9554, 10043)

	-- Dark Iron Shoulders -- 15295
	recipe = AddRecipe(15295, 280, 11605, Q.UNCOMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom(25)

	-- Dark Iron Plate -- 15296
	recipe = AddRecipe(15296, 285, 11604, Q.RARE, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.PLATE)
	recipe:AddMobDrop(9543)

	-- Glinting Steel Dagger -- 15972
	recipe = AddRecipe(15972, 180, 12259, Q.COMMON, V.ORIG, 180, 205, 217, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Searing Golden Blade -- 15973
	recipe = AddRecipe(15973, 190, 12260, Q.UNCOMMON, V.ORIG, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dense Grinding Stone -- 16639
	recipe = AddRecipe(16639, 250, 12644, Q.COMMON, V.ORIG, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Dense Weightstone -- 16640
	recipe = AddRecipe(16640, 250, 12643, Q.COMMON, V.ORIG, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Dense Sharpening Stone -- 16641
	recipe = AddRecipe(16641, 250, 12404, Q.COMMON, V.ORIG, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Thorium Armor -- 16642
	recipe = AddRecipe(16642, 250, 12405, Q.COMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Belt -- 16643
	recipe = AddRecipe(16643, 250, 12406, Q.COMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Bracers -- 16644
	recipe = AddRecipe(16644, 255, 12408, Q.COMMON, V.ORIG, 255, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Radiant Belt -- 16645
	recipe = AddRecipe(16645, 260, 12416, Q.UNCOMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Shoulders -- 16646
	recipe = AddRecipe(16646, 265, 12428, Q.UNCOMMON, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Imperial Plate Belt -- 16647
	recipe = AddRecipe(16647, 265, 12424, Q.UNCOMMON, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Radiant Breastplate -- 16648
	recipe = AddRecipe(16648, 270, 12415, Q.UNCOMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Bracers -- 16649
	recipe = AddRecipe(16649, 270, 12425, Q.UNCOMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Wildthorn Mail -- 16650
	recipe = AddRecipe(16650, 270, 12624, Q.UNCOMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Shield Spike -- 16651
	recipe = AddRecipe(16651, 275, 12645, Q.UNCOMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Boots -- 16652
	recipe = AddRecipe(16652, 280, 12409, Q.COMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Helm -- 16653
	recipe = AddRecipe(16653, 280, 12410, Q.COMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Radiant Gloves -- 16654
	recipe = AddRecipe(16654, 285, 12418, Q.UNCOMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fiery Plate Gauntlets -- 16655
	recipe = AddRecipe(16655, 290, 12631, Q.RARE, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom(48)

	-- Radiant Boots -- 16656
	recipe = AddRecipe(16656, 290, 12419, Q.UNCOMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Boots -- 16657
	recipe = AddRecipe(16657, 295, 12426, Q.UNCOMMON, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Imperial Plate Helm -- 16658
	recipe = AddRecipe(16658, 295, 12427, Q.UNCOMMON, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Radiant Circlet -- 16659
	recipe = AddRecipe(16659, 295, 12417, Q.UNCOMMON, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dawnbringer Shoulders -- 16660
	recipe = AddRecipe(16660, 290, 12625, Q.RARE, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Storm Gauntlets -- 16661
	recipe = AddRecipe(16661, 295, 12632, Q.RARE, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(11278)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Thorium Leggings -- 16662
	recipe = AddRecipe(16662, 300, 12414, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Chest -- 16663
	recipe = AddRecipe(16663, 300, 12422, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Runic Plate Shoulders -- 16664
	recipe = AddRecipe(16664, 300, 12610, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddMobDrop(4366)

	-- Runic Plate Boots -- 16665
	recipe = AddRecipe(16665, 300, 12611, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddMobDrop(1836)

	-- Demon Forged Breastplate -- 16667
	recipe = AddRecipe(16667, 285, 12628, Q.RARE, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddCustom(48)

	-- Whitesoul Helm -- 16724
	recipe = AddRecipe(16724, 300, 12633, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Radiant Leggings -- 16725
	recipe = AddRecipe(16725, 300, 12420, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runic Plate Helm -- 16726
	recipe = AddRecipe(16726, 300, 12612, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddMobDrop(4364)

	-- Helm of the Great Chief -- 16728
	recipe = AddRecipe(16728, 300, 12636, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lionheart Helm -- 16729
	recipe = AddRecipe(16729, 300, 12640, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Imperial Plate Leggings -- 16730
	recipe = AddRecipe(16730, 300, 12429, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 4258, 4596, 5164, 5511, 7230, 11146, 11177, 11178, 16583, 16669, 16724, 16823, 20124, 20125, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29505, 29506, 29924, 33591, 33609, 37072, 44781, 45548)

	-- Runic Breastplate -- 16731
	recipe = AddRecipe(16731, 300, 12613, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddMobDrop(4368, 16072)

	-- Runic Plate Leggings -- 16732
	recipe = AddRecipe(16732, 300, 12614, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddMobDrop(1885)

	-- Stronghold Gauntlets -- 16741
	recipe = AddRecipe(16741, 300, 12639, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchanted Thorium Helm -- 16742
	recipe = AddRecipe(16742, 300, 12620, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddQuest(7651)

	-- Enchanted Thorium Leggings -- 16744
	recipe = AddRecipe(16744, 300, 12619, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddQuest(7650)

	-- Enchanted Thorium Breastplate -- 16745
	recipe = AddRecipe(16745, 300, 12618, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddQuest(7649)

	-- Invulnerable Mail -- 16746
	recipe = AddRecipe(16746, 300, 12641, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ornate Thorium Handaxe -- 16969
	recipe = AddRecipe(16969, 275, 12773, Q.COMMON, V.ORIG, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddVendor(11278)

	-- Dawn's Edge -- 16970
	recipe = AddRecipe(16970, 275, 12774, Q.RARE, V.ORIG, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Huge Thorium Battleaxe -- 16971
	recipe = AddRecipe(16971, 280, 12775, Q.COMMON, V.ORIG, 280, 305, 317, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16724, 16823, 17245, 33609, 33631, 33675)
	recipe:AddVendor(11278)

	-- Enchanted Battlehammer -- 16973
	recipe = AddRecipe(16973, 280, 12776, Q.UNCOMMON, V.ORIG, 280, 305, 317, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.TANK, F.TWO_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Blazing Rapier -- 16978
	recipe = AddRecipe(16978, 280, 12777, Q.UNCOMMON, V.ORIG, 280, 305, 317, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Serenity -- 16983
	recipe = AddRecipe(16983, 285, 12781, Q.UNCOMMON, V.ORIG, 285, 310, 322, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddCustom(31)

	-- Volcanic Hammer -- 16984
	recipe = AddRecipe(16984, 290, 12792, Q.UNCOMMON, V.ORIG, 290, 315, 327, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddMobDrop(10119)

	-- Corruption -- 16985
	recipe = AddRecipe(16985, 290, 12782, Q.COMMON, V.ORIG, 290, 315, 327, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.TWO_HAND, F.SWORD)
	recipe:AddCustom(31)

	-- Hammer of the Titans -- 16988
	recipe = AddRecipe(16988, 300, 12796, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddMobDrop(10438)

	-- Arcanite Champion -- 16990
	recipe = AddRecipe(16990, 300, 12790, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddMobDrop(10899)

	-- Annihilator -- 16991
	recipe = AddRecipe(16991, 300, 12798, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddMobDrop(9736)

	-- Frostguard -- 16992
	recipe = AddRecipe(16992, 300, 12797, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.SWORD)
	recipe:AddMobDrop(1844)

	-- Masterwork Stormhammer -- 16993
	recipe = AddRecipe(16993, 300, 12794, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddMobDrop(10899)

	-- Arcanite Reaper -- 16994
	recipe = AddRecipe(16994, 300, 12784, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddMobDrop(9596)

	-- Heartseeker -- 16995
	recipe = AddRecipe(16995, 300, 12783, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddMobDrop(10997)

	-- Silver Skeleton Key -- 19666
	recipe = AddRecipe(19666, 100, 15869, Q.COMMON, V.ORIG, 100, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Golden Skeleton Key -- 19667
	recipe = AddRecipe(19667, 150, 15870, Q.COMMON, V.ORIG, 150, 150, 160, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Truesilver Skeleton Key -- 19668
	recipe = AddRecipe(19668, 200, 15871, Q.COMMON, V.ORIG, 200, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Arcanite Skeleton Key -- 19669
	recipe = AddRecipe(19669, 275, 15872, Q.COMMON, V.ORIG, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Arcanite Rod -- 20201
	recipe = AddRecipe(20201, 275, 16206, Q.COMMON, V.ORIG, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fiery Chain Girdle -- 20872
	recipe = AddRecipe(20872, 295, 16989, Q.RARE, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Fiery Chain Shoulders -- 20873
	recipe = AddRecipe(20873, 300, 16988, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Dark Iron Bracers -- 20874
	recipe = AddRecipe(20874, 295, 17014, Q.RARE, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Dark Iron Leggings -- 20876
	recipe = AddRecipe(20876, 300, 17013, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Dark Iron Reaver -- 20890
	recipe = AddRecipe(20890, 300, 17015, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.SWORD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Dark Iron Destroyer -- 20897
	recipe = AddRecipe(20897, 300, 17016, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.AXE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Sulfuron Hammer -- 21161
	recipe = AddRecipe(21161, 300, 17193, Q.EPIC, V.ORIG, 300, 325, 337, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.TWO_HAND, F.MACE)
	recipe:AddQuest(7604)

	-- Edge of Winter -- 21913
	recipe = AddRecipe(21913, 190, 17704, Q.UNCOMMON, V.ORIG, 190, 215, 227, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddSeason(1)

	-- Elemental Sharpening Stone -- 22757
	recipe = AddRecipe(22757, 300, 18262, Q.RARE, V.ORIG, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP)
	recipe:AddCustom(26)

	-- Heavy Timbermaw Belt -- 23628
	recipe = AddRecipe(23628, 290, 19043, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.MAIL)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Heavy Timbermaw Boots -- 23629
	recipe = AddRecipe(23629, 300, 19048, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.MAIL)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.REVERED, 11557)

	-- Girdle of the Dawn -- 23632
	recipe = AddRecipe(23632, 290, 19051, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ARGENTDAWN, F.PLATE)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Gloves of the Dawn -- 23633
	recipe = AddRecipe(23633, 300, 19057, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ARGENTDAWN, F.PLATE)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Dark Iron Helm -- 23636
	recipe = AddRecipe(23636, 300, 19148, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Dark Iron Gauntlets -- 23637
	recipe = AddRecipe(23637, 300, 19164, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Black Amnesty -- 23638
	recipe = AddRecipe(23638, 300, 19166, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.DAGGER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Blackfury -- 23639
	recipe = AddRecipe(23639, 300, 19167, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.TWO_HAND, F.POLEARM)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Ebon Hand -- 23650
	recipe = AddRecipe(23650, 300, 19170, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.MACE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Blackguard -- 23652
	recipe = AddRecipe(23652, 300, 19168, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.SWORD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Nightfall -- 23653
	recipe = AddRecipe(23653, 300, 19169, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.TWO_HAND, F.AXE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Bloodsoul Breastplate -- 24136
	recipe = AddRecipe(24136, 300, 19690, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Bloodsoul Shoulders -- 24137
	recipe = AddRecipe(24137, 300, 19691, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Bloodsoul Gauntlets -- 24138
	recipe = AddRecipe(24138, 300, 19692, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Darksoul Breastplate -- 24139
	recipe = AddRecipe(24139, 300, 19693, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Darksoul Leggings -- 24140
	recipe = AddRecipe(24140, 300, 19694, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Darksoul Shoulders -- 24141
	recipe = AddRecipe(24141, 300, 19695, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Dark Iron Boots -- 24399
	recipe = AddRecipe(24399, 300, 20039, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.PLATE)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.EXALTED, 12944)

	-- Darkrune Gauntlets -- 24912
	recipe = AddRecipe(24912, 300, 20549, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddQuest(8323)

	-- Darkrune Helm -- 24913
	recipe = AddRecipe(24913, 300, 20551, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.PLATE)
	recipe:AddQuest(8323)

	-- Darkrune Breastplate -- 24914
	recipe = AddRecipe(24914, 300, 20550, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddQuest(8323)

	-- Heavy Obsidian Belt -- 27585
	recipe = AddRecipe(27585, 300, 22197, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15176)

	-- Jagged Obsidian Shield -- 27586
	recipe = AddRecipe(27586, 300, 22198, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.SHIELD, F.ONE_HAND)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15471)

	-- Thick Obsidian Breastplate -- 27587
	recipe = AddRecipe(27587, 300, 22196, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddMobDrop(15263)

	-- Light Obsidian Belt -- 27588
	recipe = AddRecipe(27588, 300, 22195, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15176)

	-- Black Grasp of the Destroyer -- 27589
	recipe = AddRecipe(27589, 300, 22194, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(15340)

	-- Obsidian Mail Tunic -- 27590
	recipe = AddRecipe(27590, 300, 22191, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.EXALTED, 15471)

	-- Titanic Leggings -- 27829
	recipe = AddRecipe(27829, 300, 22385, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Persuader -- 27830
	recipe = AddRecipe(27830, 300, 22384, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Sageblade -- 27832
	recipe = AddRecipe(27832, 300, 22383, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Icebane Breastplate -- 28242
	recipe = AddRecipe(28242, 300, 22669, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(41)

	-- Icebane Gauntlets -- 28243
	recipe = AddRecipe(28243, 300, 22670, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(41)

	-- Icebane Bracers -- 28244
	recipe = AddRecipe(28244, 300, 22671, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(41)

	-- Ironvine Breastplate -- 28461
	recipe = AddRecipe(28461, 300, 22762, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15176)

	-- Ironvine Gloves -- 28462
	recipe = AddRecipe(28462, 300, 22763, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15176)

	-- Ironvine Belt -- 28463
	recipe = AddRecipe(28463, 300, 22764, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_CIRCLE, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15176)

	-- Fel Iron Plate Gloves -- 29545
	recipe = AddRecipe(29545, 300, 23482, Q.COMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Plate Belt -- 29547
	recipe = AddRecipe(29547, 305, 23484, Q.COMMON, V.TBC, 305, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Plate Boots -- 29548
	recipe = AddRecipe(29548, 315, 23487, Q.COMMON, V.TBC, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Plate Pants -- 29549
	recipe = AddRecipe(29549, 315, 23488, Q.COMMON, V.TBC, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Breastplate -- 29550
	recipe = AddRecipe(29550, 325, 23489, Q.COMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Chain Coif -- 29551
	recipe = AddRecipe(29551, 300, 23493, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Chain Gloves -- 29552
	recipe = AddRecipe(29552, 310, 23491, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Chain Bracers -- 29553
	recipe = AddRecipe(29553, 315, 23494, Q.COMMON, V.TBC, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Chain Tunic -- 29556
	recipe = AddRecipe(29556, 320, 23490, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Hatchet -- 29557
	recipe = AddRecipe(29557, 310, 23497, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Hammer -- 29558
	recipe = AddRecipe(29558, 315, 23498, Q.COMMON, V.TBC, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Fel Iron Greatsword -- 29565
	recipe = AddRecipe(29565, 320, 23499, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Adamantite Maul -- 29566
	recipe = AddRecipe(29566, 325, 23502, Q.COMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddVendor(16670, 16713, 19662)

	-- Adamantite Cleaver -- 29568
	recipe = AddRecipe(29568, 330, 23503, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddVendor(16670, 16713, 19662)

	-- Adamantite Dagger -- 29569
	recipe = AddRecipe(29569, 330, 23504, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.ONE_HAND, F.DAGGER)
	recipe:AddVendor(16670, 16713, 19662)

	-- Adamantite Rapier -- 29571
	recipe = AddRecipe(29571, 335, 23505, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.ONE_HAND, F.SWORD)
	recipe:AddVendor(16670, 16713, 19662)

	-- Adamantite Plate Bracers -- 29603
	recipe = AddRecipe(29603, 335, 23506, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddVendor(19342, 19694)

	-- Adamantite Plate Gloves -- 29605
	recipe = AddRecipe(29605, 335, 23508, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddVendor(19342, 19694)

	-- Adamantite Breastplate -- 29606
	recipe = AddRecipe(29606, 340, 23507, Q.COMMON, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddVendor(19342, 19694)

	-- Enchanted Adamantite Belt -- 29608
	recipe = AddRecipe(29608, 355, 23510, Q.COMMON, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.FRIENDLY, 19331)

	-- Enchanted Adamantite Breastplate -- 29610
	recipe = AddRecipe(29610, 360, 23509, Q.COMMON, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Enchanted Adamantite Boots -- 29611
	recipe = AddRecipe(29611, 355, 23511, Q.COMMON, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Enchanted Adamantite Leggings -- 29613
	recipe = AddRecipe(29613, 365, 23512, Q.COMMON, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCRYER, F.PLATE)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Flamebane Bracers -- 29614
	recipe = AddRecipe(29614, 350, 23515, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Flamebane Helm -- 29615
	recipe = AddRecipe(29615, 355, 23516, Q.COMMON, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Flamebane Gloves -- 29616
	recipe = AddRecipe(29616, 360, 23514, Q.COMMON, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Flamebane Breastplate -- 29617
	recipe = AddRecipe(29617, 365, 23513, Q.COMMON, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR, F.PLATE)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Felsteel Gloves -- 29619
	recipe = AddRecipe(29619, 360, 23517, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddMobDrop(18497)

	-- Felsteel Leggings -- 29620
	recipe = AddRecipe(29620, 360, 23518, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddMobDrop(20900)

	-- Felsteel Helm -- 29621
	recipe = AddRecipe(29621, 365, 23519, Q.RARE, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddMobDrop(18830)

	-- Gauntlets of the Iron Tower -- 29622
	recipe = AddRecipe(29622, 365, 23532, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Khorium Belt -- 29628
	recipe = AddRecipe(29628, 360, 23524, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddMobDrop(18203)

	-- Khorium Pants -- 29629
	recipe = AddRecipe(29629, 360, 23523, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddMobDrop(20878)

	-- Khorium Boots -- 29630
	recipe = AddRecipe(29630, 365, 23525, Q.RARE, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddMobDrop(18873)

	-- Ragesteel Gloves -- 29642
	recipe = AddRecipe(29642, 365, 23520, Q.RARE, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(17136)

	-- Ragesteel Helm -- 29643
	recipe = AddRecipe(29643, 365, 23521, Q.RARE, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(16952)

	-- Ragesteel Breastplate -- 29645
	recipe = AddRecipe(29645, 370, 23522, Q.RARE, V.TBC, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(21454, 23305, 23324)

	-- Swiftsteel Gloves -- 29648
	recipe = AddRecipe(29648, 370, 23526, Q.RARE, V.TBC, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(18314)

	-- Earthpeace Breastplate -- 29649
	recipe = AddRecipe(29649, 370, 23527, Q.RARE, V.TBC, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(17975)

	-- Fel Sharpening Stone -- 29654
	recipe = AddRecipe(29654, 300, 23528, Q.COMMON, V.TBC, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Adamantite Sharpening Stone -- 29656
	recipe = AddRecipe(29656, 350, 23529, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Felsteel Shield Spike -- 29657
	recipe = AddRecipe(29657, 360, 23530, Q.COMMON, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.EXALTED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.EXALTED, 17585)

	-- Felfury Gauntlets -- 29658
	recipe = AddRecipe(29658, 365, 23531, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Steelgrip Gauntlets -- 29662
	recipe = AddRecipe(29662, 365, 23533, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Storm Helm -- 29663
	recipe = AddRecipe(29663, 365, 23534, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Helm of the Stalwart Defender -- 29664
	recipe = AddRecipe(29664, 365, 23535, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Oathkeeper's Helm -- 29668
	recipe = AddRecipe(29668, 365, 23536, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Black Felsteel Bracers -- 29669
	recipe = AddRecipe(29669, 365, 23537, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Bracers of the Green Fortress -- 29671
	recipe = AddRecipe(29671, 365, 23538, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Blessed Bracers -- 29672
	recipe = AddRecipe(29672, 365, 23539, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddWorldDrop("Outland")

	-- Felsteel Longblade -- 29692
	recipe = AddRecipe(29692, 365, 23540, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddWorldDrop("Outland")

	-- Khorium Champion -- 29693
	recipe = AddRecipe(29693, 365, 23541, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddWorldDrop("Outland")

	-- Fel Edged Battleaxe -- 29694
	recipe = AddRecipe(29694, 365, 23542, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.AXE)
	recipe:AddWorldDrop("Outland")

	-- Felsteel Reaper -- 29695
	recipe = AddRecipe(29695, 365, 23543, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddWorldDrop("Outland")

	-- Runic Hammer -- 29696
	recipe = AddRecipe(29696, 365, 23544, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Fel Hardened Maul -- 29697
	recipe = AddRecipe(29697, 365, 23546, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Eternium Runed Blade -- 29698
	recipe = AddRecipe(29698, 365, 23554, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Outland")

	-- Dirge -- 29699
	recipe = AddRecipe(29699, 365, 23555, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddWorldDrop("Outland")

	-- Hand of Eternity -- 29700
	recipe = AddRecipe(29700, 365, 23556, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Lesser Ward of Shielding -- 29728
	recipe = AddRecipe(29728, 340, 23575, Q.COMMON, V.TBC, 340, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16583, 19373)

	-- Greater Ward of Shielding -- 29729
	recipe = AddRecipe(29729, 375, 23576, Q.RARE, V.TBC, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18853)

	-- Lesser Rune of Warding -- 32284
	recipe = AddRecipe(32284, 325, 23559, Q.COMMON, V.TBC, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631)

	-- Greater Rune of Warding -- 32285
	recipe = AddRecipe(32285, 350, 25521, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Fel Iron Rod -- 32655
	recipe = AddRecipe(32655, 300, 25843, Q.COMMON, V.TBC, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Adamantite Rod -- 32656
	recipe = AddRecipe(32656, 350, 25844, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(19662)

	-- Eternium Rod -- 32657
	recipe = AddRecipe(32657, 360, 25845, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16583, 19373)

	-- Nether Chain Shirt -- 34529
	recipe = AddRecipe(34529, 350, 23563, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Twisting Nether Chain Shirt -- 34530
	recipe = AddRecipe(34530, 375, 23564, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Breastplate of Kings -- 34533
	recipe = AddRecipe(34533, 350, 28483, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Bulwark of Kings -- 34534
	recipe = AddRecipe(34534, 375, 28484, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Fireguard -- 34535
	recipe = AddRecipe(34535, 350, 28425, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Blazeguard -- 34537
	recipe = AddRecipe(34537, 375, 28426, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Lionheart Blade -- 34538
	recipe = AddRecipe(34538, 350, 28428, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Lionheart Champion -- 34540
	recipe = AddRecipe(34540, 375, 28429, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- The Planar Edge -- 34541
	recipe = AddRecipe(34541, 350, 28431, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Black Planar Edge -- 34542
	recipe = AddRecipe(34542, 375, 28432, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Lunar Crescent -- 34543
	recipe = AddRecipe(34543, 350, 28434, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Mooncleaver -- 34544
	recipe = AddRecipe(34544, 375, 28435, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Drakefist Hammer -- 34545
	recipe = AddRecipe(34545, 350, 28437, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Dragonmaw -- 34546
	recipe = AddRecipe(34546, 375, 28438, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Thunder -- 34547
	recipe = AddRecipe(34547, 350, 28440, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Deep Thunder -- 34548
	recipe = AddRecipe(34548, 375, 28441, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Fel Weightstone -- 34607
	recipe = AddRecipe(34607, 300, 28420, Q.COMMON, V.TBC, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Adamantite Weightstone -- 34608
	recipe = AddRecipe(34608, 350, 28421, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Thick Bronze Darts -- 34979
	recipe = AddRecipe(34979, 100, 29201, Q.COMMON, V.TBC, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Whirling Steel Axes -- 34981
	recipe = AddRecipe(34981, 200, 29202, Q.COMMON, V.TBC, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16669, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Enchanted Thorium Blades -- 34982
	recipe = AddRecipe(34982, 300, 29203, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(514, 1241, 2836, 2998, 3136, 3174, 3355, 3478, 3557, 4258, 4596, 5511, 6299, 15400, 16583, 16724, 16823, 17245, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Felsteel Whisper Knives -- 34983
	recipe = AddRecipe(34983, 350, 29204, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.THROWN)
	recipe:AddTrainer(3355, 16583, 16823, 19341, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591, 33609, 33631, 33675)

	-- Earthforged Leggings -- 36122
	recipe = AddRecipe(36122, 260, 30069, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Windforged Leggings -- 36124
	recipe = AddRecipe(36124, 260, 30070, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Light Earthforged Blade -- 36125
	recipe = AddRecipe(36125, 260, 30071, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Light Skyforged Axe -- 36126
	recipe = AddRecipe(36126, 260, 30072, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Light Emberforged Hammer -- 36128
	recipe = AddRecipe(36128, 260, 30073, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Heavy Earthforged Breastplate -- 36129
	recipe = AddRecipe(36129, 330, 30074, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(48)

	-- Stormforged Hauberk -- 36130
	recipe = AddRecipe(36130, 330, 30076, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Windforged Rapier -- 36131
	recipe = AddRecipe(36131, 330, 30077, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Stoneforged Claymore -- 36133
	recipe = AddRecipe(36133, 330, 30086, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Stormforged Axe -- 36134
	recipe = AddRecipe(36134, 330, 30087, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Skyforged Great Axe -- 36135
	recipe = AddRecipe(36135, 330, 30088, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Lavaforged Warhammer -- 36136
	recipe = AddRecipe(36136, 330, 30089, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Great Earthforged Hammer -- 36137
	recipe = AddRecipe(36137, 330, 30093, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Embrace of the Twisting Nether -- 36256
	recipe = AddRecipe(36256, 375, 23565, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Bulwark of the Ancient Kings -- 36257
	recipe = AddRecipe(36257, 375, 28485, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Blazefury -- 36258
	recipe = AddRecipe(36258, 375, 28427, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Lionheart Executioner -- 36259
	recipe = AddRecipe(36259, 375, 28430, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Wicked Edge of the Planes -- 36260
	recipe = AddRecipe(36260, 375, 28433, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Bloodmoon -- 36261
	recipe = AddRecipe(36261, 375, 28436, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddCustom(48)

	-- Dragonstrike -- 36262
	recipe = AddRecipe(36262, 375, 28439, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.ONE_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Stormherald -- 36263
	recipe = AddRecipe(36263, 375, 28442, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Belt of the Guardian -- 36389
	recipe = AddRecipe(36389, 375, 30034, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(37, 43)

	-- Red Belt of Battle -- 36390
	recipe = AddRecipe(36390, 375, 30032, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(37, 43)

	-- Boots of the Protector -- 36391
	recipe = AddRecipe(36391, 375, 30033, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(37, 43)

	-- Red Havoc Boots -- 36392
	recipe = AddRecipe(36392, 375, 30031, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.TANK, F.PLATE)
	recipe:AddCustom(37, 43)

	-- Wildguard Breastplate -- 38473
	recipe = AddRecipe(38473, 375, 31364, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Wildguard Leggings -- 38475
	recipe = AddRecipe(38475, 375, 31367, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Wildguard Helm -- 38476
	recipe = AddRecipe(38476, 375, 31368, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.PLATE)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Iceguard Breastplate -- 38477
	recipe = AddRecipe(38477, 375, 31369, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.VIOLETEYE, F.PLATE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 16388)

	-- Iceguard Leggings -- 38478
	recipe = AddRecipe(38478, 375, 31370, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.VIOLETEYE, F.PLATE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.REVERED, 16388)

	-- Iceguard Helm -- 38479
	recipe = AddRecipe(38479, 375, 31371, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.VIOLETEYE, F.PLATE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 16388)

	-- Shadesteel Sabots -- 40033
	recipe = AddRecipe(40033, 375, 32402, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Shadesteel Bracers -- 40034
	recipe = AddRecipe(40034, 375, 32403, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Shadesteel Greaves -- 40035
	recipe = AddRecipe(40035, 375, 32404, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Shadesteel Girdle -- 40036
	recipe = AddRecipe(40036, 375, 32401, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.PLATE)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Swiftsteel Bracers -- 41132
	recipe = AddRecipe(41132, 375, 32568, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(27, 34)

	-- Swiftsteel Shoulders -- 41133
	recipe = AddRecipe(41133, 375, 32570, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(34)

	-- Dawnsteel Bracers -- 41134
	recipe = AddRecipe(41134, 375, 32571, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(34)

	-- Dawnsteel Shoulders -- 41135
	recipe = AddRecipe(41135, 375, 32573, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(27, 34)

	-- Ragesteel Shoulders -- 42662
	recipe = AddRecipe(42662, 365, 33173, Q.RARE, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(21050, 21059, 21060, 21061)

	-- Adamantite Weapon Chain -- 42688
	recipe = AddRecipe(42688, 335, 33185, Q.UNCOMMON, V.TBC, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(24664)

	-- Heavy Copper Longsword -- 43549
	recipe = AddRecipe(43549, 35, 33791, Q.UNCOMMON, V.TBC, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddQuest(1578)

	-- Hammer of Righteous Might -- 43846
	recipe = AddRecipe(43846, 365, 32854, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND, F.MACE)
	recipe:AddWorldDrop("Outland")

	-- Sunblessed Gauntlets -- 46140
	recipe = AddRecipe(46140, 365, 34380, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(24)

	-- Hard Khorium Battlefists -- 46141
	recipe = AddRecipe(46141, 365, 34378, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(24)

	-- Sunblessed Breastplate -- 46142
	recipe = AddRecipe(46142, 365, 34379, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(24)

	-- Hard Khorium Battleplate -- 46144
	recipe = AddRecipe(46144, 365, 34377, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(24)

	-- Cobalt Legplates -- 52567
	recipe = AddRecipe(52567, 370, 39086, Q.COMMON, V.WOTLK, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Belt -- 52568
	recipe = AddRecipe(52568, 350, 39087, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Boots -- 52569
	recipe = AddRecipe(52569, 350, 39088, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Chestpiece -- 52570
	recipe = AddRecipe(52570, 375, 39085, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Helm -- 52571
	recipe = AddRecipe(52571, 370, 39084, Q.COMMON, V.WOTLK, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Shoulders -- 52572
	recipe = AddRecipe(52572, 360, 39083, Q.COMMON, V.WOTLK, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Triangle Shield -- 54550
	recipe = AddRecipe(54550, 360, 40668, Q.COMMON, V.WOTLK, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Belt -- 54551
	recipe = AddRecipe(54551, 395, 40669, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Boots -- 54552
	recipe = AddRecipe(54552, 400, 40671, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Breastplate -- 54553
	recipe = AddRecipe(54553, 400, 40672, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Legplates -- 54554
	recipe = AddRecipe(54554, 395, 40674, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Helm -- 54555
	recipe = AddRecipe(54555, 405, 40673, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Shoulders -- 54556
	recipe = AddRecipe(54556, 405, 40675, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Saronite Defender -- 54557
	recipe = AddRecipe(54557, 390, 40670, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Helm -- 54917
	recipe = AddRecipe(54917, 375, 40942, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Boots -- 54918
	recipe = AddRecipe(54918, 380, 40949, Q.COMMON, V.WOTLK, 380, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Shoulders -- 54941
	recipe = AddRecipe(54941, 385, 40950, Q.COMMON, V.WOTLK, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Chestpiece -- 54944
	recipe = AddRecipe(54944, 385, 40951, Q.COMMON, V.WOTLK, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Gauntlets -- 54945
	recipe = AddRecipe(54945, 390, 40952, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Belt -- 54946
	recipe = AddRecipe(54946, 395, 40953, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Legplates -- 54947
	recipe = AddRecipe(54947, 395, 40943, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Cobalt Bracers -- 54948
	recipe = AddRecipe(54948, 400, 40954, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Horned Cobalt Helm -- 54949
	recipe = AddRecipe(54949, 400, 40955, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Reinforced Cobalt Shoulders -- 54978
	recipe = AddRecipe(54978, 375, 40956, Q.UNCOMMON, V.WOTLK, 375, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(27333)

	-- Reinforced Cobalt Helm -- 54979
	recipe = AddRecipe(54979, 375, 40957, Q.UNCOMMON, V.WOTLK, 375, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(26270)

	-- Reinforced Cobalt Legplates -- 54980
	recipe = AddRecipe(54980, 375, 40958, Q.UNCOMMON, V.WOTLK, 375, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(29235)

	-- Reinforced Cobalt Chestpiece -- 54981
	recipe = AddRecipe(54981, 375, 40959, Q.UNCOMMON, V.WOTLK, 375, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddMobDrop(28123)

	-- Saronite Protector -- 55013
	recipe = AddRecipe(55013, 390, 41117, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Saronite Bulwark -- 55014
	recipe = AddRecipe(55014, 410, 41113, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Gauntlets -- 55015
	recipe = AddRecipe(55015, 415, 41114, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Saronite Bracers -- 55017
	recipe = AddRecipe(55017, 410, 41116, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Legplates -- 55055
	recipe = AddRecipe(55055, 395, 41126, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Gauntlets -- 55056
	recipe = AddRecipe(55056, 400, 41127, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Boots -- 55057
	recipe = AddRecipe(55057, 405, 41128, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Breastplate -- 55058
	recipe = AddRecipe(55058, 415, 41129, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Honed Cobalt Cleaver -- 55174
	recipe = AddRecipe(55174, 390, 41181, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.AXE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Cobalt Slicer -- 55177
	recipe = AddRecipe(55177, 395, 41182, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Saronite Ambusher -- 55179
	recipe = AddRecipe(55179, 400, 41183, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Saronite Shiv -- 55181
	recipe = AddRecipe(55181, 405, 41184, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Furious Saronite Beatstick -- 55182
	recipe = AddRecipe(55182, 410, 41185, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Corroded Saronite Edge -- 55183
	recipe = AddRecipe(55183, 415, 41186, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Corroded Saronite Woundbringer -- 55184
	recipe = AddRecipe(55184, 415, 41187, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddCustom(48)

	-- Saronite Mindcrusher -- 55185
	recipe = AddRecipe(55185, 415, 41188, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddCustom(48)

	-- Chestplate of Conquest -- 55186
	recipe = AddRecipe(55186, 415, 41189, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Legplates of Conquest -- 55187
	recipe = AddRecipe(55187, 415, 41190, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.PLATE)
	recipe:AddCustom(48)

	-- Sturdy Cobalt Quickblade -- 55200
	recipe = AddRecipe(55200, 380, 41239, Q.COMMON, V.WOTLK, 380, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Tenderizer -- 55201
	recipe = AddRecipe(55201, 380, 41240, Q.COMMON, V.WOTLK, 380, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Sure-fire Shuriken -- 55202
	recipe = AddRecipe(55202, 385, 41241, Q.COMMON, V.WOTLK, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.THROWN)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Forged Cobalt Claymore -- 55203
	recipe = AddRecipe(55203, 385, 41242, Q.COMMON, V.WOTLK, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.SWORD)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Notched Cobalt War Axe -- 55204
	recipe = AddRecipe(55204, 390, 41243, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.AXE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Deadly Saronite Dirk -- 55206
	recipe = AddRecipe(55206, 405, 41245, Q.COMMON, V.WOTLK, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.THROWN)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Vengeance Bindings -- 55298
	recipe = AddRecipe(55298, 420, 41355, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Righteous Gauntlets -- 55300
	recipe = AddRecipe(55300, 420, 41356, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Daunting Handguards -- 55301
	recipe = AddRecipe(55301, 420, 41357, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Helm of Command -- 55302
	recipe = AddRecipe(55302, 425, 41344, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Daunting Legplates -- 55303
	recipe = AddRecipe(55303, 425, 41345, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Righteous Greaves -- 55304
	recipe = AddRecipe(55304, 425, 41346, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Bracers -- 55305
	recipe = AddRecipe(55305, 420, 41354, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Pauldrons -- 55306
	recipe = AddRecipe(55306, 420, 41351, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Waistguard -- 55307
	recipe = AddRecipe(55307, 420, 41352, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Walkers -- 55308
	recipe = AddRecipe(55308, 420, 41348, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Gauntlets -- 55309
	recipe = AddRecipe(55309, 420, 41349, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Legplates -- 55310
	recipe = AddRecipe(55310, 425, 41347, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Hauberk -- 55311
	recipe = AddRecipe(55311, 425, 41353, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Savage Saronite Skullshield -- 55312
	recipe = AddRecipe(55312, 425, 41350, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titansteel Destroyer -- 55369
	recipe = AddRecipe(55369, 440, 41257, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND, F.MACE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titansteel Bonecrusher -- 55370
	recipe = AddRecipe(55370, 440, 41383, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titansteel Guardian -- 55371
	recipe = AddRecipe(55371, 440, 41384, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Titansteel Helm -- 55372
	recipe = AddRecipe(55372, 440, 41386, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Titansteel Helm -- 55373
	recipe = AddRecipe(55373, 440, 41387, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Titansteel Helm -- 55374
	recipe = AddRecipe(55374, 440, 41388, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Spiked Titansteel Treads -- 55375
	recipe = AddRecipe(55375, 440, 41391, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Tempered Titansteel Treads -- 55376
	recipe = AddRecipe(55376, 440, 41392, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Titansteel Treads -- 55377
	recipe = AddRecipe(55377, 440, 41394, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Socket Bracer -- 55628
	recipe = AddRecipe(55628, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Socket Gloves -- 55641
	recipe = AddRecipe(55641, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Eternal Belt Buckle -- 55656
	recipe = AddRecipe(55656, 415, 41611, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titanium Rod -- 55732
	recipe = AddRecipe(55732, 420, 41745, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Bracers -- 55834
	recipe = AddRecipe(55834, 360, 41974, Q.COMMON, V.WOTLK, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Gauntlets -- 55835
	recipe = AddRecipe(55835, 370, 41975, Q.COMMON, V.WOTLK, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titanium Weapon Chain -- 55839
	recipe = AddRecipe(55839, 420, 41976, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titansteel Shanker -- 56234
	recipe = AddRecipe(56234, 440, 42435, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cudgel of Saronite Justice -- 56280
	recipe = AddRecipe(56280, 410, 42443, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.MACE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titanium Shield Spike -- 56357
	recipe = AddRecipe(56357, 420, 42500, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titansteel Shield Wall -- 56400
	recipe = AddRecipe(56400, 440, 42508, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Bracers -- 56549
	recipe = AddRecipe(56549, 420, 42723, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Pauldrons -- 56550
	recipe = AddRecipe(56550, 420, 42727, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Waistguard -- 56551
	recipe = AddRecipe(56551, 420, 42729, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Walkers -- 56552
	recipe = AddRecipe(56552, 420, 42730, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Gauntlets -- 56553
	recipe = AddRecipe(56553, 420, 42724, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Legplates -- 56554
	recipe = AddRecipe(56554, 425, 42726, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Hauberk -- 56555
	recipe = AddRecipe(56555, 425, 42725, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Ornate Saronite Skullshield -- 56556
	recipe = AddRecipe(56556, 425, 42728, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Cobalt Skeleton Key -- 59405
	recipe = AddRecipe(59405, 350, 43854, Q.COMMON, V.WOTLK, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titanium Skeleton Key -- 59406
	recipe = AddRecipe(59406, 430, 43853, Q.COMMON, V.WOTLK, 430, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Belt -- 59436
	recipe = AddRecipe(59436, 395, 43860, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Bracers -- 59438
	recipe = AddRecipe(59438, 400, 43864, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Pauldrons -- 59440
	recipe = AddRecipe(59440, 405, 43865, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Brilliant Saronite Helm -- 59441
	recipe = AddRecipe(59441, 415, 43870, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Saronite Spellblade -- 59442
	recipe = AddRecipe(59442, 410, 43871, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.SWORD)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Icebane Chestguard -- 61008
	recipe = AddRecipe(61008, 425, 43586, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Icebane Girdle -- 61009
	recipe = AddRecipe(61009, 420, 43587, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Icebane Treads -- 61010
	recipe = AddRecipe(61010, 420, 43588, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PLATE)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Titanium Plating -- 62202
	recipe = AddRecipe(62202, 450, 44936, Q.RARE, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.WRATHCOMMON1, F.SHIELD)
	recipe:AddRepVendor(FAC.HORDE_EXPEDITION, REP.EXALTED, 32565, 32774)
	recipe:AddRepVendor(FAC.ALLIANCE_VANGUARD, REP.EXALTED, 32564, 32773)

	-- Titansteel Spellblade -- 63182
	recipe = AddRecipe(63182, 440, 45085, Q.COMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.DAGGER)
	recipe:AddTrainer(3355, 26564, 26904, 26952, 26981, 26988, 27034, 28694, 29924, 33591)

	-- Belt of the Titans -- 63187
	recipe = AddRecipe(63187, 450, 45088, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(39)

	-- Battlelord's Plate Boots -- 63188
	recipe = AddRecipe(63188, 450, 45089, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(39)

	-- Plate Girdle of Righteousness -- 63189
	recipe = AddRecipe(63189, 450, 45090, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(39)

	-- Treads of Destiny -- 63190
	recipe = AddRecipe(63190, 450, 45091, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(39)

	-- Indestructible Plate Girdle -- 63191
	recipe = AddRecipe(63191, 450, 45092, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(39)

	-- Spiked Deathdealers -- 63192
	recipe = AddRecipe(63192, 450, 45093, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(39)
	
	-- Breastplate of the White Knight -- 67091 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67091, 450, 47591, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(42)

	-- Saronite Swordbreakers -- 67092 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67092, 450, 47570, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(42)

	-- Titanium Razorplate -- 67093 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67093, 450, 47589, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(42)

	-- Titanium Spikeguards -- 67094 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67094, 450, 47572, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(42)

	-- Sunforged Breastplate -- 67095 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67095, 450, 47593, Q.EPIC, V.WOTLK, 450, 460, 467, 475)
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.PLATE)
	recipe:AddCustom(42)

	-- Sunforged Bracers -- 67096 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67096, 450, 47574, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.PLATE)
	recipe:AddCustom(42)

	-- Breastplate of the White Knight -- 67130 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67130, 450, 47592, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(42)

	-- Saronite Swordbreakers -- 67131 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67131, 450, 47571, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.TANK, F.PLATE)
	recipe:AddCustom(42)

	-- Titanium Razorplate -- 67132 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67132, 450, 47590, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(42)

	-- Titanium Spikeguards -- 67133 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67133, 450, 47573, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.PLATE)
	recipe:AddCustom(42)

	-- Sunforged Breastplate -- 67134 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67134, 450, 47594, Q.EPIC, V.WOTLK, 450, 460, 467, 475)
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(42)

	-- Sunforged Bracers -- 67135 -- TORHAL: Add the strict faction flag thing to this recipe.
	recipe = AddRecipe(67135, 450, 47575, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.PLATE)
	recipe:AddCustom(42)

	-- Puresteel Legplates -- 70562
	recipe = AddRecipe(70562, 450, 49902, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Protectors of Life -- 70563
	recipe = AddRecipe(70563, 450, 49905, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Legplates of Painful Death -- 70565
	recipe = AddRecipe(70565, 450, 49903, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Hellfrozen Bonegrinders -- 70566
	recipe = AddRecipe(70566, 450, 49906, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Pillars of Might -- 70567
	recipe = AddRecipe(70567, 450, 49904, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Boots of Kingly Upheaval -- 70568
	recipe = AddRecipe(70568, 450, 49907, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ASHEN_VERDICT, F.PLATE)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Folded Obsidium -- 76178
	recipe = AddRecipe(76178, 425, nil, Q.COMMON, V.CATA, 425, 450, 452, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Bracers -- 76179
	recipe = AddRecipe(76179, 440, nil, Q.COMMON, V.CATA, 440, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Gauntlets -- 76180
	recipe = AddRecipe(76180, 425, nil, Q.COMMON, V.CATA, 425, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Belt -- 76181
	recipe = AddRecipe(76181, 425, nil, Q.COMMON, V.CATA, 425, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Boots -- 76182
	recipe = AddRecipe(76182, 425, nil, Q.COMMON, V.CATA, 425, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Shoulders -- 76258
	recipe = AddRecipe(76258, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Legguards -- 76259
	recipe = AddRecipe(76259, 425, nil, Q.COMMON, V.CATA, 425, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Helm -- 76260
	recipe = AddRecipe(76260, 425, nil, Q.COMMON, V.CATA, 425, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Breastplate -- 76261
	recipe = AddRecipe(76261, 425, nil, Q.COMMON, V.CATA, 425, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Bracers -- 76262
	recipe = AddRecipe(76262, 425, nil, Q.COMMON, V.CATA, 425, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Gauntlets -- 76263
	recipe = AddRecipe(76263, 425, nil, Q.COMMON, V.CATA, 425, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Belt -- 76264
	recipe = AddRecipe(76264, 425, nil, Q.COMMON, V.CATA, 425, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Boots -- 76265
	recipe = AddRecipe(76265, 425, nil, Q.COMMON, V.CATA, 425, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Shoulders -- 76266
	recipe = AddRecipe(76266, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Legguards -- 76267
	recipe = AddRecipe(76267, 425, nil, Q.COMMON, V.CATA, 425, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Helm -- 76269
	recipe = AddRecipe(76269, 425, nil, Q.COMMON, V.CATA, 425, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Redsteel Breastplate -- 76270
	recipe = AddRecipe(76270, 425, nil, Q.COMMON, V.CATA, 425, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Bracers -- 76280
	recipe = AddRecipe(76280, 425, nil, Q.COMMON, V.CATA, 425, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Gauntlets -- 76281
	recipe = AddRecipe(76281, 425, nil, Q.COMMON, V.CATA, 425, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Belt -- 76283
	recipe = AddRecipe(76283, 425, nil, Q.COMMON, V.CATA, 425, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Boots -- 76285
	recipe = AddRecipe(76285, 425, nil, Q.COMMON, V.CATA, 425, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Shoulders -- 76286
	recipe = AddRecipe(76286, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Legguards -- 76287
	recipe = AddRecipe(76287, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Helm -- 76288
	recipe = AddRecipe(76288, 425, nil, Q.COMMON, V.CATA, 425, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Breastplate -- 76289
	recipe = AddRecipe(76289, 425, nil, Q.COMMON, V.CATA, 425, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Hardened Obsidium Shield -- 76291
	recipe = AddRecipe(76291, 425, nil, Q.COMMON, V.CATA, 425, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Stormforged Shield -- 76293
	recipe = AddRecipe(76293, 425, nil, Q.COMMON, V.CATA, 425, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Decapitator's Razor -- 76433
	recipe = AddRecipe(76433, 425, nil, Q.COMMON, V.CATA, 425, 475, 477, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Cold-Forged Shank -- 76434
	recipe = AddRecipe(76434, 425, nil, Q.COMMON, V.CATA, 425, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Fire-Etched Dagger -- 76435
	recipe = AddRecipe(76435, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Lifeforce Hammer -- 76436
	recipe = AddRecipe(76436, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Obsidium Executioner -- 76437
	recipe = AddRecipe(76437, 425, nil, Q.COMMON, V.CATA, 425, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Obsidium Skeleton Key -- 76438
	recipe = AddRecipe(76438, 425, nil, Q.COMMON, V.CATA, 425, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Ebonsteel Belt Buckle -- 76439
	recipe = AddRecipe(76439, 525, nil, Q.COMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Pyrium Shield Spike -- 76440
	recipe = AddRecipe(76440, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Shield Spike -- 76441
	recipe = AddRecipe(76441, 425, nil, Q.COMMON, V.CATA, 425, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Pyrium Weapon Chain -- 76442
	recipe = AddRecipe(76442, 500, nil, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Hardened Elementium Hauberk -- 76443
	recipe = AddRecipe(76443, 515, nil, Q.COMMON, V.CATA, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Hardened Elementium Girdle -- 76444
	recipe = AddRecipe(76444, 510, nil, Q.COMMON, V.CATA, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Deathplate -- 76445
	recipe = AddRecipe(76445, 515, nil, Q.COMMON, V.CATA, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Girdle of Pain -- 76446
	recipe = AddRecipe(76446, 510, nil, Q.COMMON, V.CATA, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Light Elementium Chestguard -- 76447
	recipe = AddRecipe(76447, 515, nil, Q.COMMON, V.CATA, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Light Elementium Belt -- 76448
	recipe = AddRecipe(76448, 510, nil, Q.COMMON, V.CATA, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Spellblade -- 76449
	recipe = AddRecipe(76449, 520, nil, Q.COMMON, V.CATA, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Hammer -- 76450
	recipe = AddRecipe(76450, 515, nil, Q.COMMON, V.CATA, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Poleaxe -- 76451
	recipe = AddRecipe(76451, 520, nil, Q.COMMON, V.CATA, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Bonesplitter -- 76452
	recipe = AddRecipe(76452, 515, nil, Q.COMMON, V.CATA, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Shank -- 76453
	recipe = AddRecipe(76453, 520, nil, Q.COMMON, V.CATA, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Earthguard -- 76454
	recipe = AddRecipe(76454, 520, nil, Q.COMMON, V.CATA, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Elementium Stormshield -- 76455
	recipe = AddRecipe(76455, 520, nil, Q.COMMON, V.CATA, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Bracers -- 76456
	recipe = AddRecipe(76456, 500, nil, Q.COMMON, V.CATA, 500, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Gauntlets -- 76457
	recipe = AddRecipe(76457, 505, nil, Q.COMMON, V.CATA, 505, 515, 517, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Belt -- 76458
	recipe = AddRecipe(76458, 510, nil, Q.COMMON, V.CATA, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Boots -- 76459
	recipe = AddRecipe(76459, 515, nil, Q.COMMON, V.CATA, 515, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Shoulders -- 76461
	recipe = AddRecipe(76461, 520, nil, Q.COMMON, V.CATA, 520, 530, 532, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Legguards -- 76462
	recipe = AddRecipe(76462, 525, nil, Q.COMMON, V.CATA, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Helm -- 76463
	recipe = AddRecipe(76463, 525, nil, Q.COMMON, V.CATA, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Bloodied Pyrium Breastplate -- 76464
	recipe = AddRecipe(76464, 525, nil, Q.COMMON, V.CATA, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Bracers -- 76465
	recipe = AddRecipe(76465, 500, nil, Q.COMMON, V.CATA, 500, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Gauntlets -- 76466
	recipe = AddRecipe(76466, 505, nil, Q.COMMON, V.CATA, 505, 515, 517, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Belt -- 76467
	recipe = AddRecipe(76467, 510, nil, Q.COMMON, V.CATA, 510, 520, 522, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Boots -- 76468
	recipe = AddRecipe(76468, 515, nil, Q.COMMON, V.CATA, 515, 525, 527, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Shoulders -- 76469
	recipe = AddRecipe(76469, 520, nil, Q.COMMON, V.CATA, 520, 530, 532, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Legguards -- 76470
	recipe = AddRecipe(76470, 525, nil, Q.COMMON, V.CATA, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Helm -- 76471
	recipe = AddRecipe(76471, 525, nil, Q.COMMON, V.CATA, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Ornate Pyrium Breastplate -- 76472
	recipe = AddRecipe(76472, 525, nil, Q.COMMON, V.CATA, 525, 535, 537, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Obsidium Bladespear -- 76474
	recipe = AddRecipe(76474, 425, nil, Q.COMMON, V.CATA, 425, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Elementium Rod -- 92375
	recipe = AddRecipe(92375, 475, nil, Q.COMMON, V.CATA, 475, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3136, 4258, 5164, 11146, 11178, 16669, 16823, 26564, 26981, 26988, 28694, 29505)

	-- Elementium Gutslicer -- 94718
	recipe = AddRecipe(94718, 515, nil, Q.COMMON, V.CATA, 515, 515, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	-- Forged Elementium Mindcrusher -- 94732
	recipe = AddRecipe(94732, 520, nil, Q.COMMON, V.CATA, 520, 520, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50375, 50382)

	self.InitBlacksmithing = nil
end
