--[[

ARL-Seasonal.lua

 Seasonal data for all of AckisRecipeList

$Date$
$Rev$

]]--

local L			= LibStub("AceLocale-3.0"):GetLocale("Ackis Recipe List")

local addon = AckisRecipeList

function addon:InitSeasons(SeasonDB)

	self:addLookupList(SeasonDB, 1, L["Feast of Winters Veil"])
	self:addLookupList(SeasonDB, 2, L["Lunar Festival"])
	self:addLookupList(SeasonDB, 3, L["Darkmoon Faire"])
	self:addLookupList(SeasonDB, 4, L["Midsummer Fire Festival"])

end
