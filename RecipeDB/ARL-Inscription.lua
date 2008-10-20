--[[

************************************************************************

ARL-Inscription.lua

Inscription data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
26 found from data mining.
15 ignored.
0 WotLK ignored.

************************************************************************

$Date$
$Rev$

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
	self:addTradeSkill(RecipeDB, 45382, 15, 1180, 1, 45357)
	self:addTradeFlags(RecipeDB, 45382, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect -- 48114
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48114, 15, 955, 1, 45357)
	self:addTradeFlags(RecipeDB, 48114, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit -- 48116
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48116, 15, 1181, 1, 45357)
	self:addTradeFlags(RecipeDB, 48116, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Silver Ink -- 48118
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48118, 1, 37100, 1, 45357)
	self:addTradeFlags(RecipeDB, 48118, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ivory Ink -- 48121
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48121, 1, 37101, 1, 45357)
	self:addTradeFlags(RecipeDB, 48121, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Recall -- 48248
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48248, 45, 37118, 1, 45357)
	self:addTradeFlags(RecipeDB, 48248, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect II -- 50598
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50598, , 2290, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50598, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect III -- 50599
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50599, , 4419, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50599, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect IV -- 50600
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50600, , 10308, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50600, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect V -- 50601
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50601, , 27499, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50601, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Intellect VI -- 50602
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50602, , 33458, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50602, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit II -- 50605
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50605, , 1712, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50605, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit III -- 50606
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50606, , 4424, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50606, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit IV -- 50607
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50607, , 10306, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50607, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit V -- 50608
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50608, , 27501, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50608, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Spirit VI -- 50609
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50609, , 33460, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50609, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina II -- 50612
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50612, , 1711, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50612, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina III -- 50614
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50614, , 4422, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50614, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina IV -- 50616
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50616, , 10307, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50616, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina V -- 50617
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50617, , 27502, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50617, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Scroll of Stamina VI -- 50618
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 50618, , 33461, 1, 45357)
	--self:addTradeFlags(RecipeDB, 50618, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Ebon Ink -- 52738
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52738, 75, 37101, 1, 45357)
	self:addTradeFlags(RecipeDB, 52738, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bleached Parchment -- 52739
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52739, 50, 38682, 1, 45357)
	self:addTradeFlags(RecipeDB, 52739, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Treated Vellum -- 52840
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52840, 85, 39349, 1, 45357)
	self:addTradeFlags(RecipeDB, 52840, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Moonglow Ink -- 52843
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52843, 20, 39469, 1, 45357)
	self:addTradeFlags(RecipeDB, 52843, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mightnight Ink -- 53462
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53462, 100, 39774, 1, 45357)
	self:addTradeFlags(RecipeDB, 53462, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	return recipecount

end
