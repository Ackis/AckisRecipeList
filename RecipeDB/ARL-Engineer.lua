--[[

************************************************************************

ARL-Engineer.lua

Engineering data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
251 found from data mining.
10 ignored.
2 WotLK ignored.

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

function addon:InitEngineering(RecipeDB)

	local recipecount = 0

	-- Rough Blasting Powder -- 3918
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3918, 1, 4357, 1, 4036)
	self:addTradeFlags(RecipeDB, 3918, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Rough Dynamite -- 3919
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3919, 1, 4358, 1, 4036)
	self:addTradeFlags(RecipeDB, 3919, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Crafted Light Shot -- 3920
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val2-2id7val3id8val2-2id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3920, 1, 8067, 1, 4036)
	self:addTradeFlags(RecipeDB, 3920, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,78)
	-- No acquire information

	-- Handful of Copper Bolts -- 3922
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3922, 30, 4359, 1, 4036)
	self:addTradeFlags(RecipeDB, 3922, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3922, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Rough Copper Bomb -- 3923
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3923, 30, 4360, 1, 4036)
	self:addTradeFlags(RecipeDB, 3923, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3923, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Copper Tube -- 3924
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3924, 50, 4361, 1, 4036)
	self:addTradeFlags(RecipeDB, 3924, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3924, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Rough Boomstick -- 3925
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val10-19id14val2.3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3925, 50, 4362, 1, 4036)
	self:addTradeFlags(RecipeDB, 3925, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 3925, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Copper Modulator -- 3926
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3926, 65, 4363, 1, 4036)
	self:addTradeFlags(RecipeDB, 3926, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3926, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Mechanical Squirrel -- 3928
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3928, 75, 4401, 2, 4036)
	self:addTradeFlags(RecipeDB, 3928, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3928, 7, 2)

	-- Coarse Blasting Powder -- 3929
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3929, 75, 4364, 1, 4036)
	self:addTradeFlags(RecipeDB, 3929, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3929, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Crafted Heavy Shot -- 3930
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val4-5id7val3id8val4-5id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3930, 75, 8068, 1, 4036)
	self:addTradeFlags(RecipeDB, 3930, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,78)
	self:addTradeAcquire(RecipeDB, 3930, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Coarse Dynamite -- 3931
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3931, 75, 4365, 1, 4036)
	self:addTradeFlags(RecipeDB, 3931, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3931, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Target Dummy -- 3932
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3932, 85, 4366, 1, 4036)
	self:addTradeFlags(RecipeDB, 3932, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3932, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Small Seaforium Charge -- 3933
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3933, 100, 4367, 2, 4036)
	self:addTradeFlags(RecipeDB, 3933, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3933, 7, 2)

	-- Flying Tiger Goggles -- 3934
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val4id3val4id5val27id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3934, 100, 4368, 1, 4036)
	self:addTradeFlags(RecipeDB, 3934, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3934, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Deadly Blunderbuss -- 3936
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val21-39id14val2.6id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3936, 105, 4369, 1, 4036)
	self:addTradeFlags(RecipeDB, 3936, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 3936, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Large Copper Bomb -- 3937
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3937, 55, 4370, 1, 4036)
	self:addTradeFlags(RecipeDB, 3937, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3937, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Bronze Tube -- 3938
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3938, 55, 4371, 1, 4036)
	self:addTradeFlags(RecipeDB, 3938, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3938, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Lovingly Crafted Boomstick -- 3939
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val16-31id14val1.8id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3939, 120, 4372, 1, 4036)
	self:addTradeFlags(RecipeDB, 3939, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46)
	self:addTradeAcquire(RecipeDB, 3939, 2, 2682, 2, 6730)

	-- Shadow Goggles -- 3940
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val5id4val6id5val31id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3940, 120, 4373, 2, 4036)
	self:addTradeFlags(RecipeDB, 3940, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3940, 7, 2)

	-- Small Bronze Bomb -- 3941
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3941, 70, 4374, 1, 4036)
	self:addTradeFlags(RecipeDB, 3941, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3941, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Whirring Bronze Gizmo -- 3942
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3942, 75, 4375, 1, 4036)
	self:addTradeFlags(RecipeDB, 3942, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3942, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Flame Deflector -- 3944
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3944, 75, 4376, 2, 4036)
	self:addTradeFlags(RecipeDB, 3944, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3944, 3, 7800)

	-- Heavy Blasting Powder -- 3945
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3945, 105, 4377, 1, 4036)
	self:addTradeFlags(RecipeDB, 3945, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3945, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Heavy Dynamite -- 3946
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3946, 105, 4378, 1, 4036)
	self:addTradeFlags(RecipeDB, 3946, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3946, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Crafted Solid Shot -- 3947
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val8-9id7val3id8val8-9id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3947, 105, 8069, 1, 4036)
	self:addTradeFlags(RecipeDB, 3947, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,78)
	self:addTradeAcquire(RecipeDB, 3947, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Silver-plated Shotgun -- 3949
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val27-50id14val2.7id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3949, 130, 4379, 1, 4036)
	self:addTradeFlags(RecipeDB, 3949, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 3949, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Big Bronze Bomb -- 3950
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3950, 90, 4380, 1, 4036)
	self:addTradeFlags(RecipeDB, 3950, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3950, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Minor Recombobulator -- 3952
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3952, 140, 4381, 1, 4036)
	self:addTradeFlags(RecipeDB, 3952, 1,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 3952, 2, 2682, 2, 2683)

	-- Bronze Framework -- 3953
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3953, 95, 4382, 1, 4036)
	self:addTradeFlags(RecipeDB, 3953, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3953, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Moonsight Rifle -- 3954
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val19-35id14val1.7id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3954, 145, 4383, 2, 4036)
	self:addTradeFlags(RecipeDB, 3954, 10,21,22,23,24,25,26,27,28,29,30,36,40,46)
	self:addTradeAcquire(RecipeDB, 3954, 7, 2)

	-- Explosive Sheep -- 3955
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3955, 150, 4384, 1, 4036)
	self:addTradeFlags(RecipeDB, 3955, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3955, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Green Tinted Goggles -- 3956
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val8id3val7id5val35id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3956, 150, 4385, 1, 4036)
	self:addTradeFlags(RecipeDB, 3956, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 3956, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Ice Deflector -- 3957
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3957, 155, 4386, 1, 4036)
	self:addTradeFlags(RecipeDB, 3957, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3957, 2, 2684)

	-- Iron Strut -- 3958
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3958, 140, 4387, 1, 4036)
	self:addTradeFlags(RecipeDB, 3958, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3958, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Discombobulator Ray -- 3959
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3959, 160, 4388, 2, 4036)
	self:addTradeFlags(RecipeDB, 3959, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3959, 3, 7800)

	-- Portable Bronze Mortar -- 3960
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3960, 165, 4403, 2, 4036)
	self:addTradeFlags(RecipeDB, 3960, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3960, 7, 2)

	-- Gyrochronatom -- 3961
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3961, 130, 4389, 1, 4036)
	self:addTradeFlags(RecipeDB, 3961, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3961, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Iron Grenade -- 3962
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3962, 135, 4390, 1, 4036)
	self:addTradeFlags(RecipeDB, 3962, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3962, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Compact Harvest Reaper Kit -- 3963
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3963, 135, 4391, 1, 4036)
	self:addTradeFlags(RecipeDB, 3963, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3963, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Advanced Target Dummy -- 3965
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3965, 145, 4392, 1, 4036)
	self:addTradeFlags(RecipeDB, 3965, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3965, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Craftsman's Monocle -- 3966
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id4val40id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3966, 185, 4393, 3, 4036)
	self:addTradeFlags(RecipeDB, 3966, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 3966, 7, 3)

	-- Big Iron Bomb -- 3967
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3967, 150, 4394, 1, 4036)
	self:addTradeFlags(RecipeDB, 3967, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3967, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Goblin Land Mine -- 3968
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3968, 195, 4395, 2, 4036)
	self:addTradeFlags(RecipeDB, 3968, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3968, 7, 2)

	-- Mechanical Dragonling -- 3969
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3969, 200, 4396, 1, 4036)
	self:addTradeFlags(RecipeDB, 3969, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 3969, 2, 2687)

	-- Gnomish Cloaking Device -- 3971
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3971, 200, 4397, 1, 4036)
	self:addTradeFlags(RecipeDB, 3971, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 3971, 3, 7800, 2, 6777)

	-- Large Seaforium Charge -- 3972
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3972, 160, 4398, 2, 4036)
	self:addTradeFlags(RecipeDB, 3972, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3972, 7, 2)

	-- Silver Contact -- 3973
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3973, 80, 4404, 1, 4036)
	self:addTradeFlags(RecipeDB, 3973, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3973, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Crude Scope -- 3977
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3977, 60, 4405, 1, 4036)
	self:addTradeFlags(RecipeDB, 3977, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3977, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Standard Scope -- 3978
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3978, 110, 4406, 1, 4036)
	self:addTradeFlags(RecipeDB, 3978, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3978, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Accurate Scope -- 3979
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3979, 180, 4407, 1, 4036)
	self:addTradeFlags(RecipeDB, 3979, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3979, 2, 2685)

	-- Ornate Spyglass -- 6458
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6458, 135, 5507, 1, 4036)
	self:addTradeFlags(RecipeDB, 6458, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 6458, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Arclight Spanner -- 7430
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Misc, 
	-- Item Stats: 
	-- Item Stats: val7-14id7val2.4id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7430, 50, 6219, 1, 4036)
	self:addTradeFlags(RecipeDB, 7430, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 7430, 1, 1702, 1, 2857, 1, 3290, 1, 3412, 1, 3494, 1, 4586, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11025, 1, 11026, 1, 11028, 1, 11029, 1, 11031, 1, 11037, 1, 16667, 1, 16668, 1, 16726, 1, 16743, 1, 17222, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Flash Bomb -- 8243
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Mob Drop
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8243, 145, 4852, 2, 4036)
	self:addTradeFlags(RecipeDB, 8243, 1,2,5,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 8243, 3, 7800, 4, 1559)

	-- Practice Lock -- 8334
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8334, 100, 6712, 1, 4036)
	self:addTradeFlags(RecipeDB, 8334, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 8334, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- EZ-Thro Dynamite -- 8339
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8339, 100, 6714, 2, 4036)
	self:addTradeFlags(RecipeDB, 8339, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 8339, 7, 2)

	-- Goblin Rocket Boots -- 8895
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val41id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 8895, 225, 7189, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 8895, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 8895, 1, 8126)

	-- Gnomish Universal Remote -- 9269
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9269, 125, 7506, 1, 4036)
	self:addTradeFlags(RecipeDB, 9269, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 9269, 3, 7800, 2, 5175, 2, 6730)

	-- Aquadynamic Fish Attractor -- 9271
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9271, 130, 6533, 1, 4036)
	self:addTradeFlags(RecipeDB, 9271, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 9271, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Goblin Jumper Cables -- 9273
	-- Instance: 721 - type1category3maxlevel33territory2minlevel24nameGnomereganid721
	-- Mob Drop
	-- Instance: 2367 - type5category3maxlevel68territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9273, 120, 7148, 1, 4036)
	self:addTradeFlags(RecipeDB, 9273, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 9273, 3, 7800, 2, 3134, 2, 3537, 2, 4086)

	-- Gold Power Core -- 12584
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12584, 110, 10558, 1, 4036)
	self:addTradeFlags(RecipeDB, 12584, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12584, 1, 1676, 1, 3412, 1, 5174, 1, 5518, 1, 8736, 1, 11017, 1, 11029, 1, 11031, 1, 16667, 1, 16726, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Solid Blasting Powder -- 12585
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12585, 155, 10505, 1, 4036)
	self:addTradeFlags(RecipeDB, 12585, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12585, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Solid Dynamite -- 12586
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12586, 155, 10507, 1, 4036)
	self:addTradeFlags(RecipeDB, 12586, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12586, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Bright-Eye Goggles -- 12587
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val9id3val9id5val38id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12587, 175, 10499, 2, 4036)
	self:addTradeFlags(RecipeDB, 12587, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12587, 7, 2)

	-- Mithril Tube -- 12589
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12589, 155, 10559, 1, 4036)
	self:addTradeFlags(RecipeDB, 12589, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12589, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Gyromatic Micro-Adjustor -- 12590
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12590, 135, 10498, 1, 4036)
	self:addTradeFlags(RecipeDB, 12590, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12590, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Unstable Trigger -- 12591
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12591, 160, 10560, 1, 4036)
	self:addTradeFlags(RecipeDB, 12591, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12591, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Fire Goggles -- 12594
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val44id6val17id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12594, 205, 10500, 1, 4036)
	self:addTradeFlags(RecipeDB, 12594, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12594, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Mithril Blunderbuss -- 12595
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val5id2val48-90id14val2.9id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12595, 205, 10508, 1, 4036)
	self:addTradeFlags(RecipeDB, 12595, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 12595, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Hi-Impact Mithril Slugs -- 12596
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val12-13id7val3id8val12-13id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12596, 170, 10512, 1, 4036)
	self:addTradeFlags(RecipeDB, 12596, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,78)
	self:addTradeAcquire(RecipeDB, 12596, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Deadly Scope -- 12597
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12597, 210, 10546, 1, 4036)
	self:addTradeFlags(RecipeDB, 12597, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 12597, 2, 8679, 2, 9544)

	-- Mithril Casing -- 12599
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12599, 175, 10561, 1, 4036)
	self:addTradeFlags(RecipeDB, 12599, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12599, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Mithril Frag Bomb -- 12603
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12603, 175, 10514, 1, 4036)
	self:addTradeFlags(RecipeDB, 12603, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12603, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Catseye Ultra Goggles -- 12607
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val47id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12607, 220, 10501, 2, 4036)
	self:addTradeFlags(RecipeDB, 12607, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12607, 7, 2)

	-- Mithril Heavy-bore Rifle -- 12614
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val53-99id14val2.9id15val14id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12614, 220, 10510, 2, 4036)
	self:addTradeFlags(RecipeDB, 12614, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63)
	self:addTradeAcquire(RecipeDB, 12614, 7, 2)

	-- Spellpower Goggles Xtreme -- 12615
	-- Trainer
	-- Instance: 2100 - type1category3maxlevel49territory1minlevel43nameMaraudonid2100
	-- Raid: 2677 - Blackwing Lair
	-- Raid: 2159 - Onyxia's Lair
	-- Instance: 2100 - type1category3maxlevel49territory1minlevel43nameMaraudonid2100
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val46id6val21id19val21id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12615, 225, 10502, 3, 4036)
	self:addTradeFlags(RecipeDB, 12615, 1,2,3,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 12615, 3, 4396, 3, 10184, 3, 11583, 3, 11791, 3, 12219, 3, 14888, 3, 14889, 3, 14890, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Parachute Cloak -- 12616
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloak, 
	-- Item Stats: 
	-- Item Stats: val8id2val30id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12616, 225, 10518, 2, 4036)
	self:addTradeFlags(RecipeDB, 12616, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,60)
	self:addTradeAcquire(RecipeDB, 12616, 7, 2)

	-- Deepdive Helmet -- 12617
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id3val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12617, 230, 10506, 1, 4036)
	self:addTradeFlags(RecipeDB, 12617, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 12617, 2, 8678)

	-- Rose Colored Goggles -- 12618
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val12id4val13id5val49id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12618, 230, 10503, 1, 4036)
	self:addTradeFlags(RecipeDB, 12618, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12618, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Hi-Explosive Bomb -- 12619
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12619, 195, 10562, 1, 4036)
	self:addTradeFlags(RecipeDB, 12619, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12619, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Sniper Scope -- 12620
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12620, 240, 10548, 3, 4036)
	self:addTradeFlags(RecipeDB, 12620, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 12620, 7, 3)

	-- Mithril Gyro-Shot -- 12621
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val15-15id7val3id8val15-15id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12621, 205, 10513, 1, 4036)
	self:addTradeFlags(RecipeDB, 12621, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,78)
	self:addTradeAcquire(RecipeDB, 12621, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Green Lens -- 12622
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val10id3val57id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12622, 245, 10504, 1, 4036)
	self:addTradeFlags(RecipeDB, 12622, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12622, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Mithril Mechanical Dragonling -- 12624
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12624, 250, 10576, 1, 4036)
	self:addTradeFlags(RecipeDB, 12624, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 12624, 2, 2688)

	-- Goblin Rocket Fuel Recipe -- 12715
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12715, 205, 10644, 1, 4036)
	self:addTradeFlags(RecipeDB, 12715, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12715, 1, 8126)

	-- Goblin Mortar -- 12716
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12716, 205, 10577, 1, 4036)
	self:addTradeFlags(RecipeDB, 12716, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 12716, 1, 8126)

	-- Goblin Mining Helmet -- 12717
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val15id3val190id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12717, 205, 10542, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12717, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 12717, 1, 8126)

	-- Goblin Construction Helmet -- 12718
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val44id6val15id33
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12718, 205, 10543, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12718, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,56)
	self:addTradeAcquire(RecipeDB, 12718, 1, 8126)

	-- Explosive Arrow -- 12719
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, 
	-- Item Stats: 
	-- Item Stats: val14-15id7val3id8val14-15id14val3id15
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 12719, 170, 10579, 3, 4036)
	--self:addTradeFlags(RecipeDB, 12719, 3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	-- No acquire information

	-- Goblin \"Boom\" Box -- 12720
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 12720, 215, 10580, 1, 4036)
	--self:addTradeFlags(RecipeDB, 12720, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Goblin Radio -- 12722
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 12722, 220, 10585, 1, 4036)
	--self:addTradeFlags(RecipeDB, 12722, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- The Big One -- 12754
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12754, 195, 10586, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12754, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12754, 1, 8126, 1, 8738)

	-- Goblin Bomb Dispenser -- 12755
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12755, 190, 10587, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12755, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 12755, 1, 8126, 1, 8738)

	-- Goblin Rocket Helmet -- 12758
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val15id3val50id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12758, 245, 10588, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12758, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12758, 1, 8126, 1, 8738)

	-- Gnomish Death Ray -- 12759
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12759, 240, 10645, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12759, 1,3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 12759, 1, 7406, 1, 7944)

	-- Goblin Sapper Charge -- 12760
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12760, 165, 10646, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12760, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12760, 1, 8126)

	-- Inlaid Mithril Cylinder Plans -- 12895
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12895, 205, 10713, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12895, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Goggles -- 12897
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val9id3val9id5val45id6val11id19val11id20
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12897, 210, 10545, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12897, 1,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 12897, 1, 7406, 1, 7944)

	-- Gnomish Shrink Ray -- 12899
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12899, 205, 10716, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12899, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 12899, 1, 7406, 1, 7944)

	-- Mobile Alarm -- 12900
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 12900, 165, 10719, 1, 4036)
	--self:addTradeFlags(RecipeDB, 12900, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Net-o-Matic Projector -- 12902
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12902, 210, 10720, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12902, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 12902, 1, 7406, 1, 7944)

	-- Gnomish Harm Prevention Belt -- 12903
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val6id3val66id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12903, 215, 10721, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12903, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 12903, 1, 7406, 1, 7944)

	-- Gnomish Ham Radio -- 12904
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 12904, 220, 10723, 1, 4036)
	--self:addTradeFlags(RecipeDB, 12904, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Gnomish Rocket Boots -- 12905
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val41id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12905, 225, 10724, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12905, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12905, 1, 7406, 1, 7944)

	-- Gnomish Battle Chicken -- 12906
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12906, 230, 10725, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12906, 1,3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 12906, 1, 7406, 1, 7944)

	-- Gnomish Mind Control Cap -- 12907
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val14id5val50id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 12907, 235, 10726, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 12907, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 12907, 1, 7406, 1, 7944)

	-- Goblin Dragon Gun -- 12908
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 12908, 240, 10727, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 12908, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 12908, 1, 8126, 1, 8738)

	-- The Mortar: Reloaded -- 13240
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 13240, 1, 10577, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 13240, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Mechanical Repair Kit -- 15255
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15255, 160, 11590, 1, 4036)
	self:addTradeFlags(RecipeDB, 15255, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 15255, 1, 5174, 1, 8736, 1, 11017, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Pet Bombling -- 15628
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 15628, 205, 11825, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 15628, 3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Lil' Smoky -- 15633
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 15633, 205, 11826, 2, 4036, 20219)
	self:addTradeFlags(RecipeDB, 15633, 11,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 15633, 3, 1964)

	-- Salt Shaker -- 19567
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19567, 250, 15846, 1, 4036)
	self:addTradeFlags(RecipeDB, 19567, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19567, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Dense Blasting Powder -- 19788
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19788, 240, 15992, 1, 4036)
	self:addTradeFlags(RecipeDB, 19788, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 19788, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Thorium Grenade -- 19790
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19790, 260, 15993, 1, 4036)
	self:addTradeFlags(RecipeDB, 19790, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19790, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Thorium Widget -- 19791
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19791, 260, 15994, 1, 4036)
	self:addTradeFlags(RecipeDB, 19791, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19791, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Thorium Rifle -- 19792
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val55-102id14val2.5id15val17id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19792, 260, 15995, 2, 4036)
	self:addTradeFlags(RecipeDB, 19792, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63)
	self:addTradeAcquire(RecipeDB, 19792, 7, 2, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Lifelike Mechanical Toad -- 19793
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19793, 265, 15996, 2, 4036)
	self:addTradeFlags(RecipeDB, 19793, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19793, 7, 2)

	-- Spellpower Goggles Xtreme Plus -- 19794
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val57id6val27id19val27id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19794, 270, 15999, 2, 4036)
	self:addTradeFlags(RecipeDB, 19794, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 19794, 3, 6195, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Thorium Tube -- 19795
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19795, 275, 16000, 1, 4036)
	self:addTradeFlags(RecipeDB, 19795, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19795, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Dark Iron Rifle -- 19796
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val68-127id14val2.7id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19796, 275, 16004, 2, 4036)
	self:addTradeFlags(RecipeDB, 19796, 5,11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63)
	self:addTradeAcquire(RecipeDB, 19796, 3, 8897, 3, 9026)

	-- Dark Iron Bomb -- 19799
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19799, 285, 16005, 2, 4036)
	self:addTradeFlags(RecipeDB, 19799, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19799, 3, 8920)

	-- Thorium Shells -- 19800
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val17-18id7val3id8val17-18id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19800, 285, 15997, 2, 4036)
	self:addTradeFlags(RecipeDB, 19800, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,46,78)
	self:addTradeAcquire(RecipeDB, 19800, 7, 2, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Masterwork Target Dummy -- 19814
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19814, 275, 16023, 1, 4036)
	self:addTradeFlags(RecipeDB, 19814, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19814, 2, 11185)

	-- Delicate Arcanite Converter -- 19815
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19815, 285, 16006, 1, 4036)
	self:addTradeFlags(RecipeDB, 19815, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19815, 2, 11185)

	-- Voice Amplification Modulator -- 19819
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19819, 290, 16009, 2, 4036)
	self:addTradeFlags(RecipeDB, 19819, 5,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 19819, 3, 10426)

	-- Master Engineer's Goggles -- 19825
	-- Trainer
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val16id3val17id5val61id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19825, 290, 16008, 2, 4036)
	self:addTradeFlags(RecipeDB, 19825, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 19825, 3, 8900, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Arcanite Dragonling -- 19830
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19830, 300, 16022, 2, 4036)
	self:addTradeFlags(RecipeDB, 19830, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 19830, 3, 7437)

	-- Arcane Bomb -- 19831
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19831, 300, 16040, 2, 4036)
	self:addTradeFlags(RecipeDB, 19831, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 19831, 7, 2)

	-- Flawless Arcanite Rifle -- 19833
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val9id11val83-155id14val3id15val10id16val9id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 19833, 300, 16007, 2, 4036)
	self:addTradeFlags(RecipeDB, 19833, 11,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63)
	self:addTradeAcquire(RecipeDB, 19833, 3, 8561)

	-- SnowMaster 9000 -- 21940
	-- Flags: All classes, Item BoE, Recipe BoE, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21940, 150, 17716, 2, 4036)
	self:addTradeFlags(RecipeDB, 21940, 7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 21940, 5, 1)

	-- Field Repair Bot 74A -- 22704
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22704, 300, 18232, 1, 4036)
	self:addTradeFlags(RecipeDB, 22704, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Biznicks 247x128 Accurascope -- 22793
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
	self:addTradeSkill(RecipeDB, 22793, 300, 18283, 3, 4036)
	self:addTradeFlags(RecipeDB, 22793, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22793, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Core Marksman Rifle -- 22795
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val79-148id14val2.5id15val22id16val10id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22795, 300, 18282, 3, 4036)
	self:addTradeFlags(RecipeDB, 22795, 6,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63)
	self:addTradeAcquire(RecipeDB, 22795, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Force Reactive Disk -- 22797
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Shield, 
	-- Item Stats: 
	-- Item Stats: val11id3val2916id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22797, 300, 18168, 3, 4036)
	self:addTradeFlags(RecipeDB, 22797, 6,21,22,23,24,25,26,27,28,29,30,36,41,47,64)
	self:addTradeAcquire(RecipeDB, 22797, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Red Firework -- 23066
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23066, 125, 9318, 1, 4036)
	self:addTradeFlags(RecipeDB, 23066, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23066, 2, 3413)

	-- Blue Firework -- 23067
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23067, 125, 9312, 1, 4036)
	self:addTradeFlags(RecipeDB, 23067, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23067, 2, 1304, 2, 5175)

	-- Green Firework -- 23068
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23068, 125, 9313, 1, 4036)
	self:addTradeFlags(RecipeDB, 23068, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23068, 2, 2838, 2, 3495)

	-- EZ-Thro Dynamite II -- 23069
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23069, 180, 18588, 1, 4036)
	self:addTradeFlags(RecipeDB, 23069, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23069, 2, 8131)

	-- Dense Dynamite -- 23070
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23070, 230, 18641, 1, 4036)
	self:addTradeFlags(RecipeDB, 23070, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 23070, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Truesilver Transformer -- 23071
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23071, 260, 18631, 1, 4036)
	self:addTradeFlags(RecipeDB, 23071, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23071, 1, 8736, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Gyrofreeze Ice Reflector -- 23077
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val15id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23077, 260, 18634, 1, 4036)
	self:addTradeFlags(RecipeDB, 23077, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 23077, 2, 11185)

	-- Goblin Jumper Cables XL -- 23078
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 23078, 265, 18587, 2, 4036, 20222)
	self:addTradeFlags(RecipeDB, 23078, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23078, 3, 9499)

	-- Major Recombobulator -- 23079
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23079, 275, 18637, 2, 4036)
	self:addTradeFlags(RecipeDB, 23079, 21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	-- No acquire information

	-- Powerful Seaforium Charge -- 23080
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23080, 255, 18594, 1, 4036)
	self:addTradeFlags(RecipeDB, 23080, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23080, 2, 11185)

	-- Hyper-Radiant Flame Reflector -- 23081
	-- Instance: 1583 - type1category3maxlevel60territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val18id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23081, 290, 18638, 2, 4036)
	self:addTradeFlags(RecipeDB, 23081, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 23081, 3, 10264)

	-- Ultra-Flash Shadow Reflector -- 23082
	-- Instance: 2017 - type1category3maxlevel60territory1minlevel58nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val20id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23082, 300, 18639, 2, 4036)
	self:addTradeFlags(RecipeDB, 23082, 5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 23082, 3, 10426)

	-- Alarm-O-Bot -- 23096
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 23096, 265, 18645, 2, 4036, 20219)
	self:addTradeFlags(RecipeDB, 23096, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23096, 3, 8920)

	-- World Enlarger -- 23129
	-- Instance: 1584 - type1category3maxlevel60territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 23129, 250, 18660, 2, 4036, 20219)
	self:addTradeFlags(RecipeDB, 23129, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 23129, 3, 8920)

	-- Dimensional Ripper - Everlook -- 23486
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 23486, 265, 18984, 2, 4036, 20222)
	self:addTradeFlags(RecipeDB, 23486, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Ultrasafe Transporter - Gadgetzan -- 23489
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 23489, 265, 18986, 2, 4036, 20219)
	self:addTradeFlags(RecipeDB, 23489, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Snake Burst Firework -- 23507
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23507, 230, 19026, 1, 4036)
	self:addTradeFlags(RecipeDB, 23507, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 23507, 2, 14637)

	-- Bloodvine Goggles -- 24356
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val75id6val16id21val14id22val9id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24356, 300, 19999, 1, 4036)
	self:addTradeFlags(RecipeDB, 24356, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56,100)
	self:addTradeAcquire(RecipeDB, 24356, 6, 270, 2, 14921)

	-- Bloodvine Lens -- 24357
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val12id3val147id6val28id11val28id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24357, 300, 19998, 1, 4036)
	self:addTradeFlags(RecipeDB, 24357, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,57,100)
	self:addTradeAcquire(RecipeDB, 24357, 6, 270, 1, 14921)

	-- Tranquil Mechanical Yeti -- 26011
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26011, 300, 21277, 1, 4036)
	self:addTradeFlags(RecipeDB, 26011, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Small Blue Rocket -- 26416
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26416, 100, 21558, 2, 4036)
	self:addTradeFlags(RecipeDB, 26416, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26416, 5, 2, 3, 15909)

	-- Small Green Rocket -- 26417
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26417, 100, 21559, 2, 4036)
	self:addTradeFlags(RecipeDB, 26417, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26417, 5, 2, 3, 15909)

	-- Small Red Rocket -- 26418
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26418, 100, 21557, 2, 4036)
	self:addTradeFlags(RecipeDB, 26418, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26418, 5, 2, 3, 15909)

	-- Large Blue Rocket -- 26420
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26420, 150, 21589, 2, 4036)
	self:addTradeFlags(RecipeDB, 26420, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26420, 5, 2, 3, 15909)

	-- Large Green Rocket -- 26421
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26421, 150, 21590, 2, 4036)
	self:addTradeFlags(RecipeDB, 26421, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26421, 5, 2, 3, 15909)

	-- Large Red Rocket -- 26422
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26422, 150, 21592, 2, 4036)
	self:addTradeFlags(RecipeDB, 26422, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26422, 5, 2, 3, 15909)

	-- Blue Rocket Cluster -- 26423
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26423, 200, 21571, 2, 4036)
	self:addTradeFlags(RecipeDB, 26423, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26423, 5, 2)

	-- Green Rocket Cluster -- 26424
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26424, 200, 21574, 2, 4036)
	self:addTradeFlags(RecipeDB, 26424, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26424, 5, 2)

	-- Red Rocket Cluster -- 26425
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26425, 200, 21576, 2, 4036)
	self:addTradeFlags(RecipeDB, 26425, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26425, 5, 2)

	-- Large Blue Rocket Cluster -- 26426
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26426, 265, 21714, 2, 4036)
	self:addTradeFlags(RecipeDB, 26426, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26426, 5, 2, 3, 15909)

	-- Large Green Rocket Cluster -- 26427
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26427, 265, 21716, 2, 4036)
	self:addTradeFlags(RecipeDB, 26427, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26427, 5, 2, 3, 15909)

	-- Large Red Rocket Cluster -- 26428
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26428, 265, 21718, 2, 4036)
	self:addTradeFlags(RecipeDB, 26428, 7,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26428, 5, 2, 3, 15909)

	-- Firework Launcher -- 26442
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26442, 225, 21569, 2, 4036)
	self:addTradeFlags(RecipeDB, 26442, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26442, 5, 2)

	-- Firework Cluster Launcher -- 26443
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26443, 275, 21570, 2, 4036)
	self:addTradeFlags(RecipeDB, 26443, 7,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 26443, 5, 2, 4, 8882)

	-- Steam Tonk Controller -- 28327
	-- Vendor
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28327, 265, 22728, 1, 4036)
	self:addTradeFlags(RecipeDB, 28327, 1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28327, 4, 9249, 2, 3413)

	-- Elemental Blasting Powder -- 30303
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30303, 280, 23781, 1, 4036)
	self:addTradeFlags(RecipeDB, 30303, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30303, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Fel Iron Casing -- 30304
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30304, 280, 23782, 1, 4036)
	self:addTradeFlags(RecipeDB, 30304, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30304, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Handful of Fel Iron Bolts -- 30305
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30305, 290, 23783, 1, 4036)
	self:addTradeFlags(RecipeDB, 30305, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30305, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Adamantite Frame -- 30306
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30306, 315, 23784, 1, 4036)
	self:addTradeFlags(RecipeDB, 30306, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30306, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Hardened Adamantite Tube -- 30307
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30307, 330, 23785, 1, 4036)
	self:addTradeFlags(RecipeDB, 30307, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30307, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Khorium Power Core -- 30308
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30308, 330, 23786, 1, 4036)
	self:addTradeFlags(RecipeDB, 30308, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30308, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Felsteel Stabilizer -- 30309
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30309, 330, 23787, 1, 4036)
	self:addTradeFlags(RecipeDB, 30309, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30309, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Fel Iron Bomb -- 30310
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30310, 300, 23736, 1, 4036)
	self:addTradeFlags(RecipeDB, 30310, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30310, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Adamantite Grenade -- 30311
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30311, 315, 23737, 1, 4036)
	self:addTradeFlags(RecipeDB, 30311, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30311, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Fel Iron Musket -- 30312
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val14id3val99-185id14val2.8id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30312, 310, 23742, 1, 4036)
	self:addTradeFlags(RecipeDB, 30312, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 30312, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Adamantite Rifle -- 30313
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val12id2val22id9val126-234id14val3id15val22id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30313, 340, 23746, 1, 4036)
	self:addTradeFlags(RecipeDB, 30313, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63)
	self:addTradeAcquire(RecipeDB, 30313, 2, 16657, 2, 16782, 2, 19661)

	-- Felsteel Boomstick -- 30314
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val12id3val13id11val104-194id14val2.4id15val13id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30314, 350, 23747, 3, 4036)
	self:addTradeFlags(RecipeDB, 30314, 11,21,22,23,24,25,26,27,28,29,30,36,41,46,47,63)
	self:addTradeAcquire(RecipeDB, 30314, 3, 19960)

	-- Ornate Khorium Rifle -- 30315
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Gun, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val14id2val144-268id14val3.1id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30315, 365, 23748, 3, 4036)
	self:addTradeFlags(RecipeDB, 30315, 10,21,22,23,24,25,26,27,28,29,30,36,40,46,47,63)
	self:addTradeAcquire(RecipeDB, 30315, 7, 3)

	-- Cogspinner Goggles -- 30316
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val220id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30316, 330, 23758, 1, 4036)
	self:addTradeFlags(RecipeDB, 30316, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,57)
	self:addTradeAcquire(RecipeDB, 30316, 2, 18775, 2, 19836)

	-- Power Amplification Goggles -- 30317
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val46id3val100id6val36id19val36id20val31id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30317, 330, 23761, 3, 4036)
	self:addTradeFlags(RecipeDB, 30317, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 30317, 7, 3)

	-- Ultra-Spectropic Detection Goggles -- 30318
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val48id3val47id5val124id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30318, 340, 23762, 1, 4036)
	self:addTradeFlags(RecipeDB, 30318, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,56)
	self:addTradeAcquire(RecipeDB, 30318, 2, 18775, 2, 19383)

	-- Hyper-Vision Goggles -- 30325
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val232id6val84id9val84id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30325, 350, 23763, 3, 4036)
	self:addTradeFlags(RecipeDB, 30325, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 30325, 3, 19755)

	-- Adamantite Scope -- 30329
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30329, 325, 23764, 1, 4036)
	self:addTradeFlags(RecipeDB, 30329, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 30329, 2, 19351, 2, 19836)

	-- Khorium Scope -- 30332
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30332, 350, 23765, 3, 4036)
	self:addTradeFlags(RecipeDB, 30332, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30332, 3, 20207)

	-- Stabilized Eternium Scope -- 30334
	-- Raid: 3457 - Karazhan
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30334, 365, 23766, 3, 4036)
	self:addTradeFlags(RecipeDB, 30334, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30334, 3, 15550, 3, 16152)

	-- Crashin' Thrashin' Robot -- 30337
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30337, 315, 23767, 2, 4036)
	self:addTradeFlags(RecipeDB, 30337, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 30337, 7, 2)

	-- White Smoke Flare -- 30341
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30341, 315, 23768, 1, 4036)
	self:addTradeFlags(RecipeDB, 30341, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 30341, 2, 16657, 2, 16782, 2, 18484, 2, 19383)

	-- Red Smoke Flare -- 30342
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 30342, 315, 23769, 1, 4036)
	--self:addTradeFlags(RecipeDB, 30342, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Blue Smoke Flare -- 30343
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 30343, 315, 23770, 1, 4036)
	--self:addTradeFlags(RecipeDB, 30343, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Green Smoke Flare -- 30344
	-- Cenarion Expedition - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30344, 315, 23771, 1, 4036)
	self:addTradeFlags(RecipeDB, 30344, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 30344, 6, 942, 1, 17904)

	-- Fel Iron Shells -- 30346
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Ammo, 
	-- Item Stats: 
	-- Item Stats: val26-26id7val3id8val26-26id14val3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30346, 290, 23772, 1, 4036)
	self:addTradeFlags(RecipeDB, 30346, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,78)
	self:addTradeAcquire(RecipeDB, 30346, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Adamantite Shell Machine -- 30347
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Ammo, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30347, 315, 34504, 1, 4036)
	self:addTradeFlags(RecipeDB, 30347, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,78)
	self:addTradeAcquire(RecipeDB, 30347, 2, 16657, 2, 16782, 2, 18484)

	-- Fel Iron Toolbox -- 30348
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30348, 305, 23774, 1, 4036)
	self:addTradeFlags(RecipeDB, 30348, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 30348, 2, 16657, 2, 16782, 2, 18484)

	-- Khorium Toolbox -- 30349
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 30349, 340, 23775, 3, 4036)
	--self:addTradeFlags(RecipeDB, 30349, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elemental Seaforium Charge -- 30547
	-- The Consortium - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30547, 340, 23819, 1, 4036)
	self:addTradeFlags(RecipeDB, 30547, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 30547, 6, 933, 3, 20242, 6, 933, 3, 23007)

	-- Zapthrottle Mote Extractor -- 30548
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30548, 285, 23821, 1, 4036)
	self:addTradeFlags(RecipeDB, 30548, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30548, 4, 9635, 4, 9636)

	-- Critter Enlarger -- 30549
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 30549, 305, 23820, 2, 4036)
	--self:addTradeFlags(RecipeDB, 30549, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Healing Potion Injector -- 30551
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30551, 310, 33092, 3, 4036)
	self:addTradeFlags(RecipeDB, 30551, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 30551, 7, 3)

	-- Mana Potion Injector -- 30552
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30552, 325, 33093, 3, 4036)
	self:addTradeFlags(RecipeDB, 30552, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 30552, 7, 3)

	-- Rocket Boots Xtreme -- 30556
	-- Instance: 3715 - type5category3territory1expansion1minlevel70nameCoilfang Reservoir: The Steamvaultid3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val196id6val80id9val80id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 30556, 345, 23824, 3, 4036)
	self:addTradeFlags(RecipeDB, 30556, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,57)
	self:addTradeAcquire(RecipeDB, 30556, 3, 17796)

	-- The Bigger One -- 30558
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 30558, 305, 23826, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 30558, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30558, 1, 8126, 1, 8738)

	-- Super Sapper Charge -- 30560
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 30560, 320, 23827, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 30560, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30560, 1, 8126, 1, 8738)

	-- Goblin Tonk Controller -- 30561
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 30561, 315, 23831, 1, 4036)
	--self:addTradeFlags(RecipeDB, 30561, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Goblin Rocket Launcher -- 30563
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val45id3
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 30563, 340, 23836, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 30563, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 30563, 1, 8126, 1, 8738)

	-- Foreman's Enchanted Helmet -- 30565
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val48id3val30id4val132id6val36id19val36id20
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 30565, 355, 23838, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 30565, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 30565, 1, 8126, 1, 8738)

	-- Foreman's Reinforced Helmet -- 30566
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id2val48id3val550id6val62id9val62id16
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 30566, 355, 23839, 1, 4036, 20222)
	self:addTradeFlags(RecipeDB, 30566, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 30566, 1, 8126, 1, 8738)

	-- Gnomish Flame Turret -- 30568
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 30568, 315, 23841, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 30568, 1,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 30568, 1, 7406, 1, 7944)

	-- Gnomish Poultryizer -- 30569
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val45id3
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 30569, 340, 23835, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 30569, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 30569, 1, 7406, 1, 7944)

	-- Nigh-Invulnerability Belt -- 30570
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val21id3val223id6
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 30570, 340, 23825, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 30570, 1,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 30570, 1, 7406, 1, 7944)

	-- Gnomish Power Goggles -- 30574
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val21id4val132id6val59id19val59id20val28id22
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 30574, 355, 23828, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 30574, 1,3,21,22,23,24,25,26,27,28,29,30,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 30574, 1, 7406, 1, 7944)

	-- Gnomish Battle Goggles -- 30575
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val21id3val249id6val100id9val28id11val100id16val28id18
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 30575, 355, 23829, 1, 4036, 20219)
	self:addTradeFlags(RecipeDB, 30575, 1,3,21,22,23,24,25,26,27,28,29,30,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 30575, 1, 7406, 1, 7944)

	-- Purple Smoke Flare -- 32814
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32814, 315, 25886, 2, 4036)
	self:addTradeFlags(RecipeDB, 32814, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32814, 7, 2)

	-- Dimensional Ripper - Area 52 -- 36954
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20222
	self:addTradeSkill(RecipeDB, 36954, 330, 30542, 2, 4036, 20222)
	self:addTradeFlags(RecipeDB, 36954, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Ultrasafe Transporter - Toshley's Station -- 36955
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	-- Recipe Specialty of 20219
	self:addTradeSkill(RecipeDB, 36955, 330, 30544, 2, 4036, 20219)
	self:addTradeFlags(RecipeDB, 36955, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Fused Wiring -- 39895
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39895, 265, 7191, 1, 4036)
	self:addTradeFlags(RecipeDB, 39895, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39895, 2, 11185, 2, 19661)

	-- Icy Blasting Primers -- 39971
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39971, 325, 32423, 1, 4036)
	self:addTradeFlags(RecipeDB, 39971, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39971, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Frost Grenades -- 39973
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39973, 325, 32413, 1, 4036)
	self:addTradeFlags(RecipeDB, 39973, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Furious Gizmatic Goggles -- 40274
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, SC Class, 
	-- Item Stats: 
	-- Item Stats: val48id1val28id3val1296id6val38id11val38id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40274, 350, 32461, 1, 4036)
	self:addTradeFlags(RecipeDB, 40274, 1,2,3,25,29,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 40274, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Gyro-balanced Khorium Destroyer -- 41307
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Gun, 
	-- Item Stats: 
	-- Item Stats: val27id3val148-275id14val2.8id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41307, 340, 32756, 1, 4036)
	self:addTradeFlags(RecipeDB, 41307, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 41307, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Justicebringer 2000 Specs -- 41311
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, SC Class, 
	-- Item Stats: Healing, 
	-- Item Stats: val29id3val13id4val1296id6val34id19val101id20val39id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41311, 350, 32472, 1, 4036)
	self:addTradeFlags(RecipeDB, 41311, 1,3,25,37,41,47,53,59)
	self:addTradeAcquire(RecipeDB, 41311, 1, 17634, 1, 18775)

	-- Tankatronic Goggles -- 41312
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Plate, SC Class, 
	-- Item Stats: Tanking, 
	-- Item Stats: val67id3val1296id6val22id26val38id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41312, 350, 32473, 1, 4036)
	self:addTradeFlags(RecipeDB, 41312, 1,2,3,25,29,37,41,47,52,59)
	self:addTradeAcquire(RecipeDB, 41312, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Surestrike Goggles v2.0 -- 41314
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, SC Class, 
	-- Item Stats: 
	-- Item Stats: val28id3val726id6val96id9val38id11val96id16val38id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41314, 350, 32474, 1, 4036)
	self:addTradeFlags(RecipeDB, 41314, 1,2,3,23,27,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 41314, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Gadgetstorm Goggles -- 41315
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, SC Class, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val28id3val726id6val60id19val60id20val12id21val40id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41315, 350, 32476, 4, 4036)
	self:addTradeFlags(RecipeDB, 41315, 3,27,37,41,47,54,58)
	-- No acquire information

	-- Living Replicator Specs -- 41316
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Mail, SC Class, 
	-- Item Stats: Healing, 
	-- Item Stats: val14id3val38id4val726id6val39id19val115id20val9id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41316, 350, 32475, 4, 4036)
	self:addTradeFlags(RecipeDB, 41316, 3,27,37,41,47,53,58)
	-- No acquire information

	-- Deathblow X11 Goggles -- 41317
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, SC Class, 
	-- Item Stats: 
	-- Item Stats: val48id2val28id3val326id6val76id9val76id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41317, 350, 32478, 1, 4036)
	self:addTradeFlags(RecipeDB, 41317, 1,2,3,22,28,37,41,47,57)
	self:addTradeAcquire(RecipeDB, 41317, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Wonderheal XT40 Shades -- 41318
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, SC Class, 
	-- Item Stats: Healing, 
	-- Item Stats: val15id3val38id4val22id5val326id6val39id19val115id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41318, 350, 32479, 4, 4036)
	self:addTradeFlags(RecipeDB, 41318, 3,22,37,41,47,53,57)
	-- No acquire information

	-- Magnified Moon Specs -- 41319
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Leather, SC Class, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val22id3val24id4val326id6val55id19val55id20val41id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41319, 350, 32480, 4, 4036)
	self:addTradeFlags(RecipeDB, 41319, 3,22,37,41,47,54,57)
	-- No acquire information

	-- Destruction Holo-gogs -- 41320
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, SC Class, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val22id3val24id4val174id6val69id19val69id20val29id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41320, 350, 32494, 1, 4036)
	self:addTradeFlags(RecipeDB, 41320, 1,2,3,24,26,29,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 41320, 1, 17634, 1, 17637, 1, 18752, 1, 18775, 1, 19576)

	-- Powerheal 4000 Lens -- 41321
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Cloth, SC Class, 
	-- Item Stats: Healing, 
	-- Item Stats: val14id3val38id4val28id5val174id6val37id19val110id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41321, 350, 32495, 4, 4036)
	self:addTradeFlags(RecipeDB, 41321, 3,26,37,41,47,53,56)
	-- No acquire information

	-- Adamantite Arrow Maker -- 43676
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43676, 315, 20475, 2, 4036)
	self:addTradeFlags(RecipeDB, 43676, 11,21,22,23,24,25,26,27,28,29,30,36,41,46)
	self:addTradeAcquire(RecipeDB, 43676, 3, 19707)

	-- Flying Machine -- 44155
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44155, 365, 34060, 3, 4036)
	self:addTradeFlags(RecipeDB, 44155, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Turbo-Charged Flying Machine -- 44157
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44157, 375, 34061, 4, 4036)
	self:addTradeFlags(RecipeDB, 44157, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Field Repair Bot 110G -- 44391
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44391, 350, 34113, 2, 4036)
	self:addTradeFlags(RecipeDB, 44391, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 44391, 3, 23385, 3, 23386)

	-- Wonderheal XT68 Shades -- 46106
	-- Trainer
	-- Flags: Druid, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Healing, 
	-- Item Stats: val33id3val51id4val35id5val405id6val48id19val143id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46106, 350, 35183, 4, 4036)
	self:addTradeFlags(RecipeDB, 46106, 3,22,37,41,47,53,57)
	-- No acquire information

	-- Justicebringer 3000 Specs -- 46107
	-- Trainer
	-- Flags: Paladin, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Healing, 
	-- Item Stats: val48id3val26id4val1611id6val43id19val128id20val52id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46107, 350, 35185, 4, 4036)
	self:addTradeFlags(RecipeDB, 46107, 3,25,37,41,47,53,59)
	-- No acquire information

	-- Powerheal 9000 Lens -- 46108
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: Priest, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val33id3val51id4val41id5val216id6val46id19val137id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46108, 350, 35181, 4, 4036)
	self:addTradeFlags(RecipeDB, 46108, 6,26,37,41,47,53,56)
	self:addTradeAcquire(RecipeDB, 46108, 3, 25367)

	-- Hyper-Magnified Moon Specs -- 46109
	-- Trainer
	-- Flags: Druid, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val40id3val37id4val405id6val69id19val69id20val54id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46109, 350, 35182, 4, 4036)
	self:addTradeFlags(RecipeDB, 46109, 3,22,37,41,47,54,57)
	-- No acquire information

	-- Primal-Attuned Goggles -- 46110
	-- Trainer
	-- Flags: Shaman, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Healing, 
	-- Item Stats: val32id3val51id4val902id6val48id19val143id20val14id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46110, 350, 35184, 4, 4036)
	self:addTradeFlags(RecipeDB, 46110, 3,27,37,41,47,53,58)
	-- No acquire information

	-- Annihilator Holo-Gogs -- 46111
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: Priest, Item BoP, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val41id3val37id4val216id6val86id19val86id20val42id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46111, 350, 34847, 4, 4036)
	self:addTradeFlags(RecipeDB, 46111, 6,11,26,37,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 46111, 3, 25507)

	-- Lightning Etched Specs -- 46112
	-- Trainer
	-- Flags: Shaman, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val47id3val902id6val76id19val76id20val25id21val53id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46112, 350, 34355, 4, 4036)
	self:addTradeFlags(RecipeDB, 46112, 3,27,37,41,47,54,58)
	-- No acquire information

	-- Surestrike Goggles v3.0 -- 46113
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: Hunter, Item BoP, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val47id3val902id6val124id9val51id11val124id16val51id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46113, 350, 34356, 4, 4036)
	self:addTradeFlags(RecipeDB, 46113, 6,11,23,37,41,47,58)
	self:addTradeAcquire(RecipeDB, 46113, 3, 25363)

	-- Mayhem Projection Goggles -- 46114
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: Warrior, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: 
	-- Item Stats: val62id1val47id3val1611id6val51id11val51id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46114, 350, 34354, 4, 4036)
	self:addTradeFlags(RecipeDB, 46114, 6,11,30,37,41,47,59)
	self:addTradeAcquire(RecipeDB, 46114, 3, 25363, 3, 25369)

	-- Hard Khorium Goggles -- 46115
	-- Trainer
	-- Flags: Warrior, Item BoP, Recipe BoP, Armor, Plate, 
	-- Item Stats: Tanking, 
	-- Item Stats: val86id3val1611id6val35id26val51id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46115, 350, 34357, 4, 4036)
	self:addTradeFlags(RecipeDB, 46115, 3,30,37,41,47,52,59)
	-- No acquire information

	-- Quad Deathblow X44 Goggles -- 46116
	-- Trainer
	-- Flags: Rogue, Item BoP, Recipe BoP, Armor, Leather, 
	-- Item Stats: 
	-- Item Stats: val61id2val47id3val405id6val104id9val104id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46116, 350, 34353, 4, 4036)
	self:addTradeFlags(RecipeDB, 46116, 3,28,37,41,47,57)
	-- No acquire information

	-- Rocket Boots Xtreme Lite -- 46697
	-- Instance: 3849 - type5category3territory1expansion1minlevel70nameTempest Keep: The Mechanarid3849
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val105id6val47id19val47id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46697, 345, 35581, 3, 4036)
	self:addTradeFlags(RecipeDB, 46697, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 46697, 3, 19219)

	-- Explosive Triggers -- 53280
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53280, 345, 39684, 1, 4036)
	--self:addTradeFlags(RecipeDB, 53280, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Volatile Blasting Powder -- 53281
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53281, 345, 39690, 1, 4036)
	--self:addTradeFlags(RecipeDB, 53281, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	return recipecount

end
