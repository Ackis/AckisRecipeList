--[[

************************************************************************

ARL-LeatherWork.lua

Leatherworking data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
191 found from data mining.
5 ignored.

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
	self:addTradeFlags(RecipeDB, 2158, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 2163, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2163, 7, 2)

	-- Fine Leather Gloves -- 2164
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2164, 75, 2312, 2, 2108)
	self:addTradeFlags(RecipeDB, 2164, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 2169, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 3762, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeSkill(RecipeDB, 3765, 120, 4248, 2, 2108)
	self:addTradeFlags(RecipeDB, 3765, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 3767, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 3769, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 3771, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 3773, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	-- Instance: 796 - type1maxlevel45category3territory4minlevel34nameScarlet Monasteryid796
	-- Instance: 796 - type1maxlevel45category3territory4minlevel34nameScarlet Monasteryid796
	-- Instance: 796 - type1maxlevel45category3territory4minlevel34nameScarlet Monasteryid796
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id4val6id5val56id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3775, 170, 4258, 3, 2108)
	self:addTradeFlags(RecipeDB, 3775, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3775, 3, 1085, 3, 2554, 3, 4143, 3, 4147, 3, 4287, 3, 4296, 3, 4540, 3, 4674, 3, 7346)

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
	self:addTradeFlags(RecipeDB, 3777, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3777, 7, 2)

	-- Gem-studded Leather Belt -- 3778
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id3val6id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3778, 185, 4262, 1, 2108)
	self:addTradeFlags(RecipeDB, 3778, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Barbaric Belt -- 3779
	-- Instance: 1176 - type1maxlevel47category3territory1minlevel43nameZul'Farrakid1176
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id1val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3779, 200, 4264, 3, 2108)
	self:addTradeFlags(RecipeDB, 3779, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3779, 3, 780, 3, 5649)

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
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id3val98id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4096, 165, 4455, 2, 2108)
	self:addTradeFlags(RecipeDB, 4096, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Raptor Hide Belt -- 4097
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id3val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4097, 165, 4456, 2, 2108)
	self:addTradeFlags(RecipeDB, 4097, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

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
	-- Instance: 1581 - type1maxlevel20category3territory2minlevel15nameThe Deadminesid1581
	-- Mob Drop
	-- Instance: 206 - type1maxlevel72category3territory1expansion2minlevel70nameUtgarde Keepid206
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val2id1val3id2val42id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6702, 90, 5780, 1, 2108)
	self:addTradeFlags(RecipeDB, 6702, 1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6702, 3, 1732, 3, 3256, 3, 3385, 2, 843, 2, 4186)

	-- Murloc Scale Breastplate -- 6703
	-- Instance: 1581 - type1maxlevel20category3territory2minlevel15nameThe Deadminesid1581
	-- Mob Drop
	-- Instance: 206 - type1maxlevel72category3territory1expansion2minlevel70nameUtgarde Keepid206
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id1val3id2val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6703, 95, 5781, 1, 2108)
	self:addTradeFlags(RecipeDB, 6703, 1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6703, 3, 657, 3, 3386, 2, 843, 2, 4186)

	-- Thick Murloc Armor -- 6704
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val9id1val8id3val100id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6704, 170, 5782, 2, 2108)
	self:addTradeFlags(RecipeDB, 6704, 1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6704, 3, 938, 3, 1160, 2, 2393, 2, 2846)

	-- Murloc Scale Bracers -- 6705
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id1val6id3val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6705, 190, 5783, 2, 2108)
	self:addTradeFlags(RecipeDB, 6705, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6705, 3, 1561)

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
	self:addTradeFlags(RecipeDB, 7133, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeAcquire(RecipeDB, 7149, 2, 3958, 2, 4877)

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
	self:addTradeFlags(RecipeDB, 7153, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
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
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val2id2val2id3val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7953, 90, 6466, 1, 2108)
	self:addTradeFlags(RecipeDB, 7953, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Deviate Scale Gloves -- 7954
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val3id2val3id3val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7954, 105, 6467, 1, 2108)
	self:addTradeFlags(RecipeDB, 7954, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

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
	self:addTradeSkill(RecipeDB, 8322, 90, 6709, 2, 2108)
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
	self:addTradeFlags(RecipeDB, 9064, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	-- Item Stats: val53id6val1id27val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9145, 125, 7348, 1, 2108)
	self:addTradeFlags(RecipeDB, 9145, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	self:addTradeAcquire(RecipeDB, 9145, 1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Herbalist's Gloves -- 9146
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9146, 135, 7349, 2, 2108)
	self:addTradeFlags(RecipeDB, 9146, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Earthen Leather Shoulders -- 9147
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val7id3val67id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9147, 135, 7352, 1, 2108)
	self:addTradeFlags(RecipeDB, 9147, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9147, 2, 3537)

	-- Pilferer's Gloves -- 9148
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id2val56id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9148, 140, 7358, 2, 2108)
	self:addTradeFlags(RecipeDB, 9148, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9148, 7, 2)

	-- Heavy Earthen Gloves -- 9149
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val57id6val16id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9149, 145, 7359, 2, 2108)
	self:addTradeFlags(RecipeDB, 9149, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 9195, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	self:addTradeFlags(RecipeDB, 9197, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9197, 7, 2)

	-- Frost Leather Cloak -- 9198
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val24id6val9id49
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
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9202, 190, 7386, 2, 2108)
	self:addTradeFlags(RecipeDB, 9202, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

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
	-- Instance: 1176 - type1maxlevel47category3territory1minlevel43nameZul'Farrakid1176
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id2val3id3val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9207, 200, 7390, 3, 2108)
	self:addTradeFlags(RecipeDB, 9207, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9207, 3, 4676, 3, 5649, 3, 24830)

	-- Swift Boots -- 9208
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id3val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9208, 200, 7391, 2, 2108)
	self:addTradeFlags(RecipeDB, 9208, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id3val10id5val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10490, 200, 8174, 3, 2108)
	self:addTradeFlags(RecipeDB, 10490, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10490, 3, 2249, 3, 4852)

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
	self:addTradeAcquire(RecipeDB, 10509, 7, 1, 2, 7852)

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
	self:addTradeAcquire(RecipeDB, 10516, 2, 8160)

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
	self:addTradeFlags(RecipeDB, 10520, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10520, 7, 2)

	-- Tough Scorpid Breastplate -- 10525
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val15id2val7id5val245id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10525, 220, 8203, 2, 2108)
	self:addTradeFlags(RecipeDB, 10525, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10525, 3, 5419, 3, 5422, 3, 5425, 3, 5616, 3, 5618)

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
	self:addTradeFlags(RecipeDB, 10531, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10531, 7, 2)

	-- Tough Scorpid Bracers -- 10533
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val7id2val6id5val107id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10533, 220, 8205, 2, 2108)
	self:addTradeFlags(RecipeDB, 10533, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10533, 3, 5420, 3, 5422, 3, 5423, 3, 5425, 3, 5426, 3, 5615, 3, 5617)

	-- Tough Scorpid Gloves -- 10542
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id2val9id5val155id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10542, 225, 8204, 2, 2108)
	self:addTradeFlags(RecipeDB, 10542, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10542, 3, 5419, 3, 5422, 3, 5425, 3, 5616, 3, 5618)

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
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 10550, 230, 8195, 2, 2108)
	--self:addTradeFlags(RecipeDB, 10550, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
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
	self:addTradeFlags(RecipeDB, 10554, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10554, 3, 5422, 3, 5425, 3, 5615)

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
	self:addTradeFlags(RecipeDB, 10560, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10560, 7, 2)

	-- Big Voodoo Cloak -- 10562
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val9id4val5id5val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10562, 240, 8216, 2, 2108)
	self:addTradeFlags(RecipeDB, 10562, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 10562, 7, 2)

	-- Tough Scorpid Shoulders -- 10564
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id2val10id5val197id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10564, 240, 8207, 2, 2108)
	self:addTradeFlags(RecipeDB, 10564, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10564, 3, 5419, 3, 5420, 3, 5422, 3, 5423, 3, 5425, 3, 5426, 3, 5617, 3, 5623, 3, 7805, 3, 7883)

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
	self:addTradeFlags(RecipeDB, 10568, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10568, 3, 5422, 3, 5423, 3, 5425, 3, 5615, 3, 5623)

	-- Tough Scorpid Helm -- 10570
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val14id2val14id5val222id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10570, 250, 8208, 2, 2108)
	self:addTradeFlags(RecipeDB, 10570, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10570, 3, 5419, 3, 5420, 3, 5422, 3, 5423, 3, 5425, 3, 5426, 3, 5615, 3, 5623, 3, 7805, 3, 7883)

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
	-- Item Stats: val7id3val6id5val171id6val14id44
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
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id3val8id5val122id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19048, 255, 15077, 1, 2108)
	self:addTradeFlags(RecipeDB, 19048, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Wicked Leather Gauntlets -- 19049
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id2val11id3val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19049, 260, 15083, 1, 2108)
	self:addTradeFlags(RecipeDB, 19049, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

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
	self:addTradeFlags(RecipeDB, 19051, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19051, 3, 5990, 3, 5993, 3, 6005)

	-- Wicked Leather Bracers -- 19052
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id2val5id3val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19052, 265, 15084, 2, 2108)
	self:addTradeFlags(RecipeDB, 19052, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19052, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Chimeric Gloves -- 19053
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val87id6val11id32val12id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19053, 265, 15074, 1, 2108)
	self:addTradeFlags(RecipeDB, 19053, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Runic Leather Gauntlets -- 19055
	-- Trainer
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val88id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19055, 270, 15091, 2, 2108)
	self:addTradeFlags(RecipeDB, 19055, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19055, 3, 12397, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

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
	self:addTradeFlags(RecipeDB, 19059, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19059, 3, 7035)

	-- Green Dragonscale Leggings -- 19060
	-- Instance: 1477 - type1maxlevel55category3territory1minlevel50nameThe Temple of Atal'Hakkarid1477
	-- Instance: 1477 - type1maxlevel55category3territory1minlevel50nameThe Temple of Atal'Hakkarid1477
	-- Instance: 1477 - type1maxlevel55category3territory1minlevel50nameThe Temple of Atal'Hakkarid1477
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val10id3val22id5val282id6val11id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19060, 270, 15046, 3, 2108)
	self:addTradeFlags(RecipeDB, 19060, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19060, 3, 5225, 3, 5226, 3, 5708)

	-- Living Shoulders -- 19061
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id3val13id5val117id6val3id34val16id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19061, 270, 15061, 1, 2108)
	self:addTradeFlags(RecipeDB, 19061, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Ironfeather Shoulders -- 19062
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id4val8id5val117id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19062, 270, 15067, 1, 2108)
	self:addTradeFlags(RecipeDB, 19062, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Chimeric Boots -- 19063
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val99id6val12id32val12id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19063, 275, 15073, 2, 2108)
	self:addTradeFlags(RecipeDB, 19063, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19063, 7, 2)

	-- Heavy Scorpid Gauntlets -- 19064
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val12id5val186id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19064, 275, 15078, 2, 2108)
	self:addTradeFlags(RecipeDB, 19064, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19064, 3, 7025, 3, 7055)

	-- Runic Leather Bracers -- 19065
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val10id4val10id5val63id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19065, 275, 15092, 2, 2108)
	self:addTradeFlags(RecipeDB, 19065, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19065, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

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
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val138id6val12id26val28id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19067, 275, 15057, 1, 2108)
	self:addTradeFlags(RecipeDB, 19067, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	-- No acquire information

	-- Warbear Harness -- 19068
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id1val27id3val158id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19068, 275, 15064, 1, 2108)
	self:addTradeFlags(RecipeDB, 19068, 21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	-- No acquire information

	-- Heavy Scorpid Belt -- 19070
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val12id5val170id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19070, 280, 15082, 2, 2108)
	self:addTradeFlags(RecipeDB, 19070, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19070, 7, 2)

	-- Wicked Leather Headband -- 19071
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val16id2val16id3val118id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19071, 280, 15086, 2, 2108)
	self:addTradeFlags(RecipeDB, 19071, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19071, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Runic Leather Belt -- 19072
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val82id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19072, 280, 15093, 2, 2108)
	self:addTradeFlags(RecipeDB, 19072, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19072, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Chimeric Leggings -- 19073
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val127id6val16id32val16id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19073, 280, 15072, 2, 2108)
	self:addTradeFlags(RecipeDB, 19073, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19073, 7, 2)

	-- Frostsaber Leggings -- 19074
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val129id6val17id35val16id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19074, 285, 15069, 2, 2108)
	self:addTradeFlags(RecipeDB, 19074, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19074, 3, 7440, 3, 7443, 3, 7448, 3, 7458, 3, 7460)

	-- Heavy Scorpid Leggings -- 19075
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val12id3val20id5val269id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19075, 285, 15079, 2, 2108)
	self:addTradeFlags(RecipeDB, 19075, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19075, 3, 7027)

	-- Volcanic Breastplate -- 19076
	-- Instance: 1583 - type1maxlevel60category3territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val268id6val20id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19076, 285, 15053, 2, 2108)
	self:addTradeFlags(RecipeDB, 19076, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19076, 3, 9259)

	-- Blue Dragonscale Breastplate -- 19077
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val28id4val8id5val338id6val8id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19077, 285, 15048, 1, 2108)
	self:addTradeFlags(RecipeDB, 19077, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Living Leggings -- 19078
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val8id3val25id5val142id6val5id34val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19078, 285, 15060, 3, 2108)
	self:addTradeFlags(RecipeDB, 19078, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19078, 3, 7158, 3, 8957, 3, 8961)

	-- Stormshroud Armor -- 19079
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: Tanking, 
	-- Item Stats: val163id6val12id26val28id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19079, 285, 15056, 3, 2108)
	self:addTradeFlags(RecipeDB, 19079, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,57)
	self:addTradeAcquire(RecipeDB, 19079, 3, 6138)

	-- Warbear Woolies -- 19080
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val28id1val12id3val142id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19080, 285, 15065, 1, 2108)
	self:addTradeFlags(RecipeDB, 19080, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Chimeric Vest -- 19081
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val150id6val16id32val17id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19081, 290, 15075, 2, 2108)
	self:addTradeFlags(RecipeDB, 19081, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val20id2val12id3val131id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19083, 290, 15087, 2, 2108)
	self:addTradeFlags(RecipeDB, 19083, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19083, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Devilsaur Gauntlets -- 19084
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val9id3val103id6val14id44val28id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19084, 290, 15063, 1, 2108)
	self:addTradeFlags(RecipeDB, 19084, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Black Dragonscale Breastplate -- 19085
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val8id3val344id6val12id33val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19085, 290, 15050, 1, 2108)
	self:addTradeFlags(RecipeDB, 19085, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Ironfeather Breastplate -- 19086
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id4val28id5val165id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19086, 290, 15066, 3, 2108)
	self:addTradeFlags(RecipeDB, 19086, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19086, 3, 2644, 3, 2681, 3, 2926)

	-- Blue Dragonscale Shoulders -- 19089
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val21id4val6id5val262id6val6id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19089, 295, 15049, 3, 2108)
	self:addTradeFlags(RecipeDB, 19089, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19089, 3, 6146)

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
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id2val10id3val144id6val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20853, 295, 16982, 1, 2108)
	self:addTradeFlags(RecipeDB, 20853, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 20853, 2, 12944)

	-- Gloves of the Greatfather -- 21943
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val66id6val11id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21943, 190, 17721, 2, 2108)
	self:addTradeFlags(RecipeDB, 21943, 7,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
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
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id3val76id6val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22711, 200, 18238, 1, 2108)
	self:addTradeFlags(RecipeDB, 22711, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Gordok Ogre Suit -- 22815
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22815, 275, 18258, 2, 2108)
	self:addTradeFlags(RecipeDB, 22815, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Heavy Leather Ball -- 23190
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23190, 150, 18662, 1, 2108)
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
	self:addTradeAcquire(RecipeDB, 23399, 2, 4589)

	-- Might of the Timbermaw -- 23703
	-- Timbermaw Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val21id1val9id3val93id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23703, 290, 19044, 1, 2108)
	self:addTradeFlags(RecipeDB, 23703, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,99)
	self:addTradeAcquire(RecipeDB, 23703, 6, 576, 2, 11557)

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

	-- Green Dragonscale Gauntlets -- 24655
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val5id3val18id5val208id6val9id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24655, 280, 20296, 1, 2108)
	self:addTradeFlags(RecipeDB, 24655, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 24655, 1, 7866, 1, 7867)

	-- Black Whelp Tunic -- 24940
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val5id1val3id2val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24940, 100, 20575, 1, 2108)
	self:addTradeFlags(RecipeDB, 24940, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 24940, 2, 777)

	-- Knothide Leather -- 32454
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32454, 290, 21887, 1, 2108)
	self:addTradeFlags(RecipeDB, 32454, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 32454, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Knothide Armor Kit -- 32456
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32456, 280, 25650, 1, 2108)
	self:addTradeFlags(RecipeDB, 32456, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 32456, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Gloves -- 32462
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val19id2val276id6val40id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32462, 290, 25654, 1, 2108)
	self:addTradeFlags(RecipeDB, 32462, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32462, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Pants -- 32466
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val386id6val8id24val23id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32466, 290, 25662, 1, 2108)
	self:addTradeFlags(RecipeDB, 32466, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32466, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Gloves -- 32470
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val15id2val22id3val127id6val30id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32470, 290, 25669, 1, 2108)
	self:addTradeFlags(RecipeDB, 32470, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32470, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Boots -- 32478
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val11id1val11id2val18id3val11id4val140id6val13id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32478, 290, 25673, 1, 2108)
	self:addTradeFlags(RecipeDB, 32478, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32478, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Comfortable Insoles -- 32482
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32482, 300, 25679, 1, 2108)
	self:addTradeFlags(RecipeDB, 32482, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32482, 2, 16689)

	-- Blackstorm Leggings -- 36074
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val13id2val20id3val132id6val10id45val32id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36074, 260, 29964, 1, 2108, 10658) -- Speciality
	self:addTradeFlags(RecipeDB, 36074, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36074, 1, 7868, 1, 7869)

	-- Wildfeather Leggings -- 36075
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val16id3val11id4val12id5val132id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36075, 260, 29970, 1, 2108, 10660) -- Speciality
	self:addTradeFlags(RecipeDB, 36075, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36075, 1, 7870, 1, 7871)

	-- Dragonstrike Leggings -- 36076
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val18id3val11id4val272id6val4id24val12id44val24id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36076, 260, 29971, 1, 2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 36076, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36076, 1, 7866, 1, 7867)

	-- Winter Boots -- 44953
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, Seasonal, 
	-- Item Stats: 
	-- Item Stats: val2id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44953, 285, 34086, 2, 2108)
	self:addTradeFlags(RecipeDB, 44953, 3,7,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 44953, 5, 1)

	-- Leatherworker's Satchel -- 45100
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45100, 290, 34482, 2, 2108)
	self:addTradeFlags(RecipeDB, 45100, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bracers of Shackled Souls -- 52733
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val400id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52733, 375, 32399, 1, 2108)
	self:addTradeFlags(RecipeDB, 52733, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 52733, 6, 1012, 1, 23159)

	return recipecount

end
