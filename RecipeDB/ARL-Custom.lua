--[[

************************************************************************

ARL-Custom.lua

Custom acquire data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb	
Entries to this file will be overwritten

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(CustomDB, Rep ID, Rep Name)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitCustom(CustomDB)

	self:addLookupList(CustomDB, 1, L["Custom1"])
	self:addLookupList(CustomDB, 2, L["Custom2"])
	self:addLookupList(CustomDB, 3, L["Custom3"])
	self:addLookupList(CustomDB, 4, L["Custom4"])
	self:addLookupList(CustomDB, 5, L["Custom5"])
	self:addLookupList(CustomDB, 6, L["Custom6"])
	self:addLookupList(CustomDB, 7, L["Custom7"])
	self:addLookupList(CustomDB, 8, L["Custom8"])
	self:addLookupList(CustomDB, 9, L["Custom9"])
	self:addLookupList(CustomDB, 10, L["Custom10"])
	self:addLookupList(CustomDB, 11, L["Custom11"])
	self:addLookupList(CustomDB, 12, L["Custom12"])
	self:addLookupList(CustomDB, 13, L["Custom13"])
	self:addLookupList(CustomDB, 14, L["Custom14"])
	self:addLookupList(CustomDB, 15, L["Custom15"])
	self:addLookupList(CustomDB, 16, L["Custom16"])
	self:addLookupList(CustomDB, 17, L["Custom17"])
	self:addLookupList(CustomDB, 18, L["Custom18"])
	self:addLookupList(CustomDB, 19, L["Custom19"])
	self:addLookupList(CustomDB, 20, L["Custom20"])
	self:addLookupList(CustomDB, 21, L["Custom21"])
	self:addLookupList(CustomDB, 22, L["Custom22"])
	self:addLookupList(CustomDB, 23, L["Custom23"])
	self:addLookupList(CustomDB, 24, L["Custom24"])
	self:addLookupList(CustomDB, 25, L["Custom25"])
	self:addLookupList(CustomDB, 26, L["Custom26"])
	self:addLookupList(CustomDB, 27, L["Custom27"])
	self:addLookupList(CustomDB, 28, L["Custom28"])
	self:addLookupList(CustomDB, 29, L["Custom29"])
	self:addLookupList(CustomDB, 30, L["Custom30"])
	self:addLookupList(CustomDB, 31, L["Custom31"])

end

