--[[

************************************************************************

ARL-BlackSmith.lua

Blacksmithing data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
391 found from data mining.
0 ignored.
6 WotLK ignored.

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

function addon:InitBlacksmithing(RecipeDB)

	local recipecount = 0

	-- Rough Sharpening Stone -- 2660
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2660, 1, 2862, 1, 2018)
	self:addTradeFlags(RecipeDB, 2660, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Copper Chain Belt -- 2661
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2661, 35, 2851, 1, 2018)
	self:addTradeFlags(RecipeDB, 2661, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2661, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Copper Chain Pants -- 2662
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val83id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2662, 10, 2852, 1, 2018)
	self:addTradeFlags(RecipeDB, 2662, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2662, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Copper Bracers -- 2663
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val35id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2663, 1, 2853, 1, 2018)
	self:addTradeFlags(RecipeDB, 2663, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Runed Copper Bracers -- 2664
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2664, 90, 2854, 1, 2018)
	self:addTradeFlags(RecipeDB, 2664, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2664, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Coarse Sharpening Stone -- 2665
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2665, 50, 2863, 1, 2018)
	self:addTradeFlags(RecipeDB, 2665, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2665, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Runed Copper Belt -- 2666
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2666, 70, 2857, 1, 2018)
	self:addTradeFlags(RecipeDB, 2666, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2666, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Runed Copper Breastplate -- 2667
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id1val3id3val162id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2667, 80, 2864, 2, 2018)
	self:addTradeFlags(RecipeDB, 2667, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 2667, 7, 2)

	-- Rough Bronze Leggings -- 2668
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id3val4id5val149id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2668, 115, 2865, 1, 2018)
	self:addTradeFlags(RecipeDB, 2668, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2668, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823)

	-- Rough Bronze Cuirass -- 2670
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val168id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2670, 115, 2866, 1, 2018)
	self:addTradeFlags(RecipeDB, 2670, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2670, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Rough Bronze Bracers -- 2671
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id3val77id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2671, 115, 2867, 2, 2018)
	self:addTradeFlags(RecipeDB, 2671, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Patterned Bronze Bracers -- 2672
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id1val80id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2672, 120, 2868, 1, 2018)
	self:addTradeFlags(RecipeDB, 2672, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2672, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Silvered Bronze Breastplate -- 2673
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id1val5id3val4id5val186id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2673, 130, 2869, 2, 2018)
	self:addTradeFlags(RecipeDB, 2673, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 2673, 7, 2)

	-- Heavy Sharpening Stone -- 2674
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2674, 110, 2871, 1, 2018)
	self:addTradeFlags(RecipeDB, 2674, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2674, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Shining Silver Breastplate -- 2675
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val14id1val6id3val214id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2675, 145, 2870, 1, 2018)
	self:addTradeFlags(RecipeDB, 2675, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 2675, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Copper Mace -- 2737
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val6-11id7val2.2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2737, 15, 2844, 1, 2018)
	self:addTradeFlags(RecipeDB, 2737, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 2737, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Copper Axe -- 2738
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val5-10id7val1.9id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2738, 20, 2845, 1, 2018)
	self:addTradeFlags(RecipeDB, 2738, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 2738, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Copper Shortsword -- 2739
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val5-11id7val2.1id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2739, 25, 2847, 1, 2018)
	self:addTradeFlags(RecipeDB, 2739, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 2739, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Bronze Mace -- 2740
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val18-34id7val2.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2740, 110, 2848, 1, 2018)
	self:addTradeFlags(RecipeDB, 2740, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 2740, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Bronze Axe -- 2741
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val15-29id7val2.1id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2741, 115, 2849, 1, 2018)
	self:addTradeFlags(RecipeDB, 2741, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 2741, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Bronze Shortsword -- 2742
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val16-31id7val2.1id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2742, 120, 2850, 1, 2018)
	self:addTradeFlags(RecipeDB, 2742, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 2742, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Rough Weightstone -- 3115
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3115, 1, 3239, 1, 2018)
	self:addTradeFlags(RecipeDB, 3115, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Coarse Weightstone -- 3116
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3116, 50, 3240, 1, 2018)
	self:addTradeFlags(RecipeDB, 3116, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3116, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Heavy Weightstone -- 3117
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3117, 110, 3241, 1, 2018)
	self:addTradeFlags(RecipeDB, 3117, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3117, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Heavy Copper Broadsword -- 3292
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val6id3val27-41id7val2.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3292, 95, 3487, 1, 2018)
	self:addTradeFlags(RecipeDB, 3292, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 3292, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Copper Battle Axe -- 3293
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val3id3val23-35id7val3.2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3293, 35, 3488, 1, 2018)
	self:addTradeFlags(RecipeDB, 3293, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 3293, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Thick War Axe -- 3294
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val1id1val1id3val15-28id7val2.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3294, 70, 3489, 1, 2018)
	self:addTradeFlags(RecipeDB, 3294, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 3294, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Deadly Bronze Poniard -- 3295
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Dagger, 
	-- Item Stats: 
	-- Item Stats: val4id2val16-30id7val1.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3295, 125, 3490, 2, 2018)
	self:addTradeFlags(RecipeDB, 3295, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,72)
	self:addTradeAcquire(RecipeDB, 3295, 7, 2)

	-- Heavy Bronze Mace -- 3296
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val4id1val25-47id7val2.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3296, 130, 3491, 1, 2018)
	self:addTradeFlags(RecipeDB, 3296, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 3296, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Mighty Iron Hammer -- 3297
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val5id1val30-57id7val2.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3297, 145, 3492, 2, 2018)
	self:addTradeFlags(RecipeDB, 3297, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 3297, 7, 2)

	-- Copper Chain Boots -- 3319
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3319, 20, 3469, 1, 2018)
	self:addTradeFlags(RecipeDB, 3319, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3319, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Rough Grinding Stone -- 3320
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3320, 5, 3470, 1, 2018)
	self:addTradeFlags(RecipeDB, 3320, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3320, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245)

	-- Copper Chain Vest -- 3321
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val1id1val108id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3321, 35, 3471, 2, 2018)
	self:addTradeFlags(RecipeDB, 3321, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3321, 7, 2)

	-- Runed Copper Gauntlets -- 3323
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val73id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3323, 40, 3472, 1, 2018)
	self:addTradeFlags(RecipeDB, 3323, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3323, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Runed Copper Pants -- 3324
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val2id1val2id3val113id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3324, 45, 3473, 1, 2018)
	self:addTradeFlags(RecipeDB, 3324, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3324, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Gemmed Copper Gauntlets -- 3325
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3325, 60, 3474, 2, 2018)
	self:addTradeFlags(RecipeDB, 3325, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3325, 7, 2)

	-- Coarse Grinding Stone -- 3326
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3326, 50, 3478, 1, 2018)
	self:addTradeFlags(RecipeDB, 3326, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3326, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245)

	-- Rough Bronze Shoulders -- 3328
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val124id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3328, 110, 3480, 1, 2018)
	self:addTradeFlags(RecipeDB, 3328, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3328, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Silvered Bronze Shoulders -- 3330
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val3id1val3id3val3id5val137id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3330, 125, 3481, 2, 2018)
	self:addTradeFlags(RecipeDB, 3330, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3330, 7, 2)

	-- Silvered Bronze Boots -- 3331
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id1val4id3val3id5val128id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3331, 130, 3482, 1, 2018)
	self:addTradeFlags(RecipeDB, 3331, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3331, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Silvered Bronze Gauntlets -- 3333
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id1val4id3val3id5val118id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3333, 135, 3483, 1, 2018)
	self:addTradeFlags(RecipeDB, 3333, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3333, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Green Iron Boots -- 3334
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val3id1val7id3val134id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3334, 145, 3484, 2, 2018)
	self:addTradeFlags(RecipeDB, 3334, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3334, 7, 2)

	-- Green Iron Gauntlets -- 3336
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id1val6id3val124id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3336, 150, 3485, 2, 2018)
	self:addTradeFlags(RecipeDB, 3336, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3336, 7, 2)

	-- Heavy Grinding Stone -- 3337
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3337, 100, 3486, 1, 2018)
	self:addTradeFlags(RecipeDB, 3337, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3337, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823)

	-- Big Bronze Knife -- 3491
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Dagger, 
	-- Item Stats: 
	-- Item Stats: val3id3val13-25id7val1.9id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3491, 105, 3848, 1, 2018)
	self:addTradeFlags(RecipeDB, 3491, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,72)
	self:addTradeAcquire(RecipeDB, 3491, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Hardened Iron Shortsword -- 3492
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val5id3val21-39id7val1.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3492, 160, 3849, 1, 2018)
	self:addTradeFlags(RecipeDB, 3492, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 3492, 2, 2843, 2, 3356, 2, 5512)

	-- Jade Serpentblade -- 3493
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val4id1val4id2val33-62id7val2.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3493, 175, 3850, 2, 2018)
	self:addTradeFlags(RecipeDB, 3493, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 3493, 7, 2)

	-- Solid Iron Maul -- 3494
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val12id3val59-89id7val3.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3494, 155, 3851, 1, 2018)
	self:addTradeFlags(RecipeDB, 3494, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 3494, 2, 1471, 2, 8878, 2, 9179)

	-- Golden Iron Destroyer -- 3495
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val11id1val4id3val50-76id7val2.75id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3495, 170, 3852, 2, 2018)
	self:addTradeFlags(RecipeDB, 3495, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 3495, 7, 2)

	-- Moonsteel Broadsword -- 3496
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val4id3val12id5val55-83id7val2.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3496, 180, 3853, 1, 2018)
	self:addTradeFlags(RecipeDB, 3496, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 3496, 2, 2482)

	-- Frost Tiger Blade -- 3497
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val78-118id7val3.4id8val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3497, 200, 3854, 2, 2018)
	self:addTradeFlags(RecipeDB, 3497, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 3497, 7, 2)

	-- Massive Iron Axe -- 3498
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val11id1val7id3val71-108id7val3.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3498, 185, 3855, 1, 2018)
	self:addTradeFlags(RecipeDB, 3498, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,68)
	self:addTradeAcquire(RecipeDB, 3498, 2, 1146, 2, 2483)

	-- Shadow Crescent Axe -- 3500
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val11id1val10id3val58-87id7val2.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3500, 200, 3856, 2, 2018)
	self:addTradeFlags(RecipeDB, 3500, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,68)
	self:addTradeAcquire(RecipeDB, 3500, 7, 2)

	-- Green Iron Bracers -- 3501
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3501, 165, 3835, 1, 2018)
	self:addTradeFlags(RecipeDB, 3501, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3501, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823)

	-- Green Iron Helm -- 3502
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id1val11id3val171id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3502, 170, 3836, 1, 2018)
	self:addTradeFlags(RecipeDB, 3502, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3502, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Golden Scale Coif -- 3503
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id1val10id5val181id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3503, 190, 3837, 1, 2018)
	self:addTradeFlags(RecipeDB, 3503, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3503, 2, 5411)

	-- Green Iron Shoulders -- 3504
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id1val7id3val153id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3504, 160, 3840, 2, 2018)
	self:addTradeFlags(RecipeDB, 3504, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3504, 7, 2)

	-- Golden Scale Shoulders -- 3505
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id1val6id5val160id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3505, 175, 3841, 3, 2018)
	self:addTradeFlags(RecipeDB, 3505, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3505, 7, 3)

	-- Green Iron Leggings -- 3506
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id1val8id3val176id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3506, 155, 3842, 1, 2018)
	self:addTradeFlags(RecipeDB, 3506, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3506, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Golden Scale Leggings -- 3507
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val11id1val5id5val184id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3507, 170, 3843, 2, 2018)
	self:addTradeFlags(RecipeDB, 3507, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3507, 7, 2)

	-- Green Iron Hauberk -- 3508
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id1val11id3val358id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3508, 180, 3844, 1, 2018)
	self:addTradeFlags(RecipeDB, 3508, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 3508, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Golden Scale Cuirass -- 3511
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val14id1val6id5val231id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3511, 195, 3845, 2, 2018)
	self:addTradeFlags(RecipeDB, 3511, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3511, 7, 2)

	-- Polished Steel Boots -- 3513
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val11id3val151id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3513, 185, 3846, 2, 2018)
	self:addTradeFlags(RecipeDB, 3513, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3513, 7, 2)

	-- Golden Scale Boots -- 3515
	-- Instance: 796 - type1minlevel34category3maxlevel45nameScarlet Monasteryterritory4id796
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id1val8id5val159id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3515, 200, 3847, 3, 2018)
	self:addTradeFlags(RecipeDB, 3515, 5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 3515, 3, 780, 3, 1096, 3, 1142, 3, 2569, 3, 4151, 3, 4295, 3, 5237, 3, 5419)

	-- Pearl-handled Dagger -- 6517
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Dagger, 
	-- Item Stats: 
	-- Item Stats: val2id2val2id3val13-26id7val1.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6517, 110, 5540, 1, 2018)
	self:addTradeFlags(RecipeDB, 6517, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,72)
	self:addTradeAcquire(RecipeDB, 6517, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Iridescent Hammer -- 6518
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val3id1val3id3val18-34id7val1.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6518, 140, 5541, 2, 2018)
	self:addTradeFlags(RecipeDB, 6518, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 6518, 7, 2)

	-- Iron Shield Spike -- 7221
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7221, 150, 6042, 2, 2018)
	self:addTradeFlags(RecipeDB, 7221, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7221, 7, 2)

	-- Iron Counterweight -- 7222
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7222, 165, 6043, 2, 2018)
	self:addTradeFlags(RecipeDB, 7222, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7222, 7, 2)

	-- Golden Scale Bracers -- 7223
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val91id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7223, 185, 6040, 1, 2018)
	self:addTradeFlags(RecipeDB, 7223, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 7223, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Steel Weapon Chain -- 7224
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7224, 190, 6041, 2, 2018)
	self:addTradeFlags(RecipeDB, 7224, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7224, 7, 2)

	-- Heavy Copper Maul -- 7408
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val21-32id7val2.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7408, 65, 6214, 1, 2018)
	self:addTradeFlags(RecipeDB, 7408, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 7408, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Rough Bronze Boots -- 7817
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val106id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7817, 95, 6350, 1, 2018)
	self:addTradeFlags(RecipeDB, 7817, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 7817, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Silver Rod -- 7818
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7818, 100, 6338, 1, 2018)
	self:addTradeFlags(RecipeDB, 7818, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7818, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823)

	-- Ironforge Chain -- 8366
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id3val151id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8366, 70, 6730, 2, 2018)
	self:addTradeFlags(RecipeDB, 8366, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Ironforge Breastplate -- 8367
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val3id1val3id3val198id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8367, 100, 6731, 2, 2018)
	self:addTradeFlags(RecipeDB, 8367, 1,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 8367, 4, 1618)

	-- Ironforge Gauntlets -- 8368
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val170id6val12id9val12id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8368, 140, 6733, 2, 2018)
	self:addTradeFlags(RecipeDB, 8368, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Iron Buckle -- 8768
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8768, 145, 7071, 1, 2018)
	self:addTradeFlags(RecipeDB, 8768, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 8768, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Copper Dagger -- 8880
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Dagger, 
	-- Item Stats: 
	-- Item Stats: val5-10id7val1.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8880, 30, 7166, 1, 2018)
	self:addTradeFlags(RecipeDB, 8880, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,72)
	self:addTradeAcquire(RecipeDB, 8880, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Barbaric Iron Shoulders -- 9811
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id2val153id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9811, 160, 7913, 2, 2018)
	self:addTradeFlags(RecipeDB, 9811, 2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9811, 4, 2752)

	-- Barbaric Iron Breastplate -- 9813
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id1val204id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9813, 160, 7914, 2, 2018)
	self:addTradeFlags(RecipeDB, 9813, 2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9813, 4, 2751)

	-- Barbaric Iron Helm -- 9814
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id1val9id2val173id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9814, 175, 7915, 2, 2018)
	self:addTradeFlags(RecipeDB, 9814, 2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9814, 4, 2754)

	-- Barbaric Iron Boots -- 9818
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id1val7id2val149id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9818, 180, 7916, 2, 2018)
	self:addTradeFlags(RecipeDB, 9818, 2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9818, 4, 2753)

	-- Barbaric Iron Gloves -- 9820
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val11id1val137id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9820, 185, 7917, 2, 2018)
	self:addTradeFlags(RecipeDB, 9820, 2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9820, 4, 2755)

	-- Steel Breastplate -- 9916
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val381id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9916, 200, 7963, 1, 2018)
	self:addTradeFlags(RecipeDB, 9916, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 9916, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Solid Sharpening Stone -- 9918
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9918, 190, 7964, 1, 2018)
	self:addTradeFlags(RecipeDB, 9918, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 9918, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Solid Grinding Stone -- 9920
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9920, 190, 7966, 1, 2018)
	self:addTradeFlags(RecipeDB, 9920, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 9920, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823)

	-- Solid Weightstone -- 9921
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9921, 190, 7965, 1, 2018)
	self:addTradeFlags(RecipeDB, 9921, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 9921, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Heavy Mithril Shoulder -- 9926
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id3val225id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9926, 205, 7918, 1, 2018)
	self:addTradeFlags(RecipeDB, 9926, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9926, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Heavy Mithril Gauntlet -- 9928
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val8id3val268id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9928, 205, 7919, 1, 2018)
	self:addTradeFlags(RecipeDB, 9928, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9928, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Mithril Scale Pants -- 9931
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Tanking, 
	-- Item Stats: val11id5val208id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9931, 210, 7920, 1, 2018)
	self:addTradeFlags(RecipeDB, 9931, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,58)
	self:addTradeAcquire(RecipeDB, 9931, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Heavy Mithril Pants -- 9933
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val11id3val417id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9933, 210, 7921, 2, 2018)
	self:addTradeFlags(RecipeDB, 9933, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 9933, 7, 2)

	-- Steel Plate Helm -- 9935
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val355id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9935, 215, 7922, 1, 2018)
	self:addTradeFlags(RecipeDB, 9935, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9935, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Mithril Scale Bracers -- 9937
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val6id3val7id5val106id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9937, 215, 7924, 1, 2018)
	self:addTradeFlags(RecipeDB, 9937, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9937, 2, 8161, 2, 8176)

	-- Mithril Shield Spike -- 9939
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9939, 215, 7967, 3, 2018)
	self:addTradeFlags(RecipeDB, 9939, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 9939, 7, 3)

	-- Mithril Scale Gloves -- 9942
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id3val10id5val153id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9942, 220, 7925, 2, 2018)
	self:addTradeFlags(RecipeDB, 9942, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Ornate Mithril Pants -- 9945
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id1val375id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9945, 220, 7926, 2, 2018)
	self:addTradeFlags(RecipeDB, 9945, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 9945, 4, 2761)

	-- Ornate Mithril Gloves -- 9950
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val268id6val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9950, 220, 7927, 2, 2018)
	self:addTradeFlags(RecipeDB, 9950, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9950, 4, 2762)

	-- Ornate Mithril Shoulder -- 9952
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val5id1val327id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9952, 225, 7928, 2, 2018)
	self:addTradeFlags(RecipeDB, 9952, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 9952, 4, 2763)

	-- Truesilver Gauntlets -- 9954
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val16id1val7id3val300id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9954, 225, 7938, 1, 2018)
	self:addTradeFlags(RecipeDB, 9954, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9954, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Orcish War Leggings -- 9957
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val17id1val208id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9957, 230, 7929, 2, 2018)
	self:addTradeFlags(RecipeDB, 9957, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Heavy Mithril Breastplate -- 9959
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val15id3val536id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9959, 230, 7930, 1, 2018)
	self:addTradeFlags(RecipeDB, 9959, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9959, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Mithril Coif -- 9961
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val13id5val206id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9961, 230, 7931, 1, 2018)
	self:addTradeFlags(RecipeDB, 9961, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 9961, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Mithril Spurs -- 9964
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9964, 235, 7969, 2, 2018)
	self:addTradeFlags(RecipeDB, 9964, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 9964, 7, 2)

	-- Mithril Scale Shoulders -- 9966
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val10id5val194id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9966, 235, 7932, 3, 2018)
	self:addTradeFlags(RecipeDB, 9966, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 9966, 7, 3)

	-- Heavy Mithril Boots -- 9968
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id3val382id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9968, 235, 7933, 1, 2018)
	self:addTradeFlags(RecipeDB, 9968, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9968, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Heavy Mithril Helm -- 9970
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val15id3val469id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9970, 235, 7934, 2, 2018)
	self:addTradeFlags(RecipeDB, 9970, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 9970, 7, 2)

	-- Ornate Mithril Breastplate -- 9972
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9972, 240, 7935, 2, 2018)
	self:addTradeFlags(RecipeDB, 9972, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Truesilver Breastplate -- 9974
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id3val519id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9974, 245, 7939, 1, 2018)
	self:addTradeFlags(RecipeDB, 9974, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 9974, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Ornate Mithril Boots -- 9979
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9979, 245, 7936, 2, 2018)
	self:addTradeFlags(RecipeDB, 9979, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Ornate Mithril Helm -- 9980
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9980, 245, 7937, 2, 2018)
	self:addTradeFlags(RecipeDB, 9980, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Copper Claymore -- 9983
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val15-23id7val3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9983, 30, 7955, 1, 2018)
	self:addTradeFlags(RecipeDB, 9983, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 9983, 1, 514, 1, 957, 1, 1241, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3174, 1, 3355, 1, 3478, 1, 3557, 1, 4258, 1, 4596, 1, 4605, 1, 5511, 1, 6299, 1, 10266, 1, 10276, 1, 10277, 1, 10278, 1, 15400, 1, 16583, 1, 16669, 1, 16671, 1, 16724, 1, 16740, 1, 16823, 1, 17245, 1, 19341)

	-- Bronze Warhammer -- 9985
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val37-57id7val3.1id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9985, 125, 7956, 1, 2018)
	self:addTradeFlags(RecipeDB, 9985, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 9985, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Bronze Greatsword -- 9986
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val38-58id7val3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9986, 130, 7957, 1, 2018)
	self:addTradeFlags(RecipeDB, 9986, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 9986, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Bronze Battle Axe -- 9987
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val39-59id7val2.9id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9987, 135, 7958, 1, 2018)
	self:addTradeFlags(RecipeDB, 9987, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 9987, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Heavy Mithril Axe -- 9993
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val7id3val45-85id7val2.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9993, 210, 7941, 1, 2018)
	self:addTradeFlags(RecipeDB, 9993, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 9993, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Blue Glittering Axe -- 9995
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val8id2val32-61id7val1.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9995, 220, 7942, 2, 2018)
	self:addTradeFlags(RecipeDB, 9995, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,68)
	self:addTradeAcquire(RecipeDB, 9995, 7, 2)

	-- Wicked Mithril Blade -- 9997
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val6id1val4id2val43-80id7val2.3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9997, 225, 7943, 2, 2018)
	self:addTradeFlags(RecipeDB, 9997, 10,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 9997, 7, 2)

	-- Big Black Mace -- 10001
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val8id1val46-86id7val2.4id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10001, 230, 7945, 1, 2018)
	self:addTradeFlags(RecipeDB, 10001, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 10001, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- The Shatterer -- 10003
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val53-99id7val2.4id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10003, 235, 7954, 1, 2018)
	self:addTradeFlags(RecipeDB, 10003, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	self:addTradeAcquire(RecipeDB, 10003, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Dazzling Mithril Rapier -- 10005
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val8id2val34-63id7val1.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10005, 240, 7944, 2, 2018)
	self:addTradeFlags(RecipeDB, 10005, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 10005, 7, 2)

	-- Phantom Blade -- 10007
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val59-111id7val2.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10007, 245, 7961, 1, 2018)
	self:addTradeFlags(RecipeDB, 10007, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 10007, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Runed Mithril Hammer -- 10009
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val7id1val4id3val41-76id7val2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10009, 245, 7946, 3, 2018)
	self:addTradeFlags(RecipeDB, 10009, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 10009, 7, 3)

	-- Blight -- 10011
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Polearm, 
	-- Item Stats: 
	-- Item Stats: val93-141id7val2.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10011, 250, 7959, 1, 2018)
	self:addTradeFlags(RecipeDB, 10011, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,71)
	self:addTradeAcquire(RecipeDB, 10011, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Ebon Shiv -- 10013
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Dagger, 
	-- Item Stats: 
	-- Item Stats: val9id2val32-59id7val1.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10013, 255, 7947, 1, 2018)
	self:addTradeFlags(RecipeDB, 10013, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,46,72)
	self:addTradeAcquire(RecipeDB, 10013, 2, 11278)

	-- Truesilver Champion -- 10015
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val108-162id7val3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10015, 260, 7960, 1, 2018)
	self:addTradeFlags(RecipeDB, 10015, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 10015, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Inlaid Mithril Cylinder -- 11454
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11454, 200, 9060, 1, 2018)
	self:addTradeFlags(RecipeDB, 11454, 1,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11454, 1, 7406, 1, 7944)

	-- Golden Scale Gauntlets -- 11643
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val11id1val4id5val146id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11643, 205, 9366, 2, 2018)
	self:addTradeFlags(RecipeDB, 11643, 1,8,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 11643, 4, 2758)

	-- Silvered Bronze Leggings -- 12259
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id1val6id3val6id5val176id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12259, 155, 10423, 2, 2018)
	self:addTradeFlags(RecipeDB, 12259, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 12259, 7, 2)

	-- Rough Copper Vest -- 12260
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val81id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12260, 1, 10421, 1, 2018)
	self:addTradeFlags(RecipeDB, 12260, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Golden Rod -- 14379
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14379, 150, 11128, 1, 2018)
	self:addTradeFlags(RecipeDB, 14379, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 14379, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Truesilver Rod -- 14380
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14380, 200, 11144, 1, 2018)
	self:addTradeFlags(RecipeDB, 14380, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 14380, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Dark Iron Pulverizer -- 15292
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val140-211id7val3.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15292, 265, 11608, 3, 2018)
	self:addTradeFlags(RecipeDB, 15292, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 15292, 3, 9028)

	-- Dark Iron Mail -- 15293
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val13id3val433id6val12id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15293, 270, 11606, 2, 2018)
	self:addTradeFlags(RecipeDB, 15293, 5,11,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 15293, 3, 8900, 3, 8901, 3, 8907, 3, 8911, 3, 8920, 3, 8983)

	-- Dark Iron Sunderer -- 15294
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val101-153id7val2.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15294, 275, 11607, 3, 2018)
	self:addTradeFlags(RecipeDB, 15294, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,68)
	self:addTradeAcquire(RecipeDB, 15294, 3, 9554, 3, 10043)

	-- Dark Iron Shoulders -- 15295
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val10id3val514id6val10id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15295, 280, 11605, 2, 2018)
	self:addTradeFlags(RecipeDB, 15295, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 15295, 3, 8891, 3, 8894, 3, 8899)

	-- Dark Iron Plate -- 15296
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id3val817id6val19id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15296, 285, 11604, 3, 2018)
	self:addTradeFlags(RecipeDB, 15296, 5,21,22,23,24,25,26,27,28,29,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 15296, 3, 9543)

	-- Glinting Steel Dagger -- 15972
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Dagger, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val19-37id7val1.5id8val12id9val12id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15972, 180, 12259, 1, 2018)
	self:addTradeFlags(RecipeDB, 15972, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63,72)
	self:addTradeAcquire(RecipeDB, 15972, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Searing Golden Blade -- 15973
	-- Instance: 1337 - type1minlevel39category3maxlevel47nameUldamanterritory1id1337
	-- Instance: 796 - type1minlevel34category3maxlevel45nameScarlet Monasteryterritory4id796
	-- Instance: 796 - type1minlevel34category3maxlevel45nameScarlet Monasteryterritory4id796
	-- Instance: 796 - type1minlevel34category3maxlevel45nameScarlet Monasteryterritory4id796
	-- Instance: 1176 - type1minlevel43category3maxlevel47nameZul'Farrakterritory1id1176
	-- Instance: 1176 - type1minlevel43category3maxlevel47nameZul'Farrakterritory1id1176
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Dagger, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val21-39id7val1.4id8val10id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15973, 190, 12260, 2, 2018)
	self:addTradeFlags(RecipeDB, 15973, 5,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,72)
	self:addTradeAcquire(RecipeDB, 15973, 3, 2246, 3, 2584, 3, 2732, 3, 4295, 3, 4298, 3, 4300, 3, 7078, 3, 7272, 3, 8138)

	-- Dense Grinding Stone -- 16639
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16639, 250, 12644, 1, 2018)
	self:addTradeFlags(RecipeDB, 16639, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 16639, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Dense Weightstone -- 16640
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16640, 250, 12643, 1, 2018)
	self:addTradeFlags(RecipeDB, 16640, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 16640, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Dense Sharpening Stone -- 16641
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16641, 250, 12404, 1, 2018)
	self:addTradeFlags(RecipeDB, 16641, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 16641, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Thorium Armor -- 16642
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val480id6val8id32val8id33val8id34val8id35val8id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16642, 250, 12405, 2, 2018)
	self:addTradeFlags(RecipeDB, 16642, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16642, 7, 2)

	-- Thorium Belt -- 16643
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val270id6val6id32val6id33val6id34val6id35val6id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16643, 250, 12406, 2, 2018)
	self:addTradeFlags(RecipeDB, 16643, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16643, 7, 2)

	-- Thorium Bracers -- 16644
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val214id6val5id32val5id33val5id34val5id35val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16644, 255, 12408, 2, 2018)
	self:addTradeFlags(RecipeDB, 16644, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16644, 7, 2)

	-- Radiant Belt -- 16645
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val159id6val12id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16645, 260, 12416, 2, 2018)
	self:addTradeFlags(RecipeDB, 16645, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16645, 7, 2)

	-- Imperial Plate Shoulders -- 16646
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id1val11id3val380id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16646, 265, 12428, 2, 2018)
	self:addTradeFlags(RecipeDB, 16646, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16646, 4, 7659)

	-- Imperial Plate Belt -- 16647
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id1val11id3val285id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16647, 265, 12424, 2, 2018)
	self:addTradeFlags(RecipeDB, 16647, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16647, 4, 7653)

	-- Radiant Breastplate -- 16648
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val293id6val16id35val16id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16648, 270, 12415, 2, 2018)
	self:addTradeFlags(RecipeDB, 16648, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16648, 7, 2)

	-- Imperial Plate Bracers -- 16649
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val9id1val8id3val225id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16649, 270, 12425, 2, 2018)
	self:addTradeFlags(RecipeDB, 16649, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16649, 4, 7655)

	-- Wildthorn Mail -- 16650
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id3val11id5val322id6val34id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16650, 270, 12624, 2, 2018)
	self:addTradeFlags(RecipeDB, 16650, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16650, 7, 2)

	-- Thorium Shield Spike -- 16651
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16651, 275, 12645, 2, 2018)
	self:addTradeFlags(RecipeDB, 16651, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 16651, 7, 2)

	-- Thorium Boots -- 16652
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val367id6val7id32val7id33val7id34val7id35val7id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16652, 280, 12409, 2, 2018)
	self:addTradeFlags(RecipeDB, 16652, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16652, 7, 2)

	-- Thorium Helm -- 16653
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val434id6val10id32val10id33val10id34val10id35val10id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16653, 280, 12410, 2, 2018)
	self:addTradeFlags(RecipeDB, 16653, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16653, 7, 2)

	-- Radiant Gloves -- 16654
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val192id6val12id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16654, 285, 12418, 2, 2018)
	self:addTradeFlags(RecipeDB, 16654, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16654, 7, 2)

	-- Fiery Plate Gauntlets -- 16655
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val379id6val10id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16655, 290, 12631, 3, 2018)
	self:addTradeFlags(RecipeDB, 16655, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16655, 4, 5124)

	-- Radiant Boots -- 16656
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val215id6val15id35val15id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16656, 290, 12419, 2, 2018)
	self:addTradeFlags(RecipeDB, 16656, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16656, 7, 2)

	-- Imperial Plate Boots -- 16657
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val13id1val12id3val386id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16657, 295, 12426, 2, 2018)
	self:addTradeFlags(RecipeDB, 16657, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16657, 4, 7654)

	-- Imperial Plate Helm -- 16658
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val18id1val17id3val456id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16658, 295, 12427, 2, 2018)
	self:addTradeFlags(RecipeDB, 16658, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16658, 4, 7657)

	-- Radiant Circlet -- 16659
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val258id6val18id35val18id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16659, 295, 12417, 2, 2018)
	self:addTradeFlags(RecipeDB, 16659, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16659, 7, 2)

	-- Dawnbringer Shoulders -- 16660
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val10id5val455id6val15id19val44id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16660, 290, 12625, 3, 2018)
	self:addTradeFlags(RecipeDB, 16660, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,59)
	self:addTradeAcquire(RecipeDB, 16660, 7, 3)

	-- Storm Gauntlets -- 16661
	-- World Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id4val218id6val21id19val10id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16661, 295, 12632, 3, 2018)
	self:addTradeFlags(RecipeDB, 16661, 1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16661, 7, 3, 2, 11278)

	-- Thorium Leggings -- 16662
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val499id6val10id32val10id33val10id34val10id35val10id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16662, 300, 12414, 2, 2018)
	self:addTradeFlags(RecipeDB, 16662, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16662, 7, 2)

	-- Imperial Plate Chest -- 16663
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val18id1val17id3val570id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16663, 300, 12422, 2, 2018)
	self:addTradeFlags(RecipeDB, 16663, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16663, 4, 7656)

	-- Runic Plate Shoulders -- 16664
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16664, 300, 12610, 2, 2018)
	self:addTradeFlags(RecipeDB, 16664, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Runic Plate Boots -- 16665
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16665, 300, 12611, 2, 2018)
	self:addTradeFlags(RecipeDB, 16665, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Demon Forged Breastplate -- 16667
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id3val597id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16667, 285, 12628, 3, 2018)
	self:addTradeFlags(RecipeDB, 16667, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16667, 4, 5127)

	-- Whitesoul Helm -- 16724
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val15id4val15id5val629id6val12id19val35id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16724, 300, 12633, 3, 2018)
	self:addTradeFlags(RecipeDB, 16724, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,59)
	self:addTradeAcquire(RecipeDB, 16724, 7, 3)

	-- Radiant Leggings -- 16725
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val286id6val18id35val18id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16725, 300, 12420, 2, 2018)
	self:addTradeFlags(RecipeDB, 16725, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16725, 7, 2)

	-- Runic Plate Helm -- 16726
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val621id6val13id33val13id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16726, 300, 12612, 2, 2018)
	self:addTradeFlags(RecipeDB, 16726, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16726, 3, 4364)

	-- Helm of the Great Chief -- 16728
	-- Raid: 2159 - Onyxia's Lair
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val30id5val292id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16728, 300, 12636, 3, 2018)
	self:addTradeFlags(RecipeDB, 16728, 6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 16728, 3, 6109, 3, 10184, 3, 14887, 3, 14888, 3, 14890)

	-- Lionheart Helm -- 16729
	-- Raid: 2677 - Blackwing Lair
	-- Raid: 2159 - Onyxia's Lair
	-- Instance: 3714 - expansion1type5minlevel70category3nameHellfire Citadel: The Shattered Hallsterritory1id3714
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val18id1val645id6val28id11val20id17val28id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16729, 300, 12640, 4, 2018)
	self:addTradeFlags(RecipeDB, 16729, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 16729, 3, 6109, 3, 6560, 3, 10184, 3, 11583, 3, 14888, 3, 17694)

	-- Imperial Plate Leggings -- 16730
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val18id1val18id3val507id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16730, 300, 12429, 2, 2018)
	self:addTradeFlags(RecipeDB, 16730, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16730, 4, 7658)

	-- Runic Breastplate -- 16731
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16731, 300, 12613, 2, 2018)
	self:addTradeFlags(RecipeDB, 16731, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Runic Plate Leggings -- 16732
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val665id6val14id33val14id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16732, 300, 12614, 2, 2018)
	self:addTradeFlags(RecipeDB, 16732, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 16732, 3, 1885)

	-- Stronghold Gauntlets -- 16741
	-- Raid: 2717 - Molten Core
	-- Raid: 2159 - Onyxia's Lair
	-- Instance: 2057 - type1minlevel58category3maxlevel60nameScholomanceterritory1id2057
	-- Raid: 3428 - Ahn'Qiraj
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val504id6val14id11val14id18val20id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16741, 300, 12639, 4, 2018)
	self:addTradeFlags(RecipeDB, 16741, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,59)
	self:addTradeAcquire(RecipeDB, 16741, 3, 5107, 3, 6109, 3, 10184, 3, 10500, 3, 11658, 3, 14887, 3, 14889, 3, 15233)

	-- Enchanted Thorium Helm -- 16742
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id1val25id3val526id6val13id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16742, 300, 12620, 3, 2018)
	self:addTradeFlags(RecipeDB, 16742, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 16742, 4, 7651)

	-- Enchanted Thorium Leggings -- 16744
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val20id1val21id3val575id6val12id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16744, 300, 12619, 3, 2018)
	self:addTradeFlags(RecipeDB, 16744, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 16744, 4, 7650)

	-- Enchanted Thorium Breastplate -- 16745
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id1val26id3val657id6val13id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16745, 300, 12618, 3, 2018)
	self:addTradeFlags(RecipeDB, 16745, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 16745, 4, 7649)

	-- Invulnerable Mail -- 16746
	-- Raid: 2677 - Blackwing Lair
	-- Instance: 1583 - type1minlevel58category3maxlevel60nameBlackrock Spireterritory1id1583
	-- Raid: 2159 - Onyxia's Lair
	-- Instance: 2057 - type1minlevel58category3maxlevel60nameScholomanceterritory1id2057
	-- Raid: 1977 - Zul'Gurub
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: Tanking, 
	-- Item Stats: val611id6val20id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16746, 300, 12641, 4, 2018)
	self:addTradeFlags(RecipeDB, 16746, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,58)
	self:addTradeAcquire(RecipeDB, 16746, 3, 10184, 3, 10508, 3, 10899, 3, 11370, 3, 11583, 3, 14887, 3, 14890, 3, 19034)

	-- Thorium Greatsword -- 16960
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val22id1val116-175id7val3.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16960, 260, 12764, 2, 2018)
	self:addTradeFlags(RecipeDB, 16960, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	-- No acquire information

	-- Bleakwood Hew -- 16965
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val11id1val5id3val100-151id7val2.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16965, 270, 12769, 3, 2018)
	self:addTradeFlags(RecipeDB, 16965, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	-- No acquire information

	-- Inlaid Thorium Hammer -- 16967
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val23id1val100-151id7val3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16967, 270, 12772, 2, 2018)
	self:addTradeFlags(RecipeDB, 16967, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	-- No acquire information

	-- Ornate Thorium Handaxe -- 16969
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val10id1val43-81id7val1.9id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16969, 275, 12773, 2, 2018)
	self:addTradeFlags(RecipeDB, 16969, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,46,68)
	self:addTradeAcquire(RecipeDB, 16969, 2, 11278)

	-- Dawn's Edge -- 16970
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val53-100id7val2.1id8val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16970, 275, 12774, 3, 2018)
	self:addTradeFlags(RecipeDB, 16970, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 16970, 4, 5306)

	-- Huge Thorium Battleaxe -- 16971
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val114-172id7val3.3id8val24id12
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16971, 280, 12775, 1, 2018)
	self:addTradeFlags(RecipeDB, 16971, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 16971, 2, 11278)

	-- Enchanted Battlehammer -- 16973
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val100-150id7val2.6id8val20id17val20id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16973, 280, 12776, 2, 2018)
	self:addTradeFlags(RecipeDB, 16973, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,46,47,52,63,70)
	self:addTradeAcquire(RecipeDB, 16973, 4, 5305)

	-- Blazing Rapier -- 16978
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val44-82id7val1.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16978, 280, 12777, 2, 2018)
	self:addTradeFlags(RecipeDB, 16978, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 16978, 4, 5307)

	-- Rune Edge -- 16980
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val5id1val5id2val5id3val54-102id7val2.3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16980, 285, 12779, 2, 2018)
	self:addTradeFlags(RecipeDB, 16980, 3,21,22,23,24,25,26,27,28,29,30,37,41,46,68)
	-- No acquire information

	-- Serenity -- 16983
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val52-98id7val2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16983, 285, 12781, 2, 2018)
	self:addTradeFlags(RecipeDB, 16983, 21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	-- No acquire information

	-- Volcanic Hammer -- 16984
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val60-113id7val2.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16984, 290, 12792, 2, 2018)
	self:addTradeFlags(RecipeDB, 16984, 11,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 16984, 3, 10119)

	-- Corruption -- 16985
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val30id1val30id3val-40id5val119-179id7val3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16985, 290, 12782, 1, 2018)
	self:addTradeFlags(RecipeDB, 16985, 21,22,23,24,25,26,27,28,29,30,37,41,46,69)
	-- No acquire information

	-- Blood Talon -- 16986
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Fist, 
	-- Item Stats: 
	-- Item Stats: val35-67id7val1.3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16986, 300, 12795, 3, 2018)
	self:addTradeFlags(RecipeDB, 16986, 3,21,22,23,24,25,26,27,28,29,30,37,41,46,79)
	-- No acquire information

	-- Darkspear -- 16987
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Polearm, 
	-- Item Stats: 
	-- Item Stats: val131-197id7val3.2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16987, 300, 12802, 3, 2018)
	self:addTradeFlags(RecipeDB, 16987, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,71)
	-- No acquire information

	-- Hammer of the Titans -- 16988
	-- Instance: 2017 - type1minlevel58category3maxlevel60nameStratholmeterritory1id2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val15id1val163-246id7val3.8id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16988, 300, 12796, 3, 2018)
	self:addTradeFlags(RecipeDB, 16988, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 16988, 3, 10438)

	-- Arcanite Champion -- 16990
	-- Instance: 1583 - type1minlevel58category3maxlevel60nameBlackrock Spireterritory1id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val129-194id7val3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16990, 300, 12790, 3, 2018)
	self:addTradeFlags(RecipeDB, 16990, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 16990, 3, 10899)

	-- Annihilator -- 16991
	-- Instance: 1583 - type1minlevel58category3maxlevel60nameBlackrock Spireterritory1id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val49-92id7val1.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16991, 300, 12798, 3, 2018)
	self:addTradeFlags(RecipeDB, 16991, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,68)
	self:addTradeAcquire(RecipeDB, 16991, 3, 9736)

	-- Frostguard -- 16992
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val66-124id7val2.3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16992, 300, 12797, 3, 2018)
	self:addTradeFlags(RecipeDB, 16992, 11,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 16992, 3, 1844)

	-- Masterwork Stormhammer -- 16993
	-- Instance: 1583 - type1minlevel58category3maxlevel60nameBlackrock Spireterritory1id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val58-108id7val2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16993, 300, 12794, 3, 2018)
	self:addTradeFlags(RecipeDB, 16993, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 16993, 3, 10899)

	-- Arcanite Reaper -- 16994
	-- Instance: 1583 - type1minlevel58category3maxlevel60nameBlackrock Spireterritory1id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val13id3val153-256id7val3.8id8val62id9val62id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16994, 300, 12784, 3, 2018)
	self:addTradeFlags(RecipeDB, 16994, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 16994, 3, 9596)

	-- Heartseeker -- 16995
	-- Instance: 2017 - type1minlevel58category3maxlevel60nameStratholmeterritory1id2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Dagger, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val4id1val49-92id7val1.7id8val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 16995, 300, 12783, 3, 2018)
	self:addTradeFlags(RecipeDB, 16995, 5,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,72)
	self:addTradeAcquire(RecipeDB, 16995, 3, 10997)

	-- Silver Skeleton Key -- 19666
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19666, 80, 15869, 1, 2018)
	self:addTradeFlags(RecipeDB, 19666, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19666, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Golden Skeleton Key -- 19667
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19667, 130, 15870, 1, 2018)
	self:addTradeFlags(RecipeDB, 19667, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19667, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Truesilver Skeleton Key -- 19668
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19668, 180, 15871, 1, 2018)
	self:addTradeFlags(RecipeDB, 19668, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19668, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Arcanite Skeleton Key -- 19669
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19669, 265, 15872, 1, 2018)
	self:addTradeFlags(RecipeDB, 19669, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19669, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Arcanite Rod -- 20201
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20201, 265, 16206, 1, 2018)
	self:addTradeFlags(RecipeDB, 20201, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20201, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Fiery Chain Girdle -- 20872
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val9id4val8id5val245id6val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20872, 295, 16989, 3, 2018)
	self:addTradeFlags(RecipeDB, 20872, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 20872, 2, 12944)

	-- Fiery Chain Shoulders -- 20873
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val14id4val341id6val25id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20873, 300, 16988, 3, 2018)
	self:addTradeFlags(RecipeDB, 20873, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 20873, 2, 12944)

	-- Dark Iron Bracers -- 20874
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val7id3val436id6val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20874, 295, 17014, 3, 2018)
	self:addTradeFlags(RecipeDB, 20874, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 20874, 2, 12944)

	-- Dark Iron Leggings -- 20876
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val14id3val863id6val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20876, 300, 17013, 3, 2018)
	self:addTradeFlags(RecipeDB, 20876, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 20876, 2, 12944)

	-- Dark Iron Reaver -- 20890
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val10id3val71-134id7val2.4id8val6id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20890, 300, 17015, 3, 2018)
	self:addTradeFlags(RecipeDB, 20890, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,46,69)
	self:addTradeAcquire(RecipeDB, 20890, 2, 12944)

	-- Dark Iron Destroyer -- 20897
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val10id1val71-134id7val2.4id8val6id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20897, 300, 17016, 3, 2018)
	self:addTradeFlags(RecipeDB, 20897, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 20897, 2, 12944)

	-- Sulfuron Hammer -- 21161
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val176-295id7val3.7id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21161, 300, 17193, 4, 2018)
	self:addTradeFlags(RecipeDB, 21161, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 21161, 4, 7604)

	-- Edge of Winter -- 21913
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val3id3val30-56id7val2.1id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21913, 190, 17704, 2, 2018)
	self:addTradeFlags(RecipeDB, 21913, 3,7,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 21913, 5, 1)

	-- Elemental Sharpening Stone -- 22757
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22757, 280, 18262, 3, 2018)
	self:addTradeFlags(RecipeDB, 22757, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22757, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Heavy Timbermaw Belt -- 23628
	-- Timbermaw Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id3val193id6val42id9val42id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23628, 290, 19043, 1, 2018)
	self:addTradeFlags(RecipeDB, 23628, 4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,99)
	self:addTradeAcquire(RecipeDB, 23628, 6, 576, 2, 11557)

	-- Heavy Timbermaw Boots -- 23629
	-- Timbermaw Hold - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val23id3val258id6val20id9val20id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23629, 300, 19048, 1, 2018)
	self:addTradeFlags(RecipeDB, 23629, 4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,99)
	self:addTradeAcquire(RecipeDB, 23629, 6, 576, 3, 11557)

	-- Girdle of the Dawn -- 23632
	-- Argent Dawn - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val21id1val9id3val341id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23632, 290, 19051, 1, 2018)
	self:addTradeFlags(RecipeDB, 23632, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,96)
	self:addTradeAcquire(RecipeDB, 23632, 6, 529, 2, 10856, 6, 529, 2, 10857, 6, 529, 2, 11536)

	-- Gloves of the Dawn -- 23633
	-- Argent Dawn - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val23id1val10id3val417id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23633, 300, 19057, 1, 2018)
	self:addTradeFlags(RecipeDB, 23633, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,96)
	self:addTradeAcquire(RecipeDB, 23633, 6, 529, 3, 10856, 6, 529, 3, 10857, 6, 529, 3, 11536)

	-- Dark Iron Helm -- 23636
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val20id3val845id6val35id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23636, 300, 19148, 1, 2018)
	self:addTradeFlags(RecipeDB, 23636, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 23636, 2, 12944)

	-- Dark Iron Gauntlets -- 23637
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val12id2val16id3val565id6val28id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23637, 300, 19164, 1, 2018)
	self:addTradeFlags(RecipeDB, 23637, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 23637, 2, 12944)

	-- Black Amnesty -- 23638
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Dagger, 
	-- Item Stats: 
	-- Item Stats: val53-100id7val1.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23638, 300, 19166, 1, 2018)
	self:addTradeFlags(RecipeDB, 23638, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,46,72)
	self:addTradeAcquire(RecipeDB, 23638, 2, 12944)

	-- Blackfury -- 23639
	-- Instance: 1584 - type1minlevel55category3maxlevel60nameBlackrock Depthsterritory1id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Polearm, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val35id1val15id3val105-158id7val2.1id8val14id11val14id18val10id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23639, 300, 19167, 1, 2018)
	self:addTradeFlags(RecipeDB, 23639, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63,71)
	self:addTradeAcquire(RecipeDB, 23639, 2, 12944)

	-- Ebon Hand -- 23650
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val9id3val90-168id7val2.5id8val7id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23650, 300, 19170, 1, 2018)
	self:addTradeFlags(RecipeDB, 23650, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,70)
	-- No acquire information

	-- Blackguard -- 23652
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val9id3val65-121id7val1.8id8val20id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23652, 300, 19168, 1, 2018)
	self:addTradeFlags(RecipeDB, 23652, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,52,63,69)
	-- No acquire information

	-- Nightfall -- 23653
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val187-282id7val3.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23653, 300, 19169, 1, 2018)
	self:addTradeFlags(RecipeDB, 23653, 3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	-- No acquire information

	-- Bloodsoul Breastplate -- 24136
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id2val13id3val381id6val28id11val28id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24136, 300, 19690, 1, 2018)
	self:addTradeFlags(RecipeDB, 24136, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,100)
	self:addTradeAcquire(RecipeDB, 24136, 6, 270, 3, 14921)

	-- Bloodsoul Shoulders -- 24137
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val24id2val10id3val286id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24137, 300, 19691, 1, 2018)
	self:addTradeFlags(RecipeDB, 24137, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,100)
	self:addTradeAcquire(RecipeDB, 24137, 6, 270, 2, 14921)

	-- Bloodsoul Gauntlets -- 24138
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id2val17id3val238id6val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24138, 300, 19692, 1, 2018)
	self:addTradeFlags(RecipeDB, 24138, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,100)
	self:addTradeAcquire(RecipeDB, 24138, 6, 270, 1, 14921)

	-- Darksoul Breastplate -- 24139
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val32id3val736id6val10id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24139, 300, 19693, 1, 2018)
	self:addTradeFlags(RecipeDB, 24139, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,100)
	self:addTradeAcquire(RecipeDB, 24139, 6, 270, 3, 14921)

	-- Darksoul Leggings -- 24140
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val22id3val722id6val20id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24140, 300, 19694, 1, 2018)
	self:addTradeFlags(RecipeDB, 24140, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,100)
	self:addTradeAcquire(RecipeDB, 24140, 6, 270, 2, 14921)

	-- Darksoul Shoulders -- 24141
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val24id3val507id6val10id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24141, 300, 19695, 1, 2018)
	self:addTradeFlags(RecipeDB, 24141, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,100)
	self:addTradeAcquire(RecipeDB, 24141, 6, 270, 1, 14921)

	-- Dark Iron Boots -- 24399
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val741id6val28id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24399, 300, 20039, 1, 2018)
	self:addTradeFlags(RecipeDB, 24399, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	-- No acquire information

	-- Darkrune Gauntlets -- 24912
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id3val410id6val10id28val20id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24912, 300, 20549, 3, 2018)
	self:addTradeFlags(RecipeDB, 24912, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,59)
	self:addTradeAcquire(RecipeDB, 24912, 3, 19517, 3, 23392)

	-- Darkrune Helm -- 24913
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val13id3val534id6val14id11val14id18val25id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24913, 300, 20551, 3, 2018)
	self:addTradeFlags(RecipeDB, 24913, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 24913, 3, 19239)

	-- Darkrune Breastplate -- 24914
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val14id3val657id6val12id26val25id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24914, 300, 20550, 3, 2018)
	self:addTradeFlags(RecipeDB, 24914, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,59)
	self:addTradeAcquire(RecipeDB, 24914, 3, 4553, 3, 19517)

	-- Heavy Obsidian Belt -- 27585
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val25id1val397id6val5id32val5id33val5id34val5id35val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27585, 300, 22197, 1, 2018)
	self:addTradeFlags(RecipeDB, 27585, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,97)
	self:addTradeAcquire(RecipeDB, 27585, 6, 609, 1, 15176)

	-- Jagged Obsidian Shield -- 27586
	-- Cenarion Circle - Revered
	-- Raid: 3429 - Ruins of Ahn'Qiraj
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Shield, 
	-- Item Stats: Tanking, 
	-- Item Stats: val3040id6val9id28val5id32val5id33val5id34val5id35val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27586, 300, 22198, 1, 2018)
	self:addTradeFlags(RecipeDB, 27586, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,52,64,97)
	self:addTradeAcquire(RecipeDB, 27586, 6, 609, 3, 15471)

	-- Thick Obsidian Breastplate -- 27587
	-- Raid: 3428 - Ahn'Qiraj
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val38id1val16id3val929id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27587, 300, 22196, 3, 2018)
	self:addTradeFlags(RecipeDB, 27587, 6,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 27587, 3, 15263)

	-- Light Obsidian Belt -- 27588
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val224id6val32id9val14id11val32id16val14id18val5id32val5id33val5id34val5id35val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27588, 300, 22195, 1, 2018)
	self:addTradeFlags(RecipeDB, 27588, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 27588, 6, 609, 2, 15176)

	-- Black Grasp of the Destroyer -- 27589
	-- Raid: 3429 - Ruins of Ahn'Qiraj
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val318id6val28id9val14id11val28id16val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27589, 300, 22194, 3, 2018)
	self:addTradeFlags(RecipeDB, 27589, 6,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 27589, 3, 15340)

	-- Obsidian Mail Tunic -- 27590
	-- Cenarion Circle - Exalted
	-- Raid: 3429 - Ruins of Ahn'Qiraj
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val523id6val76id9val14id11val76id16val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27590, 300, 22191, 1, 2018)
	self:addTradeFlags(RecipeDB, 27590, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 27590, 6, 609, 4, 15471)

	-- Titanic Leggings -- 27829
	-- Raid: 2677 - Blackwing Lair
	-- Raid: 2159 - Onyxia's Lair
	-- Instance: 2017 - type1minlevel58category3maxlevel60nameStratholmeterritory1id2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val30id1val683id6val14id11val20id17val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27829, 300, 22385, 4, 2018)
	self:addTradeFlags(RecipeDB, 27829, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 27829, 3, 6109, 3, 7523, 3, 8598, 3, 10184, 3, 10398, 3, 11583, 3, 14890)

	-- Persuader -- 27830
	-- Raid: 2159 - Onyxia's Lair
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val86-161id7val2.7id8val14id11val10id17val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27830, 300, 22384, 4, 2018)
	self:addTradeFlags(RecipeDB, 27830, 6,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 27830, 3, 6109, 3, 10184, 3, 14887)

	-- Sageblade -- 27832
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val14id3val6id4val49-100id7val1.8id8val20id19val20id20val10id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27832, 300, 22383, 4, 2018)
	self:addTradeFlags(RecipeDB, 27832, 11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,54,63,69)
	self:addTradeAcquire(RecipeDB, 27832, 3, 6109, 3, 14887, 3, 14890)

	-- Icebane Breastplate -- 28242
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id1val24id3val1027id6val12id31val42id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28242, 300, 22669, 4, 2018)
	self:addTradeFlags(RecipeDB, 28242, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Icebane Gauntlets -- 28243
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val9id1val18id3val642id6val8id31val32id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28243, 300, 22670, 4, 2018)
	self:addTradeFlags(RecipeDB, 28243, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Icebane Bracers -- 28244
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id1val13id3val449id6val7id31val24id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28244, 300, 22671, 4, 2018)
	self:addTradeFlags(RecipeDB, 28244, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Ironvine Breastplate -- 28461
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val15id3val726id6val10id31val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28461, 300, 22762, 1, 2018)
	self:addTradeFlags(RecipeDB, 28461, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,97)
	self:addTradeAcquire(RecipeDB, 28461, 6, 609, 3, 15176)

	-- Ironvine Gloves -- 28462
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val10id3val454id6val15id31val20id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28462, 300, 22763, 1, 2018)
	self:addTradeFlags(RecipeDB, 28462, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,97)
	self:addTradeAcquire(RecipeDB, 28462, 6, 609, 2, 15176)

	-- Ironvine Belt -- 28463
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val408id6val5id31val15id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28463, 300, 22764, 1, 2018)
	self:addTradeFlags(RecipeDB, 28463, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,97)
	self:addTradeAcquire(RecipeDB, 28463, 6, 609, 1, 15176)

	-- Fel Iron Plate Gloves -- 29545
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val24id1val21id3val524id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29545, 290, 23482, 1, 2018)
	self:addTradeFlags(RecipeDB, 29545, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29545, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Plate Belt -- 29547
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val21id1val30id3val471id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29547, 295, 23484, 1, 2018)
	self:addTradeFlags(RecipeDB, 29547, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29547, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Plate Boots -- 29548
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val23id1val30id3val612id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29548, 305, 23487, 1, 2018)
	self:addTradeFlags(RecipeDB, 29548, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29548, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Plate Pants -- 29549
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val34id1val33id3val779id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29549, 305, 23488, 1, 2018)
	self:addTradeFlags(RecipeDB, 29549, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29549, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Breastplate -- 29550
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val32id1val46id3val943id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29550, 315, 23489, 1, 2018)
	self:addTradeFlags(RecipeDB, 29550, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29550, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Chain Coif -- 29551
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val33id3val21id4val382id6val42id9val42id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29551, 290, 23493, 1, 2018)
	self:addTradeFlags(RecipeDB, 29551, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 29551, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Chain Gloves -- 29552
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val24id3val17id4val303id6val34id9val34id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29552, 300, 23491, 1, 2018)
	self:addTradeFlags(RecipeDB, 29552, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 29552, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Chain Bracers -- 29553
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val19id3val13id4val218id6val26id9val26id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29553, 305, 23494, 1, 2018)
	self:addTradeFlags(RecipeDB, 29553, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 29553, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Chain Tunic -- 29556
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val36id3val24id4val514id6val48id9val48id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29556, 310, 23490, 1, 2018)
	self:addTradeFlags(RecipeDB, 29556, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 29556, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Hatchet -- 29557
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val8id1val68-127id7val2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29557, 300, 23497, 1, 2018)
	self:addTradeFlags(RecipeDB, 29557, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 29557, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Hammer -- 29558
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val12id4val76-143id7val2.2id8val5id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29558, 305, 23498, 1, 2018)
	self:addTradeFlags(RecipeDB, 29558, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 29558, 1, 16583, 1, 16823, 1, 19341)

	-- Fel Iron Greatsword -- 29565
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val172-259id7val3.2id8val62id9val30id11val62id16val30id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29565, 310, 23499, 1, 2018)
	self:addTradeFlags(RecipeDB, 29565, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 29565, 1, 16583, 1, 16823, 1, 19341)

	-- Adamantite Maul -- 29566
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val47id1val179-269id7val3.2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29566, 315, 23502, 1, 2018)
	self:addTradeFlags(RecipeDB, 29566, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,70)
	self:addTradeAcquire(RecipeDB, 29566, 2, 16670, 2, 16713, 2, 19662)

	-- Adamantite Cleaver -- 29568
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val25id2val39id3val203-305id7val3.5id8val52id9val52id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29568, 320, 23503, 1, 2018)
	self:addTradeFlags(RecipeDB, 29568, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 29568, 2, 16670, 2, 16713, 2, 19662)

	-- Adamantite Dagger -- 29569
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Dagger, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val74-138id7val1.9id8val10id11val10id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29569, 320, 23504, 1, 2018)
	self:addTradeFlags(RecipeDB, 29569, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,72)
	self:addTradeAcquire(RecipeDB, 29569, 2, 16670, 2, 16713, 2, 19662)

	-- Adamantite Rapier -- 29571
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val15id3val68-128id7val1.7id8val16id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29571, 325, 23505, 1, 2018)
	self:addTradeFlags(RecipeDB, 29571, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,47,52,63,69)
	self:addTradeAcquire(RecipeDB, 29571, 2, 16670, 2, 16713, 2, 19662)

	-- Adamantite Plate Bracers -- 29603
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val22id1val24id3val458id6val4id9val4id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29603, 325, 23506, 1, 2018)
	self:addTradeFlags(RecipeDB, 29603, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 29603, 2, 19342, 2, 19694)

	-- Adamantite Plate Gloves -- 29605
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val24id1val34id3val655id6val6id9val6id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29605, 325, 23508, 1, 2018)
	self:addTradeFlags(RecipeDB, 29605, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 29605, 2, 19342, 2, 19694)

	-- Adamantite Breastplate -- 29606
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val34id1val40id3val1077id6val8id9val8id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29606, 330, 23507, 1, 2018)
	self:addTradeFlags(RecipeDB, 29606, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 29606, 2, 19342, 2, 19694)

	-- Enchanted Adamantite Belt -- 29608
	-- The Scryers - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val21id3val644id6val3id31val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29608, 345, 23510, 1, 2018)
	self:addTradeFlags(RecipeDB, 29608, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,110)
	self:addTradeAcquire(RecipeDB, 29608, 6, 934, 1, 19331)

	-- Enchanted Adamantite Breastplate -- 29610
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val27id3val1154id6val40id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29610, 350, 23509, 1, 2018)
	self:addTradeFlags(RecipeDB, 29610, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,110)
	self:addTradeAcquire(RecipeDB, 29610, 6, 934, 3, 19331)

	-- Enchanted Adamantite Boots -- 29611
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val21id3val787id6val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29611, 345, 23511, 1, 2018)
	self:addTradeFlags(RecipeDB, 29611, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,110)
	self:addTradeAcquire(RecipeDB, 29611, 6, 934, 2, 19331)

	-- Enchanted Adamantite Leggings -- 29613
	-- The Scryers - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val27id3val1019id6val4id31val40id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29613, 355, 23512, 1, 2018)
	self:addTradeFlags(RecipeDB, 29613, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,110)
	self:addTradeAcquire(RecipeDB, 29613, 6, 934, 4, 19331)

	-- Flamebane Bracers -- 29614
	-- The Aldor - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val15id3val497id6val28id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29614, 340, 23515, 1, 2018)
	self:addTradeFlags(RecipeDB, 29614, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,101)
	self:addTradeAcquire(RecipeDB, 29614, 6, 932, 1, 19321)

	-- Flamebane Helm -- 29615
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val19id3val930id6val40id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29615, 345, 23516, 1, 2018)
	self:addTradeFlags(RecipeDB, 29615, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,101)
	self:addTradeAcquire(RecipeDB, 29615, 6, 932, 4, 19321)

	-- Flamebane Gloves -- 29616
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val21id3val722id6val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29616, 350, 23514, 1, 2018)
	self:addTradeFlags(RecipeDB, 29616, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,101)
	self:addTradeAcquire(RecipeDB, 29616, 6, 932, 2, 19321)

	-- Flamebane Breastplate -- 29617
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val19id3val1164id6val4id31val40id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29617, 355, 23513, 1, 2018)
	self:addTradeFlags(RecipeDB, 29617, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,101)
	self:addTradeAcquire(RecipeDB, 29617, 6, 932, 3, 19321)

	-- Felsteel Gloves -- 29619
	-- Instance: 3790 - expansion1type5minlevel65category3maxlevel67nameAuchindoun: Auchenai Cryptsterritory1id3790
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val27id3val943id6val25id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29619, 350, 23517, 3, 2018)
	self:addTradeFlags(RecipeDB, 29619, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 29619, 3, 18497)

	-- Felsteel Leggings -- 29620
	-- Instance: 3848 - expansion1type5minlevel70category3nameTempest Keep: The Arcatrazterritory1id3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val39id3val1257id6val33id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29620, 350, 23518, 3, 2018)
	self:addTradeFlags(RecipeDB, 29620, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 29620, 3, 20900)

	-- Felsteel Helm -- 29621
	-- Instance: 3789 - expansion1type5minlevel70category3nameAuchindoun: Shadow Labrynthterritory1id3789
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val27id3val1284id6val33id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29621, 355, 23519, 3, 2018)
	self:addTradeFlags(RecipeDB, 29621, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 29621, 3, 18830)

	-- Gauntlets of the Iron Tower -- 29622
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val30id3val831id6val26id29val20id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29622, 355, 23532, 4, 2018)
	self:addTradeFlags(RecipeDB, 29622, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,59)
	self:addTradeAcquire(RecipeDB, 29622, 7, 4)

	-- Khorium Belt -- 29628
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val21id4val649id6val25id19val25id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29628, 350, 23524, 3, 2018)
	self:addTradeFlags(RecipeDB, 29628, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,59)
	self:addTradeAcquire(RecipeDB, 29628, 3, 18203)

	-- Khorium Pants -- 29629
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val42id3val28id4val1010id6val33id19val33id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29629, 350, 23523, 3, 2018)
	self:addTradeFlags(RecipeDB, 29629, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,59)
	self:addTradeAcquire(RecipeDB, 29629, 3, 20878)

	-- Khorium Boots -- 29630
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val31id3val21id4val800id6val26id19val26id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29630, 355, 23525, 3, 2018)
	self:addTradeFlags(RecipeDB, 29630, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,59)
	self:addTradeAcquire(RecipeDB, 29630, 3, 18873)

	-- Ragesteel Gloves -- 29642
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val35id1val728id6val27id11val27id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29642, 355, 23520, 3, 2018)
	self:addTradeFlags(RecipeDB, 29642, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29642, 3, 17136)

	-- Ragesteel Helm -- 29643
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val45id1val946id6val37id11val37id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29643, 355, 23521, 3, 2018)
	self:addTradeFlags(RecipeDB, 29643, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29643, 3, 16952)

	-- Ragesteel Breastplate -- 29645
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val50id1val1164id6val29id11val29id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29645, 360, 23522, 3, 2018)
	self:addTradeFlags(RecipeDB, 29645, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 29645, 3, 21454, 3, 23305, 3, 23324)

	-- Swiftsteel Gloves -- 29648
	-- Instance: 3792 - expansion1type5minlevel64category3maxlevel66nameAuchindoun: Mana-Tombsterritory1id3792
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val3id2val407id6val50id9val50id16val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29648, 360, 23526, 3, 2018)
	self:addTradeFlags(RecipeDB, 29648, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 29648, 3, 18314)

	-- Earthpeace Breastplate -- 29649
	-- Instance: 3847 - expansion1type5minlevel70category3nameTempest Keep: The Botanicaterritory1id3847
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val652id6val31id19val92id20val16id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29649, 360, 23527, 3, 2018)
	self:addTradeFlags(RecipeDB, 29649, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,53,58)
	self:addTradeAcquire(RecipeDB, 29649, 3, 17975)

	-- Fel Sharpening Stone -- 29654
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29654, 290, 23528, 1, 2018)
	self:addTradeFlags(RecipeDB, 29654, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29654, 1, 16583, 1, 16823, 1, 19341)

	-- Adamantite Sharpening Stone -- 29656
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29656, 340, 23529, 1, 2018)
	self:addTradeFlags(RecipeDB, 29656, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 29656, 6, 942, 2, 17904)

	-- Felsteel Shield Spike -- 29657
	-- Honor Hold - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29657, 350, 23530, 1, 2018)
	self:addTradeFlags(RecipeDB, 29657, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB, 29657, 6, 946, 4, 17657)

	-- Felfury Gauntlets -- 29658
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val465id6val40id9val27id11val40id16val27id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29658, 355, 23531, 4, 2018)
	self:addTradeFlags(RecipeDB, 29658, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 29658, 7, 4)

	-- Steelgrip Gauntlets -- 29662
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val28id1val36id3val831id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29662, 355, 23533, 4, 2018)
	self:addTradeFlags(RecipeDB, 29662, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 29662, 7, 4)

	-- Storm Helm -- 29663
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val21id3val28id4val604id6val44id9val22id11val44id16val22id18val9id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29663, 355, 23534, 4, 2018)
	self:addTradeFlags(RecipeDB, 29663, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 29663, 7, 4)

	-- Helm of the Stalwart Defender -- 29664
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val47id3val1366id6val23id29val23id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29664, 355, 23535, 4, 2018)
	self:addTradeFlags(RecipeDB, 29664, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,59)
	self:addTradeAcquire(RecipeDB, 29664, 7, 4)

	-- Oathkeeper's Helm -- 29668
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, Caster DPS, 
	-- Item Stats: val40id3val22id4val1080id6val26id19val26id20val9id24val15id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29668, 355, 23536, 4, 2018)
	self:addTradeFlags(RecipeDB, 29668, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,54,59)
	self:addTradeAcquire(RecipeDB, 29668, 7, 4)

	-- Black Felsteel Bracers -- 29669
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val26id1val15id3val581id6val22id11val22id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29669, 355, 23537, 4, 2018)
	self:addTradeFlags(RecipeDB, 29669, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,59)
	self:addTradeAcquire(RecipeDB, 29669, 7, 4)

	-- Bracers of the Green Fortress -- 29671
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val39id3val581id6val10id26val17id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29671, 355, 23538, 4, 2018)
	self:addTradeFlags(RecipeDB, 29671, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,59)
	self:addTradeAcquire(RecipeDB, 29671, 7, 4)

	-- Blessed Bracers -- 29672
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val12id3val14id4val581id6val19id19val57id20val18id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29672, 355, 23539, 4, 2018)
	self:addTradeFlags(RecipeDB, 29672, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,59)
	self:addTradeAcquire(RecipeDB, 29672, 7, 4)

	-- Felsteel Longblade -- 29692
	-- Raid: 3845 - Tempest Keep
	-- Raid: 3607 - Coilfang Reservoir: Serpentshrine Cavern
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3848 - expansion1type5minlevel70category3nameTempest Keep: The Arcatrazterritory1id3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val26id2val15id3val128-239id7val2.2id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29692, 355, 23540, 4, 2018)
	self:addTradeFlags(RecipeDB, 29692, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 29692, 3, 15547, 3, 16171, 3, 18260, 3, 19779, 3, 20036, 3, 20714, 3, 20910, 3, 21298, 3, 22052)

	-- Khorium Champion -- 29693
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val50id1val286-430id7val3.3id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29693, 355, 23541, 4, 2018)
	self:addTradeFlags(RecipeDB, 29693, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 29693, 7, 4)

	-- Fel Edged Battleaxe -- 29694
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val128-239id7val2.2id8val21id11val21id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29694, 355, 23542, 4, 2018)
	self:addTradeFlags(RecipeDB, 29694, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 29694, 7, 4)

	-- Felsteel Reaper -- 29695
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val295-443id7val3.4id8val112id9val30id11val112id16val30id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29695, 355, 23543, 4, 2018)
	self:addTradeFlags(RecipeDB, 29695, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 29695, 7, 4)

	-- Runic Hammer -- 29696
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val16id3val140-261id7val2.4id8val50id9val50id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29696, 355, 23544, 4, 2018)
	self:addTradeFlags(RecipeDB, 29696, 6,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 29696, 3, 16409, 3, 16525, 3, 20514, 3, 21941)

	-- Fel Hardened Maul -- 29697
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val50id1val46id3val286-430id7val3.3id8val21id11val21id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29697, 355, 23546, 4, 2018)
	self:addTradeFlags(RecipeDB, 29697, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 29697, 7, 4)

	-- Eternium Runed Blade -- 29698
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Dagger, Armor, Trinket, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val19id4val27.6-113.6id7val1.7id8val168id19val168id20val21id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29698, 355, 23554, 4, 2018)
	self:addTradeFlags(RecipeDB, 29698, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,54,63,72)
	self:addTradeAcquire(RecipeDB, 29698, 7, 4)

	-- Dirge -- 29699
	-- Raid: 3457 - Karazhan
	-- Raid: 3607 - Coilfang Reservoir: Serpentshrine Cavern
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Dagger, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val81-152id7val1.4id8val40id9val20id11val40id16val20id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29699, 355, 23555, 4, 2018)
	self:addTradeFlags(RecipeDB, 29699, 6,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63,72)
	self:addTradeAcquire(RecipeDB, 29699, 3, 16409, 3, 16460, 3, 16595, 3, 18554, 3, 21229, 3, 22254, 3, 22384)

	-- Hand of Eternity -- 29700
	-- Instance: 3717 - expansion1type5minlevel62category3maxlevel64nameCoilfang Reservoir: The Slave Pensterritory1id3717
	-- Instance: 3847 - expansion1type5minlevel70category3nameTempest Keep: The Botanicaterritory1id3847
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: Healing, 
	-- Item Stats: val20id4val35.38-131.38id7val1.9id8val106id19val317id20val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29700, 355, 23556, 4, 2018)
	self:addTradeFlags(RecipeDB, 29700, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,53,63,70)
	self:addTradeAcquire(RecipeDB, 29700, 3, 16409, 3, 17957, 3, 19513, 3, 19756, 3, 20496, 3, 22241, 3, 22394)

	-- Lesser Ward of Shielding -- 29728
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29728, 330, 23575, 1, 2018)
	self:addTradeFlags(RecipeDB, 29728, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 29728, 2, 16583, 2, 19373)

	-- Greater Ward of Shielding -- 29729
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29729, 375, 23576, 3, 2018)
	self:addTradeFlags(RecipeDB, 29729, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 29729, 3, 18853)

	-- Lesser Rune of Warding -- 32284
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32284, 315, 23559, 1, 2018)
	self:addTradeFlags(RecipeDB, 32284, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 32284, 1, 16583, 1, 16823, 1, 19341)

	-- Greater Rune of Warding -- 32285
	-- Instance: 3714 - expansion1type5minlevel70category3nameHellfire Citadel: The Shattered Hallsterritory1id3714
	-- Mob Drop
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32285, 340, 25521, 1, 2018)
	self:addTradeFlags(RecipeDB, 32285, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 32285, 3, 17671, 6, 942, 2, 17904)

	-- Fel Iron Rod -- 32655
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32655, 290, 25843, 1, 2018)
	self:addTradeFlags(RecipeDB, 32655, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 32655, 1, 16583, 1, 16823, 1, 19341)

	-- Adamantite Rod -- 32656
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32656, 340, 25844, 1, 2018)
	self:addTradeFlags(RecipeDB, 32656, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32656, 2, 19662)

	-- Eternium Rod -- 32657
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32657, 365, 25845, 1, 2018)
	self:addTradeFlags(RecipeDB, 32657, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32657, 2, 16583, 2, 19373)

	-- Nether Chain Shirt -- 34529
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id2val40id3val18id4val757id6val40id9val28id11val40id16val28id18val7id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 34529, 340, 23563, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 34529, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 34529, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Twisting Nether Chain Shirt -- 34530
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id2val48id3val22id4val893id6val68id9val33id11val68id16val33id18val9id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 34530, 365, 23564, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 34530, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 34530, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Breastplate of Kings -- 34533
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val31id1val46id3val1353id6val31id11val31id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 34533, 340, 28483, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 34533, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 34533, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Bulwark of Kings -- 34534
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val35id1val55id3val1595id6val37id11val37id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 34534, 365, 28484, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 34534, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 34534, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Fireguard -- 34535
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val16id2val23id3val94-176id7val1.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 34535, 340, 28425, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 34535, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 34535, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Blazeguard -- 34537
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val17id2val25id3val102-190id7val1.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 34537, 365, 28426, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 34537, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 34537, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Lionheart Blade -- 34538
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val47id1val42id2val315-474id7val3.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 34538, 340, 28428, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 34538, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 34538, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Lionheart Champion -- 34540
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val49id1val44id2val341-513id7val3.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 34540, 365, 28429, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 34540, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 34540, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- The Planar Edge -- 34541
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val159-296id7val2.7id8val42id9val20id11val42id16val20id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 34541, 340, 28431, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 34541, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 34541, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Black Planar Edge -- 34542
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val172-320id7val2.7id8val44id9val21id11val44id16val21id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 34542, 365, 28432, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 34542, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 34542, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Lunar Crescent -- 34543
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val324-487id7val3.7id8val96id9val47id11val96id16val47id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 34543, 340, 28434, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 34543, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 34543, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Mooncleaver -- 34544
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val351-527id7val3.7id8val106id9val52id11val106id16val52id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 34544, 365, 28435, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 34544, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 34544, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Drakefist Hammer -- 34545
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val159-296id7val2.7id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 34545, 340, 28437, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 34545, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,70)
	self:addTradeAcquire(RecipeDB, 34545, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Dragonmaw -- 34546
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val9id3val172-320id7val2.7id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 34546, 365, 28438, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 34546, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,70)
	self:addTradeAcquire(RecipeDB, 34546, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Thunder -- 34547
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val37id1val37id2val55id3val333-500id7val3.8id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 34547, 340, 28440, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 34547, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,70)
	self:addTradeAcquire(RecipeDB, 34547, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Deep Thunder -- 34548
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val37id1val37id2val55id3val360-541id7val3.8id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 34548, 365, 28441, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 34548, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,70)
	self:addTradeAcquire(RecipeDB, 34548, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Fel Weightstone -- 34607
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34607, 290, 28420, 1, 2018)
	self:addTradeFlags(RecipeDB, 34607, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 34607, 1, 16583, 1, 16823, 1, 19341)

	-- Adamantite Weightstone -- 34608
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34608, 340, 28421, 1, 2018)
	self:addTradeFlags(RecipeDB, 34608, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 34608, 6, 942, 2, 17904)

	-- Thick Bronze Darts -- 34979
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Thrown, 
	-- Item Stats: 
	-- Item Stats: val2id1val16-24id14val2.2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34979, 100, 29201, 1, 2018)
	self:addTradeFlags(RecipeDB, 34979, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 34979, 1, 1383, 1, 2836, 1, 2998, 1, 3136, 1, 3355, 1, 3478, 1, 4258, 1, 4596, 1, 5511, 1, 10276, 1, 16583, 1, 16669, 1, 16724, 1, 16823, 1, 19341)

	-- Whirling Steel Axes -- 34981
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val4id1val3id3val30-57id14val2.2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34981, 200, 29202, 1, 2018)
	self:addTradeFlags(RecipeDB, 34981, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,68)
	self:addTradeAcquire(RecipeDB, 34981, 1, 2836, 1, 3355, 1, 4258, 1, 16583, 1, 16669, 1, 16823, 1, 19341)

	-- Enchanted Thorium Blades -- 34982
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Thrown, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val6id2val10id9val49-92id14val2.2id15val10id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34982, 300, 29203, 1, 2018)
	self:addTradeFlags(RecipeDB, 34982, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63)
	self:addTradeAcquire(RecipeDB, 34982, 1, 2836, 1, 16583, 1, 16823, 1, 19341)

	-- Felsteel Whisper Knives -- 34983
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Thrown, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val20id9val10id11val134-135id14val2.2id15val20id16val10id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34983, 340, 29204, 1, 2018)
	self:addTradeFlags(RecipeDB, 34983, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63)
	self:addTradeAcquire(RecipeDB, 34983, 1, 16583, 1, 16823, 1, 19341)

	-- Earthforged Leggings -- 36122
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val16id1val10id2val24id3val479id6val10id31
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 36122, 260, 30069, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 36122, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 36122, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Windforged Leggings -- 36124
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val14id2val10id3val7id4val272id6val28id9val28id16val5id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 36124, 260, 30070, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 36124, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36124, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Light Earthforged Blade -- 36125
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val13id3val58-108id7val2.4id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 9787
	self:addTradeSkill(RecipeDB, 36125, 260, 30071, 1, 2018, 9787)
	self:addTradeFlags(RecipeDB, 36125, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,69)
	self:addTradeAcquire(RecipeDB, 36125, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Light Skyforged Axe -- 36126
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val60-113id7val2.5id8val13id11val13id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 9787
	self:addTradeSkill(RecipeDB, 36126, 260, 30072, 1, 2018, 9787)
	self:addTradeFlags(RecipeDB, 36126, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 36126, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Light Emberforged Hammer -- 36128
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val63-117id7val2.6id8val26id9val26id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 9787
	self:addTradeSkill(RecipeDB, 36128, 260, 30073, 1, 2018, 9787)
	self:addTradeFlags(RecipeDB, 36128, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 36128, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Heavy Earthforged Breastplate -- 36129
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val30id1val11id2val36id3val1018id6val11id31
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 36129, 320, 30074, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 36129, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 36129, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Stormforged Hauberk -- 36130
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val25id2val11id3val11id4val570id6val50id9val50id16val7id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 36130, 320, 30076, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 36130, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36130, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Windforged Rapier -- 36131
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val72-134id7val1.7id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 36131, 320, 30077, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 36131, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 36131, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Stoneforged Claymore -- 36133
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val40id1val35id2val207-311id7val3.3id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 36133, 320, 30086, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 36133, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,69)
	self:addTradeAcquire(RecipeDB, 36133, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Stormforged Axe -- 36134
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, 
	-- Item Stats: 
	-- Item Stats: val24id2val110-205id7val2.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 36134, 320, 30087, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 36134, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,68)
	self:addTradeAcquire(RecipeDB, 36134, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Skyforged Great Axe -- 36135
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val213-321id7val3.4id8val80id9val35id11val80id16val35id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 36135, 320, 30088, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 36135, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 36135, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Lavaforged Warhammer -- 36136
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val105-197id7val2.5id8val48id9val48id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 36136, 320, 30089, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 36136, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 36136, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Great Earthforged Hammer -- 36137
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val60id3val220-330id7val3.5id8val70id9val70id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 36137, 320, 30093, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 36137, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,70)
	self:addTradeAcquire(RecipeDB, 36137, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Embrace of the Twisting Nether -- 36256
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val4id2val56id3val27id4val1022id6val84id9val35id11val84id16val35id18val10id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 36256, 365, 23565, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 36256, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36256, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Bulwark of the Ancient Kings -- 36257
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val40id1val56id3val1825id6val41id11val41id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 9788
	self:addTradeSkill(RecipeDB, 36257, 365, 28485, 1, 2018, 9788)
	self:addTradeFlags(RecipeDB, 36257, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 36257, 1, 5164, 1, 7230, 1, 11177, 1, 20125)

	-- Blazefury -- 36258
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val19id2val28id3val109-203id7val1.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 36258, 365, 28427, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 36258, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 36258, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Lionheart Executioner -- 36259
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Sword, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val52id1val44id2val365-549id7val3.6id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17039
	self:addTradeSkill(RecipeDB, 36259, 365, 28430, 1, 2018, 17039)
	self:addTradeFlags(RecipeDB, 36259, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,69)
	self:addTradeAcquire(RecipeDB, 36259, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Wicked Edge of the Planes -- 36260
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val184-343id7val2.7id8val48id9val23id11val48id16val23id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 36260, 365, 28433, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 36260, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 36260, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Bloodmoon -- 36261
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Axe, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val375-564id7val3.7id8val112id9val56id11val112id16val56id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 17041
	self:addTradeSkill(RecipeDB, 36261, 365, 28436, 1, 2018, 17041)
	self:addTradeFlags(RecipeDB, 36261, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,47,63,68)
	self:addTradeAcquire(RecipeDB, 36261, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Dragonstrike -- 36262
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val19id3val184-343id7val2.7id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 36262, 365, 28439, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 36262, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,70)
	self:addTradeAcquire(RecipeDB, 36262, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Stormherald -- 36263
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Weapon, Mace, 
	-- Item Stats: 
	-- Item Stats: val42id1val42id2val61id3val386-579id7val3.8id8
	recipecount = recipecount + 1
	-- Recipe Specialty of 17040
	self:addTradeSkill(RecipeDB, 36263, 365, 28442, 1, 2018, 17040)
	self:addTradeFlags(RecipeDB, 36263, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,46,70)
	self:addTradeAcquire(RecipeDB, 36263, 1, 7231, 1, 7232, 1, 11146, 1, 11178, 1, 20124)

	-- Belt of the Guardian -- 36389
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, Caster DPS, 
	-- Item Stats: val48id3val13id4val904id6val21id19val21id20val19id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36389, 365, 30034, 4, 2018)
	self:addTradeFlags(RecipeDB, 36389, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,52,54,59)
	self:addTradeAcquire(RecipeDB, 36389, 7, 4)

	-- Red Belt of Battle -- 36390
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val41id1val21id3val904id6val24id11val24id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36390, 365, 30032, 4, 2018)
	self:addTradeFlags(RecipeDB, 36390, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 36390, 7, 4)

	-- Boots of the Protector -- 36391
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, Caster DPS, 
	-- Item Stats: val48id3val22id4val1105id6val27id19val27id20val17id28val26id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36391, 365, 30033, 4, 2018)
	self:addTradeFlags(RecipeDB, 36391, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,52,54,59)
	self:addTradeAcquire(RecipeDB, 36391, 7, 4)

	-- Red Havoc Boots -- 36392
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val49id3val1105id6val25id28val32id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36392, 365, 30031, 4, 2018)
	self:addTradeFlags(RecipeDB, 36392, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 36392, 7, 4)

	-- Wildguard Breastplate -- 38473
	-- Cenarion Expedition - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val45id3val1450id6val14id31val60id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38473, 365, 31364, 4, 2018)
	self:addTradeFlags(RecipeDB, 38473, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,103)
	self:addTradeAcquire(RecipeDB, 38473, 6, 942, 4, 17904)

	-- Wildguard Leggings -- 38475
	-- Cenarion Expedition - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val55id3val1269id6val60id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38475, 365, 31367, 4, 2018)
	self:addTradeFlags(RecipeDB, 38475, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,59,103)
	self:addTradeAcquire(RecipeDB, 38475, 6, 942, 3, 17904)

	-- Wildguard Helm -- 38476
	-- Cenarion Expedition - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val58id3val1178id6val28id31val50id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38476, 365, 31368, 4, 2018)
	self:addTradeFlags(RecipeDB, 38476, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,103)
	self:addTradeAcquire(RecipeDB, 38476, 6, 942, 3, 17904)

	-- Iceguard Breastplate -- 38477
	-- The Violet Eye - Honored
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val49id3val1450id6val10id31val60id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38477, 365, 31369, 4, 2018)
	self:addTradeFlags(RecipeDB, 38477, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,114)
	self:addTradeAcquire(RecipeDB, 38477, 6, 967, 2, 16388)

	-- Iceguard Leggings -- 38478
	-- The Violet Eye - Revered
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val55id3val1110id6val60id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38478, 365, 31370, 4, 2018)
	self:addTradeFlags(RecipeDB, 38478, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,59,114)
	self:addTradeAcquire(RecipeDB, 38478, 6, 967, 3, 16388)

	-- Iceguard Helm -- 38479
	-- The Violet Eye - Honored
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val64id3val1030id6val20id31val50id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38479, 365, 31371, 4, 2018)
	self:addTradeFlags(RecipeDB, 38479, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59,114)
	self:addTradeAcquire(RecipeDB, 38479, 6, 967, 2, 16388)

	-- Shadesteel Sabots -- 40033
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val40id3val1122id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40033, 365, 32402, 1, 2018)
	self:addTradeFlags(RecipeDB, 40033, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,59,102)
	self:addTradeAcquire(RecipeDB, 40033, 6, 1012, 2, 23159)

	-- Shadesteel Bracers -- 40034
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val30id3val714id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40034, 365, 32403, 1, 2018)
	self:addTradeFlags(RecipeDB, 40034, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,59,102)
	self:addTradeAcquire(RecipeDB, 40034, 6, 1012, 1, 23159)

	-- Shadesteel Greaves -- 40035
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val54id3val1428id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40035, 365, 32404, 1, 2018)
	self:addTradeFlags(RecipeDB, 40035, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,59,102)
	self:addTradeAcquire(RecipeDB, 40035, 6, 1012, 2, 23159)

	-- Shadesteel Girdle -- 40036
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val40id3val918id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40036, 365, 32401, 1, 2018)
	self:addTradeFlags(RecipeDB, 40036, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,59,102)
	self:addTradeAcquire(RecipeDB, 40036, 6, 1012, 1, 23159)

	-- Swiftsteel Bracers -- 41132
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val35id1val32id3val772id6val27id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41132, 365, 32568, 4, 2018)
	self:addTradeFlags(RecipeDB, 41132, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 41132, 7, 4)

	-- Swiftsteel Shoulders -- 41133
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val47id1val29id3val1324id6val35id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41133, 365, 32570, 4, 2018)
	self:addTradeFlags(RecipeDB, 41133, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 41133, 7, 4)

	-- Dawnsteel Bracers -- 41134
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val21id3val23id4val772id6val22id19val64id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41134, 365, 32571, 4, 2018)
	self:addTradeFlags(RecipeDB, 41134, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,53,59)
	self:addTradeAcquire(RecipeDB, 41134, 7, 4)

	-- Dawnsteel Shoulders -- 41135
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val31id3val28id4val1324id6val27id19val81id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41135, 365, 32573, 4, 2018)
	self:addTradeFlags(RecipeDB, 41135, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,53,59)
	self:addTradeAcquire(RecipeDB, 41135, 7, 4)

	-- Ragesteel Shoulders -- 42662
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val32id1val12id3val873id6val17id11val17id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42662, 355, 33173, 3, 2018)
	self:addTradeFlags(RecipeDB, 42662, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 42662, 3, 21050, 3, 21059, 3, 21060, 3, 21061)

	-- Adamantite Weapon Chain -- 42688
	-- Raid: 3959 - Black Temple
	-- Instance: 2367 - expansion1type5minlevel66category3maxlevel68nameCaverns of Time: Old Hillsbrad Foothillsterritory1id2367
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42688, 335, 33185, 2, 2018)
	self:addTradeFlags(RecipeDB, 42688, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 42688, 3, 16472, 3, 17819, 3, 23235)

	-- Heavy Copper Longsword -- 43549
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Sword, 
	-- Item Stats: 
	-- Item Stats: val1id2val10-20id7val2.5id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43549, 35, 33791, 2, 2018)
	self:addTradeFlags(RecipeDB, 43549, 1,8,21,22,23,24,25,26,27,28,29,30,36,40,46,69)
	self:addTradeAcquire(RecipeDB, 43549, 4, 1578)

	-- Hammer of Righteous Might -- 43846
	-- Raid: 3457 - Karazhan
	-- Instance: 3791 - expansion1type5minlevel67category3maxlevel69nameAuchindoun: Sethekk Hallsterritory1id3791
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3849 - expansion1type5minlevel70category3nameTempest Keep: The Mechanarterritory1id3849
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Mace, Armor, Trinket, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val55id3val37id4val93.8-185.8id7val2.1id8val168id19val168id20val15id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43846, 355, 32854, 4, 2018)
	self:addTradeFlags(RecipeDB, 43846, 5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,54,63,70)
	self:addTradeAcquire(RecipeDB, 43846, 3, 16409, 3, 16492, 3, 16504, 3, 16525, 3, 19168, 3, 19429, 3, 22323, 3, 23051, 3, 23169)

	-- Sunblessed Gauntlets -- 46140
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val33id3val31id4val1239id6val28id19val84id20val36id22val9id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46140, 340, 34380, 4, 2018)
	self:addTradeFlags(RecipeDB, 46140, 6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,53,59)
	self:addTradeAcquire(RecipeDB, 46140, 3, 25363, 3, 25369, 3, 25371)

	-- Hard Khorium Battlefists -- 46141
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val45id1val45id3val1239id6val36id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46141, 340, 34378, 4, 2018)
	self:addTradeFlags(RecipeDB, 46141, 6,21,22,23,24,25,26,27,28,29,30,36,41,47,59)
	self:addTradeAcquire(RecipeDB, 46141, 3, 25369, 3, 25371)

	-- Sunblessed Breastplate -- 46142
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val40id3val51id4val1983id6val38id19val114id20val34id22val16id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46142, 340, 34379, 4, 2018)
	self:addTradeFlags(RecipeDB, 46142, 6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,53,59)
	self:addTradeAcquire(RecipeDB, 46142, 3, 25363, 3, 25367, 3, 25369, 3, 25507)

	-- Hard Khorium Battleplate -- 46144
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val61id1val55id3val1983id6val41id11val41id18val280id41
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46144, 340, 34377, 4, 2018)
	self:addTradeFlags(RecipeDB, 46144, 6,21,22,23,24,25,26,27,28,29,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 46144, 3, 25369, 3, 25371)

	-- Cobalt Legplates -- 52567
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val43id1val68id3val1204id6val37id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 52567, 365, 39086, 2, 2018)
	--self:addTradeFlags(RecipeDB, 52567, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Cobalt Belt -- 52568
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val31id1val48id3val774id6val30id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 52568, 350, 39087, 2, 2018)
	--self:addTradeFlags(RecipeDB, 52568, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Cobalt Boots -- 52569
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val31id1val43id3val946id6val33id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 52569, 350, 39088, 2, 2018)
	--self:addTradeFlags(RecipeDB, 52569, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Cobalt Chestpiece -- 52570
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val39id1val66id3val1377id6val43id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 52570, 370, 39085, 2, 2018)
	--self:addTradeFlags(RecipeDB, 52570, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Cobalt Helm -- 52571
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val43id1val66id3val1147id6val43id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 52571, 365, 39084, 2, 2018)
	--self:addTradeFlags(RecipeDB, 52571, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	-- Cobalt Shoulders -- 52572
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val33id1val50id3val1059id6val33id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 52572, 360, 39083, 2, 2018)
	--self:addTradeFlags(RecipeDB, 52572, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,59)
	-- No acquire information

	return recipecount

end
