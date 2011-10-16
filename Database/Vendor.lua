--[[
************************************************************************
Vendor.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]]--

-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private	= ...

local LibStub = _G.LibStub

local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BB	= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

private.vendor_list = {}

function addon:InitVendor()
	local function AddVendor(id_num, name, zone, x, y, faction)
		private:AddListEntry(private.vendor_list, id_num, name, zone, x, y, faction)
	end

	AddVendor(66,		L["Tharynn Bouden"],			BZ["Elwynn Forest"],			41.9, 67.1, "Alliance")
	AddVendor(340,		L["Kendor Kabonka"],			BZ["Stormwind City"],			76.6, 52.8, "Alliance") -- COMPLETELY UPDATED
	AddVendor(734,		L["Corporal Bluth"],			BZ["Northern Stranglethorn"],		47.5, 10.3, "Alliance") -- UPDATED
	AddVendor(777,		L["Amy Davenport"],			BZ["Redridge Mountains"],		29.1, 47.5, "Alliance")
	AddVendor(843,		L["Gina MacGregor"],			BZ["Westfall"],				57.6, 54.0, "Alliance")
	AddVendor(989,		L["Banalash"],				BZ["Swamp of Sorrows"],			46.6, 56.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(1146,		L["Vharr"],				BZ["Northern Stranglethorn"],		38.7, 49.2, "Horde")   -- UPDATED
	AddVendor(1148,		L["Nerrist"],				BZ["Northern Stranglethorn"],		39.2, 51.0, "Horde")  -- UPDATED
	AddVendor(1149,		L["Uthok"],				BZ["Northern Stranglethorn"],		37.5, 49.2, "Horde")   -- UPDATED
	AddVendor(1250,		L["Drake Lindgren"],			BZ["Elwynn Forest"],			83.3, 66.7, "Alliance")
	AddVendor(1286,		L["Edna Mullby"],			BZ["Stormwind City"],			64.7, 71.2, "Alliance") -- COMPLETELY UPDATED
	AddVendor(1313,		L["Maria Lumere"],			BZ["Stormwind City"],			55.7, 85.5, "Alliance") -- COMPLETELY UPDATED
	AddVendor(1318,		L["Jessara Cordell"],			BZ["Stormwind City"],			53.0, 74.2, "Alliance") -- COMPLETELY UPDATED
	AddVendor(1347,		L["Alexandra Bolero"],			BZ["Stormwind City"],			53.3, 81.7, "Alliance") -- COMPLETELY UPDATED
	AddVendor(1448,		L["Neal Allen"],			BZ["Wetlands"],				11.8, 52.6, "Alliance")
	AddVendor(1454,		L["Jennabink Powerseam"],		BZ["Wetlands"],				 8.1, 55.9, "Alliance")
	AddVendor(1465,		L["Drac Roughcut"],			BZ["Loch Modan"],			35.6, 49.0, "Alliance")
	AddVendor(1471,		L["Jannos Ironwill"],			BZ["Arathi Highlands"],			46.0, 47.7, "Alliance")
	AddVendor(1474,		L["Rann Flamespinner"],			BZ["Loch Modan"],			36.0, 46.0, "Alliance")
	AddVendor(1684,		L["Khara Deepwater"],			BZ["Loch Modan"],			39.5, 39.3, "Alliance")
	AddVendor(1685,		L["Xandar Goodbeard"],			BZ["Loch Modan"],			82.5, 63.5, "Alliance")
	AddVendor(2118,		L["Abigail Shiel"],			BZ["Tirisfal Glades"],			61.0, 51.0, "Horde") -- UPDATED
	AddVendor(2393,		L["Christoph Jeffcoat"],		BZ["Hillsbrad Foothills"],		57.5, 47.8, "Horde") -- COMPLETELY UPDATED
	AddVendor(2394,		L["Mallen Swain"],			BZ["Hillsbrad Foothills"],		58.1, 47.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(2397,		L["Derak Nightfall"],			BZ["Hillsbrad Foothills"],		57.7, 45.2, "Horde") -- COMPLETELY UPDATED
	AddVendor(2480,		L["Bro'kin"],				BZ["Hillsbrad Foothills"],		44.0, 21.8, "Neutral") -- COMPLETELY UPDATED
	AddVendor(2482,		L["Zarena Cromwind"],			BZ["The Cape of Stranglethorn"],	43.0, 70.7, "Neutral")  -- UPDATED
	AddVendor(2483,		L["Jaquilina Dramet"],			BZ["Northern Stranglethorn"],		43.7, 23.1, "Neutral") -- UPDATED
	AddVendor(2663,		L["Narkk"],				BZ["The Cape of Stranglethorn"],	42.7, 69.2, "Neutral")   -- UPDATED
	AddVendor(2664,		L["Kelsey Yance"],			BZ["The Cape of Stranglethorn"],	42.8, 69.1, "Neutral")   -- UPDATED
	AddVendor(2668,		L["Danielle Zipstitch"],		BZ["Duskwood"],				75.8, 45.5, "Alliance")
	AddVendor(2669,		L["Sheri Zipstitch"],			BZ["Duskwood"],				75.7, 45.5, "Alliance")
	AddVendor(2670,		L["Xizk Goodstitch"],			BZ["The Cape of Stranglethorn"],	43.6, 73.0, "Neutral")  -- UPDATED
	AddVendor(2672,		L["Cowardly Crosby"],			BZ["The Cape of Stranglethorn"],	40.9, 82.5, "Neutral")   -- UPDATED
	AddVendor(2679,		L["Wenna Silkbeard"],			BZ["Wetlands"],				25.7, 25.8, "Alliance")
	AddVendor(2683,		L["Namdo Bizzfizzle"],			BZ["Gnomeregan"],			   0,	 0, "Alliance")
	AddVendor(2685,		L["Mazk Snipeshot"],			BZ["The Cape of Stranglethorn"],	43.2, 70.2, "Neutral")  -- UPDATED
	AddVendor(2687,		L["Gnaz Blunderflame"],			BZ["Northern Stranglethorn"],		67.5, 61.5, "Neutral")  -- UPDATED
	AddVendor(2688,		L["Ruppo Zipcoil"],			BZ["The Hinterlands"],			34.3, 37.9, "Neutral") -- COMPLETELY UPDATED
	AddVendor(2697,		L["Clyde Ranthal"],			BZ["Redridge Mountains"],		88.9, 70.9, "Alliance")
	AddVendor(2698,		L["George Candarte"],			BZ["Hillsbrad Foothills"],		76.7, 58.5, "Horde") -- COMPLETELY UPDATED
	AddVendor(2699,		L["Rikqiz"],				BZ["The Cape of Stranglethorn"],	43.2, 71.7, "Neutral")   -- UPDATED
	AddVendor(2803,		L["Malygen"],				BZ["Felwood"],				62.3, 25.6, "Alliance")
	AddVendor(2810,		L["Hammon Karwn"],			BZ["Arathi Highlands"],			46.5, 47.3, "Alliance")
	AddVendor(2812,		L["Drovnar Strongbrew"],		BZ["Arathi Highlands"],			46.4, 47.1, "Alliance")
	AddVendor(2814,		L["Narj Deepslice"],			BZ["Arathi Highlands"],			45.6, 47.6, "Alliance")
	AddVendor(2816,		L["Androd Fadran"],			BZ["Arathi Highlands"],			45.0, 46.9, "Alliance")
	AddVendor(2819,		L["Tunkk"],				BZ["Arathi Highlands"],			70.0, 35.4, "Horde")
	AddVendor(2821,		L["Keena"],				BZ["Arathi Highlands"],			74.0, 32.7, "Horde")
	AddVendor(2838,		L["Crazk Sparks"],			BZ["The Cape of Stranglethorn"],	43.0, 72.8, "Neutral")   -- UPDATED
	AddVendor(2843,		L["Jutak"],				BZ["The Cape of Stranglethorn"],	41.6, 74.1, "Neutral")   -- UPDATED
	AddVendor(2846,		L["Blixrez Goodstitch"],		BZ["The Cape of Stranglethorn"],	42.8, 74.1, "Neutral")   -- UPDATED
	AddVendor(2848,		L["Glyx Brewright"],			BZ["The Cape of Stranglethorn"],	42.6, 74.9, "Neutral")   -- UPDATED
	AddVendor(3005,		L["Mahu"],				BZ["Thunder Bluff"],			43.8, 45.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(3008,		L["Mak"],				BZ["Thunder Bluff"],			42.0, 43.5, "Horde") -- COMPLETELY UPDATED
	AddVendor(3012,		L["Nata Dawnstrider"],			BZ["Thunder Bluff"],			44.9, 37.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(3027,		L["Naal Mistrunner"],			BZ["Thunder Bluff"],			51.0, 52.5, "Horde") -- COMPLETELY UPDATED
	AddVendor(3029,		L["Sewa Mistrunner"],			BZ["Thunder Bluff"],			55.8, 47.0, "Horde") -- COMPLETELY UPDATED
	AddVendor(3081,		L["Wunna Darkmane"],			BZ["Mulgore"],				46.1, 58.2, "Horde")
	AddVendor(3085,		L["Gloria Femmel"],			BZ["Redridge Mountains"],		26.7, 43.5, "Alliance")
	AddVendor(3134,		L["Kzixx"],				BZ["Duskwood"],				81.9, 19.9, "Neutral") -- COMPLETELY UPDATED
	AddVendor(3178,		L["Stuart Fleming"],			BZ["Wetlands"],				 8.1, 58.4, "Alliance")
	AddVendor(3333,		L["Shankys"],				BZ["Orgrimmar"],			66.74, 41.86, "Horde") -- UPDATED
	AddVendor(3335,		L["Hagrus"],				BZ["Orgrimmar"],			46.0, 45.9, "Horde")
	AddVendor(3346,		L["Kithas"],				BZ["Orgrimmar"],			53.3, 48.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(3348,		L["Kor'geld"],				BZ["Orgrimmar"],			55.23, 45.83, "Horde") -- UPDATED
	AddVendor(3356,		L["Sumi"],				BZ["Orgrimmar"],			75.8, 35.2, "Horde") -- COMPLETELY UPDATED
	AddVendor(3364,		L["Borya"],				BZ["Orgrimmar"],			60.7, 58.6, "Horde") -- COMPLETELY UPDATED
	AddVendor(3366,		L["Tamar"],				BZ["Orgrimmar"],			60.3, 54.3, "Horde") -- COMPLETELY UPDATED
	AddVendor(3367,		L["Felika"],				BZ["Orgrimmar"],			60.5, 50.7, "Horde")
	AddVendor(3400,		L["Xen'to"],				BZ["Orgrimmar"],			32.6, 68.6, "Horde") -- UPDATED
	AddVendor(3413,		L["Sovik"],				BZ["Orgrimmar"],			75.6, 25.2, "Horde")
	AddVendor(3482,		L["Tari'qa"],				BZ["Northern Barrens"],			49.0, 58.2, "Horde")   -- UPDATED
	AddVendor(3485,		L["Wrahk"],				BZ["Northern Barrens"],			50.0, 61.1, "Horde")   -- UPDATED
	AddVendor(3489,		L["Zargh"],				BZ["Northern Barrens"],			50.6, 57.8, "Horde")   -- UPDATED
	AddVendor(3490,		L["Hula'mahi"],				BZ["Northern Barrens"],			48.6, 58.4, "Horde")   -- UPDATED
	AddVendor(3495,		L["Gagsprocket"],			BZ["Northern Barrens"],			68.4, 69.2, "Neutral")   -- UPDATED
	AddVendor(3497,		L["Kilxx"],				BZ["Northern Barrens"],			68.6, 72.5, "Neutral")   -- UPDATED
	AddVendor(3499,		L["Ranik"],				BZ["Northern Barrens"],			67.1, 73.5, "Neutral")   -- UPDATED
	AddVendor(3522,		L["Constance Brisboise"],		BZ["Tirisfal Glades"],			52.6, 55.7, "Horde")
	AddVendor(3537,		L["Zixil"],				BZ["Hillsbrad Foothills"],		49.8, 60.8, "Neutral") -- COMPLETELY UPDATED
	AddVendor(3550,		L["Martine Tramblay"],			BZ["Tirisfal Glades"],			65.8, 59.6, "Horde") -- UPDATED
	AddVendor(3556,		L["Andrew Hilbert"],			BZ["Silverpine Forest"],		43.2, 40.7, "Horde")
	AddVendor(3881,		L["Grimtak"],				BZ["Durotar"],				50.7, 42.8, "Horde") -- COMPLETELY UPDATED
	AddVendor(3954,		L["Dalria"],				BZ["Ashenvale"],			35.1, 52.1, "Alliance")
	AddVendor(3958,		L["Lardan"],				BZ["Ashenvale"],			34.8, 49.8, "Alliance")
	AddVendor(4083,		L["Jeeda"],				BZ["Stonetalon Mountains"],		50.5, 63.4, "Horde") -- COMPLETELY UPDATED
	AddVendor(4168,		L["Elynna"],				BZ["Darnassus"],			60.6, 36.9, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4223,		L["Fyldan"],				BZ["Darnassus"],			49.5, 36.9, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4225,		L["Saenorion"],				BZ["Darnassus"],			60.0, 37.3, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4226,		L["Ulthir"],				BZ["Darnassus"],			54.6, 38.9, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4228,		L["Vaean"],				BZ["Darnassus"],			56.4, 32.2, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4229,		L["Mythrin'dir"],			BZ["Darnassus"],			58.1, 34.2, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4265,		L["Nyoma"],				BZ["Teldrassil"],			56.6, 53.6, "Alliance") -- COMPLETELY UPDATED
	AddVendor(4305,		L["Kriggon Talsone"],			BZ["Westfall"],				36.2, 90.1, "Alliance")
	AddVendor(4553,		L["Ronald Burch"],			BZ["Undercity"],			62.3, 43.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(4561,		L["Daniel Bartlett"],			BZ["Undercity"],			64.1, 37.4, "Horde") -- COMPLETELY UPDATED
	AddVendor(4574,		L["Lizbeth Cromwell"],			BZ["Undercity"],			81.0, 30.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(4577,		L["Millie Gregorian"],			BZ["Undercity"],			70.6, 30.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(4589,		L["Joseph Moore"],			BZ["Undercity"],			70.0, 58.5, "Horde") -- COMPLETELY UPDATED
	AddVendor(4610,		L["Algernon"],				BZ["Undercity"],			51.7, 74.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(4617,		L["Thaddeus Webb"],			BZ["Undercity"],			62.4, 61.0, "Horde") -- COMPLETELY UPDATED
	AddVendor(4775,		L["Felicia Doan"],			BZ["Undercity"],			64.1, 50.6, "Horde") -- COMPLETELY UPDATED
	AddVendor(4782,		L["Truk Wildbeard"],			BZ["The Hinterlands"],			14.4, 42.5, "Alliance")
	AddVendor(4879,		L["Ogg'marr"],				BZ["Dustwallow Marsh"],			36.7, 31.0, "Horde")
	AddVendor(4897,		L["Helenia Olden"],			BZ["Dustwallow Marsh"],			66.4, 51.5, "Alliance")
	AddVendor(5128,		L["Bombus Finespindle"],		BZ["Ironforge"],			39.6, 34.5, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5154,		L["Poranna Snowbraid"],		BZ["Ironforge"],			43.0, 28.3, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5158,		L["Tilli Thistlefuzz"],			BZ["Ironforge"],			60.7, 44.2, "Alliance")
	AddVendor(5160,		L["Emrul Riknussun"],			BZ["Ironforge"],			59.9, 37.7, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5162,		L["Tansy Puddlefizz"],			BZ["Ironforge"],			48.0,  6.3, "Alliance")
	AddVendor(5163,		L["Burbik Gearspanner"],		BZ["Ironforge"],			46.5, 27.1, "Alliance")
	AddVendor(5175,		L["Gearcutter Cogspinner"],		BZ["Ironforge"],			68.0, 43.1, "Alliance")
	AddVendor(5178,		L["Soolie Berryfizz"],			BZ["Ironforge"],			66.6, 54.5, "Alliance")
	AddVendor(5411,		L["Krinkle Goodsteel"],			BZ["Tanaris"],				51.2, 30.4, "Neutral") -- COMPLETELY UPDATED
	AddVendor(5483,		L["Erika Tate"],			BZ["Stormwind City"],			77.6, 53.0, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5494,		L["Catherine Leland"],			BZ["Stormwind City"],			55.1, 69.5, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5512,		L["Kaita Deepforge"],			BZ["Stormwind City"],			63.5, 37.6, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5565,		L["Jillian Tanner"],			BZ["Stormwind City"],			71.6, 62.8, "Alliance") -- COMPLETELY UPDATED
	AddVendor(5594,		L["Alchemist Pestlezugg"],		BZ["Tanaris"],				50.8, 28.0, "Neutral") -- COMPLETELY UPDATED
	AddVendor(5748,		L["Killian Sanatha"],			BZ["Silverpine Forest"],		33.0, 17.8, "Horde")
	AddVendor(5757,		L["Lilly"],				BZ["Silverpine Forest"],		43.1, 50.8, "Horde")
	AddVendor(5758,		L["Leo Sarn"],				BZ["Silverpine Forest"],		53.9, 82.3, "Horde")
	AddVendor(5940,		L["Harn Longcast"],			BZ["Mulgore"],				47.5, 55.1, "Horde")
	AddVendor(5942,		L["Zansoa"],				BZ["Durotar"],				57.4, 77.0, "Horde") -- COMPLETELY UPDATED
	AddVendor(6568,		L["Vizzklick"],				BZ["Tanaris"],				50.7, 28.7, "Neutral") -- COMPLETELY UPDATED
	AddVendor(6567,		L["Ghok'kah"],				BZ["Dustwallow Marsh"],			35.2, 30.8, "Horde")
	AddVendor(6574,		L["Jun'ha"],				BZ["Arathi Highlands"],			72.7, 36.5, "Horde")
	AddVendor(6730,		L["Jinky Twizzlefixxit"],		BZ["Thousand Needles"],			77.7, 77.8, "Alliance")
	AddVendor(6777,		L["Zan Shivsproket"],			BZ["Hillsbrad Foothills"],		71.5, 45.5, "Neutral") -- COMPLETELY UPDATED
	AddVendor(6779,		L["Smudge Thunderwood"],		BZ["Hillsbrad Foothills"],		71.5, 45.5, "Neutral") -- COMPLETELY UPDATED
	AddVendor(7733,		L["Innkeeper Fizzgrimble"],		BZ["Tanaris"],				52.6, 27.0, "Neutral") -- COMPLETELY UPDATED
	AddVendor(7854,		L["Jangdor Swiftstrider"],		BZ["Feralas"],				52.8, 47.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(7940,		L["Darnall"],				BZ["Moonglade"],			51.6, 33.3, "Neutral")
	AddVendor(7947,		L["Vivianna"],				BZ["Feralas"],				46.2, 41.6, "Alliance") -- NO CHARACTER HIGH ENOUGH LEVEL FOR ME TO SCAN THIS NPC
	AddVendor(8131,		L["Blizrik Buckshot"],			BZ["Tanaris"],				50.7, 28.5, "Neutral") -- COMPLETELY UPDATED
	AddVendor(8145,		L["Sheendra Tallgrass"],		BZ["Feralas"],				74.5, 42.8, "Horde")
	AddVendor(8150,		L["Janet Hommers"],			BZ["Desolace"],				66.2,  6.7, "Alliance")
	AddVendor(8157,		L["Logannas"],				BZ["Feralas"],				32.7, 44.0, "Alliance")
	AddVendor(8158,		L["Bronk"],				BZ["Feralas"],				76.1, 43.3, "Horde")
	AddVendor(8160,		L["Nioma"],				BZ["The Hinterlands"],			13.4, 43.3, "Alliance")
	AddVendor(8161,		L["Harggan"],				BZ["The Hinterlands"],			13.4, 44.0, "Alliance")
	AddVendor(8176,		L["Gharash"],				BZ["Swamp of Sorrows"],			47.2, 52.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(8177,		L["Rartar"],				BZ["Swamp of Sorrows"],			47.2, 57.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(8178,		L["Nina Lightbrew"],			BZ["Blasted Lands"],			66.9, 18.3, "Alliance")
	AddVendor(8307,		L["Tarban Hearthgrain"],		BZ["Northern Barrens"],			55.1, 61.7, "Horde")  -- UPDATED
	AddVendor(8363,		L["Shadi Mistrunner"],			BZ["Thunder Bluff"],			40.6, 64.0, "Horde") -- COMPLETELY UPDATED
	AddVendor(8508,		L["Gretta Ganter"],			BZ["Dun Morogh"],			31.5, 44.7, "Alliance")
	AddVendor(8679,		L["Knaz Blunderflame"],			BZ["Northern Stranglethorn"],		67.7, 61.1, "Neutral")   -- UPDATED
	AddVendor(8681,		L["Outfitter Eric"],			BZ["Ironforge"],			43.2, 29.2, "Alliance")
	AddVendor(8878,		L["Muuran"],				BZ["Desolace"],				55.6, 56.5, "Horde")
	AddVendor(9179,		L["Jazzrik"],				BZ["Badlands"],				42.5, 52.6, "Horde")
	AddVendor(9499,		BB["Plugger Spazzring"],		BZ["Blackrock Depths"],			   0,	 0, "Neutral")
	AddVendor(9544,		L["Yuka Screwspigot"],			BZ["Burning Steppes"],			66.0, 22.0, "Neutral")
	AddVendor(9636,		L["Kireena"],				BZ["Desolace"],				51.0, 53.5, "Horde")
	AddVendor(10118,	L["Nessa Shadowsong"],			BZ["Teldrassil"],			56.3, 92.4, "Alliance")
	AddVendor(10856,	L["Argent Quartermaster Hasana"],	BZ["Tirisfal Glades"],			83.2, 68.1, "Neutral")
	AddVendor(10857,	L["Argent Quartermaster Lightspark"],	BZ["Western Plaguelands"],		42.8, 83.8, "Neutral")
	AddVendor(11185,	L["Xizzer Fizzbolt"],			BZ["Winterspring"],			60.8, 38.6, "Neutral")
	AddVendor(11187,	L["Himmik"],				BZ["Winterspring"],			59.8, 51.6, "Neutral")  -- UPDATED
	AddVendor(11189,	L["Qia"],				BZ["Winterspring"],			59.6, 49.2, "Neutral")
	AddVendor(11278,	L["Magnus Frostwake"],			BZ["Western Plaguelands"],		68.1, 77.6, "Neutral")
	AddVendor(11536,	L["Quartermaster Miranda Breechlock"],	BZ["Eastern Plaguelands"],		75.8, 54.1, "Neutral")
	AddVendor(11557,	L["Meilosh"],				BZ["Felwood"],				65.7,  2.9, "Neutral")
	AddVendor(11874,	L["Masat T'andr"],			BZ["Swamp of Sorrows"],			26.3, 31.6, "Neutral") -- COMPLETELY UPDATED
	AddVendor(12022,	L["Lorelae Wintersong"],		BZ["Moonglade"],			48.3, 40.1, "Neutral")
	AddVendor(12033,	L["Wulan"],				BZ["Desolace"],				26.2, 69.7, "Horde")
	AddVendor(12043,	L["Kulwia"],				BZ["Stonetalon Mountains"],		45.4, 59.4, "Horde")
	AddVendor(12245,	L["Vendor-Tron 1000"],			BZ["Desolace"],				60.3, 38.1, "Neutral")
	AddVendor(12246,	L["Super-Seller 680"],			BZ["Desolace"],				40.5, 79.3, "Neutral")
	AddVendor(12941,	L["Jase Farlane"],			BZ["Eastern Plaguelands"],		74.8, 51.8, "Neutral")
	AddVendor(12942,	L["Leonard Porter"],			BZ["Western Plaguelands"],		43.0, 84.3, "Alliance")
	AddVendor(12943,	L["Werg Thickblade"],			BZ["Tirisfal Glades"],			83.2, 69.7, "Horde")
	AddVendor(12944,	L["Lokhtos Darkbargainer"],		BZ["Blackrock Depths"],			   0,	 0, "Neutral")
	AddVendor(12956,	L["Zannok Hidepiercer"],		BZ["Silithus"],				81.9, 17.8, "Neutral")
	AddVendor(12958,	L["Gigget Zipcoil"],			BZ["The Hinterlands"],			34.5, 38.5, "Neutral") -- COMPLETELY UPDATED
	AddVendor(12959,	L["Nergal"],				BZ["Un'Goro Crater"],			43.3,  7.7, "Neutral")
	AddVendor(12962,	L["Wik'Tar"],				BZ["Ashenvale"],			11.8, 34.1, "Horde")
	AddVendor(13420,	L["Penney Copperpinch"],		BZ["Orgrimmar"],			53.5, 66.1, "Neutral")
	AddVendor(13429,	L["Nardstrum Copperpinch"],		BZ["Undercity"],			67.5, 38.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(13432,	L["Seersa Copperpinch"],		BZ["Thunder Bluff"],			42.0, 55.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(13433,	L["Wulmort Jinglepocket"],		BZ["Ironforge"],			33.0, 67.6, "Neutral")
	AddVendor(13435,	L["Khole Jinglepocket"],		BZ["Stormwind City"],			62.2, 70.6, "Alliance") -- COMPLETELY UPDATED
	AddVendor(14371,	L["Shen'dralar Provisioner"],		BZ["Dire Maul"],			   0,	 0, "Neutral")
	AddVendor(14637,	L["Zorbin Fandazzle"],			BZ["Feralas"],				44.8, 43.4, "Neutral")
	AddVendor(14738,	L["Otho Moji'ko"],			BZ["The Hinterlands"],			79.3, 79.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(15176,	L["Vargus"],				BZ["Silithus"],				51.2, 38.8, "Neutral")
	AddVendor(15179,	L["Mishta"],				BZ["Silithus"],				49.9, 36.5, "Neutral")
	AddVendor(15293,	L["Aendel Windspear"],			BZ["Silithus"],				62.6, 49.8, "Neutral")
	AddVendor(15419,	L["Kania"],				BZ["Silithus"],				52.0, 39.6, "Neutral")
	AddVendor(15471,	BB["Lieutenant General Andorov"],	BZ["Ruins of Ahn'Qiraj"],		   0,	 0, "Neutral")
	AddVendor(15909,	L["Fariel Starsong"],			BZ["Moonglade"],			54.0, 35.4, "Neutral")
	AddVendor(16224,	L["Rathis Tomber"],			BZ["Ghostlands"],			47.2, 28.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(16253,	L["Master Chef Mouldier"],		BZ["Ghostlands"],			48.3, 30.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(16262,	L["Landraelanis"],			BZ["Eversong Woods"],			49.0, 47.0, "Horde")
	AddVendor(16388,	L["Koren"],				BZ["Karazhan"],				   0,	 0, "Neutral")
	AddVendor(16583,	L["Rohok"],				BZ["Hellfire Peninsula"],		53.2, 38.2, "Horde")
	AddVendor(16585,	L["Cookie One-Eye"],			BZ["Hellfire Peninsula"],		54.6, 41.1, "Horde")
	AddVendor(16588,	L["Apothecary Antonivich"],		BZ["Hellfire Peninsula"],		52.4, 36.5, "Horde")
	AddVendor(16624,	L["Gelanthis"],				BZ["Silvermoon City"],			90.9, 73.3, "Horde") -- COMPLETELY UPDATED
	AddVendor(16635,	L["Lyna"],				BZ["Silvermoon City"],			70.3, 24.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(16638,	L["Deynna"],				BZ["Silvermoon City"],			55.6, 51.0, "Horde") -- COMPLETELY UPDATED
	AddVendor(16641,	L["Melaris"],				BZ["Silvermoon City"],			67.1, 19.5, "Horde") -- COMPLETELY UPDATED
	AddVendor(16657,	L["Feera"],				BZ["The Exodar"],			54.0, 90.5, "Alliance")
	AddVendor(16670,	L["Eriden"],				BZ["Silvermoon City"],			80.3, 36.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(16677,	L["Quelis"],				BZ["Silvermoon City"],			69.3, 70.4, "Horde") -- COMPLETELY UPDATED
	AddVendor(16689,	L["Zaralda"],				BZ["Silvermoon City"],			84.8, 78.6, "Horde") -- COMPLETELY UPDATED
	AddVendor(16705,	L["Altaa"],				BZ["The Exodar"],			27.5, 62.1, "Alliance")
	AddVendor(16713,	L["Arras"],				BZ["The Exodar"],			60.0, 89.5, "Alliance")
	AddVendor(16718,	L["Phea"],				BZ["The Exodar"],			54.7, 26.5, "Alliance")
	AddVendor(16722,	L["Egomis"],				BZ["The Exodar"],			39.1, 39.4, "Alliance")
	AddVendor(16748,	L["Haferet"],				BZ["The Exodar"],			66.6, 73.7, "Alliance") -- COMPLETELY UPDATED
	AddVendor(16767,	L["Neii"],				BZ["The Exodar"],			64.5, 68.5, "Alliance") -- COMPLETELY UPDATED
	AddVendor(16782,	L["Yatheon"],				BZ["Silvermoon City"],			75.6, 40.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(16826,	L["Sid Limbardi"],			BZ["Hellfire Peninsula"],		54.3, 63.6, "Alliance")
	AddVendor(17246,	L["\"Cookie\" McWeaksauce"],		BZ["Azuremyst Isle"],			46.7, 70.5, "Alliance")
	AddVendor(17512,	L["Arred"],				BZ["The Exodar"],			45.9, 24.9, "Alliance") -- COMPLETELY UPDATED
	AddVendor(17518,	L["Ythyar"],				BZ["Karazhan"],				   0,	 0, "Neutral")
	AddVendor(17585,	L["Quartermaster Urgronn"],		BZ["Hellfire Peninsula"],		54.9, 37.9, "Horde")
	AddVendor(17657,	L["Logistics Officer Ulrike"],		BZ["Hellfire Peninsula"],		56.7, 62.6, "Alliance")
	AddVendor(17904,	L["Fedryen Swiftspear"],		BZ["Zangarmarsh"],			79.3, 63.8, "Neutral") -- COMPLETELY UPDATED
	AddVendor(18005,	L["Haalrun"],				BZ["Zangarmarsh"],			67.8, 48.0, "Alliance")
	AddVendor(18011,	L["Zurai"],				BZ["Zangarmarsh"],			85.3, 54.8, "Horde") -- COMPLETELY UPDATED
	AddVendor(18015,	L["Gambarinka"],			BZ["Zangarmarsh"],			31.7, 49.3, "Horde") -- COMPLETELY UPDATED
	AddVendor(18017,	L["Seer Janidi"],			BZ["Zangarmarsh"],			32.4, 51.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(18255,	L["Apprentice Darius"],			BZ["Deadwind Pass"],			47.0, 75.3, "Neutral")
	AddVendor(18382,	L["Mycah"],				BZ["Zangarmarsh"],			17.9, 51.2, "Neutral") -- COMPLETELY UPDATED
	AddVendor(18427,	L["Fazu"],				BZ["Bloodmyst Isle"],			53.5, 56.5, "Alliance")
	AddVendor(18484,	L["Wind Trader Lathrai"],		BZ["Shattrath City"],			72.3, 31.0, "Neutral")
	AddVendor(18664,	L["Aged Dalaran Wizard"],		BZ["Old Hillsbrad Foothills"],		   0,	 0, "Neutral")
	AddVendor(18672,	L["Thomas Yance"],			BZ["Old Hillsbrad Foothills"],		   0,	 0, "Neutral")
	AddVendor(18753,	L["Felannia"],				BZ["Hellfire Peninsula"],		52.3, 36.1, "Horde")
	AddVendor(18773,	L["Johan Barnes"],			BZ["Hellfire Peninsula"],		53.7, 66.1, "Alliance")
	AddVendor(18775,	L["Lebowski"],				BZ["Hellfire Peninsula"],		55.7, 65.5, "Alliance")
	AddVendor(18802,	L["Alchemist Gribble"],			BZ["Hellfire Peninsula"],		53.8, 65.8, "Alliance")
	AddVendor(18821,	L["Quartermaster Jaffrey Noreliqe"],	BZ["Nagrand"],				41.2, 44.3, "Horde")
	AddVendor(18822,	L["Quartermaster Davian Vaclav"],	BZ["Nagrand"],				41.2, 44.3, "Alliance")
	AddVendor(18911,	L["Juno Dufrain"],			BZ["Zangarmarsh"],			78.0, 66.1, "Neutral") -- COMPLETELY UPDATED
	AddVendor(18951,	L["Erilia"],				BZ["Eversong Woods"],			55.5, 54.0, "Horde")
	AddVendor(18957,	L["Innkeeper Grilka"],			BZ["Terokkar Forest"],			48.8, 45.1, "Horde")
	AddVendor(18960,	L["Rungor"],				BZ["Terokkar Forest"],			48.8, 46.1, "Horde")
	AddVendor(19015,	L["Mathar G'ochar"],			BZ["Nagrand"],				57.0, 39.6, "Horde")
	AddVendor(19017,	L["Borto"],				BZ["Nagrand"],				53.3, 71.9, "Alliance")
	AddVendor(19038,	L["Supply Officer Mills"],		BZ["Terokkar Forest"],			55.7, 53.1, "Alliance")
	AddVendor(19042,	L["Leeli Longhaggle"],			BZ["Terokkar Forest"],			57.7, 53.4, "Alliance")
	AddVendor(19065,	L["Inessera"],				BZ["Shattrath City"],			34.5, 20.2, "Neutral")
	AddVendor(19074,	L["Skreah"],				BZ["Shattrath City"],			46.0, 20.1, "Neutral")
	AddVendor(19195,	L["Jim Saltit"],			BZ["Shattrath City"],			63.6, 68.6, "Neutral")
	AddVendor(19213,	L["Eiin"],				BZ["Shattrath City"],			66.2, 68.7, "Neutral")
	AddVendor(19234,	L["Yurial Soulwater"],			BZ["Shattrath City"],			43.5, 96.9, "Neutral")
	AddVendor(19296,	L["Innkeeper Biribi"],			BZ["Terokkar Forest"],			56.7, 53.3, "Alliance")
	AddVendor(19321,	L["Quartermaster Endarin"],		BZ["Shattrath City"],			47.9, 26.1, "Neutral")
	AddVendor(19331,	L["Quartermaster Enuril"],		BZ["Shattrath City"],			60.5, 64.2, "Neutral") -- COMPLETELY UPDATED
	AddVendor(19342,	L["Krek Cragcrush"],			BZ["Shadowmoon Valley"],		28.9, 30.8, "Horde")
	AddVendor(19351,	L["Daggle Ironshaper"],			BZ["Shadowmoon Valley"],		36.8, 54.4, "Alliance")
	AddVendor(19373,	L["Mari Stonehand"],			BZ["Shadowmoon Valley"],		36.8, 55.1, "Alliance")
	AddVendor(19383,	L["Captured Gnome"],			BZ["Zangarmarsh"],			32.5, 48.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(19521,	L["Arrond"],				BZ["Shadowmoon Valley"],		55.9, 58.2, "Neutral")
	AddVendor(19537,	L["Dealer Malij"],			BZ["Netherstorm"],			44.2, 34.0, "Neutral") -- COMPLETELY UPDATED
	AddVendor(19540,	L["Asarnan"],				BZ["Netherstorm"],			44.2, 33.7, "Neutral") -- COMPLETELY UPDATED
	AddVendor(19661,	L["Viggz Shinesparked"],		BZ["Shattrath City"],			64.9, 69.1, "Neutral")
	AddVendor(19662,	L["Aaron Hollman"],			BZ["Shattrath City"],			63.1, 71.1, "Neutral")
	AddVendor(19663,	L["Madame Ruby"],			BZ["Shattrath City"],			63.1, 69.3, "Neutral")
	AddVendor(19694,	L["Loolruna"],				BZ["Zangarmarsh"],			68.5, 50.1, "Alliance")
	AddVendor(19722,	L["Muheru the Weaver"],			BZ["Zangarmarsh"],			40.6, 28.2, "Alliance")
	AddVendor(19836,	L["Mixie Farshot"],			BZ["Hellfire Peninsula"],		61.1, 81.5, "Horde")
	AddVendor(19837,	L["Daga Ramba"],			BZ["Blade's Edge Mountains"],		51.1, 57.7, "Horde") -- COMPLETELY UPDATED
	AddVendor(20028,	L["Doba"],				BZ["Zangarmarsh"],			42.3, 27.9, "Alliance")
	AddVendor(20096,	L["Uriku"],				BZ["Nagrand"],				56.2, 73.3, "Alliance")
	AddVendor(20097,	L["Nula the Butcher"],			BZ["Nagrand"],				58.0, 35.7, "Horde")
	AddVendor(20240,	L["Trader Narasu"],			BZ["Nagrand"],				54.6, 75.2, "Alliance")
	AddVendor(20241,	L["Provisioner Nasela"],		BZ["Nagrand"],				53.5, 36.9, "Horde")
	AddVendor(20242,	L["Karaaz"],				BZ["Netherstorm"],			43.6, 34.3, "Neutral") -- COMPLETELY UPDATED
	AddVendor(20916,	L["Xerintha Ravenoak"],			BZ["Blade's Edge Mountains"],		62.5, 40.3, "Neutral") -- COMPLETELY UPDATED
	AddVendor(21113,	L["Sassa Weldwell"],			BZ["Blade's Edge Mountains"],		61.3, 68.9, "Alliance")
	AddVendor(21432,	L["Almaador"],				BZ["Shattrath City"],			51.0, 41.9, "Neutral")
	AddVendor(21474,	L["Coreiel"],				BZ["Nagrand"],				42.8, 42.6, "Horde")
	AddVendor(21485,	L["Aldraan"],				BZ["Nagrand"],				42.9, 42.5, "Alliance")
	AddVendor(21643,	L["Alurmi"],				BZ["Tanaris"],				63.0, 57.3, "Neutral") -- COMPLETELY UPDATED
	AddVendor(21655,	L["Nakodu"],				BZ["Shattrath City"],			62.1, 69.0, "Neutral")
	AddVendor(22208,	L["Nasmara Moonsong"],			BZ["Shattrath City"],			66.0, 69.0, "Neutral")
	AddVendor(22212,	L["Andrion Darkspinner"],		BZ["Shattrath City"],			66.0, 67.8, "Neutral")
	AddVendor(22213,	L["Gidge Spellweaver"],			BZ["Shattrath City"],			66.0, 67.9, "Neutral")
	AddVendor(23007,	L["Paulsta'ats"],			BZ["Nagrand"],				30.6, 57.0, "Neutral")
	AddVendor(23010,	L["Wolgren Jinglepocket"],		BZ["The Exodar"],			54.5, 47.2, "Alliance")
	AddVendor(23012,	L["Hotoppik Copperpinch"],		BZ["Silvermoon City"],			63.5, 79.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(23064,	L["Eebee Jinglepocket"],		BZ["Shattrath City"],			51.0, 31.3, "Neutral")
	AddVendor(23159,	L["Okuno"],				BZ["Black Temple"],			   0,	 0, "Neutral")
	AddVendor(23437,	L["Indormi"],				BZ["Hyjal Summit"],			   0,	 0, "Neutral")
	AddVendor(25032,	L["Eldara Dawnrunner"],			BZ["Isle of Quel'Danas"],		47.1, 30.0, "Neutral")
	AddVendor(25950,	L["Shaani"],				BZ["Isle of Quel'Danas"],		51.5, 32.6, "Neutral")
	AddVendor(26081, 	L["High Admiral \"Shelly\" Jorrik"],	BZ["Dun Morogh"], 			10.9, 76.1, "Neutral")
	AddVendor(26569,	L["Alys Vol'tyr"],			BZ["Dragonblight"],			36.3, 46.5, "Horde")
	AddVendor(26868,	L["Provisioner Lorkran"],		BZ["Grizzly Hills"],			22.6, 66.1, "Horde")
	AddVendor(27030,	L["Bradley Towns"],			BZ["Dragonblight"],			76.9, 62.2, "Horde")
	AddVendor(27054,	L["Modoru"],				BZ["Dragonblight"],			28.9, 55.9, "Alliance")
	AddVendor(27147,	L["Librarian Erickson"],		BZ["Borean Tundra"],			46.7, 32.5, "Neutral")
	AddVendor(27666,	L["Ontuvo"],				BZ["Shattrath City"],			48.7, 41.3, "Neutral")
	AddVendor(28701,	L["Timothy Jones"],			BZ["Dalaran"],				40.5, 35.2, "Neutral")
	AddVendor(28714,	L["Ildine Sorrowspear"],		BZ["Dalaran"],				39.1, 41.5, "Neutral")
	AddVendor(28721,	L["Tiffany Cartier"],			BZ["Dalaran"],				40.5, 34.4, "Neutral")
	AddVendor(28722,	L["Bryan Landers"],			BZ["Dalaran"],				39.1, 26.5, "Neutral")
	AddVendor(28723,	L["Larana Drome"],			BZ["Dalaran"],				42.3, 37.5, "Neutral")
	AddVendor(29510,	L["Linna Bruder"],			BZ["Dalaran"],				34.6, 34.5, "Neutral")
	AddVendor(29511,	L["Lalla Brightweave"],			BZ["Dalaran"],				36.5, 33.5, "Neutral")
	AddVendor(29512,	L["Ainderu Summerleaf"],		BZ["Dalaran"],				36.5, 34.0, "Neutral")
	AddVendor(30431,	L["Veteran Crusader Aliocha Segard"],	BZ["Icecrown"],				87.6, 75.6, "Neutral")
	AddVendor(30489,	L["Morgan Day"],			BZ["Wintergrasp"],			49.0, 17.1, "Alliance")
	AddVendor(30734,	L["Jezebel Bican"],			BZ["Hellfire Peninsula"],		53.9, 65.5, "Alliance")
	AddVendor(30735,	L["Kul Inkspiller"],			BZ["Hellfire Peninsula"],		52.5, 36.0, "Horde")
	AddVendor(31031,	L["Misensi"],				BZ["Dalaran"],				70.1, 38.5, "Horde")
	AddVendor(31032,	L["Derek Odds"],			BZ["Dalaran"],				41.5, 64.8, "Alliance")
	AddVendor(31910,	L["Geen"],				BZ["Sholazar Basin"],			54.5, 56.2, "Neutral")
	AddVendor(31911,	L["Tanak"],				BZ["Sholazar Basin"],			55.1, 69.1, "Neutral")
	AddVendor(31916,	L["Tanaika"],				BZ["Howling Fjord"],			25.5, 58.7, "Neutral")
	AddVendor(32287,	L["Archmage Alvareaux"],		BZ["Dalaran"],				25.5, 47.4, "Neutral")
	AddVendor(32294,	L["Knight Dameron"],			BZ["Wintergrasp"],			51.7, 17.5, "Alliance")
	AddVendor(32296,	L["Stone Guard Mukar"],			BZ["Wintergrasp"],			51.7, 17.5, "Horde")
	AddVendor(32514,	L["Vanessa Sellers"],			BZ["Dalaran"],				38.7, 40.8, "Neutral")
	AddVendor(32515,	L["Braeg Stoutbeard"],			BZ["Dalaran"],				37.6, 29.5, "Neutral")
	AddVendor(32533,	L["Cielstrasza"],			BZ["Dragonblight"],			59.9, 53.1, "Neutral")
	AddVendor(32538,	L["Duchess Mynx"],			BZ["Icecrown"],				43.5, 20.6, "Neutral")
	AddVendor(32540,	L["Lillehoff"],				BZ["The Storm Peaks"],			66.2, 61.4, "Neutral")
	AddVendor(32564,	L["Logistics Officer Silverstone"],	BZ["Borean Tundra"],			57.7, 66.5, "Alliance")
	AddVendor(32565,	L["Gara Skullcrush"],			BZ["Borean Tundra"],			41.4, 53.6, "Horde")
	AddVendor(32763,	L["Sairuk"],				BZ["Dragonblight"],			48.5, 75.7, "Neutral")
	AddVendor(32773,	L["Logistics Officer Brighton"],	BZ["Howling Fjord"],			59.7, 63.9, "Alliance")
	AddVendor(32774,	L["Sebastian Crane"],			BZ["Howling Fjord"],			79.6, 30.7, "Horde")
	AddVendor(33594,	L["Fizzix Blastbolt"],			BZ["Icecrown"],				72.2, 20.9, "Neutral")
	AddVendor(33595,	L["Mera Mistrunner"],			BZ["Icecrown"],				72.4, 20.9, "Neutral")
	AddVendor(33602,	L["Anuur"],				BZ["Icecrown"],				71.4, 20.8, "Neutral")
	AddVendor(33637,	L["Kirembri Silvermane"],		BZ["Shattrath City"],			58.1, 75.0, "Neutral") -- COMPLETELY UPDATED
	AddVendor(33680,	L["Nemiha"],				BZ["Shattrath City"],			36.1, 47.7, "Neutral")
	AddVendor(34601,	L["Harlown Darkweave"],			BZ["Ashenvale"],			18.2, 60.0, "Alliance")
	AddVendor(35826,	L["Kaye Toogie"],			BZ["Dalaran"],				34.0, 35.6, "Neutral")
	AddVendor(37687,	L["Alchemist Finklestein"],		BZ["Icecrown Citadel"],			   0,	 0, "Neutral")
	AddVendor(40160,	L["Frozo the Renowned"],		BZ["Dalaran"],				41.0, 28.5, "Neutral")
	AddVendor(40226,	L["Pratt McGrubben"],			BZ["Feralas"],				45.4, 41.2, "Alliance")
	AddVendor(40572,	L["Haughty Modiste"],			BZ["Tanaris"],				50.7, 28.6, "Neutral") -- COMPLETELY UPDATED
	AddVendor(40589,	L["Dirge Quikcleave"],			BZ["Tanaris"],				52.6, 29.1, "Neutral") -- COMPLETELY UPDATED
	AddVendor(44583,	L["Terrance Denman"],			BZ["Stormwind City"], 			63.2, 61.7, "Alliance") -- COMPLETELY UPDATED
	AddVendor(45558,	L["Lizna Goldweaver"],				BZ["Orgrimmar"],			41.3, 79.2, "Horde") -- COMPLETELY UPDATED
	AddVendor(48060,	L["\"Chef\" Overheat"],			BZ["Badlands"],				65.1, 39.1, "Neutral") -- COMPLETELY UPDATED
	AddVendor(49701,	L["Bario Matalli"],			BZ["Stormwind City"], 			50.4, 71.9, "Alliance") -- COMPLETELY UPDATED
	AddVendor(49703,	L["Casandra Downs"],			BZ["Twilight Highlands"],		78.6, 76.2, "Alliance")
	AddVendor(49737,	L["Shazdar"],				BZ["Orgrimmar"],			56.8, 62.3, "Horde") -- COMPLETELY UPDATED
	AddVendor(50134,	L["Senthii"],				BZ["Twilight Highlands"],		78.7, 77.0, "Alliance")
	AddVendor(50146,	L["Agatian Fallanos"],			BZ["Twilight Highlands"],		76.7, 49.5, "Horde")
	AddVendor(50172,	L["Threm Blackscalp"],			BZ["Twilight Highlands"],		75.2, 50.1, "Horde")
	AddVendor(50248,	L["Una Kobuna"],			BZ["Twilight Highlands"],		76.6, 49.4, "Horde")
	AddVendor(50375,	L["Kuldar Steeltooth"],			BZ["Twilight Highlands"],		77.3, 53.1, "Horde")
	AddVendor(50381,	L["Misty Merriweather"],		BZ["Twilight Highlands"],		78.8, 76.2, "Alliance")
	AddVendor(50382,	L["Brundall Chiselgut"],		BZ["Twilight Highlands"],		79.1, 76.5, "Alliance")
	AddVendor(50386,	L["Sal Ferraga"],			BZ["Twilight Highlands"],		78.6, 76.9, "Alliance")
	AddVendor(50433,	L["Aristaleon Sunweaver"],		BZ["Twilight Highlands"],		75.2, 50.1, "Horde") -- COMPLETELY UPDATED
	AddVendor(50480,	L["Isabel Jones"],			BZ["Stormwind City"],			63.7, 61.3, "Alliance") -- COMPLETELY UPDATED
	AddVendor(50482,	L["Marith Lazuria"],			BZ["Orgrimmar"],			72.5, 34.4, "Horde") -- COMPLETELY UPDATED
	AddVendor(52584,	L["Laida Gembold"],			BZ["Ironforge"],			50.6, 27.5, "Alliance") -- COMPLETELY UPDATED
	AddVendor(52588,	L["Sara Lanner"],			BZ["Undercity"],			56.7, 36.9, "Horde") -- COMPLETELY UPDATED
	AddVendor(52644,	L["Tarien Silverdew"],			BZ["Darnassus"],			54.4, 30.7, "Alliance") -- COMPLETELY UPDATED
	AddVendor(52658,	L["Paku Cloudchaser"],			BZ["Thunder Bluff"],			34.7, 53.5, "Horde") -- COMPLETELY UPDATED
	AddVendor(53214,	L["Damek Bloombeard"],			BZ["Hyjal"],				47.0, 90.2, "Neutral")
	AddVendor(53881,	L["Ayla Shadowstorm"],			BZ["Hyjal"],				72.5, 36.2, "Neutral")
	AddVendor(54232,	L["Mrs. Gant"],				BZ["The Cape of Stranglethorn"],	42.6, 72.8, "Neutral") -- COMPLETLY UPDATED

	self.InitVendor = nil
end
