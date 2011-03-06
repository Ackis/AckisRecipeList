--[[
************************************************************************
FirstAid.lua
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

local initialized = false
local num_recipes = 0

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level)
	num_recipes = num_recipes + 1
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 3273, nil, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitFirstAid()
	if initialized then
		return num_recipes
	end
	initialized = true

	local recipe

	-- Linen Bandage -- 3275
	recipe = AddRecipe(3275, 1, 1251, Q.COMMON, V.ORIG, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Heavy Linen Bandage -- 3276
	recipe = AddRecipe(3276, 40, 2581, Q.COMMON, V.ORIG, 40, 50, 75, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Wool Bandage -- 3277
	recipe = AddRecipe(3277, 80, 3530, Q.COMMON, V.ORIG, 80, 80, 115, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Wool Bandage -- 3278
	recipe = AddRecipe(3278, 115, 3531, Q.COMMON, V.ORIG, 115, 115, 150, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Silk Bandage -- 7928
	recipe = AddRecipe(7928, 150, 6450, Q.COMMON, V.ORIG, 150, 150, 180, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Silk Bandage -- 7929
	recipe = AddRecipe(7929, 180, 6451, Q.COMMON, V.ORIG, 180, 180, 210, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Anti-Venom -- 7934
	recipe = AddRecipe(7934, 80, 6452, Q.COMMON, V.ORIG, 80, 80, 115, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Strong Anti-Venom -- 7935
	recipe = AddRecipe(7935, 130, 6453, Q.UNCOMMON, V.ORIG, 130, 130, 165, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mageweave Bandage -- 10840
	recipe = AddRecipe(10840, 210, 8544, Q.COMMON, V.ORIG, 210, 210, 240, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Mageweave Bandage -- 10841
	recipe = AddRecipe(10841, 240, 8545, Q.COMMON, V.ORIG, 240, 240, 270, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Runecloth Bandage -- 18629
	recipe = AddRecipe(18629, 260, 14529, Q.COMMON, V.ORIG, 260, 260, 290, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Runecloth Bandage -- 18630
	recipe = AddRecipe(18630, 290, 14530, Q.COMMON, V.ORIG, 290, 290, 320, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Powerful Anti-Venom -- 23787
	recipe = AddRecipe(23787, 300, 19440, Q.COMMON, V.ORIG, 300, 300, 330, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Netherweave Bandage -- 27032
	recipe = AddRecipe(27032, 300, 21990, Q.COMMON, V.TBC, 300, 330, 347, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Netherweave Bandage -- 27033
	recipe = AddRecipe(27033, 330, 21991, Q.COMMON, V.TBC, 330, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Frostweave Bandage -- 45545
	recipe = AddRecipe(45545, 350, 34721, Q.COMMON, V.WOTLK, 350, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Frostweave Bandage -- 45546
	recipe = AddRecipe(45546, 400, 34722, Q.UNCOMMON, V.WOTLK, 400, 400, 430, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddTrainer(28706, 45540)
	recipe:AddWorldDrop("Northrend")

	-- Embersilk Bandage -- 74556
	recipe = AddRecipe(74556, 425, 34722, Q.COMMON, V.CATA, 425, 450, 467, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Heavy Embersilk Bandage -- 74557
	recipe = AddRecipe(74557, 475, 53050, Q.COMMON, V.CATA, 475, 485, 505, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Field Bandage: Dense Embersilk -- 74558
	recipe = AddRecipe(74558, 525, 53051, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	-- Dense Embersilk Bandage -- 88893
	recipe = AddRecipe(88893, 525, 53051, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(2326, 2327, 2329, 2798, 3181, 4211, 4591, 5150, 5759, 5939, 5943, 6094, 16272, 16662, 16731, 17214, 17424, 18990, 18991, 19184, 19478, 22477, 23734, 26956, 26992, 28706, 29233, 33589, 33621, 45540, 49879, 50574)

	return num_recipes
end
