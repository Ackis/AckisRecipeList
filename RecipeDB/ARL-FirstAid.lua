--[[

ARL-FirstAId.lua

First Aid data for all of AckisRecipeList

$Date$
$Rev$

]]--

local L			= LibStub("AceLocale-3.0"):GetLocale("Ackis Recipe List")
local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

local addon = AckisRecipeList

function addon:InitFirstAid()
 
	-- Trainer Recipes
	self:addTradeSkillSpell(3275, 1, L["Trainer"],1)
	self:addTradeSkillSpell(3276, 40, L["Trainer"],1)
	self:addTradeSkillSpell(3277, 80, L["Trainer"],1)
	self:addTradeSkillSpell(7934, 80, L["Trainer"],1)
	self:addTradeSkillSpell(3278, 115, L["Trainer"],1)
	self:addTradeSkillSpell(7928, 150, L["Trainer"],1)
	self:addTradeSkillSpell(10841, 240, L["Trainer"],1)
	self:addTradeSkillSpell(18629, 260, L["Trainer"],1)
	self:addTradeSkillSpell(18630, 290, L["Trainer"],1)

	-- Vendor Recipes
	self:addTradeSkillSpell(7929, 180, self:CombineVendors(165, 166, false),2)
	self:addTradeSkillSpell(10840, 210, self:CombineVendors(165, 166, false),2)
	self:addTradeSkillSpell(27032, 330, self:CombineVendors(167, 168, false),2)
	self:addTradeSkillSpell(27033, 360, self:CombineVendors(167, 168, false),2)

	-- World Drops
	self:addTradeSkillSpell(7935, 130, L["UWD"],3)

	-- Reputations
	self:addTradeSkillSpell(23787, 300, self:AddSingleReputation(2, BFAC["Argent Dawn"]), BFAC["Argent Dawn"])

	if (addon.wrath) then
		self:addTradeSkillSpell(45545, 350, L["Trainer"],1)
		self:addTradeSkillSpell(45546, 300, L["Trainer"],1)
		self:addTradeSkillSpell(51801, 450, L["UWD"],3)
	end

end
