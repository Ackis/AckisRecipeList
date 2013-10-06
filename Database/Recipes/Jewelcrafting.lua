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
function addon:InitJewelcrafting()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, private.PROFESSION_SPELL_IDS.JEWELCRAFTING, genesis, quality)
	end

	private:InitializeJewelcraftingTrainers()

	local recipe

	-------------------------------------------------------------------------------
	-- The Burning Crusade.
	-------------------------------------------------------------------------------
	-- Delicate Copper Wire -- 25255
	recipe = AddRecipe(25255, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 20, 35, 50)
	recipe:SetCraftedItem(20816, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Bronze Setting -- 25278
	recipe = AddRecipe(25278, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 70, 80, 90)
	recipe:SetCraftedItem(20817, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Elegant Silver Ring -- 25280
	recipe = AddRecipe(25280, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:SetCraftedItem(20818, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Inlaid Malachite Ring -- 25283
	recipe = AddRecipe(25283, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(30, 30, 60, 75, 90)
	recipe:SetCraftedItem(20821, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Simple Pearl Ring -- 25284
	recipe = AddRecipe(25284, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(60, 60, 90, 105, 120)
	recipe:SetCraftedItem(20820, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Gloom Band -- 25287
	recipe = AddRecipe(25287, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(70, 70, 100, 115, 130)
	recipe:SetCraftedItem(20823, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Heavy Silver Ring -- 25305
	recipe = AddRecipe(25305, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(90, 90, 120, 135, 150)
	recipe:SetCraftedItem(20826, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Ring of Silver Might -- 25317
	recipe = AddRecipe(25317, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(80, 80, 110, 125, 140)
	recipe:SetCraftedItem(20827, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Ring of Twilight Shadows -- 25318
	recipe = AddRecipe(25318, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(100, 100, 130, 145, 160)
	recipe:SetCraftedItem(20828, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Heavy Golden Necklace of Battle -- 25320
	recipe = AddRecipe(25320, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 180, 195, 210)
	recipe:SetRecipeItem(20856, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20856, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddLimitedVendor(1286, 1, 3367, 1, 16624, 1, 17512, 1)

	-- Moonsoul Crown -- 25321
	recipe = AddRecipe(25321, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(120, 120, 150, 165, 180)
	recipe:SetCraftedItem(20832, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Wicked Moonstone Ring -- 25323
	recipe = AddRecipe(25323, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(125, 125, 155, 170, 185)
	recipe:SetRecipeItem(20855, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20833, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(3499, 1, 3954, 1)

	-- Amulet of the Moon -- 25339
	recipe = AddRecipe(25339, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:SetRecipeItem(20854, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20830, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(4229, 1, 4561, 1, 16624, 1, 17512, 1)

	-- Solid Bronze Ring -- 25490
	recipe = AddRecipe(25490, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:SetCraftedItem(20907, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Braided Copper Ring -- 25493
	recipe = AddRecipe(25493, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:SetCraftedItem(20906, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1, F.HEALER, F.CASTER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Barbaric Iron Collar -- 25498
	recipe = AddRecipe(25498, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(110, 110, 140, 155, 170)
	recipe:SetCraftedItem(20909, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Pendant of the Agate Shield -- 25610
	recipe = AddRecipe(25610, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(120, 120, 150, 165, 180)
	recipe:SetRecipeItem(20970, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20950, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18774, 19778, 26915, 26997, 28701, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)
	recipe:AddVendor(1448)

	-- Heavy Iron Knuckles -- 25612
	recipe = AddRecipe(25612, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(125, 125, 155, 170, 185)
	recipe:SetRecipeItem(20971, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20954, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_FIST_WEAPON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18774, 19778, 26915, 26997, 28701, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)
	recipe:AddLimitedVendor(2393, 1)

	-- Golden Dragon Ring -- 25613
	recipe = AddRecipe(25613, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(135, 135, 165, 180, 195)
	recipe:SetCraftedItem(20955, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Mithril Filigree -- 25615
	recipe = AddRecipe(25615, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 170, 180, 190)
	recipe:SetCraftedItem(20963, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Blazing Citrine Ring -- 25617
	recipe = AddRecipe(25617, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 180, 195, 210)
	recipe:SetRecipeItem(20973, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20958, "BIND_ON_EQUIP")
	recipe:SetRequiredFaction("Horde")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18774, 19778, 26915, 26997, 28701, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)
	recipe:AddLimitedVendor(9636, 1)

	-- Jade Pendant of Blasting -- 25618
	recipe = AddRecipe(25618, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(160, 160, 190, 205, 220)
	recipe:SetRecipeItem(20974, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20966, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- The Jade Eye -- 25619
	recipe = AddRecipe(25619, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(170, 170, 200, 215, 230)
	recipe:SetRecipeItem(20975, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20959, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddLimitedVendor(4775, 1, 5163, 1, 16624, 1, 17512, 1)

	-- Engraved Truesilver Ring -- 25620
	recipe = AddRecipe(25620, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(170, 170, 200, 215, 230)
	recipe:SetCraftedItem(20960, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Citrine Ring of Rapid Healing -- 25621
	recipe = AddRecipe(25621, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(180, 180, 210, 225, 240)
	recipe:SetCraftedItem(20961, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Citrine Pendant of Golden Healing -- 25622
	recipe = AddRecipe(25622, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(190, 190, 220, 235, 250)
	recipe:SetRecipeItem(20976, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(20967, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Figurine - Jade Owl -- 26872
	recipe = AddRecipe(26872, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 225, 240, 255)
	recipe:SetCraftedItem(21748, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Golden Hare -- 26873
	recipe = AddRecipe(26873, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(200, 200, 225, 240, 255)
	recipe:SetRecipeItem(21940, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21756, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Aquamarine Signet -- 26874
	recipe = AddRecipe(26874, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(210, 210, 235, 250, 265)
	recipe:SetCraftedItem(20964, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Black Pearl Panther -- 26875
	recipe = AddRecipe(26875, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(215, 215, 240, 255, 270)
	recipe:SetRecipeItem(21941, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21758, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(4897)
	recipe:AddLimitedVendor(989, 1)

	-- Aquamarine Pendant of the Warrior -- 26876
	recipe = AddRecipe(26876, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(220, 220, 245, 260, 275)
	recipe:SetCraftedItem(21755, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Ruby Crown of Restoration -- 26878
	recipe = AddRecipe(26878, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 250, 265, 280)
	recipe:SetRecipeItem(21942, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(20969, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(2810, 1, 2821, 1)

	-- Thorium Setting -- 26880
	recipe = AddRecipe(26880, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 235, 245, 255)
	recipe:SetCraftedItem(21752, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Truesilver Crab -- 26881
	recipe = AddRecipe(26881, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 250, 265, 280)
	recipe:SetRecipeItem(21943, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21760, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddLimitedVendor(1148, 1, 4897, 1)

	-- Figurine - Truesilver Boar -- 26882
	recipe = AddRecipe(26882, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(235, 235, 260, 275, 290)
	recipe:SetRecipeItem(21944, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21763, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Ruby Pendant of Fire -- 26883
	recipe = AddRecipe(26883, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(235, 235, 260, 275, 290)
	recipe:SetCraftedItem(21764, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Truesilver Healing Ring -- 26885
	recipe = AddRecipe(26885, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(240, 240, 265, 280, 295)
	recipe:SetCraftedItem(21765, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- The Aquamarine Ward -- 26887
	recipe = AddRecipe(26887, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(245, 245, 270, 285, 300)
	recipe:SetRecipeItem(21945, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21754, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Gem Studded Band -- 26896
	recipe = AddRecipe(26896, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(250, 250, 275, 290, 305)
	recipe:SetRecipeItem(21947, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21753, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Opal Necklace of Impact -- 26897
	recipe = AddRecipe(26897, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(250, 250, 275, 290, 305)
	recipe:SetRecipeItem(21948, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21766, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddLimitedVendor(5163, 1, 8363, 1, 16624, 1, 17512, 1)

	-- Figurine - Ruby Serpent -- 26900
	recipe = AddRecipe(26900, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:SetRecipeItem(21949, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21769, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Simple Opal Ring -- 26902
	recipe = AddRecipe(26902, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:SetCraftedItem(21767, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sapphire Signet -- 26903
	recipe = AddRecipe(26903, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 285, 295, 305)
	recipe:SetCraftedItem(21768, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Emerald Crown of Destruction -- 26906
	recipe = AddRecipe(26906, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 285, 295, 305)
	recipe:SetRecipeItem(21952, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21774, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(15179, 1)

	-- Onslaught Ring -- 26907
	recipe = AddRecipe(26907, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(280, 280, 290, 300, 310)
	recipe:SetCraftedItem(21775, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sapphire Pendant of Winter Night -- 26908
	recipe = AddRecipe(26908, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(280, 280, 290, 300, 310)
	recipe:SetCraftedItem(21790, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Emerald Owl -- 26909
	recipe = AddRecipe(26909, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(285, 285, 295, 305, 315)
	recipe:SetRecipeItem(21953, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21777, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Ring of Bitter Shadows -- 26910
	recipe = AddRecipe(26910, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(285, 285, 295, 305, 315)
	recipe:SetRecipeItem(21954, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21778, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(12941)

	-- Living Emerald Pendant -- 26911
	recipe = AddRecipe(26911, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(290, 290, 300, 310, 320)
	recipe:SetCraftedItem(21791, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Black Diamond Crab -- 26912
	recipe = AddRecipe(26912, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:SetRecipeItem(21955, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(21784, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.TANK)
	recipe:AddMobDrop(9736)

	-- Figurine - Dark Iron Scorpid -- 26914
	recipe = AddRecipe(26914, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:SetRecipeItem(21956, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(21789, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.DPS)
	recipe:AddMobDrop(8983)

	-- Necklace of the Diamond Tower -- 26915
	recipe = AddRecipe(26915, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 315, 325, 335)
	recipe:SetRecipeItem(21957, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21792, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(11189)

	-- Band of Natural Fire -- 26916
	recipe = AddRecipe(26916, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:SetCraftedItem(21779, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Woven Copper Ring -- 26925
	recipe = AddRecipe(26925, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:SetCraftedItem(21931, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Heavy Copper Ring -- 26926
	recipe = AddRecipe(26926, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(5, 5, 35, 50, 65)
	recipe:SetCraftedItem(21932, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Thick Bronze Necklace -- 26927
	recipe = AddRecipe(26927, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:SetCraftedItem(21933, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Ornate Tigerseye Necklace -- 26928
	recipe = AddRecipe(26928, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(30, 30, 60, 75, 90)
	recipe:SetCraftedItem(21934, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Brilliant Blood Garnet -- 28903
	recipe = AddRecipe(28903, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:SetRecipeItem(23133, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23094, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.FRIENDLY, 19331)

	-- Bold Blood Garnet -- 28905
	recipe = AddRecipe(28905, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:SetRecipeItem(23131, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23095, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Inscribed Flame Spessarite -- 28910
	recipe = AddRecipe(28910, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:SetRecipeItem(23135, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23098, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Reckless Flame Spessarite -- 28912
	recipe = AddRecipe(28912, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(305, 305, 305, 325, 345)
	recipe:SetRecipeItem(23136, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23099, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Glinting Shadow Draenite -- 28914
	recipe = AddRecipe(28914, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:SetRecipeItem(23137, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23100, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Potent Flame Spessarite -- 28915
	recipe = AddRecipe(28915, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:SetRecipeItem(23138, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23101, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.FRIENDLY, 21655)

	-- Radiant Deep Peridot -- 28916
	recipe = AddRecipe(28916, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:SetRecipeItem(23140, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23103, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CASTER)
	recipe:AddTrainer(18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Jagged Deep Peridot -- 28917
	recipe = AddRecipe(28917, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:SetRecipeItem(23141, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23104, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Regal Deep Peridot -- 28918
	recipe = AddRecipe(28918, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:SetRecipeItem(23142, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23105, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Timeless Shadow Draenite -- 28925
	recipe = AddRecipe(28925, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:SetCraftedItem(23108, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Purified Shadow Draenite -- 28927
	recipe = AddRecipe(28927, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(305, 305, 305, 325, 345)
	recipe:SetRecipeItem(23145, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23109, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Shifting Shadow Draenite -- 28933
	recipe = AddRecipe(28933, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:SetRecipeItem(23146, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23110, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Sovereign Shadow Draenite -- 28936
	recipe = AddRecipe(28936, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:SetRecipeItem(23147, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23111, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Smooth Golden Draenite -- 28944
	recipe = AddRecipe(28944, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(305, 305, 305, 325, 345)
	recipe:SetRecipeItem(23149, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23114, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Subtle Golden Draenite -- 28947
	recipe = AddRecipe(28947, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:SetRecipeItem(23150, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23115, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Rigid Azure Moonstone -- 28948
	recipe = AddRecipe(28948, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:SetRecipeItem(23151, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23116, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Solid Azure Moonstone -- 28950
	recipe = AddRecipe(28950, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 320, 340)
	recipe:SetRecipeItem(23152, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23118, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sparkling Azure Moonstone -- 28953
	recipe = AddRecipe(28953, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:SetRecipeItem(23155, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(23119, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)
	recipe:AddVendor(20242, 23007)

	-- Stormy Azure Moonstone -- 28955
	recipe = AddRecipe(28955, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(315, 315, 315, 335, 355)
	recipe:SetRecipeItem(23154, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(23120, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Fel Iron Blood Ring -- 31048
	recipe = AddRecipe(31048, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 315, 320, 325)
	recipe:SetCraftedItem(24074, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Golden Draenite Ring -- 31049
	recipe = AddRecipe(31049, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 315, 320, 325)
	recipe:SetCraftedItem(24075, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Azure Moonstone Ring -- 31050
	recipe = AddRecipe(31050, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:SetCraftedItem(24076, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Thick Adamantite Necklace -- 31051
	recipe = AddRecipe(31051, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:SetCraftedItem(24077, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Heavy Adamantite Ring -- 31052
	recipe = AddRecipe(31052, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:SetCraftedItem(24078, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Khorium Band of Shadows -- 31053
	recipe = AddRecipe(31053, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:SetRecipeItem(24158, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24079, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19826)

	-- Khorium Band of Frost -- 31054
	recipe = AddRecipe(31054, V.TBC, Q.RARE)
	recipe:SetSkillLevels(355, 355, 365, 372, 380)
	recipe:SetRecipeItem(24159, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24080, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(17722)

	-- Khorium Inferno Band -- 31055
	recipe = AddRecipe(31055, V.TBC, Q.RARE)
	recipe:SetSkillLevels(355, 355, 365, 372, 380)
	recipe:SetRecipeItem(24160, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24082, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(18472)

	-- Khorium Band of Leaves -- 31056
	recipe = AddRecipe(31056, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24161, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24085, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19984)

	-- Arcane Khorium Band -- 31057
	recipe = AddRecipe(31057, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 370, 375, 380)
	recipe:SetRecipeItem(24162, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24086, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(18866)

	-- Heavy Felsteel Ring -- 31058
	recipe = AddRecipe(31058, V.TBC, Q.RARE)
	recipe:SetSkillLevels(345, 345, 355, 365, 375)
	recipe:SetRecipeItem(24163, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24087, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Delicate Eternium Ring -- 31060
	recipe = AddRecipe(31060, V.TBC, Q.RARE)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:SetRecipeItem(24164, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Blazing Eternium Band -- 31061
	recipe = AddRecipe(31061, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(24165, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24089, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Pendant of Frozen Flame -- 31062
	recipe = AddRecipe(31062, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24174, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24092, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Pendant of Thawing -- 31063
	recipe = AddRecipe(31063, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24175, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24093, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Pendant of Withering -- 31064
	recipe = AddRecipe(31064, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24176, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24095, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Pendant of Shadow's End -- 31065
	recipe = AddRecipe(31065, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24177, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24097, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Pendant of the Null Rune -- 31066
	recipe = AddRecipe(31066, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24178, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24098, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Thick Felsteel Necklace -- 31067
	recipe = AddRecipe(31067, V.TBC, Q.RARE)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:SetRecipeItem(24166, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24106, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Living Ruby Pendant -- 31068
	recipe = AddRecipe(31068, V.TBC, Q.RARE)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:SetRecipeItem(24167, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24110, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Braided Eternium Chain -- 31070
	recipe = AddRecipe(31070, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 377, 385)
	recipe:SetRecipeItem(24168, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24114, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Eye of the Night -- 31071
	recipe = AddRecipe(31071, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(24169, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24116, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Embrace of the Dawn -- 31072
	recipe = AddRecipe(31072, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(24170, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24117, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Chain of the Twilight Owl -- 31076
	recipe = AddRecipe(31076, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(24171, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24121, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Coronet of Verdant Flame -- 31077
	recipe = AddRecipe(31077, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(24172, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24122, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(18422)

	-- Circlet of Arcane Might -- 31078
	recipe = AddRecipe(31078, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(24173, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24123, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(18096)

	-- Figurine - Felsteel Boar -- 31079
	recipe = AddRecipe(31079, V.TBC, Q.RARE)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(24179, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24124, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Figurine - Dawnstone Crab -- 31080
	recipe = AddRecipe(31080, V.TBC, Q.RARE)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(31358, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24125, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.REVERED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.REVERED, 17585)

	-- Figurine - Living Ruby Serpent -- 31081
	recipe = AddRecipe(31081, V.TBC, Q.RARE)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(24181, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24126, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Figurine - Talasite Owl -- 31082
	recipe = AddRecipe(31082, V.TBC, Q.RARE)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(24182, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24127, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Figurine - Nightseye Panther -- 31083
	recipe = AddRecipe(31083, V.TBC, Q.RARE)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:SetRecipeItem(24183, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24128, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Bold Living Ruby -- 31084
	recipe = AddRecipe(31084, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24193, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24027, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Delicate Living Ruby -- 31085
	recipe = AddRecipe(31085, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24194, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24028, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Brilliant Living Ruby -- 31088
	recipe = AddRecipe(31088, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(35305, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24030, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Subtle Dawnstone -- 31090
	recipe = AddRecipe(31090, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24197, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24032, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Flashing Living Ruby -- 31091
	recipe = AddRecipe(31091, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24198, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24036, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Solid Star of Elune -- 31092
	recipe = AddRecipe(31092, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(35304, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24033, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Stormy Star of Elune -- 31095
	recipe = AddRecipe(31095, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24202, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24039, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Smooth Dawnstone -- 31097
	recipe = AddRecipe(31097, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24204, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24048, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Rigid Star of Elune -- 31098
	recipe = AddRecipe(31098, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(35307, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24051, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Mystic Dawnstone -- 31101
	recipe = AddRecipe(31101, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24208, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(24053, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(21474, 21485)

	-- Sovereign Nightseye -- 31102
	recipe = AddRecipe(31102, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24209, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24054, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Shifting Nightseye -- 31103
	recipe = AddRecipe(31103, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24210, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24055, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Timeless Nightseye -- 31104
	recipe = AddRecipe(31104, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24211, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24056, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Inscribed Noble Topaz -- 31106
	recipe = AddRecipe(31106, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24213, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24058, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Potent Noble Topaz -- 31107
	recipe = AddRecipe(31107, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24214, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24059, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Reckless Noble Topaz -- 31108
	recipe = AddRecipe(31108, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24215, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24060, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Glinting Nightseye -- 31109
	recipe = AddRecipe(31109, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24216, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24061, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Radiant Talasite -- 31111
	recipe = AddRecipe(31111, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24218, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24066, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Purified Nightseye -- 31112
	recipe = AddRecipe(31112, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24219, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24065, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Jagged Talasite -- 31113
	recipe = AddRecipe(31113, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24220, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24067, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Sparkling Star of Elune -- 31149
	recipe = AddRecipe(31149, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(24200, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(24035, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Malachite Pendant -- 32178
	recipe = AddRecipe(32178, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(20, 20, 50, 65, 80)
	recipe:SetCraftedItem(25438, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Tigerseye Band -- 32179
	recipe = AddRecipe(32179, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(20, 20, 50, 65, 80)
	recipe:SetCraftedItem(25439, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Rough Stone Statue -- 32259
	recipe = AddRecipe(32259, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 30, 40, 50)
	recipe:SetCraftedItem(25498, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Coarse Stone Statue -- 32801
	recipe = AddRecipe(32801, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 70, 80, 90)
	recipe:SetCraftedItem(25880, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Heavy Stone Statue -- 32807
	recipe = AddRecipe(32807, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(110, 110, 120, 130, 140)
	recipe:SetCraftedItem(25881, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Solid Stone Statue -- 32808
	recipe = AddRecipe(32808, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(175, 175, 175, 185, 195)
	recipe:SetCraftedItem(25882, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Dense Stone Statue -- 32809
	recipe = AddRecipe(32809, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 225, 235, 245)
	recipe:SetCraftedItem(25883, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Powerful Earthstorm Diamond -- 32866
	recipe = AddRecipe(32866, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25902, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25896, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 17518)

	-- Bracing Earthstorm Diamond -- 32867
	recipe = AddRecipe(32867, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25903, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25897, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 17518)

	-- Tenacious Earthstorm Diamond -- 32868
	recipe = AddRecipe(32868, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25905, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(25898, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Brutal Earthstorm Diamond -- 32869
	recipe = AddRecipe(32869, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25906, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(25899, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Insightful Earthstorm Diamond -- 32870
	recipe = AddRecipe(32870, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25904, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25901, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.FRIENDLY, 21432)

	-- Destructive Skyfire Diamond -- 32871
	recipe = AddRecipe(32871, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25907, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(25890, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Mystical Skyfire Diamond -- 32872
	recipe = AddRecipe(32872, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25909, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(25893, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Swift Skyfire Diamond -- 32873
	recipe = AddRecipe(32873, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25908, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25894, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Enigmatic Skyfire Diamond -- 32874
	recipe = AddRecipe(32874, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(25910, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25895, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Delicate Blood Garnet -- 34590
	recipe = AddRecipe(34590, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:SetRecipeItem(23134, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(28595, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)
	recipe:AddVendor(20242, 23007)

	-- Golden Ring of Power -- 34955
	recipe = AddRecipe(34955, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(180, 180, 190, 200, 210)
	recipe:SetCraftedItem(29157, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Truesilver Commander's Ring -- 34959
	recipe = AddRecipe(34959, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 210, 220, 230)
	recipe:SetCraftedItem(29158, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Glowing Thorium Band -- 34960
	recipe = AddRecipe(34960, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(280, 280, 290, 300, 310)
	recipe:SetCraftedItem(29159, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Emerald Lion Ring -- 34961
	recipe = AddRecipe(34961, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(290, 290, 300, 310, 320)
	recipe:SetCraftedItem(29160, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Brilliant Necklace -- 36523
	recipe = AddRecipe(36523, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(75, 75, 105, 120, 135)
	recipe:SetCraftedItem(30419, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Heavy Jade Ring -- 36524
	recipe = AddRecipe(36524, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(105, 105, 135, 150, 165)
	recipe:SetCraftedItem(30420, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Red Ring of Destruction -- 36525
	recipe = AddRecipe(36525, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(230, 230, 255, 270, 285)
	recipe:SetCraftedItem(30421, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Diamond Focus Ring -- 36526
	recipe = AddRecipe(36526, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:SetCraftedItem(30422, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Bronze Band of Force -- 37818
	recipe = AddRecipe(37818, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(65, 65, 95, 110, 125)
	recipe:SetCraftedItem(30804, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 47384, 47396, 47400, 47418, 47419, 47420, 47431, 52586, 52645, 52657, 57620, 65043, 65098)

	-- Ring of Arcane Shielding -- 37855
	recipe = AddRecipe(37855, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetRecipeItem(30826, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(30825, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Mercurial Adamantite -- 38068
	recipe = AddRecipe(38068, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 325, 335, 345)
	recipe:SetCraftedItem(31079, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Bronze Torc -- 38175
	recipe = AddRecipe(38175, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(80, 80, 110, 125, 140)
	recipe:SetCraftedItem(31154, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- The Frozen Eye -- 38503
	recipe = AddRecipe(38503, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(31401, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(31398, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VIOLETEYE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 18255)

	-- The Natural Ward -- 38504
	recipe = AddRecipe(38504, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(31402, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(31399, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Veiled Shadow Draenite -- 39466
	recipe = AddRecipe(39466, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:SetRecipeItem(31873, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(31866, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1, F.DPS, F.HEALER, F.CASTER)
	recipe:AddCustom("OGRI_DRAGONS")

	-- Deadly Flame Spessarite -- 39467
	recipe = AddRecipe(39467, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(325, 325, 325, 340, 355)
	recipe:SetRecipeItem(31874, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(31869, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1, F.DPS, F.HEALER, F.CASTER)
	recipe:AddCustom("OGRI_DRAGONS")

	-- Veiled Nightseye -- 39470
	recipe = AddRecipe(39470, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(31878, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(31867, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Deadly Noble Topaz -- 39471
	recipe = AddRecipe(39471, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(31879, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(31868, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Bold Crimson Spinel -- 39705
	recipe = AddRecipe(39705, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35244, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32193, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Delicate Crimson Spinel -- 39706
	recipe = AddRecipe(39706, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35246, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32194, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Brilliant Crimson Spinel -- 39711
	recipe = AddRecipe(39711, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35248, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32196, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Subtle Lionseye -- 39713
	recipe = AddRecipe(39713, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35249, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32198, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Flashing Crimson Spinel -- 39714
	recipe = AddRecipe(39714, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35247, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32199, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Solid Empyrean Sapphire -- 39715
	recipe = AddRecipe(39715, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35263, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32200, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Sparkling Empyrean Sapphire -- 39716
	recipe = AddRecipe(39716, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35264, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32201, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Stormy Empyrean Sapphire -- 39718
	recipe = AddRecipe(39718, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35265, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32203, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Smooth Lionseye -- 39720
	recipe = AddRecipe(39720, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35260, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32205, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Rigid Empyrean Sapphire -- 39721
	recipe = AddRecipe(39721, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35259, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32206, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Mystic Lionseye -- 39724
	recipe = AddRecipe(39724, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35258, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32209, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Sovereign Shadowsong Amethyst -- 39727
	recipe = AddRecipe(39727, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35243, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32211, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Shifting Shadowsong Amethyst -- 39728
	recipe = AddRecipe(39728, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35242, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32212, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Timeless Shadowsong Amethyst -- 39731
	recipe = AddRecipe(39731, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35239, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32215, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Inscribed Pyrestone -- 39733
	recipe = AddRecipe(39733, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35267, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32217, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.DPS, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Potent Pyrestone -- 39734
	recipe = AddRecipe(39734, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35269, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32218, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Glinting Shadowsong Amethyst -- 39736
	recipe = AddRecipe(39736, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35266, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32220, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Veiled Shadowsong Amethyst -- 39737
	recipe = AddRecipe(39737, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35270, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32221, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.DPS, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddWorldDrop(Z.MOUNT_HYJAL)

	-- Deadly Pyrestone -- 39738
	recipe = AddRecipe(39738, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35271, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32222, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Regal Seaspray Emerald -- 39739
	recipe = AddRecipe(39739, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35252, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32223, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Radiant Seaspray Emerald -- 39740
	recipe = AddRecipe(39740, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35254, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32224, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Purified Shadowsong Amethyst -- 39741
	recipe = AddRecipe(39741, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35251, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32225, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Jagged Seaspray Emerald -- 39742
	recipe = AddRecipe(39742, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35253, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32226, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Relentless Earthstorm Diamond -- 39961
	recipe = AddRecipe(39961, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(33622, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32409, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.EXALTED, 20242, 23007)

	-- Thundering Skyfire Diamond -- 39963
	recipe = AddRecipe(39963, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(32411, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(32410, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Necklace of the Deep -- 40514
	recipe = AddRecipe(40514, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(340, 340, 340, 355, 370)
	recipe:SetCraftedItem(32508, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Brilliant Pearl Band -- 41414
	recipe = AddRecipe(41414, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:SetCraftedItem(32772, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- The Black Pearl -- 41415
	recipe = AddRecipe(41415, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:SetCraftedItem(32774, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Crown of the Sea Witch -- 41418
	recipe = AddRecipe(41418, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetCraftedItem(32776, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Purified Jaggal Pearl -- 41420
	recipe = AddRecipe(41420, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 325, 332, 340)
	recipe:SetCraftedItem(32833, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Purified Shadow Pearl -- 41429
	recipe = AddRecipe(41429, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetCraftedItem(32836, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Don Julio's Heart -- 42558
	recipe = AddRecipe(42558, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33305, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33133, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Kailee's Rose -- 42588
	recipe = AddRecipe(42588, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33155, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33134, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Crimson Sun -- 42589
	recipe = AddRecipe(42589, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33156, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33131, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Falling Star -- 42590
	recipe = AddRecipe(42590, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33157, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33135, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Stone of Blades -- 42591
	recipe = AddRecipe(42591, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33158, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33143, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Blood of Amber -- 42592
	recipe = AddRecipe(42592, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33159, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33140, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Facet of Eternity -- 42593
	recipe = AddRecipe(42593, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:SetRecipeItem(33160, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33144, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Steady Talasite -- 43493
	recipe = AddRecipe(43493, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(33783, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(33782, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP)
	recipe:AddVendor(18821, 18822)

	-- Chaotic Skyfire Diamond -- 44794
	recipe = AddRecipe(44794, V.TBC, Q.RARE)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(34689, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(34220, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19768)

	-- Loop of Forged Power -- 46122
	recipe = AddRecipe(46122, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(35198, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(34362, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Ring of Flowing Life -- 46123
	recipe = AddRecipe(46123, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(35538, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(34363, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Hard Khorium Band -- 46124
	recipe = AddRecipe(46124, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(35200, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(34361, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.DPS)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Pendant of Sunfire -- 46125
	recipe = AddRecipe(46125, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(35201, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(34359, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Amulet of Flowing Life -- 46126
	recipe = AddRecipe(46126, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(35533, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(34360, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Hard Khorium Choker -- 46127
	recipe = AddRecipe(46127, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetRecipeItem(35203, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(34358, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.DPS)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Quick Dawnstone -- 46403
	recipe = AddRecipe(46403, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(35322, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35315, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Forceful Talasite -- 46405
	recipe = AddRecipe(46405, V.TBC, Q.RARE)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(35325, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35318, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Eternal Earthstorm Diamond -- 46597
	recipe = AddRecipe(46597, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(370, 370, 375, 377, 380)
	recipe:SetRecipeItem(35502, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35501, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Ember Skyfire Diamond -- 46601
	recipe = AddRecipe(46601, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(370, 370, 375, 377, 380)
	recipe:SetRecipeItem(35505, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35503, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Empyrean Tortoise -- 46775
	recipe = AddRecipe(46775, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35695, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35693, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Khorium Boar -- 46776
	recipe = AddRecipe(46776, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35696, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35694, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Crimson Serpent -- 46777
	recipe = AddRecipe(46777, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35697, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35700, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Shadowsong Panther -- 46778
	recipe = AddRecipe(46778, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35698, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35702, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Seaspray Albatross -- 46779
	recipe = AddRecipe(46779, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35699, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35703, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Regal Talasite -- 46803
	recipe = AddRecipe(46803, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetRecipeItem(35708, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35707, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Forceful Seaspray Emerald -- 47053
	recipe = AddRecipe(47053, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35769, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35759, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Steady Seaspray Emerald -- 47054
	recipe = AddRecipe(47054, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35766, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35758, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)

	-- Reckless Pyrestone -- 47055
	recipe = AddRecipe(47055, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35767, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35760, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Quick Lionseye -- 47056
	recipe = AddRecipe(47056, V.TBC, Q.EPIC)
	recipe:SetSkillLevels(375, 375, 375, 380, 385)
	recipe:SetRecipeItem(35768, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35761, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Brilliant Glass -- 47280
	recipe = AddRecipe(47280, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:SetCraftedItem(35945, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-------------------------------------------------------------------------------
	-- Wrath of the Lich King.
	-------------------------------------------------------------------------------
	-- Bold Scarlet Ruby -- 53830
	recipe = AddRecipe(53830, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41576, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39996, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Bold Bloodstone -- 53831
	recipe = AddRecipe(53831, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39900, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Delicate Bloodstone -- 53832
	recipe = AddRecipe(53832, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39905, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Subtle Sun Crystal -- 53843
	recipe = AddRecipe(53843, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(39907, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Flashing Bloodstone -- 53844
	recipe = AddRecipe(53844, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39908, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Smooth Sun Crystal -- 53845
	recipe = AddRecipe(53845, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39909, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Brilliant Bloodstone -- 53852
	recipe = AddRecipe(53852, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39912, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Rigid Chalcedony -- 53854
	recipe = AddRecipe(53854, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39915, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Quick Sun Crystal -- 53856
	recipe = AddRecipe(53856, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39918, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Mystic Sun Crystal -- 53857
	recipe = AddRecipe(53857, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41559, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39917, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Sovereign Shadow Crystal -- 53859
	recipe = AddRecipe(53859, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39934, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shifting Shadow Crystal -- 53860
	recipe = AddRecipe(53860, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39935, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Glinting Shadow Crystal -- 53861
	recipe = AddRecipe(53861, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39942, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Mysterious Shadow Crystal -- 53865
	recipe = AddRecipe(53865, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41575, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39945, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Defender's Shadow Crystal -- 53869
	recipe = AddRecipe(53869, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41574, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39939, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.HONORED, 31916, 32763)

	-- Jagged Dark Jade -- 53870
	recipe = AddRecipe(53870, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39933, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Guardian's Shadow Crystal -- 53871
	recipe = AddRecipe(53871, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39940, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Inscribed Huge Citrine -- 53872
	recipe = AddRecipe(53872, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39947, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Etched Shadow Crystal -- 53873
	recipe = AddRecipe(53873, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39948, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Champion's Huge Citrine -- 53874
	recipe = AddRecipe(53874, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39949, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Resplendent Huge Citrine -- 53875
	recipe = AddRecipe(53875, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41566, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39950, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Fierce Huge Citrine -- 53876
	recipe = AddRecipe(53876, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39951, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Deadly Huge Citrine -- 53877
	recipe = AddRecipe(53877, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41562, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39952, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.FRIENDLY, 32538)

	-- Lucent Huge Citrine -- 53879
	recipe = AddRecipe(53879, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41565, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39954, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Deft Huge Citrine -- 53880
	recipe = AddRecipe(53880, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39955, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Potent Huge Citrine -- 53882
	recipe = AddRecipe(53882, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39956, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Veiled Shadow Crystal -- 53883
	recipe = AddRecipe(53883, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39957, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Willful Huge Citrine -- 53884
	recipe = AddRecipe(53884, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41563, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39958, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Reckless Huge Citrine -- 53885
	recipe = AddRecipe(53885, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41561, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39959, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.FRENZYHEART)
	recipe:AddRepVendor(FAC.FRENZYHEART, REP.FRIENDLY, 31911)

	-- Stalwart Huge Citrine -- 53891
	recipe = AddRecipe(53891, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(39965, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Accurate Shadow Crystal -- 53892
	recipe = AddRecipe(53892, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39966, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Resolute Huge Citrine -- 53893
	recipe = AddRecipe(53893, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39967, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Timeless Shadow Crystal -- 53894
	recipe = AddRecipe(53894, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39968, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Nimble Dark Jade -- 53917
	recipe = AddRecipe(53917, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41567, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39975, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER, F.ORACLES)
	recipe:AddRepVendor(FAC.ORACLES, REP.FRIENDLY, 31910)

	-- Regal Dark Jade -- 53918
	recipe = AddRecipe(53918, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39976, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Steady Dark Jade -- 53919
	recipe = AddRecipe(53919, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41572, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39977, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Forceful Dark Jade -- 53920
	recipe = AddRecipe(53920, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39978, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Purified Shadow Crystal -- 53921
	recipe = AddRecipe(53921, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41568, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39979, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.FRIENDLY, 31916, 32763)

	-- Misty Dark Jade -- 53922
	recipe = AddRecipe(53922, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39980, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Lightning Dark Jade -- 53923
	recipe = AddRecipe(53923, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39981, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Turbid Dark Jade -- 53924
	recipe = AddRecipe(53924, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41571, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39982, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Energized Dark Jade -- 53925
	recipe = AddRecipe(53925, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39983, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Radiant Dark Jade -- 53932
	recipe = AddRecipe(53932, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41570, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39991, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Shattered Dark Jade -- 53933
	recipe = AddRecipe(53933, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41569, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39992, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Solid Chalcedony -- 53934
	recipe = AddRecipe(53934, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39919, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sparkling Chalcedony -- 53941
	recipe = AddRecipe(53941, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39927, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Stormy Chalcedony -- 53943
	recipe = AddRecipe(53943, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetRecipeItem(41560, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39932, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Delicate Scarlet Ruby -- 53945
	recipe = AddRecipe(53945, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41577, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39997, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Brilliant Scarlet Ruby -- 53946
	recipe = AddRecipe(53946, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41718, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(39998, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.KIRINTOR)
	recipe:AddRepVendor(FAC.KIRINTOR, REP.EXALTED, 32287)

	-- Subtle Autumn's Glow -- 53948
	recipe = AddRecipe(53948, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41719, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40000, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Flashing Scarlet Ruby -- 53949
	recipe = AddRecipe(53949, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41578, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40001, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Precise Scarlet Ruby -- 53951
	recipe = AddRecipe(53951, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41790, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40003, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.DPS, F.TANK)
	recipe:AddMobDrop(29311)

	-- Solid Sky Sapphire -- 53952
	recipe = AddRecipe(53952, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(42138, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40008, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Sparkling Sky Sapphire -- 53954
	recipe = AddRecipe(53954, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41581, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40010, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stormy Sky Sapphire -- 53955
	recipe = AddRecipe(53955, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41728, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40011, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Smooth Autumn's Glow -- 53957
	recipe = AddRecipe(53957, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41720, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40013, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.EXALTED, 32540)

	-- Rigid Sky Sapphire -- 53958
	recipe = AddRecipe(53958, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41580, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40014, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Mystic Autumn's Glow -- 53960
	recipe = AddRecipe(53960, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41727, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40016, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Quick Autumn's Glow -- 53961
	recipe = AddRecipe(53961, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41579, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40017, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Sovereign Twilight Opal -- 53962
	recipe = AddRecipe(53962, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41784, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40022, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Shifting Twilight Opal -- 53963
	recipe = AddRecipe(53963, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41747, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40023, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Timeless Twilight Opal -- 53965
	recipe = AddRecipe(53965, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41725, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40025, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.EXALTED, 32538)

	-- Purified Twilight Opal -- 53966
	recipe = AddRecipe(53966, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41783, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40026, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Mysterious Twilight Opal -- 53968
	recipe = AddRecipe(53968, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41740, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40028, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Defender's Twilight Opal -- 53972
	recipe = AddRecipe(53972, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41820, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40032, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddMobDrop(29370, 29376, 30208, 30222)

	-- Guardian's Twilight Opal -- 53974
	recipe = AddRecipe(53974, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41726, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40034, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.ARGENTCRUSADE)
	recipe:AddRepVendor(FAC.ARGENTCRUSADE, REP.REVERED, 30431)

	-- Inscribed Monarch Topaz -- 53975
	recipe = AddRecipe(53975, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41789, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40037, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Etched Twilight Opal -- 53976
	recipe = AddRecipe(53976, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41777, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40038, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Champion's Monarch Topaz -- 53977
	recipe = AddRecipe(53977, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41780, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40039, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Resplendent Monarch Topaz -- 53978
	recipe = AddRecipe(53978, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41734, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40040, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.DPS)
	recipe:AddVendor(30489, 32294, 32296)

	-- Glinting Twilight Opal -- 53980
	recipe = AddRecipe(53980, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41582, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40044, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Lucent Monarch Topaz -- 53981
	recipe = AddRecipe(53981, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41733, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40045, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.DPS)
	recipe:AddVendor(30489, 32294, 32296)

	-- Potent Monarch Topaz -- 53984
	recipe = AddRecipe(53984, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41686, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40048, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Veiled Twilight Opal -- 53985
	recipe = AddRecipe(53985, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41688, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40049, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Willful Monarch Topaz -- 53986
	recipe = AddRecipe(53986, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41730, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40050, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Reckless Monarch Topaz -- 53987
	recipe = AddRecipe(53987, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41690, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40051, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Deadly Monarch Topaz -- 53988
	recipe = AddRecipe(53988, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41721, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40052, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.REVERED, 32538)

	-- Deft Monarch Topaz -- 53991
	recipe = AddRecipe(53991, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41687, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40055, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stalwart Monarch Topaz -- 53993
	recipe = AddRecipe(53993, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41722, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40057, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.WYRMREST)
	recipe:AddRepVendor(FAC.WYRMREST, REP.EXALTED, 32533)

	-- Accurate Twilight Opal -- 53994
	recipe = AddRecipe(53994, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41818, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40058, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddMobDrop(28379, 28851, 29402, 30260, 30448)

	-- Jagged Forest Emerald -- 53996
	recipe = AddRecipe(53996, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41702, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40086, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.FRENZYHEART)
	recipe:AddRepVendor(FAC.FRENZYHEART, REP.REVERED, 31911)
	recipe:AddVendor(28721, 33602)

	-- Nimble Forest Emerald -- 53997
	recipe = AddRecipe(53997, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41698, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Regal Forest Emerald -- 53998
	recipe = AddRecipe(53998, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41697, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40089, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Steady Forest Emerald -- 54000
	recipe = AddRecipe(54000, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41738, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40090, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Forceful Forest Emerald -- 54001
	recipe = AddRecipe(54001, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41693, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40091, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Misty Forest Emerald -- 54003
	recipe = AddRecipe(54003, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41781, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40095, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.ORACLES)
	recipe:AddWorldDrop(Z.NORTHREND)
	recipe:AddRepVendor(FAC.ORACLES, REP.REVERED, 31910)

	-- Turbid Forest Emerald -- 54005
	recipe = AddRecipe(54005, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41737, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40102, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Lightning Forest Emerald -- 54009
	recipe = AddRecipe(54009, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41696, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40100, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Energized Forest Emerald -- 54011
	recipe = AddRecipe(54011, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41692, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40105, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Radiant Forest Emerald -- 54012
	recipe = AddRecipe(54012, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41819, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40098, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddMobDrop(29792, 29793)

	-- Shattered Forest Emerald -- 54014
	recipe = AddRecipe(54014, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41735, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40106, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Precise Bloodstone -- 54017
	recipe = AddRecipe(54017, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 375, 395, 415)
	recipe:SetCraftedItem(39910, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Fierce Monarch Topaz -- 54019
	recipe = AddRecipe(54019, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41793, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40041, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddMobDrop(23954)

	-- Resolute Monarch Topaz -- 54023
	recipe = AddRecipe(54023, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetRecipeItem(41778, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(40059, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Shielded Skyflare Diamond -- 55384
	recipe = AddRecipe(55384, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41705, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41377, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Tireless Skyflare Diamond -- 55386
	recipe = AddRecipe(55386, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(41375, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Forlorn Skyflare Diamond -- 55387
	recipe = AddRecipe(55387, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41743, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41378, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Impassive Skyflare Diamond -- 55388
	recipe = AddRecipe(55388, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41744, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41379, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Chaotic Skyflare Diamond -- 55389
	recipe = AddRecipe(55389, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41704, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41285, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Destructive Skyflare Diamond -- 55390
	recipe = AddRecipe(55390, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41786, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(41307, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Ember Skyflare Diamond -- 55392
	recipe = AddRecipe(55392, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41706, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41333, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Enigmatic Skyflare Diamond -- 55393
	recipe = AddRecipe(55393, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41742, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41335, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Swift Skyflare Diamond -- 55394
	recipe = AddRecipe(55394, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(41339, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Thundering Skyflare Diamond -- 55395
	recipe = AddRecipe(55395, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41787, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(41400, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Insightful Earthsiege Diamond -- 55396
	recipe = AddRecipe(55396, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41708, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41401, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bracing Earthsiege Diamond -- 55397
	recipe = AddRecipe(55397, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41798, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41395, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(27656)

	-- Eternal Earthsiege Diamond -- 55398
	recipe = AddRecipe(55398, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41799, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41396, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.TANK)
	recipe:AddMobDrop(28923)

	-- Powerful Earthsiege Diamond -- 55399
	recipe = AddRecipe(55399, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(41397, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Relentless Earthsiege Diamond -- 55400
	recipe = AddRecipe(55400, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41710, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41398, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Austere Earthsiege Diamond -- 55401
	recipe = AddRecipe(55401, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41797, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41380, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE)
	recipe:AddMobDrop(26861)

	-- Persistent Earthsiege Diamond -- 55402
	recipe = AddRecipe(55402, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(41381, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Trenchant Earthsiege Diamond -- 55403
	recipe = AddRecipe(55403, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41711, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41382, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Invigorating Earthsiege Diamond -- 55404
	recipe = AddRecipe(55404, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41709, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41385, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Beaming Earthsiege Diamond -- 55405
	recipe = AddRecipe(55405, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41788, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(41389, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.NORTHREND)

	-- Revitalizing Skyflare Diamond -- 55407
	recipe = AddRecipe(55407, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(41707, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(41376, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bold Dragon's Eye -- 56049
	recipe = AddRecipe(56049, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42298, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42142, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Delicate Dragon's Eye -- 56052
	recipe = AddRecipe(56052, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42301, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42143, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Brilliant Dragon's Eye -- 56053
	recipe = AddRecipe(56053, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42309, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42144, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Subtle Dragon's Eye -- 56055
	recipe = AddRecipe(56055, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42314, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42151, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Flashing Dragon's Eye -- 56056
	recipe = AddRecipe(56056, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42302, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42152, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Mystic Dragon's Eye -- 56079
	recipe = AddRecipe(56079, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42305, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42158, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Precise Dragon's Eye -- 56081
	recipe = AddRecipe(56081, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42306, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42154, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Quick Dragon's Eye -- 56083
	recipe = AddRecipe(56083, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42307, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42150, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Rigid Dragon's Eye -- 56084
	recipe = AddRecipe(56084, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42308, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42156, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Smooth Dragon's Eye -- 56085
	recipe = AddRecipe(56085, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42310, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42149, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Solid Dragon's Eye -- 56086
	recipe = AddRecipe(56086, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42311, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(36767, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Sparkling Dragon's Eye -- 56087
	recipe = AddRecipe(56087, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42312, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42145, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stormy Dragon's Eye -- 56088
	recipe = AddRecipe(56088, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(370, 370, 390, 415, 440)
	recipe:SetRecipeItem(42313, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42155, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Bloodstone Band -- 56193
	recipe = AddRecipe(56193, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:SetCraftedItem(42336, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sun Rock Ring -- 56194
	recipe = AddRecipe(56194, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:SetCraftedItem(42337, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Jade Dagger Pendant -- 56195
	recipe = AddRecipe(56195, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(380, 380, 400, 410, 420)
	recipe:SetCraftedItem(42338, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Blood Sun Necklace -- 56196
	recipe = AddRecipe(56196, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(380, 380, 400, 410, 420)
	recipe:SetCraftedItem(42339, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Dream Signet -- 56197
	recipe = AddRecipe(56197, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(42340, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Ruby Hare -- 56199
	recipe = AddRecipe(56199, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:SetCraftedItem(42341, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Twilight Serpent -- 56201
	recipe = AddRecipe(56201, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:SetCraftedItem(42395, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Sapphire Owl -- 56202
	recipe = AddRecipe(56202, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:SetCraftedItem(42413, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Figurine - Emerald Boar -- 56203
	recipe = AddRecipe(56203, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:SetCraftedItem(42418, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Dark Jade Focusing Lens -- 56205
	recipe = AddRecipe(56205, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:SetCraftedItem(41367, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shadow Crystal Focusing Lens -- 56206
	recipe = AddRecipe(56206, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(42420, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shadow Jade Focusing Lens -- 56208
	recipe = AddRecipe(56208, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(42421, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Titanium Impact Band -- 56496
	recipe = AddRecipe(56496, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(430, 430, 450, 455, 460)
	recipe:SetRecipeItem(42648, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42642, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Titanium Earthguard Ring -- 56497
	recipe = AddRecipe(56497, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(430, 430, 450, 455, 460)
	recipe:SetRecipeItem(42649, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42643, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Titanium Spellshock Ring -- 56498
	recipe = AddRecipe(56498, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(430, 430, 450, 455, 460)
	recipe:SetRecipeItem(42650, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42644, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Titanium Impact Choker -- 56499
	recipe = AddRecipe(56499, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:SetRecipeItem(42651, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42645, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Titanium Earthguard Chain -- 56500
	recipe = AddRecipe(56500, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:SetRecipeItem(42652, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42646, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Titanium Spellshock Necklace -- 56501
	recipe = AddRecipe(56501, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:SetRecipeItem(42653, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(42647, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Enchanted Pearl -- 56530
	recipe = AddRecipe(56530, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(42701, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PRISMATIC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Enchanted Tear -- 56531
	recipe = AddRecipe(56531, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(390, 390, 410, 425, 440)
	recipe:SetCraftedItem(42702, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PRISMATIC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Crystal Citrine Necklace -- 58141
	recipe = AddRecipe(58141, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:SetCraftedItem(43244, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Crystal Chalcedony Amulet -- 58142
	recipe = AddRecipe(58142, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 380, 400, 420)
	recipe:SetCraftedItem(43245, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Earthshadow Ring -- 58143
	recipe = AddRecipe(58143, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(43246, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Jade Ring of Slaying -- 58144
	recipe = AddRecipe(58144, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(43247, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Stoneguard Band -- 58145
	recipe = AddRecipe(58145, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(390, 390, 410, 420, 430)
	recipe:SetCraftedItem(43248, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shadowmight Ring -- 58146
	recipe = AddRecipe(58146, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(390, 390, 410, 420, 430)
	recipe:SetCraftedItem(43249, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Ring of Earthen Might -- 58147
	recipe = AddRecipe(58147, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43317, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43250, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Ring of Scarlet Shadows -- 58148
	recipe = AddRecipe(58148, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43318, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43251, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Windfire Band -- 58149
	recipe = AddRecipe(58149, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43319, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43252, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Ring of Northern Tears -- 58150
	recipe = AddRecipe(58150, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43320, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43253, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Savage Titanium Ring -- 58492
	recipe = AddRecipe(58492, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43485, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43482, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Savage Titanium Band -- 58507
	recipe = AddRecipe(58507, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43497, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43498, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Titanium Frostguard Ring -- 58954
	recipe = AddRecipe(58954, V.WOTLK, Q.EPIC)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetRecipeItem(43597, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(43582, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(28721, 33602)

	-- Figurine - Monarch Crab -- 59759
	recipe = AddRecipe(59759, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 430, 440, 450)
	recipe:SetCraftedItem(44063, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Icy Prism -- 62242
	recipe = AddRecipe(62242, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 445, 457, 470)
	recipe:SetCraftedItem(44943, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Prismatic Black Diamond -- 62941
	recipe = AddRecipe(62941, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:SetCraftedItem(45054, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Amulet of Truesight -- 63743
	recipe = AddRecipe(63743, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 210, 220, 230)
	recipe:SetCraftedItem(45627, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 33680, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Emerald Choker -- 64725
	recipe = AddRecipe(64725, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(45812, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sky Sapphire Amulet -- 64726
	recipe = AddRecipe(64726, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(45813, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Runed Mana Band -- 64727
	recipe = AddRecipe(64727, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(45808, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Scarlet Signet -- 64728
	recipe = AddRecipe(64728, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(420, 420, 440, 450, 460)
	recipe:SetCraftedItem(45809, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Regal Eye of Zul -- 66338
	recipe = AddRecipe(66338, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46897, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40167, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Steady Eye of Zul -- 66428
	recipe = AddRecipe(66428, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46898, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40168, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Nimble Eye of Zul -- 66429
	recipe = AddRecipe(66429, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46899, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40166, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Jagged Eye of Zul -- 66431
	recipe = AddRecipe(66431, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46901, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40165, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Timeless Dreadstone -- 66432
	recipe = AddRecipe(66432, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46902, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40164, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Forceful Eye of Zul -- 66434
	recipe = AddRecipe(66434, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46904, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40169, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Misty Eye of Zul -- 66435
	recipe = AddRecipe(66435, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46905, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40171, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Lightning Eye of Zul -- 66439
	recipe = AddRecipe(66439, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46909, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40177, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Radiant Eye of Zul -- 66441
	recipe = AddRecipe(66441, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46911, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40180, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Energized Eye of Zul -- 66442
	recipe = AddRecipe(66442, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46912, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40179, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Shattered Eye of Zul -- 66443
	recipe = AddRecipe(66443, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46913, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40182, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Turbid Eye of Zul -- 66445
	recipe = AddRecipe(66445, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46915, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40173, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Brilliant Cardinal Ruby -- 66446
	recipe = AddRecipe(66446, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46916, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40113, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Bold Cardinal Ruby -- 66447
	recipe = AddRecipe(66447, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46917, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40111, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Delicate Cardinal Ruby -- 66448
	recipe = AddRecipe(66448, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46918, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40112, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Precise Cardinal Ruby -- 66450
	recipe = AddRecipe(66450, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46920, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40118, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Subtle King's Amber -- 66452
	recipe = AddRecipe(66452, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46922, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40115, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Flashing Cardinal Ruby -- 66453
	recipe = AddRecipe(66453, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46923, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40116, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Solid Majestic Zircon -- 66497
	recipe = AddRecipe(66497, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46924, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40119, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Sparkling Majestic Zircon -- 66498
	recipe = AddRecipe(66498, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46925, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40120, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Stormy Majestic Zircon -- 66499
	recipe = AddRecipe(66499, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46926, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40122, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Rigid Majestic Zircon -- 66501
	recipe = AddRecipe(66501, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46928, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40125, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Smooth King's Amber -- 66502
	recipe = AddRecipe(66502, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46929, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40124, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Mystic King's Amber -- 66505
	recipe = AddRecipe(66505, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46932, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40127, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Quick King's Amber -- 66506
	recipe = AddRecipe(66506, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46933, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40128, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Sovereign Dreadstone -- 66554
	recipe = AddRecipe(66554, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46935, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40129, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Purified Dreadstone -- 66556
	recipe = AddRecipe(66556, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46937, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40133, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Shifting Dreadstone -- 66557
	recipe = AddRecipe(66557, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46938, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40130, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Defender's Dreadstone -- 66560
	recipe = AddRecipe(66560, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46941, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40139, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Guardian's Dreadstone -- 66561
	recipe = AddRecipe(66561, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46942, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40141, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Mysterious Dreadstone -- 66562
	recipe = AddRecipe(66562, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46943, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40135, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Inscribed Ametrine -- 66567
	recipe = AddRecipe(66567, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46948, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40142, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Deadly Ametrine -- 66568
	recipe = AddRecipe(66568, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46949, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40147, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Potent Ametrine -- 66569
	recipe = AddRecipe(66569, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46950, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40152, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Veiled Dreadstone -- 66570
	recipe = AddRecipe(66570, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46951, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40153, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Willful Ametrine -- 66571
	recipe = AddRecipe(66571, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46952, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40154, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Etched Dreadstone -- 66572
	recipe = AddRecipe(66572, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46953, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40143, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Glinting Dreadstone -- 66573
	recipe = AddRecipe(66573, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(46956, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40157, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Reckless Ametrine -- 66574
	recipe = AddRecipe(66574, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47007, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40155, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Accurate Dreadstone -- 66576
	recipe = AddRecipe(66576, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47010, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40162, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Champion's Ametrine -- 66579
	recipe = AddRecipe(66579, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47015, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40144, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Stalwart Ametrine -- 66581
	recipe = AddRecipe(66581, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47017, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40160, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Resplendent Ametrine -- 66582
	recipe = AddRecipe(66582, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47018, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40145, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Fierce Ametrine -- 66583
	recipe = AddRecipe(66583, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47019, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40146, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Deft Ametrine -- 66584
	recipe = AddRecipe(66584, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47020, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40150, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Lucent Ametrine -- 66585
	recipe = AddRecipe(66585, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47021, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40149, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Resolute Ametrine -- 66586
	recipe = AddRecipe(66586, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(47022, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40163, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Nightmare Tear -- 68253
	recipe = AddRecipe(68253, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetRecipeItem(49112, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(49110, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PRISMATIC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-------------------------------------------------------------------------------
	-- Cataclysm.
	-------------------------------------------------------------------------------
	-- Bold Carnelian -- 73222
	recipe = AddRecipe(73222, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52081, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Delicate Carnelian -- 73223
	recipe = AddRecipe(73223, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52082, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Flashing Carnelian -- 73224
	recipe = AddRecipe(73224, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52363, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52083, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Brilliant Carnelian -- 73225
	recipe = AddRecipe(73225, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52084, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Precise Carnelian -- 73226
	recipe = AddRecipe(73226, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52085, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Solid Zephyrite -- 73227
	recipe = AddRecipe(73227, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52086, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sparkling Zephyrite -- 73228
	recipe = AddRecipe(73228, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52087, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Stormy Zephyrite -- 73229
	recipe = AddRecipe(73229, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52364, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Rigid Zephyrite -- 73230
	recipe = AddRecipe(73230, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52089, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Subtle Alicite -- 73231
	recipe = AddRecipe(73231, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52365, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52090, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Smooth Alicite -- 73232
	recipe = AddRecipe(73232, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52091, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Quick Alicite -- 73234
	recipe = AddRecipe(73234, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52093, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Fractured Alicite -- 73239
	recipe = AddRecipe(73239, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52094, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sovereign Nightstone -- 73240
	recipe = AddRecipe(73240, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52095, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shifting Nightstone -- 73241
	recipe = AddRecipe(73241, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52096, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Defender's Nightstone -- 73242
	recipe = AddRecipe(73242, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52366, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52097, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Timeless Nightstone -- 73243
	recipe = AddRecipe(73243, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52098, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Guardian's Nightstone -- 73244
	recipe = AddRecipe(73244, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52367, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52099, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Purified Nightstone -- 73245
	recipe = AddRecipe(73245, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52368, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52100, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Etched Nightstone -- 73246
	recipe = AddRecipe(73246, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52101, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Glinting Nightstone -- 73247
	recipe = AddRecipe(73247, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52102, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Retaliating Nightstone -- 73248
	recipe = AddRecipe(73248, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52369, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52103, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Veiled Nightstone -- 73249
	recipe = AddRecipe(73249, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52104, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Accurate Nightstone -- 73250
	recipe = AddRecipe(73250, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52105, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Polished Hessonite -- 73258
	recipe = AddRecipe(73258, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52370, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52106, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Inscribed Hessonite -- 73260
	recipe = AddRecipe(73260, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52371, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52108, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Deadly Hessonite -- 73262
	recipe = AddRecipe(73262, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52372, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52109, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Potent Hessonite -- 73263
	recipe = AddRecipe(73263, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52373, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52110, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Fierce Hessonite -- 73264
	recipe = AddRecipe(73264, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52374, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52111, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Deft Hessonite -- 73265
	recipe = AddRecipe(73265, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52375, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52112, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Reckless Hessonite -- 73266
	recipe = AddRecipe(73266, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:SetCraftedItem(52113, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Skillful Hessonite -- 73267
	recipe = AddRecipe(73267, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52114, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Adept Hessonite -- 73268
	recipe = AddRecipe(73268, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52115, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Fine Hessonite -- 73269
	recipe = AddRecipe(73269, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52376, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52116, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Artful Hessonite -- 73270
	recipe = AddRecipe(73270, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52117, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Keen Hessonite -- 73271
	recipe = AddRecipe(73271, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52377, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52118, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Regal Jasper -- 73272
	recipe = AddRecipe(73272, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52378, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52119, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Nimble Jasper -- 73273
	recipe = AddRecipe(73273, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52379, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52120, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Jagged Jasper -- 73274
	recipe = AddRecipe(73274, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52121, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Piercing Jasper -- 73275
	recipe = AddRecipe(73275, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52382, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52122, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Steady Jasper -- 73276
	recipe = AddRecipe(73276, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52383, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52123, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Forceful Jasper -- 73277
	recipe = AddRecipe(73277, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52385, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52124, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Lightning Jasper -- 73278
	recipe = AddRecipe(73278, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52386, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52125, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Puissant Jasper -- 73279
	recipe = AddRecipe(73279, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52126, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Zen Jasper -- 73280
	recipe = AddRecipe(73280, V.CATA, Q.UNCOMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetRecipeItem(52388, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52127, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Sensei's Jasper -- 73281
	recipe = AddRecipe(73281, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52128, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Bold Inferno Ruby -- 73335
	recipe = AddRecipe(73335, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52362, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Delicate Inferno Ruby -- 73336
	recipe = AddRecipe(73336, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52380, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Flashing Inferno Ruby -- 73337
	recipe = AddRecipe(73337, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52384, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Brilliant Inferno Ruby -- 73338
	recipe = AddRecipe(73338, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52387, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Precise Inferno Ruby -- 73339
	recipe = AddRecipe(73339, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52389, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Solid Ocean Sapphire -- 73340
	recipe = AddRecipe(73340, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52390, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Sparkling Ocean Sapphire -- 73341
	recipe = AddRecipe(73341, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52391, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Stormy Ocean Sapphire -- 73343
	recipe = AddRecipe(73343, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52392, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Rigid Ocean Sapphire -- 73344
	recipe = AddRecipe(73344, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52393, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Subtle Amberjewel -- 73345
	recipe = AddRecipe(73345, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52394, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Smooth Amberjewel -- 73346
	recipe = AddRecipe(73346, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52395, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Mystic Amberjewel -- 73347
	recipe = AddRecipe(73347, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52396, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Quick Amberjewel -- 73348
	recipe = AddRecipe(73348, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52397, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Fractured Amberjewel -- 73349
	recipe = AddRecipe(73349, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52398, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Sovereign Demonseye -- 73350
	recipe = AddRecipe(73350, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52399, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Shifting Demonseye -- 73351
	recipe = AddRecipe(73351, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52400, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Defender's Demonseye -- 73352
	recipe = AddRecipe(73352, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52401, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Timeless Demonseye -- 73353
	recipe = AddRecipe(73353, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52402, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Guardian's Demonseye -- 73354
	recipe = AddRecipe(73354, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52403, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Purified Demonseye -- 73355
	recipe = AddRecipe(73355, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52404, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Etched Demonseye -- 73356
	recipe = AddRecipe(73356, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52405, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Glinting Demonseye -- 73357
	recipe = AddRecipe(73357, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52406, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Retaliating Demonseye -- 73358
	recipe = AddRecipe(73358, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52407, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Veiled Demonseye -- 73359
	recipe = AddRecipe(73359, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52408, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Accurate Demonseye -- 73360
	recipe = AddRecipe(73360, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52409, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Polished Ember Topaz -- 73361
	recipe = AddRecipe(73361, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52410, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Resolute Ember Topaz -- 73362
	recipe = AddRecipe(73362, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52411, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Inscribed Ember Topaz -- 73364
	recipe = AddRecipe(73364, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52412, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Deadly Ember Topaz -- 73365
	recipe = AddRecipe(73365, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52413, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Potent Ember Topaz -- 73366
	recipe = AddRecipe(73366, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52414, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Fierce Ember Topaz -- 73367
	recipe = AddRecipe(73367, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52415, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Deft Ember Topaz -- 73368
	recipe = AddRecipe(73368, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52416, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Reckless Ember Topaz -- 73369
	recipe = AddRecipe(73369, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52417, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Skillful Ember Topaz -- 73370
	recipe = AddRecipe(73370, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52418, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Adept Ember Topaz -- 73371
	recipe = AddRecipe(73371, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52419, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Fine Ember Topaz -- 73372
	recipe = AddRecipe(73372, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52420, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Artful Ember Topaz -- 73373
	recipe = AddRecipe(73373, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52421, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Keen Ember Topaz -- 73374
	recipe = AddRecipe(73374, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52422, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Regal Dream Emerald -- 73375
	recipe = AddRecipe(73375, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52423, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Nimble Dream Emerald -- 73376
	recipe = AddRecipe(73376, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52424, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Jagged Dream Emerald -- 73377
	recipe = AddRecipe(73377, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52425, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Piercing Dream Emerald -- 73378
	recipe = AddRecipe(73378, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52426, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Steady Dream Emerald -- 73379
	recipe = AddRecipe(73379, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52427, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Forceful Dream Emerald -- 73380
	recipe = AddRecipe(73380, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52428, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Lightning Dream Emerald -- 73381
	recipe = AddRecipe(73381, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52429, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Puissant Dream Emerald -- 73382
	recipe = AddRecipe(73382, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52430, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Zen Dream Emerald -- 73383
	recipe = AddRecipe(73383, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52431, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Sensei's Dream Emerald -- 73384
	recipe = AddRecipe(73384, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(52432, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Bold Chimera's Eye -- 73396
	recipe = AddRecipe(73396, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52381, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Delicate Chimera's Eye -- 73397
	recipe = AddRecipe(73397, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52447, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Flashing Chimera's Eye -- 73398
	recipe = AddRecipe(73398, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52448, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Brilliant Chimera's Eye -- 73399
	recipe = AddRecipe(73399, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52449, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Precise Chimera's Eye -- 73400
	recipe = AddRecipe(73400, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52450, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Solid Chimera's Eye -- 73401
	recipe = AddRecipe(73401, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52451, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Sparkling Chimera's Eye -- 73402
	recipe = AddRecipe(73402, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52452, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52262, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Stormy Chimera's Eye -- 73403
	recipe = AddRecipe(73403, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52453, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52263, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Rigid Chimera's Eye -- 73404
	recipe = AddRecipe(73404, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52454, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Subtle Chimera's Eye -- 73405
	recipe = AddRecipe(73405, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52455, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52265, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Smooth Chimera's Eye -- 73406
	recipe = AddRecipe(73406, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52456, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Mystic Chimera's Eye -- 73407
	recipe = AddRecipe(73407, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52457, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Quick Chimera's Eye -- 73408
	recipe = AddRecipe(73408, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52458, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Fractured Chimera's Eye -- 73409
	recipe = AddRecipe(73409, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetRecipeItem(52459, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Fleet Shadowspirit Diamond -- 73464
	recipe = AddRecipe(73464, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52433, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Chaotic Shadowspirit Diamond -- 73465
	recipe = AddRecipe(73465, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52434, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Bracing Shadowspirit Diamond -- 73466
	recipe = AddRecipe(73466, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52435, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Eternal Shadowspirit Diamond -- 73467
	recipe = AddRecipe(73467, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52436, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Austere Shadowspirit Diamond -- 73468
	recipe = AddRecipe(73468, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52437, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Effulgent Shadowspirit Diamond -- 73469
	recipe = AddRecipe(73469, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52438, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Ember Shadowspirit Diamond -- 73470
	recipe = AddRecipe(73470, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52439, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Revitalizing Shadowspirit Diamond -- 73471
	recipe = AddRecipe(73471, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52440, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Destructive Shadowspirit Diamond -- 73472
	recipe = AddRecipe(73472, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52441, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Powerful Shadowspirit Diamond -- 73473
	recipe = AddRecipe(73473, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52442, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Enigmatic Shadowspirit Diamond -- 73474
	recipe = AddRecipe(73474, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52443, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Impassive Shadowspirit Diamond -- 73475
	recipe = AddRecipe(73475, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52444, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Forlorn Shadowspirit Diamond -- 73476
	recipe = AddRecipe(73476, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(52445, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Fire Prism -- 73478
	recipe = AddRecipe(73478, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 525)
	recipe:SetCraftedItem(52304, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MATERIALS")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Jasper Ring -- 73494
	recipe = AddRecipe(73494, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 450, 467, 485)
	recipe:SetCraftedItem(52306, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Hessonite Band -- 73495
	recipe = AddRecipe(73495, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 485, 495, 505)
	recipe:SetCraftedItem(52308, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Alicite Pendant -- 73496
	recipe = AddRecipe(73496, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 467, 485)
	recipe:SetCraftedItem(52307, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Nightstone Choker -- 73497
	recipe = AddRecipe(73497, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(460, 460, 495, 505, 515)
	recipe:SetCraftedItem(52309, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Band of Blades -- 73498
	recipe = AddRecipe(73498, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52461, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52318, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Ring of Warring Elements -- 73502
	recipe = AddRecipe(73502, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52462, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52319, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Elementium Moebius Band -- 73503
	recipe = AddRecipe(73503, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52463, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52320, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Entwined Elementium Choker -- 73504
	recipe = AddRecipe(73504, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52465, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52321, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Eye of Many Deaths -- 73505
	recipe = AddRecipe(73505, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52466, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52322, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Elementium Guardian -- 73506
	recipe = AddRecipe(73506, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52467, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52323, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Elementium Destroyer's Ring -- 73520
	recipe = AddRecipe(73520, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52460, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52348, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Brazen Elementium Medallion -- 73521
	recipe = AddRecipe(73521, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(52464, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(52350, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Carnelian Spikes -- 73620
	recipe = AddRecipe(73620, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:SetCraftedItem(52492, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_FIST_WEAPON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- The Perforator -- 73621
	recipe = AddRecipe(73621, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:SetCraftedItem(52493, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_FIST_WEAPON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 19775, 19778, 26915, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Stardust -- 73622
	recipe = AddRecipe(73622, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetCraftedItem(52490, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_CREATED_ITEM")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18774, 19778, 26915, 26997, 28701, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Rhinestone Sunglasses -- 73623
	recipe = AddRecipe(73623, V.CATA, Q.RARE)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetRecipeItem(71965, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52489, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Jeweler's Ruby Monocle -- 73625
	recipe = AddRecipe(73625, V.CATA, Q.RARE)
	recipe:SetSkillLevels(450, 450, 480, 490, 500)
	recipe:SetRecipeItem(52494, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52485, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Jeweler's Sapphire Monocle -- 73626
	recipe = AddRecipe(73626, V.CATA, Q.RARE)
	recipe:SetSkillLevels(455, 455, 485, 495, 505)
	recipe:SetRecipeItem(52495, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52486, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Jeweler's Amber Monocle -- 73627
	recipe = AddRecipe(73627, V.CATA, Q.RARE)
	recipe:SetSkillLevels(460, 460, 490, 500, 510)
	recipe:SetRecipeItem(52496, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(52487, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_HEAD")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Willful Ember Topaz -- 95754
	recipe = AddRecipe(95754, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(68359, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Lucent Ember Topaz -- 95755
	recipe = AddRecipe(95755, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(68360, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Resplendent Ember Topaz -- 95756
	recipe = AddRecipe(95756, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(68361, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Vivid Dream Emerald -- 96226
	recipe = AddRecipe(96226, V.CATA, Q.RARE)
	recipe:SetSkillLevels(465, 465, 500, 507, 515)
	recipe:SetRecipeItem(68742, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(68741, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Agile Shadowspirit Diamond -- 96255
	recipe = AddRecipe(96255, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(68781, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(68778, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.DEEPHOLM, Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Reverberating Shadowspirit Diamond -- 96256
	recipe = AddRecipe(96256, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(68782, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(68779, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.DEEPHOLM, Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Burning Shadowspirit Diamond -- 96257
	recipe = AddRecipe(96257, V.CATA, Q.RARE)
	recipe:SetSkillLevels(490, 490, 515, 520, 525)
	recipe:SetRecipeItem(68783, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(68780, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.DEEPHOLM, Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Punisher's Band -- 98921
	recipe = AddRecipe(98921, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(69853, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(69852, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(16624, 17512, 44583, 50480, 50482, 52584, 52588, 52644, 52658)

	-- Vicious Sapphire Ring -- 99539
	recipe = AddRecipe(99539, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetCraftedItem(70071, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(28701, 44582, 52586, 52657, 65098)

	-- Vicious Amberjewel Band -- 99540
	recipe = AddRecipe(99540, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetCraftedItem(70072, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(28701, 44582, 52586, 52657, 65098)

	-- Vicious Ruby Signet -- 99541
	recipe = AddRecipe(99541, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetCraftedItem(70073, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(28701, 44582, 52586, 52657, 65098)

	-- Vicious Sapphire Necklace -- 99542
	recipe = AddRecipe(99542, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetCraftedItem(70074, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(28701, 44582, 52586, 52657, 65098)

	-- Vicious Amberjewel Pendant -- 99543
	recipe = AddRecipe(99543, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetCraftedItem(70075, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(28701, 44582, 52586, 52657, 65098)

	-- Vicious Ruby Choker -- 99544
	recipe = AddRecipe(99544, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetCraftedItem(70076, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(28701, 44582, 52586, 52657, 65098)

	-- Rigid Deepholm Iolite -- 101735
	recipe = AddRecipe(101735, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71821, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Stormy Deepholm Iolite -- 101740
	recipe = AddRecipe(101740, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71884, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Sparkling Deepholm Iolite -- 101741
	recipe = AddRecipe(101741, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71885, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Solid Deepholm Iolite -- 101742
	recipe = AddRecipe(101742, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71886, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Misty Elven Peridot -- 101743
	recipe = AddRecipe(101743, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71887, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Piercing Elven Peridot -- 101744
	recipe = AddRecipe(101744, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71888, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Lightning Elven Peridot -- 101745
	recipe = AddRecipe(101745, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71889, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Sensei's Elven Peridot -- 101746
	recipe = AddRecipe(101746, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71890, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Infused Elven Peridot -- 101747
	recipe = AddRecipe(101747, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71891, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Zen Elven Peridot -- 101748
	recipe = AddRecipe(101748, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71892, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Balanced Elven Peridot -- 101749
	recipe = AddRecipe(101749, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71893, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Vivid Elven Peridot -- 101750
	recipe = AddRecipe(101750, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71894, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Turbid Elven Peridot -- 101751
	recipe = AddRecipe(101751, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71895, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Radiant Elven Peridot -- 101752
	recipe = AddRecipe(101752, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71896, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Shattered Elven Peridot -- 101753
	recipe = AddRecipe(101753, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71897, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Energized Elven Peridot -- 101754
	recipe = AddRecipe(101754, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71898, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Jagged Elven Peridot -- 101755
	recipe = AddRecipe(101755, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71899, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Regal Elven Peridot -- 101756
	recipe = AddRecipe(101756, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71900, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Forceful Elven Peridot -- 101757
	recipe = AddRecipe(101757, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71901, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Nimble Elven Peridot -- 101758
	recipe = AddRecipe(101758, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71902, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Puissant Elven Peridot -- 101759
	recipe = AddRecipe(101759, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71903, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Steady Elven Peridot -- 101760
	recipe = AddRecipe(101760, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71904, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Deadly Lava Coral -- 101761
	recipe = AddRecipe(101761, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71905, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Crafty Lava Coral -- 101762
	recipe = AddRecipe(101762, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71906, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Potent Lava Coral -- 101763
	recipe = AddRecipe(101763, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71907, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Inscribed Lava Coral -- 101764
	recipe = AddRecipe(101764, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71908, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Polished Lava Coral -- 101765
	recipe = AddRecipe(101765, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71909, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Resolute Lava Coral -- 101766
	recipe = AddRecipe(101766, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71910, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Stalwart Lava Coral -- 101767
	recipe = AddRecipe(101767, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71911, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Champion's Lava Coral -- 101768
	recipe = AddRecipe(101768, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71912, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Deft Lava Coral -- 101769
	recipe = AddRecipe(101769, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71913, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Wicked Lava Coral -- 101770
	recipe = AddRecipe(101770, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71914, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Reckless Lava Coral -- 101771
	recipe = AddRecipe(101771, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71915, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Fierce Lava Coral -- 101772
	recipe = AddRecipe(101772, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71916, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Adept Lava Coral -- 101773
	recipe = AddRecipe(101773, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71917, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Keen Lava Coral -- 101774
	recipe = AddRecipe(101774, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71918, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Artful Lava Coral -- 101775
	recipe = AddRecipe(101775, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71919, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Fine Lava Coral -- 101776
	recipe = AddRecipe(101776, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71920, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Skillful Lava Coral -- 101777
	recipe = AddRecipe(101777, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71921, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Lucent Lava Coral -- 101778
	recipe = AddRecipe(101778, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71922, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Tenuous Lava Coral -- 101779
	recipe = AddRecipe(101779, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71923, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Willful Lava Coral -- 101780
	recipe = AddRecipe(101780, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71924, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Splendid Lava Coral -- 101781
	recipe = AddRecipe(101781, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71925, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Resplendent Lava Coral -- 101782
	recipe = AddRecipe(101782, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71926, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Glinting Shadow Spinel -- 101783
	recipe = AddRecipe(101783, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71927, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Accurate Shadow Spinel -- 101784
	recipe = AddRecipe(101784, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71928, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(71863, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Veiled Shadow Spinel -- 101785
	recipe = AddRecipe(101785, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71929, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Retaliating Shadow Spinel -- 101786
	recipe = AddRecipe(101786, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71930, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Etched Shadow Spinel -- 101787
	recipe = AddRecipe(101787, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71931, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Mysterious Shadow Spinel -- 101788
	recipe = AddRecipe(101788, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71932, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Purified Shadow Spinel -- 101789
	recipe = AddRecipe(101789, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71933, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Shifting Shadow Spinel -- 101790
	recipe = AddRecipe(101790, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71934, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Guardian's Shadow Spinel -- 101791
	recipe = AddRecipe(101791, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71935, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Timeless Shadow Spinel -- 101792
	recipe = AddRecipe(101792, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71936, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Defender's Shadow Spinel -- 101793
	recipe = AddRecipe(101793, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71937, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Sovereign Shadow Spinel -- 101794
	recipe = AddRecipe(101794, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71938, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Delicate Queen's Garnet -- 101795
	recipe = AddRecipe(101795, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71939, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Precise Queen's Garnet -- 101796
	recipe = AddRecipe(101796, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71940, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Brilliant Queen's Garnet -- 101797
	recipe = AddRecipe(101797, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71941, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Flashing Queen's Garnet -- 101798
	recipe = AddRecipe(101798, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71942, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Bold Queen's Garnet -- 101799
	recipe = AddRecipe(101799, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71943, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddVendor(56925, 57922)

	-- Smooth Lightstone -- 101800
	recipe = AddRecipe(101800, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71944, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Subtle Lightstone -- 101801
	recipe = AddRecipe(101801, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71945, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddVendor(56925, 57922)

	-- Quick Lightstone -- 101802
	recipe = AddRecipe(101802, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71946, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(56925, 57922)

	-- Fractured Lightstone -- 101803
	recipe = AddRecipe(101803, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71947, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-- Mystic Lightstone -- 101804
	recipe = AddRecipe(101804, V.CATA, Q.RARE)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetRecipeItem(71948, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(56925, 57922)

	-------------------------------------------------------------------------------
	-- Mists of Pandaria.
	-------------------------------------------------------------------------------
	-- Rigid River's Heart -- 106947
	recipe = AddRecipe(106947, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Stormy River's Heart -- 106948
	recipe = AddRecipe(106948, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Sparkling River's Heart -- 106949
	recipe = AddRecipe(106949, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Solid River's Heart -- 106950
	recipe = AddRecipe(106950, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Misty Wild Jade -- 106953
	recipe = AddRecipe(106953, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Piercing Wild Jade -- 106954
	recipe = AddRecipe(106954, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Lightning Wild Jade -- 106955
	recipe = AddRecipe(106955, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Sensei's Wild Jade -- 106956
	recipe = AddRecipe(106956, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Effulgent Wild Jade -- 106957
	recipe = AddRecipe(106957, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Zen Wild Jade -- 106958
	recipe = AddRecipe(106958, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Balanced Wild Jade -- 106960
	recipe = AddRecipe(106960, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Vivid Wild Jade -- 106961
	recipe = AddRecipe(106961, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Turbid Wild Jade -- 106962
	recipe = AddRecipe(106962, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Balanced Alexandrite -- 107598
	recipe = AddRecipe(107598, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Effulgent Alexandrite -- 107599
	recipe = AddRecipe(107599, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Energized Alexandrite -- 107600
	recipe = AddRecipe(107600, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(560, 560, 570, 575, 580)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Forceful Alexandrite -- 107601
	recipe = AddRecipe(107601, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(565, 565, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Jagged Alexandrite -- 107602
	recipe = AddRecipe(107602, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Lightning Alexandrite -- 107604
	recipe = AddRecipe(107604, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Misty Alexandrite -- 107605
	recipe = AddRecipe(107605, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(540, 540, 550, 555, 560)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Nimble Alexandrite -- 107606
	recipe = AddRecipe(107606, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Piercing Alexandrite -- 107607
	recipe = AddRecipe(107607, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Puissant Alexandrite -- 107608
	recipe = AddRecipe(107608, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(570, 570, 580, 585, 590)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Radiant Alexandrite -- 107609
	recipe = AddRecipe(107609, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Regal Alexandrite -- 107610
	recipe = AddRecipe(107610, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sensei's Alexandrite -- 107611
	recipe = AddRecipe(107611, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shattered Alexandrite -- 107612
	recipe = AddRecipe(107612, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(540, 540, 550, 555, 560)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Steady Alexandrite -- 107613
	recipe = AddRecipe(107613, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Turbid Alexandrite -- 107614
	recipe = AddRecipe(107614, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Vivid Alexandrite -- 107615
	recipe = AddRecipe(107615, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Zen Alexandrite -- 107616
	recipe = AddRecipe(107616, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Rigid Lapis Lazuli -- 107617
	recipe = AddRecipe(107617, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Solid Lapis Lazuli -- 107619
	recipe = AddRecipe(107619, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sparkling Lapis Lazuli -- 107620
	recipe = AddRecipe(107620, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Stormy Lapis Lazuli -- 107621
	recipe = AddRecipe(107621, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Bold Pandarian Garnet -- 107622
	recipe = AddRecipe(107622, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(570, 570, 580, 585, 590)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Brilliant Pandarian Garnet -- 107623
	recipe = AddRecipe(107623, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(560, 560, 570, 575, 580)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Delicate Pandarian Garnet -- 107624
	recipe = AddRecipe(107624, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Flashing Pandarian Garnet -- 107625
	recipe = AddRecipe(107625, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Precise Pandarian Garnet -- 107626
	recipe = AddRecipe(107626, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(540, 540, 550, 555, 560)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Accurate Roguestone -- 107627
	recipe = AddRecipe(107627, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Defender's Roguestone -- 107628
	recipe = AddRecipe(107628, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Etched Roguestone -- 107630
	recipe = AddRecipe(107630, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Glinting Roguestone -- 107631
	recipe = AddRecipe(107631, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(540, 540, 550, 555, 560)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Guardian's Roguestone -- 107632
	recipe = AddRecipe(107632, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Mysterious Roguestone -- 107633
	recipe = AddRecipe(107633, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Purified Roguestone -- 107634
	recipe = AddRecipe(107634, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(565, 565, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Retaliating Roguestone -- 107635
	recipe = AddRecipe(107635, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shifting Roguestone -- 107636
	recipe = AddRecipe(107636, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sovereign Roguestone -- 107637
	recipe = AddRecipe(107637, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Timeless Roguestone -- 107638
	recipe = AddRecipe(107638, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(560, 560, 570, 575, 580)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Veiled Roguestone -- 107639
	recipe = AddRecipe(107639, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Fractured Sunstone -- 107640
	recipe = AddRecipe(107640, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Mystic Sunstone -- 107641
	recipe = AddRecipe(107641, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Quick Sunstone -- 107642
	recipe = AddRecipe(107642, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Smooth Sunstone -- 107643
	recipe = AddRecipe(107643, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(565, 565, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Subtle Sunstone -- 107644
	recipe = AddRecipe(107644, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Adept Tiger Opal -- 107645
	recipe = AddRecipe(107645, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Artful Tiger Opal -- 107646
	recipe = AddRecipe(107646, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Champion's Tiger Opal -- 107647
	recipe = AddRecipe(107647, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Crafty Tiger Opal -- 107648
	recipe = AddRecipe(107648, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(565, 565, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Deadly Tiger Opal -- 107649
	recipe = AddRecipe(107649, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Deft Tiger Opal -- 107650
	recipe = AddRecipe(107650, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Fierce Tiger Opal -- 107651
	recipe = AddRecipe(107651, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Fine Tiger Opal -- 107652
	recipe = AddRecipe(107652, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Inscribed Tiger Opal -- 107653
	recipe = AddRecipe(107653, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(555, 555, 565, 570, 575)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Keen Tiger Opal -- 107654
	recipe = AddRecipe(107654, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Lucent Tiger Opal -- 107655
	recipe = AddRecipe(107655, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(540, 540, 550, 555, 560)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Polished Tiger Opal -- 107656
	recipe = AddRecipe(107656, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Potent Tiger Opal -- 107657
	recipe = AddRecipe(107657, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(560, 560, 570, 575, 580)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Reckless Tiger Opal -- 107658
	recipe = AddRecipe(107658, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(540, 540, 550, 555, 560)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Resolute Tiger Opal -- 107659
	recipe = AddRecipe(107659, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Resplendent Tiger Opal -- 107660
	recipe = AddRecipe(107660, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Skillful Tiger Opal -- 107661
	recipe = AddRecipe(107661, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(560, 560, 570, 575, 580)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Splendid Tiger Opal -- 107662
	recipe = AddRecipe(107662, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(570, 570, 580, 585, 590)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Stalwart Tiger Opal -- 107663
	recipe = AddRecipe(107663, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(565, 565, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Tenuous Tiger Opal -- 107665
	recipe = AddRecipe(107665, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Wicked Tiger Opal -- 107666
	recipe = AddRecipe(107666, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(570, 570, 580, 585, 590)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Willful Tiger Opal -- 107667
	recipe = AddRecipe(107667, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Accurate Imperial Amethyst -- 107693
	recipe = AddRecipe(107693, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Defender's Imperial Amethyst -- 107694
	recipe = AddRecipe(107694, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Etched Imperial Amethyst -- 107695
	recipe = AddRecipe(107695, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Glinting Imperial Amethyst -- 107696
	recipe = AddRecipe(107696, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Guardian's Imperial Amethyst -- 107697
	recipe = AddRecipe(107697, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Mysterious Imperial Amethyst -- 107698
	recipe = AddRecipe(107698, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Purified Imperial Amethyst -- 107699
	recipe = AddRecipe(107699, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Retaliating Imperial Amethyst -- 107700
	recipe = AddRecipe(107700, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Shifting Imperial Amethyst -- 107701
	recipe = AddRecipe(107701, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Sovereign Imperial Amethyst -- 107702
	recipe = AddRecipe(107702, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Timeless Imperial Amethyst -- 107703
	recipe = AddRecipe(107703, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Veiled Imperial Amethyst -- 107704
	recipe = AddRecipe(107704, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Bold Primordial Ruby -- 107705
	recipe = AddRecipe(107705, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Brilliant Primordial Ruby -- 107706
	recipe = AddRecipe(107706, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Delicate Primordial Ruby -- 107707
	recipe = AddRecipe(107707, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Flashing Primordial Ruby -- 107708
	recipe = AddRecipe(107708, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Precise Primordial Ruby -- 107709
	recipe = AddRecipe(107709, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Fractured Sun's Radiance -- 107710
	recipe = AddRecipe(107710, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Mystic Sun's Radiance -- 107711
	recipe = AddRecipe(107711, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Quick Sun's Radiance -- 107712
	recipe = AddRecipe(107712, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Smooth Sun's Radiance -- 107713
	recipe = AddRecipe(107713, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Subtle Sun's Radiance -- 107714
	recipe = AddRecipe(107714, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Adept Vermilion Onyx -- 107715
	recipe = AddRecipe(107715, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Artful Vermilion Onyx -- 107716
	recipe = AddRecipe(107716, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Champion's Vermilion Onyx -- 107717
	recipe = AddRecipe(107717, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Crafty Vermilion Onyx -- 107718
	recipe = AddRecipe(107718, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Deadly Vermilion Onyx -- 107719
	recipe = AddRecipe(107719, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Deft Vermilion Onyx -- 107720
	recipe = AddRecipe(107720, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Fierce Vermilion Onyx -- 107721
	recipe = AddRecipe(107721, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Fine Vermilion Onyx -- 107722
	recipe = AddRecipe(107722, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Inscribed Vermilion Onyx -- 107723
	recipe = AddRecipe(107723, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Keen Vermilion Onyx -- 107724
	recipe = AddRecipe(107724, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Lucent Vermilion Onyx -- 107725
	recipe = AddRecipe(107725, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Polished Vermilion Onyx -- 107726
	recipe = AddRecipe(107726, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Potent Vermilion Onyx -- 107727
	recipe = AddRecipe(107727, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Reckless Vermilion Onyx -- 107728
	recipe = AddRecipe(107728, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Resolute Vermilion Onyx -- 107729
	recipe = AddRecipe(107729, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Resplendent Vermilion Onyx -- 107730
	recipe = AddRecipe(107730, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Skillful Vermilion Onyx -- 107731
	recipe = AddRecipe(107731, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Splendid Vermilion Onyx -- 107732
	recipe = AddRecipe(107732, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Stalwart Vermilion Onyx -- 107733
	recipe = AddRecipe(107733, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Tenuous Vermilion Onyx -- 107734
	recipe = AddRecipe(107734, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Wicked Vermilion Onyx -- 107735
	recipe = AddRecipe(107735, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Willful Vermilion Onyx -- 107736
	recipe = AddRecipe(107736, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Energized Wild Jade -- 107737
	recipe = AddRecipe(107737, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Forceful Wild Jade -- 107738
	recipe = AddRecipe(107738, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Jagged Wild Jade -- 107739
	recipe = AddRecipe(107739, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Nimble Wild Jade -- 107740
	recipe = AddRecipe(107740, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Puissant Wild Jade -- 107742
	recipe = AddRecipe(107742, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Radiant Wild Jade -- 107743
	recipe = AddRecipe(107743, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Regal Wild Jade -- 107744
	recipe = AddRecipe(107744, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Shattered Wild Jade -- 107745
	recipe = AddRecipe(107745, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Steady Wild Jade -- 107746
	recipe = AddRecipe(107746, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Agile Primal Diamond -- 107753
	recipe = AddRecipe(107753, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83811, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Austere Primal Diamond -- 107754
	recipe = AddRecipe(107754, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83815, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Burning Primal Diamond -- 107756
	recipe = AddRecipe(107756, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83825, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Destructive Primal Diamond -- 107757
	recipe = AddRecipe(107757, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83840, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Effulgent Primal Diamond -- 107758
	recipe = AddRecipe(107758, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83842, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Ember Primal Diamond -- 107759
	recipe = AddRecipe(107759, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83844, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Enigmatic Primal Diamond -- 107760
	recipe = AddRecipe(107760, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83848, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Eternal Primal Diamond -- 107762
	recipe = AddRecipe(107762, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83851, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Fleet Primal Diamond -- 107763
	recipe = AddRecipe(107763, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83859, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Forlorn Primal Diamond -- 107764
	recipe = AddRecipe(107764, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83862, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Impassive Primal Diamond -- 107765
	recipe = AddRecipe(107765, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83872, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Powerful Primal Diamond -- 107766
	recipe = AddRecipe(107766, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83842, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Reverberating Primal Diamond -- 107767
	recipe = AddRecipe(107767, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83925, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Revitalizing Primal Diamond -- 107768
	recipe = AddRecipe(107768, V.MOP, Q.RARE)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetRecipeItem(83926, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Jeweled Onyx Panther -- 120045
	recipe = AddRecipe(120045, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 600, 615)
	recipe:SetRecipeItem(83877, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(82453, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MOUNT")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CLOUDSERPENT)
	recipe:AddRepVendor(FAC.CLOUDSERPENT, REP.EXALTED, 58414)

	-- Ruby Panther -- 121841
	recipe = AddRecipe(121841, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 600, 615)
	recipe:SetRecipeItem(83931, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(83087, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MOUNT")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CLOUDSERPENT)
	recipe:AddRepVendor(FAC.CLOUDSERPENT, REP.REVERED, 58414)

	-- Sapphire Panther -- 121842
	recipe = AddRecipe(121842, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 600, 615)
	recipe:SetRecipeItem(83932, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(83090, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MOUNT")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CLOUDSERPENT)
	recipe:AddRepVendor(FAC.CLOUDSERPENT, REP.REVERED, 58414)

	-- Sunstone Panther -- 121843
	recipe = AddRecipe(121843, V.MOP, Q.RARE)
	recipe:SetSkillLevels(600, 600, 600, 600, 615)
	recipe:SetRecipeItem(83930, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(83089, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MOUNT")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.CLOUDSERPENT)
	recipe:AddRepVendor(FAC.CLOUDSERPENT, REP.HONORED, 58414)

	-- Jade Panther -- 121844
	recipe = AddRecipe(121844, V.MOP, Q.RARE)
	recipe:SetSkillLevels(600, 600, 600, 600, 615)
	recipe:SetRecipeItem(83945, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(83088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_MOUNT")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.CLOUDSERPENT)
	recipe:AddRepVendor(FAC.CLOUDSERPENT, REP.HONORED, 58414)

	-- Ornate Band -- 122661
	recipe = AddRecipe(122661, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Shadowfire Necklace -- 122662
	recipe = AddRecipe(122662, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Scrying Roguestone -- 122663
	recipe = AddRecipe(122663, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Heart of the Earth -- 122664
	recipe = AddRecipe(122664, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Roguestone Shadowband -- 122665
	recipe = AddRecipe(122665, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Lord's Signet -- 122666
	recipe = AddRecipe(122666, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Lionsfall Ring -- 122667
	recipe = AddRecipe(122667, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Band of Blood -- 122668
	recipe = AddRecipe(122668, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_RING")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Reflection of the Sea -- 122669
	recipe = AddRecipe(122669, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Golembreaker Amulet -- 122670
	recipe = AddRecipe(122670, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Widow Chain -- 122671
	recipe = AddRecipe(122671, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Skymage Circle -- 122672
	recipe = AddRecipe(122672, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Tiger Opal Pendant -- 122673
	recipe = AddRecipe(122673, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 585, 590, 595)
	recipe:SetItemFilterType("JEWELCRAFTING_NECK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Delicate Serpent's Eye -- 122674
	recipe = AddRecipe(122674, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Bold Serpent's Eye -- 122675
	recipe = AddRecipe(122675, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Brilliant Serpent's Eye -- 122676
	recipe = AddRecipe(122676, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Sparkling Serpent's Eye -- 122677
	recipe = AddRecipe(122677, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Solid Serpent's Eye -- 122678
	recipe = AddRecipe(122678, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Subtle Serpent's Eye -- 122679
	recipe = AddRecipe(122679, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Smooth Serpent's Eye -- 122680
	recipe = AddRecipe(122680, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Rigid Serpent's Eye -- 122681
	recipe = AddRecipe(122681, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Quick Serpent's Eye -- 122682
	recipe = AddRecipe(122682, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Precise Serpent's Eye -- 122683
	recipe = AddRecipe(122683, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Fractured Serpent's Eye -- 122684
	recipe = AddRecipe(122684, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Flashing Serpent's Eye -- 122685
	recipe = AddRecipe(122685, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Tense Roguestone -- 130655
	recipe = AddRecipe(130655, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(570, 570, 580, 585, 590)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Assassin's Roguestone -- 130656
	recipe = AddRecipe(130656, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(530, 530, 540, 545, 550)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Assassin's Imperial Amethyst -- 130657
	recipe = AddRecipe(130657, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- Tense Imperial Amethyst -- 130658
	recipe = AddRecipe(130658, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_JC_PANDARIA")

	-- River's Heart -- 131593
	recipe = AddRecipe(131593, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_BLUE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Primordial Ruby -- 131686
	recipe = AddRecipe(131686, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_RED")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Wild Jade -- 131688
	recipe = AddRecipe(131688, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_GREEN")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Vermilion Onyx -- 131690
	recipe = AddRecipe(131690, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(535, 535, 545, 550, 555)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Imperial Amethyst -- 131691
	recipe = AddRecipe(131691, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(545, 545, 555, 560, 565)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Sun's Radiance -- 131695
	recipe = AddRecipe(131695, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 535, 540, 545)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_YELLOW")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Secrets of the Stone -- 131759
	recipe = AddRecipe(131759, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 560, 565, 570)
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(18751, 18774, 19539, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33637, 44582, 46675, 52586, 52645, 52657, 65098)

	-- Jade Owl -- 131897
	recipe = AddRecipe(131897, V.MOP, Q.RARE)
	recipe:SetSkillLevels(600, 600, 600, 602, 605)
	recipe:SetRecipeItem(90470, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(82774, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("JEWELCRAFTING_PET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Sapphire Cub -- 131898
	recipe = AddRecipe(131898, V.MOP, Q.RARE)
	recipe:SetSkillLevels(600, 600, 600, 602, 605)
	recipe:SetRecipeItem(90471, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_PET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Resplendent Serpent's Eye -- 136269
	recipe = AddRecipe(136269, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Lucent Serpent's Eye -- 136270
	recipe = AddRecipe(136270, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Willful Serpent's Eye -- 136272
	recipe = AddRecipe(136272, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_ORANGE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Tense Serpent's Eye -- 136273
	recipe = AddRecipe(136273, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Assassin's Serpent's Eye -- 136274
	recipe = AddRecipe(136274, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Mysterious Serpent's Eye -- 136275
	recipe = AddRecipe(136275, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 575, 580, 585)
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PURPLE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(65098)

	-- Serpent's Heart -- 140050
	recipe = AddRecipe(140050, V.MOP, Q.RARE)
	recipe:SetSkillLevels(600, 600, 600, 602, 605)
	recipe:SetRecipeItem(95469, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_PRISMATIC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	-- Primal Diamond -- 140060
	recipe = AddRecipe(140060, V.MOP, Q.RARE)
	recipe:SetSkillLevels(600, 600, 600, 602, 605)
	recipe:SetRecipeItem(95471, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("JEWELCRAFTING_GEM_META")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.PANDARIA)

	self.InitJewelcrafting = nil
end
