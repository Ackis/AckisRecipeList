--[[
************************************************************************
Jewelcrafting.lua
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
function addon:InitJewelcrafting()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 25229, genesis, quality)
	end

	private:InitializeJewelcraftingTrainers()

	local recipe

	-- Delicate Copper Wire -- 25255
	recipe = AddRecipe(25255, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20816)
	recipe:SetSkillLevels(1, 1, 20, 35, 50)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Bronze Setting -- 25278
	recipe = AddRecipe(25278, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20817)
	recipe:SetSkillLevels(50, 50, 70, 80, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Elegant Silver Ring -- 25280
	recipe = AddRecipe(25280, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20818)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Inlaid Malachite Ring -- 25283
	recipe = AddRecipe(25283, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20821)
	recipe:SetSkillLevels(30, 30, 60, 75, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Simple Pearl Ring -- 25284
	recipe = AddRecipe(25284, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20820)
	recipe:SetSkillLevels(60, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Gloom Band -- 25287
	recipe = AddRecipe(25287, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20823)
	recipe:SetSkillLevels(70, 70, 100, 115, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Heavy Silver Ring -- 25305
	recipe = AddRecipe(25305, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20826)
	recipe:SetSkillLevels(90, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Ring of Silver Might -- 25317
	recipe = AddRecipe(25317, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20827)
	recipe:SetSkillLevels(80, 80, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Ring of Twilight Shadows -- 25318
	recipe = AddRecipe(25318, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20828)
	recipe:SetSkillLevels(100, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Heavy Golden Necklace of Battle -- 25320
	recipe = AddRecipe(25320, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20856)
	recipe:SetCraftedItemID(20856)
	recipe:SetSkillLevels(150, 150, 180, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.NECK)
	recipe:AddLimitedVendor(1286, 1, 3367, 1, 16624, 1, 17512, 1)

	-- Moonsoul Crown -- 25321
	recipe = AddRecipe(25321, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20832)
	recipe:SetSkillLevels(120, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Wicked Moonstone Ring -- 25323
	recipe = AddRecipe(25323, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20855)
	recipe:SetCraftedItemID(20833)
	recipe:SetSkillLevels(125, 125, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddLimitedVendor(3499, 1, 3954, 1)

	-- Amulet of the Moon -- 25339
	recipe = AddRecipe(25339, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20854)
	recipe:SetCraftedItemID(20830)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddLimitedVendor(4229, 1, 4561, 1, 16624, 1, 17512, 1)

	-- Solid Bronze Ring -- 25490
	recipe = AddRecipe(25490, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20907)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Braided Copper Ring -- 25493
	recipe = AddRecipe(25493, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20906)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Barbaric Iron Collar -- 25498
	recipe = AddRecipe(25498, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20909)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Pendant of the Agate Shield -- 25610
	recipe = AddRecipe(25610, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20970)
	recipe:SetCraftedItemID(20950)
	recipe:SetSkillLevels(120, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.NECK)
	recipe:AddTrainer(33637)
	recipe:AddVendor(1448)

	-- Heavy Iron Knuckles -- 25612
	recipe = AddRecipe(25612, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20971)
	recipe:SetCraftedItemID(20954)
	recipe:SetSkillLevels(125, 125, 155, 170, 185)
	recipe:AddFilters(F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.FIST)
	recipe:AddTrainer(33637)
	recipe:AddLimitedVendor(2393, 1)

	-- Golden Dragon Ring -- 25613
	recipe = AddRecipe(25613, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20955)
	recipe:SetSkillLevels(135, 135, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Mithril Filigree -- 25615
	recipe = AddRecipe(25615, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20963)
	recipe:SetSkillLevels(150, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Blazing Citrine Ring -- 25617
	recipe = AddRecipe(25617, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20973)
	recipe:SetCraftedItemID(20958)
	recipe:SetSkillLevels(150, 150, 180, 195, 210)
	recipe:AddFilters(F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(33637)
	recipe:AddLimitedVendor(9636, 1)

	-- Jade Pendant of Blasting -- 25618
	recipe = AddRecipe(25618, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(20974)
	recipe:SetCraftedItemID(20966)
	recipe:SetSkillLevels(160, 160, 190, 205, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- The Jade Eye -- 25619
	recipe = AddRecipe(25619, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(20975)
	recipe:SetCraftedItemID(20959)
	recipe:SetSkillLevels(170, 170, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.RING)
	recipe:AddLimitedVendor(4775, 1, 5163, 1, 16624, 1, 17512, 1)

	-- Engraved Truesilver Ring -- 25620
	recipe = AddRecipe(25620, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20960)
	recipe:SetSkillLevels(170, 170, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Citrine Ring of Rapid Healing -- 25621
	recipe = AddRecipe(25621, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20961)
	recipe:SetSkillLevels(180, 180, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Citrine Pendant of Golden Healing -- 25622
	recipe = AddRecipe(25622, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(20976)
	recipe:SetCraftedItemID(20967)
	recipe:SetSkillLevels(190, 190, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Figurine - Jade Owl -- 26872
	recipe = AddRecipe(26872, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21748)
	recipe:SetSkillLevels(200, 200, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Figurine - Golden Hare -- 26873
	recipe = AddRecipe(26873, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21940)
	recipe:SetCraftedItemID(21756)
	recipe:SetSkillLevels(200, 200, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Aquamarine Signet -- 26874
	recipe = AddRecipe(26874, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20964)
	recipe:SetSkillLevels(210, 210, 235, 250, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Figurine - Black Pearl Panther -- 26875
	recipe = AddRecipe(26875, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21941)
	recipe:SetCraftedItemID(21758)
	recipe:SetSkillLevels(215, 215, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE, F.DPS, F.TRINKET)
	recipe:AddVendor(4897)
	recipe:AddLimitedVendor(989, 1)

	-- Aquamarine Pendant of the Warrior -- 26876
	recipe = AddRecipe(26876, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21755)
	recipe:SetSkillLevels(220, 220, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Ruby Crown of Restoration -- 26878
	recipe = AddRecipe(26878, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21942)
	recipe:SetCraftedItemID(20969)
	recipe:SetSkillLevels(225, 225, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(2810, 1, 2821, 1)

	-- Thorium Setting -- 26880
	recipe = AddRecipe(26880, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21752)
	recipe:SetSkillLevels(225, 225, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Figurine - Truesilver Crab -- 26881
	recipe = AddRecipe(26881, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21943)
	recipe:SetCraftedItemID(21760)
	recipe:SetSkillLevels(225, 225, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE, F.TANK, F.TRINKET)
	recipe:AddLimitedVendor(1148, 1, 4897, 1)

	-- Figurine - Truesilver Boar -- 26882
	recipe = AddRecipe(26882, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21944)
	recipe:SetCraftedItemID(21763)
	recipe:SetSkillLevels(235, 235, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.DPS, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ruby Pendant of Fire -- 26883
	recipe = AddRecipe(26883, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21764)
	recipe:SetSkillLevels(235, 235, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Truesilver Healing Ring -- 26885
	recipe = AddRecipe(26885, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21765)
	recipe:SetSkillLevels(240, 240, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- The Aquamarine Ward -- 26887
	recipe = AddRecipe(26887, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21945)
	recipe:SetCraftedItemID(21754)
	recipe:SetSkillLevels(245, 245, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.RING)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gem Studded Band -- 26896
	recipe = AddRecipe(26896, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21947)
	recipe:SetCraftedItemID(21753)
	recipe:SetSkillLevels(250, 250, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Opal Necklace of Impact -- 26897
	recipe = AddRecipe(26897, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21948)
	recipe:SetCraftedItemID(21766)
	recipe:SetSkillLevels(250, 250, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.NECK)
	recipe:AddLimitedVendor(5163, 1, 8363, 1, 16624, 1, 17512, 1)

	-- Figurine - Ruby Serpent -- 26900
	recipe = AddRecipe(26900, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21949)
	recipe:SetCraftedItemID(21769)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Simple Opal Ring -- 26902
	recipe = AddRecipe(26902, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21767)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Sapphire Signet -- 26903
	recipe = AddRecipe(26903, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21768)
	recipe:SetSkillLevels(275, 275, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Emerald Crown of Destruction -- 26906
	recipe = AddRecipe(26906, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21952)
	recipe:SetCraftedItemID(21774)
	recipe:SetSkillLevels(275, 275, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(15179, 1)

	-- Onslaught Ring -- 26907
	recipe = AddRecipe(26907, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21775)
	recipe:SetSkillLevels(280, 280, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Sapphire Pendant of Winter Night -- 26908
	recipe = AddRecipe(26908, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21790)
	recipe:SetSkillLevels(280, 280, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Figurine - Emerald Owl -- 26909
	recipe = AddRecipe(26909, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21953)
	recipe:SetCraftedItemID(21777)
	recipe:SetSkillLevels(285, 285, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ring of Bitter Shadows -- 26910
	recipe = AddRecipe(26910, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21954)
	recipe:SetCraftedItemID(21778)
	recipe:SetSkillLevels(285, 285, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(12941)

	-- Living Emerald Pendant -- 26911
	recipe = AddRecipe(26911, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21791)
	recipe:SetSkillLevels(290, 290, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Figurine - Black Diamond Crab -- 26912
	recipe = AddRecipe(26912, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21955)
	recipe:SetCraftedItemID(21784)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOP, F.TANK, F.TRINKET)
	recipe:AddMobDrop(9736)

	-- Figurine - Dark Iron Scorpid -- 26914
	recipe = AddRecipe(26914, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(21956)
	recipe:SetCraftedItemID(21789)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddMobDrop(8983)

	-- Necklace of the Diamond Tower -- 26915
	recipe = AddRecipe(26915, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(21957)
	recipe:SetCraftedItemID(21792)
	recipe:SetSkillLevels(305, 305, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.NECK)
	recipe:AddVendor(11189)

	-- Band of Natural Fire -- 26916
	recipe = AddRecipe(26916, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21779)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Woven Copper Ring -- 26925
	recipe = AddRecipe(26925, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21931)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Heavy Copper Ring -- 26926
	recipe = AddRecipe(26926, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21932)
	recipe:SetSkillLevels(5, 5, 35, 50, 65)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Thick Bronze Necklace -- 26927
	recipe = AddRecipe(26927, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21933)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Ornate Tigerseye Necklace -- 26928
	recipe = AddRecipe(26928, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21934)
	recipe:SetSkillLevels(30, 30, 60, 75, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Brilliant Blood Garnet -- 28903
	recipe = AddRecipe(28903, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23133)
	recipe:SetCraftedItemID(23094)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.FRIENDLY, 19331)

	-- Bold Blood Garnet -- 28905
	recipe = AddRecipe(28905, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23131)
	recipe:SetCraftedItemID(23095)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Inscribed Flame Spessarite -- 28910
	recipe = AddRecipe(28910, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23135)
	recipe:SetCraftedItemID(23098)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Reckless Flame Spessarite -- 28912
	recipe = AddRecipe(28912, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23136)
	recipe:SetCraftedItemID(23099)
	recipe:SetSkillLevels(305, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Glinting Shadow Draenite -- 28914
	recipe = AddRecipe(28914, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23137)
	recipe:SetCraftedItemID(23100)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Potent Flame Spessarite -- 28915
	recipe = AddRecipe(28915, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23138)
	recipe:SetCraftedItemID(23101)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.FRIENDLY, 21655)

	-- Radiant Deep Peridot -- 28916
	recipe = AddRecipe(28916, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23140)
	recipe:SetCraftedItemID(23103)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddTrainer(18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33614, 33637, 33680)

	-- Jagged Deep Peridot -- 28917
	recipe = AddRecipe(28917, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23141)
	recipe:SetCraftedItemID(23104)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Regal Deep Peridot -- 28918
	recipe = AddRecipe(28918, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31359)
	recipe:SetCraftedItemID(23105)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Timeless Shadow Draenite -- 28925
	recipe = AddRecipe(28925, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23108)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33614, 33637, 33680)

	-- Purified Shadow Draenite -- 28927
	recipe = AddRecipe(28927, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23145)
	recipe:SetCraftedItemID(23109)
	recipe:SetSkillLevels(305, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Shifting Shadow Draenite -- 28933
	recipe = AddRecipe(28933, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23146)
	recipe:SetCraftedItemID(23110)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Sovereign Shadow Draenite -- 28936
	recipe = AddRecipe(28936, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23147)
	recipe:SetCraftedItemID(23111)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Smooth Golden Draenite -- 28944
	recipe = AddRecipe(28944, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23149)
	recipe:SetCraftedItemID(23114)
	recipe:SetSkillLevels(305, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Subtle Golden Draenite -- 28947
	recipe = AddRecipe(28947, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23150)
	recipe:SetCraftedItemID(23115)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Rigid Azure Moonstone -- 28948
	recipe = AddRecipe(28948, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23151)
	recipe:SetCraftedItemID(23116)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Solid Azure Moonstone -- 28950
	recipe = AddRecipe(28950, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23152)
	recipe:SetCraftedItemID(23118)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33614, 33637, 33680)

	-- Sparkling Azure Moonstone -- 28953
	recipe = AddRecipe(28953, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23155)
	recipe:SetCraftedItemID(23119)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Stormy Azure Moonstone -- 28955
	recipe = AddRecipe(28955, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23154)
	recipe:SetCraftedItemID(23120)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Fel Iron Blood Ring -- 31048
	recipe = AddRecipe(31048, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(24074)
	recipe:SetSkillLevels(305, 305, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Golden Draenite Ring -- 31049
	recipe = AddRecipe(31049, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(24075)
	recipe:SetSkillLevels(305, 305, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Azure Moonstone Ring -- 31050
	recipe = AddRecipe(31050, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(24076)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Thick Adamantite Necklace -- 31051
	recipe = AddRecipe(31051, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(24077)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.NECK)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Heavy Adamantite Ring -- 31052
	recipe = AddRecipe(31052, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(24078)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Khorium Band of Shadows -- 31053
	recipe = AddRecipe(31053, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24158)
	recipe:SetCraftedItemID(24079)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(19826)

	-- Khorium Band of Frost -- 31054
	recipe = AddRecipe(31054, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24159)
	recipe:SetCraftedItemID(24080)
	recipe:SetSkillLevels(355, 355, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(17722)

	-- Khorium Inferno Band -- 31055
	recipe = AddRecipe(31055, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24160)
	recipe:SetCraftedItemID(24082)
	recipe:SetSkillLevels(355, 355, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(18472)

	-- Khorium Band of Leaves -- 31056
	recipe = AddRecipe(31056, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24161)
	recipe:SetCraftedItemID(24085)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(19984)

	-- Arcane Khorium Band -- 31057
	recipe = AddRecipe(31057, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24162)
	recipe:SetCraftedItemID(24086)
	recipe:SetSkillLevels(365, 365, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(18866)

	-- Heavy Felsteel Ring -- 31058
	recipe = AddRecipe(31058, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24163)
	recipe:SetCraftedItemID(24087)
	recipe:SetSkillLevels(345, 345, 355, 365, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.RING)
	recipe:AddWorldDrop("Outland")

	-- Delicate Eternium Ring -- 31060
	recipe = AddRecipe(31060, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24164)
	recipe:SetCraftedItemID(24088)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK, F.RING)
	recipe:AddWorldDrop("Outland")

	-- Blazing Eternium Band -- 31061
	recipe = AddRecipe(31061, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24165)
	recipe:SetCraftedItemID(24089)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddWorldDrop("Outland")

	-- Pendant of Frozen Flame -- 31062
	recipe = AddRecipe(31062, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24174)
	recipe:SetCraftedItemID(24092)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KOT, F.NECK)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Pendant of Thawing -- 31063
	recipe = AddRecipe(31063, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24175)
	recipe:SetCraftedItemID(24093)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LOWERCITY, F.NECK)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Pendant of Withering -- 31064
	recipe = AddRecipe(31064, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24176)
	recipe:SetCraftedItemID(24095)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCRYER, F.NECK)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Pendant of Shadow's End -- 31065
	recipe = AddRecipe(31065, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24177)
	recipe:SetCraftedItemID(24097)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.ALDOR, F.NECK)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Pendant of the Null Rune -- 31066
	recipe = AddRecipe(31066, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24178)
	recipe:SetCraftedItemID(24098)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM, F.NECK)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Thick Felsteel Necklace -- 31067
	recipe = AddRecipe(31067, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24166)
	recipe:SetCraftedItemID(24106)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Living Ruby Pendant -- 31068
	recipe = AddRecipe(31068, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24167)
	recipe:SetCraftedItemID(24110)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Braided Eternium Chain -- 31070
	recipe = AddRecipe(31070, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24168)
	recipe:SetCraftedItemID(24114)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Eye of the Night -- 31071
	recipe = AddRecipe(31071, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24169)
	recipe:SetCraftedItemID(24116)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Embrace of the Dawn -- 31072
	recipe = AddRecipe(31072, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24170)
	recipe:SetCraftedItemID(24117)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Chain of the Twilight Owl -- 31076
	recipe = AddRecipe(31076, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24171)
	recipe:SetCraftedItemID(24121)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Coronet of Verdant Flame -- 31077
	recipe = AddRecipe(31077, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24172)
	recipe:SetCraftedItemID(24122)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(18422)

	-- Circlet of Arcane Might -- 31078
	recipe = AddRecipe(31078, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(24173)
	recipe:SetCraftedItemID(24123)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(18096)

	-- Figurine - Felsteel Boar -- 31079
	recipe = AddRecipe(31079, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24179)
	recipe:SetCraftedItemID(24124)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.LOWERCITY, F.TRINKET)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Figurine - Dawnstone Crab -- 31080
	recipe = AddRecipe(31080, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(31358)
	recipe:SetCraftedItemID(24125)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.HELLFIRE, F.TRINKET)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.REVERED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.REVERED, 17585)

	-- Figurine - Living Ruby Serpent -- 31081
	recipe = AddRecipe(31081, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24181)
	recipe:SetCraftedItemID(24126)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.KOT, F.TRINKET)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Figurine - Talasite Owl -- 31082
	recipe = AddRecipe(31082, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24182)
	recipe:SetCraftedItemID(24127)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Figurine - Nightseye Panther -- 31083
	recipe = AddRecipe(31083, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24183)
	recipe:SetCraftedItemID(24128)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.CENARION_EXPEDITION, F.TRINKET)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Bold Living Ruby -- 31084
	recipe = AddRecipe(31084, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24193)
	recipe:SetCraftedItemID(24027)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Delicate Living Ruby -- 31085
	recipe = AddRecipe(31085, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24194)
	recipe:SetCraftedItemID(24028)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Brilliant Living Ruby -- 31088
	recipe = AddRecipe(31088, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35305)
	recipe:SetCraftedItemID(24030)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Subtle Dawnstone -- 31090
	recipe = AddRecipe(31090, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24197)
	recipe:SetCraftedItemID(24032)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Flashing Living Ruby -- 31091
	recipe = AddRecipe(31091, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24198)
	recipe:SetCraftedItemID(24036)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Solid Star of Elune -- 31092
	recipe = AddRecipe(31092, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35304)
	recipe:SetCraftedItemID(24033)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOE, F.RBOP)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Stormy Star of Elune -- 31095
	recipe = AddRecipe(31095, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24202)
	recipe:SetCraftedItemID(24039)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Smooth Dawnstone -- 31097
	recipe = AddRecipe(31097, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24204)
	recipe:SetCraftedItemID(24048)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Rigid Star of Elune -- 31098
	recipe = AddRecipe(31098, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35307)
	recipe:SetCraftedItemID(24051)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOE, F.RBOP)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Mystic Dawnstone -- 31101
	recipe = AddRecipe(31101, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24208)
	recipe:SetCraftedItemID(24053)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(21474, 21485)

	-- Sovereign Nightseye -- 31102
	recipe = AddRecipe(31102, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24209)
	recipe:SetCraftedItemID(24054)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Shifting Nightseye -- 31103
	recipe = AddRecipe(31103, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24210)
	recipe:SetCraftedItemID(24055)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Timeless Nightseye -- 31104
	recipe = AddRecipe(31104, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24211)
	recipe:SetCraftedItemID(24056)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Inscribed Noble Topaz -- 31106
	recipe = AddRecipe(31106, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24213)
	recipe:SetCraftedItemID(24058)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Potent Noble Topaz -- 31107
	recipe = AddRecipe(31107, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24214)
	recipe:SetCraftedItemID(24059)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Reckless Noble Topaz -- 31108
	recipe = AddRecipe(31108, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24215)
	recipe:SetCraftedItemID(24060)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Glinting Nightseye -- 31109
	recipe = AddRecipe(31109, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24216)
	recipe:SetCraftedItemID(24061)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Radiant Talasite -- 31111
	recipe = AddRecipe(31111, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24218)
	recipe:SetCraftedItemID(24066)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Purified Nightseye -- 31112
	recipe = AddRecipe(31112, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24219)
	recipe:SetCraftedItemID(24065)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Jagged Talasite -- 31113
	recipe = AddRecipe(31113, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24220)
	recipe:SetCraftedItemID(24067)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Sparkling Star of Elune -- 31149
	recipe = AddRecipe(31149, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(24200)
	recipe:SetCraftedItemID(24035)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Malachite Pendant -- 32178
	recipe = AddRecipe(32178, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25438)
	recipe:SetSkillLevels(20, 20, 50, 65, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Tigerseye Band -- 32179
	recipe = AddRecipe(32179, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25439)
	recipe:SetSkillLevels(20, 20, 50, 65, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Rough Stone Statue -- 32259
	recipe = AddRecipe(32259, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25498)
	recipe:SetSkillLevels(1, 1, 30, 40, 50)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Coarse Stone Statue -- 32801
	recipe = AddRecipe(32801, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25880)
	recipe:SetSkillLevels(50, 50, 70, 80, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Heavy Stone Statue -- 32807
	recipe = AddRecipe(32807, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25881)
	recipe:SetSkillLevels(110, 110, 120, 130, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Solid Stone Statue -- 32808
	recipe = AddRecipe(32808, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25882)
	recipe:SetSkillLevels(175, 175, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Dense Stone Statue -- 32809
	recipe = AddRecipe(32809, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25883)
	recipe:SetSkillLevels(225, 225, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Powerful Earthstorm Diamond -- 32866
	recipe = AddRecipe(32866, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25902)
	recipe:SetCraftedItemID(25896)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 17518)

	-- Bracing Earthstorm Diamond -- 32867
	recipe = AddRecipe(32867, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25903)
	recipe:SetCraftedItemID(25897)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 17518)

	-- Tenacious Earthstorm Diamond -- 32868
	recipe = AddRecipe(32868, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25905)
	recipe:SetCraftedItemID(25898)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Brutal Earthstorm Diamond -- 32869
	recipe = AddRecipe(32869, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25906)
	recipe:SetCraftedItemID(25899)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Insightful Earthstorm Diamond -- 32870
	recipe = AddRecipe(32870, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25904)
	recipe:SetCraftedItemID(25901)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.FRIENDLY, 21432)

	-- Destructive Skyfire Diamond -- 32871
	recipe = AddRecipe(32871, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25907)
	recipe:SetCraftedItemID(25890)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Mystical Skyfire Diamond -- 32872
	recipe = AddRecipe(32872, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25909)
	recipe:SetCraftedItemID(25893)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Swift Skyfire Diamond -- 32873
	recipe = AddRecipe(32873, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25908)
	recipe:SetCraftedItemID(25894)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Enigmatic Skyfire Diamond -- 32874
	recipe = AddRecipe(32874, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25910)
	recipe:SetCraftedItemID(25895)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Delicate Blood Garnet -- 34590
	recipe = AddRecipe(34590, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23134)
	recipe:SetCraftedItemID(28595)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Golden Ring of Power -- 34955
	recipe = AddRecipe(34955, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29157)
	recipe:SetSkillLevels(180, 180, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Truesilver Commander's Ring -- 34959
	recipe = AddRecipe(34959, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29158)
	recipe:SetSkillLevels(200, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Glowing Thorium Band -- 34960
	recipe = AddRecipe(34960, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29159)
	recipe:SetSkillLevels(280, 280, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Emerald Lion Ring -- 34961
	recipe = AddRecipe(34961, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29160)
	recipe:SetSkillLevels(290, 290, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Brilliant Necklace -- 36523
	recipe = AddRecipe(36523, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30419)
	recipe:SetSkillLevels(75, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Heavy Jade Ring -- 36524
	recipe = AddRecipe(36524, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30420)
	recipe:SetSkillLevels(105, 105, 135, 150, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Red Ring of Destruction -- 36525
	recipe = AddRecipe(36525, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30421)
	recipe:SetSkillLevels(230, 230, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Diamond Focus Ring -- 36526
	recipe = AddRecipe(36526, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30422)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Bronze Band of Force -- 37818
	recipe = AddRecipe(37818, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30804)
	recipe:SetSkillLevels(65, 65, 95, 110, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Ring of Arcane Shielding -- 37855
	recipe = AddRecipe(37855, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(30826)
	recipe:SetCraftedItemID(30825)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATAR, F.RING)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Mercurial Adamantite -- 38068
	recipe = AddRecipe(38068, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(31079)
	recipe:SetSkillLevels(325, 325, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Bronze Torc -- 38175
	recipe = AddRecipe(38175, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(31154)
	recipe:SetSkillLevels(80, 80, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- The Frozen Eye -- 38503
	recipe = AddRecipe(38503, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31401)
	recipe:SetCraftedItemID(31398)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.VIOLETEYE, F.RING)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 18255)

	-- The Natural Ward -- 38504
	recipe = AddRecipe(38504, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(31402)
	recipe:SetCraftedItemID(31399)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION, F.RING)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Veiled Shadow Draenite -- 39466
	recipe = AddRecipe(39466, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31873)
	recipe:SetCraftedItemID(31866)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom("OGRI_DRAGONS")

	-- Deadly Flame Spessarite -- 39467
	recipe = AddRecipe(39467, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31874)
	recipe:SetCraftedItemID(31869)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddCustom("OGRI_DRAGONS")

	-- Veiled Nightseye -- 39470
	recipe = AddRecipe(39470, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(31878)
	recipe:SetCraftedItemID(31867)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Deadly Noble Topaz -- 39471
	recipe = AddRecipe(39471, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(31879)
	recipe:SetCraftedItemID(31868)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Bold Crimson Spinel -- 39705
	recipe = AddRecipe(39705, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35244)
	recipe:SetCraftedItemID(32193)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Delicate Crimson Spinel -- 39706
	recipe = AddRecipe(39706, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35246)
	recipe:SetCraftedItemID(32194)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Brilliant Crimson Spinel -- 39711
	recipe = AddRecipe(39711, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35248)
	recipe:SetCraftedItemID(32196)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Subtle Lionseye -- 39713
	recipe = AddRecipe(39713, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35249)
	recipe:SetCraftedItemID(32198)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Flashing Crimson Spinel -- 39714
	recipe = AddRecipe(39714, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35247)
	recipe:SetCraftedItemID(32199)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Solid Empyrean Sapphire -- 39715
	recipe = AddRecipe(39715, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35263)
	recipe:SetCraftedItemID(32200)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Sparkling Empyrean Sapphire -- 39716
	recipe = AddRecipe(39716, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35264)
	recipe:SetCraftedItemID(32201)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Stormy Empyrean Sapphire -- 39718
	recipe = AddRecipe(39718, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35265)
	recipe:SetCraftedItemID(32203)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Smooth Lionseye -- 39720
	recipe = AddRecipe(39720, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35260)
	recipe:SetCraftedItemID(32205)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Rigid Empyrean Sapphire -- 39721
	recipe = AddRecipe(39721, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35259)
	recipe:SetCraftedItemID(32206)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Mystic Lionseye -- 39724
	recipe = AddRecipe(39724, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35258)
	recipe:SetCraftedItemID(32209)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Sovereign Shadowsong Amethyst -- 39727
	recipe = AddRecipe(39727, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35243)
	recipe:SetCraftedItemID(32211)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Shifting Shadowsong Amethyst -- 39728
	recipe = AddRecipe(39728, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35242)
	recipe:SetCraftedItemID(32212)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Timeless Shadowsong Amethyst -- 39731
	recipe = AddRecipe(39731, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35239)
	recipe:SetCraftedItemID(32215)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Inscribed Pyrestone -- 39733
	recipe = AddRecipe(39733, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35267)
	recipe:SetCraftedItemID(32217)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Potent Pyrestone -- 39734
	recipe = AddRecipe(39734, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35269)
	recipe:SetCraftedItemID(32218)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Glinting Shadowsong Amethyst -- 39736
	recipe = AddRecipe(39736, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35266)
	recipe:SetCraftedItemID(32220)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Veiled Shadowsong Amethyst -- 39737
	recipe = AddRecipe(39737, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35270)
	recipe:SetCraftedItemID(32221)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom("HYJAL_RANDOM")

	-- Deadly Pyrestone -- 39738
	recipe = AddRecipe(39738, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35271)
	recipe:SetCraftedItemID(32222)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Regal Seaspray Emerald -- 39739
	recipe = AddRecipe(39739, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35252)
	recipe:SetCraftedItemID(32223)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Radiant Seaspray Emerald -- 39740
	recipe = AddRecipe(39740, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35254)
	recipe:SetCraftedItemID(32224)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Purified Shadowsong Amethyst -- 39741
	recipe = AddRecipe(39741, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35251)
	recipe:SetCraftedItemID(32225)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Jagged Seaspray Emerald -- 39742
	recipe = AddRecipe(39742, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35253)
	recipe:SetCraftedItemID(32226)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Relentless Earthstorm Diamond -- 39961
	recipe = AddRecipe(39961, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33622)
	recipe:SetCraftedItemID(32409)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.EXALTED, 20242, 23007)

	-- Thundering Skyfire Diamond -- 39963
	recipe = AddRecipe(39963, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(32411)
	recipe:SetCraftedItemID(32410)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Necklace of the Deep -- 40514
	recipe = AddRecipe(40514, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32508)
	recipe:SetSkillLevels(340, 340, 340, 355, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Brilliant Pearl Band -- 41414
	recipe = AddRecipe(41414, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32772)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- The Black Pearl -- 41415
	recipe = AddRecipe(41415, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32774)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Crown of the Sea Witch -- 41418
	recipe = AddRecipe(41418, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32776)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Purified Jaggal Pearl -- 41420
	recipe = AddRecipe(41420, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32833)
	recipe:SetSkillLevels(325, 325, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Purified Shadow Pearl -- 41429
	recipe = AddRecipe(41429, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32836)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Don Julio's Heart -- 42558
	recipe = AddRecipe(42558, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33305)
	recipe:SetCraftedItemID(33133)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Kailee's Rose -- 42588
	recipe = AddRecipe(42588, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33155)
	recipe:SetCraftedItemID(33134)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Crimson Sun -- 42589
	recipe = AddRecipe(42589, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33156)
	recipe:SetCraftedItemID(33131)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Falling Star -- 42590
	recipe = AddRecipe(42590, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33157)
	recipe:SetCraftedItemID(33135)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Stone of Blades -- 42591
	recipe = AddRecipe(42591, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33158)
	recipe:SetCraftedItemID(33143)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Blood of Amber -- 42592
	recipe = AddRecipe(42592, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33159)
	recipe:SetCraftedItemID(33140)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Facet of Eternity -- 42593
	recipe = AddRecipe(42593, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(33160)
	recipe:SetCraftedItemID(33144)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Steady Talasite -- 43493
	recipe = AddRecipe(43493, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33783)
	recipe:SetCraftedItemID(33782)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(18821, 18822)

	-- Chaotic Skyfire Diamond -- 44794
	recipe = AddRecipe(44794, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(34689)
	recipe:SetCraftedItemID(34220)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19768)

	-- Loop of Forged Power -- 46122
	recipe = AddRecipe(46122, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35198)
	recipe:SetCraftedItemID(34362)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Ring of Flowing Life -- 46123
	recipe = AddRecipe(46123, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35538)
	recipe:SetCraftedItemID(34363)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hard Khorium Band -- 46124
	recipe = AddRecipe(46124, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35200)
	recipe:SetCraftedItemID(34361)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Pendant of Sunfire -- 46125
	recipe = AddRecipe(46125, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35201)
	recipe:SetCraftedItemID(34359)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Amulet of Flowing Life -- 46126
	recipe = AddRecipe(46126, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35533)
	recipe:SetCraftedItemID(34360)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hard Khorium Choker -- 46127
	recipe = AddRecipe(46127, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35203)
	recipe:SetCraftedItemID(34358)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.NECK)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Quick Dawnstone -- 46403
	recipe = AddRecipe(46403, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35322)
	recipe:SetCraftedItemID(35315)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Forceful Talasite -- 46405
	recipe = AddRecipe(46405, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35325)
	recipe:SetCraftedItemID(35318)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Eternal Earthstorm Diamond -- 46597
	recipe = AddRecipe(46597, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35502)
	recipe:SetCraftedItemID(35501)
	recipe:SetSkillLevels(370, 370, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Ember Skyfire Diamond -- 46601
	recipe = AddRecipe(46601, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35505)
	recipe:SetCraftedItemID(35503)
	recipe:SetSkillLevels(370, 370, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Empyrean Tortoise -- 46775
	recipe = AddRecipe(46775, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35695)
	recipe:SetCraftedItemID(35693)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Khorium Boar -- 46776
	recipe = AddRecipe(46776, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35696)
	recipe:SetCraftedItemID(35694)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Crimson Serpent -- 46777
	recipe = AddRecipe(46777, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35697)
	recipe:SetCraftedItemID(35700)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Shadowsong Panther -- 46778
	recipe = AddRecipe(46778, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35698)
	recipe:SetCraftedItemID(35702)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Seaspray Albatross -- 46779
	recipe = AddRecipe(46779, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35699)
	recipe:SetCraftedItemID(35703)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Regal Talasite -- 46803
	recipe = AddRecipe(46803, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35708)
	recipe:SetCraftedItemID(35707)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Forceful Seaspray Emerald -- 47053
	recipe = AddRecipe(47053, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35769)
	recipe:SetCraftedItemID(35759)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Steady Seaspray Emerald -- 47054
	recipe = AddRecipe(47054, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35766)
	recipe:SetCraftedItemID(35758)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)

	-- Reckless Pyrestone -- 47055
	recipe = AddRecipe(47055, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35767)
	recipe:SetCraftedItemID(35760)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Quick Lionseye -- 47056
	recipe = AddRecipe(47056, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35768)
	recipe:SetCraftedItemID(35761)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Brilliant Glass -- 47280
	recipe = AddRecipe(47280, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(35945)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Bold Scarlet Ruby -- 53830
	recipe = AddRecipe(53830, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41576)
	recipe:SetCraftedItemID(39996)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Bold Bloodstone -- 53831
	recipe = AddRecipe(53831, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39900)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Delicate Bloodstone -- 53832
	recipe = AddRecipe(53832, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39905)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Subtle Sun Crystal -- 53843
	recipe = AddRecipe(53843, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39907)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Flashing Bloodstone -- 53844
	recipe = AddRecipe(53844, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39908)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Smooth Sun Crystal -- 53845
	recipe = AddRecipe(53845, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39909)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Brilliant Bloodstone -- 53852
	recipe = AddRecipe(53852, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39912)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Rigid Chalcedony -- 53854
	recipe = AddRecipe(53854, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39915)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Quick Sun Crystal -- 53856
	recipe = AddRecipe(53856, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39918)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Mystic Sun Crystal -- 53857
	recipe = AddRecipe(53857, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41559)
	recipe:SetCraftedItemID(39917)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Sovereign Shadow Crystal -- 53859
	recipe = AddRecipe(53859, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39934)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Shifting Shadow Crystal -- 53860
	recipe = AddRecipe(53860, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39935)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Glinting Shadow Crystal -- 53861
	recipe = AddRecipe(53861, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39942)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Mysterious Shadow Crystal -- 53865
	recipe = AddRecipe(53865, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41575)
	recipe:SetCraftedItemID(39945)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Defender's Shadow Crystal -- 53869
	recipe = AddRecipe(53869, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41574)
	recipe:SetCraftedItemID(39939)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.HONORED, 31916, 32763)

	-- Jagged Dark Jade -- 53870
	recipe = AddRecipe(53870, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39933)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Guardian's Shadow Crystal -- 53871
	recipe = AddRecipe(53871, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39940)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Inscribed Huge Citrine -- 53872
	recipe = AddRecipe(53872, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39947)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Etched Shadow Crystal -- 53873
	recipe = AddRecipe(53873, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39948)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Champion's Huge Citrine -- 53874
	recipe = AddRecipe(53874, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39949)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Resplendent Huge Citrine -- 53875
	recipe = AddRecipe(53875, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41566)
	recipe:SetCraftedItemID(39950)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Fierce Huge Citrine -- 53876
	recipe = AddRecipe(53876, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39951)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Deadly Huge Citrine -- 53877
	recipe = AddRecipe(53877, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41562)
	recipe:SetCraftedItemID(39952)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.FRIENDLY, 32538)

	-- Lucent Huge Citrine -- 53879
	recipe = AddRecipe(53879, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41565)
	recipe:SetCraftedItemID(39954)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Deft Huge Citrine -- 53880
	recipe = AddRecipe(53880, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39955)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Potent Huge Citrine -- 53882
	recipe = AddRecipe(53882, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39956)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Veiled Shadow Crystal -- 53883
	recipe = AddRecipe(53883, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39957)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Willful Huge Citrine -- 53884
	recipe = AddRecipe(53884, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41563)
	recipe:SetCraftedItemID(39958)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Reckless Huge Citrine -- 53885
	recipe = AddRecipe(53885, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41561)
	recipe:SetCraftedItemID(39959)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.FRENZYHEART)
	recipe:AddRepVendor(FAC.FRENZYHEART, REP.FRIENDLY, 31911)

	-- Stalwart Huge Citrine -- 53891
	recipe = AddRecipe(53891, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39965)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Accurate Shadow Crystal -- 53892
	recipe = AddRecipe(53892, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39966)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Resolute Huge Citrine -- 53893
	recipe = AddRecipe(53893, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39967)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Timeless Shadow Crystal -- 53894
	recipe = AddRecipe(53894, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39968)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Nimble Dark Jade -- 53917
	recipe = AddRecipe(53917, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41567)
	recipe:SetCraftedItemID(39975)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ORACLES)
	recipe:AddRepVendor(FAC.ORACLES, REP.FRIENDLY, 31910)

	-- Regal Dark Jade -- 53918
	recipe = AddRecipe(53918, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39976)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Steady Dark Jade -- 53919
	recipe = AddRecipe(53919, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41572)
	recipe:SetCraftedItemID(39977)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Forceful Dark Jade -- 53920
	recipe = AddRecipe(53920, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39978)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Purified Shadow Crystal -- 53921
	recipe = AddRecipe(53921, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41568)
	recipe:SetCraftedItemID(39979)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.FRIENDLY, 31916, 32763)

	-- Misty Dark Jade -- 53922
	recipe = AddRecipe(53922, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39980)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Lightning Dark Jade -- 53923
	recipe = AddRecipe(53923, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39981)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Turbid Dark Jade -- 53924
	recipe = AddRecipe(53924, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41571)
	recipe:SetCraftedItemID(39982)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Energized Dark Jade -- 53925
	recipe = AddRecipe(53925, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39983)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Radiant Dark Jade -- 53932
	recipe = AddRecipe(53932, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41570)
	recipe:SetCraftedItemID(39991)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Shattered Dark Jade -- 53933
	recipe = AddRecipe(53933, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41569)
	recipe:SetCraftedItemID(39992)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Solid Chalcedony -- 53934
	recipe = AddRecipe(53934, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39919)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Sparkling Chalcedony -- 53941
	recipe = AddRecipe(53941, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39927)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Stormy Chalcedony -- 53943
	recipe = AddRecipe(53943, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(41560)
	recipe:SetCraftedItemID(39932)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Delicate Scarlet Ruby -- 53945
	recipe = AddRecipe(53945, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41577)
	recipe:SetCraftedItemID(39997)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Brilliant Scarlet Ruby -- 53946
	recipe = AddRecipe(53946, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41718)
	recipe:SetCraftedItemID(39998)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KIRINTOR)
	recipe:AddRepVendor(FAC.KIRINTOR, REP.EXALTED, 32287)

	-- Subtle Autumn's Glow -- 53948
	recipe = AddRecipe(53948, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41719)
	recipe:SetCraftedItemID(40000)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Flashing Scarlet Ruby -- 53949
	recipe = AddRecipe(53949, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41578)
	recipe:SetCraftedItemID(40001)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Precise Scarlet Ruby -- 53951
	recipe = AddRecipe(53951, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41790)
	recipe:SetCraftedItemID(40003)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddMobDrop(29311)

	-- Solid Sky Sapphire -- 53952
	recipe = AddRecipe(53952, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42138)
	recipe:SetCraftedItemID(40008)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Sparkling Sky Sapphire -- 53954
	recipe = AddRecipe(53954, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41581)
	recipe:SetCraftedItemID(40010)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stormy Sky Sapphire -- 53955
	recipe = AddRecipe(53955, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41728)
	recipe:SetCraftedItemID(40011)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Smooth Autumn's Glow -- 53957
	recipe = AddRecipe(53957, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41720)
	recipe:SetCraftedItemID(40013)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.EXALTED, 32540)

	-- Rigid Sky Sapphire -- 53958
	recipe = AddRecipe(53958, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41580)
	recipe:SetCraftedItemID(40014)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Mystic Autumn's Glow -- 53960
	recipe = AddRecipe(53960, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41727)
	recipe:SetCraftedItemID(40016)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Quick Autumn's Glow -- 53961
	recipe = AddRecipe(53961, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41579)
	recipe:SetCraftedItemID(40017)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Sovereign Twilight Opal -- 53962
	recipe = AddRecipe(53962, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41784)
	recipe:SetCraftedItemID(40022)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northrend")

	-- Shifting Twilight Opal -- 53963
	recipe = AddRecipe(53963, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41747)
	recipe:SetCraftedItemID(40023)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Timeless Twilight Opal -- 53965
	recipe = AddRecipe(53965, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41725)
	recipe:SetCraftedItemID(40025)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.EXALTED, 32538)

	-- Purified Twilight Opal -- 53966
	recipe = AddRecipe(53966, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41783)
	recipe:SetCraftedItemID(40026)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Northrend")

	-- Mysterious Twilight Opal -- 53968
	recipe = AddRecipe(53968, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41740)
	recipe:SetCraftedItemID(40028)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Defender's Twilight Opal -- 53972
	recipe = AddRecipe(53972, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41820)
	recipe:SetCraftedItemID(40032)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(29370, 29376, 30208, 30222)

	-- Guardian's Twilight Opal -- 53974
	recipe = AddRecipe(53974, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41726)
	recipe:SetCraftedItemID(40034)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ARGENTCRUSADE)
	recipe:AddRepVendor(FAC.ARGENTCRUSADE, REP.REVERED, 30431)

	-- Inscribed Monarch Topaz -- 53975
	recipe = AddRecipe(53975, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41789)
	recipe:SetCraftedItemID(40037)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northrend")

	-- Etched Twilight Opal -- 53976
	recipe = AddRecipe(53976, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41777)
	recipe:SetCraftedItemID(40038)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northrend")

	-- Champion's Monarch Topaz -- 53977
	recipe = AddRecipe(53977, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41780)
	recipe:SetCraftedItemID(40039)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK)
	recipe:AddWorldDrop("Northrend")

	-- Resplendent Monarch Topaz -- 53978
	recipe = AddRecipe(53978, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41734)
	recipe:SetCraftedItemID(40040)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(30489, 32294, 32296)

	-- Glinting Twilight Opal -- 53980
	recipe = AddRecipe(53980, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41582)
	recipe:SetCraftedItemID(40044)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Lucent Monarch Topaz -- 53981
	recipe = AddRecipe(53981, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41733)
	recipe:SetCraftedItemID(40045)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(30489, 32294, 32296)

	-- Potent Monarch Topaz -- 53984
	recipe = AddRecipe(53984, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41686)
	recipe:SetCraftedItemID(40048)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Veiled Twilight Opal -- 53985
	recipe = AddRecipe(53985, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41688)
	recipe:SetCraftedItemID(40049)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Willful Monarch Topaz -- 53986
	recipe = AddRecipe(53986, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41730)
	recipe:SetCraftedItemID(40050)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Reckless Monarch Topaz -- 53987
	recipe = AddRecipe(53987, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41690)
	recipe:SetCraftedItemID(40051)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Deadly Monarch Topaz -- 53988
	recipe = AddRecipe(53988, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41721)
	recipe:SetCraftedItemID(40052)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.REVERED, 32538)

	-- Deft Monarch Topaz -- 53991
	recipe = AddRecipe(53991, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41687)
	recipe:SetCraftedItemID(40055)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Stalwart Monarch Topaz -- 53993
	recipe = AddRecipe(53993, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41722)
	recipe:SetCraftedItemID(40057)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.WYRMREST)
	recipe:AddRepVendor(FAC.WYRMREST, REP.EXALTED, 32533)

	-- Accurate Twilight Opal -- 53994
	recipe = AddRecipe(53994, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41818)
	recipe:SetCraftedItemID(40058)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddMobDrop(28379, 28851, 29402, 30260, 30448)

	-- Jagged Forest Emerald -- 53996
	recipe = AddRecipe(53996, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41723)
	recipe:SetCraftedItemID(40086)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.FRENZYHEART)
	recipe:AddRepVendor(FAC.FRENZYHEART, REP.REVERED, 31911)

	-- Nimble Forest Emerald -- 53997
	recipe = AddRecipe(53997, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41698)
	recipe:SetCraftedItemID(40088)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Regal Forest Emerald -- 53998
	recipe = AddRecipe(53998, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41697)
	recipe:SetCraftedItemID(40089)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Steady Forest Emerald -- 54000
	recipe = AddRecipe(54000, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41738)
	recipe:SetCraftedItemID(40090)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Forceful Forest Emerald -- 54001
	recipe = AddRecipe(54001, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41693)
	recipe:SetCraftedItemID(40091)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Misty Forest Emerald -- 54003
	recipe = AddRecipe(54003, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41781)
	recipe:SetCraftedItemID(40095)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Northrend")

	-- Turbid Forest Emerald -- 54005
	recipe = AddRecipe(54005, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41737)
	recipe:SetCraftedItemID(40102)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Lightning Forest Emerald -- 54009
	recipe = AddRecipe(54009, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41696)
	recipe:SetCraftedItemID(40100)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Energized Forest Emerald -- 54011
	recipe = AddRecipe(54011, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41692)
	recipe:SetCraftedItemID(40105)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Radiant Forest Emerald -- 54012
	recipe = AddRecipe(54012, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41819)
	recipe:SetCraftedItemID(40098)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddMobDrop(29792, 29793)

	-- Shattered Forest Emerald -- 54014
	recipe = AddRecipe(54014, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41735)
	recipe:SetCraftedItemID(40106)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Precise Bloodstone -- 54017
	recipe = AddRecipe(54017, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39910)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Fierce Monarch Topaz -- 54019
	recipe = AddRecipe(54019, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41793)
	recipe:SetCraftedItemID(40041)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddMobDrop(23954)

	-- Resolute Monarch Topaz -- 54023
	recipe = AddRecipe(54023, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41778)
	recipe:SetCraftedItemID(40059)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK)
	recipe:AddWorldDrop("Northrend")

	-- Shielded Skyflare Diamond -- 55384
	recipe = AddRecipe(55384, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41705)
	recipe:SetCraftedItemID(41377)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Tireless Skyflare Diamond -- 55386
	recipe = AddRecipe(55386, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41375)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Forlorn Skyflare Diamond -- 55387
	recipe = AddRecipe(55387, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41743)
	recipe:SetCraftedItemID(41378)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Impassive Skyflare Diamond -- 55388
	recipe = AddRecipe(55388, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41744)
	recipe:SetCraftedItemID(41379)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Chaotic Skyflare Diamond -- 55389
	recipe = AddRecipe(55389, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41704)
	recipe:SetCraftedItemID(41285)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Destructive Skyflare Diamond -- 55390
	recipe = AddRecipe(55390, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41786)
	recipe:SetCraftedItemID(41307)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Ember Skyflare Diamond -- 55392
	recipe = AddRecipe(55392, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41706)
	recipe:SetCraftedItemID(41333)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Enigmatic Skyflare Diamond -- 55393
	recipe = AddRecipe(55393, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41742)
	recipe:SetCraftedItemID(41335)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Swift Skyflare Diamond -- 55394
	recipe = AddRecipe(55394, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41339)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Thundering Skyflare Diamond -- 55395
	recipe = AddRecipe(55395, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41787)
	recipe:SetCraftedItemID(41400)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Insightful Earthsiege Diamond -- 55396
	recipe = AddRecipe(55396, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41708)
	recipe:SetCraftedItemID(41401)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bracing Earthsiege Diamond -- 55397
	recipe = AddRecipe(55397, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41798)
	recipe:SetCraftedItemID(41395)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(27656)

	-- Eternal Earthsiege Diamond -- 55398
	recipe = AddRecipe(55398, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41799)
	recipe:SetCraftedItemID(41396)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(28923)

	-- Powerful Earthsiege Diamond -- 55399
	recipe = AddRecipe(55399, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41397)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Relentless Earthsiege Diamond -- 55400
	recipe = AddRecipe(55400, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41710)
	recipe:SetCraftedItemID(41398)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Austere Earthsiege Diamond -- 55401
	recipe = AddRecipe(55401, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41797)
	recipe:SetCraftedItemID(41380)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(26861)

	-- Persistent Earthsiege Diamond -- 55402
	recipe = AddRecipe(55402, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41381)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Trenchant Earthsiege Diamond -- 55403
	recipe = AddRecipe(55403, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41711)
	recipe:SetCraftedItemID(41382)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Invigorating Earthsiege Diamond -- 55404
	recipe = AddRecipe(55404, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41709)
	recipe:SetCraftedItemID(41385)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Beaming Earthsiege Diamond -- 55405
	recipe = AddRecipe(55405, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41788)
	recipe:SetCraftedItemID(41389)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Northrend")

	-- Revitalizing Skyflare Diamond -- 55407
	recipe = AddRecipe(55407, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(41707)
	recipe:SetCraftedItemID(41376)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bold Dragon's Eye -- 56049
	recipe = AddRecipe(56049, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42298)
	recipe:SetCraftedItemID(42142)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Delicate Dragon's Eye -- 56052
	recipe = AddRecipe(56052, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42301)
	recipe:SetCraftedItemID(42143)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Brilliant Dragon's Eye -- 56053
	recipe = AddRecipe(56053, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42309)
	recipe:SetCraftedItemID(42144)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Subtle Dragon's Eye -- 56055
	recipe = AddRecipe(56055, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42314)
	recipe:SetCraftedItemID(42151)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Flashing Dragon's Eye -- 56056
	recipe = AddRecipe(56056, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42302)
	recipe:SetCraftedItemID(42152)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Mystic Dragon's Eye -- 56079
	recipe = AddRecipe(56079, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42305)
	recipe:SetCraftedItemID(42158)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Precise Dragon's Eye -- 56081
	recipe = AddRecipe(56081, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42306)
	recipe:SetCraftedItemID(42154)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Quick Dragon's Eye -- 56083
	recipe = AddRecipe(56083, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42307)
	recipe:SetCraftedItemID(42150)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Rigid Dragon's Eye -- 56084
	recipe = AddRecipe(56084, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42308)
	recipe:SetCraftedItemID(42156)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Smooth Dragon's Eye -- 56085
	recipe = AddRecipe(56085, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42310)
	recipe:SetCraftedItemID(42149)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Solid Dragon's Eye -- 56086
	recipe = AddRecipe(56086, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42311)
	recipe:SetCraftedItemID(36767)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Sparkling Dragon's Eye -- 56087
	recipe = AddRecipe(56087, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42312)
	recipe:SetCraftedItemID(42145)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stormy Dragon's Eye -- 56088
	recipe = AddRecipe(56088, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(42313)
	recipe:SetCraftedItemID(42155)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bloodstone Band -- 56193
	recipe = AddRecipe(56193, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42336)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Sun Rock Ring -- 56194
	recipe = AddRecipe(56194, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42337)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Jade Dagger Pendant -- 56195
	recipe = AddRecipe(56195, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42338)
	recipe:SetSkillLevels(380, 380, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Blood Sun Necklace -- 56196
	recipe = AddRecipe(56196, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42339)
	recipe:SetSkillLevels(380, 380, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Dream Signet -- 56197
	recipe = AddRecipe(56197, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42340)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Figurine - Ruby Hare -- 56199
	recipe = AddRecipe(56199, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42341)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Figurine - Twilight Serpent -- 56201
	recipe = AddRecipe(56201, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42395)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Figurine - Sapphire Owl -- 56202
	recipe = AddRecipe(56202, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42413)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Figurine - Emerald Boar -- 56203
	recipe = AddRecipe(56203, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42418)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Dark Jade Focusing Lens -- 56205
	recipe = AddRecipe(56205, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41367)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Shadow Crystal Focusing Lens -- 56206
	recipe = AddRecipe(56206, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42420)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Shadow Jade Focusing Lens -- 56208
	recipe = AddRecipe(56208, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42421)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Titanium Impact Band -- 56496
	recipe = AddRecipe(56496, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(42648)
	recipe:SetCraftedItemID(42642)
	recipe:SetSkillLevels(430, 430, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Earthguard Ring -- 56497
	recipe = AddRecipe(56497, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(42649)
	recipe:SetCraftedItemID(42643)
	recipe:SetSkillLevels(430, 430, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Spellshock Ring -- 56498
	recipe = AddRecipe(56498, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(42650)
	recipe:SetCraftedItemID(42644)
	recipe:SetSkillLevels(430, 430, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Impact Choker -- 56499
	recipe = AddRecipe(56499, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(42651)
	recipe:SetCraftedItemID(42645)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddVendor(28721, 33602)

	-- Titanium Earthguard Chain -- 56500
	recipe = AddRecipe(56500, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(42652)
	recipe:SetCraftedItemID(42646)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.NECK)
	recipe:AddVendor(28721, 33602)

	-- Titanium Spellshock Necklace -- 56501
	recipe = AddRecipe(56501, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(42653)
	recipe:SetCraftedItemID(42647)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddVendor(28721, 33602)

	-- Enchanted Pearl -- 56530
	recipe = AddRecipe(56530, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42701)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Enchanted Tear -- 56531
	recipe = AddRecipe(56531, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42702)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Crystal Citrine Necklace -- 58141
	recipe = AddRecipe(58141, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43244)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Crystal Chalcedony Amulet -- 58142
	recipe = AddRecipe(58142, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43245)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Earthshadow Ring -- 58143
	recipe = AddRecipe(58143, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43246)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Jade Ring of Slaying -- 58144
	recipe = AddRecipe(58144, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43247)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TANK, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Stoneguard Band -- 58145
	recipe = AddRecipe(58145, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43248)
	recipe:SetSkillLevels(390, 390, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Shadowmight Ring -- 58146
	recipe = AddRecipe(58146, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43249)
	recipe:SetSkillLevels(390, 390, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Ring of Earthen Might -- 58147
	recipe = AddRecipe(58147, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(43317)
	recipe:SetCraftedItemID(43250)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Ring of Scarlet Shadows -- 58148
	recipe = AddRecipe(58148, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(43318)
	recipe:SetCraftedItemID(43251)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Windfire Band -- 58149
	recipe = AddRecipe(58149, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(43319)
	recipe:SetCraftedItemID(43252)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Ring of Northern Tears -- 58150
	recipe = AddRecipe(58150, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(43320)
	recipe:SetCraftedItemID(43253)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Savage Titanium Ring -- 58492
	recipe = AddRecipe(58492, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(43485)
	recipe:SetCraftedItemID(43482)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Savage Titanium Band -- 58507
	recipe = AddRecipe(58507, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(43497)
	recipe:SetCraftedItemID(43498)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Frostguard Ring -- 58954
	recipe = AddRecipe(58954, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(43597)
	recipe:SetCraftedItemID(43582)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Figurine - Monarch Crab -- 59759
	recipe = AddRecipe(59759, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44063)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK, F.TRINKET)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Icy Prism -- 62242
	recipe = AddRecipe(62242, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44943)
	recipe:SetSkillLevels(425, 425, 445, 457, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Prismatic Black Diamond -- 62941
	recipe = AddRecipe(62941, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45054)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Amulet of Truesight -- 63743
	recipe = AddRecipe(63743, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45627)
	recipe:SetSkillLevels(200, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675)

	-- Emerald Choker -- 64725
	recipe = AddRecipe(64725, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45812)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Sky Sapphire Amulet -- 64726
	recipe = AddRecipe(64726, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45813)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Runed Mana Band -- 64727
	recipe = AddRecipe(64727, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45808)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Scarlet Signet -- 64728
	recipe = AddRecipe(64728, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45809)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(18751, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Regal Eye of Zul -- 66338
	recipe = AddRecipe(66338, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46897)
	recipe:SetCraftedItemID(40167)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Steady Eye of Zul -- 66428
	recipe = AddRecipe(66428, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46898)
	recipe:SetCraftedItemID(40168)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Nimble Eye of Zul -- 66429
	recipe = AddRecipe(66429, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46899)
	recipe:SetCraftedItemID(40166)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Jagged Eye of Zul -- 66431
	recipe = AddRecipe(66431, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46901)
	recipe:SetCraftedItemID(40165)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Timeless Dreadstone -- 66432
	recipe = AddRecipe(66432, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46902)
	recipe:SetCraftedItemID(40164)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Forceful Eye of Zul -- 66434
	recipe = AddRecipe(66434, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46904)
	recipe:SetCraftedItemID(40169)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Misty Eye of Zul -- 66435
	recipe = AddRecipe(66435, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46905)
	recipe:SetCraftedItemID(40171)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Lightning Eye of Zul -- 66439
	recipe = AddRecipe(66439, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46909)
	recipe:SetCraftedItemID(40177)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Radiant Eye of Zul -- 66441
	recipe = AddRecipe(66441, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46911)
	recipe:SetCraftedItemID(40180)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Energized Eye of Zul -- 66442
	recipe = AddRecipe(66442, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46912)
	recipe:SetCraftedItemID(40179)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Shattered Eye of Zul -- 66443
	recipe = AddRecipe(66443, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46913)
	recipe:SetCraftedItemID(40182)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Turbid Eye of Zul -- 66445
	recipe = AddRecipe(66445, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46915)
	recipe:SetCraftedItemID(40173)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Brilliant Cardinal Ruby -- 66446
	recipe = AddRecipe(66446, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46916)
	recipe:SetCraftedItemID(40113)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Bold Cardinal Ruby -- 66447
	recipe = AddRecipe(66447, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46917)
	recipe:SetCraftedItemID(40111)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Delicate Cardinal Ruby -- 66448
	recipe = AddRecipe(66448, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46918)
	recipe:SetCraftedItemID(40112)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Precise Cardinal Ruby -- 66450
	recipe = AddRecipe(66450, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46920)
	recipe:SetCraftedItemID(40118)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Subtle King's Amber -- 66452
	recipe = AddRecipe(66452, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46922)
	recipe:SetCraftedItemID(40115)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Flashing Cardinal Ruby -- 66453
	recipe = AddRecipe(66453, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46923)
	recipe:SetCraftedItemID(40116)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Solid Majestic Zircon -- 66497
	recipe = AddRecipe(66497, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46924)
	recipe:SetCraftedItemID(40119)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Sparkling Majestic Zircon -- 66498
	recipe = AddRecipe(66498, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46925)
	recipe:SetCraftedItemID(40120)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Stormy Majestic Zircon -- 66499
	recipe = AddRecipe(66499, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46926)
	recipe:SetCraftedItemID(40122)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Rigid Majestic Zircon -- 66501
	recipe = AddRecipe(66501, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46928)
	recipe:SetCraftedItemID(40125)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Smooth King's Amber -- 66502
	recipe = AddRecipe(66502, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46929)
	recipe:SetCraftedItemID(40124)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Mystic King's Amber -- 66505
	recipe = AddRecipe(66505, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46932)
	recipe:SetCraftedItemID(40127)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Quick King's Amber -- 66506
	recipe = AddRecipe(66506, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46933)
	recipe:SetCraftedItemID(40128)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Sovereign Dreadstone -- 66554
	recipe = AddRecipe(66554, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46935)
	recipe:SetCraftedItemID(40129)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Purified Dreadstone -- 66556
	recipe = AddRecipe(66556, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46937)
	recipe:SetCraftedItemID(40133)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Shifting Dreadstone -- 66557
	recipe = AddRecipe(66557, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46938)
	recipe:SetCraftedItemID(40130)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Defender's Dreadstone -- 66560
	recipe = AddRecipe(66560, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46941)
	recipe:SetCraftedItemID(40139)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Guardian's Dreadstone -- 66561
	recipe = AddRecipe(66561, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46942)
	recipe:SetCraftedItemID(40141)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Mysterious Dreadstone -- 66562
	recipe = AddRecipe(66562, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46943)
	recipe:SetCraftedItemID(40135)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Inscribed Ametrine -- 66567
	recipe = AddRecipe(66567, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46948)
	recipe:SetCraftedItemID(40142)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Deadly Ametrine -- 66568
	recipe = AddRecipe(66568, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46949)
	recipe:SetCraftedItemID(40147)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Potent Ametrine -- 66569
	recipe = AddRecipe(66569, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46950)
	recipe:SetCraftedItemID(40152)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Veiled Dreadstone -- 66570
	recipe = AddRecipe(66570, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46951)
	recipe:SetCraftedItemID(40153)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Willful Ametrine -- 66571
	recipe = AddRecipe(66571, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46952)
	recipe:SetCraftedItemID(40154)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Etched Dreadstone -- 66572
	recipe = AddRecipe(66572, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46953)
	recipe:SetCraftedItemID(40143)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Glinting Dreadstone -- 66573
	recipe = AddRecipe(66573, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(46956)
	recipe:SetCraftedItemID(40157)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Reckless Ametrine -- 66574
	recipe = AddRecipe(66574, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47007)
	recipe:SetCraftedItemID(40155)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Accurate Dreadstone -- 66576
	recipe = AddRecipe(66576, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47010)
	recipe:SetCraftedItemID(40162)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Champion's Ametrine -- 66579
	recipe = AddRecipe(66579, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47015)
	recipe:SetCraftedItemID(40144)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Stalwart Ametrine -- 66581
	recipe = AddRecipe(66581, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47017)
	recipe:SetCraftedItemID(40160)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Resplendent Ametrine -- 66582
	recipe = AddRecipe(66582, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47018)
	recipe:SetCraftedItemID(40145)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Fierce Ametrine -- 66583
	recipe = AddRecipe(66583, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47019)
	recipe:SetCraftedItemID(40146)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Deft Ametrine -- 66584
	recipe = AddRecipe(66584, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47020)
	recipe:SetCraftedItemID(40150)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Lucent Ametrine -- 66585
	recipe = AddRecipe(66585, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47021)
	recipe:SetCraftedItemID(40149)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Resolute Ametrine -- 66586
	recipe = AddRecipe(66586, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(47022)
	recipe:SetCraftedItemID(40163)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Nightmare Tear -- 68253
	recipe = AddRecipe(68253, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(49112)
	recipe:SetCraftedItemID(49110)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Bold Carnelian -- 73222
	recipe = AddRecipe(73222, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52081)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Delicate Carnelian -- 73223
	recipe = AddRecipe(73223, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52082)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Flashing Carnelian -- 73224
	recipe = AddRecipe(73224, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52083)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Brilliant Carnelian -- 73225
	recipe = AddRecipe(73225, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52084)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Precise Carnelian -- 73226
	recipe = AddRecipe(73226, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52085)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Solid Zephyrite -- 73227
	recipe = AddRecipe(73227, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52086)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Sparkling Zephyrite -- 73228
	recipe = AddRecipe(73228, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52087)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Stormy Zephyrite -- 73229
	recipe = AddRecipe(73229, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52088)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rigid Zephyrite -- 73230
	recipe = AddRecipe(73230, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52089)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Subtle Alicite -- 73231
	recipe = AddRecipe(73231, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52090)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Smooth Alicite -- 73232
	recipe = AddRecipe(73232, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52091)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Quick Alicite -- 73234
	recipe = AddRecipe(73234, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52093)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Fractured Alicite -- 73239
	recipe = AddRecipe(73239, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52094)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Sovereign Nightstone -- 73240
	recipe = AddRecipe(73240, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52095)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Shifting Nightstone -- 73241
	recipe = AddRecipe(73241, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52096)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Defender's Nightstone -- 73242
	recipe = AddRecipe(73242, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52097)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Timeless Nightstone -- 73243
	recipe = AddRecipe(73243, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52098)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Guardian's Nightstone -- 73244
	recipe = AddRecipe(73244, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52099)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Purified Nightstone -- 73245
	recipe = AddRecipe(73245, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52100)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Etched Nightstone -- 73246
	recipe = AddRecipe(73246, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52101)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Glinting Nightstone -- 73247
	recipe = AddRecipe(73247, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52102)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Retaliating Nightstone -- 73248
	recipe = AddRecipe(73248, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52103)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Veiled Nightstone -- 73249
	recipe = AddRecipe(73249, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52104)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Accurate Nightstone -- 73250
	recipe = AddRecipe(73250, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52105)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Polished Hessonite -- 73258
	recipe = AddRecipe(73258, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52106)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Inscribed Hessonite -- 73260
	recipe = AddRecipe(73260, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52108)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Deadly Hessonite -- 73262
	recipe = AddRecipe(73262, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52109)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Potent Hessonite -- 73263
	recipe = AddRecipe(73263, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52110)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fierce Hessonite -- 73264
	recipe = AddRecipe(73264, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52111)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Deft Hessonite -- 73265
	recipe = AddRecipe(73265, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52112)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Reckless Hessonite -- 73266
	recipe = AddRecipe(73266, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52113)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Skillful Hessonite -- 73267
	recipe = AddRecipe(73267, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52114)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Adept Hessonite -- 73268
	recipe = AddRecipe(73268, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52115)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Fine Hessonite -- 73269
	recipe = AddRecipe(73269, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52116)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Artful Hessonite -- 73270
	recipe = AddRecipe(73270, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52117)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Keen Hessonite -- 73271
	recipe = AddRecipe(73271, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52118)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Regal Jasper -- 73272
	recipe = AddRecipe(73272, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52119)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Nimble Jasper -- 73273
	recipe = AddRecipe(73273, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52120)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Jagged Jasper -- 73274
	recipe = AddRecipe(73274, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52121)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Piercing Jasper -- 73275
	recipe = AddRecipe(73275, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52122)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Steady Jasper -- 73276
	recipe = AddRecipe(73276, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52123)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Forceful Jasper -- 73277
	recipe = AddRecipe(73277, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52124)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lightning Jasper -- 73278
	recipe = AddRecipe(73278, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52125)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Puissant Jasper -- 73279
	recipe = AddRecipe(73279, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52126)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Zen Jasper -- 73280
	recipe = AddRecipe(73280, V.CATA, Q.UNCOMMON)
	recipe:SetCraftedItemID(52127)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Sensei's Jasper -- 73281
	recipe = AddRecipe(73281, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52128)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Bold Inferno Ruby -- 73335
	recipe = AddRecipe(73335, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52362)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Delicate Inferno Ruby -- 73336
	recipe = AddRecipe(73336, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52380)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Flashing Inferno Ruby -- 73337
	recipe = AddRecipe(73337, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52384)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Brilliant Inferno Ruby -- 73338
	recipe = AddRecipe(73338, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52387)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Precise Inferno Ruby -- 73339
	recipe = AddRecipe(73339, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52389)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Solid Ocean Sapphire -- 73340
	recipe = AddRecipe(73340, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52390)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sparkling Ocean Sapphire -- 73341
	recipe = AddRecipe(73341, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52391)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Stormy Ocean Sapphire -- 73343
	recipe = AddRecipe(73343, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52392)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Rigid Ocean Sapphire -- 73344
	recipe = AddRecipe(73344, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52393)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Subtle Amberjewel -- 73345
	recipe = AddRecipe(73345, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52394)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Smooth Amberjewel -- 73346
	recipe = AddRecipe(73346, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52395)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Mystic Amberjewel -- 73347
	recipe = AddRecipe(73347, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52396)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Quick Amberjewel -- 73348
	recipe = AddRecipe(73348, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52397)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fractured Amberjewel -- 73349
	recipe = AddRecipe(73349, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52398)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sovereign Demonseye -- 73350
	recipe = AddRecipe(73350, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52399)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Shifting Demonseye -- 73351
	recipe = AddRecipe(73351, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52400)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Defender's Demonseye -- 73352
	recipe = AddRecipe(73352, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52401)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Timeless Demonseye -- 73353
	recipe = AddRecipe(73353, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52402)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Guardian's Demonseye -- 73354
	recipe = AddRecipe(73354, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52403)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Purified Demonseye -- 73355
	recipe = AddRecipe(73355, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52404)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Etched Demonseye -- 73356
	recipe = AddRecipe(73356, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52405)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Glinting Demonseye -- 73357
	recipe = AddRecipe(73357, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52406)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Retaliating Demonseye -- 73358
	recipe = AddRecipe(73358, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52407)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Veiled Demonseye -- 73359
	recipe = AddRecipe(73359, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52408)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Accurate Demonseye -- 73360
	recipe = AddRecipe(73360, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52409)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Polished Ember Topaz -- 73361
	recipe = AddRecipe(73361, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52410)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Resolute Ember Topaz -- 73362
	recipe = AddRecipe(73362, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52411)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Inscribed Ember Topaz -- 73364
	recipe = AddRecipe(73364, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52412)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Deadly Ember Topaz -- 73365
	recipe = AddRecipe(73365, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52413)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Potent Ember Topaz -- 73366
	recipe = AddRecipe(73366, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52414)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fierce Ember Topaz -- 73367
	recipe = AddRecipe(73367, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52415)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Deft Ember Topaz -- 73368
	recipe = AddRecipe(73368, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52416)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Reckless Ember Topaz -- 73369
	recipe = AddRecipe(73369, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52417)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Skillful Ember Topaz -- 73370
	recipe = AddRecipe(73370, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52418)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Adept Ember Topaz -- 73371
	recipe = AddRecipe(73371, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52419)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fine Ember Topaz -- 73372
	recipe = AddRecipe(73372, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52420)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Artful Ember Topaz -- 73373
	recipe = AddRecipe(73373, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52421)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Keen Ember Topaz -- 73374
	recipe = AddRecipe(73374, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52422)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Regal Dream Emerald -- 73375
	recipe = AddRecipe(73375, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52423)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Nimble Dream Emerald -- 73376
	recipe = AddRecipe(73376, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52424)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Jagged Dream Emerald -- 73377
	recipe = AddRecipe(73377, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52425)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Piercing Dream Emerald -- 73378
	recipe = AddRecipe(73378, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52426)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Steady Dream Emerald -- 73379
	recipe = AddRecipe(73379, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52427)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Forceful Dream Emerald -- 73380
	recipe = AddRecipe(73380, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52428)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Lightning Dream Emerald -- 73381
	recipe = AddRecipe(73381, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52429)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Puissant Dream Emerald -- 73382
	recipe = AddRecipe(73382, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52430)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Zen Dream Emerald -- 73383
	recipe = AddRecipe(73383, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52431)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sensei's Dream Emerald -- 73384
	recipe = AddRecipe(73384, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52432)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Bold Chimera's Eye -- 73396
	recipe = AddRecipe(73396, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52381)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Delicate Chimera's Eye -- 73397
	recipe = AddRecipe(73397, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52447)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Flashing Chimera's Eye -- 73398
	recipe = AddRecipe(73398, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52448)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Brilliant Chimera's Eye -- 73399
	recipe = AddRecipe(73399, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52449)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Precise Chimera's Eye -- 73400
	recipe = AddRecipe(73400, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52450)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Solid Chimera's Eye -- 73401
	recipe = AddRecipe(73401, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52451)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sparkling Chimera's Eye -- 73402
	recipe = AddRecipe(73402, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52452)
	recipe:SetCraftedItemID(52262)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Stormy Chimera's Eye -- 73403
	recipe = AddRecipe(73403, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52453)
	recipe:SetCraftedItemID(52263)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Rigid Chimera's Eye -- 73404
	recipe = AddRecipe(73404, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52454)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Subtle Chimera's Eye -- 73405
	recipe = AddRecipe(73405, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52455)
	recipe:SetCraftedItemID(52265)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Smooth Chimera's Eye -- 73406
	recipe = AddRecipe(73406, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52456)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Mystic Chimera's Eye -- 73407
	recipe = AddRecipe(73407, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52457)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Quick Chimera's Eye -- 73408
	recipe = AddRecipe(73408, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52458)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fractured Chimera's Eye -- 73409
	recipe = AddRecipe(73409, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52459)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fleet Shadowspirit Diamond -- 73464
	recipe = AddRecipe(73464, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52433)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Chaotic Shadowspirit Diamond -- 73465
	recipe = AddRecipe(73465, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52434)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Bracing Shadowspirit Diamond -- 73466
	recipe = AddRecipe(73466, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52435)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Eternal Shadowspirit Diamond -- 73467
	recipe = AddRecipe(73467, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52436)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Austere Shadowspirit Diamond -- 73468
	recipe = AddRecipe(73468, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52437)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Effulgent Shadowspirit Diamond -- 73469
	recipe = AddRecipe(73469, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52438)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Ember Shadowspirit Diamond -- 73470
	recipe = AddRecipe(73470, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52439)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Revitalizing Shadowspirit Diamond -- 73471
	recipe = AddRecipe(73471, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52440)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Destructive Shadowspirit Diamond -- 73472
	recipe = AddRecipe(73472, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52441)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Powerful Shadowspirit Diamond -- 73473
	recipe = AddRecipe(73473, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52442)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Enigmatic Shadowspirit Diamond -- 73474
	recipe = AddRecipe(73474, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52443)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Impassive Shadowspirit Diamond -- 73475
	recipe = AddRecipe(73475, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52444)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Forlorn Shadowspirit Diamond -- 73476
	recipe = AddRecipe(73476, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(52445)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fire Prism -- 73478
	recipe = AddRecipe(73478, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52304)
	recipe:SetSkillLevels(500, 500, 500, 500, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Jasper Ring -- 73494
	recipe = AddRecipe(73494, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52306)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Hessonite Band -- 73495
	recipe = AddRecipe(73495, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52308)
	recipe:SetSkillLevels(450, 450, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Alicite Pendant -- 73496
	recipe = AddRecipe(73496, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52307)
	recipe:SetSkillLevels(435, 435, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Nightstone Choker -- 73497
	recipe = AddRecipe(73497, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52309)
	recipe:SetSkillLevels(460, 460, 495, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Band of Blades -- 73498
	recipe = AddRecipe(73498, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52461)
	recipe:SetCraftedItemID(52318)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Ring of Warring Elements -- 73502
	recipe = AddRecipe(73502, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52462)
	recipe:SetCraftedItemID(52319)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Elementium Moebius Band -- 73503
	recipe = AddRecipe(73503, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52463)
	recipe:SetCraftedItemID(52320)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Entwined Elementium Choker -- 73504
	recipe = AddRecipe(73504, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52465)
	recipe:SetCraftedItemID(52321)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Eye of Many Deaths -- 73505
	recipe = AddRecipe(73505, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52466)
	recipe:SetCraftedItemID(52322)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Elementium Guardian -- 73506
	recipe = AddRecipe(73506, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52467)
	recipe:SetCraftedItemID(52323)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Elementium Destroyer's Ring -- 73520
	recipe = AddRecipe(73520, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52460)
	recipe:SetCraftedItemID(52348)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Brazen Elementium Medallion -- 73521
	recipe = AddRecipe(73521, V.CATA, Q.EPIC)
	recipe:SetRecipeItemID(52464)
	recipe:SetCraftedItemID(52350)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Carnelian Spikes -- 73620
	recipe = AddRecipe(73620, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52492)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- The Perforator -- 73621
	recipe = AddRecipe(73621, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52493)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 19063, 19539, 19775, 19778, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675)

	-- Jeweler's Ruby Monocle -- 73625
	recipe = AddRecipe(73625, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(52485)
	recipe:SetSkillLevels(450, 450, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Jeweler's Sapphire Monocle -- 73626
	recipe = AddRecipe(73626, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(52486)
	recipe:SetSkillLevels(455, 455, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Jeweler's Amber Monocle -- 73627
	recipe = AddRecipe(73627, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(52487)
	recipe:SetSkillLevels(460, 460, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Willful Ember Topaz -- 95754
	recipe = AddRecipe(95754, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(68359)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Lucent Ember Topaz -- 95755
	recipe = AddRecipe(95755, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(68360)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Resplendent Ember Topaz -- 95756
	recipe = AddRecipe(95756, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(68361)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Vivid Dream Emerald -- 96226
	recipe = AddRecipe(96226, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(68742)
	recipe:SetCraftedItemID(68741)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Agile Shadowspirit Diamond -- 96255
	recipe = AddRecipe(96255, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(68778)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Reverberating Shadowspirit Diamond -- 96256
	recipe = AddRecipe(96256, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(68779)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Burning Shadowspirit Diamond -- 96257
	recipe = AddRecipe(96257, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(68780)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Punisher's Band -- 98921
	recipe = AddRecipe(98921, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(69853)
	recipe:SetCraftedItemID(69852)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Bloodthirsty Sapphire Ring
	--recipe = AddRecipe(, V.CATA, Q.COMMON)
	--recipe:AddFilters()
	
	-- Bloodthirsty Amberjewel Band
	--recipe = AddRecipe(, V.CATA, Q.COMMON)
	--recipe:AddFilters()
	
	-- Bloodthirsty Ruby Signet
	--recipe = AddRecipe(, V.CATA, Q.COMMON)
	--recipe:AddFilters()
	
	-- Bloodthirsty Sapphire Necklace	
	--recipe = AddRecipe(, V.CATA, Q.COMMON)
	--recipe:AddFilters()
	
	-- Bloodthirsty Amberjewel Pendant
	--recipe = AddRecipe(, V.CATA, Q.COMMON)
	--recipe:AddFilters()
	
	-- Bloodthirsty Ruby Choker
	--recipe = AddRecipe(, V.CATA, Q.COMMON)
	--recipe:AddFilters()
	
	self.InitJewelcrafting = nil
end
