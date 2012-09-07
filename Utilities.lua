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
	lookup_list[identifier] = entry

	if coord_x and coord_y then
		lookup_list[identifier].coord_x = coord_x
		lookup_list[identifier].coord_y = coord_y
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
		addon:Debug("Lookup ID: %s (%s) has an unknown location.", identifier, lookup_list[identifier].name or _G.UNKNOWN)
	end

	if faction and lookup_list == self.mob_list then
		addon:Debug("Mob %d (%s) has been assigned to faction %s.", identifier, name, lookup_list[identifier].faction)
	end
	--@end-alpha@
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

-------------------------------------------------------------------------------
-- Miscellaneous utilities
-------------------------------------------------------------------------------
--@debug@
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

	local function TableKeyFormat(input)
		if not input then
			return ""
		end

		return input:upper():gsub(" ", "_"):gsub("'", ""):gsub(":", ""):gsub("-", "_"):gsub("%(", ""):gsub("%)", "")
	end

	function addon:DumpBossIDs(name)
		table.wipe(output)

		for index = 1, 10000 do
			local boss_name = _G.EJ_GetEncounterInfo(index)

			if boss_name and boss_name:lower():find(name:lower()) then
				table.insert(output, ("%s = _G.EJ_GetEncounterInfo(%d),"):format(TableKeyFormat(boss_name), index))
			end
		end
		self:DisplayTextDump(nil, nil, table.concat(output, "\n"))
	end

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

	function addon:DumpZones(name)
		table.wipe(output)

		for index = 1, 100000 do
			local zone_name = _G.GetMapNameByID(index)

			if zone_name and zone_name:lower():find(name:lower()) then
				table.insert(output, ("%s = _G.GetMapNameByID(%d),"):format(TableKeyFormat(zone_name), index))
			end
		end
		self:DisplayTextDump(nil, nil, table.concat(output, "\n"))
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
		table.insert(output, "private.ZONE_NAMES = {")
		local sorted_zones = {}
		for name, idnum in pairs(private.ZONE_NAME_LIST) do
			sorted_zones[#sorted_zones + 1] = name
		end
		table.sort(sorted_zones, function(a, b)
			return private.ZONE_NAME_LIST[a] < private.ZONE_NAME_LIST[b]
		end)

		for index = 1, #sorted_zones do
			local zone_id = private.ZONE_NAME_LIST[sorted_zones[index]]
			table.insert(output, ("%s = _G.GetMapNameByID(%d),"):format(TableKeyFormat(sorted_zones[index]), zone_id))
		end
		table.insert(output, "}\n")
		self:DisplayTextDump(nil, nil, table.concat(output, "\n"))
	end
--]=]
end -- do
--@end-debug@
