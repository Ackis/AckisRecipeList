--[[

************************************************************************

ARL-LeatherWork.lua

Leatherworking data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
389 found from data mining.
0 ignored.
2756 WotLK ignored.

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

function addon:InitLeatherworking(RecipeDB)

	local recipecount = 0

	-- Handstitched Leather Boots -- 2149
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2149, 10, 2302, 1, 2108)
	self:addTradeFlags(RecipeDB, 2149, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Light Armor Kit -- 2152
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2152, 1, 2304, 1, 2108)
	self:addTradeFlags(RecipeDB, 2152, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Handstitched Leather Pants -- 2153
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2153, 15, 2303, 1, 2108)
	self:addTradeFlags(RecipeDB, 2153, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2153, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Fine Leather Boots -- 2158
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2158, 90, 2307, 2, 2108)
	self:addTradeFlags(RecipeDB, 2158, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2158, 7, 2)

	-- Fine Leather Cloak -- 2159
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val2id3val14id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2159, 75, 2308, 1, 2108)
	self:addTradeFlags(RecipeDB, 2159, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2159, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Vest -- 2160
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id3val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2160, 40, 2300, 1, 2108)
	self:addTradeFlags(RecipeDB, 2160, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2160, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Boots -- 2161
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id3val2id5val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2161, 55, 2309, 1, 2108)
	self:addTradeFlags(RecipeDB, 2161, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2161, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Cloak -- 2162
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val12id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2162, 60, 2310, 1, 2108)
	self:addTradeFlags(RecipeDB, 2162, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2162, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- White Leather Jerkin -- 2163
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2163, 60, 2311, 2, 2108)
	self:addTradeFlags(RecipeDB, 2163, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2163, 7, 2)

	-- Fine Leather Gloves -- 2164
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2164, 75, 2312, 2, 2108)
	self:addTradeFlags(RecipeDB, 2164, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2164, 7, 2)

	-- Medium Armor Kit -- 2165
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2165, 100, 2313, 1, 2108)
	self:addTradeFlags(RecipeDB, 2165, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 2165, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Toughened Leather Armor -- 2166
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val80id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2166, 120, 2314, 1, 2108)
	self:addTradeFlags(RecipeDB, 2166, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2166, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Boots -- 2167
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2167, 100, 2315, 1, 2108)
	self:addTradeFlags(RecipeDB, 2167, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2167, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Cloak -- 2168
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val17id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2168, 110, 2316, 1, 2108)
	self:addTradeFlags(RecipeDB, 2168, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2168, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Tunic -- 2169
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id2val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2169, 100, 2317, 2, 2108)
	self:addTradeFlags(RecipeDB, 2169, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2169, 7, 2)

	-- Light Leather -- 2881
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2881, 1, 2318, 1, 2108)
	self:addTradeFlags(RecipeDB, 2881, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Handstitched Leather Belt -- 3753
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3753, 25, 4237, 1, 2108)
	self:addTradeFlags(RecipeDB, 3753, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3753, 1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Gloves -- 3756
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val39id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3756, 55, 4239, 1, 2108)
	self:addTradeFlags(RecipeDB, 3756, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3756, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Pants -- 3759
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id3val3id5val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3759, 75, 4242, 1, 2108)
	self:addTradeFlags(RecipeDB, 3759, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3759, 1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Cloak -- 3760
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val20id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3760, 150, 3719, 1, 2108)
	self:addTradeFlags(RecipeDB, 3760, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 3760, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Fine Leather Tunic -- 3761
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id2val3id3val73id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3761, 85, 4243, 1, 2108)
	self:addTradeFlags(RecipeDB, 3761, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3761, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Leather Vest -- 3762
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id3val4id5val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3762, 100, 4244, 2, 2108)
	self:addTradeFlags(RecipeDB, 3762, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3762, 7, 2)

	-- Fine Leather Belt -- 3763
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val38id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3763, 80, 4246, 1, 2108)
	self:addTradeFlags(RecipeDB, 3763, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3763, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Leather Gloves -- 3764
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id3val5id5val57id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3764, 145, 4247, 1, 2108)
	self:addTradeFlags(RecipeDB, 3764, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3764, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Gloves -- 3765
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3765, 130, 4248, 2, 2108)
	self:addTradeFlags(RecipeDB, 3765, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3765, 7, 2)

	-- Dark Leather Belt -- 3766
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id2val4id3val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3766, 125, 4249, 1, 2108)
	self:addTradeFlags(RecipeDB, 3766, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3766, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Belt -- 3767
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id3val4id5val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3767, 120, 4250, 2, 2108)
	self:addTradeFlags(RecipeDB, 3767, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3767, 7, 2)

	-- Hillman's Shoulders -- 3768
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id3val4id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3768, 130, 4251, 1, 2108)
	self:addTradeFlags(RecipeDB, 3768, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3768, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Shoulders -- 3769
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id2val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3769, 140, 4252, 2, 2108)
	self:addTradeFlags(RecipeDB, 3769, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3769, 7, 2)

	-- Toughened Leather Gloves -- 3770
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id2val3id3val6id5val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3770, 135, 4253, 1, 2108)
	self:addTradeFlags(RecipeDB, 3770, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3770, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Barbaric Gloves -- 3771
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id2val5id3val4id5val58id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3771, 150, 4254, 2, 2108)
	self:addTradeFlags(RecipeDB, 3771, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3771, 7, 2)

	-- Green Leather Armor -- 3772
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id2val8id5val95id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3772, 155, 4255, 1, 2108)
	self:addTradeFlags(RecipeDB, 3772, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3772, 2, 2679, 2, 2698)

	-- Guardian Armor -- 3773
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id4val9id5val102id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3773, 175, 4256, 2, 2108)
	self:addTradeFlags(RecipeDB, 3773, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3773, 7, 2)

	-- Green Leather Belt -- 3774
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id2val6id5val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3774, 160, 4257, 1, 2108)
	self:addTradeFlags(RecipeDB, 3774, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3774, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Belt -- 3775
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id4val6id5val56id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3775, 170, 4258, 3, 2108)
	self:addTradeFlags(RecipeDB, 3775, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3775, 7, 3)

	-- Green Leather Bracers -- 3776
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id2val5id5val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3776, 180, 4259, 1, 2108)
	self:addTradeFlags(RecipeDB, 3776, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3776, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Leather Bracers -- 3777
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id4val6id5val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3777, 195, 4260, 2, 2108)
	self:addTradeFlags(RecipeDB, 3777, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3777, 7, 2)

	-- Gem-studded Leather Belt -- 3778
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id3val6id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3778, 185, 4262, 1, 2108)
	self:addTradeFlags(RecipeDB, 3778, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3778, 2, 2699)

	-- Barbaric Belt -- 3779
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id1val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3779, 200, 4264, 3, 2108)
	self:addTradeFlags(RecipeDB, 3779, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3779, 7, 3)

	-- Heavy Armor Kit -- 3780
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3780, 150, 4265, 1, 2108)
	self:addTradeFlags(RecipeDB, 3780, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 3780, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Light Hide -- 3816
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3816, 35, 4231, 1, 2108)
	self:addTradeFlags(RecipeDB, 3816, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3816, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Medium Hide -- 3817
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3817, 100, 4233, 1, 2108)
	self:addTradeFlags(RecipeDB, 3817, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3817, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Heavy Hide -- 3818
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3818, 150, 4236, 1, 2108)
	self:addTradeFlags(RecipeDB, 3818, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3818, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Raptor Hide Harness -- 4096
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id3val98id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4096, 165, 4455, 2, 2108)
	self:addTradeFlags(RecipeDB, 4096, 2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 4096, 2, 2819)

	-- Raptor Hide Belt -- 4097
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id3val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4097, 165, 4456, 2, 2108)
	self:addTradeFlags(RecipeDB, 4097, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 4097, 2, 2816)

	-- Kodo Hide Bag -- 5244
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 5244, 40, 5081, 2, 2108)
	self:addTradeFlags(RecipeDB, 5244, 2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 5244, 4, 769)

	-- Barbaric Harness -- 6661
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val101id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6661, 190, 5739, 1, 2108)
	self:addTradeFlags(RecipeDB, 6661, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 6661, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Murloc Scale Belt -- 6702
	-- Instance: 1581 - type1category3maxlevel20territory2minlevel15nameThe Deadminesid1581
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id1val3id2val42id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6702, 90, 5780, 1, 2108)
	self:addTradeFlags(RecipeDB, 6702, 1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6702, 3, 1732, 3, 3385, 2, 843, 2, 3556, 2, 4186)

	-- Murloc Scale Breastplate -- 6703
	-- Instance: 1581 - type1category3maxlevel20territory2minlevel15nameThe Deadminesid1581
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id1val3id2val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6703, 95, 5781, 1, 2108)
	self:addTradeFlags(RecipeDB, 6703, 1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6703, 3, 657, 3, 3386, 2, 843, 2, 3556, 2, 4186)

	-- Thick Murloc Armor -- 6704
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val9id1val8id3val100id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6704, 170, 5782, 2, 2108)
	self:addTradeFlags(RecipeDB, 6704, 1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6704, 3, 938, 3, 1160, 2, 2381, 2, 2393, 2, 2846)

	-- Murloc Scale Bracers -- 6705
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id1val6id3val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6705, 190, 5783, 2, 2108)
	self:addTradeFlags(RecipeDB, 6705, 1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6705, 3, 1561, 3, 2636, 2, 2846, 2, 4897)

	-- Handstitched Leather Vest -- 7126
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7126, 10, 5957, 1, 2108)
	self:addTradeFlags(RecipeDB, 7126, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Fine Leather Pants -- 7133
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id4val4id5val69id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7133, 105, 5958, 2, 2108)
	self:addTradeFlags(RecipeDB, 7133, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7133, 7, 2)

	-- Dark Leather Pants -- 7135
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id2val72id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7135, 115, 5961, 1, 2108)
	self:addTradeFlags(RecipeDB, 7135, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7135, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Pants -- 7147
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id4val8id5val85id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7147, 160, 5962, 1, 2108)
	self:addTradeFlags(RecipeDB, 7147, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7147, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Barbaric Leggings -- 7149
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id2val7id3val7id5val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7149, 170, 5963, 1, 2108)
	self:addTradeFlags(RecipeDB, 7149, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7149, 2, 2810, 2, 2821, 2, 3958, 2, 4877)

	-- Barbaric Shoulders -- 7151
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id2val6id3val5id5val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7151, 175, 5964, 1, 2108)
	self:addTradeFlags(RecipeDB, 7151, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7151, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Cloak -- 7153
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val5id4val6id5val24id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7153, 185, 5965, 2, 2108)
	self:addTradeFlags(RecipeDB, 7153, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 7153, 7, 2)

	-- Guardian Gloves -- 7156
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val63id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7156, 190, 5966, 1, 2108)
	self:addTradeFlags(RecipeDB, 7156, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7156, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Deviate Scale Cloak -- 7953
	-- Instance: 718 - type1category3maxlevel21territory4minlevel15nameWailing Cavernsid718
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val2id2val2id3val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7953, 90, 6466, 1, 2108)
	self:addTradeFlags(RecipeDB, 7953, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 7953, 2, 5783)

	-- Deviate Scale Gloves -- 7954
	-- Instance: 718 - type1category3maxlevel21territory4minlevel15nameWailing Cavernsid718
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val3id2val3id3val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7954, 105, 6467, 1, 2108)
	self:addTradeFlags(RecipeDB, 7954, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7954, 2, 5783)

	-- Deviate Scale Belt -- 7955
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id2val6id3val3id5val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7955, 115, 6468, 2, 2108)
	self:addTradeFlags(RecipeDB, 7955, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7955, 4, 1487)

	-- Moonglow Vest -- 8322
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val3id4val4id5val74id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8322, 85, 6709, 2, 2108)
	self:addTradeFlags(RecipeDB, 8322, 1,8,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 8322, 4, 1582)

	-- Handstitched Leather Cloak -- 9058
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val8id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9058, 10, 7276, 1, 2108)
	self:addTradeFlags(RecipeDB, 9058, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Handstitched Leather Bracers -- 9059
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val21id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9059, 10, 7277, 1, 2108)
	self:addTradeFlags(RecipeDB, 9059, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Light Leather Quiver -- 9060
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9060, 30, 7278, 1, 2108)
	self:addTradeFlags(RecipeDB, 9060, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9060, 1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Small Leather Ammo Pouch -- 9062
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9062, 30, 7279, 1, 2108)
	self:addTradeFlags(RecipeDB, 9062, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9062, 1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Rugged Leather Pants -- 9064
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val1id3val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9064, 35, 7280, 2, 2108)
	self:addTradeFlags(RecipeDB, 9064, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9064, 7, 2)

	-- Light Leather Bracers -- 9065
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val28id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9065, 70, 7281, 1, 2108)
	self:addTradeFlags(RecipeDB, 9065, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9065, 1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Light Leather Pants -- 9068
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id2val3id5val66id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9068, 95, 7282, 1, 2108)
	self:addTradeFlags(RecipeDB, 9068, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9068, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Black Whelp Cloak -- 9070
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val3id3val17id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9070, 100, 7283, 1, 2108)
	self:addTradeFlags(RecipeDB, 9070, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 9070, 2, 2697)

	-- Red Whelp Gloves -- 9072
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val52id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9072, 120, 7284, 1, 2108)
	self:addTradeFlags(RecipeDB, 9072, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9072, 2, 2679)

	-- Nimble Leather Gloves -- 9074
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id2val4id5val52id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9074, 120, 7285, 1, 2108)
	self:addTradeFlags(RecipeDB, 9074, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9074, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Fletcher's Gloves -- 9145
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val53id6val14id11val14id18val1id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9145, 125, 7348, 1, 2108)
	self:addTradeFlags(RecipeDB, 9145, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	self:addTradeAcquire(RecipeDB, 9145, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Herbalist's Gloves -- 9146
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9146, 135, 7349, 2, 2108)
	self:addTradeFlags(RecipeDB, 9146, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9146, 2, 6731)

	-- Earthen Leather Shoulders -- 9147
	-- Instance: 2367 - type5category3maxlevel68territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id3val67id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9147, 135, 7352, 1, 2108)
	self:addTradeFlags(RecipeDB, 9147, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9147, 2, 3537)

	-- Pilferer's Gloves -- 9148
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id2val56id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9148, 140, 7358, 2, 2108)
	self:addTradeFlags(RecipeDB, 9148, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9148, 7, 2)

	-- Heavy Earthen Gloves -- 9149
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val57id6val16id9val16id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9149, 145, 7359, 2, 2108)
	self:addTradeFlags(RecipeDB, 9149, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9149, 7, 2)

	-- Heavy Quiver -- 9193
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9193, 150, 7371, 1, 2108)
	self:addTradeFlags(RecipeDB, 9193, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9193, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Leather Ammo Pouch -- 9194
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9194, 150, 7372, 1, 2108)
	self:addTradeFlags(RecipeDB, 9194, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9194, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dusky Leather Leggings -- 9195
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id2val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9195, 165, 7373, 2, 2108)
	self:addTradeFlags(RecipeDB, 9195, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9195, 7, 2)

	-- Dusky Leather Armor -- 9196
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id2val102id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9196, 175, 7374, 1, 2108)
	self:addTradeFlags(RecipeDB, 9196, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9196, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Green Whelp Armor -- 9197
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id5val102id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9197, 175, 7375, 2, 2108)
	self:addTradeFlags(RecipeDB, 9197, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9197, 7, 2)

	-- Frost Leather Cloak -- 9198
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val24id6val11id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9198, 180, 7377, 1, 2108)
	self:addTradeFlags(RecipeDB, 9198, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 9198, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dusky Bracers -- 9201
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id2val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9201, 185, 7378, 1, 2108)
	self:addTradeFlags(RecipeDB, 9201, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9201, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Green Whelp Bracers -- 9202
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9202, 190, 7386, 2, 2108)
	self:addTradeFlags(RecipeDB, 9202, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9202, 2, 4225, 2, 4589, 2, 7852, 2, 7854)

	-- Dusky Belt -- 9206
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id2val8id3val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9206, 195, 7387, 1, 2108)
	self:addTradeFlags(RecipeDB, 9206, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9206, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dusky Boots -- 9207
	-- Instance: 796 - type1category3maxlevel45territory4minlevel34nameScarlet Monasteryid796
	-- Instance: 722 - type1category3maxlevel40territory4minlevel33nameRazorfen Downsid722
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id2val3id3val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9207, 200, 7390, 3, 2108)
	self:addTradeFlags(RecipeDB, 9207, 5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9207, 3, 682, 3, 2566, 3, 2574, 3, 2760, 3, 4298, 3, 7349)

	-- Swift Boots -- 9208
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id3val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9208, 200, 7391, 2, 2108)
	self:addTradeFlags(RecipeDB, 9208, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9208, 7, 2)

	-- Cured Thick Hide -- 10482
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10482, 200, 8172, 1, 2108)
	self:addTradeFlags(RecipeDB, 10482, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 10482, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Armor Kit -- 10487
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10487, 200, 8173, 1, 2108)
	self:addTradeFlags(RecipeDB, 10487, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 10487, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Comfortable Leather Hat -- 10490
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id3val10id5val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10490, 200, 8174, 3, 2108)
	self:addTradeFlags(RecipeDB, 10490, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10490, 7, 3)

	-- Nightscape Tunic -- 10499
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id2val6id3val113id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10499, 205, 8175, 1, 2108)
	self:addTradeFlags(RecipeDB, 10499, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10499, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Headband -- 10507
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id2val11id3val91id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10507, 205, 8176, 1, 2108)
	self:addTradeFlags(RecipeDB, 10507, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10507, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Turtle Scale Gloves -- 10509
	-- World Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id3val6id4val6id5val146id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10509, 205, 8187, 1, 2108)
	self:addTradeFlags(RecipeDB, 10509, 1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10509, 7, 1, 2, 7852, 2, 7854)

	-- Turtle Scale Breastplate -- 10511
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id3val9id4val9id5val238id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10511, 210, 8189, 1, 2108)
	self:addTradeFlags(RecipeDB, 10511, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10511, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Shoulders -- 10516
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id2val5id3val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10516, 210, 8192, 2, 2108)
	self:addTradeFlags(RecipeDB, 10516, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10516, 2, 7854, 2, 8160)

	-- Turtle Scale Bracers -- 10518
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val204id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10518, 210, 8198, 1, 2108)
	self:addTradeFlags(RecipeDB, 10518, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10518, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Big Voodoo Robe -- 10520
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val117id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10520, 215, 8200, 2, 2108)
	self:addTradeFlags(RecipeDB, 10520, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10520, 7, 2)

	-- Tough Scorpid Breastplate -- 10525
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val15id2val7id5val245id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10525, 220, 8203, 2, 2108)
	self:addTradeFlags(RecipeDB, 10525, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10525, 3, 5618)

	-- Wild Leather Shoulders -- 10529
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10529, 220, 8210, 2, 2108)
	self:addTradeFlags(RecipeDB, 10529, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10529, 4, 2848, 4, 2855)

	-- Big Voodoo Mask -- 10531
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val97id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10531, 220, 8201, 2, 2108)
	self:addTradeFlags(RecipeDB, 10531, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10531, 7, 2)

	-- Tough Scorpid Bracers -- 10533
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id2val6id5val107id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10533, 220, 8205, 2, 2108)
	self:addTradeFlags(RecipeDB, 10533, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10533, 3, 2389, 3, 5617)

	-- Tough Scorpid Gloves -- 10542
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id2val9id5val155id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10542, 225, 8204, 2, 2108)
	self:addTradeFlags(RecipeDB, 10542, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10542, 3, 5616)

	-- Wild Leather Vest -- 10544
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val121id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10544, 225, 8211, 2, 2108)
	self:addTradeFlags(RecipeDB, 10544, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10544, 4, 2849, 4, 2856)

	-- Wild Leather Helmet -- 10546
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val99id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10546, 225, 8214, 2, 2108)
	self:addTradeFlags(RecipeDB, 10546, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10546, 4, 2850, 4, 2857)

	-- Nightscape Pants -- 10548
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val16id2val7id3val108id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10548, 230, 8193, 1, 2108)
	self:addTradeFlags(RecipeDB, 10548, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10548, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Cloak -- 10550
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val10id2val3id3val30id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10550, 230, 8195, 2, 2108)
	self:addTradeFlags(RecipeDB, 10550, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Turtle Scale Helm -- 10552
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val10id4val10id5val206id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10552, 230, 8191, 1, 2108)
	self:addTradeFlags(RecipeDB, 10552, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10552, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Tough Scorpid Boots -- 10554
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id2val7id5val178id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10554, 235, 8209, 2, 2108)
	self:addTradeFlags(RecipeDB, 10554, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10554, 3, 5615)

	-- Turtle Scale Leggings -- 10556
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val11id3val10id4val11id5val226id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10556, 235, 8185, 1, 2108)
	self:addTradeFlags(RecipeDB, 10556, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10556, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Boots -- 10558
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id2val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10558, 235, 8197, 1, 2108)
	self:addTradeFlags(RecipeDB, 10558, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10558, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Big Voodoo Pants -- 10560
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id4val15id5val110id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10560, 240, 8202, 2, 2108)
	self:addTradeFlags(RecipeDB, 10560, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10560, 7, 2)

	-- Big Voodoo Cloak -- 10562
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val9id4val5id5val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10562, 240, 8216, 2, 2108)
	self:addTradeFlags(RecipeDB, 10562, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 10562, 7, 2)

	-- Tough Scorpid Shoulders -- 10564
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id2val10id5val197id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10564, 240, 8207, 2, 2108)
	self:addTradeFlags(RecipeDB, 10564, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10564, 3, 5623, 3, 7805, 3, 7883)

	-- Wild Leather Boots -- 10566
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10566, 245, 8213, 2, 2108)
	self:addTradeFlags(RecipeDB, 10566, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10566, 4, 2851, 4, 2858)

	-- Tough Scorpid Leggings -- 10568
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val17id2val10id5val235id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10568, 245, 8206, 2, 2108)
	self:addTradeFlags(RecipeDB, 10568, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10568, 3, 5615)

	-- Tough Scorpid Helm -- 10570
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val14id2val14id5val222id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10570, 250, 8208, 2, 2108)
	self:addTradeFlags(RecipeDB, 10570, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10570, 3, 5623, 3, 7805, 3, 7883)

	-- Wild Leather Leggings -- 10572
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val116id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10572, 250, 8212, 2, 2108)
	self:addTradeFlags(RecipeDB, 10572, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10572, 4, 2852, 4, 2859)

	-- Wild Leather Cloak -- 10574
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val33id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10574, 250, 8215, 2, 2108)
	self:addTradeFlags(RecipeDB, 10574, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 10574, 4, 2853, 4, 2860)

	-- Dragonscale Gauntlets -- 10619
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id3val6id5val171id6val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10619, 225, 8347, 1, 2108)
	self:addTradeFlags(RecipeDB, 10619, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10619, 1, 7866, 1, 7867)

	-- Wolfshead Helm -- 10621
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id5val109id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10621, 225, 8345, 1, 2108)
	self:addTradeFlags(RecipeDB, 10621, 1,2,3,22,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10621, 1, 7870, 1, 7871)

	-- Gauntlets of the Sea -- 10630
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id2val85id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10630, 230, 8346, 1, 2108)
	self:addTradeFlags(RecipeDB, 10630, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10630, 1, 7868, 1, 7869)

	-- Helm of Fire -- 10632
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val17id2val10id3val118id6val5id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10632, 250, 8348, 1, 2108)
	self:addTradeFlags(RecipeDB, 10632, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10632, 1, 7868, 1, 7869)

	-- Feathered Breastplate -- 10647
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id4val24id5val146id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10647, 250, 8349, 1, 2108)
	self:addTradeFlags(RecipeDB, 10647, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10647, 1, 7870, 1, 7871)

	-- Dragonscale Breastplate -- 10650
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val306id6val13id33val13id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10650, 255, 8367, 1, 2108)
	self:addTradeFlags(RecipeDB, 10650, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10650, 1, 7866, 1, 7867)

	-- Quickdraw Quiver -- 14930
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14930, 225, 8217, 1, 2108)
	self:addTradeFlags(RecipeDB, 14930, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 14930, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Leather Ammo Pouch -- 14932
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14932, 225, 8218, 1, 2108)
	self:addTradeFlags(RecipeDB, 14932, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 14932, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Rugged Hide -- 19047
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19047, 240, 15407, 1, 2108)
	self:addTradeFlags(RecipeDB, 19047, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19047, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Scorpid Bracers -- 19048
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id3val8id5val122id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19048, 255, 15077, 1, 2108)
	self:addTradeFlags(RecipeDB, 19048, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19048, 2, 12956)

	-- Wicked Leather Gauntlets -- 19049
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id2val11id3val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19049, 260, 15083, 1, 2108)
	self:addTradeFlags(RecipeDB, 19049, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19049, 2, 12942, 2, 12943)

	-- Green Dragonscale Breastplate -- 19050
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val21id5val311id6val11id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19050, 260, 15045, 1, 2108)
	self:addTradeFlags(RecipeDB, 19050, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19050, 2, 11874)

	-- Heavy Scorpid Vest -- 19051
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val16id3val15id5val288id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19051, 265, 15076, 2, 2108)
	self:addTradeFlags(RecipeDB, 19051, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19051, 3, 5981, 3, 6005)

	-- Wicked Leather Bracers -- 19052
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id2val5id3val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19052, 265, 15084, 2, 2108)
	self:addTradeFlags(RecipeDB, 19052, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19052, 3, 6201, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Chimeric Gloves -- 19053
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val87id6val11id32val12id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19053, 265, 15074, 1, 2108)
	self:addTradeFlags(RecipeDB, 19053, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19053, 2, 12957)

	-- Red Dragonscale Breastplate -- 19054
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val360id6val22id19val66id20val12id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19054, 300, 15047, 3, 2108)
	self:addTradeFlags(RecipeDB, 19054, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,53,58)
	self:addTradeAcquire(RecipeDB, 19054, 3, 10363)

	-- Runic Leather Gauntlets -- 19055
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val88id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19055, 270, 15091, 2, 2108)
	self:addTradeFlags(RecipeDB, 19055, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19055, 7, 2, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Rugged Armor Kit -- 19058
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19058, 230, 15564, 1, 2108)
	self:addTradeFlags(RecipeDB, 19058, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 19058, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Volcanic Leggings -- 19059
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val204id6val20id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19059, 270, 15054, 2, 2108)
	self:addTradeFlags(RecipeDB, 19059, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19059, 3, 7035)

	-- Green Dragonscale Leggings -- 19060
	-- Instance: 1477 - type1category3maxlevel55territory1minlevel50nameThe Temple of Atal'Hakkarid1477
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val22id5val282id6val11id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19060, 270, 15046, 3, 2108)
	self:addTradeFlags(RecipeDB, 19060, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19060, 3, 5226)

	-- Living Shoulders -- 19061
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id3val13id5val117id6val11id19val31id20val3id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19061, 270, 15061, 1, 2108)
	self:addTradeFlags(RecipeDB, 19061, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,53,57)
	self:addTradeAcquire(RecipeDB, 19061, 2, 7852, 2, 7854)

	-- Ironfeather Shoulders -- 19062
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id4val8id5val117id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19062, 270, 15067, 1, 2108)
	self:addTradeFlags(RecipeDB, 19062, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19062, 2, 12958)

	-- Chimeric Boots -- 19063
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val99id6val12id32val12id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19063, 275, 15073, 2, 2108)
	self:addTradeFlags(RecipeDB, 19063, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19063, 7, 2)

	-- Heavy Scorpid Gauntlets -- 19064
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val12id5val186id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19064, 275, 15078, 2, 2108)
	self:addTradeFlags(RecipeDB, 19064, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19064, 3, 7025)

	-- Runic Leather Bracers -- 19065
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id4val10id5val63id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19065, 275, 15092, 2, 2108)
	self:addTradeFlags(RecipeDB, 19065, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19065, 3, 7112, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Frostsaber Boots -- 19066
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val99id6val12id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19066, 275, 15071, 1, 2108)
	self:addTradeFlags(RecipeDB, 19066, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19066, 2, 11189)

	-- Stormshroud Pants -- 19067
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val138id6val28id11val28id18val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19067, 275, 15057, 1, 2108)
	self:addTradeFlags(RecipeDB, 19067, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,52,57)
	self:addTradeAcquire(RecipeDB, 19067, 2, 12942, 2, 12943)

	-- Warbear Harness -- 19068
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id1val27id3val158id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19068, 275, 15064, 1, 2108)
	self:addTradeFlags(RecipeDB, 19068, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19068, 7, 1)

	-- Heavy Scorpid Belt -- 19070
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val12id5val170id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19070, 280, 15082, 2, 2108)
	self:addTradeFlags(RecipeDB, 19070, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19070, 7, 2)

	-- Wicked Leather Headband -- 19071
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val16id2val16id3val118id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19071, 280, 15086, 2, 2108)
	self:addTradeFlags(RecipeDB, 19071, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19071, 3, 7107, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Runic Leather Belt -- 19072
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val82id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19072, 280, 15093, 2, 2108)
	self:addTradeFlags(RecipeDB, 19072, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19072, 7, 2, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Chimeric Leggings -- 19073
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val127id6val16id32val16id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19073, 280, 15072, 2, 2108)
	self:addTradeFlags(RecipeDB, 19073, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19073, 7, 2)

	-- Frostsaber Leggings -- 19074
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val129id6val17id35val16id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19074, 285, 15069, 2, 2108)
	self:addTradeFlags(RecipeDB, 19074, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19074, 3, 7440)

	-- Heavy Scorpid Leggings -- 19075
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val20id5val269id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19075, 285, 15079, 2, 2108)
	self:addTradeFlags(RecipeDB, 19075, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19075, 3, 7027)

	-- Volcanic Breastplate -- 19076
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val268id6val20id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19076, 285, 15053, 2, 2108)
	self:addTradeFlags(RecipeDB, 19076, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19076, 3, 9259)

	-- Blue Dragonscale Breastplate -- 19077
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val28id4val8id5val338id6val8id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19077, 285, 15048, 1, 2108)
	self:addTradeFlags(RecipeDB, 19077, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19077, 2, 12957)

	-- Living Leggings -- 19078
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id3val25id5val142id6val9id19val26id20val5id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19078, 285, 15060, 3, 2108)
	self:addTradeFlags(RecipeDB, 19078, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,53,57)
	self:addTradeAcquire(RecipeDB, 19078, 3, 7158)

	-- Stormshroud Armor -- 19079
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val163id6val28id11val28id18val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19079, 285, 15056, 3, 2108)
	self:addTradeFlags(RecipeDB, 19079, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,57)
	self:addTradeAcquire(RecipeDB, 19079, 3, 6138)

	-- Warbear Woolies -- 19080
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val28id1val12id3val142id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19080, 285, 15065, 1, 2108)
	self:addTradeFlags(RecipeDB, 19080, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 19080, 3, 7156, 3, 7158)

	-- Chimeric Vest -- 19081
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val150id6val16id32val17id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19081, 290, 15075, 2, 2108)
	self:addTradeFlags(RecipeDB, 19081, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19081, 7, 2)

	-- Runic Leather Headband -- 19082
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id4val12id5val122id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19082, 290, 15094, 1, 2108)
	self:addTradeFlags(RecipeDB, 19082, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19082, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wicked Leather Pants -- 19083
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id2val12id3val131id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19083, 290, 15087, 2, 2108)
	self:addTradeFlags(RecipeDB, 19083, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19083, 7, 2, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Devilsaur Gauntlets -- 19084
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val9id3val103id6val28id9val14id11val28id16val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19084, 290, 15063, 1, 2108)
	self:addTradeFlags(RecipeDB, 19084, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19084, 2, 12959)

	-- Black Dragonscale Breastplate -- 19085
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id3val344id6val50id9val50id16val12id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19085, 290, 15050, 1, 2108)
	self:addTradeFlags(RecipeDB, 19085, 2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19085, 2, 9499)

	-- Ironfeather Breastplate -- 19086
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id4val28id5val165id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19086, 290, 15066, 3, 2108)
	self:addTradeFlags(RecipeDB, 19086, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19086, 3, 2644)

	-- Frostsaber Gloves -- 19087
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val95id6val13id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19087, 295, 15070, 2, 2108)
	self:addTradeFlags(RecipeDB, 19087, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19087, 3, 7441)

	-- Heavy Scorpid Helm -- 19088
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val20id3val13id5val258id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19088, 295, 15080, 1, 2108)
	self:addTradeFlags(RecipeDB, 19088, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19088, 2, 12956)

	-- Blue Dragonscale Shoulders -- 19089
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val21id4val6id5val262id6val6id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19089, 295, 15049, 3, 2108)
	self:addTradeFlags(RecipeDB, 19089, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19089, 3, 6146)

	-- Stormshroud Shoulders -- 19090
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val126id6val14id11val14id18val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19090, 295, 15058, 3, 2108)
	self:addTradeFlags(RecipeDB, 19090, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,57)
	self:addTradeAcquire(RecipeDB, 19090, 3, 6144)

	-- Runic Leather Pants -- 19091
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id4val20id5val135id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19091, 300, 15095, 2, 2108)
	self:addTradeFlags(RecipeDB, 19091, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19091, 7, 2, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wicked Leather Belt -- 19092
	-- Trainer
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id2val13id3val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19092, 300, 15088, 2, 2108)
	self:addTradeFlags(RecipeDB, 19092, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19092, 3, 10406, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Onyxia Scale Cloak -- 19093
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val7id3val43id6val16id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19093, 300, 15138, 3, 2108)
	self:addTradeFlags(RecipeDB, 19093, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Black Dragonscale Shoulders -- 19094
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id3val266id6val40id9val40id16val6id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19094, 300, 15051, 3, 2108)
	self:addTradeFlags(RecipeDB, 19094, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19094, 3, 8898)

	-- Living Breastplate -- 19095
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val10id3val25id5val169id6val9id19val26id20val5id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19095, 300, 15059, 3, 2108)
	self:addTradeFlags(RecipeDB, 19095, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,53,57)
	self:addTradeAcquire(RecipeDB, 19095, 3, 1813)

	-- Devilsaur Leggings -- 19097
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id3val148id6val46id9val14id11val46id16val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19097, 300, 15062, 3, 2108)
	self:addTradeFlags(RecipeDB, 19097, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19097, 3, 6556, 3, 6557, 3, 6559, 3, 9477, 3, 9621)

	-- Wicked Leather Armor -- 19098
	-- Trainer
	-- Instance: 2057 - type1category3maxlevel60territory1minlevel58nameScholomanceid2057
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val25id2val7id3val156id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19098, 300, 15085, 2, 2108)
	self:addTradeFlags(RecipeDB, 19098, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19098, 3, 10499, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Scorpid Shoulders -- 19100
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val14id3val13id5val245id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19100, 300, 15081, 2, 2108)
	self:addTradeFlags(RecipeDB, 19100, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19100, 3, 7029)

	-- Volcanic Shoulders -- 19101
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val167id6val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19101, 300, 15055, 2, 2108)
	self:addTradeFlags(RecipeDB, 19101, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19101, 3, 9260)

	-- Runic Leather Armor -- 19102
	-- Trainer
	-- Instance: 2057 - type1category3maxlevel60territory1minlevel58nameScholomanceid2057
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val21id4val13id5val158id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19102, 300, 15090, 2, 2108)
	self:addTradeFlags(RecipeDB, 19102, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19102, 3, 11582, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Runic Leather Shoulders -- 19103
	-- Trainer
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id4val10id5val119id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19103, 300, 15096, 2, 2108)
	self:addTradeFlags(RecipeDB, 19103, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19103, 3, 10425, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Frostsaber Tunic -- 19104
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val158id6val18id35val18id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19104, 300, 15068, 2, 2108)
	self:addTradeFlags(RecipeDB, 19104, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19104, 3, 7438)

	-- Onyxia Scale Breastplate -- 19106
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val15id1val15id2val15id3val14id4val14id5val605id6val14id11val14id18val9id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19106, 300, 15141, 4, 2108)
	self:addTradeFlags(RecipeDB, 19106, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Black Dragonscale Leggings -- 19107
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id3val320id6val54id9val54id16val13id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19107, 300, 15052, 3, 2108)
	self:addTradeFlags(RecipeDB, 19107, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19107, 3, 8903)

	-- Medium Leather -- 20648
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20648, 90, 2319, 1, 2108)
	self:addTradeFlags(RecipeDB, 20648, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20648, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Leather -- 20649
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20649, 140, 4234, 1, 2108)
	self:addTradeFlags(RecipeDB, 20649, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20649, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Leather -- 20650
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20650, 195, 4304, 1, 2108)
	self:addTradeFlags(RecipeDB, 20650, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20650, 1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Corehound Boots -- 20853
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id2val10id3val144id6val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20853, 295, 16982, 1, 2108)
	self:addTradeFlags(RecipeDB, 20853, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 20853, 2, 12944)

	-- Molten Helm -- 20854
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val16id3val171id6val12id26val29id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20854, 300, 16983, 1, 2108)
	self:addTradeFlags(RecipeDB, 20854, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	self:addTradeAcquire(RecipeDB, 20854, 2, 12944)

	-- Black Dragonscale Boots -- 20855
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val308id6val28id9val28id16val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20855, 300, 16984, 1, 2108)
	self:addTradeFlags(RecipeDB, 20855, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 20855, 2, 12944)

	-- Gloves of the Greatfather -- 21943
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, Seasonal, 
	-- Item Stats: Healing, 
	-- Item Stats: val66id6val16id19val18id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21943, 190, 17721, 2, 2108)
	self:addTradeFlags(RecipeDB, 21943, 7,21,22,23,24,25,26,27,28,29,30,36,40,47,53,57)
	self:addTradeAcquire(RecipeDB, 21943, 5, 1)

	-- Rugged Leather -- 22331
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22331, 250, 8170, 1, 2108)
	self:addTradeFlags(RecipeDB, 22331, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22331, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Shadowskin Gloves -- 22711
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id3val76id6val14id11val14id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22711, 190, 18238, 1, 2108)
	self:addTradeFlags(RecipeDB, 22711, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 22711, 2, 2699)

	-- Core Armor Kit -- 22727
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22727, 300, 18251, 3, 2108)
	self:addTradeFlags(RecipeDB, 22727, 6,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 22727, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Gordok Ogre Suit -- 22815
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22815, 275, 18258, 2, 2108)
	self:addTradeFlags(RecipeDB, 22815, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Girdle of Insight -- 22921
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val9id3val23id4val98id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22921, 300, 18504, 3, 2108)
	self:addTradeFlags(RecipeDB, 22921, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 22921, 3, 14338)

	-- Mongoose Boots -- 22922
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val23id2val9id3val120id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22922, 300, 18506, 3, 2108)
	self:addTradeFlags(RecipeDB, 22922, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 22922, 3, 14338)

	-- Swift Flight Bracers -- 22923
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id3val160id6val41id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22923, 300, 18508, 3, 2108)
	self:addTradeFlags(RecipeDB, 22923, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 22923, 3, 14338)

	-- Chromatic Cloak -- 22926
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val10id3val55id6val14id22val9id33val9id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22926, 300, 18509, 4, 2108)
	self:addTradeFlags(RecipeDB, 22926, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 22926, 3, 14338)

	-- Hide of the Wild -- 22927
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id3val10id4val55id6val14id19val42id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22927, 300, 18510, 4, 2108)
	self:addTradeFlags(RecipeDB, 22927, 21,22,23,24,25,26,27,28,29,30,36,40,47,53,60)
	-- No acquire information

	-- Shifting Cloak -- 22928
	-- Instance: 2557 - type1category3maxlevel60territory1minlevel58nameDire Maulid2557
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: Tanking, 
	-- Item Stats: val17id2val8id3val55id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22928, 300, 18511, 4, 2108)
	self:addTradeFlags(RecipeDB, 22928, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,52,60)
	self:addTradeAcquire(RecipeDB, 22928, 3, 14338)

	-- Heavy Leather Ball -- 23190
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23190, 140, 18662, 1, 2108)
	self:addTradeFlags(RecipeDB, 23190, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23190, 2, 3366, 2, 5128)

	-- Barbaric Bracers -- 23399
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val4id2val6id3val4id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23399, 155, 18948, 1, 2108)
	self:addTradeFlags(RecipeDB, 23399, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 23399, 2, 4225, 2, 4589)

	-- Might of the Timbermaw -- 23703
	-- Timbermaw Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val21id1val9id3val93id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23703, 290, 19044, 1, 2108)
	self:addTradeFlags(RecipeDB, 23703, 4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,99)
	self:addTradeAcquire(RecipeDB, 23703, 6, 576, 2, 11557)

	-- Timbermaw Brawlers -- 23704
	-- Timbermaw Hold - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val23id1val10id3val112id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23704, 300, 19049, 1, 2108)
	self:addTradeFlags(RecipeDB, 23704, 4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,99)
	self:addTradeAcquire(RecipeDB, 23704, 6, 576, 3, 11557)

	-- Dawn Treaders -- 23705
	-- Argent Dawn - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val18id3val114id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23705, 290, 19052, 1, 2108)
	self:addTradeFlags(RecipeDB, 23705, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,96)
	self:addTradeAcquire(RecipeDB, 23705, 6, 529, 2, 10856, 6, 529, 2, 10857, 6, 529, 2, 11536)

	-- Golden Mantle of the Dawn -- 23706
	-- Argent Dawn - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val22id3val134id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23706, 300, 19058, 1, 2108)
	self:addTradeFlags(RecipeDB, 23706, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,96)
	self:addTradeAcquire(RecipeDB, 23706, 6, 529, 3, 10856, 6, 529, 3, 10857, 6, 529, 3, 11536)

	-- Lava Belt -- 23707
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id3val238id6val26id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23707, 300, 19149, 1, 2108)
	self:addTradeFlags(RecipeDB, 23707, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 23707, 2, 12944)

	-- Chromatic Gauntlets -- 23708
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val318id6val44id9val14id11val44id16val14id18val14id22val5id33val5id34val5id35val5id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23708, 300, 19157, 1, 2108)
	self:addTradeFlags(RecipeDB, 23708, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 23708, 2, 12944)

	-- Corehound Belt -- 23709
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val16id4val135id6val21id19val62id20val12id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23709, 300, 19162, 1, 2108)
	self:addTradeFlags(RecipeDB, 23709, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 23709, 2, 12944)

	-- Molten Belt -- 23710
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val28id2val16id3val135id6val12id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23710, 300, 19163, 1, 2108)
	self:addTradeFlags(RecipeDB, 23710, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 23710, 2, 12944)

	-- Primal Batskin Jerkin -- 24121
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val32id2val6id3val181id6val10id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24121, 300, 19685, 1, 2108)
	self:addTradeFlags(RecipeDB, 24121, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24121, 6, 270, 3, 14921)

	-- Primal Batskin Gloves -- 24122
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id2val9id3val113id6val20id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24122, 300, 19686, 1, 2108)
	self:addTradeFlags(RecipeDB, 24122, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24122, 6, 270, 2, 14921)

	-- Primal Batskin Bracers -- 24123
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id2val7id3val79id6val10id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24123, 300, 19687, 1, 2108)
	self:addTradeFlags(RecipeDB, 24123, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24123, 6, 270, 1, 14921)

	-- Blood Tiger Breastplate -- 24124
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val17id1val17id3val16id4val13id5val181id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24124, 300, 19688, 1, 2108)
	self:addTradeFlags(RecipeDB, 24124, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24124, 6, 270, 3, 14921)

	-- Blood Tiger Shoulders -- 24125
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id1val13id3val12id4val10id5val136id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24125, 300, 19689, 1, 2108)
	self:addTradeFlags(RecipeDB, 24125, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24125, 6, 270, 2, 14921)

	-- Blue Dragonscale Leggings -- 24654
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val20id4val19id5val310id6val12id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24654, 300, 20295, 1, 2108)
	self:addTradeFlags(RecipeDB, 24654, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 24654, 1, 7866, 1, 7867)

	-- Green Dragonscale Gauntlets -- 24655
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id3val18id5val208id6val9id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24655, 280, 20296, 1, 2108)
	self:addTradeFlags(RecipeDB, 24655, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 24655, 1, 7866, 1, 7867)

	-- Dreamscale Breastplate -- 24703
	-- Cenarion Circle - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val15id2val15id3val14id4val496id6val4id24val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24703, 300, 20380, 1, 2108)
	self:addTradeFlags(RecipeDB, 24703, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24703, 6, 609, 4, 15293)

	-- Spitfire Bracers -- 24846
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val9id2val9id4val160id6val8id19val8id20val4id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24846, 300, 20481, 1, 2108)
	self:addTradeFlags(RecipeDB, 24846, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58,97)
	self:addTradeAcquire(RecipeDB, 24846, 6, 609, 1, 15293)

	-- Spitfire Gauntlets -- 24847
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val12id2val12id4val228id6val11id19val11id20val5id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24847, 300, 20480, 1, 2108)
	self:addTradeFlags(RecipeDB, 24847, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58,97)
	self:addTradeAcquire(RecipeDB, 24847, 6, 609, 2, 15293)

	-- Spitfire Breastplate -- 24848
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val16id2val16id4val365id6val15id19val15id20val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24848, 300, 20479, 1, 2108)
	self:addTradeFlags(RecipeDB, 24848, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58,97)
	self:addTradeAcquire(RecipeDB, 24848, 6, 609, 3, 15293)

	-- Sandstalker Bracers -- 24849
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id3val220id6val15id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24849, 300, 20476, 1, 2108)
	self:addTradeFlags(RecipeDB, 24849, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24849, 6, 609, 1, 15293)

	-- Sandstalker Gauntlets -- 24850
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val9id3val308id6val20id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24850, 300, 20477, 1, 2108)
	self:addTradeFlags(RecipeDB, 24850, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24850, 6, 609, 2, 15293)

	-- Sandstalker Breastplate -- 24851
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val13id3val485id6val25id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24851, 300, 20478, 1, 2108)
	self:addTradeFlags(RecipeDB, 24851, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24851, 6, 609, 3, 15293)

	-- Black Whelp Tunic -- 24940
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id1val3id2val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24940, 100, 20575, 1, 2108)
	self:addTradeFlags(RecipeDB, 24940, 1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 24940, 2, 777)

	-- Stormshroud Gloves -- 26279
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val99id6val19id11val19id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26279, 300, 21278, 3, 2108)
	self:addTradeFlags(RecipeDB, 26279, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 26279, 3, 14454, 3, 14457)

	-- Polar Tunic -- 28219
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val18id2val26id3val267id6val40id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28219, 300, 22661, 4, 2108)
	self:addTradeFlags(RecipeDB, 28219, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Polar Gloves -- 28220
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val18id2val18id3val167id6val30id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28220, 300, 22662, 4, 2108)
	self:addTradeFlags(RecipeDB, 28220, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Polar Bracers -- 28221
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id2val20id3val117id6val20id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28221, 300, 22663, 4, 2108)
	self:addTradeFlags(RecipeDB, 28221, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Icy Scale Breastplate -- 28222
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val24id3val578id6val40id9val40id16val40id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28222, 300, 22664, 4, 2108)
	self:addTradeFlags(RecipeDB, 28222, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Icy Scale Gauntlets -- 28223
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val22id3val361id6val22id9val22id16val30id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28223, 300, 22666, 4, 2108)
	self:addTradeFlags(RecipeDB, 28223, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Icy Scale Bracers -- 28224
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val17id3val253id6val32id9val32id16val20id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28224, 300, 22665, 4, 2108)
	self:addTradeFlags(RecipeDB, 28224, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Bramblewood Helm -- 28472
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id3val156id6val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28472, 300, 22759, 1, 2108)
	self:addTradeFlags(RecipeDB, 28472, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,97)
	self:addTradeAcquire(RecipeDB, 28472, 6, 609, 3, 15293)

	-- Bramblewood Boots -- 28473
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id3val132id6val25id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28473, 300, 22760, 1, 2108)
	self:addTradeFlags(RecipeDB, 28473, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,97)
	self:addTradeAcquire(RecipeDB, 28473, 6, 609, 2, 15293)

	-- Bramblewood Belt -- 28474
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id3val108id6val15id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28474, 300, 22761, 1, 2108)
	self:addTradeFlags(RecipeDB, 28474, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,97)
	self:addTradeAcquire(RecipeDB, 28474, 6, 609, 1, 15293)

	-- Knothide Leather -- 32454
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32454, 290, 21887, 1, 2108)
	self:addTradeFlags(RecipeDB, 32454, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 32454, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Knothide Leather -- 32455
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32455, 315, 23793, 1, 2108)
	self:addTradeFlags(RecipeDB, 32455, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32455, 2, 16689, 2, 16748, 2, 19196)

	-- Knothide Armor Kit -- 32456
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32456, 280, 25650, 1, 2108)
	self:addTradeFlags(RecipeDB, 32456, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 32456, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Vindicator's Armor Kit -- 32457
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32457, 325, 25651, 1, 2108)
	self:addTradeFlags(RecipeDB, 32457, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,101)
	self:addTradeAcquire(RecipeDB, 32457, 6, 932, 3, 19321)

	-- Magister's Armor Kit -- 32458
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32458, 325, 25652, 1, 2108)
	self:addTradeFlags(RecipeDB, 32458, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,110)
	self:addTradeAcquire(RecipeDB, 32458, 6, 934, 3, 19331)

	-- Riding Crop -- 32461
	-- Instance: 2367 - type5category3maxlevel68territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32461, 340, 25653, 1, 2108)
	self:addTradeFlags(RecipeDB, 32461, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 32461, 2, 18672)

	-- Felscale Gloves -- 32462
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val19id2val276id6val40id9val40id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32462, 290, 25654, 1, 2108)
	self:addTradeFlags(RecipeDB, 32462, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32462, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Boots -- 32463
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val20id2val333id6val44id9val44id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32463, 300, 25655, 1, 2108)
	self:addTradeFlags(RecipeDB, 32463, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32463, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Pants -- 32464
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val31id2val449id6val60id9val60id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32464, 310, 25656, 1, 2108)
	self:addTradeFlags(RecipeDB, 32464, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32464, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Breastplate -- 32465
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id2val558id6val72id9val72id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32465, 325, 25657, 1, 2108)
	self:addTradeFlags(RecipeDB, 32465, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32465, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Pants -- 32466
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val386id6val23id19val23id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32466, 290, 25662, 1, 2108)
	self:addTradeFlags(RecipeDB, 32466, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 32466, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Gloves -- 32467
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val24id3val303id6val20id19val20id20val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32467, 300, 25661, 1, 2108)
	self:addTradeFlags(RecipeDB, 32467, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 32467, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Vest -- 32468
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val36id3val528id6val29id19val29id20val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32468, 315, 25660, 1, 2108)
	self:addTradeFlags(RecipeDB, 32468, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 32468, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Boots -- 32469
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val30id3val384id6val22id19val22id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32469, 325, 25659, 1, 2108)
	self:addTradeFlags(RecipeDB, 32469, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 32469, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Gloves -- 32470
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id2val22id3val127id6val30id9val30id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32470, 290, 25669, 1, 2108)
	self:addTradeFlags(RecipeDB, 32470, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32470, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Pants -- 32471
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val23id2val34id3val197id6val46id9val46id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32471, 305, 25670, 1, 2108)
	self:addTradeFlags(RecipeDB, 32471, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32471, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Boots -- 32472
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val17id2val27id3val159id6val36id9val36id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32472, 310, 25668, 1, 2108)
	self:addTradeFlags(RecipeDB, 32472, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32472, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Vest -- 32473
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val25id2val39id3val243id6val52id9val52id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32473, 320, 25671, 1, 2108)
	self:addTradeFlags(RecipeDB, 32473, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32473, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Boots -- 32478
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val11id1val11id2val18id3val11id4val140id6val13id19val13id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32478, 290, 25673, 1, 2108)
	self:addTradeFlags(RecipeDB, 32478, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,57)
	self:addTradeAcquire(RecipeDB, 32478, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Gloves -- 32479
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val13id1val13id2val18id3val12id4val137id6val14id19val14id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32479, 300, 25674, 1, 2108)
	self:addTradeFlags(RecipeDB, 32479, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,57)
	self:addTradeAcquire(RecipeDB, 32479, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Leggings -- 32480
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val18id1val18id2val27id3val17id4val202id6val21id19val21id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32480, 310, 25675, 1, 2108)
	self:addTradeFlags(RecipeDB, 32480, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,57)
	self:addTradeAcquire(RecipeDB, 32480, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Vest -- 32481
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val19id1val19id2val28id3val19id4val243id6val22id19val22id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32481, 320, 25676, 1, 2108)
	self:addTradeFlags(RecipeDB, 32481, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,57)
	self:addTradeAcquire(RecipeDB, 32481, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Comfortable Insoles -- 32482
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32482, 290, 25679, 1, 2108)
	self:addTradeFlags(RecipeDB, 32482, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32482, 2, 16689, 2, 16748)

	-- Stylin' Purple Hat -- 32485
	-- Instance: 3789 - type5category3territory1expansion1minlevel70nameAuchindoun: Shadow Labrynthid3789
	-- Instance: 3789 - type5category3territory1expansion1minlevel70nameAuchindoun: Shadow Labrynthid3789
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val48id2val45id3val232id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32485, 340, 25680, 3, 2108)
	self:addTradeFlags(RecipeDB, 32485, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32485, 3, 18667, 3, 19304)

	-- Stylin' Adventure Hat -- 32487
	-- Instance: 2367 - type5category3maxlevel68territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val516id6val50id19val50id20val16id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32487, 340, 25681, 3, 2108)
	self:addTradeFlags(RecipeDB, 32487, 5,11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 32487, 3, 17820)

	-- Stylin' Crimson Hat -- 32488
	-- Instance: 3791 - type5category3maxlevel69territory1expansion1minlevel67nameAuchindoun: Sethekk Hallsid3791
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id4val516id6val96id9val96id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32488, 340, 25683, 3, 2108)
	self:addTradeFlags(RecipeDB, 32488, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32488, 3, 18322)

	-- Stylin' Jungle Hat -- 32489
	-- Instance: 2366 - type5category3territory1expansion1minlevel70nameThe Caverns of Time: The Black Morassid2366
	-- Instance: 2366 - type5category3territory1expansion1minlevel70nameThe Caverns of Time: The Black Morassid2366
	-- Instance: 2366 - type5category3territory1expansion1minlevel70nameThe Caverns of Time: The Black Morassid2366
	-- Instance: 2366 - type5category3territory1expansion1minlevel70nameThe Caverns of Time: The Black Morassid2366
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val24id1val24id2val24id3val24id4val232id6val19id19val19id20val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32489, 340, 25682, 3, 2108)
	self:addTradeFlags(RecipeDB, 32489, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,57)
	self:addTradeAcquire(RecipeDB, 32489, 3, 17839, 3, 21104, 3, 21140, 3, 21148)

	-- Fel Leather Gloves -- 32490
	-- The Consortium - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val169id6val42id9val24id11val42id16val24id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32490, 330, 25685, 3, 2108)
	self:addTradeFlags(RecipeDB, 32490, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,105)
	self:addTradeAcquire(RecipeDB, 32490, 6, 933, 1, 20242, 6, 933, 1, 23007)

	-- Fel Leather Boots -- 32493
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val196id6val42id9val17id11val42id16val17id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32493, 340, 25686, 3, 2108)
	self:addTradeFlags(RecipeDB, 32493, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,105)
	self:addTradeAcquire(RecipeDB, 32493, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Fel Leather Leggings -- 32494
	-- The Consortium - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val249id6val60id9val25id11val60id16val25id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32494, 340, 25687, 3, 2108)
	self:addTradeFlags(RecipeDB, 32494, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,105)
	self:addTradeAcquire(RecipeDB, 32494, 6, 933, 3, 20242, 6, 933, 3, 23007)

	-- Heavy Clefthoof Vest -- 32495
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val45id3val500id6val24id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32495, 350, 25689, 3, 2108)
	self:addTradeFlags(RecipeDB, 32495, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,103)
	self:addTradeAcquire(RecipeDB, 32495, 6, 942, 2, 17904)

	-- Heavy Clefthoof Leggings -- 32496
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val33id3val503id6val29id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32496, 345, 25690, 3, 2108)
	self:addTradeFlags(RecipeDB, 32496, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,103)
	self:addTradeAcquire(RecipeDB, 32496, 6, 942, 2, 17904)

	-- Heavy Clefthoof Boots -- 32497
	-- Cenarion Expedition - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val30id3val394id6val21id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32497, 345, 25691, 3, 2108)
	self:addTradeFlags(RecipeDB, 32497, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,103)
	self:addTradeAcquire(RecipeDB, 32497, 6, 942, 1, 17904)

	-- Felstalker Belt -- 32498
	-- Thrallmar - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val18id2val17id4val357id6val50id9val50id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32498, 340, 25695, 3, 2108)
	self:addTradeFlags(RecipeDB, 32498, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,104)
	self:addTradeAcquire(RecipeDB, 32498, 6, 947, 1, 17585)

	-- Felstalker Bracer -- 32499
	-- Thrallmar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val18id2val11id4val283id6val38id9val38id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32499, 350, 25697, 3, 2108)
	self:addTradeFlags(RecipeDB, 32499, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,104)
	self:addTradeAcquire(RecipeDB, 32499, 6, 947, 2, 17585)

	-- Felstalker Breastplate -- 32500
	-- Thrallmar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val26id2val6id3val26id4val646id6val52id9val52id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32500, 350, 25696, 3, 2108)
	self:addTradeFlags(RecipeDB, 32500, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,104)
	self:addTradeAcquire(RecipeDB, 32500, 6, 947, 2, 17585)

	-- Netherfury Belt -- 32501
	-- The Mag'har - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val27id3val339id6val21id19val21id20val9id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32501, 330, 25694, 3, 2108)
	self:addTradeFlags(RecipeDB, 32501, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58,108)
	self:addTradeAcquire(RecipeDB, 32501, 6, 941, 1, 20241)

	-- Netherfury Leggings -- 32502
	-- The Mag'har - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val37id3val527id6val29id19val29id20val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32502, 330, 25692, 3, 2108)
	self:addTradeFlags(RecipeDB, 32502, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58,108)
	self:addTradeAcquire(RecipeDB, 32502, 6, 941, 2, 20241)

	-- Netherfury Boots -- 32503
	-- The Mag'har - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val36id3val392id6val21id19val21id20val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32503, 340, 25693, 3, 2108)
	self:addTradeFlags(RecipeDB, 32503, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58,108)
	self:addTradeAcquire(RecipeDB, 32503, 6, 941, 3, 20241)

	-- Shadow Armor Kit -- 35520
	-- Instance: 3791 - type5category3maxlevel69territory1expansion1minlevel67nameAuchindoun: Sethekk Hallsid3791
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35520, 340, 29483, 2, 2108)
	self:addTradeFlags(RecipeDB, 35520, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35520, 3, 18320)

	-- Flame Armor Kit -- 35521
	-- Instance: 3848 - type5category3territory1expansion1minlevel70nameTempest Keep: The Arcatrazid3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35521, 340, 29485, 2, 2108)
	self:addTradeFlags(RecipeDB, 35521, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35521, 3, 20898)

	-- Frost Armor Kit -- 35522
	-- Instance: 3715 - type5category3territory1expansion1minlevel70nameCoilfang Reservoir: The Steamvaultid3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35522, 340, 29486, 2, 2108)
	self:addTradeFlags(RecipeDB, 35522, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35522, 3, 17797)

	-- Nature Armor Kit -- 35523
	-- Instance: 3717 - type5category3maxlevel64territory1expansion1minlevel62nameCoilfang Reservoir: The Slave Pensid3717
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35523, 340, 29487, 2, 2108)
	self:addTradeFlags(RecipeDB, 35523, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35523, 3, 17941)

	-- Arcane Armor Kit -- 35524
	-- Instance: 2366 - type5category3territory1expansion1minlevel70nameThe Caverns of Time: The Black Morassid2366
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35524, 340, 29488, 2, 2108)
	self:addTradeFlags(RecipeDB, 35524, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35524, 3, 17879)

	-- Enchanted Felscale Leggings -- 35525
	-- The Scryers - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val556id6val8id9val8id16val40id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35525, 340, 29489, 1, 2108)
	self:addTradeFlags(RecipeDB, 35525, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,110)
	self:addTradeAcquire(RecipeDB, 35525, 6, 934, 4, 19331)

	-- Enchanted Felscale Gloves -- 35526
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val27id3val397id6val6id9val6id16val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35526, 340, 29490, 1, 2108)
	self:addTradeFlags(RecipeDB, 35526, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,110)
	self:addTradeAcquire(RecipeDB, 35526, 6, 934, 2, 19331)

	-- Enchanted Felscale Boots -- 35527
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val27id3val437id6val6id9val6id16val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35527, 340, 29491, 1, 2108)
	self:addTradeFlags(RecipeDB, 35527, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,110)
	self:addTradeAcquire(RecipeDB, 35527, 6, 934, 3, 19331)

	-- Flamescale Boots -- 35528
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val27id3val437id6val6id9val6id16val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35528, 340, 29493, 1, 2108)
	self:addTradeFlags(RecipeDB, 35528, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,101)
	self:addTradeAcquire(RecipeDB, 35528, 6, 932, 3, 19321)

	-- Flamescale Leggings -- 35529
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val556id6val8id9val8id16val40id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35529, 340, 29492, 1, 2108)
	self:addTradeFlags(RecipeDB, 35529, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,101)
	self:addTradeAcquire(RecipeDB, 35529, 6, 932, 4, 19321)

	-- Reinforced Mining Bag -- 35530
	-- The Mag'har - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35530, 325, 29540, 1, 2108)
	self:addTradeFlags(RecipeDB, 35530, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB, 35530, 6, 941, 2, 20241)

	-- Flamescale Belt -- 35531
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val27id3val357id6val8id9val8id16val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35531, 340, 29494, 1, 2108)
	self:addTradeFlags(RecipeDB, 35531, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,101)
	self:addTradeAcquire(RecipeDB, 35531, 6, 932, 2, 19321)

	-- Enchanted Clefthoof Leggings -- 35532
	-- The Scryers - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id3val249id6val8id9val8id16val40id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35532, 340, 29495, 1, 2108)
	self:addTradeFlags(RecipeDB, 35532, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,110)
	self:addTradeAcquire(RecipeDB, 35532, 6, 934, 4, 19331)

	-- Enchanted Clefthoof Gloves -- 35533
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val27id3val178id6val6id9val6id16val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35533, 340, 29496, 1, 2108)
	self:addTradeFlags(RecipeDB, 35533, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,110)
	self:addTradeAcquire(RecipeDB, 35533, 6, 934, 3, 19331)

	-- Enchanted Clefthoof Boots -- 35534
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val27id3val196id6val6id9val6id16val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35534, 340, 29497, 1, 2108)
	self:addTradeFlags(RecipeDB, 35534, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,110)
	self:addTradeAcquire(RecipeDB, 35534, 6, 934, 2, 19331)

	-- Blastguard Pants -- 35535
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id3val249id6val8id9val8id16val40id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35535, 340, 29498, 1, 2108)
	self:addTradeFlags(RecipeDB, 35535, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,101)
	self:addTradeAcquire(RecipeDB, 35535, 6, 932, 4, 19321)

	-- Blastguard Boots -- 35536
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val27id3val196id6val6id9val6id16val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35536, 340, 29499, 1, 2108)
	self:addTradeFlags(RecipeDB, 35536, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,101)
	self:addTradeAcquire(RecipeDB, 35536, 6, 932, 3, 19321)

	-- Blastguard Belt -- 35537
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val27id3val160id6val8id9val8id16val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35537, 340, 29500, 1, 2108)
	self:addTradeFlags(RecipeDB, 35537, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,101)
	self:addTradeAcquire(RecipeDB, 35537, 6, 932, 2, 19321)

	-- Drums of Panic -- 35538
	-- Keepers of Time - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35538, 355, 29532, 1, 2108)
	self:addTradeFlags(RecipeDB, 35538, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB, 35538, 6, 989, 2, 21643)

	-- Drums of Restoration -- 35539
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35539, 335, 29531, 2, 2108)
	self:addTradeFlags(RecipeDB, 35539, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 35539, 7, 2)

	-- Drums of War -- 35540
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35540, 325, 29528, 1, 2108)
	self:addTradeFlags(RecipeDB, 35540, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 35540, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Drums of Battle -- 35543
	-- The Sha'tar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35543, 350, 29529, 1, 2108)
	self:addTradeFlags(RecipeDB, 35543, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB, 35543, 6, 935, 2, 21432)

	-- Drums of Speed -- 35544
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35544, 330, 29530, 2, 2108)
	self:addTradeFlags(RecipeDB, 35544, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 35544, 7, 2)

	-- Cobrahide Leg Armor -- 35549
	-- Honor Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35549, 315, 29533, 1, 2108)
	self:addTradeFlags(RecipeDB, 35549, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,104)
	self:addTradeAcquire(RecipeDB, 35549, 6, 946, 2, 17657)

	-- Nethercobra Leg Armor -- 35554
	-- Honor Hold - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35554, 345, 29535, 1, 2108)
	self:addTradeFlags(RecipeDB, 35554, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,104)
	self:addTradeAcquire(RecipeDB, 35554, 6, 946, 4, 17657)

	-- Clefthide Leg Armor -- 35555
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35555, 315, 29534, 1, 2108)
	self:addTradeFlags(RecipeDB, 35555, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,103)
	self:addTradeAcquire(RecipeDB, 35555, 6, 942, 2, 17904)

	-- Nethercleft Leg Armor -- 35557
	-- Cenarion Expedition - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35557, 345, 29536, 1, 2108)
	self:addTradeFlags(RecipeDB, 35557, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,103)
	self:addTradeAcquire(RecipeDB, 35557, 6, 942, 4, 17904)

	-- Cobrascale Hood -- 35558
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val37id2val42id3val271id6val74id9val74id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35558, 355, 29502, 4, 2108)
	self:addTradeFlags(RecipeDB, 35558, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35558, 7, 4)

	-- Cobrascale Gloves -- 35559
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val33id3val208id6val50id9val25id11val50id16val25id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35559, 355, 29503, 4, 2108)
	self:addTradeFlags(RecipeDB, 35559, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35559, 7, 4)

	-- Windscale Hood -- 35560
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val16id3val18id4val271id6val44id19val44id20val37id22val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35560, 355, 29504, 4, 2108)
	self:addTradeFlags(RecipeDB, 35560, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,57)
	self:addTradeAcquire(RecipeDB, 35560, 7, 4)

	-- Hood of Primal Life -- 35561
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val34id3val37id4val31id5val271id6val23id19val68id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35561, 355, 29505, 4, 2108)
	self:addTradeFlags(RecipeDB, 35561, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,57)
	self:addTradeAcquire(RecipeDB, 35561, 7, 4)

	-- Gloves of the Living Touch -- 35562
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val16id3val18id4val22id5val208id6val26id19val77id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35562, 355, 29506, 4, 2108)
	self:addTradeFlags(RecipeDB, 35562, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,57)
	self:addTradeAcquire(RecipeDB, 35562, 7, 4)

	-- Windslayer Wraps -- 35563
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val36id1val18id2val25id3val208id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35563, 355, 29507, 4, 2108)
	self:addTradeFlags(RecipeDB, 35563, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35563, 7, 4)

	-- Living Dragonscale Helm -- 35564
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val19id3val31id4val604id6val27id19val81id20val14id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35564, 355, 29508, 4, 2108)
	self:addTradeFlags(RecipeDB, 35564, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,53,58)
	self:addTradeAcquire(RecipeDB, 35564, 7, 4)

	-- Earthen Netherscale Boots -- 35567
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val28id1val27id3val18id4val511id6val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35567, 355, 29512, 4, 2108)
	self:addTradeFlags(RecipeDB, 35567, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35567, 7, 4)

	-- Windstrike Gloves -- 35568
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val36id1val18id2val25id3val465id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35568, 355, 29509, 4, 2108)
	self:addTradeFlags(RecipeDB, 35568, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35568, 7, 4)

	-- Netherdrake Helm -- 35572
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val16id3val26id4val604id6val64id9val31id11val64id16val31id18val12id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35572, 355, 29510, 4, 2108)
	self:addTradeFlags(RecipeDB, 35572, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35572, 7, 4)

	-- Netherdrake Gloves -- 35573
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val26id2val24id3val23id4val465id6val50id9val50id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35573, 355, 29511, 4, 2108)
	self:addTradeFlags(RecipeDB, 35573, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35573, 7, 4)

	-- Thick Netherscale Breastplate -- 35574
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val36id2val36id3val25id4val744id6val76id9val76id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35574, 355, 29514, 4, 2108)
	self:addTradeFlags(RecipeDB, 35574, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35574, 7, 4)

	-- Ebon Netherscale Breastplate -- 35575
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val25id3val23id4val846id6val80id9val31id11val80id16val31id18val8id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 35575, 365, 29515, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 35575, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35575, 1, 7866, 1, 7867)

	-- Ebon Netherscale Belt -- 35576
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val21id3val14id4val457id6val48id9val22id11val48id16val22id18val8id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 35576, 365, 29516, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 35576, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35576, 1, 7866, 1, 7867)

	-- Ebon Netherscale Bracers -- 35577
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val2id2val25id3val8id4val325id6val38id9val17id11val38id16val17id18val5id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 35577, 365, 29517, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 35577, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35577, 1, 7866, 1, 7867)

	-- Netherstrike Breastplate -- 35580
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val34id3val23id4val846id6val42id19val42id20val32id22val8id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 35580, 365, 29519, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 35580, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 35580, 1, 7866, 1, 7867)

	-- Netherstrike Belt -- 35582
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id3val17id4val457id6val30id19val30id20val16id22val9id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 35582, 365, 29520, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 35582, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 35582, 1, 7866, 1, 7867)

	-- Netherstrike Bracers -- 35584
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val13id3val13id4val355id6val22id19val22id20val17id22val6id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 35584, 365, 29521, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 35584, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 35584, 1, 7866, 1, 7867)

	-- Windhawk Hauberk -- 35585
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val28id3val29id4val29id5val379id6val51id19val79id20val19id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 10660
	self:addTradeSkill(RecipeDB, 35585, 365, 29522, 1, 2108, 10660)
	self:addTradeFlags(RecipeDB, 35585, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 35585, 1, 7870, 1, 7871)

	-- Windhawk Belt -- 35587
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val17id3val19id4val20id5val205id6val41id19val69id20val12id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 10660
	self:addTradeSkill(RecipeDB, 35587, 365, 29524, 1, 2108, 10660)
	self:addTradeFlags(RecipeDB, 35587, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 35587, 1, 7870, 1, 7871)

	-- Windhawk Bracers -- 35588
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val22id3val17id4val7id5val159id6val27id19val47id20val16id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 10660
	self:addTradeSkill(RecipeDB, 35588, 365, 29523, 1, 2108, 10660)
	self:addTradeFlags(RecipeDB, 35588, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 35588, 1, 7870, 1, 7871)

	-- Primalstrike Vest -- 35589
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val38id2val39id3val379id6val108id9val108id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 10658
	self:addTradeSkill(RecipeDB, 35589, 365, 29525, 1, 2108, 10658)
	self:addTradeFlags(RecipeDB, 35589, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35589, 1, 7868, 1, 7869)

	-- Primalstrike Belt -- 35590
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id2val32id3val205id6val84id9val84id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 10658
	self:addTradeSkill(RecipeDB, 35590, 365, 29526, 1, 2108, 10658)
	self:addTradeFlags(RecipeDB, 35590, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35590, 1, 7868, 1, 7869)

	-- Primalstrike Bracers -- 35591
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id2val21id3val159id6val64id9val64id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 10658
	self:addTradeSkill(RecipeDB, 35591, 365, 29527, 1, 2108, 10658)
	self:addTradeFlags(RecipeDB, 35591, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35591, 1, 7868, 1, 7869)

	-- Blackstorm Leggings -- 36074
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id2val20id3val132id6val32id9val32id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 10658
	self:addTradeSkill(RecipeDB, 36074, 260, 29964, 1, 2108, 10658)
	self:addTradeFlags(RecipeDB, 36074, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36074, 1, 7868, 1, 7869)

	-- Wildfeather Leggings -- 36075
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val16id3val11id4val12id5val132id6val23id19val40id20
	recipecount = recipecount + 1
	-- Recipe Specialty of 10660
	self:addTradeSkill(RecipeDB, 36075, 260, 29970, 1, 2108, 10660)
	self:addTradeFlags(RecipeDB, 36075, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 36075, 1, 7870, 1, 7871)

	-- Dragonstrike Leggings -- 36076
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val18id3val11id4val272id6val24id9val12id11val24id16val12id18val4id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 36076, 260, 29971, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 36076, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36076, 1, 7866, 1, 7867)

	-- Primalstorm Breastplate -- 36077
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id2val27id3val255id6val60id9val60id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 10658
	self:addTradeSkill(RecipeDB, 36077, 330, 29973, 1, 2108, 10658)
	self:addTradeFlags(RecipeDB, 36077, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36077, 1, 7868, 1, 7869)

	-- Living Crystal Breastplate -- 36078
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val25id3val23id4val17id5val255id6val48id19val84id20
	recipecount = recipecount + 1
	-- Recipe Specialty of 10660
	self:addTradeSkill(RecipeDB, 36078, 330, 29974, 1, 2108, 10660)
	self:addTradeFlags(RecipeDB, 36078, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 36078, 1, 7870, 1, 7871)

	-- Golden Dragonstrike Breastplate -- 36079
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val25id3val17id4val570id6val50id9val25id11val50id16val25id18val9id24
	recipecount = recipecount + 1
	-- Recipe Specialty of 10656
	self:addTradeSkill(RecipeDB, 36079, 330, 29975, 1, 2108, 10656)
	self:addTradeFlags(RecipeDB, 36079, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36079, 1, 7866, 1, 7867)

	-- Belt of Natural Power -- 36349
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val29id1val20id2val38id3val12id4val423id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36349, 365, 30042, 4, 2108)
	self:addTradeFlags(RecipeDB, 36349, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 36349, 7, 4)

	-- Belt of Deep Shadow -- 36351
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val32id2val14id3val227id6val66id9val66id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36351, 365, 30040, 4, 2108)
	self:addTradeFlags(RecipeDB, 36351, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 36351, 7, 4)

	-- Belt of the Black Eagle -- 36352
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val17id2val20id3val23id4val506id6val66id9val17id11val66id16val17id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36352, 365, 30046, 4, 2108)
	self:addTradeFlags(RecipeDB, 36352, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 36352, 7, 4)

	-- Monsoon Belt -- 36353
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val23id3val24id4val506id6val43id19val43id20val21id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36353, 365, 30044, 4, 2108)
	self:addTradeFlags(RecipeDB, 36353, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 36353, 7, 4)

	-- Boots of Natural Grace -- 36355
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val33id1val26id2val37id3val13id4val474id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36355, 365, 30041, 4, 2108)
	self:addTradeFlags(RecipeDB, 36355, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36355, 7, 4)

	-- Boots of Utter Darkness -- 36357
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val34id3val278id6val66id9val32id11val66id16val32id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36357, 365, 30039, 4, 2108)
	self:addTradeFlags(RecipeDB, 36357, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36357, 7, 4)

	-- Boots of the Crimson Hawk -- 36358
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val28id2val28id3val27id4val619id6val58id9val19id11val58id16val19id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36358, 365, 30045, 4, 2108)
	self:addTradeFlags(RecipeDB, 36358, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36358, 7, 4)

	-- Hurricane Boots -- 36359
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val25id3val26id4val619id6val39id19val39id20val26id22val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36359, 365, 30043, 4, 2108)
	self:addTradeFlags(RecipeDB, 36359, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,54,58)
	self:addTradeAcquire(RecipeDB, 36359, 7, 4)

	-- Boots of Shackled Souls -- 39997
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val40id3val628id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39997, 365, 32398, 1, 2108)
	self:addTradeFlags(RecipeDB, 39997, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 39997, 6, 1012, 1, 23159)

	-- Bracers of Shackled Souls -- 40000
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val400id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40000, 365, 32399, 1, 2108)
	self:addTradeFlags(RecipeDB, 40000, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 40000, 6, 1012, 1, 23159)

	-- Greaves of Shackled Souls -- 40001
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val54id3val799id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40001, 365, 32400, 1, 2108)
	self:addTradeFlags(RecipeDB, 40001, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 40001, 6, 1012, 2, 23159)

	-- Waistguard of Shackled Souls -- 40002
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val40id3val514id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40002, 365, 32397, 1, 2108)
	self:addTradeFlags(RecipeDB, 40002, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 40002, 6, 1012, 2, 23159)

	-- Redeemed Soul Moccasins -- 40003
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val40id3val282id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40003, 365, 32394, 1, 2108)
	self:addTradeFlags(RecipeDB, 40003, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40003, 6, 1012, 2, 23159)

	-- Redeemed Soul Wristguards -- 40004
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id3val179id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40004, 365, 32395, 1, 2108)
	self:addTradeFlags(RecipeDB, 40004, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40004, 6, 1012, 2, 23159)

	-- Redeemed Soul Legguards -- 40005
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val54id3val359id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40005, 365, 32396, 1, 2108)
	self:addTradeFlags(RecipeDB, 40005, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40005, 6, 1012, 1, 23159)

	-- Redeemed Soul Cinch -- 40006
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val40id3val231id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40006, 365, 32393, 1, 2108)
	self:addTradeFlags(RecipeDB, 40006, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40006, 6, 1012, 1, 23159)

	-- Bracers of Renewed Life -- 41156
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val26id3val20id4val194id6val22id19val64id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41156, 365, 32582, 4, 2108)
	self:addTradeFlags(RecipeDB, 41156, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 41156, 7, 4)

	-- Shoulderpads of Renewed Life -- 41157
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val34id3val29id4val333id6val27id19val81id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41157, 365, 32583, 4, 2108)
	self:addTradeFlags(RecipeDB, 41157, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 41157, 7, 4)

	-- Swiftstrike Bracers -- 41158
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id2val34id3val194id6val50id9val50id16val27id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41158, 365, 32580, 4, 2108)
	self:addTradeFlags(RecipeDB, 41158, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 41158, 7, 4)

	-- Swiftstrike Shoulders -- 41160
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val29id2val34id3val333id6val74id9val74id16val38id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41160, 365, 32581, 4, 2108)
	self:addTradeFlags(RecipeDB, 41160, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 41160, 7, 4)

	-- Bindings of Lightning Reflexes -- 41161
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val21id2val15id3val16id4val432id6val56id9val56id16val27id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41161, 365, 32574, 4, 2108)
	self:addTradeFlags(RecipeDB, 41161, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 41161, 7, 4)

	-- Shoulders of Lightning Reflexes -- 41162
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val27id2val19id3val21id4val741id6val74id9val74id16val37id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41162, 365, 32575, 4, 2108)
	self:addTradeFlags(RecipeDB, 41162, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 41162, 7, 4)

	-- Living Earth Bindings -- 41163
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val27id3val20id4val432id6val22id19val64id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41163, 365, 32577, 4, 2108)
	self:addTradeFlags(RecipeDB, 41163, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,53,58)
	self:addTradeAcquire(RecipeDB, 41163, 7, 4)

	-- Living Earth Shoulders -- 41164
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val32id3val28id4val741id6val29id19val86id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41164, 365, 32579, 4, 2108)
	self:addTradeFlags(RecipeDB, 41164, 10,21,22,23,24,25,26,27,28,29,30,37,41,47,53,58)
	self:addTradeAcquire(RecipeDB, 41164, 7, 4)

	-- Cloak of Darkness -- 42546
	-- The Violet Eye - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val23id1val25id3val101id6val24id11
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42546, 350, 33122, 3, 2108)
	self:addTradeFlags(RecipeDB, 42546, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60,114)
	self:addTradeAcquire(RecipeDB, 42546, 6, 967, 4, 18255)

	-- Shadowprowler's Chestguard -- 42731
	-- The Violet Eye - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val32id1val40id2val12id3val333id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42731, 355, 33204, 4, 2108)
	self:addTradeFlags(RecipeDB, 42731, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,114)
	self:addTradeAcquire(RecipeDB, 42731, 6, 967, 3, 18255)

	-- Knothide Ammo Pouch -- 44343
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44343, 305, 34099, 2, 2108)
	self:addTradeFlags(RecipeDB, 44343, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Knothide Quiver -- 44344
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44344, 305, 34100, 2, 2108)
	self:addTradeFlags(RecipeDB, 44344, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Quiver of a Thousand Feathers -- 44359
	-- Lower City - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44359, 340, 34105, 1, 2108)
	self:addTradeFlags(RecipeDB, 44359, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,107)
	self:addTradeAcquire(RecipeDB, 44359, 6, 1011, 3, 21655)

	-- Netherscale Ammo Pouch -- 44768
	-- Thrallmar - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44768, 340, 34106, 1, 2108)
	self:addTradeFlags(RecipeDB, 44768, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,104)
	self:addTradeAcquire(RecipeDB, 44768, 6, 947, 3, 17585)

	-- Glove Reinforcements -- 44770
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44770, 345, 34207, 2, 2108)
	self:addTradeFlags(RecipeDB, 44770, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Winter Boots -- 44953
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val2id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44953, 285, 34086, 2, 2108)
	self:addTradeFlags(RecipeDB, 44953, 3,7,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 44953, 5, 1)

	-- Heavy Knothide Armor Kit -- 44970
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44970, 345, 34330, 1, 2108)
	self:addTradeFlags(RecipeDB, 44970, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Leatherworker's Satchel -- 45100
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45100, 290, 34482, 2, 2108)
	self:addTradeFlags(RecipeDB, 45100, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bag of Many Hides -- 45117
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45117, 350, 34490, 2, 2108)
	self:addTradeFlags(RecipeDB, 45117, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 45117, 3, 22143, 3, 22144, 3, 22148, 3, 23022)

	-- Leather Gauntlets of the Sun -- 46132
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val25id3val26id4val30id5val312id6val28id19val84id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46132, 340, 34372, 4, 2108)
	self:addTradeFlags(RecipeDB, 46132, 6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 46132, 3, 25369, 3, 25507)

	-- Fletcher's Gloves of the Phoenix -- 46133
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id2val33id3val25id4val694id6val82id9val82id16val34id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46133, 340, 34374, 4, 2108)
	self:addTradeFlags(RecipeDB, 46133, 6,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 46133, 3, 25371)

	-- Gloves of Immortal Dusk -- 46134
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id2val33id3val312id6val90id9val30id11val90id16val30id18val154id41
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46134, 340, 34370, 4, 2108)
	self:addTradeFlags(RecipeDB, 46134, 6,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 46134, 3, 25368, 3, 25369)

	-- Sun-Drenched Scale Gloves -- 46135
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val45id3val36id4val694id6val28id19val84id20val1id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46135, 340, 34376, 4, 2108)
	self:addTradeFlags(RecipeDB, 46135, 6,21,22,23,24,25,26,27,28,29,30,36,41,47,53,58)
	self:addTradeAcquire(RecipeDB, 46135, 3, 25369, 3, 25370, 3, 25371)

	-- Leather Chestguard of the Sun -- 46136
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val48id3val41id4val33id5val499id6val45id19val134id20val15id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46136, 340, 34371, 4, 2108)
	self:addTradeFlags(RecipeDB, 46136, 6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,53,57)
	self:addTradeAcquire(RecipeDB, 46136, 3, 25507)

	-- Embrace of the Phoenix -- 46137
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val44id2val43id3val30id4val1110id6val112id9val112id16val44id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46137, 340, 34373, 4, 2108)
	self:addTradeFlags(RecipeDB, 46137, 6,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 46137, 3, 25367, 3, 25370)

	-- Carapace of Sun and Shadow -- 46138
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val42id2val45id3val499id6val128id9val128id16val38id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46138, 340, 34369, 4, 2108)
	self:addTradeFlags(RecipeDB, 46138, 6,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 46138, 3, 25369)

	-- Sun-Drenched Scale Chestguard -- 46139
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val48id3val41id4val1110id6val45id19val134id20val12id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46139, 340, 34375, 4, 2108)
	self:addTradeFlags(RecipeDB, 46139, 6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,53,58)
	self:addTradeAcquire(RecipeDB, 46139, 3, 25367, 3, 25507)

	-- Borean Leather -- 50935
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50935, 275, 33568, 1, 2108)
	--self:addTradeFlags(RecipeDB, 50935, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Heavy Borean Leather -- 50936
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50936, 325, 38425, 1, 2108)
	--self:addTradeFlags(RecipeDB, 50936, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Arctic Chestpiece -- 50944
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id2val33id3val326id6val106id9val106id16
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50944, 340, 38400, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50944, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Leggings -- 50945
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val18id3val156id6val100id9val50id11val100id16val50id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50945, 350, 38401, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50945, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Arctic Shoulderpads -- 50946
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val30id3val258id6val98id9val98id16
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50946, 360, 38402, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50946, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Gloves -- 50947
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val27id3val209id6val43id11val43id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50947, 350, 38403, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50947, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Boots -- 50948
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val41id2val26id3val218id6val46id9val46id16
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50948, 340, 38404, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50948, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Belt -- 50949
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val38id2val32id3val92id6val32id9val32id16
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50949, 360, 38405, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50949, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Borean Armor Kit -- 50962
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50962, 345, 38375, 1, 2108)
	--self:addTradeFlags(RecipeDB, 50962, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Heavy Borean Armor Kit -- 50963
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50963, 365, 38376, 2, 2108)
	--self:addTradeFlags(RecipeDB, 50963, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Verdant Tundra Belt -- 53686
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val34id3val29id4val195id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53686, 355, 39710, 2, 2108)
	--self:addTradeFlags(RecipeDB, 53686, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Verdant Tundra Cap -- 53687
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val51id3val43id4val288id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53687, 355, 39707, 2, 2108)
	--self:addTradeFlags(RecipeDB, 53687, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Verdant Tundra Boots -- 53688
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val45id3val23id4val238id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53688, 355, 39709, 2, 2108)
	--self:addTradeFlags(RecipeDB, 53688, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Verdant Tundra Bracers -- 53689
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id4val20id5val151id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53689, 355, 39711, 2, 2108)
	--self:addTradeFlags(RecipeDB, 53689, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Verdant Tundra Shoulderpads -- 53690
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val26id4val33id5val266id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53690, 355, 39708, 2, 2108)
	--self:addTradeFlags(RecipeDB, 53690, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	return recipecount

end
