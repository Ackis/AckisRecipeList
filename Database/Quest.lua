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
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

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

function addon:InitQuest(DB)
	local function AddQuest(quest_id, location, coord_x, coord_y, faction)
		private:AddListEntry(DB, quest_id, nil, BZ[location], coord_x, coord_y, faction)
	end

	AddQuest(384,	"Dun Morogh",			46.8,	52.5,	"Alliance")
	AddQuest(769,	"Thunder Bluff",		44.1,	44.6,	"Horde")
	AddQuest(1578,	"Ironforge",			48.5,	43.0,	"Alliance")
	AddQuest(1582,	"Darnassus",			64.3,	21.9,	"Alliance")
	AddQuest(1618,	"Ironforge",			48.5,	43.0,	"Alliance")
	AddQuest(2751,	"Orgrimmar",			78.0,	21.4,	"Horde")
	AddQuest(2752,	"Orgrimmar",			78.0,	21.4,	"Horde")
	AddQuest(2753,	"Orgrimmar",			78.0,	21.4,	"Horde")
	AddQuest(2754,	"Orgrimmar",			78.0,	21.4,	"Horde")
	AddQuest(2755,	"Orgrimmar",			78.0,	21.4,	"Horde")
	AddQuest(4083,	"Blackrock Depths",		0,	0,	"Neutral")
	AddQuest(5518,	"Dire Maul",			0,	0,	"Neutral")
	AddQuest(6032,	"Felwood",			65.7,	2.9,	"Neutral")
	AddQuest(6610,	"Tanaris",			52.6,	29.0,	"Neutral")
	AddQuest(6622,	"Arathi Highlands",		73.4,	36.8,	"Horde")
	AddQuest(6624,	"Dustwallow Marsh",		67.7,	48.9,	"Alliance")
	AddQuest(7493,	"Orgrimmar",			51.0,	76.5,	"Horde")
	AddQuest(7497,	"Stormwind City",		67.2,	85.5,	"Alliance")
	AddQuest(7604,	"Blackrock Depths",		0,	0,	"Neutral")
	AddQuest(8313,	"Silithus",			43.6, 42.0,	"Neutral")
	AddQuest(8323,	"Silithus",			67.1,	69.7,	"Neutral")
	AddQuest(8798,	"Winterspring",			60.9,	37.7,	"Neutral")
	AddQuest(9171,	"Ghostlands",			48.3,	30.9,	"Horde")
	AddQuest(9249,	"Darkmoon Faire",		0,	0,	"Neutral")
	AddQuest(9356,	"Hellfire Peninsula",		49.2,	74.8,	"Neutral")
	AddQuest(9454,	"Azuremyst Isle",		49.8,	51.9,	"Alliance")
	AddQuest(9635,	"Zangarmarsh",			33.7,	50.2,	"Horde")
	AddQuest(9636,	"Zangarmarsh",			68.6,	50.2,	"Alliance")
	AddQuest(10860,	"Blade's Edge Mountains",	76.1,	60.3,	"Horde")
	AddQuest(11377,	"Shattrath City",		61.6,	16.5,	"Neutral")
	AddQuest(11379,	"Shattrath City",		61.6,	16.5,	"Neutral")
	AddQuest(11380,	"Shattrath City",		61.6,	16.5,	"Neutral")
	AddQuest(11381,	"Shattrath City",		61.6,	16.5,	"Neutral")
	AddQuest(11666,	"Terokkar Forest",		38.7,	12.8,	"Neutral")
	AddQuest(11667,	"Terokkar Forest",		38.7,	12.8,	"Neutral")
	AddQuest(11668,	"Terokkar Forest",		38.7,	12.8,	"Neutral")
	AddQuest(11669,	"Terokkar Forest",		38.7,	12.8,	"Neutral")
	AddQuest(12889,	"The Storm Peaks",		37.7,	46.5,	"Neutral")
	AddQuest(13571,	"Dalaran",			0,	0,	"Neutral")
	AddQuest(13087,	"Howling Fjord",		58.2,	62.1,	"Alliance")
	AddQuest(13088,	"Borean Tundra",		57.9,	71.5,	"Alliance")
	AddQuest(13089,	"Howling Fjord",		78.7,	29.5,	"Horde")
	AddQuest(13090,	"Borean Tundra",		42.0,	54.2,	"Horde")
	AddQuest(13100,	"Dalaran",			40.5,	65.8,	"Alliance")
	AddQuest(13101,	"Dalaran",			40.5,	65.8,	"Alliance")
	AddQuest(13102,	"Dalaran",			40.5,	65.8,	"Alliance")
	AddQuest(13103,	"Dalaran",			40.5,	65.8,	"Alliance")
	AddQuest(13107,	"Dalaran",			40.5,	65.8,	"Alliance")
	AddQuest(13112,	"Dalaran",			70.0,	38.6,	"Horde")
	AddQuest(13113,	"Dalaran",			70.0,	38.6,	"Horde")
	AddQuest(13114,	"Dalaran",			70.0,	38.6,	"Horde")
	AddQuest(13115,	"Dalaran",			70.0,	38.6,	"Horde")
	AddQuest(13116,	"Dalaran",			70.0,	38.6,	"Horde")
	AddQuest(14151,	"Dalaran",			42.5,	32.1,	"Neutral")
	AddQuest(26620,	"Duskwood",			73.8,	43.6,	"Alliance")
	AddQuest(26623,	"Duskwood",			73.8,	43.6,	"Alliance")
	AddQuest(26860,	"Loch Modan",			34.9,	49.1,	"Alliance")

	self.InitQuest = nil
end
