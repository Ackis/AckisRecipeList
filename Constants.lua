-------------------------------------------------------------------------------
-- Constants.lua
-------------------------------------------------------------------------------
-- File date: @file-date-iso@
-- File hash: @file-abbreviated-hash@
-- Project hash: @project-abbreviated-hash@
-- Project version: @project-version@
-------------------------------------------------------------------------------
-- Please see http://www.wowace.com/addons/arl/ for more information.
-------------------------------------------------------------------------------
-- This source code is released under All Rights Reserved.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Upvalued Lua API
-------------------------------------------------------------------------------
local _G = getfenv(0)

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...
private.addon_name = "Ackis Recipe List"

local LibStub = _G.LibStub
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Profession data.
-------------------------------------------------------------------------------
-- Needed for Smelting kludge.
private.mining_name		= _G.GetSpellInfo(32606)

-- This is needed because the French translation is non-conformant.
private.runeforging_name = _G.GetLocale() == "frFR" and "Runeforger" or _G.GetSpellInfo(53428)

private.professions = {
	["Alchemy"]		= _G.GetSpellInfo(51304),
	["Blacksmithing"]	= _G.GetSpellInfo(51300),
	["Cooking"]		= _G.GetSpellInfo(51296),
	["Enchanting"]		= _G.GetSpellInfo(51313),
	["Engineering"]		= _G.GetSpellInfo(51306),
	["FirstAid"]		= _G.GetSpellInfo(45542),
	["Inscription"]		= _G.GetSpellInfo(45363),
	["Jewelcrafting"]	= _G.GetSpellInfo(51311),
	["Leatherworking"]	= _G.GetSpellInfo(51302),
	["Runeforging"]		= private.runeforging_name,
	["Smelting"]		= _G.GetSpellInfo(2656),
	["Tailoring"]		= _G.GetSpellInfo(51309),
}

private.ordered_professions = {
	private.professions.Alchemy, 		-- 1
	private.professions.Blacksmithing, 	-- 2
	private.professions.Cooking, 		-- 3
	private.professions.Enchanting,		-- 4
	private.professions.Engineering,	-- 5
	private.professions.FirstAid,		-- 6
	private.professions.Inscription,	-- 7
	private.professions.Jewelcrafting, 	-- 8
	private.professions.Leatherworking, 	-- 9
	private.professions.Runeforging,	-- 10
	private.professions.Smelting,		-- 11
	private.professions.Tailoring,		-- 12
}

private.profession_textures = {
	"alchemy",	-- 1
	"blacksmith",	-- 2
	"cooking",	-- 3
	"enchant",	-- 4
	"engineer",	-- 5
	"firstaid",	-- 6
	"inscribe",	-- 7
	"jewel",	-- 8
	"leather",	-- 9
	"runeforge",	-- 10
	"smelting",	-- 11
	"tailor",	-- 12
}

-------------------------------------------------------------------------------
-- Item qualities.
-------------------------------------------------------------------------------
private.item_quality_names = {
	[1] = "COMMON",
	[2] = "UNCOMMON",
	[3] = "RARE",
	[4] = "EPIC",
	[5] = "LEGENDARY",
	[6] = "ARTIFACT",
}

private.item_qualities = {}

for index = 1, #private.item_quality_names do
	private.item_qualities[private.item_quality_names[index]] = index
end

-------------------------------------------------------------------------------
-- Game/expansion versions.
-------------------------------------------------------------------------------
private.game_version_names = {
	[1] = "ORIG",
	[2] = "TBC",
	[3] = "WOTLK",
	[4] = "CATA",
}

private.game_versions = {}

for index = 1, #private.game_version_names do
	private.game_versions[private.game_version_names[index]] = index
end

-------------------------------------------------------------------------------
-- Filters.
-------------------------------------------------------------------------------
private.filter_strings = {
	[1]	= "ALLIANCE",		[2]	= "HORDE",		[3]	= "TRAINER",		[4]	= "VENDOR",
	[5]	= "INSTANCE",		[6]	= "RAID",		[7]	= "SEASONAL",		[8]	= "QUEST",
	[9]	= "PVP",		[10]	= "WORLD_DROP",		[11]	= "MOB_DROP",		[12]	= "DISC",
	[13]	= "RETIRED",		[14]	= "ACHIEVEMENT",	[15]	= "RESERVED_15",	[16]	= "RESERVED_16",
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
	[77]	= "XBOW",		[78]	= "RESERVED_78",	[79]	= "FIST",		[80]	= "GUN",
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
	[129]	= "CATACOMMON1",	[130]	= "CATACOMMON2",	[131]	= "GUARDIANS",		[132]	= "RAMKAHEN",
	[133]	= "EARTHEN_RING",	[134]	= "THERAZANE",
}

private.filter_ids = {}

for index = 1, #private.filter_strings do
	private.filter_ids[private.filter_strings[index]] = index
end

-------------------------------------------------------------------------------
-- Common filter bitfield word 1.
-------------------------------------------------------------------------------
private.common_flags_word1 = {
	ALLIANCE	= 0x00000001,	-- 1
	HORDE		= 0x00000002,	-- 2
	TRAINER		= 0x00000004,	-- 3
	VENDOR		= 0x00000008,	-- 4
	INSTANCE	= 0x00000010,	-- 5
	RAID		= 0x00000020,	-- 6
	SEASONAL	= 0x00000040,	-- 7
	QUEST		= 0x00000080,	-- 8
	PVP		= 0x00000100,	-- 9
	WORLD_DROP	= 0x00000200,	-- 10
	MOB_DROP	= 0x00000400,	-- 11
	DISC		= 0x00000800,	-- 12
	RETIRED		= 0x00001000,	-- 13
	IBOE		= 0x00002000,	-- 14
	IBOP		= 0x00004000,	-- 15
	IBOA		= 0x00008000,	-- 16
	RBOE		= 0x00010000,	-- 17
	RBOP		= 0x00020000,	-- 18
	RBOA		= 0x00040000,	-- 19
	DPS		= 0x00080000,	-- 20
	TANK		= 0x00100000,	-- 21
	HEALER		= 0x00200000,	-- 22
	CASTER		= 0x00400000,	-- 23
	ACHIEVEMENT	= 0x00800000,	-- 24
}

-------------------------------------------------------------------------------
-- Class filter bitfield word 1.
-------------------------------------------------------------------------------
private.class_flags_word1 = {
	DK	= 0x00000001,	-- 1
	DRUID	= 0x00000002,	-- 2
	HUNTER	= 0x00000004,	-- 3
	MAGE	= 0x00000008,	-- 4
	PALADIN	= 0x00000010,	-- 5
	PRIEST	= 0x00000020,	-- 6
	SHAMAN	= 0x00000040,	-- 7
	ROGUE	= 0x00000080,	-- 8
	WARLOCK	= 0x00000100,	-- 9
	WARRIOR	= 0x00000200,	-- 10
}

-------------------------------------------------------------------------------
-- Reputation filter bitfield word 1.
-------------------------------------------------------------------------------
private.rep_flags_word1 = {
	ARGENTDAWN		= 0x00000001,	-- 1
	CENARION_CIRCLE		= 0x00000002,	-- 2
	THORIUM_BROTHERHOOD	= 0x00000004,	-- 3
	TIMBERMAW_HOLD		= 0x00000008,	-- 4
	ZANDALAR		= 0x00000010,	-- 5
	ALDOR			= 0x00000020,	-- 6
	ASHTONGUE		= 0x00000040,	-- 7
	CENARION_EXPEDITION	= 0x00000080,	-- 8
	HELLFIRE		= 0x00000100,	-- 9
	CONSORTIUM		= 0x00000200,	-- 10
	KOT			= 0x00000400,	-- 11
	LOWERCITY		= 0x00000800,	-- 12
	NAGRAND			= 0x00001000,	-- 13
	SCALE_SANDS		= 0x00002000,	-- 14
	SCRYER			= 0x00004000,	-- 15
	SHATAR			= 0x00008000,	-- 16
	SHATTEREDSUN		= 0x00010000,	-- 17
	SPOREGGAR		= 0x00020000,	-- 18
	VIOLETEYE		= 0x00040000,	-- 19
	ARGENTCRUSADE		= 0x00080000,	-- 20
	FRENZYHEART		= 0x00100000,	-- 21
	EBONBLADE		= 0x00200000,	-- 22
	KIRINTOR		= 0x00400000,	-- 23
	HODIR			= 0x00800000,	-- 24
	KALUAK			= 0x01000000,	-- 25
	ORACLES			= 0x02000000,	-- 26
	WYRMREST		= 0x04000000,	-- 27
	WRATHCOMMON1		= 0x08000000,	-- 28
	WRATHCOMMON2		= 0x10000000,	-- 29
	WRATHCOMMON3		= 0x20000000,	-- 30
	WRATHCOMMON4		= 0x40000000,	-- 31
	WRATHCOMMON5		= 0x80000000,	-- 32
}

-------------------------------------------------------------------------------
-- Reputation filter bitfield word 2.
-------------------------------------------------------------------------------
private.rep_flags_word2 = {
	ASHEN_VERDICT		= 0x00000001,	-- 1
	CATACOMMON1		= 0x00000002,	-- 2
	CATACOMMON2		= 0x00000004,	-- 3
	GUARDIANS		= 0x00000008,	-- 4
	RAMKAHEN		= 0x00000010,	-- 5
	EARTHEN_RING		= 0x00000020,	-- 6
	THERAZANE		= 0x00000040,	-- 7
}

-------------------------------------------------------------------------------
-- Item filter bitfield word 1.
-------------------------------------------------------------------------------
private.item_flags_word1 = {
	CLOTH		= 0x00000001,	-- 1
	LEATHER		= 0x00000002,	-- 2
	MAIL		= 0x00000004,	-- 3
	PLATE		= 0x00000008,	-- 4
	CLOAK		= 0x00000010,	-- 5
	TRINKET		= 0x00000020,	-- 6
	RING		= 0x00000040,	-- 7
	NECK		= 0x00000080,	-- 8
	SHIELD		= 0x00000100,	-- 9
	ONE_HAND	= 0x00000200,	-- 10
	TWO_HAND	= 0x00000400,	-- 11
	AXE		= 0x00000800,	-- 12
	SWORD		= 0x00001000,	-- 13
	MACE		= 0x00002000,	-- 14
	POLEARM		= 0x00004000,	-- 15
	DAGGER		= 0x00008000,	-- 16
	STAFF		= 0x00010000,	-- 17
	WAND		= 0x00020000,	-- 18
	THROWN		= 0x00040000,	-- 19
	BOW		= 0x00080000,	-- 20
	XBOW		= 0x00100000,	-- 21
	FIST		= 0x00200000,	-- 22
	GUN		= 0x00400000,	-- 23
}

-------------------------------------------------------------------------------
-- Transitory mapping from boolean "flags" to bit flags.
-------------------------------------------------------------------------------
private.bit_flags = {
	private.common_flags_word1,
	private.class_flags_word1,
	private.rep_flags_word1,
	private.rep_flags_word2,
	private.item_flags_word1,
}

-- Member names within a recipe's flags table.
private.flag_members = {
	"common1",
	"class1",
	"reputation1",
	"reputation2",
	"item1",
}

-------------------------------------------------------------------------------
-- Recipe state flags.
-------------------------------------------------------------------------------
private.recipe_state_flags = {
	KNOWN		= 0x00000001,
	RELEVANT	= 0x00000002,
	VISIBLE		= 0x00000004,
	LINKED		= 0x00000008,
}

-------------------------------------------------------------------------------
-- Acquire types.
-------------------------------------------------------------------------------
private.acquire_names = {
	[1]	= L["Trainer"],
	[2]	= L["Vendor"],
	[3]	= L["Mob Drop"],
	[4]	= L["Quest"],
	[5]	= _G.GetCategoryInfo(155),
	[6]	= _G.REPUTATION,
	[7]	= L["World Drop"],
	[8]	= _G.ACHIEVEMENTS,
	[9]	= L["Discovery"],
	[10]	= _G.MISCELLANEOUS,
}

private.acquire_strings = {
	[1]	= "TRAINER",
	[2]	= "VENDOR",
	[3]	= "MOB_DROP",
	[4]	= "QUEST",
	[5]	= "SEASONAL",
	[6]	= "REPUTATION",
	[7]	= "WORLD_DROP",
	[8]	= "ACHIEVEMENT",
	[9]	= "DISCOVERY",
	[10]	= "CUSTOM",
}

private.acquire_types = {}

for index = 1, #private.acquire_strings do
	private.acquire_types[private.acquire_strings[index]] = index
end

-------------------------------------------------------------------------------
-- Reputation levels.
-------------------------------------------------------------------------------
private.rep_level_strings = {
	[1]	= "FRIENDLY",
	[2]	= "HONORED",
	[3]	= "REVERED",
	[4]	= "EXALTED",
}

private.rep_levels = {}

for index = 1, #private.rep_level_strings do
	private.rep_levels[private.rep_level_strings[index]] = index
end

-------------------------------------------------------------------------------
-- Factions.
-------------------------------------------------------------------------------
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
	[1135]	= "EARTHEN_RING",
	[1158]	= "GUARDIANS",
	[1171]	= "THERAZANE",
	[1172]	= "DRAGONMAW",
	[1173]	= "RAMKAHEN",
	[1174]	= "WILDHAMMER",
	[1177]	= "WARDENS",
	[1178]	= "HELLSCREAM",
}

private.faction_ids = {}

for id, name in _G.pairs(private.faction_strings) do
	private.faction_ids[name] = id
end

-------------------------------------------------------------------------------
-- Colors.
-------------------------------------------------------------------------------
local function RGBtoHEX(r, g, b)
	return ("%02x%02x%02x"):format(r * 255, g * 255, b * 255)
end

local function GetColorsFromTable(dict)
	return dict.r, dict.g, dict.b
end

private.reputation_colors = {
	["exalted"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[8])),
	["revered"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[7])),
	["honored"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[6])),
	["friendly"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[5])),
	["neutral"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[4])),
	["unfriendly"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[3])),
	["hostile"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[2])),
	["hated"]	= RGBtoHEX(GetColorsFromTable(_G.FACTION_BAR_COLORS[1])),
}

-- Recipe difficulty colors.
private.difficulty_colors = {
	["trivial"]	= "808080",
	["easy"]	= "40bf40",
	["medium"]	= "ffff00",
	["optimal"]	= "ff8040",
	["impossible"]	= "ff0000",
}

private.basic_colors = {
	["grey"]	= "666666",
	["white"]	= "ffffff",
	["yellow"]	= "ffff00",
	["normal"]	= "ffd100",
}

-- Colors used in tooltips and the recipe list.
private.category_colors = {
	-- Acquire type colors
	["achievement"]	= "faeb98",
	["custom"]	= "73b7ff",
	["mobdrop"]	= "962626",
	["quest"]	= "dbdb2c",

	["reputation"]	= "855a99",
	["seasonal"]	= "80590e",
	["trainer"]	= "c98e26",
	["vendor"]	= "aad372",

	-- Miscellaneous
	["coords"]	= "d1ce6f",
	["location"]	= "ffecc1",
	["repname"]	= "6a9ad9",

}

-- Listing of recipes which overwrite other recipes when you learn them.
-- For example, when you learn Darkglow Embroidery Rank 2 (75175),
-- you no longer know Darkglow Embroidery Rank 1 (55769)

private.spell_overwrite_map = {
	-------------------------------------------------------------------------------
	-- Tailoring
	-------------------------------------------------------------------------------
	[75175] = 55769,	[75172] = 55642,	[75178] = 55777,
	[75154] = 56034,	[75155] = 56039,
}
