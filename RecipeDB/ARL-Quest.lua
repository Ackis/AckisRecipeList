--[[

************************************************************************

ARL-Quest.lua

Quest data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

79 found from data mining.  0 ignored.

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

	self:addLookupList(QuestDB, 22, L["Goretusk Liver Pie"], BZONE["Westfall"], 55.23, 32.43, 1)
	self:addLookupList(QuestDB, 38, L["Westfall Stew"], BZONE["Westfall"], 55.23, 32.43, 1)
	self:addLookupList(QuestDB, 90, L["Seasoned Wolf Kabobs"], BZONE["Duskwood"], 73.90, 45.07, 1)
	self:addLookupList(QuestDB, 92, L["Redridge Goulash"], BZONE["Redridge Mountains"], 22.71, 44.05, 1)
	self:addLookupList(QuestDB, 93, L["Dusky Crab Cakes"], BZONE["Duskwood"], 73.90, 45.07, 1)
	self:addLookupList(QuestDB, 127, L["Selling Fish"], BZONE["Redridge Mountains"], 27.15, 47.03, 1)
	self:addLookupList(QuestDB, 296, L["Ormer's Revenge"], BZONE["Wetlands"], 37.91, 50.56, 1)
	self:addLookupList(QuestDB, 384, L["Beer Basted Boar Ribs"], BZONE["Dun Morogh"], 46.97, 52.54, 1)
	self:addLookupList(QuestDB, 385, L["Crocolisk Hunting"], BZONE["Loch Modan"], 81.88, 61.88, 1)
	self:addLookupList(QuestDB, 418, L["Thelsamar Blood Sausages"], BZONE["Loch Modan"], 35.68, 48.99, 1)
	self:addLookupList(QuestDB, 429, L["Wild Hearts"], BZONE["Silverpine Forest"], 53.25, 13.89, 2)
	self:addLookupList(QuestDB, 471, L["Apprentice's Duties"], BZONE["Wetlands"], 8.594, 55.81, 1)
	self:addLookupList(QuestDB, 498, L["The Rescue"], BZONE["Hillsbrad Foothills"], 63.42, 22.04, 2)
	self:addLookupList(QuestDB, 501, L["Elixir of Pain"], BZONE["Hillsbrad Foothills"], 60.93, 20.52, 2)
	self:addLookupList(QuestDB, 555, L["Soothing Turtle Bisque"], BZONE["Hillsbrad Foothills"], 50.62, 58.73, 1)
	self:addLookupList(QuestDB, 564, L["Costly Menace"], BZONE["Hillsbrad Foothills"], 52.80, 55.77, 1)
	self:addLookupList(QuestDB, 703, L["Barbecued Buzzard Wings"], BZONE["Badlands"], 42.50, 52.23, 0)
	self:addLookupList(QuestDB, 715, L["Liquid Stone"], BZONE["Badlands"], 25.87, 43.92, 0)
	self:addLookupList(QuestDB, 769, L["Kodo Hide Bag"], BZONE["Thunder Bluff"], 43.59, 43.21, 2)
	self:addLookupList(QuestDB, 862, L["Dig Rat Stew"], BZONE["The Barrens"], 54.84, 31.88, 2)
	self:addLookupList(QuestDB, 1487, L["Deviate Eradication"], BZONE["The Barrens"], 22.96, 18.19, 0)
	self:addLookupList(QuestDB, 1559, L["Flash Bomb Recipe"], BZONE["Badlands"], 42.50, 52.23, 0)
	self:addLookupList(QuestDB, 1578, L["Supplying the Front"], BZONE["Ironforge"], 48.67, 42.45, 1)
	self:addLookupList(QuestDB, 1582, L["Moonglow Vest"], BZONE["Darnassus"], 63.32, 22.15, 1)
	self:addLookupList(QuestDB, 1618, L["Gearing Redridge"], BZONE["Ironforge"], 48.67, 42.45, 1)
	self:addLookupList(QuestDB, 2178, L["Easy Strider Living"], BZONE["Darkshore"], 37.67, 39.93, 1)
	self:addLookupList(QuestDB, 2359, L["Klaven's Tower"], BZONE["Westfall"], 68.60, 70.13, 1)
	self:addLookupList(QuestDB, 2478, L["Mission: Possible But Not Probable"], BZONE["The Barrens"], 55.03, 6.194, 2)
	self:addLookupList(QuestDB, 2751, L["Barbaric Battlements"], BZONE["Orgrimmar"], 78.61, 21.11, 2)
	self:addLookupList(QuestDB, 2752, L["On Iron Pauldrons"], BZONE["Orgrimmar"], 78.61, 21.11, 2)
	self:addLookupList(QuestDB, 2753, L["Trampled Under Foot"], BZONE["Orgrimmar"], 78.61, 21.11, 2)
	self:addLookupList(QuestDB, 2754, L["Horns of Frenzy"], BZONE["Orgrimmar"], 78.61, 21.11, 2)
	self:addLookupList(QuestDB, 2755, L["Joys of Omosh"], BZONE["Orgrimmar"], 78.61, 21.11, 2)
	self:addLookupList(QuestDB, 2758, L["The Origins of Smithing"], BZONE["Stormwind City"], 55.93, 16.16, 1)
	self:addLookupList(QuestDB, 2761, L["Smelt On, Smelt Off"], BZONE["Stranglethorn Vale"], 50.65, 20.87, 0)
	self:addLookupList(QuestDB, 2762, L["The Great Silver Deceiver"], BZONE["Stranglethorn Vale"], 50.65, 20.87, 0)
	self:addLookupList(QuestDB, 2763, L["The Art of the Imbue"], BZONE["Stranglethorn Vale"], 50.65, 20.87, 0)
	self:addLookupList(QuestDB, 2848, L["Wild Leather Shoulders"], BZONE["Feralas"], 29.85, 43.24, 1)
	self:addLookupList(QuestDB, 2849, L["Wild Leather Vest"], BZONE["Feralas"], 29.85, 43.24, 1)
	self:addLookupList(QuestDB, 2850, L["Wild Leather Helmet"], BZONE["Feralas"], 29.85, 43.24, 1)
	self:addLookupList(QuestDB, 2851, L["Wild Leather Boots"], BZONE["Feralas"], 29.85, 43.24, 1)
	self:addLookupList(QuestDB, 2852, L["Wild Leather Leggings"], BZONE["Feralas"], 29.85, 43.24, 1)
	self:addLookupList(QuestDB, 2853, L["Master of the Wild Leather"], BZONE["Feralas"], 29.85, 43.24, 1)
	self:addLookupList(QuestDB, 2855, L["Wild Leather Shoulders"], BZONE["Feralas"], 74.79, 43.29, 2)
	self:addLookupList(QuestDB, 2856, L["Wild Leather Vest"], BZONE["Feralas"], 74.79, 43.29, 2)
	self:addLookupList(QuestDB, 2857, L["Wild Leather Helmet"], BZONE["Feralas"], 74.79, 43.29, 2)
	self:addLookupList(QuestDB, 2858, L["Wild Leather Boots"], BZONE["Feralas"], 74.79, 43.29, 2)
	self:addLookupList(QuestDB, 2859, L["Wild Leather Leggings"], BZONE["Feralas"], 74.79, 43.29, 2)
	self:addLookupList(QuestDB, 2860, L["Master of the Wild Leather"], BZONE["Feralas"], 74.79, 43.29, 2)
	self:addLookupList(QuestDB, 3402, L["The Undermarket"], BZONE["Searing Gorge"], 40.27, 73.69, 0)
	self:addLookupList(QuestDB, 4161, L["Recipe of the Kaldorei"], BZONE["Teldrassil"], 57.00, 62.09, 1)
	self:addLookupList(QuestDB, 5124, L["Fiery Plate Gauntlets"], BZONE["Winterspring"], 60.85, 37.70, 0)
	self:addLookupList(QuestDB, 5127, L["The Demon Forge"], BZONE["Winterspring"], 62.93, 72.97, 0)
	self:addLookupList(QuestDB, 5305, L["Sweet Serenity"], BZONE["Winterspring"], 61.19, 36.90, 0)
	self:addLookupList(QuestDB, 5306, L["Snakestone of the Shadow Huntress"], BZONE["Winterspring"], 61.04, 38.15, 0)
	self:addLookupList(QuestDB, 5307, L["Corruption"], BZONE["Winterspring"], 61.21, 38.00, 0)
	self:addLookupList(QuestDB, 7321, L["Soothing Turtle Bisque"], BZONE["Hillsbrad Foothills"], 62.26, 20.64, 2)
	self:addLookupList(QuestDB, 7604, L["A Binding Contract"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7649, L["Enchanted Thorium Platemail: Volume I"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7650, L["Enchanted Thorium Platemail: Volume II"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7651, L["Enchanted Thorium Platemail: Volume III"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7653, L["Imperial Plate Belt"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 7654, L["Imperial Plate Boots"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 7655, L["Imperial Plate Bracer"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 7656, L["Imperial Plate Chest"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 7657, L["Imperial Plate Helm"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 7658, L["Imperial Plate Leggings"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 7659, L["Imperial Plate Shoulders"], BZONE["Tanaris"], 51.93, 28.83, 0)
	self:addLookupList(QuestDB, 8586, L["Dirge's Kickin' Chimaerok Chops"], BZONE["Tanaris"], 52.51, 28.42, 0)
	self:addLookupList(QuestDB, 8882, L["Cluster Launcher"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 9171, L["Culinary Crunch"], BZONE["Ghostlands"], 48.13, 31.09, 2)
	self:addLookupList(QuestDB, 9249, L["40 Tickets - Schematic: Steam Tonk Controller"], BZONE["Mulgore"], 36.92, 37.01, 0)
	self:addLookupList(QuestDB, 9356, L["Smooth as Butter"], BZONE["Hellfire Peninsula"], 48.94, 74.32, 0)
	self:addLookupList(QuestDB, 9454, L["The Great Moongraze Hunt"], BZONE["Bloodmyst Isle"], 51.73, 52.47, 1)
	self:addLookupList(QuestDB, 9635, L["The Zapthrottle Mote Extractor!"], BZONE["Zangarmarsh"], 33.62, 50.33, 2)
	self:addLookupList(QuestDB, 9636, L["The Zapthrottle Mote Extractor!"], BZONE["Zangarmarsh"], 67.63, 49.50, 1)
	self:addLookupList(QuestDB, 10860, L["Mok'Nathal Treats"], BZONE["Blade's Edge Mountains"], 75.31, 60.93, 2)
	self:addLookupList(QuestDB, 11155, L["Shoveltusk Soup Again?"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 12645, L["The Taste Test"], L["Unknown Zone"], 0, 0, 0)

end
