--[[

************************************************************************

ARL-Vendor.lua

Vendor data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

325 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(VendorDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitVendor(VendorDB)

	self:addLookupList(VendorDB,66,L["Tharynn Bouden"],BZONE["Elwynn Forest"],42.20,67.22,1)
	self:addLookupList(VendorDB,340,L["Kendor Kabonka"],BZONE["Stormwind City"],76.86,52.15,1)
	self:addLookupList(VendorDB,734,L["Corporal Bluth"],BZONE["Stranglethorn Vale"],37.97,4.186,1)
	self:addLookupList(VendorDB,777,L["Amy Davenport"],BZONE["Redridge Mountains"],29.30,47.22,1)
	self:addLookupList(VendorDB,843,L["Gina MacGregor"],BZONE["Westfall"],57.84,54.24,1)
	self:addLookupList(VendorDB,989,L["Banalash"],BZONE["Swamp of Sorrows"],44.91,57.26,2)
	self:addLookupList(VendorDB,1148,L["Nerrist"],BZONE["Stranglethorn Vale"],32.09,29.43,2)
	self:addLookupList(VendorDB,1149,L["Uthok"],BZONE["Stranglethorn Vale"],32.06,28.16,2)
	self:addLookupList(VendorDB,1286,L["Edna Mullby"],BZONE["Stormwind City"],64.40,71.97,1)
	self:addLookupList(VendorDB,1304,L["Darian Singh"],BZONE["Stormwind City"],42.94,76.09,1)
	self:addLookupList(VendorDB,1313,L["Maria Lumere"],BZONE["Stormwind City"],55.86,85.24,1)
	self:addLookupList(VendorDB,1318,L["Jessara Cordell"],BZONE["Stormwind City"],53.04,73.76,1)
	self:addLookupList(VendorDB,1347,L["Alexandra Bolero"],BZONE["Stormwind City"],53.04,81.19,1)
	self:addLookupList(VendorDB,1448,L["Neal Allen"],BZONE["Wetlands"],10.87,57.19,1)
	self:addLookupList(VendorDB,1454,L["Jennabink Powerseam"],BZONE["Wetlands"],7.979,56.27,1)
	self:addLookupList(VendorDB,1465,L["Drac Roughcut"],BZONE["Loch Modan"],35.57,49.27,1)
	self:addLookupList(VendorDB,1474,L["Rann Flamespinner"],BZONE["Loch Modan"],36.00,46.39,1)
	self:addLookupList(VendorDB,1669,L["Defias Profiteer"],BZONE["Westfall"],42.98,66.93,0)
	self:addLookupList(VendorDB,1684,L["Khara Deepwater"],BZONE["Loch Modan"],40.50,38.99,1)
	self:addLookupList(VendorDB,1685,L["Xandar Goodbeard"],BZONE["Loch Modan"],83.03,63.09,1)
	self:addLookupList(VendorDB,2118,L["Abigail Shiel"],BZONE["Tirisfal Glades"],61.30,51.99,2)
	self:addLookupList(VendorDB,2380,L["Nandar Branson"],BZONE["Hillsbrad Foothills"],51.20,56.89,1)
	self:addLookupList(VendorDB,2381,L["Micha Yance"],BZONE["Hillsbrad Foothills"],49.38,55.57,1)
	self:addLookupList(VendorDB,2383,L["Lindea Rabonne"],BZONE["Hillsbrad Foothills"],50.94,61.17,1)
	self:addLookupList(VendorDB,2393,L["Christoph Jeffcoat"],BZONE["Hillsbrad Foothills"],62.60,20.30,2)
	self:addLookupList(VendorDB,2394,L["Mallen Swain"],BZONE["Hillsbrad Foothills"],62.03,21.92,2)
	self:addLookupList(VendorDB,2397,L["Derak Nightfall"],BZONE["Hillsbrad Foothills"],63.28,19.09,2)
	self:addLookupList(VendorDB,2480,L["Bro'kin"],BZONE["Alterac Mountains"],39.13,39.39,2)
	self:addLookupList(VendorDB,2481,L["Bliztik"],BZONE["Duskwood"],18.06,55.14,0)
	self:addLookupList(VendorDB,2664,L["Kelsey Yance"],BZONE["Stranglethorn Vale"],28.03,75.09,0)
	self:addLookupList(VendorDB,2668,L["Danielle Zipstitch"],BZONE["Duskwood"],76.45,46.68,1)
	self:addLookupList(VendorDB,2669,L["Sheri Zipstitch"],BZONE["Duskwood"],75.80,46.45,1)
	self:addLookupList(VendorDB,2670,L["Xizk Goodstitch"],BZONE["Stranglethorn Vale"],28.29,77.29,0)
	self:addLookupList(VendorDB,2679,L["Wenna Silkbeard"],BZONE["Wetlands"],25.71,26.09,1)
	self:addLookupList(VendorDB,2685,L["Mazk Snipeshot"],BZONE["Stranglethorn Vale"],28.99,75.44,0)
	self:addLookupList(VendorDB,2687,L["Gnaz Blunderflame"],BZONE["Stranglethorn Vale"],51.22,36.13,0)
	self:addLookupList(VendorDB,2688,L["Ruppo Zipcoil"],BZONE["The Hinterlands"],34.33,38.22,0)
	self:addLookupList(VendorDB,2697,L["Clyde Ranthal"],BZONE["Redridge Mountains"],88.55,66.48,1)
	self:addLookupList(VendorDB,2698,L["George Candarte"],BZONE["Hillsbrad Foothills"],91.80,38.21,2)
	self:addLookupList(VendorDB,2803,L["Malygen"],BZONE["Felwood"],61.99,25.71,1)
	self:addLookupList(VendorDB,2805,L["Deneb Walker"],BZONE["Arathi Highlands"],27.18,58.61,1)
	self:addLookupList(VendorDB,2806,L["Bale"],BZONE["Felwood"],34.77,52.87,2)
	self:addLookupList(VendorDB,2810,L["Hammon Karwn"],BZONE["Arathi Highlands"],46.31,47.35,1)
	self:addLookupList(VendorDB,2812,L["Drovnar Strongbrew"],BZONE["Arathi Highlands"],46.40,47.10,1)
	self:addLookupList(VendorDB,2814,L["Narj Deepslice"],BZONE["Arathi Highlands"],45.29,47.52,1)
	self:addLookupList(VendorDB,2821,L["Keena"],BZONE["Orgrimmar"],42.60,35.64,2)
	self:addLookupList(VendorDB,2838,L["Crazk Sparks"],BZONE["Stranglethorn Vale"],27.91,76.77,0)
	self:addLookupList(VendorDB,2848,L["Glyx Brewright"],BZONE["Stranglethorn Vale"],27.98,77.80,0)
	self:addLookupList(VendorDB,3005,L["Mahu"],BZONE["Thunder Bluff"],43.96,44.89,2)
	self:addLookupList(VendorDB,3012,L["Nata Dawnstrider"],BZONE["Thunder Bluff"],45.82,40.77,2)
	self:addLookupList(VendorDB,3027,L["Naal Mistrunner"],BZONE["Thunder Bluff"],51.79,51.94,2)
	self:addLookupList(VendorDB,3029,L["Sewa Mistrunner"],BZONE["Thunder Bluff"],55.33,48.62,2)
	self:addLookupList(VendorDB,3081,L["Wunna Darkmane"],BZONE["Mulgore"],46.12,58.10,2)
	self:addLookupList(VendorDB,3085,L["Gloria Femmel"],BZONE["Redridge Mountains"],26.82,43.04,1)
	self:addLookupList(VendorDB,3134,L["Kzixx"],BZONE["Duskwood"],81.98,20.60,0)
	self:addLookupList(VendorDB,3178,L["Stuart Fleming"],BZONE["Wetlands"],8.599,59.03,1)
	self:addLookupList(VendorDB,3333,L["Shankys"],BZONE["Orgrimmar"],70.01,29.56,2)
	self:addLookupList(VendorDB,3335,L["Hagrus"],BZONE["Orgrimmar"],46.64,48.22,2)
	self:addLookupList(VendorDB,3346,L["Kithas"],BZONE["Orgrimmar"],53.89,38.71,2)
	self:addLookupList(VendorDB,3348,L["Kor'geld"],BZONE["Orgrimmar"],56.44,35.69,2)
	self:addLookupList(VendorDB,3364,L["Borya"],BZONE["Orgrimmar"],62.96,51.94,2)
	self:addLookupList(VendorDB,3366,L["Tamar"],BZONE["Orgrimmar"],63.11,44.01,2)
	self:addLookupList(VendorDB,3367,L["Felika"],BZONE["Orgrimmar"],58.20,50.96,2)
	self:addLookupList(VendorDB,3400,L["Xen'to"],BZONE["Orgrimmar"],57.15,53.40,2)
	self:addLookupList(VendorDB,3413,L["Sovik"],BZONE["Orgrimmar"],75.72,26.26,2)
	self:addLookupList(VendorDB,3482,L["Tari'qa"],BZONE["The Barrens"],51.76,30.72,2)
	self:addLookupList(VendorDB,3485,L["Wrahk"],BZONE["The Barrens"],51.98,32.15,2)
	self:addLookupList(VendorDB,3489,L["Zargh"],BZONE["The Barrens"],52.12,29.45,2)
	self:addLookupList(VendorDB,3495,L["Gagsprocket"],BZONE["The Barrens"],62.49,35.58,0)
	self:addLookupList(VendorDB,3497,L["Kilxx"],BZONE["The Barrens"],62.98,36.92,0)
	self:addLookupList(VendorDB,3499,L["Ranik"],BZONE["The Barrens"],61.87,39.36,0)
	self:addLookupList(VendorDB,3522,L["Constance Brisboise"],BZONE["Tirisfal Glades"],52.53,55.66,2)
	self:addLookupList(VendorDB,3537,L["Zixil"],BZONE["Hillsbrad Foothills"],56.44,30.57,0)
	self:addLookupList(VendorDB,3550,L["Martine Tramblay"],BZONE["Tirisfal Glades"],66.02,59.23,2)
	self:addLookupList(VendorDB,3556,L["Andrew Hilbert"],BZONE["Silverpine Forest"],43.35,41.12,2)
	self:addLookupList(VendorDB,3683,L["Kiknikle"],BZONE["The Barrens"],42.30,38.62,0)
	self:addLookupList(VendorDB,3881,L["Grimtak"],BZONE["Durotar"],52.17,42.26,2)
	self:addLookupList(VendorDB,3954,L["Dalria"],BZONE["Ashenvale"],35.29,52.03,1)
	self:addLookupList(VendorDB,3956,L["Harklan Moongrove"],BZONE["Ashenvale"],50.68,66.98,1)
	self:addLookupList(VendorDB,3958,L["Lardan"],BZONE["Ashenvale"],34.84,50.06,1)
	self:addLookupList(VendorDB,3960,L["Ulthaan"],BZONE["Ashenvale"],50.15,67.74,1)
	self:addLookupList(VendorDB,4083,L["Jeeda"],BZONE["Stonetalon Mountains"],47.68,61.46,2)
	self:addLookupList(VendorDB,4168,L["Elynna"],BZONE["Darnassus"],64.25,22.65,1)
	self:addLookupList(VendorDB,4186,L["Mavralyn"],BZONE["Darkshore"],37.30,40.85,1)
	self:addLookupList(VendorDB,4189,L["Valdaron"],BZONE["Darkshore"],37.74,41.00,1)
	self:addLookupList(VendorDB,4200,L["Laird"],BZONE["Darkshore"],37.11,43.95,1)
	self:addLookupList(VendorDB,4223,L["Fyldan"],BZONE["Darnassus"],48.53,21.42,1)
	self:addLookupList(VendorDB,4226,L["Ulthir"],BZONE["Darnassus"],55.74,24.01,1)
	self:addLookupList(VendorDB,4228,L["Vaean"],BZONE["Darnassus"],58.98,15.10,1)
	self:addLookupList(VendorDB,4229,L["Mythrin'dir"],BZONE["Darnassus"],60.67,19.77,1)
	self:addLookupList(VendorDB,4265,L["Nyoma"],BZONE["Teldrassil"],57.46,61.09,1)
	self:addLookupList(VendorDB,4305,L["Kriggon Talsone"],BZONE["Westfall"],36.16,89.35,1)
	self:addLookupList(VendorDB,4307,L["Heldan Galesong"],BZONE["Darkshore"],37.33,56.25,1)
	self:addLookupList(VendorDB,4553,L["Ronald Burch"],BZONE["Undercity"],63.48,43.79,2)
	self:addLookupList(VendorDB,4561,L["Daniel Bartlett"],BZONE["Undercity"],65.16,39.31,2)
	self:addLookupList(VendorDB,4574,L["Lizbeth Cromwell"],BZONE["Undercity"],81.39,31.64,2)
	self:addLookupList(VendorDB,4577,L["Millie Gregorian"],BZONE["Undercity"],71.24,30.14,2)
	self:addLookupList(VendorDB,4589,L["Joseph Moore"],BZONE["Undercity"],70.50,59.21,2)
	self:addLookupList(VendorDB,4610,L["Algernon"],BZONE["Undercity"],53.46,73.02,2)
	self:addLookupList(VendorDB,4617,L["Thaddeus Webb"],BZONE["Undercity"],61.23,61.28,2)
	self:addLookupList(VendorDB,4775,L["Felicia Doan"],BZONE["Undercity"],65.10,50.06,2)
	self:addLookupList(VendorDB,4782,L["Truk Wildbeard"],BZONE["The Hinterlands"],14.52,43.03,1)
	self:addLookupList(VendorDB,4877,L["Jandia"],BZONE["Undercity"],44.21,62.08,2)
	self:addLookupList(VendorDB,4879,L["Ogg'marr"],BZONE["Dustwallow Marsh"],36.53,31.66,2)
	self:addLookupList(VendorDB,4897,L["Helenia Olden"],BZONE["Dustwallow Marsh"],66.55,50.86,1)
	self:addLookupList(VendorDB,5128,L["Bombus Finespindle"],BZONE["Ironforge"],39.70,34.03,1)
	self:addLookupList(VendorDB,5158,L["Tilli Thistlefuzz"],BZONE["Ironforge"],60.91,45.24,1)
	self:addLookupList(VendorDB,5160,L["Emrul Riknussun"],BZONE["Ironforge"],60.07,38.79,1)
	self:addLookupList(VendorDB,5162,L["Tansy Puddlefizz"],BZONE["Ironforge"],48.22,5.994,1)
	self:addLookupList(VendorDB,5163,L["Burbik Gearspanner"],BZONE["Ironforge"],47.06,27.92,1)
	self:addLookupList(VendorDB,5175,L["Gearcutter Cogspinner"],BZONE["Ironforge"],68.63,44.98,1)
	self:addLookupList(VendorDB,5178,L["Soolie Berryfizz"],BZONE["Ironforge"],67.76,54.34,1)
	self:addLookupList(VendorDB,5483,L["Erika Tate"],BZONE["Stormwind City"],77.93,53.04,1)
	self:addLookupList(VendorDB,5494,L["Catherine Leland"],BZONE["Stormwind City"],55.01,70.27,1)
	self:addLookupList(VendorDB,5512,L["Kaita Deepforge"],BZONE["Stormwind City"],62.99,38.04,1)
	self:addLookupList(VendorDB,5594,L["Alchemist Pestlezugg"],BZONE["Tanaris"],51.28,27.00,0)
	self:addLookupList(VendorDB,5748,L["Killian Sanatha"],BZONE["Silverpine Forest"],33.53,18.06,2)
	self:addLookupList(VendorDB,5757,L["Lilly"],BZONE["Silverpine Forest"],43.80,50.25,2)
	self:addLookupList(VendorDB,5758,L["Leo Sarn"],BZONE["Silverpine Forest"],54.18,82.65,2)
	self:addLookupList(VendorDB,5783,L["Kalldan Felmoon"],BZONE["The Barrens"],46.20,36.54,0)
	self:addLookupList(VendorDB,5940,L["Harn Longcast"],BZONE["Mulgore"],47.57,56.60,2)
	self:addLookupList(VendorDB,5942,L["Zansoa"],BZONE["Durotar"],56.17,74.51,2)
	self:addLookupList(VendorDB,5944,L["Yonada"],BZONE["The Barrens"],45.54,58.96,2)
	self:addLookupList(VendorDB,6568,L["Vizzklick"],BZONE["Tanaris"],51.45,27.09,0)
	self:addLookupList(VendorDB,6574,L["Jun'ha"],BZONE["Arathi Highlands"],73.00,37.97,2)
	self:addLookupList(VendorDB,6576,L["Brienna Starglow"],BZONE["Thousand Needles"],9.068,19.08,1)
	self:addLookupList(VendorDB,6730,L["Jinky Twizzlefixxit"],BZONE["Thousand Needles"],77.84,77.81,0)
	self:addLookupList(VendorDB,6731,L["Harlown Darkweave"],BZONE["Ashenvale"],18.22,60.16,1)
	self:addLookupList(VendorDB,6777,L["Zan Shivsproket"],BZONE["Alterac Mountains"],85.93,79.93,0)
	self:addLookupList(VendorDB,6779,L["Smudge Thunderwood"],BZONE["Alterac Mountains"],85.97,80.20,0)
	self:addLookupList(VendorDB,7733,L["Innkeeper Fizzgrimble"],BZONE["Ironforge"],56.41,80.77,0)
	self:addLookupList(VendorDB,7852,L["Pratt McGrubben"],BZONE["Feralas"],30.02,42.93,0)
	self:addLookupList(VendorDB,7940,L["Darnall"],BZONE["Moonglade"],52.04,33.75,0)
	self:addLookupList(VendorDB,7947,L["Vivianna"],BZONE["Feralas"],31.20,43.26,1)
	self:addLookupList(VendorDB,8125,L["Dirge Quikcleave"],BZONE["Tanaris"],52.50,27.99,0)
	self:addLookupList(VendorDB,8131,L["Blizrik Buckshot"],BZONE["Tanaris"],50.91,27.03,0)
	self:addLookupList(VendorDB,8137,L["Gikkix"],BZONE["Tanaris"],66.77,24.09,0)
	self:addLookupList(VendorDB,8139,L["Jabbey"],BZONE["Tanaris"],66.79,23.83,0)
	self:addLookupList(VendorDB,8145,L["Sheendra Tallgrass"],BZONE["Feralas"],75.22,42.94,2)
	self:addLookupList(VendorDB,8150,L["Janet Hommers"],BZONE["Badlands"],28.64,34.09,1)
	self:addLookupList(VendorDB,8157,L["Logannas"],BZONE["Feralas"],32.02,44.08,1)
	self:addLookupList(VendorDB,8158,L["Bronk"],BZONE["Feralas"],76.45,44.17,2)
	self:addLookupList(VendorDB,8176,L["Gharash"],BZONE["Swamp of Sorrows"],45.49,52.15,2)
	self:addLookupList(VendorDB,8177,L["Rartar"],BZONE["Swamp of Sorrows"],44.92,57.51,2)
	self:addLookupList(VendorDB,8178,L["Nina Lightbrew"],BZONE["Blasted Lands"],66.95,19.28,1)
	self:addLookupList(VendorDB,8307,L["Tarban Hearthgrain"],BZONE["The Barrens"],54.86,32.63,2)
	self:addLookupList(VendorDB,8363,L["Shadi Mistrunner"],BZONE["Thunder Bluff"],40.09,61.96,2)
	self:addLookupList(VendorDB,8508,L["Gretta Ganter"],BZONE["Dun Morogh"],31.54,44.98,1)
	self:addLookupList(VendorDB,8678,L["Jubie Gadgetspring"],BZONE["Azshara"],45.28,91.03,0)
	self:addLookupList(VendorDB,8679,L["Knaz Blunderflame"],BZONE["Stranglethorn Vale"],50.90,35.62,0)
	self:addLookupList(VendorDB,8681,L["Outfitter Eric"],BZONE["Ironforge"],43.45,29.28,1)
	self:addLookupList(VendorDB,8878,L["Muuran"],BZONE["Desolace"],55.95,57.00,2)
	self:addLookupList(VendorDB,9179,L["Jazzrik"],BZONE["Badlands"],43.04,52.55,0)
	self:addLookupList(VendorDB,9499,BBOSS["Plugger Spazzring"],BZONE["Blackrock Depths"],0,0,1)
	self:addLookupList(VendorDB,9544,L["Yuka Screwspigot"],BZONE["Burning Steppes"],65.86,22.31,0)
	self:addLookupList(VendorDB,9636,L["Kireena"],BZONE["Desolace"],51.24,54.53,2)
	self:addLookupList(VendorDB,10118,L["Nessa Shadowsong"],BZONE["Teldrassil"],56.91,92.32,1)
	self:addLookupList(VendorDB,10856,L["Argent Quartermaster Hasana"],BZONE["Tirisfal Glades"],82.94,65.82,0)
	self:addLookupList(VendorDB,10857,L["Argent Quartermaster Lightspark"],BZONE["Western Plaguelands"],43.19,84.19,0)
	self:addLookupList(VendorDB,11185,L["Xizzer Fizzbolt"],BZONE["Winterspring"],61.31,38.96,0)
	self:addLookupList(VendorDB,11187,L["Himmik"],BZONE["Winterspring"],61.65,40.05,0)
	self:addLookupList(VendorDB,11189,L["Qia"],BZONE["Winterspring"],61.29,37.22,0)
	self:addLookupList(VendorDB,11278,L["Magnus Frostwake"],BZONE["Western Plaguelands"],68.07,77.53,0)
	self:addLookupList(VendorDB,11536,L["Quartermaster Miranda Breechlock"],BZONE["Eastern Plaguelands"],75.98,52.19,0)
	self:addLookupList(VendorDB,11557,L["Meilosh"],BZONE["Felwood"],66.25,2.961,0)
	self:addLookupList(VendorDB,12022,L["Lorelae Wintersong"],BZONE["Moonglade"],49.11,39.92,0)
	self:addLookupList(VendorDB,12033,L["Wulan"],BZONE["Desolace"],25.81,70.28,2)
	self:addLookupList(VendorDB,12043,L["Kulwia"],BZONE["Stonetalon Mountains"],45.96,60.19,2)
	self:addLookupList(VendorDB,12245,L["Vendor-Tron 1000"],BZONE["Desolace"],60.27,38.86,0)
	self:addLookupList(VendorDB,12941,L["Jase Farlane"],BZONE["Eastern Plaguelands"],74.85,50.88,0)
	self:addLookupList(VendorDB,12942,L["Leonard Porter"],BZONE["Western Plaguelands"],43.04,84.74,1)
	self:addLookupList(VendorDB,12943,L["Werg Thickblade"],BZONE["Tirisfal Glades"],83.88,69.68,2)
	self:addLookupList(VendorDB,12944,L["Lokhtos Darkbargainer"],BZONE["Blackrock Depths"],0,0,0)
	self:addLookupList(VendorDB,12962,L["Wik'Tar"],BZONE["Ashenvale"],12.31,34.20,2)
	self:addLookupList(VendorDB,13420,L["Penney Copperpinch"],BZONE["Orgrimmar"],52.73,66.28,2)
	self:addLookupList(VendorDB,13429,L["Nardstrum Copperpinch"],BZONE["Undercity"],67.73,40.03,2)
	self:addLookupList(VendorDB,13432,L["Seersa Copperpinch"],BZONE["Thunder Bluff"],42.19,55.54,2)
	self:addLookupList(VendorDB,13433,L["Wulmort Jinglepocket"],BZONE["Ironforge"],33.11,66.94,0)
	self:addLookupList(VendorDB,13435,L["Khole Jinglepocket"],BZONE["Stormwind City"],61.89,71.28,1)
	self:addLookupList(VendorDB,13476,L["Balai Lok'Wein"],BZONE["Dustwallow Marsh"],37.13,30.68,2)
	self:addLookupList(VendorDB,14371,L["Shen'dralar Provisioner"],L["Unknown Zone"],0,0,0)
	self:addLookupList(VendorDB,14637,L["Zorbin Fandazzle"],BZONE["Feralas"],45.17,43.16,0)
	self:addLookupList(VendorDB,14738,L["Otho Moji'ko"],BZONE["The Hinterlands"],78.83,80.47,2)
	self:addLookupList(VendorDB,14921,L["Rin'wosho the Trader"],BZONE["Stranglethorn Vale"],15.37,16.17,0)
	self:addLookupList(VendorDB,15165,L["Haughty Modiste"],BZONE["Tanaris"],67.00,22.09,0)
	self:addLookupList(VendorDB,15176,L["Vargus"],BZONE["Silithus"],51.22,38.83,0)
	self:addLookupList(VendorDB,15179,L["Mishta"],BZONE["Silithus"],50.10,37.02,0)
	self:addLookupList(VendorDB,15293,L["Aendel Windspear"],BZONE["Silithus"],62.73,50.53,0)
	self:addLookupList(VendorDB,15419,L["Kania"],BZONE["Silithus"],52.16,38.86,0)
	self:addLookupList(VendorDB,15471,BBOSS["Lieutenant General Andorov"],BZONE["Ruins of Ahn'Qiraj"],0,0,0)
	self:addLookupList(VendorDB,16224,L["Rathis Tomber"],BZONE["Ghostlands"],47.00,28.56,2)
	self:addLookupList(VendorDB,16253,L["Master Chef Mouldier"],BZONE["Ghostlands"],47.88,31.20,2)
	self:addLookupList(VendorDB,16262,L["Landraelanis"],BZONE["Eversong Woods"],49.03,46.98,2)
	self:addLookupList(VendorDB,16365,L["Master Craftsman Omarion"],L["Unknown Zone"],0,0,0)
	self:addLookupList(VendorDB,16388,L["Koren"],BZONE["Karazhan"],0,0,0)
	self:addLookupList(VendorDB,16583,L["Rohok"],BZONE["Hellfire Peninsula"],53.04,38.25,2)
	self:addLookupList(VendorDB,16585,L["Cookie One-Eye"],BZONE["Hellfire Peninsula"],55.27,40.79,2)
	self:addLookupList(VendorDB,16588,L["Apothecary Antonivich"],BZONE["Hellfire Peninsula"],52.40,35.83,2)
	self:addLookupList(VendorDB,16624,L["Gelanthis"],BZONE["Silvermoon City"],90.88,75.41,2)
	self:addLookupList(VendorDB,16635,L["Lyna"],BZONE["Silvermoon City"],69.90,24.66,2)
	self:addLookupList(VendorDB,16638,L["Deynna"],BZONE["Silvermoon City"],56.22,50.61,2)
	self:addLookupList(VendorDB,16641,L["Melaris"],BZONE["Silvermoon City"],66.87,19.21,2)
	self:addLookupList(VendorDB,16657,L["Feera"],BZONE["The Exodar"],55.48,90.51,1)
	self:addLookupList(VendorDB,16670,L["Eriden"],BZONE["Silvermoon City"],80.21,37.02,2)
	self:addLookupList(VendorDB,16677,L["Quelis"],BZONE["Silvermoon City"],69.44,70.15,2)
	self:addLookupList(VendorDB,16689,L["Zaralda"],BZONE["Silvermoon City"],83.94,80.37,2)
	self:addLookupList(VendorDB,16705,L["Altaa"],BZONE["The Exodar"],28.14,62.15,1)
	self:addLookupList(VendorDB,16713,L["Arras"],BZONE["The Exodar"],60.45,88.42,1)
	self:addLookupList(VendorDB,16718,L["Phea"],BZONE["The Exodar"],56.20,28.00,1)
	self:addLookupList(VendorDB,16722,L["Egomis"],BZONE["The Exodar"],39.43,39.56,1)
	self:addLookupList(VendorDB,16748,L["Haferet"],BZONE["The Exodar"],66.62,75.23,1)
	self:addLookupList(VendorDB,16767,L["Neii"],BZONE["The Exodar"],64.16,68.43,1)
	self:addLookupList(VendorDB,16782,L["Yatheon"],BZONE["Silvermoon City"],76.05,39.93,2)
	self:addLookupList(VendorDB,16826,L["Sid Limbardi"],BZONE["Ironforge"],58.54,55.90,1)
	self:addLookupList(VendorDB,17246,L["\"Cookie\" McWeaksauce"],BZONE["Bloodmyst Isle"],53.91,56.07,1)
	self:addLookupList(VendorDB,17512,L["Arred"],BZONE["The Exodar"],44.92,25.53,1)
	self:addLookupList(VendorDB,17518,L["Ythyar"],BZONE["Karazhan"],0,0,0)
	self:addLookupList(VendorDB,17585,L["Quartermaster Urgronn"],BZONE["Hellfire Peninsula"],55.25,38.49,2)
	self:addLookupList(VendorDB,17657,L["Logistics Officer Ulrike"],BZONE["Hellfire Peninsula"],56.90,62.17,1)
	self:addLookupList(VendorDB,17904,L["Fedryen Swiftspear"],BZONE["Zangarmarsh"],79.19,61.89,0)
	self:addLookupList(VendorDB,18005,L["Haalrun"],BZONE["Zangarmarsh"],68.19,49.07,1)
	self:addLookupList(VendorDB,18011,L["Zurai"],BZONE["Zangarmarsh"],85.20,57.92,2)
	self:addLookupList(VendorDB,18015,L["Gambarinka"],BZONE["Zangarmarsh"],31.77,49.65,2)
	self:addLookupList(VendorDB,18017,L["Seer Janidi"],BZONE["Zangarmarsh"],31.95,52.05,2)
	self:addLookupList(VendorDB,18255,L["Apprentice Darius"],BZONE["Orgrimmar"],48.74,80.89,0)
	self:addLookupList(VendorDB,18382,L["Mycah"],BZONE["Zangarmarsh"],18.43,51.11,0)
	self:addLookupList(VendorDB,18427,L["Fazu"],BZONE["Bloodmyst Isle"],54.42,56.80,1)
	self:addLookupList(VendorDB,18484,L["Wind Trader Lathrai"],BZONE["Shattrath City"],72.68,31.84,0)
	self:addLookupList(VendorDB,18664,L["Aged Dalaran Wizard"],BZONE["Old Hillsbrad Foothills"],0,0,0)
	self:addLookupList(VendorDB,18672,L["Thomas Yance"],BZONE["Old Hillsbrad Foothills"],0,0,0)
	self:addLookupList(VendorDB,18753,L["Felannia"],BZONE["Hellfire Peninsula"],52.38,35.99,2)
	self:addLookupList(VendorDB,18773,L["Johan Barnes"],BZONE["Hellfire Peninsula"],54.02,66.00,1)
	self:addLookupList(VendorDB,18775,L["Lebowski"],BZONE["Hellfire Peninsula"],56.06,64.90,1)
	self:addLookupList(VendorDB,18802,L["Alchemist Gribble"],BZONE["Hellfire Peninsula"],54.00,66.04,1)
	self:addLookupList(VendorDB,18821,L["Quartermaster Jaffrey Noreliqe"],BZONE["Nagrand"],42.37,45.04,2)
	self:addLookupList(VendorDB,18822,L["Quartermaster Davian Vaclav"],BZONE["Nagrand"],41.07,43.98,1)
	self:addLookupList(VendorDB,18911,L["Juno Dufrain"],BZONE["Zangarmarsh"],78.16,64.88,0)
	self:addLookupList(VendorDB,18951,L["Erilia"],BZONE["Eversong Woods"],56.05,54.45,2)
	self:addLookupList(VendorDB,18957,L["Innkeeper Grilka"],BZONE["Silvermoon City"],40.77,60.41,2)
	self:addLookupList(VendorDB,18960,L["Rungor"],BZONE["Terokkar Forest"],48.97,46.75,2)
	self:addLookupList(VendorDB,18990,L["Burko"],BZONE["Hellfire Peninsula"],23.09,38.95,1)
	self:addLookupList(VendorDB,18991,L["Aresella"],BZONE["Hellfire Peninsula"],26.28,62.30,2)
	self:addLookupList(VendorDB,19015,L["Mathar G'ochar"],BZONE["Nagrand"],56.21,38.15,2)
	self:addLookupList(VendorDB,19017,L["Borto"],BZONE["Nagrand"],53.98,71.30,1)
	self:addLookupList(VendorDB,19038,L["Supply Officer Mills"],BZONE["Terokkar Forest"],56.01,54.08,1)
	self:addLookupList(VendorDB,19042,L["Leeli Longhaggle"],BZONE["Terokkar Forest"],57.48,53.11,1)
	self:addLookupList(VendorDB,19074,L["Skreah"],BZONE["Shattrath City"],46.48,20.15,0)
	self:addLookupList(VendorDB,19195,L["Jim Saltit"],BZONE["Shattrath City"],63.75,69.67,0)
	self:addLookupList(VendorDB,19196,L["Cro Threadstrong"],BZONE["Shattrath City"],67.05,67.36,0)
	self:addLookupList(VendorDB,19213,L["Eiin"],BZONE["Shattrath City"],66.44,68.89,0)
	self:addLookupList(VendorDB,19234,L["Yurial Soulwater"],BZONE["Shattrath City"],44.75,97.25,0)
	self:addLookupList(VendorDB,19296,L["Innkeeper Biribi"],BZONE["Ironforge"],50.91,74.37,1)
	self:addLookupList(VendorDB,19321,L["Quartermaster Endarin"],BZONE["Shattrath City"],48.19,26.80,1)
	self:addLookupList(VendorDB,19331,L["Quartermaster Enuril"],BZONE["Shattrath City"],60.00,63.86,0)
	self:addLookupList(VendorDB,19342,L["Krek Cragcrush"],BZONE["Shadowmoon Valley"],29.59,31.25,2)
	self:addLookupList(VendorDB,19351,L["Daggle Ironshaper"],BZONE["Shadowmoon Valley"],36.95,54.68,1)
	self:addLookupList(VendorDB,19373,L["Mari Stonehand"],BZONE["Shadowmoon Valley"],37.08,55.15,1)
	self:addLookupList(VendorDB,19383,L["Captured Gnome"],BZONE["Zangarmarsh"],32.47,49.45,2)
	self:addLookupList(VendorDB,19521,L["Arrond"],BZONE["Shadowmoon Valley"],55.79,59.32,0)
	self:addLookupList(VendorDB,19537,L["Dealer Malij"],BZONE["Netherstorm"],44.01,34.48,0)
	self:addLookupList(VendorDB,19540,L["Asarnan"],BZONE["Netherstorm"],44.75,34.42,0)
	self:addLookupList(VendorDB,19661,L["Viggz Shinesparked"],BZONE["Shattrath City"],65.11,69.07,0)
	self:addLookupList(VendorDB,19662,L["Aaron Hollman"],BZONE["Shattrath City"],64.26,71.91,0)
	self:addLookupList(VendorDB,19663,L["Madame Ruby"],BZONE["Shattrath City"],64.04,70.43,0)
	self:addLookupList(VendorDB,19694,L["Loolruna"],BZONE["Zangarmarsh"],68.32,49.28,1)
	self:addLookupList(VendorDB,19722,L["Muheru the Weaver"],BZONE["Zangarmarsh"],41.14,28.13,1)
	self:addLookupList(VendorDB,19836,L["Mixie Farshot"],BZONE["Hellfire Peninsula"],61.42,81.96,2)
	self:addLookupList(VendorDB,19837,L["Daga Ramba"],BZONE["Blade's Edge Mountains"],51.60,58.07,2)
	self:addLookupList(VendorDB,20028,L["Doba"],BZONE["Blade's Edge Mountains"],28.62,92.52,1)
	self:addLookupList(VendorDB,20096,L["Uriku"],BZONE["Nagrand"],56.33,74.18,1)
	self:addLookupList(VendorDB,20097,L["Nula the Butcher"],BZONE["Nagrand"],58.11,35.30,2)
	self:addLookupList(VendorDB,20241,L["Provisioner Nasela"],BZONE["Nagrand"],53.74,36.98,2)
	self:addLookupList(VendorDB,20242,L["Karaaz"],BZONE["Netherstorm"],44.30,35.09,0)
	self:addLookupList(VendorDB,20916,L["Xerintha Ravenoak"],BZONE["Blade's Edge Mountains"],62.02,40.03,0)
	self:addLookupList(VendorDB,21113,L["Sassa Weldwell"],BZONE["Blade's Edge Mountains"],61.16,69.48,1)
	self:addLookupList(VendorDB,21432,L["Almaador"],BZONE["Orgrimmar"],28.83,44.22,0)
	self:addLookupList(VendorDB,21474,L["Coreiel"],BZONE["Nagrand"],43.04,42.43,2)
	self:addLookupList(VendorDB,21485,L["Aldraan"],BZONE["Nagrand"],43.14,42.47,1)
	self:addLookupList(VendorDB,21643,L["Alurmi"],BZONE["Tanaris"],63.70,57.99,0)
	self:addLookupList(VendorDB,21655,L["Nakodu"],BZONE["Shattrath City"],62.90,68.98,0)
	self:addLookupList(VendorDB,22208,L["Nasmara Moonsong"],BZONE["Shattrath City"],65.90,68.15,0)
	self:addLookupList(VendorDB,22212,L["Andrion Darkspinner"],BZONE["Shattrath City"],66.53,68.75,0)
	self:addLookupList(VendorDB,22213,L["Gidge Spellweaver"],BZONE["Shattrath City"],67.05,69.04,0)
	self:addLookupList(VendorDB,23007,L["Paulsta'ats"],BZONE["Nagrand"],30.97,57.12,0)
	self:addLookupList(VendorDB,23010,L["Wolgren Jinglepocket"],BZONE["The Exodar"],54.59,47.66,1)
	self:addLookupList(VendorDB,23012,L["Hotoppik Copperpinch"],BZONE["Silvermoon City"],63.36,77.10,2)
	self:addLookupList(VendorDB,23064,L["Eebee Jinglepocket"],BZONE["Shattrath City"],51.22,31.00,0)
	self:addLookupList(VendorDB,23159,L["Okuno"],BZONE["Black Temple"],0,0,0)
	self:addLookupList(VendorDB,23437,L["Indormi"],BZONE["Hyjal Summit"],0,0,0)
	self:addLookupList(VendorDB,25032,L["Eldara Dawnrunner"],BZONE["Shattrath City"],55.25,2.828,0)
	self:addLookupList(VendorDB,25950,L["Shaani"],BZONE["Isle of Quel'Danas"],51.04,33.24,0)
	self:addLookupList(VendorDB,26569,L["Alys Vol'tyr"],BZONE["Dragonblight"],36.03,46.94,2)
	self:addLookupList(VendorDB,26868,L["Provisioner Lorkran"],BZONE["Grizzly Hills"],22.48,65.90,2)
	self:addLookupList(VendorDB,26947,L["Vix Chromeblaster"],BZONE["Borean Tundra"],31.32,40.90,2)
	self:addLookupList(VendorDB,27030,L["Bradley Towns"],BZONE["Dragonblight"],76.59,59.93,2)
	self:addLookupList(VendorDB,27054,L["Modoru"],BZONE["Ironforge"],37.7,55.80,1)
	self:addLookupList(VendorDB,27147,L["Librarian Erickson"],BZONE["Borean Tundra"],45.94,32.68,0)
	self:addLookupList(VendorDB,27666,L["Ontuvo"],BZONE["Zul'Aman"],0,0,0)
	self:addLookupList(VendorDB,28714,L["Ildine Sorrowspear"],BZONE["Dalaran"],39.20,41.01,0)
	self:addLookupList(VendorDB,28721,L["Tiffany Cartier"],BZONE["Ironforge"],32.22,26.74,0)
	self:addLookupList(VendorDB,29510,L["Linna Bruder"],BZONE["Dalaran"],34.72,33.57,0)
	self:addLookupList(VendorDB,29511,L["Lalla Brightweave"],BZONE["Dalaran"],36.72,33.33,0)
	self:addLookupList(VendorDB,29512,L["Ainderu Summerleaf"],BZONE["Dalaran"],37.06,33.74,0)
	self:addLookupList(VendorDB,30431,L["Veteran Crusader Aliocha Segard"],BZONE["Icecrown"],88.02,76.86,0)
	self:addLookupList(VendorDB,30489,L["Morgan Day"],BZONE["Wintergrasp"],49.15,18.06,1)
	self:addLookupList(VendorDB,31031,L["Misensi"],BZONE["Icecrown"],58.98,63.45,2)
	self:addLookupList(VendorDB,31032,L["Derek Odds"],BZONE["Dalaran"],41.14,65.79,1)
	self:addLookupList(VendorDB,31910,L["Geen"],BZONE["Sholazar Basin"],54.22,56.98,0)
	self:addLookupList(VendorDB,31911,L["Tanak"],BZONE["Sholazar Basin"],55.09,68.94,0)
	self:addLookupList(VendorDB,31916,L["Tanaika"],BZONE["Howling Fjord"],25.77,58.73,0)
	self:addLookupList(VendorDB,32287,L["Archmage Alvareaux"],BZONE["Dalaran"],26.40,47.83,0)
	self:addLookupList(VendorDB,32294,L["Knight Dameron"],BZONE["Wintergrasp"],51.41,17.55,1)
	self:addLookupList(VendorDB,32296,L["Stone Guard Mukar"],BZONE["Wintergrasp"],51.16,17.77,2)
	self:addLookupList(VendorDB,32379,L["Captain O'Neal"],BZONE["Stormwind City"],74.99,68.05,1)
	self:addLookupList(VendorDB,32382,L["Lady Palanseer"],BZONE["Orgrimmar"],37.08,64.81,2)
	self:addLookupList(VendorDB,32514,L["Vanessa Sellers"],BZONE["Dalaran"],38.69,40.77,0)
	self:addLookupList(VendorDB,32515,L["Braeg Stoutbeard"],BZONE["Dalaran"],38.52,29.60,0)
	self:addLookupList(VendorDB,32533,L["Cielstrasza"],BZONE["Dragonblight"],60.05,54.11,0)
	self:addLookupList(VendorDB,32538,L["Duchess Mynx"],BZONE["Icecrown"],43.04,20.51,0)
	self:addLookupList(VendorDB,32540,L["Lillehoff"],BZONE["The Storm Peaks"],65.78,61.58,0)
	self:addLookupList(VendorDB,32564,L["Logistics Officer Silverstone"],BZONE["Borean Tundra"],57.56,66.11,1)
	self:addLookupList(VendorDB,32565,L["Gara Skullcrush"],BZONE["Borean Tundra"],40.84,54.08,2)
	self:addLookupList(VendorDB,32763,L["Sairuk"],BZONE["Dragonblight"],48.95,76.27,0)
	self:addLookupList(VendorDB,32773,L["Logistics Officer Brighton"],BZONE["Howling Fjord"],60.28,63.99,1)
	self:addLookupList(VendorDB,32774,L["Sebastian Crane"],BZONE["Howling Fjord"],79.54,32.82,2)

end
