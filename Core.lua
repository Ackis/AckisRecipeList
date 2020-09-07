-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local pairs, ipairs = _G.pairs, _G.ipairs
local select = _G.select
local tonumber, tostring = _G.tonumber, _G.tostring
local type = _G.type

-- Libraries
local bit = _G.bit
local string = _G.string
local table = _G.table

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0")
addon.constants = private.constants
addon.constants.addon_name = private.addon_name
addon.Name = FOLDER_NAME -- For cases when ARL needs to act as one of its modules.
_G.AckisRecipeList = addon

--@alpha@
_G.ARL = addon
--@end-alpha@

local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local Toast = LibStub("LibToast-1.0")
local Dialog = LibStub("LibDialog-1.0")

local wow_version, wow_build_num, wow_date, wow_ui_version = _G.GetBuildInfo()
private.wow_version = wow_version
private.wow_build_num = wow_build_num
private.wow_ui_version = wow_ui_version

private.TextDump = LibStub("LibTextDump-1.0"):New(private.addon_name)

-- ----------------------------------------------------------------------------
-- Constants.
-- ----------------------------------------------------------------------------
local SUPPORTED_MODULE_VERSION = 3

-- ----------------------------------------------------------------------------
-- Dialogs.
-- ----------------------------------------------------------------------------
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

Dialog:Register("ARL_ModuleWrongVersionDialog", {
	buttons = {
		{
			text = _G.OKAY
		},
	},
	show_while_dead = true,
	hide_on_escape = true,
	icon = [[Interface\DialogFrame\UI-Dialog-Icon-AlertNew]],
	is_exclusive = true,
	text_justify_h = "LEFT",
	width = 400,
	on_show = function(self, data)
		self.text:SetFormattedText("%s - %s\n\n%s", private.addon_name, addon.version, L.MODULE_WRONG_VERSION_FORMAT:format(data.moduleName, data.moduleVersion, SUPPORTED_MODULE_VERSION))
	end
})

-- Invoked from the module itself.
function addon:SpawnModuleWrongVersionDialog(data)
	Dialog:Spawn("ARL_ModuleWrongVersionDialog", data)
end

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

-- ----------------------------------------------------------------------------
-- Database tables
-- ----------------------------------------------------------------------------
local AllSpecialtiesTable = {}
local SpecialtyTable

-- Global Frame Variables
addon.optionsFrame = {}

-- ----------------------------------------------------------------------------
-- Debugger.
-- ----------------------------------------------------------------------------
function addon:Debug(...)
	local text = private.Debug(...)
	--@debug@
	Toast:Spawn("ARL_DebugToast", text)
	--@end-debug@
end

Toast:Register("ARL_DebugToast", function(toast, ...)
	toast:SetTitle(("%s - Debug"):format(private.addon_name))
	toast:SetText(...)
	toast:SetIconTexture([[Interface\HELPFRAME\HotIssueIcon]])
end)

-- ----------------------------------------------------------------------------
-- Initialization functions
-- ----------------------------------------------------------------------------
local REQUIRED_LIBS = {
	"AceLocale-3.0",
	"LibBabble-Boss-3.0",
	"LibQTip-1.0",
	"LibToast-1.0"
}

function addon:OnInitialize()
	-- ----------------------------------------------------------------------------
	-- Check to see if we have mandatory libraries loaded. If not, notify the user
	-- which are missing and return.
	-- ----------------------------------------------------------------------------
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
			-- Saving alts tradeskills (needs to be global so all profiles can access it) TODO: Remove everything having to do with this, since Blizzard killed the functionality sometime during WoW 5.x
			tradeskill = {},
		},
		profile = {
			-- ----------------------------------------------------------------------------
			-- Frame options
			-- ----------------------------------------------------------------------------
			frameopts = {
				offsetx = 0,
				offsety = 0,
				anchorTo = "",
				anchorFrom = "",
				uiscale = 1,
				small_list_font = true,
			},

			-- ----------------------------------------------------------------------------
			-- Tooltip Options
			-- ----------------------------------------------------------------------------
			tooltip = {
				scale = 1,
				acquire_fontsize = 11,
			},
			-- ----------------------------------------------------------------------------
			-- Sorting Options
			-- ----------------------------------------------------------------------------
			sorting = "Ascending",
			current_tab = 3, -- Name tab
			skill_view = false, -- Sort the recipes by skill level instead of name?

			-- ----------------------------------------------------------------------------
			-- Display Options
			-- ----------------------------------------------------------------------------
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

			-- ----------------------------------------------------------------------------
			-- Text Dump Options
			-- ----------------------------------------------------------------------------
			textdumpformat = "BBCode",

			-- ----------------------------------------------------------------------------
			-- Recipe Exclusion
			-- ----------------------------------------------------------------------------
			exclusionlist = {},

			-- ----------------------------------------------------------------------------
			-- Filter Options
			-- ----------------------------------------------------------------------------
			filters = {
				-- ----------------------------------------------------------------------------
				-- General Filters
				-- ----------------------------------------------------------------------------
				general = {
					faction = true,
					specialty = false,
					skill = true,
					known = false,
					unknown = true,
				},
				-- ----------------------------------------------------------------------------
				-- Obtain Filters
				-- ----------------------------------------------------------------------------
				obtain = {
					achievement = true,
					custom = true,
					discovery = true,
					instance = true,
					mobdrop = true,
					pvp = true,
					quest = true,
					raid = true,
					reputation = true,
					retired = false,
					trainer = true,
					vendor = true,
					worlddrop = true,
					worldevent = true,
					tradeskill = true,
				},
				-- ----------------------------------------------------------------------------
				-- Profession Item Filters
				-- ----------------------------------------------------------------------------
				item = {-- These are populated from the item flags defined in profession modules.
				},
				-- ----------------------------------------------------------------------------
				-- Quality Filters
				-- ----------------------------------------------------------------------------
				quality = {
					common = true,
					uncommon = true,
					rare = true,
					epic = true,
				},
				-- ----------------------------------------------------------------------------
				-- Binding Filters
				-- ----------------------------------------------------------------------------
				binding = {
					item_bind_on_equip = true,
					item_bind_on_pickup = true,
					recipe_bind_on_equip = true,
					recipe_bind_on_pickup = true,
				},
				-- ----------------------------------------------------------------------------
				-- Player Role Filters
				-- ----------------------------------------------------------------------------
				player = {
					caster = true,
					healer = true,
					melee = true,
					tank = true,
				},
				-- ----------------------------------------------------------------------------
				-- Reputation Filters
				-- ----------------------------------------------------------------------------
				rep = {-- These are populated from the reputations defined in Constants.lua
				},
				-- ----------------------------------------------------------------------------
				-- Class Filters
				-- ----------------------------------------------------------------------------
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
					demonhunter = true,
				},
			}
		}
	}

	self.SUPPORTED_MODULE_VERSION = SUPPORTED_MODULE_VERSION

	for index = 1, #private.GAME_VERSION_NAMES do
		defaults.profile.filters.obtain[("expansion%d"):format(index - 1)] = true
	end

	for index = 1, #private.REP_FLAGS do
		for reputation_name in pairs(private.REP_FLAGS[index]) do
			defaults.profile.filters.rep[reputation_name:lower()] = true
		end
	end

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

	-- ----------------------------------------------------------------------------
	-- Hook GameTooltip so we can show information on mobs that drop/sell/train
	-- ----------------------------------------------------------------------------
	-- TODO: Rewrite this.
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

			if player.scanned_professions[recipe.Profession:LocalizedName()] then
				local skill_level = player.professions[recipe.Profession:LocalizedName()]
				local has_level = skill_level and (type(skill_level) == "boolean" and true or skill_level >= recipe.skill_level)

				if (_G.IsShiftKeyDown() or (not recipe:HasState("KNOWN") and has_level)) and player:HasRecipeFaction(recipe) then
					local _, _, _, hex = _G.GetItemQualityColor(recipe:QualityID())

					self:AddLine(("%s: |c%s%s|r (%d)"):format(recipe.Profession:LocalizedName(), hex, recipe:LocalizedName(), recipe.skill_level))
					count = count + 1
				end
			end

			if count >= addon.db.profile.max_recipes_in_tooltips then
				break
			end
		end
	end)
end

-- Function run when the addon is enabled.  Registers events and pre-loads certain variables.
function addon:OnEnable()
	self.AcquireTypes = private.AcquireTypes

	self:RegisterEvent("TRADE_SKILL_SHOW")
	self:RegisterEvent("TRADE_SKILL_CLOSE")
	self:RegisterEvent("TRADE_SKILL_LIST_UPDATE")

	if addon.db.profile.scantrainers then
		self:RegisterEvent("TRAINER_SHOW")
	end

	if addon.db.profile.scanvendors then
		self:RegisterEvent("MERCHANT_SHOW")
	end
	private.Player:Initialize()

	-- ----------------------------------------------------------------------------
	-- Initialize the SpecialtyTable and AllSpecialtiesTable.
	-- ----------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Event handling functions
-- ----------------------------------------------------------------------------
function addon:TRAINER_SHOW()
	self:ScanTrainerData(true)
end

function addon:MERCHANT_SHOW()
	self:ScanVendor()
end

-- ----------------------------------------------------------------------------
-- Create the scan button
-- ----------------------------------------------------------------------------
local TRADESKILL_ADDON_INITS = {
	BPM_ShowTrainerFrame = function(scanButton)
		scanButton:SetParent(_G.BPM_ShowTrainerFrame)
		scanButton:SetPoint("RIGHT", _G.BPM_ShowTrainerFrame, "LEFT", 4, 0)
		scanButton:SetWidth(scanButton:GetTextWidth() + 10)
		scanButton:Show()
	end,
	Skillet = function(scanButton)
		if not _G.Skillet:IsActive() then
			return
		end
		scanButton:SetParent(_G.SkilletFrame)
		scanButton:SetWidth(80)
		_G.Skillet:AddButtonToTradeskillWindow(scanButton)
	end,
	TSMCraftingTradeSkillFrame = function(scanButton)
		local anchor = _G.TSMCraftingTradeSkillFrame
		scanButton:SetParent(anchor)
		scanButton:SetPoint("TOPRIGHT", anchor, "TOPRIGHT", -30, -3)
		scanButton:Show()
	end,
}

function addon:TRADE_SKILL_SHOW()
	local scanButton = self.scan_button

	if not scanButton then
		scanButton = _G.CreateFrame("Button", nil, _G.TradeSkillFrame, "UIPanelButtonTemplate")
		scanButton:SetHeight(20)
		scanButton:RegisterForClicks("LeftButtonUp")
		scanButton:SetText(L["Scan"])

		scanButton:SetScript("OnClick", function(self, mouseButton, isDown)
			local isShiftKeyDown = _G.IsShiftKeyDown()
			local isAltKeyDown = _G.IsAltKeyDown()
			local isControlKeyDown = _G.IsControlKeyDown()

			if isShiftKeyDown and not isAltKeyDown and not isControlKeyDown then
				addon:Scan(true)
			elseif isAltKeyDown and not isShiftKeyDown and not isControlKeyDown then
				addon:ClearWaypoints()
				--@debug@
			elseif isControlKeyDown then
				local professionID, _, _, _, _, _, localizedProfessionName = _G.C_TradeSkillUI.GetTradeSkillLine()

				if not isAltKeyDown then
					if isShiftKeyDown then
						addon:ScanProfession(localizedProfessionName)
					else
						addon:DumpProfession(localizedProfessionName)
					end
				end
				--@end-debug@
			elseif not isShiftKeyDown and not isAltKeyDown and not isControlKeyDown then
				local mainPanel = addon.Frame

				local professionID, _, _, _, _, _, localizedProfessionName = _G.C_TradeSkillUI.GetTradeSkillLine()
				if mainPanel and mainPanel:IsVisible() and private.CurrentProfession:LocalizedName() == localizedProfessionName then
					mainPanel:Hide()
				else
					addon:Scan()
					addon:AddWaypoint()
				end
			end
		end)

		scanButton:SetScript("OnEnter", function(self)
			local tooltip = _G.GameTooltip

			_G.GameTooltip_SetDefaultAnchor(tooltip, self)
			tooltip:SetText(L["SCAN_RECIPES_DESC"])
			--@debug@
			tooltip:AddLine("Control-click to generate a Lua code dump.")
			tooltip:AddLine("Control-Shift-click to scan for issues.")
			--@end-debug@
			tooltip:Show()
		end)

		scanButton:SetScript("OnLeave", _G.GameTooltip_Hide)

		self.scan_button = scanButton
	end

	-- Grab the first lucky TradeSkill AddOn that exists and hand the scan button to it.
	for entity, initFunction in pairs(TRADESKILL_ADDON_INITS) do
		if _G[entity] then
			scanButton:ClearAllPoints()
			initFunction(scanButton)
			break
		end
	end

	scanButton:Enable()

	if scanButton:GetParent() == _G.TradeSkillFrame then
		local scanButtonLocation = addon.db.profile.scanbuttonlocation

		if scanButtonLocation == "TR" then
			scanButton:SetPoint("RIGHT", _G.TradeSkillFrameCloseButton, "LEFT", 4, 0)
		elseif scanButtonLocation == "TL" then
			scanButton:SetPoint("LEFT", _G.TradeSkillFramePortrait, "RIGHT", 2, 12)
		elseif scanButtonLocation == "BR" then
			scanButton:SetPoint("TOP", _G.TradeSkillFrame.DetailsFrame.ExitButton, "BOTTOM", 0, -5)
		elseif scanButtonLocation == "BL" then
			scanButton:SetPoint("TOP", _G.TradeSkillFrame.DetailsFrame.CreateAllButton, "BOTTOM", 0, -5)
		end

		scanButton:SetWidth(scanButton:GetTextWidth() + 10)
	end

	local _, localizedProfessionName = _G.C_TradeSkillUI.GetTradeSkillLine()

	if private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING[localizedProfessionName] then
		scanButton:Show()
	else
		scanButton:Hide()
	end
end

function addon:TRADE_SKILL_CLOSE()
	if self.Frame and addon.db.profile.closeguionskillclose then
		self.Frame:Hide()
	end
end

do
	local last_update = 0
	local updater = _G.CreateFrame("Frame", nil, _G.UIParent, BackdropTemplateMixin and "BackdropTemplate")
	updater:Hide()

	updater:SetScript("OnUpdate", function(self, elapsed)
		last_update = last_update + elapsed

		if last_update >= 0.5 then
			local _, localizedProfessionName = _G.C_TradeSkillUI.GetTradeSkillLine()

			if localizedProfessionName ~= "UNKNOWN" then
				addon:Scan(false, true)
			end
			self:Hide()
		end
	end)

	function addon:TRADE_SKILL_LIST_UPDATE()
		if not self.Frame or not self.Frame:IsVisible() then
			return
		end

		if not updater:IsVisible() then
			last_update = 0
			updater:Show()
		end
	end

end

-- ----------------------------------------------------------------------------
-- ARL Logic Functions
-- ----------------------------------------------------------------------------
do
	local function InitializeLookups()
		addon:InitCustom()
		addon:InitDiscoveries()
		addon:InitMob()
		addon:InitQuest()
		addon:InitReputation()
		addon:InitTrainer()
		addon:InitWorldEvents()
		addon:InitVendor()

		InitializeLookups = nil
	end

	-- Returns true if a profession was initialized.
	function addon:InitializeProfession(localizedProfessionName)
		local professionModuleName = localizedProfessionName and private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING[localizedProfessionName] or nil
		if not professionModuleName then
			addon:Debug("Invalid profession name (%s) passed to InitializeProfession()", tostring(localizedProfessionName))
			return false
		end

		if InitializeLookups then
			InitializeLookups()
		end

		if private.Professions[professionModuleName] then
			return true
		end

		local professionModule = self:GetModule(professionModuleName, true)
		if not professionModule then
			local foundModule
			local moduleName = FOLDER_NAME .. "_" .. professionModuleName or ""
			local _, _, _, _, reason = _G.GetAddOnInfo(moduleName)

			if reason == "DISABLED" then
				Dialog:Spawn("ARL_ModuleErrorDialog", professionModuleName)
				return false
			elseif not _G.LoadAddOn(moduleName) then
				Dialog:Spawn("ARL_NoModulesErrorDialog")
				return false
			end

			return true
		elseif professionModule.Version ~= SUPPORTED_MODULE_VERSION then
			Dialog:Spawn("ARL_ModuleWrongVersionDialog", {
				moduleName = professionModuleName,
				moduleVersion = professionModule.Version
			})

			return false
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
		local localizedProfessionName = private.MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING[input:lower()]
		if not localizedProfessionName then
			addon:Print(L["COMMAND_LINE_SCAN"])
			return
		end

		local profession = private.Professions[localizedProfessionName]
		if not profession and addon:InitializeProfession(localizedProfessionName) then
			profession = private.Professions[localizedProfessionName]
		end

		if not profession then
			addon:Print(L["COMMAND_LINE_SCAN"])
			return
		end

		_G.CastSpellByName(profession:ActivationSpellName())

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
		local debugger = private.GetDebugger()

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

-- ----------------------------------------------------------------------------
-- Recipe Scanning Functions
-- ----------------------------------------------------------------------------
do
	local current_recipe_count, previous_recipe_count = 0, 0

	-- Indices of the spells in the spell book which may contain a speciality
	local specialtices_indices = {}

	local PROFESSION_BUTTONS = {
		_G.PrimaryProfession1SpellButtonTop,
		_G.PrimaryProfession1SpellButtonBottom,
		_G.PrimaryProfession2SpellButtonTop,
		_G.PrimaryProfession2SpellButtonBottom,
	}

	local function IsRecipeInfoLearnedByDescendant(recipeInfo)
		local nextRecipeID = recipeInfo.nextRecipeID

		while nextRecipeID do
			local nextRecipeInfo = _G.C_TradeSkillUI.GetRecipeInfo(nextRecipeID)

			if nextRecipeInfo.learned then
				return true
			end

			nextRecipeID = nextRecipeInfo.nextRecipeID
		end

		return false
	end

	local function IsRecipeInfoUnlearnedByAncestor(recipeInfo)
		local previousRecipeID = recipeInfo.previousRecipeID

		while previousRecipeID do
			local previousRecipeInfo = _G.C_TradeSkillUI.GetRecipeInfo(previousRecipeID)

			if not previousRecipeInfo.learned then
				return true
			end

			previousRecipeID = previousRecipeInfo.previousRecipeID
		end

		return false
	end

	--- Causes a scan of the tradeskill to be conducted. Function called when the scan button is clicked.   Parses recipes and displays output
	-- @name AckisRecipeList:Scan
	-- @usage AckisRecipeList:Scan(true)
	-- @param isTextDump Boolean indicating if we want the output to be a text dump, or if we want to use the ARL GUI
	-- @return A frame with either the text dump, or the ARL frame
	function addon:Scan(isTextDump, isRefresh)
		local professionID, _, professionRank, _, _, _, localizedProfessionName = _G.C_TradeSkillUI.GetTradeSkillLine()
		if localizedProfessionName == _G.UNKNOWN then
			self:Print(L["OpenTradeSkillWindow"])
			return
		end
		private.current_profession_specialty = nil

		local professionModuleName = private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING[localizedProfessionName]
		if not professionModuleName or not self:InitializeProfession(localizedProfessionName) then
			return
		end

		local player = private.Player
		player:UpdateProfessions()

		private.current_profession_scanlevel = professionRank

		-- Clear the search box and its focus so the scan will have correct results.
		if _G.TradeSkillFrame and _G.TradeSkillFrame:IsVisible() then
			local search_box = _G.TradeSkillFrame.SearchBox
			search_box:ClearFocus()
			search_box:GetScript("OnEditFocusLost")(search_box)
			search_box:SetText("")
		end

		-- Make sure we're only updating a profession the character actually knows - this could be a scan from a tradeskill link.
		local isTradesSkillLinked = _G.C_TradeSkillUI.IsTradeSkillLinked() or _G.C_TradeSkillUI.IsTradeSkillGuild()
		if not isTradesSkillLinked then
			player.scanned_professions[localizedProfessionName] = true
		end

		table.wipe(specialtices_indices)

		local insertIndex = 1
		for index = 1, #PROFESSION_BUTTONS do
			local button = PROFESSION_BUTTONS[index]
			local spellOffset = button:GetParent().spellOffset
			local specializationOffset = button:GetParent().specializationOffset

			if spellOffset then
				specialtices_indices[insertIndex] = specializationOffset + spellOffset
				insertIndex = insertIndex + 1
			end
		end

		local professionSpecialties = SpecialtyTable[localizedProfessionName]
		if professionSpecialties then
			for _, bookIndex in ipairs(specialtices_indices) do
				local spellName = _G.GetSpellBookItemName(bookIndex, _G.BOOKTYPE_PROFESSION)
				if not spellName then
					break
				elseif professionSpecialties[spellName] then
					private.current_profession_specialty = professionSpecialties[spellName]
					break
				end
			end
		end

		-- ----------------------------------------------------------------------------
		-- Scan all recipes and mark the ones we know
		-- ----------------------------------------------------------------------------
		local foundRecipeCount = 0
		local profession = private.Professions[localizedProfessionName]
		local recipeIDs = _G.C_TradeSkillUI.GetAllRecipeIDs()

		for recipeIndex = 1, #recipeIDs do
			local recipeID = recipeIDs[recipeIndex]
			local recipe = profession.Recipes[recipeID]
			local recipeInfo = _G.C_TradeSkillUI.GetRecipeInfo(recipeID)

			if recipe then
				recipe.isValidated = true

				if recipeInfo.learned then
					recipe:RemoveState("IGNORED")

					if isTradesSkillLinked then
						recipe:AddState("LINKED")
					else
						recipe:AddState("KNOWN")
						recipe:RemoveState("LINKED")
					end

					foundRecipeCount = foundRecipeCount + 1
				elseif IsRecipeInfoLearnedByDescendant(recipeInfo) or IsRecipeInfoUnlearnedByAncestor(recipeInfo) then
					recipe:AddState("IGNORED")
				else
					recipe:RemoveState("KNOWN")
					recipe:RemoveState("LINKED")
				end
			else
				--@debug@
				local recipe = self:AddRecipe(profession:Module(), {
					_acquireTypeData = {},
					_bitflags = {},
					_expansionID = private.GetEffectiveExpansionID(),
					_localizedName = _G.GetSpellInfo(recipeID),
					_qualityID = private.ITEM_QUALITIES.COMMON,
					_spellID = recipeID,
				})

				if recipe then
					recipe.isValidated = true
					recipe:SetSkillLevels(0, 0, 0, 0, 0)
					recipe:AddFilters(private.FILTER_IDS.ALLIANCE, private.FILTER_IDS.HORDE, private.FILTER_IDS.TRAINER)

					addon:Printf("Added '%s (%d)' to %s. Do a profession dump.", recipeInfo.name, recipeID, localizedProfessionName)
				end
				--@end-debug@

				if not self.is_development_version then
					self:Debug("%s (%d): %s", recipeInfo.name, recipeID, L["MissingFromDB"])
				end
			end
		end

		--@debug@

		local invalidRecipesList
		local invalisRecipesCount = 0

		for recipeID, recipe in pairs(profession.Recipes) do
			if not recipe.isValidated and not recipe:RequiredFaction() then
				invalidRecipesList = invalidRecipesList or {}
				invalidRecipesList[recipeID] = true

				self:Printf("Invalid recipeID %d in %s DB (%s)", recipeID, localizedProfessionName, recipe:LocalizedName())

				invalisRecipesCount = invalisRecipesCount + 1
			end
		end

		if invalidRecipesList then
			for recipeID in pairs(invalidRecipesList) do
				profession.Recipes[recipeID] = nil
				private.recipe_list[recipeID] = nil
			end

			self:Printf("Removed %d invalid recipes from %s. Do a profession dump.", invalisRecipesCount, localizedProfessionName)
		end

		--@end-debug@

		previous_recipe_count = current_recipe_count
		current_recipe_count = foundRecipeCount

		if isRefresh and previous_recipe_count == foundRecipeCount then
			return
		end
		player:UpdateReputations()

		-- ----------------------------------------------------------------------------
		-- Everything is ready - display the GUI or dump the list to text.
		-- ----------------------------------------------------------------------------
		if isTextDump then
			self:GetTextDump(localizedProfessionName)
		else
			private.PreviousProfession = private.CurrentProfession
			private.CurrentProfession = private.Professions[localizedProfessionName]

			if private.InitializeFrame then
				private.InitializeFrame()
			end

			self.Frame:Display(isTradesSkillLinked)
		end
	end
end

do
	-- ----------------------------------------------------------------------------
	-- Dumps recipe output in the format requested by the user
	-- ----------------------------------------------------------------------------
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
				-- ----------------------------------------------------------------------------
				-- Common flags.
				-- ----------------------------------------------------------------------------
				ALLIANCE = LFAC.ALLIANCE,
				HORDE = LFAC.HORDE,
				TRAINER = L["Trainer"],
				VENDOR = L["Vendor"],
				INSTANCE = _G.INSTANCE,
				RAID = _G.RAID,
				WORLD_EVENT = _G.EVENTS_LABEL,
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
				-- ----------------------------------------------------------------------------
				-- Class flags.
				-- ----------------------------------------------------------------------------
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
				DEMONHUNTER = LC["DEMONHUNTER"],
				-- ----------------------------------------------------------------------------
				-- Reputation flags.
				-- ----------------------------------------------------------------------------
				HELLFIRE = (is_alliance and LFAC.HONOR_HOLD or LFAC.THRALLMAR),
				NAGRAND = (is_alliance and LFAC.KURENAI or LFAC.MAGHAR),
			}

			for rep_label in private.FACTION_IDS_FROM_LABEL do
				FILTER_FLAG_NAMES[rep_label] = private.LOCALIZED_FACTION_STRINGS_FROM_LABEL[rep_label]
			end

			return FILTER_FLAG_NAMES
		end
	end -- do

	--- Dumps the recipe database in a format that is readable to humans (or machines)
	function addon:GetTextDump(localizedProfessionName)
		local output_format = addon.db.profile.textdumpformat or "Comma"
		local output = private.TextDump
		output:Clear()

		if output_format == "Comma" then
			output:AddLine(("Ackis Recipe List Text Dump for %s's %s, in the form of Comma Separated Values.\n  "):format(private.PLAYER_NAME, localizedProfessionName))
			output:AddLine("Spell ID,Recipe Name,Skill Level,ARL Filter Flags,Acquire Methods,Known\n")
		elseif output_format == "BBCode" then
			output:AddLine(("Ackis Recipe List Text Dump for %s's %s, in the form of BBCode.\n"):format(private.PLAYER_NAME, localizedProfessionName))
		elseif output_format == "XML" then
			output:AddLine("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
			output:AddLine("\n<profession>")
		end

		local professionRecipes = private.Professions[localizedProfessionName].Recipes
		for recipeSpellID, recipe in pairs(professionRecipes) do
			local recipeIsKnown = recipe:HasState("KNOWN")

			if output_format == "Comma" then
				-- Add Spell ID, Name and Skill Level to the list
				output:AddLine(recipeSpellID)
				output:AddLine(",")
				output:AddLine(recipe:LocalizedName())
				output:AddLine(",")
				output:AddLine(recipe.skill_level)
				output:AddLine(",\"")
			elseif output_format == "BBCode" then
				-- Make the entry red
				output:AddLine(("\n%s[b]%d[/b] - %s (%d)%s\n"):format(recipeIsKnown and "" or "[color=red]", recipeSpellID, recipe:LocalizedName(), recipe.skill_level, recipeIsKnown and "" or "[/color]"))

				output:AddLine("\nRecipe Flags:\n[list]\n")
			elseif output_format == "XML" then
				output:AddLine("\n<recipe>\n")
				output:AddLine("  <id>" .. recipeSpellID .. "</id>\n")
				output:AddLine("  <name>" .. recipe:LocalizedName() .. "</name>\n")
				output:AddLine("  <skilllevel>" .. recipe.skill_level .. "</skilllevel>\n")
				output:AddLine("  <known>" .. tostring(recipeIsKnown) .. "</known>\n")
				output:AddLine("  <flags>\n")
			elseif output_format == "Name" then
				output:AddLine(recipe:LocalizedName())
			end

			-- Add in all the filter flags
			local filter_names = GetFilterFlagNames()
			local prev = false

			-- Find out which flags are set
			for table_index, bits in ipairs(private.FLAG_WORDS) do
				for flag_name, flag in pairs(bits) do
					-- TODO: Rewrite to not access recipe._bitflags directly.
					local bitfield = recipe._bitflags[private.FLAG_MEMBERS[table_index]]

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
			table.wipe(acquire_list)

			for acquireType in recipe:AcquirePairs() do
				acquire_list[acquireType:Name()] = true
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
				output:AddLine("\"," .. tostring(recipeIsKnown) .. "\n")
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
