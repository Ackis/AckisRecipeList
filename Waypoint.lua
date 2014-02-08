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
local string = _G.string

local pairs, select = _G.pairs, _G.select

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private	= ...

local LibStub = _G.LibStub
local addon	= LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L		= LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local A = private.ACQUIRE_TYPES
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

local KALIMDOR_IDNUMS = {}
local EASTERN_KINGDOMS_IDNUMS = {}
local OUTLAND_IDNUMS = {}
local NORTHREND_IDNUMS = {}
local THE_MAELSTROM_IDNUMS = {}
local PANDARIA_IDNUMS = {}

-- TODO: Rewrite the whole thing based on GetMapContinents() instead of raw IDs for continents.
local function LoadZones(continent, zone, ...)
	-- Assign names to idnums
	for id = 1, select('#', ...), 1 do
		continent[id] = select(id, ...)
	end

	-- Reverse lookup to make work easier later on
	for id in pairs(continent) do
		zone[continent[id]] = id
	end
end

LoadZones(KALIMDOR_NAMES, KALIMDOR_IDNUMS, _G.GetMapZones(1))
LoadZones(EASTERN_KINGDOMS_NAMES, EASTERN_KINGDOMS_IDNUMS, _G.GetMapZones(2))
LoadZones(OUTLAND_NAMES, OUTLAND_IDNUMS, _G.GetMapZones(3))
LoadZones(NORTHREND_NAMES, NORTHREND_IDNUMS, _G.GetMapZones(4))
LoadZones(THE_MAELSTROM_NAMES, THE_MAELSTROM_IDNUMS, _G.GetMapZones(5))
LoadZones(PANDARIA_NAMES, PANDARIA_IDNUMS, _G.GetMapZones(6))

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
--		zone = Z.TANARIS,
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

local CUSTOM_FILTERS = {
	"INSTANCE",
	"RAID",
	"WORLD_DROP",
	"MOB_DROP",
}

local CUSTOM_CHECKS = {
	["maptrainer"] = "TRAINER",
	["mapvendor"] = "VENDOR",
	["mapquest"] = "QUEST",
}

local WAYPOINT_FUNCS = {
	[A.TRAINER] = function(id_num, recipe)
		if not addon.db.profile.maptrainer then
			return
		end
		local trainer = private.trainer_list[id_num]
		local trainer_faction = trainer.faction

		if trainer_faction == private.Player.faction or trainer_faction == "Neutral" then
			return trainer
		end
	end,
	[A.VENDOR] = function(id_num, recipe)
		if not addon.db.profile.mapvendor then
			return
		end
		local vendor = private.vendor_list[id_num]
		local vendor_faction = vendor.faction

		if vendor_faction == private.Player.faction or vendor_faction == "Neutral" then
			return vendor
		end
	end,
	[A.REPUTATION] = function(id_num, recipe)
		if not addon.db.profile.mapvendor then
			return
		end
		local vendor = private.vendor_list[id_num]

		if private.Player.reputation_levels[private.reputation_list[vendor.reputation_id].name] then
			return vendor
		end
	end,
	[A.MOB_DROP] = function(id_num, recipe)
		return addon.db.profile.mapmob and private.mob_list[id_num]
	end,
	[A.QUEST] = function(id_num, recipe)
		if not addon.db.profile.mapquest then
			return
		end
		local quest = private.quest_list[id_num]
		local quest_faction = quest.faction

		if quest_faction == private.Player.faction or quest_faction == "Neutral" then
			return quest
		end
	end,
	[A.CUSTOM] = function(id_num, recipe)
		local profile = addon.db.profile

		for field, flag in pairs(CUSTOM_CHECKS) do
			if profile[field] and recipe:HasFilter("common1", flag) then
				return private.custom_list[id_num]
			end
		end

		for index = 1, #CUSTOM_FILTERS do
			if recipe:HasFilter("common1", CUSTOM_FILTERS[index]) then
				return private.custom_list[id_num]
			end
		end
	end,
}

local current_waypoints = {}

local function AddRecipeWaypoints(recipe, acquire_id, location_id, npc_id)
	for acquire_type, acquire_info in pairs(recipe.acquire_data) do
		local waypoint_func = WAYPOINT_FUNCS[acquire_type]

		if waypoint_func and (not acquire_id or acquire_type == acquire_id) then
			for id_num, id_info in pairs(acquire_info) do
				if acquire_type == A.REPUTATION then
					for rep_level, level_info in pairs(id_info) do
						for vendor_id in pairs(level_info) do
							local waypoint = waypoint_func(vendor_id, recipe)

							-- TODO: Figure out why this changes on-click when there are two different locations for the same recipe
							--							addon:Debug("location_id: %s waypoint.location: %s", tostring(location_id), waypoint and tostring(waypoint.location) or "nil")
							if waypoint and (not location_id or waypoint.location == location_id) then
								waypoint.acquire_type = acquire_type
								current_waypoints[waypoint] = recipe
							end
						end
					end
				elseif not npc_id or id_num == npc_id then
					local waypoint = waypoint_func(id_num, recipe)

					if waypoint and (not location_id or waypoint.location == location_id) then
						waypoint.acquire_type = acquire_type
						waypoint.reference_id = id_num
						current_waypoints[waypoint] = recipe
					end
				end
			end
		end
	end
end

local function AddAllWaypoints(acquire_id, location_id, npc_id)
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
			for acquire_type, acquire_info in pairs(recipe.acquire_data) do
				local waypoint_func = WAYPOINT_FUNCS[acquire_type]

				if waypoint_func then
					for id_num, id_info in pairs(acquire_info) do
						if acquire_type == A.REPUTATION then
							for rep_level, level_info in pairs(id_info) do
								for vendor_id in pairs(level_info) do
									local waypoint = waypoint_func(vendor_id, recipe)

									if waypoint then
										waypoint.acquire_type = acquire_type
										current_waypoints[waypoint] = sorted_recipes[index]
									end
								end
							end
						else
							local waypoint = waypoint_func(id_num, recipe)

							if waypoint then
								waypoint.acquire_type = acquire_type
								waypoint.reference_id = id_num
								current_waypoints[waypoint] = sorted_recipes[index]
							end
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
function addon:AddWaypoint(recipe, acquire_id, location_id, npc_id)
	if not _G.TomTom then
		return
	end
	local worldmap = addon.db.profile.worldmap
	local minimap = addon.db.profile.minimap

	if not worldmap and not minimap then
		return
	end
	table.wipe(current_waypoints)

	if recipe then
		AddRecipeWaypoints(recipe, acquire_id, location_id, npc_id)
	elseif addon.db.profile.autoscanmap then
		AddAllWaypoints(acquire_id, location_id, npc_id)
	end
	local recipe_list = private.recipe_list

	for waypoint, recipe in pairs(current_waypoints) do
		local name
		local x = waypoint.coord_x
		local y = waypoint.coord_y
		local location_name = waypoint.location or "nil"
		local continent, zone
		local _, _, _, quality_color = _G.GetItemQualityColor(recipe.quality)
		local acquire_str = private.ACQUIRE_STRINGS[waypoint.acquire_type]:lower():gsub("_","")
		local color_code = private.CATEGORY_COLORS[acquire_str].hex or "ffffff"

		if waypoint.acquire_type == A.QUEST then
			name = ("Quest: |cff%s%s|r (|c%s%s|r)"):format(color_code, private.quest_names[waypoint.reference_id], quality_color, recipe.name)
		else
			name = ("|cff%s%s|r (|c%s%s|r)"):format(color_code, waypoint.name or _G.UNKNOWN, quality_color, recipe.name)
		end
		waypoint.acquire_type = nil
		waypoint.reference_id = nil

		if KALIMDOR_IDNUMS[location_name] then
			continent = 1
			zone = KALIMDOR_IDNUMS[location_name]
		elseif EASTERN_KINGDOMS_IDNUMS[location_name] then
			continent = 2
			zone = EASTERN_KINGDOMS_IDNUMS[location_name]
		elseif OUTLAND_IDNUMS[location_name] then
			continent = 3
			zone = OUTLAND_IDNUMS[location_name]
		elseif NORTHREND_IDNUMS[location_name] then
			continent = 4
			zone = NORTHREND_IDNUMS[location_name]
		elseif PANDARIA_IDNUMS[location_name] then
			continent = 6
			zone = PANDARIA_IDNUMS[location_name]
		elseif INSTANCE_LOCATIONS[location_name] then
			local info = INSTANCE_LOCATIONS[location_name]

			zone = info.zone
			continent = info.continent
			x = info.x
			y = info.y
			name = ("%s (%s)"):format(name, location_name)
		else
			self:Debug("No continent/zone map match for recipe ID %d. Location: %s.", recipe.id, location_name)
		end

		--@debug@
		if x and ((x < -100) or (x > 100)) or y and ((y < -100) or (y > 100)) then
			x = nil
			y = nil
			self:Debug("Invalid location coordinates for recipe ID %d. Location: %s.", recipe.id, location_name)
		end
		--@end-debug@

		if x and y and zone and continent then
			if x == 0 and y == 0 and not INSTANCE_LOCATIONS[location_name] then
				self:Debug("Location is \"0, 0\" for recipe ID %d. Location: %s.", recipe.id, location_name)
			end

			if _G.TomTom then
				local uid = _G.TomTom:AddZWaypoint(continent, zone, x, y, name, false, minimap, worldmap)
				table.insert(icon_list, uid)

				SetWaypointIcon(uid, _G.Minimap:GetChildren())

				if _G.TomTomMapOverlay then
					SetWaypointIcon(uid, _G.TomTomMapOverlay:GetChildren())
				end

			end
		else
			--@debug@
			if not zone then
				self:Debug("No zone for recipe ID %d. Location: %s.", recipe.id, location_name)
			end

			if not continent then
				self:Debug("No continent for recipe ID %d. Location: %s.", recipe.id, location_name)
			end
			--@end-debug@
		end
	end
end
