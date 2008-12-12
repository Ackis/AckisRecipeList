--[[

************************************************************************

ARL-Quest.lua

Quest data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

83 found from data mining.  0 ignored.

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

	self:addLookupList(QuestDB,22,L["Goretusk Liver Pie"],BZONE["Westfall"],55.77,30.920)
	self:addLookupList(QuestDB,38,L["Westfall Stew"],BZONE["Westfall"],55.77,30.920)
	self:addLookupList(QuestDB,90,L["Seasoned Wolf Kabobs"],BZONE["Duskwood"],73.51,42.551)
	self:addLookupList(QuestDB,92,L["Redridge Goulash"],BZONE["Redridge Mountains"],23.05,44.361)
	self:addLookupList(QuestDB,93,L["Dusky Crab Cakes"],BZONE["Duskwood"],73.51,42.551)
	self:addLookupList(QuestDB,127,L["Selling Fish"],BZONE["Redridge Mountains"],28.24,47.601)
	self:addLookupList(QuestDB,296,L["Ormer's Revenge"],BZONE["Wetlands"],38.04,50.721)
	self:addLookupList(QuestDB,384,L["Beer Basted Boar Ribs"],BZONE["Dun Morogh"],47.18,53.331)
	self:addLookupList(QuestDB,385,L["Crocolisk Hunting"],BZONE["Loch Modan"],82.02,64.031)
	self:addLookupList(QuestDB,418,L["Thelsamar Blood Sausages"],BZONE["Loch Modan"],35.07,49.660)
	self:addLookupList(QuestDB,429,L["Wild Hearts"],BZONE["Silverpine Forest"],43.56,41.142)
	self:addLookupList(QuestDB,471,L["Apprentice's Duties"],BZONE["Wetlands"],8.927,56.071)
	self:addLookupList(QuestDB,498,L["The Rescue"],BZONE["Hillsbrad Foothills"],62.49,19.952)
	self:addLookupList(QuestDB,501,L["Elixir of Pain"],BZONE["Hillsbrad Foothills"],61.59,19.142)
	self:addLookupList(QuestDB,555,L["Soothing Turtle Bisque"],BZONE["Hillsbrad Foothills"],51.99,58.981)
	self:addLookupList(QuestDB,564,L["Costly Menace"],BZONE["Hillsbrad Foothills"],52.06,56.271)
	self:addLookupList(QuestDB,703,L["Barbecued Buzzard Wings"],BZONE["Badlands"],42.27,53.030)
	self:addLookupList(QuestDB,715,L["Liquid Stone"],BZONE["Badlands"],26.52,45.310)
	self:addLookupList(QuestDB,769,L["Kodo Hide Bag"],BZONE["Thunder Bluff"],43.90,44.682)
	self:addLookupList(QuestDB,862,L["Dig Rat Stew"],BZONE["The Barrens"],55.00,33.002)
	self:addLookupList(QuestDB,1487,L["Deviate Eradication"],BZONE["The Barrens"],46.50,35.950)
	self:addLookupList(QuestDB,1559,L["Flash Bomb Recipe"],BZONE["Badlands"],0,00)
	self:addLookupList(QuestDB,1578,L["Supplying the Front"],BZONE["Loch Modan"],23.49,75.111)
	self:addLookupList(QuestDB,1582,L["Moonglow Vest"],BZONE["Darnassus"],64.76,22.391)
	self:addLookupList(QuestDB,1618,L["Gearing Redridge"],BZONE["Redridge Mountains"],31.37,47.341)
	self:addLookupList(QuestDB,2178,L["Easy Strider Living"],BZONE["Darkshore"],37.27,41.271)
	self:addLookupList(QuestDB,2203,L["Badlands Reagent Run II"],BZONE["Badlands"],3.346,46.052)
	self:addLookupList(QuestDB,2359,L["Klaven's Tower"],BZONE["Stormwind City"],78.82,69.471)
	self:addLookupList(QuestDB,2478,L["Mission: Possible But Not Probable"],BZONE["Orgrimmar"],43.94,53.492)
	self:addLookupList(QuestDB,2501,L["Badlands Reagent Run II"],BZONE["Loch Modan"],37.17,48.951)
	self:addLookupList(QuestDB,2751,L["Barbaric Battlements"],BZONE["Orgrimmar"],79.34,23.062)
	self:addLookupList(QuestDB,2752,L["On Iron Pauldrons"],BZONE["Orgrimmar"],79.34,23.062)
	self:addLookupList(QuestDB,2753,L["Trampled Under Foot"],BZONE["Orgrimmar"],79.34,23.062)
	self:addLookupList(QuestDB,2754,L["Horns of Frenzy"],BZONE["Orgrimmar"],79.34,23.062)
	self:addLookupList(QuestDB,2755,L["Joys of Omosh"],BZONE["Orgrimmar"],79.34,23.062)
	self:addLookupList(QuestDB,2756,L["The Old Ways"],BZONE["Orgrimmar"],80.17,24.552)
	self:addLookupList(QuestDB,2758,L["The Origins of Smithing"],BZONE["Stormwind City"],63.12,37.131)
	self:addLookupList(QuestDB,2761,L["Smelt On, Smelt Off"],BZONE["Stranglethorn Vale"],50.80,22.000)
	self:addLookupList(QuestDB,2762,L["The Great Silver Deceiver"],BZONE["Stranglethorn Vale"],50.80,22.000)
	self:addLookupList(QuestDB,2763,L["The Art of the Imbue"],BZONE["Stranglethorn Vale"],50.80,22.000)
	self:addLookupList(QuestDB,2848,L["Wild Leather Shoulders"],BZONE["Feralas"],30.02,42.931)
	self:addLookupList(QuestDB,2849,L["Wild Leather Vest"],BZONE["Feralas"],30.02,42.931)
	self:addLookupList(QuestDB,2850,L["Wild Leather Helmet"],BZONE["Feralas"],30.02,42.931)
	self:addLookupList(QuestDB,2851,L["Wild Leather Boots"],BZONE["Feralas"],30.02,42.931)
	self:addLookupList(QuestDB,2852,L["Wild Leather Leggings"],BZONE["Feralas"],30.02,42.931)
	self:addLookupList(QuestDB,2853,L["Master of the Wild Leather"],BZONE["Darnassus"],64.30,21.941)
	self:addLookupList(QuestDB,2855,L["Wild Leather Shoulders"],BZONE["Feralas"],74.83,44.712)
	self:addLookupList(QuestDB,2856,L["Wild Leather Vest"],BZONE["Feralas"],74.83,44.712)
	self:addLookupList(QuestDB,2857,L["Wild Leather Helmet"],BZONE["Feralas"],74.83,44.712)
	self:addLookupList(QuestDB,2858,L["Wild Leather Boots"],BZONE["Feralas"],74.83,44.712)
	self:addLookupList(QuestDB,2859,L["Wild Leather Leggings"],BZONE["Feralas"],74.83,44.712)
	self:addLookupList(QuestDB,2860,L["Master of the Wild Leather"],BZONE["Thunder Bluff"],42.37,43.592)
	self:addLookupList(QuestDB,3402,L["The Undermarket"],BZONE["Tanaris"],51.45,27.090)
	self:addLookupList(QuestDB,4161,L["Recipe of the Kaldorei"],BZONE["Teldrassil"],57.74,61.641)
	self:addLookupList(QuestDB,5124,L["Fiery Plate Gauntlets"],BZONE["Winterspring"],60.71,39.140)
	self:addLookupList(QuestDB,5127,L["The Demon Forge"],BZONE["Winterspring"],64.05,73.240)
	self:addLookupList(QuestDB,5305,L["Sweet Serenity"],BZONE["Winterspring"],61.19,35.940)
	self:addLookupList(QuestDB,5306,L["Snakestone of the Shadow Huntress"],BZONE["Winterspring"],61.41,37.040)
	self:addLookupList(QuestDB,5307,L["Corruption"],BZONE["Winterspring"],61.32,39.130)
	self:addLookupList(QuestDB,7321,L["Soothing Turtle Bisque"],BZONE["Hillsbrad Foothills"],62.60,20.302)
	self:addLookupList(QuestDB,7604,L["A Binding Contract"],BZONE["Blackrock Depths"],0,00)
	self:addLookupList(QuestDB,7649,L["Enchanted Thorium Platemail: Volume I"],BZONE["Dire Maul"],0,00)
	self:addLookupList(QuestDB,7650,L["Enchanted Thorium Platemail: Volume II"],BZONE["Dire Maul"],0,00)
	self:addLookupList(QuestDB,7651,L["Enchanted Thorium Platemail: Volume III"],BZONE["Dire Maul"],0,00)
	self:addLookupList(QuestDB,7653,L["Imperial Plate Belt"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,7654,L["Imperial Plate Boots"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,7655,L["Imperial Plate Bracer"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,7656,L["Imperial Plate Chest"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,7657,L["Imperial Plate Helm"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,7658,L["Imperial Plate Leggings"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,7659,L["Imperial Plate Shoulders"],BZONE["Tanaris"],0,00)
	self:addLookupList(QuestDB,8313,L["Sharing the Knowledge"],BZONE["Ironforge"],33.29,60.120)
	self:addLookupList(QuestDB,8586,L["Dirge's Kickin' Chimaerok Chops"],BZONE["Tanaris"],52.50,27.990)
	self:addLookupList(QuestDB,8877,L["Firework Launcher"],BZONE["Moonglade"],0,00)
	self:addLookupList(QuestDB,8878,L["Festive Recipes"],BZONE["Moonglade"],0,00)
	self:addLookupList(QuestDB,8882,L["Cluster Launcher"],BZONE["Moonglade"],0,00)
	self:addLookupList(QuestDB,9171,L["Culinary Crunch"],BZONE["Ghostlands"],47.88,31.212)
	self:addLookupList(QuestDB,9249,L["40 Tickets - Schematic: Steam Tonk Controller"],BZONE["Darkmoon Faire"],0,00)
	self:addLookupList(QuestDB,9356,L["Smooth as Butter"],BZONE["Hellfire Peninsula"],49.05,74.080)
	self:addLookupList(QuestDB,9454,L["The Great Moongraze Hunt"],BZONE["Bloodmyst Isle"],53.73,55.951)
	self:addLookupList(QuestDB,9635,L["The Zapthrottle Mote Extractor!"],BZONE["Zangarmarsh"],34.38,51.472)
	self:addLookupList(QuestDB,9636,L["The Zapthrottle Mote Extractor!"],BZONE["Zangarmarsh"],69.17,49.861)
	self:addLookupList(QuestDB,10860,L["Mok'Nathal Treats"],BZONE["Blade's Edge Mountains"],76.33,61.692)

end
