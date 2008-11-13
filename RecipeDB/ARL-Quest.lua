--[[

************************************************************************

ARL-Quest.lua

Quest data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

77 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(QuestDB, NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitQuest(QuestDB)

	self:addLookupList(QuestDB, 22, L["Goretusk Liver Pie"], BZONE["Westfall"], 55.77, 30.92, 1)
	self:addLookupList(QuestDB, 38, L["Westfall Stew"], BZONE["Westfall"], 55.77, 30.92, 1)
	self:addLookupList(QuestDB, 90, L["Seasoned Wolf Kabobs"], BZONE["Duskwood"], 73.65, 43.18, 1)
	self:addLookupList(QuestDB, 92, L["Redridge Goulash"], BZONE["Redridge Mountains"], 22.84, 44.07, 1)
	self:addLookupList(QuestDB, 93, L["Dusky Crab Cakes"], BZONE["Duskwood"], 73.65, 43.18, 1)
	self:addLookupList(QuestDB, 127, L["Selling Fish"], BZONE["Redridge Mountains"], 28.24, 47.60, 1)
	self:addLookupList(QuestDB, 296, L["Ormer's Revenge"], BZONE["Wetlands"], 38.02, 51.17, 1)
	self:addLookupList(QuestDB, 384, L["Beer Basted Boar Ribs"], BZONE["Dun Morogh"], 47.18, 53.33, 1)
	self:addLookupList(QuestDB, 385, L["Crocolisk Hunting"], BZONE["Loch Modan"], 82.16, 61.94, 1)
	self:addLookupList(QuestDB, 418, L["Thelsamar Blood Sausages"], BZONE["Loch Modan"], 35.09, 49.06, 1)
	self:addLookupList(QuestDB, 429, L["Wild Hearts"], BZONE["Silverpine Forest"], 43.49, 41.06, 2)
	self:addLookupList(QuestDB, 471, L["Apprentice's Duties"], BZONE["Wetlands"], 8.931, 56.09, 1)
	self:addLookupList(QuestDB, 498, L["The Rescue"], BZONE["Hillsbrad Foothills"], 63.15, 20.31, 2)
	self:addLookupList(QuestDB, 501, L["Elixir of Pain"], BZONE["Hillsbrad Foothills"], 61.61, 19.08, 2)
	self:addLookupList(QuestDB, 555, L["Soothing Turtle Bisque"], BZONE["Hillsbrad Foothills"], 52.10, 58.74, 1)
	self:addLookupList(QuestDB, 564, L["Costly Menace"], BZONE["Hillsbrad Foothills"], 52.07, 56.27, 1)
	self:addLookupList(QuestDB, 703, L["Barbecued Buzzard Wings"], BZONE["Badlands"], 42.27, 53.03, 0)
	self:addLookupList(QuestDB, 715, L["Liquid Stone"], BZONE["Badlands"], 26.47, 45.31, 0)
	self:addLookupList(QuestDB, 769, L["Kodo Hide Bag"], BZONE["Thunder Bluff"], 43.89, 44.70, 2)
	self:addLookupList(QuestDB, 862, L["Dig Rat Stew"], BZONE["The Barrens"], 55.04, 32.21, 2)
	self:addLookupList(QuestDB, 1487, L["Deviate Eradication"], BZONE["The Barrens"], 46.27, 36.63, 0)
	self:addLookupList(QuestDB, 1559, L["Flash Bomb Recipe"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 1578, L["Supplying the Front"], BZONE["Loch Modan"], 22.96, 74.85, 1)
	self:addLookupList(QuestDB, 1582, L["Moonglow Vest"], BZONE["Darnassus"], 64.76, 22.19, 1)
	self:addLookupList(QuestDB, 1618, L["Gearing Redridge"], BZONE["Redridge Mountains"], 31.37, 47.33, 1)
	self:addLookupList(QuestDB, 2178, L["Easy Strider Living"], BZONE["Darkshore"], 37.86, 41.52, 1)
	self:addLookupList(QuestDB, 2751, L["Barbaric Battlements"], BZONE["Orgrimmar"], 79.25, 23.85, 2)
	self:addLookupList(QuestDB, 2752, L["On Iron Pauldrons"], BZONE["Orgrimmar"], 79.25, 23.85, 2)
	self:addLookupList(QuestDB, 2753, L["Trampled Under Foot"], BZONE["Orgrimmar"], 79.25, 23.85, 2)
	self:addLookupList(QuestDB, 2754, L["Horns of Frenzy"], BZONE["Orgrimmar"], 79.25, 23.85, 2)
	self:addLookupList(QuestDB, 2755, L["Joys of Omosh"], BZONE["Orgrimmar"], 79.25, 23.85, 2)
	self:addLookupList(QuestDB, 2756, L["The Old Ways"], BZONE["Orgrimmar"], 80.29, 22.67, 2)
	self:addLookupList(QuestDB, 2758, L["The Origins of Smithing"], BZONE["Stormwind City"], 57.24, 16.42, 1)
	self:addLookupList(QuestDB, 2761, L["Smelt On, Smelt Off"], BZONE["Stranglethorn Vale"], 49.98, 20.97, 0)
	self:addLookupList(QuestDB, 2762, L["The Great Silver Deceiver"], BZONE["Stranglethorn Vale"], 49.98, 20.97, 0)
	self:addLookupList(QuestDB, 2763, L["The Art of the Imbue"], BZONE["Stranglethorn Vale"], 49.98, 20.97, 0)
	self:addLookupList(QuestDB, 2848, L["Wild Leather Shoulders"], BZONE["Feralas"], 30.02, 42.92, 1)
	self:addLookupList(QuestDB, 2849, L["Wild Leather Vest"], BZONE["Feralas"], 30.02, 42.92, 1)
	self:addLookupList(QuestDB, 2850, L["Wild Leather Helmet"], BZONE["Feralas"], 30.02, 42.92, 1)
	self:addLookupList(QuestDB, 2851, L["Wild Leather Boots"], BZONE["Feralas"], 30.02, 42.92, 1)
	self:addLookupList(QuestDB, 2852, L["Wild Leather Leggings"], BZONE["Feralas"], 30.02, 42.92, 1)
	self:addLookupList(QuestDB, 2853, L["Master of the Wild Leather"], BZONE["Darnassus"], 64.30, 21.93, 1)
	self:addLookupList(QuestDB, 2855, L["Wild Leather Shoulders"], BZONE["Feralas"], 74.78, 45.15, 2)
	self:addLookupList(QuestDB, 2856, L["Wild Leather Vest"], BZONE["Feralas"], 74.78, 45.15, 2)
	self:addLookupList(QuestDB, 2857, L["Wild Leather Helmet"], BZONE["Feralas"], 74.78, 45.15, 2)
	self:addLookupList(QuestDB, 2858, L["Wild Leather Boots"], BZONE["Feralas"], 74.78, 45.15, 2)
	self:addLookupList(QuestDB, 2859, L["Wild Leather Leggings"], BZONE["Feralas"], 74.78, 45.15, 2)
	self:addLookupList(QuestDB, 2860, L["Master of the Wild Leather"], BZONE["Thunder Bluff"], 42.37, 43.58, 2)
	self:addLookupList(QuestDB, 3402, L["The Undermarket"], BZONE["Tanaris"], 50.98, 27.10, 0)
	self:addLookupList(QuestDB, 4161, L["Recipe of the Kaldorei"], BZONE["Teldrassil"], 57.16, 61.48, 1)
	self:addLookupList(QuestDB, 5124, L["Fiery Plate Gauntlets"], BZONE["Winterspring"], 60.68, 38.66, 0)
	self:addLookupList(QuestDB, 5127, L["The Demon Forge"], BZONE["Winterspring"], 63.73, 73.71, 1)
	self:addLookupList(QuestDB, 5305, L["Sweet Serenity"], BZONE["Winterspring"], 61.20, 35.97, 0)
	self:addLookupList(QuestDB, 5306, L["Snakestone of the Shadow Huntress"], BZONE["Winterspring"], 61.42, 37.04, 0)
	self:addLookupList(QuestDB, 5307, L["Corruption"], BZONE["Winterspring"], 61.32, 39.12, 0)
	self:addLookupList(QuestDB, 7321, L["Soothing Turtle Bisque"], BZONE["Hillsbrad Foothills"], 62.65, 19.59, 2)
	self:addLookupList(QuestDB, 7604, L["A Binding Contract"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7649, L["Enchanted Thorium Platemail: Volume I"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7650, L["Enchanted Thorium Platemail: Volume II"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7651, L["Enchanted Thorium Platemail: Volume III"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7653, L["Imperial Plate Belt"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7654, L["Imperial Plate Boots"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7655, L["Imperial Plate Bracer"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7656, L["Imperial Plate Chest"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7657, L["Imperial Plate Helm"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7658, L["Imperial Plate Leggings"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7659, L["Imperial Plate Shoulders"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 8586, L["Dirge's Kickin' Chimaerok Chops"], BZONE["The Hinterlands"], 37.87, 54.24, 0)
	self:addLookupList(QuestDB, 8882, L["Cluster Launcher"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 9171, L["Culinary Crunch"], BZONE["Ghostlands"], 47.88, 31.21, 2)
	self:addLookupList(QuestDB, 9249, L["40 Tickets - Schematic: Steam Tonk Controller"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 9356, L["Smooth as Butter"], BZONE["Hellfire Peninsula"], 49.06, 74.09, 0)
	self:addLookupList(QuestDB, 9454, L["The Great Moongraze Hunt"], BZONE["Bloodmyst Isle"], 53.71, 54.93, 1)
	self:addLookupList(QuestDB, 9635, L["The Zapthrottle Mote Extractor!"], BZONE["Zangarmarsh"], 34.39, 51.28, 2)
	self:addLookupList(QuestDB, 9636, L["The Zapthrottle Mote Extractor!"], BZONE["Zangarmarsh"], 68.48, 51.19, 1)
	self:addLookupList(QuestDB, 10860, L["Mok'Nathal Treats"], BZONE["Blade's Edge Mountains"], 76.06, 61.84, 2)
	self:addLookupList(QuestDB, 12645, L["The Taste Test"], L["Unknown Zone"], 0, 0, 0)

end
