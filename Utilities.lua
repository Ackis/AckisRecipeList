-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

local tonumber = _G.tonumber

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name, true)

-----------------------------------------------------------------------
-- Methods.
-----------------------------------------------------------------------
function private.SetTextColor(color_code, text)
	return ("|cff%s%s|r"):format(color_code or "ffffff", text)
end

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
	if not location and lookup_list ~= private.custom_list and lookup_list ~= private.reputation_list then
		addon:Debug("Lookup ID: %s (%s) has an unknown location.", identifier, lookup_list[identifier].name or _G.UNKNOWN)
	end

	if faction and lookup_list == private.mob_list then
		addon:Debug("Mob %d (%s) has been assigned to faction %s.", identifier, name, lookup_list[identifier].faction)
	end
	--@end-alpha@
	return entry
end

function private:AddTrainer(id_num, trainer_name, location, coord_x, coord_y, faction)
	if _G.type(trainer_name) == "number" then
		local entry = self:AddListEntry(self.trainer_list, id_num, _G.GetSpellInfo(trainer_name), BZ[location], coord_x, coord_y, faction)
		entry.spell_id = trainer_name
	else
		self:AddListEntry(self.trainer_list, id_num, L[trainer_name], BZ[location], coord_x, coord_y, faction)
	end
end


function private.ItemLinkToID(item_link)
	if not item_link then
		return
	end

	local id = item_link:match("item:(%d+)")

	if not id then
		return
	end
	return tonumber(id)
end

