--[[

************************************************************************

ARL-Enchant.lua

Enchanting data for all of Ackis Recipe List

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

	-- Enchant Chest - Minor Mana -- 6342
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6342,20,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6342,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6342,7,1)

	-- Enchant Bracer - Minor Spirit -- 6344
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6344,60,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6344,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6344,7,1)

	-- Enchant Cloak - Minor Protection -- 6345
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6345,90,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6345,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,6345,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Mana -- 6346
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6346,80,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6346,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6346,2,3346,2,5757)

	-- Enchant Bracer - Minor Strength -- 6347
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6347,80,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6347,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6347,7,1)

	-- Enchant Weapon - Minor Beastslayer -- 6348
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6348,90,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6348,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6348,7,1)

	-- Enchant 2H Weapon - Lesser Intellect -- 6349
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6349,100,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6349,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6349,2,3012,2,3346,2,5158,2,5758)

	-- Enchant Bracer - Lesser Spirit -- 6375
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6375,120,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6375,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6375,7,1)

	-- Enchant Boots - Minor Stamina -- 6376
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6376,125,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6376,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6376,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Boots - Minor Agility -- 6377
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6377,125,nil, 1,7411)
	self:addTradeFlags(RecipeDB,6377,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6377,2,3012,2,3537)

	-- Enchant Bracer - Minor Health -- 7418
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7418,1,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7418,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7418,8,8)

	-- Enchant Chest - Minor Health -- 7420
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7420,15,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7420,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7420,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Runed Copper Rod -- 7421
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7421,1,6218,1,7411)
	self:addTradeFlags(RecipeDB,7421,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,7421,8,8)

	-- Enchant Chest - Minor Absorption -- 7426
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7426,40,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7426,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7426,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Deflection -- 7428
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7428,1,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7428,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7428,8,8)

	-- Enchant Cloak - Minor Resistance -- 7454
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7454,45,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7454,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,7454,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Stamina -- 7457
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7457,50,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7457,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7457,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Minor Impact -- 7745
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7745,90,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7745,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7745,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Health -- 7748
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7748,60,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7748,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7748,1,1317,1,3011,1,3345,1,3606,1,4213,1,4616,1,5157,1,5695,1,11065,1,11066,1,11067,1,11068,1,11070,1,11071,1,11072,1,11073,1,11074,1,16160,1,16633,1,16634,1,16725,1,16742,1,19248,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Minor Agility -- 7779
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7779,80,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7779,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7779,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Weapon - Minor Striking -- 7788
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7788,90,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7788,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7788,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Runed Silver Rod -- 7795
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7795,100,6339,1,7411)
	self:addTradeFlags(RecipeDB,7795,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,7795,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Health -- 7857
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7857,120,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7857,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7857,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Cloak - Lesser Fire Resistance -- 7861
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7861,125,nil, 1,7411)
	self:addTradeFlags(RecipeDB,7861,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,7861,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Lesser Spirit -- 11038
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11038,110,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11038,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11038,7,1)

	-- Enchant Cloak - Minor Agility -- 11039
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11039,110,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11039,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,11039,7,1,2,3954,2,12043)

	-- Enchant Shield - Lesser Protection -- 11081
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11081,115,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11081,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11081,7,1)

	-- Enchant Cloak - Lesser Shadow Resistance -- 11098
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11098,135,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11098,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,11098,7,1)

	-- Enchant Bracer - Lesser Strength -- 11101
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11101,140,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11101,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11101,2,3954,2,12043)

	-- Enchant Gloves - Mining -- 11150
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11150,145,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11150,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11150,3,1015,3,1017,3,1051,3,1052,3,1053,3,1054,3,1364,3,1417)

	-- Enchant Gloves - Herbalism -- 11151
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11151,145,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11151,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11151,3,3809,3,3818,3,3825,3,3834,3,3919,3,4028,3,4029,3,4041,3,4042)

	-- Enchant Gloves - Fishing -- 11152
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11152,145,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11152,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11152,3,2356,3,2374,3,2375,3,2376,3,2377,3,14276)

	-- Enchant Bracer - Lesser Deflection -- 11163
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11163,170,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11163,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11163,2,2381,2,2821)

	-- Enchant Weapon - Lesser Beastslayer -- 11164
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11164,175,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11164,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11164,7,1)

	-- Enchant Weapon - Lesser Elemental Slayer -- 11165
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11165,175,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11165,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11165,7,1)

	-- Enchant Gloves - Skinning -- 11166
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11166,200,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11166,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11166,3,2556,3,2557,3,2558,3,2606)

	-- Enchant Boots - Lesser Spirit -- 11167
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11167,190,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11167,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11167,7,1)

	-- Enchant Shield - Lesser Block -- 11168
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11168,195,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11168,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11168,3,4298,3,6426)

	-- Enchant Shield - Stamina -- 11202
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11202,210,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11202,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11202,7,1)

	-- Enchant Gloves - Advanced Mining -- 11203
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11203,215,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11203,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11203,3,674,3,684,3,772,3,1550)

	-- Enchant Bracer - Greater Spirit -- 11204
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11204,220,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11204,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11204,7,1)

	-- Enchant Gloves - Advanced Herbalism -- 11205
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11205,225,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11205,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11205,3,764,3,765,3,766,3,1081,3,1082)

	-- Enchant Cloak - Lesser Agility -- 11206
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11206,225,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11206,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,11206,3,2246,3,2407,3,5420,3,5623,3,7805)

	-- Enchant Weapon - Fiery Weapon -- 11207
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11207,265,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11207,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11207,3,8913,3,9024)

	-- Enchant Weapon - Demonslaying -- 11208
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11208,230,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11208,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11208,7,1)

	-- Enchant Bracer - Deflection -- 11223
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11223,235,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11223,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11223,2,989,2,4229)

	-- Enchant Shield - Frost Resistance -- 11224
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11224,235,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11224,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11224,3,5256,3,7855,3,10184,3,12397)

	-- Enchant Bracer - Greater Stamina -- 11225
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11225,245,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11225,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11225,7,1)

	-- Enchant Gloves - Riding Skill -- 11226
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11226,250,nil, 1,7411)
	self:addTradeFlags(RecipeDB,11226,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11226,3,6514,3,7155,3,8889,3,8893,3,10184,3,12206)

	-- Enchant Shield - Minor Stamina -- 13378
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13378,105,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13378,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13378,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Cloak - Lesser Protection -- 13421
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13421,115,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13421,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13421,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Shield - Lesser Spirit -- 13485
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13485,130,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13485,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13485,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Stamina -- 13501
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13501,130,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13501,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13501,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Weapon - Lesser Striking -- 13503
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13503,140,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13503,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13503,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant 2H Weapon - Lesser Impact -- 13529
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13529,130,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13529,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13529,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Lesser Absorption -- 13538
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13538,140,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13538,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13538,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Mana -- 13607
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13607,145,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13607,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13607,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Bracer - Lesser Intellect -- 13622
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13622,150,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13622,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13622,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Chest - Minor Stats -- 13626
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13626,150,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13626,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13626,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Runed Golden Rod -- 13628
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13628,150,11130,1,7411)
	self:addTradeFlags(RecipeDB,13628,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,13628,1,1317,1,3011,1,3345,1,4213,1,4616,1,5157,1,7949,1,11072,1,11073,1,11074,1,16633,1,16725,1,19249,1,19250,1,19251)

	-- Enchant Shield - Lesser Stamina -- 13631
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13631,155,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13631,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13631,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Defense -- 13635
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13635,155,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13635,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13635,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Agility -- 13637
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13637,160,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13637,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13637,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Greater Health -- 13640
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13640,160,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13640,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13640,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Spirit -- 13642
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13642,165,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13642,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13642,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Lesser Stamina -- 13644
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13644,170,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13644,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13644,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Stamina -- 13648
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13648,170,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13648,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13648,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Fire Resistance -- 13657
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13657,175,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13657,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13657,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Shield - Spirit -- 13659
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13659,180,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13659,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13659,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Strength -- 13661
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13661,180,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13661,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Greater Mana -- 13663
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13663,185,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13663,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Weapon - Striking -- 13693
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13693,195,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13693,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13693,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant 2H Weapon - Impact -- 13695
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13695,180,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13695,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13695,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Lesser Stats -- 13700
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13700,200,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13700,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13700,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Runed Truesilver Rod -- 13702
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13702,200,11145,1,7411)
	self:addTradeFlags(RecipeDB,13702,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,13702,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Greater Defense -- 13746
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13746,205,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13746,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13746,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Cloak - Resistance -- 13794
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13794,205,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13794,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,13794,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Agility -- 13815
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13815,210,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13815,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13815,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Bracer - Intellect -- 13822
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13822,210,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13822,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13822,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Stamina -- 13836
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13836,215,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13836,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Chest - Superior Health -- 13858
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13858,220,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13858,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13858,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Gloves - Strength -- 13887
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13887,225,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13887,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13887,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Boots - Minor Speed -- 13890
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13890,225,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13890,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13890,1,11072,1,11073,1,11074,1,19250,1,19251)

	-- Enchant Shield - Greater Spirit -- 13905
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13905,230,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13905,1,11073,1,19251)

	-- Enchant Chest - Superior Mana -- 13917
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13917,230,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13917,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13917,1,11073,1,19251)

	-- Enchant Boots - Agility -- 13935
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13935,235,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13935,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13935,1,11073,1,19251)

	-- Enchant 2H Weapon - Greater Impact -- 13937
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13937,220,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13937,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13937,1,11073,1,19251)

	-- Enchant Bracer - Greater Strength -- 13939
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13939,240,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13939,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13939,1,11073,1,19251)

	-- Enchant Chest - Stats -- 13941
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13941,245,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13941,1,11073,1,19251)

	-- Enchant Weapon - Greater Striking -- 13943
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13943,245,nil, 1,7411)
	self:addTradeFlags(RecipeDB,13943,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,13943,1,11073,1,19251)

	-- Enchant Gloves - Minor Haste -- 13948
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,13948,250,nil, 1,7411)
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

	-- Enchant Bracer - Greater Intellect -- 16214
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16214,255,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16214,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16214,1,11073,1,19251)

	-- Enchant Boots - Greater Stamina -- 16215
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16215,260,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16215,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16215,7,1)

	-- Enchant Cloak - Greater Resistance -- 16216
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16216,265,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16216,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,16216,1,11073,1,19251)

	-- Enchant Shield - Greater Stamina -- 16217
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16217,265,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16217,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16217,2,4229,2,4561)

	-- Enchant Bracer - Superior Spirit -- 16218
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16218,270,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16218,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16218,7,1)

	-- Enchant Gloves - Greater Agility -- 16219
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16219,270,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16219,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16219,1,11073,1,19251)

	-- Enchant Boots - Spirit -- 16220
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16220,275,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16220,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16220,7,1)

	-- Enchant Chest - Major Health -- 16221
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16221,275,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16221,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16221,2,11189)

	-- Enchant Shield - Superior Spirit -- 16222
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16222,280,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16222,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16222,1,11073,1,19251)

	-- Enchant Weapon - Icy Chill -- 16223
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16223,285,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16223,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16223,3,7444,3,7448,3,7457,3,7524)

	-- Enchant Cloak - Superior Defense -- 16224
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16224,285,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16224,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,16224,2,12022)

	-- Enchant Chest - Major Mana -- 16242
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16242,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16242,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16242,1,11073,1,19251)

	-- Enchant Gloves - Greater Strength -- 16244
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16244,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16244,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16244,1,11073,1,19251)

	-- Enchant Boots - Greater Agility -- 16245
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16245,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16245,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16245,3,13300,1,11073,1,19251)

	-- Enchant Bracer - Superior Strength -- 16246
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16246,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16246,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16246,3,7372)

	-- Enchant 2H Weapon - Superior Impact -- 16247
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16247,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16247,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16247,3,10317,3,10339,3,10366)

	-- Enchant Weapon - Unholy Weapon -- 16248
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16248,295,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16248,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16248,3,10398,3,16772,3,16810,3,18477,3,18595)

	-- Enchant 2H Weapon - Major Intellect -- 16249
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16249,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16249,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16249,3,10422)

	-- Enchant Weapon - Superior Striking -- 16250
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16250,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16250,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16250,3,9216,3,9568)

	-- Enchant Bracer - Superior Stamina -- 16251
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16251,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16251,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16251,7,1)

	-- Enchant Weapon - Crusader -- 16252
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16252,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16252,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16252,3,4494,3,9451)

	-- Enchant Chest - Greater Stats -- 16253
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16253,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16253,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16253,7,1)

	-- Enchant Weapon - Lifestealing -- 16254
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16254,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16254,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16254,3,10499)

	-- Enchant 2H Weapon - Major Spirit -- 16255
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,16255,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,16255,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16255,3,10469,3,10477)

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

	-- Enchant Weapon - Winter's Might -- 17725
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17725,190,nil, 1,7411)
	self:addTradeFlags(RecipeDB,17725,21,22,23,24,25,26,27,28,29,30,36,40)
	-- No acquire information

	-- Enchant Weapon - Spell Power -- 18259
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18259,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,18259,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18259,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Enchant Weapon - Healing Power -- 18260
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18260,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,18260,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18260,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259,3,12264)

	-- Enchant Weapon - Strength -- 19444
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19444,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,19444,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19444,2,12944)

	-- Enchant Weapon - Agility -- 19445
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19445,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,19445,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,99)
	self:addTradeAcquire(RecipeDB,19445,6,576,2,11557)

	-- Enchant Bracer - Mana Regeneration -- 19446
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19446,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,19446,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,96)
	self:addTradeAcquire(RecipeDB,19446,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Enchant Bracer - Healing Power -- 19447
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19447,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,19447,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,96)
	self:addTradeAcquire(RecipeDB,19447,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Enchant Weapon - Mighty Spirit -- 19448
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19448,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,19448,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19448,2,12944)

	-- Enchant Weapon - Mighty Intellect -- 19449
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,19449,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,19449,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19449,2,12944)

	-- Runed Arcanite Rod -- 20051
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20051,290,16207,1,7411)
	self:addTradeFlags(RecipeDB,20051,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,20051,2,12022)

	-- Enchant Gloves - Shadow Power -- 20727
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20727,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20727,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20727,3,15263,3,15299,3,15341,3,15348,3,15370,3,15509,3,15510,3,15516,3,15517,3,15544)

	-- Enchant Gloves - Frost Power -- 20728
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20728,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20728,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20728,7,1)

	-- Enchant Gloves - Fire Power -- 20729
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20729,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20729,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20729,7,1)

	-- Enchant Gloves - Healing Power -- 20730
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20730,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20730,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20730,3,15263,3,15299,3,15339,3,15341,3,15509,3,15510,3,15516,3,15517,3,15543,3,15544)

	-- Enchant Cloak - Greater Fire Resistance -- 20732
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20732,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20732,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,97)
	self:addTradeAcquire(RecipeDB,20732,6,609,1,15419)

	-- Enchant Cloak - Greater Nature Resistance -- 20733
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,20733,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,20733,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,97)
	self:addTradeAcquire(RecipeDB,20733,6,609,2,15419)

	-- Enchant 2H Weapon - Agility -- 22392
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22392,290,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22392,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,99)
	self:addTradeAcquire(RecipeDB,22392,6,576,1,11557)

	-- Enchant Bracer - Major Defense -- 22530
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22530,320,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22530,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22530,3,22822)

	-- Enchant Bracer - Restore Mana Prime -- 22532
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22532,335,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22532,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22532,7,1)

	-- Enchant Bracer - Fortitude -- 22533
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22533,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22533,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22533,3,17803)

	-- Enchant Bracer - Spellpower -- 22534
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22534,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22534,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22534,3,19952,3,20058)

	-- Enchant Shield - Intellect -- 22539
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22539,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22539,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22539,2,18664)

	-- Enchant Shield - Shield Block -- 22540
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22540,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22540,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22540,7,1)

	-- Enchant Shield - Resistance -- 22541
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22541,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22541,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22541,7,1)

	-- Enchant Boots - Fortitude -- 22543
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22543,320,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22543,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22543,3,18317)

	-- Enchant Boots - Dexterity -- 22544
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22544,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22544,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22544,3,18521)

	-- Enchant Boots - Surefooted -- 22545
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22545,370,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22545,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22545,3,16472)

	-- Enchant Cloak - Major Resistance -- 22548
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22548,330,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22548,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,22548,7,1)

	-- Enchant Weapon - Major Intellect -- 22551
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22551,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22551,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22551,3,20136)

	-- Enchant Weapon - Major Striking -- 22552
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22552,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22552,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,105)
	self:addTradeAcquire(RecipeDB,22552,6,933,2,20242,6,933,2,23007)

	-- Enchant Weapon - Potency -- 22553
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22553,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22553,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22553,7,1)

	-- Enchant 2H Weapon - Savagery -- 22554
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22554,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22554,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22554,3,17465)

	-- Enchant Weapon - Major Spellpower -- 22555
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22555,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22555,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22555,3,22242,3,23385)

	-- Enchant 2H Weapon - Major Agility -- 22556
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22556,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22556,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22556,3,20880)

	-- Enchant Weapon - Battlemaster -- 22557
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22557,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22557,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22557,3,16539,3,17269,3,18472,3,20410)

	-- Enchant Weapon - Spellsurge -- 22558
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22558,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22558,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22558,3,16409,3,16488,3,16492,3,17940,3,18631,3,18639,3,24697,3,25060)

	-- Enchant Weapon - Mongoose -- 22559
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22559,375,nil, 3,7411)
	self:addTradeFlags(RecipeDB,22559,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22559,3,15687)

	-- Enchant Weapon - Sunfire -- 22560
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22560,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22560,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22560,3,16524)

	-- Enchant Weapon - Soulfrost -- 22561
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22561,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,22561,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22561,3,15688)

	-- Enchant Bracer - Superior Healing -- 24000
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24000,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,24000,2,4,21,22,23,24,25,26,27,28,29,30,36,40,104)
	self:addTradeAcquire(RecipeDB,24000,6,947,1,17585,6,947,1,17585)

	-- Enchant Chest - Exceptional Stats -- 24003
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24003,345,nil, 1,7411)
	self:addTradeFlags(RecipeDB,24003,2,4,21,22,23,24,25,26,27,28,29,30,36,40,104)
	self:addTradeAcquire(RecipeDB,24003,6,947,3,17585,6,947,3,17585)

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

	-- Enchant Bracer - Brawn -- 27899
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27899,305,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27899,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Stats -- 27905
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27905,315,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27905,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Ring - Striking -- 27920
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27920,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27920,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,105)
	self:addTradeAcquire(RecipeDB,27920,6,933,3,17518)

	-- Enchant Ring - Spellpower -- 27924
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27924,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27924,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,106)
	self:addTradeAcquire(RecipeDB,27924,6,989,2,21643)

	-- Enchant Ring - Healing Power -- 27926
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27926,370,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27926,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,111)
	self:addTradeAcquire(RecipeDB,27926,6,935,3,21432)

	-- Enchant Ring - Stats -- 27927
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27927,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27927,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,107)
	self:addTradeAcquire(RecipeDB,27927,6,1011,2,21655)

	-- Enchant Shield - Tough Shield -- 27944
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27944,310,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27944,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27944,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Exceptional Health -- 27957
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27957,315,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27957,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27957,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Exceptional Mana -- 27958
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27958,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27958,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Cloak - Major Armor -- 27961
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27961,310,nil, 1,7411)
	self:addTradeFlags(RecipeDB,27961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,27961,1,18753,1,18773,1,19252,1,19540)

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

	-- Arcane Dust -- 28021
	-- Ignored
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,28021,315,22445,1,7411)
	--self:addTradeFlags(RecipeDB,28021,3,21,22,23,24,25,26,27,28,29,30,36,41)
	--self:addTradeAcquire(RecipeDB,28021,)

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

	-- Enchant Chest - Major Resilience -- 28270
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28270,345,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28270,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28270,7,1)

	-- Enchant Gloves - Precise Strikes -- 28271
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28271,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28271,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,103)
	self:addTradeAcquire(RecipeDB,28271,6,942,3,17904)

	-- Enchant Gloves - Major Spellpower -- 28272
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28272,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28272,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,106)
	self:addTradeAcquire(RecipeDB,28272,6,989,2,21643)

	-- Enchant Gloves - Major Healing -- 28273
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28273,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28273,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,111)
	self:addTradeAcquire(RecipeDB,28273,6,935,2,21432)

	-- Enchant Cloak - Spell Penetration -- 28274
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28274,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28274,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,105)
	self:addTradeAcquire(RecipeDB,28274,6,933,1,20242,6,933,1,23007)

	-- Enchant Cloak - Greater Arcane Resistance -- 28276
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28276,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28276,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,28276,3,19796)

	-- Enchant Cloak - Greater Shadow Resistance -- 28277
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28277,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28277,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,28277,3,18870)

	-- Enchant Weapon - Major Healing -- 28281
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28281,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28281,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,111)
	self:addTradeAcquire(RecipeDB,28281,6,935,3,21432)

	-- Enchant Shield - Major Stamina -- 28282
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28282,325,nil, 1,7411)
	self:addTradeFlags(RecipeDB,28282,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28282,2,19663)

	-- Runed Fel Iron Rod -- 32664
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32664,300,22461,1,7411)
	self:addTradeFlags(RecipeDB,32664,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32664,1,18753,1,18773,1,19252,1,19540)

	-- Runed Adamantite Rod -- 32665
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32665,350,22462,1,7411)
	self:addTradeFlags(RecipeDB,32665,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32665,2,18960)

	-- Runed Eternium Rod -- 32667
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32667,375,22463,1,7411)
	self:addTradeFlags(RecipeDB,32667,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,32667,2,19663)

	-- Enchant Cloak - Dodge -- 33148
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33148,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33148,1,2,4,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,107)
	self:addTradeAcquire(RecipeDB,33148,3,15263,3,15299,3,15340,3,15341,3,15348,3,15369,3,15509,3,15510,3,15516,3,15517,6,1011,4,21655)

	-- Enchant Cloak - Stealth -- 33149
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33149,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33149,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,63,103)
	self:addTradeAcquire(RecipeDB,33149,7,1,6,942,4,17904)

	-- Enchant Cloak - Subtlety -- 33151
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33151,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33151,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,40,63,104)
	self:addTradeAcquire(RecipeDB,33151,3,15276,6,947,4,17585,6,947,4,17585)

	-- Enchant Gloves - Superior Agility -- 33152
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33152,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33152,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40,106)
	self:addTradeAcquire(RecipeDB,33152,7,1,6,989,4,21643)

	-- Enchant Gloves - Threat -- 33153
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33153,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33153,1,2,4,6,11,21,22,23,24,25,26,27,28,29,30,36,40,111)
	self:addTradeAcquire(RecipeDB,33153,3,15275,6,935,4,21432)

	-- Enchant Weapon - Greater Agility -- 33165
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33165,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33165,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,114)
	self:addTradeAcquire(RecipeDB,33165,6,967,4,18255)

	-- Enchant Weapon - Executioner -- 33307
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33307,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33307,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33307,3,23574,3,23576,3,23577,3,23578,3,23834,3,23863,3,24239,3,24530)

	-- Enchant Chest - Major Spirit -- 33990
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33990,320,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33990,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33990,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Chest - Restore Mana Prime -- 33991
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33991,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33991,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33991,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Blasting -- 33993
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33993,305,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33993,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33993,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Major Strength -- 33995
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33995,340,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33995,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33995,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Gloves - Assault -- 33996
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33996,310,nil, 1,7411)
	self:addTradeFlags(RecipeDB,33996,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33996,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Major Intellect -- 34001
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34001,305,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34001,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34001,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Bracer - Assault -- 34002
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34002,300,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34002,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,34002,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Cloak - Greater Agility -- 34004
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,34004,310,nil, 1,7411)
	self:addTradeFlags(RecipeDB,34004,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,34004,1,18753,1,18773,1,19252,1,19540)

	-- Enchant Boots - Boar's Speed -- 35297
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,35297,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,35297,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,35297,3,24664,3,24664)

	-- Enchant Boots - Vitality -- 35298
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,35298,305,nil, 1,7411)
	self:addTradeFlags(RecipeDB,35298,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,35298,3,24664,3,24664)

	-- Enchant Boots - Cat's Swiftness -- 35299
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,35299,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,35299,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,35299,3,24664,3,24664)

	-- Enchant Weapon - Deathfrost -- 35498
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,35498,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,35498,21,22,23,24,25,26,27,28,29,30,36,40)
	-- No acquire information

	-- Enchant Chest - Defense -- 35500
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,35500,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,35500,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,112)
	self:addTradeAcquire(RecipeDB,35500,6,1077,2,25032)

	-- Enchant Cloak - Steelweave -- 35756
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,35756,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,35756,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,35756,3,24560)

	-- Enchant Cloak - Superior Arcane Resistance -- 37330
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37330,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37330,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37330,3,31702)

	-- Enchant Cloak - Superior Fire Resistance -- 37331
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37331,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37331,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37331,3,30921,3,31321)

	-- Enchant Cloak - Superior Frost Resistance -- 37332
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37332,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37332,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37332,3,32289)

	-- Enchant Cloak - Superior Nature Resistance -- 37333
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37333,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37333,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37333,3,32290)

	-- Enchant Cloak - Superior Shadow Resistance -- 37334
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37334,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37334,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37334,3,32349)

	-- Enchant Weapon - Giant Slayer -- 37339
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37339,430,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37339,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,37339,2,32514)

	-- Enchant Weapon - Icebreaker -- 37344
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37344,425,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37344,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,37344,2,32514)

	-- Enchant Cloak - Titanweave -- 37347
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37347,435,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37347,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37347,2,32514)

	-- Enchant Cloak - Shadow Armor -- 37349
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,37349,440,nil, 1,7411)
	self:addTradeFlags(RecipeDB,37349,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,37349,2,32514)

	-- Enchant Weapon - Lifeward -- 38972
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38972,440,nil, 3,7411)
	self:addTradeFlags(RecipeDB,38972,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38972,2,32514)

	-- Enchant 2H Weapon - Scourgebane -- 38981
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38981,430,nil, 3,7411)
	self:addTradeFlags(RecipeDB,38981,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38981,2,32514)

	-- Enchant Gloves - Armsman -- 38990
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38990,435,nil, 2,7411)
	self:addTradeFlags(RecipeDB,38990,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38990,2,32514)

	-- Enchant Cloak - Mighty Armor -- 39001
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39001,430,nil, 2,7411)
	self:addTradeFlags(RecipeDB,39001,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,39001,2,32514)

	-- Enchant Cloak - Greater Speed -- 39003
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39003,430,nil, 2,7411)
	self:addTradeFlags(RecipeDB,39003,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,39003,2,32514)

	-- Enchant Cloak - Wisdom -- 39004
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39004,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,39004,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,39004,2,32514)

	-- Enchant Boots - Tuskarr's Vitality -- 39006
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39006,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,39006,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39006,2,32514)

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

	-- Enchant Weapon - Black Magic -- 43987
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,43987,440,nil, 3,7411)
	self:addTradeFlags(RecipeDB,43987,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43987,2,32514)

	-- Enchant Shield - Resilience -- 44383
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44383,330,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44383,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant 2H Weapon - Massacre -- 44463
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44463,430,nil, 3,7411)
	self:addTradeFlags(RecipeDB,44463,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44463,2,32514)

	-- Enchant Chest - Powerful Stats -- 44465
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44465,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44465,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44465,2,32514)

	-- Enchant Weapon - Superior Potency -- 44466
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44466,435,nil, 3,7411)
	self:addTradeFlags(RecipeDB,44466,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44466,2,32514)

	-- Enchant Weapon - Mighty Spellpower -- 44467
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44467,435,nil, 3,7411)
	self:addTradeFlags(RecipeDB,44467,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44467,2,32514)

	-- Enchant Boots - Greater Assault -- 44469
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44469,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44469,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44469,2,32514)

	-- Enchant Bracers - Superior Spellpower -- 44470
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44470,440,nil, 2,7411)
	self:addTradeFlags(RecipeDB,44470,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44470,2,32514)

	-- Enchant Bracers - Greater Assault -- 44484
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44484,430,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44484,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,44484,1,26906,1,26954,1,26980,1,26990,1,28693,2,32514)

	-- Enchant Gloves - Expertise -- 44484
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44484,405,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44484,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44484,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Precision -- 44488
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44488,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44488,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44488,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Shield - Defense -- 44489
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44489,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44489,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44489,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Berserking -- 44492
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44492,440,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44492,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,44492,1,26906,1,26954,1,26980,1,26990,1,28693,2,32514)

	-- Enchant Chest - Mighty Health -- 44492
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44492,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44492,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44492,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Accuracy -- 44496
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44496,440,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44496,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,44496,2,32514)

	-- Enchant Cloak - Superior Agility -- 44500
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44500,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44500,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,44500,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Gatherer -- 44506
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44506,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44506,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44506,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Greater Spirit -- 44508
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44508,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44508,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44508,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Greater Mana Restoration -- 44509
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44509,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44509,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44509,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Exceptional Spirit -- 44510
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44510,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44510,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44510,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Greater Assault -- 44513
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44513,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44513,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44513,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Greater Fortitude -- 44528
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44528,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44528,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44528,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Major Agility -- 44529
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44529,415,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44529,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44529,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Exceptional Intellect -- 44555
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44555,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44555,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44555,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Spell Piercing -- 44582
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44582,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44582,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,44582,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Greater Vitality -- 44584
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44584,405,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44584,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44584,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Exceptional Resilience -- 44588
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44588,9999,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44588,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Boots - Superior Agility -- 44589
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44589,415,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44589,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44589,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Exceptional Spellpower -- 44592
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44592,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44592,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44592,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Major Spirit -- 44593
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44593,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44593,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44593,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Expertise -- 44598
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44598,415,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44598,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44598,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Greater Blasting -- 44612
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44612,9999,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44612,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enchant Bracers - Greater Stats -- 44616
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44616,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44616,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44616,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Super Stats -- 44623
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44623,370,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44623,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44623,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Exceptional Spellpower -- 44629
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44629,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44629,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44629,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant 2H Weapon - Greater Savagery -- 44630
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44630,380,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44630,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Exceptional Agility -- 44633
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44633,410,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44633,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44633,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Greater Spellpower -- 44635
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44635,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,44635,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44635,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Ring - Greater Spellpower -- 44636
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44636,400,nil, 1, 7411)
	self:addTradeFlags(RecipeDB,44636,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44636,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Ring - Assault -- 44645
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,44645,400,nil, 1, 7411)
	self:addTradeFlags(RecipeDB,44645,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44645,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Void Shatter -- 45765
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,45765,375,22449,1,7411)
	self:addTradeFlags(RecipeDB,45765,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB,45765,6,1077,2,25032)

	-- Enchant Chest - Greater Defense -- 47766
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47766,400,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47766,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,47766,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Chest - Super Health -- 47900
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47900,425,nil, 1,7411)
	self:addTradeFlags(RecipeDB,47900,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,47900,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Ring - Stamina -- 59636
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,59636,400,nil, 1, 7411)
	self:addTradeFlags(RecipeDB,59636,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59636,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Assault -- 60606
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60606,375,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60606,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60606,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Speed -- 60609
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60609,350,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60609,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,60609,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Bracers - Striking -- 60616
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60616,360,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60616,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60616,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Runed Titanium Rod -- 60619
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60619,425,44452,3,7411)
	self:addTradeFlags(RecipeDB,60619,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,60619,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Weapon - Greater Potency -- 60621
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60621,380,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60621,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60621,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Boots - Icewalker -- 60623
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60623,385,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60623,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60623,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Shield - Greater Intellect -- 60653
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60653,395,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60653,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60653,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Cloak - Major Agility -- 60663
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60663,420,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,60663,1,26906,1,26954,1,26980,1,26990,1,28693)

	-- Enchant Gloves - Crusher -- 60668
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60668,425,nil, 1,7411)
	self:addTradeFlags(RecipeDB,60668,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60668,1,26906,1,26954,1,26980,1,26990,1,28693)


	-- Ignored Recipes:
	-- 22434
	-- 28021 - Arcane Dust
	return recipecount

end
