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

private.reputation_list	= {}

function addon:InitReputation()
	local function AddReputation(rep_id, name)
		private:AddListEntry(private.reputation_list, rep_id, BFAC[name])
	end
	AddReputation(59, "Thorium Brotherhood")
	AddReputation(270, "Zandalar Tribe")
	AddReputation(529, "Argent Dawn")
	AddReputation(576, "Timbermaw Hold")
	AddReputation(609, "Cenarion Circle")
	AddReputation(932, "The Aldor")
	AddReputation(933, "The Consortium")
	AddReputation(934, "The Scryers")
	AddReputation(935, "The Sha'tar")
	AddReputation(941, "The Mag'har")
	AddReputation(942, "Cenarion Expedition")
	AddReputation(946, "Honor Hold")
	AddReputation(947, "Thrallmar")
	AddReputation(967, "The Violet Eye")
	AddReputation(970, "Sporeggar")
	AddReputation(978, "Kurenai")
	AddReputation(989, "Keepers of Time")
	AddReputation(990, "The Scale of the Sands")
	AddReputation(1011, "Lower City")
	AddReputation(1012, "Ashtongue Deathsworn")
	AddReputation(1037, "Alliance Vanguard")
	AddReputation(1050, "Valiance Expedition")
	AddReputation(1052, "Horde Expedition")
	AddReputation(1064, "The Taunka")
	AddReputation(1067, "The Hand of Vengeance")
	AddReputation(1068, "Explorers' League")
	AddReputation(1073, "The Kalu'ak")
	AddReputation(1077, "Shattered Sun Offensive")
	AddReputation(1085, "Warsong Offensive")
	AddReputation(1090, "Kirin Tor")
	AddReputation(1091, "The Wyrmrest Accord")
	AddReputation(1098, "Knights of the Ebon Blade")
	AddReputation(1104, "Frenzyheart Tribe")
	AddReputation(1105, "The Oracles")
	AddReputation(1106, "Argent Crusade")
	AddReputation(1119, "The Sons of Hodir")
	AddReputation(1156, "The Ashen Verdict")

	self.InitReputation = nil
end
