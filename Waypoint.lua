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
local LibStub = _G.LibStub

local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

-- Set up the private intra-file namespace.
local FOLDER_NAME, private	= ...

local A = private.acquire_types
local F = private.filter_flags

-------------------------------------------------------------------------------
-- Constants.
-------------------------------------------------------------------------------
local FACTION_NEUTRAL		= BFAC["Neutral"]

local KALIMDOR_NAMES = {}
local EASTERN_KINGDOMS_NAMES = {}
local OUTLAND_NAMES = {}
local NORTHREND_NAMES = {}

local KALIMDOR_IDNUMS = {}
local EASTERN_KINGDOMS_IDNUMS = {}
local OUTLAND_IDNUMS = {}
local NORTHREND_IDNUMS = {}

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

local INSTANCE_LOCATIONS = {
	[BZ["Ahn'kahet: The Old Kingdom"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Dragonblight"]],
		["continent"] = 4,
		["x"] = 28.49,
		["y"] = 51.73,
	},
	[BZ["Auchenai Crypts"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Terokkar Forest"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Azjol-Nerub"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Dragonblight"]],
		["continent"] = 4,
		["x"] = 26.01,
		["y"] = 50.83,
	},
	[BZ["Blackrock Depths"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Searing Gorge"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Blackrock Spire"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Searing Gorge"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Blackwing Lair"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Searing Gorge"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Dire Maul"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Feralas"]],
		["continent"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Drak'Tharon Keep"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Zul'Drak"]],
		["continent"] = 4,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Gnomeregan"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Dun Morogh"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Halls of Lightning"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["The Storm Peaks"]],
		["continent"] = 4,
		["x"] = 45.40,
		["y"] = 21.37,
	},
	[BZ["Halls of Stone"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["The Storm Peaks"]],
		["continent"] = 4,
		["x"] = 39.49,
		["y"] = 26.92,
	},
	[BZ["Karazhan"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Deadwind Pass"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Magisters' Terrace"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Isle of Quel'Danas"]],
		["continent"] = 2,
		["x"] = 61.20,
		["y"] = 30.89,
	},
	[BZ["Mana-Tombs"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Terokkar Forest"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Oculus"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Borean Tundra"]],
		["continent"] = 4,
		["x"] = 27.52,
		["y"] = 26.71,
	},
	[BZ["Old Hillsbrad Foothills"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Tanaris"]],
		["continent"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Onyxia's Lair"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Dustwallow Marsh"]],
		["continent"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Ruins of Ahn'Qiraj"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Silithus"]],
		["continent"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Scholomance"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Western Plaguelands"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Sethekk Halls"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Terokkar Forest"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Shadow Labyrinth"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Terokkar Forest"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Stratholme"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Eastern Plaguelands"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Temple of Ahn'Qiraj"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Silithus"]],
		["continent"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Arcatraz"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Netherstorm"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Black Morass"]] = {
		["zone"] = KALIMDOR_IDNUMS[BZ["Tanaris"]],
		["continent"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Botanica"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Netherstorm"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Deadmines"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Westfall"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Mechanar"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Netherstorm"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Nexus"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Borean Tundra"]],
		["continent"] = 4,
		["x"] = 27.50,
		["y"] = 25.97,
	},
	[BZ["The Shattered Halls"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Hellfire Peninsula"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Slave Pens"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Zangarmarsh"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Steamvault"]] = {
		["zone"] = OUTLAND_IDNUMS[BZ["Zangarmarsh"]],
		["continent"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Temple of Atal'Hakkar"]] = {
		["zone"] = EASTERN_KINGDOMS_IDNUMS[BZ["Swamp of Sorrows"]],
		["continent"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Violet Hold"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Dalaran"]],
		["continent"] = 4,
		["x"] = 66.78,
		["y"] = 68.19,
	},
	[BZ["Utgarde Keep"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Howling Fjord"]],
		["continent"] = 4,
		["x"] = 57.28,
		["y"] = 46.73,
	},
	[BZ["Utgarde Pinnacle"]] = {
		["zone"] = NORTHREND_IDNUMS[BZ["Howling Fjord"]],
		["continent"] = 4,
		["x"] = 57.26,
		["y"] = 46.67,
	},
}

local iconlist = {}

-- Clears all the icons from the world map and the mini-map
function addon:ClearWaypoints()
	if _G.TomTom and _G.TomTom.RemoveWaypoint then
		while iconlist[1] do
			_G.TomTom:RemoveWaypoint(table.remove(iconlist))
		end
	elseif _G.Cartographer_Waypoints then
		while iconlist[1] do
			_G.Cartographer_Waypoints:CancelWaypoint(table.remove(iconlist))
		end
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

		if trainer_faction == BFAC[private.Player.faction] or trainer_faction == FACTION_NEUTRAL then
			return trainer
		end
	end,
	[A.VENDOR] = function(id_num, recipe)
		if not addon.db.profile.mapvendor then
			return
		end
		local vendor = private.vendor_list[id_num]
		local vendor_faction = vendor.faction

		if vendor_faction == BFAC[private.Player.faction] or vendor_faction == FACTION_NEUTRAL then
			return vendor
		end
	end,
	[A.REPUTATION] = function(id_num, recipe)
		if not addon.db.profile.mapvendor then
			return
		end
		local vendor = private.vendor_list[id_num]
		local vendor_faction = vendor.faction

		if vendor_faction == BFAC[private.Player.faction] or vendor_faction == FACTION_NEUTRAL then
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

		if quest_faction == BFAC[private.Player.faction] or quest_faction == FACTION_NEUTRAL then
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

local TEXTURE_UP_FORMAT = ([[Interface\Addons\%s\img\]]):format(FOLDER_NAME) .. "%s_up"
local current_waypoints = {}

local function AddRecipeWaypoints(recipe_id, acquire_id, location_id, npc_id)
	local recipe = private.recipe_list[recipe_id]

	for acquire_type, acquire_info in pairs(recipe.acquire_data) do
		local waypoint_func = WAYPOINT_FUNCS[acquire_type]

		if waypoint_func and (not acquire_id or acquire_type == acquire_id) then
			for id_num, id_info in pairs(acquire_info) do
				if not npc_id or id_num == npc_id then
					if acquire_type == A.REPUTATION then
						for rep_level, level_info in pairs(id_info) do
							for vendor_id in pairs(level_info) do
								local waypoint = waypoint_func(vendor_id, recipe)

								if waypoint and (not location_id or waypoint.location == location_id) then
									waypoint.acquire_type = acquire_type
									current_waypoints[waypoint] = recipe_id
								end
							end
						end
					else
						local waypoint = waypoint_func(id_num, recipe)

						if waypoint and (not location_id or waypoint.location == location_id) then
							waypoint.acquire_type = acquire_type
							waypoint.reference_id = id_num
							current_waypoints[waypoint] = recipe_id
						end
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

-- Adds mini-map and world map icons with tomtom.
-- Expected result: Icons are added to the world map and mini-map.
-- Input: An optional recipe ID, acquire ID, and location ID.
-- Output: Points are added to the maps
function addon:AddWaypoint(recipe_id, acquire_id, location_id, npc_id)
	if not _G.TomTom and not _G.Cartographer_Waypoints then
		return
	end
	local worldmap = addon.db.profile.worldmap
	local minimap = addon.db.profile.minimap

	if not worldmap and not minimap then
		return
	end
	table.wipe(current_waypoints)

	if recipe_id then
		AddRecipeWaypoints(recipe_id, acquire_id, location_id, npc_id)
	elseif addon.db.profile.autoscanmap then
		AddAllWaypoints(acquire_id, location_id, npc_id)
	end
	local recipe_list = private.recipe_list

	for waypoint, spell_id in pairs(current_waypoints) do
		local name
		local x = waypoint.coord_x
		local y = waypoint.coord_y
		local location_name = waypoint.location or "nil"
		local continent, zone
		local recipe = recipe_list[spell_id]
		local _, _, _, quality_color = _G.GetItemQualityColor(recipe.quality)
		local acquire_str = string.gsub(private.acquire_strings[waypoint.acquire_type]:lower(), "_", "")
		local color_code = private.category_colors[acquire_str] or "ffffff"

		if waypoint.acquire_type == A.QUEST then
			name = string.format("Quest: |cff%s%s|r (%s%s|r)", color_code, private.quest_names[waypoint.reference_id], quality_color, recipe.name)
		else
			name = string.format("|cff%s%s|r (%s%s|r)", color_code, waypoint.name or _G.UNKNOWN, quality_color, recipe.name)
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
		elseif INSTANCE_LOCATIONS[location_name] then
			local info = INSTANCE_LOCATIONS[location_name]

			zone = info.zone
			continent = info.continent
			x = info.x
			y = info.y
			name = ("%s (%s)"):format(name, location_name)
		else
			self:Debug("No continent/zone map match for recipe ID %d. Location: %s.", spell_id, location_name)
		end

		--@alpha@
		if not x or not y or (x < -100) or (x > 100) or (y < -100) or (y > 100) then
			self:Debug("Invalid location coordinates for recipe ID %d. Location: %s.", spell_id, location_name)
		end
		--@end-alpha@

		if zone and continent then
			if x == 0 and y == 0 and not INSTANCE_LOCATIONS[location_name] then
				self:Debug("Location is \"0, 0\" for recipe ID %d. Location: %s.", spell_id, location_name)
			end

			if _G.TomTom then
				local uid = _G.TomTom:AddZWaypoint(continent, zone, x, y, name, false, minimap, worldmap)
				table.insert(iconlist, uid)

				if _G.TomTom.ChangeWaypointIcon then
					local icon_tex

					-- Get the proper icon to put on the mini-map
					for index, profession in pairs(private.ordered_professions) do
						if index == self.Frame.profession then
							icon_tex = TEXTURE_UP_FORMAT:format(private.profession_textures[index])
							break
						end
					end
					_G.TomTom:ChangeWaypointIcon(uid, minimap, worldmap, icon_tex)
				end
			elseif _G.Cartographer_Waypoints then
				local pt = _G.NotePoint:new(zone, x/100, y/100, name)
				_G.Cartographer_Waypoints:AddWaypoint(pt)
				table.insert(iconlist, pt.WaypointID)
			end
		else
			--@alpha@
			if not zone then
				self:Debug("No zone for recipe ID %d. Location: %s.", spell_id, location_name)
			end

			if not continent then
				self:Debug("No continent for recipe ID %d. Location: %s.", spell_id, location_name)
			end
			--@end-alpha@
		end
	end
end
