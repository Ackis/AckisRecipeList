-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string

local pairs = _G.pairs
local tonumber = _G.tonumber
local tostring = _G.tostring
local type = _G.type

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local AcquireType = {}
local acquire_type_metatable = {
	__index = AcquireType
}

-------------------------------------------------------------------------------
-- Imports.
-------------------------------------------------------------------------------
local BASIC_COLORS = private.BASIC_COLORS
local CATEGORY_COLORS = private.CATEGORY_COLORS
local COORDINATES_FORMAT = private.COORDINATES_FORMAT
local FAC = private.LOCALIZED_FACTION_STRINGS
local REPUTATION_COLORS = private.REPUTATION_COLORS

local CreateListEntry = private.CreateListEntry
local SetTextColor = private.SetTextColor

-------------------------------------------------------------------------------
-- Constants.
-------------------------------------------------------------------------------
local PADDING = "    " -- Padding for list entries/subentries

-------------------------------------------------------------------------------
-- Helpers.
-------------------------------------------------------------------------------
local function CanDisplayFaction(faction)
	if private.db.profile.filters.general.faction then
		return true
	end
	return (not faction or faction == private.Player.faction or faction == "Neutral")
end

local function ColorNameByFaction(name, faction)
	if faction == "Neutral" then
		name = SetTextColor(private.REPUTATION_COLORS.neutral.hex, name)
	elseif faction == private.Player.faction then
		name = SetTextColor(private.REPUTATION_COLORS.exalted.hex, name)
	else
		name = SetTextColor(private.REPUTATION_COLORS.hated.hex, name)
	end
	return name
end

local function GetTipFactionInfo(comp_faction)
	local display_tip = true
	local color_table

	if comp_faction == "Neutral" then
		color_table = REPUTATION_COLORS.neutral
	elseif comp_faction == private.Player.faction then
		color_table = REPUTATION_COLORS.exalted
	else
		color_table = REPUTATION_COLORS.hated
		display_tip = private.db.profile.filters.general.faction
	end
	return display_tip, color_table
end

-------------------------------------------------------------------------------
-- Memoizing table for recipe qualities.
-------------------------------------------------------------------------------
local RECIPE_QUALITY_COLORS = _G.setmetatable({}, {
	__index = function(t, recipe_quality)
		local r, g, b = _G.GetItemQualityColor(recipe_quality)
		local rgb_values = {
			hex = private.ColorRGBtoHEX(r, g, b),
			r = r,
			g = g,
			b = b
		}

		t[recipe_quality] = rgb_values
		return rgb_values
	end
})

-------------------------------------------------------------------------------
-- AcquireType Definitions.
-------------------------------------------------------------------------------
local ACQUIRE_TYPES = {
	-------------------------------------------------------------------------------
	-- Trainer.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = true,
		_label = "TRAINER",
		_name = L["Trainer"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local trainer = private.trainer_list[identifier]

			if not trainer or (location and trainer.location ~= location) then
				return
			end
			local display_tip, name_color = GetTipFactionInfo(trainer.faction)

			if not display_tip then
				return
			end
			addline_func(0, -2, false, self:Name(), CATEGORY_COLORS.trainer, trainer.name, name_color)

			if trainer.coord_x ~= 0 and trainer.coord_y ~= 0 then
				addline_func(1, -2, true, trainer.location, CATEGORY_COLORS.location, COORDINATES_FORMAT:format(trainer.coord_x, trainer.coord_y), CATEGORY_COLORS.coords)
			else
				addline_func(1, -2, true, trainer.location, CATEGORY_COLORS.location, "", CATEGORY_COLORS.coords)
			end
		end,
	},

	-------------------------------------------------------------------------------
	-- Vendor.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = true,
		_label = "VENDOR",
		_name = L["Vendor"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local vendor = private.vendor_list[identifier]

			if not vendor or (location and vendor.location ~= location) then
				return
			end
			local display_tip, name_color = GetTipFactionInfo(vendor.faction)

			if not display_tip then
				return
			end
			addline_func(0, -1, false, L["Vendor"], CATEGORY_COLORS.vendor, vendor.name, name_color)

			if vendor.coord_x ~= 0 and vendor.coord_y ~= 0 then
				addline_func(1, -2, true, vendor.location, CATEGORY_COLORS.location, COORDINATES_FORMAT:format(vendor.coord_x, vendor.coord_y), CATEGORY_COLORS.coords)
			else
				addline_func(1, -2, true, vendor.location, CATEGORY_COLORS.location, "", CATEGORY_COLORS.coords)
			end
			local quantity = vendor.item_list[recipe.id]

			if type(quantity) == "number" then
				addline_func(2, -2, true, L["LIMITED_SUPPLY"], CATEGORY_COLORS.vendor, ("(%d)"):format(quantity), BASIC_COLORS.white)
			end
		end,
	},

	-------------------------------------------------------------------------------
	-- Mob Drop.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = true,
		_label = "MOB_DROP",
		_name = L["Mob Drop"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local mob = private.mob_list[identifier]

			if not mob or (location and mob.location ~= location) then
				return
			end
			addline_func(0, -1, false, L["Mob Drop"], CATEGORY_COLORS.mobdrop, mob.name, private.REPUTATION_COLORS.hostile)

			if mob.coord_x ~= 0 and mob.coord_y ~= 0 then
				addline_func(1, -2, true, mob.location, CATEGORY_COLORS.location, COORDINATES_FORMAT:format(mob.coord_x, mob.coord_y), CATEGORY_COLORS.coords)
			else
				addline_func(1, -2, true, mob.location, CATEGORY_COLORS.location, "", CATEGORY_COLORS.coords)
			end
		end,
	},

	-------------------------------------------------------------------------------
	-- Quest.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = true,
		_label = "QUEST",
		_name = L["Quest"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local quest = private.quest_list[identifier]

			if not quest or (location and quest.location ~= location) then
				return
			end
			local display_tip, name_color = GetTipFactionInfo(quest.faction)

			if not display_tip then
				return
			end
			addline_func(0, -1, false, L["Quest"], CATEGORY_COLORS.quest, private.quest_names[identifier], name_color)

			if quest.coord_x ~= 0 and quest.coord_y ~= 0 then
				addline_func(1, -2, true, quest.location, CATEGORY_COLORS.location, COORDINATES_FORMAT:format(quest.coord_x, quest.coord_y), CATEGORY_COLORS.coords)
			else
				addline_func(1, -2, true, quest.location, CATEGORY_COLORS.location, "", CATEGORY_COLORS.coords)
			end
		end,
	},

	-------------------------------------------------------------------------------
	-- World Events.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = true,
		_label = "SEASONAL",
		_name = _G.GetCategoryInfo(155),
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local hex_color = CATEGORY_COLORS.seasonal
			addline_func(0, -1, 0, self:Name(), hex_color, private.seasonal_list[identifier].name, hex_color)
		end,
	},

	-------------------------------------------------------------------------------
	-- Reputation.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = true,
		_label = "REPUTATION",
		_name = _G.REPUTATION,
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			for rep_level, level_info in pairs(acquire_info) do
				for vendor_id in pairs(level_info) do
					local rep_vendor = private.vendor_list[vendor_id]

					if rep_vendor and (not location or rep_vendor.location == location) then
						local display_tip, name_color = GetTipFactionInfo(rep_vendor.faction)

						if display_tip then
							addline_func(0, -1, false, _G.REPUTATION, CATEGORY_COLORS.reputation, private.reputation_list[identifier].name, CATEGORY_COLORS.repname)

							if rep_level == 0 then
								addline_func(1, -2, false, FAC["Neutral"], private.REPUTATION_COLORS.neutral, rep_vendor.name, name_color)
							elseif rep_level == 1 then
								addline_func(1, -2, false, FAC["Friendly"], private.REPUTATION_COLORS.friendly, rep_vendor.name, name_color)
							elseif rep_level == 2 then
								addline_func(1, -2, false, FAC["Honored"], private.REPUTATION_COLORS.honored, rep_vendor.name, name_color)
							elseif rep_level == 3 then
								addline_func(1, -2, false, FAC["Revered"], private.REPUTATION_COLORS.revered, rep_vendor.name, name_color)
							else
								addline_func(1, -2, false, FAC["Exalted"], private.REPUTATION_COLORS.exalted, rep_vendor.name, name_color)
							end

							if rep_vendor.coord_x ~= 0 and rep_vendor.coord_y ~= 0 then
								addline_func(2, -2, true, rep_vendor.location, CATEGORY_COLORS.location, COORDINATES_FORMAT:format(rep_vendor.coord_x, rep_vendor.coord_y), CATEGORY_COLORS.coords)
							else
								addline_func(2, -2, true, rep_vendor.location, CATEGORY_COLORS.location, "", CATEGORY_COLORS.coords)
							end
						end
					end
				end
			end
		end,
	},

	-------------------------------------------------------------------------------
	-- World Drop.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = false,
		_label = "WORLD_DROP",
		_name = L["World Drop"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local drop_location = type(identifier) == "string" and identifier or _G.UNKNOWN

			if location and drop_location ~= location then
				return
			end
			local recipe_item_id = recipe:RecipeItem()
			local recipe_item_level = recipe_item_id and select(4, _G.GetItemInfo(recipe_item_id))
			local location_text

			if recipe_item_level then
				location_text = ("%s (%d - %d)"):format(drop_location, recipe_item_level - 5, recipe_item_level + 5)
			else
				location_text = drop_location
			end
			addline_func(0, -1, false, self:Name(), RECIPE_QUALITY_COLORS[recipe.quality], location_text, CATEGORY_COLORS.location)
		end,
	},

	-------------------------------------------------------------------------------
	-- Achievement.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = false,
		_label = "ACHIEVEMENT",
		_name = _G.ACHIEVEMENTS,
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			local _, achievement_name, _, _, _, _, _, achievement_desc = _G.GetAchievementInfo(identifier)

			-- The recipe is an actual reward from an achievement if flagged - else we're just using the text to describe how to get it.
			if recipe:HasFilter("common1", "ACHIEVEMENT") then
				addline_func(0, -1, false, _G.ACHIEVEMENTS, CATEGORY_COLORS.achievement, achievement_name, BASIC_COLORS.normal)
			end
			addline_func(0, -1, false, achievement_desc, CATEGORY_COLORS.achievement)
		end,
	},

	-------------------------------------------------------------------------------
	-- Discovery.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = false,
		_label = "DISCOVERY",
		_name = L["Discovery"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			addline_func(0, -1, false, private.discovery_list[identifier].name, CATEGORY_COLORS.discovery)
		end,
	},

	-------------------------------------------------------------------------------
	-- Custom.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = false,
		_label = "CUSTOM",
		_name = _G.MISCELLANEOUS,
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			addline_func(0, -1, false, private.custom_list[identifier].name, CATEGORY_COLORS.custom)
		end,
	},

	-------------------------------------------------------------------------------
	-- Retired.
	-------------------------------------------------------------------------------
	{
		_has_coordinates = false,
		_label = "RETIRED",
		_name = L["Retired"],
		_func_insert_tooltip_text = function(self, recipe, identifier, location, acquire_info, addline_func)
			addline_func(0, -1, false, L.REMOVED_FROM_GAME, CATEGORY_COLORS.retired)
		end,
	},
}

private.ACQUIRE_TYPES = {}
private.ACQUIRE_TYPE_IDS = {}

for index = 1, #ACQUIRE_TYPES do
	local acquire_type = ACQUIRE_TYPES[index]
	acquire_type._id = index
	_G.setmetatable(acquire_type, acquire_type_metatable)

	private.ACQUIRE_TYPES[index] = acquire_type
	private.ACQUIRE_TYPE_IDS[acquire_type._label] = index
end

-------------------------------------------------------------------------------
-- AcquireType Methods.
-------------------------------------------------------------------------------
function AcquireType:ColorData()
	return self._color_data
end

function AcquireType:ExpandListEntry(entry_index, entry_type, parent_entry, id_num, recipe, hide_location, hide_type)
	return self._func_expand_list_entry(self, entry_index, entry_type, parent_entry, id_num, recipe, hide_location, hide_type)
end

function AcquireType:HasCoordinates()
	return self._has_coordinates
end

function AcquireType:ID()
	return self._id
end

function AcquireType:InsertTooltipText(recipe, identifier, location, acquire_info, addline_func)
	self._func_insert_tooltip_text(self, recipe, identifier, location, acquire_info, addline_func)
end

function AcquireType:Label()
	return self._label
end

function AcquireType:Name()
	return self._name
end
