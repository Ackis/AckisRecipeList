--[[

ARL-Cook.lua

Cooking data for all of AckisRecipeList

$Date$
$Rev$

]]--

local L			= LibStub("AceLocale-3.0"):GetLocale("Ackis Recipe List")
local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

local addon = AckisRecipeList

function addon:InitCooking()

	-- Trainer Recipes
	self:addTradeSkillSpell(2538, 1, L["Trainer"],1)
	self:addTradeSkillSpell(8604, 1, L["Trainer"],1)
	self:addTradeSkillSpell(2540, 1, L["Trainer"],1)
	self:addTradeSkillSpell(37836, 1, L["Trainer"],1)
	self:addTradeSkillSpell(2539, 10, L["Trainer"],1)
	self:addTradeSkillSpell(6499, 50, L["Trainer"],1)
	self:addTradeSkillSpell(2541, 50, L["Trainer"],1)
	self:addTradeSkillSpell(2544, 75, L["Trainer"],1)
	self:addTradeSkillSpell(2546, 80, L["Trainer"],1)
	self:addTradeSkillSpell(6500, 125, L["Trainer"],1)
	self:addTradeSkillSpell(21175, 200, L["Trainer"],1)

	-- Vendor Recipes
	self:addTradeSkillSpell(7751, 1, self:CombineVendors(285, 214, 215, 216, 217, 218, 219, 220, 4, false),2)
	self:addTradeSkillSpell(15935, 1, self:CombineVendors(221, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(33276, 1, self:CombineVendors(222, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(7752, 1, self:CombineVendors(223, 218, 224, 225, 226, false),2)
	self:addTradeSkillSpell(6413, 20, self:CombineVendors(227, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(6414, 35, self:CombineVendors(228, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(8607, 40, self:CombineVendors(6, 229, false),2)
	self:addTradeSkillSpell(6415, 50, self:CombineVendors(230, false), BFAC["Alliance"],2)
	self:addTradeSkillSpell(7753, 50, self:CombineVendors(215, 216, 231, 217, 232, 219, 225, 4, false),2)
	self:addTradeSkillSpell(7754, 50, self:CombineVendors(216, false), BFAC["Alliance"],2)
	self:addTradeSkillSpell(7827, 50, self:CombineVendors(285, 233, 231, 234, 223, 224, 235, 236, 237, 226, false),2)
	self:addTradeSkillSpell(33278, 50, self:CombineVendors(238, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(25704, 80, self:CombineVendors(239, 240, 241, 242, 243, 244, 245, 246, 238, 29, 232, 219, 247, 248, 249, 235, 250, 251, 252, false),2)
	self:addTradeSkillSpell(2545, 85, self:CombineVendors(253, false), BFAC["Alliance"],2)
	self:addTradeSkillSpell(6501, 90, self:CombineVendors(233, 223, false), BFAC["Alliance"],2)
	self:addTradeSkillSpell(6418, 100, self:CombineVendors(254, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(7755, 100, self:CombineVendors(285, 240, 234, 257, 232, 235, 220, false),2)
	self:addTradeSkillSpell(6419, 110, self:CombineVendors(258, 259, false),2)
	self:addTradeSkillSpell(2548, 110, self:CombineVendors(253, false), BFAC["Alliance"],2)
	self:addTradeSkillSpell(15853, 125, self:CombineVendors(260, false),2)
	self:addTradeSkillSpell(24418, 150, self:CombineVendors(261, false), BFAC["Horde"],2)
	self:addTradeSkillSpell(7213, 175, self:CombineVendors(246, false),2)
	self:addTradeSkillSpell(7828, 175, self:CombineVendors(233, 246, 257, 217, 236, 237, 225, 262, 251, false),2)
	self:addTradeSkillSpell(15855, 175, self:CombineVendors(263, 111, 116, 113, 205, 261, 259, false),2)
	self:addTradeSkillSpell(15856, 175, self:CombineVendors(264, 260, 265, false),2)
	self:addTradeSkillSpell(15861, 175, self:CombineVendors(263, 260, 205, false),2)
	self:addTradeSkillSpell(15863, 175, self:CombineVendors(197, 24, 261, 259, false),2)
	self:addTradeSkillSpell(15865, 175, self:CombineVendors(116, 266, 260, false),2)
	self:addTradeSkillSpell(20916, 175, self:CombineVendors(233, 246, 257, 217, 236, 237, 225, 262, 251, false),2)
	self:addTradeSkillSpell(25954, 175, self:CombineVendors(239, 240, 241, 242, 243, 244, 245, 246, 238, 29, 232, 219, 247, 248, 249, 235, 250, 251, 252, false),2)
	self:addTradeSkillSpell(15906, 200, self:CombineVendors(116, 261, 260, false),2)
	self:addTradeSkillSpell(15910, 200, self:CombineVendors(266, 24, 259, false),2)
	self:addTradeSkillSpell(15915, 225, self:CombineVendors(197, 223, 267, false),2)
	self:addTradeSkillSpell(15933, 225, self:CombineVendors(169, 268, 170, false),2)
	self:addTradeSkillSpell(18239, 225, self:CombineVendors(246, false),2)
	self:addTradeSkillSpell(18238, 225, self:CombineVendors(269, false),2)
	self:addTradeSkillSpell(18241, 225, self:CombineVendors(246, false),2)
	self:addTradeSkillSpell(20626, 225, self:CombineVendors(213, false),2)
	self:addTradeSkillSpell(22480, 225, self:CombineVendors(270, 271, 272, false),2)
	self:addTradeSkillSpell(18240, 240, self:CombineVendors(269, false),2)
	self:addTradeSkillSpell(18242, 240, self:CombineVendors(246, false),2)
	self:addTradeSkillSpell(18243, 250, self:CombineVendors(269, false),2)
	self:addTradeSkillSpell(18244, 250, self:CombineVendors(269, false),2)
	self:addTradeSkillSpell(46684, 250, self:CombineVendors(169, 170, false),2)
	self:addTradeSkillSpell(46688, 250, self:CombineVendors(169, 170, false),2)
	self:addTradeSkillSpell(18245, 275, self:CombineVendors(264, 265, false),2)
	self:addTradeSkillSpell(18246, 275, self:CombineVendors(264, 265, false),2)
	self:addTradeSkillSpell(18247, 275, self:CombineVendors(264, 265, false),2)
	self:addTradeSkillSpell(33284, 300, self:CombineVendors(273, 274, false),2)
	self:addTradeSkillSpell(33290, 300, self:CombineVendors(275, 276, false),2)
	self:addTradeSkillSpell(33291, 300, self:CombineVendors(275, 64, false),2)
	self:addTradeSkillSpell(33292, 310, self:CombineVendors(277, false),2)
	self:addTradeSkillSpell(33286, 310, self:CombineVendors(278, 279, false),2)
	self:addTradeSkillSpell(33293, 320, self:CombineVendors(255, 256, false),2)
	self:addTradeSkillSpell(33294, 320, self:CombineVendors(255, 256, false),2)
	self:addTradeSkillSpell(33287, 325, self:CombineVendors(255, 256, false),2)
	self:addTradeSkillSpell(33288, 325, self:CombineVendors(278, 279, false),2)
	self:addTradeSkillSpell(33289, 325, self:CombineVendors(255, 256, false),2)
	self:addTradeSkillSpell(33295, 325, self:CombineVendors(198, 200, false),2)
	self:addTradeSkillSpell(33296, 350, self:CombineVendors(198, 200, false),2)

	-- World Drops

	-- Specific Drops
	self:addTradeSkillSpell(33277, 1, self:CombineQuests(L["Roasted Moongraze Tenderloin Obt"],1,BZONE["Azuremyst Isle"]), BFAC["Alliance"],8)
	self:addTradeSkillSpell(6412, 10, self:CombineQuests(L["Kaldorei Spider Kabob Obt"],1,BZONE["Teldrassil"]), BFAC["Alliance"],8)
	self:addTradeSkillSpell(2795, 25, self:CombineQuests(L["Beer Basted Boar Ribs Obt"],1,BZONE["Dun Morogh"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(6416, 50, self:CombineQuests(L["Strider Stew Obt"],1,BZONE["Darkshore"]) .. addon.br .. self:CombineVendors(254, false),2,8)
	self:addTradeSkillSpell(2542, 50, self:CombineQuests(L["Goretusk Liver Pie Obt"],1,BZONE["Westfall"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(3371, 60, self:CombineQuests(L["Blood Sausage Obt"],1,BZONE["Loch Modan"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(9513, 60, self:CombineQuests(L["Thistle Tea Ally Obt"],1,BZONE["Westfall"],L["Thistle Tea Horde Obt"],2,BZONE["The Barrens"]) .. addon.br .. self:CombineVendors(283, false), "ROGUE",2,4,8)
	self:addTradeSkillSpell(28267, 60, self:CombineQuests(L["Crunchy Spider Surprise Obt"],2,BZONE["Ghostlands"]) .. addon.br .. self:CombineVendors(281, 238, false),2,8)
	self:addTradeSkillSpell(2543, 75, self:CombineQuests(L["Westfall Stew Obt"],1,BZONE["Westfall"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(3370, 80, self:CombineQuests(L["Crocolisk Steak Obt"],1,BZONE["Loch Modan"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(8238, 85, L["UZD"] .. BZONE["The Barrens"])
	self:addTradeSkillSpell(3372, 90, self:CombineQuests(L["Murloc Fin Soup Obt"],1,BZONE["Redridge Mountains"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(6417, 90, self:CombineQuests(L["Dig Rat Stew Obt"],2,BZONE["The Barrens"]), BFAC["Horde"],8)
	self:addTradeSkillSpell(45695, 100, L["Fishing Daily"],8)
	self:addTradeSkillSpell(2547, 100, self:CombineQuests(L["Redridge Goulash Obt"],1,BZONE["Redridge Mountains"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(2549, 100, self:CombineQuests(L["Seasoned Wolf Kabob Obt"],1,BZONE["Duskwood"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(3377, 110, self:CombineQuests(L["Gooey Spider Cake Obt"],1,BZONE["Duskwood"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(3397, 110, self:CombineQuests(L["Big Bear Steak Obt"],2,BZONE["Hillsbrad Foothills"]) .. addon.br .. self:CombineVendors(260, 258, false),2,8)
	self:addTradeSkillSpell(3373, 120, self:CombineQuests(L["Crocolisk Gumbo Obt"],1,BZONE["Wetlands"]) .. addon.br .. self:CombineVendors(253, false), BFAC["Alliance"],2,8)
	self:addTradeSkillSpell(3398, 125, self:CombineQuests(L["Hot Lion Chops Obt"],2,BZONE["Hillsbrad Foothills"]) .. addon.br .. self:CombineVendors(259, 282, false),2,8)
	self:addTradeSkillSpell(3376, 130, self:CombineQuests(L["Curiously Tasty Omelet Obt"],1,BZONE["Wetlands"]) .. addon.br .. self:CombineVendors(113, 253, 205, false),2,8)
	self:addTradeSkillSpell(3399, 150, self:CombineQuests(L["Tasty Lion Steak Obt"],1,BZONE["Hillsbrad Foothills"]), BFAC["Alliance"],8)
	self:addTradeSkillSpell(3400, 175, self:CombineQuests(L["Soothing Turtle Bisque Obt"],0,BZONE["Hillsbrad Foothills"]),8)
	self:addTradeSkillSpell(4094, 175, self:CombineQuests(L["Barbecued Buzzard Wing Obt"],0,BZONE["Badlands"]) .. addon.br .. self:CombineVendors(280, 260, false),2,8)
	self:addTradeSkillSpell(13028, 175, L["Goldthorn Tea Obt"],1)
	self:addTradeSkillSpell(22761, 275, self:CombineMobs(false,L["Runn Tum Tuber Surprise Obt"],BZONE["Dire Maul"]),4,5)
	self:addTradeSkillSpell(24801, 285, self:CombineQuests(L["Smoked Desert Dumplings Obt"],0,BZONE["Silithus"]),8)
	self:addTradeSkillSpell(25659, 300, self:CombineQuests(L["Dirge's Kickin' Chimaerok Chops Obt"],0,BZONE["Tanaris"]),6,8)
	self:addTradeSkillSpell(43779, 325, L["Cooking Daily"],8)
	self:addTradeSkillSpell(33279, 300, self:CombineQuests(L["Buzzard Bites Obt"],0,BZONE["Hellfire Peninsula"]),8)
	self:addTradeSkillSpell(43772, 300, L["Cooking Daily"],8)
	self:addTradeSkillSpell(43761, 300, L["Cooking Daily"],8)
	self:addTradeSkillSpell(43758, 300, L["Cooking Daily"],8)
	self:addTradeSkillSpell(42296, 310, L["Stewed Trout Obt"],1)
	self:addTradeSkillSpell(43765, 325, L["Cooking Daily"],8)
	self:addTradeSkillSpell(43707, 325, L["Cooking Daily"],8)
	self:addTradeSkillSpell(38868, 335, self:CombineQuests(L["Crunchy Serpent Obt"],1,BZONE["Blade's Edge Mountains"]) .. addon.br .. self:CombineVendors(284, false),2,8)
	self:addTradeSkillSpell(38867, 335, self:CombineQuests(L["Crunchy Serpent Obt"],1,BZONE["Blade's Edge Mountains"]) .. addon.br .. self:CombineVendors(284, false),2,8)
	self:addTradeSkillSpell(42302, 350, L["Stewed Trout Obt"],1)
	self:addTradeSkillSpell(42305, 350, L["Stewed Trout Obt"],1)

	-- Seasonal
	self:addTradeSkillSpell(21143, 1, L["WintersVeil"], 7)
	self:addTradeSkillSpell(21144, 35, L["WintersVeil"], 7)
	self:addTradeSkillSpell(45022, 325, L["WintersVeil"], 7)

	-- Reputations
	self:addTradeSkillSpell(36210, 300, self:AddSingleReputation(1, BFAC["Sporeggar"]), BFAC["Sporeggar"])
	self:addTradeSkillSpell(33285, 310, self:AddSingleReputation(1, BFAC["Sporeggar"]), BFAC["Sporeggar"])

	-- Raid Drops

end
