--[[
************************************************************************
Enchanting.lua
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
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 7411, nil, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitEnchanting()
	local recipe

	-- Enchant Bracer - Minor Health -- 7418
	recipe = AddRecipe(7418, 1, nil, Q.COMMON, V.ORIG, 1, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Enchant Chest - Minor Health -- 7420
	recipe = AddRecipe(7420, 15, nil, Q.COMMON, V.ORIG, 15, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Runed Copper Rod -- 7421
	recipe = AddRecipe(7421, 1, 6218, Q.COMMON, V.ORIG, 1, 5, 7, 10)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddCustom(8)

	-- Enchant Chest - Minor Absorption -- 7426
	recipe = AddRecipe(7426, 40, nil, Q.COMMON, V.ORIG, 40, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Minor Deflection -- 7428
	recipe = AddRecipe(7428, 1, nil, Q.COMMON, V.ORIG, 1, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom(8)

	-- Enchant Chest - Minor Mana -- 7443
	recipe = AddRecipe(7443, 20, nil, Q.UNCOMMON, V.ORIG, 20, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Minor Resistance -- 7454
	recipe = AddRecipe(7454, 45, nil, Q.COMMON, V.ORIG, 45, 95, 115, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Minor Stamina -- 7457
	recipe = AddRecipe(7457, 50, nil, Q.COMMON, V.ORIG, 50, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant 2H Weapon - Minor Impact -- 7745
	recipe = AddRecipe(7745, 100, nil, Q.COMMON, V.ORIG, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Lesser Health -- 7748
	recipe = AddRecipe(7748, 60, nil, Q.COMMON, V.ORIG, 60, 105, 125, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Minor Spirit -- 7766
	recipe = AddRecipe(7766, 60, nil, Q.UNCOMMON, V.ORIG, 60, 105, 125, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Minor Protection -- 7771
	recipe = AddRecipe(7771, 70, nil, Q.COMMON, V.ORIG, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Lesser Mana -- 7776
	recipe = AddRecipe(7776, 80, nil, Q.UNCOMMON, V.ORIG, 80, 115, 135, 155)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3346, 5757)

	-- Enchant Bracer - Minor Agility -- 7779
	recipe = AddRecipe(7779, 80, nil, Q.COMMON, V.ORIG, 80, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Minor Strength -- 7782
	recipe = AddRecipe(7782, 80, nil, Q.UNCOMMON, V.ORIG, 80, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Minor Beastslayer -- 7786
	recipe = AddRecipe(7786, 90, nil, Q.UNCOMMON, V.ORIG, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Minor Striking -- 7788
	recipe = AddRecipe(7788, 90, nil, Q.COMMON, V.ORIG, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant 2H Weapon - Lesser Intellect -- 7793
	recipe = AddRecipe(7793, 100, nil, Q.COMMON, V.ORIG, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddVendor(3012, 3346, 5158, 5758)

	-- Runed Silver Rod -- 7795
	recipe = AddRecipe(7795, 100, 6339, Q.COMMON, V.ORIG, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Health -- 7857
	recipe = AddRecipe(7857, 120, nil, Q.COMMON, V.ORIG, 120, 145, 165, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Lesser Spirit -- 7859
	recipe = AddRecipe(7859, 120, nil, Q.UNCOMMON, V.ORIG, 120, 145, 165, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Lesser Fire Resistance -- 7861
	recipe = AddRecipe(7861, 125, nil, Q.COMMON, V.ORIG, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Minor Stamina -- 7863
	recipe = AddRecipe(7863, 125, nil, Q.COMMON, V.ORIG, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Minor Agility -- 7867
	recipe = AddRecipe(7867, 125, nil, Q.UNCOMMON, V.ORIG, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(3012, 3537)

	-- Enchant Shield - Minor Stamina -- 13378
	recipe = AddRecipe(13378, 105, nil, Q.COMMON, V.ORIG, 105, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant 2H Weapon - Lesser Spirit -- 13380
	recipe = AddRecipe(13380, 110, nil, Q.UNCOMMON, V.ORIG, 110, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Minor Agility -- 13419
	recipe = AddRecipe(13419, 110, nil, Q.UNCOMMON, V.ORIG, 110, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddVendor(3954, 12043)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Lesser Protection -- 13421
	recipe = AddRecipe(13421, 115, nil, Q.COMMON, V.ORIG, 115, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Shield - Lesser Protection -- 13464
	recipe = AddRecipe(13464, 115, nil, Q.UNCOMMON, V.ORIG, 115, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Shield - Lesser Spirit -- 13485
	recipe = AddRecipe(13485, 130, nil, Q.COMMON, V.ORIG, 130, 155, 175, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Lesser Stamina -- 13501
	recipe = AddRecipe(13501, 130, nil, Q.COMMON, V.ORIG, 130, 155, 175, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Lesser Striking -- 13503
	recipe = AddRecipe(13503, 140, nil, Q.COMMON, V.ORIG, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Lesser Shadow Resistance -- 13522
	recipe = AddRecipe(13522, 135, nil, Q.UNCOMMON, V.ORIG, 135, 160, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant 2H Weapon - Lesser Impact -- 13529
	recipe = AddRecipe(13529, 145, nil, Q.COMMON, V.ORIG, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Lesser Strength -- 13536
	recipe = AddRecipe(13536, 140, nil, Q.UNCOMMON, V.ORIG, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(3954, 12043)

	-- Enchant Chest - Lesser Absorption -- 13538
	recipe = AddRecipe(13538, 140, nil, Q.COMMON, V.ORIG, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Mana -- 13607
	recipe = AddRecipe(13607, 145, nil, Q.COMMON, V.ORIG, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Mining -- 13612
	recipe = AddRecipe(13612, 145, nil, Q.UNCOMMON, V.ORIG, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(1051, 1052, 1053, 1054, 1364)

	-- Enchant Gloves - Herbalism -- 13617
	recipe = AddRecipe(13617, 145, nil, Q.UNCOMMON, V.ORIG, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(3834, 3919, 4028, 4029, 4030)

	-- Enchant Gloves - Fishing -- 13620
	recipe = AddRecipe(13620, 145, nil, Q.UNCOMMON, V.ORIG, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(2374, 2375, 2376, 2377, 14276)

	-- Enchant Bracer - Lesser Intellect -- 13622
	recipe = AddRecipe(13622, 150, nil, Q.COMMON, V.ORIG, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Minor Stats -- 13626
	recipe = AddRecipe(13626, 150, nil, Q.COMMON, V.ORIG, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Runed Golden Rod -- 13628
	recipe = AddRecipe(13628, 150, 11130, Q.COMMON, V.ORIG, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Shield - Lesser Stamina -- 13631
	recipe = AddRecipe(13631, 155, nil, Q.COMMON, V.ORIG, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Defense -- 13635
	recipe = AddRecipe(13635, 155, nil, Q.COMMON, V.ORIG, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Lesser Agility -- 13637
	recipe = AddRecipe(13637, 160, nil, Q.COMMON, V.ORIG, 160, 180, 200, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Greater Health -- 13640
	recipe = AddRecipe(13640, 160, nil, Q.COMMON, V.ORIG, 160, 180, 200, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Spirit -- 13642
	recipe = AddRecipe(13642, 165, nil, Q.COMMON, V.ORIG, 165, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Lesser Stamina -- 13644
	recipe = AddRecipe(13644, 170, nil, Q.COMMON, V.ORIG, 170, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Lesser Deflection -- 13646
	recipe = AddRecipe(13646, 170, nil, Q.UNCOMMON, V.ORIG, 170, 190, 210, 230)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK)
	recipe:AddLimitedVendor(2821, 1)

	-- Enchant Bracer - Stamina -- 13648
	recipe = AddRecipe(13648, 170, nil, Q.COMMON, V.ORIG, 170, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Lesser Beastslayer -- 13653
	recipe = AddRecipe(13653, 175, nil, Q.UNCOMMON, V.ORIG, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Lesser Elemental Slayer -- 13655
	recipe = AddRecipe(13655, 175, nil, Q.UNCOMMON, V.ORIG, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Fire Resistance -- 13657
	recipe = AddRecipe(13657, 175, nil, Q.COMMON, V.ORIG, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Shield - Spirit -- 13659
	recipe = AddRecipe(13659, 180, nil, Q.COMMON, V.ORIG, 180, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Strength -- 13661
	recipe = AddRecipe(13661, 180, nil, Q.COMMON, V.ORIG, 180, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Greater Mana -- 13663
	recipe = AddRecipe(13663, 185, nil, Q.COMMON, V.ORIG, 185, 205, 225, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Lesser Spirit -- 13687
	recipe = AddRecipe(13687, 190, nil, Q.UNCOMMON, V.ORIG, 190, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Shield - Lesser Block -- 13689
	recipe = AddRecipe(13689, 195, nil, Q.UNCOMMON, V.ORIG, 195, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Striking -- 13693
	recipe = AddRecipe(13693, 195, nil, Q.COMMON, V.ORIG, 195, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant 2H Weapon - Impact -- 13695
	recipe = AddRecipe(13695, 200, nil, Q.COMMON, V.ORIG, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Skinning -- 13698
	recipe = AddRecipe(13698, 200, nil, Q.UNCOMMON, V.ORIG, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(2556, 2557, 2558, 2606)

	-- Enchant Chest - Lesser Stats -- 13700
	recipe = AddRecipe(13700, 200, nil, Q.COMMON, V.ORIG, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Runed Truesilver Rod -- 13702
	recipe = AddRecipe(13702, 200, 11145, Q.COMMON, V.ORIG, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Greater Defense -- 13746
	recipe = AddRecipe(13746, 205, nil, Q.COMMON, V.ORIG, 205, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Resistance -- 13794
	recipe = AddRecipe(13794, 205, nil, Q.COMMON, V.ORIG, 205, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Agility -- 13815
	recipe = AddRecipe(13815, 210, nil, Q.COMMON, V.ORIG, 210, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Shield - Stamina -- 13817
	recipe = AddRecipe(13817, 210, nil, Q.UNCOMMON, V.ORIG, 210, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Intellect -- 13822
	recipe = AddRecipe(13822, 210, nil, Q.COMMON, V.ORIG, 210, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Stamina -- 13836
	recipe = AddRecipe(13836, 215, nil, Q.COMMON, V.ORIG, 215, 235, 255, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Advanced Mining -- 13841
	recipe = AddRecipe(13841, 215, nil, Q.UNCOMMON, V.ORIG, 215, 235, 255, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(674)

	-- Enchant Bracer - Greater Spirit -- 13846
	recipe = AddRecipe(13846, 220, nil, Q.UNCOMMON, V.ORIG, 220, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Chest - Superior Health -- 13858
	recipe = AddRecipe(13858, 220, nil, Q.COMMON, V.ORIG, 220, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Advanced Herbalism -- 13868
	recipe = AddRecipe(13868, 225, nil, Q.UNCOMMON, V.ORIG, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(764, 765, 766, 1081, 14448)

	-- Enchant Cloak - Lesser Agility -- 13882
	recipe = AddRecipe(13882, 225, nil, Q.UNCOMMON, V.ORIG, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddCustom(48)

	-- Enchant Gloves - Strength -- 13887
	recipe = AddRecipe(13887, 225, nil, Q.COMMON, V.ORIG, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Minor Speed -- 13890
	recipe = AddRecipe(13890, 225, nil, Q.COMMON, V.ORIG, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Fiery Weapon -- 13898
	recipe = AddRecipe(13898, 265, nil, Q.UNCOMMON, V.ORIG, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(9024)

	-- Enchant Shield - Greater Spirit -- 13905
	recipe = AddRecipe(13905, 230, nil, Q.COMMON, V.ORIG, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Demonslaying -- 13915
	recipe = AddRecipe(13915, 230, nil, Q.UNCOMMON, V.ORIG, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Chest - Superior Mana -- 13917
	recipe = AddRecipe(13917, 230, nil, Q.COMMON, V.ORIG, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Deflection -- 13931
	recipe = AddRecipe(13931, 235, nil, Q.UNCOMMON, V.ORIG, 235, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK)
	recipe:AddVendor(989, 4229)

	-- Enchant Shield - Frost Resistance -- 13933
	recipe = AddRecipe(13933, 235, nil, Q.UNCOMMON, V.ORIG, 235, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Boots - Agility -- 13935
	recipe = AddRecipe(13935, 235, nil, Q.COMMON, V.ORIG, 235, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant 2H Weapon - Greater Impact -- 13937
	recipe = AddRecipe(13937, 240, nil, Q.COMMON, V.ORIG, 240, 260, 280, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Greater Strength -- 13939
	recipe = AddRecipe(13939, 240, nil, Q.COMMON, V.ORIG, 240, 260, 280, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Stats -- 13941
	recipe = AddRecipe(13941, 245, nil, Q.COMMON, V.ORIG, 245, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Greater Striking -- 13943
	recipe = AddRecipe(13943, 245, nil, Q.COMMON, V.ORIG, 245, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Greater Stamina -- 13945
	recipe = AddRecipe(13945, 245, nil, Q.UNCOMMON, V.ORIG, 245, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Gloves - Riding Skill -- 13947
	recipe = AddRecipe(13947, 250, nil, Q.UNCOMMON, V.ORIG, 250, 270, 290, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Gloves - Minor Haste -- 13948
	recipe = AddRecipe(13948, 250, nil, Q.COMMON, V.ORIG, 250, 270, 290, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Lesser Magic Wand -- 14293
	recipe = AddRecipe(14293, 10, 11287, Q.COMMON, V.ORIG, 10, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Greater Magic Wand -- 14807
	recipe = AddRecipe(14807, 70, 11288, Q.COMMON, V.ORIG, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Lesser Mystic Wand -- 14809
	recipe = AddRecipe(14809, 155, 11289, Q.COMMON, V.ORIG, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Greater Mystic Wand -- 14810
	recipe = AddRecipe(14810, 175, 11290, Q.COMMON, V.ORIG, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Smoking Heart of the Mountain -- 15596
	recipe = AddRecipe(15596, 265, 45050, Q.UNCOMMON, V.ORIG, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddMobDrop(9025)

	-- Enchanted Thorium -- 17180
	recipe = AddRecipe(17180, 250, 12655, Q.COMMON, V.ORIG, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchanted Leather -- 17181
	recipe = AddRecipe(17181, 250, 12810, Q.COMMON, V.ORIG, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Greater Intellect -- 20008
	recipe = AddRecipe(20008, 255, nil, Q.COMMON, V.ORIG, 255, 275, 295, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Superior Spirit -- 20009
	recipe = AddRecipe(20009, 270, nil, Q.UNCOMMON, V.ORIG, 270, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Superior Strength -- 20010
	recipe = AddRecipe(20010, 295, nil, Q.UNCOMMON, V.ORIG, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddMobDrop(7372)

	-- Enchant Bracer - Superior Stamina -- 20011
	recipe = AddRecipe(20011, 300, nil, Q.UNCOMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Gloves - Greater Agility -- 20012
	recipe = AddRecipe(20012, 270, nil, Q.COMMON, V.ORIG, 270, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Greater Strength -- 20013
	recipe = AddRecipe(20013, 295, nil, Q.COMMON, V.ORIG, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Greater Resistance -- 20014
	recipe = AddRecipe(20014, 265, nil, Q.COMMON, V.ORIG, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Superior Defense -- 20015
	recipe = AddRecipe(20015, 285, nil, Q.COMMON, V.ORIG, 285, 300, 317, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddVendor(12022)

	-- Enchant Shield - Vitality -- 20016
	recipe = AddRecipe(20016, 280, nil, Q.COMMON, V.ORIG, 280, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Shield - Greater Stamina -- 20017
	recipe = AddRecipe(20017, 265, nil, Q.COMMON, V.ORIG, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHIELD)
	recipe:AddVendor(4229, 4561)

	-- Enchant Boots - Greater Stamina -- 20020
	recipe = AddRecipe(20020, 260, nil, Q.UNCOMMON, V.ORIG, 260, 280, 300, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Boots - Greater Agility -- 20023
	recipe = AddRecipe(20023, 295, nil, Q.COMMON, V.ORIG, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Boots - Spirit -- 20024
	recipe = AddRecipe(20024, 275, nil, Q.UNCOMMON, V.ORIG, 275, 295, 315, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Chest - Greater Stats -- 20025
	recipe = AddRecipe(20025, 300, nil, Q.UNCOMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Enchant Chest - Major Health -- 20026
	recipe = AddRecipe(20026, 275, nil, Q.COMMON, V.ORIG, 275, 295, 315, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11189)

	-- Enchant Chest - Major Mana -- 20028
	recipe = AddRecipe(20028, 290, nil, Q.COMMON, V.ORIG, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Icy Chill -- 20029
	recipe = AddRecipe(20029, 285, nil, Q.UNCOMMON, V.ORIG, 285, 300, 317, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(7524)

	-- Enchant 2H Weapon - Superior Impact -- 20030
	recipe = AddRecipe(20030, 295, nil, Q.UNCOMMON, V.ORIG, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddMobDrop(10317)

	-- Enchant Weapon - Superior Striking -- 20031
	recipe = AddRecipe(20031, 300, nil, Q.UNCOMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(9216)

	-- Enchant Weapon - Lifestealing -- 20032
	recipe = AddRecipe(20032, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(10499)

	-- Enchant Weapon - Unholy Weapon -- 20033
	recipe = AddRecipe(20033, 295, nil, Q.UNCOMMON, V.ORIG, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(10398, 16810)

	-- Enchant Weapon - Crusader -- 20034
	recipe = AddRecipe(20034, 300, nil, Q.UNCOMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(4494, 9451)

	-- Enchant 2H Weapon - Major Spirit -- 20035
	recipe = AddRecipe(20035, 300, nil, Q.UNCOMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddMobDrop(10469)

	-- Enchant 2H Weapon - Major Intellect -- 20036
	recipe = AddRecipe(20036, 300, nil, Q.UNCOMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddMobDrop(10422)

	-- Runed Arcanite Rod -- 20051
	recipe = AddRecipe(20051, 290, 16207, Q.COMMON, V.ORIG, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE)
	recipe:AddVendor(12022)

	-- Enchant Weapon - Winter's Might -- 21931
	recipe = AddRecipe(21931, 190, nil, Q.UNCOMMON, V.ORIG, 190, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddSeason(1)

	-- Enchant Weapon - Spellpower -- 22749
	recipe = AddRecipe(22749, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom(26)

	-- Enchant Weapon - Healing Power -- 22750
	recipe = AddRecipe(22750, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom(26)

	-- Enchant Weapon - Strength -- 23799
	recipe = AddRecipe(23799, 290, nil, Q.COMMON, V.ORIG, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Enchant Weapon - Agility -- 23800
	recipe = AddRecipe(23800, 290, nil, Q.COMMON, V.ORIG, 290, 305, 322, 340)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Enchant Bracer - Mana Regeneration -- 23801
	recipe = AddRecipe(23801, 290, nil, Q.COMMON, V.ORIG, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Enchant Bracer - Healing Power -- 23802
	recipe = AddRecipe(23802, 300, nil, Q.COMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Enchant Weapon - Mighty Spirit -- 23803
	recipe = AddRecipe(23803, 300, nil, Q.COMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Enchant Weapon - Mighty Intellect -- 23804
	recipe = AddRecipe(23804, 300, nil, Q.COMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Enchant Gloves - Threat -- 25072
	recipe = AddRecipe(25072, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.SHATAR)
	recipe:AddMobDrop(15275)
	recipe:AddRepVendor(FAC.SHATAR, REP.EXALTED, 21432)

	-- Enchant Gloves - Shadow Power -- 25073
	recipe = AddRecipe(25073, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(22)

	-- Enchant Gloves - Frost Power -- 25074
	recipe = AddRecipe(25074, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(22)

	-- Enchant Gloves - Fire Power -- 25078
	recipe = AddRecipe(25078, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(22)

	-- Enchant Gloves - Healing Power -- 25079
	recipe = AddRecipe(25079, 300, nil, Q.RARE, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(22)

	-- Enchant Gloves - Superior Agility -- 25080
	recipe = AddRecipe(25080, 300, nil, Q.RARE, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.EXALTED, 21643)
	recipe:AddCustom(22)

	-- Enchant Cloak - Greater Fire Resistance -- 25081
	recipe = AddRecipe(25081, 300, nil, Q.COMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15419)

	-- Enchant Cloak - Greater Nature Resistance -- 25082
	recipe = AddRecipe(25082, 300, nil, Q.COMMON, V.ORIG, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15419)

	-- Enchant Cloak - Stealth -- 25083
	recipe = AddRecipe(25083, 300, nil, Q.RARE, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOE, F.CENARION_EXPEDITION, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)
	recipe:AddCustom(22)

	-- Enchant Cloak - Subtlety -- 25084
	recipe = AddRecipe(25084, 300, nil, Q.RARE, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HELLFIRE, F.CLOAK)
	recipe:AddMobDrop(15276)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.EXALTED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.EXALTED, 17585)

	-- Enchant Cloak - Dodge -- 25086
	recipe = AddRecipe(25086, 300, nil, Q.RARE, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.TANK, F.LOWERCITY, F.CLOAK)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.EXALTED, 21655)
	recipe:AddCustom(22)

	-- Minor Wizard Oil -- 25124
	recipe = AddRecipe(25124, 45, 20744, Q.COMMON, V.ORIG, 45, 55, 65, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Minor Mana Oil -- 25125
	recipe = AddRecipe(25125, 150, 20745, Q.COMMON, V.ORIG, 150, 160, 170, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Lesser Wizard Oil -- 25126
	recipe = AddRecipe(25126, 200, 20746, Q.COMMON, V.ORIG, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Lesser Mana Oil -- 25127
	recipe = AddRecipe(25127, 250, 20747, Q.COMMON, V.ORIG, 250, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(15419)

	-- Wizard Oil -- 25128
	recipe = AddRecipe(25128, 275, 20750, Q.COMMON, V.ORIG, 275, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(15419)

	-- Brilliant Wizard Oil -- 25129
	recipe = AddRecipe(25129, 300, 20749, Q.COMMON, V.ORIG, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Brilliant Mana Oil -- 25130
	recipe = AddRecipe(25130, 300, 20748, Q.COMMON, V.ORIG, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Enchant 2H Weapon - Agility -- 27837
	recipe = AddRecipe(27837, 290, nil, Q.COMMON, V.ORIG, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.TWO_HAND)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Enchant Bracer - Brawn -- 27899
	recipe = AddRecipe(27899, 305, nil, Q.COMMON, V.TBC, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Stats -- 27905
	recipe = AddRecipe(27905, 315, nil, Q.COMMON, V.TBC, 315, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Major Defense -- 27906
	recipe = AddRecipe(27906, 320, nil, Q.UNCOMMON, V.TBC, 320, 330, 345, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(22822, 23008)

	-- Enchant Bracer - Superior Healing -- 27911
	recipe = AddRecipe(27911, 325, nil, Q.COMMON, V.TBC, 325, 335, 350, 365)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Enchant Bracer - Restore Mana Prime -- 27913
	recipe = AddRecipe(27913, 335, nil, Q.UNCOMMON, V.TBC, 335, 345, 360, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Enchant Bracer - Fortitude -- 27914
	recipe = AddRecipe(27914, 350, nil, Q.UNCOMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17803)

	-- Enchant Bracer - Spellpower -- 27917
	recipe = AddRecipe(27917, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 385, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19952)

	-- Enchant Ring - Striking -- 27920
	recipe = AddRecipe(27920, 360, nil, Q.COMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM, F.RING)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 17518)

	-- Enchant Ring - Spellpower -- 27924
	recipe = AddRecipe(27924, 360, nil, Q.COMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KOT, F.RING)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Enchant Ring - Healing Power -- 27926
	recipe = AddRecipe(27926, 370, nil, Q.COMMON, V.TBC, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.RING)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Enchant Ring - Stats -- 27927
	recipe = AddRecipe(27927, 375, nil, Q.COMMON, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LOWERCITY, F.RING)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.HONORED, 21655)

	-- Enchant Shield - Tough Shield -- 27944
	recipe = AddRecipe(27944, 310, nil, Q.COMMON, V.TBC, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Shield - Intellect -- 27945
	recipe = AddRecipe(27945, 325, nil, Q.COMMON, V.TBC, 325, 335, 350, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddVendor(18664)

	-- Enchant Shield - Shield Block -- 27946
	recipe = AddRecipe(27946, 340, nil, Q.UNCOMMON, V.TBC, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Outland")

	-- Enchant Shield - Resistance -- 27947
	recipe = AddRecipe(27947, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Outland")

	-- Enchant Boots - Vitality -- 27948
	recipe = AddRecipe(27948, 305, nil, Q.UNCOMMON, V.TBC, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(24664)

	-- Enchant Boots - Fortitude -- 27950
	recipe = AddRecipe(27950, 320, nil, Q.UNCOMMON, V.TBC, 320, 330, 345, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18317)

	-- Enchant Boots - Dexterity -- 27951
	recipe = AddRecipe(27951, 340, nil, Q.UNCOMMON, V.TBC, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddMobDrop(18521)

	-- Enchant Boots - Surefooted -- 27954
	recipe = AddRecipe(27954, 370, nil, Q.UNCOMMON, V.TBC, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.CASTER)
	recipe:AddMobDrop(16472)

	-- Enchant Chest - Exceptional Health -- 27957
	recipe = AddRecipe(27957, 315, nil, Q.COMMON, V.TBC, 315, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Exceptional Mana -- 27958
	recipe = AddRecipe(27958, 350, nil, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Chest - Exceptional Stats -- 27960
	recipe = AddRecipe(27960, 345, nil, Q.COMMON, V.TBC, 345, 355, 367, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.REVERED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.REVERED, 17585)

	-- Enchant Cloak - Major Armor -- 27961
	recipe = AddRecipe(27961, 310, nil, Q.COMMON, V.TBC, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Major Resistance -- 27962
	recipe = AddRecipe(27962, 330, nil, Q.UNCOMMON, V.TBC, 330, 340, 355, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Enchant Weapon - Major Striking -- 27967
	recipe = AddRecipe(27967, 340, nil, Q.COMMON, V.TBC, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Enchant Weapon - Major Intellect -- 27968
	recipe = AddRecipe(27968, 340, nil, Q.UNCOMMON, V.TBC, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(20136)

	-- Enchant 2H Weapon - Savagery -- 27971
	recipe = AddRecipe(27971, 350, nil, Q.UNCOMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddMobDrop(17465)

	-- Enchant Weapon - Potency -- 27972
	recipe = AddRecipe(27972, 350, nil, Q.UNCOMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Outland")

	-- Enchant Weapon - Major Spellpower -- 27975
	recipe = AddRecipe(27975, 350, nil, Q.UNCOMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(22242)

	-- Enchant 2H Weapon - Major Agility -- 27977
	recipe = AddRecipe(27977, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddMobDrop(20880)

	-- Enchant Weapon - Sunfire -- 27981
	recipe = AddRecipe(27981, 375, nil, Q.RARE, V.TBC, 375, 375, 375, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(16524)

	-- Enchant Weapon - Soulfrost -- 27982
	recipe = AddRecipe(27982, 375, nil, Q.RARE, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(15688)

	-- Enchant Weapon - Mongoose -- 27984
	recipe = AddRecipe(27984, 375, nil, Q.RARE, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(15687)

	-- Enchant Weapon - Spellsurge -- 28003
	recipe = AddRecipe(28003, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Outland")

	-- Enchant Weapon - Battlemaster -- 28004
	recipe = AddRecipe(28004, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Outland")

	-- Superior Mana Oil -- 28016
	recipe = AddRecipe(28016, 310, 22521, Q.COMMON, V.TBC, 310, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16635, 16722, 19663)

	-- Superior Wizard Oil -- 28019
	recipe = AddRecipe(28019, 340, 22522, Q.COMMON, V.TBC, 340, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16635, 16722, 19663)

	-- Large Prismatic Shard -- 28022
	recipe = AddRecipe(28022, 335, 22449, Q.COMMON, V.TBC, 335, 335, 335, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16635, 16722, 19663)

	-- Prismatic Sphere -- 28027
	recipe = AddRecipe(28027, 325, 22460, Q.COMMON, V.TBC, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Void Sphere -- 28028
	recipe = AddRecipe(28028, 350, 22459, Q.COMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Runed Fel Iron Rod -- 32664
	recipe = AddRecipe(32664, 300, 22461, Q.COMMON, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Runed Adamantite Rod -- 32665
	recipe = AddRecipe(32665, 350, 22462, Q.COMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE)
	recipe:AddVendor(18960, 19004)

	-- Runed Eternium Rod -- 32667
	recipe = AddRecipe(32667, 375, 22463, Q.COMMON, V.TBC, 375, 375, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)
	recipe:AddVendor(19663)

	-- Enchant Chest - Major Spirit -- 33990
	recipe = AddRecipe(33990, 320, nil, Q.COMMON, V.TBC, 320, 330, 345, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Restore Mana Prime -- 33991
	recipe = AddRecipe(33991, 300, nil, Q.COMMON, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Chest - Major Resilience -- 33992
	recipe = AddRecipe(33992, 345, nil, Q.UNCOMMON, V.TBC, 345, 355, 367, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Enchant Gloves - Blasting -- 33993
	recipe = AddRecipe(33993, 305, nil, Q.COMMON, V.TBC, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Precise Strikes -- 33994
	recipe = AddRecipe(33994, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Enchant Gloves - Major Strength -- 33995
	recipe = AddRecipe(33995, 340, nil, Q.COMMON, V.TBC, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Assault -- 33996
	recipe = AddRecipe(33996, 310, nil, Q.COMMON, V.TBC, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Gloves - Major Spellpower -- 33997
	recipe = AddRecipe(33997, 360, nil, Q.UNCOMMON, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Enchant Gloves - Major Healing -- 33999
	recipe = AddRecipe(33999, 350, nil, Q.UNCOMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Enchant Bracer - Major Intellect -- 34001
	recipe = AddRecipe(34001, 305, nil, Q.COMMON, V.TBC, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Bracer - Assault -- 34002
	recipe = AddRecipe(34002, 300, nil, Q.COMMON, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Spell Penetration -- 34003
	recipe = AddRecipe(34003, 325, nil, Q.UNCOMMON, V.TBC, 325, 335, 350, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER, F.CONSORTIUM, F.CLOAK)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Enchant Cloak - Greater Agility -- 34004
	recipe = AddRecipe(34004, 310, nil, Q.COMMON, V.TBC, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Greater Arcane Resistance -- 34005
	recipe = AddRecipe(34005, 350, nil, Q.RARE, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddMobDrop(19796)

	-- Enchant Cloak - Greater Shadow Resistance -- 34006
	recipe = AddRecipe(34006, 350, nil, Q.RARE, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddMobDrop(18870)

	-- Enchant Boots - Cat's Swiftness -- 34007
	recipe = AddRecipe(34007, 360, nil, Q.RARE, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddMobDrop(24664)

	-- Enchant Boots - Boar's Speed -- 34008
	recipe = AddRecipe(34008, 360, nil, Q.RARE, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(24664)

	-- Enchant Shield - Major Stamina -- 34009
	recipe = AddRecipe(34009, 325, nil, Q.COMMON, V.TBC, 325, 335, 350, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddVendor(19663)

	-- Enchant Weapon - Major Healing -- 34010
	recipe = AddRecipe(34010, 350, nil, Q.UNCOMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Nexus Transformation -- 42613
	recipe = AddRecipe(42613, 300, 22448, Q.COMMON, V.TBC, 300, 300, 300, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Small Prismatic Shard -- 42615
	recipe = AddRecipe(42615, 335, 22448, Q.COMMON, V.TBC, 335, 335, 335, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Greater Agility -- 42620
	recipe = AddRecipe(42620, 350, nil, Q.COMMON, V.TBC, 350, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.VIOLETEYE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.EXALTED, 18255)

	-- Enchant Weapon - Executioner -- 42974
	recipe = AddRecipe(42974, 375, 33307, Q.RARE, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom(29)

	-- Enchant Shield - Resilience -- 44383
	recipe = AddRecipe(44383, 330, nil, Q.COMMON, V.TBC, 330, 340, 355, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHIELD)
	recipe:AddTrainer(3345, 18753, 18773, 19252, 19540, 33610, 33676)

	-- Enchant Cloak - Superior Frost Resistance -- 44483
	recipe = AddRecipe(44483, 400, nil, Q.UNCOMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(32289)

	-- Enchant Gloves - Expertise -- 44484
	recipe = AddRecipe(44484, 405, nil, Q.COMMON, V.WOTLK, 405, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Precision -- 44488
	recipe = AddRecipe(44488, 410, nil, Q.COMMON, V.WOTLK, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Shield - Defense -- 44489
	recipe = AddRecipe(44489, 420, nil, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Chest - Mighty Health -- 44492
	recipe = AddRecipe(44492, 395, nil, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Superior Nature Resistance -- 44494
	recipe = AddRecipe(44494, 400, nil, Q.UNCOMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(32290)

	-- Enchant Cloak - Superior Agility -- 44500
	recipe = AddRecipe(44500, 395, nil, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Gatherer -- 44506
	recipe = AddRecipe(44506, 375, nil, Q.COMMON, V.WOTLK, 375, 375, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Boots - Greater Spirit -- 44508
	recipe = AddRecipe(44508, 410, nil, Q.COMMON, V.WOTLK, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Chest - Greater Mana Restoration -- 44509
	recipe = AddRecipe(44509, 420, nil, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Weapon - Exceptional Spirit -- 44510
	recipe = AddRecipe(44510, 410, nil, Q.COMMON, V.WOTLK, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Greater Assault -- 44513
	recipe = AddRecipe(44513, 395, nil, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Weapon - Icebreaker -- 44524
	recipe = AddRecipe(44524, 425, nil, Q.RARE, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Boots - Greater Fortitude -- 44528
	recipe = AddRecipe(44528, 385, nil, Q.COMMON, V.WOTLK, 385, 385, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Major Agility -- 44529
	recipe = AddRecipe(44529, 415, nil, Q.COMMON, V.WOTLK, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Bracers - Exceptional Intellect -- 44555
	recipe = AddRecipe(44555, 375, nil, Q.COMMON, V.WOTLK, 375, 385, 392, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Superior Fire Resistance -- 44556
	recipe = AddRecipe(44556, 400, nil, Q.UNCOMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(30921)

	-- Enchant Bracers - Greater Assault -- 44575
	recipe = AddRecipe(44575, 430, nil, Q.UNCOMMON, V.WOTLK, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Lifeward -- 44576
	recipe = AddRecipe(44576, 425, nil, Q.RARE, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Cloak - Spell Piercing -- 44582
	recipe = AddRecipe(44582, 395, nil, Q.COMMON, V.WOTLK, 395, 395, 402, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Boots - Greater Vitality -- 44584
	recipe = AddRecipe(44584, 405, nil, Q.COMMON, V.WOTLK, 405, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Chest - Exceptional Resilience -- 44588
	recipe = AddRecipe(44588, 410, nil, Q.UNCOMMON, V.WOTLK, 410, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Boots - Superior Agility -- 44589
	recipe = AddRecipe(44589, 415, nil, Q.COMMON, V.WOTLK, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Superior Shadow Resistance -- 44590
	recipe = AddRecipe(44590, 400, nil, Q.UNCOMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(32349)

	-- Enchant Cloak - Titanweave -- 44591
	recipe = AddRecipe(44591, 435, nil, Q.UNCOMMON, V.WOTLK, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Gloves - Exceptional Spellpower -- 44592
	recipe = AddRecipe(44592, 360, nil, Q.COMMON, V.WOTLK, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Bracers - Major Spirit -- 44593
	recipe = AddRecipe(44593, 420, nil, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant 2H Weapon - Scourgebane -- 44595
	recipe = AddRecipe(44595, 430, 44473, Q.RARE, V.WOTLK, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Cloak - Superior Arcane Resistance -- 44596
	recipe = AddRecipe(44596, 400, nil, Q.UNCOMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(31702, 32297)

	-- Enchant Bracers - Expertise -- 44598
	recipe = AddRecipe(44598, 415, nil, Q.COMMON, V.WOTLK, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Bracers - Greater Stats -- 44616
	recipe = AddRecipe(44616, 400, nil, Q.COMMON, V.WOTLK, 400, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Weapon - Giant Slayer -- 44621
	recipe = AddRecipe(44621, 430, nil, Q.RARE, V.WOTLK, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Chest - Super Stats -- 44623
	recipe = AddRecipe(44623, 370, nil, Q.COMMON, V.WOTLK, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Armsman -- 44625
	recipe = AddRecipe(44625, 435, nil, Q.UNCOMMON, V.WOTLK, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Exceptional Spellpower -- 44629
	recipe = AddRecipe(44629, 395, nil, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant 2H Weapon - Greater Savagery -- 44630
	recipe = AddRecipe(44630, 390, nil, Q.COMMON, V.WOTLK, 390, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Shadow Armor -- 44631
	recipe = AddRecipe(44631, 440, nil, Q.UNCOMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Exceptional Agility -- 44633
	recipe = AddRecipe(44633, 410, nil, Q.COMMON, V.WOTLK, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Bracers - Greater Spellpower -- 44635
	recipe = AddRecipe(44635, 395, nil, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Ring - Greater Spellpower -- 44636
	recipe = AddRecipe(44636, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Ring - Assault -- 44645
	recipe = AddRecipe(44645, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Void Shatter -- 45765
	recipe = AddRecipe(45765, 375, 22449, Q.COMMON, V.TBC, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25032)

	-- Enchant Weapon - Deathfrost -- 46578
	recipe = AddRecipe(46578, 350, 35498, Q.RARE, V.TBC, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddSeason(4)

	-- Enchant Chest - Defense -- 46594
	recipe = AddRecipe(46594, 360, nil, Q.COMMON, V.WOTLK, 360, 370, 385, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25032)

	-- Enchant Cloak - Steelweave -- 47051
	recipe = AddRecipe(47051, 375, nil, Q.RARE, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddMobDrop(24560)

	-- Enchant Cloak - Mighty Armor -- 47672
	recipe = AddRecipe(47672, 430, nil, Q.UNCOMMON, V.WOTLK, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Chest - Greater Defense -- 47766
	recipe = AddRecipe(47766, 400, nil, Q.COMMON, V.WOTLK, 400, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Greater Speed -- 47898
	recipe = AddRecipe(47898, 430, nil, Q.UNCOMMON, V.WOTLK, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Cloak - Wisdom -- 47899
	recipe = AddRecipe(47899, 440, nil, Q.UNCOMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Chest - Super Health -- 47900
	recipe = AddRecipe(47900, 425, nil, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Boots - Tuskarr's Vitality -- 47901
	recipe = AddRecipe(47901, 440, nil, Q.UNCOMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Accuracy -- 59619
	recipe = AddRecipe(59619, 440, nil, Q.RARE, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Berserking -- 59621
	recipe = AddRecipe(59621, 440, nil, Q.RARE, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Black Magic -- 59625
	recipe = AddRecipe(59625, 440, nil, Q.RARE, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Ring - Stamina -- 59636
	recipe = AddRecipe(59636, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Boots - Assault -- 60606
	recipe = AddRecipe(60606, 375, nil, Q.COMMON, V.WOTLK, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Speed -- 60609
	recipe = AddRecipe(60609, 350, nil, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Bracers - Striking -- 60616
	recipe = AddRecipe(60616, 360, nil, Q.COMMON, V.WOTLK, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Runed Titanium Rod -- 60619
	recipe = AddRecipe(60619, 425, 44452, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Weapon - Greater Potency -- 60621
	recipe = AddRecipe(60621, 380, nil, Q.COMMON, V.WOTLK, 380, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Boots - Icewalker -- 60623
	recipe = AddRecipe(60623, 385, nil, Q.COMMON, V.WOTLK, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Shield - Greater Intellect -- 60653
	recipe = AddRecipe(60653, 395, nil, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHIELD)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Cloak - Major Agility -- 60663
	recipe = AddRecipe(60663, 420, nil, Q.COMMON, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Crusher -- 60668
	recipe = AddRecipe(60668, 425, nil, Q.COMMON, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant 2H Weapon - Massacre -- 60691
	recipe = AddRecipe(60691, 430, nil, Q.RARE, V.WOTLK, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Chest - Powerful Stats -- 60692
	recipe = AddRecipe(60692, 440, nil, Q.UNCOMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Superior Potency -- 60707
	recipe = AddRecipe(60707, 435, nil, Q.RARE, V.WOTLK, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Mighty Spellpower -- 60714
	recipe = AddRecipe(60714, 435, nil, Q.RARE, V.WOTLK, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Boots - Greater Assault -- 60763
	recipe = AddRecipe(60763, 440, nil, Q.UNCOMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(32514)

	-- Enchant Bracers - Superior Spellpower -- 60767
	recipe = AddRecipe(60767, 440, 44498, Q.UNCOMMON, V.WOTLK, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(32514)

	-- Enchant Bracers - Major Stamina -- 62256
	recipe = AddRecipe(62256, 450, 44944, Q.RARE, V.WOTLK, 450, 460, 470, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Staff - Greater Spellpower -- 62948
	recipe = AddRecipe(62948, 450, nil, Q.RARE, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.STAFF)
	recipe:AddVendor(32514)

	-- Enchant Staff - Spellpower -- 62959
	recipe = AddRecipe(62959, 385, nil, Q.COMMON, V.WOTLK, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.STAFF)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Boots - Lesser Accuracy -- 63746
	recipe = AddRecipe(63746, 225, nil, Q.COMMON, V.WOTLK, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33610, 33676)

	-- Enchant Weapon - Blade Ward -- 64441
	recipe = AddRecipe(64441, 450, nil, Q.EPIC, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom(39)

	-- Enchant Weapon - Blood Draining -- 64579
	recipe = AddRecipe(64579, 450, nil, Q.EPIC, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom(39)

	-- Abyssal Shatter -- 69412
	recipe = AddRecipe(69412, 445, 49640, Q.COMMON, V.WOTLK, 445, 445, 447, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33583)

	-- Enchant Gloves - Angler -- 71692
	recipe = AddRecipe(71692, 375, nil, Q.UNCOMMON, V.WOTLK, 375, 385, 392, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOP, F.RBOP)
	recipe:AddMobDrop(26336, 26343, 26344)

	-- Enchant Gloves - Mastery -- 74132
	recipe = AddRecipe(74132, 425, nil, Q.COMMON, V.CATA, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Boots - Earthen Vitality -- 74189
	recipe = AddRecipe(74189, 425, nil, Q.COMMON, V.CATA, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Chest - Mighty Stats -- 74191
	recipe = AddRecipe(74191, 425, nil, Q.COMMON, V.CATA, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Cloak - Greater Spell Piercing -- 74192
	recipe = AddRecipe(74192, 435, nil, Q.COMMON, V.CATA, 435, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Speed -- 74193
	recipe = AddRecipe(74193, 435, nil, Q.COMMON, V.CATA, 435, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Weapon - Mending -- 74195
	recipe = AddRecipe(74195, 450, nil, Q.COMMON, V.CATA, 450, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Weapon - Avalanche -- 74197
	recipe = AddRecipe(74197, 450, nil, Q.COMMON, V.CATA, 450, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Gloves - Haste -- 74198
	recipe = AddRecipe(74198, 455, nil, Q.COMMON, V.CATA, 455, 465, 475, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Boots - Haste -- 74199
	recipe = AddRecipe(74199, 455, nil, Q.COMMON, V.CATA, 455, 465, 475, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Chest - Stamina -- 74200
	recipe = AddRecipe(74200, 460, nil, Q.COMMON, V.CATA, 460, 470, 480, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Critical Strike -- 74201
	recipe = AddRecipe(74201, 460, nil, Q.COMMON, V.CATA, 460, 470, 480, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Cloak - Intellect -- 74202
	recipe = AddRecipe(74202, 465, nil, Q.COMMON, V.CATA, 465, 475, 485, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Shield - Protection -- 74207
	recipe = AddRecipe(74207, 465, nil, Q.COMMON, V.CATA, 465, 475, 485, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Weapon - Elemental Slayer -- 74211
	recipe = AddRecipe(74211, 470, nil, Q.COMMON, V.CATA, 470, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Gloves - Exceptional Strength -- 74212
	recipe = AddRecipe(74212, 470, nil, Q.COMMON, V.CATA, 470, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Boots - Major Agility -- 74213
	recipe = AddRecipe(74213, 475, nil, Q.COMMON, V.CATA, 475, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Chest - Mighty Resilience -- 74214
	recipe = AddRecipe(74214, 475, nil, Q.COMMON, V.CATA, 475, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Ring - Strength -- 74215
	recipe = AddRecipe(74215, 475, nil, Q.COMMON, V.CATA, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Ring - Agility -- 74216
	recipe = AddRecipe(74216, 475, nil, Q.COMMON, V.CATA, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Ring - Intellect -- 74217
	recipe = AddRecipe(74217, 475, nil, Q.COMMON, V.CATA, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Ring - Greater Stamina -- 74218
	recipe = AddRecipe(74218, 475, nil, Q.COMMON, V.CATA, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Gloves - Greater Expertise -- 74220
	recipe = AddRecipe(74220, 480, nil, Q.COMMON, V.CATA, 480, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Weapon - Hurricane -- 74223
	recipe = AddRecipe(74223, 480, nil, Q.COMMON, V.CATA, 480, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Weapon - Heartsong -- 74225
	recipe = AddRecipe(74225, 485, nil, Q.COMMON, V.CATA, 485, 495, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Shield - Blocking -- 74226
	recipe = AddRecipe(74226, 485, nil, Q.COMMON, V.CATA, 485, 495, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Dodge -- 74229
	recipe = AddRecipe(74229, 490, nil, Q.COMMON, V.CATA, 490, 500, 510, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Cloak - Critical Strike -- 74230
	recipe = AddRecipe(74230, 490, nil, Q.COMMON, V.CATA, 490, 500, 510, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Chest - Exceptional Spirit -- 74231
	recipe = AddRecipe(74231, 495, nil, Q.COMMON, V.CATA, 495, 505, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Precision -- 74232
	recipe = AddRecipe(74232, 495, nil, Q.COMMON, V.CATA, 495, 505, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Cloak - Protection -- 74234
	recipe = AddRecipe(74234, 500, nil, Q.COMMON, V.CATA, 500, 510, 520, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Off-Hand - Superior Intellect -- 74235
	recipe = AddRecipe(74235, 500, nil, Q.COMMON, V.CATA, 500, 510, 520, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Boots - Precision -- 74236
	recipe = AddRecipe(74236, 505, nil, Q.COMMON, V.CATA, 505, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Exceptional Spirit -- 74237
	recipe = AddRecipe(74237, 505, nil, Q.COMMON, V.CATA, 505, 515, 525, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Boots - Mastery -- 74238
	recipe = AddRecipe(74238, 510, nil, Q.COMMON, V.CATA, 510, 520, 530, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Greater Expertise -- 74239
	recipe = AddRecipe(74239, 510, nil, Q.COMMON, V.CATA, 510, 520, 530, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Cloak - Greater Intellect -- 74240
	recipe = AddRecipe(74240, 510, nil, Q.COMMON, V.CATA, 510, 520, 530, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Weapon - Power Torrent -- 74242
	recipe = AddRecipe(74242, 525, nil, Q.RARE, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Weapon - Windwalk -- 74244
	recipe = AddRecipe(74244, 525, nil, Q.RARE, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Weapon - Landslide -- 74246
	recipe = AddRecipe(74246, 525, nil, Q.RARE, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Cloak - Greater Critical Strike -- 74247
	recipe = AddRecipe(74247, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Bracer - Greater Critical Strike -- 74248
	recipe = AddRecipe(74248, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Chest - Peerless Stats -- 74250
	recipe = AddRecipe(74250, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Chest - Greater Stamina -- 74251
	recipe = AddRecipe(74251, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Boots - Assassin's Step -- 74252
	recipe = AddRecipe(74252, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Boots - Lavawalker -- 74253
	recipe = AddRecipe(74253, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Gloves - Mighty Strength -- 74254
	recipe = AddRecipe(74254, 525, 64415, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Gloves - Greater Mastery -- 74255
	recipe = AddRecipe(74255, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Bracer - Greater Speed -- 74256
	recipe = AddRecipe(74256, 525, nil, Q.UNCOMMON, V.CATA, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Runed Elementium Rod -- 92370
	recipe = AddRecipe(92370, 515, 65359, Q.COMMON, V.CATA, 515, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchanted Lantern -- 93841
	recipe = AddRecipe(93841, 525, 67308, Q.RARE, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50146)

	-- Magic Lamp -- 93843
	recipe = AddRecipe(93843, 525, 67312, Q.RARE, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50134)

	-- Enchant 2H Weapon - Mighty Agility -- 95471
	recipe = AddRecipe(95471, 470, nil, Q.COMMON, V.CATA, 470, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 28693)

	-- Enchant Bracer - Major Strength -- 96261
	recipe = AddRecipe(96261, 515, nil, Q.RARE, V.CATA, 515, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Mighty Intellect -- 96262
	recipe = AddRecipe(96262, 515, nil, Q.RARE, V.CATA, 515, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Agility -- 96264
	recipe = AddRecipe(96264, 515, nil, Q.RARE, V.CATA, 515, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	self.InitEnchanting = nil
end
