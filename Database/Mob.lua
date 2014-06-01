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

	AddMob(23385,	L["Simon Unit"],			Z.BLADES_EDGE_MOUNTAINS,	33.5, 51.5) -- Enchanting, Engineering

	-- Burning Steppes
	AddMob(7037,	L["Thaurissan Firewalker"],		Z.BURNING_STEPPES,		61.1, 42.0)

	-- Deepholm
	AddMob(50061,	L["Xariona"],				Z.DEEPHOLM,			44.6, 39.8)

	-- Dread Wastes
	AddMob(66867,	L["Wild Seahorse"],			Z.DREAD_WASTES,			28.0, 96.8)
	AddMob(66868,	L["Playful Seahorse"],			Z.DREAD_WASTES,			26.4, 95.6)

	-- Dustwallow Marsh
	AddMob(4834,	L["Theramore Infiltrator"],		Z.DUSTWALLOW_MARSH,		44.0, 27.3)

	-- Hillsbrad Foothills
	AddMob(2242,	L["Syndicate Spy"],			Z.HILLSBRAD_FOOTHILLS,		56.0, 24.2)

	-- Mount Hyjal
	AddMob(50056,	BB["Garr"],				Z.MOUNT_HYJAL,			39.6, 80.4)

	-- Netherstorm
	AddMob(18872,	L["Disembodied Vindicator"],		Z.NETHERSTORM,			36.0, 55.5)
	AddMob(20134,	L["Sunfury Arcanist"],			Z.NETHERSTORM,			51.0, 82.5)
	AddMob(20135,	L["Sunfury Arch Mage"],			Z.NETHERSTORM,			46.5, 81.0)

	-- Searing Gorge
	AddMob(5861,	L["Twilight Fire Guard"],		Z.SEARING_GORGE,		25.5, 33.8)
	AddMob(9026,	BB["Overmaster Pyron"],			Z.SEARING_GORGE,		26.2, 74.9)

	-- Shadowmoon Valley
	AddMob(19755,	L["Mo'arg Weaponsmith"],		Z.SHADOWMOON_VALLEY,		25.5, 31.5) -- Alchemy, Engineering
	AddMob(20878,	L["Deathforge Guardian"],		Z.SHADOWMOON_VALLEY,		39.0, 47.0) -- Alchemy, Blacksmithing

	-- Silverpine Forest
	AddMob(3530,	L["Pyrewood Tailor"],			Z.SILVERPINE_FOREST,		45.7, 71.0)
	AddMob(3531,	L["Moonrage Tailor"],			Z.SILVERPINE_FOREST,		45.5, 73.3)

	-- Swamp of Sorrows
	AddMob(14448,	L["Molt Thorn"],			Z.SWAMP_OF_SORROWS,		51.0, 42.6)

	-- Twilight Highlands
	AddMob(50089,	L["Julak-Doom"],			Z.TWILIGHT_HIGHLANDS,		52.6, 7.4)

	-- Uldum
	AddMob(50063,	L["Akma'hat"],				Z.ULDUM,			38.0, 60.2)

	-- Westfall
	AddMob(590,	L["Defias Looter"],			Z.WESTFALL,			37.5, 58.4)

	-------------------------------------------------------------------------------
	-- Instances
	-------------------------------------------------------------------------------
	-- Blackrock Spire
	AddMob(9264,	L["Firebrand Pyromancer"],		Z.BLACKROCK_SPIRE,		0, 0) -- Alchemy, Tailoring
	AddMob(9736,	BN.QUARTERMASTER_ZIGRIS,		Z.BLACKROCK_SPIRE,		0, 0) -- Blacksmithing, Jewelcrafting
	AddMob(10363,	BN.GENERAL_DRAKKISATH,			Z.BLACKROCK_SPIRE,		0, 0) -- Alchemy, Leatherworking

	-- Dire Maul
	AddMob(11487,	BN.MAGISTER_KALENDRIS,			Z.DIRE_MAUL,			59.04, 48.82)

	-- Karazhan
	AddMob(16406,	L["Phantom Attendant"],			Z.KARAZHAN,			0, 0)
	AddMob(16408,	L["Phantom Valet"],			Z.KARAZHAN,			0, 0)

	-- Magister's Terrace
	AddMob(24664,	BN.KAELTHAS_SUNSTRIDER,			Z.MAGISTERS_TERRACE,		0, 0) -- Alchemy, Blacksmithing, Enchanting, Engineering, Jewelcrafting, Leatherworking, Tailoring

	-- Shadow Labyrinth
	AddMob(18708,	BN.MURMUR,				Z.SHADOW_LABYRINTH,		0, 0)

	-- Stratholme
	AddMob(10813,	BN.BALNAZZAR,				Z.STRATHOLME,			0, 0) -- Alchemy, Tailoring

	-- The Arcatraz
	AddMob(20869,	L["Arcatraz Sentinel"],			Z.THE_ARCATRAZ,			0, 0)
	AddMob(20885,	BN.DALLIAH_THE_DOOMSAYER,		Z.THE_ARCATRAZ,			0, 0)

	-- The Botanica
	AddMob(17977,	BN.WARP_SPLINTER,			Z.THE_BOTANICA,			0, 0)
	AddMob(17978,	BN.THORNGRIN_THE_TENDER,		Z.THE_BOTANICA,			0, 0)

	-- The Mechanar
	AddMob(19168,	L["Sunseeker Astromage"],		Z.THE_MECHANAR,			0, 0) -- Alchemy, Blacksmithing
	AddMob(19220,	BN.PATHALEON_THE_CALCULATOR,		Z.THE_MECHANAR,			0, 0)

	-- The Shattered Halls
	AddMob(16807,	BN.GRAND_WARLOCK_NETHEKURSE,		Z.THE_SHATTERED_HALLS,		0, 0)

	-- The Steamvault
	AddMob(17798,	BN.WARLORD_KALITHRESH,			Z.THE_STEAMVAULT,		0, 0)

	self.InitMob = nil
end
