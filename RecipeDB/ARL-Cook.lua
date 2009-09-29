--[[

************************************************************************

ARL-Cook.lua

Cooking data for all of Ackis Recipe List

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	AddRecipe( Spell ID, Skill Level, Item ID, Rarity, Specialty)

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME = "Ackis Recipe List"
local addon = LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L = LibStub("AceLocale-3.0"):GetLocale(MODNAME)

-------------------------------------------------------------------------------
-- Item "rarity"
-------------------------------------------------------------------------------
local R_COMMON, R_UNCOMMON, R_RARE, R_EPIC, R_LEGENDARY, R_ARTIFACT = 1, 2, 3, 4, 5, 6

-------------------------------------------------------------------------------
-- Origin
-------------------------------------------------------------------------------
local GAME_ORIG, GAME_TBC, GAME_WOTLK = 0, 1, 2

-------------------------------------------------------------------------------
-- Filter flags
-------------------------------------------------------------------------------
local F_ALLIANCE, F_HORDE, F_TRAINER, F_VENDOR, F_INSTANCE, F_RAID = 1, 2, 3, 4, 5, 6
local F_SEASONAL, F_QUEST, F_PVP, F_WORLD_DROP, F_MOB_DROP, F_DISC = 7, 8, 9, 10, 11, 12
local F_DK, F_DRUID, F_HUNTER, F_MAGE, F_PALADIN, F_PRIEST, F_SHAMAN, F_ROGUE, F_WARLOCK, F_WARRIOR = 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
local F_IBOE, F_IBOP, F_IBOA, F_RBOE, F_RBOP, F_RBOA = 36, 37, 38, 40, 41, 42
local F_DPS, F_TANK, F_HEALER, F_CASTER = 51, 52, 53, 54
local F_CLOTH, F_LEATHER, F_MAIL, F_PLATE, F_CLOAK, F_TRINKET, F_RING, F_NECK, F_SHIELD = 56, 57, 58, 59, 60, 61, 62, 63, 64
local F_1H, F_2H, F_AXE, F_SWORD, F_MACE, F_POLEARM, F_DAGGER = 66, 67, 68, 69, 70, 71, 72
local F_STAFF, F_WAND, F_THROWN, F_BOW, F_XBOW, F_AMMO, F_FIST, F_GUN = 73, 74, 75, 76, 77, 78, 79, 80

-------------------------------------------------------------------------------
-- Reputation Filter flags
-------------------------------------------------------------------------------
local F_ARGENTDAWN, F_CENARION_CIRCLE, F_THORIUM_BROTHERHOOD, F_TIMBERMAW_HOLD, F_ZANDALAR = 96, 97, 98, 99, 100
local F_ALDOR, F_ASHTONGUE, F_CENARION_EXPIDITION, F_HELLFIRE, F_CONSORTIUM = 101, 102, 103, 104, 105
local F_KOT, F_LOWERCITY, F_NAGRAND, F_SCALE_SANDS, F_SCRYER, F_SHATAR = 106, 107, 108, 109, 110
local F_SHATTEREDSUN, F_SPOREGGAR, F_VIOLETEYE = 111, 112, 113, 114
local F_ARGENTCRUSADE, F_FRENZYHEART, F_EBONBLADE, F_KIRINTOR, F_HODIR = 115, 116, 117, 118, 119
local F_KALUAK, F_ORACLES, F_WYRMREST, F_WRATHCOMMON1, F_WRATHCOMMON2 = 120, 121, 122, 123, 124
local F_WRATHCOMMON3, F_WRATHCOMMON4, F_WRATHCOMMON5 = 125, 126, 127

-------------------------------------------------------------------------------
-- Acquire types
-------------------------------------------------------------------------------
local A_TRAINER, A_VENDOR, A_MOB, A_QUEST, A_SEASONAL, A_REPUTATION, A_WORLD_DROP, A_CUSTOM = 1, 2, 3, 4, 5, 6, 7, 8

-------------------------------------------------------------------------------
-- Reputation Acquire Flags
-------------------------------------------------------------------------------
local R_WINTERSPRING = 589

-------------------------------------------------------------------------------
-- Reputation Levels
-------------------------------------------------------------------------------
local FRIENDLY = 1
local HONORED = 2
local REVERED = 3
local EXALTED = 4

local initialized = false
local num_recipes = 0

function addon:InitCooking(RecipeDB)

	if initialized then
		return num_recipes
	end

	initialized = true

	-------------------------------------------------------------------------------
	-- Counter and wrapper function
	-------------------------------------------------------------------------------
	local function AddRecipe(SpellID, Skill, ItemID, Rarity, Game, Orange, Yellow, Green, Gray)
		num_recipes = num_recipes + 1
		self:addTradeSkill(RecipeDB, SpellID, Skill, ItemID, Rarity, 2550, nil, Game, Orange, Yellow, Green, Gray)
	end

	-- Charred Wolf Meat -- 2538
	AddRecipe(2538, 1, 2679, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,2538, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB, 2538, A_CUSTOM, 8)

	-- Spiced Wolf Meat -- 2539
	AddRecipe(2539, 10, 2680, R_COMMON, 0, 10, 50, 70, 90)
	self:addTradeFlags(RecipeDB,2539, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2539,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,
	3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Roasted Boar Meat -- 2540
	AddRecipe(2540, 1, 2681, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,2540, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,2540,8,8)

	-- Coyote Steak -- 2541
	AddRecipe(2541, 50, 2684, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,2541, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2541,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,
	3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Goretusk Liver Pie -- 2542
	AddRecipe(2542, 50, 724, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,2542, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2542,4,22,2,340)

	-- Westfall Stew -- 2543
	AddRecipe(2543, 75, 733, R_COMMON, 0, 75, 115, 135, 155)
	self:addTradeFlags(RecipeDB,2543, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,2543,4,38,2,340)

	-- Crab Cake -- 2544
	AddRecipe(2544, 75, 2683, R_COMMON, 0, 75, 115, 135, 155)
	self:addTradeFlags(RecipeDB,2544, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2544,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,
	3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Cooked Crab Claw -- 2545
	AddRecipe(2545, 85, 2682, R_COMMON, 0, 85, 125, 145, 165)
	self:addTradeFlags(RecipeDB,2545, F_ALLIANCE, F_HORDE,4,10, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,2545,7,1,2,340)

	-- Dry Pork Ribs -- 2546
	AddRecipe(2546, 80, 2687, R_COMMON, 0, 80, 120, 140, 160)
	self:addTradeFlags(RecipeDB,2546, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2546,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,
	3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Redridge Goulash -- 2547
	AddRecipe(2547, 100, 1082, R_COMMON, 0, 100, 135, 155, 175)
	self:addTradeFlags(RecipeDB,2547, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2547,4,92,2,340)

	-- Succulent Pork Ribs -- 2548
	AddRecipe(2548, 110, 2685, R_COMMON, 0, 110, 130, 150, 170)
	self:addTradeFlags(RecipeDB,2548, F_ALLIANCE, F_HORDE,4,10, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,2548,7,1,2,340)

	-- Seasoned Wolf Kabob -- 2549
	AddRecipe(2549, 100, 1017, R_COMMON, 0, 100, 140, 160, 180)
	self:addTradeFlags(RecipeDB,2549, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2549,4,90,2,340)

	-- Beer Basted Boar Ribs -- 2795
	AddRecipe(2795, 10, 2888, R_COMMON, 0, 10, 60, 80, 100)
	self:addTradeFlags(RecipeDB,2795, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,2795,4,384,2,340)

	-- Crocolisk Steak -- 3370
	AddRecipe(3370, 80, 3662, R_COMMON, 0, 80, 120, 140, 160)
	self:addTradeFlags(RecipeDB,3370, F_ALLIANCE, F_HORDE,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3370,4,385,2,340)

	-- Blood Sausage -- 3371
	AddRecipe(3371, 60, 3220, R_COMMON, 0, 60, 100, 120, 140)
	self:addTradeFlags(RecipeDB,3371, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3371,4,418,2,340)

	-- Murloc Fin Soup -- 3372
	AddRecipe(3372, 90, 3663, R_COMMON, 0, 90, 130, 150, 170)
	self:addTradeFlags(RecipeDB,3372, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3372,4,127,2,340)

	-- Crocolisk Gumbo -- 3373
	AddRecipe(3373, 120, 3664, R_COMMON, 0, 120, 160, 180, 200)
	self:addTradeFlags(RecipeDB,3373, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3373,4,471,2,340)

	-- Curiously Tasty Omelet -- 3376
	AddRecipe(3376, 130, 3665, R_COMMON, 0, 130, 170, 190, 210)
	self:addTradeFlags(RecipeDB,3376, F_ALLIANCE, F_HORDE,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3376,4,296,2,340,2,1148,2,2821)

	-- Gooey Spider Cake -- 3377
	AddRecipe(3377, 110, 3666, R_COMMON, 0, 110, 150, 170, 190)
	self:addTradeFlags(RecipeDB,3377, F_ALLIANCE, F_VENDOR, F_QUEST, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3377,4,93,2,340)

	-- Big Bear Steak -- 3397
	AddRecipe(3397, 110, 3726, R_COMMON, 0, 10, 150, 170, 190)
	self:addTradeFlags(RecipeDB,3397, F_ALLIANCE, F_HORDE,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3397,4,498,2,3960,2,12246)

	-- Hot Lion Chops -- 3398
	AddRecipe(3398, 125, 3727, R_COMMON, 0, 125, 175, 195, 215)
	self:addTradeFlags(RecipeDB,3398, F_ALLIANCE, F_HORDE,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3398,4,501,2,3489,2,12245)

	-- Tasty Lion Steak -- 3399
	AddRecipe(3399, 150, 3728, R_COMMON, 0, 150, 190, 210, 230)
	self:addTradeFlags(RecipeDB,3399,1,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3399,4,564)

	-- Soothing Turtle Bisque -- 3400
	AddRecipe(3400, 175, 3729, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,3400, F_ALLIANCE, F_HORDE,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,3400,4,555,4,7321)

	-- Barbecued Buzzard Wing -- 4094
	AddRecipe(4094, 175, 4457, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,4094, F_ALLIANCE, F_HORDE, F_TRAINER,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,4094,4,703,1,2818,2,2814,2,12246)

	-- Kaldorei Spider Kabob -- 6412
	AddRecipe(6412, 10, 5472, R_COMMON, 0, 10, 50, 70, 90)
	self:addTradeFlags(RecipeDB,6412,1,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6412,4,4161)

	-- Scorpid Surprise -- 6413
	AddRecipe(6413, 20, 5473, R_COMMON, 0, 20, 60, 80, 100)
	self:addTradeFlags(RecipeDB,6413,2,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,6413,2,3881)

	-- Roasted Kodo Meat -- 6414
	AddRecipe(6414, 35, 5474, R_COMMON, 0, 35, 75, 95, 115)
	self:addTradeFlags(RecipeDB,6414,2,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6414,2,3081)

	-- Fillet of Frenzy -- 6415
	AddRecipe(6415, 50, 5476, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,6415,1,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6415,2,4200)

	-- Strider Stew -- 6416
	AddRecipe(6416, 50, 5477, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,6416, F_ALLIANCE, F_HORDE,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6416,4,2178,2,3482)

	-- Crispy Lizard Tail -- 6418
	AddRecipe(6418, 100, 5479, R_COMMON, 0, 100, 140, 160, 180)
	self:addTradeFlags(RecipeDB,6418,2,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6418,2,3482)

	-- Lean Venison -- 6419
	AddRecipe(6419, 110, 5480, R_COMMON, 0, 110, 150, 170, 190)
	self:addTradeFlags(RecipeDB,6419, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6419,2,3960,2,12245)

	-- Boiled Clams -- 6499
	AddRecipe(6499, 50, 5525, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,6499, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6499,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,
	3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Goblin Deviled Clams -- 6500
	AddRecipe(6500, 125, 5527, R_COMMON, 0, 125, 165, 185, 205)
	self:addTradeFlags(RecipeDB,6500, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,6500,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,
	3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Clam Chowder -- 6501
	AddRecipe(6501, 90, 5526, R_COMMON, 0, 90, 130, 150, 170)
	self:addTradeFlags(RecipeDB,6501,1,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,6501,2,4305,2,4307)

	-- Giant Clam Scorcho -- 7213
	AddRecipe(7213, 175, 6038, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,7213, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,7213,2,2664)

	-- Brilliant Smallfish -- 7751
	AddRecipe(7751, 1, 6290, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,7751, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7751,2,66,2,1684,2,3029,2,3550,2,4265,2,4574,2,
	5494,2,5940,2,8508)

	-- Slitherskin Mackerel -- 7752
	AddRecipe(7752, 1, 787, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,7752, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7752,2,3550,2,4305,2,5162,2,5942,2,10118)

	-- Longjaw Mud Snapper -- 7753
	AddRecipe(7753, 50, 4592, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,7753, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7753,2,66,2,1684,2,3027,2,4265,2,4574,2,5162,2,
	5748,2,5940)

	-- Loch Frenzy Delight -- 7754
	AddRecipe(7754, 50, 6316, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,7754,1,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7754,2,1684)

	-- Bristle Whisker Catfish -- 7755
	AddRecipe(7755, 100, 4593, R_COMMON, 0, 100, 140, 160, 180)
	self:addTradeFlags(RecipeDB,7755, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7755,2,2383,2,2397,2,3027,2,3029,2,3497,2,4553,2,
	5494)

	-- Rainbow Fin Albacore -- 7827
	AddRecipe(7827, 50, 5095, R_COMMON, 0, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,7827, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7827,2,3178,2,3333,2,3497,2,4305,2,4307,2,4553,2,
	5494,2,5748,2,5942,2,10118)

	-- Rockscale Cod -- 7828
	AddRecipe(7828, 175, 4594, R_COMMON, 0, 175, 190, 210, 230)
	self:addTradeFlags(RecipeDB,7828, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,7828,2,2383,2,2664,2,3178,2,3333,2,4307,2,4574,2,
	5162,2,12033,2,12962)

	-- Savory Deviate Delight -- 8238
	AddRecipe(8238, 85, 6657, R_UNCOMMON, 0, 85, 125, 145, 165)
	self:addTradeFlags(RecipeDB,8238, F_ALLIANCE, F_HORDE,10, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,8238,7,2)

	-- Herb Baked Egg -- 8604
	AddRecipe(8604, 1, 6888, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,8604, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,8604,8,8)

	-- Smoked Bear Meat -- 8607
	AddRecipe(8607, F_RBOE,6890,1,0, F_RBOE,80,100,120)
	self:addTradeFlags(RecipeDB,8607, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,8607,2,1465,2,3556)

	-- Thistle Tea -- 9513
	AddRecipe(9513, 60, 7676, R_UNCOMMON, 0, 60, 100, 120, 140)
	self:addTradeFlags(RecipeDB,9513, F_ALLIANCE, F_HORDE,4,8, F_ROGUE, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,9513,4,2359,4,2478,2,6779)

	-- Goldthorn Tea -- 13028
	AddRecipe(13028, 175, 10841, R_COMMON, 0, 175, 175, 190, 205)
	self:addTradeFlags(RecipeDB,13028, F_ALLIANCE, F_HORDE,5, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,13028,8,13)

	-- Lean Wolf Steak -- 15853
	AddRecipe(15853, 125, 12209, R_COMMON, 0, 125, 165, 185, 205)
	self:addTradeFlags(RecipeDB,15853, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15853,2,12246)

	-- Roast Raptor -- 15855
	AddRecipe(15855, 175, 12210, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,15855, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15855,2,734,2,1148,2,2810,2,2821,2,4879,2,4897,2,
	12245)

	-- Hot Wolf Ribs -- 15856
	AddRecipe(15856, 175, 13851, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,15856, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15856,2,7947,2,8145,2,12246)

	-- Jungle Stew -- 15861
	AddRecipe(15861, 175, 12212, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,15861, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15861,2,734,2,1148,2,12245)

	-- Carrion Surprise -- 15863
	AddRecipe(15863, 175, 12213, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,15863, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15863,2,989,2,4879,2,9636,2,12245)

	-- Mystery Stew -- 15865
	AddRecipe(15865, 175, 12214, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,15865, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15865,2,4897,2,8150,2,12246)

	-- Dragonbreath Chili -- 15906
	AddRecipe(15906, 200, 12217, R_COMMON, 0, 200, 225, 237, 250)
	self:addTradeFlags(RecipeDB,15906, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,15906,2,4879,2,4897,2,12246)

	-- Heavy Kodo Stew -- 15910
	AddRecipe(15910, 200, 12215, R_COMMON, 0, 200, 225, 237, 250)
	self:addTradeFlags(RecipeDB,15910, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15910,2,8150,2,9636,2,12245)

	-- Spiced Chili Crab -- 15915
	AddRecipe(15915, 225, 12216, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,15915, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15915,2,989,2,1149,2,4305)

	-- Monster Omelet -- 15933
	AddRecipe(15933, 225, 12218, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,15933, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15933,2,2803,2,2806,2,11187)

	-- Crispy Bat Wing -- 15935
	AddRecipe(15935, 1, 12224, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,15935,2,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,15935,2,2118)

	-- Spotted Yellowtail -- 18238
	AddRecipe(18238, 225, 6887, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,18238, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18238,2,8137)

	-- Cooked Glossy Mightfish -- 18239
	AddRecipe(18239, 225, 13927, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,18239, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18239,2,2664)

	-- Grilled Squid -- 18240
	AddRecipe(18240, 240, 13928, R_COMMON, 0, 240, 265, 277, 290)
	self:addTradeFlags(RecipeDB,18240, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE,51)
	self:addTradeAcquire(RecipeDB,18240,2,8137)

	-- Filet of Redgill -- 18241
	AddRecipe(18241, 225, 13930, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,18241, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18241,2,2664)

	-- Hot Smoked Bass -- 18242
	AddRecipe(18242, 240, 13929, R_COMMON, 0, 240, 265, 277, 290)
	self:addTradeFlags(RecipeDB,18242, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,18242,2,2664)

	-- Nightfin Soup -- 18243
	AddRecipe(18243, 250, 13931, R_COMMON, 0, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB,18243, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,18243,2,8137)

	-- Poached Sunscale Salmon -- 18244
	AddRecipe(18244, 250, 13932, R_COMMON, 0, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB,18244, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18244,2,8137)

	-- Lobster Stew -- 18245
	AddRecipe(18245, 275, 13933, R_COMMON, 0, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB,18245, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18245,2,7947,2,8145)

	-- Mightfish Steak -- 18246
	AddRecipe(18246, 275, 13934, R_COMMON, 0, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB,18246, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18246,2,7947,2,8145)

	-- Baked Salmon -- 18247
	AddRecipe(18247, 275, 13935, R_COMMON, 0, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB,18247, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,18247,2,7947,2,8145)

	-- Undermine Clam Chowder -- 20626
	AddRecipe(20626, 225, 16766, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,20626, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,20626,2,8139)

	-- Mithril Head Trout -- 20916
	AddRecipe(20916, 175, 8364, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,20916, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,20916,2,2383,2,2664,2,3178,2,3333,2,4307,2,4574,2
	,5162,2,12033,2,12962)

	-- Gingerbread Cookie -- 21143
	AddRecipe(21143, 1, 17197, R_COMMON, 0, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,21143, F_ALLIANCE, F_HORDE,7, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,21143,5,1,2,13420,2,13429,2,13432,2,13433,2,13435
	,2,23010,2,23012,2,23064)

	-- Egg Nog -- 21144
	AddRecipe(21144, 35, 17198, R_COMMON, 0, 35, 75, 95, 115)
	self:addTradeFlags(RecipeDB,21144, F_ALLIANCE, F_HORDE,7, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,21144,5,1,2,13420,2,13429,2,13432,2,13433,2,13435
	,2,23010,2,23012,2,23064)

	-- Spider Sausage -- 21175
	AddRecipe(21175, 200, 17222, R_COMMON, 0, 200, 225, 237, 250)
	self:addTradeFlags(RecipeDB,21175, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,21175,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1
	,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Tender Wolf Steak -- 22480
	AddRecipe(22480, 225, 18045, R_COMMON, 0, 225, 250, 262, 275)
	self:addTradeFlags(RecipeDB,22480, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,22480,2,4782,2,7733,2,8125)

	-- Runn Tum Tuber Surprise -- 22761
	AddRecipe(22761, 275, 18254, R_UNCOMMON, 0, 275, 300, 312, 325)
	self:addTradeFlags(RecipeDB,22761, F_ALLIANCE, F_HORDE,5, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,22761,3,14354)

	-- Heavy Crocolisk Stew -- 24418
	AddRecipe(24418, 150, 20074, R_COMMON, 0, 150, 160, 180, 200)
	self:addTradeFlags(RecipeDB,24418,2,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,24418,2,4879)

	-- Smoked Desert Dumplings -- 24801
	AddRecipe(24801, 285, 20452, R_COMMON, 0, 285, 310, 322, 335)
	self:addTradeFlags(RecipeDB,24801, F_ALLIANCE, F_HORDE,8, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,24801,4,8313)

	-- Dirge's Kickin' Chimaerok Chops -- 25659
	AddRecipe(25659, 300, 21023, R_EPIC, 0, 300, 325, 337, 350)
	self:addTradeFlags(RecipeDB,25659, F_ALLIANCE, F_HORDE,8, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,25659,4,8586)

	-- Smoked Sagefish -- 25704
	AddRecipe(25704, 80, 21072, R_COMMON, 0, 80, 120, 140, 160)
	self:addTradeFlags(RecipeDB,25704, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,25704,2,2381,2,2397,2,2664,2,3027,2,3085,2,3400,2
	,4223,2,4265,2,4553,2,5160,2,5483,2,8307,2,12033,2,14738,2,16253,2,16677,2,16718,2,
	17246,2,19195,2,26868)

	-- Sagefish Delight -- 25954
	AddRecipe(25954, 175, 21217, R_COMMON, 0, 175, 215, 235, 255)
	self:addTradeFlags(RecipeDB,25954, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,25954,2,2381,2,2397,2,2664,2,3027,2,3085,2,3400,2
	,4223,2,4265,2,4553,2,5160,2,5483,2,8307,2,12033,2,14738,2,16253,2,16677,2,16718,2,
	17246,2,19195,2,26868)

	-- Crunchy Spider Surprise -- 28267
	AddRecipe(28267, 60, 22645, R_COMMON, 1, 60, 100, 120, 140)
	self:addTradeFlags(RecipeDB,28267, F_ALLIANCE, F_HORDE,4,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,28267,4,9171,2,16253,2,18427)

	-- Lynx Steak -- 33276
	AddRecipe(33276, 1, 27635, R_COMMON, 1, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,33276,2,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33276,2,16262)

	-- Roasted Moongraze Tenderloin -- 33277
	AddRecipe(33277, 1, 24105, R_COMMON, 1, 1, 45, 65, 85)
	self:addTradeFlags(RecipeDB,33277,1,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33277,4,9454)

	-- Bat Bites -- 33278
	AddRecipe(33278, 50, 27636, R_COMMON, 1, 50, 90, 110, 130)
	self:addTradeFlags(RecipeDB,33278,2,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33278,2,16253)

	-- Buzzard Bites -- 33279
	AddRecipe(33279, 300, 27651, R_COMMON, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,33279, F_ALLIANCE, F_HORDE,8, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33279,4,9356)

	-- Ravager Dog -- 33284
	AddRecipe(33284, 300, 27655, R_COMMON, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,33284, F_ALLIANCE, F_HORDE,4, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33284,2,16585,2,16826)

	-- Sporeling Snack -- 33285
	AddRecipe(33285, 310, 27656, R_COMMON, 1, 310, 330, 340, 350)
	self:addTradeFlags(RecipeDB,33285, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,33285,2,18382)

	-- Blackened Basilisk -- 33286
	AddRecipe(33286, 315, 27657, R_COMMON, 1, 315, 335, 345, 355)
	self:addTradeFlags(RecipeDB,33286, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33286,2,18957,2,19038)

	-- Roasted Clefthoof -- 33287
	AddRecipe(33287, 325, 27658, R_COMMON, 1, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB,33287, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE,51, F_RBOE)
	self:addTradeAcquire(RecipeDB,33287,2,20096,2,20097)

	-- Warp Burger -- 33288
	AddRecipe(33288, 325, 27659, R_COMMON, 1, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB,33288, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE,51)
	self:addTradeAcquire(RecipeDB,33288,2,18957,2,19038)

	-- Talbuk Steak -- 33289
	AddRecipe(33289, 325, 27660, R_COMMON, 1, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB,33289, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33289,2,20096,2,20097)

	-- Blackened Trout -- 33290
	AddRecipe(33290, 300, 27661, R_COMMON, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,33290, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,33290,2,18015,2,20028)

	-- Feltail Delight -- 33291
	AddRecipe(33291, 300, 27662, R_COMMON, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,33291, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33291,2,18011,2,20028)

	-- Blackened Sporefish -- 33292
	AddRecipe(33292, 310, 27663, R_COMMON, 1, 310, 330, 340, 350)
	self:addTradeFlags(RecipeDB,33292, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33292,2,18911)

	-- Grilled Mudfish -- 33293
	AddRecipe(33293, 320, 27664, R_COMMON, 1, 320, 340, 350, 360)
	self:addTradeFlags(RecipeDB,33293, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE,51)
	self:addTradeAcquire(RecipeDB,33293,2,20096,2,20097)

	-- Poached Bluefish -- 33294
	AddRecipe(33294, 320, 27665, R_COMMON, 1, 320, 340, 350, 360)
	self:addTradeFlags(RecipeDB,33294, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33294,2,20096,2,20097)

	-- Golden Fish Sticks -- 33295
	AddRecipe(33295, 325, 27666, R_COMMON, 1, 325, 345, 355, 365)
	self:addTradeFlags(RecipeDB,33295, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33295,2,18960,2,19296)

	-- Spicy Crawdad -- 33296
	AddRecipe(33296, 350, 27667, R_COMMON, 1, 350, 370, 375, 380)
	self:addTradeFlags(RecipeDB,33296, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,33296,2,18960,2,19296)

	-- Clam Bar -- 36210
	AddRecipe(36210, 300, 30155, R_COMMON, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,36210, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,36210,2,18382)

	-- Spice Bread -- 37836
	AddRecipe(37836,1,30816,1,1,1,30,35, F_RBOE)
	self:addTradeFlags(RecipeDB,37836, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,37836,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1
	,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,
	16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Mok'Nathal Shortribs -- 38867
	AddRecipe(38867, 335, 31672, R_COMMON, 1, 335, 355, 365, 375)
	self:addTradeFlags(RecipeDB,38867, F_ALLIANCE, F_HORDE, F_VENDOR,8, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,38867,4,10860,2,20916,2,21113)

	-- Crunchy Serpent -- 38868
	AddRecipe(38868, 335, 31673, R_COMMON, 1, 335, 355, 365, 375)
	self:addTradeFlags(RecipeDB,38868, F_ALLIANCE, F_HORDE, F_VENDOR,8, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,38868,4,10860,2,20916,2,21113)

	-- Stewed Trout -- 42296
	AddRecipe(42296, 320, 33048, R_COMMON, 1, 320, 335, 345, 355)
	self:addTradeFlags(RecipeDB,42296, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,42296,1,19186)

	-- Fisherman's Feast -- 42302
	AddRecipe(42302, 350, 33052, R_COMMON, 1, 350, 375, 380, 385)
	self:addTradeFlags(RecipeDB,42302, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,42302,1,19186)

	-- Hot Buttered Trout -- 42305
	AddRecipe(42305, 350, 33053, R_COMMON, 1, 350, 375, 380, 385)
	self:addTradeFlags(RecipeDB,42305, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,42305,1,19186)

	-- Skullfish Soup -- 43707
	AddRecipe(43707, 325, 33825, R_UNCOMMON, 1, 325, 335, 345, 355)
	self:addTradeFlags(RecipeDB,43707,1,2,8, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,43707,8,6)

	-- Stormchops -- 43758
	AddRecipe(43758, 300, 33866, R_RARE, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,43758,1,2,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,43758,8,5,8,6,8,38)

	-- Broiled Bloodfin -- 43761
	AddRecipe(43761, 300, 33867, R_UNCOMMON, 1, 300, 320, 330, 340)
	self:addTradeFlags(RecipeDB,43761,1,2,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,43761,8,6)

	-- Spicy Hot Talbuk -- 43765
	AddRecipe(43765, 325, 33872, R_UNCOMMON, 1, 325, 335, 345, 355)
	self:addTradeFlags(RecipeDB,43765,1,2,8, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,43765,8,5)

	-- Kibler's Bits -- 43772
	AddRecipe(43772, 300, 33874, R_UNCOMMON, 1, 300, 345, 355, 365)
	self:addTradeFlags(RecipeDB,43772,1,2,8,23, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,43772,8,5)

	-- Delicious Chocolate Cake -- 43779
	AddRecipe(43779, 1, 33924, R_RARE, 1, 1, 50, 62, 75)
	self:addTradeFlags(RecipeDB,43779,1,2,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,43779,8,5,8,6,8,38)

	-- Hot Apple Cider -- 45022
	AddRecipe(45022, 325, 34411, R_COMMON, 2, 325, 325, 325, 325)
	self:addTradeFlags(RecipeDB,45022,1,2,7, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,45022,5,1,2,13420,2,13433)

	-- Mammoth Meal -- 45549
	AddRecipe(45549, 350, 34748, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45549, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,45549,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Shoveltusk Steak -- 45550
	AddRecipe(45550, 350, 34749, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45550, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,45550,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Worm Delight -- 45551
	AddRecipe(45551, 350, 34750, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45551, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45551,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Roasted Worg -- 45552
	AddRecipe(45552, 350, 34751, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45552, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45552,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Rhino Dogs -- 45553
	AddRecipe(45553, 350, 34752, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45553, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45553,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Great Feast -- 45554
	AddRecipe(45554, 375, 34753, R_COMMON, 2, 375, 375, 400, 425)
	self:addTradeFlags(RecipeDB,45554, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOP, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,45554,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Mega Mammoth Meal -- 45555
	AddRecipe(45555, 400, 34754, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45555, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,45555,2,31031,2,31032)

	-- Tender Shoveltusk Steak -- 45556
	AddRecipe(45556, 400, 34755, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45556, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,45556,2,31031,2,31032)

	-- Spiced Wyrm Burger -- 45557
	AddRecipe(45557, 400, 34756, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45557, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45557,2,31031,2,31032)

	-- Very Burnt Worg -- 45558
	AddRecipe(45558, 400, 34757, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45558, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45558,2,31031,2,31032)

	-- Mighty Rhino Dogs -- 45559
	AddRecipe(45559, 400, 34758, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45559, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45559,2,31031,2,31032)

	-- Smoked Rockfin -- 45560
	AddRecipe(45560, 350, 34759, R_COMMON, 2, 350, 350, 365, 380)
	self:addTradeFlags(RecipeDB,45560, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45560,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Grilled Bonescale -- 45561
	AddRecipe(45561, 350, 34760, R_COMMON, 2, 350, 350, 365, 380)
	self:addTradeFlags(RecipeDB,45561, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45561,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Sauteed Goby -- 45562
	AddRecipe(45562, 350, 34761, R_COMMON, 2, 350, 350, 365, 380)
	self:addTradeFlags(RecipeDB,45562, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45562,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Grilled Sculpin -- 45563
	AddRecipe(45563, 350, 34762, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45563, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,45563,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Smoked Salmon -- 45564
	AddRecipe(45564, 350, 34763, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45564, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,45564,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Poached Nettlefish -- 45565
	AddRecipe(45565, 350, 34764, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45565, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45565,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Pickled Fangtooth -- 45566
	AddRecipe(45566, 350, 34765, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45566, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45566,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Poached Northern Sculpin -- 45567
	AddRecipe(45567, 400, 34766, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45567, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,45567,2,31031,2,31032)

	-- Firecracker Salmon -- 45568
	AddRecipe(45568, 400, 34767, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45568, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,45568,2,31031,2,31032)

	-- Baked Manta Ray -- 45569
	AddRecipe(45569, 350, 42942, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,45569, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45569,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Imperial Manta Steak -- 45570
	AddRecipe(45570, 400, 34769, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45570, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45570,2,31031,2,31032)

	-- Spicy Blue Nettlefish -- 45571
	AddRecipe(45571, 400, 34768, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,45571, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45571,2,31031,2,31032)

	-- Captain Rumsey's Lager -- 45695
	AddRecipe(45695, 100, 34832, R_UNCOMMON, 2, 100, 100, 105, 110)
	self:addTradeFlags(RecipeDB,45695,1,2,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,45695,8,7)

	-- Charred Bear Kabobs -- 46684
	AddRecipe(46684, 250, 35563, R_COMMON, 2, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB,46684, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE,51)
	self:addTradeAcquire(RecipeDB,46684,2,2803,2,2806)

	-- Juicy Bear Burger -- 46688
	AddRecipe(46688, 250, 35565, R_COMMON, 2, 250, 275, 285, 295)
	self:addTradeFlags(RecipeDB,46688, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOE, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,46688,2,2803,2,2806)

	-- Kungaloosh -- 53056
	AddRecipe(53056, 375, 39520, R_COMMON, 2, 375, 375, 387, 400)
	self:addTradeFlags(RecipeDB,53056,1,2,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,53056,4,13571,8,36)

	-- Fish Feast -- 57423
	AddRecipe(57423, 450, 43015, R_COMMON, 2, 450, 455, 460, 465)
	self:addTradeFlags(RecipeDB,57423, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,57423,2,31031,2,31032)

	-- Worg Tartare -- 62350
	AddRecipe(62350, 400, 44953, R_COMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,62350, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,62350,2,31031,2,31032)

	-- Northern Stew -- 57421
	AddRecipe(57421, 350, 34747, R_COMMON, 2, 350, 350, 362, 365)
	self:addTradeFlags(RecipeDB,57421,1,2,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,57421,4,13087,4,13088,4,13089,4,13090)

	-- Spicy Fried Herring -- 57433
	AddRecipe(57433, 400, 42993, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57433, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,57433,2,31031,2,31032)

	-- Rhinolicious Wyrmsteak -- 57434
	AddRecipe(57434, 400, 42994, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57434, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,57434,2,31031,2,31032)

	-- Critter Bites -- 57435
	AddRecipe(57435, 400, 43004, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57435, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,57435,2,31031,2,31032)

	-- Hearty Rhino -- 57436
	AddRecipe(57436, 400, 42995, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57436, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,57436,2,31031,2,31032)

	-- Snapper Extreme -- 57437
	AddRecipe(57437, 400, 42996, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57437, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,57437,2,31031,2,31032)

	-- Blackened Worg Steak -- 57438
	AddRecipe(57438, 400, 42997, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57438, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,57438,2,31031,2,31032)

	-- Cuttlesteak -- 57439
	AddRecipe(57439, 400, 42998, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57439, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,57439,2,31031,2,31032)

	-- Spiced Mammoth Treats -- 57440
	AddRecipe(57440, 400, 43005, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57440, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,57440,2,31031,2,31032)

	-- Blackened Dragonfin -- 57441
	AddRecipe(57441, 400, 42999, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57441, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,57441,2,31031,2,31032)

	-- Dragonfin Filet -- 57442
	AddRecipe(57442, 400, 43000, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57442, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,57442,2,31031,2,31032)

	-- Tracker Snacks -- 57443
	AddRecipe(57443, 400, 43001, R_UNCOMMON, 2, 400, 400, 420, 460)
	self:addTradeFlags(RecipeDB,57443, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,57443,2,31031,2,31032)

	-- Dalaran Clam Chowder -- 58065
	AddRecipe(58065, 350, 43268, R_COMMON, 2, 350, 350, 382, 415)
	self:addTradeFlags(RecipeDB,58065, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,58065,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Tasty Cupcake -- 58512
	AddRecipe(58512, 350, 43490, R_UNCOMMON, 2, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB,58512,1,2,10, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,58512,7,2)

	-- Last Week's Mammoth -- 58521
	AddRecipe(58521, 350, 43488, R_UNCOMMON, 2, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB,58521,1,2,10, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,58521,7,2)

	-- Bad Clams -- 58523
	AddRecipe(58523, 350, 43491, R_UNCOMMON, 2, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB,58523,1,2,10, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,58523,7,2)

	-- Haunted Herring -- 58525
	AddRecipe(58525, 350, 43492, R_UNCOMMON, 2, 350, 350, 357, 365)
	self:addTradeFlags(RecipeDB,58525,1,2,10, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,58525,7,2)

	-- Gigantic Feast -- 58527
	AddRecipe(58527, 425, 43478, R_UNCOMMON, 2, 425, 425, 450, 475)
	self:addTradeFlags(RecipeDB,58527, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,58527,2,31031,2,31032)

	-- Small Feast -- 58528
	AddRecipe(58528, 425, 43480, R_UNCOMMON, 2, 425, 425, 450, 475)
	self:addTradeFlags(RecipeDB,58528, F_ALLIANCE, F_HORDE, F_VENDOR, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,58528,2,31031,2,31032)

	-- Dig Rat Stew -- 6417
	AddRecipe(6417, 90, 44977, R_COMMON, 2, 90, 130, 150, 170)
	self:addTradeFlags(RecipeDB,6417, F_ALLIANCE, F_HORDE, F_VENDOR,8, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,6417,4,862,2,3392)

	-- Black Jelly -- 64358
	AddRecipe(64358, 400, 45932, R_COMMON, 2, 400, 400, 412, 425)
	self:addTradeFlags(RecipeDB,64358, F_ALLIANCE, F_HORDE, F_TRAINER, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,64358,1,26905,1,26953,1,26972,1,26989,1,28705,1,
	29631,1,33587)

	-- Clamlette Magnifique -- 64054
	AddRecipe(64054, 250, 33004, R_COMMON, 2, 250, 250, 275, 300)
	self:addTradeFlags(RecipeDB,64054,1,2,8, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,64054,4,6610)

	-- Pumpkin Pie -- 62044
	AddRecipe(62044,45,44839,1,2)
	self:addTradeFlags(RecipeDB,62044,1,2,7, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,62044,5,5)

	-- Slow-Roasted Turkey -- 62045
	AddRecipe(62045,45,44839,1,2)
	self:addTradeFlags(RecipeDB,62045,1,2,7, F_IBOE, F_RBOP,51)
	self:addTradeAcquire(RecipeDB,62045,5,5)

	-- Cranberry Chutney -- 62049
	AddRecipe(62049,25,44840,1,2)
	self:addTradeFlags(RecipeDB,62049,1,2,7, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,62049,5,5)

	-- Spice Bread Stuffing -- 62050
	AddRecipe(62050,75,44837,1,2)
	self:addTradeFlags(RecipeDB,62050,1,2,7, F_IBOE, F_RBOE)
	self:addTradeAcquire(RecipeDB,62050,5,5)

	-- Candied Yam -- 62051
	AddRecipe(62051,45,44839,1,2)
	self:addTradeFlags(RecipeDB,62051,1,2,7, F_IBOE, F_RBOP)
	self:addTradeAcquire(RecipeDB,62051,5,5)

	-- Bread of the Dead -- 65454
	AddRecipe(65454,45,46691,1,2)
	self:addTradeFlags(RecipeDB,65454,1,2,7, F_IBOE, F_RBOP, F_HEALER, F_CASTER)
	self:addTradeAcquire(RecipeDB,65454,5,6)

	return num_recipes

end
