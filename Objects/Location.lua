-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string

local pairs = _G.pairs
local tonumber = _G.tonumber
local type = _G.type

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Location data.
-------------------------------------------------------------------------------
local ZONE_MAP_IDS = {
	UNKNOWN = -1,
	DUROTAR = 4,
	MULGORE = 9,
	NORTHERN_BARRENS = 11,
	KALIMDOR = 13,
	EASTERN_KINGDOMS = 14,
	ARATHI_HIGHLANDS = 16,
	BADLANDS = 17,
	BLASTED_LANDS = { 19, 992 },
	TIRISFAL_GLADES = 20,
	SILVERPINE_FOREST = 21,
	WESTERN_PLAGUELANDS = 22,
	EASTERN_PLAGUELANDS = 23,
	HILLSBRAD_FOOTHILLS = 24,
	THE_HINTERLANDS = 26,
	DUN_MOROGH = { 27, 939 },
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
	DUSTWALLOW_MARSH = { 141, 851, 906, 907 },
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
	ALTERAC_VALLEY = 401,
	ARATHI_BASIN = 461,
	EVERSONG_WOODS = 462,
	GHOSTLANDS = 463,
	AZUREMYST_ISLE = { 464, 1092 },
	HELLFIRE_PENINSULA = 465,
	OUTLAND = 466,
	ZANGARMARSH = 467,
	THE_EXODAR = { 471, 1091 },
	SHADOWMOON_VALLEY_OUTLAND = 473,
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
	PLAGUELANDS_THE_SCARLET_ENCLAVE = 502,
	DALARAN_NORTHREND = 504,
	CRYSTALSONG_FOREST = 510, -- Required for DALARAN
	THE_NEXUS = 520,
	THE_CULLING_OF_STRATHOLME = 521,
	AHNKAHET_THE_OLD_KINGDOM = 522,
	UTGARDE_KEEP = 523,
	UTGARDE_PINNACLE = 524,
	HALLS_OF_LIGHTNING = 525,
	HALLS_OF_STONE = 526,
	THE_EYE_OF_ETERNITY = 527,
	THE_OCULUS = 528,
	ULDUAR = 529,
	GUNDRAK = 530,
	THE_OBSIDIAN_SANCTUM = 531,
	VAULT_OF_ARCHAVON = 532,
	AZJOL_NERUB = 533,
	DRAKTHARON_KEEP = 534,
	NAXXRAMAS = 535,
	THE_VIOLET_HOLD = { 536, 1054, },
	GILNEAS = { 539, 545, 678, 679 },
	TRIAL_OF_THE_CRUSADER = 543,
	THE_LOST_ISLES = { 544, 681, 682, },
	THE_FORGE_OF_SOULS = 601,
	PIT_OF_SARON = 602,
	HALLS_OF_REFLECTION = 603,
	ICECROWN_CITADEL = 604,
	KEZAN = 605,
	MOUNT_HYJAL = { 606, 683 },
	SOUTHERN_BARRENS = 607,
	KELPTHAR_FOREST = 610,
	GILNEAS_CITY = 611,
	VASHJIR = 613,
	ABYSSAL_DEPTHS = 614,
	SHIMMERING_EXPANSE = 615,
	DEEPHOLM = 640,
	THE_CAPE_OF_STRANGLETHORN = 673,
	RAGEFIRE_CHASM = 680,
	RUINS_OF_GILNEAS = 684,
	THE_TEMPLE_OF_ATALHAKKAR = 687,
	GNOMEREGAN = 691,
	ULDAMAN = 692,
	MOLTEN_CORE = 696,
	DIRE_MAUL = 699,
	BLACKROCK_DEPTHS = 704,
	TOL_BARAD = 708,
	TOL_BARAD_PENINSULA = 709,
	THE_SHATTERED_HALLS = 710,
	RUINS_OF_AHNQIRAJ = 717,
	ONYXIAS_LAIR = 718,
	ULDUM = { 720, 748, },
	BLACKROCK_SPIRE = 721,
	AUCHENAI_CRYPTS = 722,
	SETHEKK_HALLS = 723,
	SHADOW_LABYRINTH = 724,
	THE_BLOOD_FURNACE = 725,
	THE_STEAMVAULT = 727,
	THE_SLAVE_PENS = 728,
	THE_BOTANICA = 729,
	THE_MECHANAR = 730,
	THE_ARCATRAZ = 731,
	MANA_TOMBS = 732,
	THE_BLACK_MORASS = 733,
	OLD_HILLSBRAD_FOOTHILLS = 734,
	LOST_CITY_OF_THE_TOLVIR = 747,
	WAILING_CAVERNS = 749,
	THE_MAELSTROM = { 737, 751, 1057 },
	BLACKWING_LAIR = 755,
	THE_DEADMINES = 756,
	RAZORFEN_DOWNS = 760,
	SCARLET_MONASTERY = 762,
	SHADOWFANG_KEEP = 764,
	STRATHOLME = 765,
	AHNQIRAJ = 766,
	THE_STONECORE = 768,
	THE_VORTEX_PINNACLE = 769,
	TWILIGHT_HIGHLANDS = { 700, 770 },
	AHNQIRAJ_THE_FALLEN_KINGDOM = 772,
	HYJAL_SUMMIT = 775,
	SERPENTSHRINE_CAVERN = 780,
	ZULAMAN = 781,
	TEMPEST_KEEP = 782,
	SUNWELL_PLATEAU = 789,
	ZULGURUB = 793,
	MOLTEN_FRONT = 795,
	BLACK_TEMPLE = { 796, 919, },
	MAGISTERS_TERRACE = 798,
	KARAZHAN = 799,
	FIRELANDS = 800,
	THE_JADE_FOREST = { 806, 880 },
	VALLEY_OF_THE_FOUR_WINDS = 807,
	THE_WANDERING_ISLE = 808,
	KUN_LAI_SUMMIT = { 809, 879 },
	TOWNLONG_STEPPES = 810,
	VALE_OF_ETERNAL_BLOSSOMS = { 811, 937 },
	WELL_OF_ETERNITY = 816,
	END_TIME = 820,
	DARKMOON_ISLAND = 823,
	DRAGON_SOUL = 824,
	KRASARANG_WILDS = { 857, 910, 911, 920, },
	DREAD_WASTES = 858,
	PANDARIA = 862,
	THE_VEILED_STAIR = 873,
	TERRACE_OF_ENDLESS_SPRING = 886,
	SUNSTRIDER_ISLE = 893, -- Required for SUNWELL_PLATEAU
	AMMEN_VALE = 894,
	NEW_TINKERTOWN = 895,
	MOGUSHAN_VAULTS = 896,
	HEART_OF_FEAR = 897,
	SCHOLOMANCE = 898,
	SHRINE_OF_TWO_MOONS = 903,
	SHRINE_OF_SEVEN_STARS = 905,
	DEEPRUN_TRAM = 922,
	BRAWLGAR_ARENA = 925,
	ISLE_OF_THUNDER = 928,
	ISLE_OF_GIANTS = 929,
	THRONE_OF_THUNDER = 930,
	ISLE_OF_THUNDER = 933,
	FROSTFIRE_RIDGE = 941, -- Required for FROSTWALL
	TANAAN_JUNGLE = { 945, 970, }, -- Required for Hellfire Citadel
	TALADOR = 946,
	SHADOWMOON_VALLEY_DRAENOR = 947, -- Required for LUNARFALL
	SPIRES_OF_ARAK = 948,
	GORGROND = 949,
	NAGRAND_DRAENOR = 950,
	TIMELESS_ISLE = 951,
	SIEGE_OF_ORGRIMMAR = 953,
	DRAENOR = 962,
	LUNARFALL = { 971, 973, 974, 975, 991, },
	FROSTWALL = { 976, 980, 981, 982, 990, },
	ASHRAN = 978, -- Required for STORMSHIELD and WARSPEAR
	IRON_DOCKS = 987,
	BLACKROCK_FOUNDRY = 988,
	SKYREACH = 989,
	UPPER_BLACKROCK_SPIRE = 995,
	BROKEN_ISLES = 1007,
	STORMSHIELD = 1009,
	WARSPEAR = 1011,
	DALARAN_BROKENISLES = 1014,
	AZSUNA = { 1015, 1053, },
	STORMHEIM = { 1017, 1037, },
	VALSHARAH = 1018,
	HIGHMOUNTAIN = 1024,
	HELLFIRE_CITADEL = 1026,
	VAULT_OF_THE_WARDENS = { 1032, 1045, },
	SURAMAR = { 1033, 1055, },
	HALLS_OF_VALOR = 1041,
	HELMOUTH_CLIFFS = 1042,
	EYE_OF_AZSHARA = { 1046, 1096, },
	NELTHARIONS_LAIR = 1065,
	VIOLET_HOLD = 1066,
	DARKHEART_THICKET = 1067,
	FIRELANDS = 1071, -- get rid of debug
	THE_ARCWAY = 1079,
	THUNDER_TOTEM = 1080,
	BLACK_ROOK_HOLD = 1081,
	COURT_OF_STARS = 1087,
	THE_NIGHTHOLD = 1088,
	THE_EMERALD_NIGHTMARE = 1094,
}

local ZONE_NAMES = {}
for zoneLabel, mapID in pairs(ZONE_MAP_IDS) do
	ZONE_NAMES[zoneLabel] = _G.GetMapNameByID(type(mapID) == "table" and mapID[1] or mapID) or _G.UNKNOWN
end
private.ZONE_NAMES = ZONE_NAMES
private.constants.ZONE_NAMES = ZONE_NAMES

-- Special cases, because Blizzard.
ZONE_NAMES.SHADOWMOON_VALLEY_OUTLAND = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.SHADOWMOON_VALLEY_OUTLAND), _G.PARENS_TEMPLATE:format(ZONE_NAMES.OUTLAND)))
ZONE_NAMES.SHADOWMOON_VALLEY_DRAENOR = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.SHADOWMOON_VALLEY_DRAENOR), _G.PARENS_TEMPLATE:format(ZONE_NAMES.DRAENOR)))
ZONE_NAMES.NAGRAND_OUTLAND = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.NAGRAND_OUTLAND), _G.PARENS_TEMPLATE:format(ZONE_NAMES.OUTLAND)))
ZONE_NAMES.NAGRAND_DRAENOR = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.NAGRAND_DRAENOR), _G.PARENS_TEMPLATE:format(ZONE_NAMES.DRAENOR)))
ZONE_NAMES.DALARAN_NORTHREND = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.DALARAN_NORTHREND), _G.PARENS_TEMPLATE:format(ZONE_NAMES.NORTHREND)))
ZONE_NAMES.DALARAN_BROKENISLES = (("%s %s"):format(_G.GetMapNameByID(ZONE_MAP_IDS.DALARAN_BROKENISLES), _G.PARENS_TEMPLATE:format(ZONE_NAMES.BROKEN_ISLES)))

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

-- These map IDs aren't tied to a continent, for whatever reason, so need to be added as special cases.
-- Instanced dungeons typically need to be added here.
local COSMIC_MAP_IDS = {
	THE_BLACK_MORASS = 733,
	OLD_HILLSBRAD_FOOTHILLS = 734,
	HYJAL_SUMMIT = 775,
	THE_WANDERING_ISLE = 808,
	DARKMOON_ISLAND = 823,
	IRON_DOCKS = 987,
	BLACKROCK_FOUNDRY = 988,
	SKYREACH = 989,
	UPPER_BLACKROCK_SPIRE = 995,
	VAULT_OF_THE_WARDENS = 1032,
	HALLS_OF_VALOR = 1041,
	HELMOUTH_CLIFFS = 1042,
	EYE_OF_AZSHARA = 1046,
	VIOLET_HOLD = 1066,
	THE_ARCWAY = 1079,
	BLACK_ROOK_HOLD = 1081,
	COURT_OF_STARS = 1087,
	THE_NIGHTHOLD = 1088,
	THE_EMERALD_NIGHTMARE = 1094,

}

local COSMIC_MAP_LOCATION_PARENT_MAPPING = {
	THE_BLACK_MORASS = ZONE_NAMES.TANARIS,
	OLD_HILLSBRAD_FOOTHILLS = ZONE_NAMES.TANARIS,
	HYJAL_SUMMIT = ZONE_NAMES.TANARIS,
}

-- Coordinates are relative to the instance's parent location.
local INSTANCE_ENTRANCE_COORDINATES = {
	AHNKAHET_THE_OLD_KINGDOM = "28.49:51.73",
	AHNQIRAJ_THE_FALLEN_KINGDOM = "0:0",
	AUCHENAI_CRYPTS = "34.32:65.62",
	AZJOL_NERUB = "26.01:50.83",
	BLACKROCK_DEPTHS = "20.72:36.94", -- TODO: Double check BLACKROCK_DEPTHS, BLACKROCK_SPIRE, and BLACKWING_LAIR - their coordinates are identical.
	BLACKROCK_SPIRE = "20.72:36.94",
	BLACKWING_LAIR = "20.72:36.94",
	DIRE_MAUL = "61.36:31.78",
	DRAKTHARON_KEEP = "0:0",
	FIRELANDS = "0:0", -- Needs Updating
	GNOMEREGAN = "31.29:37.89",
	HALLS_OF_LIGHTNING = "45.40:21.37",
	HALLS_OF_STONE = "39.49:26.92",
	HELLFIRE_CITADEL = "46.5:53.2",
	KARAZHAN = "46.85:74.66",
	MAGISTERS_TERRACE = "61.20:30.89",
	MANA_TOMBS = "39.64:57.65",
	OLD_HILLSBRAD_FOOTHILLS = "0:0",
	ONYXIAS_LAIR = "0:0",
	RUINS_OF_AHNQIRAJ = "0:0",
	SCHOLOMANCE = "0:0",
	SETHEKK_HALLS = "44.95:65.61",
	SHADOW_LABYRINTH = "39.64:73.58",
	SKYREACH = "36.0:33.9",
	STRATHOLME = "26.75:11.60",
	THE_ARCWAY = "43.0:61.7",
	THE_ARCATRAZ = "74.41:57.72",
	THE_BLACK_MORASS = "0:0",
	THE_BOTANICA = "71.77:54.92",
	THE_DEADMINES = "38.23:77.47",
	THE_MECHANAR = "70.62:69.77",
	THE_NEXUS = "27.50:25.97",
	THE_OCULUS = "27.52:26.71",
	THE_SHATTERED_HALLS = "47.50:52.04",
	THE_SLAVE_PENS = "48.95:35.70",
	THE_STEAMVAULT = "50.29:33.32",
	THE_TEMPLE_OF_ATALHAKKAR = "76.03:45.23",
	THE_VIOLET_HOLD = "66.78:68.19",
	UTGARDE_KEEP = "57.28:46.73",
	UTGARDE_PINNACLE = "57.26:46.67"
}

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

local LocationsByMapID = {}
private.LocationsByMapID = LocationsByMapID

local ContinentLocationByID = {}
private.ContinentLocationByID = ContinentLocationByID

-------------------------------------------------------------------------------
-- Location Methods.
-------------------------------------------------------------------------------
function Location:AssignRecipe(recipe, affiliation)
	self._recipes[recipe] = affiliation
end

function Location:ContinentID()
	return self._continentID
end

function Location:EntranceCoordinates()
	local coordinates = self._entranceCoordinates
	if coordinates then
		local x, y = (":"):split(coordinates)
		return tonumber(x), tonumber(y)
	end

	return 0, 0
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
			_entranceCoordinates = INSTANCE_ENTRANCE_COORDINATES[zoneLabel],
			_label = zoneLabel,
			_localizedName = localizedName,
			_mapID = mapID,
			_name = zoneName,
			_parent = parentLocation,
			_recipes = {},
		}, LocationMetatable)

		Locations[zoneName] = location
		LocationsByLocalizedName[localizedName] = location
		LocationsByMapID[mapID] = location

		if parentLocation then
			parentLocation._childLocations = parentLocation._childLocations or {}
			parentLocation._childLocations[zoneName] = location

			parentLocation._childLocationsByLocalizedName = parentLocation._childLocationsByLocalizedName or {}
			parentLocation._childLocationsByLocalizedName[localizedName] = location
		end

		return location
		-- Uncomment for debugging purposes when adding new map IDs
		              else
		                    private.Debug("No entry in ZONE_LABELS_FROM_MAP_ID for mapID %s (%s) - continentID %s.", mapID or "nil", _G.GetMapNameByID(mapID), continentID)
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

		if continent then
			ContinentLocationByID[continentID] = continent
			AddSubzoneLocations(continent)

			local zoneData = { _G.GetMapZones(continentID) }
			for zoneDataIndex = 1, #zoneData, 2 do
				local zone = AddLocation(continentID, zoneData[zoneDataIndex], continent)
				if zone then
					AddSubzoneLocations(zone)
				end
			end
		end
	end
end

local cosmicMap = AddLocation(_G.WORLDMAP_COSMIC_ID, _G.WORLDMAP_COSMIC_ID)
ContinentLocationByID[_G.WORLDMAP_COSMIC_ID] = cosmicMap

for label, mapID in pairs(COSMIC_MAP_IDS) do
	local parentLocation = LocationsByLocalizedName[COSMIC_MAP_LOCATION_PARENT_MAPPING[label]] or cosmicMap
	AddLocation(parentLocation._continentID, mapID, parentLocation)
end
