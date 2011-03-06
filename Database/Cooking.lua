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
local REP = private.rep_levels
local FAC = private.faction_ids
local V = private.game_versions

local initialized = false
local num_recipes = 0

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level)
	num_recipes = num_recipes + 1
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 2550, nil, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitCooking()
	if initialized then
		return num_recipes
	end
	initialized = true

	local recipe

	-- Charred Wolf Meat -- 2538
	recipe = AddRecipe(2538, 1, 2679, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Spiced Wolf Meat -- 2539
	recipe = AddRecipe(2539, 10, 2680, Q.COMMON, V.ORIG, 10, 50, 70, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Roasted Boar Meat -- 2540
	recipe = AddRecipe(2540, 1, 2681, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Coyote Steak -- 2541
	recipe = AddRecipe(2541, 50, 2684, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Goretusk Liver Pie -- 2542
	recipe = AddRecipe(2542, 50, 724, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Westfall Stew -- 2543
	recipe = AddRecipe(2543, 50, 733, Q.COMMON, V.ORIG, 50, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddVendor(340)
	recipe:AddWorldDrop("Westfall")

	-- Crab Cake -- 2544
	recipe = AddRecipe(2544, 75, 2683, Q.COMMON, V.ORIG, 75, 115, 135, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Cooked Crab Claw -- 2545
	recipe = AddRecipe(2545, 85, 2682, Q.COMMON, V.ORIG, 85, 125, 145, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddVendor(340)
	recipe:AddWorldDrop("Darkshore", "Westfall")

	-- Dry Pork Ribs -- 2546
	recipe = AddRecipe(2546, 80, 2687, Q.COMMON, V.ORIG, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Redridge Goulash -- 2547
	recipe = AddRecipe(2547, 100, 1082, Q.COMMON, V.ORIG, 100, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Succulent Pork Ribs -- 2548
	recipe = AddRecipe(2548, 110, 2685, Q.COMMON, V.ORIG, 110, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddVendor(340)
	recipe:AddWorldDrop("Loch Modan", "Redridge Mountains")

	-- Seasoned Wolf Kabob -- 2549
	recipe = AddRecipe(2549, 100, 1017, Q.COMMON, V.ORIG, 100, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(26620)

	-- Beer Basted Boar Ribs -- 2795
	recipe = AddRecipe(2795, 10, 2888, Q.COMMON, V.ORIG, 10, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(384)

	-- Crocolisk Steak -- 3370
	recipe = AddRecipe(3370, 80, 3662, Q.COMMON, V.ORIG, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Blood Sausage -- 3371
	recipe = AddRecipe(3371, 60, 3220, Q.COMMON, V.ORIG, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(26860)

	-- Murloc Fin Soup -- 3372
	recipe = AddRecipe(3372, 90, 3663, Q.COMMON, V.ORIG, 90, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Crocolisk Gumbo -- 3373
	recipe = AddRecipe(3373, 120, 3664, Q.COMMON, V.ORIG, 120, 160, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)

	-- Curiously Tasty Omelet -- 3376
	recipe = AddRecipe(3376, 130, 3665, Q.COMMON, V.ORIG, 130, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340, 1148, 2821)

	-- Gooey Spider Cake -- 3377
	recipe = AddRecipe(3377, 110, 3666, Q.COMMON, V.ORIG, 110, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(340)
	recipe:AddQuest(26623)

	-- Big Bear Steak -- 3397
	recipe = AddRecipe(3397, 110, 3726, Q.COMMON, V.ORIG, 110, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(12246, 1)

	-- Hot Lion Chops -- 3398
	recipe = AddRecipe(3398, 125, 3727, Q.COMMON, V.ORIG, 125, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3489, 12245)

	-- Tasty Lion Steak -- 3399
	recipe = AddRecipe(3399, 150, 3728, Q.COMMON, V.ORIG, 150, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Soothing Turtle Bisque -- 3400
	recipe = AddRecipe(3400, 175, 3729, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Barbecued Buzzard Wing -- 4094
	recipe = AddRecipe(4094, 175, 4457, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(2818, 3026, 3399, 4552, 45550, 46709, 47405)
	recipe:AddVendor(2814)
	recipe:AddLimitedVendor(12246, 1)

	-- Kaldorei Spider Kabob -- 6412
	recipe = AddRecipe(6412, 10, 5472, Q.COMMON, V.ORIG, 10, 50, 70, 90)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Scorpid Surprise -- 6413
	recipe = AddRecipe(6413, 20, 5473, Q.COMMON, V.ORIG, 20, 60, 80, 100)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3881)

	-- Roasted Kodo Meat -- 6414
	recipe = AddRecipe(6414, 35, 5474, Q.COMMON, V.ORIG, 35, 75, 95, 115)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3081)

	-- Fillet of Frenzy -- 6415
	recipe = AddRecipe(6415, 50, 5476, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Strider Stew -- 6416
	recipe = AddRecipe(6416, 50, 5477, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3482)

	-- Dig Rat Stew -- 6417
	recipe = AddRecipe(6417, 90, 44977, Q.COMMON, V.WOTLK, 90, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom(48)

	-- Crispy Lizard Tail -- 6418
	recipe = AddRecipe(6418, 100, 5479, Q.COMMON, V.ORIG, 100, 140, 160, 180)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(3482)

	-- Lean Venison -- 6419
	recipe = AddRecipe(6419, 110, 5480, Q.COMMON, V.ORIG, 110, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(12245, 1)

	-- Boiled Clams -- 6499
	recipe = AddRecipe(6499, 50, 5525, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Goblin Deviled Clams -- 6500
	recipe = AddRecipe(6500, 125, 5527, Q.COMMON, V.ORIG, 125, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Clam Chowder -- 6501
	recipe = AddRecipe(6501, 90, 5526, Q.COMMON, V.ORIG, 90, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(4305)

	-- Giant Clam Scorcho -- 7213
	recipe = AddRecipe(7213, 175, 6038, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2664)

	-- Brilliant Smallfish -- 7751
	recipe = AddRecipe(7751, 1, 6290, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(66, 1684, 3029, 3550, 4265, 4574, 5494, 5940, 8508)

	-- Slitherskin Mackerel -- 7752
	recipe = AddRecipe(7752, 1, 787, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3550, 4305, 5162, 5942, 10118)

	-- Longjaw Mud Snapper -- 7753
	recipe = AddRecipe(7753, 50, 4592, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(66, 1684, 3027, 4265, 4574, 5162, 5748, 5940)

	-- Loch Frenzy Delight -- 7754
	recipe = AddRecipe(7754, 50, 6316, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1684)

	-- Bristle Whisker Catfish -- 7755
	recipe = AddRecipe(7755, 100, 4593, Q.COMMON, V.ORIG, 100, 140, 160, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2383, 2397, 3027, 3029, 3497, 4553, 5494)

	-- Rainbow Fin Albacore -- 7827
	recipe = AddRecipe(7827, 50, 5095, Q.COMMON, V.ORIG, 50, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3178, 3333, 3497, 4305, 4553, 5494, 5748, 5942, 10118)

	-- Rockscale Cod -- 7828
	recipe = AddRecipe(7828, 175, 4594, Q.COMMON, V.ORIG, 175, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2383, 2664, 3178, 3333, 4574, 5162, 12033, 12962)

	-- Savory Deviate Delight -- 8238
	recipe = AddRecipe(8238, 85, 6657, Q.UNCOMMON, V.ORIG, 85, 125, 145, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Northern Barrens", "Southern Barrens")

	-- Herb Baked Egg -- 8604
	recipe = AddRecipe(8604, 1, 6888, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(8)

	-- Smoked Bear Meat -- 8607
	recipe = AddRecipe(8607, 40, 6890, Q.COMMON, V.ORIG, 40, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(1465, 3556)

	-- Thistle Tea -- 9513
	recipe = AddRecipe(9513, 60, 7676, Q.UNCOMMON, V.ORIG, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddVendor(6779)

	-- Goldthorn Tea -- 13028
	recipe = AddRecipe(13028, 175, 10841, Q.COMMON, V.ORIG, 175, 175, 190, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom(13)

	-- Lean Wolf Steak -- 15853
	recipe = AddRecipe(15853, 125, 12209, Q.COMMON, V.ORIG, 125, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(12246, 1)

	-- Roast Raptor -- 15855
	recipe = AddRecipe(15855, 175, 12210, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(734, 1148, 2810, 2821, 4879, 4897, 12245)

	-- Hot Wolf Ribs -- 15856
	recipe = AddRecipe(15856, 175, 13851, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(7947, 8145)
	recipe:AddLimitedVendor(12246, 1)

	-- Jungle Stew -- 15861
	recipe = AddRecipe(15861, 175, 12212, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(734, 1148, 12245)

	-- Carrion Surprise -- 15863
	recipe = AddRecipe(15863, 175, 12213, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(989, 4879, 9636, 12245)

	-- Mystery Stew -- 15865
	recipe = AddRecipe(15865, 175, 12214, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(4897, 8150)
	recipe:AddLimitedVendor(12246, 1)

	-- Dragonbreath Chili -- 15906
	recipe = AddRecipe(15906, 200, 12217, Q.COMMON, V.ORIG, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(4879, 4897)
	recipe:AddLimitedVendor(12246, 1)

	-- Heavy Kodo Stew -- 15910
	recipe = AddRecipe(15910, 200, 12215, Q.COMMON, V.ORIG, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(8150, 9636, 12245)

	-- Spiced Chili Crab -- 15915
	recipe = AddRecipe(15915, 225, 12216, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(989, 1149, 4305)

	-- Monster Omelet -- 15933
	recipe = AddRecipe(15933, 225, 12218, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2803, 11187)

	-- Crispy Bat Wing -- 15935
	recipe = AddRecipe(15935, 1, 12224, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2118)

	-- Spotted Yellowtail -- 18238
	recipe = AddRecipe(18238, 225, 6887, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Cooked Glossy Mightfish -- 18239
	recipe = AddRecipe(18239, 225, 13927, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664)

	-- Grilled Squid -- 18240
	recipe = AddRecipe(18240, 240, 13928, Q.COMMON, V.ORIG, 240, 265, 277, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Filet of Redgill -- 18241
	recipe = AddRecipe(18241, 225, 13930, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664)

	-- Hot Smoked Bass -- 18242
	recipe = AddRecipe(18242, 240, 13929, Q.COMMON, V.ORIG, 240, 265, 277, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2664)

	-- Nightfin Soup -- 18243
	recipe = AddRecipe(18243, 250, 13931, Q.COMMON, V.ORIG, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Poached Sunscale Salmon -- 18244
	recipe = AddRecipe(18244, 250, 13932, Q.COMMON, V.ORIG, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Lobster Stew -- 18245
	recipe = AddRecipe(18245, 275, 13933, Q.COMMON, V.ORIG, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(7947, 8145)

	-- Mightfish Steak -- 18246
	recipe = AddRecipe(18246, 275, 13934, Q.COMMON, V.ORIG, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2664, 7947, 8145)

	-- Baked Salmon -- 18247
	recipe = AddRecipe(18247, 275, 13935, Q.COMMON, V.ORIG, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(7947, 8145)

	-- Undermine Clam Chowder -- 20626
	recipe = AddRecipe(20626, 225, 16766, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom(48)

	-- Mithril Head Trout -- 20916
	recipe = AddRecipe(20916, 175, 8364, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(2383, 2664, 3178, 3333, 4574, 5162, 12033, 12962)

	-- Gingerbread Cookie -- 21143
	recipe = AddRecipe(21143, 1, 17197, Q.COMMON, V.ORIG, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(13420, 13429, 13432, 13433, 13435, 23010, 23012, 23064)
	recipe:AddSeason(1)

	-- Egg Nog -- 21144
	recipe = AddRecipe(21144, 35, 17198, Q.COMMON, V.ORIG, 35, 75, 95, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(13420, 13429, 13432, 13433, 13435, 23010, 23012, 23064)
	recipe:AddSeason(1)

	-- Spider Sausage -- 21175
	recipe = AddRecipe(21175, 200, 17222, Q.COMMON, V.ORIG, 200, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Tender Wolf Steak -- 22480
	recipe = AddRecipe(22480, 225, 18045, Q.COMMON, V.ORIG, 225, 250, 262, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(4782, 7733, 8125)

	-- Runn Tum Tuber Surprise -- 22761
	recipe = AddRecipe(22761, 275, 18254, Q.UNCOMMON, V.ORIG, 275, 300, 312, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(14354)

	-- Heavy Crocolisk Stew -- 24418
	recipe = AddRecipe(24418, 150, 20074, Q.COMMON, V.ORIG, 150, 160, 180, 200)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(4879)

	-- Smoked Desert Dumplings -- 24801
	recipe = AddRecipe(24801, 285, 20452, Q.COMMON, V.ORIG, 285, 310, 322, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.DPS)
	recipe:AddQuest(8313)

	-- Dirge's Kickin' Chimaerok Chops -- 25659
	recipe = AddRecipe(25659, 300, 21023, Q.EPIC, V.ORIG, 300, 325, 337, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom(48)

	-- Smoked Sagefish -- 25704
	recipe = AddRecipe(25704, 80, 21072, Q.COMMON, V.ORIG, 80, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2397, 2664, 3027, 3085, 3400, 4223, 4265, 4553, 5160, 5483, 8307, 12033, 14738, 16253, 16677, 16718, 17246, 19195, 26868)

	-- Sagefish Delight -- 25954
	recipe = AddRecipe(25954, 175, 21217, Q.COMMON, V.ORIG, 175, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2397, 2664, 3027, 3085, 3400, 4223, 4265, 4553, 5160, 5483, 8307, 12033, 14738, 16253, 16677, 16718, 17246, 19195, 26868)

	-- Crunchy Spider Surprise -- 28267
	recipe = AddRecipe(28267, 60, 22645, Q.COMMON, V.TBC, 60, 100, 120, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16253, 18427)
	recipe:AddQuest(9171)

	-- Lynx Steak -- 33276
	recipe = AddRecipe(33276, 1, 27635, Q.COMMON, V.TBC, 1, 45, 65, 85)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16262)

	-- Roasted Moongraze Tenderloin -- 33277
	recipe = AddRecipe(33277, 1, 24105, Q.COMMON, V.TBC, 1, 45, 65, 85)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddQuest(9454)

	-- Bat Bites -- 33278
	recipe = AddRecipe(33278, 50, 27636, Q.COMMON, V.TBC, 50, 90, 110, 130)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16253)

	-- Buzzard Bites -- 33279
	recipe = AddRecipe(33279, 300, 27651, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddQuest(9356)

	-- Ravager Dog -- 33284
	recipe = AddRecipe(33284, 300, 27655, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(16585, 16826)

	-- Sporeling Snack -- 33285
	recipe = AddRecipe(33285, 310, 27656, Q.COMMON, V.TBC, 310, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18382)

	-- Blackened Basilisk -- 33286
	recipe = AddRecipe(33286, 315, 27657, Q.COMMON, V.TBC, 315, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18957, 19038)

	-- Roasted Clefthoof -- 33287
	recipe = AddRecipe(33287, 325, 27658, Q.COMMON, V.TBC, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(20096, 20097)

	-- Warp Burger -- 33288
	recipe = AddRecipe(33288, 325, 27659, Q.COMMON, V.TBC, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(18957, 19038)

	-- Talbuk Steak -- 33289
	recipe = AddRecipe(33289, 325, 27660, Q.COMMON, V.TBC, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(20096, 20097)

	-- Blackened Trout -- 33290
	recipe = AddRecipe(33290, 300, 27661, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(18015, 20028)

	-- Feltail Delight -- 33291
	recipe = AddRecipe(33291, 300, 27662, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18011, 20028)

	-- Blackened Sporefish -- 33292
	recipe = AddRecipe(33292, 310, 27663, Q.COMMON, V.TBC, 310, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18911)

	-- Grilled Mudfish -- 33293
	recipe = AddRecipe(33293, 320, 27664, Q.COMMON, V.TBC, 320, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(20096, 20097)

	-- Poached Bluefish -- 33294
	recipe = AddRecipe(33294, 320, 27665, Q.COMMON, V.TBC, 320, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(20096, 20097)

	-- Golden Fish Sticks -- 33295
	recipe = AddRecipe(33295, 325, 27666, Q.COMMON, V.TBC, 325, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18960, 19296)

	-- Spicy Crawdad -- 33296
	recipe = AddRecipe(33296, 350, 27667, Q.COMMON, V.TBC, 350, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18960, 19296)

	-- Clam Bar -- 36210
	recipe = AddRecipe(36210, 300, 30155, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(18382)

	-- Spice Bread -- 37836
	recipe = AddRecipe(37836, 1, 30816, Q.COMMON, V.TBC, 1, 30, 35, 38)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1355, 1382, 1430, 1699, 3026, 3067, 3087, 3399, 4210, 4552, 5159, 5482, 6286, 8306, 16253, 16277, 16676, 16719, 17246, 18987, 18988, 18993, 19185, 19369, 45550, 46709, 47405)

	-- Mok'Nathal Shortribs -- 38867
	recipe = AddRecipe(38867, 335, 31672, Q.COMMON, V.TBC, 335, 355, 365, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(21113)
	recipe:AddLimitedVendor(20916, 1)
	recipe:AddQuest(10860)

	-- Crunchy Serpent -- 38868
	recipe = AddRecipe(38868, 335, 31673, Q.COMMON, V.TBC, 335, 355, 365, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(21113)
	recipe:AddLimitedVendor(20916, 1)
	recipe:AddQuest(10860)

	-- Stewed Trout -- 42296
	recipe = AddRecipe(42296, 320, 33048, Q.COMMON, V.TBC, 320, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 19186, 45550, 46709, 47405)

	-- Fisherman's Feast -- 42302
	recipe = AddRecipe(42302, 350, 33052, Q.COMMON, V.TBC, 350, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3026, 3399, 4552, 19186, 45550, 46709, 47405)

	-- Hot Buttered Trout -- 42305
	recipe = AddRecipe(42305, 350, 33053, Q.COMMON, V.TBC, 350, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 19186, 45550, 46709, 47405)

	-- Skullfish Soup -- 43707
	recipe = AddRecipe(43707, 325, 33825, Q.UNCOMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom(6)

	-- Stormchops -- 43758
	recipe = AddRecipe(43758, 300, 33866, Q.RARE, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11377, 11379, 11380, 11381, 13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116)
	recipe:AddCustom(5, 6, 38)

	-- Broiled Bloodfin -- 43761
	recipe = AddRecipe(43761, 300, 33867, Q.UNCOMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom(6)

	-- Spicy Hot Talbuk -- 43765
	recipe = AddRecipe(43765, 325, 33872, Q.UNCOMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom(5)

	-- Kibler's Bits -- 43772
	recipe = AddRecipe(43772, 300, 33874, Q.UNCOMMON, V.TBC, 300, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddQuest(11377, 11379, 11380, 11381)
	recipe:AddCustom(5, 6)

	-- Delicious Chocolate Cake -- 43779
	recipe = AddRecipe(43779, 1, 33924, Q.RARE, V.TBC, 1, 50, 62, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11377, 11379, 11380, 11381, 13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116)
	recipe:AddCustom(5, 6, 38)

	-- Hot Apple Cider -- 45022
	recipe = AddRecipe(45022, 325, 34411, Q.COMMON, V.WOTLK, 325, 325, 325, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(13420, 13433)
	recipe:AddSeason(1)

	-- Mammoth Meal -- 45549
	recipe = AddRecipe(45549, 350, 34748, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Shoveltusk Steak -- 45550
	recipe = AddRecipe(45550, 350, 34749, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Worm Delight -- 45551
	recipe = AddRecipe(45551, 350, 34750, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Roasted Worg -- 45552
	recipe = AddRecipe(45552, 350, 34751, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Rhino Dogs -- 45553
	recipe = AddRecipe(45553, 350, 34752, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Great Feast -- 45554
	recipe = AddRecipe(45554, 375, 34753, Q.COMMON, V.WOTLK, 375, 375, 400, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Mega Mammoth Meal -- 45555
	recipe = AddRecipe(45555, 400, 34754, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Tender Shoveltusk Steak -- 45556
	recipe = AddRecipe(45556, 400, 34755, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spiced Worm Burger -- 45557
	recipe = AddRecipe(45557, 400, 34756, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Very Burnt Worg -- 45558
	recipe = AddRecipe(45558, 400, 34757, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Mighty Rhino Dogs -- 45559
	recipe = AddRecipe(45559, 400, 34758, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Smoked Rockfin -- 45560
	recipe = AddRecipe(45560, 350, 34759, Q.COMMON, V.WOTLK, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Grilled Bonescale -- 45561
	recipe = AddRecipe(45561, 350, 34760, Q.COMMON, V.WOTLK, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Sauteed Goby -- 45562
	recipe = AddRecipe(45562, 350, 34761, Q.COMMON, V.WOTLK, 350, 350, 365, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Grilled Sculpin -- 45563
	recipe = AddRecipe(45563, 350, 34762, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Smoked Salmon -- 45564
	recipe = AddRecipe(45564, 350, 34763, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Poached Nettlefish -- 45565
	recipe = AddRecipe(45565, 350, 34764, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Pickled Fangtooth -- 45566
	recipe = AddRecipe(45566, 350, 34765, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Poached Northern Sculpin -- 45567
	recipe = AddRecipe(45567, 400, 34766, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Firecracker Salmon -- 45568
	recipe = AddRecipe(45568, 400, 34767, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Baked Manta Ray -- 45569
	recipe = AddRecipe(45569, 350, 42942, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Imperial Manta Steak -- 45570
	recipe = AddRecipe(45570, 400, 34769, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spicy Blue Nettlefish -- 45571
	recipe = AddRecipe(45571, 400, 34768, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Captain Rumsey's Lager -- 45695
	recipe = AddRecipe(45695, 100, 34832, Q.UNCOMMON, V.WOTLK, 100, 100, 105, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(11666, 11667, 11668, 11669, 13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116)
	recipe:AddCustom(7, 38)

	-- Charred Bear Kabobs -- 46684
	recipe = AddRecipe(46684, 250, 35563, Q.COMMON, V.WOTLK, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddVendor(2803)

	-- Juicy Bear Burger -- 46688
	recipe = AddRecipe(46688, 250, 35565, Q.COMMON, V.WOTLK, 250, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddVendor(2803)

	-- Kungaloosh -- 53056
	recipe = AddRecipe(53056, 375, 39520, Q.COMMON, V.WOTLK, 375, 375, 387, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(13571)
	recipe:AddCustom(36)

	-- Northern Stew -- 57421
	recipe = AddRecipe(57421, 350, 34747, Q.COMMON, V.WOTLK, 350, 350, 362, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(13087, 13088, 13089, 13090)

	-- Fish Feast -- 57423
	recipe = AddRecipe(57423, 450, 43015, Q.UNCOMMON, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spicy Fried Herring -- 57433
	recipe = AddRecipe(57433, 400, 42993, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Rhinolicious Wormsteak -- 57434
	recipe = AddRecipe(57434, 400, 42994, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddVendor(31031, 31032, 33595)

	-- Critter Bites -- 57435
	recipe = AddRecipe(57435, 400, 43004, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Hearty Rhino -- 57436
	recipe = AddRecipe(57436, 400, 42995, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Snapper Extreme -- 57437
	recipe = AddRecipe(57437, 400, 42996, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Blackened Worg Steak -- 57438
	recipe = AddRecipe(57438, 400, 42997, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Cuttlesteak -- 57439
	recipe = AddRecipe(57439, 400, 42998, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddVendor(31031, 31032, 33595)

	-- Spiced Mammoth Treats -- 57440
	recipe = AddRecipe(57440, 400, 43005, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Blackened Dragonfin -- 57441
	recipe = AddRecipe(57441, 400, 42999, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Dragonfin Filet -- 57442
	recipe = AddRecipe(57442, 400, 43000, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	recipe:AddVendor(31031, 31032, 33595)

	-- Tracker Snacks -- 57443
	recipe = AddRecipe(57443, 400, 43001, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Dalaran Clam Chowder -- 58065
	recipe = AddRecipe(58065, 350, 43268, Q.COMMON, V.WOTLK, 350, 350, 382, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Tasty Cupcake -- 58512
	recipe = AddRecipe(58512, 350, 43490, Q.UNCOMMON, V.WOTLK, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Last Week's Mammoth -- 58521
	recipe = AddRecipe(58521, 350, 43488, Q.UNCOMMON, V.WOTLK, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Bad Clams -- 58523
	recipe = AddRecipe(58523, 350, 43491, Q.UNCOMMON, V.WOTLK, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Haunted Herring -- 58525
	recipe = AddRecipe(58525, 350, 43492, Q.UNCOMMON, V.WOTLK, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Gigantic Feast -- 58527
	recipe = AddRecipe(58527, 425, 43478, Q.UNCOMMON, V.WOTLK, 425, 435, 455, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Small Feast -- 58528
	recipe = AddRecipe(58528, 425, 43480, Q.UNCOMMON, V.WOTLK, 425, 435, 455, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Worg Tartare -- 62350
	recipe = AddRecipe(62350, 400, 44953, Q.UNCOMMON, V.WOTLK, 400, 400, 420, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(31031, 31032, 33595)

	-- Clamlette Magnifique -- 64054
	recipe = AddRecipe(64054, 250, 33004, Q.COMMON, V.WOTLK, 250, 250, 275, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddQuest(6610)

	-- Black Jelly -- 64358
	recipe = AddRecipe(64358, 400, 45932, Q.COMMON, V.WOTLK, 400, 400, 412, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3026, 3399, 4552, 26905, 26953, 26972, 26989, 28705, 29631, 33587, 45550, 46709, 47405)

	-- Bread of the Dead -- 65454
	recipe = AddRecipe(65454, 45, 46691, Q.COMMON, V.WOTLK, 45, 55, 60, 65)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason(6)

	-- Candied Sweet Potato -- 66034
	recipe = AddRecipe(66034, 270, 44839, Q.COMMON, V.WOTLK, 270, 270, 282, 295)
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddSeason(5)

	-- Cranberry Chutney -- 66035
	recipe = AddRecipe(66035, 210, 44840, Q.COMMON, V.WOTLK, 210, 210, 222, 235)
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason(5)

	-- Pumpkin Pie -- 66036
	recipe = AddRecipe(66036, 100, 44839, Q.COMMON, V.WOTLK, 100, 150, 162, 175)
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddSeason(5)

	-- Slow-Roasted Turkey -- 66037
	recipe = AddRecipe(66037, 330, 44839, Q.COMMON, V.WOTLK, 330, 330, 342, 355)
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.DPS)
	recipe:AddSeason(5)

	-- Spice Bread Stuffing -- 66038
	recipe = AddRecipe(66038, 90, 44837, Q.COMMON, V.WOTLK, 90, 90, 102, 115)
	recipe:AddFilters(F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason(5)

	-- Baked Rockfish -- 88003
	recipe = AddRecipe(88003, 500, 62661, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Basilisk Liverdog -- 88004
	recipe = AddRecipe(88004, 500, 62665, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Beer-Basted Crocolisk -- 88005
	recipe = AddRecipe(88005, 500, 62670, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Blackened Surprise -- 88006
	recipe = AddRecipe(88006, 425, 62676, Q.COMMON, V.CATA, 425, 450, 457, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE)
	recipe:AddTrainer(3026, 3399, 4552, 45550, 46709, 47405)

	-- Broiled Dragon Feast -- 88011
	recipe = AddRecipe(88011, 500, 62289, Q.RARE, V.CATA, 500, 500, 500, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5467)

	-- Broiled Mountain Trout -- 88012
	recipe = AddRecipe(88012, 450, 62655, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Chocolate Cookie -- 88013
	recipe = AddRecipe(88013, 505, 62680, Q.UNCOMMON, V.CATA, 505, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Crocolisk Au Gratin -- 88014
	recipe = AddRecipe(88014, 500, 62664, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Darkbrew Lager -- 88015
	recipe = AddRecipe(88015, 415, 62790, Q.COMMON, V.CATA, 415, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE)
	recipe:AddTrainer(3026, 3399, 4552, 45550, 46709, 47405)

	-- Delicious Sagefish Tail -- 88016
	recipe = AddRecipe(88016, 500, 62666, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Feathered Lure -- 88017
	recipe = AddRecipe(88017, 450, nil, Q.UNCOMMON, V.CATA, 450, 450, 455, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Fish Fry -- 88018
	recipe = AddRecipe(88018, 500, 62677, Q.UNCOMMON, V.CATA, 500, 500, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Fortune Cookie -- 88019
	recipe = AddRecipe(88019, 525, 62649, Q.UNCOMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Grilled Dragon -- 88020
	recipe = AddRecipe(88020, 500, 62662, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Hearty Seafood Soup -- 88021
	recipe = AddRecipe(88021, 475, 62659, Q.UNCOMMON, V.CATA, 475, 490, 497, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Highland Spirits -- 88022
	recipe = AddRecipe(88022, 450, 62674, Q.UNCOMMON, V.CATA, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Lavascale Fillet -- 88024
	recipe = AddRecipe(88024, 450, 62654, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Lavascale Minestrone -- 88025
	recipe = AddRecipe(88025, 500, 62663, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Lightly Fried Lurker -- 88028
	recipe = AddRecipe(88028, 450, 62651, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Lurker Lunch -- 88030
	recipe = AddRecipe(88030, 450, 62657, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Mushroom Sauce Mudfish -- 88031
	recipe = AddRecipe(88031, 500, 62667, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Pickled Guppy -- 88033
	recipe = AddRecipe(88033, 475, 62660, Q.UNCOMMON, V.CATA, 475, 490, 497, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Blackbelly Sushi -- 88034
	recipe = AddRecipe(88034, 500, 62668, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Salted Eye -- 88035
	recipe = AddRecipe(88035, 450, 62653, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Seafood Magnifique Feast -- 88036
	recipe = AddRecipe(88036, 525, 62290, Q.RARE, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5036)

	-- Seasoned Crab -- 88037
	recipe = AddRecipe(88037, 450, 62652, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Severed Sagefish Head -- 88039
	recipe = AddRecipe(88039, 500, 62671, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Skewered Eel -- 88042
	recipe = AddRecipe(88042, 500, 62669, Q.UNCOMMON, V.CATA, 500, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- South Island Iced Tea -- 88044
	recipe = AddRecipe(88044, 525, 62672, Q.UNCOMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Starfire Espresso -- 88045
	recipe = AddRecipe(88045, 450, 62675, Q.UNCOMMON, V.CATA, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Tender Baked Turtle -- 88046
	recipe = AddRecipe(88046, 475, 62658, Q.UNCOMMON, V.CATA, 475, 490, 497, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Whitecrest Gumbo -- 88047
	recipe = AddRecipe(88047, 450, 62656, Q.UNCOMMON, V.CATA, 450, 465, 477, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	-- Venison Jerky -- 93741
	recipe = AddRecipe(93741, 40, 67230, Q.COMMON, V.CATA, 40, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE)
	recipe:AddTrainer(3026, 3399, 4552, 45550, 46709, 47405)

	-- Scalding Murglesnout -- 96133
	recipe = AddRecipe(96133, 500, 68687, Q.UNCOMMON, V.CATA, 500, 500, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(49701, 49737)

	return num_recipes
end
