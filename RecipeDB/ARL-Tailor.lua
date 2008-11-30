--[[

************************************************************************

ARL-Tailor.lua

Tailoring data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
407 found from data mining.
7 ignored.

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

function addon:InitTailoring(RecipeDB)

	local recipecount = 0

	-- Brown Linen Vest -- 2385
	-- Item Stats: 
	-- Item Stats: val15id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2385,20,2568,1,3908)
	self:addTradeFlags(RecipeDB,2385,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,2385,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,8,8)

	-- Linen Boots -- 2386
	-- Item Stats: 
	-- Item Stats: val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2386,55,2569,1,3908)
	self:addTradeFlags(RecipeDB,2386,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,2386,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Linen Cloak -- 2387
	-- Item Stats: 
	-- Item Stats: val6id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2387,10,2570,1,3908)
	self:addTradeFlags(RecipeDB,2387,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,2387,8,8)

	-- Red Linen Robe -- 2389
	-- Item Stats: 
	-- Item Stats: val1id4val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2389,40,2572,2,3908)
	self:addTradeFlags(RecipeDB,2389,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,2389,7,2)

	-- Red Linen Shirt -- 2392
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2392,30,2575,1,3908)
	self:addTradeFlags(RecipeDB,2392,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2392,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- White Linen Shirt -- 2393
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2393,10,2576,1,3908)
	self:addTradeFlags(RecipeDB,2393,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2393,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Blue Linen Shirt -- 2394
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2394,30,2577,1,3908)
	self:addTradeFlags(RecipeDB,2394,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2394,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Barbaric Linen Vest -- 2395
	-- Item Stats: 
	-- Item Stats: val2id3val2id5val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2395,60,2578,1,3908)
	self:addTradeFlags(RecipeDB,2395,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,2395,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Green Linen Shirt -- 2396
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2396,60,2579,1,3908)
	self:addTradeFlags(RecipeDB,2396,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2396,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Reinforced Linen Cape -- 2397
	-- Item Stats: 
	-- Item Stats: val11id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2397,50,2580,1,3908)
	self:addTradeFlags(RecipeDB,2397,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,2397,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Green Woolen Vest -- 2399
	-- Item Stats: 
	-- Item Stats: val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2399,75,2582,1,3908)
	self:addTradeFlags(RecipeDB,2399,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,2399,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Woolen Boots -- 2401
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val22id6val2id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2401,85,2583,1,3908)
	self:addTradeFlags(RecipeDB,2401,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,2401,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Woolen Cape -- 2402
	-- Item Stats: 
	-- Item Stats: val14id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2402,65,2584,1,3908)
	self:addTradeFlags(RecipeDB,2402,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,2402,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Gray Woolen Robe -- 2403
	-- Item Stats: 
	-- Item Stats: val4id3val5id4val35id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2403,105,2585,2,3908)
	self:addTradeFlags(RecipeDB,2403,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,2403,7,2)

	-- Gray Woolen Shirt -- 2406
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2406,90,2587,1,3908)
	self:addTradeFlags(RecipeDB,2406,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2406,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Bolt of Linen Cloth -- 2963
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2963,1,2996,1,3908)
	self:addTradeFlags(RecipeDB,2963,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bolt of Woolen Cloth -- 2964
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2964,75,2997,1,3908)
	self:addTradeFlags(RecipeDB,2964,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2964,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Linen Bag -- 3755
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3755,35,4238,1,3908)
	self:addTradeFlags(RecipeDB,3755,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3755,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Woolen Bag -- 3757
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3757,70,4240,1,3908)
	self:addTradeFlags(RecipeDB,3757,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3757,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Green Woolen Bag -- 3758
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3758,95,4241,2,3908)
	self:addTradeFlags(RecipeDB,3758,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3758,7,2)

	-- Small Silk Pack -- 3813
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3813,140,4245,1,3908)
	self:addTradeFlags(RecipeDB,3813,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3813,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Bolt of Silk Cloth -- 3839
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3839,125,4305,1,3908)
	self:addTradeFlags(RecipeDB,3839,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3839,1,1346,1,3004,1,3363,1,4576,1,5153,1,5567,1,11049,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Heavy Linen Gloves -- 3840
	-- Item Stats: 
	-- Item Stats: val11id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3840,25,4307,1,3908)
	self:addTradeFlags(RecipeDB,3840,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3840,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Green Linen Bracers -- 3841
	-- Item Stats: 
	-- Item Stats: val9id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3841,50,4308,1,3908)
	self:addTradeFlags(RecipeDB,3841,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3841,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Handstitched Linen Britches -- 3842
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3842,60,4309,1,3908)
	self:addTradeFlags(RecipeDB,3842,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3842,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Heavy Woolen Gloves -- 3843
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3843,75,4310,1,3908)
	self:addTradeFlags(RecipeDB,3843,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3843,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Heavy Woolen Cloak -- 3844
	-- Item Stats: 
	-- Item Stats: val4id5val17id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3844,100,4311,2,3908)
	self:addTradeFlags(RecipeDB,3844,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,3844,7,2)

	-- Soft-soled Linen Boots -- 3845
	-- Item Stats: 
	-- Item Stats: val2id3val2id4val20id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3845,70,4312,1,3908)
	self:addTradeFlags(RecipeDB,3845,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3845,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Red Woolen Boots -- 3847
	-- Item Stats: 
	-- Item Stats: val5id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3847,95,4313,2,3908)
	self:addTradeFlags(RecipeDB,3847,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3847,7,2)

	-- Double-stitched Woolen Shoulders -- 3848
	-- Item Stats: 
	-- Item Stats: val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3848,100,4314,1,3908)
	self:addTradeFlags(RecipeDB,3848,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3848,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Reinforced Woolen Shoulders -- 3849
	-- Item Stats: 
	-- Item Stats: val27id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3849,120,4315,2,3908)
	self:addTradeFlags(RecipeDB,3849,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3849,7,2)

	-- Heavy Woolen Pants -- 3850
	-- Item Stats: 
	-- Item Stats: val3id4val6id5val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3850,100,4316,1,3908)
	self:addTradeFlags(RecipeDB,3850,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3850,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Phoenix Pants -- 3851
	-- Item Stats: 
	-- Item Stats: val4id4val34id6val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3851,125,4317,2,3908)
	self:addTradeFlags(RecipeDB,3851,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3851,7,2)

	-- Gloves of Meditation -- 3852
	-- Item Stats: 
	-- Item Stats: val7id5val25id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3852,120,4318,1,3908)
	self:addTradeFlags(RecipeDB,3852,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3852,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Azure Silk Gloves -- 3854
	-- Item Stats: 
	-- Item Stats: val3id5val26id6val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3854,145,4319,1,3908)
	self:addTradeFlags(RecipeDB,3854,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3854,2,2679,2,9636)

	-- Spidersilk Boots -- 3855
	-- Item Stats: 
	-- Item Stats: val4id3val4id4val7id5val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3855,115,4320,1,3908)
	self:addTradeFlags(RecipeDB,3855,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3855,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Spider Silk Slippers -- 3856
	-- Item Stats: 
	-- Item Stats: val7id5val29id6val4id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3856,140,4321,2,3908)
	self:addTradeFlags(RecipeDB,3856,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3856,7,2)

	-- Enchanter's Cowl -- 3857
	-- Item Stats: 
	-- Item Stats: val10id4val6id5val37id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3857,165,4322,1,3908)
	self:addTradeFlags(RecipeDB,3857,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3857,2,2670)

	-- Shadow Hood -- 3858
	-- Item Stats: 
	-- Item Stats: val11id4val37id6val6id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3858,170,4323,2,3908)
	self:addTradeFlags(RecipeDB,3858,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3858,3,2248,3,2377,3,4292,3,4301)

	-- Azure Silk Vest -- 3859
	-- Item Stats: 
	-- Item Stats: val9id4val43id6val6id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3859,140,4324,1,3908)
	self:addTradeFlags(RecipeDB,3859,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3859,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Boots of the Enchanter -- 3860
	-- Item Stats: 
	-- Item Stats: val5id4val8id5val32id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3860,175,4325,2,3908)
	self:addTradeFlags(RecipeDB,3860,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3860,7,2)

	-- Long Silken Cloak -- 3861
	-- Item Stats: 
	-- Item Stats: val5id4val6id5val24id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3861,175,4326,1,3908)
	self:addTradeFlags(RecipeDB,3861,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,3861,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Icy Cloak -- 3862
	-- Item Stats: 
	-- Item Stats: val6id5val29id6val11id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3862,200,4327,1,3908)
	self:addTradeFlags(RecipeDB,3862,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,3862,2,6567)

	-- Spider Belt -- 3863
	-- Item Stats: 
	-- Item Stats: val8id4val27id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3863,180,4328,2,3908)
	self:addTradeFlags(RecipeDB,3863,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3863,7,2)

	-- Star Belt -- 3864
	-- Item Stats: 
	-- Item Stats: val4id5val30id6val13id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3864,200,4329,2,3908)
	self:addTradeFlags(RecipeDB,3864,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Bolt of Mageweave -- 3865
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3865,175,4339,1,3908)
	self:addTradeFlags(RecipeDB,3865,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3865,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Stylish Red Shirt -- 3866
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3866,100,4330,1,3908)
	self:addTradeFlags(RecipeDB,3866,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3866,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Phoenix Gloves -- 3868
	-- Item Stats: 
	-- Item Stats: val24id6val7id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3868,125,4331,2,3908)
	self:addTradeFlags(RecipeDB,3868,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,3868,7,2)

	-- Bright Yellow Shirt -- 3869
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3869,135,4332,1,3908)
	self:addTradeFlags(RecipeDB,3869,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3869,2,2668)

	-- Dark Silk Shirt -- 3870
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3870,155,4333,1,3908)
	self:addTradeFlags(RecipeDB,3870,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3870,2,2394,2,2669)

	-- Formal White Shirt -- 3871
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3871,170,4334,1,3908)
	self:addTradeFlags(RecipeDB,3871,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3871,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Rich Purple Silk Shirt -- 3872
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3872,185,4335,3,3908)
	self:addTradeFlags(RecipeDB,3872,21,22,23,24,25,26,27,28,29,30,36,40)
	-- No acquire information

	-- Black Swashbuckler's Shirt -- 3873
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3873,200,4336,1,3908)
	self:addTradeFlags(RecipeDB,3873,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3873,2,2663)

	-- Brown Linen Pants -- 3914
	-- Item Stats: 
	-- Item Stats: val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3914,20,4343,1,3908)
	self:addTradeFlags(RecipeDB,3914,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,3914,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Brown Linen Shirt -- 3915
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3915,10,4344,1,3908)
	self:addTradeFlags(RecipeDB,3915,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Pearl-clasped Cloak -- 6521
	-- Item Stats: 
	-- Item Stats: val3id4val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6521,80,5542,1,3908)
	self:addTradeFlags(RecipeDB,6521,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,6521,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Red Linen Bag -- 6686
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6686,70,5762,1,3908)
	self:addTradeFlags(RecipeDB,6686,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6686,3,157,3,590,3,3530,3,3531,2,3005,2,3556,2,4189,2,16224)

	-- Red Woolen Bag -- 6688
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6688,115,5763,1,3908)
	self:addTradeFlags(RecipeDB,6688,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6688,3,450,3,2264,2,777,2,1454,2,1474,2,3005,2,3364,2,3485,2,3537,2,3683,2,4189,2,4577,2,5944)

	-- Lesser Wizard's Robe -- 6690
	-- Item Stats: 
	-- Item Stats: val8id4val5id5val41id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6690,125,5766,1,3908)
	self:addTradeFlags(RecipeDB,6690,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,6690,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Robes of Arcana -- 6692
	-- Item Stats: 
	-- Item Stats: val8id4val7id5val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6692,150,5770,2,3908)
	self:addTradeFlags(RecipeDB,6692,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,6692,3,910,3,923,3,2337,3,10760)

	-- Green Silk Pack -- 6693
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6693,175,5764,2,3908)
	self:addTradeFlags(RecipeDB,6693,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6693,7,2)

	-- Black Silk Pack -- 6695
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6695,185,5765,2,3908)
	self:addTradeFlags(RecipeDB,6695,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6695,3,2242,3,4341,3,4343,3,4834)

	-- Brown Linen Robe -- 7623
	-- Item Stats: 
	-- Item Stats: val1id5val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7623,20,6238,1,3908)
	self:addTradeFlags(RecipeDB,7623,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,7623,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- White Linen Robe -- 7624
	-- Item Stats: 
	-- Item Stats: val1id4val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7624,20,6241,1,3908)
	self:addTradeFlags(RecipeDB,7624,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,7624,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Red Linen Vest -- 7629
	-- Item Stats: 
	-- Item Stats: val2id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7629,55,6239,2,3908)
	self:addTradeFlags(RecipeDB,7629,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,7629,7,2)

	-- Blue Linen Vest -- 7630
	-- Item Stats: 
	-- Item Stats: val2id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7630,55,6240,1,3908)
	self:addTradeFlags(RecipeDB,7630,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,7630,2,3364,2,3522,2,4189)

	-- Blue Linen Robe -- 7633
	-- Item Stats: 
	-- Item Stats: val3id5val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7633,70,6242,1,3908)
	self:addTradeFlags(RecipeDB,7633,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,7633,2,1250,2,3485,2,4168)

	-- Green Woolen Robe -- 7636
	-- Item Stats: 
	-- Item Stats: val2id3val3id4val3id5val32id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,7636,80,6243,2,3908)
	--self:addTradeFlags(RecipeDB,7636,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Blue Overalls -- 7639
	-- Item Stats: 
	-- Item Stats: val4id3val34id6val5id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7639,100,6263,1,3908)
	self:addTradeFlags(RecipeDB,7639,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,7639,2,2394,2,3364)

	-- Greater Adept's Robe -- 7643
	-- Item Stats: 
	-- Item Stats: val1id3val2id4val7id5val37id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7643,115,6264,1,3908)
	self:addTradeFlags(RecipeDB,7643,1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,7643,2,2669,2,4168)

	-- Stylish Blue Shirt -- 7892
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7892,120,6384,2,3908)
	self:addTradeFlags(RecipeDB,7892,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7892,7,2)

	-- Stylish Green Shirt -- 7893
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7893,120,6385,2,3908)
	self:addTradeFlags(RecipeDB,7893,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7893,7,2)

	-- Simple Dress -- 8465
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8465,30,6786,1,3908)
	self:addTradeFlags(RecipeDB,8465,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8465,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- White Woolen Dress -- 8467
	-- Item Stats: 
	-- Item Stats: val34id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8467,100,6787,1,3908)
	self:addTradeFlags(RecipeDB,8467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8467,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- White Swashbuckler's Shirt -- 8483
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8483,160,6795,1,3908)
	self:addTradeFlags(RecipeDB,8483,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8483,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Red Swashbuckler's Shirt -- 8489
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8489,175,6796,1,3908)
	self:addTradeFlags(RecipeDB,8489,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8489,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Azure Silk Pants -- 8758
	-- Item Stats: 
	-- Item Stats: val6id4val36id6val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8758,130,7046,1,3908)
	self:addTradeFlags(RecipeDB,8758,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8758,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Azure Silk Hood -- 8760
	-- Item Stats: 
	-- Item Stats: val33id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8760,145,7048,1,3908)
	self:addTradeFlags(RecipeDB,8760,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8760,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772)

	-- Silk Headband -- 8762
	-- Item Stats: 
	-- Item Stats: val34id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8762,160,7050,1,3908)
	self:addTradeFlags(RecipeDB,8762,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8762,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Earthen Vest -- 8764
	-- Item Stats: 
	-- Item Stats: val6id3val10id5val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8764,160,7051,1,3908)
	self:addTradeFlags(RecipeDB,8764,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8764,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Azure Silk Belt -- 8766
	-- Item Stats: 
	-- Item Stats: val5id4val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8766,165,7052,1,3908)
	self:addTradeFlags(RecipeDB,8766,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8766,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Robe of Power -- 8770
	-- Item Stats: 
	-- Item Stats: val12id4val8id5val55id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8770,180,7054,1,3908)
	self:addTradeFlags(RecipeDB,8770,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,8770,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Crimson Silk Belt -- 8772
	-- Item Stats: 
	-- Item Stats: val7id4val6id5val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8772,165,7055,1,3908)
	self:addTradeFlags(RecipeDB,8772,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8772,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Green Silken Shoulders -- 8774
	-- Item Stats: 
	-- Item Stats: val11id4val36id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8774,170,7057,1,3908)
	self:addTradeFlags(RecipeDB,8774,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8774,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Linen Belt -- 8776
	-- Item Stats: 
	-- Item Stats: val9id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8776,15,7026,1,3908)
	self:addTradeFlags(RecipeDB,8776,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8776,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Boots of Darkness -- 8778
	-- Item Stats: 
	-- Item Stats: val5id3val29id6val6id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8778,130,7027,2,3908)
	self:addTradeFlags(RecipeDB,8778,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Hands of Darkness -- 8780
	-- Item Stats: 
	-- Item Stats: val5id5val26id6val7id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8780,145,7047,2,3908)
	self:addTradeFlags(RecipeDB,8780,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,8780,7,2)

	-- Truefaith Gloves -- 8782
	-- Item Stats: 
	-- Item Stats: val3id4val27id6val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8782,150,7049,2,3908)
	self:addTradeFlags(RecipeDB,8782,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,8782,7,2)

	-- Green Silk Armor -- 8784
	-- Item Stats: 
	-- Item Stats: val13id4val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8784,165,7065,2,3908)
	self:addTradeFlags(RecipeDB,8784,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,8784,7,2)

	-- Azure Silk Cloak -- 8786
	-- Item Stats: 
	-- Item Stats: val3id5val23id6val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8786,175,7053,1,3908)
	self:addTradeFlags(RecipeDB,8786,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,8786,2,6574,2,6576)

	-- Crimson Silk Cloak -- 8789
	-- Item Stats: 
	-- Item Stats: val3id3val24id6val7id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8789,180,7056,1,3908)
	self:addTradeFlags(RecipeDB,8789,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,8789,2,2670)

	-- Crimson Silk Vest -- 8791
	-- Item Stats: 
	-- Item Stats: val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8791,185,7058,1,3908)
	self:addTradeFlags(RecipeDB,8791,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8791,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Crimson Silk Shoulders -- 8793
	-- Item Stats: 
	-- Item Stats: val8id4val7id5val38id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8793,190,7059,2,3908)
	self:addTradeFlags(RecipeDB,8793,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,8793,7,2)

	-- Azure Shoulders -- 8795
	-- Item Stats: 
	-- Item Stats: val5id3val38id6val11id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8795,190,7060,2,3908)
	self:addTradeFlags(RecipeDB,8795,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,8795,7,2)

	-- Earthen Silk Belt -- 8797
	-- Item Stats: 
	-- Item Stats: val8id3val8id5val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8797,195,7061,2,3908)
	self:addTradeFlags(RecipeDB,8797,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,8797,7,2)

	-- Crimson Silk Pantaloons -- 8799
	-- Item Stats: 
	-- Item Stats: val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8799,195,7062,1,3908)
	self:addTradeFlags(RecipeDB,8799,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8799,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Crimson Silk Robe -- 8802
	-- Item Stats: 
	-- Item Stats: val15id4val6id5val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8802,205,7063,1,3908)
	self:addTradeFlags(RecipeDB,8802,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Crimson Silk Gloves -- 8804
	-- Item Stats: 
	-- Item Stats: val6id4val35id6val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8804,195,7064,1,3908)
	self:addTradeFlags(RecipeDB,8804,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,8804,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Simple Linen Pants -- 12044
	-- Item Stats: 
	-- Item Stats: val12id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12044,10,10045,1,3908)
	self:addTradeFlags(RecipeDB,12044,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Simple Linen Boots -- 12045
	-- Item Stats: 
	-- Item Stats: val11id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12045,15,10046,1,3908)
	self:addTradeFlags(RecipeDB,12045,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12045,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Simple Kilt -- 12046
	-- Item Stats: 
	-- Item Stats: val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12046,65,10047,1,3908)
	self:addTradeFlags(RecipeDB,12046,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12046,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772)

	-- Colorful Kilt -- 12047
	-- Item Stats: 
	-- Item Stats: val5id5val33id6val6id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12047,120,10048,2,3908)
	self:addTradeFlags(RecipeDB,12047,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12047,7,2)

	-- Black Mageweave Vest -- 12048
	-- Item Stats: 
	-- Item Stats: val11id4val12id5val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12048,190,9998,1,3908)
	self:addTradeFlags(RecipeDB,12048,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12048,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Black Mageweave Leggings -- 12049
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12049,190,9999,1,3908)
	self:addTradeFlags(RecipeDB,12049,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12049,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Black Mageweave Robe -- 12050
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12050,195,10001,1,3908)
	self:addTradeFlags(RecipeDB,12050,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12050,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Shadoweave Pants -- 12052
	-- Item Stats: 
	-- Item Stats: val6id3val48id6val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12052,195,10002,1,3908)
	self:addTradeFlags(RecipeDB,12052,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12052,1,4578,1,9584)

	-- Black Mageweave Gloves -- 12053
	-- Item Stats: 
	-- Item Stats: val35id6val15id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12053,200,10003,1,3908)
	self:addTradeFlags(RecipeDB,12053,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12053,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Shadoweave Robe -- 12055
	-- Item Stats: 
	-- Item Stats: val7id5val57id6val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12055,200,10004,1,3908)
	self:addTradeFlags(RecipeDB,12055,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12055,1,4578,1,9584)

	-- Red Mageweave Vest -- 12056
	-- Item Stats: 
	-- Item Stats: val18id4val57id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12056,215,10007,2,3908)
	self:addTradeFlags(RecipeDB,12056,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12056,7,2)

	-- White Bandit Mask -- 12059
	-- Item Stats: 
	-- Item Stats: val11id4val46id6val13id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12059,215,10008,2,3908)
	self:addTradeFlags(RecipeDB,12059,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12059,7,2)

	-- Red Mageweave Pants -- 12060
	-- Item Stats: 
	-- Item Stats: val12id4val49id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12060,215,10009,2,3908)
	self:addTradeFlags(RecipeDB,12060,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12060,7,2)

	-- Orange Mageweave Shirt -- 12061
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12061,210,10056,1,3908)
	self:addTradeFlags(RecipeDB,12061,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12061,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Stormcloth Pants -- 12062
	-- Item Stats: 
	-- Item Stats: val15id5val51id6val8id49
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12062,205,10010,2,3908)
	--self:addTradeFlags(RecipeDB,12062,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Stormcloth Gloves -- 12063
	-- Item Stats: 
	-- Item Stats: val36id6val16id49
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12063,205,10011,2,3908)
	--self:addTradeFlags(RecipeDB,12063,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Orange Martial Shirt -- 12064
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12064,220,10052,1,3908)
	self:addTradeFlags(RecipeDB,12064,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12064,2,3005,2,4168)

	-- Mageweave Bag -- 12065
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12065,210,10050,1,3908)
	self:addTradeFlags(RecipeDB,12065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12065,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Red Mageweave Gloves -- 12066
	-- Item Stats: 
	-- Item Stats: val10id4val37id6val11id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12066,225,10018,2,3908)
	self:addTradeFlags(RecipeDB,12066,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12066,7,2)

	-- Dreamweave Gloves -- 12067
	-- Item Stats: 
	-- Item Stats: val4id4val7id5val41id6val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12067,210,10019,1,3908)
	self:addTradeFlags(RecipeDB,12067,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12067,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Stormcloth Vest -- 12068
	-- Item Stats: 
	-- Item Stats: val8id3val8id5val59id6val15id49
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12068,210,10020,2,3908)
	--self:addTradeFlags(RecipeDB,12068,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Cindercloth Robe -- 12069
	-- Item Stats: 
	-- Item Stats: val59id6val22id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12069,210,10042,1,3908)
	self:addTradeFlags(RecipeDB,12069,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12069,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Dreamweave Vest -- 12070
	-- Item Stats: 
	-- Item Stats: val9id4val14id5val65id6val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12070,210,10021,1,3908)
	self:addTradeFlags(RecipeDB,12070,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12070,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772)

	-- Shadoweave Gloves -- 12071
	-- Item Stats: 
	-- Item Stats: val5id4val37id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12071,210,10023,1,3908)
	self:addTradeFlags(RecipeDB,12071,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12071,1,4578,1,9584)

	-- Black Mageweave Headband -- 12072
	-- Item Stats: 
	-- Item Stats: val12id4val13id5val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12072,215,10024,1,3908)
	self:addTradeFlags(RecipeDB,12072,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12072,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Black Mageweave Boots -- 12073
	-- Item Stats: 
	-- Item Stats: val7id4val11id5val41id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12073,215,10026,1,3908)
	self:addTradeFlags(RecipeDB,12073,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12073,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Black Mageweave Shoulders -- 12074
	-- Item Stats: 
	-- Item Stats: val9id4val10id5val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12074,215,10027,1,3908)
	self:addTradeFlags(RecipeDB,12074,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12074,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Lavender Mageweave Shirt -- 12075
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12075,230,10054,1,3908)
	self:addTradeFlags(RecipeDB,12075,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12075,2,3364,2,8681)

	-- Shadoweave Shoulders -- 12076
	-- Item Stats: 
	-- Item Stats: val7id3val46id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12076,220,10028,1,3908)
	self:addTradeFlags(RecipeDB,12076,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12076,1,4578,1,9584)

	-- Simple Black Dress -- 12077
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12077,230,10053,1,3908)
	self:addTradeFlags(RecipeDB,12077,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12077,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Red Mageweave Shoulders -- 12078
	-- Item Stats: 
	-- Item Stats: val15id4val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12078,235,10029,2,3908)
	self:addTradeFlags(RecipeDB,12078,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12078,7,2)

	-- Red Mageweave Bag -- 12079
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12079,220,10051,1,3908)
	self:addTradeFlags(RecipeDB,12079,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12079,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Pink Mageweave Shirt -- 12080
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12080,235,10055,1,3908)
	self:addTradeFlags(RecipeDB,12080,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12080,2,3364,2,8681)

	-- Admiral's Hat -- 12081
	-- Item Stats: 
	-- Item Stats: val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12081,240,10030,1,3908)
	self:addTradeFlags(RecipeDB,12081,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Shadoweave Boots -- 12082
	-- Item Stats: 
	-- Item Stats: val10id5val43id6val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12082,225,10031,1,3908)
	self:addTradeFlags(RecipeDB,12082,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12082,1,4578,1,9584)

	-- Stormcloth Headband -- 12083
	-- Item Stats: 
	-- Item Stats: val10id4val10id5val51id6val12id49
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12083,225,10032,2,3908)
	--self:addTradeFlags(RecipeDB,12083,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Red Mageweave Headband -- 12084
	-- Item Stats: 
	-- Item Stats: val20id4val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12084,240,10033,2,3908)
	self:addTradeFlags(RecipeDB,12084,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12084,7,2)

	-- Tuxedo Shirt -- 12085
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12085,240,10034,1,3908)
	self:addTradeFlags(RecipeDB,12085,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12085,2,4577,2,8681)

	-- Shadoweave Mask -- 12086
	-- Item Stats: 
	-- Item Stats: val10id4val52id6val20id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12086,245,10025,2,3908)
	self:addTradeFlags(RecipeDB,12086,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12086,4,3402)

	-- Stormcloth Shoulders -- 12087
	-- Item Stats: 
	-- Item Stats: val48id6val18id49
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12087,230,10038,2,3908)
	--self:addTradeFlags(RecipeDB,12087,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Cindercloth Boots -- 12088
	-- Item Stats: 
	-- Item Stats: val44id6val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12088,230,10044,1,3908)
	self:addTradeFlags(RecipeDB,12088,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12088,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Tuxedo Pants -- 12089
	-- Item Stats: 
	-- Item Stats: val39id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12089,245,10035,1,3908)
	self:addTradeFlags(RecipeDB,12089,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12089,2,4577,2,8681)

	-- Stormcloth Boots -- 12090
	-- Item Stats: 
	-- Item Stats: val10id3val45id6val13id49
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12090,235,10039,2,3908)
	--self:addTradeFlags(RecipeDB,12090,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- White Wedding Dress -- 12091
	-- Item Stats: 
	-- Item Stats: val44id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12091,250,10040,1,3908)
	self:addTradeFlags(RecipeDB,12091,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12091,2,1347,2,3005)

	-- Dreamweave Circlet -- 12092
	-- Item Stats: 
	-- Item Stats: val10id4val12id5val58id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12092,235,10041,1,3908)
	self:addTradeFlags(RecipeDB,12092,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,12092,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Tuxedo Jacket -- 12093
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12093,250,10036,1,3908)
	self:addTradeFlags(RecipeDB,12093,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,12093,2,4577,2,8681)

	-- Bolt of Runecloth -- 18401
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18401,250,14048,1,3908)
	self:addTradeFlags(RecipeDB,18401,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18401,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Runecloth Belt -- 18402
	-- Item Stats: 
	-- Item Stats: val12id4val8id5val37id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18402,240,13856,1,3908)
	self:addTradeFlags(RecipeDB,18402,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,18402,1,2399,1,11052,1,11557,1,18749,1,18772)

	-- Frostweave Tunic -- 18403
	-- Item Stats: 
	-- Item Stats: val11id4val66id6val20id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18403,255,13869,2,3908)
	self:addTradeFlags(RecipeDB,18403,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18403,1,2399,1,11052,1,18749,1,18772)

	-- Frostweave Robe -- 18404
	-- Item Stats: 
	-- Item Stats: val11id5val66id6val20id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18404,255,13868,2,3908)
	self:addTradeFlags(RecipeDB,18404,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18404,7,2)

	-- Runecloth Bag -- 18405
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18405,260,14046,1,3908)
	self:addTradeFlags(RecipeDB,18405,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runecloth Robe -- 18406
	-- Item Stats: 
	-- Item Stats: val17id4val11id5val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18406,260,13858,1,3908)
	self:addTradeFlags(RecipeDB,18406,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18406,1,2399,1,11052,1,18749,1,18772)

	-- Runecloth Tunic -- 18407
	-- Item Stats: 
	-- Item Stats: val11id4val17id5val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18407,260,13857,2,3908)
	self:addTradeFlags(RecipeDB,18407,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18407,1,2399,1,11052,1,18749,1,18772)

	-- Cindercloth Vest -- 18408
	-- Item Stats: 
	-- Item Stats: val11id5val68id6val20id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18408,260,14042,2,3908)
	self:addTradeFlags(RecipeDB,18408,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18408,3,5860,3,5861,3,5862)

	-- Runecloth Cloak -- 18409
	-- Item Stats: 
	-- Item Stats: val8id4val9id5val34id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18409,265,13860,1,3908)
	self:addTradeFlags(RecipeDB,18409,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,18409,1,2399,1,11052,1,18749,1,18772,2,7940)

	-- Ghostweave Belt -- 18410
	-- Item Stats: 
	-- Item Stats: val8id4val39id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18410,265,14143,2,3908)
	self:addTradeFlags(RecipeDB,18410,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18410,1,2399,1,11052,1,18749,1,18772)

	-- Frostweave Gloves -- 18411
	-- Item Stats: 
	-- Item Stats: val6id4val43id6val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18411,265,13870,2,3908)
	self:addTradeFlags(RecipeDB,18411,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18411,1,2399,1,11052,1,18749,1,18772)

	-- Cindercloth Gloves -- 18412
	-- Item Stats: 
	-- Item Stats: val11id5val44id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18412,270,14043,2,3908)
	self:addTradeFlags(RecipeDB,18412,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18412,3,5861)

	-- Ghostweave Gloves -- 18413
	-- Item Stats: 
	-- Item Stats: val8id4val44id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18413,270,14142,2,3908)
	self:addTradeFlags(RecipeDB,18413,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18413,1,2399,1,11052,1,18749,1,18772)

	-- Brightcloth Robe -- 18414
	-- Item Stats: 
	-- Item Stats: val70id6val16id35val15id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18414,270,14100,2,3908)
	self:addTradeFlags(RecipeDB,18414,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18414,3,13147,1,2399,1,11052,1,18749,1,18772)

	-- Brightcloth Gloves -- 18415
	-- Item Stats: 
	-- Item Stats: val44id6val12id35val11id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18415,270,14101,2,3908)
	self:addTradeFlags(RecipeDB,18415,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18415,1,2399,1,11052,1,18749,1,18772)

	-- Ghostweave Vest -- 18416
	-- Item Stats: 
	-- Item Stats: val9id4val71id6val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18416,275,14141,2,3908)
	self:addTradeFlags(RecipeDB,18416,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18416,1,2399,1,11052,1,18749,1,18772)

	-- Runecloth Gloves -- 18417
	-- Item Stats: 
	-- Item Stats: val9id4val9id5val45id6val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18417,275,13863,1,3908)
	self:addTradeFlags(RecipeDB,18417,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18417,1,2399,1,11052,1,18749,1,18772)

	-- Cindercloth Cloak -- 18418
	-- Item Stats: 
	-- Item Stats: val8id4val36id6val11id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18418,275,14044,2,3908)
	self:addTradeFlags(RecipeDB,18418,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,18418,3,7037)

	-- Felcloth Pants -- 18419
	-- Item Stats: 
	-- Item Stats: val12id4val62id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18419,275,14107,1,3908)
	self:addTradeFlags(RecipeDB,18419,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Brightcloth Cloak -- 18420
	-- Item Stats: 
	-- Item Stats: val36id6val7id35val7id36val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18420,275,14103,2,3908)
	self:addTradeFlags(RecipeDB,18420,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,18420,1,2399,1,11052,1,18749,1,18772)

	-- Wizardweave Leggings -- 18421
	-- Item Stats: 
	-- Item Stats: val62id6val16id32val16id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18421,275,14132,2,3908)
	self:addTradeFlags(RecipeDB,18421,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18421,1,2399,1,11052,1,18749,1,18772)

	-- Cloak of Fire -- 18422
	-- Item Stats: 
	-- Item Stats: val7id3val39id6val6id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18422,275,14134,3,3908)
	self:addTradeFlags(RecipeDB,18422,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB,18422,3,8921,3,9026)

	-- Runecloth Boots -- 18423
	-- Item Stats: 
	-- Item Stats: val9id4val14id5val50id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18423,280,13864,1,3908)
	self:addTradeFlags(RecipeDB,18423,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18423,1,2399,1,11052,1,18749,1,18772)

	-- Frostweave Pants -- 18424
	-- Item Stats: 
	-- Item Stats: val12id5val63id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18424,280,13871,2,3908)
	self:addTradeFlags(RecipeDB,18424,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18424,3,13300,1,2399,1,11052,1,18749,1,18772)

	-- Cindercloth Pants -- 18434
	-- Item Stats: 
	-- Item Stats: val12id4val63id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18434,280,14045,2,3908)
	self:addTradeFlags(RecipeDB,18434,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18434,3,7037)

	-- Robe of Winter Night -- 18436
	-- Item Stats: 
	-- Item Stats: val12id4val81id6val33id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18436,285,14136,3,3908)
	self:addTradeFlags(RecipeDB,18436,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,18436,3,7435,3,7436,3,7437,3,7449,3,7458,3,10659,3,10660,3,10661,3,10807)

	-- Felcloth Boots -- 18437
	-- Item Stats: 
	-- Item Stats: val12id5val51id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18437,285,14108,2,3908)
	self:addTradeFlags(RecipeDB,18437,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18437,1,2399,1,11052,1,18749,1,18772)

	-- Runecloth Pants -- 18438
	-- Item Stats: 
	-- Item Stats: val12id4val20id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18438,285,13865,2,3908)
	self:addTradeFlags(RecipeDB,18438,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18438,3,12397,1,2399,1,11052,1,18749,1,18772)

	-- Brightcloth Pants -- 18439
	-- Item Stats: 
	-- Item Stats: val66id6val17id35val16id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18439,290,14104,2,3908)
	self:addTradeFlags(RecipeDB,18439,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18439,7,2)

	-- Mooncloth Leggings -- 18440
	-- Item Stats: 
	-- Item Stats: val12id3val14id4val21id5val72id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18440,290,14137,3,3908)
	self:addTradeFlags(RecipeDB,18440,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Ghostweave Pants -- 18441
	-- Item Stats: 
	-- Item Stats: val12id4val66id6val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18441,290,14144,2,3908)
	self:addTradeFlags(RecipeDB,18441,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18441,1,2399,1,11052,1,18749,1,18772)

	-- Felcloth Hood -- 18442
	-- Item Stats: 
	-- Item Stats: val10id4val61id6val25id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18442,290,14111,2,3908)
	self:addTradeFlags(RecipeDB,18442,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18442,1,2399,1,11052,1,18749,1,18772)

	-- Runecloth Headband -- 18444
	-- Item Stats: 
	-- Item Stats: val20id4val13id5val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18444,295,13866,2,3908)
	self:addTradeFlags(RecipeDB,18444,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18444,1,2399,1,11052,1,18749,1,18772)

	-- Mooncloth Bag -- 18445
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18445,300,14155,2,3908)
	self:addTradeFlags(RecipeDB,18445,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18445,7,2)

	-- Wizardweave Robe -- 18446
	-- Item Stats: 
	-- Item Stats: val77id6val17id32val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18446,300,14128,2,3908)
	self:addTradeFlags(RecipeDB,18446,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18446,1,2399,1,11052,1,18749,1,18772)

	-- Mooncloth Vest -- 18447
	-- Item Stats: 
	-- Item Stats: val12id3val20id4val19id5val85id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18447,300,14138,3,3908)
	self:addTradeFlags(RecipeDB,18447,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18447,3,10184)

	-- Mooncloth Shoulders -- 18448
	-- Item Stats: 
	-- Item Stats: val9id3val17id4val11id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18448,300,14139,3,3908)
	self:addTradeFlags(RecipeDB,18448,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Runecloth Shoulders -- 18449
	-- Item Stats: 
	-- Item Stats: val15id4val10id5val59id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18449,300,13867,2,3908)
	self:addTradeFlags(RecipeDB,18449,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18449,3,12397,1,2399,1,11052,1,18749,1,18772)

	-- Wizardweave Turban -- 18450
	-- Item Stats: 
	-- Item Stats: val64id6val18id32val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18450,300,14130,2,3908)
	self:addTradeFlags(RecipeDB,18450,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18450,1,2399,1,11052,1,18749,1,18772)

	-- Felcloth Robe -- 18451
	-- Item Stats: 
	-- Item Stats: val7id3val79id6val29id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18451,300,14106,2,3908)
	self:addTradeFlags(RecipeDB,18451,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18451,3,13152,1,2399,1,11052,1,18749,1,18772)

	-- Mooncloth Circlet -- 18452
	-- Item Stats: 
	-- Item Stats: val13id3val23id4val15id5val71id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18452,300,14140,3,3908)
	self:addTradeFlags(RecipeDB,18452,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18452,3,10184)

	-- Felcloth Shoulders -- 18453
	-- Item Stats: 
	-- Item Stats: val5id5val60id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18453,300,14112,2,3908)
	self:addTradeFlags(RecipeDB,18453,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,18453,3,12397,3,13140,3,13152,3,13153,1,2399,1,11052,1,18749,1,18772)

	-- Gloves of Spell Mastery -- 18454
	-- Item Stats: 
	-- Item Stats: val10id4val8id5val68id6val28id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18454,300,14146,4,3908)
	self:addTradeFlags(RecipeDB,18454,26,36,40,47,56)
	-- No acquire information

	-- Bottomless Bag -- 18455
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18455,300,14156,3,3908)
	self:addTradeFlags(RecipeDB,18455,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18455,3,10184)

	-- Truefaith Vestments -- 18456
	-- Item Stats: 
	-- Item Stats: val14id3val109id6val6id24val39id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18456,300,14154,4,3908)
	self:addTradeFlags(RecipeDB,18456,3,26,37,41,47,56)
	-- No acquire information

	-- Robe of the Archmage -- 18457
	-- Item Stats: 
	-- Item Stats: val12id4val109id6val14id44val40id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18457,300,14152,4,3908)
	self:addTradeFlags(RecipeDB,18457,1,2,5,37,41,47,56)
	self:addTradeAcquire(RecipeDB,18457,3,9264)

	-- Robe of the Void -- 18458
	-- Item Stats: 
	-- Item Stats: val14id3val109id6val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18458,300,14153,4,3908)
	self:addTradeFlags(RecipeDB,18458,1,2,5,37,41,47,56)
	self:addTradeAcquire(RecipeDB,18458,3,1853)

	-- Mooncloth -- 18560
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18560,250,14342,1,3908)
	self:addTradeFlags(RecipeDB,18560,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18560,2,11189)

	-- Mooncloth Boots -- 19435
	-- Item Stats: 
	-- Item Stats: val11id3val14id4val13id5val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19435,265,15802,3,3908)
	self:addTradeFlags(RecipeDB,19435,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Flarecore Mantle -- 20848
	-- Item Stats: 
	-- Item Stats: val9id3val10id4val10id5val81id6val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20848,300,16980,1,3908)
	self:addTradeFlags(RecipeDB,20848,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,20848,2,12944)

	-- Flarecore Gloves -- 20849
	-- Item Stats: 
	-- Item Stats: val10id3val14id4val68id6val25id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20849,300,16979,1,3908)
	self:addTradeFlags(RecipeDB,20849,1,2,4,5,26,36,41,47,56)
	self:addTradeAcquire(RecipeDB,20849,2,12944)

	-- Green Holiday Shirt -- 21945
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,21945,190,17723,1,3908)
	self:addTradeFlags(RecipeDB,21945,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flarecore Wraps -- 22759
	-- Item Stats: 
	-- Item Stats: val8id4val49id6val9id24val7id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22759,300,18263,3,3908)
	self:addTradeFlags(RecipeDB,22759,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,22759,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Gordok Ogre Suit -- 22813
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22813,275,18258,2,3908)
	self:addTradeFlags(RecipeDB,22813,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Belt of the Archmage -- 22866
	-- Item Stats: 
	-- Item Stats: val10id3val25id4val62id6val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22866,300,18405,4,3908)
	self:addTradeFlags(RecipeDB,22866,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Felcloth Gloves -- 22867
	-- Item Stats: 
	-- Item Stats: val9id3val55id6val27id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22867,300,18407,3,3908)
	self:addTradeFlags(RecipeDB,22867,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Inferno Gloves -- 22868
	-- Item Stats: 
	-- Item Stats: val9id4val55id6val27id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22868,300,18408,3,3908)
	self:addTradeFlags(RecipeDB,22868,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Mooncloth Gloves -- 22869
	-- Item Stats: 
	-- Item Stats: val9id3val16id4val15id5val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22869,300,18409,3,3908)
	self:addTradeFlags(RecipeDB,22869,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Cloak of Warding -- 22870
	-- Item Stats: Tanking, 
	-- Item Stats: val214id6val7id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22870,300,18413,3,3908)
	self:addTradeFlags(RecipeDB,22870,21,22,23,24,25,26,27,28,29,30,36,41,47,52,60)
	-- No acquire information

	-- Mooncloth Robe -- 22902
	-- Item Stats: 
	-- Item Stats: val12id3val25id4val12id5val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22902,300,18486,1,3908)
	self:addTradeFlags(RecipeDB,22902,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,22902,2,14371)

	-- Wisdom of the Timbermaw -- 23662
	-- Item Stats: 
	-- Item Stats: val21id4val46id6val4id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23662,290,19047,1,3908)
	self:addTradeFlags(RecipeDB,23662,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,99)
	self:addTradeAcquire(RecipeDB,23662,6,576,2,11557)

	-- Mantle of the Timbermaw -- 23663
	-- Item Stats: 
	-- Item Stats: val21id4val68id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23663,300,19050,1,3908)
	self:addTradeFlags(RecipeDB,23663,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,99)
	self:addTradeAcquire(RecipeDB,23663,6,576,3,11557)

	-- Argent Boots -- 23664
	-- Item Stats: 
	-- Item Stats: val21id3val7id5val57id6val4id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23664,290,19056,1,3908)
	self:addTradeFlags(RecipeDB,23664,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB,23664,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Argent Shoulders -- 23665
	-- Item Stats: 
	-- Item Stats: val23id3val8id5val68id6val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23665,300,19059,1,3908)
	self:addTradeFlags(RecipeDB,23665,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB,23665,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Flarecore Robe -- 23666
	-- Item Stats: 
	-- Item Stats: val35id3val116id6val15id33val23id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23666,300,19156,1,3908)
	self:addTradeFlags(RecipeDB,23666,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,23666,2,12944)

	-- Flarecore Leggings -- 23667
	-- Item Stats: 
	-- Item Stats: val21id3val107id6val16id33val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23667,300,19165,1,3908)
	self:addTradeFlags(RecipeDB,23667,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,23667,2,12944)

	-- Bloodvine Vest -- 24091
	-- Item Stats: 
	-- Item Stats: val13id4val92id6val16id45val27id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24091,300,19682,1,3908)
	self:addTradeFlags(RecipeDB,24091,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,100)
	self:addTradeAcquire(RecipeDB,24091,6,270,3,14921)

	-- Bloodvine Leggings -- 24092
	-- Item Stats: 
	-- Item Stats: val6id4val80id6val8id45val37id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24092,300,19683,1,3908)
	self:addTradeFlags(RecipeDB,24092,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,100)
	self:addTradeAcquire(RecipeDB,24092,6,270,2,14921)

	-- Bloodvine Boots -- 24093
	-- Item Stats: 
	-- Item Stats: val16id4val63id6val8id45val19id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24093,300,19684,1,3908)
	self:addTradeFlags(RecipeDB,24093,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,100)
	self:addTradeAcquire(RecipeDB,24093,6,270,1,14921)

	-- Runed Stygian Leggings -- 24901
	-- Item Stats: 
	-- Item Stats: val13id3val78id6val6id24val25id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24901,300,20538,3,3908)
	self:addTradeFlags(RecipeDB,24901,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Runed Stygian Belt -- 24902
	-- Item Stats: 
	-- Item Stats: val10id3val50id6val3id24val20id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24902,300,20539,3,3908)
	self:addTradeFlags(RecipeDB,24902,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Runed Stygian Boots -- 24903
	-- Item Stats: 
	-- Item Stats: val8id3val61id6val4id24val20id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24903,300,20537,3,3908)
	self:addTradeFlags(RecipeDB,24903,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Soul Pouch -- 26085
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26085,260,21340,1,3908)
	self:addTradeFlags(RecipeDB,26085,1,2,4,29,36,40)
	self:addTradeAcquire(RecipeDB,26085,2,6568)

	-- Felcloth Bag -- 26086
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26086,270,21341,3,3908)
	self:addTradeFlags(RecipeDB,26086,3,29,36,41)
	-- No acquire information

	-- Core Felcloth Bag -- 26087
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26087,300,21342,3,3908)
	self:addTradeFlags(RecipeDB,26087,1,2,6,11,29,36,40)
	self:addTradeAcquire(RecipeDB,26087,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264,3,12397)

	-- Festival Dress -- 26403
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26403,250,21154,2,3908)
	self:addTradeFlags(RecipeDB,26403,8,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26403,4,8878)

	-- Festive Red Pant Suit -- 26407
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26407,250,21542,2,3908)
	self:addTradeFlags(RecipeDB,26407,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26407,4,8878)

	-- Bolt of Netherweave -- 26745
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26745,285,21840,1,3908)
	self:addTradeFlags(RecipeDB,26745,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26745,1,18749,1,18772)

	-- Netherweave Bag -- 26746
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26746,300,21841,1,3908)
	self:addTradeFlags(RecipeDB,26746,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26746,1,18749,1,18772)

	-- Bolt of Imbued Netherweave -- 26747
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26747,325,21842,1,3908)
	self:addTradeFlags(RecipeDB,26747,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26747,2,16638,2,16767,2,19213)

	-- Imbued Netherweave Bag -- 26749
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26749,340,21843,1,3908)
	self:addTradeFlags(RecipeDB,26749,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26749,2,19015,2,19213)

	-- Bolt of Soulcloth -- 26750
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26750,345,21844,1,3908)
	self:addTradeFlags(RecipeDB,26750,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26750,2,16638,2,16767,2,19015,2,19017)

	-- Primal Mooncloth -- 26751
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26751,350,21845,1,3908)
	self:addTradeFlags(RecipeDB,26751,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26751,2,22208,2,29512)

	-- Spellfire Belt -- 26752
	-- Item Stats: 
	-- Item Stats: val18id4val100id6val18id44val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26752,355,21846,1,3908,26797)	self:addTradeFlags(RecipeDB,26752,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26752,2,22213,2,29511)

	-- Spellfire Gloves -- 26753
	-- Item Stats: 
	-- Item Stats: val10id4val111id6val23id44val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26753,365,21847,1,3908,26797)	self:addTradeFlags(RecipeDB,26753,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26753,2,22213,2,29511)

	-- Spellfire Robe -- 26754
	-- Item Stats: 
	-- Item Stats: val17id4val178id6val28id44val58id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26754,375,21848,1,3908,26797)	self:addTradeFlags(RecipeDB,26754,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26754,2,22213,2,29511)

	-- Spellfire Bag -- 26755
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26755,375,21858,3,3908)
	self:addTradeFlags(RecipeDB,26755,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26755,3,20134,3,20135,2,22213,2,29511)

	-- Frozen Shadoweave Shoulders -- 26756
	-- Item Stats: 
	-- Item Stats: val21id3val15id4val133id6val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26756,355,21869,1,3908,26801)	self:addTradeFlags(RecipeDB,26756,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26756,2,22212,2,29510)

	-- Frozen Shadoweave Boots -- 26757
	-- Item Stats: 
	-- Item Stats: val15id3val9id4val122id6val47id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26757,365,21870,1,3908,26801)	self:addTradeFlags(RecipeDB,26757,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26757,2,22212,2,29510)

	-- Frozen Shadoweave Robe -- 26758
	-- Item Stats: 
	-- Item Stats: val30id3val20id4val178id6val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26758,375,21871,1,3908,26801)	self:addTradeFlags(RecipeDB,26758,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26758,2,22212,2,29510)

	-- Ebon Shadowbag -- 26759
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26759,375,21872,3,3908)
	self:addTradeFlags(RecipeDB,26759,1,2,4,29,36,41)
	self:addTradeAcquire(RecipeDB,26759,2,22212,2,29510)

	-- Primal Mooncloth Belt -- 26760
	-- Item Stats: 
	-- Item Stats: val12id4val11id5val109id6val8id24val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26760,355,21873,1,3908,26798)	self:addTradeFlags(RecipeDB,26760,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26760,2,22208,2,29512)

	-- Primal Mooncloth Shoulders -- 26761
	-- Item Stats: 
	-- Item Stats: val16id4val15id5val133id6val7id24val49id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26761,365,21874,1,3908,26798)	self:addTradeFlags(RecipeDB,26761,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26761,2,22208,2,29512)

	-- Primal Mooncloth Robe -- 26762
	-- Item Stats: 
	-- Item Stats: val20id4val20id5val202id6val10id24val64id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26762,375,21875,1,3908,26798)	self:addTradeFlags(RecipeDB,26762,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26762,2,22208,2,29512)

	-- Primal Mooncloth Bag -- 26763
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26763,375,21876,3,3908)
	self:addTradeFlags(RecipeDB,26763,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26763,3,18872,2,22208,2,29512)

	-- Netherweave Bracers -- 26764
	-- Item Stats: 
	-- Item Stats: val24id3val51id6val19id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26764,310,21849,1,3908)
	self:addTradeFlags(RecipeDB,26764,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26764,1,18749,1,18772)

	-- Netherweave Belt -- 26765
	-- Item Stats: 
	-- Item Stats: val30id3val65id6val26id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26765,310,21850,1,3908)
	self:addTradeFlags(RecipeDB,26765,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26765,1,18749,1,18772)

	-- Netherweave Gloves -- 26770
	-- Item Stats: 
	-- Item Stats: val30id3val77id6val28id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26770,320,21851,1,3908)
	self:addTradeFlags(RecipeDB,26770,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26770,1,18749,1,18772)

	-- Netherweave Pants -- 26771
	-- Item Stats: 
	-- Item Stats: val45id3val111id6val37id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26771,325,21852,1,3908)
	self:addTradeFlags(RecipeDB,26771,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26771,1,18749,1,18772)

	-- Netherweave Boots -- 26772
	-- Item Stats: 
	-- Item Stats: val30id3val92id6val34id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26772,335,21853,1,3908)
	self:addTradeFlags(RecipeDB,26772,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26772,1,18749,1,18772)

	-- Netherweave Robe -- 26773
	-- Item Stats: 
	-- Item Stats: val45id3val137id6val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26773,340,21854,1,3908)
	self:addTradeFlags(RecipeDB,26773,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26773,2,16638,2,16767,2,19213)

	-- Netherweave Tunic -- 26774
	-- Item Stats: 
	-- Item Stats: val45id3val141id6val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26774,345,21855,1,3908)
	self:addTradeFlags(RecipeDB,26774,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26774,2,16638,2,16767,2,19213)

	-- Imbued Netherweave Pants -- 26775
	-- Item Stats: 
	-- Item Stats: val39id3val26id4val126id6val10id24val30id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26775,340,21859,1,3908)
	self:addTradeFlags(RecipeDB,26775,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26775,2,18011,2,19722)

	-- Imbued Netherweave Boots -- 26776
	-- Item Stats: 
	-- Item Stats: val30id3val21id4val102id6val8id24val23id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26776,350,21860,1,3908)
	self:addTradeFlags(RecipeDB,26776,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26776,2,18011,2,19722)

	-- Imbued Netherweave Robe -- 26777
	-- Item Stats: 
	-- Item Stats: val42id3val28id4val155id6val11id24val33id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26777,360,21861,1,3908)
	self:addTradeFlags(RecipeDB,26777,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26777,2,19521)

	-- Imbued Netherweave Tunic -- 26778
	-- Item Stats: 
	-- Item Stats: val28id3val155id6val11id24val50id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26778,360,21862,1,3908)
	self:addTradeFlags(RecipeDB,26778,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26778,2,19521)

	-- Soulcloth Gloves -- 26779
	-- Item Stats: 
	-- Item Stats: val24id3val13id4val9id5val106id6val35id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26779,355,21863,1,3908)
	self:addTradeFlags(RecipeDB,26779,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,26779,2,19015,2,19017)

	-- Soulcloth Shoulders -- 26780
	-- Item Stats: 
	-- Item Stats: val30id3val15id4val11id5val127id6val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26780,365,21864,4,3908)
	self:addTradeFlags(RecipeDB,26780,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26780,3,16406)

	-- Soulcloth Vest -- 26781
	-- Item Stats: 
	-- Item Stats: val24id3val20id4val16id5val170id6val45id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26781,375,21865,4,3908)
	self:addTradeFlags(RecipeDB,26781,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26781,3,16408)

	-- Arcanoweave Bracers -- 26782
	-- Item Stats: 
	-- Item Stats: val31id3val67id6val25id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26782,350,21866,2,3908)
	self:addTradeFlags(RecipeDB,26782,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26782,3,20869)

	-- Arcanoweave Boots -- 26783
	-- Item Stats: 
	-- Item Stats: val39id3val106id6val35id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26783,360,21867,2,3908)
	self:addTradeFlags(RecipeDB,26783,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26783,3,19168)

	-- Arcanoweave Robe -- 26784
	-- Item Stats: 
	-- Item Stats: val45id3val156id6val9id24val50id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26784,370,21868,2,3908)
	self:addTradeFlags(RecipeDB,26784,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,26784,3,19220)

	-- Enchanted Mageweave Pouch -- 27658
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27658,225,22246,1,3908)
	self:addTradeFlags(RecipeDB,27658,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27658,2,1318,2,3012,2,3346,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Enchanted Runecloth Bag -- 27659
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27659,275,22248,1,3908)
	self:addTradeFlags(RecipeDB,27659,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27659,2,15419)

	-- Big Bag of Enchantment -- 27660
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27660,300,22249,2,3908)
	self:addTradeFlags(RecipeDB,27660,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27660,3,11487)

	-- Cenarion Herb Bag -- 27724
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27724,275,22251,1,3908)
	self:addTradeFlags(RecipeDB,27724,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,97)
	self:addTradeAcquire(RecipeDB,27724,6,609,1,15179)

	-- Satchel of Cenarius -- 27725
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27725,300,22252,1,3908)
	self:addTradeFlags(RecipeDB,27725,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,97)
	self:addTradeAcquire(RecipeDB,27725,6,609,3,15179)

	-- Glacial Gloves -- 28205
	-- Item Stats: 
	-- Item Stats: val22id3val87id6val30id35val15id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28205,285,22654,4,3908)
	self:addTradeFlags(RecipeDB,28205,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB,28205,6,529,3,16365)

	-- Glacial Vest -- 28207
	-- Item Stats: 
	-- Item Stats: val26id3val139id6val40id35val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28207,285,22652,4,3908)
	self:addTradeFlags(RecipeDB,28207,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB,28207,6,529,4,16365)

	-- Glacial Cloak -- 28208
	-- Item Stats: 
	-- Item Stats: val18id3val69id6val24id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28208,285,22658,4,3908)
	self:addTradeFlags(RecipeDB,28208,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,60,96)
	self:addTradeAcquire(RecipeDB,28208,6,529,2,16365)

	-- Glacial Wrists -- 28209
	-- Item Stats: 
	-- Item Stats: val20id3val61id6val20id35val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28209,285,22655,4,3908)
	self:addTradeFlags(RecipeDB,28209,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB,28209,6,529,3,16365)

	-- Gaea's Embrace -- 28210
	-- Item Stats: 
	-- Item Stats: val6id3val49id6val20id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28210,300,22660,1,3908)
	self:addTradeFlags(RecipeDB,28210,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60,97)
	self:addTradeAcquire(RecipeDB,28210,6,609,3,15179)

	-- Sylvan Vest -- 28480
	-- Item Stats: 
	-- Item Stats: val15id3val98id6val30id34val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28480,300,22756,1,3908)
	self:addTradeFlags(RecipeDB,28480,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,97)
	self:addTradeAcquire(RecipeDB,28480,6,609,3,15179)

	-- Sylvan Crown -- 28481
	-- Item Stats: 
	-- Item Stats: val10id3val80id6val30id34val18id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28481,300,22757,1,3908)
	self:addTradeFlags(RecipeDB,28481,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,97)
	self:addTradeAcquire(RecipeDB,28481,6,609,2,15179)

	-- Sylvan Shoulders -- 28482
	-- Item Stats: 
	-- Item Stats: val18id3val74id6val20id34val7id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28482,300,22758,1,3908)
	self:addTradeFlags(RecipeDB,28482,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,97)
	self:addTradeAcquire(RecipeDB,28482,6,609,1,15179)

	-- Spellcloth -- 31373
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31373,350,24271,1,3908)
	self:addTradeFlags(RecipeDB,31373,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,31373,2,22213,2,29511)

	-- Mystic Spellthread -- 31430
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31430,335,24273,1,3908)
	self:addTradeFlags(RecipeDB,31430,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB,31430,6,934,2,19331)

	-- Silver Spellthread -- 31431
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31431,335,24275,1,3908)
	self:addTradeFlags(RecipeDB,31431,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,101)
	self:addTradeAcquire(RecipeDB,31431,6,932,2,19321)

	-- Runic Spellthread -- 31432
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31432,375,24274,1,3908)
	self:addTradeFlags(RecipeDB,31432,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB,31432,6,934,4,19331)

	-- Golden Spellthread -- 31433
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31433,375,24276,1,3908)
	self:addTradeFlags(RecipeDB,31433,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,101)
	self:addTradeAcquire(RecipeDB,31433,6,932,4,19321)

	-- Unyielding Bracers -- 31434
	-- Item Stats: 
	-- Item Stats: val39id3val67id6val12id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31434,350,24249,3,3908)
	self:addTradeFlags(RecipeDB,31434,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,31434,7,3)

	-- Bracers of Havok -- 31435
	-- Item Stats: 
	-- Item Stats: val12id4val67id6val30id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31435,350,24250,3,3908)
	self:addTradeFlags(RecipeDB,31435,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,31435,7,3)

	-- Blackstrike Bracers -- 31437
	-- Item Stats: 
	-- Item Stats: val67id6val5id24val26id44val2id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31437,350,24251,3,3908)
	self:addTradeFlags(RecipeDB,31437,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,31437,7,3)

	-- Cloak of the Black Void -- 31438
	-- Item Stats: 
	-- Item Stats: val11id4val76id6val35id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31438,350,24252,3,3908)
	self:addTradeFlags(RecipeDB,31438,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,31438,7,3)

	-- Cloak of Eternity -- 31440
	-- Item Stats: Tanking, 
	-- Item Stats: val36id3val76id6val23id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31440,350,24253,3,3908)
	self:addTradeFlags(RecipeDB,31440,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,60)
	self:addTradeAcquire(RecipeDB,31440,7,3)

	-- White Remedy Cape -- 31441
	-- Item Stats: 
	-- Item Stats: val76id6val7id24val32id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31441,350,24254,3,3908)
	self:addTradeFlags(RecipeDB,31441,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,31441,7,3)

	-- Unyielding Girdle -- 31442
	-- Item Stats: 
	-- Item Stats: val28id3val3id4val100id6val20id29val32id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31442,365,24255,4,3908)
	self:addTradeFlags(RecipeDB,31442,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,31442,7,4)

	-- Girdle of Ruination -- 31443
	-- Item Stats: 
	-- Item Stats: val18id3val13id4val100id6val20id44val39id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31443,365,24256,4,3908)
	self:addTradeFlags(RecipeDB,31443,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,31443,7,4)

	-- Black Belt of Knowledge -- 31444
	-- Item Stats: 
	-- Item Stats: val18id4val21id5val100id6val11id24val4id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31444,365,24257,4,3908)
	self:addTradeFlags(RecipeDB,31444,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,31444,3,16409,3,16504,3,16525,3,16530,3,17723,3,20052,3,21301,3,21339)

	-- Resolute Cape -- 31448
	-- Item Stats: 
	-- Item Stats: val30id3val349id6val21id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31448,365,24258,4,3908)
	self:addTradeFlags(RecipeDB,31448,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,31448,3,15548,3,16409,3,16526,3,16596,3,17669,3,17800,3,21298,3,22286,3,23597)

	-- Vengeance Wrap -- 31449
	-- Item Stats: 
	-- Item Stats: val89id6val23id44val52id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31449,365,24259,4,3908)
	self:addTradeFlags(RecipeDB,31449,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,31449,7,4)

	-- Manaweave Cloak -- 31450
	-- Item Stats: 
	-- Item Stats: val20id4val21id5val89id6val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31450,365,24260,4,3908)
	self:addTradeFlags(RecipeDB,31450,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB,31450,7,4)

	-- Whitemend Pants -- 31451
	-- Item Stats: 
	-- Item Stats: val21id3val25id4val156id6val11id24val33id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31451,375,24261,4,3908)
	self:addTradeFlags(RecipeDB,31451,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,31451,3,20885)

	-- Spellstrike Pants -- 31452
	-- Item Stats: 
	-- Item Stats: val12id3val8id4val156id6val26id44val22id45val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31452,375,24262,4,3908)
	self:addTradeFlags(RecipeDB,31452,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,31452,3,18708)

	-- Battlecast Pants -- 31453
	-- Item Stats: 
	-- Item Stats: val42id3val27id4val156id6val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31453,375,24263,4,3908)
	self:addTradeFlags(RecipeDB,31453,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,31453,3,17978)

	-- Whitemend Hood -- 31454
	-- Item Stats: 
	-- Item Stats: val15id3val19id4val145id6val11id24val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31454,375,24264,4,3908)
	self:addTradeFlags(RecipeDB,31454,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,31454,3,17977)

	-- Spellstrike Hood -- 31455
	-- Item Stats: 
	-- Item Stats: val16id3val12id4val145id6val24id44val16id45val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31455,375,24266,4,3908)
	self:addTradeFlags(RecipeDB,31455,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,31455,3,16807,3,17669)

	-- Battlecast Hood -- 31456
	-- Item Stats: 
	-- Item Stats: val43id3val28id4val145id6val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31456,375,24267,4,3908)
	self:addTradeFlags(RecipeDB,31456,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,31456,3,17798)

	-- Bag of Jewels -- 31459
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31459,340,24270,1,3908)
	self:addTradeFlags(RecipeDB,31459,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB,31459,6,933,2,20242,6,933,2,23007)

	-- Netherweave Net -- 31460
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31460,300,24268,1,3908)
	self:addTradeFlags(RecipeDB,31460,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,31460,1,11557,1,18749,1,18772)

	-- Heavy Netherweave Net -- 31461
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,31461,325,24269,1,3908)
	self:addTradeFlags(RecipeDB,31461,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,31461,1,24315)

	-- Belt of Blasting -- 36315
	-- Item Stats: 
	-- Item Stats: val121id6val30id44val23id45val54id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36315,375,30038,4,3908)
	self:addTradeFlags(RecipeDB,36315,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,36315,7,4)

	-- Belt of the Long Road -- 36316
	-- Item Stats: 
	-- Item Stats: val13id3val18id4val33id5val121id6val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36316,375,30036,4,3908)
	self:addTradeFlags(RecipeDB,36316,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,36316,7,4)

	-- Boots of Blasting -- 36317
	-- Item Stats: 
	-- Item Stats: val25id3val25id4val148id6val25id44val18id45val39id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36317,375,30037,4,3908)
	self:addTradeFlags(RecipeDB,36317,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,36317,7,4)

	-- Boots of the Long Road -- 36318
	-- Item Stats: 
	-- Item Stats: val25id3val26id4val22id5val148id6val9id24val39id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36318,375,30035,4,3908)
	self:addTradeFlags(RecipeDB,36318,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,36318,7,4)

	-- Netherflame Robe -- 36665
	-- Item Stats: 
	-- Item Stats: val21id3val149id6val35id44val14id45val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36665,355,30459,3,3908)
	self:addTradeFlags(RecipeDB,36665,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Netherflame Belt -- 36667
	-- Item Stats: 
	-- Item Stats: val16id3val84id6val11id44val25id45val29id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36667,355,30460,3,3908)
	self:addTradeFlags(RecipeDB,36667,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Netherflame Boots -- 36668
	-- Item Stats: 
	-- Item Stats: val16id3val103id6val25id44val11id45val29id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36668,355,30461,3,3908)
	self:addTradeFlags(RecipeDB,36668,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Lifeblood Leggings -- 36669
	-- Item Stats: 
	-- Item Stats: val21id3val14id4val126id6val14id24val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36669,355,30465,3,3908)
	self:addTradeFlags(RecipeDB,36669,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Lifeblood Belt -- 36670
	-- Item Stats: 
	-- Item Stats: val16id3val11id4val84id6val10id24val29id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36670,355,30463,3,3908)
	self:addTradeFlags(RecipeDB,36670,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Lifeblood Bracers -- 36672
	-- Item Stats: 
	-- Item Stats: val15id3val10id4val67id6val8id24val22id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36672,355,30464,3,3908)
	self:addTradeFlags(RecipeDB,36672,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Shadowcloth -- 36686
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36686,350,24272,1,3908)
	self:addTradeFlags(RecipeDB,36686,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,36686,2,22212,2,29510)

	-- Cloak of Arcane Evasion -- 37873
	-- Item Stats: 
	-- Item Stats: val12id3val76id6val32id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37873,350,30831,1,3908)
	self:addTradeFlags(RecipeDB,37873,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60,107)
	self:addTradeAcquire(RecipeDB,37873,6,1011,2,21655)

	-- Flameheart Bracers -- 37882
	-- Item Stats: 
	-- Item Stats: val12id3val8id4val67id6val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37882,350,30837,1,3908)
	self:addTradeFlags(RecipeDB,37882,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,101)
	self:addTradeAcquire(RecipeDB,37882,6,932,1,19321)

	-- Flameheart Gloves -- 37883
	-- Item Stats: 
	-- Item Stats: val15id3val11id4val97id6val40id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37883,360,30838,1,3908)
	self:addTradeFlags(RecipeDB,37883,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,101)
	self:addTradeAcquire(RecipeDB,37883,6,932,2,19321)

	-- Flameheart Vest -- 37884
	-- Item Stats: 
	-- Item Stats: val30id3val19id4val156id6val50id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37884,370,30839,1,3908)
	self:addTradeFlags(RecipeDB,37884,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,101)
	self:addTradeAcquire(RecipeDB,37884,6,932,4,19321)

	-- Soulguard Slippers -- 40020
	-- Item Stats: 
	-- Item Stats: val40id3val150id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,40020,375,32391,1,3908)
	self:addTradeFlags(RecipeDB,40020,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB,40020,6,1012,2,23159)

	-- Soulguard Bracers -- 40021
	-- Item Stats: 
	-- Item Stats: val30id3val96id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,40021,375,32392,1,3908)
	self:addTradeFlags(RecipeDB,40021,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB,40021,6,1012,1,23159)

	-- Soulguard Leggings -- 40023
	-- Item Stats: 
	-- Item Stats: val54id3val191id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,40023,375,32389,1,3908)
	self:addTradeFlags(RecipeDB,40023,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB,40023,6,1012,2,23159)

	-- Soulguard Girdle -- 40024
	-- Item Stats: 
	-- Item Stats: val40id3val123id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,40024,375,32390,1,3908)
	self:addTradeFlags(RecipeDB,40024,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB,40024,6,1012,1,23159)

	-- Night's End -- 40060
	-- Item Stats: 
	-- Item Stats: val30id3val109id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,40060,375,32420,1,3908)
	self:addTradeFlags(RecipeDB,40060,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,60,102)
	self:addTradeAcquire(RecipeDB,40060,6,1012,2,23159)

	-- Bracers of Nimble Thought -- 41205
	-- Item Stats: 
	-- Item Stats: val27id3val20id4val103id6val28id46val34id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41205,375,32586,4,3908)
	self:addTradeFlags(RecipeDB,41205,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,41205,7,4)

	-- Mantle of Nimble Thought -- 41206
	-- Item Stats: 
	-- Item Stats: val37id3val26id4val177id6val38id46val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41206,375,32587,4,3908)
	self:addTradeFlags(RecipeDB,41206,1,2,6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,41206,3,17895,3,17897,3,17898,3,17899,3,17905,3,17906,3,17908,3,17916)

	-- Swiftheal Wraps -- 41207
	-- Item Stats: 
	-- Item Stats: val24id3val22id4val103id6val28id46val34id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41207,375,32584,4,3908)
	self:addTradeFlags(RecipeDB,41207,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,41207,3,17895,3,17897,3,17898,3,17899,3,17905,3,17906,3,17907,3,17908,3,17916)

	-- Swiftheal Mantle -- 41208
	-- Item Stats: 
	-- Item Stats: val21id3val16id4val28id5val177id6val27id46val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41208,375,32585,4,3908)
	self:addTradeFlags(RecipeDB,41208,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,41208,7,4)

	-- Green Winter Clothes -- 44950
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44950,250,34087,2,3908)
	self:addTradeFlags(RecipeDB,44950,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Red Winter Clothes -- 44958
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44958,250,34085,2,3908)
	self:addTradeFlags(RecipeDB,44958,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Sunfire Handwraps -- 46128
	-- Item Stats: 
	-- Item Stats: val33id3val30id4val166id6val37id44val57id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46128,365,34366,4,3908)
	self:addTradeFlags(RecipeDB,46128,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,46128,3,25363,3,25367,3,25368,3,25369,3,25370,3,25371)

	-- Hands of Eternal Light -- 46129
	-- Item Stats: 
	-- Item Stats: val33id3val30id4val37id5val166id6val53id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46129,365,34367,4,3908)
	self:addTradeFlags(RecipeDB,46129,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB,46129,3,25363,3,25368,3,25369,3,25370,3,25371,3,25507)

	-- Sunfire Robe -- 46130
	-- Item Stats: 
	-- Item Stats: val36id3val34id4val266id6val40id44val40id46val76id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46130,365,34364,4,3908)
	self:addTradeFlags(RecipeDB,46130,1,2,11,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,46130,3,25363,3,25367,3,25368,3,25369,3,25370,3,25371,3,25507)

	-- Robe of Eternal Light -- 46131
	-- Item Stats: 
	-- Item Stats: val36id3val34id4val266id6val18id24val40id46val71id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46131,365,34365,4,3908)
	self:addTradeFlags(RecipeDB,46131,1,2,11,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB,46131,3,25363,3,25367,3,25369,3,25370,3,25371,3,25486,3,25592)

	-- Dress Shoes -- 49677
	-- Item Stats: 
	-- Item Stats: val2id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,49677,250,6836,1,3908)
	self:addTradeFlags(RecipeDB,49677,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,49677,2,15165)

	-- Mycah's Botanical Bag -- 50194
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,50194,375,38225,1,3908)
	self:addTradeFlags(RecipeDB,50194,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB,50194,6,970,3,18382)

	-- Haliscan Jacket -- 50644
	-- Item Stats: 
	-- Item Stats: val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,50644,250,38277,1,3908)
	self:addTradeFlags(RecipeDB,50644,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,50644,2,15165)

	-- Haliscan Pantaloons -- 50647
	-- Item Stats: 
	-- Item Stats: val39id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,50647,245,38278,1,3908)
	self:addTradeFlags(RecipeDB,50647,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB,50647,2,15165)

	-- Lightweave Embroidery -- 55642
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55642,395,nil, 1, 3908)
	self:addTradeFlags(RecipeDB,55642,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Darkglow Embroidery -- 55769
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55769,395,nil, 1, 3908)
	self:addTradeFlags(RecipeDB,55769,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Swordguard Embroidery -- 55777
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55777,395,nil, 1, 3908)
	self:addTradeFlags(RecipeDB,55777,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Frostweave Net -- 55898
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55898,350,41509,1,3908)
	self:addTradeFlags(RecipeDB,55898,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bolt of Frostweave -- 55899
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55899,365,41510,1,3908)
	self:addTradeFlags(RecipeDB,55899,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bolt of Imbued Frostweave -- 55900
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55900,395,41511,1,3908)
	self:addTradeFlags(RecipeDB,55900,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Duskweave Leggings -- 55901
	-- Item Stats: 
	-- Item Stats: val41id4val164id6val32id46val66id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55901,395,41548,2,3908)
	self:addTradeFlags(RecipeDB,55901,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Shoulders -- 55902
	-- Item Stats: 
	-- Item Stats: val28id3val25id5val123id6val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55902,340,41513,2,3908)
	self:addTradeFlags(RecipeDB,55902,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Robe -- 55903
	-- Item Stats: 
	-- Item Stats: val39id3val34id5val164id6val54id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55903,350,41515,2,3908)
	self:addTradeFlags(RecipeDB,55903,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Gloves -- 55904
	-- Item Stats: 
	-- Item Stats: val30id3val26id5val106id6val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55904,350,44211,1, 3908)
	self:addTradeFlags(RecipeDB,55904,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Boots -- 55906
	-- Item Stats: 
	-- Item Stats: val30id3val26id5val116id6val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55906,365,41520,2,3908)
	self:addTradeFlags(RecipeDB,55906,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Cowl -- 55907
	-- Item Stats: 
	-- Item Stats: val43id3val36id5val141id6val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55907,370,41521,2,3908)
	self:addTradeFlags(RecipeDB,55907,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Belt -- 55908
	-- Item Stats: 
	-- Item Stats: val30id3val26id5val95id6val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55908,360,41522,2,3908)
	self:addTradeFlags(RecipeDB,55908,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Mystic Frostwoven Shoulders -- 55910
	-- Item Stats: 
	-- Item Stats: val36id5val165id6val33id44val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55910,375,41523,3,3908)
	self:addTradeFlags(RecipeDB,55910,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Mystic Frostwoven Robe -- 55911
	-- Item Stats: 
	-- Item Stats: val62id5val227id6val60id44val71id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55911,380,41525,3,3908)
	self:addTradeFlags(RecipeDB,55911,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Mystic Frostwoven Wristwraps -- 55913
	-- Item Stats: 
	-- Item Stats: val27id5val96id6val24id44val32id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55913,375,41528,3,3908)
	self:addTradeFlags(RecipeDB,55913,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Duskweave Belt -- 55914
	-- Item Stats: 
	-- Item Stats: val30id4val106id6val23id46val49id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55914,390,41543,2,3908)
	self:addTradeFlags(RecipeDB,55914,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Duskweave Cowl -- 55919
	-- Item Stats: 
	-- Item Stats: val41id4val153id6val32id46val66id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55919,395,41546,2,3908)
	self:addTradeFlags(RecipeDB,55919,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Duskweave Wristwraps -- 55920
	-- Item Stats: 
	-- Item Stats: val24id4val84id6val18id46val37id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55920,400,41551,2,3908)
	self:addTradeFlags(RecipeDB,55920,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Duskweave Robe -- 55921
	-- Item Stats: 
	-- Item Stats: val42id4val193id6val33id46val68id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55921,405,41549,2,3908)
	self:addTradeFlags(RecipeDB,55921,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Duskweave Gloves -- 55922
	-- Item Stats: 
	-- Item Stats: val31id4val120id6val24id46val50id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55922,405,41545,2,3908)
	self:addTradeFlags(RecipeDB,55922,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Duskweave Shoulders -- 55923
	-- Item Stats: 
	-- Item Stats: val43id4val148id6val35id46val70id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55923,410,41550,2,3908)
	self:addTradeFlags(RecipeDB,55923,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Black Duskweave Leggings -- 55925
	-- Item Stats: 
	-- Item Stats: val60id3val50id4val245id6val69id46val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55925,415,41553,3,3908)
	self:addTradeFlags(RecipeDB,55925,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Black Duskweave Robe -- 55941
	-- Item Stats: 
	-- Item Stats: val67id3val46id4val280id6val70id46val80id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55941,420,41554,3,3908)
	self:addTradeFlags(RecipeDB,55941,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Black Duskweave Wristwraps -- 55943
	-- Item Stats: 
	-- Item Stats: val33id3val27id4val123id6val38id46val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55943,415,41555,3,3908)
	self:addTradeFlags(RecipeDB,55943,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Red Lumberjack Shirt -- 55993
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55993,400,41248,2,3908)
	self:addTradeFlags(RecipeDB,55993,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55993,7,2)

	-- Blue Lumberjack Shirt -- 55994
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55994,400,41249,2,3908)
	self:addTradeFlags(RecipeDB,55994,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55994,7,2)

	-- Yellow Lumberjack Shirt -- 55995
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55995,390,41251,1, 3908)
	self:addTradeFlags(RecipeDB,55995,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Green Lumberjack Shirt -- 55996
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55996,400,41250,2,3908)
	self:addTradeFlags(RecipeDB,55996,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55996,7,2)

	-- Red Workman's Shirt -- 55997
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55997,400,41252,2,3908)
	self:addTradeFlags(RecipeDB,55997,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55997,7,2)

	-- Blue Workman's Shirt -- 55998
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55998,400,41253,2,3908)
	self:addTradeFlags(RecipeDB,55998,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55998,7,2)

	-- Rustic Workman's Shirt -- 55999
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55999,400,41254,2,3908)
	self:addTradeFlags(RecipeDB,55999,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55999,7,2)

	-- Green Workman's Shirt -- 56000
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56000,390,41255,1, 3908)
	self:addTradeFlags(RecipeDB,56000,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Moonshroud -- 56001
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56001,415,41594,3,3908)
	self:addTradeFlags(RecipeDB,56001,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ebonweave -- 56002
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56002,415,41593,3,3908)
	self:addTradeFlags(RecipeDB,56002,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Spellweave -- 56003
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56003,415,41595,3,3908)
	self:addTradeFlags(RecipeDB,56003,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Abyssal Bag -- 56004
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56004,435,41597,1,3908)
	self:addTradeFlags(RecipeDB,56004,1,2,4,29,36,41,117)
	self:addTradeAcquire(RecipeDB,56004,6,1098,3,32538)

	-- Glacial Bag -- 56005
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56005,445,41600,1,3908)
	self:addTradeFlags(RecipeDB,56005,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,119)
	self:addTradeAcquire(RecipeDB,56005,6,1119,4,32540)

	-- Mysterious Bag -- 56006
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56006,440,41598,1,3908)
	self:addTradeFlags(RecipeDB,56006,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,122)
	self:addTradeAcquire(RecipeDB,56006,6,1091,3,32533)

	-- Frostweave Bag -- 56007
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56007,410,41599,2,3908)
	self:addTradeFlags(RecipeDB,56007,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shining Spellthread -- 56008
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56008,390,41601,3,3908)
	self:addTradeFlags(RecipeDB,56008,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Brilliant Spellthread -- 56009
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56009,430,41602,1,3908)
	self:addTradeFlags(RecipeDB,56009,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,115)
	self:addTradeAcquire(RecipeDB,56009,6,1106,4,30431)

	-- Azure Spellthread -- 56010
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56010,390,41603,3,3908)
	self:addTradeFlags(RecipeDB,56010,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sapphire Spellthread -- 56011
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56011,430,41604,1,3908)
	self:addTradeFlags(RecipeDB,56011,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,118)
	self:addTradeAcquire(RecipeDB,56011,6,1090,4,32287)

	-- Cloak of the Moon -- 56014
	-- Item Stats: 
	-- Item Stats: val27id4val113id6val11id47val35id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56014,385,41607,2,3908)
	self:addTradeFlags(RecipeDB,56014,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Cloak of Frozen Spirits -- 56015
	-- Item Stats: 
	-- Item Stats: val28id4val117id6val27id46val35id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56015,390,41608,1, 3908)
	self:addTradeFlags(RecipeDB,56015,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Wispcloak -- 56016
	-- Item Stats: 
	-- Item Stats: val43id3val36id4val150id6val20id47val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56016,415,41609,1, 3908)
	self:addTradeFlags(RecipeDB,56016,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Deathchill Cloak -- 56017
	-- Item Stats: 
	-- Item Stats: val150id6val43id44val53id46val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56017,415,41610,1, 3908)
	self:addTradeFlags(RecipeDB,56017,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Hat of Wintry Doom -- 56018
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val228id6val44id45val53id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56018,425,41984,1, 3908)
	self:addTradeFlags(RecipeDB,56018,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Silky Iceshard Boots -- 56019
	-- Item Stats: 
	-- Item Stats: val76id3val193id6val37id44val29id46val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56019,410,41985,1, 3908)
	self:addTradeFlags(RecipeDB,56019,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Deep Frozen Cord -- 56020
	-- Item Stats: 
	-- Item Stats: val43id3val50id4val158id6val36id44val61id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56020,410,41986,1, 3908)
	self:addTradeFlags(RecipeDB,56020,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostmoon Pants -- 56021
	-- Item Stats: 
	-- Item Stats: val60id3val50id4val68id5val245id6val61id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56021,425,42093,1, 3908)
	self:addTradeFlags(RecipeDB,56021,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Light Blessed Mittens -- 56022
	-- Item Stats: 
	-- Item Stats: val43id3val37id4val52id5val175id6val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56022,410,42095,1, 3908)
	self:addTradeFlags(RecipeDB,56022,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Aurora Slippers -- 56023
	-- Item Stats: 
	-- Item Stats: val37id3val40id4val51id5val193id6val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56023,410,42096,1, 3908)
	self:addTradeFlags(RecipeDB,56023,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Moonshroud Robe -- 56024
	-- Item Stats: 
	-- Item Stats: val67id3val68id4val89id5val300id6val105id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56024,440,42100,4,3908)
	self:addTradeFlags(RecipeDB,56024,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Moonshroud Gloves -- 56025
	-- Item Stats: 
	-- Item Stats: val49id3val51id4val67id5val188id6val76id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56025,435,42103,1, 3908)
	self:addTradeFlags(RecipeDB,56025,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Ebonweave Robe -- 56026
	-- Item Stats: 
	-- Item Stats: val67id3val89id4val300id6val68id45val105id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56026,440,42101,1, 3908)
	self:addTradeFlags(RecipeDB,56026,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Ebonweave Gloves -- 56027
	-- Item Stats: 
	-- Item Stats: val49id3val66id4val188id6val51id45val77id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56027,435,42111,1, 3908)
	self:addTradeFlags(RecipeDB,56027,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Spellweave Robe -- 56028
	-- Item Stats: 
	-- Item Stats: val64id4val52id5val300id6val90id46val104id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56028,440,42102,1, 3908)
	self:addTradeFlags(RecipeDB,56028,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Spellweave Gloves -- 56029
	-- Item Stats: 
	-- Item Stats: val48id4val39id5val188id6val65id46val77id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56029,435,42113,1, 3908)
	self:addTradeFlags(RecipeDB,56029,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Leggings -- 56030
	-- Item Stats: 
	-- Item Stats: val43id3val36id5val152id6val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56030,370,41519,2,3908)
	self:addTradeFlags(RecipeDB,56030,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostwoven Wristwraps -- 56031
	-- Item Stats: 
	-- Item Stats: val22id3val19id5val72id6val30id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56031,340,41512,2,3908)
	self:addTradeFlags(RecipeDB,56031,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Master's Spellthread -- 56034
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56034,400,nil, 1, 3908)
	self:addTradeFlags(RecipeDB,56034,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sanctified Spellthread -- 56039
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56039,400,nil, 1, 3908)
	self:addTradeFlags(RecipeDB,56039,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Duskweave Boots -- 56048
	-- Item Stats: 
	-- Item Stats: val32id4val136id6val25id46val53id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56048,380,41544,1, 3908)
	self:addTradeFlags(RecipeDB,56048,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Belt -- 59582
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val158id6val34id29val34id44val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59582,405,43969,1, 3908)
	self:addTradeFlags(RecipeDB,59582,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Bracers -- 59583
	-- Item Stats: 
	-- Item Stats: val39id3val26id4val123id6val26id29val25id44val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59583,405,43974,1, 3908)
	self:addTradeFlags(RecipeDB,59583,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Shoulders -- 59584
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val210id6val34id29val34id44val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59584,410,43973,1, 3908)
	self:addTradeFlags(RecipeDB,59584,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Boots -- 59585
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val193id6val34id29val34id44val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59585,410,43970,1, 3908)
	self:addTradeFlags(RecipeDB,59585,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Gloves -- 59586
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val175id6val34id29val34id44val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59586,410,41516,2,3908)
	self:addTradeFlags(RecipeDB,59586,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Robe -- 59587
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val280id6val46id29val46id44val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59587,410,43972,1, 3908)
	self:addTradeFlags(RecipeDB,59587,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Leggings -- 59588
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val245id6val46id29val46id44val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59588,410,43975,1, 3908)
	self:addTradeFlags(RecipeDB,59588,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Frostsavage Cowl -- 59589
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val228id6val46id29val46id44val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59589,410,43971,1, 3908)
	self:addTradeFlags(RecipeDB,59589,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Flying Carpet -- 60969
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60969,410,44554,3,3908,34090)	self:addTradeFlags(RecipeDB,60969,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Magnificent Flying Carpet -- 60971
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60971,425,44558,4,3908,34091)	self:addTradeFlags(RecipeDB,60971,3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Glacial Waistband -- 60990
	-- Item Stats: 
	-- Item Stats: val130id3val173id6val85id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60990,410,43584,1, 3908)
	self:addTradeFlags(RecipeDB,60990,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Glacial Robe -- 60993
	-- Item Stats: 
	-- Item Stats: val169id3val308id6val115id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60993,415,43583,4,3908)
	self:addTradeFlags(RecipeDB,60993,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Glacial Slippers -- 60994
	-- Item Stats: 
	-- Item Stats: val129id3val212id6val86id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60994,410,43585,1, 3908)
	self:addTradeFlags(RecipeDB,60994,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information


	return recipecount

end
