--[[
************************************************************************
Cooking.lua
Cooking data for all of Ackis Recipe List
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

local initialized = false
local num_recipes = 0

function addon:InitCooking(RecipeDB)
	if initialized then
		return num_recipes
	end

	initialized = true

	--------------------------------------------------------------------------------------------------------------------
	-- Counter and wrapper function
	--------------------------------------------------------------------------------------------------------------------
	local function AddRecipe(SpellID, Skill, ItemID, Rarity, Game, Orange, Yellow, Green, Gray)
		num_recipes = num_recipes + 1
		self:addTradeSkill(RecipeDB, SpellID, Skill, ItemID, Rarity, 2550, nil, Game, Orange, Yellow, Green, Gray)
	end

	-- Charred Wolf Meat -- 2538
	AddRecipe(2538, 1, 2679, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 2538, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 2538, A.CUSTOM, 8)

	-- Spiced Wolf Meat -- 2539
	AddRecipe(2539, 10, 2680, Q.COMMON, GAME_ORIG, 10, 50, 70, 90)
	self:addTradeFlags(RecipeDB, 2539, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2539, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Roasted Boar Meat -- 2540
	AddRecipe(2540, 1, 2681, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 2540, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 2540, A.CUSTOM, 8)

	-- Coyote Steak -- 2541
	AddRecipe(2541, 50, 2684, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 2541, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2541, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Goretusk Liver Pie -- 2542
	AddRecipe(2542, 50, 724, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 2542, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2542, A.QUEST, 22, A.VENDOR, 340)

	-- Westfall Stew -- 2543
	AddRecipe(2543, 75, 733, Q.COMMON, GAME_ORIG, 75, 115, 135, 155)
	self:addTradeFlags(RecipeDB, 2543, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 2543, A.QUEST, 38, A.VENDOR, 340)

	-- Crab Cake -- 2544
	AddRecipe(2544, 75, 2683, Q.COMMON, GAME_ORIG, 75, 115, 135, 155)
	self:addTradeFlags(RecipeDB, 2544, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2544, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Cooked Crab Claw -- 2545
	AddRecipe(2545, 85, 2682, Q.COMMON, GAME_ORIG, 85, 125, 145, 165)
	self:addTradeFlags(RecipeDB, 2545, F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 2545, A.WORLD_DROP, 1, A.VENDOR, 340)

	-- Dry Pork Ribs -- 2546
	AddRecipe(2546, 80, 2687, Q.COMMON, GAME_ORIG, 80, 120, 140, 160)
	self:addTradeFlags(RecipeDB, 2546, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2546, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Redridge Goulash -- 2547
	AddRecipe(2547, 100, 1082, Q.COMMON, GAME_ORIG, 100, 135, 155, 175)
	self:addTradeFlags(RecipeDB, 2547, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2547, A.QUEST, 92, A.VENDOR, 340)

	-- Succulent Pork Ribs -- 2548
	AddRecipe(2548, 110, 2685, Q.COMMON, GAME_ORIG, 110, 130, 150, 170)
	self:addTradeFlags(RecipeDB, 2548, F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 2548, A.WORLD_DROP, 1, A.VENDOR, 340)

	-- Seasoned Wolf Kabob -- 2549
	AddRecipe(2549, 100, 1017, Q.COMMON, GAME_ORIG, 100, 140, 160, 180)
	self:addTradeFlags(RecipeDB, 2549, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2549, A.QUEST, 90, A.VENDOR, 340)

	-- Beer Basted Boar Ribs -- 2795
	AddRecipe(2795, 10, 2888, Q.COMMON, GAME_ORIG, 10, 60, 80, 100)
	self:addTradeFlags(RecipeDB, 2795, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 2795, A.QUEST, 384, A.VENDOR, 340)

	-- Crocolisk Steak -- 3370
	AddRecipe(3370, 80, 3662, Q.COMMON, GAME_ORIG, 80, 120, 140, 160)
	self:addTradeFlags(RecipeDB, 3370, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3370, A.QUEST, 385, A.VENDOR, 340)

	-- Blood Sausage -- 3371
	AddRecipe(3371, 60, 3220, Q.COMMON, GAME_ORIG, 60, 100, 120, 140)
	self:addTradeFlags(RecipeDB, 3371, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3371, A.QUEST, 418, A.VENDOR, 340)

	-- Murloc Fin Soup -- 3372
	AddRecipe(3372, 90, 3663, Q.COMMON, GAME_ORIG, 90, 130, 150, 170)
	self:addTradeFlags(RecipeDB, 3372, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3372, A.QUEST, 127, A.VENDOR, 340)

	-- Crocolisk Gumbo -- 3373
	AddRecipe(3373, 120, 3664, Q.COMMON, GAME_ORIG, 120, 160, 180, 200)
	self:addTradeFlags(RecipeDB, 3373, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3373, A.QUEST, 471, A.VENDOR, 340)

	-- Curiously Tasty Omelet -- 3376
	AddRecipe(3376, 130, 3665, Q.COMMON, GAME_ORIG, 130, 170, 190, 210)
	self:addTradeFlags(RecipeDB, 3376, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3376, A.QUEST, 296, A.VENDOR, 340, A.VENDOR, 1148, A.VENDOR, 2821)

	-- Gooey Spider Cake -- 3377
	AddRecipe(3377, 110, 3666, Q.COMMON, GAME_ORIG, 110, 150, 170, 190)
	self:addTradeFlags(RecipeDB, 3377, F.ALLIANCE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3377, A.QUEST, 93, A.VENDOR, 340)

	-- Big Bear Steak -- 3397
	AddRecipe(3397, 110, 3726, Q.COMMON, GAME_ORIG, 110, 150, 170, 190)
	self:addTradeFlags(RecipeDB, 3397, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3397, A.QUEST, 498, A.VENDOR, 3960, A.VENDOR, 12246)

	-- Hot Lion Chops -- 3398
	AddRecipe(3398, 125, 3727, Q.COMMON, GAME_ORIG, 125, 175, 195, 215)
	self:addTradeFlags(RecipeDB, 3398, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3398, A.QUEST, 501, A.VENDOR, 3489, A.VENDOR, 12245)

	-- Tasty Lion Steak -- 3399
	AddRecipe(3399, 150, 3728, Q.COMMON, GAME_ORIG, 150, 190, 210, 230)
	self:addTradeFlags(RecipeDB, 3399, F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3399, A.QUEST, 564)

	-- Soothing Turtle Bisque -- 3400
	AddRecipe(3400, 175, 3729, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 3400, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 3400, A.QUEST, 555, A.QUEST, 7321)

	-- Barbecued Buzzard Wing -- 4094
	AddRecipe(4094, 175, 4457, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 4094, F.ALLIANCE, F.HORDE, F.TRAINER, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 4094, A.QUEST, 703, A.TRAINER, 2818, A.VENDOR, 2814, A.VENDOR, 12246)

	-- Kaldorei Spider Kabob -- 6412
	AddRecipe(6412, 10, 5472, Q.COMMON, GAME_ORIG, 10, 50, 70, 90)
	self:addTradeFlags(RecipeDB, 6412, F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6412, A.QUEST, 4161)

	-- Scorpid Surprise -- 6413
	AddRecipe(6413, 20, 5473, Q.COMMON, GAME_ORIG, 20, 60, 80, 100)
	self:addTradeFlags(RecipeDB, 6413, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 6413, A.VENDOR, 3881)

	-- Roasted Kodo Meat -- 6414
	AddRecipe(6414, 35, 5474, Q.COMMON, GAME_ORIG, 35, 75, 95, 115)
	self:addTradeFlags(RecipeDB, 6414, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6414, A.VENDOR, 3081)

	-- Fillet of Frenzy -- 6415
	AddRecipe(6415, 50, 5476, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 6415, F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6415, A.VENDOR, 4200)

	-- Strider Stew -- 6416
	AddRecipe(6416, 50, 5477, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 6416, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6416, A.QUEST, 2178, A.VENDOR, 3482)

	-- Dig Rat Stew -- 6417
	AddRecipe(6417, 90, 44977, Q.COMMON, GAME_WOTLK, 90, 130, 150, 170)
	self:addTradeFlags(RecipeDB, 6417, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 6417, A.QUEST, 862, A.VENDOR, 3392)

	-- Crispy Lizard Tail -- 6418
	AddRecipe(6418, 100, 5479, Q.COMMON, GAME_ORIG, 100, 140, 160, 180)
	self:addTradeFlags(RecipeDB, 6418, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6418, A.VENDOR, 3482)

	-- Lean Venison -- 6419
	AddRecipe(6419, 110, 5480, Q.COMMON, GAME_ORIG, 110, 150, 170, 190)
	self:addTradeFlags(RecipeDB, 6419, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6419, A.VENDOR, 3960, A.VENDOR, 12245)

	-- Boiled Clams -- 6499
	AddRecipe(6499, 50, 5525, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 6499, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6499, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Goblin Deviled Clams -- 6500
	AddRecipe(6500, 125, 5527, Q.COMMON, GAME_ORIG, 125, 165, 185, 205)
	self:addTradeFlags(RecipeDB, 6500, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 6500, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Clam Chowder -- 6501
	AddRecipe(6501, 90, 5526, Q.COMMON, GAME_ORIG, 90, 130, 150, 170)
	self:addTradeFlags(RecipeDB, 6501, F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 6501, A.VENDOR, 4305, A.VENDOR, 4307)

	-- Giant Clam Scorcho -- 7213
	AddRecipe(7213, 175, 6038, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 7213, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 7213, A.VENDOR, 2664)

	-- Brilliant Smallfish -- 7751
	AddRecipe(7751, 1, 6290, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 7751, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7751, A.VENDOR, 66, A.VENDOR, 1684, A.VENDOR, 3029, A.VENDOR, 3550, A.VENDOR, 4265, A.VENDOR, 4574, A.VENDOR, 5494, A.VENDOR, 5940, A.VENDOR, 8508)

	-- Slitherskin Mackerel -- 7752
	AddRecipe(7752, 1, 787, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 7752, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7752, A.VENDOR, 3550, A.VENDOR, 4305, A.VENDOR, 5162, A.VENDOR, 5942, A.VENDOR, 10118)

	-- Longjaw Mud Snapper -- 7753
	AddRecipe(7753, 50, 4592, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 7753, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7753, A.VENDOR, 66, A.VENDOR, 1684, A.VENDOR, 3027, A.VENDOR, 4265, A.VENDOR, 4574, A.VENDOR, 5162, A.VENDOR, 5748, A.VENDOR, 5940)

	-- Loch Frenzy Delight -- 7754
	AddRecipe(7754, 50, 6316, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 7754, F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7754, A.VENDOR, 1684)

	-- Bristle Whisker Catfish -- 7755
	AddRecipe(7755, 100, 4593, Q.COMMON, GAME_ORIG, 100, 140, 160, 180)
	self:addTradeFlags(RecipeDB, 7755, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7755, A.VENDOR, 2383, A.VENDOR, 2397, A.VENDOR, 3027, A.VENDOR, 3029, A.VENDOR, 3497, A.VENDOR, 4553, A.VENDOR, 5494)

	-- Rainbow Fin Albacore -- 7827
	AddRecipe(7827, 50, 5095, Q.COMMON, GAME_ORIG, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 7827, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7827, A.VENDOR, 3178, A.VENDOR, 3333, A.VENDOR, 3497, A.VENDOR, 4305, A.VENDOR, 4307, A.VENDOR, 4553, A.VENDOR, 5494, A.VENDOR, 5748, A.VENDOR, 5942, A.VENDOR, 10118)

	-- Rockscale Cod -- 7828
	AddRecipe(7828, 175, 4594, Q.COMMON, GAME_ORIG, 175, 190, 210, 230)
	self:addTradeFlags(RecipeDB, 7828, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 7828, A.VENDOR, 2383, A.VENDOR, 2664, A.VENDOR, 3178, A.VENDOR, 3333, A.VENDOR, 4307, A.VENDOR, 4574, A.VENDOR, 5162, A.VENDOR, 12033, A.VENDOR, 12962)

	-- Savory Deviate Delight -- 8238
	AddRecipe(8238, 85, 6657, Q.UNCOMMON, GAME_ORIG, 85, 125, 145, 165)
	self:addTradeFlags(RecipeDB, 8238, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 8238, A.WORLD_DROP, 2)

	-- Herb Baked Egg -- 8604
	AddRecipe(8604, 1, 6888, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 8604, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 8604, A.CUSTOM, 8)

	-- Smoked Bear Meat -- 8607
	AddRecipe(8607, 40, 6890, Q.COMMON, GAME_ORIG, 40, 80, 100, 120)
	self:addTradeFlags(RecipeDB, 8607, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 8607, A.VENDOR, 1465, A.VENDOR, 3556)

	-- Thistle Tea -- 9513
	AddRecipe(9513, 60, 7676, Q.UNCOMMON, GAME_ORIG, 60, 100, 120, 140)
	self:addTradeFlags(RecipeDB, 9513, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.ROGUE, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 9513, A.QUEST, 2359, A.QUEST, 2478, A.VENDOR, 6779)

	-- Goldthorn Tea -- 13028
	AddRecipe(13028, 175, 10841, Q.COMMON, GAME_ORIG, 175, 175, 190, 205)
	self:addTradeFlags(RecipeDB, 13028, F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 13028, A.CUSTOM, 13)

	-- Lean Wolf Steak -- 15853
	AddRecipe(15853, 125, 12209, Q.COMMON, GAME_ORIG, 125, 165, 185, 205)
	self:addTradeFlags(RecipeDB, 15853, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15853, A.VENDOR, 12246)

	-- Roast Raptor -- 15855
	AddRecipe(15855, 175, 12210, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 15855, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15855, A.VENDOR, 734, A.VENDOR, 1148, A.VENDOR, 2810, A.VENDOR, 2821, A.VENDOR, 4879, A.VENDOR, 4897, A.VENDOR, 12245)

	-- Hot Wolf Ribs -- 15856
	AddRecipe(15856, 175, 13851, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 15856, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15856, A.VENDOR, 7947, A.VENDOR, 8145, A.VENDOR, 12246)

	-- Jungle Stew -- 15861
	AddRecipe(15861, 175, 12212, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 15861, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15861, A.VENDOR, 734, A.VENDOR, 1148, A.VENDOR, 12245)

	-- Carrion Surprise -- 15863
	AddRecipe(15863, 175, 12213, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 15863, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15863, A.VENDOR, 989, A.VENDOR, 4879, A.VENDOR, 9636, A.VENDOR, 12245)

	-- Mystery Stew -- 15865
	AddRecipe(15865, 175, 12214, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 15865, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15865, A.VENDOR, 4897, A.VENDOR, 8150, A.VENDOR, 12246)

	-- Dragonbreath Chili -- 15906
	AddRecipe(15906, 200, 12217, Q.COMMON, GAME_ORIG, 200, 225, 237, 250)
	self:addTradeFlags(RecipeDB, 15906, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 15906, A.VENDOR, 4879, A.VENDOR, 4897, A.VENDOR, 12246)

	-- Heavy Kodo Stew -- 15910
	AddRecipe(15910, 200, 12215, Q.COMMON, GAME_ORIG, 200, 225, 237, 250)
	self:addTradeFlags(RecipeDB, 15910, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15910, A.VENDOR, 8150, A.VENDOR, 9636, A.VENDOR, 12245)

	-- Spiced Chili Crab -- 15915
	AddRecipe(15915, 225, 12216, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 15915, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15915, A.VENDOR, 989, A.VENDOR, 1149, A.VENDOR, 4305)

	-- Monster Omelet -- 15933
	AddRecipe(15933, 225, 12218, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 15933, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15933, A.VENDOR, 2803, A.VENDOR, 2806, A.VENDOR, 11187)

	-- Crispy Bat Wing -- 15935
	AddRecipe(15935, 1, 12224, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 15935, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 15935, A.VENDOR, 2118)

	-- Spotted Yellowtail -- 18238
	AddRecipe(18238, 225, 6887, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 18238, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18238, A.VENDOR, 8137)

	-- Cooked Glossy Mightfish -- 18239
	AddRecipe(18239, 225, 13927, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 18239, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18239, A.VENDOR, 2664)

	-- Grilled Squid -- 18240
	AddRecipe(18240, 240, 13928, Q.COMMON, GAME_ORIG, 240, 265, 277, 290)
	self:addTradeFlags(RecipeDB, 18240, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	self:addTradeAcquire(RecipeDB, 18240, A.VENDOR, 8137)

	-- Filet of Redgill -- 18241
	AddRecipe(18241, 225, 13930, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 18241, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18241, A.VENDOR, 2664)

	-- Hot Smoked Bass -- 18242
	AddRecipe(18242, 240, 13929, Q.COMMON, GAME_ORIG, 240, 265, 277, 290)
	self:addTradeFlags(RecipeDB, 18242, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 18242, A.VENDOR, 2664)

	-- Nightfin Soup -- 18243
	AddRecipe(18243, 250, 13931, Q.COMMON, GAME_ORIG, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB, 18243, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 18243, A.VENDOR, 8137)

	-- Poached Sunscale Salmon -- 18244
	AddRecipe(18244, 250, 13932, Q.COMMON, GAME_ORIG, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB, 18244, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18244, A.VENDOR, 8137)

	-- Lobster Stew -- 18245
	AddRecipe(18245, 275, 13933, Q.COMMON, GAME_ORIG, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB, 18245, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18245, A.VENDOR, 7947, A.VENDOR, 8145)

	-- Mightfish Steak -- 18246
	AddRecipe(18246, 275, 13934, Q.COMMON, GAME_ORIG, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB, 18246, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18246, A.VENDOR, 7947, A.VENDOR, 8145)

	-- Baked Salmon -- 18247
	AddRecipe(18247, 275, 13935, Q.COMMON, GAME_ORIG, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB, 18247, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 18247, A.VENDOR, 7947, A.VENDOR, 8145)

	-- Undermine Clam Chowder -- 20626
	AddRecipe(20626, 225, 16766, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 20626, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 20626, A.VENDOR, 8139)

	-- Mithril Head Trout -- 20916
	AddRecipe(20916, 175, 8364, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 20916, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 20916, A.VENDOR, 2383, A.VENDOR, 2664, A.VENDOR, 3178, A.VENDOR, 3333, A.VENDOR, 4307, A.VENDOR, 4574, A.VENDOR, 5162, A.VENDOR, 12033, A.VENDOR, 12962)

	-- Gingerbread Cookie -- 21143
	AddRecipe(21143, 1, 17197, Q.COMMON, GAME_ORIG, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 21143, F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 21143, A.SEASONAL, 1, A.VENDOR, 13420, A.VENDOR, 13429, A.VENDOR, 13432, A.VENDOR, 13433, A.VENDOR, 13435, A.VENDOR, 23010, A.VENDOR, 23012, A.VENDOR, 23064)

	-- Egg Nog -- 21144
	AddRecipe(21144, 35, 17198, Q.COMMON, GAME_ORIG, 35, 75, 95, 115)
	self:addTradeFlags(RecipeDB, 21144, F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 21144, A.SEASONAL, 1, A.VENDOR, 13420, A.VENDOR, 13429, A.VENDOR, 13432, A.VENDOR, 13433, A.VENDOR, 13435, A.VENDOR, 23010, A.VENDOR, 23012, A.VENDOR, 23064)

	-- Spider Sausage -- 21175
	AddRecipe(21175, 200, 17222, Q.COMMON, GAME_ORIG, 200, 225, 237, 250)
	self:addTradeFlags(RecipeDB, 21175, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 21175, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Tender Wolf Steak -- 22480
	AddRecipe(22480, 225, 18045, Q.COMMON, GAME_ORIG, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB, 22480, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 22480, A.VENDOR, 4782, A.VENDOR, 7733, A.VENDOR, 8125)

	-- Runn Tum Tuber Surprise -- 22761
	AddRecipe(22761, 275, 18254, Q.UNCOMMON, GAME_ORIG, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB, 22761, F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 22761, A.MOB, 14354)

	-- Heavy Crocolisk Stew -- 24418
	AddRecipe(24418, 150, 20074, Q.COMMON, GAME_ORIG, 150, 160, 180, 200)
	self:addTradeFlags(RecipeDB, 24418, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 24418, A.VENDOR, 4879)

	-- Smoked Desert Dumplings -- 24801
	AddRecipe(24801, 285, 20452, Q.COMMON, GAME_ORIG, 285, 310, 322, 335)
	self:addTradeFlags(RecipeDB, 24801, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 24801, A.QUEST, 8313)

	-- Dirge's Kickin' Chimaerok Chops -- 25659
	AddRecipe(25659, 300, 21023, Q.EPIC, GAME_ORIG, 300, 325, 337, 350)
	self:addTradeFlags(RecipeDB, 25659, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 25659, A.QUEST, 8586)

	-- Smoked Sagefish -- 25704
	AddRecipe(25704, 80, 21072, Q.COMMON, GAME_ORIG, 80, 120, 140, 160)
	self:addTradeFlags(RecipeDB, 25704, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 25704, A.VENDOR, 2381, A.VENDOR, 2397, A.VENDOR, 2664, A.VENDOR, 3027, A.VENDOR, 3085, A.VENDOR, 3400, A.VENDOR, 4223, A.VENDOR, 4265, A.VENDOR, 4553, A.VENDOR, 5160, A.VENDOR, 5483, A.VENDOR, 8307, A.VENDOR, 12033, A.VENDOR, 14738, A.VENDOR, 16253, A.VENDOR, 16677, A.VENDOR, 16718, A.VENDOR, 17246, A.VENDOR, 19195, A.VENDOR, 26868)

	-- Sagefish Delight -- 25954
	AddRecipe(25954, 175, 21217, Q.COMMON, GAME_ORIG, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB, 25954, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 25954, A.VENDOR, 2381, A.VENDOR, 2397, A.VENDOR, 2664, A.VENDOR, 3027, A.VENDOR, 3085, A.VENDOR, 3400, A.VENDOR, 4223, A.VENDOR, 4265, A.VENDOR, 4553, A.VENDOR, 5160, A.VENDOR, 5483, A.VENDOR, 8307, A.VENDOR, 12033, A.VENDOR, 14738, A.VENDOR, 16253, A.VENDOR, 16677, A.VENDOR, 16718, A.VENDOR, 17246, A.VENDOR, 19195, A.VENDOR, 26868)

	-- Crunchy Spider Surprise -- 28267
	AddRecipe(28267, 60, 22645, Q.COMMON, GAME_TBC, 60, 100, 120, 140)
	self:addTradeFlags(RecipeDB, 28267, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 28267, A.QUEST, 9171, A.VENDOR, 16253, A.VENDOR, 18427)

	-- Lynx Steak -- 33276
	AddRecipe(33276, 1, 27635, Q.COMMON, GAME_TBC, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 33276, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33276, A.VENDOR, 16262)

	-- Roasted Moongraze Tenderloin -- 33277
	AddRecipe(33277, 1, 24105, Q.COMMON, GAME_TBC, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB, 33277, F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33277, A.QUEST, 9454)

	-- Bat Bites -- 33278
	AddRecipe(33278, 50, 27636, Q.COMMON, GAME_TBC, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB, 33278, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33278, A.VENDOR, 16253)

	-- Buzzard Bites -- 33279
	AddRecipe(33279, 300, 27651, Q.COMMON, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 33279, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33279, A.QUEST, 9356)

	-- Ravager Dog -- 33284
	AddRecipe(33284, 300, 27655, Q.COMMON, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 33284, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33284, A.VENDOR, 16585, A.VENDOR, 16826)

	-- Sporeling Snack -- 33285
	AddRecipe(33285, 310, 27656, Q.COMMON, GAME_TBC, 310, 330, 340, 350)
	self:addTradeFlags(RecipeDB, 33285, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33285, A.VENDOR, 18382)

	-- Blackened Basilisk -- 33286
	AddRecipe(33286, 315, 27657, Q.COMMON, GAME_TBC, 315, 335, 345, 355)
	self:addTradeFlags(RecipeDB, 33286, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33286, A.VENDOR, 18957, A.VENDOR, 19038)

	-- Roasted Clefthoof -- 33287
	AddRecipe(33287, 325, 27658, Q.COMMON, GAME_TBC, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB, 33287, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	self:addTradeAcquire(RecipeDB, 33287, A.VENDOR, 20096, A.VENDOR, 20097)

	-- Warp Burger -- 33288
	AddRecipe(33288, 325, 27659, Q.COMMON, GAME_TBC, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB, 33288, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	self:addTradeAcquire(RecipeDB, 33288, A.VENDOR, 18957, A.VENDOR, 19038)

	-- Talbuk Steak -- 33289
	AddRecipe(33289, 325, 27660, Q.COMMON, GAME_TBC, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB, 33289, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33289, A.VENDOR, 20096, A.VENDOR, 20097)

	-- Blackened Trout -- 33290
	AddRecipe(33290, 300, 27661, Q.COMMON, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 33290, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	self:addTradeAcquire(RecipeDB, 33290, A.VENDOR, 18015, A.VENDOR, 20028)

	-- Feltail Delight -- 33291
	AddRecipe(33291, 300, 27662, Q.COMMON, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 33291, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33291, A.VENDOR, 18011, A.VENDOR, 20028)

	-- Blackened Sporefish -- 33292
	AddRecipe(33292, 310, 27663, Q.COMMON, GAME_TBC, 310, 330, 340, 350)
	self:addTradeFlags(RecipeDB, 33292, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33292, A.VENDOR, 18911)

	-- Grilled Mudfish -- 33293
	AddRecipe(33293, 320, 27664, Q.COMMON, GAME_TBC, 320, 340, 350, 360)
	self:addTradeFlags(RecipeDB, 33293, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	self:addTradeAcquire(RecipeDB, 33293, A.VENDOR, 20096, A.VENDOR, 20097)

	-- Poached Bluefish -- 33294
	AddRecipe(33294, 320, 27665, Q.COMMON, GAME_TBC, 320, 340, 350, 360)
	self:addTradeFlags(RecipeDB, 33294, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33294, A.VENDOR, 20096, A.VENDOR, 20097)

	-- Golden Fish Sticks -- 33295
	AddRecipe(33295, 325, 27666, Q.COMMON, GAME_TBC, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB, 33295, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33295, A.VENDOR, 18960, A.VENDOR, 19296)

	-- Spicy Crawdad -- 33296
	AddRecipe(33296, 350, 27667, Q.COMMON, GAME_TBC, 350, 370, 375, 380)
	self:addTradeFlags(RecipeDB, 33296, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 33296, A.VENDOR, 18960, A.VENDOR, 19296)

	-- Clam Bar -- 36210
	AddRecipe(36210, 300, 30155, Q.COMMON, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 36210, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 36210, A.VENDOR, 18382)

	-- Spice Bread -- 37836
	AddRecipe(37836, 1, 30816, Q.COMMON, GAME_TBC, 1, 30, 35, 38)
	self:addTradeFlags(RecipeDB, 37836, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 37836, A.TRAINER, 1355, A.TRAINER, 1382, A.TRAINER, 1430, A.TRAINER, 1699, A.TRAINER, 3026, A.TRAINER, 3067, A.TRAINER, 3087, A.TRAINER, 3399, A.TRAINER, 4210, A.TRAINER, 4552, A.TRAINER, 5159, A.TRAINER, 5482, A.TRAINER, 6286, A.TRAINER, 8306, A.TRAINER, 16253, A.TRAINER, 16277, A.TRAINER, 16676, A.TRAINER, 16719, A.TRAINER, 17246, A.TRAINER, 18987, A.TRAINER, 18988, A.TRAINER, 18993, A.TRAINER, 19185, A.TRAINER, 19369)

	-- Mok'Nathal Shortribs -- 38867
	AddRecipe(38867, 335, 31672, Q.COMMON, GAME_TBC, 335, 355, 365, 375)
	self:addTradeFlags(RecipeDB, 38867, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 38867, A.QUEST, 10860, A.VENDOR, 20916, A.VENDOR, 21113)

	-- Crunchy Serpent -- 38868
	AddRecipe(38868, 335, 31673, Q.COMMON, GAME_TBC, 335, 355, 365, 375)
	self:addTradeFlags(RecipeDB, 38868, F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 38868, A.QUEST, 10860, A.VENDOR, 20916, A.VENDOR, 21113)

	-- Stewed Trout -- 42296
	AddRecipe(42296, 320, 33048, Q.COMMON, GAME_TBC, 320, 335, 345, 355)
	self:addTradeFlags(RecipeDB, 42296, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 42296, A.TRAINER, 19186)

	-- Fisherman's Feast -- 42302
	AddRecipe(42302, 350, 33052, Q.COMMON, GAME_TBC, 350, 375, 380, 385)
	self:addTradeFlags(RecipeDB, 42302, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 42302, A.TRAINER, 19186)

	-- Hot Buttered Trout -- 42305
	AddRecipe(42305, 350, 33053, Q.COMMON, GAME_TBC, 350, 375, 380, 385)
	self:addTradeFlags(RecipeDB, 42305, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 42305, A.TRAINER, 19186)

	-- Skullfish Soup -- 43707
	AddRecipe(43707, 325, 33825, Q.UNCOMMON, GAME_TBC, 325, 335, 345, 355)
	self:addTradeFlags(RecipeDB, 43707, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 43707, A.CUSTOM, 6)

	-- Stormchops -- 43758
	AddRecipe(43758, 300, 33866, Q.RARE, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 43758, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 43758, A.CUSTOM, 5, A.CUSTOM, 6, A.CUSTOM, 38)

	-- Broiled Bloodfin -- 43761
	AddRecipe(43761, 300, 33867, Q.UNCOMMON, GAME_TBC, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB, 43761, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 43761, A.CUSTOM, 6)

	-- Spicy Hot Talbuk -- 43765
	AddRecipe(43765, 325, 33872, Q.UNCOMMON, GAME_TBC, 325, 335, 345, 355)
	self:addTradeFlags(RecipeDB, 43765, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 43765, A.CUSTOM, 5)

	-- Kibler's Bits -- 43772
	AddRecipe(43772, 300, 33874, Q.UNCOMMON, GAME_TBC, 300, 345, 355, 365)
	self:addTradeFlags(RecipeDB, 43772, F.ALLIANCE, F.HORDE, F.QUEST, F.HUNTER, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 43772, A.CUSTOM, 5)

	-- Delicious Chocolate Cake -- 43779
	AddRecipe(43779, 1, 33924, Q.RARE, GAME_TBC, 1, 50, 62, 75)
	self:addTradeFlags(RecipeDB, 43779, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 43779, A.CUSTOM, 5, A.CUSTOM, 6, A.CUSTOM, 38)

	-- Hot Apple Cider -- 45022
	AddRecipe(45022, 325, 34411, Q.COMMON, GAME_WOTLK, 325, 325, 325, 325)
	self:addTradeFlags(RecipeDB, 45022, F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 45022, A.SEASONAL, 1, A.VENDOR, 13420, A.VENDOR, 13433)

	-- Mammoth Meal -- 45549
	AddRecipe(45549, 350, 34748, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45549, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 45549, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Shoveltusk Steak -- 45550
	AddRecipe(45550, 350, 34749, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45550, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 45550, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Worm Delight -- 45551
	AddRecipe(45551, 350, 34750, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45551, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45551, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Roasted Worg -- 45552
	AddRecipe(45552, 350, 34751, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45552, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45552, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Rhino Dogs -- 45553
	AddRecipe(45553, 350, 34752, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45553, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45553, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Great Feast -- 45554
	AddRecipe(45554, 375, 34753, Q.COMMON, GAME_WOTLK, 375, 375, 400, 425)
	self:addTradeFlags(RecipeDB, 45554, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 45554, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Mega Mammoth Meal -- 45555
	AddRecipe(45555, 400, 34754, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45555, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 45555, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Tender Shoveltusk Steak -- 45556
	AddRecipe(45556, 400, 34755, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45556, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 45556, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Spiced Worm Burger -- 45557
	AddRecipe(45557, 400, 34756, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45557, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45557, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Very Burnt Worg -- 45558
	AddRecipe(45558, 400, 34757, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45558, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45558, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Mighty Rhino Dogs -- 45559
	AddRecipe(45559, 400, 34758, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45559, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45559, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Smoked Rockfin -- 45560
	AddRecipe(45560, 350, 34759, Q.COMMON, GAME_WOTLK, 350, 350, 365, 380)
	self:addTradeFlags(RecipeDB, 45560, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45560, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Grilled Bonescale -- 45561
	AddRecipe(45561, 350, 34760, Q.COMMON, GAME_WOTLK, 350, 350, 365, 380)
	self:addTradeFlags(RecipeDB, 45561, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45561, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Sauteed Goby -- 45562
	AddRecipe(45562, 350, 34761, Q.COMMON, GAME_WOTLK, 350, 350, 365, 380)
	self:addTradeFlags(RecipeDB, 45562, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45562, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Grilled Sculpin -- 45563
	AddRecipe(45563, 350, 34762, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45563, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 45563, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Smoked Salmon -- 45564
	AddRecipe(45564, 350, 34763, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45564, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 45564, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Poached Nettlefish -- 45565
	AddRecipe(45565, 350, 34764, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45565, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45565, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Pickled Fangtooth -- 45566
	AddRecipe(45566, 350, 34765, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45566, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45566, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Poached Northern Sculpin -- 45567
	AddRecipe(45567, 400, 34766, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45567, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 45567, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Firecracker Salmon -- 45568
	AddRecipe(45568, 400, 34767, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45568, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 45568, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Baked Manta Ray -- 45569
	AddRecipe(45569, 350, 42942, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 45569, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45569, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Imperial Manta Steak -- 45570
	AddRecipe(45570, 400, 34769, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45570, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45570, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Spicy Blue Nettlefish -- 45571
	AddRecipe(45571, 400, 34768, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 45571, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45571, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Captain Rumsey's Lager -- 45695
	AddRecipe(45695, 100, 34832, Q.UNCOMMON, GAME_WOTLK, 100, 100, 105, 110)
	self:addTradeFlags(RecipeDB, 45695, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 45695, A.CUSTOM, 7)

	-- Charred Bear Kabobs -- 46684
	AddRecipe(46684, 250, 35563, Q.COMMON, GAME_WOTLK, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB, 46684, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	self:addTradeAcquire(RecipeDB, 46684, A.VENDOR, 2803, A.VENDOR, 2806)

	-- Juicy Bear Burger -- 46688
	AddRecipe(46688, 250, 35565, Q.COMMON, GAME_WOTLK, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB, 46688, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 46688, A.VENDOR, 2803, A.VENDOR, 2806)

	-- Kungaloosh -- 53056
	AddRecipe(53056, 375, 39520, Q.COMMON, GAME_WOTLK, 375, 375, 387, 400)
	self:addTradeFlags(RecipeDB, 53056, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 53056, A.QUEST, 13571, A.CUSTOM, 36)

	-- Northern Stew -- 57421
	AddRecipe(57421, 350, 34747, Q.COMMON, GAME_WOTLK, 350, 350, 362, 365)
	self:addTradeFlags(RecipeDB, 57421, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 57421, A.QUEST, 13087, A.QUEST, 13088, A.QUEST, 13089, A.QUEST, 13090)

	-- Fish Feast -- 57423
	AddRecipe(57423, 450, 43015, Q.COMMON, GAME_WOTLK, 450, 455, 460, 465)
	self:addTradeFlags(RecipeDB, 57423, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 57423, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Spicy Fried Herring -- 57433
	AddRecipe(57433, 400, 42993, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57433, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 57433, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Rhinolicious Wormsteak -- 57434
	AddRecipe(57434, 400, 42994, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57434, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 57434, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Critter Bites -- 57435
	AddRecipe(57435, 400, 43004, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57435, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 57435, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Hearty Rhino -- 57436
	AddRecipe(57436, 400, 42995, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57436, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 57436, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Snapper Extreme -- 57437
	AddRecipe(57437, 400, 42996, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57437, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 57437, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Blackened Worg Steak -- 57438
	AddRecipe(57438, 400, 42997, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57438, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 57438, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Cuttlesteak -- 57439
	AddRecipe(57439, 400, 42998, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57439, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 57439, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Spiced Mammoth Treats -- 57440
	AddRecipe(57440, 400, 43005, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57440, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 57440, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Blackened Dragonfin -- 57441
	AddRecipe(57441, 400, 42999, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57441, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 57441, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Dragonfin Filet -- 57442
	AddRecipe(57442, 400, 43000, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57442, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS)
	self:addTradeAcquire(RecipeDB, 57442, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Tracker Snacks -- 57443
	AddRecipe(57443, 400, 43001, Q.UNCOMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 57443, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 57443, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Dalaran Clam Chowder -- 58065
	AddRecipe(58065, 350, 43268, Q.COMMON, GAME_WOTLK, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB, 58065, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 58065, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Tasty Cupcake -- 58512
	AddRecipe(58512, 350, 43490, Q.UNCOMMON, GAME_WOTLK, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB, 58512, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 58512, A.WORLD_DROP, 2)

	-- Last Week's Mammoth -- 58521
	AddRecipe(58521, 350, 43488, Q.UNCOMMON, GAME_WOTLK, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB, 58521, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 58521, A.WORLD_DROP, 2)

	-- Bad Clams -- 58523
	AddRecipe(58523, 350, 43491, Q.UNCOMMON, GAME_WOTLK, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB, 58523, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 58523, A.WORLD_DROP, 2)

	-- Haunted Herring -- 58525
	AddRecipe(58525, 350, 43492, Q.UNCOMMON, GAME_WOTLK, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB, 58525, F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 58525, A.WORLD_DROP, 2)

	-- Gigantic Feast -- 58527
	AddRecipe(58527, 425, 43478, Q.UNCOMMON, GAME_WOTLK, 425, 435, 455, 475)
	self:addTradeFlags(RecipeDB, 58527, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 58527, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Small Feast -- 58528
	AddRecipe(58528, 425, 43480, Q.UNCOMMON, GAME_WOTLK, 425, 435, 455, 475)
	self:addTradeFlags(RecipeDB, 58528, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 58528, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Worg Tartare -- 62350
	AddRecipe(62350, 400, 44953, Q.COMMON, GAME_WOTLK, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB, 62350, F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 62350, A.VENDOR, 31031, A.VENDOR, 31032)

	-- Clamlette Magnifique -- 64054
	AddRecipe(64054, 250, 33004, Q.COMMON, GAME_WOTLK, 250, 250, 275, 300)
	self:addTradeFlags(RecipeDB, 64054, F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 64054, A.QUEST, 6610)

	-- Black Jelly -- 64358
	AddRecipe(64358, 400, 45932, Q.COMMON, GAME_WOTLK, 400, 400, 412, 425)
	self:addTradeFlags(RecipeDB, 64358, F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	self:addTradeAcquire(RecipeDB, 64358, A.TRAINER, 26905, A.TRAINER, 26953, A.TRAINER, 26972, A.TRAINER, 26989, A.TRAINER, 28705, A.TRAINER, 29631, A.TRAINER, 33587)

	-- Bread of the Dead -- 65454
	AddRecipe(65454, 45, 46691, Q.COMMON, GAME_WOTLK, 45, 55, 60, 65)
	self:addTradeFlags(RecipeDB, 65454, F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	self:addTradeAcquire(RecipeDB, 65454, A.SEASONAL, 6)

	-- Some recipes are only availible to specific factions.
	-- We only add the faction specific recipes if the user is part of that faction
	local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()
	local _,faction = UnitFactionGroup("player")

	if faction == BFAC["Alliance"] then
	
		-- Pumpkin Pie -- 62044
		AddRecipe(62044, 100, 44839, Q.COMMON, GAME_WOTLK, 100, 150, 162, 175)
		self:addTradeFlags(RecipeDB, 62044, F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
		self:addTradeAcquire(RecipeDB, 62044, A.SEASONAL, 5)

		-- Slow-Roasted Turkey -- 62045
		AddRecipe(62045, 330, 44839, Q.COMMON, GAME_WOTLK, 330,330, 342, 355)
		self:addTradeFlags(RecipeDB, 62045, F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP, F.DPS)
		self:addTradeAcquire(RecipeDB, 62045, A.SEASONAL, 5)

		-- Cranberry Chutney -- 62049
		AddRecipe(62049, 210, 44840, Q.COMMON, GAME_WOTLK, 210, 210, 222, 235)
		self:addTradeFlags(RecipeDB, 62049, F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
		self:addTradeAcquire(RecipeDB, 62049, A.SEASONAL, 5)

		-- Spice Bread Stuffing -- 62050
		AddRecipe(62050, 90, 44837, Q.COMMON, GAME_WOTLK, 90, 90, 102, 115)
		self:addTradeFlags(RecipeDB, 62050, F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOE)
		self:addTradeAcquire(RecipeDB, 62050, A.SEASONAL, 5)

		-- Candied Sweet Potatoes -- 62051
		AddRecipe(62051, 270, 44839, Q.COMMON, GAME_WOTLK, 270, 270, 282, 295)
		self:addTradeFlags(RecipeDB, 62051, F.ALLIANCE, F.SEASONAL, F.IBOE, F.RBOP)
		self:addTradeAcquire(RecipeDB, 62051, A.SEASONAL, 5)
		
	elseif faction == BFAC["Horde"] then
		
		-- Candied Sweet Potatoes -- 66034
		AddRecipe(66034, 270, 44839, Q.COMMON, GAME_WOTLK, 270, 270, 282, 295)
		self:addTradeFlags(RecipeDB, 66034,  F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
		self:addTradeAcquire(RecipeDB, 66034, A.SEASONAL, 5)

		-- Cranberry Chutney -- 66035
		AddRecipe(66035, 210, 44840, Q.COMMON, GAME_WOTLK, 210, 210, 222, 235)
		self:addTradeFlags(RecipeDB, 66035, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
		self:addTradeAcquire(RecipeDB, 66035, A.SEASONAL, 5)

		-- Pumpkin Pie -- 66036
		AddRecipe(66036, 100, 44839, Q.COMMON, GAME_WOTLK, 100, 150, 162, 175)
		self:addTradeFlags(RecipeDB, 66036,  F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
		self:addTradeAcquire(RecipeDB, 66036, A.SEASONAL, 5)

		-- Slow-Roasted Turkey -- 66037
		AddRecipe(66037, 330, 44839, Q.COMMON, GAME_WOTLK, 330,330, 342, 355)
		self:addTradeFlags(RecipeDB, 66037,  F.HORDE, F.SEASONAL, F.IBOE, F.RBOP, F.DPS)
		self:addTradeAcquire(RecipeDB, 66037, A.SEASONAL, 5)

		-- Spice Bread Stuffing -- 66038
		AddRecipe(66038, 90, 44837, Q.COMMON, GAME_WOTLK, 90, 90, 102, 115)
		self:addTradeFlags(RecipeDB, 66038, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
		self:addTradeAcquire(RecipeDB, 66038, A.SEASONAL, 5)
	
	end
	
	return num_recipes
	
end
