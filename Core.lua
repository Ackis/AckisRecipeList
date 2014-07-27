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
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
addon.constants = private.constants
addon.constants.addon_name = private.addon_name
_G.AckisRecipeList = addon

--@alpha@
_G.ARL = addon
--@end-alpha@

local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local Toast = LibStub("LibToast-1.0")
local Dialog = LibStub("LibDialog-1.0")

local debugger -- Only defined if needed.

local wow_version, wow_build_num, wow_date, wow_ui_version = _G.GetBuildInfo()
private.wow_version = wow_version
private.wow_build_num = wow_build_num
private.wow_ui_version = wow_ui_version

private.TextDump = LibStub("LibTextDump-1.0"):New(private.addon_name)

Dialog:Register("ARL_ModuleErrorDialog", {
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
	icon = [[Interface\DialogFrame\UI-Dialog-Icon-AlertNew]],
	text_justify_h = "LEFT",
	width = 400,
	on_show = function(self, profession_name)
		self.text:SetFormattedText("%s - %s\n\n%s", private.addon_name, addon.version, L.MODULE_ERROR_FORMAT:format(profession_name))
	end
})

Dialog:Register("ARL_NoModulesErrorDialog", {
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
	icon = [[Interface\DialogFrame\UI-Dialog-Icon-AlertNew]],
	text_justify_h = "LEFT",
	width = 400,
	on_show = function(self)
	-- TODO: Localize this.
		self.text:SetFormattedText("No profession module AddOns were found.\n\nAs of version 3.0, all professions were split into individual module AddOns. These can be obtained either from Curse, from the Curse Client, or from WoWInterface.\n\nThe main %s page on either site contains URLs for all of the module AddOns; download only those you need.", private.addon_name, private.addon_name)
	end
})

------------------------------------------------------------------------------
-- Constants.
------------------------------------------------------------------------------

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
local function CreateDebugFrame()
	if debugger then
		return
	end
	debugger = LibStub("LibTextDump-1.0"):New(("%s Debug Output"):format(private.addon_name), 640, 480)
end

function addon:Debug(...)
	if not debugger then
		CreateDebugFrame()
	end
	local text = string.format(...)
	debugger:AddLine(text)

	--@debug@
	Toast:Spawn("ARL_DebugToast", text)
	--@end-debug@
end
private.Debug = addon.Debug

Toast:Register("ARL_DebugToast", function(toast, ...)
	toast:SetTitle(("%s - Debug"):format(private.addon_name))
	toast:SetText(...)
	toast:SetIconTexture([[Interface\HELPFRAME\HotIssueIcon]])
end)

-------------------------------------------------------------------------------
-- Initialization functions
-------------------------------------------------------------------------------
local REQUIRED_LIBS = {
	"AceLocale-3.0",
	"LibBabble-Boss-3.0",
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
					expansion5 = true,
					instance = true,
					mobdrop = true,
					pvp = true,
					quest = true,
					raid = true,
					reputation = true,
					retired = false,
					seasonal = true,
					trainer = true,
					vendor = true,
					worlddrop = true,
					misc1 = true,
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
					item_bind_on_equip = true,
					item_bind_on_pickup = true,
					recipe_bind_on_equip = true,
					recipe_bind_on_pickup = true,
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
					ashenverdict = true,
					catacommon1 = true,
					guardiansofhyjal = true,
					ramkahen = true,
					earthenring = true,
					therazane = true,
					foresthozen = true,
					goldenlotus = true,
					cloudserpent = true,
					pearlfinjinyu = true,
					shadopan = true,
					anglers = true,
					augustcelestials = true,
					brewmasters = true,
					klaxxi = true,
					lorewalkers = true,
					tillers = true,
					blackprince = true,
					shangxiacademy = true,
					pandacommon1 = true,
				},
				-------------------------------------------------------------------------------
				-- Class Filters
				-------------------------------------------------------------------------------
				classes = {
					deathknight = true,
					druid = true,
					hunter = true,
					mage = true,
					monk = true,
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

	for filter_name in pairs(self.constants.ITEM_FILTER_TYPES) do
		defaults.profile.filters.item[filter_name:lower()] = true
	end
	self.db = LibStub("AceDB-3.0"):New("ARLDB2", defaults)

	if not self.db then
		self:Print("Error: Database not loaded correctly.  Please exit out of WoW and delete the ARL database file (AckisRecipeList.lua) found in: \\World of Warcraft\\WTF\\Account\\<Account Name>>\\SavedVariables\\")
		return
	end
	private.db = self.db

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
	self.is_development_version = debug_version
	self:SetupOptions()

	-- Register slash commands
	self:RegisterChatCommand("arl", "ChatCommand")
	self:RegisterChatCommand("ackisrecipelist", "ChatCommand")

	-------------------------------------------------------------------------------
	-- Hook GameTooltip so we can show information on mobs that drop/sell/train
	-------------------------------------------------------------------------------
	_G.GameTooltip:HookScript("OnTooltipSetUnit", function(self)
		if not addon.db.profile.recipes_in_tooltips then
			return
		end
		local _, tooltip_unit = self:GetUnit()

		if not tooltip_unit or not _G.UnitGUID(tooltip_unit) then
			return
		end
		local id_num = private.MobGUIDToIDNum(_G.UnitGUID(tooltip_unit))
		local unit = private.AcquireTypes.MobDrop:GetEntity(id_num) or private.AcquireTypes.Vendor:GetEntity(id_num) or private.AcquireTypes.Trainer:GetEntity(id_num)

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
	self.AcquireTypes = private.AcquireTypes

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
			[private.LOCALIZED_PROFESSION_NAMES.ENGINEERING] = EngineeringSpec,
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
		scan_button:SetPoint("RIGHT", _G.MRTSkillFrameCloseButton, "LEFT", 4, 0)
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
	TSMCraftingTradeSkillFrame = function(scan_button)
		local anchor = _G.TSMCraftingTradeSkillFrame
		scan_button:SetParent(anchor)
		scan_button:SetPoint("TOPRIGHT", anchor, "TOPRIGHT", -30, -3)
		scan_button:Show()
	end,
}

function addon:InitializeScanButton()
	local scan_button = self.scan_button

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
		scan_button = _G.CreateFrame("Button", nil, _G.TradeSkillFrame, "UIPanelButtonTemplate")
		scan_button:SetHeight(20)
		scan_button:RegisterForClicks("LeftButtonUp")
		scan_button:SetText(L["Scan"])

		scan_button:SetScript("OnClick", function(self, _, _)
			local main_panel = addon.Frame
			local prev_profession

			if main_panel then
				prev_profession = private.ORDERED_PROFESSIONS[main_panel.current_profession]
			end
			local shift_pressed = _G.IsShiftKeyDown()
			local alt_pressed = _G.IsAltKeyDown()
			local ctrl_pressed = _G.IsControlKeyDown()

			if shift_pressed and not alt_pressed and not ctrl_pressed then
				addon:Scan(true)
			elseif alt_pressed and not shift_pressed and not ctrl_pressed then
				addon:ClearWaypoints()
				--@debug@
			elseif ctrl_pressed then
				local current_prof = _G.GetTradeSkillLine()

				if shift_pressed and not alt_pressed then
					addon:ScanProfession(current_prof)
				elseif not shift_pressed and not alt_pressed then
					addon:DumpProfession(current_prof)
				end
				--@end-debug@
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
			--@debug@
			tooltip:AddLine("Control-click to generate a Lua code dump.")
			tooltip:AddLine("Control-Shift-click to scan for issues.")
			--@end-debug@
			tooltip:Show()
		end)
		scan_button:SetScript("OnLeave", function() _G.GameTooltip:Hide() end)

		self.scan_button = scan_button
	end
	self:InitializeScanButton()

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
	local profession_name = _G.GetTradeSkillLine()

	if profession_name == private.MINING_PROFESSION_NAME then
		profession_name = private.LOCALIZED_PROFESSION_NAMES.SMELTING
	end

	if private.PROFESSION_MODULE_NAMES[profession_name] then
		scan_button:Show()
	else
		scan_button:Hide()
	end
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
do
	local function InitializeLookups()
		addon:InitCustom()
		addon:InitMob()
		addon:InitQuest()
		addon:InitReputation()
		addon:InitTrainer()
		addon:InitWorldEvents()
		addon:InitVendor()

		InitializeLookups = nil
	end

	local loaded_modules = {}

	-- Returns true if a profession was initialized.
	function addon:InitializeProfession(profession_name)
		if not profession_name or not private.PROFESSION_MODULE_NAMES[profession_name] then
			addon:Debug("nil profession passed to InitializeProfession()")
			return false
		end

		if InitializeLookups then
			InitializeLookups()
		end

		if profession_name == private.MINING_PROFESSION_NAME then
			profession_name = private.LOCALIZED_PROFESSION_NAMES.SMELTING
		end
		local module_name = FOLDER_NAME .. "_" .. private.PROFESSION_MODULE_NAMES[profession_name] or ""

		if loaded_modules[module_name] then
			return true
		end
		local _, _, _, is_enabled = _G.GetAddOnInfo(module_name)

		if is_enabled then
			local is_loaded = _G.LoadAddOn(module_name) and true or false
			loaded_modules[module_name] = is_loaded
			return is_loaded
		end
		return false
	end
end -- do-block

local SUBCOMMAND_FUNCS = {
	[L["About"]:lower()] = function()
		if addon.optionsFrame["About"] then
			_G.InterfaceOptionsFrame_OpenToCategory(addon.optionsFrame["About"])
		else
			_G.InterfaceOptionsFrame_OpenToCategory(addon.optionsFrame)
		end
	end,
	[L["Documentation"]:lower()] = function()
		_G.InterfaceOptionsFrame_OpenToCategory(addon.optionsFrame["Documentation"])
	end,
	[L["Profile"]:lower()] = function()
		_G.InterfaceOptionsFrame_OpenToCategory(addon.optionsFrame["Profiles"])
	end,
	[L["Scan"]:lower()] = function(input)
		if not input or input == "" then
			addon:Print(L["COMMAND_LINE_SCAN"])
			return
		end
		local found
		input = input:lower()

		for profession_name in pairs(private.PROFESSION_NAME_MAP) do
			if input == profession_name:lower() then
				found = true
				break
			end
		end

		if not found then
			addon:Print(L["COMMAND_LINE_SCAN"])
			return
		end
		_G.CastSpellByName(input)

		if addon.Frame and addon.Frame:IsVisible() then
			addon.Frame:Hide()
		else
			if private.InitializeFrame then
				private.InitializeFrame()
			end
			addon:Scan(false, false)
		end
	end,
	debug = function()
		if not debugger then
			CreateDebugFrame()
		end

		if debugger:Lines() == 0 then
			debugger:AddLine("Nothing to report.")
			debugger:Display()
			debugger:Clear()
			return
		end
		debugger:Display()
	end,
	--@debug@
	dump = function(arg1, arg2)
		local func = private.DUMP_COMMANDS[arg1]

		if func then
			func(arg2)
		else
			addon:Print("Unknown dump command:")

			for command in pairs(private.DUMP_COMMANDS) do
				addon:Print(command)
			end
		end
	end,
	scanprofs = function()
		addon:ScanProfession("all")
	end,
	--@end-debug@
}

function addon:ChatCommand(input)
	local arg1, arg2, arg3 = self:GetArgs(input, 3)

	if arg1 then
		arg1 = arg1:trim():lower()
	end

	-- Open About panel if there's no parameters or if we do /arl about
	if not arg1 or arg1 == L["Sorting"]:lower() or arg1 == L["Sort"]:lower() or arg1 == _G.DISPLAY:lower() then
		_G.InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	else
		local func = SUBCOMMAND_FUNCS[arg1]
		if func then
			func(arg2, arg3)
		else
			LibStub("AceConfigCmd-3.0"):HandleCommand("arl", "Ackis Recipe List", arg1)
		end
	end
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

	local function SetPreviousRanksKnown(previous_rank_id, profession_recipes, tradeskill_is_linked)
		local previous_rank_recipe = profession_recipes[previous_rank_id]

		if previous_rank_recipe then
			previous_rank_recipe:SetAsKnownOrLinked(tradeskill_is_linked)
		end
		local nested_previous_rank_id = previous_rank_recipe:PreviousRankID()

		if nested_previous_rank_id then
			SetPreviousRanksKnown(nested_previous_rank_id, profession_recipes, tradeskill_is_linked)
		end
	end

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
		private.current_profession_specialty = nil

		if profession_name == private.MINING_PROFESSION_NAME then
			profession_name = private.LOCALIZED_PROFESSION_NAMES.SMELTING
		end
		local profession_module_name = private.PROFESSION_MODULE_NAMES[profession_name]

		if not profession_module_name then
			return
		end
		self:InitializeProfession(profession_name)

		if not self:GetModule(profession_module_name, true) then
			local found_module

			for profession_name, module_name in pairs(private.PROFESSION_MODULE_NAMES) do
				local _, _, _, _, _, reason = _G.GetAddOnInfo(FOLDER_NAME .. "_" .. module_name or "")
				if not reason or reason == "DISABLED" then
					-- The assumption here is that if a module is disabled, the user is aware that modules exist.
					found_module = true
					break
				end
			end

			if found_module then
				Dialog:Spawn("ARL_ModuleErrorDialog", profession_module_name)
			else
				Dialog:Spawn("ARL_NoModulesErrorDialog")
			end
			return
		end

		local player = private.Player
		player:UpdateProfessions()

		private.current_profession_scanlevel = prof_level

		-- Clear the search box and its focus so the scan will have correct results.
		if _G.TradeSkillFrame and _G.TradeSkillFrame:IsVisible() then
			local search_box = _G.TradeSkillFrameSearchBox
			search_box:ClearFocus()
			search_box:GetScript("OnEditFocusLost")(search_box)
			search_box:SetText("")
			_G.TradeSkillSearch_OnTextChanged(search_box)
		end

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
			local specialization_offset = button:GetParent().specializationOffset

			if spell_offset then
				specialtices_indices[insert_index] = specialization_offset + spell_offset
				insert_index = insert_index + 1
			end
		end
		local profession_specialties = SpecialtyTable[profession_name]

		if profession_specialties then
			for _, book_index in ipairs(specialtices_indices) do
				local spell_name = _G.GetSpellBookItemName(book_index, _G.BOOKTYPE_PROFESSION)

				if not spell_name then
					break
				elseif profession_specialties[spell_name] then
					private.current_profession_specialty = profession_specialties[spell_name]
					break
				end
			end
		end

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

		for _, recipe in pairs(profession_recipes) do
			recipe:RemoveState("KNOWN")
			recipe:RemoveState("RELEVANT")
			recipe:RemoveState("VISIBLE")
			recipe:RemoveState("LINKED")
		end

		for skill_index = 1, _G.GetNumTradeSkills() do
			local entry_name, entry_type = _G.GetTradeSkillInfo(skill_index)

			if entry_type ~= "header" and entry_type ~= "subheader" then
				local spell_id = tonumber(_G.GetTradeSkillRecipeLink(skill_index):match("^|c%x%x%x%x%x%x%x%x|H%w+:(%d+)"))
				local recipe = profession_recipes[spell_id]

				if recipe then
					local previous_rank_id = recipe:PreviousRankID()

					if previous_rank_id then
						SetPreviousRanksKnown(previous_rank_id, profession_recipes, tradeskill_is_linked)
					end
					recipe:SetAsKnownOrLinked(tradeskill_is_linked)
					recipes_found = recipes_found + 1
				else
					--@debug@
					local profession_id
					for _, profession_spell_id in pairs(private.PROFESSION_SPELL_IDS) do
						if profession_name == _G.GetSpellInfo(profession_spell_id) then
							profession_id = profession_spell_id
							break
						end
					end
					local F = private.FILTER_IDS

					local recipe = addon:AddRecipe(spell_id, profession_id, _G.GetExpansionLevel() + 1, private.ITEM_QUALITIES.COMMON)
					recipe:SetSkillLevels(0, 0, 0, 0, 0)
					recipe:AddFilters(F.ALLIANCE, F.HORDE, F.TRAINER)
					addon:Printf("Added '%s (%d)' to %s. Do a profession dump.", entry_name, spell_id, profession_name)
					--@end-debug@

					if not self.is_development_version then
						self:Debug("%s (%d): %s", entry_name, spell_id, L["MissingFromDB"])
					end
				end
			end
		end

		-- Restore the state of the things we changed.
		if _G.MRTAPI then
			_G.MRTAPI:PopFilterSelection()
		else
			for skill_index = _G.GetNumTradeSkills(), 1, -1 do
				local entry_name = _G.GetTradeSkillInfo(skill_index)

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
			self:GetTextDump(profession_name)
		else
			if private.InitializeFrame then
				private.InitializeFrame()
			end
			self.Frame:Display(profession_name, tradeskill_is_linked)
		end
	end
end

do
	-------------------------------------------------------------------------------
	-- Dumps recipe output in the format requested by the user
	-------------------------------------------------------------------------------
	local acquire_list = {}

	local GetFilterFlagNames
	do
		local LC = _G.LOCALIZED_CLASS_NAMES_MALE
		local LFAC = private.LOCALIZED_FACTION_STRINGS_FROM_LABEL
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
				ALLIANCE = LFAC.ALLIANCE,
				HORDE = LFAC.HORDE,
				TRAINER = L["Trainer"],
				VENDOR = L["Vendor"],
				INSTANCE = _G.INSTANCE,
				RAID = _G.RAID,
				WORLD_EVENTS = _G.EVENTS_LABEL,
				QUEST = L["Quest"],
				PVP = _G.PVP,
				WORLD_DROP = L["World Drop"],
				MOB_DROP = L["Mob Drop"],
				DISC = L["Discovery"],
				RETIRED = L["Retired"],
				DPS = _G.MELEE,
				TANK = _G.TANK,
				HEALER = _G.HEALER,
				CASTER = _G.DAMAGER,
				ACHIEVEMENT = _G.ACHIEVEMENTS,
				REPUTATION = _G.REPUTATION,
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
				MONK = LC["MONK"],
				-------------------------------------------------------------------------------
				-- Reputation flags.
				-------------------------------------------------------------------------------
				HELLFIRE = (is_alliance and LFAC.HONOR_HOLD or LFAC.THRALLMAR),
				NAGRAND = (is_alliance and LFAC.KURENAI or LFAC.MAGHAR),
				CATACOMMON1 = (is_alliance and LFAC.WILDHAMMER or LFAC.DRAGONMAW),
				PANDACOMMON1 =	is_alliance and LFAC.TUSHUIPANDAREN or LFAC.HUOJINPANDAREN
			}

			for rep_label in private.FACTION_IDS_FROM_LABEL do
				FILTER_FLAG_NAMES[rep_label] = private.LOCALIZED_FACTION_STRINGS_FROM_LABEL[rep_label]
			end

			return FILTER_FLAG_NAMES
		end
	end -- do

	--- Dumps the recipe database in a format that is readable to humans (or machines)
	function addon:GetTextDump(profession_name)
		local output_format = addon.db.profile.textdumpformat or "Comma"
		local output = private.TextDump
		output:Clear()

		if output_format == "Comma" then
			output:AddLine(("Ackis Recipe List Text Dump for %s's %s, in the form of Comma Separated Values.\n  "):format(private.PLAYER_NAME, profession_name))
			output:AddLine("Spell ID,Recipe Name,Skill Level,ARL Filter Flags,Acquire Methods,Known\n")
		elseif output_format == "BBCode" then
			output:AddLine(("Ackis Recipe List Text Dump for %s's %s, in the form of BBCode.\n"):format(private.PLAYER_NAME, profession_name))
		elseif output_format == "XML" then
			output:AddLine("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
			output:AddLine("\n<profession>")
		end

		local profession_recipes = private.profession_recipe_list[profession_name]

		for recipe_id in pairs(profession_recipes) do
			local recipe = profession_recipes[recipe_id]
			local is_known = recipe:HasState("KNOWN")

			if output_format == "Comma" then
				-- Add Spell ID, Name and Skill Level to the list
				output:AddLine(recipe_id)
				output:AddLine(",")
				output:AddLine(recipe.name)
				output:AddLine(",")
				output:AddLine(recipe.skill_level)
				output:AddLine(",\"")
			elseif output_format == "BBCode" then
				-- Make the entry red
				output:AddLine(("\n%s[b]%d[/b] - %s (%d)%s\n"):format(is_known and "" or "[color=red]", recipe_id, recipe.name, recipe.skill_level, is_known and "" or "[/color]"))

				output:AddLine("\nRecipe Flags:\n[list]\n")
			elseif output_format == "XML" then
				output:AddLine("\n<recipe>\n")
				output:AddLine("  <id>" .. recipe_id .. "</id>\n")
				output:AddLine("  <name>" .. recipe.name .. "</name>\n")
				output:AddLine("  <skilllevel>" .. recipe.skill_level .. "</skilllevel>\n")
				output:AddLine("  <known>" .. tostring(is_known) .. "</known>\n")
				output:AddLine("  <flags>\n")
			elseif output_format == "Name" then
				output:AddLine(recipe.name)
			end

			-- Add in all the filter flags
			local filter_names = GetFilterFlagNames()
			local prev = false

			-- Find out which flags are set
			for table_index, bits in ipairs(private.FLAG_WORDS) do
				for flag_name, flag in pairs(bits) do
					local bitfield = recipe.flags[private.FLAG_MEMBERS[table_index]]

					if bitfield and bit.band(bitfield, flag) == flag then
						local filter_name = filter_names[flag_name]

						if not filter_name then
							filter_name = _G.UNKNOWN
							addon:Debug("%s is unknown", flag_name)
						end

						if output_format == "Comma" then
							if prev then
								output:AddLine(",")
							end
							output:AddLine(filter_name)
							prev = true
						elseif output_format == "BBCode" then
							output:AddLine("[*]" .. filter_name .. "\n")
						elseif output_format == "XML" then
							output:AddLine("    <flag>" .. filter_name .. "</flag>")
						end
					end
				end
			end

			if output_format == "Comma" then
				output:AddLine("\",\"")
			elseif output_format == "BBCode" then
				output:AddLine("[/list]\nAcquire Methods:\n[list]\n")
			elseif output_format == "XML" then
				output:AddLine("  </flags>")
				output:AddLine("  <acquire>")
			end

			-- Find out which unique acquire methods we have
			local acquire_data = recipe["acquire_data"]
			table.wipe(acquire_list)

			for acquire_type_id in pairs(acquire_data) do
				acquire_list[private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:Name()] = true
			end

			-- Add all the acquire methods in
			prev = false

			for acquire_name in pairs(acquire_list) do
				if output_format == "Comma" then
					if prev then
						output:AddLine(",")
					end
					output:AddLine(acquire_name)
					prev = true
				elseif output_format == "BBCode" then
					output:AddLine("[*] " .. acquire_name)
				elseif output_format == "XML" then
					output:AddLine("<acquiremethod>" .. acquire_name .. "</acquiremethod>")
				end
			end

			if output_format == "Comma" then
				output:AddLine("\"," .. tostring(is_known) .. "\n")
			elseif output_format == "BBCode" then
				output:AddLine("\n[/list]\n")
			elseif output_format == "XML" then
				output:AddLine("  </acquire>")
				output:AddLine("</recipe>")
			end
		end -- for

		if output_format == "XML" then
			output:AddLine("\n</profession>")
		end
		output:Display("")
	end
end
