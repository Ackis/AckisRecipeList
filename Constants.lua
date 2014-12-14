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
	[private.MINING_PROFESSION_NAME] = "Smelting",
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
	[6] = "WOD",
}

constants.GAME_VERSION_NAMES = private.GAME_VERSION_NAMES

private.GAME_VERSIONS = {}
constants.GAME_VERSIONS = private.GAME_VERSIONS

for index = 1, #private.GAME_VERSION_NAMES do
	private.GAME_VERSIONS[private.GAME_VERSION_NAMES[index]] = index
end

private.EXPANSION_FILTERS = {}

for index = 1, #private.GAME_VERSION_NAMES do
	private.EXPANSION_FILTERS[index] = ("expansion%d"):format(index - 1)
end

private.EXPANSION_LOGO_TEXTURES = {
	[[Interface\Glues\Common\Glues-WoW-Logo]],
	[[Interface\Glues\Common\GLUES-WOW-BCLOGO]],
	[[Interface\Glues\Common\Glues-WOW-WotlkLogo]],
	[[Interface\Glues\Common\Glues-WOW-CCLogo]],
	[[Interface\Glues\Common\Glues-WOW-MPLogo]],
	[[Interface\Glues\Common\Glues-WOW-WoDLogo]],
}

-------------------------------------------------------------------------------
-- Common filter bitfield word 1.
-------------------------------------------------------------------------------
private.COMMON_FLAGS_WORD1 = {
	ALLIANCE	= 0x00000001,	-- 1
	ACHIEVEMENT	= 0x00000002,	-- 2
	CASTER		= 0x00000004,	-- 3
	DISC		= 0x00000008,	-- 4
	DPS		= 0x00000010,	-- 5
	HEALER		= 0x00000020,	-- 6
	HORDE		= 0x00000040,	-- 7
	INSTANCE	= 0x00000080,	-- 8
	MISC1		= 0x00000100,	-- 9
	MOB_DROP	= 0x00000200,	-- 10
	PVP		= 0x00000400,	-- 11
	QUEST		= 0x00000800,	-- 12
	RAID		= 0x00001000,	-- 13
	REPUTATION	= 0x00002000,	-- 14
	RETIRED		= 0x00004000,	-- 15
	TANK		= 0x00008000,	-- 16
	TRAINER		= 0x00010000,	-- 17
	VENDOR		= 0x00020000,	-- 18
	WORLD_DROP	= 0x00040000,	-- 19
	WORLD_EVENTS	= 0x00080000,	-- 20
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

private.FLAG_WORDS = {
	private.COMMON_FLAGS_WORD1,
	private.CLASS_FLAGS_WORD1,
}

-- Member names within a recipe's flags table.
private.FLAG_MEMBERS = {
	"common1",
	"class1",
}

-------------------------------------------------------------------------------
-- Item filter types.
-------------------------------------------------------------------------------
constants.ITEM_FILTER_TYPES = {} -- Populated via profession modules.

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
private.FACTION_LABELS_FROM_ID = {
	-------------------------------------------------------------------------------
	-- Classic
	-------------------------------------------------------------------------------
	[59]	= "THORIUM_BROTHERHOOD",
	[529]	= "ARGENT_DAWN",
	[576]	= "TIMBERMAW_HOLD",
	[609]	= "CENARION_CIRCLE",
	-------------------------------------------------------------------------------
	-- The Burning Crusade
	-------------------------------------------------------------------------------
	[932]	= "THE_ALDOR",
	[933]	= "THE_CONSORTIUM",
	[934]	= "THE_SCRYERS",
	[935]	= "THE_SHATAR",
	[941]	= "THE_MAGHAR",
	[942]	= "CENARION_EXPEDITION",
	[946]	= "HONOR_HOLD",
	[947]	= "THRALLMAR",
	[967]	= "THE_VIOLET_EYE",
	[970]	= "SPOREGGAR",
	[978]	= "KURENAI",
	[989]	= "KEEPERS_OF_TIME",
	[990]	= "THE_SCALE_OF_THE_SANDS",
	[1011]	= "LOWER_CITY",
	[1012]	= "ASHTONGUE_DEATHSWORN",
	[1077]	= "SHATTERED_SUN_OFFENSIVE",
	-------------------------------------------------------------------------------
	-- Wrath of the Lich King
	-------------------------------------------------------------------------------
	[1037]	= "ALLIANCE_VANGUARD",
	[1052]	= "HORDE_EXPEDITION",
	[1073]	= "THE_KALUAK",
	[1090]	= "KIRIN_TOR",
	[1091]	= "THE_WYRMREST_ACCORD",
	[1098]	= "KNIGHTS_OF_THE_EBON_BLADE",
	[1104]	= "FRENZYHEART_TRIBE",
	[1105]	= "THE_ORACLES",
	[1106]	= "ARGENT_CRUSADE",
	[1119]	= "THE_SONS_OF_HODIR",
	[1156]	= "THE_ASHEN_VERDICT",
	-------------------------------------------------------------------------------
	-- Mists of Pandaria
	-------------------------------------------------------------------------------
	[1269]	= "GOLDEN_LOTUS",
	[1270]	= "SHADO_PAN",
	[1271]	= "ORDER_OF_THE_CLOUD_SERPENT",
	[1272]	= "THE_TILLERS",
	[1302]	= "THE_ANGLERS",
	[1337]	= "THE_KLAXXI",
	[1341]	= "THE_AUGUST_CELESTIALS",
	-------------------------------------------------------------------------------
	-- Warlords of Draenor
	-------------------------------------------------------------------------------
}

-- The expansionX_reputations tables are ordered alphabetically (ignoring leading "THE"). These are used for
-- populating the reputation menus and their toggles.
private.EXPANSION0_REPUTATIONS = {
	"ARGENT_DAWN",
	"CENARION_CIRCLE",
	"THORIUM_BROTHERHOOD",
	"TIMBERMAW_HOLD",
}

private.EXPANSION1_REPUTATIONS = {
	"THE_ALDOR",
	"ASHTONGUE_DEATHSWORN",
	"CENARION_EXPEDITION",
	"THE_CONSORTIUM",
	"HONOR_HOLD",
	"KEEPERS_OF_TIME",
	"KURENAI",
	"LOWER_CITY",
	"THE_MAGHAR",
	"THE_SCALE_OF_THE_SANDS",
	"THE_SCRYERS",
	"THE_SHATAR",
	"SHATTERED_SUN_OFFENSIVE",
	"SPOREGGAR",
	"THRALLMAR",
	"THE_VIOLET_EYE",
}

private.EXPANSION2_REPUTATIONS = {
	"ALLIANCE_VANGUARD",
	"ARGENT_CRUSADE",
	"THE_ASHEN_VERDICT",
	"FRENZYHEART_TRIBE",
	"HORDE_EXPEDITION",
	"THE_KALUAK",
	"KIRIN_TOR",
	"KNIGHTS_OF_THE_EBON_BLADE",
	"THE_ORACLES",
	"THE_SONS_OF_HODIR",
	"THE_WYRMREST_ACCORD",
}

private.EXPANSION3_REPUTATIONS = {}

private.EXPANSION4_REPUTATIONS = {
	"THE_ANGLERS",
	"THE_AUGUST_CELESTIALS",
	"GOLDEN_LOTUS",
	"THE_KLAXXI",
	"ORDER_OF_THE_CLOUD_SERPENT",
	"SHADO_PAN",
	"THE_TILLERS",
}

private.EXPANSION5_REPUTATIONS = {}

private.LOCALIZED_FACTION_STRINGS_FROM_LABEL = {
	NEUTRAL	= _G.FACTION_STANDING_LABEL4,
	FRIENDLY = _G.FACTION_STANDING_LABEL5,
	HONORED	= _G.FACTION_STANDING_LABEL6,
	REVERED	= _G.FACTION_STANDING_LABEL7,
	EXALTED	= _G.FACTION_STANDING_LABEL8,
	HORDE = _G.GetFactionInfoByID(67),
	ALLIANCE = _G.GetFactionInfoByID(469),
}

private.FACTION_IDS_FROM_LABEL = {}
constants.FACTION_IDS = private.FACTION_IDS_FROM_LABEL

for id, label in pairs(private.FACTION_LABELS_FROM_ID) do
	private.FACTION_IDS_FROM_LABEL[label] = id
	private.LOCALIZED_FACTION_STRINGS_FROM_LABEL[label] = _G.GetFactionInfoByID(id) or ("%s_%d"):format(_G.UNKNOWN, id)
end

-- This is far from elegant, and could be done using math instead of the BITS table. I was, however,
-- simply wanting to Make It Work(™) and this is what we have for the moment.
do
	local BITS = {
		0x00000001,	-- 1
		0x00000002,	-- 2
		0x00000004,	-- 3
		0x00000008,	-- 4
		0x00000010,	-- 5
		0x00000020,	-- 6
		0x00000040,	-- 7
		0x00000080,	-- 8
		0x00000100,	-- 9
		0x00000200,	-- 10
		0x00000400,	-- 11
		0x00000800,	-- 12
		0x00001000,	-- 13
		0x00002000,	-- 14
		0x00004000,	-- 15
		0x00008000,	-- 16
		0x00010000,	-- 17
		0x00020000,	-- 18
		0x00040000,	-- 19
		0x00080000,	-- 20
		0x00100000,	-- 21
		0x00200000,	-- 22
		0x00400000,	-- 23
		0x00800000,	-- 24
		0x01000000,	-- 25
		0x02000000,	-- 26
		0x04000000,	-- 27
		0x08000000,	-- 28
		0x10000000,	-- 29
		0x20000000,	-- 30
		0x40000000,	-- 31
		0x80000000,	-- 32
	}

	local flags = {
		{}, -- First word added preemptively.
	}

	local flag_word = 1
	local flag_index = 1

	for name in pairs(private.FACTION_IDS_FROM_LABEL) do
		flags[flag_word][name] = BITS[flag_index]

		flag_index = flag_index + 1
		if flag_index > #BITS then
			flags[#flags + 1] = {}
			flag_word = flag_word + 1
			flag_index = 1
		end
	end

	for index = 1, #flags do
		private.FLAG_WORDS[#private.FLAG_WORDS + 1] = flags[index]
		private.FLAG_MEMBERS[#private.FLAG_MEMBERS + 1] = ("reputation%d"):format(index)
	end

	private.REP_FLAGS = flags
end

-------------------------------------------------------------------------------
-- This has to be done here, after every other flag definition.
-------------------------------------------------------------------------------
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
-- Zones.
-------------------------------------------------------------------------------
do
	local CONTINENT_NAMES = { _G.GetMapContinents() }

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
		NAGRAND_OUTLAND = (("%s %s"):format(_G.GetMapNameByID(477), _G.PARENS_TEMPLATE:format(CONTINENT_NAMES[6]))),
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
		TALADOR = _G.GetMapNameByID(946),
		NAGRAND_DRAENOR = (("%s %s"):format(_G.GetMapNameByID(950), _G.PARENS_TEMPLATE:format(CONTINENT_NAMES[14]))),
		TIMELESS_ISLE = _G.GetMapNameByID(951),
		LUNARFALL = _G.GetMapNameByID(971),
		FROSTWALL = _G.GetMapNameByID(976),
		STORMSHIELD = _G.GetMapNameByID(1009),
		WARSPEAR = _G.GetMapNameByID(1011),
		-------------------------------------------------------------------------------
		-- Continents
		-------------------------------------------------------------------------------
		KALIMDOR = CONTINENT_NAMES[2],
		EASTERN_KINGDOMS = CONTINENT_NAMES[4],
		OUTLAND = CONTINENT_NAMES[6],
		NORTHREND = CONTINENT_NAMES[8],
		THE_MAELSTROM = CONTINENT_NAMES[10],
		PANDARIA = CONTINENT_NAMES[12],
		DRAENOR = CONTINENT_NAMES[14],
	}

	constants.ZONE_NAMES = private.ZONE_NAMES
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

constants.BOSS_NAMES = private.BOSS_NAMES

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
