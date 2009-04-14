--[[

************************************************************************

ARL-Seasonal.lua

 Seasonal data for all of AckisRecipeList

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(SeasonDB, Season ID, Season Name)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitSeasons(SeasonDB)

	self:addLookupList(SeasonDB,1,L["Feast of Winters Veil"],"N/A")
	self:addLookupList(SeasonDB,2,L["Lunar Festival"],"N/A")
	self:addLookupList(SeasonDB,3,L["Darkmoon Faire"],"N/A")
	self:addLookupList(SeasonDB,4,L["Midsummer Fire Festival"],"N/A")
	self:addLookupList(SeasonDB,5,"Thanksgiving Seasonal Placeholder - Speculation","N/A")

end
