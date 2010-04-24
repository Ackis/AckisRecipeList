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
-- **AckisRecipeList** provides an interface for scanning professions for missing recipes.
-- There are a set of functions which allow you make use of the ARL database outside of ARL.
-- ARL supports all professions currently in World of Warcraft 3.3.2
-- @class file
-- @name Waypoint.lua
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local table = _G.table

local string = _G.string

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local LibStub = LibStub

local MODNAME	= "Ackis Recipe List"
local addon	= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

-- Set up the private intra-file namespace.
local private	= select(2, ...)

local Player	= private.Player

local A = private.acquire_types
local F = private.filter_flags

-------------------------------------------------------------------------------
-- Constants.
-------------------------------------------------------------------------------
local FACTION_NEUTRAL		= BFAC["Neutral"]

local C1 = {}
local C2 = {}
local C3 = {}
local C4 = {}

local c1 = {}
local c2 = {}
local c3 = {}
local c4 = {}

local function LoadZones(c, y, ...)
	-- Fill up the list for normal lookup
	for i = 1, select('#', ...), 1 do
		c[i] = select(i, ...)
	end

	-- Reverse lookup to make work easier later on
	for i in pairs(c) do
		y[c[i]] = i
	end
end

--	addon:Print("Loading zones for continent 1")
LoadZones(C1, c1, GetMapZones(1))
--	addon:Print("Loading zones for continent 2")
LoadZones(C2, c2, GetMapZones(2))
--	addon:Print("Loading zones for continent 3")
LoadZones(C3, c3, GetMapZones(3))
--	addon:Print("Loading zones for continent 4")
LoadZones(C4, c4, GetMapZones(4))

local INSTANCE_LOCATIONS = {
	[BZ["Ahn'kahet: The Old Kingdom"]] = {
		["loc"] = c4[BZ["Dragonblight"]],
		["c"] = 4,
		["x"] = 28.49,
		["y"] = 51.73,
	},
	[BZ["Auchenai Crypts"]] = {
		["loc"] = c1[BZ["Terokkar Forest"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Azjol-Nerub"]] = {
		["loc"] = c4[BZ["Dragonblight"]],
		["c"] = 4,
		["x"] = 26.01,
		["y"] = 50.83,
	},
	[BZ["Blackrock Depths"]] = {
		["loc"] = c1[BZ["Searing Gorge"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Blackrock Spire"]] = {
		["loc"] = c1[BZ["Searing Gorge"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Blackwing Lair"]] = {
		["loc"] = c1[BZ["Searing Gorge"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Dire Maul"]] = {
		["loc"] = c1[BZ["Feralas"]],
		["c"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Drak'Tharon Keep"]] = {
		["loc"] = c1[BZ["Zul'Drak"]],
		["c"] = 4,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Gnomeregan"]] = {
		["loc"] = c1[BZ["Dun Morogh"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Halls of Lightning"]] = {
		["loc"] = c4[BZ["The Storm Peaks"]],
		["c"] = 4,
		["x"] = 45.40,
		["y"] = 21.37,
	},
	[BZ["Halls of Stone"]] = {
		["loc"] = c4[BZ["The Storm Peaks"]],
		["c"] = 4,
		["x"] = 39.49,
		["y"] = 26.92,
	},
	[BZ["Karazhan"]] = {
		["loc"] = c1[BZ["Deadwind Pass"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Magisters' Terrace"]] = {
		["loc"] = c2[BZ["Isle of Quel'Danas"]],
		["c"] = 2,
		["x"] = 61.20,
		["y"] = 30.89,
	},
	[BZ["Mana-Tombs"]] = {
		["loc"] = c1[BZ["Terokkar Forest"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Oculus"]] = {
		["loc"] = c4[BZ["Borean Tundra"]],
		["c"] = 4,
		["x"] = 27.52,
		["y"] = 26.71,
	},
	[BZ["Old Hillsbrad Foothills"]] = {
		["loc"] = c1[BZ["Tanaris"]],
		["c"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Onyxia's Lair"]] = {
		["loc"] = c1[BZ["Dustwallow Marsh"]],
		["c"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Ruins of Ahn'Qiraj"]] = {
		["loc"] = c1[BZ["Tanaris"]],
		["c"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Scholomance"]] = {
		["loc"] = c1[BZ["Western Plaguelands"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Sethekk Halls"]] = {
		["loc"] = c1[BZ["Terokkar Forest"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Shadow Labyrinth"]] = {
		["loc"] = c1[BZ["Terokkar Forest"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Stratholme"]] = {
		["loc"] = c1[BZ["Eastern Plaguelands"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["Temple of Ahn'Qiraj"]] = {
		["loc"] = c1[BZ["Tanaris"]],
		["c"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Arcatraz"]] = {
		["loc"] = c1[BZ["Netherstorm"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Black Morass"]] = {
		["loc"] = c1[BZ["Tanaris"]],
		["c"] = 1,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Botanica"]] = {
		["loc"] = c1[BZ["Netherstorm"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Deadmines"]] = {
		["loc"] = c1[BZ["Westfall"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Mechanar"]] = {
		["loc"] = c1[BZ["Netherstorm"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Nexus"]] = {
		["loc"] = c4[BZ["Borean Tundra"]],
		["c"] = 4,
		["x"] = 27.50,
		["y"] = 25.97,
	},
	[BZ["The Shattered Halls"]] = {
		["loc"] = c1[BZ["Hellfire Peninsula"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Slave Pens"]] = {
		["loc"] = c1[BZ["Zangarmarsh"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Steamvault"]] = {
		["loc"] = c1[BZ["Zangarmarsh"]],
		["c"] = 3,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Temple of Atal'Hakkar"]] = {
		["loc"] = c1[BZ["Swamp of Sorrows"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
	[BZ["The Violet Hold"]] = {
		["loc"] = c4[BZ["Dalaran"]],
		["c"] = 4,
		["x"] = 66.78,
		["y"] = 68.19,
	},
	[BZ["Utgarde Keep"]] = {
		["loc"] = c4[BZ["Howling Fjord"]],
		["c"] = 4,
		["x"] = 57.28,
		["y"] = 46.73,
	},
	[BZ["Utgarde Pinnacle"]] = {
		["loc"] = c4[BZ["Howling Fjord"]],
		["c"] = 4,
		["x"] = 57.26,
		["y"] = 46.67,
	},
	[BZ["Zul'Gurub"]] = {
		["loc"] = c1[BZ["Stranglethorn Vale"]],
		["c"] = 2,
		["x"] = 0,
		["y"] = 0,
	},
}

local iconlist = {}

-- Clears all the icons from the world map and the mini-map
function addon:ClearMap()
	if TomTom then
		for i in pairs(iconlist) do
			TomTom:RemoveWaypoint(iconlist[i])
		end
		iconlist = table.wipe(iconlist)
	end
end

local function GetWaypoint(acquire_type, id_num, recipe)
	local maptrainer = addon.db.profile.maptrainer
	local mapquest = addon.db.profile.mapquest
	local mapvendor = addon.db.profile.mapvendor
	local mapmob = addon.db.profile.mapmob

	local player_faction = Player.faction
	local waypoint

	if acquire_type == A.TRAINER and maptrainer then
		local trainer = private.trainer_list[id_num]

		if trainer.faction == BFAC[player_faction] or trainer.faction == FACTION_NEUTRAL then
			waypoint = trainer
		end
	elseif acquire_type == A.VENDOR and mapvendor then
		local vendor = private.vendor_list[id_num]

		if vendor.faction == BFAC[player_faction] or vendor.faction == FACTION_NEUTRAL then
			waypoint = vendor
		end
	elseif acquire_type == A.REPUTATION and mapvendor then
		local vendor = private.vendor_list[id_num]

		if vendor.faction == BFAC[player_faction] or vendor.faction == FACTION_NEUTRAL then
			waypoint = vendor
		end
	elseif acquire_type == A.MOB_DROP and mapmob then
		waypoint = private.mob_list[id_num]
	elseif  acquire_type == A.QUEST and mapquest then
		local quest = private.quest_list[id_num]

		if quest.faction == BFAC[player_faction] or quest.faction == FACTION_NEUTRAL then
			waypoint = quest
		end
	elseif acquire_type == A.CUSTOM then
		if recipe:IsFlagged("common1", "TRAINER") and maptrainer then
			waypoint = private.custom_list[id_num]
		elseif recipe:IsFlagged("common1", "VENDOR") and mapvendor then
			waypoint = private.custom_list[id_num]
		elseif recipe:IsFlagged("common1", "QUEST") and mapquest then
			waypoint = private.custom_list[id_num]
		elseif recipe:IsFlagged("common1", "INSTANCE") or
			recipe:IsFlagged("common1", "RAID") or
			recipe:IsFlagged("common1", "WORLD_DROP") or
			recipe:IsFlagged("common1", "MOB_DROP") then
				waypoint = private.custom_list[id_num]
		end
	end
	return waypoint
end

local maplist = {}

-- Adds mini-map and world map icons with tomtom.
-- Expected result: Icons are added to the world map and mini-map.
-- Input: An optional recipe ID
-- Output: Points are added to the maps
function addon:SetupMap(single_recipe)
	if not TomTom then
		return
	end
	local worldmap = addon.db.profile.worldmap
	local minimap = addon.db.profile.minimap

	if not (worldmap or minimap) then
		return
	end
	local icontext = "Interface\\AddOns\\AckisRecipeList\\img\\enchant_up"

	-- Get the proper icon to put on the mini-map
	--		for i, k in pairs(SORTED_PROFESSIONS) do
	--			if (k["name"] == Player.current_prof) then
	--				icontext = "Interface\\AddOns\\AckisRecipeList\\img\\" .. k["texture"] .. "_up"
	--				break
	--			end
	--		end
	table.wipe(maplist)

	local recipe_list = private.recipe_list

	-- We're only getting a single recipe, not a bunch
	if single_recipe then
		local recipe = recipe_list[single_recipe]

		for acquire_type, acquire_info in pairs(recipe.acquire_data) do
			for id_num, id_info in pairs(acquire_info) do
				if acquire_type == A.REPUTATION then
					for rep_level, level_info in pairs(id_info) do
						for vendor_id in pairs(level_info) do
							local waypoint = GetWaypoint(acquire_type, vendor_id, recipe)

							if waypoint then
								maplist[waypoint] = single_recipe
							end
						end
					end
				else
					local waypoint = GetWaypoint(acquire_type, id_num, recipe)

					if waypoint then
						maplist[waypoint] = single_recipe
					end
				end
			end
		end
	elseif addon.db.profile.autoscanmap then
		local sorted_recipes = addon.sorted_recipes
		local SF = private.recipe_state_flags
		local editbox_text = addon.Frame.search_editbox:GetText()
		-- Scan through all recipes to display, and add the vendors to a list to get their acquire info
		for i = 1, #sorted_recipes do
			local recipe = recipe_list[sorted_recipes[i]]
			local matches_search = true

			if editbox_text ~= "" and editbox_text ~= _G.SEARCH then
				matches_search = recipe:HasState("RELEVANT")
			end

			if recipe:HasState("VISIBLE") and matches_search then
				for acquire_type, acquire_info in pairs(recipe.acquire_data) do
					for id_num, id_info in pairs(acquire_info) do
						if acquire_type == A.REPUTATION then
							for rep_level, level_info in pairs(id_info) do
								for vendor_id in pairs(level_info) do
									local waypoint = GetWaypoint(acquire_type, vendor_id, recipe)

									if waypoint then
										maplist[waypoint] = sorted_recipes[i]
									end
								end
							end
						else
							local waypoint = GetWaypoint(acquire_type, id_num, recipe)

							if waypoint then
								maplist[waypoint] = sorted_recipes[i]
							end
						end
					end
				end
			end
		end
	end

	--		local ARLWorldMap = CreateFrame("Button","ARLWorldMap",WorldMapDetailFrame)
	--		ARLWorldMap:ClearAllPoints()
	--		ARLWorldMap:SetWidth(8)
	--		ARLWorldMap:SetHeight(8)
	--		ARLWorldMap.icon = ARLWorldMap:CreateTexture("ARTWORK")
	--		ARLWorldMap.icon:SetTexture(icontext)
	--		ARLWorldMap.icon:SetAllPoints()

	--		local ARLMiniMap = CreateFrame("Button","ARLMiniMap",MiniMap)
	--		ARLMiniMap:ClearAllPoints()
	--		ARLMiniMap:SetWidth(8)
	--		ARLMiniMap:SetHeight(8)
	--		ARLMiniMap.icon = ARLMiniMap:CreateTexture("ARTWORK")
	--		ARLMiniMap.icon:SetTexture(icontext)
	--		ARLMiniMap.icon:SetAllPoints()

	for entry, spell_id in pairs(maplist) do
		local name = string.format("%s (%s)", entry.name, recipe_list[spell_id].name)
		local x = entry.coord_x
		local y = entry.coord_y
		local location = entry.location
		local continent, zone

		if c1[location] then
			continent = 1
			zone = c1[location]
		elseif c2[location] then
			continent = 2
			zone = c2[location]
		elseif c3[location] then
			continent = 3
			zone = c3[location]
		elseif c4[location] then
			continent = 4
			zone = c4[location]
		elseif INSTANCE_LOCATIONS[location] then
			local info = INSTANCE_LOCATIONS[location]

			continent = info.c
			x = info.x
			y = info.y
			zone = info.loc
			name = name .. " (" .. location .. ")"
		else
			addon:Debug("No continent/zone map match for ID %d. Location: %s.", spell_id, location)
		end

		--@alpha@
		if (x < -100) or (x > 100) or (y < -100) or (y > 100) then
			addon:Debug("Invalid location coordinates for ID %d. Location: %s.", spell_id, location)
		end
		--@end-alpha@

		if zone and continent then
			--@alpha@
			if x == 0 and y == 0 then
				addon:Debug("Location is \"0, 0\" for ID %d. Location: %s.", spell_id, location)
			end
			--@end-alpha@
			local iconuid = TomTom:AddZWaypoint(continent, zone, x, y, name, false, minimap, worldmap)

			tinsert(iconlist, iconuid)
		else
			--@alpha@
			if not zone then
				self:Printf("No zone for ID %d. Location: %s.", spell_id, location)
			end

			if not continent then
				self:Printf("No continent for ID %d. Location: %s.", spell_id, location)
			end
			--@end-alpha@
		end
	end
end
