--[[

************************************************************************

ARL-Enchant.lua

Enchanting data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
276 found from data mining.
2 ignored.
55 WotLK ignored.

************************************************************************

File date: 2008-11-03T22:59:33Z 
File revision: 1017 
Project revision: 1020
Project version: r1020

************************************************************************

Format:

	self:addTradeSkill(RecipeDB, Spell ID, Skill Level, Item ID, Rarity, Specialty)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitEnchanting(RecipeDB)

	local recipecount = 0

	-- Enchant Chest - Major Health -- 20026
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20026, 255, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20026, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20026, 2, 11189)

	-- Enchant Bracer - Minor Health -- 7418
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7418, 30, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7418, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Minor Health -- 7420
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7420, 30, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7420, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7420, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Runed Copper Rod -- 7421
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7421, 1, 6218, 1, 7411)
	self:addTradeFlags(RecipeDB, 7421, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Enchant Chest - Minor Absorption -- 7426
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7426, 50, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7426, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7426, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Minor Deflection -- 7428
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7428, 40, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7428, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Minor Mana -- 7443
	-- World Drop
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7443, 20, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7443, 1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7443, 7, 2, 2, 1318, 2, 3012, 2, 3346, 2, 4228, 2, 4617, 2, 5158, 2, 5757, 2, 5758, 2, 15198, 2, 15419, 2, 16635, 2, 16722, 2, 18753, 2, 18773, 2, 18951, 2, 19234, 2, 19537, 2, 19540, 2, 19663)

	-- Enchant Cloak - Minor Resistance -- 7454
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7454, 55, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7454, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 7454, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Minor Stamina -- 7457
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7457, 60, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7457, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7457, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant 2H Weapon - Minor Impact -- 7745
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7745, 90, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7745, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7745, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Chest - Lesser Health -- 7748
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7748, 65, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7748, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7748, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Minor Spirit -- 7766
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7766, 60, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7766, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7766, 7, 2)

	-- Enchant Cloak - Minor Protection -- 7771
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7771, 90, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7771, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 7771, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Chest - Lesser Mana -- 7776
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7776, 80, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7776, 2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7776, 2, 3346, 2, 5757)

	-- Enchant Bracer - Minor Agility -- 7779
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7779, 75, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7779, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7779, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Minor Strength -- 7782
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7782, 80, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7782, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7782, 7, 2)

	-- Enchant Weapon - Minor Beastslayer -- 7786
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7786, 90, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7786, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7786, 7, 2)

	-- Enchant Weapon - Minor Striking -- 7788
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7788, 80, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7788, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7788, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant 2H Weapon - Lesser Intellect -- 7793
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7793, 100, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7793, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7793, 2, 3012, 2, 3346, 2, 5158, 2, 5758)

	-- Runed Silver Rod -- 7795
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7795, 90, 6339, 1, 7411)
	self:addTradeFlags(RecipeDB, 7795, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 7795, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Chest - Health -- 7857
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7857, 105, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7857, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7857, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Lesser Spirit -- 7859
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7859, 120, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7859, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7859, 7, 2)

	-- Enchant Cloak - Lesser Fire Resistance -- 7861
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7861, 110, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7861, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 7861, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Boots - Minor Stamina -- 7863
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7863, 125, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7863, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7863, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Boots - Minor Agility -- 7867
	-- Instance: 2367 - type5minlevel66maxlevel68category3territory1nameCaverns of Time: Old Hillsbrad Foothillsexpansion1id2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 7867, 125, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 7867, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 7867, 2, 3012, 2, 3537)

	-- Enchant Shield - Minor Stamina -- 13378
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13378, 90, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13378, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13378, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant 2H Weapon - Lesser Spirit -- 13380
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13380, 110, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13380, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13380, 7, 2)

	-- Enchant Cloak - Minor Agility -- 13419
	-- World Drop
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13419, 110, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13419, 1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13419, 7, 2, 2, 3954, 2, 12043)

	-- Enchant Cloak - Lesser Protection -- 13421
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13421, 100, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13421, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13421, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Shield - Lesser Protection -- 13464
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13464, 115, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13464, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13464, 7, 2)

	-- Enchant Shield - Lesser Spirit -- 13485
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13485, 115, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13485, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13485, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Lesser Stamina -- 13501
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13501, 115, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13501, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13501, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Weapon - Lesser Striking -- 13503
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13503, 125, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13503, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13503, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Cloak - Lesser Shadow Resistance -- 13522
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13522, 135, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13522, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13522, 7, 2)

	-- Enchant 2H Weapon - Lesser Impact -- 13529
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13529, 130, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13529, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13529, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Bracer - Lesser Strength -- 13536
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13536, 140, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13536, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13536, 2, 3954, 2, 12043)

	-- Enchant Chest - Lesser Absorption -- 13538
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13538, 125, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13538, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13538, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Chest - Mana -- 13607
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13607, 130, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13607, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13607, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Gloves - Mining -- 13612
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13612, 145, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13612, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13612, 3, 1051, 3, 1052, 3, 1053, 3, 1054, 3, 1364)

	-- Enchant Gloves - Herbalism -- 13617
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13617, 145, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13617, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13617, 3, 3834, 3, 3919, 3, 4028, 3, 4029, 3, 4030)

	-- Enchant Gloves - Fishing -- 13620
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13620, 145, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13620, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13620, 3, 2374, 3, 2375, 3, 2376, 3, 2377, 3, 14276)

	-- Enchant Bracer - Lesser Intellect -- 13622
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13622, 135, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13622, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13622, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Chest - Minor Stats -- 13626
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13626, 135, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13626, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13626, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Runed Golden Rod -- 13628
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13628, 135, 11130, 1, 7411)
	self:addTradeFlags(RecipeDB, 13628, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 13628, 1, 1317, 1, 3011, 1, 3345, 1, 4213, 1, 4616, 1, 5157, 1, 7949, 1, 11072, 1, 11073, 1, 11074, 1, 16633, 1, 16725, 1, 19249, 1, 19250, 1, 19251)

	-- Enchant Shield - Lesser Stamina -- 13631
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13631, 135, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13631, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13631, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Cloak - Defense -- 13635
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13635, 135, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13635, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13635, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Boots - Lesser Agility -- 13637
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13637, 140, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13637, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13637, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Chest - Greater Health -- 13640
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13640, 140, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13640, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13640, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Bracer - Spirit -- 13642
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13642, 145, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13642, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13642, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Boots - Lesser Stamina -- 13644
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13644, 150, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13644, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13644, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Bracer - Lesser Deflection -- 13646
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13646, 170, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13646, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13646, 2, 2381, 2, 2821)

	-- Enchant Bracer - Stamina -- 13648
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13648, 150, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13648, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13648, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Weapon - Lesser Beastslayer -- 13653
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13653, 175, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13653, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13653, 7, 2)

	-- Enchant Weapon - Lesser Elemental Slayer -- 13655
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13655, 175, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13655, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13655, 7, 2)

	-- Enchant Cloak - Fire Resistance -- 13657
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13657, 155, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13657, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13657, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Shield - Spirit -- 13659
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13659, 160, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13659, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13659, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Bracer - Strength -- 13661
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13661, 160, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13661, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13661, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Chest - Greater Mana -- 13663
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13663, 165, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13663, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13663, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Boots - Lesser Spirit -- 13687
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13687, 190, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13687, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13687, 7, 2)

	-- Enchant Shield - Lesser Block -- 13689
	-- Instance: 796 - type1minlevel34maxlevel45category3territory4nameScarlet Monasteryid796
	-- Instance: 796 - type1minlevel34maxlevel45category3territory4nameScarlet Monasteryid796
	-- Instance: 722 - type1minlevel33maxlevel40category3territory4nameRazorfen Downsid722
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13689, 195, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13689, 5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13689, 3, 682, 3, 2248, 3, 2551, 3, 2561, 3, 4294, 3, 4295, 3, 4411, 3, 7349)

	-- Enchant Weapon - Striking -- 13693
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13693, 175, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13693, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13693, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant 2H Weapon - Impact -- 13695
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13695, 180, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13695, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13695, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Gloves - Skinning -- 13698
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13698, 200, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13698, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13698, 3, 2556, 3, 2557, 3, 2558, 3, 2605, 3, 2606)

	-- Enchant Chest - Lesser Stats -- 13700
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13700, 180, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13700, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13700, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Runed Truesilver Rod -- 13702
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13702, 180, 11145, 1, 7411)
	self:addTradeFlags(RecipeDB, 13702, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 13702, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Cloak - Greater Defense -- 13746
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13746, 185, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13746, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13746, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Cloak - Resistance -- 13794
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13794, 185, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13794, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13794, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Gloves - Agility -- 13815
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13815, 190, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13815, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13815, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Shield - Stamina -- 13817
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13817, 210, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13817, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13817, 7, 2)

	-- Enchant Bracer - Intellect -- 13822
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13822, 190, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13822, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13822, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Boots - Stamina -- 13836
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13836, 195, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13836, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13836, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Gloves - Advanced Mining -- 13841
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13841, 215, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13841, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13841, 3, 674)

	-- Enchant Bracer - Greater Spirit -- 13846
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13846, 220, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13846, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13846, 7, 2)

	-- Enchant Chest - Superior Health -- 13858
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13858, 200, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13858, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13858, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Gloves - Advanced Herbalism -- 13868
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13868, 225, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13868, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13868, 3, 764, 3, 765, 3, 766, 3, 1081, 3, 14448)

	-- Enchant Cloak - Lesser Agility -- 13882
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13882, 225, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13882, 11,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 13882, 3, 2246, 3, 5623, 3, 7805)

	-- Enchant Gloves - Strength -- 13887
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13887, 205, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13887, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13887, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Boots - Minor Speed -- 13890
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13890, 205, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13890, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13890, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Enchant Weapon - Fiery Weapon -- 13898
	-- Instance: 1584 - type1minlevel55maxlevel60category3territory1nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13898, 265, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13898, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13898, 3, 9024)

	-- Enchant Shield - Greater Spirit -- 13905
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13905, 210, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13905, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13905, 1, 11073, 1, 19251)

	-- Enchant Weapon - Demonslaying -- 13915
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13915, 230, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13915, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13915, 7, 2)

	-- Enchant Chest - Superior Mana -- 13917
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13917, 210, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13917, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13917, 1, 11073, 1, 19251)

	-- Enchant Bracer - Deflection -- 13931
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13931, 235, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13931, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13931, 2, 989, 2, 4229)

	-- Enchant Shield - Frost Resistance -- 13933
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13933, 235, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13933, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13933, 7, 2)

	-- Enchant Boots - Agility -- 13935
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13935, 215, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13935, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13935, 1, 11073, 1, 19251)

	-- Enchant 2H Weapon - Greater Impact -- 13937
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13937, 220, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13937, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13937, 1, 11073, 1, 19251)

	-- Enchant Bracer - Greater Strength -- 13939
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13939, 220, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13939, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13939, 1, 11073, 1, 19251)

	-- Enchant Chest - Stats -- 13941
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13941, 225, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13941, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13941, 1, 11073, 1, 19251)

	-- Enchant Weapon - Greater Striking -- 13943
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13943, 225, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13943, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13943, 1, 11073, 1, 19251)

	-- Enchant Bracer - Greater Stamina -- 13945
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13945, 245, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13945, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13945, 7, 2)

	-- Enchant Gloves - Riding Skill -- 13947
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13947, 250, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13947, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13947, 7, 2)

	-- Enchant Gloves - Minor Haste -- 13948
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 13948, 230, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 13948, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 13948, 1, 11073, 1, 19251)

	-- Lesser Magic Wand -- 14293
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Wand, 
	-- Item Stats: 
	-- Item Stats: val12-22id14val1.5id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14293, 35, 11287, 1, 7411)
	self:addTradeFlags(RecipeDB, 14293, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB, 14293, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Greater Magic Wand -- 14807
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Wand, 
	-- Item Stats: 
	-- Item Stats: val22-41id14val1.8id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14807, 70, 11288, 1, 7411)
	self:addTradeFlags(RecipeDB, 14807, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB, 14807, 1, 1317, 1, 3011, 1, 3345, 1, 3606, 1, 4213, 1, 4616, 1, 5157, 1, 5695, 1, 11065, 1, 11066, 1, 11067, 1, 11068, 1, 11070, 1, 11071, 1, 11072, 1, 11073, 1, 11074, 1, 16160, 1, 16633, 1, 16634, 1, 16725, 1, 16742, 1, 19248, 1, 19249, 1, 19250, 1, 19251)

	-- Lesser Mystic Wand -- 14809
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Wand, 
	-- Item Stats: 
	-- Item Stats: val23-43id14val1.3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14809, 135, 11289, 1, 7411)
	self:addTradeFlags(RecipeDB, 14809, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB, 14809, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Greater Mystic Wand -- 14810
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Weapon, Wand, 
	-- Item Stats: 
	-- Item Stats: val40-76id14val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 14810, 155, 11290, 1, 7411)
	self:addTradeFlags(RecipeDB, 14810, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB, 14810, 1, 11072, 1, 11073, 1, 11074, 1, 19250, 1, 19251)

	-- Smoking Heart of the Mountain -- 15596
	-- Instance: 1584 - type1minlevel55maxlevel60category3territory1nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val150id6val7id33val7id34val7id35val7id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 15596, 265, 11811, 2, 7411)
	self:addTradeFlags(RecipeDB, 15596, 5,11,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 15596, 3, 9025, 3, 9026)

	-- Enchanted Thorium -- 17180
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17180, 240, 12655, 1, 7411)
	self:addTradeFlags(RecipeDB, 17180, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 17180, 1, 11073, 1, 19251)

	-- Enchanted Leather -- 17181
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 17181, 240, 12810, 1, 7411)
	self:addTradeFlags(RecipeDB, 17181, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 17181, 1, 11073, 1, 19251)

	-- Enchant Bracer - Greater Intellect -- 20008
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20008, 255, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20008, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20008, 3, 2642, 1, 11073, 1, 19251)

	-- Enchant Bracer - Superior Spirit -- 20009
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20009, 270, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20009, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20009, 7, 2)

	-- Enchant Bracer - Superior Strength -- 20010
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20010, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20010, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20010, 3, 7372)

	-- Enchant Bracer - Superior Stamina -- 20011
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20011, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20011, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20011, 7, 2)

	-- Enchant Gloves - Greater Agility -- 20012
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20012, 270, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20012, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20012, 3, 6201, 1, 11073, 1, 19251)

	-- Enchant Gloves - Greater Strength -- 20013
	-- Trainer
	-- Instance: 1583 - type1minlevel58maxlevel60category3territory1nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20013, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20013, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20013, 3, 9198, 1, 11073, 1, 19251)

	-- Enchant Cloak - Greater Resistance -- 20014
	-- Trainer
	-- Instance: 1477 - type1minlevel50maxlevel55category3territory1nameThe Temple of Atal'Hakkarid1477
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20014, 265, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20014, 1,2,3,5,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 20014, 3, 5259, 1, 11073, 1, 19251)

	-- Enchant Cloak - Superior Defense -- 20015
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20015, 285, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20015, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 20015, 2, 12022)

	-- Enchant Shield - Superior Spirit -- 20016
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20016, 280, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20016, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20016, 3, 9447, 1, 11073, 1, 19251)

	-- Enchant Shield - Greater Stamina -- 20017
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20017, 265, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20017, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 20017, 2, 4229, 2, 4561)

	-- Enchant Boots - Greater Stamina -- 20020
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20020, 260, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20020, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20020, 7, 2)

	-- Enchant Boots - Greater Agility -- 20023
	-- Trainer
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20023, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20023, 1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20023, 7, 2, 1, 11073, 1, 19251)

	-- Enchant Boots - Spirit -- 20024
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20024, 275, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20024, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20024, 7, 2)

	-- Enchant Chest - Greater Stats -- 20025
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20025, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20025, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20025, 7, 2)

	-- Enchant Chest - Major Mana -- 20028
	-- Trainer
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20028, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20028, 1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20028, 3, 9452, 1, 11073, 1, 19251)

	-- Enchant Weapon - Icy Chill -- 20029
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20029, 285, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20029, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20029, 3, 7524)

	-- Enchant 2H Weapon - Superior Impact -- 20030
	-- Instance: 1583 - type1minlevel58maxlevel60category3territory1nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20030, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20030, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20030, 3, 10317)

	-- Enchant Weapon - Superior Striking -- 20031
	-- Instance: 1583 - type1minlevel58maxlevel60category3territory1nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20031, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20031, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20031, 3, 9216)

	-- Enchant Weapon - Lifestealing -- 20032
	-- Instance: 2057 - type1minlevel58maxlevel60category3territory1nameScholomanceid2057
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20032, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20032, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20032, 3, 10499)

	-- Enchant Weapon - Unholy Weapon -- 20033
	-- Instance: 2017 - type1minlevel58maxlevel60category3territory1nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20033, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20033, 5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20033, 3, 10398, 3, 16810)

	-- Enchant Weapon - Crusader -- 20034
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20034, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20034, 11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20034, 3, 4494, 3, 9451)

	-- Enchant 2H Weapon - Major Spirit -- 20035
	-- Instance: 2057 - type1minlevel58maxlevel60category3territory1nameScholomanceid2057
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20035, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20035, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20035, 3, 10469)

	-- Enchant 2H Weapon - Major Intellect -- 20036
	-- Instance: 2017 - type1minlevel58maxlevel60category3territory1nameStratholmeid2017
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20036, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20036, 5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20036, 3, 10422)

	-- Runed Arcanite Rod -- 20051
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20051, 290, 16207, 1, 7411)
	self:addTradeFlags(RecipeDB, 20051, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 20051, 2, 12022)

	-- Enchant Weapon - Winter's Might -- 21931
	-- Flags: All classes, Item BoE, Recipe BoE, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 21931, 190, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 21931, 7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 21931, 5, 1)

	-- Charged Scale of Onyxia -- 22434
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 22434, 330, 17968, 3, 7411)
	--self:addTradeFlags(RecipeDB, 22434, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Spell Power -- 22749
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22749, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 22749, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22749, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Enchant Weapon - Healing Power -- 22750
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Raid: 2717 - Molten Core
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22750, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 22750, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 22750, 3, 11982, 3, 11988, 3, 12056, 3, 12057, 3, 12118, 3, 12259, 3, 12264)

	-- Enchant Weapon - Strength -- 23799
	-- Instance: 1584 - type1minlevel55maxlevel60category3territory1nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23799, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 23799, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 23799, 2, 12944)

	-- Enchant Weapon - Agility -- 23800
	-- Timbermaw Hold - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23800, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 23800, 4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB, 23800, 6, 576, 2, 11557)

	-- Enchant Bracer - Mana Regeneration -- 23801
	-- Argent Dawn - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23801, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 23801, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB, 23801, 6, 529, 2, 10856, 6, 529, 2, 10857, 6, 529, 2, 11536)

	-- Enchant Bracer - Healing Power -- 23802
	-- Argent Dawn - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23802, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 23802, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB, 23802, 6, 529, 3, 10856, 6, 529, 3, 10857, 6, 529, 3, 11536)

	-- Enchant Weapon - Mighty Spirit -- 23803
	-- Instance: 1584 - type1minlevel55maxlevel60category3territory1nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23803, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 23803, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 23803, 2, 12944)

	-- Enchant Weapon - Mighty Intellect -- 23804
	-- Instance: 1584 - type1minlevel55maxlevel60category3territory1nameBlackrock Depthsid1584
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 23804, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 23804, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 23804, 2, 12944)

	-- Enchant Gloves - Threat -- 25072
	-- Raid: 3428 - Ahn'Qiraj
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25072, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25072, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25072, 3, 15275)

	-- Enchant Gloves - Shadow Power -- 25073
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25073, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25073, 10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25073, 7, 3)

	-- Enchant Gloves - Frost Power -- 25074
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25074, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25074, 10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25074, 7, 3)

	-- Enchant Gloves - Fire Power -- 25078
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25078, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25078, 10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25078, 7, 3)

	-- Enchant Gloves - Healing Power -- 25079
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25079, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25079, 10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25079, 7, 3)

	-- Enchant Gloves - Superior Agility -- 25080
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25080, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25080, 10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25080, 7, 3)

	-- Enchant Cloak - Greater Fire Resistance -- 25081
	-- Cenarion Circle - Friendly
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25081, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25081, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,97)
	self:addTradeAcquire(RecipeDB, 25081, 6, 609, 1, 15198, 6, 609, 1, 15419)

	-- Enchant Cloak - Greater Nature Resistance -- 25082
	-- Cenarion Circle - Honored
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25082, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25082, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,97)
	self:addTradeAcquire(RecipeDB, 25082, 6, 609, 2, 15198, 6, 609, 2, 15419)

	-- Enchant Cloak - Stealth -- 25083
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25083, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25083, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 25083, 7, 3)

	-- Enchant Cloak - Subtlety -- 25084
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25084, 280, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25084, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Cloak - Dodge -- 25086
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25086, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 25086, 10,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 25086, 7, 3)

	-- Minor Wizard Oil -- 25124
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25124, 45, 20744, 1, 7411)
	self:addTradeFlags(RecipeDB, 25124, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25124, 2, 1318, 2, 3012, 2, 3346, 2, 4228, 2, 4617, 2, 5158, 2, 5757, 2, 5758, 2, 15198, 2, 15419, 2, 16635, 2, 16722, 2, 18753, 2, 18773, 2, 18951, 2, 19234, 2, 19537, 2, 19540, 2, 19663)

	-- Minor Mana Oil -- 25125
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25125, 150, 20745, 1, 7411)
	self:addTradeFlags(RecipeDB, 25125, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25125, 2, 1318, 2, 3012, 2, 3346, 2, 4228, 2, 4617, 2, 5158, 2, 5757, 2, 5758, 2, 15198, 2, 15419, 2, 16635, 2, 16722, 2, 18753, 2, 18773, 2, 18951, 2, 19234, 2, 19537, 2, 19540, 2, 19663)

	-- Lesser Wizard Oil -- 25126
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25126, 200, 20746, 1, 7411)
	self:addTradeFlags(RecipeDB, 25126, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25126, 2, 1318, 2, 3012, 2, 3346, 2, 4228, 2, 4617, 2, 5158, 2, 5757, 2, 5758, 2, 15198, 2, 15419, 2, 16635, 2, 16722, 2, 18753, 2, 18773, 2, 18951, 2, 19234, 2, 19537, 2, 19540, 2, 19663)

	-- Lesser Mana Oil -- 25127
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25127, 250, 20747, 1, 7411)
	self:addTradeFlags(RecipeDB, 25127, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25127, 2, 15198, 2, 15419)

	-- Wizard Oil -- 25128
	-- No location information
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25128, 275, 20750, 1, 7411)
	self:addTradeFlags(RecipeDB, 25128, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 25128, 2, 15198, 2, 15419)

	-- Brilliant Wizard Oil -- 25129
	-- Zandalar Tribe - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25129, 300, 20749, 1, 7411)
	self:addTradeFlags(RecipeDB, 25129, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB, 25129, 6, 270, 2, 14921)

	-- Brilliant Mana Oil -- 25130
	-- Zandalar Tribe - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25130, 300, 20748, 1, 7411)
	self:addTradeFlags(RecipeDB, 25130, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB, 25130, 6, 270, 1, 14921)

	-- Enchant 2H Weapon - Agility -- 27837
	-- Timbermaw Hold - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27837, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27837, 4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB, 27837, 6, 576, 1, 11557)

	-- Enchant Bracer - Brawn -- 27899
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27899, 285, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27899, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27899, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Bracer - Stats -- 27905
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27905, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27905, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27905, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Bracer - Major Defense -- 27906
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27906, 320, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27906, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27906, 3, 20456, 3, 22822)

	-- Enchant Bracer - Superior Healing -- 27911
	-- Honor Hold - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27911, 325, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27911, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB, 27911, 6, 946, 1, 17657)

	-- Enchant Bracer - Restore Mana Prime -- 27913
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27913, 335, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27913, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27913, 7, 2)

	-- Enchant Bracer - Fortitude -- 27914
	-- Instance: 3715 - type5minlevel70category3territory1nameCoilfang Reservoir: The Steamvaultexpansion1id3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27914, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27914, 5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27914, 3, 17803)

	-- Enchant Bracer - Spellpower -- 27917
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27917, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27917, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27917, 3, 19952)

	-- Enchant Ring - Striking -- 27920
	-- The Consortium - Revered
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27920, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27920, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,63,105)
	self:addTradeAcquire(RecipeDB, 27920, 6, 933, 3, 17518)

	-- Enchant Ring - Spellpower -- 27924
	-- Keepers of Time - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27924, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27924, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,106)
	self:addTradeAcquire(RecipeDB, 27924, 6, 989, 2, 21643)

	-- Enchant Ring - Healing Power -- 27926
	-- The Sha'tar - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27926, 370, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27926, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,111)
	self:addTradeAcquire(RecipeDB, 27926, 6, 935, 3, 21432)

	-- Enchant Ring - Stats -- 27927
	-- Lower City - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27927, 375, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27927, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,107)
	self:addTradeAcquire(RecipeDB, 27927, 6, 1011, 2, 21655)

	-- Enchant Shield - Tough Shield -- 27944
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27944, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27944, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27944, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Shield - Intellect -- 27945
	-- Instance: 2367 - type5minlevel66maxlevel68category3territory1nameCaverns of Time: Old Hillsbrad Foothillsexpansion1id2367
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27945, 325, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27945, 1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27945, 2, 18664)

	-- Enchant Shield - Shield Block -- 27946
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27946, 340, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27946, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27946, 7, 2)

	-- Enchant Shield - Resistance -- 27947
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27947, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27947, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27947, 7, 2)

	-- Enchant Boots - Vitality -- 27948
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27948, 305, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27948, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27948, 7, 2)

	-- Enchant Boots - Fortitude -- 27950
	-- Instance: 3792 - type5minlevel64maxlevel66category3territory1nameAuchindoun: Mana-Tombsexpansion1id3792
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27950, 320, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27950, 5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27950, 3, 18317)

	-- Enchant Boots - Dexterity -- 27951
	-- Instance: 3790 - type5minlevel65maxlevel67category3territory1nameAuchindoun: Auchenai Cryptsexpansion1id3790
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27951, 340, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27951, 5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27951, 3, 18521)

	-- Enchant Boots - Surefooted -- 27954
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27954, 370, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27954, 6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27954, 3, 16472)

	-- Enchant Chest - Exceptional Health -- 27957
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27957, 295, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27957, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27957, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Chest - Exceptional Mana -- 27958
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 27958, 305, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 27958, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Exceptional Stats -- 27960
	-- Honor Hold - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27960, 345, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27960, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB, 27960, 6, 946, 3, 17657)

	-- Enchant Cloak - Major Armor -- 27961
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27961, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27961, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 27961, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Cloak - Major Resistance -- 27962
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27962, 330, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27962, 10,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 27962, 7, 2)

	-- Enchant Weapon - Major Striking -- 27967
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27967, 340, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27967, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 27967, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Enchant Weapon - Major Intellect -- 27968
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27968, 340, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27968, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27968, 3, 20136)

	-- Enchant 2H Weapon - Savagery -- 27971
	-- Instance: 3714 - type5minlevel70category3territory1nameHellfire Citadel: The Shattered Hallsexpansion1id3714
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27971, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27971, 5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27971, 3, 17465)

	-- Enchant Weapon - Potency -- 27972
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27972, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27972, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 27972, 7, 2)

	-- Enchant Weapon - Major Spellpower -- 27975
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27975, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27975, 11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27975, 3, 20614, 3, 22242, 3, 22243)

	-- Enchant 2H Weapon - Major Agility -- 27977
	-- Instance: 3848 - type5minlevel70category3territory1nameTempest Keep: The Arcatrazexpansion1id3848
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27977, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27977, 5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27977, 3, 20880)

	-- Enchant Weapon - Sunfire -- 27981
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27981, 375, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27981, 6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27981, 3, 16524)

	-- Enchant Weapon - Soulfrost -- 27982
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27982, 375, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27982, 6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27982, 3, 15688)

	-- Enchant Weapon - Mongoose -- 27984
	-- Raid: 3457 - Karazhan
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 27984, 375, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 27984, 6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 27984, 3, 15687)

	-- Enchant Weapon - Spellsurge -- 28003
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28003, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 28003, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28003, 7, 2)

	-- Enchant Weapon - Battlemaster -- 28004
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28004, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 28004, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28004, 7, 2)

	-- Superior Mana Oil -- 28016
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28016, 310, 22521, 1, 7411)
	self:addTradeFlags(RecipeDB, 28016, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28016, 2, 16635, 2, 16722, 2, 19663)

	-- Superior Wizard Oil -- 28019
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28019, 340, 22522, 1, 7411)
	self:addTradeFlags(RecipeDB, 28019, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28019, 2, 16635, 2, 16722, 2, 19663)

	-- Arcane Dust -- 28021
	-- Trainer
	-- Flags: All classes, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 28021, 315, 22445, 1, 7411)
	--self:addTradeFlags(RecipeDB, 28021, 3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Large Prismatic Shard -- 28022
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28022, 335, 22449, 1, 7411)
	self:addTradeFlags(RecipeDB, 28022, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28022, 2, 16635, 2, 16722, 2, 19663)

	-- Prismatic Sphere -- 28027
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val3id32val3id33val3id34val3id35val3id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28027, 315, 22460, 1, 7411)
	self:addTradeFlags(RecipeDB, 28027, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28027, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Void Sphere -- 28028
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val4id32val4id33val4id34val4id35val4id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28028, 330, 22459, 1, 7411)
	self:addTradeFlags(RecipeDB, 28028, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 28028, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Runed Fel Iron Rod -- 32664
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32664, 280, 22461, 1, 7411)
	self:addTradeFlags(RecipeDB, 32664, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32664, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Runed Adamantite Rod -- 32665
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32665, 350, 22462, 1, 7411)
	self:addTradeFlags(RecipeDB, 32665, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32665, 2, 18960, 2, 19004)

	-- Runed Eternium Rod -- 32667
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32667, 375, 22463, 1, 7411)
	self:addTradeFlags(RecipeDB, 32667, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32667, 2, 19663)

	-- Enchant Chest - Major Spirit -- 33990
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33990, 300, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33990, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33990, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Chest - Restore Mana Prime -- 33991
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33991, 280, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33991, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33991, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Chest - Major Resilience -- 33992
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33992, 345, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33992, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33992, 7, 2)

	-- Enchant Gloves - Blasting -- 33993
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33993, 285, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33993, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33993, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Gloves - Spell Strike -- 33994
	-- Cenarion Expedition - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33994, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33994, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB, 33994, 6, 942, 3, 17904)

	-- Enchant Gloves - Major Strength -- 33995
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33995, 320, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33995, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33995, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Gloves - Assault -- 33996
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33996, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33996, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 33996, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Gloves - Major Spellpower -- 33997
	-- Keepers of Time - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33997, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33997, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB, 33997, 6, 989, 2, 21643)

	-- Enchant Gloves - Major Healing -- 33999
	-- The Sha'tar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 33999, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 33999, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB, 33999, 6, 935, 2, 21432)

	-- Enchant Bracer - Major Intellect -- 34001
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34001, 285, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34001, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34001, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Bracer - Assault -- 34002
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34002, 280, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34002, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34002, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Cloak - Spell Penetration -- 34003
	-- The Consortium - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34003, 325, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34003, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,105)
	self:addTradeAcquire(RecipeDB, 34003, 6, 933, 1, 20242, 6, 933, 1, 23007)

	-- Enchant Cloak - Greater Agility -- 34004
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34004, 290, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34004, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB, 34004, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Cloak - Greater Arcane Resistance -- 34005
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34005, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34005, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 34005, 3, 19796)

	-- Enchant Cloak - Greater Shadow Resistance -- 34006
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34006, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34006, 11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 34006, 3, 18870)

	-- Enchant Boots - Cat's Swiftness -- 34007
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34007, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34007, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34007, 7, 3)

	-- Enchant Boots - Boar's Speed -- 34008
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34008, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34008, 10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34008, 7, 3)

	-- Enchant Shield - Major Stamina -- 34009
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34009, 325, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34009, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34009, 2, 19663)

	-- Enchant Weapon - Major Healing -- 34010
	-- The Sha'tar - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34010, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 34010, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB, 34010, 6, 935, 3, 21432)

	-- Nexus Transformation -- 42613
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42613, 285, 22448, 1, 7411)
	self:addTradeFlags(RecipeDB, 42613, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 42613, 1, 18753, 1, 18773, 1, 19252)

	-- Small Prismatic Shard -- 42615
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42615, 295, 22448, 1, 7411)
	self:addTradeFlags(RecipeDB, 42615, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 42615, 1, 18753, 1, 18773, 1, 19252, 1, 19540)

	-- Enchant Weapon - Greater Agility -- 42620
	-- The Violet Eye - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42620, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 42620, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,114)
	self:addTradeAcquire(RecipeDB, 42620, 6, 967, 4, 18255)

	-- Enchant Weapon - Executioner -- 42974
	-- Raid: 3805 - Zul'Aman
	-- Raid: 3805 - Zul'Aman
	-- No location information
	-- No location information
	-- Raid: 3805 - Zul'Aman
	-- Raid: 3805 - Zul'Aman
	-- Raid: 3805 - Zul'Aman
	-- Raid: 3805 - Zul'Aman
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42974, 375, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 42974, 6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 42974, 3, 23574, 3, 23576, 3, 23577, 3, 23578, 3, 23863, 3, 24144, 3, 24239, 3, 24363)

	-- Enchant Shield - Resilience -- 44383
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44383, 310, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 44383, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Frost Resistance -- 44483
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44483, 340, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44483, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Expertise -- 44484
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44484, 340, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44484, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Greater Spell Strike -- 44488
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44488, 345, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44488, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Shield - Defense -- 44489
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44489, 345, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44489, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Major Health -- 44492
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44492, 345, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44492, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Nature Resistance -- 44494
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44494, 345, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44494, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Weapon - Exceptional Striking -- 44496
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44496, 345, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44496, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Exceptional Intellect -- 44497
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44497, 345, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44497, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Agility -- 44500
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44500, 350, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44500, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Gatherer -- 44506
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44506, 350, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44506, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Greater Spirit -- 44508
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44508, 350, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44508, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Greater Mana Restoration -- 44509
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44509, 355, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44509, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Exceptional Spirit -- 44510
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44510, 355, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44510, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Greater Assault -- 44513
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44513, 365, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44513, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Icebreaker -- 44524
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44524, 365, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44524, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Greater Fortitude -- 44528
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44528, 360, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44528, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Major Agility -- 44529
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44529, 370, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44529, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Exceptional Intellect -- 44555
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44555, 370, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44555, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Fire Resistance -- 44556
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44556, 370, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44556, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Exceptional Healing -- 44558
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44558, 375, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44558, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Greater Assault -- 44575
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44575, 375, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44575, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Spell Piercing -- 44582
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44582, 380, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44582, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Boots - Greater Vitality -- 44584
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44584, 380, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44584, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Exceptional Resilience -- 44588
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44588, 385, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44588, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Superior Agility -- 44589
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44589, 385, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44589, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Shadow Resistance -- 44590
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44590, 385, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44590, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Cloak - Titanweave -- 44591
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44591, 390, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44591, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Exceptional Spellpower -- 44592
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44592, 390, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44592, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Scourgebane -- 44595
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44595, 390, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44595, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Arcane Resistance -- 44596
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44596, 395, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44596, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Shield - Exceptional Stamina -- 44597
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44597, 395, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44597, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracer - Expertise -- 44598
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44598, 395, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44598, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Greater Blasting -- 44612
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44612, 390, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44612, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Icewalker -- 44613
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44613, 400, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44613, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Greater Stats -- 44616
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44616, 400, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44616, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Giant Slayer -- 44621
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44621, 400, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44621, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Super Stats -- 44623
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44623, 405, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44623, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Armsman -- 44625
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44625, 405, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44625, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Exceptional Spellpower -- 44629
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44629, 405, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44629, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Greater Savagery -- 44630
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44630, 405, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44630, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Shadow Armor -- 44631
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44631, 410, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44631, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Weapon - Exceptional Healing -- 44632
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44632, 410, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44632, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Exceptional Agility -- 44633
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44633, 410, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44633, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Major Healing -- 44634
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44634, 415, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44634, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Greater Spellpower -- 44635
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44635, 415, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44635, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Greater Spellpower -- 44636
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44636, 415, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44636, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Haste -- 44637
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44637, 415, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44637, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Greater Healing Power -- 44638
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44638, 415, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44638, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Assault -- 44645
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 44645, 415, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 44645, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Void Shatter -- 45765
	-- Shattered Sun Offensive - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 45765, 375, 22449, 1, 7411)
	self:addTradeFlags(RecipeDB, 45765, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB, 45765, 6, 1077, 2, 25032)

	-- Enchant Weapon - Deathfrost -- 46578
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Seasonal, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46578, 350, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 46578, 3,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 46578, 5, 4)

	-- Enchant Chest - Defense -- 46594
	-- Shattered Sun Offensive - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46594, 360, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 46594, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB, 46594, 6, 1077, 2, 25032)

	-- Enchant Cloak - Steelweave -- 47051
	-- Instance: 4095 - limit5type1minlevel70maxlevel70category3territory1nameMagisters' Terraceexpansion1id4095
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47051, 375, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 47051, 5,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB, 47051, 3, 24560)

	-- Enchant Cloak - Mighty Armor -- 47672
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 47672, 340, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 47672, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Cloak - Haste -- 47898
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 47898, 420, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 47898, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Cloak - Wisdom -- 47899
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 47899, 420, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 47899, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Tuskarr's Vitality -- 47901
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 47901, 400, nil, 1, 7411)
	--self:addTradeFlags(RecipeDB, 47901, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	return recipecount

end
