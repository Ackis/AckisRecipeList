--[[

************************************************************************

ARL-Engineer.lua

Engineering data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
292 found from data mining.
11 ignored.

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
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3918,1,4357,1,4036)
	self:addTradeFlags(RecipeDB,3918,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3918,8,8)

	-- Rough Dynamite -- 3919
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3919,1,4358,1,4036)
	self:addTradeFlags(RecipeDB,3919,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3919,8,8)

	-- Crafted Light Shot -- 3920
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3920,1,8067,1,4036)
	self:addTradeFlags(RecipeDB,3920,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	-- No acquire information

	-- Handful of Copper Bolts -- 3922
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3922,30,4359,1,4036)
	self:addTradeFlags(RecipeDB,3922,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3922,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Rough Copper Bomb -- 3923
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3923,30,4360,1,4036)
	self:addTradeFlags(RecipeDB,3923,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3923,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Copper Tube -- 3924
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3924,50,4361,1,4036)
	self:addTradeFlags(RecipeDB,3924,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3924,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Rough Boomstick -- 3925
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3925,50,4362,1,4036)
	self:addTradeFlags(RecipeDB,3925,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3925,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Copper Modulator -- 3926
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3926,65,4363,1,4036)
	self:addTradeFlags(RecipeDB,3926,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3926,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Mechanical Squirrel -- 3928
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3928,75,4401,2,4036)
	self:addTradeFlags(RecipeDB,3928,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3928,7,2)

	-- Coarse Blasting Powder -- 3929
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3929,75,4364,1,4036)
	self:addTradeFlags(RecipeDB,3929,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3929,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Crafted Heavy Shot -- 3930
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3930,75,8068,1,4036)
	self:addTradeFlags(RecipeDB,3930,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,3930,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Coarse Dynamite -- 3931
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3931,75,4365,1,4036)
	self:addTradeFlags(RecipeDB,3931,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3931,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Target Dummy -- 3932
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3932,85,4366,1,4036)
	self:addTradeFlags(RecipeDB,3932,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3932,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Small Seaforium Charge -- 3933
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3933,100,4367,2,4036)
	self:addTradeFlags(RecipeDB,3933,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3933,7,2)

	-- Flying Tiger Goggles -- 3934
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3934,100,4368,1,4036)
	self:addTradeFlags(RecipeDB,3934,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3934,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Deadly Blunderbuss -- 3936
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3936,105,4369,1,4036)
	self:addTradeFlags(RecipeDB,3936,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3936,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Large Copper Bomb -- 3937
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3937,105,4370,1,4036)
	self:addTradeFlags(RecipeDB,3937,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3937,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Bronze Tube -- 3938
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3938,55,4371,1,4036)
	self:addTradeFlags(RecipeDB,3938,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3938,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Lovingly Crafted Boomstick -- 3939
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3939,120,4372,1,4036)
	self:addTradeFlags(RecipeDB,3939,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3939,2,2682,2,6730)

	-- Shadow Goggles -- 3940
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3940,120,4373,2,4036)
	self:addTradeFlags(RecipeDB,3940,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,3940,7,2)

	-- Small Bronze Bomb -- 3941
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3941,120,4374,1,4036)
	self:addTradeFlags(RecipeDB,3941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3941,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Whirring Bronze Gizmo -- 3942
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3942,75,4375,1,4036)
	self:addTradeFlags(RecipeDB,3942,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3942,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Flame Deflector -- 3944
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3944,125,4376,2,4036)
	self:addTradeFlags(RecipeDB,3944,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3944,3,7800)

	-- Heavy Blasting Powder -- 3945
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3945,105,4377,1,4036)
	self:addTradeFlags(RecipeDB,3945,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3945,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Heavy Dynamite -- 3946
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3946,125,4378,1,4036)
	self:addTradeFlags(RecipeDB,3946,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3946,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Crafted Solid Shot -- 3947
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3947,105,8069,1,4036)
	self:addTradeFlags(RecipeDB,3947,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,3947,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Silver-plated Shotgun -- 3949
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3949,130,4379,1,4036)
	self:addTradeFlags(RecipeDB,3949,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3949,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Big Bronze Bomb -- 3950
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3950,140,4380,1,4036)
	self:addTradeFlags(RecipeDB,3950,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3950,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Minor Recombobulator -- 3952
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3952,140,4381,1,4036)
	self:addTradeFlags(RecipeDB,3952,1,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,3952,2,2683)

	-- Bronze Framework -- 3953
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3953,95,4382,1,4036)
	self:addTradeFlags(RecipeDB,3953,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3953,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Moonsight Rifle -- 3954
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3954,145,4383,2,4036)
	self:addTradeFlags(RecipeDB,3954,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3954,7,2)

	-- Explosive Sheep -- 3955
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3955,150,4384,1,4036)
	self:addTradeFlags(RecipeDB,3955,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3955,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Green Tinted Goggles -- 3956
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3956,150,4385,1,4036)
	self:addTradeFlags(RecipeDB,3956,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3956,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Ice Deflector -- 3957
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3957,155,4386,1,4036)
	self:addTradeFlags(RecipeDB,3957,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3957,2,2684)

	-- Iron Strut -- 3958
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3958,140,4387,1,4036)
	self:addTradeFlags(RecipeDB,3958,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3958,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Discombobulator Ray -- 3959
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3959,160,4388,2,4036)
	self:addTradeFlags(RecipeDB,3959,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3959,3,7800)

	-- Portable Bronze Mortar -- 3960
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3960,165,4403,2,4036)
	self:addTradeFlags(RecipeDB,3960,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3960,7,2)

	-- Gyrochronatom -- 3961
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3961,130,4389,1,4036)
	self:addTradeFlags(RecipeDB,3961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3961,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Iron Grenade -- 3962
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3962,175,4390,1,4036)
	self:addTradeFlags(RecipeDB,3962,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3962,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Compact Harvest Reaper Kit -- 3963
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3963,175,4391,1,4036)
	self:addTradeFlags(RecipeDB,3963,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3963,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Advanced Target Dummy -- 3965
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3965,185,4392,1,4036)
	self:addTradeFlags(RecipeDB,3965,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3965,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Craftsman's Monocle -- 3966
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3966,185,4393,3,4036)
	self:addTradeFlags(RecipeDB,3966,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,3966,3,690,3,2587,3,4852,3,4861,3,7800)

	-- Big Iron Bomb -- 3967
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3967,190,4394,1,4036)
	self:addTradeFlags(RecipeDB,3967,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3967,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Goblin Land Mine -- 3968
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3968,195,4395,2,4036)
	self:addTradeFlags(RecipeDB,3968,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3968,7,2)

	-- Mechanical Dragonling -- 3969
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3969,200,4396,1,4036)
	self:addTradeFlags(RecipeDB,3969,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,3969,2,2687)

	-- Gnomish Cloaking Device -- 3971
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3971,200,4397,1,4036)
	self:addTradeFlags(RecipeDB,3971,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,3971,3,7800,2,6777)

	-- Large Seaforium Charge -- 3972
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3972,200,4398,2,4036)
	self:addTradeFlags(RecipeDB,3972,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3972,7,2)

	-- Silver Contact -- 3973
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3973,80,4404,1,4036)
	self:addTradeFlags(RecipeDB,3973,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3973,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Crude Scope -- 3977
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3977,60,4405,1,4036)
	self:addTradeFlags(RecipeDB,3977,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3977,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Standard Scope -- 3978
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3978,110,4406,1,4036)
	self:addTradeFlags(RecipeDB,3978,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3978,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Accurate Scope -- 3979
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3979,180,4407,1,4036)
	self:addTradeFlags(RecipeDB,3979,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3979,2,2685)

	-- Ornate Spyglass -- 6458
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6458,135,5507,1,4036)
	self:addTradeFlags(RecipeDB,6458,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,6458,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Arclight Spanner -- 7430
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7430,50,6219,1,4036)
	self:addTradeFlags(RecipeDB,7430,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7430,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,1,11029,1,11031,1,11037,1,16667,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Flash Bomb -- 8243
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8243,185,4852,2,4036)
	self:addTradeFlags(RecipeDB,8243,1,2,5,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8243,3,7800,4,1559)

	-- Practice Lock -- 8334
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8334,100,6712,1,4036)
	self:addTradeFlags(RecipeDB,8334,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8334,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- EZ-Thro Dynamite -- 8339
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8339,100,6714,2,4036)
	self:addTradeFlags(RecipeDB,8339,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8339,7,2)

	-- Goblin Rocket Boots -- 8895
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8895,225,7189,1,4036,20222)	self:addTradeFlags(RecipeDB,8895,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,8895,1,8126)

	-- Gnomish Universal Remote -- 9269
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,9269,125,7506,1,4036)
	self:addTradeFlags(RecipeDB,9269,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,9269,3,7800,2,5175,2,6730)

	-- Aquadynamic Fish Attractor -- 9271
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,9271,100,6533,1,4036)
	self:addTradeFlags(RecipeDB,9271,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9271,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Goblin Jumper Cables -- 9273
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,9273,165,7148,1,4036)
	self:addTradeFlags(RecipeDB,9273,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,9273,3,7800,2,3134,2,3537,2,4086)

	-- Gold Power Core -- 12584
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12584,110,10558,1,4036)
	self:addTradeFlags(RecipeDB,12584,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12584,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16667,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Solid Blasting Powder -- 12585
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12585,155,10505,1,4036)
	self:addTradeFlags(RecipeDB,12585,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12585,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Solid Dynamite -- 12586
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12586,175,10507,1,4036)
	self:addTradeFlags(RecipeDB,12586,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12586,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Bright-Eye Goggles -- 12587
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12587,175,10499,2,4036)
	self:addTradeFlags(RecipeDB,12587,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12587,7,2)

	-- Mithril Tube -- 12589
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12589,155,10559,1,4036)
	self:addTradeFlags(RecipeDB,12589,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12589,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Gyromatic Micro-Adjustor -- 12590
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12590,135,10498,1,4036)
	self:addTradeFlags(RecipeDB,12590,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12590,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Unstable Trigger -- 12591
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12591,160,10560,1,4036)
	self:addTradeFlags(RecipeDB,12591,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12591,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Fire Goggles -- 12594
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12594,205,10500,1,4036)
	self:addTradeFlags(RecipeDB,12594,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12594,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Mithril Blunderbuss -- 12595
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12595,205,10508,1,4036)
	self:addTradeFlags(RecipeDB,12595,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12595,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Hi-Impact Mithril Slugs -- 12596
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12596,170,10512,1,4036)
	self:addTradeFlags(RecipeDB,12596,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,12596,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Deadly Scope -- 12597
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12597,210,10546,1,4036)
	self:addTradeFlags(RecipeDB,12597,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12597,2,8679,2,9544)

	-- Mithril Casing -- 12599
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12599,175,10561,1,4036)
	self:addTradeFlags(RecipeDB,12599,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12599,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Mithril Frag Bomb -- 12603
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12603,205,10514,1,4036)
	self:addTradeFlags(RecipeDB,12603,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12603,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Catseye Ultra Goggles -- 12607
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12607,220,10501,2,4036)
	self:addTradeFlags(RecipeDB,12607,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12607,7,2)

	-- Mithril Heavy-bore Rifle -- 12614
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12614,220,10510,2,4036)
	self:addTradeFlags(RecipeDB,12614,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,12614,7,2)

	-- Spellpower Goggles Xtreme -- 12615
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12615,225,10502,3,4036)
	self:addTradeFlags(RecipeDB,12615,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12615,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Parachute Cloak -- 12616
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12616,225,10518,2,4036)
	self:addTradeFlags(RecipeDB,12616,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,12616,7,2)

	-- Deepdive Helmet -- 12617
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12617,230,10506,1,4036)
	self:addTradeFlags(RecipeDB,12617,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12617,2,8678)

	-- Rose Colored Goggles -- 12618
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12618,230,10503,1,4036)
	self:addTradeFlags(RecipeDB,12618,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12618,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Hi-Explosive Bomb -- 12619
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12619,235,10562,1,4036)
	self:addTradeFlags(RecipeDB,12619,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12619,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Sniper Scope -- 12620
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12620,240,10548,3,4036)
	self:addTradeFlags(RecipeDB,12620,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12620,3,1488,3,5267,3,5460,3,5714,3,5717,3,10184)

	-- Mithril Gyro-Shot -- 12621
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12621,205,10513,1,4036)
	self:addTradeFlags(RecipeDB,12621,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,12621,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Green Lens -- 12622
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12622,245,10504,1,4036)
	self:addTradeFlags(RecipeDB,12622,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12622,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Mithril Mechanical Dragonling -- 12624
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12624,250,10576,1,4036)
	self:addTradeFlags(RecipeDB,12624,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,12624,2,2688)

	-- Goblin Rocket Fuel Recipe -- 12715
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12715,210,10644,1,4036,20222)	self:addTradeFlags(RecipeDB,12715,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12715,1,8126)

	-- Goblin Mortar -- 12716
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12716,205,10577,1,4036,20222)	self:addTradeFlags(RecipeDB,12716,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12716,1,8126)

	-- Goblin Mining Helmet -- 12717
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12717,205,10542,1,4036,20222)	self:addTradeFlags(RecipeDB,12717,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,12717,1,8126)

	-- Goblin Construction Helmet -- 12718
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12718,205,10543,1,4036,20222)	self:addTradeFlags(RecipeDB,12718,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,12718,1,8126)

	-- Goblin \"Boom\" Box -- 12720
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12720,215,10580,1,4036)
	--self:addTradeFlags(RecipeDB,12720,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Goblin Radio -- 12722
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12722,220,10585,1,4036)
	--self:addTradeFlags(RecipeDB,12722,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- The Big One -- 12754
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12754,225,10586,1,4036,20222)	self:addTradeFlags(RecipeDB,12754,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12754,1,8126,1,8738)

	-- Goblin Bomb Dispenser -- 12755
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12755,230,10587,1,4036,20222)	self:addTradeFlags(RecipeDB,12755,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12755,1,8126,1,8738)

	-- Goblin Rocket Helmet -- 12758
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12758,235,10588,1,4036,20222)	self:addTradeFlags(RecipeDB,12758,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12758,1,8126,1,8738)

	-- Gnomish Death Ray -- 12759
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12759,240,10645,1,4036,20219)	self:addTradeFlags(RecipeDB,12759,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12759,1,7406,1,7944)

	-- Goblin Sapper Charge -- 12760
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12760,205,10646,1,4036,20222)	self:addTradeFlags(RecipeDB,12760,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12760,1,8126)

	-- Inlaid Mithril Cylinder Plans -- 12895
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12895,200,10713,1,4036,20219)	self:addTradeFlags(RecipeDB,12895,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Goggles -- 12897
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12897,210,10545,1,4036,20219)	self:addTradeFlags(RecipeDB,12897,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,12897,1,7406,1,7944)

	-- Gnomish Shrink Ray -- 12899
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12899,205,10716,1,4036,20219)	self:addTradeFlags(RecipeDB,12899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12899,1,7406,1,7944)

	-- Mobile Alarm -- 12900
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12900,205,10719,1,4036)
	--self:addTradeFlags(RecipeDB,12900,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Net-o-Matic Projector -- 12902
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12902,210,10720,1,4036,20219)	self:addTradeFlags(RecipeDB,12902,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12902,1,7406,1,7944)

	-- Gnomish Harm Prevention Belt -- 12903
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12903,215,10721,1,4036,20219)	self:addTradeFlags(RecipeDB,12903,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,12903,1,7406,1,7944)

	-- Gnomish Ham Radio -- 12904
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,12904,220,10723,1,4036)
	--self:addTradeFlags(RecipeDB,12904,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Gnomish Rocket Boots -- 12905
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12905,225,10724,1,4036,20219)	self:addTradeFlags(RecipeDB,12905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12905,1,7406,1,7944)

	-- Gnomish Battle Chicken -- 12906
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12906,230,10725,1,4036,20219)	self:addTradeFlags(RecipeDB,12906,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12906,1,7406,1,7944)

	-- Gnomish Mind Control Cap -- 12907
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12907,215,10726,1,4036,20219)	self:addTradeFlags(RecipeDB,12907,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12907,1,7406,1,7944)

	-- Goblin Dragon Gun -- 12908
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12908,240,10727,1,4036,20222)	self:addTradeFlags(RecipeDB,12908,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12908,1,8126,1,8738)

	-- The Mortar: Reloaded -- 13240
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13240,205,10577,1,4036,20222)	self:addTradeFlags(RecipeDB,13240,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Mechanical Repair Kit -- 15255
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,15255,200,11590,1,4036)
	self:addTradeFlags(RecipeDB,15255,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,15255,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Pet Bombling -- 15628
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,15628,205,11825,2,4036,20222)	self:addTradeFlags(RecipeDB,15628,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Lil' Smoky -- 15633
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,15633,205,11826,2,4036,20219)	self:addTradeFlags(RecipeDB,15633,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Salt Shaker -- 19567
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19567,250,15846,1,4036)
	self:addTradeFlags(RecipeDB,19567,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19567,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Dense Blasting Powder -- 19788
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19788,240,15992,1,4036)
	self:addTradeFlags(RecipeDB,19788,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19788,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Thorium Grenade -- 19790
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19790,260,15993,1,4036)
	self:addTradeFlags(RecipeDB,19790,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19790,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Thorium Widget -- 19791
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19791,260,15994,1,4036)
	self:addTradeFlags(RecipeDB,19791,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19791,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Thorium Rifle -- 19792
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19792,260,15995,2,4036)
	self:addTradeFlags(RecipeDB,19792,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19792,3,12397,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Lifelike Mechanical Toad -- 19793
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19793,265,15996,2,4036)
	self:addTradeFlags(RecipeDB,19793,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19793,3,2644,3,10043,3,10184)

	-- Spellpower Goggles Xtreme Plus -- 19794
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19794,270,15999,2,4036)
	self:addTradeFlags(RecipeDB,19794,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,19794,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Thorium Tube -- 19795
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19795,275,16000,1,4036)
	self:addTradeFlags(RecipeDB,19795,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19795,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Dark Iron Rifle -- 19796
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19796,275,16004,2,4036)
	self:addTradeFlags(RecipeDB,19796,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19796,3,8897)

	-- Dark Iron Bomb -- 19799
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19799,285,16005,2,4036)
	self:addTradeFlags(RecipeDB,19799,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19799,3,8920)

	-- Thorium Shells -- 19800
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19800,285,15997,2,4036)
	self:addTradeFlags(RecipeDB,19800,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,78)
	self:addTradeAcquire(RecipeDB,19800,3,13147,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Masterwork Target Dummy -- 19814
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19814,275,16023,1,4036)
	self:addTradeFlags(RecipeDB,19814,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19814,2,11185)

	-- Delicate Arcanite Converter -- 19815
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19815,285,16006,1,4036)
	self:addTradeFlags(RecipeDB,19815,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19815,2,11185)

	-- Voice Amplification Modulator -- 19819
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19819,290,16009,2,4036)
	self:addTradeFlags(RecipeDB,19819,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19819,3,10426)

	-- Master Engineer's Goggles -- 19825
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19825,290,16008,2,4036)
	self:addTradeFlags(RecipeDB,19825,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,19825,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Arcanite Dragonling -- 19830
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19830,300,16022,2,4036)
	self:addTradeFlags(RecipeDB,19830,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19830,3,7436,3,7437)

	-- Arcane Bomb -- 19831
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19831,300,16040,2,4036)
	self:addTradeFlags(RecipeDB,19831,21,22,23,24,25,26,27,28,29,30,36,40)
	-- No acquire information

	-- Flawless Arcanite Rifle -- 19833
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19833,300,16007,2,4036)
	self:addTradeFlags(RecipeDB,19833,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19833,3,8561)

	-- SnowMaster 9000 -- 21940
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,21940,190,17716,2,4036)
	self:addTradeFlags(RecipeDB,21940,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21940,5,1)

	-- Field Repair Bot 74A -- 22704
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22704,300,18232,1,4036)
	self:addTradeFlags(RecipeDB,22704,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Biznicks 247x128 Accurascope -- 22793
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22793,300,18283,3,4036)
	self:addTradeFlags(RecipeDB,22793,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22793,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Core Marksman Rifle -- 22795
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22795,300,18282,3,4036)
	self:addTradeFlags(RecipeDB,22795,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,22795,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Force Reactive Disk -- 22797
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22797,300,18168,3,4036)
	self:addTradeFlags(RecipeDB,22797,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,64)
	self:addTradeAcquire(RecipeDB,22797,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Red Firework -- 23066
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23066,150,9318,1,4036)
	self:addTradeFlags(RecipeDB,23066,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23066,2,3413)

	-- Blue Firework -- 23067
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23067,150,9312,1,4036)
	self:addTradeFlags(RecipeDB,23067,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23067,2,1304,2,5175)

	-- Green Firework -- 23068
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23068,150,9313,1,4036)
	self:addTradeFlags(RecipeDB,23068,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23068,2,2838,2,3495)

	-- EZ-Thro Dynamite II -- 23069
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23069,200,18588,1,4036)
	self:addTradeFlags(RecipeDB,23069,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23069,2,8131)

	-- Dense Dynamite -- 23070
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23070,250,18641,1,4036)
	self:addTradeFlags(RecipeDB,23070,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,23070,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Truesilver Transformer -- 23071
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23071,260,18631,1,4036)
	self:addTradeFlags(RecipeDB,23071,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23071,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Gyrofreeze Ice Reflector -- 23077
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23077,260,18634,1,4036)
	self:addTradeFlags(RecipeDB,23077,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23077,2,11185)

	-- Goblin Jumper Cables XL -- 23078
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23078,265,18587,2,4036,20222)	self:addTradeFlags(RecipeDB,23078,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23078,3,9499)

	-- Major Recombobulator -- 23079
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23079,275,18637,2,4036)
	self:addTradeFlags(RecipeDB,23079,21,22,23,24,25,26,27,28,29,30,36,40,63)
	-- No acquire information

	-- Powerful Seaforium Charge -- 23080
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23080,275,18594,1,4036)
	self:addTradeFlags(RecipeDB,23080,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23080,2,11185)

	-- Hyper-Radiant Flame Reflector -- 23081
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23081,290,18638,2,4036)
	self:addTradeFlags(RecipeDB,23081,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23081,3,10264)

	-- Ultra-Flash Shadow Reflector -- 23082
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23082,300,18639,2,4036)
	self:addTradeFlags(RecipeDB,23082,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23082,3,10426)

	-- Alarm-O-Bot -- 23096
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23096,265,18645,2,4036,20219)	self:addTradeFlags(RecipeDB,23096,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23096,3,8920)

	-- World Enlarger -- 23129
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23129,260,18660,2,4036,20219)	self:addTradeFlags(RecipeDB,23129,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23129,3,8920)

	-- Dimensional Ripper - Everlook -- 23486
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23486,260,18984,2,4036,20222)	self:addTradeFlags(RecipeDB,23486,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Ultrasafe Transporter - Gadgetzan -- 23489
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23489,260,18986,2,4036,20219)	self:addTradeFlags(RecipeDB,23489,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Snake Burst Firework -- 23507
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23507,250,19026,1,4036)
	self:addTradeFlags(RecipeDB,23507,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,23507,2,14637)

	-- Bloodvine Goggles -- 24356
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24356,300,19999,1,4036)
	self:addTradeFlags(RecipeDB,24356,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,100)
	self:addTradeAcquire(RecipeDB,24356,6,270,2,14921)

	-- Bloodvine Lens -- 24357
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24357,300,19998,1,4036)
	self:addTradeFlags(RecipeDB,24357,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24357,6,270,1,14921)

	-- Tranquil Mechanical Yeti -- 26011
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26011,300,21277,1,4036)
	self:addTradeFlags(RecipeDB,26011,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Small Blue Rocket -- 26416
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26416,125,21558,2,4036)
	self:addTradeFlags(RecipeDB,26416,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26416,5,2)

	-- Small Green Rocket -- 26417
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26417,125,21559,2,4036)
	self:addTradeFlags(RecipeDB,26417,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26417,5,2)

	-- Small Red Rocket -- 26418
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26418,125,21557,2,4036)
	self:addTradeFlags(RecipeDB,26418,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26418,5,2)

	-- Large Blue Rocket -- 26420
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26420,175,21589,2,4036)
	self:addTradeFlags(RecipeDB,26420,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26420,5,2)

	-- Large Green Rocket -- 26421
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26421,175,21590,2,4036)
	self:addTradeFlags(RecipeDB,26421,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26421,5,2)

	-- Large Red Rocket -- 26422
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26422,175,21592,2,4036)
	self:addTradeFlags(RecipeDB,26422,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26422,5,2)

	-- Blue Rocket Cluster -- 26423
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26423,225,21571,2,4036)
	self:addTradeFlags(RecipeDB,26423,3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26423,5,2)

	-- Green Rocket Cluster -- 26424
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26424,225,21574,2,4036)
	self:addTradeFlags(RecipeDB,26424,3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26424,5,2)

	-- Red Rocket Cluster -- 26425
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26425,225,21576,2,4036)
	self:addTradeFlags(RecipeDB,26425,3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26425,5,2)

	-- Large Blue Rocket Cluster -- 26426
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26426,275,21714,2,4036)
	self:addTradeFlags(RecipeDB,26426,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26426,5,2)

	-- Large Green Rocket Cluster -- 26427
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26427,275,21716,2,4036)
	self:addTradeFlags(RecipeDB,26427,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26427,5,2)

	-- Large Red Rocket Cluster -- 26428
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26428,275,21718,2,4036)
	self:addTradeFlags(RecipeDB,26428,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26428,5,2)

	-- Firework Launcher -- 26442
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26442,225,21569,2,4036)
	self:addTradeFlags(RecipeDB,26442,7,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26442,5,2,4,8877)

	-- Firework Cluster Launcher -- 26443
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26443,275,21570,2,4036)
	self:addTradeFlags(RecipeDB,26443,7,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26443,5,2,4,8882)

	-- Steam Tonk Controller -- 28327
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28327,275,22728,1,4036)
	self:addTradeFlags(RecipeDB,28327,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28327,4,9249,2,3413,2,5175)

	-- Elemental Blasting Powder -- 30303
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30303,280,23781,1,4036)
	self:addTradeFlags(RecipeDB,30303,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30303,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Fel Iron Casing -- 30304
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30304,280,23782,1,4036)
	self:addTradeFlags(RecipeDB,30304,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30304,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Handful of Fel Iron Bolts -- 30305
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30305,290,23783,1,4036)
	self:addTradeFlags(RecipeDB,30305,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30305,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Adamantite Frame -- 30306
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30306,315,23784,1,4036)
	self:addTradeFlags(RecipeDB,30306,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30306,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Hardened Adamantite Tube -- 30307
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30307,330,23785,1,4036)
	self:addTradeFlags(RecipeDB,30307,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30307,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Khorium Power Core -- 30308
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30308,330,23786,1,4036)
	self:addTradeFlags(RecipeDB,30308,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30308,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Felsteel Stabilizer -- 30309
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30309,330,23787,1,4036)
	self:addTradeFlags(RecipeDB,30309,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30309,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Fel Iron Bomb -- 30310
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30310,300,23736,1,4036)
	self:addTradeFlags(RecipeDB,30310,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30310,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Adamantite Grenade -- 30311
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30311,325,23737,1,4036)
	self:addTradeFlags(RecipeDB,30311,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30311,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Fel Iron Musket -- 30312
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30312,310,23742,1,4036)
	self:addTradeFlags(RecipeDB,30312,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30312,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Adamantite Rifle -- 30313
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30313,350,23746,1,4036)
	self:addTradeFlags(RecipeDB,30313,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,30313,2,16657,2,16782,2,19661)

	-- Felsteel Boomstick -- 30314
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30314,360,23747,3,4036)
	self:addTradeFlags(RecipeDB,30314,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,30314,3,19960)

	-- Ornate Khorium Rifle -- 30315
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30315,375,23748,3,4036)
	self:addTradeFlags(RecipeDB,30315,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,30315,7,3)

	-- Cogspinner Goggles -- 30316
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30316,340,23758,1,4036)
	self:addTradeFlags(RecipeDB,30316,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,30316,2,18775,2,19836)

	-- Power Amplification Goggles -- 30317
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30317,340,23761,3,4036)
	self:addTradeFlags(RecipeDB,30317,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,30317,7,3)

	-- Ultra-Spectropic Detection Goggles -- 30318
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30318,350,23762,1,4036)
	self:addTradeFlags(RecipeDB,30318,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,30318,2,18775,2,19383)

	-- Hyper-Vision Goggles -- 30325
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30325,360,23763,3,4036)
	self:addTradeFlags(RecipeDB,30325,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,30325,3,19755)

	-- Adamantite Scope -- 30329
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30329,335,23764,1,4036)
	self:addTradeFlags(RecipeDB,30329,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30329,2,19351,2,19836)

	-- Khorium Scope -- 30332
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30332,360,23765,3,4036)
	self:addTradeFlags(RecipeDB,30332,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30332,3,20207)

	-- Stabilized Eternium Scope -- 30334
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30334,375,23766,3,4036)
	self:addTradeFlags(RecipeDB,30334,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30334,3,16151,3,16152)

	-- Crashin' Thrashin' Robot -- 30337
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30337,325,23767,2,4036)
	self:addTradeFlags(RecipeDB,30337,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30337,7,2)

	-- White Smoke Flare -- 30341
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30341,335,23768,1,4036)
	self:addTradeFlags(RecipeDB,30341,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30341,2,16657,2,16782,2,18484,2,19383)

	-- Red Smoke Flare -- 30342
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,30342,315,23769,1,4036)
	--self:addTradeFlags(RecipeDB,30342,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Blue Smoke Flare -- 30343
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,30343,315,23770,1,4036)
	--self:addTradeFlags(RecipeDB,30343,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Green Smoke Flare -- 30344
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30344,335,23771,1,4036)
	self:addTradeFlags(RecipeDB,30344,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,30344,6,942,1,17904)

	-- Fel Iron Shells -- 30346
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30346,290,23772,1,4036)
	self:addTradeFlags(RecipeDB,30346,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,30346,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Adamantite Shell Machine -- 30347
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30347,335,34504,1,4036)
	self:addTradeFlags(RecipeDB,30347,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,78)
	self:addTradeAcquire(RecipeDB,30347,2,16657,2,16782,2,18484)

	-- Fel Iron Toolbox -- 30348
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30348,325,23774,1,4036)
	self:addTradeFlags(RecipeDB,30348,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30348,2,16657,2,16782,2,18484)

	-- Khorium Toolbox -- 30349
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,30349,340,23775,3,4036)
	--self:addTradeFlags(RecipeDB,30349,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elemental Seaforium Charge -- 30547
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30547,350,23819,1,4036)
	self:addTradeFlags(RecipeDB,30547,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB,30547,6,933,3,20242,6,933,3,23007)

	-- Zapthrottle Mote Extractor -- 30548
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30548,305,23821,1,4036)
	self:addTradeFlags(RecipeDB,30548,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30548,4,9635,4,9636)

	-- Critter Enlarger -- 30549
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,30549,325,23820,2,4036)
	--self:addTradeFlags(RecipeDB,30549,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Healing Potion Injector -- 30551
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30551,330,33092,3,4036)
	self:addTradeFlags(RecipeDB,30551,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30551,7,3)

	-- Mana Potion Injector -- 30552
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30552,345,33093,3,4036)
	self:addTradeFlags(RecipeDB,30552,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30552,7,3)

	-- Rocket Boots Xtreme -- 30556
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30556,355,23824,3,4036)
	self:addTradeFlags(RecipeDB,30556,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,30556,3,17796)

	-- The Bigger One -- 30558
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30558,325,23826,1,4036,20222)	self:addTradeFlags(RecipeDB,30558,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30558,1,8126,1,8738)

	-- Super Sapper Charge -- 30560
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30560,340,23827,1,4036,20222)	self:addTradeFlags(RecipeDB,30560,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30560,1,8126,1,8738)

	-- Goblin Tonk Controller -- 30561
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,30561,315,23831,1,4036)
	--self:addTradeFlags(RecipeDB,30561,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Goblin Rocket Launcher -- 30563
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30563,350,23836,1,4036,20222)	self:addTradeFlags(RecipeDB,30563,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,30563,1,8126,1,8738)

	-- Foreman's Enchanted Helmet -- 30565
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30565,350,23838,1,4036,20222)	self:addTradeFlags(RecipeDB,30565,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,30565,1,8126,1,8738)

	-- Foreman's Reinforced Helmet -- 30566
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30566,350,23839,1,4036,20222)	self:addTradeFlags(RecipeDB,30566,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,30566,1,8126,1,8738)

	-- Gnomish Flame Turret -- 30568
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30568,325,23841,1,4036,20219)	self:addTradeFlags(RecipeDB,30568,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30568,1,7406,1,7944)

	-- Gnomish Poultryizer -- 30569
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30569,340,23835,1,4036,20219)	self:addTradeFlags(RecipeDB,30569,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,30569,1,7406,1,7944)

	-- Nigh-Invulnerability Belt -- 30570
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30570,350,23825,1,4036,20219)	self:addTradeFlags(RecipeDB,30570,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,30570,1,7406,1,7944)

	-- Gnomish Tonk Controller -- 30573
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,30573,315,23832,1,4036)
	--self:addTradeFlags(RecipeDB,30573,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Power Goggles -- 30574
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30574,375,23828,1,4036,20219)	self:addTradeFlags(RecipeDB,30574,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,30574,1,7406,1,7944)

	-- Gnomish Battle Goggles -- 30575
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,30575,375,23829,1,4036,20219)	self:addTradeFlags(RecipeDB,30575,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,30575,1,7406,1,7944)

	-- Purple Smoke Flare -- 32814
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32814,335,25886,2,4036)
	self:addTradeFlags(RecipeDB,32814,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,32814,7,2)

	-- Dimensional Ripper - Area 52 -- 36954
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36954,350,30542,2,4036,20222)	self:addTradeFlags(RecipeDB,36954,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Ultrasafe Transporter - Toshley's Station -- 36955
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,36955,350,30544,2,4036,20219)	self:addTradeFlags(RecipeDB,36955,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Fused Wiring -- 39895
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39895,275,7191,1,4036)
	self:addTradeFlags(RecipeDB,39895,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,39895,2,11185,2,19661)

	-- Icy Blasting Primers -- 39971
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39971,325,32423,1,4036)
	self:addTradeFlags(RecipeDB,39971,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39971,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Frost Grenades -- 39973
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39973,325,32413,1,4036)
	self:addTradeFlags(RecipeDB,39973,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Furious Gizmatic Goggles -- 40274
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,40274,350,32461,1,4036)
	self:addTradeFlags(RecipeDB,40274,1,2,3,25,30,37,41,59)
	self:addTradeAcquire(RecipeDB,40274,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Gyro-balanced Khorium Destroyer -- 41307
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41307,340,32756,1,4036)
	self:addTradeFlags(RecipeDB,41307,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41307,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Justicebringer 2000 Specs -- 41311
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41311,350,32472,1,4036)
	self:addTradeFlags(RecipeDB,41311,1,2,3,25,37,41,59)
	self:addTradeAcquire(RecipeDB,41311,1,17634,1,18775)

	-- Tankatronic Goggles -- 41312
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41312,350,32473,1,4036)
	self:addTradeFlags(RecipeDB,41312,1,2,3,25,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,41312,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Surestrike Goggles v2.0 -- 41314
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41314,350,32474,1,4036)
	self:addTradeFlags(RecipeDB,41314,1,2,3,23,27,37,41,58)
	self:addTradeAcquire(RecipeDB,41314,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Gadgetstorm Goggles -- 41315
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41315,350,32476,4,4036)
	self:addTradeFlags(RecipeDB,41315,3,27,37,41,58)
	-- No acquire information

	-- Living Replicator Specs -- 41316
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41316,350,32475,4,4036)
	self:addTradeFlags(RecipeDB,41316,3,27,37,41,58)
	-- No acquire information

	-- Deathblow X11 Goggles -- 41317
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41317,350,32478,1,4036)
	self:addTradeFlags(RecipeDB,41317,1,2,3,22,28,37,41,57)
	self:addTradeAcquire(RecipeDB,41317,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Wonderheal XT40 Shades -- 41318
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41318,350,32479,4,4036)
	self:addTradeFlags(RecipeDB,41318,3,22,37,41,57)
	-- No acquire information

	-- Magnified Moon Specs -- 41319
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41319,350,32480,4,4036)
	self:addTradeFlags(RecipeDB,41319,3,22,37,41,57)
	-- No acquire information

	-- Destruction Holo-gogs -- 41320
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41320,350,32494,1,4036)
	self:addTradeFlags(RecipeDB,41320,1,2,3,24,26,29,37,41,56)
	self:addTradeAcquire(RecipeDB,41320,1,17634,1,17637,1,18752,1,18775,1,19576)

	-- Powerheal 4000 Lens -- 41321
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41321,350,32495,4,4036)
	self:addTradeFlags(RecipeDB,41321,3,26,37,41,56)
	-- No acquire information

	-- Adamantite Arrow Maker -- 43676
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,43676,335,20475,2,4036)
	self:addTradeFlags(RecipeDB,43676,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43676,3,19707)

	-- Flying Machine -- 44155
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44155,350,34060,3,4036,34090)	self:addTradeFlags(RecipeDB,44155,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Turbo-Charged Flying Machine -- 44157
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44157,375,34061,4,4036,34091)	self:addTradeFlags(RecipeDB,44157,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Field Repair Bot 110G -- 44391
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44391,360,34113,2,4036)
	self:addTradeFlags(RecipeDB,44391,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44391,3,23385)

	-- Wonderheal XT68 Shades -- 46106
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46106,375,35183,4,4036)
	self:addTradeFlags(RecipeDB,46106,1,2,11,22,37,41,57)
	self:addTradeAcquire(RecipeDB,46106,3,25368,3,25371)

	-- Justicebringer 3000 Specs -- 46107
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46107,375,35185,4,4036)
	self:addTradeFlags(RecipeDB,46107,1,2,11,25,37,41,59)
	self:addTradeAcquire(RecipeDB,46107,3,25370,3,25507)

	-- Powerheal 9000 Lens -- 46108
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46108,375,35181,4,4036)
	self:addTradeFlags(RecipeDB,46108,1,2,11,26,37,41,56)
	self:addTradeAcquire(RecipeDB,46108,3,25363,3,25368,3,25370)

	-- Hyper-Magnified Moon Specs -- 46109
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46109,375,35182,4,4036)
	self:addTradeFlags(RecipeDB,46109,1,2,11,22,37,41,57)
	self:addTradeAcquire(RecipeDB,46109,3,25369,3,25484,3,25507)

	-- Primal-Attuned Goggles -- 46110
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46110,375,35184,4,4036)
	self:addTradeFlags(RecipeDB,46110,1,2,11,27,37,41,58)
	self:addTradeAcquire(RecipeDB,46110,3,25369,3,25371,3,25507)

	-- Annihilator Holo-Gogs -- 46111
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46111,375,34847,4,4036)
	self:addTradeFlags(RecipeDB,46111,1,2,11,26,37,41,56)
	self:addTradeAcquire(RecipeDB,46111,3,25368,3,25370)

	-- Lightning Etched Specs -- 46112
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46112,375,34355,4,4036)
	self:addTradeFlags(RecipeDB,46112,1,2,11,27,37,41,58)
	self:addTradeAcquire(RecipeDB,46112,3,25367,3,25368,3,25369,3,25370,3,25371)

	-- Surestrike Goggles v3.0 -- 46113
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46113,375,34356,4,4036)
	self:addTradeFlags(RecipeDB,46113,1,2,11,23,37,41,58)
	self:addTradeAcquire(RecipeDB,46113,3,25367,3,25369,3,25370,3,25371,3,25507)

	-- Mayhem Projection Goggles -- 46114
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46114,375,34354,4,4036)
	self:addTradeFlags(RecipeDB,46114,1,2,11,30,37,41,59)
	self:addTradeAcquire(RecipeDB,46114,3,25369,3,25507,3,25592)

	-- Hard Khorium Goggles -- 46115
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46115,375,34357,4,4036)
	self:addTradeFlags(RecipeDB,46115,1,2,11,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,46115,3,25363,3,25371)

	-- Quad Deathblow X44 Goggles -- 46116
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46116,375,34353,4,4036)
	self:addTradeFlags(RecipeDB,46116,1,2,11,28,37,41,57)
	self:addTradeAcquire(RecipeDB,46116,3,25367,3,25369,3,25599)

	-- Rocket Boots Xtreme Lite -- 46697
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46697,355,35581,3,4036)
	self:addTradeFlags(RecipeDB,46697,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,46697,3,19219)

	-- Volatile Blasting Trigger -- 53281
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53281,347,39690,1,4036)
	self:addTradeFlags(RecipeDB,53281,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mark \"S\" Boomstick -- 54353
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54353,395,39688,3,4036)
	self:addTradeFlags(RecipeDB,54353,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	-- No acquire information

	-- Personal Electromagnetic Pulse Generator -- 54736
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54736,385,nil, 1, 4036)
	self:addTradeFlags(RecipeDB,54736,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Belt-Clipped Spynoculars -- 54793
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54793,375,nil, 1, 4036)
	self:addTradeFlags(RecipeDB,54793,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Hand-Mounted Pyro Rocket -- 54998
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54998,395,nil, 1, 4036)
	self:addTradeFlags(RecipeDB,54998,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Hyperspeed Accelerators -- 54999
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54999,395,nil, 1, 4036)
	self:addTradeFlags(RecipeDB,54999,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flexweave Underlay -- 55002
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55002,375,nil, 1, 4036)
	self:addTradeFlags(RecipeDB,55002,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Nitro Boosts -- 55016
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55016,390,nil, 1, 4036)
	self:addTradeFlags(RecipeDB,55016,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scrapbot Construction Kit -- 55252
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55252,425,40769,1, 4036)
	self:addTradeFlags(RecipeDB,55252,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Handful of Cobalt Bolts -- 56349
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56349,340,39681,1,4036)
	self:addTradeFlags(RecipeDB,56349,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Hammer Pick -- 56459
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56459,370,40892,1,4036)
	self:addTradeFlags(RecipeDB,56459,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Cobalt Frag Bomb -- 56460
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56460,330,40771,1,4036)
	self:addTradeFlags(RecipeDB,56460,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bladed Pickaxe -- 56461
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56461,370,40893,1,4036)
	self:addTradeFlags(RecipeDB,56461,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Army Knife -- 56462
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56462,430,40772,1,4036)
	self:addTradeFlags(RecipeDB,56462,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Explosive Decoy -- 56463
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56463,350,40536,1,4036)
	self:addTradeFlags(RecipeDB,56463,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Overcharged Capacitor -- 56464
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56464,370,39682,1,4036)
	self:addTradeFlags(RecipeDB,56464,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sonic Booster -- 56466
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56466,390,40767,3,4036)
	self:addTradeFlags(RecipeDB,56466,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Noise Machine -- 56467
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56467,390,40865,3,4036)
	self:addTradeFlags(RecipeDB,56467,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Saronite Bomb -- 56468
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56468,350,41119,1,4036)
	self:addTradeFlags(RecipeDB,56468,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish Lightning Generator -- 56469
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56469,420,41121,3,4036)
	self:addTradeFlags(RecipeDB,56469,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	-- No acquire information

	-- Sun Scope -- 56470
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56470,425,41146,3,4036)
	self:addTradeFlags(RecipeDB,56470,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Froststeel Tube -- 56471
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56471,385,39683,1,4036)
	self:addTradeFlags(RecipeDB,56471,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- MOLL-E -- 56472
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56472,425,40768,1,4036)
	self:addTradeFlags(RecipeDB,56472,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Gnomish X-Ray Specs -- 56473
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56473,350,40895,3,4036,20219)	self:addTradeFlags(RecipeDB,56473,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Ultrasafe Bullet Machine -- 56474
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56474,410,44507,1, 4036)
	self:addTradeFlags(RecipeDB,56474,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	-- No acquire information

	-- Saronite Arrow Maker -- 56475
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56475,415,44506,1, 4036)
	self:addTradeFlags(RecipeDB,56475,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Healing Injector Kit -- 56476
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56476,405,37567,1,4036)
	self:addTradeFlags(RecipeDB,56476,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mana Injector Kit -- 56477
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56477,410,42546,1,4036)
	self:addTradeFlags(RecipeDB,56477,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Heartseeker Scope -- 56478
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56478,415,41167,3,4036)
	self:addTradeFlags(RecipeDB,56478,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Armor Plated Combat Shotgun -- 56479
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56479,445,41168,4,4036)
	self:addTradeFlags(RecipeDB,56479,3,21,22,23,24,25,26,27,28,29,30,36,41,52,63)
	-- No acquire information

	-- Armored Titanium Goggles -- 56480
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56480,400,42549,3,4036)
	self:addTradeFlags(RecipeDB,56480,3,21,22,23,24,25,26,27,28,29,30,37,41,52,59)
	-- No acquire information

	-- Weakness Spectralizers -- 56481
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56481,400,42550,3,4036)
	self:addTradeFlags(RecipeDB,56481,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	-- No acquire information

	-- Charged Titanium Specs -- 56483
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56483,400,42552,3,4036)
	self:addTradeFlags(RecipeDB,56483,3,21,22,23,24,25,26,27,28,29,30,37,41,59)
	-- No acquire information

	-- Visage Liquification Goggles -- 56484
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56484,400,42553,3,4036)
	self:addTradeFlags(RecipeDB,56484,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	-- No acquire information

	-- Greensight Gogs -- 56486
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56486,400,42554,3,4036)
	self:addTradeFlags(RecipeDB,56486,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	-- No acquire information

	-- Electroflux Sight Enhancers -- 56487
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56487,400,42555,3,4036)
	self:addTradeFlags(RecipeDB,56487,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	-- No acquire information

	-- Global Thermal Sapper Charge -- 56514
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56514,400,42641,1,4036,20222)	self:addTradeFlags(RecipeDB,56514,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Truesight Ice Blinders -- 56574
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56574,400,42551,1, 4036)
	self:addTradeFlags(RecipeDB,56574,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	-- No acquire information

	-- Mechano-hog -- 60866
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60866,450,41508,4,4036)
	self:addTradeFlags(RecipeDB,60866,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,130)
	self:addTradeAcquire(RecipeDB,60866,6,1052,4,32565,6,1052,4,32774)

	-- Mekgineer's Chopper -- 60867
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60867,450,44413,4,4036)
	self:addTradeFlags(RecipeDB,60867,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,131)
	self:addTradeAcquire(RecipeDB,60867,6,1037,4,32564,6,1037,4,32773)

	-- Nesingwary 4000 -- 60874
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60874,445,44504,4,4036)
	self:addTradeFlags(RecipeDB,60874,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Diamond-cut Refractor Scope -- 61471
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,61471,385,44739,1, 4036)
	self:addTradeFlags(RecipeDB,61471,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mechanized Snow Goggles -- 61483
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,61483,400,44742,3,4036)
	self:addTradeFlags(RecipeDB,61483,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	-- No acquire information


	return recipecount

end
