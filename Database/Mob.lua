--[[
************************************************************************
Mob.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]]--

-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BB = LibStub("LibBabble-Boss-3.0"):GetLookupTable()

-----------------------------------------------------------------------
-- Imports.
-----------------------------------------------------------------------
local BN = private.BOSS_NAMES
local Z = private.ZONE_NAMES

function addon:InitMob()
	local function AddMob(mob_id, mob_name, zone_name, coord_x, coord_y)
		private.AcquireTypes.MobDrop:AddEntity(mob_id, mob_name, zone_name, coord_x, coord_y, nil)
	end

	-- Abyssal Depths
	AddMob(50005,	L["Poseidus"],				Z.ABYSSAL_DEPTHS,		65.4, 41.4)
	AddMob(50009,	L["Mobus"],				Z.ABYSSAL_DEPTHS,		73.8, 19.2)

	-- Blade's Edge Mountains
	AddMob(19960,	L["Doomforge Engineer"],		Z.BLADES_EDGE_MOUNTAINS,	75.1, 39.8)
	AddMob(19984,	L["Vekh'nir Dreadhawk"],		Z.BLADES_EDGE_MOUNTAINS,	78.0, 74.3)
	AddMob(23385,	L["Simon Unit"],			Z.BLADES_EDGE_MOUNTAINS,	33.5, 51.5) -- Enchanting, Engineering
	AddMob(23386,	L["Gan'arg Analyzer"],			Z.BLADES_EDGE_MOUNTAINS,	33.0, 52.5)

	-- Burning Steppes
	AddMob(7035,	L["Firegut Brute"],			Z.BURNING_STEPPES,		82.5, 48.1)
	AddMob(7037,	L["Thaurissan Firewalker"],		Z.BURNING_STEPPES,		61.1, 42.0)

	-- Deepholm
	AddMob(50061,	L["Xariona"],				Z.DEEPHOLM,			44.6, 39.8)

	-- Dread Wastes
	AddMob(66867,	L["Wild Seahorse"],			Z.DREAD_WASTES,			28.0, 96.8)
	AddMob(66868,	L["Playful Seahorse"],			Z.DREAD_WASTES,			26.4, 95.6)

	-- Dustwallow Marsh
	AddMob(4834,	L["Theramore Infiltrator"],		Z.DUSTWALLOW_MARSH,		44.0, 27.3)

	-- Felwood
	AddMob(7158,	L["Deadwood Shaman"],			Z.FELWOOD,			62.5, 10.3)

	-- Grizzly Hills
	AddMob(26679,	L["Silverbrook Trapper"],		Z.GRIZZLY_HILLS,		27.3, 33.9)
	AddMob(26708,	L["Silverbrook Villager"],		Z.GRIZZLY_HILLS,		27.3, 33.9)
	AddMob(27546,	L["Silverbrook Hunter"],		Z.GRIZZLY_HILLS,		37.5, 68.0)
	AddMob(27676,	L["Silverbrook Defender"],		Z.GRIZZLY_HILLS,		24.6, 33.3)

	-- Hillsbrad Foothills
	AddMob(2242,	L["Syndicate Spy"],			Z.HILLSBRAD_FOOTHILLS,		56.0, 24.2)

	-- Mount Hyjal
	AddMob(50056,	BB["Garr"],				Z.MOUNT_HYJAL,			39.6, 80.4)

	-- Netherstorm
	AddMob(18866,	L["Mageslayer"],			Z.NETHERSTORM,			55.5, 85.5)
	AddMob(18872,	L["Disembodied Vindicator"],		Z.NETHERSTORM,			36.0, 55.5)
	AddMob(20134,	L["Sunfury Arcanist"],			Z.NETHERSTORM,			51.0, 82.5)
	AddMob(20135,	L["Sunfury Arch Mage"],			Z.NETHERSTORM,			46.5, 81.0)
	AddMob(20207,	L["Sunfury Bowman"],			Z.NETHERSTORM,			56.8, 64.6)

	-- Searing Gorge
	AddMob(5861,	L["Twilight Fire Guard"],		Z.SEARING_GORGE,		25.5, 33.8)
	AddMob(9026,	BB["Overmaster Pyron"],			Z.SEARING_GORGE,		26.2, 74.9)

	-- Shadowmoon Valley
	AddMob(19755,	L["Mo'arg Weaponsmith"],		Z.SHADOWMOON_VALLEY,		25.5, 31.5) -- Alchemy, Engineering
	AddMob(19768,	L["Coilskar Siren"],			Z.SHADOWMOON_VALLEY,		46.5, 30.0)
	AddMob(19826,	L["Dark Conclave Shadowmancer"],	Z.SHADOWMOON_VALLEY,		37.5, 29.0)
	AddMob(20878,	L["Deathforge Guardian"],		Z.SHADOWMOON_VALLEY,		39.0, 47.0) -- Alchemy, Blacksmithing

	-- Sholazar Basin
	AddMob(28379,	L["Shattertusk Mammoth"],		Z.SHOLAZAR_BASIN,		53.5, 24.4)

	-- Silverpine Forest
	AddMob(3530,	L["Pyrewood Tailor"],			Z.SILVERPINE_FOREST,		45.7, 71.0)
	AddMob(3531,	L["Moonrage Tailor"],			Z.SILVERPINE_FOREST,		45.5, 73.3)

	-- Northern Stranglethorn
	AddMob(938,	L["Kurzen Commando"],			Z.NORTHERN_STRANGLETHORN,	60.9, 16.3)

	-- The Cape of Stranglethorn
	AddMob(1561,	L["Bloodsail Raider"],			Z.THE_CAPE_OF_STRANGLETHORN,	44.0, 63.8)

	-- Swamp of Sorrows
	AddMob(14448,	L["Molt Thorn"],			Z.SWAMP_OF_SORROWS,		51.0, 42.6)

	-- Terokkar Forest
	AddMob(22148,	L["Gordunni Head-Splitter"],		Z.TEROKKAR_FOREST,		22.5, 8.3)
	AddMob(23022,	L["Gordunni Soulreaper"],		Z.TEROKKAR_FOREST,		22.9, 8.8)
	AddMob(22143,	L["Gordunni Back-Breaker"],		Z.TEROKKAR_FOREST,		21.2, 8.1)
	AddMob(22144,	L["Gordunni Elementalist"],		Z.TEROKKAR_FOREST,		21.3, 12.0)

	-- Northern Barrens
	AddMob(3385,	L["Theramore Marine"],			Z.NORTHERN_BARRENS,		71.5, 86.6)
	AddMob(3386,	L["Theramore Preserver"],		Z.NORTHERN_BARRENS,		71.5, 86.6)

	-- The Hinterlands
	AddMob(2644,	L["Vilebranch Hideskinner"],		Z.THE_HINTERLANDS,		62.2, 69.2)

	-- The Storm Peaks
	AddMob(29370,	L["Stormforged Champion"],		Z.THE_STORM_PEAKS,		26.1, 47.5)
	AddMob(29376,	L["Stormforged Artificer"],		Z.THE_STORM_PEAKS,		31.5, 44.2)
	AddMob(29402,	L["Ironwool Mammoth"],			Z.THE_STORM_PEAKS,		36.0, 83.5)
	AddMob(29792,	L["Frostfeather Screecher"],		Z.THE_STORM_PEAKS,		33.5, 65.5)
	AddMob(29793,	L["Frostfeather Witch"],		Z.THE_STORM_PEAKS,		33.0, 66.8)
	AddMob(30208,	L["Stormforged Ambusher"],		Z.THE_STORM_PEAKS,		70.3, 57.5)
	AddMob(30222,	L["Stormforged Infiltrator"],		Z.THE_STORM_PEAKS,		58.5, 63.2)
	AddMob(30260,	L["Stoic Mammoth"],			Z.THE_STORM_PEAKS,		54.8, 64.9)
	AddMob(30448,	L["Plains Mammoth"],			Z.THE_STORM_PEAKS,		66.1, 45.6)

	-- Timeless Isle
	AddMob(72048,	L["Rattleskew"],			Z.TIMELESS_ISLE,		60.6, 87.8)
	AddMob(72245,	L["Zesqua"],				Z.TIMELESS_ISLE,		47.0, 87.6)
	AddMob(72761,	L["Windfeather Nestkeeper"],		Z.TIMELESS_ISLE,		32.8, 69.0)
	AddMob(72767,	L["Jademist Dancer"],			Z.TIMELESS_ISLE,		25.4, 27.0)
	AddMob(72769,	L["Spirit of Jadefire"],		Z.TIMELESS_ISLE,		45.0, 38.0)
	AddMob(72771,	L["Damp Shambler"],			Z.TIMELESS_ISLE,		43.2, 30.8)
	AddMob(72775,	L["Bufo"],				Z.TIMELESS_ISLE,		65.8, 65.0)
	AddMob(72777,	L["Gulp Frog"],				Z.TIMELESS_ISLE,		64.8, 75.6)
	AddMob(72805,	L["Primal Stalker"],			Z.TIMELESS_ISLE,		53.0, 60.8)
	AddMob(72807,	L["Crag Stalker"],			Z.TIMELESS_ISLE,		53.0, 60.8)
	AddMob(72875,	L["Ordon Candlekeeper"],		Z.TIMELESS_ISLE,		46.8, 77.4)
	AddMob(72877,	L["Ashleaf Sprite"],			Z.TIMELESS_ISLE,		66.6, 56.8)
	AddMob(72892,	L["Ordon Oathguard"],			Z.TIMELESS_ISLE,		52.8, 80.2)
	AddMob(72895,	L["Burning Berserker"],			Z.TIMELESS_ISLE,		68.8, 55.2)
	AddMob(72896,	L["Eternal Kilnmaster"],		Z.TIMELESS_ISLE,		69.6, 35.6)
	AddMob(73018,	L["Spectral Brewmaster"],		Z.TIMELESS_ISLE,		37.8, 74.6)
	AddMob(73021,	L["Spectral Windwalker"],		Z.TIMELESS_ISLE,		36.8, 80.6)
	AddMob(73025,	L["Spectral Mistweaver"],		Z.TIMELESS_ISLE,		35.6, 77.0)
	AddMob(73157,	L["Rock Moss"],				Z.TIMELESS_ISLE,		42.4, 31.8)
	AddMob(73162,	L["Foreboding Flame"],			Z.TIMELESS_ISLE,		45.0, 36.8)
	AddMob(73169,	L["Jakur of Ordon"],			Z.TIMELESS_ISLE,		53.6, 83.0)
	AddMob(73277,	L["Leafmender"],			Z.TIMELESS_ISLE,		67.6, 44.0)
	AddMob(73703,	L["Southsea Plunderer"],		Z.TIMELESS_ISLE,		72.0, 81.0)

	-- Twilight Highlands
	AddMob(50089,	L["Julak-Doom"],			Z.TWILIGHT_HIGHLANDS,		52.6, 7.4)

	-- Uldum
	AddMob(50063,	L["Akma'hat"],				Z.ULDUM,			38.0, 60.2)

	-- Un'Goro Crater
	AddMob(6557,	L["Primal Ooze"],			Z.UNGORO_CRATER,		51.8, 34.9)
	AddMob(6559,	L["Glutinous Ooze"],			Z.UNGORO_CRATER,		39.0, 37.7)

	-- Westfall
	AddMob(590,	L["Defias Looter"],			Z.WESTFALL,			37.5, 58.4)

	-- Wetlands
	AddMob(1160,	L["Captain Halyndor"],			Z.WETLANDS,			15.0, 24.0)

	-- Winterspring
	AddMob(7438,	L["Winterfall Ursa"],			Z.WINTERSPRING,			67.5, 36.3)
	AddMob(7440,	L["Winterfall Den Watcher"],		Z.WINTERSPRING,			68.0, 35.5)
	AddMob(7441,	L["Winterfall Totemic"],		Z.WINTERSPRING,			24.2, 50.4)

	-- Zul'drak
	AddMob(28851,	L["Enraged Mammoth"],			Z.ZULDRAK,			72.0, 41.1)

	-------------------------------------------------------------------------------
	-- Instances
	-------------------------------------------------------------------------------
	-- Ahn'kahet: The Old Kingdom
	AddMob(29311,	BN.HERALD_VOLAZJ,			Z.AHNKAHET_THE_OLD_KINGDOM,	0, 0)

	-- Blackrock Depths
	AddMob(8897,	L["Doomforge Craftsman"],		Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8898,	L["Anvilrage Marshal"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8903,	L["Anvilrage Captain"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8920,	L["Weapon Technician"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8983,	BN.GOLEM_LORD_ARGELMACH,		Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9499,	BN.PLUGGER_SPAZZRING,			Z.BLACKROCK_DEPTHS,		0, 0)

	-- Blackrock Spire
	AddMob(9259,	L["Firebrand Grunt"],			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9260,	L["Firebrand Legionnaire"],		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9264,	L["Firebrand Pyromancer"],		Z.BLACKROCK_SPIRE,		0, 0) -- Alchemy, Tailoring
	AddMob(9736,	BN.QUARTERMASTER_ZIGRIS,		Z.BLACKROCK_SPIRE,		0, 0) -- Blacksmithing, Jewelcrafting
	AddMob(10264,	BN.SOLAKAR_FLAMEWREATH,			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10318,	L["Blackhand Assassin"],		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10363,	BN.GENERAL_DRAKKISATH,			Z.BLACKROCK_SPIRE,		0, 0) -- Alchemy, Leatherworking

	-- Blackwing Lair
	AddMob(14401,	L["Master Elemental Shaper Krixix"],	Z.BLACKWING_LAIR,		0, 0)

	-- Dire Maul
	AddMob(11487,	BN.MAGISTER_KALENDRIS,			Z.DIRE_MAUL,			59.04, 48.82)

	-- Gnomeregan
	AddMob(7800,	BN.MEKGINEER_THERMAPLUGG,		Z.GNOMEREGAN,			0, 0)

	-- Halls of Lightning
	AddMob(28923,	BN.LOKEN,				Z.HALLS_OF_LIGHTNING,		0, 0)

	-- Karazhan
	AddMob(16406,	L["Phantom Attendant"],			Z.KARAZHAN,			0, 0)
	AddMob(16408,	L["Phantom Valet"],			Z.KARAZHAN,			0, 0)
	AddMob(16152,	BB["Attumen the Huntsman"],		Z.KARAZHAN,			0, 0)

	-- Magister's Terrace
	AddMob(24664,	BN.KAELTHAS_SUNSTRIDER,			Z.MAGISTERS_TERRACE,		0, 0) -- Alchemy, Blacksmithing, Enchanting, Engineering, Jewelcrafting, Leatherworking, Tailoring

	-- Oculus
	AddMob(27656,	BN.LEY_GUARDIAN_EREGOS,			Z.THE_OCULUS,			0, 0)

	-- Old Hillsbrad Foothills
	AddMob(17820,	L["Durnholde Rifleman"],		Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)
	AddMob(18096,	BN.EPOCH_HUNTER,			Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)
	AddMob(28132,	L["Don Carlos"],			Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)

	-- Sethekk Halls
	AddMob(18322,	L["Sethekk Ravenguard"],		Z.SETHEKK_HALLS,		0, 0)
	AddMob(18472,	BN.DARKWEAVER_SYTH,			Z.SETHEKK_HALLS,		0, 0)

	-- Shadow Labyrinth
	AddMob(18667,	BN.BLACKHEART_THE_INCITER,		Z.SHADOW_LABYRINTH,		0, 0)
	AddMob(18708,	BN.MURMUR,				Z.SHADOW_LABYRINTH,		0, 0)

	-- Stratholme
	AddMob(10426,	L["Risen Inquisitor"],			Z.STRATHOLME,			0, 0)
	AddMob(10813,	BN.BALNAZZAR,				Z.STRATHOLME,			0, 0) -- Alchemy, Tailoring

	-- The Arcatraz
	AddMob(20869,	L["Arcatraz Sentinel"],			Z.THE_ARCATRAZ,			0, 0)
	AddMob(20885,	BN.DALLIAH_THE_DOOMSAYER,		Z.THE_ARCATRAZ,			0, 0)

	--The Black Morass
	AddMob(21104,	L["Rift Keeper"],			Z.THE_BLACK_MORASS,		0, 0)
	AddMob(17839,	L["Rift Lord"],				Z.THE_BLACK_MORASS,		0, 0)

	-- The Botanica
	AddMob(18422,	L["Sunseeker Botanist"],		Z.THE_BOTANICA,			0, 0)
	AddMob(17977,	BN.WARP_SPLINTER,			Z.THE_BOTANICA,			0, 0)
	AddMob(17978,	BN.THORNGRIN_THE_TENDER,		Z.THE_BOTANICA,			0, 0)

	-- The Deadmines
	AddMob(657,	L["Defias Pirate"],			Z.THE_DEADMINES,		0, 0)
	AddMob(1732,	L["Defias Squallshaper"],		Z.THE_DEADMINES,		0, 0)

	-- The Mechanar
	AddMob(19168,	L["Sunseeker Astromage"],		Z.THE_MECHANAR,			0, 0) -- Alchemy, Blacksmithing
	AddMob(19219,	BN.MECHANO_LORD_CAPACITUS,		Z.THE_MECHANAR,			0, 0)
	AddMob(19220,	BN.PATHALEON_THE_CALCULATOR,		Z.THE_MECHANAR,			0, 0)

	-- The Shattered Halls
	AddMob(16807,	BN.GRAND_WARLOCK_NETHEKURSE,		Z.THE_SHATTERED_HALLS,		0, 0)

	-- The Steamvault
	AddMob(17722,	L["Coilfang Sorceress"],		Z.THE_STEAMVAULT,		0, 0)
	AddMob(17796,	BN.MEKGINEER_STEAMRIGGER,		Z.THE_STEAMVAULT,		0, 0)
	AddMob(17798,	BN.WARLORD_KALITHRESH,			Z.THE_STEAMVAULT,		0, 0)

	-- Utgarde Keep
	AddMob(23954,	BN.INGVAR_THE_PLUNDERER,		Z.UTGARDE_KEEP,			0, 0)

	-- Utgarde Pinnacle
	AddMob(26861,	BN.KING_YMIRON,			        Z.UTGARDE_PINNACLE,		0, 0)

	self.InitMob = nil
end
