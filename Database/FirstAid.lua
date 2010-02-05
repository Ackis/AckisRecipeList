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
-- Item "rarity"
-------------------------------------------------------------------------------
local R_COMMON, R_UNCOMMON, R_RARE, R_EPIC, R_LEGENDARY, R_ARTIFACT = 1, 2, 3, 4, 5, 6

-------------------------------------------------------------------------------
-- Origin
-------------------------------------------------------------------------------
local GAME_ORIG, GAME_TBC, GAME_WOTLK = 0, 1, 2

-------------------------------------------------------------------------------
-- Filter flags
-------------------------------------------------------------------------------
local F = private.filter_flags

-------------------------------------------------------------------------------
-- Acquire types
-------------------------------------------------------------------------------
local A = private.acquire_flags

--------------------------------------------------------------------------------------------------------------------
-- Reputation Acquire Flags
--------------------------------------------------------------------------------------------------------------------
local R_ARGENTDAWN = 529

--------------------------------------------------------------------------------------------------------------------
-- Reputation Levels
--------------------------------------------------------------------------------------------------------------------
local FRIENDLY = 1
local HONORED = 2
local REVERED = 3
local EXALTED = 4

local initialized = false
local num_recipes = 0

function addon:InitFirstAid(RecipeDB)
	if initialized then
		return num_recipes
	end
	initialized = true

	--------------------------------------------------------------------------------------------------------------------
	-- Counter and wrapper function
	--------------------------------------------------------------------------------------------------------------------
	local function AddRecipe(SpellID, Skill, ItemID, Rarity, Game, Orange, Yellow, Green, Gray)
		num_recipes = num_recipes + 1
		self:addTradeSkill(RecipeDB, SpellID, Skill, ItemID, Rarity, 3273, nil, Game, Orange, Yellow, Green, Gray)
	end

	-- Linen Bandage -- 3275
	AddRecipe(3275, 1, 1251, R_COMMON, GAME_ORIG, 1, 30, 45, 60, nil)
	self:addTradeFlags(RecipeDB, 3275, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3275, A.CUSTOM, 8)

	-- Heavy Linen Bandage -- 3276
	AddRecipe(3276, 40, 2581, R_COMMON, GAME_ORIG, 40, 50, 75, 100, nil)
	self:addTradeFlags(RecipeDB, 3276, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3276, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Wool Bandage -- 3277
	AddRecipe(3277, 80, 3530, R_COMMON, GAME_ORIG, 80, 80, 115, 150, nil)
	self:addTradeFlags(RecipeDB, 3277, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3277, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Heavy Wool Bandage -- 3278
	AddRecipe(3278, 115, 3531, R_COMMON, GAME_ORIG, 115, 115, 150, 185, nil)
	self:addTradeFlags(RecipeDB, 3278, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3278, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Silk Bandage -- 7928
	AddRecipe(7928, 150, 6450, R_COMMON, GAME_ORIG, 150, 150, 180, 210, nil)
	self:addTradeFlags(RecipeDB, 7928, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 7928, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Heavy Silk Bandage -- 7929
	AddRecipe(7929, 180, 6451, R_COMMON, GAME_ORIG, 180, 180, 210, 240, nil)
	self:addTradeFlags(RecipeDB, 7929, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7929, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Anti-Venom -- 7934
	AddRecipe(7934, 80, 6452, R_COMMON, GAME_ORIG, 80, 80, 115, 150, nil)
	self:addTradeFlags(RecipeDB, 7934, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7934, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Strong Anti-Venom -- 7935
	AddRecipe(7935, 130, 6453, R_UNCOMMON, GAME_ORIG, 130, 130, 165, 200, nil)
	self:addTradeFlags(RecipeDB, 7935, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7935, A.WORLD_DROP, 2)

	-- Mageweave Bandage -- 10840
	AddRecipe(10840, 210, 8544, R_COMMON, GAME_ORIG, 210, 210, 240, 270, nil)
	self:addTradeFlags(RecipeDB, 10840, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 10840, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Heavy Mageweave Bandage -- 10841
	AddRecipe(10841, 240, 8545, R_COMMON, GAME_ORIG, 240, 240, 270, 300, nil)
	self:addTradeFlags(RecipeDB, 10841, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 10841, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Runecloth Bandage -- 18629
	AddRecipe(18629, 260, 14529, R_COMMON, GAME_ORIG, 260, 260, 290, 320, nil)
	self:addTradeFlags(RecipeDB, 18629, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 18629, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Heavy Runecloth Bandage -- 18630
	AddRecipe(18630, 290, 14530, R_COMMON, GAME_ORIG, 290, 290, 320, 350, nil)
	self:addTradeFlags(RecipeDB, 18630, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 18630, A.TRAINER, 2326, A.TRAINER, 2327, A.TRAINER, 2329, A.TRAINER, 2798, A.TRAINER, 3181, A.TRAINER, 3373, A.TRAINER, 4211, A.TRAINER, 4591, A.TRAINER, 5150, A.TRAINER, 5759, A.TRAINER, 5939, A.TRAINER, 5943, A.TRAINER, 6094, A.TRAINER, 16272, A.TRAINER, 16662, A.TRAINER, 16731, A.TRAINER, 17214, A.TRAINER, 17424, A.TRAINER, 19184, A.TRAINER, 19478, A.TRAINER, 22477, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 33621, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Powerful Anti-Venom -- 23787
	AddRecipe(23787, 300, 19440, R_COMMON, GAME_ORIG, 300, 300, 330, 360, nil)
	self:addTradeFlags(RecipeDB, 23787, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	self:addTradeAcquire(RecipeDB, 23787, A.REPUTATION, 529, HONORED, 10856, A.REPUTATION, 529, 2, 10857, A.REPUTATION, 529, 2, 11536)

	-- Netherweave Bandage -- 27032
	AddRecipe(27032, 300, 21990, R_COMMON, GAME_TBC, 300, 330, 347, 365, nil)
	self:addTradeFlags(RecipeDB, 27032, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 27032, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Heavy Netherweave Bandage -- 27033
	AddRecipe(27033, 330, 21991, R_COMMON, GAME_TBC, 330, 360, 367, 375, nil)
	self:addTradeFlags(RecipeDB, 27033, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 27033, A.TRAINER, 33589, A.TRAINER, 28706, A.TRAINER, 18991, A.TRAINER, 29233, A.TRAINER, 18990, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 23734)

	-- Frostweave Bandage -- 45545
	AddRecipe(45545, 350, 34721, R_COMMON, GAME_WOTLK, 350, 375, 392, 410, nil)
	self:addTradeFlags(RecipeDB, 45545, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45545, A.TRAINER, 23734, A.TRAINER, 26956, A.TRAINER, 26992, A.TRAINER, 28706, A.TRAINER, 29233, A.TRAINER, 33589)

	-- Heavy Frostweave Bandage -- 45546
	AddRecipe(45546, 400, 34722, R_UNCOMMON, GAME_WOTLK, 400, 400, 430, 470, nil)
	self:addTradeFlags(RecipeDB, 45546, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45546, A.WORLD_DROP, 2)

	return num_recipes
end
