--[[
************************************************************************
Seasonal.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
License:
	Please see LICENSE.txt
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

function addon:InitSeasons(DB)
	local function AddSeason(identifier, name)
		private:AddListEntry(DB, identifier, name, _G.GetCategoryInfo(155))
	end

	AddSeason("WINTER_VEIL", _G.GetCategoryInfo(156))
	AddSeason("LUNAR_FESTIVAL", _G.GetCategoryInfo(160))
	AddSeason("MIDSUMMER", _G.GetCategoryInfo(161))
	AddSeason("PILGRIMS_BOUNTY", _G.GetCategoryInfo(14981))
	AddSeason("DAY_OF_THE_DEAD", L["Day of the Dead"])

	self.InitSeasons = nil
end
