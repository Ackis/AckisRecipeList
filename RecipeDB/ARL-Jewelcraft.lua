--[[

************************************************************************

ARL-Jewelcraft.lua

Jewelcrafting data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
405 found from data mining.
4 ignored.
194 WotLK ignored.

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

function addon:InitJewelcrafting(RecipeDB)

	local recipecount = 0

	-- Delicate Copper Wire -- 25255
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25255, 1, 20816, 1, 25229)
	self:addTradeFlags(RecipeDB, 25255, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bronze Setting -- 25278
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25278, 50, 20817, 1, 25229)
	self:addTradeFlags(RecipeDB, 25278, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25278, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Elegant Silver Ring -- 25280
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val2id4val2id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25280, 50, 20818, 1, 25229)
	self:addTradeFlags(RecipeDB, 25280, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25280, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Inlaid Malachite Ring -- 25283
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val2id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25283, 30, 20821, 1, 25229)
	self:addTradeFlags(RecipeDB, 25283, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25283, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Simple Pearl Ring -- 25284
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25284, 60, 20820, 1, 25229)
	self:addTradeFlags(RecipeDB, 25284, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,62)
	self:addTradeAcquire(RecipeDB, 25284, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Gloom Band -- 25287
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val5id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25287, 70, 20823, 1, 25229)
	self:addTradeFlags(RecipeDB, 25287, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25287, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Heavy Silver Ring -- 25305
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25305, 90, 20826, 1, 25229)
	self:addTradeFlags(RecipeDB, 25305, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25305, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Ring of Silver Might -- 25317
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val3id1val4id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25317, 80, 20827, 1, 25229)
	self:addTradeFlags(RecipeDB, 25317, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25317, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Ring of Twilight Shadows -- 25318
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val4id3val4id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25318, 100, 20828, 1, 25229)
	self:addTradeFlags(RecipeDB, 25318, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25318, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Heavy Golden Necklace of Battle -- 25320
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val5id1val5id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25320, 150, 20831, 1, 25229)
	self:addTradeFlags(RecipeDB, 25320, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 25320, 2, 1286, 2, 3367, 2, 16624, 2, 17512)

	-- Moonsoul Crown -- 25321
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val6id4val39id6val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25321, 120, 20832, 1, 25229)
	self:addTradeFlags(RecipeDB, 25321, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 25321, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Wicked Moonstone Ring -- 25323
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val5id4val6id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25323, 125, 20833, 1, 25229)
	self:addTradeFlags(RecipeDB, 25323, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,62)
	self:addTradeAcquire(RecipeDB, 25323, 2, 3499, 2, 3954)

	-- Amulet of the Moon -- 25339
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val4id4val4id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25339, 110, 20830, 1, 25229)
	self:addTradeFlags(RecipeDB, 25339, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 25339, 2, 4229, 2, 4561, 2, 16624, 2, 17512)

	-- Solid Bronze Ring -- 25490
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val30id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25490, 50, 20907, 1, 25229)
	self:addTradeFlags(RecipeDB, 25490, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25490, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Braided Copper Ring -- 25493
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val1id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25493, 1, 20906, 2, 25229)
	self:addTradeFlags(RecipeDB, 25493, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	-- No acquire information

	-- Barbaric Iron Collar -- 25498
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val10id9val10id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25498, 110, 20909, 1, 25229)
	self:addTradeFlags(RecipeDB, 25498, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 25498, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Pendant of the Agate Shield -- 25610
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: Tanking, 
	-- Item Stats: val4id1val4id3val6id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25610, 120, 20950, 1, 25229)
	self:addTradeFlags(RecipeDB, 25610, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,52)
	self:addTradeAcquire(RecipeDB, 25610, 2, 1448, 2, 4877)

	-- Heavy Iron Knuckles -- 25612
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Weapon, Fist, 
	-- Item Stats: 
	-- Item Stats: val18-35id7val1.6id8
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25612, 125, 20954, 1, 25229)
	self:addTradeFlags(RecipeDB, 25612, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,46,79)
	self:addTradeAcquire(RecipeDB, 25612, 2, 2381, 2, 2393)

	-- Golden Dragon Ring -- 25613
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Tanking, 
	-- Item Stats: val10id9val10id16val4id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25613, 135, 20955, 1, 25229)
	self:addTradeFlags(RecipeDB, 25613, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,52,62)
	self:addTradeAcquire(RecipeDB, 25613, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Silver Rose Pendant -- 25614
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 25614, 145, 20956, 2, 25229)
	--self:addTradeFlags(RecipeDB, 25614, 3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	-- No acquire information

	-- Mithril Filigree -- 25615
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25615, 150, 20963, 1, 25229)
	self:addTradeFlags(RecipeDB, 25615, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 25615, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Blazing Citrine Ring -- 25617
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val9id19val9id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25617, 150, 20958, 1, 25229)
	self:addTradeFlags(RecipeDB, 25617, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,62)
	self:addTradeAcquire(RecipeDB, 25617, 2, 2381, 2, 9636)

	-- Jade Pendant of Blasting -- 25618
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val3id4val8id19val8id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25618, 160, 20966, 2, 25229)
	self:addTradeFlags(RecipeDB, 25618, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,54)
	self:addTradeAcquire(RecipeDB, 25618, 7, 2)

	-- The Jade Eye -- 25619
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: Tanking, 
	-- Item Stats: val5id3val6id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25619, 170, 20959, 1, 25229)
	self:addTradeFlags(RecipeDB, 25619, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,52,62)
	self:addTradeAcquire(RecipeDB, 25619, 2, 4775, 2, 5163, 2, 16624, 2, 17512)

	-- Engraved Truesilver Ring -- 25620
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val3id1val3id2val3id3val3id4val3id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25620, 170, 20960, 1, 25229)
	self:addTradeFlags(RecipeDB, 25620, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25620, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Citrine Ring of Rapid Healing -- 25621
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25621, 180, 20961, 1, 25229)
	self:addTradeFlags(RecipeDB, 25621, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 25621, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Citrine Pendant of Golden Healing -- 25622
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: Healing, 
	-- Item Stats: val3id4val7id19val20id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 25622, 190, 20967, 2, 25229)
	self:addTradeFlags(RecipeDB, 25622, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,47,53)
	self:addTradeAcquire(RecipeDB, 25622, 7, 2)

	-- Figurine - Jade Owl -- 26872
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val3id4val2id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26872, 195, 21748, 1, 25229)
	self:addTradeFlags(RecipeDB, 26872, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26872, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Figurine - Golden Hare -- 26873
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26873, 195, 21756, 2, 25229)
	self:addTradeFlags(RecipeDB, 26873, 1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26873, 7, 2)

	-- Aquamarine Signet -- 26874
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val20id9val20id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26874, 205, 20964, 1, 25229)
	self:addTradeFlags(RecipeDB, 26874, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 26874, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Figurine - Black Pearl Panther -- 26875
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26875, 210, 21758, 1, 25229)
	self:addTradeFlags(RecipeDB, 26875, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26875, 2, 989, 2, 4897)

	-- Aquamarine Pendant of the Warrior -- 26876
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val20id9val20id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26876, 215, 21755, 1, 25229)
	self:addTradeFlags(RecipeDB, 26876, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 26876, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Ruby Crown of Restoration -- 26878
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Healing, 
	-- Item Stats: val9id4val53id6val16id19val48id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26878, 220, 20969, 1, 25229)
	self:addTradeFlags(RecipeDB, 26878, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,53,56)
	self:addTradeAcquire(RecipeDB, 26878, 2, 2810, 2, 2821)

	-- Thorium Setting -- 26880
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26880, 215, 21752, 1, 25229)
	self:addTradeFlags(RecipeDB, 26880, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 26880, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Figurine - Truesilver Crab -- 26881
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val5id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26881, 220, 21760, 1, 25229)
	self:addTradeFlags(RecipeDB, 26881, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,52,63)
	self:addTradeAcquire(RecipeDB, 26881, 2, 1148, 2, 4897)

	-- Figurine - Truesilver Boar -- 26882
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val8id9val8id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26882, 230, 21763, 2, 25229)
	self:addTradeFlags(RecipeDB, 26882, 1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26882, 7, 2)

	-- Ruby Pendant of Fire -- 26883
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val16id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26883, 230, 21764, 1, 25229)
	self:addTradeFlags(RecipeDB, 26883, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 26883, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Truesilver Healing Ring -- 26885
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id19val24id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26885, 235, 21765, 1, 25229)
	self:addTradeFlags(RecipeDB, 26885, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,62)
	self:addTradeAcquire(RecipeDB, 26885, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- The Aquamarine Ward -- 26887
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26887, 240, 21754, 2, 25229)
	self:addTradeFlags(RecipeDB, 26887, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,62)
	self:addTradeAcquire(RecipeDB, 26887, 7, 2)

	-- Gem Studded Band -- 26896
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id3val16id19val16id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26896, 245, 21753, 2, 25229)
	self:addTradeFlags(RecipeDB, 26896, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,54,62)
	self:addTradeAcquire(RecipeDB, 26896, 7, 2)

	-- Opal Necklace of Impact -- 26897
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26897, 245, 21766, 1, 25229)
	self:addTradeFlags(RecipeDB, 26897, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 26897, 2, 5163, 2, 8363, 2, 16624, 2, 17512)

	-- Figurine - Ruby Serpent -- 26900
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val4id3val4id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26900, 260, 21769, 2, 25229)
	self:addTradeFlags(RecipeDB, 26900, 1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26900, 7, 2)

	-- Simple Opal Ring -- 26902
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val12id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26902, 260, 21767, 1, 25229)
	self:addTradeFlags(RecipeDB, 26902, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 26902, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Sapphire Signet -- 26903
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26903, 265, 21768, 1, 25229)
	self:addTradeFlags(RecipeDB, 26903, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 26903, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Emerald Crown of Destruction -- 26906
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val64id6val30id19val30id20val14id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26906, 265, 21774, 1, 25229)
	self:addTradeFlags(RecipeDB, 26906, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,54,56)
	self:addTradeAcquire(RecipeDB, 26906, 2, 15179)

	-- Onslaught Ring -- 26907
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val5id3val24id9val24id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26907, 270, 21775, 1, 25229)
	self:addTradeFlags(RecipeDB, 26907, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 26907, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Sapphire Pendant of Winter Night -- 26908
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val40id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26908, 270, 21790, 1, 25229)
	self:addTradeFlags(RecipeDB, 26908, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 26908, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Figurine - Emerald Owl -- 26909
	-- World Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val2id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26909, 275, 21777, 2, 25229)
	self:addTradeFlags(RecipeDB, 26909, 1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26909, 7, 2)

	-- Ring of Bitter Shadows -- 26910
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val20id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26910, 275, 21778, 1, 25229)
	self:addTradeFlags(RecipeDB, 26910, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,62)
	self:addTradeAcquire(RecipeDB, 26910, 2, 12941)

	-- Living Emerald Pendant -- 26911
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Amulet, 
	-- Item Stats: Healing, 
	-- Item Stats: val12id19val35id20val3id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26911, 280, 21791, 1, 25229)
	self:addTradeFlags(RecipeDB, 26911, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,47,53)
	self:addTradeAcquire(RecipeDB, 26911, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Figurine - Black Diamond Crab -- 26912
	-- Instance: 1583 - type1maxlevel60category3territory1minlevel58nameBlackrock Spireid1583
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val9id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26912, 290, 21784, 2, 25229)
	self:addTradeFlags(RecipeDB, 26912, 1,2,5,21,22,23,24,25,26,27,28,29,30,37,41,47,52,63)
	self:addTradeAcquire(RecipeDB, 26912, 3, 9736)

	-- Figurine - Dark Iron Scorpid -- 26914
	-- Instance: 1584 - type1maxlevel60category3territory1minlevel55nameBlackrock Depthsid1584
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val9id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26914, 290, 21789, 2, 25229)
	self:addTradeFlags(RecipeDB, 26914, 1,2,5,21,22,23,24,25,26,27,28,29,30,37,41,47,63)
	self:addTradeAcquire(RecipeDB, 26914, 3, 8983)

	-- Necklace of the Diamond Tower -- 26915
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: Tanking, 
	-- Item Stats: val17id31val3id32val3id33val3id34val3id35val3id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26915, 295, 21792, 1, 25229)
	self:addTradeFlags(RecipeDB, 26915, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,47,52)
	self:addTradeAcquire(RecipeDB, 26915, 2, 11189)

	-- Band of Natural Fire -- 26916
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val58id19
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26916, 300, 21779, 1, 25229)
	self:addTradeFlags(RecipeDB, 26916, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 26916, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Arcanite Sword Pendant -- 26918
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val40id9val40id16
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 26918, 305, 21793, 3, 25229)
	--self:addTradeFlags(RecipeDB, 26918, 3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	-- No acquire information

	-- Blood Crown -- 26920
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val75id6val28id11val28id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 26920, 315, 21780, 3, 25229)
	--self:addTradeFlags(RecipeDB, 26920, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	-- No acquire information

	-- Woven Copper Ring -- 26925
	-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val1id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26925, 1, 21931, 2, 25229)
	self:addTradeFlags(RecipeDB, 26925, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	-- No acquire information

	-- Heavy Copper Ring -- 26926
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val2id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26926, 5, 21932, 1, 25229)
	self:addTradeFlags(RecipeDB, 26926, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 26926, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Thick Bronze Necklace -- 26927
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val3id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26927, 50, 21933, 1, 25229)
	self:addTradeFlags(RecipeDB, 26927, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 26927, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Ornate Tigerseye Necklace -- 26928
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val2id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 26928, 30, 21934, 1, 25229)
	self:addTradeFlags(RecipeDB, 26928, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 26928, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Teardrop Blood Garnet -- 28903
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val5id19val13id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28903, 260, 23094, 1, 25229)
	self:addTradeFlags(RecipeDB, 28903, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53)
	self:addTradeAcquire(RecipeDB, 28903, 2, 18751, 2, 18774)

	-- Bold Blood Garnet -- 28905
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id1
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28905, 265, 23095, 1, 25229)
	self:addTradeFlags(RecipeDB, 28905, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28905, 2, 18751, 2, 18774)

	-- Runed Blood Garnet -- 28906
	-- The Scryers - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val7id19val7id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28906, 275, 23096, 2, 25229)
	self:addTradeFlags(RecipeDB, 28906, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,54,110)
	self:addTradeAcquire(RecipeDB, 28906, 6, 934, 1, 19331)

	-- Delicate Blood Garnet -- 28907
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28907, 295, 23097, 2, 25229)
	self:addTradeFlags(RecipeDB, 28907, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 28907, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Inscribed Flame Spessarite -- 28910
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val3id1val3id11val3id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28910, 260, 23098, 1, 25229)
	self:addTradeFlags(RecipeDB, 28910, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28910, 2, 18751, 2, 18774)

	-- Luminous Flame Spessarite -- 28912
	-- The Consortium - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val3id4val3id19val7id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28912, 265, 23099, 2, 25229)
	self:addTradeFlags(RecipeDB, 28912, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,105)
	self:addTradeAcquire(RecipeDB, 28912, 6, 933, 1, 20242, 6, 933, 1, 23007)

	-- Glinting Flame Spessarite -- 28914
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val3id2val3id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28914, 275, 23100, 1, 25229)
	self:addTradeFlags(RecipeDB, 28914, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28914, 2, 18751, 2, 18774)

	-- Potent Flame Spessarite -- 28915
	-- Lower City - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id19val4id20val3id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28915, 295, 23101, 2, 25229)
	self:addTradeFlags(RecipeDB, 28915, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,54,107)
	self:addTradeAcquire(RecipeDB, 28915, 6, 1011, 1, 21655)

	-- Radiant Deep Peridot -- 28916
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val3id22val4id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28916, 260, 23103, 1, 25229)
	self:addTradeFlags(RecipeDB, 28916, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 28916, 2, 18751, 2, 18774)

	-- Jagged Deep Peridot -- 28917
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id3val3id11val3id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28917, 265, 23104, 1, 25229)
	self:addTradeFlags(RecipeDB, 28917, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28917, 2, 18751, 2, 18774)

	-- Enduring Deep Peridot -- 28918
	-- Honor Hold - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val4id3val3id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28918, 275, 23105, 2, 25229)
	self:addTradeFlags(RecipeDB, 28918, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,52,104)
	self:addTradeAcquire(RecipeDB, 28918, 6, 946, 1, 17657)

	-- Dazzling Deep Peridot -- 28924
	-- The Scryers - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val3id4val1id24val1id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28924, 295, 23106, 2, 25229)
	self:addTradeFlags(RecipeDB, 28924, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB, 28924, 6, 934, 2, 19331)

	-- Glowing Shadow Draenite -- 28925
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id3val4id19val4id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28925, 260, 23108, 1, 25229)
	self:addTradeFlags(RecipeDB, 28925, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 28925, 2, 18751, 2, 18774)

	-- Royal Shadow Draenite -- 28927
	-- The Aldor - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val3id19val7id20val1id24val1id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28927, 265, 23109, 2, 25229)
	self:addTradeFlags(RecipeDB, 28927, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,53,101)
	self:addTradeAcquire(RecipeDB, 28927, 6, 932, 2, 19321)

	-- Shifting Shadow Draenite -- 28933
	-- The Consortium - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val3id2val4id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28933, 275, 23110, 2, 25229)
	self:addTradeFlags(RecipeDB, 28933, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 28933, 6, 933, 1, 20242, 6, 933, 1, 23007)

	-- Sovereign Shadow Draenite -- 28936
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val3id1val4id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28936, 295, 23111, 2, 25229)
	self:addTradeFlags(RecipeDB, 28936, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28936, 2, 18751, 2, 18774)

	-- Brilliant Golden Draenite -- 28938
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28938, 260, 23113, 1, 25229)
	self:addTradeFlags(RecipeDB, 28938, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28938, 2, 18751, 2, 18774)

	-- Gleaming Golden Draenite -- 28944
	-- The Aldor - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28944, 265, 23114, 2, 25229)
	self:addTradeFlags(RecipeDB, 28944, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,101)
	self:addTradeAcquire(RecipeDB, 28944, 6, 932, 1, 19321)

	-- Thick Golden Draenite -- 28947
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28947, 275, 23115, 2, 25229)
	self:addTradeFlags(RecipeDB, 28947, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,105)
	self:addTradeAcquire(RecipeDB, 28947, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Rigid Golden Draenite -- 28948
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28948, 295, 23116, 2, 25229)
	self:addTradeFlags(RecipeDB, 28948, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28948, 2, 18751, 2, 18774)

	-- Solid Azure Moonstone -- 28950
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val9id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28950, 260, 23118, 1, 25229)
	self:addTradeFlags(RecipeDB, 28950, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28950, 2, 18751, 2, 18774)

	-- Sparkling Azure Moonstone -- 28953
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28953, 265, 23119, 2, 25229)
	self:addTradeFlags(RecipeDB, 28953, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 28953, 2, 18751, 2, 18774)

	-- Stormy Azure Moonstone -- 28955
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val8id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28955, 275, 23120, 2, 25229)
	self:addTradeFlags(RecipeDB, 28955, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 28955, 7, 2)

	-- Lustrous Azure Moonstone -- 28957
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 28957, 295, 23121, 2, 25229)
	self:addTradeFlags(RecipeDB, 28957, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 28957, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Fel Iron Blood Ring -- 31048
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val48id9val48id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31048, 300, 24074, 1, 25229)
	self:addTradeFlags(RecipeDB, 31048, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31048, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Golden Draenite Ring -- 31049
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val16id4val19id19val19id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31049, 290, 24075, 1, 25229)
	self:addTradeFlags(RecipeDB, 31049, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,62)
	self:addTradeAcquire(RecipeDB, 31049, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Azure Moonstone Ring -- 31050
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Healing, 
	-- Item Stats: val19id19val57id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31050, 310, 24076, 1, 25229)
	self:addTradeFlags(RecipeDB, 31050, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,62)
	self:addTradeAcquire(RecipeDB, 31050, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Thick Adamantite Necklace -- 31051
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val42id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31051, 325, 24077, 1, 25229)
	self:addTradeFlags(RecipeDB, 31051, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 31051, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Heavy Adamantite Ring -- 31052
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val42id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31052, 325, 24078, 1, 25229)
	self:addTradeFlags(RecipeDB, 31052, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31052, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Khorium Band of Shadows -- 31053
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val27id3val27id19val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31053, 340, 24079, 3, 25229)
	self:addTradeFlags(RecipeDB, 31053, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31053, 3, 19826)

	-- Khorium Band of Frost -- 31054
	-- Instance: 3715 - type5category3territory1expansion1minlevel70nameCoilfang Reservoir: The Steamvaultid3715
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val27id3val27id19val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31054, 345, 24080, 3, 25229)
	self:addTradeFlags(RecipeDB, 31054, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31054, 3, 17722)

	-- Khorium Inferno Band -- 31055
	-- Instance: 3791 - type5maxlevel69category3territory1expansion1minlevel67nameAuchindoun: Sethekk Hallsid3791
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val27id3val27id19val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31055, 345, 24082, 3, 25229)
	self:addTradeFlags(RecipeDB, 31055, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31055, 3, 18472)

	-- Khorium Band of Leaves -- 31056
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val27id3val27id19val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31056, 350, 24085, 3, 25229)
	self:addTradeFlags(RecipeDB, 31056, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31056, 3, 19984)

	-- Arcane Khorium Band -- 31057
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val27id3val27id19val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31057, 355, 24086, 3, 25229)
	self:addTradeFlags(RecipeDB, 31057, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 31057, 3, 18866)

	-- Heavy Felsteel Ring -- 31058
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val25id1val21id3val13id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31058, 335, 24087, 3, 25229)
	self:addTradeFlags(RecipeDB, 31058, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,62)
	self:addTradeAcquire(RecipeDB, 31058, 7, 3)

	-- Delicate Eternium Ring -- 31060
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: Tanking, 
	-- Item Stats: val25id2val15id3val16id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31060, 345, 24088, 3, 25229)
	self:addTradeFlags(RecipeDB, 31060, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,62)
	self:addTradeAcquire(RecipeDB, 31060, 7, 3)

	-- Blazing Eternium Band -- 31061
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val27id3val18id4val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31061, 355, 24089, 3, 25229)
	self:addTradeFlags(RecipeDB, 31061, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,62)
	self:addTradeAcquire(RecipeDB, 31061, 7, 3)

	-- Pendant of Frozen Flame -- 31062
	-- Keepers of Time - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val18id3val30id33
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31062, 350, 24092, 3, 25229)
	self:addTradeFlags(RecipeDB, 31062, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,106)
	self:addTradeAcquire(RecipeDB, 31062, 6, 989, 3, 21643)

	-- Pendant of Thawing -- 31063
	-- Lower City - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val18id3val30id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31063, 350, 24093, 3, 25229)
	self:addTradeFlags(RecipeDB, 31063, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,107)
	self:addTradeAcquire(RecipeDB, 31063, 6, 1011, 3, 21655)

	-- Pendant of Withering -- 31064
	-- The Scryers - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val18id3val30id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31064, 350, 24095, 3, 25229)
	self:addTradeFlags(RecipeDB, 31064, 2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,110)
	self:addTradeAcquire(RecipeDB, 31064, 6, 934, 3, 19331)

	-- Pendant of Shadow's End -- 31065
	-- The Aldor - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val18id3val30id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31065, 350, 24097, 3, 25229)
	self:addTradeFlags(RecipeDB, 31065, 1,4,21,22,23,24,25,26,27,28,29,30,36,41,47,101)
	self:addTradeAcquire(RecipeDB, 31065, 6, 932, 3, 19321)

	-- Pendant of the Null Rune -- 31066
	-- The Consortium - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val18id3val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31066, 350, 24098, 3, 25229)
	self:addTradeFlags(RecipeDB, 31066, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,105)
	self:addTradeAcquire(RecipeDB, 31066, 6, 933, 3, 20242, 6, 933, 3, 23007)

	-- Thick Felsteel Necklace -- 31067
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val36id3val23id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31067, 345, 24106, 3, 25229)
	self:addTradeFlags(RecipeDB, 31067, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 31067, 7, 3)

	-- Living Ruby Pendant -- 31068
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: Healing, 
	-- Item Stats: val24id3val15id4val12id19val35id20val6id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31068, 345, 24110, 3, 25229)
	self:addTradeFlags(RecipeDB, 31068, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,53)
	self:addTradeAcquire(RecipeDB, 31068, 7, 3)

	-- Braided Eternium Chain -- 31070
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31070, 350, 24114, 3, 25229)
	self:addTradeFlags(RecipeDB, 31070, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 31070, 7, 3)

	-- Eye of the Night -- 31071
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val16id21val26id22val15id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31071, 350, 24116, 3, 25229)
	self:addTradeFlags(RecipeDB, 31071, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,54)
	self:addTradeAcquire(RecipeDB, 31071, 7, 3)

	-- Embrace of the Dawn -- 31072
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val27id3val19id4val7id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31072, 355, 24117, 3, 25229)
	self:addTradeFlags(RecipeDB, 31072, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47)
	self:addTradeAcquire(RecipeDB, 31072, 7, 3)

	-- Chain of the Twilight Owl -- 31076
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, Armor, Amulet, 
	-- Item Stats: Tanking, Caster DPS, 
	-- Item Stats: val19id4val21id19val21id20val18id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31076, 355, 24121, 3, 25229)
	self:addTradeFlags(RecipeDB, 31076, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,47,52,54)
	self:addTradeAcquire(RecipeDB, 31076, 7, 3)

	-- Coronet of the Verdant Flame -- 31077
	-- Instance: 3847 - type5category3territory1expansion1minlevel70nameTempest Keep: The Botanicaid3847
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val36id3val40id4val138id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31077, 360, 24122, 4, 25229)
	self:addTradeFlags(RecipeDB, 31077, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 31077, 3, 18422)

	-- Circlet of Arcane Might -- 31078
	-- Instance: 2367 - type5maxlevel68category3territory1expansion1minlevel66nameCaverns of Time: Old Hillsbrad Foothillsid2367
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: 
	-- Item Stats: val39id3val27id4val27id5val138id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31078, 360, 24123, 4, 25229)
	self:addTradeFlags(RecipeDB, 31078, 1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,47,56)
	self:addTradeAcquire(RecipeDB, 31078, 3, 18096)

	-- Figurine - Felsteel Boar -- 31079
	-- Lower City - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val68id9val68id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31079, 360, 24124, 3, 25229)
	self:addTradeFlags(RecipeDB, 31079, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,107)
	self:addTradeAcquire(RecipeDB, 31079, 6, 1011, 3, 21655)

	-- Figurine - Dawnstone Crab -- 31080
	-- Honor Hold - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val32id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31080, 360, 24125, 3, 25229)
	self:addTradeFlags(RecipeDB, 31080, 1,4,21,22,23,24,25,26,27,28,29,30,37,41,47,52,63,104)
	self:addTradeAcquire(RecipeDB, 31080, 6, 946, 3, 17657)

	-- Figurine - Living Ruby Serpent -- 31081
	-- Keepers of Time - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val33id3val23id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31081, 360, 24126, 3, 25229)
	self:addTradeFlags(RecipeDB, 31081, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,106)
	self:addTradeAcquire(RecipeDB, 31081, 6, 989, 3, 21643)

	-- Figurine - Talasite Owl -- 31082
	-- The Sha'tar - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val14id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31082, 360, 24127, 3, 25229)
	self:addTradeFlags(RecipeDB, 31082, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,111)
	self:addTradeAcquire(RecipeDB, 31082, 6, 935, 3, 21432)

	-- Figurine - Nightseye Panther -- 31083
	-- Cenarion Expedition - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val54id9val54id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31083, 360, 24128, 3, 25229)
	self:addTradeFlags(RecipeDB, 31083, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,103)
	self:addTradeAcquire(RecipeDB, 31083, 6, 942, 3, 17904)

	-- Bold Living Ruby -- 31084
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id1
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31084, 320, 24027, 3, 25229)
	self:addTradeFlags(RecipeDB, 31084, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31084, 7, 3)

	-- Delicate Living Ruby -- 31085
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31085, 320, 24028, 3, 25229)
	self:addTradeFlags(RecipeDB, 31085, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31085, 7, 3)

	-- Teardrop Living Ruby -- 31087
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Healing, 
	-- Item Stats: val6id19val18id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31087, 320, 24029, 3, 25229)
	self:addTradeFlags(RecipeDB, 31087, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53)
	self:addTradeAcquire(RecipeDB, 31087, 7, 3)

	-- Runed Living Ruby -- 31088
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val9id19val9id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31088, 320, 24030, 3, 25229)
	self:addTradeFlags(RecipeDB, 31088, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 31088, 7, 3)

	-- Bright Living Ruby -- 31089
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val16id9val16id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31089, 320, 24031, 3, 25229)
	self:addTradeFlags(RecipeDB, 31089, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31089, 7, 3)

	-- Subtle Living Ruby -- 31090
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31090, 320, 24032, 3, 25229)
	self:addTradeFlags(RecipeDB, 31090, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,52)
	self:addTradeAcquire(RecipeDB, 31090, 7, 3)

	-- Flashing Living Ruby -- 31091
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31091, 320, 24036, 3, 25229)
	self:addTradeFlags(RecipeDB, 31091, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,52)
	self:addTradeAcquire(RecipeDB, 31091, 7, 3)

	-- Solid Star of Elune -- 31092
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val12id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31092, 320, 24033, 3, 25229)
	self:addTradeFlags(RecipeDB, 31092, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31092, 7, 3)

	-- Lustrous Star of Elune -- 31094
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val3id24val3id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31094, 320, 24037, 3, 25229)
	self:addTradeFlags(RecipeDB, 31094, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31094, 7, 3)

	-- Stormy Star of Elune -- 31095
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31095, 320, 24039, 3, 25229)
	self:addTradeFlags(RecipeDB, 31095, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 31095, 7, 3)

	-- Brilliant Dawnstone -- 31096
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31096, 320, 24047, 3, 25229)
	self:addTradeFlags(RecipeDB, 31096, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31096, 7, 3)

	-- Smooth Dawnstone -- 31097
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id11val8id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31097, 320, 24048, 3, 25229)
	self:addTradeFlags(RecipeDB, 31097, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31097, 7, 3)

	-- Rigid Dawnstone -- 31098
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31098, 320, 24051, 3, 25229)
	self:addTradeFlags(RecipeDB, 31098, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31098, 7, 3)

	-- Gleaming Dawnstone -- 31099
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31099, 320, 24050, 3, 25229)
	self:addTradeFlags(RecipeDB, 31099, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31099, 7, 3)

	-- Thick Dawnstone -- 31100
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31100, 320, 24052, 3, 25229)
	self:addTradeFlags(RecipeDB, 31100, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,52)
	self:addTradeAcquire(RecipeDB, 31100, 7, 3)

	-- Mystic Dawnstone -- 31101
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, PVP, 
	-- Item Stats: 
	-- Item Stats: val8id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31101, 320, 24053, 3, 25229)
	self:addTradeFlags(RecipeDB, 31101, 1,2,4,9,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 31101, 2, 21474, 2, 21485)

	-- Sovereign Nightseye -- 31102
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id1val6id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31102, 320, 24054, 3, 25229)
	self:addTradeFlags(RecipeDB, 31102, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31102, 7, 3)

	-- Shifting Nightseye -- 31103
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id2val6id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31103, 320, 24055, 3, 25229)
	self:addTradeFlags(RecipeDB, 31103, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31103, 7, 3)

	-- Glowing Nightseye -- 31104
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id3val5id19val5id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31104, 320, 24056, 3, 25229)
	self:addTradeFlags(RecipeDB, 31104, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 31104, 7, 3)

	-- Royal Nightseye -- 31105
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Healing, 
	-- Item Stats: val3id19val9id20val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31105, 320, 24057, 3, 25229)
	self:addTradeFlags(RecipeDB, 31105, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53)
	self:addTradeAcquire(RecipeDB, 31105, 7, 3)

	-- Inscribed Noble Topaz -- 31106
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id1val4id11val4id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31106, 320, 24058, 3, 25229)
	self:addTradeFlags(RecipeDB, 31106, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31106, 7, 3)

	-- Potent Noble Topaz -- 31107
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val5id19val5id20val4id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31107, 320, 24059, 3, 25229)
	self:addTradeFlags(RecipeDB, 31107, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 31107, 7, 3)

	-- Luminous Noble Topaz -- 31108
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Healing, 
	-- Item Stats: val4id4val3id19val9id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31108, 320, 24060, 3, 25229)
	self:addTradeFlags(RecipeDB, 31108, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53)
	self:addTradeAcquire(RecipeDB, 31108, 7, 3)

	-- Glinting Noble Topaz -- 31109
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id2val4id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31109, 320, 24061, 3, 25229)
	self:addTradeFlags(RecipeDB, 31109, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31109, 7, 3)

	-- Enduring Talasite -- 31110
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id3val4id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31110, 320, 24062, 3, 25229)
	self:addTradeFlags(RecipeDB, 31110, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,52)
	self:addTradeAcquire(RecipeDB, 31110, 7, 3)

	-- Radiant Talasite -- 31111
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id22val5id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31111, 320, 24066, 3, 25229)
	self:addTradeFlags(RecipeDB, 31111, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 31111, 7, 3)

	-- Dazzling Talasite -- 31112
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id4val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31112, 320, 24065, 3, 25229)
	self:addTradeFlags(RecipeDB, 31112, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31112, 7, 3)

	-- Jagged Talasite -- 31113
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id3val4id11val4id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31113, 320, 24067, 3, 25229)
	self:addTradeFlags(RecipeDB, 31113, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31113, 7, 3)

	-- Sparkling Star of Elune -- 31149
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 31149, 320, 24035, 3, 25229)
	self:addTradeFlags(RecipeDB, 31149, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 31149, 7, 3)

	-- Malachite Pendant -- 32178
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val2id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32178, 20, 25438, 1, 25229)
	self:addTradeFlags(RecipeDB, 32178, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 32178, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Tigerseye Band -- 32179
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val2id1
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32179, 20, 25439, 1, 25229)
	self:addTradeFlags(RecipeDB, 32179, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 32179, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Rough Stone Statue -- 32259
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32259, 10, 25498, 1, 25229)
	self:addTradeFlags(RecipeDB, 32259, 3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Coarse Stone Statue -- 32801
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32801, 50, 25880, 1, 25229)
	self:addTradeFlags(RecipeDB, 32801, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32801, 1, 15501, 1, 16703, 1, 16727, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Heavy Stone Statue -- 32807
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32807, 100, 25881, 1, 25229)
	self:addTradeFlags(RecipeDB, 32807, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32807, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Solid Stone Statue -- 32808
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32808, 155, 25882, 1, 25229)
	self:addTradeFlags(RecipeDB, 32808, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32808, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Dense Stone Statue -- 32809
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32809, 205, 25883, 1, 25229)
	self:addTradeFlags(RecipeDB, 32809, 1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB, 32809, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Primal Stone Statue -- 32810
	-- Trainer
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 32810, 280, 25884, 1, 25229)
	--self:addTradeFlags(RecipeDB, 32810, 3,21,22,23,24,25,26,27,28,29,30,37,41)
	-- No acquire information

	-- Powerful Earthstorm Diamond -- 32866
	-- The Consortium - Honored
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val18id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32866, 355, 25896, 1, 25229)
	self:addTradeFlags(RecipeDB, 32866, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 32866, 6, 933, 2, 17518)

	-- Bracing Earthstorm Diamond -- 32867
	-- The Consortium - Revered
	-- Raid: 3457 - Karazhan
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val9id19val26id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32867, 355, 25897, 1, 25229)
	self:addTradeFlags(RecipeDB, 32867, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,105)
	self:addTradeAcquire(RecipeDB, 32867, 6, 933, 3, 17518)

	-- Tenacious Earthstorm Diamond -- 32868
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32868, 355, 25898, 3, 25229)
	self:addTradeFlags(RecipeDB, 32868, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,52)
	self:addTradeAcquire(RecipeDB, 32868, 7, 3)

	-- Brutal Earthstorm Diamond -- 32869
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32869, 355, 25899, 3, 25229)
	self:addTradeFlags(RecipeDB, 32869, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32869, 7, 3)

	-- Insightful Earthstorm Diamond -- 32870
	-- The Sha'tar - Friendly
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32870, 355, 25901, 1, 25229)
	self:addTradeFlags(RecipeDB, 32870, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB, 32870, 6, 935, 1, 21432)

	-- Destructive Skyfire Diamond -- 32871
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32871, 355, 25890, 3, 25229)
	self:addTradeFlags(RecipeDB, 32871, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32871, 7, 3)

	-- Mystical Skyfire Diamond -- 32872
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32872, 355, 25893, 3, 25229)
	self:addTradeFlags(RecipeDB, 32872, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 32872, 7, 3)

	-- Swift Skyfire Diamond -- 32873
	-- The Consortium - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val24id9val24id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32873, 355, 25894, 1, 25229)
	self:addTradeFlags(RecipeDB, 32873, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 32873, 6, 933, 2, 20242, 6, 933, 2, 23007)

	-- Enigmatic Skyfire Diamond -- 32874
	-- Keepers of Time - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id11val12id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 32874, 355, 25895, 1, 25229)
	self:addTradeFlags(RecipeDB, 32874, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB, 32874, 6, 989, 2, 21643)

	-- Smooth Golden Draenite -- 34069
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id11val6id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34069, 295, 28290, 2, 25229)
	self:addTradeFlags(RecipeDB, 34069, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34069, 2, 18751, 2, 18774)

	-- Bright Blood Garnet -- 34590
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val12id9val12id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34590, 265, 28595, 1, 25229)
	self:addTradeFlags(RecipeDB, 34590, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 34590, 2, 18751, 2, 18774)

	-- Golden Ring of Power -- 34955
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val4id3val5id4val5id5val6id19val6id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34955, 170, 29157, 1, 25229)
	self:addTradeFlags(RecipeDB, 34955, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,62)
	self:addTradeAcquire(RecipeDB, 34955, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Truesilver Commander's Ring -- 34959
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val7id1val7id2val6id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34959, 190, 29158, 1, 25229)
	self:addTradeFlags(RecipeDB, 34959, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 34959, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Glowing Thorium Band -- 34960
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id19val22id20val4id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34960, 270, 29159, 1, 25229)
	self:addTradeFlags(RecipeDB, 34960, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,62)
	self:addTradeAcquire(RecipeDB, 34960, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Emerald Lion Ring -- 34961
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val6id1val5id2val5id3val6id4val5id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 34961, 280, 29160, 1, 25229)
	self:addTradeFlags(RecipeDB, 34961, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 34961, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Brilliant Necklace -- 36523
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val2id1val2id2val1id3val2id4val2id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36523, 75, 30419, 1, 25229)
	self:addTradeFlags(RecipeDB, 36523, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 36523, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Heavy Jade Ring -- 36524
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val6id11val6id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36524, 105, 30420, 1, 25229)
	self:addTradeFlags(RecipeDB, 36524, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 36524, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Red Ring of Destruction -- 36525
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val9id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36525, 225, 30421, 1, 25229)
	self:addTradeFlags(RecipeDB, 36525, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 36525, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Diamond Focus Ring -- 36526
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val8id4val4id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 36526, 265, 30422, 1, 25229)
	self:addTradeFlags(RecipeDB, 36526, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 36526, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Bronze Band of Force -- 37818
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37818, 65, 30804, 1, 25229)
	self:addTradeFlags(RecipeDB, 37818, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 37818, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- Ring of Arcane Shielding -- 37855
	-- The Sha'tar - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id29val30id32
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 37855, 350, 30825, 3, 25229)
	self:addTradeFlags(RecipeDB, 37855, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,62,111)
	self:addTradeAcquire(RecipeDB, 37855, 6, 935, 2, 21432)

	-- Mercurial Adamantite -- 38068
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38068, 305, 31079, 1, 25229)
	self:addTradeFlags(RecipeDB, 38068, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 38068, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Bronze Torc -- 38175
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38175, 80, 31154, 1, 25229)
	self:addTradeFlags(RecipeDB, 38175, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 38175, 1, 18751, 1, 18774, 1, 19063, 1, 19539, 1, 19775, 1, 19778)

	-- The Frozen Eye -- 38503
	-- The Violet Eye - Honored
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val12id3val35id35
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38503, 365, 31398, 4, 25229)
	self:addTradeFlags(RecipeDB, 38503, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,62,114)
	self:addTradeAcquire(RecipeDB, 38503, 6, 967, 2, 18255)

	-- The Natural Ward -- 38504
	-- Cenarion Expedition - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val28id3val35id34
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 38504, 365, 31399, 4, 25229)
	self:addTradeFlags(RecipeDB, 38504, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,47,62,103)
	self:addTradeAcquire(RecipeDB, 38504, 6, 942, 4, 17904)

	-- Great Golden Draenite -- 39451
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39451, 295, 31860, 2, 25229)
	self:addTradeFlags(RecipeDB, 39451, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 39451, 3, 22275, 3, 22281, 3, 23061, 3, 23261, 3, 23281, 3, 23282, 3, 23353, 3, 23354, 3, 23355)

	-- Great Dawnstone -- 39452
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val8id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39452, 320, 31861, 3, 25229)
	self:addTradeFlags(RecipeDB, 39452, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 39452, 7, 3)

	-- Balanced Shadow Draenite -- 39455
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val4id3val6id9val6id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39455, 295, 31862, 2, 25229)
	self:addTradeFlags(RecipeDB, 39455, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39455, 3, 22275, 3, 22281, 3, 23061, 3, 23230, 3, 23261, 3, 23281, 3, 23282, 3, 23353, 3, 23354, 3, 23355)

	-- Infused Shadow Draenite -- 39458
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id9val6id16val1id24val1id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39458, 295, 31864, 2, 25229)
	self:addTradeFlags(RecipeDB, 39458, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39458, 3, 22275, 3, 22281, 3, 23061, 3, 23261, 3, 23281, 3, 23282, 3, 23353, 3, 23354, 3, 23355)

	-- Infused Nightseye -- 39462
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id9val8id16val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39462, 320, 31865, 3, 25229)
	self:addTradeFlags(RecipeDB, 39462, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39462, 7, 3)

	-- Balanced Nightseye -- 39463
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id3val8id9val8id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39463, 320, 31863, 3, 25229)
	self:addTradeFlags(RecipeDB, 39463, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39463, 7, 3)

	-- Veiled Flame Spessarite -- 39466
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val4id19val4id20val3id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39466, 295, 31866, 2, 25229)
	self:addTradeFlags(RecipeDB, 39466, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 39466, 3, 22275, 3, 22281, 3, 23061, 3, 23230, 3, 23261, 3, 23281, 3, 23282, 3, 23353, 3, 23354, 3, 23355)

	-- Wicked Flame Spessarite -- 39467
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val6id9val3id11val6id16val3id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39467, 295, 31869, 2, 25229)
	self:addTradeFlags(RecipeDB, 39467, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39467, 3, 22275, 3, 22281, 3, 23061, 3, 23261, 3, 23281, 3, 23282, 3, 23353, 3, 23354, 3, 23355)

	-- Veiled Noble Topaz -- 39470
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val5id19val5id20val4id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39470, 320, 31867, 3, 25229)
	self:addTradeFlags(RecipeDB, 39470, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,54)
	self:addTradeAcquire(RecipeDB, 39470, 7, 3)

	-- Wicked Noble Topaz -- 39471
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val8id9val4id11val8id16val4id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39471, 320, 31868, 3, 25229)
	self:addTradeFlags(RecipeDB, 39471, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39471, 7, 3)

	-- Bold Crimson Spinel -- 39705
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id1
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39705, 350, 32193, 4, 25229)
	self:addTradeFlags(RecipeDB, 39705, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39705, 6, 990, 1, 23437)

	-- Delicate Crimson Spinel -- 39706
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39706, 350, 32194, 4, 25229)
	self:addTradeFlags(RecipeDB, 39706, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39706, 6, 990, 1, 23437)

	-- Teardrop Crimson Spinel -- 39710
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val8id19val22id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39710, 350, 32195, 4, 25229)
	self:addTradeFlags(RecipeDB, 39710, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,109)
	self:addTradeAcquire(RecipeDB, 39710, 6, 990, 1, 23437)

	-- Runed Crimson Spinel -- 39711
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val12id19val12id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39711, 350, 32196, 4, 25229)
	self:addTradeFlags(RecipeDB, 39711, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,54,109)
	self:addTradeAcquire(RecipeDB, 39711, 6, 990, 1, 23437)

	-- Bright Crimson Spinel -- 39712
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val20id9val20id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39712, 350, 32197, 4, 25229)
	self:addTradeFlags(RecipeDB, 39712, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39712, 6, 990, 1, 23437)

	-- Subtle Crimson Spinel -- 39713
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val10id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39713, 350, 32198, 4, 25229)
	self:addTradeFlags(RecipeDB, 39713, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,52,109)
	self:addTradeAcquire(RecipeDB, 39713, 6, 990, 1, 23437)

	-- Flashing Crimson Spinel -- 39714
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val10id27
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39714, 350, 32199, 4, 25229)
	self:addTradeFlags(RecipeDB, 39714, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,52)
	self:addTradeAcquire(RecipeDB, 39714, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Solid Empyrean Sapphire -- 39715
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val15id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39715, 350, 32200, 4, 25229)
	self:addTradeFlags(RecipeDB, 39715, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39715, 6, 990, 1, 23437)

	-- Sparkling Empyrean Sapphire -- 39716
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id5
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39716, 350, 32201, 4, 25229)
	self:addTradeFlags(RecipeDB, 39716, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39716, 6, 990, 1, 23437)

	-- Lustrous Empyrean Sapphire -- 39717
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val4id24val4id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39717, 350, 32202, 4, 25229)
	self:addTradeFlags(RecipeDB, 39717, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39717, 6, 990, 1, 23437)

	-- Stormy Empyrean Sapphire -- 39718
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val13id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39718, 350, 32203, 4, 25229)
	self:addTradeFlags(RecipeDB, 39718, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,54)
	self:addTradeAcquire(RecipeDB, 39718, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Brilliant Lionseye -- 39719
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39719, 350, 32204, 4, 25229)
	self:addTradeFlags(RecipeDB, 39719, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39719, 6, 990, 1, 23437)

	-- Smooth Lionseye -- 39720
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id11val10id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39720, 350, 32205, 4, 25229)
	self:addTradeFlags(RecipeDB, 39720, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39720, 6, 990, 1, 23437)

	-- Rigid Lionseye -- 39721
	-- The Scale of the Sands - Revered
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39721, 350, 32206, 4, 25229)
	self:addTradeFlags(RecipeDB, 39721, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39721, 6, 990, 3, 23437)

	-- Gleaming Lionseye -- 39722
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39722, 350, 32207, 4, 25229)
	self:addTradeFlags(RecipeDB, 39722, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39722, 6, 990, 1, 23437)

	-- Thick Lionseye -- 39723
	-- The Scale of the Sands - Friendly
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val10id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39723, 350, 32208, 4, 25229)
	self:addTradeFlags(RecipeDB, 39723, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,52,109)
	self:addTradeAcquire(RecipeDB, 39723, 6, 990, 1, 23437)

	-- Mystic Lionseye -- 39724
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39724, 350, 32209, 4, 25229)
	self:addTradeFlags(RecipeDB, 39724, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39724, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Great Lionseye -- 39725
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39725, 350, 32210, 4, 25229)
	self:addTradeFlags(RecipeDB, 39725, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,54)
	self:addTradeAcquire(RecipeDB, 39725, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Sovereign Shadowsong Amethyst -- 39727
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id1val7id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39727, 350, 32211, 4, 25229)
	self:addTradeFlags(RecipeDB, 39727, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39727, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Shifting Shadowsong Amethyst -- 39728
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id2val7id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39728, 350, 32212, 4, 25229)
	self:addTradeFlags(RecipeDB, 39728, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39728, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Balanced Shadowsong Amethyst -- 39729
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val7id3val10id9val10id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39729, 350, 32213, 4, 25229)
	self:addTradeFlags(RecipeDB, 39729, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39729, 6, 990, 2, 23437)

	-- Infused Shadowsong Amethyst -- 39730
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id9val10id16val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39730, 350, 32214, 4, 25229)
	self:addTradeFlags(RecipeDB, 39730, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39730, 6, 990, 2, 23437)

	-- Glowing Shadowsong Amethyst -- 39731
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val7id3val6id19val6id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39731, 350, 32215, 4, 25229)
	self:addTradeFlags(RecipeDB, 39731, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,54,109)
	self:addTradeAcquire(RecipeDB, 39731, 6, 990, 2, 23437)

	-- Royal Shadowsong Amethyst -- 39732
	-- The Scale of the Sands - Revered
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val4id19val11id20val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39732, 350, 32216, 4, 25229)
	self:addTradeFlags(RecipeDB, 39732, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,109)
	self:addTradeAcquire(RecipeDB, 39732, 6, 990, 3, 23437)

	-- Inscribed Pyrestone -- 39733
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id1val5id11val5id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39733, 350, 32217, 4, 25229)
	self:addTradeFlags(RecipeDB, 39733, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 39733, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Potent Pyrestone -- 39734
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id19val6id20val5id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39734, 350, 32218, 4, 25229)
	self:addTradeFlags(RecipeDB, 39734, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,54,109)
	self:addTradeAcquire(RecipeDB, 39734, 6, 990, 2, 23437)

	-- Luminous Pyrestone -- 39735
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val5id4val4id19val11id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39735, 350, 32219, 4, 25229)
	self:addTradeFlags(RecipeDB, 39735, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,109)
	self:addTradeAcquire(RecipeDB, 39735, 6, 990, 2, 23437)

	-- Glinting Pyrestone -- 39736
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id2val5id17
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39736, 350, 32220, 4, 25229)
	self:addTradeFlags(RecipeDB, 39736, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39736, 6, 990, 2, 23437)

	-- Veiled Pyrestone -- 39737
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val6id19val6id20val5id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39737, 350, 32221, 4, 25229)
	self:addTradeFlags(RecipeDB, 39737, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,54)
	self:addTradeAcquire(RecipeDB, 39737, 3, 17767, 3, 17808, 3, 17842, 3, 17888, 3, 17968)

	-- Wicked Pyrestone -- 39738
	-- The Scale of the Sands - Revered
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val10id9val5id11val10id16val5id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39738, 350, 32222, 4, 25229)
	self:addTradeFlags(RecipeDB, 39738, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39738, 6, 990, 3, 23437)

	-- Enduring Seaspray Emerald -- 39739
	-- The Scale of the Sands - Revered
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val7id3val5id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39739, 350, 32223, 4, 25229)
	self:addTradeFlags(RecipeDB, 39739, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,52,109)
	self:addTradeAcquire(RecipeDB, 39739, 6, 990, 3, 23437)

	-- Radiant Seaspray Emerald -- 39740
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val5id22val6id23
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39740, 350, 32224, 4, 25229)
	self:addTradeFlags(RecipeDB, 39740, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,54,109)
	self:addTradeAcquire(RecipeDB, 39740, 6, 990, 2, 23437)

	-- Dazzling Seaspray Emerald -- 39741
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id4val2id24val2id38
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39741, 350, 32225, 4, 25229)
	self:addTradeFlags(RecipeDB, 39741, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39741, 6, 990, 2, 23437)

	-- Jagged Seaspray Emerald -- 39742
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val7id3val5id11val5id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39742, 350, 32226, 4, 25229)
	self:addTradeFlags(RecipeDB, 39742, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 39742, 6, 990, 2, 23437)

	-- Relentless Earthstorm Diamond -- 39961
	-- The Consortium - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id2
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39961, 355, 32409, 3, 25229)
	self:addTradeFlags(RecipeDB, 39961, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB, 39961, 6, 933, 4, 20242, 6, 933, 4, 23007)

	-- Thundering Skyfire Diamond -- 39963
	-- World Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 39963, 355, 32410, 3, 25229)
	self:addTradeFlags(RecipeDB, 39963, 1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 39963, 7, 3)

	-- Necklace of the Deep -- 40514
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val21id2val20id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 40514, 310, 32508, 1, 25229)
	self:addTradeFlags(RecipeDB, 40514, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47)
	self:addTradeAcquire(RecipeDB, 40514, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Brilliant Pearl Band -- 41414
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Healing, 
	-- Item Stats: val15id5val18id19val53id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41414, 315, 32772, 1, 25229)
	self:addTradeFlags(RecipeDB, 41414, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,53,62)
	self:addTradeAcquire(RecipeDB, 41414, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- The Black Pearl -- 41415
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val33id3val25id19val25id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41415, 320, 32774, 1, 25229)
	self:addTradeFlags(RecipeDB, 41415, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,62)
	self:addTradeAcquire(RecipeDB, 41415, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Crown of the Sea Witch -- 41418
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Cloth, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val42id3val20id4val20id5val127id6val28id19val28id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41418, 355, 32776, 1, 25229)
	self:addTradeFlags(RecipeDB, 41418, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,47,54,56)
	self:addTradeAcquire(RecipeDB, 41418, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Purified Jaggal Pearl -- 41420
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val3id5val3id19val7id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41420, 310, 32833, 1, 25229)
	self:addTradeFlags(RecipeDB, 41420, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53)
	self:addTradeAcquire(RecipeDB, 41420, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Purified Shadow Pearl -- 41429
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val4id5val3id19val9id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 41429, 320, 32836, 1, 25229)
	self:addTradeFlags(RecipeDB, 41429, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53)
	self:addTradeAcquire(RecipeDB, 41429, 1, 18751, 1, 18774, 1, 19063, 1, 19539)

	-- Don Julio's Heart -- 42558
	-- The Consortium - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val14id19val14id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42558, 355, 33133, 1, 25229)
	self:addTradeFlags(RecipeDB, 42558, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,54,105)
	self:addTradeAcquire(RecipeDB, 42558, 6, 933, 3, 20242, 6, 933, 3, 23007)

	-- Kailee's Rose -- 42588
	-- The Sha'tar - Honored
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val9id19val26id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42588, 355, 33134, 1, 25229)
	self:addTradeFlags(RecipeDB, 42588, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,53,111)
	self:addTradeAcquire(RecipeDB, 42588, 6, 935, 2, 21432)

	-- Crimson Sun -- 42589
	-- The Consortium - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val32id9val32id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42589, 355, 33131, 1, 25229)
	self:addTradeFlags(RecipeDB, 42589, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,105)
	self:addTradeAcquire(RecipeDB, 42589, 6, 933, 3, 20242, 6, 933, 3, 23007)

	-- Falling Star -- 42590
	-- Lower City - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val18id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42590, 355, 33135, 1, 25229)
	self:addTradeFlags(RecipeDB, 42590, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,107)
	self:addTradeAcquire(RecipeDB, 42590, 6, 1011, 3, 21655)

	-- Stone of Blades -- 42591
	-- Keepers of Time - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id11val12id18
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42591, 355, 33143, 1, 25229)
	self:addTradeFlags(RecipeDB, 42591, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,106)
	self:addTradeAcquire(RecipeDB, 42591, 6, 989, 3, 21643)

	-- Blood of Amber -- 42592
	-- The Sha'tar - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42592, 355, 33140, 1, 25229)
	self:addTradeFlags(RecipeDB, 42592, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,111)
	self:addTradeAcquire(RecipeDB, 42592, 6, 935, 3, 21432)

	-- Facet of Eternity -- 42593
	-- Keepers of Time - Honored
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 42593, 355, 33144, 1, 25229)
	self:addTradeFlags(RecipeDB, 42593, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,52,106)
	self:addTradeAcquire(RecipeDB, 42593, 6, 989, 2, 21643)

	-- Steady Talasite -- 43493
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, PVP, 
	-- Item Stats: 
	-- Item Stats: val6id3val4id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 43493, 320, 33782, 3, 25229)
	self:addTradeFlags(RecipeDB, 43493, 1,2,4,9,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB, 43493, 2, 18821, 2, 18822)

	-- Chaotic Skyfire Diamond -- 44794
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	-- Item Stats: val12id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 44794, 355, 34220, 3, 25229)
	self:addTradeFlags(RecipeDB, 44794, 1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 44794, 3, 19768)

	-- Loop of Forged Power -- 46122
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Caster DPS, Caster DPS, 
	-- Item Stats: val27id3val28id4val34id19val34id20val19id21
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46122, 340, 34362, 4, 25229)
	self:addTradeFlags(RecipeDB, 46122, 1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,54,62)
	self:addTradeAcquire(RecipeDB, 46122, 3, 25369, 3, 25371, 3, 25507)

	-- Ring of Flowing Life -- 46123
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: Healing, 
	-- Item Stats: val27id3val28id4val22id19val64id20val8id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46123, 340, 34363, 4, 25229)
	self:addTradeFlags(RecipeDB, 46123, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,47,53,62)
	self:addTradeAcquire(RecipeDB, 46123, 3, 25369, 3, 25370)

	-- Hard Khorium Band -- 46124
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Ring, 
	-- Item Stats: 
	-- Item Stats: val30id2val42id3val58id9val58id16val28id30
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46124, 340, 34361, 4, 25229)
	self:addTradeFlags(RecipeDB, 46124, 1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41,47,62)
	self:addTradeAcquire(RecipeDB, 46124, 3, 25363, 3, 25369, 3, 25370)

	-- Pendant of Sunfire -- 46125
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Amulet, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val27id3val19id4val36id19val36id20val25id22
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46125, 340, 34359, 4, 25229)
	self:addTradeFlags(RecipeDB, 46125, 1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,47,54)
	self:addTradeAcquire(RecipeDB, 46125, 3, 25367, 3, 25369, 3, 25371)

	-- Amulet of Flowing Life -- 46126
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Amulet, 
	-- Item Stats: Healing, 
	-- Item Stats: val27id3val19id4val22id19val64id20val11id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46126, 340, 34360, 4, 25229)
	self:addTradeFlags(RecipeDB, 46126, 1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,47,53)
	self:addTradeAcquire(RecipeDB, 46126, 3, 25369)

	-- Hard Khorium Choker -- 46127
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Raid: 4075 - Sunwell Plateau
	-- Mob Drop
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Amulet, 
	-- Item Stats: 
	-- Item Stats: val42id3val62id9val62id16val29id30val150id41
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46127, 340, 34358, 4, 25229)
	self:addTradeFlags(RecipeDB, 46127, 1,2,6,11,21,22,23,24,25,26,27,28,29,30,37,41,47)
	self:addTradeAcquire(RecipeDB, 46127, 3, 25368, 3, 25370, 3, 25371, 3, 25507)

	-- Quick Dawnstone -- 46403
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46403, 320, 35315, 3, 25229)
	self:addTradeFlags(RecipeDB, 46403, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB, 46403, 6, 1077, 4, 25950, 6, 1077, 4, 27666)

	-- Reckless Noble Topaz -- 46404
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val5id19val5id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46404, 320, 35316, 3, 25229)
	self:addTradeFlags(RecipeDB, 46404, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,54,112)
	self:addTradeAcquire(RecipeDB, 46404, 6, 1077, 4, 25950, 6, 1077, 4, 27666)

	-- Forceful Talasite -- 46405
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46405, 320, 35318, 3, 25229)
	self:addTradeFlags(RecipeDB, 46405, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,112)
	self:addTradeAcquire(RecipeDB, 46405, 6, 1077, 4, 25950, 6, 1077, 4, 27666)

	-- Eternal Earthstorm Diamond -- 46597
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46597, 360, 35501, 1, 25229)
	self:addTradeFlags(RecipeDB, 46597, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,112)
	self:addTradeAcquire(RecipeDB, 46597, 6, 1077, 3, 25032)

	-- Ember Skyfire Diamond -- 46601
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val14id19val14id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46601, 360, 35503, 1, 25229)
	self:addTradeFlags(RecipeDB, 46601, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,54,112)
	self:addTradeAcquire(RecipeDB, 46601, 6, 1077, 3, 25032)

	-- Figurine - Empyrean Tortoise -- 46775
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: Tanking, 
	-- Item Stats: val42id31
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46775, 350, 35693, 1, 25229)
	self:addTradeFlags(RecipeDB, 46775, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,52,63,112)
	self:addTradeAcquire(RecipeDB, 46775, 6, 1077, 3, 25032)

	-- Figurine - Khorium Boar -- 46776
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val84id9val84id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46776, 350, 35694, 1, 25229)
	self:addTradeFlags(RecipeDB, 46776, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,112)
	self:addTradeAcquire(RecipeDB, 46776, 6, 1077, 3, 25032)

	-- Figurine - Crimson Serpent -- 46777
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val49id3val33id4
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46777, 350, 35700, 1, 25229)
	self:addTradeFlags(RecipeDB, 46777, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,112)
	self:addTradeAcquire(RecipeDB, 46777, 6, 1077, 3, 25032)

	-- Figurine - Shadowsong Panther -- 46778
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val80id9val80id16
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46778, 350, 35702, 1, 25229)
	self:addTradeFlags(RecipeDB, 46778, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,112)
	self:addTradeAcquire(RecipeDB, 46778, 6, 1077, 3, 25032)

	-- Figurine - Seaspray Albatross -- 46779
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoP, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val18id24
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46779, 350, 35703, 1, 25229)
	self:addTradeFlags(RecipeDB, 46779, 1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,47,63,112)
	self:addTradeAcquire(RecipeDB, 46779, 6, 1077, 3, 25032)

	-- Regal Nightseye -- 46803
	-- Shattered Sun Offensive - Revered
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id3val4id26
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 46803, 320, 35707, 1, 25229)
	self:addTradeFlags(RecipeDB, 46803, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,112)
	self:addTradeAcquire(RecipeDB, 46803, 6, 1077, 3, 25032)

	-- Forceful Seaspray Emerald -- 47053
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val7id3
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47053, 350, 35759, 4, 25229)
	self:addTradeFlags(RecipeDB, 47053, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 47053, 6, 990, 2, 23437)

	-- Steady Seaspray Emerald -- 47054
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val7id3val5id29
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47054, 350, 35758, 4, 25229)
	self:addTradeFlags(RecipeDB, 47054, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 47054, 6, 990, 2, 23437)

	-- Reckless Pyrestone -- 47055
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id19val6id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47055, 350, 35760, 4, 25229)
	self:addTradeFlags(RecipeDB, 47055, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,54,109)
	self:addTradeAcquire(RecipeDB, 47055, 6, 990, 2, 23437)

	-- Quick Lionseye -- 47056
	-- The Scale of the Sands - Honored
	-- Raid: 3606 - Caverns of Time: Hyjal Summit
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47056, 350, 35761, 4, 25229)
	self:addTradeFlags(RecipeDB, 47056, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,109)
	self:addTradeAcquire(RecipeDB, 47056, 6, 990, 2, 23437)

	-- Brilliant Glass -- 47280
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 47280, 320, 35945, 3, 25229)
	self:addTradeFlags(RecipeDB, 47280, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Purified Shadowsong Amethyst -- 48789
	-- Shattered Sun Offensive - Exalted
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Healing, 
	-- Item Stats: val5id5val4id19val11id20
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 48789, 350, 37503, 1, 25229)
	self:addTradeFlags(RecipeDB, 48789, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,112)
	self:addTradeAcquire(RecipeDB, 48789, 6, 1077, 4, 25950, 6, 1077, 4, 27666)

	-- Bold Scarlet Ruby -- 53830
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id1
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53830, 380, 39996, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53830, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bold Bloodstone -- 53831
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id1
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53831, 340, 39900, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53831, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Delicate Bloodstone -- 53832
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id2
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53832, 350, 39905, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53832, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runed Bloodstone -- 53834
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53834, 340, 39911, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53834, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bright Bloodstone -- 53835
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val24id9
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53835, 340, 39906, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53835, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Subtle Bloodstone -- 53843
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id26
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53843, 350, 39907, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53843, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Flashing Bloodstone -- 53844
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id27
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53844, , 39908, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53844, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Fractured Bloodstone -- 53845
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val84id6val84id41
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53845, 350, 39909, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53845, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Brilliant Sun Crystal -- 53852
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id4
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53852, 340, 39912, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53852, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smooth Sun Crystal -- 53853
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id11val12id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53853, 340, 39914, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53853, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Rigid Sun Crystal -- 53854
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53854, 350, 39915, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53854, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Thick Sun Crystal -- 53855
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53855, 350, 39916, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53855, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Quick Sun Crystal -- 53856
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53856, 340, 39918, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53856, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mystic Sun Crystal -- 53857
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53857, 360, 39917, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53857, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sovereign Shadow Crystal -- 53859
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id1val9id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53859, 350, 39934, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53859, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shifting Shadow Crystal -- 53860
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2val9id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53860, 350, 39935, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53860, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Tenuous Shadow Crystal -- 53861
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2val2id24val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53861, 350, 39942, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53861, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glowing Shadow Crystal -- 53862
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53862, 340, 39936, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53862, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Purified Shadow Crystal -- 53863
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id5
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53863, 340, 39941, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53863, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Royal Shadow Crystal -- 53864
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id24val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53864, 350, 39943, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53864, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mysterious Shadow Crystal -- 53865
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val8id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53865, 360, 39945, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53865, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Balanced Shadow Crystal -- 53866
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3val12id9
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53866, 340, 39937, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53866, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Infused Shadow Crystal -- 53867
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id9val2id24val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53867, 340, 39944, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53867, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Regal Shadow Crystal -- 53868
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val9id3val6id26
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53868, 350, 39938, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53868, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Defender's Shadow Crystal -- 53869
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val9id3val6id27
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53869, 350, 39939, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53869, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Puissant Shadow Crystal -- 53870
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val9id3val42id6val42id41
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53870, 350, 39933, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53870, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Guardian's Shadow Crystal -- 53871
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53871, 350, 39940, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53871, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Inscribed Huge Citrine -- 53872
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id11val6id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53872, 340, 39947, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53872, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Etched Huge Citrine -- 53873
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53873, 340, 39948, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53873, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Champion's Huge Citrine -- 53874
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id1val6id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53874, 350, 39949, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53874, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Resplendent Huge Citrine -- 53875
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53875, 360, 39950, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53875, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Fierce Huge Citrine -- 53876
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id1val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53876, 350, 39951, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53876, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Deadly Huge Citrine -- 53877
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2val6id11val6id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53877, 350, 39952, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53877, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glinting Huge Citrine -- 53878
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53878, 340, 39953, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53878, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lucent Huge Citrine -- 53879
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2val6id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53879, 360, 39954, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53879, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Deft Huge Citrine -- 53880
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id2val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53880, 340, 39955, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53880, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Luminous Huge Citrine -- 53881
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id4
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53881, 350, 39946, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53881, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Potent Huge Citrine -- 53882
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id11val6id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53882, 340, 39956, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53882, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Veiled Huge Citrine -- 53883
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53883, 350, 39957, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53883, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Durable Huge Citrine -- 53884
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53884, 360, 39958, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53884, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Reckless Huge Citrine -- 53885
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53885, 350, 39959, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53885, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Wicked Huge Citrine -- 53886
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id9val6id11val6id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53886, 350, 39960, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53886, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Pristine Huge Citrine -- 53887
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id9val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53887, 350, 39961, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53887, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Empowered Huge Citrine -- 53888
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id9val6id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53888, 360, 39962, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53888, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Stark Huge Citrine -- 53889
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id9val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53889, 350, 39963, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53889, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Stalwart Huge Citrine -- 53890
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id26val6id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53890, 350, 39964, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53890, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Glimmering Huge Citrine -- 53891
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id27val6id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53891, 350, 39965, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53891, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Accurate Huge Citrine -- 53892
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53892, 350, 39966, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53892, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Resolute Huge Citrine -- 53893
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val6id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53893, 350, 39967, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53893, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Timeless Dark Jade -- 53894
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3val6id4
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53894, 340, 39968, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53894, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Jagged Dark Jade -- 53916
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3val6id11val6id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53916, 340, 39974, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53916, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Vivid Dark Jade -- 53917
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53917, 350, 39975, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53917, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enduring Dark Jade -- 53918
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val9id3val6id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53918, 350, 39976, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53918, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Steady Dark Jade -- 53919
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3val6id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53919, 360, 39977, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53919, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Forceful Dark Jade -- 53920
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val9id3val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53920, 340, 39978, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53920, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Seer's Dark Jade -- 53921
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id4val6id5
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53921, 350, 39979, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53921, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Misty Dark Jade -- 53922
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id5val6id11val6id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53922, 350, 39980, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53922, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shining Dark Jade -- 53923
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id5val6id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53923, 350, 39981, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53923, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Turbid Dark Jade -- 53924
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id5val6id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53924, 360, 39982, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53924, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Intricate Dark Jade -- 53925
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id5val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53925, 340, 39983, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53925, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Dazzling Dark Jade -- 53926
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id4val2id24val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53926, 350, 39984, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53926, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sundered Dark Jade -- 53927
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id11val6id18val2id24val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53927, 350, 39985, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53927, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lambent Dark Jade -- 53928
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id17val2id24val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53928, 350, 39986, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53928, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Opaque Dark Jade -- 53929
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id24val6id29val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53929, 360, 39988, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53929, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Energized Dark Jade -- 53930
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val2id24val6id30val2id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53930, 340, 39989, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53930, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Radiant Dark Jade -- 53931
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id11val6id18val8id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53931, 350, 39990, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53931, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Tense Dark Jade -- 53932
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val6id17val8id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53932, 360, 39991, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53932, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Shattered Dark Jade -- 53933
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val8id23val6id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53933, 360, 39992, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53933, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Solid Chalcedony -- 53934
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val18id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53934, 340, 39919, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53934, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sparkling Chalcedony -- 53940
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id5
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53940, 350, 39920, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53940, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lustrous Chalcedony -- 53941
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id24val5id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53941, 340, 39927, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53941, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Stormy Chalcedony -- 53943
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val5id24val5id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53943, 360, 39927, 2, 25229)
	--self:addTradeFlags(RecipeDB, 53943, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Delicate Scarlet Ruby -- 53945
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id2
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53945, 380, 39997, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53945, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runed Scarlet Ruby -- 53946
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53946, 380, 39998, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53946, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Bright Scarlet Ruby -- 53947
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val32id9
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53947, 380, 39999, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53947, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Subtle Scarlet Ruby -- 53948
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val16id26
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53948, 380, 40000, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53948, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Flashing Scarlet Ruby -- 53949
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val16id27
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53949, 380, 40001, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53949, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Fractured Scarlet Ruby -- 53950
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val112id6val112id41
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53950, 380, 40002, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53950, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Precise Scarlet Ruby -- 53951
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53951, 380, 40003, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53951, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Solid Sky Sapphire -- 53952
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val24id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53952, 380, 40008, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53952, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sparkling Sky Sapphire -- 53953
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id5
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53953, 380, 40009, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53953, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lustrous Sky Sapphire -- 53954
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val6id24val6id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53954, 380, 40010, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53954, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Stormy Sky Sapphire -- 53955
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val20id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53955, 380, 40011, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53955, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Brilliant Autumn's Glow -- 53956
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id4
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53956, 380, 40012, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53956, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Smooth Autumn's Glow -- 53957
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id11val16id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53957, 380, 40013, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53957, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Rigid Autumn's Glow -- 53958
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53958, 380, 40014, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53958, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Thick Autumn's Glow -- 53959
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val16id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53959, 380, 40015, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53959, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Mystic Autumn's Glow -- 53960
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53960, 380, 40016, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53960, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Quick Autumn's Glow -- 53961
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53961, 380, 40017, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53961, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sovereign Twilight Opal -- 53962
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id1val12id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53962, 380, 40022, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53962, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shifting Twilight Opal -- 53963
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id2val12id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53963, 380, 40023, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53963, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Tenuous Twilight Opal -- 53964
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id2val3id24val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53964, 380, 40024, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53964, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glowing Twilight Opal -- 53965
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53965, 380, 40025, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53965, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Purified Twilight Opal -- 53966
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id5
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53966, 380, 40026, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53966, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Royal Twilight Opal -- 53967
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val3id24val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53967, 380, 40027, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53967, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mysterious Twilight Opal -- 53968
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53968, 380, 40028, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53968, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Balanced Twilight Opal -- 53969
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3val16id9
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53969, 380, 40029, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53969, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Infused Twilight Opal -- 53970
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id9val3id24val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53970, 380, 40030, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53970, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Regal Twilight Opal -- 53971
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val8id26
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53971, 380, 40031, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53971, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Defender's Twilight Opal -- 53972
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val8id27
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53972, 380, 40032, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53972, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Puissant Twilight Opal -- 53973
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Trinket, 
	-- Item Stats: 
	-- Item Stats: val12id3val56id6val56id41
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53973, 380, 40033, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53973, 3,21,22,23,24,25,26,27,28,29,30,36,41,47,63)
	-- No acquire information

	-- Guardian's Twilight Opal -- 53974
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53974, 380, 40034, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53974, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Inscribed Monarch Topaz -- 53975
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id1val8id11val8id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53975, 380, 40037, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53975, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Etched Monarch Topaz -- 53976
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id1val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53976, 380, 40038, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53976, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Champion's Monarch Topaz -- 53977
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id1val8id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53977, 380, 40039, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53977, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Resplendent Monarch Topaz -- 53978
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id1val8id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53978, 380, 40040, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53978, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Deadly Monarch Topaz -- 53979
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id2val8id11val8id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53979, 380, 40043, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53979, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Glinting Monarch Topaz -- 53980
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id2val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53980, 380, 40044, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53980, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lucent Monarch Topaz -- 53981
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id2val8id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53981, 380, 40045, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53981, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Deft Monarch Topaz -- 53982
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id2val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53982, 380, 40046, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53982, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Luminous Monarch Topaz -- 53983
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id4
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53983, 380, 40047, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53983, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Potent Monarch Topaz -- 53984
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id11val8id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53984, 380, 40048, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53984, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Veiled Monarch Topaz -- 53985
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53985, 380, 40049, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53985, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Durable Monarch Topaz -- 53986
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53986, 380, 40050, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53986, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Reckless Monarch Topaz -- 53987
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53987, 380, 40051, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53987, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Wicked Monarch Topaz -- 53988
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id9val8id11val8id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53988, 380, 40052, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53988, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Pristine Monarch Topaz -- 53989
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id9val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53989, 380, 40053, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53989, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Empowered Monarch Topaz -- 53990
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id9val8id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53990, 380, 40054, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53990, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Stark Monarch Topaz -- 53991
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val16id9val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53991, 380, 40055, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53991, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Stalwart Monarch Topaz -- 53992
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id26val8id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53992, 380, 40056, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53992, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Glimmering Monarch Topaz -- 53993
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id27val8id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53993, 380, 40057, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53993, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Accurate Monarch Topaz -- 53994
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53994, 380, 40058, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53994, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Timeless Forest Emerald -- 53995
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id4
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53995, 380, 40085, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53995, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Jagged Forest Emerald -- 53996
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id11val8id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53996, 380, 40086, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53996, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Vivid Forest Emerald -- 53997
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53997, 380, 40088, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53997, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Enduring Forest Emerald -- 53998
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val12id3val8id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 53998, 380, 40089, 3, 25229)
	--self:addTradeFlags(RecipeDB, 53998, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information

	-- Steady Forest Emerald -- 54000
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54000, 380, 40090, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54000, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Forceful Forest Emerald -- 54001
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val12id3val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54001, 380, 40091, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54001, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Seer's Forest Emerald -- 54002
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id4val8id5
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54002, 380, 40092, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54002, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Misty Forest Emerald -- 54003
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id5val8id11val8id18
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54003, 380, 40095, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54003, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Shining Forest Emerald -- 54004
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id5val8id17
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54004, 380, 40099, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54004, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Turbid Forest Emerald -- 54005
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id5val8id29
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54005, 380, 40102, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54005, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Intricate Forest Emerald -- 54006
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id5val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54006, 380, 40104, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54006, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Dazzling Forest Emerald -- 54007
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id4val3id24val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54007, 380, 40094, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54007, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Sundered Forest Emerald -- 54008
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id11val8id18val3id24val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54008, 380, 40096, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54008, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lambent Forest Emerald -- 54009
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id17val3id24val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54009, 380, 40100, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54009, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Opaque Forest Emerald -- 54010
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val3id24val8id29val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54010, 380, 40103, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54010, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Energized Forest Emerald -- 54011
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val3id24val8id30val3id38
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54011, 380, 40105, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54011, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Radiant Forest Emerald -- 54012
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val8id11val8id18val10id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54012, 380, 40098, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54012, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Tense Forest Emerald -- 54013
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val8id17val10id23
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54013, 380, 40101, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54013, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Shattered Forest Emerald -- 54014
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Caster DPS, 
	-- Item Stats: val10id23val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54014, 380, 40106, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54014, 3,21,22,23,24,25,26,27,28,29,30,36,41,54)
	-- No acquire information

	-- Precise Bloodstone -- 54017
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54017, 350, 39910, 2, 25229)
	--self:addTradeFlags(RecipeDB, 54017, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Fierce Monarch Topaz -- 54019
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	-- Item Stats: val8id1val8id30
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54019, 380, 40041, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54019, 3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Resolute Monarch Topaz -- 54023
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: Tanking, 
	-- Item Stats: val8id31
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB, 54023, 380, 40059, 3, 25229)
	--self:addTradeFlags(RecipeDB, 54023, 3,21,22,23,24,25,26,27,28,29,30,36,41,52)
	-- No acquire information


	return recipecount

end
