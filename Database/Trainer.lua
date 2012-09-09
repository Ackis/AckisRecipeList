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
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name, true)

local Z = private.ZONE_NAMES

private.trainer_list = {}

function private:AddTrainer(id_num, trainer_name, zone_name, coord_x, coord_y, faction)
	if _G.type(trainer_name) == "number" then
		local entry = self:AddListEntry(self.trainer_list, id_num, _G.GetSpellInfo(trainer_name), zone_name, coord_x, coord_y, faction)
		entry.spell_id = trainer_name
	else
		self:AddListEntry(self.trainer_list, id_num, L[trainer_name], zone_name, coord_x, coord_y, faction)
	end
end

function addon:InitTrainer()
	private:AddTrainer(47396, "Wembil Taskwidget", Z.DUN_MOROGH, 53.8, 52.0, "Alliance") -- COMPLETELY UPDATED
	private:AddTrainer(47418, "Runda", Z.DUROTAR, 52.8, 42.0, "Horde") -- COMPLETELY UPDATED
	private:AddTrainer(47384, "Lien Farner", Z.ELWYNN_FOREST, 41.95, 67.16, "Alliance") -- COMPLETELY UPDATED
	
	self.InitTrainer = nil
end
