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
		private:AddListEntry(private.vendor_list, id_num, name, BZ[zone], x, y, faction)
	end

	AddVendor(66,		L["Tharynn Bouden"],			"Elwynn Forest",		41.9,	67.1,	"Alliance")
	AddVendor(340,		L["Kendor Kabonka"],			"Stormwind City",		76.6,	52.8,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(734,		L["Corporal Bluth"],			"Northern Stranglethorn",	47.5,	10.3,	"Alliance") -- UPDATED
	AddVendor(777,		L["Amy Davenport"],			"Redridge Mountains",		29.1,	47.5,	"Alliance")
	AddVendor(843,		L["Gina MacGregor"],			"Westfall",			57.6,	54.0,	"Alliance")
	AddVendor(989,		L["Banalash"],				"Swamp of Sorrows",		46.6,	56.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(1146,		L["Vharr"],				"Northern Stranglethorn",	38.7,	49.2,	"Horde")   -- UPDATED
	AddVendor(1148,		L["Nerrist"],				"Northern Stranglethorn",	39.2,	51.0,	"Horde")  -- UPDATED
	AddVendor(1149,		L["Uthok"],				"Northern Stranglethorn",	37.5,	49.2,	"Horde")   -- UPDATED
	AddVendor(1250,		L["Drake Lindgren"],			"Elwynn Forest",		83.3,	66.7,	"Alliance")
	AddVendor(1286,		L["Edna Mullby"],			"Stormwind City",		64.7,	71.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1313,		L["Maria Lumere"],			"Stormwind City",		55.7,	85.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1318,		L["Jessara Cordell"],			"Stormwind City",		53.0,	74.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1347,		L["Alexandra Bolero"],			"Stormwind City",		53.3,	81.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1448,		L["Neal Allen"],			"Wetlands",			11.8,	52.6,	"Alliance")
	AddVendor(1454,		L["Jennabink Powerseam"],		"Wetlands",			 8.1,	55.9,	"Alliance")
	AddVendor(1465,		L["Drac Roughcut"],			"Loch Modan",			35.6,	49.0,	"Alliance")
	AddVendor(1471,		L["Jannos Ironwill"],			"Arathi Highlands",		46.0,	47.7,	"Alliance")
	AddVendor(1474,		L["Rann Flamespinner"],			"Loch Modan",			36.0,	46.0,	"Alliance")
	AddVendor(1684,		L["Khara Deepwater"],			"Loch Modan",			39.5,	39.3,	"Alliance")
	AddVendor(1685,		L["Xandar Goodbeard"],			"Loch Modan",			82.5,	63.5,	"Alliance")
	AddVendor(2118,		L["Abigail Shiel"],			"Tirisfal Glades",		61.0,	51.0,	"Horde") -- UPDATED
	AddVendor(2393,		L["Christoph Jeffcoat"],		"Hillsbrad Foothills",		57.5,	47.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2394,		L["Mallen Swain"],			"Hillsbrad Foothills",		58.1,	47.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2397,		L["Derak Nightfall"],			"Hillsbrad Foothills",		57.7,	45.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2480,		L["Bro'kin"],				"Hillsbrad Foothills",		44.0,	21.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(2482,		L["Zarena Cromwind"],			"The Cape of Stranglethorn",	43.0,	70.7,	"Neutral")  -- UPDATED
	AddVendor(2483,		L["Jaquilina Dramet"],			"Northern Stranglethorn",	43.7,	23.1,	"Neutral") -- UPDATED
	AddVendor(2663,		L["Narkk"],				"The Cape of Stranglethorn",	42.7,	69.2,	"Neutral")   -- UPDATED
	AddVendor(2664,		L["Kelsey Yance"],			"The Cape of Stranglethorn",	42.8,	69.1,	"Neutral")   -- UPDATED
	AddVendor(2668,		L["Danielle Zipstitch"],		"Duskwood",			75.8,	45.5,	"Alliance")
	AddVendor(2669,		L["Sheri Zipstitch"],			"Duskwood",			75.7,	45.5,	"Alliance")
	AddVendor(2670,		L["Xizk Goodstitch"],			"The Cape of Stranglethorn",	43.6,	73.0,	"Neutral")  -- UPDATED
	AddVendor(2672,		L["Cowardly Crosby"],			"The Cape of Stranglethorn",	40.9,	82.5,	"Neutral")   -- UPDATED
	AddVendor(2679,		L["Wenna Silkbeard"],			"Wetlands",			25.7,	25.8,	"Alliance")
	AddVendor(2685,		L["Mazk Snipeshot"],			"The Cape of Stranglethorn",	43.2, 	0.2,	"Neutral")  -- UPDATED
	AddVendor(2687,		L["Gnaz Blunderflame"],			"Northern Stranglethorn",	67.5,	61.5,	"Neutral")  -- UPDATED
	AddVendor(2688,		L["Ruppo Zipcoil"],			"The Hinterlands",		34.3,	37.9,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(2697,		L["Clyde Ranthal"],			"Redridge Mountains",		88.9,	70.9,	"Alliance")
	AddVendor(2698,		L["George Candarte"],			"Hillsbrad Foothills",		76.7,	58.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2699,		L["Rikqiz"],				"The Cape of Stranglethorn",	43.2,	71.7,	"Neutral")   -- UPDATED
	AddVendor(2803,		L["Malygen"],				"Felwood",			62.3,	25.6,	"Alliance")
	AddVendor(2810,		L["Hammon Karwn"],			"Arathi Highlands",		46.5,	47.3,	"Alliance")
	AddVendor(2812,		L["Drovnar Strongbrew"],		"Arathi Highlands",		46.4,	47.1,	"Alliance")
	AddVendor(2814,		L["Narj Deepslice"],			"Arathi Highlands",		45.6,	47.6,	"Alliance")
	AddVendor(2816,		L["Androd Fadran"],			"Arathi Highlands",		45.0,	46.9,	"Alliance")
	AddVendor(2819,		L["Tunkk"],				"Arathi Highlands",		70.0,	35.4,	"Horde")
	AddVendor(2821,		L["Keena"],				"Arathi Highlands",		74.0,	32.7,	"Horde")
	AddVendor(2838,		L["Crazk Sparks"],			"The Cape of Stranglethorn",	43.0,	72.8,	"Neutral")   -- UPDATED
	AddVendor(2843,		L["Jutak"],				"The Cape of Stranglethorn",	41.6,	74.1,	"Neutral")   -- UPDATED
	AddVendor(2846,		L["Blixrez Goodstitch"],		"The Cape of Stranglethorn",	42.8,	74.1,	"Neutral")   -- UPDATED
	AddVendor(2848,		L["Glyx Brewright"],			"The Cape of Stranglethorn",	42.6,	74.9,	"Neutral")   -- UPDATED
	AddVendor(2999,		L["Taur Stonehoof"],			"Thunder Bluff",		39.8,	55.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3005,		L["Mahu"],				"Thunder Bluff",		43.8,	45.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3008,		L["Mak"],				"Thunder Bluff",		42.0,	43.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3012,		L["Nata Dawnstrider"],			"Thunder Bluff",		44.9,	37.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3027,		L["Naal Mistrunner"],			"Thunder Bluff",		51.0,	52.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3029,		L["Sewa Mistrunner"],			"Thunder Bluff",		55.8,	47.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3081,		L["Wunna Darkmane"],			"Mulgore",			46.1,	58.2,	"Horde")
	AddVendor(3085,		L["Gloria Femmel"],			"Redridge Mountains",		26.7,	43.5,	"Alliance")
	AddVendor(3134,		L["Kzixx"],				"Duskwood",			81.9,	19.9,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(3178,		L["Stuart Fleming"],			"Wetlands",			8.1,	58.4,	"Alliance")
	AddVendor(3333,		L["Shankys"],				"Orgrimmar",			66.74,	41.86,	"Horde") -- UPDATED
	AddVendor(3335,		L["Hagrus"],				"Orgrimmar",			46.0,	45.9,	"Horde")
	AddVendor(3346,		L["Kithas"],				"Orgrimmar",			53.3,	48.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3348,		L["Kor'geld"],				"Orgrimmar",			55.23,	45.83,	"Horde") -- UPDATED
	AddVendor(3356,		L["Sumi"],				"Orgrimmar",			75.8,	35.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3364,		L["Borya"],				"Orgrimmar",			60.7,	58.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3366,		L["Tamar"],				"Orgrimmar",			60.3,	54.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3367,		L["Felika"],				"Orgrimmar",			60.5,	50.7,	"Horde")
	AddVendor(3400,		L["Xen'to"],				"Orgrimmar",			32.6,	68.6,	"Horde") -- UPDATED
	AddVendor(3413,		L["Sovik"],				"Orgrimmar",			56.8,	56.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3482,		L["Tari'qa"],				"Northern Barrens",		49.0,	58.2,	"Horde")   -- UPDATED
	AddVendor(3485,		L["Wrahk"],				"Northern Barrens",		50.0,	61.1,	"Horde")   -- UPDATED
	AddVendor(3489,		L["Zargh"],				"Northern Barrens",		50.6,	57.8,	"Horde")   -- UPDATED
	AddVendor(3490,		L["Hula'mahi"],				"Northern Barrens",		48.6,	58.4,	"Horde")   -- UPDATED
	AddVendor(3495,		L["Gagsprocket"],			"Northern Barrens",		68.4,	69.2,	"Neutral")   -- UPDATED
	AddVendor(3497,		L["Kilxx"],				"Northern Barrens",		68.6,	72.5,	"Neutral")   -- UPDATED
	AddVendor(3499,		L["Ranik"],				"Northern Barrens",		67.1,	73.5,	"Neutral")   -- UPDATED
	AddVendor(3522,		L["Constance Brisboise"],		"Tirisfal Glades",		52.6,	55.7,	"Horde")
	AddVendor(3537,		L["Zixil"],				"Hillsbrad Foothills",		49.8,	60.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(3550,		L["Martine Tramblay"],			"Tirisfal Glades",		65.8,	59.6,	"Horde") -- UPDATED
	AddVendor(3556,		L["Andrew Hilbert"],			"Silverpine Forest",		43.2,	40.7,	"Horde")
	AddVendor(3881,		L["Grimtak"],				"Durotar",			50.7,	42.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3954,		L["Dalria"],				"Ashenvale",			35.1,	52.1,	"Alliance")
	AddVendor(3958,		L["Lardan"],				"Ashenvale",			34.8,	49.8,	"Alliance")
	AddVendor(4083,		L["Jeeda"],				"Stonetalon Mountains",		50.5,	63.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4168,		L["Elynna"],				"Darnassus",			60.6,	36.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4223,		L["Fyldan"],				"Darnassus",			49.5,	36.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4225,		L["Saenorion"],				"Darnassus",			60.0,	37.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4226,		L["Ulthir"],				"Darnassus",			54.6,	38.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4228,		L["Vaean"],				"Darnassus",			56.4,	32.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4229,		L["Mythrin'dir"],			"Darnassus",			58.1,	34.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4265,		L["Nyoma"],				"Teldrassil",			56.6,	53.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4305,		L["Kriggon Talsone"],			"Westfall",			36.2,	90.1,	"Alliance")
	AddVendor(4553,		L["Ronald Burch"],			"Undercity",			62.3,	43.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4561,		L["Daniel Bartlett"],			"Undercity",			64.1,	37.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4574,		L["Lizbeth Cromwell"],			"Undercity",			81.0,	30.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4577,		L["Millie Gregorian"],			"Undercity",			70.6,	30.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4589,		L["Joseph Moore"],			"Undercity",			70.0,	58.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4597,		L["Samuel Van Brunt"],			"Undercity",			61.4,	30.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4610,		L["Algernon"],				"Undercity",			51.7,	74.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4617,		L["Thaddeus Webb"],			"Undercity",			62.4,	61.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4775,		L["Felicia Doan"],			"Undercity",			64.1,	50.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4782,		L["Truk Wildbeard"],			"The Hinterlands",		14.4,	42.5,	"Alliance")
	AddVendor(4879,		L["Ogg'marr"],				"Dustwallow Marsh",		36.7,	31.0,	"Horde")
	AddVendor(4897,		L["Helenia Olden"],			"Dustwallow Marsh",		66.4,	51.5,	"Alliance")
	AddVendor(5128,		L["Bombus Finespindle"],		"Ironforge",			39.6,	34.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5154,		L["Poranna Snowbraid"],			"Ironforge",			43.0,	28.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5158,		L["Tilli Thistlefuzz"],			"Ironforge",			61.0,	44.0,	"Alliance") -- COMPLETELY UPDATEDM
	AddVendor(5160,		L["Emrul Riknussun"],			"Ironforge",			59.9,	37.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5162,		L["Tansy Puddlefizz"],			"Ironforge",			48.0,	6.3,	"Alliance")
	AddVendor(5163,		L["Burbik Gearspanner"],		"Ironforge",			46.5,	27.1,	"Alliance")
	AddVendor(5175,		L["Gearcutter Cogspinner"],		"Ironforge",			68.0,	43.1,	"Alliance")
	AddVendor(5178,		L["Soolie Berryfizz"],			"Ironforge",			66.6,	54.5,	"Alliance")
	AddVendor(5411,		L["Krinkle Goodsteel"],			"Tanaris",			51.2,	30.4,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(5483,		L["Erika Tate"],			"Stormwind City",		77.6,	53.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5494,		L["Catherine Leland"],			"Stormwind City",		55.1,	69.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5512,		L["Kaita Deepforge"],			"Stormwind City",		63.5,	37.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5565,		L["Jillian Tanner"],			"Stormwind City",		71.6,	62.8,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5594,		L["Alchemist Pestlezugg"],		"Tanaris",			50.8,	28.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(5748,		L["Killian Sanatha"],			"Silverpine Forest",		33.0,	17.8,	"Horde")
	AddVendor(5757,		L["Lilly"],				"Silverpine Forest",		43.1,	50.8,	"Horde")
	AddVendor(5758,		L["Leo Sarn"],				"Silverpine Forest",		53.9,	82.3,	"Horde")
	AddVendor(5940,		L["Harn Longcast"],			"Mulgore",			47.5,	55.1,	"Horde")
	AddVendor(5942,		L["Zansoa"],				"Durotar",			57.4,	77.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(6568,		L["Vizzklick"],				"Tanaris",			50.7,	28.7,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(6567,		L["Ghok'kah"],				"Dustwallow Marsh",		35.2,	30.8,	"Horde")
	AddVendor(6574,		L["Jun'ha"],				"Arathi Highlands",		72.7,	36.5,	"Horde")
	AddVendor(6730,		L["Jinky Twizzlefixxit"],		"Thousand Needles",		77.7,	77.8,	"Alliance")
	AddVendor(6777,		L["Zan Shivsproket"],			"Hillsbrad Foothills",		71.5,	45.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(6779,		L["Smudge Thunderwood"],		"Hillsbrad Foothills",		71.5,	45.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(7733,		L["Innkeeper Fizzgrimble"],		"Tanaris",			52.6,	27.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(7854,		L["Jangdor Swiftstrider"],		"Feralas",			52.8,	47.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(7940,		L["Darnall"],				"Moonglade",			51.6,	33.3,	"Neutral")
	AddVendor(7947,		L["Vivianna"],				"Feralas",			46.2,	41.6,	"Alliance") -- NO CHARACTER HIGH ENOUGH LEVEL FOR ME TO SCAN THIS NPC
	AddVendor(8131,		L["Blizrik Buckshot"],			"Tanaris",			50.7,	28.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(8145,		L["Sheendra Tallgrass"],		"Feralas",			74.5,	42.8,	"Horde")
	AddVendor(8150,		L["Janet Hommers"],			"Desolace",			66.2,	6.7,	"Alliance")
	AddVendor(8157,		L["Logannas"],				"Feralas",			46.6,	43.0,	"Alliance")
	AddVendor(8158,		L["Bronk"],				"Feralas",			76.1,	43.3,	"Horde")
	AddVendor(8160,		L["Nioma"],				"The Hinterlands",		13.4,	43.3,	"Alliance")
	AddVendor(8161,		L["Harggan"],				"The Hinterlands",		13.4,	44.0,	"Alliance")
	AddVendor(8176,		L["Gharash"],				"Swamp of Sorrows",		47.2,	52.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8177,		L["Rartar"],				"Swamp of Sorrows",		47.2,	57.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8178,		L["Nina Lightbrew"],			"Blasted Lands",		66.9,	18.3,	"Alliance")
	AddVendor(8307,		L["Tarban Hearthgrain"],		"Northern Barrens",		55.1,	61.7,	"Horde")  -- UPDATED
	AddVendor(8363,		L["Shadi Mistrunner"],			"Thunder Bluff",		40.6,	64.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8508,		L["Gretta Ganter"],			"Dun Morogh",			31.5,	44.7,	"Alliance")
	AddVendor(8679,		L["Knaz Blunderflame"],			"Northern Stranglethorn",	67.7,	61.1,	"Neutral")   -- UPDATED
	AddVendor(8681,		L["Outfitter Eric"],			"Ironforge",			43.2,	29.2,	"Alliance")
	AddVendor(8878,		L["Muuran"],				"Desolace",			55.6,	56.5,	"Horde")
	AddVendor(9179,		L["Jazzrik"],				"Badlands",			42.5,	52.6,	"Horde")
	AddVendor(9499,		BB["Plugger Spazzring"],		"Blackrock Depths",		0,	0,	"Neutral")
	AddVendor(9544,		L["Yuka Screwspigot"],			"Burning Steppes",		66.0,	22.0,	"Neutral")
	AddVendor(9636,		L["Kireena"],				"Desolace",			51.0,	53.5,	"Horde")
	AddVendor(10118,	L["Nessa Shadowsong"],			"Teldrassil",			56.3,	92.4,	"Alliance")
	AddVendor(10856,	L["Argent Quartermaster Hasana"],	"Tirisfal Glades",		83.2,	68.1,	"Neutral")
	AddVendor(10857,	L["Argent Quartermaster Lightspark"],	"Western Plaguelands",		42.8,	83.8,	"Neutral")
	AddVendor(11185,	L["Xizzer Fizzbolt"],			"Winterspring",			59.2,	50.9,	"Neutral")
	AddVendor(11187,	L["Himmik"],				"Winterspring",			59.8,	51.6,	"Neutral")  -- UPDATED
	AddVendor(11189,	L["Qia"],				"Winterspring",			59.6,	49.2,	"Neutral")
	AddVendor(11278,	L["Magnus Frostwake"],			"Western Plaguelands",		68.1,	77.6,	"Neutral")
	AddVendor(11536,	L["Quartermaster Miranda Breechlock"],	"Eastern Plaguelands",		75.8,	54.1,	"Neutral")
	AddVendor(11557,	L["Meilosh"],				"Felwood",			65.7,	2.9, 	"Neutral")
	AddVendor(11874,	L["Masat T'andr"],			"Swamp of Sorrows",		26.3,	31.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(12022,	L["Lorelae Wintersong"],		"Moonglade",			48.3,	40.1,	"Neutral")
	AddVendor(12033,	L["Wulan"],				"Desolace",			26.2,	69.7,	"Horde")
	AddVendor(12043,	L["Kulwia"],				"Stonetalon Mountains",		45.4,	59.4,	"Horde")
	AddVendor(12245,	L["Vendor-Tron 1000"],			"Desolace",			60.3,	38.1,	"Neutral")
	AddVendor(12246,	L["Super-Seller 680"],			"Desolace",			40.5,	79.3,	"Neutral")
	AddVendor(12941,	L["Jase Farlane"],			"Eastern Plaguelands",		74.8,	51.8,	"Neutral")
	AddVendor(12942,	L["Leonard Porter"],			"Western Plaguelands",		43.0,	84.3,	"Alliance")
	AddVendor(12943,	L["Werg Thickblade"],			"Tirisfal Glades",		83.2,	69.7,	"Horde")
	AddVendor(12944,	L["Lokhtos Darkbargainer"],		"Blackrock Depths",		0,	0,	"Neutral")
	AddVendor(12956,	L["Zannok Hidepiercer"],		"Silithus",			81.9,	17.8,	"Neutral")
	AddVendor(12958,	L["Gigget Zipcoil"],			"The Hinterlands",		34.5,	38.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(12959,	L["Nergal"],				"Un'Goro Crater",		43.3,	7.7,	"Neutral")
	AddVendor(12962,	L["Wik'Tar"],				"Ashenvale",			11.8,	34.1,	"Horde")
	AddVendor(13420,	L["Penney Copperpinch"],		"Orgrimmar",			53.5,	66.1,	"Neutral")
	AddVendor(13429,	L["Nardstrum Copperpinch"],		"Undercity",			67.5,	38.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(13432,	L["Seersa Copperpinch"],		"Thunder Bluff",		42.0,	55.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(13433,	L["Wulmort Jinglepocket"],		"Ironforge",			33.0,	67.6,	"Neutral")
	AddVendor(13435,	L["Khole Jinglepocket"],		"Stormwind City",		62.2,	70.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(14371,	L["Shen'dralar Provisioner"],		"Dire Maul",			0,	0,	"Neutral")
	AddVendor(14637,	L["Zorbin Fandazzle"],			"Feralas",			48.7,	44.8,	"Neutral")
	AddVendor(14738,	L["Otho Moji'ko"],			"The Hinterlands",		79.3,	79.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(15176,	L["Vargus"],				"Silithus",			51.2,	38.8,	"Neutral")
	AddVendor(15179,	L["Mishta"],				"Silithus",			53.8,	34.4,	"Neutral")
	AddVendor(15293,	L["Aendel Windspear"],			"Silithus",			62.6,	49.8,	"Neutral")
	AddVendor(15419,	L["Kania"],				"Silithus",			52.0,	39.6,	"Neutral")
	AddVendor(15471,	BB["Lieutenant General Andorov"],	"Ruins of Ahn'Qiraj",		0,	0,	"Neutral")
	AddVendor(15909,	L["Fariel Starsong"],			"Moonglade",			54.0,	35.4,	"Neutral")
	AddVendor(16224,	L["Rathis Tomber"],			"Ghostlands",			47.2,	28.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16253,	L["Master Chef Mouldier"],		"Ghostlands",			48.3,	30.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16262,	L["Landraelanis"],			"Eversong Woods",		49.0,	47.0,	"Horde")
	AddVendor(16388,	L["Koren"],				"Karazhan",			0,	0,	"Neutral")
	AddVendor(16583,	L["Rohok"],				"Hellfire Peninsula",		53.2,	38.2,	"Horde")
	AddVendor(16585,	L["Cookie One-Eye"],			"Hellfire Peninsula",		54.6,	41.1,	"Horde")
	AddVendor(16588,	L["Apothecary Antonivich"],		"Hellfire Peninsula",		52.4,	36.5,	"Horde")
	AddVendor(16624,	L["Gelanthis"],				"Silvermoon City",		90.9,	73.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16635,	L["Lyna"],				"Silvermoon City",		70.3,	24.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16638,	L["Deynna"],				"Silvermoon City",		55.6,	51.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16641,	L["Melaris"],				"Silvermoon City",		67.1,	19.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16657,	L["Feera"],				"The Exodar",			54.0,	90.5,	"Alliance")
	AddVendor(16670,	L["Eriden"],				"Silvermoon City",		80.3,	36.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16677,	L["Quelis"],				"Silvermoon City",		69.3,	70.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16689,	L["Zaralda"],				"Silvermoon City",		84.8,	78.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16705,	L["Altaa"],				"The Exodar",			27.5,	62.1,	"Alliance")
	AddVendor(16713,	L["Arras"],				"The Exodar",			60.0,	89.5,	"Alliance")
	AddVendor(16718,	L["Phea"],				"The Exodar",			54.7,	26.5,	"Alliance")
	AddVendor(16722,	L["Egomis"],				"The Exodar",			39.9,	40.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16748,	L["Haferet"],				"The Exodar",			66.6,	73.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16767,	L["Neii"],				"The Exodar",			64.5,	68.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16782,	L["Yatheon"],				"Silvermoon City",		75.6,	40.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16826,	L["Sid Limbardi"],			"Hellfire Peninsula",		54.3,	63.6,	"Alliance")
	AddVendor(17246,	L["\"Cookie\" McWeaksauce"],		"Azuremyst Isle",		46.7,	70.5,	"Alliance")
	AddVendor(17512,	L["Arred"],				"The Exodar",			45.9,	24.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(17518,	L["Ythyar"],				"Karazhan",			0,	0,	"Neutral")
	AddVendor(17585,	L["Quartermaster Urgronn"],		"Hellfire Peninsula",		54.9,	37.9,	"Horde")
	AddVendor(17657,	L["Logistics Officer Ulrike"],		"Hellfire Peninsula",		56.7,	62.6,	"Alliance")
	AddVendor(17904,	L["Fedryen Swiftspear"],		"Zangarmarsh",			79.3,	63.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18005,	L["Haalrun"],				"Zangarmarsh",			67.8,	48.0,	"Alliance")
	AddVendor(18011,	L["Zurai"],				"Zangarmarsh",			85.3,	54.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18015,	L["Gambarinka"],			"Zangarmarsh",			31.7,	49.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18017,	L["Seer Janidi"],			"Zangarmarsh",			32.4,	51.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18255,	L["Apprentice Darius"],			"Deadwind Pass",		47.0,	75.3,	"Neutral")
	AddVendor(18382,	L["Mycah"],				"Zangarmarsh",			17.9,	51.2,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18427,	L["Fazu"],				"Bloodmyst Isle",		53.5,	56.5,	"Alliance")
	AddVendor(18484,	L["Wind Trader Lathrai"],		"Shattrath City",		72.3,	31.0,	"Neutral")
	AddVendor(18664,	L["Aged Dalaran Wizard"],		"Old Hillsbrad Foothills",	0,	0,	"Neutral")
	AddVendor(18672,	L["Thomas Yance"],			"Old Hillsbrad Foothills",	0,	0,	"Neutral")
	AddVendor(18753,	L["Felannia"],				"Hellfire Peninsula",		52.3,	36.1,	"Horde")
	AddVendor(18773,	L["Johan Barnes"],			"Hellfire Peninsula",		53.7,	66.1,	"Alliance")
	AddVendor(18775,	L["Lebowski"],				"Hellfire Peninsula",		55.7,	65.5,	"Alliance")
	AddVendor(18802,	L["Alchemist Gribble"],			"Hellfire Peninsula",		53.8,	65.8,	"Alliance")
	AddVendor(18821,	L["Quartermaster Jaffrey Noreliqe"],	"Nagrand",			41.2,	44.3,	"Horde")
	AddVendor(18822,	L["Quartermaster Davian Vaclav"],	"Nagrand",			41.2,	44.3,	"Alliance")
	AddVendor(18911,	L["Juno Dufrain"],			"Zangarmarsh",			78.0,	66.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18951,	L["Erilia"],				"Eversong Woods",		55.5,	54.0,	"Horde")
	AddVendor(18957,	L["Innkeeper Grilka"],			"Terokkar Forest",		48.8,	45.1,	"Horde")
	AddVendor(18960,	L["Rungor"],				"Terokkar Forest",		48.8,	46.1,	"Horde")
	AddVendor(19015,	L["Mathar G'ochar"],			"Nagrand",			57.0,	39.6,	"Horde")
	AddVendor(19017,	L["Borto"],				"Nagrand",			53.3,	71.9,	"Alliance")
	AddVendor(19038,	L["Supply Officer Mills"],		"Terokkar Forest",		55.7,	53.1,	"Alliance")
	AddVendor(19042,	L["Leeli Longhaggle"],			"Terokkar Forest",		57.7,	53.4,	"Alliance")
	AddVendor(19065,	L["Inessera"],				"Shattrath City",		34.5,	20.2,	"Neutral")
	AddVendor(19074,	L["Skreah"],				"Shattrath City",		46.0,	20.1,	"Neutral")
	AddVendor(19195,	L["Jim Saltit"],			"Shattrath City",		63.6,	68.6,	"Neutral")
	AddVendor(19213,	L["Eiin"],				"Shattrath City",		66.2,	68.7,	"Neutral")
	AddVendor(19234,	L["Yurial Soulwater"],			"Shattrath City",		43.5,	96.9,	"Neutral")
	AddVendor(19296,	L["Innkeeper Biribi"],			"Terokkar Forest",		56.7,	53.3,	"Alliance")
	AddVendor(19321,	L["Quartermaster Endarin"],		"Shattrath City",		47.9,	26.1,	"Neutral")
	AddVendor(19331,	L["Quartermaster Enuril"],		"Shattrath City",		60.5,	64.2,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19342,	L["Krek Cragcrush"],			"Shadowmoon Valley",		28.9,	30.8,	"Horde")
	AddVendor(19351,	L["Daggle Ironshaper"],			"Shadowmoon Valley",		36.8,	54.4,	"Alliance")
	AddVendor(19373,	L["Mari Stonehand"],			"Shadowmoon Valley",		36.8,	55.1,	"Alliance")
	AddVendor(19383,	L["Captured Gnome"],			"Zangarmarsh",			32.5,	48.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(19521,	L["Arrond"],				"Shadowmoon Valley",		55.9,	58.2,	"Neutral")
	AddVendor(19536,	L["Dealer Jadyan"],			"Netherstorm",			44.0,	36.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19537,	L["Dealer Malij"],			"Netherstorm",			44.2,	34.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19540,	L["Asarnan"],				"Netherstorm",			44.2,	33.7,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19661,	L["Viggz Shinesparked"],		"Shattrath City",		64.9,	69.1,	"Neutral")
	AddVendor(19662,	L["Aaron Hollman"],			"Shattrath City",		63.1,	71.1,	"Neutral")
	AddVendor(19663,	L["Madame Ruby"],			"Shattrath City",		63.1,	69.3,	"Neutral")
	AddVendor(19694,	L["Loolruna"],				"Zangarmarsh",			68.5,	50.1,	"Alliance")
	AddVendor(19722,	L["Muheru the Weaver"],			"Zangarmarsh",			40.6,	28.2,	"Alliance")
	AddVendor(19836,	L["Mixie Farshot"],			"Hellfire Peninsula",		61.1,	81.5,	"Horde")
	AddVendor(19837,	L["Daga Ramba"],			"Blade's Edge Mountains",	51.1,	57.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(20028,	L["Doba"],				"Zangarmarsh",			42.3,	27.9,	"Alliance")
	AddVendor(20096,	L["Uriku"],				"Nagrand",			56.2,	73.3,	"Alliance")
	AddVendor(20097,	L["Nula the Butcher"],			"Nagrand",			58.0,	35.7,	"Horde")
	AddVendor(20240,	L["Trader Narasu"],			"Nagrand",			54.6,	75.2,	"Alliance")
	AddVendor(20241,	L["Provisioner Nasela"],		"Nagrand",			53.5,	36.9,	"Horde")
	AddVendor(20242,	L["Karaaz"],				"Netherstorm",			43.6,	34.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(20916,	L["Xerintha Ravenoak"],			"Blade's Edge Mountains",	62.5,	40.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(21113,	L["Sassa Weldwell"],			"Blade's Edge Mountains",	61.3,	68.9,	"Alliance")
	AddVendor(21432,	L["Almaador"],				"Shattrath City",		51.0,	41.9,	"Neutral")
	AddVendor(21474,	L["Coreiel"],				"Nagrand",			42.8,	42.6,	"Horde")
	AddVendor(21485,	L["Aldraan"],				"Nagrand",			42.9,	42.5,	"Alliance")
	AddVendor(21643,	L["Alurmi"],				"Tanaris",			63.0,	57.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(21655,	L["Nakodu"],				"Shattrath City",		62.1,	69.0,	"Neutral")
	AddVendor(22208,	L["Nasmara Moonsong"],			"Shattrath City",		66.0,	69.0,	"Neutral")
	AddVendor(22212,	L["Andrion Darkspinner"],		"Shattrath City",		66.0,	67.8,	"Neutral")
	AddVendor(22213,	L["Gidge Spellweaver"],			"Shattrath City",		66.0,	67.9,	"Neutral")
	AddVendor(23007,	L["Paulsta'ats"],			"Nagrand",			30.6,	57.0,	"Neutral")
	AddVendor(23010,	L["Wolgren Jinglepocket"],		"The Exodar",			54.5,	47.2,	"Alliance")
	AddVendor(23012,	L["Hotoppik Copperpinch"],		"Silvermoon City",		63.5,	79.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(23064,	L["Eebee Jinglepocket"],		"Shattrath City",		51.0,	31.3,	"Neutral")
	AddVendor(23159,	L["Okuno"],				"Black Temple",			0,	0,	"Neutral")
	AddVendor(23437,	L["Indormi"],				"Hyjal Summit",			0,	0,	"Neutral")
	AddVendor(25032,	L["Eldara Dawnrunner"],			"Isle of Quel'Danas",		47.1,	30.0,	"Neutral")
	AddVendor(25950,	L["Shaani"],				"Isle of Quel'Danas",		51.5,	32.6,	"Neutral")
	AddVendor(26081, 	L["High Admiral \"Shelly\" Jorrik"],	"Dun Morogh", 			10.9,	76.1,	"Neutral")
	AddVendor(26569,	L["Alys Vol'tyr"],			"Dragonblight",			36.3,	46.5,	"Horde")
	AddVendor(26868,	L["Provisioner Lorkran"],		"Grizzly Hills",		22.6,	66.1,	"Horde")
	AddVendor(27030,	L["Bradley Towns"],			"Dragonblight",			76.9,	62.2,	"Horde")
	AddVendor(27054,	L["Modoru"],				"Dragonblight",			28.9,	55.9,	"Alliance")
	AddVendor(27147,	L["Librarian Erickson"],		"Borean Tundra",		46.7,	32.5,	"Neutral")
	AddVendor(27666,	L["Ontuvo"],				"Shattrath City",		48.7,	41.3,	"Neutral")
	AddVendor(28701,	L["Timothy Jones"],			"Dalaran",			40.5,	35.2,	"Neutral")
	AddVendor(28714,	L["Ildine Sorrowspear"],		"Dalaran",			39.1,	41.5,	"Neutral")
	AddVendor(28721,	L["Tiffany Cartier"],			"Dalaran",			40.5,	34.4,	"Neutral")
	AddVendor(28722,	L["Bryan Landers"],			"Dalaran",			39.1,	26.5,	"Neutral")
	AddVendor(28723,	L["Larana Drome"],			"Dalaran",			42.3,	37.5,	"Neutral")
	AddVendor(29510,	L["Linna Bruder"],			"Dalaran",			34.6,	34.5,	"Neutral")
	AddVendor(29511,	L["Lalla Brightweave"],			"Dalaran",			36.5,	33.5,	"Neutral")
	AddVendor(29512,	L["Ainderu Summerleaf"],		"Dalaran",			36.5,	34.0,	"Neutral")
	AddVendor(30431,	L["Veteran Crusader Aliocha Segard"],	"Icecrown",			87.6,	75.6,	"Neutral")
	AddVendor(30489,	L["Morgan Day"],			"Wintergrasp",			49.0,	17.1,	"Alliance")
	AddVendor(30734,	L["Jezebel Bican"],			"Hellfire Peninsula",		53.9,	65.5,	"Alliance")
	AddVendor(30735,	L["Kul Inkspiller"],			"Hellfire Peninsula",		52.5,	36.0,	"Horde")
	AddVendor(31031,	L["Misensi"],				"Dalaran",			70.1,	38.5,	"Horde")
	AddVendor(31032,	L["Derek Odds"],			"Dalaran",			41.5,	64.8,	"Alliance")
	AddVendor(31910,	L["Geen"],				"Sholazar Basin",		54.5,	56.2,	"Neutral")
	AddVendor(31911,	L["Tanak"],				"Sholazar Basin",		55.1,	69.1,	"Neutral")
	AddVendor(31916,	L["Tanaika"],				"Howling Fjord",		25.5,	58.7,	"Neutral")
	AddVendor(32287,	L["Archmage Alvareaux"],		"Dalaran",			25.5,	47.4,	"Neutral")
	AddVendor(32294,	L["Knight Dameron"],			"Wintergrasp",			51.7,	17.5,	"Alliance")
	AddVendor(32296,	L["Stone Guard Mukar"],			"Wintergrasp",			51.7,	17.5,	"Horde")
	AddVendor(32514,	L["Vanessa Sellers"],			"Dalaran",			38.7,	40.8,	"Neutral")
	AddVendor(32515,	L["Braeg Stoutbeard"],			"Dalaran",			37.6,	29.5,	"Neutral")
	AddVendor(32533,	L["Cielstrasza"],			"Dragonblight",			59.9,	53.1,	"Neutral")
	AddVendor(32538,	L["Duchess Mynx"],			"Icecrown",			43.5,	20.6,	"Neutral")
	AddVendor(32540,	L["Lillehoff"],				"The Storm Peaks",		66.2,	61.4,	"Neutral")
	AddVendor(32564,	L["Logistics Officer Silverstone"],	"Borean Tundra",		57.7,	66.5,	"Alliance")
	AddVendor(32565,	L["Gara Skullcrush"],			"Borean Tundra",		41.4,	53.6,	"Horde")
	AddVendor(32763,	L["Sairuk"],				"Dragonblight",			48.5,	75.7,	"Neutral")
	AddVendor(32773,	L["Logistics Officer Brighton"],	"Howling Fjord",		59.7,	63.9,	"Alliance")
	AddVendor(32774,	L["Sebastian Crane"],			"Howling Fjord",		79.6,	30.7,	"Horde")
	AddVendor(33594,	L["Fizzix Blastbolt"],			"Icecrown",			72.2,	20.9,	"Neutral")
	AddVendor(33595,	L["Mera Mistrunner"],			"Icecrown",			72.4,	20.9,	"Neutral")
	AddVendor(33602,	L["Anuur"],				"Icecrown",			71.4,	20.8,	"Neutral")
	AddVendor(33637,	L["Kirembri Silvermane"],		"Shattrath City",		58.1,	75.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(33680,	L["Nemiha"],				"Shattrath City",		36.1,	47.7,	"Neutral")
	AddVendor(34382,	L["Chapman"],				"Undercity",			68.1,	11.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(34601,	L["Harlown Darkweave"],			"Ashenvale",			18.2,	60.0,	"Alliance")
	AddVendor(35826,	L["Kaye Toogie"],			"Dalaran",			34.0,	35.6,	"Neutral")
	AddVendor(37687,	L["Alchemist Finklestein"],		"Icecrown Citadel",		0,	0,	"Neutral")
	AddVendor(40160,	L["Frozo the Renowned"],		"Dalaran",			41.0,	28.5,	"Neutral")
	AddVendor(40226,	L["Pratt McGrubben"],			"Feralas",			45.4,	41.2,	"Alliance")
	AddVendor(40572,	L["Haughty Modiste"],			"Tanaris",			50.7,	28.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(40589,	L["Dirge Quikcleave"],			"Tanaris",			52.6,	29.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(41435,	L["Fradd Swiftgear"],			"Wetlands",			26.8,	26.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(44583,	L["Terrance Denman"],			"Stormwind City", 		63.2,	61.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(45546,	L["Vizna Bangwrench"],			"Orgrimmar",			36.4,	86.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45549,	L["Zido Helmbreaker"],			"Orgrimmar",			36.4,	83.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45558,	L["Lizna Goldweaver"],			"Orgrimmar",			41.3,	79.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(46359,	L["Punra"],				"Orgrimmar",			45.0,	76.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(48060,	L["\"Chef\" Overheat"],			"Badlands",			65.1,	39.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(49701,	L["Bario Matalli"],			"Stormwind City", 		50.4,	71.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(49703,	L["Casandra Downs"],			"Twilight Highlands",		78.6,	76.2,	"Alliance")
	AddVendor(49737,	L["Shazdar"],				"Orgrimmar",			56.8,	62.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(49918,	L["Buckslappy"],			"Badlands",			90.9,	38.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(50134,	L["Senthii"],				"Twilight Highlands",		78.7,	77.0,	"Alliance")
	AddVendor(50146,	L["Agatian Fallanos"],			"Twilight Highlands",		76.7,	49.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50172,	L["Threm Blackscalp"],			"Twilight Highlands",		75.2,	50.1,	"Horde")
	AddVendor(50248,	L["Una Kobuna"],			"Twilight Highlands",		76.6,	49.4,	"Horde")
	AddVendor(50375,	L["Kuldar Steeltooth"],			"Twilight Highlands",		77.3,	53.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50381,	L["Misty Merriweather"],		"Twilight Highlands",		78.8,	76.2,	"Alliance")
	AddVendor(50382,	L["Brundall Chiselgut"],		"Twilight Highlands",		79.1,	76.5,	"Alliance")
	AddVendor(50386,	L["Sal Ferraga"],			"Twilight Highlands",		78.6,	76.9,	"Alliance")
	AddVendor(50433,	L["Aristaleon Sunweaver"],		"Twilight Highlands",		75.2,	50.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50480,	L["Isabel Jones"],			"Stormwind City",		63.7,	61.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(50482,	L["Marith Lazuria"],			"Orgrimmar",			72.5,	34.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52584,	L["Laida Gembold"],			"Ironforge",			50.6,	27.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52588,	L["Sara Lanner"],			"Undercity",			56.7,	36.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52644,	L["Tarien Silverdew"],			"Darnassus",			54.4,	30.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52655,	L["Palehoof's Big Bag of Parts"],	"Thunder Bluff",		36.2,	60.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52658,	L["Paku Cloudchaser"],			"Thunder Bluff",		34.7,	53.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(53214,	L["Damek Bloombeard"],			"Hyjal",			47.0,	90.2,	"Neutral")
	AddVendor(53881,	L["Ayla Shadowstorm"],			"Hyjal",			72.5,	36.2,	"Neutral")
	AddVendor(54232,	L["Mrs. Gant"],				"The Cape of Stranglethorn",	42.6,	72.8,	"Neutral") -- COMPLETLY UPDATED
	AddVendor(56925,	L["Farrah Facet"],			"Stormwind City",		63.8,	61.6,	"Alliance") -- COMPLETLY UPDATED
	AddVendor(57922,	L["Taryssa Lazuria"],			"Orgrimmar",			72.4,	34.6,	"Horde") -- COMPLETLY UPDATED

	self.InitVendor = nil
end
