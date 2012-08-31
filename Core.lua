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

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceConsole-3.0", "AceEvent-3.0")
_G.AckisRecipeList = addon

--@alpha@
_G.ARL = addon
--@end-alpha@

local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local Toast = LibStub("LibToast-1.0")

local debugger = _G.tekDebug and _G.tekDebug:GetFrame(private.addon_name)

private.build_num = select(2, _G.GetBuildInfo())

------------------------------------------------------------------------------
-- Constants.
------------------------------------------------------------------------------
local PROFESSION_INIT_FUNCS

------------------------------------------------------------------------------
-- Database tables
------------------------------------------------------------------------------
local AllSpecialtiesTable = {}
local SpecialtyTable

-- Global Frame Variables
addon.optionsFrame = {}

-------------------------------------------------------------------------------
-- Debugger.
-------------------------------------------------------------------------------
function addon:Debug(...)
	if debugger then
		local text = string.format(...)
		debugger:AddMessage(text)

		--@debug@
		Toast:Spawn("ARL_DebugToast", text)
		--@end-debug@
	else
		--@debug@
		self:Printf(...)
		--@end-debug@
	end
end

Toast:Register("ARL_DebugToast", function(toast, ...)
	toast:SetTitle(("%s - Debug"):format(private.addon_name))
	toast:SetText(...)
	toast:SetIconTexture([[Interface\HELPFRAME\HotIssueIcon]])
end)

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

	function addon:DumpZones()
		table.wipe(output)
		table.insert(output, "private.ZONE_NAMES = {")

		for index = 1, 100000 do
			local zone_name = _G.GetMapNameByID(index)

			if zone_name then
				table.insert(output, ("[%d] = \"%s\","):format(index, zone_name:upper():gsub(" ", "_"):gsub("'", ""):gsub(":", ""):gsub("-", "_")))
			end
		end
		table.insert(output, "}\n")
		self:DisplayTextDump(nil, nil, table.concat(output, "\n"))
	end
end -- do

-------------------------------------------------------------------------------
-- Initialization functions
-------------------------------------------------------------------------------
local REQUIRED_LIBS = {
	"AceLocale-3.0",
	"LibBabble-Boss-3.0",
	"LibBabble-Faction-3.0",
	"LibBabble-Zone-3.0",
	"LibQTip-1.0",
	"LibToast-1.0"
}

function addon:OnInitialize()
	-------------------------------------------------------------------------------
	-- Check to see if we have mandatory libraries loaded. If not, notify the user
	-- which are missing and return.
	-------------------------------------------------------------------------------
	local missing_libraries = false

	for index = 1, #REQUIRED_LIBS do
		local library_name = REQUIRED_LIBS[index]

		if not LibStub:GetLibrary(library_name, true) then
			missing_libraries = true
			addon:Print(L["MISSING_LIBRARY"]:format(library_name))
		end
	end
	REQUIRED_LIBS = nil

	if missing_libraries then
		--@debug@
		addon:Print("You are using a development version of ARL.  As per WowAce standards, externals are not set up.  You will have to install all necessary libraries in order for the addon to function correctly.")
		--@end-debug@
		_G.AckisRecipeList = nil
		return
	end

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
			current_tab = 3, -- Name tab
			skill_view = false, -- Sort the recipes by skill level instead of name?

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
					achievement = true,
					discovery = true,
					expansion0 = true,
					expansion1 = true,
					expansion2 = true,
					expansion3 = true,
					expansion4 = true,
					instance = true,
					mobdrop = true,
					pvp = true,
					quest = true,
					raid = true,
					reputation = true,
					seasonal = true,
					trainer = true,
					vendor = true,
					worlddrop = true,
				},
				-------------------------------------------------------------------------------
				-- Profession Item Filters
				-------------------------------------------------------------------------------
				item = {
					-- These are populated from the item flags in Constants.lua
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

	for filter_name in pairs(private.ITEM_FILTER_TYPES) do
		defaults.profile.filters.item[filter_name:lower()] = true
	end
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
	PROFESSION_INIT_FUNCS = {
		[private.LOCALIZED_PROFESSION_NAMES.ALCHEMY] = addon.InitAlchemy,
		[private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING] = addon.InitBlacksmithing,
		[private.LOCALIZED_PROFESSION_NAMES.COOKING] = addon.InitCooking,
		[private.LOCALIZED_PROFESSION_NAMES.ENCHANTING] = addon.InitEnchanting,
		[private.LOCALIZED_PROFESSION_NAMES.ENGINEERING] = addon.InitEngineering,
		[private.LOCALIZED_PROFESSION_NAMES.FIRSTAID] = addon.InitFirstAid,
		[private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING] = addon.InitLeatherworking,
		[private.LOCALIZED_PROFESSION_NAMES.SMELTING] = addon.InitSmelting,
		[private.LOCALIZED_PROFESSION_NAMES.TAILORING] = addon.InitTailoring,
		[private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING] = addon.InitJewelcrafting,
		[private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION] = addon.InitInscription,
		[private.LOCALIZED_PROFESSION_NAMES.RUNEFORGING] = addon.InitRuneforging,
	}
	-------------------------------------------------------------------------------
	-- Hook GameTooltip so we can show information on mobs that drop/sell/train
	-------------------------------------------------------------------------------
	_G.GameTooltip:HookScript("OnTooltipSetUnit", function(self)
		if not addon.db.profile.recipes_in_tooltips then
			return
		end
		local name, tooltip_unit = self:GetUnit()

		if not tooltip_unit then
			return
		end
		local id_num = private.MobGUIDToIDNum(_G.UnitGUID(tooltip_unit))
		local unit = private.mob_list[id_num] or private.vendor_list[id_num] or private.trainer_list[id_num]

		if not unit or not unit.item_list then
			return
		end
		local player = private.Player
		local count = 0

		for spell_id in pairs(unit.item_list) do
			local recipe = private.recipe_list[spell_id]
			local recipe_prof = _G.GetSpellInfo(recipe.profession)

			if player.scanned_professions[recipe_prof] then
				local skill_level = player.professions[recipe_prof]
				local has_level = skill_level and (type(skill_level) == "boolean" and true or skill_level >= recipe.skill_level)

				if (_G.IsShiftKeyDown() or (not recipe:HasState("KNOWN") and has_level)) and player:HasRecipeFaction(recipe) then
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

--- Function run when the addon is enabled.  Registers events and pre-loads certain variables.
function addon:OnEnable()
	self:RegisterEvent("TRADE_SKILL_SHOW") -- Make addon respond to the tradeskill windows being shown
	self:RegisterEvent("TRADE_SKILL_CLOSE") -- Addon responds to tradeskill windows being closed.
	self:RegisterEvent("TRADE_SKILL_UPDATE")

	if addon.db.profile.scantrainers then
		self:RegisterEvent("TRAINER_SHOW")
	end

	if addon.db.profile.scanvendors then
		self:RegisterEvent("MERCHANT_SHOW")
	end
	private.Player:Initialize()

	-------------------------------------------------------------------------------
	-- Initialize the SpecialtyTable and AllSpecialtiesTable.
	-------------------------------------------------------------------------------
	do
		local EngineeringSpec = {
			[_G.GetSpellInfo(20219)] = 20219, -- Gnomish
			[_G.GetSpellInfo(20222)] = 20222, -- Goblin
		}

		SpecialtyTable = {
			[_G.GetSpellInfo(51306)] = EngineeringSpec,
		}

		for i in pairs(EngineeringSpec) do
			AllSpecialtiesTable[i] = true
		end
	end -- do
end

function addon:OnDisable()
	if addon.Frame then
		addon.Frame:Hide()
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
local TRADESKILL_ADDON_INITS = {
	ATSWFrame = function(scan_button)
		scan_button:SetParent(_G.ATSWFrame)

		if _G.TradeJunkieMain and _G.TJ_OpenButtonATSW then
			scan_button:SetPoint("RIGHT", _G.TJ_OpenButtonATSW, "LEFT", 0, 0)
		else
			scan_button:SetPoint("RIGHT", _G.ATSWOptionsButton, "LEFT", 0, 0)
		end
		scan_button:SetHeight(_G.ATSWOptionsButton:GetHeight())
		scan_button:SetWidth(_G.ATSWOptionsButton:GetWidth())
	end,
	CauldronFrame = function(scan_button)
		scan_button:SetParent(_G.CauldronFrame)
		scan_button:SetPoint("TOP", _G.CauldronFrame, "TOPRIGHT", -58, -52)
		scan_button:SetWidth(90)
	end,
	BPM_ShowTrainerFrame = function(scan_button)
		scan_button:SetParent(_G.BPM_ShowTrainerFrame)
		scan_button:SetPoint("RIGHT", _G.BPM_ShowTrainerFrame, "LEFT", 4, 0)
		scan_button:SetWidth(scan_button:GetTextWidth() + 10)
		scan_button:Show()
	end,
	MRTAPI = function(scan_button)
		_G.MRTAPI:RegisterHandler("TradeSkillWindowOnShow", function()
			scan_button:SetParent(_G.MRTSkillFrame)
			scan_button:SetPoint("RIGHT", _G.MRTSkillFrameCloseButton, "LEFT", 4, 0)
			scan_button:SetWidth(scan_button:GetTextWidth() + 10)
			scan_button:Show()
		end)
	end,
	MRTSkillFrame = function(scan_button)
		scan_button:SetParent(_G.MRTSkillFrame)
		scan_button:SetPoint("RIGHT", _G.MRTSkillFrame, "LEFT", 4, 0)
		scan_button:SetWidth(scan_button:GetTextWidth() + 10)
		scan_button:Show()
	end,
	Skillet = function(scan_button)
		if not _G.Skillet:IsActive() then
			return
		end
		scan_button:SetParent(_G.SkilletFrame)
		scan_button:SetWidth(80)
		_G.Skillet:AddButtonToTradeskillWindow(scan_button)
	end,
}

function addon:CreateScanButton()
	local scan_button = _G.CreateFrame("Button", nil, _G.TradeSkillFrame, "UIPanelButtonTemplate")
	scan_button:SetHeight(20)
	scan_button:RegisterForClicks("LeftButtonUp")
	scan_button:SetText(L["Scan"])

	-------------------------------------------------------------------------------
	-- Grab the first lucky Trade Skill AddOn that exists and hand the scan button to it.
	-------------------------------------------------------------------------------
	for entity, init_func in pairs(TRADESKILL_ADDON_INITS) do
		if _G[entity] then
			scan_button:ClearAllPoints()
			init_func(scan_button)
			break
		end
	end
	local scan_parent = scan_button:GetParent()
	scan_button:SetFrameLevel(scan_parent:GetFrameLevel() + 1)
	scan_button:SetFrameStrata(scan_parent:GetFrameStrata())
	scan_button:Enable()

	scan_button:SetScript("OnClick", function(self, button, down)
		local main_panel = addon.Frame
		local prev_profession

		if main_panel then
			prev_profession = private.ORDERED_PROFESSIONS[main_panel.profession]
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
	local player_name = private.PLAYER_NAME
	local realm_name = private.REALM_NAME

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
		addon:Debug("nil profession passed to InitializeProfession()")
		return
	end
	local func = PROFESSION_INIT_FUNCS[profession]

	if func then
		func(addon)
		PROFESSION_INIT_FUNCS[profession] = nil
	end
end

do
	-- Code snippet stolen from GearGuage by Torhal and butchered by Ackis
	local function StrSplit(input)
		if not input then
			return nil, nil
		end
		local arg1, arg2, var1

		arg1, var1 = input:match("^([^%s]+)%s*(.*)$")
		arg1 = (arg1 and arg1:lower() or input:lower())

		if var1 then
			-- Small hack to get code to work with first aid.
			if var1:lower() == private.LOCALIZED_PROFESSION_NAMES.FIRSTAID:lower() then
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
			if not arg2 or arg2 == "" then
				self:Print(L["COMMAND_LINE_SCAN"])
			else
				_G.CastSpellByName(arg2)

				if self.Frame and self.Frame:IsVisible() then
					self.Frame:Hide()
				else
					if private.InitializeFrame then
						private.InitializeFrame()
					end
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
	self:InitCustom()
	self:InitDiscovery()
	self:InitMob()
	self:InitQuest()
	self:InitReputation()
	self:InitTrainer()
	self:InitSeasons()
	self:InitVendor()

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

	--- Causes a scan of the tradeskill to be conducted. Function called when the scan button is clicked.   Parses recipes and displays output
	-- @name AckisRecipeList:Scan
	-- @usage AckisRecipeList:Scan(true)
	-- @param textdump Boolean indicating if we want the output to be a text dump, or if we want to use the ARL GUI
	-- @return A frame with either the text dump, or the ARL frame
	function addon:Scan(textdump, is_refresh)
		local profession_name, prof_level = _G.GetTradeSkillLine()

		if profession_name == _G.UNKNOWN then
			self:Print(L["OpenTradeSkillWindow"])
			return
		end

		if _G.TradeSkillFrame and _G.TradeSkillFrame:IsVisible() then
			-- Clear the search box focus so the scan will have correct results.
			local search_box = _G.TradeSkillFrameSearchBox
			search_box:SetText("")
			_G.TradeSkillSearch_OnTextChanged(search_box)
			search_box:ClearFocus()
			search_box:GetScript("OnEditFocusLost")(search_box)
		end

		if profession_name == private.LOCALIZED_PROFESSION_NAMES.RUNEFORGING then
			prof_level = _G.UnitLevel("player")
		elseif profession_name == private.MINING_PROFESSION_NAME then
			profession_name = private.LOCALIZED_PROFESSION_NAMES.SMELTING
		end

		local player = private.Player
		player:UpdateProfessions()

		private.current_profession_scanlevel = prof_level

		-- Make sure we're only updating a profession the character actually knows - this could be a scan from a tradeskill link.
		local tradeskill_is_linked = _G.IsTradeSkillLinked() or _G.IsTradeSkillGuild()

		if not tradeskill_is_linked then
			player.scanned_professions[profession_name] = true
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
		local specialty = SpecialtyTable[profession_name]

		for index, book_index in ipairs(specialtices_indices) do
			local spell_name = _G.GetSpellBookItemName(book_index, "profession")

			if not spell_name then
				private.current_profession_specialty = nil
				break
			elseif specialty and specialty[spell_name] then
				private.current_profession_specialty = specialty[spell_name]
			end
		end

		if self.InitializeLookups then
			self:InitializeLookups()
		end
		addon:InitializeProfession(profession_name)

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
			if not _G.Skillet then
				if have_materials then
					_G.TradeSkillFrame.filterTbl.hasMaterials = false
					_G.TradeSkillOnlyShowMakeable(false)
				end

				if have_skillup then
					_G.TradeSkillFrame.filterTbl.hasSkillUp = false
					_G.TradeSkillOnlyShowSkillUps(false)
				end
			end
			_G.SetTradeSkillInvSlotFilter(0, 1, 1)
			_G.TradeSkillUpdateFilterBar()
			_G.TradeSkillFrame_Update()

			-- Expand all headers so we can see all the recipes there are
			for skill_index = _G.GetNumTradeSkills(), 1, -1 do
				local entry_name, entry_type, _, is_expanded = _G.GetTradeSkillInfo(skill_index)

				if (entry_type == "header" or entry_type == "subheader") and not is_expanded then
					header_list[entry_name] = true
					_G.ExpandTradeSkillSubClass(skill_index)
				end
			end
		end
		local profession_recipes = private.profession_recipe_list[profession_name]
		local recipes_found = 0
		local SPELL_OVERWRITE_MAP = private.SPELL_OVERWRITE_MAP

		for spell_id, recipe in pairs(profession_recipes) do
			recipe:RemoveState("KNOWN")
			recipe:RemoveState("RELEVANT")
			recipe:RemoveState("VISIBLE")
			recipe:RemoveState("LINKED")
		end

		for skill_index = 1, _G.GetNumTradeSkills() do
			local entry_name, entry_type = _G.GetTradeSkillInfo(skill_index)

			if entry_type ~= "header" and entry_type ~= "subheader" then
				local spell_string = _G.GetTradeSkillRecipeLink(skill_index):match("^|c%x%x%x%x%x%x%x%x|H%w+:(%d+)")
				local spell_id = tonumber(spell_string)
				local recipe = profession_recipes[spell_id]

				if recipe then
					-- Mark the first rank of the spell as known if we know rank 2 for certain recipes.
					-- This is only done for recipes which when you learn the higher rank, you lose the
					-- ability to learn the lower rank.

					-- If we have it in the mapping, set the lower rank spell to known
					if SPELL_OVERWRITE_MAP[spell_id] then
						local overwrite_recipe = profession_recipes[SPELL_OVERWRITE_MAP[spell_id]]

						if overwrite_recipe then
							overwrite_recipe:SetAsKnownOrLinked(tradeskill_is_linked)
						else
							self:Debug(entry_name .. " " .. SPELL_OVERWRITE_MAP[spell_id] .. L["MissingFromDB"])
						end
					end
					recipe:SetAsKnownOrLinked(tradeskill_is_linked)
					recipes_found = recipes_found + 1
				else
					self:Debug(entry_name .. " " .. spell_string .. L["MissingFromDB"])
				end
			end
		end

		-- Restore the state of the things we changed.
		if _G.MRTAPI then
			_G.MRTAPI:PopFilterSelection()
		else
			for skill_index = _G.GetNumTradeSkills(), 1, -1 do
				local entry_name, _, _, is_expanded = _G.GetTradeSkillInfo(skill_index)

				if header_list[entry_name] then
					_G.CollapseTradeSkillSubClass(skill_index)
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
			self:DisplayTextDump(profession_recipes, profession_name)
		else
			if private.InitializeFrame then
				private.InitializeFrame()
			end
			self.Frame:Display(profession_name, tradeskill_is_linked)
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

	function addon:DisplayTextDump(recipe_list, profession, text)
		local display_text = (not recipe_list and not profession) and text or self:GetTextDump(profession)

		if display_text == "" then
			return
		end
		edit_box:SetText(display_text)
		edit_box:HighlightText(0)
		edit_box:SetCursorPosition(1)
		copy_frame:Show()
	end
end -- do

do
	-------------------------------------------------------------------------------
	-- Dumps recipe output in the format requested by the user
	-------------------------------------------------------------------------------
	local text_table = {}
	local acquire_list = {}

	local GetFilterFlagNames
	do
		local LC = _G.LOCALIZED_CLASS_NAMES_MALE
		local FILTER_FLAG_NAMES

		function GetFilterFlagNames()
			if FILTER_FLAG_NAMES then
				return FILTER_FLAG_NAMES
			end
			local is_alliance = (private.Player.faction == "Alliance")

			FILTER_FLAG_NAMES = {
				-------------------------------------------------------------------------------
				-- Common flags.
				-------------------------------------------------------------------------------
				ALLIANCE = BFAC["Alliance"],
				HORDE = BFAC["Horde"],
				TRAINER = L["Trainer"],
				VENDOR = L["Vendor"],
				INSTANCE = _G.INSTANCE,
				RAID = _G.RAID,
				SEASONAL = _G.EVENTS_LABEL,
				QUEST = L["Quest"],
				PVP = _G.PVP,
				WORLD_DROP = L["World Drop"],
				MOB_DROP = L["Mob Drop"],
				DISC = L["Discovery"],
				RETIRED = L["Retired"],
				IBOE = L["BOEFilter"],
				IBOP = L["BOPFilter"],
				IBOA = L["BOAFilter"],
				RBOE = L["RecipeBOEFilter"],
				RBOP = L["RecipeBOPFilter"],
				RBOA = L["RecipeBOAFilter"],
				DPS = _G.MELEE,
				TANK = _G.TANK,
				HEALER = _G.HEALER,
				CASTER = _G.DAMAGER,
				ACHIEVEMENT = _G.ACHIEVEMENTS,
				-------------------------------------------------------------------------------
				-- Class flags.
				-------------------------------------------------------------------------------
				DK = LC["DEATHKNIGHT"],
				DRUID = LC["DRUID"],
				HUNTER = LC["HUNTER"],
				MAGE = LC["MAGE"],
				PALADIN = LC["PALADIN"],
				PRIEST = LC["PRIEST"],
				SHAMAN = LC["SHAMAN"],
				ROGUE = LC["ROGUE"],
				WARLOCK = LC["WARLOCK"],
				WARRIOR = LC["WARRIOR"],
				-------------------------------------------------------------------------------
				-- Reputation flags.
				-------------------------------------------------------------------------------
				ARGENTDAWN = BFAC["Argent Dawn"],
				CENARION_CIRCLE = BFAC["Cenarion Circle"],
				THORIUM_BROTHERHOOD = BFAC["Thorium Brotherhood"],
				TIMBERMAW_HOLD = BFAC["Timbermaw Hold"],
				ZANDALAR = BFAC["Zandalar Tribe"],
				ALDOR = BFAC["The Aldor"],
				ASHTONGUE = BFAC["Ashtongue Deathsworn"],
				CENARION_EXPEDITION = BFAC["Cenarion Expedition"],
				HELLFIRE = (is_alliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]),
				CONSORTIUM = BFAC["The Consortium"],
				KOT = BFAC["Keepers of Time"],
				LOWERCITY = BFAC["Lower City"],
				NAGRAND = (is_alliance and BFAC["Kurenai"] or BFAC["The Mag'har"]),
				SCALE_SANDS = BFAC["The Scale of the Sands"],
				SCRYER = BFAC["The Scryers"],
				SHATAR = BFAC["The Sha'tar"],
				SHATTEREDSUN = BFAC["Shattered Sun Offensive"],
				SPOREGGAR = BFAC["Sporeggar"],
				VIOLETEYE = BFAC["The Violet Eye"],
				ARGENTCRUSADE = BFAC["Argent Crusade"],
				FRENZYHEART = BFAC["Frenzyheart Tribe"],
				EBONBLADE = BFAC["Knights of the Ebon Blade"],
				KIRINTOR = BFAC["Kirin Tor"],
				HODIR = BFAC["The Sons of Hodir"],
				KALUAK = BFAC["The Kalu'ak"],
				ORACLES = BFAC["The Oracles"],
				WYRMREST = BFAC["The Wyrmrest Accord"],
				WRATHCOMMON1 = (is_alliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]),
				WRATHCOMMON2 = (is_alliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]),
				WRATHCOMMON3 = (is_alliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]),
				WRATHCOMMON4 = (is_alliance and BFAC["The Frostborn"] or BFAC["The Taunka"]),
				WRATHCOMMON5 = (is_alliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]),
				ASHEN_VERDICT = BFAC["The Ashen Verdict"],
				CATACOMMON1 = (is_alliance and BFAC["Wildhammer Clan"] or BFAC["Dragonmaw Clan"]),
				CATACOMMON2 = (is_alliance and BFAC["Baradin's Wardens"] or BFAC["Hellscream's Reach"]),
				GUARDIANS = BFAC["Guardians of Hyjal"],
				RAMKAHEN = BFAC["Ramkahen"],
				EARTHEN_RING = BFAC["The Earthen Ring"],
				THERAZANE = BFAC["Therazane"],
			}
			return FILTER_FLAG_NAMES
		end
	end -- do

	--- Dumps the recipe database in a format that is readable to humans (or machines)
	function addon:GetTextDump(profession_name)
		local output = addon.db.profile.textdumpformat or "Comma"
		table.wipe(text_table)

		if output == "Comma" then
			table.insert(text_table, ("Ackis Recipe List Text Dump for %s's %s, in the form of Comma Separated Values.\n  "):format(private.PLAYER_NAME, profession_name))
			table.insert(text_table, "Spell ID,Recipe Name,Skill Level,ARL Filter Flags,Acquire Methods,Known\n")
		elseif output == "BBCode" then
			table.insert(text_table, ("Ackis Recipe List Text Dump for %s's %s, in the form of BBCode.\n"):format(private.PLAYER_NAME, profession_name))
		elseif output == "XML" then
			table.insert(text_table, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
			table.insert(text_table, "\n<profession>")
		end

		local profession_recipes = private.profession_recipe_list[profession_name]

		for recipe_id in pairs(profession_recipes) do
			local recipe = profession_recipes[recipe_id]
			local is_known = recipe:HasState("KNOWN")

			if output == "Comma" then
				-- Add Spell ID, Name and Skill Level to the list
				table.insert(text_table, recipe_id)
				table.insert(text_table, ",")
				table.insert(text_table, recipe.name)
				table.insert(text_table, ",")
				table.insert(text_table, recipe.skill_level)
				table.insert(text_table, ",\"")
			elseif output == "BBCode" then
				-- Make the entry red
				table.insert(text_table, ("\n%s[b]%d[/b] - %s (%d)%s\n"):format(is_known and "" or "[color=red]", recipe_id, recipe.name, recipe.skill_level, is_known and "" or "[/color]"))

				table.insert(text_table, "\nRecipe Flags:\n[list]\n")
			elseif output == "XML" then
				table.insert(text_table, "\n<recipe>\n")
				table.insert(text_table, "  <id>" .. recipe_id .. "</id>\n")
				table.insert(text_table, "  <name>" .. recipe.name .. "</name>\n")
				table.insert(text_table, "  <skilllevel>" .. recipe.skill_level .. "</skilllevel>\n")
				table.insert(text_table, "  <known>" .. tostring(is_known) .. "</known>\n")
				table.insert(text_table, "  <flags>\n")
			elseif output == "Name" then
				table.insert(text_table, recipe.name)
			end

			-- Add in all the filter flags
			local filter_names = GetFilterFlagNames()
			local prev = false

			-- Find out which flags are set
			for table_index, bits in ipairs(private.FLAG_WORDS) do
				for flag_name, flag in pairs(bits) do
					local bitfield = recipe.flags[private.FLAG_MEMBERS[table_index]]

					if bitfield and bit.band(bitfield, flag) == flag then
						if output == "Comma" then
							if prev then
								table.insert(text_table, ",")
							end
							table.insert(text_table, filter_names[flag_name])
							prev = true
						elseif output == "BBCode" then
							table.insert(text_table, "[*]" .. filter_names[flag_name] .. "\n")
						elseif output == "XML" then
							table.insert(text_table, "    <flag>" .. filter_names[flag_name] .. "</flag>")
						end
					end
				end
			end

			if output == "Comma" then
				table.insert(text_table, "\",\"")
			elseif output == "BBCode" then
				table.insert(text_table, "[/list]\nAcquire Methods:\n[list]\n")
			elseif output == "XML" then
				table.insert(text_table, "  </flags>")
				table.insert(text_table, "  <acquire>")
			end

			-- Find out which unique acquire methods we have
			local acquire_data = recipe["acquire_data"]
			table.wipe(acquire_list)

			for acquire_type in pairs(acquire_data) do
				acquire_list[private.ACQUIRE_NAMES[acquire_type]] = true
			end

			-- Add all the acquire methods in
			prev = false

			for i in pairs(acquire_list) do
				if output == "Comma" then
					if prev then
						table.insert(text_table, ",")
					end
					table.insert(text_table, i)
					prev = true
				elseif output == "BBCode" then
					table.insert(text_table, "[*] " .. i)
				elseif output == "XML" then
					table.insert(text_table, "<acquiremethod>" .. i .. "</acquiremethod>")
				end
			end

			if output == "Comma" then
				table.insert(text_table, "\"," .. tostring(is_known) .. "\n")
				--if is_known then
				--	table.insert(text_table, "\",true\n")
				--else
				--	table.insert(text_table, "\",false\n")
				--end
			elseif output == "BBCode" then
				table.insert(text_table, "\n[/list]\n")
			elseif output == "XML" then
				table.insert(text_table, "  </acquire>")
				table.insert(text_table, "</recipe>")
			end
		end -- for

		if output == "XML" then
			table.insert(text_table, "\n</profession>")
		end
		return table.concat(text_table, "")
	end
end
