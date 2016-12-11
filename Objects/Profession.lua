-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

-- ----------------------------------------------------------------------------
-- Profession data.
-- ----------------------------------------------------------------------------
local PROFESSION_SPELL_IDS = {
	ALCHEMY = 2259,
	ARCHAEOLOGY = 78670, -- Only used for AcquireType.TradeSkill
	BLACKSMITHING = 2018,
	COOKING = 2550,
	ENCHANTING = 7411,
	ENGINEERING = 4036,
	FIRSTAID = 3273,
	FISHING = 7731, -- Only used for AcquireType.TradeSkill
	INSCRIPTION = 45357,
	JEWELCRAFTING = 25229,
	LEATHERWORKING = 2108,
	MINING = 2575,
	TAILORING = 3908,
}

private.PROFESSION_SPELL_IDS = PROFESSION_SPELL_IDS
private.constants.PROFESSION_SPELL_IDS = PROFESSION_SPELL_IDS

local LOCALIZED_PROFESSION_NAMES = {}
private.LOCALIZED_PROFESSION_NAMES = LOCALIZED_PROFESSION_NAMES

local LOCALIZED_PROFESSION_NAME_TO_LABEL = {}
private.LOCALIZED_PROFESSION_NAME_TO_LABEL = LOCALIZED_PROFESSION_NAME_TO_LABEL

local PROFESSION_ID_TO_LOCALIZED_NAME = {}
private.PROFESSION_ID_TO_LOCALIZED_NAME = PROFESSION_ID_TO_LOCALIZED_NAME

for label, spellID in pairs(PROFESSION_SPELL_IDS) do
	local professionName = _G.GetSpellInfo(spellID)

	LOCALIZED_PROFESSION_NAME_TO_LABEL[professionName] = label
	LOCALIZED_PROFESSION_NAMES[label] = professionName
	PROFESSION_ID_TO_LOCALIZED_NAME[spellID] = professionName
end

-- This is needed due to Pandaren cooking spells.
local LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING = {
	[_G.GetSpellInfo(124694)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Grill
	[_G.GetSpellInfo(125584)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Wok
	[_G.GetSpellInfo(125586)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Pot
	[_G.GetSpellInfo(125587)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Steamer
	[_G.GetSpellInfo(125588)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Oven
	[_G.GetSpellInfo(125589)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Brew
}

private.LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING = LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING

for name, localized_name in pairs(LOCALIZED_PROFESSION_NAMES) do
	LOCALIZED_SPELL_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING[localized_name] = localized_name
end

local ORDERED_LOCALIZED_PROFESSION_NAMES = {
	LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- 1
	LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- 2
	LOCALIZED_PROFESSION_NAMES.COOKING, -- 3
	LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- 4
	LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- 5
	LOCALIZED_PROFESSION_NAMES.FIRSTAID, -- 6
	LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- 7
	LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- 8
	LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- 9
	LOCALIZED_PROFESSION_NAMES.MINING, -- 10
	LOCALIZED_PROFESSION_NAMES.TAILORING, -- 11
}

private.ORDERED_LOCALIZED_PROFESSION_NAMES = ORDERED_LOCALIZED_PROFESSION_NAMES

-- Required for loading profession modules.
local LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING = {
	[LOCALIZED_PROFESSION_NAMES.ALCHEMY] = "Alchemy",
	[LOCALIZED_PROFESSION_NAMES.BLACKSMITHING] = "Blacksmithing",
	[LOCALIZED_PROFESSION_NAMES.COOKING] = "Cooking",
	[LOCALIZED_PROFESSION_NAMES.ENCHANTING] = "Enchanting",
	[LOCALIZED_PROFESSION_NAMES.ENGINEERING] = "Engineering",
	[LOCALIZED_PROFESSION_NAMES.FIRSTAID] = "FirstAid",
	[LOCALIZED_PROFESSION_NAMES.INSCRIPTION] = "Inscription",
	[LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING] = "Jewelcrafting",
	[LOCALIZED_PROFESSION_NAMES.LEATHERWORKING] = "Leatherworking",
	[LOCALIZED_PROFESSION_NAMES.MINING] = "Mining",
	[LOCALIZED_PROFESSION_NAMES.TAILORING] = "Tailoring",
}

private.LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING = LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING

local LOCALIZED_PROFESSION_NAME_TO_ID_MAPPING = {}
for index = 1, #ORDERED_LOCALIZED_PROFESSION_NAMES do
	LOCALIZED_PROFESSION_NAME_TO_ID_MAPPING[ORDERED_LOCALIZED_PROFESSION_NAMES[index]] = index
end

local MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING = {}
for localizedName, moduleName in pairs(LOCALIZED_PROFESSION_NAME_TO_MODULE_NAME_MAPPING) do
	MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING[moduleName] = localizedName
	MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING[moduleName:lower()] = localizedName
end

private.MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING = MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING

local ICON_TEXTURE_FORMAT = [[Interface\ICONS\%s]]
local WAYPOINT_ICON_TEXTURES = {
	[[Trade_Alchemy]], -- 01 (Alchemy)
	[[Trade_BlackSmithing]], -- 02 (Blacksmithing)
	[[INV_Misc_Food_15]], -- 03 (Cooking)
	[[Trade_Engraving]], -- 04 (Enchanting)
	[[Trade_Engineering]], -- 05 (Engineering)
	[[Spell_Holy_SealOfSacrifice]], -- 06 (First Aid)
	[[INV_Inscription_Tradeskill01]], -- 07 (Inscription)
	[[INV_Misc_Gem_01]], -- 08 (Jewelcrafting)
	[[Trade_LeatherWorking]], -- 09 (Leatherworking)
	[[Spell_Fire_FlameBlades]], -- 10 (Smelting)
	[[Trade_Tailoring]], -- 11 (Tailoring)
}

-- ----------------------------------------------------------------------------
-- Objects.
-- ----------------------------------------------------------------------------
local Profession = {}
local ProfessionMetatable = {
	__index = Profession,
}

private.Professions = {}

-- ----------------------------------------------------------------------------
-- Profession Methods.
-- ----------------------------------------------------------------------------
function Profession:ActivationSpellName()
	return self._activationSpellName
end

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

-- ----------------------------------------------------------------------------
-- Instantiation.
-- ----------------------------------------------------------------------------
function addon.CreateProfessionFromModule(module)
	local moduleName = module:GetName()

	local localizedProfessionName = MODULE_NAME_TO_LOCALIZED_PROFESSION_NAME_MAPPING[moduleName]
	if localizedProfessionName then
		local profession = _G.setmetatable({
			_id = LOCALIZED_PROFESSION_NAME_TO_ID_MAPPING[localizedProfessionName],
			_localizedName = localizedProfessionName,
			_name = moduleName,
			_module = module,
			_recipeCount = 0,
			_activationSpellName = module.ActivationSpellID and _G.GetSpellInfo(module.ActivationSpellID) or localizedProfessionName,
			Recipes = module.Recipes,
		}, ProfessionMetatable)

		private.Professions[moduleName] = profession
		private.Professions[localizedProfessionName] = profession
		module.Profession = profession

		local defaults = {
			profile = {
				filters = {
					item = {} -- Populated below.
				}
			}
		}

		for filter_name in pairs(module.ITEM_FILTER_TYPES) do
			defaults.profile.filters.item[filter_name:lower()] = true
			addon.constants.ITEM_FILTER_TYPES[filter_name] = true
		end

		module.db = addon.db:RegisterNamespace(module.ModuleName, defaults)
	end
end
