--[[
****************************************************************************************

ARLFrame.lua

Frame functions for all of AckisRecipeList

$Date$
$Rev$

****************************************************************************************
]]--

local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local L			= LibStub("AceLocale-3.0"):GetLocale("Ackis Recipe List")

local addon = AckisRecipeList

local string = string
local ipairs = ipairs
local tinsert = tinsert
local CraftIsPetTraining = CraftIsPetTraining

-- used by our frame to maintain the list that will be displayed. will be wiped and recreated
-- anytime CreateFrame is used.
addon.DisplayStrings = {}

-- Some variables I want to use in creating the GUI later... (ZJ 8/26/08)
local ExpButtonText = {
	L["General"],		-- 1
	L["Obtain"],		-- 2
	L["Binding"],		-- 3
	L["Item"],			-- 4
	L["Player"],		-- 5
	L["Reputation"]		-- 6
}
local ExpButtonTT = {
	L["General_TT"],	-- 1
	L["Obtain_TT"],		-- 2
	L["Binding_TT"],	-- 3
	L["Item_TT"],		-- 4
	L["Player_TT"],		-- 5
	L["Reputation_TT"]	-- 6
}
-- Prototype: http://i30.tinypic.com/2hoxncl.jpg
-- I want to turn the GUI into that, but prettier... most functionality is in already, all the tables etc are created, just need to actually use the information now.

-- Calculates the total height of all the recipes in the child frame

local function CalculateChildHeight()

	local tempheight = 0
	local RecipeFrame = AckisRecipeListRecipe1

	while (RecipeFrame ~= nil) do
		tempheight = RecipeFrame:GetHeight() + RecipeFrame.RecipeAcquireText:GetHeight() + tempheight
		RecipeFrame = RecipeFrame.NextRecipe
	end

	return tempheight

end

-- Adds recipe text info to the frames
-- Function to run when the + is clicked in the frame.  Will expand the recipe name and print out how to obtain it.

-- Convert this to use self
local function OnClickExpandRecipe()

	if (this.IsPushed == false) then
		local RecipeText = nil

		local sorttype = addon.db.profile.sortmethod
		if (sorttype == 2) or (sorttype == 3) then
			--RecipeText = string.match(this:GetText(), "|c.*%[.*%]|r %- |c%x*(.*)|r")
			RecipeText = string.match(this:GetText(), "%- |c%x%x%x%x%x%x%x%x(.*)|r$")
		elseif (sorttype == 1) then
			--RecipeText = string.match(this:GetText(), "|c%x*(.*)|r %- |c.*%[.*%]|r")
			RecipeText = string.match(this:GetText(), "|c%x%x%x%x%x%x%x%x(.-)|r")
		end

		-- Changed the graphic of the + to a -
		this:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
		this:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down")
		this:SetHighlightTexture("Interface\\Buttons\\UI-MinusButton-Hilight")

		-- Keep track of button state
		this.IsPushed = true

		-- Show expanded text
		if (addon.RecipeListing[RecipeText] == nil) then
			this.RecipeAcquireText:SetText(addon:White(L["Unknown"]))
		else
			this.RecipeAcquireText:SetText(addon:White("    - " .. addon.RecipeListing[RecipeText]["Acquire"]))
		end

		this.RecipeAcquireText:SetWidth(300)

		this.RecipeAcquireText:Show()

		-- Reposition the next recipe entry
		if (this.NextRecipe ~= nil) then
			this.NextRecipe:ClearAllPoints()
			this.NextRecipe:SetPoint("TOPLEFT", this.RecipeAcquireText, "BOTTOMLEFT", -20, -5)
		end

	else

		-- Changed the graphic of the - to a +
		this:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		this:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
		this:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")

		-- Keep track of button state
		this.IsPushed = false

		-- Hide expanded text
		this.RecipeAcquireText:SetText("")
		this.RecipeAcquireText:Hide()

		-- Reposition the next recipe entry
		if (this.NextRecipe ~= nil) then
			this.NextRecipe:ClearAllPoints()
			this.NextRecipe:SetPoint("TOPLEFT", this, "BOTTOMLEFT", 0, 0)
		end
	end

	addon.Frame.ScrollFrame:UpdateScrollChildRect()

end

-- Adds recipe text info to the frames

local function AddRecipeInfo(CurrentProfession, CurrentProfessionLevel, CurrentSpeciality)

	local OldFrame = nil
	local RecipeFrame = nil
	local RecipeCount = 1
	
	for i, RecipeName in ipairs(addon.SortedRecipeIndex) do

		-- Only display unknown recipes and recipes which are flagged for display
		if (addon.RecipeListing[RecipeName]["Known"] == false) and (addon.RecipeListing[RecipeName]["Display"] == true) then

			-- If the frame isn't created, then create it and set the parameters for it, otherwise use the current frame (recycle it)
			if (not _G["AckisRecipeListRecipe" .. RecipeCount]) then
				RecipeFrame = CreateFrame("Button", "AckisRecipeListRecipe" .. RecipeCount, addon.Frame.ScrollChild, "ClassTrainerSkillButtonTemplate")
				RecipeFrame:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
				RecipeFrame:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
				RecipeFrame:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
				RecipeFrame:SetWidth(18)
				RecipeFrame:SetScript("OnClick",
											OnClickExpandRecipe
									)
				RecipeFrame:SetScript("OnLeave", function()
											GameTooltip:Hide()
										end
							)
				RecipeFrame.IsPushed = false

				-- Create acquire text for the recipe
				RecipeFrame.RecipeAcquireText = RecipeFrame:CreateFontString("AckisRecipeListRecipe" .. RecipeCount .. "Text", "DIALOG")

				RecipeFrame.RecipeAcquireText:ClearAllPoints()
				RecipeFrame.RecipeAcquireText:SetPoint("TOPLEFT", RecipeFrame, "BOTTOMLEFT", 20, 0)
				RecipeFrame.RecipeAcquireText:SetFontObject("GameFontNormalSmall")
				RecipeFrame.RecipeAcquireText:SetJustifyH("LEFT")

			else

				-- Grab the frame from the global stack
				RecipeFrame = _G["AckisRecipeListRecipe" .. RecipeCount]

			end

			-- If we have a previous recipe, set the previous recipe next recipe to this current recipe
			if (OldFrame ~= nil) then
				OldFrame.NextRecipe = RecipeFrame
			end

			-- If we're at the last recipe, set the next reicpe to nil, otherwise set the previous entries nextrecipe to a temp variable.
			local NumMissingRecipes = addon.NumberOfRecipes - addon.FoundRecipes
			if (i == NumMissingRecipes) then
				RecipeFrame.NextRecipe = nil
			else
				OldFrame = RecipeFrame
			end

			RecipeFrame:ClearAllPoints()

			-- If we're on the first recipe, set the points in relation to the main frame, otherwise set them in relation to the previous recipe
			if (RecipeCount == 1) then
				RecipeFrame:SetPoint("TOPLEFT",addon.Frame.ScrollChild,"TOPLEFT",5,0)
			else
				RecipeFrame:SetPoint("TOPLEFT", "AckisRecipeListRecipe" .. (RecipeCount - 1), "BOTTOMLEFT", 0, -1)
			end

			local temprecipetext

			local sorttype = addon.db.profile.sortmethod

			if (sorttype == 2) or (sorttype == 3) then
				if (addon.RecipeListing[RecipeName]["Level"] > CurrentProfessionLevel) then
					temprecipetext = addon:Red("[" .. addon.RecipeListing[RecipeName]["Level"] .. "]") .. " - " .. addon:White(RecipeName)
				else
					temprecipetext = addon:White("[" .. addon.RecipeListing[RecipeName]["Level"] .. "]") .. " - " .. addon:White(RecipeName)
				end
			elseif (sorttype == 1) then
				if (addon.RecipeListing[RecipeName]["Level"] > CurrentProfessionLevel) then
					temprecipetext = addon:White(RecipeName) .. " - " .. addon:Red("[" .. addon.RecipeListing[RecipeName]["Level"] .. "]")
				else
					temprecipetext = addon:White(RecipeName) .. " - " .. addon:White("[" .. addon.RecipeListing[RecipeName]["Level"] .. "]")
				end
			end

			RecipeFrame:SetText(temprecipetext)
			RecipeFrame:SetScript("OnEnter", function(this)
					GameTooltip_SetDefaultAnchor(GameTooltip, this)
					if (addon.RecipeListing[RecipeName]["RecipeLink"] ~= nil) then
						GameTooltip:SetHyperlink(temprecipetext .. addon.br .. addon.RecipeListing[RecipeName]["RecipeLink"] .. addon.br ..  addon.RecipeListing[RecipeName]["Acquire"])
					else
						GameTooltip:SetText(temprecipetext .. addon.br ..  addon.RecipeListing[RecipeName]["Acquire"]) 
					end
					GameTooltip:Show()
				end
			)

			RecipeFrame:Show()
			RecipeCount = RecipeCount + 1
		end
	end

end

-- Closes the frame and cleans sets everything that was displayed to nil

function addon:CloseWindow()

	-- Clean up recipe entries
	local RecipeFrame = AckisRecipeListRecipe1

	-- Clear x number of entries for all missing recipes
	while (RecipeFrame ~= nil) do
		RecipeFrame.RecipeAcquireText:SetText("")
		RecipeFrame.RecipeAcquireText:Hide()

		RecipeFrame:SetText("")
		RecipeFrame:Hide()

		if (RecipeFrame.IsPushed == true) then
			RecipeFrame:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
			RecipeFrame:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
			RecipeFrame:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
			RecipeFrame:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
			RecipeFrame.IsPushed = false
		end

		RecipeFrame.RecipeAcquireText:SetText("")
		RecipeFrame.RecipeAcquireText:Hide()
		RecipeFrame = RecipeFrame.NextRecipe
	end

	addon.Frame:Hide()

	addon.ResetOkayARL = true

	if (addon.ResetOkayBlizz and addon.ResetOkayARL) then
		addon:ResetVariables()
	end

end

-- Expands all the headers

function addon:ExpandAll()

	local frame = _G["AckisRecipeListRecipe1"]

	while (frame) do
		if (frame:IsShown() ~= nil) then
			if (frame.IsPushed == false) then
				frame:Click()
			end
		end
		frame = frame.NextRecipe
	end

end

-- Closes all the headers

function addon:CloseAll()

	local frame = _G["AckisRecipeListRecipe1"]

	while (frame) do
		if (frame:IsShown() ~= nil) then
			if (frame.IsPushed == true) then
				frame:Click()
			end
		end
		frame = frame.NextRecipe
	end

end

-- Create the scan button and add it to Skillet if applicable

function addon:CreateScanButton()
	-- Create the scan button
	if (not addon.ScanButton) then
		addon.ScanButton = CreateFrame("Button","addon.ScanButton",UIParent,"UIPanelButtonTemplate")
	end

	-- Add to Skillet interface
	if (Skillet and Skillet:IsActive()) then
		addon.ScanButton:SetParent(SkilletFrame)
		addon.ScanButton:Show()
		Skillet:AddButtonToTradeskillWindow(addon.ScanButton)
		addon.ScanButton:SetWidth(80)
	end

	-- Set some of the common button properties
	addon.ScanButton:SetHeight(20)
	addon.ScanButton:RegisterForClicks("LeftButtonUp")
	addon.ScanButton:SetScript("OnClick", function()
											addon:ToggleFrame()
										end
							)
	addon.ScanButton:SetScript("OnEnter", function(this)
											GameTooltip_SetDefaultAnchor(GameTooltip, this)
											GameTooltip:SetText(L["Scan Skills Long"])
											GameTooltip:Show()
										end
							)
	addon.ScanButton:SetScript("OnLeave", function()
											GameTooltip:Hide()
										end
							)
	addon.ScanButton:SetText(L["ScanButton"])
	addon.ScanButton:Enable()
end

-- Adds a button to the trade skill/skillet/crafting skill window allowing you to scan

function addon:ShowScanButton()
	-- Add to Fizzwidget Hunter's Helper
	if (FHH_UI and CraftIsPetTraining()) then
		addon.ScanButton:SetParent(FHH_UI)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("RIGHT",FHH_UICloseButton,"LEFT",10,0)
		addon.ScanButton:SetWidth(addon.ScanButton:GetTextWidth() + 10)
	-- Add to ATSW
	elseif (ATSWFrame and not CraftIsPetTraining()) then
		addon.ScanButton:SetParent(ATSWFrame)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("RIGHT", ATSWOptionsButton, "LEFT", 0, 0)
		addon.ScanButton:SetHeight(ATSWOptionsButton:GetHeight())
		addon.ScanButton:SetWidth(80)
	elseif (addon.SkillType == "Trade") then
	-- Anchor to trade window
		addon.ScanButton:SetParent(TradeSkillFrame)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("RIGHT",TradeSkillFrameCloseButton,"LEFT",10,0)
		addon.ScanButton:SetWidth(addon.ScanButton:GetTextWidth() + 10)
	-- Anchor to crafting window
	elseif (addon.SkillType == "Craft") then
		addon.ScanButton:SetParent(CraftFrame)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("RIGHT",CraftFrameCloseButton,"LEFT",10,0)
		addon.ScanButton:SetWidth(addon.ScanButton:GetTextWidth() + 10)
	end
	addon.ScanButton:SetFrameStrata("DIALOG")
	addon.ScanButton:Show()
end

-- imported by Zhinjio from SKG, generic button creation with nice borders
-- automagically takes care of normal button methods. Thanks again, ckk

function addon:TooltipDisplay( this, textLabel )
	this:SetScript( "OnEnter",
		function ( this )
			GameTooltip_SetDefaultAnchor( GameTooltip, this )
			GameTooltip:SetText( textLabel, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b )
			GameTooltip:Show()
		end
	)
	this:SetScript( "OnLeave",
		function( this )
			GameTooltip:Hide()
		end
	)
end

function addon.numFilters ( )
	local total = 0
	local active = 0

	for i = 1, addon.MaxFilterIndex do
		if ( ( addon.FilterValueMap[i].svroot == "disabled" ) or
			 ( addon.FilterValueMap[i].svroot == "special case handler" ) ) then
			-- ignore these filters in the totals
		elseif ( addon.FilterValueMap[i].svroot[ addon.FilterValueMap[i].svval ] == true ) then
			active = active + 1
			total = total + 1
		else
			total = total + 1
		end
	end
	return active, total
end

function addon.resetTitle( )
	-- reset the frame title line
	local myTitle = ""
	if ( addon.Frame._Expanded == true ) then
		local aFil, tFil = addon.numFilters()
		myTitle = addon.ARLTitle .. " - " .. addon.CurrentProfession ..
			" (" .. aFil .. "/" .. tFil .. " " .. L["Filters"] .. ")"
	else
		myTitle = addon.ARLTitle .. " - " .. addon.CurrentProfession
	end
--	addon.Frame.HeadingText:SetText( addon:White( myTitle ) )
	addon.Frame.HeadingText:SetText( addon:Yellow( myTitle ) )
end

function addon.filterSwitch( val )
	-- This function is the all-encompassing checkbox handler for the ZJGUI

	-- Special cases first, then general case
	if ( val == 19 ) then
		-- Armor "All" checkbox
		if ( ARL_ArmorAllCB:GetChecked( ) ) then
			addon.db.profile.filters.item.armor.cloth = true
			addon.db.profile.filters.item.armor.leather = true
			addon.db.profile.filters.item.armor.mail = true
			addon.db.profile.filters.item.armor.plate = true
			addon.db.profile.filters.item.armor.cloak = true
			addon.db.profile.filters.item.armor.necklace = true
			addon.db.profile.filters.item.armor.ring = true
			addon.db.profile.filters.item.armor.trinket = true
			ARL_ArmorClothCB:SetChecked( true )
			ARL_ArmorLeatherCB:SetChecked( true )
			ARL_ArmorMailCB:SetChecked( true )
			ARL_ArmorPlateCB:SetChecked( true )
			ARL_ArmorCloakCB:SetChecked( true )
			ARL_ArmorNecklaceCB:SetChecked( true )
			ARL_ArmorRingCB:SetChecked( true )
			ARL_ArmorTrinketCB:SetChecked( true )
			ARL_ArmorNoneCB:SetChecked( false )
		end
	elseif ( val == 20 ) then
		-- Armor "None" checkbox
		if ( ARL_ArmorNoneCB:GetChecked( ) ) then
			addon.db.profile.filters.item.armor.cloth = false
			addon.db.profile.filters.item.armor.leather = false
			addon.db.profile.filters.item.armor.mail = false
			addon.db.profile.filters.item.armor.plate = false
			addon.db.profile.filters.item.armor.cloak = false
			addon.db.profile.filters.item.armor.necklace = false
			addon.db.profile.filters.item.armor.ring = false
			addon.db.profile.filters.item.armor.trinket = false
			ARL_ArmorClothCB:SetChecked( false )
			ARL_ArmorLeatherCB:SetChecked( false )
			ARL_ArmorMailCB:SetChecked( false )
			ARL_ArmorPlateCB:SetChecked( false )
			ARL_ArmorCloakCB:SetChecked( false )
			ARL_ArmorNecklaceCB:SetChecked( false )
			ARL_ArmorRingCB:SetChecked( false )
			ARL_ArmorTrinketCB:SetChecked( false )
			ARL_ArmorAllCB:SetChecked( false )
		end
	elseif ( ( val == 21 ) or ( val == 22 ) or ( val == 23 ) or ( val == 24 ) or
			 ( val == 64 ) or ( val == 65 ) or ( val == 66 ) or ( val == 67 ) ) then
		-- in this case, we need to check if the checkbox we just hit either
		-- makes everthing checked, or everything empty. If so, we check the All/None
		-- checkboxes
		if ( addon.FilterValueMap[val].cb:GetChecked() ) then
			addon.FilterValueMap[val].svroot[ addon.FilterValueMap[val].svval ] = true
			if ( ( addon.db.profile.filters.item.armor.cloth == true ) and
				 ( addon.db.profile.filters.item.armor.leather == true ) and
				 ( addon.db.profile.filters.item.armor.mail == true ) and
				 ( addon.db.profile.filters.item.armor.plate == true ) and
				 ( addon.db.profile.filters.item.armor.cloak == true ) and
				 ( addon.db.profile.filters.item.armor.necklace == true ) and
				 ( addon.db.profile.filters.item.armor.ring == true ) and
				 ( addon.db.profile.filters.item.armor.trinket == true ) ) then
				ARL_ArmorAllCB:SetChecked( true )
			end
			ARL_ArmorNoneCB:SetChecked( false )
		else
			addon.FilterValueMap[val].svroot[ addon.FilterValueMap[val].svval ] = false
			if ( ( addon.db.profile.filters.item.armor.cloth == false ) and
				 ( addon.db.profile.filters.item.armor.leather == false ) and
				 ( addon.db.profile.filters.item.armor.mail == false ) and
				 ( addon.db.profile.filters.item.armor.plate == false ) and
				 ( addon.db.profile.filters.item.armor.cloak == false ) and
				 ( addon.db.profile.filters.item.armor.necklace == false ) and
				 ( addon.db.profile.filters.item.armor.ring == false ) and
				 ( addon.db.profile.filters.item.armor.trinket == false ) ) then
				ARL_ArmorNoneCB:SetChecked( true )
			end
			ARL_ArmorAllCB:SetChecked( false )
		end
	elseif ( val == 25 ) then
		-- Weapon "All" special case
		if ( ARL_WeaponAllCB:GetChecked() ) then
			addon.db.profile.filters.item.weapon.onehand = true
			addon.db.profile.filters.item.weapon.twohand = true
			addon.db.profile.filters.item.weapon.dagger = true
			addon.db.profile.filters.item.weapon.axe = true
			addon.db.profile.filters.item.weapon.mace = true
			addon.db.profile.filters.item.weapon.sword = true
			addon.db.profile.filters.item.weapon.polearm = true
			addon.db.profile.filters.item.weapon.wand = true
			addon.db.profile.filters.item.weapon.thrown = true
			addon.db.profile.filters.item.weapon.ammo = true
			ARL_Weapon1HCB:SetChecked( true )
			ARL_Weapon2HCB:SetChecked( true )
			ARL_WeaponDaggerCB:SetChecked( true )
			ARL_WeaponAxeCB:SetChecked( true )
			ARL_WeaponMaceCB:SetChecked( true )
			ARL_WeaponSwordCB:SetChecked( true )
			ARL_WeaponPolearmCB:SetChecked( true )
			ARL_WeaponWandCB:SetChecked( true )
			ARL_WeaponThrownCB:SetChecked( true )
			ARL_WeaponAmmoCB:SetChecked( true )
			ARL_WeaponNoneCB:SetChecked( false )
		end
	elseif ( val == 26 ) then
		-- Weapon "None" special case
		if ( ARL_WeaponNoneCB:GetChecked() ) then
			addon.db.profile.filters.item.weapon.onehand = false
			addon.db.profile.filters.item.weapon.twohand = false
			addon.db.profile.filters.item.weapon.dagger = false
			addon.db.profile.filters.item.weapon.axe = false
			addon.db.profile.filters.item.weapon.mace = false
			addon.db.profile.filters.item.weapon.sword = false
			addon.db.profile.filters.item.weapon.polearm = false
			addon.db.profile.filters.item.weapon.wand = false
			addon.db.profile.filters.item.weapon.thrown = false
			addon.db.profile.filters.item.weapon.ammo = false
			ARL_Weapon1HCB:SetChecked( false )
			ARL_Weapon2HCB:SetChecked( false )
			ARL_WeaponDaggerCB:SetChecked( false )
			ARL_WeaponAxeCB:SetChecked( false )
			ARL_WeaponMaceCB:SetChecked( false )
			ARL_WeaponSwordCB:SetChecked( false )
			ARL_WeaponPolearmCB:SetChecked( false )
			ARL_WeaponWandCB:SetChecked( false )
			ARL_WeaponThrownCB:SetChecked( false )
			ARL_WeaponAmmoCB:SetChecked( false )
			ARL_WeaponAllCB:SetChecked( false )
		end
	elseif ( ( val == 34 ) or ( val == 36 ) or ( val == 37 ) ) then
		-- Weapon disable case ... there's really no way to reach this code
	elseif ( ( val == 27 ) or ( val == 28 ) or ( val == 29 ) or ( val == 30 ) or ( val == 31 ) or
			 ( val == 32 ) or ( val == 33 ) or ( val == 68 ) or ( val == 35 ) or ( val == 38 ) ) then
		-- we've clicked on a weapon thinger. If all of them are either checked or unchecked,
		-- we should automagically check the "All" or "None" checkbox
		if ( addon.FilterValueMap[val].cb:GetChecked() ) then
			addon.FilterValueMap[val].svroot[ addon.FilterValueMap[val].svval ] = true
			if ( ( addon.db.profile.filters.item.weapon.onehand == true ) and
				 ( addon.db.profile.filters.item.weapon.twohand == true ) and
				 ( addon.db.profile.filters.item.weapon.dagger == true ) and
				 ( addon.db.profile.filters.item.weapon.axe == true ) and
				 ( addon.db.profile.filters.item.weapon.mace == true ) and
				 ( addon.db.profile.filters.item.weapon.sword == true ) and
				 ( addon.db.profile.filters.item.weapon.polearm == true ) and
				 ( addon.db.profile.filters.item.weapon.wand == true ) and
				 ( addon.db.profile.filters.item.weapon.thrown == true ) and
				 ( addon.db.profile.filters.item.weapon.ammo == true ) ) then
				ARL_WeaponAllCB:SetChecked( true )
			end
			ARL_WeaponNoneCB:SetChecked( false )
		else
			addon.FilterValueMap[val].svroot[ addon.FilterValueMap[val].svval ] = false
			if ( ( addon.db.profile.filters.item.weapon.onehand == false ) and
				 ( addon.db.profile.filters.item.weapon.twohand == false ) and
				 ( addon.db.profile.filters.item.weapon.dagger == false ) and
				 ( addon.db.profile.filters.item.weapon.axe == false ) and
				 ( addon.db.profile.filters.item.weapon.mace == false ) and
				 ( addon.db.profile.filters.item.weapon.sword == false ) and
				 ( addon.db.profile.filters.item.weapon.polearm == false ) and
				 ( addon.db.profile.filters.item.weapon.wand == false ) and
				 ( addon.db.profile.filters.item.weapon.thrown == false ) and
				 ( addon.db.profile.filters.item.weapon.ammo == false ) ) then
				ARL_WeaponNoneCB:SetChecked( true )
			end
			ARL_WeaponAllCB:SetChecked( false )
		end
	else
		-- General case
		if ( addon.FilterValueMap[val].cb:GetChecked() ) then
			addon.FilterValueMap[val].svroot[ addon.FilterValueMap[val].svval ] = true
		else
			addon.FilterValueMap[val].svroot[ addon.FilterValueMap[val].svval ] = false
		end
	end

	addon.resetTitle()
end

function addon.ToggleFilters( )
	local xPos = addon.Frame:GetLeft()
	local yPos = addon.Frame:GetBottom()
	if ( addon.Frame._Expanded == true ) then
		-- Adjust the frame size and texture
--		addon.Frame:Hide()
		addon.Frame:ClearAllPoints()
		addon.Frame:SetWidth(293)
		addon.Frame:SetHeight(447)
		addon.bgTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\main]] )
		addon.bgTexture:SetAllPoints( addon.Frame )
		addon.bgTexture:SetTexCoord( 0, (293/512), 0, (447/512) )
		addon.Frame._Expanded = false
		addon.Frame:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", xPos, yPos )
		-- Change the text and tooltip for the filter button
		ARL_FilterButton:SetText( L["FILTER_OPEN"] )
		addon:TooltipDisplay( ARL_FilterButton, L["FILTER_OPEN_TT"] )

		-- Hide my 5 buttons
		ARL_ExpGeneralOptCB:Hide()
		ARL_ExpObtainOptCB:Hide()
		ARL_ExpBindingOptCB:Hide()
		ARL_ExpItemOptCB:Hide()
		ARL_ExpPlayerOptCB:Hide()
		ARL_ExpRepOptCB:Hide()
		-- uncheck them as well
		ARL_ExpGeneralOptCB:SetChecked( false )
		ARL_ExpObtainOptCB:SetChecked( false )
		ARL_ExpBindingOptCB:SetChecked( false )
		ARL_ExpItemOptCB:SetChecked( false )
		ARL_ExpPlayerOptCB:SetChecked( false )
		ARL_ExpRepOptCB:SetChecked( false )
		-- hide the flyaway
		addon.Flyaway:Hide()

		ARL_ResetButton:Hide()
		ARL_ApplyButton:Hide()

		-- and finally, show our frame
--		addon.Frame:Show()
	else
		-- Adjust the frame size and texture
--		addon.Frame:Hide()
		addon.Frame:ClearAllPoints()
		addon.Frame:SetWidth(444)
		addon.Frame:SetHeight(447)
		addon.bgTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\expanded]] )
		addon.bgTexture:SetAllPoints( addon.Frame )
		addon.bgTexture:SetTexCoord( 0, (444/512), 0, (447/512) )
		addon.Frame._Expanded = true
		addon.Frame:SetPoint( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", xPos, yPos )
		-- Change the text and tooltip for the filter button
		ARL_FilterButton:SetText( L["FILTER_CLOSE"] )
		addon:TooltipDisplay( ARL_FilterButton, L["FILTER_CLOSE_TT"] )

		-- Show my 5 buttons
		ARL_ExpGeneralOptCB:Show()
		ARL_ExpObtainOptCB:Show()
		ARL_ExpBindingOptCB:Show()
		ARL_ExpItemOptCB:Show()
		ARL_ExpPlayerOptCB:Show()
		ARL_ExpRepOptCB:Show()

		ARL_ResetButton:Show()
		ARL_ApplyButton:Show()

		-- and finally, show our frame
--		addon.Frame:Show()
	end
	-- Reset our title
	addon.resetTitle()
end

function addon:GenericMakeCB( cButton, anchorFrame, ttText, scriptVal, row, col, logo  )
	local pushdown = {
		[64] = 1, [65] = 1, [66] = 1, [67] = 1, [25] = 1, [26] = 1, [27] = 1, [28] = 1, [29] = 1,
		[30] = 1, [31] = 1, [32] = 1, [33] = 1, [34] = 1, [68] = 1, [35] = 1, [36] = 1, [37] = 1,
		[38] = 1,
	}
	-- set the position of the new checkbox
	local xPos = 2 + ( ( col - 1 ) * 100 )
	local yPos = -3 - ( ( row - 1 ) * 17 )
	if ( pushdown[scriptVal] ) then yPos = yPos - 5 end
	cButton:SetPoint( "TOPLEFT", anchorFrame, "TOPLEFT", xPos, yPos )

	-- depending if we're on the rep logo thingers or not, set the height and an OnClick method
	if ( logo == 0 ) then
		cButton:SetHeight( 24 )
		cButton:SetWidth( 24 )
		cButton:SetScript( "OnClick", function() addon.filterSwitch( scriptVal ) end )
	else
		cButton:SetHeight( 46 )
		cButton:SetWidth( 100 )
		cButton:SetScript( "OnClick", function() addon.filterSwitch( scriptVal ) end )
	end

	addon:TooltipDisplay( cButton, ttText, 1 )
end

function addon:GenericCreateButton(
	bName, parentFrame,	bHeight, bWidth,
	anchorFrom, anchorFrame, anchorTo, xOffset, yOffset,
	bNormFont, bHighFont, initText, tAlign, tooltipText, noTextures )

	-- I hate stretchy buttons. Thanks very much to ckknight for this code
	-- (found in RockConfig)

	-- when pressed, the button should look pressed
	local function button_OnMouseDown(this)
		if this:IsEnabled() == 1 then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
		end
	end
	-- when depressed, return to normal
	local function button_OnMouseUp(this)
		if this:IsEnabled() == 1 then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		end
	end

	local function button_Disable(this)
		this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this:__Disable()
		this:EnableMouse(false)
	end

	local function button_Enable(this)
		this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this:__Enable()
		this:EnableMouse(true)
	end

	local button = CreateFrame( "Button", bName, parentFrame )

	button:SetWidth( bWidth )
	button:SetHeight( bHeight )

	if ( noTextures == 1 ) then
		local left = button:CreateTexture(button:GetName() .. "_LeftTexture", "BACKGROUND")
		button.left = left
		local middle = button:CreateTexture(button:GetName() .. "_MiddleTexture", "BACKGROUND")
		button.middle = middle
		local right = button:CreateTexture(button:GetName() .. "_RightTexture", "BACKGROUND")
		button.right = right

		left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])

		left:SetPoint("TOPLEFT")
		left:SetPoint("BOTTOMLEFT")
		left:SetWidth(12)
		left:SetTexCoord(0, 0.09375, 0, 0.6875)

		right:SetPoint("TOPRIGHT")
		right:SetPoint("BOTTOMRIGHT")
		right:SetWidth(12)
		right:SetTexCoord(0.53125, 0.625, 0, 0.6875)

		middle:SetPoint("TOPLEFT", left, "TOPRIGHT")
		middle:SetPoint("BOTTOMRIGHT", right, "BOTTOMLEFT")
		middle:SetTexCoord(0.09375, 0.53125, 0, 0.6875)

		button:SetScript("OnMouseDown", button_OnMouseDown)
		button:SetScript("OnMouseUp", button_OnMouseUp)
		button:SetScript("OnEnter", SubControl_OnEnter)
		button:SetScript("OnLeave", SubControl_OnLeave)

		button.__Enable = button.Enable
		button.__Disable = button.Disable
		button.Enable = button_Enable
		button.Disable = button_Disable

		local highlight = button:CreateTexture(button:GetName() .. "_Highlight", "OVERLAY", "UIPanelButtonHighlightTexture")
		button:SetHighlightTexture(highlight)
	elseif ( noTextures == 2 ) then
		button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		button:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
		button:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		button:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
	elseif ( noTextures == 3 ) then
		button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Hilight")
		button:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disable")
	end

	local text = button:CreateFontString(button:GetName() .. "_FontString", "ARTWORK")
	button:SetFontString(text)
	button.text = text
	text:SetPoint("LEFT", button, "LEFT", 7, 0)
	text:SetPoint("RIGHT", button, "RIGHT", -7, 0)
	text:SetJustifyH( tAlign )

	text:SetFontObject(bNormFont)
--	text:SetHighlightFontObject(bHighFont)
--	text:SetDisabledFontObject(GameFontDisableSmall)

	text:SetText( initText )		

	button:SetPoint( anchorFrom, anchorFrame, anchorTo, xOffset, yOffset )
	if ( tooltipText ~= "" ) then
		addon:TooltipDisplay( button, tooltipText)
	end

	return button
end

-- Generic function for creating my expanded panel buttons
function addon:CreateExpCB( bName, bTex, panelIndex )
	if ( ( bName == "ARL_RepOldWorldCB" ) or ( bName == "ARL_RepBCCB" ) ) then
		local cButton = CreateFrame( "CheckButton", bName, addon.Fly_Rep ) -- , "UICheckButtonTemplate" )
			cButton:SetWidth( 100 )
			cButton:SetHeight( 46 )
			cButton:SetChecked( false )
	
		local iconTex = cButton:CreateTexture( cButton:GetName() .. "buttonTex", "BORDER" )
			iconTex:SetTexture( 'Interface/Glues/Common/' .. bTex )
			iconTex:SetWidth( 100 )
			iconTex:SetHeight( 46 )
			iconTex:SetAllPoints( cButton )

		local pushedTexture = cButton:CreateTexture( cButton:GetName() .. "pTex", "ARTWORK" )
			pushedTexture:SetTexture( 'Interface/Buttons/UI-Quickslot-Depress' )
			pushedTexture:SetAllPoints( cButton )
			cButton:SetPushedTexture( pushedTexture )
		local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture( 'Interface/Buttons/ButtonHilight-Square' )
			highlightTexture:SetAllPoints( cButton )
			highlightTexture:SetBlendMode( 'ADD' )
			cButton:SetHighlightTexture( highlightTexture )
		local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture( 'Interface/Buttons/CheckButtonHilight' )
			checkedTexture:SetAllPoints( cButton )
			checkedTexture:SetBlendMode( 'ADD' )
			cButton:SetCheckedTexture( checkedTexture )

		-- And throw up a tooltip
		if ( bName == "ARL_RepOldWorldCB" ) then
			addon:TooltipDisplay( cButton, L["OLD_WORLD_REP_TT"] )
		else
			addon:TooltipDisplay( cButton, L["BC_REP_TT"] )
		end
			
		return cButton
	else 
		local cButton = CreateFrame( "CheckButton", bName, addon.Frame ) -- , "UICheckButtonTemplate" )
			cButton:SetWidth( addon.ExpTextureSize )
			cButton:SetHeight( addon.ExpTextureSize )
			cButton:SetScript( "OnClick", function() 
				addon.DoFlyaway( panelIndex )
			end )

		local bgTex = cButton:CreateTexture( cButton:GetName() .. "bgTex", "BACKGROUND" )
			bgTex:SetTexture( 'Interface/SpellBook/UI-Spellbook-SpellBackground' )
			bgTex:SetHeight( addon.ExpTextureSize + 6 )
			bgTex:SetWidth( addon.ExpTextureSize + 4 )
			bgTex:SetTexCoord( 0, (43/64), 0, (43/64) )
			bgTex:SetPoint( "CENTER", cButton, "CENTER", 0, 0 )
		local iconTex = cButton:CreateTexture( cButton:GetName() .. "iconTex", "BORDER" )
			iconTex:SetTexture( 'Interface/Icons/' .. bTex )
			iconTex:SetAllPoints( cButton )
		local pushedTexture = cButton:CreateTexture( cButton:GetName() .. "pTex", "ARTWORK" )
			pushedTexture:SetTexture( 'Interface/Buttons/UI-Quickslot-Depress' )
			pushedTexture:SetAllPoints( cButton )
			cButton:SetPushedTexture( pushedTexture )
		local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture( 'Interface/Buttons/ButtonHilight-Square' )
			highlightTexture:SetAllPoints( cButton )
			highlightTexture:SetBlendMode( 'ADD' )
			cButton:SetHighlightTexture( highlightTexture )
		local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture( 'Interface/Buttons/CheckButtonHilight' )
			checkedTexture:SetAllPoints( cButton )
			checkedTexture:SetBlendMode( 'ADD' )
			cButton:SetCheckedTexture( checkedTexture )
		-- Create the text object to go along with it
		local cbText = cButton:CreateFontString( "cbText", "OVERLAY", "GameFontHighlight" )
			cbText:SetText( addon:Yellow( ExpButtonText[panelIndex] ) )
			cbText:SetPoint( "LEFT", cButton, "RIGHT", 5, 0 )
			cbText:SetHeight( 14 )
			cbText:SetWidth( 100 )
			cbText:SetJustifyH( "LEFT" )
			cButton.text = cbText

		-- And throw up a tooltip
		addon:TooltipDisplay( cButton, ExpButtonTT[panelIndex] )
		cButton:Hide()
		return cButton
	end
end

-- Allows the scan button to close the scan window

function addon:ToggleFrame()
	if (addon.Frame and addon.Frame:IsVisible()) then
		addon.Frame:Hide()
	else
		addon:AckisRecipeList_Command()
	end
end

-- Set the texture on the switcher button.

function addon.SetSwitcherTexture( tex )
-- This is really only called the first
-- time its displayed. It should reflect the first profession the user has 
-- selected, or that shows up in his lists.

-- For now, just display the first texture
	local ARL_S_NTexture = ARL_SwitcherButton:CreateTexture( "ARL_S_NTexture", "BACKGROUND" )
	ARL_S_NTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_up]] )
	ARL_S_NTexture:SetTexCoord( 0, 1, 0, 1 )
	ARL_S_NTexture:SetAllPoints( ARL_SwitcherButton )
	local ARL_S_PTexture = ARL_SwitcherButton:CreateTexture( "ARL_S_PTexture", "BACKGROUND" )
	ARL_S_PTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_down]] )
	ARL_S_PTexture:SetTexCoord( 0, 1, 0, 1 )
	ARL_S_PTexture:SetAllPoints( ARL_SwitcherButton )
	local ARL_S_DTexture = ARL_SwitcherButton:CreateTexture( "ARL_S_DTexture", "BACKGROUND" )
	ARL_S_DTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_up]] )
	ARL_S_DTexture:SetTexCoord( 0, 1, 0, 1 )
	ARL_S_DTexture:SetAllPoints( ARL_SwitcherButton )

	ARL_SwitcherButton:SetNormalTexture( ARL_S_NTexture )
	ARL_SwitcherButton:SetPushedTexture( ARL_S_PTexture )
	ARL_SwitcherButton:SetDisabledTexture( ARL_S_DTexture )
end

-- Switch the displayed profession in the main panel

function addon.SwitchProfs()
	-- Figure out what professions we know...
	addon:GetKnownProfessions()

	-- This loop is gonna be weird. The reason is because we need to
	-- ensure that we cycle through all the known professions, but also
	-- that we do so in order. That means that if the currently displayed
	-- profession is the last one in the list, we're actually going to
	-- iterate completely once to get to the currently displayed profession
	-- and then iterate again to make sure we display the next one in line.
	-- Further, there is the nuance that the person may not know any
	-- professions yet at all. User are so annoying.
	local startLoop = 0
	local endLoop = 0
	local displayProf = 0

	-- ok, so first off, if we've never done this before, there is no "current"
	-- and a single iteration will do nicely, thank you
	if ( addon.CurrentProf == 0 ) then
		startLoop = 1
		endLoop = addon.MaxProfessions + 1
	else
		startLoop = addon.CurrentProf + 1
		endLoop = addon.CurrentProf
	end
	local index = startLoop
	while ( index ~= endLoop ) do
		if ( index > addon.MaxProfessions ) then
			index = 1
		else
			if ( addon.KnownProfessions[addon.SortedProfessions[index].name] == true ) then
				displayProf = index
				addon.CurrentProf = index
				break
			else
				index = index + 1
			end
		end
	end
	-- Redisplay the button with the new skill
	addon.SetSwitcherTexture( addon.SortedProfessions[addon.CurrentProf].texture )
end

-- What to do if someone clicks on a recipe button
function addon.RecipeItem_OnClick( button )
	local clickedIndex = addon.RecipeListButton[button].sI
	local isRecipe = addon.DisplayStrings[clickedIndex].IsRecipe
	local isExpanded = addon.DisplayStrings[clickedIndex].IsExpanded
	local dString = addon.DisplayStrings[clickedIndex].String
	local traverseIndex = 0
	-- three possibilities here
	-- 1) We clicked on the recipe button on a closed recipe
	-- 2) We clicked on the recipe button of an open recipe
	-- 3) we clicked on the expanded text of an open recipe
	if ( isRecipe ) then
		if ( isExpanded ) then
			-- get rid of our expanded lines
			traverseIndex = clickedIndex + 1
			while ( addon.DisplayStrings[traverseIndex].IsRecipe == false ) do
				tremove( addon.DisplayStrings, traverseIndex )
			end
			addon.DisplayStrings[clickedIndex].IsExpanded = false
		else
			-- add in our expanded lines
			-- for the moment, just add the acquire text without parsing out \n's
			local insertIndex = clickedIndex + 1
			local t = {}
			t.String = addon.RecipeListing[dString]["Acquire"]
			t.IsRecipe = false
			t.IsExpanded = true
			tinsert( addon.DisplayStrings, insertIndex, t )
			-- set our current recipe to expanded
			addon.DisplayStrings[clickedIndex].IsExpanded = true
		end
	else
		-- this inherently implies that we're on an expanded recipe
		-- first, back up in the list of buttons until we find our recipe line
		traverseIndex = clickedIndex - 1
		while ( addon.DisplayStrings[traverseIndex].IsRecipe == false ) do
			traverseIndex = traverseIndex - 1
		end
		-- unexpand it
		addon.DisplayStrings[traverseIndex].IsExpanded = false
		-- now remove the expanded lines until we get to a recipe again
		traverseIndex = traverseIndex + 1
		while ( addon.DisplayStrings[traverseIndex].IsRecipe == false ) do
			tremove( addon.DisplayStrings, traverseIndex )
		end
	end
	-- finally, call our scrollframe updater
	addon.RecipeList_Update()
end

-- Scrollframe update stuff
function addon.RecipeList_Update()
	-- Clear out the current buttons
	for i = 1, addon.maxVisibleRecipes do
		addon.RecipeListButton[i]:SetText( "" )
		addon.RecipeListButton[i].sI = 0
		addon.PlusListButton[i]:Hide()
	end
	local entries = #addon.DisplayStrings

	FauxScrollFrame_Update( ARL_RecipeScrollFrame, entries, addon.maxVisibleRecipes, 16 )

	-- addon.Print( "in rlu")
	-- now fill in our buttons
	local listOffset = FauxScrollFrame_GetOffset( ARL_RecipeScrollFrame )
	-- addon.Print( "listOffset = " .. listOffset)
	local buttonIndex = 1
	local stringsIndex = buttonIndex + listOffset

	local stayInLoop = true
	while ( stayInLoop == true ) do
		-- addon.Print( "buttonIndex/stringsIndex = " .. buttonIndex .. "/" .. stringsIndex )
		-- addon.PlusListButton = {},  addon.RecipeListButton = {}
		if ( addon.DisplayStrings[stringsIndex].IsRecipe ) then
			-- display the + symbol
			addon.PlusListButton[buttonIndex]:Show()
			-- Is it expanded or not?
			if ( addon.DisplayStrings[stringsIndex].IsExpanded ) then
				addon.PlusListButton[buttonIndex]:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
				addon.PlusListButton[buttonIndex]:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down")
				addon.PlusListButton[buttonIndex]:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
				addon.PlusListButton[buttonIndex]:SetDisabledTexture("Interface\\Buttons\\UI-MinusButton-Disabled")
			else
				addon.PlusListButton[buttonIndex]:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
				addon.PlusListButton[buttonIndex]:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
				addon.PlusListButton[buttonIndex]:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
				addon.PlusListButton[buttonIndex]:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
			end
		else
			addon.PlusListButton[buttonIndex]:Hide()
		end
		addon.RecipeListButton[buttonIndex]:SetText( addon.DisplayStrings[stringsIndex].String )
		addon.RecipeListButton[buttonIndex].sI = stringsIndex
		buttonIndex = buttonIndex + 1
		stringsIndex = stringsIndex + 1
		if ( ( buttonIndex > addon.maxVisibleRecipes ) or
			 ( stringsIndex > entries ) ) then
			stayInLoop = false
		end
	end
end

-- Rep Filtering panel switcher
function addon.RepFilterSwitch( whichrep )
	-- only have two to deal with at the moment
	-- 1	ARL_RepOldWorldCB		Old World Rep
	-- 2	ARL_RepBCCB				Burning Crusade
	-- 3	Wrath of the Lich King (soon)
	local ShowPanel = false
	if ( whichrep == 1 ) then
		if ( ARL_RepOldWorldCB:GetChecked() ) then
			ShowPanel = true
			addon.Fly_Rep_OW:Show()
			addon.Fly_Rep_BC:Hide()
			ARL_RepBCCB:SetChecked( false )
		else
			ShowPanel = false
		end
	elseif ( whichrep == 2 ) then
		if ( ARL_RepBCCB:GetChecked() ) then
			ShowPanel = true
			addon.Fly_Rep_OW:Hide()
			addon.Fly_Rep_BC:Show()
			ARL_RepOldWorldCB:SetChecked( false )
		else
			ShowPanel = false
		end
	end
	if ( ShowPanel == true ) then
		addon.flyTexture:ClearAllPoints()
		addon.Flyaway:SetWidth(296)
		addon.Flyaway:SetHeight(312)
		addon.flyTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\fly_repcol]] )
		addon.flyTexture:SetAllPoints( addon.Flyaway )
		addon.flyTexture:SetTexCoord( 0, (296/512), 0, (312/512) )

		addon.Fly_Rep_OW:SetPoint( "TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -20 )
		addon.Fly_Rep_BC:SetPoint( "TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -20 )
else
		addon.flyTexture:ClearAllPoints()
		addon.Flyaway:SetWidth(136)
		addon.Flyaway:SetHeight(312)
		addon.flyTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\fly_1col]] )
		addon.flyTexture:SetAllPoints( addon.Flyaway )
		addon.flyTexture:SetTexCoord( 0, (136/256), 0, (312/512) )
		addon.Fly_Rep_OW:Hide()
		addon.Fly_Rep_BC:Hide()
		ARL_RepBCCB:SetChecked( false )
		ARL_RepOldWorldCB:SetChecked( false )
	end
end

function addon.setFlyawayState ( ) 
	-- This function sets all the current options in the flyaway panel to make
	-- sure they are consistent with the SV options. This is run every time the
	-- Flyaway panel "OnShow" triggers

	-- General Options
	ARL_ClassCB:SetChecked( addon.db.profile.filters.general.class )
	ARL_SpecialtyCB:SetChecked( addon.db.profile.filters.general.specialty )
	ARL_LevelCB:SetChecked( addon.db.profile.filters.general.skill )
	ARL_FactionCB:SetChecked( addon.db.profile.filters.general.faction )
	ARL_KnownCB:SetChecked( addon.db.profile.filters.general.known )
	ARL_UnknownCB:SetChecked( addon.db.profile.filters.general.unknown )
	-- Obtain Options
	ARL_InstanceCB:SetChecked( addon.db.profile.filters.obtain.instance )
	ARL_RaidCB:SetChecked( addon.db.profile.filters.obtain.raid )
	ARL_QuestCB:SetChecked( addon.db.profile.filters.obtain.quest )
	ARL_SeasonalCB:SetChecked( addon.db.profile.filters.obtain.seasonal )
	ARL_TrainerCB:SetChecked( addon.db.profile.filters.obtain.trainer )
	ARL_VendorCB:SetChecked( addon.db.profile.filters.obtain.vendor )
	ARL_PVPCB:SetChecked( addon.db.profile.filters.obtain.pvp )
	ARL_DiscoveryCB:SetChecked( addon.db.profile.filters.obtain.discovery )
	ARL_WorldDropCB:SetChecked( addon.db.profile.filters.obtain.worlddrop )
	ARL_MobDropCB:SetChecked( addon.db.profile.filters.obtain.mobdrop )
	-- Binding Options
	ARL_iBoECB:SetChecked( addon.db.profile.filters.binding.itemboe )
	ARL_iBoPCB:SetChecked( addon.db.profile.filters.binding.itembop )
	ARL_rBoECB:SetChecked( addon.db.profile.filters.binding.recipeboe )
	ARL_rBoPCB:SetChecked( addon.db.profile.filters.binding.recipebop )
	-- Armor Options
	if ( ( addon.db.profile.filters.item.armor.cloth == true ) and
		 ( addon.db.profile.filters.item.armor.leather == true ) and
		 ( addon.db.profile.filters.item.armor.mail == true ) and
		 ( addon.db.profile.filters.item.armor.plate == true ) and
		 ( addon.db.profile.filters.item.armor.cloak == true ) and
		 ( addon.db.profile.filters.item.armor.necklace == true ) and
		 ( addon.db.profile.filters.item.armor.ring == true ) and
		 ( addon.db.profile.filters.item.armor.trinket == true ) ) then
		ARL_ArmorAllCB:SetChecked( true )
	else
		ARL_ArmorAllCB:SetChecked( false )
	end
	if ( ( addon.db.profile.filters.item.armor.cloth == false ) and
		 ( addon.db.profile.filters.item.armor.leather == false ) and
		 ( addon.db.profile.filters.item.armor.mail == false ) and
		 ( addon.db.profile.filters.item.armor.plate == false ) and
		 ( addon.db.profile.filters.item.armor.cloak == false ) and
		 ( addon.db.profile.filters.item.armor.necklace == false ) and
		 ( addon.db.profile.filters.item.armor.ring == false ) and
		 ( addon.db.profile.filters.item.armor.trinket == false ) ) then
		ARL_ArmorNoneCB:SetChecked( true )
	else
		ARL_ArmorNoneCB:SetChecked( false )
	end
	ARL_ArmorClothCB:SetChecked( addon.db.profile.filters.item.armor.cloth )
	ARL_ArmorLeatherCB:SetChecked( addon.db.profile.filters.item.armor.leather )
	ARL_ArmorMailCB:SetChecked( addon.db.profile.filters.item.armor.mail )
	ARL_ArmorPlateCB:SetChecked( addon.db.profile.filters.item.armor.plate )

	ARL_ArmorCloakCB:SetChecked( addon.db.profile.filters.item.armor.cloak )
	ARL_ArmorNecklaceCB:SetChecked( addon.db.profile.filters.item.armor.necklace )
	ARL_ArmorRingCB:SetChecked( addon.db.profile.filters.item.armor.ring )
	ARL_ArmorTrinketCB:SetChecked( addon.db.profile.filters.item.armor.trinket )
	-- Weapon Options
	if ( ( addon.db.profile.filters.item.weapon.onehand == true ) and
		 ( addon.db.profile.filters.item.weapon.twohand == true ) and
		 ( addon.db.profile.filters.item.weapon.dagger == true ) and
		 ( addon.db.profile.filters.item.weapon.axe == true ) and
		 ( addon.db.profile.filters.item.weapon.mace == true ) and
		 ( addon.db.profile.filters.item.weapon.sword == true ) and
		 ( addon.db.profile.filters.item.weapon.polearm == true ) and
		 ( addon.db.profile.filters.item.weapon.wand == true ) and
		 ( addon.db.profile.filters.item.weapon.thrown == true ) and
		 ( addon.db.profile.filters.item.weapon.ammo == true ) ) then
		ARL_WeaponAllCB:SetChecked( true )
	else
		ARL_WeaponAllCB:SetChecked( false )
	end
	if ( ( addon.db.profile.filters.item.weapon.onehand == false ) and
		 ( addon.db.profile.filters.item.weapon.twohand == false ) and
		 ( addon.db.profile.filters.item.weapon.dagger == false ) and
		 ( addon.db.profile.filters.item.weapon.axe == false ) and
		 ( addon.db.profile.filters.item.weapon.mace == false ) and
		 ( addon.db.profile.filters.item.weapon.sword == false ) and
		 ( addon.db.profile.filters.item.weapon.polearm == false ) and
		 ( addon.db.profile.filters.item.weapon.wand == false ) and
		 ( addon.db.profile.filters.item.weapon.thrown == false ) and
		 ( addon.db.profile.filters.item.weapon.ammo == false ) ) then
		ARL_WeaponNoneCB:SetChecked( true )
	else
		ARL_WeaponNoneCB:SetChecked( false )
	end
	ARL_Weapon1HCB:SetChecked( addon.db.profile.filters.item.weapon.onehand )
	ARL_Weapon2HCB:SetChecked( addon.db.profile.filters.item.weapon.twohand )
	ARL_WeaponDaggerCB:SetChecked( addon.db.profile.filters.item.weapon.dagger )
	ARL_WeaponAxeCB:SetChecked( addon.db.profile.filters.item.weapon.axe )
	ARL_WeaponMaceCB:SetChecked( addon.db.profile.filters.item.weapon.mace )
	ARL_WeaponSwordCB:SetChecked( addon.db.profile.filters.item.weapon.sword )
	ARL_WeaponPolearmCB:SetChecked( addon.db.profile.filters.item.weapon.polearm )
	ARL_WeaponWandCB:SetChecked( addon.db.profile.filters.item.weapon.wand )
	ARL_WeaponThrownCB:SetChecked( addon.db.profile.filters.item.weapon.thrown )
	ARL_WeaponAmmoCB:SetChecked( addon.db.profile.filters.item.weapon.ammo )
--[[
	--Disable weapon options. Probably don't need to touch these...
	ARL_WeaponStaffCB
	ARL_WeaponBowCB
	ARL_WeaponCrossbowCB ]]--
	-- Player Type Options
	ARL_PlayerTankCB:SetChecked( addon.db.profile.filters.player.tank )
	ARL_PlayerMeleeCB:SetChecked( addon.db.profile.filters.player.melee )
	ARL_PlayerHealerCB:SetChecked( addon.db.profile.filters.player.healer )
	ARL_PlayerCasterCB:SetChecked( addon.db.profile.filters.player.caster )
	-- Old World Rep Options
	ARL_RepArgentDawnCB:SetChecked( addon.db.profile.filters.rep.argentdawn )
	ARL_RepCenarionCircleCB:SetChecked( addon.db.profile.filters.rep.cenarioncircle )
	ARL_RepThoriumCB:SetChecked( addon.db.profile.filters.rep.thoriumbrotherhood )
	ARL_RepTimbermawCB:SetChecked( addon.db.profile.filters.rep.timbermaw )
	ARL_RepZandalarCB:SetChecked( addon.db.profile.filters.rep.zandalar )
	-- BC Rep Options
	ARL_RepAldorCB:SetChecked( addon.db.profile.filters.rep.aldor )
	ARL_RepAshtongueCB:SetChecked( addon.db.profile.filters.rep.ashtonguedeathsworn )
	ARL_RepCenarionExpeditionCB:SetChecked( addon.db.profile.filters.rep.cenarionexpedition )
	ARL_RepConsortiumCB:SetChecked( addon.db.profile.filters.rep.consortium )
	ARL_RepHonorHoldCB:SetChecked( addon.db.profile.filters.rep.hellfire )
	ARL_RepKeepersOfTimeCB:SetChecked( addon.db.profile.filters.rep.keepersoftime )
	ARL_RepKurenaiCB:SetChecked( addon.db.profile.filters.rep.nagrand )
	ARL_RepLowerCityCB:SetChecked( addon.db.profile.filters.rep.lowercity )
	ARL_RepScaleSandsCB:SetChecked( addon.db.profile.filters.rep.scaleofthesands )
	ARL_RepScryersCB:SetChecked( addon.db.profile.filters.rep.scryer )
	ARL_RepShatarCB:SetChecked( addon.db.profile.filters.rep.shatar )
	ARL_RepShatteredSunCB:SetChecked( addon.db.profile.filters.rep.shatteredsun )
	ARL_RepSporeggarCB:SetChecked( addon.db.profile.filters.rep.sporeggar )
	ARL_RepVioletEyeCB:SetChecked( addon.db.profile.filters.rep.violeteye )
end

function addon.resetFilters() 
	-- reset all filters to their default values
	addon.db.profile.filters.general.faction = true
	addon.db.profile.filters.general.class = false
	addon.db.profile.filters.general.specialty = false
	addon.db.profile.filters.general.skill = true
	addon.db.profile.filters.general.known = false
	addon.db.profile.filters.general.unknown = true

	addon.db.profile.filters.obtain.trainer = true
	addon.db.profile.filters.obtain.vendor = true
	addon.db.profile.filters.obtain.instance = true
	addon.db.profile.filters.obtain.raid = true
	addon.db.profile.filters.obtain.seasonal = true
	addon.db.profile.filters.obtain.quest = true
	addon.db.profile.filters.obtain.pvp = true
	addon.db.profile.filters.obtain.discovery = true
	addon.db.profile.filters.obtain.worlddrop = true
	addon.db.profile.filters.obtain.mobdrop = true

	addon.db.profile.filters.binding.itemboe = true
	addon.db.profile.filters.binding.itembop = true
	addon.db.profile.filters.binding.recipebop = true
	addon.db.profile.filters.binding.recipeboe = true

	addon.db.profile.filters.item.armor.cloth = true
	addon.db.profile.filters.item.armor.leather = true
	addon.db.profile.filters.item.armor.mail = true
	addon.db.profile.filters.item.armor.plate = true
	addon.db.profile.filters.item.armor.trinket = true
	addon.db.profile.filters.item.armor.cloak = true
	addon.db.profile.filters.item.armor.ring = true
	addon.db.profile.filters.item.armor.necklace = true

	addon.db.profile.filters.item.weapon.onehand = true
	addon.db.profile.filters.item.weapon.twohand = true
	addon.db.profile.filters.item.weapon.axe = true
	addon.db.profile.filters.item.weapon.sword = true
	addon.db.profile.filters.item.weapon.mace = true
	addon.db.profile.filters.item.weapon.polearm = true
	addon.db.profile.filters.item.weapon.dagger = true
	addon.db.profile.filters.item.weapon.staff = true
	addon.db.profile.filters.item.weapon.wand = true
	addon.db.profile.filters.item.weapon.thrown = true
	addon.db.profile.filters.item.weapon.bow = true
	addon.db.profile.filters.item.weapon.crossbow = true
	addon.db.profile.filters.item.weapon.ammo = true

	addon.db.profile.filters.player.melee = true
	addon.db.profile.filters.player.tank = true
	addon.db.profile.filters.player.healer = true
	addon.db.profile.filters.player.caster = true

	addon.db.profile.filters.rep.aldor = true
	addon.db.profile.filters.rep.scryer = true
	addon.db.profile.filters.rep.argentdawn = true
	addon.db.profile.filters.rep.ashtonguedeathsworn = true
	addon.db.profile.filters.rep.cenarioncircle = true
	addon.db.profile.filters.rep.cenarionexpedition = true
	addon.db.profile.filters.rep.consortium = true
	addon.db.profile.filters.rep.hellfire = true
	addon.db.profile.filters.rep.keepersoftime = true
	addon.db.profile.filters.rep.nagrand = true
	addon.db.profile.filters.rep.lowercity = true
	addon.db.profile.filters.rep.scaleofthesands = true
	addon.db.profile.filters.rep.shatar = true
	addon.db.profile.filters.rep.shatteredsun = true
	addon.db.profile.filters.rep.sporeggar = true
	addon.db.profile.filters.rep.thoriumbrotherhood = true
	addon.db.profile.filters.rep.timbermaw = true
	addon.db.profile.filters.rep.violeteye = true
	addon.db.profile.filters.rep.zandalar = true

	addon.Flyaway:Hide()
end

function addon.DoFlyaway( panel )
	-- This is going to manage the flyaway panel, as well as checking or unchecking the
	-- buttons that got us here in the first place
	--
	-- our panels are:
	-- 1	ARL_ExpGeneralOptCB			General Filters
	-- 2	ARL_ExpObtainOptCB			Obtain Filters
	-- 3	ARL_ExpBindingOptCB			Binding Filters
	-- 4	ARL_ExpItemOptCB			Item Filters

	local ChangeFilters = false
	addon.Fly_Rep_OW:Hide()
	addon.Fly_Rep_BC:Hide()
	ARL_RepBCCB:SetChecked( false )
	ARL_RepOldWorldCB:SetChecked( false )
	if ( panel == 1 ) then
		if ( ARL_ExpGeneralOptCB:GetChecked() ) then
			-- uncheck all other buttons
			ARL_ExpObtainOptCB:SetChecked( false )
			ARL_ExpBindingOptCB:SetChecked( false )
			ARL_ExpItemOptCB:SetChecked( false )
			ARL_ExpPlayerOptCB:SetChecked( false )
			ARL_ExpRepOptCB:SetChecked( false )
			-- change text colors to match selection
			ARL_ExpGeneralOptCB.text:SetText( addon:White( ExpButtonText[1] ) ) 
			ARL_ExpObtainOptCB.text:SetText( addon:Yellow( ExpButtonText[2] ) ) 
			ARL_ExpBindingOptCB.text:SetText( addon:Yellow( ExpButtonText[3] ) ) 
			ARL_ExpItemOptCB.text:SetText( addon:Yellow( ExpButtonText[4] ) ) 
			ARL_ExpPlayerOptCB.text:SetText( addon:Yellow( ExpButtonText[5] ) ) 
			ARL_ExpRepOptCB.text:SetText( addon:Yellow( ExpButtonText[6] ) )
			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Show()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true
		else
			ARL_ExpGeneralOptCB.text:SetText( addon:Yellow( ExpButtonText[1] ) ) 
			ChangeFilters = false
		end
	elseif ( panel == 2 ) then
		if ( ARL_ExpObtainOptCB:GetChecked() ) then
			-- uncheck all other buttons
			ARL_ExpGeneralOptCB:SetChecked( false )
			ARL_ExpBindingOptCB:SetChecked( false )
			ARL_ExpItemOptCB:SetChecked( false )
			ARL_ExpPlayerOptCB:SetChecked( false )
			ARL_ExpRepOptCB:SetChecked( false )
			-- change text colors to match selection
			ARL_ExpGeneralOptCB.text:SetText( addon:Yellow( ExpButtonText[1] ) ) 
			ARL_ExpObtainOptCB.text:SetText( addon:White( ExpButtonText[2] ) ) 
			ARL_ExpBindingOptCB.text:SetText( addon:Yellow( ExpButtonText[3] ) ) 
			ARL_ExpItemOptCB.text:SetText( addon:Yellow( ExpButtonText[4] ) ) 
			ARL_ExpPlayerOptCB.text:SetText( addon:Yellow( ExpButtonText[5] ) ) 
			ARL_ExpRepOptCB.text:SetText( addon:Yellow( ExpButtonText[6] ) )
			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Show()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true
		else
			ARL_ExpObtainOptCB.text:SetText( addon:Yellow( ExpButtonText[2] ) ) 
			ChangeFilters = false
		end
	elseif ( panel == 3 ) then
		if ( ARL_ExpBindingOptCB:GetChecked() ) then
			-- uncheck all other buttons
			ARL_ExpGeneralOptCB:SetChecked( false )
			ARL_ExpObtainOptCB:SetChecked( false )
			ARL_ExpItemOptCB:SetChecked( false )
			ARL_ExpPlayerOptCB:SetChecked( false )
			ARL_ExpRepOptCB:SetChecked( false )
			-- change text colors to match selection
			ARL_ExpGeneralOptCB.text:SetText( addon:Yellow( ExpButtonText[1] ) ) 
			ARL_ExpObtainOptCB.text:SetText( addon:Yellow( ExpButtonText[2] ) ) 
			ARL_ExpBindingOptCB.text:SetText( addon:White( ExpButtonText[3] ) ) 
			ARL_ExpItemOptCB.text:SetText( addon:Yellow( ExpButtonText[4] ) ) 
			ARL_ExpPlayerOptCB.text:SetText( addon:Yellow( ExpButtonText[5] ) ) 
			ARL_ExpRepOptCB.text:SetText( addon:Yellow( ExpButtonText[6] ) )
			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Show()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true
		else
			ARL_ExpBindingOptCB.text:SetText( addon:Yellow( ExpButtonText[3] ) ) 
			ChangeFilters = false
		end
	elseif ( panel == 4 ) then
		if ( ARL_ExpItemOptCB:GetChecked() ) then
			-- uncheck all other buttons
			ARL_ExpGeneralOptCB:SetChecked( false )
			ARL_ExpObtainOptCB:SetChecked( false )
			ARL_ExpBindingOptCB:SetChecked( false )
			ARL_ExpPlayerOptCB:SetChecked( false )
			ARL_ExpRepOptCB:SetChecked( false )
			-- change text colors to match selection
			ARL_ExpGeneralOptCB.text:SetText( addon:Yellow( ExpButtonText[1] ) ) 
			ARL_ExpObtainOptCB.text:SetText( addon:Yellow( ExpButtonText[2] ) ) 
			ARL_ExpBindingOptCB.text:SetText( addon:Yellow( ExpButtonText[3] ) ) 
			ARL_ExpItemOptCB.text:SetText( addon:White( ExpButtonText[4] ) ) 
			ARL_ExpPlayerOptCB.text:SetText( addon:Yellow( ExpButtonText[5] ) ) 
			ARL_ExpRepOptCB.text:SetText( addon:Yellow( ExpButtonText[6] ) )
			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Show()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()

			ChangeFilters = true
		else
			ARL_ExpItemOptCB.text:SetText( addon:Yellow( ExpButtonText[4] ) ) 
			ChangeFilters = false
		end
	elseif ( panel == 5 ) then
		if ( ARL_ExpPlayerOptCB:GetChecked() ) then
			-- uncheck all other buttons
			ARL_ExpGeneralOptCB:SetChecked( false )
			ARL_ExpObtainOptCB:SetChecked( false )
			ARL_ExpBindingOptCB:SetChecked( false )
			ARL_ExpItemOptCB:SetChecked( false )
			ARL_ExpRepOptCB:SetChecked( false )
			-- change text colors to match selection
			ARL_ExpGeneralOptCB.text:SetText( addon:Yellow( ExpButtonText[1] ) ) 
			ARL_ExpObtainOptCB.text:SetText( addon:Yellow( ExpButtonText[2] ) ) 
			ARL_ExpBindingOptCB.text:SetText( addon:Yellow( ExpButtonText[3] ) ) 
			ARL_ExpItemOptCB.text:SetText( addon:Yellow( ExpButtonText[4] ) ) 
			ARL_ExpPlayerOptCB.text:SetText( addon:White( ExpButtonText[5] ) ) 
			ARL_ExpRepOptCB.text:SetText( addon:Yellow( ExpButtonText[6] ) )
			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Show()
			addon.Fly_Rep:Hide()

			ChangeFilters = true
		else
			ARL_ExpPlayerOptCB.text:SetText( addon:Yellow( ExpButtonText[5] ) ) 
			ChangeFilters = false
		end
	elseif ( panel == 6 ) then
		if ( ARL_ExpRepOptCB:GetChecked() ) then
			-- uncheck all other buttons
			ARL_ExpGeneralOptCB:SetChecked( false )
			ARL_ExpObtainOptCB:SetChecked( false )
			ARL_ExpBindingOptCB:SetChecked( false )
			ARL_ExpItemOptCB:SetChecked( false )
			ARL_ExpPlayerOptCB:SetChecked( false )
			-- change text colors to match selection
			ARL_ExpGeneralOptCB.text:SetText( addon:Yellow( ExpButtonText[1] ) ) 
			ARL_ExpObtainOptCB.text:SetText( addon:Yellow( ExpButtonText[2] ) ) 
			ARL_ExpBindingOptCB.text:SetText( addon:Yellow( ExpButtonText[3] ) ) 
			ARL_ExpItemOptCB.text:SetText( addon:Yellow( ExpButtonText[4] ) ) 
			ARL_ExpPlayerOptCB.text:SetText( addon:Yellow( ExpButtonText[5] ) ) 
			ARL_ExpRepOptCB.text:SetText( addon:White( ExpButtonText[6] ) )
			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Show()

			ChangeFilters = true
		else
			ARL_ExpRepOptCB.text:SetText( addon:Yellow( ExpButtonText[6] ) ) 
			ChangeFilters = false
		end
	end

	if ( ChangeFilters == true ) then
		-- Depending on which panel we're showing, either display one column
		-- or two column
		if ( ( panel == 1 ) or ( panel == 3 ) or ( panel == 4 ) ) then
			addon.flyTexture:ClearAllPoints()
			addon.Flyaway:SetWidth(234)
			addon.Flyaway:SetHeight(312)
			addon.flyTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\fly_2col]] )
			addon.flyTexture:SetAllPoints( addon.Flyaway )
			addon.flyTexture:SetTexCoord( 0, (234/256), 0, (312/512) )
		elseif ( ( panel == 2 ) or ( panel == 5 ) or ( panel == 6 ) ) then
			addon.flyTexture:ClearAllPoints()
			addon.Flyaway:SetWidth(136)
			addon.Flyaway:SetHeight(312)
			addon.flyTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\fly_1col]] )
			addon.flyTexture:SetAllPoints( addon.Flyaway )
			addon.flyTexture:SetTexCoord( 0, (136/256), 0, (312/512) )
		end
		-- Change the filters to the current panel
		addon.Flyaway:Show()
	else
		-- We're hiding, don't bother changing anything
		addon.Flyaway:Hide()
	end
end

-- This does the initial fillup of the DisplayStrings structure.
-- This won't run if all we're doing is expanding/contracting a recipe
function addon.initDisplayStrings()
	addon.DisplayStrings = nil
	addon.DisplayStrings = {}
	for i, RecipeName in ipairs( addon.SortedRecipeIndex ) do
		-- include filtering for search string here?
		local t = {}
		t.String = RecipeName
		t.IsRecipe = true
		t.IsExpanded = false
		tinsert( addon.DisplayStrings, i, t )
	end
end

-- This does an initial fillup of the DisplayStrings, as above.
-- However, in this case, it expands every recipe
function addon.expandallDisplayStrings( )
	addon.DisplayStrings = nil
	addon.DisplayStrings = {}
	local insertIndex = 1
	for i, RecipeName in ipairs( addon.SortedRecipeIndex ) do
		-- include filtering for search string here?
		local t = {}
		t.String = RecipeName
		t.IsRecipe = true
		if ( addon.RecipeListing[RecipeName]["Acquire"] ) then
			t.IsExpanded = true
			tinsert( addon.DisplayStrings, insertIndex, t )
			insertIndex = insertIndex + 1
			-- for now, just insert it as a single string. eventually, I need to pick
			-- this apart into individual strings...
			t = {}
			t.String = addon.RecipeListing[RecipeName]["Acquire"]
			t.IsRecipe = false
			t.IsExpanded = true
			tinsert( addon.DisplayStrings, insertIndex, t )
			insertIndex = insertIndex + 1
		else
			t.IsExpanded = false
			tinsert( addon.DisplayStrings, insertIndex, t )
			insertIndex = insertIndex + 1
		end
	end
end

function addon.ExpandAll_Clicked( )
	-- Called when the expand all button is clicked
	if ( ARL_ExpandButton:GetText() == L["ExpandAll"] ) then
		ARL_ExpandButton:SetText( L["ContractAll"] )
		addon:TooltipDisplay( ARL_ExpandButton, L["CONTRACT_TT"] )
		addon.expandallDisplayStrings( addon.SortedRecipeIndex )
	else
		ARL_ExpandButton:SetText( L["ExpandAll"] )
		addon:TooltipDisplay( ARL_ExpandButton, L["EXPAND_TT"] )
		addon.initDisplayStrings( addon.SortedRecipeIndex )
	end
	addon.RecipeList_Update()
end

-- Creates the initial frame to display recipes into
function addon:CreateFrame(CurrentProfession, CurrentProfessionLevel, CurrentSpeciality)

	addon.ResetOkayARL = false
	addon.CurrentProfession = CurrentProfession

	-- Normal GUI
	if (not addon.db.profile.testgui) then
		if (not addon.Frame) then

			-- Create the main frame
			addon.Frame = CreateFrame("Frame", "addon.Frame", UIParent)
			--Allows ARL to be closed with the Escape key
			tinsert(UISpecialFrames, "addon.Frame")

			addon.Frame:SetWidth(384)
			addon.Frame:SetHeight(430)
			addon.Frame:SetBackdrop(
			{
				bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
				edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
				tile="false",
				edgeSize = 16,
				insets = {
					left = 5,
					right = 5,
					top = 5,
					bottom = 5
				}
			})
			addon.Frame:SetBackdropColor(0, 0, 0)
			addon.Frame:EnableMouse(true)
			addon.Frame:EnableKeyboard(true)
			addon.Frame:SetMovable(true)
			addon.Frame:SetScript("OnMouseDown", function() addon.Frame:StartMoving() end)
			addon.Frame:SetScript("OnHide", function() self:CloseWindow()	end)
			addon.Frame:SetScript("OnMouseUp", function()	addon.Frame:StopMovingOrSizing() end)

			-- ATSW for some reason has a window "bigger" than what you can see
			if (ATSWFrame and not CraftIsPetTraining()) then
				addon.Frame:SetFrameStrata("DIALOG")
			end

			-- Add header frame
			addon.Frame.Header = CreateFrame("Frame", "addon.Frame.Header", addon.Frame)

			addon.Frame.Header:SetWidth(192)
			addon.Frame.Header:SetHeight(32)
			addon.Frame.Header:ClearAllPoints()
			addon.Frame.Header:SetPoint("TOP", addon.Frame, "TOP", 0, 6)
			addon.Frame.Header:EnableMouse(true)
			addon.Frame.Header:SetMovable(true)
			addon.Frame.Header:SetScript("OnMouseDown", function()
											addon.Frame:StartMoving()
										end
			)
			addon.Frame.Header:SetScript("OnMouseUp", function()
											addon.Frame:StopMovingOrSizing()
										end
			)

			-- Add texture to the header frame
			addon.Frame.Header.Texture = addon.Frame.Header:CreateTexture("addon.Frame.Header.Texture", "ARTWORK")

			addon.Frame.Header.Texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
			addon.Frame.Header.Texture:SetWidth(475)
			addon.Frame.Header.Texture:SetHeight(64)
			addon.Frame.Header.Texture:ClearAllPoints()
			addon.Frame.Header.Texture:SetPoint("TOP", addon.Frame.Header, "TOP", 0, 5)

			-- Add text to header frame
			addon.Frame.Header.Text = addon.Frame.Header:CreateFontString("addon.Frame.Header.Text", "ARTWORK")

			addon.Frame.Header.Text:SetFontObject(GameFontNormal)
			addon.Frame.Header.Text:ClearAllPoints()
			addon.Frame.Header.Text:SetPoint("CENTER", addon.Frame.Header, "CENTER", 0, 0)
			addon.Frame.Header.Text:SetText(self:White(addon.ARLTitle))

			-- Add close button
			addon.Frame.CloseButton = CreateFrame("Button","addon.Frame.CloseButton",addon.Frame,"UIPanelButtonTemplate")

			addon.Frame.CloseButton:SetWidth(100)
			addon.Frame.CloseButton:SetHeight(24)
			addon.Frame.CloseButton:ClearAllPoints()
			addon.Frame.CloseButton:SetPoint("BOTTOMRIGHT", addon.Frame, -10, 10)
			addon.Frame.CloseButton:RegisterForClicks("LeftButtonUp")
			addon.Frame.CloseButton:SetScript("OnClick", function() self:CloseWindow() end)
			addon.Frame.CloseButton:SetScript("OnEnter", function(this)
												GameTooltip_SetDefaultAnchor(GameTooltip, this)
												GameTooltip:SetText(self:White(L["Close Window"]))
												GameTooltip:Show()
			end
										)
			addon.Frame.CloseButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
			if (not addon.wrath) then
				addon.Frame.CloseButton:SetFont("GameFontHighlightSmall",12)
			end
			addon.Frame.CloseButton:SetText(self:White(L["Close"]))
			addon.Frame.CloseButton:Enable()

			-- Add expand all button
			addon.Frame.ExpandAllButton = CreateFrame("Button","addon.Frame.ExpandAllButton",addon.Frame,"UIPanelButtonTemplate")

			addon.Frame.ExpandAllButton:SetWidth(16)
			addon.Frame.ExpandAllButton:SetHeight(16)
			addon.Frame.ExpandAllButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
			addon.Frame.ExpandAllButton:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
			addon.Frame.ExpandAllButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
			addon.Frame.ExpandAllButton:ClearAllPoints()
			addon.Frame.ExpandAllButton:SetPoint("TOPRIGHT",addon.Frame,"TOPRIGHT",-10,-20)
			addon.Frame.ExpandAllButton:SetScript("OnClick", function() self:ExpandAll() end)
			addon.Frame.ExpandAllButton:SetScript("OnEnter", function(this)
													GameTooltip_SetDefaultAnchor(GameTooltip, this)
													GameTooltip:SetText(self:White(L["Expand All"]))
													GameTooltip:Show()
												end
			)
			addon.Frame.ExpandAllButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
			addon.Frame.ExpandAllButton:Enable()

			-- Add collaspse all button
			addon.Frame.CollapseAllButton = CreateFrame("Button","addon.Frame.CollapseAllButton",addon.Frame,"UIPanelButtonTemplate")

			addon.Frame.CollapseAllButton:SetWidth(16)
			addon.Frame.CollapseAllButton:SetHeight(16)
			addon.Frame.CollapseAllButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
			addon.Frame.CollapseAllButton:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down")
			addon.Frame.CollapseAllButton:SetHighlightTexture("Interface\\Buttons\\UI-MinusButton-Hilight")
			addon.Frame.CollapseAllButton:ClearAllPoints()
			addon.Frame.CollapseAllButton:SetPoint("TOPRIGHT",addon.Frame,"TOPRIGHT",-30,-20)
			addon.Frame.CollapseAllButton:SetScript("OnClick", function() self:CloseAll() end)
			addon.Frame.CollapseAllButton:SetScript("OnEnter", function(this)
														GameTooltip_SetDefaultAnchor(GameTooltip, this)
														GameTooltip:SetText(self:White(L["Collapse All"]))
														GameTooltip:Show()
													end
			)
			addon.Frame.CollapseAllButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
			addon.Frame.CollapseAllButton:Enable()

			-- Add a "close with x" button
			addon.Frame.XButton = CreateFrame("Button","addon.Frame.XButton",addon.Frame,"UIPanelCloseButton")

			addon.Frame.XButton:ClearAllPoints()
			addon.Frame.XButton:SetPoint("TOPRIGHT",addon.Frame,"TOPRIGHT",0,0)
			addon.Frame.XButton:RegisterForClicks("LeftButtonUp")
			addon.Frame.XButton:SetScript("OnClick", function() self:CloseWindow() end)
			addon.Frame.XButton:SetScript("OnEnter", function(this)
											GameTooltip_SetDefaultAnchor(GameTooltip, this)
											GameTooltip:SetText(self:White(L["Close Window"]))
											GameTooltip:Show()
										end
			)
			addon.Frame.XButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
			addon.Frame.XButton:Enable()

			-- Adds scroll frame to mainframe
			addon.Frame.ScrollFrame = CreateFrame("ScrollFrame", "addon.Frame.ScrollFrame", addon.Frame, "UIPanelScrollFrameTemplate")
	
			addon.Frame.ScrollFrame:ClearAllPoints()
			addon.Frame.ScrollFrame:SetPoint("TOPLEFT", addon.Frame, "TOPLEFT", 10, -50)
			addon.Frame.ScrollFrame:SetHeight(345)
			addon.Frame.ScrollFrame:SetWidth(344)
			addon.Frame.ScrollFrame:EnableMouseWheel(true)
			addon.Frame.ScrollFrame:EnableMouse(true)

			addon.Frame.ScrollChild = CreateFrame("Frame", "addon.Frame.ScrollChild", addon.Frame.ScrollFrame)

			addon.Frame.ScrollChild:ClearAllPoints()
			addon.Frame.ScrollChild:SetPoint("TOPLEFT", addon.Frame.ScrollFrame, "TOPLEFT", 10, -30)
			addon.Frame.ScrollChild:SetWidth(340)
			addon.Frame.ScrollChild:SetHeight(345)
			addon.Frame.ScrollChild:EnableMouseWheel(true)
			addon.Frame.ScrollChild:EnableMouse(true)

			addon.Frame.ScrollFrame:SetScrollChild(addon.Frame.ScrollChild)

			-- Add progress bar to frame
			addon.Frame.ProgressBar = CreateFrame("StatusBar", "addon.Frame.ProgressBar", addon.Frame)
		
			addon.Frame.ProgressBar:SetWidth(260)
			addon.Frame.ProgressBar:SetHeight(20)
			addon.Frame.ProgressBar:ClearAllPoints()
			addon.Frame.ProgressBar:SetPoint("BOTTOMLEFT", addon.Frame, 10, 10)
			addon.Frame.ProgressBar:SetStatusBarTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-Bar")
			addon.Frame.ProgressBar:SetOrientation("HORIZONTAL")
			addon.Frame.ProgressBar:SetStatusBarColor(0.25, 0.25, 0.75)

			addon.Frame.ProgressBarBorder = CreateFrame("Button", "addon.Frame.ProgressBarBorder", addon.Frame.ProgressBar)

			-- Add border to status bar
			addon.Frame.ProgressBarBorder:SetNormalTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorder")
			addon.Frame.ProgressBarBorder:SetWidth(270)
			addon.Frame.ProgressBarBorder:SetHeight(40)
			addon.Frame.ProgressBarBorder:ClearAllPoints()
			addon.Frame.ProgressBarBorder:SetPoint("CENTER", addon.Frame.ProgressBar, "CENTER", 0, 0)

			addon.Frame.ProgressBarText = addon.Frame.ProgressBar:CreateFontString("addon.Frame.ProgressBarText", "ARTWORK")

			-- Add text to header frame
			addon.Frame.ProgressBarText:SetFontObject(GameFontHighlightSmall)
			addon.Frame.ProgressBarText:ClearAllPoints()
			addon.Frame.ProgressBarText:SetPoint("CENTER", addon.Frame.ProgressBar, "CENTER", 0, 0)

			-- Adds Profession header text
			addon.Frame.ProfessionText = addon.Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
			addon.Frame.ProfessionText:ClearAllPoints()
			addon.Frame.ProfessionText:SetPoint("TOP", 0, -30)

		end

		addon.Frame:ClearAllPoints()

		-- Anchor the frame to a specific window

		-- Anchors to Skillet window
		if (Skillet and Skillet:IsActive() and not CraftIsPetTraining()) then
			addon.Frame:SetPoint("LEFT", SkilletFrame, "RIGHT", 0, 0)
		-- Anchor to Beast window if skillet is active
		elseif (Skillet and Skillet:IsActive() and CraftIsPetTraining()) then
			addon.Frame:SetPoint("RIGHT", CraftFrame, "RIGHT", 345, 30)
		-- Anchor to ATSW
		elseif (ATSWFrame) then
			addon.Frame:SetPoint("RIGHT", ATSWFrame, "RIGHT", 350, 25)
		-- Move the window over a bit for trade tabs to be seen
		elseif (TradeTabs) then
			if (addon.SkillType == "Trade") then
				addon.Frame:SetPoint("RIGHT", TradeSkillFrame, "RIGHT", 385, 30)
			-- Anchor to crafting window
			elseif (addon.SkillType == "Craft") then
				addon.Frame:SetPoint("RIGHT", CraftFrame, "RIGHT", 385, 30)
			end
		-- Anchor to trade skill window
		elseif (addon.SkillType == "Trade") then
			addon.Frame:SetPoint("RIGHT", TradeSkillFrame, "RIGHT", 345, 30)
		-- Anchor to crafting window
		elseif (addon.SkillType == "Craft") then
			addon.Frame:SetPoint("RIGHT", CraftFrame, "RIGHT", 345, 30)
		-- Nothing found to anchor, just put it up in the middle
		else
			addon.Frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		end

		-- Set the text / status bar display  of the progress bar
		if (CurrentSpeciality == "") then
			addon.Frame.ProfessionText:SetText(self:Yellow(CurrentProfession))
		else
			addon.Frame.ProfessionText:SetText(self:Yellow(CurrentProfession .. " - " .. CurrentSpeciality))
		end

		addon.Frame:Show()

		-- Add frame elements
		AddRecipeInfo(CurrentProfession, CurrentProfessionLevel, CurrentSpeciality)

		-- Include filtered recipes in overall count
		if (addon.db.profile.includefiltered) then
			addon.Frame.ProgressBar:SetMinMaxValues(0, addon.NumberOfRecipes)
			addon.Frame.ProgressBar:SetValue(addon.FoundRecipes)
			addon.Frame.ProgressBarText:SetText(addon.FoundRecipes .. " \\ " .. addon.NumberOfRecipes .. " - " .. math.floor(addon.FoundRecipes / addon.NumberOfRecipes * 100) .. "%")
		-- Do not include filtered recipes
		else
			addon.Frame.ProgressBar:SetMinMaxValues(0, addon.NumberOfRecipes - addon.FilteredRecipes)
			addon.Frame.ProgressBar:SetValue(addon.FoundRecipes)
			addon.Frame.ProgressBarText:SetText(addon.FoundRecipes .. " \\ " .. addon.NumberOfRecipes - addon.FilteredRecipes .. " - " .. math.floor(addon.FoundRecipes / (addon.NumberOfRecipes - addon.FilteredRecipes) * 100) .. "%")
		end

	else
		-- New dev GUI
		self:Print("Test purposes only.")

		-- Adding a check in to see if we're Horde or Alliance, and change the displayed reputation
		-- strings to be faction correct (eg, Honor Hold / Thrallmar )
		if ( UnitFactionGroup( "player" ) == "Alliance" ) then
			addon.HonorHold_Thrallmar_FactionText = BFAC["Honor Hold"]
			addon.Kurenai_Maghar_FactionText = BFAC["Kurenai"]
		else
			addon.HonorHold_Thrallmar_FactionText = BFAC["Thrallmar"]
			addon.Kurenai_Maghar_FactionText = BFAC["The Mag'har"]
		end

		if (not addon.Frame) then
			-- Create the main frame
			addon.Frame = CreateFrame("Frame", "addon.Frame", UIParent)
			--Allows ARL to be closed with the Escape key
			tinsert(UISpecialFrames, "addon.Frame")

			addon.Frame:SetWidth(293)
			addon.Frame:SetHeight(447)

			addon.bgTexture = addon.Frame:CreateTexture( "AckisRecipeList.bgTexture", "ARTWORK" )
			addon.bgTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\main]] )
			addon.bgTexture:SetAllPoints( addon.Frame )
			addon.bgTexture:SetTexCoord( 0, (293/512), 0, (447/512) )
			addon.Frame:SetFrameStrata( "BACKGROUND" )
			addon.Frame:SetHitRectInsets( 5, 5, 5, 5 )

			addon.Frame:EnableMouse(true)
			addon.Frame:EnableKeyboard(true)
			addon.Frame:SetMovable(true)
			addon.Frame:SetScript("OnMouseDown", function() addon.Frame:StartMoving() end)
			addon.Frame:SetScript("OnHide", function() self:CloseWindow() end)
			addon.Frame:SetScript("OnMouseUp", function() addon.Frame:StopMovingOrSizing() end)

			addon.Frame:ClearAllPoints()
			addon.Frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
			addon.Frame:Show()
			addon.Frame._Expanded = false

			addon.Frame.HeadingText = addon.Frame:CreateFontString( "addon.Frame.HeadingText", "ARTWORK" )
				
			addon.Frame.HeadingText:SetFontObject( "GameFontHighlightSmall" )
			addon.Frame.HeadingText:ClearAllPoints()
			addon.Frame.HeadingText:SetPoint("TOP", addon.Frame, "TOP", 20, -16)
			addon.Frame.HeadingText:SetJustifyH( "CENTER" )

			local ARL_SwitcherButton = CreateFrame( "Button", "ARL_SwitcherButton", addon.Frame, "UIPanelButtonTemplate" )
				ARL_SwitcherButton:SetWidth( 64 )
				ARL_SwitcherButton:SetHeight( 64 )
				ARL_SwitcherButton:SetPoint( "TOPLEFT", addon.Frame, "TOPLEFT", 1, -2 )
				addon.SetSwitcherTexture( addon.CurrentProf )
				ARL_SwitcherButton:SetScript( "OnClick", addon.SwitchProfs )

			-- Stuff in the non-expanded frame (or both)
			local ARL_CloseXButton = CreateFrame( "Button", "ARL_CloseXButton", addon.Frame, "UIPanelCloseButton" )
				ARL_CloseXButton:SetFrameLevel( 5 )
				ARL_CloseXButton:SetScript( "OnClick",
					function(this)
						this:GetParent():Hide()
					end
				)
				ARL_CloseXButton:SetPoint( "TOPRIGHT", addon.Frame, "TOPRIGHT", 5, -6 )

			local ARL_FilterButton = addon:GenericCreateButton( "ARL_FilterButton", addon.Frame,
				25, 90, "TOPRIGHT", addon.Frame, "TOPRIGHT", -8, -40, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["FILTER_OPEN"], "CENTER", L["FILTER_OPEN_TT"], 1 )
				ARL_FilterButton:SetScript( "OnClick", addon.ToggleFilters )

			local ARL_SortButton = addon:GenericCreateButton( "ARL_SortButton", addon.Frame,
				25, 90, "TOPLEFT", addon.Frame, "TOPLEFT", 80, -40, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["Sort"], "CENTER", L["SORT_TT"], 1 )

			local ARL_ExpandButton = addon:GenericCreateButton( "ARL_ExpandButton", addon.Frame,
				21, 40, "TOPRIGHT", ARL_SortButton, "BOTTOMLEFT", -26, -6, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["ExpandAll"], "CENTER", L["EXPAND_TT"], 1 )
--			ARL_ExpandButton:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				ARL_ExpandButton:SetScript( "OnClick", addon.ExpandAll_Clicked )

			local ARL_SearchButton = addon:GenericCreateButton( "ARL_SearchButton", addon.Frame,
				25, 74, "TOPLEFT", ARL_SortButton, "BOTTOMRIGHT", 41, -2, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["Search"], "CENTER", L["SEARCH_TT"], 1 )

			local ARL_ClearButton = addon:GenericCreateButton( "ARL_ClearButton", addon.Frame,
				28, 28, "RIGHT", ARL_SearchButton, "LEFT", 3, -1, "GameFontNormalSmall",
				"GameFontHighlightSmall", "", "CENTER", L["CLEAR_TT"], 3 )

			local ARL_CloseButton = addon:GenericCreateButton( "ARL_CloseButton", addon.Frame,
				22, 69, "BOTTOMRIGHT", addon.Frame, "BOTTOMRIGHT", -4, 3, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["Close"], "CENTER", L["Close Window"], 1 )
				ARL_CloseButton:SetScript( "OnClick",
					function(this)
						this:GetParent():Hide()
					end
				)

			-- The main recipe list buttons and scrollframe

			addon.PlusListButton = {}
			addon.RecipeListButton = {}
			for i = 1, addon.maxVisibleRecipes do
				local Temp_Plus = addon:GenericCreateButton( "ARL_PlusListButton" .. i, addon.Frame,
					16, 16, "TOPLEFT", addon.Frame, "TOPLEFT", 20, -98, "GameFontNormalSmall",
					"GameFontHighlightSmall", "", "LEFT", "testTT", 2 )
				local Temp_Recipe = addon:GenericCreateButton( "ARL_RecipeListButton" .. i, addon.Frame,
					17, 224, "TOPLEFT", addon.Frame, "TOPLEFT", 37, -97, "GameFontNormalSmall",
					"GameFontHighlightSmall", "Blort", "LEFT", "blortTT", 0 )
				if not ( i == 1 ) then
					Temp_Plus:SetPoint( "TOPLEFT", addon.PlusListButton[i-1], "BOTTOMLEFT", 0, -1 )
					Temp_Recipe:SetPoint( "TOPLEFT", addon.RecipeListButton[i-1], "BOTTOMLEFT", 0, 0 )
				end
				Temp_Plus:SetScript( "OnClick", function ()
					addon.RecipeItem_OnClick( i )
				end )
				Temp_Recipe:SetScript( "OnClick", function ()
					addon.RecipeItem_OnClick( i )
				end )
				addon.PlusListButton[i] = Temp_Plus
				addon.RecipeListButton[i] = Temp_Recipe
			end

			local ARL_RecipeScrollFrame = CreateFrame( "ScrollFrame", "ARL_RecipeScrollFrame",
				addon.Frame, "FauxScrollFrameTemplate" )
			ARL_RecipeScrollFrame:SetHeight( 322 )
			ARL_RecipeScrollFrame:SetWidth( 243 )
			ARL_RecipeScrollFrame:SetPoint( "TOPLEFT", addon.Frame, "TOPLEFT", 20, -97 )
			ARL_RecipeScrollFrame:SetScript( "OnVerticalScroll", function()
				FauxScrollFrame_OnVerticalScroll( 16, addon.RecipeList_Update )
			end )

			-- Stuff that appears on the main frame only when expanded

			local ARL_ResetButton = addon:GenericCreateButton( "ARL_ResetButton", addon.Frame,
				25, 90, "TOPRIGHT", ARL_FilterButton, "BOTTOMRIGHT", 0, -2, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["Reset"], "CENTER", L["RESET_TT"], 1 )
				ARL_ResetButton:SetScript( "OnClick", addon.resetFilters )
				ARL_ResetButton:Hide()

			local ARL_ApplyButton = addon:GenericCreateButton( "ARL_ApplyButton", addon.Frame,
				22, 69, "RIGHT", ARL_CloseButton, "LEFT", -80, 0, "GameFontNormalSmall",
				"GameFontHighlightSmall", L["Apply"], "CENTER", L["Apply_TT"], 1 )
			ARL_ApplyButton:Hide()

			-- EXPANDED : 5 buttons for opening/closing the flyaway

			ARL_ExpGeneralOptCB = addon:CreateExpCB( "ARL_ExpGeneralOptCB", "INV_Misc_Note_06", 1 )
			ARL_ExpGeneralOptCB:SetPoint( "TOPRIGHT", ARL_FilterButton, "BOTTOMLEFT", -1, -50 )

			ARL_ExpObtainOptCB = addon:CreateExpCB( "ARL_ExpObtainOptCB", "Spell_Shadow_MindRot", 2 )
			ARL_ExpObtainOptCB:SetPoint( "TOPLEFT", ARL_ExpGeneralOptCB, "BOTTOMLEFT", 0, -8 )

			ARL_ExpBindingOptCB = addon:CreateExpCB( "ARL_ExpBindingOptCB", "INV_Belt_20", 3 )
			ARL_ExpBindingOptCB:SetPoint( "TOPLEFT", ARL_ExpObtainOptCB, "BOTTOMLEFT", -0, -8 )

			ARL_ExpItemOptCB = addon:CreateExpCB( "ARL_ExpItemOptCB", "INV_Misc_EngGizmos_19", 4 )
			ARL_ExpItemOptCB:SetPoint( "TOPLEFT", ARL_ExpBindingOptCB, "BOTTOMLEFT", -0, -8 )

			ARL_ExpPlayerOptCB = addon:CreateExpCB( "ARL_ExpPlayerOptCB", "INV_Misc_GroupLooking", 5 )
			ARL_ExpPlayerOptCB:SetPoint( "TOPLEFT", ARL_ExpItemOptCB, "BOTTOMLEFT", -0, -8 )

			ARL_ExpRepOptCB = addon:CreateExpCB( "ARL_ExpRepOptCB", "INV_Scroll_05", 6 )
			ARL_ExpRepOptCB:SetPoint( "TOPLEFT", ARL_ExpPlayerOptCB, "BOTTOMLEFT", -0, -8 )

		-- Frame for the flyaway pane
			addon.Flyaway = CreateFrame("Frame", "addon.Flyaway", addon.Frame)
				addon.Flyaway:SetWidth(234)
				addon.Flyaway:SetHeight(312)

				addon.flyTexture = addon.Flyaway:CreateTexture( "AckisRecipeList.flyTexture", "ARTWORK" )
				addon.flyTexture:SetTexture( [[Interface\Addons\AckisRecipeList\img\fly_2col]] )
				addon.flyTexture:SetAllPoints( addon.Flyaway )
				addon.flyTexture:SetTexCoord( 0, (234/256), 0, (312/512) )
				addon.Flyaway:SetFrameStrata( "LOW" )
				addon.Flyaway:SetHitRectInsets( 5, 5, 5, 5 )

				addon.Flyaway:EnableMouse(true)
				addon.Flyaway:EnableKeyboard(true)
				addon.Flyaway:SetMovable(false)

				addon.Flyaway:ClearAllPoints()
				addon.Flyaway:SetPoint("TOPLEFT", addon.Frame, "TOPRIGHT", -6, -102)

				addon.Flyaway:SetScript( "OnShow", addon.setFlyawayState ) 
				addon.Flyaway:Hide()

		-- Flyaway virtual frames to group buttons/text easily (and make them easy to show/hide)

			addon.Fly_General = CreateFrame( "Frame", "addon.Fly_General", addon.Flyaway )
				addon.Fly_General:SetWidth( 210 )
				addon.Fly_General:SetHeight( 280 )
				addon.Fly_General:SetFrameStrata( "MEDIUM" )
				addon.Fly_General:EnableMouse( true )
				addon.Fly_General:EnableKeyboard( true )
				addon.Fly_General:SetMovable( false )
				addon.Fly_General:SetPoint( "TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16 )
				addon.Fly_General:Hide()
--[[			( ) Class Specific recipes
				( ) Craft Specialty recipes
				( ) All skill levels
				( ) Cross-Faction
				( ) Known	  ( ) Unknown		]]--
				local ARL_ClassCB = CreateFrame( "CheckButton", "ARL_ClassCB", addon.Fly_General, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ClassCB, addon.Fly_General, L["CLASS_TOGGLE"], 1, 1, 1, 0 )
					ARL_ClassCBText:SetText( L["Class Specific recipes"] )
				local ARL_SpecialtyCB = CreateFrame( "CheckButton", "ARL_SpecialtyCB", addon.Fly_General, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_SpecialtyCB, addon.Fly_General, L["SPECIALITY_TOGGLE"], 2, 2, 1, 0 )
					ARL_SpecialtyCBText:SetText( L["Craft Specialty recipes"] )
				local ARL_LevelCB = CreateFrame( "CheckButton", "ARL_LevelCB", addon.Fly_General, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_LevelCB, addon.Fly_General, L["SKILL_TOGGLE"], 3, 3, 1, 0 )
					ARL_LevelCBText:SetText( L["All Skill Levels"] )
				local ARL_FactionCB = CreateFrame( "CheckButton", "ARL_FactionCB", addon.Fly_General, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_FactionCB, addon.Fly_General, L["FACTION_TOGGLE"], 4, 4, 1, 0 )
					ARL_FactionCBText:SetText( L["Faction"] )
				local ARL_KnownCB = CreateFrame( "CheckButton", "ARL_KnownCB", addon.Fly_General, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_KnownCB, addon.Fly_General, L["KNOWN_TT"], 5, 5, 1, 0 )
					ARL_KnownCBText:SetText( L["Known"] )
				local ARL_UnknownCB = CreateFrame( "CheckButton", "ARL_UnknownCB", addon.Fly_General, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_UnknownCB, addon.Fly_General, L["UNKNOWN_TT"], 6, 5, 2, 0 )
					ARL_UnknownCBText:SetText( L["Unknown"] )

			addon.Fly_Obtain = CreateFrame( "Frame", "addon.Fly_Obtain", addon.Flyaway )
				addon.Fly_Obtain:SetWidth( 210 )
				addon.Fly_Obtain:SetHeight( 280 )
				addon.Fly_Obtain:SetFrameStrata( "MEDIUM" )
				addon.Fly_Obtain:EnableMouse( true )
				addon.Fly_Obtain:EnableKeyboard( true )
				addon.Fly_Obtain:SetMovable( false )
				addon.Fly_Obtain:SetPoint( "TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16 )
				addon.Fly_Obtain:Hide()
--[[			( ) Instance	( ) Raid
				( ) Quest		( ) Seasonal
				( ) Trainer		( ) Vendor
				( ) PVP			( ) Discovery
				( ) World Drop	( ) Mob Drop					]]--
				local ARL_InstanceCB = CreateFrame( "CheckButton", "ARL_InstanceCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_InstanceCB, addon.Fly_Obtain, L["INSTANCE_TOGGLE"], 7, 1, 1, 0 )
					ARL_InstanceCBText:SetText( L["Instance"] )
				local ARL_RaidCB = CreateFrame( "CheckButton", "ARL_RaidCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RaidCB, addon.Fly_Obtain, L["RAID_TOGGLE"], 8, 2, 1, 0 )
					ARL_RaidCBText:SetText( L["Raid"] )
				local ARL_QuestCB = CreateFrame( "CheckButton", "ARL_QuestCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_QuestCB, addon.Fly_Obtain, L["QUEST_TOGGLE"], 9, 3, 1, 0 )
					ARL_QuestCBText:SetText( L["Quest"] )
				local ARL_SeasonalCB = CreateFrame( "CheckButton", "ARL_SeasonalCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_SeasonalCB, addon.Fly_Obtain, L["SEASONAL_TOGGLE"], 10, 4, 1, 0 )
					ARL_SeasonalCBText:SetText( L["Seasonal"] )
				local ARL_TrainerCB = CreateFrame( "CheckButton", "ARL_TrainerCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_TrainerCB, addon.Fly_Obtain, L["TRAINER_TOGGLE"], 11, 5, 1, 0 )
					ARL_TrainerCBText:SetText( L["Trainer"] )
				local ARL_VendorCB = CreateFrame( "CheckButton", "ARL_VendorCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_VendorCB, addon.Fly_Obtain, L["VENDOR_TOGGLE"], 12, 6, 1, 0 )
					ARL_VendorCBText:SetText( L["Vendor"] )
				local ARL_PVPCB = CreateFrame( "CheckButton", "ARL_PVPCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_PVPCB, addon.Fly_Obtain, L["PVP_TOGGLE"], 13, 7, 1, 0 )
					ARL_PVPCBText:SetText( L["PVP"] )
				local ARL_DiscoveryCB = CreateFrame( "CheckButton", "ARL_DiscoveryCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_DiscoveryCB, addon.Fly_Obtain, L["DISCOVERY_TT"], 14, 8, 1, 0 )
					ARL_DiscoveryCBText:SetText( L["Discovery"] )
				local ARL_WorldDropCB = CreateFrame( "CheckButton", "ARL_WorldDropCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WorldDropCB, addon.Fly_Obtain, L["WORLD_DROP_TOGGLE"], 39, 9, 1, 0 )
					ARL_WorldDropCBText:SetText( L["World Drop"] )
				local ARL_MobDropCB = CreateFrame( "CheckButton", "ARL_MobDropCB", addon.Fly_Obtain, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_MobDropCB, addon.Fly_Obtain, L["MOB_DROP_TT"], 40, 10, 1, 0 )
					ARL_MobDropCBText:SetText( L["Mob Drop"] )

			addon.Fly_Binding = CreateFrame( "Frame", "addon.Fly_Binding", addon.Flyaway )
				addon.Fly_Binding:SetWidth( 210 )
				addon.Fly_Binding:SetHeight( 280 )
				addon.Fly_Binding:SetFrameStrata( "MEDIUM" )
				addon.Fly_Binding:EnableMouse( true )
				addon.Fly_Binding:EnableKeyboard( true )
				addon.Fly_Binding:SetMovable( false )
				addon.Fly_Binding:SetPoint( "TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16 )
				addon.Fly_Binding:Hide()
--[[			( ) Crafted Item is Bind on Equip
				( ) Crafted Item is Bind on Pickup
				( ) Recipe is Bind on Equip
				( ) Recipe is Bind on Pickup		]]--
				local ARL_iBoECB = CreateFrame( "CheckButton", "ARL_iBoECB", addon.Fly_Binding, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_iBoECB, addon.Fly_Binding, L["IBOE_TT"], 15, 1, 1, 0 )
					ARL_iBoECBText:SetText( L["IBOE"] )
				local ARL_iBoPCB = CreateFrame( "CheckButton", "ARL_iBoPCB", addon.Fly_Binding, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_iBoPCB, addon.Fly_Binding, L["IBOP_TT"], 16, 2, 1, 0 )
					ARL_iBoPCBText:SetText( L["IBOP"] )
				local ARL_rBoECB = CreateFrame( "CheckButton", "ARL_rBoECB", addon.Fly_Binding, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_rBoECB, addon.Fly_Binding, L["RBOE_TT"], 17, 3, 1, 0 )
					ARL_rBoECBText:SetText( L["RBOE"] )
				local ARL_rBoPCB = CreateFrame( "CheckButton", "ARL_rBoPCB", addon.Fly_Binding, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_rBoPCB, addon.Fly_Binding, L["RBOP_TT"], 18, 4, 1, 0 )
					ARL_rBoPCBText:SetText( L["RBOP"] )

			addon.Fly_Item = CreateFrame( "Frame", "addon.Fly_Item", addon.Flyaway )
				addon.Fly_Item:SetWidth( 210 )
				addon.Fly_Item:SetHeight( 280 )
				addon.Fly_Item:SetFrameStrata( "MEDIUM" )
				addon.Fly_Item:EnableMouse( true )
				addon.Fly_Item:EnableKeyboard( true )
				addon.Fly_Item:SetMovable( false )
				addon.Fly_Item:SetPoint( "TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16 )
				addon.Fly_Item:Hide()
--[[			Armor:
					( ) All		( ) None
					( ) Cloth	( ) Leather
					( ) Mail	( ) Plate
					
					( ) Cloak	( ) Necklace
					( ) Rings	( ) Trinkets ]]--
				local ARL_ArmorText = addon.Fly_Item:CreateFontString( "ARL_ArmorText", "OVERLAY", "GameFontHighlight" )
					ARL_ArmorText:SetText( L["Armor"] .. ":" )
					ARL_ArmorText:SetPoint( "TOPLEFT", addon.Fly_Item, "TOPLEFT", 5, -8 )
					ARL_ArmorText:SetHeight( 14 )
					ARL_ArmorText:SetWidth( 150 )
					ARL_ArmorText:SetJustifyH( "LEFT" )
				local ARL_ArmorAllCB = CreateFrame( "CheckButton", "ARL_ArmorAllCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorAllCB, addon.Fly_Item, L["ArmorAll_TT"], 19, 2, 1, 0 )
					ARL_ArmorAllCBText:SetText( L["All"] )
				local ARL_ArmorNoneCB = CreateFrame( "CheckButton", "ARL_ArmorNoneCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorNoneCB, addon.Fly_Item, L["ArmorNone_TT"], 20, 2, 2, 0 )
					ARL_ArmorNoneCBText:SetText( L["None"] )
				local ARL_ArmorClothCB = CreateFrame( "CheckButton", "ARL_ArmorClothCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorClothCB, addon.Fly_Item, L["CLOTH_TOGGLE"], 21, 3, 1, 0 )
					ARL_ArmorClothCBText:SetText( L["Cloth"] )
				local ARL_ArmorLeatherCB = CreateFrame( "CheckButton", "ARL_ArmorLeatherCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorLeatherCB, addon.Fly_Item, L["LEATHER_TOGGLE"], 22, 3, 2, 0 )
					ARL_ArmorLeatherCBText:SetText( L["Leather"] )
				local ARL_ArmorMailCB = CreateFrame( "CheckButton", "ARL_ArmorMailCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorMailCB, addon.Fly_Item, L["MAIL_TOGGLE"], 23, 4, 1, 0 )
					ARL_ArmorMailCBText:SetText( L["Mail"] )
				local ARL_ArmorPlateCB = CreateFrame( "CheckButton", "ARL_ArmorPlateCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorPlateCB, addon.Fly_Item, L["PLATE_TOGGLE"], 24, 4, 2, 0 )
					ARL_ArmorPlateCBText:SetText( L["Plate"] )

				local ARL_ArmorCloakCB = CreateFrame( "CheckButton", "ARL_ArmorCloakCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorCloakCB, addon.Fly_Item, L["CLOAK_TOGGLE"], 64, 5, 1, 0 )
					ARL_ArmorCloakCBText:SetText( L["Cloak"] )
				local ARL_ArmorNecklaceCB = CreateFrame( "CheckButton", "ARL_ArmorNecklaceCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorNecklaceCB, addon.Fly_Item, L["NECKLACE_TOGGLE"], 65, 5, 2, 0 )
					ARL_ArmorNecklaceCBText:SetText( L["Necklace"] )
				local ARL_ArmorRingCB = CreateFrame( "CheckButton", "ARL_ArmorRingCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorRingCB, addon.Fly_Item, L["RING_TOGGLE"], 66, 6, 1, 0 )
					ARL_ArmorRingCBText:SetText( L["Ring"] )
				local ARL_ArmorTrinketCB = CreateFrame( "CheckButton", "ARL_ArmorTrinketCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_ArmorTrinketCB, addon.Fly_Item, L["TRINKET_TOGGLE"], 67, 6, 2, 0 )
					ARL_ArmorTrinketCBText:SetText( L["Trinket"] )
--[[			Weapon:
					( ) All		( ) None
					( ) 1H		( ) 2H
					( ) Dagger	( ) Axe
					( ) Mace	( ) Sword
					( ) Polearm	( ) Thrown
					( ) Bow		( ) Crossbow
					( ) Staff						]]--
				local ARL_WeaponText = addon.Fly_Item:CreateFontString( "ARL_WeaponText", "OVERLAY", "GameFontHighlight" )
					ARL_WeaponText:SetText( L["Weapon"] .. ":" )
					ARL_WeaponText:SetPoint( "TOPLEFT", addon.Fly_Item, "TOPLEFT", 5, -116 )
					ARL_WeaponText:SetHeight( 14 )
					ARL_WeaponText:SetWidth( 150 )
					ARL_WeaponText:SetJustifyH( "LEFT" )
				local ARL_WeaponAllCB = CreateFrame( "CheckButton", "ARL_WeaponAllCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponAllCB, addon.Fly_Item, L["WeaponAll_TT"], 25, 8, 1, 0 )
					ARL_WeaponAllCBText:SetText( L["All"] )
				local ARL_WeaponNoneCB = CreateFrame( "CheckButton", "ARL_WeaponNoneCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponNoneCB, addon.Fly_Item, L["WeaponNone_TT"], 26, 8, 2, 0 )
					ARL_WeaponNoneCBText:SetText( L["None"] )
				local ARL_Weapon1HCB = CreateFrame( "CheckButton", "ARL_Weapon1HCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_Weapon1HCB, addon.Fly_Item, L["Weapon1H_TT"], 27, 9, 1, 0 )
					ARL_Weapon1HCBText:SetText( L["1H"] )
				local ARL_Weapon2HCB = CreateFrame( "CheckButton", "ARL_Weapon2HCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_Weapon2HCB, addon.Fly_Item, L["Weapon2H_TT"], 28, 9, 2, 0 )
					ARL_Weapon2HCBText:SetText( L["2H"] )
				local ARL_WeaponDaggerCB = CreateFrame( "CheckButton", "ARL_WeaponDaggerCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponDaggerCB, addon.Fly_Item, L["WeaponDagger_TT"], 29, 10, 1, 0 )
					ARL_WeaponDaggerCBText:SetText( L["Dagger"] )
				local ARL_WeaponAxeCB = CreateFrame( "CheckButton", "ARL_WeaponAxeCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponAxeCB, addon.Fly_Item, L["WeaponAxe_TT"], 30, 10, 2, 0 )
					ARL_WeaponAxeCBText:SetText( L["Axe"] )
				local ARL_WeaponMaceCB = CreateFrame( "CheckButton", "ARL_WeaponMaceCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponMaceCB, addon.Fly_Item, L["WeaponMace_TT"], 31, 11, 1, 0 )
					ARL_WeaponMaceCBText:SetText( L["Mace"] )
				local ARL_WeaponSwordCB = CreateFrame( "CheckButton", "ARL_WeaponSwordCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponSwordCB, addon.Fly_Item, L["WeaponSword_TT"], 32, 11, 2, 0 )
					ARL_WeaponSwordCBText:SetText( L["Sword"] )
				local ARL_WeaponPolearmCB = CreateFrame( "CheckButton", "ARL_WeaponPolearmCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponPolearmCB, addon.Fly_Item, L["WeaponPolearm_TT"], 33, 12, 1, 0 )
					ARL_WeaponPolearmCBText:SetText( L["Polearm"] )
				local ARL_WeaponStaffCB = CreateFrame( "CheckButton", "ARL_WeaponStaffCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponStaffCB, addon.Fly_Item, L["WeaponStaff_TT"], 34, 12, 2, 0 )
					ARL_WeaponStaffCBText:SetText( L["Staff"] )
					-- Disabled for now...
					ARL_WeaponStaffCBText:SetText( addon:Grey( L["Staff"] ) )
					ARL_WeaponStaffCB:Disable()
				local ARL_WeaponWandCB = CreateFrame( "CheckButton", "ARL_WeaponWandCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponWandCB, addon.Fly_Item, L["WeaponWand_TT"], 68, 13, 1, 0 )
					ARL_WeaponWandCBText:SetText( L["Wand"] )
				local ARL_WeaponThrownCB = CreateFrame( "CheckButton", "ARL_WeaponThrownCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponThrownCB, addon.Fly_Item, L["WeaponThrown_TT"], 35, 13, 2, 0 )
					ARL_WeaponThrownCBText:SetText( L["Thrown"] )
				local ARL_WeaponBowCB = CreateFrame( "CheckButton", "ARL_WeaponBowCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponBowCB, addon.Fly_Item, L["WeaponBow_TT"], 36, 14, 1, 0 )
					ARL_WeaponBowCBText:SetText( L["Bow"] )
					-- Disabled for now...
					ARL_WeaponBowCBText:SetText( addon:Grey( L["Bow"] ) )
					ARL_WeaponBowCB:Disable()
				local ARL_WeaponCrossbowCB = CreateFrame( "CheckButton", "ARL_WeaponCrossbowCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponCrossbowCB, addon.Fly_Item, L["WeaponCrossbow_TT"], 37, 14, 2, 0 )
					ARL_WeaponCrossbowCBText:SetText( L["Crossbow"] )
					-- Disabled for now...
					ARL_WeaponCrossbowCBText:SetText( addon:Grey( L["Crossbow"] ) )
					ARL_WeaponCrossbowCB:Disable()
				local ARL_WeaponAmmoCB = CreateFrame( "CheckButton", "ARL_WeaponAmmoCB", addon.Fly_Item, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_WeaponAmmoCB, addon.Fly_Item, L["WeaponAmmo_TT"], 38, 15, 1, 0 )
					ARL_WeaponAmmoCBText:SetText( L["Ammo"] )

			addon.Fly_Player= CreateFrame( "Frame", "addon.Fly_Player", addon.Flyaway )
				addon.Fly_Player:SetWidth( 112 )
				addon.Fly_Player:SetHeight( 280 )
				addon.Fly_Player:SetFrameStrata( "MEDIUM" )
				addon.Fly_Player:EnableMouse( true )
				addon.Fly_Player:EnableKeyboard( true )
				addon.Fly_Player:SetMovable( false )
				addon.Fly_Player:SetPoint( "TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16 )
				addon.Fly_Player:Hide()
--[[			( ) Tank	  ( ) Melee DPS
				( ) Healer	  ( ) Caster DPS		]]--
				local ARL_PlayerTankCB = CreateFrame( "CheckButton", "ARL_PlayerTankCB", addon.Fly_Player, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_PlayerTankCB, addon.Fly_Player, L["TANKING_TOGGLE"], 41, 1, 1, 0 )
					ARL_PlayerTankCBText:SetText( L["Tank"] )
				local ARL_PlayerMeleeCB = CreateFrame( "CheckButton", "ARL_PlayerMeleeCB", addon.Fly_Player, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_PlayerMeleeCB, addon.Fly_Player, L["MELEE_TOGGLE"], 42, 2, 1, 0 )
					ARL_PlayerMeleeCBText:SetText( L["Melee DPS"] )
				local ARL_PlayerHealerCB = CreateFrame( "CheckButton", "ARL_PlayerHealerCB", addon.Fly_Player, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_PlayerHealerCB, addon.Fly_Player, L["HEALING_TOGGLE"], 43, 3, 1, 0 )
					ARL_PlayerHealerCBText:SetText( L["Healer"] )
				local ARL_PlayerCasterCB = CreateFrame( "CheckButton", "ARL_PlayerCasterCB", addon.Fly_Player, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_PlayerCasterCB, addon.Fly_Player, L["CASTERDPS_TOGGLE"], 44, 4, 1, 0 )
					ARL_PlayerCasterCBText:SetText( L["Caster DPS"] )

			addon.Fly_Rep = CreateFrame( "Frame", "addon.Fly_Rep", addon.Flyaway )
				addon.Fly_Rep:SetWidth( 112 )
				addon.Fly_Rep:SetHeight( 280 )
				addon.Fly_Rep:SetFrameStrata( "MEDIUM" )
				addon.Fly_Rep:EnableMouse( true )
				addon.Fly_Rep:EnableKeyboard( true )
				addon.Fly_Rep:SetMovable( false )
				addon.Fly_Rep:SetPoint( "TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16 )
				addon.Fly_Rep:Hide()

				ARL_RepOldWorldCB = addon:CreateExpCB( "ARL_RepOldWorldCB", "Glues-WoW-Logo", 1 )
				ARL_RepOldWorldCB:SetPoint( "TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -10 )
				ARL_RepOldWorldCB:SetScript( "OnClick", function()
					addon.RepFilterSwitch( 1 )
				end )

				ARL_RepBCCB = addon:CreateExpCB( "ARL_RepBCCB", "GLUES-WOW-BCLOGO", 1 )
				ARL_RepBCCB:SetPoint( "TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -60 )
				ARL_RepBCCB:SetScript( "OnClick", function()
					addon.RepFilterSwitch( 2 )
				end )

				addon.Fly_Rep_OW= CreateFrame( "Frame", "addon.Fly_Rep_OW", addon.Fly_Rep )
				addon.Fly_Rep_OW:SetWidth( 150 )
				addon.Fly_Rep_OW:SetHeight( 280 )
				addon.Fly_Rep_OW:SetFrameStrata( "MEDIUM" )
				addon.Fly_Rep_OW:EnableMouse( true )
				addon.Fly_Rep_OW:EnableKeyboard( true )
				addon.Fly_Rep_OW:SetMovable( false )
				addon.Fly_Rep_OW:SetPoint( "TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16 )
				addon.Fly_Rep_OW:Hide()
--[[			( ) Argent Dawn
				( ) Cenarion Circle
				( ) Thorium Brotherhood
				( ) Timbermaw Hold
				( ) Zandalar Tribe				]]--
				local ARL_RepArgentDawnCB = CreateFrame( "CheckButton", "ARL_RepArgentDawnCB", addon.Fly_Rep_OW, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepArgentDawnCB, addon.Fly_Rep_OW,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Argent Dawn"] ), 45, 1, 1, 0 )
					ARL_RepArgentDawnCBText:SetText( BFAC["Argent Dawn"] )
					ARL_RepArgentDawnCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepCenarionCircleCB = CreateFrame( "CheckButton", "ARL_RepCenarionCircleCB", addon.Fly_Rep_OW, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepCenarionCircleCB, addon.Fly_Rep_OW,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Cenarion Circle"] ), 46, 2, 1, 0 )
					ARL_RepCenarionCircleCBText:SetText( BFAC["Cenarion Circle"] )
					ARL_RepCenarionCircleCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepThoriumCB = CreateFrame( "CheckButton", "ARL_RepThoriumCB", addon.Fly_Rep_OW, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepThoriumCB, addon.Fly_Rep_OW,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Thorium Brotherhood"] ), 47, 3, 1, 0 )
					ARL_RepThoriumCBText:SetText( BFAC["Thorium Brotherhood"] )
					ARL_RepThoriumCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepTimbermawCB = CreateFrame( "CheckButton", "ARL_RepTimbermawCB", addon.Fly_Rep_OW, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepTimbermawCB, addon.Fly_Rep_OW,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Timbermaw Hold"] ), 48, 4, 1, 0 )
					ARL_RepTimbermawCBText:SetText( BFAC["Timbermaw Hold"] )
					ARL_RepTimbermawCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepZandalarCB = CreateFrame( "CheckButton", "ARL_RepZandalarCB", addon.Fly_Rep_OW, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepZandalarCB, addon.Fly_Rep_OW,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Zandalar Tribe"] ), 49, 5, 1, 0 )
					ARL_RepZandalarCBText:SetText( BFAC["Zandalar Tribe"] )
					ARL_RepZandalarCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )

				addon.Fly_Rep_BC= CreateFrame( "Frame", "addon.Fly_Rep_BC", addon.Fly_Rep )
				addon.Fly_Rep_BC:SetWidth( 150 )
				addon.Fly_Rep_BC:SetHeight( 280 )
				addon.Fly_Rep_BC:SetFrameStrata( "MEDIUM" )
				addon.Fly_Rep_BC:EnableMouse( true )
				addon.Fly_Rep_BC:EnableKeyboard( true )
				addon.Fly_Rep_BC:SetMovable( false )
				addon.Fly_Rep_BC:SetPoint( "TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16 )
				addon.Fly_Rep_BC:Hide()
--[[			( ) The Aldor
				( ) Ashtongue Deathsworn
				( ) Cenarion Expedition
				( ) The Consortium
				( ) Honor Hold / Thrallmar
				( ) Keepers of Time
				( ) Kurenai / The Mag'har
				( ) Lower City
				( ) The Scale of the Sands
				( ) The Scryers
				( ) The Sha'tar
				( ) Shattered Sun Offensive
				( ) Sporeggar
				( ) The Violet Eye				]]--
				local ARL_RepAldorCB = CreateFrame( "CheckButton", "ARL_RepAldorCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepAldorCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["The Aldor"] ), 50, 1, 1, 0 )
					ARL_RepAldorCBText:SetText( BFAC["The Aldor"] )
					ARL_RepAldorCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepAshtongueCB = CreateFrame( "CheckButton", "ARL_RepAshtongueCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepAshtongueCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Ashtongue Deathsworn"] ), 51, 2, 1, 0 )
					ARL_RepAshtongueCBText:SetText( BFAC["Ashtongue Deathsworn"] )
					ARL_RepAshtongueCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepCenarionExpeditionCB = CreateFrame( "CheckButton", "ARL_RepCenarionExpeditionCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepCenarionExpeditionCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Cenarion Expedition"] ), 52, 3, 1, 0 )
					ARL_RepCenarionExpeditionCBText:SetText( BFAC["Cenarion Expedition"] )
					ARL_RepCenarionExpeditionCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepConsortiumCB = CreateFrame( "CheckButton", "ARL_RepConsortiumCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepConsortiumCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["The Consortium"] ), 53, 4, 1, 0 )
					ARL_RepConsortiumCBText:SetText( BFAC["The Consortium"] )
					ARL_RepConsortiumCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepHonorHoldCB = CreateFrame( "CheckButton", "ARL_RepHonorHoldCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepHonorHoldCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], addon.HonorHold_Thrallmar_FactionText ), 54, 5, 1, 0 )
					ARL_RepHonorHoldCBText:SetText( addon.HonorHold_Thrallmar_FactionText )
					ARL_RepHonorHoldCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepKeepersOfTimeCB = CreateFrame( "CheckButton", "ARL_RepKeepersOfTimeCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepKeepersOfTimeCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Keepers of Time"] ), 55, 6, 1, 0 )
					ARL_RepKeepersOfTimeCBText:SetText( BFAC["Keepers of Time"] )
					ARL_RepKeepersOfTimeCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepKurenaiCB = CreateFrame( "CheckButton", "ARL_RepKurenaiCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepKurenaiCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], addon.Kurenai_Maghar_FactionText ), 56, 7, 1, 0 )
					ARL_RepKurenaiCBText:SetText( addon.Kurenai_Maghar_FactionText )
					ARL_RepKurenaiCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepLowerCityCB = CreateFrame( "CheckButton", "ARL_RepLowerCityCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepLowerCityCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Lower City"] ), 57, 8, 1, 0 )
					ARL_RepLowerCityCBText:SetText( BFAC["Lower City"] )
					ARL_RepLowerCityCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepScaleSandsCB = CreateFrame( "CheckButton", "ARL_RepScaleSandsCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepScaleSandsCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["The Scale of the Sands"] ), 58, 9, 1, 0 )
					ARL_RepScaleSandsCBText:SetText( BFAC["The Scale of the Sands"] )
					ARL_RepScaleSandsCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepScryersCB = CreateFrame( "CheckButton", "ARL_RepScryersCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepScryersCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["The Scryers"] ), 59, 10, 1, 0 )
					ARL_RepScryersCBText:SetText( BFAC["The Scryers"] )
					ARL_RepScryersCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepShatarCB = CreateFrame( "CheckButton", "ARL_RepShatarCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepShatarCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["The Sha'tar"] ), 60, 11, 1, 0 )
					ARL_RepShatarCBText:SetText( BFAC["The Sha'tar"] )
					ARL_RepShatarCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepShatteredSunCB = CreateFrame( "CheckButton", "ARL_RepShatteredSunCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepShatteredSunCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Shattered Sun Offensive"] ), 61, 12, 1, 0 )
					ARL_RepShatteredSunCBText:SetText( BFAC["Shattered Sun Offensive"] )
					ARL_RepShatteredSunCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepSporeggarCB = CreateFrame( "CheckButton", "ARL_RepSporeggarCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepSporeggarCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["Sporeggar"] ), 62, 13, 1, 0 )
					ARL_RepSporeggarCBText:SetText( BFAC["Sporeggar"] )
					ARL_RepSporeggarCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )
				local ARL_RepVioletEyeCB = CreateFrame( "CheckButton", "ARL_RepVioletEyeCB", addon.Fly_Rep_BC, "UICheckButtonTemplate" )
					addon:GenericMakeCB( ARL_RepVioletEyeCB, addon.Fly_Rep_BC,
						string.format( L["SPECIFIC_REP_TOGGLE"], BFAC["The Violet Eye"] ), 63, 14, 1, 0 )
					ARL_RepVioletEyeCBText:SetText( BFAC["The Violet Eye"] )
					ARL_RepVioletEyeCBText:SetFont( [[Fonts\ARIALN.TTF]], 11 )

			-- Now that everything exists, populate the global filter table
			addon.FilterValueMap = {
			-- General Options
				[1]  = { cb = ARL_ClassCB,					svroot = addon.db.profile.filters.general, svval = "class" },
				[2]  = { cb = ARL_SpecialtyCB,				svroot = addon.db.profile.filters.general, svval = "specialty" },
				[3]  = { cb = ARL_LevelCB,					svroot = addon.db.profile.filters.general, svval = "skill" },
				[4]  = { cb = ARL_FactionCB,				svroot = addon.db.profile.filters.general, svval = "faction" },
				[5]  = { cb = ARL_KnownCB,					svroot = addon.db.profile.filters.general, svval = "known" },
				[6]  = { cb = ARL_UnknownCB,				svroot = addon.db.profile.filters.general, svval = "unknown" },
			-- Obtain Options
				[7]  = { cb = ARL_InstanceCB,				svroot = addon.db.profile.filters.obtain, svval = "instance" },
				[8]  = { cb = ARL_RaidCB,					svroot = addon.db.profile.filters.obtain, svval = "raid" },
				[9]  = { cb = ARL_QuestCB,					svroot = addon.db.profile.filters.obtain, svval = "quest" },
				[10] = { cb = ARL_SeasonalCB,				svroot = addon.db.profile.filters.obtain, svval = "seasonal" },
				[11] = { cb = ARL_TrainerCB,				svroot = addon.db.profile.filters.obtain, svval = "trainer" },
				[12] = { cb = ARL_VendorCB,					svroot = addon.db.profile.filters.obtain, svval = "vendor" },
				[13] = { cb = ARL_PVPCB,					svroot = addon.db.profile.filters.obtain, svval = "pvp" },
				[14] = { cb = ARL_DiscoveryCB,				svroot = addon.db.profile.filters.obtain, svval = "discovery" },
				[39] = { cb = ARL_WorldDropCB,				svroot = addon.db.profile.filters.obtain, svval = "worlddrop" },
				[40] = { cb = ARL_MobDropCB,				svroot = addon.db.profile.filters.obtain, svval = "mobdrop" },
			-- Binding Options
				[15] = { cb = ARL_iBoECB,					svroot = addon.db.profile.filters.binding, svval = "itemboe" },
				[16] = { cb = ARL_iBoPCB,					svroot = addon.db.profile.filters.binding, svval = "itembop" },
				[17] = { cb = ARL_rBoECB,					svroot = addon.db.profile.filters.binding, svval = "recipeboe" },
				[18] = { cb = ARL_rBoPCB,					svroot = addon.db.profile.filters.binding, svval = "recipebop" },
			-- Armor Options
				[19] = { cb = ARL_ArmorAllCB,				svroot = "special case handler",			  svval = "" },
				[20] = { cb = ARL_ArmorNoneCB,				svroot = "special case handler",			  svval = "" },
				[21] = { cb = ARL_ArmorClothCB,				svroot = addon.db.profile.filters.item.armor, svval = "cloth" },
				[22] = { cb = ARL_ArmorLeatherCB,			svroot = addon.db.profile.filters.item.armor, svval = "leather" },
				[23] = { cb = ARL_ArmorMailCB,				svroot = addon.db.profile.filters.item.armor, svval = "mail" },
				[24] = { cb = ARL_ArmorPlateCB,				svroot = addon.db.profile.filters.item.armor, svval = "plate" },
				[64] = { cb = ARL_ArmorCloakCB,				svroot = addon.db.profile.filters.item.armor, svval = "cloak" },
				[65] = { cb = ARL_ArmorNecklaceCB,			svroot = addon.db.profile.filters.item.armor, svval = "necklace" },
				[66] = { cb = ARL_ArmorRingCB,				svroot = addon.db.profile.filters.item.armor, svval = "ring" },
				[67] = { cb = ARL_ArmorTrinketCB,			svroot = addon.db.profile.filters.item.armor, svval = "trinket" },
			-- Weapon Options
				[25] = { cb = ARL_WeaponAllCB,				svroot = "special case handler",			   svval = "" },
				[26] = { cb = ARL_WeaponNoneCB,				svroot = "special case handler",			   svval = "" },
				[27] = { cb = ARL_Weapon1HCB,				svroot = addon.db.profile.filters.item.weapon, svval = "onehand" },
				[28] = { cb = ARL_Weapon2HCB,				svroot = addon.db.profile.filters.item.weapon, svval = "twohand" },
				[29] = { cb = ARL_WeaponDaggerCB,			svroot = addon.db.profile.filters.item.weapon, svval = "dagger" },
				[30] = { cb = ARL_WeaponAxeCB,				svroot = addon.db.profile.filters.item.weapon, svval = "axe" },
				[31] = { cb = ARL_WeaponMaceCB,				svroot = addon.db.profile.filters.item.weapon, svval = "mace" },
				[32] = { cb = ARL_WeaponSwordCB,			svroot = addon.db.profile.filters.item.weapon, svval = "sword" },
				[33] = { cb = ARL_WeaponPolearmCB,			svroot = addon.db.profile.filters.item.weapon, svval = "polearm" },
				[34] = { cb = ARL_WeaponStaffCB,			svroot = "disabled",						   svval = "" },
				[68] = { cb = ARL_WeaponWandCB,				svroot = addon.db.profile.filters.item.weapon, svval = "wand" },
				[35] = { cb = ARL_WeaponThrownCB,			svroot = addon.db.profile.filters.item.weapon, svval = "thrown" },
				[36] = { cb = ARL_WeaponBowCB,				svroot = "disabled",						   svval = "" },
				[37] = { cb = ARL_WeaponCrossbowCB,			svroot = "disabled",						   svval = "" },
				[38] = { cb = ARL_WeaponAmmoCB,				svroot = addon.db.profile.filters.item.weapon, svval = "ammo" },
			-- Player Type Options
				[41] = { cb = ARL_PlayerTankCB,				svroot = addon.db.profile.filters.player, svval = "tank" },
				[42] = { cb = ARL_PlayerMeleeCB,			svroot = addon.db.profile.filters.player, svval = "melee" },
				[43] = { cb = ARL_PlayerHealerCB,			svroot = addon.db.profile.filters.player, svval = "healer" },
				[44] = { cb = ARL_PlayerCasterCB,			svroot = addon.db.profile.filters.player, svval = "caster" },
			-- Old World Rep Options
				[45] = { cb = ARL_RepArgentDawnCB,			svroot = addon.db.profile.filters.rep, svval = "argentdawn" },
				[46] = { cb = ARL_RepCenarionCircleCB,		svroot = addon.db.profile.filters.rep, svval = "cenarioncircle" },
				[47] = { cb = ARL_RepThoriumCB,				svroot = addon.db.profile.filters.rep, svval = "thoriumbrotherhood" },
				[48] = { cb = ARL_RepTimbermawCB,			svroot = addon.db.profile.filters.rep, svval = "timbermaw" },
				[49] = { cb = ARL_RepZandalarCB,			svroot = addon.db.profile.filters.rep, svval = "zandalar" },
			-- BC Rep Options
				[50] = { cb = ARL_RepAldorCB,				svroot = addon.db.profile.filters.rep, svval = "aldor" },
				[51] = { cb = ARL_RepAshtongueCB,			svroot = addon.db.profile.filters.rep, svval = "ashtonguedeathsworn" },
				[52] = { cb = ARL_RepCenarionExpeditionCB,	svroot = addon.db.profile.filters.rep, svval = "cenarionexpedition" },
				[53] = { cb = ARL_RepConsortiumCB,			svroot = addon.db.profile.filters.rep, svval = "consortium" },
				[54] = { cb = ARL_RepHonorHoldCB,			svroot = addon.db.profile.filters.rep, svval = "hellfire" },
				[55] = { cb = ARL_RepKeepersOfTimeCB,		svroot = addon.db.profile.filters.rep, svval = "keepersoftime" },
				[56] = { cb = ARL_RepKurenaiCB,				svroot = addon.db.profile.filters.rep, svval = "nagrand" },
				[57] = { cb = ARL_RepLowerCityCB,			svroot = addon.db.profile.filters.rep, svval = "lowercity" },
				[58] = { cb = ARL_RepScaleSandsCB,			svroot = addon.db.profile.filters.rep, svval = "scaleofthesands" },
				[59] = { cb = ARL_RepScryersCB,				svroot = addon.db.profile.filters.rep, svval = "scryer" },
				[60] = { cb = ARL_RepShatarCB,				svroot = addon.db.profile.filters.rep, svval = "shatar" },
				[61] = { cb = ARL_RepShatteredSunCB,		svroot = addon.db.profile.filters.rep, svval = "shatteredsun" },
				[62] = { cb = ARL_RepSporeggarCB,			svroot = addon.db.profile.filters.rep, svval = "sporeggar" },
				[63] = { cb = ARL_RepVioletEyeCB,			svroot = addon.db.profile.filters.rep, svval = "violeteye" },
			}

		end
		-- We'll be in "ExpandAll" mode to start with. Make sure the button knows that:
		ARL_ExpandButton:SetText( L["ExpandAll"] )
		addon:TooltipDisplay( ARL_ExpandButton, L["EXPAND_TT"] )

		-- Reset our addon title text
		addon.resetTitle()

		-- Take our sorted list, and fill up DisplayStrings
		addon.initDisplayStrings( )

		-- And update our scrollframe
		addon.RecipeList_Update( )
		addon.Frame:Show()
	end
end

-- Creates a frame where you can copy and paste contents from.  Adds the textdump text into that frame.
-- Code stolen from Antiarc and Chatter

function addon:DisplayTextDump(textdump)

	local PaneBackdrop  = {
		bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 3, right = 3, top = 5, bottom = 3 }
	}

	local frame = CreateFrame("Frame", "ARLCopyFrame", UIParent)
	tinsert(UISpecialFrames, "ChatterCopyFrame")
	frame:SetBackdrop(PaneBackdrop)
	frame:SetBackdropColor(0,0,0,1)
	frame:SetWidth(500)
	frame:SetHeight(400)
	frame:SetPoint("CENTER", UIParent, "CENTER")
	frame:SetFrameStrata("DIALOG")
	
	local scrollArea = CreateFrame("ScrollFrame", "ARLCopyScroll", frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -30)
	scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)
	
	local editBox = CreateFrame("EditBox", nil, frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(false)
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetWidth(400)
	editBox:SetHeight(270)
	editBox:SetScript("OnEscapePressed", function() frame:Hide() end)
	editBox:SetText(textdump)
	editBox:HighlightText(0)
	
	scrollArea:SetScrollChild(editBox)
	
	local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT")

	frame:Show()

end
