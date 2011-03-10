--[[
************************************************************************
Tailoring.lua
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
local REP = private.rep_levels
local FAC = private.faction_ids
local V = private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, specialty, required_faction)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 3908, specialty, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
end

function addon:InitTailoring()
	local recipe

	-- Brown Linen Vest -- 2385
	recipe = AddRecipe(2385, 10, 2568, Q.COMMON, V.ORIG, 10, 45, 57, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Boots -- 2386
	recipe = AddRecipe(2386, 65, 2569, Q.COMMON, V.ORIG, 65, 90, 107, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Cloak -- 2387
	recipe = AddRecipe(2387, 1, 2570, Q.COMMON, V.ORIG, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom(8)

	-- Red Linen Robe -- 2389
	recipe = AddRecipe(2389, 40, 2572, Q.UNCOMMON, V.ORIG, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Red Linen Shirt -- 2392
	recipe = AddRecipe(2392, 40, 2575, Q.COMMON, V.ORIG, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Linen Shirt -- 2393
	recipe = AddRecipe(2393, 1, 2576, Q.COMMON, V.ORIG, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Blue Linen Shirt -- 2394
	recipe = AddRecipe(2394, 40, 2577, Q.COMMON, V.ORIG, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Barbaric Linen Vest -- 2395
	recipe = AddRecipe(2395, 70, 2578, Q.COMMON, V.ORIG, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Linen Shirt -- 2396
	recipe = AddRecipe(2396, 70, 2579, Q.COMMON, V.ORIG, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Reinforced Linen Cape -- 2397
	recipe = AddRecipe(2397, 60, 2580, Q.COMMON, V.ORIG, 60, 85, 102, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Woolen Vest -- 2399
	recipe = AddRecipe(2399, 85, 2582, Q.COMMON, V.ORIG, 85, 110, 127, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Woolen Boots -- 2401
	recipe = AddRecipe(2401, 95, 2583, Q.COMMON, V.ORIG, 95, 120, 137, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Woolen Cape -- 2402
	recipe = AddRecipe(2402, 75, 2584, Q.COMMON, V.ORIG, 75, 100, 117, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Gray Woolen Robe -- 2403
	recipe = AddRecipe(2403, 105, 2585, Q.UNCOMMON, V.ORIG, 105, 130, 147, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gray Woolen Shirt -- 2406
	recipe = AddRecipe(2406, 100, 2587, Q.COMMON, V.ORIG, 100, 110, 120, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Bolt of Linen Cloth -- 2963
	recipe = AddRecipe(2963, 1, 2996, Q.COMMON, V.ORIG, 1, 25, 37, 50)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddCustom(8)

	-- Bolt of Woolen Cloth -- 2964
	recipe = AddRecipe(2964, 75, 2997, Q.COMMON, V.ORIG, 75, 90, 97, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Bag -- 3755
	recipe = AddRecipe(3755, 45, 4238, Q.COMMON, V.ORIG, 45, 70, 87, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Woolen Bag -- 3757
	recipe = AddRecipe(3757, 80, 4240, Q.COMMON, V.ORIG, 80, 105, 122, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Woolen Bag -- 3758
	recipe = AddRecipe(3758, 95, 4241, Q.UNCOMMON, V.ORIG, 95, 120, 137, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Small Silk Pack -- 3813
	recipe = AddRecipe(3813, 150, 4245, Q.COMMON, V.ORIG, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Bolt of Silk Cloth -- 3839
	recipe = AddRecipe(3839, 125, 4305, Q.COMMON, V.ORIG, 125, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Heavy Linen Gloves -- 3840
	recipe = AddRecipe(3840, 35, 4307, Q.COMMON, V.ORIG, 35, 60, 77, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Linen Bracers -- 3841
	recipe = AddRecipe(3841, 60, 4308, Q.COMMON, V.ORIG, 60, 85, 102, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Handstitched Linen Britches -- 3842
	recipe = AddRecipe(3842, 70, 4309, Q.COMMON, V.ORIG, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Heavy Woolen Gloves -- 3843
	recipe = AddRecipe(3843, 85, 4310, Q.COMMON, V.ORIG, 85, 110, 127, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Heavy Woolen Cloak -- 3844
	recipe = AddRecipe(3844, 100, 4311, Q.UNCOMMON, V.ORIG, 100, 125, 142, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Soft-soled Linen Boots -- 3845
	recipe = AddRecipe(3845, 80, 4312, Q.COMMON, V.ORIG, 80, 105, 122, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Woolen Boots -- 3847
	recipe = AddRecipe(3847, 95, 4313, Q.UNCOMMON, V.ORIG, 95, 120, 137, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Double-stitched Woolen Shoulders -- 3848
	recipe = AddRecipe(3848, 110, 4314, Q.COMMON, V.ORIG, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Reinforced Woolen Shoulders -- 3849
	recipe = AddRecipe(3849, 120, 4315, Q.UNCOMMON, V.ORIG, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Woolen Pants -- 3850
	recipe = AddRecipe(3850, 110, 4316, Q.COMMON, V.ORIG, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Phoenix Pants -- 3851
	recipe = AddRecipe(3851, 125, 4317, Q.UNCOMMON, V.ORIG, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gloves of Meditation -- 3852
	recipe = AddRecipe(3852, 130, 4318, Q.COMMON, V.ORIG, 130, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Gloves -- 3854
	recipe = AddRecipe(3854, 145, 4319, Q.COMMON, V.ORIG, 145, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(2679, 1, 9636, 1)

	-- Spidersilk Boots -- 3855
	recipe = AddRecipe(3855, 125, 4320, Q.COMMON, V.ORIG, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Spider Silk Slippers -- 3856
	recipe = AddRecipe(3856, 140, 4321, Q.UNCOMMON, V.ORIG, 140, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchanter's Cowl -- 3857
	recipe = AddRecipe(3857, 165, 4322, Q.COMMON, V.ORIG, 165, 185, 200, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(2670, 1)

	-- Shadow Hood -- 3858
	recipe = AddRecipe(3858, 170, 4323, Q.UNCOMMON, V.ORIG, 170, 190, 205, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Azure Silk Vest -- 3859
	recipe = AddRecipe(3859, 150, 4324, Q.COMMON, V.ORIG, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Boots of the Enchanter -- 3860
	recipe = AddRecipe(3860, 175, 4325, Q.UNCOMMON, V.ORIG, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Long Silken Cloak -- 3861
	recipe = AddRecipe(3861, 185, 4326, Q.COMMON, V.ORIG, 185, 205, 220, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Icy Cloak -- 3862
	recipe = AddRecipe(3862, 200, 4327, Q.COMMON, V.ORIG, 200, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddLimitedVendor(6567, 1)

	-- Spider Belt -- 3863
	recipe = AddRecipe(3863, 180, 4328, Q.UNCOMMON, V.ORIG, 180, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Star Belt -- 3864
	recipe = AddRecipe(3864, 200, 4329, Q.UNCOMMON, V.ORIG, 200, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Bolt of Mageweave -- 3865
	recipe = AddRecipe(3865, 175, 4339, Q.COMMON, V.ORIG, 175, 180, 182, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Stylish Red Shirt -- 3866
	recipe = AddRecipe(3866, 110, 4330, Q.COMMON, V.ORIG, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Phoenix Gloves -- 3868
	recipe = AddRecipe(3868, 125, 4331, Q.UNCOMMON, V.ORIG, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Bright Yellow Shirt -- 3869
	recipe = AddRecipe(3869, 135, 4332, Q.COMMON, V.ORIG, 135, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2668, 1)

	-- Dark Silk Shirt -- 3870
	recipe = AddRecipe(3870, 155, 4333, Q.COMMON, V.ORIG, 155, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2394, 1, 2669, 1)

	-- Formal White Shirt -- 3871
	recipe = AddRecipe(3871, 170, 4334, Q.COMMON, V.ORIG, 170, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Rich Purple Silk Shirt -- 3872
	recipe = AddRecipe(3872, 185, 4335, Q.RARE, V.ORIG, 185, 195, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Black Swashbuckler's Shirt -- 3873
	recipe = AddRecipe(3873, 200, 4336, Q.COMMON, V.ORIG, 200, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2663)

	-- Brown Linen Pants -- 3914
	recipe = AddRecipe(3914, 30, 4343, Q.COMMON, V.ORIG, 30, 55, 72, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Brown Linen Shirt -- 3915
	recipe = AddRecipe(3915, 1, 4344, Q.COMMON, V.ORIG, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Pearl-clasped Cloak -- 6521
	recipe = AddRecipe(6521, 90, 5542, Q.COMMON, V.ORIG, 90, 115, 132, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Linen Bag -- 6686
	recipe = AddRecipe(6686, 70, 5762, Q.COMMON, V.ORIG, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(590, 3530, 3531)
	recipe:AddLimitedVendor(843, 1, 3005, 1, 3556, 1, 4189, 1, 16224, 1)

	-- Red Woolen Bag -- 6688
	recipe = AddRecipe(6688, 115, 5763, Q.COMMON, V.ORIG, 115, 140, 157, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(777, 1, 1454, 1, 1474, 1, 3005, 1, 3364, 1, 3485, 1, 3537, 1, 4189, 2, 4577, 1)

	-- Lesser Wizard's Robe -- 6690
	recipe = AddRecipe(6690, 135, 5766, Q.COMMON, V.ORIG, 135, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Robes of Arcana -- 6692
	recipe = AddRecipe(6692, 150, 5770, Q.UNCOMMON, V.ORIG, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(10760)

	-- Green Silk Pack -- 6693
	recipe = AddRecipe(6693, 175, 5764, Q.UNCOMMON, V.ORIG, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Black Silk Pack -- 6695
	recipe = AddRecipe(6695, 185, 5765, Q.UNCOMMON, V.ORIG, 185, 205, 220, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(2242, 4834)

	-- Brown Linen Robe -- 7623
	recipe = AddRecipe(7623, 30, 6238, Q.COMMON, V.ORIG, 30, 55, 72, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Linen Robe -- 7624
	recipe = AddRecipe(7624, 30, 6241, Q.COMMON, V.ORIG, 30, 55, 72, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Linen Vest -- 7629
	recipe = AddRecipe(7629, 55, 6239, Q.UNCOMMON, V.ORIG, 55, 80, 97, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Blue Linen Vest -- 7630
	recipe = AddRecipe(7630, 55, 6240, Q.COMMON, V.ORIG, 55, 80, 97, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(66)
	recipe:AddLimitedVendor(3364, 1, 3485, 1, 3522, 1, 4189, 1)

	-- Blue Linen Robe -- 7633
	recipe = AddRecipe(7633, 70, 6242, Q.COMMON, V.ORIG, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(1250, 1, 3485, 1, 3499, 1, 3556, 1, 4168, 1)

	-- Blue Overalls -- 7639
	recipe = AddRecipe(7639, 100, 6263, Q.COMMON, V.ORIG, 100, 125, 142, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(843, 1, 1347, 1, 2394, 1, 3364, 1)

	-- Greater Adept's Robe -- 7643
	recipe = AddRecipe(7643, 115, 6264, Q.COMMON, V.ORIG, 115, 140, 157, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(1454, 1, 1474, 1, 2669, 1, 3499, 1, 4168, 1, 4577, 1)

	-- Stylish Blue Shirt -- 7892
	recipe = AddRecipe(7892, 120, 6384, Q.UNCOMMON, V.ORIG, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Stylish Green Shirt -- 7893
	recipe = AddRecipe(7893, 120, 6385, Q.UNCOMMON, V.ORIG, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Simple Dress -- 8465
	recipe = AddRecipe(8465, 40, 6786, Q.COMMON, V.ORIG, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Woolen Dress -- 8467
	recipe = AddRecipe(8467, 110, 6787, Q.COMMON, V.ORIG, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Swashbuckler's Shirt -- 8483
	recipe = AddRecipe(8483, 160, 6795, Q.COMMON, V.ORIG, 160, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Swashbuckler's Shirt -- 8489
	recipe = AddRecipe(8489, 175, 6796, Q.COMMON, V.ORIG, 175, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Pants -- 8758
	recipe = AddRecipe(8758, 140, 7046, Q.COMMON, V.ORIG, 140, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Hood -- 8760
	recipe = AddRecipe(8760, 145, 7048, Q.COMMON, V.ORIG, 145, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Silk Headband -- 8762
	recipe = AddRecipe(8762, 160, 7050, Q.COMMON, V.ORIG, 160, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Earthen Vest -- 8764
	recipe = AddRecipe(8764, 170, 7051, Q.COMMON, V.ORIG, 170, 190, 205, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Belt -- 8766
	recipe = AddRecipe(8766, 175, 7052, Q.COMMON, V.ORIG, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Robe of Power -- 8770
	recipe = AddRecipe(8770, 190, 7054, Q.COMMON, V.ORIG, 190, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Crimson Silk Belt -- 8772
	recipe = AddRecipe(8772, 175, 7055, Q.COMMON, V.ORIG, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Silken Shoulders -- 8774
	recipe = AddRecipe(8774, 180, 7057, Q.COMMON, V.ORIG, 180, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Belt -- 8776
	recipe = AddRecipe(8776, 15, 7026, Q.COMMON, V.ORIG, 15, 50, 67, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Hands of Darkness -- 8780
	recipe = AddRecipe(8780, 145, 7047, Q.UNCOMMON, V.ORIG, 145, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Truefaith Gloves -- 8782
	recipe = AddRecipe(8782, 150, 7049, Q.UNCOMMON, V.ORIG, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Silk Armor -- 8784
	recipe = AddRecipe(8784, 165, 7065, Q.UNCOMMON, V.ORIG, 165, 185, 200, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Azure Silk Cloak -- 8786
	recipe = AddRecipe(8786, 175, 7053, Q.COMMON, V.ORIG, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddLimitedVendor(6574, 1, 6576, 1)

	-- Crimson Silk Cloak -- 8789
	recipe = AddRecipe(8789, 180, 7056, Q.COMMON, V.ORIG, 180, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddLimitedVendor(2670, 1)

	-- Crimson Silk Vest -- 8791
	recipe = AddRecipe(8791, 185, 7058, Q.COMMON, V.ORIG, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Crimson Silk Shoulders -- 8793
	recipe = AddRecipe(8793, 190, 7059, Q.UNCOMMON, V.ORIG, 190, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Azure Shoulders -- 8795
	recipe = AddRecipe(8795, 190, 7060, Q.UNCOMMON, V.ORIG, 190, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Earthen Silk Belt -- 8797
	recipe = AddRecipe(8797, 195, 7061, Q.UNCOMMON, V.ORIG, 195, 215, 230, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Crimson Silk Pantaloons -- 8799
	recipe = AddRecipe(8799, 195, 7062, Q.COMMON, V.ORIG, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Crimson Silk Robe -- 8802
	recipe = AddRecipe(8802, 205, 7063, Q.COMMON, V.ORIG, 205, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(6568, 1)

	-- Crimson Silk Gloves -- 8804
	recipe = AddRecipe(8804, 210, 7064, Q.COMMON, V.ORIG, 210, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Simple Linen Pants -- 12044
	recipe = AddRecipe(12044, 1, 10045, Q.COMMON, V.ORIG, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddCustom(8)

	-- Simple Linen Boots -- 12045
	recipe = AddRecipe(12045, 20, 10046, Q.COMMON, V.ORIG, 20, 50, 67, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Simple Kilt -- 12046
	recipe = AddRecipe(12046, 75, 10047, Q.COMMON, V.ORIG, 75, 100, 117, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Colorful Kilt -- 12047
	recipe = AddRecipe(12047, 120, 10048, Q.UNCOMMON, V.ORIG, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Black Mageweave Vest -- 12048
	recipe = AddRecipe(12048, 205, 9998, Q.COMMON, V.ORIG, 205, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Leggings -- 12049
	recipe = AddRecipe(12049, 205, 9999, Q.COMMON, V.ORIG, 205, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Robe -- 12050
	recipe = AddRecipe(12050, 210, 10001, Q.COMMON, V.ORIG, 210, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Shadoweave Pants -- 12052
	recipe = AddRecipe(12052, 210, 10002, Q.COMMON, V.ORIG, 210, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 44783, 45559)

	-- Black Mageweave Gloves -- 12053
	recipe = AddRecipe(12053, 215, 10003, Q.COMMON, V.ORIG, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Shadoweave Robe -- 12055
	recipe = AddRecipe(12055, 215, 10004, Q.COMMON, V.ORIG, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 44783, 45559)

	-- Red Mageweave Vest -- 12056
	recipe = AddRecipe(12056, 215, 10007, Q.UNCOMMON, V.ORIG, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- White Bandit Mask -- 12059
	recipe = AddRecipe(12059, 215, 10008, Q.UNCOMMON, V.ORIG, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Red Mageweave Pants -- 12060
	recipe = AddRecipe(12060, 215, 10009, Q.UNCOMMON, V.ORIG, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Orange Mageweave Shirt -- 12061
	recipe = AddRecipe(12061, 215, 10056, Q.COMMON, V.ORIG, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Orange Martial Shirt -- 12064
	recipe = AddRecipe(12064, 220, 10052, Q.COMMON, V.ORIG, 220, 225, 230, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3005, 1, 4168, 1)

	-- Mageweave Bag -- 12065
	recipe = AddRecipe(12065, 225, 10050, Q.COMMON, V.ORIG, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Mageweave Gloves -- 12066
	recipe = AddRecipe(12066, 225, 10018, Q.UNCOMMON, V.ORIG, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dreamweave Gloves -- 12067
	recipe = AddRecipe(12067, 225, 10019, Q.COMMON, V.ORIG, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Robe -- 12069
	recipe = AddRecipe(12069, 225, 10042, Q.COMMON, V.ORIG, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Dreamweave Vest -- 12070
	recipe = AddRecipe(12070, 225, 10021, Q.COMMON, V.ORIG, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Shadoweave Gloves -- 12071
	recipe = AddRecipe(12071, 225, 10023, Q.COMMON, V.ORIG, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 44783, 45559)

	-- Black Mageweave Headband -- 12072
	recipe = AddRecipe(12072, 230, 10024, Q.COMMON, V.ORIG, 230, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Boots -- 12073
	recipe = AddRecipe(12073, 230, 10026, Q.COMMON, V.ORIG, 230, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Shoulders -- 12074
	recipe = AddRecipe(12074, 230, 10027, Q.COMMON, V.ORIG, 230, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Lavender Mageweave Shirt -- 12075
	recipe = AddRecipe(12075, 230, 10054, Q.COMMON, V.ORIG, 230, 235, 240, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3364, 1, 8681, 1)

	-- Shadoweave Shoulders -- 12076
	recipe = AddRecipe(12076, 235, 10028, Q.COMMON, V.ORIG, 235, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 44783, 45559)

	-- Simple Black Dress -- 12077
	recipe = AddRecipe(12077, 235, 10053, Q.COMMON, V.ORIG, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Mageweave Shoulders -- 12078
	recipe = AddRecipe(12078, 235, 10029, Q.UNCOMMON, V.ORIG, 235, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Red Mageweave Bag -- 12079
	recipe = AddRecipe(12079, 235, 10051, Q.COMMON, V.ORIG, 235, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 44783, 45559)

	-- Pink Mageweave Shirt -- 12080
	recipe = AddRecipe(12080, 235, 10055, Q.COMMON, V.ORIG, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3364, 1, 8681, 1)

	-- Admiral's Hat -- 12081
	recipe = AddRecipe(12081, 240, 10030, Q.COMMON, V.ORIG, 240, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddLimitedVendor(2672, 1)

	-- Shadoweave Boots -- 12082
	recipe = AddRecipe(12082, 240, 10031, Q.COMMON, V.ORIG, 240, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 44783, 45559)

	-- Red Mageweave Headband -- 12084
	recipe = AddRecipe(12084, 240, 10033, Q.UNCOMMON, V.ORIG, 240, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tuxedo Shirt -- 12085
	recipe = AddRecipe(12085, 240, 10034, Q.COMMON, V.ORIG, 240, 245, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(4577, 8681)

	-- Shadoweave Mask -- 12086
	recipe = AddRecipe(12086, 245, 10025, Q.UNCOMMON, V.ORIG, 245, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(48)

	-- Cindercloth Boots -- 12088
	recipe = AddRecipe(12088, 245, 10044, Q.COMMON, V.ORIG, 245, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Tuxedo Pants -- 12089
	recipe = AddRecipe(12089, 245, 10035, Q.COMMON, V.ORIG, 245, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(4577, 8681)

	-- White Wedding Dress -- 12091
	recipe = AddRecipe(12091, 250, 10040, Q.COMMON, V.ORIG, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddLimitedVendor(1347, 1, 3005, 1)

	-- Dreamweave Circlet -- 12092
	recipe = AddRecipe(12092, 250, 10041, Q.COMMON, V.ORIG, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Tuxedo Jacket -- 12093
	recipe = AddRecipe(12093, 250, 10036, Q.COMMON, V.ORIG, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(4577, 8681)

	-- Bolt of Runecloth -- 18401
	recipe = AddRecipe(18401, 250, 14048, Q.COMMON, V.ORIG, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Belt -- 18402
	recipe = AddRecipe(18402, 255, 13856, Q.COMMON, V.ORIG, 255, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Tunic -- 18403
	recipe = AddRecipe(18403, 255, 13869, Q.COMMON, V.ORIG, 255, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Robe -- 18404
	recipe = AddRecipe(18404, 255, 13868, Q.UNCOMMON, V.ORIG, 255, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runecloth Bag -- 18405
	recipe = AddRecipe(18405, 260, 14046, Q.COMMON, V.ORIG, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11189)

	-- Runecloth Robe -- 18406
	recipe = AddRecipe(18406, 260, 13858, Q.COMMON, V.ORIG, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddLimitedVendor(7940, 1)

	-- Runecloth Tunic -- 18407
	recipe = AddRecipe(18407, 260, 13857, Q.COMMON, V.ORIG, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Vest -- 18408
	recipe = AddRecipe(18408, 260, 14042, Q.UNCOMMON, V.ORIG, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(5861)

	-- Runecloth Cloak -- 18409
	recipe = AddRecipe(18409, 265, 13860, Q.COMMON, V.ORIG, 265, 280, 295, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddLimitedVendor(7940, 1)

	-- Ghostweave Belt -- 18410
	recipe = AddRecipe(18410, 265, 14143, Q.COMMON, V.ORIG, 265, 280, 295, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Gloves -- 18411
	recipe = AddRecipe(18411, 265, 13870, Q.COMMON, V.ORIG, 265, 280, 295, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Gloves -- 18412
	recipe = AddRecipe(18412, 270, 14043, Q.UNCOMMON, V.ORIG, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(5861)

	-- Ghostweave Gloves -- 18413
	recipe = AddRecipe(18413, 270, 14142, Q.COMMON, V.ORIG, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Brightcloth Robe -- 18414
	recipe = AddRecipe(18414, 270, 14100, Q.COMMON, V.ORIG, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Brightcloth Gloves -- 18415
	recipe = AddRecipe(18415, 270, 14101, Q.COMMON, V.ORIG, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Ghostweave Vest -- 18416
	recipe = AddRecipe(18416, 275, 14141, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Gloves -- 18417
	recipe = AddRecipe(18417, 275, 13863, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Cloak -- 18418
	recipe = AddRecipe(18418, 275, 14044, Q.UNCOMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddMobDrop(7037)

	-- Felcloth Pants -- 18419
	recipe = AddRecipe(18419, 275, 14107, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(12022, 1)

	-- Brightcloth Cloak -- 18420
	recipe = AddRecipe(18420, 275, 14103, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Wizardweave Leggings -- 18421
	recipe = AddRecipe(18421, 275, 14132, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cloak of Fire -- 18422
	recipe = AddRecipe(18422, 275, 14134, Q.RARE, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddMobDrop(9026)

	-- Runecloth Boots -- 18423
	recipe = AddRecipe(18423, 280, 13864, Q.COMMON, V.ORIG, 280, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Pants -- 18424
	recipe = AddRecipe(18424, 280, 13871, Q.COMMON, V.ORIG, 280, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Cindercloth Pants -- 18434
	recipe = AddRecipe(18434, 280, 14045, Q.UNCOMMON, V.ORIG, 280, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(7037)

	-- Robe of Winter Night -- 18436
	recipe = AddRecipe(18436, 285, 14136, Q.RARE, V.ORIG, 285, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(48)

	-- Felcloth Boots -- 18437
	recipe = AddRecipe(18437, 285, 14108, Q.COMMON, V.ORIG, 285, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Pants -- 18438
	recipe = AddRecipe(18438, 285, 13865, Q.COMMON, V.ORIG, 285, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Brightcloth Pants -- 18439
	recipe = AddRecipe(18439, 290, 14104, Q.UNCOMMON, V.ORIG, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mooncloth Leggings -- 18440
	recipe = AddRecipe(18440, 290, 14137, Q.RARE, V.ORIG, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ghostweave Pants -- 18441
	recipe = AddRecipe(18441, 290, 14144, Q.COMMON, V.ORIG, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Felcloth Hood -- 18442
	recipe = AddRecipe(18442, 290, 14111, Q.COMMON, V.ORIG, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Headband -- 18444
	recipe = AddRecipe(18444, 295, 13866, Q.COMMON, V.ORIG, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Mooncloth Bag -- 18445
	recipe = AddRecipe(18445, 300, 14155, Q.UNCOMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wizardweave Robe -- 18446
	recipe = AddRecipe(18446, 300, 14128, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Mooncloth Vest -- 18447
	recipe = AddRecipe(18447, 300, 14138, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mooncloth Shoulders -- 18448
	recipe = AddRecipe(18448, 300, 14139, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runecloth Shoulders -- 18449
	recipe = AddRecipe(18449, 300, 13867, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wizardweave Turban -- 18450
	recipe = AddRecipe(18450, 300, 14130, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Felcloth Robe -- 18451
	recipe = AddRecipe(18451, 300, 14106, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mooncloth Circlet -- 18452
	recipe = AddRecipe(18452, 300, 14140, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Felcloth Shoulders -- 18453
	recipe = AddRecipe(18453, 300, 14112, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gloves of Spell Mastery -- 18454
	recipe = AddRecipe(18454, 300, 14146, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Bottomless Bag -- 18455
	recipe = AddRecipe(18455, 300, 14156, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Truefaith Vestments -- 18456
	recipe = AddRecipe(18456, 300, 14154, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.PRIEST, F.CLOTH)
	recipe:AddMobDrop(10813)

	-- Robe of the Archmage -- 18457
	recipe = AddRecipe(18457, 300, 14152, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(9264)

	-- Robe of the Void -- 18458
	recipe = AddRecipe(18458, 300, 14153, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(1853)

	-- Mooncloth -- 18560
	recipe = AddRecipe(18560, 250, 14342, Q.COMMON, V.ORIG, 250, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(11189)

	-- Mooncloth Boots -- 19435
	recipe = AddRecipe(19435, 290, 15802, Q.COMMON, V.ORIG, 290, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(6032)

	-- Flarecore Mantle -- 20848
	recipe = AddRecipe(20848, 300, 16980, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Flarecore Gloves -- 20849
	recipe = AddRecipe(20849, 300, 16979, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAGE, F.PRIEST, F.WARLOCK, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Green Holiday Shirt -- 21945
	recipe = AddRecipe(21945, 190, 17723, Q.COMMON, V.ORIG, 190, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason(1)

	-- Flarecore Wraps -- 22759
	recipe = AddRecipe(22759, 300, 18263, Q.RARE, V.ORIG, 300, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(26)

	-- Gordok Ogre Suit -- 22813
	recipe = AddRecipe(22813, 275, 18258, Q.COMMON, V.ORIG, 275, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(5518)

	-- Belt of the Archmage -- 22866
	recipe = AddRecipe(22866, 300, 18405, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(23)

	-- Felcloth Gloves -- 22867
	recipe = AddRecipe(22867, 300, 18407, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(23)

	-- Inferno Gloves -- 22868
	recipe = AddRecipe(22868, 300, 18408, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(23)

	-- Mooncloth Gloves -- 22869
	recipe = AddRecipe(22869, 300, 18409, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(23)

	-- Cloak of Warding -- 22870
	recipe = AddRecipe(22870, 300, 18413, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddCustom(23)

	-- Mooncloth Robe -- 22902
	recipe = AddRecipe(22902, 300, 18486, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(14371, 1)

	-- Wisdom of the Timbermaw -- 23662
	recipe = AddRecipe(23662, 290, 19047, Q.COMMON, V.ORIG, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.TIMBERMAW_HOLD, F.CLOTH)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Mantle of the Timbermaw -- 23663
	recipe = AddRecipe(23663, 300, 19050, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.TIMBERMAW_HOLD, F.CLOTH)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.REVERED, 11557)

	-- Argent Boots -- 23664
	recipe = AddRecipe(23664, 290, 19056, Q.COMMON, V.ORIG, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN, F.CLOTH)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Argent Shoulders -- 23665
	recipe = AddRecipe(23665, 300, 19059, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN, F.CLOTH)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Flarecore Robe -- 23666
	recipe = AddRecipe(23666, 300, 19156, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Flarecore Leggings -- 23667
	recipe = AddRecipe(23667, 300, 19165, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Bloodvine Vest -- 24091
	recipe = AddRecipe(24091, 300, 19682, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(48)

	-- Bloodvine Leggings -- 24092
	recipe = AddRecipe(24092, 300, 19683, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(48)

	-- Bloodvine Boots -- 24093
	recipe = AddRecipe(24093, 300, 19684, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(48)

	-- Runed Stygian Leggings -- 24901
	recipe = AddRecipe(24901, 300, 20538, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(8323)

	-- Runed Stygian Belt -- 24902
	recipe = AddRecipe(24902, 300, 20539, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(8323)

	-- Runed Stygian Boots -- 24903
	recipe = AddRecipe(24903, 300, 20537, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(8323)

	-- Soul Pouch -- 26085
	recipe = AddRecipe(26085, 260, 21340, Q.COMMON, V.ORIG, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.WARLOCK)
	recipe:AddVendor(6568)

	-- Felcloth Bag -- 26086
	recipe = AddRecipe(26086, 280, 21341, Q.RARE, V.ORIG, 280, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddMobDrop(10503)
	recipe:AddCustom(30)

	-- Core Felcloth Bag -- 26087
	recipe = AddRecipe(26087, 300, 21342, Q.RARE, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.WARLOCK)
	recipe:AddCustom(26)

	-- Festival Dress -- 26403
	recipe = AddRecipe(26403, 250, 21154, Q.UNCOMMON, V.ORIG, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Festival Suit -- 26407
	recipe = AddRecipe(26407, 250, 21542, Q.UNCOMMON, V.ORIG, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Bolt of Netherweave -- 26745
	recipe = AddRecipe(26745, 300, 21840, Q.COMMON, V.TBC, 300, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Bag -- 26746
	recipe = AddRecipe(26746, 315, 21841, Q.COMMON, V.TBC, 315, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Bolt of Imbued Netherweave -- 26747
	recipe = AddRecipe(26747, 325, 21842, Q.COMMON, V.TBC, 325, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16638, 16767, 19213)

	-- Imbued Netherweave Bag -- 26749
	recipe = AddRecipe(26749, 340, 21843, Q.COMMON, V.TBC, 340, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(19015, 19213)

	-- Bolt of Soulcloth -- 26750
	recipe = AddRecipe(26750, 345, 21844, Q.COMMON, V.TBC, 345, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddLimitedVendor(16638, 1, 16767, 1, 19015, 1, 19017, 1)

	-- Primal Mooncloth -- 26751
	recipe = AddRecipe(26751, 350, 21845, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Spellfire Belt -- 26752
	recipe = AddRecipe(26752, 355, 21846, Q.COMMON, V.TBC, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Spellfire Gloves -- 26753
	recipe = AddRecipe(26753, 365, 21847, Q.COMMON, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Spellfire Robe -- 26754
	recipe = AddRecipe(26754, 375, 21848, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Spellfire Bag -- 26755
	recipe = AddRecipe(26755, 375, 21858, Q.RARE, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(20134, 20135)
	recipe:AddVendor(22213, 29511)

	-- Frozen Shadoweave Shoulders -- 26756
	recipe = AddRecipe(26756, 355, 21869, Q.COMMON, V.TBC, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Frozen Shadoweave Boots -- 26757
	recipe = AddRecipe(26757, 365, 21870, Q.COMMON, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Frozen Shadoweave Robe -- 26758
	recipe = AddRecipe(26758, 375, 21871, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Ebon Shadowbag -- 26759
	recipe = AddRecipe(26759, 375, 21872, Q.RARE, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddVendor(22212, 29510)

	-- Primal Mooncloth Belt -- 26760
	recipe = AddRecipe(26760, 355, 21873, Q.COMMON, V.TBC, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Primal Mooncloth Shoulders -- 26761
	recipe = AddRecipe(26761, 365, 21874, Q.COMMON, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Primal Mooncloth Robe -- 26762
	recipe = AddRecipe(26762, 375, 21875, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Primal Mooncloth Bag -- 26763
	recipe = AddRecipe(26763, 375, 21876, Q.RARE, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18872)
	recipe:AddVendor(22208, 29512)

	-- Netherweave Bracers -- 26764
	recipe = AddRecipe(26764, 310, 21849, Q.COMMON, V.TBC, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Belt -- 26765
	recipe = AddRecipe(26765, 310, 21850, Q.COMMON, V.TBC, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Gloves -- 26770
	recipe = AddRecipe(26770, 320, 21851, Q.COMMON, V.TBC, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Pants -- 26771
	recipe = AddRecipe(26771, 325, 21852, Q.COMMON, V.TBC, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Boots -- 26772
	recipe = AddRecipe(26772, 335, 21853, Q.COMMON, V.TBC, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Robe -- 26773
	recipe = AddRecipe(26773, 340, 21854, Q.COMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(16638, 16767, 19213)

	-- Netherweave Tunic -- 26774
	recipe = AddRecipe(26774, 345, 21855, Q.COMMON, V.TBC, 345, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(16638, 16767, 19213)

	-- Imbued Netherweave Pants -- 26775
	recipe = AddRecipe(26775, 340, 21859, Q.COMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(18011, 1, 19722, 1)

	-- Imbued Netherweave Boots -- 26776
	recipe = AddRecipe(26776, 350, 21860, Q.COMMON, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(18011, 1, 19722, 1)

	-- Imbued Netherweave Robe -- 26777
	recipe = AddRecipe(26777, 360, 21861, Q.COMMON, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(19521, 1)

	-- Imbued Netherweave Tunic -- 26778
	recipe = AddRecipe(26778, 360, 21862, Q.COMMON, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(19521, 1)

	-- Soulcloth Gloves -- 26779
	recipe = AddRecipe(26779, 355, 21863, Q.COMMON, V.TBC, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(19015, 1, 19017, 1)

	-- Soulcloth Shoulders -- 26780
	recipe = AddRecipe(26780, 365, 21864, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(16406)

	-- Soulcloth Vest -- 26781
	recipe = AddRecipe(26781, 375, 21865, Q.EPIC, V.TBC, 375, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(16408)

	-- Arcanoweave Bracers -- 26782
	recipe = AddRecipe(26782, 350, 21866, Q.UNCOMMON, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddMobDrop(20869)

	-- Arcanoweave Boots -- 26783
	recipe = AddRecipe(26783, 360, 21867, Q.UNCOMMON, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddMobDrop(19168)

	-- Arcanoweave Robe -- 26784
	recipe = AddRecipe(26784, 370, 21868, Q.UNCOMMON, V.TBC, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(19220)

	-- Enchanted Mageweave Pouch -- 27658
	recipe = AddRecipe(27658, 225, 22246, Q.COMMON, V.TBC, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Enchanted Runecloth Bag -- 27659
	recipe = AddRecipe(27659, 275, 22248, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(15419)

	-- Big Bag of Enchantment -- 27660
	recipe = AddRecipe(27660, 300, 22249, Q.UNCOMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(11487)

	-- Cenarion Herb Bag -- 27724
	recipe = AddRecipe(27724, 275, 22251, Q.COMMON, V.ORIG, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15179)

	-- Satchel of Cenarius -- 27725
	recipe = AddRecipe(27725, 300, 22252, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15179)

	-- Glacial Gloves -- 28205
	recipe = AddRecipe(28205, 300, 22654, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(41)

	-- Glacial Vest -- 28207
	recipe = AddRecipe(28207, 300, 22652, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(41)

	-- Glacial Cloak -- 28208
	recipe = AddRecipe(28208, 300, 22658, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom(41)

	-- Glacial Wrists -- 28209
	recipe = AddRecipe(28209, 300, 22655, Q.EPIC, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(41)

	-- Gaea's Embrace -- 28210
	recipe = AddRecipe(28210, 300, 22660, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15179)

	-- Sylvan Vest -- 28480
	recipe = AddRecipe(28480, 300, 22756, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.CLOTH)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15179)

	-- Sylvan Crown -- 28481
	recipe = AddRecipe(28481, 300, 22757, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.CLOTH)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15179)

	-- Sylvan Shoulders -- 28482
	recipe = AddRecipe(28482, 300, 22758, Q.COMMON, V.ORIG, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.CLOTH)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15179)

	-- Spellcloth -- 31373
	recipe = AddRecipe(31373, 350, 24271, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Mystic Spellthread -- 31430
	recipe = AddRecipe(31430, 335, 24273, Q.COMMON, V.TBC, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Silver Spellthread -- 31431
	recipe = AddRecipe(31431, 335, 24275, Q.COMMON, V.TBC, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Runic Spellthread -- 31432
	recipe = AddRecipe(31432, 375, 24274, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Golden Spellthread -- 31433
	recipe = AddRecipe(31433, 375, 24276, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Unyielding Bracers -- 31434
	recipe = AddRecipe(31434, 350, 24249, Q.RARE, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddMobDrop(24664)

	-- Bracers of Havok -- 31435
	recipe = AddRecipe(31435, 350, 24250, Q.RARE, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Blackstrike Bracers -- 31437
	recipe = AddRecipe(31437, 350, 24251, Q.RARE, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Cloak of the Black Void -- 31438
	recipe = AddRecipe(31438, 350, 24252, Q.RARE, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Cloak of Eternity -- 31440
	recipe = AddRecipe(31440, 350, 24253, Q.RARE, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- White Remedy Cape -- 31441
	recipe = AddRecipe(31441, 350, 24254, Q.RARE, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Unyielding Girdle -- 31442
	recipe = AddRecipe(31442, 365, 24255, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(24664)

	-- Girdle of Ruination -- 31443
	recipe = AddRecipe(31443, 365, 24256, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Black Belt of Knowledge -- 31444
	recipe = AddRecipe(31444, 365, 24257, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Resolute Cape -- 31448
	recipe = AddRecipe(31448, 365, 24258, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Vengeance Wrap -- 31449
	recipe = AddRecipe(31449, 365, 24259, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Manaweave Cloak -- 31450
	recipe = AddRecipe(31450, 365, 24260, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Whitemend Pants -- 31451
	recipe = AddRecipe(31451, 375, 24261, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(20885)

	-- Spellstrike Pants -- 31452
	recipe = AddRecipe(31452, 375, 24262, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(18708)

	-- Battlecast Pants -- 31453
	recipe = AddRecipe(31453, 375, 24263, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(17978)

	-- Whitemend Hood -- 31454
	recipe = AddRecipe(31454, 375, 24264, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(17977)

	-- Spellstrike Hood -- 31455
	recipe = AddRecipe(31455, 375, 24266, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(16807)

	-- Battlecast Hood -- 31456
	recipe = AddRecipe(31456, 375, 24267, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(17798)

	-- Bag of Jewels -- 31459
	recipe = AddRecipe(31459, 340, 24270, Q.COMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Netherweave Net -- 31460
	recipe = AddRecipe(31460, 300, 24268, Q.COMMON, V.TBC, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Belt of Blasting -- 36315
	recipe = AddRecipe(36315, 375, 30038, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(37, 43)

	-- Belt of the Long Road -- 36316
	recipe = AddRecipe(36316, 375, 30036, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(37, 43)

	-- Boots of Blasting -- 36317
	recipe = AddRecipe(36317, 375, 30037, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(37, 43)

	-- Boots of the Long Road -- 36318
	recipe = AddRecipe(36318, 375, 30035, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(37, 43)

	-- Shadowcloth -- 36686
	recipe = AddRecipe(36686, 350, 24272, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Cloak of Arcane Evasion -- 37873
	recipe = AddRecipe(37873, 350, 30831, Q.COMMON, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LOWERCITY, F.CLOAK)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.HONORED, 21655)

	-- Flameheart Bracers -- 37882
	recipe = AddRecipe(37882, 350, 30837, Q.COMMON, V.TBC, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR, F.CLOTH)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Flameheart Gloves -- 37883
	recipe = AddRecipe(37883, 360, 30838, Q.COMMON, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR, F.CLOTH)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Flameheart Vest -- 37884
	recipe = AddRecipe(37884, 370, 30839, Q.COMMON, V.TBC, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR, F.CLOTH)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Soulguard Slippers -- 40020
	recipe = AddRecipe(40020, 375, 32391, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Soulguard Bracers -- 40021
	recipe = AddRecipe(40021, 375, 32392, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Soulguard Leggings -- 40023
	recipe = AddRecipe(40023, 375, 32389, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Soulguard Girdle -- 40024
	recipe = AddRecipe(40024, 375, 32390, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Night's End -- 40060
	recipe = AddRecipe(40060, 375, 32420, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOAK)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Bracers of Nimble Thought -- 41205
	recipe = AddRecipe(41205, 375, 32586, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(34)

	-- Mantle of Nimble Thought -- 41206
	recipe = AddRecipe(41206, 375, 32587, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(27, 34)

	-- Swiftheal Wraps -- 41207
	recipe = AddRecipe(41207, 375, 32584, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(27, 34)

	-- Swiftheal Mantle -- 41208
	recipe = AddRecipe(41208, 375, 32585, Q.EPIC, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(34)

	-- Green Winter Clothes -- 44950
	recipe = AddRecipe(44950, 250, 34087, Q.UNCOMMON, V.TBC, 250, 250, 250, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(13420)
	recipe:AddSeason(1)

	-- Red Winter Clothes -- 44958
	recipe = AddRecipe(44958, 250, 34085, Q.UNCOMMON, V.TBC, 250, 250, 250, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(13433)
	recipe:AddSeason(1)

	-- Sunfire Handwraps -- 46128
	recipe = AddRecipe(46128, 365, 34366, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(24)

	-- Hands of Eternal Light -- 46129
	recipe = AddRecipe(46129, 365, 34367, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(24)

	-- Sunfire Robe -- 46130
	recipe = AddRecipe(46130, 365, 34364, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(24)

	-- Robe of Eternal Light -- 46131
	recipe = AddRecipe(46131, 365, 34365, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(24)

	-- Dress Shoes -- 49677
	recipe = AddRecipe(49677, 250, 6836, Q.COMMON, V.TBC, 250, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(15165)

	-- Mycah's Botanical Bag -- 50194
	recipe = AddRecipe(50194, 375, 38225, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.REVERED, 18382)

	-- Haliscan Jacket -- 50644
	recipe = AddRecipe(50644, 250, 38277, Q.COMMON, V.TBC, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(15165)

	-- Haliscan Pantaloons -- 50647
	recipe = AddRecipe(50647, 245, 38278, Q.COMMON, V.TBC, 245, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(15165)
	
	-- Lightweave Embroidery -- 55642
	recipe = AddRecipe(55642, 420, nil, Q.COMMON, V.WOTLK, 420, 420, 420, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Darkglow Embroidery -- 55769
	recipe = AddRecipe(55769, 420, nil, Q.COMMON, V.WOTLK, 420, 420, 420, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Swordguard Embroidery -- 55777
	recipe = AddRecipe(55777, 420, nil, Q.COMMON, V.WOTLK, 420, 420, 420, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostweave Net -- 55898
	recipe = AddRecipe(55898, 360, 41509, Q.COMMON, V.WOTLK, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Bolt of Frostweave -- 55899
	recipe = AddRecipe(55899, 350, 41510, Q.COMMON, V.WOTLK, 350, 370, 372, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Bolt of Imbued Frostweave -- 55900
	recipe = AddRecipe(55900, 400, 41511, Q.COMMON, V.WOTLK, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Leggings -- 55901
	recipe = AddRecipe(55901, 395, 41548, Q.COMMON, V.WOTLK, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Shoulders -- 55902
	recipe = AddRecipe(55902, 350, 41513, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Robe -- 55903
	recipe = AddRecipe(55903, 360, 41515, Q.COMMON, V.WOTLK, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Gloves -- 55904
	recipe = AddRecipe(55904, 360, 44211, Q.COMMON, V.WOTLK, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Boots -- 55906
	recipe = AddRecipe(55906, 375, 41520, Q.COMMON, V.WOTLK, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Cowl -- 55907
	recipe = AddRecipe(55907, 380, 41521, Q.COMMON, V.WOTLK, 380, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Belt -- 55908
	recipe = AddRecipe(55908, 370, 41522, Q.COMMON, V.WOTLK, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Mystic Frostwoven Shoulders -- 55910
	recipe = AddRecipe(55910, 385, 41523, Q.COMMON, V.WOTLK, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Mystic Frostwoven Robe -- 55911
	recipe = AddRecipe(55911, 390, 41525, Q.COMMON, V.WOTLK, 390, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Mystic Frostwoven Wristwraps -- 55913
	recipe = AddRecipe(55913, 385, 41528, Q.COMMON, V.WOTLK, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Belt -- 55914
	recipe = AddRecipe(55914, 395, 41543, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Cowl -- 55919
	recipe = AddRecipe(55919, 395, 41546, Q.COMMON, V.WOTLK, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Wristwraps -- 55920
	recipe = AddRecipe(55920, 400, 41551, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Robe -- 55921
	recipe = AddRecipe(55921, 405, 41549, Q.COMMON, V.WOTLK, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Gloves -- 55922
	recipe = AddRecipe(55922, 405, 41545, Q.COMMON, V.WOTLK, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Shoulders -- 55923
	recipe = AddRecipe(55923, 410, 41550, Q.COMMON, V.WOTLK, 410, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Boots -- 55924
	recipe = AddRecipe(55924, 410, 41544, Q.COMMON, V.WOTLK, 410, 410, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Black Duskweave Leggings -- 55925
	recipe = AddRecipe(55925, 415, 41553, Q.COMMON, V.WOTLK, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Black Duskweave Robe -- 55941
	recipe = AddRecipe(55941, 420, 41554, Q.COMMON, V.WOTLK, 420, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Black Duskweave Wristwraps -- 55943
	recipe = AddRecipe(55943, 415, 41555, Q.COMMON, V.WOTLK, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Red Lumberjack Shirt -- 55993
	recipe = AddRecipe(55993, 400, 41248, Q.UNCOMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Blue Lumberjack Shirt -- 55994
	recipe = AddRecipe(55994, 400, 41249, Q.UNCOMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Yellow Lumberjack Shirt -- 55995
	recipe = AddRecipe(55995, 400, 41251, Q.COMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Green Lumberjack Shirt -- 55996
	recipe = AddRecipe(55996, 400, 41250, Q.UNCOMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Red Workman's Shirt -- 55997
	recipe = AddRecipe(55997, 400, 41252, Q.UNCOMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Blue Workman's Shirt -- 55998
	recipe = AddRecipe(55998, 400, 41253, Q.UNCOMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Rustic Workman's Shirt -- 55999
	recipe = AddRecipe(55999, 400, 41254, Q.UNCOMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Green Workman's Shirt -- 56000
	recipe = AddRecipe(56000, 400, 41255, Q.COMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Moonshroud -- 56001
	recipe = AddRecipe(56001, 415, 41594, Q.COMMON, V.WOTLK, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Ebonweave -- 56002
	recipe = AddRecipe(56002, 415, 41593, Q.COMMON, V.WOTLK, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Spellweave -- 56003
	recipe = AddRecipe(56003, 415, 41595, Q.COMMON, V.WOTLK, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Abyssal Bag -- 56004
	recipe = AddRecipe(56004, 435, 41597, Q.COMMON, V.WOTLK, 435, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WARLOCK, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.REVERED, 32538)

	-- Glacial Bag -- 56005
	recipe = AddRecipe(56005, 445, 41600, Q.COMMON, V.WOTLK, 445, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.EXALTED, 32540)

	-- Mysterious Bag -- 56006
	recipe = AddRecipe(56006, 440, 41598, Q.COMMON, V.WOTLK, 440, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WYRMREST)
	recipe:AddRepVendor(FAC.WYRMREST, REP.REVERED, 32533)

	-- Frostweave Bag -- 56007
	recipe = AddRecipe(56007, 410, 41599, Q.COMMON, V.WOTLK, 410, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Shining Spellthread -- 56008
	recipe = AddRecipe(56008, 400, 41601, Q.COMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Brilliant Spellthread -- 56009
	recipe = AddRecipe(56009, 430, 41602, Q.COMMON, V.WOTLK, 430, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTCRUSADE)
	recipe:AddRepVendor(FAC.ARGENTCRUSADE, REP.EXALTED, 30431)

	-- Azure Spellthread -- 56010
	recipe = AddRecipe(56010, 400, 41603, Q.COMMON, V.WOTLK, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Sapphire Spellthread -- 56011
	recipe = AddRecipe(56011, 430, 41604, Q.COMMON, V.WOTLK, 430, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KIRINTOR)
	recipe:AddRepVendor(FAC.KIRINTOR, REP.EXALTED, 32287)

	-- Cloak of the Moon -- 56014
	recipe = AddRecipe(56014, 390, 41607, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Cloak of Frozen Spirits -- 56015
	recipe = AddRecipe(56015, 395, 41608, Q.COMMON, V.WOTLK, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Wispcloak -- 56016
	recipe = AddRecipe(56016, 420, 41609, Q.COMMON, V.WOTLK, 420, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(26914, 28699)
	recipe:AddCustom(45)

	-- Deathchill Cloak -- 56017
	recipe = AddRecipe(56017, 420, 41610, Q.COMMON, V.WOTLK, 420, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(26914, 28699)
	recipe:AddCustom(44)

	-- Hat of Wintry Doom -- 56018
	recipe = AddRecipe(56018, 425, 41984, Q.COMMON, V.WOTLK, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Silky Iceshard Boots -- 56019
	recipe = AddRecipe(56019, 420, 41985, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Deep Frozen Cord -- 56020
	recipe = AddRecipe(56020, 420, 41986, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostmoon Pants -- 56021
	recipe = AddRecipe(56021, 425, 42093, Q.COMMON, V.WOTLK, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Light Blessed Mittens -- 56022
	recipe = AddRecipe(56022, 420, 42095, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Aurora Slippers -- 56023
	recipe = AddRecipe(56023, 420, 42096, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Moonshroud Robe -- 56024
	recipe = AddRecipe(56024, 440, 42100, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Moonshroud Gloves -- 56025
	recipe = AddRecipe(56025, 435, 42103, Q.COMMON, V.WOTLK, 435, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Ebonweave Robe -- 56026
	recipe = AddRecipe(56026, 440, 42101, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Ebonweave Gloves -- 56027
	recipe = AddRecipe(56027, 435, 42111, Q.COMMON, V.WOTLK, 435, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Spellweave Robe -- 56028
	recipe = AddRecipe(56028, 440, 42102, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Spellweave Gloves -- 56029
	recipe = AddRecipe(56029, 435, 42113, Q.COMMON, V.WOTLK, 435, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Leggings -- 56030
	recipe = AddRecipe(56030, 380, 41519, Q.COMMON, V.WOTLK, 380, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Wristwraps -- 56031
	recipe = AddRecipe(56031, 350, 41512, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)
	
	-- Master's Spellthread -- 56034
	recipe = AddRecipe(56034, 405, nil, Q.COMMON, V.WOTLK, 405, 405, 405, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Sanctified Spellthread -- 56039
	recipe = AddRecipe(56039, 405, nil, Q.COMMON, V.WOTLK, 405, 405, 405, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Belt -- 59582
	recipe = AddRecipe(59582, 415, 43969, Q.COMMON, V.WOTLK, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Bracers -- 59583
	recipe = AddRecipe(59583, 415, 43974, Q.COMMON, V.WOTLK, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Shoulders -- 59584
	recipe = AddRecipe(59584, 420, 43973, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Boots -- 59585
	recipe = AddRecipe(59585, 420, 43970, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Gloves -- 59586
	recipe = AddRecipe(59586, 420, 41516, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Robe -- 59587
	recipe = AddRecipe(59587, 420, 43972, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Leggings -- 59588
	recipe = AddRecipe(59588, 420, 43975, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Cowl -- 59589
	recipe = AddRecipe(59589, 420, 43971, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Flying Carpet -- 60969
	recipe = AddRecipe(60969, 300, 44554, Q.COMMON, V.WOTLK, 300, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Magnificent Flying Carpet -- 60971
	recipe = AddRecipe(60971, 425, 44558, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Glacial Waistband -- 60990
	recipe = AddRecipe(60990, 420, 43584, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Glacial Robe -- 60993
	recipe = AddRecipe(60993, 425, 43583, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Glacial Slippers -- 60994
	recipe = AddRecipe(60994, 420, 43585, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Sash of Ancient Power -- 63203
	recipe = AddRecipe(63203, 450, 45102, Q.EPIC, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(39)

	-- Spellslinger's Slippers -- 63204
	recipe = AddRecipe(63204, 450, 45566, Q.EPIC, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(39)

	-- Cord of the White Dawn -- 63205
	recipe = AddRecipe(63205, 450, 45104, Q.EPIC, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(39)

	-- Savior's Slippers -- 63206
	recipe = AddRecipe(63206, 450, 45567, Q.EPIC, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(39)

	-- Spidersilk Drape -- 63742
	recipe = AddRecipe(63742, 125, 45626, Q.COMMON, V.WOTLK, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Emerald Bag -- 63924
	recipe = AddRecipe(63924, 435, 45773, Q.COMMON, V.WOTLK, 435, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.REVERED, 31916, 32763)

	-- Frostguard Drape -- 64729
	recipe = AddRecipe(64729, 400, 45811, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Cloak of Crimson Snow -- 64730
	recipe = AddRecipe(64730, 405, 45810, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Royal Moonshroud Robe -- 67064
	recipe = AddRecipe(67064, 450, 47605, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Royal Moonshroud Bracers -- 67065
	recipe = AddRecipe(67065, 450, 47587, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Merlin's Robe -- 67066
	recipe = AddRecipe(67066, 450, 47603, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Bejeweled Wizard's Bracers -- 67079
	recipe = AddRecipe(67079, 450, 47585, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Royal Moonshroud Robe -- 67144
	recipe = AddRecipe(67144, 450, 47606, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Bejeweled Wizard's Bracers -- 67145
	recipe = AddRecipe(67145, 450, 47586, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Merlin's Robe -- 67146
	recipe = AddRecipe(67146, 450, 47604, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Royal Moonshroud Bracers -- 67147
	recipe = AddRecipe(67147, 450, 47588, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(42)

	-- Leggings of Woven Death -- 70550
	recipe = AddRecipe(70550, 450, 49891, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Deathfrost Boots -- 70551
	recipe = AddRecipe(70551, 450, 49890, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Lightweave Leggings -- 70552
	recipe = AddRecipe(70552, 450, 49892, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Sandals of Consecration -- 70553
	recipe = AddRecipe(70553, 450, 49893, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Bolt of Embersilk Cloth -- 74964
	recipe = AddRecipe(74964, 425, 53643, Q.COMMON, V.CATA, 425, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Dream of Skywall -- 75141
	recipe = AddRecipe(75141, 515, 54440, Q.COMMON, V.CATA, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Dream of Deepholm -- 75142
	recipe = AddRecipe(75142, 505, 54440, Q.COMMON, V.CATA, 505, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Dream of Hyjal -- 75144
	recipe = AddRecipe(75144, 500, 54440, Q.COMMON, V.CATA, 500, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Dream of Ragnaros -- 75145
	recipe = AddRecipe(75145, 510, 54440, Q.COMMON, V.CATA, 510, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Dream of Azshara -- 75146
	recipe = AddRecipe(75146, 500, 54440, Q.COMMON, V.CATA, 500, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Master's Spellthread -- 75154
	recipe = AddRecipe(75154, 475, nil, Q.COMMON, V.CATA, 475, 475, 475, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Sanctified Spellthread -- 75155
	recipe = AddRecipe(75155, 475, nil, Q.COMMON, V.CATA, 475, 475, 475, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Lightweave Embroidery -- 75172
	recipe = AddRecipe(75172, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Darkglow Embroidery -- 75175
	recipe = AddRecipe(75175, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Swordguard Embroidery -- 75178
	recipe = AddRecipe(75178, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Embersilk Net -- 75247
	recipe = AddRecipe(75247, 425, 54442, Q.COMMON, V.CATA, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Belt -- 75248
	recipe = AddRecipe(75248, 445, 54471, Q.COMMON, V.CATA, 445, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Bracers -- 75249
	recipe = AddRecipe(75249, 445, 54473, Q.COMMON, V.CATA, 445, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Enchanted Spellthread -- 75250
	recipe = AddRecipe(75250, 450, 54447, Q.COMMON, V.CATA, 450, 465, 467, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Shoulders -- 75251
	recipe = AddRecipe(75251, 455, 54474, Q.COMMON, V.CATA, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Boots -- 75252
	recipe = AddRecipe(75252, 455, 54477, Q.COMMON, V.CATA, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Gloves -- 75253
	recipe = AddRecipe(75253, 460, 54478, Q.COMMON, V.CATA, 460, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Leggings -- 75254
	recipe = AddRecipe(75254, 460, 54472, Q.COMMON, V.CATA, 460, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Ghostly Spellthread -- 75255
	recipe = AddRecipe(75255, 460, 54449, Q.COMMON, V.CATA, 460, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Cowl -- 75256
	recipe = AddRecipe(75256, 465, 54476, Q.COMMON, V.CATA, 465, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Deathsilk Robes -- 75257
	recipe = AddRecipe(75257, 465, 54475, Q.COMMON, V.CATA, 465, 475, 477, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Belt -- 75258
	recipe = AddRecipe(75258, 470, 54481, Q.COMMON, V.CATA, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Bracers -- 75259
	recipe = AddRecipe(75259, 470, 54480, Q.COMMON, V.CATA, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Shoulders -- 75260
	recipe = AddRecipe(75260, 475, 54479, Q.COMMON, V.CATA, 475, 485, 487, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Boots -- 75261
	recipe = AddRecipe(75261, 475, 54482, Q.COMMON, V.CATA, 475, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Gloves -- 75262
	recipe = AddRecipe(75262, 480, 54484, Q.COMMON, V.CATA, 480, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Leggings -- 75263
	recipe = AddRecipe(75263, 480, 54483, Q.COMMON, V.CATA, 480, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Embersilk Bag -- 75264
	recipe = AddRecipe(75264, 480, 54443, Q.COMMON, V.CATA, 480, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Otherworldly Bag -- 75265
	recipe = AddRecipe(75265, 480, 54445, Q.COMMON, V.CATA, 480, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Cowl -- 75266
	recipe = AddRecipe(75266, 485, 54485, Q.COMMON, V.CATA, 485, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Spiritmend Robe -- 75267
	recipe = AddRecipe(75267, 485, 54486, Q.COMMON, V.CATA, 485, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Hyjal Expedition Bag -- 75268
	recipe = AddRecipe(75268, 490, 54446, Q.COMMON, V.CATA, 490, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Fireweave Belt -- 75269
	recipe = AddRecipe(75269, 510, 54489, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Emberfire Bracers -- 75270
	recipe = AddRecipe(75270, 500, 54501, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Black Embersilk Gown -- 75288
	recipe = AddRecipe(75288, 500, 54441, Q.RARE, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Bracers -- 75290
	recipe = AddRecipe(75290, 500, 54488, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Emberfire Shoulders -- 75291
	recipe = AddRecipe(75291, 505, 54502, Q.COMMON, V.CATA, 505, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Fireweave Shoulders -- 75292
	recipe = AddRecipe(75292, 510, 54487, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Emberfire Belt -- 75293
	recipe = AddRecipe(75293, 510, 54500, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Fireweave Boots -- 75294
	recipe = AddRecipe(75294, 515, 54490, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Emberfire Gloves -- 75295
	recipe = AddRecipe(75295, 515, 54497, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Fireweave Gloves -- 75296
	recipe = AddRecipe(75296, 520, 54492, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Emberfire Boots -- 75297
	recipe = AddRecipe(75297, 520, 54499, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	-- Belt of the Depths -- 75298
	recipe = AddRecipe(75298, 525, 54504, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Dreamless Belt -- 75299
	recipe = AddRecipe(75299, 525, 54503, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Breeches of Mended Nightmares -- 75300
	recipe = AddRecipe(75300, 525, 54505, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Flame-Ascended Pantaloons -- 75301
	recipe = AddRecipe(75301, 525, 54506, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Pants -- 75302
	recipe = AddRecipe(75302, 525, 54491, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Robe -- 75303
	recipe = AddRecipe(75303, 525, 54494, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Cowl -- 75304
	recipe = AddRecipe(75304, 525, 54493, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Emberfire Robe -- 75305
	recipe = AddRecipe(75305, 525, 54495, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Emberfire Cowl -- 75306
	recipe = AddRecipe(75306, 525, 54496, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Emberfire Pants -- 75307
	recipe = AddRecipe(75307, 525, 54498, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Illusionary Bag -- 75308
	recipe = AddRecipe(75308, 525, 54444, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Powerful Enchanted Spellthread -- 75309
	recipe = AddRecipe(75309, 525, 54448, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Powerful Ghostly Spellthread -- 75310
	recipe = AddRecipe(75310, 525, 54450, Q.RARE, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Frosty Flying Carpet -- 75597
	recipe = AddRecipe(75597, 450, 54797, Q.EPIC, V.WOTLK, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(40160)

	-- Dream of Destruction -- 94743
	recipe = AddRecipe(94743, 525, 54440, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33613, 44783, 45559)

	self.InitTailoring = nil
end
