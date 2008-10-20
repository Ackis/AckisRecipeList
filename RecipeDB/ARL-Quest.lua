--[[

************************************************************************

ARL-Quest.lua

Quest data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

79 found from data mining.  0 ignored.

************************************************************************

$Date$
$Rev$

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

function addon:InitQuest(QuestDB)

	self:addLookupList(QuestDB, 22, L["Goretusk Liver Pie"], BZONE["Westfall"], 47.63, 60.88, 1)
	self:addLookupList(QuestDB, 38, L["Westfall Stew"], BZONE["Westfall"], 47.63, 60.88, 1)
	self:addLookupList(QuestDB, 90, L["Seasoned Wolf Kabobs"], BZONE["Duskwood"], 56.6, 67.76, 1)
	self:addLookupList(QuestDB, 92, L["Redridge Goulash"], BZONE["Redridge Mountains"], 29.59, 52.56, 1)
	self:addLookupList(QuestDB, 93, L["Dusky Crab Cakes"], BZONE["Duskwood"], 56.6, 67.76, 1)
	self:addLookupList(QuestDB, 127, L["Selling Fish"], BZONE["Redridge Mountains"], 28.62, 48.76, 1)
	self:addLookupList(QuestDB, 296, L["Ormer's Revenge"], BZONE["Wetlands"], 38.14, 50.05, 1)
	self:addLookupList(QuestDB, 384, L["Beer Basted Boar Ribs"], BZONE["Dun Morogh"], 46.39, 55.40, 1)
	self:addLookupList(QuestDB, 385, L["Crocolisk Hunting"], BZONE["Loch Modan"], 82.47, 63.11, 1)
	self:addLookupList(QuestDB, 418, L["Thelsamar Blood Sausages"], BZONE["Loch Modan"], 61.14, 52.05, 1)
	self:addLookupList(QuestDB, 429, L["Wild Hearts"], BZONE["Silverpine Forest"], 49.88, 33.63, 2)
	self:addLookupList(QuestDB, 471, L["Apprentice's Duties"], BZONE["Wetlands"], 12.98, 56.19, 1)
	self:addLookupList(QuestDB, 498, L["The Rescue"], BZONE["Hillsbrad Foothills"], 59.91, 46.20, 2)
	self:addLookupList(QuestDB, 501, L["Elixir of Pain"], BZONE["Hillsbrad Foothills"], 59.19, 36.91, 2)
	self:addLookupList(QuestDB, 555, L["Soothing Turtle Bisque"], BZONE["Hillsbrad Foothills"], 54.01, 48.68, 1)
	self:addLookupList(QuestDB, 564, L["Costly Menace"], BZONE["Hillsbrad Foothills"], 51.61, 53.94, 1)
	self:addLookupList(QuestDB, 703, L["Barbecued Buzzard Wings"], BZONE["Badlands"], 44.20, 54.76, 0)
	self:addLookupList(QuestDB, 715, L["Liquid Stone"], BZONE["Badlands"], 29.91, 47.23, 0)
	self:addLookupList(QuestDB, 769, L["Kodo Hide Bag"], BZONE["Thunder Bluff"], 40.57, 42.66, 2)
	self:addLookupList(QuestDB, 862, L["Dig Rat Stew"], BZONE["The Barrens"], 54.71, 43.15, 2)
	self:addLookupList(QuestDB, 1487, L["Deviate Eradication"], BZONE["The Barrens"], 45.93, 36.38, 0)
	self:addLookupList(QuestDB, 1559, L["Flash Bomb Recipe"], BZONE["Badlands"], 44.20, 54.76, 0)
	self:addLookupList(QuestDB, 1578, L["Supplying the Front"], BZONE["Ironforge"], 49.65, 45.71, 1)
	self:addLookupList(QuestDB, 1582, L["Moonglow Vest"], BZONE["Darnassus"], 53.02, 31.29, 1)
	self:addLookupList(QuestDB, 1618, L["Gearing Redridge"], BZONE["Ironforge"], 49.65, 45.71, 1)
	self:addLookupList(QuestDB, 2178, L["Easy Strider Living"], BZONE["Darkshore"], 35.75, 36.19, 1)
	self:addLookupList(QuestDB, 2359, L["Klaven's Tower"], BZONE["Westfall"], 48.34, 71.29, 1)
	self:addLookupList(QuestDB, 2478, L["Mission: Possible But Not Probable"], BZONE["The Barrens"], 48.28, 16.18, 2)
	self:addLookupList(QuestDB, 2751, L["Barbaric Battlements"], BZONE["Orgrimmar"], 75.96, 24.48, 2)
	self:addLookupList(QuestDB, 2752, L["On Iron Pauldrons"], BZONE["Orgrimmar"], 75.96, 24.48, 2)
	self:addLookupList(QuestDB, 2753, L["Trampled Under Foot"], BZONE["Orgrimmar"], 75.96, 24.48, 2)
	self:addLookupList(QuestDB, 2754, L["Horns of Frenzy"], BZONE["Orgrimmar"], 75.96, 24.48, 2)
	self:addLookupList(QuestDB, 2755, L["Joys of Omosh"], BZONE["Orgrimmar"], 75.96, 24.48, 2)
	self:addLookupList(QuestDB, 2758, L["The Origins of Smithing"], BZONE["Stormwind City"], 49.28, 24.34, 1)
	self:addLookupList(QuestDB, 2761, L["Smelt On, Smelt Off"], BZONE["Stranglethorn Vale"], 50.21, 20.57, 0)
	self:addLookupList(QuestDB, 2762, L["The Great Silver Deceiver"], BZONE["Stranglethorn Vale"], 50.21, 20.57, 0)
	self:addLookupList(QuestDB, 2763, L["The Art of the Imbue"], BZONE["Stranglethorn Vale"], 50.21, 20.57, 0)
	self:addLookupList(QuestDB, 2848, L["Wild Leather Shoulders"], BZONE["Feralas"], 32.53, 51.44, 1)
	self:addLookupList(QuestDB, 2849, L["Wild Leather Vest"], BZONE["Feralas"], 32.53, 51.44, 1)
	self:addLookupList(QuestDB, 2850, L["Wild Leather Helmet"], BZONE["Feralas"], 32.53, 51.44, 1)
	self:addLookupList(QuestDB, 2851, L["Wild Leather Boots"], BZONE["Feralas"], 32.53, 51.44, 1)
	self:addLookupList(QuestDB, 2852, L["Wild Leather Leggings"], BZONE["Feralas"], 32.53, 51.44, 1)
	self:addLookupList(QuestDB, 2853, L["Master of the Wild Leather"], BZONE["Feralas"], 32.53, 51.44, 1)
	self:addLookupList(QuestDB, 2855, L["Wild Leather Shoulders"], BZONE["Feralas"], 47.97, 67.15, 2)
	self:addLookupList(QuestDB, 2856, L["Wild Leather Vest"], BZONE["Feralas"], 47.97, 67.15, 2)
	self:addLookupList(QuestDB, 2857, L["Wild Leather Helmet"], BZONE["Feralas"], 47.97, 67.15, 2)
	self:addLookupList(QuestDB, 2858, L["Wild Leather Boots"], BZONE["Feralas"], 47.97, 67.15, 2)
	self:addLookupList(QuestDB, 2859, L["Wild Leather Leggings"], BZONE["Feralas"], 47.97, 67.15, 2)
	self:addLookupList(QuestDB, 2860, L["Master of the Wild Leather"], BZONE["Feralas"], 47.97, 67.15, 2)
	self:addLookupList(QuestDB, 3402, L["The Undermarket"], BZONE["Searing Gorge"], 40.99, 73.13, 0)
	self:addLookupList(QuestDB, 4161, L["Recipe of the Kaldorei"], BZONE["Teldrassil"], 57.07, 61.05, 1)
	self:addLookupList(QuestDB, 5124, L["Fiery Plate Gauntlets"], BZONE["Winterspring"], 59.98, 31.29, 0)
	self:addLookupList(QuestDB, 5127, L["The Demon Forge"], BZONE["Winterspring"], 63.33, 74.11, 0)
	self:addLookupList(QuestDB, 5305, L["Sweet Serenity"], BZONE["Winterspring"], 60.18, 30.77, 0)
	self:addLookupList(QuestDB, 5306, L["Snakestone of the Shadow Huntress"], BZONE["Winterspring"], 50.13, 29.73, 0)
	self:addLookupList(QuestDB, 5307, L["Corruption"], BZONE["Winterspring"], 50.19, 29.70, 0)
	self:addLookupList(QuestDB, 7321, L["Soothing Turtle Bisque"], BZONE["Hillsbrad Foothills"], 56.73, 47.37, 2)
	self:addLookupList(QuestDB, 7604, L["A Binding Contract"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7649, L["Enchanted Thorium Platemail: Volume I"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7650, L["Enchanted Thorium Platemail: Volume II"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7651, L["Enchanted Thorium Platemail: Volume III"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 7653, L["Imperial Plate Belt"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 7654, L["Imperial Plate Boots"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 7655, L["Imperial Plate Bracer"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 7656, L["Imperial Plate Chest"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 7657, L["Imperial Plate Helm"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 7658, L["Imperial Plate Leggings"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 7659, L["Imperial Plate Shoulders"], BZONE["Tanaris"], 48.80, 42.51, 0)
	self:addLookupList(QuestDB, 8586, L["Dirge's Kickin' Chimaerok Chops"], BZONE["Tanaris"], 48.17, 47.52, 0)
	self:addLookupList(QuestDB, 8882, L["Cluster Launcher"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 9171, L["Culinary Crunch"], BZONE["Ghostlands"], 48.37, 29.66, 2)
	self:addLookupList(QuestDB, 9249, L["40 Tickets - Schematic: Steam Tonk Controller"], BZONE["Mulgore"], 41.75, 48.82, 0)
	self:addLookupList(QuestDB, 9356, L["Smooth as Butter"], BZONE["Hellfire Peninsula"], 53.00, 64.42, 0)
	self:addLookupList(QuestDB, 9454, L["The Great Moongraze Hunt"], BZONE["Bloodmyst Isle"], 54.23, 54.87, 1)
	self:addLookupList(QuestDB, 9635, L["The Zapthrottle Mote Extractor!"], BZONE["Zangarmarsh"], 33.53, 50.33, 2)
	self:addLookupList(QuestDB, 9636, L["The Zapthrottle Mote Extractor!"], BZONE["Zangarmarsh"], 58.84, 48.62, 1)
	self:addLookupList(QuestDB, 10860, L["Mok'Nathal Treats"], BZONE["Blade's Edge Mountains"], 45.52, 59.59, 2)
	self:addLookupList(QuestDB, 11155, L["Shoveltusk Soup Again?"], L["Unknown Zone"], 0, 0, 0)
	self:addLookupList(QuestDB, 12645, L["The Taste Test"], L["Unknown Zone"], 0, 0, 0)

end
