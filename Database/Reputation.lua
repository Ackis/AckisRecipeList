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

function addon:InitReputation()
	local function AddReputation(rep_id, name)
		private.AcquireTypes.Reputation:AddEntity(rep_id, _G.GetFactionInfoByID(rep_id))
	end

	AddReputation(59)
	AddReputation(270)
	AddReputation(529)
	AddReputation(576)
	AddReputation(609)
	AddReputation(932)
	AddReputation(933)
	AddReputation(934)
	AddReputation(935)
	AddReputation(941)
	AddReputation(942)
	AddReputation(946)
	AddReputation(947)
	AddReputation(967)
	AddReputation(970)
	AddReputation(978)
	AddReputation(989)
	AddReputation(990)
	AddReputation(1011)
	AddReputation(1012)
	AddReputation(1037)
	AddReputation(1050)
	AddReputation(1052)
	AddReputation(1064)
	AddReputation(1067)
	AddReputation(1068)
	AddReputation(1073)
	AddReputation(1077)
	AddReputation(1085)
	AddReputation(1090)
	AddReputation(1091)
	AddReputation(1098)
	AddReputation(1104)
	AddReputation(1105)
	AddReputation(1106)
	AddReputation(1119)
	AddReputation(1156)
	AddReputation(1216)
	AddReputation(1228)
	AddReputation(1242)
	AddReputation(1269)
	AddReputation(1270)
	AddReputation(1271)
	AddReputation(1272)
	AddReputation(1273)
	AddReputation(1275)
	AddReputation(1276)
	AddReputation(1277)
	AddReputation(1278)
	AddReputation(1279)
	AddReputation(1280)
	AddReputation(1281)
	AddReputation(1282)
	AddReputation(1283)
	AddReputation(1302)
	AddReputation(1337)
	AddReputation(1341)
	AddReputation(1345)
	AddReputation(1351)
	AddReputation(1352)
	AddReputation(1353)
	AddReputation(1358)
	AddReputation(1359)

	self.InitReputation = nil
end
