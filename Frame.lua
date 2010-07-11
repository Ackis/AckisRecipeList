--[[
************************************************************************
Frame.lua
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
**AckisRecipeList** provides an interface for scanning professions for missing recipes.
There are a set of functions which allow you make use of the ARL database outside of ARL.
ARL supports all professions currently in World of Warcraft 3.3.2
@class file
@name Frame.lua
************************************************************************
]]--

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string
local sformat = string.format
local strlower = string.lower
local smatch = string.match

local select = _G.select
local type = _G.type

local table = _G.table

local ipairs, pairs = _G.ipairs, _G.pairs

local math = _G.math
local floor = math.floor

local tonumber = _G.tonumber
local tostring = _G.tostring

-------------------------------------------------------------------------------
-- Localized Blizzard API.
-------------------------------------------------------------------------------
local GetItemQualityColor = _G.GetItemQualityColor

-- GLOBALS: CreateFrame, GameTooltip, UIParent

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local LibStub = LibStub

local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local QTip	= LibStub("LibQTip-1.0")

-- Set up the private intra-file namespace.
local private	= select(2, ...)

local Player	= private.Player

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local ORDERED_PROFESSIONS	= private.ordered_professions

local FILTERMENU_HEIGHT		= 312

local FILTERMENU_SMALL		= 112
local FILTERMENU_LARGE		= 210

local FACTION_HORDE		= BFAC["Horde"]
local FACTION_ALLIANCE		= BFAC["Alliance"]
local FACTION_NEUTRAL		= BFAC["Neutral"]

local BASIC_COLORS		= private.basic_colors

local A = private.acquire_types

-------------------------------------------------------------------------------
-- Define the static popups we're going to call when people haven't scanned or
-- when current filters are blocking all recipes from being displayed.
-------------------------------------------------------------------------------
StaticPopupDialogs["ARL_NOTSCANNED"] = {
	text = L["NOTSCANNED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLFILTERED"] = {
	text = L["ALL_FILTERED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLKNOWN"] = {
	text = L["ARL_ALLKNOWN"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLEXCLUDED"] = {
	text = L["ARL_ALLEXCLUDED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_SEARCHFILTERED"] = {
	text = L["ARL_SEARCHFILTERED"],
	button1 = _G.OKAY,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

-------------------------------------------------------------------------------
-- Upvalues
-------------------------------------------------------------------------------
local AcquireTable = private.AcquireTable
local ReleaseTable = private.ReleaseTable
local SetTextColor = private.SetTextColor
local GenericCreateButton = private.GenericCreateButton
local SetTooltipScripts = private.SetTooltipScripts

local MainPanel

local FilterValueMap		-- Assigned in InitializeFrame()

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
-- Create the MainPanel and set its values
-------------------------------------------------------------------------------
local MainPanel
do
	MainPanel = CreateFrame("Frame", "ARL_MainPanel", UIParent)

	-- The panel width changes when contracting and expanding - store it for later use.
	MainPanel.normal_width = 384
	MainPanel.expanded_width = 768

	MainPanel:SetWidth(MainPanel.normal_width)
	MainPanel:SetHeight(512)
	MainPanel:SetFrameStrata("MEDIUM")
	MainPanel:SetToplevel(true)
	MainPanel:SetClampedToScreen(true)
	MainPanel:SetClampRectInsets(0, -35, 0, 53)

	MainPanel:SetHitRectInsets(0, 35, 0, 53)
	MainPanel:EnableMouse(true)
	MainPanel:EnableKeyboard(true)
	MainPanel:SetMovable(true)

	MainPanel.is_expanded = false

	-- Let the user banish the MainPanel with the ESC key.
	table.insert(UISpecialFrames, "ARL_MainPanel")
	addon.Frame = MainPanel

	local top_left = MainPanel:CreateTexture(nil, "ARTWORK")
	top_left:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopLeft")
	top_left:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 0, 0)
	MainPanel.top_left = top_left

	local top_right = MainPanel:CreateTexture(nil, "ARTWORK")
	top_right:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopRight")
	top_right:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", 0, 0)
	MainPanel.top_right = top_right

	local bottom_left = MainPanel:CreateTexture(nil, "ARTWORK")
	bottom_left:SetTexture("Interface\\QuestFrame\\UI-QuestLog-BotLeft")
	bottom_left:SetPoint("BOTTOMLEFT", MainPanel, "BOTTOMLEFT", 0, 0)
	MainPanel.bottom_left = bottom_left

	local bottom_right = MainPanel:CreateTexture(nil, "ARTWORK")
	bottom_right:SetTexture("Interface\\QuestFrame\\UI-QuestLog-BotRight")
	bottom_right:SetPoint("BOTTOMRIGHT", MainPanel, "BOTTOMRIGHT", 0, 0)
	MainPanel.bottom_right = bottom_right

	local title_bar = MainPanel:CreateFontString(nil, "ARTWORK")
	title_bar:SetFontObject("GameFontHighlightSmall")
	title_bar:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 20, -20)
	title_bar:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -40, -20)
	title_bar:SetJustifyH("CENTER")
	MainPanel.title_bar = title_bar

	MainPanel:Hide()
end	-- do block

-------------------------------------------------------------------------------
-- Widget Container frame.
-------------------------------------------------------------------------------
local WidgetContainer = CreateFrame("Frame", nil, MainPanel)
WidgetContainer:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 75, -39)
WidgetContainer:SetHeight(30)
WidgetContainer:SetWidth(275)

-------------------------------------------------------------------------------
-- MainPanel scripts/functions.
-------------------------------------------------------------------------------
MainPanel:SetScript("OnHide",
		    function(self)
			    for spell_id, recipe in pairs(private.recipe_list) do
				    recipe:RemoveState("RELEVANT")
				    recipe:RemoveState("VISIBLE")
			    end
			    addon:ClosePopups()
		    end)

MainPanel:SetScript("OnMouseDown", MainPanel.StartMoving)

MainPanel:SetScript("OnMouseUp",
		    function(self, button)
			    self:StopMovingOrSizing()

			    local opts = addon.db.profile.frameopts
			    local from, _, to, x, y = self:GetPoint()

			    opts.anchorFrom = from
			    opts.anchorTo = to

			    if self.is_expanded then
				    if opts.anchorFrom == "TOPLEFT" or opts.anchorFrom == "LEFT" or opts.anchorFrom == "BOTTOMLEFT" then
					    opts.offsetx = x
				    elseif opts.anchorFrom == "TOP" or opts.anchorFrom == "CENTER" or opts.anchorFrom == "BOTTOM" then
					    opts.offsetx = x - 151/2
				    elseif opts.anchorFrom == "TOPRIGHT" or opts.anchorFrom == "RIGHT" or opts.anchorFrom == "BOTTOMRIGHT" then
					    opts.offsetx = x - 151
				    end
			    else
				    opts.offsetx = x
			    end
			    opts.offsety = y
		    end)

function MainPanel:ToggleState()
	local x, y = self:GetLeft(), self:GetBottom()

	if self.is_expanded then
		self:SetWidth(self.normal_width)
		self:SetHitRectInsets(0, 35, 0, 53)
		self:SetClampRectInsets(0, -35, 0, 53)

		self.top_left:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopLeft")
		self.top_right:SetTexture("Interface\\QuestFrame\\UI-QuestLog-TopRight")
		self.bottom_left:Show()
		self.bottom_right:Show()

		self.xclose_button:ClearAllPoints()
		self.xclose_button:SetPoint("TOPRIGHT", self, "TOPRIGHT", -30, -8)
	else
		self:SetWidth(self.expanded_width)
		self:SetHitRectInsets(0, 90, 0, 53)
		self:SetClampRectInsets(0, -90, 0, 53)

		self.top_left:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Left")
		self.top_right:SetTexture("Interface\\QuestFrame\\UI-QuestLogDualPane-Right")
		self.bottom_left:Hide()
		self.bottom_right:Hide()

		self.xclose_button:ClearAllPoints()
		self.xclose_button:SetPoint("TOPRIGHT", self, "TOPRIGHT", -84, -8)
	end
	self.is_expanded = not self.is_expanded

	self:ClearAllPoints()
	self:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y)
	self:UpdateTitle()
end

function MainPanel:UpdateTitle()
	local current_prof = ORDERED_PROFESSIONS[self.profession]

	if not self.is_expanded then
		self.title_bar:SetFormattedText(SetTextColor(BASIC_COLORS["normal"], "ARL (%s) - %s"), addon.version, current_prof)
		return
	end
	local total, active = 0, 0

	for filter, info in pairs(FilterValueMap) do
		if info.svroot then
			if info.svroot[filter] == true then
				active = active + 1
			end
			total = total + 1
		end
	end
	self.title_bar:SetFormattedText(SetTextColor(BASIC_COLORS["normal"], "ARL (%s) - %s (%d/%d %s)"), addon.version, current_prof, active, total, _G.FILTERS)
end

-------------------------------------------------------------------------------
-- Create the profession-cycling button and assign its values.
-------------------------------------------------------------------------------
local ProfCycle = CreateFrame("Button", nil, MainPanel, "UIPanelButtonTemplate")
ProfCycle:SetWidth(64)
ProfCycle:SetHeight(64)
ProfCycle:SetPoint("TOPLEFT", MainPanel, "TOPLEFT", 5, -4)
ProfCycle:RegisterForClicks("LeftButtonUp", "RightButtonUp")

ProfCycle._normal = ProfCycle:CreateTexture(nil, "BACKGROUND")
ProfCycle._pushed = ProfCycle:CreateTexture(nil, "BACKGROUND")
ProfCycle._disabled = ProfCycle:CreateTexture(nil, "BACKGROUND")

MainPanel.prof_button = ProfCycle

-------------------------------------------------------------------------------
-- ProfCycle scripts/functions.
-------------------------------------------------------------------------------
ProfCycle:SetScript("OnClick",
		    function(self, button, down)
			    -- Known professions should be in Player.professions

			    -- This loop is gonna be weird. The reason is because we need to
			    -- ensure that we cycle through all the known professions, but also
			    -- that we do so in order. That means that if the currently displayed
			    -- profession is the last one in the list, we're actually going to
			    -- iterate completely once to get to the currently displayed profession
			    -- and then iterate again to make sure we display the next one in line.
			    -- Further, there is the nuance that the person may not know any
			    -- professions yet at all. Users are so annoying.
			    local startLoop = 0
			    local endLoop = 0
			    local displayProf = 0

			    local NUM_PROFESSIONS = 12

			    -- ok, so first off, if we've never done this before, there is no "current"
			    -- and a single iteration will do nicely, thank you
			    if button == "LeftButton" then
				    -- normal profession switch
				    if MainPanel.profession == 0 then
					    startLoop = 1
					    endLoop = NUM_PROFESSIONS + 1
				    else
					    startLoop = MainPanel.profession + 1
					    endLoop = MainPanel.profession
				    end
				    local index = startLoop

				    while index ~= endLoop do
					    if index > NUM_PROFESSIONS then
						    index = 1
					    elseif Player.professions[ORDERED_PROFESSIONS[index]] then
						    displayProf = index
						    MainPanel.profession = index
						    break
					    else
						    index = index + 1
					    end
				    end
			    elseif button == "RightButton" then
				    -- reverse profession switch
				    if MainPanel.profession == 0 then
					    startLoop = NUM_PROFESSIONS + 1
					    endLoop = 0
				    else
					    startLoop = MainPanel.profession - 1
					    endLoop = MainPanel.profession
				    end
				    local index = startLoop

				    while index ~= endLoop do
					    if index < 1 then
						    index = NUM_PROFESSIONS
					    elseif Player.professions[ORDERED_PROFESSIONS[index]] then
						    displayProf = index
						    MainPanel.profession = index
						    break
					    else
						    index = index - 1
					    end
				    end
			    end
			    local trade_frame = _G.GnomeWorksFrame or _G.Skillet or _G.MRTSkillFrame or _G.ATSWFrame or _G.CauldronFrame or _G.TradeSkillFrame
			    local is_shown = trade_frame:IsVisible()
			    local sfx

			    PlaySound("igCharacterNPCSelect")

			    -- If not shown, save the current sound effects setting then set it to 0.
			    if not is_shown then
				    sfx = tonumber(GetCVar("Sound_EnableSFX"))
				    SetCVar("Sound_EnableSFX", 0)
			    end
			    CastSpellByName(ORDERED_PROFESSIONS[MainPanel.profession])
			    addon:Scan()

			    if not is_shown then
				    CloseTradeSkill()
				    SetCVar("Sound_EnableSFX", sfx)
			    end
		    end)

function ProfCycle:ChangeTexture(texture)
	local normal, pushed, disabled = self._normal, self._pushed, self._disabled

	normal:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. texture .. [[_up]])
	normal:SetTexCoord(0, 1, 0, 1)
	normal:SetAllPoints(self)
	self:SetNormalTexture(normal)

	pushed:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. texture .. [[_down]])
	pushed:SetTexCoord(0, 1, 0, 1)
	pushed:SetAllPoints(self)
	self:SetPushedTexture(pushed)

	disabled:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. texture .. [[_up]])
	disabled:SetTexCoord(0, 1, 0, 1)
	disabled:SetAllPoints(self)
	self:SetDisabledTexture(disabled)
end

-------------------------------------------------------------------------------
-- The search entry box and associated methods.
-------------------------------------------------------------------------------
local SearchRecipes
do
	local acquire_names = private.acquire_names
	local location_list = private.location_list

	local search_params = {
		"name",
		"skill_level",
		--@debug@
		-- "item_id",
		--@end-debug@
		"specialty",
	}
	-- Scans through the recipe database and toggles the flag on if the item is in the search criteria
	function SearchRecipes(pattern)
		if not pattern then
			return
		end
		local current_prof = ORDERED_PROFESSIONS[MainPanel.profession]

		pattern = pattern:lower()

		for index, entry in pairs(private.recipe_list) do
			entry:RemoveState("RELEVANT")

			if entry.profession == current_prof then
				local found = false

				for index, field in ipairs(search_params) do
					local str = entry[field] and tostring(entry[field]):lower() or nil

					if str and str:find(pattern) then
						entry:AddState("RELEVANT")
						found = true
						break
					end
				end

				if not found then
					for acquire_type in pairs(acquire_names) do
						local str = acquire_names[acquire_type]:lower()

						if str and str:find(pattern) and entry.acquire_data[acquire_type] then
							entry:AddState("RELEVANT")
							found = true
							break
						end
					end
				end

				if not found then
					for location_name in pairs(location_list) do
						local breakout = false

						for spell_id in pairs(location_list[location_name].recipes) do
							if spell_id == entry.spell_id then
								local str = location_name:lower()

								if str and str:find(pattern) then
									entry:AddState("RELEVANT")
									breakout = true
									break
								end
							end
						end

						if breakout then
							break
						end
					end
				end
			end
		end	-- if entry.profession
	end	-- for
end	-- do

-------------------------------------------------------------------------------
-- Search EditBox
-------------------------------------------------------------------------------
local SearchBox = CreateFrame("EditBox", nil, MainPanel, "InputBoxTemplate")

SearchBox:EnableMouse(true)
SearchBox:SetAutoFocus(false)
SearchBox:SetFontObject(ChatFontSmall)
SearchBox:SetWidth(130)
SearchBox:SetHeight(12)
SearchBox:SetPoint("TOPLEFT", WidgetContainer, "TOPLEFT", 0, 0)
SearchBox:Show()

MainPanel.search_editbox = SearchBox

SearchBox:SetText(_G.SEARCH)
SearchBox:SetHistoryLines(10)

-- Allow removal of focus from the SearchBox by clicking on the WorldFrame.
do
	local old_x, old_y, click_time

	WorldFrame:HookScript("OnMouseDown",
			      function(frame, ...)
				      if not SearchBox:HasFocus() then
					      return
				      end
				      old_x, old_y = GetCursorPosition()
				      click_time = GetTime()
			      end)

	WorldFrame:HookScript("OnMouseUp",
			      function(frame, ...)
				      if not SearchBox:HasFocus() then
					      return
				      end
				      local x, y = GetCursorPosition()

				      if not old_x or not old_y or not x or not y or not click_time then
					      SearchBox:ClearFocus()
					      return
				      end

				      if (math.abs(x - old_x) + math.abs(y - old_y)) <= 5 and GetTime() - click_time < .5 then
					      SearchBox:ClearFocus()
				      end
			      end)
end

-- Resets the SearchBox text and the state of all MainPanel.list_frame and recipe_list entries.
function SearchBox:Reset()
	for index, recipe in pairs(private.recipe_list) do
		recipe:RemoveState("RELEVANT")
	end
	self.prev_search = nil

	self:SetText(_G.SEARCH)

	if self:HasFocus() then
	 	self:HighlightText()
	end
	MainPanel.list_frame:Update(nil, false)
end

-- If there is text in the search box, return the recipe's RELEVANT state.
function SearchBox:MatchesRecipe(recipe)
	local editbox_text = self:GetText()

	if editbox_text ~= "" and editbox_text ~= _G.SEARCH then
		return recipe:HasState("RELEVANT")
	end
	return true
end

SearchBox:SetScript("OnEnterPressed",
		    function(self)
			    local searchtext = self:GetText()
			    searchtext = searchtext:trim()

			    if not searchtext or searchtext == "" then
				    self:Reset()
				    return
			    end
			    self:HighlightText()

			    if searchtext == _G.SEARCH then
				    return
			    end
			    self.prev_search = searchtext

			    self:AddHistoryLine(searchtext)
			    SearchRecipes(searchtext)
			    MainPanel.list_frame:Update(nil, false)
		    end)

SearchBox:SetScript("OnEditFocusGained", SearchBox.HighlightText)

SearchBox:SetScript("OnEditFocusLost",
		    function(self)
			    local text = self:GetText()

			    if text == "" or text == _G.SEARCH then
				    self:Reset()
				    return
			    end

			    -- Ensure that the highlight is cleared.
			    self:SetText(text)

			    self:AddHistoryLine(text)
		    end)


SearchBox:SetScript("OnTextSet",
		    function(self)
			    local text = self:GetText()

			    if text ~= "" and text ~= _G.SEARCH and text ~= self.prev_search then
				    self:HighlightText()
			    else
				    self:Reset()
			    end
		    end)

do
	local last_update = 0
	local updater = CreateFrame("Frame", nil, UIParent)

	updater:Hide()
	updater:SetScript("OnUpdate",
			  function(self, elapsed)
				  last_update = last_update + elapsed

				  if last_update >= 0.5 then
					  last_update = 0

					  SearchRecipes(SearchBox:GetText())
					  MainPanel.list_frame:Update(nil, false)
					  self:Hide()
				  end
			  end)

	SearchBox:SetScript("OnTextChanged",
			    function(self, is_typed)
				    if not is_typed then
					    return
				    end
				    local text = self:GetText()

				    if text ~= "" and text ~= _G.SEARCH and text ~= self.prev_search then
					    updater:Show()
				    else
					    self:Reset()
				    end
			    end)
end	-- do

-------------------------------------------------------------------------------
-- Create the expand button and set its scripts.
-------------------------------------------------------------------------------
local ExpandButtonFrame = CreateFrame("Frame", nil, MainPanel)
ExpandButtonFrame:SetWidth(45)
ExpandButtonFrame:SetHeight(20)
ExpandButtonFrame:SetPoint("TOPLEFT", SearchBox, "BOTTOMLEFT", -12, -5)

ExpandButtonFrame.left = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.left:SetWidth(8)
ExpandButtonFrame.left:SetHeight(22)
ExpandButtonFrame.left:SetPoint("TOPLEFT", ExpandButtonFrame, 0, 4)
ExpandButtonFrame.left:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Left")

ExpandButtonFrame.right = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.right:SetWidth(8)
ExpandButtonFrame.right:SetHeight(22)
ExpandButtonFrame.right:SetPoint("TOPRIGHT", ExpandButtonFrame, 0, 4)
ExpandButtonFrame.right:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Right")

ExpandButtonFrame.middle = ExpandButtonFrame:CreateTexture(nil, "BACKGROUND")
ExpandButtonFrame.middle:SetHeight(22)
ExpandButtonFrame.middle:SetPoint("LEFT", ExpandButtonFrame.left, "RIGHT")
ExpandButtonFrame.middle:SetPoint("RIGHT", ExpandButtonFrame.right, "LEFT")
ExpandButtonFrame.middle:SetTexture("Interface\\QuestFrame\\UI-QuestLogSortTab-Middle")

local ExpandButton = GenericCreateButton(nil, MainPanel, 16, 16, "GameFontNormalSmall", _G.ALL, "LEFT", L["EXPANDALL_DESC"], 2)

MainPanel.expand_button = ExpandButton

ExpandButton:SetPoint("LEFT", ExpandButtonFrame.left, "RIGHT", -3, -3)

ExpandButton.text:ClearAllPoints()
ExpandButton.text:SetPoint("LEFT", ExpandButton, "Right", 0, 0)

ExpandButton:SetScript("OnClick",
		       function(self, mouse_button, down)
			       local current_tab = MainPanel.tabs[MainPanel.current_tab]
			       local expanded = current_tab["expand_button_"..MainPanel.profession]
			       local expand_mode

			       if not expanded then
				       if _G.IsShiftKeyDown() then
					       expand_mode = "deep"
				       else
					       expand_mode = "normal"
				       end
			       else
				       local prof_name = ORDERED_PROFESSIONS[MainPanel.profession]

				       table.wipe(current_tab[prof_name.." expanded"])
			       end
			       -- MainPanel.list_frame:Update() must be called before the button can be expanded or contracted, since
			       -- the button is contracted from there.
			       -- If expand_mode is nil, that means expand nothing.
			       MainPanel.list_frame:Update(expand_mode, false)

			       if expanded then
				       self:Contract(current_tab)
			       else
				       self:Expand(current_tab)
			       end
		       end)

function ExpandButton:Expand(current_tab)
	current_tab["expand_button_"..MainPanel.profession] = true

	self:SetNormalTexture("Interface\\BUTTONS\\UI-MinusButton-Up")
	self:SetPushedTexture("Interface\\BUTTONS\\UI-MinusButton-Down")
	self:SetHighlightTexture("Interface\\BUTTONS\\UI-PlusButton-Hilight")
	self:SetDisabledTexture("Interface\\BUTTONS\\UI-MinusButton-Disabled")

	SetTooltipScripts(self, L["CONTRACTALL_DESC"])
end

function ExpandButton:Contract(current_tab)
	current_tab["expand_button_"..MainPanel.profession] = nil

	self:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
	self:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
	self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	self:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")

	SetTooltipScripts(self, L["EXPANDALL_DESC"])
end

-------------------------------------------------------------------------------
-- "Skill Level" checkbox.
-------------------------------------------------------------------------------
local SkillToggle = CreateFrame("CheckButton", nil, MainPanel, "UICheckButtonTemplate")
SkillToggle:SetPoint("TOPLEFT", SearchBox, "TOPRIGHT", 0, 0)
SkillToggle:SetHeight(16)
SkillToggle:SetWidth(16)

SkillToggle.text = SkillToggle:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
SkillToggle.text:SetPoint("LEFT", SkillToggle, "RIGHT", 0, 0)

SkillToggle:SetScript("OnClick",
		      function(self, button, down)
			      addon.db.profile.skill_view = not addon.db.profile.skill_view
			      MainPanel.list_frame:Update(nil, false)
		      end)

SkillToggle:SetScript("OnShow",
		      function(self)
			      self:SetChecked(addon.db.profile.skill_view)
		      end)

SkillToggle:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
SkillToggle:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
SkillToggle:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
SkillToggle:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
SkillToggle:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

SkillToggle.text:SetText(_G.SKILL)
SetTooltipScripts(SkillToggle, L["SKILL_TOGGLE_DESC"], 1)

-------------------------------------------------------------------------------
-- "Display Exclusions" checkbox.
-------------------------------------------------------------------------------
local ExcludeToggle = CreateFrame("CheckButton", nil, MainPanel, "UICheckButtonTemplate")
ExcludeToggle:SetPoint("TOP", SkillToggle, "BOTTOM", 0, 1)
ExcludeToggle:SetHeight(16)
ExcludeToggle:SetWidth(16)

ExcludeToggle.text = ExcludeToggle:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
ExcludeToggle.text:SetPoint("LEFT", ExcludeToggle, "RIGHT", 0, 0)

ExcludeToggle:SetScript("OnClick",
			function(self, button, down)
				addon.db.profile.ignoreexclusionlist = not addon.db.profile.ignoreexclusionlist
				MainPanel.list_frame:Update(nil, false)
			end)

ExcludeToggle:SetScript("OnShow",
			function(self)
				self:SetChecked(addon.db.profile.ignoreexclusionlist)
			end)

ExcludeToggle:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
ExcludeToggle:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
ExcludeToggle:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
ExcludeToggle:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
ExcludeToggle:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

ExcludeToggle.text:SetText(L["Display Exclusions"])
SetTooltipScripts(ExcludeToggle, L["DISPLAY_EXCLUSION_DESC"], 1)

-------------------------------------------------------------------------------
-- Create the X-close button, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.xclose_button = CreateFrame("Button", nil, MainPanel, "UIPanelCloseButton")
MainPanel.xclose_button:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -30, -8)

MainPanel.xclose_button:SetScript("OnClick",
				  function(self, button, down)
					  MainPanel:Hide()
				  end)

-------------------------------------------------------------------------------
-- Create MainPanel.filter_toggle, and set its scripts.
-------------------------------------------------------------------------------
do
	local VALID_CATEGORY = {
		["general"]	= true,
		["obtain"]	= true,
		["binding"]	= true,
		["item"]	= true,
		["quality"]	= true,
		["player"]	= true,
		["rep"]		= true,
		["misc"]	= true,
	}

	local function Toggle_OnClick(self, button, down)
		if MainPanel.is_expanded then
			-- Change the text and tooltip for the filter button
			SetTooltipScripts(self, L["FILTER_OPEN_DESC"])

			-- Hide the category buttons
			for category in pairs(MainPanel.filter_menu) do
				if VALID_CATEGORY[category] then
					MainPanel["menu_toggle_" .. category]:Hide()
				end
			end
			MainPanel.filter_reset:Hide()
			MainPanel.filter_menu:Hide()
		else
			-- Change the text and tooltip for the filter button
			SetTooltipScripts(self, L["FILTER_CLOSE_DESC"])

			local found_active = false

			-- Show the category buttons. If one has been selected, show its information in the panel.
			for category in pairs(MainPanel.filter_menu) do
				local toggle = "menu_toggle_" .. category

				if VALID_CATEGORY[category] then
					MainPanel[toggle]:Show()

					if MainPanel[toggle]:GetChecked() then
						found_active = true
						MainPanel.filter_menu[category]:Show()
						MainPanel.filter_menu:Show()
					end
				end
			end

			-- If nothing was checked, default to the general filters.
			if not found_active then
				MainPanel.menu_toggle_general:SetChecked(true)
				MainPanel.filter_menu.general:Show()
				MainPanel.filter_menu:Show()
			end
			MainPanel.filter_reset:Show()
		end
		MainPanel:ToggleState()
		self:SetTextures()
	end

	local filter_toggle = GenericCreateButton(nil, MainPanel, 24, 24, nil, nil, nil, L["FILTER_OPEN_DESC"], 2)
	filter_toggle:SetPoint("TOPRIGHT", WidgetContainer, "TOPRIGHT", -2, -2)

	filter_toggle:SetScript("OnClick", Toggle_OnClick)

	filter_toggle:SetHighlightTexture([[Interface\CHATFRAME\UI-ChatIcon-BlinkHilight]])
	
	function filter_toggle:SetTextures()
		if MainPanel.is_expanded then
			self:SetNormalTexture([[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Up]])
			self:SetPushedTexture([[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Down]])
			self:SetDisabledTexture([[Interface\BUTTONS\UI-SpellbookIcon-PrevPage-Disabled]])
		else
			self:SetNormalTexture([[Interface\BUTTONS\UI-SpellbookIcon-NextPage-Up]])
			self:SetPushedTexture([[Interface\BUTTONS\UI-SpellbookIcon-NextPage-Down]])
			self:SetDisabledTexture([[Interface\BUTTONS\UI-SpellbookIcon-NextPage-Disabled]])
		end
	end
	MainPanel.filter_toggle = filter_toggle
end	-- do-block
-------------------------------------------------------------------------------
-- Create MainPanel.filter_reset and set its scripts.
-------------------------------------------------------------------------------
MainPanel.filter_reset = GenericCreateButton(nil, MainPanel, 22, 78, "GameFontNormalSmall", _G.RESET, "CENTER", L["RESET_DESC"], 1)
MainPanel.filter_reset:SetPoint("BOTTOMRIGHT", MainPanel, "BOTTOMRIGHT", -95, 80)
MainPanel.filter_reset:Hide()

-- Set all the current options in the filter menu to make sure they are consistent with the SV options.
local function UpdateFilterMarks()
	for filter, info in pairs(FilterValueMap) do
		if info.svroot then
			info.cb:SetChecked(info.svroot[filter])
		end
	end
end

do
	local function recursiveReset(t)
		-- Thanks to Antiarc for this code
		for k, v in pairs(t) do
			if type(v) == "table" then
				recursiveReset(v)
			else
				t[k] = true
			end
		end
	end

	function ResetFilters()
		local filterdb = addon.db.profile.filters

		-- Reset all filters to true.
		recursiveReset(addon.db.profile.filters)

		-- Reset specific filters to false.
		filterdb.general.specialty = false
		filterdb.general.known = false
		filterdb.general.retired = false

		-- Reset all classes to false.
		for class in pairs(filterdb.classes) do
			filterdb.classes[class] = false
		end
		-- Set your own class to true.
		filterdb.classes[strlower(Player["Class"])] = true

		if MainPanel:IsVisible() then
			MainPanel:UpdateTitle()
			UpdateFilterMarks()
			MainPanel.list_frame:Update(nil, false)
		end
	end
	MainPanel.filter_reset:SetScript("OnClick", ResetFilters)
end	-- do

-------------------------------------------------------------------------------
-- Function to create and initialize a check-button with the given values. Used in all of
-- the sub-menus of MainPanel.filter_menu
-------------------------------------------------------------------------------
local GenerateCheckBoxes
do
	local function CheckButton_OnClick(self, button, down)
		local script_val = self.script_val

		FilterValueMap[script_val].svroot[script_val] = FilterValueMap[script_val].cb:GetChecked() and true or false
		MainPanel:UpdateTitle()
		MainPanel.list_frame:Update(nil, false)
	end

	local function CreateCheckButton(parent, ttText, scriptVal, row, col)
		-- set the position of the new checkbox
		local xPos = 2 + ((col - 1) * 175)
		local yPos = -3 - ((row - 1) * 17)

		local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
		check:SetPoint("TOPLEFT", parent, "TOPLEFT", xPos, yPos)
		check:SetHeight(24)
		check:SetWidth(24)

		check.text = check:CreateFontString(nil, "OVERLAY", "QuestFontNormalSmall")
		check.text:SetPoint("LEFT", check, "RIGHT", 0, 0)

		check.script_val = scriptVal

		check:SetScript("OnClick", CheckButton_OnClick)

		SetTooltipScripts(check, ttText, 1)

		return check
	end

	function GenerateCheckBoxes(parent, source)
		for section, data in pairs(source) do
			parent[section] = CreateCheckButton(parent, data.tt, section, data.row, data.col)
			parent[section].text:SetText(data.text)
		end
	end
end	-- do

-------------------------------------------------------------------------------
-- Sort-mode toggle button.
-------------------------------------------------------------------------------
local SortToggle = GenericCreateButton(nil, MainPanel, 24, 24, nil, nil, nil, L["SORTING_DESC"], 2)

MainPanel.sort_button = SortToggle

SortToggle:SetPoint("LEFT", ExpandButtonFrame, "RIGHT", 0, 2)

SortToggle:SetScript("OnClick",
		     function(self, button, down)
			     local sort_type = addon.db.profile.sorting

			     addon.db.profile.sorting = (sort_type == "Ascending" and "Descending" or "Ascending")

			     self:SetTextures()
			     MainPanel.list_frame:Update(nil, false)
		     end)

SortToggle:SetHighlightTexture([[Interface\CHATFRAME\UI-ChatIcon-BlinkHilight]])

function SortToggle:SetTextures()
	local sort_type = addon.db.profile.sorting

	if sort_type == "Ascending" then
		self:SetNormalTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollDown-Up]])
		self:SetPushedTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollDown-Down]])
		self:SetDisabledTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollDown-Disabled]])
	else
		self:SetNormalTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollUp-Up]])
		self:SetPushedTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollUp-Down]])
		self:SetDisabledTexture([[Interface\CHATFRAME\UI-ChatIcon-ScrollUp-Disabled]])
	end
end

-------------------------------------------------------------------------------
-- Create MainPanel.progress_bar and set its scripts
-------------------------------------------------------------------------------
do
	local progress_bar = CreateFrame("StatusBar", nil, MainPanel)
	progress_bar:SetWidth(216)
	progress_bar:SetHeight(18)
	progress_bar:SetPoint("BOTTOMLEFT", MainPanel, 17, 80)
	progress_bar:SetBackdrop({
					 bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
					 tile = true,
					 tileSize = 16,
				 })

	progress_bar:SetStatusBarTexture([[Interface\TARGETINGFRAME\UI-StatusBar]])
	progress_bar:SetOrientation("HORIZONTAL")
	progress_bar:SetStatusBarColor(0.37, 0.45, 1.0)

	local border = progress_bar:CreateTexture(nil, "OVERLAY")
	border:SetWidth(288)
	border:SetHeight(78)
	border:SetPoint("TOPLEFT", progress_bar, "TOPLEFT", -36, 31)
	border:SetTexture([[Interface\CastingBar\UI-CastingBar-Border]])

	local text = progress_bar:CreateFontString(nil, "ARTWORK")
	text:SetWidth(195)
	text:SetHeight(14)
	text:SetFontObject("GameFontHighlightSmall")
	text:SetPoint("CENTER", progress_bar, "CENTER", 0, 0)
	text:SetJustifyH("CENTER")
	text:SetJustifyV("CENTER")

	progress_bar.text = text
	MainPanel.progress_bar = progress_bar
end	-- do

-------------------------------------------------------------------------------
-- Create the close button, and set its scripts.
-------------------------------------------------------------------------------
MainPanel.close_button = GenericCreateButton(nil, MainPanel, 24, 111, "GameFontNormalSmall", _G.EXIT, "CENTER", L["CLOSE_DESC"], 1)
MainPanel.close_button:SetPoint("LEFT", MainPanel.progress_bar, "RIGHT", 3, 1)

MainPanel.close_button:SetScript("OnClick",
				 function(self, button, down)
					 MainPanel:Hide()
				 end)

-------------------------------------------------------------------------------
-- Data used in GenerateClickableTT() and its support functions.
-------------------------------------------------------------------------------
local click_info = {
	anchor = nil,
	change_realm = nil,
	target_realm = nil,
	modified = nil,
	name = nil,
	realm = nil,
}
local clicktip
local GenerateClickableTT	-- Upvalued!

-------------------------------------------------------------------------------
-- Clicktip OnMouseUp scripts.
-------------------------------------------------------------------------------
local function ChangeRealm(cell, arg, button)
	click_info.modified = true
	click_info.realm = nil
	click_info.change_realm = true
	click_info.target_realm = nil
	GenerateClickableTT()
end

local function SelectRealm(cell, arg, button)
	click_info.modified = true

	if click_info.change_realm then
		click_info.target_realm = arg
	end
	click_info.realm = arg
	GenerateClickableTT()
end

local function SelectName(cell, arg, button)
	click_info.modified = true
	click_info.name = arg

	-- Wipe tradeskill information for the selected toon. -Torhal
	if _G.IsAltKeyDown() and button == "LeftButton" then
		local tskl_list = addon.db.global.tradeskill
		tskl_list[click_info.realm][click_info.name] = nil

		-- See if there are any toons left on the realm. If not, nuke it as well.
		local found = false
		for name in pairs(tskl_list[click_info.realm]) do
			found = true
		end
		if not found then
			tskl_list[click_info.realm] = nil
		end
		local anchor = click_info.anchor
		table.wipe(click_info)
		click_info.anchor = anchor
		GenerateClickableTT()
		return
	end
	GenerateClickableTT()
end

local function SelectProfession(cell, arg, button)
	local tskl_list = addon.db.global.tradeskill
	local saved_link = tskl_list[click_info.realm][click_info.name][arg]

	if click_info.realm ~= _G.GetRealmName() then
		local player_guid = string.gsub(UnitGUID("player"), "0x0+", "")
		local color, trade_id, cur_lev, max_lev, guid, bitmask = string.split(":", saved_link)
		local trade_link = string.join(":", color, trade_id, cur_lev, max_lev, player_guid, bitmask)

		addon:Printf("%s (%s): %s", click_info.name, click_info.realm, trade_link)
	else
		addon:Printf("%s: %s", click_info.name, saved_link)
	end
	click_info.modified = true
end

-------------------------------------------------------------------------------
-- Creates a list of names/alts/etc in a tooltip which can be clicked.
-------------------------------------------------------------------------------
function GenerateClickableTT(anchor)
	local tskl_list = addon.db.global.tradeskill
	local tip = clicktip
	local y, x
	local prealm = _G.GetRealmName()
	local target_realm = prealm

	if click_info.change_realm then
		target_realm = click_info.target_realm
		click_info.change_realm = nil
	end
	tip:Clear()

	if not click_info.realm then
		local other_realms = nil
		local header = nil

		for realm in pairs(tskl_list) do
			if target_realm and realm ~= target_realm then
				other_realms = true
			end

			if not target_realm and realm ~= prealm then
				if not header then
					tip:AddHeader(L["Other Realms"])
					tip:AddSeparator()
					header = true
				end
				y, x = tip:AddLine()
				tip:SetCell(y, x, realm)
				tip:SetCellScript(y, x, "OnMouseUp", SelectRealm, realm)
			elseif realm == target_realm then
				click_info.realm = realm

				tip:AddHeader(realm)
				tip:AddSeparator()

				for name in pairs(tskl_list[click_info.realm]) do
					if name ~= _G.UnitName("player") then
						y, x = tip:AddLine()
						tip:SetCell(y, x, name)
						tip:SetCellScript(y, x, "OnMouseUp", SelectName, name)
					end
				end
			end
		end

		if other_realms then
			tip:AddSeparator()
			y, x = tip:AddLine()
			tip:SetCell(y, x, L["Other Realms"])
			tip:SetCellScript(y, x, "OnMouseUp", ChangeRealm)
		end
		tip:AddSeparator()
	elseif not click_info.name then
		local realm_list = tskl_list[click_info.realm]

		if realm_list then
			tip:AddLine(click_info.realm)
			tip:AddSeparator()

			for name in pairs(realm_list) do
				y, x = tip:AddLine()
				tip:SetCell(y, x, name)
				tip:SetCellScript(y, x, "OnMouseUp", SelectName, name)
			end
			tip:AddSeparator()
		end
	else
		tip:AddHeader(click_info.name)
		tip:AddSeparator()

		for prof in pairs(tskl_list[click_info.realm][click_info.name]) do
			y, x = tip:AddLine()
			tip:SetCell(y, x, prof)
			tip:SetCellScript(y, x, "OnMouseUp", SelectProfession, prof)
		end
		tip:AddSeparator()
	end

	if anchor then
		click_info.anchor = anchor
		tip:SetPoint("TOP", anchor, "BOTTOM")
	else
		tip:SetPoint("TOP", click_info.anchor, "BOTTOM")
	end
	tip:Show()
end

local EXPANSION_FRAMES = {
	["expansion0"]	= true,
	["expansion1"]	= true,
	["expansion2"]	= true,
}

-------------------------------------------------------------------------------
-- Initializes runtime elements of MainPanel.
-------------------------------------------------------------------------------
local function InitializeFrame()
	-------------------------------------------------------------------------------
	-- Check to see if we're Horde or Alliance, and change the displayed
	-- reputation strings to be faction-correct.
	-------------------------------------------------------------------------------
	local isAlliance = (Player.faction == "Alliance")

	local HonorHold_Thrallmar_Text = isAlliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]
	local Kurenai_Maghar_Text = isAlliance and BFAC["Kurenai"] or BFAC["The Mag'har"]
	local Vanguard_Expedition_Text = isAlliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]
	local SilverCov_Sunreaver_Text = isAlliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]
	local Valiance_Warsong_Text = isAlliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]
	local Frostborn_Taunka_Text = isAlliance and BFAC["The Frostborn"] or BFAC["The Taunka"]
	local Explorer_Hand_Text = isAlliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]

	-------------------------------------------------------------------------------
	-- Initialize components defined in other files.
	-------------------------------------------------------------------------------
	private.InitializeListFrame()
	private.InitializeTabs()

	-------------------------------------------------------------------------------
	-- Create the seven buttons for opening/closing the filter menus
	-------------------------------------------------------------------------------
	do
		local CATEGORY_TOOLTIP = {
			["general"]	= L["FILTERING_GENERAL_DESC"],
			["obtain"]	= L["FILTERING_OBTAIN_DESC"],
			["binding"]	= L["FILTERING_BINDING_DESC"],
			["item"]	= L["FILTERING_ITEM_DESC"],
			["quality"]	= L["FILTERING_QUALITY_DESC"],
			["player"]	= L["FILTERING_PLAYERTYPE_DESC"],
			["rep"]		= L["FILTERING_REP_DESC"],
			["misc"]	= L["FILTERING_MISC_DESC"]
		}

		-- This manages the filter menu panel, as well as checking or unchecking the
		-- buttons that got us here in the first place
		local function ToggleFilterMenu(panel)
			local rep_menu = MainPanel.filter_menu.rep
			local ChangeFilters = false

			-- Make sure the expansion frames and toggle buttons are hidden/unchecked.
			for expansion in pairs(EXPANSION_FRAMES) do
				rep_menu[expansion]:Hide()
				rep_menu["toggle_" .. expansion]:SetChecked(false)
			end

			local toggle = "menu_toggle_" .. panel

			if not MainPanel[toggle]:GetChecked() then
				-- Display the selected filter_menu category frame
				MainPanel[toggle]:SetChecked(true)
				MainPanel.filter_menu[panel]:Show()

				-- Hide all of the other filter_menu category frames, and un-check them as well.
				for category in pairs(MainPanel.filter_menu) do
					if category ~= panel and CATEGORY_TOOLTIP[category] then
						local tog = "menu_toggle_" .. category

						MainPanel[tog]:SetChecked(false)
						MainPanel.filter_menu[category]:Hide()
					end
				end
				ChangeFilters = true
			else
				MainPanel[toggle]:SetChecked(false)
				ChangeFilters = false
			end

			if ChangeFilters then
				-- Change the filters to the current panel
				MainPanel.filter_menu:Show()
			else
				MainPanel.filter_menu:Hide()
			end
		end

		local function CreateFilterMenuButton(button_texture, category)
			local button_size = 22
			local cButton = CreateFrame("CheckButton", nil, MainPanel)

			cButton:SetWidth(button_size)
			cButton:SetHeight(button_size)
			cButton:SetScript("OnClick",
					  function(self, button, down)
						  -- The button must be unchecked for ToggleFilterMenu() to work correctly.
						  cButton:SetChecked(false)
						  ToggleFilterMenu(category)
					  end)

			local bgTex = cButton:CreateTexture(nil, "BACKGROUND")
			bgTex:SetTexture("Interface/SpellBook/UI-Spellbook-SpellBackground")
			bgTex:SetHeight(button_size + 6)
			bgTex:SetWidth(button_size + 4)
			bgTex:SetTexCoord(0, (43/64), 0, (43/64))
			bgTex:SetPoint("CENTER", cButton, "CENTER", 0, 0)

			local iconTex = cButton:CreateTexture(nil, "BORDER")
			iconTex:SetTexture("Interface/Icons/" .. button_texture)
			iconTex:SetAllPoints(cButton)

			local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
			pushedTexture:SetTexture("Interface/Buttons/UI-Quickslot-Depress")
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)

			local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture("Interface/Buttons/ButtonHilight-Square")
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode("ADD")
			cButton:SetHighlightTexture(highlightTexture)

			local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture("Interface/Buttons/CheckButtonHilight")
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode("ADD")
			cButton:SetCheckedTexture(checkedTexture)

			-- And throw up a tooltip
			SetTooltipScripts(cButton, CATEGORY_TOOLTIP[category])
			cButton:Hide()

			return cButton
		end

		local general = CreateFilterMenuButton("INV_Misc_Note_06", "general")
		general:SetPoint("LEFT", WidgetContainer, "RIGHT", 5, 0)

		local obtain = CreateFilterMenuButton("INV_Misc_Bag_07", "obtain")
		obtain:SetPoint("LEFT", general, "RIGHT", 15, 0)

		local binding = CreateFilterMenuButton("INV_Belt_20", "binding")
		binding:SetPoint("LEFT", obtain, "RIGHT", 15, 0)

		local item = CreateFilterMenuButton("INV_Misc_EngGizmos_19", "item")
		item:SetPoint("LEFT", binding, "RIGHT", 15, 0)

		local quality = CreateFilterMenuButton("INV_Enchant_VoidCrystal", "quality")
		quality:SetPoint("LEFT", item, "RIGHT", 15, 0)

		local player = CreateFilterMenuButton("INV_Misc_GroupLooking", "player")
		player:SetPoint("LEFT", quality, "RIGHT", 15, 0)

		local rep = CreateFilterMenuButton("Achievement_Reputation_01", "rep")
		rep:SetPoint("LEFT", player, "RIGHT", 15, 0)

		local misc = CreateFilterMenuButton("Trade_Engineering", "misc")
		misc:SetPoint("LEFT", rep, "RIGHT", 15, 0)

		-- Assign the buttons as members.
		MainPanel.menu_toggle_general = general
		MainPanel.menu_toggle_obtain = obtain
		MainPanel.menu_toggle_binding = binding
		MainPanel.menu_toggle_item = item
		MainPanel.menu_toggle_quality = quality
		MainPanel.menu_toggle_player = player
		MainPanel.menu_toggle_rep = rep
		MainPanel.menu_toggle_misc = misc
	end	-- do

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu and set its scripts.
	-------------------------------------------------------------------------------
	do
		local filter_menu = CreateFrame("Frame", nil, MainPanel)
		filter_menu:SetWidth(300)
		filter_menu:SetHeight(FILTERMENU_HEIGHT)
		filter_menu:SetFrameStrata("MEDIUM")
		filter_menu:SetPoint("TOPRIGHT", MainPanel, "TOPRIGHT", -135, -60)
		filter_menu:EnableMouse(true)
		filter_menu:EnableKeyboard(true)
		filter_menu:SetMovable(false)
		filter_menu:SetHitRectInsets(5, 5, 5, 5)
		filter_menu:Hide()

		filter_menu:SetScript("OnShow", UpdateFilterMarks)

		function filter_menu:CreateSubMenu(name)
			local submenu = CreateFrame("Frame", nil, self)

			submenu:SetWidth(FILTERMENU_LARGE)
			submenu:SetHeight(FILTERMENU_HEIGHT)
			submenu:EnableMouse(true)
			submenu:EnableKeyboard(true)
			submenu:SetMovable(false)
			submenu:SetPoint("TOPLEFT", self, "TOPLEFT", 17, -16)
			submenu:Hide()

			self[name] = submenu
			return submenu
		end

		MainPanel.filter_menu = filter_menu
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.general, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local general_frame = MainPanel.filter_menu:CreateSubMenu("general")

		-------------------------------------------------------------------------------
		-- Create the general CheckButtons.
		-------------------------------------------------------------------------------
		local general_buttons = {
			["specialty"]	= { tt = L["SPECIALTY_DESC"],	text = L["Specialties"],	row = 1, col = 1 },
			["skill"]	= { tt = L["SKILL_DESC"],	text = _G.SKILL,		row = 1, col = 2 },
			["faction"]	= { tt = L["FACTION_DESC"],	text = _G.FACTION,		row = 2, col = 1 },
			["known"]	= { tt = L["KNOWN_DESC"],	text = L["Show Known"],		row = 2, col = 2 },
			["unknown"]	= { tt = L["UNKNOWN_DESC"],	text = _G.UNKNOWN,		row = 3, col = 1 },
			["retired"]	= { tt = L["RETIRED_DESC"],	text = L["Retired"],		row = 3, col = 2 },
		}
		GenerateCheckBoxes(general_frame, general_buttons)
		general_buttons = nil

		-------------------------------------------------------------------------------
		-- Create the Class toggle and CheckButtons.
		-------------------------------------------------------------------------------
		local class_toggle = GenericCreateButton(nil, general_frame, 20, 105, "GameFontHighlight", L["Classes"] .. ":", "LEFT", L["CLASS_TEXT_DESC"], 0)
		class_toggle:SetPoint("TOPLEFT", MainPanel.filter_menu.general.unknown, "BOTTOMLEFT", -4, -10)
		class_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		class_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		class_toggle:SetScript("OnClick",
				       function(self, button)
					       local classes = addon.db.profile.filters.classes
					       local toggle = (button == "LeftButton") and true or false

					       for class in pairs(classes) do
						       classes[class] = toggle
						       general_frame[class]:SetChecked(toggle)
					       end

					       if toggle == false then
						       local class = strlower(Player["Class"])
						       classes[class] = true
						       general_frame[class]:SetChecked(true)
					       end
					       MainPanel:UpdateTitle()
					       MainPanel.list_frame:Update(nil, false)
				       end)

		general_frame.class_toggle = class_toggle

		local class_buttons = {
			["deathknight"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["DEATHKNIGHT"],	row = 6,  col = 1 },
			["druid"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["DRUID"],		row = 6,  col = 2 },
			["hunter"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["HUNTER"],		row = 7,  col = 1 },
			["mage"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["MAGE"],		row = 7,  col = 2 },
			["paladin"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["PALADIN"],		row = 8,  col = 1 },
			["priest"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["PRIEST"],		row = 8,  col = 2 },
			["rogue"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["ROGUE"],		row = 9,  col = 1 },
			["shaman"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["SHAMAN"],		row = 9,  col = 2 },
			["warlock"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["WARLOCK"],		row = 10, col = 1 },
			["warrior"]	= { tt = L["CLASS_DESC"],	text = LOCALIZED_CLASS_NAMES_MALE["WARRIOR"],		row = 10, col = 2 },
		}
		GenerateCheckBoxes(general_frame, class_buttons)
		class_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.obtain, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local obtain_frame = MainPanel.filter_menu:CreateSubMenu("obtain")

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local obtain_buttons = {
			["instance"]	= { tt = L["INSTANCE_DESC"],		text = _G.INSTANCE,				row = 1, col = 1 },
			["raid"]	= { tt = L["RAID_DESC"],		text = _G.RAID,					row = 1, col = 2 },
			["quest"]	= { tt = L["QUEST_DESC"],		text = L["Quest"],				row = 2, col = 1 },
			["seasonal"]	= { tt = L["SEASONAL_DESC"],		text = private.acquire_names[A.SEASONAL],	row = 2, col = 2 },
			["trainer"]	= { tt = L["TRAINER_DESC"],		text = L["Trainer"],				row = 3, col = 1 },
			["vendor"]	= { tt = L["VENDOR_DESC"],		text = L["Vendor"],				row = 3, col = 2 },
			["pvp"]		= { tt = L["PVP_DESC"],			text = _G.PVP,					row = 4, col = 1 },
			["discovery"]	= { tt = L["DISCOVERY_DESC"],		text = L["Discovery"],				row = 4, col = 2 },
			["worlddrop"]	= { tt = L["WORLD_DROP_DESC"],		text = L["World Drop"],				row = 5, col = 1 },
			["mobdrop"]	= { tt = L["MOB_DROP_DESC"],		text = L["Mob Drop"],				row = 5, col = 2 },
			["expansion0"]	= { tt = L["ORIGINAL_WOW_DESC"],	text = _G.EXPANSION_NAME0,			row = 7, col = 1 },
			["expansion1"]	= { tt = L["BC_WOW_DESC"],		text = _G.EXPANSION_NAME1,			row = 8, col = 1 },
			["expansion2"]	= { tt = L["LK_WOW_DESC"],		text = _G.EXPANSION_NAME2,			row = 9, col = 1 },
		}
		GenerateCheckBoxes(obtain_frame, obtain_buttons)
		obtain_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.binding, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local binding_frame = MainPanel.filter_menu:CreateSubMenu("binding")

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local binding_buttons = {
			["itemboe"]	= { tt = L["BOE_DESC"],		text = L["BOEFilter"],		row = 1, col = 1 },
			["itembop"]	= { tt = L["BOP_DESC"],		text = L["BOPFilter"],		row = 2, col = 1 },
			["recipeboe"]	= { tt = L["RECIPE_BOE_DESC"],	text = L["RecipeBOEFilter"],	row = 3, col = 1 },
			["recipebop"]	= { tt = L["RECIPE_BOP_DESC"],	text = L["RecipeBOPFilter"],	row = 4, col = 1 },
		}
		GenerateCheckBoxes(binding_frame, binding_buttons)
		binding_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.item, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local item_frame = MainPanel.filter_menu:CreateSubMenu("item")

		-------------------------------------------------------------------------------
		-- Create the Armor toggle and CheckButtons
		-------------------------------------------------------------------------------
		local armor_toggle = GenericCreateButton(nil, item_frame, 20, 105, "GameFontHighlight", _G.ARMOR .. ":", "LEFT", L["ARMOR_TEXT_DESC"], 0)
		armor_toggle:SetPoint("TOPLEFT", item_frame, "TOPLEFT", -2, -4)
		armor_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		armor_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		armor_toggle:SetScript("OnClick",
				       function(self, button)
					       local armors = addon.db.profile.filters.item.armor
					       local toggle = (button == "LeftButton") and true or false

					       for armor in pairs(armors) do
						       armors[armor] = toggle
						       item_frame[armor]:SetChecked(toggle)
					       end
					       MainPanel:UpdateTitle()
					       MainPanel.list_frame:Update(nil, false)
				       end)

		item_frame.armor_toggle = armor_toggle

		local armor_buttons = {
			["cloth"]	= { tt = L["CLOTH_DESC"],	text = L["Cloth"],	row = 2, col = 1 },
			["leather"]	= { tt = L["LEATHER_DESC"],	text = L["Leather"],	row = 2, col = 2 },
			["mail"]	= { tt = L["MAIL_DESC"],	text = L["Mail"],	row = 3, col = 1 },
			["plate"]	= { tt = L["PLATE_DESC"],	text = L["Plate"],	row = 3, col = 2 },
			["cloak"]	= { tt = L["CLOAK_DESC"],	text = L["Cloak"],	row = 4, col = 1 },
			["necklace"]	= { tt = L["NECKLACE_DESC"],	text = L["Necklace"],	row = 4, col = 2 },
			["ring"]	= { tt = L["RING_DESC"],	text = L["Ring"],	row = 5, col = 1 },
			["trinket"]	= { tt = L["TRINKET_DESC"],	text = L["Trinket"],	row = 5, col = 2 },
			["shield"]	= { tt = L["SHIELD_DESC"],	text = L["Shield"],	row = 6, col = 1 },
		}
		GenerateCheckBoxes(item_frame, armor_buttons)
		armor_buttons = nil

		-------------------------------------------------------------------------------
		-- Create the Weapon toggle and CheckButtons
		-------------------------------------------------------------------------------
		local weapon_toggle = GenericCreateButton(nil, item_frame, 20, 105, "GameFontHighlight", L["Weapon"] .. ":", "LEFT", L["WEAPON_TEXT_DESC"], 0)
		weapon_toggle:SetPoint("TOPLEFT", item_frame, "TOPLEFT", -2, -122)

		weapon_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		weapon_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		weapon_toggle:SetScript("OnClick",
					function(self, button)
						local weapons = addon.db.profile.filters.item.weapon
						local toggle = (button == "LeftButton") and true or false

						for weapon in pairs(weapons) do
							weapons[weapon] = toggle

							if FilterValueMap[weapon].svroot then
								item_frame[weapon]:SetChecked(toggle)
							end
						end
						MainPanel:UpdateTitle()
						MainPanel.list_frame:Update(nil, false)
					end)

		item_frame.weapon_toggle = weapon_toggle

		local weapon_buttons = {
			["onehand"]	= { tt = L["ONEHAND_DESC"],	text = L["One Hand"],						row = 9,  col = 1 },
			["twohand"]	= { tt = L["TWOHAND_DESC"],	text = L["Two Hand"],						row = 9,  col = 2 },
			["dagger"]	= { tt = L["DAGGER_DESC"],	text = L["Dagger"],						row = 10, col = 1 },
			["axe"]		= { tt = L["AXE_DESC"],		text = L["Axe"],						row = 10, col = 2 },
			["mace"]	= { tt = L["MACE_DESC"],	text = L["Mace"],						row = 11, col = 1 },
			["sword"]	= { tt = L["SWORD_DESC"],	text = L["Sword"],						row = 11, col = 2 },
			["polearm"]	= { tt = L["POLEARM_DESC"],	text = L["Polearm"],						row = 12, col = 1 },
			["fist"]	= { tt = L["FIST_DESC"],	text = L["Fist"],						row = 12, col = 2 },
			["staff"]	= { tt = L["STAFF_DESC"],	text = SetTextColor(BASIC_COLORS["grey"], L["Staff"]),		row = 13, col = 1 },
			["wand"]	= { tt = L["WAND_DESC"],	text = L["Wand"],						row = 13, col = 2 },
			["thrown"]	= { tt = L["THROWN_DESC"],	text = L["Thrown"],						row = 14, col = 1 },
			["bow"]		= { tt = L["BOW_DESC"],		text = SetTextColor(BASIC_COLORS["grey"], L["Bow"]),		row = 14, col = 2 },
			["crossbow"]	= { tt = L["CROSSBOW_DESC"],	text = SetTextColor(BASIC_COLORS["grey"], L["Crossbow"]),	row = 15, col = 1 },
			["ammo"]	= { tt = L["AMMO_DESC"],	text = L["Ammo"],						row = 15, col = 2 },
			["gun"]		= { tt = L["GUN_DESC"],		text = L["Gun"],						row = 16, col = 1 },
		}
		GenerateCheckBoxes(item_frame, weapon_buttons)
		weapon_buttons = nil

		-- Some of these are disabled for now, since they currently have no recipes.
		item_frame.staff:Disable()
		item_frame.bow:Disable()
		item_frame.crossbow:Disable()
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.quality, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local quality_frame = MainPanel.filter_menu:CreateSubMenu("quality")

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local function QualityDesc(text)
			return string.format(L["QUALITY_GENERAL_DESC"], text)
		end

		local quality_buttons = {
			["common"]	= { tt = QualityDesc(_G.ITEM_QUALITY1_DESC),	text = _G.ITEM_QUALITY1_DESC,	row = 1, col = 1 },
			["uncommon"]	= { tt = QualityDesc(_G.ITEM_QUALITY2_DESC),	text = _G.ITEM_QUALITY2_DESC,	row = 2, col = 1 },
			["rare"]	= { tt = QualityDesc(_G.ITEM_QUALITY3_DESC),	text = _G.ITEM_QUALITY3_DESC,	row = 3, col = 1 },
			["epic"]	= { tt = QualityDesc(_G.ITEM_QUALITY4_DESC),	text = _G.ITEM_QUALITY4_DESC,	row = 4, col = 1 },
		}
		GenerateCheckBoxes(quality_frame, quality_buttons)
		quality_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.player, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local player_frame = MainPanel.filter_menu:CreateSubMenu("player")
		local tank_desc = string.format(L["ROLE_DESC_FORMAT"], _G.TANK)
		local melee_desc = string.format(L["ROLE_DESC_FORMAT"], _G.MELEE)
		local healer_desc = string.format(L["ROLE_DESC_FORMAT"], _G.HEALER)
		local caster_desc = string.format(L["ROLE_DESC_FORMAT"], _G.DAMAGER)

		-------------------------------------------------------------------------------
		-- Create the CheckButtons
		-------------------------------------------------------------------------------
		local role_buttons = {
			["tank"]	= { tt = tank_desc,	text = _G.TANK,		row = 1, col = 1 },
			["melee"]	= { tt = melee_desc,	text = _G.MELEE,	row = 2, col = 1 },
			["healer"]	= { tt = healer_desc,	text = _G.HEALER,	row = 3, col = 1 },
			["caster"]	= { tt = caster_desc,	text = _G.DAMAGER,	row = 4, col = 1 },
		}
		GenerateCheckBoxes(player_frame, role_buttons)
		role_buttons = nil
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local rep_frame = MainPanel.filter_menu:CreateSubMenu("rep")

		local EXPANSION_TOOLTIP = {
			["expansion0"]	= L["FILTERING_OLDWORLD_DESC"],
			["expansion1"]	= L["FILTERING_BC_DESC"],
			["expansion2"]	= L["FILTERING_WOTLK_DESC"],
		}
		-------------------------------------------------------------------------------
		-- This manages the WoW expansion reputation filter menu panel
		-------------------------------------------------------------------------------
		local function ToggleExpansionMenu(panel)
			local toggle = "toggle_" .. panel
			local button = rep_frame[toggle]

			button:SetChecked(not button:GetChecked())

			if not button:GetChecked() then
				button:SetChecked(true)
				rep_frame[panel]:Show()

				-- Hide all of the other expansion frames, and un-check them as well.
				for expansion in pairs(EXPANSION_FRAMES) do
					if expansion ~= panel then
						local tog = "toggle_" .. expansion

						rep_frame[tog]:SetChecked(false)
						rep_frame[expansion]:Hide()
					end
				end
			else
				rep_frame[panel]:Hide()
				button:SetChecked(false)
			end
		end

		-------------------------------------------------------------------------------
		-- Generic function to create expansion buttons.
		-------------------------------------------------------------------------------
		function rep_frame:CreateExpansionButton(texture, expansion)
			local cButton = CreateFrame("CheckButton", nil, self)
			cButton:SetWidth(100)
			cButton:SetHeight(46)
			cButton:SetChecked(false)
			cButton:SetScript("OnClick", function(self, button, down)
							     ToggleExpansionMenu(expansion)
						     end)

			local iconTex = cButton:CreateTexture(nil, "BORDER")

			if texture == "wotlk_logo" then
				iconTex:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\" .. texture)
			else
				iconTex:SetTexture("Interface/Glues/Common/" .. texture)
			end
			iconTex:SetWidth(100)
			iconTex:SetHeight(46)
			iconTex:SetAllPoints(cButton)

			local pushedTexture = cButton:CreateTexture(nil, "ARTWORK")
			pushedTexture:SetTexture("Interface/Buttons/UI-Quickslot-Depress")
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)

			local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture("Interface/Buttons/ButtonHilight-Square")
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode("ADD")
			cButton:SetHighlightTexture(highlightTexture)

			local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture("Interface/Buttons/CheckButtonHilight")
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode("ADD")
			cButton:SetCheckedTexture(checkedTexture)

			-- And throw up a tooltip
			SetTooltipScripts(cButton, EXPANSION_TOOLTIP[expansion])

			return cButton
		end

		-------------------------------------------------------------------------------
		-- Create the expansion toggles.
		-------------------------------------------------------------------------------
		local expansion0 = rep_frame:CreateExpansionButton("Glues-WoW-Logo", "expansion0")
		expansion0:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -10)

		local expansion1 = rep_frame:CreateExpansionButton("GLUES-WOW-BCLOGO", "expansion1")
		expansion1:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -60)

		local expansion2 = rep_frame:CreateExpansionButton("Glues-WOW-WotlkLogo", "expansion2")
		expansion2:SetPoint("TOPLEFT", MainPanel.filter_menu.rep, "TOPLEFT", 0, -110)

		rep_frame.toggle_expansion0 = expansion0
		rep_frame.toggle_expansion1 = expansion1
		rep_frame.toggle_expansion2 = expansion2
	end	-- do

	-------------------------------------------------------------------------------
	-- Used for the tooltip of every reputation checkbox.
	-------------------------------------------------------------------------------
	local function ReputationDesc(text)
		return string.format(L["SPECIFIC_REP_DESC"], text)
	end

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep.expansion0, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion0_frame = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
		expansion0_frame:SetWidth(150)
		expansion0_frame:SetHeight(280)
		expansion0_frame:EnableMouse(true)
		expansion0_frame:EnableKeyboard(true)
		expansion0_frame:SetMovable(false)
		expansion0_frame:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -30, -16)
		expansion0_frame:Hide()

		MainPanel.filter_menu.rep.expansion0 = expansion0_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local expansion0_buttons = {
			["argentdawn"]		= { tt = ReputationDesc(BFAC["Argent Dawn"]),		text = BFAC["Argent Dawn"],		row = 2, col = 1 },
			["cenarioncircle"]	= { tt = ReputationDesc(BFAC["Cenarion Circle"]),	text = BFAC["Cenarion Circle"],		row = 3, col = 1 },
			["thoriumbrotherhood"]	= { tt = ReputationDesc(BFAC["Thorium Brotherhood"]),	text = BFAC["Thorium Brotherhood"],	row = 4, col = 1 },
			["timbermaw"]		= { tt = ReputationDesc(BFAC["Timbermaw Hold"]),	text = BFAC["Timbermaw Hold"],		row = 5, col = 1 },
			["zandalar"]		= { tt = ReputationDesc(BFAC["Zandalar Tribe"]),	text = BFAC["Zandalar Tribe"],		row = 6, col = 1 },
		}
		GenerateCheckBoxes(expansion0_frame, expansion0_buttons)

		local expansion0_toggle = GenericCreateButton(nil, expansion0_frame, 15, 120, "GameFontHighlight", _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
		expansion0_toggle:SetPoint("TOPLEFT", expansion0_frame, "TOPLEFT", -2, -4)

		expansion0_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		expansion0_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		expansion0_toggle:SetScript("OnClick",
					    function(self, button)
						    local filterdb = addon.db.profile.filters.rep

						    if button == "LeftButton" then
							    for reputation in pairs(expansion0_buttons) do
								    filterdb[reputation] = true
							    end
						    elseif button == "RightButton" then
							    for reputation in pairs(expansion0_buttons) do
								    filterdb[reputation] = false
							    end
						    end

						    for reputation in pairs(expansion0_buttons) do
							    expansion0_frame[reputation]:SetChecked(filterdb[reputation])
						    end
						    MainPanel:UpdateTitle()
						    MainPanel.list_frame:Update(nil, false)
					    end)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep.expansion1, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion1_frame = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
		expansion1_frame:SetWidth(150)
		expansion1_frame:SetHeight(280)
		expansion1_frame:EnableMouse(true)
		expansion1_frame:EnableKeyboard(true)
		expansion1_frame:SetMovable(false)
		expansion1_frame:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -30, -16)
		expansion1_frame:Hide()

		MainPanel.filter_menu.rep.expansion1 = expansion1_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local expansion1_buttons = {
			["aldor"]		= { tt = ReputationDesc(BFAC["The Aldor"]),			text = BFAC["The Aldor"],		row = 2,	col = 1 },
			["ashtonguedeathsworn"]	= { tt = ReputationDesc(BFAC["Ashtongue Deathsworn"]),		text = BFAC["Ashtongue Deathsworn"],	row = 3,	col = 1 },
			["cenarionexpedition"]	= { tt = ReputationDesc(BFAC["Cenarion Expedition"]),		text = BFAC["Cenarion Expedition"],	row = 4,	col = 1 },
			["consortium"]		= { tt = ReputationDesc(BFAC["The Consortium"]),		text = BFAC["The Consortium"],		row = 5,	col = 1 },
			["hellfire"]		= { tt = ReputationDesc(HonorHold_Thrallmar_Text),		text = HonorHold_Thrallmar_Text,	row = 6,	col = 1 },
			["keepersoftime"]	= { tt = ReputationDesc(BFAC["Keepers of Time"]),		text = BFAC["Keepers of Time"],		row = 7,	col = 1 },
			["nagrand"]		= { tt = ReputationDesc(Kurenai_Maghar_Text),			text = Kurenai_Maghar_Text,		row = 8,	col = 1 },
			["lowercity"]		= { tt = ReputationDesc(BFAC["Lower City"]),			text = BFAC["Lower City"],		row = 9,	col = 1 },
			["scaleofthesands"]	= { tt = ReputationDesc(BFAC["The Scale of the Sands"]),	text = BFAC["The Scale of the Sands"],	row = 10,	col = 1 },
			["scryer"]		= { tt = ReputationDesc(BFAC["The Scryers"]),			text = BFAC["The Scryers"],		row = 11,	col = 1 },
			["shatar"]		= { tt = ReputationDesc(BFAC["The Sha'tar"]),			text = BFAC["The Sha'tar"],		row = 12,	col = 1 },
			["shatteredsun"]	= { tt = ReputationDesc(BFAC["Shattered Sun Offensive"]),	text = BFAC["Shattered Sun Offensive"],	row = 13,	col = 1 },
			["sporeggar"]		= { tt = ReputationDesc(BFAC["Sporeggar"]),			text = BFAC["Sporeggar"],		row = 14,	col = 1 },
			["violeteye"]		= { tt = ReputationDesc(BFAC["The Violet Eye"]),		text = BFAC["The Violet Eye"],		row = 15,	col = 1 },
		}
		GenerateCheckBoxes(expansion1_frame, expansion1_buttons)

		local expansion1_toggle = GenericCreateButton(nil, expansion1_frame, 15, 120, "GameFontHighlight", _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
		expansion1_toggle:SetPoint("TOPLEFT", expansion1_frame, "TOPLEFT", -2, -4)

		expansion1_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		expansion1_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		expansion1_toggle:SetScript("OnClick",
					    function(self,button)
						    local filterdb = addon.db.profile.filters.rep

						    if button == "LeftButton" then
							    for reputation in pairs(expansion1_buttons) do
								    filterdb[reputation] = true
							    end
						    elseif button == "RightButton" then
							    for reputation in pairs(expansion1_buttons) do
								    filterdb[reputation] = false
							    end
						    end

						    for reputation in pairs(expansion1_buttons) do
							    expansion1_frame[reputation]:SetChecked(filterdb[reputation])
						    end
						    MainPanel:UpdateTitle()
						    MainPanel.list_frame:Update(nil, false)
					    end)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Create MainPanel.filter_menu.rep.expansion2, and set its scripts.
	-------------------------------------------------------------------------------
	do
		local expansion2_frame = CreateFrame("Frame", nil, MainPanel.filter_menu.rep)
		expansion2_frame:SetWidth(150)
		expansion2_frame:SetHeight(280)
		expansion2_frame:EnableMouse(true)
		expansion2_frame:EnableKeyboard(true)
		expansion2_frame:SetMovable(false)
		expansion2_frame:SetPoint("TOPRIGHT", MainPanel.filter_menu, "TOPRIGHT", -30, -16)
		expansion2_frame:Hide()

		MainPanel.filter_menu.rep.expansion2 = expansion2_frame

		-------------------------------------------------------------------------------
		-- Create the Reputation toggle and CheckButtons
		-------------------------------------------------------------------------------
		local function DisabledText(text)
			return SetTextColor(BASIC_COLORS["grey"], text)
		end

		local expansion2_buttons = {
			["wrathcommon1"]	= { tt = ReputationDesc(Vanguard_Expedition_Text),		text = Vanguard_Expedition_Text,		row = 2,	col = 1 },
			["argentcrusade"]	= { tt = ReputationDesc(BFAC["Argent Crusade"]),		text = BFAC["Argent Crusade"],			row = 3,	col = 1 },
			["wrathcommon5"]	= { tt = ReputationDesc(Explorer_Hand_Text),			text = DisabledText(Explorer_Hand_Text),	row = 4,	col = 1 },
			["frenzyheart"]		= { tt = ReputationDesc(BFAC["Frenzyheart Tribe"]),		text = BFAC["Frenzyheart Tribe"],		row = 5,	col = 1 },
			["kaluak"]		= { tt = ReputationDesc(BFAC["The Kalu'ak"]),			text = BFAC["The Kalu'ak"],			row = 6,	col = 1 },
			["kirintor"]		= { tt = ReputationDesc(BFAC["Kirin Tor"]),			text = BFAC["Kirin Tor"],			row = 7,	col = 1 },
			["ebonblade"]		= { tt = ReputationDesc(BFAC["Knights of the Ebon Blade"]),	text = BFAC["Knights of the Ebon Blade"],	row = 8,	col = 1 },
			["oracles"]		= { tt = ReputationDesc(BFAC["The Oracles"]),			text = BFAC["The Oracles"],			row = 9,	col = 1 },
			["wrathcommon2"]	= { tt = ReputationDesc(SilverCov_Sunreaver_Text),		text = DisabledText(SilverCov_Sunreaver_Text),	row = 10,	col = 1 },
			["sonsofhodir"]		= { tt = ReputationDesc(BFAC["The Sons of Hodir"]),		text = BFAC["The Sons of Hodir"],		row = 11,	col = 1 },
			["wrathcommon4"]	= { tt = ReputationDesc(Frostborn_Taunka_Text),			text = DisabledText(Frostborn_Taunka_Text),	row = 12,	col = 1 },
			["wrathcommon3"]	= { tt = ReputationDesc(Valiance_Warsong_Text),			text = DisabledText(Valiance_Warsong_Text),	row = 13,	col = 1 },
			["wyrmrest"]		= { tt = ReputationDesc(BFAC["The Wyrmrest Accord"]),		text = BFAC["The Wyrmrest Accord"],		row = 14,	col = 1 },
			["ashenverdict"]	= { tt = ReputationDesc(BFAC["The Ashen Verdict"]),		text = BFAC["The Ashen Verdict"],		row = 15,	col = 1 },
		}
		GenerateCheckBoxes(expansion2_frame, expansion2_buttons)

		-- Disable these for now, since they have no recipes.
		expansion2_frame.wrathcommon2:Disable()
		expansion2_frame.wrathcommon3:Disable()
		expansion2_frame.wrathcommon4:Disable()
		expansion2_frame.wrathcommon5:Disable()

		local expansion2_toggle = GenericCreateButton(nil, expansion2_frame, 15, 120, "GameFontHighlight", _G.REPUTATION .. ":", "LEFT", L["REP_TEXT_DESC"], 0)
		expansion2_toggle:SetPoint("TOPLEFT", expansion2_frame, "TOPLEFT", -2, -4)

		expansion2_toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		expansion2_toggle:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		expansion2_toggle:SetScript("OnClick",
					   function(self,button)
						    local filterdb = addon.db.profile.filters.rep

						    if button == "LeftButton" then
							    for reputation in pairs(expansion2_buttons) do
								    filterdb[reputation] = true
							    end
						    elseif button == "RightButton" then
							    for reputation in pairs(expansion2_buttons) do
								    filterdb[reputation] = false
							    end
						    end

						    for reputation in pairs(expansion2_buttons) do
							    expansion2_frame[reputation]:SetChecked(filterdb[reputation])
						    end
						    MainPanel:UpdateTitle()
						    MainPanel.list_frame:Update(nil, false)
					   end)
	end	-- do-block

	-------------------------------------------------------------------------------
	-- Miscellaneous Filter Menu
	-------------------------------------------------------------------------------
	MainPanel.filter_menu.misc = CreateFrame("Frame", "ARL_FilterMenu_Misc", MainPanel.filter_menu)
	MainPanel.filter_menu.misc:SetWidth(FILTERMENU_LARGE)
	MainPanel.filter_menu.misc:SetHeight(280)
	MainPanel.filter_menu.misc:EnableMouse(true)
	MainPanel.filter_menu.misc:EnableKeyboard(true)
	MainPanel.filter_menu.misc:SetMovable(false)
	MainPanel.filter_menu.misc:SetPoint("TOPLEFT", MainPanel.filter_menu, "TOPLEFT", 17, -16)
	MainPanel.filter_menu.misc:Hide()

	local ARL_MiscAltText = MainPanel.filter_menu.misc:CreateFontString("ARL_MiscAltBtn", "OVERLAY", "QuestFontNormalSmall")
	ARL_MiscAltText:SetText(L["Alt-Tradeskills"] .. ":")
	ARL_MiscAltText:SetPoint("TOPLEFT", MainPanel.filter_menu.misc, "TOPLEFT", 5, -8)
	ARL_MiscAltText:SetHeight(14)
	ARL_MiscAltText:SetWidth(95)
	ARL_MiscAltText:SetJustifyH("LEFT")

	local ARL_MiscAltBtn = CreateFrame("Button", "ARL_MiscAltBtn", MainPanel.filter_menu.misc)
	ARL_MiscAltBtn:SetPoint("LEFT", ARL_MiscAltText, "RIGHT")
	ARL_MiscAltBtn:SetHeight(22)
	ARL_MiscAltBtn:SetWidth(22)
	ARL_MiscAltBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
	ARL_MiscAltBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
	ARL_MiscAltBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
	ARL_MiscAltBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")

	SetTooltipScripts(ARL_MiscAltBtn, L["ALT_TRADESKILL_DESC"], 1)

	ARL_MiscAltBtn:RegisterForClicks("LeftButtonUp")
	ARL_MiscAltBtn:SetScript("OnClick",
				 function(this, button)
					 if clicktip then
						 if not click_info.modified then
							 clicktip = QTip:Release(clicktip)
							 table.wipe(click_info)
						 else
							 table.wipe(click_info)
							 GenerateClickableTT(this)
						 end
					 else
						 clicktip = QTip:Acquire("ARL_Clickable", 1, "CENTER")
						 table.wipe(click_info)

						 if _G.TipTac and _G.TipTac.AddModifiedTip then
							 _G.TipTac:AddModifiedTip(clicktip, true)
						 end
						 GenerateClickableTT(this)
					 end
				 end)
	ARL_MiscAltBtn:SetScript("OnHide",
				 function(this, button)
					 clicktip = QTip:Release(clicktip)
					 table.wipe(click_info)
				 end)

	-------------------------------------------------------------------------------
	-- Now that everything exists, populate the global filter table
	-------------------------------------------------------------------------------
	local filterdb = addon.db.profile.filters
	local filter_menu = MainPanel.filter_menu

	local expansion0 = filter_menu.rep.expansion0
	local expansion1 = filter_menu.rep.expansion1
	local expansion2 = filter_menu.rep.expansion2

	FilterValueMap = {
		------------------------------------------------------------------------------------------------
		-- General Options
		------------------------------------------------------------------------------------------------
		["specialty"]		= { cb = filter_menu.general.specialty,		svroot = filterdb.general },
		["skill"]		= { cb = filter_menu.general.skill,		svroot = filterdb.general },
		["faction"]		= { cb = filter_menu.general.faction,		svroot = filterdb.general },
		["known"]		= { cb = filter_menu.general.known,		svroot = filterdb.general },
		["unknown"]		= { cb = filter_menu.general.unknown,		svroot = filterdb.general },
		["retired"]		= { cb = filter_menu.general.retired,		svroot = filterdb.general },
		------------------------------------------------------------------------------------------------
		-- Classes
		------------------------------------------------------------------------------------------------
		["deathknight"]		= { cb = filter_menu.general.deathknight,	svroot = filterdb.classes },
		["druid"]		= { cb = filter_menu.general.druid,		svroot = filterdb.classes },
		["hunter"]		= { cb = filter_menu.general.hunter,		svroot = filterdb.classes },
		["mage"]		= { cb = filter_menu.general.mage,		svroot = filterdb.classes },
		["paladin"]		= { cb = filter_menu.general.paladin,		svroot = filterdb.classes },
		["priest"]		= { cb = filter_menu.general.priest,		svroot = filterdb.classes },
		["rogue"]		= { cb = filter_menu.general.rogue,		svroot = filterdb.classes },
		["shaman"]		= { cb = filter_menu.general.shaman,		svroot = filterdb.classes },
		["warlock"]		= { cb = filter_menu.general.warlock,		svroot = filterdb.classes },
		["warrior"]		= { cb = filter_menu.general.warrior,		svroot = filterdb.classes },
		------------------------------------------------------------------------------------------------
		-- Obtain Options
		------------------------------------------------------------------------------------------------
		["instance"]		= { cb = filter_menu.obtain.instance,		svroot = filterdb.obtain },
		["raid"]		= { cb = filter_menu.obtain.raid,		svroot = filterdb.obtain },
		["quest"]		= { cb = filter_menu.obtain.quest,		svroot = filterdb.obtain },
		["seasonal"]		= { cb = filter_menu.obtain.seasonal,		svroot = filterdb.obtain },
		["trainer"]		= { cb = filter_menu.obtain.trainer,		svroot = filterdb.obtain },
		["vendor"]		= { cb = filter_menu.obtain.vendor,		svroot = filterdb.obtain },
		["pvp"]			= { cb = filter_menu.obtain.pvp,		svroot = filterdb.obtain },
		["discovery"]		= { cb = filter_menu.obtain.discovery,		svroot = filterdb.obtain },
		["worlddrop"]		= { cb = filter_menu.obtain.worlddrop,		svroot = filterdb.obtain },
		["mobdrop"]		= { cb = filter_menu.obtain.mobdrop,		svroot = filterdb.obtain },
		["expansion0"]		= { cb = filter_menu.obtain.expansion0,		svroot = filterdb.obtain },
		["expansion1"]		= { cb = filter_menu.obtain.expansion1,		svroot = filterdb.obtain },
		["expansion2"]		= { cb = filter_menu.obtain.expansion2,		svroot = filterdb.obtain },
		------------------------------------------------------------------------------------------------
		-- Binding Options
		------------------------------------------------------------------------------------------------
		["itemboe"]		= { cb = filter_menu.binding.itemboe,		svroot = filterdb.binding },
		["itembop"]		= { cb = filter_menu.binding.itembop,		svroot = filterdb.binding },
		["recipeboe"]		= { cb = filter_menu.binding.recipeboe,		svroot = filterdb.binding },
		["recipebop"]		= { cb = filter_menu.binding.recipebop,		svroot = filterdb.binding },
		------------------------------------------------------------------------------------------------
		-- Armor Options
		------------------------------------------------------------------------------------------------
		["cloth"]		= { cb = filter_menu.item.cloth,		svroot = filterdb.item.armor },
		["leather"]		= { cb = filter_menu.item.leather,		svroot = filterdb.item.armor },
		["mail"]		= { cb = filter_menu.item.mail,			svroot = filterdb.item.armor },
		["plate"]		= { cb = filter_menu.item.plate,		svroot = filterdb.item.armor },
		["cloak"]		= { cb = filter_menu.item.cloak,		svroot = filterdb.item.armor },
		["necklace"]		= { cb = filter_menu.item.necklace,		svroot = filterdb.item.armor },
		["ring"]		= { cb = filter_menu.item.ring,			svroot = filterdb.item.armor },
		["trinket"]		= { cb = filter_menu.item.trinket,		svroot = filterdb.item.armor },
		["shield"]		= { cb = filter_menu.item.shield,		svroot = filterdb.item.armor },
		------------------------------------------------------------------------------------------------
		-- Weapon Options
		------------------------------------------------------------------------------------------------
		["onehand"]		= { cb = filter_menu.item.onehand,		svroot = filterdb.item.weapon },
		["twohand"]		= { cb = filter_menu.item.twohand,		svroot = filterdb.item.weapon },
		["dagger"]		= { cb = filter_menu.item.dagger,		svroot = filterdb.item.weapon },
		["axe"]			= { cb = filter_menu.item.axe,			svroot = filterdb.item.weapon },
		["mace"]		= { cb = filter_menu.item.mace,			svroot = filterdb.item.weapon },
		["sword"]		= { cb = filter_menu.item.sword,		svroot = filterdb.item.weapon },
		["polearm"]		= { cb = filter_menu.item.polearm,		svroot = filterdb.item.weapon },
		["fist"]		= { cb = filter_menu.item.fist,			svroot = filterdb.item.weapon },
		["staff"]		= { cb = filter_menu.item.staff,		svroot = nil },
		["wand"]		= { cb = filter_menu.item.wand,			svroot = filterdb.item.weapon },
		["thrown"]		= { cb = filter_menu.item.thrown,		svroot = filterdb.item.weapon },
		["bow"]			= { cb = filter_menu.item.bow,			svroot = nil },
		["crossbow"]		= { cb = filter_menu.item.crossbow,		svroot = nil },
		["ammo"]		= { cb = filter_menu.item.ammo,			svroot = filterdb.item.weapon },
		["gun"]			= { cb = filter_menu.item.gun,			svroot = filterdb.item.weapon },
		------------------------------------------------------------------------------------------------
		-- Quality Options
		------------------------------------------------------------------------------------------------
		["common"]		= { cb = filter_menu.quality.common,		svroot = filterdb.quality },
		["uncommon"]		= { cb = filter_menu.quality.uncommon,		svroot = filterdb.quality },
		["rare"]		= { cb = filter_menu.quality.rare,		svroot = filterdb.quality },
		["epic"]		= { cb = filter_menu.quality.epic,		svroot = filterdb.quality },
		------------------------------------------------------------------------------------------------
		-- Role Options
		------------------------------------------------------------------------------------------------
		["tank"]		= { cb = filter_menu.player.tank,		svroot = filterdb.player },
		["melee"]		= { cb = filter_menu.player.melee,		svroot = filterdb.player },
		["healer"]		= { cb = filter_menu.player.healer,		svroot = filterdb.player },
		["caster"]		= { cb = filter_menu.player.caster,		svroot = filterdb.player },
		------------------------------------------------------------------------------------------------
		-- Old World Rep Options
		------------------------------------------------------------------------------------------------
		["argentdawn"]		= { cb = expansion0.argentdawn,			svroot = filterdb.rep },
		["cenarioncircle"]	= { cb = expansion0.cenarioncircle,		svroot = filterdb.rep },
		["thoriumbrotherhood"]	= { cb = expansion0.thoriumbrotherhood,		svroot = filterdb.rep },
		["timbermaw"]		= { cb = expansion0.timbermaw,			svroot = filterdb.rep },
		["zandalar"]		= { cb = expansion0.zandalar,			svroot = filterdb.rep },
		------------------------------------------------------------------------------------------------
		-- The Burning Crusade Rep Options
		------------------------------------------------------------------------------------------------
		["aldor"]		= { cb = expansion1.aldor,			svroot = filterdb.rep },
		["ashtonguedeathsworn"]	= { cb = expansion1.ashtonguedeathsworn,	svroot = filterdb.rep },
		["cenarionexpedition"]	= { cb = expansion1.cenarionexpedition,		svroot = filterdb.rep },
		["consortium"]		= { cb = expansion1.consortium,			svroot = filterdb.rep },
		["hellfire"]		= { cb = expansion1.hellfire,			svroot = filterdb.rep },
		["keepersoftime"]	= { cb = expansion1.keepersoftime,		svroot = filterdb.rep },
		["nagrand"]		= { cb = expansion1.nagrand,			svroot = filterdb.rep },
		["lowercity"]		= { cb = expansion1.lowercity,			svroot = filterdb.rep },
		["scaleofthesands"]	= { cb = expansion1.scaleofthesands,		svroot = filterdb.rep },
		["scryer"]		= { cb = expansion1.scryer,			svroot = filterdb.rep },
		["shatar"]		= { cb = expansion1.shatar,			svroot = filterdb.rep },
		["shatteredsun"]	= { cb = expansion1.shatteredsun,		svroot = filterdb.rep },
		["sporeggar"]		= { cb = expansion1.sporeggar,			svroot = filterdb.rep },
		["violeteye"]		= { cb = expansion1.violeteye,			svroot = filterdb.rep },
		------------------------------------------------------------------------------------------------
		-- Wrath of The Lich King Rep Options
		------------------------------------------------------------------------------------------------
		["argentcrusade"]	= { cb = expansion2.argentcrusade,		svroot = filterdb.rep },
		["frenzyheart"]		= { cb = expansion2.frenzyheart,		svroot = filterdb.rep },
		["ebonblade"]		= { cb = expansion2.ebonblade,			svroot = filterdb.rep },
		["kirintor"]		= { cb = expansion2.kirintor,			svroot = filterdb.rep },
		["sonsofhodir"]		= { cb = expansion2.sonsofhodir,		svroot = filterdb.rep },
		["kaluak"]		= { cb = expansion2.kaluak,			svroot = filterdb.rep },
		["oracles"]		= { cb = expansion2.oracles,			svroot = filterdb.rep },
		["wyrmrest"]		= { cb = expansion2.wyrmrest,			svroot = filterdb.rep },
		["ashenverdict"]	= { cb = expansion2.ashenverdict,		svroot = filterdb.rep },
		["wrathcommon1"]	= { cb = expansion2.wrathcommon1,		svroot = filterdb.rep },
		["wrathcommon2"]	= { cb = expansion2.wrathcommon2,		svroot = nil },
		["wrathcommon3"]	= { cb = expansion2.wrathcommon3,		svroot = nil },
		["wrathcommon4"]	= { cb = expansion2.wrathcommon4,		svroot = nil },
		["wrathcommon5"]	= { cb = expansion2.wrathcommon5,		svroot = nil },
	}
end

-------------------------------------------------------------------------------
-- Displays the main GUI frame.
-------------------------------------------------------------------------------
do
	function MainPanel:Display(profession, is_linked)
		if InitializeFrame then
			InitializeFrame()
			InitializeFrame = nil
		end
		self.is_linked = is_linked

		-------------------------------------------------------------------------------
		-- Set the profession.
		-------------------------------------------------------------------------------
		local prev_profession = self.profession

		if profession == private.mining_name then
		 	self.profession = 11 -- Smelting
			self.prof_name = profession
		else
			for index, name in ipairs(ORDERED_PROFESSIONS) do
				if name == profession then
					self.profession = index
					break
				end
			end
			self.prof_name = nil
		end

		if self.profession ~= prev_profession then
			self.prev_profession = self.profession
		end
		self.prof_button:ChangeTexture(private.profession_textures[self.profession])

		local editbox = SearchBox

		if self.profession ~= self.prev_profession then
			editbox.prev_search = nil
		end
		editbox:SetText(editbox.prev_search or _G.SEARCH)

		-- If there is no current tab, this is the first time the panel has been
		-- shown so things must be initialized. In this case, MainPanel.list_frame:Update()
		-- will be called by the tab's OnClick handler.
		if not self.current_tab then
			local current_tab = self.tabs[addon.db.profile.current_tab]
			local on_click = current_tab:GetScript("OnClick")

			on_click(current_tab)

			self.current_tab = addon.db.profile.current_tab
		else
			MainPanel.list_frame:Update(nil, false)
		end
		self.sort_button:SetTextures()
		self.filter_toggle:SetTextures()

		self:UpdateTitle()
		self:Show()
	end

	-------------------------------------------------------------------------------
	-- Restore the panel's position on the screen.
	-------------------------------------------------------------------------------
	local function Reset_Position(self)
		local opts = addon.db.profile.frameopts
		local FixedOffsetX = opts.offsetx

		self:ClearAllPoints()

		if opts.anchorTo == "" then	-- no values yet, clamp to whatever frame is appropriate
			if _G.ATSWFrame then
				self:SetPoint("CENTER", _G.ATSWFrame, "CENTER", 490, 0)
			elseif _G.CauldronFrame then
				self:SetPoint("CENTER", _G.CauldronFrame, "CENTER", 490, 0)
			elseif _G.Skillet then
				self:SetPoint("CENTER", _G.SkilletFrame, "CENTER", 468, 0)
			else
				self:SetPoint("TOPLEFT", _G.TradeSkillFrame, "TOPRIGHT", 10, 0)
			end
		else
			if self.is_expanded then
				if opts.anchorFrom == "TOPLEFT" or opts.anchorFrom == "LEFT" or opts.anchorFrom == "BOTTOMLEFT" then
					FixedOffsetX = opts.offsetx
				elseif opts.anchorFrom == "TOP" or opts.anchorFrom == "CENTER" or opts.anchorFrom == "BOTTOM" then
					FixedOffsetX = opts.offsetx + 151/2
				elseif opts.anchorFrom == "TOPRIGHT" or opts.anchorFrom == "RIGHT" or opts.anchorFrom == "BOTTOMRIGHT" then
					FixedOffsetX = opts.offsetx + 151
				end
			end
			self:SetPoint(opts.anchorFrom, UIParent, opts.anchorTo, FixedOffsetX, opts.offsety)
		end
		self:SetScale(addon.db.profile.frameopts.uiscale)
	end

	MainPanel:SetScript("OnShow", Reset_Position)
end	-- do-block

--------------------------------------------------------------------------------
---- Creates a new frame with the contents of a text dump so you can copy and paste
--- Code borrowed from Antiarc (Chatter) with permission
--- @name AckisRecipeList:DisplayTextDump
--- @param RecipeDB The database (array) which you wish read data from.
--- @param profession Which profession are you displaying data for
--- @param text The text to be dumped
--------------------------------------------------------------------------------
do
	local copy_frame = CreateFrame("Frame", "ARLCopyFrame", UIParent)
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
	copy_frame:SetPoint("CENTER", UIParent, "CENTER")
	copy_frame:SetFrameStrata("DIALOG")

	table.insert(UISpecialFrames, "ARLCopyFrame")

	local scrollArea = CreateFrame("ScrollFrame", "ARLCopyScroll", copy_frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", copy_frame, "TOPLEFT", 8, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -30, 8)

	local edit_box = CreateFrame("EditBox", nil, copy_frame)
	edit_box:SetMultiLine(true)
	edit_box:SetMaxLetters(0)
	edit_box:EnableMouse(true)
	edit_box:SetAutoFocus(true)
	edit_box:SetFontObject(ChatFontNormal)
	edit_box:SetWidth(650)
	edit_box:SetHeight(270)
	edit_box:SetScript("OnEscapePressed",
			   function()
				   copy_frame:Hide()
			   end)
	edit_box:HighlightText(0)

	scrollArea:SetScrollChild(edit_box)

	local close = CreateFrame("Button", nil, copy_frame, "UIPanelCloseButton")
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
