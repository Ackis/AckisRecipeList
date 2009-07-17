--[[

************************************************************************

ARL-Mob.lua

Monster data for all of Ackis Recipe List

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(MobDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS		= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitMob(MobDB)

-- Cities
	-- Orgrimmar
	self:addLookupList(MobDB,3320,L["Soran"],BZONE["Orgrimmar"],49.32,70.13)
	-- Shattrath City
	self:addLookupList(MobDB,18477,L["Timber Worg Alpha"],BZONE["Shattrath City"],45.83,60.49)
-- Zones
	-- Alterac Mountains
	self:addLookupList(MobDB,2242,L["Syndicate Spy"],BZONE["Alterac Mountains"],61.39,44.67)
	self:addLookupList(MobDB,2246,L["Syndicate Assassin"],BZONE["Alterac Mountains"],39.89,16.47)
	-- Arathi Highlands
	self:addLookupList(MobDB,2554,L["Witherbark Axe Thrower"],BZONE["Arathi Highlands"],65.91,67.58)
	self:addLookupList(MobDB,2556,L["Witherbark Headhunter"],BZONE["Arathi Highlands"],68.02,73.06)
	self:addLookupList(MobDB,2557,L["Witherbark Shadow Hunter"],BZONE["Arathi Highlands"],68.09,79.70)
	self:addLookupList(MobDB,2558,L["Witherbark Berserker"],BZONE["Arathi Highlands"],24.01,65.16)
	self:addLookupList(MobDB,2587,L["Syndicate Pathstalker"],BZONE["Arathi Highlands"],32.61,28.92)
	self:addLookupList(MobDB,2589,L["Syndicate Mercenary"],BZONE["Arathi Highlands"],32.92,28.94)
	self:addLookupList(MobDB,2606,L["Nimar the Slayer"],BZONE["Arathi Highlands"],65.77,68.75)
	-- Ashenvale
	self:addLookupList(MobDB,3834,L["Crazed Ancient"],BZONE["Ashenvale"],58.38,38.75)
	self:addLookupList(MobDB,3919,L["Withered Ancient"],BZONE["Ashenvale"],58.40,38.89)
	self:addLookupList(MobDB,8959,L["Felpaw Wolf"],BZONE["Ashenvale"],55.62,29.13)
	-- Azshara
	self:addLookupList(MobDB,6138,L["Arkkoran Oracle"],BZONE["Azshara"],77.24,42.52)
	self:addLookupList(MobDB,6144,L["Son of Arkkoroc"],BZONE["Azshara"],60.71,53.37)
	self:addLookupList(MobDB,6146,L["Cliff Breaker"],BZONE["Azshara"],60.41,59.60)
	self:addLookupList(MobDB,6201,L["Legashi Rogue"],BZONE["Azshara"],57.29,21.23)
	-- Blade's Edge Mountains
	self:addLookupList(MobDB,16952,L["Anger Guard"],BZONE["Blade's Edge Mountains"],73.40,41.43)
	self:addLookupList(MobDB,19952,L["Bloodmaul Geomancer"],BZONE["Blade's Edge Mountains"],45.10,73.77)
	self:addLookupList(MobDB,19960,L["Doomforge Engineer"],BZONE["Blade's Edge Mountains"],74.34,41.02)
	self:addLookupList(MobDB,19973,L["Abyssal Flamebringer"],BZONE["Blade's Edge Mountains"],29.23,79.93)
	self:addLookupList(MobDB,19984,L["Vekh'nir Dreadhawk"],BZONE["Blade's Edge Mountains"],73.97,74.45)
	self:addLookupList(MobDB,20058,L["Bloodmaul Dire Wolf"],BZONE["Blade's Edge Mountains"],44.28,77.38)
	self:addLookupList(MobDB,22242,L["Bash'ir Spell-Thief"],BZONE["Blade's Edge Mountains"],53.42,16.14)
	self:addLookupList(MobDB,22286,L["Fel Rager"],BZONE["Blade's Edge Mountains"],0,0)
	self:addLookupList(MobDB,23061,L["Rivendark"],BZONE["Blade's Edge Mountains"],30.56,59.24)
	self:addLookupList(MobDB,23261,L["Furywing"],BZONE["Blade's Edge Mountains"],58.42,14.34)
	self:addLookupList(MobDB,23281,L["Insidion"],BZONE["Blade's Edge Mountains"],55.61,15.97)
	self:addLookupList(MobDB,23282,L["Obsidia"],BZONE["Blade's Edge Mountains"],31.43,57.74)
	self:addLookupList(MobDB,23354,L["Mo'arg Incinerator"],BZONE["Blade's Edge Mountains"],32.70,47.84)
	self:addLookupList(MobDB,23385,L["Simon Unit"],BZONE["Blade's Edge Mountains"],34.70,49.88)
	-- Blasted Lands
	self:addLookupList(MobDB,5990,L["Redstone Basilisk"],BZONE["Blasted Lands"],58.01,31.29)
	self:addLookupList(MobDB,5992,L["Ashmane Boar"],BZONE["Blasted Lands"],58.70,30.82)
	self:addLookupList(MobDB,5993,L["Helboar"],BZONE["Blasted Lands"],55.23,49.77)
	self:addLookupList(MobDB,6005,L["Shadowsworn Thug"],BZONE["Blasted Lands"],64.82,35.68)
	self:addLookupList(MobDB,12397,BBOSS["Lord Kazzak"],BZONE["Blasted Lands"],0,0)
	-- Burning Steppes
	self:addLookupList(MobDB,7025,L["Blackrock Soldier"],BZONE["Burning Steppes"],47.34,54.47)
	self:addLookupList(MobDB,7027,L["Blackrock Slayer"],BZONE["Burning Steppes"],46.25,50.24)
	self:addLookupList(MobDB,7029,L["Blackrock Battlemaster"],BZONE["Burning Steppes"],40.95,34.77)
	self:addLookupList(MobDB,7035,L["Firegut Brute"],BZONE["Burning Steppes"],81.90,42.40)
	self:addLookupList(MobDB,7037,L["Thaurissan Firewalker"],BZONE["Burning Steppes"],62.95,39.33)
	self:addLookupList(MobDB,7040,L["Black Dragonspawn"],BZONE["Burning Steppes"],86.92,43.18)
	self:addLookupList(MobDB,7047,L["Black Broodling"],BZONE["Burning Steppes"],87.18,53.74)
	self:addLookupList(MobDB,7055,L["Blackrock Worg"],BZONE["Burning Steppes"],48.49,56.21)
	self:addLookupList(MobDB,9695,L["Deathlash Scorpid"],BZONE["Burning Steppes"],63.15,45.64)
	self:addLookupList(MobDB,10119,L["Volchan"],BZONE["Burning Steppes"],82.53,48.52)
	-- Darkshore
	self:addLookupList(MobDB,2337,L["Dark Strand Voidcaller"],BZONE["Darkshore"],56.31,25.10)
	self:addLookupList(MobDB,7106,L["Jadefire Rogue"],BZONE["Darkshore"],46.40,85.27)
	self:addLookupList(MobDB,7109,L["Jadefire Felsworn"],BZONE["Darkshore"],46.44,84.67)
	-- Deadwind Pass
	self:addLookupList(MobDB,7372,L["Deadwind Warlock"],BZONE["Deadwind Pass"],61.16,72.67)
	-- Desolace
	self:addLookupList(MobDB,4674,L["Hatefury Shadowstalker"],BZONE["Desolace"],75.37,20.74)
	self:addLookupList(MobDB,4676,L["Lesser Infernal"],BZONE["Desolace"],52.49,74.71)
	-- Dragonblight
	self:addLookupList(MobDB,27329,L["Onslaught Bloodhound"],BZONE["Dragonblight"],86.72,37.66)
	-- Duskwood
	self:addLookupList(MobDB,910,L["Defias Enchanter"],BZONE["Duskwood"],39.07,74.70)
	self:addLookupList(MobDB,923,L["Young Black Ravager"],BZONE["Duskwood"],48.60,64.48)
	-- Dustwallow Marsh
	self:addLookupList(MobDB,4341,L["Drywallow Crocolisk"],BZONE["Dustwallow Marsh"],45.95,25.08)
	self:addLookupList(MobDB,4343,L["Drywallow Snapper"],BZONE["Dustwallow Marsh"],39.52,37.74)
	self:addLookupList(MobDB,4364,L["Strashaz Warrior"],BZONE["Dustwallow Marsh"],75.03,19.38)
	self:addLookupList(MobDB,4366,L["Strashaz Serpent Guard"],BZONE["Dustwallow Marsh"],75.03,19.38)
	self:addLookupList(MobDB,4368,L["Strashaz Myrmidon"],BZONE["Dustwallow Marsh"],76.20,17.97)
	self:addLookupList(MobDB,4834,L["Theramore Infiltrator"],BZONE["Dustwallow Marsh"],39.48,31.01)
	-- Eastern Plaguelands
	self:addLookupList(MobDB,8546,L["Dark Adept"],BZONE["Eastern Plaguelands"],66.79,36.78)
	self:addLookupList(MobDB,8550,L["Shadowmage"],BZONE["Eastern Plaguelands"],70.60,40.03)
	self:addLookupList(MobDB,8561,L["Mossflayer Shadowhunter"],BZONE["Eastern Plaguelands"],62.86,14.99)
	self:addLookupList(MobDB,9447,L["Scarlet Warder"],BZONE["Eastern Plaguelands"],74.95,77.10)
	self:addLookupList(MobDB,9451,L["Scarlet Archmage"],BZONE["Eastern Plaguelands"],80.87,76.58)
	-- Grizzly Hills
	self:addLookupList(MobDB,26270,L["Iron Rune-Shaper"],BZONE["Grizzly Hills"],67.79,15.46)
	self:addLookupList(MobDB,27333,L["Onslaught Mason"],BZONE["Grizzly Hills"],6.38,20.86)
	self:addLookupList(MobDB,28379,L["Shattertusk Mammoth"],BZONE["Grizzly Hills"],11.95,14.3)
	self:addLookupList(MobDB,28851,L["Enraged Mammoth"],BZONE["Grizzly Hills"],11.82,14.19)
	self:addLookupList(MobDB,26679,L["Silverbrook Trapper"],BZONE["Grizzly Hills"],27.3,33.9)
	self:addLookupList(MobDB,26708,L["Silverbrook Villager"],BZONE["Grizzly Hills"],27.3,33.9)
	self:addLookupList(MobDB,27546,L["Silverbrook Hunter"],BZONE["Grizzly Hills"],37.5,68.0)
	self:addLookupList(MobDB,27676,L["Silverbrook Defender"],BZONE["Grizzly Hills"],24.6,33.3)
	-- Hellfire Peninsula
	self:addLookupList(MobDB,22323,L["Incandescent Fel Spark"],BZONE["Hellfire Peninsula"],61.48,20.11)
	-- Icecrown
	self:addLookupList(MobDB,29570,L["Nascent Val'kyr"],BZONE["Icecrown"],69.72,41.51)
	self:addLookupList(MobDB,30921,L["Skeletal Runesmith"],BZONE["Icecrown"],58.75,73.98)
	self:addLookupList(MobDB,31702,L["Frostbrood Spawn"],BZONE["Icecrown"],72.42,41.50)
	self:addLookupList(MobDB,32289,L["Damned Apothecary"],BZONE["Icecrown"],49.08,34.08)
	self:addLookupList(MobDB,32290,L["Cult Alchemist"],BZONE["Icecrown"],48.90,34.14)
	self:addLookupList(MobDB,32349,L["Cultist Shard Watcher"],BZONE["Icecrown"],48.06,67.83)
	-- Isle of Quel'Danas
	self:addLookupList(MobDB,24960,L["Wretched Devourer"],BZONE["Isle of Quel'Danas"],39.25,35.24)
	self:addLookupList(MobDB,24966,L["Wretched Fiend"],BZONE["Isle of Quel'Danas"],40.24,35.45)
	self:addLookupList(MobDB,24979,L["Dawnblade Marksman"],BZONE["Isle of Quel'Danas"],41.31,39.07)
	self:addLookupList(MobDB,25060,L["Darkspine Myrmidon"],BZONE["Isle of Quel'Danas"],61.68,55.13)
	self:addLookupList(MobDB,25073,L["Darkspine Siren"],BZONE["Isle of Quel'Danas"],61.57,56.10)
	-- Felwood
	self:addLookupList(MobDB,7120,L["Jaedenar Warlock"],BZONE["Felwood"],37.66,53.05)
	self:addLookupList(MobDB,7158,L["Deadwood Shaman"],BZONE["Felwood"],62.72,9.527)
	self:addLookupList(MobDB,7441,L["Winterfall Totemic"],BZONE["Felwood"],45.41,3.633)
	self:addLookupList(MobDB,8957,L["Angerclaw Grizzly"],BZONE["Felwood"],56.73,18.08)
	self:addLookupList(MobDB,8961,L["Felpaw Ravager"],BZONE["Felwood"],57.97,19.05)
	-- Hillsbrad Foothills
	self:addLookupList(MobDB,2248,L["Cave Yeti"],BZONE["Hillsbrad Foothills"],45.86,31.21)
	self:addLookupList(MobDB,2249,L["Ferocious Yeti"],BZONE["Hillsbrad Foothills"],44.35,29.88)
	self:addLookupList(MobDB,2264,L["Hillsbrad Tailor"],BZONE["Hillsbrad Foothills"],36.31,44.23)
	self:addLookupList(MobDB,2374,L["Torn Fin Muckdweller"],BZONE["Hillsbrad Foothills"],28.97,70.18)
	self:addLookupList(MobDB,2375,L["Torn Fin Coastrunner"],BZONE["Hillsbrad Foothills"],30.36,70.82)
	self:addLookupList(MobDB,2376,L["Torn Fin Oracle"],BZONE["Hillsbrad Foothills"],43.83,67.11)
	self:addLookupList(MobDB,2377,L["Torn Fin Tidehunter"],BZONE["Hillsbrad Foothills"],44.22,66.96)
	self:addLookupList(MobDB,2407,L["Hulking Mountain Lion"],BZONE["Hillsbrad Foothills"],39.61,23.08)
	self:addLookupList(MobDB,14276,L["Scargil"],BZONE["Hillsbrad Foothills"],26.79,70.01)
	-- Nagrand
	self:addLookupList(MobDB,17136,L["Boulderfist Warrior"],BZONE["Nagrand"],44.60,42.20)
	self:addLookupList(MobDB,17150,L["Vir'aani Arcanist"],BZONE["Nagrand"],36.63,67.87)
	self:addLookupList(MobDB,18062,L["Enraged Crusher"],BZONE["Nagrand"],50.07,41.26)
	self:addLookupList(MobDB,18064,L["Warmaul Shaman"],BZONE["Nagrand"],46.18,22.58)
	self:addLookupList(MobDB,18202,L["Murkblood Putrifier"],BZONE["Nagrand"],32.68,44.54)
	self:addLookupList(MobDB,18203,L["Murkblood Raider"],BZONE["Nagrand"],32.35,43.26)
	-- Netherstorm
	self:addLookupList(MobDB,18853,L["Sunfury Bloodwarder"],BZONE["Netherstorm"],25.84,67.81)
	self:addLookupList(MobDB,18866,L["Mageslayer"],BZONE["Netherstorm"],56.34,88.03)
	self:addLookupList(MobDB,18870,L["Voidshrieker"],BZONE["Netherstorm"],62.44,39.70)
	self:addLookupList(MobDB,18872,L["Disembodied Vindicator"],BZONE["Netherstorm"],33.26,54.40)
	self:addLookupList(MobDB,18873,L["Disembodied Protector"],BZONE["Netherstorm"],33.19,54.82)
	self:addLookupList(MobDB,22822,L["Ethereum Nullifier"],BZONE["Netherstorm"],63.13,41.34)
	self:addLookupList(MobDB,19707,L["Sunfury Archer"],BZONE["Netherstorm"],55.99,79.34)
	self:addLookupList(MobDB,20134,L["Sunfury Arcanist"],BZONE["Netherstorm"],48.82,82.43)
	self:addLookupList(MobDB,20135,L["Sunfury Arch Mage"],BZONE["Netherstorm"],49.30,83.26)
	self:addLookupList(MobDB,20136,L["Sunfury Researcher"],BZONE["Netherstorm"],51.06,83.49)
	self:addLookupList(MobDB,20207,L["Sunfury Bowman"],BZONE["Netherstorm"],58.61,65.00)
	self:addLookupList(MobDB,20410,L["Rhonsus"],BZONE["Netherstorm"],61.18,85.38)
	-- Searing Gorge
	self:addLookupList(MobDB,5843,L["Slave Worker"],BZONE["Searing Gorge"],40.97,43.80)
	self:addLookupList(MobDB,5844,L["Dark Iron Slaver"],BZONE["Searing Gorge"],42.39,41.82)
	self:addLookupList(MobDB,5846,L["Dark Iron Taskmaster"],BZONE["Searing Gorge"],42.11,39.87)
	self:addLookupList(MobDB,5853,L["Tempered War Golem"],BZONE["Searing Gorge"],64.38,55.70)
	self:addLookupList(MobDB,5860,L["Twilight Dark Shaman"],BZONE["Searing Gorge"],23.22,36.82)
	self:addLookupList(MobDB,5861,L["Twilight Fire Guard"],BZONE["Searing Gorge"],23.41,34.50)
	self:addLookupList(MobDB,5862,L["Twilight Geomancer"],BZONE["Searing Gorge"],24.44,29.17)
	self:addLookupList(MobDB,8637,L["Dark Iron Watchman"],BZONE["Searing Gorge"],64.45,55.91)
	self:addLookupList(MobDB,9318,L["Incendosaur"],BZONE["Searing Gorge"],48.76,27.80)
	self:addLookupList(MobDB,24819,L["Anvilrage Enforcer"],BZONE["Searing Gorge"],16.65,51.04)
	self:addLookupList(MobDB,9026,BBOSS["Overmaster Pyron"],BZONE["Searing Gorge"],22.20,56.39)
	-- Shadowmoon Valley
	self:addLookupList(MobDB,19740,L["Wrathwalker"],BZONE["Shadowmoon Valley"],24.26,34.55)
	self:addLookupList(MobDB,19754,L["Deathforge Tinkerer"],BZONE["Shadowmoon Valley"],38.10,41.07)
	self:addLookupList(MobDB,19755,L["Mo'arg Weaponsmith"],BZONE["Shadowmoon Valley"],23.97,33.58)
	self:addLookupList(MobDB,19756,L["Deathforge Smith"],BZONE["Shadowmoon Valley"],37.44,41.91)
	self:addLookupList(MobDB,19768,L["Coilskar Siren"],BZONE["Shadowmoon Valley"],46.42,29.39)
	self:addLookupList(MobDB,19792,L["Eclipsion Centurion"],BZONE["Shadowmoon Valley"],47.73,65.95)
	self:addLookupList(MobDB,19795,L["Eclipsion Blood Knight"],BZONE["Shadowmoon Valley"],51.98,61.27)
	self:addLookupList(MobDB,19796,L["Eclipsion Archmage"],BZONE["Shadowmoon Valley"],47.56,66.23)
	self:addLookupList(MobDB,19802,L["Illidari Shocktrooper"],BZONE["Shadowmoon Valley"],31.59,50.15)
	self:addLookupList(MobDB,19806,L["Eclipsion Bloodwarder"],BZONE["Shadowmoon Valley"],47.68,65.21)
	self:addLookupList(MobDB,19826,L["Dark Conclave Shadowmancer"],BZONE["Shadowmoon Valley"],37.37,31.76)
	self:addLookupList(MobDB,20502,L["Eclipsion Dragonhawk"],BZONE["Shadowmoon Valley"],48.11,64.68)
	self:addLookupList(MobDB,20878,L["Deathforge Guardian"],BZONE["Shadowmoon Valley"],39.19,39.15)
	self:addLookupList(MobDB,20887,L["Deathforge Imp"],BZONE["Shadowmoon Valley"],39.12,38.91)
	self:addLookupList(MobDB,21050,L["Enraged Earth Spirit"],BZONE["Shadowmoon Valley"],45.00,45.00)
	self:addLookupList(MobDB,21059,L["Enraged Water Spirit"],BZONE["Shadowmoon Valley"],49.00,24.00)
	self:addLookupList(MobDB,21060,L["Enraged Air Spirit"],BZONE["Shadowmoon Valley"],61.00,61.00)
	self:addLookupList(MobDB,21061,L["Enraged Fire Spirit"],BZONE["Shadowmoon Valley"],48.00,43.00)
	self:addLookupList(MobDB,21302,L["Shadow Council Warlock"],BZONE["Shadowmoon Valley"],23.48,39.40)
	self:addLookupList(MobDB,21305,L["Mutant Horror"],BZONE["Shadowmoon Valley"],26.42,40.16)
	self:addLookupList(MobDB,21314,L["Terrormaster"],BZONE["Shadowmoon Valley"],23.95,37.67)
	self:addLookupList(MobDB,21454,L["Ashtongue Warrior"],BZONE["Shadowmoon Valley"],58.52,35.67)
	self:addLookupList(MobDB,22016,L["Eclipsion Soldier"],BZONE["Shadowmoon Valley"],52.41,62.55)
	self:addLookupList(MobDB,22017,L["Eclipsion Spellbinder"],BZONE["Shadowmoon Valley"],52.50,62.47)
	self:addLookupList(MobDB,22018,L["Eclipsion Cavalier"],BZONE["Shadowmoon Valley"],52.51,64.64)
	self:addLookupList(MobDB,22076,L["Torloth the Magnificent"],BZONE["Shadowmoon Valley"],51.94,73.90)
	self:addLookupList(MobDB,22093,L["Illidari Watcher"],BZONE["Shadowmoon Valley"],52.70,72.06)
	self:addLookupList(MobDB,23305,L["Crazed Murkblood Foreman"],BZONE["Shadowmoon Valley"],73.57,88.92)
	-- Sholazar Basin
	self:addLookupList(MobDB,28123,L["Venture Co. Excavator"],BZONE["Sholazar Basin"],34.83,47.51)
	self:addLookupList(MobDB,28378,L["Primordial Drake"],BZONE["Sholazar Basin"],46.71,26.72)
	self:addLookupList(MobDB,28380,L["Shattertusk Bull"],BZONE["Sholazar Basin"],53.00,30.19)
	-- Silithus
	self:addLookupList(MobDB,14454,BBOSS["The Windreaver"],BZONE["Silithus"],26.37,22.23)
	-- Silverpine Forest
	self:addLookupList(MobDB,3530,L["Pyrewood Tailor"],BZONE["Silverpine Forest"],47.02,72.55)
	self:addLookupList(MobDB,3531,L["Moonrage Tailor"],BZONE["Silverpine Forest"],47.04,72.62)
	self:addLookupList(MobDB,6929,L["Innkeeper Gryshka"],BZONE["Silverpine Forest"],58.04,45.21)
	self:addLookupList(MobDB,8996,L["Voidwalker Minion"],BZONE["Silverpine Forest"],62.77,64.62)
	-- Stonetalon Mountains
	self:addLookupList(MobDB,4028,L["Charred Ancient"],BZONE["Stonetalon Mountains"],33.99,66.75)
	self:addLookupList(MobDB,4029,L["Blackened Ancient"],BZONE["Stonetalon Mountains"],33.99,66.71)
	self:addLookupList(MobDB,4030,L["Vengeful Ancient"],BZONE["Stonetalon Mountains"],33.99,66.71)
	-- Stranglethorn Vale
	self:addLookupList(MobDB,674,L["Venture Co. Strip Miner"],BZONE["Stranglethorn Vale"],41.49,43.36)
	self:addLookupList(MobDB,690,L["Cold Eye Basilisk"],BZONE["Stranglethorn Vale"],34.66,40.57)
	self:addLookupList(MobDB,780,L["Skullsplitter Mystic"],BZONE["Stranglethorn Vale"],44.60,35.98)
	self:addLookupList(MobDB,938,L["Kurzen Commando"],BZONE["Stranglethorn Vale"],46.65,7.984)
	self:addLookupList(MobDB,1085,L["Elder Stranglethorn Tiger"],BZONE["Stranglethorn Vale"],33.12,18.18)
	self:addLookupList(MobDB,1488,L["Zanzil Zombie"],BZONE["Stranglethorn Vale"],37.99,55.96)
	self:addLookupList(MobDB,1557,L["Elder Mistvale Gorilla"],BZONE["Stranglethorn Vale"],33.08,65.16)
	self:addLookupList(MobDB,1561,L["Bloodsail Raider"],BZONE["Stranglethorn Vale"],29.85,71.07)
	-- Swamp of Sorrows
	self:addLookupList(MobDB,764,L["Swampwalker"],BZONE["Swamp of Sorrows"],26.89,38.31)
	self:addLookupList(MobDB,765,L["Swampwalker Elder"],BZONE["Swamp of Sorrows"],11.68,34.63)
	self:addLookupList(MobDB,766,L["Tangled Horror"],BZONE["Swamp of Sorrows"],44.93,42.34)
	self:addLookupList(MobDB,1081,L["Mire Lord"],BZONE["Swamp of Sorrows"],7.495,32.08)
	self:addLookupList(MobDB,14448,L["Molt Thorn"],BZONE["Swamp of Sorrows"],54.72,40.91)
	-- Tanaris
	self:addLookupList(MobDB,5420,L["Glasshide Gazer"],BZONE["Tanaris"],51.19,51.26)
	self:addLookupList(MobDB,5422,L["Scorpid Hunter"],BZONE["Tanaris"],54.78,30.07)
	self:addLookupList(MobDB,5426,L["Blisterpaw Hyena"],BZONE["Tanaris"],52.17,46.18)
	self:addLookupList(MobDB,5615,L["Wastewander Rogue"],BZONE["Tanaris"],61.19,37.25)
	self:addLookupList(MobDB,5616,L["Wastewander Thief"],BZONE["Tanaris"],63.09,30.09)
	self:addLookupList(MobDB,5617,L["Wastewander Shadow Mage"],BZONE["Tanaris"],61.17,37.28)
	self:addLookupList(MobDB,5618,L["Wastewander Bandit"],BZONE["Tanaris"],63.09,30.18)
	self:addLookupList(MobDB,5623,L["Wastewander Assassin"],BZONE["Tanaris"],61.22,37.22)
	self:addLookupList(MobDB,7805,L["Wastewander Scofflaw"],BZONE["Tanaris"],66.10,35.01)
	self:addLookupList(MobDB,7855,L["Southsea Pirate"],BZONE["Tanaris"],72.90,45.09)
	self:addLookupList(MobDB,7883,L["Andre Firebeard"],BZONE["Tanaris"],74.17,46.33)
	-- Terokkar Forest
	self:addLookupList(MobDB,16772,L["Bonechewer Devastator"],BZONE["Terokkar Forest"],66.68,53.89)
	self:addLookupList(MobDB,16810,L["Bonechewer Backbreaker"],BZONE["Terokkar Forest"],66.34,53.69)
	self:addLookupList(MobDB,18595,L["Warped Peon"],BZONE["Terokkar Forest"],66.50,51.50)
	self:addLookupList(MobDB,21911,L["Skettis Soulcaller"],BZONE["Terokkar Forest"],68.03,79.70)
	self:addLookupList(MobDB,22148,L["Gordunni Head-Splitter"],BZONE["Terokkar Forest"],76.73,37.85)
	self:addLookupList(MobDB,23022,L["Gordunni Soulreaper"],BZONE["Terokkar Forest"],76.20,37.03)
	self:addLookupList(MobDB,22143,L["Gordunni Back-Breaker"],BZONE["Terokkar Forest"],77.74,93.88)
	self:addLookupList(MobDB,22144,L["Gordunni Elementalist"],BZONE["Terokkar Forest"],73.35,90.95)
	-- The Barrens
	self:addLookupList(MobDB,3256,L["Sunscale Scytheclaw"],BZONE["The Barrens"],54.32,38.73)
	self:addLookupList(MobDB,3385,L["Theramore Marine"],BZONE["The Barrens"],61.89,54.10)
	self:addLookupList(MobDB,3386,L["Theramore Preserver"],BZONE["The Barrens"],61.82,55.09)
	-- The Hinterlands
	self:addLookupList(MobDB,2644,L["Vilebranch Hideskinner"],BZONE["The Hinterlands"],63.50,73.57)
	self:addLookupList(MobDB,2681,L["Vilebranch Raiding Wolf"],BZONE["The Hinterlands"],59.73,75.54)
	self:addLookupList(MobDB,2926,L["Silvermane Stalker"],BZONE["The Hinterlands"],63.76,54.50)
	-- The Storm Peaks
	self:addLookupList(MobDB,29370,L["Stormforged Champion"],BZONE["The Storm Peaks"],25.04,46.68)
	self:addLookupList(MobDB,29376,L["Stormforged Artificer"],BZONE["The Storm Peaks"],30.18,46.52)
	self:addLookupList(MobDB,29402,L["Ironwool Mammoth"],BZONE["The Storm Peaks"],37.32,83.83)
	self:addLookupList(MobDB,29590,L["Blighted Proto-Drake"],BZONE["The Storm Peaks"],23.39,58.54)
	self:addLookupList(MobDB,29792,L["Frostfeather Screecher"],BZONE["The Storm Peaks"],30.95,69.33)
	self:addLookupList(MobDB,29793,L["Frostfeather Witch"],BZONE["The Storm Peaks"],30.78,68.69)
	self:addLookupList(MobDB,29875,L["Icemane Yeti"],BZONE["The Storm Peaks"],47.24,75.41)
	self:addLookupList(MobDB,30160,L["Brittle Revenant"],BZONE["The Storm Peaks"],70.22,59.71)
	self:addLookupList(MobDB,30208,L["Stormforged Ambusher"],BZONE["The Storm Peaks"],70.09,59.89)
	self:addLookupList(MobDB,30222,L["Stormforged Infiltrator"],BZONE["The Storm Peaks"],57.23,63.90)
	self:addLookupList(MobDB,30260,L["Stoic Mammoth"],BZONE["The Storm Peaks"],57.29,63.15)
	self:addLookupList(MobDB,30448,L["Plains Mammoth"],BZONE["The Storm Peaks"],64.58,45.09)
	-- Thousand Needles
	self:addLookupList(MobDB,4117,L["Cloud Serpent"],BZONE["Thousand Needles"],43.01,48.87)
	self:addLookupList(MobDB,4143,L["Sparkleshell Snapper"],BZONE["Thousand Needles"],81.21,64.66)
	self:addLookupList(MobDB,4147,L["Saltstone Basilisk"],BZONE["Thousand Needles"],75.12,61.01)
	self:addLookupList(MobDB,10760,L["Grimtotem Geomancer"],BZONE["Thousand Needles"],35.40,32.18)
	self:addLookupList(MobDB,10882,L["Arikara"],BZONE["Thousand Needles"],38.52,34.94)
	-- Tirisfal Glades
	self:addLookupList(MobDB,1783,L["Skeletal Flayer"],BZONE["Tirisfal Glades"],54.63,46.18)
	self:addLookupList(MobDB,1791,L["Slavering Ghoul"],BZONE["Tirisfal Glades"],56.06,47.00)
	-- Un'Goro Crater
	self:addLookupList(MobDB,5419,L["Glasshide Basilisk"],BZONE["Un'Goro Crater"],83.68,43.94)
	self:addLookupList(MobDB,5423,L["Scorpid Tail Lasher"],BZONE["Un'Goro Crater"],83.33,39.45)
	self:addLookupList(MobDB,5425,L["Starving Blisterpaw"],BZONE["Un'Goro Crater"],83.10,42.94)
	self:addLookupList(MobDB,5460,L["Centipaar Sandreaver"],BZONE["Un'Goro Crater"],64.77,57.47)
	self:addLookupList(MobDB,6513,L["Un'Goro Stomper"],BZONE["Un'Goro Crater"],64.81,16.91)
	self:addLookupList(MobDB,6518,L["Tar Lurker"],BZONE["Un'Goro Crater"],47.90,20.22)
	self:addLookupList(MobDB,6553,L["Gorishi Reaver"],BZONE["Un'Goro Crater"],49.09,81.59)
	self:addLookupList(MobDB,6556,L["Muculent Ooze"],BZONE["Un'Goro Crater"],68.39,34.32)
	self:addLookupList(MobDB,6557,L["Primal Ooze"],BZONE["Un'Goro Crater"],53.29,49.52)
	self:addLookupList(MobDB,6559,L["Glutinous Ooze"],BZONE["Un'Goro Crater"],35.63,48.57)
	self:addLookupList(MobDB,9162,L["Young Diemetradon"],BZONE["Un'Goro Crater"],67.51,33.35)
	self:addLookupList(MobDB,9163,L["Diemetradon"],BZONE["Un'Goro Crater"],53.17,50.54)
	self:addLookupList(MobDB,9164,L["Elder Diemetradon"],BZONE["Un'Goro Crater"],36.12,49.13)
	self:addLookupList(MobDB,9166,L["Pterrordax"],BZONE["Un'Goro Crater"],54.17,47.78)
	self:addLookupList(MobDB,9167,L["Frenzied Pterrordax"],BZONE["Un'Goro Crater"],34.37,43.61)
	self:addLookupList(MobDB,9477,L["Cloned Ooze"],BZONE["Un'Goro Crater"],53.54,48.87)
	-- Western Plaguelands
	self:addLookupList(MobDB,1812,L["Rotting Behemoth"],BZONE["Western Plaguelands"],63.53,36.77)
	self:addLookupList(MobDB,1813,L["Decaying Horror"],BZONE["Western Plaguelands"],62.88,35.28)
	self:addLookupList(MobDB,1836,L["Scarlet Cavalier"],BZONE["Western Plaguelands"],42.67,15.26)
	self:addLookupList(MobDB,1844,L["Foreman Marcrid"],BZONE["Western Plaguelands"],46.43,33.86)
	self:addLookupList(MobDB,1885,L["Scarlet Smith"],BZONE["Western Plaguelands"],45.42,13.25)
	self:addLookupList(MobDB,4494,L["Scarlet Spellbinder"],BZONE["Western Plaguelands"],54.87,27.42)
	-- Westfall
	self:addLookupList(MobDB,157,L["Goretusk"],BZONE["Westfall"],48.31,55.37)
	self:addLookupList(MobDB,450,L["Defias Renegade Mage"],BZONE["Westfall"],44.95,80.27)
	self:addLookupList(MobDB,547,L["Great Goretusk"],BZONE["Westfall"],58.45,61.66)
	self:addLookupList(MobDB,590,L["Defias Looter"],BZONE["Westfall"],42.61,65.42)
	-- Wetlands
	self:addLookupList(MobDB,1051,L["Dark Iron Dwarf"],BZONE["Wetlands"],52.47,20.12)
	self:addLookupList(MobDB,1052,L["Dark Iron Saboteur"],BZONE["Wetlands"],53.49,20.55)
	self:addLookupList(MobDB,1053,L["Dark Iron Tunneler"],BZONE["Wetlands"],51.97,20.13)
	self:addLookupList(MobDB,1054,L["Dark Iron Demolitionist"],BZONE["Wetlands"],56.70,24.13)
	self:addLookupList(MobDB,1160,L["Captain Halyndor"],BZONE["Wetlands"],15.10,24.33)
	self:addLookupList(MobDB,1364,L["Balgaras the Foul"],BZONE["Wetlands"],62.12,29.09)
	-- Winterspring
	self:addLookupList(MobDB,7428,L["Frostmaul Giant"],BZONE["Winterspring"],61.98,68.84)
	self:addLookupList(MobDB,7435,L["Cobalt Wyrmkin"],BZONE["Winterspring"],57.85,51.64)
	self:addLookupList(MobDB,7436,L["Cobalt Scalebane"],BZONE["Winterspring"],57.85,51.86)
	self:addLookupList(MobDB,7437,L["Cobalt Mageweaver"],BZONE["Winterspring"],57.86,51.84)
	self:addLookupList(MobDB,7438,L["Winterfall Ursa"],BZONE["Winterspring"],67.01,38.36)
	self:addLookupList(MobDB,7440,L["Winterfall Den Watcher"],BZONE["Winterspring"],52.21,38.47)
	self:addLookupList(MobDB,7443,L["Shardtooth Mauler"],BZONE["Winterspring"],60.76,34.55)
	self:addLookupList(MobDB,7444,L["Shardtooth Bear"],BZONE["Winterspring"],42.20,38.81)
	self:addLookupList(MobDB,7445,L["Elder Shardtooth"],BZONE["Winterspring"],59.53,25.72)
	self:addLookupList(MobDB,7446,L["Rabid Shardtooth"],BZONE["Winterspring"],61.60,72.23)
	self:addLookupList(MobDB,7447,L["Fledgling Chillwind"],BZONE["Winterspring"],42.06,39.42)
	self:addLookupList(MobDB,7448,L["Chillwind Chimaera"],BZONE["Winterspring"],62.69,38.57)
	self:addLookupList(MobDB,7449,L["Chillwind Ravager"],BZONE["Winterspring"],59.36,26.62)
	self:addLookupList(MobDB,7457,L["Rogue Ice Thistle"],BZONE["Winterspring"],42.39,38.86)
	self:addLookupList(MobDB,7458,L["Ice Thistle Yeti"],BZONE["Winterspring"],65.21,40.69)
	self:addLookupList(MobDB,7459,L["Ice Thistle Matriarch"],BZONE["Winterspring"],68.38,41.98)
	self:addLookupList(MobDB,7460,L["Ice Thistle Patriarch"],BZONE["Winterspring"],68.29,41.79)
	self:addLookupList(MobDB,7524,L["Anguished Highborne"],BZONE["Winterspring"],53.45,42.93)
	self:addLookupList(MobDB,10659,L["Cobalt Whelp"],BZONE["Winterspring"],57.69,51.77)
	self:addLookupList(MobDB,10660,L["Cobalt Broodling"],BZONE["Winterspring"],57.84,51.89)
	self:addLookupList(MobDB,10661,L["Spell Eater"],BZONE["Winterspring"],57.64,51.73)
	self:addLookupList(MobDB,10662,L["Spellmaw"],BZONE["Winterspring"],59.23,51.09)
	self:addLookupList(MobDB,10663,L["Manaclaw"],BZONE["Winterspring"],54.21,55.16)
	self:addLookupList(MobDB,10806,L["Ursius"],BZONE["Winterspring"],60.73,31.98)
	self:addLookupList(MobDB,10807,L["Brumeran"],BZONE["Winterspring"],60.77,56.81)
	self:addLookupList(MobDB,14457,BBOSS["Princess Tempestria"],BZONE["Winterspring"],53.39,42.63)
	-- Zangarmarsh
	-- Zul'drak
	self:addLookupList(MobDB,29235,L["Gundrak Savage"],BZONE["Zul'Drak"],73.80,30.92)
-- Instances
	-- Ahn'kahet
	self:addLookupList(MobDB,29311,BBOSS["Herald Volazj"],BZONE["Ahn'kahet: The Old Kingdom"],0,0)
	self:addLookupList(MobDB,30414,L["Forgotten One"],BZONE["Ahn'kahet: The Old Kingdom"],0,0)
	-- Alterac Valley
	self:addLookupList(MobDB,13152,L["Commander Malgor"],BZONE["Alterac Valley"],49.44,74.92)
	self:addLookupList(MobDB,13153,L["Commander Mulfort"],BZONE["Alterac Valley"],48.53,86.20)
	self:addLookupList(MobDB,13300,L["Lieutenant Mancuso"],BZONE["Alterac Valley"],51.06,39.02)
	-- Auchenai Crypts
	self:addLookupList(MobDB,18497,L["Auchenai Monk"],BZONE["Auchenai Crypts"],0,0)
	self:addLookupList(MobDB,18521,L["Raging Skeleton"],BZONE["Auchenai Crypts"],0,0)
	-- Azjol-Nerub
	self:addLookupList(MobDB,29120,BBOSS["Anub'arak"],BZONE["Azjol-Nerub"],0,0)
	-- Black Temple
	self:addLookupList(MobDB,22879,L["Shadowmoon Reaver"],BZONE["Black Temple"],0,0)
	self:addLookupList(MobDB,22875,L["Coilskar Sea-Caller"],BZONE["Black Temple"],0,0)
	self:addLookupList(MobDB,23330,L["Dragonmaw Wind Reaver"],BZONE["Black Temple"],0,0)
	-- Blackrock Depths
	self:addLookupList(MobDB,8896,L["Shadowforge Peasant"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8897,L["Doomforge Craftsman"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8898,L["Anvilrage Marshal"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8899,L["Doomforge Dragoon"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8903,L["Anvilrage Captain"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8907,L["Wrath Hammer Construct"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8913,L["Twilight Emissary"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8920,L["Weapon Technician"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8921,L["Bloodhound"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8926,L["Deep Stinger"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8927,L["Dark Screecher"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8928,L["Burrowing Thundersnout"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9554,L["Hammered Patron"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,10043,L["Ribbly's Crony"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8983,BBOSS["Golem Lord Argelmach"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9024,BBOSS["Pyromancer Loregrain"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9028,BBOSS["Grizzle"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9499,BBOSS["Plugger Spazzring"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9543,BBOSS["Ribbly Screwspigot"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9025,BBOSS["Lord Roccor"],BZONE["Blackrock Depths"],0,0)
	-- Blackrock Spire
	self:addLookupList(MobDB,9216,L["Spirestone Warlord"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9259,L["Firebrand Grunt"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9260,L["Firebrand Legionnaire"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9262,L["Firebrand Invoker"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9264,L["Firebrand Pyromancer"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9692,L["Bloodaxe Raider"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10317,L["Blackhand Elite"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10366,L["Rage Talon Dragon Guard"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9568,BBOSS["Overlord Wyrmthalak"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9596,BBOSS["Bannok Grimaxe"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9736,BBOSS["Quartermaster Zigris"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10264,BBOSS["Solakar Flamewreath"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10339,BBOSS["Gyth"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10363,BBOSS["General Drakkisath"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10899,BBOSS["Goraluk Anvilcrack"],BZONE["Blackrock Spire"],0,0)
	--Blackwing Lair
	self:addLookupList(MobDB,14401,L["Master Elemental Shaper Krixix"],BZONE["Blackwing Lair"],0,0)
	-- Dire Maul
	self:addLookupList(MobDB,11459,L["Ironbark Protector"],BZONE["Dire Maul"],0,0)
	self:addLookupList(MobDB,11487,BBOSS["Magister Kalendris"],BZONE["Dire Maul"],0,0)
	self:addLookupList(MobDB,14354,BBOSS["Pusillin"],BZONE["Dire Maul"],0,0)
	-- Drak'Tharon Keep
	self:addLookupList(MobDB,26632,BBOSS["The Prophet Tharon'ja"],BZONE["Drak'Tharon Keep"],0,0)
	-- Gnomeregan
	self:addLookupList(MobDB,7800,BBOSS["Mekgineer Thermaplugg"],BZONE["Gnomeregan"],0,0)
	-- Halls of Lightning
	self:addLookupList(MobDB,28920,L["Stormforged Giant"],BZONE["Halls of Lightning"],0,0)
	self:addLookupList(MobDB,28923,BBOSS["Loken"],BZONE["Halls of Lightning"],0,0)
	-- Halls of Stone
	self:addLookupList(MobDB,27977,BBOSS["Krystallus"],BZONE["Halls of Stone"],0,0)
	self:addLookupList(MobDB,27978,BBOSS["Sjonnir The Ironshaper"],BZONE["Halls of Stone"],0,0)
	-- Hellfire Ramparts
	self:addLookupList(MobDB,17269,L["Bleeding Hollow Darkcaster"],BZONE["Hellfire Ramparts"],0,0)
	-- Hyjal Summit
	self:addLookupList(MobDB,17767,BBOSS["Rage Winterchill"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17808,BBOSS["Anetheron"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17842,BBOSS["Azgalor"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17888,BBOSS["Kaz'rogal"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17895,L["Ghoul"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17897,L["Crypt Fiend"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17898,L["Abomination"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17899,L["Shadowy Necromancer"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17905,L["Banshee"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17906,L["Gargoyle"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17907,L["Frost Wyrm"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17908,L["Giant Infernal"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17916,L["Fel Stalker"],BZONE["Hyjal Summit"],0,0)
	self:addLookupList(MobDB,17968,BBOSS["Archimonde"],BZONE["Hyjal Summit"],0,0)
	-- Karazhan
	self:addLookupList(MobDB,16544,L["Ethereal Thief"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15547,L["Spectral Charger"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15548,L["Spectral Stallion"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15551,L["Spectral Stable Hand"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16389,L["Spectral Apprentice"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16406,L["Phantom Attendant"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16407,L["Spectral Servant"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16408,L["Phantom Valet"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16409,L["Phantom Guest"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16411,L["Spectral Chef"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16414,L["Ghostly Steward"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16425,L["Phantom Guardsman"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16472,L["Phantom Stagehand"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16488,L["Arcane Anomaly"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16492,L["Syphoner"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16504,L["Arcane Protector"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16525,L["Spell Shade"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16526,L["Sorcerous Shade"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16529,L["Magical Horror"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16530,L["Mana Warp"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16539,L["Homunculus"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16540,L["Shadow Pillager"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16595,L["Fleshbeast"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16596,L["Greater Fleshbeast"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15687,BBOSS["Moroes"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15688,BBOSS["Terestian Illhoof"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16151,BBOSS["Midnight"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16152,BBOSS["Attumen the Huntsman"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16524,BBOSS["Shade of Aran"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,17225,BBOSS["Nightbane"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,18168,BBOSS["The Crone"],BZONE["Karazhan"],0,0)
	-- Magister's Terrace
	self:addLookupList(MobDB,24560,BBOSS["Priestess Delrissa"],BZONE["Magisters' Terrace"],0,0)
	self:addLookupList(MobDB,24664,BBOSS["Kael'thas Sunstrider"],BZONE["Magisters' Terrace"],0,0)
	self:addLookupList(MobDB,24697,L["Sister of Torment"],BZONE["Magisters' Terrace"],0,0)
	-- Mana-Tombs
	self:addLookupList(MobDB,18317,L["Ethereal Priest"],BZONE["Mana-Tombs"],0,0)
	self:addLookupList(MobDB,24698,L["Ethereum Smuggler"],BZONE["Mana-Tombs"],0,0)
	self:addLookupList(MobDB,18314,L["Nexus Stalker"],BZONE["Mana-Tombs"],0,0)
	self:addLookupList(MobDB,18312,L["Ethereal Spellbinder"],BZONE["Mana-Tombs"],0,0)
	self:addLookupList(MobDB,18344,BBOSS["Nexus-Prince Shaffar"],BZONE["Mana-Tombs"],0,0)
	-- Maraudon
	self:addLookupList(MobDB,13323,L["Subterranean Diemetradon"],BZONE["Maraudon"],0,0)
	-- Oculus
	self:addLookupList(MobDB,27656,BBOSS["Ley-Guardian Eregos"],BZONE["The Oculus"],0,0)
	-- Old Hillsbrad Foothills
	self:addLookupList(MobDB,17840,L["Durnholde Tracking Hound"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,17820,L["Durnholde Rifleman"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,28132,L["Don Carlos"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,22128,L["Durnholde Lookout"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,17819,L["Durnholde Sentry"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,17862,BBOSS["Captain Skarloc"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,18096,BBOSS["Epoch Hunter"],BZONE["Old Hillsbrad Foothills"],0,0)
	-- Onyxia's Lair
	self:addLookupList(MobDB,10184,BBOSS["Onyxia"],BZONE["Onyxia's Lair"],0,0)
	self:addLookupList(MobDB,12129,L["Onyxian Warder"],BZONE["Onyxia's Lair"],0,0)
	-- Razorfen Downs
	self:addLookupList(MobDB,7346,L["Splinterbone Centurion"],BZONE["Razorfen Downs"],0,0)
	-- Ruins of Ahn'Qiraj
	self:addLookupList(MobDB,15340,BBOSS["Moam"],BZONE["Ruins of Ahn'Qiraj"],0,0)
	-- Scarlet Monastery
	self:addLookupList(MobDB,4287,L["Scarlet Gallant"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4292,L["Scarlet Protector"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4295,L["Scarlet Myrmidon"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4296,L["Scarlet Adept"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4298,L["Scarlet Defender"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4301,L["Scarlet Centurion"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4304,L["Scarlet Tracking Hound"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,4540,L["Scarlet Monk"],BZONE["Scarlet Monastery"],0,0)
	self:addLookupList(MobDB,6426,L["Anguished Dead"],BZONE["Scarlet Monastery"],0,0)
	-- Scholomance
	self:addLookupList(MobDB,10469,L["Scholomance Adept"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10477,L["Scholomance Necromancer"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10488,L["Risen Construct"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10491,L["Risen Bonewarder"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10499,L["Spectral Researcher"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,1853,BBOSS["Darkmaster Gandling"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10503,BBOSS["Jandice Barov"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10508,BBOSS["Ras Frostwhisper"],BZONE["Scholomance"],0,0)
	-- Serpentshrine Cavern
	self:addLookupList(MobDB,21301,L["Coilfang Shatterer"],BZONE["Serpentshrine Cavern"],0,0)
	self:addLookupList(MobDB,21339,L["Coilfang Hate-Screamer"],BZONE["Serpentshrine Cavern"],0,0)
	self:addLookupList(MobDB,21298,L["Coilfang Serpentguard"],BZONE["Serpentshrine Cavern"],0,0)
	self:addLookupList(MobDB,21246,L["Serpentshrine Sporebat"],BZONE["Serpentshrine Cavern"],0,0)
	-- Sethekk Halls
	self:addLookupList(MobDB,18320,L["Time-Lost Shadowmage"],BZONE["Sethekk Halls"],0,0)
	self:addLookupList(MobDB,18472,BBOSS["Darkweaver Syth"],BZONE["Sethekk Halls"],0,0)
	self:addLookupList(MobDB,18325,L["Sethekk Prophet"],BZONE["Sethekk Halls"],0,0)
	self:addLookupList(MobDB,19428,L["Cobalt Serpent"],BZONE["Sethekk Halls"],0,0)
	self:addLookupList(MobDB,18322,L["Sethekk Ravenguard"],BZONE["Sethekk Halls"],0,0)
	-- Shadow Labyrinth
	self:addLookupList(MobDB,18708,BBOSS["Murmur"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18830,L["Cabal Fanatic"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18633,L["Cabal Acolyte"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18639,L["Cabal Spellbinder"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18667,BBOSS["Blackheart the Inciter"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18631,L["Cabal Cultist"],BZONE["Shadow Labyrinth"],0,0)
	-- Stratholme
	self:addLookupList(MobDB,10381,L["Ravaged Cadaver"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10398,L["Thuzadin Shadowcaster"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10412,L["Crypt Crawler"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10422,L["Crimson Sorcerer"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10426,L["Crimson Inquisitor"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10812,L["Grand Crusader Dathrohan"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10438,BBOSS["Maleki the Pallid"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10997,BBOSS["Cannon Master Willey"],BZONE["Stratholme"],0,0)
	-- Temple opf Ahn'Qiraj
	self:addLookupList(MobDB,15263,BBOSS["The Prophet Skeram"],BZONE["Temple of Ahn'Qiraj"],0,0)
	self:addLookupList(MobDB,15275,BBOSS["Emperor Vek'nilash"],BZONE["Temple of Ahn'Qiraj"],0,0)
	self:addLookupList(MobDB,15276,BBOSS["Emperor Vek'lor"],BZONE["Temple of Ahn'Qiraj"],0,0)
	-- The Arcatraz
	self:addLookupList(MobDB,20869,L["Arcatraz Sentinel"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20880,L["Eredar Deathbringer"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20898,L["Gargantuan Abyssal"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20900,L["Unchained Doombringer"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20885,BBOSS["Dalliah the Doomsayer"],BZONE["The Arcatraz"],0,0)
	--The Black Morass
	self:addLookupList(MobDB,17952,L["Darkwater Crocolisk"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,21104,L["Rift Keeper"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,21148,L["Rift Keeper"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,21140,L["Rift Lord"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,17839,L["Rift Lord"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,18982,L["Sable Jaguar"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,17879,BBOSS["Chrono Lord Deja"],BZONE["The Black Morass"],0,0)
	-- The Blood Furnace
	self:addLookupList(MobDB,17400,L["Felguard Annihilator"],BZONE["The Blood Furnace"],0,0)
	-- The Botanica
	self:addLookupList(MobDB,19509,L["Sunseeker Harvester"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,17975,BBOSS["High Botanist Freywinn"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,18422,L["Sunseeker Botanist"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,17977,BBOSS["Warp Splinter"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,17978,BBOSS["Thorngrin the Tender"],BZONE["The Botanica"],0,0)
	-- The Deadmines
	self:addLookupList(MobDB,657,L["Defias Pirate"],BZONE["The Deadmines"],0,0)
	self:addLookupList(MobDB,1732,L["Defias Squallshaper"],BZONE["The Deadmines"],0,0)
	-- The Eye
	self:addLookupList(MobDB,20031,L["Bloodwarder Legionnaire"],BZONE["The Eye"],0,0)
	self:addLookupList(MobDB,20032,L["Bloodwarder Vindicator"],BZONE["The Eye"],0,0)
	self:addLookupList(MobDB,20052,L["Crystalcore Mechanic"],BZONE["The Eye"],0,0)
	self:addLookupList(MobDB,20038,L["Phoenix-Hawk Hatchling"],BZONE["The Eye"],0,0)
	self:addLookupList(MobDB,20039,L["Phoenix-Hawk"],BZONE["The Eye"],0,0)
	-- The Mechanar
	self:addLookupList(MobDB,19168,L["Sunseeker Astromage"],BZONE["The Mechanar"],0,0)
	self:addLookupList(MobDB,19219,BBOSS["Mechano-Lord Capacitus"],BZONE["The Mechanar"],0,0)
	self:addLookupList(MobDB,19220,BBOSS["Pathaleon the Calculator"],BZONE["The Mechanar"],0,0)
	self:addLookupList(MobDB,19221,BBOSS["Nethermancer Sepethrea"],BZONE["The Mechanar"],0,0)
	-- The Nexus
	self:addLookupList(MobDB,26723,BBOSS["Keristrasza"],BZONE["The Nexus"],0,0)
	-- The Shattered Halls
	self:addLookupList(MobDB,17083,L["Fel Orc Convert"],BZONE["The Shattered Halls"],0,0)
	self:addLookupList(MobDB,17465,L["Shattered Hand Centurion"],BZONE["The Shattered Halls"],0,0)
	self:addLookupList(MobDB,17669,L["Rabid Warhound"],BZONE["The Shattered Halls"],0,0)
	self:addLookupList(MobDB,17671,L["Shattered Hand Champion"],BZONE["The Shattered Halls"],0,0)
	self:addLookupList(MobDB,16807,BBOSS["Grand Warlock Nethekurse"],BZONE["The Shattered Halls"],0,0)
	-- The Slave Pens
	self:addLookupList(MobDB,17817,L["Greater Bogstrok"],BZONE["The Slave Pens"],0,0)
	self:addLookupList(MobDB,17940,L["Coilfang Technician"],BZONE["The Slave Pens"],0,0)
	self:addLookupList(MobDB,17957,L["Coilfang Champion"],BZONE["The Slave Pens"],0,0)
	self:addLookupList(MobDB,17941,BBOSS["Mennu the Betrayer"],BZONE["The Slave Pens"],0,0)
	-- The Steamvault
	self:addLookupList(MobDB,17722,L["Coilfang Sorceress"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17800,L["Coilfang Myrmidon"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17801,L["Coilfang Siren"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17803,L["Coilfang Oracle"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17796,BBOSS["Mekgineer Steamrigger"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17797,BBOSS["Hydromancer Thespia"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17798,BBOSS["Warlord Kalithresh"],BZONE["The Steamvault"],0,0)
	-- The Temple of Atal'Hakkar
	self:addLookupList(MobDB,5225,L["Murk Spitter"],BZONE["The Temple of Atal'Hakkar"],0,0)
	self:addLookupList(MobDB,5226,L["Murk Worm"],BZONE["The Temple of Atal'Hakkar"],0,0)
	self:addLookupList(MobDB,5256,L["Atal'ai Warrior"],BZONE["The Temple of Atal'Hakkar"],0,0)
	self:addLookupList(MobDB,5259,L["Atal'ai Witch Doctor"],BZONE["The Temple of Atal'Hakkar"],0,0)
	self:addLookupList(MobDB,5267,L["Unliving Atal'ai"],BZONE["The Temple of Atal'Hakkar"],0,0)
	self:addLookupList(MobDB,5271,L["Atal'ai Deathwalker"],BZONE["The Temple of Atal'Hakkar"],0,0)
	self:addLookupList(MobDB,5277,L["Nightmare Scalebane"],BZONE["The Temple of Atal'Hakkar"],0,0)
	-- The Underbog
	self:addLookupList(MobDB,17723,L["Bog Giant"],BZONE["The Underbog"],0,0)
	self:addLookupList(MobDB,17724,L["Underbat"],BZONE["The Underbog"],0,0)
	-- The Violet Hold
	self:addLookupList(MobDB,31134,BBOSS["Cyanigosa"],BZONE["The Violet Hold"],0,0)
	-- Uldaman
	self:addLookupList(MobDB,4852,L["Stonevault Oracle"],BZONE["Uldaman"],0,0)
	self:addLookupList(MobDB,4861,L["Shrike Bat"],BZONE["Uldaman"],0,0)
	self:addLookupList(MobDB,24830,L["Stonevault Pillager"],BZONE["Uldaman"],0,0)
	-- Utgarde Keep
	self:addLookupList(MobDB,23954,BBOSS["Ingvar the Plunderer"],BZONE["Utgarde Keep"],0,0)
	self:addLookupList(MobDB,24083,L["Enslaved Proto-Drake"],BZONE["Utgarde Keep"],0,0)
	self:addLookupList(MobDB,29735,L["Savage Worg"],BZONE["Utgarde Keep"],0,0)
	-- Utgarde Pinnacle
	self:addLookupList(MobDB,26861,BBOSS["King Ymiron"],BZONE["Utgarde Pinnacle"],0,0)
	-- Zul'Aman
	self:addLookupList(MobDB,23597,L["Amani'shi Guardian"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,24179,L["Amani'shi Wind Walker"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,23596,L["Amani'shi Flame Caster"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,24180,L["Amani'shi Protector"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,23580,L["Amani'shi Warbringer"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,23582,L["Amani'shi Tribesman"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,23586,L["Amani'shi Scout"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,24059,L["Amani'shi Beast Tamer"],BZONE["Zul'Aman"],0,0)
	self:addLookupList(MobDB,24065,L["Amani'shi Handler"],BZONE["Zul'Aman"],0,0)
	-- Zul'Farrak
	self:addLookupList(MobDB,5648,L["Sandfury Shadowcaster"],BZONE["Zul'Farrak"],0,0)
	self:addLookupList(MobDB,5649,L["Sandfury Blood Drinker"],BZONE["Zul'Farrak"],0,0)
	self:addLookupList(MobDB,5708,L["Spawn of Hakkar"],BZONE["Zul'Farrak"],0,0)
	self:addLookupList(MobDB,5717,BBOSS["Mijan"],BZONE["Zul'Farrak"],0,0)
	-- Zul'Gurub
	self:addLookupList(MobDB,11361,L["Zulian Tiger"],BZONE["Zul'Gurub"],0,0)

end
