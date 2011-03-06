--[[
************************************************************************
Alchemy.lua
************************************************************************
File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]] --

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local MODNAME = "Ackis Recipe List"
local addon = LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L = LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.filter_flags
local A = private.acquire_types
local Q = private.item_qualities
local REP = private.rep_levels
local FAC = private.faction_ids
local V = private.game_versions

local initialized = false
local num_recipes = 0

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level)
	num_recipes = num_recipes + 1
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 51304, nil, genesis, optimal_level, medium_level, easy_level, trivial_level)
end

function addon:InitAlchemy()
	if initialized then
		return num_recipes
	end
	initialized = true

	local recipe

	-- Elixir of Lion's Strength -- 2329
	recipe = AddRecipe(2329, 1, 2454, Q.COMMON, V.ORIG, 1, 55, 75, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom(8)

	-- Minor Healing Potion -- 2330
	recipe = AddRecipe(2330, 1, 118, Q.COMMON, V.ORIG, 1, 55, 75, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Minor Mana Potion -- 2331
	recipe = AddRecipe(2331, 25, 2455, Q.COMMON, V.ORIG, 25, 65, 85, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Minor Rejuvenation Potion -- 2332
	recipe = AddRecipe(2332, 40, 2456, Q.COMMON, V.ORIG, 40, 70, 90, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Lesser Agility -- 2333
	recipe = AddRecipe(2333, 140, 3390, Q.UNCOMMON, V.ORIG, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Minor Fortitude -- 2334
	recipe = AddRecipe(2334, 50, 2458, Q.COMMON, V.ORIG, 50, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Swiftness Potion -- 2335
	recipe = AddRecipe(2335, 60, 2459, Q.UNCOMMON, V.ORIG, 60, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lesser Healing Potion -- 2337
	recipe = AddRecipe(2337, 55, 858, Q.COMMON, V.ORIG, 55, 85, 105, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Weak Troll's Blood Elixir -- 3170
	recipe = AddRecipe(3170, 15, 3382, Q.COMMON, V.ORIG, 15, 60, 80, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Wisdom -- 3171
	recipe = AddRecipe(3171, 90, 3383, Q.COMMON, V.ORIG, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Minor Magic Resistance Potion -- 3172
	recipe = AddRecipe(3172, 110, 3384, Q.COMMON, V.ORIG, 110, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lesser Mana Potion -- 3173
	recipe = AddRecipe(3173, 120, 3385, Q.COMMON, V.ORIG, 120, 145, 165, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Potion of Curing -- 3174
	recipe = AddRecipe(3174, 120, 3386, Q.COMMON, V.ORIG, 120, 145, 165, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Limited Invulnerability Potion -- 3175
	recipe = AddRecipe(3175, 250, 3387, Q.UNCOMMON, V.ORIG, 250, 275, 295, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Strong Troll's Blood Elixir -- 3176
	recipe = AddRecipe(3176, 125, 3388, Q.COMMON, V.ORIG, 125, 150, 170, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Defense -- 3177
	recipe = AddRecipe(3177, 130, 3389, Q.COMMON, V.ORIG, 130, 155, 175, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Ogre's Strength -- 3188
	recipe = AddRecipe(3188, 150, 3391, Q.COMMON, V.ORIG, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Minor Agility -- 3230
	recipe = AddRecipe(3230, 50, 2457, Q.UNCOMMON, V.ORIG, 50, 80, 100, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Healing Potion -- 3447
	recipe = AddRecipe(3447, 110, 929, Q.COMMON, V.ORIG, 110, 135, 155, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Lesser Invisibility Potion -- 3448
	recipe = AddRecipe(3448, 165, 3823, Q.COMMON, V.ORIG, 165, 185, 205, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Shadow Oil -- 3449
	recipe = AddRecipe(3449, 165, 3824, Q.COMMON, V.ORIG, 165, 190, 210, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(4878, 1)

	-- Elixir of Fortitude -- 3450
	recipe = AddRecipe(3450, 175, 3825, Q.COMMON, V.ORIG, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Major Troll's Blood Elixir -- 3451
	recipe = AddRecipe(3451, 180, 3826, Q.UNCOMMON, V.ORIG, 180, 200, 220, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mana Potion -- 3452
	recipe = AddRecipe(3452, 160, 3827, Q.COMMON, V.ORIG, 160, 180, 200, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Detect Lesser Invisibility -- 3453
	recipe = AddRecipe(3453, 195, 3828, Q.UNCOMMON, V.ORIG, 195, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Frost Oil -- 3454
	recipe = AddRecipe(3454, 200, 3829, Q.UNCOMMON, V.ORIG, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2480, 1)

	-- Discolored Healing Potion -- 4508
	recipe = AddRecipe(4508, 50, 4596, Q.UNCOMMON, V.ORIG, 50, 80, 100, 120)
	recipe:AddFilters(F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom(48)

	-- Lesser Stoneshield Potion -- 4942
	recipe = AddRecipe(4942, 215, 4623, Q.COMMON, V.ORIG, 215, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom(48)

	-- Rage Potion -- 6617
	recipe = AddRecipe(6617, 60, 5631, Q.COMMON, V.ORIG, 60, 90, 110, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddVendor(1685, 3335, 3499)

	-- Great Rage Potion -- 6618
	recipe = AddRecipe(6618, 175, 5633, Q.COMMON, V.ORIG, 175, 195, 215, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddVendor(3335, 4226)

	-- Free Action Potion -- 6624
	recipe = AddRecipe(6624, 150, 5634, Q.COMMON, V.ORIG, 150, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3348, 1, 4226, 1, 5178, 1)

	-- Elixir of Water Breathing -- 7179
	recipe = AddRecipe(7179, 90, 5996, Q.COMMON, V.ORIG, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Greater Healing Potion -- 7181
	recipe = AddRecipe(7181, 155, 1710, Q.COMMON, V.ORIG, 155, 175, 195, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Minor Defense -- 7183
	recipe = AddRecipe(7183, 1, 5997, Q.COMMON, V.ORIG, 1, 55, 75, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom(8)

	-- Holy Protection Potion -- 7255
	recipe = AddRecipe(7255, 100, 6051, Q.COMMON, V.ORIG, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(1685, 1, 3134, 1, 3490, 1)

	-- Shadow Protection Potion -- 7256
	recipe = AddRecipe(7256, 135, 6048, Q.COMMON, V.ORIG, 135, 160, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2393, 1, 3956, 1)

	-- Fire Protection Potion -- 7257
	recipe = AddRecipe(7257, 165, 6049, Q.COMMON, V.ORIG, 165, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2380, 1, 4083, 1)

	-- Frost Protection Potion -- 7258
	recipe = AddRecipe(7258, 190, 6050, Q.COMMON, V.ORIG, 190, 205, 225, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2812, 1, 2848, 1)

	-- Nature Protection Potion -- 7259
	recipe = AddRecipe(7259, 190, 6052, Q.COMMON, V.ORIG, 190, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2848, 1, 5594, 1, 8157, 1, 8158, 1)

	-- Blackmouth Oil -- 7836
	recipe = AddRecipe(7836, 80, 6370, Q.COMMON, V.ORIG, 80, 80, 90, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Fire Oil -- 7837
	recipe = AddRecipe(7837, 130, 6371, Q.COMMON, V.ORIG, 130, 150, 160, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Swim Speed Potion -- 7841
	recipe = AddRecipe(7841, 100, 6372, Q.COMMON, V.ORIG, 100, 130, 150, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Firepower -- 7845
	recipe = AddRecipe(7845, 140, 6373, Q.COMMON, V.ORIG, 140, 165, 185, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Giant Growth -- 8240
	recipe = AddRecipe(8240, 90, 6662, Q.UNCOMMON, V.ORIG, 90, 120, 140, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northern Barrens", "Southern Barrens")

	-- Greater Mana Potion -- 11448
	recipe = AddRecipe(11448, 205, 6149, Q.COMMON, V.ORIG, 205, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Agility -- 11449
	recipe = AddRecipe(11449, 185, 8949, Q.COMMON, V.ORIG, 185, 205, 225, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Greater Defense -- 11450
	recipe = AddRecipe(11450, 195, 8951, Q.COMMON, V.ORIG, 195, 215, 235, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Oil of Immolation -- 11451
	recipe = AddRecipe(11451, 205, 8956, Q.COMMON, V.ORIG, 205, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Restorative Potion -- 11452
	recipe = AddRecipe(11452, 210, 9030, Q.COMMON, V.ORIG, 210, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom(48)

	-- Magic Resistance Potion -- 11453
	recipe = AddRecipe(11453, 210, 9036, Q.UNCOMMON, V.ORIG, 210, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Goblin Rocket Fuel -- 11456
	recipe = AddRecipe(11456, 210, 9061, Q.COMMON, V.ORIG, 210, 225, 245, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(9)

	-- Superior Healing Potion -- 11457
	recipe = AddRecipe(11457, 215, 3928, Q.COMMON, V.ORIG, 215, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Wildvine Potion -- 11458
	recipe = AddRecipe(11458, 225, 9144, Q.UNCOMMON, V.ORIG, 225, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms")

	-- Philosopher's Stone -- 11459
	recipe = AddRecipe(11459, 225, 9149, Q.COMMON, V.ORIG, 225, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddVendor(5594)

	-- Elixir of Detect Undead -- 11460
	recipe = AddRecipe(11460, 230, 9154, Q.COMMON, V.ORIG, 230, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Arcane Elixir -- 11461
	recipe = AddRecipe(11461, 235, 9155, Q.COMMON, V.ORIG, 235, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Invisibility Potion -- 11464
	recipe = AddRecipe(11464, 235, 9172, Q.UNCOMMON, V.ORIG, 235, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Greater Intellect -- 11465
	recipe = AddRecipe(11465, 235, 9179, Q.COMMON, V.ORIG, 235, 250, 270, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Gift of Arthas -- 11466
	recipe = AddRecipe(11466, 240, 9088, Q.UNCOMMON, V.ORIG, 240, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(1783, 1791)

	-- Elixir of Greater Agility -- 11467
	recipe = AddRecipe(11467, 240, 9187, Q.COMMON, V.ORIG, 240, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Dream Vision -- 11468
	recipe = AddRecipe(11468, 240, 9197, Q.UNCOMMON, V.ORIG, 240, 255, 275, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Giants -- 11472
	recipe = AddRecipe(11472, 245, 9206, Q.UNCOMMON, V.ORIG, 245, 260, 280, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ghost Dye -- 11473
	recipe = AddRecipe(11473, 245, 9210, Q.COMMON, V.ORIG, 245, 260, 280, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(8157, 1, 8158, 1)

	-- Elixir of Shadow Power -- 11476
	recipe = AddRecipe(11476, 250, 9264, Q.UNCOMMON, V.ORIG, 250, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(1313, 1, 4610, 1)

	-- Elixir of Demonslaying -- 11477
	recipe = AddRecipe(11477, 250, 9224, Q.COMMON, V.ORIG, 250, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddLimitedVendor(8177, 1, 8178, 1)

	-- Elixir of Detect Demon -- 11478
	recipe = AddRecipe(11478, 250, 9233, Q.COMMON, V.ORIG, 250, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Transmute: Iron to Gold -- 11479
	recipe = AddRecipe(11479, 225, 3577, Q.COMMON, V.ORIG, 225, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(5594)

	-- Transmute: Mithril to Truesilver -- 11480
	recipe = AddRecipe(11480, 225, 6037, Q.COMMON, V.ORIG, 225, 240, 260, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(5594, 1)

	-- Catseye Elixir -- 12609
	recipe = AddRecipe(12609, 200, 10592, Q.COMMON, V.ORIG, 200, 220, 240, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Dreamless Sleep Potion -- 15833
	recipe = AddRecipe(15833, 230, 12190, Q.COMMON, V.ORIG, 230, 245, 265, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Transmute: Arcanite -- 17187
	recipe = AddRecipe(17187, 275, 12360, Q.COMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(5594)

	-- Stonescale Oil -- 17551
	recipe = AddRecipe(17551, 250, 13423, Q.COMMON, V.ORIG, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Mighty Rage Potion -- 17552
	recipe = AddRecipe(17552, 255, 13442, Q.COMMON, V.ORIG, 255, 270, 290, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Superior Mana Potion -- 17553
	recipe = AddRecipe(17553, 260, 13443, Q.COMMON, V.ORIG, 260, 275, 295, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Superior Defense -- 17554
	recipe = AddRecipe(17554, 265, 13445, Q.COMMON, V.ORIG, 265, 280, 300, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK)
	recipe:AddLimitedVendor(3348, 1, 5178, 1)

	-- Elixir of the Sages -- 17555
	recipe = AddRecipe(17555, 270, 13447, Q.COMMON, V.ORIG, 270, 285, 305, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Major Healing Potion -- 17556
	recipe = AddRecipe(17556, 275, 13446, Q.COMMON, V.ORIG, 275, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Brute Force -- 17557
	recipe = AddRecipe(17557, 275, 13453, Q.COMMON, V.ORIG, 275, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Transmute: Air to Fire -- 17559
	recipe = AddRecipe(17559, 275, 7078, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Transmute: Fire to Earth -- 17560
	recipe = AddRecipe(17560, 275, 7076, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(9499)

	-- Transmute: Earth to Water -- 17561
	recipe = AddRecipe(17561, 275, 7080, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TIMBERMAW_HOLD)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Transmute: Water to Air -- 17562
	recipe = AddRecipe(17562, 275, 7082, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(11278)

	-- Transmute: Undeath to Water -- 17563
	recipe = AddRecipe(17563, 275, 7080, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Transmute: Water to Undeath -- 17564
	recipe = AddRecipe(17564, 275, 12808, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Transmute: Life to Earth -- 17565
	recipe = AddRecipe(17565, 275, 7076, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Transmute: Earth to Life -- 17566
	recipe = AddRecipe(17566, 275, 12803, Q.UNCOMMON, V.ORIG, 275, 275, 282, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Greater Stoneshield Potion -- 17570
	recipe = AddRecipe(17570, 280, 13455, Q.UNCOMMON, V.ORIG, 280, 295, 315, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of the Mongoose -- 17571
	recipe = AddRecipe(17571, 280, 13452, Q.UNCOMMON, V.ORIG, 280, 295, 315, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS)
	recipe:AddCustom(48)

	-- Purification Potion -- 17572
	recipe = AddRecipe(17572, 285, 13462, Q.COMMON, V.ORIG, 285, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Greater Arcane Elixir -- 17573
	recipe = AddRecipe(17573, 285, 13454, Q.COMMON, V.ORIG, 285, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Greater Fire Protection Potion -- 17574
	recipe = AddRecipe(17574, 290, 13457, Q.UNCOMMON, V.ORIG, 290, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE)
	recipe:AddMobDrop(9262, 9264)

	-- Greater Frost Protection Potion -- 17575
	recipe = AddRecipe(17575, 290, 13456, Q.UNCOMMON, V.ORIG, 290, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(7428)

	-- Greater Nature Protection Potion -- 17576
	recipe = AddRecipe(17576, 290, 13458, Q.UNCOMMON, V.ORIG, 290, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(1812, 1813)

	-- Greater Arcane Protection Potion -- 17577
	recipe = AddRecipe(17577, 290, 13461, Q.UNCOMMON, V.ORIG, 290, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom(48)

	-- Greater Shadow Protection Potion -- 17578
	recipe = AddRecipe(17578, 290, 13459, Q.UNCOMMON, V.ORIG, 290, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE)
	recipe:AddMobDrop(8546, 8550)

	-- Major Mana Potion -- 17580
	recipe = AddRecipe(17580, 295, 13444, Q.UNCOMMON, V.ORIG, 295, 310, 330, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(1853)
	recipe:AddVendor(11278)

	-- Alchemist's Stone -- 17632
	recipe = AddRecipe(17632, 350, 13503, Q.COMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATAR, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Potion of Petrification -- 17634
	recipe = AddRecipe(17634, 300, 13506, Q.UNCOMMON, V.ORIG, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Flask of the Titans -- 17635
	recipe = AddRecipe(17635, 300, 13510, Q.UNCOMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.TANK, F.SHATAR)
	recipe:AddMobDrop(10363)
	recipe:AddRepVendor(FAC.SHATAR, REP.EXALTED, 21432)

	-- Flask of Distilled Wisdom -- 17636
	recipe = AddRecipe(17636, 300, 13511, Q.UNCOMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)
	recipe:AddMobDrop(10813)

	-- Flask of Supreme Power -- 17637
	recipe = AddRecipe(17637, 300, 13512, Q.UNCOMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KOT)
	recipe:AddMobDrop(10508)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.EXALTED, 21643)

	-- Flask of Chromatic Resistance -- 17638
	recipe = AddRecipe(17638, 300, 13513, Q.UNCOMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.LOWERCITY)
	recipe:AddMobDrop(10339)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.EXALTED, 21655)

	-- Elixir of Frost Power -- 21923
	recipe = AddRecipe(21923, 190, 17708, Q.COMMON, V.ORIG, 190, 210, 230, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddSeason(1)

	-- Major Rejuvenation Potion -- 22732
	recipe = AddRecipe(22732, 300, 18253, Q.RARE, V.ORIG, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom(26)

	-- Elixir of Greater Water Breathing -- 22808
	recipe = AddRecipe(22808, 215, 18294, Q.COMMON, V.ORIG, 215, 230, 250, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Gurubashi Mojo Madness -- 24266
	recipe = AddRecipe(24266, 300, 19931, Q.RARE, V.ORIG, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom(48)

	-- Mageblood Elixir -- 24365
	recipe = AddRecipe(24365, 275, 20007, Q.COMMON, V.ORIG, 275, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(48)

	-- Greater Dreamless Sleep Potion -- 24366
	recipe = AddRecipe(24366, 275, 20002, Q.COMMON, V.ORIG, 275, 290, 310, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom(48)

	-- Living Action Potion -- 24367
	recipe = AddRecipe(24367, 285, 20008, Q.COMMON, V.ORIG, 285, 300, 320, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom(48)

	-- Mighty Troll's Blood Elixir -- 24368
	recipe = AddRecipe(24368, 290, 20004, Q.COMMON, V.ORIG, 290, 305, 325, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom(48)

	-- Transmute: Elemental Fire -- 25146
	recipe = AddRecipe(25146, 300, 7068, Q.COMMON, V.ORIG, 300, 301, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Elixir of Greater Firepower -- 26277
	recipe = AddRecipe(26277, 250, 21546, Q.UNCOMMON, V.ORIG, 250, 265, 285, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(5844, 5846, 8637)

	-- Elixir of Camouflage -- 28543
	recipe = AddRecipe(28543, 305, 22823, Q.COMMON, V.TBC, 305, 320, 327, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(16588, 1, 16641, 1, 16705, 1, 18802, 1)

	-- Elixir of Major Strength -- 28544
	recipe = AddRecipe(28544, 305, 22824, Q.COMMON, V.TBC, 305, 320, 327, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Healing Power -- 28545
	recipe = AddRecipe(28545, 310, 22825, Q.COMMON, V.TBC, 310, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Sneaking Potion -- 28546
	recipe = AddRecipe(28546, 315, 22826, Q.COMMON, V.TBC, 315, 330, 337, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(18017, 1, 19042, 1)

	-- Elixir of Major Frost Power -- 28549
	recipe = AddRecipe(28549, 320, 22827, Q.COMMON, V.TBC, 320, 335, 342, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(18005, 1, 18017, 1)

	-- Insane Strength Potion -- 28550
	recipe = AddRecipe(28550, 320, 22828, Q.UNCOMMON, V.TBC, 320, 335, 342, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Super Healing Potion -- 28551
	recipe = AddRecipe(28551, 325, 22829, Q.COMMON, V.TBC, 325, 340, 347, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of the Searching Eye -- 28552
	recipe = AddRecipe(28552, 325, 22830, Q.UNCOMMON, V.TBC, 325, 340, 347, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Elixir of Major Agility -- 28553
	recipe = AddRecipe(28553, 330, 22831, Q.COMMON, V.TBC, 330, 345, 352, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Shrouding Potion -- 28554
	recipe = AddRecipe(28554, 335, 22871, Q.UNCOMMON, V.TBC, 335, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.EXALTED, 18382)

	-- Super Mana Potion -- 28555
	recipe = AddRecipe(28555, 340, 22832, Q.COMMON, V.TBC, 340, 355, 362, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(18005, 1, 19837, 1)

	-- Elixir of Major Firepower -- 28556
	recipe = AddRecipe(28556, 345, 22833, Q.UNCOMMON, V.TBC, 345, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Elixir of Major Defense -- 28557
	recipe = AddRecipe(28557, 345, 22834, Q.COMMON, V.TBC, 345, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TANK)
	recipe:AddLimitedVendor(18005, 1, 19837, 1)

	-- Elixir of Major Shadow Power -- 28558
	recipe = AddRecipe(28558, 350, 22835, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Major Dreamless Sleep Potion -- 28562
	recipe = AddRecipe(28562, 350, 22836, Q.COMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(19042, 1, 19837, 1)

	-- Heroic Potion -- 28563
	recipe = AddRecipe(28563, 350, 22837, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Haste Potion -- 28564
	recipe = AddRecipe(28564, 350, 22838, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)

	-- Destruction Potion -- 28565
	recipe = AddRecipe(28565, 350, 22839, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Transmute: Primal Air to Fire -- 28566
	recipe = AddRecipe(28566, 350, 21884, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Transmute: Primal Earth to Water -- 28567
	recipe = AddRecipe(28567, 350, 21885, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.REVERED, 18382)

	-- Transmute: Primal Fire to Earth -- 28568
	recipe = AddRecipe(28568, 350, 22452, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.REVERED, 20240)
	recipe:AddRepVendor(FAC.MAGHAR, REP.REVERED, 20241)

	-- Transmute: Primal Water to Air -- 28569
	recipe = AddRecipe(28569, 350, 22451, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Elixir of Major Mageblood -- 28570
	recipe = AddRecipe(28570, 355, 22840, Q.UNCOMMON, V.TBC, 355, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Major Fire Protection Potion -- 28571
	recipe = AddRecipe(28571, 360, 22841, Q.UNCOMMON, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19168, 19221)

	-- Major Frost Protection Potion -- 28572
	recipe = AddRecipe(28572, 360, 22842, Q.UNCOMMON, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18344)

	-- Major Nature Protection Potion -- 28573
	recipe = AddRecipe(28573, 360, 22844, Q.COMMON, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Major Arcane Protection Potion -- 28575
	recipe = AddRecipe(28575, 360, 22845, Q.UNCOMMON, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17150)

	-- Major Shadow Protection Potion -- 28576
	recipe = AddRecipe(28576, 360, 22846, Q.UNCOMMON, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(21302)

	-- Major Holy Protection Potion -- 28577
	recipe = AddRecipe(28577, 360, 22847, Q.UNCOMMON, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19973)

	-- Elixir of Empowerment -- 28578
	recipe = AddRecipe(28578, 365, 22848, Q.UNCOMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Ironshield Potion -- 28579
	recipe = AddRecipe(28579, 365, 22849, Q.UNCOMMON, V.TBC, 365, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17862)

	-- Transmute: Primal Shadow to Water -- 28580
	recipe = AddRecipe(28580, 375, 21885, Q.UNCOMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(3)

	-- Transmute: Primal Water to Shadow -- 28581
	recipe = AddRecipe(28581, 375, 22456, Q.UNCOMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(3)

	-- Transmute: Primal Mana to Fire -- 28582
	recipe = AddRecipe(28582, 375, 21884, Q.UNCOMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(3)

	-- Transmute: Primal Fire to Mana -- 28583
	recipe = AddRecipe(28583, 375, 22457, Q.UNCOMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(3)

	-- Transmute: Primal Life to Earth -- 28584
	recipe = AddRecipe(28584, 375, 22452, Q.UNCOMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(3)

	-- Transmute: Primal Earth to Life -- 28585
	recipe = AddRecipe(28585, 375, 21886, Q.UNCOMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(3)

	-- Super Rejuvenation Potion -- 28586
	recipe = AddRecipe(28586, 375, 22850, Q.COMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(2)

	-- Flask of Fortification -- 28587
	recipe = AddRecipe(28587, 375, 22851, Q.COMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom(1)

	-- Flask of Mighty Restoration -- 28588
	recipe = AddRecipe(28588, 375, 22853, Q.COMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(1)

	-- Flask of Relentless Assault -- 28589
	recipe = AddRecipe(28589, 375, 22854, Q.COMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom(1)

	-- Flask of Blinding Light -- 28590
	recipe = AddRecipe(28590, 375, 22861, Q.COMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(1)

	-- Flask of Pure Death -- 28591
	recipe = AddRecipe(28591, 375, 22866, Q.COMMON, V.TBC, 375, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(1)

	-- Transmute: Primal Might -- 29688
	recipe = AddRecipe(29688, 350, 23571, Q.UNCOMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(16641, 1, 16705, 1, 19074, 1)

	-- Transmute: Earthstorm Diamond -- 32765
	recipe = AddRecipe(32765, 350, 25867, Q.COMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Transmute: Skyfire Diamond -- 32766
	recipe = AddRecipe(32766, 350, 25868, Q.COMMON, V.TBC, 350, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Volatile Healing Potion -- 33732
	recipe = AddRecipe(33732, 300, 28100, Q.COMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Unstable Mana Potion -- 33733
	recipe = AddRecipe(33733, 310, 28101, Q.COMMON, V.TBC, 310, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Onslaught Elixir -- 33738
	recipe = AddRecipe(33738, 300, 28102, Q.COMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Adept's Elixir -- 33740
	recipe = AddRecipe(33740, 300, 28103, Q.COMMON, V.TBC, 300, 315, 322, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Mastery -- 33741
	recipe = AddRecipe(33741, 315, 28104, Q.COMMON, V.TBC, 315, 330, 337, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Mercurial Stone -- 38070
	recipe = AddRecipe(38070, 325, 31080, Q.COMMON, V.TBC, 325, 340, 347, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TRINKET)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Fel Strength Elixir -- 38960
	recipe = AddRecipe(38960, 335, 31679, Q.RARE, V.TBC, 335, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddMobDrop(19740, 19755, 21302, 21314)

	-- Fel Mana Potion -- 38961
	recipe = AddRecipe(38961, 360, 31677, Q.RARE, V.TBC, 360, 375, 377, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19792, 19795, 19796, 19806, 22016, 22017, 22018, 22076, 22093)

	-- Fel Regeneration Potion -- 38962
	recipe = AddRecipe(38962, 345, 31676, Q.RARE, V.TBC, 345, 360, 367, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19754, 19756, 20878, 20887)

	-- Elixir of Major Fortitude -- 39636
	recipe = AddRecipe(39636, 310, 32062, Q.COMMON, V.TBC, 310, 325, 332, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Earthen Elixir -- 39637
	recipe = AddRecipe(39637, 320, 32063, Q.COMMON, V.TBC, 320, 335, 342, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Elixir of Draenic Wisdom -- 39638
	recipe = AddRecipe(39638, 320, 32067, Q.COMMON, V.TBC, 320, 335, 342, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Elixir of Ironskin -- 39639
	recipe = AddRecipe(39639, 330, 32068, Q.COMMON, V.TBC, 330, 345, 352, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(18821, 18822)

	-- Cauldron of Major Arcane Protection -- 41458
	recipe = AddRecipe(41458, 360, 32839, Q.COMMON, V.TBC, 360, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(4)

	-- Cauldron of Major Fire Protection -- 41500
	recipe = AddRecipe(41500, 360, 32849, Q.COMMON, V.TBC, 360, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(4)

	-- Cauldron of Major Frost Protection -- 41501
	recipe = AddRecipe(41501, 360, 32850, Q.COMMON, V.TBC, 360, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(4)

	-- Cauldron of Major Nature Protection -- 41502
	recipe = AddRecipe(41502, 360, 32851, Q.COMMON, V.TBC, 360, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(4)

	-- Cauldron of Major Shadow Protection -- 41503
	recipe = AddRecipe(41503, 360, 32852, Q.COMMON, V.TBC, 360, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(4)

	-- Flask of Chromatic Wonder -- 42736
	recipe = AddRecipe(42736, 375, 33208, Q.UNCOMMON, V.TBC, 375, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.VIOLETEYE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 18255)

	-- Mad Alchemist's Potion -- 45061
	recipe = AddRecipe(45061, 325, 34440, Q.COMMON, V.TBC, 325, 335, 342, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(16588, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Guardian's Alchemist Stone -- 47046
	recipe = AddRecipe(47046, 375, 35748, Q.COMMON, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Sorcerer's Alchemist Stone -- 47048
	recipe = AddRecipe(47048, 375, 35749, Q.COMMON, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Redeemer's Alchemist Stone -- 47049
	recipe = AddRecipe(47049, 375, 35750, Q.COMMON, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Assassin's Alchemist Stone -- 47050
	recipe = AddRecipe(47050, 375, 35751, Q.COMMON, V.TBC, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATTEREDSUN, F.TRINKET)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Transmute: Eternal Life to Shadow -- 53771
	recipe = AddRecipe(53771, 405, 35627, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Life to Fire -- 53773
	recipe = AddRecipe(53773, 405, 36860, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Fire to Water -- 53774
	recipe = AddRecipe(53774, 405, 35622, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Fire to Life -- 53775
	recipe = AddRecipe(53775, 405, 35625, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Air to Water -- 53776
	recipe = AddRecipe(53776, 405, 35622, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Air to Earth -- 53777
	recipe = AddRecipe(53777, 405, 35624, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Shadow to Earth -- 53779
	recipe = AddRecipe(53779, 405, 35624, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Shadow to Life -- 53780
	recipe = AddRecipe(53780, 405, 35625, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Earth to Air -- 53781
	recipe = AddRecipe(53781, 405, 35623, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Earth to Shadow -- 53782
	recipe = AddRecipe(53782, 405, 35627, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Water to Air -- 53783
	recipe = AddRecipe(53783, 405, 35623, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Transmute: Eternal Water to Fire -- 53784
	recipe = AddRecipe(53784, 405, 36860, Q.UNCOMMON, V.WOTLK, 405, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(19)

	-- Pygmy Oil -- 53812
	recipe = AddRecipe(53812, 375, 40195, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Runic Healing Potion -- 53836
	recipe = AddRecipe(53836, 405, 33447, Q.COMMON, V.WOTLK, 405, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Runic Mana Potion -- 53837
	recipe = AddRecipe(53837, 410, 33448, Q.COMMON, V.WOTLK, 410, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Resurgent Healing Potion -- 53838
	recipe = AddRecipe(53838, 350, 39671, Q.COMMON, V.WOTLK, 350, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Icy Mana Potion -- 53839
	recipe = AddRecipe(53839, 360, 40067, Q.COMMON, V.WOTLK, 360, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Elixir of Mighty Agility -- 53840
	recipe = AddRecipe(53840, 395, 39666, Q.COMMON, V.WOTLK, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Wrath Elixir -- 53841
	recipe = AddRecipe(53841, 355, 40068, Q.COMMON, V.WOTLK, 355, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Spellpower Elixir -- 53842
	recipe = AddRecipe(53842, 365, 40070, Q.COMMON, V.WOTLK, 365, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Elixir of Spirit -- 53847
	recipe = AddRecipe(53847, 385, 40072, Q.COMMON, V.WOTLK, 385, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Guru's Elixir -- 53848
	recipe = AddRecipe(53848, 375, 40076, Q.COMMON, V.WOTLK, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Crazy Alchemist's Potion -- 53895
	recipe = AddRecipe(53895, 400, 40077, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Elixir of Mighty Fortitude -- 53898
	recipe = AddRecipe(53898, 390, 40078, Q.COMMON, V.WOTLK, 390, 400, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Lesser Flask of Toughness -- 53899
	recipe = AddRecipe(53899, 375, 40079, Q.COMMON, V.WOTLK, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Potion of Nightmares -- 53900
	recipe = AddRecipe(53900, 380, 40081, Q.COMMON, V.WOTLK, 380, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Flask of the Frost Wyrm -- 53901
	recipe = AddRecipe(53901, 435, 40082, Q.COMMON, V.WOTLK, 435, 450, 457, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Flask of Stoneblood -- 53902
	recipe = AddRecipe(53902, 435, 40083, Q.COMMON, V.WOTLK, 435, 450, 457, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Flask of Endless Rage -- 53903
	recipe = AddRecipe(53903, 435, 40084, Q.COMMON, V.WOTLK, 435, 450, 457, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Powerful Rejuvenation Potion -- 53904
	recipe = AddRecipe(53904, 400, 40087, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Indestructible Potion -- 53905
	recipe = AddRecipe(53905, 395, 40093, Q.COMMON, V.WOTLK, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Mighty Arcane Protection Potion -- 53936
	recipe = AddRecipe(53936, 400, 40213, Q.UNCOMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(31702, 32297)

	-- Mighty Frost Protection Potion -- 53937
	recipe = AddRecipe(53937, 400, 40215, Q.UNCOMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32289)

	-- Mighty Shadow Protection Potion -- 53938
	recipe = AddRecipe(53938, 400, 40217, Q.UNCOMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32349)

	-- Mighty Fire Protection Potion -- 53939
	recipe = AddRecipe(53939, 400, 40214, Q.UNCOMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(30921)

	-- Mighty Nature Protection Potion -- 53942
	recipe = AddRecipe(53942, 400, 40216, Q.UNCOMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32290)

	-- Flask of Pure Mojo -- 54213
	recipe = AddRecipe(54213, 435, 40404, Q.COMMON, V.WOTLK, 435, 450, 457, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Elixir of Mighty Strength -- 54218
	recipe = AddRecipe(54218, 385, 40073, Q.COMMON, V.WOTLK, 385, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Elixir of Protection -- 54220
	recipe = AddRecipe(54220, 400, 40097, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Potion of Speed -- 54221
	recipe = AddRecipe(54221, 400, 40211, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Potion of Wild Magic -- 54222
	recipe = AddRecipe(54222, 400, 40212, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(18)

	-- Elixir of Mighty Mageblood -- 56519
	recipe = AddRecipe(56519, 400, 40109, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Transmute: Skyflare Diamond -- 57425
	recipe = AddRecipe(57425, 430, 41266, Q.COMMON, V.WOTLK, 430, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Earthsiege Diamond -- 57427
	recipe = AddRecipe(57427, 425, 41334, Q.COMMON, V.WOTLK, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Endless Mana Potion -- 58868
	recipe = AddRecipe(58868, 410, 43570, Q.COMMON, V.WOTLK, 410, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Endless Healing Potion -- 58871
	recipe = AddRecipe(58871, 410, 43569, Q.COMMON, V.WOTLK, 410, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Titanium -- 60350
	recipe = AddRecipe(60350, 395, 41163, Q.COMMON, V.WOTLK, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Elixir of Accuracy -- 60354
	recipe = AddRecipe(60354, 400, 44325, Q.COMMON, V.WOTLK, 400, 415, 422, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Elixir of Deadly Strikes -- 60355
	recipe = AddRecipe(60355, 400, 44327, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Elixir of Mighty Defense -- 60356
	recipe = AddRecipe(60356, 400, 44328, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom(18)

	-- Elixir of Expertise -- 60357
	recipe = AddRecipe(60357, 400, 44329, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom(18)

	-- Elixir of Armor Piercing -- 60365
	recipe = AddRecipe(60365, 400, 44330, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom(18)

	-- Elixir of Lightning Speed -- 60366
	recipe = AddRecipe(60366, 400, 44331, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Elixir of Mighty Thoughts -- 60367
	recipe = AddRecipe(60367, 395, 44332, Q.COMMON, V.WOTLK, 395, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Mercurial Alchemist Stone -- 60396
	recipe = AddRecipe(60396, 400, 44322, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.TRINKET)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Indestructible Alchemist Stone -- 60403
	recipe = AddRecipe(60403, 400, 44323, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK, F.TRINKET)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Mighty Alchemist Stone -- 60405
	recipe = AddRecipe(60405, 400, 44324, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.TRINKET)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Northrend Alchemy Research -- 60893
	recipe = AddRecipe(60893, 400, nil, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Lesser Flask of Resistance -- 62213
	recipe = AddRecipe(62213, 385, 44939, Q.COMMON, V.WOTLK, 385, 395, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Ethereal Oil -- 62409
	recipe = AddRecipe(62409, 375, 44958, Q.COMMON, V.WOTLK, 375, 385, 390, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Elixir of Water Walking -- 62410
	recipe = AddRecipe(62410, 400, 8827, Q.COMMON, V.WOTLK, 400, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddCustom(18)

	-- Elixir of Minor Accuracy -- 63732
	recipe = AddRecipe(63732, 135, 45621, Q.COMMON, V.WOTLK, 135, 160, 180, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 27023, 27029, 33608, 33674)

	-- Transmute: Ametrine -- 66658
	recipe = AddRecipe(66658, 450, 36931, Q.COMMON, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Cardinal Ruby -- 66659
	recipe = AddRecipe(66659, 450, 36919, Q.COMMON, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(14151)

	-- Transmute: King's Amber -- 66660
	recipe = AddRecipe(66660, 450, 36922, Q.COMMON, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Dreadstone -- 66662
	recipe = AddRecipe(66662, 450, 36928, Q.COMMON, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Majestic Zircon -- 66663
	recipe = AddRecipe(66663, 450, 36925, Q.COMMON, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Eye of Zul -- 66664
	recipe = AddRecipe(66664, 450, 36934, Q.COMMON, V.WOTLK, 450, 450, 452, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Flask of the North -- 67025
	recipe = AddRecipe(67025, 425, 47499, Q.COMMON, V.WOTLK, 425, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS)
	recipe:AddTrainer(26903, 26951, 26975, 26987, 28703, 33588)

	-- Transmute: Living Elements -- 78866
	recipe = AddRecipe(78866, 485, nil, Q.COMMON, V.CATA, 485, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Shadowspirit Diamond -- 80237
	recipe = AddRecipe(80237, 525, 52303, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Truegold -- 80243
	recipe = AddRecipe(80243, 525, 58480, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Pyrium Bar -- 80244
	recipe = AddRecipe(80244, 520, 51950, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Inferno Ruby -- 80245
	recipe = AddRecipe(80245, 525, 52190, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Ocean Sapphire -- 80246
	recipe = AddRecipe(80246, 515, 52191, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Amberjewel -- 80247
	recipe = AddRecipe(80247, 520, 52195, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Demonseye -- 80248
	recipe = AddRecipe(80248, 515, 52194, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Ember Topaz -- 80250
	recipe = AddRecipe(80250, 510, 52193, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Transmute: Dream Emerald -- 80251
	recipe = AddRecipe(80251, 505, 52192, Q.COMMON, V.CATA, 505, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Potion of Illusion -- 80269
	recipe = AddRecipe(80269, 460, 58489, Q.COMMON, V.CATA, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Ghost Elixir -- 80477
	recipe = AddRecipe(80477, 450, 58084, Q.COMMON, V.CATA, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Earthen Potion -- 80478
	recipe = AddRecipe(80478, 450, 58090, Q.COMMON, V.CATA, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Deathblood Venom -- 80479
	recipe = AddRecipe(80479, 455, 58142, Q.COMMON, V.CATA, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Elixir of the Naga -- 80480
	recipe = AddRecipe(80480, 455, 58089, Q.COMMON, V.CATA, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Volcanic Potion -- 80481
	recipe = AddRecipe(80481, 460, 58091, Q.COMMON, V.CATA, 460, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Potion of Concentration -- 80482
	recipe = AddRecipe(80482, 465, 57194, Q.COMMON, V.CATA, 465, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Elixir of the Cobra -- 80484
	recipe = AddRecipe(80484, 465, 58092, Q.COMMON, V.CATA, 465, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Deepstone Oil -- 80486
	recipe = AddRecipe(80486, 470, 56850, Q.COMMON, V.CATA, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Mysterious Potion -- 80487
	recipe = AddRecipe(80487, 470, 57099, Q.COMMON, V.CATA, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Elixir of Deep Earth -- 80488
	recipe = AddRecipe(80488, 475, 58093, Q.COMMON, V.CATA, 475, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Mighty Rejuvenation Potion -- 80490
	recipe = AddRecipe(80490, 475, 57193, Q.COMMON, V.CATA, 475, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Elixir of Impossible Accuracy -- 80491
	recipe = AddRecipe(80491, 480, 58094, Q.COMMON, V.CATA, 480, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Prismatic Elixir -- 80492
	recipe = AddRecipe(80492, 480, 58143, Q.COMMON, V.CATA, 480, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Elixir of Mighty Speed -- 80493
	recipe = AddRecipe(80493, 490, 58144, Q.COMMON, V.CATA, 490, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Mythical Mana Potion -- 80494
	recipe = AddRecipe(80494, 485, 57192, Q.COMMON, V.CATA, 485, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Potion of the Tol'vir -- 80495
	recipe = AddRecipe(80495, 485, 58145, Q.COMMON, V.CATA, 485, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Golemblood Potion -- 80496
	recipe = AddRecipe(80496, 490, 58146, Q.COMMON, V.CATA, 490, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Elixir of the Master -- 80497
	recipe = AddRecipe(80497, 495, 58148, Q.COMMON, V.CATA, 495, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Mythical Healing Potion -- 80498
	recipe = AddRecipe(80498, 495, 57191, Q.COMMON, V.CATA, 495, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 5177, 5499, 28703)

	-- Lifebound Alchemist Stone -- 80508
	recipe = AddRecipe(80508, 500, 58483, Q.COMMON, V.CATA, 500, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Flask of Steelskin -- 80719
	recipe = AddRecipe(80719, 500, 58085, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Flask of the Draconic Mind -- 80720
	recipe = AddRecipe(80720, 505, 58086, Q.COMMON, V.CATA, 505, 510, 515, 520)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Flask of the Winds -- 80721
	recipe = AddRecipe(80721, 510, 58087, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Flask of Titanic Strength -- 80723
	recipe = AddRecipe(80723, 510, 58088, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Flask of Enhancement -- 80724
	recipe = AddRecipe(80724, 500, 58149, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Potion of Deepholm -- 80725
	recipe = AddRecipe(80725, 525, 58487, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Potion of Treasure Finding -- 80726
	recipe = AddRecipe(80726, 525, 58488, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 5177, 5499, 28703)

	-- Cauldron of Battle -- 92643
	recipe = AddRecipe(92643, 525, 62288, Q.COMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5465)

	-- Big Cauldron of Battle -- 92688
	recipe = AddRecipe(92688, 525, 65460, Q.COMMON, V.CATA, 525, 525, 525, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5024)

	-- Vial of the Sands -- 93328
	recipe = AddRecipe(93328, 525, 65891, Q.EPIC, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(47)

	-- Draught of War -- 93935
	recipe = AddRecipe(93935, 425, 67415, Q.COMMON, V.CATA, 425, 440, 450, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 5177, 5499, 28703)

	-- Flask of Flowing Water -- 94162
	recipe = AddRecipe(94162, 500, 67438, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347, 4160, 5177, 5499, 28703)

	-- Volatile Alchemist Stone -- 96252
	recipe = AddRecipe(96252, 510, 68775, Q.EPIC, V.CATA, 510, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Quicksilver Alchemist Stone -- 96253
	recipe = AddRecipe(96253, 510, 68776, Q.EPIC, V.CATA, 510, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	-- Vibrant Alchemist Stone -- 96254
	recipe = AddRecipe(96254, 510, 68777, Q.EPIC, V.CATA, 510, 510, 512, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(3347, 4160, 4611, 5177, 5499, 28703)

	return num_recipes
end
