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

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BZ		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

function addon:InitCustom(DB)
	local function AddCustom(identifier, name, location, coord_x, coord_y, faction)
		addon:AddListEntry(DB, identifier, name, location, coord_x, coord_y, faction)
	end
	AddCustom(1, L["DISCOVERY_ALCH_ELIXIRFLASK"])
	AddCustom(2, L["DISCOVERY_ALCH_POTION"])
	AddCustom(3, L["DISCOVERY_ALCH_XMUTE"])
	AddCustom(4, L["DISCOVERY_ALCH_PROT"])
	AddCustom(5, L["DAILY_COOKING_MEAT"], BZ["Shattrath"], 0, 0)
	AddCustom(6, L["DAILY_COOKING_FISH"], BZ["Shattrath"], 0, 0)
	AddCustom(7, L["DAILY_FISHING_SHATT"], BZ["Shattrath"], 0, 0)
	AddCustom(8, L["DEFAULT_RECIPE"])
	AddCustom(9, L["CRAFTED_ENGINEERS"])
	AddCustom(10, L["ONYXIA_HEAD_QUEST"], BZ["Onyxia's Lair"], 0, 0)
	--AddCustom(11, )
	AddCustom(12, L["DISCOVERY_ALCH_WRATH"])
	AddCustom(13, L["HENRY_STERN_RFD"], BZ["Razorfen Downs"], 0, 0)
	AddCustom(14, L["DISCOVERY_INSC_MINOR"])
	AddCustom(15, L["DISCOVERY_INSC_NORTHREND"])
	AddCustom(16, L["ENG_GNOMER"], BZ["Gnomeregan"], 0, 0)
	AddCustom(17, L["ENG_FLOOR_ITEM_BRD"], BZ["Blackrock Depths"], 0, 0)
	AddCustom(18, L["DISCOVERY_ALCH_NORTHREND_RESEARCH"])
	AddCustom(19, L["DISCOVERY_ALCH_NORTHREND_XMUTE"])
	--AddCustom(20, )
	--AddCustom(21, )
	AddCustom(22, L["AQ40_RANDOM_BOP"], BZ["Temple of Ahn'Qiraj"], 0, 0)
	AddCustom(23, L["DM_CACHE"], BZ["Dire Maul"], 59.04, 48.82)
	AddCustom(24, L["SUNWELL_RANDOM"], BZ["Sunwell Plateau"], 0, 0)
	AddCustom(25, L["BRD_RANDOM_ROOM"], BZ["Blackrock Depths"], 0, 0)
	AddCustom(26, L["MC_RANDOM"], BZ["Molten Core"], 0, 0)
	AddCustom(27, L["HYJAL_RANDOM"], BZ["Hyjal Summit"], 0, 0)
	--AddCustom(28, )
	AddCustom(29, L["ZA_RANDOM"], BZ["Zul'Aman"], 0, 0)
	AddCustom(30, L["SCHOLO_BOOK_SPAWN"], BZ["Scholomance"], 0, 0)
	AddCustom(31, L["STRATH_BS_PLANS"], BZ["Stratholme"], 0, 0)
	AddCustom(32, L["DM_TRIBUTE"], BZ["Dire Maul"], 59.04, 48.82)
	--AddCustom(33, )
	AddCustom(34, L["BT_RANDOM"], BZ["Black Temple"], 0, 0)
	AddCustom(35, L["Custom35"])
	AddCustom(36, L["Custom36"])
	AddCustom(37, L["SSC_RANDOM"], BZ["Serpentshrine Cavern"], 0, 0)
	AddCustom(38, L["DAILY_COOKING_DAL"], BZ["Dalaran"], 0, 0)
	AddCustom(39, L["ULDUAR_RANDOM"], BZ["Ulduar"], 0, 0)
	AddCustom(40, L["DISCOVERY_INSC_BOOK"])
	AddCustom(41, L["Custom41"])
	AddCustom(42, L["TOC25_RANDOM"])
	AddCustom(43, L["TK_RANDOM"], BZ["The Eye"], 0, 0)
	AddCustom(44, L["Custom44"])
	AddCustom(45, L["Custom45"])
	AddCustom(46, L["BUGGED"])
	AddCustom(47, L["ARCH_DROP"])
	AddCustom(48, L["REMOVED_FROM_GAME"])
	AddCustom(49, L["VASHJ'IR_RANDOM_INSC"])
	AddCustom(50, L["DEEPHOLM_RANDOM_INSC"])
	AddCustom(51, L["ENG_DISC"])

--AddCustom(28, L["BT_HYJAL_RANDOM"])
--[[
L["Custom35"] = "Drops from dragons in Ogri'la and Blade's Edge Mountains Summon Bosses"
L["Custom36"] = "From a NPC in Dalaran sewers after doing The Taste Test" -- Update
L["Custom41"] = "Removed from the game when Naxx 40 was taken out."
]]--
	self.InitCustom = nil
end

