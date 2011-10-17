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
local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BB = LibStub("LibBabble-Boss-3.0"):GetLookupTable()

private.mob_list = {}

function addon:InitMob()
	local function AddMob(mob_id, mob_name, zone, coord_x, coord_y)
		private:AddListEntry(private.mob_list, mob_id, mob_name, BZ[zone], coord_x, coord_y, nil)
	end

	-- Arathi Highlands
	AddMob(2556,	L["Witherbark Headhunter"],		"Arathi Highlands", 70.5, 70.4)
	AddMob(2557,	L["Witherbark Shadow Hunter"],		"Arathi Highlands", 70.3, 78.9)
	AddMob(2558,	L["Witherbark Berserker"],		"Arathi Highlands", 24.2, 66.2)

	-- Ashenvale
	AddMob(3834,	L["Crazed Ancient"],			"Ashenvale", 59.4, 43.0)
	AddMob(3919,	L["Withered Ancient"],			"Ashenvale", 58.5, 36.1)

	-- Blade's Edge Mountains
	AddMob(16952,	L["Anger Guard"],			"Blade's Edge Mountains", 72.0, 40.5)
	AddMob(19952,	L["Bloodmaul Geomancer"],		"Blade's Edge Mountains", 45.0, 68.5)
	AddMob(19960,	L["Doomforge Engineer"],		"Blade's Edge Mountains", 75.1, 39.8)
	AddMob(19973,	L["Abyssal Flamebringer"],		"Blade's Edge Mountains", 30.0, 81.0)
	AddMob(19984,	L["Vekh'nir Dreadhawk"],		"Blade's Edge Mountains", 78.0, 74.3)
	AddMob(22242,	L["Bash'ir Spell-Thief"],		"Blade's Edge Mountains", 51.0, 16.5)
	AddMob(23385,	L["Simon Unit"],			"Blade's Edge Mountains", 33.5, 51.5)
	AddMob(23386,	L["Gan'arg Analyzer"],			"Blade's Edge Mountains", 33.0, 52.5)

	-- Blasted Lands
	AddMob(6005,	L["Shadowsworn Thug"],			"Blasted Lands", 63.8, 32.0)

	-- Burning Steppes
	AddMob(7025,	L["Blackrock Soldier"],			"Burning Steppes", 44.0, 52.8)
	AddMob(7027,	L["Blackrock Slayer"],			"Burning Steppes", 44.4, 50.7)
	AddMob(7035,	L["Firegut Brute"],			"Burning Steppes", 82.5, 48.1)
	AddMob(7037,	L["Thaurissan Firewalker"],		"Burning Steppes", 61.1, 42.0)
	AddMob(10119,	L["Volchan"],				"Burning Steppes", 73.0, 49.3)

	-- Deadwind Pass
	AddMob(7372,	L["Deadwind Warlock"],			"Deadwind Pass", 59.8, 74.4)

	-- Dragonblight
	AddMob(26343,	L["Indu'le Fisherman"],			"Dragonblight", 40.2, 65.5)
	AddMob(26336,	L["Indu'le Mystic"],			"Dragonblight", 40.2, 65.5)
	AddMob(26344,	L["Indu'le Warrior"],			"Dragonblight", 40.2, 65.5)
	AddMob(27333,	L["Onslaught Mason"],			"Dragonblight", 85.8, 36.0)

	-- Dustwallow Marsh
	AddMob(4834,	L["Theramore Infiltrator"],		"Dustwallow Marsh", 44.0, 27.3)

	-- Eastern Plaguelands
	AddMob(1844,	L["Foreman Marcrid"],			"Eastern Plaguelands", 54.0, 68.0)
	AddMob(8546,	L["Dark Adept"],			"Eastern Plaguelands", 65.8, 37.9)
	AddMob(8550,	L["Shadowmage"],			"Eastern Plaguelands", 78.5, 35.3)
	AddMob(8561,	L["Mossflayer Shadowhunter"],		"Eastern Plaguelands", 60.9, 21.5)
	AddMob(9451,	L["Scarlet Archmage"],			"Eastern Plaguelands", 81.5, 75.4)

	-- Felwood
	AddMob(7158,	L["Deadwood Shaman"],			"Felwood", 62.5, 10.3)

	-- Grizzly Hills
	AddMob(26270,	L["Iron Rune-Shaper"],			"Grizzly Hills", 67.8, 16.3)
	AddMob(26679,	L["Silverbrook Trapper"],		"Grizzly Hills", 27.3, 33.9)
	AddMob(26708,	L["Silverbrook Villager"],		"Grizzly Hills", 27.3, 33.9)
	AddMob(27546,	L["Silverbrook Hunter"],		"Grizzly Hills", 37.5, 68.0)
	AddMob(27676,	L["Silverbrook Defender"],		"Grizzly Hills", 24.6, 33.3)

	-- Hillsbrad Foothills
	AddMob(2242,	L["Syndicate Spy"],			"Hillsbrad Foothills", 56.0, 24.2)
	AddMob(2374,	L["Torn Fin Muckdweller"],		"Hillsbrad Foothills", 31.5, 72.1)
	AddMob(2375,	L["Torn Fin Coastrunner"],		"Hillsbrad Foothills", 25.1, 70.5)
	AddMob(2376,	L["Torn Fin Oracle"],			"Hillsbrad Foothills", 42.0, 68.0)
	AddMob(2377,	L["Torn Fin Tidehunter"],		"Hillsbrad Foothills", 39.0, 69.0)
	AddMob(14276,	L["Scargil"],				"Hillsbrad Foothills", 26.6, 71.2)

	-- Icecrown
	AddMob(30921,	L["Skeletal Runesmith"],		"Icecrown", 60.0, 73.1)
	AddMob(31702,	L["Frostbrood Spawn"],			"Icecrown", 75.3, 43.4)
	AddMob(32289,	L["Damned Apothecary"],			"Icecrown", 49.8, 32.7)
	AddMob(32290,	L["Cult Alchemist"],			"Icecrown", 49.5, 33.1)
	AddMob(32297,	L["Cult Researcher"],			"Icecrown", 50.7, 30.9)
	AddMob(32349,	L["Cultist Shard Watcher"],		"Icecrown", 48.1, 67.9)

	-- Nagrand
	AddMob(17136,	L["Boulderfist Warrior"],		"Nagrand", 51.0, 57.0)
	AddMob(17150,	L["Vir'aani Arcanist"],			"Nagrand", 40.5, 69.6)
	AddMob(18203,	L["Murkblood Raider"],			"Nagrand", 31.5, 43.5)

	-- Netherstorm
	AddMob(18853,	L["Sunfury Bloodwarder"],		"Netherstorm", 27.0, 72.0)
	AddMob(18866,	L["Mageslayer"],			"Netherstorm", 55.5, 85.5)
	AddMob(18870,	L["Voidshrieker"],			"Netherstorm", 60.0, 39.0)
	AddMob(18872,	L["Disembodied Vindicator"],		"Netherstorm", 36.0, 55.5)
	AddMob(18873,	L["Disembodied Protector"],		"Netherstorm", 31.8, 52.7)
	AddMob(22822,	L["Ethereum Nullifier"],		"Netherstorm", 66.0, 49.5)
	AddMob(20134,	L["Sunfury Arcanist"],			"Netherstorm", 51.0, 82.5)
	AddMob(20135,	L["Sunfury Arch Mage"],			"Netherstorm", 46.5, 81.0)
	AddMob(20136,	L["Sunfury Researcher"],		"Netherstorm", 48.2, 82.5)
	AddMob(20207,	L["Sunfury Bowman"],			"Netherstorm", 61.5, 67.5)
	AddMob(23008,	L["Ethereum Jailor"],			"Netherstorm", 58.8, 35.6)

	-- Searing Gorge
	AddMob(5844,	L["Dark Iron Slaver"],			"Searing Gorge", 43.8, 33.8)
	AddMob(5846,	L["Dark Iron Taskmaster"],		"Searing Gorge", 44.4, 41.1)
	AddMob(5861,	L["Twilight Fire Guard"],		"Searing Gorge", 25.5, 33.8)
	AddMob(8637,	L["Dark Iron Watchman"],		"Searing Gorge", 69.3, 34.8)
	AddMob(9026,	BB["Overmaster Pyron"],			"Searing Gorge", 26.2, 74.9)

	-- Shadowmoon Valley
	AddMob(19740,	L["Wrathwalker"],			"Shadowmoon Valley", 25.5, 33.0)
	AddMob(19754,	L["Deathforge Tinkerer"],		"Shadowmoon Valley", 39.0, 38.7)
	AddMob(19755,	L["Mo'arg Weaponsmith"],		"Shadowmoon Valley", 25.5, 31.5)
	AddMob(19756,	L["Deathforge Smith"],			"Shadowmoon Valley", 37.5, 42.0)
	AddMob(19768,	L["Coilskar Siren"],			"Shadowmoon Valley", 46.5, 30.0)
	AddMob(19792,	L["Eclipsion Centurion"],		"Shadowmoon Valley", 48.0, 61.8)
	AddMob(19795,	L["Eclipsion Blood Knight"],		"Shadowmoon Valley", 52.7, 63.2)
	AddMob(19796,	L["Eclipsion Archmage"],		"Shadowmoon Valley", 49.5, 58.5)
	AddMob(19806,	L["Eclipsion Bloodwarder"],		"Shadowmoon Valley", 46.5, 66.0)
	AddMob(19826,	L["Dark Conclave Shadowmancer"],	"Shadowmoon Valley", 37.5, 29.0)
	AddMob(20878,	L["Deathforge Guardian"],		"Shadowmoon Valley", 39.0, 47.0)
	AddMob(20887,	L["Deathforge Imp"],			"Shadowmoon Valley", 40.5, 39.1)
	AddMob(21050,	L["Enraged Earth Spirit"],		"Shadowmoon Valley", 46.5, 45.0)
	AddMob(21059,	L["Enraged Water Spirit"],		"Shadowmoon Valley", 51.0, 25.5)
	AddMob(21060,	L["Enraged Air Spirit"],		"Shadowmoon Valley", 70.5, 28.5)
	AddMob(21061,	L["Enraged Fire Spirit"],		"Shadowmoon Valley", 48.0, 43.5)
	AddMob(21302,	L["Shadow Council Warlock"],		"Shadowmoon Valley", 22.9, 38.2)
	AddMob(21314,	L["Terrormaster"],			"Shadowmoon Valley", 24.0, 45.0)
	AddMob(21454,	L["Ashtongue Warrior"],			"Shadowmoon Valley", 57.0, 36.0)
	AddMob(22016,	L["Eclipsion Soldier"],			"Shadowmoon Valley", 52.8, 66.5)
	AddMob(22017,	L["Eclipsion Spellbinder"],		"Shadowmoon Valley", 52.7, 63.4)
	AddMob(22018,	L["Eclipsion Cavalier"],		"Shadowmoon Valley", 52.7, 61.1)
	AddMob(22076,	L["Torloth the Magnificent"],		"Shadowmoon Valley", 51.2, 72.5)
	AddMob(22093,	L["Illidari Watcher"],			"Shadowmoon Valley", 52.5, 72.0)
	AddMob(23305,	L["Crazed Murkblood Foreman"],		"Shadowmoon Valley", 72.3, 90.0)
	AddMob(23324,	L["Crazed Murkblood Miner"],		"Shadowmoon Valley", 73.5, 88.5)

	-- Sholazar Basin
	AddMob(28123,	L["Venture Co. Excavator"],		"Sholazar Basin", 35.8, 45.5)
	AddMob(28379,	L["Shattertusk Mammoth"],		"Sholazar Basin", 53.5, 24.4)

	-- Silithus
	AddMob(14454,	BB["The Windreaver"],			"Silithus", 27.0, 26.8)

	-- Silverpine Forest
	AddMob(3530,	L["Pyrewood Tailor"],			"Silverpine Forest", 45.7, 71.0)
	AddMob(3531,	L["Moonrage Tailor"],			"Silverpine Forest", 45.5, 73.3)

	-- Northern Stranglethorn
	AddMob(674,	L["Venture Co. Strip Miner"],		"Northern Stranglethorn", 54.1, 70.6)
	AddMob(938,	L["Kurzen Commando"],			"Northern Stranglethorn", 60.9, 16.3)

	-- The Cape of Stranglethorn
	AddMob(1561,	L["Bloodsail Raider"],			"The Cape of Stranglethorn", 44.0, 63.8)

	-- Swamp of Sorrows
	AddMob(764,	L["Swampwalker"],			"Swamp of Sorrows", 51.0, 36.7)
	AddMob(14448,	L["Molt Thorn"],			"Swamp of Sorrows", 51.0, 42.6)

	-- Tanaris
	AddMob(5617,	L["Wastewander Shadow Mage"],		"Tanaris", 60.0, 37.4)
	AddMob(5618,	L["Wastewander Bandit"],		"Tanaris", 63.6, 30.6)

	-- Terokkar Forest
	AddMob(16810,	L["Bonechewer Backbreaker"],		"Terokkar Forest", 66.0, 55.2)
	AddMob(22148,	L["Gordunni Head-Splitter"],		"Terokkar Forest", 22.5, 8.3)
	AddMob(23022,	L["Gordunni Soulreaper"],		"Terokkar Forest", 22.9, 8.8)
	AddMob(22143,	L["Gordunni Back-Breaker"],		"Terokkar Forest", 21.2, 8.1)
	AddMob(22144,	L["Gordunni Elementalist"],		"Terokkar Forest", 21.3, 12.0)

	-- Southern Barrens
	AddMob(3376,	L["Excavation Raider"],			"Southern Barrens", 47.8, 88.6)
	AddMob(3377,	L["Bael'dun Soldier"],			"Southern Barrens", 47.8, 88.6)
	AddMob(3378,	L["Bael'dun Rifleman"],			"Southern Barrens", 47.8, 88.6)
	AddMob(39153,	L["Bael'dun Officer"],			"Southern Barrens", 47.8, 88.6)

	-- Northern Barrens
	AddMob(3385,	L["Theramore Marine"],			"Northern Barrens", 71.5, 86.6)
	AddMob(3386,	L["Theramore Preserver"],		"Northern Barrens", 71.5, 86.6)

	-- The Hinterlands
	AddMob(2644,	L["Vilebranch Hideskinner"],		"The Hinterlands", 62.2, 69.2)

	-- The Storm Peaks
	AddMob(29370,	L["Stormforged Champion"],		"The Storm Peaks", 26.1, 47.5)
	AddMob(29376,	L["Stormforged Artificer"],		"The Storm Peaks", 31.5, 44.2)
	AddMob(29402,	L["Ironwool Mammoth"],			"The Storm Peaks", 36.0, 83.5)
	AddMob(29792,	L["Frostfeather Screecher"],		"The Storm Peaks", 33.5, 65.5)
	AddMob(29793,	L["Frostfeather Witch"],		"The Storm Peaks", 33.0, 66.8)
	AddMob(30208,	L["Stormforged Ambusher"],		"The Storm Peaks", 70.3, 57.5)
	AddMob(30222,	L["Stormforged Infiltrator"],		"The Storm Peaks", 58.5, 63.2)
	AddMob(30260,	L["Stoic Mammoth"],			"The Storm Peaks", 54.8, 64.9)
	AddMob(30448,	L["Plains Mammoth"],			"The Storm Peaks", 66.1, 45.6)

	-- Un'Goro Crater
	AddMob(6557,	L["Primal Ooze"],			"Un'Goro Crater", 51.8, 34.9)
	AddMob(6559,	L["Glutinous Ooze"],			"Un'Goro Crater", 39.0, 37.7)

	-- Western Plaguelands
	AddMob(1783,	L["Skeletal Flayer"],			"Western Plaguelands", 50.7, 80.5)
	AddMob(1791,	L["Slavering Ghoul"],			"Western Plaguelands", 36.0, 56.5)
	AddMob(1812,	L["Rotting Behemoth"],			"Western Plaguelands", 64.5, 36.6)

	-- Westfall
	AddMob(590,	L["Defias Looter"],			"Westfall", 37.5, 58.4)

	-- Wetlands
	AddMob(1160,	L["Captain Halyndor"],			"Wetlands", 15.0, 24.0)

	-- Winterspring
	AddMob(7438,	L["Winterfall Ursa"],			"Winterspring", 67.5, 36.3)
	AddMob(7440,	L["Winterfall Den Watcher"],		"Winterspring", 68.0, 35.5)
	AddMob(7441,	L["Winterfall Totemic"],		"Winterspring", 24.2, 50.4)
	AddMob(14457,	BB["Princess Tempestria"],		"Winterspring", 52.7, 41.9)

	-- Zul'drak
	AddMob(28851,	L["Enraged Mammoth"],			"Zul'Drak", 72.0, 41.1)
	AddMob(29235,	L["Gundrak Savage"],			"Zul'Drak", 66.8, 42.4)

	-------------------------------------------------------------------------------
	-- Instances
	-------------------------------------------------------------------------------
	-- Ahn'kahet: The Old Kingdom
	AddMob(29311,	BB["Herald Volazj"],			"Ahn'kahet: The Old Kingdom", 0, 0)

	-- Auchenai Crypts
	AddMob(18497,	L["Auchenai Monk"],			"Auchenai Crypts", 0, 0)
	AddMob(18521,	L["Raging Skeleton"],			"Auchenai Crypts", 0, 0)

	-- Blackrock Depths
	AddMob(8897,	L["Doomforge Craftsman"],		"Blackrock Depths", 0, 0)
	AddMob(8898,	L["Anvilrage Marshal"],			"Blackrock Depths", 0, 0)
	AddMob(8903,	L["Anvilrage Captain"],			"Blackrock Depths", 0, 0)
	AddMob(8920,	L["Weapon Technician"],			"Blackrock Depths", 0, 0)
	AddMob(8983,	BB["Golem Lord Argelmach"],		"Blackrock Depths", 0, 0)
	AddMob(9024,	BB["Pyromancer Loregrain"],		"Blackrock Depths", 0, 0)
	AddMob(9025,	BB["Lord Roccor"],			"Blackrock Depths", 0, 0)
	AddMob(9028,	BB["Grizzle"],				"Blackrock Depths", 0, 0)
	AddMob(9499,	BB["Plugger Spazzring"],		"Blackrock Depths", 0, 0)
	AddMob(9543,	BB["Ribbly Screwspigot"],		"Blackrock Depths", 0, 0)
	AddMob(9554,	L["Hammered Patron"],			"Blackrock Depths", 0, 0)
	AddMob(10043,	L["Ribbly's Crony"],			"Blackrock Depths", 0, 0)

	-- Blackrock Spire
	AddMob(9216,	L["Spirestone Warlord"],		"Blackrock Spire", 0, 0)
	AddMob(9259,	L["Firebrand Grunt"],			"Blackrock Spire", 0, 0)
	AddMob(9260,	L["Firebrand Legionnaire"],		"Blackrock Spire", 0, 0)
	AddMob(9262,	L["Firebrand Invoker"],			"Blackrock Spire", 0, 0)
	AddMob(9264,	L["Firebrand Pyromancer"],		"Blackrock Spire", 0, 0)
	AddMob(9596,	BB["Bannok Grimaxe"],			"Blackrock Spire", 0, 0)
	AddMob(9736,	BB["Quartermaster Zigris"],		"Blackrock Spire", 0, 0)
	AddMob(10264,	BB["Solakar Flamewreath"],		"Blackrock Spire", 0, 0)
	AddMob(10317,	L["Blackhand Elite"],			"Blackrock Spire", 0, 0)
	AddMob(10339,	BB["Gyth"],				"Blackrock Spire", 0, 0)
	AddMob(10363,	BB["General Drakkisath"],		"Blackrock Spire", 0, 0)
	AddMob(10899,	BB["Goraluk Anvilcrack"],		"Blackrock Spire", 0, 0)

	-- Blackwing Lair
	AddMob(14401,	L["Master Elemental Shaper Krixix"],	"Blackwing Lair", 0, 0)

	-- Dire Maul
	AddMob(11487,	BB["Magister Kalendris"],		"Dire Maul", 59.04, 48.82)
	AddMob(14354,	BB["Pusillin"],				"Dire Maul", 59.04, 48.82)

	-- Gnomeregan
	AddMob(7800,	BB["Mekgineer Thermaplugg"],		"Gnomeregan", 0, 0)

	-- Halls of Lightning
	AddMob(28923,	BB["Loken"],				"Halls of Lightning", 0, 0)

	-- Karazhan
	AddMob(16406,	L["Phantom Attendant"],			"Karazhan", 0, 0)
	AddMob(16408,	L["Phantom Valet"],			"Karazhan", 0, 0)
	AddMob(16472,	L["Phantom Stagehand"],			"Karazhan", 0, 0)
	AddMob(15687,	BB["Moroes"],				"Karazhan", 0, 0)
	AddMob(15688,	BB["Terestian Illhoof"],		"Karazhan", 0, 0)
	AddMob(16152,	BB["Attumen the Huntsman"],		"Karazhan", 0, 0)
	AddMob(16524,	BB["Shade of Aran"],			"Karazhan", 0, 0)

	-- Magister's Terrace
	AddMob(24560,	BB["Priestess Delrissa"],		"Magisters' Terrace", 0, 0)
	AddMob(24664,	BB["Kael'thas Sunstrider"],		"Magisters' Terrace", 0, 0)

	-- Mana-Tombs
	AddMob(18314,	L["Nexus Stalker"],			"Mana-Tombs", 0, 0)
	AddMob(18317,	L["Ethereal Priest"],			"Mana-Tombs", 0, 0)
	AddMob(18344,	BB["Nexus-Prince Shaffar"],		"Mana-Tombs", 0, 0)

	-- Oculus
	AddMob(27656,	BB["Ley-Guardian Eregos"],		"The Oculus", 0, 0)

	-- Old Hillsbrad Foothills
	AddMob(17820,	L["Durnholde Rifleman"],		"Old Hillsbrad Foothills", 0, 0)
	AddMob(17862,	BB["Captain Skarloc"],			"Old Hillsbrad Foothills", 0, 0)
	AddMob(18096,	BB["Epoch Hunter"],			"Old Hillsbrad Foothills", 0, 0)
	AddMob(28132,	L["Don Carlos"],			"Old Hillsbrad Foothills", 0, 0)

	-- Ruins of Ahn'Qiraj
	AddMob(15340,	BB["Moam"],				"Ruins of Ahn'Qiraj", 0, 0)

	-- Scholomance
	AddMob(1853,	BB["Darkmaster Gandling"],		"Scholomance", 0, 0)
	AddMob(10469,	L["Scholomance Adept"],			"Scholomance", 0, 0)
	AddMob(10499,	L["Spectral Researcher"],		"Scholomance", 0, 0)
	AddMob(10503,	BB["Jandice Barov"],			"Scholomance", 0, 0)
	AddMob(10508,	BB["Ras Frostwhisper"],			"Scholomance", 0, 0)

	-- Sethekk Halls
	AddMob(18320,	L["Time-Lost Shadowmage"],		"Sethekk Halls", 0, 0)
	AddMob(18322,	L["Sethekk Ravenguard"],		"Sethekk Halls", 0, 0)
	AddMob(18472,	BB["Darkweaver Syth"],			"Sethekk Halls", 0, 0)

	-- Shadow Labyrinth
	AddMob(18667,	BB["Blackheart the Inciter"],		"Shadow Labyrinth", 0, 0)
	AddMob(18708,	BB["Murmur"],				"Shadow Labyrinth", 0, 0)
	AddMob(18830,	L["Cabal Fanatic"],			"Shadow Labyrinth", 0, 0)

	-- Stratholme
	AddMob(10398,	L["Thuzadin Shadowcaster"],		"Stratholme", 0, 0)
	AddMob(10422,	L["Crimson Sorcerer"],			"Stratholme", 0, 0)
	AddMob(10426,	L["Crimson Inquisitor"],		"Stratholme", 0, 0)
	AddMob(10813,	BB["Balnazzar"],			"Stratholme", 0, 0)
	AddMob(10438,	BB["Maleki the Pallid"],		"Stratholme", 0, 0)
	AddMob(10997,	BB["Cannon Master Willey"],		"Stratholme", 0, 0)

	-- Temple of Ahn'Qiraj
	AddMob(15263,	BB["The Prophet Skeram"],		"Temple of Ahn'Qiraj", 0, 0)
	AddMob(15275,	BB["Emperor Vek'nilash"],		"Temple of Ahn'Qiraj", 0, 0)
	AddMob(15276,	BB["Emperor Vek'lor"],			"Temple of Ahn'Qiraj", 0, 0)

	-- The Arcatraz
	AddMob(20869,	L["Arcatraz Sentinel"],			"The Arcatraz", 0, 0)
	AddMob(20880,	L["Eredar Deathbringer"],		"The Arcatraz", 0, 0)
	AddMob(20898,	L["Gargantuan Abyssal"],		"The Arcatraz", 0, 0)
	AddMob(20900,	L["Unchained Doombringer"],		"The Arcatraz", 0, 0)
	AddMob(20885,	BB["Dalliah the Doomsayer"],		"The Arcatraz", 0, 0)

	--The Black Morass
	AddMob(21104,	L["Rift Keeper"],			"The Black Morass", 0, 0)
	AddMob(17839,	L["Rift Lord"],				"The Black Morass", 0, 0)
	AddMob(17879,	BB["Chrono Lord Deja"],			"The Black Morass", 0, 0)

	-- The Botanica
	AddMob(17975,	BB["High Botanist Freywinn"],		"The Botanica", 0, 0)
	AddMob(18422,	L["Sunseeker Botanist"],		"The Botanica", 0, 0)
	AddMob(17977,	BB["Warp Splinter"],			"The Botanica", 0, 0)
	AddMob(17978,	BB["Thorngrin the Tender"],		"The Botanica", 0, 0)

	-- The Deadmines
	AddMob(657,	L["Defias Pirate"],			"The Deadmines", 0, 0)
	AddMob(1732,	L["Defias Squallshaper"],		"The Deadmines", 0, 0)

	-- The Mechanar
	AddMob(19168,	L["Sunseeker Astromage"],		"The Mechanar", 0, 0)
	AddMob(19219,	BB["Mechano-Lord Capacitus"],		"The Mechanar", 0, 0)
	AddMob(19220,	BB["Pathaleon the Calculator"],		"The Mechanar", 0, 0)
	AddMob(19221,	BB["Nethermancer Sepethrea"],		"The Mechanar", 0, 0)

	-- The Shattered Halls
	AddMob(17465,	L["Shattered Hand Centurion"],		"The Shattered Halls", 0, 0)
	AddMob(16807,	BB["Grand Warlock Nethekurse"],		"The Shattered Halls", 0, 0)

	-- The Slave Pens
	AddMob(17941,	BB["Mennu the Betrayer"],		"The Slave Pens", 0, 0)

	-- The Steamvault
	AddMob(17722,	L["Coilfang Sorceress"],		"The Steamvault", 0, 0)
	AddMob(17803,	L["Coilfang Oracle"],			"The Steamvault", 0, 0)
	AddMob(17796,	BB["Mekgineer Steamrigger"],		"The Steamvault", 0, 0)
	AddMob(17797,	BB["Hydromancer Thespia"],		"The Steamvault", 0, 0)
	AddMob(17798,	BB["Warlord Kalithresh"],		"The Steamvault", 0, 0)

	-- Utgarde Keep
	AddMob(23954,	BB["Ingvar the Plunderer"],		"Utgarde Keep", 0, 0)

	-- Utgarde Pinnacle
	AddMob(26861,	BB["King Ymiron"],			"Utgarde Pinnacle", 0, 0)

	self.InitMob = nil
end
