-------------------------------------------------------------------------------
-- Constants.lua
-------------------------------------------------------------------------------
-- File date: @file-date-iso@
-- File revision: @file-revision@
-- Project revision: @project-revision@
-- Project version: @project-version@
-------------------------------------------------------------------------------
-- Please see http://www.wowace.com/addons/arl/ for more information.
-------------------------------------------------------------------------------
-- This source code is released under All Rights Reserved.
-------------------------------------------------------------------------------
-- **AckisRecipeList** provides an interface for scanning professions for missing recipes.
-- There are a set of functions which allow you make use of the ARL database outside of ARL.
-- ARL supports all professions currently in World of Warcraft 3.3.2
-- @class file
-- @name ARL.lua
-- @release 1.0
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local private	= select(2, ...)

-------------------------------------------------------------------------------
-- Item qualities.
-------------------------------------------------------------------------------
private.item_qualities = {
	["COMMON"]	= 1,
	["UNCOMMON"]	= 2,
	["RARE"]	= 3,
	["EPIC"]	= 4,
	["LEGENDARY"]	= 5,
	["ARTIFACT"]	= 6,
}

private.item_quality_names = {
	[1] = "COMMON",
	[2] = "UNCOMMON",
	[3] = "RARE",
	[4] = "EPIC",
	[5] = "LEGENDARY",
	[6] = "ARTIFACT",
}

private.game_versions = {
	["ORIG"]	= 1,
	["TBC"]		= 2,
	["WOTLK"]	= 3,
}

private.game_version_names = {
	[1] = "ORIG",
	[2] = "TBC",
	[3] = "WOTLK",
}

-------------------------------------------------------------------------------
-- Filter flags.
-------------------------------------------------------------------------------
private.filter_flags = {
	["ALLIANCE"]		= 1,		["HORDE"]	= 2,		["TRAINER"]	= 3,		["VENDOR"]	= 4,
	["INSTANCE"]		= 5,		["RAID"]	= 6,		["SEASONAL"]	= 7,		["QUEST"]	= 8,
	["PVP"]			= 9,		["WORLD_DROP"]	= 10,		["MOB_DROP"]	= 11,		["DISC"]	= 12,
	["RESERVED_13"]		= 13,		["RESERVED_14"]	= 14,		["RESERVED_15"]	= 15,		["RESERVED_16"]	= 16,
	["RESERVED_17"]		= 17,		["RESERVED_18"]	= 18,		["RESERVED_19"]	= 19,		["RESERVED_20"]	= 20,
	["DK"]			= 21,		["DRUID"]	= 22,		["HUNTER"]	= 23,		["MAGE"]	= 24,
	["PALADIN"]		= 25,		["PRIEST"]	= 26,		["SHAMAN"]	= 27,		["ROGUE"]	= 28,
	["WARLOCK"]		= 29,		["WARRIOR"]	= 30,		["RESERVED_31"]	= 31,		["RESERVED_32"]	= 32,
	["RESERVED_33"]		= 33,		["RESERVED_34"]	= 34,		["RESERVED_35"]	= 35,		["IBOE"]	= 36,
	["IBOP"]		= 37,		["IBOA"]	= 38,		["RESERVED_39"]	= 39,		["RBOE"]	= 40,
	["RBOP"]		= 41,		["RBOA"]	= 42,		["RESERVED_43"]	= 43,		["RESERVED_44"]	= 44,
	["RESERVED_45"]		= 45,		["RESERVED_46"]	= 46,		["RESERVED_47"]	= 47,		["RESERVED_48"]	= 48,
	["RESERVED_49"]		= 49,		["RESERVED_50"]	= 50,		["DPS"]		= 51,		["TANK"]	= 52,
	["HEALER"]		= 53,		["CASTER"]	= 54,		["RESERVED_55"]	= 55,		["CLOTH"]	= 56,
	["LEATHER"]		= 57,		["MAIL"]	= 58,		["PLATE"]	= 59,		["CLOAK"]	= 60,
	["TRINKET"]		= 61,		["RING"]	= 62,		["NECK"]	= 63,		["SHIELD"]	= 64,
	["RESERVED_65"]		= 65,		["ONE_HAND"]	= 66,		["TWO_HAND"]	= 67,		["AXE"]		= 68,
	["SWORD"]		= 69,		["MACE"]	= 70,		["POLEARM"]	= 71,		["DAGGER"]	= 72,
	["STAFF"]		= 73,		["WAND"]	= 74,		["THROWN"]	= 75,		["BOW"]		= 76,
	["XBOW"]		= 77,		["AMMO"]	= 78,		["FIST"]	= 79,		["GUN"]		= 80,
	["RESERVED_81"]		= 81,		["RESERVED_82"]	= 82,		["RESERVED_83"]	= 83,		["RESERVED_84"]	= 84,
	["RESERVED_85"]		= 85,		["RESERVED_86"]	= 86,		["RESERVED_87"]	= 87,		["RESERVED_88"]	= 88,
	["RESERVED_89"]		= 89,		["RESERVED_90"]	= 90,		["RESERVED_91"]	= 91,		["RESERVED_92"]	= 92,
	["RESERVED_93"]		= 93,		["RESERVED_94"]	= 94,		["RESERVED_95"]	= 95,		["ARGENTDAWN"]	= 96,
	["CENARION_CIRCLE"]	= 97,		["THORIUM_BROTHERHOOD"]	= 98,	["TIMBERMAW_HOLD"] = 99,	["ZANDALAR"]    = 100,
	["ALDOR"]		= 101,		["ASHTONGUE"]	= 102,		["CENARION_EXPEDITION"] = 103,	["HELLFIRE"]    = 104,
	["CONSORTIUM"]		= 105,		["KOT"]		= 106,		["LOWERCITY"]	= 107,		["NAGRAND"]     = 108,
	["SCALE_SANDS"]		= 109,		["SCRYER"]	= 110,		["SHATAR"]	= 111,		["SHATTEREDSUN"]= 112,
	["SPOREGGAR"]		= 113,		["VIOLETEYE"]	= 114,		["ARGENTCRUSADE"] = 115,	["FRENZYHEART"] = 116,
	["EBONBLADE"]		= 117,		["KIRINTOR"]	= 118,		["HODIR"]	= 119,		["KALUAK"]	= 120,
	["ORACLES"]		= 121,		["WYRMREST"]	= 122,		["WRATHCOMMON1"]	= 123,	["WRATHCOMMON2"]= 124,
	["WRATHCOMMON3"]	= 125,		["WRATHCOMMON4"]= 126,		["WRATHCOMMON5"]	= 127,	["ASHEN_VERDICT"]=128,
}

private.filter_strings = {
	[1]	= "ALLIANCE",		[2]	= "HORDE",		[3]	= "TRAINER",		[4]	= "VENDOR",
	[5]	= "INSTANCE",		[6]	= "RAID",		[7]	= "SEASONAL",		[8]	= "QUEST",
	[9]	= "PVP",		[10]	= "WORLD_DROP",		[11]	= "MOB_DROP",		[12]	= "DISC",
	[13]	= "RESERVED_13",	[14]	= "RESERVED_14",	[15]	= "RESERVED_15",	[16]	= "RESERVED_16",
	[17]	= "RESERVED_17",	[18]	= "RESERVED_18",	[19]	= "RESERVED_19",	[20]	= "RESERVED_20",
	[21]	= "DK",			[22]	= "DRUID",		[23]	= "HUNTER",		[24]	= "MAGE",
	[25]	= "PALADIN",		[26]	= "PRIEST",		[27]	= "SHAMAN",		[28]	= "ROGUE",
	[29]	= "WARLOCK",		[30]	= "WARRIOR",		[31]	= "RESERVED_31",	[32]	= "RESERVED_32",
	[33]	= "RESERVED_33",	[34]	= "RESERVED_34",	[35]	= "RESERVED_35",	[36]	= "IBOE",
	[37]	= "IBOP",		[38]	= "IBOA",		[39]	= "RESERVED_39",	[40]	= "RBOE",
	[41]	= "RBOP",		[42]	= "RBOA",		[43]	= "RESERVED_43",	[44]	= "RESERVED_44",
	[45]	= "RESERVED_45",	[46]	= "RESERVED_46",	[47]	= "RESERVED_47",	[48]	= "RESERVED_48",
	[49]	= "RESERVED_49",	[50]	= "RESERVED_50",	[51]	= "DPS",		[52]	= "TANK",
	[53]	= "HEALER",		[54]	= "CASTER",		[55]	= "RESERVED_55",	[56]	= "CLOTH",
	[57]	= "LEATHER",		[58]	= "MAIL",		[59]	= "PLATE",		[60]	= "CLOAK",
	[61]	= "TRINKET",		[62]	= "RING",		[63]	= "NECK",		[64]	= "SHIELD",
	[65]	= "RESERVED_65",	[66]	= "ONE_HAND",		[67]	= "TWO_HAND",		[68]	= "AXE",
	[69]	= "SWORD",		[70]	= "MACE",		[71]	= "POLEARM",		[72]	= "DAGGER",
	[73]	= "STAFF",		[74]	= "WAND",		[75]	= "THROWN",		[76]	= "BOW",
	[77]	= "XBOW",		[78]	= "AMMO",		[79]	= "FIST",		[80]	= "GUN",
	[81]	= "RESERVED_81",	[82]	= "RESERVED_82",	[83]	= "RESERVED_83",	[84]	= "RESERVED_84",
	[85]	= "RESERVED_85",	[86]	= "RESERVED_86",	[87]	= "RESERVED_87",	[88]	= "RESERVED_88",
	[89]	= "RESERVED_89",	[90]	= "RESERVED_90",	[91]	= "RESERVED_91",	[92]	= "RESERVED_92",
	[93]	= "RESERVED_93",	[94]	= "RESERVED_94",	[95]	= "RESERVED_95",	[96]	= "ARGENTDAWN",
	[97]	= "CENARION_CIRCLE",	[98]	= "THORIUM_BROTHERHOOD",[99]	= "TIMBERMAW_HOLD",	[100]	= "ZANDALAR",
	[101]	= "ALDOR",		[102]	= "ASHTONGUE",		[103]	= "CENARION_EXPEDITION",[104]	= "HELLFIRE",
	[105]	= "CONSORTIUM",		[106]	= "KOT",		[107]	= "LOWERCITY",		[108]	= "NAGRAND",
	[109]	= "SCALE_SANDS",	[110]	= "SCRYER",		[111]	= "SHATAR",		[112]	= "SHATTEREDSUN",
	[113]	= "SPOREGGAR",		[114]	= "VIOLETEYE",		[115]	= "ARGENTCRUSADE",	[116]	= "FRENZYHEART",
	[117]	= "EBONBLADE",		[118]	= "KIRINTOR",		[119]	= "HODIR",		[120]	= "KALUAK",
	[121]	= "ORACLES",		[122]	= "WYRMREST",		[123]	= "WRATHCOMMON1",	[124]	= "WRATHCOMMON2",
	[125]	= "WRATHCOMMON3",	[126]	= "WRATHCOMMON4",	[127]	= "WRATHCOMMON5",	[128]	= "ASHEN_VERDICT",
}

-------------------------------------------------------------------------------
-- Acquire types.
-------------------------------------------------------------------------------
private.acquire_types = {
	["TRAINER"]	= 1,
	["VENDOR"]	= 2,
	["MOB"]		= 3,
	["QUEST"]	= 4,
	["SEASONAL"]	= 5,
	["REPUTATION"]	= 6,
	["WORLD_DROP"]	= 7,
	["CUSTOM"]	= 8,
}

private.acquire_strings = {
	[1]	= "TRAINER",
	[2]	= "VENDOR",
	[3]	= "MOB",
	[4]	= "QUEST",
	[5]	= "SEASONAL",
	[6]	= "REPUTATION",
	[7]	= "WORLD_DROP",
	[8]	= "CUSTOM",
}

-------------------------------------------------------------------------------
-- Reputation levels.
-------------------------------------------------------------------------------
private.rep_levels = {
	["FRIENDLY"]	= 1,
	["HONORED"]	= 2,
	["REVERED"]	= 3,
	["EXALTED"]	= 4,
}

private.rep_level_strings = {
	[1]	= "FRIENDLY",
	[2]	= "HONORED",
	[3]	= "REVERED",
	[4]	= "EXALTED",
}

-------------------------------------------------------------------------------
-- Factions.
-------------------------------------------------------------------------------
private.faction_ids = {
	["THORIUM_BROTHERHOOD"]	= 59,
	["ZANDALAR"]		= 270,
	["ARGENTDAWN"]		= 529,
	["TIMBERMAW_HOLD"]	= 576,
	["WINTERSPRING"]	= 589,
	["CENARION_CIRCLE"]	= 609,
	["ALDOR"]		= 932,
	["CONSORTIUM"]		= 933,
	["SCRYER"]		= 934,
	["SHATAR"]		= 935,
	["MAGHAR"]		= 941,
	["CENARION_EXPEDITION"]	= 942,
	["HONOR_HOLD"]		= 946,
	["THRALLMAR"]		= 947,
	["VIOLETEYE"]		= 967,
	["SPOREGGAR"]		= 970,
	["KURENAI"]		= 978,
	["KEEPERS_OF_TIME"]	= 989,
	["SCALE_OF_SANDS"]	= 990,
	["LOWERCITY"]		= 1011,
	["ASHTONGUE"]		= 1012,
	["ALLIANCE_VANGUARD"]	= 1037,
	["HORDE_EXPEDITION"]	= 1052,
	["KALUAK"]		= 1073,
	["SHATTEREDSUN"]	= 1077,
	["KIRINTOR"]		= 1090,
	["WYRMREST"]		= 1091,
	["EBONBLADE"]		= 1098,
	["FRENZYHEART"]		= 1104,
	["ORACLES"]		= 1105,
	["ARGENTCRUSADE"]	= 1106,
	["HODIR"]		= 1119,
	["ASHEN_VERDICT"]	= 1156,
}

private.faction_strings = {
	[59]	= "THORIUM_BROTHERHOOD",
	[270]	= "ZANDALAR",
	[529]	= "ARGENTDAWN",
	[576]	= "TIMBERMAW_HOLD",
	[589]	= "WINTERSPRING",
	[609]	= "CENARION_CIRCLE",
	[932]	= "ALDOR",
	[933]	= "CONSORTIUM",
	[934]	= "SCRYER",
	[935]	= "SHATAR",
	[941]	= "MAGHAR",
	[942]	= "CENARION_EXPEDITION",
	[946]	= "HONOR_HOLD",
	[947]	= "THRALLMAR",
	[967]	= "VIOLETEYE",
	[970]	= "SPOREGGAR",
	[978]	= "KURENAI",
	[989]	= "KEEPERS_OF_TIME",
	[990]	= "SCALE_OF_SANDS",
	[1011]	= "LOWERCITY",
	[1012]	= "ASHTONGUE",
	[1037]	= "ALLIANCE_VANGUARD",
	[1052]	= "HORDE_EXPEDITION",
	[1073]	= "KALUAK",
	[1077]	= "SHATTEREDSUN",
	[1090]	= "KIRINTOR",
	[1091]	= "WYRMREST",
	[1098]	= "EBONBLADE",
	[1104]	= "FRENZYHEART",
	[1105]	= "ORACLES",
	[1106]	= "ARGENTCRUSADE",
	[1119]	= "HODIR",
	[1156]	= "ASHEN_VERDICT",
}
