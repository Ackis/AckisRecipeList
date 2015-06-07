-------------------------------------------------------------------------------
-- Waypoint.lua
-------------------------------------------------------------------------------
-- File date: @file-date-iso@
-- File hash: @file-abbreviated-hash@
-- Project hash: @project-abbreviated-hash@
-- Project version: @project-version@
-------------------------------------------------------------------------------
-- Please see http://www.wowace.com/addons/arl/ for more information.
-------------------------------------------------------------------------------
-- This source code is released under All Rights Reserved.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local table = _G.table

local pairs= _G.pairs
local select =  _G.select

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private	= ...

local LibStub = _G.LibStub
local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local A = private.ACQUIRE_TYPE_IDS
local Z = private.ZONE_NAMES

-------------------------------------------------------------------------------
-- Constants.
-------------------------------------------------------------------------------
local KALIMDOR_NAMES = {}
local EASTERN_KINGDOMS_NAMES = {}
local OUTLAND_NAMES = {}
local NORTHREND_NAMES = {}
local THE_MAELSTROM_NAMES = {}
local PANDARIA_NAMES = {}
local DRAENOR_NAMES = {}

local KALIMDOR_IDNUMS = {}
local EASTERN_KINGDOMS_IDNUMS = {}
local OUTLAND_IDNUMS = {}
local NORTHREND_IDNUMS = {}
local THE_MAELSTROM_IDNUMS = {}
local PANDARIA_IDNUMS = {}
local DRAENOR_IDNUMS = {}

local function PopulateZoneData(nameTable, IDTable, zoneTable)
    local zoneIndex = 1
    while zoneIndex < #zoneTable do
        local zoneID = zoneTable[zoneIndex]
        zoneIndex = zoneIndex + 1

        local zoneName = zoneTable[zoneIndex]
        zoneIndex = zoneIndex + 1

        nameTable[zoneID] = zoneName
        IDTable[zoneName] = zoneID
    end
end

local function LoadZones(nameTable, IDTable, zoneTable)
    PopulateZoneData(nameTable, IDTable, zoneTable)

    local tempNameTable = {}
    local tempIDTable = {}

    for zoneID in pairs(nameTable) do
        PopulateZoneData(tempNameTable, tempIDTable, { _G.GetMapSubzones(zoneID) })
    end

    for zoneID, zoneName in pairs(tempNameTable) do
        nameTable[zoneID] = zoneName
        IDTable[zoneName] = zoneID
    end

end

LoadZones(KALIMDOR_NAMES, KALIMDOR_IDNUMS, { _G.GetMapZones(1) })
LoadZones(EASTERN_KINGDOMS_NAMES, EASTERN_KINGDOMS_IDNUMS, { _G.GetMapZones(2) })
LoadZones(OUTLAND_NAMES, OUTLAND_IDNUMS, { _G.GetMapZones(3) })
LoadZones(NORTHREND_NAMES, NORTHREND_IDNUMS, { _G.GetMapZones(4) })
LoadZones(THE_MAELSTROM_NAMES, THE_MAELSTROM_IDNUMS, { _G.GetMapZones(5) })
LoadZones(PANDARIA_NAMES, PANDARIA_IDNUMS, { _G.GetMapZones(6) })
LoadZones(DRAENOR_NAMES, DRAENOR_IDNUMS, { _G.GetMapZones(7) })

local INSTANCE_LOCATIONS = {
	[Z.AHNKAHET_THE_OLD_KINGDOM] = {
		zone = NORTHREND_IDNUMS[Z.DRAGONBLIGHT],
		continent = 4,
		x = 28.49,
		y = 51.73,
	},
	[Z.AUCHENAI_CRYPTS] = {
		zone = OUTLAND_IDNUMS[Z.TEROKKAR_FOREST],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.AZJOL_NERUB] = {
		zone = NORTHREND_IDNUMS[Z.DRAGONBLIGHT],
		continent = 4,
		x = 26.01,
		y = 50.83,
	},
	[Z.BLACKROCK_DEPTHS] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.BURNING_STEPPES],
		continent = 2,
		x = 20.72,
		y = 36.94,
	},
	[Z.BLACKROCK_SPIRE] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.BURNING_STEPPES],
		continent = 2,
		x = 20.72,
		y = 36.94,
	},
	[Z.BLACKWING_LAIR] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.BURNING_STEPPES],
		continent = 2,
		x = 20.72,
		y = 36.94,
	},
	[Z.DIRE_MAUL] = {
		zone = KALIMDOR_IDNUMS[Z.FERALAS],
		continent = 1,
		x = 61.36,
		y = 31.78,
	},
	[Z.DRAKTHARON_KEEP] = {
		zone = NORTHREND_IDNUMS[Z.ZULDRAK],
		continent = 4,
		x = 0,
		y = 0,
	},
	[Z.GNOMEREGAN] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.DUN_MOROGH],
		continent = 2,
		x = 31.29,
		y = 37.89,
	},
	[Z.HALLS_OF_LIGHTNING] = {
		zone = NORTHREND_IDNUMS[Z.THE_STORM_PEAKS],
		continent = 4,
		x = 45.40,
		y = 21.37,
	},
	[Z.HALLS_OF_STONE] = {
		zone = NORTHREND_IDNUMS[Z.THE_STORM_PEAKS],
		continent = 4,
		x = 39.49,
		y = 26.92,
	},
	[Z.KARAZHAN] = {
		zone = KALIMDOR_IDNUMS[Z.DEADWIND_PASS],
		continent = 2,
		x = 0,
		y = 0,
	},
	[Z.MAGISTERS_TERRACE] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.ISLE_OF_QUELDANAS],
		continent = 2,
		x = 61.20,
		y = 30.89,
	},
	[Z.MANA_TOMBS] = {
		zone = OUTLAND_IDNUMS[Z.TEROKKAR_FOREST],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_OCULUS] = {
		zone = NORTHREND_IDNUMS[Z.BOREAN_TUNDRA],
		continent = 4,
		x = 27.52,
		y = 26.71,
	},
	[Z.OLD_HILLSBRAD_FOOTHILLS] = {
		zone = KALIMDOR_IDNUMS[Z.TANARIS],
		continent = 1,
		x = 0,
		y = 0,
	},
	[Z.ONYXIAS_LAIR] = {
		zone = KALIMDOR_IDNUMS[Z.DUSTWALLOW_MARSH],
		continent = 1,
		x = 0,
		y = 0,
	},
	[Z.RUINS_OF_AHNQIRAJ] = {
		zone = KALIMDOR_IDNUMS[Z.SILITHUS],
		continent = 1,
		x = 0,
		y = 0,
	},
	[Z.SCHOLOMANCE] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.WESTERN_PLAGUELANDS],
		continent = 2,
		x = 0,
		y = 0,
	},
	[Z.SETHEKK_HALLS] = {
		zone = OUTLAND_IDNUMS[Z.TEROKKAR_FOREST],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.SHADOW_LABYRINTH] = {
		zone = OUTLAND_IDNUMS[Z.TEROKKAR_FOREST],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.STRATHOLME] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.EASTERN_PLAGUELANDS],
		continent = 2,
		x = 26.75,
		y = 11.60,
	},
	[Z.AHNQIRAJ_THE_FALLEN_KINGDOM] = {
		zone = KALIMDOR_IDNUMS[Z.SILITHUS],
		continent = 1,
		x = 0,
		y = 0,
	},
	[Z.THE_ARCATRAZ] = {
		zone = OUTLAND_IDNUMS[Z.NETHERSTORM],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_BLACK_MORASS] = {
		zone = KALIMDOR_IDNUMS[Z.TANARIS],
		continent = 1,
		x = 0,
		y = 0,
	},
	[Z.THE_BOTANICA] = {
		zone = OUTLAND_IDNUMS[Z.NETHERSTORM],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_DEADMINES] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.WESTFALL],
		continent = 2,
		x = 0,
		y = 0,
	},
	[Z.THE_MECHANAR] = {
		zone = OUTLAND_IDNUMS[Z.NETHERSTORM],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_NEXUS] = {
		zone = NORTHREND_IDNUMS[Z.BOREAN_TUNDRA],
		continent = 4,
		x = 27.50,
		y = 25.97,
	},
	[Z.THE_SHATTERED_HALLS] = {
		zone = OUTLAND_IDNUMS[Z.HELLFIRE_PENINSULA],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_SLAVE_PENS] = {
		zone = OUTLAND_IDNUMS[Z.ZANGARMARSH],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_STEAMVAULT] = {
		zone = OUTLAND_IDNUMS[Z.ZANGARMARSH],
		continent = 3,
		x = 0,
		y = 0,
	},
	[Z.THE_TEMPLE_OF_ATALHAKKAR] = {
		zone = EASTERN_KINGDOMS_IDNUMS[Z.SWAMP_OF_SORROWS],
		continent = 2,
		x = 0,
		y = 0,
	},
	[Z.THE_VIOLET_HOLD] = {
		zone = NORTHREND_IDNUMS[Z.DALARAN],
		continent = 4,
		x = 66.78,
		y = 68.19,
	},
	[Z.UTGARDE_KEEP] = {
		zone = NORTHREND_IDNUMS[Z.HOWLING_FJORD],
		continent = 4,
		x = 57.28,
		y = 46.73,
	},
	[Z.UTGARDE_PINNACLE] = {
		zone = NORTHREND_IDNUMS[Z.HOWLING_FJORD],
		continent = 4,
		x = 57.26,
		y = 46.67,
	},
}

local icon_list = {}

-- Clears all the icons from the world map and the mini-map
function addon:ClearWaypoints()
	if not _G.TomTom or not _G.TomTom.RemoveWaypoint then
		return
	end

	while icon_list[1] do
		_G.TomTom:RemoveWaypoint(table.remove(icon_list))
	end
end

local WAYPOINT_ENTITIES = {}

local function AddRecipeWaypoints(recipe, targetAcquireTypeID, locationName, npcID)
	for acquireTypeID, acquireTypeData in pairs(recipe.acquire_data) do
		if not targetAcquireTypeID or acquireTypeID == targetAcquireTypeID then
			local acquireType = private.ACQUIRE_TYPES_BY_ID[acquireTypeID]

			for id_num, id_info in pairs(acquireTypeData) do
				if acquireType == private.AcquireTypes.Reputation then
					for rep_level, level_info in pairs(id_info) do
						for vendorID in pairs(level_info) do
							local entity = acquireType:GetWaypointEntity(vendorID, recipe)

							if entity and (not locationName or entity.location == locationName) then
								entity.acquire_type = acquireType
                                entity.location = entity.location or locationName

                                WAYPOINT_ENTITIES[entity] = recipe
							end
						end
					end
                else
                    if not npcID or id_num == npcID then
                        local entity = acquireType:GetWaypointEntity(npcID or id_num, recipe)

                        if entity then
                            if (not locationName or entity.location == locationName) then
                                entity.acquire_type = acquireType
                                entity.location = entity.location or locationName
                                entity.reference_id = id_num

                                WAYPOINT_ENTITIES[entity] = recipe
                            else
                                addon:Debug("Failed location check.")
                            end
                        else
                            addon:Debug("We have no entity")
                        end
                    end
                end
            end
        end
	end
end

local function AddAllWaypoints()
	local recipe_list = private.recipe_list
	local sorted_recipes = addon.sorted_recipes
	local editbox_text = addon.Frame.search_editbox:GetText()

	-- Scan through all recipes to display, and add the vendors to a list to get their acquire info
	for index = 1, #sorted_recipes do
		local recipe = recipe_list[sorted_recipes[index]]
		local matches_search = true

		if editbox_text ~= "" and editbox_text ~= _G.SEARCH then
			matches_search = recipe:HasState("RELEVANT")
		end

		if recipe:HasState("VISIBLE") and matches_search then
			for acquire_type_id, acquire_info in pairs(recipe.acquire_data) do
				local acquire_type = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]

				for id_num, id_info in pairs(acquire_info) do
					if acquire_type_id == A.REPUTATION then
						for rep_level, level_info in pairs(id_info) do
							for vendor_id in pairs(level_info) do
								local entity = acquire_type:GetWaypointEntity(vendor_id, recipe)

								if entity then
									entity.acquire_type = acquire_type
									WAYPOINT_ENTITIES[entity] = recipe
								end
							end
						end
					else
						local entity = acquire_type:GetWaypointEntity(id_num, recipe)

						if entity then
							entity.acquire_type = acquire_type
							entity.reference_id = id_num
							WAYPOINT_ENTITIES[entity] = recipe
						end
					end
				end
			end
		end
	end
end

-- Replace the TomTom waypoint icon with the icon for the profession.
local ICON_TEXTURE_FORMAT = [[Interface\ICONS\%s]]

local function SetWaypointIcon(uid, ...)
	local map_children = {...}

	for index = 1, #map_children do
		local child = map_children[index]

		if child.point and child.point.uid == uid then
			child.icon:SetTexture(ICON_TEXTURE_FORMAT:format(private.PROFESSION_TEXTURES[addon.Frame.current_profession]))
			break
		end

	end
end

-- Adds mini-map and world map icons with tomtom.
-- Expected result: Icons are added to the world map and mini-map.
-- Input: An optional recipe ID, acquire ID, and location ID.
-- Output: Points are added to the maps
function addon:AddWaypoint(recipe, acquireTypeID, locationName, npcID)
	if not _G.TomTom then
		return
	end
	local useWorldmap = addon.db.profile.worldmap
	local useMinimap = addon.db.profile.minimap

	if not useWorldmap and not useMinimap then
		return
	end
	table.wipe(WAYPOINT_ENTITIES)

	if recipe then
		AddRecipeWaypoints(recipe, acquireTypeID, locationName, npcID)
	elseif addon.db.profile.autoscanmap then
		AddAllWaypoints()
	end

	for entity, recipe in pairs(WAYPOINT_ENTITIES) do
        local acquireType = entity.acquire_type
        local entityName = entity.name or entity.acquire_type == private.AcquireTypes.Quest and private.quest_names[entity.reference_id] or _G.UNKNOWN
        local _, _, _, qualityColor = _G.GetItemQualityColor(recipe.quality)
        local waypointName = ("%s: |cff%s%s|r (|c%s%s|r)%s"):format(acquireType:Name(), acquireType:ColorData().hex, entityName, qualityColor, recipe.name, entity.location and ("\n%s"):format(entity.location) or "")

		-- Unset these - they're only needed for the waypoint system and shouldn't persist beyond.
		entity.acquire_type = nil
		entity.reference_id = nil

		local continentID
		local coordX = entity.coord_x
		local coordY = entity.coord_y
		local locationName = entity.location or "nil"
		local zoneID

        if INSTANCE_LOCATIONS[locationName] then
            local info = INSTANCE_LOCATIONS[locationName]

            zoneID = info.zone
            continentID = info.continent
            coordX = info.x
            coordY = info.y
            waypointName = ("%s (%s)"):format(waypointName, locationName)
        elseif KALIMDOR_IDNUMS[locationName] then
            continentID = 1
			zoneID = KALIMDOR_IDNUMS[locationName]
		elseif EASTERN_KINGDOMS_IDNUMS[locationName] then
			continentID = 2
			zoneID = EASTERN_KINGDOMS_IDNUMS[locationName]
		elseif OUTLAND_IDNUMS[locationName] then
			continentID = 3
			zoneID = OUTLAND_IDNUMS[locationName]
		elseif NORTHREND_IDNUMS[locationName] then
			continentID = 4
			zoneID = NORTHREND_IDNUMS[locationName]
        elseif PANDARIA_IDNUMS[locationName] then
            continentID = 6
            zoneID = PANDARIA_IDNUMS[locationName]
        elseif DRAENOR_IDNUMS[locationName] then
            continentID = 7
            zoneID = DRAENOR_IDNUMS[locationName]
		else
			self:Debug("No continent/zone map match for recipe ID %d. Location: %s.", recipe:SpellID(), locationName)
		end

		--@debug@
		if coordX and ((coordX < -100) or (coordX > 100)) or coordY and ((coordY < -100) or (coordY > 100)) then
			coordX = nil
			coordY = nil
			self:Debug("Invalid location coordinates for recipe ID %d. Location: %s.", recipe:SpellID(), locationName)
		end
		--@end-debug@

		if coordX and coordY and zoneID and continentID then
			if coordX == 0 and coordY == 0 and not INSTANCE_LOCATIONS[locationName] then
				self:Debug("Location is \"0, 0\" for recipe ID %d. Location: %s.", recipe:SpellID(), locationName)
			end

			if _G.TomTom then
                local waypoint = _G.TomTom:AddMFWaypoint(zoneID, nil, coordX / 100, coordY / 100, {
                    crazy = true,
                    title = waypointName,
                })

                if waypoint then
                    table.insert(icon_list, waypoint)

                    SetWaypointIcon(waypoint, _G.Minimap:GetChildren())

                    if _G.TomTomMapOverlay then
                        SetWaypointIcon(waypoint, _G.TomTomMapOverlay:GetChildren())
                    end
                else
                    self:Debug("No waypoint provided by TomTom.")
                end
            end
			--@debug@
        else
            if not zoneID then
                self:Debug("No zone for recipe ID %d. Location: %s.", recipe:SpellID(), locationName)
            end

            if not continentID then
                self:Debug("No continent for recipe ID %d. Location: %s.", recipe:SpellID(), locationName)
            end
            --@end-debug@
        end
    end
end
