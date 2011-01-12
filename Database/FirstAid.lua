--[[
************************************************************************
FirstAid.lua
First Aid data for all of Ackis Recipe List
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
	addon:AddRecipe(spell_id, skill_level, item_id, quality, 3273, nil, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitFirstAid()
	if initialized then
		return num_recipes
	end
	initialized = true

	-- Linen Bandage -- 3275
	AddRecipe(3275, 1, 1251, Q.COMMON, V.ORIG, 1, 30, 45, 60)
	self:AddRecipeFlags(3275, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeAcquire(3275, A.CUSTOM, 8)

	-- Heavy Linen Bandage -- 3276
	AddRecipe(3276, 40, 2581, Q.COMMON, V.ORIG, 40, 50, 75, 100)
	self:AddRecipeFlags(3276, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(3276, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Wool Bandage -- 3277
	AddRecipe(3277, 80, 3530, Q.COMMON, V.ORIG, 80, 80, 115, 150)
	self:AddRecipeFlags(3277, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(3277, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Wool Bandage -- 3278
	AddRecipe(3278, 115, 3531, Q.COMMON, V.ORIG, 115, 115, 150, 185)
	self:AddRecipeFlags(3278, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(3278, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Silk Bandage -- 7928
	AddRecipe(7928, 150, 6450, Q.COMMON, V.ORIG, 150, 150, 180, 210)
	self:AddRecipeFlags(7928, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(7928, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Silk Bandage -- 7929
	AddRecipe(7929, 180, 6451, Q.COMMON, V.ORIG, 180, 180, 210, 240)
	self:AddRecipeFlags(7929, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:AddRecipeTrainer(7929, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Anti-Venom -- 7934
	AddRecipe(7934, 80, 6452, Q.COMMON, V.ORIG, 80, 80, 115, 150)
	self:AddRecipeFlags(7934, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:AddRecipeTrainer(7934, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Strong Anti-Venom -- 7935
	AddRecipe(7935, 130, 6453, Q.UNCOMMON, V.ORIG, 130, 130, 165, 200)
	self:AddRecipeFlags(7935, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	self:AddRecipeWorldDrop(7935, "Kalimdor", "Eastern Kingdoms")

	-- Mageweave Bandage -- 10840
	AddRecipe(10840, 210, 8544, Q.COMMON, V.ORIG, 210, 210, 240, 270)
	self:AddRecipeFlags(10840, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:AddRecipeTrainer(10840, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Mageweave Bandage -- 10841
	AddRecipe(10841, 240, 8545, Q.COMMON, V.ORIG, 240, 240, 270, 300)
	self:AddRecipeFlags(10841, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(10841, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Runecloth Bandage -- 18629
	AddRecipe(18629, 260, 14529, Q.COMMON, V.ORIG, 260, 260, 290, 320)
	self:AddRecipeFlags(18629, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(18629, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Runecloth Bandage -- 18630
	AddRecipe(18630, 290, 14530, Q.COMMON, V.ORIG, 290, 290, 320, 350)
	self:AddRecipeFlags(18630, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(18630, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Powerful Anti-Venom -- 23787
	AddRecipe(23787, 300, 19440, Q.COMMON, V.ORIG, 300, 300, 330, 360)
	self:AddRecipeFlags(23787, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	self:AddRecipeRepVendor(23787, FAC.ARGENTDAWN, REP.HONORED, 10856, 11536, 10857)

	-- Netherweave Bandage -- 27032
	AddRecipe(27032, 300, 21990, Q.COMMON, V.TBC, 300, 330, 347, 365)
	self:AddRecipeFlags(27032, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:AddRecipeTrainer(27032, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Netherweave Bandage -- 27033
	AddRecipe(27033, 330, 21991, Q.COMMON, V.TBC, 330, 360, 367, 375)
	self:AddRecipeFlags(27033, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:AddRecipeTrainer(27033, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Frostweave Bandage -- 45545
	AddRecipe(45545, 350, 34721, Q.COMMON, V.WOTLK, 350, 375, 392, 410)
	self:AddRecipeFlags(45545, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(45545, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Frostweave Bandage -- 45546
	AddRecipe(45546, 400, 34722, Q.UNCOMMON, V.WOTLK, 400, 400, 430, 470)
	self:AddRecipeFlags(45546, F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:AddRecipeWorldDrop(45546, "Northrend")
	self:AddRecipeTrainer(74556, 28706, 45540)

	-- Embersilk Bandage -- 74556
	AddRecipe(74556, 425, 34722, Q.COMMON, V.CATA, 425, 450, 467, 485)
	self:AddRecipeFlags(74556, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(74556, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Heavy Embersilk Bandage -- 74557
	AddRecipe(74557, 475, 53050, Q.COMMON, V.CATA, 475, 485, 505, 525)
	self:AddRecipeFlags(74557, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(74557, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	-- Field Bandage: Dense Embersilk Bandage -- 74558
	AddRecipe(74558, 525, 53051, Q.COMMON, V.CATA, 525, 525, 530, 535)
	self:AddRecipeFlags(74558, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(74558, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)
	
	-- Dense Embersilk Bandage -- 88893
	AddRecipe(88893, 525, 53051, Q.COMMON, V.CATA, 525, 525, 530, 535)
	self:AddRecipeFlags(88893, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:AddRecipeTrainer(88893, 16662, 50574, 22477, 17214, 17424, 23734, 18991, 26992, 18990, 6094, 4211, 49879, 19478, 33621, 3181, 33589, 16272, 45540, 4591, 2329, 19184, 5150, 29233, 5759, 16731, 28706, 2798, 5943, 26956, 2327, 2326, 5939)

	return num_recipes
end
