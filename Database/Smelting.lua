--[[
************************************************************************
Smelting.lua
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
local V = private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, UNUSED, required_faction)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 32606, nil, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
end

function addon:InitSmelting()
	local recipe

	-- Smelt Copper -- 2657
	recipe = AddRecipe(2657, 1, 2840, Q.COMMON, V.ORIG, 1, 25, 47, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Smelt Silver -- 2658
	recipe = AddRecipe(2658, 75, 2842, Q.COMMON, V.ORIG, 75, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Bronze -- 2659
	recipe = AddRecipe(2659, 65, 2841, Q.COMMON, V.ORIG, 65, 65, 90, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Tin -- 3304
	recipe = AddRecipe(3304, 65, 3576, Q.COMMON, V.ORIG, 65, 65, 70, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Iron -- 3307
	recipe = AddRecipe(3307, 125, 3575, Q.COMMON, V.ORIG, 125, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Gold -- 3308
	recipe = AddRecipe(3308, 155, 3577, Q.COMMON, V.ORIG, 155, 170, 177, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Steel -- 3569
	recipe = AddRecipe(3569, 165, 3859, Q.COMMON, V.ORIG, 165, 165, 165, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Mithril -- 10097
	recipe = AddRecipe(10097, 175, 3860, Q.COMMON, V.ORIG, 175, 175, 202, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Truesilver -- 10098
	recipe = AddRecipe(10098, 230, 6037, Q.COMMON, V.ORIG, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Dark Iron -- 14891
	recipe = AddRecipe(14891, 230, 11371, Q.COMMON, V.ORIG, 230, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(4083)

	-- Smelt Thorium -- 16153
	recipe = AddRecipe(16153, 230, 12359, Q.COMMON, V.ORIG, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Enchanted Elementium -- 22967
	recipe = AddRecipe(22967, 300, 17771, Q.RARE, V.ORIG, 300, 350, 362, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(14401)

	-- Smelt Fel Iron -- 29356
	recipe = AddRecipe(29356, 275, 23445, Q.COMMON, V.TBC, 275, 275, 300, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Adamantite -- 29358
	recipe = AddRecipe(29358, 325, 23446, Q.COMMON, V.TBC, 325, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Eternium -- 29359
	recipe = AddRecipe(29359, 350, 23447, Q.COMMON, V.TBC, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Felsteel -- 29360
	recipe = AddRecipe(29360, 350, 23448, Q.COMMON, V.TBC, 350, 350, 357, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Khorium -- 29361
	recipe = AddRecipe(29361, 375, 23449, Q.COMMON, V.TBC, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Hardened Adamantite -- 29686
	recipe = AddRecipe(29686, 375, 23573, Q.COMMON, V.TBC, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Earth Shatter -- 35750
	recipe = AddRecipe(35750, 300, 22573, Q.COMMON, V.TBC, 300, 300, 300, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Fire Sunder -- 35751
	recipe = AddRecipe(35751, 300, 22574, Q.COMMON, V.TBC, 300, 300, 300, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682)

	-- Smelt Hardened Khorium -- 46353
	recipe = AddRecipe(46353, 375, 35128, Q.RARE, V.WOTLK, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP)
	recipe:AddCustom(24)

	-- Smelt Cobalt -- 49252
	recipe = AddRecipe(49252, 350, 36916, Q.COMMON, V.WOTLK, 350, 350, 362, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 26912, 26962, 26976, 26999, 28698)

	-- Smelt Saronite -- 49258
	recipe = AddRecipe(49258, 400, 36913, Q.COMMON, V.WOTLK, 400, 400, 400, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 26912, 26962, 26976, 26999, 28698)

	-- Smelt Titansteel -- 55208
	recipe = AddRecipe(55208, 450, 37663, Q.COMMON, V.WOTLK, 450, 450, 450, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 26912, 26962, 26976, 26999, 28698)

	-- Smelt Titanium -- 55211
	recipe = AddRecipe(55211, 450, 41163, Q.COMMON, V.WOTLK, 450, 450, 450, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 26912, 26962, 26976, 26999, 28698)

	-- Enchanted Thorium -- 70524
	recipe = AddRecipe(70524, 250, 12655, Q.COMMON, V.WOTLK, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 28698)

	-- Smelt Pyrite -- 74529
	recipe = AddRecipe(74529, 525, 51950, Q.COMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663)

	-- Smelt Elementium -- 74530
	recipe = AddRecipe(74530, 475, 52186, Q.COMMON, V.CATA, 475, 475, 475, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663)

	-- Smelt Hardened Elementium -- 74537
	recipe = AddRecipe(74537, 500, 53039, Q.COMMON, V.CATA, 500, 500, 500, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663)

	-- Smelt Obsidium -- 84038
	recipe = AddRecipe(84038, 425, 54849, Q.COMMON, V.CATA, 425, 425, 437, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663)

	self.InitSmelting = nil
end
