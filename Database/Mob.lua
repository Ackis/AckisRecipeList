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

local BN = private.BOSS_NAMES
local Z = private.ZONE_NAMES

private.mob_list = {}

function addon:InitMob()
	local function AddMob(mob_id, mob_name, zone_name, coord_x, coord_y)
		private:AddListEntry(private.mob_list, mob_id, mob_name, zone_name, coord_x, coord_y, nil)
	end

	-- Arathi Highlands
	AddMob(2556,	L["Witherbark Headhunter"],		Z.ARATHI_HIGHLANDS,		70.5, 70.4)
	AddMob(2557,	L["Witherbark Shadow Hunter"],		Z.ARATHI_HIGHLANDS,		70.3, 78.9)
	AddMob(2558,	L["Witherbark Berserker"],		Z.ARATHI_HIGHLANDS,		24.2, 66.2)

	-- Blade's Edge Mountains
	AddMob(16952,	L["Anger Guard"],			Z.BLADES_EDGE_MOUNTAINS,	72.0, 40.5)
	AddMob(19952,	L["Bloodmaul Geomancer"],		Z.BLADES_EDGE_MOUNTAINS,	45.0, 68.5)
	AddMob(19960,	L["Doomforge Engineer"],		Z.BLADES_EDGE_MOUNTAINS,	75.1, 39.8)
	AddMob(19973,	L["Abyssal Flamebringer"],		Z.BLADES_EDGE_MOUNTAINS,	30.0, 81.0)
	AddMob(19984,	L["Vekh'nir Dreadhawk"],		Z.BLADES_EDGE_MOUNTAINS,	78.0, 74.3)
	AddMob(22242,	L["Bash'ir Spell-Thief"],		Z.BLADES_EDGE_MOUNTAINS,	51.0, 16.5)
	AddMob(22243,	L["Bash'ir Arcanist"],			Z.BLADES_EDGE_MOUNTAINS,	52.2, 13.2)
	AddMob(23385,	L["Simon Unit"],			Z.BLADES_EDGE_MOUNTAINS,	33.5, 51.5)
	AddMob(23386,	L["Gan'arg Analyzer"],			Z.BLADES_EDGE_MOUNTAINS,	33.0, 52.5)

	-- Burning Steppes
	AddMob(7035,	L["Firegut Brute"],			Z.BURNING_STEPPES,		82.5, 48.1)
	AddMob(7037,	L["Thaurissan Firewalker"],		Z.BURNING_STEPPES,		61.1, 42.0)
	AddMob(10119,	L["Volchan"],				Z.BURNING_STEPPES,		22.0, 41.0)

	-- Deadwind Pass
	AddMob(7372,	L["Deadwind Warlock"],			Z.DEADWIND_PASS,		59.8, 74.4)

	-- Dragonblight
	AddMob(26343,	L["Indu'le Fisherman"],			Z.DRAGONBLIGHT,			40.2, 65.5)
	AddMob(26336,	L["Indu'le Mystic"],			Z.DRAGONBLIGHT,			40.2, 65.5)
	AddMob(26344,	L["Indu'le Warrior"],			Z.DRAGONBLIGHT,			40.2, 65.5)
	AddMob(27333,	L["Onslaught Mason"],			Z.DRAGONBLIGHT,			85.8, 36.0)

	-- Dustwallow Marsh
	AddMob(4834,	L["Theramore Infiltrator"],		Z.DUSTWALLOW_MARSH,		44.0, 27.3)

	-- Eastern Plaguelands
	AddMob(1844,	L["Foreman Marcrid"],			Z.EASTERN_PLAGUELANDS,		54.0, 68.0)
	AddMob(8561,	L["Mossflayer Shadowhunter"],		Z.EASTERN_PLAGUELANDS,		60.9, 21.5)
	AddMob(9451,	L["Scarlet Archmage"],			Z.EASTERN_PLAGUELANDS,		81.5, 75.4)

	-- Felwood
	AddMob(7158,	L["Deadwood Shaman"],			Z.FELWOOD,			62.5, 10.3)

	-- Grizzly Hills
	AddMob(26270,	L["Iron Rune-Shaper"],			Z.GRIZZLY_HILLS,		67.8, 16.3)
	AddMob(26679,	L["Silverbrook Trapper"],		Z.GRIZZLY_HILLS,		27.3, 33.9)
	AddMob(26708,	L["Silverbrook Villager"],		Z.GRIZZLY_HILLS,		27.3, 33.9)
	AddMob(27546,	L["Silverbrook Hunter"],		Z.GRIZZLY_HILLS,		37.5, 68.0)
	AddMob(27676,	L["Silverbrook Defender"],		Z.GRIZZLY_HILLS,		24.6, 33.3)

	-- Hillsbrad Foothills
	AddMob(2242,	L["Syndicate Spy"],			Z.HILLSBRAD_FOOTHILLS,		56.0, 24.2)
	AddMob(2374,	L["Torn Fin Muckdweller"],		Z.HILLSBRAD_FOOTHILLS,		31.5, 72.1)
	AddMob(2375,	L["Torn Fin Coastrunner"],		Z.HILLSBRAD_FOOTHILLS,		25.1, 70.5)
	AddMob(2376,	L["Torn Fin Oracle"],			Z.HILLSBRAD_FOOTHILLS,		42.0, 68.0)
	AddMob(2377,	L["Torn Fin Tidehunter"],		Z.HILLSBRAD_FOOTHILLS,		39.0, 69.0)
	AddMob(14276,	L["Scargil"],				Z.HILLSBRAD_FOOTHILLS,		26.6, 71.2)

	-- Icecrown
	AddMob(30921,	L["Skeletal Runesmith"],		Z.ICECROWN,			60.0, 73.1)
	AddMob(31702,	L["Frostbrood Spawn"],			Z.ICECROWN,			75.3, 43.4)
	AddMob(32289,	L["Damned Apothecary"],			Z.ICECROWN,			49.8, 32.7)
	AddMob(32290,	L["Cult Alchemist"],			Z.ICECROWN,			49.5, 33.1)
	AddMob(32297,	L["Cult Researcher"],			Z.ICECROWN,			50.7, 30.9)
	AddMob(32349,	L["Cultist Shard Watcher"],		Z.ICECROWN,			48.1, 67.9)

	-- Nagrand
	AddMob(17136,	L["Boulderfist Warrior"],		Z.NAGRAND,			51.0, 57.0)
	AddMob(17150,	L["Vir'aani Arcanist"],			Z.NAGRAND,			40.5, 69.6)
	AddMob(18203,	L["Murkblood Raider"],			Z.NAGRAND,			31.5, 43.5)

	-- Netherstorm
	AddMob(18853,	L["Sunfury Bloodwarder"],		Z.NETHERSTORM,			27.0, 72.0)
	AddMob(18866,	L["Mageslayer"],			Z.NETHERSTORM,			55.5, 85.5)
	AddMob(18872,	L["Disembodied Vindicator"],		Z.NETHERSTORM,			36.0, 55.5)
	AddMob(18873,	L["Disembodied Protector"],		Z.NETHERSTORM,			31.8, 52.7)
	AddMob(22822,	L["Ethereum Nullifier"],		Z.NETHERSTORM,			66.0, 49.5)
	AddMob(20134,	L["Sunfury Arcanist"],			Z.NETHERSTORM,			51.0, 82.5)
	AddMob(20135,	L["Sunfury Arch Mage"],			Z.NETHERSTORM,			46.5, 81.0)
	AddMob(20136,	L["Sunfury Researcher"],		Z.NETHERSTORM,			48.2, 82.5)
	AddMob(20207,	L["Sunfury Bowman"],			Z.NETHERSTORM,			56.8, 64.6)
	AddMob(23008,	L["Ethereum Jailor"],			Z.NETHERSTORM,			58.8, 35.6)

	-- Searing Gorge
	AddMob(5861,	L["Twilight Fire Guard"],		Z.SEARING_GORGE,		25.5, 33.8)
	AddMob(9026,	BB["Overmaster Pyron"],			Z.SEARING_GORGE,		26.2, 74.9)

	-- Shadowmoon Valley
	AddMob(19740,	L["Wrathwalker"],			Z.SHADOWMOON_VALLEY,		25.5, 33.0)
	AddMob(19754,	L["Deathforge Tinkerer"],		Z.SHADOWMOON_VALLEY,		39.0, 38.7)
	AddMob(19755,	L["Mo'arg Weaponsmith"],		Z.SHADOWMOON_VALLEY,		25.5, 31.5)
	AddMob(19756,	L["Deathforge Smith"],			Z.SHADOWMOON_VALLEY,		37.5, 42.0)
	AddMob(19768,	L["Coilskar Siren"],			Z.SHADOWMOON_VALLEY,		46.5, 30.0)
	AddMob(19792,	L["Eclipsion Centurion"],		Z.SHADOWMOON_VALLEY,		48.0, 61.8)
	AddMob(19795,	L["Eclipsion Blood Knight"],		Z.SHADOWMOON_VALLEY,		52.7, 63.2)
	AddMob(19796,	L["Eclipsion Archmage"],		Z.SHADOWMOON_VALLEY,		49.5, 58.5)
	AddMob(19806,	L["Eclipsion Bloodwarder"],		Z.SHADOWMOON_VALLEY,		46.5, 66.0)
	AddMob(19826,	L["Dark Conclave Shadowmancer"],	Z.SHADOWMOON_VALLEY,		37.5, 29.0)
	AddMob(20878,	L["Deathforge Guardian"],		Z.SHADOWMOON_VALLEY,		39.0, 47.0)
	AddMob(20887,	L["Deathforge Imp"],			Z.SHADOWMOON_VALLEY,		40.5, 39.1)
	AddMob(21050,	L["Enraged Earth Spirit"],		Z.SHADOWMOON_VALLEY,		46.5, 45.0)
	AddMob(21059,	L["Enraged Water Spirit"],		Z.SHADOWMOON_VALLEY,		51.0, 25.5)
	AddMob(21060,	L["Enraged Air Spirit"],		Z.SHADOWMOON_VALLEY,		70.5, 28.5)
	AddMob(21061,	L["Enraged Fire Spirit"],		Z.SHADOWMOON_VALLEY,		48.0, 43.5)
	AddMob(21302,	L["Shadow Council Warlock"],		Z.SHADOWMOON_VALLEY,		22.9, 38.2)
	AddMob(21314,	L["Terrormaster"],			Z.SHADOWMOON_VALLEY,		24.0, 45.0)
	AddMob(21454,	L["Ashtongue Warrior"],			Z.SHADOWMOON_VALLEY,		57.0, 36.0)
	AddMob(22016,	L["Eclipsion Soldier"],			Z.SHADOWMOON_VALLEY,		52.8, 66.5)
	AddMob(22017,	L["Eclipsion Spellbinder"],		Z.SHADOWMOON_VALLEY,		52.7, 63.4)
	AddMob(22018,	L["Eclipsion Cavalier"],		Z.SHADOWMOON_VALLEY,		52.7, 61.1)
	AddMob(22076,	L["Torloth the Magnificent"],		Z.SHADOWMOON_VALLEY,		51.2, 72.5)
	AddMob(22093,	L["Illidari Watcher"],			Z.SHADOWMOON_VALLEY,		52.5, 72.0)
	AddMob(23305,	L["Crazed Murkblood Foreman"],		Z.SHADOWMOON_VALLEY,		72.3, 90.0)
	AddMob(23324,	L["Crazed Murkblood Miner"],		Z.SHADOWMOON_VALLEY,		73.5, 88.5)

	-- Sholazar Basin
	AddMob(28123,	L["Venture Co. Excavator"],		Z.SHOLAZAR_BASIN,		35.8, 45.5)
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
	AddMob(16810,	L["Bonechewer Backbreaker"],		Z.TEROKKAR_FOREST,		66.0, 55.2)
	AddMob(22148,	L["Gordunni Head-Splitter"],		Z.TEROKKAR_FOREST,		22.5, 8.3)
	AddMob(23022,	L["Gordunni Soulreaper"],		Z.TEROKKAR_FOREST,		22.9, 8.8)
	AddMob(22143,	L["Gordunni Back-Breaker"],		Z.TEROKKAR_FOREST,		21.2, 8.1)
	AddMob(22144,	L["Gordunni Elementalist"],		Z.TEROKKAR_FOREST,		21.3, 12.0)

	-- Southern Barrens
	AddMob(3444,	L["Dig Rat"],				Z.SOUTHERN_BARRENS,		47.8, 88.6)

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
	AddMob(29235,	L["Gundrak Savage"],			Z.ZULDRAK,			66.8, 42.4)

	-------------------------------------------------------------------------------
	-- Instances
	-------------------------------------------------------------------------------
	-- Ahn'kahet: The Old Kingdom
	AddMob(29311,	BN.HERALD_VOLAZJ,			Z.AHNKAHET_THE_OLD_KINGDOM,	0, 0)

	-- Auchenai Crypts
	AddMob(18497,	L["Auchenai Monk"],			Z.AUCHENAI_CRYPTS,		0, 0)
	AddMob(18521,	L["Raging Skeleton"],			Z.AUCHENAI_CRYPTS,		0, 0)

	-- Blackrock Depths
	AddMob(8897,	L["Doomforge Craftsman"],		Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8898,	L["Anvilrage Marshal"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8903,	L["Anvilrage Captain"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8920,	L["Weapon Technician"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(8983,	BN.GOLEM_LORD_ARGELMACH,		Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9024,	BN.PYROMANCER_LOREGRAIN,		Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9025,	BN.LORD_ROCCOR,				Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9028,	BB["Grizzle"],				Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9499,	BN.PLUGGER_SPAZZRING,			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9543,	BN.RIBBLY_SCREWSPIGOT,			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(9554,	L["Hammered Patron"],			Z.BLACKROCK_DEPTHS,		0, 0)
	AddMob(10043,	L["Ribbly's Crony"],			Z.BLACKROCK_DEPTHS,		0, 0)

	-- Blackrock Spire
	AddMob(9216,	L["Spirestone Warlord"],		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9259,	L["Firebrand Grunt"],			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9260,	L["Firebrand Legionnaire"],		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9262,	L["Firebrand Invoker"],			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9264,	L["Firebrand Pyromancer"],		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9596,	BB["Bannok Grimaxe"],			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(9736,	BN.QUARTERMASTER_ZIGRIS,		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10264,	BN.SOLAKAR_FLAMEWREATH,			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10317,	L["Blackhand Elite"],			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10318,	L["Blackhand Assassin"],		Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10363,	BN.GENERAL_DRAKKISATH,			Z.BLACKROCK_SPIRE,		0, 0)
	AddMob(10899,	BB["Goraluk Anvilcrack"],		Z.BLACKROCK_SPIRE,		0, 0)

	-- Blackwing Lair
	AddMob(14401,	L["Master Elemental Shaper Krixix"],	Z.BLACKWING_LAIR,		0, 0)

	-- Dire Maul
	AddMob(11487,	BN.MAGISTER_KALENDRIS,			Z.DIRE_MAUL,			59.04, 48.82)
	AddMob(14354,	BB["Pusillin"],				Z.DIRE_MAUL,			59.04, 48.82)

	-- Gnomeregan
	AddMob(7800,	BN.MEKGINEER_THERMAPLUGG,		Z.GNOMEREGAN,			0, 0)

	-- Halls of Lightning
	AddMob(28923,	BN.LOKEN,				Z.HALLS_OF_LIGHTNING,		0, 0)

	-- Isle of Thunder
	AddMob(69461,	L["Itoka"],				Z.ISLE_OF_THUNDER,		0, 0)

	-- Karazhan
	AddMob(16406,	L["Phantom Attendant"],			Z.KARAZHAN,			0, 0)
	AddMob(16408,	L["Phantom Valet"],			Z.KARAZHAN,			0, 0)
	AddMob(16472,	L["Phantom Stagehand"],			Z.KARAZHAN,			0, 0)
	AddMob(15687,	BB["Moroes"],				Z.KARAZHAN,			0, 0)
	AddMob(15688,	BB["Terestian Illhoof"],		Z.KARAZHAN,			0, 0)
	AddMob(16152,	BB["Attumen the Huntsman"],		Z.KARAZHAN,			0, 0)
	AddMob(16524,	BB["Shade of Aran"],			Z.KARAZHAN,			0, 0)

	-- Magister's Terrace
	AddMob(24560,	BN.PRIESTESS_DELRISSA,			Z.MAGISTERS_TERRACE,		0, 0)
	AddMob(24664,	BN.KAELTHAS_SUNSTRIDER,			Z.MAGISTERS_TERRACE,		0, 0)

	-- Mana-Tombs
	AddMob(18314,	L["Nexus Stalker"],			Z.MANA_TOMBS,			0, 0)
	AddMob(18317,	L["Ethereal Priest"],			Z.MANA_TOMBS,			0, 0)
	AddMob(18344,	BN.NEXUS_PRINCE_SHAFFAR,		Z.MANA_TOMBS,			0, 0)

	-- Oculus
	AddMob(27656,	BN.LEY_GUARDIAN_EREGOS,			Z.THE_OCULUS,			0, 0)

	-- Old Hillsbrad Foothills
	AddMob(17820,	L["Durnholde Rifleman"],		Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)
	AddMob(17862,	BN.CAPTAIN_SKARLOC,			Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)
	AddMob(18096,	BN.EPOCH_HUNTER,			Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)
	AddMob(28132,	L["Don Carlos"],			Z.OLD_HILLSBRAD_FOOTHILLS,	0, 0)

	-- Ruins of Ahn'Qiraj
	AddMob(15340,	BB["Moam"],				Z.RUINS_OF_AHNQIRAJ,		0, 0)

	-- Scholomance
	AddMob(1853,	BN.DARKMASTER_GANDLING,			Z.SCHOLOMANCE,			0, 0)
	AddMob(10469,	L["Scholomance Adept"],			Z.SCHOLOMANCE,			0, 0)
	AddMob(10499,	L["Spectral Researcher"],		Z.SCHOLOMANCE,			0, 0)
	AddMob(10503,	BN.JANDICE_BAROV,			Z.SCHOLOMANCE,			0, 0)
	AddMob(10508,	BB["Ras Frostwhisper"],			Z.SCHOLOMANCE,			0, 0)

	-- Sethekk Halls
	AddMob(18322,	L["Sethekk Ravenguard"],		Z.SETHEKK_HALLS,		0, 0)
	AddMob(18472,	BN.DARKWEAVER_SYTH,			Z.SETHEKK_HALLS,		0, 0)

	-- Shadow Labyrinth
	AddMob(18667,	BN.BLACKHEART_THE_INCITER,		Z.SHADOW_LABYRINTH,		0, 0)
	AddMob(18708,	BN.MURMUR,				Z.SHADOW_LABYRINTH,		0, 0)
	AddMob(18830,	L["Cabal Fanatic"],			Z.SHADOW_LABYRINTH,		0, 0)

	-- Stratholme
	AddMob(10398,	L["Thuzadin Shadowcaster"],		Z.STRATHOLME,			0, 0)
	AddMob(10422,	L["Risen Sorcerer"],			Z.STRATHOLME,			0, 0)
	AddMob(10426,	L["Risen Inquisitor"],			Z.STRATHOLME,			0, 0)
	AddMob(10813,	BN.BALNAZZAR,				Z.STRATHOLME,			0, 0)
	AddMob(10438,	BN.MALEKI_THE_PALLID,			Z.STRATHOLME,			0, 0)
	AddMob(10997,	BB["Willey Hopebreaker"],		Z.STRATHOLME,			0, 0)

	-- Temple of Ahn'Qiraj
	AddMob(15263,	BB["The Prophet Skeram"],		Z.AHNQIRAJ_THE_FALLEN_KINGDOM,	0, 0)
	AddMob(15275,	BB["Emperor Vek'nilash"],		Z.AHNQIRAJ_THE_FALLEN_KINGDOM,	0, 0)
	AddMob(15276,	BB["Emperor Vek'lor"],			Z.AHNQIRAJ_THE_FALLEN_KINGDOM,	0, 0)

	-- The Arcatraz
	AddMob(20869,	L["Arcatraz Sentinel"],			Z.THE_ARCATRAZ,			0, 0)
	AddMob(20880,	L["Eredar Deathbringer"],		Z.THE_ARCATRAZ,			0, 0)
	AddMob(20900,	L["Unchained Doombringer"],		Z.THE_ARCATRAZ,			0, 0)
	AddMob(20885,	BN.DALLIAH_THE_DOOMSAYER,		Z.THE_ARCATRAZ,			0, 0)

	--The Black Morass
	AddMob(21104,	L["Rift Keeper"],			Z.THE_BLACK_MORASS,		0, 0)
	AddMob(17839,	L["Rift Lord"],				Z.THE_BLACK_MORASS,		0, 0)

	-- The Botanica
	AddMob(17975,	BN.HIGH_BOTANIST_FREYWINN,		Z.THE_BOTANICA,			0, 0)
	AddMob(18422,	L["Sunseeker Botanist"],		Z.THE_BOTANICA,			0, 0)
	AddMob(17977,	BN.WARP_SPLINTER,			Z.THE_BOTANICA,			0, 0)
	AddMob(17978,	BN.THORNGRIN_THE_TENDER,		Z.THE_BOTANICA,			0, 0)

	-- The Deadmines
	AddMob(657,	L["Defias Pirate"],			Z.THE_DEADMINES,		0, 0)
	AddMob(1732,	L["Defias Squallshaper"],		Z.THE_DEADMINES,		0, 0)

	-- The Mechanar
	AddMob(19168,	L["Sunseeker Astromage"],		Z.THE_MECHANAR,			0, 0)
	AddMob(19219,	BN.MECHANO_LORD_CAPACITUS,		Z.THE_MECHANAR,			0, 0)
	AddMob(19220,	BN.PATHALEON_THE_CALCULATOR,		Z.THE_MECHANAR,			0, 0)
	AddMob(19221,	BN.NETHERMANCER_SEPETHREA,		Z.THE_MECHANAR,			0, 0)

	-- The Shattered Halls
	AddMob(17465,	L["Shattered Hand Centurion"],		Z.THE_SHATTERED_HALLS,		0, 0)
	AddMob(16807,	BN.GRAND_WARLOCK_NETHEKURSE,		Z.THE_SHATTERED_HALLS,		0, 0)

	-- The Steamvault
	AddMob(17722,	L["Coilfang Sorceress"],		Z.THE_STEAMVAULT,		0, 0)
	AddMob(17803,	L["Coilfang Oracle"],			Z.THE_STEAMVAULT,		0, 0)
	AddMob(17796,	BN.MEKGINEER_STEAMRIGGER,		Z.THE_STEAMVAULT,		0, 0)
	AddMob(17798,	BN.WARLORD_KALITHRESH,			Z.THE_STEAMVAULT,		0, 0)

	-- Utgarde Keep
	AddMob(23954,	BN.INGVAR_THE_PLUNDERER,		Z.UTGARDE_KEEP,			0, 0)

	-- Utgarde Pinnacle
	AddMob(26861,	BN.KING_YMIRON,			Z.UTGARDE_PINNACLE,		0, 0)

	self.InitMob = nil
end
