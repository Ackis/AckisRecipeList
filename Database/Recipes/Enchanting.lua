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
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitEnchanting()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 7411, genesis, quality)
	end

	private:InitializeEnchantingTrainers()

	local recipe

	-- Enchant Bracer - Minor Health -- 7418
	recipe = AddRecipe(7418, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Enchant Chest - Minor Health -- 7420
	recipe = AddRecipe(7420, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(15, 15, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Runed Copper Rod -- 7421
	recipe = AddRecipe(7421, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6218)
	recipe:SetSkillLevels(1, 1, 5, 7, 10)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Enchant Chest - Minor Absorption -- 7426
	recipe = AddRecipe(7426, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(40, 40, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Minor Deflection -- 7428
	recipe = AddRecipe(7428, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Enchant Chest - Minor Mana -- 7443
	recipe = AddRecipe(7443, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6342)
	recipe:SetSkillLevels(20, 20, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Minor Resistance -- 7454
	recipe = AddRecipe(7454, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(45, 45, 95, 115, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Minor Stamina -- 7457
	recipe = AddRecipe(7457, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant 2H Weapon - Minor Impact -- 7745
	recipe = AddRecipe(7745, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Lesser Health -- 7748
	recipe = AddRecipe(7748, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(60, 60, 105, 125, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Minor Spirit -- 7766
	recipe = AddRecipe(7766, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6344)
	recipe:SetSkillLevels(60, 60, 105, 125, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Minor Protection -- 7771
	recipe = AddRecipe(7771, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(70, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Lesser Mana -- 7776
	recipe = AddRecipe(7776, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6346)
	recipe:SetSkillLevels(80, 80, 115, 135, 155)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3346, 5757)

	-- Enchant Bracer - Minor Agility -- 7779
	recipe = AddRecipe(7779, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(80, 80, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Minor Strength -- 7782
	recipe = AddRecipe(7782, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6347)
	recipe:SetSkillLevels(80, 80, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Minor Beastslayer -- 7786
	recipe = AddRecipe(7786, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6348)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Minor Striking -- 7788
	recipe = AddRecipe(7788, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant 2H Weapon - Lesser Intellect -- 7793
	recipe = AddRecipe(7793, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6349)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddVendor(3012, 3346, 5158, 5758)

	-- Runed Silver Rod -- 7795
	recipe = AddRecipe(7795, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6339)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Health -- 7857
	recipe = AddRecipe(7857, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(120, 120, 145, 165, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Lesser Spirit -- 7859
	recipe = AddRecipe(7859, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6375)
	recipe:SetSkillLevels(120, 120, 145, 165, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Lesser Fire Resistance -- 7861
	recipe = AddRecipe(7861, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(125, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Minor Stamina -- 7863
	recipe = AddRecipe(7863, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(125, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Minor Agility -- 7867
	recipe = AddRecipe(7867, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6377)
	recipe:SetSkillLevels(125, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(3012, 3537)

	-- Enchant Shield - Minor Stamina -- 13378
	recipe = AddRecipe(13378, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(105, 105, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant 2H Weapon - Lesser Spirit -- 13380
	recipe = AddRecipe(13380, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11038)
	recipe:SetSkillLevels(110, 110, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Minor Agility -- 13419
	recipe = AddRecipe(13419, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11039)
	recipe:SetSkillLevels(110, 110, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddVendor(3954, 12043)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Lesser Protection -- 13421
	recipe = AddRecipe(13421, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(115, 115, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Shield - Lesser Protection -- 13464
	recipe = AddRecipe(13464, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11081)
	recipe:SetSkillLevels(115, 115, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Shield - Lesser Spirit -- 13485
	recipe = AddRecipe(13485, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(130, 130, 155, 175, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Lesser Stamina -- 13501
	recipe = AddRecipe(13501, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(130, 130, 155, 175, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Lesser Striking -- 13503
	recipe = AddRecipe(13503, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Lesser Shadow Resistance -- 13522
	recipe = AddRecipe(13522, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11098)
	recipe:SetSkillLevels(135, 135, 160, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant 2H Weapon - Lesser Impact -- 13529
	recipe = AddRecipe(13529, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(145, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Lesser Strength -- 13536
	recipe = AddRecipe(13536, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11101)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(3954, 12043)

	-- Enchant Chest - Lesser Absorption -- 13538
	recipe = AddRecipe(13538, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Mana -- 13607
	recipe = AddRecipe(13607, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(145, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Mining -- 13612
	recipe = AddRecipe(13612, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11150)
	recipe:SetSkillLevels(145, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(1051, 1052, 1053, 1054, 1364)

	-- Enchant Gloves - Herbalism -- 13617
	recipe = AddRecipe(13617, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11151)
	recipe:SetSkillLevels(145, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(3834, 3919, 4028, 4029, 4030)

	-- Enchant Gloves - Fishing -- 13620
	recipe = AddRecipe(13620, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11152)
	recipe:SetSkillLevels(145, 145, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(2374, 2375, 2376, 2377, 14276)

	-- Enchant Bracer - Lesser Intellect -- 13622
	recipe = AddRecipe(13622, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Minor Stats -- 13626
	recipe = AddRecipe(13626, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Runed Golden Rod -- 13628
	recipe = AddRecipe(13628, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11130)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Shield - Lesser Stamina -- 13631
	recipe = AddRecipe(13631, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(155, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Defense -- 13635
	recipe = AddRecipe(13635, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(155, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Lesser Agility -- 13637
	recipe = AddRecipe(13637, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(160, 160, 180, 200, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Greater Health -- 13640
	recipe = AddRecipe(13640, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(160, 160, 180, 200, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Spirit -- 13642
	recipe = AddRecipe(13642, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(165, 165, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Lesser Stamina -- 13644
	recipe = AddRecipe(13644, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(170, 170, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Lesser Deflection -- 13646
	recipe = AddRecipe(13646, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11163)
	recipe:SetSkillLevels(170, 170, 190, 210, 230)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK)
	recipe:AddLimitedVendor(2821, 1)

	-- Enchant Bracer - Stamina -- 13648
	recipe = AddRecipe(13648, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(170, 170, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Lesser Beastslayer -- 13653
	recipe = AddRecipe(13653, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11164)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Lesser Elemental Slayer -- 13655
	recipe = AddRecipe(13655, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11165)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Cloak - Fire Resistance -- 13657
	recipe = AddRecipe(13657, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Shield - Spirit -- 13659
	recipe = AddRecipe(13659, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(180, 180, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Strength -- 13661
	recipe = AddRecipe(13661, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(180, 180, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Greater Mana -- 13663
	recipe = AddRecipe(13663, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(185, 185, 205, 225, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Lesser Spirit -- 13687
	recipe = AddRecipe(13687, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11167)
	recipe:SetSkillLevels(190, 190, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Shield - Lesser Block -- 13689
	recipe = AddRecipe(13689, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11168)
	recipe:SetSkillLevels(195, 195, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Weapon - Striking -- 13693
	recipe = AddRecipe(13693, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(195, 195, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant 2H Weapon - Impact -- 13695
	recipe = AddRecipe(13695, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Skinning -- 13698
	recipe = AddRecipe(13698, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11166)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(2556, 2557, 2558, 2606)

	-- Enchant Chest - Lesser Stats -- 13700
	recipe = AddRecipe(13700, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Runed Truesilver Rod -- 13702
	recipe = AddRecipe(13702, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11145)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Greater Defense -- 13746
	recipe = AddRecipe(13746, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(205, 205, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Resistance -- 13794
	recipe = AddRecipe(13794, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(205, 205, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Agility -- 13815
	recipe = AddRecipe(13815, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(210, 210, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Shield - Stamina -- 13817
	recipe = AddRecipe(13817, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11202)
	recipe:SetSkillLevels(210, 210, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Intellect -- 13822
	recipe = AddRecipe(13822, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(210, 210, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Stamina -- 13836
	recipe = AddRecipe(13836, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(215, 215, 235, 255, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Advanced Mining -- 13841
	recipe = AddRecipe(13841, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11203)
	recipe:SetSkillLevels(215, 215, 235, 255, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(674)

	-- Enchant Bracer - Greater Spirit -- 13846
	recipe = AddRecipe(13846, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11204)
	recipe:SetSkillLevels(220, 220, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Chest - Superior Health -- 13858
	recipe = AddRecipe(13858, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(220, 220, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Advanced Herbalism -- 13868
	recipe = AddRecipe(13868, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11205)
	recipe:SetSkillLevels(225, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(764, 765, 766, 1081, 14448)

	-- Enchant Cloak - Lesser Agility -- 13882
	recipe = AddRecipe(13882, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11206)
	recipe:SetSkillLevels(225, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Enchant Gloves - Strength -- 13887
	recipe = AddRecipe(13887, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Minor Speed -- 13890
	recipe = AddRecipe(13890, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Fiery Weapon -- 13898
	recipe = AddRecipe(13898, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11207)
	recipe:SetSkillLevels(265, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(9024)

	-- Enchant Shield - Greater Spirit -- 13905
	recipe = AddRecipe(13905, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(230, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Demonslaying -- 13915
	recipe = AddRecipe(13915, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11208)
	recipe:SetSkillLevels(230, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Chest - Superior Mana -- 13917
	recipe = AddRecipe(13917, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(230, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Deflection -- 13931
	recipe = AddRecipe(13931, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11223)
	recipe:SetSkillLevels(235, 235, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK)
	recipe:AddVendor(989, 4229)

	-- Enchant Shield - Frost Resistance -- 13933
	recipe = AddRecipe(13933, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11224)
	recipe:SetSkillLevels(235, 235, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Boots - Agility -- 13935
	recipe = AddRecipe(13935, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(235, 235, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant 2H Weapon - Greater Impact -- 13937
	recipe = AddRecipe(13937, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(240, 240, 260, 280, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Greater Strength -- 13939
	recipe = AddRecipe(13939, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(240, 240, 260, 280, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Stats -- 13941
	recipe = AddRecipe(13941, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(245, 245, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Greater Striking -- 13943
	recipe = AddRecipe(13943, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(245, 245, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Greater Stamina -- 13945
	recipe = AddRecipe(13945, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11225)
	recipe:SetSkillLevels(245, 245, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Gloves - Riding Skill -- 13947
	recipe = AddRecipe(13947, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11226)
	recipe:SetSkillLevels(250, 250, 270, 290, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Gloves - Minor Haste -- 13948
	recipe = AddRecipe(13948, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(250, 250, 270, 290, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Lesser Magic Wand -- 14293
	recipe = AddRecipe(14293, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11287)
	recipe:SetSkillLevels(10, 10, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Greater Magic Wand -- 14807
	recipe = AddRecipe(14807, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11288)
	recipe:SetSkillLevels(70, 70, 110, 130, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Lesser Mystic Wand -- 14809
	recipe = AddRecipe(14809, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11289)
	recipe:SetSkillLevels(155, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Greater Mystic Wand -- 14810
	recipe = AddRecipe(14810, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11290)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WAND)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Smoking Heart of the Mountain -- 15596
	recipe = AddRecipe(15596, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(45050)
	recipe:SetCraftedItemID(45050)
	recipe:SetSkillLevels(265, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddMobDrop(9025)

	-- Enchanted Thorium -- 17180
	recipe = AddRecipe(17180, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12655)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18747, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchanted Leather -- 17181
	recipe = AddRecipe(17181, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12810)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Greater Intellect -- 20008
	recipe = AddRecipe(20008, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(255, 255, 275, 295, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Superior Spirit -- 20009
	recipe = AddRecipe(20009, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16218)
	recipe:SetSkillLevels(270, 270, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Superior Strength -- 20010
	recipe = AddRecipe(20010, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16246)
	recipe:SetSkillLevels(295, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddMobDrop(7372)

	-- Enchant Bracer - Superior Stamina -- 20011
	recipe = AddRecipe(20011, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16251)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Gloves - Greater Agility -- 20012
	recipe = AddRecipe(20012, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16219)
	recipe:SetSkillLevels(270, 270, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Greater Strength -- 20013
	recipe = AddRecipe(20013, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(295, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Greater Resistance -- 20014
	recipe = AddRecipe(20014, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16216)
	recipe:SetSkillLevels(265, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Superior Defense -- 20015
	recipe = AddRecipe(20015, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16224)
	recipe:SetSkillLevels(285, 285, 300, 317, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddVendor(12022)

	-- Enchant Shield - Vitality -- 20016
	recipe = AddRecipe(20016, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16222)
	recipe:SetSkillLevels(280, 280, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Shield - Greater Stamina -- 20017
	recipe = AddRecipe(20017, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16217)
	recipe:SetSkillLevels(265, 265, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHIELD)
	recipe:AddVendor(4229, 4561)

	-- Enchant Boots - Greater Stamina -- 20020
	recipe = AddRecipe(20020, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16215)
	recipe:SetSkillLevels(260, 260, 280, 300, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Boots - Greater Agility -- 20023
	recipe = AddRecipe(20023, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16245)
	recipe:SetSkillLevels(295, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Boots - Spirit -- 20024
	recipe = AddRecipe(20024, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16220)
	recipe:SetSkillLevels(275, 275, 295, 315, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Enchant Chest - Greater Stats -- 20025
	recipe = AddRecipe(20025, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16253)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Enchant Chest - Major Health -- 20026
	recipe = AddRecipe(20026, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16221)
	recipe:SetSkillLevels(275, 275, 295, 315, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11189)

	-- Enchant Chest - Major Mana -- 20028
	recipe = AddRecipe(20028, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16242)
	recipe:SetSkillLevels(290, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Icy Chill -- 20029
	recipe = AddRecipe(20029, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16223)
	recipe:SetSkillLevels(285, 285, 300, 317, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(7524)

	-- Enchant 2H Weapon - Superior Impact -- 20030
	recipe = AddRecipe(20030, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16247)
	recipe:SetSkillLevels(295, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TWO_HAND)
	recipe:AddMobDrop(10317)

	-- Enchant Weapon - Superior Striking -- 20031
	recipe = AddRecipe(20031, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16250)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(9216)

	-- Enchant Weapon - Lifestealing -- 20032
	recipe = AddRecipe(20032, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(16254)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(10499)

	-- Enchant Weapon - Unholy Weapon -- 20033
	recipe = AddRecipe(20033, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16248)
	recipe:SetSkillLevels(295, 295, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(10398, 16810)

	-- Enchant Weapon - Crusader -- 20034
	recipe = AddRecipe(20034, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16252)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(4494, 9451)

	-- Enchant 2H Weapon - Major Spirit -- 20035
	recipe = AddRecipe(20035, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16255)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddMobDrop(10469)

	-- Enchant 2H Weapon - Major Intellect -- 20036
	recipe = AddRecipe(20036, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16249)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.TWO_HAND)
	recipe:AddMobDrop(10422)

	-- Runed Arcanite Rod -- 20051
	recipe = AddRecipe(20051, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16243)
	recipe:SetCraftedItemID(16207)
	recipe:SetSkillLevels(290, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE)
	recipe:AddVendor(12022)

	-- Enchant Weapon - Winter's Might -- 21931
	recipe = AddRecipe(21931, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(17725)
	recipe:SetSkillLevels(190, 190, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddSeason("WINTER_VEIL")

	-- Enchant Weapon - Spellpower -- 22749
	recipe = AddRecipe(22749, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18259)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom("MC_RANDOM")

	-- Enchant Weapon - Healing Power -- 22750
	recipe = AddRecipe(22750, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18260)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom("MC_RANDOM")

	-- Enchant Weapon - Strength -- 23799
	recipe = AddRecipe(23799, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19444)
	recipe:SetSkillLevels(290, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Enchant Weapon - Agility -- 23800
	recipe = AddRecipe(23800, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19445)
	recipe:SetSkillLevels(290, 290, 305, 322, 340)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Enchant Bracer - Mana Regeneration -- 23801
	recipe = AddRecipe(23801, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19446)
	recipe:SetSkillLevels(290, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Enchant Bracer - Healing Power -- 23802
	recipe = AddRecipe(23802, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19447)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Enchant Weapon - Mighty Spirit -- 23803
	recipe = AddRecipe(23803, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19448)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Enchant Weapon - Mighty Intellect -- 23804
	recipe = AddRecipe(23804, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19449)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Enchant Gloves - Threat -- 25072
	recipe = AddRecipe(25072, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20726)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.SHATAR)
	recipe:AddMobDrop(15275)
	recipe:AddRepVendor(FAC.SHATAR, REP.EXALTED, 21432)

	-- Enchant Gloves - Shadow Power -- 25073
	recipe = AddRecipe(25073, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20727)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Enchant Gloves - Frost Power -- 25074
	recipe = AddRecipe(25074, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20728)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Enchant Gloves - Fire Power -- 25078
	recipe = AddRecipe(25078, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20729)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Enchant Gloves - Healing Power -- 25079
	recipe = AddRecipe(25079, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(20730)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Enchant Gloves - Superior Agility -- 25080
	recipe = AddRecipe(25080, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(20731)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.EXALTED, 21643)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Enchant Cloak - Greater Fire Resistance -- 25081
	recipe = AddRecipe(25081, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20732)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15419)

	-- Enchant Cloak - Greater Nature Resistance -- 25082
	recipe = AddRecipe(25082, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20733)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15419)

	-- Enchant Cloak - Stealth -- 25083
	recipe = AddRecipe(25083, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33149)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOE, F.CENARION_EXPEDITION, F.CLOAK)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Enchant Cloak - Subtlety -- 25084
	recipe = AddRecipe(25084, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33151)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HELLFIRE, F.CLOAK)
	recipe:AddMobDrop(15276)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.EXALTED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.EXALTED, 17585)

	-- Enchant Cloak - Dodge -- 25086
	recipe = AddRecipe(25086, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33148)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.TANK, F.LOWERCITY, F.CLOAK)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.EXALTED, 21655)
	recipe:AddCustom("AQ40_RANDOM_BOP")

	-- Minor Wizard Oil -- 25124
	recipe = AddRecipe(25124, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20758)
	recipe:SetCraftedItemID(20744)
	recipe:SetSkillLevels(45, 45, 55, 65, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Minor Mana Oil -- 25125
	recipe = AddRecipe(25125, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20752)
	recipe:SetCraftedItemID(20745)
	recipe:SetSkillLevels(150, 150, 160, 170, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Lesser Wizard Oil -- 25126
	recipe = AddRecipe(25126, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20753)
	recipe:SetCraftedItemID(20746)
	recipe:SetSkillLevels(200, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(1318, 3012, 3346, 4228, 4617, 5158, 5757, 5758, 15419, 16635, 16722, 18753, 18773, 18951, 19234, 19537, 19540, 19663, 26569, 27030, 27054, 27147, 28714)

	-- Lesser Mana Oil -- 25127
	recipe = AddRecipe(25127, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20754)
	recipe:SetCraftedItemID(20747)
	recipe:SetSkillLevels(250, 250, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(15419)

	-- Wizard Oil -- 25128
	recipe = AddRecipe(25128, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20755)
	recipe:SetCraftedItemID(20750)
	recipe:SetSkillLevels(275, 275, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(15419)

	-- Brilliant Wizard Oil -- 25129
	recipe = AddRecipe(25129, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20756)
	recipe:SetCraftedItemID(20749)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Brilliant Mana Oil -- 25130
	recipe = AddRecipe(25130, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20757)
	recipe:SetCraftedItemID(20748)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Enchant 2H Weapon - Agility -- 27837
	recipe = AddRecipe(27837, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22392)
	recipe:SetSkillLevels(290, 290, 305, 322, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.TWO_HAND)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Enchant Bracer - Brawn -- 27899
	recipe = AddRecipe(27899, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Stats -- 27905
	recipe = AddRecipe(27905, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(315, 315, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Major Defense -- 27906
	recipe = AddRecipe(27906, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22530)
	recipe:SetSkillLevels(320, 320, 330, 345, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(22822, 23008)

	-- Enchant Bracer - Superior Healing -- 27911
	recipe = AddRecipe(27911, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24000)
	recipe:SetSkillLevels(325, 325, 335, 350, 365)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Enchant Bracer - Restore Mana Prime -- 27913
	recipe = AddRecipe(27913, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22532)
	recipe:SetSkillLevels(335, 335, 345, 360, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Enchant Bracer - Fortitude -- 27914
	recipe = AddRecipe(27914, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22533)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17803)

	-- Enchant Bracer - Spellpower -- 27917
	recipe = AddRecipe(27917, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22534)
	recipe:SetSkillLevels(360, 360, 370, 385, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19952)

	-- Enchant Ring - Striking -- 27920
	recipe = AddRecipe(27920, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22535)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM, F.RING)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 17518)

	-- Enchant Ring - Spellpower -- 27924
	recipe = AddRecipe(27924, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22536)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KOT, F.RING)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Enchant Ring - Healing Power -- 27926
	recipe = AddRecipe(27926, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22537)
	recipe:SetSkillLevels(370, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.RING)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Enchant Ring - Stats -- 27927
	recipe = AddRecipe(27927, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22538)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LOWERCITY, F.RING)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.HONORED, 21655)

	-- Enchant Shield - Tough Shield -- 27944
	recipe = AddRecipe(27944, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Shield - Intellect -- 27945
	recipe = AddRecipe(27945, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22539)
	recipe:SetSkillLevels(325, 325, 335, 350, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.SHIELD)
	recipe:AddVendor(18664)

	-- Enchant Shield - Shield Block -- 27946
	recipe = AddRecipe(27946, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22540)
	recipe:SetSkillLevels(340, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.SHIELD)
	recipe:AddWorldDrop("Outland")

	-- Enchant Shield - Resistance -- 27947
	recipe = AddRecipe(27947, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22541)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddWorldDrop("Outland")

	-- Enchant Boots - Vitality -- 27948
	recipe = AddRecipe(27948, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22542)
	recipe:SetSkillLevels(305, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(24664)

	-- Enchant Boots - Fortitude -- 27950
	recipe = AddRecipe(27950, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22543)
	recipe:SetSkillLevels(320, 320, 330, 345, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18317)

	-- Enchant Boots - Dexterity -- 27951
	recipe = AddRecipe(27951, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22544)
	recipe:SetSkillLevels(340, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddMobDrop(18521)

	-- Enchant Boots - Surefooted -- 27954
	recipe = AddRecipe(27954, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22545)
	recipe:SetSkillLevels(370, 370, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.CASTER)
	recipe:AddMobDrop(16472)

	-- Enchant Chest - Exceptional Health -- 27957
	recipe = AddRecipe(27957, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(315, 315, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Exceptional Mana -- 27958
	recipe = AddRecipe(27958, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Exceptional Stats -- 27960
	recipe = AddRecipe(27960, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22547)
	recipe:SetSkillLevels(345, 345, 355, 367, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.REVERED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.REVERED, 17585)

	-- Enchant Cloak - Major Armor -- 27961
	recipe = AddRecipe(27961, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Major Resistance -- 27962
	recipe = AddRecipe(27962, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22548)
	recipe:SetSkillLevels(330, 330, 340, 355, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddWorldDrop("Outland")

	-- Enchant Weapon - Major Striking -- 27967
	recipe = AddRecipe(27967, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22552)
	recipe:SetSkillLevels(340, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Enchant Weapon - Major Intellect -- 27968
	recipe = AddRecipe(27968, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22551)
	recipe:SetSkillLevels(340, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(20136)

	-- Enchant 2H Weapon - Savagery -- 27971
	recipe = AddRecipe(27971, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22554)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddMobDrop(17465)

	-- Enchant Weapon - Potency -- 27972
	recipe = AddRecipe(27972, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22553)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Outland")

	-- Enchant Weapon - Major Spellpower -- 27975
	recipe = AddRecipe(27975, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22555)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(22242)

	-- Enchant 2H Weapon - Major Agility -- 27977
	recipe = AddRecipe(27977, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22556)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddMobDrop(20880)

	-- Enchant Weapon - Sunfire -- 27981
	recipe = AddRecipe(27981, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(22560)
	recipe:SetSkillLevels(375, 375, 375, 375, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(16524)

	-- Enchant Weapon - Soulfrost -- 27982
	recipe = AddRecipe(27982, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(22561)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(15688)

	-- Enchant Weapon - Mongoose -- 27984
	recipe = AddRecipe(27984, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(22559)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddMobDrop(15687)

	-- Enchant Weapon - Spellsurge -- 28003
	recipe = AddRecipe(28003, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22558)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Outland")

	-- Enchant Weapon - Battlemaster -- 28004
	recipe = AddRecipe(28004, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22557)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddWorldDrop("Outland")

	-- Superior Mana Oil -- 28016
	recipe = AddRecipe(28016, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22562)
	recipe:SetCraftedItemID(22521)
	recipe:SetSkillLevels(310, 310, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16635, 16722)
	recipe:AddLimitedVendor(19663, 1)

	-- Superior Wizard Oil -- 28019
	recipe = AddRecipe(28019, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22563)
	recipe:SetCraftedItemID(22522)
	recipe:SetSkillLevels(340, 340, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16635, 16722)
	recipe:AddLimitedVendor(19663, 1)

	-- Large Prismatic Shard -- 28022
	recipe = AddRecipe(28022, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22565)
	recipe:SetCraftedItemID(22449)
	recipe:SetSkillLevels(335, 335, 335, 335, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16635, 16722)
	recipe:AddLimitedVendor(19663, 1)

	-- Prismatic Sphere -- 28027
	recipe = AddRecipe(28027, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22460)
	recipe:SetSkillLevels(325, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Void Sphere -- 28028
	recipe = AddRecipe(28028, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22459)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Runed Fel Iron Rod -- 32664
	recipe = AddRecipe(32664, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22461)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Runed Adamantite Rod -- 32665
	recipe = AddRecipe(32665, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25848)
	recipe:SetCraftedItemID(22462)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE)
	recipe:AddVendor(18960, 19004)

	-- Runed Eternium Rod -- 32667
	recipe = AddRecipe(32667, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25849)
	recipe:SetCraftedItemID(22463)
	recipe:SetSkillLevels(375, 375, 375, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)
	recipe:AddLimitedVendor(19663, 1)

	-- Enchant Chest - Major Spirit -- 33990
	recipe = AddRecipe(33990, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(320, 320, 330, 345, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Restore Mana Prime -- 33991
	recipe = AddRecipe(33991, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Chest - Major Resilience -- 33992
	recipe = AddRecipe(33992, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(28270)
	recipe:SetSkillLevels(345, 345, 355, 367, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Enchant Gloves - Blasting -- 33993
	recipe = AddRecipe(33993, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Precise Strikes -- 33994
	recipe = AddRecipe(33994, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(28271)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Enchant Gloves - Major Strength -- 33995
	recipe = AddRecipe(33995, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(340, 340, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Assault -- 33996
	recipe = AddRecipe(33996, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Gloves - Major Spellpower -- 33997
	recipe = AddRecipe(33997, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(28272)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Enchant Gloves - Major Healing -- 33999
	recipe = AddRecipe(33999, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(28273)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Enchant Bracer - Major Intellect -- 34001
	recipe = AddRecipe(34001, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 315, 330, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Bracer - Assault -- 34002
	recipe = AddRecipe(34002, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Spell Penetration -- 34003
	recipe = AddRecipe(34003, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(28274)
	recipe:SetSkillLevels(325, 325, 335, 350, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER, F.CONSORTIUM, F.CLOAK)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Enchant Cloak - Greater Agility -- 34004
	recipe = AddRecipe(34004, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Greater Arcane Resistance -- 34005
	recipe = AddRecipe(34005, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(28276)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddMobDrop(19796)

	-- Enchant Cloak - Greater Shadow Resistance -- 34006
	recipe = AddRecipe(34006, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(28277)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddMobDrop(18870)

	-- Enchant Boots - Cat's Swiftness -- 34007
	recipe = AddRecipe(34007, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(28279)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddMobDrop(24664)

	-- Enchant Boots - Boar's Speed -- 34008
	recipe = AddRecipe(34008, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(28280)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(24664)

	-- Enchant Shield - Major Stamina -- 34009
	recipe = AddRecipe(34009, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(28282)
	recipe:SetSkillLevels(325, 325, 335, 350, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.SHIELD)
	recipe:AddLimitedVendor(19663, 1)

	-- Enchant Weapon - Major Healing -- 34010
	recipe = AddRecipe(34010, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(28281)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Nexus Transformation -- 42613
	recipe = AddRecipe(42613, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22448)
	recipe:SetSkillLevels(335, 335, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Small Prismatic Shard -- 42615
	recipe = AddRecipe(42615, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22448)
	recipe:SetSkillLevels(335, 335, 335, 335, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Greater Agility -- 42620
	recipe = AddRecipe(42620, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33165)
	recipe:SetSkillLevels(350, 350, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.VIOLETEYE, F.ONE_HAND, F.TWO_HAND)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.EXALTED, 18255)

	-- Enchant Weapon - Executioner -- 42974
	recipe = AddRecipe(42974, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33307)
	recipe:SetCraftedItemID(33307)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom("ZA_RANDOM")

	-- Enchant Shield - Resilience -- 44383
	recipe = AddRecipe(44383, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(330, 330, 340, 355, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHIELD)
	recipe:AddTrainer(3345, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Cloak - Superior Frost Resistance -- 44483
	recipe = AddRecipe(44483, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37332)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(32289)

	-- Enchant Gloves - Expertise -- 44484
	recipe = AddRecipe(44484, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Precision -- 44488
	recipe = AddRecipe(44488, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Shield - Defense -- 44489
	recipe = AddRecipe(44489, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.SHIELD)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Mighty Health -- 44492
	recipe = AddRecipe(44492, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Superior Nature Resistance -- 44494
	recipe = AddRecipe(44494, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37333)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(32290)

	-- Enchant Cloak - Superior Agility -- 44500
	recipe = AddRecipe(44500, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Gatherer -- 44506
	recipe = AddRecipe(44506, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Greater Spirit -- 44508
	recipe = AddRecipe(44508, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Greater Mana Restoration -- 44509
	recipe = AddRecipe(44509, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Exceptional Spirit -- 44510
	recipe = AddRecipe(44510, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Greater Assault -- 44513
	recipe = AddRecipe(44513, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Icebreaker -- 44524
	recipe = AddRecipe(44524, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(37344)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Boots - Greater Fortitude -- 44528
	recipe = AddRecipe(44528, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(385, 385, 385, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Major Agility -- 44529
	recipe = AddRecipe(44529, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(415, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Bracers - Exceptional Intellect -- 44555
	recipe = AddRecipe(44555, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 385, 392, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Superior Fire Resistance -- 44556
	recipe = AddRecipe(44556, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37331)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(30921)

	-- Enchant Bracers - Greater Assault -- 44575
	recipe = AddRecipe(44575, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44484)
	recipe:SetSkillLevels(430, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Lifeward -- 44576
	recipe = AddRecipe(44576, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44494)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Cloak - Spell Piercing -- 44582
	recipe = AddRecipe(44582, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 395, 402, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.CLOAK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Greater Vitality -- 44584
	recipe = AddRecipe(44584, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Exceptional Resilience -- 44588
	recipe = AddRecipe(44588, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37340)
	recipe:SetSkillLevels(410, 410, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Boots - Superior Agility -- 44589
	recipe = AddRecipe(44589, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(415, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Superior Shadow Resistance -- 44590
	recipe = AddRecipe(44590, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37334)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(32349)

	-- Enchant Cloak - Titanweave -- 44591
	recipe = AddRecipe(44591, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37347)
	recipe:SetSkillLevels(435, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Gloves - Exceptional Spellpower -- 44592
	recipe = AddRecipe(44592, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Bracers - Major Spirit -- 44593
	recipe = AddRecipe(44593, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant 2H Weapon - Scourgebane -- 44595
	recipe = AddRecipe(44595, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44473)
	recipe:SetCraftedItemID(44473)
	recipe:SetSkillLevels(430, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Cloak - Superior Arcane Resistance -- 44596
	recipe = AddRecipe(44596, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37330)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddMobDrop(31702, 32297)

	-- Enchant Bracers - Expertise -- 44598
	recipe = AddRecipe(44598, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(415, 415, 425, 435, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Bracers - Greater Stats -- 44616
	recipe = AddRecipe(44616, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Giant Slayer -- 44621
	recipe = AddRecipe(44621, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(37339)
	recipe:SetSkillLevels(430, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Chest - Super Stats -- 44623
	recipe = AddRecipe(44623, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(370, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Armsman -- 44625
	recipe = AddRecipe(44625, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44485)
	recipe:SetSkillLevels(435, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Exceptional Spellpower -- 44629
	recipe = AddRecipe(44629, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant 2H Weapon - Greater Savagery -- 44630
	recipe = AddRecipe(44630, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(390, 390, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Shadow Armor -- 44631
	recipe = AddRecipe(44631, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(37349)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Exceptional Agility -- 44633
	recipe = AddRecipe(44633, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 430, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Bracers - Greater Spellpower -- 44635
	recipe = AddRecipe(44635, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Ring - Greater Spellpower -- 44636
	recipe = AddRecipe(44636, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Ring - Assault -- 44645
	recipe = AddRecipe(44645, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Void Shatter -- 45765
	recipe = AddRecipe(45765, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(34872)
	recipe:SetCraftedItemID(22449)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25032)

	-- Enchant Weapon - Deathfrost -- 46578
	recipe = AddRecipe(46578, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35498)
	recipe:SetCraftedItemID(35498)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddSeason("MIDSUMMER")

	-- Enchant Chest - Defense -- 46594
	recipe = AddRecipe(46594, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(35500)
	recipe:SetSkillLevels(360, 360, 370, 385, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25032)

	-- Enchant Cloak - Steelweave -- 47051
	recipe = AddRecipe(47051, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35756)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddMobDrop(24560)

	-- Enchant Cloak - Mighty Armor -- 47672
	recipe = AddRecipe(47672, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44471)
	recipe:SetSkillLevels(430, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Chest - Greater Defense -- 47766
	recipe = AddRecipe(47766, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Greater Speed -- 47898
	recipe = AddRecipe(47898, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44472)
	recipe:SetSkillLevels(430, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Cloak - Wisdom -- 47899
	recipe = AddRecipe(47899, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44488)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddVendor(32514)

	-- Enchant Chest - Super Health -- 47900
	recipe = AddRecipe(47900, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Tuskarr's Vitality -- 47901
	recipe = AddRecipe(47901, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44491)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Accuracy -- 59619
	recipe = AddRecipe(59619, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44496)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Berserking -- 59621
	recipe = AddRecipe(59621, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44492)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Black Magic -- 59625
	recipe = AddRecipe(59625, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44495)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Ring - Stamina -- 59636
	recipe = AddRecipe(59636, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Assault -- 60606
	recipe = AddRecipe(60606, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Speed -- 60609
	recipe = AddRecipe(60609, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Bracers - Striking -- 60616
	recipe = AddRecipe(60616, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Runed Titanium Rod -- 60619
	recipe = AddRecipe(60619, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44452)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Greater Potency -- 60621
	recipe = AddRecipe(60621, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(380, 380, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Icewalker -- 60623
	recipe = AddRecipe(60623, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(385, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Shield - Greater Intellect -- 60653
	recipe = AddRecipe(60653, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHIELD)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Major Agility -- 60663
	recipe = AddRecipe(60663, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Crusher -- 60668
	recipe = AddRecipe(60668, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant 2H Weapon - Massacre -- 60691
	recipe = AddRecipe(60691, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44483)
	recipe:SetSkillLevels(430, 430, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Chest - Powerful Stats -- 60692
	recipe = AddRecipe(60692, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44489)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Superior Potency -- 60707
	recipe = AddRecipe(60707, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44486)
	recipe:SetSkillLevels(435, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Weapon - Mighty Spellpower -- 60714
	recipe = AddRecipe(60714, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44487)
	recipe:SetSkillLevels(435, 435, 445, 455, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND, F.TWO_HAND)
	recipe:AddVendor(32514)

	-- Enchant Boots - Greater Assault -- 60763
	recipe = AddRecipe(60763, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44490)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(32514)

	-- Enchant Bracers - Superior Spellpower -- 60767
	recipe = AddRecipe(60767, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44498)
	recipe:SetCraftedItemID(44498)
	recipe:SetSkillLevels(440, 440, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(32514)

	-- Enchant Bracers - Major Stamina -- 62256
	recipe = AddRecipe(62256, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44944)
	recipe:SetCraftedItemID(44944)
	recipe:SetSkillLevels(450, 450, 460, 470, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(32514)

	-- Enchant Staff - Greater Spellpower -- 62948
	recipe = AddRecipe(62948, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(45059)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.STAFF)
	recipe:AddVendor(32514)

	-- Enchant Staff - Spellpower -- 62959
	recipe = AddRecipe(62959, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(385, 385, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.STAFF)
	recipe:AddTrainer(3345, 19251, 19252, 26906, 26954, 26980, 26990, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Lesser Accuracy -- 63746
	recipe = AddRecipe(63746, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1317, 3011, 3345, 3606, 4213, 4616, 5157, 5695, 7949, 11072, 11073, 11074, 16160, 16633, 16725, 18753, 18773, 19251, 19252, 19540, 33583, 33610, 33633, 33676)

	-- Enchant Weapon - Blade Ward -- 64441
	recipe = AddRecipe(64441, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(46027)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Enchant Weapon - Blood Draining -- 64579
	recipe = AddRecipe(64579, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(46348)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.ONE_HAND, F.TWO_HAND)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Abyssal Shatter -- 69412
	recipe = AddRecipe(69412, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(49640)
	recipe:SetSkillLevels(445, 445, 445, 447, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3345, 26906, 26954, 26980, 26990, 28693, 33633)

	-- Enchant Gloves - Angler -- 71692
	recipe = AddRecipe(71692, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 385, 392, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOP, F.RBOP)
	recipe:AddMobDrop(26336, 26343, 26344)

	-- Enchant Gloves - Mastery -- 74132
	recipe = AddRecipe(74132, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Earthen Vitality -- 74189
	recipe = AddRecipe(74189, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Mighty Stats -- 74191
	recipe = AddRecipe(74191, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Greater Spell Piercing -- 74192
	recipe = AddRecipe(74192, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Speed -- 74193
	recipe = AddRecipe(74193, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 460, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Mending -- 74195
	recipe = AddRecipe(74195, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Avalanche -- 74197
	recipe = AddRecipe(74197, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 460, 462, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Haste -- 74198
	recipe = AddRecipe(74198, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(455, 455, 465, 475, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Haste -- 74199
	recipe = AddRecipe(74199, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(455, 455, 465, 475, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Stamina -- 74200
	recipe = AddRecipe(74200, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(460, 460, 470, 480, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Critical Strike -- 74201
	recipe = AddRecipe(74201, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(460, 460, 470, 480, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Intellect -- 74202
	recipe = AddRecipe(74202, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(465, 465, 475, 485, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Shield - Protection -- 74207
	recipe = AddRecipe(74207, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(465, 465, 475, 485, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Elemental Slayer -- 74211
	recipe = AddRecipe(74211, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(470, 470, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Exceptional Strength -- 74212
	recipe = AddRecipe(74212, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(470, 470, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Major Agility -- 74213
	recipe = AddRecipe(74213, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Mighty Resilience -- 74214
	recipe = AddRecipe(74214, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Ring - Strength -- 74215
	recipe = AddRecipe(74215, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Ring - Agility -- 74216
	recipe = AddRecipe(74216, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Ring - Intellect -- 74217
	recipe = AddRecipe(74217, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Ring - Greater Stamina -- 74218
	recipe = AddRecipe(74218, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Gloves - Greater Expertise -- 74220
	recipe = AddRecipe(74220, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(480, 480, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Hurricane -- 74223
	recipe = AddRecipe(74223, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(480, 480, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Heartsong -- 74225
	recipe = AddRecipe(74225, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(485, 485, 495, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Shield - Blocking -- 74226
	recipe = AddRecipe(74226, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(485, 485, 495, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Dodge -- 74229
	recipe = AddRecipe(74229, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(490, 490, 500, 510, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Critical Strike -- 74230
	recipe = AddRecipe(74230, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(490, 490, 500, 510, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Chest - Exceptional Spirit -- 74231
	recipe = AddRecipe(74231, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(495, 495, 505, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Precision -- 74232
	recipe = AddRecipe(74232, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(495, 495, 505, 515, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Protection -- 74234
	recipe = AddRecipe(74234, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 520, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Off-Hand - Superior Intellect -- 74235
	recipe = AddRecipe(74235, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 520, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Precision -- 74236
	recipe = AddRecipe(74236, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(505, 505, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Exceptional Spirit -- 74237
	recipe = AddRecipe(74237, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(505, 505, 515, 525, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Boots - Mastery -- 74238
	recipe = AddRecipe(74238, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 520, 530, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Greater Expertise -- 74239
	recipe = AddRecipe(74239, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 520, 530, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Cloak - Greater Intellect -- 74240
	recipe = AddRecipe(74240, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 520, 530, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Weapon - Power Torrent -- 74242
	recipe = AddRecipe(74242, V.CATA, Q.RARE)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Weapon - Windwalk -- 74244
	recipe = AddRecipe(74244, V.CATA, Q.RARE)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Weapon - Landslide -- 74246
	recipe = AddRecipe(74246, V.CATA, Q.RARE)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Cloak - Greater Critical Strike -- 74247
	recipe = AddRecipe(74247, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Bracer - Greater Critical Strike -- 74248
	recipe = AddRecipe(74248, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Chest - Peerless Stats -- 74250
	recipe = AddRecipe(74250, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Chest - Greater Stamina -- 74251
	recipe = AddRecipe(74251, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Boots - Assassin's Step -- 74252
	recipe = AddRecipe(74252, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Boots - Lavawalker -- 74253
	recipe = AddRecipe(74253, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Gloves - Mighty Strength -- 74254
	recipe = AddRecipe(74254, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(64415)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Gloves - Greater Mastery -- 74255
	recipe = AddRecipe(74255, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchant Bracer - Greater Speed -- 74256
	recipe = AddRecipe(74256, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(525, 525, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Runed Elementium Rod -- 92370
	recipe = AddRecipe(92370, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(65359)
	recipe:SetSkillLevels(515, 515, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(50134, 50146)

	-- Enchanted Lantern -- 93841
	recipe = AddRecipe(93841, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(67308)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50146)

	-- Magic Lamp -- 93843
	recipe = AddRecipe(93843, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(67312)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50134)

	-- Enchant 2H Weapon - Mighty Agility -- 95471
	recipe = AddRecipe(95471, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(470, 470, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1317, 3011, 3345, 4213, 4616, 5157, 16633, 19251, 19252, 28693, 33583, 33610, 33633)

	-- Enchant Bracer - Major Strength -- 96261
	recipe = AddRecipe(96261, V.CATA, Q.RARE)
	recipe:SetSkillLevels(515, 515, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Mighty Intellect -- 96262
	recipe = AddRecipe(96262, V.CATA, Q.RARE)
	recipe:SetSkillLevels(515, 515, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Enchant Bracer - Agility -- 96264
	recipe = AddRecipe(96264, V.CATA, Q.RARE)
	recipe:SetSkillLevels(515, 515, 525, 532, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	self.InitEnchanting = nil
end
