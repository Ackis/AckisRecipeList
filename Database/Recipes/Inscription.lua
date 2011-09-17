--[[
************************************************************************
Inscription.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Format:

************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]] --

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

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
function addon:InitInscription()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 45357, genesis, quality)
	end

	private:InitializeInscriptionTrainers()

	local recipe

	-- Scroll of Stamina -- 45382
	recipe = AddRecipe(45382, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(1180)
	recipe:SetSkillLevels(1, 1, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Scroll of Intellect -- 48114
	recipe = AddRecipe(48114, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(955)
	recipe:SetSkillLevels(1, 1, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Scroll of Spirit -- 48116
	recipe = AddRecipe(48116, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(1181)
	recipe:SetSkillLevels(1, 1, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Glyph of Entangling Roots -- 48121
	recipe = AddRecipe(48121, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40924)
	recipe:SetSkillLevels(100, 100, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Mysterious Tarot -- 48247
	recipe = AddRecipe(48247, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37168)
	recipe:SetSkillLevels(85, 85, 95, 100, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Recall -- 48248
	recipe = AddRecipe(48248, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37118)
	recipe:SetSkillLevels(35, 35, 60, 67, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Scroll of Intellect II -- 50598
	recipe = AddRecipe(50598, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(2290)
	recipe:SetSkillLevels(75, 75, 75, 80, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Scroll of Intellect III -- 50599
	recipe = AddRecipe(50599, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(4419)
	recipe:SetSkillLevels(165, 165, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Intellect IV -- 50600
	recipe = AddRecipe(50600, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(10308)
	recipe:SetSkillLevels(215, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Intellect V -- 50601
	recipe = AddRecipe(50601, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(27499)
	recipe:SetSkillLevels(260, 260, 265, 270, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Intellect VI -- 50602
	recipe = AddRecipe(50602, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33458)
	recipe:SetSkillLevels(300, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Intellect VII -- 50603
	recipe = AddRecipe(50603, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37091)
	recipe:SetSkillLevels(360, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Intellect VIII -- 50604
	recipe = AddRecipe(50604, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37092)
	recipe:SetSkillLevels(410, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Spirit II -- 50605
	recipe = AddRecipe(50605, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(1712)
	recipe:SetSkillLevels(75, 75, 75, 80, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Scroll of Spirit III -- 50606
	recipe = AddRecipe(50606, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(4424)
	recipe:SetSkillLevels(160, 160, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Spirit IV -- 50607
	recipe = AddRecipe(50607, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(10306)
	recipe:SetSkillLevels(210, 210, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Spirit V -- 50608
	recipe = AddRecipe(50608, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(27501)
	recipe:SetSkillLevels(255, 255, 260, 265, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Spirit VI -- 50609
	recipe = AddRecipe(50609, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33460)
	recipe:SetSkillLevels(295, 295, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Spirit VII -- 50610
	recipe = AddRecipe(50610, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37097)
	recipe:SetSkillLevels(355, 355, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Spirit VIII -- 50611
	recipe = AddRecipe(50611, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37098)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Stamina II -- 50612
	recipe = AddRecipe(50612, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(1711)
	recipe:SetSkillLevels(75, 75, 75, 80, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Scroll of Stamina III -- 50614
	recipe = AddRecipe(50614, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(4422)
	recipe:SetSkillLevels(155, 155, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Stamina IV -- 50616
	recipe = AddRecipe(50616, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(10307)
	recipe:SetSkillLevels(205, 205, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Stamina V -- 50617
	recipe = AddRecipe(50617, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(27502)
	recipe:SetSkillLevels(250, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Stamina VI -- 50618
	recipe = AddRecipe(50618, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33461)
	recipe:SetSkillLevels(290, 290, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Stamina VII -- 50619
	recipe = AddRecipe(50619, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37093)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Stamina VIII -- 50620
	recipe = AddRecipe(50620, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37094)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Ivory Ink -- 52738
	recipe = AddRecipe(52738, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(37101)
	recipe:SetSkillLevels(1, 1, 15, 22, 30)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Enchanting Vellum -- 52739
	recipe = AddRecipe(52739, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38682)
	recipe:SetSkillLevels(35, 35, 75, 87, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Moonglow Ink -- 52843
	recipe = AddRecipe(52843, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39469)
	recipe:SetSkillLevels(35, 35, 45, 60, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Midnight Ink -- 53462
	recipe = AddRecipe(53462, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(39774)
	recipe:SetSkillLevels(75, 75, 75, 77, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Glyph of Frenzied Regeneration -- 56943
	recipe = AddRecipe(56943, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40896)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Solar Beam -- 56944
	recipe = AddRecipe(56944, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40899)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Healing Touch -- 56945
	recipe = AddRecipe(56945, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40914)
	recipe:SetSkillLevels(115, 115, 120, 125, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Hurricane -- 56946
	recipe = AddRecipe(56946, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40920)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Innervate -- 56947
	recipe = AddRecipe(56947, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40908)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Insect Swarm -- 56948
	recipe = AddRecipe(56948, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40919)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Lifebloom -- 56949
	recipe = AddRecipe(56949, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40915)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Mangle -- 56950
	recipe = AddRecipe(56950, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40900)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Moonfire -- 56951
	recipe = AddRecipe(56951, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40923)
	recipe:SetSkillLevels(130, 130, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Pounce -- 56952
	recipe = AddRecipe(56952, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40903)
	recipe:SetSkillLevels(310, 310, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Rebirth -- 56953
	recipe = AddRecipe(56953, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40909)
	recipe:SetSkillLevels(170, 170, 175, 180, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Regrowth -- 56954
	recipe = AddRecipe(56954, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40912)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Rejuvenation -- 56955
	recipe = AddRecipe(56955, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40913)
	recipe:SetSkillLevels(80, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Rip -- 56956
	recipe = AddRecipe(56956, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40902)
	recipe:SetSkillLevels(200, 200, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Shred -- 56957
	recipe = AddRecipe(56957, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40901)
	recipe:SetSkillLevels(260, 260, 265, 270, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Starfall -- 56958
	recipe = AddRecipe(56958, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40921)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Starfire -- 56959
	recipe = AddRecipe(56959, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40916)
	recipe:SetSkillLevels(220, 220, 225, 230, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Swiftmend -- 56960
	recipe = AddRecipe(56960, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40906)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Maul -- 56961
	recipe = AddRecipe(56961, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40897)
	recipe:SetSkillLevels(90, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Wrath -- 56963
	recipe = AddRecipe(56963, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(40922)
	recipe:SetSkillLevels(85, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Typhoon -- 56965
	recipe = AddRecipe(56965, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44922)
	recipe:SetSkillLevels(310, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Arcane Missiles -- 56971
	recipe = AddRecipe(56971, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42735)
	recipe:SetSkillLevels(115, 115, 120, 125, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Arcane Power -- 56972
	recipe = AddRecipe(56972, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42736)
	recipe:SetSkillLevels(335, 335, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Blink -- 56973
	recipe = AddRecipe(56973, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42737)
	recipe:SetSkillLevels(130, 130, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Evocation -- 56974
	recipe = AddRecipe(56974, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42738)
	recipe:SetSkillLevels(155, 155, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Fireball -- 56975
	recipe = AddRecipe(56975, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42739)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Frost Nova -- 56976
	recipe = AddRecipe(56976, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42741)
	recipe:SetSkillLevels(80, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Frostbolt -- 56977
	recipe = AddRecipe(56977, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42742)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Pyroblast -- 56978
	recipe = AddRecipe(56978, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42743)
	recipe:SetSkillLevels(90, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Ice Block -- 56979
	recipe = AddRecipe(56979, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42744)
	recipe:SetSkillLevels(225, 225, 230, 235, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Ice Lance -- 56980
	recipe = AddRecipe(56980, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42745)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Icy Veins -- 56981
	recipe = AddRecipe(56981, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42746)
	recipe:SetSkillLevels(175, 175, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Invisibility -- 56983
	recipe = AddRecipe(56983, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42748)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Mage Armor -- 56984
	recipe = AddRecipe(56984, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42749)
	recipe:SetSkillLevels(325, 325, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Molten Armor -- 56986
	recipe = AddRecipe(56986, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42751)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Polymorph -- 56987
	recipe = AddRecipe(56987, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42752)
	recipe:SetSkillLevels(400, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Cone of Cold -- 56988
	recipe = AddRecipe(56988, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42753)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Dragon's Breath -- 56989
	recipe = AddRecipe(56989, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42754)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Blast Wave -- 56990
	recipe = AddRecipe(56990, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44920)
	recipe:SetSkillLevels(310, 310, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Arcane Blast -- 56991
	recipe = AddRecipe(56991, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44955)
	recipe:SetSkillLevels(315, 315, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Aimed Shot -- 56994
	recipe = AddRecipe(56994, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42897)
	recipe:SetSkillLevels(175, 175, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Arcane Shot -- 56995
	recipe = AddRecipe(56995, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42898)
	recipe:SetSkillLevels(100, 100, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Trap Launcher -- 56996
	recipe = AddRecipe(56996, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42899)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Mending -- 56997
	recipe = AddRecipe(56997, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42900)
	recipe:SetSkillLevels(115, 115, 120, 125, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Concussive Shot -- 56998
	recipe = AddRecipe(56998, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42901)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Bestial Wrath -- 56999
	recipe = AddRecipe(56999, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42902)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Deterrence -- 57000
	recipe = AddRecipe(57000, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42903)
	recipe:SetSkillLevels(200, 200, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Disengage -- 57001
	recipe = AddRecipe(57001, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42904)
	recipe:SetSkillLevels(225, 225, 230, 235, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Freezing Trap -- 57002
	recipe = AddRecipe(57002, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42905)
	recipe:SetSkillLevels(260, 260, 265, 270, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Ice Trap -- 57003
	recipe = AddRecipe(57003, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42906)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Misdirection -- 57004
	recipe = AddRecipe(57004, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42907)
	recipe:SetSkillLevels(80, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Immolation Trap -- 57005
	recipe = AddRecipe(57005, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42908)
	recipe:SetSkillLevels(130, 130, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of the Dazzled Prey -- 57006
	recipe = AddRecipe(57006, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42909)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Silencing Shot -- 57007
	recipe = AddRecipe(57007, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42910)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Rapid Fire -- 57008
	recipe = AddRecipe(57008, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42911)
	recipe:SetSkillLevels(315, 315, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Serpent Sting -- 57009
	recipe = AddRecipe(57009, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42912)
	recipe:SetSkillLevels(90, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Snake Trap -- 57010
	recipe = AddRecipe(57010, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42913)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Steady Shot -- 57011
	recipe = AddRecipe(57011, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42914)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Kill Command -- 57012
	recipe = AddRecipe(57012, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42915)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Wyvern Sting -- 57014
	recipe = AddRecipe(57014, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42917)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Focused Shield -- 57019
	recipe = AddRecipe(57019, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41101)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Cleansing -- 57020
	recipe = AddRecipe(57020, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41104)
	recipe:SetSkillLevels(180, 180, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of the Ascetic Crusader -- 57021
	recipe = AddRecipe(57021, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41107)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Divine Protection -- 57022
	recipe = AddRecipe(57022, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41096)
	recipe:SetSkillLevels(80, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Consecration -- 57023
	recipe = AddRecipe(57023, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41099)
	recipe:SetSkillLevels(205, 205, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Crusader Strike -- 57024
	recipe = AddRecipe(57024, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41098)
	recipe:SetSkillLevels(230, 230, 235, 240, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Exorcism -- 57025
	recipe = AddRecipe(57025, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41103)
	recipe:SetSkillLevels(265, 265, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Word of Glory -- 57026
	recipe = AddRecipe(57026, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41105)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Hammer of Justice -- 57027
	recipe = AddRecipe(57027, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41095)
	recipe:SetSkillLevels(90, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Hammer of Wrath -- 57028
	recipe = AddRecipe(57028, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41097)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Divine Favor -- 57029
	recipe = AddRecipe(57029, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41106)
	recipe:SetSkillLevels(105, 105, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Judgement -- 57030
	recipe = AddRecipe(57030, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41092)
	recipe:SetSkillLevels(120, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Divinity -- 57031
	recipe = AddRecipe(57031, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41108)
	recipe:SetSkillLevels(135, 135, 140, 145, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Righteousness -- 57032
	recipe = AddRecipe(57032, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41100)
	recipe:SetSkillLevels(155, 155, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Rebuke -- 57033
	recipe = AddRecipe(57033, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41094)
	recipe:SetSkillLevels(335, 335, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Seal of Insight -- 57034
	recipe = AddRecipe(57034, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41110)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Light of Dawn -- 57035
	recipe = AddRecipe(57035, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41109)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Turn Evil -- 57036
	recipe = AddRecipe(57036, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41102)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Adrenaline Rush -- 57112
	recipe = AddRecipe(57112, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42954)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Ambush -- 57113
	recipe = AddRecipe(57113, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42955)
	recipe:SetSkillLevels(340, 340, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Backstab -- 57114
	recipe = AddRecipe(57114, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42956)
	recipe:SetSkillLevels(80, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Blade Flurry -- 57115
	recipe = AddRecipe(57115, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42957)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Crippling Poison -- 57116
	recipe = AddRecipe(57116, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42958)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Deadly Throw -- 57117
	recipe = AddRecipe(57117, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42959)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Evasion -- 57119
	recipe = AddRecipe(57119, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42960)
	recipe:SetSkillLevels(95, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Eviscerate -- 57120
	recipe = AddRecipe(57120, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42961)
	recipe:SetSkillLevels(105, 105, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Expose Armor -- 57121
	recipe = AddRecipe(57121, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42962)
	recipe:SetSkillLevels(120, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Feint -- 57122
	recipe = AddRecipe(57122, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42963)
	recipe:SetSkillLevels(305, 305, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Garrote -- 57123
	recipe = AddRecipe(57123, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42964)
	recipe:SetSkillLevels(135, 135, 140, 145, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Revealing Strike -- 57124
	recipe = AddRecipe(57124, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42965)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Gouge -- 57125
	recipe = AddRecipe(57125, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42966)
	recipe:SetSkillLevels(160, 160, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Hemorrhage -- 57126
	recipe = AddRecipe(57126, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42967)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Preparation -- 57127
	recipe = AddRecipe(57127, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42968)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Rupture -- 57128
	recipe = AddRecipe(57128, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42969)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Sap -- 57129
	recipe = AddRecipe(57129, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42970)
	recipe:SetSkillLevels(185, 185, 190, 195, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Kick -- 57130
	recipe = AddRecipe(57130, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42971)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Sinister Strike -- 57131
	recipe = AddRecipe(57131, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42972)
	recipe:SetSkillLevels(210, 210, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Slice and Dice -- 57132
	recipe = AddRecipe(57132, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42973)
	recipe:SetSkillLevels(235, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Sprint -- 57133
	recipe = AddRecipe(57133, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42974)
	recipe:SetSkillLevels(285, 285, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Shield Slam -- 57152
	recipe = AddRecipe(57152, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43425)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Bloody Healing -- 57153
	recipe = AddRecipe(57153, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43412)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Cleaving -- 57154
	recipe = AddRecipe(57154, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43414)
	recipe:SetSkillLevels(240, 240, 245, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Devastate -- 57155
	recipe = AddRecipe(57155, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43415)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Bloodthirst -- 57156
	recipe = AddRecipe(57156, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43416)
	recipe:SetSkillLevels(285, 285, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Piercing Howl -- 57157
	recipe = AddRecipe(57157, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43417)
	recipe:SetSkillLevels(125, 125, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Heroic Throw -- 57158
	recipe = AddRecipe(57158, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43418)
	recipe:SetSkillLevels(95, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Intervene -- 57159
	recipe = AddRecipe(57159, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43419)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Mortal Strike -- 57160
	recipe = AddRecipe(57160, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43421)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Overpower -- 57161
	recipe = AddRecipe(57161, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43422)
	recipe:SetSkillLevels(170, 170, 175, 180, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Rapid Charge -- 57162
	recipe = AddRecipe(57162, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43413)
	recipe:SetSkillLevels(85, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Slam -- 57163
	recipe = AddRecipe(57163, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43423)
	recipe:SetSkillLevels(110, 110, 115, 120, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Resonating Power -- 57164
	recipe = AddRecipe(57164, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43430)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Revenge -- 57165
	recipe = AddRecipe(57165, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43424)
	recipe:SetSkillLevels(190, 190, 195, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Sunder Armor -- 57167
	recipe = AddRecipe(57167, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43427)
	recipe:SetSkillLevels(140, 140, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Sweeping Strikes -- 57168
	recipe = AddRecipe(57168, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43428)
	recipe:SetSkillLevels(320, 320, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Victory Rush -- 57170
	recipe = AddRecipe(57170, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43431)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Raging Blow -- 57172
	recipe = AddRecipe(57172, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43432)
	recipe:SetSkillLevels(345, 345, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Circle of Healing -- 57181
	recipe = AddRecipe(57181, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42396)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Dispel Magic -- 57183
	recipe = AddRecipe(57183, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42397)
	recipe:SetSkillLevels(230, 230, 235, 240, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Fade -- 57184
	recipe = AddRecipe(57184, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42398)
	recipe:SetSkillLevels(105, 105, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Fear Ward -- 57185
	recipe = AddRecipe(57185, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42399)
	recipe:SetSkillLevels(270, 270, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Flash Heal -- 57186
	recipe = AddRecipe(57186, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42400)
	recipe:SetSkillLevels(120, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Holy Nova -- 57187
	recipe = AddRecipe(57187, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42401)
	recipe:SetSkillLevels(315, 315, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Inner Fire -- 57188
	recipe = AddRecipe(57188, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42402)
	recipe:SetSkillLevels(135, 135, 140, 145, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Lightwell -- 57189
	recipe = AddRecipe(57189, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42403)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Mass Dispel -- 57190
	recipe = AddRecipe(57190, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42404)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Psychic Horror -- 57191
	recipe = AddRecipe(57191, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42405)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Shadow Word: Pain -- 57192
	recipe = AddRecipe(57192, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42406)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Power Word: Barrier -- 57193
	recipe = AddRecipe(57193, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42407)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Power Word: Shield -- 57194
	recipe = AddRecipe(57194, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42408)
	recipe:SetSkillLevels(80, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Prayer of Healing -- 57195
	recipe = AddRecipe(57195, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42409)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Psychic Scream -- 57196
	recipe = AddRecipe(57196, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42410)
	recipe:SetSkillLevels(95, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Renew -- 57197
	recipe = AddRecipe(57197, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42411)
	recipe:SetSkillLevels(160, 160, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Scourge Imprisonment -- 57198
	recipe = AddRecipe(57198, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42412)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Shadow Word: Death -- 57199
	recipe = AddRecipe(57199, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42414)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Mind Flay -- 57200
	recipe = AddRecipe(57200, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42415)
	recipe:SetSkillLevels(180, 180, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Smite -- 57201
	recipe = AddRecipe(57201, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42416)
	recipe:SetSkillLevels(210, 210, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Prayer of Mending -- 57202
	recipe = AddRecipe(57202, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42417)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Anti-Magic Shell -- 57207
	recipe = AddRecipe(57207, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43533)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Heart Strike -- 57208
	recipe = AddRecipe(57208, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43534)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Blood Tap -- 57209
	recipe = AddRecipe(57209, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43535)
	recipe:SetSkillLevels(320, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Bone Shield -- 57210
	recipe = AddRecipe(57210, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43536)
	recipe:SetSkillLevels(265, 265, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Chains of Ice -- 57211
	recipe = AddRecipe(57211, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43537)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Death Grip -- 57213
	recipe = AddRecipe(57213, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43541)
	recipe:SetSkillLevels(285, 285, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Death and Decay -- 57214
	recipe = AddRecipe(57214, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43542)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Death's Embrace -- 57215
	recipe = AddRecipe(57215, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43539)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Frost Strike -- 57216
	recipe = AddRecipe(57216, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43543)
	recipe:SetSkillLevels(270, 270, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Horn of Winter -- 57217
	recipe = AddRecipe(57217, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43544)
	recipe:SetSkillLevels(320, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Icy Touch -- 57219
	recipe = AddRecipe(57219, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43546)
	recipe:SetSkillLevels(280, 280, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Obliterate -- 57220
	recipe = AddRecipe(57220, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43547)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Pestilence -- 57221
	recipe = AddRecipe(57221, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43548)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Raise Dead -- 57222
	recipe = AddRecipe(57222, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43549)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Rune Strike -- 57223
	recipe = AddRecipe(57223, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43550)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Scourge Strike -- 57224
	recipe = AddRecipe(57224, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43551)
	recipe:SetSkillLevels(330, 330, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Strangulate -- 57225
	recipe = AddRecipe(57225, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43552)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Pillar of Frost -- 57226
	recipe = AddRecipe(57226, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43553)
	recipe:SetSkillLevels(305, 305, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Vampiric Blood -- 57227
	recipe = AddRecipe(57227, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43554)
	recipe:SetSkillLevels(345, 345, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Death Gate -- 57228
	recipe = AddRecipe(57228, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43673)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Path of Frost -- 57229
	recipe = AddRecipe(57229, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43671)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Resilient Grip -- 57230
	recipe = AddRecipe(57230, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43672)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Chain Heal -- 57232
	recipe = AddRecipe(57232, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41517)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Chain Lightning -- 57233
	recipe = AddRecipe(57233, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41518)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Lava Burst -- 57234
	recipe = AddRecipe(57234, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41524)
	recipe:SetSkillLevels(385, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Shocking -- 57235
	recipe = AddRecipe(57235, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41526)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Earthliving Weapon -- 57236
	recipe = AddRecipe(57236, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41527)
	recipe:SetSkillLevels(300, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Fire Elemental Totem -- 57237
	recipe = AddRecipe(57237, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41529)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Fire Nova -- 57238
	recipe = AddRecipe(57238, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41530)
	recipe:SetSkillLevels(110, 110, 115, 120, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Flame Shock -- 57239
	recipe = AddRecipe(57239, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41531)
	recipe:SetSkillLevels(85, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Flametongue Weapon -- 57240
	recipe = AddRecipe(57240, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41532)
	recipe:SetSkillLevels(125, 125, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Frost Shock -- 57241
	recipe = AddRecipe(57241, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41547)
	recipe:SetSkillLevels(185, 185, 190, 195, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Healing Stream Totem -- 57242
	recipe = AddRecipe(57242, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41533)
	recipe:SetSkillLevels(215, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Healing Wave -- 57243
	recipe = AddRecipe(57243, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41534)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Totemic Recall -- 57244
	recipe = AddRecipe(57244, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41535)
	recipe:SetSkillLevels(235, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Lightning Bolt -- 57245
	recipe = AddRecipe(57245, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41536)
	recipe:SetSkillLevels(140, 140, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Lightning Shield -- 57246
	recipe = AddRecipe(57246, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41537)
	recipe:SetSkillLevels(95, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Grounding Totem -- 57247
	recipe = AddRecipe(57247, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41538)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Stormstrike -- 57248
	recipe = AddRecipe(57248, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41539)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Lava Lash -- 57249
	recipe = AddRecipe(57249, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41540)
	recipe:SetSkillLevels(165, 165, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Elemental Mastery -- 57250
	recipe = AddRecipe(57250, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41552)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Water Shield -- 57251
	recipe = AddRecipe(57251, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41541)
	recipe:SetSkillLevels(275, 275, 280, 285, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Windfury Weapon -- 57252
	recipe = AddRecipe(57252, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41542)
	recipe:SetSkillLevels(330, 330, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Thunderstorm -- 57253
	recipe = AddRecipe(57253, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44923)
	recipe:SetSkillLevels(355, 355, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Incinerate -- 57257
	recipe = AddRecipe(57257, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42453)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Conflagrate -- 57258
	recipe = AddRecipe(57258, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42454)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Corruption -- 57259
	recipe = AddRecipe(57259, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42455)
	recipe:SetSkillLevels(85, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Bane of Agony -- 57260
	recipe = AddRecipe(57260, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42456)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Death Coil -- 57261
	recipe = AddRecipe(57261, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42457)
	recipe:SetSkillLevels(275, 275, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Fear -- 57262
	recipe = AddRecipe(57262, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42458)
	recipe:SetSkillLevels(125, 125, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Felguard -- 57263
	recipe = AddRecipe(57263, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42459)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Felhunter -- 57264
	recipe = AddRecipe(57264, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42460)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Health Funnel -- 57265
	recipe = AddRecipe(57265, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42461)
	recipe:SetSkillLevels(110, 110, 115, 120, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Healthstone -- 57266
	recipe = AddRecipe(57266, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42462)
	recipe:SetSkillLevels(95, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Howl of Terror -- 57267
	recipe = AddRecipe(57267, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42463)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Immolate -- 57268
	recipe = AddRecipe(57268, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42464)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Imp -- 57269
	recipe = AddRecipe(57269, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42465)
	recipe:SetSkillLevels(140, 140, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Soul Swap -- 57270
	recipe = AddRecipe(57270, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42466)
	recipe:SetSkillLevels(215, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Shadow Bolt -- 57271
	recipe = AddRecipe(57271, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42467)
	recipe:SetSkillLevels(165, 165, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Shadowburn -- 57272
	recipe = AddRecipe(57272, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42468)
	recipe:SetSkillLevels(275, 275, 280, 285, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Soulstone -- 57274
	recipe = AddRecipe(57274, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42470)
	recipe:SetSkillLevels(240, 240, 245, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Seduction -- 57275
	recipe = AddRecipe(57275, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42471)
	recipe:SetSkillLevels(325, 325, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Unstable Affliction -- 57276
	recipe = AddRecipe(57276, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42472)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Voidwalker -- 57277
	recipe = AddRecipe(57277, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42473)
	recipe:SetSkillLevels(190, 190, 195, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Hunter's Ink -- 57703
	recipe = AddRecipe(57703, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43115)
	recipe:SetSkillLevels(85, 85, 85, 90, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Lion's Ink -- 57704
	recipe = AddRecipe(57704, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43116)
	recipe:SetSkillLevels(100, 100, 100, 100, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Dawnstar Ink -- 57706
	recipe = AddRecipe(57706, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43117)
	recipe:SetSkillLevels(125, 125, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Jadefire Ink -- 57707
	recipe = AddRecipe(57707, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43118)
	recipe:SetSkillLevels(150, 150, 150, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Royal Ink -- 57708
	recipe = AddRecipe(57708, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43119)
	recipe:SetSkillLevels(175, 175, 175, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Celestial Ink -- 57709
	recipe = AddRecipe(57709, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43120)
	recipe:SetSkillLevels(200, 200, 200, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Fiery Ink -- 57710
	recipe = AddRecipe(57710, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43121)
	recipe:SetSkillLevels(225, 225, 225, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Shimmering Ink -- 57711
	recipe = AddRecipe(57711, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43122)
	recipe:SetSkillLevels(250, 250, 250, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Ink of the Sky -- 57712
	recipe = AddRecipe(57712, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43123)
	recipe:SetSkillLevels(275, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Ethereal Ink -- 57713
	recipe = AddRecipe(57713, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43124)
	recipe:SetSkillLevels(290, 290, 295, 300, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Darkflame Ink -- 57714
	recipe = AddRecipe(57714, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43125)
	recipe:SetSkillLevels(325, 325, 325, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Ink of the Sea -- 57715
	recipe = AddRecipe(57715, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43126)
	recipe:SetSkillLevels(350, 350, 350, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Snowfall Ink -- 57716
	recipe = AddRecipe(57716, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43127)
	recipe:SetSkillLevels(375, 375, 375, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Aquatic Form -- 58286
	recipe = AddRecipe(58286, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43316)
	recipe:SetSkillLevels(75, 75, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Challenging Roar -- 58287
	recipe = AddRecipe(58287, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43334)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Unburdened Rebirth -- 58288
	recipe = AddRecipe(58288, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43331)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Thorns -- 58289
	recipe = AddRecipe(58289, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43332)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Mark of the Wild -- 58296
	recipe = AddRecipe(58296, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43335)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Aspect of the Pack -- 58297
	recipe = AddRecipe(58297, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43355)
	recipe:SetSkillLevels(195, 195, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Scare Beast -- 58298
	recipe = AddRecipe(58298, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43356)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Revive Pet -- 58299
	recipe = AddRecipe(58299, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43338)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Lesser Proportion -- 58301
	recipe = AddRecipe(58301, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43350)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Feign Death -- 58302
	recipe = AddRecipe(58302, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43351)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Arcane Brilliance -- 58303
	recipe = AddRecipe(58303, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43339)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Conjuring -- 58306
	recipe = AddRecipe(58306, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43359)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of the Monkey -- 58307
	recipe = AddRecipe(58307, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43360)
	recipe:SetSkillLevels(120, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Slow Fall -- 58308
	recipe = AddRecipe(58308, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43364)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of the Penguin -- 58310
	recipe = AddRecipe(58310, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43361)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Blessing of Kings -- 58311
	recipe = AddRecipe(58311, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43365)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Insight -- 58312
	recipe = AddRecipe(58312, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43366)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Lay on Hands -- 58313
	recipe = AddRecipe(58313, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43367)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Blessing of Might -- 58314
	recipe = AddRecipe(58314, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43340)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Truth -- 58315
	recipe = AddRecipe(58315, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43368)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Justice -- 58316
	recipe = AddRecipe(58316, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43369)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Fading -- 58317
	recipe = AddRecipe(58317, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43342)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Fortitude -- 58318
	recipe = AddRecipe(58318, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43371)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Levitate -- 58319
	recipe = AddRecipe(58319, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43370)
	recipe:SetSkillLevels(170, 170, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Shackle Undead -- 58320
	recipe = AddRecipe(58320, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43373)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Shadow Protection -- 58321
	recipe = AddRecipe(58321, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43372)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Shadowfiend -- 58322
	recipe = AddRecipe(58322, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43374)
	recipe:SetSkillLevels(345, 345, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Blurred Speed -- 58323
	recipe = AddRecipe(58323, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43379)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Distract -- 58324
	recipe = AddRecipe(58324, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43376)
	recipe:SetSkillLevels(120, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Pick Lock -- 58325
	recipe = AddRecipe(58325, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43377)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Pick Pocket -- 58326
	recipe = AddRecipe(58326, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43343)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Safe Fall -- 58327
	recipe = AddRecipe(58327, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43378)
	recipe:SetSkillLevels(195, 195, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Poisons -- 58328
	recipe = AddRecipe(58328, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43380)
	recipe:SetSkillLevels(120, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Astral Recall -- 58329
	recipe = AddRecipe(58329, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43381)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Renewed Life -- 58330
	recipe = AddRecipe(58330, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43385)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Water Breathing -- 58331
	recipe = AddRecipe(58331, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43344)
	recipe:SetSkillLevels(120, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of the Arctic Wolf -- 58332
	recipe = AddRecipe(58332, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43386)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Water Walking -- 58333
	recipe = AddRecipe(58333, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43388)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Unending Breath -- 58336
	recipe = AddRecipe(58336, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43389)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Drain Soul -- 58337
	recipe = AddRecipe(58337, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43390)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Curse of Exhaustion -- 58338
	recipe = AddRecipe(58338, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43392)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Enslave Demon -- 58339
	recipe = AddRecipe(58339, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43393)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Eye of Kilrogg -- 58340
	recipe = AddRecipe(58340, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43391)
	recipe:SetSkillLevels(120, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Ritual of Souls -- 58341
	recipe = AddRecipe(58341, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43394)
	recipe:SetSkillLevels(345, 345, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Battle -- 58342
	recipe = AddRecipe(58342, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43395)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Berserker Rage -- 58343
	recipe = AddRecipe(58343, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43396)
	recipe:SetSkillLevels(75, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Long Charge -- 58344
	recipe = AddRecipe(58344, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43397)
	recipe:SetSkillLevels(80, 80, 90, 95, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Demoralizing Shout -- 58345
	recipe = AddRecipe(58345, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43398)
	recipe:SetSkillLevels(95, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Thunder Clap -- 58346
	recipe = AddRecipe(58346, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43399)
	recipe:SetSkillLevels(80, 80, 90, 95, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Enduring Victory -- 58347
	recipe = AddRecipe(58347, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43400)
	recipe:SetSkillLevels(320, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Scroll of Agility -- 58472
	recipe = AddRecipe(58472, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(3012)
	recipe:SetSkillLevels(15, 15, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Scroll of Agility II -- 58473
	recipe = AddRecipe(58473, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(1477)
	recipe:SetSkillLevels(85, 85, 85, 90, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Agility III -- 58476
	recipe = AddRecipe(58476, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(4425)
	recipe:SetSkillLevels(175, 175, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Agility IV -- 58478
	recipe = AddRecipe(58478, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(10309)
	recipe:SetSkillLevels(225, 225, 230, 235, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Agility V -- 58480
	recipe = AddRecipe(58480, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(27498)
	recipe:SetSkillLevels(270, 270, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Agility VI -- 58481
	recipe = AddRecipe(58481, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33457)
	recipe:SetSkillLevels(310, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Agility VII -- 58482
	recipe = AddRecipe(58482, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43463)
	recipe:SetSkillLevels(370, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Agility VIII -- 58483
	recipe = AddRecipe(58483, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43464)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Strength -- 58484
	recipe = AddRecipe(58484, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(954)
	recipe:SetSkillLevels(15, 15, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Scroll of Strength II -- 58485
	recipe = AddRecipe(58485, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(2289)
	recipe:SetSkillLevels(80, 80, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Strength III -- 58486
	recipe = AddRecipe(58486, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(4426)
	recipe:SetSkillLevels(170, 170, 175, 180, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Strength IV -- 58487
	recipe = AddRecipe(58487, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(10310)
	recipe:SetSkillLevels(220, 220, 225, 230, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Strength V -- 58488
	recipe = AddRecipe(58488, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(27503)
	recipe:SetSkillLevels(265, 265, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Strength VI -- 58489
	recipe = AddRecipe(58489, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33462)
	recipe:SetSkillLevels(305, 305, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Strength VII -- 58490
	recipe = AddRecipe(58490, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43465)
	recipe:SetSkillLevels(365, 365, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Scroll of Strength VIII -- 58491
	recipe = AddRecipe(58491, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43466)
	recipe:SetSkillLevels(415, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Mystic Tome -- 58565
	recipe = AddRecipe(58565, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43515)
	recipe:SetSkillLevels(85, 85, 95, 100, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Dash -- 59315
	recipe = AddRecipe(59315, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43674)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Ghost Wolf -- 59326
	recipe = AddRecipe(59326, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43725)
	recipe:SetSkillLevels(100, 100, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Rune Tap -- 59338
	recipe = AddRecipe(59338, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43825)
	recipe:SetSkillLevels(310, 310, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Blood Boil -- 59339
	recipe = AddRecipe(59339, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43826)
	recipe:SetSkillLevels(320, 320, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Death Strike -- 59340
	recipe = AddRecipe(59340, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43827)
	recipe:SetSkillLevels(340, 340, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Certificate of Ownership -- 59387
	recipe = AddRecipe(59387, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43850)
	recipe:SetSkillLevels(200, 200, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Tome of the Dawn -- 59475
	recipe = AddRecipe(59475, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43654)
	recipe:SetSkillLevels(125, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Book of Survival -- 59478
	recipe = AddRecipe(59478, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43655)
	recipe:SetSkillLevels(125, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Strange Tarot -- 59480
	recipe = AddRecipe(59480, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44142)
	recipe:SetSkillLevels(125, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Tome of Kings -- 59484
	recipe = AddRecipe(59484, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43656)
	recipe:SetSkillLevels(175, 175, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Royal Guide of Escape Routes -- 59486
	recipe = AddRecipe(59486, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43657)
	recipe:SetSkillLevels(175, 175, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Arcane Tarot -- 59487
	recipe = AddRecipe(59487, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44161)
	recipe:SetSkillLevels(175, 175, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Fire Eater's Guide -- 59489
	recipe = AddRecipe(59489, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43660)
	recipe:SetSkillLevels(225, 225, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Book of Stars -- 59490
	recipe = AddRecipe(59490, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43661)
	recipe:SetSkillLevels(225, 225, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Shadowy Tarot -- 59491
	recipe = AddRecipe(59491, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44163)
	recipe:SetSkillLevels(225, 225, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Stormbound Tome -- 59493
	recipe = AddRecipe(59493, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43663)
	recipe:SetSkillLevels(275, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Manual of Clouds -- 59494
	recipe = AddRecipe(59494, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43664)
	recipe:SetSkillLevels(275, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Hellfire Tome -- 59495
	recipe = AddRecipe(59495, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43666)
	recipe:SetSkillLevels(325, 325, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Book of Clever Tricks -- 59496
	recipe = AddRecipe(59496, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43667)
	recipe:SetSkillLevels(325, 325, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Iron-bound Tome -- 59497
	recipe = AddRecipe(59497, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38322)
	recipe:SetSkillLevels(400, 400, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Faces of Doom -- 59498
	recipe = AddRecipe(59498, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44210)
	recipe:SetSkillLevels(400, 400, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Darkmoon Card -- 59502
	recipe = AddRecipe(59502, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44316)
	recipe:SetSkillLevels(275, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Greater Darkmoon Card -- 59503
	recipe = AddRecipe(59503, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44317)
	recipe:SetSkillLevels(325, 325, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Darkmoon Card of the North -- 59504
	recipe = AddRecipe(59504, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44318)
	recipe:SetSkillLevels(400, 400, 425, 450, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Holy Wrath -- 59559
	recipe = AddRecipe(59559, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43867)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Dazing Shield -- 59560
	recipe = AddRecipe(59560, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43868)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Seal of Truth -- 59561
	recipe = AddRecipe(59561, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43869)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Scroll of Recall II -- 60336
	recipe = AddRecipe(60336, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44314)
	recipe:SetSkillLevels(200, 200, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Scroll of Recall III -- 60337
	recipe = AddRecipe(60337, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44315)
	recipe:SetSkillLevels(350, 350, 350, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Master's Inscription of the Axe -- 61117
	recipe = AddRecipe(61117, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Master's Inscription of the Crag -- 61118
	recipe = AddRecipe(61118, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Master's Inscription of the Pinnacle -- 61119
	recipe = AddRecipe(61119, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Master's Inscription of the Storm -- 61120
	recipe = AddRecipe(61120, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Northrend Inscription Research -- 61177
	recipe = AddRecipe(61177, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(385, 385, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 33679, 46716)

	-- Minor Inscription Research -- 61288
	recipe = AddRecipe(61288, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(75, 75, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716, 47418)

	-- Glyph of Frostfire -- 61677
	recipe = AddRecipe(61677, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44684)
	recipe:SetSkillLevels(385, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Focus -- 62162
	recipe = AddRecipe(62162, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44928)
	recipe:SetSkillLevels(375, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Rituals of the New Moon -- 64051
	recipe = AddRecipe(64051, V.WOTLK, Q.UNCOMMON)
	recipe:SetCraftedItemID(46108)
	recipe:SetSkillLevels(350, 350, 375, 387, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CASTER, F.ONE_HAND)
	recipe:AddMobDrop(26679, 26708, 27546, 27676)

	-- Twilight Tome -- 64053
	recipe = AddRecipe(64053, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45849)
	recipe:SetSkillLevels(350, 350, 375, 387, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Raptor Strike -- 64246
	recipe = AddRecipe(64246, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45735)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Stoneclaw Totem -- 64247
	recipe = AddRecipe(64247, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45778)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Life Tap -- 64248
	recipe = AddRecipe(64248, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45785)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Scatter Shot -- 64249
	recipe = AddRecipe(64249, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45734)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Soul Link -- 64250
	recipe = AddRecipe(64250, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45789)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Salvation -- 64251
	recipe = AddRecipe(64251, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45747)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Shield Wall -- 64252
	recipe = AddRecipe(64252, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45797)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Master's Call -- 64253
	recipe = AddRecipe(64253, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45733)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Holy Shock -- 64254
	recipe = AddRecipe(64254, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45746)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Furious Sundering -- 64255
	recipe = AddRecipe(64255, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45793)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Barkskin -- 64256
	recipe = AddRecipe(64256, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45623)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Ice Barrier -- 64257
	recipe = AddRecipe(64257, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45740)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Monsoon -- 64258
	recipe = AddRecipe(64258, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45622)
	recipe:SetSkillLevels(250, 250, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Desperation -- 64259
	recipe = AddRecipe(64259, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45760)
	recipe:SetSkillLevels(255, 255, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Mutilate -- 64260
	recipe = AddRecipe(64260, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45768)
	recipe:SetSkillLevels(255, 255, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Earth Shield -- 64261
	recipe = AddRecipe(64261, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45775)
	recipe:SetSkillLevels(250, 250, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Shamanistic Rage -- 64262
	recipe = AddRecipe(64262, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45776)
	recipe:SetSkillLevels(255, 255, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Death Coil -- 64266
	recipe = AddRecipe(64266, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45804)
	recipe:SetSkillLevels(275, 275, 280, 287, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Berserk -- 64268
	recipe = AddRecipe(64268, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45601)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Wild Growth -- 64270
	recipe = AddRecipe(64270, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45602)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Chimera Shot -- 64271
	recipe = AddRecipe(64271, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45625)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Explosive Shot -- 64273
	recipe = AddRecipe(64273, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45731)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Deep Freeze -- 64274
	recipe = AddRecipe(64274, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45736)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Slow -- 64275
	recipe = AddRecipe(64275, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45737)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Arcane Barrage -- 64276
	recipe = AddRecipe(64276, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45738)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Beacon of Light -- 64277
	recipe = AddRecipe(64277, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45741)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Hammer of the Righteous -- 64278
	recipe = AddRecipe(64278, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45742)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Templar's Verdict -- 64279
	recipe = AddRecipe(64279, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45743)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Dispersion -- 64280
	recipe = AddRecipe(64280, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45753)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Guardian Spirit -- 64281
	recipe = AddRecipe(64281, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45755)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Penance -- 64282
	recipe = AddRecipe(64282, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45756)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Divine Accuracy -- 64283
	recipe = AddRecipe(64283, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45758)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Vendetta -- 64284
	recipe = AddRecipe(64284, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45761)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Killing Spree -- 64285
	recipe = AddRecipe(64285, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45762)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Shadow Dance -- 64286
	recipe = AddRecipe(64286, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45764)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Thunder -- 64287
	recipe = AddRecipe(64287, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45770)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Feral Spirit -- 64288
	recipe = AddRecipe(64288, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45771)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Riptide -- 64289
	recipe = AddRecipe(64289, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45772)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Haunt -- 64291
	recipe = AddRecipe(64291, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45779)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Chaos Bolt -- 64294
	recipe = AddRecipe(64294, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45781)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Bladestorm -- 64295
	recipe = AddRecipe(64295, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45790)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Shockwave -- 64296
	recipe = AddRecipe(64296, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45792)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Dancing Rune Weapon -- 64297
	recipe = AddRecipe(64297, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45799)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Hungering Cold -- 64298
	recipe = AddRecipe(64298, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45800)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Howling Blast -- 64300
	recipe = AddRecipe(64300, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45806)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Spell Reflection -- 64302
	recipe = AddRecipe(64302, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45795)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Cloak of Shadows -- 64303
	recipe = AddRecipe(64303, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45769)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Kill Shot -- 64304
	recipe = AddRecipe(64304, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45732)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Divine Plea -- 64305
	recipe = AddRecipe(64305, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45745)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Savage Roar -- 64307
	recipe = AddRecipe(64307, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45604)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Shield of the Righteous -- 64308
	recipe = AddRecipe(64308, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45744)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Spirit Tap -- 64309
	recipe = AddRecipe(64309, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45757)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Tricks of the Trade -- 64310
	recipe = AddRecipe(64310, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45767)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Shadowflame -- 64311
	recipe = AddRecipe(64311, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45783)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Intimidating Shout -- 64312
	recipe = AddRecipe(64312, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45794)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Starsurge -- 64313
	recipe = AddRecipe(64313, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45603)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Mirror Image -- 64314
	recipe = AddRecipe(64314, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45739)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Fan of Knives -- 64315
	recipe = AddRecipe(64315, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45766)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Hex -- 64316
	recipe = AddRecipe(64316, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45777)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Demonic Circle -- 64317
	recipe = AddRecipe(64317, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45782)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Metamorphosis -- 64318
	recipe = AddRecipe(64318, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(45780)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of Ferocious Bite -- 67600
	recipe = AddRecipe(67600, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(48720)
	recipe:SetSkillLevels(100, 100, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26959, 28702, 30706, 30709, 30710, 30713, 30715, 30722, 33603, 33615, 33638, 33679, 46716)

	-- Glyph of Command -- 68166
	recipe = AddRecipe(68166, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(49084)
	recipe:SetSkillLevels(355, 355, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Runescroll of Fortitude -- 69385
	recipe = AddRecipe(69385, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(49632)
	recipe:SetSkillLevels(440, 440, 440, 442, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30713, 30715, 33603, 33615, 33638, 46716)

	-- Glyph of Mana Shield -- 71101
	recipe = AddRecipe(71101, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(50166)
	recipe:SetCraftedItemID(50045)
	recipe:SetSkillLevels(250, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CASTER, F.MAGE)
	recipe:AddVendor(28723, 30734, 30735)

	-- Glyph of Lash of Pain -- 71102
	recipe = AddRecipe(71102, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(50168)
	recipe:SetCraftedItemID(50077)
	recipe:SetSkillLevels(375, 375, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CASTER, F.WARLOCK)
	recipe:AddVendor(28723)

	-- Runescroll of Fortitude II -- 85785
	recipe = AddRecipe(85785, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62251)
	recipe:SetSkillLevels(500, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Blackfallow Ink -- 86004
	recipe = AddRecipe(86004, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(61978)
	recipe:SetSkillLevels(425, 425, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Inferno Ink -- 86005
	recipe = AddRecipe(86005, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(61981)
	recipe:SetSkillLevels(475, 475, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Swiftsteel Inscription -- 86375
	recipe = AddRecipe(86375, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Lionsmane Inscription -- 86401
	recipe = AddRecipe(86401, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Inscription of the Earth Prince -- 86402
	recipe = AddRecipe(86402, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Felfire Inscription -- 86403
	recipe = AddRecipe(86403, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Mysterious Fortune Card -- 86609
	recipe = AddRecipe(86609, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(60838)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Darkmoon Card of Destruction -- 86615
	recipe = AddRecipe(86615, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(61987)
	recipe:SetSkillLevels(525, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Book of Blood -- 86616
	recipe = AddRecipe(86616, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62231)
	recipe:SetSkillLevels(475, 475, 485, 487, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Lord Rottington's Pressed Wisp Book -- 86640
	recipe = AddRecipe(86640, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62233)
	recipe:SetSkillLevels(475, 475, 485, 487, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Dungeoneering Guide -- 86641
	recipe = AddRecipe(86641, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62234)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Divine Companion -- 86642
	recipe = AddRecipe(86642, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62235)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Battle Tome -- 86643
	recipe = AddRecipe(86643, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62236)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Origami Slime -- 86644
	recipe = AddRecipe(86644, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62239)
	recipe:SetSkillLevels(480, 480, 480, 480, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Vashj'ir")

	-- Origami Rock -- 86645
	recipe = AddRecipe(86645, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62238)
	recipe:SetSkillLevels(490, 490, 490, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Deepholm")

	-- Origami Beetle -- 86646
	recipe = AddRecipe(86646, V.CATA, Q.COMMON)
	recipe:SetRecipeItemID(65651)
	recipe:SetCraftedItemID(63246)
	recipe:SetSkillLevels(500, 500, 500, 500, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddWorldDrop("Uldum")

	-- Etched Horn -- 86647
	recipe = AddRecipe(86647, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62240)
	recipe:SetSkillLevels(480, 480, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Manual of the Planes -- 86648
	recipe = AddRecipe(86648, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62241)
	recipe:SetSkillLevels(480, 480, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Runed Dragonscale -- 86649
	recipe = AddRecipe(86649, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62242)
	recipe:SetSkillLevels(505, 505, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Notched Jawbone -- 86650
	recipe = AddRecipe(86650, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62243)
	recipe:SetSkillLevels(515, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Tattooed Eyeball -- 86652
	recipe = AddRecipe(86652, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62244)
	recipe:SetSkillLevels(515, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Silver Inlaid Leaf -- 86653
	recipe = AddRecipe(86653, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62245)
	recipe:SetSkillLevels(515, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Forged Documents -- 86654
	recipe = AddRecipe(86654, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63276)
	recipe:SetSkillLevels(500, 500, 510, 522, 535)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 33603, 33615, 33638, 46716)

	-- Forged Documents -- 89244
	recipe = AddRecipe(89244, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62056)
	recipe:SetSkillLevels(500, 500, 510, 522, 535)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30713, 30715, 30717)

	-- Adventurer's Journal -- 89367
	recipe = AddRecipe(89367, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(62237)
	recipe:SetSkillLevels(460, 460, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Scroll of Intellect IX -- 89368
	recipe = AddRecipe(89368, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63305)
	recipe:SetSkillLevels(445, 445, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Scroll of Strength IX -- 89369
	recipe = AddRecipe(89369, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63304)
	recipe:SetSkillLevels(465, 465, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Scroll of Agility IX -- 89370
	recipe = AddRecipe(89370, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63303)
	recipe:SetSkillLevels(470, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Scroll of Spirit IX -- 89371
	recipe = AddRecipe(89371, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63307)
	recipe:SetSkillLevels(455, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Scroll of Stamina IX -- 89372
	recipe = AddRecipe(89372, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63306)
	recipe:SetSkillLevels(460, 460, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Scroll of Protection IX -- 89373
	recipe = AddRecipe(89373, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63308)
	recipe:SetSkillLevels(450, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Colossus Smash -- 89815
	recipe = AddRecipe(89815, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63481)
	recipe:SetSkillLevels(430, 430, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.WARRIOR)
	recipe:AddVendor(49703, 50248)

	-- Vanishing Powder -- 92026
	recipe = AddRecipe(92026, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(64670)
	recipe:SetSkillLevels(75, 75, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Dust of Disappearance -- 92027
	recipe = AddRecipe(92027, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63388)
	recipe:SetSkillLevels(475, 475, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Blind -- 92579
	recipe = AddRecipe(92579, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(64493)
	recipe:SetSkillLevels(180, 180, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ROGUE)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Living Bomb -- 94000
	recipe = AddRecipe(94000, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(63539)
	recipe:SetSkillLevels(390, 390, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.CASTER, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Tiger's Fury -- 94401
	recipe = AddRecipe(94401, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67487)
	recipe:SetSkillLevels(120, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Lacerate -- 94402
	recipe = AddRecipe(94402, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67484)
	recipe:SetSkillLevels(330, 330, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Faerie Fire -- 94403
	recipe = AddRecipe(94403, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67485)
	recipe:SetSkillLevels(120, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Feral Charge -- 94404
	recipe = AddRecipe(94404, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67486)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Death Wish -- 94405
	recipe = AddRecipe(94405, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67483)
	recipe:SetSkillLevels(150, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.WARRIOR)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Intercept -- 94406
	recipe = AddRecipe(94406, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(67482)
	recipe:SetSkillLevels(250, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.WARRIOR)
	recipe:AddTrainer(28702, 30706, 30709, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Vanish -- 94711
	recipe = AddRecipe(94711, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63420)
	recipe:SetSkillLevels(430, 430, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.ROGUE)
	recipe:AddDiscovery("DISCOVERY_INSC_BOOK")

	-- Glyph of the Treant -- 95215
	recipe = AddRecipe(95215, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(68039)
	recipe:SetSkillLevels(155, 155, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of Armors -- 95710
	recipe = AddRecipe(95710, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(63416)
	recipe:SetSkillLevels(155, 155, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_MINOR")

	-- Glyph of the Long Word -- 95825
	recipe = AddRecipe(95825, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(66918)
	recipe:SetSkillLevels(390, 390, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.PALADIN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Glyph of Dark Succor -- 96284
	recipe = AddRecipe(96284, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(68793)
	recipe:SetSkillLevels(275, 275, 280, 287, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(28702, 30706, 30709, 30711, 30713, 30715, 30717, 33603, 33615, 33638, 46716)

	-- Glyph of Frost Armor -- 98398
	recipe = AddRecipe(98398, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(69773)
	recipe:SetSkillLevels(430, 430, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.MAGE)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	-- Bloodthirsty Charm of Triumph -- 99547
	recipe = AddRecipe(99547, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(70077)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(30706, 46716)

	-- Bloodthirsty Eyeball of Dominance -- 99548
	recipe = AddRecipe(99548, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(70078)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(30706, 46716)

	-- Bloodthirsty Jawbone of Conquest -- 99549
	recipe = AddRecipe(99549, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(70079)
	recipe:SetSkillLevels(510, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(30706, 46716)

	-- Glyph of Unleashed Lightning -- 101057
	recipe = AddRecipe(101057, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(71155)
	recipe:SetSkillLevels(430, 430, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.SHAMAN)
	recipe:AddDiscovery("DISCOVERY_INSC_NORTHREND")

	self.InitInscription = nil
end
