--[[

************************************************************************

ARL-Runeforge.lua

Runeforging data for all of Ackis Recipe List

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

--------------------------------------------------------------------------------------------------------------------
-- Item "rarity"
--------------------------------------------------------------------------------------------------------------------
local R_COMMON, R_UNCOMMON, R_RARE, R_EPIC, R_LEGENDARY, R_ARTIFACT = 1, 2, 3, 4, 5, 6

--------------------------------------------------------------------------------------------------------------------
-- Origin
--------------------------------------------------------------------------------------------------------------------
local GAME_ORIG, GAME_TBC, GAME_WOTLK = 0, 1, 2

--------------------------------------------------------------------------------------------------------------------
-- Filter flags
--------------------------------------------------------------------------------------------------------------------
local F_ALLIANCE, F_HORDE, F_TRAINER, F_VENDOR, F_INSTANCE, F_RAID = 1, 2, 3, 4, 5, 6
local F_SEASONAL, F_QUEST, F_PVP, F_WORLD_DROP, F_MOB_DROP, F_DISC = 7, 8, 9, 10, 11, 12
local F_DK, F_DRUID, F_HUNTER, F_MAGE, F_PALADIN, F_PRIEST, F_SHAMAN, F_ROGUE, F_WARLOCK, F_WARRIOR = 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
local F_IBOE, F_IBOP, F_IBOA, F_RBOE, F_RBOP, F_RBOA = 36, 37, 38, 40, 41, 42
local F_DPS, F_TANK, F_HEALER, F_CASTER = 51, 52, 53, 54
local F_CLOTH, F_LEATHER, F_MAIL, F_PLATE, F_CLOAK, F_TRINKET, F_RING, F_NECK, F_SHIELD = 56, 57, 58, 59, 60, 61, 62, 63, 64
local F_1H, F_2H, F_AXE, F_SWORD, F_MACE, F_POLEARM, F_DAGGER = 66, 67, 68, 69, 70, 71, 72
local F_STAFF, F_WAND, F_THROWN, F_BOW, F_XBOW, F_AMMO, F_FIST, F_GUN = 73, 74, 75, 76, 77, 78, 79, 80

--------------------------------------------------------------------------------------------------------------------
-- Reputation Filter flags
--------------------------------------------------------------------------------------------------------------------
local F_ARGENTDAWN, F_CENARION_CIRCLE, F_THORIUM_BROTHERHOOD, F_TIMBERMAW_HOLD, F_ZANDALAR = 96, 97, 98, 99, 100
local F_ALDOR, F_ASHTONGUE, F_CENARION_EXPEDITION, F_HELLFIRE, F_CONSORTIUM = 101, 102, 103, 104, 105
local F_KOT, F_LOWERCITY, F_NAGRAND, F_SCALE_SANDS, F_SCRYER, F_SHATAR = 106, 107, 108, 109, 110
local F_SHATTEREDSUN, F_SPOREGGAR, F_VIOLETEYE = 111, 112, 113, 114
local F_ARGENTCRUSADE, F_FRENZYHEART, F_EBONBLADE, F_KIRINTOR, F_HODIR = 115, 116, 117, 118, 119
local F_KALUAK, F_ORACLES, F_WYRMREST, F_WRATHCOMMON1, F_WRATHCOMMON2 = 120, 121, 122, 123, 124
local F_WRATHCOMMON3, F_WRATHCOMMON4, F_WRATHCOMMON5 = 125, 126, 127

--------------------------------------------------------------------------------------------------------------------
-- Acquire types
--------------------------------------------------------------------------------------------------------------------
local A_TRAINER, A_VENDOR, A_MOB, A_QUEST, A_SEASONAL, A_REPUTATION, A_WORLD_DROP, A_CUSTOM = 1, 2, 3, 4, 5, 6, 7, 8

--------------------------------------------------------------------------------------------------------------------
-- Reputation Acquire Flags
--------------------------------------------------------------------------------------------------------------------
local R_WINTERSPRING = 589

--------------------------------------------------------------------------------------------------------------------
-- Reputation Levels
--------------------------------------------------------------------------------------------------------------------
local FRIENDLY = 1
local HONORED = 2
local REVERED = 3
local EXALTED = 4


local initialized	= false

function addon:InitRuneforging(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Rune of the Fallen Crusader - 53344
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53344,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,53344,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Swordshattering - 53323
	self:addTradeSkill(RecipeDB,53323,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53323,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,53323,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Swordbreaking - 54446
	self:addTradeSkill(RecipeDB,54446,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,54446,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,54446,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Spellshattering - 53342
	self:addTradeSkill(RecipeDB,53342,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53342,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,53342,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Spellbreaking - 54447
	self:addTradeSkill(RecipeDB,54447,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,54447,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,54447,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Razorice - 53343
	self:addTradeSkill(RecipeDB,53343,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53343,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,53343,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Lichbane - 53331
	self:addTradeSkill(RecipeDB,53331,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53331,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,53331,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Cinderglacier - 53341
	self:addTradeSkill(RecipeDB,53341,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53341,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,53341,1,29194,1,29196,1,29195,1,31084)

	-- Rune of the Stoneskin Gargoyle - 62158
	self:addTradeSkill(RecipeDB,62158,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,62158,1,2,3,F_DK)
	self:addTradeAcquire(RecipeDB,62158,1,29194,1,29196,1,29195,1,31084)

	return 9

end
