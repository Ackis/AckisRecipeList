--[[
************************************************************************
Reputation.lua
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
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

function addon:InitReputation(DB)
	local function AddReputation(rep_id, name)
		private:AddListEntry(DB, rep_id, name, nil, nil, nil, nil)
	end
	AddReputation(59, BFAC["Thorium Brotherhood"])
	AddReputation(270, BFAC["Zandalar Tribe"])
	AddReputation(529, BFAC["Argent Dawn"])
	AddReputation(576, BFAC["Timbermaw Hold"])
	AddReputation(609, BFAC["Cenarion Circle"])
	AddReputation(932, BFAC["The Aldor"])
	AddReputation(933, BFAC["The Consortium"])
	AddReputation(934, BFAC["The Scryers"])
	AddReputation(935, BFAC["The Sha'tar"])
	AddReputation(941, BFAC["The Mag'har"])
	AddReputation(942, BFAC["Cenarion Expedition"])
	AddReputation(946, BFAC["Honor Hold"])
	AddReputation(947, BFAC["Thrallmar"])
	AddReputation(967, BFAC["The Violet Eye"])
	AddReputation(970, BFAC["Sporeggar"])
	AddReputation(978, BFAC["Kurenai"])
	AddReputation(989, BFAC["Keepers of Time"])
	AddReputation(990, BFAC["The Scale of the Sands"])
	AddReputation(1011, BFAC["Lower City"])
	AddReputation(1012, BFAC["Ashtongue Deathsworn"])
	AddReputation(1037, BFAC["Alliance Vanguard"])
	AddReputation(1050, BFAC["Valiance Expedition"])
	AddReputation(1052, BFAC["Horde Expedition"])
	AddReputation(1064, BFAC["The Taunka"])
	AddReputation(1067, BFAC["The Hand of Vengeance"])
	AddReputation(1068, BFAC["Explorers' League"])
	AddReputation(1073, BFAC["The Kalu'ak"])
	AddReputation(1077, BFAC["Shattered Sun Offensive"])
	AddReputation(1085, BFAC["Warsong Offensive"])
	AddReputation(1090, BFAC["Kirin Tor"])
	AddReputation(1091, BFAC["The Wyrmrest Accord"])
	AddReputation(1098, BFAC["Knights of the Ebon Blade"])
	AddReputation(1104, BFAC["Frenzyheart Tribe"])
	AddReputation(1105, BFAC["The Oracles"])
	AddReputation(1106, BFAC["Argent Crusade"])
	AddReputation(1119, BFAC["The Sons of Hodir"])
	AddReputation(1156, BFAC["The Ashen Verdict"])

	self.InitReputation = nil
end
