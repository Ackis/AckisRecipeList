--[[
************************************************************************
Runeforging.lua
Runeforging data for all of Ackis Recipe List
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
-- Origin
-------------------------------------------------------------------------------
local GAME_ORIG, GAME_TBC, GAME_WOTLK = 0, 1, 2

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F		= private.filter_flags
local A		= private.acquire_types
local Q      = private.item_qualities
local REP	= private.rep_levels
local FAC	= private.faction_ids

local FRIENDLY	= 1
local HONORED	= 2
local REVERED	= 3
local EXALTED	= 4

local initialized = false
local num_recipes = 0

function addon:InitRuneforging(RecipeDB)
	if initialized then
		return num_recipes
	end
	initialized = true

	--------------------------------------------------------------------------------------------------------------------
	-- Counter and wrapper function
	--------------------------------------------------------------------------------------------------------------------
	local function AddRecipe(SpellID)
		num_recipes = num_recipes + 1
		self:addTradeSkill(RecipeDB, SpellID, 1, nil, Q.COMMON, 53428, nil, GAME_WOTLK, 1, 1, 1, 1)
	end

	-- Rune of the Fallen Crusader - 53344
	AddRecipe(53344)
	self:addTradeFlags(RecipeDB,53344, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,53344, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Swordshattering - 53323
	AddRecipe(53323)
	self:addTradeFlags(RecipeDB,53323, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,53323, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Swordbreaking - 54446
	AddRecipe(54446)
	self:addTradeFlags(RecipeDB,54446, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,54446, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Spellshattering - 53342
	AddRecipe(53342)
	self:addTradeFlags(RecipeDB,53342, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,53342, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Spellbreaking - 54447
	AddRecipe(54447)
	self:addTradeFlags(RecipeDB,54447, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,54447, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Razorice - 53343
	AddRecipe(53343)
	self:addTradeFlags(RecipeDB,53343, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,53343, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Lichbane - 53331
	AddRecipe(53331)
	self:addTradeFlags(RecipeDB,53331, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,53331, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of Cinderglacier - 53341
	AddRecipe(53341)
	self:addTradeFlags(RecipeDB,53341, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,53341, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of the Stoneskin Gargoyle - 62158
	AddRecipe(62158)
	self:addTradeFlags(RecipeDB,62158, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,62158, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)

	-- Rune of the Nerubian Carapace - 70164
	AddRecipe(70164)
	self:addTradeFlags(RecipeDB,70164, F.ALLIANCE, F.HORDE, F.TRAINER, F.DK, F.TWO_HAND, F.RBOP, F.IBOP)
	self:addTradeAcquire(RecipeDB,70164, A.TRAINER, 29194, A.TRAINER, 29196, A.TRAINER, 29195, A.TRAINER, 31084)
	
	return num_recipes

end
