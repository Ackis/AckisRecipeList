-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------

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
--Alchemy
	[_G.GetSpellInfo(264213)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Outland Alchemy
	[_G.GetSpellInfo(264220)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Northrend Alchemy
	[_G.GetSpellInfo(264243)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Cataclsym Alchemy
	[_G.GetSpellInfo(264245)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Pandaria Alchemy
	[_G.GetSpellInfo(264247)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Draenor Alchemy
	[_G.GetSpellInfo(264250)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Legion Alchemy
	[_G.GetSpellInfo(264255)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Kul Tiran Alchemy
	[_G.GetSpellInfo(265787)] = private.LOCALIZED_PROFESSION_NAMES.ALCHEMY, -- Zandalari Alchemy
--Blacksmithing
	[_G.GetSpellInfo(264436)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Outland Blacksmithing
	[_G.GetSpellInfo(264438)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Northrend Blacksmithing
	[_G.GetSpellInfo(264440)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Cataclysm Blacksmithing
	[_G.GetSpellInfo(264442)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Pandaria Blacksmithing
	[_G.GetSpellInfo(264444)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Draenor Blacksmithing
	[_G.GetSpellInfo(264446)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Legion Blacksmithing
	[_G.GetSpellInfo(264448)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Kul Tiran Blacksmithing
	[_G.GetSpellInfo(265803)] = private.LOCALIZED_PROFESSION_NAMES.BLACKSMITHING, -- Zandalari Blacksmithing
--Cooking
	[_G.GetSpellInfo(124694)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Grill
	[_G.GetSpellInfo(125584)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Wok
	[_G.GetSpellInfo(125586)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Pot
	[_G.GetSpellInfo(125587)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Steamer
	[_G.GetSpellInfo(125588)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Oven
	[_G.GetSpellInfo(125589)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Way of the Brew
	[_G.GetSpellInfo(264634)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Outland Cooking
	[_G.GetSpellInfo(264636)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Northrend Cooking
	[_G.GetSpellInfo(264638)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Cataclysm Cooking
	[_G.GetSpellInfo(264640)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Pandaria Cooking
	[_G.GetSpellInfo(264642)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Draenor Cooking
	[_G.GetSpellInfo(264644)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Legion Cooking
	[_G.GetSpellInfo(264647)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Kul Tiran Cooking
	[_G.GetSpellInfo(265817)] = private.LOCALIZED_PROFESSION_NAMES.COOKING, -- Zandalari Cooking
--Enchanting
	[_G.GetSpellInfo(264460)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Outland Enchanting
	[_G.GetSpellInfo(264462)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Northrend Enchanting
	[_G.GetSpellInfo(264464)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Cataclysm Enchanting
	[_G.GetSpellInfo(264467)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Pandaria Enchanting
	[_G.GetSpellInfo(264469)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Draenor Enchanting
	[_G.GetSpellInfo(264471)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Legion Enchanting
	[_G.GetSpellInfo(264473)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Kul Tiran Enchanting
	[_G.GetSpellInfo(265805)] = private.LOCALIZED_PROFESSION_NAMES.ENCHANTING, -- Zandalari Enchanting
--Engineering
	[_G.GetSpellInfo(264479)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Outland Engineering
	[_G.GetSpellInfo(264481)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Northrend Engineering
	[_G.GetSpellInfo(264483)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Cataclysm Engineering
	[_G.GetSpellInfo(264485)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Pandaria Engineering
	[_G.GetSpellInfo(264487)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Draenor Engineering
	[_G.GetSpellInfo(264490)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Legion Engineering
	[_G.GetSpellInfo(264492)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Kul Tiran Engineering
	[_G.GetSpellInfo(265807)] = private.LOCALIZED_PROFESSION_NAMES.ENGINEERING, -- Zandalari Engineering
--Inscription
	[_G.GetSpellInfo(264496)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Outland Inscription
	[_G.GetSpellInfo(264498)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Northrend Inscription
	[_G.GetSpellInfo(264500)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Cataclysm Inscription
	[_G.GetSpellInfo(264502)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Pandaria Inscription
	[_G.GetSpellInfo(264504)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Draenor Inscription
	[_G.GetSpellInfo(264506)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Legion Inscription
	[_G.GetSpellInfo(264508)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Kul Tiran Inscription
	[_G.GetSpellInfo(265809)] = private.LOCALIZED_PROFESSION_NAMES.INSCRIPTION, -- Zandalari Inscription
-- Jewelcrafting
	[_G.GetSpellInfo(264534)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Outland Jewelcrafting
	[_G.GetSpellInfo(264537)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Northrend Jewelcrafting
	[_G.GetSpellInfo(264539)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Cataclysm Jewelcrafting
	[_G.GetSpellInfo(264542)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Pandaria Jewelcrafting
	[_G.GetSpellInfo(264544)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Draenor Jewelcrafting
	[_G.GetSpellInfo(264546)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Legion Jewelcrafting
	[_G.GetSpellInfo(264548)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Kul Tiran Jewelcrafting
	[_G.GetSpellInfo(265811)] = private.LOCALIZED_PROFESSION_NAMES.JEWELCRAFTING, -- Zandalari Jewelcrafting
-- Leatherworking
	[_G.GetSpellInfo(264579)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Outland Leatherworking
	[_G.GetSpellInfo(264581)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Northrend Leatherworking
	[_G.GetSpellInfo(264583)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Cataclysm Leatherworking
	[_G.GetSpellInfo(264585)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Pandaria Leatherworking
	[_G.GetSpellInfo(264588)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Draenor Leatherworking
	[_G.GetSpellInfo(264590)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Legion Leatherworking
	[_G.GetSpellInfo(264592)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Kul Tiran Leatherworking
	[_G.GetSpellInfo(265813)] = private.LOCALIZED_PROFESSION_NAMES.LEATHERWORKING, -- Zandalari Leatherworking
-- Tailoring
	[_G.GetSpellInfo(264618)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Outland Tailoring
	[_G.GetSpellInfo(264620)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Northrend Tailoring
	[_G.GetSpellInfo(264622)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Cataclysm Tailoring
	[_G.GetSpellInfo(264624)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Pandaria Tailoring
	[_G.GetSpellInfo(264626)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Draenor Tailoring
	[_G.GetSpellInfo(264628)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Legion Tailoring
	[_G.GetSpellInfo(264630)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Kul Tiran Tailoring
	[_G.GetSpellInfo(265815)] = private.LOCALIZED_PROFESSION_NAMES.TAILORING, -- Zandalari Tailoring
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
