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

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BB = LibStub("LibBabble-Boss-3.0"):GetLookupTable()

local BN = private.BOSS_NAMES
local Z = private.ZONE_NAMES

private.vendor_list = {}

function addon:InitVendor()
	local function AddVendor(id_num, name, zone_name, x, y, faction)
		private:AddListEntry(private.vendor_list, id_num, name, zone_name, x, y, faction)
	end

	AddVendor(66,		L["Tharynn Bouden"],			Z.ELWYNN_FOREST,		41.9,	67.1,	"Alliance")
	AddVendor(340,		L["Kendor Kabonka"],			Z.STORMWIND_CITY,		76.6,	52.8,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(734,		L["Corporal Bluth"],			Z.NORTHERN_STRANGLETHORN,	47.5,	10.3,	"Alliance") -- UPDATED
	AddVendor(777,		L["Amy Davenport"],			Z.REDRIDGE_MOUNTAINS,		29.1,	47.5,	"Alliance")
	AddVendor(843,		L["Gina MacGregor"],			Z.WESTFALL,			57.6,	54.0,	"Alliance")
	AddVendor(989,		L["Banalash"],				Z.SWAMP_OF_SORROWS,		46.6,	56.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(1146,		L["Vharr"],				Z.NORTHERN_STRANGLETHORN,	38.7,	49.2,	"Horde")   -- UPDATED
	AddVendor(1148,		L["Nerrist"],				Z.NORTHERN_STRANGLETHORN,	39.2,	51.0,	"Horde")  -- UPDATED
	AddVendor(1149,		L["Uthok"],				Z.NORTHERN_STRANGLETHORN,	37.5,	49.2,	"Horde")   -- UPDATED
	AddVendor(1250,		L["Drake Lindgren"],			Z.ELWYNN_FOREST,		83.3,	66.7,	"Alliance")
	AddVendor(1286,		L["Edna Mullby"],			Z.STORMWIND_CITY,		64.7,	71.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1313,		L["Maria Lumere"],			Z.STORMWIND_CITY,		55.7,	85.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1318,		L["Jessara Cordell"],			Z.STORMWIND_CITY,		53.0,	74.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1347,		L["Alexandra Bolero"],			Z.STORMWIND_CITY,		53.3,	81.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1448,		L["Neal Allen"],			Z.WETLANDS,			11.8,	52.6,	"Alliance")
	AddVendor(1454,		L["Jennabink Powerseam"],		Z.WETLANDS,			 8.1,	55.9,	"Alliance")
	AddVendor(1465,		L["Drac Roughcut"],			Z.LOCH_MODAN,			35.6,	49.0,	"Alliance")
	AddVendor(1471,		L["Jannos Ironwill"],			Z.ARATHI_HIGHLANDS,		40.8,	48.0,	"Alliance")
	AddVendor(1474,		L["Rann Flamespinner"],			Z.LOCH_MODAN,			36.0,	46.0,	"Alliance")
	AddVendor(1684,		L["Khara Deepwater"],			Z.LOCH_MODAN,			39.5,	39.3,	"Alliance")
	AddVendor(1685,		L["Xandar Goodbeard"],			Z.LOCH_MODAN,			82.5,	63.5,	"Alliance")
	AddVendor(2118,		L["Abigail Shiel"],			Z.TIRISFAL_GLADES,		61.0,	51.0,	"Horde") -- UPDATED
	AddVendor(2393,		L["Christoph Jeffcoat"],		Z.HILLSBRAD_FOOTHILLS,		57.5,	47.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2394,		L["Mallen Swain"],			Z.HILLSBRAD_FOOTHILLS,		58.1,	47.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2397,		L["Derak Nightfall"],			Z.HILLSBRAD_FOOTHILLS,		57.7,	45.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2480,		L["Bro'kin"],				Z.HILLSBRAD_FOOTHILLS,		44.0,	21.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(2482,		L["Zarena Cromwind"],			Z.THE_CAPE_OF_STRANGLETHORN,	43.0,	70.7,	"Neutral")  -- UPDATED
	AddVendor(2483,		L["Jaquilina Dramet"],			Z.NORTHERN_STRANGLETHORN,	43.7,	23.1,	"Neutral") -- UPDATED
	AddVendor(2663,		L["Narkk"],				Z.THE_CAPE_OF_STRANGLETHORN,	42.7,	69.2,	"Neutral")   -- UPDATED
	AddVendor(2664,		L["Kelsey Yance"],			Z.THE_CAPE_OF_STRANGLETHORN,	42.8,	69.1,	"Neutral")   -- UPDATED
	AddVendor(2668,		L["Danielle Zipstitch"],		Z.DUSKWOOD,			75.8,	45.5,	"Alliance")
	AddVendor(2669,		L["Sheri Zipstitch"],			Z.DUSKWOOD,			75.7,	45.5,	"Alliance")
	AddVendor(2670,		L["Xizk Goodstitch"],			Z.THE_CAPE_OF_STRANGLETHORN,	43.6,	73.0,	"Neutral")  -- UPDATED
	AddVendor(2672,		L["Cowardly Crosby"],			Z.THE_CAPE_OF_STRANGLETHORN,	40.9,	82.5,	"Neutral")   -- UPDATED
	AddVendor(2679,		L["Wenna Silkbeard"],			Z.WETLANDS,			25.7,	25.8,	"Alliance")
	AddVendor(2687,		L["Gnaz Blunderflame"],			Z.NORTHERN_STRANGLETHORN,	67.5,	61.5,	"Neutral")  -- UPDATED
	AddVendor(2688,		L["Ruppo Zipcoil"],			Z.THE_HINTERLANDS,		34.3,	37.9,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(2697,		L["Clyde Ranthal"],			Z.REDRIDGE_MOUNTAINS,		88.9,	70.9,	"Alliance")
	AddVendor(2698,		L["George Candarte"],			Z.HILLSBRAD_FOOTHILLS,		76.7,	58.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2699,		L["Rikqiz"],				Z.THE_CAPE_OF_STRANGLETHORN,	43.2,	71.7,	"Neutral")   -- UPDATED
	AddVendor(2803,		L["Malygen"],				Z.FELWOOD,			62.3,	25.6,	"Alliance")
	AddVendor(2810,		L["Hammon Karwn"],			Z.ARATHI_HIGHLANDS,		46.5,	47.3,	"Alliance")
	AddVendor(2812,		L["Drovnar Strongbrew"],		Z.ARATHI_HIGHLANDS,		46.4,	47.1,	"Alliance")
	AddVendor(2814,		L["Narj Deepslice"],			Z.ARATHI_HIGHLANDS,		45.6,	47.6,	"Alliance")
	AddVendor(2816,		L["Androd Fadran"],			Z.ARATHI_HIGHLANDS,		45.0,	46.9,	"Alliance")
	AddVendor(2819,		L["Tunkk"],				Z.ARATHI_HIGHLANDS,		70.0,	35.4,	"Horde")
	AddVendor(2821,		L["Keena"],				Z.ARATHI_HIGHLANDS,		69.2,	33.6,	"Horde")
	AddVendor(2838,		L["Crazk Sparks"],			Z.THE_CAPE_OF_STRANGLETHORN,	43.0,	72.8,	"Neutral")   -- UPDATED
	AddVendor(2843,		L["Jutak"],				Z.THE_CAPE_OF_STRANGLETHORN,	41.6,	74.1,	"Neutral")   -- UPDATED
	AddVendor(2846,		L["Blixrez Goodstitch"],		Z.THE_CAPE_OF_STRANGLETHORN,	42.8,	74.1,	"Neutral")   -- UPDATED
	AddVendor(2848,		L["Glyx Brewright"],			Z.THE_CAPE_OF_STRANGLETHORN,	42.6,	74.9,	"Neutral")   -- UPDATED
	AddVendor(2999,		L["Taur Stonehoof"],			Z.THUNDER_BLUFF,		39.8,	55.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3005,		L["Mahu"],				Z.THUNDER_BLUFF,		43.8,	45.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3008,		L["Mak"],				Z.THUNDER_BLUFF,		42.0,	43.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3012,		L["Nata Dawnstrider"],			Z.THUNDER_BLUFF,		44.9,	37.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3027,		L["Naal Mistrunner"],			Z.THUNDER_BLUFF,		51.0,	52.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3029,		L["Sewa Mistrunner"],			Z.THUNDER_BLUFF,		55.8,	47.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3081,		L["Wunna Darkmane"],			Z.MULGORE,			46.1,	58.2,	"Horde")
	AddVendor(3085,		L["Gloria Femmel"],			Z.REDRIDGE_MOUNTAINS,		26.7,	43.5,	"Alliance")
	AddVendor(3134,		L["Kzixx"],				Z.DUSKWOOD,			81.9,	19.9,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(3178,		L["Stuart Fleming"],			Z.WETLANDS,			 8.1,	58.4,	"Alliance")
	AddVendor(3333,		L["Shankys"],				Z.ORGRIMMAR,			66.74,	41.86,	"Horde") -- UPDATED
	AddVendor(3335,		L["Hagrus"],				Z.ORGRIMMAR,			46.0,	45.9,	"Horde")
	AddVendor(3346,		L["Kithas"],				Z.ORGRIMMAR,			53.3,	48.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3348,		L["Kor'geld"],				Z.ORGRIMMAR,			55.23,	45.83,	"Horde") -- UPDATED
	AddVendor(3356,		L["Sumi"],				Z.ORGRIMMAR,			75.8,	35.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3364,		L["Borya"],				Z.ORGRIMMAR,			60.7,	58.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3366,		L["Tamar"],				Z.ORGRIMMAR,			60.3,	54.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3367,		L["Felika"],				Z.ORGRIMMAR,			60.5,	50.7,	"Horde")
	AddVendor(3400,		L["Xen'to"],				Z.ORGRIMMAR,			32.6,	68.6,	"Horde") -- UPDATED
	AddVendor(3413,		L["Sovik"],				Z.ORGRIMMAR,			56.8,	56.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3482,		L["Tari'qa"],				Z.NORTHERN_BARRENS,		49.0,	58.2,	"Horde")   -- UPDATED
	AddVendor(3485,		L["Wrahk"],				Z.NORTHERN_BARRENS,		50.0,	61.1,	"Horde")   -- UPDATED
	AddVendor(3489,		L["Zargh"],				Z.NORTHERN_BARRENS,		50.6,	57.8,	"Horde")   -- UPDATED
	AddVendor(3490,		L["Hula'mahi"],				Z.NORTHERN_BARRENS,		48.6,	58.4,	"Horde")   -- UPDATED
	AddVendor(3495,		L["Gagsprocket"],			Z.NORTHERN_BARRENS,		68.4,	69.2,	"Neutral")   -- UPDATED
	AddVendor(3497,		L["Kilxx"],				Z.NORTHERN_BARRENS,		68.6,	72.5,	"Neutral")   -- UPDATED
	AddVendor(3499,		L["Ranik"],				Z.NORTHERN_BARRENS,		67.1,	73.5,	"Neutral")   -- UPDATED
	AddVendor(3522,		L["Constance Brisboise"],		Z.TIRISFAL_GLADES,		52.6,	55.7,	"Horde")
	AddVendor(3537,		L["Zixil"],				Z.HILLSBRAD_FOOTHILLS,		49.8,	60.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(3550,		L["Martine Tramblay"],			Z.TIRISFAL_GLADES,		65.8,	59.6,	"Horde") -- UPDATED
	AddVendor(3556,		L["Andrew Hilbert"],			Z.SILVERPINE_FOREST,		43.2,	40.7,	"Horde")
	AddVendor(3881,		L["Grimtak"],				Z.DUROTAR,			50.7,	42.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3954,		L["Dalria"],				Z.ASHENVALE,			35.1,	52.1,	"Alliance")
	AddVendor(3958,		L["Lardan"],				Z.ASHENVALE,			34.8,	49.8,	"Alliance")
	AddVendor(4083,		L["Jeeda"],				Z.STONETALON_MOUNTAINS,		50.5,	63.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4168,		L["Elynna"],				Z.DARNASSUS,			60.6,	36.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4223,		L["Fyldan"],				Z.DARNASSUS,			49.5,	36.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4225,		L["Saenorion"],				Z.DARNASSUS,			60.0,	37.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4226,		L["Ulthir"],				Z.DARNASSUS,			54.6,	38.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4228,		L["Vaean"],				Z.DARNASSUS,			56.4,	32.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4229,		L["Mythrin'dir"],			Z.DARNASSUS,			58.1,	34.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4265,		L["Nyoma"],				Z.TELDRASSIL,			56.6,	53.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4305,		L["Kriggon Talsone"],			Z.WESTFALL,			36.2,	90.1,	"Alliance")
	AddVendor(4553,		L["Ronald Burch"],			Z.UNDERCITY,			62.3,	43.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4561,		L["Daniel Bartlett"],			Z.UNDERCITY,			64.1,	37.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4574,		L["Lizbeth Cromwell"],			Z.UNDERCITY,			81.0,	30.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4577,		L["Millie Gregorian"],			Z.UNDERCITY,			70.6,	30.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4589,		L["Joseph Moore"],			Z.UNDERCITY,			70.0,	58.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4597,		L["Samuel Van Brunt"],			Z.UNDERCITY,			61.4,	30.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4610,		L["Algernon"],				Z.UNDERCITY,			51.7,	74.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4617,		L["Thaddeus Webb"],			Z.UNDERCITY,			62.4,	61.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4775,		L["Felicia Doan"],			Z.UNDERCITY,			64.1,	50.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4782,		L["Truk Wildbeard"],			Z.THE_HINTERLANDS,		14.4,	42.5,	"Alliance")
	AddVendor(4879,		L["Ogg'marr"],				Z.DUSTWALLOW_MARSH,		36.7,	31.0,	"Horde")
	AddVendor(4897,		L["Helenia Olden"],			Z.DUSTWALLOW_MARSH,		66.4,	51.5,	"Alliance")
	AddVendor(5128,		L["Bombus Finespindle"],		Z.IRONFORGE,			39.6,	34.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5154,		L["Poranna Snowbraid"],			Z.IRONFORGE,			43.0,	28.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5158,		L["Tilli Thistlefuzz"],			Z.IRONFORGE,			61.0,	44.0,	"Alliance") -- COMPLETELY UPDATEDM
	AddVendor(5160,		L["Emrul Riknussun"],			Z.IRONFORGE,			59.9,	37.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5162,		L["Tansy Puddlefizz"],			Z.IRONFORGE,			48.0,	6.3,	"Alliance")
	AddVendor(5163,		L["Burbik Gearspanner"],		Z.IRONFORGE,			46.5,	27.1,	"Alliance")
	AddVendor(5175,		L["Gearcutter Cogspinner"],		Z.IRONFORGE,			68.0,	43.1,	"Alliance")
	AddVendor(5178,		L["Soolie Berryfizz"],			Z.IRONFORGE,			66.6,	54.5,	"Alliance")
	AddVendor(5411,		L["Krinkle Goodsteel"],			Z.TANARIS,			51.2,	30.4,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(5483,		L["Erika Tate"],			Z.STORMWIND_CITY,		77.6,	53.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5494,		L["Catherine Leland"],			Z.STORMWIND_CITY,		55.1,	69.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5512,		L["Kaita Deepforge"],			Z.STORMWIND_CITY,		63.5,	37.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5565,		L["Jillian Tanner"],			Z.STORMWIND_CITY,		71.6,	62.8,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5594,		L["Alchemist Pestlezugg"],		Z.TANARIS,			50.8,	28.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(5748,		L["Killian Sanatha"],			Z.SILVERPINE_FOREST,		33.0,	17.8,	"Horde")
	AddVendor(5757,		L["Lilly"],				Z.SILVERPINE_FOREST,		43.1,	50.8,	"Horde")
	AddVendor(5758,		L["Leo Sarn"],				Z.SILVERPINE_FOREST,		53.9,	82.3,	"Horde")
	AddVendor(5940,		L["Harn Longcast"],			Z.MULGORE,			47.5,	55.1,	"Horde")
	AddVendor(5942,		L["Zansoa"],				Z.DUROTAR,			57.4,	77.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(6568,		L["Vizzklick"],				Z.TANARIS,			50.7,	28.7,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(6567,		L["Ghok'kah"],				Z.DUSTWALLOW_MARSH,		35.2,	30.8,	"Horde")
	AddVendor(6574,		L["Jun'ha"],				Z.ARATHI_HIGHLANDS,		72.7,	36.5,	"Horde")
	AddVendor(6730,		L["Jinky Twizzlefixxit"],		Z.THOUSAND_NEEDLES,		77.7,	77.8,	"Alliance")
	AddVendor(6777,		L["Zan Shivsproket"],			Z.HILLSBRAD_FOOTHILLS,		71.5,	45.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(6779,		L["Smudge Thunderwood"],		Z.HILLSBRAD_FOOTHILLS,		71.5,	45.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(7733,		L["Innkeeper Fizzgrimble"],		Z.TANARIS,			52.6,	27.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(7854,		L["Jangdor Swiftstrider"],		Z.FERALAS,			52.8,	47.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(7940,		L["Darnall"],				Z.MOONGLADE,			51.6,	33.3,	"Neutral")
	AddVendor(7947,		L["Vivianna"],				Z.FERALAS,			46.2,	41.6,	"Alliance") -- NO CHARACTER HIGH ENOUGH LEVEL FOR ME TO SCAN THIS NPC
	AddVendor(8131,		L["Blizrik Buckshot"],			Z.TANARIS,			50.7,	28.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(8145,		L["Sheendra Tallgrass"],		Z.FERALAS,			74.5,	42.8,	"Horde")
	AddVendor(8150,		L["Janet Hommers"],			Z.DESOLACE,			66.2,	6.7,	"Alliance")
	AddVendor(8157,		L["Logannas"],				Z.FERALAS,			46.6,	43.0,	"Alliance")
	AddVendor(8158,		L["Bronk"],				Z.FERALAS,			76.1,	43.3,	"Horde")
	AddVendor(8160,		L["Nioma"],				Z.THE_HINTERLANDS,		13.4,	43.3,	"Alliance")
	AddVendor(8161,		L["Harggan"],				Z.THE_HINTERLANDS,		13.4,	44.0,	"Alliance")
	AddVendor(8176,		L["Gharash"],				Z.SWAMP_OF_SORROWS,		47.2,	52.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8177,		L["Rartar"],				Z.SWAMP_OF_SORROWS,		47.2,	57.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8178,		L["Nina Lightbrew"],			Z.BLASTED_LANDS,		62.4,	16.0,	"Alliance")
	AddVendor(8307,		L["Tarban Hearthgrain"],		Z.NORTHERN_BARRENS,		55.1,	61.7,	"Horde")  -- UPDATED
	AddVendor(8363,		L["Shadi Mistrunner"],			Z.THUNDER_BLUFF,		40.6,	64.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8508,		L["Gretta Ganter"],			Z.DUN_MOROGH,			38.6,	42.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(8679,		L["Knaz Blunderflame"],			Z.NORTHERN_STRANGLETHORN,	67.7,	61.1,	"Neutral")   -- UPDATED
	AddVendor(8681,		L["Outfitter Eric"],			Z.IRONFORGE,			43.2,	29.2,	"Alliance")
	AddVendor(8878,		L["Muuran"],				Z.DESOLACE,			55.6,	56.5,	"Horde")
	AddVendor(9499,		BN.PLUGGER_SPAZZRING,			Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral")
	AddVendor(9636,		L["Kireena"],				Z.DESOLACE,			51.0,	53.5,	"Horde")
	AddVendor(10118,	L["Nessa Shadowsong"],			Z.TELDRASSIL,			56.3,	92.4,	"Alliance")
	AddVendor(10856,	L["Argent Quartermaster Hasana"],	Z.TIRISFAL_GLADES,		83.2,	68.1,	"Neutral")
	AddVendor(10857,	L["Argent Quartermaster Lightspark"],	Z.WESTERN_PLAGUELANDS,		42.8,	83.8,	"Neutral")
	AddVendor(11185,	L["Xizzer Fizzbolt"],			Z.WINTERSPRING,			59.2,	50.9,	"Neutral")
	AddVendor(11187,	L["Himmik"],				Z.WINTERSPRING,			59.8,	51.6,	"Neutral")  -- UPDATED
	AddVendor(11188,	L["Evie Whirlbrew"],			Z.WINTERSPRING,			59.2,	50.0,	"Neutral")
	AddVendor(11189,	L["Qia"],				Z.WINTERSPRING,			59.6,	49.2,	"Neutral")
	AddVendor(11278,	L["Magnus Frostwake"],			Z.WESTERN_PLAGUELANDS,		68.1,	77.6,	"Neutral")
	AddVendor(11536,	L["Quartermaster Miranda Breechlock"],	Z.EASTERN_PLAGUELANDS,		75.8,	54.1,	"Neutral")
	AddVendor(11557,	L["Meilosh"],				Z.FELWOOD,			65.7,	2.9, 	"Neutral")
	AddVendor(12022,	L["Lorelae Wintersong"],		Z.MOONGLADE,			48.3,	40.1,	"Neutral")
	AddVendor(12033,	L["Wulan"],				Z.DESOLACE,			26.2,	69.7,	"Horde")
	AddVendor(12043,	L["Kulwia"],				Z.STONETALON_MOUNTAINS,		45.4,	59.4,	"Horde")
	AddVendor(12245,	L["Vendor-Tron 1000"],			Z.DESOLACE,			60.3,	38.1,	"Neutral")
	AddVendor(12246,	L["Super-Seller 680"],			Z.DESOLACE,			40.5,	79.3,	"Neutral")
	AddVendor(12941,	L["Jase Farlane"],			Z.EASTERN_PLAGUELANDS,		74.8,	51.8,	"Neutral")
	AddVendor(12942,	L["Leonard Porter"],			Z.WESTERN_PLAGUELANDS,		43.0,	84.3,	"Alliance")
	AddVendor(12943,	L["Werg Thickblade"],			Z.TIRISFAL_GLADES,		83.2,	69.7,	"Horde")
	AddVendor(12944,	L["Lokhtos Darkbargainer"],		Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral")
	AddVendor(12956,	L["Zannok Hidepiercer"],		Z.SILITHUS,			81.9,	17.8,	"Neutral")
	AddVendor(12958,	L["Gigget Zipcoil"],			Z.THE_HINTERLANDS,		34.5,	38.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(12959,	L["Nergal"],				Z.UNGORO_CRATER,		54.8,	62.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(12962,	L["Wik'Tar"],				Z.ASHENVALE,			11.8,	34.1,	"Horde")
	AddVendor(13420,	L["Penney Copperpinch"],		Z.ORGRIMMAR,			53.5,	66.1,	"Neutral")
	AddVendor(13429,	L["Nardstrum Copperpinch"],		Z.UNDERCITY,			67.5,	38.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(13432,	L["Seersa Copperpinch"],		Z.THUNDER_BLUFF,		42.0,	55.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(13433,	L["Wulmort Jinglepocket"],		Z.IRONFORGE,			33.0,	67.6,	"Neutral")
	AddVendor(13435,	L["Khole Jinglepocket"],		Z.STORMWIND_CITY,		62.2,	70.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(14371,	L["Shen'dralar Provisioner"],		Z.DIRE_MAUL,			0,	0,	"Neutral")
	AddVendor(14637,	L["Zorbin Fandazzle"],			Z.FERALAS,			48.7,	44.8,	"Neutral")
	AddVendor(14738,	L["Otho Moji'ko"],			Z.THE_HINTERLANDS,		79.3,	79.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(15174,	L["Calandrath"],			Z.SILITHUS,			55.4,	36.6,	"Neutral")
	AddVendor(15176,	L["Vargus"],				Z.SILITHUS,			54.8,	36.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(15179,	L["Mishta"],				Z.SILITHUS,			53.8,	34.4,	"Neutral")
	AddVendor(15293,	L["Aendel Windspear"],			Z.SILITHUS,			64.6,	45.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(15419,	L["Kania"],				Z.SILITHUS,			55.6,	37.2,	"Neutral")
	AddVendor(15471,	BB["Lieutenant General Andorov"],	Z.RUINS_OF_AHNQIRAJ,		0,	0,	"Neutral")
	AddVendor(15909,	L["Fariel Starsong"],			Z.MOONGLADE,			54.0,	35.4,	"Neutral")
	AddVendor(16224,	L["Rathis Tomber"],			Z.GHOSTLANDS,			47.2,	28.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16253,	L["Master Chef Mouldier"],		Z.GHOSTLANDS,			48.3,	30.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16262,	L["Landraelanis"],			Z.EVERSONG_WOODS,		49.0,	47.0,	"Horde")
	AddVendor(16388,	L["Koren"],				Z.KARAZHAN,			0,	0,	"Neutral")
	AddVendor(16583,	L["Rohok"],				Z.HELLFIRE_PENINSULA,		53.2,	38.2,	"Horde")
	AddVendor(16585,	L["Cookie One-Eye"],			Z.HELLFIRE_PENINSULA,		54.6,	41.1,	"Horde")
	AddVendor(16588,	L["Apothecary Antonivich"],		Z.HELLFIRE_PENINSULA,		52.4,	36.5,	"Horde")
	AddVendor(16624,	L["Gelanthis"],				Z.SILVERMOON_CITY,		90.9,	73.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16635,	L["Lyna"],				Z.SILVERMOON_CITY,		70.3,	24.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16638,	L["Deynna"],				Z.SILVERMOON_CITY,		55.6,	51.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16641,	L["Melaris"],				Z.SILVERMOON_CITY,		67.1,	19.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16657,	L["Feera"],				Z.THUNDER_BLUFF,		54.0,	90.5,	"Alliance")
	AddVendor(16670,	L["Eriden"],				Z.SILVERMOON_CITY,		80.3,	36.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16677,	L["Quelis"],				Z.SILVERMOON_CITY,		69.3,	70.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16689,	L["Zaralda"],				Z.SILVERMOON_CITY,		84.8,	78.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16705,	L["Altaa"],				Z.THUNDER_BLUFF,		27.5,	62.1,	"Alliance")
	AddVendor(16713,	L["Arras"],				Z.THUNDER_BLUFF,		60.0,	89.5,	"Alliance")
	AddVendor(16718,	L["Phea"],				Z.THUNDER_BLUFF,		54.7,	26.5,	"Alliance")
	AddVendor(16722,	L["Egomis"],				Z.THUNDER_BLUFF,		39.9,	40.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16748,	L["Haferet"],				Z.THUNDER_BLUFF,		66.6,	73.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16767,	L["Neii"],				Z.THUNDER_BLUFF,		64.5,	68.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16782,	L["Yatheon"],				Z.SILVERMOON_CITY,		75.6,	40.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16826,	L["Sid Limbardi"],			Z.HELLFIRE_PENINSULA,		54.3,	63.6,	"Alliance")
	AddVendor(17246,	L["\"Cookie\" McWeaksauce"],		Z.AZUREMYST_ISLE,		46.7,	70.5,	"Alliance")
	AddVendor(17512,	L["Arred"],				Z.THUNDER_BLUFF,		45.9,	24.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(17518,	L["Ythyar"],				Z.KARAZHAN,			0,	0,	"Neutral")
	AddVendor(17585,	L["Quartermaster Urgronn"],		Z.HELLFIRE_PENINSULA,		54.9,	37.9,	"Horde")
	AddVendor(17657,	L["Logistics Officer Ulrike"],		Z.HELLFIRE_PENINSULA,		56.7,	62.6,	"Alliance")
	AddVendor(17904,	L["Fedryen Swiftspear"],		Z.ZANGARMARSH,			79.3,	63.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18005,	L["Haalrun"],				Z.ZANGARMARSH,			67.8,	48.0,	"Alliance")
	AddVendor(18011,	L["Zurai"],				Z.ZANGARMARSH,			85.3,	54.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18015,	L["Gambarinka"],			Z.ZANGARMARSH,			31.7,	49.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18017,	L["Seer Janidi"],			Z.ZANGARMARSH,			32.4,	51.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18255,	L["Apprentice Darius"],			Z.DEADWIND_PASS,		47.0,	75.3,	"Neutral")
	AddVendor(18382,	L["Mycah"],				Z.ZANGARMARSH,			17.9,	51.2,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18427,	L["Fazu"],				Z.BLOODMYST_ISLE,		53.5,	56.5,	"Alliance")
	AddVendor(18484,	L["Wind Trader Lathrai"],		Z.SHATTRATH_CITY,		72.3,	31.0,	"Neutral")
	AddVendor(18664,	L["Aged Dalaran Wizard"],		Z.OLD_HILLSBRAD_FOOTHILLS,	0,	0,	"Neutral")
	AddVendor(18672,	L["Thomas Yance"],			Z.OLD_HILLSBRAD_FOOTHILLS,	0,	0,	"Neutral")
	AddVendor(18753,	L["Felannia"],				Z.HELLFIRE_PENINSULA,		52.3,	36.1,	"Horde")
	AddVendor(18772,	L["Hama"],				Z.HELLFIRE_PENINSULA,		54.1,	63.6,	"Alliance")
	AddVendor(18773,	L["Johan Barnes"],			Z.HELLFIRE_PENINSULA,		53.7,	66.1,	"Alliance")
	AddVendor(18775,	L["Lebowski"],				Z.HELLFIRE_PENINSULA,		55.7,	65.5,	"Alliance")
	AddVendor(18802,	L["Alchemist Gribble"],			Z.HELLFIRE_PENINSULA,		53.8,	65.8,	"Alliance")
	AddVendor(18821,	L["Quartermaster Jaffrey Noreliqe"],	Z.NAGRAND,			41.2,	44.3,	"Horde")
	AddVendor(18822,	L["Quartermaster Davian Vaclav"],	Z.NAGRAND,			41.2,	44.3,	"Alliance")
	AddVendor(18911,	L["Juno Dufrain"],			Z.ZANGARMARSH,			78.0,	66.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18951,	L["Erilia"],				Z.EVERSONG_WOODS,		55.5,	54.0,	"Horde")
	AddVendor(18957,	L["Innkeeper Grilka"],			Z.TEROKKAR_FOREST,		48.8,	45.1,	"Horde")
	AddVendor(18960,	L["Rungor"],				Z.TEROKKAR_FOREST,		48.8,	46.1,	"Horde")
	AddVendor(19015,	L["Mathar G'ochar"],			Z.NAGRAND,			57.0,	39.6,	"Horde")
	AddVendor(19017,	L["Borto"],				Z.NAGRAND,			53.3,	71.9,	"Alliance")
	AddVendor(19038,	L["Supply Officer Mills"],		Z.TEROKKAR_FOREST,		55.7,	53.1,	"Alliance")
	AddVendor(19042,	L["Leeli Longhaggle"],			Z.TEROKKAR_FOREST,		57.7,	53.4,	"Alliance")
	AddVendor(19065,	L["Inessera"],				Z.SHATTRATH_CITY,		34.5,	20.2,	"Neutral")
	AddVendor(19074,	L["Skreah"],				Z.SHATTRATH_CITY,		46.0,	20.1,	"Neutral")
	AddVendor(19195,	L["Jim Saltit"],			Z.SHATTRATH_CITY,		63.6,	68.6,	"Neutral")
	AddVendor(19213,	L["Eiin"],				Z.SHATTRATH_CITY,		66.2,	68.7,	"Neutral")
	AddVendor(19234,	L["Yurial Soulwater"],			Z.SHATTRATH_CITY,		43.5,	96.9,	"Neutral")
	AddVendor(19296,	L["Innkeeper Biribi"],			Z.TEROKKAR_FOREST,		56.7,	53.3,	"Alliance")
	AddVendor(19321,	L["Quartermaster Endarin"],		Z.SHATTRATH_CITY,		47.9,	26.1,	"Neutral")
	AddVendor(19331,	L["Quartermaster Enuril"],		Z.SHATTRATH_CITY,		60.5,	64.2,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19342,	L["Krek Cragcrush"],			Z.SHADOWMOON_VALLEY,		28.9,	30.8,	"Horde")
	AddVendor(19351,	L["Daggle Ironshaper"],			Z.SHADOWMOON_VALLEY,		36.8,	54.4,	"Alliance")
	AddVendor(19373,	L["Mari Stonehand"],			Z.SHADOWMOON_VALLEY,		36.8,	55.1,	"Alliance")
	AddVendor(19383,	L["Captured Gnome"],			Z.ZANGARMARSH,			32.5,	48.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(19521,	L["Arrond"],				Z.SHADOWMOON_VALLEY,		55.9,	58.2,	"Neutral")
	AddVendor(19536,	L["Dealer Jadyan"],			Z.NETHERSTORM,			44.0,	36.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19537,	L["Dealer Malij"],			Z.NETHERSTORM,			44.2,	34.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19540,	L["Asarnan"],				Z.NETHERSTORM,			44.2,	33.7,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19661,	L["Viggz Shinesparked"],		Z.SHATTRATH_CITY,		64.9,	69.1,	"Neutral")
	AddVendor(19662,	L["Aaron Hollman"],			Z.SHATTRATH_CITY,		63.1,	71.1,	"Neutral")
	AddVendor(19663,	L["Madame Ruby"],			Z.SHATTRATH_CITY,		63.1,	69.3,	"Neutral")
	AddVendor(19694,	L["Loolruna"],				Z.ZANGARMARSH,			68.5,	50.1,	"Alliance")
	AddVendor(19722,	L["Muheru the Weaver"],			Z.ZANGARMARSH,			40.6,	28.2,	"Alliance")
	AddVendor(19836,	L["Mixie Farshot"],			Z.HELLFIRE_PENINSULA,		61.1,	81.5,	"Horde")
	AddVendor(19837,	L["Daga Ramba"],			Z.BLADES_EDGE_MOUNTAINS,	51.1,	57.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(20028,	L["Doba"],				Z.ZANGARMARSH,			42.3,	27.9,	"Alliance")
	AddVendor(20096,	L["Uriku"],				Z.NAGRAND,			56.2,	73.3,	"Alliance")
	AddVendor(20097,	L["Nula the Butcher"],			Z.NAGRAND,			58.0,	35.7,	"Horde")
	AddVendor(20240,	L["Trader Narasu"],			Z.NAGRAND,			54.6,	75.2,	"Alliance")
	AddVendor(20241,	L["Provisioner Nasela"],		Z.NAGRAND,			53.5,	36.9,	"Horde")
	AddVendor(20242,	L["Karaaz"],				Z.NETHERSTORM,			43.6,	34.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(20916,	L["Xerintha Ravenoak"],			Z.BLADES_EDGE_MOUNTAINS,	62.5,	40.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(21113,	L["Sassa Weldwell"],			Z.BLADES_EDGE_MOUNTAINS,	61.3,	68.9,	"Alliance")
	AddVendor(21432,	L["Almaador"],				Z.SHATTRATH_CITY,		51.0,	41.9,	"Neutral")
	AddVendor(21474,	L["Coreiel"],				Z.NAGRAND,			42.8,	42.6,	"Horde")
	AddVendor(21485,	L["Aldraan"],				Z.NAGRAND,			42.9,	42.5,	"Alliance")
	AddVendor(21643,	L["Alurmi"],				Z.TANARIS,			63.0,	57.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(21655,	L["Nakodu"],				Z.SHATTRATH_CITY,		62.1,	69.0,	"Neutral")
	AddVendor(22208,	L["Nasmara Moonsong"],			Z.SHATTRATH_CITY,		66.0,	69.0,	"Neutral")
	AddVendor(22212,	L["Andrion Darkspinner"],		Z.SHATTRATH_CITY,		66.0,	67.8,	"Neutral")
	AddVendor(22213,	L["Gidge Spellweaver"],			Z.SHATTRATH_CITY,		66.0,	67.9,	"Neutral")
	AddVendor(23007,	L["Paulsta'ats"],			Z.NAGRAND,			30.6,	57.0,	"Neutral")
	AddVendor(23010,	L["Wolgren Jinglepocket"],		Z.THUNDER_BLUFF,		54.5,	47.2,	"Alliance")
	AddVendor(23012,	L["Hotoppik Copperpinch"],		Z.SILVERMOON_CITY,		63.5,	79.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(23064,	L["Eebee Jinglepocket"],		Z.SHATTRATH_CITY,		51.0,	31.3,	"Neutral")
	AddVendor(23159,	L["Okuno"],				Z.BLACK_TEMPLE,			0,	0,	"Neutral")
	AddVendor(23437,	L["Indormi"],				Z.HYJAL_SUMMIT,			0,	0,	"Neutral")
	AddVendor(25032,	L["Eldara Dawnrunner"],			Z.ISLE_OF_QUELDANAS,		47.1,	30.0,	"Neutral")
	AddVendor(25950,	L["Shaani"],				Z.ISLE_OF_QUELDANAS,		51.5,	32.6,	"Neutral")
	AddVendor(26081, 	L["High Admiral \"Shelly\" Jorrik"],	Z.DUN_MOROGH, 			17.8,	74.6,	"Neutral")
	AddVendor(26569,	L["Alys Vol'tyr"],			Z.DRAGONBLIGHT,			36.3,	46.5,	"Horde")
	AddVendor(26868,	L["Provisioner Lorkran"],		Z.GRIZZLY_HILLS,		22.6,	66.1,	"Horde")
	AddVendor(27030,	L["Bradley Towns"],			Z.DRAGONBLIGHT,			76.9,	62.2,	"Horde")
	AddVendor(27054,	L["Modoru"],				Z.DRAGONBLIGHT,			28.9,	55.9,	"Alliance")
	AddVendor(27147,	L["Librarian Erickson"],		Z.BOREAN_TUNDRA,		46.7,	32.5,	"Neutral")
	AddVendor(27666,	L["Ontuvo"],				Z.SHATTRATH_CITY,		48.7,	41.3,	"Neutral")
	AddVendor(28701,	L["Timothy Jones"],			Z.DALARAN,			40.5,	35.2,	"Neutral")
	AddVendor(28714,	L["Ildine Sorrowspear"],		Z.DALARAN,			39.1,	41.5,	"Neutral")
	AddVendor(28721,	L["Tiffany Cartier"],			Z.DALARAN,			40.5,	34.4,	"Neutral")
	AddVendor(28722,	L["Bryan Landers"],			Z.DALARAN,			39.1,	26.5,	"Neutral")
	AddVendor(28723,	L["Larana Drome"],			Z.DALARAN,			42.3,	37.5,	"Neutral")
	AddVendor(29510,	L["Linna Bruder"],			Z.DALARAN,			34.6,	34.5,	"Neutral")
	AddVendor(29511,	L["Lalla Brightweave"],			Z.DALARAN,			36.5,	33.5,	"Neutral")
	AddVendor(29512,	L["Ainderu Summerleaf"],		Z.DALARAN,			36.5,	34.0,	"Neutral")
	AddVendor(30431,	L["Veteran Crusader Aliocha Segard"],	Z.ICECROWN,			87.6,	75.6,	"Neutral")
	AddVendor(30489,	L["Morgan Day"],			Z.WINTERGRASP,			49.0,	17.1,	"Alliance")
	AddVendor(30734,	L["Jezebel Bican"],			Z.HELLFIRE_PENINSULA,		53.9,	65.5,	"Alliance")
	AddVendor(30735,	L["Kul Inkspiller"],			Z.HELLFIRE_PENINSULA,		52.5,	36.0,	"Horde")
	AddVendor(31031,	L["Misensi"],				Z.DALARAN,			70.1,	38.5,	"Horde")
	AddVendor(31032,	L["Derek Odds"],			Z.DALARAN,			41.5,	64.8,	"Alliance")
	AddVendor(31910,	L["Geen"],				Z.SHOLAZAR_BASIN,		54.5,	56.2,	"Neutral")
	AddVendor(31911,	L["Tanak"],				Z.SHOLAZAR_BASIN,		55.1,	69.1,	"Neutral")
	AddVendor(31916,	L["Tanaika"],				Z.HOWLING_FJORD,		25.5,	58.7,	"Neutral")
	AddVendor(32287,	L["Archmage Alvareaux"],		Z.DALARAN,			25.5,	47.4,	"Neutral")
	AddVendor(32294,	L["Knight Dameron"],			Z.WINTERGRASP,			51.7,	17.5,	"Alliance")
	AddVendor(32296,	L["Stone Guard Mukar"],			Z.WINTERGRASP,			51.7,	17.5,	"Horde")
	AddVendor(32514,	L["Vanessa Sellers"],			Z.DALARAN,			38.7,	40.8,	"Neutral")
	AddVendor(32515,	L["Braeg Stoutbeard"],			Z.DALARAN,			37.6,	29.5,	"Neutral")
	AddVendor(32533,	L["Cielstrasza"],			Z.DRAGONBLIGHT,			59.9,	53.1,	"Neutral")
	AddVendor(32538,	L["Duchess Mynx"],			Z.ICECROWN,			43.5,	20.6,	"Neutral")
	AddVendor(32540,	L["Lillehoff"],				Z.THE_STORM_PEAKS,		66.2,	61.4,	"Neutral")
	AddVendor(32564,	L["Logistics Officer Silverstone"],	Z.BOREAN_TUNDRA,		57.7,	66.5,	"Alliance")
	AddVendor(32565,	L["Gara Skullcrush"],			Z.BOREAN_TUNDRA,		41.4,	53.6,	"Horde")
	AddVendor(32763,	L["Sairuk"],				Z.DRAGONBLIGHT,			48.5,	75.7,	"Neutral")
	AddVendor(32773,	L["Logistics Officer Brighton"],	Z.HOWLING_FJORD,		59.7,	63.9,	"Alliance")
	AddVendor(32774,	L["Sebastian Crane"],			Z.HOWLING_FJORD,		79.6,	30.7,	"Horde")
	AddVendor(33594,	L["Fizzix Blastbolt"],			Z.ICECROWN,			72.2,	20.9,	"Neutral")
	AddVendor(33595,	L["Mera Mistrunner"],			Z.ICECROWN,			72.4,	20.9,	"Neutral")
	AddVendor(33602,	L["Anuur"],				Z.ICECROWN,			71.4,	20.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(33637,	L["Kirembri Silvermane"],		Z.SHATTRATH_CITY,		58.1,	75.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(33680,	L["Nemiha"],				Z.SHATTRATH_CITY,		36.1,	47.7,	"Neutral")
	AddVendor(34382,	L["Chapman"],				Z.UNDERCITY,			68.1,	11.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(34601,	L["Harlown Darkweave"],			Z.ASHENVALE,			18.2,	60.0,	"Alliance")
	AddVendor(35826,	L["Kaye Toogie"],			Z.DALARAN,			34.0,	35.6,	"Neutral")
	AddVendor(37687,	L["Alchemist Finklestein"],		Z.ICECROWN_CITADEL,		0,	0,	"Neutral")
	AddVendor(38561,	L["Dramm Riverhorn"],			Z.UNGORO_CRATER,		43.46,	41.60,	"Neutral")
	AddVendor(40160,	L["Frozo the Renowned"],		Z.DALARAN,			41.0,	28.5,	"Neutral")
	AddVendor(40226,	L["Pratt McGrubben"],			Z.FERALAS,			45.4,	41.2,	"Alliance")
	AddVendor(40572,	L["Haughty Modiste"],			Z.TANARIS,			50.7,	28.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(40589,	L["Dirge Quikcleave"],			Z.TANARIS,			52.6,	29.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(41435,	L["Fradd Swiftgear"],			Z.WETLANDS,			26.8,	26.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(44030,	L["Draelan"],				Z.TELDRASSIL,			39.0,	30.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(44583,	L["Terrance Denman"],			Z.STORMWIND_CITY, 		63.2,	61.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(45546,	L["Vizna Bangwrench"],			Z.ORGRIMMAR,			36.4,	86.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45549,	L["Zido Helmbreaker"],			Z.ORGRIMMAR,			36.4,	83.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45558,	L["Lizna Goldweaver"],			Z.ORGRIMMAR,			41.3,	79.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45843,	L["Yuka Screwspigot"],			Z.BLACKROCK_DEPTHS,		37.0,	79.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(46359,	L["Punra"],				Z.ORGRIMMAR,			45.0,	76.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(46572,	L["Goram"],				Z.ORGRIMMAR,			48.2,	75.6,	"Horde")
	AddVendor(46602,	L["Shay Pressler"],			Z.STORMWIND_CITY,		64.6,	76.8,	"Alliance") --COMPLETELY UPDATED
	AddVendor(48060,	L["\"Chef\" Overheat"],			Z.BADLANDS,			65.1,	39.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(49701,	L["Bario Matalli"],			Z.STORMWIND_CITY, 		50.4,	71.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(49703,	L["Casandra Downs"],			Z.TWILIGHT_HIGHLANDS,		78.6,	76.2,	"Alliance")
	AddVendor(49737,	L["Shazdar"],				Z.ORGRIMMAR,			56.8,	62.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(49918,	L["Buckslappy"],			Z.BADLANDS,			90.9,	38.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(50129,	L["Daleohm"],				Z.WINTERSPRING,			58.0,	63.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50134,	L["Senthii"],				Z.TWILIGHT_HIGHLANDS,		78.7,	77.0,	"Alliance")
	AddVendor(50146,	L["Agatian Fallanos"],			Z.TWILIGHT_HIGHLANDS,		76.7,	49.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50172,	L["Threm Blackscalp"],			Z.TWILIGHT_HIGHLANDS,		75.2,	50.1,	"Horde")
	AddVendor(50248,	L["Una Kobuna"],			Z.TWILIGHT_HIGHLANDS,		76.6,	49.4,	"Horde")
	AddVendor(50375,	L["Kuldar Steeltooth"],			Z.TWILIGHT_HIGHLANDS,		77.3,	53.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50381,	L["Misty Merriweather"],		Z.TWILIGHT_HIGHLANDS,		78.8,	76.2,	"Alliance")
	AddVendor(50382,	L["Brundall Chiselgut"],		Z.TWILIGHT_HIGHLANDS,		79.1,	76.5,	"Alliance")
	AddVendor(50386,	L["Sal Ferraga"],			Z.TWILIGHT_HIGHLANDS,		78.6,	76.9,	"Alliance")
	AddVendor(50433,	L["Aristaleon Sunweaver"],		Z.TWILIGHT_HIGHLANDS,		75.2,	50.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50480,	L["Isabel Jones"],			Z.STORMWIND_CITY,		63.7,	61.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(50482,	L["Marith Lazuria"],			Z.ORGRIMMAR,			72.5,	34.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(51495,	L["Steeg Haskell"],			Z.IRONFORGE,			36.3,	85.8,	"Alliance") --COMPLETELY UPDATED
	AddVendor(51504,	L["Velia Moonbow"],			Z.DARNASSUS,			64.6,	37.6,	"Alliance") --COMPLETELY UPDATED
	AddVendor(51512,	L["Mirla Silverblaze"],			Z.DALARAN,			52.6,	56.6,	"Neutral") --COMPLETELY UPDATED
	AddVendor(52584,	L["Laida Gembold"],			Z.IRONFORGE,			50.6,	27.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52588,	L["Sara Lanner"],			Z.UNDERCITY,			56.7,	36.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52641,	L["Layna Karner"],			Z.DARNASSUS,			56.8,	52.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52644,	L["Tarien Silverdew"],			Z.DARNASSUS,			54.4,	30.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52655,	L["Palehoof's Big Bag of Parts"],	Z.THUNDER_BLUFF,		36.2,	60.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52658,	L["Paku Cloudchaser"],			Z.THUNDER_BLUFF,		34.7,	53.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(53214,	L["Damek Bloombeard"],			Z.MOUNT_HYJAL,			47.0,	90.2,	"Neutral")
	AddVendor(53881,	L["Ayla Shadowstorm"],			Z.MOUNT_HYJAL,			72.5,	36.2,	"Neutral")
	AddVendor(54232,	L["Mrs. Gant"],				Z.THE_CAPE_OF_STRANGLETHORN,	42.6,	72.8,	"Neutral") -- COMPLETLY UPDATED
	AddVendor(56925,	L["Farrah Facet"],			Z.STORMWIND_CITY,		63.8,	61.6,	"Alliance") -- COMPLETLY UPDATED
	AddVendor(57922,	L["Taryssa Lazuria"],			Z.ORGRIMMAR,			72.4,	34.6,	"Horde") -- COMPLETLY UPDATED
	AddVendor(58414,	L["San Redscale"],			Z.THE_JADE_FOREST,		56.6,	44.4,	"Neutral")
	AddVendor(58706,	L["Gina Mudclaw"],			Z.VALLEY_OF_THE_FOUR_WINDS,	52.4,	51.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(59908,	L["Jaluu the Generous"],		Z.VALE_OF_ETERNAL_BLOSSOMS,	74.2,	42.6,	"Neutral")
	AddVendor(63721,	L["Nat Pagle"],				Z.KRASARANG_WILDS,		68.4, 	43.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(64001,	L["Sage Lotusbloom"],			Z.SHRINE_OF_TWO_MOONS,		62.6,	23.2,	"Horde")
	AddVendor(64032,	L["Sage Whiteheart"],			Z.SHRINE_OF_SEVEN_STARS,	84.6,	63.6,	"Alliance")
	AddVendor(64051,	L["Esha the Loommaiden"],		Z.SHRINE_OF_TWO_MOONS,		29.8,	54.0,	"Horde")
	AddVendor(64052,	L["Raishen the Needle"],		Z.SHRINE_OF_SEVEN_STARS,	67.6,	46.2,	"Alliance")
	AddVendor(64054,	L["Krogo Darkhide"],			Z.SHRINE_OF_TWO_MOONS,		31.2,	47.0,	"Horde")
	AddVendor(64058,	L["Jorunga Stonehoof"],			Z.SHRINE_OF_TWO_MOONS,		29.4,	43.4,	"Horde")
	AddVendor(64084,	L["Jojo"],				Z.SHRINE_OF_SEVEN_STARS,	62.4,	26.6,	"Alliance")
	AddVendor(64085,	L["Cullen Hammerbrow"],			Z.SHRINE_OF_SEVEN_STARS,	74.4,	51.0,	"Alliance")
	AddVendor(64094,	L["Tanner Pang"],			Z.SHRINE_OF_SEVEN_STARS,	76.8, 	49.0,	"Alliance")
	AddVendor(64395,	L["Nam Ironpaw"],			Z.VALLEY_OF_THE_FOUR_WINDS,	53.5,	51.3,	"Neutral")
	AddVendor(64465,	L["Noodles"],				Z.VALLEY_OF_THE_FOUR_WINDS,	52.4,	51.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(64595,	L["Rushi the Fox"],			Z.TOWNLONG_STEPPES,		48.8,	70.6,	"Neutral")
	AddVendor(64599,	L["Ambersmith Zikk"],			Z.DREAD_WASTES,			55.0,	35.6,	"Neutral")

	self.InitVendor = nil
end
