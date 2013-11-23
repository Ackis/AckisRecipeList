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
local F = private.FILTER_IDS
local A = private.ACQUIRE_TYPES
local Q = private.ITEM_QUALITIES
local V = private.GAME_VERSIONS
local Z = private.ZONE_NAMES

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitSmelting()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, private.PROFESSION_SPELL_IDS.SMELTING, genesis, quality)
	end

	private:InitializeSmeltingTrainers()

	local recipe

	-------------------------------------------------------------------------------
	-- Classic.
	-------------------------------------------------------------------------------
	-- Smelt Copper -- 2657
	recipe = AddRecipe(2657, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 25, 47, 70)
	recipe:SetCraftedItem(2840, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MISC1)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Smelt Silver -- 2658
	recipe = AddRecipe(2658, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(65, 65, 75, 80, 85)
	recipe:SetCraftedItem(2842, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 47384, 47400, 47418, 47419, 47420, 47431, 48619, 52170, 52642, 57620, 65043, 65092)

	-- Smelt Bronze -- 2659
	recipe = AddRecipe(2659, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 60, 65, 70)
	recipe:SetCraftedItem(2841, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 47384, 47400, 47418, 47419, 47420, 47431, 48619, 52170, 52642, 57620, 65043, 65092)

	-- Smelt Tin -- 3304
	recipe = AddRecipe(3304, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 60, 65, 70)
	recipe:SetCraftedItem(3576, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 47384, 47400, 47418, 47419, 47420, 47431, 48619, 52170, 52642, 57620, 65043, 65092)

	-- Smelt Iron -- 3307
	recipe = AddRecipe(3307, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(100, 100, 110, 115, 120)
	recipe:SetCraftedItem(3575, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Gold -- 3308
	recipe = AddRecipe(3308, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(115, 115, 125, 130, 135)
	recipe:SetCraftedItem(3577, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Steel -- 3569
	recipe = AddRecipe(3569, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(125, 125, 135, 140, 145)
	recipe:SetCraftedItem(3859, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Mithril -- 10097
	recipe = AddRecipe(10097, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 160, 165, 170)
	recipe:SetCraftedItem(3860, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Truesilver -- 10098
	recipe = AddRecipe(10098, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(165, 165, 175, 180, 185)
	recipe:SetCraftedItem(6037, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Dark Iron -- 14891
	recipe = AddRecipe(14891, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(230, 230, 300, 305, 310)
	recipe:SetCraftedItem(11371, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddQuest(4083)

	-- Smelt Thorium -- 16153
	recipe = AddRecipe(16153, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 210, 215, 220)
	recipe:SetCraftedItem(12359, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1681, 1701, 3001, 3137, 3175, 3357, 3555, 4254, 4598, 5392, 5513, 8128, 16663, 16752, 17488, 18747, 18779, 18804, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Enchanted Elementium -- 22967
	recipe = AddRecipe(22967, V.ORIG, Q.RARE)
	recipe:SetSkillLevels(300, 300, 350, 362, 375)
	recipe:SetRecipeItem(44956, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(17771, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID)
	recipe:AddMobDrop(14401)

	-------------------------------------------------------------------------------
	-- The Burning Crusade.
	-------------------------------------------------------------------------------
	-- Smelt Fel Iron -- 29356
	recipe = AddRecipe(29356, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 275, 300, 325)
	recipe:SetCraftedItem(23445, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Adamantite -- 29358
	recipe = AddRecipe(29358, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 325, 332, 340)
	recipe:SetCraftedItem(23446, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Eternium -- 29359
	recipe = AddRecipe(29359, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:SetCraftedItem(23447, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Felsteel -- 29360
	recipe = AddRecipe(29360, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 350, 357, 375)
	recipe:SetCraftedItem(23448, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Khorium -- 29361
	recipe = AddRecipe(29361, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:SetCraftedItem(23449, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Hardened Adamantite -- 29686
	recipe = AddRecipe(29686, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:SetCraftedItem(23573, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Earth Shatter -- 35750
	recipe = AddRecipe(35750, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 300, 300)
	recipe:SetCraftedItem(22573, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-- Fire Sunder -- 35751
	recipe = AddRecipe(35751, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 300, 300, 300)
	recipe:SetCraftedItem(22574, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 18779, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 33682, 43431, 46357, 52170, 52642, 65092)

	-------------------------------------------------------------------------------
	-- Wrath of the Lich King.
	-------------------------------------------------------------------------------
	-- Smelt Hardened Khorium -- 46353
	recipe = AddRecipe(46353, V.WOTLK, Q.RARE)
	recipe:SetSkillLevels(375, 375, 375, 375, 375)
	recipe:SetRecipeItem(35273, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35128, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID)
	recipe:AddWorldDrop(Z.SUNWELL_PLATEAU)

	-- Smelt Cobalt -- 49252
	recipe = AddRecipe(49252, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 350, 362, 375)
	recipe:SetCraftedItem(36916, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Saronite -- 49258
	recipe = AddRecipe(49258, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 400)
	recipe:SetCraftedItem(36913, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Titansteel -- 55208
	recipe = AddRecipe(55208, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 450, 450)
	recipe:SetCraftedItem(37663, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Titanium -- 55211
	recipe = AddRecipe(55211, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 450, 450)
	recipe:SetCraftedItem(41163, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 17488, 18747, 26912, 26962, 26976, 26999, 28698, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Enchanted Thorium Bar -- 70524
	recipe = AddRecipe(70524, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:SetCraftedItem(12655, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 5513, 8128, 17488, 18747, 28698, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-------------------------------------------------------------------------------
	-- Cataclysm.
	-------------------------------------------------------------------------------
	-- Smelt Pyrite -- 74529
	recipe = AddRecipe(74529, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetCraftedItem(51950, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 16663, 17488, 18747, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Elementium -- 74530
	recipe = AddRecipe(74530, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 475, 475, 500)
	recipe:SetCraftedItem(52186, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 16663, 17488, 18747, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Hardened Elementium -- 74537
	recipe = AddRecipe(74537, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 525)
	recipe:SetCraftedItem(53039, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 16663, 17488, 18747, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Obsidium -- 84038
	recipe = AddRecipe(84038, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 475)
	recipe:SetCraftedItem(54849, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 16663, 17488, 18747, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-------------------------------------------------------------------------------
	-- Mists of Pandaria.
	-------------------------------------------------------------------------------
	-- Smelt Ghost Iron -- 102165
	recipe = AddRecipe(102165, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 525)
	recipe:SetCraftedItem(72096, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 16663, 17488, 18747, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	-- Smelt Trillium -- 102167
	recipe = AddRecipe(102167, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 600, 600)
	recipe:SetCraftedItem(72095, "BIND_ON_EQUIP")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1443, 1701, 3001, 3357, 4254, 5513, 8128, 16663, 17488, 18747, 33617, 33640, 43431, 46357, 52170, 52642, 65092)

	self.InitSmelting = nil
end
