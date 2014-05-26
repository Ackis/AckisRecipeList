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

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...
private.addon_name = "Ackis Recipe List"

local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-- Required so constants can be assigned to the AddOn object in Core.lua in order to be accessible from profession modules
local constants = {}
private.constants = constants

-------------------------------------------------------------------------------
-- General constants.
-------------------------------------------------------------------------------
private.PLAYER_NAME = _G.UnitName("player")
private.REALM_NAME = _G.GetRealmName()

private.COORDINATES_FORMAT = "(%.2f, %.2f)"

-------------------------------------------------------------------------------
-- Profession data.
-------------------------------------------------------------------------------
-- Needed for Smelting kludge.
private.MINING_PROFESSION_NAME = _G.GetSpellInfo(2575)

private.PROFESSION_SPELL_IDS = {
	ALCHEMY = 2259,
	BLACKSMITHING = 2018,
	COOKING = 2550,
	ENCHANTING = 7411,
	ENGINEERING = 4036,
	FIRSTAID = 3273,
	INSCRIPTION = 45357,
	JEWELCRAFTING = 25229,
	LEATHERWORKING = 2108,
	SMELTING = 2656,
	TAILORING = 3908,
}
constants.PROFESSION_SPELL_IDS = private.PROFESSION_SPELL_IDS

private.LOCALIZED_PROFESSION_NAMES = {}

for name, spell_id in pairs(private.PROFESSION_SPELL_IDS) do
	private.LOCALIZED_PROFESSION_NAMES[name] = _G.GetSpellInfo(spell_id)
end

-- This is needed due to Pandaren cooking spells.
private.PROFESSION_NAME_MAP = {
	[_G.GetSpellInfo(124694)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Grill
	[_G.GetSpellInfo(125584)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Wok
	[_G.GetSpellInfo(125586)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Pot
	[_G.GetSpellInfo(125587)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Steamer
	[_G.GetSpellInfo(125588)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Oven
	[_G.GetSpellInfo(125589)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Brew
	[_G.GetSpellInfo(2575)] = private.LOCALIZED_PROFESSION_NAMES.SMELTING, -- Mining
}

for name, localized_name in pairs(private.LOCALIZED_PROFESSION_NAMES) do
	private.PROFESSION_NAME_MAP[localized_name] = localized_name
end

private.PROFESSION_LABELS = {
	"alchemy",		-- 1
	"blacksmithing",	-- 2
	"cooking",		-- 3
	"enchanting",		-- 4
	"engineering",		-- 5
	"firstaid",		-- 6
	"inscription",		-- 7
	"jewelcrafting",	-- 8
	"leatherworking",	-- 9
	"smelting",		-- 10
	"tailoring",		-- 11
}

private.ORDERED_PROFESSIONS = {
	private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, 		-- 1
	private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, 	-- 2
	private.LOCALIZED_PROFESSION_NAMES.COOKING, 		-- 3
	private.LOCALIZED_PROFESSION_NAMES.ENCHANTING,		-- 4
	private.LOCALIZED_PROFESSION_NAMES.ENGINEERING,		-- 5
	private.LOCALIZED_PROFESSION_NAMES.FIRSTAID,		-- 6
	private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION,		-- 7
	private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, 	-- 8
	private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, 	-- 9
	private.LOCALIZED_PROFESSION_NAMES.SMELTING,		-- 10
	private.LOCALIZED_PROFESSION_NAMES.TAILORING,		-- 11
}

-- Required for loading profession modules.
private.PROFESSION_MODULE_NAMES = {
	[private.LOCALIZED_PROFESSION_NAMES.ALCHEMY] = "Alchemy",
	[private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING] = "Blacksmithing",
	[private.LOCALIZED_PROFESSION_NAMES.COOKING] = "Cooking",
	[private.LOCALIZED_PROFESSION_NAMES.ENCHANTING] = "Enchanting",
	[private.LOCALIZED_PROFESSION_NAMES.ENGINEERING] = "Engineering",
	[private.LOCALIZED_PROFESSION_NAMES.FIRSTAID] = "FirstAid",
	[private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION] = "Inscription",
	[private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING] = "Jewelcrafting",
	[private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING] = "Leatherworking",
	[private.LOCALIZED_PROFESSION_NAMES.SMELTING] = "Smelting",
	[private.LOCALIZED_PROFESSION_NAMES.TAILORING] = "Tailoring",
}

private.PROFESSION_IDS = {}

for index = 1, #private.ORDERED_PROFESSIONS do
	private.PROFESSION_IDS[private.ORDERED_PROFESSIONS[index]] = index
end

private.PROFESSION_TEXTURES = {
	[[Trade_Alchemy]],			-- 01 (Alchemy)
	[[Trade_BlackSmithing]],		-- 02 (Blacksmithing)
	[[INV_Misc_Food_15]],			-- 03 (Cooking)
	[[Trade_Engraving]],			-- 04 (Enchinting)
	[[Trade_Engineering]],			-- 05 (Engineering)
	[[Spell_Holy_SealOfSacrifice]],		-- 06 (First Aid)
	[[INV_Inscription_Tradeskill01]],	-- 07 (Inscription)
	[[INV_Misc_Gem_01]],			-- 08 (Jewelcrafting)
	[[Trade_LeatherWorking]],		-- 09 (Leatherworking)
	[[Spell_Fire_FlameBlades]],		-- 10 (Smelting)
	[[Trade_Tailoring]],			-- 11 (Tailoring)
}

-------------------------------------------------------------------------------
-- Item qualities.
-------------------------------------------------------------------------------
private.ITEM_QUALITY_NAMES = {
	[1] = "COMMON",
	[2] = "UNCOMMON",
	[3] = "RARE",
	[4] = "EPIC",
	[5] = "LEGENDARY",
	[6] = "ARTIFACT",
}

private.ITEM_QUALITIES = {}
constants.ITEM_QUALITIES = private.ITEM_QUALITIES

for index = 1, #private.ITEM_QUALITY_NAMES do
	private.ITEM_QUALITIES[private.ITEM_QUALITY_NAMES[index]] = index
end

-------------------------------------------------------------------------------
-- Game/expansion versions.
-------------------------------------------------------------------------------
private.GAME_VERSION_NAMES = {
	[1] = "ORIG",
	[2] = "TBC",
	[3] = "WOTLK",
	[4] = "CATA",
	[5] = "MOP",
}

private.GAME_VERSIONS = {}
constants.GAME_VERSIONS = private.GAME_VERSIONS

for index = 1, #private.GAME_VERSION_NAMES do
	private.GAME_VERSIONS[private.GAME_VERSION_NAMES[index]] = index
end

private.EXPANSION_FILTERS = {}

for index = 1, #private.GAME_VERSION_NAMES do
	private.EXPANSION_FILTERS[index] = ("expansion%d"):format(index - 1)
end

-------------------------------------------------------------------------------
-- Common filter bitfield word 1.
-------------------------------------------------------------------------------
private.COMMON_FLAGS_WORD1 = {
	ALLIANCE	= 0x00000001,	-- 1
	HORDE		= 0x00000002,	-- 2
	TRAINER		= 0x00000004,	-- 3
	VENDOR		= 0x00000008,	-- 4
	INSTANCE	= 0x00000010,	-- 5
	RAID		= 0x00000020,	-- 6
	WORLD_EVENTS	= 0x00000040,	-- 7
	QUEST		= 0x00000080,	-- 8
	PVP		= 0x00000100,	-- 9
	WORLD_DROP	= 0x00000200,	-- 10
	MOB_DROP	= 0x00000400,	-- 11
	DISC		= 0x00000800,	-- 12
	RETIRED		= 0x00001000,	-- 13
	MISC1		= 0x00002000,	-- 14
	UNUSED1		= 0x00004000,	-- 15
	UNUSED2		= 0x00008000,	-- 16
	UNUSED3		= 0x00010000,	-- 17
	UNUSED4		= 0x00020000,	-- 18
	UNUSED5		= 0x00040000,	-- 19
	DPS		= 0x00080000,	-- 20
	TANK		= 0x00100000,	-- 21
	HEALER		= 0x00200000,	-- 22
	CASTER		= 0x00400000,	-- 23
	ACHIEVEMENT	= 0x00800000,	-- 24
	REPUTATION	= 0x01000000,	-- 25
}

-------------------------------------------------------------------------------
-- Class filter bitfield word 1.
-------------------------------------------------------------------------------
private.CLASS_FLAGS_WORD1 = {
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
	MONK	= 0x00000400,	-- 11
}

-------------------------------------------------------------------------------
-- Reputation filter bitfield word 1.
-------------------------------------------------------------------------------
private.REP_FLAGS_WORD1 = {
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
private.REP_FLAGS_WORD2 = {
	ASHEN_VERDICT		= 0x00000001,	-- 1
	CATACOMMON1		= 0x00000002,	-- 2
	CATACOMMON2		= 0x00000004,	-- 3
	GUARDIANS		= 0x00000008,	-- 4
	RAMKAHEN		= 0x00000010,	-- 5
	EARTHEN_RING		= 0x00000020,	-- 6
	THERAZANE		= 0x00000040,	-- 7
	FORESTHOZEN		= 0X00000080,	-- 8
	GOLDENLOTUS		= 0X00000100,	-- 9
	CLOUDSERPENT		= 0X00000200,	-- 10
	PEARLFINJINYU		= 0X00000400,	-- 11
	SHADOPAN		= 0X00000800,	-- 12
	ANGLERS			= 0X00001000,	-- 13
	AUGUSTCELESTIALS	= 0X00002000,	-- 14
	BREWMASTERS		= 0X00004000,	-- 15
	KLAXXI			= 0X00008000,	-- 16
	LOREWALKERS		= 0X00010000,	-- 17
	TILLERS			= 0X00020000,	-- 18
	BLACKPRINCE		= 0X00040000,	-- 19
	SHANGXIACADEMY		= 0X00080000,	-- 20
	PANDACOMMON1		= 0X00100000,	-- 21
}

-------------------------------------------------------------------------------
-- Item filter bitfield word 1.
-------------------------------------------------------------------------------
private.ITEM_FLAGS_WORD1 = {
	--	UNUSED	= 0x00000001 -- 1
}

private.FLAG_WORDS = {
	private.COMMON_FLAGS_WORD1,
	private.CLASS_FLAGS_WORD1,
	private.REP_FLAGS_WORD1,
	private.REP_FLAGS_WORD2,
	private.ITEM_FLAGS_WORD1,
}

-- Member names within a recipe's flags table.
private.FLAG_MEMBERS = {
	"common1",
	"class1",
	"reputation1",
	"reputation2",
	"item1",
}

private.FILTER_STRINGS = {}

for index = 1, #private.FLAG_WORDS do
	for flag_name in pairs(private.FLAG_WORDS[index]) do
		private.FILTER_STRINGS[#private.FILTER_STRINGS + 1] = flag_name
	end
end

private.FILTER_IDS = {}
constants.FILTER_IDS = private.FILTER_IDS

for index = 1, #private.FILTER_STRINGS do
	private.FILTER_IDS[private.FILTER_STRINGS[index]] = index
end

-------------------------------------------------------------------------------
-- Item filter types.
-------------------------------------------------------------------------------
private.ITEM_FILTER_TYPES = {
	-------------------------------------------------------------------------------
	-- Alchemy
	-------------------------------------------------------------------------------
	ALCHEMY_CAULDRON = true,
	ALCHEMY_ELIXIR = true,
	ALCHEMY_FLASK = true,
	ALCHEMY_MISC = true,
	ALCHEMY_OIL = true,
	ALCHEMY_POTION = true,
	ALCHEMY_TRANSMUTE = true,
	ALCHEMY_TRINKET = true,
	ALCHEMY_MOUNT = true,
	-------------------------------------------------------------------------------
	-- Blacksmithing
	-------------------------------------------------------------------------------
	BLACKSMITHING_CHEST = true,
	BLACKSMITHING_DAGGER = true,
	BLACKSMITHING_FEET = true,
	BLACKSMITHING_HANDS = true,
	BLACKSMITHING_HEAD = true,
	BLACKSMITHING_ITEM_ENHANCEMENT = true,
	BLACKSMITHING_LEGS = true,
	BLACKSMITHING_MATERIALS = true,
	BLACKSMITHING_ONE_HAND_AXE = true,
	BLACKSMITHING_ONE_HAND_MACE = true,
	BLACKSMITHING_ONE_HAND_SWORD = true,
	BLACKSMITHING_POLEARM = true,
	BLACKSMITHING_ROD = true,
	BLACKSMITHING_SHIELD = true,
	BLACKSMITHING_SHOULDER = true,
	BLACKSMITHING_SKELETON_KEY = true,
	BLACKSMITHING_THROWN = true,
	BLACKSMITHING_TWO_HAND_AXE = true,
	BLACKSMITHING_TWO_HAND_MACE = true,
	BLACKSMITHING_TWO_HAND_SWORD = true,
	BLACKSMITHING_WAIST = true,
	BLACKSMITHING_WRIST = true,
	-------------------------------------------------------------------------------
	-- Enchanting
	-------------------------------------------------------------------------------
	ENCHANTING_BOOTS = true,
	ENCHANTING_BRACER = true,
	ENCHANTING_CHEST = true,
	ENCHANTING_CLOAK = true,
	ENCHANTING_GLOVES = true,
	ENCHANTING_RING = true,
	ENCHANTING_SHIELD = true,
	ENCHANTING_WEAPON = true,
	ENCHANTING_2H_WEAPON = true,
	ENCHANTING_STAFF = true,
	ENCHANTING_OIL = true,
	ENCHANTING_ROD = true,
	ENCHANTING_WAND = true,
	ENCHANTING_MISC = true,
	-------------------------------------------------------------------------------
	-- Engineering
	-------------------------------------------------------------------------------
	ENGINEERING_BACK = true,
	ENGINEERING_BAG = true,
	ENGINEERING_BOW = true,
	ENGINEERING_CREATED_ITEM = true,
	ENGINEERING_CROSSBOW = true,
	ENGINEERING_FEET = true,
	ENGINEERING_GUN = true,
	ENGINEERING_HEAD = true,
	ENGINEERING_ITEM_ENHANCEMENT = true,
	ENGINEERING_MAIN_HAND = true,
	ENGINEERING_MATERIALS = true,
	ENGINEERING_MOUNT = true,
	ENGINEERING_NECK = true,
	ENGINEERING_PET = true,
	ENGINEERING_SHIELD = true,
	ENGINEERING_TRINKET = true,
	-------------------------------------------------------------------------------
	-- Inscription
	-------------------------------------------------------------------------------
	INSCRIPTION_CREATED_ITEM = true,
	INSCRIPTION_ITEM_ENHANCEMENT = true,
	INSCRIPTION_MAJOR_GLYPH = true,
	INSCRIPTION_MATERIALS = true,
	INSCRIPTION_MINOR_GLYPH = true,
	INSCRIPTION_OFF_HAND = true,
	INSCRIPTION_STAFF = true,
	INSCRIPTION_SCROLL = true,
	INSCRIPTION_PET = true,
	INSCRIPTION_TRINKET = true,
	-------------------------------------------------------------------------------
	-- Jewelcrafting
	-------------------------------------------------------------------------------
	JEWELCRAFTING_CREATED_ITEM = true,
	JEWELCRAFTING_FIST_WEAPON = true,
	JEWELCRAFTING_HEAD = true,
	JEWELCRAFTING_MATERIALS = true,
	JEWELCRAFTING_NECK = true,
	JEWELCRAFTING_RING = true,
	JEWELCRAFTING_TRINKET = true,
	JEWELCRAFTING_GEM_BLUE = true,
	JEWELCRAFTING_GEM_GREEN = true,
	JEWELCRAFTING_GEM_META = true,
	JEWELCRAFTING_GEM_ORANGE = true,
	JEWELCRAFTING_GEM_PRISMATIC = true,
	JEWELCRAFTING_GEM_PURPLE = true,
	JEWELCRAFTING_GEM_RED = true,
	JEWELCRAFTING_GEM_YELLOW = true,
	JEWELCRAFTING_MOUNT = true,
	JEWELCRAFTING_PET = true,
	-------------------------------------------------------------------------------
	-- Leatherworking
	-------------------------------------------------------------------------------
	LEATHERWORKING_BACK = true,
	LEATHERWORKING_BAG = true,
	LEATHERWORKING_CHEST = true,
	LEATHERWORKING_CREATED_ITEM = true,
	LEATHERWORKING_FEET = true,
	LEATHERWORKING_HANDS = true,
	LEATHERWORKING_HEAD = true,
	LEATHERWORKING_ITEM_ENHANCEMENT = true,
	LEATHERWORKING_LEGS = true,
	LEATHERWORKING_MATERIALS = true,
	LEATHERWORKING_SHIELD = true,
	LEATHERWORKING_SHOULDER = true,
	LEATHERWORKING_THROWN = true,
	LEATHERWORKING_WAIST = true,
	LEATHERWORKING_WRIST = true,
	-------------------------------------------------------------------------------
	-- Tailoring
	-------------------------------------------------------------------------------
	TAILORING_BACK = true,
	TAILORING_BAG = true,
	TAILORING_CHEST = true,
	TAILORING_FEET = true,
	TAILORING_HANDS = true,
	TAILORING_HEAD = true,
	TAILORING_ITEM_ENHANCEMENT = true,
	TAILORING_LEGS = true,
	TAILORING_MATERIALS = true,
	TAILORING_MISC = true,
	TAILORING_SHIRT = true,
	TAILORING_SHOULDER = true,
	TAILORING_WAIST = true,
	TAILORING_WRIST = true,
}

-------------------------------------------------------------------------------
-- Reputation levels.
-------------------------------------------------------------------------------
private.REP_LEVEL_STRINGS = {
	[1]	= "FRIENDLY",
	[2]	= "HONORED",
	[3]	= "REVERED",
	[4]	= "EXALTED",
}

private.REP_LEVELS = {}
constants.REP_LEVELS = private.REP_LEVELS

for index = 1, #private.REP_LEVEL_STRINGS do
	private.REP_LEVELS[private.REP_LEVEL_STRINGS[index]] = index
end

-------------------------------------------------------------------------------
-- Factions.
-------------------------------------------------------------------------------
private.FACTION_STRINGS = {
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
	[1050]  = "VALLIANCE",
	[1052]	= "HORDE_EXPEDITION",
	[1064]  = "TAUNKA",
	[1067]  = "HAND_VENGANCE",
	[1068]	= "EXPLORERS_LEAGUE",
	[1073]	= "KALUAK",
	[1077]	= "SHATTEREDSUN",
	[1085]  = "WARSONG",
	[1090]	= "KIRINTOR",
	[1091]	= "WYRMREST",
	[1094]  = "SILVER_COVENANT",
	[1098]	= "EBONBLADE",
	[1104]	= "FRENZYHEART",
	[1105]	= "ORACLES",
	[1106]	= "ARGENTCRUSADE",
	[1119]	= "HODIR",
	[1124]  = "SUNREAVERS",
	[1136]  = "FROSTBORN",
	[1156]	= "ASHEN_VERDICT",
	[1135]	= "EARTHEN_RING",
	[1158]	= "GUARDIANS",
	[1171]	= "THERAZANE",
	[1172]	= "DRAGONMAW",
	[1173]	= "RAMKAHEN",
	[1174]	= "WILDHAMMER",
	[1177]	= "WARDENS",
	[1178]	= "HELLSCREAM",
	[1216]	=  "SHANGXIACADEMY",
	[1228]	=  "FORESTHOZEN",
	[1242]	=  "PEARLFINJINYU",
	[1269]	=  "GOLDENLOTUS",
	[1270]	=  "SHADOPAN",
	[1271]	=  "CLOUDSERPENT",
	[1272]	=  "TILLERS",
	[1273]	=  "JOGU_THE_DRUNK",
	[1275]	=  "ELLA",
	[1276]	=  "OLD_HILLPAW",
	[1277]	=  "CHEE_CHEE",
	[1278]	=  "SHO",
	[1279]	=  "HAOHAN_MUDCLAW",
	[1280]	=  "TINA_MUDCLAW",
	[1281]	=  "GINA_MUDCLAW",
	[1282]	=  "FISH_FELLREED",
	[1283]	=  "FARMER_FUNG",
	[1302]	=  "ANGLERS",
	[1337]	=  "KLAXXI",
	[1341]	=  "AUGUSTCELESTIALS",
	[1345]	=  "LOREWALKERS",
	[1351]	=  "BREWMASTERS",
	[1352]	=  "HUOJINPANDAREN",
	[1353]	=  "TUSHUIPANDAREN",
	[1358]	=  "NAT_PAGLE",
	[1359]	=  "BLACKPRINCE",
}

private.LOCALIZED_FACTION_STRINGS = {
	["Neutral"]	= _G.FACTION_STANDING_LABEL4,
	["Friendly"]	= _G.FACTION_STANDING_LABEL5,
	["Honored"]	= _G.FACTION_STANDING_LABEL6,
	["Revered"]	= _G.FACTION_STANDING_LABEL7,
	["Exalted"]	= _G.FACTION_STANDING_LABEL8,
	["Horde"] = _G.GetFactionInfoByID(67),
	["Alliance"] = _G.GetFactionInfoByID(469),
	["Thorium Brotherhood"] = _G.GetFactionInfoByID(59),
	["Zandalar Tribe"] = _G.GetFactionInfoByID(270),
	["Argent Dawn"] = _G.GetFactionInfoByID(529),
	["Timbermaw Hold"] = _G.GetFactionInfoByID(576),
	["Wintersaber Trainers"] = _G.GetFactionInfoByID(589),
	["Cenarion Circle"] = _G.GetFactionInfoByID(609),
	["The Aldor"] = _G.GetFactionInfoByID(932),
	["The Consortium"] = _G.GetFactionInfoByID(933),
	["The Scryers"] = _G.GetFactionInfoByID(934),
	["The Sha'tar"] = _G.GetFactionInfoByID(935),
	["The Mag'har"] = _G.GetFactionInfoByID(941),
	["Cenarion Expedition"] = _G.GetFactionInfoByID(942),
	["Honor Hold"] = _G.GetFactionInfoByID(946),
	["Thrallmar"] = _G.GetFactionInfoByID(947),
	["The Violet Eye"] = _G.GetFactionInfoByID(967),
	["Sporeggar"] = _G.GetFactionInfoByID(970),
	["Kurenai"] = _G.GetFactionInfoByID(978),
	["Keepers of Time"] = _G.GetFactionInfoByID(989),
	["The Scale of the Sands"] = _G.GetFactionInfoByID(990),
	["Lower City"] = _G.GetFactionInfoByID(1011),
	["Ashtongue Deathsworn"] = _G.GetFactionInfoByID(1012),
	["Alliance Vanguard"] = _G.GetFactionInfoByID(1037),
	["Valiance Expedition"] = _G.GetFactionInfoByID(1050),
	["Horde Expedition"] = _G.GetFactionInfoByID(1052),
	["The Taunka"] = _G.GetFactionInfoByID(1064),
	["The Hand of Vengeance"] = _G.GetFactionInfoByID(1067),
	["Explorers' League"] = _G.GetFactionInfoByID(1068),
	["The Kalu'ak"] = _G.GetFactionInfoByID(1073),
	["Shattered Sun Offensive"] = _G.GetFactionInfoByID(1077),
	["Warsong Offensive"] = _G.GetFactionInfoByID(1085),
	["Kirin Tor"] = _G.GetFactionInfoByID(1090),
	["The Wyrmrest Accord"] = _G.GetFactionInfoByID(1091),
	["The Silver Covenant"] = _G.GetFactionInfoByID(1094),
	["Knights of the Ebon Blade"] = _G.GetFactionInfoByID(1098),
	["Frenzyheart Tribe"] = _G.GetFactionInfoByID(1104),
	["The Oracles"] = _G.GetFactionInfoByID(1105),
	["Argent Crusade"] = _G.GetFactionInfoByID(1106),
	["The Sons of Hodir"] = _G.GetFactionInfoByID(1119),
	["The Sunreavers"] = _G.GetFactionInfoByID(1124),
	["The Earthen Ring"] = _G.GetFactionInfoByID(1135),
	["Tranquillien Conversion"] = _G.GetFactionInfoByID(1136),
	["The Ashen Verdict"] = _G.GetFactionInfoByID(1156),
	["Guardians of Hyjal"] = _G.GetFactionInfoByID(1158),
	["Therazane"] = _G.GetFactionInfoByID(1171),
	["Dragonmaw Clan"] = _G.GetFactionInfoByID(1172),
	["Ramkahen"] = _G.GetFactionInfoByID(1173),
	["Wildhammer Clan"] = _G.GetFactionInfoByID(1174),
	["Baradin's Wardens"] = _G.GetFactionInfoByID(1177),
	["Hellscream's Reach"] = _G.GetFactionInfoByID(1178),
	["Shang Xi's Academy"] = _G.GetFactionInfoByID(1216),
	["Forest Hozen"] = _G.GetFactionInfoByID(1228),
	["Pearlfin Jinyu"] = _G.GetFactionInfoByID(1242),
	["Golden Lotus"] = _G.GetFactionInfoByID(1269),
	["Shado-Pan"] = _G.GetFactionInfoByID(1270),
	["Order of the Cloud Serpent"] = _G.GetFactionInfoByID(1271),
	["The Tillers"] = _G.GetFactionInfoByID(1272),
	["Jogu the Drunk"] = _G.GetFactionInfoByID(1273),
	["Ella"] = _G.GetFactionInfoByID(1275),
	["Old Hillpaw"] = _G.GetFactionInfoByID(1276),
	["Chee Chee"] = _G.GetFactionInfoByID(1277),
	["Sho"] = _G.GetFactionInfoByID(1278),
	["Haohan Mudclaw"] = _G.GetFactionInfoByID(1279),
	["Tina Mudclaw"] = _G.GetFactionInfoByID(1280),
	["Gina Mudclaw"] = _G.GetFactionInfoByID(1281),
	["Fish Fellreed"] = _G.GetFactionInfoByID(1282),
	["Farmer Fung"] = _G.GetFactionInfoByID(1283),
	["The Anglers"] = _G.GetFactionInfoByID(1302),
	["The Klaxxi"] = _G.GetFactionInfoByID(1337),
	["The August Celestials"] = _G.GetFactionInfoByID(1341),
	["The Lorewalkers"] = _G.GetFactionInfoByID(1345),
	["The Brewmasters"] = _G.GetFactionInfoByID(1351),
	["Huojin Pandaren"] = _G.GetFactionInfoByID(1352),
	["Tushui Pandaren"] = _G.GetFactionInfoByID(1353),
	["Nat Pagle"] = _G.GetFactionInfoByID(1358),
	["The Black Prince"] = _G.GetFactionInfoByID(1359),
}

private.FACTION_IDS = {}
constants.FACTION_IDS = private.FACTION_IDS

for id, name in pairs(private.FACTION_STRINGS) do
	private.FACTION_IDS[name] = id
end

-------------------------------------------------------------------------------
-- Zones.
-------------------------------------------------------------------------------
private.ZONE_NAMES = {
	DUROTAR = _G.GetMapNameByID(4),
	MULGORE = _G.GetMapNameByID(9),
	NORTHERN_BARRENS = _G.GetMapNameByID(11),
	ARATHI_HIGHLANDS = _G.GetMapNameByID(16),
	BADLANDS = _G.GetMapNameByID(17),
	BLASTED_LANDS = _G.GetMapNameByID(19),
	TIRISFAL_GLADES = _G.GetMapNameByID(20),
	SILVERPINE_FOREST = _G.GetMapNameByID(21),
	WESTERN_PLAGUELANDS = _G.GetMapNameByID(22),
	EASTERN_PLAGUELANDS = _G.GetMapNameByID(23),
	HILLSBRAD_FOOTHILLS = _G.GetMapNameByID(24),
	THE_HINTERLANDS = _G.GetMapNameByID(26),
	DUN_MOROGH = _G.GetMapNameByID(27),
	SEARING_GORGE = _G.GetMapNameByID(28),
	BURNING_STEPPES = _G.GetMapNameByID(29),
	ELWYNN_FOREST = _G.GetMapNameByID(30),
	DEADWIND_PASS = _G.GetMapNameByID(32),
	DUSKWOOD = _G.GetMapNameByID(34),
	LOCH_MODAN = _G.GetMapNameByID(35),
	REDRIDGE_MOUNTAINS = _G.GetMapNameByID(36),
	NORTHERN_STRANGLETHORN = _G.GetMapNameByID(37),
	SWAMP_OF_SORROWS = _G.GetMapNameByID(38),
	WESTFALL = _G.GetMapNameByID(39),
	WETLANDS = _G.GetMapNameByID(40),
	TELDRASSIL = _G.GetMapNameByID(41),
	DARKSHORE = _G.GetMapNameByID(42),
	ASHENVALE = _G.GetMapNameByID(43),
	THOUSAND_NEEDLES = _G.GetMapNameByID(61),
	STONETALON_MOUNTAINS = _G.GetMapNameByID(81),
	DESOLACE = _G.GetMapNameByID(101),
	FERALAS = _G.GetMapNameByID(121),
	TANARIS = _G.GetMapNameByID(161),
	AZSHARA = _G.GetMapNameByID(181),
	FELWOOD = _G.GetMapNameByID(182),
	UNGORO_CRATER = _G.GetMapNameByID(201),
	MOONGLADE = _G.GetMapNameByID(241),
	SILITHUS = _G.GetMapNameByID(261),
	WINTERSPRING = _G.GetMapNameByID(281),
	STORMWIND_CITY = _G.GetMapNameByID(301),
	ORGRIMMAR = _G.GetMapNameByID(321),
	IRONFORGE = _G.GetMapNameByID(341),
	THUNDER_BLUFF = _G.GetMapNameByID(362),
	DARNASSUS = _G.GetMapNameByID(381),
	UNDERCITY = _G.GetMapNameByID(382),
	EVERSONG_WOODS = _G.GetMapNameByID(462),
	GHOSTLANDS = _G.GetMapNameByID(463),
	AZUREMYST_ISLE = _G.GetMapNameByID(464),
	HELLFIRE_PENINSULA = _G.GetMapNameByID(465),
	ZANGARMARSH = _G.GetMapNameByID(467),
	THE_EXODAR = _G.GetMapNameByID(471),
	SHADOWMOON_VALLEY = _G.GetMapNameByID(473),
	BLADES_EDGE_MOUNTAINS = _G.GetMapNameByID(475),
	BLOODMYST_ISLE = _G.GetMapNameByID(476),
	NAGRAND = _G.GetMapNameByID(477),
	TEROKKAR_FOREST = _G.GetMapNameByID(478),
	NETHERSTORM = _G.GetMapNameByID(479),
	SILVERMOON_CITY = _G.GetMapNameByID(480),
	SHATTRATH_CITY = _G.GetMapNameByID(481),
	BOREAN_TUNDRA = _G.GetMapNameByID(486),
	DRAGONBLIGHT = _G.GetMapNameByID(488),
	GRIZZLY_HILLS = _G.GetMapNameByID(490),
	HOWLING_FJORD = _G.GetMapNameByID(491),
	ICECROWN = _G.GetMapNameByID(492),
	SHOLAZAR_BASIN = _G.GetMapNameByID(493),
	THE_STORM_PEAKS = _G.GetMapNameByID(495),
	ZULDRAK = _G.GetMapNameByID(496),
	ISLE_OF_QUELDANAS = _G.GetMapNameByID(499),
	WINTERGRASP = _G.GetMapNameByID(501),
	DALARAN = _G.GetMapNameByID(504),
	THE_NEXUS = _G.GetMapNameByID(520),
	AHNKAHET_THE_OLD_KINGDOM = _G.GetMapNameByID(522),
	UTGARDE_KEEP = _G.GetMapNameByID(523),
	UTGARDE_PINNACLE = _G.GetMapNameByID(524),
	HALLS_OF_LIGHTNING = _G.GetMapNameByID(525),
	HALLS_OF_STONE = _G.GetMapNameByID(526),
	THE_OCULUS = _G.GetMapNameByID(528),
	ULDUAR = _G.GetMapNameByID(529),
	AZJOL_NERUB = _G.GetMapNameByID(533),
	DRAKTHARON_KEEP = _G.GetMapNameByID(534),
	THE_VIOLET_HOLD = _G.GetMapNameByID(536),
	GILNEAS = _G.GetMapNameByID(539),
	TRIAL_OF_THE_CRUSADER = _G.GetMapNameByID(543),
	THE_LOST_ISLES = _G.GetMapNameByID(544),
	ICECROWN_CITADEL = _G.GetMapNameByID(604),
	MOUNT_HYJAL = _G.GetMapNameByID(606),
	SOUTHERN_BARRENS = _G.GetMapNameByID(607),
	VASHJIR = _G.GetMapNameByID(613),
	ABYSSAL_DEPTHS = _G.GetMapNameByID(614),
	DEEPHOLM = _G.GetMapNameByID(640),
	THE_CAPE_OF_STRANGLETHORN = _G.GetMapNameByID(673),
	THE_TEMPLE_OF_ATALHAKKAR = _G.GetMapNameByID(687),
	GNOMEREGAN = _G.GetMapNameByID(691),
	ULDAMAN = _G.GetMapNameByID(692),
	MOLTEN_CORE = _G.GetMapNameByID(696),
	DIRE_MAUL = _G.GetMapNameByID(699),
	BLACKROCK_DEPTHS = _G.GetMapNameByID(704),
	THE_SHATTERED_HALLS = _G.GetMapNameByID(710),
	RUINS_OF_AHNQIRAJ = _G.GetMapNameByID(717),
	ONYXIAS_LAIR = _G.GetMapNameByID(718),
	ULDUM = _G.GetMapNameByID(720),
	BLACKROCK_SPIRE = _G.GetMapNameByID(721),
	AUCHENAI_CRYPTS = _G.GetMapNameByID(722),
	SETHEKK_HALLS = _G.GetMapNameByID(723),
	SHADOW_LABYRINTH = _G.GetMapNameByID(724),
	THE_STEAMVAULT = _G.GetMapNameByID(727),
	THE_SLAVE_PENS = _G.GetMapNameByID(728),
	THE_BOTANICA = _G.GetMapNameByID(729),
	THE_MECHANAR = _G.GetMapNameByID(730),
	THE_ARCATRAZ = _G.GetMapNameByID(731),
	MANA_TOMBS = _G.GetMapNameByID(732),
	THE_BLACK_MORASS = _G.GetMapNameByID(733),
	OLD_HILLSBRAD_FOOTHILLS = _G.GetMapNameByID(734),
	WAILING_CAVERNS = _G.GetMapNameByID(749),
	BLACKWING_LAIR = _G.GetMapNameByID(755),
	THE_DEADMINES = _G.GetMapNameByID(756),
	RAZORFEN_DOWNS = _G.GetMapNameByID(760),
	STRATHOLME = _G.GetMapNameByID(765),
	AHNQIRAJ = _G.GetMapNameByID(766),
	TWILIGHT_HIGHLANDS = _G.GetMapNameByID(770),
	AHNQIRAJ_THE_FALLEN_KINGDOM = _G.GetMapNameByID(772),
	HYJAL_SUMMIT = _G.GetMapNameByID(775),
	SERPENTSHRINE_CAVERN = _G.GetMapNameByID(780),
	TEMPEST_KEEP = _G.GetMapNameByID(782),
	SUNWELL_PLATEAU = _G.GetMapNameByID(789),
	MOLTEN_FRONT = _G.GetMapNameByID(795),
	BLACK_TEMPLE = _G.GetMapNameByID(796),
	MAGISTERS_TERRACE = _G.GetMapNameByID(798),
	KARAZHAN = _G.GetMapNameByID(799),
	FIRELANDS = _G.GetMapNameByID(800),
	VALLEY_OF_THE_FOUR_WINDS = _G.GetMapNameByID(807),
	THE_WANDERING_ISLE = _G.GetMapNameByID(808),
	TOWNLONG_STEPPES = _G.GetMapNameByID(810),
	VALE_OF_ETERNAL_BLOSSOMS = _G.GetMapNameByID(811),
	DARKMOON_ISLAND = _G.GetMapNameByID(823),
	DRAGON_SOUL = _G.GetMapNameByID(824),
	DUSTWALLOW_MARSH = _G.GetMapNameByID(851),
	KRASARANG_WILDS = _G.GetMapNameByID(857),
	DREAD_WASTES = _G.GetMapNameByID(858),
	THE_VEILED_STAIR = _G.GetMapNameByID(873),
	KUN_LAI_SUMMIT = _G.GetMapNameByID(879),
	THE_JADE_FOREST = _G.GetMapNameByID(880),
	TERRACE_OF_ENDLESS_SPRING = _G.GetMapNameByID(886),
	NEW_TINKERTOWN = _G.GetMapNameByID(895),
	MOGUSHAN_VAULTS = _G.GetMapNameByID(896),
	HEART_OF_FEAR = _G.GetMapNameByID(897),
	SCHOLOMANCE = _G.GetMapNameByID(898),
	SHRINE_OF_TWO_MOONS = _G.GetMapNameByID(903),
	SHRINE_OF_SEVEN_STARS = _G.GetMapNameByID(905),
	ISLE_OF_THUNDER = _G.GetMapNameByID(928),
	TIMELESS_ISLE = _G.GetMapNameByID(951),
}

constants.ZONE_NAMES = private.ZONE_NAMES

do
	local continent_names = { _G.GetMapContinents() }

	private.ZONE_NAMES.KALIMDOR = continent_names[1]
	private.ZONE_NAMES.EASTERN_KINGDOMS = continent_names[2]
	private.ZONE_NAMES.OUTLAND = continent_names[3]
	private.ZONE_NAMES.NORTHREND = continent_names[4]
	private.ZONE_NAMES.THE_MAELSTROM = continent_names[5]
	private.ZONE_NAMES.PANDARIA = continent_names[6]
end

private.ZONE_LABELS_FROM_NAME = {}

for label, name in pairs(private.ZONE_NAMES) do
	private.ZONE_LABELS_FROM_NAME[name] = label
end

-------------------------------------------------------------------------------
-- Boss names.
-------------------------------------------------------------------------------
private.BOSS_NAMES = {
	LORD_ROCCOR = _G.EJ_GetEncounterInfo(370),
	PYROMANCER_LOREGRAIN = _G.EJ_GetEncounterInfo(373),
	GOLEM_LORD_ARGELMACH = _G.EJ_GetEncounterInfo(379),
	RIBBLY_SCREWSPIGOT = _G.EJ_GetEncounterInfo(382),
	PLUGGER_SPAZZRING = _G.EJ_GetEncounterInfo(383),
	QUARTERMASTER_ZIGRIS = _G.EJ_GetEncounterInfo(393),
	SOLAKAR_FLAMEWREATH = _G.EJ_GetEncounterInfo(398),
	GENERAL_DRAKKISATH = _G.EJ_GetEncounterInfo(401),
	MAGISTER_KALENDRIS = _G.EJ_GetEncounterInfo(408),
	MEKGINEER_THERMAPLUGG = _G.EJ_GetEncounterInfo(422),
	BALNAZZAR = _G.EJ_GetEncounterInfo(449),
	MALEKI_THE_PALLID = _G.EJ_GetEncounterInfo(453),
	PRIESTESS_DELRISSA = _G.EJ_GetEncounterInfo(532),
	KAELTHAS_SUNSTRIDER = _G.EJ_GetEncounterInfo(533),
	NEXUS_PRINCE_SHAFFAR = _G.EJ_GetEncounterInfo(537),
	CAPTAIN_SKARLOC = _G.EJ_GetEncounterInfo(539),
	EPOCH_HUNTER = _G.EJ_GetEncounterInfo(540),
	DARKWEAVER_SYTH = _G.EJ_GetEncounterInfo(541),
	BLACKHEART_THE_INCITER = _G.EJ_GetEncounterInfo(545),
	MURMUR = _G.EJ_GetEncounterInfo(547),
	DALLIAH_THE_DOOMSAYER = _G.EJ_GetEncounterInfo(549),
	HIGH_BOTANIST_FREYWINN = _G.EJ_GetEncounterInfo(559),
	THORNGRIN_THE_TENDER = _G.EJ_GetEncounterInfo(560),
	WARP_SPLINTER = _G.EJ_GetEncounterInfo(562),
	MECHANO_LORD_CAPACITUS = _G.EJ_GetEncounterInfo(563),
	NETHERMANCER_SEPETHREA = _G.EJ_GetEncounterInfo(564),
	PATHALEON_THE_CALCULATOR = _G.EJ_GetEncounterInfo(565),
	GRAND_WARLOCK_NETHEKURSE = _G.EJ_GetEncounterInfo(566),
	MEKGINEER_STEAMRIGGER = _G.EJ_GetEncounterInfo(574),
	WARLORD_KALITHRESH = _G.EJ_GetEncounterInfo(575),
	HERALD_VOLAZJ = _G.EJ_GetEncounterInfo(584),
	LOKEN = _G.EJ_GetEncounterInfo(600),
	LEY_GUARDIAN_EREGOS = _G.EJ_GetEncounterInfo(625),
	INGVAR_THE_PLUNDERER = _G.EJ_GetEncounterInfo(640),
	KING_YMIRON = _G.EJ_GetEncounterInfo(644),
	JANDICE_BAROV = _G.EJ_GetEncounterInfo(663),
	DARKMASTER_GANDLING = _G.EJ_GetEncounterInfo(684),
}

-------------------------------------------------------------------------------
-- Colors.
-------------------------------------------------------------------------------

-- Utility function for adding new colors.
--function HexToRGB(hex)
--	hex = hex:gsub("#", "")
--	return tonumber("0x" .. hex:sub(1, 2)) / 255, tonumber("0x" .. hex:sub(3, 4)) / 255, tonumber("0x" .. hex:sub(5, 6)) / 255
--end

local function CreateColorTable(dict)
	local r, g, b = dict.r, dict.g, dict.b
	return { hex = ("%02x%02x%02x"):format(r * 255, g * 255, b * 255), r = r, g = g, b = b }
end

private.REPUTATION_COLORS = {
	exalted		= CreateColorTable(_G.FACTION_BAR_COLORS[8]),
	revered		= CreateColorTable(_G.FACTION_BAR_COLORS[7]),
	honored		= CreateColorTable(_G.FACTION_BAR_COLORS[6]),
	friendly	= CreateColorTable(_G.FACTION_BAR_COLORS[5]),
	neutral		= CreateColorTable(_G.FACTION_BAR_COLORS[4]),
	unfriendly	= CreateColorTable(_G.FACTION_BAR_COLORS[3]),
	hostile		= CreateColorTable(_G.FACTION_BAR_COLORS[2]),
	hated		= CreateColorTable(_G.FACTION_BAR_COLORS[1]),
}

-- Recipe difficulty colors.
private.DIFFICULTY_COLORS = {
	trivial		= { hex = "808080",	r = 0.50,	g = 0.50,	b = 0.50 },
	easy		= { hex = "40bf40",	r = 0.25,	g = 0.75,	b = 0.25 },
	medium		= { hex = "ffff00",	r = 1,		g = 1,		b = 0 },
	optimal		= { hex = "ff8040",	r = 1,		g = 0.50,	b = 0.25 },
	impossible	= { hex = "ff0000",	r = 1,		g = 0,		b = 0 },
}

private.BASIC_COLORS = {
	grey	= { hex = "666666",	r = 0.40,	g = 0.40,	b = 0.40 },
	white	= { hex = "ffffff",	r = 1,		g = 1,		b = 1 },
	yellow	= { hex = "ffff00",	r = 1,		g = 1,		b = 0 },
	normal	= { hex = "ffd100",	r = 1,		g = 0.81,	b = 0 },
}

-- Colors used in tooltips and the recipe list.
private.CATEGORY_COLORS = {
	-- Miscellaneous
	coords		= { hex = "d1ce6f",	r = 0.82,	g = 0.81,	b = 0.44 },
	hint		= { hex = "c9c781",	r = 0.79,	g = 0.78,	b = 0.51 },
	location	= { hex = "ffecc1",	r = 1,		g = 0.93,	b = 0.76 },
	repname		= { hex = "6a9ad9",	r = 0.42,	g = 0.60,	b = 0.85 },
}
