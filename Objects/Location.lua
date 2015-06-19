-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Location data.
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

    private.constants.ZONE_NAMES = private.ZONE_NAMES
end

private.ZONE_LABELS_FROM_NAME = {}

for label, name in pairs(private.ZONE_NAMES) do
    private.ZONE_LABELS_FROM_NAME[name] = label
end

-------------------------------------------------------------------------------
-- Objects.
-------------------------------------------------------------------------------
local Location = {}
local LocationMetatable = {
    __index = Location,
}

private.Locations = {}

-------------------------------------------------------------------------------
-- Location Methods.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Instantiation.
-------------------------------------------------------------------------------
local function CreateLocations()
end
