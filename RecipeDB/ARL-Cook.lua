--[[

************************************************************************

ARL-Cook.lua

Cooking data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
122 found from data mining.
1 ignored.
5 WotLK ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addTradeSkill(RecipeDB, Spell ID, Skill Level, Item ID, Rarity, Specialty)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitCooking(RecipeDB)

	local recipecount = 0

	-- Charred Wolf Meat -- 2538
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2538, 5, 2679, 1, 2550)
	self:addTradeFlags(RecipeDB, 2538, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Spiced Wolf Meat -- 2539
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2539, 10, 2680, 1, 2550)
	self:addTradeFlags(RecipeDB, 2539, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2539, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Roasted Boar Meat -- 2540
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2540, 5, 2681, 1, 2550)
	self:addTradeFlags(RecipeDB, 2540, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Coyote Steak -- 2541
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2541, 50, 2684, 1, 2550)
	self:addTradeFlags(RecipeDB, 2541, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2541, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Goretusk Liver Pie -- 2542
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2542, 50, 724, 1, 2550)
	self:addTradeFlags(RecipeDB, 2542, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2542, 4, 22, 2, 340)

	-- Westfall Stew -- 2543
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2543, 75, 733, 1, 2550)
	self:addTradeFlags(RecipeDB, 2543, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2543, 4, 38, 2, 340)

	-- Crab Cake -- 2544
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2544, 75, 2683, 1, 2550)
	self:addTradeFlags(RecipeDB, 2544, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2544, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Cooked Crab Claw -- 2545
	-- World Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2545, 85, 2682, 1, 2550)
	self:addTradeFlags(RecipeDB, 2545, 1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2545, 7, 1, 2, 340)

	-- Dry Pork Ribs -- 2546
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2546, 80, 2687, 1, 2550)
	self:addTradeFlags(RecipeDB, 2546, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2546, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Redridge Goulash -- 2547
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2547, 100, 1082, 1, 2550)
	self:addTradeFlags(RecipeDB, 2547, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2547, 4, 92, 2, 340)

	-- Succulent Pork Ribs -- 2548
	-- World Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2548, 110, 2685, 1, 2550)
	self:addTradeFlags(RecipeDB, 2548, 1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2548, 7, 1, 2, 340)

	-- Seasoned Wolf Kabob -- 2549
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2549, 100, 1017, 1, 2550)
	self:addTradeFlags(RecipeDB, 2549, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2549, 4, 90, 2, 340)

	-- Beer Basted Boar Ribs -- 2795
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2795, 10, 2888, 1, 2550)
	self:addTradeFlags(RecipeDB, 2795, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2795, 4, 384, 2, 340)

	-- Crocolisk Steak -- 3370
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3370, 80, 3662, 1, 2550)
	self:addTradeFlags(RecipeDB, 3370, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3370, 4, 385, 2, 340)

	-- Blood Sausage -- 3371
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3371, 60, 3220, 1, 2550)
	self:addTradeFlags(RecipeDB, 3371, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3371, 4, 418, 2, 340)

	-- Murloc Fin Soup -- 3372
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3372, 90, 3663, 1, 2550)
	self:addTradeFlags(RecipeDB, 3372, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3372, 4, 127, 2, 340)

	-- Crocolisk Gumbo -- 3373
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3373, 120, 3664, 1, 2550)
	self:addTradeFlags(RecipeDB, 3373, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3373, 4, 471, 2, 340)

	-- Curiously Tasty Omelet -- 3376
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3376, 130, 3665, 1, 2550)
	self:addTradeFlags(RecipeDB, 3376, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3376, 4, 296, 2, 340, 2, 1148, 2, 2821)

	-- Gooey Spider Cake -- 3377
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3377, 110, 3666, 1, 2550)
	self:addTradeFlags(RecipeDB, 3377, 1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3377, 4, 93, 2, 340)

	-- Big Bear Steak -- 3397
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3397, 110, 3726, 1, 2550)
	self:addTradeFlags(RecipeDB, 3397, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3397, 4, 498, 2, 3960, 2, 12246)

	-- Hot Lion Chops -- 3398
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3398, 125, 3727, 1, 2550)
	self:addTradeFlags(RecipeDB, 3398, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3398, 4, 501, 2, 3489, 2, 12245)

	-- Tasty Lion Steak -- 3399
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3399, 150, 3728, 1, 2550)
	self:addTradeFlags(RecipeDB, 3399, 1,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3399, 4, 564)

	-- Soothing Turtle Bisque -- 3400
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3400, 175, 3729, 1, 2550)
	self:addTradeFlags(RecipeDB, 3400, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3400, 4, 555, 4, 7321)

	-- Barbecued Buzzard Wing -- 4094
	-- Trainer
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4094, 175, 4457, 1, 2550)
	self:addTradeFlags(RecipeDB, 4094, 1,2,3,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 4094, 4, 703, 1, 2818, 2, 2814, 2, 12246)

	-- Kaldorei Spider Kabob -- 6412
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6412, 10, 5472, 1, 2550)
	self:addTradeFlags(RecipeDB, 6412, 1,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6412, 4, 4161)

	-- Scorpid Surprise -- 6413
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6413, 20, 5473, 1, 2550)
	self:addTradeFlags(RecipeDB, 6413, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6413, 2, 3881)

	-- Roasted Kodo Meat -- 6414
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6414, 35, 5474, 1, 2550)
	self:addTradeFlags(RecipeDB, 6414, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6414, 2, 3081)

	-- Fillet of Frenzy -- 6415
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6415, 50, 5476, 1, 2550)
	self:addTradeFlags(RecipeDB, 6415, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6415, 2, 4200)

	-- Strider Stew -- 6416
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6416, 50, 5477, 1, 2550)
	self:addTradeFlags(RecipeDB, 6416, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6416, 4, 2178, 2, 3482)

	-- Dig Rat Stew -- 6417
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6417, 90, 5478, 1, 2550)
	self:addTradeFlags(RecipeDB, 6417, 2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6417, 4, 862)

	-- Crispy Lizard Tail -- 6418
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6418, 100, 5479, 1, 2550)
	self:addTradeFlags(RecipeDB, 6418, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6418, 2, 3482)

	-- Lean Venison -- 6419
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6419, 110, 5480, 1, 2550)
	self:addTradeFlags(RecipeDB, 6419, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6419, 2, 3960, 2, 12245)

	-- Boiled Clams -- 6499
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6499, 50, 5525, 1, 2550)
	self:addTradeFlags(RecipeDB, 6499, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 6499, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Goblin Deviled Clams -- 6500
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6500, 125, 5527, 1, 2550)
	self:addTradeFlags(RecipeDB, 6500, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 6500, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Clam Chowder -- 6501
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6501, 90, 5526, 1, 2550)
	self:addTradeFlags(RecipeDB, 6501, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6501, 2, 4305, 2, 4307)

	-- Giant Clam Scorcho -- 7213
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7213, 175, 6038, 1, 2550)
	self:addTradeFlags(RecipeDB, 7213, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7213, 2, 2664)

	-- Brilliant Smallfish -- 7751
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7751, 1, 6290, 1, 2550)
	self:addTradeFlags(RecipeDB, 7751, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7751, 2, 66, 2, 1684, 2, 3029, 2, 3550, 2, 4265, 2, 4574, 2, 5494, 2, 5940, 2, 8508)

	-- Slitherskin Mackerel -- 7752
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7752, 1, 787, 1, 2550)
	self:addTradeFlags(RecipeDB, 7752, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7752, 2, 3550, 2, 4305, 2, 5162, 2, 5942, 2, 10118)

	-- Longjaw Mud Snapper -- 7753
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7753, 50, 4592, 1, 2550)
	self:addTradeFlags(RecipeDB, 7753, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7753, 2, 66, 2, 1684, 2, 3027, 2, 4265, 2, 4574, 2, 5162, 2, 5748, 2, 5940)

	-- Loch Frenzy Delight -- 7754
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7754, 50, 6316, 1, 2550)
	self:addTradeFlags(RecipeDB, 7754, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7754, 2, 1684)

	-- Bristle Whisker Catfish -- 7755
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7755, 100, 4593, 1, 2550)
	self:addTradeFlags(RecipeDB, 7755, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7755, 2, 2383, 2, 2397, 2, 3027, 2, 3029, 2, 3497, 2, 4553, 2, 5494)

	-- Rainbow Fin Albacore -- 7827
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7827, 50, 5095, 1, 2550)
	self:addTradeFlags(RecipeDB, 7827, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7827, 2, 3178, 2, 3333, 2, 3497, 2, 4305, 2, 4307, 2, 4553, 2, 5494, 2, 5748, 2, 5942, 2, 10118)

	-- Rockscale Cod -- 7828
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7828, 175, 4594, 1, 2550)
	self:addTradeFlags(RecipeDB, 7828, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7828, 2, 2383, 2, 2664, 2, 3178, 2, 3333, 2, 4307, 2, 4574, 2, 5162, 2, 12033, 2, 12962)

	-- Savory Deviate Delight -- 8238
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8238, 85, 6657, 2, 2550)
	self:addTradeFlags(RecipeDB, 8238, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 8238, 7, 2)

	-- Herb Baked Egg -- 8604
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8604, 5, 6888, 1, 2550)
	self:addTradeFlags(RecipeDB, 8604, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smoked Bear Meat -- 8607
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8607, 40, 6890, 1, 2550)
	self:addTradeFlags(RecipeDB, 8607, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 8607, 2, 1465, 2, 3556)

	-- Thistle Tea -- 9513
	-- Vendor
	-- Quest Reward
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9513, 60, 7676, 2, 2550)
	self:addTradeFlags(RecipeDB, 9513, 1,2,4,8,28,36,41)
	self:addTradeAcquire(RecipeDB, 9513, 4, 2359, 4, 2478, 2, 6779)

	-- Goldthorn Tea -- 13028
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13028, 175, 10841, 1, 2550)
	self:addTradeFlags(RecipeDB, 13028, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lean Wolf Steak -- 15853
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15853, 125, 12209, 1, 2550)
	self:addTradeFlags(RecipeDB, 15853, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15853, 2, 12246)

	-- Roast Raptor -- 15855
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15855, 175, 12210, 1, 2550)
	self:addTradeFlags(RecipeDB, 15855, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15855, 2, 734, 2, 1148, 2, 2810, 2, 2821, 2, 4879, 2, 4897, 2, 12245)

	-- Hot Wolf Ribs -- 15856
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15856, 175, 13851, 1, 2550)
	self:addTradeFlags(RecipeDB, 15856, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15856, 2, 7947, 2, 8145, 2, 12246)

	-- Jungle Stew -- 15861
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15861, 175, 12212, 1, 2550)
	self:addTradeFlags(RecipeDB, 15861, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15861, 2, 734, 2, 1148, 2, 12245)

	-- Carrion Surprise -- 15863
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15863, 175, 12213, 1, 2550)
	self:addTradeFlags(RecipeDB, 15863, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15863, 2, 989, 2, 4879, 2, 9636, 2, 12245)

	-- Mystery Stew -- 15865
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15865, 175, 12214, 1, 2550)
	self:addTradeFlags(RecipeDB, 15865, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15865, 2, 4897, 2, 8150, 2, 12246)

	-- Dragonbreath Chili -- 15906
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15906, 200, 12217, 1, 2550)
	self:addTradeFlags(RecipeDB, 15906, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15906, 2, 4879, 2, 4897, 2, 12246)

	-- Heavy Kodo Stew -- 15910
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15910, 200, 12215, 1, 2550)
	self:addTradeFlags(RecipeDB, 15910, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15910, 2, 8150, 2, 9636, 2, 12245)

	-- Spiced Chili Crab -- 15915
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15915, 225, 12216, 1, 2550)
	self:addTradeFlags(RecipeDB, 15915, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15915, 2, 989, 2, 1149, 2, 4305)

	-- Monster Omelet -- 15933
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15933, 225, 12218, 1, 2550)
	self:addTradeFlags(RecipeDB, 15933, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15933, 2, 2803, 2, 2806, 2, 11187)

	-- Crispy Bat Wing -- 15935
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15935, 1, 12224, 1, 2550)
	self:addTradeFlags(RecipeDB, 15935, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 15935, 2, 2118)

	-- Spotted Yellowtail -- 18238
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18238, 225, 6887, 1, 2550)
	self:addTradeFlags(RecipeDB, 18238, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18238, 2, 8137)

	-- Cooked Glossy Mightfish -- 18239
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18239, 225, 13927, 1, 2550)
	self:addTradeFlags(RecipeDB, 18239, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18239, 2, 2664)

	-- Grilled Squid -- 18240
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18240, 240, 13928, 1, 2550)
	self:addTradeFlags(RecipeDB, 18240, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18240, 2, 8137)

	-- Filet of Redgill -- 18241
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18241, 225, 13930, 1, 2550)
	self:addTradeFlags(RecipeDB, 18241, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18241, 2, 2664)

	-- Hot Smoked Bass -- 18242
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18242, 240, 13929, 1, 2550)
	self:addTradeFlags(RecipeDB, 18242, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18242, 2, 2664)

	-- Nightfin Soup -- 18243
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18243, 250, 13931, 1, 2550)
	self:addTradeFlags(RecipeDB, 18243, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18243, 2, 8137)

	-- Poached Sunscale Salmon -- 18244
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18244, 250, 13932, 1, 2550)
	self:addTradeFlags(RecipeDB, 18244, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18244, 2, 8137)

	-- Lobster Stew -- 18245
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18245, 275, 13933, 1, 2550)
	self:addTradeFlags(RecipeDB, 18245, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18245, 2, 7947, 2, 8145)

	-- Mightfish Steak -- 18246
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18246, 275, 13934, 1, 2550)
	self:addTradeFlags(RecipeDB, 18246, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18246, 2, 7947, 2, 8145)

	-- Baked Salmon -- 18247
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18247, 275, 13935, 1, 2550)
	self:addTradeFlags(RecipeDB, 18247, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18247, 2, 7947, 2, 8145)

	-- Undermine Clam Chowder -- 20626
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20626, 225, 16766, 1, 2550)
	self:addTradeFlags(RecipeDB, 20626, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20626, 2, 8139)

	-- Mithril Headed Trout -- 20916
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20916, 175, 8364, 1, 2550)
	self:addTradeFlags(RecipeDB, 20916, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20916, 2, 2383, 2, 2664, 2, 3178, 2, 3333, 2, 4307, 2, 4574, 2, 5162, 2, 12033, 2, 12962)

	-- Gingerbread Cookie -- 21143
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21143, 1, 17197, 1, 2550)
	self:addTradeFlags(RecipeDB, 21143, 1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 21143, 5, 1, 2, 13420, 2, 13429, 2, 13432, 2, 13433)

	-- Egg Nog -- 21144
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21144, 35, 17198, 1, 2550)
	self:addTradeFlags(RecipeDB, 21144, 1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 21144, 5, 1, 2, 13420, 2, 13429, 2, 13432, 2, 13433)

	-- Spider Sausage -- 21175
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21175, 200, 17222, 1, 2550)
	self:addTradeFlags(RecipeDB, 21175, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 21175, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Tender Wolf Steak -- 22480
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22480, 225, 18045, 1, 2550)
	self:addTradeFlags(RecipeDB, 22480, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 22480, 2, 4782, 2, 7733, 2, 8125)

	-- Runn Tum Tuber Surprise -- 22761
	-- Instance: 2557 - type1minlevel58maxlevel60category3nameDire Maulterritory1id2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22761, 275, 18254, 2, 2550)
	self:addTradeFlags(RecipeDB, 22761, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22761, 3, 14354)

	-- Heavy Crocolisk Stew -- 24418
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24418, 150, 20074, 1, 2550)
	self:addTradeFlags(RecipeDB, 24418, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 24418, 2, 4879)

	-- Smoked Desert Dumplings -- 24801
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24801, 285, 20452, 1, 2550)
	self:addTradeFlags(RecipeDB, 24801, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Dirge's Kickin' Chimaerok Chops -- 25659
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25659, 300, 21023, 4, 2550)
	self:addTradeFlags(RecipeDB, 25659, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25659, 4, 8586)

	-- Smoked Sagefish -- 25704
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25704, 80, 21072, 1, 2550)
	self:addTradeFlags(RecipeDB, 25704, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25704, 2, 2381, 2, 2397, 2, 2664, 2, 3027, 2, 3085, 2, 3400, 2, 4223, 2, 4265, 2, 4553, 2, 5160, 2, 5483, 2, 8307, 2, 12033, 2, 14738, 2, 16253, 2, 16677, 2, 16718, 2, 17246, 2, 19195)

	-- Sagefish Delight -- 25954
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25954, 175, 21217, 1, 2550)
	self:addTradeFlags(RecipeDB, 25954, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25954, 2, 2381, 2, 2397, 2, 2664, 2, 3027, 2, 3085, 2, 3400, 2, 4223, 2, 4265, 2, 4553, 2, 5160, 2, 5483, 2, 8307, 2, 12033, 2, 14738, 2, 16253, 2, 16677, 2, 16718, 2, 17246, 2, 19195)

	-- Crunchy Spider Surprise -- 28267
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28267, 60, 22645, 1, 2550)
	self:addTradeFlags(RecipeDB, 28267, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28267, 4, 9171, 2, 16253, 2, 18427)

	-- Crystal Throat Lozenge -- 30047
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 30047, 285, 23683, , 2550)
	--self:addTradeFlags(RecipeDB, 30047, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Lynx Steak -- 33276
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33276, 1, 27635, 1, 2550)
	self:addTradeFlags(RecipeDB, 33276, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33276, 2, 16262)

	-- Roasted Moongraze Tenderloin -- 33277
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33277, 1, 24105, 1, 2550)
	self:addTradeFlags(RecipeDB, 33277, 1,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33277, 4, 9454)

	-- Bat Bites -- 33278
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33278, 50, 27636, 1, 2550)
	self:addTradeFlags(RecipeDB, 33278, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33278, 2, 16253)

	-- Buzzard Bites -- 33279
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33279, 300, 27651, 1, 2550)
	self:addTradeFlags(RecipeDB, 33279, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33279, 4, 9356)

	-- Ravager Dog -- 33284
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33284, 300, 27655, 1, 2550)
	self:addTradeFlags(RecipeDB, 33284, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33284, 2, 16585, 2, 16826)

	-- Sporeling Snack -- 33285
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33285, 310, 27656, 1, 2550)
	self:addTradeFlags(RecipeDB, 33285, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33285, 2, 18382)

	-- Blackened Basilisk -- 33286
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33286, 315, 27657, 1, 2550)
	self:addTradeFlags(RecipeDB, 33286, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33286, 2, 18957, 2, 19038)

	-- Roasted Clefthoof -- 33287
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33287, 325, 27658, 1, 2550)
	self:addTradeFlags(RecipeDB, 33287, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33287, 2, 20096, 2, 20097)

	-- Warp Burger -- 33288
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33288, 325, 27659, 1, 2550)
	self:addTradeFlags(RecipeDB, 33288, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33288, 2, 18957, 2, 19038)

	-- Talbuk Steak -- 33289
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33289, 325, 27660, 1, 2550)
	self:addTradeFlags(RecipeDB, 33289, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33289, 2, 20096, 2, 20097)

	-- Blackened Trout -- 33290
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33290, 300, 27661, 1, 2550)
	self:addTradeFlags(RecipeDB, 33290, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33290, 2, 18015, 2, 20028)

	-- Feltail Delight -- 33291
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33291, 300, 27662, 1, 2550)
	self:addTradeFlags(RecipeDB, 33291, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33291, 2, 18011, 2, 20028)

	-- Blackened Sporefish -- 33292
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33292, 310, 27663, 1, 2550)
	self:addTradeFlags(RecipeDB, 33292, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33292, 2, 18911)

	-- Grilled Mudfish -- 33293
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33293, 320, 27664, 1, 2550)
	self:addTradeFlags(RecipeDB, 33293, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33293, 2, 20096, 2, 20097)

	-- Poached Bluefish -- 33294
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33294, 320, 27665, 1, 2550)
	self:addTradeFlags(RecipeDB, 33294, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33294, 2, 20096, 2, 20097)

	-- Golden Fish Sticks -- 33295
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33295, 325, 27666, 1, 2550)
	self:addTradeFlags(RecipeDB, 33295, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33295, 2, 18960, 2, 19296)

	-- Spicy Crawdad -- 33296
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33296, 350, 27667, 1, 2550)
	self:addTradeFlags(RecipeDB, 33296, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33296, 2, 18960, 2, 19296)

	-- Clam Bar -- 36210
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36210, 300, 30155, 1, 2550)
	self:addTradeFlags(RecipeDB, 36210, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 36210, 2, 18382)

	-- Spice Bread -- 37836
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37836, 20, 30816, 1, 2550)
	self:addTradeFlags(RecipeDB, 37836, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 37836, 1, 1355, 1, 1382, 1, 1430, 1, 1699, 1, 3026, 1, 3067, 1, 3087, 1, 3399, 1, 4210, 1, 4552, 1, 5159, 1, 5482, 1, 6286, 1, 8306, 1, 16253, 1, 16277, 1, 16676, 1, 16719, 1, 17246, 1, 18987, 1, 18988, 1, 18993, 1, 19185, 1, 19369)

	-- Mok'Nathal Shortribs -- 38867
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38867, 335, 31672, 1, 2550)
	self:addTradeFlags(RecipeDB, 38867, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 38867, 4, 10860, 2, 21113)

	-- Crunchy Serpent -- 38868
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38868, 335, 31673, 1, 2550)
	self:addTradeFlags(RecipeDB, 38868, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 38868, 4, 10860, 2, 21113)

	-- Stewed Trout -- 42296
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42296, 315, 33048, 1, 2550)
	self:addTradeFlags(RecipeDB, 42296, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 42296, 1, 19186)

	-- Fisherman's Feast -- 42302
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42302, 365, 33052, 1, 2550)
	self:addTradeFlags(RecipeDB, 42302, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 42302, 1, 19186)

	-- Hot Buttered Trout -- 42305
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42305, 365, 33053, 1, 2550)
	self:addTradeFlags(RecipeDB, 42305, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 42305, 1, 19186)

	-- Skullfish Soup -- 43707
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43707, 325, 33825, 2, 2550)
	self:addTradeFlags(RecipeDB, 43707, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43707, 3, 19678, 3, 24393)

	-- Stormchops -- 43758
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43758, 300, 33866, 3, 2550)
	self:addTradeFlags(RecipeDB, 43758, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43758, 3, 19246, 3, 19338, 3, 19351, 3, 24393)

	-- Broiled Bloodfin -- 43761
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43761, 300, 33867, 2, 2550)
	self:addTradeFlags(RecipeDB, 43761, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43761, 3, 18940, 3, 18962, 3, 24393)

	-- Spicy Hot Talbuk -- 43765
	-- Instance: 3716 - expansion1type5minlevel63maxlevel65category3nameCoilfang Reservoir: The Underbogterritory1id3716
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43765, 325, 33872, 2, 2550)
	self:addTradeFlags(RecipeDB, 43765, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43765, 3, 2457, 3, 13797, 3, 17723, 3, 19045, 3, 20613, 3, 20807, 3, 24393)

	-- Kibler's Bits -- 43772
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43772, 300, 33874, 2, 2550)
	self:addTradeFlags(RecipeDB, 43772, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43772, 3, 19246, 3, 24393, 3, 24416)

	-- Delicious Chocolate Cake -- 43779
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43779, 1, 33924, 3, 2550)
	self:addTradeFlags(RecipeDB, 43779, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43779, 3, 19034, 3, 19047, 3, 19318, 3, 20807, 3, 24393)

	-- Shoveltusk Soup -- 44438
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44438, 350, 34125, 1, 2550)
	--self:addTradeFlags(RecipeDB, 44438, 8,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB, 44438, 4, 11155)

	-- Hot Apple Cider -- 45022
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45022, 325, 34411, 1, 2550)
	self:addTradeFlags(RecipeDB, 45022, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 45022, 5, 1)

	-- Succulent Orca Stew -- 45547
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 45547, 375, 39691, 1, 2550)
	--self:addTradeFlags(RecipeDB, 45547, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Cooked Northrend Meat -- 45559
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 45559, 375, 34758, , 2550)
	--self:addTradeFlags(RecipeDB, 45559, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Cooked Northrend Fish -- 45571
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 45571, 375, 34770, , 2550)
	--self:addTradeFlags(RecipeDB, 45571, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Captain Rumsey's Lager -- 45695
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45695, 100, 34832, 2, 2550)
	self:addTradeFlags(RecipeDB, 45695, 21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Charred Bear Kabobs -- 46684
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46684, 250, 35563, 1, 2550)
	self:addTradeFlags(RecipeDB, 46684, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 46684, 2, 2803, 2, 2806)

	-- Juicy Bear Burger -- 46688
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46688, 250, 35565, 1, 2550)
	self:addTradeFlags(RecipeDB, 46688, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 46688, 2, 2803, 2, 2806)

	-- Kungaloosh -- 53056
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53056, 375, 39520, 1, 2550)
	--self:addTradeFlags(RecipeDB, 53056, 8,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB, 53056, 4, 12645)

	return recipecount

end
