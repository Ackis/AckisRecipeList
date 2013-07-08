-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

-- Functions
local pairs = _G.pairs
local tonumber = _G.tonumber
local type = _G.type

-- Libraries
local table = _G.table

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

-----------------------------------------------------------------------
-- Methods.
-----------------------------------------------------------------------
function private.SetTextColor(color_code, text)
	return ("|cff%s%s|r"):format(color_code or "ffffff", text)
end

function private.ColorRGBtoHEX(r, g, b)
	return ("%02x%02x%02x"):format(r * 255, g * 255, b * 255)
end

local NO_LOCATION_LISTS

function private:AddListEntry(lookup_list, identifier, name, location, coord_x, coord_y, faction)
	if lookup_list[identifier] then
		addon:Debug("Duplicate lookup: %s - %s.", identifier, name)
		return
	end

	local entry = {
		name = name,
		location = location,
		faction = faction,
	}

	if coord_x and coord_y then
		entry.coord_x = coord_x
		entry.coord_y = coord_y
	end

	--@alpha@
	if not NO_LOCATION_LISTS then
		NO_LOCATION_LISTS = {
			[self.custom_list] = true,
			[self.discovery_list] = true,
			[self.reputation_list] = true,
		}
	end

	if not location and not NO_LOCATION_LISTS[lookup_list] then
		addon:Debug("Lookup ID: %s (%s) has an unknown location.", identifier, entry.name or _G.UNKNOWN)
	end

	if faction and lookup_list == self.mob_list then
		addon:Debug("Mob %d (%s) has been assigned to faction %s.", identifier, name, entry.faction)
	end
	--@end-alpha@
	lookup_list[identifier] = entry
	return entry
end

function private.ItemLinkToID(item_link)
	if not item_link then
		return
	end
	return tonumber(item_link:match("item:(%d+)"))
end

-- This wrapper exists primarily because Blizzard keeps changing how NPC ID numbers are extracted from GUIDs, and fixing it in one place is less error-prone.
function private.MobGUIDToIDNum(guid)
	return tonumber(guid:sub(6, 10), 16)
end

-------------------------------------------------------------------------------
-- Text dumping functions
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--- Creates a new frame with the contents of a text dump so you can copy and paste
--------------------------------------------------------------------------------
do
	local copy_frame = _G.CreateFrame("Frame", "ARL_CopyFrame", _G.UIParent)
	copy_frame:SetSize(750, 600)
	copy_frame:SetPoint("CENTER", _G.UIParent, "CENTER")
	copy_frame:SetFrameStrata("DIALOG")
	copy_frame:EnableMouse(true)
	copy_frame:SetMovable(true)

	table.insert(_G.UISpecialFrames, "ARL_CopyFrame")

	local title_bg = copy_frame:CreateTexture(nil, "BACKGROUND")
	title_bg:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-Title-Background]])
	title_bg:SetPoint("TOPLEFT", 9, -6)
	title_bg:SetPoint("BOTTOMRIGHT", copy_frame, "TOPRIGHT", -28, -24)

	local dialog_bg = copy_frame:CreateTexture(nil, "BACKGROUND")
	dialog_bg:SetTexture([[Interface\Tooltips\UI-Tooltip-Background]])
	dialog_bg:SetVertexColor(0, 0, 0, 0.75)
	dialog_bg:SetPoint("TOPLEFT", 8, -24)
	dialog_bg:SetPoint("BOTTOMRIGHT", -6, 8)

	local function CreateBorder(width, height, left, right, top, bottom)
		local border = copy_frame:CreateTexture(nil, "BORDER")
		border:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-Border]])
		border:SetWidth(width)
		border:SetHeight(height)
		border:SetTexCoord(left, right, top, bottom)

		return border
	end

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

	local footer_frame = _G.CreateFrame("Frame", nil, copy_frame, "InsetFrameTemplate")
	footer_frame:SetHeight(23)
	footer_frame:SetPoint("BOTTOMLEFT", copy_frame, "BOTTOMLEFT", 8, 8)
	footer_frame:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -5, 8)

	local footer = footer_frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	footer:SetPoint("CENTER", footer_frame, "CENTER", 0, 0)

	local scroll_area = _G.CreateFrame("ScrollFrame", "ARL_CopyScroll", copy_frame, "UIPanelScrollFrameTemplate")
	scroll_area:SetPoint("TOPLEFT", copy_frame, "TOPLEFT", 10, -28)
	scroll_area:SetPoint("BOTTOMRIGHT", copy_frame, "BOTTOMRIGHT", -28, 31)

	scroll_area:SetScript("OnMouseWheel", function(self, delta)
		_G.ScrollFrameTemplate_OnMouseWheel(self, delta, self.ScrollBar)
	end)

	scroll_area.ScrollBar:SetScript("OnMouseWheel", function(self, delta)
		_G.ScrollFrameTemplate_OnMouseWheel(self, delta, self)
	end)

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

	scroll_area:SetScrollChild(edit_box)

	local highlight_button = _G.CreateFrame("Button", nil, copy_frame)
	highlight_button:SetSize(16, 16)
	highlight_button:SetPoint("BOTTOMRIGHT", -10, 10)

	highlight_button:SetScript("OnMouseUp", function(self, button)
		self.texture:ClearAllPoints()
		self.texture:SetAllPoints(self)

		edit_box:HighlightText(0)
		edit_box:SetFocus()
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

	private.TextDump = {
		output = {}
	}

	function private.TextDump:AddLine(text)
		self:InsertLine(#self.output + 1, text)
	end

	function private.TextDump:Clear()
		table.wipe(self.output)
	end

	function private.TextDump:Display(separator)
		local display_text = table.concat(self.output, separator or "\n")

		if display_text == "" then
			return
		end
		edit_box:SetText(display_text)
		edit_box:SetCursorPosition(0)
		copy_frame:Show()
	end

	function private.TextDump:InsertLine(position, text)
		if _G.type(text) ~= "string" or text == "" then
			return
		end
		table.insert(self.output, position, text)
	end

	function private.TextDump:Lines()
		return #self.output
	end

	function private.TextDump:String(separator)
		return table.concat(self.output, separator or "\n")
	end
end -- do

--@debug@
do
	local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
	local output = private.TextDump

	function addon:DumpPhrases()
		local sorted = {}

		for phrase, translation in pairs(L) do
			sorted[#sorted + 1] = phrase
		end
		table.sort(sorted)
		output:Clear()

		for index = 1, #sorted do
			local phrase = sorted[index]
			local translation = L[phrase]

			if phrase == translation then
				output:AddLine(("L[\"%s\"] = true"):format(phrase:gsub("\"", "\\\"")))
			elseif translation:find("\n") then
				output:AddLine(("L[\"%s\"] = [[%s]]"):format(phrase:gsub("\"", "\\\""), translation))
			else
				output:AddLine(("L[\"%s\"] = \"%s\""):format(phrase:gsub("\"", "\\\""), translation:gsub('\"', '\\"')))
			end
		end
		output:Display()
	end

	function addon:DumpMembers(match)
		output:Clear()
		output:AddLine("Addon Object members.\n")

		local count = 0

		for key, value in pairs(self) do
			local val_type = type(value)

			if not match or val_type == match then
				output:AddLine(("%s (%s)"):format(key, val_type))
				count = count + 1
			end
		end
		output:AddLine(("\n%d found\n"):format(count))
		output:Display()
	end

	local function TableKeyFormat(input)
		if not input then
			return ""
		end

		return input:upper():gsub(" ", "_"):gsub("'", ""):gsub(":", ""):gsub("-", "_"):gsub("%(", ""):gsub("%)", "")
	end

	function addon:DumpZones(name)
		output:Clear()

		for index = 1, 100000 do
			local zone_name = _G.GetMapNameByID(index)

			if zone_name and zone_name:lower():find(name:lower()) then
				output:AddLine(("%s = _G.GetMapNameByID(%d),"):format(TableKeyFormat(zone_name), index))
			end
		end
		output:Display()
	end

	function addon:DumpReps()
		output:Clear()

		for index = 1, 1500 do
			local rep_name = _G.GetFactionInfoByID(index)

			if rep_name and private.FACTION_STRINGS[index] then
				output:AddLine(("[\"%s\"] = _G.GetFactionInfoByID(%d),"):format(TableKeyFormat(rep_name), index))
			end
		end
		output:Display()
	end

--[=[
		private.ZONE_NAME_LIST = {}

		local old_GetMapNameByID = _G.GetMapNameByID
		local function My_GetMapNameByID(id_num)
			if not id_num then
				return
			end
			local Z = private.ZONE_NAME_LIST
			local name = old_GetMapNameByID(id_num)

			if not name then
				return
			end
			Z[name] = id_num
			return name
		end
		_G.GetMapNameByID = My_GetMapNameByID

	function addon:DumpCapturedZones()
		table.wipe(output)
		TextDump:AddLine("private.ZONE_NAMES = {")
		local sorted_zones = {}
		for name, idnum in pairs(private.ZONE_NAME_LIST) do
			sorted_zones[#sorted_zones + 1] = name
		end
		table.sort(sorted_zones, function(a, b)
			return private.ZONE_NAME_LIST[a] < private.ZONE_NAME_LIST[b]
		end)

		for index = 1, #sorted_zones do
			local zone_id = private.ZONE_NAME_LIST[sorted_zones[index]]
			TextDump:AddLine(("%s = _G.GetMapNameByID(%d),"):format(TableKeyFormat(sorted_zones[index]), zone_id))
		end
		TextDump:AddLine("}\n")
		TextDump:Display()
	end
--]=]

	function addon:DumpBossIDs(name)
		output:Clear()

		for index = 1, 10000 do
			local boss_name = _G.EJ_GetEncounterInfo(index)

			if boss_name and boss_name:lower():find(name:lower()) then
				output:AddLine(("%s = _G.EJ_GetEncounterInfo(%d),"):format(TableKeyFormat(boss_name), index))
			end
		end
		output:Display()
	end

	-------------------------------------------------------------------------------
	-- Miscellaneous utilities
	-------------------------------------------------------------------------------
	local function find_empties(unit_list, description)
		local count

		for unit_id, unit in pairs(unit_list) do
			count = 0

			if unit.item_list then
				for recipe_id in pairs(unit.item_list) do
					count = count + 1
				end
			end

			if count == 0 then
				addon:Debug("%s %s (%s) has no recipes.", description, unit.name or _G.UNKNOWN, unit_id)
			end
		end
	end

	function addon:ShowEmptySources()
		private.LoadAllRecipes()

		find_empties(private.trainer_list, "Trainer")
		find_empties(private.vendor_list, "Vendor")
		find_empties(private.mob_list, "Mob")
		find_empties(private.quest_list, "Quest")
		find_empties(private.custom_list, "Custom Entry")
		find_empties(private.discovery_list, "Discovery")
		find_empties(private.seasonal_list, "World Event")
	end
end -- do
--@end-debug@
