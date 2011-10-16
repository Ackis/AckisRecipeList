--[[
************************************************************************
Custom.lua
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

local addon		= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L			= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BZ		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

private.custom_list	= {}

function addon:InitCustom()
	local function AddCustom(identifier, location, coord_x, coord_y, faction)
		private:AddListEntry(private.custom_list, identifier, L[identifier], location, coord_x, coord_y, nil)
	end
	AddCustom("DAILY_COOKING_MEAT", BZ["Shattrath City"])
	AddCustom("DAILY_COOKING_FISH", BZ["Shattrath City"])
	AddCustom("DAILY_FISHING_SHATT", BZ["Shattrath City"])
	AddCustom("DEFAULT_RECIPE")
	AddCustom("CRAFTED_ENGINEERS")
	AddCustom("ONYXIA_HEAD_QUEST", BZ["Onyxia's Lair"])
	AddCustom("HENRY_STERN_RFD", BZ["Razorfen Downs"])
	AddCustom("ENG_GNOMER", BZ["Gnomeregan"])
	AddCustom("ENG_FLOOR_ITEM_BRD", BZ["Blackrock Depths"])
	AddCustom("AQ40_RANDOM_BOP", BZ["Temple of Ahn'Qiraj"])
	AddCustom("SUNWELL_RANDOM", BZ["Sunwell Plateau"])
	AddCustom("BRD_RANDOM_ROOM", BZ["Blackrock Depths"])
	AddCustom("MC_RANDOM", BZ["Molten Core"])
	AddCustom("HYJAL_RANDOM", BZ["Hyjal Summit"])
	AddCustom("SCHOLO_BOOK_SPAWN", BZ["Scholomance"])
	AddCustom("STRATH_BS_PLANS", BZ["Stratholme"])
	AddCustom("DM_TRIBUTE", BZ["Dire Maul"], 59.04, 48.82)
	AddCustom("BT_RANDOM", BZ["Black Temple"])
	AddCustom("TK_RANDOM", BZ["Tempest Keep"])
	AddCustom("OGRI_DRAGONS")
	AddCustom("KUNG")
	AddCustom("SSC_RANDOM", BZ["Serpentshrine Cavern"])
	AddCustom("DAILY_COOKING_DAL", BZ["Dalaran"])
	AddCustom("ULDUAR_RANDOM", BZ["Ulduar"])
	AddCustom("NAXX40_GONE")
	AddCustom("TOC25_RANDOM", BZ["Trial of the Crusader"])
	AddCustom("LORE_NORTH")
	AddCustom("NORTH_DUNG")
	AddCustom("BUGGED")
	AddCustom("ARCH_DROP_ULD", BZ["Uldum"])
	AddCustom("REMOVED_FROM_GAME")
	AddCustom("FIRELANDS_RANDOM", BZ["Firelands"])
	AddCustom("DIG_STEW")

	self.InitCustom = nil
end

