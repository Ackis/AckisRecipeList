--[[

************************************************************************

ARL-Custom.lua

Custom acquire data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb	
Entries to this file will be overwritten

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(CustomDB, Rep ID, Rep Name)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitCustom(CustomDB)

	self:addLookupList(CustomDB, 1, "Discovered by making elixirs or flasks using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 2, "Discovered by making potions using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 3, "Discovered by doing transmutes using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 4, "Discovered by Major Protection Potions using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 5, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the meat crate.")
	self:addLookupList(CustomDB, 6, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the fish barrel.")
	self:addLookupList(CustomDB, 7, "Randomly obtained by completing the fishing daily quest in Shattrath.")
	self:addLookupList(CustomDB, 8, "Learnt by default when learning the profession.")
	self:addLookupList(CustomDB, 9, "Recipe is created by Engineers.")
	self:addLookupList(CustomDB, 10, "Quest to obtain the recipe opens up after turning in the Head of Onyxia.")
	self:addLookupList(CustomDB, 11, "Obtained by clicking on a tablet in Zul'Gurub in the Edge of Madness.")
	self:addLookupList(CustomDB, 12, "Discovered by doing transmutes using Wrath of the Lich King ingredients.")

end

