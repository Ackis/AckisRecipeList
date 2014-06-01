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

-----------------------------------------------------------------------
-- Imports.
-----------------------------------------------------------------------
local BN = private.BOSS_NAMES
local Z = private.ZONE_NAMES

function addon:InitVendor()
	local function AddVendor(id_num, name, zone_name, x, y, faction)
		private.AcquireTypes.Vendor:AddEntity(id_num, name, zone_name, x, y, faction)
	end

	AddVendor(66,		L["Tharynn Bouden"],			Z.ELWYNN_FOREST,		41.9,	67.1,	"Alliance") -- Cooking, Tailoring
	AddVendor(777,		L["Amy Davenport"],			Z.REDRIDGE_MOUNTAINS,		29.1,	47.5,	"Alliance")
	AddVendor(843,		L["Gina MacGregor"],			Z.WESTFALL,			57.6,	54.0,	"Alliance")
	AddVendor(989,		L["Banalash"],				Z.SWAMP_OF_SORROWS,		46.6,	56.9,	"Horde") -- Cooking, Enchanting, Jewelcrafting
	AddVendor(1148,		L["Nerrist"],				Z.NORTHERN_STRANGLETHORN,	39.2,	51.0,	"Horde") -- Cooking, Jewelcrafting
	AddVendor(1250,		L["Drake Lindgren"],			Z.ELWYNN_FOREST,		83.3,	66.7,	"Alliance")
	AddVendor(1286,		L["Edna Mullby"],			Z.STORMWIND_CITY,		64.7,	71.2,	"Alliance")
	AddVendor(1304,		L["Darian Singh"],			Z.STORMWIND_CITY,		42.6,	76.8,	"Alliance")
	AddVendor(1313,		L["Maria Lumere"],			Z.STORMWIND_CITY,		55.7,	85.5,	"Alliance") -- Alchemy, Enchanting, Engineering
	AddVendor(1318,		L["Jessara Cordell"],			Z.STORMWIND_CITY,		53.0,	74.2,	"Alliance")
	AddVendor(1347,		L["Alexandra Bolero"],			Z.STORMWIND_CITY,		53.3,	81.7,	"Alliance")
	AddVendor(1448,		L["Neal Allen"],			Z.WETLANDS,			11.8,	52.6,	"Alliance")
	AddVendor(1454,		L["Jennabink Powerseam"],		Z.WETLANDS,			 8.1,	55.9,	"Alliance")
	AddVendor(1474,		L["Rann Flamespinner"],			Z.LOCH_MODAN,			36.0,	46.0,	"Alliance")
	AddVendor(2393,		L["Christoph Jeffcoat"],		Z.HILLSBRAD_FOOTHILLS,		57.5,	47.8,	"Horde") -- Alchemy, Jewelcrafting, Leatherworking, Tailoring
	AddVendor(2394,		L["Mallen Swain"],			Z.HILLSBRAD_FOOTHILLS,		58.1,	47.9,	"Horde")
	AddVendor(2663,		L["Narkk"],				Z.THE_CAPE_OF_STRANGLETHORN,	42.7,	69.2,	"Neutral")
	AddVendor(2668,		L["Danielle Zipstitch"],		Z.DUSKWOOD,			75.8,	45.5,	"Alliance")
	AddVendor(2669,		L["Sheri Zipstitch"],			Z.DUSKWOOD,			75.7,	45.5,	"Alliance")
	AddVendor(2670,		L["Xizk Goodstitch"],			Z.THE_CAPE_OF_STRANGLETHORN,	43.6,	73.0,	"Neutral")
	AddVendor(2672,		L["Cowardly Crosby"],			Z.THE_CAPE_OF_STRANGLETHORN,	40.9,	82.5,	"Neutral")
	AddVendor(2679,		L["Wenna Silkbeard"],			Z.WETLANDS,			25.7,	25.8,	"Alliance")
	AddVendor(2687,		L["Gnaz Blunderflame"],			Z.NORTHERN_STRANGLETHORN,	67.5,	61.5,	"Neutral")
	AddVendor(2688,		L["Ruppo Zipcoil"],			Z.THE_HINTERLANDS,		34.3,	37.9,	"Neutral")
	AddVendor(2697,		L["Clyde Ranthal"],			Z.REDRIDGE_MOUNTAINS,		88.9,	70.9,	"Alliance")
	AddVendor(2698,		L["George Candarte"],			Z.HILLSBRAD_FOOTHILLS,		76.7,	58.5,	"Horde")
	AddVendor(2699,		L["Rikqiz"],				Z.THE_CAPE_OF_STRANGLETHORN,	43.2,	71.7,	"Neutral")
	AddVendor(2810,		L["Hammon Karwn"],			Z.ARATHI_HIGHLANDS,		46.5,	47.3,	"Alliance") -- Cooking, Jewelcrafting, Leatherworking
	AddVendor(2816,		L["Androd Fadran"],			Z.ARATHI_HIGHLANDS,		45.0,	46.9,	"Alliance")
	AddVendor(2819,		L["Tunkk"],				Z.ARATHI_HIGHLANDS,		70.0,	35.4,	"Horde")
	AddVendor(2821,		L["Keena"],				Z.ARATHI_HIGHLANDS,		69.2,	33.6,	"Horde") -- Cooking, Jewelcrafting, Leatherworking
	AddVendor(2838,		L["Crazk Sparks"],			Z.THE_CAPE_OF_STRANGLETHORN,	43.0,	72.8,	"Neutral")
	AddVendor(2846,		L["Blixrez Goodstitch"],		Z.THE_CAPE_OF_STRANGLETHORN,	42.8,	74.1,	"Neutral")
	AddVendor(3005,		L["Mahu"],				Z.THUNDER_BLUFF,		43.8,	45.1,	"Horde")
	AddVendor(3008,		L["Mak"],				Z.THUNDER_BLUFF,		42.0,	43.5,	"Horde")
	AddVendor(3012,		L["Nata Dawnstrider"],			Z.THUNDER_BLUFF,		44.9,	37.7,	"Horde")
	AddVendor(3134,		L["Kzixx"],				Z.DUSKWOOD,			81.9,	19.9,	"Neutral") -- Alchemy, Engineering
	AddVendor(3346,		L["Kithas"],				Z.ORGRIMMAR,			53.3,	48.9,	"Horde")
	AddVendor(3364,		L["Borya"],				Z.ORGRIMMAR,			60.7,	58.6,	"Horde")
	AddVendor(3366,		L["Tamar"],				Z.ORGRIMMAR,			60.3,	54.3,	"Horde")
	AddVendor(3367,		L["Felika"],				Z.ORGRIMMAR,			60.5,	50.7,	"Horde")
	AddVendor(3413,		L["Sovik"],				Z.ORGRIMMAR,			56.8,	56.3,	"Horde")
	AddVendor(3485,		L["Wrahk"],				Z.NORTHERN_BARRENS,		50.0,	61.1,	"Horde")
	AddVendor(3495,		L["Gagsprocket"],			Z.NORTHERN_BARRENS,		68.4,	69.2,	"Neutral")
	AddVendor(3499,		L["Ranik"],				Z.NORTHERN_BARRENS,		67.1,	73.5,	"Neutral") -- Alchemy, Jewelcrafting, Tailoring
	AddVendor(3522,		L["Constance Brisboise"],		Z.TIRISFAL_GLADES,		52.6,	55.7,	"Horde")
	AddVendor(3537,		L["Zixil"],				Z.HILLSBRAD_FOOTHILLS,		49.8,	60.8,	"Neutral")
	AddVendor(3556,		L["Andrew Hilbert"],			Z.SILVERPINE_FOREST,		43.2,	40.7,	"Horde") -- Cooking, Leatherworking, Tailoring
	AddVendor(3954,		L["Dalria"],				Z.ASHENVALE,			35.1,	52.1,	"Alliance")
	AddVendor(3958,		L["Lardan"],				Z.ASHENVALE,			34.8,	49.8,	"Alliance")
	AddVendor(4168,		L["Elynna"],				Z.DARNASSUS,			60.6,	36.9,	"Alliance")
	AddVendor(4225,		L["Saenorion"],				Z.DARNASSUS,			60.0,	37.3,	"Alliance")
	AddVendor(4228,		L["Vaean"],				Z.DARNASSUS,			56.4,	32.2,	"Alliance")
	AddVendor(4229,		L["Mythrin'dir"],			Z.DARNASSUS,			58.1,	34.2,	"Alliance")
	AddVendor(4561,		L["Daniel Bartlett"],			Z.UNDERCITY,			64.1,	37.4,	"Horde")
	AddVendor(4577,		L["Millie Gregorian"],			Z.UNDERCITY,			70.6,	30.1,	"Horde")
	AddVendor(4589,		L["Joseph Moore"],			Z.UNDERCITY,			70.0,	58.5,	"Horde")
	AddVendor(4617,		L["Thaddeus Webb"],			Z.UNDERCITY,			62.4,	61.0,	"Horde")
	AddVendor(4775,		L["Felicia Doan"],			Z.UNDERCITY,			64.1,	50.6,	"Horde")
	AddVendor(4897,		L["Helenia Olden"],			Z.DUSTWALLOW_MARSH,		66.4,	51.5,	"Alliance") -- Cooking, Jewelcrafting, Leatherworking
	AddVendor(5128,		L["Bombus Finespindle"],		Z.IRONFORGE,			39.6,	34.5,	"Alliance")
	AddVendor(5154,		L["Poranna Snowbraid"],			Z.IRONFORGE,			43.0,	28.3,	"Alliance")
	AddVendor(5158,		L["Tilli Thistlefuzz"],			Z.IRONFORGE,			61.0,	44.0,	"Alliance")
	AddVendor(5163,		L["Burbik Gearspanner"],		Z.IRONFORGE,			46.5,	27.1,	"Alliance")
	AddVendor(5175,		L["Gearcutter Cogspinner"],		Z.IRONFORGE,			68.0,	43.1,	"Alliance")
	AddVendor(5565,		L["Jillian Tanner"],			Z.STORMWIND_CITY,		71.6,	62.8,	"Alliance")
	AddVendor(5757,		L["Lilly"],				Z.SILVERPINE_FOREST,		43.1,	50.8,	"Horde")
	AddVendor(5758,		L["Leo Sarn"],				Z.SILVERPINE_FOREST,		53.9,	82.3,	"Horde")
	AddVendor(6568,		L["Vizzklick"],				Z.TANARIS,			50.7,	28.7,	"Neutral")
	AddVendor(6567,		L["Ghok'kah"],				Z.DUSTWALLOW_MARSH,		35.2,	30.8,	"Horde")
	AddVendor(6574,		L["Jun'ha"],				Z.ARATHI_HIGHLANDS,		72.7,	36.5,	"Horde")
	AddVendor(6730,		L["Jinky Twizzlefixxit"],		Z.THOUSAND_NEEDLES,		77.7,	77.8,	"Alliance")
	AddVendor(6777,		L["Zan Shivsproket"],			Z.HILLSBRAD_FOOTHILLS,		71.5,	45.5,	"Neutral")
	AddVendor(7854,		L["Jangdor Swiftstrider"],		Z.FERALAS,			52.8,	47.1,	"Horde")
	AddVendor(7940,		L["Darnall"],				Z.MOONGLADE,			51.6,	33.3,	"Neutral")
	AddVendor(8131,		L["Blizrik Buckshot"],			Z.TANARIS,			50.7,	28.5,	"Neutral")
	AddVendor(8160,		L["Nioma"],				Z.THE_HINTERLANDS,		13.4,	43.3,	"Alliance")
	AddVendor(8363,		L["Shadi Mistrunner"],			Z.THUNDER_BLUFF,		40.6,	64.0,	"Horde")
	AddVendor(8679,		L["Knaz Blunderflame"],			Z.NORTHERN_STRANGLETHORN,	67.7,	61.1,	"Neutral")
	AddVendor(8681,		L["Outfitter Eric"],			Z.IRONFORGE,			43.2,	29.2,	"Alliance")
	AddVendor(9499,		BN.PLUGGER_SPAZZRING,			Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral") -- Alchemy, Leatherworking
	AddVendor(9636,		L["Kireena"],				Z.DESOLACE,			51.0,	53.5,	"Horde") -- Cooking, Jewelcrafting, Tailoring
	AddVendor(10856,	L["Argent Quartermaster Hasana"],	Z.TIRISFAL_GLADES,		83.2,	68.1,	"Neutral") -- Alchemy, Blacksmithing, Enchanting, FirstAid, Leatherworking, Tailoring
	AddVendor(10857,	L["Argent Quartermaster Lightspark"],	Z.WESTERN_PLAGUELANDS,		42.8,	83.8,	"Neutral") -- Alchemy, Blacksmithing, Enchanting, FirstAid, Leatherworking, Tailoring
	AddVendor(11185,	L["Xizzer Fizzbolt"],			Z.WINTERSPRING,			59.2,	50.9,	"Neutral")
	AddVendor(11189,	L["Qia"],				Z.WINTERSPRING,			59.6,	49.2,	"Neutral")
	AddVendor(11278,	L["Magnus Frostwake"],			Z.WESTERN_PLAGUELANDS,		68.1,	77.6,	"Neutral") -- Alchemy, Blacksmithing
	AddVendor(11536,	L["Quartermaster Miranda Breechlock"],	Z.EASTERN_PLAGUELANDS,		75.8,	54.1,	"Neutral") -- Alchemy, Blacksmithing, Enchanting, FirstAid, Leatherworking, Tailoring
	AddVendor(11557,	L["Meilosh"],				Z.FELWOOD,			65.7,	2.9, 	"Neutral") -- Alchemy, Blacksmithing, Enchanting, Leatherworking, Tailoring
	AddVendor(12022,	L["Lorelae Wintersong"],		Z.MOONGLADE,			48.3,	40.1,	"Neutral")
	AddVendor(12043,	L["Kulwia"],				Z.STONETALON_MOUNTAINS,		48.6,	61.6,	"Horde")
--	AddVendor(12245,	L["Vendor-Tron 1000"],			Z.DESOLACE,			60.3,	38.1,	"Neutral")
--	AddVendor(12246,	L["Super-Seller 680"],			Z.DESOLACE,			40.5,	79.3,	"Neutral")
	AddVendor(12941,	L["Jase Farlane"],			Z.EASTERN_PLAGUELANDS,		74.8,	51.8,	"Neutral")
	AddVendor(12942,	L["Leonard Porter"],			Z.WESTERN_PLAGUELANDS,		43.0,	84.3,	"Alliance")
	AddVendor(12943,	L["Werg Thickblade"],			Z.TIRISFAL_GLADES,		83.2,	69.7,	"Horde")
	AddVendor(12944,	L["Lokhtos Darkbargainer"],		Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral") -- Alchemy, Blacksmithing, Enchanting, Leatherworking, Tailoring
	AddVendor(12956,	L["Zannok Hidepiercer"],		Z.SILITHUS,			81.9,	17.8,	"Neutral")
	AddVendor(12958,	L["Gigget Zipcoil"],			Z.THE_HINTERLANDS,		34.5,	38.5,	"Neutral")
	AddVendor(12959,	L["Nergal"],				Z.UNGORO_CRATER,		54.8,	62.5,	"Neutral")
	AddVendor(13420,	L["Penney Copperpinch"],		Z.ORGRIMMAR,			53.5,	66.1,	"Neutral") -- Cooking, Leatherworking, Tailoring
	AddVendor(13433,	L["Wulmort Jinglepocket"],		Z.IRONFORGE,			33.0,	67.6,	"Neutral") -- Cooking, Leatherworking, Tailoring
	AddVendor(14371,	L["Shen'dralar Provisioner"],		Z.DIRE_MAUL,			0,	0,	"Neutral")
	AddVendor(14637,	L["Zorbin Fandazzle"],			Z.FERALAS,			48.7,	44.8,	"Neutral")
	AddVendor(15179,	L["Mishta"],				Z.SILITHUS,			53.8,	34.4,	"Neutral")
	AddVendor(15293,	L["Aendel Windspear"],			Z.SILITHUS,			64.6,	45.8,	"Neutral")
	AddVendor(15419,	L["Kania"],				Z.SILITHUS,			55.6,	37.2,	"Neutral")
	AddVendor(15909,	L["Fariel Starsong"],			Z.MOONGLADE,			54.0,	35.4,	"Neutral")
	AddVendor(16224,	L["Rathis Tomber"],			Z.GHOSTLANDS,			47.2,	28.7,	"Horde")
	AddVendor(16624,	L["Gelanthis"],				Z.SILVERMOON_CITY,		90.9,	73.3,	"Horde")
	AddVendor(16635,	L["Lyna"],				Z.SILVERMOON_CITY,		70.3,	24.9,	"Horde")
	AddVendor(16638,	L["Deynna"],				Z.SILVERMOON_CITY,		55.6,	51.0,	"Horde")
	AddVendor(16657,	L["Feera"],				Z.THUNDER_BLUFF,		54.0,	90.5,	"Alliance")
	AddVendor(16689,	L["Zaralda"],				Z.SILVERMOON_CITY,		84.8,	78.6,	"Horde")
	AddVendor(16722,	L["Egomis"],				Z.THE_EXODAR,			39.9,	40.2,	"Alliance")
	AddVendor(16748,	L["Haferet"],				Z.THE_EXODAR,			66.6,	73.7,	"Alliance")
	AddVendor(16767,	L["Neii"],				Z.THE_EXODAR,			64.5,	68.5,	"Alliance")
	AddVendor(16782,	L["Yatheon"],				Z.SILVERMOON_CITY,		75.6,	40.7,	"Horde")
	AddVendor(17512,	L["Arred"],				Z.THE_EXODAR,			45.9,	24.9,	"Alliance")
	AddVendor(17518,	L["Ythyar"],				Z.KARAZHAN,			0,	0,	"Neutral")
	AddVendor(17585,	L["Quartermaster Urgronn"],		Z.HELLFIRE_PENINSULA,		54.9,	37.9,	"Horde") -- Alchemy, Blacksmithing, Enchanting, Jewelcrafting, Leatherworking
	AddVendor(17657,	L["Logistics Officer Ulrike"],		Z.HELLFIRE_PENINSULA,		56.7,	62.6,	"Alliance") -- Alchemy, Blacksmithing, Enchanting, Jewelcrafting, Leatherworking
	AddVendor(17904,	L["Fedryen Swiftspear"],		Z.ZANGARMARSH,			79.3,	63.8,	"Neutral") -- Alchemy, Blacksmithing, Enchanting, Engineering, Jewelcrafting, Leatherworking
	AddVendor(18011,	L["Zurai"],				Z.ZANGARMARSH,			85.3,	54.8,	"Horde") -- Cooking, Tailoring
	AddVendor(18255,	L["Apprentice Darius"],			Z.DEADWIND_PASS,		47.0,	75.3,	"Neutral")
	AddVendor(18382,	L["Mycah"],				Z.ZANGARMARSH,			17.9,	51.2,	"Neutral") -- Alchemy, Cooking, Tailoring
	AddVendor(18484,	L["Wind Trader Lathrai"],		Z.SHATTRATH_CITY,		72.3,	31.0,	"Neutral")
	AddVendor(18664,	L["Aged Dalaran Wizard"],		Z.OLD_HILLSBRAD_FOOTHILLS,	0,	0,	"Neutral")
	AddVendor(18672,	L["Thomas Yance"],			Z.OLD_HILLSBRAD_FOOTHILLS,	0,	0,	"Neutral")
	AddVendor(18753,	L["Felannia"],				Z.HELLFIRE_PENINSULA,		52.3,	36.1,	"Horde")
	AddVendor(18773,	L["Johan Barnes"],			Z.HELLFIRE_PENINSULA,		53.7,	66.1,	"Alliance")
	AddVendor(18775,	L["Lebowski"],				Z.HELLFIRE_PENINSULA,		55.7,	65.5,	"Alliance")
	AddVendor(18821,	L["Quartermaster Jaffrey Noreliqe"],	Z.NAGRAND,			41.2,	44.3,	"Horde") -- Alchemy, Jewelcrafting
	AddVendor(18822,	L["Quartermaster Davian Vaclav"],	Z.NAGRAND,			41.2,	44.3,	"Alliance") -- Alchemy, Jewelcrafting
	AddVendor(18951,	L["Erilia"],				Z.EVERSONG_WOODS,		55.5,	54.0,	"Horde")
	AddVendor(19015,	L["Mathar G'ochar"],			Z.NAGRAND,			57.0,	39.6,	"Horde")
	AddVendor(19017,	L["Borto"],				Z.NAGRAND,			53.3,	71.9,	"Alliance")
	AddVendor(19065,	L["Inessera"],				Z.SHATTRATH_CITY,		34.5,	20.2,	"Neutral")
	AddVendor(19213,	L["Eiin"],				Z.SHATTRATH_CITY,		66.2,	68.7,	"Neutral")
	AddVendor(19234,	L["Yurial Soulwater"],			Z.SHATTRATH_CITY,		43.5,	96.9,	"Neutral")
	AddVendor(19321,	L["Quartermaster Endarin"],		Z.SHATTRATH_CITY,		47.9,	26.1,	"Neutral")
	AddVendor(19331,	L["Quartermaster Enuril"],		Z.SHATTRATH_CITY,		60.5,	64.2,	"Neutral") -- Alchemy, Blacksmithing, Jewelcrafting, Leatherworking, Tailoring
	AddVendor(19351,	L["Daggle Ironshaper"],			Z.SHADOWMOON_VALLEY,		36.8,	54.4,	"Alliance")
	AddVendor(19383,	L["Captured Gnome"],			Z.ZANGARMARSH,			32.5,	48.1,	"Horde")
	AddVendor(19521,	L["Arrond"],				Z.SHADOWMOON_VALLEY,		55.9,	58.2,	"Neutral")
	AddVendor(19536,	L["Dealer Jadyan"],			Z.NETHERSTORM,			44.0,	36.6,	"Neutral")
	AddVendor(19537,	L["Dealer Malij"],			Z.NETHERSTORM,			44.2,	34.0,	"Neutral")
	AddVendor(19540,	L["Asarnan"],				Z.NETHERSTORM,			44.2,	33.7,	"Neutral")
	AddVendor(19661,	L["Viggz Shinesparked"],		Z.SHATTRATH_CITY,		64.9,	69.1,	"Neutral")
	AddVendor(19663,	L["Madame Ruby"],			Z.SHATTRATH_CITY,		63.1,	69.3,	"Neutral")
	AddVendor(19722,	L["Muheru the Weaver"],			Z.ZANGARMARSH,			40.6,	28.2,	"Alliance")
	AddVendor(19836,	L["Mixie Farshot"],			Z.HELLFIRE_PENINSULA,		61.1,	81.5,	"Horde")
	AddVendor(20240,	L["Trader Narasu"],			Z.NAGRAND,			54.6,	75.2,	"Alliance") -- Alchemy, Leatherworking
	AddVendor(20241,	L["Provisioner Nasela"],		Z.NAGRAND,			53.5,	36.9,	"Horde") -- Alchemy, Leatherworking
	AddVendor(20242,	L["Karaaz"],				Z.NETHERSTORM,			43.6,	34.3,	"Neutral")
	AddVendor(21432,	L["Almaador"],				Z.SHATTRATH_CITY,		51.0,	41.9,	"Neutral") -- Alchemy, Enchanting, Jewelcrafting, Leatherworking
	AddVendor(21474,	L["Coreiel"],				Z.NAGRAND,			42.8,	42.6,	"Horde")
	AddVendor(21485,	L["Aldraan"],				Z.NAGRAND,			42.9,	42.5,	"Alliance")
	AddVendor(21643,	L["Alurmi"],				Z.TANARIS,			63.0,	57.3,	"Neutral") -- Alchemy, Enchanting, Jewelcrafting, Leatherworking
	AddVendor(21655,	L["Nakodu"],				Z.SHATTRATH_CITY,		62.1,	69.0,	"Neutral") -- Alchemy, Enchanting, Jewelcrafting, Tailoring
	AddVendor(22208,	L["Nasmara Moonsong"],			Z.SHATTRATH_CITY,		66.0,	69.0,	"Neutral")
	AddVendor(22212,	L["Andrion Darkspinner"],		Z.SHATTRATH_CITY,		66.0,	67.8,	"Neutral")
	AddVendor(22213,	L["Gidge Spellweaver"],			Z.SHATTRATH_CITY,		66.0,	67.9,	"Neutral")
	AddVendor(23007,	L["Paulsta'ats"],			Z.NAGRAND,			30.6,	57.0,	"Neutral")
	AddVendor(23159,	L["Okuno"],				Z.BLACK_TEMPLE,			0,	0,	"Neutral") -- Blacksmithing, Leatherworking, Tailoring
	AddVendor(23437,	L["Indormi"],				Z.HYJAL_SUMMIT,			0,	0,	"Neutral")
	AddVendor(25032,	L["Eldara Dawnrunner"],			Z.ISLE_OF_QUELDANAS,		47.1,	30.0,	"Neutral") -- Alchemy, Enchanting, Jewelcrafting
	AddVendor(25950,	L["Shaani"],				Z.ISLE_OF_QUELDANAS,		51.5,	32.6,	"Neutral")
	AddVendor(26569,	L["Alys Vol'tyr"],			Z.DRAGONBLIGHT,			36.3,	46.5,	"Horde")
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
	AddVendor(32564,	L["Logistics Officer Silverstone"],	Z.BOREAN_TUNDRA,		57.7,	66.5,	"Alliance") -- Blacksmithing, Engineering
	AddVendor(32565,	L["Gara Skullcrush"],			Z.BOREAN_TUNDRA,		41.4,	53.6,	"Horde") -- Blacksmithing, Engineering
	AddVendor(32763,	L["Sairuk"],				Z.DRAGONBLIGHT,			48.5,	75.7,	"Neutral")
	AddVendor(32773,	L["Logistics Officer Brighton"],	Z.HOWLING_FJORD,		59.7,	63.9,	"Alliance") -- Blacksmithing, Engineering
	AddVendor(32774,	L["Sebastian Crane"],			Z.HOWLING_FJORD,		79.6,	30.7,	"Horde") -- Blacksmithing, Engineering
	AddVendor(33594,	L["Fizzix Blastbolt"],			Z.ICECROWN,			72.2,	20.9,	"Neutral")
	AddVendor(33602,	L["Anuur"],				Z.ICECROWN,			71.4,	20.8,	"Neutral")
	AddVendor(33637,	L["Kirembri Silvermane"],		Z.SHATTRATH_CITY,		58.1,	75.0,	"Neutral")
	AddVendor(33680,	L["Nemiha"],				Z.SHATTRATH_CITY,		36.1,	47.7,	"Neutral")
	AddVendor(34601,	L["Harlown Darkweave"],			Z.ASHENVALE,			18.2,	60.0,	"Alliance")
	AddVendor(35826,	L["Kaye Toogie"],			Z.DALARAN,			34.0,	35.6,	"Neutral")
	AddVendor(37687,	L["Alchemist Finklestein"],		Z.ICECROWN_CITADEL,		0,	0,	"Neutral") -- Blacksmithing, Leatherworking, Tailoring
	AddVendor(40160,	L["Frozo the Renowned"],		Z.DALARAN,			41.0,	28.5,	"Neutral")
	AddVendor(40226,	L["Pratt McGrubben"],			Z.FERALAS,			45.4,	41.2,	"Alliance")
	AddVendor(40572,	L["Haughty Modiste"],			Z.TANARIS,			50.7,	28.6,	"Neutral")
	AddVendor(41435,	L["Fradd Swiftgear"],			Z.WETLANDS,			26.8,	26.0,	"Alliance")
	AddVendor(44030,	L["Draelan"],				Z.TELDRASSIL,			39.0,	30.0,	"Alliance")
	AddVendor(44583,	L["Terrance Denman"],			Z.STORMWIND_CITY, 		63.2,	61.7,	"Alliance")
	AddVendor(45546,	L["Vizna Bangwrench"],			Z.ORGRIMMAR,			36.4,	86.4,	"Horde")
	AddVendor(45558,	L["Lizna Goldweaver"],			Z.ORGRIMMAR,			41.3,	79.2,	"Horde")
	AddVendor(45843,	L["Yuka Screwspigot"],			Z.BLACKROCK_DEPTHS,		37.0,	79.0,	"Neutral")
	AddVendor(46572,	L["Goram"],				Z.ORGRIMMAR,			48.2,	75.6,	"Horde") -- Alchemy, Cooking
	AddVendor(46602,	L["Shay Pressler"],			Z.STORMWIND_CITY,		64.6,	76.8,	"Alliance") -- Alchemy, Cooking
	AddVendor(49703,	L["Casandra Downs"],			Z.TWILIGHT_HIGHLANDS,		78.6,	76.2,	"Alliance")
	AddVendor(49918,	L["Buckslappy"],			Z.BADLANDS,			90.9,	38.8,	"Neutral")
	AddVendor(50134,	L["Senthii"],				Z.TWILIGHT_HIGHLANDS,		78.7,	77.0,	"Alliance")
	AddVendor(50146,	L["Agatian Fallanos"],			Z.TWILIGHT_HIGHLANDS,		76.7,	49.5,	"Horde")
	AddVendor(50172,	L["Threm Blackscalp"],			Z.TWILIGHT_HIGHLANDS,		75.2,	50.1,	"Horde")
	AddVendor(50248,	L["Una Kobuna"],			Z.TWILIGHT_HIGHLANDS,		76.6,	49.4,	"Horde")
	AddVendor(50381,	L["Misty Merriweather"],		Z.TWILIGHT_HIGHLANDS,		78.8,	76.2,	"Alliance")
	AddVendor(50386,	L["Sal Ferraga"],			Z.TWILIGHT_HIGHLANDS,		78.6,	76.9,	"Alliance")
	AddVendor(50433,	L["Aristaleon Sunweaver"],		Z.TWILIGHT_HIGHLANDS,		75.2,	50.1,	"Horde")
	AddVendor(50480,	L["Isabel Jones"],			Z.STORMWIND_CITY,		63.7,	61.3,	"Alliance")
	AddVendor(50482,	L["Marith Lazuria"],			Z.ORGRIMMAR,			72.5,	34.4,	"Horde")
	AddVendor(51495,	L["Steeg Haskell"],			Z.IRONFORGE,			36.3,	85.8,	"Alliance") -- Alchemy, Cooking
	AddVendor(51512,	L["Mirla Silverblaze"],			Z.DALARAN,			52.6,	56.6,	"Neutral") -- Alchemy, Cooking
	AddVendor(52584,	L["Laida Gembold"],			Z.IRONFORGE,			50.6,	27.5,	"Alliance")
	AddVendor(52588,	L["Sara Lanner"],			Z.UNDERCITY,			56.7,	36.9,	"Horde")
	AddVendor(52644,	L["Tarien Silverdew"],			Z.DARNASSUS,			54.4,	30.7,	"Alliance")
	AddVendor(52655,	L["Palehoof's Big Bag of Parts"],	Z.THUNDER_BLUFF,		36.2,	60.2,	"Horde")
	AddVendor(52658,	L["Paku Cloudchaser"],			Z.THUNDER_BLUFF,		34.7,	53.5,	"Horde")
	AddVendor(53214,	L["Damek Bloombeard"],			Z.MOLTEN_FRONT,			47.0,	90.6,	"Neutral") -- Blacksmithing, Engineering
	AddVendor(53410,	L["Lissah Spellwick"],			Z.DUSTWALLOW_MARSH,		66.0,	49.7,	"Alliance")
	AddVendor(53881,	L["Ayla Shadowstorm"],			Z.MOLTEN_FRONT,			44.8,	86.6,	"Neutral")
	AddVendor(56925,	L["Farrah Facet"],			Z.STORMWIND_CITY,		63.8,	61.6,	"Alliance")
	AddVendor(57922,	L["Taryssa Lazuria"],			Z.ORGRIMMAR,			72.4,	34.6,	"Horde")
	AddVendor(58414,	L["San Redscale"],			Z.THE_JADE_FOREST,		56.6,	44.4,	"Neutral")
	AddVendor(59908,	L["Jaluu the Generous"],		Z.VALE_OF_ETERNAL_BLOSSOMS,	74.2,	42.6,	"Neutral")
	AddVendor(64001,	L["Sage Lotusbloom"],			Z.SHRINE_OF_TWO_MOONS,		62.6,	23.2,	"Horde")
	AddVendor(64032,	L["Sage Whiteheart"],			Z.SHRINE_OF_SEVEN_STARS,	84.6,	63.6,	"Alliance")
	AddVendor(64051,	L["Esha the Loommaiden"],		Z.SHRINE_OF_TWO_MOONS,		29.8,	54.0,	"Horde")
	AddVendor(64052,	L["Raishen the Needle"],		Z.SHRINE_OF_SEVEN_STARS,	67.6,	46.2,	"Alliance")
	AddVendor(64054,	L["Krogo Darkhide"],			Z.SHRINE_OF_TWO_MOONS,		31.2,	47.0,	"Horde")
	AddVendor(64094,	L["Tanner Pang"],			Z.SHRINE_OF_SEVEN_STARS,	76.8, 	49.0,	"Alliance")
	AddVendor(64595,	L["Rushi the Fox"],			Z.TOWNLONG_STEPPES,		48.8,	70.6,	"Neutral")
	AddVendor(67976,	L["Tinkmaster Overspark"],		Z.KRASARANG_WILDS,		16.5,	79.3,	"Alliance")
	AddVendor(73293,	L["Whizzig"],				Z.TIMELESS_ISLE,		42.8,	59.2,	"Neutral")

	self.InitVendor = nil
end
