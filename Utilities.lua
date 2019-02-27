-- ----------------------------------------------------------------------------
-- Upvalued Lua API.
-- ----------------------------------------------------------------------------
-- Functions
local pairs = _G.pairs
local tonumber = _G.tonumber
local type = _G.type

-- Libraries
local table = _G.table

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

-- ----------------------------------------------------------------------------
-- Methods.
-- ----------------------------------------------------------------------------

-- Since GetExpansionLevel during pre-expansion patches will return the previous expansion's ID even though the new data is in...
local function GetEffectiveExpansionID()
    return tonumber(_G.GetBuildInfo():sub(1, 1))
end
private.GetEffectiveExpansionID = GetEffectiveExpansionID

function private.SetExpansionLogo(texture, expansionLevel)
	if private.EXPANSION_LOGOS[expansionLevel].texture then
		texture:SetTexture(private.EXPANSION_LOGOS[expansionLevel].texture)
		texture:Show()
	elseif private.EXPANSION_LOGOS[expansionLevel].atlas then
		texture:SetAtlas(private.EXPANSION_LOGOS[expansionLevel].atlas)
		texture:Show()
	else
		texture:Hide()
	end
end

function private.SetTextColor(color_code, text)
	return ("|cff%s%s|r"):format(color_code or "ffffff", text)
end

function private.ItemLinkToID(item_link)
	if not item_link then
		return
	end
	return tonumber(item_link:match("item:(%d+)"))
end

-- This wrapper exists primarily because Blizzard keeps changing how NPC ID numbers are extracted from GUIDs, and fixing it in one place is less error-prone.
function private.MobGUIDToIDNum(guid)
	if private.wow_ui_version >= 60000 then
		local _, _, _, _, _, id_num = ("-"):split(guid)
		return tonumber(id_num)
	else
		return tonumber(guid:sub(6, 10), 16)
	end
end

--@debug@
do
	local function PrintProfessions()
		addon:Print("Must supply a valid profession name, or \"all\":")

		for index = 1, #private.ORDERED_LOCALIZED_PROFESSION_NAMES do
			addon:Print(private.ORDERED_LOCALIZED_PROFESSION_NAMES[index])
		end
	end

	private.DUMP_COMMANDS = {
		bossids = function(input)
			if not input then
				addon:Print("You can also type the name or partial name of a boss.")
			end
			addon:DumpBossIDs(input)
		end,
		empties = function()
			addon:ShowEmptySources()
		end,
		lists = function(input)
			addon:DumpProfessionLists(input)
		end,
		npcname = function(input)
			addon:DumpNPCName(input)
		end,
		phrases = function()
			addon:DumpPhrases()
		end,
		profession = function(input)
			if not input then
				PrintProfessions()
				return
			end
			local found
			input = input:lower():trim()

			for index = 1, #private.ORDERED_LOCALIZED_PROFESSION_NAMES do
				if input == private.ORDERED_LOCALIZED_PROFESSION_NAMES[index]:lower() then
					found = true
					break
				end
			end

			if not found then
				PrintProfessions()
				return
			end
			addon:DumpProfession(input)
		end,
		reputations = function(input)
			if not input then
				addon:Print("You can also type the name or partial name of a reputation.")
			end
			addon:DumpReps(input)
		end,
		zones = function(input)
			if not input then
				addon:Print("Type the name or partial name of a zone.")
				return
			end
			addon:DumpZones(input)
		end,
		categories = function(input)
			if not input then
				addon:Print("Type the Category.")
				return
			end
			addon:DumpCategory(input)
		end
	}

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

	do
		local temporaryStorageTable = {}

		local DatamineTooltip = _G.CreateFrame("GameTooltip", "ARLDatamineTooltip", _G.UIParent, "GameTooltipTemplate")
		DatamineTooltip:SetOwner(_G.WorldFrame, "ANCHOR_NONE")

		function addon:GetNPCNameFromID(npcID)
			local npcName = temporaryStorageTable[npcID]

			if not npcName then
				DatamineTooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(npcID))
				npcName = _G['ARLDatamineTooltipTextLeft1']:GetText()

				if npcName and npcName ~= "" then
					temporaryStorageTable[npcID] = npcName
				end
			end

			return npcName
		end
	end

	function addon:DumpNPCName(npcID)
		output:Clear()
		if not npcID or not tonumber(npcID) then
			output:AddLine("Use a real NPC ID, silly.")
			output:Display()
			return
		end

		output:AddLine(self:GetNPCNameFromID(npcID) or _G.UNKNOWN)
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

		return input:upper():gsub(" ", "_"):gsub("'", ""):gsub(":", ""):gsub(",", "_"):gsub("-", "_"):gsub("%(", ""):gsub("%)", "")
	end

	function addon:DumpZones(input)
		output:Clear()

--		if type(input) == "number" then
--			local zone_name = _G.C_Map.GetMapInfo(input).name

--			if zone_name then
--				output:AddLine(("%s = _G.GetMapInfo(%d).name,"):format(TableKeyFormat(zone_name), input))
--			end
--		elseif type(input) == nil then
			for index = 1, 2000 do

				if _G.C_Map.GetMapInfo(index) then
					local zone_name = _G.C_Map.GetMapInfo(index).name
					if _G.C_Map.GetMapInfo(_G.C_Map.GetMapInfo(index).parentMapID).name then
						local parent_name = _G.C_Map.GetMapInfo(_G.C_Map.GetMapInfo(index).parentMapID).name
					else
						local parent_name = "Cosmic"
					end
--					if zone_name and zone_name:lower():find(input:lower()) then
					output:AddLine(("%s = _G.C_Map.GetMapInfo(%d).name,"):format(TableKeyFormat(zone_name), index))
--					end
				end
			end
--		end

		if output:Lines() == 0 then
			output:AddLine("Nothing to display.")
		end
		output:Display()
	end

	function addon:DumpReps(name)
		output:Clear()

		for reputation_id = 1, 10000 do
			local reputation_name = _G.GetFactionInfoByID(reputation_id)

			if reputation_name and (not name or reputation_name:lower():find(name:lower())) then
				output:AddLine(("[%d] = \"%s\","):format(reputation_id, TableKeyFormat(reputation_name)))
			end
		end

		if output:Lines() == 0 then
			output:AddLine("Nothing to display.")
		end
		output:Display()
	end

	function addon:DumpCategory(name)
		output:Clear()

		for category_id = 1, 20000 do
			local category_name = _G.GetCategoryInfo(category_id)

			if category_name and (not name or category_name:lower():find(name:lower())) then
				output:AddLine(("[%d] = \"%s\","):format(category_id, TableKeyFormat(category_name)))
			end
		end

		if output:Lines() == 0 then
			output:AddLine("Nothing to display.")
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

			if boss_name and (not name or boss_name:lower():find(name:lower())) then
				output:AddLine(("%s = _G.EJ_GetEncounterInfo(%d),"):format(TableKeyFormat(boss_name), index))
			end
		end

		if output:Lines() == 0 then
			output:AddLine("Nothing to display.")
		end

		output:Display()
	end

	local profession_entries = {}
	local sorted_profession_entries = {}
	local entity_counts = {}

	local function SortByIdentifier(a, b)
		return a.identifier < b.identifier
	end

    -- TODO: Look at rewriting this.
	local function GroupListByProfession(category_name, acquire_type)
		for unit_id, unit in acquire_type:EntityPairs() do
			if unit.item_list then
				for recipe_id in pairs(unit.item_list) do
					local profession = private.recipe_list[recipe_id].Profession:LocalizedName()
					local profession_table = profession_entries[profession]

					if not profession_table then
						profession_table = {}
						profession_entries[profession] = profession_table
					end
					local sorted_profession_table = sorted_profession_entries[profession]

					if not sorted_profession_table then
						sorted_profession_table = {}
						sorted_profession_entries[profession] = sorted_profession_table
					end
					local category_table = profession_table[category_name]

					if not category_table then
						category_table = {}
						profession_table[category_name] = category_table
					end
					local sorted_category_table = sorted_profession_table[category_name]

					if not sorted_category_table then
						sorted_category_table = {}
						sorted_profession_table[category_name] = sorted_category_table
					end

					if not category_table[unit] then
						entity_counts[unit] = (entity_counts[unit] or 0) + 1
						sorted_category_table[#sorted_category_table + 1] = unit
						table.sort(sorted_category_table, SortByIdentifier)
					end
					category_table[unit] = unit
				end
			end
		end
	end

	local ACQUIRE_TYPE_LIST = {
		"Custom",
		"Discovery",
		"MobDrop",
		"Quest",
		"Trainer",
		"Vendor",
		"WorldEvent",
	}

	function addon:DumpProfessionLists(target_profession_name)
		if target_profession_name then
			target_profession_name = target_profession_name:lower()
		end

		for identifier, name in pairs(private.LOCALIZED_PROFESSION_NAMES) do
			addon:InitializeProfession(name)
		end

		table.wipe(entity_counts)
		table.wipe(profession_entries)
		table.wipe(sorted_profession_entries)

		for index = 1, #ACQUIRE_TYPE_LIST do
			local category_name = ACQUIRE_TYPE_LIST[index]
			GroupListByProfession(category_name, private.AcquireTypes[category_name])
		end
		output:Clear()

		for profession_name, profession_table in pairs(sorted_profession_entries) do
			if not target_profession_name or profession_name:lower() == target_profession_name then
				output:AddLine(("-----------------------------------------------------------------------\n-- %s.\n-----------------------------------------------------------------------"):format(profession_name))

				for category_name, category_table in pairs(profession_table) do
					output:AddLine(("-----------------------------------------------------------------------\n-- %s.\n-----------------------------------------------------------------------"):format(category_name))

					for index = 1, #category_table do
						local unit = category_table[index]

						if entity_counts[unit] == 1 then
							output:AddLine(("%s: %s"):format(unit.identifier or _G.UNKNOWN, unit.name or _G.UNKNOWN))
						else
							addon:Printf("Skipping %s %s: %s - %d professions.",
								category_name,
								unit.identifier or _G.UNKNOWN,
								unit.name or _G.UNKNOWN,
								entity_counts[unit])
						end
					end
				end
			end
		end

		if output:Lines() == 0 then
			output:AddLine("Nothing to display.")
		end
		output:Display()
	end

	-- ----------------------------------------------------------------------------
	-- Miscellaneous utilities
	-- ----------------------------------------------------------------------------
	local function find_empties(acquire_type_id)
		local acquire_type = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]
		local count

		for unit_id, unit in acquire_type:EntityPairs() do
			count = 0

			if unit.item_list then
				for recipe_id in pairs(unit.item_list) do
					count = count + 1
				end
			end

			if count == 0 then
				output:AddLine(("* %s %s (%s) has no recipes."):format(acquire_type:Name(), unit.name or _G.UNKNOWN, unit_id))
			end
		end
	end

	function addon:ShowEmptySources()
		private.LoadAllRecipes()
		output:Clear()

		find_empties(private.ACQUIRE_TYPE_IDS.TRAINER)
		find_empties(private.ACQUIRE_TYPE_IDS.VENDOR)
		find_empties(private.ACQUIRE_TYPE_IDS.MOB_DROP)
		find_empties(private.ACQUIRE_TYPE_IDS.QUEST)
		find_empties(private.ACQUIRE_TYPE_IDS.CUSTOM)
		find_empties(private.ACQUIRE_TYPE_IDS.DISCOVERY)
		find_empties(private.ACQUIRE_TYPE_IDS.WORLD_EVENT)
		find_empties(private.ACQUIRE_TYPE_IDS.REPUTATION)

		if output:Lines() == 0 then
			output:AddLine("Nothing to display.")
		end

		output:Display()
	end
end -- do
--@end-debug@
