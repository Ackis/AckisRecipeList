--[[

************************************************************************

ARL-Tailor.lua

Tailoring data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
325 found from data mining.
0 ignored.
0 WotLK ignored.

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

function addon:InitTailoring(RecipeDB)

	local recipecount = 0

	-- Brown Linen Vest -- 2385
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2385, 20, 2568, 1, 3908)
	self:addTradeFlags(RecipeDB, 2385, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 2385, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Linen Boots -- 2386
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2386, 55, 2569, 1, 3908)
	self:addTradeFlags(RecipeDB, 2386, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 2386, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Linen Cloak -- 2387
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val6id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2387, 10, 2570, 1, 3908)
	self:addTradeFlags(RecipeDB, 2387, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Red Linen Robe -- 2389
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val1id4val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2389, 30, 2572, 2, 3908)
	self:addTradeFlags(RecipeDB, 2389, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 2389, 7, 2)

	-- Red Linen Shirt -- 2392
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2392, 30, 2575, 1, 3908)
	self:addTradeFlags(RecipeDB, 2392, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2392, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- White Linen Shirt -- 2393
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2393, 10, 2576, 1, 3908)
	self:addTradeFlags(RecipeDB, 2393, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2393, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Blue Linen Shirt -- 2394
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2394, 30, 2577, 1, 3908)
	self:addTradeFlags(RecipeDB, 2394, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2394, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Barbaric Linen Vest -- 2395
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id3val2id5val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2395, 60, 2578, 1, 3908)
	self:addTradeFlags(RecipeDB, 2395, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 2395, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Green Linen Shirt -- 2396
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2396, 60, 2579, 1, 3908)
	self:addTradeFlags(RecipeDB, 2396, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2396, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Reinforced Linen Cape -- 2397
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val11id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2397, 50, 2580, 1, 3908)
	self:addTradeFlags(RecipeDB, 2397, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2397, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Green Woolen Vest -- 2399
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2399, 75, 2582, 1, 3908)
	self:addTradeFlags(RecipeDB, 2399, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 2399, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Woolen Boots -- 2401
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val2id4val2id5val22id6val2id19val2id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2401, 85, 2583, 1, 3908)
	self:addTradeFlags(RecipeDB, 2401, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 2401, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Woolen Cape -- 2402
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val14id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2402, 65, 2584, 1, 3908)
	self:addTradeFlags(RecipeDB, 2402, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2402, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Gray Woolen Robe -- 2403
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val4id3val5id4val35id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2403, 95, 2585, 2, 3908)
	self:addTradeFlags(RecipeDB, 2403, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 2403, 7, 2)

	-- Gray Woolen Shirt -- 2406
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2406, 90, 2587, 1, 3908)
	self:addTradeFlags(RecipeDB, 2406, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2406, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Bolt of Linen Cloth -- 2963
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2963, 1, 2996, 1, 3908)
	self:addTradeFlags(RecipeDB, 2963, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bolt of Woolen Cloth -- 2964
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2964, 75, 2997, 1, 3908)
	self:addTradeFlags(RecipeDB, 2964, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2964, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Linen Bag -- 3755
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3755, 35, 4238, 1, 3908)
	self:addTradeFlags(RecipeDB, 3755, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3755, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Woolen Bag -- 3757
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3757, 70, 4240, 1, 3908)
	self:addTradeFlags(RecipeDB, 3757, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3757, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Green Woolen Bag -- 3758
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3758, 85, 4241, 2, 3908)
	self:addTradeFlags(RecipeDB, 3758, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3758, 7, 2)

	-- Small Silk Pack -- 3813
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3813, 140, 4245, 1, 3908)
	self:addTradeFlags(RecipeDB, 3813, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3813, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Bolt of Silk Cloth -- 3839
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3839, 125, 4305, 1, 3908)
	self:addTradeFlags(RecipeDB, 3839, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3839, 1, 1346, 1, 3004, 1, 3363, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Heavy Linen Gloves -- 3840
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3840, 25, 4307, 1, 3908)
	self:addTradeFlags(RecipeDB, 3840, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3840, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Green Linen Bracers -- 3841
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3841, 50, 4308, 1, 3908)
	self:addTradeFlags(RecipeDB, 3841, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3841, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Handstitched Linen Britches -- 3842
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3842, 60, 4309, 1, 3908)
	self:addTradeFlags(RecipeDB, 3842, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3842, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Heavy Woolen Gloves -- 3843
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3843, 75, 4310, 1, 3908)
	self:addTradeFlags(RecipeDB, 3843, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3843, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Heavy Woolen Cloak -- 3844
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val4id5val17id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3844, 90, 4311, 2, 3908)
	self:addTradeFlags(RecipeDB, 3844, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 3844, 7, 2)

	-- Soft-soled Linen Boots -- 3845
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id3val2id4val20id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3845, 70, 4312, 1, 3908)
	self:addTradeFlags(RecipeDB, 3845, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3845, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Red Woolen Boots -- 3847
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3847, 85, 4313, 2, 3908)
	self:addTradeFlags(RecipeDB, 3847, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3847, 7, 2)

	-- Double-stitched Woolen Shoulders -- 3848
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3848, 100, 4314, 1, 3908)
	self:addTradeFlags(RecipeDB, 3848, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3848, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Reinforced Woolen Shoulders -- 3849
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val27id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3849, 110, 4315, 2, 3908)
	self:addTradeFlags(RecipeDB, 3849, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3849, 7, 2)

	-- Heavy Woolen Pants -- 3850
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val3id4val6id5val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3850, 100, 4316, 1, 3908)
	self:addTradeFlags(RecipeDB, 3850, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3850, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Phoenix Pants -- 3851
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val4id4val34id6val10id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3851, 115, 4317, 2, 3908)
	self:addTradeFlags(RecipeDB, 3851, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3851, 7, 2)

	-- Gloves of Meditation -- 3852
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val7id5val25id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3852, 120, 4318, 1, 3908)
	self:addTradeFlags(RecipeDB, 3852, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3852, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Azure Silk Gloves -- 3854
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val3id5val26id6val10id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3854, 135, 4319, 1, 3908)
	self:addTradeFlags(RecipeDB, 3854, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3854, 2, 2679, 2, 9636)

	-- Spidersilk Boots -- 3855
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val4id3val4id4val7id5val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3855, 115, 4320, 1, 3908)
	self:addTradeFlags(RecipeDB, 3855, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3855, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Spider Silk Slippers -- 3856
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val7id5val29id6val4id19val4id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3856, 130, 4321, 2, 3908)
	self:addTradeFlags(RecipeDB, 3856, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 3856, 7, 2)

	-- Enchanter's Cowl -- 3857
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id4val6id5val37id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3857, 155, 4322, 1, 3908)
	self:addTradeFlags(RecipeDB, 3857, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3857, 2, 2670)

	-- Shadow Hood -- 3858
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id4val37id6val7id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3858, 160, 4323, 2, 3908)
	self:addTradeFlags(RecipeDB, 3858, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3858, 7, 2)

	-- Azure Silk Vest -- 3859
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id4val43id6val7id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3859, 140, 4324, 1, 3908)
	self:addTradeFlags(RecipeDB, 3859, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3859, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Boots of the Enchanter -- 3860
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id4val8id5val32id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3860, 165, 4325, 2, 3908)
	self:addTradeFlags(RecipeDB, 3860, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3860, 7, 2)

	-- Long Silken Cloak -- 3861
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val5id4val6id5val24id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3861, 175, 4326, 1, 3908)
	self:addTradeFlags(RecipeDB, 3861, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 3861, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Icy Cloak -- 3862
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val6id5val29id6val11id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3862, 190, 4327, 1, 3908)
	self:addTradeFlags(RecipeDB, 3862, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 3862, 2, 2381, 2, 6567)

	-- Spider Belt -- 3863
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val27id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3863, 170, 4328, 2, 3908)
	self:addTradeFlags(RecipeDB, 3863, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3863, 7, 2)

	-- Star Belt -- 3864
	-- Instance: 1176 - type1category3maxlevel47territory1minlevel43nameZul'Farrakid1176
	-- Instance: 796 - type1category3maxlevel45territory4minlevel34nameScarlet Monasteryid796
	-- Instance: 1337 - type1category3maxlevel47territory1minlevel39nameUldamanid1337
	-- Instance: 1337 - type1category3maxlevel47territory1minlevel39nameUldamanid1337
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id5val30id6val13id19val13id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3864, 190, 4329, 2, 3908)
	self:addTradeFlags(RecipeDB, 3864, 5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 3864, 3, 2892, 3, 4299, 3, 4357, 3, 4684, 3, 4861, 3, 5249, 3, 7269)

	-- Bolt of Mageweave -- 3865
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3865, 175, 4339, 1, 3908)
	self:addTradeFlags(RecipeDB, 3865, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3865, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Stylish Red Shirt -- 3866
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3866, 100, 4330, 1, 3908)
	self:addTradeFlags(RecipeDB, 3866, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3866, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Phoenix Gloves -- 3868
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val24id6val9id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3868, 115, 4331, 2, 3908)
	self:addTradeFlags(RecipeDB, 3868, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3868, 7, 2)

	-- Bright Yellow Shirt -- 3869
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3869, 135, 4332, 1, 3908)
	self:addTradeFlags(RecipeDB, 3869, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3869, 2, 2668)

	-- Dark Silk Shirt -- 3870
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3870, 155, 4333, 1, 3908)
	self:addTradeFlags(RecipeDB, 3870, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3870, 2, 2394, 2, 2669)

	-- Formal White Shirt -- 3871
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3871, 170, 4334, 1, 3908)
	self:addTradeFlags(RecipeDB, 3871, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3871, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Rich Purple Silk Shirt -- 3872
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3872, 185, 4335, 3, 3908)
	self:addTradeFlags(RecipeDB, 3872, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3872, 7, 3)

	-- Black Swashbuckler's Shirt -- 3873
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3873, 200, 4336, 1, 3908)
	self:addTradeFlags(RecipeDB, 3873, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3873, 2, 2663)

	-- Brown Linen Pants -- 3914
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3914, 20, 4343, 1, 3908)
	self:addTradeFlags(RecipeDB, 3914, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3914, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Brown Linen Shirt -- 3915
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3915, 10, 4344, 1, 3908)
	self:addTradeFlags(RecipeDB, 3915, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Pearl-clasped Cloak -- 6521
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val3id4val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6521, 80, 5542, 1, 3908)
	self:addTradeFlags(RecipeDB, 6521, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 6521, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Red Linen Bag -- 6686
	-- Instance: 1581 - type1category3maxlevel20territory2minlevel15nameThe Deadminesid1581
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6686, 60, 5762, 1, 3908)
	self:addTradeFlags(RecipeDB, 6686, 1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6686, 3, 157, 3, 590, 3, 3530, 3, 3531, 2, 843, 2, 3005, 2, 3556, 2, 4189, 2, 16224)

	-- Red Woolen Bag -- 6688
	-- Mob Drop
	-- Instance: 2367 - type5category3maxlevel68territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6688, 105, 5763, 1, 3908)
	self:addTradeFlags(RecipeDB, 6688, 1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6688, 3, 450, 3, 2264, 2, 777, 2, 1454, 2, 1474, 2, 3005, 2, 3364, 2, 3485, 2, 3537, 2, 3683, 2, 4189, 2, 4577, 2, 5944)

	-- Lesser Wizard's Robe -- 6690
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val5id5val41id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6690, 125, 5766, 1, 3908)
	self:addTradeFlags(RecipeDB, 6690, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 6690, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Robes of Arcana -- 6692
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val7id5val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6692, 140, 5770, 2, 3908)
	self:addTradeFlags(RecipeDB, 6692, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 6692, 3, 910, 3, 2337, 3, 10760)

	-- Green Silk Pack -- 6693
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6693, 165, 5764, 2, 3908)
	self:addTradeFlags(RecipeDB, 6693, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6693, 7, 2)

	-- Black Silk Pack -- 6695
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6695, 175, 5765, 2, 3908)
	self:addTradeFlags(RecipeDB, 6695, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6695, 3, 2242, 3, 2434, 3, 4834)

	-- Brown Linen Robe -- 7623
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val1id5val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7623, 20, 6238, 1, 3908)
	self:addTradeFlags(RecipeDB, 7623, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 7623, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- White Linen Robe -- 7624
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val1id4val19id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7624, 20, 6241, 1, 3908)
	self:addTradeFlags(RecipeDB, 7624, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 7624, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Red Linen Vest -- 7629
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7629, 45, 6239, 2, 3908)
	self:addTradeFlags(RecipeDB, 7629, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 7629, 7, 2)

	-- Blue Linen Vest -- 7630
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id5val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7630, 45, 6240, 1, 3908)
	self:addTradeFlags(RecipeDB, 7630, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 7630, 2, 66, 2, 3364, 2, 3485, 2, 3522, 2, 4189)

	-- Blue Linen Robe -- 7633
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val3id5val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7633, 60, 6242, 1, 3908)
	self:addTradeFlags(RecipeDB, 7633, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 7633, 2, 1250, 2, 3485, 2, 3499, 2, 3556, 2, 4168)

	-- Green Woolen Robe -- 7636
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val2id3val3id4val3id5val32id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7636, 80, 6243, 2, 3908)
	self:addTradeFlags(RecipeDB, 7636, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Blue Overalls -- 7639
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id3val34id6val5id19val5id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7639, 90, 6263, 1, 3908)
	self:addTradeFlags(RecipeDB, 7639, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 7639, 2, 843, 2, 1347, 2, 2394, 2, 3364, 2, 5944)

	-- Greater Adept's Robe -- 7643
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val1id3val2id4val7id5val37id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7643, 105, 6264, 1, 3908)
	self:addTradeFlags(RecipeDB, 7643, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 7643, 2, 1454, 2, 1474, 2, 2669, 2, 3499, 2, 4168, 2, 4577)

	-- Stylish Blue Shirt -- 7892
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7892, 110, 6384, 2, 3908)
	self:addTradeFlags(RecipeDB, 7892, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7892, 7, 2)

	-- Stylish Green Shirt -- 7893
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7893, 110, 6385, 2, 3908)
	self:addTradeFlags(RecipeDB, 7893, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7893, 7, 2)

	-- Simple Dress -- 8465
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8465, 30, 6786, 1, 3908)
	self:addTradeFlags(RecipeDB, 8465, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 8465, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- White Woolen Dress -- 8467
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val34id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8467, 100, 6787, 1, 3908)
	self:addTradeFlags(RecipeDB, 8467, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8467, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- White Swashbuckler's Shirt -- 8483
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8483, 160, 6795, 1, 3908)
	self:addTradeFlags(RecipeDB, 8483, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 8483, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Red Swashbuckler's Shirt -- 8489
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8489, 175, 6796, 1, 3908)
	self:addTradeFlags(RecipeDB, 8489, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 8489, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Azure Silk Pants -- 8758
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val6id4val36id6val10id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8758, 130, 7046, 1, 3908)
	self:addTradeFlags(RecipeDB, 8758, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8758, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Azure Silk Hood -- 8760
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val33id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8760, 145, 7048, 1, 3908)
	self:addTradeFlags(RecipeDB, 8760, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8760, 1, 1346, 1, 2399, 1, 2627, 1, 3004, 1, 3363, 1, 3704, 1, 4159, 1, 4576, 1, 5153, 1, 5567, 1, 11049, 1, 11052, 1, 11557, 1, 16640, 1, 16729, 1, 17487, 1, 18749, 1, 18772)

	-- Silk Headband -- 8762
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val34id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8762, 160, 7050, 1, 3908)
	self:addTradeFlags(RecipeDB, 8762, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8762, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Earthen Vest -- 8764
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val6id3val10id5val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8764, 160, 7051, 1, 3908)
	self:addTradeFlags(RecipeDB, 8764, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8764, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Azure Silk Belt -- 8766
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id4val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8766, 165, 7052, 1, 3908)
	self:addTradeFlags(RecipeDB, 8766, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8766, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Robe of Power -- 8770
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val12id4val8id5val55id6val14id19val14id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8770, 180, 7054, 1, 3908)
	self:addTradeFlags(RecipeDB, 8770, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 8770, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Crimson Silk Belt -- 8772
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val7id4val6id5val26id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8772, 165, 7055, 1, 3908)
	self:addTradeFlags(RecipeDB, 8772, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8772, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Green Silken Shoulders -- 8774
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id4val36id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8774, 170, 7057, 1, 3908)
	self:addTradeFlags(RecipeDB, 8774, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8774, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Linen Belt -- 8776
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8776, 15, 7026, 1, 3908)
	self:addTradeFlags(RecipeDB, 8776, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8776, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Boots of Darkness -- 8778
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8778, 130, 7027, 2, 3908)
	self:addTradeFlags(RecipeDB, 8778, 3,28,36,41,47,56)
	-- No acquire information

	-- Hands of Darkness -- 8780
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id5val26id6val9id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8780, 135, 7047, 2, 3908)
	self:addTradeFlags(RecipeDB, 8780, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 8780, 7, 2)

	-- Truefaith Gloves -- 8782
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val3id4val27id6val5id19val15id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8782, 140, 7049, 2, 3908)
	self:addTradeFlags(RecipeDB, 8782, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,56)
	self:addTradeAcquire(RecipeDB, 8782, 7, 2)

	-- Green Silk Armor -- 8784
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val13id4val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8784, 155, 7065, 2, 3908)
	self:addTradeFlags(RecipeDB, 8784, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 8784, 7, 2)

	-- Azure Silk Cloak -- 8786
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val3id5val23id6val10id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8786, 165, 7053, 1, 3908)
	self:addTradeFlags(RecipeDB, 8786, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 8786, 2, 6574, 2, 6576)

	-- Crimson Silk Cloak -- 8789
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val3id3val24id6val7id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8789, 170, 7056, 1, 3908)
	self:addTradeFlags(RecipeDB, 8789, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 8789, 2, 2670)

	-- Crimson Silk Vest -- 8791
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8791, 185, 7058, 1, 3908)
	self:addTradeFlags(RecipeDB, 8791, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8791, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Crimson Silk Shoulders -- 8793
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val7id5val38id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8793, 180, 7059, 2, 3908)
	self:addTradeFlags(RecipeDB, 8793, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 8793, 7, 2)

	-- Azure Shoulders -- 8795
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id3val38id6val13id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8795, 180, 7060, 2, 3908)
	self:addTradeFlags(RecipeDB, 8795, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 8795, 7, 2)

	-- Earthen Silk Belt -- 8797
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id3val8id5val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8797, 185, 7061, 2, 3908)
	self:addTradeFlags(RecipeDB, 8797, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 8797, 7, 2)

	-- Crimson Silk Pantaloons -- 8799
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8799, 195, 7062, 1, 3908)
	self:addTradeFlags(RecipeDB, 8799, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8799, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Crimson Silk Robe -- 8802
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id4val6id5val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8802, 190, 7063, 1, 3908)
	self:addTradeFlags(RecipeDB, 8802, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 8802, 2, 6568)

	-- Crimson Silk Gloves -- 8804
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val6id4val35id6val14id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8804, 195, 7064, 1, 3908)
	self:addTradeFlags(RecipeDB, 8804, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8804, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Simple Linen Pants -- 12044
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12044, 10, 10045, 1, 3908)
	self:addTradeFlags(RecipeDB, 12044, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Simple Linen Boots -- 12045
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12045, 15, 10046, 1, 3908)
	self:addTradeFlags(RecipeDB, 12045, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12045, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Simple Kilt -- 12046
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val23id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12046, 65, 10047, 1, 3908)
	self:addTradeFlags(RecipeDB, 12046, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12046, 1, 1103, 1, 1300, 1, 1346, 1, 1703, 1, 2399, 1, 2627, 1, 2855, 1, 3004, 1, 3363, 1, 3484, 1, 3523, 1, 3704, 1, 4159, 1, 4193, 1, 4576, 1, 5153, 1, 5567, 1, 11048, 1, 11049, 1, 11050, 1, 11051, 1, 11052, 1, 11557, 1, 16366, 1, 16639, 1, 16640, 1, 16729, 1, 16746, 1, 17487, 1, 18749, 1, 18772)

	-- Colorful Kilt -- 12047
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val5id5val33id6val6id19val6id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12047, 110, 10048, 2, 3908)
	self:addTradeFlags(RecipeDB, 12047, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 12047, 7, 2)

	-- Black Mageweave Vest -- 12048
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id4val12id5val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12048, 190, 9998, 1, 3908)
	self:addTradeFlags(RecipeDB, 12048, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12048, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Black Mageweave Leggings -- 12049
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12049, 190, 9999, 1, 3908)
	self:addTradeFlags(RecipeDB, 12049, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12049, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Black Mageweave Robe -- 12050
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12050, 195, 10001, 1, 3908)
	self:addTradeFlags(RecipeDB, 12050, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12050, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Shadoweave Pants -- 12052
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val6id3val48id6val21id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12052, 195, 10002, 1, 3908)
	self:addTradeFlags(RecipeDB, 12052, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12052, 1, 4578, 1, 9584)

	-- Black Mageweave Gloves -- 12053
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val35id6val15id19val15id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12053, 200, 10003, 1, 3908)
	self:addTradeFlags(RecipeDB, 12053, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 12053, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Shadoweave Robe -- 12055
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val7id5val57id6val21id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12055, 200, 10004, 1, 3908)
	self:addTradeFlags(RecipeDB, 12055, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12055, 1, 4578, 1, 9584)

	-- Red Mageweave Vest -- 12056
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val18id4val57id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12056, 200, 10007, 2, 3908)
	self:addTradeFlags(RecipeDB, 12056, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12056, 7, 2)

	-- White Bandit Mask -- 12059
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val11id4val46id6val13id19val13id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12059, 210, 10008, 2, 3908)
	self:addTradeFlags(RecipeDB, 12059, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 12059, 7, 2)

	-- Red Mageweave Pants -- 12060
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val12id4val49id6val14id19val14id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12060, 200, 10009, 2, 3908)
	self:addTradeFlags(RecipeDB, 12060, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 12060, 7, 2)

	-- Orange Mageweave Shirt -- 12061
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12061, 210, 10056, 1, 3908)
	self:addTradeFlags(RecipeDB, 12061, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12061, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Stormcloth Pants -- 12062
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id5val51id6val10id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12062, 205, 10010, 2, 3908)
	self:addTradeFlags(RecipeDB, 12062, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Stormcloth Gloves -- 12063
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val36id6val16id19val16id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12063, 205, 10011, 2, 3908)
	self:addTradeFlags(RecipeDB, 12063, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Orange Martial Shirt -- 12064
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12064, 215, 10052, 1, 3908)
	self:addTradeFlags(RecipeDB, 12064, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 12064, 2, 3005, 2, 4168)

	-- Mageweave Bag -- 12065
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12065, 210, 10050, 1, 3908)
	self:addTradeFlags(RecipeDB, 12065, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12065, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Red Mageweave Gloves -- 12066
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id4val37id6val11id19val11id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12066, 210, 10018, 2, 3908)
	self:addTradeFlags(RecipeDB, 12066, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 12066, 7, 2)

	-- Dreamweave Gloves -- 12067
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id4val7id5val41id6val18id19val18id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12067, 210, 10019, 1, 3908)
	self:addTradeFlags(RecipeDB, 12067, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 12067, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Stormcloth Vest -- 12068
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id3val8id5val59id6val10id19val29id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12068, 210, 10020, 2, 3908)
	self:addTradeFlags(RecipeDB, 12068, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	-- No acquire information

	-- Cindercloth Robe -- 12069
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val59id6val27id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12069, 210, 10042, 1, 3908)
	self:addTradeFlags(RecipeDB, 12069, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12069, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Dreamweave Vest -- 12070
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val9id4val14id5val65id6val18id19val18id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12070, 210, 10021, 1, 3908)
	self:addTradeFlags(RecipeDB, 12070, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 12070, 1, 1346, 1, 2399, 1, 4576, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Shadoweave Gloves -- 12071
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id4val37id6val17id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12071, 210, 10023, 1, 3908)
	self:addTradeFlags(RecipeDB, 12071, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12071, 1, 4578, 1, 9584)

	-- Black Mageweave Headband -- 12072
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val13id5val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12072, 215, 10024, 1, 3908)
	self:addTradeFlags(RecipeDB, 12072, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12072, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Black Mageweave Boots -- 12073
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val7id4val11id5val41id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12073, 215, 10026, 1, 3908)
	self:addTradeFlags(RecipeDB, 12073, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12073, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Black Mageweave Shoulders -- 12074
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id4val10id5val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12074, 215, 10027, 1, 3908)
	self:addTradeFlags(RecipeDB, 12074, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12074, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Lavender Mageweave Shirt -- 12075
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12075, 225, 10054, 1, 3908)
	self:addTradeFlags(RecipeDB, 12075, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 12075, 2, 3364, 2, 8681)

	-- Shadoweave Shoulders -- 12076
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val7id3val46id6val17id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12076, 220, 10028, 1, 3908)
	self:addTradeFlags(RecipeDB, 12076, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12076, 1, 4578, 1, 9584)

	-- Simple Black Dress -- 12077
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12077, 230, 10053, 1, 3908)
	self:addTradeFlags(RecipeDB, 12077, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12077, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Red Mageweave Shoulders -- 12078
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id4val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12078, 220, 10029, 2, 3908)
	self:addTradeFlags(RecipeDB, 12078, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12078, 7, 2)

	-- Red Mageweave Bag -- 12079
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12079, 220, 10051, 1, 3908)
	self:addTradeFlags(RecipeDB, 12079, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12079, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Pink Mageweave Shirt -- 12080
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12080, 230, 10055, 1, 3908)
	self:addTradeFlags(RecipeDB, 12080, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 12080, 2, 3364, 2, 8681)

	-- Admiral's Hat -- 12081
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12081, 225, 10030, 1, 3908)
	self:addTradeFlags(RecipeDB, 12081, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12081, 2, 2672)

	-- Shadoweave Boots -- 12082
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id5val43id6val14id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12082, 225, 10031, 1, 3908)
	self:addTradeFlags(RecipeDB, 12082, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12082, 1, 4578, 1, 9584)

	-- Stormcloth Headband -- 12083
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id4val10id5val51id6val14id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12083, 225, 10032, 2, 3908)
	self:addTradeFlags(RecipeDB, 12083, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Red Mageweave Headband -- 12084
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val20id4val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12084, 225, 10033, 2, 3908)
	self:addTradeFlags(RecipeDB, 12084, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12084, 7, 2)

	-- Tuxedo Shirt -- 12085
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12085, 235, 10034, 1, 3908)
	self:addTradeFlags(RecipeDB, 12085, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 12085, 2, 4577, 2, 8681)

	-- Shadoweave Mask -- 12086
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id4val52id6val24id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12086, 230, 10025, 2, 3908)
	self:addTradeFlags(RecipeDB, 12086, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12086, 4, 3402)

	-- Stormcloth Shoulders -- 12087
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val48id6val21id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12087, 230, 10038, 2, 3908)
	self:addTradeFlags(RecipeDB, 12087, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Cindercloth Boots -- 12088
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val44id6val21id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12088, 230, 10044, 1, 3908)
	self:addTradeFlags(RecipeDB, 12088, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12088, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Tuxedo Pants -- 12089
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val39id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12089, 240, 10035, 1, 3908)
	self:addTradeFlags(RecipeDB, 12089, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12089, 2, 4577, 2, 8681)

	-- Stormcloth Boots -- 12090
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id3val45id6val16id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12090, 235, 10039, 2, 3908)
	self:addTradeFlags(RecipeDB, 12090, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- White Wedding Dress -- 12091
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val44id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12091, 245, 10040, 1, 3908)
	self:addTradeFlags(RecipeDB, 12091, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12091, 2, 1347, 2, 3005)

	-- Dreamweave Circlet -- 12092
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id4val12id5val58id6val21id19val21id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12092, 235, 10041, 1, 3908)
	self:addTradeFlags(RecipeDB, 12092, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 12092, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Tuxedo Jacket -- 12093
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12093, 235, 10036, 1, 3908)
	self:addTradeFlags(RecipeDB, 12093, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12093, 2, 4577, 2, 8681)

	-- Bolt of Runecloth -- 18401
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18401, 250, 14048, 1, 3908)
	self:addTradeFlags(RecipeDB, 18401, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 18401, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Runecloth Belt -- 18402
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val8id5val37id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18402, 240, 13856, 1, 3908)
	self:addTradeFlags(RecipeDB, 18402, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 18402, 1, 2399, 1, 11052, 1, 11557, 1, 18749, 1, 18772)

	-- Frostweave Tunic -- 18403
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id4val66id6val24id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18403, 240, 13869, 2, 3908)
	self:addTradeFlags(RecipeDB, 18403, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18403, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Frostweave Robe -- 18404
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id5val66id6val24id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18404, 240, 13868, 2, 3908)
	self:addTradeFlags(RecipeDB, 18404, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18404, 7, 2)

	-- Runecloth Bag -- 18405
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18405, 245, 14046, 1, 3908)
	self:addTradeFlags(RecipeDB, 18405, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18405, 2, 11189)

	-- Runecloth Robe -- 18406
	-- Trainer
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val17id4val11id5val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18406, 245, 13858, 1, 3908)
	self:addTradeFlags(RecipeDB, 18406, 1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18406, 1, 2399, 1, 11052, 1, 18749, 1, 18772, 2, 7940)

	-- Runecloth Tunic -- 18407
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id4val17id5val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18407, 245, 13857, 2, 3908)
	self:addTradeFlags(RecipeDB, 18407, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18407, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Cindercloth Vest -- 18408
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id5val68id6val24id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18408, 245, 14042, 2, 3908)
	self:addTradeFlags(RecipeDB, 18408, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18408, 3, 5861)

	-- Runecloth Cloak -- 18409
	-- Trainer
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val8id4val9id5val34id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18409, 250, 13860, 1, 3908)
	self:addTradeFlags(RecipeDB, 18409, 1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 18409, 1, 2399, 1, 11052, 1, 18749, 1, 18772, 2, 7940)

	-- Ghostweave Belt -- 18410
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val39id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18410, 250, 14143, 2, 3908)
	self:addTradeFlags(RecipeDB, 18410, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18410, 3, 7864, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Frostweave Gloves -- 18411
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val6id4val43id6val21id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18411, 250, 13870, 2, 3908)
	self:addTradeFlags(RecipeDB, 18411, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18411, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Cindercloth Gloves -- 18412
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id5val44id6val17id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18412, 255, 14043, 2, 3908)
	self:addTradeFlags(RecipeDB, 18412, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18412, 3, 5861)

	-- Ghostweave Gloves -- 18413
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val44id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18413, 255, 14142, 2, 3908)
	self:addTradeFlags(RecipeDB, 18413, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18413, 3, 7864, 3, 8538, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Brightcloth Robe -- 18414
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val70id6val16id35val15id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18414, 255, 14100, 2, 3908)
	self:addTradeFlags(RecipeDB, 18414, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18414, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Brightcloth Gloves -- 18415
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val44id6val12id35val11id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18415, 255, 14101, 2, 3908)
	self:addTradeFlags(RecipeDB, 18415, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18415, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Ghostweave Vest -- 18416
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id4val71id6val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18416, 260, 14141, 2, 3908)
	self:addTradeFlags(RecipeDB, 18416, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18416, 3, 8538, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Runecloth Gloves -- 18417
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val9id4val9id5val45id6val12id19val12id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18417, 260, 13863, 1, 3908)
	self:addTradeFlags(RecipeDB, 18417, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 18417, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Cindercloth Cloak -- 18418
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val8id4val36id6val13id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18418, 260, 14044, 2, 3908)
	self:addTradeFlags(RecipeDB, 18418, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 18418, 3, 7037)

	-- Felcloth Pants -- 18419
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val62id6val26id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18419, 260, 14107, 1, 3908)
	self:addTradeFlags(RecipeDB, 18419, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18419, 2, 12022)

	-- Brightcloth Cloak -- 18420
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val36id6val10id19val7id35val7id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18420, 260, 14103, 2, 3908)
	self:addTradeFlags(RecipeDB, 18420, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 18420, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Wizardweave Leggings -- 18421
	-- Trainer
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val62id6val16id32val16id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18421, 260, 14132, 2, 3908)
	self:addTradeFlags(RecipeDB, 18421, 1,2,3,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18421, 3, 8551, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Cloak of Fire -- 18422
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val7id3val39id6val6id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18422, 260, 14134, 3, 3908)
	self:addTradeFlags(RecipeDB, 18422, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 18422, 3, 9026)

	-- Runecloth Boots -- 18423
	-- Trainer
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id4val14id5val50id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18423, 265, 13864, 1, 3908)
	self:addTradeFlags(RecipeDB, 18423, 1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18423, 1, 2399, 1, 11052, 1, 18749, 1, 18772, 2, 7940)

	-- Frostweave Pants -- 18424
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id5val63id6val26id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18424, 265, 13871, 2, 3908)
	self:addTradeFlags(RecipeDB, 18424, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18424, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Cindercloth Pants -- 18434
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val63id6val26id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18434, 265, 14045, 2, 3908)
	self:addTradeFlags(RecipeDB, 18434, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18434, 3, 7037)

	-- Robe of Winter Night -- 18436
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val81id6val80id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18436, 270, 14136, 3, 3908)
	self:addTradeFlags(RecipeDB, 18436, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 18436, 3, 7437)

	-- Felcloth Boots -- 18437
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id5val51id6val17id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18437, 270, 14108, 2, 3908)
	self:addTradeFlags(RecipeDB, 18437, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18437, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Runecloth Pants -- 18438
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val20id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18438, 270, 13865, 2, 3908)
	self:addTradeFlags(RecipeDB, 18438, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18438, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Brightcloth Pants -- 18439
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val66id6val17id35val16id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18439, 275, 14104, 2, 3908)
	self:addTradeFlags(RecipeDB, 18439, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18439, 7, 2)

	-- Mooncloth Leggings -- 18440
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id3val14id4val21id5val72id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18440, 275, 14137, 3, 3908)
	self:addTradeFlags(RecipeDB, 18440, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18440, 7, 3)

	-- Ghostweave Pants -- 18441
	-- Trainer
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val66id6val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18441, 275, 14144, 2, 3908)
	self:addTradeFlags(RecipeDB, 18441, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18441, 3, 10384, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Felcloth Hood -- 18442
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id4val61id6val30id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18442, 275, 14111, 2, 3908)
	self:addTradeFlags(RecipeDB, 18442, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18442, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Runecloth Headband -- 18444
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val20id4val13id5val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18444, 280, 13866, 2, 3908)
	self:addTradeFlags(RecipeDB, 18444, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18444, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Mooncloth Bag -- 18445
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18445, 285, 14155, 2, 3908)
	self:addTradeFlags(RecipeDB, 18445, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18445, 7, 2)

	-- Wizardweave Robe -- 18446
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val77id6val17id32val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18446, 285, 14128, 2, 3908)
	self:addTradeFlags(RecipeDB, 18446, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18446, 3, 8526, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Mooncloth Vest -- 18447
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id3val20id4val19id5val85id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18447, 285, 14138, 3, 3908)
	self:addTradeFlags(RecipeDB, 18447, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18447, 7, 3)

	-- Mooncloth Shoulders -- 18448
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id3val17id4val11id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18448, 285, 14139, 3, 3908)
	self:addTradeFlags(RecipeDB, 18448, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18448, 7, 3)

	-- Runecloth Shoulders -- 18449
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id4val10id5val59id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18449, 285, 13867, 2, 3908)
	self:addTradeFlags(RecipeDB, 18449, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18449, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Wizardweave Turban -- 18450
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val64id6val18id32val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18450, 285, 14130, 2, 3908)
	self:addTradeFlags(RecipeDB, 18450, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18450, 3, 8526, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Felcloth Robe -- 18451
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val7id3val79id6val36id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18451, 285, 14106, 2, 3908)
	self:addTradeFlags(RecipeDB, 18451, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18451, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Mooncloth Circlet -- 18452
	-- Raid: 2677 - Blackwing Lair
	-- Raid: 2159 - Onyxia's Lair
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val13id3val23id4val15id5val71id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18452, 285, 14140, 3, 3908)
	self:addTradeFlags(RecipeDB, 18452, 6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18452, 3, 6109, 3, 10184, 3, 11583, 3, 14888, 3, 14889, 3, 14890, 3, 19349)

	-- Felcloth Shoulders -- 18453
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id5val60id6val26id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18453, 285, 14112, 2, 3908)
	self:addTradeFlags(RecipeDB, 18453, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18453, 7, 2, 1, 2399, 1, 11052, 1, 18749, 1, 18772)

	-- Gloves of Spell Mastery -- 18454
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Raid: 3429 - Ruins of Ahn'Qiraj
	-- Raid: 2717 - Molten Core
	-- Raid: 2159 - Onyxia's Lair
	-- Mob Drop
	-- Flags: Priest, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id4val8id5val68id6val28id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18454, 285, 14146, 4, 3908)
	self:addTradeFlags(RecipeDB, 18454, 5,6,11,26,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 18454, 3, 6109, 3, 10184, 3, 10318, 3, 12101, 3, 14888, 3, 14889, 3, 14890, 3, 15325)

	-- Bottomless Bag -- 18455
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Raid: 1977 - Zul'Gurub
	-- Raid: 3429 - Ruins of Ahn'Qiraj
	-- Raid: 2717 - Molten Core
	-- Raid: 2159 - Onyxia's Lair
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18455, 285, 14156, 3, 3908)
	self:addTradeFlags(RecipeDB, 18455, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18455, 3, 6109, 3, 8724, 3, 10184, 3, 10372, 3, 10440, 3, 11356, 3, 11658, 3, 15323)

	-- Truefaith Vestments -- 18456
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: Priest, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val14id3val109id6val25id19val73id20val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18456, 285, 14154, 4, 3908)
	self:addTradeFlags(RecipeDB, 18456, 5,26,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 18456, 3, 10813)

	-- Robe of the Archmage -- 18457
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: Mage, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val12id4val109id6val40id19val40id20val14id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18457, 285, 14152, 4, 3908)
	self:addTradeFlags(RecipeDB, 18457, 5,24,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 18457, 3, 9264)

	-- Robe of the Void -- 18458
	-- Instance: 2057 - type1category3maxlevel60territory1minlevel58nameScholomanceid2057
	-- Mob Drop
	-- Flags: Warlock, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val14id3val109id6val46id19val46id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18458, 285, 14153, 4, 3908)
	self:addTradeFlags(RecipeDB, 18458, 5,29,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 18458, 3, 1853)

	-- Mooncloth -- 18560
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 18560, 260, 14342, 1, 3908)
	self:addTradeFlags(RecipeDB, 18560, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 18560, 2, 11189)

	-- Mooncloth Boots -- 19435
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val11id3val14id4val13id5val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19435, 265, 15802, 3, 3908)
	self:addTradeFlags(RecipeDB, 19435, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Flarecore Mantle -- 20848
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id3val10id4val10id5val81id6val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20848, 285, 16980, 1, 3908)
	self:addTradeFlags(RecipeDB, 20848, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 20848, 2, 12944)

	-- Flarecore Gloves -- 20849
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: Priest, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id3val14id4val68id6val25id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20849, 285, 16979, 1, 3908)
	self:addTradeFlags(RecipeDB, 20849, 1,2,4,5,26,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 20849, 2, 12944)

	-- Green Holiday Shirt -- 21945
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21945, 190, 17723, 1, 3908)
	self:addTradeFlags(RecipeDB, 21945, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 21945, 5, 1)

	-- Flarecore Wraps -- 22759
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id4val49id6val9id24val7id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22759, 290, 18263, 3, 3908)
	self:addTradeFlags(RecipeDB, 22759, 6,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 22759, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Gordok Ogre Suit -- 22813
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22813, 275, 18258, 2, 3908)
	self:addTradeFlags(RecipeDB, 22813, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Belt of the Archmage -- 22866
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id3val25id4val62id6val14id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22866, 285, 18405, 4, 3908)
	self:addTradeFlags(RecipeDB, 22866, 21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Felcloth Gloves -- 22867
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id3val55id6val33id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22867, 285, 18407, 3, 3908)
	self:addTradeFlags(RecipeDB, 22867, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 22867, 3, 14338)

	-- Inferno Gloves -- 22868
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id4val55id6val33id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22868, 285, 18408, 3, 3908)
	self:addTradeFlags(RecipeDB, 22868, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 22868, 3, 14338)

	-- Mooncloth Gloves -- 22869
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id3val16id4val15id5val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22869, 285, 18409, 3, 3908)
	self:addTradeFlags(RecipeDB, 22869, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 22869, 3, 14338)

	-- Cloak of Warding -- 22870
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: Tanking, 
	-- Item Stats: val214id6val7id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22870, 285, 18413, 3, 3908)
	self:addTradeFlags(RecipeDB, 22870, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,52,60)
	self:addTradeAcquire(RecipeDB, 22870, 3, 14338)

	-- Mooncloth Robe -- 22902
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id3val25id4val12id5val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22902, 285, 18486, 1, 3908)
	self:addTradeFlags(RecipeDB, 22902, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 22902, 2, 14371)

	-- Wisdom of the Timbermaw -- 23662
	-- Timbermaw Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val21id4val46id6val4id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23662, 275, 19047, 1, 3908)
	self:addTradeFlags(RecipeDB, 23662, 4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,99)
	self:addTradeAcquire(RecipeDB, 23662, 6, 576, 2, 11557)

	-- Mantle of the Timbermaw -- 23663
	-- Timbermaw Hold - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val21id4val68id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23663, 285, 19050, 1, 3908)
	self:addTradeFlags(RecipeDB, 23663, 4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,99)
	self:addTradeAcquire(RecipeDB, 23663, 6, 576, 3, 11557)

	-- Argent Boots -- 23664
	-- Argent Dawn - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val21id3val7id5val57id6val4id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23664, 275, 19056, 1, 3908)
	self:addTradeFlags(RecipeDB, 23664, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB, 23664, 6, 529, 2, 10856, 6, 529, 2, 10857, 6, 529, 2, 11536)

	-- Argent Shoulders -- 23665
	-- Argent Dawn - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val23id3val8id5val68id6val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23665, 285, 19059, 1, 3908)
	self:addTradeFlags(RecipeDB, 23665, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,96)
	self:addTradeAcquire(RecipeDB, 23665, 6, 529, 3, 10856, 6, 529, 3, 10857, 6, 529, 3, 11536)

	-- Flarecore Robe -- 23666
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val35id3val116id6val23id19val23id20val15id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23666, 285, 19156, 1, 3908)
	self:addTradeFlags(RecipeDB, 23666, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 23666, 2, 12944)

	-- Flarecore Leggings -- 23667
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val21id3val107id6val43id19val43id20val16id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23667, 285, 19165, 1, 3908)
	self:addTradeFlags(RecipeDB, 23667, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 23667, 2, 12944)

	-- Bloodvine Vest -- 24091
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val13id4val92id6val27id19val27id20val16id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24091, 285, 19682, 1, 3908)
	self:addTradeFlags(RecipeDB, 24091, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,100)
	self:addTradeAcquire(RecipeDB, 24091, 6, 270, 3, 14921)

	-- Bloodvine Leggings -- 24092
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val6id4val80id6val37id19val37id20val8id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24092, 285, 19683, 1, 3908)
	self:addTradeFlags(RecipeDB, 24092, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,100)
	self:addTradeAcquire(RecipeDB, 24092, 6, 270, 2, 14921)

	-- Bloodvine Boots -- 24093
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val16id4val63id6val19id19val19id20val8id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24093, 285, 19684, 1, 3908)
	self:addTradeFlags(RecipeDB, 24093, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,100)
	self:addTradeAcquire(RecipeDB, 24093, 6, 270, 1, 14921)

	-- Runed Stygian Leggings -- 24901
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val13id3val78id6val6id24val25id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24901, 285, 20538, 3, 3908)
	self:addTradeFlags(RecipeDB, 24901, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 24901, 3, 4553, 3, 11880, 3, 11881, 3, 15184, 3, 23392)

	-- Runed Stygian Belt -- 24902
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id3val50id6val3id24val20id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24902, 285, 20539, 3, 3908)
	self:addTradeFlags(RecipeDB, 24902, 21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	-- No acquire information

	-- Runed Stygian Boots -- 24903
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id3val61id6val4id24val20id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24903, 285, 20537, 3, 3908)
	self:addTradeFlags(RecipeDB, 24903, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 24903, 3, 16878, 3, 19239, 3, 23392)

	-- Soul Pouch -- 26085
	-- Vendor
	-- Flags: Warlock, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26085, 245, 21340, 1, 3908)
	self:addTradeFlags(RecipeDB, 26085, 1,2,4,29,36,40)
	self:addTradeAcquire(RecipeDB, 26085, 2, 6568)

	-- Felcloth Bag -- 26086
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26086, 270, 21341, 3, 3908)
	self:addTradeFlags(RecipeDB, 26086, 3,29,36,41)
	-- No acquire information

	-- Core Felcloth Bag -- 26087
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- No location information
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: Warlock, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26087, 285, 21342, 3, 3908)
	self:addTradeFlags(RecipeDB, 26087, 6,29,36,40)
	self:addTradeAcquire(RecipeDB, 26087, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264, 3, 12397)

	-- Festival Dress -- 26403
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26403, 235, 21154, 2, 3908)
	self:addTradeFlags(RecipeDB, 26403, 3,7,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 26403, 5, 2)

	-- Festive Red Pant Suit -- 26407
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26407, 235, 21542, 2, 3908)
	self:addTradeFlags(RecipeDB, 26407, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26407, 5, 1)

	-- Bolt of Netherweave -- 26745
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26745, 285, 21840, 1, 3908)
	self:addTradeFlags(RecipeDB, 26745, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26745, 1, 18749, 1, 18772)

	-- Netherweave Bag -- 26746
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26746, 300, 21841, 1, 3908)
	self:addTradeFlags(RecipeDB, 26746, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26746, 1, 18749, 1, 18772)

	-- Bolt of Imbued Netherweave -- 26747
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26747, 320, 21842, 1, 3908)
	self:addTradeFlags(RecipeDB, 26747, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 26747, 2, 16638, 2, 16767, 2, 19213)

	-- Imbued Netherweave Bag -- 26749
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26749, 330, 21843, 1, 3908)
	self:addTradeFlags(RecipeDB, 26749, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 26749, 2, 19015, 2, 19213)

	-- Bolt of Soulcloth -- 26750
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26750, 335, 21844, 1, 3908)
	self:addTradeFlags(RecipeDB, 26750, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 26750, 2, 16638, 2, 16767, 2, 19015, 2, 19017)

	-- Primal Mooncloth -- 26751
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26751, 340, 21845, 1, 3908)
	self:addTradeFlags(RecipeDB, 26751, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 26751, 2, 22208)

	-- Spellfire Belt -- 26752
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val18id4val100id6val100id19val18id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 26797
	self:addTradeSkill(RecipeDB, 26752, 355, 21846, 1, 3908, 26797)
	self:addTradeFlags(RecipeDB, 26752, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 26752, 2, 22213)

	-- Spellfire Gloves -- 26753
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id4val111id6val100id19val23id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 26797
	self:addTradeSkill(RecipeDB, 26753, 365, 21847, 1, 3908, 26797)
	self:addTradeFlags(RecipeDB, 26753, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 26753, 2, 22213)

	-- Spellfire Robe -- 26754
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val17id4val178id6val144id19val28id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 26797
	self:addTradeSkill(RecipeDB, 26754, 375, 21848, 1, 3908, 26797)
	self:addTradeFlags(RecipeDB, 26754, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 26754, 2, 22213)

	-- Spellfire Bag -- 26755
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26755, 375, 21858, 3, 3908)
	self:addTradeFlags(RecipeDB, 26755, 1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26755, 3, 20134, 3, 20135, 2, 22213)

	-- Frozen Shadoweave Shoulders -- 26756
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val21id3val15id4val133id6val100id19
	recipecount = recipecount + 1
	-- Recipe Specialty of 26801
	self:addTradeSkill(RecipeDB, 26756, 355, 21869, 1, 3908, 26801)
	self:addTradeFlags(RecipeDB, 26756, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 26756, 2, 22212)

	-- Frozen Shadoweave Boots -- 26757
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id3val9id4val122id6val114id19
	recipecount = recipecount + 1
	-- Recipe Specialty of 26801
	self:addTradeSkill(RecipeDB, 26757, 365, 21870, 1, 3908, 26801)
	self:addTradeFlags(RecipeDB, 26757, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 26757, 2, 22212)

	-- Frozen Shadoweave Robe -- 26758
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val30id3val20id4val178id6val144id19
	recipecount = recipecount + 1
	-- Recipe Specialty of 26801
	self:addTradeSkill(RecipeDB, 26758, 375, 21871, 1, 3908, 26801)
	self:addTradeFlags(RecipeDB, 26758, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 26758, 2, 22212)

	-- Ebon Shadowbag -- 26759
	-- Mob Drop
	-- Vendor
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26759, 375, 21872, 3, 3908)
	self:addTradeFlags(RecipeDB, 26759, 1,2,4,11,29,36,41)
	self:addTradeAcquire(RecipeDB, 26759, 3, 20872, 2, 22212)

	-- Primal Mooncloth Belt -- 26760
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val12id4val11id5val109id6val27id19val81id20val8id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 26798
	self:addTradeSkill(RecipeDB, 26760, 355, 21873, 1, 3908, 26798)
	self:addTradeFlags(RecipeDB, 26760, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 26760, 2, 22208)

	-- Primal Mooncloth Shoulders -- 26761
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val16id4val15id5val133id6val31id19val92id20val7id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 26798
	self:addTradeSkill(RecipeDB, 26761, 365, 21874, 1, 3908, 26798)
	self:addTradeFlags(RecipeDB, 26761, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 26761, 2, 22208)

	-- Primal Mooncloth Robe -- 26762
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val20id4val20id5val202id6val41id19val121id20val10id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 26798
	self:addTradeSkill(RecipeDB, 26762, 375, 21875, 1, 3908, 26798)
	self:addTradeFlags(RecipeDB, 26762, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 26762, 2, 22208)

	-- Primal Mooncloth Bag -- 26763
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26763, 375, 21876, 3, 3908)
	self:addTradeFlags(RecipeDB, 26763, 1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26763, 3, 18872, 2, 22208)

	-- Netherweave Bracers -- 26764
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val24id3val51id6val19id19val19id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26764, 310, 21849, 1, 3908)
	self:addTradeFlags(RecipeDB, 26764, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 26764, 1, 18749, 1, 18772)

	-- Netherweave Belt -- 26765
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val65id6val26id19val26id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26765, 310, 21850, 1, 3908)
	self:addTradeFlags(RecipeDB, 26765, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 26765, 1, 18749, 1, 18772)

	-- Netherweave Gloves -- 26770
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val77id6val28id19val28id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26770, 320, 21851, 1, 3908)
	self:addTradeFlags(RecipeDB, 26770, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 26770, 1, 18749, 1, 18772)

	-- Netherweave Pants -- 26771
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val45id3val111id6val37id19val37id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26771, 325, 21852, 1, 3908)
	self:addTradeFlags(RecipeDB, 26771, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 26771, 1, 18749, 1, 18772)

	-- Netherweave Boots -- 26772
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val92id6val34id19val34id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26772, 335, 21853, 1, 3908)
	self:addTradeFlags(RecipeDB, 26772, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 26772, 1, 18749, 1, 18772)

	-- Netherweave Robe -- 26773
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val45id3val137id6val44id19val44id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26773, 340, 21854, 1, 3908)
	self:addTradeFlags(RecipeDB, 26773, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26773, 2, 16638, 2, 16767, 2, 19213)

	-- Netherweave Tunic -- 26774
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val45id3val141id6val46id19val46id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26774, 345, 21855, 1, 3908)
	self:addTradeFlags(RecipeDB, 26774, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26774, 2, 16638, 2, 16767, 2, 19213)

	-- Imbued Netherweave Pants -- 26775
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val39id3val26id4val126id6val30id19val30id20val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26775, 340, 21859, 1, 3908)
	self:addTradeFlags(RecipeDB, 26775, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26775, 2, 18011, 2, 19722)

	-- Imbued Netherweave Boots -- 26776
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val21id4val102id6val23id19val23id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26776, 350, 21860, 1, 3908)
	self:addTradeFlags(RecipeDB, 26776, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26776, 2, 18011, 2, 19722)

	-- Imbued Netherweave Robe -- 26777
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val42id3val28id4val155id6val33id19val33id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26777, 360, 21861, 1, 3908)
	self:addTradeFlags(RecipeDB, 26777, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26777, 2, 19521)

	-- Imbued Netherweave Tunic -- 26778
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val28id3val155id6val50id19val50id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26778, 360, 21862, 1, 3908)
	self:addTradeFlags(RecipeDB, 26778, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26778, 2, 19521)

	-- Soulcloth Gloves -- 26779
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val24id3val13id4val9id5val106id6val35id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26779, 355, 21863, 1, 3908)
	self:addTradeFlags(RecipeDB, 26779, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 26779, 2, 19015, 2, 19017)

	-- Soulcloth Shoulders -- 26780
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val30id3val15id4val11id5val127id6val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26780, 365, 21864, 4, 3908)
	self:addTradeFlags(RecipeDB, 26780, 6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 26780, 3, 16406)

	-- Soulcloth Vest -- 26781
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val24id3val20id4val16id5val170id6val45id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26781, 375, 21865, 4, 3908)
	self:addTradeFlags(RecipeDB, 26781, 6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 26781, 3, 16408)

	-- Arcanoweave Bracers -- 26782
	-- Instance: 3848 - type5category3territory1expansion1minlevel70nameTempest Keep: The Arcatrazid3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val31id3val67id6val25id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26782, 350, 21866, 2, 3908)
	self:addTradeFlags(RecipeDB, 26782, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 26782, 3, 20869)

	-- Arcanoweave Boots -- 26783
	-- Instance: 3849 - type5category3territory1expansion1minlevel70nameTempest Keep: The Mechanarid3849
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val39id3val106id6val35id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26783, 360, 21867, 2, 3908)
	self:addTradeFlags(RecipeDB, 26783, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 26783, 3, 19168)

	-- Arcanoweave Robe -- 26784
	-- Instance: 3849 - type5category3territory1expansion1minlevel70nameTempest Keep: The Mechanarid3849
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val45id3val156id6val9id24val50id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26784, 370, 21868, 2, 3908)
	self:addTradeFlags(RecipeDB, 26784, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 26784, 3, 19220)

	-- Enchanted Mageweave Pouch -- 27658
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27658, 210, 22246, 1, 3908)
	self:addTradeFlags(RecipeDB, 27658, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27658, 2, 1318, 2, 3012, 2, 3346, 2, 4228, 2, 4617, 2, 5158, 2, 5757, 2, 5758, 2, 15198, 2, 15419, 2, 16635, 2, 16722, 2, 18753, 2, 18773, 2, 18951, 2, 19234, 2, 19537, 2, 19540, 2, 19663)

	-- Enchanted Runecloth Bag -- 27659
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27659, 260, 22248, 1, 3908)
	self:addTradeFlags(RecipeDB, 27659, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27659, 2, 15198, 2, 15419)

	-- Big Bag of Enchantment -- 27660
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27660, 285, 22249, 2, 3908)
	self:addTradeFlags(RecipeDB, 27660, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27660, 3, 11487)

	-- Cenarion Herb Bag -- 27724
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27724, 260, 22251, 1, 3908)
	self:addTradeFlags(RecipeDB, 27724, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,97)
	self:addTradeAcquire(RecipeDB, 27724, 6, 609, 1, 15179)

	-- Satchel of Cenarius -- 27725
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27725, 285, 22252, 1, 3908)
	self:addTradeFlags(RecipeDB, 27725, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,97)
	self:addTradeAcquire(RecipeDB, 27725, 6, 609, 3, 15179)

	-- Glacial Gloves -- 28205
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val22id3val87id6val15id19val15id20val30id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28205, 285, 22654, 4, 3908)
	self:addTradeFlags(RecipeDB, 28205, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Glacial Vest -- 28207
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val26id3val139id6val21id19val21id20val40id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28207, 285, 22652, 4, 3908)
	self:addTradeFlags(RecipeDB, 28207, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Glacial Cloak -- 28208
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val18id3val69id6val24id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28208, 285, 22658, 4, 3908)
	self:addTradeFlags(RecipeDB, 28208, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Glacial Wrists -- 28209
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val20id3val61id6val12id19val12id20val20id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28209, 285, 22655, 4, 3908)
	self:addTradeFlags(RecipeDB, 28209, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Gaea's Embrace -- 28210
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val6id3val49id6val20id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28210, 285, 22660, 1, 3908)
	self:addTradeFlags(RecipeDB, 28210, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60,97)
	self:addTradeAcquire(RecipeDB, 28210, 6, 609, 3, 15179)

	-- Sylvan Vest -- 28480
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val15id3val98id6val12id19val12id20val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28480, 285, 22756, 1, 3908)
	self:addTradeFlags(RecipeDB, 28480, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,97)
	self:addTradeAcquire(RecipeDB, 28480, 6, 609, 3, 15179)

	-- Sylvan Crown -- 28481
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id3val80id6val18id19val18id20val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28481, 285, 22757, 1, 3908)
	self:addTradeFlags(RecipeDB, 28481, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,97)
	self:addTradeAcquire(RecipeDB, 28481, 6, 609, 2, 15179)

	-- Sylvan Shoulders -- 28482
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val18id3val74id6val7id19val7id20val20id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28482, 285, 22758, 1, 3908)
	self:addTradeFlags(RecipeDB, 28482, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,97)
	self:addTradeAcquire(RecipeDB, 28482, 6, 609, 1, 15179)

	-- Spellcloth -- 31373
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31373, 340, 24271, 1, 3908)
	self:addTradeFlags(RecipeDB, 31373, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31373, 2, 22213)

	-- Mystic Spellthread -- 31430
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31430, 335, 24273, 1, 3908)
	self:addTradeFlags(RecipeDB, 31430, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB, 31430, 6, 934, 2, 19331)

	-- Silver Spellthread -- 31431
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31431, 335, 24275, 1, 3908)
	self:addTradeFlags(RecipeDB, 31431, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,101)
	self:addTradeAcquire(RecipeDB, 31431, 6, 932, 2, 19321)

	-- Runic Spellthread -- 31432
	-- The Scryers - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31432, 375, 24274, 1, 3908)
	self:addTradeFlags(RecipeDB, 31432, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB, 31432, 6, 934, 4, 19331)

	-- Golden Spellthread -- 31433
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31433, 375, 24276, 1, 3908)
	self:addTradeFlags(RecipeDB, 31433, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,101)
	self:addTradeAcquire(RecipeDB, 31433, 6, 932, 4, 19321)

	-- Unyielding Bracers -- 31434
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val39id3val67id6val12id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31434, 350, 24249, 3, 3908)
	self:addTradeFlags(RecipeDB, 31434, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 31434, 7, 3)

	-- Bracers of Havok -- 31435
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val12id4val67id6val30id19val30id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31435, 350, 24250, 3, 3908)
	self:addTradeFlags(RecipeDB, 31435, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 31435, 7, 3)

	-- Blackstrike Bracers -- 31437
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val67id6val2id19val2id20val26id22val5id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31437, 350, 24251, 3, 3908)
	self:addTradeFlags(RecipeDB, 31437, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 31437, 7, 3)

	-- Cloak of the Black Void -- 31438
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val11id4val76id6val35id19val35id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31438, 350, 24252, 3, 3908)
	self:addTradeFlags(RecipeDB, 31438, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,60)
	self:addTradeAcquire(RecipeDB, 31438, 7, 3)

	-- Cloak of Eternity -- 31440
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: Tanking, 
	-- Item Stats: val36id3val76id6val23id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31440, 350, 24253, 3, 3908)
	self:addTradeFlags(RecipeDB, 31440, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,60)
	self:addTradeAcquire(RecipeDB, 31440, 7, 3)

	-- White Remedy Cape -- 31441
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: Healing, 
	-- Item Stats: val76id6val20id19val59id20val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31441, 350, 24254, 3, 3908)
	self:addTradeFlags(RecipeDB, 31441, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,60)
	self:addTradeAcquire(RecipeDB, 31441, 7, 3)

	-- Unyielding Girdle -- 31442
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val28id3val3id4val100id6val32id19val32id20val20id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31442, 365, 24255, 4, 3908)
	self:addTradeFlags(RecipeDB, 31442, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 31442, 7, 4)

	-- Girdle of Ruination -- 31443
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val18id3val13id4val100id6val39id19val39id20val20id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31443, 365, 24256, 4, 3908)
	self:addTradeFlags(RecipeDB, 31443, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 31443, 7, 4)

	-- Black Belt of Knowledge -- 31444
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val18id4val21id5val100id6val4id19val4id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31444, 365, 24257, 4, 3908)
	self:addTradeFlags(RecipeDB, 31444, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 31444, 7, 4)

	-- Resolute Cape -- 31448
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val30id3val349id6val21id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31448, 365, 24258, 4, 3908)
	self:addTradeFlags(RecipeDB, 31448, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 31448, 7, 4)

	-- Vengeance Wrap -- 31449
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val89id6val52id9val23id11val52id16val23id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31449, 365, 24259, 4, 3908)
	self:addTradeFlags(RecipeDB, 31449, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 31449, 7, 4)

	-- Manaweave Cloak -- 31450
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val20id4val21id5val89id6val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31450, 365, 24260, 4, 3908)
	self:addTradeFlags(RecipeDB, 31450, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 31450, 7, 4)

	-- Whitemend Pants -- 31451
	-- Instance: 3848 - type5category3territory1expansion1minlevel70nameTempest Keep: The Arcatrazid3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val21id3val25id4val156id6val21id19val62id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31451, 375, 24261, 4, 3908)
	self:addTradeFlags(RecipeDB, 31451, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 31451, 3, 20885)

	-- Spellstrike Pants -- 31452
	-- Instance: 3789 - type5category3territory1expansion1minlevel70nameAuchindoun: Shadow Labrynthid3789
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val12id3val8id4val156id6val46id19val46id20val22id21val26id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31452, 375, 24262, 4, 3908)
	self:addTradeFlags(RecipeDB, 31452, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 31452, 3, 18708)

	-- Battlecast Pants -- 31453
	-- Instance: 3847 - type5category3territory1expansion1minlevel70nameTempest Keep: The Botanicaid3847
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val42id3val27id4val156id6val46id19val46id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31453, 375, 24263, 4, 3908)
	self:addTradeFlags(RecipeDB, 31453, 5,11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 31453, 3, 17978)

	-- Whitemend Hood -- 31454
	-- Instance: 3847 - type5category3territory1expansion1minlevel70nameTempest Keep: The Botanicaid3847
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val15id3val19id4val145id6val27id19val79id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31454, 375, 24264, 4, 3908)
	self:addTradeFlags(RecipeDB, 31454, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 31454, 3, 17977)

	-- Spellstrike Hood -- 31455
	-- Instance: 3714 - type5category3territory1expansion1minlevel70nameHellfire Citadel: The Shattered Hallsid3714
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val16id3val12id4val145id6val46id19val46id20val16id21val24id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31455, 375, 24266, 4, 3908)
	self:addTradeFlags(RecipeDB, 31455, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 31455, 3, 16807)

	-- Battlecast Hood -- 31456
	-- Instance: 3715 - type5category3territory1expansion1minlevel70nameCoilfang Reservoir: The Steamvaultid3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val43id3val28id4val145id6val43id19val43id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31456, 375, 24267, 4, 3908)
	self:addTradeFlags(RecipeDB, 31456, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 31456, 3, 17798)

	-- Bag of Jewels -- 31459
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31459, 340, 24270, 1, 3908)
	self:addTradeFlags(RecipeDB, 31459, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 31459, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Netherweave Net -- 31460
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31460, 280, 24268, 1, 3908)
	self:addTradeFlags(RecipeDB, 31460, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 31460, 1, 11557, 1, 18749, 1, 18772)

	-- Heavy Netherweave Net -- 31461
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31461, 315, 24269, 1, 3908)
	self:addTradeFlags(RecipeDB, 31461, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Belt of Blasting -- 36315
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val121id6val54id19val54id20val23id21val30id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36315, 375, 30038, 4, 3908)
	self:addTradeFlags(RecipeDB, 36315, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 36315, 7, 4)

	-- Belt of the Long Road -- 36316
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val13id3val18id4val33id5val121id6val28id19val80id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36316, 375, 30036, 4, 3908)
	self:addTradeFlags(RecipeDB, 36316, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 36316, 7, 4)

	-- Boots of Blasting -- 36317
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val25id3val25id4val148id6val39id19val39id20val18id21val25id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36317, 375, 30037, 4, 3908)
	self:addTradeFlags(RecipeDB, 36317, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 36317, 7, 4)

	-- Boots of the Long Road -- 36318
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val25id3val26id4val22id5val148id6val25id19val73id20val9id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36318, 375, 30035, 4, 3908)
	self:addTradeFlags(RecipeDB, 36318, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 36318, 7, 4)

	-- Netherflame Robe -- 36665
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val21id3val149id6val41id19val41id20val14id21val35id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36665, 355, 30459, 3, 3908)
	self:addTradeFlags(RecipeDB, 36665, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Netherflame Belt -- 36667
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val16id3val84id6val29id19val29id20val25id21val11id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36667, 355, 30460, 3, 3908)
	self:addTradeFlags(RecipeDB, 36667, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Netherflame Boots -- 36668
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val16id3val103id6val29id19val29id20val11id21val25id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36668, 355, 30461, 3, 3908)
	self:addTradeFlags(RecipeDB, 36668, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	-- No acquire information

	-- Lifeblood Leggings -- 36669
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val21id3val14id4val126id6val26id19val77id20val14id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36669, 355, 30465, 3, 3908)
	self:addTradeFlags(RecipeDB, 36669, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	-- No acquire information

	-- Lifeblood Belt -- 36670
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val16id3val11id4val84id6val19id19val55id20val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36670, 355, 30463, 3, 3908)
	self:addTradeFlags(RecipeDB, 36670, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	-- No acquire information

	-- Lifeblood Bracers -- 36672
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val15id3val10id4val67id6val14id19val42id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36672, 355, 30464, 3, 3908)
	self:addTradeFlags(RecipeDB, 36672, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	-- No acquire information

	-- Shadowcloth -- 36686
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36686, 340, 24272, 1, 3908)
	self:addTradeFlags(RecipeDB, 36686, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 36686, 2, 22212)

	-- Cloak of Arcane Evasion -- 37873
	-- Lower City - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val12id3val76id6val32id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37873, 350, 30831, 1, 3908)
	self:addTradeFlags(RecipeDB, 37873, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60,107)
	self:addTradeAcquire(RecipeDB, 37873, 6, 1011, 2, 21655)

	-- Flameheart Bracers -- 37882
	-- The Aldor - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id4val67id6val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37882, 350, 30837, 1, 3908)
	self:addTradeFlags(RecipeDB, 37882, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,101)
	self:addTradeAcquire(RecipeDB, 37882, 6, 932, 1, 19321)

	-- Flameheart Gloves -- 37883
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id3val11id4val97id6val40id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37883, 360, 30838, 1, 3908)
	self:addTradeFlags(RecipeDB, 37883, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,101)
	self:addTradeAcquire(RecipeDB, 37883, 6, 932, 2, 19321)

	-- Flameheart Vest -- 37884
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val30id3val19id4val156id6val50id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37884, 370, 30839, 1, 3908)
	self:addTradeFlags(RecipeDB, 37884, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,56,101)
	self:addTradeAcquire(RecipeDB, 37884, 6, 932, 4, 19321)

	-- Soulguard Slippers -- 40020
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val40id3val150id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40020, 375, 32391, 1, 3908)
	self:addTradeFlags(RecipeDB, 40020, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB, 40020, 6, 1012, 2, 23159)

	-- Soulguard Bracers -- 40021
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val30id3val96id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40021, 375, 32392, 1, 3908)
	self:addTradeFlags(RecipeDB, 40021, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB, 40021, 6, 1012, 1, 23159)

	-- Soulguard Leggings -- 40023
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val54id3val191id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40023, 375, 32389, 1, 3908)
	self:addTradeFlags(RecipeDB, 40023, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB, 40023, 6, 1012, 2, 23159)

	-- Soulguard Girdle -- 40024
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val40id3val123id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40024, 375, 32390, 1, 3908)
	self:addTradeFlags(RecipeDB, 40024, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,56,102)
	self:addTradeAcquire(RecipeDB, 40024, 6, 1012, 1, 23159)

	-- Night's End -- 40060
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val30id3val109id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40060, 375, 32420, 1, 3908)
	self:addTradeFlags(RecipeDB, 40060, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,60,102)
	self:addTradeAcquire(RecipeDB, 40060, 6, 1012, 2, 23159)

	-- Bracers of Nimble Thought -- 41205
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val27id3val20id4val103id6val34id19val34id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41205, 375, 32586, 4, 3908)
	self:addTradeFlags(RecipeDB, 41205, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 41205, 7, 4)

	-- Mantle of Nimble Thought -- 41206
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val37id3val26id4val177id6val44id19val44id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41206, 375, 32587, 4, 3908)
	self:addTradeFlags(RecipeDB, 41206, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 41206, 7, 4)

	-- Swiftheal Wraps -- 41207
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val24id3val22id4val103id6val22id19val64id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41207, 375, 32584, 4, 3908)
	self:addTradeFlags(RecipeDB, 41207, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 41207, 7, 4)

	-- Swiftheal Mantle -- 41208
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val21id3val16id4val28id5val177id6val28id19val84id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41208, 375, 32585, 4, 3908)
	self:addTradeFlags(RecipeDB, 41208, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 41208, 7, 4)

	-- Green Winter Clothes -- 44950
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44950, 250, 34087, 2, 3908)
	self:addTradeFlags(RecipeDB, 44950, 3,7,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 44950, 5, 1)

	-- Red Winter Clothes -- 44958
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val3id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44958, 250, 34085, 2, 3908)
	self:addTradeFlags(RecipeDB, 44958, 3,7,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 44958, 5, 1)

	-- Sunfire Handwraps -- 46128
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val33id3val30id4val166id6val57id19val57id20val37id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46128, 340, 34366, 4, 3908)
	self:addTradeFlags(RecipeDB, 46128, 6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 46128, 3, 25363, 3, 25367, 3, 25369, 3, 25371, 3, 25507)

	-- Hands of Eternal Light -- 46129
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val33id3val30id4val37id5val166id6val33id19val99id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46129, 340, 34367, 4, 3908)
	self:addTradeFlags(RecipeDB, 46129, 6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 46129, 3, 25363, 3, 25371, 3, 25507)

	-- Sunfire Robe -- 46130
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val36id3val34id4val266id6val76id19val76id20val40id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46130, 340, 34364, 4, 3908)
	self:addTradeFlags(RecipeDB, 46130, 6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 46130, 3, 25369, 3, 25371, 3, 25372, 3, 25507)

	-- Robe of Eternal Light -- 46131
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val36id3val34id4val266id6val45id19val134id20val18id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46131, 340, 34365, 4, 3908)
	self:addTradeFlags(RecipeDB, 46131, 6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 46131, 3, 25363, 3, 25369)

	return recipecount

end
