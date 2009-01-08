--[[

************************************************************************

ARL-Quest.lua

Quest data for all of Ackis Recipe List

91 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(QuestDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitQuest(QuestDB)

	self:addLookupList(QuestDB,22,L["Goretusk Liver Pie"],BZONE["Westfall"],55.77,30.92,0)
	self:addLookupList(QuestDB,38,L["Westfall Stew"],BZONE["Westfall"],55.77,30.92,0)
	self:addLookupList(QuestDB,90,L["Seasoned Wolf Kabobs"],BZONE["Duskwood"],73.48,42.70,1)
	self:addLookupList(QuestDB,92,L["Redridge Goulash"],BZONE["Redridge Mountains"],23.05,44.37,1)
	self:addLookupList(QuestDB,93,L["Dusky Crab Cakes"],BZONE["Duskwood"],73.48,42.70,1)
	self:addLookupList(QuestDB,127,L["Selling Fish"],BZONE["Redridge Mountains"],28.24,47.60,1)
	self:addLookupList(QuestDB,296,L["Ormer's Revenge"],BZONE["Wetlands"],38.04,50.72,1)
	self:addLookupList(QuestDB,384,L["Beer Basted Boar Ribs"],BZONE["Dun Morogh"],47.18,53.32,1)
	self:addLookupList(QuestDB,385,L["Crocolisk Hunting"],BZONE["Loch Modan"],82.03,64.03,0)
	self:addLookupList(QuestDB,418,L["Thelsamar Blood Sausages"],BZONE["Loch Modan"],35.07,49.66,0)
	self:addLookupList(QuestDB,429,L["Wild Hearts"],BZONE["Silverpine Forest"],43.56,41.14,2)
	self:addLookupList(QuestDB,471,L["Apprentice's Duties"],BZONE["Wetlands"],8.928,56.07,1)
	self:addLookupList(QuestDB,498,L["The Rescue"],BZONE["Hillsbrad Foothills"],62.94,20.10,2)
	self:addLookupList(QuestDB,501,L["Elixir of Pain"],BZONE["Hillsbrad Foothills"],61.59,19.15,2)
	self:addLookupList(QuestDB,555,L["Soothing Turtle Bisque"],BZONE["Hillsbrad Foothills"],51.99,58.98,1)
	self:addLookupList(QuestDB,564,L["Costly Menace"],BZONE["Hillsbrad Foothills"],52.07,56.27,1)
	self:addLookupList(QuestDB,703,L["Barbecued Buzzard Wings"],BZONE["Badlands"],42.27,53.03,0)
	self:addLookupList(QuestDB,715,L["Liquid Stone"],BZONE["Badlands"],26.52,45.31,0)
	self:addLookupList(QuestDB,769,L["Kodo Hide Bag"],BZONE["Thunder Bluff"],43.90,44.68,2)
	self:addLookupList(QuestDB,862,L["Dig Rat Stew"],BZONE["The Barrens"],55.00,33.00,2)
	self:addLookupList(QuestDB,1487,L["Deviate Eradication"],BZONE["The Barrens"],46.24,36.64,2)
	self:addLookupList(QuestDB,1559,L["Flash Bomb Recipe"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,1578,L["Supplying the Front"],BZONE["Loch Modan"],23.49,75.11,1)
	self:addLookupList(QuestDB,1582,L["Moonglow Vest"],BZONE["Darnassus"],64.76,22.39,1)
	self:addLookupList(QuestDB,1618,L["Gearing Redridge"],BZONE["Redridge Mountains"],31.37,47.34,1)
	self:addLookupList(QuestDB,2178,L["Easy Strider Living"],BZONE["Darkshore"],38.03,40.91,1)
	self:addLookupList(QuestDB,2203,L["Badlands Reagent Run II"],BZONE["Badlands"],3.347,46.05,2)
	self:addLookupList(QuestDB,2359,L["Klaven's Tower"],BZONE["Stormwind City"],78.83,69.47,1)
	self:addLookupList(QuestDB,2478,L["Mission: Possible But Not Probable"],BZONE["Orgrimmar"],43.94,53.48,2)
	self:addLookupList(QuestDB,2501,L["Badlands Reagent Run II"],BZONE["Loch Modan"],37.16,48.95,1)
	self:addLookupList(QuestDB,2751,L["Barbaric Battlements"],BZONE["Orgrimmar"],79.34,23.07,2)
	self:addLookupList(QuestDB,2752,L["On Iron Pauldrons"],BZONE["Orgrimmar"],79.34,23.07,2)
	self:addLookupList(QuestDB,2753,L["Trampled Under Foot"],BZONE["Orgrimmar"],79.34,23.07,2)
	self:addLookupList(QuestDB,2754,L["Horns of Frenzy"],BZONE["Orgrimmar"],79.34,23.07,2)
	self:addLookupList(QuestDB,2755,L["Joys of Omosh"],BZONE["Orgrimmar"],79.34,23.07,2)
	self:addLookupList(QuestDB,2756,L["The Old Ways"],BZONE["Orgrimmar"],80.17,24.72,2)
	self:addLookupList(QuestDB,2758,L["The Origins of Smithing"],BZONE["Stormwind City"],63.13,37.12,1)
	self:addLookupList(QuestDB,2761,L["Smelt On, Smelt Off"],BZONE["Stranglethorn Vale"],50.80,22.00,0)
	self:addLookupList(QuestDB,2762,L["The Great Silver Deceiver"],BZONE["Stranglethorn Vale"],50.80,22.00,0)
	self:addLookupList(QuestDB,2763,L["The Art of the Imbue"],BZONE["Stranglethorn Vale"],50.80,22.00,0)
	self:addLookupList(QuestDB,2771,L["A Good Head On Your Shoulders"],BZONE["Tanaris"],51.40,28.70,0)
	self:addLookupList(QuestDB,2772,L["The World At Your Feet"],BZONE["Tanaris"],51.40,28.70,0)
	self:addLookupList(QuestDB,2773,L["The Mithril Kid"],BZONE["Tanaris"],51.40,28.70,0)
	self:addLookupList(QuestDB,2848,L["Wild Leather Shoulders"],BZONE["Feralas"],30.02,42.93,1)
	self:addLookupList(QuestDB,2849,L["Wild Leather Vest"],BZONE["Feralas"],30.02,42.93,1)
	self:addLookupList(QuestDB,2850,L["Wild Leather Helmet"],BZONE["Feralas"],30.02,42.93,1)
	self:addLookupList(QuestDB,2851,L["Wild Leather Boots"],BZONE["Feralas"],30.02,42.93,1)
	self:addLookupList(QuestDB,2852,L["Wild Leather Leggings"],BZONE["Feralas"],30.02,42.93,1)
	self:addLookupList(QuestDB,2853,L["Master of the Wild Leather"],BZONE["Darnassus"],64.30,21.94,1)
	self:addLookupList(QuestDB,2855,L["Wild Leather Shoulders"],BZONE["Feralas"],74.83,44.71,2)
	self:addLookupList(QuestDB,2856,L["Wild Leather Vest"],BZONE["Feralas"],74.83,44.71,2)
	self:addLookupList(QuestDB,2857,L["Wild Leather Helmet"],BZONE["Feralas"],74.83,44.71,2)
	self:addLookupList(QuestDB,2858,L["Wild Leather Boots"],BZONE["Feralas"],74.83,44.71,2)
	self:addLookupList(QuestDB,2859,L["Wild Leather Leggings"],BZONE["Feralas"],74.83,44.71,2)
	self:addLookupList(QuestDB,2860,L["Master of the Wild Leather"],BZONE["Thunder Bluff"],42.37,43.59,2)
	self:addLookupList(QuestDB,3402,L["The Undermarket"],BZONE["Tanaris"],51.45,27.09,0)
	self:addLookupList(QuestDB,4083,L["The Spectral Chalice"],BZONE["Blackrock Depths"],0,0,0)
	self:addLookupList(QuestDB,4161,L["Recipe of the Kaldorei"],BZONE["Teldrassil"],57.59,61.60,1)
	self:addLookupList(QuestDB,5124,L["Fiery Plate Gauntlets"],BZONE["Winterspring"],60.95,37.99,0)
	self:addLookupList(QuestDB,5127,L["The Demon Forge"],BZONE["Winterspring"],64.05,73.24,0)
	self:addLookupList(QuestDB,5163,L["Are We There, Yeti?"],BZONE["Winterspring"],60.78,37.57,0)
	self:addLookupList(QuestDB,5305,L["Sweet Serenity"],BZONE["Winterspring"],61.19,35.94,0)
	self:addLookupList(QuestDB,5306,L["Snakestone of the Shadow Huntress"],BZONE["Winterspring"],61.41,37.04,0)
	self:addLookupList(QuestDB,5307,L["Corruption"],BZONE["Winterspring"],61.32,39.13,0)
	self:addLookupList(QuestDB,5518,L["The Gordok Ogre Suit"],BZONE["Dire Maul"],0,0,0)
	self:addLookupList(QuestDB,6032,L["Sacred Cloth"],BZONE["Winterspring"],65.70,2.90,0)
	self:addLookupList(QuestDB,6622,L["Triage"],BZONE["Arathi Highlands"],72.97,35.39,2)
	self:addLookupList(QuestDB,6624,L["Triage"],BZONE["Dustwallow Marsh"],68.18,47.94,1)
	self:addLookupList(QuestDB,7321,L["Soothing Turtle Bisque"],BZONE["Hillsbrad Foothills"],62.60,20.30,2)
	self:addLookupList(QuestDB,7493,L["The Journey Has Just Begun"],BZONE["Onyxia's Lair"],0,0,2)
	self:addLookupList(QuestDB,7497,L["The Journey Has Just Begun"],BZONE["Onyxia's Lair"],0,0,1)
	self:addLookupList(QuestDB,7604,L["A Binding Contract"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,7649,L["Enchanted Thorium Platemail: Volume I"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,7650,L["Enchanted Thorium Platemail: Volume II"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,7651,L["Enchanted Thorium Platemail: Volume III"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,7653,L["Imperial Plate Belt"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,7654,L["Imperial Plate Boots"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,7655,L["Imperial Plate Bracer"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,7656,L["Imperial Plate Chest"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,7657,L["Imperial Plate Helm"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,7658,L["Imperial Plate Leggings"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,7659,L["Imperial Plate Shoulders"],BZONE["Tanaris"],0,0,0)
	self:addLookupList(QuestDB,8313,L["Sharing the Knowledge"],BZONE["Ironforge"],40.35,72.87,0)
	self:addLookupList(QuestDB,8323,L["True Believers"],BZONE["Silithus"],66.96,71.35,0)
	self:addLookupList(QuestDB,8586,L["Dirge's Kickin' Chimaerok Chops"],BZONE["Tanaris"],52.50,27.99,0)
	self:addLookupList(QuestDB,8877,L["Firework Launcher"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,8878,L["Festive Recipes"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,8882,L["Cluster Launcher"],L["Unknown Zone"],0,0,0)
	self:addLookupList(QuestDB,9171,L["Culinary Crunch"],BZONE["Ghostlands"],47.88,31.20,2)
	self:addLookupList(QuestDB,9249,L["40 Tickets - Schematic: Steam Tonk Controller"],BZONE["Darkmoon Faire"],0,0,0)
	self:addLookupList(QuestDB,9356,L["Smooth as Butter"],BZONE["Hellfire Peninsula"],49.04,74.06,0)
	self:addLookupList(QuestDB,9454,L["The Great Moongraze Hunt"],BZONE["Bloodmyst Isle"],53.73,55.95,1)
	self:addLookupList(QuestDB,9635,L["The Zapthrottle Mote Extractor!"],BZONE["Zangarmarsh"],34.38,51.47,2)
	self:addLookupList(QuestDB,9636,L["The Zapthrottle Mote Extractor!"],BZONE["Zangarmarsh"],68.54,48.94,1)
	self:addLookupList(QuestDB,10860,L["Mok'Nathal Treats"],BZONE["Blade's Edge Mountains"],76.33,61.69,2)

end
