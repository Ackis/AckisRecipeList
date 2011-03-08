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
]]--

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F		= private.filter_flags
local A		= private.acquire_types
local Q		= private.item_qualities
local REP	= private.rep_levels
local FAC	= private.faction_ids
local V		= private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, specialty, required_faction)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 4036, specialty, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
end

function addon:InitEngineering()
	local recipe

	-- Rough Blasting Powder -- 3918
	recipe = AddRecipe(3918, 1, 4357, Q.COMMON, V.ORIG, 1, 20, 30, 40)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Rough Dynamite -- 3919
	recipe = AddRecipe(3919, 1, 4358, Q.COMMON, V.ORIG, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Handful of Copper Bolts -- 3922
	recipe = AddRecipe(3922, 30, 4359, Q.COMMON, V.ORIG, 30, 45, 52, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Rough Copper Bomb -- 3923
	recipe = AddRecipe(3923, 30, 4360, Q.COMMON, V.ORIG, 30, 60, 75, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Copper Tube -- 3924
	recipe = AddRecipe(3924, 50, 4361, Q.COMMON, V.ORIG, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Rough Boomstick -- 3925
	recipe = AddRecipe(3925, 50, 4362, Q.COMMON, V.ORIG, 50, 80, 95, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Copper Modulator -- 3926
	recipe = AddRecipe(3926, 65, 4363, Q.COMMON, V.ORIG, 65, 95, 110, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mechanical Squirrel Box -- 3928
	recipe = AddRecipe(3928, 75, 4401, Q.UNCOMMON, V.ORIG, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Coarse Blasting Powder -- 3929
	recipe = AddRecipe(3929, 75, 4364, Q.COMMON, V.ORIG, 75, 85, 90, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Coarse Dynamite -- 3931
	recipe = AddRecipe(3931, 75, 4365, Q.COMMON, V.ORIG, 75, 90, 97, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Target Dummy -- 3932
	recipe = AddRecipe(3932, 85, 4366, Q.COMMON, V.ORIG, 85, 115, 130, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Small Seaforium Charge -- 3933
	recipe = AddRecipe(3933, 100, 4367, Q.UNCOMMON, V.ORIG, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Flying Tiger Goggles -- 3934
	recipe = AddRecipe(3934, 100, 4368, Q.COMMON, V.ORIG, 100, 130, 145, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Deadly Blunderbuss -- 3936
	recipe = AddRecipe(3936, 105, 4369, Q.COMMON, V.ORIG, 105, 130, 142, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Large Copper Bomb -- 3937
	recipe = AddRecipe(3937, 105, 4370, Q.COMMON, V.ORIG, 105, 105, 130, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Bronze Tube -- 3938
	recipe = AddRecipe(3938, 105, 4371, Q.COMMON, V.ORIG, 105, 105, 130, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Lovingly Crafted Boomstick -- 3939
	recipe = AddRecipe(3939, 120, 4372, Q.COMMON, V.ORIG, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.GUN)
	recipe:AddVendor(2682, 6730)

	-- Shadow Goggles -- 3940
	recipe = AddRecipe(3940, 120, 4373, Q.UNCOMMON, V.ORIG, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Small Bronze Bomb -- 3941
	recipe = AddRecipe(3941, 120, 4374, Q.COMMON, V.ORIG, 120, 120, 145, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Whirring Bronze Gizmo -- 3942
	recipe = AddRecipe(3942, 125, 4375, Q.COMMON, V.ORIG, 125, 125, 150, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Flame Deflector -- 3944
	recipe = AddRecipe(3944, 125, 4376, Q.UNCOMMON, V.ORIG, 125, 125, 150, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)

	-- Heavy Blasting Powder -- 3945
	recipe = AddRecipe(3945, 125, 4377, Q.COMMON, V.ORIG, 125, 125, 135, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Heavy Dynamite -- 3946
	recipe = AddRecipe(3946, 125, 4378, Q.COMMON, V.ORIG, 125, 125, 135, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Silver-plated Shotgun -- 3949
	recipe = AddRecipe(3949, 130, 4379, Q.COMMON, V.ORIG, 130, 155, 167, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Big Bronze Bomb -- 3950
	recipe = AddRecipe(3950, 140, 4380, Q.COMMON, V.ORIG, 140, 140, 165, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Minor Recombobulator -- 3952
	recipe = AddRecipe(3952, 140, 4381, Q.COMMON, V.ORIG, 140, 165, 177, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddVendor(2682, 2683, 3495)

	-- Bronze Framework -- 3953
	recipe = AddRecipe(3953, 145, 4382, Q.COMMON, V.ORIG, 145, 145, 170, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Moonsight Rifle -- 3954
	recipe = AddRecipe(3954, 145, 4383, Q.UNCOMMON, V.ORIG, 145, 170, 182, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.GUN)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Explosive Sheep -- 3955
	recipe = AddRecipe(3955, 150, 4384, Q.COMMON, V.ORIG, 150, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Green Tinted Goggles -- 3956
	recipe = AddRecipe(3956, 150, 4385, Q.COMMON, V.ORIG, 150, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Ice Deflector -- 3957
	recipe = AddRecipe(3957, 155, 4386, Q.COMMON, V.ORIG, 155, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom(48)

	-- Iron Strut -- 3958
	recipe = AddRecipe(3958, 160, 4387, Q.COMMON, V.ORIG, 160, 160, 170, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Discombobulator Ray -- 3959
	recipe = AddRecipe(3959, 160, 4388, Q.UNCOMMON, V.ORIG, 160, 180, 190, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)

	-- Portable Bronze Mortar -- 3960
	recipe = AddRecipe(3960, 165, 4403, Q.UNCOMMON, V.ORIG, 165, 185, 195, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gyrochronatom -- 3961
	recipe = AddRecipe(3961, 170, 4389, Q.COMMON, V.ORIG, 170, 170, 190, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Iron Grenade -- 3962
	recipe = AddRecipe(3962, 175, 4390, Q.COMMON, V.ORIG, 175, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Compact Harvest Reaper Kit -- 3963
	recipe = AddRecipe(3963, 175, 4391, Q.COMMON, V.ORIG, 175, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Advanced Target Dummy -- 3965
	recipe = AddRecipe(3965, 185, 4392, Q.COMMON, V.ORIG, 185, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Craftsman's Monocle -- 3966
	recipe = AddRecipe(3966, 185, 4393, Q.RARE, V.ORIG, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Big Iron Bomb -- 3967
	recipe = AddRecipe(3967, 190, 4394, Q.COMMON, V.ORIG, 190, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Goblin Land Mine -- 3968
	recipe = AddRecipe(3968, 195, 4395, Q.UNCOMMON, V.ORIG, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mechanical Dragonling -- 3969
	recipe = AddRecipe(3969, 200, 4396, Q.COMMON, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(2687, 1, 35826, 1)

	-- Gnomish Cloaking Device -- 3971
	recipe = AddRecipe(3971, 200, 4397, Q.COMMON, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(7800)
	recipe:AddLimitedVendor(6777, 1)

	-- Large Seaforium Charge -- 3972
	recipe = AddRecipe(3972, 200, 4398, Q.UNCOMMON, V.ORIG, 200, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Silver Contact -- 3973
	recipe = AddRecipe(3973, 90, 4404, Q.COMMON, V.ORIG, 90, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Crude Scope -- 3977
	recipe = AddRecipe(3977, 60, 4405, Q.COMMON, V.ORIG, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Standard Scope -- 3978
	recipe = AddRecipe(3978, 110, 4406, Q.COMMON, V.ORIG, 110, 135, 147, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Accurate Scope -- 3979
	recipe = AddRecipe(3979, 180, 4407, Q.COMMON, V.ORIG, 180, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2685, 1)

	-- Ornate Spyglass -- 6458
	recipe = AddRecipe(6458, 135, 5507, Q.COMMON, V.ORIG, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Arclight Spanner -- 7430
	recipe = AddRecipe(7430, 50, 6219, Q.COMMON, V.ORIG, 50, 70, 80, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Flash Bomb -- 8243
	recipe = AddRecipe(8243, 185, 4852, Q.UNCOMMON, V.ORIG, 185, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)

	-- Practice Lock -- 8334
	recipe = AddRecipe(8334, 100, 6712, Q.COMMON, V.ORIG, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- EZ-Thro Dynamite -- 8339
	recipe = AddRecipe(8339, 100, 6714, Q.UNCOMMON, V.ORIG, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Goblin Rocket Boots -- 8895
	recipe = AddRecipe(8895, 225, 7189, Q.COMMON, V.ORIG, 225, 245, 255, 265, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(8126, 29513)

	-- Gnomish Universal Remote -- 9269
	recipe = AddRecipe(9269, 125, 7506, Q.COMMON, V.ORIG, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(7800)
	recipe:AddVendor(5175, 6730)

	-- Aquadynamic Fish Attractor -- 9271
	recipe = AddRecipe(9271, 150, 6533, Q.COMMON, V.ORIG, 150, 150, 160, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Goblin Jumper Cables -- 9273
	recipe = AddRecipe(9273, 165, 7148, Q.COMMON, V.ORIG, 165, 165, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7800)
	recipe:AddVendor(3134, 3537, 4086)

	-- Gold Power Core -- 12584
	recipe = AddRecipe(12584, 150, 10558, Q.COMMON, V.ORIG, 150, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Solid Blasting Powder -- 12585
	recipe = AddRecipe(12585, 175, 10505, Q.COMMON, V.ORIG, 175, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Solid Dynamite -- 12586
	recipe = AddRecipe(12586, 175, 10507, Q.COMMON, V.ORIG, 175, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Bright-Eye Goggles -- 12587
	recipe = AddRecipe(12587, 175, 10499, Q.UNCOMMON, V.ORIG, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mithril Tube -- 12589
	recipe = AddRecipe(12589, 195, 10559, Q.COMMON, V.ORIG, 195, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Gyromatic Micro-Adjustor -- 12590
	recipe = AddRecipe(12590, 175, 10498, Q.COMMON, V.ORIG, 175, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Unstable Trigger -- 12591
	recipe = AddRecipe(12591, 200, 10560, Q.COMMON, V.ORIG, 200, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fire Goggles -- 12594
	recipe = AddRecipe(12594, 205, 10500, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mithril Blunderbuss -- 12595
	recipe = AddRecipe(12595, 205, 10508, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Deadly Scope -- 12597
	recipe = AddRecipe(12597, 210, 10546, Q.COMMON, V.ORIG, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(8679, 1, 9544, 1)

	-- Mithril Casing -- 12599
	recipe = AddRecipe(12599, 215, 10561, Q.COMMON, V.ORIG, 215, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mithril Frag Bomb -- 12603
	recipe = AddRecipe(12603, 215, 10514, Q.COMMON, V.ORIG, 215, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Catseye Ultra Goggles -- 12607
	recipe = AddRecipe(12607, 220, 10501, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mithril Heavy-bore Rifle -- 12614
	recipe = AddRecipe(12614, 220, 10510, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Spellpower Goggles Xtreme -- 12615
	recipe = AddRecipe(12615, 225, 10502, Q.COMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Parachute Cloak -- 12616
	recipe = AddRecipe(12616, 225, 10518, Q.UNCOMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Deepdive Helmet -- 12617
	recipe = AddRecipe(12617, 230, 10506, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddCustom(48)

	-- Rose Colored Goggles -- 12618
	recipe = AddRecipe(12618, 230, 10503, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hi-Explosive Bomb -- 12619
	recipe = AddRecipe(12619, 235, 10562, Q.COMMON, V.ORIG, 235, 235, 255, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Sniper Scope -- 12620
	recipe = AddRecipe(12620, 240, 10548, Q.RARE, V.ORIG, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Lens -- 12622
	recipe = AddRecipe(12622, 245, 10504, Q.COMMON, V.ORIG, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Mithril Mechanical Dragonling -- 12624
	recipe = AddRecipe(12624, 250, 10576, Q.COMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(2688, 1, 35826, 1)

	-- Goblin Rocket Fuel Recipe -- 12715
	recipe = AddRecipe(12715, 205, 10644, Q.COMMON, V.ORIG, 205, 205, 205, 205, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 29513)

	-- Goblin Mortar -- 12716
	recipe = AddRecipe(12716, 205, 10577, Q.COMMON, V.ORIG, 205, 225, 235, 245, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Mining Helmet -- 12717
	recipe = AddRecipe(12717, 205, 10542, Q.COMMON, V.ORIG, 205, 225, 235, 245, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.MAIL)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Construction Helmet -- 12718
	recipe = AddRecipe(12718, 205, 10543, Q.COMMON, V.ORIG, 205, 225, 235, 245, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.CLOTH)
	recipe:AddTrainer(8126, 8738, 29513)

	-- The Big One -- 12754
	recipe = AddRecipe(12754, 235, 10586, Q.COMMON, V.ORIG, 235, 235, 255, 275, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Bomb Dispenser -- 12755
	recipe = AddRecipe(12755, 230, 10587, Q.COMMON, V.ORIG, 230, 230, 250, 270, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Rocket Helmet -- 12758
	recipe = AddRecipe(12758, 245, 10588, Q.COMMON, V.ORIG, 245, 265, 275, 285, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Gnomish Death Ray -- 12759
	recipe = AddRecipe(12759, 240, 10645, Q.COMMON, V.ORIG, 240, 260, 270, 280, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Goblin Sapper Charge -- 12760
	recipe = AddRecipe(12760, 205, 10646, Q.COMMON, V.ORIG, 205, 205, 225, 245, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 29513)

	-- Inlaid Mithril Cylinder Plans -- 12895
	recipe = AddRecipe(12895, 205, 10713, Q.COMMON, V.ORIG, 205, 205, 205, 205, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Goggles -- 12897
	recipe = AddRecipe(12897, 215, 10545, Q.COMMON, V.ORIG, 215, 230, 240, 250, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Shrink Ray -- 12899
	recipe = AddRecipe(12899, 205, 10716, Q.COMMON, V.ORIG, 205, 225, 235, 245, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Net-o-Matic Projector -- 12902
	recipe = AddRecipe(12902, 210, 10720, Q.COMMON, V.ORIG, 210, 230, 240, 250, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Harm Prevention Belt -- 12903
	recipe = AddRecipe(12903, 215, 10721, Q.COMMON, V.ORIG, 215, 235, 245, 255, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Rocket Boots -- 12905
	recipe = AddRecipe(12905, 210, 10724, Q.COMMON, V.ORIG, 210, 245, 255, 265, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Battle Chicken -- 12906
	recipe = AddRecipe(12906, 230, 10725, Q.COMMON, V.ORIG, 230, 250, 260, 270, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Mind Control Cap -- 12907
	recipe = AddRecipe(12907, 235, 10726, Q.COMMON, V.ORIG, 235, 255, 265, 275, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Goblin Dragon Gun -- 12908
	recipe = AddRecipe(12908, 240, 10727, Q.COMMON, V.ORIG, 240, 260, 270, 280, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- The Mortar: Reloaded -- 13240
	recipe = AddRecipe(13240, 205, 10577, Q.COMMON, V.ORIG, 205, 205, 205, 205, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738)

	-- Mechanical Repair Kit -- 15255
	recipe = AddRecipe(15255, 200, 11590, Q.COMMON, V.ORIG, 200, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Pet Bombling -- 15628
	recipe = AddRecipe(15628, 205, 11825, Q.UNCOMMON, V.ORIG, 205, 205, 205, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom(16)

	-- Lil' Smoky -- 15633
	recipe = AddRecipe(15633, 205, 11826, Q.UNCOMMON, V.ORIG, 205, 205, 205, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom(16)

	-- Salt Shaker -- 19567
	recipe = AddRecipe(19567, 250, 15846, Q.COMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Dense Blasting Powder -- 19788
	recipe = AddRecipe(19788, 250, 15992, Q.COMMON, V.ORIG, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Grenade -- 19790
	recipe = AddRecipe(19790, 260, 15993, Q.COMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Widget -- 19791
	recipe = AddRecipe(19791, 260, 15994, Q.COMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Rifle -- 19792
	recipe = AddRecipe(19792, 260, 15995, Q.COMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Lifelike Mechanical Toad -- 19793
	recipe = AddRecipe(19793, 265, 15996, Q.UNCOMMON, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Spellpower Goggles Xtreme Plus -- 19794
	recipe = AddRecipe(19794, 270, 15999, Q.COMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Thorium Tube -- 19795
	recipe = AddRecipe(19795, 275, 16000, Q.COMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Dark Iron Rifle -- 19796
	recipe = AddRecipe(19796, 275, 16004, Q.UNCOMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.GUN)
	recipe:AddMobDrop(8897)

	-- Dark Iron Bomb -- 19799
	recipe = AddRecipe(19799, 285, 16005, Q.UNCOMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8920)

	-- Masterwork Target Dummy -- 19814
	recipe = AddRecipe(19814, 275, 16023, Q.COMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)

	-- Delicate Arcanite Converter -- 19815
	recipe = AddRecipe(19815, 285, 16006, Q.COMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)

	-- Voice Amplification Modulator -- 19819
	recipe = AddRecipe(19819, 290, 16009, Q.UNCOMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.NECK)
	recipe:AddMobDrop(10426)

	-- Master Engineer's Goggles -- 19825
	recipe = AddRecipe(19825, 290, 16008, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Arcanite Dragonling -- 19830
	recipe = AddRecipe(19830, 300, 16022, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddLimitedVendor(35826, 1)

	-- Arcane Bomb -- 19831
	recipe = AddRecipe(19831, 300, 16040, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Flawless Arcanite Rifle -- 19833
	recipe = AddRecipe(19833, 300, 16007, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddMobDrop(8561)

	-- Snowmaster 9000 -- 21940
	recipe = AddRecipe(21940, 190, 17716, Q.UNCOMMON, V.ORIG, 190, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE)
	recipe:AddSeason(1)

	-- Field Repair Bot 74A -- 22704
	recipe = AddRecipe(22704, 300, 18232, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddCustom(17)

	-- Biznicks 247x128 Accurascope -- 22793
	recipe = AddRecipe(22793, 300, 18283, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom(26)

	-- Core Marksman Rifle -- 22795
	recipe = AddRecipe(22795, 300, 18282, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.GUN)
	recipe:AddCustom(26)

	-- Force Reactive Disk -- 22797
	recipe = AddRecipe(22797, 300, 18168, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK, F.SHIELD, F.ONE_HAND)
	recipe:AddCustom(26)

	-- Red Firework -- 23066
	recipe = AddRecipe(23066, 150, 9318, Q.COMMON, V.ORIG, 150, 150, 162, 175)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3413)

	-- Blue Firework -- 23067
	recipe = AddRecipe(23067, 150, 9312, Q.COMMON, V.ORIG, 150, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(5175)

	-- Green Firework -- 23068
	recipe = AddRecipe(23068, 150, 9313, Q.COMMON, V.ORIG, 150, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2838, 1, 3495, 1)

	-- EZ-Thro Dynamite II -- 23069
	recipe = AddRecipe(23069, 200, 18588, Q.COMMON, V.ORIG, 200, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(8131)

	-- Dense Dynamite -- 23070
	recipe = AddRecipe(23070, 250, 18641, Q.COMMON, V.ORIG, 250, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Truesilver Transformer -- 23071
	recipe = AddRecipe(23071, 260, 18631, Q.COMMON, V.ORIG, 260, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Gyrofreeze Ice Reflector -- 23077
	recipe = AddRecipe(23077, 260, 18634, Q.COMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddVendor(11185)

	-- Goblin Jumper Cables XL -- 23078
	recipe = AddRecipe(23078, 265, 18587, Q.UNCOMMON, V.ORIG, 265, 285, 295, 305, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(9499)

	-- Major Recombobulator -- 23079
	recipe = AddRecipe(23079, 275, 18637, Q.UNCOMMON, V.ORIG, 275, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddCustom(32)

	-- Powerful Seaforium Charge -- 23080
	recipe = AddRecipe(23080, 275, 18594, Q.COMMON, V.ORIG, 275, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185)

	-- Hyper-Radiant Flame Reflector -- 23081
	recipe = AddRecipe(23081, 290, 18638, Q.UNCOMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(10264)

	-- Ultra-Flash Shadow Reflector -- 23082
	recipe = AddRecipe(23082, 300, 18639, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddMobDrop(10426)

	-- Gnomish Alarm-o-Bot -- 23096
	recipe = AddRecipe(23096, 265, 18645, Q.UNCOMMON, V.ORIG, 265, 275, 280, 285, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8920)

	-- World Enlarger -- 23129
	recipe = AddRecipe(23129, 260, 18660, Q.UNCOMMON, V.ORIG, 260, 260, 265, 270, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8920)

	-- Dimensional Ripper - Everlook -- 23486
	recipe = AddRecipe(23486, 260, 18984, Q.COMMON, V.ORIG, 260, 285, 295, 305, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(14742)

	-- Ultrasafe Transporter - Gadgetzan -- 23489
	recipe = AddRecipe(23489, 260, 18986, Q.COMMON, V.ORIG, 260, 285, 295, 305, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(14743)

	-- Snake Burst Firework -- 23507
	recipe = AddRecipe(23507, 250, 19026, Q.COMMON, V.ORIG, 250, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(14637)

	-- Bloodvine Goggles -- 24356
	recipe = AddRecipe(24356, 300, 19999, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddCustom(48)

	-- Bloodvine Lens -- 24357
	recipe = AddRecipe(24357, 300, 19998, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom(48)

	-- Tranquil Mechanical Yeti -- 26011
	recipe = AddRecipe(26011, 250, 21277, Q.COMMON, V.ORIG, 250, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(8798)

	-- Small Blue Rocket -- 26416
	recipe = AddRecipe(26416, 125, 21558, Q.UNCOMMON, V.ORIG, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Small Green Rocket -- 26417
	recipe = AddRecipe(26417, 125, 21559, Q.UNCOMMON, V.ORIG, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Small Red Rocket -- 26418
	recipe = AddRecipe(26418, 125, 21557, Q.UNCOMMON, V.ORIG, 125, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Large Blue Rocket -- 26420
	recipe = AddRecipe(26420, 175, 21589, Q.UNCOMMON, V.ORIG, 175, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Large Green Rocket -- 26421
	recipe = AddRecipe(26421, 175, 21590, Q.UNCOMMON, V.ORIG, 175, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Large Red Rocket -- 26422
	recipe = AddRecipe(26422, 175, 21592, Q.UNCOMMON, V.ORIG, 175, 175, 187, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Blue Rocket Cluster -- 26423
	recipe = AddRecipe(26423, 225, 21571, Q.UNCOMMON, V.ORIG, 225, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Green Rocket Cluster -- 26424
	recipe = AddRecipe(26424, 225, 21574, Q.UNCOMMON, V.ORIG, 225, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Red Rocket Cluster -- 26425
	recipe = AddRecipe(26425, 225, 21576, Q.UNCOMMON, V.ORIG, 225, 225, 237, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Large Blue Rocket Cluster -- 26426
	recipe = AddRecipe(26426, 275, 21714, Q.UNCOMMON, V.ORIG, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Large Green Rocket Cluster -- 26427
	recipe = AddRecipe(26427, 275, 21716, Q.UNCOMMON, V.ORIG, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Large Red Rocket Cluster -- 26428
	recipe = AddRecipe(26428, 275, 21718, Q.UNCOMMON, V.ORIG, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Firework Launcher -- 26442
	recipe = AddRecipe(26442, 225, 21569, Q.UNCOMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Cluster Launcher -- 26443
	recipe = AddRecipe(26443, 275, 21570, Q.UNCOMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP)
	recipe:AddVendor(15909)
	recipe:AddSeason(2)

	-- Steam Tonk Controller -- 28327
	recipe = AddRecipe(28327, 275, 22728, Q.COMMON, V.ORIG, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddVendor(3413, 5175)
	recipe:AddQuest(9249)

	-- Elemental Blasting Powder -- 30303
	recipe = AddRecipe(30303, 300, 23781, Q.COMMON, V.TBC, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fel Iron Casing -- 30304
	recipe = AddRecipe(30304, 300, 23782, Q.COMMON, V.TBC, 300, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Handful of Fel Iron Bolts -- 30305
	recipe = AddRecipe(30305, 300, 23783, Q.COMMON, V.TBC, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Adamantite Frame -- 30306
	recipe = AddRecipe(30306, 325, 23784, Q.COMMON, V.TBC, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Hardened Adamantite Tube -- 30307
	recipe = AddRecipe(30307, 340, 23785, Q.COMMON, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Khorium Power Core -- 30308
	recipe = AddRecipe(30308, 340, 23786, Q.COMMON, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Felsteel Stabilizer -- 30309
	recipe = AddRecipe(30309, 340, 23787, Q.COMMON, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fel Iron Bomb -- 30310
	recipe = AddRecipe(30310, 300, 23736, Q.COMMON, V.TBC, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Adamantite Grenade -- 30311
	recipe = AddRecipe(30311, 325, 23737, Q.COMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Fel Iron Musket -- 30312
	recipe = AddRecipe(30312, 320, 23742, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Adamantite Rifle -- 30313
	recipe = AddRecipe(30313, 350, 23746, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddVendor(16657, 16782, 19661)

	-- Felsteel Boomstick -- 30314
	recipe = AddRecipe(30314, 360, 23747, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.GUN)
	recipe:AddMobDrop(19960)

	-- Ornate Khorium Rifle -- 30315
	recipe = AddRecipe(30315, 375, 23748, Q.RARE, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.GUN)
	recipe:AddWorldDrop("Outland")

	-- Cogspinner Goggles -- 30316
	recipe = AddRecipe(30316, 340, 23758, Q.COMMON, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(18775, 19836)

	-- Power Amplification Goggles -- 30317
	recipe = AddRecipe(30317, 340, 23761, Q.RARE, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddWorldDrop("Outland")

	-- Ultra-Spectropic Detection Goggles -- 30318
	recipe = AddRecipe(30318, 350, 23762, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CLOTH)
	recipe:AddVendor(18775, 19383)

	-- Hyper-Vision Goggles -- 30325
	recipe = AddRecipe(30325, 360, 23763, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(19755)

	-- Adamantite Scope -- 30329
	recipe = AddRecipe(30329, 335, 23764, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(19351, 19836)

	-- Khorium Scope -- 30332
	recipe = AddRecipe(30332, 360, 23765, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(20207)

	-- Stabilized Eternium Scope -- 30334
	recipe = AddRecipe(30334, 375, 23766, Q.RARE, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(16152)

	-- Crashin' Thrashin' Robot -- 30337
	recipe = AddRecipe(30337, 325, 23767, Q.UNCOMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- White Smoke Flare -- 30341
	recipe = AddRecipe(30341, 335, 23768, Q.COMMON, V.TBC, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16657, 16782, 18484, 19383)

	-- Green Smoke Flare -- 30344
	recipe = AddRecipe(30344, 335, 23771, Q.COMMON, V.TBC, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.FRIENDLY, 17904)

	-- Fel Iron Toolbox -- 30348
	recipe = AddRecipe(30348, 325, 23774, Q.COMMON, V.TBC, 325, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16657, 16782, 18484)

	-- Titanium Toolbox -- 30349
	recipe = AddRecipe(30349, 405, 23775, Q.COMMON, V.WOTLK, 405, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(28722)

	-- Elemental Seaforium Charge -- 30547
	recipe = AddRecipe(30547, 350, 23819, Q.COMMON, V.TBC, 350, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CONSORTIUM)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Zapthrottle Mote Extractor -- 30548
	recipe = AddRecipe(30548, 305, 23821, Q.COMMON, V.TBC, 305, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(9635, 9636)

	-- Healing Potion Injector -- 30551
	recipe = AddRecipe(30551, 330, 33092, Q.RARE, V.TBC, 330, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)

	-- Mana Potion Injector -- 30552
	recipe = AddRecipe(30552, 345, 33093, Q.RARE, V.TBC, 345, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)

	-- Rocket Boots Xtreme -- 30556
	recipe = AddRecipe(30556, 355, 23824, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(17796)

	-- The Bigger One -- 30558
	recipe = AddRecipe(30558, 325, 23826, Q.COMMON, V.TBC, 325, 325, 335, 345, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Super Sapper Charge -- 30560
	recipe = AddRecipe(30560, 340, 23827, Q.COMMON, V.TBC, 340, 340, 350, 360, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Goblin Rocket Launcher -- 30563
	recipe = AddRecipe(30563, 350, 23836, Q.COMMON, V.TBC, 350, 360, 370, 380, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Foreman's Enchanted Helmet -- 30565
	recipe = AddRecipe(30565, 375, 23838, Q.COMMON, V.TBC, 375, 375, 385, 395, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Foreman's Reinforced Helmet -- 30566
	recipe = AddRecipe(30566, 375, 23839, Q.COMMON, V.TBC, 375, 375, 385, 395, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(8126, 8738, 29513)

	-- Gnomish Flame Turret -- 30568
	recipe = AddRecipe(30568, 325, 23841, Q.COMMON, V.TBC, 325, 335, 345, 355, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Poultryizer -- 30569
	recipe = AddRecipe(30569, 340, 23835, Q.COMMON, V.TBC, 340, 360, 370, 380, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Nigh-Invulnerability Belt -- 30570
	recipe = AddRecipe(30570, 350, 23825, Q.COMMON, V.TBC, 350, 360, 370, 380, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Power Goggles -- 30574
	recipe = AddRecipe(30574, 375, 23828, Q.COMMON, V.TBC, 375, 375, 385, 395, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Gnomish Battle Goggles -- 30575
	recipe = AddRecipe(30575, 375, 23829, Q.COMMON, V.TBC, 375, 375, 385, 395, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(7406, 7944, 29514)

	-- Purple Smoke Flare -- 32814
	recipe = AddRecipe(32814, 335, 25886, Q.UNCOMMON, V.TBC, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Dimensional Ripper - Area 52 -- 36954
	recipe = AddRecipe(36954, 350, 30542, Q.COMMON, V.TBC, 350, 350, 360, 370, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(21493)

	-- Ultrasafe Transporter - Toshley's Station -- 36955
	recipe = AddRecipe(36955, 350, 30544, Q.COMMON, V.TBC, 350, 350, 360, 370, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(21494)

	-- Fused Wiring -- 39895
	recipe = AddRecipe(39895, 275, 7191, Q.COMMON, V.TBC, 275, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(11185, 19661)

	-- Icy Blasting Primers -- 39971
	recipe = AddRecipe(39971, 335, 32423, Q.COMMON, V.TBC, 335, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Frost Grenades -- 39973
	recipe = AddRecipe(39973, 335, 32413, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Furious Gizmatic Goggles -- 40274
	recipe = AddRecipe(40274, 350, 32461, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26955, 28697, 33586)

	-- Gyro-balanced Khorium Destroyer -- 41307
	recipe = AddRecipe(41307, 375, 32756, Q.COMMON, V.TBC, 375, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.GUN)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Justicebringer 2000 Specs -- 41311
	recipe = AddRecipe(41311, 350, 32472, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.PALADIN, F.PLATE)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Tankatronic Goggles -- 41312
	recipe = AddRecipe(41312, 350, 32473, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Surestrike Goggles v2.0 -- 41314
	recipe = AddRecipe(41314, 350, 32474, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Gadgetstorm Goggles -- 41315
	recipe = AddRecipe(41315, 350, 32476, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Living Replicator Specs -- 41316
	recipe = AddRecipe(41316, 350, 32475, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Deathblow X11 Goggles -- 41317
	recipe = AddRecipe(41317, 350, 32478, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.ROGUE, F.LEATHER)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Wonderheal XT40 Shades -- 41318
	recipe = AddRecipe(41318, 350, 32479, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Magnified Moon Specs -- 41319
	recipe = AddRecipe(41319, 350, 32480, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Destruction Holo-gogs -- 41320
	recipe = AddRecipe(41320, 350, 32494, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Powerheal 4000 Lens -- 41321
	recipe = AddRecipe(41321, 350, 32495, Q.COMMON, V.TBC, 350, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.PRIEST, F.CLOTH)
	recipe:AddTrainer(17634, 17637, 18752, 18775, 19576, 25277, 26907, 26955, 26991, 28697, 33586)

	-- Adamantite Arrow Maker -- 43676
	recipe = AddRecipe(43676, 335, 20475, Q.UNCOMMON, V.TBC, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19707)
	recipe:AddCustom(46)

	-- Flying Machine -- 44155
	recipe = AddRecipe(44155, 300, 34060, Q.COMMON, V.TBC, 300, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(24868, 25099, 25277, 26955, 28697, 33586)

	-- Turbo-Charged Flying Machine -- 44157
	recipe = AddRecipe(44157, 375, 34061, Q.COMMON, V.TBC, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(24868, 25099)

	-- Field Repair Bot 110G -- 44391
	recipe = AddRecipe(44391, 360, 34113, Q.UNCOMMON, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(23385, 23386)

	-- Wonderheal XT68 Shades -- 46106
	recipe = AddRecipe(46106, 375, 35183, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddCustom(24)

	-- Justicebringer 3000 Specs -- 46107
	recipe = AddRecipe(46107, 375, 35185, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.PALADIN, F.PLATE)
	recipe:AddCustom(24)

	-- Powerheal 9000 Lens -- 46108
	recipe = AddRecipe(46108, 375, 35181, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.PRIEST, F.CLOTH)
	recipe:AddCustom(24)

	-- Hyper-Magnified Moon Specs -- 46109
	recipe = AddRecipe(46109, 375, 35182, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddCustom(24)

	-- Primal-Attuned Goggles -- 46110
	recipe = AddRecipe(46110, 375, 35184, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddCustom(24)

	-- Annihilator Holo-Gogs -- 46111
	recipe = AddRecipe(46111, 375, 34847, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddCustom(24)

	-- Lightning Etched Specs -- 46112
	recipe = AddRecipe(46112, 375, 34355, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddCustom(24)

	-- Surestrike Goggles v3.0 -- 46113
	recipe = AddRecipe(46113, 375, 34356, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddCustom(24)

	-- Mayhem Projection Goggles -- 46114
	recipe = AddRecipe(46114, 375, 34354, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DPS, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddCustom(24)

	-- Hard Khorium Goggles -- 46115
	recipe = AddRecipe(46115, 375, 34357, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.TANK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddCustom(24)

	-- Quad Deathblow X44 Goggles -- 46116
	recipe = AddRecipe(46116, 375, 34353, Q.EPIC, V.TBC, 375, 390, 410, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOP, F.DRUID, F.ROGUE, F.LEATHER)
	recipe:AddCustom(24)

	-- Rocket Boots Xtreme Lite -- 46697
	recipe = AddRecipe(46697, 355, 35581, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOTH)
	recipe:AddMobDrop(19219)

	-- Volatile Blasting Trigger -- 53281
	recipe = AddRecipe(53281, 350, 39690, Q.COMMON, V.TBC, 350, 366, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mark "S" Boomstick -- 54353
	recipe = AddRecipe(54353, 400, 39688, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.GUN)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Personal Electromagnetic Pulse Generator -- 54736
	recipe = AddRecipe(54736, 390, nil, Q.COMMON, V.WOTLK, 390, 390, 392, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Frag Belt -- 54793
	recipe = AddRecipe(54793, 380, nil, Q.COMMON, V.WOTLK, 380, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Hand-Mounted Pyro Rocket -- 54998
	recipe = AddRecipe(54998, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Hyperspeed Accelerators -- 54999
	recipe = AddRecipe(54999, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Flexweave Underlay -- 55002
	recipe = AddRecipe(55002, 380, nil, Q.COMMON, V.WOTLK, 380, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Nitro Boosts -- 55016
	recipe = AddRecipe(55016, 405, nil, Q.COMMON, V.WOTLK, 405, 405, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Scrapbot Construction Kit -- 55252
	recipe = AddRecipe(55252, 415, 40769, Q.COMMON, V.WOTLK, 415, 415, 417, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(12889)

	-- Handful of Cobalt Bolts -- 56349
	recipe = AddRecipe(56349, 350, 39681, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Hammer Pick -- 56459
	recipe = AddRecipe(56459, 375, 40892, Q.COMMON, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Cobalt Frag Bomb -- 56460
	recipe = AddRecipe(56460, 350, 40771, Q.COMMON, V.TBC, 350, 375, 382, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Bladed Pickaxe -- 56461
	recipe = AddRecipe(56461, 375, 40893, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Gnomish Army Knife -- 56462
	recipe = AddRecipe(56462, 435, 40772, Q.COMMON, V.WOTLK, 435, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Explosive Decoy -- 56463
	recipe = AddRecipe(56463, 375, 40536, Q.COMMON, V.WOTLK, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Overcharged Capacitor -- 56464
	recipe = AddRecipe(56464, 375, 39682, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechanized Snow Goggles -- 56465
	recipe = AddRecipe(56465, 420, 41112, Q.COMMON, V.WOTLK, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Sonic Booster -- 56466
	recipe = AddRecipe(56466, 420, 40767, Q.COMMON, V.WOTLK, 420, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Noise Machine -- 56467
	recipe = AddRecipe(56467, 420, 40865, Q.COMMON, V.WOTLK, 420, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Box of Bombs -- 56468
	recipe = AddRecipe(56468, 405, 41119, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Gnomish Lightning Generator -- 56469
	recipe = AddRecipe(56469, 425, 41121, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TRINKET)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Sun Scope -- 56470
	recipe = AddRecipe(56470, 425, 41146, Q.COMMON, V.WOTLK, 425, 430, 432, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Froststeel Tube -- 56471
	recipe = AddRecipe(56471, 390, 39683, Q.COMMON, V.WOTLK, 390, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- MOLL-E -- 56472
	recipe = AddRecipe(56472, 425, 40768, Q.COMMON, V.WOTLK, 425, 430, 432, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Gnomish X-Ray Specs -- 56473
	recipe = AddRecipe(56473, 425, 40895, Q.COMMON, V.WOTLK, 425, 430, 435, 440, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26907, 26955, 29514)

	-- Healing Injector Kit -- 56476
	recipe = AddRecipe(56476, 410, 37567, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mana Injector Kit -- 56477
	recipe = AddRecipe(56477, 415, 42546, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Heartseeker Scope -- 56478
	recipe = AddRecipe(56478, 430, 41167, Q.COMMON, V.WOTLK, 430, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Armor Plated Combat Shotgun -- 56479
	recipe = AddRecipe(56479, 450, 41168, Q.COMMON, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.GUN)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Armored Titanium Goggles -- 56480
	recipe = AddRecipe(56480, 440, 42549, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TANK, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Weakness Spectralizers -- 56481
	recipe = AddRecipe(56481, 440, 42550, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Charged Titanium Specs -- 56483
	recipe = AddRecipe(56483, 440, 42552, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Visage Liquification Goggles -- 56484
	recipe = AddRecipe(56484, 440, 42553, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAGE, F.PRIEST, F.WARLOCK, F.CLOTH)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Greensight Gogs -- 56486
	recipe = AddRecipe(56486, 440, 42554, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DRUID, F.LEATHER)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Electroflux Sight Enhancers -- 56487
	recipe = AddRecipe(56487, 440, 42555, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Global Thermal Sapper Charge -- 56514
	recipe = AddRecipe(56514, 425, 42641, Q.COMMON, V.WOTLK, 425, 425, 430, 435, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 29513)

	-- Truesight Ice Blinders -- 56574
	recipe = AddRecipe(56574, 440, 42551, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechano-Hog -- 60866
	recipe = AddRecipe(60866, 450, 41508, Q.EPIC, V.WOTLK, 450, 480, 485, 490, "Horde")
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.WRATHCOMMON1)
	recipe:AddRepVendor(FAC.HORDE_EXPEDITION, REP.EXALTED, 32565, 32774)

	-- Mekgineer's Chopper -- 60867
	recipe = AddRecipe(60867, 450, 44413, Q.EPIC, V.WOTLK, 450, 480, 485, 490, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.WRATHCOMMON1)
	recipe:AddRepVendor(FAC.ALLIANCE_VANGUARD, REP.EXALTED, 32564, 32773)

	-- Nesingwary 4000 -- 60874
	recipe = AddRecipe(60874, 450, 44504, Q.COMMON, V.WOTLK, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.GUN)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Diamond-cut Refractor Scope -- 61471
	recipe = AddRecipe(61471, 390, 44739, Q.COMMON, V.WOTLK, 390, 400, 407, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechanized Snow Goggles -- 61481
	recipe = AddRecipe(61481, 420, 44742, Q.COMMON, V.WOTLK, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID, F.ROGUE, F.LEATHER)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechanized Snow Goggles -- 61482
	recipe = AddRecipe(61482, 420, 44742, Q.COMMON, V.WOTLK, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HUNTER, F.SHAMAN, F.MAIL)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Mechanized Snow Goggles -- 61483
	recipe = AddRecipe(61483, 420, 44742, Q.COMMON, V.WOTLK, 420, 425, 432, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK, F.PALADIN, F.WARRIOR, F.PLATE)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Unbreakable Healing Amplifiers -- 62271
	recipe = AddRecipe(62271, 440, 44949, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.PALADIN, F.PLATE)
	recipe:AddTrainer(25277, 26907, 26955)

	-- High-powered Flashlight -- 63750
	recipe = AddRecipe(63750, 250, 45631, Q.COMMON, V.WOTLK, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(1676, 1702, 3290, 3494, 5174, 5518, 8736, 11017, 11025, 11031, 11037, 16667, 16726, 17222, 17634, 17637, 25277, 26907, 26955, 26991, 28697, 33586, 33611, 33634)

	-- Reticulated Armor Webbing -- 63770
	recipe = AddRecipe(63770, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK)
	recipe:AddTrainer(25277, 26907, 26955, 26991, 28697, 33586)

	-- Goblin Beam Welder -- 67326
	recipe = AddRecipe(67326, 410, 47828, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(25277, 26955, 28697, 33586)

	-- Mind Amplification Dish -- 67839
	recipe = AddRecipe(67839, 410, nil, Q.COMMON, V.WOTLK, 410, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(25277, 26955, 28697, 33586)

	-- Wormhole Generator: Northrend -- 67920
	recipe = AddRecipe(67920, 435, 48933, Q.COMMON, V.WOTLK, 435, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(25277, 26955, 28697, 33586)

	-- Jeeves -- 68067
	recipe = AddRecipe(68067, 450, 49050, Q.RARE, V.WOTLK, 450, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOP, F.RBOP)
	recipe:AddWorldDrop("Northrend")

	-- Reinforced Bio-Optic Killshades -- 81714
	recipe = AddRecipe(81714, 525, 59359, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.PALADIN, F.WARRIOR)
	recipe:AddTrainer(5518, 11017)

	-- Specialized Bio-Optic Killshades -- 81715
	recipe = AddRecipe(81715, 525, 59448, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(5518, 11017)

	-- Deadly Bio-Optic Killshades -- 81716
	recipe = AddRecipe(81716, 525, 59456, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HUNTER, F.SHAMAN)
	recipe:AddTrainer(5518, 11017)

	-- Energized Bio-Optic Killshades -- 81720
	recipe = AddRecipe(81720, 525, 59458, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(5518, 11017)

	-- Agile Bio-Optic Killshades -- 81722
	recipe = AddRecipe(81722, 525, 59455, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID, F.ROGUE)
	recipe:AddTrainer(5518, 11017)

	-- Camouflage Bio-Optic Killshades -- 81724
	recipe = AddRecipe(81724, 525, 59453, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(5518, 11017)

	-- Lightweight Bio-Optic Killshades -- 81725
	recipe = AddRecipe(81725, 525, 59449, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAGE, F.PRIEST, F.WARLOCK)
	recipe:AddTrainer(5518, 11017)

	-- Synapse Springs -- 82175
	recipe = AddRecipe(82175, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Quickflip Deflection Plates -- 82177
	recipe = AddRecipe(82177, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Tazik Shocker -- 82180
	recipe = AddRecipe(82180, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Spinal Healing Injector -- 82200
	recipe = AddRecipe(82200, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Z50 Mana Gulper -- 82201
	recipe = AddRecipe(82201, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Handful of Obsidium Bolts -- 84403
	recipe = AddRecipe(84403, 425, 60224, Q.COMMON, V.CATA, 425, 435, 442, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Authentic Jr. Engineer Goggles -- 84406
	recipe = AddRecipe(84406, 440, 60222, Q.COMMON, V.CATA, 440, 455, 457, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- R19 Threatfinder -- 84408
	recipe = AddRecipe(84408, 450, 59595, Q.COMMON, V.CATA, 450, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Volatile Seaforium Blastpack -- 84409
	recipe = AddRecipe(84409, 455, 60853, Q.COMMON, V.CATA, 455, 460, 467, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Safety Catch Removal Kit -- 84410
	recipe = AddRecipe(84410, 450, 59596, Q.COMMON, V.CATA, 450, 470, 472, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- High-Powered Bolt Gun -- 84411
	recipe = AddRecipe(84411, 465, 60223, Q.COMMON, V.CATA, 465, 465, 465, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Personal World Destroyer -- 84412
	recipe = AddRecipe(84412, 475, 59597, Q.COMMON, V.CATA, 475, 495, 497, 500, 20222)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(29513)

	-- De-Weaponized Mechanical Companion -- 84413
	recipe = AddRecipe(84413, 475, 60216, Q.COMMON, V.CATA, 475, 495, 497, 500, 20219)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(7944, 29514)

	-- Lure Master Tackle Box -- 84415
	recipe = AddRecipe(84415, 475, 60218, Q.COMMON, V.CATA, 475, 490, 492, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Elementium Toolbox -- 84416
	recipe = AddRecipe(84416, 475, 60217, Q.COMMON, V.CATA, 475, 495, 497, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Volatile Thunderstick -- 84417
	recipe = AddRecipe(84417, 495, 59599, Q.COMMON, V.CATA, 495, 515, 517, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Elementium Dragonling -- 84418
	recipe = AddRecipe(84418, 475, 60403, Q.COMMON, V.CATA, 475, 505, 507, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Finely-Tuned Throat Needler -- 84420
	recipe = AddRecipe(84420, 490, 59598, Q.COMMON, V.CATA, 490, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Loot-a-Rang -- 84421
	recipe = AddRecipe(84421, 490, 60854, Q.COMMON, V.CATA, 490, 495, 497, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Invisibility Field -- 84424
	recipe = AddRecipe(84424, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Cardboard Assassin -- 84425
	recipe = AddRecipe(84425, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Grounded Plasma Shield -- 84427
	recipe = AddRecipe(84427, 425, nil, Q.COMMON, V.CATA, 425, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOP, F.RBOP)
	recipe:AddCustom(51)

	-- Gnomish X-Ray Scope -- 84428
	recipe = AddRecipe(84428, 515, 59594, Q.COMMON, V.CATA, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Goblin Barbecue -- 84429
	recipe = AddRecipe(84429, 505, 60858, Q.COMMON, V.CATA, 505, 505, 505, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Heat-Treated Spinning Lure -- 84430
	recipe = AddRecipe(84430, 510, 68049, Q.COMMON, V.CATA, 510, 510, 520, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Overpowered Chicken Splitter -- 84431
	recipe = AddRecipe(84431, 525, 59364, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Kickback 5000 -- 84432
	recipe = AddRecipe(84432, 525, 59367, Q.COMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Electrified Ether -- 94748
	recipe = AddRecipe(94748, 445, 67749, Q.COMMON, V.CATA, 445, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	-- Electrostatic Condenser -- 95703
	recipe = AddRecipe(95703, 440, 67494, Q.COMMON, V.CATA, 440, 450, 452, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(5518, 11017)

	self.InitEngineering = nil
end
