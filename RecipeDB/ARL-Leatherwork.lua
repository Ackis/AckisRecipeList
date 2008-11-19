--[[

************************************************************************

ARL-Leatherwork.lua

Leatherworking data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
491 found from data mining.
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
	self:addTradeSkill(RecipeDB, 2149,10,2302,1,2108)
	self:addTradeFlags(RecipeDB, 2149,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Light Armor Kit -- 2152
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2152,1,2304,1,2108)
	self:addTradeFlags(RecipeDB, 2152,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Handstitched Leather Pants -- 2153
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2153,15,2303,1,2108)
	self:addTradeFlags(RecipeDB, 2153,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2153,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Fine Leather Boots -- 2158
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2158,90,2307,2,2108)
	self:addTradeFlags(RecipeDB, 2158,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2158,7, 2)

	-- Fine Leather Cloak -- 2159
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val2id3val14id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2159,75,2308,1,2108)
	self:addTradeFlags(RecipeDB, 2159,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2159,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Vest -- 2160
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val2id3val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2160,40,2300,1,2108)
	self:addTradeFlags(RecipeDB, 2160,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2160,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Boots -- 2161
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val2id3val2id5val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2161,55,2309,1,2108)
	self:addTradeFlags(RecipeDB, 2161,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2161,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Cloak -- 2162
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val12id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2162,60,2310,1,2108)
	self:addTradeFlags(RecipeDB, 2162,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2162,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- White Leather Jerkin -- 2163
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2163,60,2311,2,2108)
	self:addTradeFlags(RecipeDB, 2163,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2163,7, 2)

	-- Fine Leather Gloves -- 2164
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val2id4val2id5val43id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2164,75,2312,2,2108)
	self:addTradeFlags(RecipeDB, 2164,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2164,7, 2)

	-- Medium Armor Kit -- 2165
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2165,100,2313,1,2108)
	self:addTradeFlags(RecipeDB, 2165,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 2165,1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Toughened Leather Armor -- 2166
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val80id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2166,120,2314,1,2108)
	self:addTradeFlags(RecipeDB, 2166,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2166,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Boots -- 2167
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2167,100,2315,1,2108)
	self:addTradeFlags(RecipeDB, 2167,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 2167,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Cloak -- 2168
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val17id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2168,110,2316,1,2108)
	self:addTradeFlags(RecipeDB, 2168,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 2168,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Tunic -- 2169
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id2val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2169,100,2317,2,2108)
	self:addTradeFlags(RecipeDB, 2169,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 2169,7, 2)

	-- Light Leather -- 2881
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2881,1,2318,1,2108)
	self:addTradeFlags(RecipeDB, 2881,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Handstitched Leather Belt -- 3753
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val29id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3753,25,4237,1,2108)
	self:addTradeFlags(RecipeDB, 3753,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3753,1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Gloves -- 3756
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val39id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3756,55,4239,1,2108)
	self:addTradeFlags(RecipeDB, 3756,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3756,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Embossed Leather Pants -- 3759
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val2id3val3id5val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3759,75,4242,1,2108)
	self:addTradeFlags(RecipeDB, 3759,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3759,1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Cloak -- 3760
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val20id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3760,150,3719,1,2108)
	self:addTradeFlags(RecipeDB, 3760,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 3760,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Fine Leather Tunic -- 3761
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id2val3id3val73id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3761,85,4243,1,2108)
	self:addTradeFlags(RecipeDB, 3761,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3761,1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Leather Vest -- 3762
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id3val4id5val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3762,100,4244,2,2108)
	self:addTradeFlags(RecipeDB, 3762,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3762,7, 2)

	-- Fine Leather Belt -- 3763
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val38id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3763,80,4246,1,2108)
	self:addTradeFlags(RecipeDB, 3763,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3763,1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Leather Gloves -- 3764
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id3val5id5val57id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3764,145,4247,1,2108)
	self:addTradeFlags(RecipeDB, 3764,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3764,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Gloves -- 3765
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3765,120,4248,2,2108)
	self:addTradeFlags(RecipeDB, 3765,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3765,7, 2)

	-- Dark Leather Belt -- 3766
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id2val4id3val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3766,125,4249,1,2108)
	self:addTradeFlags(RecipeDB, 3766,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3766,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Hillman's Belt -- 3767
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id3val4id5val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3767,120,4250,2,2108)
	self:addTradeFlags(RecipeDB, 3767,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3767,7, 2)

	-- Hillman's Shoulders -- 3768
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id3val4id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3768,130,4251,1,2108)
	self:addTradeFlags(RecipeDB, 3768,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3768,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dark Leather Shoulders -- 3769
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val7id2val68id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3769,140,4252,2,2108)
	self:addTradeFlags(RecipeDB, 3769,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3769,7, 2)

	-- Toughened Leather Gloves -- 3770
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id2val3id3val6id5val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3770,135,4253,1,2108)
	self:addTradeFlags(RecipeDB, 3770,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3770,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Barbaric Gloves -- 3771
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id2val5id3val4id5val58id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3771,150,4254,2,2108)
	self:addTradeFlags(RecipeDB, 3771,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3771,7, 2)

	-- Green Leather Armor -- 3772
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id2val8id5val95id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3772,155,4255,1,2108)
	self:addTradeFlags(RecipeDB, 3772,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3772,2, 2679, 2, 2698)

	-- Guardian Armor -- 3773
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id4val9id5val102id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3773,175,4256,2,2108)
	self:addTradeFlags(RecipeDB, 3773,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3773,7, 2)

	-- Green Leather Belt -- 3774
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id2val6id5val54id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3774,160,4257,1,2108)
	self:addTradeFlags(RecipeDB, 3774,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3774,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Belt -- 3775
	-- Instance: 796 - type1maxlevel45category3territory4nameScarlet Monasteryminlevel34id796
	-- Instance: 796 - type1maxlevel45category3territory4nameScarlet Monasteryminlevel34id796
	-- Instance: 796 - type1maxlevel45category3territory4nameScarlet Monasteryminlevel34id796
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val7id4val6id5val56id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3775,170,4258,3,2108)
	self:addTradeFlags(RecipeDB, 3775,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3775,3, 1085, 3, 2554, 3, 4143, 3, 4147, 3, 4287, 3, 4296, 3, 4540, 3, 4674, 3, 7346)

	-- Green Leather Bracers -- 3776
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id2val5id5val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3776,180,4259,1,2108)
	self:addTradeFlags(RecipeDB, 3776,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 3776,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Leather Bracers -- 3777
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id4val6id5val48id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3777,195,4260,2,2108)
	self:addTradeFlags(RecipeDB, 3777,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3777,7, 2)

	-- Gem-studded Leather Belt -- 3778
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id3val6id5val65id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3778,185,4262,1,2108)
	self:addTradeFlags(RecipeDB, 3778,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Barbaric Belt -- 3779
	-- Instance: 1176 - type1maxlevel47category3territory1nameZul'Farrakminlevel43id1176
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id1val62id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3779,200,4264,3,2108)
	self:addTradeFlags(RecipeDB, 3779,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 3779,3, 780, 3, 5649)

	-- Heavy Armor Kit -- 3780
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3780,150,4265,1,2108)
	self:addTradeFlags(RecipeDB, 3780,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 3780,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Light Hide -- 3816
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3816,35,4231,1,2108)
	self:addTradeFlags(RecipeDB, 3816,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3816,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Medium Hide -- 3817
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3817,100,4233,1,2108)
	self:addTradeFlags(RecipeDB, 3817,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3817,1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Heavy Hide -- 3818
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3818,150,4236,1,2108)
	self:addTradeFlags(RecipeDB, 3818,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3818,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Raptor Hide Harness -- 4096
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id3val98id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4096,165,4455,2,2108)
	self:addTradeFlags(RecipeDB, 4096,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Raptor Hide Belt -- 4097
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id1val6id3val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4097,165,4456,2,2108)
	self:addTradeFlags(RecipeDB, 4097,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Kodo Hide Bag -- 5244
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 5244,40,5081,2,2108)
	self:addTradeFlags(RecipeDB, 5244,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 5244,4, 769)

	-- Barbaric Harness -- 6661
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val101id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6661,190,5739,1,2108)
	self:addTradeFlags(RecipeDB, 6661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 6661,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Murloc Scale Belt -- 6702
	-- Instance: 1581 - type1maxlevel20category3territory2nameThe Deadminesminlevel15id1581
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val2id1val3id2val42id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6702,90,5780,1,2108)
	self:addTradeFlags(RecipeDB, 6702,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6702,3, 1732, 3, 3256, 3, 3385, 2, 843, 2, 3556, 2, 4186)

	-- Murloc Scale Breastplate -- 6703
	-- Instance: 1581 - type1maxlevel20category3territory2nameThe Deadminesminlevel15id1581
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id1val3id2val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6703,95,5781,1,2108)
	self:addTradeFlags(RecipeDB, 6703,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6703,3, 657, 3, 3386, 2, 843, 2, 3556, 2, 4186)

	-- Thick Murloc Armor -- 6704
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val9id1val8id3val100id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6704,170,5782,2,2108)
	self:addTradeFlags(RecipeDB, 6704,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6704,3, 938, 3, 1160, 2, 2381, 2, 2393)

	-- Murloc Scale Bracers -- 6705
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id1val6id3val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6705,190,5783,2,2108)
	self:addTradeFlags(RecipeDB, 6705,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 6705,3, 1561, 2, 4897)

	-- Handstitched Leather Vest -- 7126
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val45id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7126,10,5957,1,2108)
	self:addTradeFlags(RecipeDB, 7126,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Fine Leather Pants -- 7133
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id4val4id5val69id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7133,105,5958,2,2108)
	self:addTradeFlags(RecipeDB, 7133,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7133,7, 2)

	-- Dark Leather Pants -- 7135
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id2val72id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7135,115,5961,1,2108)
	self:addTradeFlags(RecipeDB, 7135,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7135,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Pants -- 7147
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id4val8id5val85id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7147,160,5962,1,2108)
	self:addTradeFlags(RecipeDB, 7147,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7147,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Barbaric Leggings -- 7149
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val7id2val7id3val7id5val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7149,170,5963,1,2108)
	self:addTradeFlags(RecipeDB, 7149,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7149,2, 2821)

	-- Barbaric Shoulders -- 7151
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id2val6id3val5id5val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7151,175,5964,1,2108)
	self:addTradeFlags(RecipeDB, 7151,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7151,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Guardian Cloak -- 7153
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val5id4val6id5val24id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7153,185,5965,2,2108)
	self:addTradeFlags(RecipeDB, 7153,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 7153,7, 2)

	-- Guardian Gloves -- 7156
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val63id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7156,190,5966,1,2108)
	self:addTradeFlags(RecipeDB, 7156,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 7156,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Deviate Scale Cloak -- 7953
	-- Instance: 718 - type1maxlevel21category3territory4nameWailing Cavernsminlevel15id718
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val2id2val2id3val16id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7953,90,6466,1,2108)
	self:addTradeFlags(RecipeDB, 7953,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 7953,2, 5783)

	-- Deviate Scale Gloves -- 7954
	-- Instance: 718 - type1maxlevel21category3territory4nameWailing Cavernsminlevel15id718
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val3id2val3id3val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7954,105,6467,1,2108)
	self:addTradeFlags(RecipeDB, 7954,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7954,2, 5783)

	-- Deviate Scale Belt -- 7955
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id2val6id3val3id5val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7955,115,6468,2,2108)
	self:addTradeFlags(RecipeDB, 7955,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 7955,4, 1487)

	-- Moonglow Vest -- 8322
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val3id4val4id5val74id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8322,90,6709,2,2108)
	self:addTradeFlags(RecipeDB, 8322,1,8,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 8322,4, 1582)

	-- Handstitched Leather Cloak -- 9058
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val8id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9058,10,7276,1,2108)
	self:addTradeFlags(RecipeDB, 9058,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Handstitched Leather Bracers -- 9059
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val21id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9059,10,7277,1,2108)
	self:addTradeFlags(RecipeDB, 9059,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Light Leather Quiver -- 9060
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9060,30,7278,1,2108)
	self:addTradeFlags(RecipeDB, 9060,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9060,1, 223, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Small Leather Ammo Pouch -- 9062
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9062,30,7279,1,2108)
	self:addTradeFlags(RecipeDB, 9062,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9062,1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Rugged Leather Pants -- 9064
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val1id3val51id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9064,35,7280,2,2108)
	self:addTradeFlags(RecipeDB, 9064,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9064,7, 2)

	-- Light Leather Bracers -- 9065
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val28id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9065,70,7281,1,2108)
	self:addTradeFlags(RecipeDB, 9065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9065,1, 223, 1, 1385, 1, 1466, 1, 1632, 1, 3007, 1, 3008, 1, 3069, 1, 3365, 1, 3549, 1, 3605, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 5784, 1, 5811, 1, 11081, 1, 11083, 1, 11084, 1, 11096, 1, 11097, 1, 11098, 1, 16278, 1, 16687, 1, 16688, 1, 16728, 1, 16745, 1, 17442, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Light Leather Pants -- 9068
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id2val3id5val66id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9068,95,7282,1,2108)
	self:addTradeFlags(RecipeDB, 9068,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9068,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Black Whelp Cloak -- 9070
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val3id3val17id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9070,100,7283,1,2108)
	self:addTradeFlags(RecipeDB, 9070,1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 9070,2, 2697)

	-- Red Whelp Gloves -- 9072
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val52id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9072,120,7284,1,2108)
	self:addTradeFlags(RecipeDB, 9072,1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9072,2, 2679)

	-- Nimble Leather Gloves -- 9074
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id2val4id5val52id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9074,120,7285,1,2108)
	self:addTradeFlags(RecipeDB, 9074,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9074,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Fletcher's Gloves -- 9145
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val53id6val1id27val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9145,125,7348,1,2108)
	self:addTradeFlags(RecipeDB, 9145,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	self:addTradeAcquire(RecipeDB, 9145,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Herbalist's Gloves -- 9146
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val55id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9146,135,7349,2,2108)
	self:addTradeFlags(RecipeDB, 9146,1,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9146,2, 6731)

	-- Earthen Leather Shoulders -- 9147
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val7id3val67id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9147,135,7352,1,2108)
	self:addTradeFlags(RecipeDB, 9147,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9147,2, 3537)

	-- Pilferer's Gloves -- 9148
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id2val56id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9148,140,7358,2,2108)
	self:addTradeFlags(RecipeDB, 9148,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9148,7, 2)

	-- Heavy Earthen Gloves -- 9149
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val57id6val16id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9149,145,7359,2,2108)
	self:addTradeFlags(RecipeDB, 9149,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9149,7, 2)

	-- Heavy Quiver -- 9193
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9193,150,7371,1,2108)
	self:addTradeFlags(RecipeDB, 9193,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9193,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Leather Ammo Pouch -- 9194
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9194,150,7372,1,2108)
	self:addTradeFlags(RecipeDB, 9194,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 9194,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dusky Leather Leggings -- 9195
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id2val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9195,165,7373,2,2108)
	self:addTradeFlags(RecipeDB, 9195,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9195,7, 2)

	-- Dusky Leather Armor -- 9196
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id2val102id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9196,175,7374,1,2108)
	self:addTradeFlags(RecipeDB, 9196,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9196,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Green Whelp Armor -- 9197
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id5val102id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9197,175,7375,2,2108)
	self:addTradeFlags(RecipeDB, 9197,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9197,7, 2)

	-- Frost Leather Cloak -- 9198
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val24id6val9id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9198,180,7377,1,2108)
	self:addTradeFlags(RecipeDB, 9198,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 9198,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dusky Bracers -- 9201
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id2val46id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9201,185,7378,1,2108)
	self:addTradeFlags(RecipeDB, 9201,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9201,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Green Whelp Bracers -- 9202
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9202,190,7386,2,2108)
	self:addTradeFlags(RecipeDB, 9202,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9202,2, 4225, 2, 7854)

	-- Dusky Belt -- 9206
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id2val8id3val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9206,195,7387,1,2108)
	self:addTradeFlags(RecipeDB, 9206,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 9206,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Dusky Boots -- 9207
	-- Instance: 1176 - type1maxlevel47category3territory1nameZul'Farrakminlevel43id1176
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id2val3id3val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9207,200,7390,3,2108)
	self:addTradeFlags(RecipeDB, 9207,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9207,3, 4676, 3, 5649, 3, 24830)

	-- Swift Boots -- 9208
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id3val76id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9208,200,7391,2,2108)
	self:addTradeFlags(RecipeDB, 9208,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 9208,7, 2)

	-- Cured Thick Hide -- 10482
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10482,200,8172,1,2108)
	self:addTradeFlags(RecipeDB, 10482,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 10482,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Armor Kit -- 10487
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10487,200,8173,1,2108)
	self:addTradeFlags(RecipeDB, 10487,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 10487,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Comfortable Leather Hat -- 10490
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id3val10id5val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10490,200,8174,3,2108)
	self:addTradeFlags(RecipeDB, 10490,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10490,3, 2249, 3, 4852)

	-- Nightscape Tunic -- 10499
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val15id2val6id3val113id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10499,205,8175,1,2108)
	self:addTradeFlags(RecipeDB, 10499,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10499,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Headband -- 10507
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id2val11id3val91id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10507,205,8176,1,2108)
	self:addTradeFlags(RecipeDB, 10507,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10507,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Turtle Scale Gloves -- 10509
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val7id3val6id4val6id5val146id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10509,205,8187,1,2108)
	self:addTradeFlags(RecipeDB, 10509,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10509,7, 1)

	-- Turtle Scale Breastplate -- 10511
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val9id3val9id4val9id5val238id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10511,210,8189,1,2108)
	self:addTradeFlags(RecipeDB, 10511,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10511,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Shoulders -- 10516
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id2val5id3val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10516,210,8192,2,2108)
	self:addTradeFlags(RecipeDB, 10516,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10516,2, 7854)

	-- Turtle Scale Bracers -- 10518
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val204id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10518,210,8198,1,2108)
	self:addTradeFlags(RecipeDB, 10518,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10518,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Big Voodoo Robe -- 10520
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val117id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10520,215,8200,2,2108)
	self:addTradeFlags(RecipeDB, 10520,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10520,7, 2)

	-- Tough Scorpid Breastplate -- 10525
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val15id2val7id5val245id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10525,220,8203,2,2108)
	self:addTradeFlags(RecipeDB, 10525,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10525,3, 5419, 3, 5422, 3, 5425, 3, 5616, 3, 5618)

	-- Wild Leather Shoulders -- 10529
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10529,220,8210,2,2108)
	self:addTradeFlags(RecipeDB, 10529,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10529,4, 2848, 4, 2855)

	-- Big Voodoo Mask -- 10531
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val97id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10531,220,8201,2,2108)
	self:addTradeFlags(RecipeDB, 10531,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10531,7, 2)

	-- Tough Scorpid Bracers -- 10533
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val7id2val6id5val107id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10533,220,8205,2,2108)
	self:addTradeFlags(RecipeDB, 10533,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10533,3, 5420, 3, 5422, 3, 5423, 3, 5425, 3, 5426, 3, 5615, 3, 5617)

	-- Tough Scorpid Gloves -- 10542
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id2val9id5val155id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10542,225,8204,2,2108)
	self:addTradeFlags(RecipeDB, 10542,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10542,3, 5419, 3, 5422, 3, 5425, 3, 5616, 3, 5618)

	-- Wild Leather Vest -- 10544
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val121id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10544,225,8211,2,2108)
	self:addTradeFlags(RecipeDB, 10544,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10544,4, 2849, 4, 2856)

	-- Wild Leather Helmet -- 10546
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val99id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10546,225,8214,2,2108)
	self:addTradeFlags(RecipeDB, 10546,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10546,4, 2850, 4, 2857)

	-- Nightscape Pants -- 10548
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val16id2val7id3val108id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10548,230,8193,1,2108)
	self:addTradeFlags(RecipeDB, 10548,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10548,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Cloak -- 10550
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val10id2val3id3val30id6
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 10550,230,8195,2,2108)
	--self:addTradeFlags(RecipeDB, 10550,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Turtle Scale Helm -- 10552
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id3val10id4val10id5val206id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10552,230,8191,1,2108)
	self:addTradeFlags(RecipeDB, 10552,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10552,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Tough Scorpid Boots -- 10554
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val12id2val7id5val178id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10554,235,8209,2,2108)
	self:addTradeFlags(RecipeDB, 10554,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10554,3, 5422, 3, 5425, 3, 5615)

	-- Turtle Scale Leggings -- 10556
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val11id3val10id4val11id5val226id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10556,235,8185,1,2108)
	self:addTradeFlags(RecipeDB, 10556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10556,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Nightscape Boots -- 10558
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id2val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10558,235,8197,1,2108)
	self:addTradeFlags(RecipeDB, 10558,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10558,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Big Voodoo Pants -- 10560
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id4val15id5val110id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10560,240,8202,2,2108)
	self:addTradeFlags(RecipeDB, 10560,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 10560,7, 2)

	-- Big Voodoo Cloak -- 10562
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val9id4val5id5val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10562,240,8216,2,2108)
	self:addTradeFlags(RecipeDB, 10562,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 10562,7, 2)

	-- Tough Scorpid Shoulders -- 10564
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id2val10id5val197id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10564,240,8207,2,2108)
	self:addTradeFlags(RecipeDB, 10564,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10564,3, 5419, 3, 5420, 3, 5422, 3, 5423, 3, 5425, 3, 5426, 3, 5617, 3, 5623, 3, 7805, 3, 7883)

	-- Wild Leather Boots -- 10566
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val90id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10566,245,8213,2,2108)
	self:addTradeFlags(RecipeDB, 10566,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10566,4, 2851, 4, 2858)

	-- Tough Scorpid Leggings -- 10568
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val17id2val10id5val235id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10568,245,8206,2,2108)
	self:addTradeFlags(RecipeDB, 10568,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10568,3, 5422, 3, 5423, 3, 5425, 3, 5615, 3, 5623)

	-- Tough Scorpid Helm -- 10570
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val14id2val14id5val222id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10570,250,8208,2,2108)
	self:addTradeFlags(RecipeDB, 10570,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 10570,3, 5419, 3, 5420, 3, 5422, 3, 5423, 3, 5425, 3, 5426, 3, 5615, 3, 5623, 3, 7805, 3, 7883)

	-- Wild Leather Leggings -- 10572
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val116id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10572,250,8212,2,2108)
	self:addTradeFlags(RecipeDB, 10572,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10572,4, 2852, 4, 2859)

	-- Wild Leather Cloak -- 10574
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val33id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10574,250,8215,2,2108)
	self:addTradeFlags(RecipeDB, 10574,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	self:addTradeAcquire(RecipeDB, 10574,4, 2853, 4, 2860)

	-- Dragonscale Gauntlets -- 10619
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val7id3val6id5val171id6val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10619,225,8347,1,2108)
	self:addTradeFlags(RecipeDB, 10619,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10619,1, 7866, 1, 7867)

	-- Wolfshead Helm -- 10621
	-- Trainer
	-- Flags: Druid,Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id5val109id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10621,225,8345,1,2108)
	self:addTradeFlags(RecipeDB, 10621,1,2,3,22,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10621,1, 7870, 1, 7871)

	-- Gauntlets of the Sea -- 10630
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val7id2val85id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10630,230,8346,1,2108)
	self:addTradeFlags(RecipeDB, 10630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10630,1, 7868, 1, 7869)

	-- Helm of Fire -- 10632
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val17id2val10id3val118id6val5id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10632,250,8348,1,2108)
	self:addTradeFlags(RecipeDB, 10632,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10632,1, 7868, 1, 7869)

	-- Feathered Breastplate -- 10647
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id4val24id5val146id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10647,250,8349,1,2108)
	self:addTradeFlags(RecipeDB, 10647,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 10647,1, 7870, 1, 7871)

	-- Dragonscale Breastplate -- 10650
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id3val306id6val13id33val13id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 10650,255,8367,1,2108)
	self:addTradeFlags(RecipeDB, 10650,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 10650,1, 7866, 1, 7867)

	-- Quickdraw Quiver -- 14930
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14930,225,8217,1,2108)
	self:addTradeFlags(RecipeDB, 14930,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 14930,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Leather Ammo Pouch -- 14932
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14932,225,8218,1,2108)
	self:addTradeFlags(RecipeDB, 14932,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 14932,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Cured Rugged Hide -- 19047
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19047,240,15407,1,2108)
	self:addTradeFlags(RecipeDB, 19047,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19047,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Scorpid Bracers -- 19048
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val8id3val8id5val122id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19048,255,15077,1,2108)
	self:addTradeFlags(RecipeDB, 19048,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Wicked Leather Gauntlets -- 19049
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id2val11id3val86id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19049,260,15083,1,2108)
	self:addTradeFlags(RecipeDB, 19049,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Green Dragonscale Breastplate -- 19050
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id3val21id5val311id6val11id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19050,260,15045,1,2108)
	self:addTradeFlags(RecipeDB, 19050,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19050,2, 11874)

	-- Heavy Scorpid Vest -- 19051
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val16id3val15id5val288id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19051,265,15076,2,2108)
	self:addTradeFlags(RecipeDB, 19051,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19051,3, 5990, 3, 5993, 3, 6005)

	-- Wicked Leather Bracers -- 19052
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id2val5id3val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19052,265,15084,2,2108)
	self:addTradeFlags(RecipeDB, 19052,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19052,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Chimeric Gloves -- 19053
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val87id6val11id32val12id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19053,265,15074,1,2108)
	self:addTradeFlags(RecipeDB, 19053,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Red Dragonscale Breastplate -- 19054
	-- Instance: 1583 - type1maxlevel60category3territory1nameBlackrock Spireminlevel58id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val360id6val12id33val35id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19054,300,15047,3,2108)
	self:addTradeFlags(RecipeDB, 19054,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 19054,3, 10363)

	-- Runic Leather Gauntlets -- 19055
	-- Trainer
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id4val14id5val88id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19055,270,15091,2,2108)
	self:addTradeFlags(RecipeDB, 19055,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19055,3, 12397, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Rugged Armor Kit -- 19058
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19058,230,15564,1,2108)
	self:addTradeFlags(RecipeDB, 19058,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 19058,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Volcanic Leggings -- 19059
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val204id6val20id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19059,270,15054,2,2108)
	self:addTradeFlags(RecipeDB, 19059,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19059,3, 7035)

	-- Green Dragonscale Leggings -- 19060
	-- Instance: 1477 - type1maxlevel55category3territory1nameThe Temple of Atal'Hakkarminlevel50id1477
	-- Instance: 1477 - type1maxlevel55category3territory1nameThe Temple of Atal'Hakkarminlevel50id1477
	-- Instance: 1477 - type1maxlevel55category3territory1nameThe Temple of Atal'Hakkarminlevel50id1477
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id3val22id5val282id6val11id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19060,270,15046,3,2108)
	self:addTradeFlags(RecipeDB, 19060,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19060,3, 5225, 3, 5226, 3, 5708)

	-- Living Shoulders -- 19061
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id3val13id5val117id6val3id34val16id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19061,270,15061,1,2108)
	self:addTradeFlags(RecipeDB, 19061,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19061,2, 7854)

	-- Ironfeather Shoulders -- 19062
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id4val8id5val117id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19062,270,15067,1,2108)
	self:addTradeFlags(RecipeDB, 19062,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19062,2, 12958)

	-- Chimeric Boots -- 19063
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val99id6val12id32val12id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19063,275,15073,2,2108)
	self:addTradeFlags(RecipeDB, 19063,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19063,7, 2)

	-- Heavy Scorpid Gauntlets -- 19064
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val12id3val12id5val186id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19064,275,15078,2,2108)
	self:addTradeFlags(RecipeDB, 19064,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19064,3, 7025, 3, 7055)

	-- Runic Leather Bracers -- 19065
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id4val10id5val63id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19065,275,15092,2,2108)
	self:addTradeFlags(RecipeDB, 19065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19065,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Frostsaber Boots -- 19066
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val99id6val12id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19066,275,15071,1,2108)
	self:addTradeFlags(RecipeDB, 19066,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Stormshroud Pants -- 19067
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val138id6val12id26val28id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19067,275,15057,1,2108)
	self:addTradeFlags(RecipeDB, 19067,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	-- No acquire information

	-- Warbear Harness -- 19068
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id1val27id3val158id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19068,275,15064,1,2108)
	self:addTradeFlags(RecipeDB, 19068,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	-- No acquire information

	-- Heavy Scorpid Belt -- 19070
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val12id3val12id5val170id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19070,280,15082,2,2108)
	self:addTradeFlags(RecipeDB, 19070,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19070,7, 2)

	-- Wicked Leather Headband -- 19071
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val16id2val16id3val118id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19071,280,15086,2,2108)
	self:addTradeFlags(RecipeDB, 19071,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19071,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Runic Leather Belt -- 19072
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id4val9id5val82id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19072,280,15093,2,2108)
	self:addTradeFlags(RecipeDB, 19072,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19072,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Chimeric Leggings -- 19073
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val127id6val16id32val16id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19073,280,15072,2,2108)
	self:addTradeFlags(RecipeDB, 19073,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19073,7, 2)

	-- Frostsaber Leggings -- 19074
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val129id6val17id35val16id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19074,285,15069,2,2108)
	self:addTradeFlags(RecipeDB, 19074,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19074,3, 7440, 3, 7443, 3, 7448, 3, 7458, 3, 7460)

	-- Heavy Scorpid Leggings -- 19075
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val12id3val20id5val269id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19075,285,15079,2,2108)
	self:addTradeFlags(RecipeDB, 19075,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19075,3, 7027)

	-- Volcanic Breastplate -- 19076
	-- Instance: 1583 - type1maxlevel60category3territory1nameBlackrock Spireminlevel58id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val268id6val20id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19076,285,15053,2,2108)
	self:addTradeFlags(RecipeDB, 19076,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19076,3, 9259)

	-- Blue Dragonscale Breastplate -- 19077
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val28id4val8id5val338id6val8id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19077,285,15048,1,2108)
	self:addTradeFlags(RecipeDB, 19077,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Living Leggings -- 19078
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val8id3val25id5val142id6val5id34val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19078,285,15060,3,2108)
	self:addTradeFlags(RecipeDB, 19078,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19078,3, 7158, 3, 8957, 3, 8961)

	-- Stormshroud Armor -- 19079
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val163id6val12id26val28id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19079,285,15056,3,2108)
	self:addTradeFlags(RecipeDB, 19079,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,57)
	self:addTradeAcquire(RecipeDB, 19079,3, 6138)

	-- Warbear Woolies -- 19080
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val28id1val12id3val142id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19080,285,15065,1,2108)
	self:addTradeFlags(RecipeDB, 19080,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Chimeric Vest -- 19081
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val150id6val16id32val17id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19081,290,15075,2,2108)
	self:addTradeFlags(RecipeDB, 19081,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19081,7, 2)

	-- Runic Leather Headband -- 19082
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id4val12id5val122id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19082,290,15094,1,2108)
	self:addTradeFlags(RecipeDB, 19082,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19082,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wicked Leather Pants -- 19083
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id2val12id3val131id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19083,290,15087,2,2108)
	self:addTradeFlags(RecipeDB, 19083,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19083,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Devilsaur Gauntlets -- 19084
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val9id3val103id6val14id44val28id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19084,290,15063,1,2108)
	self:addTradeFlags(RecipeDB, 19084,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Black Dragonscale Breastplate -- 19085
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val8id3val344id6val12id33val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19085,290,15050,1,2108)
	self:addTradeFlags(RecipeDB, 19085,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Ironfeather Breastplate -- 19086
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id4val28id5val165id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19086,290,15066,3,2108)
	self:addTradeFlags(RecipeDB, 19086,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19086,3, 2644, 3, 2681, 3, 2926)

	-- Frostsaber Gloves -- 19087
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val95id6val13id35val12id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19087,295,15070,2,2108)
	self:addTradeFlags(RecipeDB, 19087,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19087,3, 7441)

	-- Heavy Scorpid Helm -- 19088
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val20id3val13id5val258id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19088,295,15080,1,2108)
	self:addTradeFlags(RecipeDB, 19088,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Blue Dragonscale Shoulders -- 19089
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val21id4val6id5val262id6val6id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19089,295,15049,3,2108)
	self:addTradeFlags(RecipeDB, 19089,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19089,3, 6146)

	-- Stormshroud Shoulders -- 19090
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val126id6val12id26val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19090,295,15058,3,2108)
	self:addTradeFlags(RecipeDB, 19090,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,52,57)
	self:addTradeAcquire(RecipeDB, 19090,3, 6144)

	-- Runic Leather Pants -- 19091
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id4val20id5val135id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19091,300,15095,2,2108)
	self:addTradeFlags(RecipeDB, 19091,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19091,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wicked Leather Belt -- 19092
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id2val13id3val87id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19092,300,15088,2,2108)
	self:addTradeFlags(RecipeDB, 19092,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19092,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Onyxia Scale Cloak -- 19093
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val7id3val43id6val16id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19093,300,15138,3,2108)
	self:addTradeFlags(RecipeDB, 19093,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Black Dragonscale Shoulders -- 19094
	-- Instance: 1584 - type1maxlevel60category3territory1nameBlackrock Depthsminlevel55id1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val9id3val266id6val6id33val40id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19094,300,15051,3,2108)
	self:addTradeFlags(RecipeDB, 19094,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19094,3, 8898)

	-- Living Breastplate -- 19095
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id3val25id5val169id6val5id34val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19095,300,15059,3,2108)
	self:addTradeFlags(RecipeDB, 19095,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19095,3, 1813)

	-- Devilsaur Leggings -- 19097
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id3val148id6val14id44val46id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19097,300,15062,3,2108)
	self:addTradeFlags(RecipeDB, 19097,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19097,3, 6556, 3, 6557, 3, 6559, 3, 9162, 3, 9163, 3, 9164, 3, 9166, 3, 9167, 3, 9477)

	-- Wicked Leather Armor -- 19098
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val25id2val7id3val156id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19098,300,15085,2,2108)
	self:addTradeFlags(RecipeDB, 19098,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19098,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Scorpid Shoulders -- 19100
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val14id3val13id5val245id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19100,300,15081,2,2108)
	self:addTradeFlags(RecipeDB, 19100,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19100,3, 7029)

	-- Volcanic Shoulders -- 19101
	-- Instance: 1583 - type1maxlevel60category3territory1nameBlackrock Spireminlevel58id1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val167id6val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19101,300,15055,2,2108)
	self:addTradeFlags(RecipeDB, 19101,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19101,3, 9260)

	-- Runic Leather Armor -- 19102
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val21id4val13id5val158id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19102,300,15090,2,2108)
	self:addTradeFlags(RecipeDB, 19102,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19102,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Runic Leather Shoulders -- 19103
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val15id4val10id5val119id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19103,300,15096,2,2108)
	self:addTradeFlags(RecipeDB, 19103,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19103,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Frostsaber Tunic -- 19104
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val158id6val18id35val18id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19104,300,15068,2,2108)
	self:addTradeFlags(RecipeDB, 19104,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 19104,3, 7438, 3, 7458, 3, 7459, 3, 7460)

	-- Onyxia Scale Breastplate -- 19106
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val15id1val15id2val15id3val14id4val14id5val605id6val9id33val14id44
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 19106,300,15141,4,2108)
	--self:addTradeFlags(RecipeDB, 19106,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Black Dragonscale Leggings -- 19107
	-- Instance: 1584 - type1maxlevel60category3territory1nameBlackrock Depthsminlevel55id1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val8id3val320id6val13id33val54id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19107,300,15052,3,2108)
	self:addTradeFlags(RecipeDB, 19107,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 19107,3, 8903)

	-- Medium Leather -- 20648
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20648,90,2319,1,2108)
	self:addTradeFlags(RecipeDB, 20648,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20648,1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Leather -- 20649
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20649,140,4234,1,2108)
	self:addTradeFlags(RecipeDB, 20649,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20649,1, 1385, 1, 3007, 1, 3365, 1, 3703, 1, 3967, 1, 4212, 1, 4588, 1, 5127, 1, 5564, 1, 8153, 1, 11081, 1, 11084, 1, 11097, 1, 11098, 1, 16688, 1, 16728, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Leather -- 20650
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20650,195,4304,1,2108)
	self:addTradeFlags(RecipeDB, 20650,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20650,1, 3007, 1, 4212, 1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Corehound Boots -- 20853
	-- Instance: 1584 - type1maxlevel60category3territory1nameBlackrock Depthsminlevel55id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id2val10id3val144id6val24id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20853,295,16982,1,2108)
	self:addTradeFlags(RecipeDB, 20853,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 20853,2, 12944)

	-- Molten Helm -- 20854
	-- Instance: 1584 - type1maxlevel60category3territory1nameBlackrock Depthsminlevel55id1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val16id3val171id6val12id26val29id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20854,300,16983,1,2108)
	self:addTradeFlags(RecipeDB, 20854,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	self:addTradeAcquire(RecipeDB, 20854,2, 12944)

	-- Black Dragonscale Boots -- 20855
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id3val308id6val24id33val28id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20855,300,16984,1,2108)
	self:addTradeFlags(RecipeDB, 20855,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Gloves of the Greatfather -- 21943
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,Seasonal, 
	-- Item Stats: 
	-- Item Stats: val66id6val11id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21943,190,17721,2,2108)
	self:addTradeFlags(RecipeDB, 21943,7,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 21943,5, 1)

	-- Rugged Leather -- 22331
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22331,250,8170,1,2108)
	self:addTradeFlags(RecipeDB, 22331,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22331,1, 11097, 1, 11098, 1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Shadowskin Gloves -- 22711
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val6id3val76id6val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22711,200,18238,1,2108)
	self:addTradeFlags(RecipeDB, 22711,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

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
	self:addTradeSkill(RecipeDB, 22727,300,18251,3,2108)
	self:addTradeFlags(RecipeDB, 22727,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 22727,3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Gordok Ogre Suit -- 22815
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22815,275,18258,2,2108)
	self:addTradeFlags(RecipeDB, 22815,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Girdle of Insight -- 22921
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val9id3val23id4val98id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22921,300,18504,3,2108)
	self:addTradeFlags(RecipeDB, 22921,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Mongoose Boots -- 22922
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val23id2val9id3val120id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22922,300,18506,3,2108)
	self:addTradeFlags(RecipeDB, 22922,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Swift Flight Bracers -- 22923
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val7id3val160id6val41id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22923,300,18508,3,2108)
	self:addTradeFlags(RecipeDB, 22923,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Chromatic Cloak -- 22926
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val10id3val55id6val9id33val9id36val14id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22926,300,18509,4,2108)
	self:addTradeFlags(RecipeDB, 22926,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	-- No acquire information

	-- Hide of the Wild -- 22927
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val8id3val10id4val55id6val22id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22927,300,18510,4,2108)
	self:addTradeFlags(RecipeDB, 22927,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	-- No acquire information

	-- Shifting Cloak -- 22928
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak,
	-- Item Stats: Tanking, 
	-- Item Stats: val17id2val8id3val55id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22928,300,18511,4,2108)
	self:addTradeFlags(RecipeDB, 22928,21,22,23,24,25,26,27,28,29,30,36,40,47,52,60)
	-- No acquire information

	-- Heavy Leather Ball -- 23190
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23190,150,18662,1,2108)
	self:addTradeFlags(RecipeDB, 23190,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23190,2, 3366, 2, 5128)

	-- Barbaric Bracers -- 23399
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val4id2val6id3val4id5val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23399,155,18948,1,2108)
	self:addTradeFlags(RecipeDB, 23399,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 23399,2, 4225, 2, 4589)

	-- Might of the Timbermaw -- 23703
	-- Timbermaw Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val21id1val9id3val93id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23703,290,19044,1,2108)
	self:addTradeFlags(RecipeDB, 23703,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,99)
	self:addTradeAcquire(RecipeDB, 23703,6, 576, 2, 11557)

	-- Timbermaw Brawlers -- 23704
	-- Timbermaw Hold - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val23id1val10id3val112id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23704,300,19049,1,2108)
	self:addTradeFlags(RecipeDB, 23704,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,99)
	self:addTradeAcquire(RecipeDB, 23704,6, 576, 3, 11557)

	-- Dawn Treaders -- 23705
	-- Argent Dawn - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val18id3val114id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23705,290,19052,1,2108)
	self:addTradeFlags(RecipeDB, 23705,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,96)
	self:addTradeAcquire(RecipeDB, 23705,6, 529, 2, 10856, 6, 529, 2, 10857, 6, 529, 2, 11536)

	-- Golden Mantle of the Dawn -- 23706
	-- Argent Dawn - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val22id3val134id6val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23706,300,19058,1,2108)
	self:addTradeFlags(RecipeDB, 23706,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,96)
	self:addTradeAcquire(RecipeDB, 23706,6, 529, 3, 10856, 6, 529, 3, 10857, 6, 529, 3, 11536)

	-- Lava Belt -- 23707
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val15id3val238id6val26id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23707,300,19149,1,2108)
	self:addTradeFlags(RecipeDB, 23707,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Chromatic Gauntlets -- 23708
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val318id6val5id33val5id34val5id35val5id36val21id44val44id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23708,300,19157,1,2108)
	self:addTradeFlags(RecipeDB, 23708,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Corehound Belt -- 23709
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val16id4val135id6val12id33val33id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23709,300,19162,1,2108)
	self:addTradeFlags(RecipeDB, 23709,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Molten Belt -- 23710
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val28id2val16id3val135id6val12id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23710,300,19163,1,2108)
	self:addTradeFlags(RecipeDB, 23710,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Primal Batskin Jerkin -- 24121
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val32id2val6id3val181id6val10id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24121,300,19685,1,2108)
	self:addTradeFlags(RecipeDB, 24121,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24121,6, 270, 3, 14921)

	-- Primal Batskin Gloves -- 24122
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val10id2val9id3val113id6val20id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24122,300,19686,1,2108)
	self:addTradeFlags(RecipeDB, 24122,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24122,6, 270, 2, 14921)

	-- Primal Batskin Bracers -- 24123
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id2val7id3val79id6val10id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24123,300,19687,1,2108)
	self:addTradeFlags(RecipeDB, 24123,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24123,6, 270, 1, 14921)

	-- Blood Tiger Breastplate -- 24124
	-- Zandalar Tribe - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val17id1val17id3val16id4val13id5val181id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24124,300,19688,1,2108)
	self:addTradeFlags(RecipeDB, 24124,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24124,6, 270, 3, 14921)

	-- Blood Tiger Shoulders -- 24125
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id1val13id3val12id4val10id5val136id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24125,300,19689,1,2108)
	self:addTradeFlags(RecipeDB, 24125,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24125,6, 270, 2, 14921)

	-- Blue Dragonscale Leggings -- 24654
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val20id4val19id5val310id6val12id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24654,300,20295,1,2108)
	self:addTradeFlags(RecipeDB, 24654,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 24654,1, 7866, 1, 7867)

	-- Green Dragonscale Gauntlets -- 24655
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val5id3val18id5val208id6val9id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24655,280,20296,1,2108)
	self:addTradeFlags(RecipeDB, 24655,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 24655,1, 7866, 1, 7867)

	-- Dreamscale Breastplate -- 24703
	-- Cenarion Circle - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val15id2val15id3val14id4val496id6val4id24val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24703,300,20380,1,2108)
	self:addTradeFlags(RecipeDB, 24703,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24703,6, 609, 4, 15293)

	-- Spitfire Bracers -- 24846
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val9id2val9id4val160id6val4id24val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24846,300,20481,1,2108)
	self:addTradeFlags(RecipeDB, 24846,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24846,6, 609, 1, 15293)

	-- Spitfire Gauntlets -- 24847
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val12id2val12id4val228id6val5id24val11id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24847,300,20480,1,2108)
	self:addTradeFlags(RecipeDB, 24847,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24847,6, 609, 2, 15293)

	-- Spitfire Breastplate -- 24848
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val16id2val16id4val365id6val6id24val15id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24848,300,20479,1,2108)
	self:addTradeFlags(RecipeDB, 24848,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24848,6, 609, 3, 15293)

	-- Sandstalker Bracers -- 24849
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val7id3val220id6val15id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24849,300,20476,1,2108)
	self:addTradeFlags(RecipeDB, 24849,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24849,6, 609, 1, 15293)

	-- Sandstalker Gauntlets -- 24850
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val9id3val308id6val20id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24850,300,20477,1,2108)
	self:addTradeFlags(RecipeDB, 24850,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24850,6, 609, 2, 15293)

	-- Sandstalker Breastplate -- 24851
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val13id3val485id6val25id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24851,300,20478,1,2108)
	self:addTradeFlags(RecipeDB, 24851,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,97)
	self:addTradeAcquire(RecipeDB, 24851,6, 609, 3, 15293)

	-- Black Whelp Tunic -- 24940
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val5id1val3id2val78id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24940,100,20575,1,2108)
	self:addTradeFlags(RecipeDB, 24940,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 24940,2, 777)

	-- Stormshroud Gloves -- 26279
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val99id6val19id44val10id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26279,300,21278,3,2108)
	self:addTradeFlags(RecipeDB, 26279,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 26279,3, 14454, 3, 14457)

	-- Polar Tunic -- 28219
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val18id2val26id3val267id6val40id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28219,300,22661,4,2108)
	self:addTradeFlags(RecipeDB, 28219,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Polar Gloves -- 28220
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val18id2val18id3val167id6val30id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28220,300,22662,4,2108)
	self:addTradeFlags(RecipeDB, 28220,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Polar Bracers -- 28221
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id2val20id3val117id6val20id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28221,300,22663,4,2108)
	self:addTradeFlags(RecipeDB, 28221,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Icy Scale Breastplate -- 28222
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val24id3val578id6val40id35val40id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28222,300,22664,4,2108)
	self:addTradeFlags(RecipeDB, 28222,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Icy Scale Gauntlets -- 28223
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val22id3val361id6val30id35val22id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28223,300,22666,4,2108)
	self:addTradeFlags(RecipeDB, 28223,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Icy Scale Bracers -- 28224
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val17id3val253id6val20id35val32id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28224,300,22665,4,2108)
	self:addTradeFlags(RecipeDB, 28224,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Bramblewood Helm -- 28472
	-- Cenarion Circle - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id3val156id6val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28472,300,22759,1,2108)
	self:addTradeFlags(RecipeDB, 28472,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,97)
	self:addTradeAcquire(RecipeDB, 28472,6, 609, 3, 15293)

	-- Bramblewood Boots -- 28473
	-- Cenarion Circle - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val12id3val132id6val25id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28473,300,22760,1,2108)
	self:addTradeFlags(RecipeDB, 28473,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,97)
	self:addTradeAcquire(RecipeDB, 28473,6, 609, 2, 15293)

	-- Bramblewood Belt -- 28474
	-- Cenarion Circle - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val14id3val108id6val15id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28474,300,22761,1,2108)
	self:addTradeFlags(RecipeDB, 28474,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,97)
	self:addTradeAcquire(RecipeDB, 28474,6, 609, 1, 15293)

	-- Knothide Leather -- 32454
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32454,290,21887,1,2108)
	self:addTradeFlags(RecipeDB, 32454,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 32454,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Heavy Knothide Leather -- 32455
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32455,325,23793,1,2108)
	self:addTradeFlags(RecipeDB, 32455,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32455,2, 16689, 2, 16748, 2, 19196)

	-- Knothide Armor Kit -- 32456
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32456,280,25650,1,2108)
	self:addTradeFlags(RecipeDB, 32456,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 32456,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Vindicator's Armor Kit -- 32457
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32457,325,25651,1,2108)
	self:addTradeFlags(RecipeDB, 32457,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,101)
	self:addTradeAcquire(RecipeDB, 32457,6, 932, 3, 19321)

	-- Magister's Armor Kit -- 32458
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32458,325,25652,1,2108)
	self:addTradeFlags(RecipeDB, 32458,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,110)
	self:addTradeAcquire(RecipeDB, 32458,6, 934, 3, 19331)

	-- Riding Crop -- 32461
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1nameCaverns of Time: Old Hillsbrad Foothillsminlevel66id2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32461,350,25653,1,2108)
	self:addTradeFlags(RecipeDB, 32461,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 32461,2, 18672)

	-- Felscale Gloves -- 32462
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val19id2val276id6val40id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32462,290,25654,1,2108)
	self:addTradeFlags(RecipeDB, 32462,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32462,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Boots -- 32463
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val20id2val333id6val44id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32463,300,25655,1,2108)
	self:addTradeFlags(RecipeDB, 32463,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32463,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Pants -- 32464
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val31id2val449id6val60id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32464,310,25656,1,2108)
	self:addTradeFlags(RecipeDB, 32464,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32464,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Felscale Breastplate -- 32465
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id2val558id6val72id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32465,325,25657,1,2108)
	self:addTradeFlags(RecipeDB, 32465,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32465,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Pants -- 32466
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id3val386id6val8id24val23id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32466,290,25662,1,2108)
	self:addTradeFlags(RecipeDB, 32466,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32466,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Gloves -- 32467
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val24id3val303id6val7id24val20id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32467,300,25661,1,2108)
	self:addTradeFlags(RecipeDB, 32467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32467,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Vest -- 32468
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val36id3val528id6val10id24val29id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32468,315,25660,1,2108)
	self:addTradeFlags(RecipeDB, 32468,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32468,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Scaled Draenic Boots -- 32469
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id3val384id6val8id24val22id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32469,325,25659,1,2108)
	self:addTradeFlags(RecipeDB, 32469,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32469,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Gloves -- 32470
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val15id2val22id3val127id6val30id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32470,290,25669,1,2108)
	self:addTradeFlags(RecipeDB, 32470,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32470,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Pants -- 32471
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val23id2val34id3val197id6val46id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32471,305,25670,1,2108)
	self:addTradeFlags(RecipeDB, 32471,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32471,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Boots -- 32472
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val17id2val27id3val159id6val36id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32472,310,25668,1,2108)
	self:addTradeFlags(RecipeDB, 32472,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32472,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Thick Draenic Vest -- 32473
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val25id2val39id3val243id6val52id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32473,320,25671,1,2108)
	self:addTradeFlags(RecipeDB, 32473,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32473,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Boots -- 32478
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val11id1val11id2val18id3val11id4val140id6val13id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32478,290,25673,1,2108)
	self:addTradeFlags(RecipeDB, 32478,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32478,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Gloves -- 32479
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id1val13id2val18id3val12id4val137id6val14id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32479,300,25674,1,2108)
	self:addTradeFlags(RecipeDB, 32479,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32479,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Leggings -- 32480
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val18id1val18id2val27id3val17id4val202id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32480,310,25675,1,2108)
	self:addTradeFlags(RecipeDB, 32480,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32480,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Wild Draenish Vest -- 32481
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val19id1val19id2val28id3val19id4val243id6val22id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32481,320,25676,1,2108)
	self:addTradeFlags(RecipeDB, 32481,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32481,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Comfortable Insoles -- 32482
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32482,300,25679,1,2108)
	self:addTradeFlags(RecipeDB, 32482,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32482,2, 16689, 2, 16748)

	-- Stylin' Purple Hat -- 32485
	-- Instance: 3789 - type5category3territory1expansion1nameAuchindoun: Shadow Labrynthminlevel70id3789
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val48id2val45id3val232id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32485,350,25680,3,2108)
	self:addTradeFlags(RecipeDB, 32485,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32485,3, 18667)

	-- Stylin' Adventure Hat -- 32487
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1nameCaverns of Time: Old Hillsbrad Foothillsminlevel66id2367
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1nameCaverns of Time: Old Hillsbrad Foothillsminlevel66id2367
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1nameCaverns of Time: Old Hillsbrad Foothillsminlevel66id2367
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val516id6val16id24val50id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32487,350,25681,3,2108)
	self:addTradeFlags(RecipeDB, 32487,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32487,3, 17820, 3, 17840, 3, 28132)

	-- Stylin' Crimson Hat -- 32488
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1nameAuchindoun: Sethekk Hallsminlevel67id3791
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1nameAuchindoun: Sethekk Hallsminlevel67id3791
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id4val516id6val96id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32488,350,25683,3,2108)
	self:addTradeFlags(RecipeDB, 32488,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 32488,3, 18322, 3, 19428)

	-- Stylin' Jungle Hat -- 32489
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val24id1val24id2val24id3val24id4val232id6val10id24val19id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32489,350,25682,3,2108)
	self:addTradeFlags(RecipeDB, 32489,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 32489,3, 17839, 3, 17879, 3, 17952, 3, 18982, 3, 21104, 3, 21140, 3, 21148)

	-- Fel Leather Gloves -- 32490
	-- The Consortium - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val169id6val24id44val17id45val42id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32490,340,25685,3,2108)
	self:addTradeFlags(RecipeDB, 32490,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,105)
	self:addTradeAcquire(RecipeDB, 32490,6, 933, 1, 20242, 6, 933, 1, 23007)

	-- Fel Leather Boots -- 32493
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val196id6val17id44val25id45val42id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32493,350,25686,3,2108)
	self:addTradeFlags(RecipeDB, 32493,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,105)
	self:addTradeAcquire(RecipeDB, 32493,6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Fel Leather Leggings -- 32494
	-- The Consortium - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val249id6val25id44val25id45val60id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32494,350,25687,3,2108)
	self:addTradeFlags(RecipeDB, 32494,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,105)
	self:addTradeAcquire(RecipeDB, 32494,6, 933, 3, 20242, 6, 933, 3, 23007)

	-- Heavy Clefthoof Vest -- 32495
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val45id3val290id6val15id26val24id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32495,360,25689,3,2108)
	self:addTradeFlags(RecipeDB, 32495,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,103)
	self:addTradeAcquire(RecipeDB, 32495,6, 942, 2, 17904)

	-- Heavy Clefthoof Leggings -- 32496
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val33id3val251id6val18id26val29id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32496,355,25690,3,2108)
	self:addTradeFlags(RecipeDB, 32496,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,103)
	self:addTradeAcquire(RecipeDB, 32496,6, 942, 2, 17904)

	-- Heavy Clefthoof Boots -- 32497
	-- Cenarion Expedition - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val30id3val198id6val14id26val21id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32497,355,25691,3,2108)
	self:addTradeFlags(RecipeDB, 32497,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57,103)
	self:addTradeAcquire(RecipeDB, 32497,6, 942, 1, 17904)

	-- Felstalker Belt -- 32498
	-- Thrallmar - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val18id2val17id4val357id6val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32498,350,25695,3,2108)
	self:addTradeFlags(RecipeDB, 32498,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,104)
	self:addTradeAcquire(RecipeDB, 32498,6, 947, 1, 17585)

	-- Felstalker Bracer -- 32499
	-- Thrallmar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val18id2val11id4val283id6val38id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32499,360,25697,3,2108)
	self:addTradeFlags(RecipeDB, 32499,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,104)
	self:addTradeAcquire(RecipeDB, 32499,6, 947, 2, 17585)

	-- Felstalker Breastplate -- 32500
	-- Thrallmar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val26id2val6id3val26id4val646id6val52id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32500,360,25696,3,2108)
	self:addTradeFlags(RecipeDB, 32500,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,104)
	self:addTradeAcquire(RecipeDB, 32500,6, 947, 2, 17585)

	-- Netherfury Belt -- 32501
	-- The Mag'har - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val339id6val9id24val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32501,340,25694,3,2108)
	self:addTradeFlags(RecipeDB, 32501,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,108)
	self:addTradeAcquire(RecipeDB, 32501,6, 941, 1, 20241)

	-- Netherfury Leggings -- 32502
	-- The Mag'har - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val37id3val527id6val10id24val29id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32502,340,25692,3,2108)
	self:addTradeFlags(RecipeDB, 32502,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,108)
	self:addTradeAcquire(RecipeDB, 32502,6, 941, 2, 20241)

	-- Netherfury Boots -- 32503
	-- The Mag'har - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val36id3val392id6val7id24val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32503,350,25693,3,2108)
	self:addTradeFlags(RecipeDB, 32503,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,108)
	self:addTradeAcquire(RecipeDB, 32503,6, 941, 3, 20241)

	-- Shadow Armor Kit -- 35520
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1nameAuchindoun: Sethekk Hallsminlevel67id3791
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1nameAuchindoun: Sethekk Hallsminlevel67id3791
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1nameAuchindoun: Sethekk Hallsminlevel67id3791
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35520,340,29483,2,2108)
	self:addTradeFlags(RecipeDB, 35520,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35520,3, 18320, 3, 18325, 3, 19428)

	-- Flame Armor Kit -- 35521
	-- Instance: 3848 - type5category3territory1expansion1nameTempest Keep: The Arcatrazminlevel70id3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35521,340,29485,2,2108)
	self:addTradeFlags(RecipeDB, 35521,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35521,3, 20898)

	-- Frost Armor Kit -- 35522
	-- Instance: 3715 - type5category3territory1expansion1nameCoilfang Reservoir: The Steamvaultminlevel70id3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35522,340,29486,2,2108)
	self:addTradeFlags(RecipeDB, 35522,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35522,3, 17797)

	-- Nature Armor Kit -- 35523
	-- Instance: 3717 - type5maxlevel64category3territory1expansion1nameCoilfang Reservoir: The Slave Pensminlevel62id3717
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35523,340,29487,2,2108)
	self:addTradeFlags(RecipeDB, 35523,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35523,3, 17941)

	-- Arcane Armor Kit -- 35524
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Instance: 2366 - type5category3territory1expansion1nameCaverns of Time: The Black Morassminlevel70id2366
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35524,340,29488,2,2108)
	self:addTradeFlags(RecipeDB, 35524,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 35524,3, 17879, 3, 17952, 3, 21104, 3, 21140, 3, 21148)

	-- Enchanted Felscale Leggings -- 35525
	-- The Scryers - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id3val556id6val40id32val8id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35525,350,29489,1,2108)
	self:addTradeFlags(RecipeDB, 35525,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,110)
	self:addTradeAcquire(RecipeDB, 35525,6, 934, 4, 19331)

	-- Enchanted Felscale Gloves -- 35526
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val397id6val30id32val6id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35526,350,29490,1,2108)
	self:addTradeFlags(RecipeDB, 35526,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,110)
	self:addTradeAcquire(RecipeDB, 35526,6, 934, 2, 19331)

	-- Enchanted Felscale Boots -- 35527
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val437id6val30id32val6id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35527,350,29491,1,2108)
	self:addTradeFlags(RecipeDB, 35527,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,110)
	self:addTradeAcquire(RecipeDB, 35527,6, 934, 3, 19331)

	-- Flamescale Boots -- 35528
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val437id6val30id33val6id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35528,350,29493,1,2108)
	self:addTradeFlags(RecipeDB, 35528,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,101)
	self:addTradeAcquire(RecipeDB, 35528,6, 932, 3, 19321)

	-- Flamescale Leggings -- 35529
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id3val556id6val40id33val8id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35529,350,29492,1,2108)
	self:addTradeFlags(RecipeDB, 35529,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,101)
	self:addTradeAcquire(RecipeDB, 35529,6, 932, 4, 19321)

	-- Reinforced Mining Bag -- 35530
	-- The Mag'har - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35530,325,29540,1,2108)
	self:addTradeFlags(RecipeDB, 35530,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB, 35530,6, 941, 2, 20241)

	-- Flamescale Belt -- 35531
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val357id6val30id33val8id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35531,350,29494,1,2108)
	self:addTradeFlags(RecipeDB, 35531,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58,101)
	self:addTradeAcquire(RecipeDB, 35531,6, 932, 2, 19321)

	-- Enchanted Clefthoof Leggings -- 35532
	-- The Scryers - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val30id3val249id6val40id32val8id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35532,350,29495,1,2108)
	self:addTradeFlags(RecipeDB, 35532,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,110)
	self:addTradeAcquire(RecipeDB, 35532,6, 934, 4, 19331)

	-- Enchanted Clefthoof Gloves -- 35533
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val27id3val178id6val30id32val6id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35533,350,29496,1,2108)
	self:addTradeFlags(RecipeDB, 35533,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,110)
	self:addTradeAcquire(RecipeDB, 35533,6, 934, 3, 19331)

	-- Enchanted Clefthoof Boots -- 35534
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val27id3val196id6val30id32val6id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35534,350,29497,1,2108)
	self:addTradeFlags(RecipeDB, 35534,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,110)
	self:addTradeAcquire(RecipeDB, 35534,6, 934, 2, 19331)

	-- Blastguard Pants -- 35535
	-- The Aldor - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val30id3val249id6val40id33val8id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35535,350,29498,1,2108)
	self:addTradeFlags(RecipeDB, 35535,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,101)
	self:addTradeAcquire(RecipeDB, 35535,6, 932, 4, 19321)

	-- Blastguard Boots -- 35536
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val27id3val196id6val30id33val6id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35536,350,29499,1,2108)
	self:addTradeFlags(RecipeDB, 35536,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,101)
	self:addTradeAcquire(RecipeDB, 35536,6, 932, 3, 19321)

	-- Blastguard Belt -- 35537
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val27id3val160id6val30id33val8id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35537,350,29500,1,2108)
	self:addTradeFlags(RecipeDB, 35537,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,101)
	self:addTradeAcquire(RecipeDB, 35537,6, 932, 2, 19321)

	-- Drums of Panic -- 35538
	-- Keepers of Time - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35538,370,29532,1,2108)
	self:addTradeFlags(RecipeDB, 35538,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB, 35538,6, 989, 2, 21643)

	-- Drums of Restoration -- 35539
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35539,350,29531,2,2108)
	self:addTradeFlags(RecipeDB, 35539,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Drums of War -- 35540
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35540,325,29528,1,2108)
	self:addTradeFlags(RecipeDB, 35540,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 35540,1, 18754, 1, 18771, 1, 19187, 1, 21087)

	-- Drums of Battle -- 35543
	-- The Sha'tar - Honored
	-- Raid: 3457 - Karazhan
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3607 - Coilfang Reservoir: Serpentshrine Cavern
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35543,365,29529,1,2108)
	self:addTradeFlags(RecipeDB, 35543,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB, 35543,6, 935, 2, 21432)

	-- Drums of Speed -- 35544
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1nameCaverns of Time: Old Hillsbrad Foothillsminlevel66id2367
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35544,345,29530,2,2108)
	self:addTradeFlags(RecipeDB, 35544,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 35544,3, 22128)

	-- Cobrahide Leg Armor -- 35549
	-- Honor Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35549,335,29533,1,2108)
	self:addTradeFlags(RecipeDB, 35549,1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,104)
	self:addTradeAcquire(RecipeDB, 35549,6, 946, 2, 17657)

	-- Nethercobra Leg Armor -- 35554
	-- Honor Hold - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35554,365,29535,1,2108)
	self:addTradeFlags(RecipeDB, 35554,1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,104)
	self:addTradeAcquire(RecipeDB, 35554,6, 946, 4, 17657)

	-- Clefthide Leg Armor -- 35555
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35555,335,29534,1,2108)
	self:addTradeFlags(RecipeDB, 35555,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,103)
	self:addTradeAcquire(RecipeDB, 35555,6, 942, 2, 17904)

	-- Nethercleft Leg Armor -- 35557
	-- Cenarion Expedition - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35557,365,29536,1,2108)
	self:addTradeFlags(RecipeDB, 35557,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,103)
	self:addTradeAcquire(RecipeDB, 35557,6, 942, 4, 17904)

	-- Cobrascale Hood -- 35558
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val37id2val42id3val271id6val18id45val74id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35558,365,29502,4,2108)
	self:addTradeFlags(RecipeDB, 35558,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35558,3, 16409, 3, 24683)

	-- Cobrascale Gloves -- 35559
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3562 - type5maxlevel62category3territory1expansion1nameHellfire Citadel: Hellfire Rampartsminlevel60id3562
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1nameAuchindoun: Sethekk Hallsminlevel67id3791
	-- Instance: 3847 - type5category3territory1expansion1nameTempest Keep: The Botanicaminlevel70id3847
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val33id3val208id6val25id44val20id45val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35559,365,29503,4,2108)
	self:addTradeFlags(RecipeDB, 35559,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35559,3, 16409, 3, 16425, 3, 16472, 3, 16539, 3, 17271, 3, 18318, 3, 19511, 3, 23542)

	-- Windscale Hood -- 35560
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3792 - type5maxlevel66category3territory1expansion1nameAuchindoun: Mana-Tombsminlevel64id3792
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val16id3val18id4val271id6val10id24val37id44val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35560,365,29504,4,2108)
	self:addTradeFlags(RecipeDB, 35560,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35560,3, 16504, 3, 16539, 3, 18312, 3, 23580, 3, 24979)

	-- Hood of Primal Life -- 35561
	-- Instance: 3713 - type5maxlevel63category3territory1expansion1nameHellfire Citadel: The Blood Furnaceminlevel61id3713
	-- Raid: 3845 - Tempest Keep
	-- Raid: 3959 - Black Temple
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val34id3val37id4val31id5val271id6val36id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35561,365,29505,4,2108)
	self:addTradeFlags(RecipeDB, 35561,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35561,3, 17400, 3, 20039, 3, 23330, 3, 23586, 3, 24683)

	-- Gloves of the Living Touch -- 35562
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3715 - type5category3territory1expansion1nameCoilfang Reservoir: The Steamvaultminlevel70id3715
	-- Instance: 3792 - type5maxlevel66category3territory1expansion1nameAuchindoun: Mana-Tombsminlevel64id3792
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val16id3val18id4val22id5val208id6val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35562,365,29506,4,2108)
	self:addTradeFlags(RecipeDB, 35562,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35562,3, 16409, 3, 16530, 3, 17802, 3, 18309, 3, 21387, 3, 24065)

	-- Windslayer Wraps -- 35563
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3717 - type5maxlevel64category3territory1expansion1nameCoilfang Reservoir: The Slave Pensminlevel62id3717
	-- Raid: 3845 - Tempest Keep
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val36id1val18id2val25id3val208id6val17id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35563,365,29507,4,2108)
	self:addTradeFlags(RecipeDB, 35563,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 35563,3, 16425, 3, 16595, 3, 17940, 3, 20031, 3, 23586)

	-- Living Dragonscale Helm -- 35564
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3789 - type5category3territory1expansion1nameAuchindoun: Shadow Labrynthminlevel70id3789
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val19id3val31id4val604id6val14id24val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35564,365,29508,4,2108)
	self:addTradeFlags(RecipeDB, 35564,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35564,3, 16408, 3, 16409, 3, 16504, 3, 18633, 3, 23582)

	-- Earthen Netherscale Boots -- 35567
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3845 - Tempest Keep
	-- Raid: 3959 - Black Temple
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val28id1val27id3val18id4val511id6val10id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35567,365,29512,4,2108)
	self:addTradeFlags(RecipeDB, 35567,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35567,3, 15548, 3, 16414, 3, 16492, 3, 18202, 3, 20038, 3, 22875, 3, 24059)

	-- Windstrike Gloves -- 35568
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3792 - type5maxlevel66category3territory1expansion1nameAuchindoun: Mana-Tombsminlevel64id3792
	-- Instance: 3790 - type5maxlevel67category3territory1expansion1nameAuchindoun: Auchenai Cryptsminlevel65id3790
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val36id1val18id2val25id3val465id6val17id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35568,365,29509,4,2108)
	self:addTradeFlags(RecipeDB, 35568,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35568,3, 15551, 3, 16409, 3, 16492, 3, 16595, 3, 17132, 3, 18314, 3, 18373, 3, 22072, 3, 24065)

	-- Netherdrake Helm -- 35572
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3714 - type5category3territory1expansion1nameHellfire Citadel: The Shattered Hallsminlevel70id3714
	-- Instance: 3717 - type5maxlevel64category3territory1expansion1nameCoilfang Reservoir: The Slave Pensminlevel62id3717
	-- Raid: 3607 - Coilfang Reservoir: Serpentshrine Cavern
	-- Raid: 3923 - Gruul's Lair
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val16id3val26id4val604id6val12id24val31id44val64id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35572,365,29510,4,2108)
	self:addTradeFlags(RecipeDB, 35572,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35572,3, 16409, 3, 16488, 3, 16544, 3, 16699, 3, 17940, 3, 21218, 3, 21350, 3, 22082, 3, 22310, 3, 24960)

	-- Netherdrake Gloves -- 35573
	-- Raid: 3457 - Karazhan
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val26id2val24id3val23id4val465id6val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35573,365,29511,4,2108)
	self:addTradeFlags(RecipeDB, 35573,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35573,3, 15551, 3, 17981, 3, 21815, 3, 25369)

	-- Thick Netherscale Breastplate -- 35574
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Instance: 3715 - type5category3territory1expansion1nameCoilfang Reservoir: The Steamvaultminlevel70id3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val36id2val36id3val25id4val744id6val76id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35574,365,29514,4,2108)
	self:addTradeFlags(RecipeDB, 35574,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,58)
	self:addTradeAcquire(RecipeDB, 35574,3, 15547, 3, 16407, 3, 16409, 3, 16504, 3, 16529, 3, 16530, 3, 16539, 3, 16540, 3, 17801, 3, 24960)

	-- Ebon Netherscale Breastplate -- 35575
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val25id3val23id4val846id6val8id24val31id44val80id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35575,365,29515,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 35575,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35575,1, 7866, 1, 7867)

	-- Ebon Netherscale Belt -- 35576
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val21id3val14id4val457id6val8id24val22id44val48id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35576,365,29516,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 35576,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35576,1, 7866, 1, 7867)

	-- Ebon Netherscale Bracers -- 35577
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val2id2val25id3val8id4val325id6val5id24val17id44val38id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35577,365,29517,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 35577,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35577,1, 7866, 1, 7867)

	-- Netherstrike Breastplate -- 35580
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id3val23id4val846id6val8id24val32id44val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35580,365,29519,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 35580,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35580,1, 7866, 1, 7867)

	-- Netherstrike Belt -- 35582
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val10id3val17id4val457id6val9id24val16id44val30id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35582,365,29520,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 35582,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35582,1, 7866, 1, 7867)

	-- Netherstrike Bracers -- 35584
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val13id3val13id4val355id6val6id24val17id44val22id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35584,365,29521,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 35584,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 35584,1, 7866, 1, 7867)

	-- Windhawk Hauberk -- 35585
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val28id3val29id4val29id5val379id6val19id44val47id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35585,365,29522,1,2108, 10660) -- Speciality
	self:addTradeFlags(RecipeDB, 35585,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35585,1, 7870, 1, 7871)

	-- Windhawk Belt -- 35587
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val17id3val19id4val20id5val205id6val12id44val38id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35587,365,29524,1,2108, 10660) -- Speciality
	self:addTradeFlags(RecipeDB, 35587,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35587,1, 7870, 1, 7871)

	-- Windhawk Bracers -- 35588
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val22id3val17id4val7id5val159id6val16id44val25id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35588,365,29523,1,2108, 10660) -- Speciality
	self:addTradeFlags(RecipeDB, 35588,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35588,1, 7870, 1, 7871)

	-- Primalstrike Vest -- 35589
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val38id2val39id3val379id6val12id45val108id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35589,365,29525,1,2108, 10658) -- Speciality
	self:addTradeFlags(RecipeDB, 35589,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35589,1, 7868, 1, 7869)

	-- Primalstrike Belt -- 35590
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id2val32id3val205id6val84id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35590,365,29526,1,2108, 10658) -- Speciality
	self:addTradeFlags(RecipeDB, 35590,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35590,1, 7868, 1, 7869)

	-- Primalstrike Bracers -- 35591
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val15id2val21id3val159id6val64id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 35591,365,29527,1,2108, 10658) -- Speciality
	self:addTradeFlags(RecipeDB, 35591,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 35591,1, 7868, 1, 7869)

	-- Blackstorm Leggings -- 36074
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val13id2val20id3val132id6val10id45val32id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36074,260,29964,1,2108, 10658) -- Speciality
	self:addTradeFlags(RecipeDB, 36074,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36074,1, 7868, 1, 7869)

	-- Wildfeather Leggings -- 36075
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val16id3val11id4val12id5val132id6val21id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36075,260,29970,1,2108, 10660) -- Speciality
	self:addTradeFlags(RecipeDB, 36075,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36075,1, 7870, 1, 7871)

	-- Dragonstrike Leggings -- 36076
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val18id3val11id4val272id6val4id24val12id44val24id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36076,260,29971,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 36076,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36076,1, 7866, 1, 7867)

	-- Primalstorm Breastplate -- 36077
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val30id2val27id3val255id6val17id45val60id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36077,330,29973,1,2108, 10658) -- Speciality
	self:addTradeFlags(RecipeDB, 36077,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36077,1, 7868, 1, 7869)

	-- Living Crystal Breastplate -- 36078
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val25id3val23id4val17id5val255id6val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36078,330,29974,1,2108, 10660) -- Speciality
	self:addTradeFlags(RecipeDB, 36078,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36078,1, 7870, 1, 7871)

	-- Golden Dragonstrike Breastplate -- 36079
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val25id3val17id4val570id6val9id24val25id44val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36079,330,29975,1,2108, 10656) -- Speciality
	self:addTradeFlags(RecipeDB, 36079,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36079,1, 7866, 1, 7867)

	-- Belt of Natural Power -- 36349
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val29id1val27id2val38id3val12id4val227id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36349,375,30042,4,2108)
	self:addTradeFlags(RecipeDB, 36349,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 36349,7, 4)

	-- Belt of Deep Shadow -- 36351
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val32id2val14id3val227id6val18id45val66id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36351,375,30040,4,2108)
	self:addTradeFlags(RecipeDB, 36351,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 36351,7, 4)

	-- Belt of the Black Eagle -- 36352
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val17id2val20id3val23id4val506id6val17id44val66id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36352,375,30046,4,2108)
	self:addTradeFlags(RecipeDB, 36352,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 36352,7, 4)

	-- Monsoon Belt -- 36353
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val23id3val24id4val506id6val21id45val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36353,375,30044,4,2108)
	self:addTradeFlags(RecipeDB, 36353,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 36353,7, 4)

	-- Boots of Natural Grace -- 36355
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val33id1val32id2val37id3val13id4val278id6val14id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36355,375,30041,4,2108)
	self:addTradeFlags(RecipeDB, 36355,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36355,7, 4)

	-- Boots of Utter Darkness -- 36357
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val34id3val278id6val32id44val23id45val66id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36357,375,30039,4,2108)
	self:addTradeFlags(RecipeDB, 36357,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 36357,7, 4)

	-- Boots of the Crimson Hawk -- 36358
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val28id2val28id3val27id4val619id6val19id44val58id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36358,375,30045,4,2108)
	self:addTradeFlags(RecipeDB, 36358,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36358,7, 4)

	-- Hurricane Boots -- 36359
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val25id3val26id4val619id6val6id24val26id44val39id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36359,375,30043,4,2108)
	self:addTradeFlags(RecipeDB, 36359,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 36359,7, 4)

	-- Boots of Shackled Souls -- 39997
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val40id3val628id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39997,375,32398,1,2108)
	self:addTradeFlags(RecipeDB, 39997,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 39997,6, 1012, 1, 23159)

	-- Greaves of Shackled Souls -- 40001
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val54id3val799id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40001,375,32400,1,2108)
	self:addTradeFlags(RecipeDB, 40001,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 40001,6, 1012, 2, 23159)

	-- Waistguard of Shackled Souls -- 40002
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val40id3val514id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40002,375,32397,1,2108)
	self:addTradeFlags(RecipeDB, 40002,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 40002,6, 1012, 2, 23159)

	-- Redeemed Soul Moccasins -- 40003
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val40id3val282id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40003,375,32394,1,2108)
	self:addTradeFlags(RecipeDB, 40003,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40003,6, 1012, 2, 23159)

	-- Redeemed Soul Wristguards -- 40004
	-- Ashtongue Deathsworn - Honored
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val30id3val179id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40004,375,32395,1,2108)
	self:addTradeFlags(RecipeDB, 40004,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40004,6, 1012, 2, 23159)

	-- Redeemed Soul Legguards -- 40005
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val54id3val359id6val72id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40005,375,32396,1,2108)
	self:addTradeFlags(RecipeDB, 40005,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40005,6, 1012, 1, 23159)

	-- Redeemed Soul Cinch -- 40006
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val40id3val231id6val54id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40006,375,32393,1,2108)
	self:addTradeFlags(RecipeDB, 40006,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,57,102)
	self:addTradeAcquire(RecipeDB, 40006,6, 1012, 1, 23159)

	-- Bracers of Renewed Life -- 41156
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val26id3val20id4val194id6val28id46val34id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41156,375,32582,4,2108)
	self:addTradeFlags(RecipeDB, 41156,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 41156,7, 4)

	-- Shoulderpads of Renewed Life -- 41157
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val34id3val29id4val333id6val38id46val43id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41157,375,32583,4,2108)
	self:addTradeFlags(RecipeDB, 41157,1,2,6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 41157,3, 17895, 3, 17897, 3, 17898, 3, 17899, 3, 17905, 3, 17906, 3, 17907, 3, 17908, 3, 17916)

	-- Swiftstrike Bracers -- 41158
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id2val34id3val194id6val27id46val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41158,375,32580,4,2108)
	self:addTradeFlags(RecipeDB, 41158,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 41158,3, 17895, 3, 17897, 3, 17898, 3, 17899, 3, 17905, 3, 17906, 3, 17907, 3, 17908, 3, 17916)

	-- Swiftstrike Shoulders -- 41160
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val29id2val34id3val333id6val38id46val74id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41160,375,32581,4,2108)
	self:addTradeFlags(RecipeDB, 41160,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 41160,7, 4)

	-- Bindings of Lightning Reflexes -- 41161
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val21id2val15id3val16id4val432id6val27id46val56id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41161,375,32574,4,2108)
	self:addTradeFlags(RecipeDB, 41161,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 41161,3, 17895, 3, 17897, 3, 17898, 3, 17899, 3, 17905, 3, 17906, 3, 17907, 3, 17908, 3, 17916)

	-- Shoulders of Lightning Reflexes -- 41162
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id2val19id3val21id4val741id6val37id46val74id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41162,375,32575,4,2108)
	self:addTradeFlags(RecipeDB, 41162,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 41162,7, 4)

	-- Living Earth Bindings -- 41163
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val20id4val432id6val28id46val34id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41163,375,32577,4,2108)
	self:addTradeFlags(RecipeDB, 41163,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 41163,7, 4)

	-- Living Earth Shoulders -- 41164
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val32id3val28id4val741id6val37id46val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41164,375,32579,4,2108)
	self:addTradeFlags(RecipeDB, 41164,1,2,6,11,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 41164,3, 17895, 3, 17897, 3, 17898, 3, 17899, 3, 17905, 3, 17906, 3, 17907, 3, 17908, 3, 17916)

	-- Cloak of Darkness -- 42546
	-- The Violet Eye - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val23id1val25id3val101id6val24id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42546,360,33122,3,2108)
	self:addTradeFlags(RecipeDB, 42546,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,60,114)
	self:addTradeAcquire(RecipeDB, 42546,6, 967, 4, 18255)

	-- Shadowprowler's Chestguard -- 42731
	-- The Violet Eye - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val32id1val40id2val12id3val333id6val8id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42731,365,33204,4,2108)
	self:addTradeFlags(RecipeDB, 42731,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,114)
	self:addTradeAcquire(RecipeDB, 42731,6, 967, 3, 18255)

	-- Knothide Ammo Pouch -- 44343
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44343,305,34099,2,2108)
	self:addTradeFlags(RecipeDB, 44343,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Knothide Quiver -- 44344
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44344,305,34100,2,2108)
	self:addTradeFlags(RecipeDB, 44344,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Quiver of a Thousand Feathers -- 44359
	-- Lower City - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44359,350,34105,1,2108)
	self:addTradeFlags(RecipeDB, 44359,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,107)
	self:addTradeAcquire(RecipeDB, 44359,6, 1011, 3, 21655)

	-- Netherscale Ammo Pouch -- 44768
	-- Thrallmar - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44768,350,34106,1,2108)
	self:addTradeFlags(RecipeDB, 44768,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,104)
	self:addTradeAcquire(RecipeDB, 44768,6, 947, 3, 17585)

	-- Glove Reinforcements -- 44770
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44770,345,34207,2,2108)
	self:addTradeFlags(RecipeDB, 44770,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Winter Boots -- 44953
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth,Seasonal, 
	-- Item Stats: 
	-- Item Stats: val2id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44953,285,34086,2,2108)
	self:addTradeFlags(RecipeDB, 44953,3,7,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 44953,5, 1)

	-- Heavy Knothide Armor Kit -- 44970
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44970,345,34330,1,2108)
	self:addTradeFlags(RecipeDB, 44970,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Leatherworker's Satchel -- 45100
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45100,290,34482,2,2108)
	self:addTradeFlags(RecipeDB, 45100,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bag of Many Hides -- 45117
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45117,360,34490,2,2108)
	self:addTradeFlags(RecipeDB, 45117,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 45117,3, 22143, 3, 22144, 3, 22148, 3, 23022)

	-- Leather Gauntlets of the Sun -- 46132
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val25id3val26id4val30id5val312id6val38id46val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46132,365,34372,4,2108)
	self:addTradeFlags(RecipeDB, 46132,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 46132,3, 25363, 3, 25367, 3, 25368, 3, 25369, 3, 25371, 3, 25507, 3, 25597)

	-- Fletcher's Gloves of the Phoenix -- 46133
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id2val33id3val25id4val694id6val34id46val82id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46133,365,34374,4,2108)
	self:addTradeFlags(RecipeDB, 46133,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 46133,3, 25363, 3, 25367, 3, 25369, 3, 25370, 3, 25507)

	-- Gloves of Immortal Dusk -- 46134
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val30id2val33id3val312id6val30id44val90id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46134,365,34370,4,2108)
	self:addTradeFlags(RecipeDB, 46134,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 46134,3, 25369, 3, 25370, 3, 25371, 3, 25507)

	-- Sun-Drenched Scale Gloves -- 46135
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val45id3val36id4val694id6val1id24val32id46val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46135,365,34376,4,2108)
	self:addTradeFlags(RecipeDB, 46135,1,2,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 46135,3, 25369, 3, 25371)

	-- Leather Chestguard of the Sun -- 46136
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val48id3val41id4val33id5val499id6val15id24val71id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46136,365,34371,4,2108)
	self:addTradeFlags(RecipeDB, 46136,1,2,11,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 46136,3, 25367, 3, 25369, 3, 25370, 3, 25507, 3, 25593)

	-- Embrace of the Phoenix -- 46137
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val44id2val43id3val30id4val1110id6val44id46val112id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46137,365,34373,4,2108)
	self:addTradeFlags(RecipeDB, 46137,1,2,11,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 46137,3, 25367, 3, 25369, 3, 25371, 3, 25507)

	-- Carapace of Sun and Shadow -- 46138
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val42id2val45id3val499id6val30id45val38id46val128id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46138,365,34369,4,2108)
	self:addTradeFlags(RecipeDB, 46138,1,2,11,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 46138,3, 25363, 3, 25367, 3, 25368, 3, 25369, 3, 25507)

	-- Sun-Drenched Scale Chestguard -- 46139
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val48id3val41id4val1110id6val12id24val40id46val71id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46139,365,34375,4,2108)
	self:addTradeFlags(RecipeDB, 46139,1,2,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 46139,3, 25363, 3, 25367, 3, 25368, 3, 25369, 3, 25371, 3, 25593)

	-- Heavy Borean Leather -- 50936
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50936,365,38425,1,2108)
	self:addTradeFlags(RecipeDB, 50936,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Iceborne Chestguard -- 50938
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val36id3val317id6val37id44val56id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50938,370,38408,1, 2108)
	self:addTradeFlags(RecipeDB, 50938,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Iceborne Leggings -- 50939
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val40id3val36id4val270id6val48id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50939,365,38410,1, 2108)
	self:addTradeFlags(RecipeDB, 50939,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Iceborne Shoulderpads -- 50940
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val30id3val31id4val251id6val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50940,375,38411,1, 2108)
	self:addTradeFlags(RecipeDB, 50940,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Iceborne Gloves -- 50941
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val22id3val23id4val193id6val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50941,365,38409,1, 2108)
	self:addTradeFlags(RecipeDB, 50941,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Iceborne Boots -- 50942
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val25id3val27id4val218id6val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50942,370,38407,1, 2108)
	self:addTradeFlags(RecipeDB, 50942,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Iceborne Belt -- 50943
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val25id3val23id4val183id6val48id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50943,360,38406,1, 2108)
	self:addTradeFlags(RecipeDB, 50943,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Chestpiece -- 50944
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val43id2val42id3val326id6val76id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50944,365,38400,2,2108)
	self:addTradeFlags(RecipeDB, 50944,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Leggings -- 50945
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val36id3val277id6val46id44val74id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50945,370,38401,2,2108)
	self:addTradeFlags(RecipeDB, 50945,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Shoulderpads -- 50946
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val36id2val27id3val244id6val60id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50946,375,38402,2,2108)
	self:addTradeFlags(RecipeDB, 50946,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Gloves -- 50947
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val34id2val25id3val198id6val28id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50947,370,38403,2,2108)
	self:addTradeFlags(RecipeDB, 50947,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Boots -- 50948
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val20id2val39id3val218id6val72id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50948,365,38404,2,2108)
	self:addTradeFlags(RecipeDB, 50948,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Belt -- 50949
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val33id3val188id6val31id44val70id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50949,375,38405,2,2108)
	self:addTradeFlags(RecipeDB, 50949,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Frostscale Chestguard -- 50950
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val38id2val57id3val706id6val74id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50950,370,38414,1, 2108)
	self:addTradeFlags(RecipeDB, 50950,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Frostscale Leggings -- 50951
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val44id2val601id6val23id44val72id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50951,365,38416,1, 2108)
	self:addTradeFlags(RecipeDB, 50951,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Frostscale Shoulders -- 50952
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id2val25id3val530id6val28id44
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50952,370,38424,1, 2108)
	self:addTradeFlags(RecipeDB, 50952,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Frostscale Gloves -- 50953
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id2val28id3val20id4val454id6val58id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50953,375,38415,1, 2108)
	self:addTradeFlags(RecipeDB, 50953,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Frostscale Boots -- 50954
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val39id2val513id6val26id44val25id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50954,375,38413,1, 2108)
	self:addTradeFlags(RecipeDB, 50954,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Frostscale Belt -- 50955
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val28id2val24id3val18id4val397id6val56id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50955,365,38412,1, 2108)
	self:addTradeFlags(RecipeDB, 50955,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Chestguard -- 50956
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val32id4val706id6val13id47val56id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50956,370,38420,1, 2108)
	self:addTradeFlags(RecipeDB, 50956,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Legguards -- 50957
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id4val618id6val30id44val56id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50957,365,38422,2,2108)
	self:addTradeFlags(RecipeDB, 50957,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Shoulders -- 50958
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val19id4val559id6val29id44val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50958,375,38417,1, 2108)
	self:addTradeFlags(RecipeDB, 50958,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Gloves -- 50959
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val22id4val429id6val23id44val41id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50959,365,38421,1, 2108)
	self:addTradeFlags(RecipeDB, 50959,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Boots -- 50960
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val27id3val499id6val12id47val45id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50960,375,38419,1, 2108)
	self:addTradeFlags(RecipeDB, 50960,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Belt -- 50961
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val35id3val24id4val397id6val42id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50961,370,38418,1, 2108)
	self:addTradeFlags(RecipeDB, 50961,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Borean Armor Kit -- 50962
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50962,365,38375,1,2108)
	self:addTradeFlags(RecipeDB, 50962,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Heavy Borean Armor Kit -- 50963
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50963,395,38376,2,2108)
	self:addTradeFlags(RecipeDB, 50963,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Jormungar Leg Armor -- 50964
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50964,400,38371,1, 2108)
	self:addTradeFlags(RecipeDB, 50964,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Frosthide Leg Armor -- 50965
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50965,425,38373,4,2108)
	self:addTradeFlags(RecipeDB, 50965,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Nerubian Leg Armor -- 50966
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50966,395,38372,1, 2108)
	self:addTradeFlags(RecipeDB, 50966,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Icescale Leg Armor -- 50967
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50967,425,38374,4,2108)
	self:addTradeFlags(RecipeDB, 50967,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Trapper's Traveling Pack -- 50970
	-- The Kalu'ak - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50970,415,38399,3,2108)
	self:addTradeFlags(RecipeDB, 50970,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,120)
	self:addTradeAcquire(RecipeDB, 50970,6, 1073, 3, 31916, 6, 1073, 3, 32763)

	-- Mammoth Mining Bag -- 50971
	-- The Sons of Hodir - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50971,415,38347,3,2108)
	self:addTradeFlags(RecipeDB, 50971,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,119)
	self:addTradeAcquire(RecipeDB, 50971,6, 1119, 2, 32540)

	-- Black Chitinguard Boots -- 51568
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val39id2val62id3val345id6val33id44val76id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 51568,395,38590,1, 2108)
	self:addTradeFlags(RecipeDB, 51568,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Dark Arctic Leggings -- 51569
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val44id2val82id3val428id6val43id44val110id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 51569,390,38591,1, 2108)
	self:addTradeFlags(RecipeDB, 51569,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Dark Arctic Chestpiece -- 51570
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val52id2val84id3val502id6val45id44val104id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 51570,390,38592,1, 2108)
	self:addTradeFlags(RecipeDB, 51570,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Wristguards -- 51571
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val17id2val33id3val150id6val60id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 51571,380,38433,1, 2108)
	self:addTradeFlags(RecipeDB, 51571,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Arctic Helm -- 51572
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val31id2val58id3val279id6val106id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 51572,380,38437,1, 2108)
	self:addTradeFlags(RecipeDB, 51572,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Bracers of Shackled Souls -- 52733
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val30id3val400id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52733,375,32399,1,2108)
	self:addTradeFlags(RecipeDB, 52733,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 52733,6, 1012, 1, 23159)

	-- Cloak of Tormented Skies -- 55199
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: Tanking, 
	-- Item Stats: val31id1val48id3val337id6val24id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 55199,385,41238,1, 2108)
	self:addTradeFlags(RecipeDB, 55199,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,60)
	-- No acquire information

	-- Bracers of Deflection -- 55243
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: Tanking, 
	-- Item Stats: val239id6val82id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 55243,400,41264,3,2108)
	self:addTradeFlags(RecipeDB, 55243,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,57)
	-- No acquire information

	-- Frostscale Bracers -- 60599
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val23id2val24id3val15id4val335id6val48id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60599,380,38436,1, 2108)
	self:addTradeFlags(RecipeDB, 60599,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Frostscale Helm -- 60600
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val42id2val42id3val28id4val622id6val84id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60600,380,38440,1, 2108)
	self:addTradeFlags(RecipeDB, 60600,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Dark Frostscale Leggings -- 60601
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val39id2val46id3val929id6val39id44val62id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60601,390,44436,1, 2108)
	self:addTradeFlags(RecipeDB, 60601,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Dark Frostscale Breastplate -- 60604
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val55id2val64id3val1089id6val55id44val88id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60604,390,44437,1, 2108)
	self:addTradeFlags(RecipeDB, 60604,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Dragonstompers -- 60605
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val33id2val57id3val19id4val768id6val26id45val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60605,395,44438,1, 2108)
	self:addTradeFlags(RecipeDB, 60605,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Iceborne Wristguards -- 60607
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val21id5val150id6val19id44val35id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60607,380,38434,1, 2108)
	self:addTradeFlags(RecipeDB, 60607,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Iceborne Helm -- 60608
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val35id5val279id6val36id44val62id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60608,380,38438,1, 2108)
	self:addTradeFlags(RecipeDB, 60608,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Dark Iceborne Leggings -- 60611
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val36id3val45id4val57id5val418id6val67id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60611,390,44440,1, 2108)
	self:addTradeFlags(RecipeDB, 60611,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Dark Iceborne Chestguard -- 60613
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val43id3val46id4val59id5val490id6val70id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60613,390,44441,1, 2108)
	self:addTradeFlags(RecipeDB, 60613,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Bugsquashers -- 60620
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val33id3val35id4val46id5val345id6val54id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60620,395,44442,1, 2108)
	self:addTradeFlags(RecipeDB, 60620,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Nerubian Bracers -- 60622
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val21id4val335id6val19id44val35id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60622,380,38435,1, 2108)
	self:addTradeFlags(RecipeDB, 60622,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nerubian Helm -- 60624
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val36id4val622id6val35id44val62id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60624,380,38439,1, 2108)
	self:addTradeFlags(RecipeDB, 60624,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Dark Nerubian Leggings -- 60627
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val61id3val57id4val929id6val32id44val67id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60627,390,44443,1, 2108)
	self:addTradeFlags(RecipeDB, 60627,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Dark Nerubian Chestpiece -- 60629
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val64id3val59id4val1089id6val34id44val70id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60629,390,44444,1, 2108)
	self:addTradeFlags(RecipeDB, 60629,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Scaled Icewalkers -- 60630
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val33id3val35id4val768id6val18id47val54id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60630,395,44445,1, 2108)
	self:addTradeFlags(RecipeDB, 60630,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Cloak of Harsh Winds -- 60631
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val14id2val43id3val121id6val30id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60631,370,38441,1, 2108)
	self:addTradeFlags(RecipeDB, 60631,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Ice Striker's Cloak -- 60637
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: 
	-- Item Stats: val24id2val75id3val150id6val38id46val100id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60637,440,43566,1, 2108)
	self:addTradeFlags(RecipeDB, 60637,3,21,22,23,24,25,26,27,28,29,30,36,41,47,60)
	-- No acquire information

	-- Durable Nerubhide Cape -- 60640
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloak,
	-- Item Stats: Tanking, 
	-- Item Stats: val41id1val75id3val150id6val21id12val49id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60640,440,43565,1, 2108)
	self:addTradeFlags(RecipeDB, 60640,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,60)
	-- No acquire information

	-- Pack of Endless Pockets -- 60643
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60643,415,44446,3,2108)
	self:addTradeFlags(RecipeDB, 60643,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Dragonscale Ammo Pouch -- 60645
	-- The Kalu'ak - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60645,415,44447,3,2108)
	self:addTradeFlags(RecipeDB, 60645,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,120)
	self:addTradeAcquire(RecipeDB, 60645,6, 1073, 2, 31916, 6, 1073, 2, 32763)

	-- Nerubian Reinforced Quiver -- 60647
	-- Knights of the Ebon Blade - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket,
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60647,415,44448,3,2108)
	self:addTradeFlags(RecipeDB, 60647,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,117)
	self:addTradeAcquire(RecipeDB, 60647,6, 1098, 2, 32538)

	-- Razorstrike Breastplate -- 60649
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val63id2val69id3val45id4val1171id6val46id44val102id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60649,420,43129,1, 2108)
	self:addTradeFlags(RecipeDB, 60649,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Virulent Spaulders -- 60651
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val38id2val48id3val33id4val878id6val34id44val94id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60651,415,43130,1, 2108)
	self:addTradeFlags(RecipeDB, 60651,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Eaglebane Bracers -- 60652
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val41id2val39id3val47id4val512id6val34id45val64id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60652,415,43131,1, 2108)
	self:addTradeFlags(RecipeDB, 60652,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nightshock Hood -- 60655
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val66id3val51id4val952id6val67id44val74id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60655,420,43132,1, 2108)
	self:addTradeFlags(RecipeDB, 60655,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Nightshock Girdle -- 60658
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val48id3val37id4val659id6val50id44val54id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60658,415,43133,1, 2108)
	self:addTradeFlags(RecipeDB, 60658,3,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	-- No acquire information

	-- Leggings of Visceral Strikes -- 60660
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id2val60id3val461id6val68id44val100id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60660,420,42731,1, 2108)
	self:addTradeFlags(RecipeDB, 60660,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Seafoam Gauntlets -- 60665
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val47id2val56id3val329id6val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60665,415,43255,1, 2108)
	self:addTradeFlags(RecipeDB, 60665,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Jormscale Footpads -- 60666
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val47id2val61id3val362id6val43id44val74id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60666,415,43256,1, 2108)
	self:addTradeFlags(RecipeDB, 60666,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Wildscale Breastplate -- 60669
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val34id4val68id5val527id6val53id44val80id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60669,420,43257,1, 2108)
	self:addTradeFlags(RecipeDB, 60669,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Purehorn Spaulders -- 60671
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val36id3val38id4val395id6val37id46val67id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60671,415,43258,1, 2108)
	self:addTradeFlags(RecipeDB, 60671,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	-- No acquire information

	-- Eviscerator's Facemask -- 60697
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id2val69id3val428id6val46id29val46id44val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60697,420,43260,3,2108)
	self:addTradeFlags(RecipeDB, 60697,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60697,2, 32515)

	-- Eviscerator's Shoulderpads -- 60702
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id2val51id3val395id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60702,420,43433,3,2108)
	self:addTradeFlags(RecipeDB, 60702,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60702,2, 32515)

	-- Eviscerator's Chestguard -- 60703
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id2val69id3val527id6val46id29val46id44val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60703,420,43434,3,2108)
	self:addTradeFlags(RecipeDB, 60703,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60703,2, 32515)

	-- Eviscerator's Bindings -- 60704
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val39id2val38id3val230id6val26id29val26id44val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60704,420,43435,3,2108)
	self:addTradeFlags(RecipeDB, 60704,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60704,2, 32515)

	-- Eviscerator's Gauntlets -- 60705
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id2val51id3val329id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60705,425,43436,3,2108)
	self:addTradeFlags(RecipeDB, 60705,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60705,2, 32515)

	-- Eviscerator's Waistguard -- 60706
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id2val51id3val296id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60706,425,43437,3,2108)
	self:addTradeFlags(RecipeDB, 60706,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60706,2, 32515)

	-- Eviscerator's Legguards -- 60711
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id2val69id3val461id6val46id29val46id44val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60711,425,43438,3,2108)
	self:addTradeFlags(RecipeDB, 60711,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60711,2, 32515)

	-- Eviscerator's Treads -- 60712
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id2val51id3val362id6val34id29val34id44val58id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60712,425,43439,3,2108)
	self:addTradeFlags(RecipeDB, 60712,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60712,2, 32515)

	-- Overcast Headguard -- 60715
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val46id5val428id6val46id29val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60715,420,43261,3,2108)
	self:addTradeFlags(RecipeDB, 60715,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60715,2, 32515)

	-- Overcast Spaulders -- 60716
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val34id5val395id6val34id29val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60716,420,43262,3,2108)
	self:addTradeFlags(RecipeDB, 60716,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60716,2, 32515)

	-- Overcast Chestguard -- 60718
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val46id5val527id6val46id29val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60718,420,43263,3,2108)
	self:addTradeFlags(RecipeDB, 60718,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60718,2, 32515)

	-- Overcast Bracers -- 60720
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val39id3val26id4val25id5val230id6val26id29val44id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60720,420,43264,3,2108)
	self:addTradeFlags(RecipeDB, 60720,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60720,2, 32515)

	-- Overcast Handwraps -- 60721
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val34id5val329id6val34id29val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60721,425,43265,3,2108)
	self:addTradeFlags(RecipeDB, 60721,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60721,2, 32515)

	-- Overcast Belt -- 60723
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val34id5val296id6val34id29val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60723,425,43266,3,2108)
	self:addTradeFlags(RecipeDB, 60723,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60723,2, 32515)

	-- Overcast Leggings -- 60725
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val46id5val461id6val46id29val81id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60725,425,43271,3,2108)
	self:addTradeFlags(RecipeDB, 60725,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60725,2, 32515)

	-- Overcast Boots -- 60727
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val34id5val362id6val34id29val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60727,425,43273,3,2108)
	self:addTradeFlags(RecipeDB, 60727,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60727,2, 32515)

	-- Swiftarrow Helm -- 60728
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val46id2val69id3val46id4val952id6val46id29val45id44val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60728,420,43447,3,2108)
	self:addTradeFlags(RecipeDB, 60728,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60728,2, 32515)

	-- Swiftarrow Shoulderguards -- 60729
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id2val51id3val34id4val878id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60729,420,43449,3,2108)
	self:addTradeFlags(RecipeDB, 60729,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60729,2, 32515)

	-- Swiftarrow Hauberk -- 60730
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val46id2val69id3val46id4val1171id6val46id29val45id44val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60730,420,43445,3,2108)
	self:addTradeFlags(RecipeDB, 60730,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60730,2, 32515)

	-- Swiftarrow Bracers -- 60731
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val26id2val39id3val25id4val512id6val25id29val26id44val50id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60731,420,43444,3,2108)
	self:addTradeFlags(RecipeDB, 60731,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60731,2, 32515)

	-- Swiftarrow Gauntlets -- 60732
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id2val51id3val34id4val732id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60732,425,43446,3,2108)
	self:addTradeFlags(RecipeDB, 60732,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60732,2, 32515)

	-- Swiftarrow Belt -- 60734
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id2val51id3val34id4val659id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60734,425,43442,3,2108)
	self:addTradeFlags(RecipeDB, 60734,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60734,2, 32515)

	-- Swiftarrow Leggings -- 60735
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val46id2val69id3val46id4val1025id6val46id29val45id44val92id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60735,425,43448,3,2108)
	self:addTradeFlags(RecipeDB, 60735,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60735,2, 32515)

	-- Swiftarrow Boots -- 60737
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val34id2val51id3val34id4val805id6val34id29val34id44val68id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60737,425,43443,3,2108)
	self:addTradeFlags(RecipeDB, 60737,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60737,2, 32515)

	-- Stormhide Crown -- 60743
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val952id6val46id29val18id47val80id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60743,420,43455,3,2108)
	self:addTradeFlags(RecipeDB, 60743,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60743,2, 32515)

	-- Stormhide Shoulders -- 60746
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val878id6val34id29val14id47val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60746,420,43457,3,2108)
	self:addTradeFlags(RecipeDB, 60746,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60746,2, 32515)

	-- Stormhide Hauberk -- 60747
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val1171id6val46id29val18id47val80id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60747,420,43453,3,2108)
	self:addTradeFlags(RecipeDB, 60747,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60747,2, 32515)

	-- Stormhide Wristguards -- 60748
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val37id3val26id4val512id6val26id29val10id47val46id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60748,420,43452,3,2108)
	self:addTradeFlags(RecipeDB, 60748,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60748,2, 32515)

	-- Stormhide Grips -- 60749
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val732id6val34id29val14id47val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60749,425,43454,3,2108)
	self:addTradeFlags(RecipeDB, 60749,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60749,2, 32515)

	-- Stormhide Belt -- 60750
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val659id6val34id29val14id47val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60750,425,43450,3,2108)
	self:addTradeFlags(RecipeDB, 60750,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60750,2, 32515)

	-- Stormhide Legguards -- 60751
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val69id3val46id4val1025id6val46id29val18id47val80id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60751,425,43456,3,2108)
	self:addTradeFlags(RecipeDB, 60751,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60751,2, 32515)

	-- Stormhide Stompers -- 60752
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val51id3val34id4val805id6val34id29val14id47val60id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60752,425,43451,3,2108)
	self:addTradeFlags(RecipeDB, 60752,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60752,2, 32515)

	-- Giantmaim Legguards -- 60754
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val90id2val63id3val52id4val1097id6val128id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60754,440,43458,4,2108)
	self:addTradeFlags(RecipeDB, 60754,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60754,2, 32515)

	-- Giantmaim Bracers -- 60755
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val50id2val43id3val29id4val549id6val72id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60755,440,43459,4,2108)
	self:addTradeFlags(RecipeDB, 60755,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60755,2, 32515)

	-- Revenant's Breastplate -- 60756
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val68id3val68id4val1254id6val89id46val105id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60756,440,43461,4,2108)
	self:addTradeFlags(RecipeDB, 60756,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60756,2, 32515)

	-- Revenant's Treads -- 60757
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val49id3val51id4val862id6val66id46val77id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60757,440,43469,4,2108)
	self:addTradeFlags(RecipeDB, 60757,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60757,2, 32515)

	-- Trollwoven Spaulders -- 60758
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val72id2val79id3val423id6val28id12val114id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60758,440,43481,4,2108)
	self:addTradeFlags(RecipeDB, 60758,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60758,2, 32515)

	-- Trollwoven Girdle -- 60759
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val66id2val72id3val317id6val38id12val132id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60759,440,43484,4,2108)
	self:addTradeFlags(RecipeDB, 60759,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60759,2, 32515)

	-- Earthgiving Legguards -- 60760
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val78id3val64id4val89id5val494id6val105id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60760,440,43495,4,2108)
	self:addTradeFlags(RecipeDB, 60760,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60760,2, 32515)

	-- Earthgiving Boots -- 60761
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val57id3val48id4val66id5val388id6val77id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60761,440,43502,4,2108)
	self:addTradeFlags(RecipeDB, 60761,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60761,2, 32515)

	-- Polar Vest -- 60996
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val169id3val578id6val115id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60996,425,43590,4,2108)
	self:addTradeFlags(RecipeDB, 60996,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60996,2, 32515)

	-- Polar Cord -- 60997
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val129id3val325id6val86id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60997,420,43591,4,2108)
	self:addTradeFlags(RecipeDB, 60997,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60997,2, 32515)

	-- Polar Boots -- 60998
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather,
	-- Item Stats: 
	-- Item Stats: val129id3val398id6val86id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60998,420,43592,4,2108)
	self:addTradeFlags(RecipeDB, 60998,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 60998,2, 32515)

	-- Icy Scale Chestguard -- 60999
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val169id3val1286id6val115id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60999,425,43593,4,2108)
	self:addTradeFlags(RecipeDB, 60999,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 60999,2, 32515)

	-- Icy Scale Belt -- 61000
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val129id3val723id6val86id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 61000,420,43594,4,2108)
	self:addTradeFlags(RecipeDB, 61000,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 61000,2, 32515)

	-- Icy Scale Boots -- 61002
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail,
	-- Item Stats: 
	-- Item Stats: val129id3val884id6val86id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 61002,420,43595,4,2108)
	self:addTradeFlags(RecipeDB, 61002,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 61002,2, 32515)

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
