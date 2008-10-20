--[[

************************************************************************

ARL-Smelt.lua

Smelting data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
23 found from data mining.
0 ignored.
3 WotLK ignored.

************************************************************************

$Date$
$Rev$

************************************************************************

Format:

	self:addTradeSkill(RecipeDB, Spell ID, Skill Level, Item ID, Rarity, Specialty)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitSmelting(RecipeDB)

	local recipecount = 0

	-- Smelt Copper -- 2657
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2657, 1, 2840, 1, 2575)
	self:addTradeFlags(RecipeDB, 2657, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smelt Silver -- 2658
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2658, 100, 2842, 1, 2575)
	self:addTradeFlags(RecipeDB, 2658, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2658, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Bronze -- 2659
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2659, 15, 2841, 1, 2575)
	self:addTradeFlags(RecipeDB, 2659, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2659, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Tin -- 3304
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3304, 55, 3576, 1, 2575)
	self:addTradeFlags(RecipeDB, 3304, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3304, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Iron -- 3307
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3307, 100, 3575, 1, 2575)
	self:addTradeFlags(RecipeDB, 3307, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3307, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Gold -- 3308
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3308, 155, 3577, 1, 2575)
	self:addTradeFlags(RecipeDB, 3308, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3308, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Steel -- 3569
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3569, 165, 3859, 1, 2575)
	self:addTradeFlags(RecipeDB, 3569, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3569, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Mithril -- 10097
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10097, 120, 3860, 1, 2575)
	self:addTradeFlags(RecipeDB, 10097, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 10097, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Truesilver -- 10098
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10098, 220, 6037, 1, 2575)
	self:addTradeFlags(RecipeDB, 10098, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 10098, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Dark Iron -- 14891
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14891, 290, 11371, 1, 2575)
	self:addTradeFlags(RecipeDB, 14891, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smelt Thorium -- 16153
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16153, 210, 12359, 1, 2575)
	self:addTradeFlags(RecipeDB, 16153, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 16153, 1, 1681, 1, 1701, 1, 3001, 1, 3137, 1, 3175, 1, 3357, 1, 3555, 1, 4254, 1, 4598, 1, 5392, 1, 5513, 1, 6297, 1, 8128, 1, 16663, 1, 16752, 1, 17488, 1, 18747, 1, 18779, 1, 18804)

	-- Smelt Fel Iron -- 29356
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29356, 285, 23445, 1, 2575)
	self:addTradeFlags(RecipeDB, 29356, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29356, 1, 18747, 1, 18779)

	-- Smelt Adamantite -- 29358
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29358, 310, 23446, 1, 2575)
	self:addTradeFlags(RecipeDB, 29358, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29358, 1, 18747, 1, 18779)

	-- Smelt Eternium -- 29359
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29359, 335, 23447, 1, 2575)
	self:addTradeFlags(RecipeDB, 29359, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29359, 1, 18747, 1, 18779)

	-- Smelt Felsteel -- 29360
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29360, 330, 23448, 1, 2575)
	self:addTradeFlags(RecipeDB, 29360, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29360, 1, 18747, 1, 18779)

	-- Smelt Khorium -- 29361
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29361, 375, 23449, 1, 2575)
	self:addTradeFlags(RecipeDB, 29361, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29361, 1, 18747, 1, 18779)

	-- Smelt Hardened Adamantite -- 29686
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29686, 375, 23573, 1, 2575)
	self:addTradeFlags(RecipeDB, 29686, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29686, 1, 18747, 1, 18779)

	-- Earth Shatter -- 35750
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35750, 300, 22573, 1, 2575)
	self:addTradeFlags(RecipeDB, 35750, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 35750, 1, 18747, 1, 18779)

	-- Fire Sunder -- 35751
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35751, 300, 22574, 1, 2575)
	self:addTradeFlags(RecipeDB, 35751, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 35751, 1, 18747, 1, 18779)

	-- Smelt Hardened Khorium -- 46353
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46353, 375, 35128, 3, 2575)
	self:addTradeFlags(RecipeDB, 46353, 6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 46353, 3, 25363, 3, 25367, 3, 25368, 3, 25369, 3, 25370, 3, 25371, 3, 25372, 3, 25486, 3, 25506, 3, 25507)

	-- Smelt Cobalt -- 49252
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 49252, 325, 36916, 1, 2575)
	--self:addTradeFlags(RecipeDB, 49252, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smelt Saronite -- 49258
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 49258, 400, 36913, 1, 2575)
	--self:addTradeFlags(RecipeDB, 49258, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smelt Elementium -- 53417
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53417, 325, 17771, 5, 2575)
	--self:addTradeFlags(RecipeDB, 53417, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	return recipecount

end
