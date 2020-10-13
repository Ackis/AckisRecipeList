-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------

local string = _G.string

local pairs = _G.pairs
local tonumber = _G.tonumber
local type = _G.type

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-- ----------------------------------------------------------------------------
-- Location data.
-- ----------------------------------------------------------------------------
local ZONE_MAP_IDS = {

	-------------------------------------------------------------------------------
	-- Continents
	-------------------------------------------------------------------------------
	KALIMDOR = 12,
	EASTERN_KINGDOMS = 13,
	OUTLAND = 101,
	NORTHREND = 113,
	PANDARIA = 424,
	DRAENOR = 572,
	BROKEN_ISLES = 619,
	ZANDALAR = 875,
	KUL_TIRAS = 876,
	ARGUS = 905,
	COSMIC = 946,
	AZEROTH = 947,
	THE_MAELSTROM = 948,
	THE_SHADOWLANDS = 1550,

	DUROTAR = 1,
	MULGORE = 7,
	NORTHERN_BARRENS = 10,
	ARATHI_HIGHLANDS = 14,
	BADLANDS = 15,
	BLASTED_LANDS = 17,
	TIRISFAL_GLADES = 18,
	SILVERPINE_FOREST = 21,
	WESTERN_PLAGUELANDS = 22,
	EASTERN_PLAGUELANDS = 23,
	HILLSBRAD_FOOTHILLS = 25,
	THE_HINTERLANDS = 26,
	DUN_MOROGH = 27,
	SEARING_GORGE = 32,
	BURNING_STEPPES = 36,
	ELWYNN_FOREST = 37,
	DEADWIND_PASS = 42,
	DUSKWOOD = 47,
	LOCH_MODAN = 48,
	REDRIDGE_MOUNTAINS = 49,
	NORTHERN_STRANGLETHORN = 50,
	SWAMP_OF_SORROWS = 51,
	WESTFALL = 52,
	WETLANDS = 56,
	TELDRASSIL = 57,
	DARKSHORE = 62,
	ASHENVALE = 63,
	THOUSAND_NEEDLES = 64,
	STONETALON_MOUNTAINS = 65,
	DESOLACE = 66,
	FERALAS = 69,
	DUSTWALLOW_MARSH = 70,
	TANARIS = 71,
	AZSHARA = 76,
	FELWOOD = 77,
	UNGORO_CRATER = 78,
	MOONGLADE = 80,
	SILITHUS = 81,
	WINTERSPRING = 83,
	STORMWIND_CITY = 84,
	ORGRIMMAR = 85,
	IRONFORGE = 87,
	THUNDER_BLUFF = 88,
	DARNASSUS = 89,
	UNDERCITY = { 90, 998 },
	ALTERAC_VALLEY = 91,
	ARATHI_BASIN = 93,
	EVERSONG_WOODS = 94,
	GHOSTLANDS = 95,
	AZUREMYST_ISLE = 97,
	HELLFIRE_PENINSULA = 100,
	ZANGARMARSH = 102,
	THE_EXODAR = 103,
	SHADOWMOON_VALLEY_OUTLAND = 104,
	BLADES_EDGE_MOUNTAINS = 105,
	BLOODMYST_ISLE = 106,
	NAGRAND_OUTLAND = 107,
	TEROKKAR_FOREST = 108,
	NETHERSTORM = 109,
	SILVERMOON_CITY = 110,
	SHATTRATH_CITY = 111,
	BOREAN_TUNDRA = 114,
	DRAGONBLIGHT = 115,
	GRIZZLY_HILLS = 116,
	HOWLING_FJORD = 117,
	ICECROWN = 118,
	SHOLAZAR_BASIN = 119,
	THE_STORM_PEAKS = 120,
	ZULDRAK = 121,
	ISLE_OF_QUELDANAS = 122,
	WINTERGRASP = 123,
	PLAGUELANDS_THE_SCARLET_ENCLAVE = 124,
	DALARAN_NORTHREND = 125,
	CRYSTALSONG_FOREST = 127,
	THE_NEXUS = 129,
	THE_CULLING_OF_STRATHOLME = 130,
	AHNKAHET_THE_OLD_KINGDOM = 132,
	UTGARDE_KEEP = 133,
	UTGARDE_PINNACLE = 136,
	HALLS_OF_LIGHTNING = 138,
	HALLS_OF_STONE = 140,
	THE_EYE_OF_ETERNITY = 141,
	THE_OCULUS = 142,
	ULDUAR = 147,
	GUNDRAK = 154,
	THE_OBSIDIAN_SANCTUM = 155,
	VAULT_OF_ARCHAVON = 156,
	AZJOL_NERUB = 157,
	DRAKTHARON_KEEP = 160,
	NAXXRAMAS = 162,
	THE_VIOLET_HOLD = 168,
	TRIAL_OF_THE_CRUSADER = 172,
	THE_LOST_ISLES = 174,
	GILNEAS = 179,
	THE_FORGE_OF_SOULS = 183,
	ICECROWN_CITADEL = 186,
	KEZAN = 194,
	MOUNT_HYJAL = 198,
	SOUTHERN_BARRENS = 199,
	KELPTHAR_FOREST = 201,
	GILNEAS_CITY = 202,
	VASHJIR = 203,
	ABYSSAL_DEPTHS = 204,
	SHIMMERING_EXPANSE = 205,
	DEEPHOLM = 207,
	THE_CAPE_OF_STRANGLETHORN = 210,
	RUINS_OF_GILNEAS = 217,
	ZULFARRAK = 219,
	THE_TEMPLE_OF_ATALHAKKAR = 220,
	BLACKFATHOM_DEEPS = 221,
	STRANGLETHORN_VALE = 224, --Need for Cape of Stranglethorn
	GNOMEREGAN = 226,
	ULDAMAN = 230,
	MOLTEN_CORE = 232,
	DIRE_MAUL = 234,
	TWILIGHT_HIGHLANDS = 241,
	BLACKROCK_DEPTHS = 242,
	TOL_BARAD = 244,
	TOL_BARAD_PENINSULA = 245,
	THE_SHATTERED_HALLS = 246,
	RUINS_OF_AHNQIRAJ = 247,
	ONYXIAS_LAIR = 248,
	ULDUM = 249,
	ULDUM_INVASION = 1527,
	BLACKROCK_SPIRE = 250,
	AUCHENAI_CRYPTS = 256,
	SETHEKK_HALLS = 258,
	SHADOW_LABYRINTH = 260,
	THE_BLOOD_FURNACE = 261,
	THE_STEAMVAULT = 263,
	THE_SLAVE_PENS = 265,
	THE_BOTANICA = 266,
	THE_MECHANAR = 267,
	THE_ARCATRAZ = 269,
	MANA_TOMBS = 272,
	THE_BLACK_MORASS = 273,
	OLD_HILLSBRAD_FOOTHILLS = 274,
	WAILING_CAVERNS = 279,
	BLACKWING_DESCENT = 285,
	BLACKWING_LAIR = 287,
	THE_DEADMINES = 291,
	THE_BASTION_OF_TWILIGHT = 294,
	RAZORFEN_DOWNS = 300,
	SCARLET_MONASTERY = 302,
	SHADOWFANG_KEEP = 310,
	STRATHOLME = 317,
	AHNQIRAJ = 319,
	THE_STONECORE = 324,
	THE_VORTEX_PINNACLE = 325,
	AHNQIRAJ_THE_FALLEN_KINGDOM = 327,
	THRONE_OF_THE_FOUR_WINDS = 328,
	HYJAL_SUMMIT = 329,
	SERPENTSHRINE_CAVERN = 332,
	ZULAMAN = 333,
	TEMPEST_KEEP = 334,
	SUNWELL_PLATEAU = 335,
	ZULGURUB = 337,
	MOLTEN_FRONT = 338,
	BLACK_TEMPLE = 339,
	MAGISTERS_TERRACE = 348,
	KARAZHAN = 350,
	FIRELANDS = 367,
	THE_JADE_FOREST = 371,
	VALLEY_OF_THE_FOUR_WINDS = 376,
	THE_WANDERING_ISLE = 378,
	KUN_LAI_SUMMIT = 379,
	TOWNLONG_STEPPES = 388,
	VALE_OF_ETERNAL_BLOSSOMS = 390,
	VALE_OF_ETERNAL_BLOSSOMS_INVASION = 1530,
	WELL_OF_ETERNITY = 398,
	END_TIME = 401,
	DARKMOON_ISLAND = 407,
	DRAGON_SOUL = 409,

	KRASARANG_WILDS = 418,
	DREAD_WASTES = 422,
	THE_VEILED_STAIR = 433,
	TERRACE_OF_ENDLESS_SPRING = 456,
	SUNSTRIDER_ISLE = 467,
	AMMEN_VALE = 468,
	NEW_TINKERTOWN = 469,
	MOGUSHAN_VAULTS = 471,
	HEART_OF_FEAR = 474,
	SCHOLOMANCE = 476,
	CRYPT_OF_FORGOTTEN_KINGS = 481,
	DEEPRUN_TRAM = 499,
	BRAWLGAR_ARENA = 503,
	ISLE_OF_GIANTS = 507,
	THRONE_OF_THUNDER = 508,
	ISLE_OF_THUNDER = 516,
	FROSTFIRE_RIDGE = 525,
	TANAAN_JUNGLE = 534,
	TALADOR = 535,
	SHADOWMOON_VALLEY_DRAENOR = 539,
	SPIRES_OF_ARAK = 542,
	GORGROND = 543,
	NAGRAND_DRAENOR = 550,
	TIMELESS_ISLE = 554,
	SIEGE_OF_ORGRIMMAR = 556,

	LUNARFALL = 582,
	FROSTWALL = 590,
	ASHRAN = 588,
	IRON_DOCKS = 595,
	BLACKROCK_FOUNDRY = 596,
	SKYREACH = 601,
	UPPER_BLACKROCK_SPIRE = 616,
	STORMSHIELD = 622,
	WARSPEAR = 624,
	HELLFIRE_CITADEL = 661,

	DALARAN_BROKENISLES = 627,
	AZSUNA = 630,
	STORMHEIM = 634,
	VALSHARAH = 641,
	BROKEN_SHORE = 646,
	HELHEIM = 649,
	HIGHMOUNTAIN = 650,
	THUNDER_TOTEM = 652,
	VAULT_OF_THE_WARDENS = 677,
	SURAMAR = 680,
	HELMOUTH_CLIFFS = 706,
	EYE_OF_AZSHARA = 790,
	NELTHARIONS_LAIR = 731,
	VIOLET_HOLD = 723,
	DARKHEART_THICKET = 733,
	THE_ARCWAY = 749,
	BLACK_ROOK_HOLD  = 751,
	COURT_OF_STARS = 761,
	THE_NIGHTHOLD = 764,
	THE_EMERALD_NIGHTMARE = 777,
	TRIAL_OF_VALOR = 806,
	HALLS_OF_VALOR = 829,
	TOMB_OF_SARGERAS = 850,
	THE_DEATHS_OF_CHROMIE = 897,

	KROKUUN = 830,
	MACAREE = 882,
	ANTORAN_WASTES = 885,
	THE_SEAT_OF_THE_TRIUMVIRATE = 903,
	RUINS_OF_LORDAERON = 908,
	ANTORUS__THE_BURNING_THRONE = 909,

	-- BFA
	ZULDAZAR = 862,
	NAZMIR = 863,
	VOLDUN = 864,
	TIRAGARDE_SOUND = 895,
	DRUSTVAR = 896,
	FREEHOLD = 936,
	STORMSONG_VALLEY = 942,
	KINGS_REST = 1004,
	THE_MOTHERLODE = 1010,
	WAYCREST_MANOR = 1015,
	THE_UNDERROT = 1042,
	ULDIR = 1148,
	BORALUS = 1161,
	DAZARALOR = 1165,
	BATTLE_OF_DAZARALOR = 1352,
	NAZJATAR = 1355,
	CRUCIBLE_OF_STORMS = 1363,
	MECHAGON_ISLAND = 1462,
	OPERATION_MECHAGON = 1490,
	THE_ETERNAL_PALACE = 1512,
	NYALOTHA = 1580,

	-- SHADOWLANDS
	REVENDRETH = 1525,
	BASTION = 1533,
	MALDRAXXUS = 1536,
	THE_MAW = 1543,
	ARDENWEALD = 1565,
	ORIBOS = 1670,
	CASTLE_NATHRIA = 1735,
}

-- Hard code this because I so don't want to change up the coding that much
local mapContinentData = {
	12,
	"Kalimdor",
	13,
	"Eastern Kingdoms",
	101,
	"Outland",
	113,
	"Northrend",
	424,
	"Pandaria",
	572,
	"Draenor",
	619,
	"Broken Isles",
	875,
	"Zandalar",
	876,
	"Kul Tiras",
	905,
	"Argus",
--	946,
--	"Cosmic",
--	947,  -- Must not be included, or the headings in Location tab only show Azeroth, Outland & Draenor, since everything else is a child of Azeroth
--	"Azeroth",
	948,
	"The Maelstrom",
	1550,
	"The Shadowlands",
}

local ZONE_NAMES = {}
local ZONE_PARENTS = {}
for zoneLabel, mapID in pairs(ZONE_MAP_IDS) do
	ZONE_NAMES[zoneLabel] = _G.C_Map.GetMapInfo(type(mapID) == "table" and mapID[1] or mapID).name or _G.UNKNOWN
end

private.ZONE_NAMES = ZONE_NAMES
private.constants.ZONE_NAMES = ZONE_NAMES

ZONE_NAMES.SHADOWMOON_VALLEY_OUTLAND = (("%s %s"):format(_G.C_Map.GetMapInfo(ZONE_MAP_IDS.SHADOWMOON_VALLEY_OUTLAND).name, _G.PARENS_TEMPLATE:format(ZONE_NAMES.OUTLAND)))
ZONE_NAMES.SHADOWMOON_VALLEY_DRAENOR = (("%s %s"):format(_G.C_Map.GetMapInfo(ZONE_MAP_IDS.SHADOWMOON_VALLEY_DRAENOR).name, _G.PARENS_TEMPLATE:format(ZONE_NAMES.DRAENOR)))
ZONE_NAMES.NAGRAND_OUTLAND = (("%s %s"):format(_G.C_Map.GetMapInfo(ZONE_MAP_IDS.NAGRAND_OUTLAND).name, _G.PARENS_TEMPLATE:format(ZONE_NAMES.OUTLAND)))
ZONE_NAMES.NAGRAND_DRAENOR = (("%s %s"):format(_G.C_Map.GetMapInfo(ZONE_MAP_IDS.NAGRAND_DRAENOR).name, _G.PARENS_TEMPLATE:format(ZONE_NAMES.DRAENOR)))
ZONE_NAMES.DALARAN_NORTHREND = (("%s %s"):format(_G.C_Map.GetMapInfo(ZONE_MAP_IDS.DALARAN_NORTHREND).name, _G.PARENS_TEMPLATE:format(ZONE_NAMES.NORTHREND)))
ZONE_NAMES.DALARAN_BROKENISLES = (("%s %s"):format(_G.C_Map.GetMapInfo(ZONE_MAP_IDS.DALARAN_BROKENISLES).name, _G.PARENS_TEMPLATE:format(ZONE_NAMES.BROKEN_ISLES)))

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
	TELDRASSIL = 57,
	DARNASSUS = 89,
	THE_BLACK_MORASS = 273,
	OLD_HILLSBRAD_FOOTHILLS = 274,
	HYJAL_SUMMIT = 329,
	THE_WANDERING_ISLE = 378,
	DARKMOON_ISLAND = 407,
	LUNARFALL = 582,
	FROSTWALL = 590,
	NELTHARIONS_LAIR = 731,
	DARKHEART_THICKET = 733,
	NAZJATAR = 1355,
	NYALOTHA = 1580,
	THE_ETERNAL_PALACE = 1512,
}

local COSMIC_MAP_LOCATION_PARENT_MAPPING = {
	TELDRASSIL = ZONE_NAMES.KALIMDOR,
	DARNASSUS = ZONE_NAMES.KALIMDOR,
	THE_BLACK_MORASS = ZONE_NAMES.TANARIS,
	OLD_HILLSBRAD_FOOTHILLS = ZONE_NAMES.TANARIS,
	HYJAL_SUMMIT = ZONE_NAMES.TANARIS,
	THE_WANDERING_ISLE = ZONE_NAMES.THE_MAELSTROM,
	DARKMOON_ISLAND = ZONE_NAMES.THE_MAELSTROM,
	MOLTEN_CORE = ZONE_NAMES.BURNING_STEPPES,
	NORTHERN_BARRENS = ZONE_NAMES.KALIMDOR,
	SOUTHERN_BARRENS = ZONE_NAMES.KALIMDOR,
	LUNARFALL = ZONE_NAMES.SHADOWMOON_VALLEY_DRAENOR,
	FROSTWALL = ZONE_NAMES.FROSTFIRE_RIDGE,
	NAZJATAR = ZONE_NAMES.KUL_TIRAS,
	NYALOTHA = ZONE_NAMES.VALE_OF_ETERNAL_BLOSSOMS_INVASION,
	THE_ETERNAL_PALACE = ZONE_NAMES.KUL_TIRAS,

}


-- Coordinates are relative to the instance's parent location.
local INSTANCE_ENTRANCE_COORDINATES = {
	AHNKAHET_THE_OLD_KINGDOM = "28.49:51.73",
	AHNQIRAJ_THE_FALLEN_KINGDOM = "23.2:86.1",
	AUCHENAI_CRYPTS = "34.32:65.62",
	AZJOL_NERUB = "26.01:50.83",
	BLACK_ROOK_HOLD = "37.0:50.3",
	BLACKROCK_DEPTHS = "20.72:36.94", -- TODO: Double check BLACKROCK_DEPTHS, BLACKROCK_SPIRE, and BLACKWING_LAIR - their coordinates are identical.
	BLACKROCK_SPIRE = "20.72:36.94",
	BLACKWING_LAIR = "20.72:36.94",
	COURT_OF_STARS = "50.3:65.3",
	DIRE_MAUL = "61.36:31.78",
	DRAKTHARON_KEEP = "71.5:22.4",
	FIRELANDS = "46.5:79.8",
	GNOMEREGAN = "31.29:37.89",
	HALLS_OF_LIGHTNING = "45.40:21.37",
	HALLS_OF_STONE = "39.49:26.92",
	HELLFIRE_CITADEL = "46.5:53.2",
	KARAZHAN = "46.85:74.66",
	MAGISTERS_TERRACE = "61.20:30.89",
	MANA_TOMBS = "39.64:57.65",
	MOLTEN_CORE = "20.72:36.94",
	OLD_HILLSBRAD_FOOTHILLS = "64.4:47.9",
	ONYXIAS_LAIR = "52.9:77.7",
	RUINS_OF_AHNQIRAJ = "36.2:93.8",
	SCHOLOMANCE = "70.7:70.7",
	SETHEKK_HALLS = "44.95:65.61",
	SHADOW_LABYRINTH = "39.64:73.58",
	SKYREACH = "36.0:33.9",
	STRATHOLME = "26.75:11.60",
	THE_ARCWAY = "43.0:61.7",
	THE_ARCATRAZ = "74.41:57.72",
	THE_BLACK_MORASS = "64.4:47.9",
	THE_BOTANICA = "71.77:54.92",
	THE_DEADMINES = "38.23:77.47",
	THE_ETERNAL_PALACE = "50.3:9.8", -- Needs updating
	THE_MECHANAR = "70.62:69.77",
	THE_NEXUS = "27.50:25.97",
	THE_OCULUS = "27.52:26.71",
	THE_SHATTERED_HALLS = "47.50:52.04",
	THE_SLAVE_PENS = "48.95:35.70",
	THE_STEAMVAULT = "50.29:33.32",
	THE_TEMPLE_OF_ATALHAKKAR = "76.03:45.23",
	THE_VIOLET_HOLD = "66.78:68.19",
	TRIAL_OF_THE_CRUSADER = "75.0:21.8",
	UTGARDE_KEEP = "57.28:46.73",
	UTGARDE_PINNACLE = "57.26:46.67"
}

-- ----------------------------------------------------------------------------
-- Objects.
-- ----------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Location Methods.
-- ----------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Instantiation.
-- ----------------------------------------------------------------------------
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
--		                private.Debug("No entry in ZONE_LABELS_FROM_MAP_ID for mapID %s (%s)", mapID or "nil", _G.C_Map.GetMapInfo(mapID).name)
	end
end

local function AddSubzoneLocations(parentLocation)
	local zoneData =  _G.C_Map.GetMapChildrenInfo(parentLocation._mapID)
	for zoneDataIndex = 1, #zoneData do
		local zone = AddLocation(parentLocation._continentID, zoneData[zoneDataIndex].mapID, parentLocation)
		if zone then
			AddSubzoneLocations(zone)
		end
	end
end

for dataIndex = 1, #mapContinentData do
	if dataIndex % 2 == 0 then
		local continentID = dataIndex / 2
		local continentMapID = mapContinentData[dataIndex - 1]
		local continent = AddLocation(continentID, continentMapID)

		if continent then
			ContinentLocationByID[continentID] = continent
			AddSubzoneLocations(continent)

			local zoneData =  _G.C_Map.GetMapChildrenInfo(continentMapID)
			for zoneDataIndex = 1, #zoneData do
				local zone = AddLocation(continentID, zoneData[zoneDataIndex].mapID, continent)
				if zone then
					AddSubzoneLocations(zone)
				end
			end
		end
	end
end

local cosmicMap = AddLocation(946, 946)
ContinentLocationByID[946] = cosmicMap

for label, mapID in pairs(COSMIC_MAP_IDS) do
	local parentLocation = LocationsByLocalizedName[COSMIC_MAP_LOCATION_PARENT_MAPPING[label]] or cosmicMap
	AddLocation(parentLocation._continentID, mapID, parentLocation)
end