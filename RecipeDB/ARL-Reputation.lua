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

	self:addLookupList(RepDB, 21, BFAC["Booty Bay"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 47, BFAC["Ironforge"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 54, BFAC["Gnomeregan Exiles"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 59, BFAC["Thorium Brotherhood"]) -- Acquire Flag: 98
	self:addLookupList(RepDB, 68, BFAC["Undercity"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 69, BFAC["Darnassus"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 70, BFAC["Syndicate"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 72, BFAC["Stormwind"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 76, BFAC["Orgrimmar"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 81, BFAC["Thunder Bluff"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 87, BFAC["Bloodsail Buccaneers"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 92, BFAC["Gelkis Clan Centaur"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 93, BFAC["Magram Clan Centaur"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 270, BFAC["Zandalar Tribe"]) -- Acquire Flag: 100
	self:addLookupList(RepDB, 349, BFAC["Ravenholdt"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 369, BFAC["Gadgetzan"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 470, BFAC["Ratchet"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 471, BFAC["Wildhammer Clan"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 509, BFAC["The League of Arathor"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 510, BFAC["The Defilers"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 529, BFAC["Argent Dawn"]) -- Acquire Flag: 96
	self:addLookupList(RepDB, 530, BFAC["Darkspear Trolls"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 576, BFAC["Timbermaw Hold"]) -- Acquire Flag: 99
	self:addLookupList(RepDB, 577, BFAC["Everlook"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 589, BFAC["Wintersaber Trainers"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 609, BFAC["Cenarion Circle"]) -- Acquire Flag: 97
	self:addLookupList(RepDB, 729, BFAC["Frostwolf Clan"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 730, BFAC["Stormpike Guard"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 749, BFAC["Hydraxian Waterlords"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 809, BFAC["Shen'dralar"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 889, BFAC["Warsong Outriders"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 890, BFAC["Silverwing Sentinels"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 909, BFAC["Darkmoon Faire"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 910, BFAC["Brood of Nozdormu"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 911, BFAC["Silvermoon City"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 922, BFAC["Tranquillien"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 930, BFAC["Exodar"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 932, BFAC["The Aldor"]) -- Acquire Flag: 101
	self:addLookupList(RepDB, 933, BFAC["The Consortium"]) -- Acquire Flag: 105
	self:addLookupList(RepDB, 934, BFAC["The Scryers"]) -- Acquire Flag: 110
	self:addLookupList(RepDB, 935, BFAC["The Sha'tar"]) -- Acquire Flag: 111
	self:addLookupList(RepDB, 941, BFAC["The Mag'har"]) -- Acquire Flag: 108
	self:addLookupList(RepDB, 942, BFAC["Cenarion Expedition"]) -- Acquire Flag: 103
	self:addLookupList(RepDB, 946, BFAC["Honor Hold"]) -- Acquire Flag: 104
	self:addLookupList(RepDB, 947, BFAC["Thrallmar"]) -- Acquire Flag: 104
	self:addLookupList(RepDB, 967, BFAC["The Violet Eye"]) -- Acquire Flag: 114
	self:addLookupList(RepDB, 970, BFAC["Sporeggar"]) -- Acquire Flag: 113
	self:addLookupList(RepDB, 978, BFAC["Kurenai"]) -- Acquire Flag: 108
	self:addLookupList(RepDB, 989, BFAC["Keepers of Time"]) -- Acquire Flag: 106
	self:addLookupList(RepDB, 990, BFAC["The Scale of the Sands"]) -- Acquire Flag: 109
	self:addLookupList(RepDB, 1011, BFAC["Lower City"]) -- Acquire Flag: 107
	self:addLookupList(RepDB, 1012, BFAC["Ashtongue Deathsworn"]) -- Acquire Flag: 102
	self:addLookupList(RepDB, 1015, BFAC["Netherwing"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 1031, BFAC["Sha'tari Skyguard"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 1038, BFAC["Ogri'la"]) -- Acquire Flag: 
	self:addLookupList(RepDB, 1077, BFAC["Shattered Sun Offensive"]) -- Acquire Flag: 112

end
