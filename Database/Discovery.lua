--[[
************************************************************************
Discovery.lua
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

local Z = private.ZONE_NAMES

private.discovery_list	= {}

function addon:InitDiscovery()
	local function AddDiscovery(identifier, location, coord_x, coord_y, faction)
		private:AddListEntry(private.discovery_list, identifier, L[identifier], location, coord_x, coord_y, nil)
	end

	AddDiscovery("DISCOVERY_ALCH_ELIXIRFLASK")
	AddDiscovery("DISCOVERY_ALCH_POTION")
	AddDiscovery("DISCOVERY_ALCH_PROT")
	AddDiscovery("DISCOVERY_ALCH_BC_XMUTE")
	AddDiscovery("DISCOVERY_INSC_BOOK", Z.NORTHREND)
	AddDiscovery("DISCOVERY_INSC_MINOR")
	AddDiscovery("DISCOVERY_INSC_NORTHREND")
	AddDiscovery("DISCOVERY_ALCH_NORTHREND_RESEARCH")
	AddDiscovery("DISCOVERY_ALCH_NORTHREND_XMUTE")
	AddDiscovery("ENG_DISC")
	AddDiscovery("ENG_DISC_FIREWORKS")
	AddDiscovery("DISCOVERY_ALCH_PANDARIA")
	AddDiscovery("DISCOVERY_INSC_PANDARIA")
	AddDiscovery("DISCOVERY_JC_PANDARIA")
	AddDiscovery("DISCOVERY_LW_PANDARIA")
	AddDiscovery("DISCOVERY_TAILOR_PANDARIA")
	AddDiscovery("DISCOVERY_BS_PANDARIA")
	AddDiscovery("DISCOVERY_BS_WEAP_PANDARIA")

	self.InitDiscovery = nil
end

