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
local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()

-----------------------------------------------------------------------
-- Methods.
-----------------------------------------------------------------------
function private.SetTextColor(color_code, text)
	return ("|cff%s%s|r"):format(color_code or "ffffff", text)
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
	return tonumber(guid:sub(-12,-9), 16)
end

--@debug@
-------------------------------------------------------------------------------
-- Text dumping functions
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--- Creates a new frame with the contents of a text dump so you can copy and paste
-- Code borrowed from Antiarc (Chatter) with permission
--------------------------------------------------------------------------------
do
	local copy_frame = _G.CreateFrame("Frame", "ARL_CopyFrame", _G.UIParent)
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

	table.insert(_G.UISpecialFrames, "ARL_CopyFrame")

	local scrollArea = _G.CreateFrame("ScrollFrame", "ARL_CopyScroll", copy_frame, "UIPanelScrollFrameTemplate")
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

	private.TextDump = {
		output = {}
	}

	function private.TextDump:AddLine(text)
		self:InsertLine(#self.output + 1, text)
	end

	function private.TextDump:Clear()
		print("Wiping TextDump output.")
		table.wipe(self.output)
	end

	function private.TextDump:Display(separator)
		local display_text = table.concat(self.output, separator or "\n")

		if display_text == "" then
			return
		end
		edit_box:SetText(display_text)
		edit_box:HighlightText(0)
		edit_box:SetCursorPosition(1)
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
		local display_text = table.concat(self.output, separator or "\n")
		return display_text
	end
end -- do

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
