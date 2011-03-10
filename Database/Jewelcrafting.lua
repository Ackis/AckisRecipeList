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
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, UNUSED, required_faction)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 25229, nil, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
end

function addon:InitJewelcrafting()
	local recipe

	-- Delicate Copper Wire -- 25255
	recipe = AddRecipe(25255, 1, 20816, Q.COMMON, V.TBC, 1, 20, 35, 50)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Bronze Setting -- 25278
	recipe = AddRecipe(25278, 50, 20817, Q.COMMON, V.TBC, 50, 70, 80, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Elegant Silver Ring -- 25280
	recipe = AddRecipe(25280, 50, 20818, Q.COMMON, V.TBC, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Inlaid Malachite Ring -- 25283
	recipe = AddRecipe(25283, 30, 20821, Q.COMMON, V.TBC, 30, 60, 75, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Simple Pearl Ring -- 25284
	recipe = AddRecipe(25284, 60, 20820, Q.COMMON, V.TBC, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Gloom Band -- 25287
	recipe = AddRecipe(25287, 70, 20823, Q.COMMON, V.TBC, 70, 100, 115, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Heavy Silver Ring -- 25305
	recipe = AddRecipe(25305, 90, 20826, Q.COMMON, V.TBC, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Ring of Silver Might -- 25317
	recipe = AddRecipe(25317, 80, 20827, Q.COMMON, V.TBC, 80, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Ring of Twilight Shadows -- 25318
	recipe = AddRecipe(25318, 100, 20828, Q.COMMON, V.TBC, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Heavy Golden Necklace of Battle -- 25320
	recipe = AddRecipe(25320, 150, 20856, Q.COMMON, V.TBC, 150, 180, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.NECK)
	recipe:AddLimitedVendor(1286, 1, 3367, 1, 16624, 1, 17512, 1)

	-- Moonsoul Crown -- 25321
	recipe = AddRecipe(25321, 120, 20832, Q.COMMON, V.TBC, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Wicked Moonstone Ring -- 25323
	recipe = AddRecipe(25323, 125, 20833, Q.COMMON, V.TBC, 125, 155, 170, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddLimitedVendor(3499, 1, 3954, 1)

	-- Amulet of the Moon -- 25339
	recipe = AddRecipe(25339, 110, 20830, Q.COMMON, V.TBC, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddLimitedVendor(4229, 1, 4561, 1, 16624, 1, 17512, 1)

	-- Solid Bronze Ring -- 25490
	recipe = AddRecipe(25490, 50, 20907, Q.COMMON, V.TBC, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Braided Copper Ring -- 25493
	recipe = AddRecipe(25493, 1, 20906, Q.COMMON, V.TBC, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddCustom(8)

	-- Barbaric Iron Collar -- 25498
	recipe = AddRecipe(25498, 110, 20909, Q.COMMON, V.TBC, 110, 140, 155, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Pendant of the Agate Shield -- 25610
	recipe = AddRecipe(25610, 120, 20950, Q.COMMON, V.TBC, 120, 150, 165, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.NECK)
	recipe:AddVendor(1448, 4877)

	-- Heavy Iron Knuckles -- 25612
	recipe = AddRecipe(25612, 125, 20954, Q.COMMON, V.TBC, 125, 155, 170, 185)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.ONE_HAND, F.FIST)
	recipe:AddLimitedVendor(2393, 1)

	-- Golden Dragon Ring -- 25613
	recipe = AddRecipe(25613, 135, 20955, Q.COMMON, V.TBC, 135, 165, 180, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Mithril Filigree -- 25615
	recipe = AddRecipe(25615, 150, 20963, Q.COMMON, V.TBC, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Blazing Citrine Ring -- 25617
	recipe = AddRecipe(25617, 150, 20958, Q.COMMON, V.TBC, 150, 180, 195, 210)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddLimitedVendor(9636, 1)

	-- Jade Pendant of Blasting -- 25618
	recipe = AddRecipe(25618, 160, 20966, Q.UNCOMMON, V.TBC, 160, 190, 205, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- The Jade Eye -- 25619
	recipe = AddRecipe(25619, 170, 20959, Q.COMMON, V.TBC, 170, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.RING)
	recipe:AddLimitedVendor(4775, 1, 5163, 1, 16624, 1, 17512, 1)

	-- Engraved Truesilver Ring -- 25620
	recipe = AddRecipe(25620, 170, 20960, Q.COMMON, V.TBC, 170, 200, 215, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Citrine Ring of Rapid Healing -- 25621
	recipe = AddRecipe(25621, 180, 20961, Q.COMMON, V.TBC, 180, 210, 225, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Citrine Pendant of Golden Healing -- 25622
	recipe = AddRecipe(25622, 190, 20967, Q.UNCOMMON, V.TBC, 190, 220, 235, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Figurine - Jade Owl -- 26872
	recipe = AddRecipe(26872, 200, 21748, Q.COMMON, V.TBC, 200, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Figurine - Golden Hare -- 26873
	recipe = AddRecipe(26873, 200, 21756, Q.UNCOMMON, V.TBC, 200, 225, 240, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Aquamarine Signet -- 26874
	recipe = AddRecipe(26874, 210, 20964, Q.COMMON, V.TBC, 210, 235, 250, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Figurine - Black Pearl Panther -- 26875
	recipe = AddRecipe(26875, 215, 21758, Q.COMMON, V.TBC, 215, 240, 255, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE, F.DPS, F.TRINKET)
	recipe:AddVendor(989, 4897)

	-- Aquamarine Pendant of the Warrior -- 26876
	recipe = AddRecipe(26876, 220, 21755, Q.COMMON, V.TBC, 220, 245, 260, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Ruby Crown of Restoration -- 26878
	recipe = AddRecipe(26878, 225, 20969, Q.COMMON, V.TBC, 225, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(2810, 1, 2821, 1)

	-- Thorium Setting -- 26880
	recipe = AddRecipe(26880, 225, 21752, Q.COMMON, V.TBC, 225, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Figurine - Truesilver Crab -- 26881
	recipe = AddRecipe(26881, 225, 21760, Q.COMMON, V.TBC, 225, 250, 265, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE, F.TANK, F.TRINKET)
	recipe:AddLimitedVendor(1148, 1, 4897, 1)

	-- Figurine - Truesilver Boar -- 26882
	recipe = AddRecipe(26882, 235, 21763, Q.UNCOMMON, V.TBC, 235, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.DPS, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ruby Pendant of Fire -- 26883
	recipe = AddRecipe(26883, 235, 21764, Q.COMMON, V.TBC, 235, 260, 275, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Truesilver Healing Ring -- 26885
	recipe = AddRecipe(26885, 240, 21765, Q.COMMON, V.TBC, 240, 265, 280, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- The Aquamarine Ward -- 26887
	recipe = AddRecipe(26887, 245, 21754, Q.UNCOMMON, V.TBC, 245, 270, 285, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.RING)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gem Studded Band -- 26896
	recipe = AddRecipe(26896, 250, 21753, Q.UNCOMMON, V.TBC, 250, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Opal Necklace of Impact -- 26897
	recipe = AddRecipe(26897, 250, 21766, Q.COMMON, V.TBC, 250, 275, 290, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.NECK)
	recipe:AddLimitedVendor(5163, 1, 8363, 1, 16624, 1, 17512, 1)

	-- Figurine - Ruby Serpent -- 26900
	recipe = AddRecipe(26900, 260, 21769, Q.UNCOMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Simple Opal Ring -- 26902
	recipe = AddRecipe(26902, 260, 21767, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Sapphire Signet -- 26903
	recipe = AddRecipe(26903, 275, 21768, Q.COMMON, V.TBC, 275, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Emerald Crown of Destruction -- 26906
	recipe = AddRecipe(26906, 275, 21774, Q.COMMON, V.TBC, 275, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddLimitedVendor(15179, 1)

	-- Onslaught Ring -- 26907
	recipe = AddRecipe(26907, 280, 21775, Q.COMMON, V.TBC, 280, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Sapphire Pendant of Winter Night -- 26908
	recipe = AddRecipe(26908, 280, 21790, Q.COMMON, V.TBC, 280, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Figurine - Emerald Owl -- 26909
	recipe = AddRecipe(26909, 285, 21777, Q.UNCOMMON, V.TBC, 285, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ring of Bitter Shadows -- 26910
	recipe = AddRecipe(26910, 285, 21778, Q.COMMON, V.TBC, 285, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(12941)

	-- Living Emerald Pendant -- 26911
	recipe = AddRecipe(26911, 290, 21791, Q.COMMON, V.TBC, 290, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Figurine - Black Diamond Crab -- 26912
	recipe = AddRecipe(26912, 300, 21784, Q.UNCOMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOP, F.TANK, F.TRINKET)
	recipe:AddMobDrop(9736)

	-- Figurine - Dark Iron Scorpid -- 26914
	recipe = AddRecipe(26914, 300, 21789, Q.UNCOMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOP, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddMobDrop(8983)

	-- Necklace of the Diamond Tower -- 26915
	recipe = AddRecipe(26915, 305, 21792, Q.COMMON, V.TBC, 305, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK, F.NECK)
	recipe:AddVendor(11189)

	-- Band of Natural Fire -- 26916
	recipe = AddRecipe(26916, 310, 21779, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Woven Copper Ring -- 26925
	recipe = AddRecipe(26925, 1, 21931, Q.COMMON, V.TBC, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddCustom(8)

	-- Heavy Copper Ring -- 26926
	recipe = AddRecipe(26926, 5, 21932, Q.COMMON, V.TBC, 5, 35, 50, 65)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Thick Bronze Necklace -- 26927
	recipe = AddRecipe(26927, 50, 21933, Q.COMMON, V.TBC, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Ornate Tigerseye Necklace -- 26928
	recipe = AddRecipe(26928, 30, 21934, Q.COMMON, V.TBC, 30, 60, 75, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Brilliant Blood Garnet -- 28903
	recipe = AddRecipe(28903, 300, 23094, Q.COMMON, V.TBC, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Bold Blood Garnet -- 28905
	recipe = AddRecipe(28905, 305, 23095, Q.COMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Inscribed Flame Spessarite -- 28910
	recipe = AddRecipe(28910, 300, 23098, Q.COMMON, V.TBC, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Reckless Flame Spessarite -- 28912
	recipe = AddRecipe(28912, 305, 23099, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Glinting Shadow Draenite -- 28914
	recipe = AddRecipe(28914, 315, 23100, Q.COMMON, V.TBC, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Potent Flame Spessarite -- 28915
	recipe = AddRecipe(28915, 325, 23101, Q.UNCOMMON, V.TBC, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.FRIENDLY, 21655)

	-- Radiant Deep Peridot -- 28916
	recipe = AddRecipe(28916, 300, 23103, Q.COMMON, V.TBC, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Jagged Deep Peridot -- 28917
	recipe = AddRecipe(28917, 305, 23104, Q.COMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Regal Deep Peridot -- 28918
	recipe = AddRecipe(28918, 315, 23105, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Timeless Shadow Draenite -- 28925
	recipe = AddRecipe(28925, 300, 23108, Q.COMMON, V.TBC, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Purified Shadow Draenite -- 28927
	recipe = AddRecipe(28927, 305, 23109, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Shifting Shadow Draenite -- 28933
	recipe = AddRecipe(28933, 315, 23110, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Sovereign Shadow Draenite -- 28936
	recipe = AddRecipe(28936, 325, 23111, Q.COMMON, V.TBC, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Smooth Golden Draenite -- 28944
	recipe = AddRecipe(28944, 305, 23114, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Subtle Golden Draenite -- 28947
	recipe = AddRecipe(28947, 315, 23115, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Rigid Azure Moonstone -- 28948
	recipe = AddRecipe(28948, 325, 23116, Q.COMMON, V.TBC, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Solid Azure Moonstone -- 28950
	recipe = AddRecipe(28950, 300, 23118, Q.COMMON, V.TBC, 300, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Sparkling Azure Moonstone -- 28953
	recipe = AddRecipe(28953, 305, 23119, Q.COMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Stormy Azure Moonstone -- 28955
	recipe = AddRecipe(28955, 315, 23120, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Fel Iron Blood Ring -- 31048
	recipe = AddRecipe(31048, 310, 24074, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Golden Draenite Ring -- 31049
	recipe = AddRecipe(31049, 310, 24075, Q.COMMON, V.TBC, 310, 320, 335, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Azure Moonstone Ring -- 31050
	recipe = AddRecipe(31050, 320, 24076, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Thick Adamantite Necklace -- 31051
	recipe = AddRecipe(31051, 335, 24077, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.NECK)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Heavy Adamantite Ring -- 31052
	recipe = AddRecipe(31052, 335, 24078, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Khorium Band of Shadows -- 31053
	recipe = AddRecipe(31053, 350, 24079, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(19826)

	-- Khorium Band of Frost -- 31054
	recipe = AddRecipe(31054, 355, 24080, Q.RARE, V.TBC, 355, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(17722)

	-- Khorium Inferno Band -- 31055
	recipe = AddRecipe(31055, 355, 24082, Q.RARE, V.TBC, 355, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(18472)

	-- Khorium Band of Leaves -- 31056
	recipe = AddRecipe(31056, 360, 24085, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(19984)

	-- Arcane Khorium Band -- 31057
	recipe = AddRecipe(31057, 365, 24086, Q.RARE, V.TBC, 365, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddMobDrop(18866)

	-- Heavy Felsteel Ring -- 31058
	recipe = AddRecipe(31058, 345, 24087, Q.RARE, V.TBC, 345, 355, 365, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.RING)
	recipe:AddWorldDrop("Outland")

	-- Delicate Eternium Ring -- 31060
	recipe = AddRecipe(31060, 355, 24088, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK, F.RING)
	recipe:AddWorldDrop("Outland")

	-- Blazing Eternium Band -- 31061
	recipe = AddRecipe(31061, 365, 24089, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.RING)
	recipe:AddWorldDrop("Outland")

	-- Pendant of Frozen Flame -- 31062
	recipe = AddRecipe(31062, 360, 24092, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KOT, F.NECK)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Pendant of Thawing -- 31063
	recipe = AddRecipe(31063, 360, 24093, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LOWERCITY, F.NECK)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Pendant of Withering -- 31064
	recipe = AddRecipe(31064, 360, 24095, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCRYER, F.NECK)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Pendant of Shadow's End -- 31065
	recipe = AddRecipe(31065, 360, 24097, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.ALDOR, F.NECK)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Pendant of the Null Rune -- 31066
	recipe = AddRecipe(31066, 360, 24098, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM, F.NECK)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Thick Felsteel Necklace -- 31067
	recipe = AddRecipe(31067, 355, 24106, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Living Ruby Pendant -- 31068
	recipe = AddRecipe(31068, 355, 24110, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Braided Eternium Chain -- 31070
	recipe = AddRecipe(31070, 360, 24114, Q.RARE, V.TBC, 360, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Eye of the Night -- 31071
	recipe = AddRecipe(31071, 360, 24116, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Embrace of the Dawn -- 31072
	recipe = AddRecipe(31072, 365, 24117, Q.RARE, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Chain of the Twilight Owl -- 31076
	recipe = AddRecipe(31076, 365, 24121, Q.RARE, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK, F.HEALER, F.CASTER, F.NECK)
	recipe:AddWorldDrop("Outland")

	-- Coronet of Verdant Flame -- 31077
	recipe = AddRecipe(31077, 370, 24122, Q.EPIC, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(18422)

	-- Circlet of Arcane Might -- 31078
	recipe = AddRecipe(31078, 370, 24123, Q.EPIC, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(18096)

	-- Figurine - Felsteel Boar -- 31079
	recipe = AddRecipe(31079, 370, 24124, Q.RARE, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.LOWERCITY, F.TRINKET)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Figurine - Dawnstone Crab -- 31080
	recipe = AddRecipe(31080, 370, 24125, Q.RARE, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.HELLFIRE, F.TRINKET)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.REVERED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.REVERED, 17585)

	-- Figurine - Living Ruby Serpent -- 31081
	recipe = AddRecipe(31081, 370, 24126, Q.RARE, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.KOT, F.TRINKET)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Figurine - Talasite Owl -- 31082
	recipe = AddRecipe(31082, 370, 24127, Q.RARE, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Figurine - Nightseye Panther -- 31083
	recipe = AddRecipe(31083, 370, 24128, Q.RARE, V.TBC, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.CENARION_EXPEDITION, F.TRINKET)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Bold Living Ruby -- 31084
	recipe = AddRecipe(31084, 350, 24027, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Delicate Living Ruby -- 31085
	recipe = AddRecipe(31085, 350, 24028, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Brilliant Living Ruby -- 31088
	recipe = AddRecipe(31088, 350, 24030, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Subtle Dawnstone -- 31090
	recipe = AddRecipe(31090, 350, 24032, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Flashing Living Ruby -- 31091
	recipe = AddRecipe(31091, 350, 24036, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Solid Star of Elune -- 31092
	recipe = AddRecipe(31092, 350, 24033, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOE, F.RBOP)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Stormy Star of Elune -- 31095
	recipe = AddRecipe(31095, 350, 24039, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Smooth Dawnstone -- 31097
	recipe = AddRecipe(31097, 350, 24048, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Rigid Star of Elune -- 31098
	recipe = AddRecipe(31098, 350, 24051, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOE, F.RBOP)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Mystic Dawnstone -- 31101
	recipe = AddRecipe(31101, 350, 24053, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(21474, 21485)

	-- Sovereign Nightseye -- 31102
	recipe = AddRecipe(31102, 350, 24054, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Shifting Nightseye -- 31103
	recipe = AddRecipe(31103, 350, 24055, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Timeless Nightseye -- 31104
	recipe = AddRecipe(31104, 350, 24056, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Inscribed Noble Topaz -- 31106
	recipe = AddRecipe(31106, 350, 24058, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Potent Noble Topaz -- 31107
	recipe = AddRecipe(31107, 350, 24059, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Reckless Noble Topaz -- 31108
	recipe = AddRecipe(31108, 350, 24060, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Glinting Nightseye -- 31109
	recipe = AddRecipe(31109, 350, 24061, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Radiant Talasite -- 31111
	recipe = AddRecipe(31111, 350, 24066, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Purified Nightseye -- 31112
	recipe = AddRecipe(31112, 350, 24065, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Jagged Talasite -- 31113
	recipe = AddRecipe(31113, 350, 24067, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Sparkling Star of Elune -- 31149
	recipe = AddRecipe(31149, 350, 24035, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Malachite Pendant -- 32178
	recipe = AddRecipe(32178, 20, 25438, Q.COMMON, V.TBC, 20, 50, 65, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Tigerseye Band -- 32179
	recipe = AddRecipe(32179, 20, 25439, Q.COMMON, V.TBC, 20, 50, 65, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Rough Stone Statue -- 32259
	recipe = AddRecipe(32259, 1, 25498, Q.COMMON, V.TBC, 1, 30, 40, 50)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddCustom(8)

	-- Coarse Stone Statue -- 32801
	recipe = AddRecipe(32801, 50, 25880, Q.COMMON, V.TBC, 50, 70, 80, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Heavy Stone Statue -- 32807
	recipe = AddRecipe(32807, 110, 25881, Q.COMMON, V.TBC, 110, 120, 130, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Solid Stone Statue -- 32808
	recipe = AddRecipe(32808, 175, 25882, Q.COMMON, V.TBC, 175, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Dense Stone Statue -- 32809
	recipe = AddRecipe(32809, 225, 25883, Q.COMMON, V.TBC, 225, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Powerful Earthstorm Diamond -- 32866
	recipe = AddRecipe(32866, 365, 25896, Q.COMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 17518)

	-- Bracing Earthstorm Diamond -- 32867
	recipe = AddRecipe(32867, 365, 25897, Q.COMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 17518)

	-- Tenacious Earthstorm Diamond -- 32868
	recipe = AddRecipe(32868, 365, 25898, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Brutal Earthstorm Diamond -- 32869
	recipe = AddRecipe(32869, 365, 25899, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Insightful Earthstorm Diamond -- 32870
	recipe = AddRecipe(32870, 365, 25901, Q.COMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.FRIENDLY, 21432)

	-- Destructive Skyfire Diamond -- 32871
	recipe = AddRecipe(32871, 365, 25890, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Mystical Skyfire Diamond -- 32872
	recipe = AddRecipe(32872, 365, 25893, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Swift Skyfire Diamond -- 32873
	recipe = AddRecipe(32873, 365, 25894, Q.COMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Enigmatic Skyfire Diamond -- 32874
	recipe = AddRecipe(32874, 365, 25895, Q.COMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Delicate Blood Garnet -- 34590
	recipe = AddRecipe(34590, 305, 28595, Q.COMMON, V.TBC, 305, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Golden Ring of Power -- 34955
	recipe = AddRecipe(34955, 180, 29157, Q.COMMON, V.TBC, 180, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Truesilver Commander's Ring -- 34959
	recipe = AddRecipe(34959, 200, 29158, Q.COMMON, V.TBC, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Glowing Thorium Band -- 34960
	recipe = AddRecipe(34960, 280, 29159, Q.COMMON, V.TBC, 280, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Emerald Lion Ring -- 34961
	recipe = AddRecipe(34961, 290, 29160, Q.COMMON, V.TBC, 290, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Brilliant Necklace -- 36523
	recipe = AddRecipe(36523, 75, 30419, Q.COMMON, V.TBC, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Heavy Jade Ring -- 36524
	recipe = AddRecipe(36524, 105, 30420, Q.COMMON, V.TBC, 105, 135, 150, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Red Ring of Destruction -- 36525
	recipe = AddRecipe(36525, 230, 30421, Q.COMMON, V.TBC, 230, 255, 270, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Diamond Focus Ring -- 36526
	recipe = AddRecipe(36526, 265, 30422, Q.COMMON, V.TBC, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Bronze Band of Force -- 37818
	recipe = AddRecipe(37818, 65, 30804, Q.COMMON, V.TBC, 65, 95, 110, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Ring of Arcane Shielding -- 37855
	recipe = AddRecipe(37855, 360, 30825, Q.RARE, V.TBC, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATAR, F.RING)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Mercurial Adamantite -- 38068
	recipe = AddRecipe(38068, 325, 31079, Q.COMMON, V.TBC, 325, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Bronze Torc -- 38175
	recipe = AddRecipe(38175, 80, 31154, Q.COMMON, V.TBC, 80, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- The Frozen Eye -- 38503
	recipe = AddRecipe(38503, 375, 31398, Q.EPIC, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.VIOLETEYE, F.RING)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 18255)

	-- The Natural Ward -- 38504
	recipe = AddRecipe(38504, 375, 31399, Q.EPIC, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION, F.RING)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Veiled Shadow Draenite -- 39466
	recipe = AddRecipe(39466, 325, 31866, Q.UNCOMMON, V.TBC, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom(35)

	-- Deadly Flame Spessarite -- 39467
	recipe = AddRecipe(39467, 325, 31869, Q.UNCOMMON, V.TBC, 325, 325, 340, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddCustom(35)

	-- Veiled Nightseye -- 39470
	recipe = AddRecipe(39470, 350, 31867, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Deadly Noble Topaz -- 39471
	recipe = AddRecipe(39471, 350, 31868, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Bold Crimson Spinel -- 39705
	recipe = AddRecipe(39705, 375, 32193, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Delicate Crimson Spinel -- 39706
	recipe = AddRecipe(39706, 375, 32194, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Brilliant Crimson Spinel -- 39711
	recipe = AddRecipe(39711, 375, 32196, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Subtle Lionseye -- 39713
	recipe = AddRecipe(39713, 375, 32198, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Flashing Crimson Spinel -- 39714
	recipe = AddRecipe(39714, 375, 32199, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Solid Empyrean Sapphire -- 39715
	recipe = AddRecipe(39715, 375, 32200, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Sparkling Empyrean Sapphire -- 39716
	recipe = AddRecipe(39716, 375, 32201, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Stormy Empyrean Sapphire -- 39718
	recipe = AddRecipe(39718, 375, 32203, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Smooth Lionseye -- 39720
	recipe = AddRecipe(39720, 375, 32205, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Rigid Empyrean Sapphire -- 39721
	recipe = AddRecipe(39721, 375, 32206, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Mystic Lionseye -- 39724
	recipe = AddRecipe(39724, 375, 32209, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Sovereign Shadowsong Amethyst -- 39727
	recipe = AddRecipe(39727, 375, 32211, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Shifting Shadowsong Amethyst -- 39728
	recipe = AddRecipe(39728, 375, 32212, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Timeless Shadowsong Amethyst -- 39731
	recipe = AddRecipe(39731, 375, 32215, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Inscribed Pyrestone -- 39733
	recipe = AddRecipe(39733, 375, 32217, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Potent Pyrestone -- 39734
	recipe = AddRecipe(39734, 375, 32218, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Glinting Shadowsong Amethyst -- 39736
	recipe = AddRecipe(39736, 375, 32220, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Veiled Shadowsong Amethyst -- 39737
	recipe = AddRecipe(39737, 375, 32221, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)
	recipe:AddCustom(27)

	-- Deadly Pyrestone -- 39738
	recipe = AddRecipe(39738, 375, 32222, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Regal Seaspray Emerald -- 39739
	recipe = AddRecipe(39739, 375, 32223, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Radiant Seaspray Emerald -- 39740
	recipe = AddRecipe(39740, 375, 32224, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Purified Shadowsong Amethyst -- 39741
	recipe = AddRecipe(39741, 375, 32225, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Jagged Seaspray Emerald -- 39742
	recipe = AddRecipe(39742, 375, 32226, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Relentless Earthstorm Diamond -- 39961
	recipe = AddRecipe(39961, 365, 32409, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.EXALTED, 20242, 23007)

	-- Thundering Skyfire Diamond -- 39963
	recipe = AddRecipe(39963, 365, 32410, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Necklace of the Deep -- 40514
	recipe = AddRecipe(40514, 340, 32508, Q.COMMON, V.TBC, 340, 340, 355, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Brilliant Pearl Band -- 41414
	recipe = AddRecipe(41414, 325, 32772, Q.COMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- The Black Pearl -- 41415
	recipe = AddRecipe(41415, 330, 32774, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Crown of the Sea Witch -- 41418
	recipe = AddRecipe(41418, 365, 32776, Q.COMMON, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Purified Jaggal Pearl -- 41420
	recipe = AddRecipe(41420, 325, 32833, Q.COMMON, V.TBC, 325, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Purified Shadow Pearl -- 41429
	recipe = AddRecipe(41429, 350, 32836, Q.COMMON, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Don Julio's Heart -- 42558
	recipe = AddRecipe(42558, 360, 33133, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Kailee's Rose -- 42588
	recipe = AddRecipe(42588, 360, 33134, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Crimson Sun -- 42589
	recipe = AddRecipe(42589, 360, 33131, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Falling Star -- 42590
	recipe = AddRecipe(42590, 360, 33135, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Stone of Blades -- 42591
	recipe = AddRecipe(42591, 360, 33143, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Blood of Amber -- 42592
	recipe = AddRecipe(42592, 360, 33140, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Facet of Eternity -- 42593
	recipe = AddRecipe(42593, 360, 33144, Q.COMMON, V.TBC, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Steady Talasite -- 43493
	recipe = AddRecipe(43493, 350, 33782, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(18821, 18822)

	-- Chaotic Skyfire Diamond -- 44794
	recipe = AddRecipe(44794, 365, 34220, Q.RARE, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19768)

	-- Loop of Forged Power -- 46122
	recipe = AddRecipe(46122, 365, 34362, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddCustom(24)

	-- Ring of Flowing Life -- 46123
	recipe = AddRecipe(46123, 365, 34363, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddCustom(24)

	-- Hard Khorium Band -- 46124
	recipe = AddRecipe(46124, 365, 34361, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddCustom(24)

	-- Pendant of Sunfire -- 46125
	recipe = AddRecipe(46125, 365, 34359, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddCustom(24)

	-- Amulet of Flowing Life -- 46126
	recipe = AddRecipe(46126, 365, 34360, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.NECK)
	recipe:AddCustom(24)

	-- Hard Khorium Choker -- 46127
	recipe = AddRecipe(46127, 365, 34358, Q.EPIC, V.TBC, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.NECK)
	recipe:AddCustom(24)

	-- Quick Dawnstone -- 46403
	recipe = AddRecipe(46403, 350, 35315, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Forceful Talasite -- 46405
	recipe = AddRecipe(46405, 350, 35318, Q.RARE, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Eternal Earthstorm Diamond -- 46597
	recipe = AddRecipe(46597, 370, 35501, Q.COMMON, V.TBC, 370, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Ember Skyfire Diamond -- 46601
	recipe = AddRecipe(46601, 370, 35503, Q.COMMON, V.TBC, 370, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Empyrean Tortoise -- 46775
	recipe = AddRecipe(46775, 375, 35693, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Khorium Boar -- 46776
	recipe = AddRecipe(46776, 375, 35694, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Crimson Serpent -- 46777
	recipe = AddRecipe(46777, 375, 35700, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Shadowsong Panther -- 46778
	recipe = AddRecipe(46778, 375, 35702, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Seaspray Albatross -- 46779
	recipe = AddRecipe(46779, 375, 35703, Q.COMMON, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Regal Talasite -- 46803
	recipe = AddRecipe(46803, 350, 35707, Q.COMMON, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Forceful Seaspray Emerald -- 47053
	recipe = AddRecipe(47053, 375, 35759, Q.EPIC, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Steady Seaspray Emerald -- 47054
	recipe = AddRecipe(47054, 375, 35758, Q.EPIC, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)

	-- Reckless Pyrestone -- 47055
	recipe = AddRecipe(47055, 375, 35760, Q.EPIC, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Quick Lionseye -- 47056
	recipe = AddRecipe(47056, 375, 35761, Q.EPIC, V.TBC, 375, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SCALE_SANDS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.REVERED, 25032, 25950, 27666)
	recipe:AddRepVendor(FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Brilliant Glass -- 47280
	recipe = AddRecipe(47280, 350, 35945, Q.COMMON, V.TBC, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Bold Scarlet Ruby -- 53830
	recipe = AddRecipe(53830, 390, 39996, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Bold Bloodstone -- 53831
	recipe = AddRecipe(53831, 350, 39900, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Delicate Bloodstone -- 53832
	recipe = AddRecipe(53832, 350, 39905, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Subtle Sun Crystal -- 53843
	recipe = AddRecipe(53843, 360, 39907, Q.COMMON, V.WOTLK, 360, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Flashing Bloodstone -- 53844
	recipe = AddRecipe(53844, 350, 39908, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Smooth Sun Crystal -- 53845
	recipe = AddRecipe(53845, 350, 39909, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Brilliant Bloodstone -- 53852
	recipe = AddRecipe(53852, 350, 39912, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Rigid Chalcedony -- 53854
	recipe = AddRecipe(53854, 350, 39915, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Quick Sun Crystal -- 53856
	recipe = AddRecipe(53856, 350, 39918, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Mystic Sun Crystal -- 53857
	recipe = AddRecipe(53857, 350, 39917, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(34039, 34079)

	-- Sovereign Shadow Crystal -- 53859
	recipe = AddRecipe(53859, 350, 39934, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Shifting Shadow Crystal -- 53860
	recipe = AddRecipe(53860, 350, 39935, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Glinting Shadow Crystal -- 53861
	recipe = AddRecipe(53861, 350, 39942, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Mysterious Shadow Crystal -- 53865
	recipe = AddRecipe(53865, 350, 39945, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(34039, 34079)

	-- Defender's Shadow Crystal -- 53869
	recipe = AddRecipe(53869, 350, 39939, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.HONORED, 31916, 32763)

	-- Jagged Dark Jade -- 53870
	recipe = AddRecipe(53870, 350, 39933, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Guardian's Shadow Crystal -- 53871
	recipe = AddRecipe(53871, 350, 39940, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Inscribed Huge Citrine -- 53872
	recipe = AddRecipe(53872, 350, 39947, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Etched Shadow Crystal -- 53873
	recipe = AddRecipe(53873, 350, 39948, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Champion's Huge Citrine -- 53874
	recipe = AddRecipe(53874, 350, 39949, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Resplendent Huge Citrine -- 53875
	recipe = AddRecipe(53875, 350, 39950, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(34039, 34079)

	-- Fierce Huge Citrine -- 53876
	recipe = AddRecipe(53876, 350, 39951, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Deadly Huge Citrine -- 53877
	recipe = AddRecipe(53877, 350, 39952, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.FRIENDLY, 32538)

	-- Lucent Huge Citrine -- 53879
	recipe = AddRecipe(53879, 350, 39954, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(34039, 34079)

	-- Deft Huge Citrine -- 53880
	recipe = AddRecipe(53880, 350, 39955, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Potent Huge Citrine -- 53882
	recipe = AddRecipe(53882, 350, 39956, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Veiled Shadow Crystal -- 53883
	recipe = AddRecipe(53883, 350, 39957, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Willful Huge Citrine -- 53884
	recipe = AddRecipe(53884, 350, 39958, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(34039, 34079)

	-- Reckless Huge Citrine -- 53885
	recipe = AddRecipe(53885, 350, 39959, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.FRENZYHEART)
	recipe:AddRepVendor(FAC.FRENZYHEART, REP.FRIENDLY, 31911)

	-- Stalwart Huge Citrine -- 53891
	recipe = AddRecipe(53891, 360, 39965, Q.COMMON, V.WOTLK, 360, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Accurate Shadow Crystal -- 53892
	recipe = AddRecipe(53892, 350, 39966, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Resolute Huge Citrine -- 53893
	recipe = AddRecipe(53893, 350, 39967, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Timeless Shadow Crystal -- 53894
	recipe = AddRecipe(53894, 350, 39968, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Nimble Dark Jade -- 53917
	recipe = AddRecipe(53917, 350, 39975, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ORACLES)
	recipe:AddRepVendor(FAC.ORACLES, REP.FRIENDLY, 31910)

	-- Regal Dark Jade -- 53918
	recipe = AddRecipe(53918, 350, 39976, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Steady Dark Jade -- 53919
	recipe = AddRecipe(53919, 350, 39977, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(34039, 34079)

	-- Forceful Dark Jade -- 53920
	recipe = AddRecipe(53920, 350, 39978, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Purified Shadow Crystal -- 53921
	recipe = AddRecipe(53921, 350, 39979, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.FRIENDLY, 31916, 32763)

	-- Misty Dark Jade -- 53922
	recipe = AddRecipe(53922, 350, 39980, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Lightning Dark Jade -- 53923
	recipe = AddRecipe(53923, 350, 39981, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Turbid Dark Jade -- 53924
	recipe = AddRecipe(53924, 350, 39982, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(34039, 34079)

	-- Energized Dark Jade -- 53925
	recipe = AddRecipe(53925, 350, 39983, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Radiant Dark Jade -- 53932
	recipe = AddRecipe(53932, 350, 39991, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(34039, 34079)

	-- Shattered Dark Jade -- 53933
	recipe = AddRecipe(53933, 350, 39992, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(34039, 34079)

	-- Solid Chalcedony -- 53934
	recipe = AddRecipe(53934, 350, 39919, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Sparkling Chalcedony -- 53941
	recipe = AddRecipe(53941, 350, 39927, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Stormy Chalcedony -- 53943
	recipe = AddRecipe(53943, 350, 39927, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(34039, 34079)

	-- Delicate Scarlet Ruby -- 53945
	recipe = AddRecipe(53945, 390, 39997, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Brilliant Scarlet Ruby -- 53946
	recipe = AddRecipe(53946, 390, 39998, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KIRINTOR)
	recipe:AddRepVendor(FAC.KIRINTOR, REP.EXALTED, 32287)

	-- Subtle Autumn's Glow -- 53948
	recipe = AddRecipe(53948, 390, 40000, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Flashing Scarlet Ruby -- 53949
	recipe = AddRecipe(53949, 390, 40001, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Precise Scarlet Ruby -- 53951
	recipe = AddRecipe(53951, 390, 40003, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddMobDrop(29311)

	-- Solid Sky Sapphire -- 53952
	recipe = AddRecipe(53952, 390, 40008, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Sparkling Sky Sapphire -- 53954
	recipe = AddRecipe(53954, 390, 40010, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stormy Sky Sapphire -- 53955
	recipe = AddRecipe(53955, 390, 40011, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Smooth Autumn's Glow -- 53957
	recipe = AddRecipe(53957, 390, 40013, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.EXALTED, 32540)

	-- Rigid Sky Sapphire -- 53958
	recipe = AddRecipe(53958, 390, 40014, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Mystic Autumn's Glow -- 53960
	recipe = AddRecipe(53960, 390, 40016, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Quick Autumn's Glow -- 53961
	recipe = AddRecipe(53961, 390, 40017, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Sovereign Twilight Opal -- 53962
	recipe = AddRecipe(53962, 390, 40022, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northrend")

	-- Shifting Twilight Opal -- 53963
	recipe = AddRecipe(53963, 390, 40023, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Timeless Twilight Opal -- 53965
	recipe = AddRecipe(53965, 390, 40025, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.EXALTED, 32538)

	-- Purified Twilight Opal -- 53966
	recipe = AddRecipe(53966, 390, 40026, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Northrend")

	-- Mysterious Twilight Opal -- 53968
	recipe = AddRecipe(53968, 390, 40028, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Defender's Twilight Opal -- 53972
	recipe = AddRecipe(53972, 390, 40032, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(29370, 29376, 30208, 30222)

	-- Guardian's Twilight Opal -- 53974
	recipe = AddRecipe(53974, 390, 40034, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ARGENTCRUSADE)
	recipe:AddRepVendor(FAC.ARGENTCRUSADE, REP.REVERED, 30431)

	-- Inscribed Monarch Topaz -- 53975
	recipe = AddRecipe(53975, 390, 40037, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northrend")

	-- Etched Twilight Opal -- 53976
	recipe = AddRecipe(53976, 390, 40038, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northrend")

	-- Champion's Monarch Topaz -- 53977
	recipe = AddRecipe(53977, 390, 40039, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK)
	recipe:AddWorldDrop("Northrend")

	-- Resplendent Monarch Topaz -- 53978
	recipe = AddRecipe(53978, 390, 40040, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(30489, 32294, 32296)

	-- Glinting Twilight Opal -- 53980
	recipe = AddRecipe(53980, 390, 40044, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Lucent Monarch Topaz -- 53981
	recipe = AddRecipe(53981, 390, 40045, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(30489, 32294, 32296)

	-- Potent Monarch Topaz -- 53984
	recipe = AddRecipe(53984, 390, 40048, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Veiled Twilight Opal -- 53985
	recipe = AddRecipe(53985, 390, 40049, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Willful Monarch Topaz -- 53986
	recipe = AddRecipe(53986, 390, 40050, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Reckless Monarch Topaz -- 53987
	recipe = AddRecipe(53987, 390, 40051, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Deadly Monarch Topaz -- 53988
	recipe = AddRecipe(53988, 390, 40052, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.EBONBLADE)
	recipe:AddRepVendor(FAC.EBONBLADE, REP.REVERED, 32538)

	-- Deft Monarch Topaz -- 53991
	recipe = AddRecipe(53991, 390, 40055, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Stalwart Monarch Topaz -- 53993
	recipe = AddRecipe(53993, 390, 40057, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.WYRMREST)
	recipe:AddRepVendor(FAC.WYRMREST, REP.EXALTED, 32533)

	-- Accurate Twilight Opal -- 53994
	recipe = AddRecipe(53994, 390, 40058, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddMobDrop(28379, 28851, 29402, 30260, 30448)

	-- Jagged Forest Emerald -- 53996
	recipe = AddRecipe(53996, 390, 40086, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.FRENZYHEART)
	recipe:AddRepVendor(FAC.FRENZYHEART, REP.REVERED, 31911)

	-- Nimble Forest Emerald -- 53997
	recipe = AddRecipe(53997, 390, 40088, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Regal Forest Emerald -- 53998
	recipe = AddRecipe(53998, 390, 40089, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Steady Forest Emerald -- 54000
	recipe = AddRecipe(54000, 390, 40090, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Forceful Forest Emerald -- 54001
	recipe = AddRecipe(54001, 390, 40091, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Misty Forest Emerald -- 54003
	recipe = AddRecipe(54003, 390, 40095, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Northrend")

	-- Turbid Forest Emerald -- 54005
	recipe = AddRecipe(54005, 390, 40102, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Lightning Forest Emerald -- 54009
	recipe = AddRecipe(54009, 390, 40100, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Energized Forest Emerald -- 54011
	recipe = AddRecipe(54011, 390, 40105, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Radiant Forest Emerald -- 54012
	recipe = AddRecipe(54012, 390, 40098, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddMobDrop(29792, 29793)

	-- Shattered Forest Emerald -- 54014
	recipe = AddRecipe(54014, 390, 40106, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Precise Bloodstone -- 54017
	recipe = AddRecipe(54017, 350, 39910, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Fierce Monarch Topaz -- 54019
	recipe = AddRecipe(54019, 390, 40041, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddMobDrop(23954)

	-- Resolute Monarch Topaz -- 54023
	recipe = AddRecipe(54023, 390, 40059, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK)
	recipe:AddWorldDrop("Northrend")

	-- Shielded Skyflare Diamond -- 55384
	recipe = AddRecipe(55384, 420, 41377, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Tireless Skyflare Diamond -- 55386
	recipe = AddRecipe(55386, 420, 41375, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Forlorn Skyflare Diamond -- 55387
	recipe = AddRecipe(55387, 420, 41378, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(30489, 32294, 32296)

	-- Impassive Skyflare Diamond -- 55388
	recipe = AddRecipe(55388, 420, 41379, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Chaotic Skyflare Diamond -- 55389
	recipe = AddRecipe(55389, 420, 41285, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Destructive Skyflare Diamond -- 55390
	recipe = AddRecipe(55390, 420, 41307, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Ember Skyflare Diamond -- 55392
	recipe = AddRecipe(55392, 420, 41333, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Enigmatic Skyflare Diamond -- 55393
	recipe = AddRecipe(55393, 420, 41335, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(30489, 32294, 32296)

	-- Swift Skyflare Diamond -- 55394
	recipe = AddRecipe(55394, 420, 41339, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Thundering Skyflare Diamond -- 55395
	recipe = AddRecipe(55395, 420, 41400, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northrend")

	-- Insightful Earthsiege Diamond -- 55396
	recipe = AddRecipe(55396, 420, 41401, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bracing Earthsiege Diamond -- 55397
	recipe = AddRecipe(55397, 420, 41395, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(27656)

	-- Eternal Earthsiege Diamond -- 55398
	recipe = AddRecipe(55398, 420, 41396, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.TANK)
	recipe:AddMobDrop(28923)

	-- Powerful Earthsiege Diamond -- 55399
	recipe = AddRecipe(55399, 420, 41397, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Relentless Earthsiege Diamond -- 55400
	recipe = AddRecipe(55400, 420, 41398, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Austere Earthsiege Diamond -- 55401
	recipe = AddRecipe(55401, 420, 41380, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(26861)

	-- Persistent Earthsiege Diamond -- 55402
	recipe = AddRecipe(55402, 420, 41381, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Trenchant Earthsiege Diamond -- 55403
	recipe = AddRecipe(55403, 420, 41382, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Invigorating Earthsiege Diamond -- 55404
	recipe = AddRecipe(55404, 420, 41385, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Beaming Earthsiege Diamond -- 55405
	recipe = AddRecipe(55405, 420, 41389, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Northrend")

	-- Revitalizing Skyflare Diamond -- 55407
	recipe = AddRecipe(55407, 420, 41376, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bold Dragon's Eye -- 56049
	recipe = AddRecipe(56049, 370, 42142, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Delicate Dragon's Eye -- 56052
	recipe = AddRecipe(56052, 370, 42143, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS)
	recipe:AddVendor(28721, 33602)

	-- Brilliant Dragon's Eye -- 56053
	recipe = AddRecipe(56053, 370, 42144, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Subtle Dragon's Eye -- 56055
	recipe = AddRecipe(56055, 370, 42151, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Flashing Dragon's Eye -- 56056
	recipe = AddRecipe(56056, 370, 42152, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Mystic Dragon's Eye -- 56079
	recipe = AddRecipe(56079, 370, 42158, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Precise Dragon's Eye -- 56081
	recipe = AddRecipe(56081, 370, 42154, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(28721, 33602)

	-- Quick Dragon's Eye -- 56083
	recipe = AddRecipe(56083, 370, 42150, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Rigid Dragon's Eye -- 56084
	recipe = AddRecipe(56084, 370, 42156, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Smooth Dragon's Eye -- 56085
	recipe = AddRecipe(56085, 370, 42149, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Solid Dragon's Eye -- 56086
	recipe = AddRecipe(56086, 370, 36767, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP)
	recipe:AddVendor(28721, 33602)

	-- Sparkling Dragon's Eye -- 56087
	recipe = AddRecipe(56087, 370, 42145, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Stormy Dragon's Eye -- 56088
	recipe = AddRecipe(56088, 370, 42155, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.CASTER)
	recipe:AddVendor(28721, 33602)

	-- Bloodstone Band -- 56193
	recipe = AddRecipe(56193, 350, 42336, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Sun Rock Ring -- 56194
	recipe = AddRecipe(56194, 350, 42337, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Jade Dagger Pendant -- 56195
	recipe = AddRecipe(56195, 380, 42338, Q.COMMON, V.WOTLK, 380, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Blood Sun Necklace -- 56196
	recipe = AddRecipe(56196, 380, 42339, Q.COMMON, V.WOTLK, 380, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Dream Signet -- 56197
	recipe = AddRecipe(56197, 420, 42340, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Figurine - Ruby Hare -- 56199
	recipe = AddRecipe(56199, 400, 42341, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Figurine - Twilight Serpent -- 56201
	recipe = AddRecipe(56201, 400, 42395, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Figurine - Sapphire Owl -- 56202
	recipe = AddRecipe(56202, 400, 42413, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Figurine - Emerald Boar -- 56203
	recipe = AddRecipe(56203, 400, 42418, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Dark Jade Focusing Lens -- 56205
	recipe = AddRecipe(56205, 350, 41367, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Shadow Crystal Focusing Lens -- 56206
	recipe = AddRecipe(56206, 360, 42420, Q.COMMON, V.WOTLK, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Shadow Jade Focusing Lens -- 56208
	recipe = AddRecipe(56208, 370, 42421, Q.COMMON, V.WOTLK, 370, 380, 390, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Titanium Impact Band -- 56496
	recipe = AddRecipe(56496, 430, 42642, Q.EPIC, V.WOTLK, 430, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Earthguard Ring -- 56497
	recipe = AddRecipe(56497, 430, 42643, Q.EPIC, V.WOTLK, 430, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Spellshock Ring -- 56498
	recipe = AddRecipe(56498, 430, 42644, Q.EPIC, V.WOTLK, 430, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Impact Choker -- 56499
	recipe = AddRecipe(56499, 440, 42645, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddVendor(28721, 33602)

	-- Titanium Earthguard Chain -- 56500
	recipe = AddRecipe(56500, 440, 42646, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.NECK)
	recipe:AddVendor(28721, 33602)

	-- Titanium Spellshock Necklace -- 56501
	recipe = AddRecipe(56501, 440, 42647, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddVendor(28721, 33602)

	-- Enchanted Pearl -- 56530
	recipe = AddRecipe(56530, 360, 42701, Q.COMMON, V.WOTLK, 360, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Enchanted Tear -- 56531
	recipe = AddRecipe(56531, 390, 42702, Q.COMMON, V.WOTLK, 390, 410, 425, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Crystal Citrine Necklace -- 58141
	recipe = AddRecipe(58141, 350, 43244, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Crystal Chalcedony Amulet -- 58142
	recipe = AddRecipe(58142, 350, 43245, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Earthshadow Ring -- 58143
	recipe = AddRecipe(58143, 370, 43246, Q.COMMON, V.WOTLK, 370, 390, 405, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Jade Ring of Slaying -- 58144
	recipe = AddRecipe(58144, 370, 43247, Q.COMMON, V.WOTLK, 370, 390, 405, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TANK, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Stoneguard Band -- 58145
	recipe = AddRecipe(58145, 390, 43248, Q.COMMON, V.WOTLK, 390, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Shadowmight Ring -- 58146
	recipe = AddRecipe(58146, 390, 43249, Q.COMMON, V.WOTLK, 390, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Ring of Earthen Might -- 58147
	recipe = AddRecipe(58147, 420, 43250, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Ring of Scarlet Shadows -- 58148
	recipe = AddRecipe(58148, 420, 43251, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Windfire Band -- 58149
	recipe = AddRecipe(58149, 420, 43252, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Ring of Northern Tears -- 58150
	recipe = AddRecipe(58150, 420, 43253, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Savage Titanium Ring -- 58492
	recipe = AddRecipe(58492, 420, 43482, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Savage Titanium Band -- 58507
	recipe = AddRecipe(58507, 420, 43498, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Titanium Frostguard Ring -- 58954
	recipe = AddRecipe(58954, 420, 43582, Q.EPIC, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.RING)
	recipe:AddVendor(28721, 33602)

	-- Figurine - Monarch Crab -- 59759
	recipe = AddRecipe(59759, 400, 44063, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK, F.TRINKET)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Icy Prism -- 62242
	recipe = AddRecipe(62242, 425, 44943, Q.COMMON, V.WOTLK, 425, 445, 457, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Prismatic Black Diamond -- 62941
	recipe = AddRecipe(62941, 300, 45054, Q.COMMON, V.WOTLK, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19539, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Amulet of Truesight -- 63743
	recipe = AddRecipe(63743, 200, 45627, Q.COMMON, V.WOTLK, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(15501, 18751, 18774, 19063, 19539, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 33680)

	-- Emerald Choker -- 64725
	recipe = AddRecipe(64725, 420, 45812, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.NECK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Sky Sapphire Amulet -- 64726
	recipe = AddRecipe(64726, 420, 45813, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NECK)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Runed Mana Band -- 64727
	recipe = AddRecipe(64727, 420, 45808, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Scarlet Signet -- 64728
	recipe = AddRecipe(64728, 420, 45809, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.RING)
	recipe:AddTrainer(26915, 26960, 26982, 26997, 28701, 33590)

	-- Regal Eye of Zul -- 66338
	recipe = AddRecipe(66338, 450, 40167, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Steady Eye of Zul -- 66428
	recipe = AddRecipe(66428, 450, 40168, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Nimble Eye of Zul -- 66429
	recipe = AddRecipe(66429, 450, 40166, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Jagged Eye of Zul -- 66431
	recipe = AddRecipe(66431, 450, 40165, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Timeless Dreadstone -- 66432
	recipe = AddRecipe(66432, 450, 40164, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Forceful Eye of Zul -- 66434
	recipe = AddRecipe(66434, 450, 40169, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Misty Eye of Zul -- 66435
	recipe = AddRecipe(66435, 450, 40171, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Lightning Eye of Zul -- 66439
	recipe = AddRecipe(66439, 450, 40177, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Radiant Eye of Zul -- 66441
	recipe = AddRecipe(66441, 450, 40180, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Energized Eye of Zul -- 66442
	recipe = AddRecipe(66442, 450, 40179, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Shattered Eye of Zul -- 66443
	recipe = AddRecipe(66443, 450, 40182, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Turbid Eye of Zul -- 66445
	recipe = AddRecipe(66445, 450, 40173, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Brilliant Cardinal Ruby -- 66446
	recipe = AddRecipe(66446, 450, 40113, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Bold Cardinal Ruby -- 66447
	recipe = AddRecipe(66447, 450, 40111, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Delicate Cardinal Ruby -- 66448
	recipe = AddRecipe(66448, 450, 40112, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Precise Cardinal Ruby -- 66450
	recipe = AddRecipe(66450, 450, 40118, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Subtle King's Amber -- 66452
	recipe = AddRecipe(66452, 450, 40115, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Flashing Cardinal Ruby -- 66453
	recipe = AddRecipe(66453, 450, 40116, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Solid Majestic Zircon -- 66497
	recipe = AddRecipe(66497, 450, 40119, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Sparkling Majestic Zircon -- 66498
	recipe = AddRecipe(66498, 450, 40120, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Stormy Majestic Zircon -- 66499
	recipe = AddRecipe(66499, 450, 40122, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Rigid Majestic Zircon -- 66501
	recipe = AddRecipe(66501, 450, 40125, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Smooth King's Amber -- 66502
	recipe = AddRecipe(66502, 450, 40124, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Mystic King's Amber -- 66505
	recipe = AddRecipe(66505, 450, 40127, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Quick King's Amber -- 66506
	recipe = AddRecipe(66506, 450, 40128, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Sovereign Dreadstone -- 66554
	recipe = AddRecipe(66554, 450, 40129, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Purified Dreadstone -- 66556
	recipe = AddRecipe(66556, 450, 40133, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Shifting Dreadstone -- 66557
	recipe = AddRecipe(66557, 450, 40130, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Defender's Dreadstone -- 66560
	recipe = AddRecipe(66560, 450, 40139, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Guardian's Dreadstone -- 66561
	recipe = AddRecipe(66561, 450, 40141, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Mysterious Dreadstone -- 66562
	recipe = AddRecipe(66562, 450, 40135, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Inscribed Ametrine -- 66567
	recipe = AddRecipe(66567, 450, 40142, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Deadly Ametrine -- 66568
	recipe = AddRecipe(66568, 450, 40147, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Potent Ametrine -- 66569
	recipe = AddRecipe(66569, 450, 40152, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Veiled Dreadstone -- 66570
	recipe = AddRecipe(66570, 450, 40153, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Willful Ametrine -- 66571
	recipe = AddRecipe(66571, 450, 40154, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Etched Dreadstone -- 66572
	recipe = AddRecipe(66572, 450, 40143, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Glinting Dreadstone -- 66573
	recipe = AddRecipe(66573, 450, 40157, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Reckless Ametrine -- 66574
	recipe = AddRecipe(66574, 450, 40155, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Accurate Dreadstone -- 66576
	recipe = AddRecipe(66576, 450, 40162, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Champion's Ametrine -- 66579
	recipe = AddRecipe(66579, 450, 40144, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Stalwart Ametrine -- 66581
	recipe = AddRecipe(66581, 450, 40160, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Resplendent Ametrine -- 66582
	recipe = AddRecipe(66582, 450, 40145, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Fierce Ametrine -- 66583
	recipe = AddRecipe(66583, 450, 40146, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Deft Ametrine -- 66584
	recipe = AddRecipe(66584, 450, 40150, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Lucent Ametrine -- 66585
	recipe = AddRecipe(66585, 450, 40149, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Resolute Ametrine -- 66586
	recipe = AddRecipe(66586, 450, 40163, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Nightmare Tear -- 68253
	recipe = AddRecipe(68253, 450, 49110, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(19065, 28701, 33637, 33680)

	-- Bold Carnelian -- 73222
	recipe = AddRecipe(73222, 425, 52081, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Delicate Carnelian -- 73223
	recipe = AddRecipe(73223, 425, 52082, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Flashing Carnelian -- 73224
	recipe = AddRecipe(73224, 425, 52083, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Brilliant Carnelian -- 73225
	recipe = AddRecipe(73225, 425, 52084, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Precise Carnelian -- 73226
	recipe = AddRecipe(73226, 425, 52085, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Solid Zephyrite -- 73227
	recipe = AddRecipe(73227, 425, 52086, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Sparkling Zephyrite -- 73228
	recipe = AddRecipe(73228, 425, 52087, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Stormy Zephyrite -- 73229
	recipe = AddRecipe(73229, 425, 52088, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rigid Zephyrite -- 73230
	recipe = AddRecipe(73230, 425, 52089, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Subtle Alicite -- 73231
	recipe = AddRecipe(73231, 425, 52090, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Smooth Alicite -- 73232
	recipe = AddRecipe(73232, 425, 52091, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Quick Alicite -- 73234
	recipe = AddRecipe(73234, 425, 52093, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Fractured Alicite -- 73239
	recipe = AddRecipe(73239, 425, 52094, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Sovereign Nightstone -- 73240
	recipe = AddRecipe(73240, 425, 52095, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Shifting Nightstone -- 73241
	recipe = AddRecipe(73241, 425, 52096, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Defender's Nightstone -- 73242
	recipe = AddRecipe(73242, 425, 52097, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Timeless Nightstone -- 73243
	recipe = AddRecipe(73243, 425, 52098, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Guardian's Nightstone -- 73244
	recipe = AddRecipe(73244, 425, 52099, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Purified Nightstone -- 73245
	recipe = AddRecipe(73245, 425, 52100, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Etched Nightstone -- 73246
	recipe = AddRecipe(73246, 425, 52101, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Glinting Nightstone -- 73247
	recipe = AddRecipe(73247, 425, 52102, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Retaliating Nightstone -- 73248
	recipe = AddRecipe(73248, 425, 52103, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Veiled Nightstone -- 73249
	recipe = AddRecipe(73249, 425, 52104, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Accurate Nightstone -- 73250
	recipe = AddRecipe(73250, 425, 52105, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Polished Hessonite -- 73258
	recipe = AddRecipe(73258, 425, 52106, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Inscribed Hessonite -- 73260
	recipe = AddRecipe(73260, 425, 52108, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Deadly Hessonite -- 73262
	recipe = AddRecipe(73262, 425, 52109, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Potent Hessonite -- 73263
	recipe = AddRecipe(73263, 425, 52110, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fierce Hessonite -- 73264
	recipe = AddRecipe(73264, 425, 52111, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Deft Hessonite -- 73265
	recipe = AddRecipe(73265, 425, 52112, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Reckless Hessonite -- 73266
	recipe = AddRecipe(73266, 450, 68741, Q.COMMON, V.CATA, 450, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Skillful Hessonite -- 73267
	recipe = AddRecipe(73267, 425, 52114, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Adept Hessonite -- 73268
	recipe = AddRecipe(73268, 425, 52115, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Fine Hessonite -- 73269
	recipe = AddRecipe(73269, 425, 52116, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Artful Hessonite -- 73270
	recipe = AddRecipe(73270, 425, 52117, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Keen Hessonite -- 73271
	recipe = AddRecipe(73271, 425, 52118, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Regal Jasper -- 73272
	recipe = AddRecipe(73272, 425, 52119, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Nimble Jasper -- 73273
	recipe = AddRecipe(73273, 425, 52120, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Jagged Jasper -- 73274
	recipe = AddRecipe(73274, 425, 52121, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Piercing Jasper -- 73275
	recipe = AddRecipe(73275, 425, 52122, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Steady Jasper -- 73276
	recipe = AddRecipe(73276, 425, 52123, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Forceful Jasper -- 73277
	recipe = AddRecipe(73277, 425, 52124, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lightning Jasper -- 73278
	recipe = AddRecipe(73278, 425, 52125, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Puissant Jasper -- 73279
	recipe = AddRecipe(73279, 425, 52126, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Zen Jasper -- 73280
	recipe = AddRecipe(73280, 425, 52127, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Sensei's Jasper -- 73281
	recipe = AddRecipe(73281, 425, 52128, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26915, 26960, 26982, 26997, 28701, 33590, 33614, 44582, 46675)

	-- Bold Inferno Ruby -- 73335
	recipe = AddRecipe(73335, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Delicate Inferno Ruby -- 73336
	recipe = AddRecipe(73336, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Flashing Inferno Ruby -- 73337
	recipe = AddRecipe(73337, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Brilliant Inferno Ruby -- 73338
	recipe = AddRecipe(73338, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Precise Inferno Ruby -- 73339
	recipe = AddRecipe(73339, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Solid Ocean Sapphire -- 73340
	recipe = AddRecipe(73340, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sparkling Ocean Sapphire -- 73341
	recipe = AddRecipe(73341, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Stormy Ocean Sapphire -- 73343
	recipe = AddRecipe(73343, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Rigid Ocean Sapphire -- 73344
	recipe = AddRecipe(73344, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Subtle Amberjewel -- 73345
	recipe = AddRecipe(73345, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Smooth Amberjewel -- 73346
	recipe = AddRecipe(73346, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Mystic Amberjewel -- 73347
	recipe = AddRecipe(73347, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Quick Amberjewel -- 73348
	recipe = AddRecipe(73348, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fractured Amberjewel -- 73349
	recipe = AddRecipe(73349, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sovereign Demonseye -- 73350
	recipe = AddRecipe(73350, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Shifting Demonseye -- 73351
	recipe = AddRecipe(73351, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Defender's Demonseye -- 73352
	recipe = AddRecipe(73352, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Timeless Demonseye -- 73353
	recipe = AddRecipe(73353, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Guardian's Demonseye -- 73354
	recipe = AddRecipe(73354, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Purified Demonseye -- 73355
	recipe = AddRecipe(73355, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Etched Demonseye -- 73356
	recipe = AddRecipe(73356, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Glinting Demonseye -- 73357
	recipe = AddRecipe(73357, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Retaliating Demonseye -- 73358
	recipe = AddRecipe(73358, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Veiled Demonseye -- 73359
	recipe = AddRecipe(73359, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Accurate Demonseye -- 73360
	recipe = AddRecipe(73360, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Polished Ember Topaz -- 73361
	recipe = AddRecipe(73361, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Resolute Ember Topaz -- 73362
	recipe = AddRecipe(73362, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Inscribed Ember Topaz -- 73364
	recipe = AddRecipe(73364, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Deadly Ember Topaz -- 73365
	recipe = AddRecipe(73365, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Potent Ember Topaz -- 73366
	recipe = AddRecipe(73366, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fierce Ember Topaz -- 73367
	recipe = AddRecipe(73367, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Deft Ember Topaz -- 73368
	recipe = AddRecipe(73368, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Reckless Ember Topaz -- 73369
	recipe = AddRecipe(73369, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Skillful Ember Topaz -- 73370
	recipe = AddRecipe(73370, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Adept Ember Topaz -- 73371
	recipe = AddRecipe(73371, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fine Ember Topaz -- 73372
	recipe = AddRecipe(73372, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Artful Ember Topaz -- 73373
	recipe = AddRecipe(73373, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Keen Ember Topaz -- 73374
	recipe = AddRecipe(73374, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Regal Dream Emerald -- 73375
	recipe = AddRecipe(73375, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Nimble Dream Emerald -- 73376
	recipe = AddRecipe(73376, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Jagged Dream Emerald -- 73377
	recipe = AddRecipe(73377, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Piercing Dream Emerald -- 73378
	recipe = AddRecipe(73378, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Steady Dream Emerald -- 73379
	recipe = AddRecipe(73379, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Forceful Dream Emerald -- 73380
	recipe = AddRecipe(73380, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Lightning Dream Emerald -- 73381
	recipe = AddRecipe(73381, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Puissant Dream Emerald -- 73382
	recipe = AddRecipe(73382, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Zen Dream Emerald -- 73383
	recipe = AddRecipe(73383, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sensei's Dream Emerald -- 73384
	recipe = AddRecipe(73384, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Bold Chimera's Eye -- 73396
	recipe = AddRecipe(73396, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Delicate Chimera's Eye -- 73397
	recipe = AddRecipe(73397, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Flashing Chimera's Eye -- 73398
	recipe = AddRecipe(73398, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Brilliant Chimera's Eye -- 73399
	recipe = AddRecipe(73399, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Precise Chimera's Eye -- 73400
	recipe = AddRecipe(73400, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Solid Chimera's Eye -- 73401
	recipe = AddRecipe(73401, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Sparkling Chimera's Eye -- 73402
	recipe = AddRecipe(73402, 500, 52262, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Stormy Chimera's Eye -- 73403
	recipe = AddRecipe(73403, 500, 52263, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Rigid Chimera's Eye -- 73404
	recipe = AddRecipe(73404, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Subtle Chimera's Eye -- 73405
	recipe = AddRecipe(73405, 500, 52265, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Smooth Chimera's Eye -- 73406
	recipe = AddRecipe(73406, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Mystic Chimera's Eye -- 73407
	recipe = AddRecipe(73407, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Quick Chimera's Eye -- 73408
	recipe = AddRecipe(73408, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fractured Chimera's Eye -- 73409
	recipe = AddRecipe(73409, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fleet Shadowspirit Diamond -- 73464
	recipe = AddRecipe(73464, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Chaotic Shadowspirit Diamond -- 73465
	recipe = AddRecipe(73465, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Bracing Shadowspirit Diamond -- 73466
	recipe = AddRecipe(73466, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Eternal Shadowspirit Diamond -- 73467
	recipe = AddRecipe(73467, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Austere Shadowspirit Diamond -- 73468
	recipe = AddRecipe(73468, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Effulgent Shadowspirit Diamond -- 73469
	recipe = AddRecipe(73469, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Ember Shadowspirit Diamond -- 73470
	recipe = AddRecipe(73470, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Revitalizing Shadowspirit Diamond -- 73471
	recipe = AddRecipe(73471, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Destructive Shadowspirit Diamond -- 73472
	recipe = AddRecipe(73472, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Powerful Shadowspirit Diamond -- 73473
	recipe = AddRecipe(73473, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Enigmatic Shadowspirit Diamond -- 73474
	recipe = AddRecipe(73474, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Impassive Shadowspirit Diamond -- 73475
	recipe = AddRecipe(73475, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Forlorn Shadowspirit Diamond -- 73476
	recipe = AddRecipe(73476, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Fire Prism -- 73478
	recipe = AddRecipe(73478, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(19063, 19775, 19778, 26982, 26997, 28701, 44582, 46675)

	-- Jasper Ring -- 73494
	recipe = AddRecipe(73494, 425, 52306, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(19063, 19775, 19778, 26982, 26997, 28701, 44582, 46675)

	-- Hessonite Band -- 73495
	recipe = AddRecipe(73495, 450, 52308, Q.COMMON, V.CATA, 450, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(19063, 19775, 19778, 26982, 26997, 28701, 44582, 46675)

	-- Alicite Pendant -- 73496
	recipe = AddRecipe(73496, 435, 52307, Q.COMMON, V.CATA, 435, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(19063, 19775, 19778, 26982, 26997, 28701, 44582, 46675)

	-- Nightstone Choker -- 73497
	recipe = AddRecipe(73497, 460, 52309, Q.COMMON, V.CATA, 460, 495, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18751, 18774, 19063, 19775, 19778, 26982, 26997, 28701, 33614, 44582, 46675)

	-- Band of Blades -- 73498
	recipe = AddRecipe(73498, 525, 52318, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Ring of Warring Elements -- 73502
	recipe = AddRecipe(73502, 525, 52319, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Elementium Moebius Band -- 73503
	recipe = AddRecipe(73503, 525, 52320, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Entwined Elementium Choker -- 73504
	recipe = AddRecipe(73504, 525, 52321, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Eye of Many Deaths -- 73505
	recipe = AddRecipe(73505, 525, 52322, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Elementium Guardian -- 73506
	recipe = AddRecipe(73506, 525, 52323, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Elementium Destroyer's Ring -- 73520
	recipe = AddRecipe(73520, 525, 52348, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Brazen Elementium Medallion -- 73521
	recipe = AddRecipe(73521, 525, 52350, Q.EPIC, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Carnelian Spikes -- 73620
	recipe = AddRecipe(73620, 460, 52492, Q.COMMON, V.CATA, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(19063, 19775, 19778, 26982, 26997, 28701, 44582, 46675)

	-- The Perforator -- 73621
	recipe = AddRecipe(73621, 490, nil, Q.COMMON, V.CATA, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(19063, 19775, 19778, 26982, 26997, 28701, 44582, 46675)

	-- Jeweler's Ruby Monocle -- 73625
	recipe = AddRecipe(73625, 450, 52485, Q.RARE, V.CATA, 450, 480, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Jeweler's Sapphire Monocle -- 73626
	recipe = AddRecipe(73626, 455, 52486, Q.RARE, V.CATA, 455, 485, 495, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Jeweler's Emerald Monocle -- 73627
	recipe = AddRecipe(73627, 460, 52487, Q.RARE, V.CATA, 460, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Willful Ember Topaz -- 95754
	recipe = AddRecipe(95754, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Lucent Ember Topaz -- 95755
	recipe = AddRecipe(95755, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Resplendent Ember Topaz -- 95756
	recipe = AddRecipe(95756, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Vivid Dream Emerald -- 96226
	recipe = AddRecipe(96226, 465, 68741, Q.RARE, V.CATA, 465, 500, 507, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50480, 50482)

	-- Agile Shadowspirit Diamond -- 96255
	recipe = AddRecipe(96255, 490, 68778, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Reverberating Shadowspirit Diamond -- 96256
	recipe = AddRecipe(96256, 490, 68779, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	-- Burning Shadowspirit Diamond -- 96257
	recipe = AddRecipe(96257, 490, 68780, Q.RARE, V.CATA, 490, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Deepholm", "Eastern Kingdoms", "Kalimdor")

	self.InitJewelcrafting = nil
end
