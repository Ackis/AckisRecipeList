-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Profession data.
-------------------------------------------------------------------------------
private.PROFESSION_SPELL_IDS = {
    ALCHEMY = 2259,
    BLACKSMITHING = 2018,
    COOKING = 2550,
    ENCHANTING = 7411,
    ENGINEERING = 4036,
    FIRSTAID = 3273,
    INSCRIPTION = 45357,
    JEWELCRAFTING = 25229,
    LEATHERWORKING = 2108,
    MINING = 2575,
    TAILORING = 3908,
}
private.constants.PROFESSION_SPELL_IDS = private.PROFESSION_SPELL_IDS

private.LOCALIZED_PROFESSION_NAMES = {}
for name, spell_id in pairs(private.PROFESSION_SPELL_IDS) do
    private.LOCALIZED_PROFESSION_NAMES[name] = _G.GetSpellInfo(spell_id)
end

-- This is needed due to Pandaren cooking spells.
private.LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING = {
    [_G.GetSpellInfo(124694)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Grill
    [_G.GetSpellInfo(125584)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Wok
    [_G.GetSpellInfo(125586)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Pot
    [_G.GetSpellInfo(125587)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Steamer
    [_G.GetSpellInfo(125588)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Oven
    [_G.GetSpellInfo(125589)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Brew
}

for name, localized_name in pairs(private.LOCALIZED_PROFESSION_NAMES) do
    private.LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING[localized_name] = localized_name
end

private.ORDERED_LOCALIZED_PROFESSION_NAMES = {
    private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, 		-- 1
    private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, 	-- 2
    private.LOCALIZED_PROFESSION_NAMES.COOKING, 		-- 3
    private.LOCALIZED_PROFESSION_NAMES.ENCHANTING,		-- 4
    private.LOCALIZED_PROFESSION_NAMES.ENGINEERING,		-- 5
    private.LOCALIZED_PROFESSION_NAMES.FIRSTAID,		-- 6
    private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION,		-- 7
    private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, 	-- 8
    private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, 	-- 9
    private.LOCALIZED_PROFESSION_NAMES.MINING,			-- 10
    private.LOCALIZED_PROFESSION_NAMES.TAILORING,		-- 11
}

-- Required for loading profession modules.
private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING = {
    [private.LOCALIZED_PROFESSION_NAMES.ALCHEMY] = "Alchemy",
    [private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING] = "Blacksmithing",
    [private.LOCALIZED_PROFESSION_NAMES.COOKING] = "Cooking",
    [private.LOCALIZED_PROFESSION_NAMES.ENCHANTING] = "Enchanting",
    [private.LOCALIZED_PROFESSION_NAMES.ENGINEERING] = "Engineering",
    [private.LOCALIZED_PROFESSION_NAMES.FIRSTAID] = "FirstAid",
    [private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION] = "Inscription",
    [private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING] = "Jewelcrafting",
    [private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING] = "Leatherworking",
    [private.LOCALIZED_PROFESSION_NAMES.MINING] = "Mining",
    [private.LOCALIZED_PROFESSION_NAMES.TAILORING] = "Tailoring",
}

local LOCALIZED_PROFESSION_NAME_TO_ID_MAPPING = {}
for index = 1, #private.ORDERED_LOCALIZED_PROFESSION_NAMES do
    LOCALIZED_PROFESSION_NAME_TO_ID_MAPPING[private.ORDERED_LOCALIZED_PROFESSION_NAMES[index]] = index
end

local ICON_TEXTURE_FORMAT = [[Interface\ICONS\%s]]
local WAYPOINT_ICON_TEXTURES = {
    [[Trade_Alchemy]],					-- 01 (Alchemy)
    [[Trade_BlackSmithing]],			-- 02 (Blacksmithing)
    [[INV_Misc_Food_15]],				-- 03 (Cooking)
    [[Trade_Engraving]],				-- 04 (Enchinting)
    [[Trade_Engineering]],				-- 05 (Engineering)
    [[Spell_Holy_SealOfSacrifice]],		-- 06 (First Aid)
    [[INV_Inscription_Tradeskill01]],	-- 07 (Inscription)
    [[INV_Misc_Gem_01]],				-- 08 (Jewelcrafting)
    [[Trade_LeatherWorking]],			-- 09 (Leatherworking)
    [[Spell_Fire_FlameBlades]],			-- 10 (Smelting)
    [[Trade_Tailoring]],				-- 11 (Tailoring)
}

-------------------------------------------------------------------------------
-- Objects.
-------------------------------------------------------------------------------
local Profession = {}
local ProfessionMetatable = {
    __index = Profession,
}

private.Professions = {}

-------------------------------------------------------------------------------
-- Profession Methods.
-------------------------------------------------------------------------------
function Profession:ID()
    return self._id
end

function Profession:LocalizedName()
    return self._localizedName
end

function Profession:Module()
    return self._module
end

function Profession:Name()
    return self._name
end

function Profession:WaypointIconTexture()
    return ICON_TEXTURE_FORMAT:format(WAYPOINT_ICON_TEXTURES[self._id])
end

-------------------------------------------------------------------------------
-- Instantiation.
-------------------------------------------------------------------------------
function private.CreateProfessionFromModule(module)
    local moduleName = module:GetName()
    for localizedProfessionName, professionModuleName in pairs(private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING) do
        if professionModuleName == moduleName then
            local profession = _G.setmetatable({
                _id = LOCALIZED_PROFESSION_NAME_TO_ID_MAPPING[localizedProfessionName],
                _localizedName = localizedProfessionName,
                _name = professionModuleName,
                _module = module,
                _recipeCount = 0,
                Recipes = module.Recipes,
            }, ProfessionMetatable)

            private.Professions[professionModuleName] = profession
            private.Professions[localizedProfessionName] = profession
            module.Profession = profession
            break;
        end
    end
end
