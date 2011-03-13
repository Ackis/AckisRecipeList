--[[
************************************************************************
Trainer.lua
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
]] --

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

-----------------------------------------------------------------------
-- Constants.
-----------------------------------------------------------------------
local NEUTRAL = 0
local ALLIANCE = 1
local HORDE = 2

function addon:InitTrainer(DB)
	local function AddTrainer(id_num, name, location, coord_x, coord_y, faction)
		private:AddListEntry(DB, id_num, name, location, coord_x, coord_y, faction)
	end

	AddTrainer(3373, L["Arnok"], BZ["Orgrimmar"], 34.1, 84.4, HORDE)
	AddTrainer(12920, L["Doctor Gregory Victor"], BZ["Arathi Highlands"], 73.4, 36.8, HORDE)
	AddTrainer(12939, L["Doctor Gustaf VanHowzen"], BZ["Dustwallow Marsh"], 68.18, 47.94, ALLIANCE)

	self.InitTrainer = nil
end
