--[[

****************************************************************************************

DB-Manual.lua

Manual DB entries for all of AckisRecipeList

File date: 2008-11-03T23:25:42Z 
File revision: 1018 
Project revision: 1020
Project version: r1020

****************************************************************************************

]]--

-- Enchanting

	-- Enchant Chest - Major Health -- 20026
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoE, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 20026, 255, nil, 1, 7411)
	self:addTradeFlags(RecipeDB, 20026, 1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB, 20026, 2, 11189)

-- Smelting

	-- Smelt Elementium -- 22967
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, 
	-- Item Stats: 
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 22967, 325, 17771, 5, 2575)
	self:addTradeFlags(RecipeDB, 22967, 1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

-- Tailoring

	-- Mycah's Botanical Bag (50194)
	-- Vendor
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50194, 375, 38225, 3, 3908)
	self:addTradeFlags(RecipeDB, 50194, 1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB, 50194, 6, 970, 1, 18382)

	-- Haliscan Pantaloons
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50647, 245, 38278, 1, 3908)
	self:addTradeFlags(RecipeDB, 50647, 1,2,3,21,22,23,24,25,26,27,28,29,30)

	-- Dress Shoes
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 49677, 250, 49677, 1, 3908)
	self:addTradeFlags(RecipeDB, 49677, 1,2,3,21,22,23,24,25,26,27,28,29,30)

	-- Haliscan Jacket
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 50644, 250, 38277, 1, 3908)
	self:addTradeFlags(RecipeDB, 50644, 1,2,3,21,22,23,24,25,26,27,28,29,30)

-- Leatherworking

	-- Bracers of Shackled Souls
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52733, 365, 32399, 4, 2108)
	self:addTradeFlags(RecipeDB, 52733, 1,2,21,22,23,24,25,26,27,28,29,30)