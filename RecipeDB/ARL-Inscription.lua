--[[

************************************************************************

ARL-Inscription.lua

Inscription data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
351 found from data mining.
15 ignored.

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

function addon:InitInscription(RecipeDB)

	local recipecount = 0

	-- Scroll of Stamina -- 45382
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45382, 25, 1180, 1, 45357)
	self:addTradeFlags(RecipeDB, 45382, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect -- 48114
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48114, 25, 955, 1, 45357)
	self:addTradeFlags(RecipeDB, 48114, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit -- 48116
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48116, 25, 1181, 1, 45357)
	self:addTradeFlags(RecipeDB, 48116, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glyph of Entangling Roots -- 48121
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48121, 95, 40924, 1, 45357)
	self:addTradeFlags(RecipeDB, 48121, 3,22,36,41)
	-- No acquire information

	-- Scroll of Recall -- 48248
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48248, 25, 37118, 1, 45357)
	self:addTradeFlags(RecipeDB, 48248, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect II -- 50598
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50598, 65, 2290, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50598, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect III -- 50599
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50599, 160, 4419, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50599, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect IV -- 50600
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50600, 210, 10308, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50600, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect V -- 50601
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50601, 255, 27499, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50601, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect VI -- 50602
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50602, 300, 33458, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50602, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect VII -- 50603
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50603, 355, 37091, 1, 45357)
	self:addTradeFlags(RecipeDB, 50603, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect VIII -- 50604
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50604, 405, 37092, 1, 45357)
	self:addTradeFlags(RecipeDB, 50604, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit II -- 50605
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50605, 65, 1712, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50605, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit III -- 50606
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50606, 155, 4424, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50606, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit IV -- 50607
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50607, 205, 10306, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50607, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit V -- 50608
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50608, 250, 27501, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50608, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit VI -- 50609
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50609, 295, 33460, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50609, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit VII -- 50610
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50610, 350, 37097, 1, 45357)
	self:addTradeFlags(RecipeDB, 50610, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit VIII -- 50611
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50611, 400, 37098, 1, 45357)
	self:addTradeFlags(RecipeDB, 50611, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina II -- 50612
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50612, 65, 1711, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50612, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina III -- 50614
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50614, 150, 4422, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50614, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina IV -- 50616
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50616, 200, 10307, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50616, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina V -- 50617
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50617, 245, 27502, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50617, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina VI -- 50618
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50618, 290, 33461, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50618, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina VII -- 50619
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50619, 345, 37093, 1, 45357)
	self:addTradeFlags(RecipeDB, 50619, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina VIII -- 50620
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50620, 395, 37094, 1, 45357)
	self:addTradeFlags(RecipeDB, 50620, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ivory Ink -- 52738
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52738, 1, 37101, 1, 45357)
	self:addTradeFlags(RecipeDB, 52738, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Armor Vellum -- 52739
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52739, 1, 38682, 1, 45357)
	self:addTradeFlags(RecipeDB, 52739, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Weapon Vellum -- 52840
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52840, 1, 39349, 1, 45357)
	self:addTradeFlags(RecipeDB, 52840, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Moonglow Ink -- 52843
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52843, 15, 39469, 1, 45357)
	self:addTradeFlags(RecipeDB, 52843, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Midnight Ink -- 53462
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53462, 70, 39774, 1, 45357)
	self:addTradeFlags(RecipeDB, 53462, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glyph of Frenzied Regeneration -- 56943
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56943, 345, 40896, 1, 45357)
	self:addTradeFlags(RecipeDB, 56943, 3,22,36,41)
	-- No acquire information

	-- Glyph of Growl -- 56944
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56944, 375, 40899, 1, 45357)
	self:addTradeFlags(RecipeDB, 56944, 3,22,36,41)
	-- No acquire information

	-- Glyph of Healing Touch -- 56945
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56945, 110, 40914, 1, 45357)
	self:addTradeFlags(RecipeDB, 56945, 3,22,36,41)
	-- No acquire information

	-- Glyph of Hurricane -- 56946
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56946, 375, 40920, 1, 45357)
	self:addTradeFlags(RecipeDB, 56946, 3,22,36,41)
	-- No acquire information

	-- Glyph of Innervate -- 56947
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56947, 375, 40908, 1, 45357)
	self:addTradeFlags(RecipeDB, 56947, 3,22,36,41)
	-- No acquire information

	-- Glyph of Insect Swarm -- 56948
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56948, 145, 40919, 1, 45357)
	self:addTradeFlags(RecipeDB, 56948, 3,22,36,41)
	-- No acquire information

	-- Glyph of Lifebloom -- 56949
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56949, 375, 40915, 1, 45357)
	self:addTradeFlags(RecipeDB, 56949, 3,22,36,41)
	-- No acquire information

	-- Glyph of Mangle -- 56950
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56950, 375, 40900, 1, 45357)
	self:addTradeFlags(RecipeDB, 56950, 3,22,36,41)
	-- No acquire information

	-- Glyph of Moonfire -- 56951
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56951, 125, 40923, 1, 45357)
	self:addTradeFlags(RecipeDB, 56951, 3,22,36,41)
	-- No acquire information

	-- Glyph of Rake -- 56952
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56952, 305, 40903, 1, 45357)
	self:addTradeFlags(RecipeDB, 56952, 3,22,36,41)
	-- No acquire information

	-- Glyph of Rebirth -- 56953
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56953, 165, 40909, 1, 45357)
	self:addTradeFlags(RecipeDB, 56953, 3,22,36,41)
	-- No acquire information

	-- Glyph of Regrowth -- 56954
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56954, 375, 40912, 1, 45357)
	self:addTradeFlags(RecipeDB, 56954, 3,22,36,41)
	-- No acquire information

	-- Glyph of Rejuvenation -- 56955
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56955, 70, 40913, 1, 45357)
	self:addTradeFlags(RecipeDB, 56955, 3,22,36,41)
	-- No acquire information

	-- Glyph of Rip -- 56956
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56956, 195, 40902, 1, 45357)
	self:addTradeFlags(RecipeDB, 56956, 3,22,36,41)
	-- No acquire information

	-- Glyph of Shred -- 56957
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56957, 255, 40901, 1, 45357)
	self:addTradeFlags(RecipeDB, 56957, 3,22,36,41)
	-- No acquire information

	-- Glyph of Starfall -- 56958
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56958, 375, 40921, 1, 45357)
	self:addTradeFlags(RecipeDB, 56958, 3,22,36,41)
	-- No acquire information

	-- Glyph of Starfire -- 56959
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56959, 215, 40916, 1, 45357)
	self:addTradeFlags(RecipeDB, 56959, 3,22,36,41)
	-- No acquire information

	-- Glyph of Swiftmend -- 56960
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56960, 375, 40906, 1, 45357)
	self:addTradeFlags(RecipeDB, 56960, 3,22,36,41)
	-- No acquire information

	-- Glyph of Maul -- 56961
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56961, 80, 40897, 1, 45357)
	self:addTradeFlags(RecipeDB, 56961, 3,22,36,41)
	-- No acquire information

	-- Glyph of Wrath -- 56963
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56963, 75, 40922, 1, 45357)
	self:addTradeFlags(RecipeDB, 56963, 3,22,36,41)
	-- No acquire information

	-- Glyph of Arcane Explosion -- 56968
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56968, 95, 42734, 1, 45357)
	self:addTradeFlags(RecipeDB, 56968, 3,24,36,41)
	-- No acquire information

	-- Glyph of Arcane Missiles -- 56971
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56971, 110, 42735, 1, 45357)
	self:addTradeFlags(RecipeDB, 56971, 3,24,36,41)
	-- No acquire information

	-- Glyph of Arcane Power -- 56972
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56972, 330, 42736, 1, 45357)
	self:addTradeFlags(RecipeDB, 56972, 3,24,36,41)
	-- No acquire information

	-- Glyph of Blink -- 56973
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56973, 125, 42737, 1, 45357)
	self:addTradeFlags(RecipeDB, 56973, 3,24,36,41)
	-- No acquire information

	-- Glyph of Evocation -- 56974
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56974, 150, 42738, 1, 45357)
	self:addTradeFlags(RecipeDB, 56974, 3,24,36,41)
	-- No acquire information

	-- Glyph of Fireball -- 56975
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56975, 375, 42739, 1, 45357)
	self:addTradeFlags(RecipeDB, 56975, 3,24,36,41)
	-- No acquire information

	-- Glyph of Frost Nova -- 56976
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56976, 70, 42741, 1, 45357)
	self:addTradeFlags(RecipeDB, 56976, 3,24,36,41)
	-- No acquire information

	-- Glyph of Frostbolt -- 56977
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56977, 375, 42742, 1, 45357)
	self:addTradeFlags(RecipeDB, 56977, 3,24,36,41)
	-- No acquire information

	-- Glyph of Ice Armor -- 56978
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56978, 80, 42743, 1, 45357)
	self:addTradeFlags(RecipeDB, 56978, 3,24,36,41,47,63)
	-- No acquire information

	-- Glyph of Ice Block -- 56979
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56979, 220, 42744, 1, 45357)
	self:addTradeFlags(RecipeDB, 56979, 3,24,36,41)
	-- No acquire information

	-- Glyph of Ice Lance -- 56980
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56980, 370, 42745, 1, 45357)
	self:addTradeFlags(RecipeDB, 56980, 3,24,36,41)
	-- No acquire information

	-- Glyph of Icy Veins -- 56981
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56981, 170, 42746, 1, 45357)
	self:addTradeFlags(RecipeDB, 56981, 3,24,36,41)
	-- No acquire information

	-- Glyph of Improved Scorch -- 56982
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56982, 200, 42747, 1, 45357)
	self:addTradeFlags(RecipeDB, 56982, 3,24,36,41)
	-- No acquire information

	-- Glyph of Invisibility -- 56983
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56983, 375, 42748, 1, 45357)
	self:addTradeFlags(RecipeDB, 56983, 3,24,36,41)
	-- No acquire information

	-- Glyph of Mage Armor -- 56984
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56984, 320, 42749, 1, 45357)
	self:addTradeFlags(RecipeDB, 56984, 3,24,36,41,47,63)
	-- No acquire information

	-- Glyph of Mana Gem -- 56985
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56985, 275, 42750, 1, 45357)
	self:addTradeFlags(RecipeDB, 56985, 3,24,36,41)
	-- No acquire information

	-- Glyph of Molten Armor -- 56986
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56986, 375, 42751, 1, 45357)
	self:addTradeFlags(RecipeDB, 56986, 3,24,36,41,47,63)
	-- No acquire information

	-- Glyph of Polymorph -- 56987
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56987, 375, 42752, 1, 45357)
	self:addTradeFlags(RecipeDB, 56987, 3,24,36,41)
	-- No acquire information

	-- Glyph of Remove Curse -- 56988
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56988, 375, 42753, 1, 45357)
	self:addTradeFlags(RecipeDB, 56988, 3,24,36,41)
	-- No acquire information

	-- Glyph of Water Elemental -- 56989
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56989, 375, 42754, 1, 45357)
	self:addTradeFlags(RecipeDB, 56989, 3,24,36,41)
	-- No acquire information

	-- Glyph of Aimed Shot -- 56994
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56994, 170, 42897, 1, 45357)
	self:addTradeFlags(RecipeDB, 56994, 3,23,36,41)
	-- No acquire information

	-- Glyph of Arcane Shot -- 56995
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56995, 95, 42898, 1, 45357)
	self:addTradeFlags(RecipeDB, 56995, 3,23,36,41)
	-- No acquire information

	-- Glyph of Aspect of the Beast -- 56996
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56996, 375, 42899, 1, 45357)
	self:addTradeFlags(RecipeDB, 56996, 3,23,36,41)
	-- No acquire information

	-- Glyph of Aspect of the Monkey -- 56997
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56997, 110, 42900, 1, 45357)
	self:addTradeFlags(RecipeDB, 56997, 3,23,36,41)
	-- No acquire information

	-- Glyph of Aspect of the Viper -- 56998
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56998, 375, 42901, 1, 45357)
	self:addTradeFlags(RecipeDB, 56998, 3,23,36,41)
	-- No acquire information

	-- Glyph of Bestial Wrath -- 56999
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56999, 375, 42902, 1, 45357)
	self:addTradeFlags(RecipeDB, 56999, 3,23,36,41)
	-- No acquire information

	-- Glyph of Deterrence -- 57000
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57000, 195, 42903, 1, 45357)
	self:addTradeFlags(RecipeDB, 57000, 3,23,36,41)
	-- No acquire information

	-- Glyph of Disengage -- 57001
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57001, 220, 42904, 1, 45357)
	self:addTradeFlags(RecipeDB, 57001, 3,23,36,41)
	-- No acquire information

	-- Glyph of Freezing Trap -- 57002
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57002, 255, 42905, 1, 45357)
	self:addTradeFlags(RecipeDB, 57002, 3,23,36,41)
	-- No acquire information

	-- Glyph of Frost Trap -- 57003
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57003, 345, 42906, 1, 45357)
	self:addTradeFlags(RecipeDB, 57003, 3,23,36,41)
	-- No acquire information

	-- Glyph of Hunter's Mark -- 57004
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57004, 70, 42907, 1, 45357)
	self:addTradeFlags(RecipeDB, 57004, 3,23,36,41)
	-- No acquire information

	-- Glyph of Immolation Trap -- 57005
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57005, 125, 42908, 1, 45357)
	self:addTradeFlags(RecipeDB, 57005, 3,23,36,41)
	-- No acquire information

	-- Glyph of Improved Aspect of the Hawk -- 57006
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57006, 370, 42909, 1, 45357)
	self:addTradeFlags(RecipeDB, 57006, 3,23,36,41)
	-- No acquire information

	-- Glyph of Multi-Shot -- 57007
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57007, 145, 42910, 1, 45357)
	self:addTradeFlags(RecipeDB, 57007, 3,23,36,41)
	-- No acquire information

	-- Glyph of Rapid Fire -- 57008
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57008, 310, 42911, 1, 45357)
	self:addTradeFlags(RecipeDB, 57008, 3,23,36,41)
	-- No acquire information

	-- Glyph of Serpent Sting -- 57009
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57009, 80, 42912, 1, 45357)
	self:addTradeFlags(RecipeDB, 57009, 3,23,36,41)
	-- No acquire information

	-- Glyph of Snake Trap -- 57010
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57010, 375, 42913, 1, 45357)
	self:addTradeFlags(RecipeDB, 57010, 3,23,36,41)
	-- No acquire information

	-- Glyph of Steady Shot -- 57011
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57011, 375, 42914, 1, 45357)
	self:addTradeFlags(RecipeDB, 57011, 3,23,36,41)
	-- No acquire information

	-- Glyph of Trueshot Aura -- 57012
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57012, 375, 42915, 1, 45357)
	self:addTradeFlags(RecipeDB, 57012, 3,23,36,41)
	-- No acquire information

	-- Glyph of Volley -- 57013
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57013, 375, 42916, 1, 45357)
	self:addTradeFlags(RecipeDB, 57013, 3,23,36,41)
	-- No acquire information

	-- Glyph of Wyvern Sting -- 57014
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57014, 375, 42917, 1, 45357)
	self:addTradeFlags(RecipeDB, 57014, 3,23,36,41)
	-- No acquire information

	-- Glyph of Avenger's Shield -- 57019
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57019, 375, 41101, 1, 45357)
	self:addTradeFlags(RecipeDB, 57019, 3,25,36,41)
	-- No acquire information

	-- Glyph of Cleansing -- 57020
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57020, 175, 41104, 1, 45357)
	self:addTradeFlags(RecipeDB, 57020, 3,25,36,41)
	-- No acquire information

	-- Glyph of Avenging Wrath -- 57021
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57021, 375, 41107, 1, 45357)
	self:addTradeFlags(RecipeDB, 57021, 3,25,36,41)
	-- No acquire information

	-- Glyph of Spiritual Attunement -- 57022
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57022, 70, 41096, 1, 45357)
	self:addTradeFlags(RecipeDB, 57022, 3,25,36,41)
	-- No acquire information

	-- Glyph of Consecration -- 57023
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57023, 200, 41099, 1, 45357)
	self:addTradeFlags(RecipeDB, 57023, 3,25,36,41)
	-- No acquire information

	-- Glyph of Crusader Strike -- 57024
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57024, 225, 41098, 1, 45357)
	self:addTradeFlags(RecipeDB, 57024, 3,25,36,41)
	-- No acquire information

	-- Glyph of Exorcism -- 57025
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57025, 260, 41103, 1, 45357)
	self:addTradeFlags(RecipeDB, 57025, 3,25,36,41)
	-- No acquire information

	-- Glyph of Flash of Light -- 57026
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57026, 295, 41105, 1, 45357)
	self:addTradeFlags(RecipeDB, 57026, 3,25,36,41)
	-- No acquire information

	-- Glyph of Hammer of Justice -- 57027
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57027, 80, 41095, 1, 45357)
	self:addTradeFlags(RecipeDB, 57027, 3,25,36,41)
	-- No acquire information

	-- Glyph of Hammer of Wrath -- 57028
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57028, 375, 41097, 1, 45357)
	self:addTradeFlags(RecipeDB, 57028, 3,25,36,41)
	-- No acquire information

	-- Glyph of Holy Light -- 57029
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57029, 100, 41106, 1, 45357)
	self:addTradeFlags(RecipeDB, 57029, 3,25,36,41)
	-- No acquire information

	-- Glyph of Judgement -- 57030
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57030, 115, 41092, 1, 45357)
	self:addTradeFlags(RecipeDB, 57030, 3,25,36,41)
	-- No acquire information

	-- Glyph of Divinity -- 57031
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57031, 130, 41108, 1, 45357)
	self:addTradeFlags(RecipeDB, 57031, 3,25,36,41)
	-- No acquire information

	-- Glyph of Righteous Defense -- 57032
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57032, 150, 41100, 1, 45357)
	self:addTradeFlags(RecipeDB, 57032, 3,25,36,41)
	-- No acquire information

	-- Glyph of Seal of Command -- 57033
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57033, 330, 41094, 1, 45357)
	self:addTradeFlags(RecipeDB, 57033, 3,25,36,41)
	-- No acquire information

	-- Glyph of Seal of Light -- 57034
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57034, 375, 41110, 1, 45357)
	self:addTradeFlags(RecipeDB, 57034, 3,25,36,41)
	-- No acquire information

	-- Glyph of Seal of Wisdom -- 57035
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57035, 375, 41109, 1, 45357)
	self:addTradeFlags(RecipeDB, 57035, 3,25,36,41)
	-- No acquire information

	-- Glyph of Turn Evil -- 57036
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57036, 370, 41102, 1, 45357)
	self:addTradeFlags(RecipeDB, 57036, 3,25,36,41)
	-- No acquire information

	-- Glyph of Adrenaline Rush -- 57112
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57112, 375, 42954, 1, 45357)
	self:addTradeFlags(RecipeDB, 57112, 3,28,36,41)
	-- No acquire information

	-- Glyph of Ambush -- 57113
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57113, 335, 42955, 1, 45357)
	self:addTradeFlags(RecipeDB, 57113, 3,28,36,41)
	-- No acquire information

	-- Glyph of Backstab -- 57114
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57114, 70, 42956, 1, 45357)
	self:addTradeFlags(RecipeDB, 57114, 3,28,36,41)
	-- No acquire information

	-- Glyph of Blade Flurry -- 57115
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57115, 375, 42957, 1, 45357)
	self:addTradeFlags(RecipeDB, 57115, 3,28,36,41)
	-- No acquire information

	-- Glyph of Crippling Poison -- 57116
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57116, 375, 42958, 1, 45357)
	self:addTradeFlags(RecipeDB, 57116, 3,28,36,41)
	-- No acquire information

	-- Glyph of Deadly Throw -- 57117
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57117, 375, 42959, 1, 45357)
	self:addTradeFlags(RecipeDB, 57117, 3,28,36,41)
	-- No acquire information

	-- Glyph of Evasion -- 57119
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57119, 85, 42960, 1, 45357)
	self:addTradeFlags(RecipeDB, 57119, 3,28,36,41)
	-- No acquire information

	-- Glyph of Eviscerate -- 57120
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57120, 100, 42961, 1, 45357)
	self:addTradeFlags(RecipeDB, 57120, 3,28,36,41)
	-- No acquire information

	-- Glyph of Expose Armor -- 57121
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57121, 115, 42962, 1, 45357)
	self:addTradeFlags(RecipeDB, 57121, 3,28,36,41,47,63)
	-- No acquire information

	-- Glyph of Feint -- 57122
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57122, 300, 42963, 1, 45357)
	self:addTradeFlags(RecipeDB, 57122, 3,28,36,41)
	-- No acquire information

	-- Glyph of Garrote -- 57123
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57123, 130, 42964, 1, 45357)
	self:addTradeFlags(RecipeDB, 57123, 3,28,36,41)
	-- No acquire information

	-- Glyph of Ghostly Strike -- 57124
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57124, 375, 42965, 1, 45357)
	self:addTradeFlags(RecipeDB, 57124, 3,28,36,41)
	-- No acquire information

	-- Glyph of Gouge -- 57125
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57125, 155, 42966, 1, 45357)
	self:addTradeFlags(RecipeDB, 57125, 3,28,36,41)
	-- No acquire information

	-- Glyph of Hemorrhage -- 57126
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57126, 375, 42967, 1, 45357)
	self:addTradeFlags(RecipeDB, 57126, 3,28,36,41)
	-- No acquire information

	-- Glyph of Preparation -- 57127
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57127, 375, 42968, 1, 45357)
	self:addTradeFlags(RecipeDB, 57127, 3,28,36,41)
	-- No acquire information

	-- Glyph of Rupture -- 57128
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57128, 375, 42969, 1, 45357)
	self:addTradeFlags(RecipeDB, 57128, 3,28,36,41)
	-- No acquire information

	-- Glyph of Sap -- 57129
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57129, 180, 42970, 1, 45357)
	self:addTradeFlags(RecipeDB, 57129, 3,28,36,41)
	-- No acquire information

	-- Glyph of Vigor -- 57130
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57130, 375, 42971, 1, 45357)
	self:addTradeFlags(RecipeDB, 57130, 3,28,36,41)
	-- No acquire information

	-- Glyph of Sinister Strike -- 57131
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57131, 205, 42972, 1, 45357)
	self:addTradeFlags(RecipeDB, 57131, 3,28,36,41)
	-- No acquire information

	-- Glyph of Slice and Dice -- 57132
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57132, 230, 42973, 1, 45357)
	self:addTradeFlags(RecipeDB, 57132, 3,28,36,41)
	-- No acquire information

	-- Glyph of Sprint -- 57133
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57133, 280, 42974, 1, 45357)
	self:addTradeFlags(RecipeDB, 57133, 3,28,36,41)
	-- No acquire information

	-- Glyph of Barbaric Insults -- 57151
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57151, 215, 43420, 1, 45357)
	self:addTradeFlags(RecipeDB, 57151, 3,30,36,41)
	-- No acquire information

	-- Glyph of Blocking -- 57152
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57152, 375, 43425, 1, 45357)
	self:addTradeFlags(RecipeDB, 57152, 3,30,36,41)
	-- No acquire information

	-- Glyph of Bloodthirst -- 57153
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57153, 375, 43412, 1, 45357)
	self:addTradeFlags(RecipeDB, 57153, 3,30,36,41)
	-- No acquire information

	-- Glyph of Cleaving -- 57154
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57154, 235, 43414, 1, 45357)
	self:addTradeFlags(RecipeDB, 57154, 3,30,36,41)
	-- No acquire information

	-- Glyph of Devastate -- 57155
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57155, 375, 43415, 1, 45357)
	self:addTradeFlags(RecipeDB, 57155, 3,30,36,41,47,63)
	-- No acquire information

	-- Glyph of Execution -- 57156
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57156, 280, 43416, 1, 45357)
	self:addTradeFlags(RecipeDB, 57156, 3,30,36,41)
	-- No acquire information

	-- Glyph of Hamstring -- 57157
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57157, 120, 43417, 1, 45357)
	self:addTradeFlags(RecipeDB, 57157, 3,30,36,41)
	-- No acquire information

	-- Glyph of Heroic Strike -- 57158
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57158, 85, 43418, 1, 45357)
	self:addTradeFlags(RecipeDB, 57158, 3,30,36,41)
	-- No acquire information

	-- Glyph of Intervene -- 57159
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57159, 375, 43419, 1, 45357)
	self:addTradeFlags(RecipeDB, 57159, 3,30,36,41)
	-- No acquire information

	-- Glyph of Mortal Strike -- 57160
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57160, 375, 43421, 1, 45357)
	self:addTradeFlags(RecipeDB, 57160, 3,30,36,41)
	-- No acquire information

	-- Glyph of Overpower -- 57161
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57161, 165, 43422, 1, 45357)
	self:addTradeFlags(RecipeDB, 57161, 3,30,36,41)
	-- No acquire information

	-- Glyph of Rapid Charge -- 57162
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57162, 75, 43413, 1, 45357)
	self:addTradeFlags(RecipeDB, 57162, 3,30,36,41)
	-- No acquire information

	-- Glyph of Rending -- 57163
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57163, 105, 43423, 1, 45357)
	self:addTradeFlags(RecipeDB, 57163, 3,30,36,41)
	-- No acquire information

	-- Glyph of Resonating Power -- 57164
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57164, 375, 43430, 1, 45357)
	self:addTradeFlags(RecipeDB, 57164, 3,30,36,41)
	-- No acquire information

	-- Glyph of Revenge -- 57165
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57165, 185, 43424, 1, 45357)
	self:addTradeFlags(RecipeDB, 57165, 3,30,36,41)
	-- No acquire information

	-- Glyph of Last Stand -- 57166
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57166, 375, 43426, 1, 45357)
	self:addTradeFlags(RecipeDB, 57166, 3,30,36,41)
	-- No acquire information

	-- Glyph of Sunder Armor -- 57167
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57167, 135, 43427, 1, 45357)
	self:addTradeFlags(RecipeDB, 57167, 3,30,36,41,47,63)
	-- No acquire information

	-- Glyph of Sweeping Strikes -- 57168
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57168, 315, 43428, 1, 45357)
	self:addTradeFlags(RecipeDB, 57168, 3,30,36,41)
	-- No acquire information

	-- Glyph of Taunt -- 57169
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57169, 375, 43429, 1, 45357)
	self:addTradeFlags(RecipeDB, 57169, 3,30,36,41)
	-- No acquire information

	-- Glyph of Victory Rush -- 57170
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57170, 375, 43431, 1, 45357)
	self:addTradeFlags(RecipeDB, 57170, 3,30,36,41)
	-- No acquire information

	-- Glyph of Whirlwind -- 57172
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57172, 340, 43432, 1, 45357)
	self:addTradeFlags(RecipeDB, 57172, 3,30,36,41)
	-- No acquire information

	-- Glyph of Circle of Healing -- 57181
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57181, 375, 42396, 1, 45357)
	self:addTradeFlags(RecipeDB, 57181, 3,26,36,41)
	-- No acquire information

	-- Glyph of Dispel Magic -- 57183
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57183, 225, 42397, 1, 45357)
	self:addTradeFlags(RecipeDB, 57183, 3,26,36,41)
	-- No acquire information

	-- Glyph of Fade -- 57184
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57184, 100, 42398, 1, 45357)
	self:addTradeFlags(RecipeDB, 57184, 3,26,36,41)
	-- No acquire information

	-- Glyph of Fear Ward -- 57185
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57185, 265, 42399, 1, 45357)
	self:addTradeFlags(RecipeDB, 57185, 3,26,36,41)
	-- No acquire information

	-- Glyph of Flash Heal -- 57186
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57186, 115, 42400, 1, 45357)
	self:addTradeFlags(RecipeDB, 57186, 3,26,36,41)
	-- No acquire information

	-- Glyph of Holy Nova -- 57187
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57187, 310, 42401, 1, 45357)
	self:addTradeFlags(RecipeDB, 57187, 3,26,36,41)
	-- No acquire information

	-- Glyph of Inner Fire -- 57188
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57188, 130, 42402, 1, 45357)
	self:addTradeFlags(RecipeDB, 57188, 3,26,36,41)
	-- No acquire information

	-- Glyph of Lightwell -- 57189
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57189, 375, 42403, 1, 45357)
	self:addTradeFlags(RecipeDB, 57189, 3,26,36,41)
	-- No acquire information

	-- Glyph of Mass Dispel -- 57190
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57190, 375, 42404, 1, 45357)
	self:addTradeFlags(RecipeDB, 57190, 3,26,36,41)
	-- No acquire information

	-- Glyph of Mind Control -- 57191
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57191, 375, 42405, 1, 45357)
	self:addTradeFlags(RecipeDB, 57191, 3,26,36,41)
	-- No acquire information

	-- Glyph of Mind Flay -- 57192
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57192, 345, 42406, 1, 45357)
	self:addTradeFlags(RecipeDB, 57192, 3,26,36,41)
	-- No acquire information

	-- Glyph of Mind Soothe -- 57193
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57193, 375, 42407, 1, 45357)
	self:addTradeFlags(RecipeDB, 57193, 3,26,36,41)
	-- No acquire information

	-- Glyph of Power Word: Shield -- 57194
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57194, 70, 42408, 1, 45357)
	self:addTradeFlags(RecipeDB, 57194, 3,26,36,41)
	-- No acquire information

	-- Glyph of Prayer of Healing -- 57195
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57195, 375, 42409, 1, 45357)
	self:addTradeFlags(RecipeDB, 57195, 3,26,36,41)
	-- No acquire information

	-- Glyph of Psychic Scream -- 57196
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57196, 85, 42410, 1, 45357)
	self:addTradeFlags(RecipeDB, 57196, 3,26,36,41)
	-- No acquire information

	-- Glyph of Renew -- 57197
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57197, 155, 42411, 1, 45357)
	self:addTradeFlags(RecipeDB, 57197, 3,26,36,41)
	-- No acquire information

	-- Glyph of Scourge Imprisonment -- 57198
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57198, 370, 42412, 1, 45357)
	self:addTradeFlags(RecipeDB, 57198, 3,26,36,41)
	-- No acquire information

	-- Glyph of Shadow Word: Death -- 57199
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57199, 375, 42414, 1, 45357)
	self:addTradeFlags(RecipeDB, 57199, 3,26,36,41)
	-- No acquire information

	-- Glyph of Shadow Word: Pain -- 57200
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57200, 175, 42415, 1, 45357)
	self:addTradeFlags(RecipeDB, 57200, 3,26,36,41)
	-- No acquire information

	-- Glyph of Smite -- 57201
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57201, 205, 42416, 1, 45357)
	self:addTradeFlags(RecipeDB, 57201, 3,26,36,41)
	-- No acquire information

	-- Glyph of Spirit of Redemption -- 57202
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57202, 375, 42417, 1, 45357)
	self:addTradeFlags(RecipeDB, 57202, 3,26,36,41)
	-- No acquire information

	-- Glyph of Anti-Magic Shell -- 57207
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57207, 375, 43533, 1, 45357)
	self:addTradeFlags(RecipeDB, 57207, 3,36,41)
	-- No acquire information

	-- Glyph of Blood Boil -- 57208
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57208, 375, 43534, 1, 45357)
	self:addTradeFlags(RecipeDB, 57208, 3,36,41)
	-- No acquire information

	-- Glyph of Blood Tap -- 57209
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57209, 320, 43535, 1, 45357)
	self:addTradeFlags(RecipeDB, 57209, 3,36,41)
	-- No acquire information

	-- Glyph of Bone Shield -- 57210
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57210, 260, 43536, 1, 45357)
	self:addTradeFlags(RecipeDB, 57210, 3,36,41)
	-- No acquire information

	-- Glyph of Chains of Ice -- 57211
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57211, 375, 43537, 1, 45357)
	self:addTradeFlags(RecipeDB, 57211, 3,36,41)
	-- No acquire information

	-- Glyph of Dark Command -- 57212
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57212, 375, 43538, 1, 45357)
	self:addTradeFlags(RecipeDB, 57212, 3,36,41)
	-- No acquire information

	-- Glyph of Death Grip -- 57213
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57213, 280, 43541, 1, 45357)
	self:addTradeFlags(RecipeDB, 57213, 3,36,41)
	-- No acquire information

	-- Glyph of Death and Decay -- 57214
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57214, 375, 43542, 1, 45357)
	self:addTradeFlags(RecipeDB, 57214, 3,36,41)
	-- No acquire information

	-- Glyph of Death's Embrace -- 57215
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57215, 295, 43539, 1, 45357)
	self:addTradeFlags(RecipeDB, 57215, 3,36,41)
	-- No acquire information

	-- Glyph of Frost Strike -- 57216
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57216, 265, 43543, 1, 45357)
	self:addTradeFlags(RecipeDB, 57216, 3,36,41)
	-- No acquire information

	-- Glyph of Horn of Winter -- 57217
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57217, 320, 43544, 1, 45357)
	self:addTradeFlags(RecipeDB, 57217, 3,36,41)
	-- No acquire information

	-- Glyph of Icebound Fortitude -- 57218
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57218, 375, 43545, 1, 45357)
	self:addTradeFlags(RecipeDB, 57218, 3,36,41)
	-- No acquire information

	-- Glyph of Icy Touch -- 57219
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57219, 275, 43546, 1, 45357)
	self:addTradeFlags(RecipeDB, 57219, 3,36,41)
	-- No acquire information

	-- Glyph of Obliterate -- 57220
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57220, 375, 43547, 1, 45357)
	self:addTradeFlags(RecipeDB, 57220, 3,36,41)
	-- No acquire information

	-- Glyph of Plague Strike -- 57221
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57221, 295, 43548, 1, 45357)
	self:addTradeFlags(RecipeDB, 57221, 3,36,41)
	-- No acquire information

	-- Glyph of the Ghoul -- 57222
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57222, 345, 43549, 1, 45357)
	self:addTradeFlags(RecipeDB, 57222, 3,36,41)
	-- No acquire information

	-- Glyph of Rune Strike -- 57223
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57223, 375, 43550, 1, 45357)
	self:addTradeFlags(RecipeDB, 57223, 3,36,41)
	-- No acquire information

	-- Glyph of Scourge Strike -- 57224
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57224, 325, 43551, 1, 45357)
	self:addTradeFlags(RecipeDB, 57224, 3,36,41)
	-- No acquire information

	-- Glyph of Strangulate -- 57225
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57225, 370, 43552, 1, 45357)
	self:addTradeFlags(RecipeDB, 57225, 3,36,41)
	-- No acquire information

	-- Glyph of Unbreakable Armor -- 57226
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57226, 300, 43553, 1, 45357)
	self:addTradeFlags(RecipeDB, 57226, 3,36,41,47,63)
	-- No acquire information

	-- Glyph of Vampiric Blood -- 57227
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57227, 340, 43554, 1, 45357)
	self:addTradeFlags(RecipeDB, 57227, 3,36,41)
	-- No acquire information

	-- Glyph of Raise Dead -- 57228
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57228, 295, 43673, 1, 45357)
	self:addTradeFlags(RecipeDB, 57228, 3,36,41)
	-- No acquire information

	-- Glyph of Corpse Explosion -- 57229
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57229, 295, 43671, 1, 45357)
	self:addTradeFlags(RecipeDB, 57229, 3,36,41)
	-- No acquire information

	-- Glyph of Pestilence -- 57230
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57230, 295, 43672, 1, 45357)
	self:addTradeFlags(RecipeDB, 57230, 3,36,41)
	-- No acquire information

	-- Death Knight Glyph 25 -- 57231
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57231, 1, 42897, 1, 45357)
	self:addTradeFlags(RecipeDB, 57231, 3,23,36,41)
	-- No acquire information

	-- Glyph of Chain Heal -- 57232
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57232, 375, 41517, 1, 45357)
	self:addTradeFlags(RecipeDB, 57232, 3,27,36,41)
	-- No acquire information

	-- Glyph of Chain Lightning -- 57233
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57233, 375, 41518, 1, 45357)
	self:addTradeFlags(RecipeDB, 57233, 3,27,36,41)
	-- No acquire information

	-- Glyph of Lava -- 57234
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57234, 380, 41524, 1, 45357)
	self:addTradeFlags(RecipeDB, 57234, 3,27,36,41)
	-- No acquire information

	-- Glyph of Earth Shock -- 57235
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57235, 375, 41526, 1, 45357)
	self:addTradeFlags(RecipeDB, 57235, 3,27,36,41)
	-- No acquire information

	-- Glyph of Earthliving Weapon -- 57236
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57236, 295, 41527, 1, 45357)
	self:addTradeFlags(RecipeDB, 57236, 3,27,36,41)
	-- No acquire information

	-- Glyph of Fire Elemental Totem -- 57237
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57237, 375, 41529, 1, 45357)
	self:addTradeFlags(RecipeDB, 57237, 3,27,36,41,47,63)
	-- No acquire information

	-- Glyph of Fire Nova Totem -- 57238
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57238, 105, 41530, 1, 45357)
	self:addTradeFlags(RecipeDB, 57238, 3,27,36,41,47,63)
	-- No acquire information

	-- Glyph of Flame Shock -- 57239
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57239, 75, 41531, 1, 45357)
	self:addTradeFlags(RecipeDB, 57239, 3,27,36,41)
	-- No acquire information

	-- Glyph of Flametongue Weapon -- 57240
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57240, 120, 41532, 1, 45357)
	self:addTradeFlags(RecipeDB, 57240, 3,27,36,41)
	-- No acquire information

	-- Glyph of Frost Shock -- 57241
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57241, 180, 41547, 1, 45357)
	self:addTradeFlags(RecipeDB, 57241, 3,27,36,41)
	-- No acquire information

	-- Glyph of Healing Stream Totem -- 57242
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57242, 210, 41533, 1, 45357)
	self:addTradeFlags(RecipeDB, 57242, 3,27,36,41,47,63)
	-- No acquire information

	-- Glyph of Healing Wave -- 57243
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57243, 375, 41534, 1, 45357)
	self:addTradeFlags(RecipeDB, 57243, 3,27,36,41)
	-- No acquire information

	-- Glyph of Lesser Healing Wave -- 57244
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57244, 230, 41535, 1, 45357)
	self:addTradeFlags(RecipeDB, 57244, 3,27,36,41)
	-- No acquire information

	-- Glyph of Lightning Bolt -- 57245
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57245, 135, 41536, 1, 45357)
	self:addTradeFlags(RecipeDB, 57245, 3,27,36,41)
	-- No acquire information

	-- Glyph of Lightning Shield -- 57246
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57246, 85, 41537, 1, 45357)
	self:addTradeFlags(RecipeDB, 57246, 3,27,36,41)
	-- No acquire information

	-- Glyph of Mana Tide Totem -- 57247
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57247, 375, 41538, 1, 45357)
	self:addTradeFlags(RecipeDB, 57247, 3,27,36,41,47,63)
	-- No acquire information

	-- Glyph of Stormstrike -- 57248
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57248, 370, 41539, 1, 45357)
	self:addTradeFlags(RecipeDB, 57248, 3,27,36,41)
	-- No acquire information

	-- Glyph of Lava Lash -- 57249
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57249, 160, 41540, 1, 45357)
	self:addTradeFlags(RecipeDB, 57249, 3,27,36,41)
	-- No acquire information

	-- Glyph of Elemental Mastery -- 57250
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57250, 375, 41552, 1, 45357)
	self:addTradeFlags(RecipeDB, 57250, 3,27,36,41)
	-- No acquire information

	-- Glyph of Water Mastery -- 57251
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57251, 270, 41541, 1, 45357)
	self:addTradeFlags(RecipeDB, 57251, 3,27,36,41)
	-- No acquire information

	-- Glyph of Windfury Weapon -- 57252
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57252, 325, 41542, 1, 45357)
	self:addTradeFlags(RecipeDB, 57252, 3,27,36,41)
	-- No acquire information

	-- Glyph of Banish -- 57257
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57257, 345, 42453, 1, 45357)
	self:addTradeFlags(RecipeDB, 57257, 3,29,36,41)
	-- No acquire information

	-- Glyph of Conflagrate -- 57258
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57258, 375, 42454, 1, 45357)
	self:addTradeFlags(RecipeDB, 57258, 3,29,36,41)
	-- No acquire information

	-- Glyph of Corruption -- 57259
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57259, 75, 42455, 1, 45357)
	self:addTradeFlags(RecipeDB, 57259, 3,29,36,41)
	-- No acquire information

	-- Glyph of Curse of Agony -- 57260
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57260, 375, 42456, 1, 45357)
	self:addTradeFlags(RecipeDB, 57260, 3,29,36,41)
	-- No acquire information

	-- Glyph of Death Coil -- 57261
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57261, 375, 42457, 1, 45357)
	self:addTradeFlags(RecipeDB, 57261, 3,29,36,41)
	-- No acquire information

	-- Glyph of Fear -- 57262
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57262, 120, 42458, 1, 45357)
	self:addTradeFlags(RecipeDB, 57262, 3,29,36,41)
	-- No acquire information

	-- Glyph of Felguard -- 57263
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57263, 375, 42459, 1, 45357)
	self:addTradeFlags(RecipeDB, 57263, 3,29,36,41)
	-- No acquire information

	-- Glyph of Felhunter -- 57264
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57264, 375, 42460, 1, 45357)
	self:addTradeFlags(RecipeDB, 57264, 3,29,36,41)
	-- No acquire information

	-- Glyph of Health Funnel -- 57265
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57265, 105, 42461, 1, 45357)
	self:addTradeFlags(RecipeDB, 57265, 3,29,36,41)
	-- No acquire information

	-- Glyph of Healthstone -- 57266
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57266, 85, 42462, 1, 45357)
	self:addTradeFlags(RecipeDB, 57266, 3,29,36,41)
	-- No acquire information

	-- Glyph of Howl of Terror -- 57267
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57267, 375, 42463, 1, 45357)
	self:addTradeFlags(RecipeDB, 57267, 3,29,36,41)
	-- No acquire information

	-- Glyph of Immolate -- 57268
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57268, 375, 42464, 1, 45357)
	self:addTradeFlags(RecipeDB, 57268, 3,29,36,41)
	-- No acquire information

	-- Glyph of Imp -- 57269
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57269, 135, 42465, 1, 45357)
	self:addTradeFlags(RecipeDB, 57269, 3,29,36,41)
	-- No acquire information

	-- Glyph of Searing Pain -- 57270
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57270, 210, 42466, 1, 45357)
	self:addTradeFlags(RecipeDB, 57270, 3,29,36,41)
	-- No acquire information

	-- Glyph of Shadow Bolt -- 57271
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57271, 160, 42467, 1, 45357)
	self:addTradeFlags(RecipeDB, 57271, 3,29,36,41)
	-- No acquire information

	-- Glyph of Shadowburn -- 57272
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57272, 270, 42468, 1, 45357)
	self:addTradeFlags(RecipeDB, 57272, 3,29,36,41)
	-- No acquire information

	-- Glyph of Siphon Life -- 57273
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57273, 375, 42469, 1, 45357)
	self:addTradeFlags(RecipeDB, 57273, 3,29,36,41)
	-- No acquire information

	-- Glyph of Soulstone -- 57274
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57274, 235, 42470, 1, 45357)
	self:addTradeFlags(RecipeDB, 57274, 3,29,36,41)
	-- No acquire information

	-- Glyph of Succubus -- 57275
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57275, 320, 42471, 1, 45357)
	self:addTradeFlags(RecipeDB, 57275, 3,29,36,41)
	-- No acquire information

	-- Glyph of Unstable Affliction -- 57276
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57276, 375, 42472, 1, 45357)
	self:addTradeFlags(RecipeDB, 57276, 3,29,36,41)
	-- No acquire information

	-- Glyph of Voidwalker -- 57277
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57277, 185, 42473, 1, 45357)
	self:addTradeFlags(RecipeDB, 57277, 3,29,36,41)
	-- No acquire information

	-- Hunter's Ink -- 57703
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57703, 75, 43115, 2, 45357)
	self:addTradeFlags(RecipeDB, 57703, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lion's Ink -- 57704
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57704, 85, 43116, 1, 45357)
	self:addTradeFlags(RecipeDB, 57704, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Dawnstar Ink -- 57706
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57706, 115, 43117, 2, 45357)
	self:addTradeFlags(RecipeDB, 57706, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Jadefire Ink -- 57707
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57707, 135, 43118, 1, 45357)
	self:addTradeFlags(RecipeDB, 57707, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Royal Ink -- 57708
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57708, 160, 43119, 2, 45357)
	self:addTradeFlags(RecipeDB, 57708, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Celestial Ink -- 57709
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57709, 185, 43120, 1, 45357)
	self:addTradeFlags(RecipeDB, 57709, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Fiery Ink -- 57710
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57710, 210, 43121, 2, 45357)
	self:addTradeFlags(RecipeDB, 57710, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shimmering Ink -- 57711
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57711, 235, 43122, 1, 45357)
	self:addTradeFlags(RecipeDB, 57711, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ink of the Sky -- 57712
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57712, 280, 43123, 2, 45357)
	self:addTradeFlags(RecipeDB, 57712, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ethereal Ink -- 57713
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57713, 285, 43124, 1, 45357)
	self:addTradeFlags(RecipeDB, 57713, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Darkflame Ink -- 57714
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57714, 310, 43125, 2, 45357)
	self:addTradeFlags(RecipeDB, 57714, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ink of the Sea -- 57715
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57715, 335, 43126, 1, 45357)
	self:addTradeFlags(RecipeDB, 57715, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Snowfall Ink -- 57716
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57716, 360, 43127, 2, 45357)
	self:addTradeFlags(RecipeDB, 57716, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glyph of Fire Blast -- 57719
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57719, 375, 42740, 1, 45357)
	self:addTradeFlags(RecipeDB, 57719, 3,24,36,41)
	-- No acquire information

	-- Glyph of Aquatic Form -- 58286
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58286, 95, 43316, 1, 45357)
	self:addTradeFlags(RecipeDB, 58286, 3,22,36,41)
	-- No acquire information

	-- Glyph of Challenging Roar -- 58287
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58287, 145, 43334, 1, 45357)
	self:addTradeFlags(RecipeDB, 58287, 3,22,36,41)
	-- No acquire information

	-- Glyph of Unburdened Rebirth -- 58288
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58288, 95, 43331, 1, 45357)
	self:addTradeFlags(RecipeDB, 58288, 3,22,36,41)
	-- No acquire information

	-- Glyph of Thorns -- 58289
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58289, 70, 43332, 1, 45357)
	self:addTradeFlags(RecipeDB, 58289, 3,22,36,41)
	-- No acquire information

	-- Glyph of the Wild -- 58296
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58296, 70, 43335, 1, 45357)
	self:addTradeFlags(RecipeDB, 58296, 3,22,36,41)
	-- No acquire information

	-- Glyph of the Pack -- 58297
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58297, 195, 43355, 1, 45357)
	self:addTradeFlags(RecipeDB, 58297, 3,23,36,41)
	-- No acquire information

	-- Glyph of Scare Beast -- 58298
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58298, 70, 43356, 1, 45357)
	self:addTradeFlags(RecipeDB, 58298, 3,23,36,41)
	-- No acquire information

	-- Glyph of Revive Pet -- 58299
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58299, 70, 43338, 1, 45357)
	self:addTradeFlags(RecipeDB, 58299, 3,23,36,41)
	-- No acquire information

	-- Glyph of Possessed Strength -- 58300
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58300, 70, 43354, 1, 45357)
	self:addTradeFlags(RecipeDB, 58300, 3,23,36,41)
	-- No acquire information

	-- Glyph of Mend Pet -- 58301
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58301, 70, 43350, 1, 45357)
	self:addTradeFlags(RecipeDB, 58301, 3,23,36,41)
	-- No acquire information

	-- Glyph of Feign Death -- 58302
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58302, 145, 43351, 1, 45357)
	self:addTradeFlags(RecipeDB, 58302, 3,23,36,41)
	-- No acquire information

	-- Glyph of Arcane Intellect -- 58303
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58303, 70, 43339, 1, 45357)
	self:addTradeFlags(RecipeDB, 58303, 3,24,36,41)
	-- No acquire information

	-- Glyph of Fire Ward -- 58305
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58305, 95, 43357, 1, 45357)
	self:addTradeFlags(RecipeDB, 58305, 3,24,36,41)
	-- No acquire information

	-- Glyph of Frost Armor -- 58306
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58306, 70, 43359, 1, 45357)
	self:addTradeFlags(RecipeDB, 58306, 3,24,36,41,47,63)
	-- No acquire information

	-- Glyph of Frost Ward -- 58307
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58307, 120, 43360, 1, 45357)
	self:addTradeFlags(RecipeDB, 58307, 3,24,36,41)
	-- No acquire information

	-- Glyph of Slow Fall -- 58308
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58308, 70, 43364, 1, 45357)
	self:addTradeFlags(RecipeDB, 58308, 3,24,36,41)
	-- No acquire information

	-- Glyph of the Penguin -- 58310
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58310, 70, 43361, 1, 45357)
	self:addTradeFlags(RecipeDB, 58310, 3,24,36,41)
	-- No acquire information

	-- Glyph of Blessing of Kings -- 58311
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58311, 95, 43365, 1, 45357)
	self:addTradeFlags(RecipeDB, 58311, 3,25,36,41)
	-- No acquire information

	-- Glyph of Blessing of Wisdom -- 58312
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58312, 70, 43366, 1, 45357)
	self:addTradeFlags(RecipeDB, 58312, 3,25,36,41)
	-- No acquire information

	-- Glyph of Lay on Hands -- 58313
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58313, 70, 43367, 1, 45357)
	self:addTradeFlags(RecipeDB, 58313, 3,25,36,41)
	-- No acquire information

	-- Glyph of Blessing of Might -- 58314
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58314, 70, 43340, 1, 45357)
	self:addTradeFlags(RecipeDB, 58314, 3,25,36,41)
	-- No acquire information

	-- Glyph of Sense Undead -- 58315
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58315, 95, 43368, 1, 45357)
	self:addTradeFlags(RecipeDB, 58315, 3,25,36,41)
	-- No acquire information

	-- Glyph of the Wise -- 58316
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58316, 145, 43369, 1, 45357)
	self:addTradeFlags(RecipeDB, 58316, 3,25,36,41)
	-- No acquire information

	-- Glyph of Fading -- 58317
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58317, 70, 43342, 1, 45357)
	self:addTradeFlags(RecipeDB, 58317, 3,26,36,41)
	-- No acquire information

	-- Glyph of Fortitude -- 58318
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58318, 70, 43371, 1, 45357)
	self:addTradeFlags(RecipeDB, 58318, 3,26,36,41)
	-- No acquire information

	-- Glyph of Levitate -- 58319
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58319, 170, 43370, 1, 45357)
	self:addTradeFlags(RecipeDB, 58319, 3,26,36,41)
	-- No acquire information

	-- Glyph of Shackle Undead -- 58320
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58320, 95, 43373, 1, 45357)
	self:addTradeFlags(RecipeDB, 58320, 3,26,36,41)
	-- No acquire information

	-- Glyph of Shadow Protection -- 58321
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58321, 145, 43372, 1, 45357)
	self:addTradeFlags(RecipeDB, 58321, 3,26,36,41)
	-- No acquire information

	-- Glyph of Shadowfiend -- 58322
	-- Trainer
	-- Flags: Priest, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58322, 345, 43374, 1, 45357)
	self:addTradeFlags(RecipeDB, 58322, 3,26,36,41)
	-- No acquire information

	-- Glyph of Blurred Speed -- 58323
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58323, 70, 43379, 1, 45357)
	self:addTradeFlags(RecipeDB, 58323, 3,28,36,41)
	-- No acquire information

	-- Glyph of Distract -- 58324
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58324, 120, 43376, 1, 45357)
	self:addTradeFlags(RecipeDB, 58324, 3,28,36,41)
	-- No acquire information

	-- Glyph of Pick Lock -- 58325
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58325, 95, 43377, 1, 45357)
	self:addTradeFlags(RecipeDB, 58325, 3,28,36,41)
	-- No acquire information

	-- Glyph of Pick Pocket -- 58326
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58326, 70, 43343, 1, 45357)
	self:addTradeFlags(RecipeDB, 58326, 3,28,36,41)
	-- No acquire information

	-- Glyph of Safe Fall -- 58327
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58327, 195, 43378, 1, 45357)
	self:addTradeFlags(RecipeDB, 58327, 3,28,36,41)
	-- No acquire information

	-- Glyph of Vanish -- 58328
	-- Trainer
	-- Flags: Rogue, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58328, 120, 43380, 1, 45357)
	self:addTradeFlags(RecipeDB, 58328, 3,28,36,41)
	-- No acquire information

	-- Glyph of Astral Recall -- 58329
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58329, 145, 43381, 1, 45357)
	self:addTradeFlags(RecipeDB, 58329, 3,27,36,41)
	-- No acquire information

	-- Glyph of Renewed Life -- 58330
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58330, 145, 43385, 1, 45357)
	self:addTradeFlags(RecipeDB, 58330, 3,27,36,41)
	-- No acquire information

	-- Glyph of Water Breathing -- 58331
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58331, 120, 43344, 1, 45357)
	self:addTradeFlags(RecipeDB, 58331, 3,27,36,41)
	-- No acquire information

	-- Glyph of Water Shield -- 58332
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58332, 95, 43386, 1, 45357)
	self:addTradeFlags(RecipeDB, 58332, 3,27,36,41)
	-- No acquire information

	-- Glyph of Water Walking -- 58333
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58333, 145, 43388, 1, 45357)
	self:addTradeFlags(RecipeDB, 58333, 3,27,36,41)
	-- No acquire information

	-- Glyph of Unending Breath -- 58336
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58336, 95, 43389, 1, 45357)
	self:addTradeFlags(RecipeDB, 58336, 3,29,36,41)
	-- No acquire information

	-- Glyph of Drain Soul -- 58337
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58337, 70, 43390, 1, 45357)
	self:addTradeFlags(RecipeDB, 58337, 3,29,36,41)
	-- No acquire information

	-- Glyph of Curse of Exhaustion -- 58338
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58338, 145, 43392, 1, 45357)
	self:addTradeFlags(RecipeDB, 58338, 3,29,36,41)
	-- No acquire information

	-- Glyph of Enslave Demon -- 58339
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58339, 145, 43393, 1, 45357)
	self:addTradeFlags(RecipeDB, 58339, 3,29,36,41)
	-- No acquire information

	-- Glyph of Kilrogg -- 58340
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58340, 120, 43391, 1, 45357)
	self:addTradeFlags(RecipeDB, 58340, 3,29,36,41)
	-- No acquire information

	-- Glyph of Souls -- 58341
	-- Trainer
	-- Flags: Warlock, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58341, 345, 43394, 1, 45357)
	self:addTradeFlags(RecipeDB, 58341, 3,29,36,41)
	-- No acquire information

	-- Glyph of Battle -- 58342
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58342, 70, 43395, 1, 45357)
	self:addTradeFlags(RecipeDB, 58342, 3,30,36,41)
	-- No acquire information

	-- Glyph of Bloodrage -- 58343
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58343, 70, 43396, 1, 45357)
	self:addTradeFlags(RecipeDB, 58343, 3,30,36,41)
	-- No acquire information

	-- Glyph of Charge -- 58344
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58344, 70, 43397, 1, 45357)
	self:addTradeFlags(RecipeDB, 58344, 3,30,36,41)
	-- No acquire information

	-- Glyph of Mocking Blow -- 58345
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58345, 95, 43398, 1, 45357)
	self:addTradeFlags(RecipeDB, 58345, 3,30,36,41)
	-- No acquire information

	-- Glyph of Thunder Clap -- 58346
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58346, 70, 43399, 1, 45357)
	self:addTradeFlags(RecipeDB, 58346, 3,30,36,41)
	-- No acquire information

	-- Glyph of Enduring Victory -- 58347
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58347, 320, 43400, 1, 45357)
	self:addTradeFlags(RecipeDB, 58347, 3,30,36,41)
	-- No acquire information

	-- Scroll of Agility -- 58472
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58472, 25, 3012, 1, 45357)
	self:addTradeFlags(RecipeDB, 58472, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility II -- 58473
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58473, 75, 1477, 1, 45357)
	self:addTradeFlags(RecipeDB, 58473, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility III -- 58476
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58476, 170, 4425, 1, 45357)
	self:addTradeFlags(RecipeDB, 58476, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility IV -- 58478
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58478, 220, 10309, 1, 45357)
	self:addTradeFlags(RecipeDB, 58478, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility V -- 58480
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58480, 265, 27498, 1, 45357)
	self:addTradeFlags(RecipeDB, 58480, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility VI -- 58481
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58481, 310, 33457, 1, 45357)
	self:addTradeFlags(RecipeDB, 58481, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility VII -- 58482
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58482, 365, 43463, 1, 45357)
	self:addTradeFlags(RecipeDB, 58482, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Agility VIII -- 58483
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58483, 415, 43464, 1, 45357)
	self:addTradeFlags(RecipeDB, 58483, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength -- 58484
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58484, 25, 954, 1, 45357)
	self:addTradeFlags(RecipeDB, 58484, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength II -- 58485
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58485, 70, 2289, 1, 45357)
	self:addTradeFlags(RecipeDB, 58485, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength III -- 58486
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58486, 165, 4426, 1, 45357)
	self:addTradeFlags(RecipeDB, 58486, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength IV -- 58487
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58487, 215, 10310, 1, 45357)
	self:addTradeFlags(RecipeDB, 58487, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength V -- 58488
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58488, 260, 27503, 1, 45357)
	self:addTradeFlags(RecipeDB, 58488, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength VI -- 58489
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58489, 305, 33462, 1, 45357)
	self:addTradeFlags(RecipeDB, 58489, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength VII -- 58490
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58490, 360, 43465, 1, 45357)
	self:addTradeFlags(RecipeDB, 58490, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Strength VIII -- 58491
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58491, 410, 43466, 1, 45357)
	self:addTradeFlags(RecipeDB, 58491, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mystic Tome -- 58565
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val8id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58565, 100, 43515, 3, 45357)
	self:addTradeFlags(RecipeDB, 58565, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Glyph of Dash -- 59315
	-- Trainer
	-- Flags: Druid, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59315, 145, 43674, 1, 45357)
	self:addTradeFlags(RecipeDB, 59315, 3,22,36,41)
	-- No acquire information

	-- Glyph of Ghost Wolf -- 59326
	-- Trainer
	-- Flags: Shaman, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59326, 95, 43725, 1, 45357)
	self:addTradeFlags(RecipeDB, 59326, 3,27,36,41)
	-- No acquire information

	-- Glyph of Rune Tap -- 59338
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59338, 305, 43825, 1, 45357)
	self:addTradeFlags(RecipeDB, 59338, 3,36,41)
	-- No acquire information

	-- Glyph of Blood Strike -- 59339
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59339, 315, 43826, 1, 45357)
	self:addTradeFlags(RecipeDB, 59339, 3,36,41)
	-- No acquire information

	-- Glyph of Death Strike -- 59340
	-- Trainer
	-- Flags: Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59340, 335, 43827, 1, 45357)
	self:addTradeFlags(RecipeDB, 59340, 3,36,41)
	-- No acquire information

	-- Certificate of Ownership -- 59387
	-- Trainer
	-- Flags: Hunter, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59387, 195, 43850, 1, 45357)
	self:addTradeFlags(RecipeDB, 59387, 3,23,36,41)
	-- No acquire information

	-- Tome of the Dawn -- 59475
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val6id4val6id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59475, 125, 43654, 3, 45357)
	self:addTradeFlags(RecipeDB, 59475, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Book of Survival -- 59478
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val7id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59478, 125, 43655, 3, 45357)
	self:addTradeFlags(RecipeDB, 59478, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Tome of Kings -- 59484
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val6id3val6id44val5id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59484, 175, 43656, 3, 45357)
	self:addTradeFlags(RecipeDB, 59484, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Royal Guide of Escape Routes -- 59486
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val11id46
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59486, 175, 43657, 3, 45357)
	self:addTradeFlags(RecipeDB, 59486, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Weapon Vellum II -- 59488
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59488, 300, 39350, 1, 45357)
	self:addTradeFlags(RecipeDB, 59488, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Fire Eater's Guide -- 59489
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val9id44val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59489, 225, 43660, 3, 45357)
	self:addTradeFlags(RecipeDB, 59489, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Book of Stars -- 59490
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val14id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59490, 225, 43661, 3, 45357)
	self:addTradeFlags(RecipeDB, 59490, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Stormbound Tome -- 59493
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val10id4val9id44val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59493, 275, 43663, 3, 45357)
	self:addTradeFlags(RecipeDB, 59493, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Manual of Clouds -- 59494
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val9id4val9id5val12id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59494, 275, 43664, 3, 45357)
	self:addTradeFlags(RecipeDB, 59494, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Hellfire Tome -- 59495
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val20id33val25id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59495, 325, 43666, 3, 45357)
	self:addTradeFlags(RecipeDB, 59495, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Book of Clever Tricks -- 59496
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val27id3val7id44val11id45
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59496, 325, 43667, 3, 45357)
	self:addTradeFlags(RecipeDB, 59496, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Iron-bound Tome -- 59497
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val45id3val200id6val2id8val2id15val16id44val62id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59497, 425, 38322, 4, 45357)
	self:addTradeFlags(RecipeDB, 59497, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Faces of Doom -- 59498
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val32id4val32id5val2id8val2id15val32id44val39id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59498, 425, 44210, 4, 45357)
	self:addTradeFlags(RecipeDB, 59498, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Armor Vellum II -- 59499
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59499, 300, 37602, 1, 45357)
	self:addTradeFlags(RecipeDB, 59499, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Armor Vellum III -- 59500
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59500, 350, 43145, 1, 45357)
	self:addTradeFlags(RecipeDB, 59500, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Weapon Vellum III -- 59501
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59501, 350, 43146, 1, 45357)
	self:addTradeFlags(RecipeDB, 59501, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glyph of Seal of Blood -- 59559
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59559, 375, 43867, 1, 45357)
	self:addTradeFlags(RecipeDB, 59559, 3,25,36,41)
	-- No acquire information

	-- Glyph of Seal of Righteousness -- 59560
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59560, 375, 43868, 1, 45357)
	self:addTradeFlags(RecipeDB, 59560, 3,25,36,41)
	-- No acquire information

	-- Glyph of Seal of Vengeance -- 59561
	-- Trainer
	-- Flags: Paladin, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 59561, 375, 43869, 1, 45357)
	self:addTradeFlags(RecipeDB, 59561, 3,25,36,41)
	-- No acquire information

	-- Scroll of Recall II -- 60336
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60336, 200, 44314, 1, 45357)
	self:addTradeFlags(RecipeDB, 60336, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Recall III -- 60337
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60337, 350, 44315, 1, 45357)
	self:addTradeFlags(RecipeDB, 60337, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glyph of Frostfire -- 61677
	-- Trainer
	-- Flags: Mage, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 61677, 375, 44684, 1, 45357)
	self:addTradeFlags(RecipeDB, 61677, 3,24,36,41)
	-- No acquire information


	return recipecount

end
