--[[
************************************************************************
Jewelcrafting.lua
Jewelcrafting data for all of Ackis Recipe List
************************************************************************
File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
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

local private	= select(2, ...)

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F		= private.filter_flags
local A		= private.acquire_types
local Q		= private.item_qualities
local REP	= private.rep_levels
local FAC	= private.faction_ids
local V		= private.game_versions

local initialized = false
local num_recipes = 0

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level)
	num_recipes = num_recipes + 1
	addon:AddRecipe(spell_id, skill_level, item_id, quality, 25229, nil, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitJewelcrafting()
	if initialized then
		return num_recipes
	end
	initialized = true

	-- Delicate Copper Wire -- 25255
	AddRecipe(25255, 1, 20816, Q.COMMON, V.TBC, 1, 20, 35, 50)
	self:AddRecipeFlags(25255, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeCustom(25255, 8)

	-- Bronze Setting -- 25278
	AddRecipe(25278, 50, 20817, Q.COMMON, V.TBC, 50, 70, 80, 90)
	self:AddRecipeFlags(25278, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(25278, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Elegant Silver Ring -- 25280
	AddRecipe(25280, 50, 20818, Q.COMMON, V.TBC, 50, 80, 95, 110)
	self:AddRecipeFlags(25280, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25280, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Inlaid Malachite Ring -- 25283
	AddRecipe(25283, 30, 20821, Q.COMMON, V.TBC, 30, 60, 75, 90)
	self:AddRecipeFlags(25283, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25283, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Simple Pearl Ring -- 25284
	AddRecipe(25284, 60, 20820, Q.COMMON, V.TBC, 60, 90, 105, 120)
	self:AddRecipeFlags(25284, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25284, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Gloom Band -- 25287
	AddRecipe(25287, 70, 20823, Q.COMMON, V.TBC, 70, 100, 115, 130)
	self:AddRecipeFlags(25287, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25287, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Heavy Silver Ring -- 25305
	AddRecipe(25305, 90, 20826, Q.COMMON, V.TBC, 90, 120, 135, 150)
	self:AddRecipeFlags(25305, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25305, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Ring of Silver Might -- 25317
	AddRecipe(25317, 80, 20827, Q.COMMON, V.TBC, 80, 110, 125, 140)
	self:AddRecipeFlags(25317, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25317, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Ring of Twilight Shadows -- 25318
	AddRecipe(25318, 100, 20828, Q.COMMON, V.TBC, 100, 130, 145, 160)
	self:AddRecipeFlags(25318, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25318, 33614, 19778, 26982, 18751, 19775, 18774, 19063, 33590, 28701, 26997, 33680, 19539, 26960, 15501)

	-- Heavy Golden Necklace of Battle -- 25320
	AddRecipe(25320, 150, 20856, Q.COMMON, V.TBC, 150, 180, 195, 210)
	self:AddRecipeFlags(25320, F.VENDOR, F.RBOE, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeLimitedVendor(25320, 17512, 1, 16624, 1, 3367, 1, 1286, 1)

	-- Moonsoul Crown -- 25321
	AddRecipe(25321, 120, 20832, Q.COMMON, V.TBC, 120, 150, 165, 180)
	self:AddRecipeFlags(25321, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.CLOTH)
	self:AddRecipeTrainer(25321, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Wicked Moonstone Ring -- 25323
	AddRecipe(25323, 125, 20833, Q.COMMON, V.TBC, 125, 155, 170, 185)
	self:AddRecipeFlags(25323, F.VENDOR, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeLimitedVendor(25323, 3499, 1, 3954, 1)

	-- Amulet of the Moon -- 25339
	AddRecipe(25339, 110, 20830, Q.COMMON, V.TBC, 110, 140, 155, 170)
	self:AddRecipeFlags(25339, F.VENDOR, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeLimitedVendor(25339, 16624, 1, 4561, 1, 4229, 1, 17512, 1)

	-- Solid Bronze Ring -- 25490
	AddRecipe(25490, 50, 20907, Q.COMMON, V.TBC, 50, 80, 95, 110)
	self:AddRecipeFlags(25490, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25490, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Braided Copper Ring -- 25493
	AddRecipe(25493, 1, 20906, Q.COMMON, V.TBC, 1, 30, 45, 60)
	self:AddRecipeFlags(25493, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeCustom(25493, 8)

	-- Barbaric Iron Collar -- 25498
	AddRecipe(25498, 110, 20909, Q.COMMON, V.TBC, 110, 140, 155, 170)
	self:AddRecipeFlags(25498, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(25498, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Pendant of the Agate Shield -- 25610
	AddRecipe(25610, 120, 20950, Q.COMMON, V.TBC, 120, 150, 165, 180)
	self:AddRecipeFlags(25610, F.VENDOR, F.RBOE, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeVendor(25610, 1448, 4877)

	-- Heavy Iron Knuckles -- 25612
	AddRecipe(25612, 125, 20954, Q.COMMON, V.TBC, 125, 155, 170, 185)
	self:AddRecipeFlags(25612, F.VENDOR, F.RBOE, F.IBOE, F.DPS, F.HORDE, F.FIST, F.ONE_HAND)
	self:AddRecipeLimitedVendor(25612, 2393, 1)

	-- Golden Dragon Ring -- 25613
	AddRecipe(25613, 135, 20955, Q.COMMON, V.TBC, 135, 165, 180, 195)
	self:AddRecipeFlags(25613, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25613, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Mithril Filigree -- 25615
	AddRecipe(25615, 150, 20963, Q.COMMON, V.TBC, 150, 170, 180, 190)
	self:AddRecipeFlags(25615, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(25615, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Blazing Citrine Ring -- 25617
	AddRecipe(25617, 150, 20958, Q.COMMON, V.TBC, 150, 180, 195, 210)
	self:AddRecipeFlags(25617, F.VENDOR, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.HORDE, F.RING)
	self:AddRecipeLimitedVendor(25617, 9636, 1)

	-- Jade Pendant of Blasting -- 25618
	AddRecipe(25618, 160, 20966, Q.UNCOMMON, V.TBC, 160, 190, 205, 220)
	self:AddRecipeFlags(25618, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(25618, "Kalimdor", "Eastern Kingdoms")

	-- The Jade Eye -- 25619
	AddRecipe(25619, 170, 20959, Q.COMMON, V.TBC, 170, 200, 215, 230)
	self:AddRecipeFlags(25619, F.VENDOR, F.RBOE, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeLimitedVendor(25619, 17512, 1, 16624, 1, 4775, 1, 5163, 1)

	-- Engraved Truesilver Ring -- 25620
	AddRecipe(25620, 170, 20960, Q.COMMON, V.TBC, 170, 200, 215, 230)
	self:AddRecipeFlags(25620, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25620, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Citrine Ring of Rapid Healing -- 25621
	AddRecipe(25621, 180, 20961, Q.COMMON, V.TBC, 180, 210, 225, 240)
	self:AddRecipeFlags(25621, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(25621, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Citrine Pendant of Golden Healing -- 25622
	AddRecipe(25622, 190, 20967, Q.UNCOMMON, V.TBC, 190, 220, 235, 250)
	self:AddRecipeFlags(25622, F.CASTER, F.WORLD_DROP, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(25622, "Kalimdor", "Eastern Kingdoms")

	-- Figurine - Jade Owl -- 26872
	AddRecipe(26872, 200, 21748, Q.COMMON, V.TBC, 200, 225, 240, 255)
	self:AddRecipeFlags(26872, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.TRINKET)
	self:AddRecipeTrainer(26872, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Figurine - Golden Hare -- 26873
	AddRecipe(26873, 200, 21756, Q.UNCOMMON, V.TBC, 200, 225, 240, 255)
	self:AddRecipeFlags(26873, F.RBOE, F.WORLD_DROP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeWorldDrop(26873, "Kalimdor", "Eastern Kingdoms")

	-- Aquamarine Signet -- 26874
	AddRecipe(26874, 210, 20964, Q.COMMON, V.TBC, 210, 235, 250, 265)
	self:AddRecipeFlags(26874, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26874, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Figurine - Black Pearl Panther -- 26875
	AddRecipe(26875, 215, 21758, Q.COMMON, V.TBC, 215, 240, 255, 270)
	self:AddRecipeFlags(26875, F.VENDOR, F.RBOE, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeVendor(26875, 989, 4897)

	-- Aquamarine Pendant of the Warrior -- 26876
	AddRecipe(26876, 220, 21755, Q.COMMON, V.TBC, 220, 245, 260, 275)
	self:AddRecipeFlags(26876, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(26876, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Ruby Crown of Restoration -- 26878
	AddRecipe(26878, 225, 20969, Q.COMMON, V.TBC, 225, 250, 265, 280)
	self:AddRecipeFlags(26878, F.VENDOR, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.CLOTH)
	self:AddRecipeLimitedVendor(26878, 2810, 1, 2821, 1)

	-- Thorium Setting -- 26880
	AddRecipe(26880, 225, 21752, Q.COMMON, V.TBC, 225, 235, 245, 255)
	self:AddRecipeFlags(26880, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(26880, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Figurine - Truesilver Crab -- 26881
	AddRecipe(26881, 225, 21760, Q.COMMON, V.TBC, 225, 250, 265, 280)
	self:AddRecipeFlags(26881, F.VENDOR, F.RBOE, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeLimitedVendor(26881, 1148, 1, 4897, 1)

	-- Figurine - Truesilver Boar -- 26882
	AddRecipe(26882, 235, 21763, Q.UNCOMMON, V.TBC, 235, 260, 275, 290)
	self:AddRecipeFlags(26882, F.RBOE, F.WORLD_DROP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeWorldDrop(26882, "Kalimdor", "Eastern Kingdoms")

	-- Ruby Pendant of Fire -- 26883
	AddRecipe(26883, 235, 21764, Q.COMMON, V.TBC, 235, 260, 275, 290)
	self:AddRecipeFlags(26883, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(26883, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Truesilver Healing Ring -- 26885
	AddRecipe(26885, 240, 21765, Q.COMMON, V.TBC, 240, 265, 280, 295)
	self:AddRecipeFlags(26885, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26885, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- The Aquamarine Ward -- 26887
	AddRecipe(26887, 245, 21754, Q.UNCOMMON, V.TBC, 245, 270, 285, 300)
	self:AddRecipeFlags(26887, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeWorldDrop(26887, "Kalimdor", "Eastern Kingdoms")

	-- Gem Studded Band -- 26896
	AddRecipe(26896, 250, 21753, Q.UNCOMMON, V.TBC, 250, 275, 290, 305)
	self:AddRecipeFlags(26896, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeWorldDrop(26896, "Kalimdor", "Eastern Kingdoms")

	-- Opal Necklace of Impact -- 26897
	AddRecipe(26897, 250, 21766, Q.COMMON, V.TBC, 250, 275, 290, 305)
	self:AddRecipeFlags(26897, F.VENDOR, F.RBOE, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeLimitedVendor(26897, 17512, 1, 5163, 1, 16624, 1, 8363, 1)

	-- Figurine - Ruby Serpent -- 26900
	AddRecipe(26900, 260, 21769, Q.UNCOMMON, V.TBC, 260, 280, 290, 300)
	self:AddRecipeFlags(26900, F.RBOE, F.CASTER, F.WORLD_DROP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeWorldDrop(26900, "Kalimdor", "Eastern Kingdoms")

	-- Simple Opal Ring -- 26902
	AddRecipe(26902, 260, 21767, Q.COMMON, V.TBC, 260, 280, 290, 300)
	self:AddRecipeFlags(26902, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26902, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Sapphire Signet -- 26903
	AddRecipe(26903, 275, 21768, Q.COMMON, V.TBC, 275, 285, 295, 305)
	self:AddRecipeFlags(26903, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26903, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Emerald Crown of Destruction -- 26906
	AddRecipe(26906, 275, 21774, Q.COMMON, V.TBC, 275, 285, 295, 305)
	self:AddRecipeFlags(26906, F.VENDOR, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.CLOTH)
	self:AddRecipeLimitedVendor(26906, 15179, 1)

	-- Onslaught Ring -- 26907
	AddRecipe(26907, 280, 21775, Q.COMMON, V.TBC, 280, 290, 300, 310)
	self:AddRecipeFlags(26907, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26907, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Sapphire Pendant of Winter Night -- 26908
	AddRecipe(26908, 280, 21790, Q.COMMON, V.TBC, 280, 290, 300, 310)
	self:AddRecipeFlags(26908, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(26908, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Figurine - Emerald Owl -- 26909
	AddRecipe(26909, 285, 21777, Q.UNCOMMON, V.TBC, 285, 295, 305, 315)
	self:AddRecipeFlags(26909, F.RBOE, F.CASTER, F.WORLD_DROP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeWorldDrop(26909, "Kalimdor", "Eastern Kingdoms")

	-- Ring of Bitter Shadows -- 26910
	AddRecipe(26910, 285, 21778, Q.COMMON, V.TBC, 285, 295, 305, 315)
	self:AddRecipeFlags(26910, F.VENDOR, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(26910, 12941)

	-- Living Emerald Pendant -- 26911
	AddRecipe(26911, 290, 21791, Q.COMMON, V.TBC, 290, 300, 310, 320)
	self:AddRecipeFlags(26911, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(26911, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Figurine - Black Diamond Crab -- 26912
	AddRecipe(26912, 300, 21784, Q.UNCOMMON, V.TBC, 300, 310, 320, 330)
	self:AddRecipeFlags(26912, F.MOB_DROP, F.INSTANCE, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeMobDrop(26912, 9736)

	-- Figurine - Dark Iron Scorpid -- 26914
	AddRecipe(26914, 300, 21789, Q.UNCOMMON, V.TBC, 300, 310, 320, 330)
	self:AddRecipeFlags(26914, F.MOB_DROP, F.INSTANCE, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.TRINKET)
	self:AddRecipeMobDrop(26914, 8983)

	-- Necklace of the Diamond Tower -- 26915
	AddRecipe(26915, 305, 21792, Q.COMMON, V.TBC, 305, 315, 325, 335)
	self:AddRecipeFlags(26915, F.VENDOR, F.RBOE, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeVendor(26915, 11189)

	-- Band of Natural Fire -- 26916
	AddRecipe(26916, 310, 21779, Q.COMMON, V.TBC, 310, 320, 330, 340)
	self:AddRecipeFlags(26916, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26916, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Woven Copper Ring -- 26925
	AddRecipe(26925, 1, 21931, Q.COMMON, V.TBC, 1, 30, 45, 60)
	self:AddRecipeFlags(26925, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeCustom(26925, 8)

	-- Heavy Copper Ring -- 26926
	AddRecipe(26926, 5, 21932, Q.COMMON, V.TBC, 5, 35, 50, 65)
	self:AddRecipeFlags(26926, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(26926, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Thick Bronze Necklace -- 26927
	AddRecipe(26927, 50, 21933, Q.COMMON, V.TBC, 50, 80, 95, 110)
	self:AddRecipeFlags(26927, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(26927, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Ornate Tigerseye Necklace -- 26928
	AddRecipe(26928, 30, 21934, Q.COMMON, V.TBC, 30, 60, 75, 90)
	self:AddRecipeFlags(26928, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(26928, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Brilliant Blood Garnet -- 28903
	AddRecipe(28903, 300, 23094, Q.COMMON, V.TBC, 300, 300, 320, 340)
	self:AddRecipeFlags(28903, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28903, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Bold Blood Garnet -- 28905
	AddRecipe(28905, 305, 23095, Q.COMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(28905, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28905, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Inscribed Flame Spessarite -- 28910
	AddRecipe(28910, 300, 23098, Q.COMMON, V.TBC, 300, 300, 320, 340)
	self:AddRecipeFlags(28910, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28910, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Reckless Flame Spessarite -- 28912
	AddRecipe(28912, 305, 23099, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(28912, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(28912, FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Glinting Shadow Draenite -- 28914
	AddRecipe(28914, 315, 23100, Q.COMMON, V.TBC, 315, 315, 335, 355)
	self:AddRecipeFlags(28914, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28914, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Potent Flame Spessarite -- 28915
	AddRecipe(28915, 325, 23101, Q.UNCOMMON, V.TBC, 325, 325, 340, 355)
	self:AddRecipeFlags(28915, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.LOWERCITY)
	self:AddRecipeRepVendor(28915, FAC.LOWERCITY, REP.FRIENDLY, 21655)

	-- Radiant Deep Peridot -- 28916
	AddRecipe(28916, 300, 23103, Q.COMMON, V.TBC, 300, 300, 320, 340)
	self:AddRecipeFlags(28916, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28916, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Jagged Deep Peridot -- 28917
	AddRecipe(28917, 305, 23104, Q.COMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(28917, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28917, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Regal Deep Peridot -- 28918
	AddRecipe(28918, 315, 23105, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	self:AddRecipeFlags(28918, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.HELLFIRE)
	self:AddRecipeRepVendor(28918, FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	self:AddRecipeRepVendor(28918, FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Timeless Shadow Draenite -- 28925
	AddRecipe(28925, 300, 23108, Q.COMMON, V.TBC, 300, 300, 320, 340)
	self:AddRecipeFlags(28925, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28925, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Purified Shadow Draenite -- 28927
	AddRecipe(28927, 305, 23109, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(28927, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.ALDOR)
	self:AddRecipeRepVendor(28927, FAC.ALDOR, REP.HONORED, 19321)

	-- Shifting Shadow Draenite -- 28933
	AddRecipe(28933, 315, 23110, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	self:AddRecipeFlags(28933, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(28933, FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Sovereign Shadow Draenite -- 28936
	AddRecipe(28936, 325, 23111, Q.COMMON, V.TBC, 325, 325, 340, 355)
	self:AddRecipeFlags(28936, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28936, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Smooth Golden Draenite -- 28944
	AddRecipe(28944, 305, 23114, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(28944, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.ALDOR)
	self:AddRecipeRepVendor(28944, FAC.ALDOR, REP.FRIENDLY, 19321)

	-- Subtle Golden Draenite -- 28947
	AddRecipe(28947, 315, 23115, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	self:AddRecipeFlags(28947, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(28947, FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Rigid Azure Moonstone -- 28948
	AddRecipe(28948, 325, 23116, Q.COMMON, V.TBC, 325, 325, 340, 355)
	self:AddRecipeFlags(28948, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28948, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Solid Azure Moonstone -- 28950
	AddRecipe(28950, 300, 23118, Q.COMMON, V.TBC, 300, 300, 320, 340)
	self:AddRecipeFlags(28950, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28950, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Sparkling Azure Moonstone -- 28953
	AddRecipe(28953, 305, 23119, Q.COMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(28953, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(28953, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Stormy Azure Moonstone -- 28955
	AddRecipe(28955, 315, 23120, Q.UNCOMMON, V.TBC, 315, 315, 335, 355)
	self:AddRecipeFlags(28955, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(28955, "Outland")

	-- Fel Iron Blood Ring -- 31048
	AddRecipe(31048, 310, 24074, Q.COMMON, V.TBC, 310, 320, 330, 340)
	self:AddRecipeFlags(31048, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(31048, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Golden Draenite Ring -- 31049
	AddRecipe(31049, 310, 24075, Q.COMMON, V.TBC, 310, 320, 335, 350)
	self:AddRecipeFlags(31049, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(31049, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Azure Moonstone Ring -- 31050
	AddRecipe(31050, 320, 24076, Q.COMMON, V.TBC, 320, 330, 340, 350)
	self:AddRecipeFlags(31050, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(31050, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Thick Adamantite Necklace -- 31051
	AddRecipe(31051, 335, 24077, Q.COMMON, V.TBC, 335, 345, 355, 365)
	self:AddRecipeFlags(31051, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(31051, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Heavy Adamantite Ring -- 31052
	AddRecipe(31052, 335, 24078, Q.COMMON, V.TBC, 335, 345, 355, 365)
	self:AddRecipeFlags(31052, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(31052, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Khorium Band of Shadows -- 31053
	AddRecipe(31053, 350, 24079, Q.RARE, V.TBC, 350, 360, 370, 380)
	self:AddRecipeFlags(31053, F.MOB_DROP, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeMobDrop(31053, 19826)

	-- Khorium Band of Frost -- 31054
	AddRecipe(31054, 355, 24080, Q.RARE, V.TBC, 355, 365, 372, 380)
	self:AddRecipeFlags(31054, F.MOB_DROP, F.INSTANCE, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeMobDrop(31054, 17722)

	-- Khorium Inferno Band -- 31055
	AddRecipe(31055, 355, 24082, Q.RARE, V.TBC, 355, 365, 372, 380)
	self:AddRecipeFlags(31055, F.MOB_DROP, F.INSTANCE, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeMobDrop(31055, 18472)

	-- Khorium Band of Leaves -- 31056
	AddRecipe(31056, 360, 24085, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31056, F.MOB_DROP, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeMobDrop(31056, 19984)

	-- Arcane Khorium Band -- 31057
	AddRecipe(31057, 365, 24086, Q.RARE, V.TBC, 365, 370, 375, 380)
	self:AddRecipeFlags(31057, F.MOB_DROP, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeMobDrop(31057, 18866)

	-- Heavy Felsteel Ring -- 31058
	AddRecipe(31058, 345, 24087, Q.RARE, V.TBC, 345, 355, 365, 375)
	self:AddRecipeFlags(31058, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeWorldDrop(31058, "Outland")

	-- Delicate Eternium Ring -- 31060
	AddRecipe(31060, 355, 24088, Q.RARE, V.TBC, 355, 365, 375, 385)
	self:AddRecipeFlags(31060, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeWorldDrop(31060, "Outland")

	-- Blazing Eternium Band -- 31061
	AddRecipe(31061, 365, 24089, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(31061, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeWorldDrop(31061, "Outland")

	-- Pendant of Frozen Flame -- 31062
	AddRecipe(31062, 360, 24092, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31062, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.KOT, F.NECK)
	self:AddRecipeRepVendor(31062, FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Pendant of Thawing -- 31063
	AddRecipe(31063, 360, 24093, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31063, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.LOWERCITY, F.NECK)
	self:AddRecipeRepVendor(31063, FAC.LOWERCITY, REP.REVERED, 21655)

	-- Pendant of Withering -- 31064
	AddRecipe(31064, 360, 24095, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31064, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCRYER, F.NECK)
	self:AddRecipeRepVendor(31064, FAC.SCRYER, REP.REVERED, 19331)

	-- Pendant of Shadow's End -- 31065
	AddRecipe(31065, 360, 24097, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31065, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.ALDOR, F.NECK)
	self:AddRecipeRepVendor(31065, FAC.ALDOR, REP.REVERED, 19321)

	-- Pendant of the Null Rune -- 31066
	AddRecipe(31066, 360, 24098, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31066, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.CONSORTIUM, F.NECK)
	self:AddRecipeRepVendor(31066, FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Thick Felsteel Necklace -- 31067
	AddRecipe(31067, 355, 24106, Q.RARE, V.TBC, 355, 365, 375, 385)
	self:AddRecipeFlags(31067, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(31067, "Outland")

	-- Living Ruby Pendant -- 31068
	AddRecipe(31068, 355, 24110, Q.RARE, V.TBC, 355, 365, 375, 385)
	self:AddRecipeFlags(31068, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(31068, "Outland")

	-- Braided Eternium Chain -- 31070
	AddRecipe(31070, 360, 24114, Q.RARE, V.TBC, 360, 370, 377, 385)
	self:AddRecipeFlags(31070, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(31070, "Outland")

	-- Eye of the Night -- 31071
	AddRecipe(31071, 360, 24116, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(31071, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(31071, "Outland")

	-- Embrace of the Dawn -- 31072
	AddRecipe(31072, 365, 24117, Q.RARE, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(31072, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(31072, "Outland")

	-- Chain of the Twilight Owl -- 31076
	AddRecipe(31076, 365, 24121, Q.RARE, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(31076, F.RBOE, F.CASTER, F.WORLD_DROP, F.TANK, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeWorldDrop(31076, "Outland")

	-- Coronet of Verdant Flame -- 31077
	AddRecipe(31077, 370, 24122, Q.EPIC, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31077, F.MOB_DROP, F.INSTANCE, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.CLOTH)
	self:AddRecipeMobDrop(31077, 18422)

	-- Circlet of Arcane Might -- 31078
	AddRecipe(31078, 370, 24123, Q.EPIC, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31078, F.MOB_DROP, F.INSTANCE, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.CLOTH)
	self:AddRecipeMobDrop(31078, 18096)

	-- Figurine - Felsteel Boar -- 31079
	AddRecipe(31079, 370, 24124, Q.RARE, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31079, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.LOWERCITY, F.TRINKET)
	self:AddRecipeRepVendor(31079, FAC.LOWERCITY, REP.REVERED, 21655)

	-- Figurine - Dawnstone Crab -- 31080
	AddRecipe(31080, 370, 24125, Q.RARE, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31080, F.VENDOR, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE, F.HELLFIRE, F.TRINKET)
	self:AddRecipeRepVendor(31080, FAC.HONOR_HOLD, REP.REVERED, 17657)
	self:AddRecipeRepVendor(31080, FAC.THRALLMAR, REP.REVERED, 17585)

	-- Figurine - Living Ruby Serpent -- 31081
	AddRecipe(31081, 370, 24126, Q.RARE, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31081, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.KOT, F.TRINKET)
	self:AddRecipeRepVendor(31081, FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Figurine - Talasite Owl -- 31082
	AddRecipe(31082, 370, 24127, Q.RARE, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31082, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATAR, F.TRINKET)
	self:AddRecipeRepVendor(31082, FAC.SHATAR, REP.REVERED, 21432)

	-- Figurine - Nightseye Panther -- 31083
	AddRecipe(31083, 370, 24128, Q.RARE, V.TBC, 370, 375, 380, 385)
	self:AddRecipeFlags(31083, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.CENARION_EXPEDITION, F.TRINKET)
	self:AddRecipeRepVendor(31083, FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Bold Living Ruby -- 31084
	AddRecipe(31084, 350, 24027, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31084, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31084, "Outland")

	-- Delicate Living Ruby -- 31085
	AddRecipe(31085, 350, 24028, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31085, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31085, "Outland")

	-- Brilliant Living Ruby -- 31088
	AddRecipe(31088, 350, 24030, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31088, F.MOB_DROP, F.RBOE, F.CASTER, F.WORLD_DROP, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(31088, 24664)
	self:AddRecipeWorldDrop(31088, "Outland")

	-- Subtle Dawnstone -- 31090
	AddRecipe(31090, 350, 24032, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31090, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31090, "Outland")

	-- Flashing Living Ruby -- 31091
	AddRecipe(31091, 350, 24036, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31091, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31091, "Outland")

	-- Solid Star of Elune -- 31092
	AddRecipe(31092, 350, 24033, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31092, F.MOB_DROP, F.RBOE, F.WORLD_DROP, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(31092, 24664)
	self:AddRecipeWorldDrop(31092, "Outland")

	-- Stormy Star of Elune -- 31095
	AddRecipe(31095, 350, 24039, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31095, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31095, "Outland")

	-- Smooth Dawnstone -- 31097
	AddRecipe(31097, 350, 24048, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31097, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31097, "Outland")

	-- Rigid Star of Elune -- 31098
	AddRecipe(31098, 350, 24051, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31098, F.MOB_DROP, F.RBOE, F.WORLD_DROP, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(31098, 24664)
	self:AddRecipeWorldDrop(31098, "Outland")

	-- Mystic Dawnstone -- 31101
	AddRecipe(31101, 350, 24053, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31101, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(31101, 21474, 21485)

	-- Sovereign Nightseye -- 31102
	AddRecipe(31102, 350, 24054, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31102, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31102, "Outland")

	-- Shifting Nightseye -- 31103
	AddRecipe(31103, 350, 24055, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31103, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31103, "Outland")

	-- Timeless Nightseye -- 31104
	AddRecipe(31104, 350, 24056, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31104, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31104, "Outland")

	-- Inscribed Noble Topaz -- 31106
	AddRecipe(31106, 350, 24058, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31106, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31106, "Outland")

	-- Potent Noble Topaz -- 31107
	AddRecipe(31107, 350, 24059, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31107, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31107, "Outland")

	-- Reckless Noble Topaz -- 31108
	AddRecipe(31108, 350, 24060, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31108, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31108, "Outland")

	-- Glinting Nightseye -- 31109
	AddRecipe(31109, 350, 24061, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31109, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31109, "Outland")

	-- Radiant Talasite -- 31111
	AddRecipe(31111, 350, 24066, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31111, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31111, "Outland")

	-- Purified Nightseye -- 31112
	AddRecipe(31112, 350, 24065, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31112, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31112, "Outland")

	-- Jagged Talasite -- 31113
	AddRecipe(31113, 350, 24067, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31113, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31113, "Outland")

	-- Sparkling Star of Elune -- 31149
	AddRecipe(31149, 350, 24035, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(31149, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(31149, "Outland")

	-- Malachite Pendant -- 32178
	AddRecipe(32178, 20, 25438, Q.COMMON, V.TBC, 20, 50, 65, 80)
	self:AddRecipeFlags(32178, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(32178, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Tigerseye Band -- 32179
	AddRecipe(32179, 20, 25439, Q.COMMON, V.TBC, 20, 50, 65, 80)
	self:AddRecipeFlags(32179, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(32179, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Rough Stone Statue -- 32259
	AddRecipe(32259, 1, 25498, Q.COMMON, V.TBC, 1, 30, 40, 50)
	self:AddRecipeFlags(32259, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER)
	self:AddRecipeCustom(32259, 8)

	-- Coarse Stone Statue -- 32801
	AddRecipe(32801, 50, 25880, Q.COMMON, V.TBC, 50, 70, 80, 90)
	self:AddRecipeFlags(32801, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(32801, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Heavy Stone Statue -- 32807
	AddRecipe(32807, 110, 25881, Q.COMMON, V.TBC, 110, 120, 130, 140)
	self:AddRecipeFlags(32807, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(32807, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Solid Stone Statue -- 32808
	AddRecipe(32808, 175, 25882, Q.COMMON, V.TBC, 175, 175, 185, 195)
	self:AddRecipeFlags(32808, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(32808, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Dense Stone Statue -- 32809
	AddRecipe(32809, 225, 25883, Q.COMMON, V.TBC, 225, 225, 235, 245)
	self:AddRecipeFlags(32809, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(32809, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Powerful Earthstorm Diamond -- 32866
	AddRecipe(32866, 365, 25896, Q.COMMON, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32866, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(32866, FAC.CONSORTIUM, REP.HONORED, 17518)

	-- Bracing Earthstorm Diamond -- 32867
	AddRecipe(32867, 365, 25897, Q.COMMON, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32867, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(32867, FAC.CONSORTIUM, REP.REVERED, 17518)

	-- Tenacious Earthstorm Diamond -- 32868
	AddRecipe(32868, 365, 25898, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32868, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(32868, "Outland")

	-- Brutal Earthstorm Diamond -- 32869
	AddRecipe(32869, 365, 25899, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32869, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(32869, "Outland")

	-- Insightful Earthstorm Diamond -- 32870
	AddRecipe(32870, 365, 25901, Q.COMMON, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32870, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SHATAR)
	self:AddRecipeRepVendor(32870, FAC.SHATAR, REP.FRIENDLY, 21432)

	-- Destructive Skyfire Diamond -- 32871
	AddRecipe(32871, 365, 25890, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32871, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(32871, "Outland")

	-- Mystical Skyfire Diamond -- 32872
	AddRecipe(32872, 365, 25893, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32872, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(32872, "Outland")

	-- Swift Skyfire Diamond -- 32873
	AddRecipe(32873, 365, 25894, Q.COMMON, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32873, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(32873, FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Enigmatic Skyfire Diamond -- 32874
	AddRecipe(32874, 365, 25895, Q.COMMON, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(32874, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.KOT)
	self:AddRecipeRepVendor(32874, FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Delicate Blood Garnet -- 34590
	AddRecipe(34590, 305, 28595, Q.COMMON, V.TBC, 305, 305, 325, 345)
	self:AddRecipeFlags(34590, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(34590, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Golden Ring of Power -- 34955
	AddRecipe(34955, 180, 29157, Q.COMMON, V.TBC, 180, 190, 200, 210)
	self:AddRecipeFlags(34955, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(34955, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Truesilver Commander's Ring -- 34959
	AddRecipe(34959, 200, 29158, Q.COMMON, V.TBC, 200, 210, 220, 230)
	self:AddRecipeFlags(34959, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(34959, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Glowing Thorium Band -- 34960
	AddRecipe(34960, 280, 29159, Q.COMMON, V.TBC, 280, 290, 300, 310)
	self:AddRecipeFlags(34960, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(34960, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Emerald Lion Ring -- 34961
	AddRecipe(34961, 290, 29160, Q.COMMON, V.TBC, 290, 300, 310, 320)
	self:AddRecipeFlags(34961, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(34961, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Brilliant Necklace -- 36523
	AddRecipe(36523, 75, 30419, Q.COMMON, V.TBC, 75, 105, 120, 135)
	self:AddRecipeFlags(36523, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(36523, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Heavy Jade Ring -- 36524
	AddRecipe(36524, 105, 30420, Q.COMMON, V.TBC, 105, 135, 150, 165)
	self:AddRecipeFlags(36524, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(36524, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Red Ring of Destruction -- 36525
	AddRecipe(36525, 230, 30421, Q.COMMON, V.TBC, 230, 255, 270, 285)
	self:AddRecipeFlags(36525, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(36525, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Diamond Focus Ring -- 36526
	AddRecipe(36526, 265, 30422, Q.COMMON, V.TBC, 265, 285, 295, 305)
	self:AddRecipeFlags(36526, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(36526, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Bronze Band of Force -- 37818
	AddRecipe(37818, 65, 30804, Q.COMMON, V.TBC, 65, 95, 110, 125)
	self:AddRecipeFlags(37818, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(37818, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- Ring of Arcane Shielding -- 37855
	AddRecipe(37855, 360, 30825, Q.RARE, V.TBC, 360, 370, 375, 380)
	self:AddRecipeFlags(37855, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SHATAR, F.RING)
	self:AddRecipeRepVendor(37855, FAC.SHATAR, REP.HONORED, 21432)

	-- Mercurial Adamantite -- 38068
	AddRecipe(38068, 325, 31079, Q.COMMON, V.TBC, 325, 325, 335, 345)
	self:AddRecipeFlags(38068, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(38068, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Bronze Torc -- 38175
	AddRecipe(38175, 80, 31154, Q.COMMON, V.TBC, 80, 110, 125, 140)
	self:AddRecipeFlags(38175, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(38175, 33614, 26960, 19778, 26982, 18751, 19775, 18774, 19063, 33680, 28701, 19539, 33590, 26915, 15501, 26997)

	-- The Frozen Eye -- 38503
	AddRecipe(38503, 375, 31398, Q.EPIC, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(38503, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.VIOLETEYE, F.RING)
	self:AddRecipeRepVendor(38503, FAC.VIOLETEYE, REP.HONORED, 18255)

	-- The Natural Ward -- 38504
	AddRecipe(38504, 375, 31399, Q.EPIC, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(38504, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.CENARION_EXPEDITION, F.RING)
	self:AddRecipeRepVendor(38504, FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Veiled Shadow Draenite -- 39466
	AddRecipe(39466, 325, 31866, Q.UNCOMMON, V.TBC, 325, 325, 340, 355)
	self:AddRecipeFlags(39466, F.MOB_DROP, F.RBOE, F.CASTER, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeCustom(39466, 35)

	-- Deadly Flame Spessarite -- 39467
	AddRecipe(39467, 325, 31869, Q.UNCOMMON, V.TBC, 325, 325, 340, 355)
	self:AddRecipeFlags(39467, F.MOB_DROP, F.RBOE, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeCustom(39467, 35)

	-- Veiled Nightseye -- 39470
	AddRecipe(39470, 350, 31867, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(39470, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(39470, "Outland")

	-- Deadly Noble Topaz -- 39471
	AddRecipe(39471, 350, 31868, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(39471, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(39471, "Outland")

	-- Bold Crimson Spinel -- 39705
	AddRecipe(39705, 375, 32193, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39705, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39705, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39705, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Delicate Crimson Spinel -- 39706
	AddRecipe(39706, 375, 32194, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39706, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39706, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39706, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Brilliant Crimson Spinel -- 39711
	AddRecipe(39711, 375, 32196, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39711, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39711, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39711, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Subtle Lionseye -- 39713
	AddRecipe(39713, 375, 32198, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39713, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39713, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39713, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Flashing Crimson Spinel -- 39714
	AddRecipe(39714, 375, 32199, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39714, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39714, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39714, 27)

	-- Solid Empyrean Sapphire -- 39715
	AddRecipe(39715, 375, 32200, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39715, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39715, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39715, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Sparkling Empyrean Sapphire -- 39716
	AddRecipe(39716, 375, 32201, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39716, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39716, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39716, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Stormy Empyrean Sapphire -- 39718
	AddRecipe(39718, 375, 32203, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39718, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39718, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39718, 27)

	-- Smooth Lionseye -- 39720
	AddRecipe(39720, 375, 32205, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39720, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39720, FAC.SHATTEREDSUN, REP.FRIENDLY, 25950, 27666)
	self:AddRecipeRepVendor(39720, FAC.SCALE_OF_SANDS, REP.FRIENDLY, 23437)

	-- Rigid Empyrean Sapphire -- 39721
	AddRecipe(39721, 375, 32206, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39721, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39721, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	self:AddRecipeRepVendor(39721, FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Mystic Lionseye -- 39724
	AddRecipe(39724, 375, 32209, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39724, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39724, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39724, 27)

	-- Sovereign Shadowsong Amethyst -- 39727
	AddRecipe(39727, 375, 32211, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39727, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39727, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39727, 27)

	-- Shifting Shadowsong Amethyst -- 39728
	AddRecipe(39728, 375, 32212, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39728, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39728, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39728, 27)

	-- Timeless Shadowsong Amethyst -- 39731
	AddRecipe(39731, 375, 32215, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39731, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39731, FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	self:AddRecipeRepVendor(39731, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Inscribed Pyrestone -- 39733
	AddRecipe(39733, 375, 32217, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39733, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39733, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39733, 27)

	-- Potent Pyrestone -- 39734
	AddRecipe(39734, 375, 32218, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39734, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39734, FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	self:AddRecipeRepVendor(39734, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Glinting Shadowsong Amethyst -- 39736
	AddRecipe(39736, 375, 32220, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39736, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39736, FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	self:AddRecipeRepVendor(39736, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Veiled Shadowsong Amethyst -- 39737
	AddRecipe(39737, 375, 32221, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39737, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RAID, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39737, FAC.SHATTEREDSUN, REP.EXALTED, 27666, 25950)
	self:AddRecipeCustom(39737, 27)

	-- Deadly Pyrestone -- 39738
	AddRecipe(39738, 375, 32222, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39738, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39738, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	self:AddRecipeRepVendor(39738, FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Regal Seaspray Emerald -- 39739
	AddRecipe(39739, 375, 32223, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39739, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39739, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666)
	self:AddRecipeRepVendor(39739, FAC.SCALE_OF_SANDS, REP.REVERED, 23437)

	-- Radiant Seaspray Emerald -- 39740
	AddRecipe(39740, 375, 32224, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39740, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39740, FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	self:AddRecipeRepVendor(39740, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Purified Shadowsong Amethyst -- 39741
	AddRecipe(39741, 375, 32225, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39741, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39741, FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	self:AddRecipeRepVendor(39741, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Jagged Seaspray Emerald -- 39742
	AddRecipe(39742, 375, 32226, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(39742, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(39742, FAC.SHATTEREDSUN, REP.HONORED, 25950, 27666)
	self:AddRecipeRepVendor(39742, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Relentless Earthstorm Diamond -- 39961
	AddRecipe(39961, 365, 32409, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(39961, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(39961, FAC.CONSORTIUM, REP.EXALTED, 20242, 23007)

	-- Thundering Skyfire Diamond -- 39963
	AddRecipe(39963, 365, 32410, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(39963, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(39963, "Outland")

	-- Necklace of the Deep -- 40514
	AddRecipe(40514, 340, 32508, Q.COMMON, V.TBC, 340, 340, 355, 370)
	self:AddRecipeFlags(40514, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(40514, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Brilliant Pearl Band -- 41414
	AddRecipe(41414, 325, 32772, Q.COMMON, V.TBC, 325, 335, 345, 355)
	self:AddRecipeFlags(41414, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(41414, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- The Black Pearl -- 41415
	AddRecipe(41415, 330, 32774, Q.COMMON, V.TBC, 330, 340, 350, 360)
	self:AddRecipeFlags(41415, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(41415, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Crown of the Sea Witch -- 41418
	AddRecipe(41418, 365, 32776, Q.COMMON, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(41418, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.CLOTH)
	self:AddRecipeTrainer(41418, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Purified Jaggal Pearl -- 41420
	AddRecipe(41420, 325, 32833, Q.COMMON, V.TBC, 325, 325, 332, 340)
	self:AddRecipeFlags(41420, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(41420, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Purified Shadow Pearl -- 41429
	AddRecipe(41429, 350, 32836, Q.COMMON, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(41429, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(41429, 33614, 26982, 18751, 26960, 19539, 19063, 28701, 33590, 33680, 26915, 18774, 26997)

	-- Don Julio's Heart -- 42558
	AddRecipe(42558, 360, 33133, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42558, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(42558, FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Kailee's Rose -- 42588
	AddRecipe(42588, 360, 33134, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42588, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATAR)
	self:AddRecipeRepVendor(42588, FAC.SHATAR, REP.HONORED, 21432)

	-- Crimson Sun -- 42589
	AddRecipe(42589, 360, 33131, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42589, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.CONSORTIUM)
	self:AddRecipeRepVendor(42589, FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Falling Star -- 42590
	AddRecipe(42590, 360, 33135, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42590, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.LOWERCITY)
	self:AddRecipeRepVendor(42590, FAC.LOWERCITY, REP.REVERED, 21655)

	-- Stone of Blades -- 42591
	AddRecipe(42591, 360, 33143, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42591, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.KOT)
	self:AddRecipeRepVendor(42591, FAC.KEEPERS_OF_TIME, REP.REVERED, 21643)

	-- Blood of Amber -- 42592
	AddRecipe(42592, 360, 33140, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42592, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATAR)
	self:AddRecipeRepVendor(42592, FAC.SHATAR, REP.REVERED, 21432)

	-- Facet of Eternity -- 42593
	AddRecipe(42593, 360, 33144, Q.COMMON, V.TBC, 360, 365, 370, 375)
	self:AddRecipeFlags(42593, F.VENDOR, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE, F.KOT)
	self:AddRecipeRepVendor(42593, FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Steady Talasite -- 43493
	AddRecipe(43493, 350, 33782, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(43493, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(43493, 18821, 18822)

	-- Chaotic Skyfire Diamond -- 44794
	AddRecipe(44794, 365, 34220, Q.RARE, V.TBC, 365, 375, 377, 380)
	self:AddRecipeFlags(44794, F.MOB_DROP, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(44794, 19768)

	-- Loop of Forged Power -- 46122
	AddRecipe(46122, 365, 34362, Q.EPIC, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(46122, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RAID, F.RING)
	self:AddRecipeCustom(46122, 24)

	-- Ring of Flowing Life -- 46123
	AddRecipe(46123, 365, 34363, Q.EPIC, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(46123, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RAID, F.RING)
	self:AddRecipeCustom(46123, 24)

	-- Hard Khorium Band -- 46124
	AddRecipe(46124, 365, 34361, Q.EPIC, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(46124, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RAID, F.RING)
	self:AddRecipeCustom(46124, 24)

	-- Pendant of Sunfire -- 46125
	AddRecipe(46125, 365, 34359, Q.EPIC, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(46125, F.RBOE, F.CASTER, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.RAID, F.NECK)
	self:AddRecipeCustom(46125, 24)

	-- Amulet of Flowing Life -- 46126
	AddRecipe(46126, 365, 34360, Q.EPIC, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(46126, F.CASTER, F.RBOE, F.IBOP, F.HEALER, F.ALLIANCE, F.HORDE, F.RAID, F.NECK)
	self:AddRecipeCustom(46126, 24)

	-- Hard Khorium Choker -- 46127
	AddRecipe(46127, 365, 34358, Q.EPIC, V.TBC, 365, 375, 380, 385)
	self:AddRecipeFlags(46127, F.RBOE, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.RAID, F.NECK)
	self:AddRecipeCustom(46127, 24)

	-- Quick Dawnstone -- 46403
	AddRecipe(46403, 350, 35315, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(46403, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(46403, FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Forceful Talasite -- 46405
	AddRecipe(46405, 350, 35318, Q.RARE, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(46405, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(46405, FAC.SHATTEREDSUN, REP.EXALTED, 25950, 27666)

	-- Eternal Earthstorm Diamond -- 46597
	AddRecipe(46597, 370, 35501, Q.COMMON, V.TBC, 370, 375, 377, 380)
	self:AddRecipeFlags(46597, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(46597, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Ember Skyfire Diamond -- 46601
	AddRecipe(46601, 370, 35503, Q.COMMON, V.TBC, 370, 375, 377, 380)
	self:AddRecipeFlags(46601, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(46601, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Empyrean Tortoise -- 46775
	AddRecipe(46775, 375, 35693, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(46775, F.VENDOR, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATTEREDSUN, F.TRINKET)
	self:AddRecipeRepVendor(46775, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Khorium Boar -- 46776
	AddRecipe(46776, 375, 35694, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(46776, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATTEREDSUN, F.TRINKET)
	self:AddRecipeRepVendor(46776, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Crimson Serpent -- 46777
	AddRecipe(46777, 375, 35700, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(46777, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATTEREDSUN, F.TRINKET)
	self:AddRecipeRepVendor(46777, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Shadowsong Panther -- 46778
	AddRecipe(46778, 375, 35702, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(46778, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATTEREDSUN, F.TRINKET)
	self:AddRecipeRepVendor(46778, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Figurine - Seaspray Albatross -- 46779
	AddRecipe(46779, 375, 35703, Q.COMMON, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(46779, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.SHATTEREDSUN, F.TRINKET)
	self:AddRecipeRepVendor(46779, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Regal Talasite -- 46803
	AddRecipe(46803, 350, 35707, Q.COMMON, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(46803, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(46803, FAC.SHATTEREDSUN, REP.REVERED, 25032)

	-- Forceful Seaspray Emerald -- 47053
	AddRecipe(47053, 375, 35759, Q.EPIC, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(47053, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(47053, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666, 25032)
	self:AddRecipeRepVendor(47053, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Steady Seaspray Emerald -- 47054
	AddRecipe(47054, 375, 35758, Q.EPIC, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(47054, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(47054, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)
	self:AddRecipeRepVendor(47054, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666, 25032)

	-- Reckless Pyrestone -- 47055
	AddRecipe(47055, 375, 35760, Q.EPIC, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(47055, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(47055, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666, 25032)
	self:AddRecipeRepVendor(47055, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Quick Lionseye -- 47056
	AddRecipe(47056, 375, 35761, Q.EPIC, V.TBC, 375, 375, 380, 385)
	self:AddRecipeFlags(47056, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.SCALE_SANDS, F.SHATTEREDSUN)
	self:AddRecipeRepVendor(47056, FAC.SHATTEREDSUN, REP.REVERED, 25950, 27666, 25032)
	self:AddRecipeRepVendor(47056, FAC.SCALE_OF_SANDS, REP.HONORED, 23437)

	-- Brilliant Glass -- 47280
	AddRecipe(47280, 350, 35945, Q.COMMON, V.TBC, 350, 350, 365, 380)
	self:AddRecipeFlags(47280, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(47280, 33614, 26997, 18751, 26915, 19539, 19063, 28701, 26960, 33590, 33680, 18774, 26982)

	-- Bold Scarlet Ruby -- 53830
	AddRecipe(53830, 390, 39996, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53830, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53830, 28721, 33602)

	-- Bold Bloodstone -- 53831
	AddRecipe(53831, 350, 39900, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53831, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53831, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Delicate Bloodstone -- 53832
	AddRecipe(53832, 350, 39905, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53832, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53832, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Subtle Sun Crystal -- 53843
	AddRecipe(53843, 360, 39907, Q.COMMON, V.WOTLK, 360, 375, 395, 415)
	self:AddRecipeFlags(53843, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53843, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Flashing Bloodstone -- 53844
	AddRecipe(53844, 350, 39908, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53844, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53844, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Smooth Sun Crystal -- 53845
	AddRecipe(53845, 350, 39909, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53845, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53845, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Brilliant Bloodstone -- 53852
	AddRecipe(53852, 350, 39912, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53852, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53852, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Rigid Chalcedony -- 53854
	AddRecipe(53854, 350, 39915, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53854, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53854, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Quick Sun Crystal -- 53856
	AddRecipe(53856, 350, 39918, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53856, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53856, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Mystic Sun Crystal -- 53857
	AddRecipe(53857, 350, 39917, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53857, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53857, 34079, 34039)

	-- Sovereign Shadow Crystal -- 53859
	AddRecipe(53859, 350, 39934, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53859, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53859, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Shifting Shadow Crystal -- 53860
	AddRecipe(53860, 350, 39935, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53860, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53860, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Glinting Shadow Crystal -- 53861
	AddRecipe(53861, 350, 39942, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53861, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53861, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Mysterious Shadow Crystal -- 53865
	AddRecipe(53865, 350, 39945, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53865, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53865, 34079, 34039)

	-- Defender's Shadow Crystal -- 53869
	AddRecipe(53869, 350, 39939, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53869, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.KALUAK)
	self:AddRecipeRepVendor(53869, FAC.KALUAK, REP.HONORED, 31916, 32763)

	-- Jagged Dark Jade -- 53870
	AddRecipe(53870, 350, 39933, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53870, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53870, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Guardian's Shadow Crystal -- 53871
	AddRecipe(53871, 350, 39940, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53871, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53871, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Inscribed Huge Citrine -- 53872
	AddRecipe(53872, 350, 39947, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53872, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53872, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Etched Shadow Crystal -- 53873
	AddRecipe(53873, 350, 39948, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53873, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53873, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Champion's Huge Citrine -- 53874
	AddRecipe(53874, 350, 39949, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53874, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53874, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Resplendent Huge Citrine -- 53875
	AddRecipe(53875, 350, 39950, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53875, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53875, 34079, 34039)

	-- Fierce Huge Citrine -- 53876
	AddRecipe(53876, 350, 39951, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53876, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53876, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Deadly Huge Citrine -- 53877
	AddRecipe(53877, 350, 39952, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53877, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.EBONBLADE)
	self:AddRecipeRepVendor(53877, FAC.EBONBLADE, REP.FRIENDLY, 32538)

	-- Lucent Huge Citrine -- 53879
	AddRecipe(53879, 350, 39954, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53879, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53879, 34079, 34039)

	-- Deft Huge Citrine -- 53880
	AddRecipe(53880, 350, 39955, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53880, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53880, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Potent Huge Citrine -- 53882
	AddRecipe(53882, 350, 39956, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53882, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53882, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Veiled Shadow Crystal -- 53883
	AddRecipe(53883, 350, 39957, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53883, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53883, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Willful Huge Citrine -- 53884
	AddRecipe(53884, 350, 39958, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53884, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53884, 34079, 34039)

	-- Reckless Huge Citrine -- 53885
	AddRecipe(53885, 350, 39959, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53885, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.FRENZYHEART)
	self:AddRecipeRepVendor(53885, FAC.FRENZYHEART, REP.FRIENDLY, 31911)

	-- Stalwart Huge Citrine -- 53891
	AddRecipe(53891, 360, 39965, Q.COMMON, V.WOTLK, 360, 375, 395, 415)
	self:AddRecipeFlags(53891, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53891, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Accurate Shadow Crystal -- 53892
	AddRecipe(53892, 350, 39966, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53892, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53892, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Resolute Huge Citrine -- 53893
	AddRecipe(53893, 350, 39967, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53893, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53893, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Timeless Shadow Crystal -- 53894
	AddRecipe(53894, 350, 39968, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53894, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53894, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Nimble Dark Jade -- 53917
	AddRecipe(53917, 350, 39975, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53917, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.ORACLES)
	self:AddRecipeRepVendor(53917, FAC.ORACLES, REP.FRIENDLY, 31910)

	-- Regal Dark Jade -- 53918
	AddRecipe(53918, 350, 39976, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53918, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53918, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Steady Dark Jade -- 53919
	AddRecipe(53919, 350, 39977, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53919, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53919, 34079, 34039)

	-- Forceful Dark Jade -- 53920
	AddRecipe(53920, 350, 39978, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53920, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53920, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Purified Shadow Crystal -- 53921
	AddRecipe(53921, 350, 39979, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53921, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.KALUAK)
	self:AddRecipeRepVendor(53921, FAC.KALUAK, REP.FRIENDLY, 31916, 32763)

	-- Misty Dark Jade -- 53922
	AddRecipe(53922, 350, 39980, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53922, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53922, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Lightning Dark Jade -- 53923
	AddRecipe(53923, 350, 39981, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53923, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53923, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Turbid Dark Jade -- 53924
	AddRecipe(53924, 350, 39982, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53924, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53924, 34079, 34039)

	-- Energized Dark Jade -- 53925
	AddRecipe(53925, 350, 39983, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53925, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53925, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Radiant Dark Jade -- 53932
	AddRecipe(53932, 350, 39991, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53932, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53932, 34079, 34039)

	-- Shattered Dark Jade -- 53933
	AddRecipe(53933, 350, 39992, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53933, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53933, 34079, 34039)

	-- Solid Chalcedony -- 53934
	AddRecipe(53934, 350, 39919, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53934, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53934, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Sparkling Chalcedony -- 53941
	AddRecipe(53941, 350, 39927, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53941, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(53941, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Stormy Chalcedony -- 53943
	AddRecipe(53943, 350, 39927, Q.UNCOMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(53943, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53943, 34079, 34039)

	-- Delicate Scarlet Ruby -- 53945
	AddRecipe(53945, 390, 39997, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53945, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53945, 28721, 33602)

	-- Brilliant Scarlet Ruby -- 53946
	AddRecipe(53946, 390, 39998, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53946, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.KIRINTOR)
	self:AddRecipeRepVendor(53946, FAC.KIRINTOR, REP.EXALTED, 32287)

	-- Subtle Autumn's Glow -- 53948
	AddRecipe(53948, 390, 40000, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53948, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53948, 28721, 33602)

	-- Flashing Scarlet Ruby -- 53949
	AddRecipe(53949, 390, 40001, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53949, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53949, 28721, 33602)

	-- Precise Scarlet Ruby -- 53951
	AddRecipe(53951, 390, 40003, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53951, F.MOB_DROP, F.INSTANCE, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(53951, 29311)

	-- Solid Sky Sapphire -- 53952
	AddRecipe(53952, 390, 40008, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53952, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53952, 28721, 33602)

	-- Sparkling Sky Sapphire -- 53954
	AddRecipe(53954, 390, 40010, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53954, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53954, 28721, 33602)

	-- Stormy Sky Sapphire -- 53955
	AddRecipe(53955, 390, 40011, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53955, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53955, 32294, 30489, 32296)

	-- Smooth Autumn's Glow -- 53957
	AddRecipe(53957, 390, 40013, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53957, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.HODIR)
	self:AddRecipeRepVendor(53957, FAC.HODIR, REP.EXALTED, 32540)

	-- Rigid Sky Sapphire -- 53958
	AddRecipe(53958, 390, 40014, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53958, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53958, 28721, 33602)

	-- Mystic Autumn's Glow -- 53960
	AddRecipe(53960, 390, 40016, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53960, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53960, 32294, 30489, 32296)

	-- Quick Autumn's Glow -- 53961
	AddRecipe(53961, 390, 40017, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53961, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53961, 28721, 33602)

	-- Sovereign Twilight Opal -- 53962
	AddRecipe(53962, 390, 40022, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53962, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(53962, "Northrend")

	-- Shifting Twilight Opal -- 53963
	AddRecipe(53963, 390, 40023, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53963, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53963, 28721, 33602)

	-- Timeless Twilight Opal -- 53965
	AddRecipe(53965, 390, 40025, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53965, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.EBONBLADE)
	self:AddRecipeRepVendor(53965, FAC.EBONBLADE, REP.EXALTED, 32538)

	-- Purified Twilight Opal -- 53966
	AddRecipe(53966, 390, 40026, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53966, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(53966, "Northrend")

	-- Mysterious Twilight Opal -- 53968
	AddRecipe(53968, 390, 40028, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53968, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53968, 32294, 30489, 32296)

	-- Defender's Twilight Opal -- 53972
	AddRecipe(53972, 390, 40032, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53972, F.MOB_DROP, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(53972, 29376, 29370, 30208, 30222)

	-- Guardian's Twilight Opal -- 53974
	AddRecipe(53974, 390, 40034, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53974, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.ARGENTCRUSADE)
	self:AddRecipeRepVendor(53974, FAC.ARGENTCRUSADE, REP.REVERED, 30431)

	-- Inscribed Monarch Topaz -- 53975
	AddRecipe(53975, 390, 40037, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53975, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(53975, "Northrend")

	-- Etched Twilight Opal -- 53976
	AddRecipe(53976, 390, 40038, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53976, F.RBOE, F.WORLD_DROP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(53976, "Northrend")

	-- Champion's Monarch Topaz -- 53977
	AddRecipe(53977, 390, 40039, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53977, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(53977, "Northrend")

	-- Resplendent Monarch Topaz -- 53978
	AddRecipe(53978, 390, 40040, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53978, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53978, 32294, 30489, 32296)

	-- Glinting Twilight Opal -- 53980
	AddRecipe(53980, 390, 40044, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53980, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53980, 28721, 33602)

	-- Lucent Monarch Topaz -- 53981
	AddRecipe(53981, 390, 40045, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53981, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53981, 32294, 30489, 32296)

	-- Potent Monarch Topaz -- 53984
	AddRecipe(53984, 390, 40048, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53984, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53984, 28721, 33602)

	-- Veiled Twilight Opal -- 53985
	AddRecipe(53985, 390, 40049, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53985, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53985, 28721, 33602)

	-- Willful Monarch Topaz -- 53986
	AddRecipe(53986, 390, 40050, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53986, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53986, 32294, 30489, 32296)

	-- Reckless Monarch Topaz -- 53987
	AddRecipe(53987, 390, 40051, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53987, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53987, 28721, 33602)

	-- Deadly Monarch Topaz -- 53988
	AddRecipe(53988, 390, 40052, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53988, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.EBONBLADE)
	self:AddRecipeRepVendor(53988, FAC.EBONBLADE, REP.REVERED, 32538)

	-- Deft Monarch Topaz -- 53991
	AddRecipe(53991, 390, 40055, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53991, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53991, 28721, 33602)

	-- Stalwart Monarch Topaz -- 53993
	AddRecipe(53993, 390, 40057, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53993, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.WYRMREST)
	self:AddRecipeRepVendor(53993, FAC.WYRMREST, REP.EXALTED, 32533)

	-- Accurate Twilight Opal -- 53994
	AddRecipe(53994, 390, 40058, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53994, F.MOB_DROP, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(53994, 28379, 29402, 28851, 30448, 30260)

	-- Jagged Forest Emerald -- 53996
	AddRecipe(53996, 390, 40086, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53996, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.FRENZYHEART)
	self:AddRecipeRepVendor(53996, FAC.FRENZYHEART, REP.REVERED, 31911)

	-- Nimble Forest Emerald -- 53997
	AddRecipe(53997, 390, 40088, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53997, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53997, 28721, 33602)

	-- Regal Forest Emerald -- 53998
	AddRecipe(53998, 390, 40089, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(53998, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(53998, 28721, 33602)

	-- Steady Forest Emerald -- 54000
	AddRecipe(54000, 390, 40090, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54000, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(54000, 32294, 30489, 32296)

	-- Forceful Forest Emerald -- 54001
	AddRecipe(54001, 390, 40091, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54001, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(54001, 28721, 33602)

	-- Misty Forest Emerald -- 54003
	AddRecipe(54003, 390, 40095, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54003, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(54003, "Northrend")

	-- Turbid Forest Emerald -- 54005
	AddRecipe(54005, 390, 40102, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54005, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(54005, 32294, 30489, 32296)

	-- Lightning Forest Emerald -- 54009
	AddRecipe(54009, 390, 40100, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54009, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(54009, 28721, 33602)

	-- Energized Forest Emerald -- 54011
	AddRecipe(54011, 390, 40105, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54011, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(54011, 28721, 33602)

	-- Radiant Forest Emerald -- 54012
	AddRecipe(54012, 390, 40098, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54012, F.MOB_DROP, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(54012, 29792, 29793)

	-- Shattered Forest Emerald -- 54014
	AddRecipe(54014, 390, 40106, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54014, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(54014, 32294, 30489, 32296)

	-- Precise Bloodstone -- 54017
	AddRecipe(54017, 350, 39910, Q.COMMON, V.WOTLK, 350, 375, 395, 415)
	self:AddRecipeFlags(54017, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(54017, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Fierce Monarch Topaz -- 54019
	AddRecipe(54019, 390, 40041, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54019, F.MOB_DROP, F.INSTANCE, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(54019, 23954)

	-- Resolute Monarch Topaz -- 54023
	AddRecipe(54023, 390, 40059, Q.RARE, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(54023, F.RBOE, F.WORLD_DROP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(54023, "Northrend")

	-- Shielded Skyflare Diamond -- 55384
	AddRecipe(55384, 420, 41377, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55384, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55384, 28721, 33602)

	-- Tireless Skyflare Diamond -- 55386
	AddRecipe(55386, 420, 41375, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55386, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(55386, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Forlorn Skyflare Diamond -- 55387
	AddRecipe(55387, 420, 41378, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55387, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.PVP, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55387, 32294, 30489, 32296)

	-- Impassive Skyflare Diamond -- 55388
	AddRecipe(55388, 420, 41379, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55388, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55388, 32294, 30489, 32296)

	-- Chaotic Skyflare Diamond -- 55389
	AddRecipe(55389, 420, 41285, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55389, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55389, 28721, 33602)

	-- Destructive Skyflare Diamond -- 55390
	AddRecipe(55390, 420, 41307, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55390, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(55390, "Northrend")

	-- Ember Skyflare Diamond -- 55392
	AddRecipe(55392, 420, 41333, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55392, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55392, 28721, 33602)

	-- Enigmatic Skyflare Diamond -- 55393
	AddRecipe(55393, 420, 41335, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55393, F.VENDOR, F.RBOP, F.IBOE, F.PVP, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55393, 32294, 30489, 32296)

	-- Swift Skyflare Diamond -- 55394
	AddRecipe(55394, 420, 41339, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55394, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(55394, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Thundering Skyflare Diamond -- 55395
	AddRecipe(55395, 420, 41400, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55395, F.RBOE, F.WORLD_DROP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(55395, "Northrend")

	-- Insightful Earthsiege Diamond -- 55396
	AddRecipe(55396, 420, 41401, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55396, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55396, 28721, 33602)

	-- Bracing Earthsiege Diamond -- 55397
	AddRecipe(55397, 420, 41395, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55397, F.MOB_DROP, F.INSTANCE, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(55397, 27656)

	-- Eternal Earthsiege Diamond -- 55398
	AddRecipe(55398, 420, 41396, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55398, F.MOB_DROP, F.INSTANCE, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(55398, 28923)

	-- Powerful Earthsiege Diamond -- 55399
	AddRecipe(55399, 420, 41397, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55399, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(55399, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Relentless Earthsiege Diamond -- 55400
	AddRecipe(55400, 420, 41398, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55400, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55400, 28721, 33602)

	-- Austere Earthsiege Diamond -- 55401
	AddRecipe(55401, 420, 41380, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55401, F.MOB_DROP, F.INSTANCE, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeMobDrop(55401, 26861)

	-- Persistent Earthsiege Diamond -- 55402
	AddRecipe(55402, 420, 41381, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55402, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(55402, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Trenchant Earthsiege Diamond -- 55403
	AddRecipe(55403, 420, 41382, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55403, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55403, 28721, 33602)

	-- Invigorating Earthsiege Diamond -- 55404
	AddRecipe(55404, 420, 41385, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55404, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55404, 28721, 33602)

	-- Beaming Earthsiege Diamond -- 55405
	AddRecipe(55405, 420, 41389, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55405, F.RBOE, F.CASTER, F.WORLD_DROP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(55405, "Northrend")

	-- Revitalizing Skyflare Diamond -- 55407
	AddRecipe(55407, 420, 41376, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(55407, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(55407, 28721, 33602)

	-- Bold Dragon's Eye -- 56049
	AddRecipe(56049, 370, 42142, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56049, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56049, 28721, 33602)

	-- Delicate Dragon's Eye -- 56052
	AddRecipe(56052, 370, 42143, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56052, F.VENDOR, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56052, 28721, 33602)

	-- Brilliant Dragon's Eye -- 56053
	AddRecipe(56053, 370, 42144, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56053, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56053, 28721, 33602)

	-- Subtle Dragon's Eye -- 56055
	AddRecipe(56055, 370, 42151, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56055, F.VENDOR, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56055, 28721, 33602)

	-- Flashing Dragon's Eye -- 56056
	AddRecipe(56056, 370, 42152, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56056, F.VENDOR, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56056, 28721, 33602)

	-- Mystic Dragon's Eye -- 56079
	AddRecipe(56079, 370, 42158, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56079, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56079, 28721, 33602)

	-- Precise Dragon's Eye -- 56081
	AddRecipe(56081, 370, 42154, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56081, F.VENDOR, F.RBOP, F.TANK, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56081, 28721, 33602)

	-- Quick Dragon's Eye -- 56083
	AddRecipe(56083, 370, 42150, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56083, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56083, 28721, 33602)

	-- Rigid Dragon's Eye -- 56084
	AddRecipe(56084, 370, 42156, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56084, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56084, 28721, 33602)

	-- Smooth Dragon's Eye -- 56085
	AddRecipe(56085, 370, 42149, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56085, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56085, 28721, 33602)

	-- Solid Dragon's Eye -- 56086
	AddRecipe(56086, 370, 36767, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56086, F.VENDOR, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56086, 28721, 33602)

	-- Sparkling Dragon's Eye -- 56087
	AddRecipe(56087, 370, 42145, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56087, F.VENDOR, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56087, 28721, 33602)

	-- Stormy Dragon's Eye -- 56088
	AddRecipe(56088, 370, 42155, Q.RARE, V.WOTLK, 370, 390, 415, 440)
	self:AddRecipeFlags(56088, F.VENDOR, F.CASTER, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE)
	self:AddRecipeVendor(56088, 28721, 33602)

	-- Bloodstone Band -- 56193
	AddRecipe(56193, 350, 42336, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	self:AddRecipeFlags(56193, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(56193, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Sun Rock Ring -- 56194
	AddRecipe(56194, 350, 42337, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	self:AddRecipeFlags(56194, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(56194, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Jade Dagger Pendant -- 56195
	AddRecipe(56195, 380, 42338, Q.COMMON, V.WOTLK, 380, 400, 410, 420)
	self:AddRecipeFlags(56195, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(56195, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Blood Sun Necklace -- 56196
	AddRecipe(56196, 380, 42339, Q.COMMON, V.WOTLK, 380, 400, 410, 420)
	self:AddRecipeFlags(56196, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(56196, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Dream Signet -- 56197
	AddRecipe(56197, 420, 42340, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(56197, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(56197, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Figurine - Ruby Hare -- 56199
	AddRecipe(56199, 400, 42341, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	self:AddRecipeFlags(56199, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.TRINKET)
	self:AddRecipeTrainer(56199, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Figurine - Twilight Serpent -- 56201
	AddRecipe(56201, 400, 42395, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	self:AddRecipeFlags(56201, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.TRINKET)
	self:AddRecipeTrainer(56201, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Figurine - Sapphire Owl -- 56202
	AddRecipe(56202, 400, 42413, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	self:AddRecipeFlags(56202, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.TRINKET)
	self:AddRecipeTrainer(56202, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Figurine - Emerald Boar -- 56203
	AddRecipe(56203, 400, 42418, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	self:AddRecipeFlags(56203, F.RBOP, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.TRINKET)
	self:AddRecipeTrainer(56203, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Dark Jade Focusing Lens -- 56205
	AddRecipe(56205, 350, 41367, Q.COMMON, V.WOTLK, 350, 360, 370, 380)
	self:AddRecipeFlags(56205, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(56205, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Shadow Crystal Focusing Lens -- 56206
	AddRecipe(56206, 360, 42420, Q.COMMON, V.WOTLK, 360, 370, 380, 390)
	self:AddRecipeFlags(56206, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(56206, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Shadow Jade Focusing Lens -- 56208
	AddRecipe(56208, 370, 42421, Q.COMMON, V.WOTLK, 370, 380, 390, 400)
	self:AddRecipeFlags(56208, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(56208, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Titanium Impact Band -- 56496
	AddRecipe(56496, 430, 42642, Q.EPIC, V.WOTLK, 430, 450, 455, 460)
	self:AddRecipeFlags(56496, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(56496, 28721, 33602)

	-- Titanium Earthguard Ring -- 56497
	AddRecipe(56497, 430, 42643, Q.EPIC, V.WOTLK, 430, 450, 455, 460)
	self:AddRecipeFlags(56497, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(56497, 28721, 33602)

	-- Titanium Spellshock Ring -- 56498
	AddRecipe(56498, 430, 42644, Q.EPIC, V.WOTLK, 430, 450, 455, 460)
	self:AddRecipeFlags(56498, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(56498, 28721, 33602)

	-- Titanium Impact Choker -- 56499
	AddRecipe(56499, 440, 42645, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	self:AddRecipeFlags(56499, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeVendor(56499, 28721, 33602)

	-- Titanium Earthguard Chain -- 56500
	AddRecipe(56500, 440, 42646, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	self:AddRecipeFlags(56500, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeVendor(56500, 28721, 33602)

	-- Titanium Spellshock Necklace -- 56501
	AddRecipe(56501, 440, 42647, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	self:AddRecipeFlags(56501, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.NECK)
	self:AddRecipeVendor(56501, 28721, 33602)

	-- Enchanted Pearl -- 56530
	AddRecipe(56530, 360, 42701, Q.COMMON, V.WOTLK, 360, 380, 400, 420)
	self:AddRecipeFlags(56530, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(56530, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Enchanted Tear -- 56531
	AddRecipe(56531, 390, 42702, Q.COMMON, V.WOTLK, 390, 410, 425, 440)
	self:AddRecipeFlags(56531, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(56531, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Crystal Citrine Necklace -- 58141
	AddRecipe(58141, 350, 43244, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	self:AddRecipeFlags(58141, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(58141, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Crystal Chalcedony Amulet -- 58142
	AddRecipe(58142, 350, 43245, Q.COMMON, V.WOTLK, 350, 380, 400, 420)
	self:AddRecipeFlags(58142, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(58142, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Earthshadow Ring -- 58143
	AddRecipe(58143, 370, 43246, Q.COMMON, V.WOTLK, 370, 390, 405, 420)
	self:AddRecipeFlags(58143, F.CASTER, F.RBOP, F.HEALER, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(58143, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Jade Ring of Slaying -- 58144
	AddRecipe(58144, 370, 43247, Q.COMMON, V.WOTLK, 370, 390, 405, 420)
	self:AddRecipeFlags(58144, F.RBOP, F.TANK, F.DPS, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(58144, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Stoneguard Band -- 58145
	AddRecipe(58145, 390, 43248, Q.COMMON, V.WOTLK, 390, 410, 420, 430)
	self:AddRecipeFlags(58145, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(58145, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Shadowmight Ring -- 58146
	AddRecipe(58146, 390, 43249, Q.COMMON, V.WOTLK, 390, 410, 420, 430)
	self:AddRecipeFlags(58146, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(58146, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Ring of Earthen Might -- 58147
	AddRecipe(58147, 420, 43250, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58147, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58147, 28721, 33602)

	-- Ring of Scarlet Shadows -- 58148
	AddRecipe(58148, 420, 43251, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58148, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58148, 28721, 33602)

	-- Windfire Band -- 58149
	AddRecipe(58149, 420, 43252, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58149, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58149, 28721, 33602)

	-- Ring of Northern Tears -- 58150
	AddRecipe(58150, 420, 43253, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58150, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58150, 28721, 33602)

	-- Savage Titanium Ring -- 58492
	AddRecipe(58492, 420, 43482, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58492, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58492, 28721, 33602)

	-- Savage Titanium Band -- 58507
	AddRecipe(58507, 420, 43498, Q.RARE, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58507, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58507, 28721, 33602)

	-- Titanium Frostguard Ring -- 58954
	AddRecipe(58954, 420, 43582, Q.EPIC, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(58954, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.RING)
	self:AddRecipeVendor(58954, 28721, 33602)

	-- Figurine - Monarch Crab -- 59759
	AddRecipe(59759, 400, 44063, Q.COMMON, V.WOTLK, 400, 430, 440, 450)
	self:AddRecipeFlags(59759, F.RBOP, F.TANK, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER, F.TRINKET)
	self:AddRecipeTrainer(59759, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Icy Prism -- 62242
	AddRecipe(62242, 425, 44943, Q.COMMON, V.WOTLK, 425, 445, 457, 470)
	self:AddRecipeFlags(62242, F.RBOP, F.ALLIANCE, F.IBOP, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(62242, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Prismatic Black Diamond -- 62941
	AddRecipe(62941, 300, 45054, Q.COMMON, V.WOTLK, 300, 310, 315, 320)
	self:AddRecipeFlags(62941, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE, F.TRAINER)
	self:AddRecipeTrainer(62941, 33614, 26997, 18751, 26915, 18774, 19063, 28701, 26960, 33590, 33680, 19539, 26982)

	-- Amulet of Truesight -- 63743
	AddRecipe(63743, 200, 45627, Q.COMMON, V.WOTLK, 200, 210, 220, 230)
	self:AddRecipeFlags(63743, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(63743, 33614, 33590, 19778, 26997, 18751, 26960, 18774, 19063, 19775, 28701, 19539, 33680, 26915, 15501, 26982)

	-- Emerald Choker -- 64725
	AddRecipe(64725, 420, 45812, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(64725, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(64725, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Sky Sapphire Amulet -- 64726
	AddRecipe(64726, 420, 45813, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(64726, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.NECK)
	self:AddRecipeTrainer(64726, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Runed Mana Band -- 64727
	AddRecipe(64727, 420, 45808, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(64727, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(64727, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Scarlet Signet -- 64728
	AddRecipe(64728, 420, 45809, Q.COMMON, V.WOTLK, 420, 440, 450, 460)
	self:AddRecipeFlags(64728, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE, F.TRAINER, F.RING)
	self:AddRecipeTrainer(64728, 26915, 28701, 26960, 26982, 26997, 33590)

	-- Regal Eye of Zul -- 66338
	AddRecipe(66338, 450, 40167, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66338, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66338, 33680, 33637, 19065, 28701)

	-- Steady Eye of Zul -- 66428
	AddRecipe(66428, 450, 40168, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66428, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66428, 33680, 33637, 19065, 28701)

	-- Nimble Eye of Zul -- 66429
	AddRecipe(66429, 450, 40166, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66429, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66429, 33680, 33637, 19065, 28701)

	-- Jagged Eye of Zul -- 66431
	AddRecipe(66431, 450, 40165, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66431, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66431, 33680, 33637, 19065, 28701)

	-- Timeless Dreadstone -- 66432
	AddRecipe(66432, 450, 40164, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66432, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66432, 33680, 33637, 19065, 28701)

	-- Forceful Eye of Zul -- 66434
	AddRecipe(66434, 450, 40169, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66434, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66434, 33680, 33637, 19065, 28701)

	-- Misty Eye of Zul -- 66435
	AddRecipe(66435, 450, 40171, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66435, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66435, 33680, 33637, 19065, 28701)

	-- Lightning Eye of Zul -- 66439
	AddRecipe(66439, 450, 40177, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66439, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66439, 33680, 33637, 19065, 28701)

	-- Radiant Eye of Zul -- 66441
	AddRecipe(66441, 450, 40180, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66441, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66441, 33680, 33637, 19065, 28701)

	-- Energized Eye of Zul -- 66442
	AddRecipe(66442, 450, 40179, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66442, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66442, 33680, 33637, 19065, 28701)

	-- Shattered Eye of Zul -- 66443
	AddRecipe(66443, 450, 40182, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66443, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66443, 33680, 33637, 19065, 28701)

	-- Turbid Eye of Zul -- 66445
	AddRecipe(66445, 450, 40173, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66445, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66445, 33680, 33637, 19065, 28701)

	-- Brilliant Cardinal Ruby -- 66446
	AddRecipe(66446, 450, 40113, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66446, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66446, 33680, 33637, 19065, 28701)

	-- Bold Cardinal Ruby -- 66447
	AddRecipe(66447, 450, 40111, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66447, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66447, 33680, 33637, 19065, 28701)

	-- Delicate Cardinal Ruby -- 66448
	AddRecipe(66448, 450, 40112, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66448, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66448, 33680, 33637, 19065, 28701)

	-- Precise Cardinal Ruby -- 66450
	AddRecipe(66450, 450, 40118, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66450, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66450, 33680, 33637, 19065, 28701)

	-- Subtle King's Amber -- 66452
	AddRecipe(66452, 450, 40115, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66452, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66452, 33680, 33637, 19065, 28701)

	-- Flashing Cardinal Ruby -- 66453
	AddRecipe(66453, 450, 40116, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66453, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66453, 33680, 33637, 19065, 28701)

	-- Solid Majestic Zircon -- 66497
	AddRecipe(66497, 450, 40119, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66497, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66497, 33680, 33637, 19065, 28701)

	-- Sparkling Majestic Zircon -- 66498
	AddRecipe(66498, 450, 40120, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66498, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66498, 33680, 33637, 19065, 28701)

	-- Stormy Majestic Zircon -- 66499
	AddRecipe(66499, 450, 40122, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66499, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66499, 33680, 33637, 19065, 28701)

	-- Rigid Majestic Zircon -- 66501
	AddRecipe(66501, 450, 40125, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66501, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66501, 33680, 33637, 19065, 28701)

	-- Smooth King's Amber -- 66502
	AddRecipe(66502, 450, 40124, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66502, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66502, 33680, 33637, 19065, 28701)

	-- Mystic King's Amber -- 66505
	AddRecipe(66505, 450, 40127, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66505, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66505, 33680, 33637, 19065, 28701)

	-- Quick King's Amber -- 66506
	AddRecipe(66506, 450, 40128, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66506, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66506, 33680, 33637, 19065, 28701)

	-- Sovereign Dreadstone -- 66554
	AddRecipe(66554, 450, 40129, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66554, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66554, 33680, 33637, 19065, 28701)

	-- Purified Dreadstone -- 66556
	AddRecipe(66556, 450, 40133, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66556, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66556, 33680, 33637, 19065, 28701)

	-- Shifting Dreadstone -- 66557
	AddRecipe(66557, 450, 40130, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66557, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66557, 33680, 33637, 19065, 28701)

	-- Defender's Dreadstone -- 66560
	AddRecipe(66560, 450, 40139, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66560, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66560, 33680, 33637, 19065, 28701)

	-- Guardian's Dreadstone -- 66561
	AddRecipe(66561, 450, 40141, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66561, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66561, 33680, 33637, 19065, 28701)

	-- Mysterious Dreadstone -- 66562
	AddRecipe(66562, 450, 40135, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66562, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66562, 33680, 33637, 19065, 28701)

	-- Inscribed Ametrine -- 66567
	AddRecipe(66567, 450, 40142, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66567, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66567, 33680, 33637, 19065, 28701)

	-- Deadly Ametrine -- 66568
	AddRecipe(66568, 450, 40147, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66568, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66568, 33680, 33637, 19065, 28701)

	-- Potent Ametrine -- 66569
	AddRecipe(66569, 450, 40152, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66569, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66569, 33680, 33637, 19065, 28701)

	-- Veiled Dreadstone -- 66570
	AddRecipe(66570, 450, 40153, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66570, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66570, 33680, 33637, 19065, 28701)

	-- Willful Ametrine -- 66571
	AddRecipe(66571, 450, 40154, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66571, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66571, 33680, 33637, 19065, 28701)

	-- Etched Dreadstone -- 66572
	AddRecipe(66572, 450, 40143, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66572, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66572, 33680, 33637, 19065, 28701)

	-- Glinting Dreadstone -- 66573
	AddRecipe(66573, 450, 40157, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66573, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66573, 33680, 33637, 19065, 28701)

	-- Reckless Ametrine -- 66574
	AddRecipe(66574, 450, 40155, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66574, F.VENDOR, F.CASTER, F.RBOP, F.IBOE, F.HEALER, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66574, 33680, 33637, 19065, 28701)

	-- Accurate Dreadstone -- 66576
	AddRecipe(66576, 450, 40162, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66576, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66576, 33680, 33637, 19065, 28701)

	-- Champion's Ametrine -- 66579
	AddRecipe(66579, 450, 40144, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66579, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66579, 33680, 33637, 19065, 28701)

	-- Stalwart Ametrine -- 66581
	AddRecipe(66581, 450, 40160, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66581, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66581, 33680, 33637, 19065, 28701)

	-- Resplendent Ametrine -- 66582
	AddRecipe(66582, 450, 40145, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66582, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66582, 33680, 33637, 19065, 28701)

	-- Fierce Ametrine -- 66583
	AddRecipe(66583, 450, 40146, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66583, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66583, 33680, 33637, 19065, 28701)

	-- Deft Ametrine -- 66584
	AddRecipe(66584, 450, 40150, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66584, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66584, 33680, 33637, 19065, 28701)

	-- Lucent Ametrine -- 66585
	AddRecipe(66585, 450, 40149, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66585, F.VENDOR, F.RBOP, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66585, 33680, 33637, 19065, 28701)

	-- Resolute Ametrine -- 66586
	AddRecipe(66586, 450, 40163, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(66586, F.VENDOR, F.RBOP, F.TANK, F.IBOE, F.DPS, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(66586, 33680, 33637, 19065, 28701)

	-- Nightmare Tear -- 68253
	AddRecipe(68253, 450, 49110, Q.RARE, V.WOTLK, 450, 450, 452, 465)
	self:AddRecipeFlags(68253, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(68253, 33680, 33637, 19065, 28701)

	-- Jasper Ring -- 73494
	AddRecipe(73494, 425, 52306, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73494, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73494, 26997, 19778, 26982, 19063, 19775, 46675, 44582, 28701)

	-- Alicite Pendant -- 73496
	AddRecipe(73496, 435, 52307, Q.COMMON, V.CATA, 435, 450, 467, 485)
	self:AddRecipeFlags(73496, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73496, 26997, 19778, 26982, 19063, 19775, 46675, 44582, 28701)

	-- Jeweler's Ruby Monocle -- 73625
	AddRecipe(73625, 450, 52485, Q.RARE, V.CATA, 450, 480, 490, 500)
	self:AddRecipeFlags(73625, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73625, "Kalimdor", "Eastern Kingdoms")

	-- Hessonite Band -- 73495
	AddRecipe(73495, 450, 52308, Q.COMMON, V.CATA, 450, 485, 495, 505)
	self:AddRecipeFlags(73495, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73495, 26997, 19778, 26982, 19063, 19775, 46675, 44582, 28701)

	-- Jeweler's Sapphire Monocle -- 73626
	AddRecipe(73626, 455, 52486, Q.RARE, V.CATA, 455, 485, 495, 505)
	self:AddRecipeFlags(73626, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73626, "Kalimdor", "Eastern Kingdoms")

	-- Carnelian Spikes -- 73620
	AddRecipe(73620, 460, 52492, Q.COMMON, V.CATA, 460, 470, 475, 480)
	self:AddRecipeFlags(73620, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73620, 26997, 19778, 26982, 19063, 19775, 46675, 44582, 28701)

	-- Jeweler's Emerald Monocle -- 73627
	AddRecipe(73627, 460, 52487, Q.RARE, V.CATA, 460, 490, 500, 510)
	self:AddRecipeFlags(73627, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73627, "Kalimdor", "Eastern Kingdoms")

	-- Nightstone Choker -- 73497
	AddRecipe(73497, 460, 52309, Q.COMMON, V.CATA, 460, 495, 505, 515)
	self:AddRecipeFlags(73497, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73497, 26997, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 18774, 44582, 28701)

	-- Accurate Demonseye -- 73360
	AddRecipe(73360, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73360, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73360, 50480, 50482)

	-- Adept Ember Topaz -- 73371
	AddRecipe(73371, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73371, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73371, 50480, 50482)

	-- Artful Ember Topaz -- 73373
	AddRecipe(73373, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73373, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73373, 50480, 50482)

	-- Bold Inferno Ruby -- 73335
	AddRecipe(73335, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73335, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73335, 50480, 50482)

	-- Brilliant Inferno Ruby -- 73338
	AddRecipe(73338, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73338, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73338, 50480, 50482)

	-- Deadly Ember Topaz -- 73365
	AddRecipe(73365, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73365, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73365, 50480, 50482)

	-- Defender's Demonseye -- 73352
	AddRecipe(73352, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73352, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73352, 50480, 50482)

	-- Deft Ember Topaz -- 73368
	AddRecipe(73368, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73368, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73368, 50480, 50482)

	-- Delicate Inferno Ruby -- 73336
	AddRecipe(73336, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73336, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73336, 50480, 50482)

	-- Etched Demonseye -- 73356
	AddRecipe(73356, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73356, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73356, 50480, 50482)

	-- Fierce Ember Topaz -- 73367
	AddRecipe(73367, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73367, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73367, 50480, 50482)

	-- Fine Ember Topaz -- 73372
	AddRecipe(73372, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73372, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73372, 50480, 50482)

	-- Flashing Inferno Ruby -- 73337
	AddRecipe(73337, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73337, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73337, 50480, 50482)

	-- Forceful Dream Emerald -- 73380
	AddRecipe(73380, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73380, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73380, 50480, 50482)

	-- Fractured Amberjewel -- 73349
	AddRecipe(73349, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73349, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73349, 50480, 50482)

	-- Glinting Demonseye -- 73357
	AddRecipe(73357, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73357, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73357, 50480, 50482)

	-- Guardian's Demonseye -- 73354
	AddRecipe(73354, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73354, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73354, 50480, 50482)

	-- Inscribed Ember Topaz -- 73364
	AddRecipe(73364, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73364, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73364, 50480, 50482)

	-- Jagged Dream Emerald -- 73377
	AddRecipe(73377, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73377, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73377, 50480, 50482)

	-- Keen Ember Topaz -- 73374
	AddRecipe(73374, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73374, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73374, 50480, 50482)

	-- Lightning Dream Emerald -- 73381
	AddRecipe(73381, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73381, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73381, 50480, 50482)

	-- Lucent Ember Topaz -- 95755
	AddRecipe(95755, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(95755, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(95755, 50480, 50482)

	-- Mystic Amberjewel -- 73347
	AddRecipe(73347, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73347, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73347, 50480, 50482)

	-- Nimble Dream Emerald -- 73376
	AddRecipe(73376, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73376, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73376, 50480, 50482)

	-- Piercing Dream Emerald -- 73378
	AddRecipe(73378, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73378, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73378, 50480, 50482)

	-- Polished Ember Topaz -- 73361
	AddRecipe(73361, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73361, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73361, 50480, 50482)

	-- Potent Ember Topaz -- 73366
	AddRecipe(73366, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73366, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73366, 50480, 50482)

	-- Precise Inferno Ruby -- 73339
	AddRecipe(73339, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73339, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73339, 50480, 50482)

	-- Puissant Dream Emerald -- 73382
	AddRecipe(73382, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73382, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73382, 50480, 50482)

	-- Purified Demonseye -- 73355
	AddRecipe(73355, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73355, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73355, 50480, 50482)

	-- Quick Amberjewel -- 73348
	AddRecipe(73348, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73348, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73348, 50480, 50482)

	-- Reckless Ember Topaz -- 73369
	AddRecipe(73369, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73369, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73369, 50480, 50482)

	-- Regal Dream Emerald -- 73375
	AddRecipe(73375, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73375, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73375, 50480, 50482)

	-- Resolute Ember Topaz -- 73362
	AddRecipe(73362, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73362, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73362, 50480, 50482)

	-- Resplendent Ember Topaz -- 95756
	AddRecipe(95756, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(95756, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(95756, 50480, 50482)

	-- Retaliating Demonseye -- 73358
	AddRecipe(73358, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73358, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73358, 50480, 50482)

	-- Rigid Ocean Sapphire -- 73344
	AddRecipe(73344, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73344, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73344, 50480, 50482)

	-- Sensei's Dream Emerald -- 73384
	AddRecipe(73384, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73384, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73384, 50480, 50482)

	-- Shifting Demonseye -- 73351
	AddRecipe(73351, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73351, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73351, 50480, 50482)

	-- Skillful Ember Topaz -- 73370
	AddRecipe(73370, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73370, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73370, 50480, 50482)

	-- Smooth Amberjewel -- 73346
	AddRecipe(73346, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73346, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73346, 50480, 50482)

	-- Solid Ocean Sapphire -- 73340
	AddRecipe(73340, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73340, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73340, 50480, 50482)

	-- Sovereign Demonseye -- 73350
	AddRecipe(73350, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73350, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73350, 50480, 50482)

	-- Sparkling Ocean Sapphire -- 73341
	AddRecipe(73341, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73341, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73341, 50480, 50482)

	-- Steady Dream Emerald -- 73379
	AddRecipe(73379, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73379, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73379, 50480, 50482)

	-- Stormy Ocean Sapphire -- 73343
	AddRecipe(73343, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73343, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73343, 50480, 50482)

	-- Subtle Amberjewel -- 73345
	AddRecipe(73345, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73345, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73345, 50480, 50482)

	-- Timeless Demonseye -- 73353
	AddRecipe(73353, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73353, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73353, 50480, 50482)

	-- Veiled Demonseye -- 73359
	AddRecipe(73359, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73359, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73359, 50480, 50482)

	-- Willful Ember Topaz -- 95754
	AddRecipe(95754, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(95754, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(95754, 50480, 50482)

	-- Zen Dream Emerald -- 73383
	AddRecipe(73383, 465, nil, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(73383, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73383, 50480, 50482)

	-- Stardust --- NOT IN GAME YET
	-- AddRecipe()
	-- self:AddRecipeFlags()

	-- The Perforator -- 73621
	AddRecipe(73621, 490, nil, Q.COMMON, V.CATA, 490, 500, 505, 510)
	self:AddRecipeFlags(73621, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73621, 26997, 19778, 26982, 19063, 19775, 46675, 44582, 28701)

	-- Austere Shadowspirit Diamond -- 73468
	AddRecipe(73468, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73468, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73468, 50480, 50482)

	-- Bracing Shadowspirit Diamond -- 73466
	AddRecipe(73466, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73466, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73466, 50480, 50482)

	-- Chaotic Shadowspirit Diamond -- 73465
	AddRecipe(73465, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73465, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73465, 50480, 50482)

	-- Destructive Shadowspirit Diamond -- 73472
	AddRecipe(73472, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73472, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73472, 50480, 50482)

	-- Effulgent Shadowspirit Diamond -- 73469
	AddRecipe(73469, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73469, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73469, 50480, 50482)

	-- Ember Shadowspirit Diamond -- 73470
	AddRecipe(73470, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73470, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73470, 50480, 50482)

	-- Enigmatic Shadowspirit Diamond -- 73474
	AddRecipe(73474, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73474, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73474, 50480, 50482)

	-- Eternal Shadowspirit Diamond -- 73467
	AddRecipe(73467, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73467, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73467, 50480, 50482)

	-- Fleet Shadowspirit Diamond -- 73464
	AddRecipe(73464, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73464, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73464, 50480, 50482)

	-- Forlorn Shadowspirit Diamond -- 73476
	AddRecipe(73476, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73476, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73476, 50480, 50482)

	-- Impassive Shadowspirit Diamond -- 73475
	AddRecipe(73475, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73475, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73475, 50480, 50482)

	-- Powerful Shadowspirit Diamond -- 73473
	AddRecipe(73473, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73473, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73473, 50480, 50482)

	-- Revitalizing Shadowspirit Diamond -- 73471
	AddRecipe(73471, 490, nil, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(73471, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73471, 50480, 50482)

	-- Fire Prism -- 73478
	AddRecipe(73478, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 525)
	self:AddRecipeFlags(73478, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73478, 26997, 19778, 26982, 19063, 19775, 46675, 44582, 28701)

	-- Bold Chimera's Eye -- 73396
	AddRecipe(73396, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73396, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73396, 50480, 50482)

	-- Brilliant Chimera's Eye -- 73399
	AddRecipe(73399, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73399, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73399, 50480, 50482)

	-- Delicate Chimera's Eye -- 73397
	AddRecipe(73397, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73397, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73397, 50480, 50482)

	-- Flashing Chimera's Eye -- 73398
	AddRecipe(73398, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73398, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73398, 50480, 50482)

	-- Fractured Chimera's Eye -- 73409
	AddRecipe(73409, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73409, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73409, 50480, 50482)

	-- Mystic Chimera's Eye -- 73407
	AddRecipe(73407, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73407, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73407, 50480, 50482)

	-- Precise Chimera's Eye -- 73400
	AddRecipe(73400, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73400, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73400, 50480, 50482)

	-- Quick Chimera's Eye -- 73408
	AddRecipe(73408, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73408, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73408, 50480, 50482)

	-- Rigid Chimera's Eye -- 73404
	AddRecipe(73404, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73404, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73404, 50480, 50482)

	-- Smooth Chimera's Eye -- 73406
	AddRecipe(73406, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73406, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73406, 50480, 50482)

	-- Solid Chimera's Eye -- 73401
	AddRecipe(73401, 500, nil, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73401, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73401, 50480, 50482)

	-- Sparkling Chimera's Eye -- 73402
	AddRecipe(73402, 500, 52262, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73402, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73402, 50480, 50482)

	-- Stormy Chimera's Eye -- 73403
	AddRecipe(73403, 500, 52263, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73403, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73403, 50480, 50482)

	-- Subtle Chimera's Eye -- 73405
	AddRecipe(73405, 500, 52265, Q.EPIC, V.CATA, 500, 505, 507, 510)
	self:AddRecipeFlags(73405, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73405, 50480, 50482)

	-- -- Rhinestone Sunglasses -- NOT IN GAME YET
	-- AddRecipe()
	-- self:AddRecipeFlags()

	-- Band of Blades -- 73498
	AddRecipe(73498, 525, 52318, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73498, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73498, 50480, 50482)

	-- Brazen Elementium Medallion -- 73521
	AddRecipe(73521, 525, 52350, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73521, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73521, 50480, 50482)

	-- Elementium Destroyer's Ring -- 73520
	AddRecipe(73520, 525, 52348, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73520, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73520, 50480, 50482)

	-- Elementium Guardian -- 73506
	AddRecipe(73506, 525, 52323, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73506, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73506, 50480, 50482)

	-- Elementium Moebius Band -- 73503
	AddRecipe(73503, 525, 52320, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73503, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73503, 50480, 50482)

	-- Entwined Elementium Choker -- 73504
	AddRecipe(73504, 525, 52321, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73504, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73504, 50480, 50482)

	-- Eye of Many Deaths -- 73505
	AddRecipe(73505, 525, 52322, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73505, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73505, 50480, 50482)

	-- Ring of Warring Elements -- 73502
	AddRecipe(73502, 525, 52319, Q.EPIC, V.CATA, 525, 525, 525, 525)
	self:AddRecipeFlags(73502, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(73502, 50480, 50482)

	-- Deadly Hessonite -- 73262
	AddRecipe(73262, 425, 52109, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73262, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73262, "Kalimdor", "Eastern Kingdoms")

	-- Defender's Hessonite -- 73242
	AddRecipe(73242, 425, 52097, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73242, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73242, "Kalimdor", "Eastern Kingdoms")

	-- Deft Hessonite -- 73265
	AddRecipe(73265, 425, 52112, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73265, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73265, "Kalimdor", "Eastern Kingdoms")

	-- Fierce Hessonite -- 73264
	AddRecipe(73264, 425, 52111, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73264, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73264, "Kalimdor", "Eastern Kingdoms")

	-- Fine Hessonite -- 73269
	AddRecipe(73269, 425, 52116, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73269, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73269, "Kalimdor", "Eastern Kingdoms")

	-- Flashing Carnelian -- 73224
	AddRecipe(73224, 425, 52083, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73224, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73224, "Kalimdor", "Eastern Kingdoms")

	-- Forceful Jasper -- 73277
	AddRecipe(73277, 425, 52124, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73277, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73277, "Kalimdor", "Eastern Kingdoms")

	-- Guardian's Nightstone -- 73244
	AddRecipe(73244, 425, 52099, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73244, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73244, "Kalimdor", "Eastern Kingdoms")

	-- Inscribed Hessonite -- 73260
	AddRecipe(73260, 425, 52108, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73260, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73260, "Kalimdor", "Eastern Kingdoms")

	-- Keen Hessonite -- 73271
	AddRecipe(73271, 425, 52118, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73271, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73271, "Kalimdor", "Eastern Kingdoms")

	-- Lightning Jasper -- 73278
	AddRecipe(73278, 425, 52125, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73278, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73278, "Kalimdor", "Eastern Kingdoms")

	-- Nimble Jasper -- 73273
	AddRecipe(73273, 425, 52120, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73273, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73273, "Kalimdor", "Eastern Kingdoms")

	-- Piercing Jasper -- 73275
	AddRecipe(73275, 425, 52122, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73275, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73275, "Kalimdor", "Eastern Kingdoms")

	-- Polished Hessonite -- 73258
	AddRecipe(73258, 425, 52106, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73258, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73258, "Kalimdor", "Eastern Kingdoms")

	-- Potent Hessonite -- 73263
	AddRecipe(73263, 425, 52110, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73263, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73263, "Kalimdor", "Eastern Kingdoms")

	-- Purified Nightstone -- 73245
	AddRecipe(73245, 425, 52100, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73245, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73245, "Kalimdor", "Eastern Kingdoms")

	-- Regal Jasper -- 73272
	AddRecipe(73272, 425, 52119, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73272, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73272, "Kalimdor", "Eastern Kingdoms")

	-- Retaliating Nightstone -- 73248
	AddRecipe(73248, 425, 52103, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73248, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73248, "Kalimdor", "Eastern Kingdoms")

	-- Steady Jasper -- 73276
	AddRecipe(73276, 425, 52123, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73276, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73276, "Kalimdor", "Eastern Kingdoms")

	-- Stormy Zephyrite -- 73229
	AddRecipe(73229, 425, 52088, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73229, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73229, "Kalimdor", "Eastern Kingdoms")

	-- Subtle Alicite -- 73231
	AddRecipe(73231, 425, 52090, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73231, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73231, "Kalimdor", "Eastern Kingdoms")

	-- Zen Jasper -- 73280
	AddRecipe(73280, 425, 52127, Q.UNCOMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73280, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(73280, "Kalimdor", "Eastern Kingdoms")

	-- Rigid Zephyrite 73230
	AddRecipe(73230, 425, 52089, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73230, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73230, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Solid Zephyrite 73227
	AddRecipe(73227, 425, 52086, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73227, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73227, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Sparkling Zephyrite 73228
	AddRecipe(73228, 425, 52087, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73228, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73228, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Jagged Jasper 73274
	AddRecipe(73274, 425, 52121, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73274, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73274, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Puissant Jasper 73279
	AddRecipe(73279, 425, 52126, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73279, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73279, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Sensei's Jasper 73281
	AddRecipe(73281, 425, 52128, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73281, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73281, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Adept Hessonite 73268
	AddRecipe(73268, 425, 52115, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73268, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73268, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Artful Hessonite 73270
	AddRecipe(73270, 425, 52117, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73270, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73270, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Skillful Hessonite 73267
	AddRecipe(73267, 425, 52114, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73267, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73267, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Accurate Nightstone 73250
	AddRecipe(73250, 425, 52105, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73250, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73250, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Etched Nightstone 73246
	AddRecipe(73246, 425, 52101, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73246, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73246, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Glinting Nightstone 73247
	AddRecipe(73247, 425, 52102, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73247, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73247, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Shifting Nightstone 73241
	AddRecipe(73241, 425, 52096, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73241, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73241, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Sovereign Nightstone 73240
	AddRecipe(73240, 425, 52095, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73240, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73240, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Timeless Nightstone 73243
	AddRecipe(73243, 425, 52098, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73243, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73243, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Veiled Nightstone 73249
	AddRecipe(73249, 425, 52104, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73249, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73249, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Bold Carnelian 73222
	AddRecipe(73222, 425, 52081, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73222, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73222, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Brilliant Carnelian 73225
	AddRecipe(73225, 425, 52084, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73225, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73225, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Delicate Carnelian 73223
	AddRecipe(73223, 425, 52082, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73223, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73223, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Precise Carnelian 73226
	AddRecipe(73226, 425, 52085, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73226, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73226, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Fractured Alicite 73239
	AddRecipe(73239, 425, 52094, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73239, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73239, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Quick Alicite 73234
	AddRecipe(73234, 425, 52093, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73234, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73234, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Smooth Alicite 73232
	AddRecipe(73232, 425, 52091, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(73232, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73232, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)

	-- Agile Shadowspirit Diamond -- 96255
	AddRecipe(96255, 490, 68778, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(96255, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(96255, "Kalimdor", "Eastern Kingdoms", "Deepholm")

	-- Reverberating Shadowspirit Diamond -- 96256
	AddRecipe(96256, 490, 68779, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(96256, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(96256, "Kalimdor", "Eastern Kingdoms", "Deepholm")

	-- Burning Shadowspirit Diamond -- 96257
	AddRecipe(96257, 490, 68780, Q.RARE, V.CATA, 490, 515, 520, 525)
	self:AddRecipeFlags(96257, F.WORLD_DROP, F.RBOE, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeWorldDrop(96257, "Kalimdor", "Eastern Kingdoms", "Deepholm")

	-- Vivid Dream Emerald -- 96226
	AddRecipe(96226, 465, 68741, Q.RARE, V.CATA, 465, 500, 507, 515)
	self:AddRecipeFlags(96226, F.VENDOR, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeVendor(96226, 50480, 50482)
	
	-- Reckless Hessonite -- 73266
	AddRecipe(73266, 450, 68741, Q.COMMON, V.CATA, 450, 450, 467, 485)
	self:AddRecipeFlags(73266, F.TRAINER, F.RBOP, F.IBOE, F.ALLIANCE, F.HORDE)
	self:AddRecipeTrainer(73266, 26997, 26960, 19778, 26982, 19063, 33614, 18751, 19775, 46675, 33590, 26915, 18774, 44582, 28701)	

	return num_recipes
end
