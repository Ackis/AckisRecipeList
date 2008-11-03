--[[

****************************************************************************************

DB-Manual.lua

Manual DB entries for all of AckisRecipeList

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

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
	self:addTradeAcquire(RecipeDB, 20026, 1, 11189)