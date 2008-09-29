--[[

ARL-RuneForge.lua

Runeforging data for all of AckisRecipeList

$Date$
$Rev$

]]--

local L			= LibStub("AceLocale-3.0"):GetLocale("Ackis Recipe List")

local addon = AckisRecipeList

function addon:InitRuneforging()
	self:addTradeSkillSpell(53323, 1, L["Trainer"],1)
	self:addTradeSkillSpell(53331, 1, L["Trainer"],1)
	self:addTradeSkillSpell(53341, 1, L["Trainer"],1)
	self:addTradeSkillSpell(53342, 1, L["Trainer"],1)
	self:addTradeSkillSpell(53343, 1, L["Trainer"],1)
	self:addTradeSkillSpell(53344, 1, L["Trainer"],1)
	self:addTradeSkillSpell(54446, 1, L["Trainer"],1)
	self:addTradeSkillSpell(54447, 1, L["Trainer"],1)
end
