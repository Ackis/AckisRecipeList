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
local BB	= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

private.vendor_list = {}

function addon:InitVendor()
	local function AddVendor(id_num, name, zone, x, y, faction)
		private:AddListEntry(private.vendor_list, id_num, name, GetMapNameByID(zone), x, y, faction)
	end

	AddVendor(66,		L["Tharynn Bouden"],		30,		41.9,	67.1,	"Alliance")
	AddVendor(340,		L["Kendor Kabonka"],		301,	76.6,	52.8,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(734,		L["Corporal Bluth"],		37,		47.5,	10.3,	"Alliance") -- UPDATED
	AddVendor(777,		L["Amy Davenport"],			36,		29.1,	47.5,	"Alliance")
	AddVendor(843,		L["Gina MacGregor"],		39,		57.6,	54.0,	"Alliance")
	AddVendor(989,		L["Banalash"],				38,		46.6,	56.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(1146,		L["Vharr"],					37,		38.7,	49.2,	"Horde")   -- UPDATED
	AddVendor(1148,		L["Nerrist"],				37,		39.2,	51.0,	"Horde")  -- UPDATED
	AddVendor(1149,		L["Uthok"],					37,		37.5,	49.2,	"Horde")   -- UPDATED
	AddVendor(1250,		L["Drake Lindgren"],		30,		83.3,	66.7,	"Alliance")
	AddVendor(1286,		L["Edna Mullby"],			301,	64.7,	71.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1313,		L["Maria Lumere"],			301,	55.7,	85.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1318,		L["Jessara Cordell"],		301,	53.0,	74.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1347,		L["Alexandra Bolero"],		301,	53.3,	81.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(1448,		L["Neal Allen"],			40,		11.8,	52.6,	"Alliance")
	AddVendor(1454,		L["Jennabink Powerseam"],	40,		 8.1,	55.9,	"Alliance")
	AddVendor(1465,		L["Drac Roughcut"],			35,		35.6,	49.0,	"Alliance")
	AddVendor(1471,		L["Jannos Ironwill"],		16,		40.8,	48.0,	"Alliance")
	AddVendor(1474,		L["Rann Flamespinner"],		35,		36.0,	46.0,	"Alliance")
	AddVendor(1684,		L["Khara Deepwater"],		35,		39.5,	39.3,	"Alliance")
	AddVendor(1685,		L["Xandar Goodbeard"],		35,		82.5,	63.5,	"Alliance")
	AddVendor(2118,		L["Abigail Shiel"],			20,		61.0,	51.0,	"Horde") -- UPDATED
	AddVendor(2393,		L["Christoph Jeffcoat"],	24,		57.5,	47.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2394,		L["Mallen Swain"],			24,		58.1,	47.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2397,		L["Derak Nightfall"],		24,		57.7,	45.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2480,		L["Bro'kin"],				24,		44.0,	21.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(2482,		L["Zarena Cromwind"],		673,	43.0,	70.7,	"Neutral")  -- UPDATED
	AddVendor(2483,		L["Jaquilina Dramet"],		37,		43.7,	23.1,	"Neutral") -- UPDATED
	AddVendor(2663,		L["Narkk"],					673,	42.7,	69.2,	"Neutral")   -- UPDATED
	AddVendor(2664,		L["Kelsey Yance"],			673,	42.8,	69.1,	"Neutral")   -- UPDATED
	AddVendor(2668,		L["Danielle Zipstitch"],	34,		75.8,	45.5,	"Alliance")
	AddVendor(2669,		L["Sheri Zipstitch"],		34,		75.7,	45.5,	"Alliance")
	AddVendor(2670,		L["Xizk Goodstitch"],		673,	43.6,	73.0,	"Neutral")  -- UPDATED
	AddVendor(2672,		L["Cowardly Crosby"],		673,	40.9,	82.5,	"Neutral")   -- UPDATED
	AddVendor(2679,		L["Wenna Silkbeard"],		40,		25.7,	25.8,	"Alliance")
	AddVendor(2685,		L["Mazk Snipeshot"],		673,	43.2, 	69.2,	"Neutral")  -- UPDATED
	AddVendor(2687,		L["Gnaz Blunderflame"],		37,		67.5,	61.5,	"Neutral")  -- UPDATED
	AddVendor(2688,		L["Ruppo Zipcoil"],			26,		34.3,	37.9,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(2697,		L["Clyde Ranthal"],			36,		88.9,	70.9,	"Alliance")
	AddVendor(2698,		L["George Candarte"],		24,		76.7,	58.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(2699,		L["Rikqiz"],				673,	43.2,	71.7,	"Neutral")   -- UPDATED
	AddVendor(2803,		L["Malygen"],				182,	62.3,	25.6,	"Alliance")
	AddVendor(2810,		L["Hammon Karwn"],			16,		46.5,	47.3,	"Alliance")
	AddVendor(2812,		L["Drovnar Strongbrew"],	16,		46.4,	47.1,	"Alliance")
	AddVendor(2814,		L["Narj Deepslice"],		16,		45.6,	47.6,	"Alliance")
	AddVendor(2816,		L["Androd Fadran"],			16,		45.0,	46.9,	"Alliance")
	AddVendor(2819,		L["Tunkk"],					16,		70.0,	35.4,	"Horde")
	AddVendor(2821,		L["Keena"],					16,		69.2,	33.6,	"Horde")
	AddVendor(2838,		L["Crazk Sparks"],			673,	43.0,	72.8,	"Neutral")   -- UPDATED
	AddVendor(2843,		L["Jutak"],					673,	41.6,	74.1,	"Neutral")   -- UPDATED
	AddVendor(2846,		L["Blixrez Goodstitch"],	673,	42.8,	74.1,	"Neutral")   -- UPDATED
	AddVendor(2848,		L["Glyx Brewright"],		673,	42.6,	74.9,	"Neutral")   -- UPDATED
	AddVendor(2999,		L["Taur Stonehoof"],		362,	39.8,	55.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3005,		L["Mahu"],					362,	43.8,	45.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3008,		L["Mak"],					362,	42.0,	43.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3012,		L["Nata Dawnstrider"],		362,	44.9,	37.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3027,		L["Naal Mistrunner"],		362,	51.0,	52.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3029,		L["Sewa Mistrunner"],		362,	55.8,	47.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3081,		L["Wunna Darkmane"],		9,		46.1,	58.2,	"Horde")
	AddVendor(3085,		L["Gloria Femmel"],			36,		26.7,	43.5,	"Alliance")
	AddVendor(3134,		L["Kzixx"],					34,		81.9,	19.9,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(3178,		L["Stuart Fleming"],		40,		8.1,	58.4,	"Alliance")
	AddVendor(3333,		L["Shankys"],				321,	66.74,	41.86,	"Horde") -- UPDATED
	AddVendor(3335,		L["Hagrus"],				321,	46.0,	45.9,	"Horde")
	AddVendor(3346,		L["Kithas"],				321,	53.3,	48.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3348,		L["Kor'geld"],				321,	55.23,	45.83,	"Horde") -- UPDATED
	AddVendor(3356,		L["Sumi"],					321,	75.8,	35.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3364,		L["Borya"],					321,	60.7,	58.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3366,		L["Tamar"],					321,	60.3,	54.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3367,		L["Felika"],				321,	60.5,	50.7,	"Horde")
	AddVendor(3400,		L["Xen'to"],				321,	32.6,	68.6,	"Horde") -- UPDATED
	AddVendor(3413,		L["Sovik"],					321,	56.8,	56.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3482,		L["Tari'qa"],				11,		49.0,	58.2,	"Horde")   -- UPDATED
	AddVendor(3485,		L["Wrahk"],					11,		50.0,	61.1,	"Horde")   -- UPDATED
	AddVendor(3489,		L["Zargh"],					11,		50.6,	57.8,	"Horde")   -- UPDATED
	AddVendor(3490,		L["Hula'mahi"],				11,		48.6,	58.4,	"Horde")   -- UPDATED
	AddVendor(3495,		L["Gagsprocket"],			11,		68.4,	69.2,	"Neutral")   -- UPDATED
	AddVendor(3497,		L["Kilxx"],					11,		68.6,	72.5,	"Neutral")   -- UPDATED
	AddVendor(3499,		L["Ranik"],					11,		67.1,	73.5,	"Neutral")   -- UPDATED
	AddVendor(3522,		L["Constance Brisboise"],	20,		52.6,	55.7,	"Horde")
	AddVendor(3537,		L["Zixil"],					24,		49.8,	60.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(3550,		L["Martine Tramblay"],		20,		65.8,	59.6,	"Horde") -- UPDATED
	AddVendor(3556,		L["Andrew Hilbert"],		21,		43.2,	40.7,	"Horde")
	AddVendor(3881,		L["Grimtak"],				4,			50.7,	42.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(3954,		L["Dalria"],				43,			35.1,	52.1,	"Alliance")
	AddVendor(3958,		L["Lardan"],				43,			34.8,	49.8,	"Alliance")
	AddVendor(4083,		L["Jeeda"],					81,		50.5,	63.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4168,		L["Elynna"],				381,			60.6,	36.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4223,		L["Fyldan"],				381,			49.5,	36.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4225,		L["Saenorion"],				381,			60.0,	37.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4226,		L["Ulthir"],				381,			54.6,	38.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4228,		L["Vaean"],					381,			56.4,	32.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4229,		L["Mythrin'dir"],			381,			58.1,	34.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4265,		L["Nyoma"],					41,			56.6,	53.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(4305,		L["Kriggon Talsone"],		39,			36.2,	90.1,	"Alliance")
	AddVendor(4553,		L["Ronald Burch"],			382,			62.3,	43.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4561,		L["Daniel Bartlett"],		382,			64.1,	37.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4574,		L["Lizbeth Cromwell"],		382,			81.0,	30.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4577,		L["Millie Gregorian"],		382,			70.6,	30.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4589,		L["Joseph Moore"],			382,			70.0,	58.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4597,		L["Samuel Van Brunt"],		382,			61.4,	30.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4610,		L["Algernon"],				382,			51.7,	74.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4617,		L["Thaddeus Webb"],			382,			62.4,	61.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4775,		L["Felicia Doan"],			382,			64.1,	50.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(4782,		L["Truk Wildbeard"],		26,		14.4,	42.5,	"Alliance")
	AddVendor(4879,		L["Ogg'marr"],				141,		36.7,	31.0,	"Horde")
	AddVendor(4897,		L["Helenia Olden"],			141,		66.4,	51.5,	"Alliance")
	AddVendor(5128,		L["Bombus Finespindle"],	341,			39.6,	34.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5154,		L["Poranna Snowbraid"],		341,			43.0,	28.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5158,		L["Tilli Thistlefuzz"],		341,			61.0,	44.0,	"Alliance") -- COMPLETELY UPDATEDM
	AddVendor(5160,		L["Emrul Riknussun"],		341,			59.9,	37.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5162,		L["Tansy Puddlefizz"],		341,			48.0,	6.3,	"Alliance")
	AddVendor(5163,		L["Burbik Gearspanner"],	341,			46.5,	27.1,	"Alliance")
	AddVendor(5175,		L["Gearcutter Cogspinner"],	341,			68.0,	43.1,	"Alliance")
	AddVendor(5178,		L["Soolie Berryfizz"],		341,			66.6,	54.5,	"Alliance")
	AddVendor(5411,		L["Krinkle Goodsteel"],		161,			51.2,	30.4,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(5483,		L["Erika Tate"],			301,		77.6,	53.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5494,		L["Catherine Leland"],		301,		55.1,	69.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5512,		L["Kaita Deepforge"],		301,		63.5,	37.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5565,		L["Jillian Tanner"],		301,		71.6,	62.8,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(5594,		L["Alchemist Pestlezugg"],	161,			50.8,	28.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(5748,		L["Killian Sanatha"],		21,		33.0,	17.8,	"Horde")
	AddVendor(5757,		L["Lilly"],					21,		43.1,	50.8,	"Horde")
	AddVendor(5758,		L["Leo Sarn"],				21,		53.9,	82.3,	"Horde")
	AddVendor(5940,		L["Harn Longcast"],			9,			47.5,	55.1,	"Horde")
	AddVendor(5942,		L["Zansoa"],				4,			57.4,	77.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(6568,		L["Vizzklick"],				161,			50.7,	28.7,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(6567,		L["Ghok'kah"],				141,		35.2,	30.8,	"Horde")
	AddVendor(6574,		L["Jun'ha"],				16,		72.7,	36.5,	"Horde")
	AddVendor(6730,		L["Jinky Twizzlefixxit"],	61,		77.7,	77.8,	"Alliance")
	AddVendor(6777,		L["Zan Shivsproket"],		24,		71.5,	45.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(6779,		L["Smudge Thunderwood"],	24,		71.5,	45.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(7733,		L["Innkeeper Fizzgrimble"],	161,			52.6,	27.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(7854,		L["Jangdor Swiftstrider"],	121,			52.8,	47.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(7940,		L["Darnall"],				241,			51.6,	33.3,	"Neutral")
	AddVendor(7947,		L["Vivianna"],				121,			46.2,	41.6,	"Alliance") -- NO CHARACTER HIGH ENOUGH LEVEL FOR ME TO SCAN THIS NPC
	AddVendor(8131,		L["Blizrik Buckshot"],		161,			50.7,	28.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(8145,		L["Sheendra Tallgrass"],	121,			74.5,	42.8,	"Horde")
	AddVendor(8150,		L["Janet Hommers"],			101,			66.2,	6.7,	"Alliance")
	AddVendor(8157,		L["Logannas"],				121,			46.6,	43.0,	"Alliance")
	AddVendor(8158,		L["Bronk"],					121,			76.1,	43.3,	"Horde")
	AddVendor(8160,		L["Nioma"],					26,		13.4,	43.3,	"Alliance")
	AddVendor(8161,		L["Harggan"],				26,		13.4,	44.0,	"Alliance")
	AddVendor(8176,		L["Gharash"],				38,		47.2,	52.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8177,		L["Rartar"],				38,		47.2,	57.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8178,		L["Nina Lightbrew"],		19,		66.9,	18.3,	"Alliance")
	AddVendor(8307,		L["Tarban Hearthgrain"],	11,		55.1,	61.7,	"Horde")  -- UPDATED
	AddVendor(8363,		L["Shadi Mistrunner"],		362,		40.6,	64.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(8508,		L["Gretta Ganter"],			27,			38.6,	42.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(8679,		L["Knaz Blunderflame"],		37,	67.7,	61.1,	"Neutral")   -- UPDATED
	AddVendor(8681,		L["Outfitter Eric"],		341,			43.2,	29.2,	"Alliance")
	AddVendor(8878,		L["Muuran"],				101,			55.6,	56.5,	"Horde")
	AddVendor(9499,		BB["Plugger Spazzring"],	704,		0,	0,	"Neutral")
	AddVendor(9636,		L["Kireena"],				101,			51.0,	53.5,	"Horde")
	AddVendor(10118,	L["Nessa Shadowsong"],		41,			56.3,	92.4,	"Alliance")
	AddVendor(10856,	L["Argent Quartermaster Hasana"],	20,		83.2,	68.1,	"Neutral")
	AddVendor(10857,	L["Argent Quartermaster Lightspark"],	22,		42.8,	83.8,	"Neutral")
	AddVendor(11185,	L["Xizzer Fizzbolt"],		281,			59.2,	50.9,	"Neutral")
	AddVendor(11187,	L["Himmik"],				281,			59.8,	51.6,	"Neutral")  -- UPDATED
	AddVendor(11188,	L["Evie Whirlbrew"],		281,			59.2,	50.0,	"Neutral")
	AddVendor(11189,	L["Qia"],					281,			59.6,	49.2,	"Neutral")
	AddVendor(11278,	L["Magnus Frostwake"],		22,		68.1,	77.6,	"Neutral")
	AddVendor(11536,	L["Quartermaster Miranda Breechlock"],	23,		75.8,	54.1,	"Neutral")
	AddVendor(11557,	L["Meilosh"],				182,			65.7,	2.9, 	"Neutral")
	AddVendor(12022,	L["Lorelae Wintersong"],	241,			48.3,	40.1,	"Neutral")
	AddVendor(12033,	L["Wulan"],					101,			26.2,	69.7,	"Horde")
	AddVendor(12043,	L["Kulwia"],				81,		45.4,	59.4,	"Horde")
	AddVendor(12245,	L["Vendor-Tron 1000"],		101,			60.3,	38.1,	"Neutral")
	AddVendor(12246,	L["Super-Seller 680"],		101,			40.5,	79.3,	"Neutral")
	AddVendor(12941,	L["Jase Farlane"],			23,		74.8,	51.8,	"Neutral")
	AddVendor(12942,	L["Leonard Porter"],		22,		43.0,	84.3,	"Alliance")
	AddVendor(12943,	L["Werg Thickblade"],		20,		83.2,	69.7,	"Horde")
	AddVendor(12944,	L["Lokhtos Darkbargainer"],	704,		0,	0,	"Neutral")
	AddVendor(12956,	L["Zannok Hidepiercer"],	261,			81.9,	17.8,	"Neutral")
	AddVendor(12958,	L["Gigget Zipcoil"],		26,		34.5,	38.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(12959,	L["Nergal"],				201,		54.8,	62.5,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(12962,	L["Wik'Tar"],				43,			11.8,	34.1,	"Horde")
	AddVendor(13420,	L["Penney Copperpinch"],	321,			53.5,	66.1,	"Neutral")
	AddVendor(13429,	L["Nardstrum Copperpinch"],	382,			67.5,	38.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(13432,	L["Seersa Copperpinch"],	362,		42.0,	55.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(13433,	L["Wulmort Jinglepocket"],	341,			33.0,	67.6,	"Neutral")
	AddVendor(13435,	L["Khole Jinglepocket"],	301,		62.2,	70.6,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(14371,	L["Shen'dralar Provisioner"],		699,			0,	0,	"Neutral")
	AddVendor(14637,	L["Zorbin Fandazzle"],		121,			48.7,	44.8,	"Neutral")
	AddVendor(14738,	L["Otho Moji'ko"],			26,		79.3,	79.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(15174,	L["Calandrath"],			261,			55.4,	36.6,	"Neutral")
	AddVendor(15176,	L["Vargus"],				261,			54.8,	36.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(15179,	L["Mishta"],				261,			53.8,	34.4,	"Neutral")
	AddVendor(15293,	L["Aendel Windspear"],		261,			64.6,	45.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(15419,	L["Kania"],					261,			55.6,	37.2,	"Neutral")
	AddVendor(15471,	BB["Lieutenant General Andorov"],	717,		0,	0,	"Neutral")
	AddVendor(15909,	L["Fariel Starsong"],		241,			54.0,	35.4,	"Neutral")
	AddVendor(16224,	L["Rathis Tomber"],			463,			47.2,	28.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16253,	L["Master Chef Mouldier"],	463,			48.3,	30.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16262,	L["Landraelanis"],			462,		49.0,	47.0,	"Horde")
	AddVendor(16388,	L["Koren"],					799,			0,	0,	"Neutral")
	AddVendor(16583,	L["Rohok"],					465,		53.2,	38.2,	"Horde")
	AddVendor(16585,	L["Cookie One-Eye"],		465,		54.6,	41.1,	"Horde")
	AddVendor(16588,	L["Apothecary Antonivich"],	465,		52.4,	36.5,	"Horde")
	AddVendor(16624,	L["Gelanthis"],				480,		90.9,	73.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16635,	L["Lyna"],					480,		70.3,	24.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16638,	L["Deynna"],				480,		55.6,	51.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16641,	L["Melaris"],				480,		67.1,	19.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16657,	L["Feera"],					362,		54.0,	90.5,	"Alliance")
	AddVendor(16670,	L["Eriden"],				480,		80.3,	36.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16677,	L["Quelis"],				480,		69.3,	70.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16689,	L["Zaralda"],				480,		84.8,	78.6,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16705,	L["Altaa"],					362,		27.5,	62.1,	"Alliance")
	AddVendor(16713,	L["Arras"],					362,		60.0,	89.5,	"Alliance")
	AddVendor(16718,	L["Phea"],					362,		54.7,	26.5,	"Alliance")
	AddVendor(16722,	L["Egomis"],				362,		39.9,	40.2,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16748,	L["Haferet"],				362,		66.6,	73.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16767,	L["Neii"],					362,		64.5,	68.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(16782,	L["Yatheon"],				480,		75.6,	40.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(16826,	L["Sid Limbardi"],			465,		54.3,	63.6,	"Alliance")
	AddVendor(17246,	L["\"Cookie\" McWeaksauce"],464,		46.7,	70.5,	"Alliance")
	AddVendor(17512,	L["Arred"],					362,		45.9,	24.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(17518,	L["Ythyar"],				799,		0,		0,		"Neutral")
	AddVendor(17585,	L["Quartermaster Urgronn"],	465,		54.9,	37.9,	"Horde")
	AddVendor(17657,	L["Logistics Officer Ulrike"],		465,		56.7,	62.6,	"Alliance")
	AddVendor(17904,	L["Fedryen Swiftspear"],	467,			79.3,	63.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18005,	L["Haalrun"],				467,			67.8,	48.0,	"Alliance")
	AddVendor(18011,	L["Zurai"],					467,			85.3,	54.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18015,	L["Gambarinka"],			467,			31.7,	49.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18017,	L["Seer Janidi"],			467,			32.4,	51.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(18255,	L["Apprentice Darius"],		32,		47.0,	75.3,	"Neutral")
	AddVendor(18382,	L["Mycah"],					467,			17.9,	51.2,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18427,	L["Fazu"],					476,		53.5,	56.5,	"Alliance")
	AddVendor(18484,	L["Wind Trader Lathrai"],	481,		72.3,	31.0,	"Neutral")
	AddVendor(18664,	L["Aged Dalaran Wizard"],	734,	0,	0,	"Neutral")
	AddVendor(18672,	L["Thomas Yance"],			734,	0,	0,	"Neutral")
	AddVendor(18753,	L["Felannia"],				465,		52.3,	36.1,	"Horde")
	AddVendor(18773,	L["Johan Barnes"],			465,		53.7,	66.1,	"Alliance")
	AddVendor(18775,	L["Lebowski"],				465,		55.7,	65.5,	"Alliance")
	AddVendor(18802,	L["Alchemist Gribble"],		465,		53.8,	65.8,	"Alliance")
	AddVendor(18821,	L["Quartermaster Jaffrey Noreliqe"],	477,			41.2,	44.3,	"Horde")
	AddVendor(18822,	L["Quartermaster Davian Vaclav"],	477,			41.2,	44.3,	"Alliance")
	AddVendor(18911,	L["Juno Dufrain"],			467,			78.0,	66.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(18951,	L["Erilia"],				462,		55.5,	54.0,	"Horde")
	AddVendor(18957,	L["Innkeeper Grilka"],		478,		48.8,	45.1,	"Horde")
	AddVendor(18960,	L["Rungor"],				478,		48.8,	46.1,	"Horde")
	AddVendor(19015,	L["Mathar G'ochar"],		477,			57.0,	39.6,	"Horde")
	AddVendor(19017,	L["Borto"],					477,			53.3,	71.9,	"Alliance")
	AddVendor(19038,	L["Supply Officer Mills"],	478,		55.7,	53.1,	"Alliance")
	AddVendor(19042,	L["Leeli Longhaggle"],		478,		57.7,	53.4,	"Alliance")
	AddVendor(19065,	L["Inessera"],				481,		34.5,	20.2,	"Neutral")
	AddVendor(19074,	L["Skreah"],				481,		46.0,	20.1,	"Neutral")
	AddVendor(19195,	L["Jim Saltit"],			481,		63.6,	68.6,	"Neutral")
	AddVendor(19213,	L["Eiin"],					481,		66.2,	68.7,	"Neutral")
	AddVendor(19234,	L["Yurial Soulwater"],		481,		43.5,	96.9,	"Neutral")
	AddVendor(19296,	L["Innkeeper Biribi"],		478,		56.7,	53.3,	"Alliance")
	AddVendor(19321,	L["Quartermaster Endarin"],	481,		47.9,	26.1,	"Neutral")
	AddVendor(19331,	L["Quartermaster Enuril"],	481,		60.5,	64.2,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19342,	L["Krek Cragcrush"],		473,		28.9,	30.8,	"Horde")
	AddVendor(19351,	L["Daggle Ironshaper"],		473,		36.8,	54.4,	"Alliance")
	AddVendor(19373,	L["Mari Stonehand"],		473,		36.8,	55.1,	"Alliance")
	AddVendor(19383,	L["Captured Gnome"],		467,			32.5,	48.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(19521,	L["Arrond"],				473,		55.9,	58.2,	"Neutral")
	AddVendor(19536,	L["Dealer Jadyan"],			479,			44.0,	36.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19537,	L["Dealer Malij"],			479,			44.2,	34.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19540,	L["Asarnan"],				479,			44.2,	33.7,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(19661,	L["Viggz Shinesparked"],	481,		64.9,	69.1,	"Neutral")
	AddVendor(19662,	L["Aaron Hollman"],			481,		63.1,	71.1,	"Neutral")
	AddVendor(19663,	L["Madame Ruby"],			481,		63.1,	69.3,	"Neutral")
	AddVendor(19694,	L["Loolruna"],				467,			68.5,	50.1,	"Alliance")
	AddVendor(19722,	L["Muheru the Weaver"],		467,			40.6,	28.2,	"Alliance")
	AddVendor(19836,	L["Mixie Farshot"],			465,		61.1,	81.5,	"Horde")
	AddVendor(19837,	L["Daga Ramba"],			475,	51.1,	57.7,	"Horde") -- COMPLETELY UPDATED
	AddVendor(20028,	L["Doba"],					467,			42.3,	27.9,	"Alliance")
	AddVendor(20096,	L["Uriku"],					477,			56.2,	73.3,	"Alliance")
	AddVendor(20097,	L["Nula the Butcher"],		477,			58.0,	35.7,	"Horde")
	AddVendor(20240,	L["Trader Narasu"],			477,			54.6,	75.2,	"Alliance")
	AddVendor(20241,	L["Provisioner Nasela"],	477,			53.5,	36.9,	"Horde")
	AddVendor(20242,	L["Karaaz"],				479,			43.6,	34.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(20916,	L["Xerintha Ravenoak"],		475,	62.5,	40.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(21113,	L["Sassa Weldwell"],		475,	61.3,	68.9,	"Alliance")
	AddVendor(21432,	L["Almaador"],				481,		51.0,	41.9,	"Neutral")
	AddVendor(21474,	L["Coreiel"],				477,			42.8,	42.6,	"Horde")
	AddVendor(21485,	L["Aldraan"],				477,			42.9,	42.5,	"Alliance")
	AddVendor(21643,	L["Alurmi"],				161,			63.0,	57.3,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(21655,	L["Nakodu"],				481,		62.1,	69.0,	"Neutral")
	AddVendor(22208,	L["Nasmara Moonsong"],		481,		66.0,	69.0,	"Neutral")
	AddVendor(22212,	L["Andrion Darkspinner"],	481,		66.0,	67.8,	"Neutral")
	AddVendor(22213,	L["Gidge Spellweaver"],		481,		66.0,	67.9,	"Neutral")
	AddVendor(23007,	L["Paulsta'ats"],			477,			30.6,	57.0,	"Neutral")
	AddVendor(23010,	L["Wolgren Jinglepocket"],	362,			54.5,	47.2,	"Alliance")
	AddVendor(23012,	L["Hotoppik Copperpinch"],	480,		63.5,	79.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(23064,	L["Eebee Jinglepocket"],	481,		51.0,	31.3,	"Neutral")
	AddVendor(23159,	L["Okuno"],					796,			0,	0,	"Neutral")
	AddVendor(23437,	L["Indormi"],				775,			0,	0,	"Neutral")
	AddVendor(25032,	L["Eldara Dawnrunner"],		499,		47.1,	30.0,	"Neutral")
	AddVendor(25950,	L["Shaani"],				499,		51.5,	32.6,	"Neutral")
	AddVendor(26081, 	L["High Admiral \"Shelly\" Jorrik"],	27, 			17.8,	74.6,	"Neutral")
	AddVendor(26569,	L["Alys Vol'tyr"],			488,			36.3,	46.5,	"Horde")
	AddVendor(26868,	L["Provisioner Lorkran"],	490,		22.6,	66.1,	"Horde")
	AddVendor(27030,	L["Bradley Towns"],			488,			76.9,	62.2,	"Horde")
	AddVendor(27054,	L["Modoru"],				488,			28.9,	55.9,	"Alliance")
	AddVendor(27147,	L["Librarian Erickson"],	486,		46.7,	32.5,	"Neutral")
	AddVendor(27666,	L["Ontuvo"],				481,		48.7,	41.3,	"Neutral")
	AddVendor(28701,	L["Timothy Jones"],			504,			40.5,	35.2,	"Neutral")
	AddVendor(28714,	L["Ildine Sorrowspear"],	504,			39.1,	41.5,	"Neutral")
	AddVendor(28721,	L["Tiffany Cartier"],		504,			40.5,	34.4,	"Neutral")
	AddVendor(28722,	L["Bryan Landers"],			504,			39.1,	26.5,	"Neutral")
	AddVendor(28723,	L["Larana Drome"],			504,			42.3,	37.5,	"Neutral")
	AddVendor(29510,	L["Linna Bruder"],			504,			34.6,	34.5,	"Neutral")
	AddVendor(29511,	L["Lalla Brightweave"],		504,			36.5,	33.5,	"Neutral")
	AddVendor(29512,	L["Ainderu Summerleaf"],	504,			36.5,	34.0,	"Neutral")
	AddVendor(30431,	L["Veteran Crusader Aliocha Segard"],	492,			87.6,	75.6,	"Neutral")
	AddVendor(30489,	L["Morgan Day"],			501,			49.0,	17.1,	"Alliance")
	AddVendor(30734,	L["Jezebel Bican"],			465,		53.9,	65.5,	"Alliance")
	AddVendor(30735,	L["Kul Inkspiller"],		465,		52.5,	36.0,	"Horde")
	AddVendor(31031,	L["Misensi"],				504,			70.1,	38.5,	"Horde")
	AddVendor(31032,	L["Derek Odds"],			504,			41.5,	64.8,	"Alliance")
	AddVendor(31910,	L["Geen"],					493,		54.5,	56.2,	"Neutral")
	AddVendor(31911,	L["Tanak"],					493,		55.1,	69.1,	"Neutral")
	AddVendor(31916,	L["Tanaika"],				491,		25.5,	58.7,	"Neutral")
	AddVendor(32287,	L["Archmage Alvareaux"],	504,			25.5,	47.4,	"Neutral")
	AddVendor(32294,	L["Knight Dameron"],		501,			51.7,	17.5,	"Alliance")
	AddVendor(32296,	L["Stone Guard Mukar"],		501,			51.7,	17.5,	"Horde")
	AddVendor(32514,	L["Vanessa Sellers"],		504,			38.7,	40.8,	"Neutral")
	AddVendor(32515,	L["Braeg Stoutbeard"],		504,			37.6,	29.5,	"Neutral")
	AddVendor(32533,	L["Cielstrasza"],			488,			59.9,	53.1,	"Neutral")
	AddVendor(32538,	L["Duchess Mynx"],			492,			43.5,	20.6,	"Neutral")
	AddVendor(32540,	L["Lillehoff"],				495,		66.2,	61.4,	"Neutral")
	AddVendor(32564,	L["Logistics Officer Silverstone"],	486,		57.7,	66.5,	"Alliance")
	AddVendor(32565,	L["Gara Skullcrush"],		486,		41.4,	53.6,	"Horde")
	AddVendor(32763,	L["Sairuk"],				488,			48.5,	75.7,	"Neutral")
	AddVendor(32773,	L["Logistics Officer Brighton"],	491,		59.7,	63.9,	"Alliance")
	AddVendor(32774,	L["Sebastian Crane"],		491,		79.6,	30.7,	"Horde")
	AddVendor(33594,	L["Fizzix Blastbolt"],		492,			72.2,	20.9,	"Neutral")
	AddVendor(33595,	L["Mera Mistrunner"],		492,			72.4,	20.9,	"Neutral")
	AddVendor(33602,	L["Anuur"],					492,			71.4,	20.8,	"Neutral")
	AddVendor(33637,	L["Kirembri Silvermane"],	481,		58.1,	75.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(33680,	L["Nemiha"],				481,		36.1,	47.7,	"Neutral")
	AddVendor(34382,	L["Chapman"],				382,			68.1,	11.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(34601,	L["Harlown Darkweave"],		43,			18.2,	60.0,	"Alliance")
	AddVendor(35826,	L["Kaye Toogie"],			504,			34.0,	35.6,	"Neutral")
	AddVendor(37687,	L["Alchemist Finklestein"],	604,		0,	0,	"Neutral")
	AddVendor(38561,	L["Dramm Riverhorn"],		201,		43.46,	41.60,	"Neutral")
	AddVendor(40160,	L["Frozo the Renowned"],	504,			41.0,	28.5,	"Neutral")
	AddVendor(40226,	L["Pratt McGrubben"],		121,			45.4,	41.2,	"Alliance")
	AddVendor(40572,	L["Haughty Modiste"],		161,			50.7,	28.6,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(40589,	L["Dirge Quikcleave"],		161,			52.6,	29.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(41435,	L["Fradd Swiftgear"],		40,			26.8,	26.0,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(44583,	L["Terrance Denman"],		301, 		63.2,	61.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(45546,	L["Vizna Bangwrench"],		321,			36.4,	86.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45549,	L["Zido Helmbreaker"],		321,			36.4,	83.0,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45558,	L["Lizna Goldweaver"],		321,			41.3,	79.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(45843,	L["Yuka Screwspigot"],		704,		37.0,	79.0,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(46359,	L["Punra"],					321,			45.0,	76.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(48060,	L["\"Chef\" Overheat"],		17,			65.1,	39.1,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(49701,	L["Bario Matalli"],			301, 		50.4,	71.9,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(49703,	L["Casandra Downs"],		700,		78.6,	76.2,	"Alliance")
	AddVendor(49737,	L["Shazdar"],				321,			56.8,	62.3,	"Horde") -- COMPLETELY UPDATED
	AddVendor(49918,	L["Buckslappy"],			17,			90.9,	38.8,	"Neutral") -- COMPLETELY UPDATED
	AddVendor(50129,	L["Daleohm"],				281,			58.0,	63.8,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50134,	L["Senthii"],				700,		78.7,	77.0,	"Alliance")
	AddVendor(50146,	L["Agatian Fallanos"],		700,		76.7,	49.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50172,	L["Threm Blackscalp"],		700,		75.2,	50.1,	"Horde")
	AddVendor(50248,	L["Una Kobuna"],			700,		76.6,	49.4,	"Horde")
	AddVendor(50375,	L["Kuldar Steeltooth"],		700,		77.3,	53.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50381,	L["Misty Merriweather"],	700,		78.8,	76.2,	"Alliance")
	AddVendor(50382,	L["Brundall Chiselgut"],	700,		79.1,	76.5,	"Alliance")
	AddVendor(50386,	L["Sal Ferraga"],			700,		78.6,	76.9,	"Alliance")
	AddVendor(50433,	L["Aristaleon Sunweaver"],	700,		75.2,	50.1,	"Horde") -- COMPLETELY UPDATED
	AddVendor(50480,	L["Isabel Jones"],			301,		63.7,	61.3,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(50482,	L["Marith Lazuria"],		321,			72.5,	34.4,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52584,	L["Laida Gembold"],			341,			50.6,	27.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52588,	L["Sara Lanner"],			382,			56.7,	36.9,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52641,	L["Layna Karner"],			381,			56.8,	52.5,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52644,	L["Tarien Silverdew"],		381,			54.4,	30.7,	"Alliance") -- COMPLETELY UPDATED
	AddVendor(52655,	L["Palehoof's Big Bag of Parts"],	362,		36.2,	60.2,	"Horde") -- COMPLETELY UPDATED
	AddVendor(52658,	L["Paku Cloudchaser"],		362,		34.7,	53.5,	"Horde") -- COMPLETELY UPDATED
	AddVendor(53214,	L["Damek Bloombeard"],		606,			47.0,	90.2,	"Neutral")
	AddVendor(53881,	L["Ayla Shadowstorm"],		606,			72.5,	36.2,	"Neutral")
	AddVendor(54232,	L["Mrs. Gant"],				673,	42.6,	72.8,	"Neutral") -- COMPLETLY UPDATED
	AddVendor(56925,	L["Farrah Facet"],			301,		63.8,	61.6,	"Alliance") -- COMPLETLY UPDATED
	AddVendor(57922,	L["Taryssa Lazuria"],		321,			72.4,	34.6,	"Horde") -- COMPLETLY UPDATED

	self.InitVendor = nil
end
