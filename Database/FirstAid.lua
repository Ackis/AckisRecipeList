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
	AddRecipe(3275, 1, 1251, R_COMMON, GAME_ORIG, 1, 30, 45, 60)
	self:addTradeFlags(RecipeDB, 3275, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3275, A.CUSTOM, 8)

	-- Heavy Linen Bandage -- 3276
	AddRecipe(3276, 40, 2581, R_COMMON, GAME_ORIG, 40, 50, 75, 100)
	self:addTradeFlags(RecipeDB, 3276, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3276, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Wool Bandage -- 3277
	AddRecipe(3277, 80, 3530, R_COMMON, GAME_ORIG, 80, 80, 115, 150)
	self:addTradeFlags(RecipeDB, 3277, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3277, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Heavy Wool Bandage -- 3278
	AddRecipe(3278, 115, 3531, R_COMMON, GAME_ORIG, 115, 115, 150, 185)
	self:addTradeFlags(RecipeDB, 3278, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3278, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Silk Bandage -- 7928
	AddRecipe(7928, 150, 6450, R_COMMON, GAME_ORIG, 150, 150, 180, 210)
	self:addTradeFlags(RecipeDB, 7928, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 7928, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Heavy Silk Bandage -- 7929
	AddRecipe(7929, 180, 6451, R_COMMON, GAME_ORIG, 180, 180, 210, 240)
	self:addTradeFlags(RecipeDB, 7929, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7929, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 1, 4211, 
			     1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 1, 17424, 
			     1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Anti-Venom -- 7934
	AddRecipe(7934, 80, 6452, R_COMMON, GAME_ORIG, 80, 80, 115, 150)
	self:addTradeFlags(RecipeDB, 7934, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7934, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 1, 4211, 
			     1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 1, 17424, 
			     1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Strong Anti-Venom -- 7935
	AddRecipe(7935, 130, 6453, 2, GAME_ORIG, 130, 130, 165, 200)
	self:addTradeFlags(RecipeDB, 7935, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7935, A.WORLD_DROP, 2)

	-- Mageweave Bandage -- 10840
	AddRecipe(10840, 210, 8544, R_COMMON, GAME_ORIG, 210, 210, 240, 270)
	self:addTradeFlags(RecipeDB, 10840, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 10840, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Heavy Mageweave Bandage -- 10841
	AddRecipe(10841, 240, 8545, R_COMMON, GAME_ORIG, 240, 240, 270, 300)
	self:addTradeFlags(RecipeDB, 10841, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 10841, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Runecloth Bandage -- 18629
	AddRecipe(18629, 260, 14529, R_COMMON, GAME_ORIG, 260, 260, 290, 320)
	self:addTradeFlags(RecipeDB, 18629, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 18629, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Heavy Runecloth Bandage -- 18630
	AddRecipe(18630, 290, 14530, R_COMMON, GAME_ORIG, 290, 290, 320, 350)
	self:addTradeFlags(RecipeDB, 18630, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 18630, 1, 2326, 1, 2327, 1, 2329, 1, 2798, 1, 3181, 1, 3373, 
			     1, 4211, 1, 4591, 1, 5150, 1, 5759, 1, 5939, 1, 5943, 1, 6094, 1, 16272, 1, 16662, 1, 16731, 1, 17214, 
			     1, 17424, 1, 19184, 1, 19478, 1, 22477, 1, 33589, 1, 28706, 1, 33621, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 
			     1, 26992, 1, 23734)

	-- Powerful Anti-Venom -- 23787
	AddRecipe(23787, 300, 19440, R_COMMON, GAME_ORIG, 300, 300, 330, 360)
	self:addTradeFlags(RecipeDB, 23787, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	self:addTradeAcquire(RecipeDB, 23787, A.REPUTATION, R_ARGENTDAWN, HONORED, 10856, A.REPUTATION, R_ARGENTDAWN, HONORED, 10857, A.REPUTATION, R_ARGENTDAWN, HONORED, 11536)

	-- Netherweave Bandage -- 27032
	AddRecipe(27032, 300, 21990, R_COMMON, GAME_TBC, 300, 330, 347, 365)
	self:addTradeFlags(RecipeDB, 27032, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 27032, 1, 33589, 1, 28706, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 1, 26992, 1, 23734)

	-- Heavy Netherweave Bandage -- 27033
	AddRecipe(27033, 330, 21991, R_COMMON, GAME_TBC, 330, 360, 367, 375)
	self:addTradeFlags(RecipeDB, 27033, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 27033, 1, 33589, 1, 28706, 1, 18991, 1, 29233, 1, 18990, 1, 26956, 1, 26992, 1, 23734)

	-- Frostweave Bandage -- 45545
	AddRecipe(45545, 350, 34721, R_COMMON, GAME_WOTLK, 350, 375, 392, 410)
	self:addTradeFlags(RecipeDB, 45545, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45545, 1, 23734, 1, 26956, 1, 26992, 1, 28706, 1, 29233, 1, 33589)

	-- Heavy Frostweave Bandage -- 45546
	AddRecipe(45546, 400, 34722, R_UNCOMMON, GAME_WOTLK, 400, 400, 430, 470)
	self:addTradeFlags(RecipeDB, 45546, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45546, A.WORLD_DROP, 2)

	return num_recipes
end
