--[[
************************************************************************
Core.lua
Core functions for Ackis Recipe List
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
--- Ackis Recipe List provides functionality to scan your professions.
-- It will determine which recipes you are missing.
-- @class file
-- @name Core.lua
-- @release 2.0
************************************************************************
]]

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-- Functions
local pairs, ipairs = _G.pairs, _G.ipairs
local select = _G.select
local tonumber, tostring = _G.tonumber, _G.tostring
local type = _G.type

-- Libraries
local bit = _G.bit
local string = _G.string
local table = _G.table

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub	= _G.LibStub
local addon	= LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceConsole-3.0", "AceEvent-3.0")
_G.AckisRecipeList = addon

--@alpha@
_G.ARL = addon
--@end-alpha@

local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BFAC 	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

local debugger	= _G.tekDebug and _G.tekDebug:GetFrame(private.addon_name)

private.build_num = select(2, _G.GetBuildInfo())

private.custom_list	= {}
private.mob_list	= {}
private.quest_list	= {}
private.recipe_list	= {}
private.reputation_list	= {}
private.trainer_list	= {}
private.seasonal_list	= {}
private.vendor_list	= {}
private.location_list	= {}
private.acquire_list	= {}
private.discovery_list	= {}

------------------------------------------------------------------------------
-- Constants.
------------------------------------------------------------------------------
local PROFESSION_INIT_FUNCS = {}

------------------------------------------------------------------------------
-- Database tables
------------------------------------------------------------------------------
local AllSpecialtiesTable = {}
local SpecialtyTable

-- Filter flags and acquire types - defined in Constants.lua
local F 	= private.filter_ids
local A		= private.acquire_types

-- Global Frame Variables
addon.optionsFrame = {}

-------------------------------------------------------------------------------
-- Check to see if we have mandatory libraries loaded. If not, notify the user
-- which are missing and return.
-------------------------------------------------------------------------------
local MissingLibraries
do
	local REQUIRED_LIBS = {
		"AceLocale-3.0",
		"LibBabble-Boss-3.0",
		"LibBabble-Faction-3.0",
		"LibBabble-Zone-3.0",
	}
	function MissingLibraries()
		local missing = false

		for idx, lib in ipairs(REQUIRED_LIBS) do
			if not LibStub:GetLibrary(lib, true) then
				missing = true
				addon:Print(L["MISSING_LIBRARY"]:format(lib))
			end
		end
		return missing
	end
end -- do

if MissingLibraries() then
	--@debug@
	addon:Print("You are using a development version of ARL.  As per WowAce standards, externals are not set up.  You will have to install all necessary libraries in order for the addon to function correctly.")
	--@end-debug@
	_G.AckisRecipeList = nil
	return
end

-------------------------------------------------------------------------------
-- Define the static popups we're going to call when people haven't scanned or
-- when current filters are blocking all recipes from being displayed.
-------------------------------------------------------------------------------
_G.StaticPopupDialogs["ARL_NOTSCANNED"] = {
	text = L["NOTSCANNED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

_G.StaticPopupDialogs["ARL_ALLFILTERED"] = {
	text = L["ALL_FILTERED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

_G.StaticPopupDialogs["ARL_ALLKNOWN"] = {
	text = L["ARL_ALLKNOWN"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

_G.StaticPopupDialogs["ARL_ALLEXCLUDED"] = {
	text = L["ARL_ALLEXCLUDED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

_G.StaticPopupDialogs["ARL_SEARCHFILTERED"] = {
	text = L["ARL_SEARCHFILTERED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

-------------------------------------------------------------------------------
-- Close all possible pop-up windows
-------------------------------------------------------------------------------
function addon:ClosePopups()
	_G.StaticPopup_Hide("ARL_NOTSCANNED")
	_G.StaticPopup_Hide("ARL_ALLFILTERED")
	_G.StaticPopup_Hide("ARL_ALLKNOWN")
	_G.StaticPopup_Hide("ARL_ALLEXCLUDED")
	_G.StaticPopup_Hide("ARL_SEARCHFILTERED")
end

-------------------------------------------------------------------------------
-- Debugger.
-------------------------------------------------------------------------------
function addon:Debug(...)
	if debugger then
		debugger:AddMessage(string.format(...))
	else
		--@debug@
		self:Printf(...)
		--@end-debug@
	end
end

do
	local output = {}

	function addon:DumpMembers(match)
		table.wipe(output)
		table.insert(output, "Addon Object members.\n")

		local count = 0

		for key, value in pairs(self) do
			local val_type = type(value)

			if not match or val_type == match then
				table.insert(output, ("%s (%s)"):format(key, val_type))
				count = count + 1
			end
		end
		table.insert(output, ("\n%d found\n"):format(count))
		self:DisplayTextDump(nil, nil, table.concat(output, "\n"))
	end
end	-- do

-------------------------------------------------------------------------------
-- Initialization functions
-------------------------------------------------------------------------------
function addon:OnInitialize()
	-- Set default options, which are to include everything in the scan
	local defaults = {
		global = {
			-- Saving alts tradeskills (needs to be global so all profiles can access it)
			tradeskill = {},
		},
		profile = {
			-------------------------------------------------------------------------------
			-- Frame options
			-------------------------------------------------------------------------------
			frameopts = {
				offsetx = 0,
				offsety = 0,
				anchorTo = "",
				anchorFrom = "",
				uiscale = 1,
				small_list_font = true,
			},

			-------------------------------------------------------------------------------
			-- Tooltip Options
			-------------------------------------------------------------------------------
			tooltip = {
				scale = 1,
				acquire_fontsize = 11,
			},
			-------------------------------------------------------------------------------
			-- Sorting Options
			-------------------------------------------------------------------------------
			sorting = "Ascending",
			current_tab = 3,		-- Name tab
			skill_view = false,		-- Sort the recipes by skill level instead of name?

			-------------------------------------------------------------------------------
			-- Display Options
			-------------------------------------------------------------------------------
			includefiltered = false,
			includeexcluded = false,
			closeguionskillclose = false,
			ignoreexclusionlist = false,
			scanbuttonlocation = "TR",
			spelltooltiplocation = "Right",
			acquiretooltiplocation = "Right",
			recipes_in_tooltips = true,
			max_recipes_in_tooltips = 10,
			hide_tooltip_hint = false,
			hidepopup = false,
			minimap = true,
			worldmap = true,
			autoscanmap = false,
			scantrainers = false,
			scanvendors = false,
			autoloaddb = false,
			maptrainer = false,
			mapvendor = true,
			mapmob = true,
			mapquest = true,

			-------------------------------------------------------------------------------
			-- Text Dump Options
			-------------------------------------------------------------------------------
			textdumpformat = "BBCode",

			-------------------------------------------------------------------------------
			-- Recipe Exclusion
			-------------------------------------------------------------------------------
			exclusionlist = {},

			-------------------------------------------------------------------------------
			-- Filter Options
			-------------------------------------------------------------------------------
			filters = {
				-------------------------------------------------------------------------------
				-- General Filters
				-------------------------------------------------------------------------------
				general = {
					faction = true,
					specialty = false,
					skill = true,
					known = false,
					unknown = true,
					retired = false,
				},
				-------------------------------------------------------------------------------
				-- Obtain Filters
				-------------------------------------------------------------------------------
				obtain = {
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
					achievement = true,
					expansion0 = true,
					expansion1 = true,
					expansion2 = true,
					expansion3 = true,
				},
				-------------------------------------------------------------------------------
				-- Item Filters (Armor/Weapon)
				-------------------------------------------------------------------------------
				item = {
					armor = {
						cloth = true,
						leather = true,
						mail = true,
						plate = true,
						trinket = true,
						cloak = true,
						ring = true,
						necklace = true,
						shield = true,
					},
					weapon = {
						onehand = true,
						twohand = true,
						axe = true,
						sword = true,
						mace = true,
						polearm = true,
						dagger = true,
						fist = true,
						staff = true,
						wand = true,
						thrown = true,
						bow = true,
						crossbow = true,
						gun = true,
					},
				},
				-------------------------------------------------------------------------------
				-- Quality Filters
				-------------------------------------------------------------------------------
				quality = {
					common = true,
					uncommon = true,
					rare = true,
					epic = true,
				},
				-------------------------------------------------------------------------------
				-- Binding Filters
				-------------------------------------------------------------------------------
				binding = {
					itemboe = true,
					itembop = true,
					recipebop = true,
					recipeboe = true,
				},
				-------------------------------------------------------------------------------
				-- Player Role Filters
				-------------------------------------------------------------------------------
				player = {
					melee = true,
					tank = true,
					healer = true,
					caster = true,
				},
				-------------------------------------------------------------------------------
				-- Reputation Filters
				-------------------------------------------------------------------------------
				rep = {
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
					argentcrusade = true,
					frenzyheart = true,
					ebonblade = true,
					kirintor = true,
					sonsofhodir = true,
					kaluak = true,
					oracles = true,
					wyrmrest = true,
					wrathcommon1 = true,
					wrathcommon2 = true,
					wrathcommon3 = true,
					wrathcommon4 = true,
					wrathcommon5 = true,
					ashenverdict = true,
					catacommon1 = true,
					catacommon2 = true,
					guardiansofhyjal = true,
					ramkahen = true,
					earthenring = true,
					therazane = true,
				},
				-------------------------------------------------------------------------------
				-- Class Filters
				-------------------------------------------------------------------------------
				classes = {
					deathknight = true,
					druid = true,
					hunter = true,
					mage = true,
					paladin = true,
					priest = true,
					rogue = true,
					shaman = true,
					warlock = true,
					warrior = true,
				},
			}
		}
	}
	self.db = LibStub("AceDB-3.0"):New("ARLDB2", defaults)

	if not self.db then
		self:Print("Error: Database not loaded correctly.  Please exit out of WoW and delete the ARL database file (AckisRecipeList.lua) found in: \\World of Warcraft\\WTF\\Account\\<Account Name>>\\SavedVariables\\")
		return
	end
	local version = _G.GetAddOnMetadata("AckisRecipeList", "Version")
	local debug_version = false
	local alpha_version = false

	--@debug@
	debug_version = true
	--@end-debug@

	--@alpha@
	alpha_version = true
	--@end-alpha@

	version = debug_version and "Devel" or (alpha_version and version .. "-Alpha") or version

	self.version = version

	self:SetupOptions()

	-- Register slash commands
	self:RegisterChatCommand("arl", "ChatCommand")
	self:RegisterChatCommand("ackisrecipelist", "ChatCommand")

	-------------------------------------------------------------------------------
	-- Populate the profession initialization functions.
	-------------------------------------------------------------------------------
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51304)] = addon.InitAlchemy
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51300)] = addon.InitBlacksmithing
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51296)] = addon.InitCooking
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51313)] = addon.InitEnchanting
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51306)] = addon.InitEngineering
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(45542)] = addon.InitFirstAid
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51302)] = addon.InitLeatherworking
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(32606)] = addon.InitSmelting
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51309)] = addon.InitTailoring
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(51311)] = addon.InitJewelcrafting
	PROFESSION_INIT_FUNCS[_G.GetSpellInfo(45363)] = addon.InitInscription
	PROFESSION_INIT_FUNCS[private.runeforging_name] = addon.InitRuneforging

	-------------------------------------------------------------------------------
	-- Hook GameTooltip so we can show information on mobs that drop/sell/train
	-------------------------------------------------------------------------------
	_G.GameTooltip:HookScript("OnTooltipSetUnit", function(self)
		if not addon.db.profile.recipes_in_tooltips then
			return
		end
		local name, unit = self:GetUnit()

		if not unit then
			return
		end
		local guid = _G.UnitGUID(unit)

		if not guid then
			return
		end
		local id_num = tonumber(guid:sub(-12, -9), 16)
		local unit = private.mob_list[id_num] or private.vendor_list[id_num] or private.trainer_list[id_num]

		if not unit or not unit.item_list then
			return
		end
		local player = private.Player
		local recipe_list = private.recipe_list
		local shifted = _G.IsShiftKeyDown()
		local count = 0

		for spell_id in pairs(unit.item_list) do
			local recipe = recipe_list[spell_id]
			local recipe_prof = _G.GetSpellInfo(recipe.profession)

			if player.scanned_professions[recipe_prof] then
				local skill_level = player.professions[recipe_prof]
				local has_level = skill_level and (type(skill_level) == "boolean" and true or skill_level >= recipe.skill_level)

				if ((not recipe:HasState("KNOWN") and has_level) or shifted) and player:HasRecipeFaction(recipe) then
					local _, _, _, hex = _G.GetItemQualityColor(recipe.quality)

					self:AddLine(("%s: |c%s%s|r (%d)"):format(recipe.profession, hex, recipe.name, recipe.skill_level))
					count = count + 1
				end
			end

			if count >= addon.db.profile.max_recipes_in_tooltips then
				break
			end
		end
	end)
end

---Function run when the addon is enabled.  Registers events and pre-loads certain variables.
function addon:OnEnable()
	self:RegisterEvent("TRADE_SKILL_SHOW")	-- Make addon respond to the tradeskill windows being shown
	self:RegisterEvent("TRADE_SKILL_CLOSE")	-- Addon responds to tradeskill windows being closed.
	self:RegisterEvent("TRADE_SKILL_UPDATE")

	if addon.db.profile.scantrainers then
		self:RegisterEvent("TRAINER_SHOW")
	end

	if addon.db.profile.scanvendors then
		self:RegisterEvent("MERCHANT_SHOW")
	end

	-------------------------------------------------------------------------------
	-- Set the parent and scripts for addon.scan_button.
	-------------------------------------------------------------------------------
	local scan_button = self.scan_button

	-- Add an option so that ARL will work with Manufac
	if _G.Manufac then
		_G.Manufac.options.args.ARLScan = {
			type = 'execute',
			name = L["Scan"],
			desc = L["SCAN_RECIPES_DESC"],
			func = function() addon:Scan(false) end,
			order = 550,
		}
	end
	private.Player:Initialize()

	-------------------------------------------------------------------------------
	-- Initialize the SpecialtyTable and AllSpecialtiesTable.
	-------------------------------------------------------------------------------
	do
		--[[
		local AlchemySpec = {
			[_G.GetSpellInfo(28674)] = 28674,
			[_G.GetSpellInfo(28678)] = 28678,
			[_G.GetSpellInfo(28676)] = 28676,
		}
		]]--

		--[[
		local BlacksmithSpec = {
			[_G.GetSpellInfo(9788)] = 9788,		-- Armorsmith
			[_G.GetSpellInfo(17041)] = 17041,	-- Master Axesmith
			[_G.GetSpellInfo(17040)] = 17040,	-- Master Hammersmith
			[_G.GetSpellInfo(17039)] = 17039,	-- Master Swordsmith
			[_G.GetSpellInfo(9787)] = 9787,		-- Weaponsmith
		}
		]]--

		local EngineeringSpec = {
			[_G.GetSpellInfo(20219)] = 20219, -- Gnomish
			[_G.GetSpellInfo(20222)] = 20222, -- Goblin
		}

		--[[
		local LeatherworkSpec = {
			[_G.GetSpellInfo(10657)] = 10657, -- Dragonscale
			[_G.GetSpellInfo(10659)] = 10659, -- Elemental
			[_G.GetSpellInfo(10661)] = 10661, -- Tribal
		}
		]]--

		--[[
		local TailorSpec = {
			[_G.GetSpellInfo(26797)] = 26797, -- Spellfire
			[_G.GetSpellInfo(26801)] = 26801, -- Shadoweave
			[_G.GetSpellInfo(26798)] = 26798, -- Primal Mooncloth
		}
		]]--

		SpecialtyTable = {
			--[_G.GetSpellInfo(51304)] = AlchemySpec,
			--[_G.GetSpellInfo(51300)] = BlacksmithSpec,
			[_G.GetSpellInfo(51306)] = EngineeringSpec,
			--[_G.GetSpellInfo(51302)] = LeatherworkSpec,
			--[_G.GetSpellInfo(51309)] = TailorSpec,
		}

		-- Populate the Specialty table with all Specialties, adding alchemy even though no recipes have alchemy filters
		--for i in pairs(AlchemySpec) do AllSpecialtiesTable[i] = true end
		--for i in pairs(BlacksmithSpec) do AllSpecialtiesTable[i] = true end
		for i in pairs(EngineeringSpec) do AllSpecialtiesTable[i] = true end
		--for i in pairs(LeatherworkSpec) do AllSpecialtiesTable[i] = true end
		--for i in pairs(TailorSpec) do AllSpecialtiesTable[i] = true end
	end	-- do
end

function addon:OnDisable()
	if addon.Frame then
		addon.Frame:Hide()
	end

	-- Remove the option from Manufac
	if _G.Manufac then
		_G.Manufac.options.args.ARLScan = nil
	end
end

-------------------------------------------------------------------------------
-- Event handling functions
-------------------------------------------------------------------------------
function addon:TRAINER_SHOW()
	self:ScanTrainerData(true)
end

function addon:MERCHANT_SHOW()
	self:ScanVendor()
end

-------------------------------------------------------------------------------
-- Create the scan button
-------------------------------------------------------------------------------
function addon:CreateScanButton()
	local scan_button = _G.CreateFrame("Button", nil, _G.TradeSkillFrame, "UIPanelButtonTemplate")
	scan_button:SetHeight(20)
	scan_button:RegisterForClicks("LeftButtonUp")
	scan_button:SetText(L["Scan"])

	if _G.Skillet and _G.Skillet:IsActive() then
		scan_button:SetParent(_G.SkilletFrame)
		_G.Skillet:AddButtonToTradeskillWindow(scan_button)
		scan_button:SetWidth(80)
	elseif _G.MRTAPI then
		_G.MRTAPI:RegisterHandler("TradeSkillWindowOnShow", function()
			scan_button:SetParent(_G.MRTSkillFrame)
			scan_button:ClearAllPoints()
			scan_button:SetPoint("RIGHT", _G.MRTSkillFrameCloseButton, "LEFT", 4, 0)
			scan_button:SetWidth(scan_button:GetTextWidth() + 10)
			scan_button:Show()
		end)
	elseif _G.ATSWFrame then
		scan_button:SetParent(_G.ATSWFrame)
		scan_button:ClearAllPoints()

		if _G.TradeJunkieMain and _G.TJ_OpenButtonATSW then
			scan_button:SetPoint("RIGHT", _G.TJ_OpenButtonATSW, "LEFT", 0, 0)
		else
			scan_button:SetPoint("RIGHT", _G.ATSWOptionsButton, "LEFT", 0, 0)
		end
		scan_button:SetHeight(_G.ATSWOptionsButton:GetHeight())
		scan_button:SetWidth(_G.ATSWOptionsButton:GetWidth())
	elseif _G.CauldronFrame then
		scan_button:SetParent(_G.CauldronFrame)
		scan_button:ClearAllPoints()
		scan_button:SetPoint("TOP", _G.CauldronFrame, "TOPRIGHT", -58, -52)
		scan_button:SetWidth(90)
	elseif _G.BPM_ShowTrainerFrame then
		scan_button:SetParent(_G.BPM_ShowTrainerFrame)
		scan_button:ClearAllPoints()
		scan_button:SetPoint("RIGHT", _G.BPM_ShowTrainerFrame, "LEFT", 4, 0)
		scan_button:SetWidth(scan_button:GetTextWidth() + 10)
		scan_button:Show()
	end
	local scan_parent = scan_button:GetParent()

	-- Set the frame level of the button to be 1 higher than its parent
	scan_button:SetFrameLevel(scan_parent:GetFrameLevel() + 1)
	scan_button:SetFrameStrata(scan_parent:GetFrameStrata())
	scan_button:Enable()

	scan_button:SetScript("OnClick", function(self, button, down)
		local main_panel = addon.Frame
		local prev_profession

		if main_panel then
			prev_profession = main_panel.prof_name or private.ordered_professions[main_panel.profession]
		end
		local shift_pressed = _G.IsShiftKeyDown()
		local alt_pressed = _G.IsAltKeyDown()
		local ctrl_pressed = _G.IsControlKeyDown()

		if shift_pressed and not alt_pressed and not ctrl_pressed then
			addon:Scan(true)
		elseif alt_pressed and not shift_pressed and not ctrl_pressed then
			addon:ClearWaypoints()
		elseif ctrl_pressed and not shift_pressed and not alt_pressed then
			local current_prof = _G.GetTradeSkillLine()
			addon:DumpProfession(current_prof)
		elseif not shift_pressed and not alt_pressed and not ctrl_pressed then
			if main_panel and main_panel:IsVisible() and prev_profession == _G.GetTradeSkillLine() then
				main_panel:Hide()
			else
				addon:Scan(false)
				addon:AddWaypoint()
			end
		end
	end)

	scan_button:SetScript("OnEnter", function(self)
		local tooltip = _G.GameTooltip

		_G.GameTooltip_SetDefaultAnchor(tooltip, self)
		tooltip:SetText(L["SCAN_RECIPES_DESC"])
		tooltip:Show()
	end)
	scan_button:SetScript("OnLeave", function() _G.GameTooltip:Hide() end)

	self.scan_button = scan_button
	return scan_button
end

function addon:TRADE_SKILL_SHOW()
	local player_name = _G.UnitName("player")
	local realm_name = _G.GetRealmName()

	self.db.global.tradeskill = self.db.global.tradeskill or {}
	self.db.global.tradeskill[realm_name] = self.db.global.tradeskill[realm_name] or {}
	self.db.global.tradeskill[realm_name][player_name] = self.db.global.tradeskill[realm_name][player_name] or {}

	if not _G.IsTradeSkillLinked() and not _G.IsTradeSkillGuild() then
		self.db.global.tradeskill[realm_name][player_name][_G.GetTradeSkillLine()] = _G.GetTradeSkillListLink()
	else
		self.db.global.tradeskill[realm_name][player_name][_G.GetTradeSkillLine()] = nil
	end
	local scan_button = self.scan_button

	if not scan_button then
		scan_button = self:CreateScanButton()
		self.CreateScanButton = nil
	end

	if scan_button:GetParent() == _G.TradeSkillFrame then
		scan_button:ClearAllPoints()

		local loc = addon.db.profile.scanbuttonlocation

		if loc == "TR" then
			scan_button:SetPoint("RIGHT", _G.TradeSkillFrameCloseButton, "LEFT", 4, 0)
		elseif loc == "TL" then
			scan_button:SetPoint("LEFT", _G.TradeSkillFramePortrait, "RIGHT", 2, 12)
		elseif loc == "BR" then
			scan_button:SetPoint("TOP", _G.TradeSkillCancelButton, "BOTTOM", 0, -5)
		elseif loc == "BL" then
			scan_button:SetPoint("TOP", _G.TradeSkillCreateAllButton, "BOTTOM", 0, -5)
		end
		scan_button:SetWidth(scan_button:GetTextWidth() + 10)
	end
	scan_button:Show()
end

function addon:TRADE_SKILL_CLOSE()
	if self.Frame and addon.db.profile.closeguionskillclose then
		self.Frame:Hide()
	end
end

do
	local last_update = 0
	local updater = _G.CreateFrame("Frame", nil, _G.UIParent)
	updater:Hide()

	updater:SetScript("OnUpdate", function(self, elapsed)
		last_update = last_update + elapsed

		if last_update >= 0.5 then
			local profession = _G.GetTradeSkillLine()

			if profession ~= "UNKNOWN" then
				addon:Scan(false, true)
			end
			self:Hide()
		end
	end)

	function addon:TRADE_SKILL_UPDATE()
		if not self.Frame or not self.Frame:IsVisible() then
			return
		end

		if not updater:IsVisible() then
			last_update = 0
			updater:Show()
		end
	end
end

-------------------------------------------------------------------------------
-- ARL Logic Functions
-------------------------------------------------------------------------------
function addon:InitializeProfession(profession)
	if not profession then
		--@alpha@
		addon:Print("nil profession passed to InitializeProfession()")
		--@end-alpha@
		return
	end

	if profession == private.professions["Smelting"] then
		profession = private.mining_name
	end
	local func = PROFESSION_INIT_FUNCS[profession]

	if func then
		func(addon)
		PROFESSION_INIT_FUNCS[profession] = nil
	end
end

do
	local fa = _G.GetSpellInfo(45542)

	-- Code snippet stolen from GearGuage by Torhal and butchered by Ackis
	local function StrSplit(input)
		if not input then return nil, nil end
		local arg1, arg2, var1

		arg1, var1 = input:match("^([^%s]+)%s*(.*)$")
		arg1 = (arg1 and arg1:lower() or input:lower())

		if var1 then
			-- Small hack to get code to work with first aid.
			if var1:lower() == fa:lower() then
				arg2 = var1
			else
				local var2
				arg2, var2 = var1:match("^([^%s]+)%s*(.*)$")
				arg2 = (arg2 and arg2:lower() or var1:lower())
			end
		end
		return arg1, arg2
	end

	-- Determines what to do when the slash command is called.
	function addon:ChatCommand(input)

		local arg1, arg2 = StrSplit(input)

		-- Open About panel if there's no parameters or if we do /arl about
		if not arg1 or (arg1 and arg1:trim() == "") or arg1 == L["Sorting"]:lower() or arg1 == L["Sort"]:lower() or arg1 == _G.DISPLAY:lower() then
			_G.InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		elseif arg1 == L["About"]:lower() then
			if self.optionsFrame["About"] then
				_G.InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["About"])
			else
				_G.InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
			end
		elseif arg1 == L["Profile"]:lower() then
			_G.InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Profiles"])
		elseif arg1 == L["Documentation"]:lower() then
			_G.InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Documentation"])
		elseif arg1 == L["Scan"]:lower() then
			if not arg2 then
				self:Print(L["COMMAND_LINE_SCAN"])
			else
				_G.CastSpellByName(arg2)

				if self.Frame and self.Frame:IsVisible() then
					self.Frame:Hide()
				else
					self:Scan(false, false)
				end
			end
		elseif arg1 == "scanprof" then
			self:ScanProfession("all")
		elseif arg1 == "tradelinks" then
			self:GenerateLinks()
		else
			-- What happens when we get here?
			LibStub("AceConfigCmd-3.0"):HandleCommand("arl", "Ackis Recipe List", arg1)
		end
	end
end

--- Public API function to initialize all of the lookup lists - self-nils once run.
-- @name AckisRecipeList:InitializeLookups()
-- @usage if AckisRecipeList.InitializeLookups then AckisRecipeList:InitializeLookups() end
function addon:InitializeLookups()
	self:InitCustom(private.custom_list)
	self:InitDiscovery(private.discovery_list)
	self:InitMob(private.mob_list)
	self:InitQuest(private.quest_list)
	self:InitReputation(private.reputation_list)
	self:InitTrainer(private.trainer_list)
	self:InitSeasons(private.seasonal_list)
	self:InitVendor(private.vendor_list)

	self.InitializeLookups = nil
end

-------------------------------------------------------------------------------
-- Recipe Scanning Functions
-------------------------------------------------------------------------------
do
	local current_recipe_count, previous_recipe_count = 0, 0

	-- List of tradeskill headers, used in addon:Scan()
	local header_list = {}

	-- Indices of the spells in the spell book which may contain a speciality
	local specialtices_indices = {}

	local PROFESSION_BUTTONS = {
		_G.PrimaryProfession1SpellButtonTop,
		_G.PrimaryProfession1SpellButtonBottom,
		_G.PrimaryProfession2SpellButtonTop,
		_G.PrimaryProfession2SpellButtonBottom,
	}

	-- Toggles a recipe's stats based on whether it's linked or actually known.
	local function SetRecipeAsKnownOrLinked(recipe, is_linked)
		if is_linked then
			recipe:AddState("LINKED")
		else
			recipe:AddState("KNOWN")
			recipe:RemoveState("LINKED")
		end
	end

	--- Causes a scan of the tradeskill to be conducted. Function called when the scan button is clicked.   Parses recipes and displays output
	-- @name AckisRecipeList:Scan
	-- @usage AckisRecipeList:Scan(true)
	-- @param textdump Boolean indicating if we want the output to be a text dump, or if we want to use the ARL GUI
	-- @return A frame with either the text dump, or the ARL frame
	function addon:Scan(textdump, is_refresh)
		local current_prof, prof_level = _G.GetTradeSkillLine()

		if current_prof == _G.UNKNOWN then
			self:Print(L["OpenTradeSkillWindow"])
			return
		end

		if current_prof == private.runeforging_name then
			prof_level = _G.UnitLevel("player")
		end
		local player = private.Player
		player:SetProfessions()

		private.current_profession_scanlevel = prof_level

		-- Make sure we're only updating a profession the character actually knows - this could be a scan from a tradeskill link.
		local tradeskill_is_linked = _G.IsTradeSkillLinked() or _G.IsTradeSkillGuild()

		if not tradeskill_is_linked then
			player.scanned_professions[current_prof] = true
		end
		local insert_index = 1

		table.wipe(specialtices_indices)

		for index = 1, #PROFESSION_BUTTONS do
			local button = PROFESSION_BUTTONS[index]
			local spell_offset = button:GetParent().spellOffset

			if spell_offset then
				specialtices_indices[insert_index] = button:GetID() + spell_offset
				insert_index = insert_index + 1
			end
		end
		local specialty = SpecialtyTable[current_prof]

		for index, book_index in ipairs(specialtices_indices) do
			local spell_name = _G.GetSpellBookItemName(book_index, "profession")

			if not spell_name then
				player["Specialty"] = nil
				break
			elseif specialty and specialty[spell_name] then
				player["Specialty"] = specialty[spell_name]
			end

		end

		if self.InitializeLookups then
			self:InitializeLookups()
		end
		addon:InitializeProfession(current_prof)

		-------------------------------------------------------------------------------
		-- Scan all recipes and mark the ones we know
		-------------------------------------------------------------------------------
		table.wipe(header_list)

		-- Save the current state of the TradeSkillFrame so it can be restored after we muck with it.
		local have_materials = _G.TradeSkillFrame.filterTbl.hasMaterials
		local have_skillup = _G.TradeSkillFrame.filterTbl.hasSkillUp

		if _G.MRTAPI then
			_G.MRTAPI:PushFilterSelection()
		else
			if not _G.Skillet and have_materials then
				_G.TradeSkillFrame.filterTbl.hasMaterials = false
				_G.TradeSkillOnlyShowMakeable(false)
			end
			if not _G.Skillet and have_skillup then
				_G.TradeSkillFrame.filterTbl.hasSkillUp = false
				_G.TradeSkillOnlyShowSkillUps(false)
			end
			_G.SetTradeSkillInvSlotFilter(0, 1, 1)
			_G.TradeSkillUpdateFilterBar()
			_G.TradeSkillFrame_Update()

			-- Expand all headers so we can see all the recipes there are
			for i = _G.GetNumTradeSkills(), 1, -1 do
				local name, tradeType, _, isExpanded = _G.GetTradeSkillInfo(i)

				if tradeType == "header" and not isExpanded then
					header_list[name] = true
					_G.ExpandTradeSkillSubClass(i)
				end
			end
		end
		local recipe_list = private.recipe_list
		local recipes_found = 0
		local SF = private.recipe_state_flags
		local spell_overwrite_map = private.spell_overwrite_map

		for i = 1, _G.GetNumTradeSkills() do
			local tradeName, tradeType = _G.GetTradeSkillInfo(i)

			if tradeType ~= "header" then
				local spell_link = _G.GetTradeSkillRecipeLink(i)
				local spell_string = spell_link:match("^|c%x%x%x%x%x%x%x%x|H%w+:(%d+)")
				local spell_id = tonumber(spell_string)
				local recipe = recipe_list[spell_id]

				if recipe then
					-- Mark the first rank of the spell as known if we know rank 2 for certain recipes.
					-- This is only done for recipes which when you learn the higher rank, you lose the
					-- ability to learn the lower rank.

					-- If we have it in the mapping, set the lower rank spell to known
					if spell_overwrite_map[spell_id] then
						local overwrite_recipe = recipe_list[spell_overwrite_map[spell_id]]

						if overwrite_recipe then
							SetRecipeAsKnownOrLinked(overwrite_recipe, tradeskill_is_linked)
						else
							self:Debug(tradeName .. " " .. spell_overwrite_map[spell_id] .. L["MissingFromDB"])
						end
					end
					SetRecipeAsKnownOrLinked(recipe, tradeskill_is_linked)
					recipes_found = recipes_found + 1
				else
					self:Debug(tradeName .. " " .. spell_string .. L["MissingFromDB"])
				end
			end
		end

		-- Restore the state of the things we changed.
		if _G.MRTAPI then
			_G.MRTAPI:PopFilterSelection()
		else
			for i = _G.GetNumTradeSkills(), 1, -1 do
				local name, tradeType, _, isExpanded = _G.GetTradeSkillInfo(i)

				if header_list[name] then
					_G.CollapseTradeSkillSubClass(i)
				end
			end
			_G.TradeSkillFrame.filterTbl.hasMaterials = have_materials
			_G.TradeSkillOnlyShowMakeable(have_materials)
			_G.TradeSkillFrame.filterTbl.hasSkillUp = have_skillup
			_G.TradeSkillOnlyShowSkillUps(have_skillup)

			_G.TradeSkillUpdateFilterBar()
			_G.TradeSkillFrame_Update()
		end
		previous_recipe_count = current_recipe_count
		current_recipe_count = recipes_found

		if is_refresh and previous_recipe_count == recipes_found then
			return
		end
		player:UpdateReputations()

		-------------------------------------------------------------------------------
		-- Everything is ready - display the GUI or dump the list to text.
		-------------------------------------------------------------------------------
		if textdump then
			self:DisplayTextDump(recipe_list, current_prof)
		else
			if private.InitializeFrame then
				private.InitializeFrame()
			end
			self.Frame:Display(current_prof, tradeskill_is_linked)
		end
	end
end

-------------------------------------------------------------------------------
-- Text dumping functions
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--- Creates a new frame with the contents of a text dump so you can copy and paste
-- Code borrowed from Antiarc (Chatter) with permission
-- @name AckisRecipeList:DisplayTextDump
-- @param RecipeDB The database (array) which you wish read data from.
-- @param profession Which profession are you displaying data for
-- @param text The text to be dumped
--------------------------------------------------------------------------------
do
	local copy_frame = _G.CreateFrame("Frame", "ARLCopyFrame", _G.UIParent)
	copy_frame:SetBackdrop({
				       bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
				       edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
				       tile = true,
				       tileSize = 16,
				       edgeSize = 16,
				       insets = {
					       left = 3,
					       right = 3,
					       top = 5,
					       bottom = 3
				       }
			       })
	copy_frame:SetBackdropColor(0, 0, 0, 1)
	copy_frame:SetWidth(750)
	copy_frame:SetHeight(400)
	copy_frame:SetPoint("CENTER", _G.UIParent, "CENTER")
	copy_frame:SetFrameStrata("DIALOG")

	table.insert(_G.UISpecialFrames, "ARLCopyFrame")

	local scrollArea = _G.CreateFrame("ScrollFrame", "ARLCopyScroll", copy_frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", copy_frame, "TOPLEFT", 8, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -30, 8)

	local edit_box = _G.CreateFrame("EditBox", nil, copy_frame)
	edit_box:SetMultiLine(true)
	edit_box:SetMaxLetters(0)
	edit_box:EnableMouse(true)
	edit_box:SetAutoFocus(true)
	edit_box:SetFontObject("ChatFontNormal")
	edit_box:SetWidth(650)
	edit_box:SetHeight(270)
	edit_box:SetScript("OnEscapePressed", function()
		copy_frame:Hide()
	end)
	edit_box:HighlightText(0)

	scrollArea:SetScrollChild(edit_box)

	local close = _G.CreateFrame("Button", nil, copy_frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", copy_frame, "TOPRIGHT")

	copy_frame:Hide()

	function addon:DisplayTextDump(RecipeDB, profession, text)
		local text = (not RecipeDB and not profession) and text or self:GetTextDump(profession)

		if text ~= "" then
			edit_box:SetText(text)
			edit_box:HighlightText(0)
			edit_box:SetCursorPosition(1)
			copy_frame:Show()
		end
	end
end	-- do

do
	-------------------------------------------------------------------------------
	-- Dumps recipe output in the format requested by the user
	-------------------------------------------------------------------------------
	local text_table = {}
	local acquire_list = {}
	local ACQUIRE_NAMES = private.acquire_names

	local GetFilterNames
	do
		local LC = _G.LOCALIZED_CLASS_NAMES_MALE
		local FILTER_NAMES

		function GetFilterNames()
			if not FILTER_NAMES then
				local is_alliance = (private.Player.faction == "Alliance")

				FILTER_NAMES = {
					[1]	= BFAC["Alliance"],
					[2]	= BFAC["Horde"],
					[3]	= L["Trainer"],
					[4]	= L["Vendor"],
					[5]	= _G.INSTANCE,
					[6]	= _G.RAID,
					[7]	= _G.EVENTS_LABEL,
					[8]	= L["Quest"],
					[9]	= _G.PVP,
					[10]	= L["World Drop"],
					[11]	= L["Mob Drop"],
					[12]	= L["Discovery"],
					[13]	= L["Retired"],
					[21]	= LC["DEATHKNIGHT"],
					[22]	= LC["DRUID"],
					[23]	= LC["HUNTER"],
					[24]	= LC["MAGE"],
					[25]	= LC["PALADIN"],
					[26]	= LC["PRIEST"],
					[27]	= LC["SHAMAN"],
					[28]	= LC["ROGUE"],
					[29]	= LC["WARLOCK"],
					[30]	= LC["WARRIOR"],
					[36]	= L["BOEFilter"],
					[37]	= L["BOPFilter"],
					[38]	= L["BOAFilter"],
					[40]	= L["RecipeBOEFilter"],
					[41]	= L["RecipeBOPFilter"],
					[42]	= L["RecipeBOAFilter"],
					[51]	= _G.MELEE,
					[52]	= _G.TANK,
					[53]	= _G.HEALER,
					[54]	= _G.DAMAGER,
					[56]	= L["Cloth"],
					[57]	= L["Leather"],
					[58]	= L["Mail"],
					[59]	= L["Plate"],
					[60]	= L["Cloak"],
					[61]	= L["Trinket"],
					[62]	= L["Ring"],
					[63]	= L["Necklace"],
					[64]	= L["Shield"],
					[66]	= L["One Hand"],
					[67]	= L["Two Hand"],
					[68]	= L["Axe"],
					[69]	= L["Sword"],
					[70]	= L["Mace"],
					[71]	= L["Polearm"],
					[72]	= L["Dagger"],
					[73]	= L["Staff"],
					[74]	= L["Wand"],
					[75]	= L["Thrown"],
					[76]	= L["Bow"],
					[77]	= L["Crossbow"],
					[79]	= L["Fist"],
					[80]	= L["Gun"],
					[96]	= BFAC["Argent Dawn"],
					[97]	= BFAC["Cenarion Circle"],
					[98]	= BFAC["Thorium Brotherhood"],
					[99]	= BFAC["Timbermaw Hold"],
					[100]	= BFAC["Zandalar Tribe"],
					[101]	= BFAC["The Aldor"],
					[102]	= BFAC["Ashtongue Deathsworn"],
					[103]	= BFAC["Cenarion Expedition"],
					[104]	= (is_alliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]),
					[105]	= BFAC["The Consortium"],
					[106]	= BFAC["Keepers of Time"],
					[107]	= BFAC["Lower City"],
					[108]	= (is_alliance and BFAC["Kurenai"] or BFAC["The Mag'har"]),
					[109]	= BFAC["The Scale of the Sands"],
					[110]	= BFAC["The Scryers"],
					[111]	= BFAC["The Sha'tar"],
					[112]	= BFAC["Shattered Sun Offensive"],
					[113]	= BFAC["Sporeggar"],
					[114]	= BFAC["The Violet Eye"],
					[115]	= BFAC["Argent Crusade"],
					[116]	= BFAC["Frenzyheart Tribe"],
					[117]	= BFAC["Knights of the Ebon Blade"],
					[118]	= BFAC["Kirin Tor"],
					[119]	= BFAC["The Sons of Hodir"],
					[120]	= BFAC["The Kalu'ak"],
					[121]	= BFAC["The Oracles"],
					[122]	= BFAC["The Wyrmrest Accord"],
					[123]	= (is_alliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]),
					[124]	= (is_alliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]),
					[125]	= (is_alliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]),
					[126]	= (is_alliance and BFAC["The Frostborn"] or BFAC["The Taunka"]),
					[127]	= (is_alliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]),
					[128]	= BFAC["The Ashen Verdict"],
					[129]	= (is_alliance and BFAC["Wildhammer Clan"] or BFAC["Dragonmaw Clan"]),
					[130]	= (is_alliance and BFAC["Baradin's Wardens"] or BFAC["Hellscream's Reach"]),
					[131]	= BFAC["Guardians of Hyjal"],
					[132]	= BFAC["Ramkahen"],
					[133]	= BFAC["The Earthen Ring"],
					[134]	= BFAC["Therazane"],
				}
			end
			return FILTER_NAMES
		end
	end	-- do

	---Dumps the recipe database in a format that is readable to humans (or machines)
	function addon:GetTextDump(profession)
		local output = addon.db.profile.textdumpformat
		table.wipe(text_table)

		if not output or output == "Comma" then
			table.insert(text_table, ("Ackis Recipe List Text Dump for %s's %s, in the form of Comma Separated Values.\n  "):format(private.player_name, profession))
			table.insert(text_table, "Spell ID,Recipe Name,Skill Level,ARL Filter Flags,Acquire Methods,Known\n")
		elseif output == "BBCode" then
			table.insert(text_table, ("Ackis Recipe List Text Dump for %s's %s, in the form of BBCode.\n"):format(private.player_name, profession))
		elseif output == "XML" then
			table.insert(text_table, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
		end

		local recipe_list = private.recipe_list
		local SF = private.recipe_state_flags

		for recipe_id in pairs(recipe_list) do
			local recipe = recipe_list[recipe_id]
			local recipe_prof = _G.GetSpellInfo(recipe.profession)
			local is_known = recipe:HasState("KNOWN")

			if recipe_prof == profession then
				-- CSV
				if not output or output == "Comma" then
					-- Add Spell ID, Name and Skill Level to the list
					table.insert(text_table, recipe_id)
					table.insert(text_table, ",")
					table.insert(text_table, recipe.name)
					table.insert(text_table, ",")
					table.insert(text_table, recipe.skill_level)
					table.insert(text_table, ",\"")
				-- BBCode
				elseif output == "BBCode" then
					-- Make the entry red
					if not is_known then
						table.insert(text_table, "[color=red]")
					end
					table.insert(text_table, "\n[b]" .. recipe_id .. "[/b] - " .. recipe.name .. " (" .. recipe.skill_level .. ")\n")

					-- Close Color tag
					if not is_known then
						table.insert(text_table, "[/color]\nRecipe Flags:\n[list]")
					elseif is_known then
						table.insert(text_table, "\nRecipe Flags:\n[list]")
					end
				--XML
				elseif output == "XML" then
					table.insert(text_table, "<recipe>")
					table.insert(text_table, "  <id>..recipe_id..</id>")
					table.insert(text_table, "  <name>"..recipe.name.."</name>")
					table.insert(text_table, "  <skilllevel>..recipe.skill_level..</skilllevel>")
					table.insert(text_table, "  <known>"..tostring(is_known).."</known>")
					table.insert(text_table, "  <flags>")
				--Name
				elseif output == "Name" then
					table.insert(text_table, recipe.name)
				end

				-- Add in all the filter flags
				local filter_names = GetFilterNames()
				local prev = false

				-- Find out which flags are set
				for table_index, bits in ipairs(private.bit_flags) do
					for flag_name, flag in pairs(bits) do
						local bitfield = recipe.flags[private.flag_members[table_index]]

						if bitfield and bit.band(bitfield, flag) == flag then
							if not output or output == "Comma" then
								if prev then
									table.insert(text_table, ",")
								end
								table.insert(text_table, filter_names[private.filter_ids[flag_name]])
								prev = true
								-- BBCode
							elseif output == "BBCode" then
								table.insert(text_table, "[*]"..filter_names[private.filter_ids[flag_name]])
							elseif output == "XML" then
								table.insert(text_table, "    <flag>"..filter_names[private.filter_ids[flag_name]].."</flag>")
							end
						end
					end
				end

				if not output or output == "Comma" then
					table.insert(text_table, "\",\"")
				elseif output == "BBCode" then
					table.insert(text_table, "[/list]\nAcquire Methods:\n[list]")
				elseif output == "XML" then
					table.insert(text_table, "  </flags>")
					table.insert(text_table, "  <acquire>")
				end

				-- Find out which unique acquire methods we have
				local acquire_data = recipe["acquire_data"]
				table.wipe(acquire_list)

				for acquire_type in pairs(acquire_data) do
					acquire_list[ACQUIRE_NAMES[acquire_type]] = true
				end

				-- Add all the acquire methods in
				prev = false

				for i in pairs(acquire_list) do
					if not output or output == "Comma" then
						if prev then
							table.insert(text_table, ",")
						end
						table.insert(text_table, i)
						prev = true
					elseif output == "BBCode" then
						table.insert(text_table, "[*] " .. i)
					elseif output == "XML" then
						table.insert(text_table, "<acquiremethod>"..i.."</acquiremethod>")
					end
				end

				if not output or output == "Comma" then
					table.insert(text_table, "\","..tostring(is_known).."\n")
					--if is_known then
					--	table.insert(text_table, "\",true\n")
					--else
					--	table.insert(text_table, "\",false\n")
					--end
				elseif output == "BBCode" then
					table.insert(text_table, "\n[/list]")
				elseif output == "XML" then
					table.insert(text_table, "  </acquire>")
					table.insert(text_table, "</recipe>")
				end
			end
		end	-- for
		return table.concat(text_table, "")
	end
end
