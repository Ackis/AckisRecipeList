-- ----------------------------------------------------------------------------
-- Upvalued Lua API
-- ----------------------------------------------------------------------------
local pairs = _G.pairs
local string = _G.string

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
private.addon_name = "Ackis Recipe List"

local LibStub = _G.LibStub

-- Required so constants can be assigned to the AddOn object in Core.lua in order to be accessible from profession modules
local constants = {}
private.constants = constants

-- ----------------------------------------------------------------------------
-- Debugger.
-- ----------------------------------------------------------------------------
do
	local TextDump = LibStub("LibTextDump-1.0")

	local DEBUGGER_WIDTH = 750
	local DEBUGGER_HEIGHT = 800

	local debugger

	function private.Debug(...)
		if not debugger then
			debugger = TextDump:New(("%s Debug Output"):format(FOLDER_NAME), DEBUGGER_WIDTH, DEBUGGER_HEIGHT)
		end

		local message = string.format(...)
		debugger:AddLine(message, "%X")

		return message
	end

	function private.GetDebugger()
		if not debugger then
			debugger = TextDump:New(("%s Debug Output"):format(FOLDER_NAME), DEBUGGER_WIDTH, DEBUGGER_HEIGHT)
		end

		return debugger
	end
end


-- ----------------------------------------------------------------------------
-- General constants.
-- ----------------------------------------------------------------------------
private.PLAYER_NAME = _G.UnitName("player")
private.REALM_NAME = _G.GetRealmName()

private.COORDINATES_FORMAT = "(%.2f, %.2f)"

private.VENDOR_TYPE_FORMAT = _G.BATTLE_PET_SOURCE_3 .. " " .. _G.PARENS_TEMPLATE

-- ----------------------------------------------------------------------------
-- Item qualities.
-- ----------------------------------------------------------------------------
private.ITEM_QUALITY_NAMES = {
	"COMMON",
	"UNCOMMON",
	"RARE",
	"EPIC",
	"LEGENDARY",
	"ARTIFACT",
}

private.ITEM_QUALITIES = {}
constants.ITEM_QUALITIES = private.ITEM_QUALITIES

for index = 1, #private.ITEM_QUALITY_NAMES do
	private.ITEM_QUALITIES[private.ITEM_QUALITY_NAMES[index]] = index
end

-- ----------------------------------------------------------------------------
-- Game/expansion versions.
-- ----------------------------------------------------------------------------
private.GAME_VERSION_NAMES = {
	"ORIG",
	"TBC",
	"WOTLK",
	"CATA",
	"MOP",
	"WOD",
	"LEGION",
	"BFA",
	"SHA"
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

private.EXPANSION_LOGOS = {
	[_G.LE_EXPANSION_CLASSIC] = { texture = [[Interface\Glues\Common\Glues-WoW-ClassicLogo]] },
	[_G.LE_EXPANSION_BURNING_CRUSADE] = { texture = [[Interface\Glues\Common\Glues-WoW-BCLogo]] },
	[_G.LE_EXPANSION_WRATH_OF_THE_LICH_KING] = { texture = [[Interface\Glues\Common\Glues-WoW-WotLKLogo]] },
	[_G.LE_EXPANSION_CATACLYSM] = { texture = [[Interface\Glues\Common\Glues-WoW-CCLogo]] },
	[_G.LE_EXPANSION_MISTS_OF_PANDARIA] = { texture = [[Interface\Glues\Common\Glues-WoW-MPLogo]] },
	[_G.LE_EXPANSION_WARLORDS_OF_DRAENOR] = { texture = [[Interface\Glues\Common\GLUES-WOW-WODLOGO]] },
	[_G.LE_EXPANSION_LEGION] = { atlas = "Glues-WoW-LegionLogo" },
	[_G.LE_EXPANSION_BATTLE_FOR_AZEROTH] = { texture = [[Interface\Glues\Common\Glues-WoW-BattleforAzerothLogo]] },
	[_G.LE_EXPANSION_SHADOWLANDS] = { texture = [[Interface\Glues\Common\Glues-WoW-ShadowlandsLogo]] },

}

-- ----------------------------------------------------------------------------
-- Common filter bitfield word 1.
-- ----------------------------------------------------------------------------
private.COMMON_FLAGS_WORD1 = {
	ALLIANCE		= 0x00000001,	-- 1
	ACHIEVEMENT		= 0x00000002,	-- 2
	CASTER			= 0x00000004,	-- 3
	DISC			= 0x00000008,	-- 4
	DPS			= 0x00000010,	-- 5
	HEALER			= 0x00000020,	-- 6
	HORDE			= 0x00000040,	-- 7
	INSTANCE		= 0x00000080,	-- 8
	CUSTOM			= 0x00000100,	-- 9
	MOB_DROP		= 0x00000200,	-- 10
	PVP			= 0x00000400,	-- 11
	QUEST			= 0x00000800,	-- 12
	RAID			= 0x00001000,	-- 13
	REPUTATION		= 0x00002000,	-- 14
	RETIRED			= 0x00004000,	-- 15
	TANK			= 0x00008000,	-- 16
	TRAINER			= 0x00010000,	-- 17
	VENDOR			= 0x00020000,	-- 18
	WORLD_DROP		= 0x00040000,	-- 19
	WORLD_EVENT		= 0x00080000,	-- 20
	TRADE_SKILL		= 0x00100000,	-- 21
}

-- ----------------------------------------------------------------------------
-- Class filter bitfield word 1.
-- ----------------------------------------------------------------------------
private.CLASS_FLAGS_WORD1 = {
	DK			= 0x00000001,	-- 1
	DRUID			= 0x00000002,	-- 2
	HUNTER			= 0x00000004,	-- 3
	MAGE			= 0x00000008,	-- 4
	PALADIN			= 0x00000010,	-- 5
	PRIEST			= 0x00000020,	-- 6
	SHAMAN			= 0x00000040,	-- 7
	ROGUE			= 0x00000080,	-- 8
	WARLOCK			= 0x00000100,	-- 9
	WARRIOR			= 0x00000200,	-- 10
	MONK			= 0x00000400,	-- 11
	DEMONHUNTER		= 0x00000800,	-- 12
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

-- ----------------------------------------------------------------------------
-- Item filter types.
-- ----------------------------------------------------------------------------
constants.ITEM_FILTER_TYPES = {} -- Populated via profession modules.

-- ----------------------------------------------------------------------------
-- Reputation levels.
-- ----------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Factions.
-- ----------------------------------------------------------------------------
private.FACTION_LABELS_FROM_ID = {
	-- ----------------------------------------------------------------------------
	-- Classic
	-- ----------------------------------------------------------------------------
	[59]	= "THORIUM_BROTHERHOOD",
	[529]	= "ARGENT_DAWN",
	[576]	= "TIMBERMAW_HOLD",
	[609]	= "CENARION_CIRCLE",
	-- ----------------------------------------------------------------------------
	-- The Burning Crusade
	-- ----------------------------------------------------------------------------
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
	-- ----------------------------------------------------------------------------
	-- Wrath of the Lich King
	-- ----------------------------------------------------------------------------
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
	-- ----------------------------------------------------------------------------
	-- Mists of Pandaria
	-- ----------------------------------------------------------------------------
	[1269]	= "GOLDEN_LOTUS",
	[1270]	= "SHADO_PAN",
	[1271]	= "ORDER_OF_THE_CLOUD_SERPENT",
	[1272]	= "THE_TILLERS",
	[1302]	= "THE_ANGLERS",
	[1337]	= "THE_KLAXXI",
	[1341]	= "THE_AUGUST_CELESTIALS",
	-- ----------------------------------------------------------------------------
	-- Warlords of Draenor
	-- ----------------------------------------------------------------------------

	-- ----------------------------------------------------------------------------
	-- Legion
	-- ----------------------------------------------------------------------------
	[1828]	= "HIGHMOUNTAIN_TRIBE",
	[1859]	= "THE_NIGHTFALLEN",
	[1883]	= "DREAMWEAVERS",
	[1894]	= "THE_WARDENS",
	[1900]	= "COURT_OF_FARONDIS",
	[1948]	= "VALARJAR",
	[2165]	= "ARMY_OF_THE_LIGHT",
	[2170]	= "ARGUSSIAN_REACH",

	-- ----------------------------------------------------------------------------
	-- Battle for Azeroth
	-- ----------------------------------------------------------------------------
	[2103]  = "ZANDALARI_EMPIRE",
	[2156]  = "TALANJIS_EXPEDITION",
	[2157]	= "THE_HONORBOUND",
	[2158]  = "VOLDUNAI",
	[2159]	= "SEVENTH_LEGION",
	[2160]  = "PROUDMOORE_ADMIRALTY",
	[2161]  = "ORDER_OF_EMBERS",
	[2162]  = "STORMS_WAKE",
	[2163]  = "TORTOLLAN_SEEKERS",
	[2164]	= "CHAMPIONS_OF_AZEROTH",
	[2373]  = "UNSHACKLED",
	[2391]  = "RUSTBOLT_RESISTANCE",
	[2400]  = "ANKOAN",
	[2415]	= "RAJANI",
	[2417]	= "ULDUM_ACCORD",

	-- ----------------------------------------------------------------------------
	-- Shadowlands
	-- ----------------------------------------------------------------------------
	[2407]  = "THE_ASCENDED",
	[2410]	= "THE_UNDYING_ARMY",
	[2413]	= "COURT_OF_HARVESTERS",
	[2422]	= "THE_WILD_HUNT",
	[2439]	= "THE_AVOWED",

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

private.EXPANSION6_REPUTATIONS = {
	"HIGHMOUNTAIN_TRIBE",
	"THE_NIGHTFALLEN",
	"DREAMWEAVERS",
	"THE_WARDENS",
	"COURT_OF_FARONDIS",
	"VALARJAR",
	"ARMY_OF_THE_LIGHT",
	"ARGUSSIAN_REACH",
}

private.EXPANSION7_REPUTATIONS = {
	"ZANDALARI_EMPIRE",
	"TALANJIS_EXPEDITION",
	"THE_HONORBOUND",
	"VOLDUNAI",
	"SEVENTH_LEGION",
	"PROUDMOORE_ADMIRALTY",
	"ORDER_OF_EMBERS",
	"STORMS_WAKE",
	"TORTOLLAN_SEEKERS",
	"CHAMPIONS_OF_AZEROTH",
	"UNSHACKLED",
	"RUSTBOLT_RESISTANCE",
	"ANKOAN",
	"RAJANI",
	"ULDUM_ACCORD",
}

private.EXPANSION8_REPUTATIONS = {

}

private.EXPANSION9_REPUTATIONS = {
	"THE_ASCENDED",
	"THE_AVOWED",
	"COURT_OF_HARVESTERS",
	"THE_UNDYING_ARMY",
	"THE_WILD_HUNT",

}


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

-- ----------------------------------------------------------------------------
-- This has to be done here, after every other flag definition.
-- ----------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Boss names.
-- ----------------------------------------------------------------------------
private.BOSS_NAMES = {
	RAGNAROS = _G.EJ_GetEncounterInfo(198),
	LORD_ROCCOR = _G.EJ_GetEncounterInfo(370),
	PYROMANCER_LOREGRAIN = _G.EJ_GetEncounterInfo(373),
	GOLEM_LORD_ARGELMACH = _G.EJ_GetEncounterInfo(379),
	RIBBLY_SCREWSPIGOT = _G.EJ_GetEncounterInfo(382),
	PLUGGER_SPAZZRING = _G.EJ_GetEncounterInfo(383),
	QUARTERMASTER_ZIGRIS = _G.EJ_GetEncounterInfo(393),
	OVERLORD_WYRMTHALAK = _G.EJ_GetEncounterInfo(396),
	SOLAKAR_FLAMEWREATH = _G.EJ_GetEncounterInfo(398),
	GENERAL_DRAKKISATH = _G.EJ_GetEncounterInfo(401),
	MAGISTER_KALENDRIS = _G.EJ_GetEncounterInfo(408),
	MEKGINEER_THERMAPLUGG = _G.EJ_GetEncounterInfo(422),
	WILLEY_HOPEBREAKER = _G.EJ_GetEncounterInfo(446),
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
	BROGGOK = _G.EJ_GetEncounterInfo(556),
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
	HIGH_SAGE_VIRYX = _G.EJ_GetEncounterInfo(968),
	RUKHMAR = _G.EJ_GetEncounterInfo(1262),
	SHADOW_LORD_ISKAR = _G.EJ_GetEncounterInfo(1433),
	CORDANA_FELSONG = _G.EJ_GetEncounterInfo(1470),
	ODYN = _G.EJ_GetEncounterInfo(1489),
	WRATH_OF_AZSHARA = _G.EJ_GetEncounterInfo(1492),
	ADVISOR_VANDROS = _G.EJ_GetEncounterInfo(1501),
	GARR = _G.EJ_GetEncounterInfo(1522),
	MOAM = _G.EJ_GetEncounterInfo(1539),
	THE_PROPHET_SKERAM = _G.EJ_GetEncounterInfo(1543),
	THE_TWIN_EMPERORS = _G.EJ_GetEncounterInfo(1549),
	ATTUMEN_THE_HUNTSMAN = _G.EJ_GetEncounterInfo(1553),
	MOROES = _G.EJ_GetEncounterInfo(1554),
	SHADE_OF_ARAN = _G.EJ_GetEncounterInfo(1559),
	TERESTIAN_ILLHOOF = _G.EJ_GetEncounterInfo(1560),
	OPERA_HALL = _G.EJ_GetEncounterInfo(1556),
	SHADE_OF_XAVIUS = _G.EJ_GetEncounterInfo(1657),
	HELYA = _G.EJ_GetEncounterInfo(1663),
	URSOC = _G.EJ_GetEncounterInfo(1667),
	LORD_KURTALOS_RAVENCREST = _G.EJ_GetEncounterInfo(1672),
	DARGRUL_THE_UNDERKING = _G.EJ_GetEncounterInfo(1687),
	SAELORN = _G.EJ_GetEncounterInfo(1697),
	NYTHENDRA = _G.EJ_GetEncounterInfo(1703),
	DRAGONS_OF_NIGHTMARE = _G.EJ_GetEncounterInfo(1704),
	SKORPYRON = _G.EJ_GetEncounterInfo(1706),
	KROSUS = _G.EJ_GetEncounterInfo(1713),
	ADVISOR_MELANDRUS = _G.EJ_GetEncounterInfo(1720),
	CHRONOMATIC_ANOMALY = _G.EJ_GetEncounterInfo(1725),
	XAVIUS = _G.EJ_GetEncounterInfo(1726),
	TRILLIAX = _G.EJ_GetEncounterInfo(1731),
	STAR_AUGUR_ETRAEUS = _G.EJ_GetEncounterInfo(1732),
	GULDAN = _G.EJ_GetEncounterInfo(1737),
	ILGYNOTH__HEART_OF_CORRUPTION = _G.EJ_GetEncounterInfo(1738),
	GRAND_MAGISTRIX_ELISANDE = _G.EJ_GetEncounterInfo(1743),
	ELERETHE_RENFERAL = _G.EJ_GetEncounterInfo(1744),
	NITHOGG = _G.EJ_GetEncounterInfo(1749),
	CENARIUS = _G.EJ_GetEncounterInfo(1750),
	SPELLBLADE_ALURIEL = _G.EJ_GetEncounterInfo(1751),
	HIGH_BOTANIST_TELARN = _G.EJ_GetEncounterInfo(1761),
	TICHONDRIUS = _G.EJ_GetEncounterInfo(1762),
	LEVANTUS = _G.EJ_GetEncounterInfo(1769),
	CALAMIR = _G.EJ_GetEncounterInfo(1774),
	NAZAK_THE_FIEND = _G.EJ_GetEncounterInfo(1783),
	DRUGON_THE_FROSTBLOOD = _G.EJ_GetEncounterInfo(1789),
	ANA_MOUZ = _G.EJ_GetEncounterInfo(1790),
	GUARM = _G.EJ_GetEncounterInfo(1830),
	KILJAEDEN = _G.EJ_GetEncounterInfo(1898),
	PORTAL_KEEPER_HASABEL = _G.EJ_GetEncounterInfo(1985),
	FELHOUNDS_OF_SARGERAS = _G.EJ_GetEncounterInfo(1987),
	GAROTHI_WORLDBREAKER = _G.EJ_GetEncounterInfo(1992),
	ANTORAN_HIGH_COMMAND = _G.EJ_GetEncounterInfo(1997),
	RAAL_THE_GLUTTONOUS = _G.EJ_GetEncounterInfo(2127),
	MOTHER = _G.EJ_GetEncounterInfo(2167),
	ZUL_REBORN = _G.EJ_GetEncounterInfo(2195),
	DOOMS_HOWL = _G.EJ_GetEncounterInfo(2213),
	HIGH_TINKER_MEKKATORQUE = _G.EJ_GetEncounterInfo(2334),
	KING_RASTAKHAN = _G.EJ_GetEncounterInfo(2335),
	LADY_JAINA_PROUDMOORE = _G.EJ_GetEncounterInfo(2343),
	NZOTH_THE_CORRUPTOR = _G.EJ_GetEncounterInfo(2375),
}

constants.BOSS_NAMES = private.BOSS_NAMES

-- ----------------------------------------------------------------------------
-- Colors.
-- ----------------------------------------------------------------------------
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
