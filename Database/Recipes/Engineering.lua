--[[
************************************************************************
Engineering.lua
Engineering data for all of Ackis Recipe List
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]] --

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub	= _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.FILTER_IDS
local A = private.ACQUIRE_TYPES
local Q = private.ITEM_QUALITIES
local REP = private.REP_LEVELS
local FAC = private.FACTION_IDS
local V = private.GAME_VERSIONS

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitEngineering()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, private.PROFESSION_SPELL_IDS.ENGINEERING, genesis, quality)
	end

	private:InitializeEngineeringTrainers()

	local recipe

	-- Rough Blasting Powder -- 3918
	recipe = AddRecipe(3918, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4357)
	recipe:SetSkillLevels(1, 1, 20, 30, 40)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Rough Dynamite -- 3919
	recipe = AddRecipe(3919, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4358)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Handful of Copper Bolts -- 3922
	recipe = AddRecipe(3922, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4359)
	recipe:SetSkillLevels(30, 30, 45, 52, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Rough Copper Bomb -- 3923
	recipe = AddRecipe(3923, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4360)
	recipe:SetSkillLevels(30, 30, 60, 75, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Rough Boomstick -- 3925
	recipe = AddRecipe(3925, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4362)
	recipe:SetSkillLevels(50, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Mechanical Squirrel Box -- 3928
	recipe = AddRecipe(3928, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4408)
	recipe:SetCraftedItemID(4401)
	recipe:SetSkillLevels(75, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Coarse Blasting Powder -- 3929
	recipe = AddRecipe(3929, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4364)
	recipe:SetSkillLevels(75, 75, 85, 90, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Coarse Dynamite -- 3931
	recipe = AddRecipe(3931, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4365)
	recipe:SetSkillLevels(75, 75, 90, 97, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Target Dummy -- 3932
	recipe = AddRecipe(3932, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4366)
	recipe:SetSkillLevels(85, 85, 115, 130, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Small Seaforium Charge -- 3933
	recipe = AddRecipe(3933, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4409)
	recipe:SetCraftedItemID(4367)
	recipe:SetSkillLevels(100, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Flying Tiger Goggles -- 3934
	recipe = AddRecipe(3934, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4368)
	recipe:SetSkillLevels(100, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Deadly Blunderbuss -- 3936
	recipe = AddRecipe(3936, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4369)
	recipe:SetSkillLevels(105, 105, 130, 142, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Large Copper Bomb -- 3937
	recipe = AddRecipe(3937, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4370)
	recipe:SetSkillLevels(105, 105, 105, 130, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Bronze Tube -- 3938
	recipe = AddRecipe(3938, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4371)
	recipe:SetSkillLevels(105, 105, 105, 130, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Lovingly Crafted Boomstick -- 3939
	recipe = AddRecipe(3939, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13309)
	recipe:SetCraftedItemID(4372)
	recipe:SetSkillLevels(120, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.GUN)
	recipe:AddTrainer(3494)

	-- Shadow Goggles -- 3940
	recipe = AddRecipe(3940, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4410)
	recipe:SetCraftedItemID(4373)
	recipe:SetSkillLevels(120, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Small Bronze Bomb -- 3941
	recipe = AddRecipe(3941, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4374)
	recipe:SetSkillLevels(120, 120, 120, 145, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Whirring Bronze Gizmo -- 3942
	recipe = AddRecipe(3942, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4375)
	recipe:SetSkillLevels(125, 125, 125, 150, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Flame Deflector -- 3944
	recipe = AddRecipe(3944, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4411)
	recipe:SetCraftedItemID(4376)
	recipe:SetSkillLevels(125, 125, 125, 150, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)

	-- Heavy Blasting Powder -- 3945
	recipe = AddRecipe(3945, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4377)
	recipe:SetSkillLevels(125, 125, 125, 135, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Heavy Dynamite -- 3946
	recipe = AddRecipe(3946, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4378)
	recipe:SetSkillLevels(125, 125, 125, 135, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Silver-plated Shotgun -- 3949
	recipe = AddRecipe(3949, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4379)
	recipe:SetSkillLevels(130, 130, 155, 167, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Big Bronze Bomb -- 3950
	recipe = AddRecipe(3950, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4380)
	recipe:SetSkillLevels(140, 140, 140, 165, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Minor Recombobulator -- 3952
	recipe = AddRecipe(3952, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14639)
	recipe:SetCraftedItemID(4381)
	recipe:SetSkillLevels(140, 140, 165, 177, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(3495, 1, 41435, 1)

	-- Bronze Framework -- 3953
	recipe = AddRecipe(3953, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4382)
	recipe:SetSkillLevels(145, 145, 145, 170, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Moonsight Rifle -- 3954
	recipe = AddRecipe(3954, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4412)
	recipe:SetCraftedItemID(4383)
	recipe:SetSkillLevels(145, 145, 170, 182, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.GUN)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Explosive Sheep -- 3955
	recipe = AddRecipe(3955, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4384)
	recipe:SetSkillLevels(150, 150, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Green Tinted Goggles -- 3956
	recipe = AddRecipe(3956, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4385)
	recipe:SetSkillLevels(150, 150, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Ice Deflector -- 3957
	recipe = AddRecipe(3957, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13308)
	recipe:SetCraftedItemID(4386)
	recipe:SetSkillLevels(155, 155, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Iron Strut -- 3958
	recipe = AddRecipe(3958, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4387)
	recipe:SetSkillLevels(160, 160, 160, 170, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Discombobulator Ray -- 3959
	recipe = AddRecipe(3959, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4413)
	recipe:SetCraftedItemID(4388)
	recipe:SetSkillLevels(160, 160, 180, 190, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)

	-- Portable Bronze Mortar -- 3960
	recipe = AddRecipe(3960, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4414)
	recipe:SetCraftedItemID(4403)
	recipe:SetSkillLevels(165, 165, 185, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gyrochronatom -- 3961
	recipe = AddRecipe(3961, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4389)
	recipe:SetSkillLevels(170, 170, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Iron Grenade -- 3962
	recipe = AddRecipe(3962, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4390)
	recipe:SetSkillLevels(175, 175, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Compact Harvest Reaper Kit -- 3963
	recipe = AddRecipe(3963, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4391)
	recipe:SetSkillLevels(175, 175, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Advanced Target Dummy -- 3965
	recipe = AddRecipe(3965, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4392)
	recipe:SetSkillLevels(185, 185, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Craftsman's Monocle -- 3966
	recipe = AddRecipe(3966, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(4415)
	recipe:SetCraftedItemID(4393)
	recipe:SetSkillLevels(185, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Big Iron Bomb -- 3967
	recipe = AddRecipe(3967, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4394)
	recipe:SetSkillLevels(190, 190, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Goblin Land Mine -- 3968
	recipe = AddRecipe(3968, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4416)
	recipe:SetCraftedItemID(4395)
	recipe:SetSkillLevels(195, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mechanical Dragonling -- 3969
	recipe = AddRecipe(3969, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13311)
	recipe:SetCraftedItemID(4396)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(2687, 1, 35826, 1)

	-- Gnomish Cloaking Device -- 3971
	recipe = AddRecipe(3971, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7742)
	recipe:SetCraftedItemID(4397)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(7800)
	recipe:AddLimitedVendor(6777, 1)

	-- Large Seaforium Charge -- 3972
	recipe = AddRecipe(3972, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4417)
	recipe:SetCraftedItemID(4398)
	recipe:SetSkillLevels(200, 200, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Silver Contact -- 3973
	recipe = AddRecipe(3973, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4404)
	recipe:SetSkillLevels(90, 90, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Crude Scope -- 3977
	recipe = AddRecipe(3977, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4405)
	recipe:SetSkillLevels(60, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Standard Scope -- 3978
	recipe = AddRecipe(3978, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4406)
	recipe:SetSkillLevels(110, 110, 135, 147, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Accurate Scope -- 3979
	recipe = AddRecipe(3979, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13310)
	recipe:SetCraftedItemID(4407)
	recipe:SetSkillLevels(180, 180, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2685, 1)

	-- Ornate Spyglass -- 6458
	recipe = AddRecipe(6458, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5507)
	recipe:SetSkillLevels(135, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Arclight Spanner -- 7430
	recipe = AddRecipe(7430, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6219)
	recipe:SetSkillLevels(50, 50, 70, 80, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634, 47418)

	-- Flash Bomb -- 8243
	recipe = AddRecipe(8243, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6672)
	recipe:SetCraftedItemID(4852)
	recipe:SetSkillLevels(185, 185, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)

	-- Practice Lock -- 8334
	recipe = AddRecipe(8334, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6712)
	recipe:SetSkillLevels(100, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- EZ-Thro Dynamite -- 8339
	recipe = AddRecipe(8339, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6716)
	recipe:SetCraftedItemID(6714)
	recipe:SetSkillLevels(100, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Goblin Rocket Boots -- 8895
	recipe = AddRecipe(8895, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7189)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(8126, 29513)

	-- Gnomish Universal Remote -- 9269
	recipe = AddRecipe(9269, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7560)
	recipe:SetCraftedItemID(7506)
	recipe:SetSkillLevels(125, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(7800)
	recipe:AddVendor(5175, 6730)

	-- Aquadynamic Fish Attractor -- 9271
	recipe = AddRecipe(9271, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6533)
	recipe:SetSkillLevels(150, 150, 150, 160, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Goblin Jumper Cables -- 9273
	recipe = AddRecipe(9273, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7561)
	recipe:SetCraftedItemID(7148)
	recipe:SetSkillLevels(165, 165, 165, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)
	recipe:AddLimitedVendor(3134, 1, 3537, 1)

	-- Gold Power Core -- 12584
	recipe = AddRecipe(12584, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10558)
	recipe:SetSkillLevels(150, 150, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Solid Blasting Powder -- 12585
	recipe = AddRecipe(12585, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10505)
	recipe:SetSkillLevels(175, 175, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Solid Dynamite -- 12586
	recipe = AddRecipe(12586, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10507)
	recipe:SetSkillLevels(175, 175, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Bright-Eye Goggles -- 12587
	recipe = AddRecipe(12587, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10601)
	recipe:SetCraftedItemID(10499)
	recipe:SetSkillLevels(175, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mithril Tube -- 12589
	recipe = AddRecipe(12589, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10559)
	recipe:SetSkillLevels(195, 195, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Gyromatic Micro-Adjustor -- 12590
	recipe = AddRecipe(12590, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10498)
	recipe:SetSkillLevels(175, 175, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Unstable Trigger -- 12591
	recipe = AddRecipe(12591, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10560)
	recipe:SetSkillLevels(200, 200, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fire Goggles -- 12594
	recipe = AddRecipe(12594, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10500)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mithril Blunderbuss -- 12595
	recipe = AddRecipe(12595, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10508)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Deadly Scope -- 12597
	recipe = AddRecipe(12597, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10602)
	recipe:SetCraftedItemID(10546)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(8679, 1, 9544, 1)

	-- Mithril Casing -- 12599
	recipe = AddRecipe(12599, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10561)
	recipe:SetSkillLevels(215, 215, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mithril Frag Bomb -- 12603
	recipe = AddRecipe(12603, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10514)
	recipe:SetSkillLevels(215, 215, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Catseye Ultra Goggles -- 12607
	recipe = AddRecipe(12607, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10603)
	recipe:SetCraftedItemID(10501)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mithril Heavy-bore Rifle -- 12614
	recipe = AddRecipe(12614, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10604)
	recipe:SetCraftedItemID(10510)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Spellpower Goggles Xtreme -- 12615
	recipe = AddRecipe(12615, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10605)
	recipe:SetCraftedItemID(10502)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Parachute Cloak -- 12616
	recipe = AddRecipe(12616, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(10606)
	recipe:SetCraftedItemID(10518)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Deepdive Helmet -- 12617
	recipe = AddRecipe(12617, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10607)
	recipe:SetCraftedItemID(10506)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddTrainer(3494)

	-- Rose Colored Goggles -- 12618
	recipe = AddRecipe(12618, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10503)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hi-Explosive Bomb -- 12619
	recipe = AddRecipe(12619, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10562)
	recipe:SetSkillLevels(235, 235, 235, 255, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Sniper Scope -- 12620
	recipe = AddRecipe(12620, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(10608)
	recipe:SetCraftedItemID(10548)
	recipe:SetSkillLevels(240, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Lens -- 12622
	recipe = AddRecipe(12622, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10504)
	recipe:SetSkillLevels(245, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mithril Mechanical Dragonling -- 12624
	recipe = AddRecipe(12624, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10609)
	recipe:SetCraftedItemID(10576)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(2688, 1, 35826, 1)

	-- Goblin Rocket Fuel Recipe -- 12715
	recipe = AddRecipe(12715, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10644)
	recipe:SetSkillLevels(205, 205, 205, 205, 205)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 29513)

	-- Goblin Mortar -- 12716
	recipe = AddRecipe(12716, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10577)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Mining Helmet -- 12717
	recipe = AddRecipe(12717, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10542)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.MAIL)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Construction Helmet -- 12718
	recipe = AddRecipe(12718, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10543)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.CLOTH)
	recipe:AddTrainer(8126, 8738, 29513)

	-- The Big One -- 12754
	recipe = AddRecipe(12754, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10586)
	recipe:SetSkillLevels(235, 235, 235, 255, 275)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Bomb Dispenser -- 12755
	recipe = AddRecipe(12755, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10587)
	recipe:SetSkillLevels(230, 230, 230, 250, 270)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Rocket Helmet -- 12758
	recipe = AddRecipe(12758, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10588)
	recipe:SetSkillLevels(245, 245, 265, 275, 285)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Gnomish Death Ray -- 12759
	recipe = AddRecipe(12759, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10645)
	recipe:SetSkillLevels(240, 240, 260, 270, 280)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Goblin Sapper Charge -- 12760
	recipe = AddRecipe(12760, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10646)
	recipe:SetSkillLevels(205, 205, 205, 225, 245)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 29513)

	-- Inlaid Mithril Cylinder Plans -- 12895
	recipe = AddRecipe(12895, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10713)
	recipe:SetSkillLevels(205, 205, 205, 205, 205)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Goggles -- 12897
	recipe = AddRecipe(12897, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10545)
	recipe:SetSkillLevels(215, 215, 230, 240, 250)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Shrink Ray -- 12899
	recipe = AddRecipe(12899, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10716)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Net-o-Matic Projector -- 12902
	recipe = AddRecipe(12902, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10720)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Harm Prevention Belt -- 12903
	recipe = AddRecipe(12903, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10721)
	recipe:SetSkillLevels(215, 215, 235, 245, 255)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Rocket Boots -- 12905
	recipe = AddRecipe(12905, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10724)
	recipe:SetSkillLevels(210, 210, 245, 255, 265)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Battle Chicken -- 12906
	recipe = AddRecipe(12906, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10725)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Mind Control Cap -- 12907
	recipe = AddRecipe(12907, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10726)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Goblin Dragon Gun -- 12908
	recipe = AddRecipe(12908, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10727)
	recipe:SetSkillLevels(240, 240, 260, 270, 280)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- The Mortar: Reloaded -- 13240
	recipe = AddRecipe(13240, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10577)
	recipe:SetSkillLevels(205, 205, 205, 205, 205)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Mechanical Repair Kit -- 15255
	recipe = AddRecipe(15255, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(11590)
	recipe:SetSkillLevels(200, 200, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Pet Bombling -- 15628
	recipe = AddRecipe(15628, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11828)
	recipe:SetCraftedItemID(11825)
	recipe:SetSkillLevels(205, 205, 205, 205, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom("ENG_GNOMER")

	-- Lil' Smoky -- 15633
	recipe = AddRecipe(15633, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(11827)
	recipe:SetCraftedItemID(11826)
	recipe:SetSkillLevels(205, 205, 205, 205, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom("ENG_GNOMER")

	-- Salt Shaker -- 19567
	recipe = AddRecipe(19567, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15846)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Dense Blasting Powder -- 19788
	recipe = AddRecipe(19788, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15992)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Grenade -- 19790
	recipe = AddRecipe(19790, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16041)
	recipe:SetCraftedItemID(15993)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Widget -- 19791
	recipe = AddRecipe(19791, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16042)
	recipe:SetCraftedItemID(15994)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Rifle -- 19792
	recipe = AddRecipe(19792, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16043)
	recipe:SetCraftedItemID(15995)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Lifelike Mechanical Toad -- 19793
	recipe = AddRecipe(19793, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16044)
	recipe:SetCraftedItemID(15996)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Spellpower Goggles Xtreme Plus -- 19794
	recipe = AddRecipe(19794, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16045)
	recipe:SetCraftedItemID(15999)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Tube -- 19795
	recipe = AddRecipe(19795, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16047)
	recipe:SetCraftedItemID(16000)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Dark Iron Rifle -- 19796
	recipe = AddRecipe(19796, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16048)
	recipe:SetCraftedItemID(16004)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.GUN)
	recipe:AddMobDrop(8897)

	-- Dark Iron Bomb -- 19799
	recipe = AddRecipe(19799, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16049)
	recipe:SetCraftedItemID(16005)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8920)

	-- Masterwork Target Dummy -- 19814
	recipe = AddRecipe(19814, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16046)
	recipe:SetCraftedItemID(16023)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)

	-- Delicate Arcanite Converter -- 19815
	recipe = AddRecipe(19815, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16050)
	recipe:SetCraftedItemID(16006)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)

	-- Voice Amplification Modulator -- 19819
	recipe = AddRecipe(19819, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16052)
	recipe:SetCraftedItemID(16009)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.NECK)
	recipe:AddMobDrop(10426)

	-- Master Engineer's Goggles -- 19825
	recipe = AddRecipe(19825, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(16053)
	recipe:SetCraftedItemID(16008)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Arcanite Dragonling -- 19830
	recipe = AddRecipe(19830, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16054)
	recipe:SetCraftedItemID(16022)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(35826, 1)

	-- Arcane Bomb -- 19831
	recipe = AddRecipe(19831, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16055)
	recipe:SetCraftedItemID(16040)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Flawless Arcanite Rifle -- 19833
	recipe = AddRecipe(19833, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(16056)
	recipe:SetCraftedItemID(16007)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddMobDrop(8561)

	-- Snowmaster 9000 -- 21940
	recipe = AddRecipe(21940, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(17720)
	recipe:SetCraftedItemID(17716)
	recipe:SetSkillLevels(190, 190, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason("WINTER_VEIL")

	-- Field Repair Bot 74A -- 22704
	recipe = AddRecipe(22704, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18232)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom("ENG_FLOOR_ITEM_BRD")

	-- Biznicks 247x128 Accurascope -- 22793
	recipe = AddRecipe(22793, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18290)
	recipe:SetCraftedItemID(18283)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom("MC_RANDOM")

	-- Core Marksman Rifle -- 22795
	recipe = AddRecipe(22795, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18292)
	recipe:SetCraftedItemID(18282)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.GUN)
	recipe:AddCustom("MC_RANDOM")

	-- Force Reactive Disk -- 22797
	recipe = AddRecipe(22797, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18291)
	recipe:SetCraftedItemID(18168)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddCustom("MC_RANDOM")

	-- Red Firework -- 23066
	recipe = AddRecipe(23066, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18647)
	recipe:SetCraftedItemID(9318)
	recipe:SetSkillLevels(150, 150, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3413, 1, 45546, 1, 49918, 1, 52655, 1)

	-- Blue Firework -- 23067
	recipe = AddRecipe(23067, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18649)
	recipe:SetCraftedItemID(9312)
	recipe:SetSkillLevels(150, 150, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(5175)
	recipe:AddLimitedVendor(49918, 1)

	-- Green Firework -- 23068
	recipe = AddRecipe(23068, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18648)
	recipe:SetCraftedItemID(9313)
	recipe:SetSkillLevels(150, 150, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2838, 1, 3495, 1, 49918, 1)

	-- EZ-Thro Dynamite II -- 23069
	recipe = AddRecipe(23069, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18650)
	recipe:SetCraftedItemID(18588)
	recipe:SetSkillLevels(200, 200, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(8131, 1, 49918, 1)

	-- Dense Dynamite -- 23070
	recipe = AddRecipe(23070, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18641)
	recipe:SetSkillLevels(250, 250, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Truesilver Transformer -- 23071
	recipe = AddRecipe(23071, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18651)
	recipe:SetCraftedItemID(18631)
	recipe:SetSkillLevels(260, 260, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Gyrofreeze Ice Reflector -- 23077
	recipe = AddRecipe(23077, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18652)
	recipe:SetCraftedItemID(18634)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddVendor(11185)

	-- Goblin Jumper Cables XL -- 23078
	recipe = AddRecipe(23078, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18653)
	recipe:SetCraftedItemID(18587)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(9499)

	-- Major Recombobulator -- 23079
	recipe = AddRecipe(23079, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18655)
	recipe:SetCraftedItemID(18637)
	recipe:SetSkillLevels(275, 275, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddCustom("DM_TRIBUTE")

	-- Powerful Seaforium Charge -- 23080
	recipe = AddRecipe(23080, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18656)
	recipe:SetCraftedItemID(18594)
	recipe:SetSkillLevels(275, 275, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)

	-- Hyper-Radiant Flame Reflector -- 23081
	recipe = AddRecipe(23081, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18657)
	recipe:SetCraftedItemID(18638)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(10264)

	-- Ultra-Flash Shadow Reflector -- 23082
	recipe = AddRecipe(23082, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18658)
	recipe:SetCraftedItemID(18639)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(10426)

	-- Gnomish Alarm-o-Bot -- 23096
	recipe = AddRecipe(23096, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18654)
	recipe:SetCraftedItemID(18645)
	recipe:SetSkillLevels(265, 265, 275, 280, 285)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8920)

	-- World Enlarger -- 23129
	recipe = AddRecipe(23129, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(18661)
	recipe:SetCraftedItemID(18660)
	recipe:SetSkillLevels(260, 260, 260, 265, 270)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8920)

	-- Dimensional Ripper - Everlook -- 23486
	recipe = AddRecipe(23486, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18984)
	recipe:SetSkillLevels(260, 260, 285, 295, 305)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(14742)

	-- Ultrasafe Transporter - Gadgetzan -- 23489
	recipe = AddRecipe(23489, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18986)
	recipe:SetSkillLevels(260, 260, 285, 295, 305)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(14743)

	-- Snake Burst Firework -- 23507
	recipe = AddRecipe(23507, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19027)
	recipe:SetCraftedItemID(19026)
	recipe:SetSkillLevels(250, 250, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(14637)

	-- Bloodvine Goggles -- 24356
	recipe = AddRecipe(24356, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20000)
	recipe:SetCraftedItemID(19999)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Bloodvine Lens -- 24357
	recipe = AddRecipe(24357, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20001)
	recipe:SetCraftedItemID(19998)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Tranquil Mechanical Yeti -- 26011
	recipe = AddRecipe(26011, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(21277)
	recipe:SetSkillLevels(250, 250, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(8798)

	-- Small Blue Rocket -- 26416
	recipe = AddRecipe(26416, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21724)
	recipe:SetCraftedItemID(21558)
	recipe:SetSkillLevels(125, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Small Green Rocket -- 26417
	recipe = AddRecipe(26417, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21725)
	recipe:SetCraftedItemID(21559)
	recipe:SetSkillLevels(125, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Small Red Rocket -- 26418
	recipe = AddRecipe(26418, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21726)
	recipe:SetCraftedItemID(21557)
	recipe:SetSkillLevels(125, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Large Blue Rocket -- 26420
	recipe = AddRecipe(26420, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21727)
	recipe:SetCraftedItemID(21589)
	recipe:SetSkillLevels(175, 175, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Large Green Rocket -- 26421
	recipe = AddRecipe(26421, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21728)
	recipe:SetCraftedItemID(21590)
	recipe:SetSkillLevels(175, 175, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Large Red Rocket -- 26422
	recipe = AddRecipe(26422, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21729)
	recipe:SetCraftedItemID(21592)
	recipe:SetSkillLevels(175, 175, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Blue Rocket Cluster -- 26423
	recipe = AddRecipe(26423, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21730)
	recipe:SetCraftedItemID(21571)
	recipe:SetSkillLevels(225, 225, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Green Rocket Cluster -- 26424
	recipe = AddRecipe(26424, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21731)
	recipe:SetCraftedItemID(21574)
	recipe:SetSkillLevels(225, 225, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Red Rocket Cluster -- 26425
	recipe = AddRecipe(26425, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21732)
	recipe:SetCraftedItemID(21576)
	recipe:SetSkillLevels(225, 225, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Large Blue Rocket Cluster -- 26426
	recipe = AddRecipe(26426, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21733)
	recipe:SetCraftedItemID(21714)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Large Green Rocket Cluster -- 26427
	recipe = AddRecipe(26427, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21734)
	recipe:SetCraftedItemID(21716)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Large Red Rocket Cluster -- 26428
	recipe = AddRecipe(26428, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21735)
	recipe:SetCraftedItemID(21718)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Firework Launcher -- 26442
	recipe = AddRecipe(26442, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(44919)
	recipe:SetCraftedItemID(21569)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Cluster Launcher -- 26443
	recipe = AddRecipe(26443, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(44918)
	recipe:SetCraftedItemID(21570)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason("LUNAR_FESTIVAL")

	-- Steam Tonk Controller -- 28327
	recipe = AddRecipe(28327, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22729)
	recipe:SetCraftedItemID(22728)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddVendor(5175)
	recipe:AddLimitedVendor(3413, 1, 45546, 1, 52655, 1)
	recipe:AddQuest(9249)

	-- Elemental Blasting Powder -- 30303
	recipe = AddRecipe(30303, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23781)
	recipe:SetSkillLevels(300, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fel Iron Casing -- 30304
	recipe = AddRecipe(30304, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23782)
	recipe:SetSkillLevels(300, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Handful of Fel Iron Bolts -- 30305
	recipe = AddRecipe(30305, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23783)
	recipe:SetSkillLevels(300, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Adamantite Frame -- 30306
	recipe = AddRecipe(30306, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23784)
	recipe:SetSkillLevels(325, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hardened Adamantite Tube -- 30307
	recipe = AddRecipe(30307, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23785)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Khorium Power Core -- 30308
	recipe = AddRecipe(30308, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23786)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Felsteel Stabilizer -- 30309
	recipe = AddRecipe(30309, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23787)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fel Iron Bomb -- 30310
	recipe = AddRecipe(30310, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23736)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Adamantite Grenade -- 30311
	recipe = AddRecipe(30311, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23737)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fel Iron Musket -- 30312
	recipe = AddRecipe(30312, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23742)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Adamantite Rifle -- 30313
	recipe = AddRecipe(30313, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23799)
	recipe:SetCraftedItemID(23746)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddVendor(16657)
	recipe:AddLimitedVendor(16782, 1, 19661, 1)

	-- Felsteel Boomstick -- 30314
	recipe = AddRecipe(30314, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23800)
	recipe:SetCraftedItemID(23747)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.GUN)
	recipe:AddMobDrop(19960)

	-- Ornate Khorium Rifle -- 30315
	recipe = AddRecipe(30315, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23802)
	recipe:SetCraftedItemID(23748)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddWorldDrop("Outland")

	-- Cogspinner Goggles -- 30316
	recipe = AddRecipe(30316, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23803)
	recipe:SetCraftedItemID(23758)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(18775, 19836)

	-- Power Amplification Goggles -- 30317
	recipe = AddRecipe(30317, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23804)
	recipe:SetCraftedItemID(23761)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Ultra-Spectropic Detection Goggles -- 30318
	recipe = AddRecipe(30318, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23805)
	recipe:SetCraftedItemID(23762)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(18775)
	recipe:AddLimitedVendor(19383, 1)

	-- Hyper-Vision Goggles -- 30325
	recipe = AddRecipe(30325, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23806)
	recipe:SetCraftedItemID(23763)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(19755)

	-- Adamantite Scope -- 30329
	recipe = AddRecipe(30329, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23807)
	recipe:SetCraftedItemID(23764)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(19351, 19836)

	-- Khorium Scope -- 30332
	recipe = AddRecipe(30332, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23808)
	recipe:SetCraftedItemID(23765)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(20207)

	-- Stabilized Eternium Scope -- 30334
	recipe = AddRecipe(30334, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23809)
	recipe:SetCraftedItemID(23766)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(16152)

	-- Crashin' Thrashin' Robot -- 30337
	recipe = AddRecipe(30337, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23810)
	recipe:SetCraftedItemID(23767)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- White Smoke Flare -- 30341
	recipe = AddRecipe(30341, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23811)
	recipe:SetCraftedItemID(23768)
	recipe:SetSkillLevels(335, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16657)
	recipe:AddLimitedVendor(16782, 1, 18484, 1, 19383, 1)

	-- Green Smoke Flare -- 30344
	recipe = AddRecipe(30344, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23814)
	recipe:SetCraftedItemID(23771)
	recipe:SetSkillLevels(335, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.FRIENDLY, 17904)

	-- Fel Iron Toolbox -- 30348
	recipe = AddRecipe(30348, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23816)
	recipe:SetCraftedItemID(23774)
	recipe:SetSkillLevels(325, 325, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16657)
	recipe:AddLimitedVendor(16782, 1, 18484, 1)

	-- Titanium Toolbox -- 30349
	recipe = AddRecipe(30349, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(23817)
	recipe:SetCraftedItemID(23775)
	recipe:SetSkillLevels(405, 405, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(28722, 5, 33594, 5)

	-- Elemental Seaforium Charge -- 30547
	recipe = AddRecipe(30547, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23874)
	recipe:SetCraftedItemID(23819)
	recipe:SetSkillLevels(350, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Zapthrottle Mote Extractor -- 30548
	recipe = AddRecipe(30548, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(23888)
	recipe:SetCraftedItemID(23821)
	recipe:SetSkillLevels(305, 305, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(9635, 9636)

	-- Healing Potion Injector -- 30551
	recipe = AddRecipe(30551, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35310)
	recipe:SetCraftedItemID(33092)
	recipe:SetSkillLevels(330, 330, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)

	-- Mana Potion Injector -- 30552
	recipe = AddRecipe(30552, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35311)
	recipe:SetCraftedItemID(33093)
	recipe:SetSkillLevels(345, 345, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)

	-- Rocket Boots Xtreme -- 30556
	recipe = AddRecipe(30556, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(23887)
	recipe:SetCraftedItemID(23824)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(17796)

	-- The Bigger One -- 30558
	recipe = AddRecipe(30558, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23826)
	recipe:SetSkillLevels(325, 325, 325, 335, 345)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Super Sapper Charge -- 30560
	recipe = AddRecipe(30560, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23827)
	recipe:SetSkillLevels(340, 340, 340, 350, 360)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Rocket Launcher -- 30563
	recipe = AddRecipe(30563, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23836)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Foreman's Enchanted Helmet -- 30565
	recipe = AddRecipe(30565, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23838)
	recipe:SetSkillLevels(375, 375, 375, 385, 395)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Foreman's Reinforced Helmet -- 30566
	recipe = AddRecipe(30566, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23839)
	recipe:SetSkillLevels(375, 375, 375, 385, 395)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Gnomish Flame Turret -- 30568
	recipe = AddRecipe(30568, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23841)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Poultryizer -- 30569
	recipe = AddRecipe(30569, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23835)
	recipe:SetSkillLevels(340, 340, 360, 370, 380)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Nigh-Invulnerability Belt -- 30570
	recipe = AddRecipe(30570, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23825)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Power Goggles -- 30574
	recipe = AddRecipe(30574, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23828)
	recipe:SetSkillLevels(375, 375, 375, 385, 395)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Battle Goggles -- 30575
	recipe = AddRecipe(30575, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(23829)
	recipe:SetSkillLevels(375, 375, 375, 385, 395)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Purple Smoke Flare -- 32814
	recipe = AddRecipe(32814, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(25887)
	recipe:SetCraftedItemID(25886)
	recipe:SetSkillLevels(335, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Dimensional Ripper - Area 52 -- 36954
	recipe = AddRecipe(36954, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30542)
	recipe:SetSkillLevels(350, 350, 350, 360, 370)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(21493)

	-- Ultrasafe Transporter - Toshley's Station -- 36955
	recipe = AddRecipe(36955, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(30544)
	recipe:SetSkillLevels(350, 350, 350, 360, 370)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(21494)

	-- Fused Wiring -- 39895
	recipe = AddRecipe(39895, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32381)
	recipe:SetCraftedItemID(7191)
	recipe:SetSkillLevels(275, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)
	recipe:AddLimitedVendor(19661, 1)

	-- Icy Blasting Primers -- 39971
	recipe = AddRecipe(39971, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32423)
	recipe:SetSkillLevels(335, 335, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Frost Grenade -- 39973
	recipe = AddRecipe(39973, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32413)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Furious Gizmatic Goggles -- 40274
	recipe = AddRecipe(40274, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32461)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(5518, 17634, 17637, 18752, 18775, 19576, 25277, 26955, 28697, 33586)

	-- Gyro-balanced Khorium Destroyer -- 41307
	recipe = AddRecipe(41307, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32756)
	recipe:SetSkillLevels(375, 375, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Justicebringer 2000 Specs -- 41311
	recipe = AddRecipe(41311, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32472)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.PALADIN, F.PLATE)
	recipe:AddTrainer(5518, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Tankatronic Goggles -- 41312
	recipe = AddRecipe(41312, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32473)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(5518, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Surestrike Goggles v2.0 -- 41314
	recipe = AddRecipe(41314, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32474)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Gadgetstorm Goggles -- 41315
	recipe = AddRecipe(41315, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32476)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Living Replicator Specs -- 41316
	recipe = AddRecipe(41316, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32475)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Deathblow X11 Goggles -- 41317
	recipe = AddRecipe(41317, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32478)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.ROGUE, F.LEATHER)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Wonderheal XT40 Shades -- 41318
	recipe = AddRecipe(41318, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32479)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Magnified Moon Specs -- 41319
	recipe = AddRecipe(41319, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32480)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Destruction Holo-gogs -- 41320
	recipe = AddRecipe(41320, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32494)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddTrainer(3494, 8736, 11017, 11025, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Powerheal 4000 Lens -- 41321
	recipe = AddRecipe(41321, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32495)
	recipe:SetSkillLevels(350, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.PRIEST, F.CLOTH)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Adamantite Arrow Maker -- 43676
	recipe = AddRecipe(43676, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(20475)
	recipe:SetSkillLevels(335, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("BUGGED", "REMOVED_FROM_GAME")

	-- Flying Machine -- 44155
	recipe = AddRecipe(44155, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(34060)
	recipe:SetSkillLevels(300, 300, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 24868, 25099, 25277, 26955, 28697, 33586, 33611, 33634)

	-- Turbo-Charged Flying Machine -- 44157
	recipe = AddRecipe(44157, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(34061)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 24868, 25099, 33586, 33611, 33634)

	-- Field Repair Bot 110G -- 44391
	recipe = AddRecipe(44391, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(34114)
	recipe:SetCraftedItemID(34113)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(23385, 23386)

	-- Wonderheal XT68 Shades -- 46106
	recipe = AddRecipe(46106, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35191)
	recipe:SetCraftedItemID(35183)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Justicebringer 3000 Specs -- 46107
	recipe = AddRecipe(46107, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35187)
	recipe:SetCraftedItemID(35185)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.PALADIN, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Powerheal 9000 Lens -- 46108
	recipe = AddRecipe(46108, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35189)
	recipe:SetCraftedItemID(35181)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.PRIEST, F.CLOTH)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hyper-Magnified Moon Specs -- 46109
	recipe = AddRecipe(46109, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35190)
	recipe:SetCraftedItemID(35182)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Primal-Attuned Goggles -- 46110
	recipe = AddRecipe(46110, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35192)
	recipe:SetCraftedItemID(35184)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Annihilator Holo-Gogs -- 46111
	recipe = AddRecipe(46111, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35186)
	recipe:SetCraftedItemID(34847)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Lightning Etched Specs -- 46112
	recipe = AddRecipe(46112, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35193)
	recipe:SetCraftedItemID(34355)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Surestrike Goggles v3.0 -- 46113
	recipe = AddRecipe(46113, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35194)
	recipe:SetCraftedItemID(34356)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Mayhem Projection Goggles -- 46114
	recipe = AddRecipe(46114, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35195)
	recipe:SetCraftedItemID(34354)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DPS, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Hard Khorium Goggles -- 46115
	recipe = AddRecipe(46115, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35196)
	recipe:SetCraftedItemID(34357)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.TANK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Quad Deathblow X44 Goggles -- 46116
	recipe = AddRecipe(46116, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35197)
	recipe:SetCraftedItemID(34353)
	recipe:SetSkillLevels(375, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DRUID, F.ROGUE, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Rocket Boots Xtreme Lite -- 46697
	recipe = AddRecipe(46697, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(35582)
	recipe:SetCraftedItemID(35581)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(19219)

	-- Volatile Blasting Trigger -- 53281
	recipe = AddRecipe(53281, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(39690)
	recipe:SetSkillLevels(350, 350, 366, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mark "S" Boomstick -- 54353
	recipe = AddRecipe(54353, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39688)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.GUN)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Personal Electromagnetic Pulse Generator -- 54736
	recipe = AddRecipe(54736, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(390, 390, 390, 392, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Frag Belt -- 54793
	recipe = AddRecipe(54793, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(380, 380, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hand-Mounted Pyro Rocket -- 54998
	recipe = AddRecipe(54998, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hyperspeed Accelerators -- 54999
	recipe = AddRecipe(54999, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Flexweave Underlay -- 55002
	recipe = AddRecipe(55002, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(380, 380, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Nitro Boosts -- 55016
	recipe = AddRecipe(55016, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 405, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Scrapbot Construction Kit -- 55252
	recipe = AddRecipe(55252, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40769)
	recipe:SetSkillLevels(415, 415, 415, 417, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(12889)

	-- Handful of Cobalt Bolts -- 56349
	recipe = AddRecipe(56349, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(39681)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hammer Pick -- 56459
	recipe = AddRecipe(56459, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(40892)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Cobalt Frag Bomb -- 56460
	recipe = AddRecipe(56460, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(40771)
	recipe:SetSkillLevels(350, 350, 375, 382, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Bladed Pickaxe -- 56461
	recipe = AddRecipe(56461, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40893)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Gnomish Army Knife -- 56462
	recipe = AddRecipe(56462, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40772)
	recipe:SetSkillLevels(435, 435, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Explosive Decoy -- 56463
	recipe = AddRecipe(56463, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40536)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Overcharged Capacitor -- 56464
	recipe = AddRecipe(56464, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39682)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mechanized Snow Goggles -- 56465
	recipe = AddRecipe(56465, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41112)
	recipe:SetSkillLevels(420, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddTrainer(3494, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Sonic Booster -- 56466
	recipe = AddRecipe(56466, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40767)
	recipe:SetSkillLevels(420, 420, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Noise Machine -- 56467
	recipe = AddRecipe(56467, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40865)
	recipe:SetSkillLevels(420, 420, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Box of Bombs -- 56468
	recipe = AddRecipe(56468, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41119)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Gnomish Lightning Generator -- 56469
	recipe = AddRecipe(56469, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41121)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Sun Scope -- 56470
	recipe = AddRecipe(56470, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41146)
	recipe:SetSkillLevels(425, 425, 430, 432, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Froststeel Tube -- 56471
	recipe = AddRecipe(56471, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39683)
	recipe:SetSkillLevels(390, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- MOLL-E -- 56472
	recipe = AddRecipe(56472, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40768)
	recipe:SetSkillLevels(425, 425, 430, 432, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Gnomish X-Ray Specs -- 56473
	recipe = AddRecipe(56473, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40895)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26907, 26955, 29514)

	-- Healing Injector Kit -- 56476
	recipe = AddRecipe(56476, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37567)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mana Injector Kit -- 56477
	recipe = AddRecipe(56477, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42546)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Heartseeker Scope -- 56478
	recipe = AddRecipe(56478, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41167)
	recipe:SetSkillLevels(430, 430, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Armor Plated Combat Shotgun -- 56479
	recipe = AddRecipe(56479, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41168)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.GUN)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Armored Titanium Goggles -- 56480
	recipe = AddRecipe(56480, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42549)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TANK, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(5518, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Weakness Spectralizers -- 56481
	recipe = AddRecipe(56481, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42550)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Charged Titanium Specs -- 56483
	recipe = AddRecipe(56483, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42552)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(5518, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Visage Liquification Goggles -- 56484
	recipe = AddRecipe(56484, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42553)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddTrainer(3494, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Greensight Gogs -- 56486
	recipe = AddRecipe(56486, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42554)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Electroflux Sight Enhancers -- 56487
	recipe = AddRecipe(56487, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42555)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Global Thermal Sapper Charge -- 56514
	recipe = AddRecipe(56514, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42641)
	recipe:SetSkillLevels(425, 425, 425, 430, 435)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 29513)

	-- Truesight Ice Blinders -- 56574
	recipe = AddRecipe(56574, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42551)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechano-Hog -- 60866
	recipe = AddRecipe(60866, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44502)
	recipe:SetCraftedItemID(41508)
	recipe:SetSkillLevels(450, 450, 480, 485, 490)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WRATHCOMMON1)
	recipe:AddRepVendor(FAC.HORDE_EXPEDITION, REP.EXALTED, 32565, 32774)

	-- Mekgineer's Chopper -- 60867
	recipe = AddRecipe(60867, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44503)
	recipe:SetCraftedItemID(44413)
	recipe:SetSkillLevels(450, 450, 480, 485, 490)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.WRATHCOMMON1)
	recipe:AddRepVendor(FAC.ALLIANCE_VANGUARD, REP.EXALTED, 32564, 32773)

	-- Nesingwary 4000 -- 60874
	recipe = AddRecipe(60874, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44504)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.GUN)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Diamond-cut Refractor Scope -- 61471
	recipe = AddRecipe(61471, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44739)
	recipe:SetSkillLevels(390, 390, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mechanized Snow Goggles -- 61481
	recipe = AddRecipe(61481, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44742)
	recipe:SetSkillLevels(420, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID, F.ROGUE, F.LEATHER)
	recipe:AddTrainer(5518, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechanized Snow Goggles -- 61482
	recipe = AddRecipe(61482, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44742)
	recipe:SetSkillLevels(420, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(5518, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechanized Snow Goggles -- 61483
	recipe = AddRecipe(61483, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44742)
	recipe:SetSkillLevels(420, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(5518, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Unbreakable Healing Amplifiers -- 62271
	recipe = AddRecipe(62271, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44949)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.PALADIN, F.PLATE)
	recipe:AddTrainer(5518, 25277, 26907, 26955)

	-- High-powered Flashlight -- 63750
	recipe = AddRecipe(63750, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45631)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Reticulated Armor Webbing -- 63770
	recipe = AddRecipe(63770, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Goblin Beam Welder -- 67326
	recipe = AddRecipe(67326, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(47828)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26955, 28697, 33586, 33611, 33634)

	-- Mind Amplification Dish -- 67839
	recipe = AddRecipe(67839, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26955, 28697, 33586, 33611, 33634)

	-- Wormhole Generator: Northrend -- 67920
	recipe = AddRecipe(67920, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(48933)
	recipe:SetSkillLevels(435, 435, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 25277, 26955, 28697, 33586, 33611, 33634)

	-- Jeeves -- 68067
	recipe = AddRecipe(68067, V.WOTLK, Q.RARE)
	recipe:SetCraftedItemID(49050)
	recipe:SetSkillLevels(450, 450, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Reinforced Bio-Optic Killshades -- 81714
	recipe = AddRecipe(81714, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59359)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.PALADIN, F.WARRIOR)
	recipe:AddTrainer(5518, 11017)

	-- Specialized Bio-Optic Killshades -- 81715
	recipe = AddRecipe(81715, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59448)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(5518, 11017)

	-- Deadly Bio-Optic Killshades -- 81716
	recipe = AddRecipe(81716, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59456)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HUNTER, F.SHAMAN)
	recipe:AddTrainer(5518, 11017)

	-- Energized Bio-Optic Killshades -- 81720
	recipe = AddRecipe(81720, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59458)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(5518, 11017)

	-- Agile Bio-Optic Killshades -- 81722
	recipe = AddRecipe(81722, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59455)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID, F.ROGUE)
	recipe:AddTrainer(5518, 11017)

	-- Camouflage Bio-Optic Killshades -- 81724
	recipe = AddRecipe(81724, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59453)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(5518, 11017)

	-- Lightweight Bio-Optic Killshades -- 81725
	recipe = AddRecipe(81725, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59449)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Synapse Springs -- 82175
	recipe = AddRecipe(82175, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Quickflip Deflection Plates -- 82177
	recipe = AddRecipe(82177, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Tazik Shocker -- 82180
	recipe = AddRecipe(82180, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Spinal Healing Injector -- 82200
	recipe = AddRecipe(82200, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Z50 Mana Gulper -- 82201
	recipe = AddRecipe(82201, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Handful of Obsidium Bolts -- 84403
	recipe = AddRecipe(84403, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60224)
	recipe:SetSkillLevels(425, 425, 435, 442, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Authentic Jr. Engineer Goggles -- 84406
	recipe = AddRecipe(84406, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60222)
	recipe:SetSkillLevels(440, 440, 455, 457, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- R19 Threatfinder -- 84408
	recipe = AddRecipe(84408, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59595)
	recipe:SetSkillLevels(450, 450, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Volatile Seaforium Blastpack -- 84409
	recipe = AddRecipe(84409, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60853)
	recipe:SetSkillLevels(455, 455, 460, 467, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Safety Catch Removal Kit -- 84410
	recipe = AddRecipe(84410, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59596)
	recipe:SetSkillLevels(450, 450, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- High-Powered Bolt Gun -- 84411
	recipe = AddRecipe(84411, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60223)
	recipe:SetSkillLevels(465, 465, 465, 465, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Personal World Destroyer -- 84412
	recipe = AddRecipe(84412, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59597)
	recipe:SetSkillLevels(475, 475, 495, 497, 500)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(29513)

	-- De-Weaponized Mechanical Companion -- 84413
	recipe = AddRecipe(84413, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60216)
	recipe:SetSkillLevels(475, 475, 495, 497, 500)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7944, 29514)

	-- Lure Master Tackle Box -- 84415
	recipe = AddRecipe(84415, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60218)
	recipe:SetSkillLevels(475, 475, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Elementium Toolbox -- 84416
	recipe = AddRecipe(84416, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60217)
	recipe:SetSkillLevels(475, 475, 495, 497, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Volatile Thunderstick -- 84417
	recipe = AddRecipe(84417, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59599)
	recipe:SetSkillLevels(495, 495, 515, 517, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Elementium Dragonling -- 84418
	recipe = AddRecipe(84418, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60403)
	recipe:SetSkillLevels(475, 475, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Finely-Tuned Throat Needler -- 84420
	recipe = AddRecipe(84420, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59598)
	recipe:SetSkillLevels(490, 490, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Loot-a-Rang -- 84421
	recipe = AddRecipe(84421, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60854)
	recipe:SetSkillLevels(490, 490, 495, 497, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Invisibility Field -- 84424
	recipe = AddRecipe(84424, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Cardboard Assassin -- 84425
	recipe = AddRecipe(84425, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Grounded Plasma Shield -- 84427
	recipe = AddRecipe(84427, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddDiscovery("ENG_DISC")

	-- Gnomish X-Ray Scope -- 84428
	recipe = AddRecipe(84428, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59594)
	recipe:SetSkillLevels(515, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Goblin Barbecue -- 84429
	recipe = AddRecipe(84429, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60858)
	recipe:SetSkillLevels(505, 505, 505, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Heat-Treated Spinning Lure -- 84430
	recipe = AddRecipe(84430, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(68049)
	recipe:SetSkillLevels(510, 510, 510, 520, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Overpowered Chicken Splitter -- 84431
	recipe = AddRecipe(84431, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59364)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Kickback 5000 -- 84432
	recipe = AddRecipe(84432, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(59367)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Electrified Ether -- 94748
	recipe = AddRecipe(94748, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67749)
	recipe:SetSkillLevels(445, 445, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Electrostatic Condenser -- 95703
	recipe = AddRecipe(95703, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67494)
	recipe:SetSkillLevels(440, 440, 450, 452, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3494, 5518, 8736, 11017, 11025, 17637, 33586, 33611, 33634)

	-- Gnomish Gravity Well -- 95705
	recipe = AddRecipe(95705, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(40727)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:SetSpecialty(20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Big Daddy -- 95707
	recipe = AddRecipe(95707, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63396)
	recipe:SetSkillLevels(500, 500, 505, 507, 510)
	recipe:SetSpecialty(20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Flintlocke's Woodchucker -- 100587
	recipe = AddRecipe(100587, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70177)
	recipe:SetCraftedItemID(70139)
	recipe:SetSkillLevels(515, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddVendor(53214)

	-- Extreme-Impact Hole Puncher -- 100687
	recipe = AddRecipe(100687, V.CATA, Q.RARE)
	recipe:SetRecipeItemID(70178)
	recipe:SetCraftedItemID(71077)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(53214)

	self.InitEngineering = nil
end
