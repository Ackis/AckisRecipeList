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
local FOLDER_NAME, private = ...

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
function addon:InitTailoring()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 3908, genesis, quality)
	end

	private:InitializeTailoringTrainers()

	local recipe

	-- Brown Linen Vest -- 2385
	recipe = AddRecipe(2385, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2568)
	recipe:SetSkillLevels(10, 10, 45, 57, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Boots -- 2386
	recipe = AddRecipe(2386, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2569)
	recipe:SetSkillLevels(65, 65, 90, 107, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Cloak -- 2387
	recipe = AddRecipe(2387, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2570)
	recipe:SetSkillLevels(1, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Red Linen Robe -- 2389
	recipe = AddRecipe(2389, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2598)
	recipe:SetCraftedItemID(2572)
	recipe:SetSkillLevels(40, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Red Linen Shirt -- 2392
	recipe = AddRecipe(2392, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2575)
	recipe:SetSkillLevels(40, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Linen Shirt -- 2393
	recipe = AddRecipe(2393, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2576)
	recipe:SetSkillLevels(1, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Blue Linen Shirt -- 2394
	recipe = AddRecipe(2394, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2577)
	recipe:SetSkillLevels(40, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Barbaric Linen Vest -- 2395
	recipe = AddRecipe(2395, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2578)
	recipe:SetSkillLevels(70, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Linen Shirt -- 2396
	recipe = AddRecipe(2396, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2579)
	recipe:SetSkillLevels(70, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Reinforced Linen Cape -- 2397
	recipe = AddRecipe(2397, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2580)
	recipe:SetSkillLevels(60, 60, 85, 102, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Woolen Vest -- 2399
	recipe = AddRecipe(2399, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2582)
	recipe:SetSkillLevels(85, 85, 110, 127, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Woolen Boots -- 2401
	recipe = AddRecipe(2401, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2583)
	recipe:SetSkillLevels(95, 95, 120, 137, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Woolen Cape -- 2402
	recipe = AddRecipe(2402, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2584)
	recipe:SetSkillLevels(75, 75, 100, 117, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Gray Woolen Robe -- 2403
	recipe = AddRecipe(2403, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2601)
	recipe:SetCraftedItemID(2585)
	recipe:SetSkillLevels(105, 105, 130, 147, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gray Woolen Shirt -- 2406
	recipe = AddRecipe(2406, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2587)
	recipe:SetSkillLevels(100, 100, 110, 120, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Bolt of Linen Cloth -- 2963
	recipe = AddRecipe(2963, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2996)
	recipe:SetSkillLevels(1, 1, 25, 37, 50)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Bolt of Woolen Cloth -- 2964
	recipe = AddRecipe(2964, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2997)
	recipe:SetSkillLevels(75, 75, 90, 97, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Bag -- 3755
	recipe = AddRecipe(3755, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4238)
	recipe:SetSkillLevels(45, 45, 70, 87, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Woolen Bag -- 3757
	recipe = AddRecipe(3757, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4240)
	recipe:SetSkillLevels(80, 80, 105, 122, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Woolen Bag -- 3758
	recipe = AddRecipe(3758, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4292)
	recipe:SetCraftedItemID(4241)
	recipe:SetSkillLevels(95, 95, 120, 137, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Small Silk Pack -- 3813
	recipe = AddRecipe(3813, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4245)
	recipe:SetSkillLevels(150, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Bolt of Silk Cloth -- 3839
	recipe = AddRecipe(3839, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4305)
	recipe:SetSkillLevels(125, 125, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Heavy Linen Gloves -- 3840
	recipe = AddRecipe(3840, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4307)
	recipe:SetSkillLevels(35, 35, 60, 77, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Linen Bracers -- 3841
	recipe = AddRecipe(3841, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4308)
	recipe:SetSkillLevels(60, 60, 85, 102, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Handstitched Linen Britches -- 3842
	recipe = AddRecipe(3842, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4309)
	recipe:SetSkillLevels(70, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Heavy Woolen Gloves -- 3843
	recipe = AddRecipe(3843, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4310)
	recipe:SetSkillLevels(85, 85, 110, 127, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Heavy Woolen Cloak -- 3844
	recipe = AddRecipe(3844, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4346)
	recipe:SetCraftedItemID(4311)
	recipe:SetSkillLevels(100, 100, 125, 142, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Soft-soled Linen Boots -- 3845
	recipe = AddRecipe(3845, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4312)
	recipe:SetSkillLevels(80, 80, 105, 122, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Woolen Boots -- 3847
	recipe = AddRecipe(3847, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4345)
	recipe:SetCraftedItemID(4313)
	recipe:SetSkillLevels(95, 95, 120, 137, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Double-stitched Woolen Shoulders -- 3848
	recipe = AddRecipe(3848, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4314)
	recipe:SetSkillLevels(110, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Reinforced Woolen Shoulders -- 3849
	recipe = AddRecipe(3849, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4347)
	recipe:SetCraftedItemID(4315)
	recipe:SetSkillLevels(120, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Woolen Pants -- 3850
	recipe = AddRecipe(3850, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4316)
	recipe:SetSkillLevels(110, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Phoenix Pants -- 3851
	recipe = AddRecipe(3851, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4349)
	recipe:SetCraftedItemID(4317)
	recipe:SetSkillLevels(125, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gloves of Meditation -- 3852
	recipe = AddRecipe(3852, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4318)
	recipe:SetSkillLevels(130, 130, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Gloves -- 3854
	recipe = AddRecipe(3854, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7114)
	recipe:SetCraftedItemID(4319)
	recipe:SetSkillLevels(145, 145, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(2679, 1, 9636, 1)

	-- Spidersilk Boots -- 3855
	recipe = AddRecipe(3855, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4320)
	recipe:SetSkillLevels(125, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Spider Silk Slippers -- 3856
	recipe = AddRecipe(3856, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4350)
	recipe:SetCraftedItemID(4321)
	recipe:SetSkillLevels(140, 140, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchanter's Cowl -- 3857
	recipe = AddRecipe(3857, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14630)
	recipe:SetCraftedItemID(4322)
	recipe:SetSkillLevels(165, 165, 185, 200, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(2670, 1)

	-- Shadow Hood -- 3858
	recipe = AddRecipe(3858, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4351)
	recipe:SetCraftedItemID(4323)
	recipe:SetSkillLevels(170, 170, 190, 205, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Azure Silk Vest -- 3859
	recipe = AddRecipe(3859, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4324)
	recipe:SetSkillLevels(150, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Boots of the Enchanter -- 3860
	recipe = AddRecipe(3860, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4352)
	recipe:SetCraftedItemID(4325)
	recipe:SetSkillLevels(175, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Long Silken Cloak -- 3861
	recipe = AddRecipe(3861, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4326)
	recipe:SetSkillLevels(185, 185, 205, 220, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Icy Cloak -- 3862
	recipe = AddRecipe(3862, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(4355)
	recipe:SetCraftedItemID(4327)
	recipe:SetSkillLevels(200, 200, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddLimitedVendor(6567, 1)

	-- Spider Belt -- 3863
	recipe = AddRecipe(3863, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4353)
	recipe:SetCraftedItemID(4328)
	recipe:SetSkillLevels(180, 180, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Star Belt -- 3864
	recipe = AddRecipe(3864, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4356)
	recipe:SetCraftedItemID(4329)
	recipe:SetSkillLevels(200, 200, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Bolt of Mageweave -- 3865
	recipe = AddRecipe(3865, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4339)
	recipe:SetSkillLevels(175, 175, 180, 182, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Stylish Red Shirt -- 3866
	recipe = AddRecipe(3866, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4330)
	recipe:SetSkillLevels(110, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Phoenix Gloves -- 3868
	recipe = AddRecipe(3868, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4348)
	recipe:SetCraftedItemID(4331)
	recipe:SetSkillLevels(125, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Bright Yellow Shirt -- 3869
	recipe = AddRecipe(3869, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14627)
	recipe:SetCraftedItemID(4332)
	recipe:SetSkillLevels(135, 135, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2668, 1)

	-- Dark Silk Shirt -- 3870
	recipe = AddRecipe(3870, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6401)
	recipe:SetCraftedItemID(4333)
	recipe:SetSkillLevels(155, 155, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2394, 1, 2669, 1)

	-- Formal White Shirt -- 3871
	recipe = AddRecipe(3871, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4334)
	recipe:SetSkillLevels(170, 170, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Rich Purple Silk Shirt -- 3872
	recipe = AddRecipe(3872, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(4354)
	recipe:SetCraftedItemID(4335)
	recipe:SetSkillLevels(185, 185, 195, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Black Swashbuckler's Shirt -- 3873
	recipe = AddRecipe(3873, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10728)
	recipe:SetCraftedItemID(4336)
	recipe:SetSkillLevels(200, 200, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2663)

	-- Brown Linen Pants -- 3914
	recipe = AddRecipe(3914, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4343)
	recipe:SetSkillLevels(30, 30, 55, 72, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Brown Linen Shirt -- 3915
	recipe = AddRecipe(3915, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4344)
	recipe:SetSkillLevels(1, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Pearl-clasped Cloak -- 6521
	recipe = AddRecipe(6521, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5542)
	recipe:SetSkillLevels(90, 90, 115, 132, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Linen Bag -- 6686
	recipe = AddRecipe(6686, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5771)
	recipe:SetCraftedItemID(5762)
	recipe:SetSkillLevels(70, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(590, 3530, 3531)
	recipe:AddLimitedVendor(843, 1, 3005, 1, 3556, 1, 4189, 1, 16224, 1)

	-- Red Woolen Bag -- 6688
	recipe = AddRecipe(6688, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5772)
	recipe:SetCraftedItemID(5763)
	recipe:SetSkillLevels(115, 115, 140, 157, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(777, 1, 1454, 1, 1474, 1, 3005, 1, 3364, 1, 3485, 1, 3537, 1, 4189, 2, 4577, 1)

	-- Lesser Wizard's Robe -- 6690
	recipe = AddRecipe(6690, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5766)
	recipe:SetSkillLevels(135, 135, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Robes of Arcana -- 6692
	recipe = AddRecipe(6692, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5773)
	recipe:SetCraftedItemID(5770)
	recipe:SetSkillLevels(150, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(10760)

	-- Green Silk Pack -- 6693
	recipe = AddRecipe(6693, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5774)
	recipe:SetCraftedItemID(5764)
	recipe:SetSkillLevels(175, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Black Silk Pack -- 6695
	recipe = AddRecipe(6695, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5775)
	recipe:SetCraftedItemID(5765)
	recipe:SetSkillLevels(185, 185, 205, 220, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(2242, 4834)

	-- Brown Linen Robe -- 7623
	recipe = AddRecipe(7623, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6238)
	recipe:SetSkillLevels(30, 30, 55, 72, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Linen Robe -- 7624
	recipe = AddRecipe(7624, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6241)
	recipe:SetSkillLevels(30, 30, 55, 72, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Linen Vest -- 7629
	recipe = AddRecipe(7629, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6271)
	recipe:SetCraftedItemID(6239)
	recipe:SetSkillLevels(55, 55, 80, 97, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Blue Linen Vest -- 7630
	recipe = AddRecipe(7630, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6270)
	recipe:SetCraftedItemID(6240)
	recipe:SetSkillLevels(55, 55, 80, 97, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(66)
	recipe:AddLimitedVendor(3364, 1, 3485, 1, 3522, 1, 4189, 1)

	-- Blue Linen Robe -- 7633
	recipe = AddRecipe(7633, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6272)
	recipe:SetCraftedItemID(6242)
	recipe:SetSkillLevels(70, 70, 95, 112, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(1250, 1, 3485, 1, 3499, 1, 3556, 1, 4168, 1)

	-- Blue Overalls -- 7639
	recipe = AddRecipe(7639, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6274)
	recipe:SetCraftedItemID(6263)
	recipe:SetSkillLevels(100, 100, 125, 142, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(843, 1, 1347, 1, 2394, 1, 3364, 1)

	-- Greater Adept's Robe -- 7643
	recipe = AddRecipe(7643, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6275)
	recipe:SetCraftedItemID(6264)
	recipe:SetSkillLevels(115, 115, 140, 157, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(1454, 1, 1474, 1, 2669, 1, 3499, 1, 4168, 1, 4577, 1)

	-- Stylish Blue Shirt -- 7892
	recipe = AddRecipe(7892, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6390)
	recipe:SetCraftedItemID(6384)
	recipe:SetSkillLevels(120, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Stylish Green Shirt -- 7893
	recipe = AddRecipe(7893, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6391)
	recipe:SetCraftedItemID(6385)
	recipe:SetSkillLevels(120, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Simple Dress -- 8465
	recipe = AddRecipe(8465, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6786)
	recipe:SetSkillLevels(40, 40, 65, 82, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Woolen Dress -- 8467
	recipe = AddRecipe(8467, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6787)
	recipe:SetSkillLevels(110, 110, 135, 152, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- White Swashbuckler's Shirt -- 8483
	recipe = AddRecipe(8483, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6795)
	recipe:SetSkillLevels(160, 160, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Swashbuckler's Shirt -- 8489
	recipe = AddRecipe(8489, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6796)
	recipe:SetSkillLevels(175, 175, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Pants -- 8758
	recipe = AddRecipe(8758, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7046)
	recipe:SetSkillLevels(140, 140, 160, 175, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Hood -- 8760
	recipe = AddRecipe(8760, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7048)
	recipe:SetSkillLevels(145, 145, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Silk Headband -- 8762
	recipe = AddRecipe(8762, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7050)
	recipe:SetSkillLevels(160, 160, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Earthen Vest -- 8764
	recipe = AddRecipe(8764, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7051)
	recipe:SetSkillLevels(170, 170, 190, 205, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Azure Silk Belt -- 8766
	recipe = AddRecipe(8766, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7052)
	recipe:SetSkillLevels(175, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Robe of Power -- 8770
	recipe = AddRecipe(8770, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7054)
	recipe:SetSkillLevels(190, 190, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Crimson Silk Belt -- 8772
	recipe = AddRecipe(8772, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7055)
	recipe:SetSkillLevels(175, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Green Silken Shoulders -- 8774
	recipe = AddRecipe(8774, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7057)
	recipe:SetSkillLevels(180, 180, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Linen Belt -- 8776
	recipe = AddRecipe(8776, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7026)
	recipe:SetSkillLevels(15, 15, 50, 67, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Hands of Darkness -- 8780
	recipe = AddRecipe(8780, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7092)
	recipe:SetCraftedItemID(7047)
	recipe:SetSkillLevels(145, 145, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Truefaith Gloves -- 8782
	recipe = AddRecipe(8782, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7091)
	recipe:SetCraftedItemID(7049)
	recipe:SetSkillLevels(150, 150, 170, 185, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Silk Armor -- 8784
	recipe = AddRecipe(8784, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7090)
	recipe:SetCraftedItemID(7065)
	recipe:SetSkillLevels(165, 165, 185, 200, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Azure Silk Cloak -- 8786
	recipe = AddRecipe(8786, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7089)
	recipe:SetCraftedItemID(7053)
	recipe:SetSkillLevels(175, 175, 195, 210, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddLimitedVendor(6574, 1, 6576, 1)

	-- Crimson Silk Cloak -- 8789
	recipe = AddRecipe(8789, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7087)
	recipe:SetCraftedItemID(7056)
	recipe:SetSkillLevels(180, 180, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddLimitedVendor(2670, 1)

	-- Crimson Silk Vest -- 8791
	recipe = AddRecipe(8791, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7058)
	recipe:SetSkillLevels(185, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Crimson Silk Shoulders -- 8793
	recipe = AddRecipe(8793, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7084)
	recipe:SetCraftedItemID(7059)
	recipe:SetSkillLevels(190, 190, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Azure Shoulders -- 8795
	recipe = AddRecipe(8795, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7085)
	recipe:SetCraftedItemID(7060)
	recipe:SetSkillLevels(190, 190, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Earthen Silk Belt -- 8797
	recipe = AddRecipe(8797, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7086)
	recipe:SetCraftedItemID(7061)
	recipe:SetSkillLevels(195, 195, 215, 230, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Crimson Silk Pantaloons -- 8799
	recipe = AddRecipe(8799, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7062)
	recipe:SetSkillLevels(195, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Crimson Silk Robe -- 8802
	recipe = AddRecipe(8802, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7088)
	recipe:SetCraftedItemID(7063)
	recipe:SetSkillLevels(205, 205, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(6568, 1)

	-- Crimson Silk Gloves -- 8804
	recipe = AddRecipe(8804, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7064)
	recipe:SetSkillLevels(210, 210, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Simple Linen Pants -- 12044
	recipe = AddRecipe(12044, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10045)
	recipe:SetSkillLevels(1, 1, 35, 47, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Simple Linen Boots -- 12045
	recipe = AddRecipe(12045, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10046)
	recipe:SetSkillLevels(20, 20, 50, 67, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Simple Kilt -- 12046
	recipe = AddRecipe(12046, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10047)
	recipe:SetSkillLevels(75, 75, 100, 117, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Colorful Kilt -- 12047
	recipe = AddRecipe(12047, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10316)
	recipe:SetCraftedItemID(10048)
	recipe:SetSkillLevels(120, 120, 145, 162, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Black Mageweave Vest -- 12048
	recipe = AddRecipe(12048, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9998)
	recipe:SetSkillLevels(205, 205, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Leggings -- 12049
	recipe = AddRecipe(12049, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9999)
	recipe:SetSkillLevels(205, 205, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Robe -- 12050
	recipe = AddRecipe(12050, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10001)
	recipe:SetSkillLevels(210, 210, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Shadoweave Pants -- 12052
	recipe = AddRecipe(12052, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10002)
	recipe:SetSkillLevels(210, 210, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 33580, 44783, 45559)

	-- Black Mageweave Gloves -- 12053
	recipe = AddRecipe(12053, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10003)
	recipe:SetSkillLevels(215, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Shadoweave Robe -- 12055
	recipe = AddRecipe(12055, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10004)
	recipe:SetSkillLevels(215, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 33580, 44783, 45559)

	-- Red Mageweave Vest -- 12056
	recipe = AddRecipe(12056, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10300)
	recipe:SetCraftedItemID(10007)
	recipe:SetSkillLevels(215, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- White Bandit Mask -- 12059
	recipe = AddRecipe(12059, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10301)
	recipe:SetCraftedItemID(10008)
	recipe:SetSkillLevels(215, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Red Mageweave Pants -- 12060
	recipe = AddRecipe(12060, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10302)
	recipe:SetCraftedItemID(10009)
	recipe:SetSkillLevels(215, 215, 230, 245, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Orange Mageweave Shirt -- 12061
	recipe = AddRecipe(12061, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10056)
	recipe:SetSkillLevels(215, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Orange Martial Shirt -- 12064
	recipe = AddRecipe(12064, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10311)
	recipe:SetCraftedItemID(10052)
	recipe:SetSkillLevels(220, 220, 225, 230, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3005, 1, 4168, 1)

	-- Mageweave Bag -- 12065
	recipe = AddRecipe(12065, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10050)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Mageweave Gloves -- 12066
	recipe = AddRecipe(12066, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10312)
	recipe:SetCraftedItemID(10018)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dreamweave Gloves -- 12067
	recipe = AddRecipe(12067, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10019)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Robe -- 12069
	recipe = AddRecipe(12069, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10042)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Dreamweave Vest -- 12070
	recipe = AddRecipe(12070, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10021)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Shadoweave Gloves -- 12071
	recipe = AddRecipe(12071, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10023)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 33580, 44783, 45559)

	-- Black Mageweave Headband -- 12072
	recipe = AddRecipe(12072, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10024)
	recipe:SetSkillLevels(230, 230, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Boots -- 12073
	recipe = AddRecipe(12073, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10026)
	recipe:SetSkillLevels(230, 230, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Black Mageweave Shoulders -- 12074
	recipe = AddRecipe(12074, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10027)
	recipe:SetSkillLevels(230, 230, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Lavender Mageweave Shirt -- 12075
	recipe = AddRecipe(12075, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10314)
	recipe:SetCraftedItemID(10054)
	recipe:SetSkillLevels(230, 230, 235, 240, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3364, 1, 8681, 1)

	-- Shadoweave Shoulders -- 12076
	recipe = AddRecipe(12076, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10028)
	recipe:SetSkillLevels(235, 235, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 33580, 44783, 45559)

	-- Simple Black Dress -- 12077
	recipe = AddRecipe(12077, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10053)
	recipe:SetSkillLevels(235, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Red Mageweave Shoulders -- 12078
	recipe = AddRecipe(12078, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10315)
	recipe:SetCraftedItemID(10029)
	recipe:SetSkillLevels(235, 235, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Red Mageweave Bag -- 12079
	recipe = AddRecipe(12079, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10051)
	recipe:SetSkillLevels(235, 235, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 44783, 45559)

	-- Pink Mageweave Shirt -- 12080
	recipe = AddRecipe(12080, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10317)
	recipe:SetCraftedItemID(10055)
	recipe:SetSkillLevels(235, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3364, 1, 8681, 1)

	-- Admiral's Hat -- 12081
	recipe = AddRecipe(12081, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10318)
	recipe:SetCraftedItemID(10030)
	recipe:SetSkillLevels(240, 240, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddLimitedVendor(2672, 1)

	-- Shadoweave Boots -- 12082
	recipe = AddRecipe(12082, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10031)
	recipe:SetSkillLevels(240, 240, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 4578, 9584, 33580, 44783, 45559)

	-- Red Mageweave Headband -- 12084
	recipe = AddRecipe(12084, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10320)
	recipe:SetCraftedItemID(10033)
	recipe:SetSkillLevels(240, 240, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tuxedo Shirt -- 12085
	recipe = AddRecipe(12085, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10321)
	recipe:SetCraftedItemID(10034)
	recipe:SetSkillLevels(240, 240, 245, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(4577, 8681)

	-- Shadoweave Mask -- 12086
	recipe = AddRecipe(12086, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10463)
	recipe:SetCraftedItemID(10025)
	recipe:SetSkillLevels(245, 245, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Cindercloth Boots -- 12088
	recipe = AddRecipe(12088, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10044)
	recipe:SetSkillLevels(245, 245, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Tuxedo Pants -- 12089
	recipe = AddRecipe(12089, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10323)
	recipe:SetCraftedItemID(10035)
	recipe:SetSkillLevels(245, 245, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(4577, 8681)

	-- White Wedding Dress -- 12091
	recipe = AddRecipe(12091, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10325)
	recipe:SetCraftedItemID(10040)
	recipe:SetSkillLevels(250, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddLimitedVendor(1347, 1, 3005, 1)

	-- Dreamweave Circlet -- 12092
	recipe = AddRecipe(12092, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10041)
	recipe:SetSkillLevels(250, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Tuxedo Jacket -- 12093
	recipe = AddRecipe(12093, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10326)
	recipe:SetCraftedItemID(10036)
	recipe:SetSkillLevels(250, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(4577, 8681)

	-- Bolt of Runecloth -- 18401
	recipe = AddRecipe(18401, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(14048)
	recipe:SetSkillLevels(250, 250, 255, 257, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Belt -- 18402
	recipe = AddRecipe(18402, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(13856)
	recipe:SetSkillLevels(255, 255, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Tunic -- 18403
	recipe = AddRecipe(18403, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14466)
	recipe:SetCraftedItemID(13869)
	recipe:SetSkillLevels(255, 255, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Robe -- 18404
	recipe = AddRecipe(18404, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14467)
	recipe:SetCraftedItemID(13868)
	recipe:SetSkillLevels(255, 255, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runecloth Bag -- 18405
	recipe = AddRecipe(18405, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14468)
	recipe:SetCraftedItemID(14046)
	recipe:SetSkillLevels(260, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11189)

	-- Runecloth Robe -- 18406
	recipe = AddRecipe(18406, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14469)
	recipe:SetCraftedItemID(13858)
	recipe:SetSkillLevels(260, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddLimitedVendor(7940, 1)

	-- Runecloth Tunic -- 18407
	recipe = AddRecipe(18407, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14470)
	recipe:SetCraftedItemID(13857)
	recipe:SetSkillLevels(260, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Vest -- 18408
	recipe = AddRecipe(18408, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14471)
	recipe:SetCraftedItemID(14042)
	recipe:SetSkillLevels(260, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(5861)

	-- Runecloth Cloak -- 18409
	recipe = AddRecipe(18409, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14472)
	recipe:SetCraftedItemID(13860)
	recipe:SetSkillLevels(265, 265, 280, 295, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddLimitedVendor(7940, 1)

	-- Ghostweave Belt -- 18410
	recipe = AddRecipe(18410, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14473)
	recipe:SetCraftedItemID(14143)
	recipe:SetSkillLevels(265, 265, 280, 295, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Gloves -- 18411
	recipe = AddRecipe(18411, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14474)
	recipe:SetCraftedItemID(13870)
	recipe:SetSkillLevels(265, 265, 280, 295, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Gloves -- 18412
	recipe = AddRecipe(18412, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14476)
	recipe:SetCraftedItemID(14043)
	recipe:SetSkillLevels(270, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(5861)

	-- Ghostweave Gloves -- 18413
	recipe = AddRecipe(18413, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14477)
	recipe:SetCraftedItemID(14142)
	recipe:SetSkillLevels(270, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Brightcloth Robe -- 18414
	recipe = AddRecipe(18414, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14478)
	recipe:SetCraftedItemID(14100)
	recipe:SetSkillLevels(270, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Brightcloth Gloves -- 18415
	recipe = AddRecipe(18415, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14479)
	recipe:SetCraftedItemID(14101)
	recipe:SetSkillLevels(270, 270, 285, 300, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Ghostweave Vest -- 18416
	recipe = AddRecipe(18416, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14480)
	recipe:SetCraftedItemID(14141)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Gloves -- 18417
	recipe = AddRecipe(18417, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14481)
	recipe:SetCraftedItemID(13863)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cindercloth Cloak -- 18418
	recipe = AddRecipe(18418, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14482)
	recipe:SetCraftedItemID(14044)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddMobDrop(7037)

	-- Felcloth Pants -- 18419
	recipe = AddRecipe(18419, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14483)
	recipe:SetCraftedItemID(14107)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(12022, 1)

	-- Brightcloth Cloak -- 18420
	recipe = AddRecipe(18420, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14484)
	recipe:SetCraftedItemID(14103)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Wizardweave Leggings -- 18421
	recipe = AddRecipe(18421, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14485)
	recipe:SetCraftedItemID(14132)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Cloak of Fire -- 18422
	recipe = AddRecipe(18422, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14486)
	recipe:SetCraftedItemID(14134)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddMobDrop(9026)

	-- Runecloth Boots -- 18423
	recipe = AddRecipe(18423, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14488)
	recipe:SetCraftedItemID(13864)
	recipe:SetSkillLevels(280, 280, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Frostweave Pants -- 18424
	recipe = AddRecipe(18424, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14489)
	recipe:SetCraftedItemID(13871)
	recipe:SetSkillLevels(280, 280, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Cindercloth Pants -- 18434
	recipe = AddRecipe(18434, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14490)
	recipe:SetCraftedItemID(14045)
	recipe:SetSkillLevels(280, 280, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(7037)

	-- Robe of Winter Night -- 18436
	recipe = AddRecipe(18436, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14493)
	recipe:SetCraftedItemID(14136)
	recipe:SetSkillLevels(285, 285, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Felcloth Boots -- 18437
	recipe = AddRecipe(18437, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14492)
	recipe:SetCraftedItemID(14108)
	recipe:SetSkillLevels(285, 285, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Pants -- 18438
	recipe = AddRecipe(18438, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14491)
	recipe:SetCraftedItemID(13865)
	recipe:SetSkillLevels(285, 285, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Brightcloth Pants -- 18439
	recipe = AddRecipe(18439, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14494)
	recipe:SetCraftedItemID(14104)
	recipe:SetSkillLevels(290, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mooncloth Leggings -- 18440
	recipe = AddRecipe(18440, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14497)
	recipe:SetCraftedItemID(14137)
	recipe:SetSkillLevels(290, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ghostweave Pants -- 18441
	recipe = AddRecipe(18441, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14495)
	recipe:SetCraftedItemID(14144)
	recipe:SetSkillLevels(290, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Felcloth Hood -- 18442
	recipe = AddRecipe(18442, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14496)
	recipe:SetCraftedItemID(14111)
	recipe:SetSkillLevels(290, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Runecloth Headband -- 18444
	recipe = AddRecipe(18444, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14498)
	recipe:SetCraftedItemID(13866)
	recipe:SetSkillLevels(295, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Mooncloth Bag -- 18445
	recipe = AddRecipe(18445, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14499)
	recipe:SetCraftedItemID(14155)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wizardweave Robe -- 18446
	recipe = AddRecipe(18446, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14500)
	recipe:SetCraftedItemID(14128)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Mooncloth Vest -- 18447
	recipe = AddRecipe(18447, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14501)
	recipe:SetCraftedItemID(14138)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mooncloth Shoulders -- 18448
	recipe = AddRecipe(18448, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14507)
	recipe:SetCraftedItemID(14139)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runecloth Shoulders -- 18449
	recipe = AddRecipe(18449, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14504)
	recipe:SetCraftedItemID(13867)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wizardweave Turban -- 18450
	recipe = AddRecipe(18450, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14505)
	recipe:SetCraftedItemID(14130)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Felcloth Robe -- 18451
	recipe = AddRecipe(18451, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14506)
	recipe:SetCraftedItemID(14106)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mooncloth Circlet -- 18452
	recipe = AddRecipe(18452, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14509)
	recipe:SetCraftedItemID(14140)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Felcloth Shoulders -- 18453
	recipe = AddRecipe(18453, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14508)
	recipe:SetCraftedItemID(14112)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gloves of Spell Mastery -- 18454
	recipe = AddRecipe(18454, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(14511)
	recipe:SetCraftedItemID(14146)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Bottomless Bag -- 18455
	recipe = AddRecipe(18455, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(14510)
	recipe:SetCraftedItemID(14156)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Truefaith Vestments -- 18456
	recipe = AddRecipe(18456, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(14512)
	recipe:SetCraftedItemID(14154)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.PRIEST, F.CLOTH)
	recipe:AddMobDrop(10813)

	-- Robe of the Archmage -- 18457
	recipe = AddRecipe(18457, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(14513)
	recipe:SetCraftedItemID(14152)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(9264)

	-- Robe of the Void -- 18458
	recipe = AddRecipe(18458, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(14514)
	recipe:SetCraftedItemID(14153)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(1853)

	-- Mooncloth -- 18560
	recipe = AddRecipe(18560, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14526)
	recipe:SetCraftedItemID(14342)
	recipe:SetSkillLevels(250, 250, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(11189)

	-- Mooncloth Boots -- 19435
	recipe = AddRecipe(19435, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15802)
	recipe:SetSkillLevels(290, 290, 295, 310, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(6032)

	-- Flarecore Mantle -- 20848
	recipe = AddRecipe(20848, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17017)
	recipe:SetCraftedItemID(16980)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Flarecore Gloves -- 20849
	recipe = AddRecipe(20849, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17018)
	recipe:SetCraftedItemID(16979)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAGE, F.PRIEST, F.WARLOCK, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Green Holiday Shirt -- 21945
	recipe = AddRecipe(21945, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17724)
	recipe:SetCraftedItemID(17723)
	recipe:SetSkillLevels(190, 190, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason("WINTER_VEIL")

	-- Flarecore Wraps -- 22759
	recipe = AddRecipe(22759, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18265)
	recipe:SetCraftedItemID(18263)
	recipe:SetSkillLevels(300, 300, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("MC_RANDOM")

	-- Gordok Ogre Suit -- 22813
	recipe = AddRecipe(22813, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18258)
	recipe:SetSkillLevels(275, 275, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(5518)

	-- Belt of the Archmage -- 22866
	recipe = AddRecipe(22866, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(18414)
	recipe:SetCraftedItemID(18405)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("DM_CACHE")

	-- Felcloth Gloves -- 22867
	recipe = AddRecipe(22867, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18415)
	recipe:SetCraftedItemID(18407)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("DM_CACHE")

	-- Inferno Gloves -- 22868
	recipe = AddRecipe(22868, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18416)
	recipe:SetCraftedItemID(18408)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("DM_CACHE")

	-- Mooncloth Gloves -- 22869
	recipe = AddRecipe(22869, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18417)
	recipe:SetCraftedItemID(18409)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("DM_CACHE")

	-- Cloak of Warding -- 22870
	recipe = AddRecipe(22870, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18418)
	recipe:SetCraftedItemID(18413)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddCustom("DM_CACHE")

	-- Mooncloth Robe -- 22902
	recipe = AddRecipe(22902, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18487)
	recipe:SetCraftedItemID(18486)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(14371, 1)

	-- Wisdom of the Timbermaw -- 23662
	recipe = AddRecipe(23662, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19215)
	recipe:SetCraftedItemID(19047)
	recipe:SetSkillLevels(290, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.TIMBERMAW_HOLD, F.CLOTH)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Mantle of the Timbermaw -- 23663
	recipe = AddRecipe(23663, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19218)
	recipe:SetCraftedItemID(19050)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.TIMBERMAW_HOLD, F.CLOTH)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.REVERED, 11557)

	-- Argent Boots -- 23664
	recipe = AddRecipe(23664, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19216)
	recipe:SetCraftedItemID(19056)
	recipe:SetSkillLevels(290, 290, 305, 320, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN, F.CLOTH)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Argent Shoulders -- 23665
	recipe = AddRecipe(23665, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19217)
	recipe:SetCraftedItemID(19059)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN, F.CLOTH)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Flarecore Robe -- 23666
	recipe = AddRecipe(23666, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19219)
	recipe:SetCraftedItemID(19156)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Flarecore Leggings -- 23667
	recipe = AddRecipe(23667, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19220)
	recipe:SetCraftedItemID(19165)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.CLOTH)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Bloodvine Vest -- 24091
	recipe = AddRecipe(24091, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19764)
	recipe:SetCraftedItemID(19682)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bloodvine Leggings -- 24092
	recipe = AddRecipe(24092, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19765)
	recipe:SetCraftedItemID(19683)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bloodvine Boots -- 24093
	recipe = AddRecipe(24093, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19766)
	recipe:SetCraftedItemID(19684)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Runed Stygian Leggings -- 24901
	recipe = AddRecipe(24901, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20546)
	recipe:SetCraftedItemID(20538)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(8323)

	-- Runed Stygian Belt -- 24902
	recipe = AddRecipe(24902, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20548)
	recipe:SetCraftedItemID(20539)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(8323)

	-- Runed Stygian Boots -- 24903
	recipe = AddRecipe(24903, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20547)
	recipe:SetCraftedItemID(20537)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddQuest(8323)

	-- Soul Pouch -- 26085
	recipe = AddRecipe(26085, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(21358)
	recipe:SetCraftedItemID(21340)
	recipe:SetSkillLevels(260, 260, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.WARLOCK)
	recipe:AddVendor(6568)

	-- Felcloth Bag -- 26086
	recipe = AddRecipe(26086, V.ORIG, Q.RARE)
	recipe:SetCraftedItemID(21341)
	recipe:SetSkillLevels(280, 280, 300, 315, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddMobDrop(10503)
	recipe:AddCustom("SCHOLO_BOOK_SPAWN")

	-- Core Felcloth Bag -- 26087
	recipe = AddRecipe(26087, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(21371)
	recipe:SetCraftedItemID(21342)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.WARLOCK)
	recipe:AddCustom("MC_RANDOM")

	-- Festival Dress -- 26403
	recipe = AddRecipe(26403, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(44916)
	recipe:SetCraftedItemID(21154)
	recipe:SetSkillLevels(250, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Festival Suit -- 26407
	recipe = AddRecipe(26407, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(44917)
	recipe:SetCraftedItemID(21542)
	recipe:SetSkillLevels(250, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Bolt of Netherweave -- 26745
	recipe = AddRecipe(26745, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21840)
	recipe:SetSkillLevels(300, 300, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Bag -- 26746
	recipe = AddRecipe(26746, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21841)
	recipe:SetSkillLevels(315, 315, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Bolt of Imbued Netherweave -- 26747
	recipe = AddRecipe(26747, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21892)
	recipe:SetCraftedItemID(21842)
	recipe:SetSkillLevels(325, 325, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16638, 16767, 19213)

	-- Imbued Netherweave Bag -- 26749
	recipe = AddRecipe(26749, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21893)
	recipe:SetCraftedItemID(21843)
	recipe:SetSkillLevels(340, 340, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(19015, 19213)

	-- Bolt of Soulcloth -- 26750
	recipe = AddRecipe(26750, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21894)
	recipe:SetCraftedItemID(21844)
	recipe:SetSkillLevels(345, 345, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddLimitedVendor(16638, 1, 16767, 1, 19015, 1, 19017, 1)

	-- Primal Mooncloth -- 26751
	recipe = AddRecipe(26751, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21895)
	recipe:SetCraftedItemID(21845)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Spellfire Belt -- 26752
	recipe = AddRecipe(26752, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21908)
	recipe:SetCraftedItemID(21846)
	recipe:SetSkillLevels(355, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Spellfire Gloves -- 26753
	recipe = AddRecipe(26753, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21909)
	recipe:SetCraftedItemID(21847)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Spellfire Robe -- 26754
	recipe = AddRecipe(26754, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21910)
	recipe:SetCraftedItemID(21848)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Spellfire Bag -- 26755
	recipe = AddRecipe(26755, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(21911)
	recipe:SetCraftedItemID(21858)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(20134, 20135)
	recipe:AddVendor(22213, 29511)

	-- Frozen Shadoweave Shoulders -- 26756
	recipe = AddRecipe(26756, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21912)
	recipe:SetCraftedItemID(21869)
	recipe:SetSkillLevels(355, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Frozen Shadoweave Boots -- 26757
	recipe = AddRecipe(26757, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21914)
	recipe:SetCraftedItemID(21870)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Frozen Shadoweave Robe -- 26758
	recipe = AddRecipe(26758, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21913)
	recipe:SetCraftedItemID(21871)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Ebon Shadowbag -- 26759
	recipe = AddRecipe(26759, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(21915)
	recipe:SetCraftedItemID(21872)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddVendor(22212, 29510)

	-- Primal Mooncloth Belt -- 26760
	recipe = AddRecipe(26760, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21916)
	recipe:SetCraftedItemID(21873)
	recipe:SetSkillLevels(355, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Primal Mooncloth Shoulders -- 26761
	recipe = AddRecipe(26761, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21918)
	recipe:SetCraftedItemID(21874)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Primal Mooncloth Robe -- 26762
	recipe = AddRecipe(26762, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21917)
	recipe:SetCraftedItemID(21875)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(22208, 29512)

	-- Primal Mooncloth Bag -- 26763
	recipe = AddRecipe(26763, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(21919)
	recipe:SetCraftedItemID(21876)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18872)
	recipe:AddVendor(22208, 29512)

	-- Netherweave Bracers -- 26764
	recipe = AddRecipe(26764, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21849)
	recipe:SetSkillLevels(310, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Belt -- 26765
	recipe = AddRecipe(26765, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21850)
	recipe:SetSkillLevels(310, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Gloves -- 26770
	recipe = AddRecipe(26770, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21851)
	recipe:SetSkillLevels(320, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Pants -- 26771
	recipe = AddRecipe(26771, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21852)
	recipe:SetSkillLevels(325, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Boots -- 26772
	recipe = AddRecipe(26772, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21853)
	recipe:SetSkillLevels(335, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Netherweave Robe -- 26773
	recipe = AddRecipe(26773, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21896)
	recipe:SetCraftedItemID(21854)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(16638, 16767, 19213)

	-- Netherweave Tunic -- 26774
	recipe = AddRecipe(26774, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21897)
	recipe:SetCraftedItemID(21855)
	recipe:SetSkillLevels(345, 345, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddVendor(16638, 16767, 19213)

	-- Imbued Netherweave Pants -- 26775
	recipe = AddRecipe(26775, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21898)
	recipe:SetCraftedItemID(21859)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(18011, 1, 19722, 1)

	-- Imbued Netherweave Boots -- 26776
	recipe = AddRecipe(26776, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21899)
	recipe:SetCraftedItemID(21860)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(18011, 1, 19722, 1)

	-- Imbued Netherweave Robe -- 26777
	recipe = AddRecipe(26777, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21900)
	recipe:SetCraftedItemID(21861)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(19521, 1)

	-- Imbued Netherweave Tunic -- 26778
	recipe = AddRecipe(26778, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21901)
	recipe:SetCraftedItemID(21862)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(19521, 1)

	-- Soulcloth Gloves -- 26779
	recipe = AddRecipe(26779, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21902)
	recipe:SetCraftedItemID(21863)
	recipe:SetSkillLevels(355, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(19015, 1, 19017, 1)

	-- Soulcloth Shoulders -- 26780
	recipe = AddRecipe(26780, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(21903)
	recipe:SetCraftedItemID(21864)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(16406)

	-- Soulcloth Vest -- 26781
	recipe = AddRecipe(26781, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(21904)
	recipe:SetCraftedItemID(21865)
	recipe:SetSkillLevels(375, 375, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(16408)

	-- Arcanoweave Bracers -- 26782
	recipe = AddRecipe(26782, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21905)
	recipe:SetCraftedItemID(21866)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddMobDrop(20869)

	-- Arcanoweave Boots -- 26783
	recipe = AddRecipe(26783, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21906)
	recipe:SetCraftedItemID(21867)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddMobDrop(19168)

	-- Arcanoweave Robe -- 26784
	recipe = AddRecipe(26784, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21907)
	recipe:SetCraftedItemID(21868)
	recipe:SetSkillLevels(370, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(19220)

	-- Enchanted Mageweave Pouch -- 27658
	recipe = AddRecipe(27658, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22307)
	recipe:SetCraftedItemID(22246)
	recipe:SetSkillLevels(225, 225, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Enchanted Runecloth Bag -- 27659
	recipe = AddRecipe(27659, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22308)
	recipe:SetCraftedItemID(22248)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(15419)

	-- Big Bag of Enchantment -- 27660
	recipe = AddRecipe(27660, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(22309)
	recipe:SetCraftedItemID(22249)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(11487)

	-- Cenarion Herb Bag -- 27724
	recipe = AddRecipe(27724, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22310)
	recipe:SetCraftedItemID(22251)
	recipe:SetSkillLevels(275, 275, 290, 305, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15179)

	-- Satchel of Cenarius -- 27725
	recipe = AddRecipe(27725, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22312)
	recipe:SetCraftedItemID(22252)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15179)

	-- Glacial Gloves -- 28205
	recipe = AddRecipe(28205, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22654)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("Custom41")

	-- Glacial Vest -- 28207
	recipe = AddRecipe(28207, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22652)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("Custom41")

	-- Glacial Cloak -- 28208
	recipe = AddRecipe(28208, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22658)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom("Custom41")

	-- Glacial Wrists -- 28209
	recipe = AddRecipe(28209, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22655)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("Custom41")

	-- Gaea's Embrace -- 28210
	recipe = AddRecipe(28210, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22683)
	recipe:SetCraftedItemID(22660)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15179)

	-- Sylvan Vest -- 28480
	recipe = AddRecipe(28480, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22774)
	recipe:SetCraftedItemID(22756)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.CLOTH)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15179)

	-- Sylvan Crown -- 28481
	recipe = AddRecipe(28481, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22773)
	recipe:SetCraftedItemID(22757)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.CLOTH)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15179)

	-- Sylvan Shoulders -- 28482
	recipe = AddRecipe(28482, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22772)
	recipe:SetCraftedItemID(22758)
	recipe:SetSkillLevels(300, 300, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.CLOTH)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15179)

	-- Spellcloth -- 31373
	recipe = AddRecipe(31373, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24316)
	recipe:SetCraftedItemID(24271)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(22213, 29511)

	-- Mystic Spellthread -- 31430
	recipe = AddRecipe(31430, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24292)
	recipe:SetCraftedItemID(24273)
	recipe:SetSkillLevels(335, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Silver Spellthread -- 31431
	recipe = AddRecipe(31431, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24293)
	recipe:SetCraftedItemID(24275)
	recipe:SetSkillLevels(335, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Runic Spellthread -- 31432
	recipe = AddRecipe(31432, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24294)
	recipe:SetCraftedItemID(24274)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Golden Spellthread -- 31433
	recipe = AddRecipe(31433, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24295)
	recipe:SetCraftedItemID(24276)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Unyielding Bracers -- 31434
	recipe = AddRecipe(31434, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35308)
	recipe:SetCraftedItemID(24249)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddMobDrop(24664)

	-- Bracers of Havok -- 31435
	recipe = AddRecipe(31435, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24297)
	recipe:SetCraftedItemID(24250)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Blackstrike Bracers -- 31437
	recipe = AddRecipe(31437, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24298)
	recipe:SetCraftedItemID(24251)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Cloak of the Black Void -- 31438
	recipe = AddRecipe(31438, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24299)
	recipe:SetCraftedItemID(24252)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Cloak of Eternity -- 31440
	recipe = AddRecipe(31440, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24300)
	recipe:SetCraftedItemID(24253)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- White Remedy Cape -- 31441
	recipe = AddRecipe(31441, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24301)
	recipe:SetCraftedItemID(24254)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Unyielding Girdle -- 31442
	recipe = AddRecipe(31442, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35309)
	recipe:SetCraftedItemID(24255)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(24664)

	-- Girdle of Ruination -- 31443
	recipe = AddRecipe(31443, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24303)
	recipe:SetCraftedItemID(24256)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Black Belt of Knowledge -- 31444
	recipe = AddRecipe(31444, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24304)
	recipe:SetCraftedItemID(24257)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Resolute Cape -- 31448
	recipe = AddRecipe(31448, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24305)
	recipe:SetCraftedItemID(24258)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Vengeance Wrap -- 31449
	recipe = AddRecipe(31449, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24306)
	recipe:SetCraftedItemID(24259)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Manaweave Cloak -- 31450
	recipe = AddRecipe(31450, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24307)
	recipe:SetCraftedItemID(24260)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Whitemend Pants -- 31451
	recipe = AddRecipe(31451, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24308)
	recipe:SetCraftedItemID(24261)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(20885)

	-- Spellstrike Pants -- 31452
	recipe = AddRecipe(31452, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24309)
	recipe:SetCraftedItemID(24262)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(18708)

	-- Battlecast Pants -- 31453
	recipe = AddRecipe(31453, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24310)
	recipe:SetCraftedItemID(24263)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(17978)

	-- Whitemend Hood -- 31454
	recipe = AddRecipe(31454, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24311)
	recipe:SetCraftedItemID(24264)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(17977)

	-- Spellstrike Hood -- 31455
	recipe = AddRecipe(31455, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24312)
	recipe:SetCraftedItemID(24266)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(16807)

	-- Battlecast Hood -- 31456
	recipe = AddRecipe(31456, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24313)
	recipe:SetCraftedItemID(24267)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(17798)

	-- Bag of Jewels -- 31459
	recipe = AddRecipe(31459, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24314)
	recipe:SetCraftedItemID(24270)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Netherweave Net -- 31460
	recipe = AddRecipe(31460, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(24268)
	recipe:SetSkillLevels(300, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 18749, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Belt of Blasting -- 36315
	recipe = AddRecipe(36315, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30280)
	recipe:SetCraftedItemID(30038)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Belt of the Long Road -- 36316
	recipe = AddRecipe(36316, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30281)
	recipe:SetCraftedItemID(30036)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of Blasting -- 36317
	recipe = AddRecipe(36317, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30282)
	recipe:SetCraftedItemID(30037)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of the Long Road -- 36318
	recipe = AddRecipe(36318, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30283)
	recipe:SetCraftedItemID(30035)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Shadowcloth -- 36686
	recipe = AddRecipe(36686, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30483)
	recipe:SetCraftedItemID(24272)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(22212, 29510)

	-- Cloak of Arcane Evasion -- 37873
	recipe = AddRecipe(37873, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30833)
	recipe:SetCraftedItemID(30831)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LOWERCITY, F.CLOAK)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.HONORED, 21655)

	-- Flameheart Bracers -- 37882
	recipe = AddRecipe(37882, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30842)
	recipe:SetCraftedItemID(30837)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR, F.CLOTH)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Flameheart Gloves -- 37883
	recipe = AddRecipe(37883, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30843)
	recipe:SetCraftedItemID(30838)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR, F.CLOTH)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Flameheart Vest -- 37884
	recipe = AddRecipe(37884, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30844)
	recipe:SetCraftedItemID(30839)
	recipe:SetSkillLevels(370, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR, F.CLOTH)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Soulguard Slippers -- 40020
	recipe = AddRecipe(40020, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32437)
	recipe:SetCraftedItemID(32391)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Soulguard Bracers -- 40021
	recipe = AddRecipe(40021, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32438)
	recipe:SetCraftedItemID(32392)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Soulguard Leggings -- 40023
	recipe = AddRecipe(40023, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32439)
	recipe:SetCraftedItemID(32389)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Soulguard Girdle -- 40024
	recipe = AddRecipe(40024, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32440)
	recipe:SetCraftedItemID(32390)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Night's End -- 40060
	recipe = AddRecipe(40060, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32447)
	recipe:SetCraftedItemID(32420)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.CLOAK)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Bracers of Nimble Thought -- 41205
	recipe = AddRecipe(41205, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32754)
	recipe:SetCraftedItemID(32586)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("BT_RANDOM")

	-- Mantle of Nimble Thought -- 41206
	recipe = AddRecipe(41206, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32755)
	recipe:SetCraftedItemID(32587)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Swiftheal Wraps -- 41207
	recipe = AddRecipe(41207, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32752)
	recipe:SetCraftedItemID(32584)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Swiftheal Mantle -- 41208
	recipe = AddRecipe(41208, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32753)
	recipe:SetCraftedItemID(32585)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("BT_RANDOM")

	-- Green Winter Clothes -- 44950
	recipe = AddRecipe(44950, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(34261)
	recipe:SetCraftedItemID(34087)
	recipe:SetSkillLevels(250, 250, 250, 250, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(13420)
	recipe:AddSeason("WINTER_VEIL")

	-- Red Winter Clothes -- 44958
	recipe = AddRecipe(44958, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(34319)
	recipe:SetCraftedItemID(34085)
	recipe:SetSkillLevels(250, 250, 250, 250, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(13433)
	recipe:AddSeason("WINTER_VEIL")

	-- Sunfire Handwraps -- 46128
	recipe = AddRecipe(46128, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35204)
	recipe:SetCraftedItemID(34366)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hands of Eternal Light -- 46129
	recipe = AddRecipe(46129, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35205)
	recipe:SetCraftedItemID(34367)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Sunfire Robe -- 46130
	recipe = AddRecipe(46130, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35206)
	recipe:SetCraftedItemID(34364)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Robe of Eternal Light -- 46131
	recipe = AddRecipe(46131, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35207)
	recipe:SetCraftedItemID(34365)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Dress Shoes -- 49677
	recipe = AddRecipe(49677, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(37915)
	recipe:SetCraftedItemID(6836)
	recipe:SetSkillLevels(250, 250, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(15165)

	-- Mycah's Botanical Bag -- 50194
	recipe = AddRecipe(50194, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(38229)
	recipe:SetCraftedItemID(38225)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.REVERED, 18382)

	-- Haliscan Jacket -- 50644
	recipe = AddRecipe(50644, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(38327)
	recipe:SetCraftedItemID(38277)
	recipe:SetSkillLevels(250, 250, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(15165)

	-- Haliscan Pantaloons -- 50647
	recipe = AddRecipe(50647, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(38328)
	recipe:SetCraftedItemID(38278)
	recipe:SetSkillLevels(245, 245, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(15165)

	-- Lightweave Embroidery -- 55642
	recipe = AddRecipe(55642, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 420, 420, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Darkglow Embroidery -- 55769
	recipe = AddRecipe(55769, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 420, 420, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Swordguard Embroidery -- 55777
	recipe = AddRecipe(55777, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 420, 420, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostweave Net -- 55898
	recipe = AddRecipe(55898, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41509)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Bolt of Frostweave -- 55899
	recipe = AddRecipe(55899, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41510)
	recipe:SetSkillLevels(350, 350, 370, 372, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Bolt of Imbued Frostweave -- 55900
	recipe = AddRecipe(55900, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41511)
	recipe:SetSkillLevels(400, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Leggings -- 55901
	recipe = AddRecipe(55901, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41548)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Shoulders -- 55902
	recipe = AddRecipe(55902, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41513)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Robe -- 55903
	recipe = AddRecipe(55903, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41515)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Gloves -- 55904
	recipe = AddRecipe(55904, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44211)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Boots -- 55906
	recipe = AddRecipe(55906, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41520)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Cowl -- 55907
	recipe = AddRecipe(55907, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41521)
	recipe:SetSkillLevels(380, 380, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Belt -- 55908
	recipe = AddRecipe(55908, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41522)
	recipe:SetSkillLevels(370, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Mystic Frostwoven Shoulders -- 55910
	recipe = AddRecipe(55910, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41523)
	recipe:SetSkillLevels(385, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Mystic Frostwoven Robe -- 55911
	recipe = AddRecipe(55911, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41525)
	recipe:SetSkillLevels(390, 390, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Mystic Frostwoven Wristwraps -- 55913
	recipe = AddRecipe(55913, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41528)
	recipe:SetSkillLevels(385, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Belt -- 55914
	recipe = AddRecipe(55914, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41543)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Cowl -- 55919
	recipe = AddRecipe(55919, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41546)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Wristwraps -- 55920
	recipe = AddRecipe(55920, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41551)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Robe -- 55921
	recipe = AddRecipe(55921, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41549)
	recipe:SetSkillLevels(405, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Gloves -- 55922
	recipe = AddRecipe(55922, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41545)
	recipe:SetSkillLevels(405, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Shoulders -- 55923
	recipe = AddRecipe(55923, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41550)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Duskweave Boots -- 55924
	recipe = AddRecipe(55924, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41544)
	recipe:SetSkillLevels(410, 410, 410, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Black Duskweave Leggings -- 55925
	recipe = AddRecipe(55925, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41553)
	recipe:SetSkillLevels(415, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Black Duskweave Robe -- 55941
	recipe = AddRecipe(55941, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41554)
	recipe:SetSkillLevels(420, 420, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Black Duskweave Wristwraps -- 55943
	recipe = AddRecipe(55943, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41555)
	recipe:SetSkillLevels(415, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Red Lumberjack Shirt -- 55993
	recipe = AddRecipe(55993, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(42172)
	recipe:SetCraftedItemID(41248)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Blue Lumberjack Shirt -- 55994
	recipe = AddRecipe(55994, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(42173)
	recipe:SetCraftedItemID(41249)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Yellow Lumberjack Shirt -- 55995
	recipe = AddRecipe(55995, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41251)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Green Lumberjack Shirt -- 55996
	recipe = AddRecipe(55996, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(42175)
	recipe:SetCraftedItemID(41250)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Red Workman's Shirt -- 55997
	recipe = AddRecipe(55997, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(42177)
	recipe:SetCraftedItemID(41252)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Blue Workman's Shirt -- 55998
	recipe = AddRecipe(55998, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(42176)
	recipe:SetCraftedItemID(41253)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Rustic Workman's Shirt -- 55999
	recipe = AddRecipe(55999, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(42178)
	recipe:SetCraftedItemID(41254)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Green Workman's Shirt -- 56000
	recipe = AddRecipe(56000, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41255)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Moonshroud -- 56001
	recipe = AddRecipe(56001, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41594)
	recipe:SetSkillLevels(415, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Ebonweave -- 56002
	recipe = AddRecipe(56002, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41593)
	recipe:SetSkillLevels(415, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Spellweave -- 56003
	recipe = AddRecipe(56003, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41595)
	recipe:SetSkillLevels(415, 415, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Abyssal Bag -- 56004
	recipe = AddRecipe(56004, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(42183)
	recipe:SetCraftedItemID(41597)
	recipe:SetSkillLevels(435, 435, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WARLOCK, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.REVERED, 32538)

	-- Glacial Bag -- 56005
	recipe = AddRecipe(56005, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(42184)
	recipe:SetCraftedItemID(41600)
	recipe:SetSkillLevels(445, 445, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.EXALTED, 32540)

	-- Mysterious Bag -- 56006
	recipe = AddRecipe(56006, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(42185)
	recipe:SetCraftedItemID(41598)
	recipe:SetSkillLevels(440, 440, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WYRMREST)
	recipe:AddRepVendor(FAC.WYRMREST, REP.REVERED, 32533)

	-- Frostweave Bag -- 56007
	recipe = AddRecipe(56007, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41599)
	recipe:SetSkillLevels(410, 410, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Shining Spellthread -- 56008
	recipe = AddRecipe(56008, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41601)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Brilliant Spellthread -- 56009
	recipe = AddRecipe(56009, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(42187)
	recipe:SetCraftedItemID(41602)
	recipe:SetSkillLevels(430, 430, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTCRUSADE)
	recipe:AddRepVendor(FAC.ARGENTCRUSADE, REP.EXALTED, 30431)

	-- Azure Spellthread -- 56010
	recipe = AddRecipe(56010, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41603)
	recipe:SetSkillLevels(400, 400, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Sapphire Spellthread -- 56011
	recipe = AddRecipe(56011, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(42188)
	recipe:SetCraftedItemID(41604)
	recipe:SetSkillLevels(430, 430, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KIRINTOR)
	recipe:AddRepVendor(FAC.KIRINTOR, REP.EXALTED, 32287)

	-- Cloak of the Moon -- 56014
	recipe = AddRecipe(56014, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41607)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Cloak of Frozen Spirits -- 56015
	recipe = AddRecipe(56015, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41608)
	recipe:SetSkillLevels(395, 395, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Wispcloak -- 56016
	recipe = AddRecipe(56016, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41609)
	recipe:SetSkillLevels(420, 420, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(26914, 28699)
	recipe:AddCustom("Custom45")

	-- Deathchill Cloak -- 56017
	recipe = AddRecipe(56017, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41610)
	recipe:SetSkillLevels(420, 420, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(26914, 28699)
	recipe:AddCustom("Custom44")

	-- Hat of Wintry Doom -- 56018
	recipe = AddRecipe(56018, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41984)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Silky Iceshard Boots -- 56019
	recipe = AddRecipe(56019, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41985)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Deep Frozen Cord -- 56020
	recipe = AddRecipe(56020, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41986)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostmoon Pants -- 56021
	recipe = AddRecipe(56021, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42093)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Light Blessed Mittens -- 56022
	recipe = AddRecipe(56022, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42095)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Aurora Slippers -- 56023
	recipe = AddRecipe(56023, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42096)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Moonshroud Robe -- 56024
	recipe = AddRecipe(56024, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42100)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Moonshroud Gloves -- 56025
	recipe = AddRecipe(56025, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42103)
	recipe:SetSkillLevels(435, 435, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Ebonweave Robe -- 56026
	recipe = AddRecipe(56026, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42101)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Ebonweave Gloves -- 56027
	recipe = AddRecipe(56027, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42111)
	recipe:SetSkillLevels(435, 435, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Spellweave Robe -- 56028
	recipe = AddRecipe(56028, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42102)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Spellweave Gloves -- 56029
	recipe = AddRecipe(56029, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42113)
	recipe:SetSkillLevels(435, 435, 445, 450, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Leggings -- 56030
	recipe = AddRecipe(56030, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41519)
	recipe:SetSkillLevels(380, 380, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostwoven Wristwraps -- 56031
	recipe = AddRecipe(56031, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41512)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Master's Spellthread -- 56034
	recipe = AddRecipe(56034, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 405, 405, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Sanctified Spellthread -- 56039
	recipe = AddRecipe(56039, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 405, 405, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Belt -- 59582
	recipe = AddRecipe(59582, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43969)
	recipe:SetSkillLevels(415, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Bracers -- 59583
	recipe = AddRecipe(59583, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43974)
	recipe:SetSkillLevels(415, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Shoulders -- 59584
	recipe = AddRecipe(59584, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43973)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Boots -- 59585
	recipe = AddRecipe(59585, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43970)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Gloves -- 59586
	recipe = AddRecipe(59586, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41516)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Robe -- 59587
	recipe = AddRecipe(59587, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43972)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Leggings -- 59588
	recipe = AddRecipe(59588, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43975)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Frostsavage Cowl -- 59589
	recipe = AddRecipe(59589, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43971)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Flying Carpet -- 60969
	recipe = AddRecipe(60969, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44554)
	recipe:SetSkillLevels(300, 300, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Magnificent Flying Carpet -- 60971
	recipe = AddRecipe(60971, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44558)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Glacial Waistband -- 60990
	recipe = AddRecipe(60990, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43584)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Glacial Robe -- 60993
	recipe = AddRecipe(60993, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43583)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Glacial Slippers -- 60994
	recipe = AddRecipe(60994, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43585)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Sash of Ancient Power -- 63203
	recipe = AddRecipe(63203, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45102)
	recipe:SetCraftedItemID(45102)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Spellslinger's Slippers -- 63204
	recipe = AddRecipe(63204, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45103)
	recipe:SetCraftedItemID(45566)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Cord of the White Dawn -- 63205
	recipe = AddRecipe(63205, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45104)
	recipe:SetCraftedItemID(45104)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Savior's Slippers -- 63206
	recipe = AddRecipe(63206, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45105)
	recipe:SetCraftedItemID(45567)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Spidersilk Drape -- 63742
	recipe = AddRecipe(63742, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45626)
	recipe:SetSkillLevels(125, 125, 150, 167, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1103, 1346, 2399, 2627, 3004, 3363, 3484, 3523, 3704, 4159, 4193, 4576, 5153, 11052, 11557, 16366, 16640, 16729, 17487, 18772, 26914, 26964, 26969, 27001, 28699, 33580, 33613, 33636, 33684, 44783, 45559)

	-- Emerald Bag -- 63924
	recipe = AddRecipe(63924, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(45774)
	recipe:SetCraftedItemID(45773)
	recipe:SetSkillLevels(435, 435, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.REVERED, 31916, 32763)

	-- Frostguard Drape -- 64729
	recipe = AddRecipe(64729, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45811)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Cloak of Crimson Snow -- 64730
	recipe = AddRecipe(64730, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45810)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3363, 26914, 26964, 26969, 27001, 28699, 33580, 44783, 45559)

	-- Royal Moonshroud Robe -- 67064
	recipe = AddRecipe(67064, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47605)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Royal Moonshroud Bracers -- 67065
	recipe = AddRecipe(67065, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47587)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Merlin's Robe -- 67066
	recipe = AddRecipe(67066, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47603)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Bejeweled Wizard's Bracers -- 67079
	recipe = AddRecipe(67079, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47585)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Royal Moonshroud Robe -- 67144
	recipe = AddRecipe(67144, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47636)
	recipe:SetCraftedItemID(47606)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Bejeweled Wizard's Bracers -- 67145
	recipe = AddRecipe(67145, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47639)
	recipe:SetCraftedItemID(47586)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Merlin's Robe -- 67146
	recipe = AddRecipe(67146, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47638)
	recipe:SetCraftedItemID(47604)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Royal Moonshroud Bracers -- 67147
	recipe = AddRecipe(67147, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47637)
	recipe:SetCraftedItemID(47588)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("TOC25_RANDOM")

	-- Leggings of Woven Death -- 70550
	recipe = AddRecipe(70550, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49953)
	recipe:SetCraftedItemID(49891)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Deathfrost Boots -- 70551
	recipe = AddRecipe(70551, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49954)
	recipe:SetCraftedItemID(49890)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Lightweave Leggings -- 70552
	recipe = AddRecipe(70552, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49955)
	recipe:SetCraftedItemID(49892)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Sandals of Consecration -- 70553
	recipe = AddRecipe(70553, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49956)
	recipe:SetCraftedItemID(49893)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.CLOTH)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Bolt of Embersilk Cloth -- 74964
	recipe = AddRecipe(74964, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(53643)
	recipe:SetSkillLevels(425, 425, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Dream of Skywall -- 75141
	recipe = AddRecipe(75141, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54440)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Dream of Deepholm -- 75142
	recipe = AddRecipe(75142, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54440)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Dream of Hyjal -- 75144
	recipe = AddRecipe(75144, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54440)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Dream of Ragnaros -- 75145
	recipe = AddRecipe(75145, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54440)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Dream of Azshara -- 75146
	recipe = AddRecipe(75146, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54440)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Master's Spellthread -- 75154
	recipe = AddRecipe(75154, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Sanctified Spellthread -- 75155
	recipe = AddRecipe(75155, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Lightweave Embroidery -- 75172
	recipe = AddRecipe(75172, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Darkglow Embroidery -- 75175
	recipe = AddRecipe(75175, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Swordguard Embroidery -- 75178
	recipe = AddRecipe(75178, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Embersilk Net -- 75247
	recipe = AddRecipe(75247, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54442)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Belt -- 75248
	recipe = AddRecipe(75248, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54471)
	recipe:SetSkillLevels(445, 445, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Bracers -- 75249
	recipe = AddRecipe(75249, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54473)
	recipe:SetSkillLevels(445, 445, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Enchanted Spellthread -- 75250
	recipe = AddRecipe(75250, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54447)
	recipe:SetSkillLevels(450, 450, 465, 467, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Shoulders -- 75251
	recipe = AddRecipe(75251, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54474)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Boots -- 75252
	recipe = AddRecipe(75252, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54477)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Gloves -- 75253
	recipe = AddRecipe(75253, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54478)
	recipe:SetSkillLevels(460, 460, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Leggings -- 75254
	recipe = AddRecipe(75254, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54472)
	recipe:SetSkillLevels(460, 460, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Ghostly Spellthread -- 75255
	recipe = AddRecipe(75255, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54449)
	recipe:SetSkillLevels(460, 460, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Cowl -- 75256
	recipe = AddRecipe(75256, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54476)
	recipe:SetSkillLevels(465, 465, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Deathsilk Robes -- 75257
	recipe = AddRecipe(75257, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54475)
	recipe:SetSkillLevels(465, 465, 475, 477, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Belt -- 75258
	recipe = AddRecipe(75258, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54481)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Bracers -- 75259
	recipe = AddRecipe(75259, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54480)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Shoulders -- 75260
	recipe = AddRecipe(75260, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54479)
	recipe:SetSkillLevels(475, 475, 485, 487, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Boots -- 75261
	recipe = AddRecipe(75261, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54482)
	recipe:SetSkillLevels(475, 475, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Gloves -- 75262
	recipe = AddRecipe(75262, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54484)
	recipe:SetSkillLevels(480, 480, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Leggings -- 75263
	recipe = AddRecipe(75263, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54483)
	recipe:SetSkillLevels(480, 480, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Embersilk Bag -- 75264
	recipe = AddRecipe(75264, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54443)
	recipe:SetSkillLevels(480, 480, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Otherworldly Bag -- 75265
	recipe = AddRecipe(75265, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54445)
	recipe:SetSkillLevels(480, 480, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Cowl -- 75266
	recipe = AddRecipe(75266, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54485)
	recipe:SetSkillLevels(485, 485, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Spiritmend Robe -- 75267
	recipe = AddRecipe(75267, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54486)
	recipe:SetSkillLevels(485, 485, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Hyjal Expedition Bag -- 75268
	recipe = AddRecipe(75268, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54446)
	recipe:SetSkillLevels(490, 490, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Fireweave Belt -- 75269
	recipe = AddRecipe(75269, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54489)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Emberfire Bracers -- 75270
	recipe = AddRecipe(75270, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54501)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Black Embersilk Gown -- 75288
	recipe = AddRecipe(75288, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54441)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Bracers -- 75290
	recipe = AddRecipe(75290, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54488)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Emberfire Shoulders -- 75291
	recipe = AddRecipe(75291, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54502)
	recipe:SetSkillLevels(505, 505, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Fireweave Shoulders -- 75292
	recipe = AddRecipe(75292, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54487)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Emberfire Belt -- 75293
	recipe = AddRecipe(75293, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54500)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Fireweave Boots -- 75294
	recipe = AddRecipe(75294, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54490)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Emberfire Gloves -- 75295
	recipe = AddRecipe(75295, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54497)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Fireweave Gloves -- 75296
	recipe = AddRecipe(75296, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54492)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Emberfire Boots -- 75297
	recipe = AddRecipe(75297, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54499)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	-- Belt of the Depths -- 75298
	recipe = AddRecipe(75298, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54504)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Dreamless Belt -- 75299
	recipe = AddRecipe(75299, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54503)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Breeches of Mended Nightmares -- 75300
	recipe = AddRecipe(75300, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54505)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Flame-Ascended Pantaloons -- 75301
	recipe = AddRecipe(75301, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54506)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Pants -- 75302
	recipe = AddRecipe(75302, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54491)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Robe -- 75303
	recipe = AddRecipe(75303, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54494)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Fireweave Cowl -- 75304
	recipe = AddRecipe(75304, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54493)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Emberfire Robe -- 75305
	recipe = AddRecipe(75305, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54495)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Emberfire Cowl -- 75306
	recipe = AddRecipe(75306, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54496)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Emberfire Pants -- 75307
	recipe = AddRecipe(75307, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54498)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Illusionary Bag -- 75308
	recipe = AddRecipe(75308, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54444)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Powerful Enchanted Spellthread -- 75309
	recipe = AddRecipe(75309, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54448)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Powerful Ghostly Spellthread -- 75310
	recipe = AddRecipe(75310, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(54450)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50386, 50433)

	-- Frosty Flying Carpet -- 75597
	recipe = AddRecipe(75597, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(54797)
	recipe:SetSkillLevels(450, 450, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(40160)

	-- Dream of Destruction -- 94743
	recipe = AddRecipe(94743, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54440)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1346, 3363, 4159, 4576, 5153, 9584, 16640, 28699, 33580, 33613, 44783, 45559)

	self.InitTailoring = nil
end
