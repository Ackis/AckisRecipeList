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

--------------------------------------------------------------------------------------------------------------------
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 45357, nil, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
end

function addon:InitInscription()
	local recipe

	-- Scroll of Stamina -- 45382
	recipe = AddRecipe(45382, 1, 1180, Q.COMMON, V.WOTLK, 1, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Scroll of Intellect -- 48114
	recipe = AddRecipe(48114, 1, 955, Q.COMMON, V.WOTLK, 1, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Scroll of Spirit -- 48116
	recipe = AddRecipe(48116, 1, 1181, Q.COMMON, V.WOTLK, 1, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddCustom(8)

	-- Glyph of Entangling Roots -- 48121
	recipe = AddRecipe(48121, 100, 40924, Q.COMMON, V.WOTLK, 100, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Mysterious Tarot -- 48247
	recipe = AddRecipe(48247, 85, 37168, Q.COMMON, V.WOTLK, 85, 95, 100, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Recall -- 48248
	recipe = AddRecipe(48248, 35, 37118, Q.COMMON, V.WOTLK, 35, 60, 67, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Intellect II -- 50598
	recipe = AddRecipe(50598, 75, 2290, Q.COMMON, V.WOTLK, 75, 75, 80, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Intellect III -- 50599
	recipe = AddRecipe(50599, 165, 4419, Q.COMMON, V.WOTLK, 165, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Intellect IV -- 50600
	recipe = AddRecipe(50600, 215, 10308, Q.COMMON, V.WOTLK, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Intellect V -- 50601
	recipe = AddRecipe(50601, 260, 27499, Q.COMMON, V.WOTLK, 260, 265, 270, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Intellect VI -- 50602
	recipe = AddRecipe(50602, 300, 33458, Q.COMMON, V.WOTLK, 300, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Intellect VII -- 50603
	recipe = AddRecipe(50603, 360, 37091, Q.COMMON, V.WOTLK, 360, 365, 370, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Intellect VIII -- 50604
	recipe = AddRecipe(50604, 410, 37092, Q.COMMON, V.WOTLK, 410, 415, 420, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Spirit II -- 50605
	recipe = AddRecipe(50605, 75, 1712, Q.COMMON, V.WOTLK, 75, 75, 80, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Spirit III -- 50606
	recipe = AddRecipe(50606, 160, 4424, Q.COMMON, V.WOTLK, 160, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Spirit IV -- 50607
	recipe = AddRecipe(50607, 210, 10306, Q.COMMON, V.WOTLK, 210, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Spirit V -- 50608
	recipe = AddRecipe(50608, 255, 27501, Q.COMMON, V.WOTLK, 255, 260, 265, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Spirit VI -- 50609
	recipe = AddRecipe(50609, 295, 33460, Q.COMMON, V.WOTLK, 295, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Spirit VII -- 50610
	recipe = AddRecipe(50610, 355, 37097, Q.COMMON, V.WOTLK, 355, 360, 365, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Spirit VIII -- 50611
	recipe = AddRecipe(50611, 405, 37098, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Stamina II -- 50612
	recipe = AddRecipe(50612, 75, 1711, Q.COMMON, V.WOTLK, 75, 75, 80, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Stamina III -- 50614
	recipe = AddRecipe(50614, 155, 4422, Q.COMMON, V.WOTLK, 155, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Stamina IV -- 50616
	recipe = AddRecipe(50616, 205, 10307, Q.COMMON, V.WOTLK, 205, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Stamina V -- 50617
	recipe = AddRecipe(50617, 250, 27502, Q.COMMON, V.WOTLK, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Stamina VI -- 50618
	recipe = AddRecipe(50618, 290, 33461, Q.COMMON, V.WOTLK, 290, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Stamina VII -- 50619
	recipe = AddRecipe(50619, 350, 37093, Q.COMMON, V.WOTLK, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Stamina VIII -- 50620
	recipe = AddRecipe(50620, 400, 37094, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Ivory Ink -- 52738
	recipe = AddRecipe(52738, 1, 37101, Q.COMMON, V.WOTLK, 1, 15, 22, 30)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Enchanting Vellum -- 52739
	recipe = AddRecipe(52739, 35, 38682, Q.COMMON, V.WOTLK, 35, 75, 87, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Moonglow Ink -- 52843
	recipe = AddRecipe(52843, 35, 39469, Q.COMMON, V.WOTLK, 35, 45, 60, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Midnight Ink -- 53462
	recipe = AddRecipe(53462, 75, 39774, Q.COMMON, V.WOTLK, 75, 75, 77, 80)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Frenzied Regeneration -- 56943
	recipe = AddRecipe(56943, 350, 40896, Q.COMMON, V.WOTLK, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Solar Beam -- 56944
	recipe = AddRecipe(56944, 385, 40899, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Healing Touch -- 56945
	recipe = AddRecipe(56945, 115, 40914, Q.COMMON, V.WOTLK, 115, 120, 125, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Hurricane -- 56946
	recipe = AddRecipe(56946, 385, 40920, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Innervate -- 56947
	recipe = AddRecipe(56947, 385, 40908, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Insect Swarm -- 56948
	recipe = AddRecipe(56948, 150, 40919, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Lifebloom -- 56949
	recipe = AddRecipe(56949, 385, 40915, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Mangle -- 56950
	recipe = AddRecipe(56950, 385, 40900, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Moonfire -- 56951
	recipe = AddRecipe(56951, 130, 40923, Q.COMMON, V.WOTLK, 130, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Rake -- 56952
	recipe = AddRecipe(56952, 310, 40903, Q.COMMON, V.WOTLK, 310, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Rebirth -- 56953
	recipe = AddRecipe(56953, 170, 40909, Q.COMMON, V.WOTLK, 170, 175, 180, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Regrowth -- 56954
	recipe = AddRecipe(56954, 385, 40912, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Rejuvenation -- 56955
	recipe = AddRecipe(56955, 80, 40913, Q.COMMON, V.WOTLK, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Rip -- 56956
	recipe = AddRecipe(56956, 200, 40902, Q.COMMON, V.WOTLK, 200, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Shred -- 56957
	recipe = AddRecipe(56957, 260, 40901, Q.COMMON, V.WOTLK, 260, 265, 270, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Starfall -- 56958
	recipe = AddRecipe(56958, 385, 40921, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Starfire -- 56959
	recipe = AddRecipe(56959, 220, 40916, Q.COMMON, V.WOTLK, 220, 225, 230, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Swiftmend -- 56960
	recipe = AddRecipe(56960, 385, 40906, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.DRUID)
	recipe:AddCustom(15)

	-- Glyph of Maul -- 56961
	recipe = AddRecipe(56961, 90, 40897, Q.COMMON, V.WOTLK, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Wrath -- 56963
	recipe = AddRecipe(56963, 85, 40922, Q.COMMON, V.WOTLK, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Typhoon -- 56965
	recipe = AddRecipe(56965, 310, 44955, Q.COMMON, V.WOTLK, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Arcane Missiles -- 56971
	recipe = AddRecipe(56971, 115, 42735, Q.COMMON, V.WOTLK, 115, 120, 125, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Arcane Power -- 56972
	recipe = AddRecipe(56972, 335, 42736, Q.COMMON, V.WOTLK, 335, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Blink -- 56973
	recipe = AddRecipe(56973, 130, 42737, Q.COMMON, V.WOTLK, 130, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Evocation -- 56974
	recipe = AddRecipe(56974, 155, 42738, Q.COMMON, V.WOTLK, 155, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Fireball -- 56975
	recipe = AddRecipe(56975, 385, 42739, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Frost Nova -- 56976
	recipe = AddRecipe(56976, 80, 42741, Q.COMMON, V.WOTLK, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Frostbolt -- 56977
	recipe = AddRecipe(56977, 385, 42742, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Pyroblast -- 56978
	recipe = AddRecipe(56978, 90, 42743, Q.COMMON, V.WOTLK, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Ice Block -- 56979
	recipe = AddRecipe(56979, 225, 42744, Q.COMMON, V.WOTLK, 225, 230, 235, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Ice Lance -- 56980
	recipe = AddRecipe(56980, 375, 42745, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Icy Veins -- 56981
	recipe = AddRecipe(56981, 175, 42746, Q.COMMON, V.WOTLK, 175, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Invisibility -- 56983
	recipe = AddRecipe(56983, 385, 42748, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Mage Armor -- 56984
	recipe = AddRecipe(56984, 325, 42749, Q.COMMON, V.WOTLK, 325, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Molten Armor -- 56986
	recipe = AddRecipe(56986, 385, 42751, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Polymorph -- 56987
	recipe = AddRecipe(56987, 400, 42752, Q.COMMON, V.WOTLK, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Cone of Cold -- 56988
	recipe = AddRecipe(56988, 385, 42753, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Dragon's Breath -- 56989
	recipe = AddRecipe(56989, 385, 42754, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Blast Wave -- 56990
	recipe = AddRecipe(56990, 310, 44920, Q.COMMON, V.WOTLK, 310, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of Arcane Blast -- 56991
	recipe = AddRecipe(56991, 315, 44955, Q.COMMON, V.WOTLK, 315, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Aimed Shot -- 56994
	recipe = AddRecipe(56994, 175, 42897, Q.COMMON, V.WOTLK, 175, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Arcane Shot -- 56995
	recipe = AddRecipe(56995, 100, 42898, Q.COMMON, V.WOTLK, 100, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Trap Launcher -- 56996
	recipe = AddRecipe(56996, 385, 42899, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Mending -- 56997
	recipe = AddRecipe(56997, 115, 42900, Q.COMMON, V.WOTLK, 115, 120, 125, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Concussive Shot -- 56998
	recipe = AddRecipe(56998, 385, 42901, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Bestial Wrath -- 56999
	recipe = AddRecipe(56999, 385, 42902, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Deterrence -- 57000
	recipe = AddRecipe(57000, 200, 42903, Q.COMMON, V.WOTLK, 200, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Disengage -- 57001
	recipe = AddRecipe(57001, 225, 42904, Q.COMMON, V.WOTLK, 225, 230, 235, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Freezing Trap -- 57002
	recipe = AddRecipe(57002, 260, 42905, Q.COMMON, V.WOTLK, 260, 265, 270, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Ice Trap -- 57003
	recipe = AddRecipe(57003, 350, 42906, Q.COMMON, V.WOTLK, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Misdirection -- 57004
	recipe = AddRecipe(57004, 80, 42907, Q.COMMON, V.WOTLK, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Immolation Trap -- 57005
	recipe = AddRecipe(57005, 130, 42908, Q.COMMON, V.WOTLK, 130, 135, 140, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of the Dazzled Prey -- 57006
	recipe = AddRecipe(57006, 375, 42909, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Silencing Shot -- 57007
	recipe = AddRecipe(57007, 150, 42910, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Rapid Fire -- 57008
	recipe = AddRecipe(57008, 315, 42911, Q.COMMON, V.WOTLK, 315, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Serpent Sting -- 57009
	recipe = AddRecipe(57009, 90, 42912, Q.COMMON, V.WOTLK, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Snake Trap -- 57010
	recipe = AddRecipe(57010, 385, 42913, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Steady Shot -- 57011
	recipe = AddRecipe(57011, 385, 42914, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Kill Command -- 57012
	recipe = AddRecipe(57012, 385, 42915, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Wyvern Sting -- 57014
	recipe = AddRecipe(57014, 385, 42917, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(15)

	-- Glyph of Focused Shield -- 57019
	recipe = AddRecipe(57019, 385, 41101, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Cleansing -- 57020
	recipe = AddRecipe(57020, 180, 41104, Q.COMMON, V.WOTLK, 180, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of the Ascetic Crusader -- 57021
	recipe = AddRecipe(57021, 385, 41107, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Divine Protection -- 57022
	recipe = AddRecipe(57022, 80, 41096, Q.COMMON, V.WOTLK, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Consecration -- 57023
	recipe = AddRecipe(57023, 205, 41099, Q.COMMON, V.WOTLK, 205, 210, 215, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Crusader Strike -- 57024
	recipe = AddRecipe(57024, 230, 41098, Q.COMMON, V.WOTLK, 230, 235, 240, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Exorcism -- 57025
	recipe = AddRecipe(57025, 265, 41103, Q.COMMON, V.WOTLK, 265, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Word of Glory -- 57026
	recipe = AddRecipe(57026, 300, 41105, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Hammer of Justice -- 57027
	recipe = AddRecipe(57027, 90, 41095, Q.COMMON, V.WOTLK, 90, 100, 110, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Hammer of Wrath -- 57028
	recipe = AddRecipe(57028, 385, 41097, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Divine Favor -- 57029
	recipe = AddRecipe(57029, 105, 41106, Q.COMMON, V.WOTLK, 105, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Judgement -- 57030
	recipe = AddRecipe(57030, 120, 41092, Q.COMMON, V.WOTLK, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Divinity -- 57031
	recipe = AddRecipe(57031, 135, 41108, Q.COMMON, V.WOTLK, 135, 140, 145, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Righteousness -- 57032
	recipe = AddRecipe(57032, 155, 41100, Q.COMMON, V.WOTLK, 155, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679)

	-- Glyph of Rebuke -- 57033
	recipe = AddRecipe(57033, 335, 41094, Q.COMMON, V.WOTLK, 335, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Seal of Insight -- 57034
	recipe = AddRecipe(57034, 385, 41110, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Light of Dawn -- 57035
	recipe = AddRecipe(57035, 385, 41109, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Turn Evil -- 57036
	recipe = AddRecipe(57036, 375, 41102, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Adrenaline Rush -- 57112
	recipe = AddRecipe(57112, 385, 42954, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Ambush -- 57113
	recipe = AddRecipe(57113, 340, 42955, Q.COMMON, V.WOTLK, 340, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Backstab -- 57114
	recipe = AddRecipe(57114, 80, 42956, Q.COMMON, V.WOTLK, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Blade Flurry -- 57115
	recipe = AddRecipe(57115, 385, 42957, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Crippling Poison -- 57116
	recipe = AddRecipe(57116, 385, 42958, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Deadly Throw -- 57117
	recipe = AddRecipe(57117, 385, 42959, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Evasion -- 57119
	recipe = AddRecipe(57119, 95, 42960, Q.COMMON, V.WOTLK, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Eviscerate -- 57120
	recipe = AddRecipe(57120, 105, 42961, Q.COMMON, V.WOTLK, 105, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Expose Armor -- 57121
	recipe = AddRecipe(57121, 120, 42962, Q.COMMON, V.WOTLK, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Feint -- 57122
	recipe = AddRecipe(57122, 305, 42963, Q.COMMON, V.WOTLK, 305, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Garrote -- 57123
	recipe = AddRecipe(57123, 135, 42964, Q.COMMON, V.WOTLK, 135, 140, 145, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Revealing Strike -- 57124
	recipe = AddRecipe(57124, 385, 42965, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Gouge -- 57125
	recipe = AddRecipe(57125, 160, 42966, Q.COMMON, V.WOTLK, 160, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Hemorrhage -- 57126
	recipe = AddRecipe(57126, 385, 42967, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Preparation -- 57127
	recipe = AddRecipe(57127, 385, 42968, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Rupture -- 57128
	recipe = AddRecipe(57128, 385, 42969, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Sap -- 57129
	recipe = AddRecipe(57129, 185, 42970, Q.COMMON, V.WOTLK, 185, 190, 195, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Kick -- 57130
	recipe = AddRecipe(57130, 385, 42971, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(15)

	-- Glyph of Sinister Strike -- 57131
	recipe = AddRecipe(57131, 210, 42972, Q.COMMON, V.WOTLK, 210, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Slice and Dice -- 57132
	recipe = AddRecipe(57132, 235, 42973, Q.COMMON, V.WOTLK, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Sprint -- 57133
	recipe = AddRecipe(57133, 285, 42974, Q.COMMON, V.WOTLK, 285, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Shield Slam -- 57152
	recipe = AddRecipe(57152, 385, 43425, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.TANK, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Bloody Healing -- 57153
	recipe = AddRecipe(57153, 385, 43412, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Cleaving -- 57154
	recipe = AddRecipe(57154, 240, 43414, Q.COMMON, V.WOTLK, 240, 245, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Devastate -- 57155
	recipe = AddRecipe(57155, 385, 43415, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Bloodthirst -- 57156
	recipe = AddRecipe(57156, 285, 43416, Q.COMMON, V.WOTLK, 285, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Piercing Howl -- 57157
	recipe = AddRecipe(57157, 125, 43417, Q.COMMON, V.WOTLK, 125, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Heroic Throw -- 57158
	recipe = AddRecipe(57158, 95, 43418, Q.COMMON, V.WOTLK, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Intervene -- 57159
	recipe = AddRecipe(57159, 385, 43419, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Mortal Strike -- 57160
	recipe = AddRecipe(57160, 385, 43421, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Overpower -- 57161
	recipe = AddRecipe(57161, 170, 43422, Q.COMMON, V.WOTLK, 170, 175, 180, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Rapid Charge -- 57162
	recipe = AddRecipe(57162, 85, 43413, Q.COMMON, V.WOTLK, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Slam -- 57163
	recipe = AddRecipe(57163, 110, 43423, Q.COMMON, V.WOTLK, 110, 115, 120, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Resonating Power -- 57164
	recipe = AddRecipe(57164, 385, 43430, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Revenge -- 57165
	recipe = AddRecipe(57165, 190, 43424, Q.COMMON, V.WOTLK, 190, 195, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Sunder Armor -- 57167
	recipe = AddRecipe(57167, 140, 43427, Q.COMMON, V.WOTLK, 140, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Sweeping Strikes -- 57168
	recipe = AddRecipe(57168, 320, 43428, Q.COMMON, V.WOTLK, 320, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Victory Rush -- 57170
	recipe = AddRecipe(57170, 385, 43431, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(15)

	-- Glyph of Raging Blow -- 57172
	recipe = AddRecipe(57172, 345, 43432, Q.COMMON, V.WOTLK, 345, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Circle of Healing -- 57181
	recipe = AddRecipe(57181, 385, 42396, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Dispel Magic -- 57183
	recipe = AddRecipe(57183, 230, 42397, Q.COMMON, V.WOTLK, 230, 235, 240, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Fade -- 57184
	recipe = AddRecipe(57184, 105, 42398, Q.COMMON, V.WOTLK, 105, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Fear Ward -- 57185
	recipe = AddRecipe(57185, 270, 42399, Q.COMMON, V.WOTLK, 270, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Flash Heal -- 57186
	recipe = AddRecipe(57186, 120, 42400, Q.COMMON, V.WOTLK, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Holy Nova -- 57187
	recipe = AddRecipe(57187, 315, 42401, Q.COMMON, V.WOTLK, 315, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Inner Fire -- 57188
	recipe = AddRecipe(57188, 135, 42402, Q.COMMON, V.WOTLK, 135, 140, 145, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Lightwell -- 57189
	recipe = AddRecipe(57189, 385, 42403, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Mass Dispel -- 57190
	recipe = AddRecipe(57190, 385, 42404, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Psychic Horror -- 57191
	recipe = AddRecipe(57191, 385, 42405, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Shadow Word: Pain -- 57192
	recipe = AddRecipe(57192, 350, 42406, Q.COMMON, V.WOTLK, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Power Word: Barrier -- 57193
	recipe = AddRecipe(57193, 385, 42407, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Power Word: Shield -- 57194
	recipe = AddRecipe(57194, 80, 42408, Q.COMMON, V.WOTLK, 80, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Prayer of Healing -- 57195
	recipe = AddRecipe(57195, 385, 42409, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Psychic Scream -- 57196
	recipe = AddRecipe(57196, 95, 42410, Q.COMMON, V.WOTLK, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Renew -- 57197
	recipe = AddRecipe(57197, 160, 42411, Q.COMMON, V.WOTLK, 160, 165, 170, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Scourge Imprisonment -- 57198
	recipe = AddRecipe(57198, 375, 42412, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Shadow Word: Death -- 57199
	recipe = AddRecipe(57199, 385, 42414, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Mind Flay -- 57200
	recipe = AddRecipe(57200, 180, 42415, Q.COMMON, V.WOTLK, 180, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Smite -- 57201
	recipe = AddRecipe(57201, 210, 42416, Q.COMMON, V.WOTLK, 210, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Spirit of Redemption -- 57202
	recipe = AddRecipe(57202, 385, 42417, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.PRIEST)
	recipe:AddCustom(15)

	-- Glyph of Anti-Magic Shell -- 57207
	recipe = AddRecipe(57207, 385, 43533, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(15)

	-- Glyph of Heart Strike -- 57208
	recipe = AddRecipe(57208, 385, 43534, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(15)

	-- Glyph of Blood Tap -- 57209
	recipe = AddRecipe(57209, 320, 43535, Q.COMMON, V.WOTLK, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(14)

	-- Glyph of Bone Shield -- 57210
	recipe = AddRecipe(57210, 265, 43536, Q.COMMON, V.WOTLK, 265, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Chains of Ice -- 57211
	recipe = AddRecipe(57211, 385, 43537, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(15)

	-- Glyph of Death Grip -- 57213
	recipe = AddRecipe(57213, 285, 43541, Q.COMMON, V.WOTLK, 285, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Death and Decay -- 57214
	recipe = AddRecipe(57214, 385, 43542, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(15)

	-- Glyph of Death's Embrace -- 57215
	recipe = AddRecipe(57215, 300, 43539, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(14)

	-- Glyph of Frost Strike -- 57216
	recipe = AddRecipe(57216, 270, 43543, Q.COMMON, V.WOTLK, 270, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Horn of Winter -- 57217
	recipe = AddRecipe(57217, 320, 43544, Q.COMMON, V.WOTLK, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(14)

	-- Glyph of Icy Touch -- 57219
	recipe = AddRecipe(57219, 280, 43546, Q.COMMON, V.WOTLK, 280, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Obliterate -- 57220
	recipe = AddRecipe(57220, 385, 43547, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(15)

	-- Glyph of Pestilence -- 57221
	recipe = AddRecipe(57221, 300, 43548, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Raise Dead -- 57222
	recipe = AddRecipe(57222, 350, 43549, Q.COMMON, V.WOTLK, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Rune Strike -- 57223
	recipe = AddRecipe(57223, 385, 43550, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(15)

	-- Glyph of Scourge Strike -- 57224
	recipe = AddRecipe(57224, 330, 43551, Q.COMMON, V.WOTLK, 330, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Strangulate -- 57225
	recipe = AddRecipe(57225, 375, 43552, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Pillar of Frost -- 57226
	recipe = AddRecipe(57226, 305, 43553, Q.COMMON, V.WOTLK, 305, 310, 315, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Vampiric Blood -- 57227
	recipe = AddRecipe(57227, 345, 43554, Q.COMMON, V.WOTLK, 345, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Raise Ally -- 57228
	recipe = AddRecipe(57228, 300, 43673, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(14)

	-- Glyph of Path of Frost -- 57229
	recipe = AddRecipe(57229, 300, 43671, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(14)

	-- Glyph of Resilient Grip -- 57230
	recipe = AddRecipe(57230, 300, 43672, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(14)

	-- Glyph of Chain Heal -- 57232
	recipe = AddRecipe(57232, 385, 41517, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Chain Lightning -- 57233
	recipe = AddRecipe(57233, 385, 41518, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Lava Burst -- 57234
	recipe = AddRecipe(57234, 385, 41524, Q.COMMON, V.WOTLK, 385, 390, 395, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Shocking -- 57235
	recipe = AddRecipe(57235, 385, 41526, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Earthliving Weapon -- 57236
	recipe = AddRecipe(57236, 300, 41527, Q.COMMON, V.WOTLK, 300, 305, 310, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Fire Elemental Totem -- 57237
	recipe = AddRecipe(57237, 385, 41529, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Fire Nova -- 57238
	recipe = AddRecipe(57238, 110, 41530, Q.COMMON, V.WOTLK, 110, 115, 120, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Flame Shock -- 57239
	recipe = AddRecipe(57239, 85, 41531, Q.COMMON, V.WOTLK, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Flametongue Weapon -- 57240
	recipe = AddRecipe(57240, 125, 41532, Q.COMMON, V.WOTLK, 125, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Frost Shock -- 57241
	recipe = AddRecipe(57241, 185, 41547, Q.COMMON, V.WOTLK, 185, 190, 195, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Healing Stream Totem -- 57242
	recipe = AddRecipe(57242, 215, 41533, Q.COMMON, V.WOTLK, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Healing Wave -- 57243
	recipe = AddRecipe(57243, 385, 41534, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Totemic Recall -- 57244
	recipe = AddRecipe(57244, 235, 41535, Q.COMMON, V.WOTLK, 235, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Lightning Bolt -- 57245
	recipe = AddRecipe(57245, 140, 41536, Q.COMMON, V.WOTLK, 140, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Lightning Shield -- 57246
	recipe = AddRecipe(57246, 95, 41537, Q.COMMON, V.WOTLK, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Grounding Totem -- 57247
	recipe = AddRecipe(57247, 385, 41538, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Stormstrike -- 57248
	recipe = AddRecipe(57248, 375, 41539, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Lava Lash -- 57249
	recipe = AddRecipe(57249, 165, 41540, Q.COMMON, V.WOTLK, 165, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Elemental Mastery -- 57250
	recipe = AddRecipe(57250, 385, 41552, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(15)

	-- Glyph of Water Shield -- 57251
	recipe = AddRecipe(57251, 275, 41541, Q.COMMON, V.WOTLK, 275, 280, 285, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Windfury Weapon -- 57252
	recipe = AddRecipe(57252, 330, 41542, Q.COMMON, V.WOTLK, 330, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Thunderstorm -- 57253
	recipe = AddRecipe(57253, 355, 44923, Q.COMMON, V.WOTLK, 355, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(14)

	-- Glyph of Incinerate -- 57257
	recipe = AddRecipe(57257, 350, 42453, Q.COMMON, V.WOTLK, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Conflagrate -- 57258
	recipe = AddRecipe(57258, 385, 42454, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Corruption -- 57259
	recipe = AddRecipe(57259, 85, 42455, Q.COMMON, V.WOTLK, 85, 95, 105, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Bane of Agony -- 57260
	recipe = AddRecipe(57260, 385, 42456, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Death Coil -- 57261
	recipe = AddRecipe(57261, 275, 42457, Q.COMMON, V.WOTLK, 275, 285, 290, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(46716)
	recipe:AddCustom(15)

	-- Glyph of Fear -- 57262
	recipe = AddRecipe(57262, 125, 42458, Q.COMMON, V.WOTLK, 125, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Felguard -- 57263
	recipe = AddRecipe(57263, 385, 42459, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Felhunter -- 57264
	recipe = AddRecipe(57264, 385, 42460, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Health Funnel -- 57265
	recipe = AddRecipe(57265, 110, 42461, Q.COMMON, V.WOTLK, 110, 115, 120, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Healthstone -- 57266
	recipe = AddRecipe(57266, 95, 42462, Q.COMMON, V.WOTLK, 95, 105, 115, 125)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Howl of Terror -- 57267
	recipe = AddRecipe(57267, 385, 42463, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Immolate -- 57268
	recipe = AddRecipe(57268, 385, 42464, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Imp -- 57269
	recipe = AddRecipe(57269, 140, 42465, Q.COMMON, V.WOTLK, 140, 145, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Soul Swap -- 57270
	recipe = AddRecipe(57270, 215, 42466, Q.COMMON, V.WOTLK, 215, 220, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Shadow Bolt -- 57271
	recipe = AddRecipe(57271, 165, 42467, Q.COMMON, V.WOTLK, 165, 170, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Shadowburn -- 57272
	recipe = AddRecipe(57272, 275, 42468, Q.COMMON, V.WOTLK, 275, 280, 285, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Soulstone -- 57274
	recipe = AddRecipe(57274, 240, 42470, Q.COMMON, V.WOTLK, 240, 245, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Seduction -- 57275
	recipe = AddRecipe(57275, 325, 42471, Q.COMMON, V.WOTLK, 325, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Unstable Affliction -- 57276
	recipe = AddRecipe(57276, 385, 42472, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(15)

	-- Glyph of Voidwalker -- 57277
	recipe = AddRecipe(57277, 190, 42473, Q.COMMON, V.WOTLK, 190, 195, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Hunter's Ink -- 57703
	recipe = AddRecipe(57703, 85, 43115, Q.COMMON, V.WOTLK, 85, 85, 90, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Lion's Ink -- 57704
	recipe = AddRecipe(57704, 100, 43116, Q.COMMON, V.WOTLK, 100, 100, 100, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Dawnstar Ink -- 57706
	recipe = AddRecipe(57706, 125, 43117, Q.COMMON, V.WOTLK, 125, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Jadefire Ink -- 57707
	recipe = AddRecipe(57707, 150, 43118, Q.COMMON, V.WOTLK, 150, 150, 150, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Royal Ink -- 57708
	recipe = AddRecipe(57708, 175, 43119, Q.COMMON, V.WOTLK, 175, 175, 175, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Celestial Ink -- 57709
	recipe = AddRecipe(57709, 200, 43120, Q.COMMON, V.WOTLK, 200, 200, 200, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Fiery Ink -- 57710
	recipe = AddRecipe(57710, 225, 43121, Q.COMMON, V.WOTLK, 225, 225, 225, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Shimmering Ink -- 57711
	recipe = AddRecipe(57711, 250, 43122, Q.COMMON, V.WOTLK, 250, 250, 250, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Ink of the Sky -- 57712
	recipe = AddRecipe(57712, 275, 43123, Q.COMMON, V.WOTLK, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Ethereal Ink -- 57713
	recipe = AddRecipe(57713, 290, 43124, Q.COMMON, V.WOTLK, 290, 295, 300, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Darkflame Ink -- 57714
	recipe = AddRecipe(57714, 325, 43125, Q.COMMON, V.WOTLK, 325, 325, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Ink of the Sea -- 57715
	recipe = AddRecipe(57715, 350, 43126, Q.COMMON, V.WOTLK, 350, 350, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Snowfall Ink -- 57716
	recipe = AddRecipe(57716, 375, 43127, Q.COMMON, V.WOTLK, 375, 375, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Aquatic Form -- 58286
	recipe = AddRecipe(58286, 75, 43316, Q.COMMON, V.WOTLK, 75, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Challenging Roar -- 58287
	recipe = AddRecipe(58287, 150, 43334, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Unburdened Rebirth -- 58288
	recipe = AddRecipe(58288, 95, 43331, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Thorns -- 58289
	recipe = AddRecipe(58289, 75, 43332, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Mark of the Wild -- 58296
	recipe = AddRecipe(58296, 75, 43335, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Aspect of the Pack -- 58297
	recipe = AddRecipe(58297, 195, 43355, Q.COMMON, V.WOTLK, 195, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(14)

	-- Glyph of Scare Beast -- 58298
	recipe = AddRecipe(58298, 75, 43356, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(14)

	-- Glyph of Revive Pet -- 58299
	recipe = AddRecipe(58299, 75, 43338, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(14)

	-- Glyph of Mend Pet -- 58301
	recipe = AddRecipe(58301, 75, 43350, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(14)

	-- Glyph of Feign Death -- 58302
	recipe = AddRecipe(58302, 150, 43351, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HUNTER)
	recipe:AddCustom(14)

	-- Glyph of Arcane Intellect -- 58303
	recipe = AddRecipe(58303, 75, 43339, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of Conjuring -- 58306
	recipe = AddRecipe(58306, 75, 43359, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of the Monkey -- 58307
	recipe = AddRecipe(58307, 120, 43360, Q.COMMON, V.WOTLK, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of Slow Fall -- 58308
	recipe = AddRecipe(58308, 75, 43364, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of the Penguin -- 58310
	recipe = AddRecipe(58310, 75, 43361, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of Blessing of Kings -- 58311
	recipe = AddRecipe(58311, 95, 43365, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(14)

	-- Glyph of Insight -- 58312
	recipe = AddRecipe(58312, 75, 43366, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(14)

	-- Glyph of Lay on Hands -- 58313
	recipe = AddRecipe(58313, 75, 43367, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(14)

	-- Glyph of Blessing of Might -- 58314
	recipe = AddRecipe(58314, 75, 43340, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(14)

	-- Glyph of Truth -- 58315
	recipe = AddRecipe(58315, 95, 43368, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(14)

	-- Glyph of Justice -- 58316
	recipe = AddRecipe(58316, 150, 43369, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(14)

	-- Glyph of Fading -- 58317
	recipe = AddRecipe(58317, 75, 43342, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(14)

	-- Glyph of Fortitude -- 58318
	recipe = AddRecipe(58318, 75, 43371, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(14)

	-- Glyph of Levitate -- 58319
	recipe = AddRecipe(58319, 170, 43370, Q.COMMON, V.WOTLK, 170, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(14)

	-- Glyph of Shackle Undead -- 58320
	recipe = AddRecipe(58320, 95, 43373, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(14)

	-- Glyph of Shadow Protection -- 58321
	recipe = AddRecipe(58321, 150, 43372, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(14)

	-- Glyph of Shadowfiend -- 58322
	recipe = AddRecipe(58322, 345, 43374, Q.COMMON, V.WOTLK, 345, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(14)

	-- Glyph of Blurred Speed -- 58323
	recipe = AddRecipe(58323, 75, 43379, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(14)

	-- Glyph of Distract -- 58324
	recipe = AddRecipe(58324, 120, 43376, Q.COMMON, V.WOTLK, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(14)

	-- Glyph of Pick Lock -- 58325
	recipe = AddRecipe(58325, 95, 43377, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(14)

	-- Glyph of Pick Pocket -- 58326
	recipe = AddRecipe(58326, 75, 43343, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(14)

	-- Glyph of Safe Fall -- 58327
	recipe = AddRecipe(58327, 195, 43378, Q.COMMON, V.WOTLK, 195, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(14)

	-- Glyph of Poisons -- 58328
	recipe = AddRecipe(58328, 120, 43380, Q.COMMON, V.WOTLK, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.ROGUE)
	recipe:AddCustom(14)

	-- Glyph of Astral Recall -- 58329
	recipe = AddRecipe(58329, 150, 43381, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.SHAMAN)
	recipe:AddCustom(14)

	-- Glyph of Renewed Life -- 58330
	recipe = AddRecipe(58330, 150, 43385, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(14)

	-- Glyph of Water Breathing -- 58331
	recipe = AddRecipe(58331, 120, 43344, Q.COMMON, V.WOTLK, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(14)

	-- Glyph of the Arctic Wolf -- 58332
	recipe = AddRecipe(58332, 95, 43386, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(14)

	-- Glyph of Water Walking -- 58333
	recipe = AddRecipe(58333, 150, 43388, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(14)

	-- Glyph of Unending Breath -- 58336
	recipe = AddRecipe(58336, 95, 43389, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(14)

	-- Glyph of Drain Soul -- 58337
	recipe = AddRecipe(58337, 75, 43390, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(14)

	-- Glyph of Curse of Exhaustion -- 58338
	recipe = AddRecipe(58338, 150, 43392, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(14)

	-- Glyph of Enslave Demon -- 58339
	recipe = AddRecipe(58339, 150, 43393, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(14)

	-- Glyph of Eye of Kilrogg -- 58340
	recipe = AddRecipe(58340, 120, 43391, Q.COMMON, V.WOTLK, 120, 130, 135, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(14)

	-- Glyph of Ritual of Souls -- 58341
	recipe = AddRecipe(58341, 345, 43394, Q.COMMON, V.WOTLK, 345, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(14)

	-- Glyph of Battle -- 58342
	recipe = AddRecipe(58342, 75, 43395, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(14)

	-- Glyph of Berserker Rage -- 58343
	recipe = AddRecipe(58343, 75, 43396, Q.COMMON, V.WOTLK, 75, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(14)

	-- Glyph of Long Charge -- 58344
	recipe = AddRecipe(58344, 80, 43397, Q.COMMON, V.WOTLK, 80, 90, 95, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(46716)
	recipe:AddCustom(14)

	-- Glyph of Demoralizing Shout -- 58345
	recipe = AddRecipe(58345, 95, 43398, Q.COMMON, V.WOTLK, 95, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(14)

	-- Glyph of Thunder Clap -- 58346
	recipe = AddRecipe(58346, 80, 43399, Q.COMMON, V.WOTLK, 80, 90, 95, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddTrainer(46716)
	recipe:AddCustom(14)

	-- Glyph of Enduring Victory -- 58347
	recipe = AddRecipe(58347, 320, 43400, Q.COMMON, V.WOTLK, 320, 330, 335, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(14)

	-- Scroll of Agility -- 58472
	recipe = AddRecipe(58472, 15, 3012, Q.COMMON, V.WOTLK, 15, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Agility II -- 58473
	recipe = AddRecipe(58473, 85, 1477, Q.COMMON, V.WOTLK, 85, 85, 90, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Agility III -- 58476
	recipe = AddRecipe(58476, 175, 4425, Q.COMMON, V.WOTLK, 175, 180, 185, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Agility IV -- 58478
	recipe = AddRecipe(58478, 225, 10309, Q.COMMON, V.WOTLK, 225, 230, 235, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Agility V -- 58480
	recipe = AddRecipe(58480, 270, 27498, Q.COMMON, V.WOTLK, 270, 275, 280, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Agility VI -- 58481
	recipe = AddRecipe(58481, 310, 33457, Q.COMMON, V.WOTLK, 310, 320, 325, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Agility VII -- 58482
	recipe = AddRecipe(58482, 370, 43463, Q.COMMON, V.WOTLK, 370, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Agility VIII -- 58483
	recipe = AddRecipe(58483, 420, 43464, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Strength -- 58484
	recipe = AddRecipe(58484, 15, 954, Q.COMMON, V.WOTLK, 15, 35, 40, 45)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Strength II -- 58485
	recipe = AddRecipe(58485, 80, 2289, Q.COMMON, V.WOTLK, 80, 80, 85, 90)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Strength III -- 58486
	recipe = AddRecipe(58486, 170, 4426, Q.COMMON, V.WOTLK, 170, 175, 180, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Strength IV -- 58487
	recipe = AddRecipe(58487, 220, 10310, Q.COMMON, V.WOTLK, 220, 225, 230, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Strength V -- 58488
	recipe = AddRecipe(58488, 265, 27503, Q.COMMON, V.WOTLK, 265, 270, 275, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Strength VI -- 58489
	recipe = AddRecipe(58489, 305, 33462, Q.COMMON, V.WOTLK, 305, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Strength VII -- 58490
	recipe = AddRecipe(58490, 365, 43465, Q.COMMON, V.WOTLK, 365, 370, 375, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Scroll of Strength VIII -- 58491
	recipe = AddRecipe(58491, 415, 43466, Q.COMMON, V.WOTLK, 415, 420, 425, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Mystic Tome -- 58565
	recipe = AddRecipe(58565, 85, 43515, Q.COMMON, V.WOTLK, 85, 95, 100, 105)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Dash -- 59315
	recipe = AddRecipe(59315, 150, 43674, Q.COMMON, V.WOTLK, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Ghost Wolf -- 59326
	recipe = AddRecipe(59326, 100, 43725, Q.COMMON, V.WOTLK, 100, 110, 115, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(46716)
	recipe:AddCustom(14)

	-- Glyph of Rune Tap -- 59338
	recipe = AddRecipe(59338, 310, 43825, Q.COMMON, V.WOTLK, 310, 315, 320, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Blood Boil -- 59339
	recipe = AddRecipe(59339, 320, 43826, Q.COMMON, V.WOTLK, 320, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Death Strike -- 59340
	recipe = AddRecipe(59340, 340, 43827, Q.COMMON, V.WOTLK, 340, 345, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Certificate of Ownership -- 59387
	recipe = AddRecipe(59387, 200, 43850, Q.COMMON, V.WOTLK, 200, 205, 210, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Tome of the Dawn -- 59475
	recipe = AddRecipe(59475, 125, 43654, Q.COMMON, V.WOTLK, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Book of Survival -- 59478
	recipe = AddRecipe(59478, 125, 43655, Q.COMMON, V.WOTLK, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Strange Tarot -- 59480
	recipe = AddRecipe(59480, 125, nil, Q.COMMON, V.WOTLK, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Tome of Kings -- 59484
	recipe = AddRecipe(59484, 175, 43656, Q.COMMON, V.WOTLK, 175, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Royal Guide of Escape Routes -- 59486
	recipe = AddRecipe(59486, 175, 43657, Q.COMMON, V.WOTLK, 175, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Arcane Tarot -- 59487
	recipe = AddRecipe(59487, 175, nil, Q.COMMON, V.WOTLK, 175, 200, 205, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Fire Eater's Guide -- 59489
	recipe = AddRecipe(59489, 225, 43660, Q.COMMON, V.WOTLK, 225, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Book of Stars -- 59490
	recipe = AddRecipe(59490, 225, 43661, Q.COMMON, V.WOTLK, 225, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Shadowy Tarot -- 59491
	recipe = AddRecipe(59491, 225, nil, Q.COMMON, V.WOTLK, 225, 240, 245, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Stormbound Tome -- 59493
	recipe = AddRecipe(59493, 275, 43663, Q.COMMON, V.WOTLK, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Manual of Clouds -- 59494
	recipe = AddRecipe(59494, 275, 43664, Q.COMMON, V.WOTLK, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Hellfire Tome -- 59495
	recipe = AddRecipe(59495, 325, 43666, Q.COMMON, V.WOTLK, 325, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Book of Clever Tricks -- 59496
	recipe = AddRecipe(59496, 325, 43667, Q.COMMON, V.WOTLK, 325, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Iron-bound Tome -- 59497
	recipe = AddRecipe(59497, 400, 38322, Q.COMMON, V.WOTLK, 400, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Faces of Doom -- 59498
	recipe = AddRecipe(59498, 400, 44210, Q.COMMON, V.WOTLK, 400, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Darkmoon Card -- 59502
	recipe = AddRecipe(59502, 275, nil, Q.COMMON, V.WOTLK, 275, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Greater Darkmoon Card -- 59503
	recipe = AddRecipe(59503, 325, nil, Q.COMMON, V.WOTLK, 325, 340, 345, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Darkmoon Card of the North -- 59504
	recipe = AddRecipe(59504, 400, nil, Q.COMMON, V.WOTLK, 400, 425, 450, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Holy Wrath -- 59559
	recipe = AddRecipe(59559, 385, 43867, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Dazing Shield -- 59560
	recipe = AddRecipe(59560, 385, 43868, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Seal of Truth -- 59561
	recipe = AddRecipe(59561, 385, 43869, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DPS, F.PALADIN)
	recipe:AddCustom(15)

	-- Scroll of Recall II -- 60336
	recipe = AddRecipe(60336, 200, 44314, Q.COMMON, V.WOTLK, 200, 215, 220, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Scroll of Recall III -- 60337
	recipe = AddRecipe(60337, 350, 44315, Q.COMMON, V.WOTLK, 350, 350, 350, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Master's Inscription of the Axe -- 61117
	recipe = AddRecipe(61117, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Master's Inscription of the Crag -- 61118
	recipe = AddRecipe(61118, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Master's Inscription of the Pinnacle -- 61119
	recipe = AddRecipe(61119, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Master's Inscription of the Storm -- 61120
	recipe = AddRecipe(61120, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Northrend Inscription Research -- 61177
	recipe = AddRecipe(61177, 385, nil, Q.COMMON, V.WOTLK, 385, 425, 437, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 33679, 46716)

	-- Minor Inscription Research -- 61288
	recipe = AddRecipe(61288, 75, nil, Q.COMMON, V.WOTLK, 75, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Frostfire -- 61677
	recipe = AddRecipe(61677, 385, 44684, Q.COMMON, V.WOTLK, 385, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Focus -- 62162
	recipe = AddRecipe(62162, 375, 44928, Q.COMMON, V.WOTLK, 375, 380, 385, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Rituals of the New Moon -- 64051
	recipe = AddRecipe(64051, 350, 46108, Q.UNCOMMON, V.WOTLK, 350, 375, 387, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.CASTER, F.ONE_HAND)
	recipe:AddMobDrop(26679, 26708, 27546, 27676)

	-- Twilight Tome -- 64053
	recipe = AddRecipe(64053, 350, 45849, Q.COMMON, V.WOTLK, 350, 375, 387, 400)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ONE_HAND)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Raptor Strike -- 64246
	recipe = AddRecipe(64246, 425, 45735, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddCustom(40)

	-- Glyph of Stoneclaw Totem -- 64247
	recipe = AddRecipe(64247, 425, 45778, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(40)

	-- Glyph of Life Tap -- 64248
	recipe = AddRecipe(64248, 425, 45785, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.CASTER, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Scatter Shot -- 64249
	recipe = AddRecipe(64249, 425, 45734, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddCustom(40)

	-- Glyph of Soul Link -- 64250
	recipe = AddRecipe(64250, 425, 45789, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Salvation -- 64251
	recipe = AddRecipe(64251, 425, 45747, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Shield Wall -- 64252
	recipe = AddRecipe(64252, 425, 45797, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(40)

	-- Glyph of Master's Call -- 64253
	recipe = AddRecipe(64253, 425, 45733, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddCustom(40)

	-- Glyph of Holy Shock -- 64254
	recipe = AddRecipe(64254, 425, 45746, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Furious Sundering -- 64255
	recipe = AddRecipe(64255, 425, 45793, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(14)

	-- Glyph of Barkskin -- 64256
	recipe = AddRecipe(64256, 425, 45623, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(40)

	-- Glyph of Ice Barrier -- 64257
	recipe = AddRecipe(64257, 425, 45740, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(40)

	-- Glyph of Monsoon -- 64258
	recipe = AddRecipe(64258, 250, 45622, Q.COMMON, V.WOTLK, 250, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Pain Suppression -- 64259
	recipe = AddRecipe(64259, 255, 45760, Q.COMMON, V.WOTLK, 255, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddTrainer(26916, 26959, 26977, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Mutilate -- 64260
	recipe = AddRecipe(64260, 255, 45768, Q.COMMON, V.WOTLK, 255, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Earth Shield -- 64261
	recipe = AddRecipe(64261, 250, 45775, Q.COMMON, V.WOTLK, 250, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Shamanistic Rage -- 64262
	recipe = AddRecipe(64262, 255, 45776, Q.COMMON, V.WOTLK, 255, 255, 262, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Death Coil -- 64266
	recipe = AddRecipe(64266, 275, 45804, Q.COMMON, V.WOTLK, 275, 280, 287, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DK)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 30706, 30709, 30710, 30711, 30713, 30715, 30716, 30717, 30721, 30722, 33603, 33615, 33679, 46716)

	-- Glyph of Berserk -- 64268
	recipe = AddRecipe(64268, 425, 45601, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(40)

	-- Glyph of Wild Growth -- 64270
	recipe = AddRecipe(64270, 425, 45602, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(40)

	-- Glyph of Chimera Shot -- 64271
	recipe = AddRecipe(64271, 425, 45625, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddCustom(40)

	-- Glyph of Explosive Shot -- 64273
	recipe = AddRecipe(64273, 425, 45731, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddCustom(40)

	-- Glyph of Deep Freeze -- 64274
	recipe = AddRecipe(64274, 425, 45736, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(40)

	-- Glyph of Slow -- 64275
	recipe = AddRecipe(64275, 425, 45737, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(40)

	-- Glyph of Arcane Barrage -- 64276
	recipe = AddRecipe(64276, 425, 45738, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(40)

	-- Glyph of Beacon of Light -- 64277
	recipe = AddRecipe(64277, 425, 45741, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Hammer of the Righteous -- 64278
	recipe = AddRecipe(64278, 425, 45742, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Templar's Verdict -- 64279
	recipe = AddRecipe(64279, 425, 45743, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Dispersion -- 64280
	recipe = AddRecipe(64280, 425, 45753, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddCustom(40)

	-- Glyph of Guardian Spirit -- 64281
	recipe = AddRecipe(64281, 425, 45755, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.PRIEST)
	recipe:AddCustom(40)

	-- Glyph of Penance -- 64282
	recipe = AddRecipe(64282, 425, 45756, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddCustom(40)

	-- Glyph of Divine Accuracy -- 64283
	recipe = AddRecipe(64283, 425, 45758, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddCustom(40)

	-- Glyph of Vendetta -- 64284
	recipe = AddRecipe(64284, 425, 45761, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of Killing Spree -- 64285
	recipe = AddRecipe(64285, 425, 45762, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of Shadow Dance -- 64286
	recipe = AddRecipe(64286, 425, 45764, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of Thunder -- 64287
	recipe = AddRecipe(64287, 425, 45770, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(40)

	-- Glyph of Feral Spirit -- 64288
	recipe = AddRecipe(64288, 425, 45771, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SHAMAN)
	recipe:AddCustom(40)

	-- Glyph of Riptide -- 64289
	recipe = AddRecipe(64289, 425, 45772, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(40)

	-- Glyph of Haunt -- 64291
	recipe = AddRecipe(64291, 425, 45779, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Chaos Bolt -- 64294
	recipe = AddRecipe(64294, 425, 45781, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Bladestorm -- 64295
	recipe = AddRecipe(64295, 425, 45790, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(40)

	-- Glyph of Shockwave -- 64296
	recipe = AddRecipe(64296, 425, 45792, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(40)

	-- Glyph of Dancing Rune Weapon -- 64297
	recipe = AddRecipe(64297, 425, 45799, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(40)

	-- Glyph of Hungering Cold -- 64298
	recipe = AddRecipe(64298, 425, 45800, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(40)

	-- Glyph of Howling Blast -- 64300
	recipe = AddRecipe(64300, 425, 45806, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DK)
	recipe:AddCustom(40)

	-- Glyph of Spell Reflection -- 64302
	recipe = AddRecipe(64302, 425, 45795, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(40)

	-- Glyph of Cloak of Shadows -- 64303
	recipe = AddRecipe(64303, 425, 45769, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of Kill Shot -- 64304
	recipe = AddRecipe(64304, 425, 45732, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.HUNTER)
	recipe:AddCustom(40)

	-- Glyph of Divine Plea -- 64305
	recipe = AddRecipe(64305, 425, 45745, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Savage Roar -- 64307
	recipe = AddRecipe(64307, 425, 45604, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(40)

	-- Glyph of Shield of the Righteous -- 64308
	recipe = AddRecipe(64308, 425, 45744, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PALADIN)
	recipe:AddCustom(40)

	-- Glyph of Spirit Tap -- 64309
	recipe = AddRecipe(64309, 425, 45757, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.PRIEST)
	recipe:AddCustom(40)

	-- Glyph of Tricks of the Trade -- 64310
	recipe = AddRecipe(64310, 425, 45767, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of Shadowflame -- 64311
	recipe = AddRecipe(64311, 425, 45783, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Intimidating Shout -- 64312
	recipe = AddRecipe(64312, 425, 45794, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(40)

	-- Glyph of Starsurge -- 64313
	recipe = AddRecipe(64313, 425, 45603, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddCustom(40)

	-- Glyph of Mirror Image -- 64314
	recipe = AddRecipe(64314, 425, 45739, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.MAGE)
	recipe:AddCustom(40)

	-- Glyph of Fan of Knives -- 64315
	recipe = AddRecipe(64315, 425, 45766, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of Hex -- 64316
	recipe = AddRecipe(64316, 425, 45777, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.SHAMAN)
	recipe:AddCustom(40)

	-- Glyph of Demonic Circle -- 64317
	recipe = AddRecipe(64317, 425, 45782, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Metamorphosis -- 64318
	recipe = AddRecipe(64318, 425, 45780, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARLOCK)
	recipe:AddCustom(40)

	-- Glyph of Ferocious Bite -- 67600
	recipe = AddRecipe(67600, 100, 48720, Q.COMMON, V.WOTLK, 100, 105, 110, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DRUID)
	recipe:AddTrainer(26959, 28702, 30706, 30710, 30722, 33603, 33679, 46716)

	-- Glyph of Command -- 68166
	recipe = AddRecipe(68166, 355, 49084, Q.COMMON, V.WOTLK, 355, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOP, F.WARRIOR)
	recipe:AddCustom(14)

	-- Runescroll of Fortitude -- 69385
	recipe = AddRecipe(69385, 440, 49632, Q.COMMON, V.WOTLK, 440, 440, 442, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26916, 26959, 26977, 26995, 28702, 33603, 46716)

	-- Glyph of Mana Shield -- 71101
	recipe = AddRecipe(71101, 250, 50045, Q.COMMON, V.WOTLK, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CASTER, F.MAGE)
	recipe:AddVendor(28723, 30734, 30735)

	-- Glyph of Lash of Pain -- 71102
	recipe = AddRecipe(71102, 375, 50077, Q.COMMON, V.WOTLK, 375, 380, 382, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.CASTER, F.WARLOCK)
	recipe:AddVendor(28723)

	-- Runescroll of Fortitude II -- 85785
	recipe = AddRecipe(85785, 500, 62251, Q.COMMON, V.CATA, 500, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Blackfallow Ink -- 86004
	recipe = AddRecipe(86004, 425, 61978, Q.COMMON, V.CATA, 425, 440, 445, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Inferno Ink -- 86005
	recipe = AddRecipe(86005, 475, 61981, Q.COMMON, V.CATA, 475, 480, 482, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Swiftsteel Inscription -- 86375
	recipe = AddRecipe(86375, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Lionsmane Inscription -- 86401
	recipe = AddRecipe(86401, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Inscription of the Earth Prince -- 86402
	recipe = AddRecipe(86402, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Felfire Inscription -- 86403
	recipe = AddRecipe(86403, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Mysterious Fortune Card -- 86609
	recipe = AddRecipe(86609, 450, 60838, Q.COMMON, V.CATA, 450, 460, 467, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Darkmoon Card of Destruction -- 86615
	recipe = AddRecipe(86615, 525, 61987, Q.COMMON, V.CATA, 525, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Book of Blood -- 86616
	recipe = AddRecipe(86616, 475, 62231, Q.COMMON, V.CATA, 475, 485, 487, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Lord Rottington's Pressed Wisp Book -- 86640
	recipe = AddRecipe(86640, 475, 62233, Q.COMMON, V.CATA, 475, 485, 487, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Dungeoneering Guide -- 86641
	recipe = AddRecipe(86641, 510, 62234, Q.COMMON, V.CATA, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Divine Companion -- 86642
	recipe = AddRecipe(86642, 510, 62235, Q.COMMON, V.CATA, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Battle Tome -- 86643
	recipe = AddRecipe(86643, 510, 62236, Q.COMMON, V.CATA, 510, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Origami Slime -- 86644
	recipe = AddRecipe(86644, 480, 62239, Q.COMMON, V.CATA, 480, 480, 480, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddCustom(49)

	-- Origami Rock -- 86645
	recipe = AddRecipe(86645, 490, 62238, Q.COMMON, V.CATA, 490, 490, 490, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP)
	recipe:AddCustom(50)

	-- Etched Horn -- 86647
	recipe = AddRecipe(86647, 480, 62240, Q.COMMON, V.CATA, 480, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Manual of the Planes -- 86648
	recipe = AddRecipe(86648, 480, 62241, Q.COMMON, V.CATA, 480, 500, 502, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Runed Dragonscale -- 86649
	recipe = AddRecipe(86649, 505, 62242, Q.COMMON, V.CATA, 505, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Notched Jawbone -- 86650
	recipe = AddRecipe(86650, 515, 62243, Q.COMMON, V.CATA, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Tattooed Eyeball -- 86652
	recipe = AddRecipe(86652, 515, 62244, Q.COMMON, V.CATA, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Silver Inlaid Leaf -- 86653
	recipe = AddRecipe(86653, 515, 62245, Q.COMMON, V.CATA, 515, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Forged Documents -- 86654
	recipe = AddRecipe(86654, 500, 63276, Q.COMMON, V.CATA, 500, 510, 522, 535)
	recipe:AddFilters(F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 46716)

	-- Forged Documents -- 89244
	recipe = AddRecipe(89244, 500, 62056, Q.COMMON, V.CATA, 500, 510, 522, 535)
	recipe:AddFilters(F.ALLIANCE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30713, 30715, 30717, 46716)

	-- Adventurer's Journal -- 89367
	recipe = AddRecipe(89367, 460, 62237, Q.COMMON, V.CATA, 460, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Scroll of Intellect IX -- 89368
	recipe = AddRecipe(89368, 445, 63305, Q.COMMON, V.CATA, 445, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Scroll of Strength IX -- 89369
	recipe = AddRecipe(89369, 465, 63304, Q.COMMON, V.CATA, 465, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Scroll of Agility IX -- 89370
	recipe = AddRecipe(89370, 470, 63303, Q.COMMON, V.CATA, 470, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Scroll of Spirit IX -- 89371
	recipe = AddRecipe(89371, 455, 63307, Q.COMMON, V.CATA, 455, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Scroll of Stamina IX -- 89372
	recipe = AddRecipe(89372, 460, 63306, Q.COMMON, V.CATA, 460, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Scroll of Protection IX -- 89373
	recipe = AddRecipe(89373, 450, 63308, Q.COMMON, V.CATA, 450, 455, 460, 465)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Glyph of Colossus Smash -- 89815
	recipe = AddRecipe(89815, 430, 63481, Q.COMMON, V.CATA, 430, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.WARRIOR)
	recipe:AddVendor(49703, 50248)

	-- Vanishing Powder -- 92026
	recipe = AddRecipe(92026, 75, 64670, Q.COMMON, V.CATA, 75, 90, 100, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Dust of Disappearance -- 92027
	recipe = AddRecipe(92027, 475, 63388, Q.COMMON, V.CATA, 475, 475, 487, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	-- Glyph of Blind -- 92579
	recipe = AddRecipe(92579, 180, 64493, Q.COMMON, V.CATA, 180, 185, 190, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.ROGUE)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Living Bomb -- 94000
	recipe = AddRecipe(94000, 390, 63539, Q.COMMON, V.WOTLK, 390, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.CASTER, F.MAGE)
	recipe:AddCustom(15)

	-- Glyph of Tiger's Fury -- 94401
	recipe = AddRecipe(94401, 120, 67487, Q.COMMON, V.CATA, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Lacerate -- 94402
	recipe = AddRecipe(94402, 330, 67484, Q.COMMON, V.CATA, 330, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Faerie Fire -- 94403
	recipe = AddRecipe(94403, 120, 67485, Q.COMMON, V.CATA, 120, 125, 130, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Feral Charge -- 94404
	recipe = AddRecipe(94404, 150, 67486, Q.COMMON, V.CATA, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Death Wish -- 94405
	recipe = AddRecipe(94405, 150, 67483, Q.COMMON, V.CATA, 150, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.WARRIOR)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Intercept -- 94406
	recipe = AddRecipe(94406, 250, 67482, Q.COMMON, V.CATA, 250, 255, 260, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.WARRIOR)
	recipe:AddTrainer(28702, 30706, 30713, 30717, 46716)

	-- Glyph of Vanish -- 94711
	recipe = AddRecipe(94711, 430, 63420, Q.COMMON, V.CATA, 430, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.ROGUE)
	recipe:AddCustom(40)

	-- Glyph of the Treant -- 95215
	recipe = AddRecipe(95215, 155, 68039, Q.COMMON, V.CATA, 155, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.DRUID)
	recipe:AddCustom(14)

	-- Glyph of Armors -- 95710
	recipe = AddRecipe(95710, 155, 63416, Q.COMMON, V.CATA, 155, 155, 160, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.MAGE)
	recipe:AddCustom(14)

	-- Glyph of the Long Word -- 95825
	recipe = AddRecipe(95825, 390, 66918, Q.COMMON, V.CATA, 390, 390, 397, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.DISC, F.IBOE, F.RBOE, F.PALADIN)
	recipe:AddCustom(15)

	-- Glyph of Dark Succor -- 96284
	recipe = AddRecipe(96284, 275, 68793, Q.COMMON, V.CATA, 275, 280, 287, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE)
	recipe:AddTrainer(28702, 30706, 30711, 30713, 30715, 30717, 46716)

	self.InitInscription = nil
end
