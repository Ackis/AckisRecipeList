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
	for reputationID in pairs(private.FACTION_LABELS_FROM_ID) do
		private.AcquireTypes.Reputation:AddEntity(addon, {
			identifier = reputationID,
			item_list = {},
			name = _G.GetFactionInfoByID(reputationID) or ("%s_%d"):format(_G.UNKNOWN, reputationID),
		})
	end

	self.InitReputation = nil
end
