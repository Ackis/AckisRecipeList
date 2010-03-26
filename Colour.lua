--[[
************************************************************************
Colour.lua
Colouring functions for ARL
************************************************************************
File date: @file-date-iso@
File revision: @file-revision@
Project revision: @project-revision@
Project version: @project-version@
************************************************************************
Code adopted from Crayon library
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]]


local MODNAME			= "Ackis Recipe List"
local addon			= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

--Colour constants
local GREY	= "666666"

local TRAINER	= "d9cb9e"
local VENDOR	= "aad372"
local QUEST	= "2359ff"
local REP	= "ff7c0a"
local SEASON	= "80590e"
local MOBDROP	= "ffffc0"

local NORMAL	= "ffd100"

----------------------------------------------------------------------
--Text colourization functions
----------------------------------------------------------------------

-- Changes any string of text to the specified hex colour
function addon:Colourize(hexColour, text)
	return "|cff" .. tostring(hexColour or 'ffffff') .. tostring(text) .. "|r"
end

-- Converts text to Grey
function addon:Grey(text)
	return self:Colourize(GREY, text)
end

-------------------------------------------------------------------------------
-- Colorize a string based off of a name entry.
-------------------------------------------------------------------------------
do
	local COLOR_NAMES = {
		["TRAINER"]	= TRAINER,
		["VENDOR"]	= VENDOR,
		["QUEST"]	= QUEST,
		["REP"]		= REP,
		["SEASON"]	= SEASON,
		["MOBDROP"]	= MOBDROP,

		["GREY"]	= GREY,
		["RED"]		= RED,

		["HIGH"]	= HIGH,
	}

	function addon:hexcolor(colorstring)
		return "|cff"..(COLOR_NAMES[colorstring] or NORMAL)
	end
end	-- do
