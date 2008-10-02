--[[
************************************************************************
AckisRecipeList
$Date$
$Rev$

Author: Ackis on Illidan US Horde
GUI done by Zhinjio

************************************************************************

Please see Wowace.com for more information.

************************************************************************

Documentation:
	The mod is segmented into different files, based on what they do.

Localization:
	All the localization files are located in the "Locals" sub-
	directory.  Feel free to edit locals in any language, make the enUS
	more effecient, correct typos, etc.  All I would ask is if you do
	edit something, check in-game first to make sure the change works.

Graphical Interface:
	All the graphical interface functions are located in ARLFrame.lua.
	This file contains all the functions needed for the GUI.  If you
	have enhancements, know how to fix an issue, etc please feel free to
	contribute.  Just leave a detailed commit note.  If it's a new
	feature please run it by me first before adding anything.

Recipe Database:
	The recipe database (for professions, and beast skills) as well as
	the vendor data base are all located in the RecipeDB folder.  The
	basic format for the function to add recipes is:
	
	Spell ID, Skill Level, Obtain Information, Flags

	Spell ID is the IDs of the spell that creates the item.  For example,
	Robe of Winter Night is item ID 14136
		(http://www.wowdb.com/item.aspx?id=14136)
	It's created by spell ID 18436
		(http://www.wowdb.com/spell.aspx?id=18436)

	Skill level is the level of the profession in which you can learn
	the specified pattern.

	Obtain information is how the recipe is learned.  For world drops,
	it's as simple as listing the type of world drop, same for trainers.
	However, for monster drops, quest rewards, faction rewards, there is
	a function which will add the information in an easy to read format.

	Flags are different flags which allow me to filter out the recipes.
	These flags are defined as:
		-- ALLIANCE= Alliance faction only
		-- HORDE = Horde faction only
		-- 1 = Trainer
		-- 2 = Vendor
		-- 3 = Item BoE
		-- 4 = Item BoP
		-- 5 = Instance
		-- 6 = Raid
		-- 7 = Seasonal
		-- 8 = Quest
		-- 9 = PVP
		-- 10 = cloth
		-- 11 = leather
		-- 12 = mail
		-- 13 = plate
		-- 14 = physical dps (melee/hunters)
		-- 15 = tanking
		-- 16 = healing
		-- 17 = caster DPS
		-- 18 = world drop
		-- 19 = Recipe BoE
		-- 20 = Recipe BoP
		-- 21 = 1H
		-- 22 = 2H
		-- 23 = Cloak
		-- 24 = Trinket
		-- 25 = Ring
		-- 26 = Necklace
		-- 27 = Axe
		-- 28 = Sword
		-- 29 = Mace
		-- 30 = Polearm
		-- 31 = Dagger
		-- 32 = Staff
		-- 33 = Wand
		-- 34 = Thrown
		-- 35 = Bow
		-- 36 = Crossbow
		-- 37 = Ammo

	There are additional flags based off of:
		-- Reputation (All reps in the game that have recipes)
		-- Player class (All classes in the game)
		-- Player tradeskill speciality (All specific tradeskill specialities)

Feel free to update any recipes with flags, new recipes, correcting
the obtain information, etc.  Just please ensure you leave a detailed
commit note.

************************************************************************
SavedVariable Structure

addon.db.profile---->
	testgui = [true|false],								-- display Zhinjio's suckass gui
	includefiltered = [true|false],						-- include filtered recipes in totals
	closeguionskillclose = [true|false],				-- close the GUI when the skill frame closes
	sorting = ["Name"|"Skill"|"Acquisition"],			-- sort method in the gui
	filteredrecipes = {									
		"RecipeNameToNotDisplay",						-- a structure that holds recipes the user does
		"AnotherRecipeNameToNotDisplay",				-- not want to display
		...
	},
	filters = {
		general = {
			class = [true|false],						-- display all class specific recipes
			specialty = [true|false],					-- display all crafting specialty recipes
			skill = [true|false],						-- display all skill levels
			faction = [true|false],						-- display cross faction recipes
			known = [true|false],						-- display known recipes
			unknown = [true|false],						-- display unknown recipes
		},
		obtain = {
			instance = [true|false],					-- show recipes obtained from instances
			raid = [true|false],						-- show recipes obtained from raids
			quest = [true|false],						-- show recipes obtained from quests
			seasonal = [true|false],					-- show recipes obtained during seasonal events
			trainer = [true|false],						-- show recipes obtained from trainers
			vendor = [true|false],						-- show recipes obtained from vendors
			pvp = [true|false],							-- show recipes obtained from PVP
			discovery = [true|false],					-- show recipes obtained by discovery
			worlddrop = [true|false],					-- show recipes that are world drops
			mobdrop = [true|false],						-- show recipes that are specific mob drops
		},
		binding = {
			itembop = [true|false],						-- show recipes where the crafted item is BoP
			itemboe = [true|false],						-- show recipes where the crafted item is BoE
			recipebop = [true|false],					-- show recipes where the recipe itself is BoP
			recipeboe = [true|false],					-- show recipes where the recipe itself is BoE
		},
		item = {
			armor = {
				cloth = [true|false],					-- show recipes that create cloth armor items
				leather = [true|false],					-- show recipes that create leather armor items
				mail = [true|false],					-- show recipes that create mail armor items
				plate = [true|false],					-- show recipes that create plate armor items
				cloak = [true|false],					-- show recipes that create cloak items
				trinket = [true|false],					-- show recipes that create trinket items
				ring = [true|false],					-- show recipes that create ring items
				necklace = [true|false],				-- show recipes that create necklace items
			},
			weapon = {
				onehand = [true|false],					-- show recipes that create one-handed weapon items
				twohand = [true|false],					-- show recipes that create two-handed weapon items
				axe = [true|false],						-- show recipes that create axe weapon items
				sword = [true|false],					-- show recipes that create sword weapon items
				mace = [true|false],					-- show recipes that create mace weapon items
				polearm = [true|false],					-- show recipes that create polearm weapon items
				dagger = [true|false],					-- show recipes that create dagger weapon items
				staff = [true|false],					-- show recipes that create staff weapon items
				wand = [true|false],					-- show recipes that create wand items
				thrown = [true|false],					-- show recipes that create thrown weapon items
				bow = [true|false],						-- show recipes that create bow weapon items
				crossbow = [true|false],				-- show recipes that create crossbow weapon items
				ammo = [true|false],					-- show recipes that create ammunition
			},
		},
		player = {
			caster = [true|false],						-- show recipes that caster dps players can use
			melee = [true|false],						-- show recipes that melee dps players can use
			tank = [true|false],						-- show recipes that tank players can use
			healer = [true|false],						-- show recipes that healer players can use
		},
		rep = {
			aldor = [true|false],						-- show recipes obtained from aldir rep
			argentdawn = [true|false],					-- show recipes obtained from argent dawn rep
			ashtonguedeathsworn = [true|false],			-- show recipes obtained from ashtongue deathsworn rep
			cenarioncircle = [true|false],				-- show recipes obtained from cenarion circle rep
			cenarionexpedition = [true|false],			-- show recipes obtained from cenarion expedition rep
			hellfire = [true|false],					-- show recipes obtained from (honor hold / thrallmar) rep
			consortium = [true|false],					-- show recipes obtained from consortium rep
			keepersoftime = [true|false],				-- show recipes obtained from keepers of time rep
			lowercity = [true|false],					-- show recipes obtained from lower city rep
			nagrand = [true|false],						-- show recipes obtained from (kurenai / mag'har) rep
			scaleofthesands = [true|false],				-- show recipes obtained from scale of the sands rep
			scryer = [true|false],						-- show recipes obtained from scryer rep
			shatar = [true|false],						-- show recipes obtained from sha'tar rep
			shatteredsun = [true|false],				-- show recipes obtained from shattered sun offensive rep
			sporeggar = [true|false],					-- show recipes obtained from sporeggar rep
			thoriumbrotherhood = [true|false],			-- show recipes obtained from thorium brotherhood rep
			timbermaw = [true|false],					-- show recipes obtained from timbermaw hold rep
			violeteye = [true|false],					-- show recipes obtained from violet eye rep
			zandalar = [true|false],					-- show recipes obtained from zandalar tribe rep
		}
	}

************************************************************************
--]]

local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local L			= LibStub("AceLocale-3.0"):GetLocale("Ackis Recipe List")

AckisRecipeList = LibStub("AceAddon-3.0"):NewAddon("Ackis Recipe List", "AceConsole-3.0", "AceEvent-3.0")

local addon = AckisRecipeList

-- Global variables which are used between multiple files
addon.RecipeListing = nil
addon.SortedRecipeIndex = nil
addon.VendorList = nil
addon.PetList = nil
addon.SkillType = nil
addon.FoundRecipes = nil
addon.FilteredRecipes = nil
addon.NumberOfRecipes = nil
addon.ResetOkayBlizz = nil
addon.ResetOkayARL = nil
addon.wrath = false
-- To make tabbing between professions easier
addon.KnownProfessions = {
	["Alchemy"] = false,
	["Blacksmithing"] = false,
	["Cooking"] = false,
	["Enchanting"] = false,
	["Engineering"] = false,
	["First Aid"] = false,
	["Leatherworking"] = false,
	["Poisons"]	= false,
	["Smelting"] = false,
	["Tailoring"] = false,
	["Jewelcrafting"] = false,
	["Beast Training"] = false,
	["Inscription"] = false,
}
addon.SortedProfessions = {
	{ name = "Alchemy",			texture = "alchemy" },		-- 1
	{ name = "Beast Training",	texture = "beast" },		-- 2
	{ name = "Blacksmithing",	texture = "blacksmith" },	-- 3
	{ name = "Cooking",			texture = "cooking" },		-- 4
	{ name = "Enchanting",		texture = "enchant" },		-- 5
	{ name = "Engineering",		texture = "engineer" },		-- 6
	{ name = "First Aid",		texture = "firstaid" },		-- 7
	{ name = "Inscribing",		texture = "inscribe" },		-- 8
	{ name = "Jewelcrafting",	texture = "jewel" },		-- 9
	{ name = "Leatherworking",	texture = "leather" },		-- 10
	{ name = "Poisons",			texture = "poison" },		-- 11
	{ name = "Smelting",		texture = "smelting" },		-- 12
	{ name = "Tailoring",		texture = "tailor" },		-- 13
}
addon.MaxProfessions = 13
addon.CurrentProf = 0
addon.CurrentProfession = ""
addon.maxVisibleRecipes = 19
addon.ExpTextureSize = 34
addon.HonorHold_Thrallmar_FactionText = ""
addon.Kurenai_Maghar_FactionText = ""
addon.FilterValueMap = {}
addon.MaxFilterIndex = 68

-- Frame variables
addon.ScanButton = nil
addon.Frame = nil

-- Make global API calls local to speed things up
local GetNumCrafts = GetNumCrafts
local GetNumTradeSkills = GetNumTradeSkills
local GetSpellInfo = GetSpellInfo
local GetSpellName = GetSpellName
local GetCraftInfo = GetCraftInfo
local GetCraftName = GetCraftName
local GetTradeSkillLine = GetTradeSkillLine
local GetTradeSkillInfo = GetTradeSkillInfo
local CraftIsPetTraining = CraftIsPetTraining
local GetDifficultyColor= GetDifficultyColor
local select = select
local format = format
local string = string
local tostring = tostring
local tonumber = tonumber
local pairs = pairs
local table = table
local next = next
local UnitLevel = UnitLevel
local UnitClass = UnitClass
local InterfaceOptionsFrame_OpenToFrame = InterfaceOptionsFrame_OpenToFrame
local BOOKTYPE_SPELL = BOOKTYPE_SPELL

-- We use playerFaction quite often, lets just get it once and reuse it
local playerFaction = UnitFactionGroup("player")

-- Constants which are used everytime the add-on is loaded

-- New Shiny addonversion without Revision
local addonversion = GetAddOnMetadata("AckisRecipeList", "Version")
local nagrandfac = BFAC["Kurenai"] .. "\\" .. BFAC["The Mag'har"]
local hellfirefac = BFAC["Honor Hold"] .. "\\" .. BFAC["Thrallmar"]
local factionlevels = {}

-- Global constants which are used between multiple files
addon.ARLTitle = "ARL (v." .. addonversion .. ")"
addon.FullTitle = "Ackis Recipe List (v." .. addonversion .. ")"

-- We use line breaks quite often lets make it a constant send you can't use \t in WoW
addon.br = "\n    - "

--[[

	Configuration Options

]]--

-- Returns configuration options for ARL
local function giveOptions()

	local command_options = {
	    type = "group",
	    args =
		{
			header1 =
			{
				order = 5,
				type = "header",
				name = "",
			},
			version =
			{
				order = 5,
				type = "description",
				name = L["Version"] .. addonversion .. "\n",
			},
			run = 
			{
				type = "execute",
				name = L["Scan Recipes"],
				desc = L["Scans an open tradeskill for missing recipes."],
				func = function(info) addon:AckisRecipeList_Command() end,
				order = 50,
			},
			textdump = 
			{
				type = "execute",
				name = L["Text Dump"],
				desc = L["Displays all recipes in a comma seperated value format which can be copied and pasted into another client."],
				func = function(info) addon:TextDump() end,
				order = 55,
			},
		}
	}

	return command_options

end

-- Returns configuration options for profiling
local function giveProfiles()

	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(addon.db)
	return profiles

end

-- Returns configuration options for display
local function giveDisplay()

	local display =
	{
		type = "group",
		name = L["Display"],
		desc = L["DISPLAY_OPTIONS"],
		order = 1,
		args =
		{
			desc =
			{
				order = 1,
				type = "description",
				name = L["DISPLAY_OPTIONS"] .. "\n",
			},
			longdesc = 
			{
				order = 2,
				type = "description",
				name = L["DISPLAY_OPTIONS_LONG"] .. "\n",
			},
			testgui =
			{
				name	= "Test GUI",
				desc	= "New test GUI don't use this please.",
				type	= "toggle",
				get		= function() return addon.db.profile.testgui end,
				set		= function() addon.db.profile.testgui = not addon.db.profile.testgui end,
				order	= 6,
			},
			includefiltered =
			{
				name	= L["Include Filtered"],
				desc	= L["FILTERCOUNT_TOGGLE"],
				type	= "toggle",
				get		= function() return addon.db.profile.includefiltered end,
				set		= function() addon.db.profile.includefiltered = not addon.db.profile.includefiltered end,
				order	= 4,
			},
			closegui =
			{
				name	= L["Close GUI"],
				desc	= L["CLOSEGUI_TOGGLE"],
				type	= "toggle",
				get		= function() return addon.db.profile.closeguionskillclose end,
				set		= function() addon.db.profile.closeguionskillclose = not addon.db.profile.closeguionskillclose end,
				order	= 5,
			},
		}
	}

	return display

end

-- Returns configuraion options for filter
local function giveFilter()

	local filter =
	{
		type = "group",
		name = L["Filter"],
		desc = L["FILTER_OPTIONS"],
		order = 2,
		args =
		{
			desc =
			{
				order = 1,
				type = "description",
				name = L["FILTER_OPTIONS"] .. "\n",
			},
			longdesc = 
			{
				order = 2,
				type = "description",
				name = L["FILTER_OPTIONS_LONG"] .. "\n",
			},
			factions =
			{
				name	= L["Faction"],
				desc	= L["FACTION_TOGGLE"],
				type	= "toggle",
				get		= function() return addon.db.profile.filters.general.faction end,
				set		= function() addon.db.profile.filters.general.faction = not addon.db.profile.filters.general.faction end,
				order	= 5,
			},
			classes =
			{
				name      = L["Classes"],
				desc      = L["CLASS_TOGGLE"],
				type      = "toggle",
				get       = function() return addon.db.profile.filters.general.class end,
				set       = function() addon.db.profile.filters.general.class = not addon.db.profile.filters.general.class end,
				order     = 10,
			},
			specialities =
			{
				name      = L["Specialities"],
				desc      = L["SPECIALITY_TOGGLE"],
				type      = "toggle",
				get       = function() return addon.db.profile.filters.general.specialty end,
				set       = function() addon.db.profile.filters.general.specialty = not addon.db.profile.filters.general.specialty end,
				order     = 15,
			},
			skill =
			{
				name      = L["Skill"],
				desc      = L["SKILL_TOGGLE"],
				type      = "toggle",
				get       = function() return addon.db.profile.filters.general.skill end,
				set       = function() addon.db.profile.filters.general.skill = not addon.db.profile.filters.general.skill end,
				order     = 20,
			},
			armour =
			{
				type = "group",
				name = L["Armour"],
				desc = L["ARMOUR_OPTIONS"],
				order = 29,
				args =
				{
					desc =
					{
						order = 1,
						type = "description",
						name = L["ARMOUR_OPTIONS"] .. "\n",
					},
					longdesc = 
					{
						order = 2,
						type = "description",
						name = L["ARMOUR_OPTIONS_LONG"] .. "\n",
					},
					cloth =
					{
						name      = L["Cloth"],
						desc      = L["CLOTH_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.cloth end,
						set       = function() addon.db.profile.filters.item.armor.cloth = not addon.db.profile.filters.item.armor.cloth end,
						order     = 90,
					},
					leather =
					{
						name      = L["Leather"],
						desc      = L["LEATHER_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.leather end,
						set       = function() addon.db.profile.filters.item.armor.leather = not addon.db.profile.filters.item.armor.leather end,
						order     = 91,
					},
					mail =
					{
						name      = L["Mail"],
						desc      = L["MAIL_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.mail end,
						set       = function() addon.db.profile.filters.item.armor.mail = not addon.db.profile.filters.item.armor.mail end,
						order     = 92,
					},
					plate =
					{
						name      = L["Plate"],
						desc      = L["PLATE_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.plate end,
						set       = function() addon.db.profile.filters.item.armor.plate = not addon.db.profile.filters.item.armor.plate end,
						order     = 93,
					},
					cloak =
					{
						name      = L["Cloak"],
						desc      = L["CLOAK_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.cloak end,
						set       = function() addon.db.profile.filters.item.armor.cloak = not addon.db.profile.filters.item.armor.cloak end,
						order     = 94,
					},
					ring =
					{
						name      = L["Ring"],
						desc      = L["RING_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.ring end,
						set       = function() addon.db.profile.filters.item.armor.ring = not addon.db.profile.filters.item.armor.ring end,
						order     = 95,
					},
					trinket =
					{
						name      = L["Trinket"],
						desc      = L["TRINKET_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.trinket end,
						set       = function() addon.db.profile.filters.item.armor.trinket = not addon.db.profile.filters.item.armor.trinket end,
						order     = 96,
					},
					necklace =
					{
						name      = L["Necklace"],
						desc      = L["NECKLACE_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.item.armor.necklace end,
						set       = function() addon.db.profile.filters.item.armor.necklace = not addon.db.profile.filters.item.armor.necklace end,
						order     = 97,
					},
				}
			},
			binding =
			{
				type = "group",
				name = L["Binding"],
				desc = L["BINDING_OPTIONS"],
				order = 30,
				args =
				{
					desc =
					{
						order = 1,
						type = "description",
						name = L["BINDING_OPTIONS"] .. "\n",
					},
					longdesc = 
					{
						order = 2,
						type = "description",
						name = L["BINDING_OPTIONS_LONG"] .. "\n",
					},
					BOE =
					{
						name	= L["BOEFilter"],
						desc	= L["BOE_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.binding.itemboe end,
						set		= function() addon.db.profile.filters.binding.itemboe = not addon.db.profile.filters.binding.itemboe end,
						order	= 5,
					},
					BOP =
					{
						name	= L["BOPFilter"],
						desc	= L["BOP_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.binding.itembop end,
						set		= function() addon.db.profile.filters.binding.itembop = not addon.db.profile.filters.binding.itembop end,
						order	= 6,
					},
					RecipeBOE =
					{
						name	= L["RecipeBOEFilter"],
						desc	= L["RECIPE_BOE_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.binding.recipeboe end,
						set		= function() addon.db.profile.filters.binding.recipeboe = not addon.db.profile.filters.binding.recipeboe end,
						order	= 7,
					},
					RecipeBOP =
					{
						name	= L["RecipeBOPFilter"],
						desc	= L["RECIPE_BOP_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.binding.recipebop end,
						set		= function() addon.db.profile.filters.binding.recipebop = not addon.db.profile.filters.binding.recipebop end,
						order	= 8,
					},
				}
			},
			crafting =
			{
				type = "group",
				name = L["Crafting"],
				desc = L["CRAFTING_OPTIONS"],
				order = 35,
				args =
				{
					desc =
					{
						order = 1,
						type = "description",
						name = L["CRAFTING_OPTIONS"] .. "\n",
					},
					longdesc = 
					{
						order = 2,
						type = "description",
						name = L["CRAFTING_OPTIONS_LONG"] .. "\n",
					},
					melee =
					{
						name      = L["Melee"],
						desc      = L["MELEE_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.player.melee end,
						set       = function() addon.db.profile.filters.player.melee = not addon.db.profile.filters.player.melee end,
						order     = 5,
					},
					tanking =
					{
						name      = L["Tanking"],
						desc      = L["TANKING_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.player.tank end,
						set       = function() addon.db.profile.filters.player.tank = not addon.db.profile.filters.player.tank end,
						order     = 10,
					},
					casterdps =
					{
						name      = L["Caster DPS"],
						desc      = L["CASTERDPS_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.player.caster end,
						set       = function() addon.db.profile.filters.player.caster = not addon.db.profile.filters.player.caster end,
						order     = 15,
					},
					healing =
					{
						name      = L["Healing"],
						desc      = L["HEALING_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.player.healer end,
						set       = function() addon.db.profile.filters.player.healer = not addon.db.profile.filters.player.healer end,
						order     = 20,
					},
				}
			},
			obtain =
			{
				type = "group",
				name = L["Obtain"],
				desc = L["OBTAIN_OPTIONS"],
				order = 40,
				args =
				{
					desc =
					{
						order = 1,
						type = "description",
						name = L["OBTAIN_OPTIONS"] .. "\n",
					},
					longdesc = 
					{
						order = 2,
						type = "description",
						name = L["OBTAIN_OPTIONS_LONG"] .. "\n",
					},
					instance =
					{
						name	= L["Instance"],
						desc	= L["INSTANCE_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.obtain.instance end,
						set		= function() addon.db.profile.filters.obtain.instance = not addon.db.profile.filters.obtain.instance end,
						order	= 10,
					},
					raid =
					{
						name      = L["Raid"],
						desc      = L["RAID_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.raid end,
						set       = function() addon.db.profile.filters.obtain.raid = not addon.db.profile.filters.obtain.raid end,
						order     = 11,
					},
					PVP =
					{
						name	= L["PVP"],
						desc	= L["PVP_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.obtain.pvp end,
						set		= function() addon.db.profile.filters.obtain.pvp = not addon.db.profile.filters.obtain.pvp end,
						order	= 20,
					},
					quest =
					{
						name	= L["Quest"],
						desc	= L["QUEST_TOGGLE"],
						type	= "toggle",
						get		= function() return addon.db.profile.filters.obtain.quest end,
						set		= function() addon.db.profile.filters.obtain.quest = not addon.db.profile.filters.obtain.quest end,
						order	= 30,
					},
					trainer =
					{
						name      = L["Trainer"],
						desc      = L["TRAINER_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.trainer end,
						set       = function() addon.db.profile.filters.obtain.trainer = not addon.db.profile.filters.obtain.trainer end,
						order     = 60,
					},
					vendor =
					{
						name      = L["Vendor"],
						desc      = L["VENDOR_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.vendor end,
						set       = function() addon.db.profile.filters.obtain.vendor = not addon.db.profile.filters.obtain.vendor end,
						order     = 70,
					},
					seasonal =
					{
						name      = L["Seasonal"],
						desc      = L["SEASONAL_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.seasonal end,
						set       = function() addon.db.profile.filters.obtain.seasonal = not addon.db.profile.filters.obtain.seasonal end,
						order     = 80,
					},
					discovery =
					{
						name      = L["Discovery"],
						desc      = L["DISCOVERY_TT"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.discovery end,
						set       = function() addon.db.profile.filters.obtain.discovery = not addon.db.profile.filters.obtain.discovery end,
						order     = 81,
					},
					worlddrop =
					{
						name      = L["World Drop"],
						desc      = L["WORLD_DROP_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.worlddrop end,
						set       = function() addon.db.profile.filters.obtain.worlddrop = not addon.db.profile.filters.obtain.worlddrop end,
						order     = 82,
					},
					mobdrop =
					{
						name      = L["Mob Drop"],
						desc      = L["MOB_DROP_TOGGLE"],
						type      = "toggle",
						get       = function() return addon.db.profile.filters.obtain.mobdrop end,
						set       = function() addon.db.profile.filters.obtain.mobdrop = not addon.db.profile.filters.obtain.mobdrop end,
						order     = 83,
					},
				}
			},
			reputations =
			{
				type = "group",
				name = L["Reputation"],
				desc = L["REP_OPTIONS"],
				order = 45,
				args =
				{
					desc =
					{
						order = 1,
						type = "description",
						name = L["REP_OPTIONS"] .. "\n",
					},
					longdesc = 
					{
						order = 2,
						type = "description",
						name = L["REP_OPTIONS_LONG"] .. "\n",
					},
					oldworld =
					{
						type = "group",
						name = L["Old World"],
						desc = L["OLDWORLD_OPTIONS"],
						order = 5,
						args =
						{
							desc =
							{
								order = 1,
								type = "description",
								name = L["OLDWORLD_OPTIONS"] .. "\n",
							},
							longdesc = 
							{
								order = 2,
								type = "description",
								name = L["OLDWORLD_OPTIONS_LONG"] .. "\n",
							},
							ArgentDawn =
							{
								name	= BFAC["Argent Dawn"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Argent Dawn"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.argentdawn end,
								set		= function() addon.db.profile.filters.rep.argentdawn = not addon.db.profile.filters.rep.argentdawn end,
								order	= 3,
							},
							CenarionCircle =
							{
								name	= BFAC["Cenarion Circle"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Cenarion Circle"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.cenarioncircle end,
								set		= function() addon.db.profile.filters.rep.cenarioncircle = not addon.db.profile.filters.rep.cenarioncircle end,
								order	= 15,
							},
							TB =
							{
								name	= BFAC["Thorium Brotherhood"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Thorium Brotherhood"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.thoriumbrotherhood end,
								set		= function() addon.db.profile.filters.rep.thoriumbrotherhood = not addon.db.profile.filters.rep.thoriumbrotherhood end,
								order	= 75,
							},
							Timbermaw =
							{
								name	= BFAC["Timbermaw Hold"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Timbermaw Hold"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.timbermaw end,
								set		= function() addon.db.profile.filters.rep.timbermaw = not addon.db.profile.filters.rep.timbermaw end,
								order	= 80,
							},
							Zandalar =
							{
								name	= BFAC["Zandalar Tribe"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Zandalar Tribe"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.zandalar end,
								set		= function() addon.db.profile.filters.rep.zandalar = not addon.db.profile.filters.rep.zandalar end,
								order	= 90,
							},
						},
					},
					BC =
					{
						type = "group",
						name = L["Burning Crusade"],
						desc = L["BC_OPTIONS"],
						order = 10,
						args =
						{
							desc =
							{
								order = 1,
								type = "description",
								name = L["BC_OPTIONS"] .. "\n",
							},
							longdesc = 
							{
								order = 2,
								type = "description",
								name = L["BC_OPTIONS_LONG"] .. "\n",
							},
							Aldor =
							{
								name	= BFAC["The Aldor"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["The Aldor"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.aldor end,
								set		= function() addon.db.profile.filters.rep.aldor = not addon.db.profile.filters.rep.aldor end,
								order	= 3,
							},
							Ashtongue =
							{
								name	= BFAC["Ashtongue Deathsworn"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Ashtongue Deathsworn"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.ashtonguedeathsworn end,
								set		= function() addon.db.profile.filters.rep.ashtonguedeathsworn = not addon.db.profile.filters.rep.ashtonguedeathsworn end,
								order	= 10,
							},
							CenarionExpedition =
							{
								name	= BFAC["Cenarion Expedition"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Cenarion Expedition"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.cenarionexpedition end,
								set		= function() addon.db.profile.filters.rep.cenarionexpedition = not addon.db.profile.filters.rep.cenarionexpedition end,
								order	= 20,
							},
							Consortium =
							{
								name	= BFAC["The Consortium"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["The Consortium"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.consortium end,
								set		= function() addon.db.profile.filters.rep.consortium = not addon.db.profile.filters.rep.consortium end,
								order	= 25,
							},
							HellfireFactions =
							{
								name	= hellfirefac,
								desc	= format(L["SPECIFIC_REP_TOGGLE"],hellfirefac),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.hellfire end,
								set		= function() addon.db.profile.filters.rep.hellfire = not addon.db.profile.filters.rep.hellfire end,
								order	= 30,
							},
							KoT =
							{
								name	= BFAC["Keepers of Time"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Keepers of Time"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.keepersoftime end,
								set		= function() addon.db.profile.filters.rep.keepersoftime = not addon.db.profile.filters.rep.keepersoftime end,
								order	= 35,
							},
							NagrandFactions =
							{
								name	= nagrandfac,
								desc	= format(L["SPECIFIC_REP_TOGGLE"],nagrandfac),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.nagrand end,
								set		= function() addon.db.profile.filters.rep.nagrand = not addon.db.profile.filters.rep.nagrand end,
								order	= 40,
							},
							LowerCity =
							{
								name	= BFAC["Lower City"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Lower City"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.lowercity end,
								set		= function() addon.db.profile.filters.rep.lowercity = not addon.db.profile.filters.rep.lowercity end,
								order	= 45,
							},
							Scale =
							{
								name	= BFAC["The Scale of the Sands"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["The Scale of the Sands"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.scaleofthesands end,
								set		= function() addon.db.profile.filters.rep.scaleofthesands = not addon.db.profile.filters.rep.scaleofthesands end,
								order	= 50,
							},
							Scryer =
							{
								name	= BFAC["The Scryers"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["The Scryers"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.scryer end,
								set		= function() addon.db.profile.filters.rep.scryer = not addon.db.profile.filters.rep.scryer end,
								order	= 55,
							},
							Shatar =
							{
								name	= BFAC["The Sha'tar"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["The Sha'tar"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.shatar end,
								set		= function() addon.db.profile.filters.rep.shatar = not addon.db.profile.filters.rep.shatar end,
								order	= 60,
							},
							SSO =
							{
								name	= BFAC["Shattered Sun Offensive"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Shattered Sun Offensive"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.shatteredsun end,
								set		= function() addon.db.profile.filters.rep.shatteredsun = not addon.db.profile.filters.rep.shatteredsun end,
								order	= 65,
							},
							Sporeggar =
							{
								name	= BFAC["Sporeggar"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["Sporeggar"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.sporeggar end,
								set		= function() addon.db.profile.filters.rep.sporeggar = not addon.db.profile.filters.rep.sporeggar end,
								order	= 70,
							},
							Violeteye =
							{
								name	= BFAC["The Violet Eye"],
								desc	= format(L["SPECIFIC_REP_TOGGLE"],BFAC["The Violet Eye"]),
								type	= "toggle",
								get		= function() return addon.db.profile.filters.rep.violeteye end,
								set		= function() addon.db.profile.filters.rep.violeteye = not addon.db.profile.filters.rep.violeteye end,
								order	= 85,
							},
						}
					},
					WotLK =
					{
						type = "group",
						name = L["Wrath of the Lich King"],
						desc = L["WOTLK_OPTIONS"],
						order = 15,
						args =
						{
							desc =
							{
								order = 1,
								type = "description",
								name = L["WOTLK_OPTIONS"] .. "\n",
							},
							longdesc = 
							{
								order = 2,
								type = "description",
								name = L["WOTLK_OPTIONS_LONG"] .. "\n",
							},
						}
					},
				}
			},
		}
	}

	return filter

end

-- Returns configuraion options for sorintg
local function giveSorting()

	addon:Print("Debug: Sorting parameters called")

	local sortlist = {L["Name"], L["Skill"], L["Acquisition"]}

	local sorting =
	{
		type = "group",
		name = L["Sort"],
		desc = L["SORT_OPTIONS"],
		order = 2,
		args =
		{
			desc =
			{
				order = 1,
				type = "description",
				name = L["SORT_OPTIONS"] .. "\n",
			},
			longdesc =
			{
				order = 2,
				type = "description",
				name = L["SORT_OPTIONS_LONG"] .. "\n",
			},
			sorting = {
				name	= L["Sort"],
				desc	= L["SORT_OPTIONS"],
				type	= "select",
				values	= function() return sortlist end,
				get		= function() return addon.db.profile.sortmethod end,
				set		= function(info,name) addon.db.profile.sortmethod = name end,
				order	= 3,
				},
		},
	}

	return sorting

end

--[[

	Saved variables functions

]]--


--[[

	Reset functions

]]--

-- Reset all variables

function addon:ResetVariables()

	addon.RecipeListing = nil

	addon.SkillType = nil
	addon.FoundRecipes = nil
	addon.NumberOfRecipes = nil
	addon.FilteredRecipes = nil

end

-- Initializes the initial recipe array, reseting it completely.

function addon:InitializeRecipeArray()

	-- Reset namespace to be empty
	addon.RecipeListing = {}

	-- Sets the total number of recipes to 0.
	addon.NumberOfRecipes = 0

	-- Sets the number of found recipes to 0.
	addon.FoundRecipes = 0

	-- Sets number of filtered recipes to 0
	addon.FilteredRecipes = 0

end

--[[

	Initialization functions

]]--

-- Register slash commands and profile defaults

function addon:OnInitialize()

	local AceConfig = LibStub("AceConfig-3.0")
	local AceConfigReg = LibStub("AceConfigRegistry-3.0")
	local AceConfigDialog = LibStub("AceConfigDialog-3.0")

	-- Defaults to char
	--self.db = LibStub("AceDB-3.0"):New("ARL-1-DB", defaults, "char")
	self.db = LibStub("AceDB-3.0"):New("ARLDB")

	-- Create the options with Ace3
	AceConfig:RegisterOptionsTable("Ackis Recipe List",giveOptions)
	AceConfigReg:RegisterOptionsTable("Ackis Recipe List Display",giveDisplay)
	AceConfigReg:RegisterOptionsTable("Ackis Recipe List Sorting",giveSorting)
	AceConfigReg:RegisterOptionsTable("Ackis Recipe List Filter",giveFilter)
	AceConfigReg:RegisterOptionsTable("Ackis Recipe List Profile",giveProfiles)

	-- Add the options to blizzard frame (add them backwards so they show up in the proper order
	self.optionsFrame = AceConfigDialog:AddToBlizOptions("Ackis Recipe List","Ackis Recipe List")
	self.optionsFrame[L["About"]] = LibStub("LibAboutPanel").new("Ackis Recipe List", "Ackis Recipe List")
	self.optionsFrame[L["Display"]] = AceConfigDialog:AddToBlizOptions("Ackis Recipe List Display", L["Display"], "Ackis Recipe List")
	self.optionsFrame[L["Filter"]] = AceConfigDialog:AddToBlizOptions("Ackis Recipe List Filter", L["Filter"], "Ackis Recipe List")
	self.optionsFrame[L["Sort"]] = AceConfigDialog:AddToBlizOptions("Ackis Recipe List Sorting", L["Sort"], "Ackis Recipe List")
	self.optionsFrame[L["Profile"]] = AceConfigDialog:AddToBlizOptions("Ackis Recipe List Profile", L["Profile"], "Ackis Recipe List")

	-- Register slash commands
	self:RegisterChatCommand("arl", "ChatCommand")

	-- Set default options, which are to include everything in the scan
	self.db:RegisterDefaults(
	{
		profile = {
			-- Sorting Options
			sortmethod = 2,

			-- Display Options
			usegui = true,
			includefiltered = false,
			closeguionskillclose = false,
			testgui = false,

			-- Filter Options
			filters = {
				general = {			-- General Filters
				    faction = true,
					class = false,
					specialty = false,
					skill = true,
					known = false,
					unknown = true,
				},
				obtain = {			-- Obtain Options
					trainer = true,
					vendor = true,
					instance = true,
					raid = true,
					seasonal = true,
					quest = true,
					pvp = true,
					discovery = true,
					worlddrop = true,
					mobdrop = true,
				},
				item = {			-- Item Filters (Armor/Weapon)
					armor = {
						cloth = true,
						leather = true,
						mail = true,
						plate = true,
						trinket = true,
						cloak = true,
						ring = true,
						necklace = true,
					},
					weapon = {
						onehand = true,
						twohand = true,
						axe = true,
						sword = true,
						mace = true,
						polearm = true,
						dagger = true,
						staff = true,
						wand = true,
						thrown = true,
						bow = true,
						crossbow = true,
						ammo = true,
					},
				},
				binding = {
					itemboe = true,
					itembop = true,
					recipebop = true,
					recipeboe = true,
				},
				player = {
					melee = true,
					tank = true,
					healer = true,
					caster = true,
				},
				rep = {			-- Reputation Options
					aldor = true,
					scryer = true,
					argentdawn = true,
					ashtonguedeathsworn = true,
					cenarioncircle = true,
					cenarionexpedition = true,
					consortium = true,
					hellfire = true,
					keepersoftime = true,
					nagrand = true,
					lowercity = true,
					scaleofthesands = true,
					shatar = true,
					shatteredsun = true,
					sporeggar = true,
					thoriumbrotherhood = true,
					timbermaw = true,
					violeteye = true,
					zandalar = true,
				}
			}
		}
	} )

	-- Populate the repuatation level
	self:GetFactionLevels()

end

-- Register events and create the scan button on enable

function addon:OnEnable()

	-- Make addon respond to the tradeskill and crafting windows being shown
	self:RegisterEvent("TRADE_SKILL_SHOW")
	self:RegisterEvent("CRAFT_SHOW")

	-- Addon responds to tradeskill and crafting windows being closed.
	self:RegisterEvent("CRAFT_CLOSE")
	self:RegisterEvent("TRADE_SKILL_CLOSE")

	-- Add an option so that ARL will work with Manufac
	if Manufac then
		Manufac.options.args.ARLScan = {
			type = 'execute',
			name = L["Scan Skills"],
			desc = L["Scan Skills Long"],
			func = function() addon:AckisRecipeList_Command() end,
			order = 550,
		}
	end

	local _, _, _, ver = GetBuildInfo()
	if ver >= 30000 then
		self:Print("Enabling WotLK compatibility")
		addon.wrath = true
	end

	--Create the button now for later use
	self:CreateScanButton()

end

-- Hides the frame if the mod gets disabled

function addon:OnDisable()

	self:ResetVariables()
	addon.VendorList = nil
	addon.PetList = nil

	if addon.Frame then
		addon.Frame:Hide()
	end

	-- Remove the option from Manufac
	if Manufac then
		Manufac.options.args.ARLScan = nil
	end

end

-- Watch for the trade skill window to be shown, add all specific trade skills to an array, then scan the trade skill window for all recipes.

function addon:TRADE_SKILL_SHOW()

	-- If we don't have a skill window open already
	if (Skillet and Skillet:IsActive()) or (ATSWFrame) or (addon.SkillType == nil or addon.SkillType == "Trade") then

		addon.SkillType = "Trade"
		addon.ResetOkayBlizz = false

		if (addon.ScanButton and not Skillet) then
			self:ShowScanButton()
		end

	else

		self:Print(L["TwoCraftingWindows"])

	end

end

-- Clean up tables from memory when trade skill window is closed

function addon:TRADE_SKILL_CLOSE()

	addon.ResetOkayBlizz = true
	addon.SkillType = nil

	if (addon.ResetOkayBlizz and addon.ResetOkayARL) then
		self:ResetVariables()
	end

	if (addon.db.profile.closeguionskillclose and addon.Frame) then
		self:CloseWindow()
	end

	if (addon.ScanButton and not Skillet) then
		addon.ScanButton:Hide()
	end

end

-- Watch for the craft skill window to be shown, add all specific trade skills to an array, then scan the craft skill window for all recipes.

function addon:CRAFT_SHOW()

	-- If we don't have a skill window open already
	if (Skillet and Skillet:IsActive()) or (ATSWFrame) or (addon.SkillType == nil or addon.SkillType == "Craft") then

		addon.SkillType = "Craft"
		addon.ResetOkayBlizz = false

		if (addon.ScanButton and (not Skillet or CraftIsPetTraining())) then
			self:ShowScanButton()
		end

	else

		self:Print(L["TwoCraftingWindows"])

	end

end

-- Clean up tables from memory when craft window is closed

function addon:CRAFT_CLOSE()

	addon.ResetOkayBlizz = true
	addon.SkillType = nil

	if (addon.ResetOkayBlizz and addon.ResetOkayARL) then
		self:ResetVariables()
	end

	if (addon.db.profile.closeguionskillclose and addon.Frame) then
		self:CloseWindow()
	end

	if (addon.ScanButton and not Skillet) then
		addon.ScanButton:Hide()
	end

end

-- Slash command handler

function addon:ChatCommand(input)

	if (addon.wrath) then
		InterfaceOptionsFrame_OpenToFrame(self.optionsFrame[L["About"]])
	else

		if (not input) or (input and input:trim() == "") or (input == string.lower(L["About"])) then
			-- Open About panel if there's no parameters
			InterfaceOptionsFrame_OpenToFrame(self.optionsFrame[L["About"]])
			--InterfaceOptionsFrame_OpenToFrame(self.optionsFrame)
		elseif (input == string.lower(L["Sort"])) then
			InterfaceOptionsFrame_OpenToFrame(self.optionsFrame[L["Sort"]])
		elseif (input == string.lower(L["Filter"])) then
			InterfaceOptionsFrame_OpenToFrame(self.optionsFrame[L["Filter"]])
		elseif (input == string.lower(L["Display"])) then
			InterfaceOptionsFrame_OpenToFrame(self.optionsFrame[L["Display"]])
		elseif (input == string.lower(L["Profile"])) then
			InterfaceOptionsFrame_OpenToFrame(self.optionsFrame[L["Profile"]])
		else
			LibStub("AceConfigCmd-3.0"):HandleCommand("arl", "Ackis Recipe List", input)
		end

	end

end

--[[

	Tradeskill functions

]]--

-- Adds a specifc recipe to the recipe list array. 

function addon:addTradeSkill(RecipeName, RecipeLevel, RecipeAcquire, RecipeLink, ...)

	--[[

	************************************************************************

	Recipe Array Structure:
	
	SpellID = {
		Level - Skill level at which you can learn the recipe
		RecipeLink - String containing the recipe link
		Known - Boolean determining if you know the recipe
		Display - Boolean determing if we display the recipe or not
		Item - ID of the item created by the recipe
		Name - Name of the recipe
		Acquire = {
			ID = {
				Type - Type of acquire (vendor, trainer, mob, quest, faction)
				Name - Name of acquire info
				Location - World location
				Coords - Specific coordinates
				Faction - Faction information (neutral/horde/alliance) <- Only for vendor, trainer, quest
				ID - Quest, Mob or NPC ID
				Limited Supply - Is the recipe limited supply (vendor only)
			}
		}
		Flags = {
			class:
				deathknight
				druid
				hunter
				mage
				paladin
				priest
				rogue
				warlock
				warrior
			specialty:
				speciality1 (Gnomish engineering, primal mooncloth, elemental, weaponsmith)
				speciality2 (Gobling engineering, shadowcloth, dragonscale, hammersmith)
				speciality3 (spellcloth, tribal, axesmith)
				speciality4 (swordsmith)
				speciality5 (armorsmith)
			obtain:
				instance
				raid
				quest
				seasonal
				trainer
				vendor
				pvp
				discovery
				worlddrop
				mobdrop
			binding:
				itembop
				itemboe
				recipebop
				recipeboe
			item:
				armor:
					cloth
					leather
					mail
					plate
					cloak
					trinket
					ring
					necklace
				weapon:
					onehand
					twohand
					axe
					sword
					mace
					polearm
					dagger
					staff
					wand
					thrown
					bow
					crossbow
					ammo
			player:
				caster
				melee
				tank
				healer
			rep:
				aldor
				argentdawn
				ashtonguedeathsworn
				cenarioncircle
				cenarionexpedition
				hellfire
				consortium
				keepersoftime
				lowercity
				nagrand
				scaleofthesands
				scryer
				shatar
				shatteredsun
				sporeggar
				thoriumbrotherhood
				timbermaw
				violeteye
				zandalar
		}
	}

	************************************************************************
	
	]]--


	-- Creates a table in the addon.RecipeListing table storing all information about a recipe
	addon.RecipeListing[RecipeName] = {}
	-- Set the name and acquire information
	addon.RecipeListing[RecipeName]["Level"] = RecipeLevel
	addon.RecipeListing[RecipeName]["Acquire"] = RecipeAcquire
	addon.RecipeListing[RecipeName]["RecipeLink"] = RecipeLink

	-- All recipes are unknown until scan occurs
	addon.RecipeListing[RecipeName]["Known"] = false

	-- Increment the total number of recipes added to the list
	addon.NumberOfRecipes = addon.NumberOfRecipes + 1

	-- Create the speciality space
	addon.RecipeListing[RecipeName]["Speciality"] = {}
	-- Parse all extra variables and add them to the speciality table
	local numvars = select('#',...)
	for i=1,numvars,1 do
		local temp = select(i,...)
		tinsert(addon.RecipeListing[RecipeName]["Speciality"],temp)
	end

	-- Do we display this recipe?  Used for specific hiding of a recipe, or search filter results
	addon.RecipeListing[RecipeName]["Display"] = true

end

-- Same as previous function but uses spell ID to get recipe name

function addon:addTradeSkillSpell(RecipeName, RecipeLevel, RecipeAcquire, ...)

	if (GetSpellInfo(RecipeName) ~= nil) then
		local spelllink = GetSpellLink(RecipeName)
		self:addTradeSkill(GetSpellInfo(RecipeName), RecipeLevel, RecipeAcquire, spelllink, ...)
	else
		self:addTradeSkill(tostring(RecipeName), RecipeLevel, RecipeAcquire, nil, ...)
		self:Print(format(L["SpellIDCache"],RecipeName))
	end

end

-- Same as previous but combines spell rank for beast training

function addon:addTradeSkillBeast(RecipeName, RecipeLevel, RecipeAcquire, ...)

	-- Variables named after friends on an old server because they both really wanted to be in my mod :P
	local Jimo,Megadopolous = GetSpellInfo(RecipeName)

	if (Jimo ~= nil) then
		local TempHunterSkill = Jimo .. " (" .. Megadopolous .. ")"
		local spelllink = GetSpellLink(RecipeName)
		self:addTradeSkill(TempHunterSkill, RecipeLevel, RecipeAcquire, spelllink, ...)
	else
		self:addTradeSkill(tostring(RecipeName), RecipeLevel, RecipeAcquire, nil, ...)
		self:Print(format(L["SpellIDCache"],RecipeName))
	end

end

-- Adds vendor information to the vendor list array.

function addon:addVendorList(VendorID, VendorName, VendorFaction, VendorLoc, VendorCoords)

	addon.VendorList[VendorID] = {}
	addon.VendorList[VendorID]["Name"] = VendorName
	addon.VendorList[VendorID]["Faction"] = VendorFaction
	addon.VendorList[VendorID]["Location"] = VendorLoc
	addon.VendorList[VendorID]["Coords"] = VendorCoords

end

-- Adds pet information to the pet list array

function addon:addPetList(PetID, PetName, PetLocation, PetLevelMin, PetLevelMax, isElite, isRare)

	addon.PetList[PetID] = {}
	addon.PetList[PetID]["Name"] = PetName
	addon.PetList[PetID]["Location"] = PetLocation
	addon.PetList[PetID]["MinLvl"] = PetLevelMin
	addon.PetList[PetID]["MaxLvl"] = PetLevelMax
	addon.PetList[PetID]["Elite"] = isElite
	addon.PetList[PetID]["Rare"] = isRare

end

-- Modifies recipe array if a recipe is found, setting the Known flag as true.

function addon:foundTradeSkill(RecipeName)

	addon.RecipeListing[RecipeName]["Known"] = true

	-- Increase found count
	addon.FoundRecipes = addon.FoundRecipes + 1

end

--[[

	Recipe Filtering Functions

]]--

-- Toggles the filtering of a specific recipe, including it or preventing it from being displayed in the results

function addon:ToggleFilterRecipe(RecipeName)

	-- Remove the recipe name from the saved variables
	if (addon.RecipeListing[RecipeName]["Display"] == false) then
		tremove(addon.db.profile.filteredrecipes,RecipeName)
	-- Add recipe name to the saved variables
	else
		tinsert(addon.db.profile.filteredrecipes,RecipeName)	
	end

	addon.RecipeListing[RecipeName]["Display"] = not addon.RecipeListing[RecipeName]["Display"]

end

-- Parses through the filtered recipe list, marking the ones which appear in the list to not display

function addon:MarkFilteredRecipes()

	-- Parse the filtered recipes saved variables
	for i,k in pairs(addon.db.profile.filteredrecipes) do
		-- If the recipe is in our current database mark it to not be displayed
		if (addon.RecipeListing[k]) then
			addon.RecipeListing[k]["Display"] = false
		end
	end

end

-- Checks to see if a recipe is known or not.  If the recipe is not in the database, output it to chat.

function addon:CheckRecipe(RecipeName)

	if (addon.RecipeListing[RecipeName]) then
		-- Update array that recipe was found
		self:foundTradeSkill(RecipeName)
	else
		self:Print(L["MissingFromDBWarning"])
		-- Notify users in chat that skill is missing from the database.
		for i = 1, 50000 do
			local spellName = GetSpellInfo(i)
			if (spellName and (spellName:lower() == RecipeName:lower())) then
				self:printMissingSkill(RecipeName,i)
				return
			end
		end
	end

end

do

	-- Class table for class checks to make them go faster
	local ClassTable = {
		["WARLOCK"] = true,
		["WARRIOR"] = true,
		["HUNTER"] = true,
		["MAGE"] = true,
		["PRIEST"] = true,
		["DRUID"] = true,
		["PALADIN"] = true,
		["SHAMAN"] = true,
		["ROGUE"] = true,
		--["DEATHKNIGHT"] = true,
	}

	-- Rep table space which wil lbe used to check if a recipe is displayed or not
	local RepTable = nil

	-- All Alchemy Specialities
	local AlchemySpec = {
		[GetSpellInfo(28674)] = true,
		[GetSpellInfo(28678)] = true,
		[GetSpellInfo(28676)] = true,
	}

	-- All Blacksmithing Specialities
	local BlacksmithSpec = {
		[GetSpellInfo(9788)] = true, -- Armorsmith
		[GetSpellInfo(17041)] = true, -- Master Axesmith
		[GetSpellInfo(17040)] = true, -- Master Hammersmith
		[GetSpellInfo(17039)] = true, -- Master Swordsmith
		[GetSpellInfo(9787)] = true, -- Weaponsmith
	}

	-- All Engineering Specialities
	local EngineeringSpec = {
		[GetSpellInfo(20219)] = true, -- Gnomish
		[GetSpellInfo(20222)] = true, -- Goblin
	}

	-- All Leatherworking Specialities
	local LeatherworkSpec = {
		[GetSpellInfo(10657)] = true, -- Dragonscale
		[GetSpellInfo(10659)] = true, -- Elemental
		[GetSpellInfo(10661)] = true, -- Tribal
	}

	-- All Tailoring Specialities
	local TailorSpec = {
		[GetSpellInfo(26797)] = true, -- Spellfire
		[GetSpellInfo(26801)] = true, -- Shadoweave
		[GetSpellInfo(26798)] = true, -- Primal Mooncloth
	}

	-- List of classes which have specialities
	local SpecialtyTable = {
		[GetSpellInfo(2259)] = AlchemySpec,
		[GetSpellInfo(2018)] = BlacksmithSpec,
		[GetSpellInfo(4036)] = EngineeringSpec,
		[GetSpellInfo(2108)] = LeatherworkSpec,
		[GetSpellInfo(3908)] = TailorSpec,
	}

	-- List containing all possible specialities
	local AllSpecialitiesTable = {
	}

	-- Populate the speciality table with all specialities, not adding alchemy because no recipes have alchemy filters
	for i in pairs(BlacksmithSpec) do AllSpecialitiesTable[i] = true end
	for i in pairs(EngineeringSpec) do AllSpecialitiesTable[i] = true end
	for i in pairs(LeatherworkSpec) do AllSpecialitiesTable[i] = true end
	for i in pairs(TailorSpec) do AllSpecialitiesTable[i] = true end

	-- Toggles the value in the rep table when the profile is updated
	function addon:UpdateReptable(rep)
		RepTable[rep] = not RepTable[rep]
	end

	-- Creates the reputation table 
	local function PopulateReptable()

		if (RepTable == nil) then
			RepTable = {}
		end

		RepTable[BFAC["The Scryers"]] = addon.db.profile.filters.rep.scryer
		RepTable[BFAC["The Aldor"]] = addon.db.profile.filters.rep.aldor
		RepTable[BFAC["Argent Dawn"]] = addon.db.profile.filters.rep.argentdawn
		RepTable[BFAC["Ashtongue Deathsworn"]] = addon.db.profile.filters.rep.ashtonguedeathsworn
		RepTable[BFAC["Cenarion Circle"]] = addon.db.profile.filters.rep.cenarioncircle
		RepTable[BFAC["Cenarion Expedition"]] = addon.db.profile.filters.rep.cenarionexpedition
		RepTable[BFAC["The Consortium"]] = addon.db.profile.filters.rep.consortium
		RepTable[BFAC["Honor Hold"]] = addon.db.profile.filters.rep.hellfire
		RepTable[BFAC["Thrallmar"]] = addon.db.profile.filters.rep.hellfire
		RepTable[BFAC["Keepers of Time"]] = addon.db.profile.filters.rep.keepersoftime
		RepTable[BFAC["Kurenai"]] = addon.db.profile.filters.rep.nagrand
		RepTable[BFAC["The Mag'har"]] = addon.db.profile.filters.rep.nagrand
		RepTable[BFAC["Lower City"]] = addon.db.profile.filters.rep.lowercity
		RepTable[BFAC["The Scale of the Sands"]] = addon.db.profile.filters.rep.scaleofthesands
		RepTable[BFAC["The Sha'tar"]] = addon.db.profile.filters.rep.shatar
		RepTable[BFAC["Shattered Sun Offensive"]] = addon.db.profile.filters.rep.shatteredsun
		RepTable[BFAC["Sporeggar"]] = addon.db.profile.filters.rep.sporeggar
		RepTable[BFAC["Thorium Brotherhood"]] = addon.db.profile.filters.rep.thoriumbrotherhood
		RepTable[BFAC["Timbermaw Hold"]] = addon.db.profile.filters.rep.timbermaw
		RepTable[BFAC["The Violet Eye"]] = addon.db.profile.filters.rep.violeteye
		RepTable[BFAC["Zandalar Tribe"]] = addon.db.profile.filters.rep.zandalar

	end

	-- Get the players class
	local _, playerClass = UnitClass("player")

	-- Internal function to determine if a specific faction is to be displayed or not

	local function CheckDisplayFaction(CurrentCheck)

		return RepTable[CurrentCheck]

	end

	-- Check to see if recipe should be displayed or not

	function addon:CheckDisplayRecipe(RecipeName, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

		-- For flag info see comments at start of file in comments

		-- Update the rep table with appropiate flags
		-- May want to change this so that we don't update the table for every scan
		PopulateReptable()

		-- Check to see if we're filtering this recipe due to search results or as a specific filter
		if (not addon.RecipeListing[RecipeName]["Display"]) then
			addon.FilteredRecipes = addon.FilteredRecipes + 1
			return false
		end

		-- Display all skill levels
		if (addon.RecipeListing[RecipeName]["Level"] > CurrentProfessionLevel) and (not addon.db.profile.filters.general.skill) then
			addon.FilteredRecipes = addon.FilteredRecipes + 1
			return false
		end

		local classcheck = false
		local classoccur = false
		local displaycheck = true

		if (addon.RecipeListing[RecipeName]["Speciality"] ~= nil) then

			for i, CurrentCheck in pairs(addon.RecipeListing[RecipeName]["Speciality"]) do

				-- Display trainer recipes
				if (not addon.db.profile.filters.obtain.trainer) and (CurrentCheck == 1) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display vendor recipes
				if (not addon.db.profile.filters.obtain.vendor) and (CurrentCheck == 2) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display BoE recipes
				if (not addon.db.profile.filters.binding.itemboe) and (CurrentCheck == 3) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display BoP recipes
				if (not addon.db.profile.filters.binding.itembop) and (CurrentCheck == 4) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display instance recipes
				if (not addon.db.profile.filters.obtain.instance) and (CurrentCheck == 5) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display hard to obtain raid recipes
				if (not addon.db.profile.filters.obtain.raid) and (CurrentCheck == 6) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display seasonal recipes
				if (not addon.db.profile.filters.obtain.seasonal) and (CurrentCheck == 7) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display pvp recipes
				if (not addon.db.profile.filters.obtain.pvp) and (CurrentCheck == 8) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display quest recipes
				if (not addon.db.profile.filters.obtain.quest) and (CurrentCheck == 9) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display cloth recipes
				if (not addon.db.profile.filters.item.armor.cloth) and (CurrentCheck == 10) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display leather recipes
				if (not addon.db.profile.filters.item.armor.leather) and (CurrentCheck == 11) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display mail recipes
				if (not addon.db.profile.filters.item.armor.mail) and (CurrentCheck == 12) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display plate recipes
				if (not addon.db.profile.filters.item.armor.plate) and (CurrentCheck == 13) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display melee dps recipes
				if (not addon.db.profile.filters.player.melee) and (CurrentCheck == 14) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display tanking recipes
				if (not addon.db.profile.filters.player.tank) and (CurrentCheck == 15) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display healer recipes
				if (not addon.db.profile.filters.player.healer) and (CurrentCheck == 16) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display caster dps recipes
				if (not addon.db.profile.filters.player.caster) and (CurrentCheck == 17) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end
				
				-- Display world drop recipes
				if (not addon.db.profile.filters.obtain.worlddrop) and (CurrentCheck == 18) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display recipe bop recipes
				if (not addon.db.profile.filters.binding.recipebop) and (CurrentCheck == 19) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display recipe boe recipes
				if (not addon.db.profile.filters.binding.recipeboe) and (CurrentCheck == 20) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display all faction recipes -and make sure the check is Horde or Alliance
				if (not addon.db.profile.filters.general.faction) and ((CurrentCheck == BFAC["Horde"]) or (CurrentCheck == BFAC["Alliance"])) and (CurrentCheck ~= playerFaction) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Reputation check
				local ReputationCheck = CheckDisplayFaction(CurrentCheck)
				if (ReputationCheck ~= nil) and (ReputationCheck == false) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
					return false
				end

				-- Display all specialities (ie: Primal Mooncloth, Spellcloth, etc.)
				if (not addon.db.profile.filters.general.specialty) then
					-- Are we looking at a speciality and is the current profession a profession that has a speciality?
					if (SpecialtyTable[CurrentProfession]) and (AllSpecialitiesTable[CurrentCheck]) then
						if (CurrentSpeciality ~= CurrentCheck) then
							addon.FilteredRecipes = addon.FilteredRecipes + 1
							return false
						end
					end
				end

				-- Display all class type recipes
				if (not addon.db.profile.filters.general.class) and (ClassTable[CurrentCheck]) then
					-- Set that a class check has occured in the case of multiple classes.
					classoccur = true
					if (CurrentCheck == playerClass) then
						classcheck = true
					end
				end

			end

		end

		if (displaycheck == true) then
			if (classoccur == true) then
				if (classcheck == false) then
					addon.FilteredRecipes = addon.FilteredRecipes + 1
				end
				return classcheck
			else
				return true
			end
		else
			addon.FilteredRecipes = addon.FilteredRecipes + 1
			return false
		end

	end

	-- Scans the first 24 entries in the spellbook to find which profession speciality someone is (assumption is that it will be within the first 24 because of the general tab)

	function addon:GetTradeSpeciality(CurrentProfession)

		-- Don't use the main speciality table, create our own copy so we can add alchemy to it
		local specialitytable = SpecialtyTable
		specialitytable[GetSpellInfo(3908)] = TailorSpec

		for index=1,25,1 do
			local spellName = GetSpellName(index, BOOKTYPE_SPELL)

			-- Nothing found
			if (not spellName) or (index == 25) or (not specialitytable[CurrentProfession]) then
				return ""
			end

			if (specialitytable[CurrentProfession][spellName]) then
				return spellName
			end
		end

	end

end

--[[

	Text output functions

]]--

-- Prints out to chat a message stating that a current recipe is missing from the internal database.  Output will be in a comma seperated value.

function addon:printMissingSkill(RecipeName,spellID)

	if (spellID) then
		self:Print(self:Red(RecipeName .. " " .. spellID) .. self:White(L["MissingFromDB"]))	
	else
		self:Print(self:Red(RecipeName) .. self:White(L["MissingFromDB"]))
	end

end

--[[

	RecipeAcquisition Functions

]]--

-- Combines all monster information into a single string for output

function addon:CombineMobs(BoE, MobNames, MobLoc)

	if (BoE == true) then
		-- BoE drop from a mob
		return format("%s%s (%s)",L["BoE"],MobNames,MobLoc)
	else
		-- BoP drop from a mob
		return format("%s%s (%s)",L["BoP"],MobNames,MobLoc)
	end

end

do
	-- Table to store string components in
	local t = {}

	-- Combines all quest information into a single string for output

	function addon:CombineQuests(...)
	-- Ackis: If you'd just like to show the tooltip, `GameTooltip:SetHyperlink("quest:"..uid)`
		-- Reset the table
		for k in pairs(t) do t[k] = nil end

		--local questlinkformat = "\124Hquest:%s:%s\124h%s\124h" -- quest ID, quest level, quest name

		local numvars = select('#',...)

		-- Parse through the list
		for i=1,numvars,3 do
			local QuestName, QuestFaction, QuestLoc = select(i,...)
			if (QuestFaction == 1) then
				if (addon.db.profile.filters.general.faction or playerFaction == BFAC["Alliance"]) then
					table.insert(t,self:Cyan(format("%s%s (%s)",L["QuestReward"],QuestName,QuestLoc)))
				end
			elseif (QuestFaction == 2) then
				if (addon.db.profile.filters.general.faction or playerFaction == BFAC["Horde"]) then
					table.insert(t,self:Red(format("%s%s (%s)",L["QuestReward"],QuestName,QuestLoc)))
				end
			elseif (QuestFaction == 0) then
				table.insert(t,self:Gold(format("%s%s (%s)",L["QuestReward"],QuestName,QuestLoc)))
			end
		end

		return table.concat(t,addon.br)

	end

	-- Combines all pet information into a single string for output

	function addon:CombinePets(...)
		-- Reset the table
		for k in pairs(t) do t[k] = nil end

		local numvars = select('#',...)

		for i=1,numvars,1 do
	        local CurrentCheck = select(i, ...)
			local temp = GetDifficultyColor(tonumber(addon.PetList[CurrentCheck]["MinLvl"]))
			local ColourMin = self:Colourize(self:RGBtoHEX(temp.r,temp.g,temp.b),addon.PetList[CurrentCheck]["MinLvl"])
			temp = GetDifficultyColor(tonumber(addon.PetList[CurrentCheck]["MaxLvl"]))
			local ColourMax = self:Colourize(self:RGBtoHEX(temp.r,temp.g,temp.b),addon.PetList[CurrentCheck]["MaxLvl"])
				-- Normal
			if (not addon.PetList[CurrentCheck]["Rare"] and not addon.PetList[CurrentCheck]["Elite"]) then
				if (addon.PetList[CurrentCheck]["MinLvl"] == addon.PetList[CurrentCheck]["MaxLvl"]) then
					table.insert(t,format("%s: (%s): %s",addon.PetList[CurrentCheck]["Name"], ColourMin, addon.PetList[CurrentCheck]["Location"]))
				else
					table.insert(t,format("%s: (%s - %s): %s",addon.PetList[CurrentCheck]["Name"], ColourMin, ColourMax, addon.PetList[CurrentCheck]["Location"]))
				end
			-- Rare only
			elseif (addon.PetList[CurrentCheck]["Rare"] and not addon.PetList[CurrentCheck]["Elite"]) then
				if (addon.PetList[CurrentCheck]["MinLvl"] == addon.PetList[CurrentCheck]["MaxLvl"]) then
					table.insert(t,format("%s: %s (%s): %s", L["Rare"],addon.PetList[CurrentCheck]["Name"], ColourMin, addon.PetList[CurrentCheck]["Location"]))
				else
					table.insert(t,format("%s: %s (%s - %s): %s", L["Rare"],addon.PetList[CurrentCheck]["Name"], ColourMin, ColourMax, addon.PetList[CurrentCheck]["Location"]))
				end
			-- Elite only
			elseif (not addon.PetList[CurrentCheck]["Rare"] and addon.PetList[CurrentCheck]["Elite"]) then
				if (addon.PetList[CurrentCheck]["MinLvl"] == addon.PetList[CurrentCheck]["MaxLvl"]) then
					table.insert(t,format("%s: %s (%s): %s", L["Elite"],addon.PetList[CurrentCheck]["Name"], ColourMin, addon.PetList[CurrentCheck]["Location"]))
				else
					table.insert(t,format("%s: %s (%s - %s): %s", L["Elite"],addon.PetList[CurrentCheck]["Name"], ColourMin, ColourMax, addon.PetList[CurrentCheck]["Location"]))
				end
			-- Rare elite
			else
				if (addon.PetList[CurrentCheck]["MinLvl"] == addon.PetList[CurrentCheck]["MaxLvl"]) then
					table.insert(t,format("%s %s: %s (%s): %s", L["Rare"],L["Elite"],addon.PetList[CurrentCheck]["Name"], ColourMin, addon.PetList[CurrentCheck]["Location"]))
				else
					table.insert(t,format("%s %s: %s (%s - %s): %s", L["Rare"],L["Elite"],addon.PetList[CurrentCheck]["Name"], ColourMin, ColourMax, addon.PetList[CurrentCheck]["Location"]))
				end
			end
		end

		return table.concat(t, addon.br)

	end

	-- Combines Vendor name, location, faction into a single string.  A list of Vendor IDs is provided, along with if the recipe is limited supply.

	function addon:CombineVendors(...)
		-- Reset the table
		for k in pairs(t) do t[k] = nil end

		local numvars = select('#',...)

		-- Add type of vendor to string
		if (select(numvars, ...) == false) then
			table.insert(t,L["Vendor"])
		else
			table.insert(t,L["LimitedSupply"])
		end

		for i=1,(numvars-1),1 do
			local CurrentCheck = select(i, ...)
			if (addon.VendorList[CurrentCheck]["Faction"] == BFAC["Alliance"]) then
				if (addon.db.profile.filters.general.faction or playerFaction == BFAC["Alliance"]) then
					table.insert(t,self:Cyan(format("%s - %s: %s", addon.VendorList[CurrentCheck]["Name"], addon.VendorList[CurrentCheck]["Location"], addon.VendorList[CurrentCheck]["Coords"])))
				end
			elseif (addon.VendorList[CurrentCheck]["Faction"] == BFAC["Horde"]) then
				if (addon.db.profile.filters.general.faction or playerFaction == BFAC["Horde"]) then
					table.insert(t,self:Red(format("%s - %s: %s", addon.VendorList[CurrentCheck]["Name"], addon.VendorList[CurrentCheck]["Location"], addon.VendorList[CurrentCheck]["Coords"])))
				end
			elseif (addon.VendorList[CurrentCheck]["Faction"] == BFAC["Neutral"]) then
				table.insert(t,self:Gold(format("%s - %s: %s", addon.VendorList[CurrentCheck]["Name"], addon.VendorList[CurrentCheck]["Location"], addon.VendorList[CurrentCheck]["Coords"])))
			else
				table.insert(t,format("%s - %s: %s",  addon.VendorList[CurrentCheck]["Name"], addon.VendorList[CurrentCheck]["Location"], addon.VendorList[CurrentCheck]["Coords"]))
			end
		end

		return table.concat(t, addon.br)

	end

end

-- Combines repuation level and faction name into a single string.

function addon:AddSingleReputation(RepLevel, Faction)

	local newfaction

	if (not factionlevels[Faction] or factionlevels[Faction] <= RepLevel) then
		newfaction = format("%s: %s -",self:Red(L["Reputation"]),self:Red(Faction))
	else
		newfaction = format("%s: %s -",L["Reputation"],Faction)
	end

	if (RepLevel == 1) then
		return format("%s %s",newfaction,self:Friendly(BFAC["Friendly"]))
	elseif (RepLevel == 2) then
		return format("%s %s",newfaction,self:Honored(BFAC["Honored"]))
	elseif (RepLevel == 3) then
		return format("%s %s",newfaction,self:Revered(BFAC["Revered"]))
	elseif (RepLevel == 4) then
		return format("%s %s",newfaction,self:Exalted(BFAC["Exalted"]))
	else
		self:Print(format(L["FactionError"],RepLevel))
		return format("%s %s",newfaction,RepLevel)
	end
end

-- Combines reputation level and faction name of two factions into a single string.

function addon:AddDoubleReputation(RepLevel, Faction1, Faction2)

	if (not addon.db.profile.filters.general.faction) then
		local tempfac = ""
		-- Only return Alliance specific factions
		if (playerFaction == BFAC["Alliance"]) then
			tempfac = Faction1
		-- Only return Horde speficic factions
		elseif (playerFaction == BFAC["Horde"]) then
			tempfac = Faction2
		end
		-- Return the single faction
		return(self:AddSingleReputation(RepLevel,tempfac))
	else
		-- Return both factions reputations
		return self:AddSingleReputation(RepLevel,Faction1) .. addon.br .. self:AddSingleReputation(RepLevel,Faction2)
	end

end

--[[

	Searching Functions

]]--

-- Searches through the recipe name and acquisition information, setting the display flag to false if the search string does not appear

function addon:SearchRecipeDB(searchstring)

	for i in pairs(addon.RecipeListing) do
		if (not string.find(i,searchstring)) and (not string.find(addon.RecipeListing[i]["Acquire"],searchstring)) then
			addon.RecipeListing[i]["Display"] = false
		end
	end

end

-- Resets the display flags of all recipes in the database

function addon:ResetSearch()

	for i in pairs(addon.RecipeListing) do
		addon.RecipeListing[i]["Display"] = true
	end

end

--[[

	Sorting Functions

]]--

-- Returns true if a Recipe1 has a lower skill level than Recipe2

local function SortMissingSkill(Recipe1, Recipe2)

	return addon.RecipeListing[Recipe1]["Level"] < addon.RecipeListing[Recipe2]["Level"]

end

-- Returns true if a Recipe1 come before Recipe2 in the alphabet

local function SortMissingName(Recipe1, Recipe2)

	return Recipe1 < Recipe2

end

-- Returns true if a Recipe1 come before Recipe2 in the alphabet

local function SortMissingAcquisition(Recipe1, Recipe2)

	return addon.RecipeListing[Recipe1]["Acquire"] < addon.RecipeListing[Recipe2]["Acquire"]

end

-- Sorts the RecipeListing with the given sorting function  and adds them to the global sorted recipe list

function addon:SortMissingRecipes(SortFunction)

	addon.SortedRecipeIndex = {}
	-- Get all the indexes of the RecipeListing
	for n in pairs(addon.RecipeListing) do
		table.insert(addon.SortedRecipeIndex, n)
	end

	-- Sort the indexes according to the function
	table.sort(addon.SortedRecipeIndex, SortFunction)

end

--[[

	Recipe Array Functions

]]--

-- Initialize the profession tables depending on which skill window is opened.

local function InitializeTradeRecipes(CurrentProfession)

	-- Table of all possible professions with init functions
	local professiontable =
	{
		[GetSpellInfo(2259)] = addon.InitAlchemy,
		[GetSpellInfo(2018)] = addon.InitBlackSmith,
		[GetSpellInfo(2550)] = addon.InitCooking,
		[GetSpellInfo(4036)] = addon.InitEngineering,
		-- Use first aid spell of applying bandages to fix issues with other localizations
		[GetSpellInfo(746)] = addon.InitFirstAid,
		-- Hack to get first aid working on frFR since I can't seem to get a proper spell ID :P
		["Premiers soins"] = addon.InitFirstAid,
		--[GetSpellInfo(3273)] = addon.InitFirstAid,
		[GetSpellInfo(2108)] = addon.InitLeatherWorking,
		[GetSpellInfo(2842)] = addon.InitRoguePoison,
		[GetSpellInfo(2575)] = addon.InitSmelting,
		[GetSpellInfo(3908)] = addon.InitTailoring,
		[GetSpellInfo(25229)] = addon.InitJewelcrafting,
	}
	if (addon.wrath) then
		professiontable[GetSpellInfo(45357)] = addon.InitInscription
		professiontable[GetSpellInfo(7411)] = addon.InitEnchanting
	end

	-- Thanks to sylvanaar/xinhuan for the code snippet
	local a = professiontable[CurrentProfession]

	if a then
		a(addon)
	else
		addon:Print(L["UnknownTradeSkill"]:format(CurrentProfession))
	end

end

-- Initialize the profession tables depending on which skill window is opened.

local function InitializeCraftRecipes(CurrentProfession)

	local CurrentProfessionLevel

	if (CurrentProfession == GetSpellInfo(7411)) then
		-- Get the current level of the craft.
		CurrentProfessionLevel = _G["CraftRankFrame"]:GetValue() --Better way to do this?
		-- Add all enchanting recipes to the table
		addon:InitEnchanting()

	elseif (CurrentProfession == GetSpellInfo(5149)) then

		-- Player level = profession level for beast training
		CurrentProfessionLevel = UnitLevel("player")
		-- Create a table to store all possible pets
		addon.PetList = {}
		-- Add all beast training recipes to the table
		addon:InitBeastTraining()

	else

		CurrentProfessionLevel = 0
		addon:Print(L["UnknownTradeSkill"]:format(CurrentProfession))

	end

	return CurrentProfessionLevel

end

-- Gets all the factions the player knows and their rep levels

function addon:GetFactionLevels()

	for i=1,GetNumFactions(),1 do
		local name,_,replevel = GetFactionInfo(i)
		-- If the rep is greater than neutral
		if (replevel > 4) then
			-- We use levels of 0, 1, 2, 3, 4 internally for reputation levels, make it corrospond here
			factionlevels[name] = replevel - 4
		end
	end

end

-- Scans the first 24 entries in the spellbook to find out which professions you know.

function addon:GetKnownProfessions()
	-- reset all professions to false (someone may have unlearned something
	-- who knows
	addon.KnownProfessions = {
		["Alchemy"] = false,
		["Blacksmithing"] = false,
		["Cooking"] = false,
		["Enchanting"] = false,
		["Engineering"] = false,
		["First Aid"] = false,
		["Leatherworking"] = false,
		["Poisons"]	= false,
		["Smelting"] = false,
		["Tailoring"] = false,
		["Jewelcrafting"] = false,
		["Beast Training"] = false,
		["Inscription"] = false,
	}
	for index=1,25,1 do
		local spellName = GetSpellName(index, BOOKTYPE_SPELL)
		if (not spellName) or (index == 25) then
			-- Nothing found
			break
		end
		if ( addon.KnownProfessions[spellName] == false ) then
			addon.KnownProfessions[spellName] = true
		end
	end
end

--[[

	Scanning functions

]]--

-- Scans your recipe book for Trade Skill Recipes

function addon:ScanTradeSkills()

	-- Clear the "Have Materials" check box
	if not Skillet and TradeSkillFrameAvailableFilterCheckButton:GetChecked() then
		TradeSkillFrameAvailableFilterCheckButton:SetChecked(false)
		TradeSkillOnlyShowMakeable(false)
	end

	-- Clear the sub-classes filters
	SetTradeSkillSubClassFilter(0, 1, 1)
	UIDropDownMenu_SetSelectedID(TradeSkillSubClassDropDown, 1)

	-- Clear the inventory slot filter
	SetTradeSkillInvSlotFilter(0, 1, 1);
	UIDropDownMenu_SetSelectedID(TradeSkillInvSlotDropDown, 1)

	-- Expand all headers
	for i = GetNumTradeSkills(), 1, -1 do
		local _, tradeType = GetTradeSkillInfo(i)
		if tradeType == "header" then
			ExpandTradeSkillSubClass(i)
		end
	end

	-- Scan through all recipes
	for i = 1, GetNumTradeSkills() do
		local skillName, tradeType = GetTradeSkillInfo(i)
		-- Ignore all trade skill headers
		if (tradeType ~= "header") then
			self:CheckRecipe(skillName)
		end
	end

end

-- Scans your recipe book for Craft Skill Recipes (enchanting and beast training are handled differently than other trade skills)

function addon:ScanCraftSkills()

	-- Beast Training
	if CraftIsPetTraining() then
		for i = 1, GetNumCrafts() do
			local skillName, skillRank = GetCraftInfo(i)
			local FullSkillName = format("%s (%s)",skillName, skillRank)
			self:CheckRecipe(FullSkillName)
		end
	-- Enchanting and any other craft
	else
		-- Clear the "Have Materials" check box
		if not Skillet and CraftFrameAvailableFilterCheckButton:GetChecked() then
			CraftFrameAvailableFilterCheckButton:SetChecked(false)
			CraftOnlyShowMakeable(false)
		end

		-- Clear the inventory slots filter
		UIDropDownMenu_SetSelectedID(CraftFrameFilterDropDown, 1)
		SetCraftFilter(1)
		CraftFrame.selected = 1

		-- Scans crafting recipes in opened window, expanding all headers
		for i = GetNumCrafts(), 1, -1 do
			local _, _, craftType = GetCraftInfo(i)
			if craftType == "header" then
				ExpandCraftSkillLine(i)
			end
		end

		-- Scan through all recipes
		for i = 1, GetNumCrafts() do
			local skillName, _, craftType = GetCraftInfo(i)
			-- Ignore all trade skill headers
			if (craftType ~= "header") then
				self:CheckRecipe(skillName)
			end
		end
	end
end

-- Description: Scans the recipe listing and updates the filters according to user preferences
-- Expected result: The array of Recipes will have all Display flags toggles according to display preferences
-- Input: Recipe Array, Skill level for current profession, name of current profession, and current profession speciality
-- Output: None, array is passed as a reference

function addon:UpdateFilters(Recipes, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

	-- Parse through all the entries in the Recipe array
	for RecipeName in pairs(Recipes) do

		-- Determine if we are to display this recipe or not
		local displayflag = self:CheckDisplayRecipe(RecipeName, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

		-- Set the display flag
		Recipes[RecipeName]["Display"] = displayflag

	end

end

-- Main logic for add-on, will call all sub-functions

function addon:AckisRecipeList_Command()

	local CurrentProfession, CurrentProfessionLevel, CurrentSpeciality

	-- Initializes the vendor list
	if (addon.VendorList == nil) then
		addon.VendorList = {}
		self:InitVendor()
	end

	self:InitializeRecipeArray()

	if (addon.SkillType == nil) then

		self:Print(L["OpenTradeSkillWindow"])
		return

	-- Trade type skills
	elseif (addon.SkillType == "Trade") then

		-- Get the name of the current trade skill opened, along with the current level of the skill.
		CurrentProfession, CurrentProfessionLevel = GetTradeSkillLine()
		CurrentSpeciality = self:GetTradeSpeciality(CurrentProfession)
		InitializeTradeRecipes(CurrentProfession)

		if (CurrentProfession == GetSpellInfo(2842)) then
			-- Player level = profession level for rogue poisons
			CurrentProfessionLevel = UnitLevel("player")
		end

		self:ScanTradeSkills()
		self:UpdateFilters(addon.RecipeListing, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

	-- Craft type skills
	elseif (addon.SkillType == "Craft") then

		if (not addon.wrath) then

			-- Get the name of the current craft.
			CurrentProfession = GetCraftName()
			CurrentProfessionLevel = InitializeCraftRecipes(CurrentProfession)
			CurrentSpeciality = self:GetTradeSpeciality(CurrentProfession)

			self:ScanCraftSkills()
			self:UpdateFilters(addon.RecipeListing, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

		else

			self:Print("The crafting frame is not supported in Wrath of the Lich King. If you see this message submit a ticket on CurseForge please.")
			return

		end

	end

	-- Sort the recipe list now
	local sorttype = addon.db.profile.sortmethod

	if (sorttype == 2) then
		self:SortMissingRecipes(SortMissingSkill)
	elseif (sorttype == 1) then
		self:SortMissingRecipes(SortMissingName)
	elseif (sorttype == 3) then
		self:SortMissingRecipes(SortMissingAcquisition)
	end

	self:CreateFrame(CurrentProfession, CurrentProfessionLevel, CurrentSpeciality)

end

--[[

	Text dumping functions

]]--

-- Returns a text dump of everything about recipes, so the user can copy and paste it into another program

function addon:GetTextDump()

	local texttable = {}

	for i in pairs(addon.RecipeListing) do

		if (addon.RecipeListing[i]["Known"]) then
			table.insert(texttable,i .. "," .. addon.RecipeListing[i]["Level"] .. "," .. string.gsub(addon.RecipeListing[i]["Acquire"],addon.br," -") .. ",true")
		else
			table.insert(texttable,i .. "," .. addon.RecipeListing[i]["Level"] .. "," .. string.gsub(addon.RecipeListing[i]["Acquire"],addon.br," -") .. ",false")
		end

	end

	return table.concat(texttable,"\n")

end

-- Opens up a GUI window with a text dump in it

function addon:TextDump()

	local CurrentProfession, CurrentProfessionLevel, CurrentSpeciality

	-- Initializes the vendor list
	if (addon.VendorList == nil) then
		addon.VendorList = {}
		self:InitVendor()
	end

	self:InitializeRecipeArray()

	if (addon.SkillType == nil) then

		self:Print(L["OpenTradeSkillWindow"])
		return

	-- Trade type skills
	elseif (addon.SkillType == "Trade") then

		-- Get the name of the current trade skill opened, along with the current level of the skill.
		CurrentProfession, CurrentProfessionLevel = GetTradeSkillLine()
		CurrentSpeciality = self:GetTradeSpeciality(CurrentProfession)
		InitializeTradeRecipes(CurrentProfession)

		if (CurrentProfession == GetSpellInfo(2842)) then
			-- Player level = profession level for rogue poisons
			CurrentProfessionLevel = UnitLevel("player")
		end

		self:ScanTradeSkills()
		self:UpdateFilters(addon.RecipeListing, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

	-- Craft type skills
	elseif (addon.SkillType == "Craft") then

		if (not addon.wrath) then

			-- Get the name of the current craft.
			CurrentProfession = GetCraftName()
			CurrentProfessionLevel = InitializeCraftRecipes(CurrentProfession)
			CurrentSpeciality = self:GetTradeSpeciality(CurrentProfession)

			self:ScanCraftSkills()
			self:UpdateFilters(addon.RecipeListing, CurrentProfessionLevel, CurrentProfession, CurrentSpeciality)

		else

			self:Print("The crafting frame is not supported in Wrath of the Lich King. If you see this message submit a ticket on CurseForge please.")
			return

		end

	end

	-- Sort the recipe list now
	local sorttype = addon.db.profile.sortmethod

	if (sorttype == 2) then
		self:SortMissingRecipes(SortMissingSkill)
	elseif (sorttype == 1) then
		self:SortMissingRecipes(SortMissingName)
	elseif (sorttype == 3) then
		self:SortMissingRecipes(SortMissingAcquisition)
	end

	local temptext = self:GetTextDump()

	self:DisplayTextDump(temptext)

end
