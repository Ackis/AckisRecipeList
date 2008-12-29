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

	self:addLookupList(CustomDB, 1, "Discovered by making elixirs or flasks using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 2, "Discovered by making potions using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 3, "Discovered by doing transmutes using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 4, "Discovered by Major Protection Potions using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 5, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the meat crate.")
	self:addLookupList(CustomDB, 6, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the fish barrel.")
	self:addLookupList(CustomDB, 7, "Randomly obtained by completing the fishing daily quest in Shattrath.")
	self:addLookupList(CustomDB, 8, "Learnt by default when learning the profession.")
	self:addLookupList(CustomDB, 9, "Recipe is created by Engineers.")
	self:addLookupList(CustomDB, 10, "Quest to obtain the recipe opens up after turning in the Head of Onyxia.")
	self:addLookupList(CustomDB, 11, "Obtained by clicking on a tablet in Zul'Gurub in the Edge of Madness.")
	self:addLookupList(CustomDB, 12, "Discovered by doing transmutes using Wrath of the Lich King ingredients.")
	self:addLookupList(CustomDB, 13, "Goldthorn Tea Henry Stern.")
	self:addLookupList(CustomDB, 14, "Minor Inscription Research.")
	self:addLookupList(CustomDB, 15, "Northrend Inscription Research.")
	self:addLookupList(CustomDB, 16, "EngineeringRenewalReward.")
	self:addLookupList(CustomDB, 17, "The schematic can be found on the floor near Golem Lord Argelmach in Blackrock Depths. Only engineers with 300 skill may learn the schematic after clicking on it.")
	self:addLookupList(CustomDB, 18, "Northrend Alchemy Research.")
	self:addLookupList(CustomDB, 19, "Northrend Transmute.")
	self:addLookupList(CustomDB, 20, "Goblin transport.")
	self:addLookupList(CustomDB, 21, "Gnome transport.")
	self:addLookupList(CustomDB, 22, "Random BoP drop off of bosses in AQ40.")
	self:addLookupList(CustomDB, 23, "DM Cache - Knot Thimblejack")
	self:addLookupList(CustomDB, 24, "Sunwell Trash Drop")
	self:addLookupList(CustomDB, 25, "There is a chance that you find it in 5 different rooms in blackrock depths, its random spawn though, and sometimes it doesnt even spawn at all.")

end

