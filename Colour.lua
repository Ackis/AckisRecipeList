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
local YELLOW	= "ffff00"
local WHITE	= "ffffff"

local GREY	= "666666"

local TRAINER	= "d9cb9e"
local VENDOR	= "aad372"
local QUEST	= "2359ff"
local REP	= "ff7c0a"
local SEASON	= "80590e"
local MOBDROP	= "ffffc0"

local HIGH	= WHITE
local NORMAL	= "ffd100"

----------------------------------------------------------------------
--Text colourization functions
----------------------------------------------------------------------

-- Changes any string of text to the specified hex colour
function addon:Colourize(hexColour, text)
	return "|cff" .. tostring(hexColour or 'ffffff') .. tostring(text) .. "|r"
end

function addon:Coords(text)
	return self:Colourize(WHITE, text)
end

function addon:Trainer(text)
	return self:Colourize(TRAINER, text)
end

function addon:Vendor(text)
	return self:Colourize(VENDOR, text)
end

function addon:Quest(text)
	return self:Colourize(QUEST, text)
end

function addon:Rep(text)
	return self:Colourize(REP, text)
end

function addon:Season(text)
	return self:Colourize(SEASON, text)
end

function addon:MobDrop(text)
	return self:Colourize(MOBDROP, text)
end


-- Converts text to Yellow
function addon:Yellow(text)
	return self:Colourize(YELLOW, text)
end

-- Converts text to White
function addon:White(text)
	return self:Colourize(WHITE, text)
end

-- Converts text to Grey
function addon:Grey(text)
	return self:Colourize(GREY, text)
end

-- Standard bliz yellowish sort of thing
function addon:Normal(text)
	return self:Colourize(NORMAL, text)
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

		["YELLOW"]	= YELLOW,
		["GREY"]	= GREY,
		["RED"]		= RED,

		["HIGH"]	= HIGH,
	}

	function addon:hexcolor(colorstring)
		return "|cff"..(COLOR_NAMES[colorstring] or NORMAL)
	end
end	-- do
