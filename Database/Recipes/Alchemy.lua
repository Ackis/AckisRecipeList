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
local Z = private.ZONE_NAMES

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
	recipe:SetSkillLevels(1, 1, 55, 75, 95)
	recipe:SetCraftedItem(2454, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Minor Healing Potion -- 2330
	recipe = AddRecipe(2330, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 55, 75, 95)
	recipe:SetCraftedItem(118, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Minor Mana Potion -- 2331
	recipe = AddRecipe(2331, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(25, 25, 65, 85, 105)
	recipe:SetCraftedItem(2455, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47384, 47418, 47420, 47431, 56777, 65186)

	-- Minor Rejuvenation Potion -- 2332
	recipe = AddRecipe(2332, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(40, 40, 70, 90, 110)
	recipe:SetCraftedItem(2456, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47384, 47418, 47420, 47431, 56777, 65186)

	-- Elixir of Lesser Agility -- 2333
	recipe = AddRecipe(2333, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:SetRecipeItem(3396, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3390, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Elixir of Minor Fortitude -- 2334
	recipe = AddRecipe(2334, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(50, 50, 80, 100, 120)
	recipe:SetCraftedItem(2458, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47384, 47418, 47420, 47431, 56777, 65186)

	-- Swiftness Potion -- 2335
	recipe = AddRecipe(2335, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(60, 60, 90, 110, 130)
	recipe:SetRecipeItem(2555, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(2459, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Lesser Healing Potion -- 2337
	recipe = AddRecipe(2337, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(55, 55, 85, 105, 125)
	recipe:SetCraftedItem(858, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47384, 47418, 47420, 47431, 56777, 65186)

	-- Weak Troll's Blood Elixir -- 3170
	recipe = AddRecipe(3170, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(15, 15, 60, 80, 100)
	recipe:SetCraftedItem(3382, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1246, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 47384, 47418, 47420, 47431, 56777, 65186)

	-- Elixir of Wisdom -- 3171
	recipe = AddRecipe(3171, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:SetCraftedItem(3383, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Lesser Mana Potion -- 3173
	recipe = AddRecipe(3173, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(120, 120, 145, 165, 185)
	recipe:SetCraftedItem(3385, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Potion of Curing -- 3174
	recipe = AddRecipe(3174, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(120, 120, 145, 165, 185)
	recipe:SetRecipeItem(3394, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3386, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Limited Invulnerability Potion -- 3175
	recipe = AddRecipe(3175, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(250, 250, 275, 295, 315)
	recipe:SetRecipeItem(3395, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3387, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Strong Troll's Blood Elixir -- 3176
	recipe = AddRecipe(3176, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(125, 125, 150, 170, 190)
	recipe:SetCraftedItem(3388, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Defense -- 3177
	recipe = AddRecipe(3177, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(130, 130, 155, 175, 195)
	recipe:SetCraftedItem(3389, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Ogre's Strength -- 3188
	recipe = AddRecipe(3188, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:SetRecipeItem(6211, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3391, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Elixir of Minor Agility -- 3230
	recipe = AddRecipe(3230, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(50, 50, 80, 100, 120)
	recipe:SetRecipeItem(2553, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(2457, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Healing Potion -- 3447
	recipe = AddRecipe(3447, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(110, 110, 135, 155, 175)
	recipe:SetCraftedItem(929, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Lesser Invisibility Potion -- 3448
	recipe = AddRecipe(3448, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(165, 165, 185, 205, 225)
	recipe:SetCraftedItem(3823, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Shadow Oil -- 3449
	recipe = AddRecipe(3449, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(165, 165, 190, 210, 230)
	recipe:SetRecipeItem(6068, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(3824, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(3347, 3603, 5177, 5499, 16723, 18802, 19052, 26903, 26987, 28703, 33608, 33630, 56777, 65186)

	-- Elixir of Fortitude -- 3450
	recipe = AddRecipe(3450, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:SetRecipeItem(3830, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3825, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Major Troll's Blood Elixir -- 3451
	recipe = AddRecipe(3451, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(180, 180, 200, 220, 240)
	recipe:SetRecipeItem(3831, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3826, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Mana Potion -- 3452
	recipe = AddRecipe(3452, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(160, 160, 180, 200, 220)
	recipe:SetCraftedItem(3827, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Detect Lesser Invisibility -- 3453
	recipe = AddRecipe(3453, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(195, 195, 215, 235, 255)
	recipe:SetRecipeItem(3832, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3828, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Frost Oil -- 3454
	recipe = AddRecipe(3454, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:SetRecipeItem(14634, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3829, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(2480, 1)

	-- Discolored Healing Potion -- 4508
	recipe = AddRecipe(4508, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(50, 50, 80, 100, 120)
	recipe:SetRecipeItem(4597, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(4596, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Lesser Stoneshield Potion -- 4942
	recipe = AddRecipe(4942, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(215, 215, 230, 250, 270)
	recipe:SetRecipeItem(4624, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(4623, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.TANK)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Rage Potion -- 6617
	recipe = AddRecipe(6617, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(60, 60, 90, 110, 130)
	recipe:SetRecipeItem(5640, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(5631, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddVendor(1685, 3499)
	recipe:AddLimitedVendor(3335, 2)

	-- Great Rage Potion -- 6618
	recipe = AddRecipe(6618, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(175, 175, 195, 215, 235)
	recipe:SetRecipeItem(5643, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(5633, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddLimitedVendor(3335, 2, 4226, 1)

	-- Free Action Potion -- 6624
	recipe = AddRecipe(6624, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(150, 150, 175, 195, 215)
	recipe:SetRecipeItem(5642, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(5634, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(3348, 1, 4226, 1, 5178, 1)

	-- Elixir of Water Breathing -- 7179
	recipe = AddRecipe(7179, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:SetCraftedItem(5996, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Greater Healing Potion -- 7181
	recipe = AddRecipe(7181, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(155, 155, 175, 195, 215)
	recipe:SetCraftedItem(1710, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Minor Defense -- 7183
	recipe = AddRecipe(7183, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(1, 1, 55, 75, 95)
	recipe:SetCraftedItem(5997, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Holy Protection Potion -- 7255
	recipe = AddRecipe(7255, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:SetRecipeItem(6053, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6051, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(1685, 1, 3134, 1, 3490, 1)

	-- Shadow Protection Potion -- 7256
	recipe = AddRecipe(7256, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(135, 135, 160, 180, 200)
	recipe:SetRecipeItem(6054, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6048, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.HORDE)
	recipe:AddLimitedVendor(2393, 1)

	-- Fire Protection Potion -- 7257
	recipe = AddRecipe(7257, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(165, 165, 210, 230, 250)
	recipe:SetRecipeItem(6055, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6049, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.HORDE)
	recipe:AddLimitedVendor(4083, 1)

	-- Frost Protection Potion -- 7258
	recipe = AddRecipe(7258, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(190, 190, 205, 225, 245)
	recipe:SetRecipeItem(6056, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6050, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(2812, 1, 2848, 1)

	-- Nature Protection Potion -- 7259
	recipe = AddRecipe(7259, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(190, 190, 210, 230, 250)
	recipe:SetRecipeItem(6057, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6052, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(2848, 1, 5594, 1, 8157, 1, 8158, 1)

	-- Blackmouth Oil -- 7836
	recipe = AddRecipe(7836, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(80, 80, 80, 90, 100)
	recipe:SetCraftedItem(6370, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Fire Oil -- 7837
	recipe = AddRecipe(7837, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(130, 130, 150, 160, 170)
	recipe:SetCraftedItem(6371, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Swim Speed Potion -- 7841
	recipe = AddRecipe(7841, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(100, 100, 130, 150, 170)
	recipe:SetCraftedItem(6372, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Firepower -- 7845
	recipe = AddRecipe(7845, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(140, 140, 165, 185, 205)
	recipe:SetCraftedItem(6373, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Giant Growth -- 8240
	recipe = AddRecipe(8240, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(90, 90, 120, 140, 160)
	recipe:SetRecipeItem(6663, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6662, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.NORTHERN_BARRENS, Z.SOUTHERN_BARRENS)

	-- Greater Mana Potion -- 11448
	recipe = AddRecipe(11448, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(205, 205, 220, 240, 260)
	recipe:SetCraftedItem(6149, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Agility -- 11449
	recipe = AddRecipe(11449, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(185, 185, 205, 225, 245)
	recipe:SetCraftedItem(8949, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Greater Defense -- 11450
	recipe = AddRecipe(11450, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(195, 195, 215, 235, 255)
	recipe:SetCraftedItem(8951, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Oil of Immolation -- 11451
	recipe = AddRecipe(11451, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(205, 205, 220, 240, 260)
	recipe:SetCraftedItem(8956, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Restorative Potion -- 11452
	recipe = AddRecipe(11452, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(210, 210, 225, 245, 265)
	recipe:SetCraftedItem(9030, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Goblin Rocket Fuel -- 11456
	recipe = AddRecipe(11456, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(210, 210, 225, 245, 265)
	recipe:SetRecipeItem(10644, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(9061, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddCustom("CRAFTED_ENGINEERS")

	-- Superior Healing Potion -- 11457
	recipe = AddRecipe(11457, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(215, 215, 230, 250, 270)
	recipe:SetCraftedItem(3928, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Wildvine Potion -- 11458
	recipe = AddRecipe(11458, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetRecipeItem(9294, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9144, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS)

	-- Philosopher's Stone -- 11459
	recipe = AddRecipe(11459, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetRecipeItem(9303, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9149, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER)
	recipe:AddVendor(5594)

	-- Elixir of Detect Undead -- 11460
	recipe = AddRecipe(11460, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(230, 230, 245, 265, 285)
	recipe:SetCraftedItem(9154, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Arcane Elixir -- 11461
	recipe = AddRecipe(11461, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(235, 235, 250, 270, 290)
	recipe:SetCraftedItem(9155, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Invisibility Potion -- 11464
	recipe = AddRecipe(11464, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(235, 235, 250, 270, 290)
	recipe:SetRecipeItem(9295, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9172, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Elixir of Greater Intellect -- 11465
	recipe = AddRecipe(11465, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(235, 235, 250, 270, 290)
	recipe:SetCraftedItem(9179, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Gift of Arthas -- 11466
	recipe = AddRecipe(11466, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(240, 240, 255, 275, 295)
	recipe:SetRecipeItem(9296, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Elixir of Greater Agility -- 11467
	recipe = AddRecipe(11467, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(240, 240, 255, 275, 295)
	recipe:SetCraftedItem(9187, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Dream Vision -- 11468
	recipe = AddRecipe(11468, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(240, 240, 255, 275, 295)
	recipe:SetRecipeItem(9297, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9197, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Elixir of Giants -- 11472
	recipe = AddRecipe(11472, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(245, 245, 260, 280, 300)
	recipe:SetRecipeItem(9298, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9206, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Ghost Dye -- 11473
	recipe = AddRecipe(11473, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(245, 245, 260, 280, 300)
	recipe:SetRecipeItem(9302, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9210, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(8157, 1, 8158, 1)

	-- Elixir of Shadow Power -- 11476
	recipe = AddRecipe(11476, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetRecipeItem(9301, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9264, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(1313, 1, 4610, 1)

	-- Elixir of Demonslaying -- 11477
	recipe = AddRecipe(11477, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetRecipeItem(9300, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(9224, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddLimitedVendor(8177, 1, 8178, 1)

	-- Elixir of Detect Demon -- 11478
	recipe = AddRecipe(11478, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetCraftedItem(9233, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Transmute: Iron to Gold -- 11479
	recipe = AddRecipe(11479, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetRecipeItem(9304, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(3577, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(5594)

	-- Transmute: Mithril to Truesilver -- 11480
	recipe = AddRecipe(11480, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(225, 225, 240, 260, 280)
	recipe:SetRecipeItem(9305, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(6037, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(5594, 1)

	-- Catseye Elixir -- 12609
	recipe = AddRecipe(12609, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(200, 200, 220, 240, 260)
	recipe:SetCraftedItem(10592, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Dreamless Sleep Potion -- 15833
	recipe = AddRecipe(15833, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(230, 230, 245, 265, 285)
	recipe:SetCraftedItem(12190, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Transmute: Arcanite -- 17187
	recipe = AddRecipe(17187, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(12958, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(12360, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(5594)

	-- Stonescale Oil -- 17551
	recipe = AddRecipe(17551, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:SetCraftedItem(13423, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Mighty Rage Potion -- 17552
	recipe = AddRecipe(17552, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(255, 255, 270, 290, 310)
	recipe:SetRecipeItem(13476, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13442, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK, F.DRUID, F.WARRIOR)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Superior Mana Potion -- 17553
	recipe = AddRecipe(17553, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(260, 260, 275, 295, 315)
	recipe:SetRecipeItem(13477, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13443, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Superior Defense -- 17554
	recipe = AddRecipe(17554, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(265, 265, 280, 300, 320)
	recipe:SetRecipeItem(13478, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13445, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddLimitedVendor(3348, 1, 5178, 1)

	-- Elixir of the Sages -- 17555
	recipe = AddRecipe(17555, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(270, 270, 285, 305, 325)
	recipe:SetRecipeItem(13479, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13447, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Major Healing Potion -- 17556
	recipe = AddRecipe(17556, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetRecipeItem(13480, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13446, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Brute Force -- 17557
	recipe = AddRecipe(17557, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetRecipeItem(13481, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13453, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Transmute: Air to Fire -- 17559
	recipe = AddRecipe(17559, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13482, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(7078, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.ARGENTDAWN)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Transmute: Fire to Earth -- 17560
	recipe = AddRecipe(17560, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13483, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(7076, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(9499)

	-- Transmute: Earth to Water -- 17561
	recipe = AddRecipe(17561, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13484, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(7080, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TIMBERMAW_HOLD)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Transmute: Water to Air -- 17562
	recipe = AddRecipe(17562, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13485, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(7082, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(11278)

	-- Transmute: Undeath to Water -- 17563
	recipe = AddRecipe(17563, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13486, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(7080, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Transmute: Water to Undeath -- 17564
	recipe = AddRecipe(17564, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13487, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(12808, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Transmute: Life to Earth -- 17565
	recipe = AddRecipe(17565, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13488, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(7076, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Transmute: Earth to Life -- 17566
	recipe = AddRecipe(17566, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(275, 275, 275, 282, 290)
	recipe:SetRecipeItem(13489, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(12803, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Greater Stoneshield Potion -- 17570
	recipe = AddRecipe(17570, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(280, 280, 295, 315, 335)
	recipe:SetRecipeItem(13490, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13455, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Elixir of the Mongoose -- 17571
	recipe = AddRecipe(17571, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(280, 280, 295, 315, 335)
	recipe:SetRecipeItem(13491, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13452, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.DPS, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Purification Potion -- 17572
	recipe = AddRecipe(17572, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(285, 285, 300, 320, 340)
	recipe:SetRecipeItem(13492, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13462, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Greater Arcane Elixir -- 17573
	recipe = AddRecipe(17573, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(285, 285, 300, 320, 340)
	recipe:SetRecipeItem(13493, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13454, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Greater Fire Protection Potion -- 17574
	recipe = AddRecipe(17574, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetRecipeItem(13494, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13457, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE)
	recipe:AddMobDrop(9262, 9264)

	-- Greater Frost Protection Potion -- 17575
	recipe = AddRecipe(17575, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetRecipeItem(13495, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13456, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Greater Nature Protection Potion -- 17576
	recipe = AddRecipe(17576, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetRecipeItem(13496, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13458, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(15174, 1)

	-- Greater Arcane Protection Potion -- 17577
	recipe = AddRecipe(17577, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetRecipeItem(13497, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13461, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Greater Shadow Protection Potion -- 17578
	recipe = AddRecipe(17578, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetRecipeItem(13499, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13459, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Major Mana Potion -- 17580
	recipe = AddRecipe(17580, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(295, 295, 310, 330, 350)
	recipe:SetRecipeItem(13501, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(13444, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE)
	recipe:AddMobDrop(1853)
	recipe:AddVendor(11278)

	-- Alchemist Stone -- 17632
	recipe = AddRecipe(17632, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(13517, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(13503, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Potion of Petrification -- 17634
	recipe = AddRecipe(17634, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetRecipeItem(13518, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(13506, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.EASTERN_KINGDOMS, Z.KALIMDOR)

	-- Flask of the Titans -- 17635
	recipe = AddRecipe(17635, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetRecipeItem(31354, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(13510, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.SHATAR)
	recipe:AddMobDrop(10363)
	recipe:AddRepVendor(FAC.SHATAR, REP.EXALTED, 21432)

	-- Flask of Distilled Wisdom -- 17636
	recipe = AddRecipe(17636, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetRecipeItem(31356, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(13511, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)
	recipe:AddMobDrop(10813)

	-- Flask of Supreme Power -- 17637
	recipe = AddRecipe(17637, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetRecipeItem(31355, "BIND_ON_PICKUP")
	--recipe:SetCraftedItem(13512, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	--recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.HEALER, F.CASTER, F.KOT)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.KOT)
	--recipe:AddMobDrop(10508)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.EXALTED, 21643)

	-- Elixir of Frost Power -- 21923
	recipe = AddRecipe(21923, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(190, 190, 210, 230, 250)
	recipe:SetRecipeItem(17709, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(17708, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddSeason("WINTER_VEIL")

	-- Major Rejuvenation Potion -- 22732
	recipe = AddRecipe(22732, V.ORIG, Q.RARE)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:SetRecipeItem(18257, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(18253, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID)
	recipe:AddCustom("MC_RANDOM")

	-- Elixir of Greater Water Breathing -- 22808
	recipe = AddRecipe(22808, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(215, 215, 230, 250, 270)
	recipe:SetCraftedItem(18294, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Gurubashi Mojo Madness -- 24266
	recipe = AddRecipe(24266, V.ORIG, Q.RARE)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetCraftedItem(19931, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Mageblood Elixir -- 24365
	recipe = AddRecipe(24365, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetRecipeItem(20011, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(20007, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Greater Dreamless Sleep Potion -- 24366
	recipe = AddRecipe(24366, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(275, 275, 290, 310, 330)
	recipe:SetRecipeItem(20012, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(20002, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Living Action Potion -- 24367
	recipe = AddRecipe(24367, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(285, 285, 300, 320, 340)
	recipe:SetRecipeItem(20013, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(20008, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddVendor(11188)

	-- Mighty Troll's Blood Elixir -- 24368
	recipe = AddRecipe(24368, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(290, 290, 305, 325, 345)
	recipe:SetRecipeItem(20014, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(20004, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Transmute: Elemental Fire -- 25146
	recipe = AddRecipe(25146, V.ORIG, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 301, 305, 310)
	recipe:SetRecipeItem(20761, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(7068, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.THORIUM_BROTHERHOOD)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.FRIENDLY, 12944)

	-- Elixir of Greater Firepower -- 26277
	recipe = AddRecipe(26277, V.ORIG, Q.UNCOMMON)
	recipe:SetSkillLevels(250, 250, 265, 285, 305)
	recipe:SetRecipeItem(21547, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(21546, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.HEALER, F.CASTER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Elixir of Camouflage -- 28543
	recipe = AddRecipe(28543, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 320, 327, 335)
	recipe:SetRecipeItem(22900, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22823, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(16588, 1, 16641, 1, 16705, 1, 18802, 1)

	-- Elixir of Major Strength -- 28544
	recipe = AddRecipe(28544, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(305, 305, 320, 327, 335)
	recipe:SetCraftedItem(22824, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Healing Power -- 28545
	recipe = AddRecipe(28545, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 325, 332, 340)
	recipe:SetCraftedItem(22825, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Sneaking Potion -- 28546
	recipe = AddRecipe(28546, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(315, 315, 330, 337, 345)
	recipe:SetRecipeItem(22901, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22826, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(18017, 1, 19042, 1)

	-- Elixir of Major Frost Power -- 28549
	recipe = AddRecipe(28549, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetRecipeItem(22902, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22827, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddLimitedVendor(18005, 1, 18017, 1)

	-- Insane Strength Potion -- 28550
	recipe = AddRecipe(28550, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetRecipeItem(22903, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22828, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.TANK)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Super Healing Potion -- 28551
	recipe = AddRecipe(28551, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 340, 347, 355)
	recipe:SetCraftedItem(22829, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of the Searching Eye -- 28552
	recipe = AddRecipe(28552, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(325, 325, 340, 347, 355)
	recipe:SetRecipeItem(22904, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22830, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Elixir of Major Agility -- 28553
	recipe = AddRecipe(28553, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(330, 330, 345, 352, 360)
	recipe:SetRecipeItem(22905, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22831, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Shrouding Potion -- 28554
	recipe = AddRecipe(28554, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(335, 335, 350, 357, 365)
	recipe:SetRecipeItem(22906, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22871, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.EXALTED, 18382)

	-- Super Mana Potion -- 28555
	recipe = AddRecipe(28555, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(340, 340, 355, 362, 370)
	recipe:SetRecipeItem(22907, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22832, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(18005, 1, 19837, 1)

	-- Elixir of Major Firepower -- 28556
	recipe = AddRecipe(28556, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(345, 345, 360, 367, 375)
	recipe:SetRecipeItem(22908, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22833, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Elixir of Major Defense -- 28557
	recipe = AddRecipe(28557, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(345, 345, 360, 367, 375)
	recipe:SetRecipeItem(22909, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22834, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddLimitedVendor(18005, 1, 19837, 1)

	-- Elixir of Major Shadow Power -- 28558
	recipe = AddRecipe(28558, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22910, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22835, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.LOWERCITY)
	recipe:AddRepVendor(FAC.LOWERCITY, REP.REVERED, 21655)

	-- Major Dreamless Sleep Potion -- 28562
	recipe = AddRecipe(28562, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22911, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22836, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(19042, 1, 19837, 1)

	-- Heroic Potion -- 28563
	recipe = AddRecipe(28563, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22912, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22837, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Haste Potion -- 28564
	recipe = AddRecipe(28564, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(35295, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22838, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE)
	recipe:AddMobDrop(24664)

	-- Destruction Potion -- 28565
	recipe = AddRecipe(28565, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22914, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22839, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Transmute: Primal Air to Fire -- 28566
	recipe = AddRecipe(28566, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22915, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(21884, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.REVERED, 21432)

	-- Transmute: Primal Earth to Water -- 28567
	recipe = AddRecipe(28567, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22916, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(21885, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SPOREGGAR)
	recipe:AddRepVendor(FAC.SPOREGGAR, REP.REVERED, 18382)

	-- Transmute: Primal Fire to Earth -- 28568
	recipe = AddRecipe(28568, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(30443, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22452, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.REVERED, 20240)
	recipe:AddRepVendor(FAC.MAGHAR, REP.REVERED, 20241)

	-- Transmute: Primal Water to Air -- 28569
	recipe = AddRecipe(28569, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(22918, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22451, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.REVERED, 17904)

	-- Elixir of Major Mageblood -- 28570
	recipe = AddRecipe(28570, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(355, 355, 370, 375, 380)
	recipe:SetRecipeItem(22919, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(22840, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Major Fire Protection Potion -- 28571
	recipe = AddRecipe(28571, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(22920, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22841, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE)
	recipe:AddMobDrop(19168, 19221)

	-- Major Frost Protection Potion -- 28572
	recipe = AddRecipe(28572, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(22921, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22842, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE)
	recipe:AddMobDrop(18344)

	-- Major Nature Protection Potion -- 28573
	recipe = AddRecipe(28573, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(22922, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22844, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Major Arcane Protection Potion -- 28575
	recipe = AddRecipe(28575, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(22923, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22845, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(17150)

	-- Major Shadow Protection Potion -- 28576
	recipe = AddRecipe(28576, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(22924, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22846, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(21302)

	-- Major Holy Protection Potion -- 28577
	recipe = AddRecipe(28577, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(22925, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22847, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(19973)

	-- Elixir of Empowerment -- 28578
	recipe = AddRecipe(28578, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(35294, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22848, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop(Z.OUTLAND)

	-- Ironshield Potion -- 28579
	recipe = AddRecipe(28579, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(365, 365, 375, 377, 380)
	recipe:SetRecipeItem(22927, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(22849, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.TANK)
	recipe:AddMobDrop(17862)

	-- Transmute: Primal Shadow to Water -- 28580
	recipe = AddRecipe(28580, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(21885, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Water to Shadow -- 28581
	recipe = AddRecipe(28581, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22456, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Mana to Fire -- 28582
	recipe = AddRecipe(28582, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(21884, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Fire to Mana -- 28583
	recipe = AddRecipe(28583, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22457, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Life to Earth -- 28584
	recipe = AddRecipe(28584, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22452, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Transmute: Primal Earth to Life -- 28585
	recipe = AddRecipe(28585, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(21886, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")

	-- Super Rejuvenation Potion -- 28586
	recipe = AddRecipe(28586, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22850, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_POTION")

	-- Flask of Fortification -- 28587
	recipe = AddRecipe(28587, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22851, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Mighty Restoration -- 28588
	recipe = AddRecipe(28588, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22853, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Relentless Assault -- 28589
	recipe = AddRecipe(28589, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22854, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Blinding Light -- 28590
	recipe = AddRecipe(28590, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22861, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Flask of Pure Death -- 28591
	recipe = AddRecipe(28591, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 375, 377, 380)
	recipe:SetCraftedItem(22866, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")

	-- Transmute: Primal Might -- 29688
	recipe = AddRecipe(29688, V.TBC, Q.UNCOMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(23574, "BIND_ON_EQUIP")
	recipe:SetCraftedItem(23571, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddLimitedVendor(16641, 1, 16705, 1, 19074, 1)

	-- Transmute: Earthstorm Diamond -- 32765
	recipe = AddRecipe(32765, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(25869, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25867, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Transmute: Skyfire Diamond -- 32766
	recipe = AddRecipe(32766, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 365, 372, 380)
	recipe:SetRecipeItem(29232, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(25868, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Volatile Healing Potion -- 33732
	recipe = AddRecipe(33732, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetCraftedItem(28100, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Unstable Mana Potion -- 33733
	recipe = AddRecipe(33733, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 325, 332, 340)
	recipe:SetCraftedItem(28101, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Onslaught Elixir -- 33738
	recipe = AddRecipe(33738, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetCraftedItem(28102, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Adept's Elixir -- 33740
	recipe = AddRecipe(33740, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 315, 322, 330)
	recipe:SetCraftedItem(28103, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Mastery -- 33741
	recipe = AddRecipe(33741, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(315, 315, 330, 337, 345)
	recipe:SetCraftedItem(28104, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Mercurial Stone -- 38070
	recipe = AddRecipe(38070, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 340, 347, 355)
	recipe:SetCraftedItem(31080, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Fel Strength Elixir -- 38960
	recipe = AddRecipe(38960, V.TBC, Q.RARE)
	recipe:SetSkillLevels(335, 335, 350, 357, 365)
	recipe:SetRecipeItem(31680, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(31679, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddMobDrop(19740, 19755, 21302, 21314)

	-- Fel Mana Potion -- 38961
	recipe = AddRecipe(38961, V.TBC, Q.RARE)
	recipe:SetSkillLevels(360, 360, 375, 377, 380)
	recipe:SetRecipeItem(31682, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(31677, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddMobDrop(19792, 19795, 19796, 19806, 22016, 22017, 22018, 22076, 22093)

	-- Fel Regeneration Potion -- 38962
	recipe = AddRecipe(38962, V.TBC, Q.RARE)
	recipe:SetSkillLevels(345, 345, 360, 367, 375)
	recipe:SetRecipeItem(31681, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(31676, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(19754, 19756, 20878, 20887)

	-- Elixir of Major Fortitude -- 39636
	recipe = AddRecipe(39636, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(310, 310, 325, 332, 340)
	recipe:SetCraftedItem(32062, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Earthen Elixir -- 39637
	recipe = AddRecipe(39637, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetRecipeItem(32070, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32063, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Elixir of Draenic Wisdom -- 39638
	recipe = AddRecipe(39638, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(320, 320, 335, 342, 350)
	recipe:SetCraftedItem(32067, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Elixir of Ironskin -- 39639
	recipe = AddRecipe(39639, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(330, 330, 345, 352, 360)
	recipe:SetRecipeItem(32071, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(32068, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.PVP)
	recipe:AddVendor(18821, 18822)

	-- Cauldron of Major Arcane Protection -- 41458
	recipe = AddRecipe(41458, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetCraftedItem(32839, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Fire Protection -- 41500
	recipe = AddRecipe(41500, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetCraftedItem(32849, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Frost Protection -- 41501
	recipe = AddRecipe(41501, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetCraftedItem(32850, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Nature Protection -- 41502
	recipe = AddRecipe(41502, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetCraftedItem(32851, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Cauldron of Major Shadow Protection -- 41503
	recipe = AddRecipe(41503, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 360, 370, 380)
	recipe:SetCraftedItem(32852, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PROT")

	-- Mad Alchemist's Potion -- 45061
	recipe = AddRecipe(45061, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(325, 325, 335, 342, 350)
	recipe:SetCraftedItem(34440, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16588, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Guardian's Alchemist Stone -- 47046
	recipe = AddRecipe(47046, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetRecipeItem(35752, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35748, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Sorcerer's Alchemist Stone -- 47048
	recipe = AddRecipe(47048, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetRecipeItem(35753, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35749, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Redeemer's Alchemist Stone -- 47049
	recipe = AddRecipe(47049, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetRecipeItem(35754, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35750, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Assassin's Alchemist Stone -- 47050
	recipe = AddRecipe(47050, V.TBC, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetRecipeItem(35755, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(35751, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS, F.SHATTEREDSUN)
	recipe:AddRepVendor(FAC.SHATTEREDSUN, REP.EXALTED, 25032)

	-- Transmute: Eternal Life to Shadow -- 53771
	recipe = AddRecipe(53771, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35627, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Life to Fire -- 53773
	recipe = AddRecipe(53773, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(36860, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Fire to Water -- 53774
	recipe = AddRecipe(53774, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35622, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Fire to Life -- 53775
	recipe = AddRecipe(53775, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35625, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Air to Water -- 53776
	recipe = AddRecipe(53776, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35622, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Air to Earth -- 53777
	recipe = AddRecipe(53777, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35624, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Shadow to Earth -- 53779
	recipe = AddRecipe(53779, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35624, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Shadow to Life -- 53780
	recipe = AddRecipe(53780, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35625, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Earth to Air -- 53781
	recipe = AddRecipe(53781, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35623, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Earth to Shadow -- 53782
	recipe = AddRecipe(53782, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35627, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Water to Air -- 53783
	recipe = AddRecipe(53783, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(35623, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Transmute: Eternal Water to Fire -- 53784
	recipe = AddRecipe(53784, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(405, 405, 405, 415, 425)
	recipe:SetCraftedItem(36860, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")

	-- Pygmy Oil -- 53812
	recipe = AddRecipe(53812, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:SetCraftedItem(40195, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Runic Healing Potion -- 53836
	recipe = AddRecipe(53836, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 415, 420, 425)
	recipe:SetCraftedItem(33447, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Runic Mana Potion -- 53837
	recipe = AddRecipe(53837, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:SetCraftedItem(33448, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Resurgent Healing Potion -- 53838
	recipe = AddRecipe(53838, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(350, 350, 360, 365, 370)
	recipe:SetCraftedItem(39671, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Icy Mana Potion -- 53839
	recipe = AddRecipe(53839, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(360, 360, 370, 375, 380)
	recipe:SetCraftedItem(40067, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Mighty Agility -- 53840
	recipe = AddRecipe(53840, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetCraftedItem(39666, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Wrath Elixir -- 53841
	recipe = AddRecipe(53841, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(355, 355, 365, 370, 375)
	recipe:SetCraftedItem(40068, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Spellpower Elixir -- 53842
	recipe = AddRecipe(53842, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(365, 365, 375, 380, 385)
	recipe:SetCraftedItem(40070, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Spirit -- 53847
	recipe = AddRecipe(53847, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(385, 385, 395, 400, 405)
	recipe:SetCraftedItem(40072, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Guru's Elixir -- 53848
	recipe = AddRecipe(53848, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:SetCraftedItem(40076, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Crazy Alchemist's Potion -- 53895
	recipe = AddRecipe(53895, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(40077, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Fortitude -- 53898
	recipe = AddRecipe(53898, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(390, 390, 400, 405, 410)
	recipe:SetCraftedItem(40078, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Lesser Flask of Toughness -- 53899
	recipe = AddRecipe(53899, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:SetCraftedItem(40079, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Potion of Nightmares -- 53900
	recipe = AddRecipe(53900, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(380, 380, 390, 395, 400)
	recipe:SetCraftedItem(40081, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of the Frost Wyrm -- 53901
	recipe = AddRecipe(53901, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetCraftedItem(46376, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of Stoneblood -- 53902
	recipe = AddRecipe(53902, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetCraftedItem(46379, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of Endless Rage -- 53903
	recipe = AddRecipe(53903, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetCraftedItem(46377, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Powerful Rejuvenation Potion -- 53904
	recipe = AddRecipe(53904, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(40087, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Indestructible Potion -- 53905
	recipe = AddRecipe(53905, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetCraftedItem(40093, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mighty Arcane Protection Potion -- 53936
	recipe = AddRecipe(53936, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetRecipeItem(44564, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40213, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(31702, 32297)

	-- Mighty Frost Protection Potion -- 53937
	recipe = AddRecipe(53937, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetRecipeItem(44566, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40215, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(32289)

	-- Mighty Shadow Protection Potion -- 53938
	recipe = AddRecipe(53938, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetRecipeItem(44568, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40217, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(32349)

	-- Mighty Fire Protection Potion -- 53939
	recipe = AddRecipe(53939, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetRecipeItem(44565, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40214, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(30921)

	-- Mighty Nature Protection Potion -- 53942
	recipe = AddRecipe(53942, V.WOTLK, Q.UNCOMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetRecipeItem(44567, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(40216, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddMobDrop(32290)

	-- Flask of Pure Mojo -- 54213
	recipe = AddRecipe(54213, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(435, 435, 450, 457, 465)
	recipe:SetCraftedItem(46378, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Mighty Strength -- 54218
	recipe = AddRecipe(54218, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(385, 385, 395, 400, 405)
	recipe:SetCraftedItem(40073, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Protection -- 54220
	recipe = AddRecipe(54220, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(40097, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Potion of Speed -- 54221
	recipe = AddRecipe(54221, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(40211, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Potion of Wild Magic -- 54222
	recipe = AddRecipe(54222, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(40212, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Mageblood -- 56519
	recipe = AddRecipe(56519, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(40109, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Transmute: Skyflare Diamond -- 57425
	recipe = AddRecipe(57425, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(430, 430, 440, 445, 450)
	recipe:SetCraftedItem(41266, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Earthsiege Diamond -- 57427
	recipe = AddRecipe(57427, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:SetCraftedItem(41334, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Endless Mana Potion -- 58868
	recipe = AddRecipe(58868, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:SetCraftedItem(43570, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Endless Healing Potion -- 58871
	recipe = AddRecipe(58871, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(410, 410, 420, 425, 430)
	recipe:SetCraftedItem(43569, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Titanium -- 60350
	recipe = AddRecipe(60350, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetCraftedItem(41163, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Accuracy -- 60354
	recipe = AddRecipe(60354, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 415, 422, 430)
	recipe:SetCraftedItem(44325, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Deadly Strikes -- 60355
	recipe = AddRecipe(60355, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44327, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Defense -- 60356
	recipe = AddRecipe(60356, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44328, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Expertise -- 60357
	recipe = AddRecipe(60357, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44329, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Armor Piercing -- 60365
	recipe = AddRecipe(60365, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44330, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Lightning Speed -- 60366
	recipe = AddRecipe(60366, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44331, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Mighty Thoughts -- 60367
	recipe = AddRecipe(60367, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(395, 395, 405, 410, 415)
	recipe:SetCraftedItem(44332, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mercurial Alchemist Stone -- 60396
	recipe = AddRecipe(60396, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44322, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.HEALER, F.CASTER)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Indestructible Alchemist Stone -- 60403
	recipe = AddRecipe(60403, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44323, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TANK)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mighty Alchemist Stone -- 60405
	recipe = AddRecipe(60405, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(44324, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DPS)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Northrend Alchemy Research -- 60893
	recipe = AddRecipe(60893, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Ethereal Oil -- 62409
	recipe = AddRecipe(62409, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(375, 375, 385, 390, 395)
	recipe:SetCraftedItem(44958, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Water Walking -- 62410
	recipe = AddRecipe(62410, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 410, 415, 420)
	recipe:SetCraftedItem(8827, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")

	-- Elixir of Minor Accuracy -- 63732
	recipe = AddRecipe(63732, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(135, 135, 160, 180, 200)
	recipe:SetCraftedItem(45621, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1215, 1386, 1470, 2132, 2391, 2837, 3009, 3184, 3347, 3603, 3964, 4160, 4611, 4900, 5177, 5499, 7948, 16161, 16588, 16642, 16723, 17215, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 33674, 56777, 65186)

	-- Transmute: Ametrine -- 66658
	recipe = AddRecipe(66658, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetCraftedItem(36931, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Cardinal Ruby -- 66659
	recipe = AddRecipe(66659, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetCraftedItem(36919, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddQuest(14151)

	-- Transmute: King's Amber -- 66660
	recipe = AddRecipe(66660, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetCraftedItem(36922, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Dreadstone -- 66662
	recipe = AddRecipe(66662, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetCraftedItem(36928, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Majestic Zircon -- 66663
	recipe = AddRecipe(66663, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetCraftedItem(36925, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Eye of Zul -- 66664
	recipe = AddRecipe(66664, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 450, 452, 465)
	recipe:SetCraftedItem(36934, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Living Elements -- 78866
	recipe = AddRecipe(78866, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(485, 485, 510, 515, 520)
	recipe:SetCraftedItem(54464, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Shadowspirit Diamond -- 80237
	recipe = AddRecipe(80237, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(52303, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Truegold -- 80243
	recipe = AddRecipe(80243, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(58480, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Pyrium Bar -- 80244
	recipe = AddRecipe(80244, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetCraftedItem(51950, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Inferno Ruby -- 80245
	recipe = AddRecipe(80245, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(52190, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Ocean Sapphire -- 80246
	recipe = AddRecipe(80246, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:SetCraftedItem(52191, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Amberjewel -- 80247
	recipe = AddRecipe(80247, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:SetCraftedItem(52195, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Demonseye -- 80248
	recipe = AddRecipe(80248, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:SetCraftedItem(52194, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Ember Topaz -- 80250
	recipe = AddRecipe(80250, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetCraftedItem(52193, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Transmute: Dream Emerald -- 80251
	recipe = AddRecipe(80251, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(505, 505, 510, 515, 520)
	recipe:SetCraftedItem(52192, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Potion of Illusion -- 80269
	recipe = AddRecipe(80269, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:SetCraftedItem(58489, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Ghost Elixir -- 80477
	recipe = AddRecipe(80477, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:SetCraftedItem(58084, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Earthen Potion -- 80478
	recipe = AddRecipe(80478, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:SetCraftedItem(58090, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Deathblood Venom -- 80479
	recipe = AddRecipe(80479, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:SetCraftedItem(58142, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of the Naga -- 80480
	recipe = AddRecipe(80480, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:SetCraftedItem(58089, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Volcanic Potion -- 80481
	recipe = AddRecipe(80481, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(460, 460, 465, 470, 475)
	recipe:SetCraftedItem(58091, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Potion of Concentration -- 80482
	recipe = AddRecipe(80482, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(465, 465, 470, 475, 480)
	recipe:SetCraftedItem(57194, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of the Cobra -- 80484
	recipe = AddRecipe(80484, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(465, 465, 470, 475, 480)
	recipe:SetCraftedItem(58092, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Deepstone Oil -- 80486
	recipe = AddRecipe(80486, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:SetCraftedItem(56850, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mysterious Potion -- 80487
	recipe = AddRecipe(80487, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:SetCraftedItem(57099, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Deep Earth -- 80488
	recipe = AddRecipe(80488, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 480, 485, 490)
	recipe:SetCraftedItem(58093, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mighty Rejuvenation Potion -- 80490
	recipe = AddRecipe(80490, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(475, 475, 480, 485, 490)
	recipe:SetCraftedItem(57193, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Impossible Accuracy -- 80491
	recipe = AddRecipe(80491, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(480, 480, 485, 490, 495)
	recipe:SetCraftedItem(58094, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Prismatic Elixir -- 80492
	recipe = AddRecipe(80492, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(480, 480, 485, 490, 495)
	recipe:SetCraftedItem(58143, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of Mighty Speed -- 80493
	recipe = AddRecipe(80493, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(490, 490, 495, 500, 505)
	recipe:SetCraftedItem(58144, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mythical Mana Potion -- 80494
	recipe = AddRecipe(80494, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(485, 485, 490, 495, 500)
	recipe:SetCraftedItem(57192, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Potion of the Tol'vir -- 80495
	recipe = AddRecipe(80495, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(485, 485, 490, 495, 500)
	recipe:SetCraftedItem(58145, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Golemblood Potion -- 80496
	recipe = AddRecipe(80496, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(490, 490, 495, 500, 505)
	recipe:SetCraftedItem(58146, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Elixir of the Master -- 80497
	recipe = AddRecipe(80497, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(495, 495, 500, 505, 510)
	recipe:SetCraftedItem(58148, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Mythical Healing Potion -- 80498
	recipe = AddRecipe(80498, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(495, 495, 500, 505, 510)
	recipe:SetCraftedItem(57191, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Lifebound Alchemist Stone -- 80508
	recipe = AddRecipe(80508, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 512, 515)
	recipe:SetCraftedItem(58483, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of Steelskin -- 80719
	recipe = AddRecipe(80719, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:SetCraftedItem(58085, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of the Draconic Mind -- 80720
	recipe = AddRecipe(80720, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(505, 505, 510, 515, 520)
	recipe:SetCraftedItem(58086, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of the Winds -- 80721
	recipe = AddRecipe(80721, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetCraftedItem(58087, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of Titanic Strength -- 80723
	recipe = AddRecipe(80723, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:SetCraftedItem(58088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Potion of Deepholm -- 80725
	recipe = AddRecipe(80725, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(58487, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Potion of Treasure Finding -- 80726
	recipe = AddRecipe(80726, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetCraftedItem(58488, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Cauldron of Battle -- 92643
	recipe = AddRecipe(92643, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(65435, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(62288, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddAchievement(5465)
	recipe:AddVendor(46572, 46602, 51495, 51512)

	-- Big Cauldron of Battle -- 92688
	recipe = AddRecipe(92688, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 525, 525)
	recipe:SetRecipeItem(65498, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(65460, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_CAULDRON")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddAchievement(5024)
	recipe:AddVendor(46572, 46602, 51495)

	-- Vial of the Sands -- 93328
	recipe = AddRecipe(93328, V.CATA, Q.EPIC)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:SetRecipeItem(67538, "BIND_ON_PICKUP")
	recipe:SetCraftedItem(65891, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddCustom("ARCH_DROP_ULD")

	-- Draught of War -- 93935
	recipe = AddRecipe(93935, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 440, 450, 460)
	recipe:SetCraftedItem(67415, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_MISC")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Flask of Flowing Water -- 94162
	recipe = AddRecipe(94162, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:SetCraftedItem(67438, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Volatile Alchemist Stone -- 96252
	recipe = AddRecipe(96252, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetCraftedItem(68775, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Quicksilver Alchemist Stone -- 96253
	recipe = AddRecipe(96253, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetCraftedItem(68776, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Vibrant Alchemist Stone -- 96254
	recipe = AddRecipe(96254, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 510, 515, 520)
	recipe:SetCraftedItem(68777, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	-- Alchemist's Rejuvenation -- 114751
	recipe = AddRecipe(114751, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 515, 525, 535)
	recipe:SetCraftedItem(76094, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(3347, 5499, 65186)

	-- Master Healing Potion -- 114752
	recipe = AddRecipe(114752, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 515, 525, 535)
	recipe:SetCraftedItem(76097, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(3347, 5499, 65186)

	-- Potion of the Mountains -- 114753
	recipe = AddRecipe(114753, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 540, 552, 565)
	recipe:SetCraftedItem(76090, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Mad Hozen Elixir -- 114754
	recipe = AddRecipe(114754, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 540, 552, 565)
	recipe:SetCraftedItem(76076, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Mantid Elixir -- 114755
	recipe = AddRecipe(114755, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 540, 552, 565)
	recipe:SetCraftedItem(76075, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Elixir of Weaponry -- 114756
	recipe = AddRecipe(114756, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 540, 552, 565)
	recipe:SetCraftedItem(76077, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Potion of the Jade Serpent -- 114757
	recipe = AddRecipe(114757, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 540, 552, 565)
	recipe:SetCraftedItem(76093, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Monk's Elixir -- 114758
	recipe = AddRecipe(114758, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 540, 552, 565)
	recipe:SetCraftedItem(76083, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Elixir of the Rapids -- 114759
	recipe = AddRecipe(114759, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 565, 577, 590)
	recipe:SetCraftedItem(76078, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Potion of Mogu Power -- 114760
	recipe = AddRecipe(114760, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 565, 577, 590)
	recipe:SetCraftedItem(76095, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Desecrated Oil -- 114761
	recipe = AddRecipe(114761, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 550, 552, 565)
	recipe:SetCraftedItem(87872, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_OIL")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Elixir of Perfection -- 114762
	recipe = AddRecipe(114762, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 565, 577, 590)
	recipe:SetCraftedItem(76080, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Elixir of Mirrors -- 114763
	recipe = AddRecipe(114763, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 565, 577, 590)
	recipe:SetCraftedItem(76079, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Elixir of Peace -- 114764
	recipe = AddRecipe(114764, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 565, 577, 590)
	recipe:SetCraftedItem(76089, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_ELIXIR")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Virmen's Bite -- 114765
	recipe = AddRecipe(114765, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 565, 577, 590)
	recipe:SetCraftedItem(76081, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: River's Heart -- 114766
	recipe = AddRecipe(114766, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 605, 610)
	recipe:SetCraftedItem(76138, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Wild Jade -- 114767
	recipe = AddRecipe(114767, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 605, 610)
	recipe:SetCraftedItem(76139, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Flask of Spring Blossoms -- 114769
	recipe = AddRecipe(114769, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetCraftedItem(76084, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Flask of the Earth -- 114770
	recipe = AddRecipe(114770, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetCraftedItem(76087, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Flask of the Warm Sun -- 114771
	recipe = AddRecipe(114771, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetCraftedItem(76085, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Flask of Falling Leaves -- 114772
	recipe = AddRecipe(114772, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetCraftedItem(76088, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Flask of Winter's Bite -- 114773
	recipe = AddRecipe(114773, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(550, 550, 600, 602, 605)
	recipe:SetCraftedItem(76086, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Darkwater Potion -- 114774
	recipe = AddRecipe(114774, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 575, 577, 590)
	recipe:SetCraftedItem(76096, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Master Mana Potion -- 114775
	recipe = AddRecipe(114775, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 600, 602, 605)
	recipe:SetCraftedItem(76098, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Vermilion Onyx -- 114776
	recipe = AddRecipe(114776, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 600, 605, 610)
	recipe:SetCraftedItem(76140, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Imperial Amethyst -- 114777
	recipe = AddRecipe(114777, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 600, 605, 610)
	recipe:SetCraftedItem(76141, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Sun's Radiance -- 114778
	recipe = AddRecipe(114778, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(575, 575, 600, 605, 610)
	recipe:SetCraftedItem(76141, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Potion of Luck -- 114779
	recipe = AddRecipe(114779, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 605, 610, 615)
	recipe:SetCraftedItem(76091, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Living Steel -- 114780
	recipe = AddRecipe(114780, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 605, 610, 615)
	recipe:SetCraftedItem(72104, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Primal Diamond -- 114781
	recipe = AddRecipe(114781, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 605, 610)
	recipe:SetCraftedItem(76132, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Potion of Focus -- 114782
	recipe = AddRecipe(114782, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 600, 600)
	recipe:SetCraftedItem(76092, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_POTION")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Trillium Bar -- 114783
	recipe = AddRecipe(114783, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 605, 610)
	recipe:SetCraftedItem(72095, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Transmute: Primordial Ruby -- 114784
	recipe = AddRecipe(114784, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 600, 605, 610)
	recipe:SetCraftedItem(76131, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Alchemist's Flask -- 114786
	recipe = AddRecipe(114786, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:SetCraftedItem(75525, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_FLASK")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(3347, 3603, 5177, 5499, 16723, 18802, 19052, 26903, 26987, 28703, 33608, 33630, 56777, 65186)

	-- Riddle of Steel -- 130326
	recipe = AddRecipe(130326, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(600, 600, 605, 610, 615)
	recipe:SetCraftedItem(72104, "BIND_ON_EQUIP")
	recipe:SetItemFilterType("ALCHEMY_TRANSMUTE")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddDiscovery("DISCOVERY_ALCH_PANDARIA")

	-- Zen Alchemist Stone -- 136197
	recipe = AddRecipe(136197, V.MOP, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 515, 525, 535)
	recipe:SetCraftedItem(75274, "BIND_ON_PICKUP")
	recipe:SetItemFilterType("ALCHEMY_TRINKET")
	recipe:AddFilters(F.ALLIANCE, F.HORDE)
	recipe:AddTrainer(1386, 2132, 2391, 3009, 3184, 3347, 3603, 4160, 4611, 5177, 5499, 16723, 18802, 19052, 26903, 26951, 26975, 26987, 27023, 27029, 28703, 33588, 33608, 33630, 56777, 65186)

	self.InitAlchemy = nil
end
