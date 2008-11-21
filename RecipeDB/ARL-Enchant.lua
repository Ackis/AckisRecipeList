--[[

************************************************************************

ARL-Enchant.lua

Enchanting data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
290 found from data mining.
2 ignored.

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

function addon:InitEnchanting(RecipeDB)

	local recipecount = 0

	-- Enchant Bracer - Minor Health -- 7418
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7418,30,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7418,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Minor Health -- 7420
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7420,30,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7420,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7420,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Runed Copper Rod -- 7421
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7421,1,6218,1,7411)
	self:addTradeFlags(RecipeDB,7421,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Enchant Chest - Minor Absorption -- 7426
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7426,50,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7426,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7426,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Deflection -- 7428
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7428,40,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7428,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Minor Mana -- 7443
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7443,20,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7443,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7443,7,2)

	-- Enchant Cloak - Minor Resistance -- 7454
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7454,55,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7454,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,7454,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Stamina -- 7457
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7457,60,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7457,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7457,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Minor Impact -- 7745
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7745,90,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7745,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7745,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Health -- 7748
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7748,65,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7748,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7748,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Spirit -- 7766
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7766,60,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7766,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7766,7,2)

	-- Enchant Cloak - Minor Protection -- 7771
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7771,90,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7771,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,7771,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Mana -- 7776
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7776,80,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7776,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7776,2,5757)

	-- Enchant Bracer - Minor Agility -- 7779
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7779,75,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7779,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7779,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Strength -- 7782
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7782,80,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7782,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7782,7,2)

	-- Enchant Weapon - Minor Beastslayer -- 7786
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7786,90,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7786,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7786,7,2)

	-- Enchant Weapon - Minor Striking -- 7788
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7788,80,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7788,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7788,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Lesser Intellect -- 7793
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7793,100,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7793,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7793,2,3012,2,3346,2,5158,2,5758)

	-- Runed Silver Rod -- 7795
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7795,90,6339,1,7411)
	self:addTradeFlags(RecipeDB,7795,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,7795,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Health -- 7857
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7857,105,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7857,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7857,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Spirit -- 7859
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7859,120,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7859,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7859,7,2)

	-- Enchant Cloak - Lesser Fire Resistance -- 7861
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7861,110,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7861,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,7861,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Boots - Minor Stamina -- 7863
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7863,125,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7863,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7863,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Boots - Minor Agility -- 7867
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7867,125,nil, 2,7411)
	self:addTradeFlags(RecipeDB,7867,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7867,2,3012,2,3537)

	-- Enchant Shield - Minor Stamina -- 13378
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13378,90,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13378,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13378,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Lesser Spirit -- 13380
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13380,110,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13380,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13380,7,2)

	-- Enchant Cloak - Minor Agility -- 13419
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13419,110,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13419,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13419,7,2,2,3954,2,12043)

	-- Enchant Cloak - Lesser Protection -- 13421
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13421,100,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13421,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13421,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Shield - Lesser Protection -- 13464
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13464,115,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13464,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13464,7,2)

	-- Enchant Shield - Lesser Spirit -- 13485
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13485,115,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13485,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13485,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Stamina -- 13501
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13501,115,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13501,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13501,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Weapon - Lesser Striking -- 13503
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13503,125,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13503,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13503,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Cloak - Lesser Shadow Resistance -- 13522
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13522,135,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13522,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13522,7,2)

	-- Enchant 2H Weapon - Lesser Impact -- 13529
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13529,130,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13529,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13529,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Strength -- 13536
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13536,140,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13536,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13536,2,3954,2,12043)

	-- Enchant Chest - Lesser Absorption -- 13538
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13538,125,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13538,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13538,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Mana -- 13607
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13607,130,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13607,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13607,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Gloves - Mining -- 13612
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13612,145,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13612,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13612,3,1015,3,1051,3,1052,3,1053,3,1054,3,1364,3,1417)

	-- Enchant Gloves - Herbalism -- 13617
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13617,145,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13617,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13617,3,3809,3,3818,3,3825,3,3834,3,3919,3,4028,3,4029,3,4041,3,4042)

	-- Enchant Gloves - Fishing -- 13620
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13620,145,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13620,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13620,3,2356,3,2374,3,2375,3,2376,3,2377,3,14276)

	-- Enchant Bracer - Lesser Intellect -- 13622
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13622,135,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13622,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13622,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Minor Stats -- 13626
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13626,135,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13626,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13626,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Runed Golden Rod -- 13628
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13628,135,11130,1,7411)
	self:addTradeFlags(RecipeDB,13628,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,13628,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Shield - Lesser Stamina -- 13631
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13631,135,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13631,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13631,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Defense -- 13635
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13635,135,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13635,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13635,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Agility -- 13637
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13637,140,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13637,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13637,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Greater Health -- 13640
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13640,140,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13640,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13640,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Spirit -- 13642
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13642,145,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13642,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13642,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Stamina -- 13644
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13644,150,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13644,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13644,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Lesser Deflection -- 13646
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13646,170,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13646,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13646,2,2381,2,2821)

	-- Enchant Bracer - Stamina -- 13648
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13648,150,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13648,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13648,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Weapon - Lesser Beastslayer -- 13653
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13653,175,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13653,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13653,7,2)

	-- Enchant Weapon - Lesser Elemental Slayer -- 13655
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13655,175,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13655,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13655,7,2)

	-- Enchant Cloak - Fire Resistance -- 13657
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13657,155,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13657,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13657,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Shield - Spirit -- 13659
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13659,160,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13659,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13659,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Strength -- 13661
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13661,160,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13661,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Greater Mana -- 13663
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13663,165,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13663,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Spirit -- 13687
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13687,190,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13687,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13687,7,2)

	-- Enchant Shield - Lesser Block -- 13689
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13689,195,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13689,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13689,3,6426)

	-- Enchant Weapon - Striking -- 13693
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13693,175,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13693,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13693,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant 2H Weapon - Impact -- 13695
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13695,180,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13695,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13695,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Skinning -- 13698
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13698,200,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13698,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13698,3,2556,3,2557,3,2558,3,2606)

	-- Enchant Chest - Lesser Stats -- 13700
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13700,180,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13700,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13700,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Runed Truesilver Rod -- 13702
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13702,180,11145,1,7411)
	self:addTradeFlags(RecipeDB,13702,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,13702,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Greater Defense -- 13746
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13746,185,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13746,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13746,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Resistance -- 13794
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13794,185,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13794,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13794,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Agility -- 13815
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13815,190,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13815,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13815,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Shield - Stamina -- 13817
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13817,210,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13817,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13817,7,2)

	-- Enchant Bracer - Intellect -- 13822
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13822,190,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13822,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13822,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Stamina -- 13836
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13836,195,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13836,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Advanced Mining -- 13841
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13841,215,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13841,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13841,3,674,3,684,3,772,3,1550)

	-- Enchant Bracer - Greater Spirit -- 13846
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13846,220,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13846,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13846,7,2)

	-- Enchant Chest - Superior Health -- 13858
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13858,200,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13858,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13858,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Advanced Herbalism -- 13868
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13868,225,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13868,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13868,3,764,3,765,3,766,3,1081,3,1082)

	-- Enchant Cloak - Lesser Agility -- 13882
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13882,225,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13882,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,13882,3,2246,3,2407,3,5623,3,7805)

	-- Enchant Gloves - Strength -- 13887
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13887,205,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13887,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13887,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Minor Speed -- 13890
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13890,205,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13890,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13890,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Weapon - Fiery Weapon -- 13898
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13898,265,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13898,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13898,3,8913,3,9024)

	-- Enchant Shield - Greater Spirit -- 13905
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13905,210,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13905,1,11073,1,19251)

	-- Enchant Weapon - Demonslaying -- 13915
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13915,230,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13915,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13915,7,2)

	-- Enchant Chest - Superior Mana -- 13917
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13917,210,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13917,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13917,1,11073,1,19251)

	-- Enchant Bracer - Deflection -- 13931
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13931,235,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13931,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13931,2,989,2,4229)

	-- Enchant Shield - Frost Resistance -- 13933
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13933,235,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13933,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13933,3,7855,3,10184,3,12397)

	-- Enchant Boots - Agility -- 13935
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13935,215,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13935,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13935,1,11073,1,19251)

	-- Enchant 2H Weapon - Greater Impact -- 13937
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13937,220,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13937,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13937,1,11073,1,19251)

	-- Enchant Bracer - Greater Strength -- 13939
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13939,220,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13939,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13939,1,11073,1,19251)

	-- Enchant Chest - Stats -- 13941
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13941,225,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13941,1,11073,1,19251)

	-- Enchant Weapon - Greater Striking -- 13943
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13943,225,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13943,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13943,1,11073,1,19251)

	-- Enchant Bracer - Greater Stamina -- 13945
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13945,245,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13945,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13945,7,2)

	-- Enchant Gloves - Riding Skill -- 13947
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13947,250,nil, 2,7411)
	self:addTradeFlags(RecipeDB,13947,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13947,3,7155,3,8889,3,8893,3,10184)

	-- Enchant Gloves - Minor Haste -- 13948
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13948,230,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13948,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13948,1,11073,1,19251)

	-- Lesser Magic Wand -- 14293
	-- Item Stats: 
	-- Item Stats: val12-22id14val1.5id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14293,35,11287,1,7411)
	self:addTradeFlags(RecipeDB,14293,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB,14293,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Greater Magic Wand -- 14807
	-- Item Stats: 
	-- Item Stats: val22-41id14val1.8id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14807,70,11288,1,7411)
	self:addTradeFlags(RecipeDB,14807,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB,14807,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Lesser Mystic Wand -- 14809
	-- Item Stats: 
	-- Item Stats: val23-43id14val1.3id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14809,135,11289,1,7411)
	self:addTradeFlags(RecipeDB,14809,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB,14809,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Greater Mystic Wand -- 14810
	-- Item Stats: 
	-- Item Stats: val40-76id14val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14810,155,11290,1,7411)
	self:addTradeFlags(RecipeDB,14810,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,46,74)
	self:addTradeAcquire(RecipeDB,14810,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Smoking Heart of the Mountain -- 15596
	-- Item Stats: 
	-- Item Stats: val150id6val7id33val7id34val7id35val7id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,15596,265,11811,2,7411)
	self:addTradeFlags(RecipeDB,15596,1,2,5,11,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB,15596,3,8921,3,9025)

	-- Enchanted Thorium -- 17180
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17180,240,12655,1,7411)
	self:addTradeFlags(RecipeDB,17180,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17180,1,11073,1,19251)

	-- Enchanted Leather -- 17181
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17181,240,12810,1,7411)
	self:addTradeFlags(RecipeDB,17181,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17181,1,11073,1,19251)

	-- Enchant Bracer - Greater Intellect -- 20008
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20008,255,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20008,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20008,1,11073,1,19251)

	-- Enchant Bracer - Superior Spirit -- 20009
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20009,270,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20009,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20009,7,2)

	-- Enchant Bracer - Superior Strength -- 20010
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20010,295,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20010,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20010,3,7372)

	-- Enchant Bracer - Superior Stamina -- 20011
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20011,300,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20011,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20011,7,2)

	-- Enchant Gloves - Greater Agility -- 20012
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20012,270,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20012,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20012,1,11073,1,19251)

	-- Enchant Gloves - Greater Strength -- 20013
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20013,295,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20013,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20013,1,11073,1,19251)

	-- Enchant Cloak - Greater Resistance -- 20014
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20014,265,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20014,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,20014,1,11073,1,19251)

	-- Enchant Cloak - Superior Defense -- 20015
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20015,285,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20015,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Shield - Superior Spirit -- 20016
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20016,280,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20016,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20016,1,11073,1,19251)

	-- Enchant Shield - Greater Stamina -- 20017
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20017,265,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20017,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,20017,2,4229,2,4561)

	-- Enchant Boots - Greater Stamina -- 20020
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20020,260,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20020,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20020,7,2)

	-- Enchant Boots - Greater Agility -- 20023
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20023,295,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20023,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20023,3,13300,1,11073,1,19251)

	-- Enchant Boots - Spirit -- 20024
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20024,275,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20024,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20024,7,2)

	-- Enchant Chest - Greater Stats -- 20025
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20025,300,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20025,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20025,7,2)

	-- Enchant Chest - Major Health -- 20026
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20026,275,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20026,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Major Mana -- 20028
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20028,290,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20028,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20028,1,11073,1,19251)

	-- Enchant Weapon - Icy Chill -- 20029
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20029,285,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20029,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20029,3,7444,3,7448,3,7524)

	-- Enchant 2H Weapon - Superior Impact -- 20030
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20030,295,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20030,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20030,3,10317,3,10366)

	-- Enchant Weapon - Superior Striking -- 20031
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20031,300,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20031,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20031,3,9216)

	-- Enchant Weapon - Lifestealing -- 20032
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20032,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,20032,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20032,3,10499)

	-- Enchant Weapon - Unholy Weapon -- 20033
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20033,295,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20033,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20033,3,10398,3,16772,3,16810,3,18477,3,18595)

	-- Enchant Weapon - Crusader -- 20034
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20034,300,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20034,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20034,3,4494,3,9451)

	-- Enchant 2H Weapon - Major Spirit -- 20035
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20035,300,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20035,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20035,3,10469,3,10477)

	-- Enchant 2H Weapon - Major Intellect -- 20036
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20036,300,nil, 2,7411)
	self:addTradeFlags(RecipeDB,20036,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20036,3,10422)

	-- Runed Arcanite Rod -- 20051
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20051,290,16207,1,7411)
	self:addTradeFlags(RecipeDB,20051,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,20051,2,12022)

	-- Enchant Weapon - Winter's Might -- 21931
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,21931,190,nil, 2,7411)
	self:addTradeFlags(RecipeDB,21931,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21931,5,1)

	-- Enchant Weapon - Spell Power -- 22749
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22749,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,22749,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22749,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Enchant Weapon - Healing Power -- 22750
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22750,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,22750,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22750,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Enchant Weapon - Strength -- 23799
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23799,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,23799,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,23799,2,12944)

	-- Enchant Weapon - Agility -- 23800
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23800,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,23800,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB,23800,6,576,2,11557)

	-- Enchant Bracer - Mana Regeneration -- 23801
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23801,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,23801,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB,23801,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Enchant Bracer - Healing Power -- 23802
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23802,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,23802,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB,23802,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Enchant Weapon - Mighty Spirit -- 23803
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23803,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,23803,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Mighty Intellect -- 23804
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23804,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,23804,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Threat -- 25072
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25072,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25072,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,25072,3,15275)

	-- Enchant Gloves - Shadow Power -- 25073
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25073,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25073,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,25073,3,15263,3,15299,3,15348,3,15509,3,15510,3,15516,3,15517,3,15544)

	-- Enchant Gloves - Frost Power -- 25074
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25074,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25074,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,25074,3,15263,3,15348,3,15370,3,15509,3,15510,3,15511,3,15516,3,15517,3,15544)

	-- Enchant Gloves - Fire Power -- 25078
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25078,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25078,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,25078,3,15263,3,15299,3,15340,3,15341,3,15348,3,15369,3,15509,3,15510,3,15516,3,15544)

	-- Enchant Gloves - Healing Power -- 25079
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25079,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25079,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,25079,3,15263,3,15509,3,15510,3,15516,3,15517,3,15543)

	-- Enchant Gloves - Superior Agility -- 25080
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25080,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25080,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,25080,3,15263,3,15299,3,15339,3,15341,3,15348,3,15369,3,15509,3,15510,3,15516,3,15517)

	-- Enchant Cloak - Greater Fire Resistance -- 25081
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25081,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,25081,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,97)
	self:addTradeAcquire(RecipeDB,25081,6,609,1,15419)

	-- Enchant Cloak - Greater Nature Resistance -- 25082
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25082,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,25082,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,97)
	self:addTradeAcquire(RecipeDB,25082,6,609,2,15419)

	-- Enchant Cloak - Stealth -- 25083
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25083,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25083,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,25083,3,15263,3,15339,3,15340,3,15509,3,15510,3,15516,3,15543,3,15544)

	-- Enchant Cloak - Subtlety -- 25084
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25084,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25084,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,25084,3,15276)

	-- Enchant Cloak - Dodge -- 25086
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25086,300,nil, 3,7411)
	self:addTradeFlags(RecipeDB,25086,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,25086,3,15263,3,15299,3,15341,3,15369,3,15509,3,15510,3,15516,3,15517)

	-- Minor Wizard Oil -- 25124
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25124,45,20744,1,7411)
	self:addTradeFlags(RecipeDB,25124,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25124,2,1318,2,3012,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Minor Mana Oil -- 25125
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25125,150,20745,1,7411)
	self:addTradeFlags(RecipeDB,25125,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25125,2,1318,2,3012,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Lesser Wizard Oil -- 25126
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25126,200,20746,1,7411)
	self:addTradeFlags(RecipeDB,25126,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25126,2,1318,2,3012,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Lesser Mana Oil -- 25127
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25127,250,20747,1,7411)
	self:addTradeFlags(RecipeDB,25127,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25127,2,15419)

	-- Wizard Oil -- 25128
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25128,275,20750,1,7411)
	self:addTradeFlags(RecipeDB,25128,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25128,2,15419)

	-- Brilliant Wizard Oil -- 25129
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25129,300,20749,1,7411)
	self:addTradeFlags(RecipeDB,25129,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,25129,6,270,2,14921)

	-- Brilliant Mana Oil -- 25130
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25130,300,20748,1,7411)
	self:addTradeFlags(RecipeDB,25130,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,25130,6,270,1,14921)

	-- Enchant 2H Weapon - Agility -- 27837
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27837,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27837,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB,27837,6,576,1,11557)

	-- Enchant Bracer - Brawn -- 27899
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27899,285,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27899,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Stats -- 27905
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27905,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27905,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Major Defense -- 27906
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27906,320,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27906,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27906,3,22822)

	-- Enchant Bracer - Superior Healing -- 27911
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27911,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27911,1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,27911,6,946,1,17657)

	-- Enchant Bracer - Restore Mana Prime -- 27913
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27913,335,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27913,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27913,7,2)

	-- Enchant Bracer - Fortitude -- 27914
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27914,350,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27914,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27914,3,17803)

	-- Enchant Bracer - Spellpower -- 27917
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27917,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27917,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27917,3,19952,3,20058)

	-- Enchant Ring - Striking -- 27920
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27920,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27920,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,63,105)
	self:addTradeAcquire(RecipeDB,27920,6,933,3,17518)

	-- Enchant Ring - Spellpower -- 27924
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27924,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27924,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,106)
	self:addTradeAcquire(RecipeDB,27924,6,989,2,21643)

	-- Enchant Ring - Healing Power -- 27926
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27926,370,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27926,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,63,111)
	self:addTradeAcquire(RecipeDB,27926,6,935,3,21432)

	-- Enchant Ring - Stats -- 27927
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27927,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27927,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,107)
	self:addTradeAcquire(RecipeDB,27927,6,1011,2,21655)

	-- Enchant Shield - Tough Shield -- 27944
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27944,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27944,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27944,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Shield - Intellect -- 27945
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27945,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27945,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27945,2,18664)

	-- Enchant Shield - Shield Block -- 27946
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27946,340,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27946,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27946,7,2)

	-- Enchant Shield - Resistance -- 27947
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27947,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27947,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27947,7,2)

	-- Enchant Boots - Vitality -- 27948
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27948,305,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27948,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27948,7,2)

	-- Enchant Boots - Fortitude -- 27950
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27950,320,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27950,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27950,3,18317)

	-- Enchant Boots - Dexterity -- 27951
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27951,340,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27951,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27951,3,18521)

	-- Enchant Boots - Surefooted -- 27954
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27954,370,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27954,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27954,3,16472)

	-- Enchant Chest - Exceptional Health -- 27957
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27957,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27957,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27957,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Exceptional Mana -- 27958
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27958,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27958,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Exceptional Stats -- 27960
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27960,345,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27960,1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,27960,6,946,3,17657)

	-- Enchant Cloak - Major Armor -- 27961
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27961,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,27961,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Major Resistance -- 27962
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27962,330,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27962,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,27962,7,2)

	-- Enchant Weapon - Major Striking -- 27967
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27967,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27967,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB,27967,6,933,2,20242,6,933,2,23007)

	-- Enchant Weapon - Major Intellect -- 27968
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27968,340,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27968,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27968,3,20136)

	-- Enchant 2H Weapon - Savagery -- 27971
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27971,350,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27971,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27971,3,17465)

	-- Enchant Weapon - Potency -- 27972
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27972,350,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27972,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27972,7,2)

	-- Enchant Weapon - Major Spellpower -- 27975
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27975,350,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27975,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27975,3,22242,3,23385)

	-- Enchant 2H Weapon - Major Agility -- 27977
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27977,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,27977,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27977,3,20880)

	-- Enchant Weapon - Sunfire -- 27981
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27981,375,nil, 3,7411)
	self:addTradeFlags(RecipeDB,27981,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27981,3,16524)

	-- Enchant Weapon - Soulfrost -- 27982
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27982,375,nil, 3,7411)
	self:addTradeFlags(RecipeDB,27982,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27982,3,15688)

	-- Enchant Weapon - Mongoose -- 27984
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27984,375,nil, 3,7411)
	self:addTradeFlags(RecipeDB,27984,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27984,3,15687)

	-- Enchant Weapon - Spellsurge -- 28003
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28003,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,28003,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28003,3,16409,3,16488,3,16492,3,17940,3,18631,3,18639,3,24697,3,25060)

	-- Enchant Weapon - Battlemaster -- 28004
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28004,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,28004,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28004,3,16539,3,17269,3,18472,3,20410)

	-- Superior Mana Oil -- 28016
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28016,310,22521,1,7411)
	self:addTradeFlags(RecipeDB,28016,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28016,2,16635,2,16722,2,19663)

	-- Superior Wizard Oil -- 28019
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28019,340,22522,1,7411)
	self:addTradeFlags(RecipeDB,28019,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28019,2,16635,2,16722,2,19663)

	-- Arcane Dust -- 28021
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,28021,315,22445,1,7411)
	--self:addTradeFlags(RecipeDB,28021,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Large Prismatic Shard -- 28022
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28022,335,22449,1,7411)
	self:addTradeFlags(RecipeDB,28022,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28022,2,16635,2,16722,2,19663)

	-- Prismatic Sphere -- 28027
	-- Item Stats: 
	-- Item Stats: val3id32val3id33val3id34val3id35val3id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28027,315,22460,1,7411)
	self:addTradeFlags(RecipeDB,28027,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28027,1,18753,1,18773,1,19252,1,19540)

	-- Void Sphere -- 28028
	-- Item Stats: 
	-- Item Stats: val4id32val4id33val4id34val4id35val4id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28028,360,22459,1,7411)
	self:addTradeFlags(RecipeDB,28028,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28028,1,18753,1,18773,1,19252,1,19540)

	-- Runed Fel Iron Rod -- 32664
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32664,280,22461,1,7411)
	self:addTradeFlags(RecipeDB,32664,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32664,1,18753,1,18773,1,19252,1,19540)

	-- Runed Adamantite Rod -- 32665
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32665,350,22462,1,7411)
	self:addTradeFlags(RecipeDB,32665,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32665,2,18960,2,19004)

	-- Runed Eternium Rod -- 32667
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32667,375,22463,1,7411)
	self:addTradeFlags(RecipeDB,32667,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32667,2,19663)

	-- Enchant Chest - Major Spirit -- 33990
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33990,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33990,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33990,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Restore Mana Prime -- 33991
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33991,280,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33991,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33991,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Major Resilience -- 33992
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33992,345,nil, 2,7411)
	self:addTradeFlags(RecipeDB,33992,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33992,7,2)

	-- Enchant Gloves - Blasting -- 33993
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33993,285,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33993,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33993,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Precise Strikes -- 33994
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33994,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,33994,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,33994,6,942,3,17904)

	-- Enchant Gloves - Major Strength -- 33995
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33995,320,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33995,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33995,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Assault -- 33996
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33996,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33996,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33996,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Major Spellpower -- 33997
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33997,360,nil, 2,7411)
	self:addTradeFlags(RecipeDB,33997,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB,33997,6,989,2,21643)

	-- Enchant Gloves - Major Healing -- 33999
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33999,350,nil, 2,7411)
	self:addTradeFlags(RecipeDB,33999,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB,33999,6,935,2,21432)

	-- Enchant Bracer - Major Intellect -- 34001
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34001,285,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34001,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34001,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Assault -- 34002
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34002,280,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34002,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34002,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Spell Penetration -- 34003
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34003,325,nil, 2,7411)
	self:addTradeFlags(RecipeDB,34003,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63,105)
	self:addTradeAcquire(RecipeDB,34003,6,933,1,20242,6,933,1,23007)

	-- Enchant Cloak - Greater Agility -- 34004
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34004,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34004,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,34004,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Greater Arcane Resistance -- 34005
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34005,350,nil, 3,7411)
	self:addTradeFlags(RecipeDB,34005,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,34005,3,19796)

	-- Enchant Cloak - Greater Shadow Resistance -- 34006
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34006,350,nil, 3,7411)
	self:addTradeFlags(RecipeDB,34006,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,34006,3,18870)

	-- Enchant Boots - Cat's Swiftness -- 34007
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34007,360,nil, 3,7411)
	self:addTradeFlags(RecipeDB,34007,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34007,3,16407,3,16409,3,16471,3,16473,3,16504,3,17976)

	-- Enchant Boots - Boar's Speed -- 34008
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34008,360,nil, 3,7411)
	self:addTradeFlags(RecipeDB,34008,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34008,3,16409,3,16470,3,18105,3,19168,3,25002)

	-- Enchant Shield - Major Stamina -- 34009
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34009,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34009,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34009,2,19663)

	-- Enchant Weapon - Major Healing -- 34010
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34010,350,nil, 2,7411)
	self:addTradeFlags(RecipeDB,34010,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB,34010,6,935,3,21432)

	-- Nexus Transformation -- 42613
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42613,285,22448,1,7411)
	self:addTradeFlags(RecipeDB,42613,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42613,1,18753,1,18773,1,19252)

	-- Small Prismatic Shard -- 42615
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42615,295,22448,1,7411)
	self:addTradeFlags(RecipeDB,42615,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42615,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Weapon - Greater Agility -- 42620
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42620,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,42620,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,114)
	self:addTradeAcquire(RecipeDB,42620,6,967,4,18255)

	-- Enchant Weapon - Executioner -- 42974
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42974,375,nil, 3,7411)
	self:addTradeFlags(RecipeDB,42974,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42974,3,23574,3,23576,3,23577,3,23578,3,23834,3,23863,3,24239,3,24530)

	-- Enchant Shield - Resilience -- 44383
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44383,310,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44383,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Frost Resistance -- 44483
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44483,400,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44483,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Expertise -- 44484
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44484,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44484,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Precision -- 44488
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44488,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44488,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Shield - Defense -- 44489
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44489,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44489,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Mighty Health -- 44492
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44492,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44492,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Nature Resistance -- 44494
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44494,400,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44494,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,44494,3,32290)

	-- Enchant Cloak - Superior Agility -- 44500
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44500,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44500,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Gatherer -- 44506
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44506,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44506,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Greater Spirit -- 44508
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44508,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44508,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Greater Mana Restoration -- 44509
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44509,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44509,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Exceptional Spirit -- 44510
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44510,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44510,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Greater Assault -- 44513
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44513,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44513,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Icebreaker -- 44524
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44524,425,nil, 3,7411)
	self:addTradeFlags(RecipeDB,44524,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44524,2,32514)

	-- Enchant Boots - Greater Fortitude -- 44528
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44528,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44528,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Major Agility -- 44529
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44529,405,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44529,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Exceptional Intellect -- 44555
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44555,370,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44555,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Fire Resistance -- 44556
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44556,400,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44556,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,47,63)
	self:addTradeAcquire(RecipeDB,44556,3,30921)

	-- Enchant Bracers - Greater Assault -- 44575
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44575,430,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44575,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44575,2,32514)

	-- Enchant Weapon - Lifeward -- 44576
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44576,440,nil, 3,7411)
	self:addTradeFlags(RecipeDB,44576,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44576,2,32514)

	-- Enchant Cloak - Spell Piercing -- 44582
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44582,380,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44582,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Boots - Greater Vitality -- 44584
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44584,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44584,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Exceptional Resilience -- 44588
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44588,415,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44588,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Superior Agility -- 44589
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44589,405,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44589,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Shadow Resistance -- 44590
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44590,400,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44590,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Cloak - Titanweave -- 44591
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44591,435,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44591,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,44591,2,32514)

	-- Enchant Gloves - Exceptional Spellpower -- 44592
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44592,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44592,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Major Spirit -- 44593
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44593,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44593,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant 2H Weapon - Scourgebane -- 44595
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44595,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44595,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Superior Arcane Resistance -- 44596
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44596,400,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44596,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Bracers - Expertise -- 44598
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44598,405,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44598,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Greater Blasting -- 44612
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44612,390,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44612,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Greater Stats -- 44616
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44616,390,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44616,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Giant Slayer -- 44621
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44621,430,nil, 3,7411)
	self:addTradeFlags(RecipeDB,44621,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44621,2,32514)

	-- Enchant Chest - Super Stats -- 44623
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44623,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44623,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Gloves - Armsman -- 44625
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44625,425,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44625,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Exceptional Spellpower -- 44629
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44629,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44629,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant 2H Weapon - Greater Savagery -- 44630
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44630,380,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44630,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Shadow Armor -- 44631
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44631,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44631,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,44631,2,32514)

	-- Enchant Weapon - Exceptional Agility -- 44633
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44633,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44633,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Greater Spellpower -- 44635
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44635,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44635,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Greater Spellpower -- 44636
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44636,385,nil, 1, 7411)
	self:addTradeFlags(RecipeDB,44636,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Assault -- 44645
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44645,385,nil, 1, 7411)
	self:addTradeFlags(RecipeDB,44645,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Void Shatter -- 45765
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,45765,375,22449,1,7411)
	self:addTradeFlags(RecipeDB,45765,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB,45765,6,1077,2,25032)

	-- Enchant Weapon - Deathfrost -- 46578
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46578,350,nil, 3,7411)
	self:addTradeFlags(RecipeDB,46578,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,46578,5,4)

	-- Enchant Chest - Defense -- 46594
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46594,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,46594,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB,46594,6,1077,2,25032)

	-- Enchant Cloak - Steelweave -- 47051
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47051,375,nil, 3,7411)
	self:addTradeFlags(RecipeDB,47051,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,47051,3,24560)

	-- Enchant Cloak - Mighty Armor -- 47672
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47672,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47672,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Chest - Greater Defense -- 47766
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47766,390,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47766,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Greater Speed -- 47898
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47898,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47898,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Cloak - Wisdom -- 47899
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47899,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,47899,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	self:addTradeAcquire(RecipeDB,47899,2,32514)

	-- Enchant Chest - Super Health -- 47900
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47900,415,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47900,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Tuskarr's Vitality -- 47901
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47901,430,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47901,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Weapon - Accuracy -- 59619
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59619,440,nil, 3,7411)
	self:addTradeFlags(RecipeDB,59619,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59619,2,32514)

	-- Enchant Weapon - Berserking -- 59621
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59621,440,nil, 3,7411)
	self:addTradeFlags(RecipeDB,59621,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59621,2,32514)

	-- Enchant Weapon - Black Magic -- 59625
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59625,430,nil, 3,7411)
	self:addTradeFlags(RecipeDB,59625,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Ring - Stamina -- 59636
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59636,385,nil, 1, 7411)
	self:addTradeFlags(RecipeDB,59636,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Assault -- 60606
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60606,365,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60606,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Speed -- 60609
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60609,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60609,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Bracers - Striking -- 60616
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60616,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60616,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runed Titanium Rod -- 60619
	-- Item Stats: 
	-- Item Stats: val2id8val2id15
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60619,425,44452,3,7411)
	self:addTradeFlags(RecipeDB,60619,3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Enchant Weapon - Greater Potency -- 60621
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60621,370,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60621,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Icewalker -- 60623
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60623,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60623,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Shield - Greater Intellect -- 60653
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60653,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60653,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Major Agility -- 60663
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60663,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60663,3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Enchant Gloves - Crusher -- 60668
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60668,415,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60668,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant 2H Weapon - Massacre -- 60691
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60691,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60691,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Chest - Powerful Stats -- 60692
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60692,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,60692,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60692,2,32514)

	-- Enchant Weapon - Superior Potency -- 60707
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60707,435,nil, 3,7411)
	self:addTradeFlags(RecipeDB,60707,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60707,2,32514)

	-- Enchant Weapon - Mighty Spellpower -- 60714
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60714,435,nil, 3,7411)
	self:addTradeFlags(RecipeDB,60714,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60714,2,32514)

	-- Enchant Boots - Greater Assault -- 60763
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60763,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,60763,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60763,2,32514)

	-- Enchant Bracers - Superior Spellpower -- 60767
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60767,430,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60767,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information


	return recipecount

end
