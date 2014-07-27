-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

-- Functions
local ipairs = _G.ipairs
local pairs = _G.pairs
local select = _G.select
local tonumber, tostring = _G.tonumber, _G.tostring
local type = _G.type

-- Libraries
local bit = _G.bit
local table = _G.table

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local A = private.ACQUIRE_TYPE_IDS

private.recipe_list = {}
private.profession_recipe_list = {}
private.num_profession_recipes = {}

private.location_list	= {}

-----------------------------------------------------------------------
-- Local constants.
-----------------------------------------------------------------------
local Recipe = {}
local recipe_meta = {
	__index = Recipe
}

--- Adds a tradeskill recipe into the specified recipe database
-- @name AckisRecipeList:AddRecipe
-- @usage AckisRecipeList:AddRecipe(28927, 23109, V.TBC, Q.UNCOMMON)
-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe being added to the database
-- @param profession_spell_id The profession ID that uses the recipe.  See [[API/database-documentation]] for a listing of profession IDs
-- @param genesis Game version that the recipe was first introduced in, for example, Original, BC, WoTLK, or Cata
-- @param quality The quality/rarity of the recipe
-- @return Resultant recipe table.
function addon:AddRecipe(spell_id, profession_spell_id, genesis, quality)
	local recipe_list = private.recipe_list

	if recipe_list[spell_id] then
		self:Debug("Duplicate recipe: %d - %s (%s)", spell_id, recipe_list[spell_id].name, recipe_list[spell_id].profession)
		return
	end

	local recipe = _G.setmetatable({
		acquire_data = {},
		flags = {},
		genesis = private.GAME_VERSION_NAMES[genesis],
		name = _G.GetSpellInfo(spell_id),
		profession = _G.GetSpellInfo(profession_spell_id),
		quality = quality,
		_spell_id = spell_id,
	}, recipe_meta)

	if not recipe.name or recipe.name == "" then
		recipe.name = ("%s: %d"):format(_G.UNKNOWN, tonumber(spell_id))
		self:Debug(L["SpellIDCache"]:format(spell_id))
	end
	recipe_list[spell_id] = recipe

	if not private.profession_recipe_list[recipe.profession] then
		private.profession_recipe_list[recipe.profession] = {}
	end
	private.profession_recipe_list[recipe.profession][spell_id] = recipe
	private.num_profession_recipes[recipe.profession] = (private.num_profession_recipes[recipe.profession] or 0) + 1

	return recipe
end

-------------------------------------------------------------------------------
-- Recipe methods.
-------------------------------------------------------------------------------
function Recipe:SpellID()
	return self._spell_id
end

function Recipe:HasCoordinates()
	for acquire_type_id in pairs(self.acquire_data) do
		if private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:HasCoordinates() then
			return true
		end
	end
end

function Recipe:SetRecipeItem(item_id, binding_type)
	local item_name, item_link, item_quality = _G.GetItemInfo(item_id) -- Do this now to get the item into the cache.
	self.recipe_item_id = item_id
	self.recipe_item_binding = binding_type
end

function Recipe:RecipeItem()
	return self.recipe_item_id, self.recipe_item_binding
end

function Recipe:SetCraftedItem(item_id, binding_type)
	local item_name, item_link, item_quality = _G.GetItemInfo(item_id) -- Do this now to get the item into the cache.
	self.crafted_item_id = item_id
	self.crafted_item_binding = binding_type
end

function Recipe:CraftedItem()
	return self.crafted_item_id, self.crafted_item_binding
end

function Recipe:SetSkillLevels(skill_level, optimal_level, medium_level, easy_level, trivial_level)
	self.skill_level = skill_level
	self.optimal_level = optimal_level or skill_level
	self.medium_level = medium_level or skill_level + 10
	self.easy_level = easy_level or skill_level + 15
	self.trivial_level = trivial_level or skill_level + 20
end

function Recipe:SkillLevels()
	return self.skill_level, self.optimal_level, self.medium_level, self.easy_level, self.trivial_level
end

function Recipe:SetSpecialty(spell_id)
	self.specialty = spell_id
end

function Recipe:Specialty()
	return self.specialty
end

-- Used to set the faction for recipes which only can be learned by one faction (e.g. BoP recipes, etc.)
-- These recipes will never be able to be learned so we do not want to load them.
function Recipe:SetRequiredFaction(faction_name)
	self.required_faction = faction_name

	if faction_name and private.Player.faction ~= faction_name then
		self.is_ignored = true
		private.num_profession_recipes[self.profession] = private.num_profession_recipes[self.profession] - 1
	end
end

function Recipe:RequiredFaction()
	return self.required_faction
end

-- Sets the spell ID for the recipe this recipe replaces
function Recipe:SetPreviousRankID(spell_id)
	self.old_rank_spell_id = spell_id
end

function Recipe:PreviousRankID()
	return self.old_rank_spell_id
end

function Recipe:SetAsKnownOrLinked(is_linked)
	if is_linked then
		self:AddState("LINKED")
	else
		self:AddState("KNOWN")
		self:RemoveState("LINKED")
	end
end

-------------------------------------------------------------------------------
-- Recipe state flags.
-------------------------------------------------------------------------------
do
	local RECIPE_STATE_FLAGS = {
	KNOWN = 0x00000001,
	RELEVANT = 0x00000002,
	VISIBLE = 0x00000004,
	LINKED = 0x00000008,
	}

	function Recipe:HasState(state_name)
		return self.state and (bit.band(self.state, RECIPE_STATE_FLAGS[state_name]) == RECIPE_STATE_FLAGS[state_name]) or false
	end

	function Recipe:AddState(state_name)
		if not self.state then
			self.state = 0
		end

		if bit.band(self.state, RECIPE_STATE_FLAGS[state_name]) == RECIPE_STATE_FLAGS[state_name] then
			return
		end
		self.state = bit.bxor(self.state, RECIPE_STATE_FLAGS[state_name])
	end

	function Recipe:RemoveState(state_name)
		if not self.state then
			return
		end

		if bit.band(self.state, RECIPE_STATE_FLAGS[state_name]) ~= RECIPE_STATE_FLAGS[state_name] then
			return
		end
		self.state = bit.bxor(self.state, RECIPE_STATE_FLAGS[state_name])

		if self.state == 0 then
			self.state = nil
		end
	end
end -- do-block

do
	local BITFIELD_MAP = {
		common1 = private.COMMON_FLAGS_WORD1,
		class1 = private.CLASS_FLAGS_WORD1,
		reputation1 = private.REP_FLAGS_WORD1,
		reputation2 = private.REP_FLAGS_WORD2,
		item1 = private.ITEM_FLAGS_WORD1,
	}

	function Recipe:HasFilter(field_name, flag_name)
		local bitfield = self.flags[field_name]
		local bitset = BITFIELD_MAP[field_name]
		local value = bitset[flag_name]

		return bitfield and (bit.band(bitfield, value) == value) or false
	end
end -- do-block

do
	local SKILL_LEVEL_FORMAT = "[%d]"

	function Recipe:GetDisplayName()
		local _, _, _, quality_color = _G.GetItemQualityColor(self.quality)
		local recipe_name = self.name

		if private.ORDERED_PROFESSIONS[addon.Frame.current_profession] == private.LOCALIZED_PROFESSION_NAMES.ENCHANTING then
			recipe_name = recipe_name:gsub(_G.ENSCRIBE .. " ", "")
		end
		local has_faction = private.Player:HasProperRepLevel(self.acquire_data[A.REPUTATION])
		local skill_level = private.current_profession_scanlevel
		local recipe_level = self.skill_level

		local diff_color

		if has_faction then
			if recipe_level > skill_level then
				diff_color = "impossible"
			elseif skill_level >= self.trivial_level then
				diff_color = "trivial"
			elseif skill_level >= self.easy_level then
				diff_color = "easy"
			elseif skill_level >= self.medium_level then
				diff_color = "medium"
			elseif skill_level >= self.optimal_level then
				diff_color = "optimal"
			else
				diff_color = "trivial"
			end
		else
			diff_color = "impossible"
		end
		local display_name = ("|c%s%s|r"):format(quality_color, recipe_name)
		local level_text = private.SetTextColor(private.DIFFICULTY_COLORS[diff_color].hex, SKILL_LEVEL_FORMAT):format(recipe_level)

		if addon.db.profile.skill_view then
			display_name = ("%s - %s"):format(level_text, display_name)
		else
			display_name = ("%s - %s"):format(display_name, level_text)
		end

		if addon.db.profile.exclusionlist[self:SpellID()] then
			display_name = ("** %s **"):format(display_name)
		end
		return display_name
	end
end -- do-block

function Recipe:SetItemFilterType(filter_type)
	if not addon.constants.ITEM_FILTER_TYPES[filter_type:upper()] then
		addon:Debug("Attempting to set invalid item filter type '%s' for '%s' (%d)", filter_type, self.name, self:SpellID())
		return
	end
	self.item_filter_type = filter_type:lower()
end

function Recipe:ItemFilterType()
	return self.item_filter_type
end

local function SetFilterState(recipe, turn_on, ...)
	local num_filters = select('#', ...)

	for index = 1, num_filters, 1 do
		local filter = select(index, ...)

		if filter then
			local filter_name = private.FILTER_STRINGS[filter]
			local bitfield
			local member_name

			for table_index, bits in ipairs(private.FLAG_WORDS) do
				if bits[filter_name] then
					bitfield = bits
					member_name = private.FLAG_MEMBERS[table_index]
				end
			end

			if not bitfield or not member_name then
				return
			end

			if not recipe.flags[member_name] then
				recipe.flags[member_name] = 0
			end

			if turn_on then
				if bit.band(recipe.flags[member_name], bitfield[filter_name]) == bitfield[filter_name] then
					if recipe.flags[member_name] == 0 then
						recipe.flags[member_name] = nil
					end
					return
				end
			else
				if bit.band(recipe.flags[member_name], bitfield[filter_name]) ~= bitfield[filter_name] then
					if recipe.flags[member_name] == 0 then
						recipe.flags[member_name] = nil
					end
					return
				end
			end
			recipe.flags[member_name] = bit.bxor(recipe.flags[member_name], bitfield[filter_name])

			if recipe.flags[member_name] == 0 then
				recipe.flags[member_name] = nil
			end
		else
			addon:Debug("Recipe '%s' (spell ID %d): Attempting to %s non-existent filter flag.", recipe.name, recipe:SpellID(), turn_on and "assign" or "remove")
		end
	end
end

function Recipe:AddFilters(...)
	SetFilterState(self, true, ...)
end

function Recipe:RemoveFilters(...)
	SetFilterState(self, false, ...)
end

function Recipe:AddAcquireData(acquire_type_id, type_string, has_entity_list, ...)
	local location_list = private.location_list
	local recipe_acquire_data = self.acquire_data[acquire_type_id]

	if not recipe_acquire_data then
		self.acquire_data[acquire_type_id] = {}
		recipe_acquire_data = self.acquire_data[acquire_type_id]
	end

	local acquire_type = private.ACQUIRE_TYPES_BY_ID[acquire_type_id]
	acquire_type:AssignRecipe(self:SpellID())

	local limited_vendor = type_string == "Limited Vendor"
	local num_vars = select('#', ...)
	local cur_var = 1

	while cur_var <= num_vars do
		-- A quantity of true means unlimited - normal vendor item.
		local quantity = true
		local location_name, affiliation
		local identifier = select(cur_var, ...)
		cur_var = cur_var + 1

		if limited_vendor then
			quantity = select(cur_var, ...)
			cur_var = cur_var + 1
		end
		recipe_acquire_data[identifier] = true

		if has_entity_list then
			local entity = acquire_type:GetEntity(identifier)

			if entity then
				affiliation = entity.faction
				location_name = entity.location

				entity.item_list = entity.item_list or {}
				entity.item_list[self:SpellID()] = quantity
			else
				addon:Debug("Spell ID %d: %s ID %s does not exist in the %s AcquireType's Entity table.", self:SpellID(), type_string, identifier, acquire_type:Label())
			end
		else
			local string_id = type(identifier) == "string"

			location_name = string_id and identifier or nil

			if location_name then
				affiliation = "world_drop"
			elseif string_id then
				addon:Debug("%s with no location: %d %s", type_string, self:SpellID(), self.name)
			end
		end

		if affiliation then
			acquire_type:AssignRecipe(self:SpellID(), affiliation)
		end

		if location_name then
			location_list[location_name] = location_list[location_name] or {}
			location_list[location_name].recipes = location_list[location_name].recipes or {}

			location_list[location_name].name = location_name
			location_list[location_name].recipes[self:SpellID()] = affiliation or true
		end
	end
end

function Recipe:AddMobDrop(...)
	self:AddAcquireData(A.MOB_DROP, "Mob", true, ...)
	self:AddFilters(private.FILTER_IDS.MOB_DROP)
end

function Recipe:AddTrainer(...)
	self:AddAcquireData(A.TRAINER, "Trainer", true, ...)
	self:AddFilters(private.FILTER_IDS.TRAINER)
end

function Recipe:AddVendor(...)
	self:AddAcquireData(A.VENDOR, "Vendor", true, ...)
	self:AddFilters(private.FILTER_IDS.VENDOR)
end

function Recipe:AddLimitedVendor(...)
	self:AddAcquireData(A.VENDOR, "Limited Vendor", true, ...)
	self:AddFilters(private.FILTER_IDS.VENDOR)
end

function Recipe:AddWorldDrop(...)
	self:AddAcquireData(A.WORLD_DROP, "World Drop", false, ...)
	self:AddFilters(private.FILTER_IDS.WORLD_DROP)
end

function Recipe:AddQuest(...)
	self:AddAcquireData(A.QUEST, "Quest", true, ...)
	self:AddFilters(private.FILTER_IDS.QUEST)
end

function Recipe:AddAchievement(...)
	self:AddAcquireData(A.ACHIEVEMENT, "Achievement", false, ...)
	self:AddFilters(private.FILTER_IDS.ACHIEVEMENT)
end

function Recipe:AddCustom(...)
	self:AddAcquireData(A.CUSTOM, "Custom", true, ...)
end

function Recipe:AddDiscovery(...)
	self:AddAcquireData(A.DISCOVERY, "Discovery", true, ...)
	self:AddFilters(private.FILTER_IDS.DISC)
end

function Recipe:AddWorldEvent(...)
	self:AddAcquireData(A.WORLD_EVENTS, "World Events", true, ...)
	self:AddFilters(private.FILTER_IDS.WORLD_EVENTS)
end

function Recipe:AddRepVendor(reputation_id, rep_level, ...)
	local location_list = private.location_list
	local acquire_data = self.acquire_data[A.REPUTATION]

	if not acquire_data then
		self.acquire_data[A.REPUTATION] = {}
		acquire_data = self.acquire_data[A.REPUTATION]
	end
	local faction = acquire_data[reputation_id]

	if not faction then
		acquire_data[reputation_id] = {}
		faction = acquire_data[reputation_id]
		faction[rep_level] = {}
	end
	local reputation_acquire_type = private.AcquireTypes.Reputation
	local vendor_acquire_type = private.AcquireTypes.Vendor

	local num_vars = select('#', ...)
	local cur_var = 1

	while cur_var <= num_vars do
		local location_name, affiliation
		local vendor_id = select(cur_var, ...)
		cur_var = cur_var + 1

		local reputation = reputation_acquire_type:GetEntity(reputation_id)

		if reputation then
			if vendor_id then
				local rep_vendor = vendor_acquire_type:GetEntity(vendor_id)

				if rep_vendor then
					faction[rep_level][vendor_id] = true

					affiliation = rep_vendor.faction
					location_name = rep_vendor.location

					rep_vendor.reputation_id = reputation_id
					rep_vendor.item_list = rep_vendor.item_list or {}
					rep_vendor.item_list[self:SpellID()] = true

					reputation.item_list = reputation.item_list or {}
					reputation.item_list[self:SpellID()] = true
				else
					addon:Debug("Spell ID %d (%s): Reputation Vendor ID %s does not exist in the %s AcquireType Entity table.",
						self:SpellID(),
						tostring(self.name),
						tostring(vendor_id),
						vendor_acquire_type:Label()
					)
				end
			else
				addon:Debug("Spell ID %d (%s): Nil Reputation Vendor ID passed.", self:SpellID(), tostring(self.name))
			end
		else
			addon:Debug("Spell ID %d: Faction ID %d does not exist in the %s AcquireType Entity table.", self:SpellID(), reputation_id, reputation_acquire_type:Label())
		end
		private.AcquireTypes.Reputation:AssignRecipe(self:SpellID(), affiliation)

		if location_name then
			location_list[location_name] = location_list[location_name] or {}
			location_list[location_name].recipes = location_list[location_name].recipes or {}

			location_list[location_name].name = location_name
			location_list[location_name].recipes[self:SpellID()] = affiliation or true
		end
	end
	self:AddFilters(private.FILTER_IDS.REPUTATION)
end

function Recipe:Retire()
	self:AddAcquireData(A.RETIRED, "Retired")
	self:AddFilters(private.FILTER_IDS.RETIRED)
end

do
	local SOFT_FILTERS
	local filter_db
	local player_filters
	local obtain_filters
	local general_filters

	local function InitializeFilters()
		filter_db = addon.db.profile.filters
		player_filters = filter_db.player
		obtain_filters = filter_db.obtain
		general_filters = filter_db.general

		-- HARD_FILTERS and SOFT_FILTERS are used to determine if a recipe should be shown based on the value of the key compared to the value
		-- of its saved_var.
		local COMMON1 = private.COMMON_FLAGS_WORD1
		private.HARD_FILTERS = {
			------------------------------------------------------------------------------------------------
			-- Player Type flags.
			------------------------------------------------------------------------------------------------
			melee	= { flag = COMMON1.DPS,		field = "common1",	sv_root = player_filters },
			tank	= { flag = COMMON1.TANK,	field = "common1",	sv_root = player_filters },
			healer	= { flag = COMMON1.HEALER,	field = "common1",	sv_root = player_filters },
			caster	= { flag = COMMON1.CASTER,	field = "common1",	sv_root = player_filters },
		}

		SOFT_FILTERS = {
			achievement	= { flag = COMMON1.ACHIEVEMENT,		field = "common1",	sv_root = obtain_filters },
			discovery	= { flag = COMMON1.DISC,		field = "common1",	sv_root = obtain_filters },
			instance	= { flag = COMMON1.INSTANCE,		field = "common1",	sv_root = obtain_filters },
			mobdrop		= { flag = COMMON1.MOB_DROP,		field = "common1",	sv_root = obtain_filters },
			pvp		= { flag = COMMON1.PVP,			field = "common1",	sv_root = obtain_filters },
			quest		= { flag = COMMON1.QUEST,		field = "common1",	sv_root = obtain_filters },
			raid		= { flag = COMMON1.RAID,		field = "common1",	sv_root = obtain_filters },
			retired		= { flag = COMMON1.RETIRED,		field = "common1",	sv_root = obtain_filters },
			reputation	= { flag = COMMON1.REPUTATION,		field = "common1",	sv_root = obtain_filters },
			seasonal	= { flag = COMMON1.WORLD_EVENTS,	field = "common1",	sv_root = obtain_filters },
			trainer		= { flag = COMMON1.TRAINER,		field = "common1",	sv_root = obtain_filters },
			vendor		= { flag = COMMON1.VENDOR,		field = "common1",	sv_root = obtain_filters },
			worlddrop	= { flag = COMMON1.WORLD_DROP,		field = "common1",	sv_root = obtain_filters },
			misc1		= { flag = COMMON1.MISC1,		field = "common1",	sv_root = obtain_filters },
		}

		InitializeFilters = nil
	end

	local Q = private.ITEM_QUALITIES
	local QUALITY_FILTERS = {
		[Q.COMMON] = "common",
		[Q.UNCOMMON] = "uncommon",
		[Q.RARE] = "rare",
		[Q.EPIC] = "epic",
	}

	local REP1 = private.REP_FLAGS_WORD1
	local REP_FILTERS = {
		[REP1.ARGENTDAWN]		= "argentdawn",
		[REP1.CENARION_CIRCLE]		= "cenarioncircle",
		[REP1.THORIUM_BROTHERHOOD]	= "thoriumbrotherhood",
		[REP1.TIMBERMAW_HOLD]		= "timbermaw",
		[REP1.ZANDALAR]			= "zandalar",
		[REP1.ALDOR]			= "aldor",
		[REP1.ASHTONGUE]		= "ashtonguedeathsworn",
		[REP1.CENARION_EXPEDITION]	= "cenarionexpedition",
		[REP1.HELLFIRE]			= "hellfire",
		[REP1.CONSORTIUM]		= "consortium",
		[REP1.KOT]			= "keepersoftime",
		[REP1.LOWERCITY]		= "lowercity",
		[REP1.NAGRAND]			= "nagrand",
		[REP1.SCALE_SANDS]		= "scaleofthesands",
		[REP1.SCRYER]			= "scryer",
		[REP1.SHATAR]			= "shatar",
		[REP1.SHATTEREDSUN]		= "shatteredsun",
		[REP1.SPOREGGAR]		= "sporeggar",
		[REP1.VIOLETEYE]		= "violeteye",
		[REP1.ARGENTCRUSADE]		= "argentcrusade",
		[REP1.FRENZYHEART]		= "frenzyheart",
		[REP1.EBONBLADE]		= "ebonblade",
		[REP1.KIRINTOR]			= "kirintor",
		[REP1.HODIR]			= "sonsofhodir",
		[REP1.KALUAK]			= "kaluak",
		[REP1.ORACLES]			= "oracles",
		[REP1.WYRMREST]			= "wyrmrest",
		[REP1.WRATHCOMMON1]		= "wrathcommon1",
		[REP1.WRATHCOMMON2]		= "wrathcommon2",
		[REP1.WRATHCOMMON3]		= "wrathcommon3",
		[REP1.WRATHCOMMON4]		= "wrathcommon4",
		[REP1.WRATHCOMMON5]		= "wrathcommon5",
	}

	local REP2 = private.REP_FLAGS_WORD2
	local REP_FILTERS_2 = {
		[REP2.ASHEN_VERDICT]		= "ashenverdict",
		[REP2.CATACOMMON1]		= "catacommon1",
		[REP2.CATACOMMON2]		= "catacommon2",
		[REP2.GUARDIANS]		= "guardiansofhyjal",
		[REP2.RAMKAHEN]			= "ramkahen",
		[REP2.EARTHEN_RING]		= "earthenring",
		[REP2.THERAZANE]		= "therazane",
		[REP2.FORESTHOZEN]		= "foresthozen",
		[REP2.GOLDENLOTUS]		= "goldenlotus",
		[REP2.CLOUDSERPENT]		= "cloudserpent",
		[REP2.PEARLFINJINYU]		= "pearlfinjinyu",
		[REP2.SHADOPAN]			= "shadopan",
		[REP2.ANGLERS]			= "anglers",
		[REP2.AUGUSTCELESTIALS]		= "augustcelestials",
		[REP2.BREWMASTERS]		= "brewmasters",
		[REP2.KLAXXI]			= "klaxxi",
		[REP2.LOREWALKERS]		= "lorewalkers",
		[REP2.TILLERS]			= "tillers",
		[REP2.BLACKPRINCE]		= "blackprince",
		[REP2.SHANGXIACADEMY]		= "shangxiacademy",
		[REP2.PANDACOMMON1]		= "pandacommon1",
	}

	local CLASS1 = private.CLASS_FLAGS_WORD1
	local CLASS_FILTERS = {
		[CLASS1.DK]		= "deathknight",
		[CLASS1.DRUID]		= "druid",
		[CLASS1.HUNTER]		= "hunter",
		[CLASS1.MAGE]		= "mage",
		[CLASS1.PALADIN]	= "paladin",
		[CLASS1.PRIEST]		= "priest",
		[CLASS1.SHAMAN]		= "shaman",
		[CLASS1.ROGUE]		= "rogue",
		[CLASS1.WARLOCK]	= "warlock",
		[CLASS1.WARRIOR]	= "warrior",
		[CLASS1.MONK]		= "monk",
	}

	-- Returns true if any of the filter flags are turned on.
	local function HasEnabledFlag(filters, bitfield, name_field)
		if not bitfield then
			return true
		end

		for flag, name in pairs(filters) do
			if bit.band(bitfield, flag) == flag then
				if name_field[name] then
					return true
				end
			end
		end
		return false
	end

	--- Scans a specific recipe to determine if it is to be displayed or not.
	function Recipe:CanDisplay()
		if InitializeFilters then
			InitializeFilters()
		end

		if addon.db.profile.exclusionlist[self:SpellID()] and not addon.db.profile.ignoreexclusionlist then
			return false
		end
		local general_filters = filter_db.general

		-------------------------------------------------------------------------------
		-- Stage 1 - Loop through exclusive flags (hard filters).
		-- If one of these does not pass, the recipe is not displayed.
		-------------------------------------------------------------------------------

		-- Display both horde and alliance factions?
		if not general_filters.faction and not private.Player:HasRecipeFaction(self) then
			return false
		end

		-- Display all skill levels?
		if not general_filters.skill and self.skill_level > private.current_profession_scanlevel then
			return false
		end

		-- Display all specialities?
		if not general_filters.specialty then
			local specialty = self.specialty

			if specialty and specialty ~= private.current_profession_specialty then
				return false
			end
		end

		-- Expansion filters.
		if not obtain_filters[private.EXPANSION_FILTERS[private.GAME_VERSIONS[self.genesis]]] then
			return false
		end

		-- Quality filters.
		if not filter_db.quality[QUALITY_FILTERS[self.quality]] then
			return false
		end
		local item_filter_type = self:ItemFilterType()
		local profession_module = addon:GetModule(private.PROFESSION_MODULE_NAMES[private.ORDERED_PROFESSIONS[addon.Frame.current_profession]])

		if item_filter_type and (not profession_module or not profession_module.db.profile.filters.item[item_filter_type]) then
			return false
		end

		------------------------------------------------------------------------------------------------
		-- Binding types.
		------------------------------------------------------------------------------------------------
		local _, recipe_item_binding = self:RecipeItem()

		-- Assume that recipes without a recipe item are obtained via trainers, and treat them as bind on pickup.
		if recipe_item_binding and not addon.db.profile.filters.binding["recipe_" .. recipe_item_binding:lower()] then
			return false
		elseif not recipe_item_binding and not addon.db.profile.filters.binding.recipe_bind_on_pickup then
			return false
		end

		local _, crafted_item_binding = self:CraftedItem()

		if crafted_item_binding and not addon.db.profile.filters.binding["item_" .. crafted_item_binding:lower()] then
			return false
		end

		-------------------------------------------------------------------------------
		-- Check the hard filter flags.
		-------------------------------------------------------------------------------
		for filter, data in pairs(private.HARD_FILTERS) do
			local bitfield = self.flags[data.field]

			if bitfield and bit.band(bitfield, data.flag) == data.flag and not data.sv_root[filter] then
				return false
			end
		end

		-------------------------------------------------------------------------------
		-- Check the reputation filter flags.
		------------------------------------------------------------------------------
		if not HasEnabledFlag(REP_FILTERS, self.flags.reputation1, filter_db.rep) then
			return false
		end

		if not HasEnabledFlag(REP_FILTERS_2, self.flags.reputation2, filter_db.rep) then
			return false
		end

		-------------------------------------------------------------------------------
		-- Check the class filter flags
		-------------------------------------------------------------------------------
		if not HasEnabledFlag(CLASS_FILTERS, self.flags.class1, filter_db.classes) then
			return false
		end

		------------------------------------------------------------------------------------------------
		-- Stage 2
		-- loop through nonexclusive (soft filters) flags until one is true
		-- If one of these is true (ie: we want to see trainers and there is a trainer flag) we display the recipe
		------------------------------------------------------------------------------------------------
		for filter, data in pairs(SOFT_FILTERS) do
			local bitfield = self.flags[data.field]

			if bitfield and bit.band(bitfield, data.flag) == data.flag and data.sv_root[filter] then
				return true
			end
		end
	end
end --do-block

local DUMP_FUNCTION_FORMATS = {
	[A.ACHIEVEMENT] = "recipe:AddAchievement(%s)",
	[A.CUSTOM] = "recipe:AddCustom(%s)",
	[A.DISCOVERY] = "recipe:AddDiscovery(%s)",
	[A.WORLD_EVENTS] = "recipe:AddWorldEvent(%s)",
	[A.TRAINER] = "recipe:AddTrainer(%s)",
	[A.MOB_DROP] = "recipe:AddMobDrop(%s)",
	[A.WORLD_DROP] = "recipe:AddWorldDrop(%s)",
	[A.QUEST] = "recipe:AddQuest(%s)",
	[A.RETIRED] = "recipe:Retire()",
}

local sorted_data = {}
local reverse_map = {}

-- These are automatically added when assigning the appropriate acquire type; dumping them is redundant.
local IMPLICIT_FLAGS = {
	ACHIEVEMENT = true,
	DISC = true,
	MOB_DROP = true,
	QUEST = true,
	REPUTATION = true,
	RETIRED = true,
	WORLD_EVENTS = true,
	TRAINER = true,
	VENDOR = true,
	WORLD_DROP = true,
}

function Recipe:Dump(output, use_genesis)
	local genesis_val = (use_genesis and tonumber(private.GAME_VERSIONS[self.genesis]) or nil)

	if genesis_val and output:Lines(genesis_val) == 0 then
		output:AddLine("-------------------------------------------------------------------------------", genesis_val)
		output:AddLine(("-- %s."):format(_G["EXPANSION_NAME" .. genesis_val - 1]), genesis_val)
		output:AddLine("-------------------------------------------------------------------------------", genesis_val)
	end

	output:AddLine(("-- %s -- %d"):format(self.name, self:SpellID()), genesis_val)
	output:AddLine(("recipe = AddRecipe(%d, V.%s, Q.%s)"):format(self:SpellID(), self.genesis, private.ITEM_QUALITY_NAMES[self.quality]), genesis_val)
	output:AddLine(("recipe:SetSkillLevels(%d, %d, %d, %d, %d)"):format(self.skill_level, self.optimal_level, self.medium_level, self.easy_level, self.trivial_level), genesis_val)

	if self.recipe_item_id then
		output:AddLine(("recipe:SetRecipeItem(%d, \"%s\")"):format(self.recipe_item_id, self.recipe_item_binding), genesis_val)
	end

	if self.crafted_item_id then
		output:AddLine(("recipe:SetCraftedItem(%d, \"%s\")"):format(self.crafted_item_id, self.crafted_item_binding), genesis_val)
	end
	local previous_rank_recipe = private.profession_recipe_list[self.profession][self:PreviousRankID()]

	if previous_rank_recipe then
		output:AddLine(("recipe:SetPreviousRankID(%d)"):format(previous_rank_recipe:SpellID()), genesis_val)
	end

	if self.specialty then
		output:AddLine(("recipe:SetSpecialty(%d)"):format(self.specialty), genesis_val)
	end

	if self.required_faction then
		output:AddLine(("recipe:SetRequiredFaction(\"%s\")"):format(self.required_faction), genesis_val)
	end

	if self.item_filter_type then
		output:AddLine(("recipe:SetItemFilterType(\"%s\")"):format(self.item_filter_type:upper()), genesis_val)
	end
	local flag_string

	for table_index, bits in ipairs(private.FLAG_WORDS) do
		table.wipe(sorted_data)
		table.wipe(reverse_map)

		for flag_name, flag in pairs(bits) do
			if not IMPLICIT_FLAGS[flag_name] then
				local bitfield = self.flags[private.FLAG_MEMBERS[table_index]]

				if bitfield and bit.band(bitfield, flag) == flag then
					table.insert(sorted_data, flag)
					reverse_map[flag] = flag_name
				end
			end
		end
		table.sort(sorted_data)

		for index, flag in ipairs(sorted_data) do
			local bitfield = self.flags[private.FLAG_MEMBERS[table_index]]

			if bitfield and bit.band(bitfield, flag) == flag then
				if flag_string then
					flag_string = ("%s, F.%s"):format(flag_string, private.FILTER_STRINGS[private.FILTER_IDS[reverse_map[flag]]])
				else
					flag_string = ("F.%s"):format(private.FILTER_STRINGS[private.FILTER_IDS[reverse_map[flag]]])
				end
			end
		end
	end

	if flag_string then
		output:AddLine(("recipe:AddFilters(%s)"):format(flag_string), genesis_val)
	end
	local ZL = private.ZONE_LABELS_FROM_NAME

	flag_string = nil

	for acquire_type_id, acquire_info in pairs(self.acquire_data) do
		if acquire_type_id == A.REPUTATION then
			for rep_id, rep_info in pairs(acquire_info) do
				local faction_string = private.FACTION_STRINGS[rep_id]

				if faction_string then
					faction_string = ("FAC.%s"):format(faction_string)
				else
					faction_string = rep_id
					addon:Printf("Recipe %d (%s) - no string for faction %d", self:SpellID(), self.name, rep_id)
				end

				for rep_level, level_info in pairs(rep_info) do
					local rep_string = ("REP.%s"):format(private.REP_LEVEL_STRINGS[rep_level or 1])
					local values

					table.wipe(sorted_data)
					table.wipe(reverse_map)

					for id_num in pairs(level_info) do
						table.insert(sorted_data, id_num)
					end
					table.sort(sorted_data)

					for index, vendor_id in ipairs(sorted_data) do
						if values then
							values = ("%s, %d"):format(values, vendor_id)
						else
							values = vendor_id
						end
					end
					output:AddLine(("recipe:AddRepVendor(%s, %s, %s)"):format(faction_string, rep_string, values), genesis_val)
				end
			end
		elseif acquire_type_id == A.VENDOR then
			local values
			local limited_values

			table.wipe(sorted_data)
			table.wipe(reverse_map)

			for id_num in pairs(acquire_info) do
				table.insert(sorted_data, id_num)
			end
			table.sort(sorted_data)

			for index, identifier in ipairs(sorted_data) do
				local saved_id

				if type(identifier) == "string" then
					saved_id = ("\"%s\""):format(identifier)
				else
					saved_id = identifier
				end
				local vendor = private.AcquireTypes.Vendor:GetEntity(identifier)
				local quantity = vendor.item_list[self:SpellID()]

				if type(quantity) == "number" then
					if limited_values then
						limited_values = ("%s, %s, %d"):format(limited_values, saved_id, quantity)
					else
						limited_values = ("%s, %d"):format(saved_id, quantity)
					end
				else
					if values then
						values = ("%s, %s"):format(values, saved_id)
					else
						values = saved_id
					end
				end
			end

			if values then
				output:AddLine(("recipe:AddVendor(%s)"):format(values), genesis_val)
			end

			if limited_values then
				output:AddLine(("recipe:AddLimitedVendor(%s)"):format(limited_values), genesis_val)
			end
		elseif DUMP_FUNCTION_FORMATS[acquire_type_id] then
			local values

			table.wipe(sorted_data)
			table.wipe(reverse_map)

			for id_num in pairs(acquire_info) do
				table.insert(sorted_data, id_num)
			end
			table.sort(sorted_data)

			for index, identifier in ipairs(sorted_data) do
				local saved_id

				if type(identifier) == "string" then
					if acquire_type_id == A.WORLD_DROP then
						saved_id = ("Z.%s"):format(ZL[identifier])
					else
						saved_id = ("\"%s\""):format(identifier)
					end
				else
					saved_id = identifier
				end

				if values then
					values = ("%s, %s"):format(values, saved_id)
				else
					values = saved_id
				end
			end
			output:AddLine((DUMP_FUNCTION_FORMATS[acquire_type_id]):format(values), genesis_val)
		else
			for identifier in pairs(acquire_info) do
				local saved_id

				if type(identifier) == "string" then
					saved_id = ("\"%s\""):format(identifier)
				else
					saved_id = identifier
				end

				if flag_string then
					flag_string = ("%s, A.%s, %s"):format(flag_string, private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:Label(), saved_id)
				else
					flag_string = ("A.%s, %s"):format(private.ACQUIRE_TYPES_BY_ID[acquire_type_id]:Label(), saved_id)
				end
			end
		end
	end

	if flag_string then
		output:AddLine(("recipe:AddAcquireData(%s)"):format(flag_string), genesis_val)
	end
	output:AddLine(" ", genesis_val)
end

function Recipe:DumpTrainers(registry)
	local trainer_data = self.acquire_data[A.TRAINER]

	if not trainer_data then
		return
	end

	for identifier in pairs(trainer_data) do
		registry[identifier] = true
	end
end

--- Public API function for retrieving specific information about a recipe.
-- @name AckisRecipeList:GetRecipeData
-- @usage AckisRecipeList:GetRecipeData(28972, "profession")
-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe being queried.
-- @param data Which member of the recipe table is being queried.
-- @return Variable, depending upon which member of the recipe table is queried.
function addon:GetRecipeData(spell_id, data)
	local recipe = private.recipe_list[spell_id]
	return recipe and recipe[data] or nil
end

