-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local string = _G.string

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Imports.
-------------------------------------------------------------------------------
local REPUTATION_COLORS = private.REPUTATION_COLORS

-------------------------------------------------------------------------------
-- Objects.
-------------------------------------------------------------------------------
local AcquireType = {
    EntryPadding = "    ",
    RecipeQualityColors = _G.setmetatable({}, {
        __index = function(t, recipe_quality)
            local r, g, b, hex = _G.GetItemQualityColor(recipe_quality)
            local rgbValues = {
                hex = hex,
                r = r,
                g = g,
                b = b
            }

            t[recipe_quality] = rgbValues
            return rgbValues
        end
    }),
}

local AcquireTypeMetatable = {
    __index = AcquireType,
}

private.ACQUIRE_TYPES_BY_ID = {}
private.ACQUIRE_TYPE_IDS = {}
private.constants.ACQUIRE_TYPE_IDS = private.ACQUIRE_TYPE_IDS

private.AcquireTypes = {}

-------------------------------------------------------------------------------
-- AcquireType Methods.
-------------------------------------------------------------------------------
function AcquireType:AddEntity(module, entity)
    if self._entities[entity.identifier] then
        private:Debug("Duplicate %s entity from %s: %s - %s.", self:Name(), module.Name, entity.identifier, entity.name)
        return
    end

    --@alpha@
    if not entity.location and self:HasCoordinates() then
        private:Debug("%s %s (%s) has an unknown location.", self:Name(), entity.name or _G.UNKNOWN, entity.identifier)
    end

    if entity.faction and self:ID() == private.ACQUIRE_TYPE_IDS.MOB_DROP then
        private:Debug("Mob %d (%s) has been assigned to faction %s.", entity.identifier, entity.name, entity.faction)
    end
    --@end-alpha@
    self._entities[entity.identifier] = entity
    return entity
end

function AcquireType:AssignRecipe(spell_id, affiliation)
    self._recipes[spell_id] = affiliation or true
end

function AcquireType:ColorData()
    return self._color_data
end

function AcquireType:EntityPairs()
    return pairs(self._entities)
end

function AcquireType:ExpandListEntry(entry_index, entry_type, parent_entry, identifier, info, recipe, hide_location, hide_type)
    return self._func_expand_list_entry(self, entry_index, entry_type, parent_entry, identifier, info, recipe, hide_location, hide_type)
end

function AcquireType:GetEntity(identifier)
    return self._entities[identifier]
end

function AcquireType:GetRecipe(spell_id)
    return self._recipes[spell_id]
end

function AcquireType:GetSortedRecipes()
    return private.SortRecipeList(self._recipes)
end

function AcquireType:GetWaypointEntity(id_num, recipe)
    return self._func_waypoint_target(self, id_num, recipe)
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

function AcquireType:RecipePairs()
    return pairs(self._recipes)
end

-------------------------------------------------------------------------------
-- AcquireType Functions.
-------------------------------------------------------------------------------
function AcquireType.GetTipFactionInfo(comp_faction)
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

function AcquireType.CanDisplayFaction(faction)
    if private.db.profile.filters.general.faction then
        return true
    end
    return (not faction or faction == private.Player.faction or faction == "Neutral")
end

function AcquireType.ColorNameByFaction(name, faction)
    if faction == "Neutral" then
        name = private.SetTextColor(REPUTATION_COLORS.neutral.hex, name)
    elseif faction == private.Player.faction then
        name = private.SetTextColor(REPUTATION_COLORS.exalted.hex, name)
    else
        name = private.SetTextColor(REPUTATION_COLORS.hated.hex, name)
    end
    return name
end

-------------------------------------------------------------------------------
-- Instantiation.
-------------------------------------------------------------------------------
function private.RegisterAcquireType(acquireType)
    local index = #private.ACQUIRE_TYPES_BY_ID + 1
    acquireType._id = index
    acquireType._entities = {}
    acquireType._recipes = {}

    _G.setmetatable(acquireType, AcquireTypeMetatable)

    private.ACQUIRE_TYPES_BY_ID[index] = acquireType
    private.ACQUIRE_TYPE_IDS[acquireType._label] = index

    -- Make things easier by assigning the AcquireType by title case: WORLD_DROP becomes WorldDrop, for example
    private.AcquireTypes[acquireType._label:lower():gsub("^%l", string.upper):gsub("_%l", string.upper):gsub("_", "")] = acquireType
end
