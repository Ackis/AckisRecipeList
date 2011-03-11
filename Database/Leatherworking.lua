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
local MODNAME = "Ackis Recipe List"
local addon = LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L = LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local FOLDER_NAME, private = ...

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
-- Counter and wrapper function
--------------------------------------------------------------------------------------------------------------------
local function AddRecipe(spell_id, skill_level, item_id, quality, genesis, optimal_level, medium_level, easy_level, trivial_level, specialty, required_faction)
	return addon:AddRecipe(spell_id, skill_level, item_id, quality, 2108, specialty, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
end

function addon:InitLeatherworking()
	local recipe

	-- Handstitched Leather Boots -- 2149
	recipe = AddRecipe(2149, 1, 2302, Q.COMMON, V.ORIG, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom(8)

	-- Light Armor Kit -- 2152
	recipe = AddRecipe(2152, 1, 2304, Q.COMMON, V.ORIG, 1, 30, 45, 60)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddCustom(8)

	-- Handstitched Leather Pants -- 2153
	recipe = AddRecipe(2153, 15, 2303, Q.COMMON, V.ORIG, 15, 45, 60, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Fine Leather Boots -- 2158
	recipe = AddRecipe(2158, 90, 2307, Q.UNCOMMON, V.ORIG, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fine Leather Cloak -- 2159
	recipe = AddRecipe(2159, 85, 2308, Q.COMMON, V.ORIG, 85, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Embossed Leather Vest -- 2160
	recipe = AddRecipe(2160, 40, 2300, Q.COMMON, V.ORIG, 40, 70, 85, 100)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Embossed Leather Boots -- 2161
	recipe = AddRecipe(2161, 55, 2309, Q.COMMON, V.ORIG, 55, 85, 100, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Embossed Leather Cloak -- 2162
	recipe = AddRecipe(2162, 60, 2310, Q.COMMON, V.ORIG, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- White Leather Jerkin -- 2163
	recipe = AddRecipe(2163, 60, 2311, Q.UNCOMMON, V.ORIG, 60, 90, 105, 120)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fine Leather Gloves -- 2164
	recipe = AddRecipe(2164, 75, 2312, Q.UNCOMMON, V.ORIG, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Medium Armor Kit -- 2165
	recipe = AddRecipe(2165, 100, 2313, Q.COMMON, V.ORIG, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Toughened Leather Armor -- 2166
	recipe = AddRecipe(2166, 120, 2314, Q.COMMON, V.ORIG, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Dark Leather Boots -- 2167
	recipe = AddRecipe(2167, 100, 2315, Q.COMMON, V.ORIG, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Dark Leather Cloak -- 2168
	recipe = AddRecipe(2168, 110, 2316, Q.COMMON, V.ORIG, 110, 135, 147, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Dark Leather Tunic -- 2169
	recipe = AddRecipe(2169, 100, 2317, Q.UNCOMMON, V.ORIG, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Light Leather -- 2881
	recipe = AddRecipe(2881, 1, 2318, Q.COMMON, V.ORIG, 1, 20, 30, 40)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom(8)

	-- Handstitched Leather Belt -- 3753
	recipe = AddRecipe(3753, 25, 4237, Q.COMMON, V.ORIG, 25, 55, 70, 85)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Embossed Leather Gloves -- 3756
	recipe = AddRecipe(3756, 55, 4239, Q.COMMON, V.ORIG, 55, 85, 100, 115)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Embossed Leather Pants -- 3759
	recipe = AddRecipe(3759, 75, 4242, Q.COMMON, V.ORIG, 75, 105, 120, 135)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Hillman's Cloak -- 3760
	recipe = AddRecipe(3760, 150, 3719, Q.COMMON, V.ORIG, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Fine Leather Tunic -- 3761
	recipe = AddRecipe(3761, 85, 4243, Q.COMMON, V.ORIG, 85, 115, 130, 145)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Hillman's Leather Vest -- 3762
	recipe = AddRecipe(3762, 100, 4244, Q.UNCOMMON, V.ORIG, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Fine Leather Belt -- 3763
	recipe = AddRecipe(3763, 80, 4246, Q.COMMON, V.ORIG, 80, 110, 125, 140)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Hillman's Leather Gloves -- 3764
	recipe = AddRecipe(3764, 145, 4247, Q.COMMON, V.ORIG, 145, 170, 182, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Dark Leather Gloves -- 3765
	recipe = AddRecipe(3765, 120, 4248, Q.UNCOMMON, V.ORIG, 120, 155, 167, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dark Leather Belt -- 3766
	recipe = AddRecipe(3766, 125, 4249, Q.COMMON, V.ORIG, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Hillman's Belt -- 3767
	recipe = AddRecipe(3767, 120, 4250, Q.UNCOMMON, V.ORIG, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Hillman's Shoulders -- 3768
	recipe = AddRecipe(3768, 130, 4251, Q.COMMON, V.ORIG, 130, 155, 167, 180)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635)

	-- Dark Leather Shoulders -- 3769
	recipe = AddRecipe(3769, 140, 4252, Q.UNCOMMON, V.ORIG, 140, 165, 177, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Toughened Leather Gloves -- 3770
	recipe = AddRecipe(3770, 135, 4253, Q.COMMON, V.ORIG, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Barbaric Gloves -- 3771
	recipe = AddRecipe(3771, 150, 4254, Q.UNCOMMON, V.ORIG, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Leather Armor -- 3772
	recipe = AddRecipe(3772, 155, 4255, Q.COMMON, V.ORIG, 155, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddVendor(2679, 2698)

	-- Guardian Armor -- 3773
	recipe = AddRecipe(3773, 175, 4256, Q.UNCOMMON, V.ORIG, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Leather Belt -- 3774
	recipe = AddRecipe(3774, 160, 4257, Q.COMMON, V.ORIG, 160, 180, 190, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Guardian Belt -- 3775
	recipe = AddRecipe(3775, 170, 4258, Q.RARE, V.ORIG, 170, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Green Leather Bracers -- 3776
	recipe = AddRecipe(3776, 180, 4259, Q.COMMON, V.ORIG, 180, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Guardian Leather Bracers -- 3777
	recipe = AddRecipe(3777, 195, 4260, Q.UNCOMMON, V.ORIG, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Gem-studded Leather Belt -- 3778
	recipe = AddRecipe(3778, 185, 4262, Q.COMMON, V.ORIG, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddLimitedVendor(2699, 1)

	-- Barbaric Belt -- 3779
	recipe = AddRecipe(3779, 200, 4264, Q.RARE, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Armor Kit -- 3780
	recipe = AddRecipe(3780, 150, 4265, Q.COMMON, V.ORIG, 150, 170, 180, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Cured Light Hide -- 3816
	recipe = AddRecipe(3816, 35, 4231, Q.COMMON, V.ORIG, 35, 55, 65, 75)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Cured Medium Hide -- 3817
	recipe = AddRecipe(3817, 100, 4233, Q.COMMON, V.ORIG, 100, 115, 122, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Cured Heavy Hide -- 3818
	recipe = AddRecipe(3818, 150, 4236, Q.COMMON, V.ORIG, 150, 160, 165, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Raptor Hide Harness -- 4096
	recipe = AddRecipe(4096, 165, 4455, Q.UNCOMMON, V.WOTLK, 165, 185, 195, 205)
	recipe:AddFilters(F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddLimitedVendor(2819, 1)

	-- Raptor Hide Belt -- 4097
	recipe = AddRecipe(4097, 165, 4456, Q.UNCOMMON, V.ORIG, 165, 185, 195, 205)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(2816)

	-- Kodo Hide Bag -- 5244
	recipe = AddRecipe(5244, 40, 5081, Q.UNCOMMON, V.ORIG, 40, 70, 85, 100)
	recipe:AddFilters(F.HORDE, F.QUEST, F.IBOE, F.RBOE)
	recipe:AddQuest(769)

	-- Barbaric Harness -- 6661
	recipe = AddRecipe(6661, 190, 5739, Q.COMMON, V.ORIG, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Murloc Scale Belt -- 6702
	recipe = AddRecipe(6702, 90, 5780, Q.COMMON, V.ORIG, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(1732, 3385)
	recipe:AddVendor(843, 3556, 4186)

	-- Murloc Scale Breastplate -- 6703
	recipe = AddRecipe(6703, 95, 5781, Q.COMMON, V.ORIG, 95, 125, 140, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(657, 3386)
	recipe:AddVendor(843, 3556, 4186)

	-- Thick Murloc Armor -- 6704
	recipe = AddRecipe(6704, 170, 5782, Q.UNCOMMON, V.ORIG, 170, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(938, 1160)
	recipe:AddLimitedVendor(2393, 1, 2846, 1)

	-- Murloc Scale Bracers -- 6705
	recipe = AddRecipe(6705, 190, 5783, Q.UNCOMMON, V.ORIG, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(1561, 2636)
	recipe:AddLimitedVendor(4897, 1)

	-- Handstitched Leather Vest -- 7126
	recipe = AddRecipe(7126, 1, 5957, Q.COMMON, V.ORIG, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom(8)

	-- Fine Leather Pants -- 7133
	recipe = AddRecipe(7133, 105, 5958, Q.UNCOMMON, V.ORIG, 105, 130, 142, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dark Leather Pants -- 7135
	recipe = AddRecipe(7135, 115, 5961, Q.COMMON, V.ORIG, 115, 140, 152, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Guardian Pants -- 7147
	recipe = AddRecipe(7147, 160, 5962, Q.COMMON, V.ORIG, 160, 180, 190, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Barbaric Leggings -- 7149
	recipe = AddRecipe(7149, 170, 5963, Q.COMMON, V.ORIG, 170, 190, 200, 210)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(2810, 2821, 3958, 4877)

	-- Barbaric Shoulders -- 7151
	recipe = AddRecipe(7151, 175, 5964, Q.COMMON, V.ORIG, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Guardian Cloak -- 7153
	recipe = AddRecipe(7153, 185, 5965, Q.UNCOMMON, V.ORIG, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Guardian Gloves -- 7156
	recipe = AddRecipe(7156, 190, 5966, Q.COMMON, V.ORIG, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Deviate Scale Cloak -- 7953
	recipe = AddRecipe(7953, 90, 6466, Q.COMMON, V.ORIG, 90, 120, 135, 150)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR)
	recipe:AddCustom(48)

	-- Deviate Scale Gloves -- 7954
	recipe = AddRecipe(7954, 105, 6467, Q.COMMON, V.ORIG, 105, 130, 142, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR)
	recipe:AddCustom(48)

	-- Deviate Scale Belt -- 7955
	recipe = AddRecipe(7955, 115, 6468, Q.UNCOMMON, V.ORIG, 115, 140, 152, 165)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Moonglow Vest -- 8322
	recipe = AddRecipe(8322, 90, 6709, Q.UNCOMMON, V.ORIG, 90, 115, 130, 145)
	recipe:AddFilters(F.ALLIANCE, F.QUEST, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddQuest(1582)

	-- Handstitched Leather Cloak -- 9058
	recipe = AddRecipe(9058, 1, 7276, Q.COMMON, V.ORIG, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddCustom(8)

	-- Handstitched Leather Bracers -- 9059
	recipe = AddRecipe(9059, 1, 7277, Q.COMMON, V.ORIG, 1, 40, 55, 70)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddCustom(8)

	-- Rugged Leather Pants -- 9064
	recipe = AddRecipe(9064, 35, 7280, Q.UNCOMMON, V.ORIG, 35, 65, 80, 95)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Light Leather Bracers -- 9065
	recipe = AddRecipe(9065, 70, 7281, Q.COMMON, V.ORIG, 70, 100, 115, 130)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3069, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Light Leather Pants -- 9068
	recipe = AddRecipe(9068, 95, 7282, Q.COMMON, V.ORIG, 95, 125, 140, 155)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Black Whelp Cloak -- 9070
	recipe = AddRecipe(9070, 100, 7283, Q.COMMON, V.ORIG, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddVendor(2697)

	-- Red Whelp Gloves -- 9072
	recipe = AddRecipe(9072, 120, 7284, Q.COMMON, V.ORIG, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(2679)

	-- Nimble Leather Gloves -- 9074
	recipe = AddRecipe(9074, 120, 7285, Q.COMMON, V.ORIG, 120, 145, 157, 170)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Fletcher's Gloves -- 9145
	recipe = AddRecipe(9145, 125, 7348, Q.COMMON, V.ORIG, 125, 150, 162, 175)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Herbalist's Gloves -- 9146
	recipe = AddRecipe(9146, 135, 7349, Q.UNCOMMON, V.ORIG, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(6731)

	-- Earthen Leather Shoulders -- 9147
	recipe = AddRecipe(9147, 135, 7352, Q.COMMON, V.ORIG, 135, 160, 172, 185)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(3537)

	-- Pilferer's Gloves -- 9148
	recipe = AddRecipe(9148, 140, 7358, Q.UNCOMMON, V.ORIG, 140, 165, 177, 190)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Earthen Gloves -- 9149
	recipe = AddRecipe(9149, 145, 7359, Q.UNCOMMON, V.ORIG, 145, 170, 182, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dusky Leather Leggings -- 9195
	recipe = AddRecipe(9195, 165, 7373, Q.UNCOMMON, V.ORIG, 165, 185, 195, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Dusky Leather Armor -- 9196
	recipe = AddRecipe(9196, 175, 7374, Q.COMMON, V.ORIG, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Green Whelp Armor -- 9197
	recipe = AddRecipe(9197, 175, 7375, Q.UNCOMMON, V.ORIG, 175, 195, 205, 215)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Frost Leather Cloak -- 9198
	recipe = AddRecipe(9198, 180, 7377, Q.COMMON, V.ORIG, 180, 200, 210, 220)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Dusky Bracers -- 9201
	recipe = AddRecipe(9201, 185, 7378, Q.COMMON, V.ORIG, 185, 205, 215, 225)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Green Whelp Bracers -- 9202
	recipe = AddRecipe(9202, 190, 7386, Q.UNCOMMON, V.ORIG, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(4225, 4589, 7852, 7854)

	-- Dusky Belt -- 9206
	recipe = AddRecipe(9206, 195, 7387, Q.COMMON, V.ORIG, 195, 215, 225, 235)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Dusky Boots -- 9207
	recipe = AddRecipe(9207, 200, 7390, Q.RARE, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Swift Boots -- 9208
	recipe = AddRecipe(9208, 200, 7391, Q.UNCOMMON, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Cured Thick Hide -- 10482
	recipe = AddRecipe(10482, 200, 8172, Q.COMMON, V.ORIG, 200, 200, 200, 200)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Thick Armor Kit -- 10487
	recipe = AddRecipe(10487, 200, 8173, Q.COMMON, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Comfortable Leather Hat -- 10490
	recipe = AddRecipe(10490, 200, 8174, Q.RARE, V.ORIG, 200, 220, 230, 240)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Nightscape Tunic -- 10499
	recipe = AddRecipe(10499, 205, 8175, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Nightscape Headband -- 10507
	recipe = AddRecipe(10507, 205, 8176, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Turtle Scale Gloves -- 10509
	recipe = AddRecipe(10509, 205, 8187, Q.COMMON, V.ORIG, 205, 225, 235, 245)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(7852, 7854)

	-- Turtle Scale Breastplate -- 10511
	recipe = AddRecipe(10511, 210, 8189, Q.COMMON, V.ORIG, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Nightscape Shoulders -- 10516
	recipe = AddRecipe(10516, 210, 8192, Q.UNCOMMON, V.ORIG, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(7854, 8160)

	-- Turtle Scale Bracers -- 10518
	recipe = AddRecipe(10518, 210, 8198, Q.COMMON, V.ORIG, 210, 230, 240, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Big Voodoo Robe -- 10520
	recipe = AddRecipe(10520, 215, 8200, Q.UNCOMMON, V.ORIG, 215, 235, 245, 255)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tough Scorpid Breastplate -- 10525
	recipe = AddRecipe(10525, 220, 8203, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5618)

	-- Wild Leather Shoulders -- 10529
	recipe = AddRecipe(10529, 220, 8210, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddQuest(2848, 2855)

	-- Big Voodoo Mask -- 10531
	recipe = AddRecipe(10531, 220, 8201, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tough Scorpid Bracers -- 10533
	recipe = AddRecipe(10533, 220, 8205, Q.UNCOMMON, V.ORIG, 220, 240, 250, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5617)

	-- Tough Scorpid Gloves -- 10542
	recipe = AddRecipe(10542, 225, 8204, Q.UNCOMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5616)

	-- Wild Leather Vest -- 10544
	recipe = AddRecipe(10544, 225, 8211, Q.UNCOMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddQuest(2849, 2856)

	-- Wild Leather Helmet -- 10546
	recipe = AddRecipe(10546, 225, 8214, Q.UNCOMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddQuest(2850, 2857)

	-- Nightscape Pants -- 10548
	recipe = AddRecipe(10548, 230, 8193, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Turtle Scale Helm -- 10552
	recipe = AddRecipe(10552, 230, 8191, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Tough Scorpid Boots -- 10554
	recipe = AddRecipe(10554, 235, 8209, Q.UNCOMMON, V.ORIG, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5615)

	-- Turtle Scale Leggings -- 10556
	recipe = AddRecipe(10556, 235, 8185, Q.COMMON, V.ORIG, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Nightscape Boots -- 10558
	recipe = AddRecipe(10558, 235, 8197, Q.COMMON, V.ORIG, 235, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Big Voodoo Pants -- 10560
	recipe = AddRecipe(10560, 240, 8202, Q.UNCOMMON, V.ORIG, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Big Voodoo Cloak -- 10562
	recipe = AddRecipe(10562, 240, 8216, Q.UNCOMMON, V.ORIG, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Tough Scorpid Shoulders -- 10564
	recipe = AddRecipe(10564, 240, 8207, Q.UNCOMMON, V.ORIG, 240, 260, 270, 280)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Wild Leather Boots -- 10566
	recipe = AddRecipe(10566, 245, 8213, Q.UNCOMMON, V.ORIG, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddQuest(2851, 2858)

	-- Tough Scorpid Leggings -- 10568
	recipe = AddRecipe(10568, 245, 8206, Q.UNCOMMON, V.ORIG, 245, 265, 275, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(5615)

	-- Tough Scorpid Helm -- 10570
	recipe = AddRecipe(10570, 250, 8208, Q.UNCOMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Wild Leather Leggings -- 10572
	recipe = AddRecipe(10572, 250, 8212, Q.UNCOMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddQuest(2852, 2859)

	-- Wild Leather Cloak -- 10574
	recipe = AddRecipe(10574, 250, 8215, Q.UNCOMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.QUEST, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddQuest(2853, 2860)

	-- Dragonscale Gauntlets -- 10619
	recipe = AddRecipe(10619, 225, 8347, Q.COMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(7866, 7867, 29508)

	-- Wolfshead Helm -- 10621
	recipe = AddRecipe(10621, 225, 8345, Q.COMMON, V.ORIG, 225, 245, 255, 265)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.DRUID, F.LEATHER)
	recipe:AddTrainer(7870, 7871, 29509)

	-- Gauntlets of the Sea -- 10630
	recipe = AddRecipe(10630, 230, 8346, Q.COMMON, V.ORIG, 230, 250, 260, 270)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(7868, 7869, 28700, 29507)

	-- Helm of Fire -- 10632
	recipe = AddRecipe(10632, 250, 8348, Q.COMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(7868, 7869, 28700, 29507)

	-- Feathered Breastplate -- 10647
	recipe = AddRecipe(10647, 250, 8349, Q.COMMON, V.ORIG, 250, 270, 280, 290)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(7870, 7871, 28700, 29509)

	-- Dragonscale Breastplate -- 10650
	recipe = AddRecipe(10650, 255, 8367, Q.COMMON, V.ORIG, 255, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddTrainer(7866, 7867, 28700, 29508)

	-- Cured Rugged Hide -- 19047
	recipe = AddRecipe(19047, 250, 15407, Q.COMMON, V.ORIG, 250, 250, 255, 260)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Heavy Scorpid Bracers -- 19048
	recipe = AddRecipe(19048, 255, 15077, Q.COMMON, V.ORIG, 255, 275, 285, 295)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(12956)

	-- Wicked Leather Gauntlets -- 19049
	recipe = AddRecipe(19049, 260, 15083, Q.COMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(12942, 12943)

	-- Green Dragonscale Breastplate -- 19050
	recipe = AddRecipe(19050, 260, 15045, Q.COMMON, V.ORIG, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(11874)

	-- Heavy Scorpid Vest -- 19051
	recipe = AddRecipe(19051, 265, 15076, Q.UNCOMMON, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(6005)

	-- Wicked Leather Bracers -- 19052
	recipe = AddRecipe(19052, 265, 15084, Q.COMMON, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Chimeric Gloves -- 19053
	recipe = AddRecipe(19053, 265, 15074, Q.COMMON, V.ORIG, 265, 285, 295, 305)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddCustom(48)

	-- Red Dragonscale Breastplate -- 19054
	recipe = AddRecipe(19054, 300, 15047, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(10363)

	-- Runic Leather Gauntlets -- 19055
	recipe = AddRecipe(19055, 270, 15091, Q.COMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Rugged Armor Kit -- 19058
	recipe = AddRecipe(19058, 250, 15564, Q.COMMON, V.ORIG, 250, 255, 265, 275)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Volcanic Leggings -- 19059
	recipe = AddRecipe(19059, 270, 15054, Q.UNCOMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7035)

	-- Green Dragonscale Leggings -- 19060
	recipe = AddRecipe(19060, 270, 15046, Q.RARE, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(5226)

	-- Living Shoulders -- 19061
	recipe = AddRecipe(19061, 270, 15061, Q.COMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(7852, 7854)

	-- Ironfeather Shoulders -- 19062
	recipe = AddRecipe(19062, 270, 15067, Q.COMMON, V.ORIG, 270, 290, 300, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(12958)

	-- Chimeric Boots -- 19063
	recipe = AddRecipe(19063, 275, 15073, Q.UNCOMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Heavy Scorpid Gauntlets -- 19064
	recipe = AddRecipe(19064, 275, 15078, Q.UNCOMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(7025)

	-- Runic Leather Bracers -- 19065
	recipe = AddRecipe(19065, 275, 15092, Q.COMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Frostsaber Boots -- 19066
	recipe = AddRecipe(19066, 275, 15071, Q.COMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddVendor(11189)

	-- Stormshroud Pants -- 19067
	recipe = AddRecipe(19067, 275, 15057, Q.COMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddVendor(12942, 12943)

	-- Warbear Harness -- 19068
	recipe = AddRecipe(19068, 275, 15064, Q.COMMON, V.ORIG, 275, 295, 305, 315)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.WORLD_DROP, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Heavy Scorpid Belt -- 19070
	recipe = AddRecipe(19070, 280, 15082, Q.UNCOMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Wicked Leather Headband -- 19071
	recipe = AddRecipe(19071, 280, 15086, Q.COMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Runic Leather Belt -- 19072
	recipe = AddRecipe(19072, 280, 15093, Q.COMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Chimeric Leggings -- 19073
	recipe = AddRecipe(19073, 280, 15072, Q.UNCOMMON, V.ORIG, 280, 300, 310, 320)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Frostsaber Leggings -- 19074
	recipe = AddRecipe(19074, 285, 15069, Q.UNCOMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7440)

	-- Heavy Scorpid Leggings -- 19075
	recipe = AddRecipe(19075, 285, 15079, Q.UNCOMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(7027)

	-- Volcanic Breastplate -- 19076
	recipe = AddRecipe(19076, 285, 15053, Q.UNCOMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(9259)

	-- Blue Dragonscale Breastplate -- 19077
	recipe = AddRecipe(19077, 285, 15048, Q.COMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Living Leggings -- 19078
	recipe = AddRecipe(19078, 285, 15060, Q.RARE, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(7158)

	-- Stormshroud Armor -- 19079
	recipe = AddRecipe(19079, 285, 15056, Q.RARE, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddCustom(48)

	-- Warbear Woolies -- 19080
	recipe = AddRecipe(19080, 285, 15065, Q.COMMON, V.ORIG, 285, 305, 315, 325)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.FRIENDLY, 11557)

	-- Chimeric Vest -- 19081
	recipe = AddRecipe(19081, 290, 15075, Q.UNCOMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddWorldDrop("Eastern Kingdoms", "Kalimdor")

	-- Runic Leather Headband -- 19082
	recipe = AddRecipe(19082, 290, 15094, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Wicked Leather Pants -- 19083
	recipe = AddRecipe(19083, 290, 15087, Q.COMMON, V.ORIG, 290, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Devilsaur Gauntlets -- 19084
	recipe = AddRecipe(19084, 290, 15063, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(12959)

	-- Black Dragonscale Breastplate -- 19085
	recipe = AddRecipe(19085, 290, 15050, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(9499)

	-- Ironfeather Breastplate -- 19086
	recipe = AddRecipe(19086, 290, 15066, Q.RARE, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(2644)

	-- Frostsaber Gloves -- 19087
	recipe = AddRecipe(19087, 295, 15070, Q.UNCOMMON, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7441)

	-- Heavy Scorpid Helm -- 19088
	recipe = AddRecipe(19088, 295, 15080, Q.COMMON, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddVendor(12956)

	-- Blue Dragonscale Shoulders -- 19089
	recipe = AddRecipe(19089, 295, 15049, Q.RARE, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Stormshroud Shoulders -- 19090
	recipe = AddRecipe(19090, 295, 15058, Q.RARE, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.RETIRED, F.IBOE, F.RBOE, F.DPS, F.TANK, F.LEATHER)
	recipe:AddCustom(48)

	-- Runic Leather Pants -- 19091
	recipe = AddRecipe(19091, 300, 15095, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Wicked Leather Belt -- 19092
	recipe = AddRecipe(19092, 300, 15088, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Onyxia Scale Cloak -- 19093
	recipe = AddRecipe(19093, 300, 15138, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.QUEST, F.IBOE, F.RBOP, F.CLOAK)
	recipe:AddQuest(7493, 7497)
	recipe:AddCustom(10)

	-- Black Dragonscale Shoulders -- 19094
	recipe = AddRecipe(19094, 300, 15051, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(8898)

	-- Living Breastplate -- 19095
	recipe = AddRecipe(19095, 300, 15059, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(1813)

	-- Devilsaur Leggings -- 19097
	recipe = AddRecipe(19097, 300, 15062, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(6556, 6557, 6559, 9477)

	-- Wicked Leather Armor -- 19098
	recipe = AddRecipe(19098, 300, 15085, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Heavy Scorpid Shoulders -- 19100
	recipe = AddRecipe(19100, 300, 15081, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(7029)

	-- Volcanic Shoulders -- 19101
	recipe = AddRecipe(19101, 300, 15055, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(9260)

	-- Runic Leather Armor -- 19102
	recipe = AddRecipe(19102, 300, 15090, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Runic Leather Shoulders -- 19103
	recipe = AddRecipe(19103, 300, 15096, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Frostsaber Tunic -- 19104
	recipe = AddRecipe(19104, 300, 15068, Q.UNCOMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddMobDrop(7438)

	-- Black Dragonscale Leggings -- 19107
	recipe = AddRecipe(19107, 300, 15052, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddMobDrop(8903)

	-- Medium Leather -- 20648
	recipe = AddRecipe(20648, 100, 2319, Q.COMMON, V.ORIG, 100, 100, 105, 110)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Heavy Leather -- 20649
	recipe = AddRecipe(20649, 150, 4234, Q.COMMON, V.ORIG, 150, 150, 155, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Thick Leather -- 20650
	recipe = AddRecipe(20650, 200, 4304, Q.COMMON, V.ORIG, 200, 200, 202, 205)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Corehound Boots -- 20853
	recipe = AddRecipe(20853, 295, 16982, Q.COMMON, V.ORIG, 295, 315, 325, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(12944)

	-- Molten Helm -- 20854
	recipe = AddRecipe(20854, 300, 16983, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.LEATHER)
	recipe:AddVendor(12944)

	-- Black Dragonscale Boots -- 20855
	recipe = AddRecipe(20855, 300, 16984, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Gloves of the Greatfather -- 21943
	recipe = AddRecipe(21943, 190, 17721, Q.UNCOMMON, V.ORIG, 190, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.SEASONAL, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddSeason(1)

	-- Rugged Leather -- 22331
	recipe = AddRecipe(22331, 250, 8170, Q.COMMON, V.ORIG, 250, 250, 250, 250)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(1385, 1632, 3007, 3365, 3549, 3605, 3967, 4212, 4588, 5127, 5564, 5784, 8153, 11097, 11098, 16278, 16688, 16728, 17442, 18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Shadowskin Gloves -- 22711
	recipe = AddRecipe(22711, 200, 18238, Q.COMMON, V.ORIG, 200, 210, 220, 230)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddLimitedVendor(2699, 1)

	-- Core Armor Kit -- 22727
	recipe = AddRecipe(22727, 300, 18251, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.TANK)
	recipe:AddCustom(26)

	-- Gordok Ogre Suit -- 22815
	recipe = AddRecipe(22815, 275, 18258, Q.COMMON, V.ORIG, 275, 285, 290, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.QUEST, F.IBOE, F.RBOP)
	recipe:AddQuest(5518)

	-- Girdle of Insight -- 22921
	recipe = AddRecipe(22921, 300, 18504, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(23)

	-- Mongoose Boots -- 22922
	recipe = AddRecipe(22922, 300, 18506, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(23)

	-- Swift Flight Bracers -- 22923
	recipe = AddRecipe(22923, 300, 18508, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(23)

	-- Chromatic Cloak -- 22926
	recipe = AddRecipe(22926, 300, 18509, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.CLOAK)
	recipe:AddCustom(23)

	-- Hide of the Wild -- 22927
	recipe = AddRecipe(22927, 300, 18510, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.CLOAK)
	recipe:AddCustom(23)

	-- Shifting Cloak -- 22928
	recipe = AddRecipe(22928, 300, 18511, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.IBOE, F.RBOE, F.TANK, F.CLOAK)
	recipe:AddCustom(23)

	-- Heavy Leather Ball -- 23190
	recipe = AddRecipe(23190, 150, 18662, Q.COMMON, V.ORIG, 150, 150, 155, 160)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(3366, 5128)

	-- Barbaric Bracers -- 23399
	recipe = AddRecipe(23399, 155, 18948, Q.COMMON, V.ORIG, 155, 175, 185, 195)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(4225, 4589)

	-- Might of the Timbermaw -- 23703
	recipe = AddRecipe(23703, 290, 19044, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.HONORED, 11557)

	-- Timbermaw Brawlers -- 23704
	recipe = AddRecipe(23704, 300, 19049, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TIMBERMAW_HOLD, F.LEATHER)
	recipe:AddRepVendor(FAC.TIMBERMAW_HOLD, REP.REVERED, 11557)

	-- Dawn Treaders -- 23705
	recipe = AddRecipe(23705, 290, 19052, Q.COMMON, V.ORIG, 290, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ARGENTDAWN, F.LEATHER)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.HONORED, 10856, 10857, 11536)

	-- Golden Mantle of the Dawn -- 23706
	recipe = AddRecipe(23706, 300, 19058, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ARGENTDAWN, F.LEATHER)
	recipe:AddRepVendor(FAC.ARGENTDAWN, REP.REVERED, 10856, 10857, 11536)

	-- Lava Belt -- 23707
	recipe = AddRecipe(23707, 300, 19149, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.THORIUM_BROTHERHOOD, F.LEATHER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.HONORED, 12944)

	-- Chromatic Gauntlets -- 23708
	recipe = AddRecipe(23708, 300, 19157, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.MAIL)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Corehound Belt -- 23709
	recipe = AddRecipe(23709, 300, 19162, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.THORIUM_BROTHERHOOD, F.LEATHER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Molten Belt -- 23710
	recipe = AddRecipe(23710, 300, 19163, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.THORIUM_BROTHERHOOD, F.LEATHER)
	recipe:AddRepVendor(FAC.THORIUM_BROTHERHOOD, REP.REVERED, 12944)

	-- Primal Batskin Jerkin -- 24121
	recipe = AddRecipe(24121, 300, 19685, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Primal Batskin Gloves -- 24122
	recipe = AddRecipe(24122, 300, 19686, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Primal Batskin Bracers -- 24123
	recipe = AddRecipe(24123, 300, 19687, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Blood Tiger Breastplate -- 24124
	recipe = AddRecipe(24124, 300, 19688, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(48)

	-- Blood Tiger Shoulders -- 24125
	recipe = AddRecipe(24125, 300, 19689, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(48)

	-- Blue Dragonscale Leggings -- 24654
	recipe = AddRecipe(24654, 300, 20295, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(7866, 7867, 28700, 29508)

	-- Green Dragonscale Gauntlets -- 24655
	recipe = AddRecipe(24655, 280, 20296, Q.COMMON, V.ORIG, 280, 290, 295, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(7866, 7867, 28700, 29508)

	-- Dreamscale Breastplate -- 24703
	recipe = AddRecipe(24703, 300, 20380, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.EXALTED, 15293)

	-- Spitfire Bracers -- 24846
	recipe = AddRecipe(24846, 300, 20481, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15293)

	-- Spitfire Gauntlets -- 24847
	recipe = AddRecipe(24847, 300, 20480, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15293)

	-- Spitfire Breastplate -- 24848
	recipe = AddRecipe(24848, 300, 20479, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15293)

	-- Sandstalker Bracers -- 24849
	recipe = AddRecipe(24849, 300, 20476, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15293)

	-- Sandstalker Gauntlets -- 24850
	recipe = AddRecipe(24850, 300, 20477, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15293)

	-- Sandstalker Breastplate -- 24851
	recipe = AddRecipe(24851, 300, 20478, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.MAIL)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15293)

	-- Black Whelp Tunic -- 24940
	recipe = AddRecipe(24940, 100, 20575, Q.COMMON, V.ORIG, 100, 125, 137, 150)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddVendor(777)

	-- Stormshroud Gloves -- 26279
	recipe = AddRecipe(26279, 300, 21278, Q.RARE, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddMobDrop(14454, 14457)

	-- Polar Tunic -- 28219
	recipe = AddRecipe(28219, 300, 22661, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(41)

	-- Polar Gloves -- 28220
	recipe = AddRecipe(28220, 300, 22662, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(41)

	-- Polar Bracers -- 28221
	recipe = AddRecipe(28221, 300, 22663, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(41)

	-- Icy Scale Breastplate -- 28222
	recipe = AddRecipe(28222, 300, 22664, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(41)

	-- Icy Scale Gauntlets -- 28223
	recipe = AddRecipe(28223, 300, 22666, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(41)

	-- Icy Scale Bracers -- 28224
	recipe = AddRecipe(28224, 300, 22665, Q.EPIC, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RAID, F.RETIRED, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(41)

	-- Bramblewood Helm -- 28472
	recipe = AddRecipe(28472, 300, 22759, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.REVERED, 15293)

	-- Bramblewood Boots -- 28473
	recipe = AddRecipe(28473, 300, 22760, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.HONORED, 15293)

	-- Bramblewood Belt -- 28474
	recipe = AddRecipe(28474, 300, 22761, Q.COMMON, V.ORIG, 300, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.CENARION_CIRCLE, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_CIRCLE, REP.FRIENDLY, 15293)

	-- Knothide Leather -- 32454
	recipe = AddRecipe(32454, 300, 21887, Q.COMMON, V.TBC, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Heavy Knothide Leather -- 32455
	recipe = AddRecipe(32455, 325, 23793, Q.COMMON, V.TBC, 325, 325, 330, 335)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOE, F.LEATHER)
	recipe:AddTrainer(28700)

	-- Knothide Armor Kit -- 32456
	recipe = AddRecipe(32456, 300, 25650, Q.COMMON, V.TBC, 300, 310, 325, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Vindicator's Armor Kit -- 32457
	recipe = AddRecipe(32457, 325, 25651, Q.COMMON, V.TBC, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.ALDOR)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Magister's Armor Kit -- 32458
	recipe = AddRecipe(32458, 325, 25652, Q.COMMON, V.TBC, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.SCRYER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Riding Crop -- 32461
	recipe = AddRecipe(32461, 350, 25653, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE, F.TRINKET)
	recipe:AddVendor(18672)

	-- Felscale Gloves -- 32462
	recipe = AddRecipe(32462, 300, 25654, Q.COMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Felscale Boots -- 32463
	recipe = AddRecipe(32463, 310, 25655, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Felscale Pants -- 32464
	recipe = AddRecipe(32464, 320, 25656, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Felscale Breastplate -- 32465
	recipe = AddRecipe(32465, 335, 25657, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Scaled Draenic Pants -- 32466
	recipe = AddRecipe(32466, 300, 25662, Q.COMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Scaled Draenic Gloves -- 32467
	recipe = AddRecipe(32467, 310, 25661, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Scaled Draenic Vest -- 32468
	recipe = AddRecipe(32468, 325, 25660, Q.COMMON, V.TBC, 325, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Scaled Draenic Boots -- 32469
	recipe = AddRecipe(32469, 335, 25659, Q.COMMON, V.TBC, 335, 345, 355, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Thick Draenic Gloves -- 32470
	recipe = AddRecipe(32470, 300, 25669, Q.COMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Thick Draenic Pants -- 32471
	recipe = AddRecipe(32471, 315, 25670, Q.COMMON, V.TBC, 315, 325, 335, 345)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Thick Draenic Boots -- 32472
	recipe = AddRecipe(32472, 320, 25668, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Thick Draenic Vest -- 32473
	recipe = AddRecipe(32473, 330, 25671, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Wild Draenish Boots -- 32478
	recipe = AddRecipe(32478, 300, 25673, Q.COMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Wild Draenish Gloves -- 32479
	recipe = AddRecipe(32479, 310, 25674, Q.COMMON, V.TBC, 310, 320, 330, 340)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Wild Draenish Leggings -- 32480
	recipe = AddRecipe(32480, 320, 25675, Q.COMMON, V.TBC, 320, 330, 340, 350)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Wild Draenish Vest -- 32481
	recipe = AddRecipe(32481, 330, 25676, Q.COMMON, V.TBC, 330, 340, 350, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Comfortable Insoles -- 32482
	recipe = AddRecipe(32482, 300, 25679, Q.COMMON, V.TBC, 300, 300, 305, 310)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOE)
	recipe:AddVendor(16689, 16748)

	-- Stylin' Purple Hat -- 32485
	recipe = AddRecipe(32485, 350, 25680, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(18667)

	-- Stylin' Adventure Hat -- 32487
	recipe = AddRecipe(32487, 350, 25681, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(17820, 28132)

	-- Stylin' Crimson Hat -- 32488
	recipe = AddRecipe(32488, 350, 25683, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(18322)

	-- Stylin' Jungle Hat -- 32489
	recipe = AddRecipe(32489, 350, 25682, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(17839, 21104)

	-- Fel Leather Gloves -- 32490
	recipe = AddRecipe(32490, 340, 25685, Q.RARE, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM, F.LEATHER)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.FRIENDLY, 20242, 23007)

	-- Fel Leather Boots -- 32493
	recipe = AddRecipe(32493, 350, 25686, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM, F.LEATHER)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.HONORED, 20242, 23007)

	-- Fel Leather Leggings -- 32494
	recipe = AddRecipe(32494, 350, 25687, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.CONSORTIUM, F.LEATHER)
	recipe:AddRepVendor(FAC.CONSORTIUM, REP.REVERED, 20242, 23007)

	-- Heavy Clefthoof Vest -- 32495
	recipe = AddRecipe(32495, 360, 25689, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Heavy Clefthoof Leggings -- 32496
	recipe = AddRecipe(32496, 355, 25690, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Heavy Clefthoof Boots -- 32497
	recipe = AddRecipe(32497, 355, 25691, Q.RARE, V.TBC, 355, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.TANK, F.CENARION_EXPEDITION, F.LEATHER)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.FRIENDLY, 17904)

	-- Felstalker Belt -- 32498
	recipe = AddRecipe(32498, 350, 25695, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE, F.MAIL)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.FRIENDLY, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.FRIENDLY, 17585)

	-- Felstalker Bracers -- 32499
	recipe = AddRecipe(32499, 360, 25697, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE, F.MAIL)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Felstalker Breastplate -- 32500
	recipe = AddRecipe(32500, 360, 25696, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.HELLFIRE, F.MAIL)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Netherfury Belt -- 32501
	recipe = AddRecipe(32501, 340, 25694, Q.RARE, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NAGRAND, F.MAIL)
	recipe:AddRepVendor(FAC.KURENAI, REP.FRIENDLY, 20240)

	-- Netherfury Leggings -- 32502
	recipe = AddRecipe(32502, 340, 25692, Q.RARE, V.TBC, 340, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NAGRAND, F.MAIL)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Netherfury Boots -- 32503
	recipe = AddRecipe(32503, 350, 25693, Q.RARE, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.NAGRAND, F.MAIL)
	recipe:AddRepVendor(FAC.KURENAI, REP.REVERED, 20240)

	-- Shadow Armor Kit -- 35520
	recipe = AddRecipe(35520, 340, 29483, Q.UNCOMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(18320)

	-- Flame Armor Kit -- 35521
	recipe = AddRecipe(35521, 340, 29485, Q.UNCOMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(20898)

	-- Frost Armor Kit -- 35522
	recipe = AddRecipe(35522, 340, 29486, Q.UNCOMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17797)

	-- Nature Armor Kit -- 35523
	recipe = AddRecipe(35523, 340, 29487, Q.UNCOMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17941)

	-- Arcane Armor Kit -- 35524
	recipe = AddRecipe(35524, 340, 29488, Q.UNCOMMON, V.TBC, 340, 350, 355, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.INSTANCE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(17879)

	-- Enchanted Felscale Leggings -- 35525
	recipe = AddRecipe(35525, 350, 29489, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.MAIL)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Enchanted Felscale Gloves -- 35526
	recipe = AddRecipe(35526, 350, 29490, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.MAIL)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Enchanted Felscale Boots -- 35527
	recipe = AddRecipe(35527, 350, 29491, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.MAIL)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Flamescale Boots -- 35528
	recipe = AddRecipe(35528, 350, 29493, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.MAIL)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Flamescale Leggings -- 35529
	recipe = AddRecipe(35529, 350, 29492, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.MAIL)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Reinforced Mining Bag -- 35530
	recipe = AddRecipe(35530, 325, 29540, Q.COMMON, V.TBC, 325, 335, 340, 345)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Flamescale Belt -- 35531
	recipe = AddRecipe(35531, 350, 29494, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.MAIL)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Enchanted Clefthoof Leggings -- 35532
	recipe = AddRecipe(35532, 350, 29495, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.LEATHER)
	recipe:AddRepVendor(FAC.SCRYER, REP.EXALTED, 19331)

	-- Enchanted Clefthoof Gloves -- 35533
	recipe = AddRecipe(35533, 350, 29496, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.LEATHER)
	recipe:AddRepVendor(FAC.SCRYER, REP.REVERED, 19331)

	-- Enchanted Clefthoof Boots -- 35534
	recipe = AddRecipe(35534, 350, 29497, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SCRYER, F.LEATHER)
	recipe:AddRepVendor(FAC.SCRYER, REP.HONORED, 19331)

	-- Blastguard Pants -- 35535
	recipe = AddRecipe(35535, 350, 29498, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.LEATHER)
	recipe:AddRepVendor(FAC.ALDOR, REP.EXALTED, 19321)

	-- Blastguard Boots -- 35536
	recipe = AddRecipe(35536, 350, 29499, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.LEATHER)
	recipe:AddRepVendor(FAC.ALDOR, REP.REVERED, 19321)

	-- Blastguard Belt -- 35537
	recipe = AddRecipe(35537, 350, 29500, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ALDOR, F.LEATHER)
	recipe:AddRepVendor(FAC.ALDOR, REP.HONORED, 19321)

	-- Drums of Panic -- 35538
	recipe = AddRecipe(35538, 370, 29532, Q.COMMON, V.TBC, 370, 370, 377, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KOT)
	recipe:AddRepVendor(FAC.KEEPERS_OF_TIME, REP.HONORED, 21643)

	-- Drums of Restoration -- 35539
	recipe = AddRecipe(35539, 350, 29531, Q.COMMON, V.TBC, 350, 350, 357, 365)
	recipe:AddFilters(F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Drums of War -- 35540
	recipe = AddRecipe(35540, 340, 29528, Q.COMMON, V.TBC, 340, 340, 347, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Drums of Battle -- 35543
	recipe = AddRecipe(35543, 365, 29529, Q.COMMON, V.TBC, 365, 365, 372, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.SHATAR)
	recipe:AddRepVendor(FAC.SHATAR, REP.HONORED, 21432)

	-- Drums of Speed -- 35544
	recipe = AddRecipe(35544, 345, 29530, Q.COMMON, V.TBC, 345, 345, 352, 360)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.INSTANCE, F.IBOE, F.RBOP, F.NAGRAND)
	recipe:AddRepVendor(FAC.MAGHAR, REP.HONORED, 20241)
	recipe:AddRepVendor(FAC.KURENAI, REP.HONORED, 20240)

	-- Cobrahide Leg Armor -- 35549
	recipe = AddRecipe(35549, 335, 29533, Q.COMMON, V.TBC, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.HONORED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.HONORED, 17585)

	-- Nethercobra Leg Armor -- 35554
	recipe = AddRecipe(35554, 365, 29535, Q.COMMON, V.TBC, 365, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HELLFIRE)
	recipe:AddRepVendor(FAC.HONOR_HOLD, REP.EXALTED, 17657)
	recipe:AddRepVendor(FAC.THRALLMAR, REP.EXALTED, 17585)

	-- Clefthide Leg Armor -- 35555
	recipe = AddRecipe(35555, 335, 29534, Q.COMMON, V.TBC, 335, 335, 345, 355)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.HONORED, 17904)

	-- Nethercleft Leg Armor -- 35557
	recipe = AddRecipe(35557, 365, 29536, Q.COMMON, V.TBC, 365, 365, 375, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.CENARION_EXPEDITION)
	recipe:AddRepVendor(FAC.CENARION_EXPEDITION, REP.EXALTED, 17904)

	-- Cobrascale Hood -- 35558
	recipe = AddRecipe(35558, 365, 29502, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Cobrascale Gloves -- 35559
	recipe = AddRecipe(35559, 365, 29503, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddMobDrop(24664)
	recipe:AddWorldDrop("Outland")

	-- Windscale Hood -- 35560
	recipe = AddRecipe(35560, 365, 29504, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Hood of Primal Life -- 35561
	recipe = AddRecipe(35561, 365, 29505, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Gloves of the Living Touch -- 35562
	recipe = AddRecipe(35562, 365, 29506, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddMobDrop(24664)

	-- Windslayer Wraps -- 35563
	recipe = AddRecipe(35563, 365, 29507, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddWorldDrop("Outland")

	-- Living Dragonscale Helm -- 35564
	recipe = AddRecipe(35564, 365, 29508, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Earthen Netherscale Boots -- 35567
	recipe = AddRecipe(35567, 365, 29512, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Windstrike Gloves -- 35568
	recipe = AddRecipe(35568, 365, 29509, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddMobDrop(24664)

	-- Netherdrake Helm -- 35572
	recipe = AddRecipe(35572, 365, 29510, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Netherdrake Gloves -- 35573
	recipe = AddRecipe(35573, 365, 29511, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddMobDrop(24664)

	-- Thick Netherscale Breastplate -- 35574
	recipe = AddRecipe(35574, 365, 29514, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.WORLD_DROP, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddWorldDrop("Outland")

	-- Ebon Netherscale Breastplate -- 35575
	recipe = AddRecipe(35575, 375, 29515, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Ebon Netherscale Belt -- 35576
	recipe = AddRecipe(35576, 375, 29516, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Ebon Netherscale Bracers -- 35577
	recipe = AddRecipe(35577, 375, 29517, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(48)

	-- Netherstrike Breastplate -- 35580
	recipe = AddRecipe(35580, 375, 29519, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Netherstrike Belt -- 35582
	recipe = AddRecipe(35582, 375, 29520, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Netherstrike Bracers -- 35584
	recipe = AddRecipe(35584, 375, 29521, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(48)

	-- Windhawk Hauberk -- 35585
	recipe = AddRecipe(35585, 375, 29522, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(48)

	-- Windhawk Belt -- 35587
	recipe = AddRecipe(35587, 375, 29524, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(48)

	-- Windhawk Bracers -- 35588
	recipe = AddRecipe(35588, 375, 29523, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(48)

	-- Primalstrike Vest -- 35589
	recipe = AddRecipe(35589, 375, 29525, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Primalstrike Belt -- 35590
	recipe = AddRecipe(35590, 375, 29526, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Primalstrike Bracers -- 35591
	recipe = AddRecipe(35591, 375, 29527, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.RETIRED, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(48)

	-- Blackstorm Leggings -- 36074
	recipe = AddRecipe(36074, 260, 29964, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(7868, 7869, 28700, 29507)

	-- Wildfeather Leggings -- 36075
	recipe = AddRecipe(36075, 260, 29970, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(7870, 7871, 28700, 29509)

	-- Dragonstrike Leggings -- 36076
	recipe = AddRecipe(36076, 260, 29971, Q.COMMON, V.TBC, 260, 280, 290, 300)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(7866, 7867, 28700, 29508)

	-- Primalstorm Breastplate -- 36077
	recipe = AddRecipe(36077, 330, 29973, Q.COMMON, V.TBC, 330, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(7868, 7869, 28700, 29507)

	-- Living Crystal Breastplate -- 36078
	recipe = AddRecipe(36078, 330, 29974, Q.COMMON, V.TBC, 330, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(7870, 7871, 28700, 29509)

	-- Golden Dragonstrike Breastplate -- 36079
	recipe = AddRecipe(36079, 330, 29975, Q.COMMON, V.TBC, 330, 350, 360, 370)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOP, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(7866, 7867, 28700, 29508)

	-- Belt of Natural Power -- 36349
	recipe = AddRecipe(36349, 375, 30042, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(37, 43)

	-- Belt of Deep Shadow -- 36351
	recipe = AddRecipe(36351, 375, 30040, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(37, 43)

	-- Belt of the Black Eagle -- 36352
	recipe = AddRecipe(36352, 375, 30046, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(37, 43)

	-- Monsoon Belt -- 36353
	recipe = AddRecipe(36353, 375, 30044, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(37, 43)

	-- Boots of Natural Grace -- 36355
	recipe = AddRecipe(36355, 375, 30041, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(37, 43)

	-- Boots of Utter Darkness -- 36357
	recipe = AddRecipe(36357, 375, 30039, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(37, 43)

	-- Boots of the Crimson Hawk -- 36358
	recipe = AddRecipe(36358, 375, 30045, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(37, 43)

	-- Hurricane Boots -- 36359
	recipe = AddRecipe(36359, 375, 30043, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(37, 43)

	-- Boots of Shackled Souls -- 39997
	recipe = AddRecipe(39997, 375, 32398, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Greaves of Shackled Souls -- 40001
	recipe = AddRecipe(40001, 375, 32400, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Waistguard of Shackled Souls -- 40002
	recipe = AddRecipe(40002, 375, 32397, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Redeemed Soul Moccasins -- 40003
	recipe = AddRecipe(40003, 375, 32394, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Redeemed Soul Wristguards -- 40004
	recipe = AddRecipe(40004, 375, 32395, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.HONORED, 23159)

	-- Redeemed Soul Legguards -- 40005
	recipe = AddRecipe(40005, 375, 32396, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Redeemed Soul Cinch -- 40006
	recipe = AddRecipe(40006, 375, 32393, Q.COMMON, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Bracers of Renewed Life -- 41156
	recipe = AddRecipe(41156, 375, 32582, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(34)

	-- Shoulderpads of Renewed Life -- 41157
	recipe = AddRecipe(41157, 375, 32583, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(27, 34)

	-- Swiftstrike Bracers -- 41158
	recipe = AddRecipe(41158, 375, 32580, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(27, 34)

	-- Swiftstrike Shoulders -- 41160
	recipe = AddRecipe(41160, 375, 32581, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(34)

	-- Bindings of Lightning Reflexes -- 41161
	recipe = AddRecipe(41161, 375, 32574, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(27, 34)

	-- Shoulders of Lightning Reflexes -- 41162
	recipe = AddRecipe(41162, 375, 32575, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(34)

	-- Living Earth Bindings -- 41163
	recipe = AddRecipe(41163, 375, 32577, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(34)

	-- Living Earth Shoulders -- 41164
	recipe = AddRecipe(41164, 375, 32579, Q.EPIC, V.TBC, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(27, 34)

	-- Cloak of Darkness -- 42546
	recipe = AddRecipe(42546, 360, 33122, Q.RARE, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.VIOLETEYE, F.CLOAK)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.EXALTED, 18255)

	-- Shadowprowler's Chestguard -- 42731
	recipe = AddRecipe(42731, 365, 33204, Q.EPIC, V.TBC, 365, 375, 385, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.VIOLETEYE, F.LEATHER)
	recipe:AddRepVendor(FAC.VIOLETEYE, REP.REVERED, 18255)

	-- Quiver of a Thousand Feathers -- 44359
	recipe = AddRecipe(44359, 350, 34105, Q.COMMON, V.TBC, 350, 360, 370, 380)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.RETIRED, F.IBOE, F.RBOP, F.LOWERCITY)
	recipe:AddCustom(48)

	-- Glove Reinforcements -- 44770
	recipe = AddRecipe(44770, 350, 34207, Q.COMMON, V.TBC, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Winter Boots -- 44953
	recipe = AddRecipe(44953, 285, 34086, Q.UNCOMMON, V.TBC, 285, 285, 285, 285)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.SEASONAL, F.IBOE, F.RBOP, F.CLOTH)
	recipe:AddVendor(13420, 13433)
	recipe:AddSeason(1)

	-- Heavy Knothide Armor Kit -- 44970
	recipe = AddRecipe(44970, 350, 34330, Q.COMMON, V.TBC, 350, 355, 360, 365)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Leatherworker's Satchel -- 45100
	recipe = AddRecipe(45100, 300, 34482, Q.COMMON, V.TBC, 300, 310, 320, 330)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(18754, 18771, 19187, 21087, 28700, 33612, 33635, 33681)

	-- Bag of Many Hides -- 45117
	recipe = AddRecipe(45117, 360, 34490, Q.UNCOMMON, V.TBC, 360, 370, 380, 390)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(22143, 22144, 22148, 23022)

	-- Leather Gauntlets of the Sun -- 46132
	recipe = AddRecipe(46132, 365, 34372, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(24)

	-- Fletcher's Gloves of the Phoenix -- 46133
	recipe = AddRecipe(46133, 365, 34374, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddCustom(24)

	-- Gloves of Immortal Dusk -- 46134
	recipe = AddRecipe(46134, 365, 34370, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddCustom(24)

	-- Sun-Drenched Scale Gloves -- 46135
	recipe = AddRecipe(46135, 365, 34376, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(24)

	-- Leather Chestguard of the Sun -- 46136
	recipe = AddRecipe(46136, 365, 34371, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(24)

	-- Embrace of the Phoenix -- 46137
	recipe = AddRecipe(46137, 365, 34373, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(24)

	-- Carapace of Sun and Shadow -- 46138
	recipe = AddRecipe(46138, 365, 34369, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(24)

	-- Sun-Drenched Scale Chestguard -- 46139
	recipe = AddRecipe(46139, 365, 34375, Q.EPIC, V.TBC, 365, 375, 392, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOP, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(24)

	-- Heavy Borean Leather -- 50936
	recipe = AddRecipe(50936, 390, 38425, Q.COMMON, V.WOTLK, 390, 390, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Chestguard -- 50938
	recipe = AddRecipe(50938, 375, 38408, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Leggings -- 50939
	recipe = AddRecipe(50939, 370, 38410, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Shoulderpads -- 50940
	recipe = AddRecipe(50940, 380, 38411, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Gloves -- 50941
	recipe = AddRecipe(50941, 370, 38409, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Boots -- 50942
	recipe = AddRecipe(50942, 375, 38407, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Belt -- 50943
	recipe = AddRecipe(50943, 380, 38406, Q.COMMON, V.WOTLK, 380, 380, 387, 395)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Chestpiece -- 50944
	recipe = AddRecipe(50944, 370, 38400, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Leggings -- 50945
	recipe = AddRecipe(50945, 375, 38401, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Shoulderpads -- 50946
	recipe = AddRecipe(50946, 380, 38402, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Gloves -- 50947
	recipe = AddRecipe(50947, 375, 38403, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Boots -- 50948
	recipe = AddRecipe(50948, 370, 38404, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Belt -- 50949
	recipe = AddRecipe(50949, 380, 38405, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Chestguard -- 50950
	recipe = AddRecipe(50950, 375, 38414, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Leggings -- 50951
	recipe = AddRecipe(50951, 370, 38416, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Shoulders -- 50952
	recipe = AddRecipe(50952, 375, 38424, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Gloves -- 50953
	recipe = AddRecipe(50953, 380, 38415, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Boots -- 50954
	recipe = AddRecipe(50954, 380, 38413, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Belt -- 50955
	recipe = AddRecipe(50955, 370, 38412, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Chestguard -- 50956
	recipe = AddRecipe(50956, 375, 38420, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Legguards -- 50957
	recipe = AddRecipe(50957, 370, 38422, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Shoulders -- 50958
	recipe = AddRecipe(50958, 380, 38417, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Gloves -- 50959
	recipe = AddRecipe(50959, 370, 38421, Q.COMMON, V.WOTLK, 370, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Boots -- 50960
	recipe = AddRecipe(50960, 380, 38419, Q.COMMON, V.WOTLK, 380, 395, 405, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Belt -- 50961
	recipe = AddRecipe(50961, 375, 38418, Q.COMMON, V.WOTLK, 375, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Borean Armor Kit -- 50962
	recipe = AddRecipe(50962, 350, 38375, Q.COMMON, V.WOTLK, 350, 375, 380, 385)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Heavy Borean Armor Kit -- 50963
	recipe = AddRecipe(50963, 395, 38376, Q.COMMON, V.WOTLK, 395, 400, 402, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Jormungar Leg Armor -- 50964
	recipe = AddRecipe(50964, 405, 38371, Q.COMMON, V.WOTLK, 405, 410, 415, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frosthide Leg Armor -- 50965
	recipe = AddRecipe(50965, 425, 38373, Q.COMMON, V.WOTLK, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Leg Armor -- 50966
	recipe = AddRecipe(50966, 400, 38372, Q.COMMON, V.WOTLK, 400, 405, 410, 415)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Icescale Leg Armor -- 50967
	recipe = AddRecipe(50967, 425, 38374, Q.COMMON, V.WOTLK, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Trapper's Traveling Pack -- 50970
	recipe = AddRecipe(50970, 415, 38399, Q.RARE, V.WOTLK, 415, 420, 422, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.KALUAK)
	recipe:AddRepVendor(FAC.KALUAK, REP.REVERED, 31916, 32763)

	-- Mammoth Mining Bag -- 50971
	recipe = AddRecipe(50971, 415, 38347, Q.RARE, V.WOTLK, 415, 420, 422, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HODIR)
	recipe:AddRepVendor(FAC.HODIR, REP.HONORED, 32540)

	-- Black Chitinguard Boots -- 51568
	recipe = AddRecipe(51568, 400, 38590, Q.COMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Arctic Leggings -- 51569
	recipe = AddRecipe(51569, 395, 38591, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Arctic Chestpiece -- 51570
	recipe = AddRecipe(51570, 395, 38592, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Wristguards -- 51571
	recipe = AddRecipe(51571, 385, 38433, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Arctic Helm -- 51572
	recipe = AddRecipe(51572, 385, 38437, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Bracers of Shackled Souls -- 52733
	recipe = AddRecipe(52733, 375, 32399, Q.COMMON, V.WOTLK, 375, 385, 395, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.ASHTONGUE, F.MAIL)
	recipe:AddRepVendor(FAC.ASHTONGUE, REP.FRIENDLY, 23159)

	-- Cloak of Tormented Skies -- 55199
	recipe = AddRecipe(55199, 395, 41238, Q.COMMON, V.WOTLK, 395, 405, 415, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.TANK, F.CLOAK)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Fur Lining - Attack Power -- 57683
	recipe = AddRecipe(57683, 400, nil, Q.COMMON, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Fur Lining - Stamina -- 57690
	recipe = AddRecipe(57690, 400, nil, Q.COMMON, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Fur Lining - Spell Power -- 57691
	recipe = AddRecipe(57691, 400, nil, Q.COMMON, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Fur Lining - Fire Resist -- 57692
	recipe = AddRecipe(57692, 400, nil, Q.RARE, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(30921)

	-- Fur Lining - Frost Resist -- 57694
	recipe = AddRecipe(57694, 400, nil, Q.RARE, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32289)

	-- Fur Lining - Shadow Resist -- 57696
	recipe = AddRecipe(57696, 400, nil, Q.RARE, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32349)

	-- Fur Lining - Nature Resist -- 57699
	recipe = AddRecipe(57699, 400, nil, Q.RARE, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(32290)

	-- Fur Lining - Arcane Resist -- 57701
	recipe = AddRecipe(57701, 400, nil, Q.RARE, V.WOTLK, 400, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.MOB_DROP, F.IBOE, F.RBOP)
	recipe:AddMobDrop(31702, 32297)

	-- Jormungar Leg Reinforcements -- 60583
	recipe = AddRecipe(60583, 405, nil, Q.COMMON, V.WOTLK, 405, 405, 405, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Leg Reinforcements -- 60584
	recipe = AddRecipe(60584, 400, nil, Q.COMMON, V.WOTLK, 400, 400, 400, 405)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Bracers -- 60599
	recipe = AddRecipe(60599, 385, 38436, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Frostscale Helm -- 60600
	recipe = AddRecipe(60600, 385, 38440, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Frostscale Leggings -- 60601
	recipe = AddRecipe(60601, 395, 44436, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Frostscale Breastplate -- 60604
	recipe = AddRecipe(60604, 395, 44437, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dragonstompers -- 60605
	recipe = AddRecipe(60605, 400, 44438, Q.COMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Wristguards -- 60607
	recipe = AddRecipe(60607, 385, 38434, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Iceborne Helm -- 60608
	recipe = AddRecipe(60608, 385, 38438, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Iceborne Leggings -- 60611
	recipe = AddRecipe(60611, 395, 44440, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Iceborne Chestguard -- 60613
	recipe = AddRecipe(60613, 395, 44441, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Bugsquashers -- 60620
	recipe = AddRecipe(60620, 400, 44442, Q.COMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Bracers -- 60622
	recipe = AddRecipe(60622, 385, 38435, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nerubian Helm -- 60624
	recipe = AddRecipe(60624, 385, 38439, Q.COMMON, V.WOTLK, 385, 400, 410, 420)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Nerubian Leggings -- 60627
	recipe = AddRecipe(60627, 395, 44443, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Dark Nerubian Chestpiece -- 60629
	recipe = AddRecipe(60629, 395, 44444, Q.COMMON, V.WOTLK, 395, 410, 420, 430)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Scaled Icewalkers -- 60630
	recipe = AddRecipe(60630, 400, 44445, Q.COMMON, V.WOTLK, 400, 415, 425, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Cloak of Harsh Winds -- 60631
	recipe = AddRecipe(60631, 380, 38441, Q.COMMON, V.WOTLK, 380, 390, 400, 410)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Ice Striker's Cloak -- 60637
	recipe = AddRecipe(60637, 440, 43566, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.CLOAK)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Durable Nerubhide Cape -- 60640
	recipe = AddRecipe(60640, 440, 43565, Q.COMMON, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.TANK, F.CLOAK)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Pack of Endless Pockets -- 60643
	recipe = AddRecipe(60643, 415, 44446, Q.COMMON, V.WOTLK, 415, 420, 422, 425)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Razorstrike Breastplate -- 60649
	recipe = AddRecipe(60649, 425, 43129, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Virulent Spaulders -- 60651
	recipe = AddRecipe(60651, 420, 43130, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Eaglebane Bracers -- 60652
	recipe = AddRecipe(60652, 420, 43131, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nightshock Hood -- 60655
	recipe = AddRecipe(60655, 425, 43132, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Nightshock Girdle -- 60658
	recipe = AddRecipe(60658, 420, 43133, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Leggings of Visceral Strikes -- 60660
	recipe = AddRecipe(60660, 425, 42731, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Seafoam Gauntlets -- 60665
	recipe = AddRecipe(60665, 420, 43255, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Jormscale Footpads -- 60666
	recipe = AddRecipe(60666, 420, 43256, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Wildscale Breastplate -- 60669
	recipe = AddRecipe(60669, 425, 43257, Q.COMMON, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Purehorn Spaulders -- 60671
	recipe = AddRecipe(60671, 420, 43258, Q.COMMON, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Eviscerator's Facemask -- 60697
	recipe = AddRecipe(60697, 420, 43260, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Shoulderpads -- 60702
	recipe = AddRecipe(60702, 420, 43433, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Chestguard -- 60703
	recipe = AddRecipe(60703, 420, 43434, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Bindings -- 60704
	recipe = AddRecipe(60704, 420, 43435, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Gauntlets -- 60705
	recipe = AddRecipe(60705, 425, 43436, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Waistguard -- 60706
	recipe = AddRecipe(60706, 425, 43437, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Legguards -- 60711
	recipe = AddRecipe(60711, 425, 43438, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Eviscerator's Treads -- 60712
	recipe = AddRecipe(60712, 425, 43439, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Headguard -- 60715
	recipe = AddRecipe(60715, 420, 43261, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Spaulders -- 60716
	recipe = AddRecipe(60716, 420, 43262, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Chestguard -- 60718
	recipe = AddRecipe(60718, 420, 43263, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Bracers -- 60720
	recipe = AddRecipe(60720, 420, 43264, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Handwraps -- 60721
	recipe = AddRecipe(60721, 425, 43265, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Belt -- 60723
	recipe = AddRecipe(60723, 425, 43266, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Leggings -- 60725
	recipe = AddRecipe(60725, 425, 43271, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Overcast Boots -- 60727
	recipe = AddRecipe(60727, 425, 43273, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Swiftarrow Helm -- 60728
	recipe = AddRecipe(60728, 420, 43447, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Shoulderguards -- 60729
	recipe = AddRecipe(60729, 420, 43449, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Hauberk -- 60730
	recipe = AddRecipe(60730, 420, 43445, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Bracers -- 60731
	recipe = AddRecipe(60731, 420, 43444, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Gauntlets -- 60732
	recipe = AddRecipe(60732, 425, 43446, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Belt -- 60734
	recipe = AddRecipe(60734, 425, 43442, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Leggings -- 60735
	recipe = AddRecipe(60735, 425, 43448, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Swiftarrow Boots -- 60737
	recipe = AddRecipe(60737, 425, 43443, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Crown -- 60743
	recipe = AddRecipe(60743, 420, 43455, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Shoulders -- 60746
	recipe = AddRecipe(60746, 420, 43457, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Hauberk -- 60747
	recipe = AddRecipe(60747, 420, 43453, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Wristguards -- 60748
	recipe = AddRecipe(60748, 420, 43452, Q.RARE, V.WOTLK, 420, 425, 430, 435)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Grips -- 60749
	recipe = AddRecipe(60749, 425, 43454, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Belt -- 60750
	recipe = AddRecipe(60750, 425, 43450, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Legguards -- 60751
	recipe = AddRecipe(60751, 425, 43456, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Stormhide Stompers -- 60752
	recipe = AddRecipe(60752, 425, 43451, Q.RARE, V.WOTLK, 425, 430, 435, 440)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Giantmaim Legguards -- 60754
	recipe = AddRecipe(60754, 440, 43458, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Giantmaim Bracers -- 60755
	recipe = AddRecipe(60755, 440, 43459, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Revenant's Breastplate -- 60756
	recipe = AddRecipe(60756, 440, 43461, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Revenant's Treads -- 60757
	recipe = AddRecipe(60757, 440, 43469, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddVendor(32515)

	-- Trollwoven Spaulders -- 60758
	recipe = AddRecipe(60758, 440, 43481, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Trollwoven Girdle -- 60759
	recipe = AddRecipe(60759, 440, 43484, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.LEATHER)
	recipe:AddVendor(32515)

	-- Earthgiving Legguards -- 60760
	recipe = AddRecipe(60760, 440, 43495, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Earthgiving Boots -- 60761
	recipe = AddRecipe(60761, 440, 43502, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Polar Vest -- 60996
	recipe = AddRecipe(60996, 425, 43590, Q.EPIC, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddVendor(32515)

	-- Polar Cord -- 60997
	recipe = AddRecipe(60997, 420, 43591, Q.EPIC, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddVendor(32515)

	-- Polar Boots -- 60998
	recipe = AddRecipe(60998, 420, 43592, Q.EPIC, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddVendor(32515)

	-- Icy Scale Chestguard -- 60999
	recipe = AddRecipe(60999, 425, 43593, Q.EPIC, V.WOTLK, 425, 435, 445, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddVendor(32515)

	-- Icy Scale Belt -- 61000
	recipe = AddRecipe(61000, 420, 43594, Q.EPIC, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddVendor(32515)

	-- Icy Scale Boots -- 61002
	recipe = AddRecipe(61002, 420, 43595, Q.EPIC, V.WOTLK, 420, 430, 440, 450)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.MAIL)
	recipe:AddVendor(32515)

	-- Windripper Boots -- 62176
	recipe = AddRecipe(62176, 440, 44930, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Windripper Leggings -- 62177
	recipe = AddRecipe(62177, 440, 44931, Q.EPIC, V.WOTLK, 440, 450, 455, 460)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddVendor(32515)

	-- Earthen Leg Armor -- 62448
	recipe = AddRecipe(62448, 425, 44963, Q.COMMON, V.WOTLK, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Belt of Dragons -- 63194
	recipe = AddRecipe(63194, 450, 45553, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(39)

	-- Boots of Living Scale -- 63195
	recipe = AddRecipe(63195, 450, 45095, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(39)

	-- Blue Belt of Chaos -- 63196
	recipe = AddRecipe(63196, 450, 45096, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(39)

	-- Lightning Grounded Boots -- 63197
	recipe = AddRecipe(63197, 450, 45097, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(39)

	-- Death-warmed Belt -- 63198
	recipe = AddRecipe(63198, 450, 45098, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(39)

	-- Footpads of Silence -- 63199
	recipe = AddRecipe(63199, 450, 45099, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(39)

	-- Belt of Arctic Life -- 63200
	recipe = AddRecipe(63200, 450, 45100, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(39)

	-- Boots of Wintry Endurance -- 63201
	recipe = AddRecipe(63201, 450, 45101, Q.EPIC, V.WOTLK, 450, 455, 465, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(39)

	-- Borean Leather -- 64661
	recipe = AddRecipe(64661, 350, 33568, Q.COMMON, V.WOTLK, 350, 350, 362, 375)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP, F.LEATHER)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Ensorcelled Nerubian Breastplate -- 67080
	recipe = AddRecipe(67080, 450, 47597, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(42)

	-- Black Chitin Bracers -- 67081
	recipe = AddRecipe(67081, 450, 47579, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom(42)

	-- Crusader's Dragonscale Breastplate -- 67082
	recipe = AddRecipe(67082, 450, 47595, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom(42)

	-- Crusader's Dragonscale Bracers -- 67083
	recipe = AddRecipe(67083, 450, 47576, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(42)

	-- Lunar Eclipse Robes -- 67084
	recipe = AddRecipe(67084, 450, 47602, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom(42)

	-- Moonshadow Armguards -- 67085
	recipe = AddRecipe(67085, 450, 47583, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom(42)

	-- Knightbane Carapace -- 67086
	recipe = AddRecipe(67086, 450, 47599, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom(42)

	-- Bracers of Swift Death -- 67087
	recipe = AddRecipe(67087, 450, 47581, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Alliance")
	recipe:AddFilters(F.ALLIANCE, F.RAID)
	recipe:AddCustom(42)

	-- Ensorcelled Nerubian Breastplate -- 67136
	recipe = AddRecipe(67136, 450, 47598, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(42)

	-- Black Chitin Bracers -- 67137
	recipe = AddRecipe(67137, 450, 47580, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.MAIL)
	recipe:AddCustom(42)

	-- Crusader's Dragonscale Breastplate -- 67138
	recipe = AddRecipe(67138, 450, 47596, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(42)

	-- Bracers of Swift Death -- 67139
	recipe = AddRecipe(67139, 450, 47582, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(42)

	-- Lunar Eclipse Robes -- 67140
	recipe = AddRecipe(67140, 450, 47601, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(42)

	-- Moonshadow Armguards -- 67141
	recipe = AddRecipe(67141, 450, 47584, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.HEALER, F.CASTER, F.LEATHER)
	recipe:AddCustom(42)

	-- Knightbane Carapace -- 67142
	recipe = AddRecipe(67142, 450, 47600, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.LEATHER)
	recipe:AddCustom(42)

	-- Crusader's Dragonscale Bracers -- 67143
	recipe = AddRecipe(67143, 450, 47577, Q.EPIC, V.WOTLK, 450, 460, 467, 475, nil, "Horde")
	recipe:AddFilters(F.HORDE, F.RAID, F.IBOE, F.RBOE, F.DPS, F.MAIL)
	recipe:AddCustom(42)

	-- Drums of Forgotten Kings -- 69386
	recipe = AddRecipe(69386, 450, 49633, Q.COMMON, V.WOTLK, 450, 450, 455, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Drums of the Wild -- 69388
	recipe = AddRecipe(69388, 450, 49634, Q.COMMON, V.WOTLK, 450, 450, 455, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(26911, 26961, 26996, 26998, 28700, 33581)

	-- Legwraps of Unleashed Nature -- 70554
	recipe = AddRecipe(70554, 450, 49898, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Blessed Cenarion Boots -- 70555
	recipe = AddRecipe(70555, 450, 49894, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Bladeborn Leggings -- 70556
	recipe = AddRecipe(70556, 450, 49899, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Footpads of Impending Death -- 70557
	recipe = AddRecipe(70557, 450, 49895, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.TANK, F.ASHEN_VERDICT, F.LEATHER)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Lightning-Infused Leggings -- 70558
	recipe = AddRecipe(70558, 450, 49900, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Earthsoul Boots -- 70559
	recipe = AddRecipe(70559, 450, 49896, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Draconic Bonesplinter Legguards -- 70560
	recipe = AddRecipe(70560, 450, 49901, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.REVERED, 37687)

	-- Rock-Steady Treads -- 70561
	recipe = AddRecipe(70561, 450, 49897, Q.EPIC, V.WOTLK, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP, F.DPS, F.ASHEN_VERDICT, F.MAIL)
	recipe:AddRepVendor(FAC.ASHEN_VERDICT, REP.HONORED, 37687)

	-- Savage Armor Kit -- 78379
	recipe = AddRecipe(78379, 425, 56477, Q.COMMON, V.CATA, 425, 450, 452, 455)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Savage Cloak -- 78380
	recipe = AddRecipe(78380, 460, nil, Q.COMMON, V.CATA, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Bracers -- 78388
	recipe = AddRecipe(78388, 460, nil, Q.COMMON, V.CATA, 460, 470, 475, 480)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Belt -- 78396
	recipe = AddRecipe(78396, 470, nil, Q.COMMON, V.CATA, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Bracers -- 78398
	recipe = AddRecipe(78398, 450, 56483, Q.COMMON, V.CATA, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Gloves -- 78399
	recipe = AddRecipe(78399, 465, nil, Q.COMMON, V.CATA, 465, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Hardened Scale Cloak -- 78405
	recipe = AddRecipe(78405, 470, 56489, Q.COMMON, V.CATA, 470, 480, 485, 490)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Gloves -- 78406
	recipe = AddRecipe(78406, 475, nil, Q.COMMON, V.CATA, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Boots -- 78407
	recipe = AddRecipe(78407, 465, nil, Q.COMMON, V.CATA, 465, 475, 480, 485)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Boots -- 78410
	recipe = AddRecipe(78410, 450, nil, Q.COMMON, V.CATA, 450, 460, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Shoulders -- 78411
	recipe = AddRecipe(78411, 475, nil, Q.COMMON, V.CATA, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Shoulders -- 78415
	recipe = AddRecipe(78415, 455, nil, Q.COMMON, V.CATA, 455, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Belt -- 78416
	recipe = AddRecipe(78416, 455, nil, Q.COMMON, V.CATA, 455, 465, 470, 475)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Scorched Leg Armor -- 78419
	recipe = AddRecipe(78419, 475, nil, Q.COMMON, V.CATA, 475, 485, 490, 495)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Twilight Leg Armor -- 78420
	recipe = AddRecipe(78420, 480, nil, Q.COMMON, V.CATA, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Chestguard -- 78423
	recipe = AddRecipe(78423, 490, nil, Q.COMMON, V.CATA, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Helm -- 78424
	recipe = AddRecipe(78424, 490, nil, Q.COMMON, V.CATA, 490, 500, 505, 510)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Leggings -- 78427
	recipe = AddRecipe(78427, 480, nil, Q.COMMON, V.CATA, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Chestguard -- 78428
	recipe = AddRecipe(78428, 480, nil, Q.COMMON, V.CATA, 480, 490, 495, 500)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Tsunami Helm -- 78432
	recipe = AddRecipe(78432, 485, nil, Q.COMMON, V.CATA, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Darkbrand Leggings -- 78433
	recipe = AddRecipe(78433, 485, nil, Q.COMMON, V.CATA, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Heavy Savage Leather -- 78436
	recipe = AddRecipe(78436, 485, nil, Q.COMMON, V.CATA, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Heavy Savage Armor Kit -- 78437
	recipe = AddRecipe(78437, 485, nil, Q.COMMON, V.CATA, 485, 495, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Cloak of Beasts -- 78438
	recipe = AddRecipe(78438, 495, nil, Q.COMMON, V.CATA, 495, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Cloak of War -- 78439
	recipe = AddRecipe(78439, 495, nil, Q.COMMON, V.CATA, 495, 505, 510, 515)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Bloodied Wyrmhide Bracers -- 78444
	recipe = AddRecipe(78444, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Belt -- 78445
	recipe = AddRecipe(78445, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Bracers -- 78446
	recipe = AddRecipe(78446, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Gloves -- 78447
	recipe = AddRecipe(78447, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Bracers -- 78448
	recipe = AddRecipe(78448, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Gloves -- 78449
	recipe = AddRecipe(78449, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Bracers -- 78450
	recipe = AddRecipe(78450, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Shoulders -- 78451
	recipe = AddRecipe(78451, 510, nil, Q.COMMON, V.CATA, 510, 515, 520, 525)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Gloves -- 78452
	recipe = AddRecipe(78452, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Boots -- 78453
	recipe = AddRecipe(78453, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Boots -- 78454
	recipe = AddRecipe(78454, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Shoulders -- 78455
	recipe = AddRecipe(78455, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Boots -- 78456
	recipe = AddRecipe(78456, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Belt -- 78457
	recipe = AddRecipe(78457, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Boots -- 78458
	recipe = AddRecipe(78458, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Gloves -- 78459
	recipe = AddRecipe(78459, 515, nil, Q.COMMON, V.CATA, 515, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Lightning Lash -- 78460
	recipe = AddRecipe(78460, 425, nil, Q.COMMON, V.CATA, 425, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Belt of Nefarious Whispers -- 78461
	recipe = AddRecipe(78461, 525, nil, Q.COMMON, V.CATA, 525, 525, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Stormleather Sash -- 78462
	recipe = AddRecipe(78462, 425, nil, Q.COMMON, V.CATA, 425, 520, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Corded Viper Belt -- 78463
	recipe = AddRecipe(78463, 525, nil, Q.COMMON, V.CATA, 525, 525, 525, 530)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Shoulders -- 78464
	recipe = AddRecipe(78464, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Chest -- 78467
	recipe = AddRecipe(78467, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Belt -- 78468
	recipe = AddRecipe(78468, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Helm -- 78469
	recipe = AddRecipe(78469, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Shoulders -- 78470
	recipe = AddRecipe(78470, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Legs -- 78471
	recipe = AddRecipe(78471, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Belt -- 78473
	recipe = AddRecipe(78473, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Helm -- 78474
	recipe = AddRecipe(78474, 520, nil, Q.COMMON, V.CATA, 520, 525, 530, 535)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Razor-Edged Cloak -- 78475
	recipe = AddRecipe(78475, 425, nil, Q.COMMON, V.CATA, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Twilight Dragonscale Cloak -- 78476
	recipe = AddRecipe(78476, 425, nil, Q.COMMON, V.CATA, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Dragonscale Leg Armor -- 78477
	recipe = AddRecipe(78477, 425, nil, Q.COMMON, V.CATA, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Charscale Leg Armor -- 78478
	recipe = AddRecipe(78478, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Legs -- 78479
	recipe = AddRecipe(78479, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Wyrmhide Helm -- 78480
	recipe = AddRecipe(78480, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Chest -- 78481
	recipe = AddRecipe(78481, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Leather Legs -- 78482
	recipe = AddRecipe(78482, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Chest -- 78483
	recipe = AddRecipe(78483, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Scale Helm -- 78484
	recipe = AddRecipe(78484, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Legs -- 78485
	recipe = AddRecipe(78485, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Bloodied Dragonscale Chest -- 78486
	recipe = AddRecipe(78486, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Chestguard of Nature's Fury -- 78487
	recipe = AddRecipe(78487, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Assassin's Chestplate -- 78488
	recipe = AddRecipe(78488, 525, nil, Q.COMMON, V.CATA, 525, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Twilight Scale Chestguard -- 78489
	recipe = AddRecipe(78489, 425, nil, Q.COMMON, V.CATA, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Dragonkiller Tunic -- 78490
	recipe = AddRecipe(78490, 425, nil, Q.COMMON, V.CATA, 425, 530, 535, 540)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.VENDOR, F.IBOE, F.RBOP)
	recipe:AddVendor(50172, 50381)

	-- Savage Leather -- 84950
	recipe = AddRecipe(84950, 425, 52976, Q.COMMON, V.CATA, 425, 435, 440, 445)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Draconic Embossment - Stamina -- 85007
	recipe = AddRecipe(85007, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Draconic Embossment - Agility -- 85008
	recipe = AddRecipe(85008, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Draconic Embossment - Strength -- 85009
	recipe = AddRecipe(85009, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Draconic Embossment - Intellect -- 85010
	recipe = AddRecipe(85010, 500, nil, Q.COMMON, V.CATA, 500, 500, 500, 505)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Dragonbone Leg Reinforcements -- 85067
	recipe = AddRecipe(85067, 465, nil, Q.COMMON, V.CATA, 465, 465, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	-- Charscale Leg Reinforcements -- 85068
	recipe = AddRecipe(85068, 465, nil, Q.COMMON, V.CATA, 465, 465, 465, 470)
	recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER, F.IBOE, F.RBOP)
	recipe:AddTrainer(3007, 3365, 3967, 4212, 4588, 5127, 5564, 26998, 28700, 29507, 33581)

	self.InitLeatherworking = nil
end

