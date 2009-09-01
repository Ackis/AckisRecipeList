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
	self:addLookupList(CustomDB,12,L["DISCOVERY_ALCH_WRATH"],"N/A")
	self:addLookupList(CustomDB,18,L["DISCOVERY_ALCH_NORTHREND_RESEARCH"],"N/A")
	self:addLookupList(CustomDB,19,L["DISCOVERY_ALCH_NORTHREND_XMUTE"],"N/A")
	-- Inscription Discoveries
	self:addLookupList(CustomDB,14,L["DISCOVERY_INSC_MINOR"],"N/A")
	self:addLookupList(CustomDB,15,L["DISCOVERY_INSC_NORTHREND"],"N/A")
	self:addLookupList(CustomDB,40,L["DISCOVERY_INSC_BOOK"],"N/A")
	-- Cooking/Fishing Daily Quests
	self:addLookupList(CustomDB,5,L["DAILY_COOKING_MEAT"],BZONE["Shattrath"],0,0)
	self:addLookupList(CustomDB,6,L["DAILY_COOKING_FISH"],BZONE["Shattrath"],0,0)
	self:addLookupList(CustomDB,7,L["DAILY_FISHING_SHATT"],BZONE["Shattrath"],0,0)
	self:addLookupList(CustomDB,38,L["DAILY_COOKING_DAL"],BZONE["Dalaran"],0,0)
	-- Engineering Related
	self:addLookupList(CustomDB,16,L["ENG_RENEW_MEMBERSHIP"],"N/A")
	self:addLookupList(CustomDB,17,L["ENG_FLOOR_ITEM_BRD"],BZONE["Blackrock Depths"],0,0)
	-- Default
	self:addLookupList(CustomDB,8,L["DEFAULT_RECIPE"],"N/A")
	-- Crafted by other professions
	self:addLookupList(CustomDB,9,L["CRAFTED_ENGINEERS"],"N/A")
	-- Instances
	self:addLookupList(CustomDB,13,L["HENRY_STERN_RFD"],BZONE["Razorfen Downs"],0,0)
	self:addLookupList(CustomDB,23,L["DM_CACHE"],BZONE["Dire Maul"],59.04,48.82)
	self:addLookupList(CustomDB,25,L["BRD_RANDOM_ROOM"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(CustomDB,30,L["SCHOLO_BOOK_SPAWN"],BZONE["Scholomance"],0,0)
	self:addLookupList(CustomDB,31,L["STRATH_BS_PLANS"],BZONE["Stratholme"],0,0)
	self:addLookupList(CustomDB,32,L["DM_TRIBUTE"],BZONE["Dire Maul"],59.04,48.82)
	self:addLookupList(CustomDB,33,L["WORLD_DRAGONS"],"N/A")
	-- Quests
	self:addLookupList(CustomDB,10,L["ONYXIA_HEAD_QUEST"],BZONE["Onyxia's Lair"],0,0)
	self:addLookupList(CustomDB,11,L["EDGE_OF_MADNESS"],BZONE["Zul'Gurub"],0,0)
	-- Raids
	self:addLookupList(CustomDB,22,L["AQ40_RANDOM_BOP"],BZONE["Temple of Ahn'Qiraj"],0,0)
	self:addLookupList(CustomDB,24,L["SUNWELL_RANDOM"],BZONE["Sunwell"],0,0)
	self:addLookupList(CustomDB,26,L["MC_RANDOM"],BZONE["Molten Core"],0,0)
	self:addLookupList(CustomDB,27,L["HYJAL_RANDOM"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(CustomDB,29,L["ZA_RANDOM"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(CustomDB,34,L["BT_RANDOM"],BZONE["Black Temple"],0,0)
	self:addLookupList(CustomDB,37,L["SSC_RANDOM"],BZONE["Serpentshrine Cavern"],0,0)
	self:addLookupList(CustomDB,43,L["TK_RANDOM"],BZONE["The Eye"],0,0)
	self:addLookupList(CustomDB,39,L["ULDUAR_RANDOM"],BZONE["Ulduar"],0,0)
	self:addLookupList(CustomDB,42,L["TOC25_RANDOM"],"N/A")

	self:addLookupList(CustomDB,20,L["Custom20"],"N/A")
	self:addLookupList(CustomDB,21,L["Custom21"],"N/A")
	self:addLookupList(CustomDB,35,L["Custom35"],"N/A")
	self:addLookupList(CustomDB,36,L["Custom36"],"N/A")
	self:addLookupList(CustomDB,41,L["Custom41"],"N/A")
--self:addLookupList(CustomDB,28,L["BT_HYJAL_RANDOM"],"N/A")
--[[
L["Custom20"] = "Goblin transport." -- Update
L["Custom21"] = "Gnome transport." -- Update
L["Custom35"] = "Drops from dragons in Ogri'la and Blade's Edge Mountains Summon Bosses"
L["Custom36"] = "From a NPC in Dalaran sewers after doing The Taste Test" -- Update
L["Custom38"] = "Randomly obtained by completing the cooking daily quest in Dalaran."
L["Custom41"] = "Removed from the game when Naxx 40 was taken out."
]]--
end

