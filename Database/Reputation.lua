-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...
local addon = _G.LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

function addon:InitReputation()
	for rep_id in pairs(private.FACTION_LABELS_FROM_ID) do
		private.AcquireTypes.Reputation:AddEntity(rep_id, _G.GetFactionInfoByID(rep_id) or ("%s_%d"):format(_G.UNKNOWN, rep_id))
	end

	self.InitReputation = nil
end
