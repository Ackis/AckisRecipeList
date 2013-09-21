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
	AddCustom("BRD_MAIL")
	AddCustom("BRD_SHOULDERS")
	AddCustom("STRATH_BS_PLANS", Z.STRATHOLME)
	AddCustom("DM_TRIBUTE", Z.DIRE_MAUL, 59.04, 48.82)
	AddCustom("OGRI_DRAGONS", Z.BLADES_EDGE_MOUNTAINS)
	AddCustom("NORMAL")
	AddCustom("HEROIC")
	AddCustom("KUNG")
	AddCustom("DAILY_COOKING_DAL", Z.DALARAN)
	AddCustom("ARCH_DROP_ULD", Z.ULDUM)
	AddCustom("REMOVED_FROM_GAME")
	AddCustom("PREREQ")
	AddCustom("BLACK_MARKET_AUCTION_HOUSE")
	AddCustom("BANANA_INFUSED_RUM", Z.KRASARANG_WILDS, 52.3, 88.7)
	AddCustom("FOUR_SENSES_BREW", Z.KUN_LAI_SUMMIT, 44.7, 52.3)
	AddCustom("LEARNT_BY_ACCEPTING_QUEST")
	AddCustom("TIMELESS_ISLE_COOKING", Z.TIMELESS_ISLE, 52.1, 46.1)
	AddCustom("ANCIENT_GUO-LAI_CACHE", Z.VALE_OF_ETERNAL_BLOSSOMS)

	self.InitCustom = nil
end

