-------------------------------------------------------------------------------
-- Upvalued Lua API.
-------------------------------------------------------------------------------
local _G = getfenv(0)

-- Functions
local ipairs, pairs = _G.ipairs, _G.pairs
local tonumber, tostring = _G.tonumber, _G.tostring
local type = _G.type

-- Libraries
local coroutine = _G.coroutine
local math = _G.math
local table = _G.table

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

-------------------------------------------------------------------------------
-- Constants
-------------------------------------------------------------------------------
local F = private.FILTER_IDS
local A = private.ACQUIRE_TYPE_IDS

local NO_ROLE_FLAG	-- Populated at the end of the file.

-------------------------------------------------------------------------------
-- Functions/methods
-------------------------------------------------------------------------------
function private.LoadAllRecipes()
	local recipe_list = private.recipe_list

	if addon.db.profile.autoloaddb then
		for identifier, name in pairs(private.LOCALIZED_PROFESSION_NAMES) do
			addon:InitializeProfession(name)
		end
	end
	return recipe_list
end

-------------------------------------------------------------------------------
-- Tooltip for data-mining.
-------------------------------------------------------------------------------
local ARLDatamineTT = _G.CreateFrame("GameTooltip", "ARLDatamineTT", _G.UIParent, "GameTooltipTemplate")
do
	-- Tables used in addon:ScanTrainerData
	local scanned_recipes, scanned_items = {}, {}
	local missing_spell_ids, extra_spell_ids, fixed_item_spell_ids = {}, {}, {}
	local mismatched_item_levels, mismatched_recipe_levels = {}, {}
	local itemless_spells = {}

	-- Key is recipe ID, value is crafted item ID. Example: Magnificence of Leather and Magnificence of Scale transform materials to Magnificent Hide.
	-- Both of these are DROPPED. Only the Magnificent Hide skill itself is trained.
	local FALSE_POSITIVE_RECIPE_TO_ITEM_MAP = {
		[140040] = 72163, -- Magnificence of Leather / Magnificent Hide
		[140041] = 72163, -- Magnificence of Scales / Magnificent Hide
	}


	--- Function to compare which recipes are available from a trainer and compare with the internal ARL database.
	-- @name AckisRecipeList:ScanTrainerData
	-- @param autoscan True when autoscan is enabled in preferences, it will inform you when a scan has occured.
	-- @return Does a comparison of the information in your internal ARL database, and those items which are available on the trainer.
	-- Compares the acquire information of the ARL database with what is available on the trainer.
	function addon:ScanTrainerData(autoscan)
		if not _G.UnitExists("target") or _G.UnitIsPlayer("target") or _G.UnitIsEnemy("player", "target") then
			if not autoscan then
				self:Debug(L["DATAMINER_TRAINER_NOTTARGETTED"])
			end
			return
		end

		if not _G.IsTradeskillTrainer() then
			if not autoscan then
				self:Debug(L["DATAMINER_SKILLLEVEL_ERROR"])
			end
			return
		end

		-- Get the initial values for the trainer filters
		local available = _G.GetTrainerServiceTypeFilter("available") and 1 or 0
		local unavailable = _G.GetTrainerServiceTypeFilter("unavailable") and 1 or 0
		local used = _G.GetTrainerServiceTypeFilter("used") and 1 or 0

		-- Clear the trainer filters
		_G.SetTrainerServiceTypeFilter("available", 1)
		_G.SetTrainerServiceTypeFilter("unavailable", 1)
		_G.SetTrainerServiceTypeFilter("used", 1)

		local trainerServicesCount = _G.GetNumTrainerServices()
		if trainerServicesCount == 0 then
			self:Debug("Warning: Trainer is bugged, reporting 0 trainer items.")
			return
		end

		local trainerProfession = private.PROFESSION_NAME_MAP[_G.GetTrainerServiceSkillLine(1)]
		if not trainerProfession then
			return
		end

		addon:InitializeProfession(trainerProfession)

		local recipe_list = private.profession_recipe_list[trainerProfession]
		if not recipe_list then
			self:Debug(L["DATAMINER_NODB_ERROR"])
			return
		end

		table.wipe(scanned_items)
		table.wipe(scanned_recipes)

		ARLDatamineTT:SetOwner(_G.WorldFrame, "ANCHOR_NONE")
		_G.GameTooltip_SetDefaultAnchor(ARLDatamineTT, _G.UIParent)

		for index = 1, trainerServicesCount, 1 do
			ARLDatamineTT:SetTrainerService(index)

			local spellName, spellRank, spellID = ARLDatamineTT:GetSpell()
			local itemID = private.ItemLinkToID(_G.GetTrainerServiceItemLink(index))
			local _, skill_level = _G.GetTrainerServiceSkillReq(index)

			scanned_recipes[spellID] = skill_level

			if itemID then
				scanned_items[itemID] = skill_level
			end
		end
		ARLDatamineTT:Hide()

		table.wipe(missing_spell_ids)
		table.wipe(extra_spell_ids)
		table.wipe(fixed_item_spell_ids)
		table.wipe(mismatched_item_levels)
		table.wipe(mismatched_recipe_levels)

		-- Dump out trainer info
		local trainerID = private.MobGUIDToIDNum(_G.UnitGUID("target"))
		local trainerName = _G.UnitName("target")
		local trainer_entry = private.AcquireTypes.Trainer:GetEntity(trainerID)
		local trainer_x, trainer_y = _G.GetPlayerMapPosition("player")
		trainer_x = ("%.2f"):format(trainer_x * 100)
		trainer_y = ("%.2f"):format(trainer_y * 100)

		local output = private.TextDump
		output:Clear()

		if trainer_entry then
			if trainer_entry.coord_x ~= trainer_x or trainer_entry.coord_y ~= trainer_y then
				output:AddLine(("%s appears to have different coordinates (%s, %s) than those in the database (%s, %s) - a trainer dump for %s will fix this."):format(trainerName, trainer_entry.coord_x, trainer_entry.coord_y, trainer_x, trainer_y, trainerProfession))
				trainer_entry.coord_x = trainer_x
				trainer_entry.coord_y = trainer_y
			end
		else
			output:AddLine(("%s was not found in the trainer list - a trainer dump for %s will fix this. (Dump localization phrases as well.)"):format(trainerName, trainerProfession))
			_G.SetMapToCurrentZone() -- Make sure were are looking at the right zone

			L[trainerName] = trainerName
			addon:AddTrainer(trainerID, trainerName, _G.GetRealZoneText(), trainer_x, trainer_y, private.Player.faction)
		end

		for spellID, recipe in pairs(recipe_list) do
			local trainer_acquire_data = recipe.acquire_data[A.TRAINER]
			local matching_trainer = trainer_acquire_data and trainer_acquire_data[trainerID]
			local scanned_recipe_skill = scanned_recipes[spellID]
			local scanned_item_skill = scanned_items[recipe:CraftedItem()]

			if scanned_recipe_skill or scanned_item_skill then
				if not matching_trainer and trainerProfession == recipe.profession and (not scanned_item_skill or FALSE_POSITIVE_RECIPE_TO_ITEM_MAP[spellID] ~= recipe:CraftedItem()) then
					table.insert(missing_spell_ids, spellID)

					if not L[trainerName] then
						L[trainerName] = true
					end
					recipe:AddTrainer(trainerID)

					if not recipe:HasFilter("common1", "TRAINER") then
						recipe:AddFilters(F.TRAINER)

						if scanned_item_skill then
							output:AddLine(("Added trainer flag to recipe with spell ID %d. (matching crafted item ID %d)"):format(spellID, recipe:CraftedItem()))
						elseif scanned_recipe_skill then
							output:AddLine(("Added trainer flag to recipe with spell ID %d. (matching recipe name \"%s\")"):format(spellID, recipe.name))
						end
					end
				end
				local recipe_skill = recipe:SkillLevels()

				if scanned_item_skill and scanned_item_skill ~= recipe_skill then
					table.insert(mismatched_item_levels, spellID)
				end

				if scanned_recipe_skill and scanned_recipe_skill > 0 and scanned_recipe_skill ~= recipe_skill then
					table.insert(mismatched_recipe_levels, spellID)
				end
			elseif matching_trainer then
				table.wipe(itemless_spells)

				if not recipe:CraftedItem() then
					for item_id in pairs(scanned_items) do
						if recipe.name == _G.GetItemInfo(item_id) then
							recipe:SetCraftedItem(item_id, "BIND_ON_EQUIP")
							itemless_spells[spellID] = true
						end
					end
				end

				if itemless_spells[spellID] then
					table.insert(fixed_item_spell_ids, spellID)
				else
					table.insert(extra_spell_ids, spellID)
				end
			end
		end

		if #missing_spell_ids > 0 then
			output:AddLine("\nTrainer is missing from the following entries:")
			table.sort(missing_spell_ids)

			for index in ipairs(missing_spell_ids) do
				local spell_id = missing_spell_ids[index]
				output:AddLine(("%d (%s)"):format(spell_id, recipe_list[spell_id].name))
			end
		end

		if #extra_spell_ids > 0 then
			output:AddLine("\nRecipes which are wrongly assigned to the trainer:")
			table.sort(extra_spell_ids)

			for index in ipairs(extra_spell_ids) do
				local spell_id = extra_spell_ids[index]
				local recipe = recipe_list[spell_id]
				local crafted_item = recipe:CraftedItem()

				if crafted_item then
					output:AddLine(("    %d (%s) - Crafted item ID set to %d (%s)"):format(spell_id, recipe.name, crafted_item, _G.GetItemInfo(crafted_item) or _G.UNKNOWN))
				else
					output:AddLine(("    %d (%s)"):format(spell_id, recipe.name))
				end
			end
		end

		if #fixed_item_spell_ids > 0 then
			output:AddLine("\nRecipes which had no crafted item ID, but will once a dump is performed:")
			table.sort(fixed_item_spell_ids)

			for index in ipairs(fixed_item_spell_ids) do
				local spell_id = fixed_item_spell_ids[index]
				output:AddLine(("    %d (%s)"):format(spell_id, recipe_list[spell_id].name))
			end
		end

		if #mismatched_item_levels > 0 then
			output:AddLine("\nRecipes with items which had an incorrect skill level, but will not once a dump is performed:")
			table.sort(mismatched_item_levels)

			for index in ipairs(mismatched_item_levels) do
				local spellID = mismatched_item_levels[index]
				local recipe = recipe_list[spellID]
				local recipe_skill = recipe:SkillLevels()
				local corrected_skill = scanned_items[recipe:CraftedItem()]
				output:AddLine(("    %d (%s): Corrected skill level from %d to %d."):format(spellID, recipe.name, recipe_skill, corrected_skill))
				recipe:SetSkillLevels(corrected_skill)
			end
		end

		if #mismatched_recipe_levels > 0 then
			output:AddLine("\nRecipes which had an incorrect skill level, but will not once a dump is performed:")
			table.sort(mismatched_recipe_levels)

			for index in ipairs(mismatched_recipe_levels) do
				local spellID = mismatched_recipe_levels[index]
				local recipe = recipe_list[spellID]
				local recipe_skill = recipe:SkillLevels()
				local corrected_skill = scanned_recipes[spellID]
				output:AddLine(("    %d (%s): Skill set to %d; trainer reports %d."):format(spellID, recipe.name, recipe_skill, scanned_recipes[spellID]))
				recipe:SetSkillLevels(corrected_skill)
			end
		end

		if output:Lines() > 0 then
			output:InsertLine(1, ("ARL Version: %s"):format(self.version))
			output:InsertLine(2, L["DATAMINER_TRAINER_INFO"]:format(trainerName, trainerID))

			if #extra_spell_ids > 0 and trainerProfession == private.LOCALIZED_PROFESSION_NAMES.ENGINEERING then
				output:AddLine("\nSome goggles may be listed as extra. These goggles ONLY show up for the classes who can make them, so they may be false positives.")
			end
			output:Display()
		end

		-- Reset the filters to what they were before
		_G.SetTrainerServiceTypeFilter("available", available or 0)
		_G.SetTrainerServiceTypeFilter("unavailable", unavailable or 0)
		_G.SetTrainerServiceTypeFilter("used", used or 0)
	end
end	-- do

-------------------------------------------------------------------------------
-- Datamining copy frame.
-------------------------------------------------------------------------------
local CopyFrame
do
	local copy_frame = _G.CreateFrame("Frame", "ARL_DatamineCopyFrame", _G.UIParent)
	copy_frame:SetSize(750, 600)
	copy_frame:SetPoint("CENTER", _G.UIParent, "CENTER")
	copy_frame:SetFrameStrata("DIALOG")
	copy_frame:EnableMouse(true)
	copy_frame:SetMovable(true)

	table.insert(_G.UISpecialFrames, "ARL_DatamineCopyFrame")

	copy_frame:SetScript("OnShow", function(self)
		for index = 1, #self.buttons do
			if self.buttons[index]:GetChecked() then
				self.scroll_areas[index]:Show()
			else
				self.scroll_areas[index]:Hide()
			end
		end
	end)

	local function CreateBorder(width, height, left, right, top, bottom)
		local border = copy_frame:CreateTexture(nil, "BORDER")
		border:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-Border]])
		border:SetWidth(width)
		border:SetHeight(height)
		border:SetTexCoord(left, right, top, bottom)

		return border
	end

	local function ExpansionButton_OnClick(self, mouse_button, down)
		copy_frame.current_scroll_area:Hide()
		self.scroll_area:Show()
		copy_frame.current_scroll_area = self.scroll_area
		copy_frame.current_edit_box = self.edit_box

		for index = 1, #copy_frame.buttons do
			copy_frame.buttons[index]:SetChecked(false)
		end

		self:SetChecked(true)
	end

	local title_bg = copy_frame:CreateTexture(nil, "BACKGROUND")
	title_bg:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-Title-Background]])
	title_bg:SetPoint("TOPLEFT", 9, -6)
	title_bg:SetPoint("BOTTOMRIGHT", copy_frame, "TOPRIGHT", -28, -24)

	local dialog_bg = copy_frame:CreateTexture(nil, "BACKGROUND")
	dialog_bg:SetTexture([[Interface\Tooltips\UI-Tooltip-Background]])
	dialog_bg:SetVertexColor(0, 0, 0, 0.75)
	dialog_bg:SetPoint("TOPLEFT", 8, -24)
	dialog_bg:SetPoint("BOTTOMRIGHT", -6, 8)


	local top_left = CreateBorder(64, 64, 0.501953125, 0.625, 0, 1)
	top_left:SetPoint("TOPLEFT")

	local top_right = CreateBorder(64, 64, 0.625, 0.75, 0, 1)
	top_right:SetPoint("TOPRIGHT")

	local top = CreateBorder(0, 64, 0.25, 0.369140625, 0, 1)
	top:SetPoint("TOPLEFT", top_left, "TOPRIGHT", 0, 0)
	top:SetPoint("TOPRIGHT", top_right, "TOPLEFT", 0, 0)

	local bottom_left = CreateBorder(64, 64, 0.751953125, 0.875, 0, 1)
	bottom_left:SetPoint("BOTTOMLEFT")

	local bottom_right = CreateBorder(64, 64, 0.875, 1, 0, 1)
	bottom_right:SetPoint("BOTTOMRIGHT")

	local bottom = CreateBorder(0, 64, 0.37695312, 0.498046875, 0, 1)
	bottom:SetPoint("BOTTOMLEFT", bottom_left, "BOTTOMRIGHT", 0, 0)
	bottom:SetPoint("BOTTOMRIGHT", bottom_right, "BOTTOMLEFT", 0, 0)

	local left = CreateBorder(64, 0, 0.001953125, 0.125, 0, 1)
	left:SetPoint("TOPLEFT", top_left, "BOTTOMLEFT", 0, 0)
	left:SetPoint("BOTTOMLEFT", bottom_left, "TOPLEFT", 0, 0)

	local right = CreateBorder(64, 0, 0.1171875, 0.2421875, 0, 1)
	right:SetPoint("TOPRIGHT", top_right, "BOTTOMRIGHT", 0, 0)
	right:SetPoint("BOTTOMRIGHT", bottom_right, "TOPRIGHT", 0, 0)

	local title = copy_frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	title:SetPoint("TOPLEFT", 12, -8)
	title:SetPoint("TOPRIGHT", -32, -8)
	title:SetText(private.addon_name)

	copy_frame.title = title

	local drag_frame = _G.CreateFrame("Frame", nil, copy_frame)
	drag_frame:SetPoint("TOPLEFT", title)
	drag_frame:SetPoint("BOTTOMRIGHT", title)
	drag_frame:EnableMouse(true)

	drag_frame:SetScript("OnMouseDown", function(self, button)
		copy_frame:StartMoving()
	end)

	drag_frame:SetScript("OnMouseUp", function(self, button)
		copy_frame:StopMovingOrSizing()
	end)

	local close_button = _G.CreateFrame("Button", nil, copy_frame, "UIPanelCloseButton")
	close_button:SetSize(32, 32)
	close_button:SetPoint("TOPRIGHT", 2, 1)

	local footer_frame = _G.CreateFrame("Frame", "MUFASA", copy_frame, "InsetFrameTemplate")
	footer_frame:SetHeight(23)
	footer_frame:SetPoint("BOTTOMLEFT", copy_frame, "BOTTOMLEFT", 8, 8)
	footer_frame:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -5, 8)

	local footer = footer_frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	footer:SetPoint("CENTER", footer_frame, "CENTER", 0, 0)

	copy_frame.edit_boxes = {}
	copy_frame.scroll_areas = {}
	copy_frame.buttons = {}
	copy_frame.output = {}

	for index = 1, #private.GAME_VERSION_NAMES do
		local scroll_area = _G.CreateFrame("ScrollFrame", "ARL_DatamineCopyScroll" .. index, copy_frame, "UIPanelScrollFrameTemplate")
		scroll_area:SetPoint("TOPLEFT", copy_frame, "TOPLEFT", 10, -28)
		scroll_area:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -28, 31)

		scroll_area:SetScript("OnMouseWheel", function(self, delta)
			_G.ScrollFrameTemplate_OnMouseWheel(self, delta, self.ScrollBar)
		end)

		scroll_area.ScrollBar:SetScript("OnMouseWheel", function(self, delta)
			_G.ScrollFrameTemplate_OnMouseWheel(self, delta, self)
		end)

		copy_frame.scroll_areas[index] = scroll_area

		local edit_box = _G.CreateFrame("EditBox", nil, copy_frame)
		edit_box:SetMultiLine(true)
		edit_box:SetMaxLetters(0)
		edit_box:EnableMouse(true)
		edit_box:SetAutoFocus(false)
		edit_box:SetFontObject("ChatFontNormal")
		edit_box:SetSize(650, 270)

		edit_box:SetScript("OnEscapePressed", function()
			copy_frame:Hide()
		end)

		edit_box.copy_frame = copy_frame
		scroll_area:SetScrollChild(edit_box)
		copy_frame.edit_boxes[index] = edit_box

		local button_width = 121
		local button_height = 55
		local button = _G.CreateFrame("CheckButton", "ARL_DatamineCopyExpansionButton" .. index, footer_frame)
		button:SetSize(button_width, button_height)
		button:SetMotionScriptsWhileDisabled(true)

		button.index = index
		button.edit_box = edit_box
		button.scroll_area = scroll_area

		copy_frame.buttons[index] = button

		-- The button must be unchecked for ToggleFilterMenu() to work correctly.
		button:SetScript("OnClick", ExpansionButton_OnClick)

		local bg_texture = button:CreateTexture(nil, "BACKGROUND")
		button.bg_texture = bg_texture
		bg_texture:SetTexture("Interface/SpellBook/UI-Spellbook-SpellBackground")
		bg_texture:SetWidth(button_width + 4)
		bg_texture:SetHeight(button_height + 6)
		bg_texture:SetTexCoord(0, (43/64), 0, (43/64))
		bg_texture:SetPoint("CENTER", button, "CENTER", 0, 0)

		local icon_texture = button:CreateTexture(nil, "BORDER")
		button.icon_texture = icon_texture
		icon_texture:SetTexture(private.EXPANSION_LOGO_TEXTURES[index])
		icon_texture:SetAllPoints(button)

		local pushed_texture = button:CreateTexture(nil, "ARTWORK")
		pushed_texture:SetTexture("Interface/Buttons/UI-Quickslot-Depress")
		pushed_texture:SetAllPoints(button)
		button:SetPushedTexture(pushed_texture)

		local highlight_texture = button:CreateTexture()
		highlight_texture:SetTexture("Interface/Buttons/ButtonHilight-Square")
		highlight_texture:SetAllPoints(button)
		highlight_texture:SetBlendMode("ADD")
		button:SetHighlightTexture(highlight_texture)

		local checked_texture = button:CreateTexture()
		checked_texture:SetTexture("Interface/Buttons/CheckButtonHilight")
		checked_texture:SetAllPoints(button)
		checked_texture:SetBlendMode("ADD")
		button:SetCheckedTexture(checked_texture)

		if index == 1 then
			button:SetPoint("TOPRIGHT", copy_frame, "TOPLEFT", 5, -7)
			button:SetChecked(true)
			copy_frame.current_edit_box = edit_box
			copy_frame.current_scroll_area = scroll_area
		else
			button:SetPoint("TOP", copy_frame.buttons[index - 1], "BOTTOM", 0, -7)
		end
	end

	local highlight_button = _G.CreateFrame("Button", nil, copy_frame)
	highlight_button:SetSize(16, 16)
	highlight_button:SetPoint("BOTTOMRIGHT", -10, 10)

	highlight_button:SetScript("OnMouseUp", function(self, button)
		self.texture:ClearAllPoints()
		self.texture:SetAllPoints(self)

		copy_frame.current_edit_box:HighlightText(0)
		copy_frame.current_edit_box:SetFocus()
	end)

	highlight_button:SetScript("OnMouseDown", function(self, button)
		self.texture:ClearAllPoints()
		self.texture:SetPoint("RIGHT", self, "RIGHT", 1, -1)
	end)

	highlight_button:SetScript("OnEnter", function(self)
		self.texture:SetVertexColor(0.75, 0.75, 0.75)
	end)

	highlight_button:SetScript("OnLeave", function(self)
		self.texture:SetVertexColor(1, 1, 1)
	end)

	local highlight_icon = highlight_button:CreateTexture()
	highlight_icon:SetAllPoints()
	highlight_icon:SetTexture([[Interface\BUTTONS\UI-GuildButton-PublicNote-Up]])
	highlight_button.texture = highlight_icon

	copy_frame:Hide()

	CopyFrame = {
		output = {}
	}

	for index = 1, #private.GAME_VERSION_NAMES do
		CopyFrame.output[index] = {}
	end

	function CopyFrame:AddLine(text, index)
		self:InsertLine(index, #self.output[index] + 1, text)
	end

	function CopyFrame:Clear()
		for index = 1, #self.output do
			table.wipe(self.output[index])
		end
	end

	function CopyFrame:Display(separator)
		for index = 1, #self.output do
			local display_text = table.concat(self.output[index], separator or "\n")

			copy_frame.edit_boxes[index]:SetText(display_text)
			copy_frame.edit_boxes[index]:SetCursorPosition(0)
			coroutine.yield()
		end
		copy_frame:Show()
	end

	function CopyFrame:InsertLine(index, position, text)
		if _G.type(text) ~= "string" or text == "" then
			return
		end
		table.insert(self.output[index], position, text)
	end

	function CopyFrame:Lines(index)
		return #self.output[index]
	end

	function CopyFrame:String(separator, index)
		return table.concat(self.output[index], separator or "\n")
	end

	function addon:CF()
		copy_frame[copy_frame:IsShown() and "Hide" or "Show"](copy_frame)
	end
end -- do-block

-------------------------------------------------------------------------------
-- Recipe/Profession scanning and dumping routines.
-------------------------------------------------------------------------------
do
	local ORDERED_PROFESSIONS = private.ORDERED_PROFESSIONS

	local intermediary_recipe_list = {}
	local progress_bar

	local PROGRESSBAR_TEXTURES = {
		[[Interface\BlackMarket\BlackMarketBackground-BottomShadow]],
		[[Interface\BUTTONS\GreyScaleRamp64]],
		[[Interface\OPTIONSFRAME\21STEPGRAYSCALE]],
		[[Interface\RAIDFRAME\Raid-Bar-Hp-Fill]],
		[[Interface\Scenarios\Objective-Sheen]],
		[[Interface\TARGETINGFRAME\BarFill2]],
		[[Interface\UnitPowerBarAlt\Generic1_Horizontal_Fill]],
		[[Interface\UnitPowerBarAlt\Generic1_Pill_Fill]],
	}

	local function ProgressBar()
		if not progress_bar then
			progress_bar = _G.CreateFrame("Frame", "ARL_DatamineProgressBar", _G.UIParent)
			progress_bar:SetSize(450, 30)
			progress_bar:SetPoint("CENTER", 0, -250)
			progress_bar:SetFrameStrata("DIALOG")
			progress_bar:SetClampedToScreen(true)
			progress_bar:EnableMouse()
			progress_bar:SetMovable(true)

			progress_bar:SetBackdrop({
				bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
				edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
				tile = true,
				tileSize = 16,
				edgeSize = 16,
				insets = {
					left = 4,
					right = 4,
					top = 4,
					bottom = 4
				}
			})
			progress_bar:SetBackdropColor(0, 0, 0, 1)

			progress_bar.fg = progress_bar:CreateTexture()
			progress_bar.fg:SetPoint("LEFT", progress_bar, "LEFT", 5, 0)
			progress_bar.fg:SetSize(300, 20)

			progress_bar.left_text = progress_bar:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
			progress_bar.left_text:SetPoint("LEFT", 10, 0)

			progress_bar.right_text = progress_bar:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
			progress_bar.right_text:SetPoint("RIGHT", -10, 0)

			progress_bar:SetScript("OnMouseDown", progress_bar.StartMoving)
			progress_bar:SetScript("OnMouseUp", progress_bar.StopMovingOrSizing)

			local function PercentColorGradient(min, max)
				local red_low, green_low, blue_low = 1, 0.10, 0.10
				local red_mid, green_mid, blue_mid = 1, 1, 0
				local red_high, green_high, blue_high = 0.25, 0.75, 0.25
				local percentage = min / max

				if percentage >= 1 then
					return red_high, green_high, blue_high
				elseif percentage <= 0 then
					return red_low, green_low, blue_low
				end
				local integral, fractional = math.modf(percentage * 2)

				if integral == 1 then
					red_low, green_low, blue_low, red_mid, green_mid, blue_mid = red_mid, green_mid, blue_mid, red_high, green_high, blue_high
				end
				return red_low + (red_mid - red_low) * fractional, green_low + (green_mid - green_low) * fractional, blue_low + (blue_mid - blue_low) * fractional
			end

			function progress_bar:Update(current, max, spell_id)
				local percentage = math.floor(current / max * 100)

				progress_bar.fg:SetVertexColor(PercentColorGradient(current, max), 0.5)
				progress_bar.fg:SetWidth(4.4 * percentage)
				progress_bar.left_text:SetFormattedText("%s (%d)", private.recipe_list[spell_id].name, spell_id)
				progress_bar.right_text:SetFormattedText("%d/%d (%d%%)", current, max, percentage)
			end
		end
		progress_bar.fg:SetTexture(PROGRESSBAR_TEXTURES[math.random(1, #PROGRESSBAR_TEXTURES)])
		progress_bar.fg:SetWidth(0)
		return progress_bar
	end

	local ScannerUpdateFrame = _G.CreateFrame("Frame")

	function ScannerUpdateFrame:Cleanup()
		self:SetScript("OnUpdate", nil)
		self.is_running = nil
		self.profession = nil
		self.scanner = nil
	end

	function ScannerUpdateFrame:OnUpdate(elapsed)
		local is_finished = coroutine.resume(self.scanner)

		if is_finished then
			if coroutine.status(self.scanner) == "dead" then
				self:Cleanup()
			end
		else
			self:Cleanup()
		end
	end

	local function Sort_AscID(a, b)
		local reca, recb = private.recipe_list[a], private.recipe_list[b]

		return reca:SpellID()< recb:SpellID()
	end

	local function SortRecipesByID()
		local sorted_recipes = addon.sorted_recipes
		table.wipe(sorted_recipes)

		for spell_id in pairs(intermediary_recipe_list) do
			table.insert(sorted_recipes, spell_id)
		end
		table.sort(sorted_recipes, Sort_AscID)
	end

	-------------------------------------------------------------------------------
	--- Scans the items in the specified profession
	-------------------------------------------------------------------------------
	local function CoroutineProfessionScan(profession_name)
		ScannerUpdateFrame.profession = profession_name
		table.wipe(intermediary_recipe_list)

		local profession_recipe_list = private.profession_recipe_list[profession_name]

		for spell_id in pairs(profession_recipe_list) do
			intermediary_recipe_list[spell_id] = profession_recipe_list[spell_id]
		end
		local output = private.TextDump
		output:Clear()

		SortRecipesByID()

		local num_recipes = #addon.sorted_recipes
		local progress_bar = ProgressBar()
		progress_bar:Show()

		for index, spell_id in ipairs(addon.sorted_recipes) do
			progress_bar:Update(index, num_recipes, spell_id)
			addon:ScanTooltipRecipe(spell_id, false, true)
			coroutine.yield()
		end

		if output:Lines() == 0 then
			addon:Debug("ProfessionScan(): output is empty.")
		end
		progress_bar:Hide()
		output:Display()
		ARLDatamineTT:Hide()
	end

	local function ProfessionScan(profession_name)
		if ScannerUpdateFrame.is_running then
			return
		end
		ScannerUpdateFrame.scanner = coroutine.create(CoroutineProfessionScan)
		ScannerUpdateFrame:SetScript("OnUpdate", ScannerUpdateFrame.OnUpdate)
		ScannerUpdateFrame.is_running = true

		local status = coroutine.resume(ScannerUpdateFrame.scanner, profession_name)
		if not status then
			ScannerUpdateFrame:Cleanup()
		end
	end

	local function ScheduleProfessionScan(profession_name)
		if ScannerUpdateFrame.profession then
			addon:Debug("Already scanning %s - wait until finished.", ScannerUpdateFrame.profession)
			return
		end

		if addon:InitializeProfession(profession_name) then
			addon:ScheduleTimer(ProfessionScan, 2, profession_name)
			addon:Debug("%s had to be loaded - starting scan in 2 seconds to ensure everything is in the cache.", profession_name)
		else
			ProfessionScan(profession_name)
		end
	end

	--- Parses all recipes for a specified profession, scanning their tool tips.
	-- @name AckisRecipeList:ScanProfession
	-- @usage AckisRecipeList:ScanProfession("first aid")
	-- @param prof_name The profession name or the spell ID of it, which you wish to scan.
	-- @return Recipes in the given profession have their tooltips scanned.
	function addon:ScanProfession(input_text)
		if type(input_text) == "number" then
			input_text = _G.GetSpellInfo(input_text)
		end
		input_text = input_text:lower()

		if input_text == "all" then
			for index, profession_name in ipairs(ORDERED_PROFESSIONS) do
				ScheduleProfessionScan(profession_name)
			end
			return
		end

		for index, profession_name in ipairs(ORDERED_PROFESSIONS) do
			if input_text == profession_name:lower() then
				ScheduleProfessionScan(profession_name)
				return
			end
		end
		self:Debug(L["DATAMINER_NODB_ERROR"])
	end

	local function RecipeDump(id, output, use_genesis)
		local recipe = private.recipe_list[id or 1]

		if not recipe then
			addon:Debug("Invalid recipe ID: %s", id or "nil")
			return
		end
		recipe:Dump(output, use_genesis)
	end

	-------------------------------------------------------------------------------
	--- Dumps the items in the specified profession
	-------------------------------------------------------------------------------
	local function CoroutineProfessionDump(profession_name)
		addon:InitializeProfession(profession_name)
		table.wipe(intermediary_recipe_list)

		local profession_recipe_list = private.profession_recipe_list[profession_name]

		for spell_id in pairs(profession_recipe_list) do
			intermediary_recipe_list[spell_id] = profession_recipe_list[spell_id]
		end
		local output = CopyFrame
		output:Clear()

		SortRecipesByID()

		local num_recipes = #addon.sorted_recipes
		local progress_bar = ProgressBar()
		progress_bar:Show()

		for index, spell_id in ipairs(addon.sorted_recipes) do
			progress_bar:Update(index, num_recipes, spell_id)
			RecipeDump(spell_id, output, true)
			coroutine.yield()
		end
		progress_bar:Hide()
		output:Display()
	end

	local function ProfessionDump(profession_name)
		if ScannerUpdateFrame.is_running then
			return
		end
		ScannerUpdateFrame.scanner = coroutine.create(CoroutineProfessionDump)
		ScannerUpdateFrame:SetScript("OnUpdate", ScannerUpdateFrame.OnUpdate)
		ScannerUpdateFrame.is_running = true

		local status = coroutine.resume(ScannerUpdateFrame.scanner, profession_name)
		if not status then
			ScannerUpdateFrame:Cleanup()
		end
	end

	function addon:DumpRecipe(id_num)
		local output = private.TextDump
		output:Clear()
		RecipeDump(id_num, output, false)
		output:Display()
	end

	function addon:DumpProfession(input_text)
		if ScannerUpdateFrame.profession then
			addon:Debug("Already dumping %s - wait until finished.", ScannerUpdateFrame.profession)
			return
		end

		if type(input_text) == "number" then
			input_text = _G.GetSpellInfo(input_text)
		end
		input_text = input_text:lower()

		if input_text == "all" then
			for index, profession_name in ipairs(ORDERED_PROFESSIONS) do
				ProfessionDump(profession_name)
			end
		end

		for index, profession_name in ipairs(ORDERED_PROFESSIONS) do
			if input_text == profession_name:lower() then
				ProfessionDump(profession_name)
				return
			end
		end
		self:Debug(L["DATAMINER_NODB_ERROR"])
	end

	-------------------------------------------------------------------------------
	--- Dumps the trainers for the specified recipe/profession
	-------------------------------------------------------------------------------
	local source_registry = {}
	local sorted_data = {}

	local function ProfessionTrainerDump(profession_name)
		addon:InitializeProfession(profession_name)
		table.wipe(intermediary_recipe_list)

		local profession_recipe_list = private.profession_recipe_list[profession_name]

		for spell_id in pairs(profession_recipe_list) do
			intermediary_recipe_list[spell_id] = profession_recipe_list[spell_id]
		end
		SortRecipesByID()

		table.wipe(source_registry)
		table.wipe(sorted_data)

		for index, spell_id in ipairs(addon.sorted_recipes) do
			private.recipe_list[spell_id]:DumpTrainers(source_registry)
		end

		for identifier in pairs(source_registry) do
			table.insert(sorted_data, identifier)
		end
		local output = private.TextDump
		output:Clear()

		table.sort(sorted_data)

		for index, identifier in ipairs(sorted_data) do
			local trainer = private.AcquireTypes.Trainer:GetEntity(identifier)

			if trainer then
				if trainer.spell_id then
					output:AddLine(
						("self:AddTrainer(%s, %s, Z.%s, %s, %s, \"%s\")"):format(
							identifier,
							trainer.spell_id,
							private.ZONE_LABELS_FROM_NAME[trainer.location],
							trainer.coord_x,
							trainer.coord_y,
							trainer.faction
						)
					)
				else
					output:AddLine(
						("self:AddTrainer(%s, \"%s\", Z.%s, %s, %s, \"%s\")"):format(
							identifier,
							trainer.name:gsub("\"", "\\\""),
							private.ZONE_LABELS_FROM_NAME[trainer.location],
							trainer.coord_x,
							trainer.coord_y,
							trainer.faction
						)
					)
				end
			end
		end
		output:Display()
	end

	function addon:DumpTrainers(input_text)
		if type(input_text) == "number" then
			input_text = _G.GetSpellInfo(input_text)
		end
		input_text = input_text:lower()

		if input_text == "all" then
			for index, profession_name in ipairs(ORDERED_PROFESSIONS) do
				ProfessionTrainerDump(profession_name)
			end
		end

		for index, profession_name in ipairs(ORDERED_PROFESSIONS) do
			if input_text == profession_name:lower() then
				ProfessionTrainerDump(profession_name)
				return
			end
		end
		self:Debug(L["DATAMINER_NODB_ERROR"])
	end
end	-- do

local RECIPE_TYPES = {
	-- JC
	["design: "] = true,
	-- LW or Tailoring
	["pattern: "] = true,
	-- Alchemy or Cooking
	["recipe: "] = true,
	-- BS
	["plans: "] = true,
	-- Enchanting
	["formula: "] = true,
	-- Engineering
	["schematic: "] = true,
	-- First Aid
	["manual: "] = true,
	-- Inscription
	["technique: "] = true,

	["alchemy: "] = true,
	["blacksmithing: "] = true,
	["cooking: "] = true,
	["enchanting: "] = true,
	["engineering: "] = true,
	["first aid: "] = true,
	["inscription: "] = true,
	["jewelcrafting: "] = true,
	["leatherworking: "] = true,
	["tailoring: "] = true,
}

--- Scans the items on a vendor, determining which recipes are available if any and compares it with the database entries
-- @name AckisRecipeList:ScanVendor
-- @usage AckisRecipeList:ScanVendor()
-- @return Obtains all the vendor information on tradeskill recipes and attempts to compare the current vendor with the internal database
do
	local output = private.TextDump
	local RECIPE_ITEM_TO_SPELL_MAP

	local function NormalizeVendorData(spell_id, supply, vendor_id, vendor_name)
		local recipe = private.recipe_list[spell_id]
		local acquire_data = recipe and recipe.acquire_data
		local vendor_data = acquire_data and acquire_data[A.VENDOR]
		local rep_data = acquire_data and acquire_data[A.REPUTATION]
		local matching_vendor = false

		if vendor_data then
			for id_num in pairs(vendor_data) do
				if id_num == vendor_id then
					matching_vendor = true
					break
				end
			end
		elseif rep_data then
			for id_num, info in pairs(rep_data) do
				if matching_vendor then
					break
				end

				for rep_level, level_info in pairs(info) do
					for rep_vendor_id in pairs(level_info) do
						if rep_vendor_id == vendor_id then
							matching_vendor = true
						end
					end
				end
			end
		end
		local vendor_acquire_type = private.AcquireTypes.Vendor
		local vendor_entry = vendor_acquire_type:GetEntity(vendor_id)
		local vendor_x, vendor_y = _G.GetPlayerMapPosition("player")
		vendor_x = ("%.2f"):format(vendor_x * 100)
		vendor_y = ("%.2f"):format(vendor_y * 100)

		if vendor_entry then
			if vendor_entry.coord_x ~= vendor_x or vendor_entry.coord_y ~= vendor_y then
				output:AddLine(("%s appears to have different coordinates (%s, %s) than those in the database (%s, %s)."):format(vendor_name, vendor_entry.coord_x, vendor_entry.coord_y, vendor_x, vendor_y))
				vendor_entry.coord_x = vendor_x
				vendor_entry.coord_y = vendor_y
			end
		else
			output:AddLine(("%s was not found in the vendor list"):format(vendor_name))

			if not L[vendor_name] then
				L[vendor_name] = true
			end
			_G.SetMapToCurrentZone() -- Make sure were are looking at the right zone

			vendor_acquire_type:AddEntity(addon, {
				coord_x = vendor_x,
				coord_y = vendor_y,
				faction = _G.UnitFactionGroup("target") or "Neutral",
				identifier = vendor_id,
				location = _G.GetRealZoneText(),
				name = L[vendor_name],
			})
		end

		if matching_vendor and vendor_entry and vendor_entry.item_list then
			local reported_supply = vendor_entry.item_list[spell_id]

			if reported_supply == true and supply > -1 then
				recipe:AddLimitedVendor(vendor_id, supply)
				output:AddLine(("Limited quantity for \"%s\" (%d) found on vendor %d - listed as unlimited quantity."):format(recipe.name, spell_id, vendor_id))
			elseif type(reported_supply) ~= "boolean" and supply == -1 then
				recipe:AddVendor(vendor_id)
				output:AddLine(("Unlimited quantity for \"%s\" (%d) found on vendor %d - listed as limited quantity."):format(recipe.name, spell_id, vendor_id))
			end

			if not recipe:HasFilter("common1", "VENDOR") and not recipe:HasFilter("common1", "WORLD_EVENTS") then
				recipe:AddFilters(F.VENDOR)
				output:AddLine(("%d: Vendor flag was not set."):format(spell_id))
			end
		elseif not matching_vendor then
			if supply > -1 then
				recipe:AddLimitedVendor(vendor_id, supply)
			else
				recipe:AddVendor(vendor_id)
			end

			if not recipe:HasFilter("common1", "VENDOR") and not recipe:HasFilter("common1", "WORLD_EVENTS") then
				recipe:AddFilters(F.VENDOR)
				output:AddLine(("%d: Vendor flag was not set."):format(spell_id))
			end
			output:AddLine(("Vendor ID missing from \"%s\" %d."):format(recipe and recipe.name or _G.UNKNOWN, spell_id))
		end
	end

	function addon:ScanVendor()
		if not _G.UnitExists("target") or _G.UnitIsPlayer("target") or _G.UnitIsEnemy("player", "target") then
			self:Debug(L["DATAMINER_VENDOR_NOTTARGETTED"])
			return
		end
		local recipe_list = private.LoadAllRecipes()		-- Get internal database

		if not recipe_list then
			self:Debug(L["DATAMINER_NODB_ERROR"])
			return
		end
		local vendor_name = _G.UnitName("target")
		local vendor_id = private.MobGUIDToIDNum(_G.UnitGUID("target"))

		if not RECIPE_ITEM_TO_SPELL_MAP then
			RECIPE_ITEM_TO_SPELL_MAP = {}

			for spell_id, recipe in pairs(private.recipe_list) do
				local recipe_item_id = recipe:RecipeItem()

				if recipe_item_id then
					RECIPE_ITEM_TO_SPELL_MAP[recipe_item_id] = spell_id
				end
			end
		end
		output:Clear()

		for index = 1, _G.GetMerchantNumItems(), 1 do
			local item_name, _, _, _, supply = _G.GetMerchantItemInfo(index)

			if item_name then
				local match_text = item_name:match("%a+: ")

				if match_text and RECIPE_TYPES[match_text:lower()] then
					local item_id = private.ItemLinkToID(_G.GetMerchantItemLink(index))
					local spell_id = RECIPE_ITEM_TO_SPELL_MAP[item_id]

					if spell_id then
						addon:ScanTooltipRecipe(spell_id, true, true)
						NormalizeVendorData(spell_id, supply, vendor_id, vendor_name)
					else
						for spell_id, recipe in pairs(private.recipe_list) do
							local recipe_type, match_text = (":"):split(item_name, 2)

							if recipe.name == match_text:trim() then
								recipe:SetRecipeItem(item_id, "BIND_ON_EQUIP")
								RECIPE_ITEM_TO_SPELL_MAP[item_id] = spell_id
								NormalizeVendorData(spell_id, supply, vendor_id, vendor_name)
							end
						end
						--@debug@
						output:AddLine(("Spell ID not found for recipe item %d (%s)"):format(item_id, item_name))
						--@end-debug@
					end
				end
			end
		end

		if output:Lines() > 0 then
			output:InsertLine(1, ("ARL Version: %s"):format(self.version))
			output:InsertLine(2, L["DATAMINER_VENDOR_INFO"]:format(vendor_name, vendor_id))
			output:Display()
		end
		ARLDatamineTT:Hide()
	end
end	-- do

--- Parses all the recipes in the database, and scanning their tooltips.
-- @name AckisRecipeList:TooltipScanDatabase
-- @usage AckisRecipeList:TooltipScanDatabase()
-- @return Entire recipe database has its tooltips scanned.
function addon:TooltipScanDatabase()
	local recipe_list = private.LoadAllRecipes()

	if not recipe_list then
		self:Debug(L["DATAMINER_NODB_ERROR"])
		return
	end
	local output = private.TextDump
	output:Clear()

	for i in pairs(recipe_list) do
		addon:ScanTooltipRecipe(i, false, true)
	end
	output:Display()
end

-- Table to store scanned information. Wiped and re-used every scan.
local scan_data = {}

do
	---------------------------------------------------------------------------------------------------------
	----This table, DO_NOT_SCAN, contains itemid's that will not cache on the servers
	---------------------------------------------------------------------------------------------------------

	local DO_NOT_SCAN = {
		-------------------------------------------------------------------------------
		--Leatherworking
		-------------------------------------------------------------------------------
		[35214]	=	true,	[32434]	=	true,	[15769]	=	true,	[32431]	=	true,	[32432]	=	true,
		[35215]	=	true,	[35521]	=	true,	[35520]	=	true,	[35524]	=	true,	[35517]	=	true,
		[35528]	=	true,	[35527]	=	true,	[35523]	=	true,	[35549]	=	true,	[35218]	=	true,
		[35217]	=	true,	[35216]	=	true,	[35546]	=	true,	[35541]	=	true,	[15756]	=	true,
		[15777]	=	true,	[32433]	=	true,	[29729]	=	true,	[29732]	=	true,	[32744]	=	true,
		[15773]	=	true,	[30301]	=	true,	[15745]	=	true,	[35302]	=	true,	[15774]	=	true,

		-------------------------------------------------------------------------------
		--Tailoring
		-------------------------------------------------------------------------------
		[14477]	=	true,	[14485]	=	true,	[30281]	=	true,	[14478]	=	true,	[14500]	=	true,
		[32439]	=	true,	[14479]	=	true,	[32447]	=	true,	[14480]	=	true,	[32437]	=	true,
		[14495]	=	true,	[14505]	=	true,	[35204]	=	true,	[35205]	=	true,	[35206]	=	true,
		[14473]	=	true,	[14488]	=	true,	[14481]	=	true,	[35309]	=	true,	[30280]	=	true,
		[14492]	=	true,	[14491]	=	true,

		-------------------------------------------------------------------------------
		--Jewelcrafting
		-------------------------------------------------------------------------------
		[23130]	=	true,	[23140]	=	true,	[23137]	=	true,	[23131]	=	true,	[23148]	=	true,
		[35538]	=	true,	[35201]	=	true,	[35533]	=	true,	[35200]	=	true,	[23147]	=	true,
		[23135]	=	true,	[35203]	=	true,	[35198]	=	true,	[23152]	=	true,	[23151]	=	true,
		[23141]	=	true,	[28596]	=	true,	[28291]	=	true,	[23153]	=	true,

		-------------------------------------------------------------------------------
		--Alchemy
		-------------------------------------------------------------------------------
		[22925]	=	true,	[13480]	=	true,	[13481]	=	true,	[13493]	=	true,	[35295]	=	true,
		[44568]	=	true,

		-------------------------------------------------------------------------------
		--Cooking
		-------------------------------------------------------------------------------
		[39644]	=	true,

		-------------------------------------------------------------------------------
		--Blacksmithing
		-------------------------------------------------------------------------------
		[32441]	=	true,	[32443]	=	true,	[12687]	=	true,	[12714]	=	true,	[12688]	=	true,
		[35211]	=	true,	[35209]	=	true,	[35210]	=	true,	[12706]	=	true,	[7982]	=	true,
		[12718]	=	true,	[23621]	=	true,	[35208]	=	true,	[12716]	=	true,	[23632]	=	true,
		[23633]	=	true,	[30324]	=	true,	[23637]	=	true,	[31393]	=	true,	[22221]	=	true,
		[12690]	=	true,	[31394]	=	true,	[31395]	=	true,	[23630]	=	true,	[23629]	=	true,
		[7978]	=	true,	[41120]	=	true,	[12717]	=	true,	[22219]	=	true,	[23627]	=	true,

		-------------------------------------------------------------------------------
		--Engineering
		-------------------------------------------------------------------------------
		[35196]	=	true,	[21734]	=	true,	[18292]	=	true,	[21727]	=	true,	[21735]	=	true,
		[16053]	=	true,	[21729]	=	true,	[16047]	=	true,	[21730]	=	true,	[21731]	=	true,
		[21732]	=	true,	[4411]	=	true,	[21733]	=	true,	[21728]	=	true,	[35186]	=	true,
		[18655]	=	true,

		-------------------------------------------------------------------------------
		--Enchanting
		-------------------------------------------------------------------------------
		[16222]	=	true,	[20734]	=	true,	[20729]	=	true,	[20731]	=	true,	[16246]	=	true,
	}

	local output = private.TextDump

-------------------------------------------------------------------------------
-- Tooltip-scanning code
-------------------------------------------------------------------------------
	local SPECIALTY_TEXT = {
		["requires gnomish engineer"] = 20219,
		["requires goblin engineer"] = 20222,
	}

	local FACTION_TEXT = {
		["thorium brotherhood"] = 98,
		["zandalar tribe"] = 100,
		["argent dawn"] = 96,
		["timbermaw hold"] = 99,
		["cenarion circle"] = 97,
		["the aldor"] = 101,
		["the consortium"] = 105,
		["the scryers"] = 110,
		["the sha'tar"] = 111,
		["the mag'har"] = 108,
		["cenarion expedition"] = 103,
		["honor hold"] = 104,
		["thrallmar"] = 104,
		["the violet eye"] = 114,
		["sporeggar"] = 113,
		["kurenai"] = 108,
		["keepers of time"] = 106,
		["the scale of the sands"] = 109,
		["lower city"] = 107,
		["ashtongue deathsworn"] = 102,
		["alliance vanguard"] = 131,
		["valiance expedition"] = 126,
		["horde expedition"] = 130,
		["the taunka"] = 128,
		["the hand of vengeance"] = 127,
		["explorers' league"] = 125,
		["the kalu'ak"] = 120,
		["shattered sun offensive"] = 112,
		["warsong offensive"] = 129,
		["kirin tor"] = 118,
		["the wyrmrest accord"] = 122,
		["knights of the ebon blade"] = 117,
		["frenzyheart tribe"] = 116,
		["the oracles"] = 121,
		["argent crusade"] = 115,
		["the sons of hodir"] = 119,
	}

	local FACTION_LEVELS = {
		neutral = 0,
		friendly = 1,
		honored = 2,
		revered = 3,
		exalted = 4,
	}

	local CLASS_TYPES = {
		["Death Knight"] = "DK",
		["Druid"] = "DRUID",
		["Hunter"] = "HUNTER",
		["Mage"] = "MAGE",
		["Paladin"] = "PALADIN",
		["Priest"] = "PRIEST",
		["Shaman"] = "SHAMAN",
		["Rogue"] = "ROGUE",
		["Warlock"] = "WARLOCK",
		["Warrior"] = "WARRIOR",
		["Monk"] = "MONK",
	}

	local ORDERED_CLASS_TYPES = {
		"Death Knight",
		"Druid",
		"Hunter",
		"Mage",
		"Paladin",
		"Priest",
		"Shaman",
		"Rogue",
		"Warlock",
		"Warrior",
		"Monk",
	}


	local ROLE_FILTERS = {
		dps = F.DPS,
		tank = F.TANK,
		healer = F.HEALER,
		caster = F.CASTER
	}

	local ROLE_TYPES = {
		dps = "DPS",
		tank = "TANK",
		healer = "HEALER",
		caster = "CASTER",
	}


	local ORDERED_ROLE_TYPES = {
		"dps",
		"tank",
		"healer",
		"caster",
	}


	local ROLE_STAT_MATCHES = {
		["agility"] = {
			"dps",
		},
		["armor"] = {
			"tank",
		},
		["attack power"] = {
			"dps",
		},
		["block rating"] = {
			"tank",
		},
		["critical strike"] = {
			"caster",
			"dps",
			"healer",
		},
		["critical strike rating"] = {
			"caster",
			"dps",
			"healer",
		},
		["dodge"] = {
			"tank",
		},
		["dodge rating"] = {
			"tank",
		},
		["expertise"] = {
			"dps",
			"tank",
		},
		["expertise rating"] = {
			"dps",
			"tank",
		},
		["haste"] = {
			"caster",
			"dps",
			"healer",
		},
		["haste rating"] = {
			"caster",
			"dps",
			"healer",
		},
		["hit"] = {
			"caster",
			"dps",
		},
		["hit rating"] = {
			"caster",
			"dps",
		},
		["intellect"] = {
			"caster",
			"healer",
		},
		["mana"] = {
			"caster",
			"healer",
		},
		["mana every 5 seconds"] = {
			"caster",
			"healer",
		},
		["parry"] = {
			"tank",
		},
		["parry rating"] = {
			"tank",
		},
		["pvp power"] = {
			"pvp",
		},
		["pvp resilience"] = {
			"pvp",
		},
		["rage"] = {
			"dps",
			"tank",
		},
		["spell penetration"] = {
			"caster",
		},
		["spell power"] = {
			"caster",
			"healer",
		},
		["spirit"] = {
			"caster",
			"healer",
		},
		["strength"] = {
			"dps",
		},
		["threat from all attacks and spells"] = {
			"tank",
		},
	}

	local ROLE_STAT_MATCH_FORMATS = {
		"use: permanently attach (%%a+) %s by",
		"adds (%%d+) %s",
		"become well fed and gain (.+) %s",
		"+(%%d+) %s",
		"%s by (%%d+)",
		"%s is increased by (%%d+)",
		"equip: increases your %s by (%%d+)",
		"to increase %s by (%%d+)",
		"increase your %s",
		"increasing %s",
		"grant you (%%d+) %s",
		"generates (%%d+) to (%%d+) %s",
		"restores (%%d+) %s",
		"gain (%%d+) %s",
		"gain (%%d+) (%%a+) and %s",
	}

	local INSCRIPTION_MATCH_FILTERS = {
		["Major Glyph"] = "INSCRIPTION_MAJOR_GLYPH",
		["Minor Glyph"] = "INSCRIPTION_MINOR_GLYPH",
		["Scroll of (.+)"] = "INSCRIPTION_SCROLL",
		["Ink of(.+)"] = "INSCRIPTION_MATERIALS",
		["(.+) Ink"] = "INSCRIPTION_MATERIALS",
		["Permanently add(.+)"] = "INSCRIPTION_ITEM_ENHANCEMENT",
		["Held In Off-hand"] = "INSCRIPTION_OFF_HAND",
	}

	local FilterStrings = private.FILTER_STRINGS

	-- Flag data for printing. Wiped and re-used.
	local missing_flags = {}
	local extra_flags = {}
	local general_issues = {}

	local ACQUIRE_TO_FILTER_MAP = {
		[A.MOB_DROP] = F.MOB_DROP,
		[A.QUEST] = F.QUEST,
		[A.WORLD_EVENTS] = F.WORLD_EVENTS,
		[A.WORLD_DROP] = F.WORLD_DROP,
	}
	local FILTER_TO_ACQUIRE_MAP

	local OBTAIN_FILTERS = {
        ACHIEVEMENT = true,
		DISC = true,
		INSTANCE = true,
        MISC1 = true,
		MOB_DROP = true,
		PVP = true,
		QUEST = true,
		RAID = true,
		REPUTATION = true,
		TRAINER = true,
        VENDOR = true,
        WORLD_DROP = true,
        WORLD_EVENTS = true,
    }

	--- Prints out the results of the tooltip scan.
	local function ProcessScanData()
		local recipe = scan_data.recipe
		if not recipe then
			output:AddLine("No scan_data.recipe")
			return
		end

		local flag_format = "F.%s"
		local firstLineNumber = output:Lines()

		table.wipe(missing_flags)
		table.wipe(extra_flags)
		table.wipe(general_issues)

		-------------------------------------------------------------------------------
		-- Things which will be automatically fixed. (Requires a profession dump)
		-------------------------------------------------------------------------------
		-- If we're a vendor scan,  do some extra checks
		if scan_data.is_vendor then
			if not recipe:HasFilter("common1", "VENDOR") and not recipe:HasFilter("common1", "WORLD_EVENTS") then
				recipe:AddFilters(F.VENDOR)
				table.insert(missing_flags, flag_format:format(FilterStrings[F.VENDOR]))
			end
			local subzone_text = _G.GetSubZoneText()

			if (subzone_text == "Wintergrasp Fortress" or subzone_text == "Halaa") and not recipe:HasFilter("common1", "PVP") then
				table.insert(missing_flags, flag_format:format(FilterStrings[F.PVP]))
			elseif recipe:HasFilter("common1", "PVP") and not (subzone_text == "Wintergrasp Fortress" or subzone_text == "Halaa") then
				table.insert(extra_flags, flag_format:format(FilterStrings[F.PVP]))
			end
		end

		if scan_data.found_class then
			for index, class_name in ipairs(ORDERED_CLASS_TYPES) do
				if scan_data[class_name] and not recipe:HasFilter("class1", CLASS_TYPES[class_name]) then
					recipe:AddFilters(private.FILTER_IDS[CLASS_TYPES[class_name]])
					table.insert(missing_flags, flag_format:format(CLASS_TYPES[class_name]))
				elseif not scan_data[class_name] and recipe:HasFilter("class1", CLASS_TYPES[class_name]) then
					table.insert(extra_flags, flag_format:format(CLASS_TYPES[class_name]))
				end
			end
		end

		for role_index, role in ipairs(ORDERED_ROLE_TYPES) do
			local role_string = ROLE_TYPES[role]

			if scan_data[role] and not recipe:HasFilter("common1", role_string) then
				recipe:AddFilters(ROLE_FILTERS[role])
				table.insert(missing_flags, flag_format:format(role_string))
			elseif not scan_data[role] and recipe:HasFilter("common1", role_string) then
				recipe:RemoveFilters(ROLE_FILTERS[role])
				table.insert(extra_flags, flag_format:format(role_string))
			end
		end

		local recipeAcquireData = recipe.acquire_data
		local repid = scan_data.repid
		if repid then
			if not recipe:HasFilter("reputation1", FilterStrings[repid]) and not recipe:HasFilter("reputation2", FilterStrings[repid]) then
				table.insert(missing_flags, repid)
			end
			local rep_data = recipeAcquireData[A.REPUTATION]

			if rep_data then
				for rep_id, rep_info in pairs(rep_data) do
					for rep_level, level_info in pairs(rep_info) do
						if rep_level ~= scan_data.repidlevel then
							output:AddLine("    Wrong reputation level.")
						end
					end
				end
			end
		end

		-- Make sure the recipe's filter flags match with its acquire types.
		if not FILTER_TO_ACQUIRE_MAP then
			FILTER_TO_ACQUIRE_MAP = {}

			for k, v in pairs(ACQUIRE_TO_FILTER_MAP) do
				FILTER_TO_ACQUIRE_MAP[v] = k
			end
		end

		for flag, acquire_type_id in pairs(FILTER_TO_ACQUIRE_MAP) do
			if recipeAcquireData[acquire_type_id] and not recipe:HasFilter("common1", FilterStrings[flag]) then
				local can_add = true

				if (acquire_type_id == A.WORLD_DROP or acquire_type_id == A.MOB_DROP) and (recipe:HasFilter("common1", "INSTANCE") or recipe:HasFilter("common1", "RAID")) then
					can_add = false
				end

				if can_add then
					recipe:AddFilters(flag)
					table.insert(missing_flags, flag_format:format(FilterStrings[flag]))
				end
			elseif not recipeAcquireData[acquire_type_id] and recipe:HasFilter("common1", FilterStrings[flag]) then
				local can_remove = true

				if acquire_type_id == A.WORLD_DROP and (not recipe:HasFilter("common1", "INSTANCE") and not recipe:HasFilter("common1", "RAID")) then
					can_remove = false
				end

				if can_remove then
					recipe:RemoveFilters(flag)
					table.insert(extra_flags, flag_format:format(FilterStrings[flag]))
				end
			end
		end

		if recipeAcquireData[A.VENDOR] then
			if not recipe:HasFilter("common1", "VENDOR") and not recipe:HasFilter("common1", "WORLD_EVENTS") and not recipe:HasFilter("common1", "REPUTATION") then
				recipe:AddFilters(F.VENDOR)
				table.insert(missing_flags, flag_format:format(FilterStrings[F.VENDOR]))
			end
		end

		if recipeAcquireData[A.REPUTATION] then
			if not recipe:HasFilter("common1", "REPUTATION") then
				recipe:AddFilters(F.REPUTATION)
				table.insert(missing_flags, FilterStrings[F.REPUTATION])
			end
		end

		if recipe:HasFilter("common1", "VENDOR") and not (recipeAcquireData[A.VENDOR] or recipeAcquireData[A.REPUTATION]) then
			recipe:RemoveFilters(F.VENDOR)
			table.insert(extra_flags, flag_format:format(FilterStrings[F.VENDOR]))
		end

		if recipeAcquireData[A.TRAINER] and not recipe:HasFilter("common1", "TRAINER") then
			recipe:AddFilters(F.TRAINER)
			table.insert(missing_flags, flag_format:format(FilterStrings[F.TRAINER]))
		end

		if recipe:HasFilter("common1", "TRAINER") and not recipeAcquireData[A.TRAINER] and not recipeAcquireData[A.CUSTOM] then
			recipe:RemoveFilters(F.TRAINER)
			table.insert(extra_flags, flag_format:format(FilterStrings[F.TRAINER]))
		end

		if scan_data.quality and scan_data.quality ~= recipe.quality then
			local QS = private.ITEM_QUALITY_NAMES
			table.insert(general_issues, ("    Wrong quality: Q.%s - should be Q.%s."):format(QS[recipe.quality], QS[scan_data.quality]))
			recipe.quality = scan_data.quality
		end

		-------------------------------------------------------------------------------
		-- Things which will only be warned about.
		-------------------------------------------------------------------------------
		if not recipe:ItemFilterType() then
			output:AddLine("    Missing item filter type.")
		end

		-- Check to see if we have a horde/alliance flag,  all recipes must have one of these
		if not recipe:HasFilter("common1", "ALLIANCE") and not recipe:HasFilter("common1", "HORDE") then
			output:AddLine("    Horde or Alliance not selected.")
		end

		-- Check to see if we have an obtain method flag,  all recipes must have at least one of these
		if not recipe:HasFilter("common1", "RETIRED") then
			local matching_filter = false

			for filter in pairs(OBTAIN_FILTERS) do
				if recipe:HasFilter("common1", filter) then
					matching_filter = true
					break
				end
			end

			if not matching_filter then
				output:AddLine("    No obtain flag.")
			end
		end

		-- Check for player role flags
		local spellID = recipe:SpellID()
		if not scan_data.no_role and not scan_data.tank and not scan_data.healer and not scan_data.caster and not scan_data.dps and not NO_ROLE_FLAG[spellID] then
			output:AddLine("    No player role flag.")
		end

		if scan_data.specialty then
			if not recipe.specialty then
				output:AddLine(("    Missing Specialty: %s"):format(scan_data.specialty))
			elseif recipe.specialty ~= scan_data.specialty then
				output:AddLine(("    Wrong Specialty: %s - should be %s "):format(recipe.specialty,scan_data.specialty))
			end
		elseif recipe.specialty then
			output:AddLine(("    Extra Specialty: %s"):format(recipe.specialty))
		end

		if scan_data.filter_type then
			local recipe_filter = recipe:ItemFilterType()

			if recipe_filter then
				recipe_filter = recipe_filter:upper()
			end

			if recipe_filter ~= scan_data.filter_type then
				table.insert(missing_flags, ("    Wrong filter type: %s - should be %s."):format(recipe_filter or "NONE", scan_data.filter_type))
				recipe:SetItemFilterType(scan_data.filter_type)
				scan_data.filter_type = nil
			end
		end

		if #missing_flags > 0 or #extra_flags > 0 or #general_issues > 0 then
			output:AddLine("    Issues which will be resolved with a profession dump:")

			if #missing_flags > 0 then
				output:AddLine("        Missing flags: " .. table.concat(missing_flags, ", "))
			end

			if #extra_flags > 0 then
				output:AddLine("        Extra flags: " .. table.concat(extra_flags, ", "))
			end

			if #general_issues > 0 then
				output:AddLine("        General issues: " .. table.concat(general_issues, ", "))
			end
		end

		if output:Lines() > firstLineNumber then
			output:InsertLine(firstLineNumber + 1, ("\n%s: <a href=\"http://www.wowhead.com/?spell=%d\">%d</a>"):format(recipe.name, spellID, spellID))
		end
	end

	--- Parses the mining tooltip for certain keywords, comparing them with the database flags
	local function ScanTooltip()
		local recipe = scan_data.recipe
		if not recipe then
			return
		end

		-- Parse all the lines of the tooltip
		for i = 1, ARLDatamineTT:NumLines(), 1 do
			local text_l = _G["ARLDatamineTTTextLeft" .. i]:GetText()
			local text_r = _G["ARLDatamineTTTextRight" .. i]:GetText()
			local text = (text_r and ("%s %s"):format(text_l, text_r) or text_l):lower()

			-- Check for recipe/item binding
			-- The recipe binding is within the first few lines of the tooltip always
			if text:match("binds when picked up") then
				if (i < 3) then
					scan_data.recipe_bop = true
				else
					scan_data.item_bop = true
				end
			end

			-- Recipe Specialities
			if SPECIALTY_TEXT[text] then
				scan_data.specialty = SPECIALTY_TEXT[text]
			end

			-- Recipe Reputations
			local rep, replevel = text_l:match("Requires (.+) %- (.+)")
			if rep and replevel and FACTION_TEXT[rep] then
				scan_data.repid = FACTION_TEXT[rep]
				scan_data.repidlevel = FACTION_LEVELS[replevel]
			end


			-------------------------------------------------------------------------------
			-- Do things the smart way and assign the filter type here. Uncomment when needed.
			-------------------------------------------------------------------------------
			if recipe.profession == "Inscription" then
				scan_data.filter_type = nil

				if not text_l:match("Tools: (.+)") and not text_l:match("Reagents:") and not text_l:match("Requires") then
					for pattern, filter in pairs(INSCRIPTION_MATCH_FILTERS) do
						if text_l:match(pattern) then
							recipe:SetItemFilterType(filter)
							break
						end
					end

					if not scan_data.filter_type and text_r and text_r:match("Staff") then
						scan_data.filter_type = "INSCRIPTION_STAFF"
					end
				end
			end

			for stat, roles in pairs(ROLE_STAT_MATCHES) do
				for match_index = 1, #ROLE_STAT_MATCH_FORMATS do
					if text:match(ROLE_STAT_MATCH_FORMATS[match_index]:format(stat)) then
						for role_index = 1, #roles do
							scan_data[roles[role_index]] = true
						end
					end
				end
			end

			-- Special cases.
			-- TODO: Some or all of these may not even exist anymore.
			if text:match("weapon damage") then
				scan_data.dps = true
			elseif text:match("increases (%a+) health by (%d+)") then
				scan_data.tank = true
			end

			local class_type = text_l:match("Classes: (.+)")
			if class_type then
				for idx, class in ipairs(ORDERED_CLASS_TYPES) do
					if class_type:match(class) then
						scan_data[class] = true
						scan_data.found_class = true
					end
				end
			end

			if text:match("(%d+) slot(.+)bag") or text:find("crafting reagent") then
				scan_data.no_role = true
			end
		end	-- for
	end


	--- Parses a specific recipe in the database, and scanning its tooltip
	-- @name AckisRecipeList:ScanTooltipRecipe
	-- @param spell_id The [[[http://www.wowpedia.org/SpellLink|Spell ID]]] of the recipe being added to the database
	-- @param is_vendor Boolean to determine if we're viewing a vendor or not
	-- @param is_largescan Boolean to determine if we're doing a large scan
	-- @return Recipe has its tooltips scanned
	-- Output is always returned by the caller.
	function addon:ScanTooltipRecipe(spellID, isVendor, isLargeScan)
		local recipe_list = private.recipe_list
		if not recipe_list then
			self:Debug(L["DATAMINER_NODB_ERROR"])
			return
		end

		local recipe = recipe_list[spellID]
		if not recipe then
			self:Debug("Spell ID %d does not exist in the database.", tonumber(spellID))
			return
		end
		local recipeName = recipe.name
		local game_vers = private.GAME_VERSIONS[recipe.genesis]

		if not game_vers then
			output:AddLine("No expansion information: " .. tostring(spellID) .. " " .. recipeName)
		elseif game_vers > #private.GAME_VERSION_NAMES then
			output:AddLine("Expansion information too high: " .. tostring(spellID) .. " " .. recipeName)
		end
		local optimal = recipe.optimal_level
		local medium = recipe.medium_level
		local easy = recipe.easy_level
		local trivial = recipe.trivial_level
		local skill_level = recipe.skill_level

		if not optimal then
			output:AddLine("No skill level information: " .. tostring(spellID) .. " " .. recipeName)
		else
			-- Highest level is greater than the skill of the recipe
			if optimal > skill_level then
				output:AddLine("Skill Level Error (optimal_level > skill_level): " .. tostring(spellID) .. " " .. recipeName)
			elseif optimal < skill_level then
				output:AddLine("Skill Level Error (optimal_level < skill_level): " .. tostring(spellID) .. " " .. recipeName)
			end

			-- Level info is messed up
			if optimal > medium or optimal > easy or optimal > trivial or medium > easy or medium > trivial or easy > trivial then
				output:AddLine("Skill Level Error: " .. tostring(spellID) .. " " .. recipeName)
			end
		end

		local recipeLink = _G.GetSpellLink(recipe:SpellID())
		if not recipeLink then
			self:Debug("Missing spell_link for ID %d (%s).", spellID, recipeName)
			return
		end
		ARLDatamineTT:SetOwner(_G.WorldFrame, "ANCHOR_NONE")
		_G.GameTooltip_SetDefaultAnchor(ARLDatamineTT, _G.UIParent)

		ARLDatamineTT:SetHyperlink(recipeLink)

		-- Check to see if this is a recipe tooltip.
		local text = _G["ARLDatamineTTTextLeft1"]:GetText():lower()
		local match_text = (":"):split(text)

		if match_text then
			match_text = ("%s: "):format(match_text)
		end

		if not RECIPE_TYPES[match_text] and not (text:find("smelt") or text:find("sunder") or text:find("shatter")) then
			ARLDatamineTT:Hide()
			return
		end
		table.wipe(scan_data)
		scan_data.recipe = recipe
		scan_data.is_vendor = isVendor

		ScanTooltip()

		local recipeItemID = recipe:RecipeItem()
		if recipeItemID then
			if recipe:HasFilter("common1", "TRAINER") and not recipe:HasFilter("common1", "VENDOR") and not recipe:HasFilter("common1", "INSTANCE") and not recipe:HasFilter("common1", "RAID") and not recipe:HasFilter("common1", "WORLD_DROP") then
				output:AddLine(("    Has Trainer filter flag, but also has a recipe item (%d)."):format(recipeItemID))
			end

			if not DO_NOT_SCAN[recipeItemID] then
				local item_name, item_link, item_quality = _G.GetItemInfo(recipeItemID)

				if item_name and item_link and item_quality then
					if item_quality > 0 then
						scan_data.quality = item_quality

						ARLDatamineTT:SetHyperlink(item_link)
						ScanTooltip()
					else
						output:AddLine("    Recipe item quality is 0 (junk), which probably means it has been removed from the game.")
					end
				else

					if _G.Querier then
						output:AddLine(("    Recipe item not in cache. To fix: /iq %d"):format(recipeItemID))
					else
						output:AddLine("    Recipe item not in cache.")
					end
				end
			end
		elseif not recipe:HasFilter("common1", "RETIRED") then
			-- We are dealing with a recipe that does not have an item to learn it from.
			-- Lets check the recipe flags to see if we have a data error and the item should exist
			if recipe:HasFilter("common1", "VENDOR") or recipe:HasFilter("common1", "INSTANCE") or recipe:HasFilter("common1", "RAID") or recipe:HasFilter("common1", "MOB_DROP") or recipe:HasFilter("common1", "WORLD_DROP") then
				output:AddLine(("    Missing a recipe item ID."))
			elseif recipe:HasFilter("common1", "TRAINER") and recipe.quality ~= private.ITEM_QUALITIES["COMMON"] then
				output:AddLine("    Issues which will be resolved with a profession dump:")
				output:AddLine(("    Wrong quality: Q.%s - should be Q.COMMON."):format(private.ITEM_QUALITY_NAMES[recipe.quality]))
				recipe.quality = private.ITEM_QUALITIES["COMMON"]
			end
		end
		ARLDatamineTT:Hide()

		ProcessScanData()

		if not isLargeScan then
			self:Print(output:String())
		end
	end
end

-------------------------------------------------------------------------------
-- Look up table of spell IDs for recipes which do not have a player flag
-- BASICALLY A TEMPORARY STORAGE FOR IDS, SO WE CAN SEE CLEANER SCANS AND WHAT NOT,
-- WE'LL GO BACK HERE LATER DOWN THE ROAD.
-------------------------------------------------------------------------------
NO_ROLE_FLAG = {
	--------------------------------------------------------------------------------------------
	-----ASSORTED CRAP
	--------------------------------------------------------------------------------------------
	[30344]	=	true,	[30341]	=	true,	[32814]	=	true,	[23066]	=	true,
	[26421]	=	true,	[36955]	=	true,	[19788]	=	true,	[23129]	=	true,
	[26422]	=	true,	[12715]	=	true,	[12899]	=	true,	[56459]	=	true,
	[30307]	=	true,	[26423]	=	true,	[3918]	=	true,	[23067]	=	true,
	[30308]	=	true,	[3953]	=	true,	[15255]	=	true,	[26424]	=	true,
	[30548]	=	true,	[44157]	=	true,	[56462]	=	true,	[19567]	=	true,
	[30552]	=	true,	[23068]	=	true,	[44155]	=	true,	[28327]	=	true,
	[26425]	=	true,	[56461]	=	true,	[68067]	=	true,	[15633]	=	true,
	[23096]	=	true,	[12589]	=	true,	[26442]	=	true,	[26426]	=	true,
	[67920]	=	true,	[9273]	=	true,	[3926]	=	true,	[6458]	=	true,
	[19793]	=	true,	[55252]	=	true,	[9271]	=	true,	[26427]	=	true,
	[26443]	=	true,	[30551]	=	true,	[23486]	=	true,	[3922]	=	true,
	[3924]	=	true,	[12590]	=	true,	[3928]	=	true,	[3942]	=	true,
	[26428]	=	true,	[3952]	=	true,	[22704]	=	true,	[12902]	=	true,
	[30569]	=	true,	[15628]	=	true,	[12895]	=	true,	[21940]	=	true,
	[56349]	=	true,	[12584]	=	true,	[56477]	=	true,	[30348]	=	true,
	[26416]	=	true,	[53281]	=	true,	[23507]	=	true,	[12075]	=	true,
	[12079]	=	true,	[26746]	=	true,	[56000]	=	true,

	-----------------------------------------------------------------------------------------
	---JEWELCRAFTING
	-----------------------------------------------------------------------------------------
	[55401]	=	true,	[53995]	=	true,	[66432]	=	true,	[25255]	=	true,
	[66497]	=	true,	[53996]	=	true,	[56074]	=	true,	[56202]	=	true,
	[66434]	=	true,	[32801]	=	true,	[28948]	=	true,	[53997]	=	true,
	[39963]	=	true,	[32866]	=	true,	[66501]	=	true,	[39452]	=	true,
	[53934]	=	true,	[66502]	=	true,	[55405]	=	true,	[58954]	=	true,
	[56205]	=	true,	[37855]	=	true,	[38175]	=	true,	[25305]	=	true,
	[25321]	=	true,	[66505]	=	true,	[54000]	=	true,	[39742]	=	true,
	[56206]	=	true,	[66506]	=	true,	[32869]	=	true,	[54001]	=	true,
	[56079]	=	true,	[32259]	=	true,	[32870]	=	true,	[56208]	=	true,
	[32807]	=	true,	[32871]	=	true,	[26873]	=	true,	[31061]	=	true,
	[32872]	=	true,	[42591]	=	true,	[46779]	=	true,	[56530]	=	true,
	[42592]	=	true,	[31062]	=	true,	[56083]	=	true,	[32874]	=	true,
	[56531]	=	true,	[31063]	=	true,	[56085]	=	true,	[38503]	=	true,
	[56086]	=	true,	[28938]	=	true,	[38504]	=	true,	[31064]	=	true,
	[31096]	=	true,	[55384]	=	true,	[25278]	=	true,	[68253]	=	true,
	[43493]	=	true,	[26925]	=	true,	[31065]	=	true,	[46403]	=	true,
	[53852]	=	true,	[53916]	=	true,	[39722]	=	true,	[25615]	=	true,
	[28924]	=	true,	[26926]	=	true,	[53853]	=	true,	[36526]	=	true,
	[31098]	=	true,	[55388]	=	true,	[46405]	=	true,	[53854]	=	true,
	[39724]	=	true,	[55389]	=	true,	[26927]	=	true,	[31051]	=	true,
	[53919]	=	true,	[39725]	=	true,	[55390]	=	true,	[53856]	=	true,
	[53920]	=	true,	[53952]	=	true,	[26880]	=	true,	[53857]	=	true,
	[31052]	=	true,	[34069]	=	true,	[25490]	=	true,	[55393]	=	true,
	[39451]	=	true,	[53956]	=	true,	[44794]	=	true,	[36524]	=	true,
	[55395]	=	true,	[38068]	=	true,	[28944]	=	true,	[53957]	=	true,
	[31066]	=	true,	[31082]	=	true,	[66428]	=	true,	[26909]	=	true,
	[55396]	=	true,	[31097]	=	true,	[25284]	=	true,	[56084]	=	true,
	[62941]	=	true,	[66431]	=	true,	[53894]	=	true,	[53958]	=	true,
	[58146]	=	true,	[31099]	=	true,	[47053]	=	true,	[31067]	=	true,
	[28917]	=	true,	[26903]	=	true,	[36525]	=	true,	[66503]	=	true,
	[56197]	=	true,	[47054]	=	true,	[53961]	=	true,	[39715]	=	true,
	[31092]	=	true,	[53960]	=	true,	[31077]	=	true,	[31101]	=	true,
	[39719]	=	true,	[55399]	=	true,	[31113]	=	true,	[32808]	=	true,
	[53917]	=	true,	[63743]	=	true,	[39720]	=	true,	[39721]	=	true,
	[42590]	=	true,	[58149]	=	true,	[56199]	=	true,	[47056]	=	true,
	[28950]	=	true,	[47280]	=	true,	[32809]	=	true,	[31072]	=	true,
	[25318]	=	true,	[66429]	=	true,	[62242]	=	true,	[170701] =	true,
	[170702] =	true,	[170703] =	true,	[170721] =	true,	[170722] =	true,
	[170723] =	true,	[170724] =	true,	[170727] =	true,	[170728] =	true,
	[170729] =	true,	[170730] =	true,	[170731] =	true,	[170732] =	true,
	[25612]	=	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	---COOKING
	---------------------------------------------------------------------------------------
	[62050] =	true,	[22761]	=	true,	[62051]	=	true,	[8607]	=	true,	[18238]	=	true,
	[6413]	=	true,	[6417]	=	true,	[42296]	=	true,	[45557]	=	true,	[6501]	=	true,
	[45558]	=	true,	[18239]	=	true,	[7752]	=	true,	[7828]	=	true,	[45560]	=	true,
	[64358]	=	true,	[57421]	=	true,	[45561]	=	true,	[13028]	=	true,	[2543]	=	true,
	[2545]	=	true,	[25659]	=	true,	[58512]	=	true,	[45565]	=	true,	[42305]	=	true,
	[45566] =	true,	[62350]	=	true,	[7753]	=	true,	[45695]	=	true,	[9513]	=	true,
	[18244]	=	true,	[20626]	=	true,	[45569]	=	true,	[43779]	=	true,	[18245]	=	true,
	[45571]	=	true,	[18246]	=	true,	[37836]	=	true,	[57433]	=	true,	[20916]	=	true,
	[58521]	=	true,	[18247]	=	true,	[57435]	=	true,	[7754]	=	true,	[53056]	=	true,
	[58523]	=	true,	[57437]	=	true,	[57438]	=	true,	[58525]	=	true,	[45570]	=	true,
	[2538]	=	true,	[2540]	=	true,	[2548]	=	true,	[33290]	=	true,	[45562]	=	true,
	[15906]	=	true,	[18241]	=	true,	[45559]	=	true,	[45551]	=	true,	[57443]	=	true,
	[58527]	=	true,	[43758]	=	true,	[58528]	=	true,	[8238]	=	true,	[7751]	=	true,
	[7755]	=	true,	[43761]	=	true,	[7827]	=	true,	[45552]	=	true,	[45553]	=	true,
	[66038]	=	true,	[66034]	=	true,	[15935] =	true,	[2795] =	true,	[6414] =	true,
	[15935] =	true,	[21143] =	true,	[21144] =	true,	[33276] =	true,	[33277] =	true,
	[43772] =	true,	[57440] =	true,	[88011] =	true,	[88013] =	true,	[88017] =	true,
	[88018] =	true,	[88019] =	true,	[88022] =	true,	[88025] =	true,	[88035] =	true,
	[88036] =	true,	[88044] =	true,	[88045] =	true,	[96133] =	true,	[105190] =	true,
	[105194] =	true,	[124029] =	true,	[124032] =	true,	[145038] =	true,	[145061] =	true,
	[145062] =	true,	[145308] =	true,	[160958] =	true,	[160962] =	true,	[160968] =	true,
	[160969] = 	true,	[160971] =	true,	[160973] =	true,	[160981] =	true,	[160982] =	true,
	[160983] =	true,	[160984] =	true,	[160986] =	true,	[160989] =	true,	[160999] =	true,
	[161000] =	true,	[173978] =	true,	[173979] =	true,	[180757] =	true,	[180759] =	true,
	[180761] =	true,	[180762] =	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	---BLACKSMITHING
	---------------------------------------------------------------------------------------
	[10015]	=	true,	[55202]	=	true,	[16726]	=	true,	[24399]	=	true,
	[15293]	=	true,	[32655]	=	true,	[3320]	=	true,	[40033]	=	true,
	[34545]	=	true,	[61010]	=	true,	[16639]	=	true,	[3115]	=	true,
	[3116]	=	true,	[3117]	=	true,	[16648]	=	true,	[40034]	=	true,
	[9920]	=	true,	[9928]	=	true,	[29558]	=	true,	[55839]	=	true,
	[9964]	=	true,	[7818]	=	true,	[55732]	=	true,	[29694]	=	true,
	[3326]	=	true,	[9950]	=	true,	[59405]	=	true,	[12260]	=	true,
	[16983]	=	true,	[16991]	=	true,	[23650]	=	true,	[16640]	=	true,
	[2741]	=	true,	[3513]	=	true,	[3497]	=	true,	[8768]	=	true,
	[19666]	=	true,	[2662]	=	true,	[2663]	=	true,	[20201]	=	true,
	[16664]	=	true,	[15294]	=	true,	[3496]	=	true,	[16645]	=	true,
	[29569]	=	true,	[2737]	=	true,	[14380]	=	true,	[16992]	=	true,
	[36125]	=	true,	[19667]	=	true,	[22757]	=	true,	[16665]	=	true,
	[59406]	=	true,	[2738]	=	true,	[2739]	=	true,	[2740]	=	true,
	[24913]	=	true,	[9933]	=	true,	[20873]	=	true,	[36126]	=	true,
	[40035]	=	true,	[8880]	=	true,	[23636]	=	true,	[3292]	=	true,
	[3293]	=	true,	[21161]	=	true,	[32656]	=	true,	[19668]	=	true,
	[9921]	=	true,	[7222]	=	true,	[3319]	=	true,	[15295]	=	true,
	[20874]	=	true,	[20890]	=	true,	[3337]	=	true,	[34546]	=	true,
	[16970]	=	true,	[16978]	=	true,	[61008]	=	true,	[7224]	=	true,
	[11454]	=	true,	[19669]	=	true,	[55656]	=	true,	[16667]	=	true,
	[16731]	=	true,	[61009]	=	true,	[9926]	=	true,	[16984]	=	true,
	[21913]	=	true,	[40036]	=	true,	[9974]	=	true,	[32657]	=	true,
	[32285]	=	true,	[23638]	=	true,	[10011]	=	true,	[36131]	=	true,
	[27830]	=	true,	[32284]	=	true,	[16732]	=	true,	[15292]	=	true,
	[15296]	=	true,	[38478]	=	true,	[20876]	=	true,	[38475]	=	true,
	[23653]	=	true,	[3325]	=	true,	[14379]	=	true,	[29729]	=	true,
	[2661]	=	true,	[29728]	=	true,	[16655]	=	true,	[16993]	=	true,
	[3491]	=	true,	[3494]	=	true,	[3501]	=	true,	[9959]	=	true,
	[9983]	=	true,	[36262]	=	true,	[10003]	=	true,	[10007]	=	true,
	[7221] =	true,	[9939] =	true,	[11454] =	true,	[16651] =	true,
	[29657] =	true,	[76439] =	true,	[76440] =	true,	[122632] =	true,
	[131928] =	true,	[138646] =	true,	[142954] =	true,	[142958] =	true,
	[142959] =	true,	[142963] =	true,	[142967] =	true,	[142968] =	true,
	[143255] =	true,	[146921] =	true,	[171699] =	true,	[171708] =	true,
	[171709] =	true,	[171710] =	true,	[171711] =	true,	[173355] =	true,
	[177169] =	true,	[181416] =	true,	[181417] =	true,	[182116] =	true,

	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	----INSCRIPTION
	---------------------------------------------------------------------------------------
	[58315]	=	true,	[58331]	=	true,	[58347]	=	true,	[56974]	=	true,	[56990]	=	true,
	[64256]	=	true,	[64304]	=	true,	[57166]	=	true,	[57709]	=	true,	[57214]	=	true,
	[57230]	=	true,	[50603]	=	true,	[57262]	=	true,	[59338]	=	true,	[58332]	=	true,
	[56959]	=	true,	[56975]	=	true,	[56991]	=	true,	[57007]	=	true,	[57023]	=	true,
	[53462]	=	true,	[64257]	=	true,	[64273]	=	true,	[64289]	=	true,	[57151]	=	true,
	[57167]	=	true,	[57183]	=	true,	[57710]	=	true,	[57215]	=	true,	[57247]	=	true,
	[50620]	=	true,	[58301]	=	true,	[59339]	=	true,	[58333]	=	true,	[59387]	=	true,
	[52840]	=	true,	[59499]	=	true,	[56960]	=	true,	[56976]	=	true,	[57008]	=	true,
	[57024]	=	true,	[64258]	=	true,	[64274]	=	true,	[57168]	=	true,	[57184]	=	true,
	[61288]	=	true,	[57216]	=	true,	[57232]	=	true,	[58286]	=	true,	[58302]	=	true,
	[59340]	=	true,	[48114]	=	true,	[64051]	=	true,	[59484]	=	true,	[59500]	=	true,
	[56961]	=	true,	[56977]	=	true,	[57009]	=	true,	[57025]	=	true,	[61177]	=	true,
	[64259]	=	true,	[57121]	=	true,	[64291]	=	true,	[57153]	=	true,	[57169]	=	true,
	[57185]	=	true,	[57712]	=	true,	[57217]	=	true,	[57233]	=	true,	[58287]	=	true,
	[58303]	=	true,	[58319]	=	true,	[56946]	=	true,	[56978]	=	true,	[56994]	=	true,
	[57010]	=	true,	[57026]	=	true,	[64260]	=	true,	[57122]	=	true,	[57154]	=	true,
	[57170]	=	true,	[57186]	=	true,	[57713]	=	true,	[57218]	=	true,	[57234]	=	true,
	[57266]	=	true,	[59326]	=	true,	[58320]	=	true,	[58336]	=	true,	[59486]	=	true,
	[59502]	=	true,	[56963]	=	true,	[56995]	=	true,	[57011]	=	true,	[57027]	=	true,
	[64261]	=	true,	[64277]	=	true,	[57155]	=	true,	[57187]	=	true,	[57714]	=	true,
	[57219]	=	true,	[57235]	=	true,	[58289]	=	true,	[58305]	=	true,	[58321]	=	true,
	[58337]	=	true,	[69385]	=	true,	[57243]	=	true,	[64314]	=	true,	[64313]	=	true,
	[56958]	=	true,	[59487]	=	true,	[59503]	=	true,	[58288]	=	true,	[56980]	=	true,
	[56996]	=	true,	[57012]	=	true,	[57028]	=	true,	[59501]	=	true,	[56948]	=	true,
	[57264]	=	true,	[64246]	=	true,	[64262]	=	true,	[57124]	=	true,	[64294]	=	true,
	[57156]	=	true,	[57172]	=	true,	[57188]	=	true,	[57715]	=	true,	[57220]	=	true,
	[57236]	=	true,	[57268]	=	true,	[58306]	=	true,	[58322]	=	true,	[58338]	=	true,
	[48247]	=	true,	[57133]	=	true,	[57270]	=	true,	[57131]	=	true,	[57129]	=	true,
	[50604]	=	true,	[59488]	=	true,	[59504]	=	true,	[56965]	=	true,	[56981]	=	true,
	[56997]	=	true,	[57013]	=	true,	[57029]	=	true,	[64280]	=	true,	[57114]	=	true,
	[64286]	=	true,	[58299]	=	true,	[57125]	=	true,	[64295]	=	true,	[64311]	=	true,
	[57164]	=	true,	[57189]	=	true,	[57716]	=	true,	[57221]	=	true,	[57237]	=	true,
	[57269]	=	true,	[58307]	=	true,	[58323]	=	true,	[58339]	=	true,	[64307]	=	true,
	[57119]	=	true,	[57246]	=	true,	[68166]	=	true,	[64282]	=	true,	[57250]	=	true,
	[59489]	=	true,	[56957]	=	true,	[56982]	=	true,	[56998]	=	true,	[57014]	=	true,
	[57117]	=	true,	[64305]	=	true,	[61677]	=	true,	[52843]	=	true,	[57126]	=	true,
	[64296]	=	true,	[57158]	=	true,	[64310]	=	true,	[57190]	=	true,	[56956]	=	true,
	[57238]	=	true,	[60336]	=	true,	[58308]	=	true,	[58324]	=	true,	[58340]	=	true,
	[64315]	=	true,	[56949]	=	true,	[56950]	=	true,	[64308]	=	true,	[56955]	=	true,
	[59490]	=	true,	[59315]	=	true,	[56983]	=	true,	[56999]	=	true,	[64267]	=	true,
	[57031]	=	true,	[56954]	=	true,	[64276]	=	true,	[57249]	=	true,	[64249]	=	true,
	[56953]	=	true,	[57127]	=	true,	[64297]	=	true,	[57159]	=	true,	[64275]	=	true,
	[57191]	=	true,	[57207]	=	true,	[57223]	=	true,	[57239]	=	true,	[50612]	=	true,
	[60337]	=	true,	[57208]	=	true,	[58325]	=	true,	[48121]	=	true,	[56952]	=	true,
	[56947]	=	true,	[56951]	=	true,	[64268]	=	true,	[57123]	=	true,	[59475]	=	true,
	[59491]	=	true,	[56968]	=	true,	[56984]	=	true,	[57000]	=	true,	[48248]	=	true,
	[58565]	=	true,	[58317]	=	true,	[64266]	=	true,	[57252]	=	true,	[64250]	=	true,
	[57112]	=	true,	[57128]	=	true,	[64298]	=	true,	[57160]	=	true,	[58316]	=	true,
	[57703]	=	true,	[57719]	=	true,	[57224]	=	true,	[57240]	=	true,	[57272]	=	true,
	[58310]	=	true,	[58326]	=	true,	[58342]	=	true,	[57201]	=	true,	[56945]	=	true,
	[57200]	=	true,	[56944]	=	true,	[57711]	=	true,	[56985]	=	true,	[57001]	=	true,
	[57199]	=	true,	[57033]	=	true,	[56943]	=	true,	[57198]	=	true,	[64251]	=	true,
	[57113]	=	true,	[64283]	=	true,	[64299]	=	true,	[57161]	=	true,	[57197]	=	true,
	[57704]	=	true,	[57209]	=	true,	[57225]	=	true,	[57241]	=	true,	[50614]	=	true,
	[57273]	=	true,	[58311]	=	true,	[58327]	=	true,	[58343]	=	true,	[52738]	=	true,
	[57196]	=	true,	[64278]	=	true,	[57195]	=	true,	[58318]	=	true,	[64284]	=	true,
	[57006]	=	true,	[64316]	=	true,	[56986]	=	true,	[57002]	=	true,	[59560]	=	true,
	[57034]	=	true,	[58341]	=	true,	[57192]	=	true,	[64252]	=	true,	[67600]	=	true,
	[57130]	=	true,	[64300]	=	true,	[57162]	=	true,	[57244]	=	true,	[57194]	=	true,
	[57210]	=	true,	[57226]	=	true,	[50599]	=	true,	[57258]	=	true,	[58296]	=	true,
	[58312]	=	true,	[58328]	=	true,	[58344]	=	true,	[52739]	=	true,	[58298]	=	true,
	[57274]	=	true,	[57265]	=	true,	[57251]	=	true,	[59478]	=	true,	[56971]	=	true,
	[56987]	=	true,	[57003]	=	true,	[57019]	=	true,	[57035]	=	true,	[57259]	=	true,
	[57263]	=	true,	[57271]	=	true,	[64253]	=	true,	[57115]	=	true,	[64285]	=	true,
	[57242]	=	true,	[57163]	=	true,	[57120]	=	true,	[57706]	=	true,	[57211]	=	true,
	[57227]	=	true,	[50600]	=	true,	[50616]	=	true,	[58297]	=	true,	[58313]	=	true,
	[58329]	=	true,	[58345]	=	true,	[50602]	=	true,	[57248]	=	true,	[59559]	=	true,
	[57157]	=	true,	[57257]	=	true,	[64309]	=	true,	[64317]	=	true,	[56972]	=	true,
	[56988]	=	true,	[57004]	=	true,	[57020]	=	true,	[57036]	=	true,	[62162]	=	true,
	[57030]	=	true,	[64254]	=	true,	[57116]	=	true,	[57132]	=	true,	[64302]	=	true,
	[64318]	=	true,	[64270]	=	true,	[57707]	=	true,	[57212]	=	true,	[57228]	=	true,
	[50601]	=	true,	[57260]	=	true,	[57276]	=	true,	[58314]	=	true,	[58330]	=	true,
	[58346]	=	true,	[45382]	=	true,	[57267]	=	true,	[57275]	=	true,	[64312]	=	true,
	[64279]	=	true,	[50598]	=	true,	[59480]	=	true,	[59496]	=	true,	[56973]	=	true,
	[56989]	=	true,	[57005]	=	true,	[57021]	=	true,	[50619]	=	true,	[50618]	=	true,
	[65245]	=	true,	[50617]	=	true,	[64255]	=	true,	[64271]	=	true,	[64287]	=	true,
	[64303]	=	true,	[57165]	=	true,	[57181]	=	true,	[57708]	=	true,	[57213]	=	true,
	[57229]	=	true,	[57245]	=	true,	[57261]	=	true,	[57277]	=	true,	[57253]	=	true,
	[71015]	=	true,	[71101]	=	true,	[71102]	=	true,	[86644] =	true,	[86645] =	true,
	[86646] =	true,	[146638] =	true,	[163294] =	true,	[166366] =	true,	[166367] =	true,
	[166432] =	true,	[178248] =	true,	[178249] =	true,	[181420] = 	true,	[181421] =	true,
	[182125] =	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	----ENCHANTING
	---------------------------------------------------------------------------------------
	[46578]	=	true,	[25125]	=	true,	[13612]	=	true,	[13620]	=	true,	[13628]	=	true,
	[13640]	=	true,	[13644]	=	true,	[13648]	=	true,	[59625]	=	true,	[13700]	=	true,
	[17181]	=	true,	[27920]	=	true,	[27960]	=	true,	[28016]	=	true,	[45765]	=	true,
	[14810]	=	true,	[63746]	=	true,	[13836]	=	true,	[20008]	=	true,	[20032]	=	true,
	[13868]	=	true,	[13421]	=	true,	[13948]	=	true,	[27905]	=	true,	[27945]	=	true,
	[13501]	=	true,	[7786]	=	true,	[7788]	=	true,	[13529]	=	true,	[32664]	=	true,
	[44506]	=	true,	[25127]	=	true,	[20025]	=	true,	[20033]	=	true,	[13617]	=	true,
	[64579]	=	true,	[60619]	=	true,	[13657]	=	true,	[13693]	=	true,	[27914]	=	true,
	[44555]	=	true,	[27954]	=	true,	[27962]	=	true,	[14807]	=	true,	[32665]	=	true,
	[7421]	=	true,	[13817]	=	true,	[25072]	=	true,	[44492]	=	true,	[44524]	=	true,
	[7443]	=	true,	[44556]	=	true,	[25128]	=	true,	[20026]	=	true,	[7457]	=	true,
	[13378]	=	true,	[34001]	=	true,	[13917]	=	true,	[13933]	=	true,	[13937]	=	true,
	[13941]	=	true,	[44621]	=	true,	[28003]	=	true,	[28027]	=	true,	[13522]	=	true,
	[13538]	=	true,	[25081]	=	true,	[44494]	=	true,	[20011]	=	true,	[25129]	=	true,
	[44590]	=	true,	[47672]	=	true,	[20051]	=	true,	[13622]	=	true,	[13626]	=	true,
	[69412]	=	true,	[60623]	=	true,	[44383]	=	true,	[13698]	=	true,	[13702]	=	true,
	[23804]	=	true,	[44623]	=	true,	[28004]	=	true,	[28028]	=	true,	[14293]	=	true,
	[32667]	=	true,	[13822]	=	true,	[25082]	=	true,	[44576]	=	true,	[20028]	=	true,
	[20036]	=	true,	[13890]	=	true,	[13898]	=	true,	[60609]	=	true,	[59619]	=	true,
	[47898]	=	true,	[7745]	=	true,	[27957]	=	true,	[13503]	=	true,	[34006]	=	true,
	[7793]	=	true,	[7795]	=	true,	[59636]	=	true,	[25083]	=	true,	[20029]	=	true,
	[13631]	=	true,	[13655]	=	true,	[7861]	=	true,	[7863]	=	true,	[62256]	=	true,
	[13695]	=	true,	[13858]	=	true,	[44483]	=	true,	[27968]	=	true,	[7857]	=	true,
	[27967]	=	true,	[42615]	=	true,	[27958]	=	true,	[42613]	=	true,	[25084]	=	true,
	[20017]	=	true,	[33992]	=	true,	[34008]	=	true,	[13663]	=	true,	[60653]	=	true,
	[44528]	=	true,	[14809]	=	true,	[27961]	=	true,	[47901]	=	true,	[7418]	=	true,
	[7420]	=	true,	[44488]	=	true,	[7426]	=	true,	[44616]	=	true,	[13841]	=	true,
	[44596]	=	true,	[17180]	=	true,	[7454]	=	true,	[33993]	=	true,	[34009]	=	true,
	[27950]	=	true,	[20031]	=	true,	[13915]	=	true,	[47900]	=	true,	[13943]	=	true,
	[13947]	=	true,	[13945]	=	true,	[13464]	=	true,	[27927]	=	true,	[7771]	=	true,
	[20014]	=	true,	[20030]	=	true,	[27947]	=	true,	[33994]	=	true,	[28022]	=	true,
	[60692]	=	true,	[25130]	=	true,	[34005]	=	true,	[13794]	=	true,	[7748]	=	true,
	[44588]	=	true,	[15596]	=	true,	[7776]	=	true,	[44584]	=	true,	[13607]	=	true,
	[13653]	=	true,	[20020]	=	true,	[70524]	=	true,	[71692]	=	true,	[158901] =	true,
	[158910] = 	true,	[158911] =	true,	[158909] =	true,	[159671] =	true,	[159235] =	true,
	[159672] = 	true,	[159673] =	true,	[173323] =	true,	[159674] =	true,	[158918] =	true,
	[158917] =	true,	[158916] =	true,	[74251] =	true,	[44595] =	true,	[74242] =	true,
	[74244] =	true,	[74246] =	true,	[74250] =	true,	[74253] =	true,	[74255] =	true,
	[93843] =	true,	[104427] =	true,	[158895] =	true,	[158896] =	true,	[158903] =	true,
	[182129] =	true,	[104397] =	true,	[158902] =	true,	[158889] =	true,	[158894] =	true,
	[34003] =	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	---TAILORING
	---------------------------------------------------------------------------------------
	[12055]	=	true,	[12059]	=	true,	[12071]	=	true,	[46131]	=	true,	[23664]	=	true,
	[31433]	=	true,	[31441]	=	true,	[7624]	=	true,	[26403]	=	true,	[24902]	=	true,
	[22866]	=	true,	[56001]	=	true,	[18411]	=	true,	[18419]	=	true,	[18451]	=	true,
	[28208]	=	true,	[6686]	=	true,	[8766]	=	true,	[23665]	=	true,	[8786]	=	true,
	[26747]	=	true,	[56002]	=	true,	[26763]	=	true,	[26779]	=	true,	[31434]	=	true,
	[31450]	=	true,	[60969]	=	true,	[28480]	=	true,	[22867]	=	true,	[56003]	=	true,
	[18404]	=	true,	[18412]	=	true,	[18420]	=	true,	[12044]	=	true,	[63924]	=	true,
	[12056]	=	true,	[12064]	=	true,	[12080]	=	true,	[12084]	=	true,	[23666]	=	true,
	[56004]	=	true,	[26780]	=	true,	[31459]	=	true,	[7892]	=	true,	[60971]	=	true,
	[28481]	=	true,	[22868]	=	true,	[20848]	=	true,	[56005]	=	true,	[18405]	=	true,
	[19435]	=	true,	[26086]	=	true,	[18437]	=	true,	[18453]	=	true,	[27659]	=	true,
	[28210]	=	true,	[40021]	=	true,	[23667]	=	true,	[26773]	=	true,	[26781]	=	true,
	[26759]	=	true,	[8774]	=	true,	[31460]	=	true,	[24903]	=	true,	[3755]	=	true,
	[37882]	=	true,	[3757]	=	true,	[3758]	=	true,	[50194]	=	true,	[18446]	=	true,
	[6692]	=	true,	[28482]	=	true,	[22869]	=	true,	[18439]	=	true,	[20849]	=	true,
	[18440]	=	true,	[2389]	=	true,	[56007]	=	true,	[18455]	=	true,	[6521]	=	true,
	[18445]	=	true,	[18406]	=	true,	[18414]	=	true,	[18422]	=	true,	[12045]	=	true,
	[36318]	=	true,	[18454]	=	true,	[27660]	=	true,	[24091]	=	true,	[12065]	=	true,
	[12069]	=	true,	[12077]	=	true,	[12081]	=	true,	[12085]	=	true,	[27724]	=	true,
	[12093]	=	true,	[40060]	=	true,	[26087]	=	true,	[26749]	=	true,	[31373]	=	true,
	[26750]	=	true,	[26782]	=	true,	[28205]	=	true,	[28209]	=	true,	[36686]	=	true,
	[3813]	=	true,	[2394]	=	true,	[7629]	=	true,	[18438]	=	true,	[7633]	=	true,
	[40023]	=	true,	[49677]	=	true,	[26407]	=	true,	[18452]	=	true,	[7643]	=	true,
	[22870]	=	true,	[26755]	=	true,	[22902]	=	true,	[3869]	=	true,	[55993]	=	true,
	[8789]	=	true,	[3839]	=	true,	[3841]	=	true,	[3844]	=	true,	[18407]	=	true,
	[18415]	=	true,	[3847]	=	true,	[3848]	=	true,	[3851]	=	true,	[3852]	=	true,
	[24092]	=	true,	[3854]	=	true,	[3856]	=	true,	[3857]	=	true,	[8760]	=	true,
	[27725]	=	true,	[8776]	=	true,	[8780]	=	true,	[8784]	=	true,	[3865]	=	true,
	[55994]	=	true,	[3868]	=	true,	[26783]	=	true,	[3871]	=	true,	[3872]	=	true,
	[3873]	=	true,	[31438]	=	true,	[22759]	=	true,	[12091]	=	true,	[8804]	=	true,
	[8772]	=	true,	[18560]	=	true,	[18447]	=	true,	[44950]	=	true,	[60993]	=	true,
	[55899]	=	true,	[55898]	=	true,	[55995]	=	true,	[2385]	=	true,	[21945]	=	true,
	[6688]	=	true,	[12066]	=	true,	[18416]	=	true,	[8465]	=	true,	[12046]	=	true,
	[18448]	=	true,	[3915]	=	true,	[24093]	=	true,	[8489]	=	true,	[2386]	=	true,
	[12078]	=	true,	[12082]	=	true,	[60994]	=	true,	[55900]	=	true,	[2392]	=	true,
	[2393]	=	true,	[23662]	=	true,	[2396]	=	true,	[55996]	=	true,	[2399]	=	true,
	[26784]	=	true,	[2402]	=	true,	[2403]	=	true,	[2406]	=	true,	[31431]	=	true,
	[3864]	=	true,	[8782]	=	true,	[37884]	=	true,	[37883]	=	true,	[26751]	=	true,
	[50647]	=	true,	[8802]	=	true,	[8467]	=	true,	[7893]	=	true,	[40020]	=	true,
	[41208]	=	true,	[22813]	=	true,	[41207]	=	true,	[37873]	=	true,	[2387]	=	true,
	[55997]	=	true,	[26085]	=	true,	[8799]	=	true,	[27658]	=	true,	[8483]	=	true,
	[3914]	=	true,	[18401]	=	true,	[56006]	=	true,	[18441]	=	true,	[18449]	=	true,
	[28207]	=	true,	[55769]	=	true,	[18413]	=	true,	[18421]	=	true,	[46129]	=	true,
	[2963]	=	true,	[2964]	=	true,	[12061]	=	true,	[12086]	=	true,	[23663]	=	true,
	[26745]	=	true,	[55998]	=	true,	[3863]	=	true,	[8764]	=	true,	[31440]	=	true,
	[31448]	=	true,	[12089]	=	true,	[6695]	=	true,	[40024]	=	true,	[60990]	=	true,
	[50644]	=	true,	[8793]	=	true,	[46130]	=	true,	[24901]	=	true,	[3870]	=	true,
	[31437]	=	true,	[44958]	=	true,	[55999]	=	true,	[3845]	=	true,	[6693]	=	true,
	[3866]	=	true,	[18456]	=	true,	[18410]	=	true,	[18418]	=	true,	[2397]	=	true,
	[18434]	=	true,	[18450]	=	true,	[168849] =	true,	[168850] =	true,	[168855] =	true,
	[168856] =	true,	[168836] =	true,	[18409] =	true,	[143011] =	true,	[168835] =	true,
	[181418] =	true,	[182123] =	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	----LEATHERWORKING
	---------------------------------------------------------------------------------------
	[9198]	=	true,	[23704]	=	true,	[60996]	=	true,	[35549]	=	true,	[22921]	=	true,
	[50958]	=	true,	[10509]	=	true,	[10525]	=	true,	[19053]	=	true,	[19085]	=	true,
	[19101]	=	true,	[2149]	=	true,	[36349]	=	true,	[2153]	=	true,	[60997]	=	true,
	[2159]	=	true,	[2163]	=	true,	[2165]	=	true,	[35582]	=	true,	[50959]	=	true,
	[46132]	=	true,	[23705]	=	true,	[60998]	=	true,	[22922]	=	true,	[46133]	=	true,
	[24121]	=	true,	[19054]	=	true,	[19070]	=	true,	[19086]	=	true,	[19102]	=	true,
	[32465]	=	true,	[32481]	=	true,	[22331]	=	true,	[35520]	=	true,	[35584]	=	true,
	[9207]	=	true,	[6661]	=	true,	[46134]	=	true,	[23706]	=	true,	[61000]	=	true,
	[35521]	=	true,	[35585]	=	true,	[50962]	=	true,	[10518]	=	true,	[39997]	=	true,
	[24122]	=	true,	[19055]	=	true,	[19087]	=	true,	[19103]	=	true,	[32466]	=	true,
	[32482]	=	true,	[36353]	=	true,	[35522]	=	true,	[35554]	=	true,	[50963]	=	true,
	[44953]	=	true,	[46136]	=	true,	[23707]	=	true,	[61002]	=	true,	[35523]	=	true,
	[35555]	=	true,	[35587]	=	true,	[50964]	=	true,	[46137]	=	true,	[24123]	=	true,
	[19072]	=	true,	[19104]	=	true,	[9064]	=	true,	[9072]	=	true,	[69386]	=	true,
	[32499]	=	true,	[36355]	=	true,	[7133]	=	true,	[35524]	=	true,	[35588]	=	true,
	[7153]	=	true,	[9208]	=	true,	[46138]	=	true,	[23708]	=	true,	[69388]	=	true,
	[35525]	=	true,	[35557]	=	true,	[10487]	=	true,	[10511]	=	true,	[46139]	=	true,
	[24124]	=	true,	[19073]	=	true,	[19089]	=	true,	[32468]	=	true,	[32500]	=	true,
	[10647]	=	true,	[28472]	=	true,	[35526]	=	true,	[35558]	=	true,	[45117]	=	true,
	[60622]	=	true,	[23709]	=	true,	[35527]	=	true,	[3774]	=	true,	[3778]	=	true,
	[3780]	=	true,	[40003]	=	true,	[24125]	=	true,	[19058]	=	true,	[19074]	=	true,
	[32485]	=	true,	[32501]	=	true,	[36359]	=	true,	[3816]	=	true,	[3818]	=	true,
	[28473]	=	true,	[35528]	=	true,	[35560]	=	true,	[9193]	=	true,	[40004]	=	true,
	[23710]	=	true,	[8322]	=	true,	[35529]	=	true,	[35561]	=	true,	[50970]	=	true,
	[2881]	=	true,	[10520]	=	true,	[40005]	=	true,	[10544]	=	true,	[10552]	=	true,
	[10560]	=	true,	[19091]	=	true,	[19107]	=	true,	[32454]	=	true,	[32502]	=	true,
	[28474]	=	true,	[35530]	=	true,	[50971]	=	true,	[62448]	=	true,	[7953]	=	true,
	[41157]	=	true,	[36074]	=	true,	[24846]	=	true,	[35531]	=	true,	[22928]	=	true,
	[28219]	=	true,	[41158]	=	true,	[36075]	=	true,	[32487]	=	true,	[32503]	=	true,
	[7126]	=	true,	[9146]	=	true,	[35532]	=	true,	[35564]	=	true,	[9194]	=	true,
	[9202]	=	true,	[24655]	=	true,	[36076]	=	true,	[24847]	=	true,	[35533]	=	true,
	[5244]	=	true,	[10529]	=	true,	[28220]	=	true,	[19093]	=	true,	[32456]	=	true,
	[52733]	=	true,	[2158]	=	true,	[2160]	=	true,	[2162]	=	true,	[2166]	=	true,
	[24848]	=	true,	[35535]	=	true,	[35567]	=	true,	[28221]	=	true,	[19094]	=	true,
	[44359]	=	true,	[57690]	=	true,	[32457]	=	true,	[32473]	=	true,	[32489]	=	true,
	[9147]	=	true,	[35536]	=	true,	[35568]	=	true,	[9195]	=	true,	[41163]	=	true,
	[6703]	=	true,	[24849]	=	true,	[20853]	=	true,	[10482]	=	true,	[10490]	=	true,
	[28222]	=	true,	[10546]	=	true,	[10554]	=	true,	[41164]	=	true,	[10570]	=	true,
	[19095]	=	true,	[57692]	=	true,	[32458]	=	true,	[10650]	=	true,	[35538]	=	true,
	[42731]	=	true,	[24850]	=	true,	[20854]	=	true,	[44970]	=	true,	[28223]	=	true,
	[19048]	=	true,	[19064]	=	true,	[19080]	=	true,	[57694]	=	true,	[9148]	=	true,
	[35540]	=	true,	[35572]	=	true,	[24851]	=	true,	[20855]	=	true,	[45100]	=	true,
	[10531]	=	true,	[28224]	=	true,	[57696]	=	true,	[10619]	=	true,	[19081]	=	true,
	[22727]	=	true,	[35539]	=	true,	[19079]	=	true,	[10566]	=	true,	[19065]	=	true,
	[10574]	=	true,	[19097]	=	true,	[60647]	=	true,	[3753]	=	true,	[9065]	=	true,
	[44343]	=	true,	[3763]	=	true,	[3767]	=	true,	[3773]	=	true,	[3775]	=	true,
	[3777]	=	true,	[3779]	=	true,	[32455]	=	true,	[24940]	=	true,	[19050]	=	true,
	[19082]	=	true,	[23190]	=	true,	[32461]	=	true,	[60999]	=	true,	[3817]	=	true,
	[44344]	=	true,	[9149]	=	true,	[35544]	=	true,	[9197]	=	true,	[19077]	=	true,
	[9060]	=	true,	[19076]	=	true,	[35573]	=	true,	[40001]	=	true,	[19066]	=	true,
	[19090]	=	true,	[19098]	=	true,	[22711]	=	true,	[57699]	=	true,	[9059]	=	true,
	[32480]	=	true,	[64661]	=	true,	[10562]	=	true,	[40002]	=	true,	[50936]	=	true,
	[6705]	=	true,	[9058]	=	true,	[24703]	=	true,	[22923]	=	true,	[60645]	=	true,
	[35577]	=	true,	[2152]	=	true,	[10556]	=	true,	[10572]	=	true,	[44770]	=	true,
	[36077]	=	true,	[19059]	=	true,	[19075]	=	true,	[35580]	=	true,	[20648]	=	true,
	[2169]	=	true,	[60643]	=	true,	[19088]	=	true,	[6702]	=	true,	[6704]	=	true,
	[35543]	=	true,	[7149]	=	true,	[36078]	=	true,	[36079]	=	true,	[23703]	=	true,
	[35534]	=	true,	[57701]	=	true,	[46135]	=	true,	[19047]	=	true,	[20649]	=	true,
	[40006]	=	true,	[3765]	=	true,	[41156]	=	true,	[3771]	=	true,	[50956]	=	true,
	[19061]	=	true,	[20650]	=	true,	[32467]	=	true,	[35537]	=	true,	[22926]	=	true,
	[4096]	=	true,	[19062]	=	true,	[44768]	=	true,	[35576]	=	true,	[19063]	=	true,
	[9062]	=	true,	[9070]	=	true,	[32495]	=	true,	[171291] =	true,	[171286] =	true,
	[171287] =	true,	[171266] =	true,	[140040] =	true,	[140041] =	true,	[142976] =	true,
	[181415] =	true,	[182121] =	true,	[63195] =	true,	[63196] =	true,	[63197] =	true,
	[63198] =	true,	[63199] = 	true,	[63200] =	true,	[63201] =	true,	[78444] =	true,
	[78445] =	true,	[78446] =	true,	[78447] =	true,	[78448] =	true,	[78449] =	true,
	[78450] =	true,	[78451] =	true,	[78452] =	true,	[78453] =	true,	[78454] =	true,
	[78455] =	true,	[78456] =	true,	[78457] =	true,	[78458] =	true,	[78459] =	true,
	[78460] =	true,	[78461] =	true,	[78462] =	true,	[78463] =	true,	[78464] =	true,
	[78467] =	true,	[78468] =	true,	[78469] =	true,	[78470] =	true,	[78471] =	true,
	[78473] =	true,	[78474] =	true,	[78475] =	true,	[78476] =	true,	[78477] =	true,
	[78478] =	true,	[78479] =	true,	[78480] =	true,	[78481] =	true,	[78482] =	true,
	[78483] =	true,	[78484] =	true,	[78485] =	true,	[78486] =	true,	[78487] =	true,
	[78488] =	true,	[78489] =	true,	[78490] =	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	-----ALCHEMY
	---------------------------------------------------------------------------------------
	[53898]	=	true,	[28579]	=	true,	[17566]	=	true,	[53771]	=	true,	[7256]	=	true,
	[53899]	=	true,	[11452]	=	true,	[11460]	=	true,	[11468]	=	true,	[3170]	=	true,
	[3172]	=	true,	[3174]	=	true,	[3176]	=	true,	[53836]	=	true,	[53900]	=	true,
	[28564]	=	true,	[28580]	=	true,	[54220]	=	true,	[17551]	=	true,	[53773]	=	true,
	[53837]	=	true,	[62213]	=	true,	[54221]	=	true,	[53774]	=	true,	[53838]	=	true,
	[6617]	=	true,	[53902]	=	true,	[28581]	=	true,	[2331]	=	true,	[2335]	=	true,
	[2337]	=	true,	[53775]	=	true,	[53839]	=	true,	[11453]	=	true,	[7836]	=	true,
	[24266]	=	true,	[41500]	=	true,	[53904]	=	true,	[53936]	=	true,	[28566]	=	true,
	[28582]	=	true,	[3452]	=	true,	[3454]	=	true,	[33732]	=	true,	[17553]	=	true,
	[22732]	=	true,	[53777]	=	true,	[53905]	=	true,	[53937]	=	true,	[33733]	=	true,
	[62409]	=	true,	[25146]	=	true,	[41502]	=	true,	[53938]	=	true,	[28551]	=	true,
	[28567]	=	true,	[28583]	=	true,	[62410]	=	true,	[7181]	=	true,	[17570]	=	true,
	[17634]	=	true,	[53779]	=	true,	[7257]	=	true,	[53939]	=	true,	[11478]	=	true,
	[17187]	=	true,	[53812]	=	true,	[28552]	=	true,	[28568]	=	true,	[28584]	=	true,
	[60366]	=	true,	[57425]	=	true,	[17635]	=	true,	[53781]	=	true,	[60367]	=	true,
	[4508]	=	true,	[53782]	=	true,	[24365]	=	true,	[6618]	=	true,	[53942]	=	true,
	[28569]	=	true,	[28585]	=	true,	[29688]	=	true,	[57427]	=	true,	[17556]	=	true,
	[17572]	=	true,	[17636]	=	true,	[53783]	=	true,	[11479]	=	true,	[7837]	=	true,
	[7841]	=	true,	[53784]	=	true,	[24366]	=	true,	[53848]	=	true,	[28554]	=	true,
	[28570]	=	true,	[28586]	=	true,	[58868]	=	true,	[33741]	=	true,	[24367]	=	true,
	[28555]	=	true,	[28571]	=	true,	[17574]	=	true,	[17638]	=	true,	[7258]	=	true,
	[11448]	=	true,	[11456]	=	true,	[11464]	=	true,	[11480]	=	true,	[3171]	=	true,
	[3173]	=	true,	[3175]	=	true,	[24368]	=	true,	[28572]	=	true,	[28588]	=	true,
	[45061]	=	true,	[66658]	=	true,	[17559]	=	true,	[17575]	=	true,	[66659]	=	true,
	[66660]	=	true,	[63732]	=	true,	[28573]	=	true,	[66662]	=	true,	[17560]	=	true,
	[2330]	=	true,	[2332]	=	true,	[2334]	=	true,	[66663]	=	true,	[11457]	=	true,
	[11465]	=	true,	[11473]	=	true,	[66664]	=	true,	[3449]	=	true,	[3451]	=	true,
	[3453]	=	true,	[17561]	=	true,	[17577]	=	true,	[28543]	=	true,	[28575]	=	true,
	[7179]	=	true,	[17562]	=	true,	[17578]	=	true,	[7255]	=	true,	[7259]	=	true,
	[11458]	=	true,	[11466]	=	true,	[38962]	=	true,	[53776]	=	true,	[12609]	=	true,
	[53780]	=	true,	[60893]	=	true,	[58871]	=	true,	[3448]	=	true,	[3450]	=	true,
	[3447]	=	true,	[4942]	=	true,	[28576]	=	true,	[15833]	=	true,	[17576]	=	true,
	[41503]	=	true,	[60350]	=	true,	[41501]	=	true,	[17563]	=	true,	[42736]	=	true,
	[54213]	=	true,	[41458]	=	true,	[6624]	=	true,	[39636]	=	true,	[28577]	=	true,
	[32765]	=	true,	[38070]	=	true,	[17564]	=	true,	[17580]	=	true,	[53895]	=	true,
	[11451]	=	true,	[39637]	=	true,	[28546]	=	true,	[28562]	=	true,	[28578]	=	true,
	[60354]	=	true,	[32766]	=	true,	[17565]	=	true,	[22808]	=	true,	[39639]	=	true,
	[60355]	=	true,	[56519]	=	true,	[156581] =	true,	[156584] =	true,	[156561] =	true,
	[156568] =	true,	[156576] =	true,	[162403] =	true,
	---------------------------------------------------------------------------------------

	---------------------------------------------------------------------------------------
	----ENGINEERING
	---------------------------------------------------------------------------------------
	[23081]	=	true,	[12586]	=	true,	[12594]	=	true,	[12622]	=	true,	[30347]	=	true,
	[44391]	=	true,	[30547]	=	true,	[56464]	=	true,	[12754]	=	true,	[12758]	=	true,
	[23489]	=	true,	[23082]	=	true,	[8243]	=	true,	[9269]	=	true,	[30316]	=	true,
	[30332]	=	true,	[12906]	=	true,	[8339]	=	true,	[26420]	=	true,	[56514]	=	true,
	[39971]	=	true,	[12599]	=	true,	[12603]	=	true,	[12607]	=	true,	[43676]	=	true,
	[12619]	=	true,	[54998]	=	true,	[30349]	=	true,	[56468]	=	true,	[12755]	=	true,
	[12759]	=	true,	[63750]	=	true,	[39973]	=	true,	[56465]	=	true,	[56469]	=	true,
	[30318]	=	true,	[30334]	=	true,	[55016]	=	true,	[12903]	=	true,	[54793]	=	true,
	[19795]	=	true,	[8895]	=	true,	[19819]	=	true,	[30558]	=	true,	[39895]	=	true,
	[23069]	=	true,	[23077]	=	true,	[12596]	=	true,	[30303]	=	true,	[56471]	=	true,
	[12624]	=	true,	[19796]	=	true,	[56472]	=	true,	[12760]	=	true,	[63770]	=	true,
	[23070]	=	true,	[23078]	=	true,	[61471]	=	true,	[30304]	=	true,	[30312]	=	true,
	[12908]	=	true,	[12597]	=	true,	[3930]	=	true,	[24356]	=	true,	[67839]	=	true,
	[67326]	=	true,	[56474]	=	true,	[30560]	=	true,	[30568]	=	true,	[30314]	=	true,
	[3929]	=	true,	[56475]	=	true,	[19830]	=	true,	[3946]	=	true,	[54736]	=	true,
	[30563]	=	true,	[24357]	=	true,	[30337]	=	true,	[12591]	=	true,	[19814]	=	true,
	[60866]	=	true,	[12716]	=	true,	[23071]	=	true,	[23079]	=	true,	[12585]	=	true,
	[3923]	=	true,	[3925]	=	true,	[30305]	=	true,	[12621]	=	true,	[30329]	=	true,
	[3931]	=	true,	[3932]	=	true,	[3933]	=	true,	[3936]	=	true,	[3937]	=	true,
	[3938]	=	true,	[3939]	=	true,	[3941]	=	true,	[56473]	=	true,	[3944]	=	true,
	[3945]	=	true,	[3947]	=	true,	[54999]	=	true,	[3949]	=	true,	[3950]	=	true,
	[26417]	=	true,	[12717]	=	true,	[3954]	=	true,	[3955]	=	true,	[3957]	=	true,
	[3958]	=	true,	[3961]	=	true,	[3962]	=	true,	[3963]	=	true,	[3965]	=	true,
	[3966]	=	true,	[3967]	=	true,	[3968]	=	true,	[3969]	=	true,	[3971]	=	true,
	[3972]	=	true,	[3973]	=	true,	[7430]	=	true,	[3977]	=	true,	[3978]	=	true,
	[3979]	=	true,	[19790]	=	true,	[23080]	=	true,	[12620]	=	true,	[30309]	=	true,
	[30346]	=	true,	[12905]	=	true,	[41307]	=	true,	[8334]	=	true,	[56460]	=	true,
	[56476]	=	true,	[12718]	=	true,	[26418]	=	true,	[19791]	=	true,	[3960]	=	true,
	[19815]	=	true,	[13240]	=	true,	[19831]	=	true,	[30570]	=	true,	[19799]	=	true,
	[30306]	=	true,	[30310]	=	true,	[26011]	=	true,	[36954]	=	true,	[3919]	=	true,
	[3920]	=	true,	[19800]	=	true,	[12617]	=	true,	[30311]	=	true,	[56463]	=	true,
	[72952]	=	true,	[72953]	=	true,	[169078] =	true,	[162218] =	true,	[162205] = 	true,
	[173289] = 	true,	[162210] =	true,	[162209] =	true,	[176732] =	true,	[162202] =	true,
	[162214] =	true,	[169076] =	true,	[169077] =	true,	[177363] =	true,	[177364] =	true,
	[162217] =	true,	[162206] =	true,	[162216] =	true,	[12614] =	true,	[22797] =	true,
	[60867] =	true,	[139176] =	true,	[139192] = 	true,	[139196] =	true,	[139197] =	true,
	[143714] =	true,	[171072] = 	true,	[171073] = 	true,	[171074] = 	true,	[181422] = 	true,
	[181423] = 	true,	[182120] = 	true,
	---------------------------------------------------------------------------------------
}
