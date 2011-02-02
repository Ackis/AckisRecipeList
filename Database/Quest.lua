--[[
************************************************************************
Quest.lua
Quest data for all of Ackis Recipe List
************************************************************************
File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
Project version: @project-version@
************************************************************************
Format:
	AddQuest(QuestID, Zone, X, Y, Faction)
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]]--

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

-- Set up the private intra-file namespace.
local private	= select(2, ...)

------------------------------------------------------------------------------
-- Constants.
------------------------------------------------------------------------------
local NEUTRAL	= 0
local ALLIANCE	= 1
local HORDE	= 2

------------------------------------------------------------------------------
-- Memoizing table for quest names.
------------------------------------------------------------------------------
private.quest_names = setmetatable({}, {
	__index = function(t, id_num)
			  GameTooltip:SetOwner(UIParent, ANCHOR_NONE)
			  GameTooltip:SetHyperlink("quest:"..tostring(id_num))

			  local quest_name = _G["GameTooltipTextLeft1"]:GetText()
			  GameTooltip:Hide()

			  if not quest_name then
				  return _G.UNKNOWN
			  end
			  t[id_num] = quest_name
			  return quest_name
		  end,
})

function addon:InitQuest(DB)
	local function AddQuest(QuestID, Zone, X, Y, Faction)
		addon:addLookupList(DB, QuestID, nil, Zone, X, Y, Faction)
	end

	AddQuest(384,	BZ["Dun Morogh"],		46.8,	52.5,	ALLIANCE)
	AddQuest(769,	BZ["Thunder Bluff"],		44.1,	44.6,	HORDE)
	AddQuest(1578,	BZ["Ironforge"],		48.5,	43.0,	ALLIANCE)
	AddQuest(1582,	BZ["Darnassus"],		64.3,	21.9,	ALLIANCE)
	AddQuest(1618,	BZ["Ironforge"],		48.5,	43.0,	ALLIANCE)
	AddQuest(2751,	BZ["Orgrimmar"],		78.0,	21.4,	HORDE)
	AddQuest(2752,	BZ["Orgrimmar"],		78.0,	21.4,	HORDE)
	AddQuest(2753,	BZ["Orgrimmar"],		78.0,	21.4,	HORDE)
	AddQuest(2754,	BZ["Orgrimmar"],		78.0,	21.4,	HORDE)
	AddQuest(2755,	BZ["Orgrimmar"],		78.0,	21.4,	HORDE)
	AddQuest(2848,	BZ["Feralas"],			30.6,	42.7,	ALLIANCE)
	AddQuest(2849,	BZ["Feralas"],			30.6,	42.7,	ALLIANCE)
	AddQuest(2850,	BZ["Feralas"],			30.6,	42.7,	ALLIANCE)
	AddQuest(2851,	BZ["Feralas"],			30.6,	42.7,	ALLIANCE)
	AddQuest(2852,	BZ["Feralas"],			30.6,	42.7,	ALLIANCE)
	AddQuest(2853,	BZ["Feralas"],			30.6,	42.7,	ALLIANCE)
	AddQuest(2855,	BZ["Feralas"],			74.5,	42.9,	HORDE)
	AddQuest(2856,	BZ["Feralas"],			74.5,	42.9,	HORDE)
	AddQuest(2857,	BZ["Feralas"],			74.5,	42.9,	HORDE)
	AddQuest(2858,	BZ["Feralas"],			74.5,	42.9,	HORDE)
	AddQuest(2859,	BZ["Feralas"],			74.5,	42.9,	HORDE)
	AddQuest(2860,	BZ["Feralas"],			74.5,	42.9,	HORDE)
	AddQuest(4083,	BZ["Blackrock Depths"],		0,	0,	NEUTRAL)
	AddQuest(5518,	BZ["Dire Maul"],		0,	0,	NEUTRAL)
	AddQuest(6032,	BZ["Felwood"],			65.7,	2.9,	NEUTRAL)
	AddQuest(6610,	BZ["Tanaris"],			52.6,	28.1,	NEUTRAL)
	AddQuest(6622,	BZ["Arathi Highlands"],		73.4,	36.8,	HORDE)
	AddQuest(6624,	BZ["Dustwallow Marsh"],		67.7,	48.9,	ALLIANCE)
	AddQuest(7493,	BZ["Orgrimmar"],		51.0,	76.5,	HORDE)
	AddQuest(7497,	BZ["Stormwind City"],		67.2,	85.5,	ALLIANCE)
	AddQuest(7604,	BZ["Blackrock Depths"],		0,	0,	NEUTRAL)
	AddQuest(7649,	BZ["Dire Maul"],		0,	0,	NEUTRAL)
	AddQuest(7650,	BZ["Dire Maul"],		0,	0,	NEUTRAL)
	AddQuest(7651,	BZ["Dire Maul"],		0,	0,	NEUTRAL)
	AddQuest(8313,	BZ["Silithus"],			38.0,	45.3,	NEUTRAL)
	AddQuest(8323,	BZ["Silithus"],			67.1,	69.7,	NEUTRAL)
	AddQuest(8798,	BZ["Winterspring"],		60.9,	37.7,	NEUTRAL)
	AddQuest(9171,	BZ["Ghostlands"],		48.3,	30.9,	HORDE)
	AddQuest(9249,	BZ["Darkmoon Faire"],		0,	0,	NEUTRAL)
	AddQuest(9356,	BZ["Hellfire Peninsula"],	49.2,	74.8,	NEUTRAL)
	AddQuest(9454,	BZ["Azuremyst Isle"],		49.8,	51.9,	ALLIANCE)
	AddQuest(9635,	BZ["Zangarmarsh"],		33.7,	50.2,	HORDE)
	AddQuest(9636,	BZ["Zangarmarsh"],		68.6,	50.2,	ALLIANCE)
	AddQuest(10860,	BZ["Blade's Edge Mountains"],	76.1,	60.3,	HORDE)
	AddQuest(11377,	BZ["Shattrath City"],		61.6, 16.5, NEUTRAL)
	AddQuest(11379,	BZ["Shattrath City"],		61.6, 16.5, NEUTRAL)
	AddQuest(11380,	BZ["Shattrath City"],		61.6, 16.5, NEUTRAL)
	AddQuest(11381,	BZ["Shattrath City"],		61.6, 16.5, NEUTRAL)
	AddQuest(11666,	BZ["Terokkar Forest"],		38.7, 12.8, NEUTRAL)
	AddQuest(11667,	BZ["Terokkar Forest"],		38.7, 12.8, NEUTRAL)
	AddQuest(11668,	BZ["Terokkar Forest"],		38.7, 12.8, NEUTRAL)
	AddQuest(11669,	BZ["Terokkar Forest"],		38.7, 12.8, NEUTRAL)
	AddQuest(12889,	BZ["The Storm Peaks"],		37.7,	46.5,	NEUTRAL)
	AddQuest(13571,	BZ["Dalaran"],			0,	0,	NEUTRAL)
	AddQuest(13087,	BZ["Howling Fjord"],		58.2,	62.1,	ALLIANCE)
	AddQuest(13088,	BZ["Borean Tundra"],		57.9,	71.5,	ALLIANCE)
	AddQuest(13089,	BZ["Howling Fjord"],		78.7,	29.5,	HORDE)
	AddQuest(13090,	BZ["Borean Tundra"],		42.0,	54.2,	HORDE)
	AddQuest(13100,	BZ["Dalaran"],			40.5, 65.8,	ALLIANCE)
	AddQuest(13101,	BZ["Dalaran"],			40.5, 65.8,	ALLIANCE)
	AddQuest(13102,	BZ["Dalaran"],			40.5, 65.8,	ALLIANCE)
	AddQuest(13103,	BZ["Dalaran"],			40.5, 65.8,	ALLIANCE)
	AddQuest(13107,	BZ["Dalaran"],			40.5, 65.8,	ALLIANCE)
	AddQuest(13112,	BZ["Dalaran"],			70.0, 38.6,	HORDE)
	AddQuest(13113,	BZ["Dalaran"],			70.0, 38.6,	HORDE)
	AddQuest(13114,	BZ["Dalaran"],			70.0, 38.6,	HORDE)
	AddQuest(13115,	BZ["Dalaran"],			70.0, 38.6,	HORDE)
	AddQuest(13116,	BZ["Dalaran"],			70.0, 38.6,	HORDE)
	AddQuest(14151,	BZ["Dalaran"],			42.5,	32.1,	NEUTRAL)
	AddQuest(26620,	BZ["Duskwood"],			73.8,	43.6,	ALLIANCE)
	AddQuest(26623,	BZ["Duskwood"],			73.8,	43.6,	ALLIANCE)
	AddQuest(26860,	BZ["Loch Modan"],			34.9,	49.1,	ALLIANCE)
	
end