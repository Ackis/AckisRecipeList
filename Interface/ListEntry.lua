-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string

local tonumber = _G.tonumber
local tostring = _G.tostring

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

-------------------------------------------------------------------------------
-- Creation.
-------------------------------------------------------------------------------
local list_entry_prototype = {}
local list_entry_meta = {
	__index = list_entry_prototype
}

local VALID_LIST_ENTRY_TYPES = {
	entry = true,
	header = true,
	subentry = true,
	subheader = true,
}

function private.CreateListEntry(entry_type, parent_entry, recipe)
	local entry = _G.setmetatable(private.AcquireTable(), list_entry_meta)
	entry.recipe = recipe

	if entry_type and VALID_LIST_ENTRY_TYPES[entry_type] then
		entry._type = entry_type
	else
		addon:Debug("Attempting to set an entry's type to '%s'.", tostring(entry_type))
		entry._type = "entry"
	end

	if parent_entry then
		if parent_entry ~= entry then
			entry.recipe = entry.recipe or parent_entry.recipe
			entry.parent = parent_entry
			entry:SetAcquireType(entry:AcquireType() or parent_entry:AcquireType())
			entry:SetLocationID(entry:LocationID() or parent_entry:LocationID())
			entry:SetNPCID(entry:NPCID() or parent_entry:NPCID())
		else
			addon:Debug("Attempting to parent an entry to itself.")
		end
	elseif entry._type ~= "header" then
		addon:Debug("Non-header entry without a parent: %s", entry._type)
	end
	return entry
end

-------------------------------------------------------------------------------
-- Methods.
-------------------------------------------------------------------------------
function list_entry_prototype:Emphasize(toggle)
	self._emphasized = toggle or nil
end

function list_entry_prototype:IsEmphasized()
	return self._emphasized
end

function list_entry_prototype:SetAcquireType(acquire_type)
	self._acquire_type = acquire_type
end

function list_entry_prototype:AcquireType()
	return self._acquire_type
end

function list_entry_prototype:SetLocationID(location_id)
	self._location_id = location_id
end

function list_entry_prototype:LocationID()
	return self._location_id
end

function list_entry_prototype:SetNPCID(npc_id)
	self._npc_id = tonumber(npc_id)
end

function list_entry_prototype:NPCID()
	return self._npc_id
end

function list_entry_prototype:SetText(...)
	self._text = string.format(...)
end

function list_entry_prototype:Text()
	return self._text
end

function list_entry_prototype:Type()
	return self._type
end

function list_entry_prototype:IsEntry()
	return self._type == "entry"
end

function list_entry_prototype:IsHeader()
	return self._type == "header"
end

function list_entry_prototype:IsSubEntry()
	return self._type == "subentry"
end

function list_entry_prototype:IsSubHeader()
	return self._type == "subheader"
end
