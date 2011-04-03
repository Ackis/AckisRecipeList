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

function addon:InitTrainer(DB)
	local function AddTrainer(id_num, name, location, coord_x, coord_y, faction)
		private:AddListEntry(DB, id_num, name, location, coord_x, coord_y, faction)
	end

	AddTrainer(47418, "Runda", "Durotar", 52.8, 42, "Horde")

	self.InitTrainer = nil
end
