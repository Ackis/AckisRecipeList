--[[
************************************************************************
Cooking.lua
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

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.FILTER_IDS
local A = private.ACQUIRE_TYPES
local Q = private.ITEM_QUALITIES
local REP = private.REP_LEVELS
local FAC = private.FACTION_IDS
local V = private.GAME_VERSIONS

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitCooking()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, private.PROFESSION_SPELL_IDS.COOKING, genesis, quality)
	end

	private:InitializeCookingTrainers()

	local recipe

	-- Charred Wolf Meat -- 2538
	recipe = AddRecipe(2538, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2679)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Spiced Wolf Meat -- 2539
	recipe = AddRecipe(2539, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2680)
	recipe:SetSkillLevels(10, 10, 50, 70, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Roasted Boar Meat -- 2540
	recipe = AddRecipe(2540, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2681)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Coyote Steak -- 2541
	recipe = AddRecipe(2541, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2684)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Goretusk Liver Pie -- 2542
	recipe = AddRecipe(2542, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(2697)
	recipe:SetCraftedItemID(724)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Westfall Stew -- 2543
	recipe = AddRecipe(2543, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(728)
	recipe:SetCraftedItemID(733)
	recipe:SetSkillLevels(50, 50, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddVendor(340)
	recipe:AddWorldDrop("Westfall")

	-- Crab Cake -- 2544
	recipe = AddRecipe(2544, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2683)
	recipe:SetSkillLevels(75, 75, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Cooked Crab Claw -- 2545
	recipe = AddRecipe(2545, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(2698)
	recipe:SetCraftedItemID(2682)
	recipe:SetSkillLevels(85, 85, 125, 145, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddVendor(340)
	recipe:AddWorldDrop("Darkshore", "Westfall")

	-- Dry Pork Ribs -- 2546
	recipe = AddRecipe(2546, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2687)
	recipe:SetSkillLevels(80, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Redridge Goulash -- 2547
	recipe = AddRecipe(2547, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(2699)
	recipe:SetCraftedItemID(1082)
	recipe:SetSkillLevels(100, 100, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Succulent Pork Ribs -- 2548
	recipe = AddRecipe(2548, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(2700)
	recipe:SetCraftedItemID(2685)
	recipe:SetSkillLevels(110, 110, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddVendor(340)
	recipe:AddWorldDrop("Loch Modan", "Redridge Mountains")

	-- Seasoned Wolf Kabob -- 2549
	recipe = AddRecipe(2549, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(2701)
	recipe:SetCraftedItemID(1017)
	recipe:SetSkillLevels(100, 100, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(26620)

	-- Beer Basted Boar Ribs -- 2795
	recipe = AddRecipe(2795, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(2889)
	recipe:SetCraftedItemID(2888)
	recipe:SetSkillLevels(10, 10, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(384)

	-- Crocolisk Steak -- 3370
	recipe = AddRecipe(3370, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3678)
	recipe:SetCraftedItemID(3662)
	recipe:SetSkillLevels(80, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Blood Sausage -- 3371
	recipe = AddRecipe(3371, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3679)
	recipe:SetCraftedItemID(3220)
	recipe:SetSkillLevels(60, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(26860)

	-- Murloc Fin Soup -- 3372
	recipe = AddRecipe(3372, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3680)
	recipe:SetCraftedItemID(3663)
	recipe:SetSkillLevels(90, 90, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Crocolisk Gumbo -- 3373
	recipe = AddRecipe(3373, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3681)
	recipe:SetCraftedItemID(3664)
	recipe:SetSkillLevels(120, 120, 160, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Curiously Tasty Omelet -- 3376
	recipe = AddRecipe(3376, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3682)
	recipe:SetCraftedItemID(3665)
	recipe:SetSkillLevels(130, 130, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340, 1148, 2821)

	-- Gooey Spider Cake -- 3377
	recipe = AddRecipe(3377, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3683)
	recipe:SetCraftedItemID(3666)
	recipe:SetSkillLevels(110, 110, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(26623)

	-- Big Bear Steak -- 3397
	recipe = AddRecipe(3397, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3734)
	recipe:SetCraftedItemID(3726)
	recipe:SetSkillLevels(110, 110, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(12246, 1)

	-- Hot Lion Chops -- 3398
	recipe = AddRecipe(3398, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3735)
	recipe:SetCraftedItemID(3727)
	recipe:SetSkillLevels(125, 125, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3489, 12245)

	-- Tasty Lion Steak -- 3399
	recipe = AddRecipe(3399, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3736)
	recipe:SetCraftedItemID(3728)
	recipe:SetSkillLevels(150, 150, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Soothing Turtle Bisque -- 3400
	recipe = AddRecipe(3400, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3737)
	recipe:SetCraftedItemID(3729)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Barbecued Buzzard Wing -- 4094
	recipe = AddRecipe(4094, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(4609)
	recipe:SetCraftedItemID(4457)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)
	recipe:AddVendor(2814)
	recipe:AddLimitedVendor(12246, 1)

	-- Kaldorei Spider Kabob -- 6412
	recipe = AddRecipe(6412, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5482)
	recipe:SetCraftedItemID(5472)
	recipe:SetSkillLevels(10, 10, 50, 70, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Scorpid Surprise -- 6413
	recipe = AddRecipe(6413, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5483)
	recipe:SetCraftedItemID(5473)
	recipe:SetSkillLevels(20, 20, 60, 80, 100)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3881)

	-- Roasted Kodo Meat -- 6414
	recipe = AddRecipe(6414, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5484)
	recipe:SetCraftedItemID(5474)
	recipe:SetSkillLevels(35, 35, 75, 95, 115)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3081)

	-- Fillet of Frenzy -- 6415
	recipe = AddRecipe(6415, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5485)
	recipe:SetCraftedItemID(5476)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Strider Stew -- 6416
	recipe = AddRecipe(6416, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5486)
	recipe:SetCraftedItemID(5477)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3482)

	-- Dig Rat Stew -- 6417
	recipe = AddRecipe(6417, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(78342)
	recipe:SetCraftedItemID(5478)
	recipe:SetSkillLevels(90, 90, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(3444)

	-- Crispy Lizard Tail -- 6418
	recipe = AddRecipe(6418, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5488)
	recipe:SetCraftedItemID(5479)
	recipe:SetSkillLevels(100, 100, 140, 160, 180)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3482)

	-- Lean Venison -- 6419
	recipe = AddRecipe(6419, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5489)
	recipe:SetCraftedItemID(5480)
	recipe:SetSkillLevels(110, 110, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(12245, 1)

	-- Boiled Clams -- 6499
	recipe = AddRecipe(6499, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5525)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Goblin Deviled Clams -- 6500
	recipe = AddRecipe(6500, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5527)
	recipe:SetSkillLevels(125, 125, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Clam Chowder -- 6501
	recipe = AddRecipe(6501, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5528)
	recipe:SetCraftedItemID(5526)
	recipe:SetSkillLevels(90, 90, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(4305)

	-- Giant Clam Scorcho -- 7213
	recipe = AddRecipe(7213, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6039)
	recipe:SetCraftedItemID(6038)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2664)

	-- Brilliant Smallfish -- 7751
	recipe = AddRecipe(7751, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6325)
	recipe:SetCraftedItemID(6290)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(66, 1684, 3029, 3550, 4265, 4574, 5494, 5940, 8508)

	-- Slitherskin Mackerel -- 7752
	recipe = AddRecipe(7752, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6326)
	recipe:SetCraftedItemID(787)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3550, 4305, 5162, 5942, 10118)

	-- Longjaw Mud Snapper -- 7753
	recipe = AddRecipe(7753, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6328)
	recipe:SetCraftedItemID(4592)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(66, 1684, 3027, 4265, 4574, 5162, 5748, 5940)

	-- Loch Frenzy Delight -- 7754
	recipe = AddRecipe(7754, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6329)
	recipe:SetCraftedItemID(6316)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1684)

	-- Bristle Whisker Catfish -- 7755
	recipe = AddRecipe(7755, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6330)
	recipe:SetCraftedItemID(4593)
	recipe:SetSkillLevels(100, 100, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2397, 3027, 3029, 3497, 4553, 5494)

	-- Rainbow Fin Albacore -- 7827
	recipe = AddRecipe(7827, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6368)
	recipe:SetCraftedItemID(5095)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3178, 3333, 3497, 4305, 4553, 5494, 5748, 5942, 10118)

	-- Rockscale Cod -- 7828
	recipe = AddRecipe(7828, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6369)
	recipe:SetCraftedItemID(4594)
	recipe:SetSkillLevels(175, 175, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664, 3178, 3333, 4574, 5162, 12033, 12962)

	-- Savory Deviate Delight -- 8238
	recipe = AddRecipe(8238, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6661)
	recipe:SetCraftedItemID(6657)
	recipe:SetSkillLevels(85, 85, 125, 145, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northern Barrens", "Southern Barrens")

	-- Herb Baked Egg -- 8604
	recipe = AddRecipe(8604, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6888)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Smoked Bear Meat -- 8607
	recipe = AddRecipe(8607, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6892)
	recipe:SetCraftedItemID(6890)
	recipe:SetSkillLevels(40, 40, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1465, 3556)

	-- Thistle Tea -- 9513
	recipe = AddRecipe(9513, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18160)
	recipe:SetCraftedItemID(7676)
	recipe:SetSkillLevels(60, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddVendor(6779)

	-- Goldthorn Tea -- 13028
	recipe = AddRecipe(13028, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10841)
	recipe:SetSkillLevels(175, 175, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom("HENRY_STERN_RFD")

	-- Lean Wolf Steak -- 15853
	recipe = AddRecipe(15853, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12227)
	recipe:SetCraftedItemID(12209)
	recipe:SetSkillLevels(125, 125, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(12246, 1)

	-- Roast Raptor -- 15855
	recipe = AddRecipe(15855, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12228)
	recipe:SetCraftedItemID(12210)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(734, 1148, 2810, 2821, 4879, 4897, 12245)

	-- Hot Wolf Ribs -- 15856
	recipe = AddRecipe(15856, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12229)
	recipe:SetCraftedItemID(13851)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(7947, 8145)
	recipe:AddLimitedVendor(12246, 1)

	-- Jungle Stew -- 15861
	recipe = AddRecipe(15861, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12231)
	recipe:SetCraftedItemID(12212)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(734, 1148, 12245)

	-- Carrion Surprise -- 15863
	recipe = AddRecipe(15863, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12232)
	recipe:SetCraftedItemID(12213)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(989, 4879, 9636, 12245)

	-- Mystery Stew -- 15865
	recipe = AddRecipe(15865, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12233)
	recipe:SetCraftedItemID(12214)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(4897, 8150)
	recipe:AddLimitedVendor(12246, 1)

	-- Dragonbreath Chili -- 15906
	recipe = AddRecipe(15906, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12239)
	recipe:SetCraftedItemID(12217)
	recipe:SetSkillLevels(200, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(4879, 4897)
	recipe:AddLimitedVendor(12246, 1)

	-- Heavy Kodo Stew -- 15910
	recipe = AddRecipe(15910, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12240)
	recipe:SetCraftedItemID(12215)
	recipe:SetSkillLevels(200, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(8150, 9636, 12245)

	-- Spiced Chili Crab -- 15915
	recipe = AddRecipe(15915, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16111)
	recipe:SetCraftedItemID(12216)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(989, 1149, 4305)

	-- Monster Omelet -- 15933
	recipe = AddRecipe(15933, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16110)
	recipe:SetCraftedItemID(12218)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2803, 11187)

	-- Crispy Bat Wing -- 15935
	recipe = AddRecipe(15935, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12226)
	recipe:SetCraftedItemID(12224)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2118)

	-- Spotted Yellowtail -- 18238
	recipe = AddRecipe(18238, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13939)
	recipe:SetCraftedItemID(6887)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Cooked Glossy Mightfish -- 18239
	recipe = AddRecipe(18239, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13940)
	recipe:SetCraftedItemID(13927)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664)

	-- Grilled Squid -- 18240
	recipe = AddRecipe(18240, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13942)
	recipe:SetCraftedItemID(13928)
	recipe:SetSkillLevels(240, 240, 265, 277, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Filet of Redgill -- 18241
	recipe = AddRecipe(18241, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13941)
	recipe:SetCraftedItemID(13930)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664)

	-- Hot Smoked Bass -- 18242
	recipe = AddRecipe(18242, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13943)
	recipe:SetCraftedItemID(13929)
	recipe:SetSkillLevels(240, 240, 265, 277, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2664)

	-- Nightfin Soup -- 18243
	recipe = AddRecipe(18243, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13945)
	recipe:SetCraftedItemID(13931)
	recipe:SetSkillLevels(250, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Poached Sunscale Salmon -- 18244
	recipe = AddRecipe(18244, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13946)
	recipe:SetCraftedItemID(13932)
	recipe:SetSkillLevels(250, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Lobster Stew -- 18245
	recipe = AddRecipe(18245, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13947)
	recipe:SetCraftedItemID(13933)
	recipe:SetSkillLevels(275, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(7947, 8145)

	-- Mightfish Steak -- 18246
	recipe = AddRecipe(18246, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13948)
	recipe:SetCraftedItemID(13934)
	recipe:SetSkillLevels(275, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664, 7947, 8145)

	-- Baked Salmon -- 18247
	recipe = AddRecipe(18247, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13949)
	recipe:SetCraftedItemID(13935)
	recipe:SetSkillLevels(275, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(7947, 8145)

	-- Undermine Clam Chowder -- 20626
	recipe = AddRecipe(20626, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16767)
	recipe:SetCraftedItemID(16766)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(48060, 3, 54232, 1)

	-- Mithril Head Trout -- 20916
	recipe = AddRecipe(20916, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17062)
	recipe:SetCraftedItemID(8364)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664, 3178, 3333, 4574, 5162, 12033, 12962)

	-- Gingerbread Cookie -- 21143
	recipe = AddRecipe(21143, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17200)
	recipe:SetCraftedItemID(17197)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(13420, 13429, 13432, 13433, 13435, 23010, 23012, 23064)
	recipe:AddSeason("WINTER_VEIL")

	-- Egg Nog -- 21144
	recipe = AddRecipe(21144, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17201)
	recipe:SetCraftedItemID(17198)
	recipe:SetSkillLevels(35, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(13420, 13429, 13432, 13433, 13435, 23010, 23012, 23064)
	recipe:AddSeason("WINTER_VEIL")

	-- Spider Sausage -- 21175
	recipe = AddRecipe(21175, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(17222)
	recipe:SetSkillLevels(200, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Tender Wolf Steak -- 22480
	recipe = AddRecipe(22480, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18046)
	recipe:SetCraftedItemID(18045)
	recipe:SetSkillLevels(225, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(4782, 7733, 40589)

	-- Runn Tum Tuber Surprise -- 22761
	recipe = AddRecipe(22761, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18267)
	recipe:SetCraftedItemID(18254)
	recipe:SetSkillLevels(275, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(14354)

	-- Heavy Crocolisk Stew -- 24418
	recipe = AddRecipe(24418, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20075)
	recipe:SetCraftedItemID(20074)
	recipe:SetSkillLevels(150, 150, 160, 180, 200)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(4879)

	-- Smoked Desert Dumplings -- 24801
	recipe = AddRecipe(24801, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(20452)
	recipe:SetSkillLevels(285, 285, 310, 322, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.DPS)
	recipe:AddQuest(8313)

	-- Dirge's Kickin' Chimaerok Chops -- 25659
	recipe = AddRecipe(25659, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(21025)
	recipe:SetCraftedItemID(21023)
	recipe:SetSkillLevels(300, 300, 325, 337, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Smoked Sagefish -- 25704
	recipe = AddRecipe(25704, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(21099)
	recipe:SetCraftedItemID(21072)
	recipe:SetSkillLevels(80, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2397, 2664, 3027, 3085, 3400, 4223, 4265, 4553, 5160, 5483, 8307, 12033, 14738, 16253, 16677, 16718, 17246, 19195, 26868, 48060, 54232)

	-- Sagefish Delight -- 25954
	recipe = AddRecipe(25954, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(21219)
	recipe:SetCraftedItemID(21217)
	recipe:SetSkillLevels(175, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2397, 2664, 3027, 3085, 3400, 4223, 4265, 4553, 5160, 5483, 8307, 12033, 14738, 16253, 16677, 16718, 17246, 19195, 26868, 48060, 54232)

	-- Crunchy Spider Surprise -- 28267
	recipe = AddRecipe(28267, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22647)
	recipe:SetCraftedItemID(22645)
	recipe:SetSkillLevels(60, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16253, 18427)
	recipe:AddQuest(9171)

	-- Lynx Steak -- 33276
	recipe = AddRecipe(33276, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27685)
	recipe:SetCraftedItemID(27635)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16262)

	-- Roasted Moongraze Tenderloin -- 33277
	recipe = AddRecipe(33277, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27686)
	recipe:SetCraftedItemID(24105)
	recipe:SetSkillLevels(1, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddQuest(9454)

	-- Bat Bites -- 33278
	recipe = AddRecipe(33278, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27687)
	recipe:SetCraftedItemID(27636)
	recipe:SetSkillLevels(50, 50, 90, 110, 130)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16253)

	-- Buzzard Bites -- 33279
	recipe = AddRecipe(33279, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27684)
	recipe:SetCraftedItemID(27651)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddQuest(9356)

	-- Ravager Dog -- 33284
	recipe = AddRecipe(33284, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27688)
	recipe:SetCraftedItemID(27655)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16585, 16826)

	-- Blackened Basilisk -- 33286
	recipe = AddRecipe(33286, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27690)
	recipe:SetCraftedItemID(27657)
	recipe:SetSkillLevels(315, 315, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18957, 19038)

	-- Roasted Clefthoof -- 33287
	recipe = AddRecipe(33287, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27691)
	recipe:SetCraftedItemID(27658)
	recipe:SetSkillLevels(325, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(20096, 20097)

	-- Warp Burger -- 33288
	recipe = AddRecipe(33288, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27692)
	recipe:SetCraftedItemID(27659)
	recipe:SetSkillLevels(325, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(18957, 19038)

	-- Talbuk Steak -- 33289
	recipe = AddRecipe(33289, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27693)
	recipe:SetCraftedItemID(27660)
	recipe:SetSkillLevels(325, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(20096, 20097)

	-- Blackened Trout -- 33290
	recipe = AddRecipe(33290, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27694)
	recipe:SetCraftedItemID(27661)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(18015, 20028)

	-- Feltail Delight -- 33291
	recipe = AddRecipe(33291, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27695)
	recipe:SetCraftedItemID(27662)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18011, 20028)

	-- Blackened Sporefish -- 33292
	recipe = AddRecipe(33292, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27696)
	recipe:SetCraftedItemID(27663)
	recipe:SetSkillLevels(310, 310, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18911)

	-- Grilled Mudfish -- 33293
	recipe = AddRecipe(33293, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27697)
	recipe:SetCraftedItemID(27664)
	recipe:SetSkillLevels(320, 320, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(20096, 20097)

	-- Poached Bluefish -- 33294
	recipe = AddRecipe(33294, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27698)
	recipe:SetCraftedItemID(27665)
	recipe:SetSkillLevels(320, 320, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(20096, 20097)

	-- Golden Fish Sticks -- 33295
	recipe = AddRecipe(33295, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27699)
	recipe:SetCraftedItemID(27666)
	recipe:SetSkillLevels(325, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18960, 19296)

	-- Spicy Crawdad -- 33296
	recipe = AddRecipe(33296, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(27700)
	recipe:SetCraftedItemID(27667)
	recipe:SetSkillLevels(350, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18960, 19296)

	-- Clam Bar -- 36210
	recipe = AddRecipe(36210, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30156)
	recipe:SetCraftedItemID(30155)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18382)

	-- Spice Bread -- 37836
	recipe = AddRecipe(37836, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30816)
	recipe:SetSkillLevels(1, 1, 30, 35, 38)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 2818, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Mok'Nathal Shortribs -- 38867
	recipe = AddRecipe(38867, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(31675)
	recipe:SetCraftedItemID(31672)
	recipe:SetSkillLevels(335, 335, 355, 365, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(21113)
	recipe:AddLimitedVendor(20916, 1)
	recipe:AddQuest(10860)

	-- Crunchy Serpent -- 38868
	recipe = AddRecipe(38868, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(31674)
	recipe:SetCraftedItemID(31673)
	recipe:SetSkillLevels(335, 335, 355, 365, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(21113)
	recipe:AddLimitedVendor(20916, 1)
	recipe:AddQuest(10860)

	-- Stewed Trout -- 42296
	recipe = AddRecipe(42296, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(33048)
	recipe:SetSkillLevels(320, 320, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 19186, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Fisherman's Feast -- 42302
	recipe = AddRecipe(42302, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(33052)
	recipe:SetSkillLevels(350, 350, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 19186, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Hot Buttered Trout -- 42305
	recipe = AddRecipe(42305, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(33053)
	recipe:SetSkillLevels(350, 350, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 19186, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Skullfish Soup -- 43707
	recipe = AddRecipe(43707, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(33870)
	recipe:SetCraftedItemID(33825)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom("DAILY_COOKING_FISH")

	-- Stormchops -- 43758
	recipe = AddRecipe(43758, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33871)
	recipe:SetCraftedItemID(33866)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11377, 11379, 11380, 11381, 13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116)
	recipe:AddCustom("DAILY_COOKING_DAL", "DAILY_COOKING_FISH", "DAILY_COOKING_MEAT")

	-- Broiled Bloodfin -- 43761
	recipe = AddRecipe(43761, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(33869)
	recipe:SetCraftedItemID(33867)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom("DAILY_COOKING_FISH")

	-- Spicy Hot Talbuk -- 43765
	recipe = AddRecipe(43765, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(33873)
	recipe:SetCraftedItemID(33872)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom("DAILY_COOKING_MEAT")

	-- Kibler's Bits -- 43772
	recipe = AddRecipe(43772, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(33875)
	recipe:SetCraftedItemID(33874)
	recipe:SetSkillLevels(300, 300, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom("DAILY_COOKING_FISH", "DAILY_COOKING_MEAT")

	-- Delicious Chocolate Cake -- 43779
	recipe = AddRecipe(43779, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33925)
	recipe:SetCraftedItemID(33924)
	recipe:SetSkillLevels(1, 1, 50, 62, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11377, 11379, 11380, 11381, 13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116)
	recipe:AddCustom("DAILY_COOKING_DAL", "DAILY_COOKING_FISH", "DAILY_COOKING_MEAT")

	-- Hot Apple Cider -- 45022
	recipe = AddRecipe(45022, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(34413)
	recipe:SetCraftedItemID(34411)
	recipe:SetSkillLevels(325, 325, 325, 325, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(13420, 13433)
	recipe:AddSeason("WINTER_VEIL")

	-- Mammoth Meal -- 45549
	recipe = AddRecipe(45549, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34748)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Shoveltusk Steak -- 45550
	recipe = AddRecipe(45550, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34749)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Worm Delight -- 45551
	recipe = AddRecipe(45551, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34750)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Roasted Worg -- 45552
	recipe = AddRecipe(45552, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34751)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Rhino Dogs -- 45553
	recipe = AddRecipe(45553, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34752)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Great Feast -- 45554
	recipe = AddRecipe(45554, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34753)
	recipe:SetSkillLevels(375, 375, 375, 400, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Mega Mammoth Meal -- 45555
	recipe = AddRecipe(45555, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43018)
	recipe:SetCraftedItemID(34754)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Tender Shoveltusk Steak -- 45556
	recipe = AddRecipe(45556, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43019)
	recipe:SetCraftedItemID(34755)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spiced Worm Burger -- 45557
	recipe = AddRecipe(45557, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43020)
	recipe:SetCraftedItemID(34756)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Very Burnt Worg -- 45558
	recipe = AddRecipe(45558, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43021)
	recipe:SetCraftedItemID(34757)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Mighty Rhino Dogs -- 45559
	recipe = AddRecipe(45559, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43022)
	recipe:SetCraftedItemID(34758)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Smoked Rockfin -- 45560
	recipe = AddRecipe(45560, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34759)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Grilled Bonescale -- 45561
	recipe = AddRecipe(45561, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34760)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Sauteed Goby -- 45562
	recipe = AddRecipe(45562, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34761)
	recipe:SetSkillLevels(350, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Grilled Sculpin -- 45563
	recipe = AddRecipe(45563, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34762)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Smoked Salmon -- 45564
	recipe = AddRecipe(45564, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34763)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Poached Nettlefish -- 45565
	recipe = AddRecipe(45565, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34764)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Pickled Fangtooth -- 45566
	recipe = AddRecipe(45566, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34765)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Poached Northern Sculpin -- 45567
	recipe = AddRecipe(45567, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43023)
	recipe:SetCraftedItemID(34766)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Firecracker Salmon -- 45568
	recipe = AddRecipe(45568, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43024)
	recipe:SetCraftedItemID(34767)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Baked Manta Ray -- 45569
	recipe = AddRecipe(45569, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42942)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Imperial Manta Steak -- 45570
	recipe = AddRecipe(45570, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43026)
	recipe:SetCraftedItemID(34769)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spicy Blue Nettlefish -- 45571
	recipe = AddRecipe(45571, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43025)
	recipe:SetCraftedItemID(34768)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Captain Rumsey's Lager -- 45695
	recipe = AddRecipe(45695, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(34834)
	recipe:SetCraftedItemID(34832)
	recipe:SetSkillLevels(100, 100, 100, 105, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11666, 11667, 11668, 11669, 13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116)
	recipe:AddCustom("DAILY_COOKING_DAL", "DAILY_FISHING_SHATT")

	-- Charred Bear Kabobs -- 46684
	recipe = AddRecipe(46684, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(35564)
	recipe:SetCraftedItemID(35563)
	recipe:SetSkillLevels(250, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)
	recipe:AddVendor(2803)

	-- Juicy Bear Burger -- 46688
	recipe = AddRecipe(46688, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(35566)
	recipe:SetCraftedItemID(35565)
	recipe:SetSkillLevels(250, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)
	recipe:AddVendor(2803)

	-- Kungaloosh -- 53056
	recipe = AddRecipe(53056, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(39644)
	recipe:SetCraftedItemID(39520)
	recipe:SetSkillLevels(375, 375, 375, 387, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(13571)
	recipe:AddCustom("KUNG")

	-- Northern Stew -- 57421
	recipe = AddRecipe(57421, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(34747)
	recipe:SetSkillLevels(350, 350, 350, 362, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(13087, 13088, 13089, 13090)

	-- Fish Feast -- 57423
	recipe = AddRecipe(57423, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43017)
	recipe:SetCraftedItemID(43015)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spicy Fried Herring -- 57433
	recipe = AddRecipe(57433, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43027)
	recipe:SetCraftedItemID(42993)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Rhinolicious Wormsteak -- 57434
	recipe = AddRecipe(57434, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43028)
	recipe:SetCraftedItemID(42994)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(31031, 31032, 33595)

	-- Critter Bites -- 57435
	recipe = AddRecipe(57435, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43029)
	recipe:SetCraftedItemID(43004)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Hearty Rhino -- 57436
	recipe = AddRecipe(57436, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43030)
	recipe:SetCraftedItemID(42995)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Snapper Extreme -- 57437
	recipe = AddRecipe(57437, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43031)
	recipe:SetCraftedItemID(42996)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Blackened Worg Steak -- 57438
	recipe = AddRecipe(57438, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43032)
	recipe:SetCraftedItemID(42997)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Cuttlesteak -- 57439
	recipe = AddRecipe(57439, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43033)
	recipe:SetCraftedItemID(42998)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spiced Mammoth Treats -- 57440
	recipe = AddRecipe(57440, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43034)
	recipe:SetCraftedItemID(43005)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Blackened Dragonfin -- 57441
	recipe = AddRecipe(57441, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43035)
	recipe:SetCraftedItemID(42999)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Dragonfin Filet -- 57442
	recipe = AddRecipe(57442, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43036)
	recipe:SetCraftedItemID(43000)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Tracker Snacks -- 57443
	recipe = AddRecipe(57443, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43037)
	recipe:SetCraftedItemID(43001)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Dalaran Clam Chowder -- 58065
	recipe = AddRecipe(58065, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43268)
	recipe:SetSkillLevels(350, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Tasty Cupcake -- 58512
	recipe = AddRecipe(58512, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43507)
	recipe:SetCraftedItemID(43490)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Last Week's Mammoth -- 58521
	recipe = AddRecipe(58521, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43508)
	recipe:SetCraftedItemID(43488)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Bad Clams -- 58523
	recipe = AddRecipe(58523, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43509)
	recipe:SetCraftedItemID(43491)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Haunted Herring -- 58525
	recipe = AddRecipe(58525, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43510)
	recipe:SetCraftedItemID(43492)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Gigantic Feast -- 58527
	recipe = AddRecipe(58527, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43505)
	recipe:SetCraftedItemID(43478)
	recipe:SetSkillLevels(425, 425, 435, 455, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Small Feast -- 58528
	recipe = AddRecipe(58528, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(43506)
	recipe:SetCraftedItemID(43480)
	recipe:SetSkillLevels(425, 425, 435, 455, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Pumpkin Pie -- 62044
	recipe = AddRecipe(62044, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44836)
	recipe:SetSkillLevels(100, 100, 150, 162, 175)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Slow-Roasted Turkey -- 62045
	recipe = AddRecipe(62045, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44839)
	recipe:SetSkillLevels(330, 330, 330, 342, 355)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP, F.DPS)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Cranberry Chutney -- 62049
	recipe = AddRecipe(62049, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44840)
	recipe:SetSkillLevels(210, 210, 210, 222, 235)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Spice Bread Stuffing -- 62050
	recipe = AddRecipe(62050, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44837)
	recipe:SetSkillLevels(90, 90, 90, 102, 115)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Candied Sweet Potato -- 62051
	recipe = AddRecipe(62051, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44839)
	recipe:SetSkillLevels(270, 270, 270, 282, 295)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Worg Tartare -- 62350
	recipe = AddRecipe(62350, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44954)
	recipe:SetCraftedItemID(44953)
	recipe:SetSkillLevels(400, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Clamlette Magnifique -- 64054
	recipe = AddRecipe(64054, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33004)
	recipe:SetSkillLevels(250, 250, 250, 275, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddQuest(6610)

	-- Black Jelly -- 64358
	recipe = AddRecipe(64358, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45932)
	recipe:SetSkillLevels(400, 400, 400, 412, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Bread of the Dead -- 65454
	recipe = AddRecipe(65454, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(46691)
	recipe:SetSkillLevels(45, 45, 55, 60, 65)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason("DAY_OF_THE_DEAD")
	recipe:AddVendor(34382)

	-- Candied Sweet Potato -- 66034
	recipe = AddRecipe(66034, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44839)
	recipe:SetSkillLevels(270, 270, 270, 282, 295)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Cranberry Chutney -- 66035
	recipe = AddRecipe(66035, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44840)
	recipe:SetSkillLevels(210, 210, 210, 222, 235)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Pumpkin Pie -- 66036
	recipe = AddRecipe(66036, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44836)
	recipe:SetSkillLevels(100, 100, 150, 162, 175)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Slow-Roasted Turkey -- 66037
	recipe = AddRecipe(66037, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44839)
	recipe:SetSkillLevels(330, 330, 330, 342, 355)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.DPS)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Spice Bread Stuffing -- 66038
	recipe = AddRecipe(66038, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44837)
	recipe:SetSkillLevels(90, 90, 90, 102, 115)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason("PILGRIMS_BOUNTY")

	-- Baked Rockfish -- 88003
	recipe = AddRecipe(88003, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65426)
	recipe:SetCraftedItemID(62661)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Basilisk Liverdog -- 88004
	recipe = AddRecipe(88004, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65427)
	recipe:SetCraftedItemID(62665)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Beer-Basted Crocolisk -- 88005
	recipe = AddRecipe(88005, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65429)
	recipe:SetCraftedItemID(62670)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Blackened Surprise -- 88006
	recipe = AddRecipe(88006, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62676)
	recipe:SetSkillLevels(425, 425, 450, 457, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Broiled Dragon Feast -- 88011
	recipe = AddRecipe(88011, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(62289)
	recipe:SetSkillLevels(500, 500, 500, 500, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5467)

	-- Broiled Mountain Trout -- 88012
	recipe = AddRecipe(88012, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65411)
	recipe:SetCraftedItemID(62655)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Chocolate Cookie -- 88013
	recipe = AddRecipe(88013, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65431)
	recipe:SetCraftedItemID(62680)
	recipe:SetSkillLevels(505, 505, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Crocolisk Au Gratin -- 88014
	recipe = AddRecipe(88014, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65430)
	recipe:SetCraftedItemID(62664)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Darkbrew Lager -- 88015
	recipe = AddRecipe(88015, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62790)
	recipe:SetSkillLevels(415, 415, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Delicious Sagefish Tail -- 88016
	recipe = AddRecipe(88016, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65422)
	recipe:SetCraftedItemID(62666)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Feathered Lure -- 88017
	recipe = AddRecipe(88017, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65408)
	recipe:SetSkillLevels(450, 450, 450, 455, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Fish Fry -- 88018
	recipe = AddRecipe(88018, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65423)
	recipe:SetCraftedItemID(62677)
	recipe:SetSkillLevels(475, 475, 490, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Fortune Cookie -- 88019
	recipe = AddRecipe(88019, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65432)
	recipe:SetCraftedItemID(62649)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Grilled Dragon -- 88020
	recipe = AddRecipe(88020, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65428)
	recipe:SetCraftedItemID(62662)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Hearty Seafood Soup -- 88021
	recipe = AddRecipe(88021, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65418)
	recipe:SetCraftedItemID(62659)
	recipe:SetSkillLevels(475, 475, 490, 497, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Highland Spirits -- 88022
	recipe = AddRecipe(88022, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65415)
	recipe:SetCraftedItemID(62674)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Lavascale Fillet -- 88024
	recipe = AddRecipe(88024, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65407)
	recipe:SetCraftedItemID(62654)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Lavascale Minestrone -- 88025
	recipe = AddRecipe(88025, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65409)
	recipe:SetCraftedItemID(62663)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Lightly Fried Lurker -- 88028
	recipe = AddRecipe(88028, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65412)
	recipe:SetCraftedItemID(62651)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Lurker Lunch -- 88030
	recipe = AddRecipe(88030, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65416)
	recipe:SetCraftedItemID(62657)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Mushroom Sauce Mudfish -- 88031
	recipe = AddRecipe(88031, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65420)
	recipe:SetCraftedItemID(62667)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Pickled Guppy -- 88033
	recipe = AddRecipe(88033, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65417)
	recipe:SetCraftedItemID(62660)
	recipe:SetSkillLevels(475, 475, 490, 497, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Blackbelly Sushi -- 88034
	recipe = AddRecipe(88034, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65424)
	recipe:SetCraftedItemID(62668)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Salted Eye -- 88035
	recipe = AddRecipe(88035, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65410)
	recipe:SetCraftedItemID(62653)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Seafood Magnifique Feast -- 88036
	recipe = AddRecipe(88036, V.CATA, Q.RARE)
	recipe:SetCraftedItemID(62290)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5036)

	-- Seasoned Crab -- 88037
	recipe = AddRecipe(88037, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65413)
	recipe:SetCraftedItemID(62652)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Severed Sagefish Head -- 88039
	recipe = AddRecipe(88039, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65421)
	recipe:SetCraftedItemID(62671)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Skewered Eel -- 88042
	recipe = AddRecipe(88042, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65425)
	recipe:SetCraftedItemID(62669)
	recipe:SetSkillLevels(500, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- South Island Iced Tea -- 88044
	recipe = AddRecipe(88044, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65433)
	recipe:SetCraftedItemID(62672)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Starfire Espresso -- 88045
	recipe = AddRecipe(88045, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65414)
	recipe:SetCraftedItemID(62675)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Tender Baked Turtle -- 88046
	recipe = AddRecipe(88046, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65419)
	recipe:SetCraftedItemID(62658)
	recipe:SetSkillLevels(475, 475, 490, 497, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Whitecrest Gumbo -- 88047
	recipe = AddRecipe(88047, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(65406)
	recipe:SetCraftedItemID(62656)
	recipe:SetSkillLevels(450, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	-- Venison Jerky -- 93741
	recipe = AddRecipe(93741, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67230)
	recipe:SetSkillLevels(40, 40, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE)
	recipe:AddTrainer(1382, 2818, 3026, 3399, 4210, 4552, 5482, 6286, 16253, 18993, 19185, 26953, 26972, 29631, 33587, 33619, 45550, 46709, 47405, 49789, 54232)

	-- Scalding Murglesnout -- 96133
	recipe = AddRecipe(96133, V.CATA, Q.UNCOMMON)
	recipe:SetRecipeItemID(68688)
	recipe:SetCraftedItemID(68687)
	recipe:SetSkillLevels(500, 500, 500, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(3027, 4223, 4553, 5160, 49701, 49737)

	self.InitCooking = nil
end
