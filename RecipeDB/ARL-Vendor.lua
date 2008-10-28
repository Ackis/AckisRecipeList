--[[

************************************************************************

ARL-Vendor.lua

Vendor data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

7 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(VendorDB, NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitVendor(VendorDB)

	self:addLookupList(VendorDB, 2805, L["Deneb Walker"], BZONE["Arathi Highlands"], 26.79, 57.63, 1)
	self:addLookupList(VendorDB, 10856, L["Argent Quartermaster Hasana"], BZONE["Tirisfal Glades"], 80.20, 66.13, 0)
	self:addLookupList(VendorDB, 10857, L["Argent Quartermaster Lightspark"], BZONE["Western Plaguelands"], 42.64, 82.62, 0)
	self:addLookupList(VendorDB, 11536, L["Quartermaster Miranda Breechlock"], BZONE["Eastern Plaguelands"], 81.06, 58.89, 0)
	self:addLookupList(VendorDB, 13476, L["Balai Lok'Wein"], BZONE["Dustwallow Marsh"], 35.90, 30.83, 2)
	self:addLookupList(VendorDB, 18990, L["Burko"], BZONE["Hellfire Peninsula"], 22.82, 38.94, 1)
	self:addLookupList(VendorDB, 18991, L["Aresella"], BZONE["Hellfire Peninsula"], 26.14, 62.14, 2)

end
