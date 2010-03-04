--[[
************************************************************************
Smelting.lua
Smelting data for all of Ackis Recipe List
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
local Q      = private.item_qualities
local REP	= private.rep_levels
local FAC	= private.faction_ids
local V    = private.game_versions

local FRIENDLY	= 1
local HONORED	= 2
local REVERED	= 3
local EXALTED	= 4

local initialized = false
local num_recipes = 0

function addon:InitSmelting(RecipeDB)
	if initialized then
		return num_recipes
	end
	initialized = true

	--------------------------------------------------------------------------------------------------------------------
	-- Counter and wrapper function
	--------------------------------------------------------------------------------------------------------------------
	local function AddRecipe(SpellID, Skill, ItemID, Rarity, Game, Orange, Yellow, Green, Gray)
		num_recipes = num_recipes + 1
		self:addTradeSkill(RecipeDB, SpellID, Skill, ItemID, Rarity, 32606, nil, Game, Orange, Yellow, Green, Gray)
	end

	-- Smelt Copper -- 2657
	AddRecipe(2657, 1, 2840, 1, 0, 1, 25, 47, 70)
	self:addTradeFlags(RecipeDB, 2657, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 2657, A.CUSTOM, 8)

	-- Smelt Silver -- 2658
	AddRecipe(2658, 75, 2842, 1, 0, 75, 115, 122, 130)
	self:addTradeFlags(RecipeDB, 2658, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 2658, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Bronze -- 2659
	AddRecipe(2659, 65, 2841, 1, 0, 0, 65, 90, 115)
	self:addTradeFlags(RecipeDB, 2659, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 2659, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Tin -- 3304
	AddRecipe(3304, 65, 3576, 1, 0, 0, 65, 70, 75)
	self:addTradeFlags(RecipeDB, 3304, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3304, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Iron -- 3307
	AddRecipe(3307, 125, 3575, 1, 0, 125, 130, 145, 160)
	self:addTradeFlags(RecipeDB, 3307, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3307, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Gold -- 3308
	AddRecipe(3308, 155, 3577, 1, 0, 155, 170, 177, 185)
	self:addTradeFlags(RecipeDB, 3308, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3308, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Steel -- 3569
	AddRecipe(3569, 165, 3859, 1, 0, 0, 0, 0, 165)
	self:addTradeFlags(RecipeDB, 3569, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 3569, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Mithril -- 10097
	AddRecipe(10097, 175, 3860, 1, 0, 0, 175, 202, 230)
	self:addTradeFlags(RecipeDB, 10097, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 10097, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Truesilver -- 10098
	AddRecipe(10098, 230, 6037, 1, 0, 230, 235, 242, 250)
	self:addTradeFlags(RecipeDB, 10098, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 10098, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Dark Iron -- 14891
	AddRecipe(14891, 230, 11371, 1, 0, 230, 300, 305, 310)
	self:addTradeFlags(RecipeDB, 14891, 1, 2, 8, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 14891, 4, 4083)

	-- Smelt Thorium -- 16153
	AddRecipe(16153, 230, 12359, 1, 0, 230, 250, 270, 290)
	self:addTradeFlags(RecipeDB, 16153, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 16153, A.TRAINER, 1681, A.TRAINER, 1701, A.TRAINER, 3001, A.TRAINER, 3137, A.TRAINER, 3175, A.TRAINER, 3357, A.TRAINER, 3555, 1, 4254, 1, 4598, 1, 5392, 
	A.TRAINER, 5513, 1, 6297, A.TRAINER, 8128, A.TRAINER, 16663, A.TRAINER, 16752, A.TRAINER, 17488, A.TRAINER, 18747, A.TRAINER, 18779, 1, 18804, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, 
	A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Elementium -- 22967
	AddRecipe(22967, 300, 17771, 5, 0, 300, 350, 362, 375)
	self:addTradeFlags(RecipeDB, 22967, F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 22967, A.MOB, 14401)

	-- Smelt Fel Iron -- 29356
	AddRecipe(29356, 300, 23445, 1, 1, 0, 300, 307, 315)
	self:addTradeFlags(RecipeDB, 29356, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 29356, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Adamantite -- 29358
	AddRecipe(29358, 325, 23446, 1, 1, 0, 325, 332, 340)
	self:addTradeFlags(RecipeDB, 29358, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 29358, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Eternium -- 29359
	AddRecipe(29359, 350, 23447, 1, 1, 0, 350, 357, 365)
	self:addTradeFlags(RecipeDB, 29359, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 29359, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Felsteel -- 29360
	AddRecipe(29360, 350, 23448, 1, 1, 0, 350, 357, 375)
	self:addTradeFlags(RecipeDB, 29360, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 29360, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Khorium -- 29361
	AddRecipe(29361, 375, 23449, 1, 1, 0, 0, 0, 375)
	self:addTradeFlags(RecipeDB, 29361, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 29361, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Hardened Adamantite -- 29686
	AddRecipe(29686, 375, 23573, 1, 1, 0, 0, 0, 375)
	self:addTradeFlags(RecipeDB, 29686, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 29686, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Earth Shatter -- 35750
	AddRecipe(35750, 300, 22573, 1, 1, 0, 0, 0, 300)
	self:addTradeFlags(RecipeDB, 35750, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 35750, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Fire Sunder -- 35751
	AddRecipe(35751, 300, 22574, 1, 1, 0, 0, 0, 300)
	self:addTradeFlags(RecipeDB, 35751, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 35751, A.TRAINER, 18747, A.TRAINER, 18779, A.TRAINER, 26999, A.TRAINER, 33617, A.TRAINER, 28698, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 33682, A.TRAINER, 26912)

	-- Smelt Cobalt -- 49252
	AddRecipe(49252, 350, 36916, 1, 2, 0, 350, 362, 375)
	self:addTradeFlags(RecipeDB, 49252, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 49252, A.TRAINER, 26912, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 26999, A.TRAINER, 28698)

	-- Smelt Saronite -- 49258
	AddRecipe(49258, 400, 36913, 1, 2, 0, 0, 0, 400)
	self:addTradeFlags(RecipeDB, 49258, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 49258, A.TRAINER, 26912, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 26999, A.TRAINER, 28698)

	-- Smelt Titansteel -- 55208
	AddRecipe(55208, 450, 37663, 2, 2, 0, 0, 0, 450)
	self:addTradeFlags(RecipeDB, 55208, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 55208, A.TRAINER, 26912, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 26999, A.TRAINER, 28698)

	-- Smelt Titanium -- 55211
	AddRecipe(55211, 450, 41163, 2, 2, 0, 0, 0, 450)
	self:addTradeFlags(RecipeDB, 55211, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 55211, A.TRAINER, 26912, A.TRAINER, 26962, A.TRAINER, 26976, A.TRAINER, 26999, A.TRAINER, 28698)

	-- Smelt Hardened Khorium -- 46353
	AddRecipe(46353, 375, 35128, 3, 1, 0, 0, 0, 375)
	self:addTradeFlags(RecipeDB, 46353, 1, 2, 6, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 46353, 8, 24)
	
	-- Smelt Enchanted Thorium -- 70524
	AddRecipe(70524, 250, 12655, 1, 2, 250, 250, 255, 260)
	self:addTradeFlags(RecipeDB, 70524, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 70524, A.TRAINER, 28698)

	return num_recipes

end
