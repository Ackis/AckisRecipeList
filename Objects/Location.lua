-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs
local string = _G.string
local type = _G.type

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Location data.
-------------------------------------------------------------------------------
local ZONE_MAP_IDS = {
    DUROTAR = 4,
    MULGORE = 9,
    NORTHERN_BARRENS = 11,
    KALIMDOR = 13,
    EASTERN_KINGDOMS = 14,
    ARATHI_HIGHLANDS = 16,
    BADLANDS = 17,
    BLASTED_LANDS = 19,
    TIRISFAL_GLADES = 20,
    SILVERPINE_FOREST = 21,
    WESTERN_PLAGUELANDS = 22,
    EASTERN_PLAGUELANDS = 23,
    HILLSBRAD_FOOTHILLS = 24,
    THE_HINTERLANDS = 26,
    DUN_MOROGH = 27,
    SEARING_GORGE = 28,
    BURNING_STEPPES = 29,
    ELWYNN_FOREST = 30,
    DEADWIND_PASS = 32,
    DUSKWOOD = 34,
    LOCH_MODAN = 35,
    REDRIDGE_MOUNTAINS = 36,
    NORTHERN_STRANGLETHORN = 37,
    SWAMP_OF_SORROWS = 38,
    WESTFALL = 39,
    WETLANDS = 40,
    TELDRASSIL = 41,
    DARKSHORE = 42,
    ASHENVALE = 43,
    THOUSAND_NEEDLES = 61,
    STONETALON_MOUNTAINS = 81,
    DESOLACE = 101,
    FERALAS = 121,
    DUSTWALLOW_MARSH = { 141, 851, 906 },
    TANARIS = 161,
    AZSHARA = 181,
    FELWOOD = 182,
    UNGORO_CRATER = 201,
    MOONGLADE = 241,
    SILITHUS = 261,
    WINTERSPRING = 281,
    STORMWIND_CITY = 301,
    ORGRIMMAR = 321,
    IRONFORGE = 341,
    THUNDER_BLUFF = 362,
    DARNASSUS = 381,
    UNDERCITY = 382,
    EVERSONG_WOODS = 462,
    GHOSTLANDS = 463,
    AZUREMYST_ISLE = 464,
    HELLFIRE_PENINSULA = 465,
    OUTLAND = 466,
    ZANGARMARSH = 467,
    THE_EXODAR = 471,
    SHADOWMOON_VALLEY = 473,
    BLADES_EDGE_MOUNTAINS = 475,
    BLOODMYST_ISLE = 476,
    NAGRAND_OUTLAND = 477,
    TEROKKAR_FOREST = 478,
    NETHERSTORM = 479,
    SILVERMOON_CITY = 480,
    SHATTRATH_CITY = 481,
    NORTHREND = 485,
    BOREAN_TUNDRA = 486,
    DRAGONBLIGHT = 488,
    GRIZZLY_HILLS = 490,
    HOWLING_FJORD = 491,
    ICECROWN = 492,
    SHOLAZAR_BASIN = 493,
    THE_STORM_PEAKS = 495,
    ZULDRAK = 496,
    ISLE_OF_QUELDANAS = 499,
    WINTERGRASP = 501,
    DALARAN = 504,
    CRYSTALSONG_FOREST = 510, -- Required for DALARAN
    THE_NEXUS = 520,
    AHNKAHET_THE_OLD_KINGDOM = 522,
    UTGARDE_KEEP = 523,
    UTGARDE_PINNACLE = 524,
    HALLS_OF_LIGHTNING = 525,
    HALLS_OF_STONE = 526,
    THE_OCULUS = 528,
    ULDUAR = 529,
    AZJOL_NERUB = 533,
    DRAKTHARON_KEEP = 534,
    THE_VIOLET_HOLD = 536,
    GILNEAS = { 539, 545, 678, 679, },
    TRIAL_OF_THE_CRUSADER = 543,
    THE_LOST_ISLES = 544,
    ICECROWN_CITADEL = 604,
    MOUNT_HYJAL = 606,
    SOUTHERN_BARRENS = 607,
    VASHJIR = 613,
    ABYSSAL_DEPTHS = 614,
    DEEPHOLM = 640,
    THE_CAPE_OF_STRANGLETHORN = 673,
    THE_TEMPLE_OF_ATALHAKKAR = 687,
    GNOMEREGAN = 691,
    ULDAMAN = 692,
    MOLTEN_CORE = 696,
    DIRE_MAUL = 699,
    BLACKROCK_DEPTHS = 704,
    THE_SHATTERED_HALLS = 710,
    RUINS_OF_AHNQIRAJ = 717,
    ONYXIAS_LAIR = 718,
    ULDUM = 720,
    BLACKROCK_SPIRE = 721,
    AUCHENAI_CRYPTS = 722,
    SETHEKK_HALLS = 723,
    SHADOW_LABYRINTH = 724,
    THE_STEAMVAULT = 727,
    THE_SLAVE_PENS = 728,
    THE_BOTANICA = 729,
    THE_MECHANAR = 730,
    THE_ARCATRAZ = 731,
    MANA_TOMBS = 732,
    THE_BLACK_MORASS = 733,
    OLD_HILLSBRAD_FOOTHILLS = 734,
    WAILING_CAVERNS = 749,
    THE_MAELSTROM = 751,
    BLACKWING_LAIR = 755,
    THE_DEADMINES = 756,
    RAZORFEN_DOWNS = 760,
    STRATHOLME = 765,
    AHNQIRAJ = 766,
    TWILIGHT_HIGHLANDS = { 700, 770, },
    AHNQIRAJ_THE_FALLEN_KINGDOM = 772,
    HYJAL_SUMMIT = 775,
    SERPENTSHRINE_CAVERN = 780,
    TEMPEST_KEEP = 782,
    SUNWELL_PLATEAU = 789,
    MOLTEN_FRONT = 795,
    BLACK_TEMPLE = 796,
    MAGISTERS_TERRACE = 798,
    KARAZHAN = 799,
    FIRELANDS = 800,
    THE_JADE_FOREST = { 806, 880, },
    VALLEY_OF_THE_FOUR_WINDS = 807,
    THE_WANDERING_ISLE = 808,
    TOWNLONG_STEPPES = 810,
    VALE_OF_ETERNAL_BLOSSOMS = 811,
    DARKMOON_ISLAND = 823,
    DRAGON_SOUL = 824,
    KRASARANG_WILDS = 857,
    DREAD_WASTES = 858,
    PANDARIA = 862,
    THE_VEILED_STAIR = 873,
    KUN_LAI_SUMMIT = { 809, 879, },
    TERRACE_OF_ENDLESS_SPRING = 886,
    SUNSTRIDER_ISLE = 893, -- Required for SUNWELL_PLATEAU
    NEW_TINKERTOWN = 895,
    MOGUSHAN_VAULTS = 896,
    HEART_OF_FEAR = 897,
    SCHOLOMANCE = 898,
    SHRINE_OF_TWO_MOONS = 903,
    SHRINE_OF_SEVEN_STARS = 905,
    ISLE_OF_THUNDER = 928,
    FROSTFIRE_RIDGE = 941, -- Required for FROSTWALL
    TALADOR = 946,
    SHADOWMOON_VALLEY_DRAENOR = 947, -- Required for LUNARFALL
    NAGRAND_DRAENOR = 950,
    TIMELESS_ISLE = 951,
    DRAENOR = 962,
    LUNARFALL = { 971, 973, 974, 975, 991, },
    FROSTWALL = { 976, 980, 981, 982, 990, },
    ASHRAN = 978, -- Required for STORMSHIELD and WARSPEAR
    STORMSHIELD = 1009,
    WARSPEAR = 1011,
}

local ZONE_NAMES = {}
for zoneLabel, mapID in pairs(ZONE_MAP_IDS) do
    ZONE_NAMES[zoneLabel] = _G.GetMapNameByID(type(mapID) == "table" and mapID[1] or mapID)
end
private.ZONE_NAMES = ZONE_NAMES
private.constants.ZONE_NAMES = ZONE_NAMES

-- Special cases, because Blizzard.
ZONE_NAMES.SHADOWMOON_VALLEY_DRAENOR = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.SHADOWMOON_VALLEY_DRAENOR), _G.PARENS_TEMPLATE:format(ZONE_NAMES.DRAENOR)))
ZONE_NAMES.NAGRAND_OUTLAND = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.NAGRAND_OUTLAND), _G.PARENS_TEMPLATE:format(ZONE_NAMES.OUTLAND)))
ZONE_NAMES.NAGRAND_DRAENOR = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.NAGRAND_DRAENOR), _G.PARENS_TEMPLATE:format(ZONE_NAMES.DRAENOR)))

local ZONE_LABELS_FROM_NAME = {}
private.ZONE_LABELS_FROM_NAME = ZONE_LABELS_FROM_NAME

local ZONE_LABELS_FROM_MAP_ID = {}

for label, name in pairs(ZONE_NAMES) do
    ZONE_LABELS_FROM_NAME[name] = label

    local mapIDValue = ZONE_MAP_IDS[label]
    if type(mapIDValue) == "table" then
        for mapIDIndex = 1, #mapIDValue do
            ZONE_LABELS_FROM_MAP_ID[mapIDValue[mapIDIndex]] = label
        end
    else
        ZONE_LABELS_FROM_MAP_ID[mapIDValue] = label
    end
end

-------------------------------------------------------------------------------
-- Objects.
-------------------------------------------------------------------------------
local Location = {}
local LocationMetatable = {
    __index = Location,
}

local Locations = {}
private.Locations = Locations

local LocationsByLocalizedName = {}
private.LocationsByLocalizedName = LocationsByLocalizedName

-------------------------------------------------------------------------------
-- Location Methods.
-------------------------------------------------------------------------------
function Location:AssignRecipe(recipe, affiliation)
    self._recipes[recipe] = affiliation
end

function Location:ContinentID()
    return self._continentID
end

function Location:GetRecipeAffiliation(recipe)
    return self._recipes[recipe]
end

function Location:GetSortedRecipes()
    return private.SortRecipePairs(self._recipes)
end

function Location:HasRecipe(recipe)
    return self._recipes[recipe]
end

function Location:Label()
    return self._label
end

function Location:LocalizedName()
    return self._localizedName
end

function Location:MapID()
    return self._mapID
end

function Location:Name()
    return self._name
end

function Location:Parent()
    return self._parent
end

function Location:RecipePairs()
    return pairs(self._recipes)
end

-------------------------------------------------------------------------------
-- Instantiation.
-------------------------------------------------------------------------------
local function AddLocation(continentID, mapID, parentLocation)
    local zoneLabel = ZONE_LABELS_FROM_MAP_ID[mapID]
    if zoneLabel then
        -- Allows TitleCase lookups. For example - "private.Locations.ShadowmoonValleyDraenor"
        local zoneName = zoneLabel:lower():gsub("^%l", string.upper):gsub("_%l", string.upper):gsub("_", "")
        local localizedName = ZONE_NAMES[zoneLabel]

        local location = _G.setmetatable({
            _continentID = continentID,
            _label = zoneLabel,
            _localizedName = localizedName,
            _mapID = mapID,
            _name = zoneName,
            _parent = parentLocation,
            _recipes = {},
        }, LocationMetatable)

        Locations[zoneName] = location
        LocationsByLocalizedName[localizedName] = location

        if parentLocation then
            parentLocation._childLocations = parentLocation._childLocations or {}
            parentLocation._childLocations[zoneName] = location

            parentLocation._childLocationsByLocalizedName = parentLocation._childLocationsByLocalizedName or {}
            parentLocation._childLocationsByLocalizedName[localizedName] = location
        end

        return location
            -- Uncomment for debugging purposes when adding new map IDs
        --                else
        --                    private.Debug("No entry in ZONE_LABELS_FROM_MAP_ID for mapID %s (%s) - continentID %s.", mapID or "nil", _G.GetMapNameByID(mapID), continentID)
    end
end

local function AddSubzoneLocations(parentLocation)
    local zoneData = { _G.GetMapSubzones(parentLocation._mapID) }
    for zoneDataIndex = 1, #zoneData, 2 do
        local zone = AddLocation(parentLocation._continentID, zoneData[zoneDataIndex], parentLocation)
        if zone then
            AddSubzoneLocations(zone)
        end
    end
end

local mapContinentData = { _G.GetMapContinents() }
for dataIndex = 1, #mapContinentData do
    if dataIndex % 2 == 0 then
        local continentID = dataIndex / 2
        local continentMapID = mapContinentData[dataIndex - 1]
        local continent = AddLocation(continentID, continentMapID)

        local zoneData = { _G.GetMapZones(continentID) }
        for zoneDataIndex = 1, #zoneData, 2 do
            local zone = AddLocation(continentID, zoneData[zoneDataIndex], continent)
            if zone then
                AddSubzoneLocations(zone)
            end
        end
    end
end

