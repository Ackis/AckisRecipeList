--[[

************************************************************************

ARL-Alchemy.lua

Alchemy data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
242 found from data mining.
5 ignored.

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

function addon:InitAlchemy(RecipeDB)

	local recipecount = 0

	-- Elixir of Lion's Strength -- 2329
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2329, 15, 2454, 1, 2259)
	self:addTradeFlags(RecipeDB, 2329, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Minor Healing Potion -- 2330
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2330, 15, 118, 1, 2259)
	self:addTradeFlags(RecipeDB, 2330, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Minor Mana Potion -- 2331
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2331, 25, 2455, 1, 2259)
	self:addTradeFlags(RecipeDB, 2331, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2331, 1, 1215, 1, 1246, 1, 1386, 1, 1470, 1, 2132, 1, 2391, 1, 2837, 1, 3009, 1, 3184, 1, 3347, 1, 3603, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 5500, 1, 7948, 1, 11041, 1, 11042, 1, 11044, 1, 11046, 1, 11047, 1, 16161, 1, 16588, 1, 16642, 1, 16643, 1, 16723, 1, 16741, 1, 17215, 1, 18802, 1, 19052)

	-- Minor Rejuvenation Potion -- 2332
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2332, 30, 2456, 1, 2259)
	self:addTradeFlags(RecipeDB, 2332, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2332, 1, 1215, 1, 1246, 1, 1386, 1, 1470, 1, 2132, 1, 2391, 1, 2837, 1, 3009, 1, 3184, 1, 3347, 1, 3603, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 5500, 1, 7948, 1, 11041, 1, 11042, 1, 11044, 1, 11046, 1, 11047, 1, 16161, 1, 16588, 1, 16642, 1, 16643, 1, 16723, 1, 16741, 1, 17215, 1, 18802, 1, 19052)

	-- Elixir of Lesser Agility -- 2333
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2333, 125, 3390, 1, 2259)
	self:addTradeFlags(RecipeDB, 2333, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Minor Fortitude -- 2334
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2334, 40, 2458, 1, 2259)
	self:addTradeFlags(RecipeDB, 2334, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2334, 1, 1215, 1, 1246, 1, 1386, 1, 1470, 1, 2132, 1, 2391, 1, 2837, 1, 3009, 1, 3184, 1, 3347, 1, 3603, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 5500, 1, 7948, 1, 11041, 1, 11042, 1, 11044, 1, 11046, 1, 11047, 1, 16161, 1, 16588, 1, 16642, 1, 16643, 1, 16723, 1, 16741, 1, 17215, 1, 18802, 1, 19052)

	-- Swiftness Potion -- 2335
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2335, 60, 2459, 2, 2259)
	self:addTradeFlags(RecipeDB, 2335, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 2335, 7, 2)

	-- Elixir of Tongues -- 2336
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 2336, 60, 2460, 1, 2259)
	--self:addTradeFlags(RecipeDB, 2336, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lesser Healing Potion -- 2337
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 2337, 45, 858, 1, 2259)
	self:addTradeFlags(RecipeDB, 2337, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 2337, 1, 1215, 1, 1246, 1, 1386, 1, 1470, 1, 2132, 1, 2391, 1, 2837, 1, 3009, 1, 3184, 1, 3347, 1, 3603, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 5500, 1, 7948, 1, 11041, 1, 11042, 1, 11044, 1, 11046, 1, 11047, 1, 16161, 1, 16588, 1, 16642, 1, 16643, 1, 16723, 1, 16741, 1, 17215, 1, 18802, 1, 19052)

	-- Weak Troll's Blood Elixir -- 3170
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3170, 20, 3382, 1, 2259)
	self:addTradeFlags(RecipeDB, 3170, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3170, 1, 1215, 1, 1246, 1, 1386, 1, 1470, 1, 2132, 1, 2391, 1, 2837, 1, 3009, 1, 3184, 1, 3347, 1, 3603, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 5500, 1, 7948, 1, 11041, 1, 11042, 1, 11044, 1, 11046, 1, 11047, 1, 16161, 1, 16588, 1, 16642, 1, 16643, 1, 16723, 1, 16741, 1, 17215, 1, 18802, 1, 19052)

	-- Elixir of Wisdom -- 3171
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3171, 80, 3383, 1, 2259)
	self:addTradeFlags(RecipeDB, 3171, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3171, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Minor Magic Resistance Potion -- 3172
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3172, 110, 3384, 1, 2259)
	self:addTradeFlags(RecipeDB, 3172, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3172, 7, 1)

	-- Lesser Mana Potion -- 3173
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3173, 105, 3385, 1, 2259)
	self:addTradeFlags(RecipeDB, 3173, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3173, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 3964, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Potion of Curing -- 3174
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3174, 120, 3386, 1, 2259)
	self:addTradeFlags(RecipeDB, 3174, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3174, 7, 1)

	-- Limited Invulnerability Potion -- 3175
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3175, 250, 3387, 2, 2259)
	self:addTradeFlags(RecipeDB, 3175, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3175, 7, 2)

	-- Strong Troll's Blood Elixir -- 3176
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3176, 110, 3388, 1, 2259)
	self:addTradeFlags(RecipeDB, 3176, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3176, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 3964, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Elixir of Defense -- 3177
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3177, 115, 3389, 1, 2259)
	self:addTradeFlags(RecipeDB, 3177, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3177, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 3964, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Elixir of Ogre's Strength -- 3188
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3188, 135, 3391, 1, 2259)
	self:addTradeFlags(RecipeDB, 3188, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Minor Agility -- 3230
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3230, 50, 2457, 2, 2259)
	self:addTradeFlags(RecipeDB, 3230, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3230, 7, 2)

	-- Healing Potion -- 3447
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3447, 95, 929, 1, 2259)
	self:addTradeFlags(RecipeDB, 3447, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3447, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 3964, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Lesser Invisibility Potion -- 3448
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3448, 145, 3823, 1, 2259)
	self:addTradeFlags(RecipeDB, 3448, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3448, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Shadow Oil -- 3449
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3449, 165, 3824, 1, 2259)
	self:addTradeFlags(RecipeDB, 3449, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3449, 2, 2481, 2, 4878)

	-- Elixir of Fortitude -- 3450
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3450, 175, 3825, 1, 2259)
	self:addTradeFlags(RecipeDB, 3450, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3450, 7, 1, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Mighty Troll's Blood Elixir -- 3451
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3451, 160, 3826, 1, 2259)
	self:addTradeFlags(RecipeDB, 3451, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Mana Potion -- 3452
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3452, 140, 3827, 1, 2259)
	self:addTradeFlags(RecipeDB, 3452, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 3452, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Detect Lesser Invisibility -- 3453
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3453, 195, 3828, 2, 2259)
	self:addTradeFlags(RecipeDB, 3453, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 3453, 7, 2)

	-- Frost Oil -- 3454
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 3454, 200, 3829, 2, 2259)
	self:addTradeFlags(RecipeDB, 3454, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Discolored Healing Potion -- 4508
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4508, 50, 4596, 2, 2259)
	self:addTradeFlags(RecipeDB, 4508, 2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 4508, 4, 429)

	-- Lesser Stoneshield Potion -- 4942
	-- Quest Reward
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 4942, 215, 4623, 1, 2259)
	self:addTradeFlags(RecipeDB, 4942, 1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 4942, 4, 715)

	-- Rage Potion -- 6617
	-- Instance: 2437 - type1maxlevel16category3territory4minlevel13nameRagefire Chasmid2437
	-- Vendor
	-- Flags: Warrior, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6617, 60, 5631, 1, 2259)
	self:addTradeFlags(RecipeDB, 6617, 1,2,4,5,30,36,40)
	self:addTradeAcquire(RecipeDB, 6617, 2, 1669, 2, 1685, 2, 3335, 2, 3499)

	-- Great Rage Potion -- 6618
	-- Instance: 2437 - type1maxlevel16category3territory4minlevel13nameRagefire Chasmid2437
	-- Vendor
	-- Flags: Warrior, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6618, 175, 5633, 1, 2259)
	self:addTradeFlags(RecipeDB, 6618, 1,2,4,5,30,36,40)
	self:addTradeAcquire(RecipeDB, 6618, 2, 3335, 2, 4226)

	-- Free Action Potion -- 6624
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 6624, 150, 5634, 1, 2259)
	self:addTradeFlags(RecipeDB, 6624, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 6624, 2, 3348, 2, 4226)

	-- Elixir of Water Breathing -- 7179
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7179, 80, 5996, 1, 2259)
	self:addTradeFlags(RecipeDB, 7179, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7179, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Greater Healing Potion -- 7181
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7181, 135, 1710, 1, 2259)
	self:addTradeFlags(RecipeDB, 7181, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7181, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Minor Defense -- 7183
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7183, 15, 5997, 1, 2259)
	self:addTradeFlags(RecipeDB, 7183, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Holy Protection Potion -- 7255
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7255, 100, 6051, 1, 2259)
	self:addTradeFlags(RecipeDB, 7255, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shadow Protection Potion -- 7256
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7256, 135, 6048, 1, 2259)
	self:addTradeFlags(RecipeDB, 7256, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7256, 2, 2393)

	-- Fire Protection Potion -- 7257
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7257, 165, 6049, 1, 2259)
	self:addTradeFlags(RecipeDB, 7257, 1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7257, 2, 2380)

	-- Frost Protection Potion -- 7258
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7258, 190, 6050, 1, 2259)
	self:addTradeFlags(RecipeDB, 7258, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7258, 2, 2812, 2, 2848)

	-- Nature Protection Potion -- 7259
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7259, 190, 6052, 1, 2259)
	self:addTradeFlags(RecipeDB, 7259, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7259, 2, 2848, 2, 5594)

	-- Blackmouth Oil -- 7836
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7836, 60, 6370, 1, 2259)
	self:addTradeFlags(RecipeDB, 7836, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7836, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Fire Oil -- 7837
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7837, 130, 6371, 1, 2259)
	self:addTradeFlags(RecipeDB, 7837, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7837, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 3964, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Swim Speed Potion -- 7841
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7841, 90, 6372, 1, 2259)
	self:addTradeFlags(RecipeDB, 7841, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7841, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Elixir of Firepower -- 7845
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7845, 125, 6373, 1, 2259)
	self:addTradeFlags(RecipeDB, 7845, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 7845, 1, 1386, 1, 2391, 1, 2837, 1, 3009, 1, 3347, 1, 3964, 1, 4160, 1, 4609, 1, 4611, 1, 5177, 1, 5499, 1, 7948, 1, 11042, 1, 16588, 1, 16642, 1, 16723, 1, 18802, 1, 19052)

	-- Elixir of Giant Growth -- 8240
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 8240, 90, 6662, 2, 2259)
	self:addTradeFlags(RecipeDB, 8240, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 8240, 7, 2)

	-- Greater Mana Potion -- 11448
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11448, 180, 6149, 1, 2259)
	self:addTradeFlags(RecipeDB, 11448, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11448, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Agility -- 11449
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11449, 165, 8949, 1, 2259)
	self:addTradeFlags(RecipeDB, 11449, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11449, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Greater Defense -- 11450
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11450, 175, 8951, 1, 2259)
	self:addTradeFlags(RecipeDB, 11450, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11450, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Oil of Immolation -- 11451
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11451, 180, 8956, 1, 2259)
	self:addTradeFlags(RecipeDB, 11451, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11451, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Restorative Potion -- 11452
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11452, 185, 9030, 1, 2259)
	self:addTradeFlags(RecipeDB, 11452, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Magic Resistance Potion -- 11453
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11453, 210, 9036, 2, 2259)
	self:addTradeFlags(RecipeDB, 11453, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11453, 7, 2)

	-- Goblin Rocket Fuel -- 11456
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11456, 210, 9061, 1, 2259)
	self:addTradeFlags(RecipeDB, 11456, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Superior Healing Potion -- 11457
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11457, 190, 3928, 1, 2259)
	self:addTradeFlags(RecipeDB, 11457, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11457, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Wildvine Potion -- 11458
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11458, 225, 9144, 2, 2259)
	self:addTradeFlags(RecipeDB, 11458, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11458, 7, 2)

	-- Philosopher's Stone -- 11459
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val5id1val5id2val5id3val5id4val5id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11459, 225, 9149, 1, 2259)
	self:addTradeFlags(RecipeDB, 11459, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 11459, 2, 5594)

	-- Elixir of Detect Undead -- 11460
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11460, 205, 9154, 1, 2259)
	self:addTradeFlags(RecipeDB, 11460, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11460, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Arcane Elixir -- 11461
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11461, 210, 9155, 1, 2259)
	self:addTradeFlags(RecipeDB, 11461, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11461, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Invisibility Potion -- 11464
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11464, 235, 9172, 2, 2259)
	self:addTradeFlags(RecipeDB, 11464, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11464, 7, 2)

	-- Elixir of Greater Intellect -- 11465
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11465, 210, 9179, 1, 2259)
	self:addTradeFlags(RecipeDB, 11465, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11465, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Gift of Arthas -- 11466
	-- Instance: 2057 - type1maxlevel60category3territory1minlevel58nameScholomanceid2057
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11466, 240, 9088, 2, 2259)
	self:addTradeFlags(RecipeDB, 11466, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11466, 3, 1783, 3, 1791, 3, 1815)

	-- Elixir of Greater Agility -- 11467
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11467, 215, 9187, 1, 2259)
	self:addTradeFlags(RecipeDB, 11467, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11467, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Dream Vision -- 11468
	-- Instance: 1477 - type1maxlevel55category3territory1minlevel50nameThe Temple of Atal'Hakkarid1477
	-- Raid: 2159 - Onyxia's Lair
	-- No location information
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11468, 240, 9197, 2, 2259)
	self:addTradeFlags(RecipeDB, 11468, 1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11468, 3, 1822, 3, 4467, 3, 5474, 3, 5481, 3, 5714, 3, 10184, 3, 12397)

	-- Elixir of Giants -- 11472
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11472, 220, 9206, 1, 2259)
	self:addTradeFlags(RecipeDB, 11472, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Ghost Dye -- 11473
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11473, 245, 9210, 1, 2259)
	self:addTradeFlags(RecipeDB, 11473, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11473, 2, 8158)

	-- Elixir of Shadow Power -- 11476
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11476, 225, 9264, 1, 2259)
	self:addTradeFlags(RecipeDB, 11476, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Demonslaying -- 11477
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11477, 225, 9224, 1, 2259)
	self:addTradeFlags(RecipeDB, 11477, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Detect Demon -- 11478
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11478, 225, 9233, 1, 2259)
	self:addTradeFlags(RecipeDB, 11478, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 11478, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Transmute: Iron to Gold -- 11479
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11479, 225, 3577, 1, 2259)
	self:addTradeFlags(RecipeDB, 11479, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11479, 2, 5594)

	-- Transmute: Mithril to Truesilver -- 11480
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 11480, 225, 6037, 1, 2259)
	self:addTradeFlags(RecipeDB, 11480, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 11480, 2, 5594)

	-- Catseye Elixir -- 12609
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 12609, 180, 10592, 1, 2259)
	self:addTradeFlags(RecipeDB, 12609, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 12609, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Dreamless Sleep Potion -- 15833
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15833, 205, 12190, 1, 2259)
	self:addTradeFlags(RecipeDB, 15833, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 15833, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Transmute: Arcanite -- 17187
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17187, 275, 12360, 1, 2259)
	self:addTradeFlags(RecipeDB, 17187, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17187, 2, 5594)

	-- Stonescale Oil -- 17551
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17551, 240, 13423, 1, 2259)
	self:addTradeFlags(RecipeDB, 17551, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 17551, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Mighty Rage Potion -- 17552
	-- Trainer
	-- Flags: Warrior, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17552, 255, 13442, 2, 2259)
	self:addTradeFlags(RecipeDB, 17552, 1,2,3,30,36,40)
	self:addTradeAcquire(RecipeDB, 17552, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Superior Mana Potion -- 17553
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17553, 260, 13443, 1, 2259)
	self:addTradeFlags(RecipeDB, 17553, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17553, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Superior Defense -- 17554
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17554, 240, 13445, 1, 2259)
	self:addTradeFlags(RecipeDB, 17554, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of the Sages -- 17555
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17555, 270, 13447, 2, 2259)
	self:addTradeFlags(RecipeDB, 17555, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17555, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Major Healing Potion -- 17556
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17556, 275, 13446, 1, 2259)
	self:addTradeFlags(RecipeDB, 17556, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17556, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Brute Force -- 17557
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17557, 275, 13453, 2, 2259)
	self:addTradeFlags(RecipeDB, 17557, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17557, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Transmute: Air to Fire -- 17559
	-- Argent Dawn - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17559, 275, 7078, 2, 2259)
	self:addTradeFlags(RecipeDB, 17559, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB, 17559, 6, 529, 2, 10856, 6, 529, 2, 10857, 6, 529, 2, 11536)

	-- Transmute: Fire to Earth -- 17560
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17560, 275, 7076, 2, 2259)
	self:addTradeFlags(RecipeDB, 17560, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 17560, 2, 9499)

	-- Transmute: Earth to Water -- 17561
	-- Timbermaw Hold - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17561, 275, 7080, 2, 2259)
	self:addTradeFlags(RecipeDB, 17561, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB, 17561, 6, 576, 1, 11557)

	-- Transmute: Water to Air -- 17562
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17562, 275, 7082, 2, 2259)
	self:addTradeFlags(RecipeDB, 17562, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 17562, 2, 11278)

	-- Transmute: Undeath to Water -- 17563
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17563, 275, 7080, 2, 2259)
	self:addTradeFlags(RecipeDB, 17563, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17563, 3, 9543)

	-- Transmute: Water to Undeath -- 17564
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17564, 275, 12808, 2, 2259)
	self:addTradeFlags(RecipeDB, 17564, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17564, 3, 6518)

	-- Transmute: Life to Earth -- 17565
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17565, 275, 7076, 2, 2259)
	self:addTradeFlags(RecipeDB, 17565, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17565, 3, 8896)

	-- Transmute: Earth to Life -- 17566
	-- Raid: 2159 - Onyxia's Lair
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17566, 275, 12803, 2, 2259)
	self:addTradeFlags(RecipeDB, 17566, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17566, 3, 10184)

	-- Greater Stoneshield Potion -- 17570
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17570, 280, 13455, 2, 2259)
	self:addTradeFlags(RecipeDB, 17570, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17570, 7, 2)

	-- Elixir of the Mongoose -- 17571
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17571, 255, 13452, 1, 2259)
	self:addTradeFlags(RecipeDB, 17571, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Purification Potion -- 17572
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17572, 285, 13462, 2, 2259)
	self:addTradeFlags(RecipeDB, 17572, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17572, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Greater Arcane Elixir -- 17573
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17573, 285, 13454, 2, 2259)
	self:addTradeFlags(RecipeDB, 17573, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17573, 1, 1386, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Greater Fire Protection Potion -- 17574
	-- Instance: 1583 - type1maxlevel60category3territory1minlevel58nameBlackrock Spireid1583
	-- Instance: 1583 - type1maxlevel60category3territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17574, 290, 13457, 2, 2259)
	self:addTradeFlags(RecipeDB, 17574, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17574, 3, 9262, 3, 9264)

	-- Greater Frost Protection Potion -- 17575
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17575, 290, 13456, 2, 2259)
	self:addTradeFlags(RecipeDB, 17575, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17575, 3, 7428, 3, 7448, 3, 7458)

	-- Greater Nature Protection Potion -- 17576
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17576, 290, 13458, 2, 2259)
	self:addTradeFlags(RecipeDB, 17576, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17576, 3, 1812, 3, 1813)

	-- Greater Arcane Protection Potion -- 17577
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17577, 290, 13461, 2, 2259)
	self:addTradeFlags(RecipeDB, 17577, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17577, 3, 7435, 3, 7436, 3, 7437, 3, 7443, 3, 10659, 3, 10660, 3, 10661, 3, 10662)

	-- Greater Shadow Protection Potion -- 17578
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17578, 290, 13459, 2, 2259)
	self:addTradeFlags(RecipeDB, 17578, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 17578, 3, 8546, 3, 8550)

	-- Greater Holy Protection Potion -- 17579
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 17579, 265, 13460, 1, 2259)
	--self:addTradeFlags(RecipeDB, 17579, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Major Mana Potion -- 17580
	-- Instance: 2057 - type1maxlevel60category3territory1minlevel58nameScholomanceid2057
	-- Mob Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17580, 295, 13444, 2, 2259)
	self:addTradeFlags(RecipeDB, 17580, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 17580, 3, 1853, 2, 11278)

	-- Alchemist's Stone -- 17632
	-- The Sha'tar - Revered
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val15id1val15id2val15id3val15id4val15id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17632, 350, 13503, 1, 2259)
	self:addTradeFlags(RecipeDB, 17632, 1,2,4,5,6,21,22,23,24,25,26,27,28,29,30,37,41,47,63,111)
	self:addTradeAcquire(RecipeDB, 17632, 6, 935, 3, 21432)

	-- Flask of Petrification -- 17634
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17634, 300, 13506, 1, 2259)
	self:addTradeFlags(RecipeDB, 17634, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Flask of the Titans -- 17635
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17635, 300, 13510, 1, 2259)
	self:addTradeFlags(RecipeDB, 17635, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Flask of Distilled Wisdom -- 17636
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17636, 300, 13511, 1, 2259)
	self:addTradeFlags(RecipeDB, 17636, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Flask of Supreme Power -- 17637
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17637, 300, 13512, 1, 2259)
	self:addTradeFlags(RecipeDB, 17637, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Flask of Chromatic Resistance -- 17638
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17638, 300, 13513, 1, 2259)
	self:addTradeFlags(RecipeDB, 17638, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Frost Power -- 21923
	-- Trainer
	-- Flags: All classes, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21923, 170, 17708, 1, 2259)
	self:addTradeFlags(RecipeDB, 21923, 3,7,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB, 21923, 5, 1)

	-- Major Rejuvenation Potion -- 22732
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22732, 300, 18253, 3, 2259)
	self:addTradeFlags(RecipeDB, 22732, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 22732, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259)

	-- Elixir of Greater Water Breathing -- 22808
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22808, 190, 18294, 1, 2259)
	self:addTradeFlags(RecipeDB, 22808, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22808, 1, 1386, 1, 4160, 1, 4611, 1, 7948, 1, 16588, 1, 18802, 1, 19052)

	-- Gurubashi Mojo Madness -- 24266
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24266, 300, 19931, 3, 2259)
	self:addTradeFlags(RecipeDB, 24266, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mageblood Elixir -- 24365
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24365, 250, 20007, 1, 2259)
	self:addTradeFlags(RecipeDB, 24365, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Greater Dreamless Sleep Potion -- 24366
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24366, 275, 20002, 1, 2259)
	self:addTradeFlags(RecipeDB, 24366, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB, 24366, 6, 270, 1, 14921)

	-- Living Action Potion -- 24367
	-- Zandalar Tribe - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24367, 285, 20008, 1, 2259)
	self:addTradeFlags(RecipeDB, 24367, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB, 24367, 6, 270, 4, 14921)

	-- Major Troll's Blood Elixir -- 24368
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 24368, 265, 20004, 1, 2259)
	self:addTradeFlags(RecipeDB, 24368, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Transmute: Elemental Fire -- 25146
	-- Thorium Brotherhood - Friendly
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25146, 300, 7068, 1, 2259)
	self:addTradeFlags(RecipeDB, 25146, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,98)
	self:addTradeAcquire(RecipeDB, 25146, 6, 59, 1, 12944)

	-- Elixir of Greater Firepower -- 26277
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26277, 225, 21546, 1, 2259)
	self:addTradeFlags(RecipeDB, 26277, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Camouflage -- 28543
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28543, 305, 22823, 1, 2259)
	self:addTradeFlags(RecipeDB, 28543, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Major Strength -- 28544
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28544, 305, 22824, 1, 2259)
	self:addTradeFlags(RecipeDB, 28544, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28544, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Healing Power -- 28545
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28545, 310, 22825, 1, 2259)
	self:addTradeFlags(RecipeDB, 28545, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28545, 1, 16588, 1, 18802, 1, 19052)

	-- Sneaking Potion -- 28546
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28546, 315, 22826, 1, 2259)
	self:addTradeFlags(RecipeDB, 28546, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28546, 2, 18017, 2, 19042)

	-- Elixir of Major Frost Power -- 28549
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28549, 320, 22827, 1, 2259)
	self:addTradeFlags(RecipeDB, 28549, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Insane Strength Potion -- 28550
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28550, 320, 22828, 2, 2259)
	self:addTradeFlags(RecipeDB, 28550, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28550, 7, 2)

	-- Super Healing Potion -- 28551
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28551, 325, 22829, 1, 2259)
	self:addTradeFlags(RecipeDB, 28551, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28551, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of the Searching Eye -- 28552
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28552, 325, 22830, 1, 2259)
	self:addTradeFlags(RecipeDB, 28552, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Major Agility -- 28553
	-- Honor Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28553, 330, 22831, 1, 2259)
	self:addTradeFlags(RecipeDB, 28553, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB, 28553, 6, 946, 2, 17657)

	-- Shrouding Potion -- 28554
	-- Sporeggar - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28554, 335, 22871, 2, 2259)
	self:addTradeFlags(RecipeDB, 28554, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB, 28554, 6, 970, 4, 18382)

	-- Super Mana Potion -- 28555
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28555, 340, 22832, 1, 2259)
	self:addTradeFlags(RecipeDB, 28555, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28555, 2, 18005, 2, 19837)

	-- Elixir of Major Firepower -- 28556
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28556, 345, 22833, 1, 2259)
	self:addTradeFlags(RecipeDB, 28556, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Major Defense -- 28557
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28557, 345, 22834, 1, 2259)
	self:addTradeFlags(RecipeDB, 28557, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Major Shadow Power -- 28558
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28558, 350, 22835, 1, 2259)
	self:addTradeFlags(RecipeDB, 28558, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Major Dreamless Sleep Potion -- 28562
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28562, 350, 22836, 1, 2259)
	self:addTradeFlags(RecipeDB, 28562, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28562, 2, 19042, 2, 19837)

	-- Heroic Potion -- 28563
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28563, 350, 22837, 2, 2259)
	self:addTradeFlags(RecipeDB, 28563, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28563, 7, 2)

	-- Haste Potion -- 28564
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28564, 350, 22838, 2, 2259)
	self:addTradeFlags(RecipeDB, 28564, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28564, 7, 2)

	-- Destruction Potion -- 28565
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28565, 350, 22839, 2, 2259)
	self:addTradeFlags(RecipeDB, 28565, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28565, 7, 2)

	-- Transmute: Primal Air to Fire -- 28566
	-- The Sha'tar - Revered
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28566, 350, 21884, 2, 2259)
	self:addTradeFlags(RecipeDB, 28566, 1,2,4,5,6,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB, 28566, 6, 935, 3, 21432)

	-- Transmute: Primal Earth to Water -- 28567
	-- Sporeggar - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28567, 350, 21885, 2, 2259)
	self:addTradeFlags(RecipeDB, 28567, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB, 28567, 6, 970, 3, 18382)

	-- Transmute: Primal Fire to Earth -- 28568
	-- The Mag'har - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28568, 350, 22452, 2, 2259)
	self:addTradeFlags(RecipeDB, 28568, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB, 28568, 6, 941, 3, 20241)

	-- Transmute: Primal Water to Air -- 28569
	-- Cenarion Expedition - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28569, 350, 22451, 2, 2259)
	self:addTradeFlags(RecipeDB, 28569, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 28569, 6, 942, 3, 17904)

	-- Elixir of Major Mageblood -- 28570
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28570, 360, 22840, 1, 2259)
	self:addTradeFlags(RecipeDB, 28570, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Major Fire Protection Potion -- 28571
	-- Instance: 3849 - type5category3territory1expansion1minlevel70nameTempest Keep: The Mechanarid3849
	-- Instance: 3849 - type5category3territory1expansion1minlevel70nameTempest Keep: The Mechanarid3849
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28571, 360, 22841, 2, 2259)
	self:addTradeFlags(RecipeDB, 28571, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28571, 3, 19168, 3, 19221)

	-- Major Frost Protection Potion -- 28572
	-- Instance: 3792 - type5maxlevel66category3territory1expansion1minlevel64nameAuchindoun: Mana-Tombsid3792
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28572, 360, 22842, 2, 2259)
	self:addTradeFlags(RecipeDB, 28572, 1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28572, 3, 18344)

	-- Major Nature Protection Potion -- 28573
	-- Cenarion Expedition - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28573, 360, 22844, 1, 2259)
	self:addTradeFlags(RecipeDB, 28573, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 28573, 6, 942, 4, 17904)

	-- Major Arcane Protection Potion -- 28575
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28575, 360, 22845, 2, 2259)
	self:addTradeFlags(RecipeDB, 28575, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28575, 3, 17150)

	-- Major Shadow Protection Potion -- 28576
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28576, 360, 22846, 2, 2259)
	self:addTradeFlags(RecipeDB, 28576, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28576, 3, 21302)

	-- Major Holy Protection Potion -- 28577
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28577, 360, 22847, 2, 2259)
	self:addTradeFlags(RecipeDB, 28577, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28577, 3, 19973)

	-- Elixir of Empowerment -- 28578
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28578, 370, 22848, 1, 2259)
	self:addTradeFlags(RecipeDB, 28578, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Ironshield Potion -- 28579
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28579, 365, 22849, 2, 2259)
	self:addTradeFlags(RecipeDB, 28579, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28579, 3, 17862)

	-- Transmute: Primal Shadow to Water -- 28580
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28580, 370, 21885, 2, 2259)
	self:addTradeFlags(RecipeDB, 28580, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28580, 8, 3)

	-- Transmute: Primal Water to Shadow -- 28581
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28581, 370, 22456, 2, 2259)
	self:addTradeFlags(RecipeDB, 28581, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28581, 8, 3)

	-- Transmute: Primal Mana to Fire -- 28582
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28582, 370, 21884, 2, 2259)
	self:addTradeFlags(RecipeDB, 28582, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28582, 8, 3)

	-- Transmute: Primal Fire to Mana -- 28583
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28583, 370, 22457, 2, 2259)
	self:addTradeFlags(RecipeDB, 28583, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28583, 8, 3)

	-- Transmute: Primal Life to Earth -- 28584
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28584, 370, 22452, 2, 2259)
	self:addTradeFlags(RecipeDB, 28584, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28584, 8, 3)

	-- Transmute: Primal Earth to Life -- 28585
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28585, 370, 21886, 2, 2259)
	self:addTradeFlags(RecipeDB, 28585, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28585, 8, 3)

	-- Super Rejuvenation Potion -- 28586
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28586, 370, 22850, 1, 2259)
	self:addTradeFlags(RecipeDB, 28586, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28586, 8, 2)

	-- Flask of Fortification -- 28587
	-- Trainer
	-- Flags: All classes, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28587, 370, 22851, 1, 2259)
	self:addTradeFlags(RecipeDB, 28587, 1,2,12,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB, 28587, 8, 1)

	-- Flask of Mighty Restoration -- 28588
	-- Trainer
	-- Flags: All classes, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28588, 370, 22853, 1, 2259)
	self:addTradeFlags(RecipeDB, 28588, 1,2,12,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB, 28588, 8, 1)

	-- Flask of Relentless Assault -- 28589
	-- Trainer
	-- Flags: All classes, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28589, 370, 22854, 1, 2259)
	self:addTradeFlags(RecipeDB, 28589, 1,2,12,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB, 28589, 8, 1)

	-- Flask of Blinding Light -- 28590
	-- Trainer
	-- Flags: All classes, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28590, 370, 22861, 1, 2259)
	self:addTradeFlags(RecipeDB, 28590, 1,2,12,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB, 28590, 8, 1)

	-- Flask of Pure Death -- 28591
	-- Trainer
	-- Flags: All classes, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28591, 370, 22866, 1, 2259)
	self:addTradeFlags(RecipeDB, 28591, 1,2,12,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB, 28591, 8, 1)

	-- Transmute: Primal Might -- 29688
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 29688, 350, 23571, 2, 2259)
	self:addTradeFlags(RecipeDB, 29688, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 29688, 2, 16641, 2, 16705, 2, 19074)

	-- Transmute: Earthstorm Diamond -- 32765
	-- Cenarion Expedition - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32765, 350, 25867, 1, 2259)
	self:addTradeFlags(RecipeDB, 32765, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 32765, 6, 942, 2, 17904)

	-- Transmute: Skyfire Diamond -- 32766
	-- Honor Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32766, 350, 25868, 1, 2259)
	self:addTradeFlags(RecipeDB, 32766, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB, 32766, 6, 946, 2, 17657)

	-- Volatile Healing Potion -- 33732
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33732, 300, 28100, 1, 2259)
	self:addTradeFlags(RecipeDB, 33732, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 33732, 1, 16588, 1, 18802, 1, 19052)

	-- Unstable Mana Potion -- 33733
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33733, 310, 28101, 1, 2259)
	self:addTradeFlags(RecipeDB, 33733, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 33733, 1, 16588, 1, 18802, 1, 19052)

	-- Onslaught Elixir -- 33738
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33738, 300, 28102, 1, 2259)
	self:addTradeFlags(RecipeDB, 33738, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 33738, 1, 16588, 1, 18802, 1, 19052)

	-- Adept's Elixir -- 33740
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33740, 300, 28103, 1, 2259)
	self:addTradeFlags(RecipeDB, 33740, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 33740, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Mastery -- 33741
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33741, 315, 28104, 1, 2259)
	self:addTradeFlags(RecipeDB, 33741, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 33741, 1, 16588, 1, 18802, 1, 19052)

	-- Mercurial Stone -- 38070
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38070, 325, 31080, 1, 2259)
	self:addTradeFlags(RecipeDB, 38070, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 38070, 1, 16588, 1, 18802, 1, 19052)

	-- Fel Strength Elixir -- 38960
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38960, 335, 31679, 1, 2259)
	self:addTradeFlags(RecipeDB, 38960, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Fel Mana Potion -- 38961
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38961, 360, 31677, 3, 2259)
	self:addTradeFlags(RecipeDB, 38961, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 38961, 3, 19792, 3, 19795, 3, 19796, 3, 19806, 3, 20502, 3, 22016, 3, 22017, 3, 22018, 3, 22076, 3, 22093)

	-- Fel Regeneration Potion -- 38962
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38962, 345, 31676, 3, 2259)
	self:addTradeFlags(RecipeDB, 38962, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 38962, 3, 19754, 3, 19756, 3, 20878, 3, 20887)

	-- Elixir of Major Fortitude -- 39636
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39636, 310, 32062, 1, 2259)
	self:addTradeFlags(RecipeDB, 39636, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39636, 1, 16588, 1, 18802, 1, 19052)

	-- Earthen Elixir -- 39637
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39637, 320, 32063, 1, 2259)
	self:addTradeFlags(RecipeDB, 39637, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Draenic Wisdom -- 39638
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39638, 320, 32067, 1, 2259)
	self:addTradeFlags(RecipeDB, 39638, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39638, 1, 16588, 1, 18802, 1, 19052)

	-- Elixir of Ironskin -- 39639
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39639, 330, 32068, 1, 2259)
	self:addTradeFlags(RecipeDB, 39639, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Cauldron of Major Arcane Protection -- 41458
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41458, 340, 32839, 1, 2259)
	self:addTradeFlags(RecipeDB, 41458, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 41458, 8, 4)

	-- Cauldron of Major Fire Protection -- 41500
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41500, 340, 32849, 1, 2259)
	self:addTradeFlags(RecipeDB, 41500, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 41500, 8, 4)

	-- Cauldron of Major Frost Protection -- 41501
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41501, 340, 32850, 1, 2259)
	self:addTradeFlags(RecipeDB, 41501, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 41501, 8, 4)

	-- Cauldron of Major Nature Protection -- 41502
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41502, 340, 32851, 1, 2259)
	self:addTradeFlags(RecipeDB, 41502, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 41502, 8, 4)

	-- Cauldron of Major Shadow Protection -- 41503
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Discovery, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41503, 340, 32852, 1, 2259)
	self:addTradeFlags(RecipeDB, 41503, 1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 41503, 8, 4)

	-- Flask of Chromatic Wonder -- 42736
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42736, 375, 33208, 1, 2259)
	self:addTradeFlags(RecipeDB, 42736, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Mad Alchemist's Potion -- 45061
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45061, 315, 34440, 1, 2259)
	self:addTradeFlags(RecipeDB, 45061, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Guardian's Alchemist Stone -- 47046
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val54id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47046, 375, 35748, 1, 2259)
	self:addTradeFlags(RecipeDB, 47046, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,52,63,112)
	self:addTradeAcquire(RecipeDB, 47046, 6, 1077, 4, 25032)

	-- Sorcerer's Alchemist Stone -- 47048
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val63id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47048, 375, 35749, 1, 2259)
	self:addTradeFlags(RecipeDB, 47048, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,112)
	self:addTradeAcquire(RecipeDB, 47048, 6, 1077, 4, 25032)

	-- Redeemer's Alchemist Stone -- 47049
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val63id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47049, 375, 35750, 1, 2259)
	self:addTradeFlags(RecipeDB, 47049, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,112)
	self:addTradeAcquire(RecipeDB, 47049, 6, 1077, 4, 25032)

	-- Assassin's Alchemist Stone -- 47050
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val108id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47050, 375, 35751, 1, 2259)
	self:addTradeFlags(RecipeDB, 47050, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,51,63,112)
	self:addTradeAcquire(RecipeDB, 47050, 6, 1077, 4, 25032)

	-- Transmute: Eternal Life to Shadow -- 53771
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53771, 385, 35627, 2, 2259)
	self:addTradeFlags(RecipeDB, 53771, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Life to Fire -- 53773
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53773, 385, 36860, 2, 2259)
	self:addTradeFlags(RecipeDB, 53773, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Fire to Water -- 53774
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53774, 385, 35622, 2, 2259)
	self:addTradeFlags(RecipeDB, 53774, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Fire to Life -- 53775
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53775, 385, 35625, 2, 2259)
	self:addTradeFlags(RecipeDB, 53775, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Air to Water -- 53776
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53776, 385, 35622, 2, 2259)
	self:addTradeFlags(RecipeDB, 53776, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Air to Earth -- 53777
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53777, 385, 35624, 2, 2259)
	self:addTradeFlags(RecipeDB, 53777, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Shadow to Earth -- 53779
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53779, 385, 35624, 2, 2259)
	self:addTradeFlags(RecipeDB, 53779, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Shadow to Life -- 53780
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53780, 385, 35625, 2, 2259)
	self:addTradeFlags(RecipeDB, 53780, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Earth to Air -- 53781
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53781, 385, 35623, 2, 2259)
	self:addTradeFlags(RecipeDB, 53781, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Earth to Shadow -- 53782
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53782, 385, 35627, 2, 2259)
	self:addTradeFlags(RecipeDB, 53782, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Water to Air -- 53783
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53783, 385, 35623, 2, 2259)
	self:addTradeFlags(RecipeDB, 53783, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Water to Fire -- 53784
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53784, 385, 36860, 2, 2259)
	self:addTradeFlags(RecipeDB, 53784, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Pygmy Oil -- 53812
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53812, 370, 40195, 1, 2259)
	self:addTradeFlags(RecipeDB, 53812, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runic Healing Potion -- 53836
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53836, 395, 33447, 1, 2259)
	self:addTradeFlags(RecipeDB, 53836, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runic Mana Potion -- 53837
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53837, 400, 33448, 1, 2259)
	self:addTradeFlags(RecipeDB, 53837, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Resurgent Healing Potion -- 53838
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53838, 340, 39671, 1, 2259)
	self:addTradeFlags(RecipeDB, 53838, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Icy Mana Potion -- 53839
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53839, 345, 40067, 1, 2259)
	self:addTradeFlags(RecipeDB, 53839, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Agility -- 53840
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53840, 385, 39666, 1, 2259)
	self:addTradeFlags(RecipeDB, 53840, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Wrath Elixir -- 53841
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53841, 345, 40068, 1, 2259)
	self:addTradeFlags(RecipeDB, 53841, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Spellpower Elixir -- 53842
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53842, 360, 40070, 1, 2259)
	self:addTradeFlags(RecipeDB, 53842, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Spirit -- 53847
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53847, 380, 40072, 1, 2259)
	self:addTradeFlags(RecipeDB, 53847, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Guru's Elixir -- 53848
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53848, 370, 40076, 1, 2259)
	self:addTradeFlags(RecipeDB, 53848, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Crazy Alchemist's Potion -- 53895
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53895, 400, 40077, 1, 2259)
	self:addTradeFlags(RecipeDB, 53895, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Fortitude -- 53898
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53898, 385, 40078, 1, 2259)
	self:addTradeFlags(RecipeDB, 53898, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Lesser Flask of Toughness -- 53899
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53899, 370, 40079, 1, 2259)
	self:addTradeFlags(RecipeDB, 53899, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Potion of Nightmares -- 53900
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53900, 375, 40081, 1, 2259)
	self:addTradeFlags(RecipeDB, 53900, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of the Frost Wyrm -- 53901
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53901, 435, 40082, 1, 2259)
	self:addTradeFlags(RecipeDB, 53901, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Flask of Stoneblood -- 53902
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53902, 435, 40083, 1, 2259)
	self:addTradeFlags(RecipeDB, 53902, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Flask of Endless Rage -- 53903
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53903, 435, 40084, 1, 2259)
	self:addTradeFlags(RecipeDB, 53903, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Powerful Rejuvenation Potion -- 53904
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53904, 400, 40087, 1, 2259)
	self:addTradeFlags(RecipeDB, 53904, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Indestructible Potion -- 53905
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53905, 400, 40093, 1, 2259)
	self:addTradeFlags(RecipeDB, 53905, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mighty Arcane Protection Potion -- 53936
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53936, 400, 40213, 1, 2259)
	self:addTradeFlags(RecipeDB, 53936, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mighty Frost Protection Potion -- 53937
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53937, 400, 40215, 1, 2259)
	self:addTradeFlags(RecipeDB, 53937, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mighty Shadow Protection Potion -- 53938
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53938, 400, 40217, 1, 2259)
	self:addTradeFlags(RecipeDB, 53938, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mighty Fire Protection Potion -- 53939
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53939, 400, 40214, 1, 2259)
	self:addTradeFlags(RecipeDB, 53939, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mighty Nature Protection Potion -- 53942
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 53942, 400, 40216, 1, 2259)
	self:addTradeFlags(RecipeDB, 53942, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Might -- 54020
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 54020, 430, 40248, 1, 2259)
	self:addTradeFlags(RecipeDB, 54020, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of Pure Mojo -- 54213
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 54213, 435, 40404, 1, 2259)
	self:addTradeFlags(RecipeDB, 54213, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Mighty Strength -- 54218
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 54218, 380, 40073, 1, 2259)
	self:addTradeFlags(RecipeDB, 54218, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Protection -- 54220
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 54220, 400, 40097, 1, 2259)
	self:addTradeFlags(RecipeDB, 54220, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Potion of Speed -- 54221
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 54221, 400, 40211, 1, 2259)
	self:addTradeFlags(RecipeDB, 54221, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Potion of Wild Magic -- 54222
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 54222, 400, 40212, 1, 2259)
	self:addTradeFlags(RecipeDB, 54222, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Mageblood -- 56519
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 56519, 400, 40109, 1, 2259)
	self:addTradeFlags(RecipeDB, 56519, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Transmute: Skyflare Diamond -- 57425
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57425, 430, 41266, 3, 2259)
	self:addTradeFlags(RecipeDB, 57425, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Earthsiege Diamond -- 57427
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 57427, 425, 41334, 3, 2259)
	self:addTradeFlags(RecipeDB, 57427, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Endless Mana Potion -- 58868
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58868, 410, 43570, 1, 2259)
	self:addTradeFlags(RecipeDB, 58868, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Endless Healing Potion -- 58871
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 58871, 405, 43569, 1, 2259)
	self:addTradeFlags(RecipeDB, 58871, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Transmute: Titanium -- 60350
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60350, 400, 41163, 2, 2259)
	self:addTradeFlags(RecipeDB, 60350, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Accuracy -- 60354
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60354, 400, 44325, 1, 2259)
	self:addTradeFlags(RecipeDB, 60354, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Deadly Strikes -- 60355
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60355, 400, 44327, 1, 2259)
	self:addTradeFlags(RecipeDB, 60355, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Mighty Defense -- 60356
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60356, 400, 44328, 1, 2259)
	self:addTradeFlags(RecipeDB, 60356, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Expertise -- 60357
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60357, 400, 44329, 1, 2259)
	self:addTradeFlags(RecipeDB, 60357, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Armor Piercing -- 60365
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60365, 400, 44330, 1, 2259)
	self:addTradeFlags(RecipeDB, 60365, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Lightning Speed -- 60366
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60366, 400, 44331, 1, 2259)
	self:addTradeFlags(RecipeDB, 60366, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Elixir of Mighty Thoughts -- 60367
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60367, 385, 44332, 1, 2259)
	self:addTradeFlags(RecipeDB, 60367, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Mercurial Alchemist Stone -- 60396
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val50id46val59id49
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60396, 400, 44322, 3, 2259)
	self:addTradeFlags(RecipeDB, 60396, 3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	-- No acquire information

	-- Indestructible Alchemist Stone -- 60403
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val75id3val50id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60403, 400, 44323, 3, 2259)
	self:addTradeFlags(RecipeDB, 60403, 3,21,22,23,24,25,26,27,28,29,30,37,41,47,52,63)
	-- No acquire information

	-- Mighty Alchemist Stone -- 60405
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val50id44val100id48
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 60405, 400, 44324, 3, 2259)
	self:addTradeFlags(RecipeDB, 60405, 3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	-- No acquire information


	return recipecount

end
