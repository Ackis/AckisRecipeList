--[[

************************************************************************

ARL-Reputation.lua

Reputation data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb	
Entries to this file will be overwritten

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(RepDB, Rep ID, Rep Name)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

function addon:InitReputation(RepDB)

	self:addLookupList(RepDB, 59,BFAC["Thorium Brotherhood"]) -- Acquire Flag: 98
	self:addLookupList(RepDB, 270,BFAC["Zandalar Tribe"]) -- Acquire Flag: 100
	self:addLookupList(RepDB, 529,BFAC["Argent Dawn"]) -- Acquire Flag: 96
	self:addLookupList(RepDB, 576,BFAC["Timbermaw Hold"]) -- Acquire Flag: 99
	self:addLookupList(RepDB, 609,BFAC["Cenarion Circle"]) -- Acquire Flag: 97
	self:addLookupList(RepDB, 932,BFAC["The Aldor"]) -- Acquire Flag: 101
	self:addLookupList(RepDB, 933,BFAC["The Consortium"]) -- Acquire Flag: 105
	self:addLookupList(RepDB, 934,BFAC["The Scryers"]) -- Acquire Flag: 110
	self:addLookupList(RepDB, 935,BFAC["The Sha'tar"]) -- Acquire Flag: 111
	self:addLookupList(RepDB, 941,BFAC["The Mag'har"]) -- Acquire Flag: 108
	self:addLookupList(RepDB, 942,BFAC["Cenarion Expedition"]) -- Acquire Flag: 103
	self:addLookupList(RepDB, 946,BFAC["Honor Hold"]) -- Acquire Flag: 104
	self:addLookupList(RepDB, 947,BFAC["Thrallmar"]) -- Acquire Flag: 104
	self:addLookupList(RepDB, 967,BFAC["The Violet Eye"]) -- Acquire Flag: 114
	self:addLookupList(RepDB, 970,BFAC["Sporeggar"]) -- Acquire Flag: 113
	self:addLookupList(RepDB, 978,BFAC["Kurenai"]) -- Acquire Flag: 108
	self:addLookupList(RepDB, 989,BFAC["Keepers of Time"]) -- Acquire Flag: 106
	self:addLookupList(RepDB, 990,BFAC["The Scale of the Sands"]) -- Acquire Flag: 109
	self:addLookupList(RepDB, 1011,BFAC["Lower City"]) -- Acquire Flag: 107
	self:addLookupList(RepDB, 1012,BFAC["Ashtongue Deathsworn"]) -- Acquire Flag: 102
	self:addLookupList(RepDB, 1037,BFAC["Alliance Vanguard"]) -- Acquire Flag: 131
	self:addLookupList(RepDB, 1050,BFAC["Valiance Expedition"]) -- Acquire Flag: 126
	self:addLookupList(RepDB, 1052,BFAC["Horde Expedition"]) -- Acquire Flag: 130
	self:addLookupList(RepDB, 1064,BFAC["The Taunka"]) -- Acquire Flag: 128
	self:addLookupList(RepDB, 1067,BFAC["The Hand of Vengeance"]) -- Acquire Flag: 127
	self:addLookupList(RepDB, 1068,BFAC["Explorers' League"]) -- Acquire Flag: 125
	self:addLookupList(RepDB, 1073,BFAC["The Kalu'ak"]) -- Acquire Flag: 120
	self:addLookupList(RepDB, 1077,BFAC["Shattered Sun Offensive"]) -- Acquire Flag: 112
	self:addLookupList(RepDB, 1085,BFAC["Warsong Offensive"]) -- Acquire Flag: 129
	self:addLookupList(RepDB, 1090,BFAC["Kirin Tor"]) -- Acquire Flag: 118
	self:addLookupList(RepDB, 1091,BFAC["The Wyrmrest Accord"]) -- Acquire Flag: 122
	self:addLookupList(RepDB, 1098,BFAC["Knights of the Ebon Blade"]) -- Acquire Flag: 117
	self:addLookupList(RepDB, 1104,BFAC["Frenzyheart Tribe"]) -- Acquire Flag: 116
	self:addLookupList(RepDB, 1105,BFAC["The Oracles"]) -- Acquire Flag: 121
	self:addLookupList(RepDB, 1106,BFAC["Argent Crusade"]) -- Acquire Flag: 115
	self:addLookupList(RepDB, 1119,BFAC["The Sons of Hodir"]) -- Acquire Flag: 119

end
