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
local FOLDER_NAME, private = ...

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.filter_flags
local A = private.acquire_types
local Q = private.item_qualities
local V = private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitSmelting()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 32606, genesis, quality)
	end

	private:InitializeSmeltingTrainers()

	local recipe

	-- Smelt Copper -- 2657
	recipe = AddRecipe(2657, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2840)
	recipe:SetSkillLevels(1, 1, 25, 47, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Smelt Silver -- 2658
	recipe = AddRecipe(2658, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2842)
	recipe:SetSkillLevels(75, 75, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Bronze -- 2659
	recipe = AddRecipe(2659, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2841)
	recipe:SetSkillLevels(65, 65, 65, 90, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Tin -- 3304
	recipe = AddRecipe(3304, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3576)
	recipe:SetSkillLevels(65, 65, 65, 70, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Iron -- 3307
	recipe = AddRecipe(3307, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3575)
	recipe:SetSkillLevels(125, 125, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Gold -- 3308
	recipe = AddRecipe(3308, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3577)
	recipe:SetSkillLevels(155, 155, 170, 177, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Steel -- 3569
	recipe = AddRecipe(3569, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3859)
	recipe:SetSkillLevels(165, 165, 165, 165, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Mithril -- 10097
	recipe = AddRecipe(10097, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3860)
	recipe:SetSkillLevels(175, 175, 175, 202, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Truesilver -- 10098
	recipe = AddRecipe(10098, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6037)
	recipe:SetSkillLevels(230, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Dark Iron -- 14891
	recipe = AddRecipe(14891, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11371)
	recipe:SetSkillLevels(230, 230, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(4083)

	-- Smelt Thorium -- 16153
	recipe = AddRecipe(16153, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12359)
	recipe:SetSkillLevels(230, 230, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 6297, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Enchanted Elementium -- 22967
	recipe = AddRecipe(22967, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(44956)
	recipe:SetCraftedItemID(17771)
	recipe:SetSkillLevels(300, 300, 350, 362, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(14401)

	-- Smelt Fel Iron -- 29356
	recipe = AddRecipe(29356, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23445)
	recipe:SetSkillLevels(275, 275, 275, 300, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Adamantite -- 29358
	recipe = AddRecipe(29358, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23446)
	recipe:SetSkillLevels(325, 325, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Eternium -- 29359
	recipe = AddRecipe(29359, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23447)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Felsteel -- 29360
	recipe = AddRecipe(29360, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23448)
	recipe:SetSkillLevels(350, 350, 350, 357, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Khorium -- 29361
	recipe = AddRecipe(29361, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23449)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Hardened Adamantite -- 29686
	recipe = AddRecipe(29686, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23573)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Earth Shatter -- 35750
	recipe = AddRecipe(35750, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22573)
	recipe:SetSkillLevels(300, 300, 300, 300, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Fire Sunder -- 35751
	recipe = AddRecipe(35751, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22574)
	recipe:SetSkillLevels(300, 300, 300, 300, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33682, 46357)

	-- Smelt Hardened Khorium -- 46353
	recipe = AddRecipe(46353, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(35273)
	recipe:SetCraftedItemID(35128)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Smelt Cobalt -- 49252
	recipe = AddRecipe(49252, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36916)
	recipe:SetSkillLevels(350, 350, 350, 362, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 26912, 26962, 26976, 26999, 28698, 46357)

	-- Smelt Saronite -- 49258
	recipe = AddRecipe(49258, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36913)
	recipe:SetSkillLevels(400, 400, 400, 400, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 26912, 26962, 26976, 26999, 28698, 46357)

	-- Smelt Titansteel -- 55208
	recipe = AddRecipe(55208, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37663)
	recipe:SetSkillLevels(450, 450, 450, 450, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 26912, 26962, 26976, 26999, 28698, 46357)

	-- Smelt Titanium -- 55211
	recipe = AddRecipe(55211, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41163)
	recipe:SetSkillLevels(450, 450, 450, 450, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 26912, 26962, 26976, 26999, 28698, 46357)

	-- Enchanted Thorium -- 70524
	recipe = AddRecipe(70524, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(12655)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 18747, 28698, 46357)

	-- Smelt Pyrite -- 74529
	recipe = AddRecipe(74529, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(51950)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663, 18747, 46357)

	-- Smelt Elementium -- 74530
	recipe = AddRecipe(74530, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52186)
	recipe:SetSkillLevels(475, 475, 475, 475, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663, 18747, 46357)

	-- Smelt Hardened Elementium -- 74537
	recipe = AddRecipe(74537, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(53039)
	recipe:SetSkillLevels(500, 500, 500, 500, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663, 18747, 46357)

	-- Smelt Obsidium -- 84038
	recipe = AddRecipe(84038, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54849)
	recipe:SetSkillLevels(425, 425, 425, 437, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3357, 4254, 5513, 16663, 18747, 46357)

	self.InitSmelting = nil
end
