--[[

************************************************************************

ARL-Custom.lua

Custom acquire data for all of Ackis Recipe List

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(CustomDB, Rep ID, Rep Name)

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BZONE		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

function addon:InitCustom(CustomDB)

	-- Alchemy Discoveries
	self:addLookupList(CustomDB,1,L["DISCOVERY_ALCH_ELIXIRFLASK"],"N/A")
	self:addLookupList(CustomDB,2,L["DISCOVERY_ALCH_POTION"],"N/A")
	self:addLookupList(CustomDB,3,L["DISCOVERY_ALCH_XMUTE"],"N/A")
	self:addLookupList(CustomDB,4,L["DISCOVERY_ALCH_PROT"],"N/A")
	-- Cooking/Fishing Daily Quests
	self:addLookupList(CustomDB,5,L["DAILY_COOKING_MEAT"],BZONE["Shattrath"],0,0)
	self:addLookupList(CustomDB,6,L["DAILY_COOKING_FISH"],BZONE["Shattrath"],0,0)
	self:addLookupList(CustomDB,7,L["DAILY_FISHING_SHATT"],BZONE["Shattrath"],0,0)
	self:addLookupList(CustomDB,8,L["DEFAULT_RECIPE"],"N/A")
	self:addLookupList(CustomDB,9,L["CRAFTED_ENGINEERS"],"N/A")
	self:addLookupList(CustomDB,10,L["ONYXIA_HEAD_QUEST"],BZONE["Onyxia's Lair"],0,0)
	self:addLookupList(CustomDB,11,L["EDGE_OF_MADNESS"],BZONE["Zul'Gurub"],0,0)
	self:addLookupList(CustomDB,12,L["Custom12"],"N/A")
	self:addLookupList(CustomDB,13,L["Custom13"],"N/A")
	self:addLookupList(CustomDB,14,L["Custom14"],"N/A")
	self:addLookupList(CustomDB,15,L["Custom15"],"N/A")
	self:addLookupList(CustomDB,16,L["Custom16"],"N/A")
	self:addLookupList(CustomDB,17,L["Custom17"],"N/A")
	self:addLookupList(CustomDB,18,L["Custom18"],"N/A")
	self:addLookupList(CustomDB,19,L["Custom19"],"N/A")
	self:addLookupList(CustomDB,20,L["Custom20"],"N/A")
	self:addLookupList(CustomDB,21,L["Custom21"],"N/A")
	self:addLookupList(CustomDB,22,L["Custom22"],"N/A")
	self:addLookupList(CustomDB,23,L["Custom23"],"N/A")
	self:addLookupList(CustomDB,24,L["Custom24"],"N/A")
	self:addLookupList(CustomDB,25,L["Custom25"],"N/A")
	self:addLookupList(CustomDB,26,L["Custom26"],"N/A")
	--self:addLookupList(CustomDB,27,L["Custom27"],"N/A")
	self:addLookupList(CustomDB,28,L["Custom28"],"N/A")
	self:addLookupList(CustomDB,29,L["Custom29"],"N/A")
	self:addLookupList(CustomDB,30,L["Custom30"],"N/A")
	self:addLookupList(CustomDB,31,L["Custom31"],"N/A")
	self:addLookupList(CustomDB,32,L["Custom32"],"N/A")
	self:addLookupList(CustomDB,33,L["Custom33"],"N/A")
	self:addLookupList(CustomDB,34,L["Custom34"],"N/A")
	self:addLookupList(CustomDB,35,L["Custom35"],"N/A")
	self:addLookupList(CustomDB,36,L["Custom36"],"N/A")
	self:addLookupList(CustomDB,37,L["Custom37"],"N/A")
	self:addLookupList(CustomDB,38,L["Custom38"],"N/A")
	self:addLookupList(CustomDB,39,L["Custom39"],"N/A")
	self:addLookupList(CustomDB,40,L["Custom40"],"N/A")
	self:addLookupList(CustomDB,41,L["Custom41"],"N/A")
	self:addLookupList(CustomDB,42,L["Custom42"],"N/A")	

end

