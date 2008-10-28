--[[

************************************************************************

ARL-Trainer.lua

Trainer data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

21 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(TrainerDB, NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitTrainer(TrainerDB)

	self:addLookupList(TrainerDB, 2326, L["Thamner Pol"], BZONE["Dun Morogh"], 47.28, 51.91, 1)
	self:addLookupList(TrainerDB, 2327, L["Shaina Fuller"], BZONE["Stormwind City"], 42.72, 26.10, 1)
	self:addLookupList(TrainerDB, 2329, L["Michelle Belle"], BZONE["Elwynn Forest"], 43.68, 66.37, 1)
	self:addLookupList(TrainerDB, 2798, L["Pand Stonebinder"], BZONE["Thunder Bluff"], 29.47, 21.26, 2)
	self:addLookupList(TrainerDB, 3181, L["Fremal Doohickey"], BZONE["Wetlands"], 10.77, 60.84, 1)
	self:addLookupList(TrainerDB, 3373, L["Arnok"], BZONE["Orgrimmar"], 33.98, 82.84, 2)
	self:addLookupList(TrainerDB, 4211, L["Dannelor"], BZONE["Darnassus"], 51.17, 12.51, 1)
	self:addLookupList(TrainerDB, 4591, L["Mary Edras"], BZONE["Undercity"], 72.81, 54.76, 2)
	self:addLookupList(TrainerDB, 5150, L["Nissa Firestone"], BZONE["Ironforge"], 54.87, 59.12, 1)
	self:addLookupList(TrainerDB, 5759, L["Nurse Neela"], BZONE["Tirisfal Glades"], 62.00, 52.07, 2)
	self:addLookupList(TrainerDB, 5939, L["Vira Younghoof"], BZONE["Mulgore"], 46.99, 60.19, 2)
	self:addLookupList(TrainerDB, 5943, L["Rawrk"], BZONE["Durotar"], 53.85, 41.89, 2)
	self:addLookupList(TrainerDB, 6094, L["Byancie"], BZONE["Teldrassil"], 55.34, 56.83, 1)
	self:addLookupList(TrainerDB, 16272, L["Kanaria"], BZONE["Eversong Woods"], 48.31, 47.59, 2)
	self:addLookupList(TrainerDB, 16662, L["Alestus"], BZONE["Silvermoon City"], 77.16, 68.85, 2)
	self:addLookupList(TrainerDB, 16731, L["Nus"], BZONE["The Exodar"], 38.33, 22.77, 1)
	self:addLookupList(TrainerDB, 17214, L["Anchorite Fateema"], BZONE["Bloodmyst Isle"], 51.52, 53.33, 1)
	self:addLookupList(TrainerDB, 17424, L["Anchorite Paetheus"], BZONE["Bloodmyst Isle"], 54.81, 54.66, 1)
	self:addLookupList(TrainerDB, 19184, L["Mildred Fletcher"], BZONE["Shattrath City"], 65.55, 14.52, 0)
	self:addLookupList(TrainerDB, 19478, L["Fera Palerunner"], BZONE["Blade's Edge Mountains"], 52.60, 55.12, 2)
	self:addLookupList(TrainerDB, 22477, L["Anchorite Ensham"], BZONE["Terokkar Forest"], 31.01, 75.86, 0)

end
