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
local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name, true)

private.trainer_list = {}

function private:AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
	if _G.type(trainer_name) == "number" then
		local entry = self:AddListEntry(self.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
		entry.spell_id = trainer_name
	else
		self:AddListEntry(self.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
	end
end

function addon:InitTrainer()
	private:AddTrainer(47418, "Runda", "Durotar", 52.8, 42, "Horde") -- COMPLETELY UPDATED

	self.InitTrainer = nil
end
