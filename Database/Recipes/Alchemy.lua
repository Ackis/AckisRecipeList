--[[
************************************************************************
Alchemy.lua
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
function addon:InitAlchemy()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, private.PROFESSION_SPELL_IDS.ALCHEMY, genesis, quality)
	end

	private:InitializeAlchemyTrainers()

	local recipe

	-- Elixir of Lion's Strength -- 2329
	recipe = AddRecipe(2329, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2454)
	recipe:SetSkillLevels(1, 1, 55, 75, 95)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Minor Healing Potion -- 2330
	recipe = AddRecipe(2330, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(118)
	recipe:SetSkillLevels(1, 1, 55, 75, 95)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Minor Mana Potion -- 2331
	recipe = AddRecipe(2331, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2455)
	recipe:SetSkillLevels(25, 25, 65, 85, 105)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47418)

	-- Minor Rejuvenation Potion -- 2332
	recipe = AddRecipe(2332, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2456)
	recipe:SetSkillLevels(40, 40, 70, 90, 110)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47418)

	-- Elixir of Lesser Agility -- 2333
	recipe = AddRecipe(2333, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3396)
	recipe:SetCraftedItemID(3390)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Minor Fortitude -- 2334
	recipe = AddRecipe(2334, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2458)
	recipe:SetSkillLevels(50, 50, 80, 100, 120)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47418)

	-- Swiftness Potion -- 2335
	recipe = AddRecipe(2335, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2555)
	recipe:SetCraftedItemID(2459)
	recipe:SetSkillLevels(60, 60, 90, 110, 130)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lesser Healing Potion -- 2337
	recipe = AddRecipe(2337, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(858)
	recipe:SetSkillLevels(55, 55, 85, 105, 125)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47418)

	-- Weak Troll's Blood Elixir -- 3170
	recipe = AddRecipe(3170, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3382)
	recipe:SetSkillLevels(15, 15, 60, 80, 100)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47418)

	-- Elixir of Wisdom -- 3171
	recipe = AddRecipe(3171, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3383)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Minor Magic Resistance Potion -- 3172
	recipe = AddRecipe(3172, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3393)
	recipe:SetCraftedItemID(3384)
	recipe:SetSkillLevels(110, 110, 135, 155, 175)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Lesser Mana Potion -- 3173
	recipe = AddRecipe(3173, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3385)
	recipe:SetSkillLevels(120, 120, 145, 165, 185)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Potion of Curing -- 3174
	recipe = AddRecipe(3174, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3394)
	recipe:SetCraftedItemID(3386)
	recipe:SetSkillLevels(120, 120, 145, 165, 185)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Limited Invulnerability Potion -- 3175
	recipe = AddRecipe(3175, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3395)
	recipe:SetCraftedItemID(3387)
	recipe:SetSkillLevels(250, 250, 275, 295, 315)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Strong Troll's Blood Elixir -- 3176
	recipe = AddRecipe(3176, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3388)
	recipe:SetSkillLevels(125, 125, 150, 170, 190)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Defense -- 3177
	recipe = AddRecipe(3177, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3389)
	recipe:SetSkillLevels(130, 130, 155, 175, 195)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Ogre's Strength -- 3188
	recipe = AddRecipe(3188, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6211)
	recipe:SetCraftedItemID(3391)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Minor Agility -- 3230
	recipe = AddRecipe(3230, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2553)
	recipe:SetCraftedItemID(2457)
	recipe:SetSkillLevels(50, 50, 80, 100, 120)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Healing Potion -- 3447
	recipe = AddRecipe(3447, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(929)
	recipe:SetSkillLevels(110, 110, 135, 155, 175)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Lesser Invisibility Potion -- 3448
	recipe = AddRecipe(3448, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3823)
	recipe:SetSkillLevels(165, 165, 185, 205, 225)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Shadow Oil -- 3449
	recipe = AddRecipe(3449, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6068)
	recipe:SetCraftedItemID(3824)
	recipe:SetSkillLevels(165, 165, 190, 210, 230)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3347)

	-- Elixir of Fortitude -- 3450
	recipe = AddRecipe(3450, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(3830)
	recipe:SetCraftedItemID(3825)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Major Troll's Blood Elixir -- 3451
	recipe = AddRecipe(3451, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3831)
	recipe:SetCraftedItemID(3826)
	recipe:SetSkillLevels(180, 180, 200, 220, 240)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Mana Potion -- 3452
	recipe = AddRecipe(3452, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3827)
	recipe:SetSkillLevels(160, 160, 180, 200, 220)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Detect Lesser Invisibility -- 3453
	recipe = AddRecipe(3453, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(3832)
	recipe:SetCraftedItemID(3828)
	recipe:SetSkillLevels(195, 195, 215, 235, 255)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Frost Oil -- 3454
	recipe = AddRecipe(3454, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(14634)
	recipe:SetCraftedItemID(3829)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2480, 1)

	-- Discolored Healing Potion -- 4508
	recipe = AddRecipe(4508, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4597)
	recipe:SetCraftedItemID(4596)
	recipe:SetSkillLevels(50, 50, 80, 100, 120)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lesser Stoneshield Potion -- 4942
	recipe = AddRecipe(4942, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(4624)
	recipe:SetCraftedItemID(4623)
	recipe:SetSkillLevels(215, 215, 230, 250, 270)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Rage Potion -- 6617
	recipe = AddRecipe(6617, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5640)
	recipe:SetCraftedItemID(5631)
	recipe:SetSkillLevels(60, 60, 90, 110, 130)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddVendor(1685, 3499)
	recipe:AddLimitedVendor(3335, 2)

	-- Great Rage Potion -- 6618
	recipe = AddRecipe(6618, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5643)
	recipe:SetCraftedItemID(5633)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddLimitedVendor(3335, 2, 4226, 1)

	-- Free Action Potion -- 6624
	recipe = AddRecipe(6624, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5642)
	recipe:SetCraftedItemID(5634)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3348, 1, 4226, 1, 5178, 1)

	-- Elixir of Water Breathing -- 7179
	recipe = AddRecipe(7179, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5996)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Greater Healing Potion -- 7181
	recipe = AddRecipe(7181, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(1710)
	recipe:SetSkillLevels(155, 155, 175, 195, 215)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Minor Defense -- 7183
	recipe = AddRecipe(7183, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5997)
	recipe:SetSkillLevels(1, 1, 55, 75, 95)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Holy Protection Potion -- 7255
	recipe = AddRecipe(7255, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6053)
	recipe:SetCraftedItemID(6051)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(1685, 1, 3134, 1, 3490, 1)

	-- Shadow Protection Potion -- 7256
	recipe = AddRecipe(7256, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6054)
	recipe:SetCraftedItemID(6048)
	recipe:SetSkillLevels(135, 135, 160, 180, 200)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2393, 1)

	-- Fire Protection Potion -- 7257
	recipe = AddRecipe(7257, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6055)
	recipe:SetCraftedItemID(6049)
	recipe:SetSkillLevels(165, 165, 210, 230, 250)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(4083, 1)

	-- Frost Protection Potion -- 7258
	recipe = AddRecipe(7258, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6056)
	recipe:SetCraftedItemID(6050)
	recipe:SetSkillLevels(190, 190, 205, 225, 245)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2812, 1, 2848, 1)

	-- Nature Protection Potion -- 7259
	recipe = AddRecipe(7259, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6057)
	recipe:SetCraftedItemID(6052)
	recipe:SetSkillLevels(190, 190, 210, 230, 250)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(2848, 1, 5594, 1, 8157, 1, 8158, 1)

	-- Blackmouth Oil -- 7836
	recipe = AddRecipe(7836, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6370)
	recipe:SetSkillLevels(80, 80, 80, 90, 100)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Fire Oil -- 7837
	recipe = AddRecipe(7837, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6371)
	recipe:SetSkillLevels(130, 130, 150, 160, 170)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Swim Speed Potion -- 7841
	recipe = AddRecipe(7841, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6372)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Firepower -- 7845
	recipe = AddRecipe(7845, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6373)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Giant Growth -- 8240
	recipe = AddRecipe(8240, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6663)
	recipe:SetCraftedItemID(6662)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Northern Barrens", "Southern Barrens")

	-- Greater Mana Potion -- 11448
	recipe = AddRecipe(11448, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(6149)
	recipe:SetSkillLevels(205, 205, 220, 240, 260)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Agility -- 11449
	recipe = AddRecipe(11449, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8949)
	recipe:SetSkillLevels(185, 185, 205, 225, 245)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Greater Defense -- 11450
	recipe = AddRecipe(11450, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8951)
	recipe:SetSkillLevels(195, 195, 215, 235, 255)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Oil of Immolation -- 11451
	recipe = AddRecipe(11451, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8956)
	recipe:SetSkillLevels(205, 205, 220, 240, 260)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Restorative Potion -- 11452
	recipe = AddRecipe(11452, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9030)
	recipe:SetSkillLevels(210, 210, 225, 245, 265)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Magic Resistance Potion -- 11453
	recipe = AddRecipe(11453, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9293)
	recipe:SetCraftedItemID(9036)
	recipe:SetSkillLevels(210, 210, 225, 245, 265)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Goblin Rocket Fuel -- 11456
	recipe = AddRecipe(11456, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(10644)
	recipe:SetCraftedItemID(9061)
	recipe:SetSkillLevels(210, 210, 225, 245, 265)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("CRAFTED_ENGINEERS")

	-- Superior Healing Potion -- 11457
	recipe = AddRecipe(11457, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3928)
	recipe:SetSkillLevels(215, 215, 230, 250, 270)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Wildvine Potion -- 11458
	recipe = AddRecipe(11458, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9294)
	recipe:SetCraftedItemID(9144)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms")

	-- Philosopher's Stone -- 11459
	recipe = AddRecipe(11459, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(9303)
	recipe:SetCraftedItemID(9149)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(5594)

	-- Elixir of Detect Undead -- 11460
	recipe = AddRecipe(11460, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9154)
	recipe:SetSkillLevels(230, 230, 245, 265, 285)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Arcane Elixir -- 11461
	recipe = AddRecipe(11461, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9155)
	recipe:SetSkillLevels(235, 235, 250, 270, 290)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Invisibility Potion -- 11464
	recipe = AddRecipe(11464, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9295)
	recipe:SetCraftedItemID(9172)
	recipe:SetSkillLevels(235, 235, 250, 270, 290)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Greater Intellect -- 11465
	recipe = AddRecipe(11465, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9179)
	recipe:SetSkillLevels(235, 235, 250, 270, 290)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Gift of Arthas -- 11466
	recipe = AddRecipe(11466, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9296)
	recipe:SetCraftedItemID(9088)
	recipe:SetSkillLevels(240, 240, 255, 275, 295)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Elixir of Greater Agility -- 11467
	recipe = AddRecipe(11467, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9187)
	recipe:SetSkillLevels(240, 240, 255, 275, 295)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Dream Vision -- 11468
	recipe = AddRecipe(11468, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9297)
	recipe:SetCraftedItemID(9197)
	recipe:SetSkillLevels(240, 240, 255, 275, 295)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of Giants -- 11472
	recipe = AddRecipe(11472, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9298)
	recipe:SetCraftedItemID(9206)
	recipe:SetSkillLevels(245, 245, 260, 280, 300)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Ghost Dye -- 11473
	recipe = AddRecipe(11473, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(9302)
	recipe:SetCraftedItemID(9210)
	recipe:SetSkillLevels(245, 245, 260, 280, 300)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(8157, 1, 8158, 1)

	-- Elixir of Shadow Power -- 11476
	recipe = AddRecipe(11476, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(9301)
	recipe:SetCraftedItemID(9264)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(1313, 1, 4610, 1)

	-- Elixir of Demonslaying -- 11477
	recipe = AddRecipe(11477, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(9300)
	recipe:SetCraftedItemID(9224)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS)
	recipe:AddLimitedVendor(8177, 1, 8178, 1)

	-- Elixir of Detect Demon -- 11478
	recipe = AddRecipe(11478, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(9233)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Transmute: Iron to Gold -- 11479
	recipe = AddRecipe(11479, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(9304)
	recipe:SetCraftedItemID(3577)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(5594)

	-- Transmute: Mithril to Truesilver -- 11480
	recipe = AddRecipe(11480, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(9305)
	recipe:SetCraftedItemID(6037)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(5594, 1)

	-- Catseye Elixir -- 12609
	recipe = AddRecipe(12609, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(10592)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Dreamless Sleep Potion -- 15833
	recipe = AddRecipe(15833, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(12190)
	recipe:SetSkillLevels(230, 230, 245, 265, 285)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Transmute: Arcanite -- 17187
	recipe = AddRecipe(17187, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(12958)
	recipe:SetCraftedItemID(12360)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(5594)

	-- Stonescale Oil -- 17551
	recipe = AddRecipe(17551, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(13423)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Mighty Rage Potion -- 17552
	recipe = AddRecipe(17552, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13476)
	recipe:SetCraftedItemID(13442)
	recipe:SetSkillLevels(255, 255, 270, 290, 310)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Superior Mana Potion -- 17553
	recipe = AddRecipe(17553, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13477)
	recipe:SetCraftedItemID(13443)
	recipe:SetSkillLevels(260, 260, 275, 295, 315)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Superior Defense -- 17554
	recipe = AddRecipe(17554, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13478)
	recipe:SetCraftedItemID(13445)
	recipe:SetSkillLevels(265, 265, 280, 300, 320)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(3348, 1, 5178, 1)

	-- Elixir of the Sages -- 17555
	recipe = AddRecipe(17555, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13479)
	recipe:SetCraftedItemID(13447)
	recipe:SetSkillLevels(270, 270, 285, 305, 325)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Major Healing Potion -- 17556
	recipe = AddRecipe(17556, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13480)
	recipe:SetCraftedItemID(13446)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Brute Force -- 17557
	recipe = AddRecipe(17557, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13481)
	recipe:SetCraftedItemID(13453)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Transmute: Air to Fire -- 17559
	recipe = AddRecipe(17559, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13482)
	recipe:SetCraftedItemID(7078)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Transmute: Fire to Earth -- 17560
	recipe = AddRecipe(17560, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13483)
	recipe:SetCraftedItemID(7076)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(9499)

	-- Transmute: Earth to Water -- 17561
	recipe = AddRecipe(17561, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13484)
	recipe:SetCraftedItemID(7080)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TIMBERMAW_HOLD)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Transmute: Water to Air -- 17562
	recipe = AddRecipe(17562, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13485)
	recipe:SetCraftedItemID(7082)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(11278)

	-- Transmute: Undeath to Water -- 17563
	recipe = AddRecipe(17563, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13486)
	recipe:SetCraftedItemID(7080)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Transmute: Water to Undeath -- 17564
	recipe = AddRecipe(17564, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13487)
	recipe:SetCraftedItemID(12808)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Transmute: Life to Earth -- 17565
	recipe = AddRecipe(17565, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13488)
	recipe:SetCraftedItemID(7076)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Transmute: Earth to Life -- 17566
	recipe = AddRecipe(17566, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13489)
	recipe:SetCraftedItemID(12803)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Greater Stoneshield Potion -- 17570
	recipe = AddRecipe(17570, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13490)
	recipe:SetCraftedItemID(13455)
	recipe:SetSkillLevels(280, 280, 295, 315, 335)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Elixir of the Mongoose -- 17571
	recipe = AddRecipe(17571, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13491)
	recipe:SetCraftedItemID(13452)
	recipe:SetSkillLevels(280, 280, 295, 315, 335)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Purification Potion -- 17572
	recipe = AddRecipe(17572, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13492)
	recipe:SetCraftedItemID(13462)
	recipe:SetSkillLevels(285, 285, 300, 320, 340)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Greater Arcane Elixir -- 17573
	recipe = AddRecipe(17573, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(13493)
	recipe:SetCraftedItemID(13454)
	recipe:SetSkillLevels(285, 285, 300, 320, 340)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Greater Fire Protection Potion -- 17574
	recipe = AddRecipe(17574, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13494)
	recipe:SetCraftedItemID(13457)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE)
	recipe:AddMobDrop(9262, 9264)

	-- Greater Frost Protection Potion -- 17575
	recipe = AddRecipe(17575, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13495)
	recipe:SetCraftedItemID(13456)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Greater Nature Protection Potion -- 17576
	recipe = AddRecipe(17576, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13496)
	recipe:SetCraftedItemID(13458)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(15174, 1)

	-- Greater Arcane Protection Potion -- 17577
	recipe = AddRecipe(17577, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13497)
	recipe:SetCraftedItemID(13461)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Greater Shadow Protection Potion -- 17578
	recipe = AddRecipe(17578, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13499)
	recipe:SetCraftedItemID(13459)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Major Mana Potion -- 17580
	recipe = AddRecipe(17580, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13501)
	recipe:SetCraftedItemID(13444)
	recipe:SetSkillLevels(295, 295, 310, 330, 350)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(1853)
	recipe:AddVendor(11278)

	-- Alchemist Stone -- 17632
	recipe = AddRecipe(17632, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(13517)
	recipe:SetCraftedItemID(13503)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Potion of Petrification -- 17634
	recipe = AddRecipe(17634, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13518)
	recipe:SetCraftedItemID(13506)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Flask of the Titans -- 17635
	recipe = AddRecipe(17635, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31354)
	recipe:SetCraftedItemID(13510)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.SHATAR)
	recipe:AddMobDrop(10363)
	recipe:AddRepVendor(FAC.SHATAR, REP.EXALTED, 21432)

	-- Flask of Distilled Wisdom -- 17636
	recipe = AddRecipe(17636, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31356)
	recipe:SetCraftedItemID(13511)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)
	recipe:AddMobDrop(10813)

	-- Flask of Supreme Power -- 17637
	recipe = AddRecipe(17637, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31355)
	recipe:SetCraftedItemID(13512)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.KOT)
	recipe:AddMobDrop(10508)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.EXALTED, 21643)

	-- Flask of Chromatic Resistance -- 17638
	recipe = AddRecipe(17638, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(31357)
	recipe:SetCraftedItemID(13513)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.LOWERCITY)
	recipe:AddMobDrop(10339)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.EXALTED, 21655)

	-- Elixir of Frost Power -- 21923
	recipe = AddRecipe(21923, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17709)
	recipe:SetCraftedItemID(17708)
	recipe:SetSkillLevels(190, 190, 210, 230, 250)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddSeason("WINTER_VEIL")

	-- Major Rejuvenation Potion -- 22732
	recipe = AddRecipe(22732, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18257)
	recipe:SetCraftedItemID(18253)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE)
	recipe:AddCustom("MC_RANDOM")

	-- Elixir of Greater Water Breathing -- 22808
	recipe = AddRecipe(22808, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18294)
	recipe:SetSkillLevels(215, 215, 230, 250, 270)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Gurubashi Mojo Madness -- 24266
	recipe = AddRecipe(24266, V.ORIG, Q.RARE)
	recipe:SetCraftedItemID(19931)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Mageblood Elixir -- 24365
	recipe = AddRecipe(24365, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20011)
	recipe:SetCraftedItemID(20007)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Greater Dreamless Sleep Potion -- 24366
	recipe = AddRecipe(24366, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20012)
	recipe:SetCraftedItemID(20002)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Living Action Potion -- 24367
	recipe = AddRecipe(24367, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20013)
	recipe:SetCraftedItemID(20008)
	recipe:SetSkillLevels(285, 285, 300, 320, 340)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(11188)

	-- Mighty Troll's Blood Elixir -- 24368
	recipe = AddRecipe(24368, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20014)
	recipe:SetCraftedItemID(20004)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Transmute: Elemental Fire -- 25146
	recipe = AddRecipe(25146, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20761)
	recipe:SetCraftedItemID(7068)
	recipe:SetSkillLevels(300, 300, 301, 305, 310)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Elixir of Greater Firepower -- 26277
	recipe = AddRecipe(26277, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(21547)
	recipe:SetCraftedItemID(21546)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Elixir of Camouflage -- 28543
	recipe = AddRecipe(28543, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22900)
	recipe:SetCraftedItemID(22823)
	recipe:SetSkillLevels(305, 305, 320, 327, 335)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(16588, 1, 16641, 1, 16705, 1, 18802, 1)

	-- Elixir of Major Strength -- 28544
	recipe = AddRecipe(28544, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22824)
	recipe:SetSkillLevels(305, 305, 320, 327, 335)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Healing Power -- 28545
	recipe = AddRecipe(28545, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22825)
	recipe:SetSkillLevels(310, 310, 325, 332, 340)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Sneaking Potion -- 28546
	recipe = AddRecipe(28546, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22901)
	recipe:SetCraftedItemID(22826)
	recipe:SetSkillLevels(315, 315, 330, 337, 345)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(18017, 1, 19042, 1)

	-- Elixir of Major Frost Power -- 28549
	recipe = AddRecipe(28549, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22902)
	recipe:SetCraftedItemID(22827)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(18005, 1, 18017, 1)

	-- Insane Strength Potion -- 28550
	recipe = AddRecipe(28550, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22903)
	recipe:SetCraftedItemID(22828)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.TANK)
	recipe:AddWorldDrop("Outland")

	-- Super Healing Potion -- 28551
	recipe = AddRecipe(28551, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22829)
	recipe:SetSkillLevels(325, 325, 340, 347, 355)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of the Searching Eye -- 28552
	recipe = AddRecipe(28552, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22904)
	recipe:SetCraftedItemID(22830)
	recipe:SetSkillLevels(325, 325, 340, 347, 355)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE)
	recipe:AddWorldDrop("Outland")

	-- Elixir of Major Agility -- 28553
	recipe = AddRecipe(28553, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(24001)
	recipe:SetCraftedItemID(22831)
	recipe:SetSkillLevels(330, 330, 345, 352, 360)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Shrouding Potion -- 28554
	recipe = AddRecipe(28554, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22906)
	recipe:SetCraftedItemID(22871)
	recipe:SetSkillLevels(335, 335, 350, 357, 365)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.EXALTED, 18382)

	-- Super Mana Potion -- 28555
	recipe = AddRecipe(28555, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22907)
	recipe:SetCraftedItemID(22832)
	recipe:SetSkillLevels(340, 340, 355, 362, 370)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(18005, 1, 19837, 1)

	-- Elixir of Major Firepower -- 28556
	recipe = AddRecipe(28556, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22908)
	recipe:SetCraftedItemID(22833)
	recipe:SetSkillLevels(345, 345, 360, 367, 375)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Elixir of Major Defense -- 28557
	recipe = AddRecipe(28557, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22909)
	recipe:SetCraftedItemID(22834)
	recipe:SetSkillLevels(345, 345, 360, 367, 375)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(18005, 1, 19837, 1)

	-- Elixir of Major Shadow Power -- 28558
	recipe = AddRecipe(28558, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22910)
	recipe:SetCraftedItemID(22835)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Major Dreamless Sleep Potion -- 28562
	recipe = AddRecipe(28562, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22911)
	recipe:SetCraftedItemID(22836)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(19042, 1, 19837, 1)

	-- Heroic Potion -- 28563
	recipe = AddRecipe(28563, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22912)
	recipe:SetCraftedItemID(22837)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS)
	recipe:AddWorldDrop("Outland")

	-- Haste Potion -- 28564
	recipe = AddRecipe(28564, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(35295)
	recipe:SetCraftedItemID(22838)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)

	-- Destruction Potion -- 28565
	recipe = AddRecipe(28565, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22914)
	recipe:SetCraftedItemID(22839)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Transmute: Primal Air to Fire -- 28566
	recipe = AddRecipe(28566, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22915)
	recipe:SetCraftedItemID(21884)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Transmute: Primal Earth to Water -- 28567
	recipe = AddRecipe(28567, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22916)
	recipe:SetCraftedItemID(21885)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.REVERED, 18382)

	-- Transmute: Primal Fire to Earth -- 28568
	recipe = AddRecipe(28568, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(30443)
	recipe:SetCraftedItemID(22452)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.REVERED, 20240)
	recipe:AddRepVendor(FAC.MAGHAR, REP.REVERED, 20241)

	-- Transmute: Primal Water to Air -- 28569
	recipe = AddRecipe(28569, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22918)
	recipe:SetCraftedItemID(22451)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Elixir of Major Mageblood -- 28570
	recipe = AddRecipe(28570, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22919)
	recipe:SetCraftedItemID(22840)
	recipe:SetSkillLevels(355, 355, 370, 375, 380)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop("Outland")

	-- Major Fire Protection Potion -- 28571
	recipe = AddRecipe(28571, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22920)
	recipe:SetCraftedItemID(22841)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19168, 19221)

	-- Major Frost Protection Potion -- 28572
	recipe = AddRecipe(28572, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22921)
	recipe:SetCraftedItemID(22842)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18344)

	-- Major Nature Protection Potion -- 28573
	recipe = AddRecipe(28573, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(22922)
	recipe:SetCraftedItemID(22844)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Major Arcane Protection Potion -- 28575
	recipe = AddRecipe(28575, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22923)
	recipe:SetCraftedItemID(22845)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17150)

	-- Major Shadow Protection Potion -- 28576
	recipe = AddRecipe(28576, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22924)
	recipe:SetCraftedItemID(22846)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(21302)

	-- Major Holy Protection Potion -- 28577
	recipe = AddRecipe(28577, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22925)
	recipe:SetCraftedItemID(22847)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19973)

	-- Elixir of Empowerment -- 28578
	recipe = AddRecipe(28578, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(35294)
	recipe:SetCraftedItemID(22848)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Ironshield Potion -- 28579
	recipe = AddRecipe(28579, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(22927)
	recipe:SetCraftedItemID(22849)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17862)

	-- Transmute: Primal Shadow to Water -- 28580
	recipe = AddRecipe(28580, V.TBC, Q.UNCOMMON)
	recipe:SetCraftedItemID(21885)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Water to Shadow -- 28581
	recipe = AddRecipe(28581, V.TBC, Q.UNCOMMON)
	recipe:SetCraftedItemID(22456)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Mana to Fire -- 28582
	recipe = AddRecipe(28582, V.TBC, Q.UNCOMMON)
	recipe:SetCraftedItemID(21884)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Fire to Mana -- 28583
	recipe = AddRecipe(28583, V.TBC, Q.UNCOMMON)
	recipe:SetCraftedItemID(22457)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Life to Earth -- 28584
	recipe = AddRecipe(28584, V.TBC, Q.UNCOMMON)
	recipe:SetCraftedItemID(22452)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Earth to Life -- 28585
	recipe = AddRecipe(28585, V.TBC, Q.UNCOMMON)
	recipe:SetCraftedItemID(21886)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Super Rejuvenation Potion -- 28586
	recipe = AddRecipe(28586, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22850)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_POTION")

	-- Flask of Fortification -- 28587
	recipe = AddRecipe(28587, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22851)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Mighty Restoration -- 28588
	recipe = AddRecipe(28588, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22853)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Relentless Assault -- 28589
	recipe = AddRecipe(28589, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22854)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Blinding Light -- 28590
	recipe = AddRecipe(28590, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22861)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Pure Death -- 28591
	recipe = AddRecipe(28591, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(22866)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Transmute: Primal Might -- 29688
	recipe = AddRecipe(29688, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(23574)
	recipe:SetCraftedItemID(23571)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddLimitedVendor(16641, 1, 16705, 1, 19074, 1)

	-- Transmute: Earthstorm Diamond -- 32765
	recipe = AddRecipe(32765, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25869)
	recipe:SetCraftedItemID(25867)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Transmute: Skyfire Diamond -- 32766
	recipe = AddRecipe(32766, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29232)
	recipe:SetCraftedItemID(25868)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Volatile Healing Potion -- 33732
	recipe = AddRecipe(33732, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28100)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Unstable Mana Potion -- 33733
	recipe = AddRecipe(33733, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28101)
	recipe:SetSkillLevels(310, 310, 325, 332, 340)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Onslaught Elixir -- 33738
	recipe = AddRecipe(33738, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28102)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Adept's Elixir -- 33740
	recipe = AddRecipe(33740, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28103)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Mastery -- 33741
	recipe = AddRecipe(33741, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(28104)
	recipe:SetSkillLevels(315, 315, 330, 337, 345)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Mercurial Stone -- 38070
	recipe = AddRecipe(38070, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(31080)
	recipe:SetSkillLevels(325, 325, 340, 347, 355)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Fel Strength Elixir -- 38960
	recipe = AddRecipe(38960, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(31680)
	recipe:SetCraftedItemID(31679)
	recipe:SetSkillLevels(335, 335, 350, 357, 365)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS)
	recipe:AddMobDrop(19740, 19755, 21302, 21314)

	-- Fel Mana Potion -- 38961
	recipe = AddRecipe(38961, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(31682)
	recipe:SetCraftedItemID(31677)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19792, 19795, 19796, 19806, 22016, 22017, 22018, 22076, 22093)

	-- Fel Regeneration Potion -- 38962
	recipe = AddRecipe(38962, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(31681)
	recipe:SetCraftedItemID(31676)
	recipe:SetSkillLevels(345, 345, 360, 367, 375)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(19754, 19756, 20878, 20887)

	-- Elixir of Major Fortitude -- 39636
	recipe = AddRecipe(39636, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32062)
	recipe:SetSkillLevels(310, 310, 325, 332, 340)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Earthen Elixir -- 39637
	recipe = AddRecipe(39637, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32070)
	recipe:SetCraftedItemID(32063)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Elixir of Draenic Wisdom -- 39638
	recipe = AddRecipe(39638, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32067)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Elixir of Ironskin -- 39639
	recipe = AddRecipe(39639, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32071)
	recipe:SetCraftedItemID(32068)
	recipe:SetSkillLevels(330, 330, 345, 352, 360)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.PVP, F.IBOE, F.RBOP)
	recipe:AddVendor(18821, 18822)

	-- Cauldron of Major Arcane Protection -- 41458
	recipe = AddRecipe(41458, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32839)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Fire Protection -- 41500
	recipe = AddRecipe(41500, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32849)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Frost Protection -- 41501
	recipe = AddRecipe(41501, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32850)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Nature Protection -- 41502
	recipe = AddRecipe(41502, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32851)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Shadow Protection -- 41503
	recipe = AddRecipe(41503, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(32852)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Flask of Chromatic Wonder -- 42736
	recipe = AddRecipe(42736, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(33209)
	recipe:SetCraftedItemID(33208)
	recipe:SetSkillLevels(375, 375, 390, 397, 405)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.VIOLETEYE)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.HONORED, 18255)

	-- Mad Alchemist's Potion -- 45061
	recipe = AddRecipe(45061, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(34440)
	recipe:SetSkillLevels(325, 325, 335, 342, 350)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 16588, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Guardian's Alchemist Stone -- 47046
	recipe = AddRecipe(47046, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35752)
	recipe:SetCraftedItemID(35748)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Sorcerer's Alchemist Stone -- 47048
	recipe = AddRecipe(47048, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35753)
	recipe:SetCraftedItemID(35749)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Redeemer's Alchemist Stone -- 47049
	recipe = AddRecipe(47049, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35754)
	recipe:SetCraftedItemID(35750)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Assassin's Alchemist Stone -- 47050
	recipe = AddRecipe(47050, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(35755)
	recipe:SetCraftedItemID(35751)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOP, F.RBOP, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Transmute: Eternal Life to Shadow -- 53771
	recipe = AddRecipe(53771, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35627)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Life to Fire -- 53773
	recipe = AddRecipe(53773, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(36860)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Fire to Water -- 53774
	recipe = AddRecipe(53774, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35622)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Fire to Life -- 53775
	recipe = AddRecipe(53775, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35625)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Air to Water -- 53776
	recipe = AddRecipe(53776, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35622)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Air to Earth -- 53777
	recipe = AddRecipe(53777, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35624)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Shadow to Earth -- 53779
	recipe = AddRecipe(53779, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35624)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Shadow to Life -- 53780
	recipe = AddRecipe(53780, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35625)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Earth to Air -- 53781
	recipe = AddRecipe(53781, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35623)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Earth to Shadow -- 53782
	recipe = AddRecipe(53782, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35627)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Water to Air -- 53783
	recipe = AddRecipe(53783, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(35623)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Water to Fire -- 53784
	recipe = AddRecipe(53784, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(36860)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Pygmy Oil -- 53812
	recipe = AddRecipe(53812, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40195)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Runic Healing Potion -- 53836
	recipe = AddRecipe(53836, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33447)
	recipe:SetSkillLevels(405, 405, 415, 420, 425)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Runic Mana Potion -- 53837
	recipe = AddRecipe(53837, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33448)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Resurgent Healing Potion -- 53838
	recipe = AddRecipe(53838, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39671)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Icy Mana Potion -- 53839
	recipe = AddRecipe(53839, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40067)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Mighty Agility -- 53840
	recipe = AddRecipe(53840, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39666)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Wrath Elixir -- 53841
	recipe = AddRecipe(53841, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40068)
	recipe:SetSkillLevels(355, 355, 365, 370, 375)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Spellpower Elixir -- 53842
	recipe = AddRecipe(53842, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40070)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Spirit -- 53847
	recipe = AddRecipe(53847, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40072)
	recipe:SetSkillLevels(385, 385, 395, 400, 405)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Guru's Elixir -- 53848
	recipe = AddRecipe(53848, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40076)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Crazy Alchemist's Potion -- 53895
	recipe = AddRecipe(53895, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40077)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Fortitude -- 53898
	recipe = AddRecipe(53898, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40078)
	recipe:SetSkillLevels(390, 390, 400, 405, 410)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Lesser Flask of Toughness -- 53899
	recipe = AddRecipe(53899, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40079)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Potion of Nightmares -- 53900
	recipe = AddRecipe(53900, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40081)
	recipe:SetSkillLevels(380, 380, 390, 395, 400)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of the Frost Wyrm -- 53901
	recipe = AddRecipe(53901, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(46376)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588)

	-- Flask of Stoneblood -- 53902
	recipe = AddRecipe(53902, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(46379)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588)

	-- Flask of Endless Rage -- 53903
	recipe = AddRecipe(53903, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(46377)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588)

	-- Powerful Rejuvenation Potion -- 53904
	recipe = AddRecipe(53904, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40087)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Indestructible Potion -- 53905
	recipe = AddRecipe(53905, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40093)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mighty Arcane Protection Potion -- 53936
	recipe = AddRecipe(53936, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44564)
	recipe:SetCraftedItemID(40213)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(31702, 32297)

	-- Mighty Frost Protection Potion -- 53937
	recipe = AddRecipe(53937, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44566)
	recipe:SetCraftedItemID(40215)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32289)

	-- Mighty Shadow Protection Potion -- 53938
	recipe = AddRecipe(53938, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44568)
	recipe:SetCraftedItemID(40217)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32349)

	-- Mighty Fire Protection Potion -- 53939
	recipe = AddRecipe(53939, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44565)
	recipe:SetCraftedItemID(40214)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(30921)

	-- Mighty Nature Protection Potion -- 53942
	recipe = AddRecipe(53942, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(44567)
	recipe:SetCraftedItemID(40216)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32290)

	-- Flask of Pure Mojo -- 54213
	recipe = AddRecipe(54213, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(46378)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588)

	-- Elixir of Mighty Strength -- 54218
	recipe = AddRecipe(54218, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40073)
	recipe:SetSkillLevels(385, 385, 395, 400, 405)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Protection -- 54220
	recipe = AddRecipe(54220, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40097)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Potion of Speed -- 54221
	recipe = AddRecipe(54221, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40211)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Potion of Wild Magic -- 54222
	recipe = AddRecipe(54222, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40212)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Mageblood -- 56519
	recipe = AddRecipe(56519, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40109)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Transmute: Skyflare Diamond -- 57425
	recipe = AddRecipe(57425, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41266)
	recipe:SetSkillLevels(430, 430, 440, 445, 450)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Earthsiege Diamond -- 57427
	recipe = AddRecipe(57427, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41334)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Endless Mana Potion -- 58868
	recipe = AddRecipe(58868, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43570)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Endless Healing Potion -- 58871
	recipe = AddRecipe(58871, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43569)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Titanium -- 60350
	recipe = AddRecipe(60350, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41163)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Accuracy -- 60354
	recipe = AddRecipe(60354, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44325)
	recipe:SetSkillLevels(400, 400, 415, 422, 430)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Deadly Strikes -- 60355
	recipe = AddRecipe(60355, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44327)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Defense -- 60356
	recipe = AddRecipe(60356, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44328)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Expertise -- 60357
	recipe = AddRecipe(60357, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44329)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Armor Piercing -- 60365
	recipe = AddRecipe(60365, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44330)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Lightning Speed -- 60366
	recipe = AddRecipe(60366, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44331)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Thoughts -- 60367
	recipe = AddRecipe(60367, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44332)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mercurial Alchemist Stone -- 60396
	recipe = AddRecipe(60396, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44322)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Indestructible Alchemist Stone -- 60403
	recipe = AddRecipe(60403, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44323)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.TANK)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mighty Alchemist Stone -- 60405
	recipe = AddRecipe(60405, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44324)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Northrend Alchemy Research -- 60893
	recipe = AddRecipe(60893, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Lesser Flask of Resistance -- 62213
	recipe = AddRecipe(62213, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44939)
	recipe:SetSkillLevels(385, 385, 395, 400, 405)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Ethereal Oil -- 62409
	recipe = AddRecipe(62409, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44958)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Water Walking -- 62410
	recipe = AddRecipe(62410, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(8827)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Minor Accuracy -- 63732
	recipe = AddRecipe(63732, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45621)
	recipe:SetSkillLevels(135, 135, 160, 180, 200)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630, 33674)

	-- Transmute: Ametrine -- 66658
	recipe = AddRecipe(66658, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36931)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Cardinal Ruby -- 66659
	recipe = AddRecipe(66659, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36919)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(14151)

	-- Transmute: King's Amber -- 66660
	recipe = AddRecipe(66660, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36922)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Dreadstone -- 66662
	recipe = AddRecipe(66662, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36928)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Majestic Zircon -- 66663
	recipe = AddRecipe(66663, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36925)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Eye of Zul -- 66664
	recipe = AddRecipe(66664, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(36934)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of the North -- 67025
	recipe = AddRecipe(67025, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(47499)
	recipe:SetSkillLevels(425, 425, 440, 445, 450)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5499, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Living Elements -- 78866
	recipe = AddRecipe(78866, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(54464)
	recipe:SetSkillLevels(485, 485, 510, 515, 520)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Shadowspirit Diamond -- 80237
	recipe = AddRecipe(80237, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52303)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Truegold -- 80243
	recipe = AddRecipe(80243, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58480)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Pyrium Bar -- 80244
	recipe = AddRecipe(80244, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(51950)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Inferno Ruby -- 80245
	recipe = AddRecipe(80245, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52190)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Ocean Sapphire -- 80246
	recipe = AddRecipe(80246, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52191)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Amberjewel -- 80247
	recipe = AddRecipe(80247, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52195)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Demonseye -- 80248
	recipe = AddRecipe(80248, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52194)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Ember Topaz -- 80250
	recipe = AddRecipe(80250, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52193)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Transmute: Dream Emerald -- 80251
	recipe = AddRecipe(80251, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52192)
	recipe:SetSkillLevels(505, 505, 510, 515, 520)
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Potion of Illusion -- 80269
	recipe = AddRecipe(80269, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58489)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Ghost Elixir -- 80477
	recipe = AddRecipe(80477, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58084)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Earthen Potion -- 80478
	recipe = AddRecipe(80478, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58090)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Deathblood Venom -- 80479
	recipe = AddRecipe(80479, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58142)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of the Naga -- 80480
	recipe = AddRecipe(80480, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58089)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Volcanic Potion -- 80481
	recipe = AddRecipe(80481, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58091)
	recipe:SetSkillLevels(460, 460, 465, 470, 475)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Potion of Concentration -- 80482
	recipe = AddRecipe(80482, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(57194)
	recipe:SetSkillLevels(465, 465, 470, 475, 480)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of the Cobra -- 80484
	recipe = AddRecipe(80484, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58092)
	recipe:SetSkillLevels(465, 465, 470, 475, 480)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Deepstone Oil -- 80486
	recipe = AddRecipe(80486, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56850)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mysterious Potion -- 80487
	recipe = AddRecipe(80487, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(57099)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Deep Earth -- 80488
	recipe = AddRecipe(80488, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58093)
	recipe:SetSkillLevels(475, 475, 480, 485, 490)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mighty Rejuvenation Potion -- 80490
	recipe = AddRecipe(80490, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(57193)
	recipe:SetSkillLevels(475, 475, 480, 485, 490)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Impossible Accuracy -- 80491
	recipe = AddRecipe(80491, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58094)
	recipe:SetSkillLevels(480, 480, 485, 490, 495)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Prismatic Elixir -- 80492
	recipe = AddRecipe(80492, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58143)
	recipe:SetSkillLevels(480, 480, 485, 490, 495)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of Mighty Speed -- 80493
	recipe = AddRecipe(80493, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58144)
	recipe:SetSkillLevels(490, 490, 495, 500, 505)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mythical Mana Potion -- 80494
	recipe = AddRecipe(80494, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(57192)
	recipe:SetSkillLevels(485, 485, 490, 495, 500)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Potion of the Tol'vir -- 80495
	recipe = AddRecipe(80495, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58145)
	recipe:SetSkillLevels(485, 485, 490, 495, 500)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Golemblood Potion -- 80496
	recipe = AddRecipe(80496, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58146)
	recipe:SetSkillLevels(490, 490, 495, 500, 505)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Elixir of the Master -- 80497
	recipe = AddRecipe(80497, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58148)
	recipe:SetSkillLevels(495, 495, 500, 505, 510)
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Mythical Healing Potion -- 80498
	recipe = AddRecipe(80498, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(57191)
	recipe:SetSkillLevels(495, 495, 500, 505, 510)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Lifebound Alchemist Stone -- 80508
	recipe = AddRecipe(80508, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58483)
	recipe:SetSkillLevels(500, 500, 510, 512, 515)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of Steelskin -- 80719
	recipe = AddRecipe(80719, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58085)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of the Draconic Mind -- 80720
	recipe = AddRecipe(80720, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58086)
	recipe:SetSkillLevels(505, 505, 510, 515, 520)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of the Winds -- 80721
	recipe = AddRecipe(80721, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58087)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of Titanic Strength -- 80723
	recipe = AddRecipe(80723, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58088)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of Enhancement -- 80724
	recipe = AddRecipe(80724, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58149)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Potion of Deepholm -- 80725
	recipe = AddRecipe(80725, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58487)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Potion of Treasure Finding -- 80726
	recipe = AddRecipe(80726, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(58488)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Cauldron of Battle -- 92643
	recipe = AddRecipe(92643, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62288)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5465)

	-- Big Cauldron of Battle -- 92688
	recipe = AddRecipe(92688, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(65460)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.IBOP, F.RBOP, F.ACHIEVEMENT)
	recipe:AddAchievement(5024)

	-- Vial of the Sands -- 93328
	recipe = AddRecipe(93328, V.CATA, Q.EPIC)
	recipe:SetCraftedItemID(65891)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddCustom("ARCH_DROP_ULD")

	-- Draught of War -- 93935
	recipe = AddRecipe(93935, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67415)
	recipe:SetSkillLevels(425, 425, 440, 450, 460)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Flask of Flowing Water -- 94162
	recipe = AddRecipe(94162, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67438)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Volatile Alchemist Stone -- 96252
	recipe = AddRecipe(96252, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(68775)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Quicksilver Alchemist Stone -- 96253
	recipe = AddRecipe(96253, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(68776)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	-- Vibrant Alchemist Stone -- 96254
	recipe = AddRecipe(96254, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(68777)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 4160, 4611, 5177, 5499, 19052, 26951, 26975, 27023, 27029, 28703, 33588, 33608, 33630)

	self.InitAlchemy = nil
end
