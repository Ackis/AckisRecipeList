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

-- Blacksmithing

	-- Orcish War Leggings -- 9957
	-- Trainer
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val17id1val208id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9957, 230, 7929, 2, 2018)
	self:addTradeFlags(RecipeDB, 9957, 2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 9957, 4, 2756)

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

	-- Bracers of Shackled Souls -- 52733
	-- Ashtongue Deathsworn - Friendly
	-- Raid: 3959 - Black Temple
	-- Vendor
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val30id3val400id6val40id36
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 52733, 375, 32399, 1, 2108)
	self:addTradeFlags(RecipeDB, 52733, 1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,47,58,102)
	self:addTradeAcquire(RecipeDB, 52733, 6, 1012, 1, 23159)