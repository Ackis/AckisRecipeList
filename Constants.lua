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
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- General constants.
-------------------------------------------------------------------------------
private.PLAYER_NAME = _G.UnitName("player")
private.REALM_NAME = _G.GetRealmName()

-------------------------------------------------------------------------------
-- Profession data.
-------------------------------------------------------------------------------
-- Needed for Smelting kludge.
private.MINING_PROFESSION_NAME = _G.GetSpellInfo(2575)

private.PROFESSION_SPELL_IDS = {
	ALCHEMY		= 2259,
	BLACKSMITHING	= 2018,
	COOKING		= 2550,
	ENCHANTING	= 7411,
	ENGINEERING	= 4036,
	FIRSTAID	= 3273,
	INSCRIPTION	= 45357,
	JEWELCRAFTING	= 25229,
	LEATHERWORKING	= 2108,
	RUNEFORGING	= 53428,
	SMELTING	= 2656,
	TAILORING	= 3908,
}

private.LOCALIZED_PROFESSION_NAMES = {}

for name, spell_id in pairs(private.PROFESSION_SPELL_IDS) do
	private.LOCALIZED_PROFESSION_NAMES[name] = _G.GetSpellInfo(spell_id)
end

-- Special case for Runeforging is needed because the French translation is non-conforming.
if _G.GetLocale() == "frFR" then
	private.LOCALIZED_PROFESSION_NAMES.RUNEFORGING = "Runeforger"
end

-- This is needed due to Pandaren cooking spells.
private.PROFESSION_NAME_MAP = {
	[_G.GetSpellInfo(124694)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Grill
	[_G.GetSpellInfo(125584)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Wok
	[_G.GetSpellInfo(125586)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Pot
	[_G.GetSpellInfo(125587)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Steamer
	[_G.GetSpellInfo(125588)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Oven
	[_G.GetSpellInfo(125589)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Brew
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
	"runeforging",		-- 10
	"smelting",		-- 11
	"tailoring",		-- 12
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
	private.LOCALIZED_PROFESSION_NAMES.RUNEFORGING,		-- 10
	private.LOCALIZED_PROFESSION_NAMES.SMELTING,		-- 11
	private.LOCALIZED_PROFESSION_NAMES.TAILORING,		-- 12
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
	[[Spell_DeathKnight_FrozenRuneWeapon]],	-- 10 (Runeforging)
	[[Spell_Fire_FlameBlades]],		-- 11 (Smelting)
	[[Trade_Tailoring]],			-- 12 (Tailoring)
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
	HUOJINPANDAREN		= 0X00000200,	-- 10
	CLOUDSERPENT		= 0X00000400,	-- 11
	PEARLFINJINYU		= 0X00000800,	-- 12
	SHADOPAN		= 0X00001000,	-- 13
	ANGLERS			= 0X00002000,	-- 14
	AUGUSTCELESTIALS	= 0X00004000,	-- 15
	BREWMASTERS		= 0X00008000,	-- 16
	KLAXXI			= 0X00010000,	-- 17
	LOREWALKERS		= 0X00020000,	-- 18
	TILLERS			= 0X00040000,	-- 19
	TUSHUIPANDAREN		= 0X00080000,	-- 20
	BLACKPRINCE		= 0X00100000,	-- 21
	SHANGXIACADEMY		= 0x00200000,	-- 22
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
-- Acquire types.
-------------------------------------------------------------------------------
private.ACQUIRE_NAMES = {
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

private.ACQUIRE_STRINGS = {
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

private.ACQUIRE_TYPES = {}

for index = 1, #private.ACQUIRE_STRINGS do
	private.ACQUIRE_TYPES[private.ACQUIRE_STRINGS[index]] = index
end

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
	["PLAYER, Human"] = _G.GetFactionInfoByID(1),
	["PLAYER, Orc"] = _G.GetFactionInfoByID(2),
	["PLAYER, Dwarf"] = _G.GetFactionInfoByID(3),
	["PLAYER, Night Elf"] = _G.GetFactionInfoByID(4),
	["PLAYER, Undead"] = _G.GetFactionInfoByID(5),
	["PLAYER, Tauren "] = _G.GetFactionInfoByID(6),
	["Creature"] = _G.GetFactionInfoByID(7),
	["PLAYER, Gnome"] = _G.GetFactionInfoByID(8),
	["PLAYER, Troll"] = _G.GetFactionInfoByID(9),
	["Monster"] = _G.GetFactionInfoByID(14),
	["Defias Brotherhood"] = _G.GetFactionInfoByID(15),
	["Gnoll - Riverpaw"] = _G.GetFactionInfoByID(16),
	["Gnoll - Redridge"] = _G.GetFactionInfoByID(17),
	["Gnoll - Shadowhide"] = _G.GetFactionInfoByID(18),
	["Murloc"] = _G.GetFactionInfoByID(19),
	["Undead, Scourge"] = _G.GetFactionInfoByID(20),
	["Booty Bay"] = _G.GetFactionInfoByID(21),
	["Beast - Spider"] = _G.GetFactionInfoByID(22),
	["Beast - Boar"] = _G.GetFactionInfoByID(23),
	["Worgen"] = _G.GetFactionInfoByID(24),
	["Kobold"] = _G.GetFactionInfoByID(25),
	["Troll, Bloodscalp"] = _G.GetFactionInfoByID(26),
	["Troll, Skullsplitter"] = _G.GetFactionInfoByID(27),
	["Prey"] = _G.GetFactionInfoByID(28),
	["Beast - Wolf"] = _G.GetFactionInfoByID(29),
	["Defias Brotherhood Traitor"] = _G.GetFactionInfoByID(30),
	["Friendly"] = _G.GetFactionInfoByID(31),
	["Trogg"] = _G.GetFactionInfoByID(32),
	["Troll, Frostmane"] = _G.GetFactionInfoByID(33),
	["Orc, Blackrock"] = _G.GetFactionInfoByID(34),
	["Villian"] = _G.GetFactionInfoByID(35),
	["Victim"] = _G.GetFactionInfoByID(36),
	["Beast - Bear"] = _G.GetFactionInfoByID(37),
	["Ogre"] = _G.GetFactionInfoByID(38),
	["Kurzen's Mercenaries"] = _G.GetFactionInfoByID(39),
	["Escortee"] = _G.GetFactionInfoByID(40),
	["Venture Company"] = _G.GetFactionInfoByID(41),
	["Beast - Raptor"] = _G.GetFactionInfoByID(42),
	["Basilisk"] = _G.GetFactionInfoByID(43),
	["Dragonflight, Green"] = _G.GetFactionInfoByID(44),
	["Lost Ones"] = _G.GetFactionInfoByID(45),
	[" Blacksmithing - Armorsmithing"] = _G.GetFactionInfoByID(46),
	["Ironforge"] = _G.GetFactionInfoByID(47),
	["Dark Iron Dwarves"] = _G.GetFactionInfoByID(48),
	["Human, Night Watch"] = _G.GetFactionInfoByID(49),
	["Dragonflight, Red"] = _G.GetFactionInfoByID(50),
	["Gnoll - Mosshide"] = _G.GetFactionInfoByID(51),
	["Orc, Fel Dragonmaw"] = _G.GetFactionInfoByID(52),
	["Gnome - Leper"] = _G.GetFactionInfoByID(53),
	["Gnomeregan"] = _G.GetFactionInfoByID(54),
	["Leopard"] = _G.GetFactionInfoByID(55),
	["Scarlet Crusade"] = _G.GetFactionInfoByID(56),
	["Gnoll - Rothide"] = _G.GetFactionInfoByID(57),
	["Beast - Gorilla"] = _G.GetFactionInfoByID(58),
	["Thorium Brotherhood"] = _G.GetFactionInfoByID(59),
	["Naga"] = _G.GetFactionInfoByID(60),
	["Dalaran"] = _G.GetFactionInfoByID(61),
	["Forlorn Spirit"] = _G.GetFactionInfoByID(62),
	["Darkhowl"] = _G.GetFactionInfoByID(63),
	["Grell"] = _G.GetFactionInfoByID(64),
	["Furbolg"] = _G.GetFactionInfoByID(65),
	["Horde Generic"] = _G.GetFactionInfoByID(66),
	["Horde"] = _G.GetFactionInfoByID(67),
	["Undercity"] = _G.GetFactionInfoByID(68),
	["Darnassus"] = _G.GetFactionInfoByID(69),
	["Syndicate"] = _G.GetFactionInfoByID(70),
	["Hillsbrad Militia"] = _G.GetFactionInfoByID(71),
	["Stormwind"] = _G.GetFactionInfoByID(72),
	["Demon"] = _G.GetFactionInfoByID(73),
	["Elemental"] = _G.GetFactionInfoByID(74),
	["Spirit"] = _G.GetFactionInfoByID(75),
	["Orgrimmar"] = _G.GetFactionInfoByID(76),
	["Treasure"] = _G.GetFactionInfoByID(77),
	["Gnoll - Mudsnout"] = _G.GetFactionInfoByID(78),
	["HIllsbrad, Southshore Mayor"] = _G.GetFactionInfoByID(79),
	["Dragonflight, Black"] = _G.GetFactionInfoByID(80),
	["Thunder Bluff"] = _G.GetFactionInfoByID(81),
	["Troll, Witherbark"] = _G.GetFactionInfoByID(82),
	[" Leatherworking - Elemental"] = _G.GetFactionInfoByID(83),
	["Quilboar, Razormane"] = _G.GetFactionInfoByID(84),
	["Quilboar, Bristleback"] = _G.GetFactionInfoByID(85),
	[" Leatherworking - Dragonscale"] = _G.GetFactionInfoByID(86),
	["Bloodsail Buccaneers"] = _G.GetFactionInfoByID(87),
	["Blackfathom"] = _G.GetFactionInfoByID(88),
	["Makrura"] = _G.GetFactionInfoByID(89),
	["Centaur, Kolkar"] = _G.GetFactionInfoByID(90),
	["Centaur, Galak"] = _G.GetFactionInfoByID(91),
	["Gelkis Clan Centaur"] = _G.GetFactionInfoByID(92),
	["Magram Clan Centaur"] = _G.GetFactionInfoByID(93),
	["Maraudine"] = _G.GetFactionInfoByID(94),
	["Theramore"] = _G.GetFactionInfoByID(108),
	["Quilboar, Razorfen"] = _G.GetFactionInfoByID(109),
	["Quilboar, Razormane 2"] = _G.GetFactionInfoByID(110),
	["Quilboar, Deathshead"] = _G.GetFactionInfoByID(111),
	["Enemy"] = _G.GetFactionInfoByID(128),
	["Ambient"] = _G.GetFactionInfoByID(148),
	["Nethergarde Caravan"] = _G.GetFactionInfoByID(168),
	["Steamwheedle Cartel"] = _G.GetFactionInfoByID(169),
	["Alliance Generic"] = _G.GetFactionInfoByID(189),
	["Nethergarde"] = _G.GetFactionInfoByID(209),
	["Wailing Caverns"] = _G.GetFactionInfoByID(229),
	["Silithid"] = _G.GetFactionInfoByID(249),
	["Silvermoon Remnant"] = _G.GetFactionInfoByID(269),
	["Zandalar Tribe"] = _G.GetFactionInfoByID(270),
	[" Blacksmithing - Weaponsmithing"] = _G.GetFactionInfoByID(289),
	["Scorpid"] = _G.GetFactionInfoByID(309),
	["Beast - Bat"] = _G.GetFactionInfoByID(310),
	["Titan"] = _G.GetFactionInfoByID(311),
	["Taskmaster Fizzule"] = _G.GetFactionInfoByID(329),
	["Ravenholdt"] = _G.GetFactionInfoByID(349),
	["Gadgetzan"] = _G.GetFactionInfoByID(369),
	["Gnomeregan Bug"] = _G.GetFactionInfoByID(389),
	["Harpy"] = _G.GetFactionInfoByID(409),
	["Burning Blade"] = _G.GetFactionInfoByID(429),
	["Shadowsilk Poacher"] = _G.GetFactionInfoByID(449),
	["Searing Spider"] = _G.GetFactionInfoByID(450),
	["Alliance"] = _G.GetFactionInfoByID(469),
	["Ratchet"] = _G.GetFactionInfoByID(470),
	["DEPRECATED Wildhammer Clan, DEPRECATED"] = _G.GetFactionInfoByID(471),
	["Goblin, Dark Iron Bar Patron"] = _G.GetFactionInfoByID(489),
	["The League of Arathor"] = _G.GetFactionInfoByID(509),
	["The Defilers"] = _G.GetFactionInfoByID(510),
	["Giant"] = _G.GetFactionInfoByID(511),
	["Argent Dawn"] = _G.GetFactionInfoByID(529),
	["Darkspear Trolls"] = _G.GetFactionInfoByID(530),
	["Dragonflight, Bronze"] = _G.GetFactionInfoByID(531),
	["Dragonflight, Blue"] = _G.GetFactionInfoByID(532),
	[" Leatherworking - Tribal"] = _G.GetFactionInfoByID(549),
	[" Engineering - Goblin"] = _G.GetFactionInfoByID(550),
	[" Engineering - Gnome"] = _G.GetFactionInfoByID(551),
	[" Blacksmithing - Hammersmithing"] = _G.GetFactionInfoByID(569),
	[" Blacksmithing - Axesmithing"] = _G.GetFactionInfoByID(570),
	[" Blacksmithing - Swordsmithing"] = _G.GetFactionInfoByID(571),
	["Troll, Vilebranch"] = _G.GetFactionInfoByID(572),
	["Southsea Freebooters"] = _G.GetFactionInfoByID(573),
	["Caer Darrow"] = _G.GetFactionInfoByID(574),
	["Furbolg, Uncorrupted"] = _G.GetFactionInfoByID(575),
	["Timbermaw Hold"] = _G.GetFactionInfoByID(576),
	["Everlook"] = _G.GetFactionInfoByID(577),
	["Wintersaber Trainers"] = _G.GetFactionInfoByID(589),
	["Cenarion Circle"] = _G.GetFactionInfoByID(609),
	["Shatterspear Trolls"] = _G.GetFactionInfoByID(629),
	["Ravasaur Trainers"] = _G.GetFactionInfoByID(630),
	["Majordomo Executus"] = _G.GetFactionInfoByID(649),
	["Beast - Carrion Bird"] = _G.GetFactionInfoByID(669),
	["Beast - Cat"] = _G.GetFactionInfoByID(670),
	["Beast - Crab"] = _G.GetFactionInfoByID(671),
	["Beast - Crocilisk"] = _G.GetFactionInfoByID(672),
	["Beast - Hyena"] = _G.GetFactionInfoByID(673),
	["Beast - Owl"] = _G.GetFactionInfoByID(674),
	["Beast - Scorpid"] = _G.GetFactionInfoByID(675),
	["Beast - Tallstrider"] = _G.GetFactionInfoByID(676),
	["Beast - Turtle"] = _G.GetFactionInfoByID(677),
	["Beast - Wind Serpent"] = _G.GetFactionInfoByID(678),
	["Training Dummy"] = _G.GetFactionInfoByID(679),
	["Dragonflight, Black - Bait"] = _G.GetFactionInfoByID(689),
	["Battleground Neutral"] = _G.GetFactionInfoByID(709),
	["Frostwolf Clan"] = _G.GetFactionInfoByID(729),
	["Stormpike Guard"] = _G.GetFactionInfoByID(730),
	["Hydraxian Waterlords"] = _G.GetFactionInfoByID(749),
	["Sulfuron Firelords"] = _G.GetFactionInfoByID(750),
	["Gizlock's Dummy"] = _G.GetFactionInfoByID(769),
	["Gizlock's Charm"] = _G.GetFactionInfoByID(770),
	["Gizlock"] = _G.GetFactionInfoByID(771),
	["Moro'gai"] = _G.GetFactionInfoByID(789),
	["Spirit Guide - Alliance"] = _G.GetFactionInfoByID(790),
	["Shen'dralar"] = _G.GetFactionInfoByID(809),
	["Ogre (Captain Kromcrush)"] = _G.GetFactionInfoByID(829),
	["Spirit Guide - Horde"] = _G.GetFactionInfoByID(849),
	["Jaedenar"] = _G.GetFactionInfoByID(869),
	["Warsong Outriders"] = _G.GetFactionInfoByID(889),
	["Silverwing Sentinels"] = _G.GetFactionInfoByID(890),
	["Alliance Forces"] = _G.GetFactionInfoByID(891),
	["Horde Forces"] = _G.GetFactionInfoByID(892),
	["Revantusk Trolls"] = _G.GetFactionInfoByID(893),
	["Darkmoon Faire"] = _G.GetFactionInfoByID(909),
	["Brood of Nozdormu"] = _G.GetFactionInfoByID(910),
	["Silvermoon City"] = _G.GetFactionInfoByID(911),
	["Might of Kalimdor"] = _G.GetFactionInfoByID(912),
	["PLAYER, Blood Elf"] = _G.GetFactionInfoByID(914),
	["Armies of C'Thun"] = _G.GetFactionInfoByID(915),
	["Silithid Attackers"] = _G.GetFactionInfoByID(916),
	["The Ironforge Brigade"] = _G.GetFactionInfoByID(917),
	["RC Enemies"] = _G.GetFactionInfoByID(918),
	["RC Objects"] = _G.GetFactionInfoByID(919),
	["Red"] = _G.GetFactionInfoByID(920),
	["Blue"] = _G.GetFactionInfoByID(921),
	["Tranquillien"] = _G.GetFactionInfoByID(922),
	["Farstriders"] = _G.GetFactionInfoByID(923),
	["DEPRECATED"] = _G.GetFactionInfoByID(924),
	["Sunstriders"] = _G.GetFactionInfoByID(925),
	["Magister's Guild"] = _G.GetFactionInfoByID(926),
	["PLAYER, Draenei"] = _G.GetFactionInfoByID(927),
	["Scourge Invaders"] = _G.GetFactionInfoByID(928),
	["Bloodmaul Clan"] = _G.GetFactionInfoByID(929),
	["Exodar"] = _G.GetFactionInfoByID(930),
	["Test Faction (not a real faction)"] = _G.GetFactionInfoByID(931),
	["The Aldor"] = _G.GetFactionInfoByID(932),
	["The Consortium"] = _G.GetFactionInfoByID(933),
	["The Scryers"] = _G.GetFactionInfoByID(934),
	["The Sha'tar"] = _G.GetFactionInfoByID(935),
	["Shattrath City"] = _G.GetFactionInfoByID(936),
	["Troll, Forest"] = _G.GetFactionInfoByID(937),
	["The Omenai"] = _G.GetFactionInfoByID(938),
	["DEPRECATED"] = _G.GetFactionInfoByID(939),
	["The Sons of Lothar"] = _G.GetFactionInfoByID(940),
	["The Mag'har"] = _G.GetFactionInfoByID(941),
	["Cenarion Expedition"] = _G.GetFactionInfoByID(942),
	["Fel Orc"] = _G.GetFactionInfoByID(943),
	["Fel Orc Ghost"] = _G.GetFactionInfoByID(944),
	["Sons of Lothar Ghosts"] = _G.GetFactionInfoByID(945),
	["Honor Hold"] = _G.GetFactionInfoByID(946),
	["Thrallmar"] = _G.GetFactionInfoByID(947),
	["Test Faction 2"] = _G.GetFactionInfoByID(948),
	["Test Faction 1"] = _G.GetFactionInfoByID(949),
	["ToWoW - Flag"] = _G.GetFactionInfoByID(950),
	["ToWoW - Flag Trigger Alliance (DND)"] = _G.GetFactionInfoByID(951),
	["Test Faction 3"] = _G.GetFactionInfoByID(952),
	["Test Faction 4"] = _G.GetFactionInfoByID(953),
	["ToWoW - Flag Trigger Horde (DND)"] = _G.GetFactionInfoByID(954),
	["Broken"] = _G.GetFactionInfoByID(955),
	["Ethereum"] = _G.GetFactionInfoByID(956),
	["Earth Elemental"] = _G.GetFactionInfoByID(957),
	["Fighting Robots"] = _G.GetFactionInfoByID(958),
	["Actor Good"] = _G.GetFactionInfoByID(959),
	["Actor Evil"] = _G.GetFactionInfoByID(960),
	["Stillpine Furbolg"] = _G.GetFactionInfoByID(961),
	["Crazed Owlkin"] = _G.GetFactionInfoByID(962),
	["Chess Alliance"] = _G.GetFactionInfoByID(963),
	["Chess Horde"] = _G.GetFactionInfoByID(964),
	["Monster Spar"] = _G.GetFactionInfoByID(965),
	["Monster Spar Buddy"] = _G.GetFactionInfoByID(966),
	["The Violet Eye"] = _G.GetFactionInfoByID(967),
	["Sunhawks"] = _G.GetFactionInfoByID(968),
	["Hand of Argus"] = _G.GetFactionInfoByID(969),
	["Sporeggar"] = _G.GetFactionInfoByID(970),
	["Fungal Giant"] = _G.GetFactionInfoByID(971),
	["Spore Bat"] = _G.GetFactionInfoByID(972),
	["Monster, Predator"] = _G.GetFactionInfoByID(973),
	["Monster, Prey"] = _G.GetFactionInfoByID(974),
	["Void Anomaly"] = _G.GetFactionInfoByID(975),
	["Hyjal Defenders"] = _G.GetFactionInfoByID(976),
	["Hyjal Invaders"] = _G.GetFactionInfoByID(977),
	["Kurenai"] = _G.GetFactionInfoByID(978),
	["Earthen Ring, Old World"] = _G.GetFactionInfoByID(979),
	["The Burning Crusade"] = _G.GetFactionInfoByID(980),
	["Arakkoa"] = _G.GetFactionInfoByID(981),
	["Zangarmarsh Banner (Alliance)"] = _G.GetFactionInfoByID(982),
	["Zangarmarsh Banner (Horde)"] = _G.GetFactionInfoByID(983),
	["Zangarmarsh Banner (Neutral)"] = _G.GetFactionInfoByID(984),
	["Caverns of Time - Thrall"] = _G.GetFactionInfoByID(985),
	["Caverns of Time - Durnholde"] = _G.GetFactionInfoByID(986),
	["Caverns of Time - Southshore Guards"] = _G.GetFactionInfoByID(987),
	["Shadow Council Covert"] = _G.GetFactionInfoByID(988),
	["Keepers of Time"] = _G.GetFactionInfoByID(989),
	["The Scale of the Sands"] = _G.GetFactionInfoByID(990),
	["Dark Portal Defender, Alliance"] = _G.GetFactionInfoByID(991),
	["Dark Portal Defender, Horde"] = _G.GetFactionInfoByID(992),
	["Dark Portal Attacker, Legion"] = _G.GetFactionInfoByID(993),
	["Inciter Trigger"] = _G.GetFactionInfoByID(994),
	["Inciter Trigger 2"] = _G.GetFactionInfoByID(995),
	["Inciter Trigger 3"] = _G.GetFactionInfoByID(996),
	["Inciter Trigger 4"] = _G.GetFactionInfoByID(997),
	["Inciter Trigger 5"] = _G.GetFactionInfoByID(998),
	["Mana Creature"] = _G.GetFactionInfoByID(999),
	["Khadgar's Servant"] = _G.GetFactionInfoByID(1000),
	["Bladespire Clan"] = _G.GetFactionInfoByID(1001),
	["Ethereum Sparbuddy"] = _G.GetFactionInfoByID(1002),
	["Protectorate"] = _G.GetFactionInfoByID(1003),
	["Arcane Annihilator (DNR)"] = _G.GetFactionInfoByID(1004),
	["Friendly, Hidden"] = _G.GetFactionInfoByID(1005),
	["Kirin'Var - Dathric"] = _G.GetFactionInfoByID(1006),
	["Kirin'Var - Belmara"] = _G.GetFactionInfoByID(1007),
	["Kirin'Var - Luminrath"] = _G.GetFactionInfoByID(1008),
	["Kirin'Var - Cohlien"] = _G.GetFactionInfoByID(1009),
	["Servant of Illidan"] = _G.GetFactionInfoByID(1010),
	["Lower City"] = _G.GetFactionInfoByID(1011),
	["Ashtongue Deathsworn"] = _G.GetFactionInfoByID(1012),
	["Spirits of Shadowmoon 1"] = _G.GetFactionInfoByID(1013),
	["Spirits of Shadowmoon 2"] = _G.GetFactionInfoByID(1014),
	["Netherwing"] = _G.GetFactionInfoByID(1015),
	["Wyrmcult"] = _G.GetFactionInfoByID(1016),
	["Treant"] = _G.GetFactionInfoByID(1017),
	["Leotheras Demon I"] = _G.GetFactionInfoByID(1018),
	["Leotheras Demon II"] = _G.GetFactionInfoByID(1019),
	["Leotheras Demon III"] = _G.GetFactionInfoByID(1020),
	["Leotheras Demon IV"] = _G.GetFactionInfoByID(1021),
	["Leotheras Demon V"] = _G.GetFactionInfoByID(1022),
	["Azaloth"] = _G.GetFactionInfoByID(1023),
	["Rock Flayer"] = _G.GetFactionInfoByID(1024),
	["Flayer Hunter"] = _G.GetFactionInfoByID(1025),
	["Shadowmoon Shade"] = _G.GetFactionInfoByID(1026),
	["Legion Communicator"] = _G.GetFactionInfoByID(1027),
	["Ravenswood Ancients"] = _G.GetFactionInfoByID(1028),
	["Chess, Friendly to All Chess"] = _G.GetFactionInfoByID(1029),
	["Black Temple Gates - Illidari"] = _G.GetFactionInfoByID(1030),
	["Sha'tari Skyguard"] = _G.GetFactionInfoByID(1031),
	["Area 52"] = _G.GetFactionInfoByID(1032),
	["Maiev"] = _G.GetFactionInfoByID(1033),
	["Skettis Shadowy Arakkoa"] = _G.GetFactionInfoByID(1034),
	["Skettis Arakkoa"] = _G.GetFactionInfoByID(1035),
	["Dragonmaw Enemy"] = _G.GetFactionInfoByID(1036),
	["Alliance Vanguard"] = _G.GetFactionInfoByID(1037),
	["Ogri'la"] = _G.GetFactionInfoByID(1038),
	["Ravager"] = _G.GetFactionInfoByID(1039),
	["REUSE"] = _G.GetFactionInfoByID(1040),
	["Frenzy"] = _G.GetFactionInfoByID(1041),
	["Skyguard Enemy"] = _G.GetFactionInfoByID(1042),
	["Skunk, Petunia"] = _G.GetFactionInfoByID(1043),
	["Theramore Deserter"] = _G.GetFactionInfoByID(1044),
	["Vrykul"] = _G.GetFactionInfoByID(1045),
	["Northsea Pirates"] = _G.GetFactionInfoByID(1046),
	["Tuskarr"] = _G.GetFactionInfoByID(1047),
	["UNUSED"] = _G.GetFactionInfoByID(1048),
	["Troll, Amani"] = _G.GetFactionInfoByID(1049),
	["Valiance Expedition"] = _G.GetFactionInfoByID(1050),
	["UNUSED"] = _G.GetFactionInfoByID(1051),
	["Horde Expedition"] = _G.GetFactionInfoByID(1052),
	["Westguard"] = _G.GetFactionInfoByID(1053),
	["Spotted Gryphon"] = _G.GetFactionInfoByID(1054),
	["Tamed Plaguehound"] = _G.GetFactionInfoByID(1055),
	["Vrykul (Ancient Spirit 1)"] = _G.GetFactionInfoByID(1056),
	["Vrykul (Ancient Siprit 2)"] = _G.GetFactionInfoByID(1057),
	["Vrykul (Ancient Siprit 3)"] = _G.GetFactionInfoByID(1058),
	["CTF - Flag - Alliance"] = _G.GetFactionInfoByID(1059),
	["Test"] = _G.GetFactionInfoByID(1060),
	["vrykul"] = _G.GetFactionInfoByID(1061),
	["Vrykul Gladiator"] = _G.GetFactionInfoByID(1062),
	["Valgarde Combatant"] = _G.GetFactionInfoByID(1063),
	["The Taunka"] = _G.GetFactionInfoByID(1064),
	["Monster, Zone Force Reaction 1"] = _G.GetFactionInfoByID(1065),
	["Monster, Zone Force Reaction 2"] = _G.GetFactionInfoByID(1066),
	["The Hand of Vengeance"] = _G.GetFactionInfoByID(1067),
	["Explorers' League"] = _G.GetFactionInfoByID(1068),
	["Ram Racing Powerup DND"] = _G.GetFactionInfoByID(1069),
	["Ram Racing Trap DND"] = _G.GetFactionInfoByID(1070),
	["Craig's Squirrels"] = _G.GetFactionInfoByID(1071),
	["REUSE"] = _G.GetFactionInfoByID(1072),
	["The Kalu'ak"] = _G.GetFactionInfoByID(1073),
	["Holiday - Water Barrel"] = _G.GetFactionInfoByID(1074),
	["Holiday - Generic"] = _G.GetFactionInfoByID(1075),
	["Iron Dwarves"] = _G.GetFactionInfoByID(1076),
	["Shattered Sun Offensive"] = _G.GetFactionInfoByID(1077),
	["Fighting Vanity Pet"] = _G.GetFactionInfoByID(1078),
	["Murloc, Winterfin"] = _G.GetFactionInfoByID(1079),
	["Friendly, Force Reaction 1"] = _G.GetFactionInfoByID(1080),
	["Object, Force Reaction"] = _G.GetFactionInfoByID(1081),
	["REUSE"] = _G.GetFactionInfoByID(1082),
	["REUSE"] = _G.GetFactionInfoByID(1083),
	["Vrykul, Sea"] = _G.GetFactionInfoByID(1084),
	["Warsong Offensive"] = _G.GetFactionInfoByID(1085),
	["Poacher"] = _G.GetFactionInfoByID(1086),
	["Holiday Monster"] = _G.GetFactionInfoByID(1087),
	["Furbolg, Redfang"] = _G.GetFactionInfoByID(1088),
	["Furbolg, Frostpaw"] = _G.GetFactionInfoByID(1089),
	["Kirin Tor"] = _G.GetFactionInfoByID(1090),
	["The Wyrmrest Accord"] = _G.GetFactionInfoByID(1091),
	["Azjol-Nerub"] = _G.GetFactionInfoByID(1092),
	["REUSE"] = _G.GetFactionInfoByID(1093),
	["The Silver Covenant"] = _G.GetFactionInfoByID(1094),
	["Grizzly Hills Trapper"] = _G.GetFactionInfoByID(1095),
	["REUSE"] = _G.GetFactionInfoByID(1096),
	["Wrath of the Lich King"] = _G.GetFactionInfoByID(1097),
	["Knights of the Ebon Blade"] = _G.GetFactionInfoByID(1098),
	["Wrathgate Scourge"] = _G.GetFactionInfoByID(1099),
	["Wrathgate Alliance"] = _G.GetFactionInfoByID(1100),
	["Wrathgate Horde"] = _G.GetFactionInfoByID(1101),
	["CTF - Flag - Horde"] = _G.GetFactionInfoByID(1102),
	["CTF - Flag - Neutral"] = _G.GetFactionInfoByID(1103),
	["Frenzyheart Tribe"] = _G.GetFactionInfoByID(1104),
	["The Oracles"] = _G.GetFactionInfoByID(1105),
	["Argent Crusade"] = _G.GetFactionInfoByID(1106),
	["Troll, Drakkari"] = _G.GetFactionInfoByID(1107),
	["CoT Arthas"] = _G.GetFactionInfoByID(1108),
	["CoT Stratholme Citizen"] = _G.GetFactionInfoByID(1109),
	["CoT Scourge"] = _G.GetFactionInfoByID(1110),
	["Freya"] = _G.GetFactionInfoByID(1111),
	["Mount - Taxi - Alliance"] = _G.GetFactionInfoByID(1112),
	["Mount - Taxi - Horde"] = _G.GetFactionInfoByID(1113),
	["Mount - Taxi - Neutral"] = _G.GetFactionInfoByID(1114),
	["Elemental, Water"] = _G.GetFactionInfoByID(1115),
	["Elemental, Air"] = _G.GetFactionInfoByID(1116),
	["Sholazar Basin"] = _G.GetFactionInfoByID(1117),
	["Classic"] = _G.GetFactionInfoByID(1118),
	["The Sons of Hodir"] = _G.GetFactionInfoByID(1119),
	["Iron Giants"] = _G.GetFactionInfoByID(1120),
	["Frost Vrykul"] = _G.GetFactionInfoByID(1121),
	["Earthen"] = _G.GetFactionInfoByID(1122),
	["Monster Referee"] = _G.GetFactionInfoByID(1123),
	["The Sunreavers"] = _G.GetFactionInfoByID(1124),
	["Hyldsmeet"] = _G.GetFactionInfoByID(1125),
	["The Frostborn"] = _G.GetFactionInfoByID(1126),
	["Orgrimmar (Alex Test)"] = _G.GetFactionInfoByID(1127),
	["Twilight's Hammer"] = _G.GetFactionInfoByID(1128),
	["Furbolg, Blackwood"] = _G.GetFactionInfoByID(1129),
	["Stag, Darkshore"] = _G.GetFactionInfoByID(1130),
	["Bear, Darkshore"] = _G.GetFactionInfoByID(1131),
	["Moonstalker, Darkshore"] = _G.GetFactionInfoByID(1132),
	["Bilgewater Cartel"] = _G.GetFactionInfoByID(1133),
	["Gilneas"] = _G.GetFactionInfoByID(1134),
	["The Earthen Ring"] = _G.GetFactionInfoByID(1135),
	["Tranquillien Conversion"] = _G.GetFactionInfoByID(1136),
	["Wintersaber Conversion"] = _G.GetFactionInfoByID(1137),
	["Cataclysm - New Neutral Reputation"] = _G.GetFactionInfoByID(1138),
	["Magram Remnant"] = _G.GetFactionInfoByID(1142),
	["Sons of Gelkis"] = _G.GetFactionInfoByID(1143),
	["REUSE"] = _G.GetFactionInfoByID(1144),
	["Hates Everything"] = _G.GetFactionInfoByID(1145),
	["PLAYER, Goblin"] = _G.GetFactionInfoByID(1152),
	["PLAYER, Worgen"] = _G.GetFactionInfoByID(1153),
	["Silver Covenant Conversion"] = _G.GetFactionInfoByID(1154),
	["Sunreavers Conversion"] = _G.GetFactionInfoByID(1155),
	["The Ashen Verdict"] = _G.GetFactionInfoByID(1156),
	["Pygmy"] = _G.GetFactionInfoByID(1157),
	["Guardians of Hyjal"] = _G.GetFactionInfoByID(1158),
	["CTF - Flag - Alliance 2"] = _G.GetFactionInfoByID(1159),
	["CTF - Flag - Horde 2"] = _G.GetFactionInfoByID(1160),
	["Grimtotem"] = _G.GetFactionInfoByID(1161),
	["Cataclysm"] = _G.GetFactionInfoByID(1162),
	["New test rep for Alex"] = _G.GetFactionInfoByID(1163),
	["Mischief"] = _G.GetFactionInfoByID(1168),
	["Guild"] = _G.GetFactionInfoByID(1169),
	["Therazane"] = _G.GetFactionInfoByID(1171),
	["Dragonmaw Clan"] = _G.GetFactionInfoByID(1172),
	["Ramkahen"] = _G.GetFactionInfoByID(1173),
	["Wildhammer Clan"] = _G.GetFactionInfoByID(1174),
	["Baradin's Wardens"] = _G.GetFactionInfoByID(1177),
	["Hellscream's Reach"] = _G.GetFactionInfoByID(1178),
	["Slime"] = _G.GetFactionInfoByID(1179),
	["Friendly, New"] = _G.GetFactionInfoByID(1181),
	["K3"] = _G.GetFactionInfoByID(1189),
	["Avengers of Hyjal"] = _G.GetFactionInfoByID(1204),
	["Shang Xi's Academy"] = _G.GetFactionInfoByID(1216),
	["Forest Hozen"] = _G.GetFactionInfoByID(1228),
	["CoT Well of Eternity - Illidan"] = _G.GetFactionInfoByID(1233),
	["CoT Well of Eternity - High Elves"] = _G.GetFactionInfoByID(1234),
	["CoT Well of Eternity - Illidan (Stealth)"] = _G.GetFactionInfoByID(1235),
	["CoT Well of Eternity - Demons"] = _G.GetFactionInfoByID(1237),
	["CoT Well of Eternity - Demon Balls"] = _G.GetFactionInfoByID(1240),
	["CoT Well of Eternity - Hunter Stalkers"] = _G.GetFactionInfoByID(1241),
	["Pearlfin Jinyu"] = _G.GetFactionInfoByID(1242),
	["Hozen"] = _G.GetFactionInfoByID(1243),
	["Mists of Pandaria"] = _G.GetFactionInfoByID(1245),
	["PLAYER, Expansion 4 Neutral"] = _G.GetFactionInfoByID(1249),
	["Sha"] = _G.GetFactionInfoByID(1252),
	["Guardians of the East Temple"] = _G.GetFactionInfoByID(1253),
	["Shen'dralar"] = _G.GetFactionInfoByID(1265),
	["Mogu"] = _G.GetFactionInfoByID(1268),
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
	["Guardians of the Red Crane"] = _G.GetFactionInfoByID(1286),
	["The Anglers"] = _G.GetFactionInfoByID(1302),
	["The Mantid Swarm"] = _G.GetFactionInfoByID(1336),
	["The Klaxxi"] = _G.GetFactionInfoByID(1337),
	["Gurthan Mogu"] = _G.GetFactionInfoByID(1338),
	["Harthak Mogu"] = _G.GetFactionInfoByID(1339),
	["Korgesh Mogu"] = _G.GetFactionInfoByID(1340),
	["The August Celestials"] = _G.GetFactionInfoByID(1341),
	["The Lorewalkers"] = _G.GetFactionInfoByID(1345),
	["The Brewmasters"] = _G.GetFactionInfoByID(1351),
	["Huojin Pandaren"] = _G.GetFactionInfoByID(1352),
	["Tushui Pandaren"] = _G.GetFactionInfoByID(1353),
	["Nomi"] = _G.GetFactionInfoByID(1357),
	["Nat Pagle"] = _G.GetFactionInfoByID(1358),
	["The Black Prince"] = _G.GetFactionInfoByID(1359),
	["Friendly, Force Reaction 2"] = _G.GetFactionInfoByID(1364),
	["Friendly, Force Reaction 3"] = _G.GetFactionInfoByID(1366),
	["Friendly, Force Reaction 4"] = _G.GetFactionInfoByID(1367),
	["Friendly, Force Reaction 5"] = _G.GetFactionInfoByID(1368),
	["Friendly, Force Reaction 6"] = _G.GetFactionInfoByID(1369),
	["Friendly, Force Reaction 7"] = _G.GetFactionInfoByID(1370),
	["Paw'don Village"] = _G.GetFactionInfoByID(1371),
	["Honeydew Village"] = _G.GetFactionInfoByID(1372),
}

private.FACTION_IDS = {}

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
	ICECROWN_CITADEL = _G.GetMapNameByID(604),
	MOUNT_HYJAL = _G.GetMapNameByID(606),
	SOUTHERN_BARRENS = _G.GetMapNameByID(607),
	VASHJIR = _G.GetMapNameByID(613),
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
	TWILIGHT_HIGHLANDS = _G.GetMapNameByID(770),
	AHNQIRAJ_THE_FALLEN_KINGDOM = _G.GetMapNameByID(772),
	HYJAL_SUMMIT = _G.GetMapNameByID(775),
	SERPENTSHRINE_CAVERN = _G.GetMapNameByID(780),
	TEMPEST_KEEP = _G.GetMapNameByID(782),
	SUNWELL_PLATEAU = _G.GetMapNameByID(789),
	BLACK_TEMPLE = _G.GetMapNameByID(796),
	MAGISTERS_TERRACE = _G.GetMapNameByID(798),
	KARAZHAN = _G.GetMapNameByID(799),
	FIRELANDS = _G.GetMapNameByID(800),
	VALLEY_OF_THE_FOUR_WINDS = _G.GetMapNameByID(807),
	TOWNLONG_STEPPES = _G.GetMapNameByID(810),
	VALE_OF_ETERNAL_BLOSSOMS = _G.GetMapNameByID(811),
	DRAGON_SOUL = _G.GetMapNameByID(824),
	DUSTWALLOW_MARSH = _G.GetMapNameByID(851),
	KRASARANG_WILDS = _G.GetMapNameByID(857),
	DREAD_WASTES = _G.GetMapNameByID(858),
	THE_VEILED_STAIR = _G.GetMapNameByID(873),
	KUN_LAI_SUMMIT = _G.GetMapNameByID(879),
	THE_JADE_FOREST = _G.GetMapNameByID(880),
	HEART_OF_FEAR = _G.GetMapNameByID(897),
	SCHOLOMANCE = _G.GetMapNameByID(898),
	SHRINE_OF_TWO_MOONS = _G.GetMapNameByID(903),
	SHRINE_OF_SEVEN_STARS = _G.GetMapNameByID(905),
}

do
	local continent_names = { _G.GetMapContinents() }

	private.ZONE_NAMES["KALIMDOR"] = continent_names[1]
	private.ZONE_NAMES["EASTERN_KINGDOMS"] = continent_names[2]
	private.ZONE_NAMES["OUTLAND"] = continent_names[3]
	private.ZONE_NAMES["NORTHREND"] = continent_names[4]
	private.ZONE_NAMES["THE_MAELSTROM"] = continent_names[5]
	private.ZONE_NAMES["PANDARIA"] = continent_names[6]
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
local function RGBtoHEX(r, g, b)
	return ("%02x%02x%02x"):format(r * 255, g * 255, b * 255)
end

local function GetColorsFromTable(dict)
	return dict.r, dict.g, dict.b
end

private.REPUTATION_COLORS = {
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
private.DIFFICULTY_COLORS = {
	["trivial"]	= "808080",
	["easy"]	= "40bf40",
	["medium"]	= "ffff00",
	["optimal"]	= "ff8040",
	["impossible"]	= "ff0000",
}

private.BASIC_COLORS = {
	["grey"]	= "666666",
	["white"]	= "ffffff",
	["yellow"]	= "ffff00",
	["normal"]	= "ffd100",
}

-- Colors used in tooltips and the recipe list.
private.CATEGORY_COLORS = {
	-- Acquire type colors
	["achievement"]	= "faeb98",
	["custom"]	= "73b7ff",
	["discovery"]	= "ff9500",
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
