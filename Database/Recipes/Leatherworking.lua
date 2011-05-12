--[[
************************************************************************
Leatherworking.lua
Leatherworking data for all of Ackis Recipe List
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]] --

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Filter flags. Acquire types, and Reputation levels.
-------------------------------------------------------------------------------
local F = private.filter_flags
local A = private.acquire_types
local Q = private.item_qualities
local REP = private.rep_levels
local FAC = private.faction_ids
local V = private.game_versions

--------------------------------------------------------------------------------------------------------------------
-- Initialize!
--------------------------------------------------------------------------------------------------------------------
function addon:InitLeatherworking()
	local function AddRecipe(spell_id, genesis, quality)
		return addon:AddRecipe(spell_id, 2108, genesis, quality)
	end

	private:InitializeLeatherworkingTrainers()

	local recipe

	-- Handstitched Leather Boots -- 2149
	recipe = AddRecipe(2149, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2302)
	recipe:SetSkillLevels(1, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Light Armor Kit -- 2152
	recipe = AddRecipe(2152, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2304)
	recipe:SetSkillLevels(1, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Handstitched Leather Pants -- 2153
	recipe = AddRecipe(2153, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2303)
	recipe:SetSkillLevels(15, 15, 45, 60, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Fine Leather Boots -- 2158
	recipe = AddRecipe(2158, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2406)
	recipe:SetCraftedItemID(2307)
	recipe:SetSkillLevels(90, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fine Leather Cloak -- 2159
	recipe = AddRecipe(2159, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2308)
	recipe:SetSkillLevels(85, 85, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Embossed Leather Vest -- 2160
	recipe = AddRecipe(2160, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2300)
	recipe:SetSkillLevels(40, 40, 70, 85, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Embossed Leather Boots -- 2161
	recipe = AddRecipe(2161, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2309)
	recipe:SetSkillLevels(55, 55, 85, 100, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Embossed Leather Cloak -- 2162
	recipe = AddRecipe(2162, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2310)
	recipe:SetSkillLevels(60, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- White Leather Jerkin -- 2163
	recipe = AddRecipe(2163, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2407)
	recipe:SetCraftedItemID(2311)
	recipe:SetSkillLevels(60, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fine Leather Gloves -- 2164
	recipe = AddRecipe(2164, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2408)
	recipe:SetCraftedItemID(2312)
	recipe:SetSkillLevels(75, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Medium Armor Kit -- 2165
	recipe = AddRecipe(2165, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2313)
	recipe:SetSkillLevels(100, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Toughened Leather Armor -- 2166
	recipe = AddRecipe(2166, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2314)
	recipe:SetSkillLevels(120, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Dark Leather Boots -- 2167
	recipe = AddRecipe(2167, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2315)
	recipe:SetSkillLevels(100, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Dark Leather Cloak -- 2168
	recipe = AddRecipe(2168, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2316)
	recipe:SetSkillLevels(110, 110, 135, 147, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Dark Leather Tunic -- 2169
	recipe = AddRecipe(2169, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(2409)
	recipe:SetCraftedItemID(2317)
	recipe:SetSkillLevels(100, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Light Leather -- 2881
	recipe = AddRecipe(2881, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2318)
	recipe:SetSkillLevels(1, 1, 20, 30, 40)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Handstitched Leather Belt -- 3753
	recipe = AddRecipe(3753, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4237)
	recipe:SetSkillLevels(25, 25, 55, 70, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Embossed Leather Gloves -- 3756
	recipe = AddRecipe(3756, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4239)
	recipe:SetSkillLevels(55, 55, 85, 100, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Embossed Leather Pants -- 3759
	recipe = AddRecipe(3759, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4242)
	recipe:SetSkillLevels(75, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Hillman's Cloak -- 3760
	recipe = AddRecipe(3760, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(3719)
	recipe:SetSkillLevels(150, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Fine Leather Tunic -- 3761
	recipe = AddRecipe(3761, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4243)
	recipe:SetSkillLevels(85, 85, 115, 130, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Hillman's Leather Vest -- 3762
	recipe = AddRecipe(3762, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4293)
	recipe:SetCraftedItemID(4244)
	recipe:SetSkillLevels(100, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fine Leather Belt -- 3763
	recipe = AddRecipe(3763, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4246)
	recipe:SetSkillLevels(80, 80, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Hillman's Leather Gloves -- 3764
	recipe = AddRecipe(3764, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4247)
	recipe:SetSkillLevels(145, 145, 170, 182, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Dark Leather Gloves -- 3765
	recipe = AddRecipe(3765, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7360)
	recipe:SetCraftedItemID(4248)
	recipe:SetSkillLevels(120, 120, 155, 167, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dark Leather Belt -- 3766
	recipe = AddRecipe(3766, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4249)
	recipe:SetSkillLevels(125, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Hillman's Belt -- 3767
	recipe = AddRecipe(3767, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4294)
	recipe:SetCraftedItemID(4250)
	recipe:SetSkillLevels(120, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Hillman's Shoulders -- 3768
	recipe = AddRecipe(3768, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4251)
	recipe:SetSkillLevels(130, 130, 155, 167, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635)

	-- Dark Leather Shoulders -- 3769
	recipe = AddRecipe(3769, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4296)
	recipe:SetCraftedItemID(4252)
	recipe:SetSkillLevels(140, 140, 165, 177, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Toughened Leather Gloves -- 3770
	recipe = AddRecipe(3770, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4253)
	recipe:SetSkillLevels(135, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Barbaric Gloves -- 3771
	recipe = AddRecipe(3771, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4297)
	recipe:SetCraftedItemID(4254)
	recipe:SetSkillLevels(150, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Leather Armor -- 3772
	recipe = AddRecipe(3772, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7613)
	recipe:SetCraftedItemID(4255)
	recipe:SetSkillLevels(155, 155, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddVendor(2679)
	recipe:AddLimitedVendor(2698, 1)

	-- Guardian Armor -- 3773
	recipe = AddRecipe(3773, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4299)
	recipe:SetCraftedItemID(4256)
	recipe:SetSkillLevels(175, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Leather Belt -- 3774
	recipe = AddRecipe(3774, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4257)
	recipe:SetSkillLevels(160, 160, 180, 190, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Guardian Belt -- 3775
	recipe = AddRecipe(3775, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(4298)
	recipe:SetCraftedItemID(4258)
	recipe:SetSkillLevels(170, 170, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Leather Bracers -- 3776
	recipe = AddRecipe(3776, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4259)
	recipe:SetSkillLevels(180, 180, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Guardian Leather Bracers -- 3777
	recipe = AddRecipe(3777, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(4300)
	recipe:SetCraftedItemID(4260)
	recipe:SetSkillLevels(195, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gem-studded Leather Belt -- 3778
	recipe = AddRecipe(3778, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(14635)
	recipe:SetCraftedItemID(4262)
	recipe:SetSkillLevels(185, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddLimitedVendor(2699, 1)

	-- Barbaric Belt -- 3779
	recipe = AddRecipe(3779, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(4301)
	recipe:SetCraftedItemID(4264)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Armor Kit -- 3780
	recipe = AddRecipe(3780, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4265)
	recipe:SetSkillLevels(150, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Cured Light Hide -- 3816
	recipe = AddRecipe(3816, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4231)
	recipe:SetSkillLevels(35, 35, 55, 65, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Cured Medium Hide -- 3817
	recipe = AddRecipe(3817, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4233)
	recipe:SetSkillLevels(100, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Cured Heavy Hide -- 3818
	recipe = AddRecipe(3818, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4236)
	recipe:SetSkillLevels(150, 150, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Raptor Hide Harness -- 4096
	recipe = AddRecipe(4096, V.WOTLK, Q.UNCOMMON)
	recipe:SetRecipeItemID(13287)
	recipe:SetCraftedItemID(4455)
	recipe:SetSkillLevels(165, 165, 185, 195, 205)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddLimitedVendor(2819, 1)

	-- Raptor Hide Belt -- 4097
	recipe = AddRecipe(4097, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(13288)
	recipe:SetCraftedItemID(4456)
	recipe:SetSkillLevels(165, 165, 185, 195, 205)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(2816)

	-- Kodo Hide Bag -- 5244
	recipe = AddRecipe(5244, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5083)
	recipe:SetCraftedItemID(5081)
	recipe:SetSkillLevels(40, 40, 70, 85, 100)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE)
	recipe:AddQuest(769)

	-- Barbaric Harness -- 6661
	recipe = AddRecipe(6661, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5739)
	recipe:SetSkillLevels(190, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Murloc Scale Belt -- 6702
	recipe = AddRecipe(6702, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5786)
	recipe:SetCraftedItemID(5780)
	recipe:SetSkillLevels(90, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(1732, 3385)
	recipe:AddVendor(843, 3556)

	-- Murloc Scale Breastplate -- 6703
	recipe = AddRecipe(6703, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5787)
	recipe:SetCraftedItemID(5781)
	recipe:SetSkillLevels(95, 95, 125, 140, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(657, 3386)
	recipe:AddVendor(843, 3556)

	-- Thick Murloc Armor -- 6704
	recipe = AddRecipe(6704, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5788)
	recipe:SetCraftedItemID(5782)
	recipe:SetSkillLevels(170, 170, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(938, 1160)
	recipe:AddLimitedVendor(2393, 1, 2846, 1)

	-- Murloc Scale Bracers -- 6705
	recipe = AddRecipe(6705, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5789)
	recipe:SetCraftedItemID(5783)
	recipe:SetSkillLevels(190, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(1561)
	recipe:AddLimitedVendor(4897, 1)

	-- Handstitched Leather Vest -- 7126
	recipe = AddRecipe(7126, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5957)
	recipe:SetSkillLevels(1, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Fine Leather Pants -- 7133
	recipe = AddRecipe(7133, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5972)
	recipe:SetCraftedItemID(5958)
	recipe:SetSkillLevels(105, 105, 130, 142, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dark Leather Pants -- 7135
	recipe = AddRecipe(7135, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5961)
	recipe:SetSkillLevels(115, 115, 140, 152, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Guardian Pants -- 7147
	recipe = AddRecipe(7147, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5962)
	recipe:SetSkillLevels(160, 160, 180, 190, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Barbaric Leggings -- 7149
	recipe = AddRecipe(7149, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(5973)
	recipe:SetCraftedItemID(5963)
	recipe:SetSkillLevels(170, 170, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(2810, 2821, 3958)

	-- Barbaric Shoulders -- 7151
	recipe = AddRecipe(7151, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5964)
	recipe:SetSkillLevels(175, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Guardian Cloak -- 7153
	recipe = AddRecipe(7153, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(5974)
	recipe:SetCraftedItemID(5965)
	recipe:SetSkillLevels(185, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Guardian Gloves -- 7156
	recipe = AddRecipe(7156, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(5966)
	recipe:SetSkillLevels(190, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Deviate Scale Cloak -- 7953
	recipe = AddRecipe(7953, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6474)
	recipe:SetCraftedItemID(6466)
	recipe:SetSkillLevels(90, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Deviate Scale Gloves -- 7954
	recipe = AddRecipe(7954, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(6475)
	recipe:SetCraftedItemID(6467)
	recipe:SetSkillLevels(105, 105, 130, 142, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Deviate Scale Belt -- 7955
	recipe = AddRecipe(7955, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6476)
	recipe:SetCraftedItemID(6468)
	recipe:SetSkillLevels(115, 115, 140, 152, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Moonglow Vest -- 8322
	recipe = AddRecipe(8322, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(6710)
	recipe:SetCraftedItemID(6709)
	recipe:SetSkillLevels(90, 90, 115, 130, 145)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddQuest(1582)

	-- Handstitched Leather Cloak -- 9058
	recipe = AddRecipe(9058, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7276)
	recipe:SetSkillLevels(1, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Handstitched Leather Bracers -- 9059
	recipe = AddRecipe(9059, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7277)
	recipe:SetSkillLevels(1, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("DEFAULT_RECIPE")

	-- Rugged Leather Pants -- 9064
	recipe = AddRecipe(9064, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7288)
	recipe:SetCraftedItemID(7280)
	recipe:SetSkillLevels(35, 35, 65, 80, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Light Leather Bracers -- 9065
	recipe = AddRecipe(9065, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7281)
	recipe:SetSkillLevels(70, 70, 100, 115, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Light Leather Pants -- 9068
	recipe = AddRecipe(9068, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7282)
	recipe:SetSkillLevels(95, 95, 125, 140, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Black Whelp Cloak -- 9070
	recipe = AddRecipe(9070, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7289)
	recipe:SetCraftedItemID(7283)
	recipe:SetSkillLevels(100, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddVendor(2697)

	-- Red Whelp Gloves -- 9072
	recipe = AddRecipe(9072, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7290)
	recipe:SetCraftedItemID(7284)
	recipe:SetSkillLevels(120, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(2679)

	-- Nimble Leather Gloves -- 9074
	recipe = AddRecipe(9074, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7285)
	recipe:SetSkillLevels(120, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Fletcher's Gloves -- 9145
	recipe = AddRecipe(9145, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7348)
	recipe:SetSkillLevels(125, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Herbalist's Gloves -- 9146
	recipe = AddRecipe(9146, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7361)
	recipe:SetCraftedItemID(7349)
	recipe:SetSkillLevels(135, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(6731)

	-- Earthen Leather Shoulders -- 9147
	recipe = AddRecipe(9147, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(7362)
	recipe:SetCraftedItemID(7352)
	recipe:SetSkillLevels(135, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddLimitedVendor(3537, 1)

	-- Pilferer's Gloves -- 9148
	recipe = AddRecipe(9148, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7363)
	recipe:SetCraftedItemID(7358)
	recipe:SetSkillLevels(140, 140, 165, 177, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Earthen Gloves -- 9149
	recipe = AddRecipe(9149, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7364)
	recipe:SetCraftedItemID(7359)
	recipe:SetSkillLevels(145, 145, 170, 182, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dusky Leather Leggings -- 9195
	recipe = AddRecipe(9195, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7449)
	recipe:SetCraftedItemID(7373)
	recipe:SetSkillLevels(165, 165, 185, 195, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dusky Leather Armor -- 9196
	recipe = AddRecipe(9196, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7374)
	recipe:SetSkillLevels(175, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Green Whelp Armor -- 9197
	recipe = AddRecipe(9197, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7450)
	recipe:SetCraftedItemID(7375)
	recipe:SetSkillLevels(175, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Frost Leather Cloak -- 9198
	recipe = AddRecipe(9198, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7377)
	recipe:SetSkillLevels(180, 180, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Dusky Bracers -- 9201
	recipe = AddRecipe(9201, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7378)
	recipe:SetSkillLevels(185, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Green Whelp Bracers -- 9202
	recipe = AddRecipe(9202, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7451)
	recipe:SetCraftedItemID(7386)
	recipe:SetSkillLevels(190, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(7852)
	recipe:AddLimitedVendor(4225, 1, 4589, 1, 7854, 1)

	-- Dusky Belt -- 9206
	recipe = AddRecipe(9206, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(7387)
	recipe:SetSkillLevels(195, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Dusky Boots -- 9207
	recipe = AddRecipe(9207, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(7452)
	recipe:SetCraftedItemID(7390)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Swift Boots -- 9208
	recipe = AddRecipe(9208, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(7453)
	recipe:SetCraftedItemID(7391)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Cured Thick Hide -- 10482
	recipe = AddRecipe(10482, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8172)
	recipe:SetSkillLevels(200, 200, 200, 200, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Thick Armor Kit -- 10487
	recipe = AddRecipe(10487, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8173)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Comfortable Leather Hat -- 10490
	recipe = AddRecipe(10490, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(8384)
	recipe:SetCraftedItemID(8174)
	recipe:SetSkillLevels(200, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Nightscape Tunic -- 10499
	recipe = AddRecipe(10499, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8175)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Nightscape Headband -- 10507
	recipe = AddRecipe(10507, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8176)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Turtle Scale Gloves -- 10509
	recipe = AddRecipe(10509, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(8385)
	recipe:SetCraftedItemID(8187)
	recipe:SetSkillLevels(205, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(7852)
	recipe:AddLimitedVendor(7854, 1)

	-- Turtle Scale Breastplate -- 10511
	recipe = AddRecipe(10511, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8189)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Nightscape Shoulders -- 10516
	recipe = AddRecipe(10516, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8409)
	recipe:SetCraftedItemID(8192)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(8160)
	recipe:AddLimitedVendor(7854, 1)

	-- Turtle Scale Bracers -- 10518
	recipe = AddRecipe(10518, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8198)
	recipe:SetSkillLevels(210, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Big Voodoo Robe -- 10520
	recipe = AddRecipe(10520, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8386)
	recipe:SetCraftedItemID(8200)
	recipe:SetSkillLevels(215, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tough Scorpid Breastplate -- 10525
	recipe = AddRecipe(10525, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8395)
	recipe:SetCraftedItemID(8203)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5618)

	-- Wild Leather Shoulders -- 10529
	recipe = AddRecipe(10529, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8403)
	recipe:SetCraftedItemID(8210)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Big Voodoo Mask -- 10531
	recipe = AddRecipe(10531, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8387)
	recipe:SetCraftedItemID(8201)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tough Scorpid Bracers -- 10533
	recipe = AddRecipe(10533, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8397)
	recipe:SetCraftedItemID(8205)
	recipe:SetSkillLevels(220, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5617)

	-- Tough Scorpid Gloves -- 10542
	recipe = AddRecipe(10542, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8398)
	recipe:SetCraftedItemID(8204)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wild Leather Vest -- 10544
	recipe = AddRecipe(10544, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8404)
	recipe:SetCraftedItemID(8211)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wild Leather Helmet -- 10546
	recipe = AddRecipe(10546, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8405)
	recipe:SetCraftedItemID(8214)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Nightscape Pants -- 10548
	recipe = AddRecipe(10548, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8193)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Turtle Scale Helm -- 10552
	recipe = AddRecipe(10552, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8191)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Tough Scorpid Boots -- 10554
	recipe = AddRecipe(10554, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8399)
	recipe:SetCraftedItemID(8209)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Turtle Scale Leggings -- 10556
	recipe = AddRecipe(10556, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8185)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Nightscape Boots -- 10558
	recipe = AddRecipe(10558, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8197)
	recipe:SetSkillLevels(235, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Big Voodoo Pants -- 10560
	recipe = AddRecipe(10560, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8389)
	recipe:SetCraftedItemID(8202)
	recipe:SetSkillLevels(240, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Big Voodoo Cloak -- 10562
	recipe = AddRecipe(10562, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8390)
	recipe:SetCraftedItemID(8216)
	recipe:SetSkillLevels(240, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tough Scorpid Shoulders -- 10564
	recipe = AddRecipe(10564, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8400)
	recipe:SetCraftedItemID(8207)
	recipe:SetSkillLevels(240, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wild Leather Boots -- 10566
	recipe = AddRecipe(10566, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8406)
	recipe:SetCraftedItemID(8213)
	recipe:SetSkillLevels(245, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Tough Scorpid Leggings -- 10568
	recipe = AddRecipe(10568, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8401)
	recipe:SetCraftedItemID(8206)
	recipe:SetSkillLevels(245, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Tough Scorpid Helm -- 10570
	recipe = AddRecipe(10570, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8402)
	recipe:SetCraftedItemID(8208)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wild Leather Leggings -- 10572
	recipe = AddRecipe(10572, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8407)
	recipe:SetCraftedItemID(8212)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wild Leather Cloak -- 10574
	recipe = AddRecipe(10574, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(8408)
	recipe:SetCraftedItemID(8215)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Dragonscale Gauntlets -- 10619
	recipe = AddRecipe(10619, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8347)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Wolfshead Helm -- 10621
	recipe = AddRecipe(10621, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8345)
	recipe:SetSkillLevels(225, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.DRUID, F.LEATHER)
	recipe:AddTrainer(7871, 29509)

	-- Gauntlets of the Sea -- 10630
	recipe = AddRecipe(10630, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8346)
	recipe:SetSkillLevels(230, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7868, 7869, 21087, 29507, 33581, 33612, 33635)

	-- Helm of Fire -- 10632
	recipe = AddRecipe(10632, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8348)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7868, 7869, 21087, 29507, 33581, 33612, 33635)

	-- Feathered Breastplate -- 10647
	recipe = AddRecipe(10647, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8349)
	recipe:SetSkillLevels(250, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7871, 21087, 29509, 33581, 33612, 33635)

	-- Dragonscale Breastplate -- 10650
	recipe = AddRecipe(10650, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8367)
	recipe:SetSkillLevels(255, 255, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 29508, 33581, 33612, 33635)

	-- Cured Rugged Hide -- 19047
	recipe = AddRecipe(19047, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15407)
	recipe:SetSkillLevels(250, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Heavy Scorpid Bracers -- 19048
	recipe = AddRecipe(19048, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15724)
	recipe:SetCraftedItemID(15077)
	recipe:SetSkillLevels(255, 255, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(12956)

	-- Wicked Leather Gauntlets -- 19049
	recipe = AddRecipe(19049, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15725)
	recipe:SetCraftedItemID(15083)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(12942, 12943)

	-- Green Dragonscale Breastplate -- 19050
	recipe = AddRecipe(19050, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15726)
	recipe:SetCraftedItemID(15045)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddLimitedVendor(11874, 1)

	-- Heavy Scorpid Vest -- 19051
	recipe = AddRecipe(19051, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15727)
	recipe:SetCraftedItemID(15076)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(6005)

	-- Wicked Leather Bracers -- 19052
	recipe = AddRecipe(19052, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15728)
	recipe:SetCraftedItemID(15084)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Chimeric Gloves -- 19053
	recipe = AddRecipe(19053, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15729)
	recipe:SetCraftedItemID(15074)
	recipe:SetSkillLevels(265, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Red Dragonscale Breastplate -- 19054
	recipe = AddRecipe(19054, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15730)
	recipe:SetCraftedItemID(15047)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(10363)

	-- Runic Leather Gauntlets -- 19055
	recipe = AddRecipe(19055, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15731)
	recipe:SetCraftedItemID(15091)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rugged Armor Kit -- 19058
	recipe = AddRecipe(19058, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(15564)
	recipe:SetSkillLevels(250, 250, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Volcanic Leggings -- 19059
	recipe = AddRecipe(19059, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15732)
	recipe:SetCraftedItemID(15054)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7035)

	-- Green Dragonscale Leggings -- 19060
	recipe = AddRecipe(19060, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15733)
	recipe:SetCraftedItemID(15046)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(5226)

	-- Living Shoulders -- 19061
	recipe = AddRecipe(19061, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15734)
	recipe:SetCraftedItemID(15061)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(7852)
	recipe:AddLimitedVendor(7854, 1)

	-- Ironfeather Shoulders -- 19062
	recipe = AddRecipe(19062, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15735)
	recipe:SetCraftedItemID(15067)
	recipe:SetSkillLevels(270, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddLimitedVendor(12958, 1)

	-- Chimeric Boots -- 19063
	recipe = AddRecipe(19063, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15737)
	recipe:SetCraftedItemID(15073)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Scorpid Gauntlets -- 19064
	recipe = AddRecipe(19064, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15738)
	recipe:SetCraftedItemID(15078)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(7025)

	-- Runic Leather Bracers -- 19065
	recipe = AddRecipe(19065, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15739)
	recipe:SetCraftedItemID(15092)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Frostsaber Boots -- 19066
	recipe = AddRecipe(19066, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15740)
	recipe:SetCraftedItemID(15071)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(11189)

	-- Stormshroud Pants -- 19067
	recipe = AddRecipe(19067, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15741)
	recipe:SetCraftedItemID(15057)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddVendor(12942, 12943)

	-- Warbear Harness -- 19068
	recipe = AddRecipe(19068, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20253)
	recipe:SetCraftedItemID(15064)
	recipe:SetSkillLevels(275, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Heavy Scorpid Belt -- 19070
	recipe = AddRecipe(19070, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15743)
	recipe:SetCraftedItemID(15082)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wicked Leather Headband -- 19071
	recipe = AddRecipe(19071, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15744)
	recipe:SetCraftedItemID(15086)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Runic Leather Belt -- 19072
	recipe = AddRecipe(19072, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15745)
	recipe:SetCraftedItemID(15093)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Chimeric Leggings -- 19073
	recipe = AddRecipe(19073, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15746)
	recipe:SetCraftedItemID(15072)
	recipe:SetSkillLevels(280, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Frostsaber Leggings -- 19074
	recipe = AddRecipe(19074, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15747)
	recipe:SetCraftedItemID(15069)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7440)

	-- Heavy Scorpid Leggings -- 19075
	recipe = AddRecipe(19075, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15748)
	recipe:SetCraftedItemID(15079)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(7027)

	-- Volcanic Breastplate -- 19076
	recipe = AddRecipe(19076, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15749)
	recipe:SetCraftedItemID(15053)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(9259)

	-- Blue Dragonscale Breastplate -- 19077
	recipe = AddRecipe(19077, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15751)
	recipe:SetCraftedItemID(15048)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Living Leggings -- 19078
	recipe = AddRecipe(19078, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15752)
	recipe:SetCraftedItemID(15060)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(7158)

	-- Stormshroud Armor -- 19079
	recipe = AddRecipe(19079, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15753)
	recipe:SetCraftedItemID(15056)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Warbear Woolies -- 19080
	recipe = AddRecipe(19080, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20254)
	recipe:SetCraftedItemID(15065)
	recipe:SetSkillLevels(285, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Chimeric Vest -- 19081
	recipe = AddRecipe(19081, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15755)
	recipe:SetCraftedItemID(15075)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runic Leather Headband -- 19082
	recipe = AddRecipe(19082, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15756)
	recipe:SetCraftedItemID(15094)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Wicked Leather Pants -- 19083
	recipe = AddRecipe(19083, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15757)
	recipe:SetCraftedItemID(15087)
	recipe:SetSkillLevels(290, 290, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Devilsaur Gauntlets -- 19084
	recipe = AddRecipe(19084, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15758)
	recipe:SetCraftedItemID(15063)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(12959)

	-- Black Dragonscale Breastplate -- 19085
	recipe = AddRecipe(19085, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15759)
	recipe:SetCraftedItemID(15050)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(9499)

	-- Ironfeather Breastplate -- 19086
	recipe = AddRecipe(19086, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15760)
	recipe:SetCraftedItemID(15066)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(2644)

	-- Frostsaber Gloves -- 19087
	recipe = AddRecipe(19087, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15761)
	recipe:SetCraftedItemID(15070)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7441)

	-- Heavy Scorpid Helm -- 19088
	recipe = AddRecipe(19088, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15762)
	recipe:SetCraftedItemID(15080)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(12956)

	-- Blue Dragonscale Shoulders -- 19089
	recipe = AddRecipe(19089, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15763)
	recipe:SetCraftedItemID(15049)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Stormshroud Shoulders -- 19090
	recipe = AddRecipe(19090, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15764)
	recipe:SetCraftedItemID(15058)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Runic Leather Pants -- 19091
	recipe = AddRecipe(19091, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15765)
	recipe:SetCraftedItemID(15095)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Wicked Leather Belt -- 19092
	recipe = AddRecipe(19092, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15768)
	recipe:SetCraftedItemID(15088)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Onyxia Scale Cloak -- 19093
	recipe = AddRecipe(19093, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15769)
	recipe:SetCraftedItemID(15138)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.QUEST, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddQuest(7493, 7497)
	recipe:AddCustom("ONYXIA_HEAD_QUEST")

	-- Black Dragonscale Shoulders -- 19094
	recipe = AddRecipe(19094, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15770)
	recipe:SetCraftedItemID(15051)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(8898)

	-- Living Breastplate -- 19095
	recipe = AddRecipe(19095, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15771)
	recipe:SetCraftedItemID(15059)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Devilsaur Leggings -- 19097
	recipe = AddRecipe(19097, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15772)
	recipe:SetCraftedItemID(15062)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(6556, 6557, 6559, 9477)

	-- Wicked Leather Armor -- 19098
	recipe = AddRecipe(19098, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15773)
	recipe:SetCraftedItemID(15085)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Heavy Scorpid Shoulders -- 19100
	recipe = AddRecipe(19100, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15774)
	recipe:SetCraftedItemID(15081)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(7029)

	-- Volcanic Shoulders -- 19101
	recipe = AddRecipe(19101, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15775)
	recipe:SetCraftedItemID(15055)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(9260)

	-- Runic Leather Armor -- 19102
	recipe = AddRecipe(19102, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15776)
	recipe:SetCraftedItemID(15090)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Runic Leather Shoulders -- 19103
	recipe = AddRecipe(19103, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(15777)
	recipe:SetCraftedItemID(15096)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Frostsaber Tunic -- 19104
	recipe = AddRecipe(19104, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(15779)
	recipe:SetCraftedItemID(15068)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7438)

	-- Black Dragonscale Leggings -- 19107
	recipe = AddRecipe(19107, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(15781)
	recipe:SetCraftedItemID(15052)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(8903)

	-- Medium Leather -- 20648
	recipe = AddRecipe(20648, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(2319)
	recipe:SetSkillLevels(100, 100, 100, 105, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Heavy Leather -- 20649
	recipe = AddRecipe(20649, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4234)
	recipe:SetSkillLevels(150, 150, 150, 155, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Thick Leather -- 20650
	recipe = AddRecipe(20650, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(4304)
	recipe:SetSkillLevels(200, 200, 200, 202, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Corehound Boots -- 20853
	recipe = AddRecipe(20853, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17022)
	recipe:SetCraftedItemID(16982)
	recipe:SetSkillLevels(295, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(12944)

	-- Molten Helm -- 20854
	recipe = AddRecipe(20854, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17023)
	recipe:SetCraftedItemID(16983)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.LEATHER)
	recipe:AddVendor(12944)

	-- Black Dragonscale Boots -- 20855
	recipe = AddRecipe(20855, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(17025)
	recipe:SetCraftedItemID(16984)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Gloves of the Greatfather -- 21943
	recipe = AddRecipe(21943, V.ORIG, Q.UNCOMMON)
	recipe:SetRecipeItemID(17722)
	recipe:SetCraftedItemID(17721)
	recipe:SetSkillLevels(190, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddSeason("WINTER_VEIL")

	-- Rugged Leather -- 22331
	recipe = AddRecipe(22331, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(8170)
	recipe:SetSkillLevels(250, 250, 250, 250, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Shadowskin Gloves -- 22711
	recipe = AddRecipe(22711, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18239)
	recipe:SetCraftedItemID(18238)
	recipe:SetSkillLevels(200, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddLimitedVendor(2699, 1)

	-- Core Armor Kit -- 22727
	recipe = AddRecipe(22727, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18252)
	recipe:SetCraftedItemID(18251)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom("MC_RANDOM")

	-- Gordok Ogre Suit -- 22815
	recipe = AddRecipe(22815, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(18258)
	recipe:SetSkillLevels(275, 275, 285, 290, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(5518)

	-- Girdle of Insight -- 22921
	recipe = AddRecipe(22921, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18514)
	recipe:SetCraftedItemID(18504)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Mongoose Boots -- 22922
	recipe = AddRecipe(22922, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18515)
	recipe:SetCraftedItemID(18506)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Swift Flight Bracers -- 22923
	recipe = AddRecipe(22923, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(18516)
	recipe:SetCraftedItemID(18508)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Chromatic Cloak -- 22926
	recipe = AddRecipe(22926, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(18517)
	recipe:SetCraftedItemID(18509)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Hide of the Wild -- 22927
	recipe = AddRecipe(22927, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(18518)
	recipe:SetCraftedItemID(18510)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Shifting Cloak -- 22928
	recipe = AddRecipe(22928, V.ORIG, Q.EPIC)
	recipe:SetRecipeItemID(18519)
	recipe:SetCraftedItemID(18511)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Heavy Leather Ball -- 23190
	recipe = AddRecipe(23190, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18731)
	recipe:SetCraftedItemID(18662)
	recipe:SetSkillLevels(150, 150, 150, 155, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3366, 5128)

	-- Barbaric Bracers -- 23399
	recipe = AddRecipe(23399, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(18949)
	recipe:SetCraftedItemID(18948)
	recipe:SetSkillLevels(155, 155, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddLimitedVendor(4225, 1, 4589, 1)

	-- Might of the Timbermaw -- 23703
	recipe = AddRecipe(23703, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19326)
	recipe:SetCraftedItemID(19044)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Timbermaw Brawlers -- 23704
	recipe = AddRecipe(23704, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19327)
	recipe:SetCraftedItemID(19049)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.REVERED, 11557)

	-- Dawn Treaders -- 23705
	recipe = AddRecipe(23705, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19328)
	recipe:SetCraftedItemID(19052)
	recipe:SetSkillLevels(290, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ARGENTDAWN, F.LEATHER)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Golden Mantle of the Dawn -- 23706
	recipe = AddRecipe(23706, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19329)
	recipe:SetCraftedItemID(19058)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ARGENTDAWN, F.LEATHER)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Lava Belt -- 23707
	recipe = AddRecipe(23707, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19330)
	recipe:SetCraftedItemID(19149)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.LEATHER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Chromatic Gauntlets -- 23708
	recipe = AddRecipe(23708, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19331)
	recipe:SetCraftedItemID(19157)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Corehound Belt -- 23709
	recipe = AddRecipe(23709, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19332)
	recipe:SetCraftedItemID(19162)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.LEATHER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Molten Belt -- 23710
	recipe = AddRecipe(23710, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19333)
	recipe:SetCraftedItemID(19163)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.LEATHER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Primal Batskin Jerkin -- 24121
	recipe = AddRecipe(24121, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19769)
	recipe:SetCraftedItemID(19685)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Primal Batskin Gloves -- 24122
	recipe = AddRecipe(24122, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19770)
	recipe:SetCraftedItemID(19686)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Primal Batskin Bracers -- 24123
	recipe = AddRecipe(24123, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19771)
	recipe:SetCraftedItemID(19687)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blood Tiger Breastplate -- 24124
	recipe = AddRecipe(24124, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19772)
	recipe:SetCraftedItemID(19688)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blood Tiger Shoulders -- 24125
	recipe = AddRecipe(24125, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(19773)
	recipe:SetCraftedItemID(19689)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blue Dragonscale Leggings -- 24654
	recipe = AddRecipe(24654, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(20295)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 29508, 33581, 33612, 33635)

	-- Green Dragonscale Gauntlets -- 24655
	recipe = AddRecipe(24655, V.ORIG, Q.COMMON)
	recipe:SetCraftedItemID(20296)
	recipe:SetSkillLevels(280, 280, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 29508, 33581, 33612, 33635)

	-- Dreamscale Breastplate -- 24703
	recipe = AddRecipe(24703, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20382)
	recipe:SetCraftedItemID(20380)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.EXALTED, 15293)

	-- Spitfire Bracers -- 24846
	recipe = AddRecipe(24846, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20506)
	recipe:SetCraftedItemID(20481)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15293)

	-- Spitfire Gauntlets -- 24847
	recipe = AddRecipe(24847, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20507)
	recipe:SetCraftedItemID(20480)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15293)

	-- Spitfire Breastplate -- 24848
	recipe = AddRecipe(24848, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20508)
	recipe:SetCraftedItemID(20479)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15293)

	-- Sandstalker Bracers -- 24849
	recipe = AddRecipe(24849, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20509)
	recipe:SetCraftedItemID(20476)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15293)

	-- Sandstalker Gauntlets -- 24850
	recipe = AddRecipe(24850, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20510)
	recipe:SetCraftedItemID(20477)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15293)

	-- Sandstalker Breastplate -- 24851
	recipe = AddRecipe(24851, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20511)
	recipe:SetCraftedItemID(20478)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15293)

	-- Black Whelp Tunic -- 24940
	recipe = AddRecipe(24940, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(20576)
	recipe:SetCraftedItemID(20575)
	recipe:SetSkillLevels(100, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(777)

	-- Stormshroud Gloves -- 26279
	recipe = AddRecipe(26279, V.ORIG, Q.RARE)
	recipe:SetRecipeItemID(21548)
	recipe:SetCraftedItemID(21278)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(14454, 14457)

	-- Polar Tunic -- 28219
	recipe = AddRecipe(28219, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22661)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("NAXX40_GONE")

	-- Polar Gloves -- 28220
	recipe = AddRecipe(28220, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22662)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("NAXX40_GONE")

	-- Polar Bracers -- 28221
	recipe = AddRecipe(28221, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22663)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("NAXX40_GONE")

	-- Icy Scale Breastplate -- 28222
	recipe = AddRecipe(28222, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22664)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("NAXX40_GONE")

	-- Icy Scale Gauntlets -- 28223
	recipe = AddRecipe(28223, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22666)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("NAXX40_GONE")

	-- Icy Scale Bracers -- 28224
	recipe = AddRecipe(28224, V.ORIG, Q.EPIC)
	recipe:SetCraftedItemID(22665)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("NAXX40_GONE")

	-- Bramblewood Helm -- 28472
	recipe = AddRecipe(28472, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22771)
	recipe:SetCraftedItemID(22759)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15293)

	-- Bramblewood Boots -- 28473
	recipe = AddRecipe(28473, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22770)
	recipe:SetCraftedItemID(22760)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15293)

	-- Bramblewood Belt -- 28474
	recipe = AddRecipe(28474, V.ORIG, Q.COMMON)
	recipe:SetRecipeItemID(22769)
	recipe:SetCraftedItemID(22761)
	recipe:SetSkillLevels(300, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15293)

	-- Knothide Leather -- 32454
	recipe = AddRecipe(32454, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(21887)
	recipe:SetSkillLevels(300, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Heavy Knothide Leather -- 32455
	recipe = AddRecipe(32455, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25720)
	recipe:SetCraftedItemID(23793)
	recipe:SetSkillLevels(325, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 28700, 33581, 33612, 33635)

	-- Knothide Armor Kit -- 32456
	recipe = AddRecipe(32456, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25650)
	recipe:SetSkillLevels(300, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Vindicator's Armor Kit -- 32457
	recipe = AddRecipe(32457, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25721)
	recipe:SetCraftedItemID(25651)
	recipe:SetSkillLevels(325, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Magister's Armor Kit -- 32458
	recipe = AddRecipe(32458, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25722)
	recipe:SetCraftedItemID(25652)
	recipe:SetSkillLevels(325, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Riding Crop -- 32461
	recipe = AddRecipe(32461, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25725)
	recipe:SetCraftedItemID(25653)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddVendor(18672)

	-- Felscale Gloves -- 32462
	recipe = AddRecipe(32462, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25654)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Felscale Boots -- 32463
	recipe = AddRecipe(32463, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25655)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Felscale Pants -- 32464
	recipe = AddRecipe(32464, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25656)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Felscale Breastplate -- 32465
	recipe = AddRecipe(32465, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25657)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Scaled Draenic Pants -- 32466
	recipe = AddRecipe(32466, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25662)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Scaled Draenic Gloves -- 32467
	recipe = AddRecipe(32467, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25661)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Scaled Draenic Vest -- 32468
	recipe = AddRecipe(32468, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25660)
	recipe:SetSkillLevels(325, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Scaled Draenic Boots -- 32469
	recipe = AddRecipe(32469, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25659)
	recipe:SetSkillLevels(335, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Thick Draenic Gloves -- 32470
	recipe = AddRecipe(32470, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25669)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Thick Draenic Pants -- 32471
	recipe = AddRecipe(32471, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25670)
	recipe:SetSkillLevels(315, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Thick Draenic Boots -- 32472
	recipe = AddRecipe(32472, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25668)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Thick Draenic Vest -- 32473
	recipe = AddRecipe(32473, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25671)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Wild Draenish Boots -- 32478
	recipe = AddRecipe(32478, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25673)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Wild Draenish Gloves -- 32479
	recipe = AddRecipe(32479, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25674)
	recipe:SetSkillLevels(310, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Wild Draenish Leggings -- 32480
	recipe = AddRecipe(32480, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25675)
	recipe:SetSkillLevels(320, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Wild Draenish Vest -- 32481
	recipe = AddRecipe(32481, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(25676)
	recipe:SetSkillLevels(330, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Comfortable Insoles -- 32482
	recipe = AddRecipe(32482, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(25726)
	recipe:SetCraftedItemID(25679)
	recipe:SetSkillLevels(300, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16748)
	recipe:AddLimitedVendor(16689, 1)

	-- Stylin' Purple Hat -- 32485
	recipe = AddRecipe(32485, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25728)
	recipe:SetCraftedItemID(25680)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(18667)

	-- Stylin' Adventure Hat -- 32487
	recipe = AddRecipe(32487, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25729)
	recipe:SetCraftedItemID(25681)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(17820, 28132)

	-- Stylin' Crimson Hat -- 32488
	recipe = AddRecipe(32488, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25731)
	recipe:SetCraftedItemID(25683)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(18322)

	-- Stylin' Jungle Hat -- 32489
	recipe = AddRecipe(32489, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25730)
	recipe:SetCraftedItemID(25682)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(17839, 21104)

	-- Fel Leather Gloves -- 32490
	recipe = AddRecipe(32490, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25732)
	recipe:SetCraftedItemID(25685)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM, F.LEATHER)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Fel Leather Boots -- 32493
	recipe = AddRecipe(32493, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25733)
	recipe:SetCraftedItemID(25686)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM, F.LEATHER)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Fel Leather Leggings -- 32494
	recipe = AddRecipe(32494, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25734)
	recipe:SetCraftedItemID(25687)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM, F.LEATHER)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Heavy Clefthoof Vest -- 32495
	recipe = AddRecipe(32495, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25735)
	recipe:SetCraftedItemID(25689)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Heavy Clefthoof Leggings -- 32496
	recipe = AddRecipe(32496, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25736)
	recipe:SetCraftedItemID(25690)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Heavy Clefthoof Boots -- 32497
	recipe = AddRecipe(32497, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(25737)
	recipe:SetCraftedItemID(25691)
	recipe:SetSkillLevels(355, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.FRIENDLY, 17904)

	-- Felstalker Belt -- 32498
	recipe = AddRecipe(32498, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(29213)
	recipe:SetCraftedItemID(25695)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE, F.MAIL)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Felstalker Bracers -- 32499
	recipe = AddRecipe(32499, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(29214)
	recipe:SetCraftedItemID(25697)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE, F.MAIL)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Felstalker Breastplate -- 32500
	recipe = AddRecipe(32500, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(29215)
	recipe:SetCraftedItemID(25696)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE, F.MAIL)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Netherfury Belt -- 32501
	recipe = AddRecipe(32501, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(29217)
	recipe:SetCraftedItemID(25694)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NAGRAND, F.MAIL)
	recipe:AddRepVendor(FAC.KURENAI, REP.FRIENDLY, 20240)

	-- Netherfury Leggings -- 32502
	recipe = AddRecipe(32502, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(29219)
	recipe:SetCraftedItemID(25692)
	recipe:SetSkillLevels(340, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NAGRAND, F.MAIL)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Netherfury Boots -- 32503
	recipe = AddRecipe(32503, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(29218)
	recipe:SetCraftedItemID(25693)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NAGRAND, F.MAIL)
	recipe:AddRepVendor(FAC.KURENAI, REP.REVERED, 20240)

	-- Shadow Armor Kit -- 35520
	recipe = AddRecipe(35520, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(29669)
	recipe:SetCraftedItemID(29483)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18320)

	-- Flame Armor Kit -- 35521
	recipe = AddRecipe(35521, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(29672)
	recipe:SetCraftedItemID(29485)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(20898)

	-- Frost Armor Kit -- 35522
	recipe = AddRecipe(35522, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(29673)
	recipe:SetCraftedItemID(29486)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17797)

	-- Nature Armor Kit -- 35523
	recipe = AddRecipe(35523, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(29674)
	recipe:SetCraftedItemID(29487)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17941)

	-- Arcane Armor Kit -- 35524
	recipe = AddRecipe(35524, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(29675)
	recipe:SetCraftedItemID(29488)
	recipe:SetSkillLevels(340, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17879)

	-- Enchanted Felscale Leggings -- 35525
	recipe = AddRecipe(35525, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29677)
	recipe:SetCraftedItemID(29489)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.MAIL)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Enchanted Felscale Gloves -- 35526
	recipe = AddRecipe(35526, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29682)
	recipe:SetCraftedItemID(29490)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.MAIL)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Enchanted Felscale Boots -- 35527
	recipe = AddRecipe(35527, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29684)
	recipe:SetCraftedItemID(29491)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.MAIL)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Flamescale Boots -- 35528
	recipe = AddRecipe(35528, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29691)
	recipe:SetCraftedItemID(29493)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.MAIL)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Flamescale Leggings -- 35529
	recipe = AddRecipe(35529, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29689)
	recipe:SetCraftedItemID(29492)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.MAIL)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Reinforced Mining Bag -- 35530
	recipe = AddRecipe(35530, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(30444)
	recipe:SetCraftedItemID(29540)
	recipe:SetSkillLevels(325, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Flamescale Belt -- 35531
	recipe = AddRecipe(35531, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29693)
	recipe:SetCraftedItemID(29494)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.MAIL)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Enchanted Clefthoof Leggings -- 35532
	recipe = AddRecipe(35532, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29698)
	recipe:SetCraftedItemID(29495)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.LEATHER)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Enchanted Clefthoof Gloves -- 35533
	recipe = AddRecipe(35533, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29700)
	recipe:SetCraftedItemID(29496)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.LEATHER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Enchanted Clefthoof Boots -- 35534
	recipe = AddRecipe(35534, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29701)
	recipe:SetCraftedItemID(29497)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.LEATHER)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Blastguard Pants -- 35535
	recipe = AddRecipe(35535, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29702)
	recipe:SetCraftedItemID(29498)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.LEATHER)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Blastguard Boots -- 35536
	recipe = AddRecipe(35536, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29703)
	recipe:SetCraftedItemID(29499)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.LEATHER)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Blastguard Belt -- 35537
	recipe = AddRecipe(35537, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29704)
	recipe:SetCraftedItemID(29500)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.LEATHER)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Drums of Panic -- 35538
	recipe = AddRecipe(35538, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29713)
	recipe:SetCraftedItemID(29532)
	recipe:SetSkillLevels(370, 370, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Drums of Restoration -- 35539
	recipe = AddRecipe(35539, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(34175)
	recipe:SetCraftedItemID(29531)
	recipe:SetSkillLevels(350, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Drums of War -- 35540
	recipe = AddRecipe(35540, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29528)
	recipe:SetSkillLevels(340, 340, 340, 347, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Drums of Battle -- 35543
	recipe = AddRecipe(35543, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29717)
	recipe:SetCraftedItemID(29529)
	recipe:SetSkillLevels(365, 365, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Drums of Speed -- 35544
	recipe = AddRecipe(35544, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(34173)
	recipe:SetCraftedItemID(29530)
	recipe:SetSkillLevels(345, 345, 345, 352, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.MAGHAR, REP.HONORED, 20241)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Cobrahide Leg Armor -- 35549
	recipe = AddRecipe(35549, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(31361)
	recipe:SetCraftedItemID(29533)
	recipe:SetSkillLevels(335, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Nethercobra Leg Armor -- 35554
	recipe = AddRecipe(35554, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(31362)
	recipe:SetCraftedItemID(29535)
	recipe:SetSkillLevels(365, 365, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.EXALTED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.EXALTED, 17585)

	-- Clefthide Leg Armor -- 35555
	recipe = AddRecipe(35555, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29720)
	recipe:SetCraftedItemID(29534)
	recipe:SetSkillLevels(335, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Nethercleft Leg Armor -- 35557
	recipe = AddRecipe(35557, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(29721)
	recipe:SetCraftedItemID(29536)
	recipe:SetSkillLevels(365, 365, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Cobrascale Hood -- 35558
	recipe = AddRecipe(35558, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29723)
	recipe:SetCraftedItemID(29502)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Cobrascale Gloves -- 35559
	recipe = AddRecipe(35559, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35302)
	recipe:SetCraftedItemID(29503)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Windscale Hood -- 35560
	recipe = AddRecipe(35560, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29725)
	recipe:SetCraftedItemID(29504)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Hood of Primal Life -- 35561
	recipe = AddRecipe(35561, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29726)
	recipe:SetCraftedItemID(29505)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Gloves of the Living Touch -- 35562
	recipe = AddRecipe(35562, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35303)
	recipe:SetCraftedItemID(29506)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(24664)

	-- Windslayer Wraps -- 35563
	recipe = AddRecipe(35563, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29728)
	recipe:SetCraftedItemID(29507)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Living Dragonscale Helm -- 35564
	recipe = AddRecipe(35564, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29729)
	recipe:SetCraftedItemID(29508)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Earthen Netherscale Boots -- 35567
	recipe = AddRecipe(35567, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29730)
	recipe:SetCraftedItemID(29512)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Windstrike Gloves -- 35568
	recipe = AddRecipe(35568, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35300)
	recipe:SetCraftedItemID(29509)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddMobDrop(24664)

	-- Netherdrake Helm -- 35572
	recipe = AddRecipe(35572, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29732)
	recipe:SetCraftedItemID(29510)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Netherdrake Gloves -- 35573
	recipe = AddRecipe(35573, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35301)
	recipe:SetCraftedItemID(29511)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(24664)

	-- Thick Netherscale Breastplate -- 35574
	recipe = AddRecipe(35574, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(29734)
	recipe:SetCraftedItemID(29514)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Ebon Netherscale Breastplate -- 35575
	recipe = AddRecipe(35575, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29515)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ebon Netherscale Belt -- 35576
	recipe = AddRecipe(35576, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29516)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Ebon Netherscale Bracers -- 35577
	recipe = AddRecipe(35577, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29517)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Netherstrike Breastplate -- 35580
	recipe = AddRecipe(35580, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29519)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Netherstrike Belt -- 35582
	recipe = AddRecipe(35582, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29520)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Netherstrike Bracers -- 35584
	recipe = AddRecipe(35584, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29521)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Windhawk Hauberk -- 35585
	recipe = AddRecipe(35585, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29522)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Windhawk Belt -- 35587
	recipe = AddRecipe(35587, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29524)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Windhawk Bracers -- 35588
	recipe = AddRecipe(35588, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29523)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Primalstrike Vest -- 35589
	recipe = AddRecipe(35589, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29525)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Primalstrike Belt -- 35590
	recipe = AddRecipe(35590, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29526)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Primalstrike Bracers -- 35591
	recipe = AddRecipe(35591, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29527)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Blackstorm Leggings -- 36074
	recipe = AddRecipe(36074, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29964)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7868, 7869, 21087, 29507, 33581, 33612, 33635)

	-- Wildfeather Leggings -- 36075
	recipe = AddRecipe(36075, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29970)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7871, 21087, 29509, 33581, 33612, 33635)

	-- Dragonstrike Leggings -- 36076
	recipe = AddRecipe(36076, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29971)
	recipe:SetSkillLevels(260, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 29508, 33581, 33612, 33635)

	-- Primalstorm Breastplate -- 36077
	recipe = AddRecipe(36077, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29973)
	recipe:SetSkillLevels(330, 330, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7868, 7869, 21087, 29507, 33581, 33612, 33635)

	-- Living Crystal Breastplate -- 36078
	recipe = AddRecipe(36078, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29974)
	recipe:SetSkillLevels(330, 330, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 7871, 21087, 29509, 33581, 33612, 33635)

	-- Golden Dragonstrike Breastplate -- 36079
	recipe = AddRecipe(36079, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(29975)
	recipe:SetSkillLevels(330, 330, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 29508, 33581, 33612, 33635)

	-- Belt of Natural Power -- 36349
	recipe = AddRecipe(36349, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30301)
	recipe:SetCraftedItemID(30042)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Belt of Deep Shadow -- 36351
	recipe = AddRecipe(36351, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30302)
	recipe:SetCraftedItemID(30040)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Belt of the Black Eagle -- 36352
	recipe = AddRecipe(36352, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30303)
	recipe:SetCraftedItemID(30046)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Monsoon Belt -- 36353
	recipe = AddRecipe(36353, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30304)
	recipe:SetCraftedItemID(30044)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of Natural Grace -- 36355
	recipe = AddRecipe(36355, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30305)
	recipe:SetCraftedItemID(30041)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of Utter Darkness -- 36357
	recipe = AddRecipe(36357, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30306)
	recipe:SetCraftedItemID(30039)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of the Crimson Hawk -- 36358
	recipe = AddRecipe(36358, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30307)
	recipe:SetCraftedItemID(30045)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Hurricane Boots -- 36359
	recipe = AddRecipe(36359, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(30308)
	recipe:SetCraftedItemID(30043)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("SSC_RANDOM", "TK_RANDOM")

	-- Boots of Shackled Souls -- 39997
	recipe = AddRecipe(39997, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32429)
	recipe:SetCraftedItemID(32398)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Greaves of Shackled Souls -- 40001
	recipe = AddRecipe(40001, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32431)
	recipe:SetCraftedItemID(32400)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Waistguard of Shackled Souls -- 40002
	recipe = AddRecipe(40002, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32432)
	recipe:SetCraftedItemID(32397)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Redeemed Soul Moccasins -- 40003
	recipe = AddRecipe(40003, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32433)
	recipe:SetCraftedItemID(32394)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Redeemed Soul Wristguards -- 40004
	recipe = AddRecipe(40004, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32434)
	recipe:SetCraftedItemID(32395)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Redeemed Soul Legguards -- 40005
	recipe = AddRecipe(40005, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32435)
	recipe:SetCraftedItemID(32396)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Redeemed Soul Cinch -- 40006
	recipe = AddRecipe(40006, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(32436)
	recipe:SetCraftedItemID(32393)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Bracers of Renewed Life -- 41156
	recipe = AddRecipe(41156, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(32744)
	recipe:SetCraftedItemID(32582)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("BT_RANDOM")

	-- Shoulderpads of Renewed Life -- 41157
	recipe = AddRecipe(41157, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35523)
	recipe:SetCraftedItemID(32583)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Swiftstrike Bracers -- 41158
	recipe = AddRecipe(41158, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35527)
	recipe:SetCraftedItemID(32580)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Swiftstrike Shoulders -- 41160
	recipe = AddRecipe(41160, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35528)
	recipe:SetCraftedItemID(32581)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("BT_RANDOM")

	-- Bindings of Lightning Reflexes -- 41161
	recipe = AddRecipe(41161, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35517)
	recipe:SetCraftedItemID(32574)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Shoulders of Lightning Reflexes -- 41162
	recipe = AddRecipe(41162, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35524)
	recipe:SetCraftedItemID(32575)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("BT_RANDOM")

	-- Living Earth Bindings -- 41163
	recipe = AddRecipe(41163, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35520)
	recipe:SetCraftedItemID(32577)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("BT_RANDOM")

	-- Living Earth Shoulders -- 41164
	recipe = AddRecipe(41164, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35521)
	recipe:SetCraftedItemID(32579)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("BT_RANDOM", "HYJAL_RANDOM")

	-- Cloak of Darkness -- 42546
	recipe = AddRecipe(42546, V.TBC, Q.RARE)
	recipe:SetRecipeItemID(33124)
	recipe:SetCraftedItemID(33122)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.VIOLETEYE, F.CLOAK)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.EXALTED, 18255)

	-- Shadowprowler's Chestguard -- 42731
	recipe = AddRecipe(42731, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(33205)
	recipe:SetCraftedItemID(33204)
	recipe:SetSkillLevels(365, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.VIOLETEYE, F.LEATHER)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.REVERED, 18255)

	-- Quiver of a Thousand Feathers -- 44359
	recipe = AddRecipe(44359, V.TBC, Q.COMMON)
	recipe:SetRecipeItemID(34200)
	recipe:SetCraftedItemID(34105)
	recipe:SetSkillLevels(350, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RETIRED, F.IBOE, F.RBOP)
	recipe:AddCustom("REMOVED_FROM_GAME")

	-- Glove Reinforcements -- 44770
	recipe = AddRecipe(44770, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(34207)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Winter Boots -- 44953
	recipe = AddRecipe(44953, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(34262)
	recipe:SetCraftedItemID(34086)
	recipe:SetSkillLevels(285, 285, 285, 285, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(13420, 13433)
	recipe:AddSeason("WINTER_VEIL")

	-- Heavy Knothide Armor Kit -- 44970
	recipe = AddRecipe(44970, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(34330)
	recipe:SetSkillLevels(350, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Leatherworker's Satchel -- 45100
	recipe = AddRecipe(45100, V.TBC, Q.COMMON)
	recipe:SetCraftedItemID(34482)
	recipe:SetSkillLevels(300, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 18754, 18771, 19187, 21087, 33581, 33612, 33635, 33681)

	-- Bag of Many Hides -- 45117
	recipe = AddRecipe(45117, V.TBC, Q.UNCOMMON)
	recipe:SetRecipeItemID(34491)
	recipe:SetCraftedItemID(34490)
	recipe:SetSkillLevels(360, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(22143, 22144, 22148, 23022)

	-- Leather Gauntlets of the Sun -- 46132
	recipe = AddRecipe(46132, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35546)
	recipe:SetCraftedItemID(34372)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Fletcher's Gloves of the Phoenix -- 46133
	recipe = AddRecipe(46133, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35541)
	recipe:SetCraftedItemID(34374)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Gloves of Immortal Dusk -- 46134
	recipe = AddRecipe(46134, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35214)
	recipe:SetCraftedItemID(34370)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Sun-Drenched Scale Gloves -- 46135
	recipe = AddRecipe(46135, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35215)
	recipe:SetCraftedItemID(34376)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Leather Chestguard of the Sun -- 46136
	recipe = AddRecipe(46136, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35216)
	recipe:SetCraftedItemID(34371)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Embrace of the Phoenix -- 46137
	recipe = AddRecipe(46137, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35217)
	recipe:SetCraftedItemID(34373)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Carapace of Sun and Shadow -- 46138
	recipe = AddRecipe(46138, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35218)
	recipe:SetCraftedItemID(34369)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Sun-Drenched Scale Chestguard -- 46139
	recipe = AddRecipe(46139, V.TBC, Q.EPIC)
	recipe:SetRecipeItemID(35549)
	recipe:SetCraftedItemID(34375)
	recipe:SetSkillLevels(365, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("SUNWELL_RANDOM")

	-- Heavy Borean Leather -- 50936
	recipe = AddRecipe(50936, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38425)
	recipe:SetSkillLevels(390, 390, 390, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Chestguard -- 50938
	recipe = AddRecipe(50938, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38408)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Leggings -- 50939
	recipe = AddRecipe(50939, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38410)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Shoulderpads -- 50940
	recipe = AddRecipe(50940, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38411)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Gloves -- 50941
	recipe = AddRecipe(50941, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38409)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Boots -- 50942
	recipe = AddRecipe(50942, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38407)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Belt -- 50943
	recipe = AddRecipe(50943, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38406)
	recipe:SetSkillLevels(380, 380, 380, 387, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Chestpiece -- 50944
	recipe = AddRecipe(50944, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38400)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Leggings -- 50945
	recipe = AddRecipe(50945, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38401)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Shoulderpads -- 50946
	recipe = AddRecipe(50946, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38402)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Gloves -- 50947
	recipe = AddRecipe(50947, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38403)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Boots -- 50948
	recipe = AddRecipe(50948, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38404)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Belt -- 50949
	recipe = AddRecipe(50949, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38405)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Chestguard -- 50950
	recipe = AddRecipe(50950, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38414)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Leggings -- 50951
	recipe = AddRecipe(50951, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38416)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Shoulders -- 50952
	recipe = AddRecipe(50952, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38424)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Gloves -- 50953
	recipe = AddRecipe(50953, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38415)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Boots -- 50954
	recipe = AddRecipe(50954, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38413)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Belt -- 50955
	recipe = AddRecipe(50955, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38412)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Chestguard -- 50956
	recipe = AddRecipe(50956, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38420)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Legguards -- 50957
	recipe = AddRecipe(50957, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38422)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Shoulders -- 50958
	recipe = AddRecipe(50958, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38417)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Gloves -- 50959
	recipe = AddRecipe(50959, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38421)
	recipe:SetSkillLevels(370, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Boots -- 50960
	recipe = AddRecipe(50960, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38419)
	recipe:SetSkillLevels(380, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Belt -- 50961
	recipe = AddRecipe(50961, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38418)
	recipe:SetSkillLevels(375, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Borean Armor Kit -- 50962
	recipe = AddRecipe(50962, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38375)
	recipe:SetSkillLevels(350, 350, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Heavy Borean Armor Kit -- 50963
	recipe = AddRecipe(50963, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38376)
	recipe:SetSkillLevels(395, 395, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Jormungar Leg Armor -- 50964
	recipe = AddRecipe(50964, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38371)
	recipe:SetSkillLevels(405, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frosthide Leg Armor -- 50965
	recipe = AddRecipe(50965, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38373)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Leg Armor -- 50966
	recipe = AddRecipe(50966, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38372)
	recipe:SetSkillLevels(400, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Icescale Leg Armor -- 50967
	recipe = AddRecipe(50967, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38374)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Trapper's Traveling Pack -- 50970
	recipe = AddRecipe(50970, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44509)
	recipe:SetCraftedItemID(38399)
	recipe:SetSkillLevels(415, 415, 420, 422, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.REVERED, 31916, 32763)

	-- Mammoth Mining Bag -- 50971
	recipe = AddRecipe(50971, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44510)
	recipe:SetCraftedItemID(38347)
	recipe:SetSkillLevels(415, 415, 420, 422, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.HONORED, 32540)

	-- Black Chitinguard Boots -- 51568
	recipe = AddRecipe(51568, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38590)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Arctic Leggings -- 51569
	recipe = AddRecipe(51569, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38591)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Arctic Chestpiece -- 51570
	recipe = AddRecipe(51570, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38592)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Wristguards -- 51571
	recipe = AddRecipe(51571, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38433)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Arctic Helm -- 51572
	recipe = AddRecipe(51572, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38437)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Bracers of Shackled Souls -- 52733
	recipe = AddRecipe(52733, V.WOTLK, Q.COMMON)
	recipe:SetRecipeItemID(32430)
	recipe:SetCraftedItemID(32399)
	recipe:SetSkillLevels(375, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Cloak of Tormented Skies -- 55199
	recipe = AddRecipe(55199, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(41238)
	recipe:SetSkillLevels(395, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Fur Lining - Attack Power -- 57683
	recipe = AddRecipe(57683, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Fur Lining - Stamina -- 57690
	recipe = AddRecipe(57690, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Fur Lining - Spell Power -- 57691
	recipe = AddRecipe(57691, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Fur Lining - Fire Resist -- 57692
	recipe = AddRecipe(57692, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44559)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(30921)

	-- Fur Lining - Frost Resist -- 57694
	recipe = AddRecipe(57694, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44560)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32289)

	-- Fur Lining - Shadow Resist -- 57696
	recipe = AddRecipe(57696, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44561)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32349)

	-- Fur Lining - Nature Resist -- 57699
	recipe = AddRecipe(57699, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44562)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32290)

	-- Fur Lining - Arcane Resist -- 57701
	recipe = AddRecipe(57701, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44563)
	recipe:SetSkillLevels(400, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(31702, 32297)

	-- Jormungar Leg Reinforcements -- 60583
	recipe = AddRecipe(60583, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(405, 405, 405, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Leg Reinforcements -- 60584
	recipe = AddRecipe(60584, V.WOTLK, Q.COMMON)
	recipe:SetSkillLevels(400, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Bracers -- 60599
	recipe = AddRecipe(60599, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38436)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Frostscale Helm -- 60600
	recipe = AddRecipe(60600, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38440)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Frostscale Leggings -- 60601
	recipe = AddRecipe(60601, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44436)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Frostscale Breastplate -- 60604
	recipe = AddRecipe(60604, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44437)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dragonstompers -- 60605
	recipe = AddRecipe(60605, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44438)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Wristguards -- 60607
	recipe = AddRecipe(60607, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38434)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Iceborne Helm -- 60608
	recipe = AddRecipe(60608, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38438)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Iceborne Leggings -- 60611
	recipe = AddRecipe(60611, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44440)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Iceborne Chestguard -- 60613
	recipe = AddRecipe(60613, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44441)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Bugsquashers -- 60620
	recipe = AddRecipe(60620, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44442)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Bracers -- 60622
	recipe = AddRecipe(60622, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38435)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nerubian Helm -- 60624
	recipe = AddRecipe(60624, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38439)
	recipe:SetSkillLevels(385, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Nerubian Leggings -- 60627
	recipe = AddRecipe(60627, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44443)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Dark Nerubian Chestpiece -- 60629
	recipe = AddRecipe(60629, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44444)
	recipe:SetSkillLevels(395, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Scaled Icewalkers -- 60630
	recipe = AddRecipe(60630, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44445)
	recipe:SetSkillLevels(400, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Cloak of Harsh Winds -- 60631
	recipe = AddRecipe(60631, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(38441)
	recipe:SetSkillLevels(380, 380, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Ice Striker's Cloak -- 60637
	recipe = AddRecipe(60637, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43566)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Durable Nerubhide Cape -- 60640
	recipe = AddRecipe(60640, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43565)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.CLOAK)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Pack of Endless Pockets -- 60643
	recipe = AddRecipe(60643, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44446)
	recipe:SetSkillLevels(415, 415, 420, 422, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Razorstrike Breastplate -- 60649
	recipe = AddRecipe(60649, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43129)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Virulent Spaulders -- 60651
	recipe = AddRecipe(60651, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43130)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Eaglebane Bracers -- 60652
	recipe = AddRecipe(60652, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43131)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nightshock Hood -- 60655
	recipe = AddRecipe(60655, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43132)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Nightshock Girdle -- 60658
	recipe = AddRecipe(60658, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43133)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Leggings of Visceral Strikes -- 60660
	recipe = AddRecipe(60660, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(42731)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Seafoam Gauntlets -- 60665
	recipe = AddRecipe(60665, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43255)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Jormscale Footpads -- 60666
	recipe = AddRecipe(60666, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43256)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Wildscale Breastplate -- 60669
	recipe = AddRecipe(60669, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43257)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Purehorn Spaulders -- 60671
	recipe = AddRecipe(60671, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(43258)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Eviscerator's Facemask -- 60697
	recipe = AddRecipe(60697, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44513)
	recipe:SetCraftedItemID(43260)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Shoulderpads -- 60702
	recipe = AddRecipe(60702, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44514)
	recipe:SetCraftedItemID(43433)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Chestguard -- 60703
	recipe = AddRecipe(60703, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44515)
	recipe:SetCraftedItemID(43434)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Bindings -- 60704
	recipe = AddRecipe(60704, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44516)
	recipe:SetCraftedItemID(43435)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Gauntlets -- 60705
	recipe = AddRecipe(60705, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44517)
	recipe:SetCraftedItemID(43436)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Waistguard -- 60706
	recipe = AddRecipe(60706, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44518)
	recipe:SetCraftedItemID(43437)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Legguards -- 60711
	recipe = AddRecipe(60711, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44519)
	recipe:SetCraftedItemID(43438)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Treads -- 60712
	recipe = AddRecipe(60712, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44520)
	recipe:SetCraftedItemID(43439)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Headguard -- 60715
	recipe = AddRecipe(60715, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44521)
	recipe:SetCraftedItemID(43261)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Spaulders -- 60716
	recipe = AddRecipe(60716, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44522)
	recipe:SetCraftedItemID(43262)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Chestguard -- 60718
	recipe = AddRecipe(60718, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44523)
	recipe:SetCraftedItemID(43263)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Bracers -- 60720
	recipe = AddRecipe(60720, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44524)
	recipe:SetCraftedItemID(43264)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Handwraps -- 60721
	recipe = AddRecipe(60721, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44525)
	recipe:SetCraftedItemID(43265)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Belt -- 60723
	recipe = AddRecipe(60723, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44526)
	recipe:SetCraftedItemID(43266)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Leggings -- 60725
	recipe = AddRecipe(60725, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44527)
	recipe:SetCraftedItemID(43271)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Boots -- 60727
	recipe = AddRecipe(60727, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44528)
	recipe:SetCraftedItemID(43273)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Swiftarrow Helm -- 60728
	recipe = AddRecipe(60728, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44530)
	recipe:SetCraftedItemID(43447)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Shoulderguards -- 60729
	recipe = AddRecipe(60729, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44531)
	recipe:SetCraftedItemID(43449)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Hauberk -- 60730
	recipe = AddRecipe(60730, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44532)
	recipe:SetCraftedItemID(43445)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Bracers -- 60731
	recipe = AddRecipe(60731, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44533)
	recipe:SetCraftedItemID(43444)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Gauntlets -- 60732
	recipe = AddRecipe(60732, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44534)
	recipe:SetCraftedItemID(43446)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Belt -- 60734
	recipe = AddRecipe(60734, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44535)
	recipe:SetCraftedItemID(43442)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Leggings -- 60735
	recipe = AddRecipe(60735, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44536)
	recipe:SetCraftedItemID(43448)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Boots -- 60737
	recipe = AddRecipe(60737, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44537)
	recipe:SetCraftedItemID(43443)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Crown -- 60743
	recipe = AddRecipe(60743, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44538)
	recipe:SetCraftedItemID(43455)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Shoulders -- 60746
	recipe = AddRecipe(60746, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44539)
	recipe:SetCraftedItemID(43457)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Hauberk -- 60747
	recipe = AddRecipe(60747, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44540)
	recipe:SetCraftedItemID(43453)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Wristguards -- 60748
	recipe = AddRecipe(60748, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44541)
	recipe:SetCraftedItemID(43452)
	recipe:SetSkillLevels(420, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Grips -- 60749
	recipe = AddRecipe(60749, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44542)
	recipe:SetCraftedItemID(43454)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Belt -- 60750
	recipe = AddRecipe(60750, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44543)
	recipe:SetCraftedItemID(43450)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Legguards -- 60751
	recipe = AddRecipe(60751, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44544)
	recipe:SetCraftedItemID(43456)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Stompers -- 60752
	recipe = AddRecipe(60752, V.WOTLK, Q.RARE)
	recipe:SetRecipeItemID(44545)
	recipe:SetCraftedItemID(43451)
	recipe:SetSkillLevels(425, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Giantmaim Legguards -- 60754
	recipe = AddRecipe(60754, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44546)
	recipe:SetCraftedItemID(43458)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Giantmaim Bracers -- 60755
	recipe = AddRecipe(60755, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44547)
	recipe:SetCraftedItemID(43459)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Revenant's Breastplate -- 60756
	recipe = AddRecipe(60756, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44548)
	recipe:SetCraftedItemID(43461)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Revenant's Treads -- 60757
	recipe = AddRecipe(60757, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44549)
	recipe:SetCraftedItemID(43469)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Trollwoven Spaulders -- 60758
	recipe = AddRecipe(60758, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44550)
	recipe:SetCraftedItemID(43481)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Trollwoven Girdle -- 60759
	recipe = AddRecipe(60759, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44551)
	recipe:SetCraftedItemID(43484)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Earthgiving Legguards -- 60760
	recipe = AddRecipe(60760, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44552)
	recipe:SetCraftedItemID(43495)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Earthgiving Boots -- 60761
	recipe = AddRecipe(60761, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44553)
	recipe:SetCraftedItemID(43502)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Polar Vest -- 60996
	recipe = AddRecipe(60996, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44584)
	recipe:SetCraftedItemID(43590)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddVendor(32515)

	-- Polar Cord -- 60997
	recipe = AddRecipe(60997, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44585)
	recipe:SetCraftedItemID(43591)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddVendor(32515)

	-- Polar Boots -- 60998
	recipe = AddRecipe(60998, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44586)
	recipe:SetCraftedItemID(43592)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddVendor(32515)

	-- Icy Scale Chestguard -- 60999
	recipe = AddRecipe(60999, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44587)
	recipe:SetCraftedItemID(43593)
	recipe:SetSkillLevels(425, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddVendor(32515)

	-- Icy Scale Belt -- 61000
	recipe = AddRecipe(61000, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44588)
	recipe:SetCraftedItemID(43594)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddVendor(32515)

	-- Icy Scale Boots -- 61002
	recipe = AddRecipe(61002, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44589)
	recipe:SetCraftedItemID(43595)
	recipe:SetSkillLevels(420, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddVendor(32515)

	-- Windripper Boots -- 62176
	recipe = AddRecipe(62176, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44932)
	recipe:SetCraftedItemID(44930)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Windripper Leggings -- 62177
	recipe = AddRecipe(62177, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(44933)
	recipe:SetCraftedItemID(44931)
	recipe:SetSkillLevels(440, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Earthen Leg Armor -- 62448
	recipe = AddRecipe(62448, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(44963)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Belt of Dragons -- 63194
	recipe = AddRecipe(63194, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45094)
	recipe:SetCraftedItemID(45553)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Boots of Living Scale -- 63195
	recipe = AddRecipe(63195, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45095)
	recipe:SetCraftedItemID(45095)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Blue Belt of Chaos -- 63196
	recipe = AddRecipe(63196, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45096)
	recipe:SetCraftedItemID(45096)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Lightning Grounded Boots -- 63197
	recipe = AddRecipe(63197, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45097)
	recipe:SetCraftedItemID(45097)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Death-warmed Belt -- 63198
	recipe = AddRecipe(63198, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45098)
	recipe:SetCraftedItemID(45098)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Footpads of Silence -- 63199
	recipe = AddRecipe(63199, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45099)
	recipe:SetCraftedItemID(45099)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Belt of Arctic Life -- 63200
	recipe = AddRecipe(63200, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45100)
	recipe:SetCraftedItemID(45100)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Boots of Wintry Endurance -- 63201
	recipe = AddRecipe(63201, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(45101)
	recipe:SetCraftedItemID(45101)
	recipe:SetSkillLevels(450, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("ULDUAR_RANDOM")

	-- Borean Leather -- 64661
	recipe = AddRecipe(64661, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(33568)
	recipe:SetSkillLevels(350, 350, 350, 362, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Ensorcelled Nerubian Breastplate -- 67080
	recipe = AddRecipe(67080, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47597)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("TOC25_RANDOM")

	-- Black Chitin Bracers -- 67081
	recipe = AddRecipe(67081, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47579)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom("TOC25_RANDOM")

	-- Crusader's Dragonscale Breastplate -- 67082
	recipe = AddRecipe(67082, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47595)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom("TOC25_RANDOM")

	-- Crusader's Dragonscale Bracers -- 67083
	recipe = AddRecipe(67083, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47576)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("TOC25_RANDOM")

	-- Lunar Eclipse Robes -- 67084
	recipe = AddRecipe(67084, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47602)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom("TOC25_RANDOM")

	-- Moonshadow Armguards -- 67085
	recipe = AddRecipe(67085, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47583)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom("TOC25_RANDOM")

	-- Knightbane Carapace -- 67086
	recipe = AddRecipe(67086, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47599)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom("TOC25_RANDOM")

	-- Bracers of Swift Death -- 67087
	recipe = AddRecipe(67087, V.WOTLK, Q.EPIC)
	recipe:SetCraftedItemID(47581)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom("TOC25_RANDOM")

	-- Ensorcelled Nerubian Breastplate -- 67136
	recipe = AddRecipe(67136, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47650)
	recipe:SetCraftedItemID(47598)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("TOC25_RANDOM")

	-- Black Chitin Bracers -- 67137
	recipe = AddRecipe(67137, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47646)
	recipe:SetCraftedItemID(47580)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom("TOC25_RANDOM")

	-- Crusader's Dragonscale Breastplate -- 67138
	recipe = AddRecipe(67138, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47649)
	recipe:SetCraftedItemID(47596)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("TOC25_RANDOM")

	-- Bracers of Swift Death -- 67139
	recipe = AddRecipe(67139, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47647)
	recipe:SetCraftedItemID(47582)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("TOC25_RANDOM")

	-- Lunar Eclipse Robes -- 67140
	recipe = AddRecipe(67140, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47652)
	recipe:SetCraftedItemID(47601)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("TOC25_RANDOM")

	-- Moonshadow Armguards -- 67141
	recipe = AddRecipe(67141, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47653)
	recipe:SetCraftedItemID(47584)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom("TOC25_RANDOM")

	-- Knightbane Carapace -- 67142
	recipe = AddRecipe(67142, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47651)
	recipe:SetCraftedItemID(47600)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom("TOC25_RANDOM")

	-- Crusader's Dragonscale Bracers -- 67143
	recipe = AddRecipe(67143, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(47648)
	recipe:SetCraftedItemID(47577)
	recipe:SetSkillLevels(450, 450, 460, 467, 475)
	recipe:SetRequiredFaction("Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom("TOC25_RANDOM")

	-- Drums of Forgotten Kings -- 69386
	recipe = AddRecipe(69386, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(49633)
	recipe:SetSkillLevels(450, 450, 450, 455, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Drums of the Wild -- 69388
	recipe = AddRecipe(69388, V.WOTLK, Q.COMMON)
	recipe:SetCraftedItemID(49634)
	recipe:SetSkillLevels(450, 450, 450, 455, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3365, 4212, 5564, 21087, 26911, 26961, 26996, 26998, 28700, 33581, 33612, 33635)

	-- Legwraps of Unleashed Nature -- 70554
	recipe = AddRecipe(70554, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49957)
	recipe:SetCraftedItemID(49898)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Blessed Cenarion Boots -- 70555
	recipe = AddRecipe(70555, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49958)
	recipe:SetCraftedItemID(49894)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Bladeborn Leggings -- 70556
	recipe = AddRecipe(70556, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49959)
	recipe:SetCraftedItemID(49899)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Footpads of Impending Death -- 70557
	recipe = AddRecipe(70557, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49961)
	recipe:SetCraftedItemID(49895)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Lightning-Infused Leggings -- 70558
	recipe = AddRecipe(70558, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49962)
	recipe:SetCraftedItemID(49900)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Earthsoul Boots -- 70559
	recipe = AddRecipe(70559, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49963)
	recipe:SetCraftedItemID(49896)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Draconic Bonesplinter Legguards -- 70560
	recipe = AddRecipe(70560, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49965)
	recipe:SetCraftedItemID(49901)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Rock-Steady Treads -- 70561
	recipe = AddRecipe(70561, V.WOTLK, Q.EPIC)
	recipe:SetRecipeItemID(49966)
	recipe:SetCraftedItemID(49897)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Savage Armor Kit -- 78379
	recipe = AddRecipe(78379, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56477)
	recipe:SetSkillLevels(425, 425, 450, 452, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Savage Cloak -- 78380
	recipe = AddRecipe(78380, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56480)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Bracers -- 78388
	recipe = AddRecipe(78388, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56481)
	recipe:SetSkillLevels(460, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Belt -- 78396
	recipe = AddRecipe(78396, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56482)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Bracers -- 78398
	recipe = AddRecipe(78398, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56483)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Gloves -- 78399
	recipe = AddRecipe(78399, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56484)
	recipe:SetSkillLevels(465, 465, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Hardened Scale Cloak -- 78405
	recipe = AddRecipe(78405, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56489)
	recipe:SetSkillLevels(470, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Gloves -- 78406
	recipe = AddRecipe(78406, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56490)
	recipe:SetSkillLevels(475, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Boots -- 78407
	recipe = AddRecipe(78407, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56491)
	recipe:SetSkillLevels(465, 465, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Boots -- 78410
	recipe = AddRecipe(78410, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56494)
	recipe:SetSkillLevels(450, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Shoulders -- 78411
	recipe = AddRecipe(78411, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56495)
	recipe:SetSkillLevels(475, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Shoulders -- 78415
	recipe = AddRecipe(78415, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56498)
	recipe:SetSkillLevels(455, 455, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Belt -- 78416
	recipe = AddRecipe(78416, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56499)
	recipe:SetSkillLevels(455, 455, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Scorched Leg Armor -- 78419
	recipe = AddRecipe(78419, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56502)
	recipe:SetSkillLevels(475, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Twilight Leg Armor -- 78420
	recipe = AddRecipe(78420, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56503)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Chestguard -- 78423
	recipe = AddRecipe(78423, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56504)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Helm -- 78424
	recipe = AddRecipe(78424, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56505)
	recipe:SetSkillLevels(490, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Leggings -- 78427
	recipe = AddRecipe(78427, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56508)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Chestguard -- 78428
	recipe = AddRecipe(78428, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56509)
	recipe:SetSkillLevels(480, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Tsunami Helm -- 78432
	recipe = AddRecipe(78432, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56512)
	recipe:SetSkillLevels(485, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Darkbrand Leggings -- 78433
	recipe = AddRecipe(78433, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56513)
	recipe:SetSkillLevels(485, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Heavy Savage Leather -- 78436
	recipe = AddRecipe(78436, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56516)
	recipe:SetSkillLevels(485, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Heavy Savage Armor Kit -- 78437
	recipe = AddRecipe(78437, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56517)
	recipe:SetSkillLevels(485, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Cloak of Beasts -- 78438
	recipe = AddRecipe(78438, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56518)
	recipe:SetSkillLevels(495, 495, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Cloak of War -- 78439
	recipe = AddRecipe(78439, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(56519)
	recipe:SetSkillLevels(495, 495, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Bloodied Wyrmhide Bracers -- 78444
	recipe = AddRecipe(78444, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Belt -- 78445
	recipe = AddRecipe(78445, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Bracers -- 78446
	recipe = AddRecipe(78446, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Gloves -- 78447
	recipe = AddRecipe(78447, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Bracers -- 78448
	recipe = AddRecipe(78448, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Gloves -- 78449
	recipe = AddRecipe(78449, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Bracers -- 78450
	recipe = AddRecipe(78450, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Shoulders -- 78451
	recipe = AddRecipe(78451, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(510, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Gloves -- 78452
	recipe = AddRecipe(78452, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Boots -- 78453
	recipe = AddRecipe(78453, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Boots -- 78454
	recipe = AddRecipe(78454, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Shoulders -- 78455
	recipe = AddRecipe(78455, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Boots -- 78456
	recipe = AddRecipe(78456, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Belt -- 78457
	recipe = AddRecipe(78457, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Boots -- 78458
	recipe = AddRecipe(78458, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Gloves -- 78459
	recipe = AddRecipe(78459, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(515, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Lightning Lash -- 78460
	recipe = AddRecipe(78460, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Belt of Nefarious Whispers -- 78461
	recipe = AddRecipe(78461, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Stormleather Sash -- 78462
	recipe = AddRecipe(78462, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Corded Viper Belt -- 78463
	recipe = AddRecipe(78463, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 525, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Shoulders -- 78464
	recipe = AddRecipe(78464, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Chest -- 78467
	recipe = AddRecipe(78467, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Belt -- 78468
	recipe = AddRecipe(78468, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Helm -- 78469
	recipe = AddRecipe(78469, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Shoulders -- 78470
	recipe = AddRecipe(78470, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Legs -- 78471
	recipe = AddRecipe(78471, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Belt -- 78473
	recipe = AddRecipe(78473, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Helm -- 78474
	recipe = AddRecipe(78474, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(520, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Razor-Edged Cloak -- 78475
	recipe = AddRecipe(78475, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Twilight Dragonscale Cloak -- 78476
	recipe = AddRecipe(78476, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Dragonscale Leg Armor -- 78477
	recipe = AddRecipe(78477, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Charscale Leg Armor -- 78478
	recipe = AddRecipe(78478, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Legs -- 78479
	recipe = AddRecipe(78479, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Helm -- 78480
	recipe = AddRecipe(78480, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Chest -- 78481
	recipe = AddRecipe(78481, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Legs -- 78482
	recipe = AddRecipe(78482, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Chest -- 78483
	recipe = AddRecipe(78483, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Helm -- 78484
	recipe = AddRecipe(78484, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Legs -- 78485
	recipe = AddRecipe(78485, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Chest -- 78486
	recipe = AddRecipe(78486, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Chestguard of Nature's Fury -- 78487
	recipe = AddRecipe(78487, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Assassin's Chestplate -- 78488
	recipe = AddRecipe(78488, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(525, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Twilight Scale Chestguard -- 78489
	recipe = AddRecipe(78489, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Dragonkiller Tunic -- 78490
	recipe = AddRecipe(78490, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(425, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Savage Leather -- 84950
	recipe = AddRecipe(84950, V.CATA, Q.COMMON)
	recipe:SetCraftedItemID(52976)
	recipe:SetSkillLevels(425, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Draconic Embossment - Stamina -- 85007
	recipe = AddRecipe(85007, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Draconic Embossment - Agility -- 85008
	recipe = AddRecipe(85008, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Draconic Embossment - Strength -- 85009
	recipe = AddRecipe(85009, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Draconic Embossment - Intellect -- 85010
	recipe = AddRecipe(85010, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(500, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Dragonbone Leg Reinforcements -- 85067
	recipe = AddRecipe(85067, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(465, 465, 465, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Charscale Leg Reinforcements -- 85068
	recipe = AddRecipe(85068, V.CATA, Q.COMMON)
	recipe:SetSkillLevels(465, 465, 465, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 21087, 26998, 28700, 29507, 33581, 33612, 33635)

	-- Cluthes of Evil
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69962)

	-- Dragonfire Gloves
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69960)

	-- Earthen Scale Sabatons
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69971)

	-- Ethereal Footfalls
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69974)

	-- Footwraps of Quenched Fire
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69972)

	-- Gloves of Unforgiving Flame
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69961)

	-- Heavenly Gloves of the Moon
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69963)

	-- Treads of the Craft
	--recipe = AddRecipe(, V.CATA, Q.EPIC)
	--recipe:SetRecipeItemID(69973)

	self.InitLeatherworking = nil
end

