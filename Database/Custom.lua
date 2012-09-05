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

local Z			= private.ZONE_NAMES

private.custom_list	= {}

function addon:InitCustom()
	local function AddCustom(identifier, zone_name, coord_x, coord_y, faction)
		private:AddListEntry(private.custom_list, identifier, L[identifier], zone_name, coord_x, coord_y, nil)
	end
	AddCustom("DAILY_COOKING_MEAT", Z.SHATTRATH_CITY)
	AddCustom("DAILY_COOKING_FISH", Z.SHATTRATH_CITY)
	AddCustom("DAILY_FISHING_SHATT", Z.SHATTRATH_CITY)
	AddCustom("DEFAULT_RECIPE")
	AddCustom("CRAFTED_ENGINEERS")
	AddCustom("ONYXIA_HEAD_QUEST", Z.ONYXIAS_LAIR)
	AddCustom("HENRY_STERN_RFD", Z.RAZORFEN_DOWNS)
	AddCustom("ENG_GNOMER", Z.GNOMEREGAN)
	AddCustom("ENG_FLOOR_ITEM_BRD", Z.BLACKROCK_DEPTHS)
	AddCustom("AQ40_RANDOM_BOP", Z.AHNQIRAJ_THE_FALLEN_KINGDOM)
	AddCustom("SUNWELL_RANDOM", Z.SUNWELL_PLATEAU)
	AddCustom("BRD_RANDOM_ROOM", Z.BLACKROCK_DEPTHS)
	AddCustom("MC_RANDOM", Z.MOLTEN_CORE)
	AddCustom("HYJAL_RANDOM", Z.HYJAL_SUMMIT)
	AddCustom("SCHOLO_BOOK_SPAWN", Z.SCHOLOMANCE)
	AddCustom("STRATH_BS_PLANS", Z.STRATHOLME)
	AddCustom("DM_TRIBUTE", Z.DIRE_MAUL, 59.04, 48.82)
	AddCustom("BT_RANDOM", Z.BLACK_TEMPLE)
	AddCustom("TK_RANDOM", Z.TEMPEST_KEEP)
	AddCustom("OGRI_DRAGONS")
	AddCustom("KUNG")
	AddCustom("SSC_RANDOM", Z.SERPENTSHRINE_CAVERN)
	AddCustom("DAILY_COOKING_DAL", Z.DALARAN)
	AddCustom("ULDUAR_RANDOM", Z.ULDUAR)
	AddCustom("TOC25_RANDOM", Z.TRIAL_OF_THE_CRUSADER)
	AddCustom("LORE_NORTH")
	AddCustom("NORTH_DUNG")
	AddCustom("BUGGED")
	AddCustom("ARCH_DROP_ULD", Z.ULDUM)
	AddCustom("REMOVED_FROM_GAME")
	AddCustom("FIRELANDS_RANDOM", Z.FIRELANDS)
	AddCustom("DRAGONSOUL_RANDOM", Z.DRAGON_SOUL)
	AddCustom("PREREQ")

	self.InitCustom = nil
end

