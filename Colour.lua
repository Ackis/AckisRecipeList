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
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

--Colour constants
local RED	= "ff0000"
local ORANGE	= "ff8040"
local YELLOW	= "ffff00"
local GREEN	= "40bf40"
local WHITE	= "ffffff"

local COPPER	= "eda55f"
local SILVER	= "c7c7cf"
local GOLD	= "ffd700"

local PURPLE	= "9980CC"
local BLUE	= "0000ff"
local CYAN	= "00ffff"
local BLACK	= "000000"
local GREY	= "666666"
local MIDGREY	= "808080"

local TRAINER	= "d9cb9e"
local VENDOR	= "aad372"
local QUEST	= "2359ff"
local REP	= "ff7c0a"
local SEASON	= "80590e"
local MOBDROP	= "ffffc0"

local HIGH	= WHITE
local NORMAL	= "ffd100"

local HORDE	= RED
local ALLIANCE	= "00ffff"
----------------------------------------------------------------------
--Text colourization functions
----------------------------------------------------------------------

-- Changes any string of text to the specified hex colour
function addon:Colourize(hexColour, text)
	return "|cff" .. tostring(hexColour or 'ffffff') .. tostring(text) .. "|r"
end

function addon:Horde(text)
	return self:Colourize(RED, text)
end

function addon:Alliance(text)
	return self:Colourize(CYAN, text)
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

-- Converts text to Red
function addon:Red(text)
	return self:Colourize(RED, text)
end

-- Converts text to Orange
function addon:Orange(text)
	return self:Colourize(ORANGE, text)
end

-- Converts text to Yellow
function addon:Yellow(text)
	return self:Colourize(YELLOW, text)
end

-- Converts text to Green
function addon:Green(text)
	return self:Colourize(GREEN, text)
end

-- Converts text to White
function addon:White(text)
	return self:Colourize(WHITE, text)
end

-- Converts text to Copper
function addon:Copper(text)
	return self:Colourize(COPPER, text)
end

-- Converts text to Silver
function addon:Silver(text)
	return self:Colourize(SILVER, text)
end

-- Converts text to Gold
function addon:Gold(text)
	return self:Colourize(GOLD, text)
end

-- Converts text to Purple
function addon:Purple(text)
	return self:Colourize(PURPLE, text)
end

-- Converts text to Blue
function addon:Blue(text)
	return self:Colourize(BLUE, text)
end

-- Converts text to Cyan
function addon:Cyan(text)
	return self:Colourize(CYAN, text)
end

-- Converts text to Black
function addon:Black(text)
	return self:Colourize(BLACK, text)
end

-- Converts text to Grey
function addon:Grey(text)
	return self:Colourize(GREY, text)
end

-- Converts text to Middle Grey
function addon:MidGrey(text)
	return self:Colourize(MIDGREY, text)
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

		["HORDE"]	= HORDE,
		["ALLIANCE"]	= ALLIANCE,

		["BLACK"]	= BLACK,
		["ORANGE"]	= ORANGE,
		["GREEN"]	= GREEN,
		["YELLOW"]	= YELLOW,
		["GREY"]	= GREY,
		["MIDGREY"]	= MIDGREY,
		["RED"]		= RED,

		["HIGH"]	= HIGH,
	}

	function addon:hexcolor(colorstring)
		return "|cff"..(COLOR_NAMES[colorstring] or NORMAL)
	end
end	-- do
