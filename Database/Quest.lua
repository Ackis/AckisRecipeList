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

	AddQuest(769,	Z.THUNDER_BLUFF,		44.1,	44.6,	"Horde")
	AddQuest(1582,	Z.DARNASSUS,			60.5,	37.3,	"Alliance")
	AddQuest(4083,	Z.BLACKROCK_DEPTHS,		0,	0,	"Neutral")
	AddQuest(6032,	Z.FELWOOD,			65.7,	2.9,	"Neutral")
	AddQuest(7493,	Z.ORGRIMMAR,			51.0,	76.5,	"Horde")
	AddQuest(7497,	Z.STORMWIND_CITY,		67.2,	85.5,	"Alliance")
	AddQuest(8323,	Z.SILITHUS,			67.1,	69.7,	"Neutral") -- Blacksmithing, Tailoring
	AddQuest(31539,	Z.THE_JADE_FOREST,		54.8,	45.0,	"Neutral")

	self.InitQuest = nil
end
