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

------------------------------------------------------------------------------
-- Constants.
------------------------------------------------------------------------------
local SUPPORTED_MODULE_VERSION = 2

-------------------------------------------------------------------------------
-- Dialogs.
-------------------------------------------------------------------------------
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
			-- Saving alts tradeskills (needs to be global so all profiles can access it) TODO: Remove everything having to do with this, since Blizzard killed the functionality sometime during WoW 5.x
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
				},
				-------------------------------------------------------------------------------
				-- Profession Item Filters
				-------------------------------------------------------------------------------
				item = {
					-- These are populated from the item flags defined in profession modules.
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
					caster = true,
					healer = true,
					melee = true,
					tank = true,
				},
				-------------------------------------------------------------------------------
				-- Reputation Filters
				-------------------------------------------------------------------------------
				rep = {
					-- These are populated from the reputations defined in Constants.lua
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

	-------------------------------------------------------------------------------
	-- Hook GameTooltip so we can show information on mobs that drop/sell/train
	-------------------------------------------------------------------------------
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

--- Function run when the addon is enabled.  Registers events and pre-loads certain variables.
function addon:OnEnable()
	self.AcquireTypes = private.AcquireTypes

	self:RegisterEvent("TRADE_SKILL_SHOW")
	self:RegisterEvent("TRADE_SKILL_CLOSE")
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

function addon:OnModuleCreated(module)
    private.CreateProfessionFromModule(module)
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
	BPM_ShowTrainerFrame = function(scan_button)
		scan_button:SetParent(_G.BPM_ShowTrainerFrame)
		scan_button:SetPoint("RIGHT", _G.BPM_ShowTrainerFrame, "LEFT", 4, 0)
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

function addon:TRADE_SKILL_SHOW()
    local player_name = private.PLAYER_NAME
    local realm_name = private.REALM_NAME

    if not _G.C_TradeSkillUI.IsTradeSkillLinked() and not _G.C_TradeSkillUI.IsTradeSkillGuild() then
        self.db.global.tradeskill[realm_name][player_name][_G.C_TradeSkillUI.GetTradeSkillLine()] = _G.C_TradeSkillUI.GetTradeSkillListLink()
    else
        self.db.global.tradeskill[realm_name][player_name][_G.C_TradeSkillUI.GetTradeSkillLine()] = nil
    end

    local scan_button = self.scan_button
    if not scan_button then
        scan_button = _G.CreateFrame("Button", nil, _G.TradeSkillFrame, "UIPanelButtonTemplate")
        scan_button:SetHeight(20)
        scan_button:RegisterForClicks("LeftButtonUp")
        scan_button:SetText(L["Scan"])

        scan_button:SetScript("OnClick", function(self, _, _)
            local isShiftKeyDown = _G.IsShiftKeyDown()
            local isAltKeyDown = _G.IsAltKeyDown()
            local isControlKeyDown = _G.IsControlKeyDown()

            if isShiftKeyDown and not isAltKeyDown and not isControlKeyDown then
                addon:Scan(true)
            elseif isAltKeyDown and not isShiftKeyDown and not isControlKeyDown then
                addon:ClearWaypoints()
                --@debug@
            elseif isControlKeyDown then
                local localizedProfessionName = _G.C_TradeSkillUI.GetTradeSkillLine()

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
                if mainPanel and mainPanel:IsVisible() and private.CurrentProfession:LocalizedName() == _G.C_TradeSkillUI.GetTradeSkillLine() then
                    mainPanel:Hide()
                else
                    addon:Scan()
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

    -- Grab the first lucky Trade Skill AddOn that exists and hand the scan button to it.
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

    if private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING[_G.C_TradeSkillUI.GetTradeSkillLine()] then
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
			local profession = _G.C_TradeSkillUI.GetTradeSkillLine()

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

		local moduleName = FOLDER_NAME .. "_" .. professionModuleName or ""
		local _, _, _, _, reason = _G.GetAddOnInfo(moduleName)
		if reason ~= "DISABLED" then
			return _G.LoadAddOn(moduleName) and true or false
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

		for localizedSpellName in pairs(private.LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING) do
			if input == localizedSpellName:lower() then
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
        local DebugFrame = private.DebugFrame
		if not DebugFrame then
			private.CreateDebugFrame()
            DebugFrame = private.DebugFrame
		end

		if DebugFrame:Lines() == 0 then
			DebugFrame:AddLine("Nothing to report.")
			DebugFrame:Display()
			DebugFrame:Clear()
			return
		end
		DebugFrame:Display()
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
		local nestedPreviousRankSpellID = previous_rank_recipe:PreviousRankSpellID()

		if nestedPreviousRankSpellID then
			SetPreviousRanksKnown(nestedPreviousRankSpellID, profession_recipes, tradeskill_is_linked)
		end
	end

	--- Causes a scan of the tradeskill to be conducted. Function called when the scan button is clicked.   Parses recipes and displays output
	-- @name AckisRecipeList:Scan
	-- @usage AckisRecipeList:Scan(true)
	-- @param isTextDump Boolean indicating if we want the output to be a text dump, or if we want to use the ARL GUI
	-- @return A frame with either the text dump, or the ARL frame
    function addon:Scan(isTextDump, isRefresh)
        local localizedProfessionName, professionRank = _G.C_TradeSkillUI.GetTradeSkillLine()
        if localizedProfessionName == _G.UNKNOWN then
            self:Print(L["OpenTradeSkillWindow"])
            return
        end
        private.current_profession_specialty = nil

        -- This isn't needed for the module name lookup, but it is needed for other things further down the path.
        if localizedProfessionName == private.MINING_PROFESSION_NAME then
            localizedProfessionName = private.LOCALIZED_PROFESSION_NAMES.SMELTING
        end

        local professionModuleName = private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING[localizedProfessionName]
        if not professionModuleName then
            return
        end
        self:InitializeProfession(localizedProfessionName)

        local professionModule = self:GetModule(professionModuleName, true)
        if not professionModule then
            local foundModule

            for _, moduleName in pairs(private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING) do
                local _, _, _, _, reason = _G.GetAddOnInfo(FOLDER_NAME .. "_" .. moduleName or "")
                if not reason or reason == "DISABLED" then
                    -- The assumption here is that if a module is disabled, the user is aware that modules exist.
                    foundModule = true
                    break
                end
            end

            if foundModule then
                Dialog:Spawn("ARL_ModuleErrorDialog", professionModuleName)
            else
                Dialog:Spawn("ARL_NoModulesErrorDialog")
            end

            return false
        elseif professionModule.Version ~= SUPPORTED_MODULE_VERSION then
            Dialog:Spawn("ARL_ModuleWrongVersionDialog", {
                moduleName = professionModuleName,
                moduleVersion = 0
            })

            return false
        end

        local player = private.Player
        player:UpdateProfessions()

        private.current_profession_scanlevel = professionRank

        -- Clear the search box and its focus so the scan will have correct results.
        if _G.TradeSkillFrame and _G.TradeSkillFrame:IsVisible() then
            local search_box = _G.TradeSkillFrameSearchBox
            search_box:ClearFocus()
            search_box:GetScript("OnEditFocusLost")(search_box)
            search_box:SetText("")
            _G.TradeSkillSearch_OnTextChanged(search_box)
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

        -------------------------------------------------------------------------------
        -- Scan all recipes and mark the ones we know
        -------------------------------------------------------------------------------
        table.wipe(header_list)

        -- Save the current state of the TradeSkillFrame so it can be restored after we muck with it.
        local hasMaterials = _G.TradeSkillFrame.filterTbl.hasMaterials
        local hasSkillup = _G.TradeSkillFrame.filterTbl.hasSkillUp

        if _G.MRTAPI then
            _G.MRTAPI:PushFilterSelection()
        else
            if not _G.Skillet then
                if hasMaterials then
                    _G.TradeSkillFrame.filterTbl.hasMaterials = false
                    _G.TradeSkillOnlyShowMakeable(false)
                end

                if hasSkillup then
                    _G.TradeSkillFrame.filterTbl.hasSkillUp = false
                    _G.TradeSkillOnlyShowSkillUps(false)
                end
            end
            _G.SetTradeSkillInvSlotFilter(0, 1, 1)
            _G.TradeSkillUpdateFilterBar()
            _G.TradeSkillFrame_Update()

            -- Expand all headers so we can see all the recipes there are
            for tradeSkillIndex = _G.GetNumTradeSkills(), 1, -1 do
                local entryName, entryType, _, isExpanded = _G.GetTradeSkillInfo(tradeSkillIndex)

                if (entryType == "header" or entryType == "subheader") and not isExpanded then
                    header_list[entryName] = true
                    _G.ExpandTradeSkillSubClass(tradeSkillIndex)
                end
            end
        end
        local professionRecipes = private.Professions[localizedProfessionName].Recipes
        local foundRecipeCount = 0

        for _, recipe in pairs(professionRecipes) do
            recipe:RemoveState("KNOWN")
            recipe:RemoveState("RELEVANT")
            recipe:RemoveState("VISIBLE")
            recipe:RemoveState("LINKED")
        end

        for tradeSkillIndex = 1, _G.GetNumTradeSkills() do
            local entryName, entryType = _G.GetTradeSkillInfo(tradeSkillIndex)

            if entryType ~= "header" and entryType ~= "subheader" then
                local spellID = tonumber(_G.GetTradeSkillRecipeLink(tradeSkillIndex):match("^|c%x%x%x%x%x%x%x%x|H%w+:(%d+)"))

                local recipe = professionRecipes[spellID]
                if recipe then
                    local recipePreviousRankSpellID = recipe:PreviousRankSpellID()
                    if recipePreviousRankSpellID then
                        SetPreviousRanksKnown(recipePreviousRankSpellID, professionRecipes, isTradesSkillLinked)
                    end

                    recipe:SetAsKnownOrLinked(isTradesSkillLinked)
                    foundRecipeCount = foundRecipeCount + 1
                else
                    --@debug@
                    local professionID
                    for _, professionSpellID in pairs(private.PROFESSION_SPELL_IDS) do
                        if localizedProfessionName == _G.GetSpellInfo(professionSpellID) then
                            professionID = professionSpellID
                            break
                        end
                    end

                    local recipe = self:AddRecipe(self, {
                        _acquireTypeData = {},
                        _bitflags = {},
                        _expansionID = private.GAME_VERSION_NAMES[_G.GetExpansionLevel() + 1],
                        _localizedProfessionName = _G.GetSpellInfo(professionID),
                        _localizedName = _G.GetSpellInfo(spellID),
                        _qualityID = private.ITEM_QUALITIES.COMMON,
                        _spellID = spellID,
                    })

                    recipe:SetSkillLevels(0, 0, 0, 0, 0)
                    recipe:AddFilters(private.FILTER_IDS.ALLIANCE, private.FILTER_IDS.HORDE, private.FILTER_IDS.TRAINER)
                    addon:Printf("Added '%s (%d)' to %s. Do a profession dump.", entryName, spellID, localizedProfessionName)
                    --@end-debug@

                    if not self.is_development_version then
                        self:Debug("%s (%d): %s", entryName, spellID, L["MissingFromDB"])
                    end
                end
            end
        end

        -- Restore the state of the things we changed.
        if _G.MRTAPI then
            _G.MRTAPI:PopFilterSelection()
        else
            for tradeSkillIndex = _G.GetNumTradeSkills(), 1, -1 do
                local entryName = _G.GetTradeSkillInfo(tradeSkillIndex)
                if header_list[entryName] then
                    _G.CollapseTradeSkillSubClass(tradeSkillIndex)
                end
            end
            _G.TradeSkillFrame.filterTbl.hasMaterials = hasMaterials
            _G.TradeSkillOnlyShowMakeable(hasMaterials)
            _G.TradeSkillFrame.filterTbl.hasSkillUp = hasSkillup
            _G.TradeSkillOnlyShowSkillUps(hasSkillup)

            _G.TradeSkillUpdateFilterBar()
            _G.TradeSkillFrame_Update()
        end
        previous_recipe_count = current_recipe_count
        current_recipe_count = foundRecipeCount

        if isRefresh and previous_recipe_count == foundRecipeCount then
            return
        end
        player:UpdateReputations()

        -------------------------------------------------------------------------------
        -- Everything is ready - display the GUI or dump the list to text.
        -------------------------------------------------------------------------------
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
