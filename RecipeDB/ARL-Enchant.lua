--[[

************************************************************************

ARL-Enchant.lua

Enchanting data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
290 found from data mining.
4 ignored.

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
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7418,1,nil,1,7411)
	self:addTradeFlags(RecipeDB,7418,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7418,8,8)

	-- Enchant Chest - Minor Health -- 7420
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7420,15,nil,1,7411)
	self:addTradeFlags(RecipeDB,7420,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7420,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Runed Copper Rod -- 7421
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7421,1,6218,1,7411)
	self:addTradeFlags(RecipeDB,7421,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,7421,8,8)

	-- Enchant Chest - Minor Absorption -- 7426
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7426,40,nil,1,7411)
	self:addTradeFlags(RecipeDB,7426,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7426,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Deflection -- 7428
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7428,1,nil,1,7411)
	self:addTradeFlags(RecipeDB,7428,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7428,8,8)

	-- Enchant Chest - Minor Mana -- 7443
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7443,20,nil,1,7411)
	self:addTradeFlags(RecipeDB,7443,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7443,7,1)

	-- Enchant Cloak - Minor Resistance -- 7454
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7454,45,nil,1,7411)
	self:addTradeFlags(RecipeDB,7454,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,7454,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Stamina -- 7457
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7457,50,nil,1,7411)
	self:addTradeFlags(RecipeDB,7457,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7457,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Minor Impact -- 7745
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7745,90,nil,1,7411)
	self:addTradeFlags(RecipeDB,7745,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7745,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Health -- 7748
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7748,60,nil,1,7411)
	self:addTradeFlags(RecipeDB,7748,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7748,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Spirit -- 7766
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7766,60,nil,1,7411)
	self:addTradeFlags(RecipeDB,7766,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7766,7,1)

	-- Enchant Cloak - Minor Protection -- 7771
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7771,90,nil,1,7411)
	self:addTradeFlags(RecipeDB,7771,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,7771,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Mana -- 7776
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7776,80,nil,1,7411)
	self:addTradeFlags(RecipeDB,7776,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7776,2,3346,2,5757)

	-- Enchant Bracer - Minor Agility -- 7779
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7779,80,nil,1,7411)
	self:addTradeFlags(RecipeDB,7779,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7779,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Strength -- 7782
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7782,80,nil,1,7411)
	self:addTradeFlags(RecipeDB,7782,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7782,7,1)

	-- Enchant Weapon - Minor Beastslayer -- 7786
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7786,90,nil,1,7411)
	self:addTradeFlags(RecipeDB,7786,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7786,7,1)

	-- Enchant Weapon - Minor Striking -- 7788
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7788,90,nil,1,7411)
	self:addTradeFlags(RecipeDB,7788,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7788,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Lesser Intellect -- 7793
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7793,100,nil,1,7411)
	self:addTradeFlags(RecipeDB,7793,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7793,2,3012,2,3346,2,5158,2,5758)

	-- Runed Silver Rod -- 7795
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7795,100,6339,1,7411)
	self:addTradeFlags(RecipeDB,7795,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,7795,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Health -- 7857
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7857,120,nil,1,7411)
	self:addTradeFlags(RecipeDB,7857,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7857,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Spirit -- 7859
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7859,120,nil,1,7411)
	self:addTradeFlags(RecipeDB,7859,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7859,7,1)

	-- Enchant Cloak - Lesser Fire Resistance -- 7861
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7861,125,nil,1,7411)
	self:addTradeFlags(RecipeDB,7861,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,7861,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Boots - Minor Stamina -- 7863
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7863,125,nil,1,7411)
	self:addTradeFlags(RecipeDB,7863,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7863,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Boots - Minor Agility -- 7867
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7867,125,nil,1,7411)
	self:addTradeFlags(RecipeDB,7867,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7867,2,3012,2,3537)

	-- Enchant Shield - Minor Stamina -- 13378
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13378,105,nil,1,7411)
	self:addTradeFlags(RecipeDB,13378,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13378,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Lesser Spirit -- 13380
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13380,110,nil,1,7411)
	self:addTradeFlags(RecipeDB,13380,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13380,7,1)

	-- Enchant Cloak - Minor Agility -- 13419
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13419,110,nil,1,7411)
	self:addTradeFlags(RecipeDB,13419,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13419,7,1,2,3954,2,12043)

	-- Enchant Cloak - Lesser Protection -- 13421
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13421,115,nil,1,7411)
	self:addTradeFlags(RecipeDB,13421,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13421,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Shield - Lesser Protection -- 13464
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13464,115,nil,1,7411)
	self:addTradeFlags(RecipeDB,13464,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13464,7,1)

	-- Enchant Shield - Lesser Spirit -- 13485
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13485,130,nil,1,7411)
	self:addTradeFlags(RecipeDB,13485,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13485,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Stamina -- 13501
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13501,130,nil,1,7411)
	self:addTradeFlags(RecipeDB,13501,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13501,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Weapon - Lesser Striking -- 13503
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13503,140,nil,1,7411)
	self:addTradeFlags(RecipeDB,13503,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13503,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Cloak - Lesser Shadow Resistance -- 13522
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13522,135,nil,1,7411)
	self:addTradeFlags(RecipeDB,13522,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13522,7,1)

	-- Enchant 2H Weapon - Lesser Impact -- 13529
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13529,130,nil,1,7411)
	self:addTradeFlags(RecipeDB,13529,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13529,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Strength -- 13536
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13536,140,nil,1,7411)
	self:addTradeFlags(RecipeDB,13536,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13536,2,3954,2,12043)

	-- Enchant Chest - Lesser Absorption -- 13538
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13538,140,nil,1,7411)
	self:addTradeFlags(RecipeDB,13538,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13538,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Mana -- 13607
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13607,145,nil,1,7411)
	self:addTradeFlags(RecipeDB,13607,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13607,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Gloves - Mining -- 13612
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13612,145,nil,1,7411)
	self:addTradeFlags(RecipeDB,13612,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13612,3,1015,3,1017,3,1051,3,1052,3,1053,3,1054,3,1364,3,1417)

	-- Enchant Gloves - Herbalism -- 13617
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13617,145,nil,1,7411)
	self:addTradeFlags(RecipeDB,13617,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13617,3,3809,3,3818,3,3825,3,3834,3,3919,3,4028,3,4029,3,4041,3,4042)

	-- Enchant Gloves - Fishing -- 13620
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13620,145,nil,1,7411)
	self:addTradeFlags(RecipeDB,13620,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13620,3,2356,3,2374,3,2375,3,2376,3,2377,3,14276)

	-- Enchant Bracer - Lesser Intellect -- 13622
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13622,150,nil,1,7411)
	self:addTradeFlags(RecipeDB,13622,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13622,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Minor Stats -- 13626
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13626,150,nil,1,7411)
	self:addTradeFlags(RecipeDB,13626,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13626,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Runed Golden Rod -- 13628
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13628,150,11130,1,7411)
	self:addTradeFlags(RecipeDB,13628,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,13628,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Shield - Lesser Stamina -- 13631
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13631,155,nil,1,7411)
	self:addTradeFlags(RecipeDB,13631,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13631,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Defense -- 13635
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13635,155,nil,1,7411)
	self:addTradeFlags(RecipeDB,13635,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13635,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Agility -- 13637
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13637,160,nil,1,7411)
	self:addTradeFlags(RecipeDB,13637,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13637,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Greater Health -- 13640
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13640,160,nil,1,7411)
	self:addTradeFlags(RecipeDB,13640,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13640,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Spirit -- 13642
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13642,165,nil,1,7411)
	self:addTradeFlags(RecipeDB,13642,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13642,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Stamina -- 13644
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13644,170,nil,1,7411)
	self:addTradeFlags(RecipeDB,13644,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13644,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Lesser Deflection -- 13646
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13646,170,nil,1,7411)
	self:addTradeFlags(RecipeDB,13646,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13646,2,2381,2,2821)

	-- Enchant Bracer - Stamina -- 13648
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13648,170,nil,1,7411)
	self:addTradeFlags(RecipeDB,13648,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13648,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Weapon - Lesser Beastslayer -- 13653
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13653,175,nil,1,7411)
	self:addTradeFlags(RecipeDB,13653,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13653,7,1)

	-- Enchant Weapon - Lesser Elemental Slayer -- 13655
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13655,175,nil,1,7411)
	self:addTradeFlags(RecipeDB,13655,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13655,7,1)

	-- Enchant Cloak - Fire Resistance -- 13657
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13657,175,nil,1,7411)
	self:addTradeFlags(RecipeDB,13657,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13657,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Shield - Spirit -- 13659
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13659,180,nil,1,7411)
	self:addTradeFlags(RecipeDB,13659,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13659,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Strength -- 13661
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13661,180,nil,1,7411)
	self:addTradeFlags(RecipeDB,13661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13661,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Greater Mana -- 13663
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13663,185,nil,1,7411)
	self:addTradeFlags(RecipeDB,13663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13663,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Spirit -- 13687
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13687,190,nil,1,7411)
	self:addTradeFlags(RecipeDB,13687,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13687,7,1)

	-- Enchant Shield - Lesser Block -- 13689
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13689,195,nil,1,7411)
	self:addTradeFlags(RecipeDB,13689,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13689,3,4298,3,6426)

	-- Enchant Weapon - Striking -- 13693
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13693,195,nil,1,7411)
	self:addTradeFlags(RecipeDB,13693,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13693,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant 2H Weapon - Impact -- 13695
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13695,180,nil,1,7411)
	self:addTradeFlags(RecipeDB,13695,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13695,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Skinning -- 13698
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13698,200,nil,1,7411)
	self:addTradeFlags(RecipeDB,13698,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13698,3,2556,3,2557,3,2558,3,2606)

	-- Enchant Chest - Lesser Stats -- 13700
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13700,200,nil,1,7411)
	self:addTradeFlags(RecipeDB,13700,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13700,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Runed Truesilver Rod -- 13702
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13702,200,11145,1,7411)
	self:addTradeFlags(RecipeDB,13702,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,13702,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Greater Defense -- 13746
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13746,205,nil,1,7411)
	self:addTradeFlags(RecipeDB,13746,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13746,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Resistance -- 13794
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13794,205,nil,1,7411)
	self:addTradeFlags(RecipeDB,13794,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13794,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Agility -- 13815
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13815,210,nil,1,7411)
	self:addTradeFlags(RecipeDB,13815,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13815,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Shield - Stamina -- 13817
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13817,210,nil,1,7411)
	self:addTradeFlags(RecipeDB,13817,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13817,7,1)

	-- Enchant Bracer - Intellect -- 13822
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13822,210,nil,1,7411)
	self:addTradeFlags(RecipeDB,13822,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13822,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Stamina -- 13836
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13836,215,nil,1,7411)
	self:addTradeFlags(RecipeDB,13836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13836,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Advanced Mining -- 13841
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13841,215,nil,1,7411)
	self:addTradeFlags(RecipeDB,13841,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13841,3,674,3,684,3,772,3,1550)

	-- Enchant Bracer - Greater Spirit -- 13846
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13846,220,nil,1,7411)
	self:addTradeFlags(RecipeDB,13846,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13846,7,1)

	-- Enchant Chest - Superior Health -- 13858
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13858,220,nil,1,7411)
	self:addTradeFlags(RecipeDB,13858,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13858,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Advanced Herbalism -- 13868
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13868,225,nil,1,7411)
	self:addTradeFlags(RecipeDB,13868,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13868,3,764,3,765,3,766,3,1081,3,1082)

	-- Enchant Cloak - Lesser Agility -- 13882
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13882,225,nil,1,7411)
	self:addTradeFlags(RecipeDB,13882,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13882,3,2246,3,2407,3,5420,3,5623,3,7805)

	-- Enchant Gloves - Strength -- 13887
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13887,225,nil,1,7411)
	self:addTradeFlags(RecipeDB,13887,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13887,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Minor Speed -- 13890
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13890,225,nil,1,7411)
	self:addTradeFlags(RecipeDB,13890,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13890,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Weapon - Fiery Weapon -- 13898
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13898,265,nil,1,7411)
	self:addTradeFlags(RecipeDB,13898,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13898,3,8913,3,9024)

	-- Enchant Shield - Greater Spirit -- 13905
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13905,230,nil,1,7411)
	self:addTradeFlags(RecipeDB,13905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13905,1,11073,1,19251)

	-- Enchant Weapon - Demonslaying -- 13915
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13915,230,nil,1,7411)
	self:addTradeFlags(RecipeDB,13915,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13915,7,1)

	-- Enchant Chest - Superior Mana -- 13917
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13917,230,nil,1,7411)
	self:addTradeFlags(RecipeDB,13917,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13917,1,11073,1,19251)

	-- Enchant Bracer - Deflection -- 13931
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13931,235,nil,1,7411)
	self:addTradeFlags(RecipeDB,13931,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13931,2,989,2,4229)

	-- Enchant Shield - Frost Resistance -- 13933
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13933,235,nil,1,7411)
	self:addTradeFlags(RecipeDB,13933,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13933,3,5256,3,7855,3,10184,3,12397)

	-- Enchant Boots - Agility -- 13935
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13935,235,nil,1,7411)
	self:addTradeFlags(RecipeDB,13935,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13935,1,11073,1,19251)

	-- Enchant 2H Weapon - Greater Impact -- 13937
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13937,220,nil,1,7411)
	self:addTradeFlags(RecipeDB,13937,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13937,1,11073,1,19251)

	-- Enchant Bracer - Greater Strength -- 13939
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13939,240,nil,1,7411)
	self:addTradeFlags(RecipeDB,13939,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13939,1,11073,1,19251)

	-- Enchant Chest - Stats -- 13941
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13941,245,nil,1,7411)
	self:addTradeFlags(RecipeDB,13941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13941,1,11073,1,19251)

	-- Enchant Weapon - Greater Striking -- 13943
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13943,245,nil,1,7411)
	self:addTradeFlags(RecipeDB,13943,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13943,1,11073,1,19251)

	-- Enchant Bracer - Greater Stamina -- 13945
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13945,245,nil,1,7411)
	self:addTradeFlags(RecipeDB,13945,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13945,7,1)

	-- Enchant Gloves - Riding Skill -- 13947
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13947,250,nil,1,7411)
	self:addTradeFlags(RecipeDB,13947,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13947,3,6514,3,7155,3,8889,3,8893,3,10184,3,12206)

	-- Enchant Gloves - Minor Haste -- 13948
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13948,250,nil,1,7411)
	self:addTradeFlags(RecipeDB,13948,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13948,1,11073,1,19251)

	-- Lesser Magic Wand -- 14293
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14293,10,11287,1,7411)
	self:addTradeFlags(RecipeDB,14293,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,74)
	self:addTradeAcquire(RecipeDB,14293,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Greater Magic Wand -- 14807
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14807,70,11288,1,7411)
	self:addTradeFlags(RecipeDB,14807,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,74)
	self:addTradeAcquire(RecipeDB,14807,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Lesser Mystic Wand -- 14809
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14809,155,11289,1,7411)
	self:addTradeFlags(RecipeDB,14809,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,74)
	self:addTradeAcquire(RecipeDB,14809,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Greater Mystic Wand -- 14810
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,14810,175,11290,1,7411)
	self:addTradeFlags(RecipeDB,14810,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,74)
	self:addTradeAcquire(RecipeDB,14810,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Smoking Heart of the Mountain -- 15596
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,15596,265,11811,2,7411)
	self:addTradeFlags(RecipeDB,15596,1,2,5,11,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,15596,3,8921,3,9025)

	-- Enchanted Thorium -- 17180
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17180,250,12655,1,7411)
	self:addTradeFlags(RecipeDB,17180,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17180,1,11073,1,19251)

	-- Enchanted Leather -- 17181
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17181,250,12810,1,7411)
	self:addTradeFlags(RecipeDB,17181,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17181,1,11073,1,19251)

	-- Enchant Bracer - Greater Intellect -- 20008
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20008,255,nil,1,7411)
	self:addTradeFlags(RecipeDB,20008,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20008,1,11073,1,19251)

	-- Enchant Bracer - Superior Spirit -- 20009
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20009,270,nil,1,7411)
	self:addTradeFlags(RecipeDB,20009,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20009,7,1)

	-- Enchant Bracer - Superior Strength -- 20010
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20010,295,nil,1,7411)
	self:addTradeFlags(RecipeDB,20010,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20010,3,7372)

	-- Enchant Bracer - Superior Stamina -- 20011
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20011,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20011,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20011,7,1)

	-- Enchant Gloves - Greater Agility -- 20012
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20012,270,nil,1,7411)
	self:addTradeFlags(RecipeDB,20012,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20012,1,11073,1,19251)

	-- Enchant Gloves - Greater Strength -- 20013
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20013,295,nil,1,7411)
	self:addTradeFlags(RecipeDB,20013,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20013,1,11073,1,19251)

	-- Enchant Cloak - Greater Resistance -- 20014
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20014,265,nil,1,7411)
	self:addTradeFlags(RecipeDB,20014,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,20014,1,11073,1,19251)

	-- Enchant Cloak - Superior Defense -- 20015
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20015,285,nil,1,7411)
	self:addTradeFlags(RecipeDB,20015,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,20015,2,12022)

	-- Enchant Shield - Superior Spirit -- 20016
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20016,280,nil,1,7411)
	self:addTradeFlags(RecipeDB,20016,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20016,1,11073,1,19251)

	-- Enchant Shield - Greater Stamina -- 20017
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20017,265,nil,1,7411)
	self:addTradeFlags(RecipeDB,20017,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20017,2,4561)

	-- Enchant Boots - Greater Stamina -- 20020
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20020,260,nil,1,7411)
	self:addTradeFlags(RecipeDB,20020,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20020,7,1)

	-- Enchant Boots - Greater Agility -- 20023
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20023,295,nil,1,7411)
	self:addTradeFlags(RecipeDB,20023,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20023,3,13300,1,11073,1,19251)

	-- Enchant Boots - Spirit -- 20024
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20024,275,nil,1,7411)
	self:addTradeFlags(RecipeDB,20024,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20024,7,1)

	-- Enchant Chest - Greater Stats -- 20025
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20025,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20025,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20025,7,1)

	-- Enchant Chest - Major Health -- 20026
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20026,275,nil,1,7411)
	self:addTradeFlags(RecipeDB,20026,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,20026,2,11189)

	-- Enchant Chest - Major Mana -- 20028
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20028,290,nil,1,7411)
	self:addTradeFlags(RecipeDB,20028,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20028,1,11073,1,19251)

	-- Enchant Weapon - Icy Chill -- 20029
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20029,285,nil,1,7411)
	self:addTradeFlags(RecipeDB,20029,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20029,3,7443,3,7444,3,7448,3,7457,3,7524)

	-- Enchant 2H Weapon - Superior Impact -- 20030
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20030,295,nil,1,7411)
	self:addTradeFlags(RecipeDB,20030,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20030,3,10317,3,10339,3,10366)

	-- Enchant Weapon - Superior Striking -- 20031
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20031,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20031,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20031,3,9216,3,9568)

	-- Enchant Weapon - Lifestealing -- 20032
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20032,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20032,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20032,3,10499)

	-- Enchant Weapon - Unholy Weapon -- 20033
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20033,295,nil,1,7411)
	self:addTradeFlags(RecipeDB,20033,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20033,3,10398,3,16772,3,16810,3,18477,3,18595)

	-- Enchant Weapon - Crusader -- 20034
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20034,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20034,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20034,3,4494,3,9451)

	-- Enchant 2H Weapon - Major Spirit -- 20035
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20035,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20035,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20035,3,10469,3,10477)

	-- Enchant 2H Weapon - Major Intellect -- 20036
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20036,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,20036,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20036,3,10422)

	-- Runed Arcanite Rod -- 20051
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20051,290,16207,1,7411)
	self:addTradeFlags(RecipeDB,20051,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,20051,2,12022)

	-- Enchant Weapon - Winter's Might -- 21931
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,21931,190,nil,1,7411)
	self:addTradeFlags(RecipeDB,21931,1,2,7,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21931,5,1)

	-- Enchant Weapon - Spell Power -- 22749
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22749,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,22749,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22749,8,26)

	-- Enchant Weapon - Healing Power -- 22750
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22750,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,22750,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22750,8,26)

	-- Enchant Weapon - Strength -- 23799
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23799,290,nil,1,7411)
	self:addTradeFlags(RecipeDB,23799,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,98)
	self:addTradeAcquire(RecipeDB,23799,6,59,1,12944)

	-- Enchant Weapon - Agility -- 23800
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23800,290,nil,1,7411)
	self:addTradeFlags(RecipeDB,23800,2,4,21,22,23,24,25,26,27,28,29,30,36,40,99)
	self:addTradeAcquire(RecipeDB,23800,6,576,2,11557)

	-- Enchant Bracer - Mana Regeneration -- 23801
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23801,290,nil,1,7411)
	self:addTradeFlags(RecipeDB,23801,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,96)
	self:addTradeAcquire(RecipeDB,23801,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Enchant Bracer - Healing Power -- 23802
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23802,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,23802,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,96)
	self:addTradeAcquire(RecipeDB,23802,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Enchant Weapon - Mighty Spirit -- 23803
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23803,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,23803,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,98)
	self:addTradeAcquire(RecipeDB,23803,6,59,2,12944)

	-- Enchant Weapon - Mighty Intellect -- 23804
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23804,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,23804,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,98)
	self:addTradeAcquire(RecipeDB,23804,6,59,3,12944)

	-- Enchant Gloves - Threat -- 25072
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25072,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25072,1,2,4,6,11,21,22,23,24,25,26,27,28,29,30,36,40,111)
	self:addTradeAcquire(RecipeDB,25072,3,15275,6,935,4,21432)

	-- Enchant Gloves - Shadow Power -- 25073
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25073,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25073,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25073,8,22)

	-- Enchant Gloves - Frost Power -- 25074
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25074,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25074,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25074,8,22)

	-- Enchant Gloves - Fire Power -- 25078
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25078,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25078,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25078,8,22)

	-- Enchant Gloves - Healing Power -- 25079
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25079,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25079,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25079,8,22)

	-- Enchant Gloves - Superior Agility -- 25080
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25080,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25080,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,106)
	self:addTradeAcquire(RecipeDB,25080,8,22,6,989,4,21643)

	-- Enchant Cloak - Greater Fire Resistance -- 25081
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25081,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25081,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,97)
	self:addTradeAcquire(RecipeDB,25081,6,609,1,15419)

	-- Enchant Cloak - Greater Nature Resistance -- 25082
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25082,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25082,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,97)
	self:addTradeAcquire(RecipeDB,25082,6,609,2,15419)

	-- Enchant Cloak - Stealth -- 25083
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25083,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25083,1,2,4,6,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,25083,8,22,6,942,4,17904)

	-- Enchant Cloak - Subtlety -- 25084
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25084,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25084,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,40,63,104)
	self:addTradeAcquire(RecipeDB,25084,3,15276,6,947,4,17585,6,947,4,17585)

	-- Enchant Cloak - Dodge -- 25086
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25086,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,25086,1,2,4,6,10,21,22,23,24,25,26,27,28,29,30,36,40,63,107)
	self:addTradeAcquire(RecipeDB,25086,8,22,6,1011,4,21655)

	-- Minor Wizard Oil -- 25124
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25124,45,20744,1,7411)
	self:addTradeFlags(RecipeDB,25124,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25124,2,1318,2,3012,2,3346,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Minor Mana Oil -- 25125
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25125,150,20745,1,7411)
	self:addTradeFlags(RecipeDB,25125,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25125,2,1318,2,3012,2,3346,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Lesser Wizard Oil -- 25126
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25126,200,20746,1,7411)
	self:addTradeFlags(RecipeDB,25126,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25126,2,1318,2,3012,2,3346,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Lesser Mana Oil -- 25127
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25127,250,20747,1,7411)
	self:addTradeFlags(RecipeDB,25127,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25127,2,15419)

	-- Wizard Oil -- 25128
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25128,275,20750,1,7411)
	self:addTradeFlags(RecipeDB,25128,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25128,2,15419)

	-- Brilliant Wizard Oil -- 25129
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25129,300,20749,1,7411)
	self:addTradeFlags(RecipeDB,25129,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,25129,6,270,2,14921)

	-- Brilliant Mana Oil -- 25130
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25130,300,20748,1,7411)
	self:addTradeFlags(RecipeDB,25130,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,25130,6,270,1,14921)

	-- Enchant 2H Weapon - Agility -- 27837
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27837,290,nil,1,7411)
	self:addTradeFlags(RecipeDB,27837,2,4,21,22,23,24,25,26,27,28,29,30,36,40,99)
	self:addTradeAcquire(RecipeDB,27837,6,576,1,11557)

	-- Enchant Bracer - Brawn -- 27899
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27899,305,nil,1,7411)
	self:addTradeFlags(RecipeDB,27899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27899,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Stats -- 27905
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27905,315,nil,1,7411)
	self:addTradeFlags(RecipeDB,27905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27905,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Major Defense -- 27906
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27906,320,nil,1,7411)
	self:addTradeFlags(RecipeDB,27906,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27906,3,22822)

	-- Enchant Bracer - Superior Healing -- 27911
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27911,325,nil,1,7411)
	self:addTradeFlags(RecipeDB,27911,2,4,21,22,23,24,25,26,27,28,29,30,36,40,104)
	self:addTradeAcquire(RecipeDB,27911,6,947,1,17585,6,947,1,17585)

	-- Enchant Bracer - Restore Mana Prime -- 27913
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27913,335,nil,1,7411)
	self:addTradeFlags(RecipeDB,27913,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27913,7,1)

	-- Enchant Bracer - Fortitude -- 27914
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27914,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,27914,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27914,3,17803)

	-- Enchant Bracer - Spellpower -- 27917
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27917,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,27917,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27917,3,19952,3,20058)

	-- Enchant Ring - Striking -- 27920
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27920,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,27920,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,105)
	self:addTradeAcquire(RecipeDB,27920,6,933,3,17518)

	-- Enchant Ring - Spellpower -- 27924
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27924,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,27924,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,106)
	self:addTradeAcquire(RecipeDB,27924,6,989,2,21643)

	-- Enchant Ring - Healing Power -- 27926
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27926,370,nil,1,7411)
	self:addTradeFlags(RecipeDB,27926,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,111)
	self:addTradeAcquire(RecipeDB,27926,6,935,3,21432)

	-- Enchant Ring - Stats -- 27927
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27927,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,27927,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,107)
	self:addTradeAcquire(RecipeDB,27927,6,1011,2,21655)

	-- Enchant Shield - Tough Shield -- 27944
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27944,310,nil,1,7411)
	self:addTradeFlags(RecipeDB,27944,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27944,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Shield - Intellect -- 27945
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27945,325,nil,1,7411)
	self:addTradeFlags(RecipeDB,27945,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27945,2,18664)

	-- Enchant Shield - Shield Block -- 27946
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27946,340,nil,1,7411)
	self:addTradeFlags(RecipeDB,27946,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27946,7,1)

	-- Enchant Shield - Resistance -- 27947
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27947,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,27947,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27947,7,1)

	-- Enchant Boots - Vitality -- 27948
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27948,305,nil,1,7411)
	self:addTradeFlags(RecipeDB,27948,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27948,3,24664,3,24664)

	-- Enchant Boots - Fortitude -- 27950
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27950,320,nil,1,7411)
	self:addTradeFlags(RecipeDB,27950,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27950,3,18317)

	-- Enchant Boots - Dexterity -- 27951
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27951,340,nil,1,7411)
	self:addTradeFlags(RecipeDB,27951,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27951,3,18521)

	-- Enchant Boots - Surefooted -- 27954
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27954,370,nil,1,7411)
	self:addTradeFlags(RecipeDB,27954,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27954,3,16472)

	-- Enchant Chest - Exceptional Health -- 27957
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27957,315,nil,1,7411)
	self:addTradeFlags(RecipeDB,27957,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27957,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Exceptional Mana -- 27958
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27958,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,27958,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,27958,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Exceptional Stats -- 27960
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27960,345,nil,1,7411)
	self:addTradeFlags(RecipeDB,27960,2,4,21,22,23,24,25,26,27,28,29,30,36,40,104)
	self:addTradeAcquire(RecipeDB,27960,6,947,3,17585,6,947,3,17585)

	-- Enchant Cloak - Major Armor -- 27961
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27961,310,nil,1,7411)
	self:addTradeFlags(RecipeDB,27961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,27961,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Major Resistance -- 27962
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27962,330,nil,1,7411)
	self:addTradeFlags(RecipeDB,27962,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,27962,7,1)

	-- Enchant Weapon - Major Striking -- 27967
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27967,340,nil,1,7411)
	self:addTradeFlags(RecipeDB,27967,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,105)
	self:addTradeAcquire(RecipeDB,27967,6,933,2,20242,6,933,2,23007)

	-- Enchant Weapon - Major Intellect -- 27968
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27968,340,nil,1,7411)
	self:addTradeFlags(RecipeDB,27968,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27968,3,20136)

	-- Enchant 2H Weapon - Savagery -- 27971
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27971,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,27971,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27971,3,17465)

	-- Enchant Weapon - Potency -- 27972
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27972,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,27972,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27972,7,1)

	-- Enchant Weapon - Major Spellpower -- 27975
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27975,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,27975,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27975,3,22242,3,23385)

	-- Enchant 2H Weapon - Major Agility -- 27977
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27977,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,27977,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27977,3,20880)

	-- Enchant Weapon - Sunfire -- 27981
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27981,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,27981,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27981,3,16524)

	-- Enchant Weapon - Soulfrost -- 27982
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27982,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,27982,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27982,3,15688)

	-- Enchant Weapon - Mongoose -- 27984
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27984,375,nil,3,7411)
	self:addTradeFlags(RecipeDB,27984,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27984,3,15687)

	-- Enchant Weapon - Spellsurge -- 28003
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28003,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,28003,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28003,3,16409,3,16488,3,16492,3,17940,3,18631,3,18639,3,24697,3,25060)

	-- Enchant Weapon - Battlemaster -- 28004
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28004,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,28004,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28004,3,16539,3,17269,3,18472,3,20410)

	-- Superior Mana Oil -- 28016
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28016,310,22521,1,7411)
	self:addTradeFlags(RecipeDB,28016,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28016,2,16635,2,16722,2,19663)

	-- Superior Wizard Oil -- 28019
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28019,340,22522,1,7411)
	self:addTradeFlags(RecipeDB,28019,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28019,2,16635,2,16722,2,19663)

	-- Large Prismatic Shard -- 28022
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28022,335,22449,1,7411)
	self:addTradeFlags(RecipeDB,28022,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28022,2,16635,2,16722,2,19663)

	-- Prismatic Sphere -- 28027
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28027,325,22460,1,7411)
	self:addTradeFlags(RecipeDB,28027,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28027,1,18753,1,18773,1,19252,1,19540)

	-- Void Sphere -- 28028
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28028,350,22459,1,7411)
	self:addTradeFlags(RecipeDB,28028,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28028,1,18753,1,18773,1,19252,1,19540)

	-- Runed Fel Iron Rod -- 32664
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32664,300,22461,1,7411)
	self:addTradeFlags(RecipeDB,32664,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32664,1,18753,1,18773,1,19252,1,19540)

	-- Runed Adamantite Rod -- 32665
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32665,350,22462,1,7411)
	self:addTradeFlags(RecipeDB,32665,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32665,2,18960,2,19004)

	-- Runed Eternium Rod -- 32667
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32667,375,22463,1,7411)
	self:addTradeFlags(RecipeDB,32667,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32667,2,19663)

	-- Enchant Chest - Major Spirit -- 33990
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33990,320,nil,1,7411)
	self:addTradeFlags(RecipeDB,33990,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33990,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Restore Mana Prime -- 33991
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33991,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,33991,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33991,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Major Resilience -- 33992
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33992,345,nil,1,7411)
	self:addTradeFlags(RecipeDB,33992,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33992,7,1)

	-- Enchant Gloves - Blasting -- 33993
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33993,305,nil,1,7411)
	self:addTradeFlags(RecipeDB,33993,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33993,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Precise Strikes -- 33994
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33994,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,33994,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,103)
	self:addTradeAcquire(RecipeDB,33994,6,942,3,17904)

	-- Enchant Gloves - Major Strength -- 33995
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33995,340,nil,1,7411)
	self:addTradeFlags(RecipeDB,33995,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33995,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Assault -- 33996
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33996,310,nil,1,7411)
	self:addTradeFlags(RecipeDB,33996,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33996,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Major Spellpower -- 33997
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33997,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,33997,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,106)
	self:addTradeAcquire(RecipeDB,33997,6,989,2,21643)

	-- Enchant Gloves - Major Healing -- 33999
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33999,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,33999,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,111)
	self:addTradeAcquire(RecipeDB,33999,6,935,2,21432)

	-- Enchant Bracer - Major Intellect -- 34001
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34001,305,nil,1,7411)
	self:addTradeFlags(RecipeDB,34001,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34001,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Assault -- 34002
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34002,300,nil,1,7411)
	self:addTradeFlags(RecipeDB,34002,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34002,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Spell Penetration -- 34003
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34003,325,nil,1,7411)
	self:addTradeFlags(RecipeDB,34003,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,105)
	self:addTradeAcquire(RecipeDB,34003,6,933,1,20242,6,933,1,23007)

	-- Enchant Cloak - Greater Agility -- 34004
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34004,310,nil,1,7411)
	self:addTradeFlags(RecipeDB,34004,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,34004,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Greater Arcane Resistance -- 34005
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34005,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,34005,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,34005,3,19796)

	-- Enchant Cloak - Greater Shadow Resistance -- 34006
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34006,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,34006,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,34006,3,18870)

	-- Enchant Boots - Cat's Swiftness -- 34007
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34007,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,34007,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34007,3,24664,3,24664)

	-- Enchant Boots - Boar's Speed -- 34008
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34008,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,34008,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34008,3,24664,3,24664)

	-- Enchant Shield - Major Stamina -- 34009
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34009,325,nil,1,7411)
	self:addTradeFlags(RecipeDB,34009,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34009,2,19663)

	-- Enchant Weapon - Major Healing -- 34010
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34010,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,34010,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,111)
	self:addTradeAcquire(RecipeDB,34010,6,935,3,21432)

	-- Nexus Transformation -- 42613
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42613,300,22448,1,7411)
	self:addTradeFlags(RecipeDB,42613,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42613,1,18753,1,18773,1,19252)

	-- Small Prismatic Shard -- 42615
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42615,335,22448,1,7411)
	self:addTradeFlags(RecipeDB,42615,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42615,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Weapon - Greater Agility -- 42620
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42620,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,42620,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,114)
	self:addTradeAcquire(RecipeDB,42620,6,967,4,18255)

	-- Enchant Weapon - Executioner -- 42974
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42974,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,42974,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,42974,8,29)

	-- Enchant Shield - Resilience -- 44383
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44383,330,nil,1,7411)
	self:addTradeFlags(RecipeDB,44383,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44383,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Superior Frost Resistance -- 44483
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44483,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,44483,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44483,3,32289)

	-- Enchant Gloves - Expertise -- 44484
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44484,405,nil,1,7411)
	self:addTradeFlags(RecipeDB,44484,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44484,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Precision -- 44488
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44488,410,nil,1,7411)
	self:addTradeFlags(RecipeDB,44488,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44488,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Shield - Defense -- 44489
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44489,420,nil,1,7411)
	self:addTradeFlags(RecipeDB,44489,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44489,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Mighty Health -- 44492
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44492,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,44492,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44492,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Superior Nature Resistance -- 44494
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44494,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,44494,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44494,3,32290)

	-- Enchant Cloak - Superior Agility -- 44500
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44500,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,44500,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,44500,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Gatherer -- 44506
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44506,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,44506,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44506,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Greater Spirit -- 44508
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44508,410,nil,1,7411)
	self:addTradeFlags(RecipeDB,44508,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44508,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Greater Mana Restoration -- 44509
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44509,420,nil,1,7411)
	self:addTradeFlags(RecipeDB,44509,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44509,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Exceptional Spirit -- 44510
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44510,410,nil,1,7411)
	self:addTradeFlags(RecipeDB,44510,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44510,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Greater Assault -- 44513
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44513,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,44513,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44513,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Icebreaker -- 44524
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44524,425,nil,1,7411)
	self:addTradeFlags(RecipeDB,44524,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,44524,2,32514)

	-- Enchant Boots - Greater Fortitude -- 44528
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44528,385,nil,1,7411)
	self:addTradeFlags(RecipeDB,44528,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44528,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Major Agility -- 44529
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44529,415,nil,1,7411)
	self:addTradeFlags(RecipeDB,44529,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44529,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Exceptional Intellect -- 44555
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44555,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,44555,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44555,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Superior Fire Resistance -- 44556
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44556,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,44556,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44556,3,30921,3,31321)

	-- Enchant Bracers - Greater Assault -- 44575
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44575,430,nil,1,7411)
	self:addTradeFlags(RecipeDB,44575,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,44575,2,32514)

	-- Enchant Weapon - Lifeward -- 44576
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44576,440,nil,3,7411)
	self:addTradeFlags(RecipeDB,44576,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44576,2,32514)

	-- Enchant Cloak - Spell Piercing -- 44582
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44582,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,44582,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,44582,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Greater Vitality -- 44584
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44584,405,nil,1,7411)
	self:addTradeFlags(RecipeDB,44584,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44584,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Exceptional Resilience -- 44588
	-- Ignored
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,44588,9999,nil,1,7411)
	--self:addTradeFlags(RecipeDB,44588,3,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB,44588,)

	-- Enchant Boots - Superior Agility -- 44589
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44589,415,nil,1,7411)
	self:addTradeFlags(RecipeDB,44589,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44589,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Superior Shadow Resistance -- 44590
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44590,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,44590,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44590,3,32349)

	-- Enchant Cloak - Titanweave -- 44591
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44591,435,nil,1,7411)
	self:addTradeFlags(RecipeDB,44591,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44591,2,32514)

	-- Enchant Gloves - Exceptional Spellpower -- 44592
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44592,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,44592,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44592,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Major Spirit -- 44593
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44593,420,nil,1,7411)
	self:addTradeFlags(RecipeDB,44593,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44593,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant 2H Weapon - Scourgebane -- 44595
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44595,430,nil,3,7411)
	self:addTradeFlags(RecipeDB,44595,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44595,2,32514)

	-- Enchant Cloak - Superior Arcane Resistance -- 44596
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44596,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,44596,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44596,3,31702)

	-- Enchant Bracers - Expertise -- 44598
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44598,415,nil,1,7411)
	self:addTradeFlags(RecipeDB,44598,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44598,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Greater Blasting -- 44612
	-- Ignored
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,44612,9999,nil,1,7411)
	--self:addTradeFlags(RecipeDB,44612,3,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB,44612,)

	-- Enchant Bracers - Greater Stats -- 44616
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44616,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,44616,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44616,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Giant Slayer -- 44621
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44621,430,nil,1,7411)
	self:addTradeFlags(RecipeDB,44621,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,44621,2,32514)

	-- Enchant Chest - Super Stats -- 44623
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44623,370,nil,1,7411)
	self:addTradeFlags(RecipeDB,44623,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44623,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Armsman -- 44625
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44625,435,nil,2,7411)
	self:addTradeFlags(RecipeDB,44625,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44625,2,32514)

	-- Enchant Weapon - Exceptional Spellpower -- 44629
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44629,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,44629,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44629,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant 2H Weapon - Greater Savagery -- 44630
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44630,380,nil,1,7411)
	self:addTradeFlags(RecipeDB,44630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44630,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Shadow Armor -- 44631
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44631,440,nil,1,7411)
	self:addTradeFlags(RecipeDB,44631,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,44631,2,32514)

	-- Enchant Weapon - Exceptional Agility -- 44633
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44633,410,nil,1,7411)
	self:addTradeFlags(RecipeDB,44633,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44633,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Greater Spellpower -- 44635
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44635,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,44635,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44635,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Ring - Greater Spellpower -- 44636
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44636,400,nil,1, 7411)
	self:addTradeFlags(RecipeDB,44636,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44636,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Ring - Assault -- 44645
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44645,400,nil,1, 7411)
	self:addTradeFlags(RecipeDB,44645,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44645,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Void Shatter -- 45765
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,45765,375,22449,1,7411)
	self:addTradeFlags(RecipeDB,45765,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB,45765,6,1077,2,25032)

	-- Enchant Weapon - Deathfrost -- 46578
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46578,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,46578,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,46578,5,4)

	-- Enchant Chest - Defense -- 46594
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,46594,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,46594,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,112)
	self:addTradeAcquire(RecipeDB,46594,6,1077,2,25032)

	-- Enchant Cloak - Steelweave -- 47051
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47051,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,47051,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,47051,3,24560)

	-- Enchant Cloak - Mighty Armor -- 47672
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47672,430,nil,2,7411)
	self:addTradeFlags(RecipeDB,47672,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,47672,2,32514)

	-- Enchant Chest - Greater Defense -- 47766
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47766,400,nil,1,7411)
	self:addTradeFlags(RecipeDB,47766,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,47766,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Greater Speed -- 47898
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47898,430,nil,2,7411)
	self:addTradeFlags(RecipeDB,47898,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,47898,2,32514)

	-- Enchant Cloak - Wisdom -- 47899
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47899,440,nil,2,7411)
	self:addTradeFlags(RecipeDB,47899,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,47899,2,32514)

	-- Enchant Chest - Super Health -- 47900
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47900,425,nil,1,7411)
	self:addTradeFlags(RecipeDB,47900,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,47900,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Tuskarr's Vitality -- 47901
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47901,440,nil,2,7411)
	self:addTradeFlags(RecipeDB,47901,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,47901,2,32514)

	-- Enchant Weapon - Accuracy -- 59619
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59619,440,nil,1,7411)
	self:addTradeFlags(RecipeDB,59619,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,59619,2,32514)

	-- Enchant Weapon - Berserking -- 59621
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59621,440,nil,1,7411)
	self:addTradeFlags(RecipeDB,59621,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,59621,2,32514)

	-- Enchant Weapon - Black Magic -- 59625
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59625,440,nil,3,7411)
	self:addTradeFlags(RecipeDB,59625,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59625,2,32514)

	-- Enchant Ring - Stamina -- 59636
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59636,400,nil,1, 7411)
	self:addTradeFlags(RecipeDB,59636,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59636,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Assault -- 60606
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60606,375,nil,1,7411)
	self:addTradeFlags(RecipeDB,60606,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60606,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Speed -- 60609
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60609,350,nil,1,7411)
	self:addTradeFlags(RecipeDB,60609,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,60609,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Striking -- 60616
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60616,360,nil,1,7411)
	self:addTradeFlags(RecipeDB,60616,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60616,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Runed Titanium Rod -- 60619
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60619,425,44452,3,7411)
	self:addTradeFlags(RecipeDB,60619,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,60619,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Greater Potency -- 60621
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60621,380,nil,1,7411)
	self:addTradeFlags(RecipeDB,60621,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60621,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Icewalker -- 60623
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60623,385,nil,1,7411)
	self:addTradeFlags(RecipeDB,60623,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60623,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Shield - Greater Intellect -- 60653
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60653,395,nil,1,7411)
	self:addTradeFlags(RecipeDB,60653,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60653,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Major Agility -- 60663
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60663,420,nil,1,7411)
	self:addTradeFlags(RecipeDB,60663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,60663,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Crusher -- 60668
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60668,425,nil,1,7411)
	self:addTradeFlags(RecipeDB,60668,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60668,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant 2H Weapon - Massacre -- 60691
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60691,430,nil,3,7411)
	self:addTradeFlags(RecipeDB,60691,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60691,2,32514)

	-- Enchant Chest - Powerful Stats -- 60692
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60692,440,nil,2,7411)
	self:addTradeFlags(RecipeDB,60692,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60692,2,32514)

	-- Enchant Weapon - Superior Potency -- 60707
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60707,435,nil,3,7411)
	self:addTradeFlags(RecipeDB,60707,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60707,2,32514)

	-- Enchant Weapon - Mighty Spellpower -- 60714
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60714,435,nil,3,7411)
	self:addTradeFlags(RecipeDB,60714,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60714,2,32514)

	-- Enchant Boots - Greater Assault -- 60763
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60763,440,nil,2,7411)
	self:addTradeFlags(RecipeDB,60763,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60763,2,32514)

	-- Enchant Bracers - Superior Spellpower -- 60767
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60767,440,nil,2,7411)
	self:addTradeFlags(RecipeDB,60767,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60767,2,32514)

	local version = GetBuildInfo()

	if (version == "3.0.8") then

	-- Enchant Bracers - Stamina -- ???
	recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,60767,440,nil,2,7411)
	--self:addTradeFlags(RecipeDB,60767,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB,60767,2,32514)
	
	-- Enchant Weapons - Stamina -- ???
	recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,60767,440,nil,2,7411)
	--self:addTradeFlags(RecipeDB,60767,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB,60767,2,32514)

	end

	return recipecount

end
