--[[

************************************************************************

ARL-FirstAid.lua

First Aid data for all of Ackis Recipe List

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

function addon:InitFirstAid(RecipeDB)

	local recipecount = 0

	-- Linen Bandage -- 3275
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3275,1,1251,1,746)
	self:addTradeFlags(RecipeDB,3275,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3275,8,8)

	-- Heavy Linen Bandage -- 3276
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3276,40,2581,1,746)
	self:addTradeFlags(RecipeDB,3276,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3276,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,1,19184,1,19478,1,22477)

	-- Wool Bandage -- 3277
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3277,80,3530,1,746)
	self:addTradeFlags(RecipeDB,3277,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3277,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,1,19184,1,19478,1,22477)

	-- Heavy Wool Bandage -- 3278
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3278,115,3531,1,746)
	self:addTradeFlags(RecipeDB,3278,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3278,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,1,19184,1,19478,1,22477)

	-- Silk Bandage -- 7928
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7928,150,6450,1,746)
	self:addTradeFlags(RecipeDB,7928,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7928,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,1,19184,1,19478,1,22477)

	-- Heavy Silk Bandage -- 7929
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7929,180,6451,1,746)
	self:addTradeFlags(RecipeDB,7929,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7929,2,2805,2,13476)

	-- Anti-Venom -- 7934
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7934,80,6452,1,746)
	self:addTradeFlags(RecipeDB,7934,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7934,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,1,19184,1,19478,1,22477)

	-- Strong Anti-Venom -- 7935
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7935,130,6453,2,746)
	self:addTradeFlags(RecipeDB,7935,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7935,7,2)

	-- Mageweave Bandage -- 10840
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,10840,210,8544,1,746)
	self:addTradeFlags(RecipeDB,10840,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,10840,2,2805,2,13476)

	-- Heavy Mageweave Bandage -- 10841
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,10841,240,8545,1,746)
	self:addTradeFlags(RecipeDB,10841,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,10841,4,6622,4,6624)

	-- Runecloth Bandage -- 18629
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18629,260,14529,1,746)
	self:addTradeFlags(RecipeDB,18629,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18629,1,12920,1,12939)

	-- Heavy Runecloth Bandage -- 18630
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,18630,290,14530,1,746)
	self:addTradeFlags(RecipeDB,18630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18630,1,12920,1,12939)

	-- Powerful Anti-Venom -- 23787
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,23787,300,19440,1,746)
	self:addTradeFlags(RecipeDB,23787,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB,23787,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Netherweave Bandage -- 27032
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27032,330,21990,1,746)
	self:addTradeFlags(RecipeDB,27032,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27032,2,18990,2,18991,2,26947)

	-- Heavy Netherweave Bandage -- 27033
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,27033,360,21991,1,746)
	self:addTradeFlags(RecipeDB,27033,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27033,2,18990,2,18991,2,26947)

	-- Frostweave Bandage -- 45545
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,45545,350,34721,1,746)
	self:addTradeFlags(RecipeDB,45545,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45545,1,23734,1,26956,1,26992,1,28706,1,29233)

	-- Heavy Frostweave Bandage -- 45546
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,45546,400,34722,2,746)
	self:addTradeFlags(RecipeDB,45546,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45546,7,2)

	-- Expert First Aid -- 7924 (150 training)
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7924,125,16084,1,746)
	self:addTradeFlags(RecipeDB,7924,1,2,4,21,22,23,24,25,26,27,28,29,30)
	self:addTradeAcquire(RecipeDB,7924,2,2805,2,13476)

	-- Artisan First Aid -- 10846 (225 training)
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,10846,225,nil,1,746)
	self:addTradeFlags(RecipeDB,10846,1,2,8,21,22,23,24,25,26,27,28,29,30)
	self:addTradeAcquire(RecipeDB,10846,4,6622,4,6624)

	return recipecount

end
