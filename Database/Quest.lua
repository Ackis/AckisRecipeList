--[[
************************************************************************
Quest.lua
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
local FOLDER_NAME, private	= ...

local LibStub = _G.LibStub
local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

-----------------------------------------------------------------------
-- Imports
-----------------------------------------------------------------------
local Z = private.ZONE_NAMES

-----------------------------------------------------------------------
-- Memoizing table for quest names.
-----------------------------------------------------------------------
private.quest_names = _G.setmetatable({}, {
	__index = function(t, id_num)
			  _G.GameTooltip:SetOwner(_G.UIParent, _G.ANCHOR_NONE)
			  _G.GameTooltip:SetHyperlink(("quest:%s"):format(_G.tostring(id_num)))

			  local quest_name = _G["GameTooltipTextLeft1"]:GetText()
			  _G.GameTooltip:Hide()

			  if not quest_name then
				  return _G.UNKNOWN
			  end
			  t[id_num] = quest_name
			  return quest_name
		  end,
})

function addon:InitQuest()
	local function AddQuest(quest_id, zone_name, coord_x, coord_y, faction)
		private.AcquireTypes.Quest:AddEntity(quest_id, nil, zone_name, coord_x, coord_y, faction)
	end

	AddQuest(384,	Z.DUN_MOROGH,			46.8,	52.5,	"Alliance")
	AddQuest(769,	Z.THUNDER_BLUFF,		44.1,	44.6,	"Horde")
	AddQuest(1578,	Z.IRONFORGE,			48.5,	43.0,	"Alliance")
	AddQuest(1582,	Z.DARNASSUS,			60.5,	37.3,	"Alliance")
	AddQuest(1618,	Z.IRONFORGE,			48.5,	43.0,	"Alliance")
	AddQuest(2751,	Z.ORGRIMMAR,			78.0,	21.4,	"Horde")
	AddQuest(2752,	Z.ORGRIMMAR,			78.0,	21.4,	"Horde")
	AddQuest(2753,	Z.ORGRIMMAR,			78.0,	21.4,	"Horde")
	AddQuest(2754,	Z.ORGRIMMAR,			78.0,	21.4,	"Horde")
	AddQuest(2755,	Z.ORGRIMMAR,			78.0,	21.4,	"Horde")
	AddQuest(4083,	Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral")
	AddQuest(6032,	Z.FELWOOD,			65.7,	2.9,	"Neutral")
	AddQuest(6610,	Z.TANARIS,			52.6,	29.0,	"Neutral")
	AddQuest(7493,	Z.ORGRIMMAR,			51.0,	76.5,	"Horde")
	AddQuest(7497,	Z.STORMWIND_CITY,		67.2,	85.5,	"Alliance")
	AddQuest(7604,	Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral")
	AddQuest(8313,	Z.SILITHUS,			43.6,	42.0,	"Neutral")
	AddQuest(8323,	Z.SILITHUS,			67.1,	69.7,	"Neutral")
	AddQuest(9171,	Z.GHOSTLANDS,			48.3,	30.9,	"Horde")
	AddQuest(9356,	Z.HELLFIRE_PENINSULA,		49.2,	74.8,	"Neutral")
	AddQuest(9454,	Z.AZUREMYST_ISLE,		49.8,	51.9,	"Alliance")
	AddQuest(9635,	Z.ZANGARMARSH,			34.0,	50.8,	"Horde")
	AddQuest(9636,	Z.ZANGARMARSH,			68.6,	50.2,	"Alliance")
	AddQuest(10860,	Z.BLADES_EDGE_MOUNTAINS,	76.1,	60.3,	"Horde")
	AddQuest(11377,	Z.SHATTRATH_CITY,		61.6,	16.5,	"Neutral")
	AddQuest(11379,	Z.SHATTRATH_CITY,		61.6,	16.5,	"Neutral")
	AddQuest(11380,	Z.SHATTRATH_CITY,		61.6,	16.5,	"Neutral")
	AddQuest(11381,	Z.SHATTRATH_CITY,		61.6,	16.5,	"Neutral")
	AddQuest(11666,	Z.TEROKKAR_FOREST,		38.7,	12.8,	"Neutral")
	AddQuest(11667,	Z.TEROKKAR_FOREST,		38.7,	12.8,	"Neutral")
	AddQuest(11668,	Z.TEROKKAR_FOREST,		38.7,	12.8,	"Neutral")
	AddQuest(11669,	Z.TEROKKAR_FOREST,		38.7,	12.8,	"Neutral")
	AddQuest(12889,	Z.THE_STORM_PEAKS,		37.7,	46.5,	"Neutral")
	AddQuest(13571,	Z.DALARAN,			0,	0,	"Neutral")
	AddQuest(13087,	Z.HOWLING_FJORD,		58.2,	62.1,	"Alliance")
	AddQuest(13088,	Z.BOREAN_TUNDRA,		57.9,	71.5,	"Alliance")
	AddQuest(13089,	Z.HOWLING_FJORD,		78.7,	29.5,	"Horde")
	AddQuest(13090,	Z.BOREAN_TUNDRA,		42.0,	54.2,	"Horde")
	AddQuest(13100,	Z.DALARAN,			40.5,	65.8,	"Alliance")
	AddQuest(13101,	Z.DALARAN,			40.5,	65.8,	"Alliance")
	AddQuest(13102,	Z.DALARAN,			40.5,	65.8,	"Alliance")
	AddQuest(13103,	Z.DALARAN,			40.5,	65.8,	"Alliance")
	AddQuest(13107,	Z.DALARAN,			40.5,	65.8,	"Alliance")
	AddQuest(13112,	Z.DALARAN,			70.0,	38.6,	"Horde")
	AddQuest(13113,	Z.DALARAN,			70.0,	38.6,	"Horde")
	AddQuest(13114,	Z.DALARAN,			70.0,	38.6,	"Horde")
	AddQuest(13115,	Z.DALARAN,			70.0,	38.6,	"Horde")
	AddQuest(13116,	Z.DALARAN,			70.0,	38.6,	"Horde")
	AddQuest(14151,	Z.DALARAN,			42.5,	32.1,	"Neutral")
	AddQuest(26620,	Z.DUSKWOOD,			73.8,	43.6,	"Alliance")
	AddQuest(26623,	Z.DUSKWOOD,			73.8,	43.6,	"Alliance")
	AddQuest(26860,	Z.LOCH_MODAN,			34.9,	49.1,	"Alliance")
	AddQuest(31539,	Z.THE_JADE_FOREST,		54.8,	45.0,	"Neutral")
	AddQuest(33022, Z.VALLEY_OF_THE_FOUR_WINDS,	53.6,	51.2,	"Neutral")
	AddQuest(33024, Z.VALLEY_OF_THE_FOUR_WINDS,	53.6,	51.2,	"Neutral")
	AddQuest(33027, Z.VALLEY_OF_THE_FOUR_WINDS,	53.6,	51.2,	"Neutral")

	self.InitQuest = nil
end
