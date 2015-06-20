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

local ACQUIRE_TYPE_IDS = private.ACQUIRE_TYPE_IDS
local AcquireTypes = private.AcquireTypes

private.recipe_list = {}

-----------------------------------------------------------------------
-- Local constants.
-----------------------------------------------------------------------
local Recipe = {}
local recipeMetatable = {
	__index = Recipe
}

-----------------------------------------------------------------------
-- Helpers.
-----------------------------------------------------------------------
function addon:AddRecipe(module, recipeData)
	local recipeList = private.recipe_list
	local spellID = recipeData._spell_id

	local existingRecipe = recipeList[spellID]
	if existingRecipe then
		self:Debug("Duplicate recipe from %s: %d - %s", module.Name, spellID, existingRecipe.name)
		return
	end

	local recipe = _G.setmetatable(recipeData, recipeMetatable)
	recipe.ProfessionModule = module
	recipe:AddFilters(private.FILTER_IDS.ALLIANCE, private.FILTER_IDS.HORDE)

	if not recipe.name or recipe.name == "" then
		recipe.name = ("%s: %d"):format(_G.UNKNOWN, tonumber(spellID))
		self:Debug(L["SpellIDCache"]:format(spellID))
	end
	recipeList[spellID] = recipe

    local professionRecipes = private.Professions[recipe.profession].Recipes
    if not professionRecipes then
        professionRecipes = module.Recipes
        private.Professions[recipe.profession].Recipes = professionRecipes
    end
    professionRecipes[spellID] = recipe

	return recipe
end

-- Required for cases where ARL is acting as a profession "module"
function addon:GetOrCreateRecipeAcquireTypeTable(recipe, acquireTypeID, factionID, reputationLevel)
	local acquireTypeData = recipe.acquire_data[acquireTypeID]
	if not acquireTypeData then
		recipe.acquire_data[acquireTypeID] = {}
		acquireTypeData = recipe.acquire_data[acquireTypeID]

	end

	if factionID and reputationLevel and acquireTypeID == ACQUIRE_TYPE_IDS.REPUTATION then
		if not acquireTypeData[factionID] then
			acquireTypeData[factionID] = {
				[reputationLevel] = {}
			}
		elseif not acquireTypeData[factionID][reputationLevel] then
			acquireTypeData[factionID][reputationLevel] = {}
		end
	end

	return acquireTypeData
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

	if faction_name then
		if faction_name == "Alliance" then
			self:RemoveFilters(private.FILTER_IDS.HORDE)
		elseif faction_name == "Horde" then
			self:RemoveFilters(private.FILTER_IDS.ALLIANCE)
		else
			addon:Debug("Unknown faction_name \"%s\" passed to SetRequiredFaction for recipe %d.", faction_name, self.SpellID())
		end

		if private.Player.faction ~= faction_name then
			self.is_ignored = true
		end
	else
		addon:Debuf("No faction name passed to SetRequiredFaction for recipe %d", self.SpellID())
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
        local flag = RECIPE_STATE_FLAGS[state_name]
		return self.state and (bit.band(self.state, flag) == flag) or false
	end

	function Recipe:AddState(state_name)
		if not self.state then
			self.state = 0
		end

        local flag = RECIPE_STATE_FLAGS[state_name]
		if bit.band(self.state, flag) == flag then
			return
		end
		self.state = bit.bxor(self.state, flag)
	end

	function Recipe:RemoveState(state_name)
		if not self.state then
			return
		end

        local flag = RECIPE_STATE_FLAGS[state_name]
		if bit.band(self.state, flag) ~= flag then
			return
		end
		self.state = bit.bxor(self.state, flag)

		if self.state == 0 then
			self.state = nil
		end
	end
end -- do-block

do
	local BITFIELD_MAP = {}
	for index = 1, #private.FLAG_WORDS do
		BITFIELD_MAP[private.FLAG_MEMBERS[index]] = private.FLAG_WORDS[index]
	end

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

		if private.CurrentProfession:LocalizedName() == private.LOCALIZED_PROFESSION_NAMES.ENCHANTING then
			recipe_name = recipe_name:gsub(_G.ENSCRIBE .. " ", "")
		end
		local has_faction = private.Player:HasProperRepLevel(self.acquire_data[ACQUIRE_TYPE_IDS.REPUTATION])
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
	local numFilters = select('#', ...)

	for filterIndex = 1, numFilters do
		local filterID = select(filterIndex, ...)

		if filterID then
			local filterName = private.FILTER_STRINGS[filterID]
			local bitfield
			local memberName

			for table_index, bits in ipairs(private.FLAG_WORDS) do
				if bits[filterName] then
					bitfield = bits
					memberName = private.FLAG_MEMBERS[table_index]
					break
				end
			end

			if not bitfield or not memberName then
				addon:Debug("Recipe '%s' (spell ID %d): Attempting to assign non-existent filter flag %s.", recipe.name, recipe:SpellID(), filterName)
				return
			end

			if not recipe.flags[memberName] then
				recipe.flags[memberName] = 0
			end

            local flag = bitfield[filterName]
			if turn_on then
				if bit.band(recipe.flags[memberName], flag) == flag then
					if recipe.flags[memberName] == 0 then
						recipe.flags[memberName] = nil
					end
					return
				end
			else
				if bit.band(recipe.flags[memberName], flag) ~= flag then
					if recipe.flags[memberName] == 0 then
						recipe.flags[memberName] = nil
					end
					return
				end
			end
			recipe.flags[memberName] = bit.bxor(recipe.flags[memberName], flag)

			if recipe.flags[memberName] == 0 then
				recipe.flags[memberName] = nil
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

local InvalidLocationRegistry = {}

function Recipe:AddAcquireData(acquireType, typeLabel, hasEntityList, ...)
	local acquireTypeData = self.ProfessionModule:GetOrCreateRecipeAcquireTypeTable(self, acquireType:ID())
	local isLimitedVendor = typeLabel == "Limited Vendor"

	acquireType:AssignRecipe(self:SpellID())

	local variablesCount = select('#', ...)
	local currentVariableIndex = 1
	while currentVariableIndex <= variablesCount do
		-- A quantity of true means unlimited - normal vendor item.
		local quantity = true
		local localizedLocationName, affiliation
		local identifier = select(currentVariableIndex, ...)
		currentVariableIndex = currentVariableIndex + 1

		if isLimitedVendor then
			quantity = select(currentVariableIndex, ...)
			currentVariableIndex = currentVariableIndex + 1
		end
		acquireTypeData[identifier] = true

		if hasEntityList then
			local entity = acquireType:GetEntity(identifier)
			if entity then
				affiliation = entity.faction
				localizedLocationName = entity.location

				entity.item_list[self:SpellID()] = quantity
            else
                addon:Debug("Spell ID %d: %s ID %s does not exist in the %s AcquireType's Entity table.",
                    self:SpellID(),
                    typeLabel,
                    identifier,
                    acquireType:Label())
            end
		else
			local isStringID = type(identifier) == "string"

			localizedLocationName = isStringID and identifier or nil

			if localizedLocationName then
				affiliation = "world_drop"
			elseif isStringID then
				addon:Debug("%s with no location: %d %s", typeLabel, self:SpellID(), self.name)
			end
		end

		if affiliation then
			acquireType:AssignRecipe(self:SpellID(), affiliation)
		end

		if localizedLocationName then
            local location = private.LocationsByLocalizedName[localizedLocationName]
            if not location then
                if not InvalidLocationRegistry[localizedLocationName] then
                    addon:Debug("Invalid location: %s", localizedLocationName)
                    InvalidLocationRegistry[localizedLocationName] = true
                end
            else
                location:AssignRecipe(self, affiliation or true)
            end
        end
	end
end

function Recipe:AddMobDrop(...)
	self:AddAcquireData(AcquireTypes.MobDrop, "Mob", true, ...)
	self:AddFilters(private.FILTER_IDS.MOB_DROP)
end

function Recipe:AddTrainer(...)
	self:AddAcquireData(AcquireTypes.Trainer, "Trainer", true, ...)
	self:AddFilters(private.FILTER_IDS.TRAINER)
end

function Recipe:AddVendor(...)
	self:AddAcquireData(AcquireTypes.Vendor, "Vendor", true, ...)
	self:AddFilters(private.FILTER_IDS.VENDOR)
end

function Recipe:AddLimitedVendor(...)
	self:AddAcquireData(AcquireTypes.Vendor, "Limited Vendor", true, ...)
	self:AddFilters(private.FILTER_IDS.VENDOR)
end

function Recipe:AddWorldDrop(...)
	self:AddAcquireData(AcquireTypes.WorldDrop, "World Drop", false, ...)
	self:AddFilters(private.FILTER_IDS.WORLD_DROP)
end

function Recipe:AddQuest(...)
	self:AddAcquireData(AcquireTypes.Quest, "Quest", true, ...)
	self:AddFilters(private.FILTER_IDS.QUEST)
end

function Recipe:AddAchievement(...)
	self:AddAcquireData(AcquireTypes.Achievement, "Achievement", false, ...)
	self:AddFilters(private.FILTER_IDS.ACHIEVEMENT)
end

function Recipe:AddCustom(...)
	self:AddAcquireData(AcquireTypes.Custom, "Custom", true, ...)
	self:AddFilters(private.FILTER_IDS.CUSTOM)
end

function Recipe:AddDiscovery(...)
	self:AddAcquireData(AcquireTypes.Discovery, "Discovery", true, ...)
	self:AddFilters(private.FILTER_IDS.DISC)
end

function Recipe:AddWorldEvent(...)
	self:AddAcquireData(AcquireTypes.WorldEvent, "World Event", true, ...)
	self:AddFilters(private.FILTER_IDS.WORLD_EVENT)
end

function Recipe:AddRepVendor(factionID, reputationLevel, ...)
	local acquireTypeData = self.ProfessionModule:GetOrCreateRecipeAcquireTypeTable(self, ACQUIRE_TYPE_IDS.REPUTATION, factionID, reputationLevel)
	local faction = acquireTypeData[factionID]
	local reputationAcquireType = AcquireTypes.Reputation
	local vendorAcquireType = AcquireTypes.Vendor

	local variablesCount = select('#', ...)
	local currentVariableIndex = 1

	while currentVariableIndex <= variablesCount do
		local localizedLocationName, affiliation
		local vendorID = select(currentVariableIndex, ...)
		currentVariableIndex = currentVariableIndex + 1

		local reputation = reputationAcquireType:GetEntity(factionID)

		if reputation then
			if vendorID then
				local reputationVendor = vendorAcquireType:GetEntity(vendorID)

				if reputationVendor then
					faction[reputationLevel][vendorID] = true

					affiliation = reputationVendor.faction
					localizedLocationName = reputationVendor.location

					reputationVendor.reputation_id = factionID
					reputationVendor.item_list[self:SpellID()] = true

					reputation.item_list[self:SpellID()] = true

					self:AddFilters(private.FILTER_IDS[private.FACTION_LABELS_FROM_ID[factionID]])
				else
                    addon:Debug("Spell ID %d (%s): Reputation Vendor ID %s does not exist in the %s AcquireType Entity table.",
                        self:SpellID(),
                        tostring(self.name),
                        tostring(vendorID),
                        vendorAcquireType:Label())
                end
			else
				addon:Debug("Spell ID %d (%s): Nil Reputation Vendor ID passed.", self:SpellID(), tostring(self.name))
			end
		else
			addon:Debug("Spell ID %d: Faction ID %d does not exist in the %s AcquireType Entity table.", self:SpellID(), factionID, reputationAcquireType:Label())
		end
        reputationAcquireType:AssignRecipe(self:SpellID(), affiliation)

        if localizedLocationName then
            local location = private.LocationsByLocalizedName[localizedLocationName]
            if not location then
                if not InvalidLocationRegistry[localizedLocationName] then
                    addon:Debug("Invalid location: %s", localizedLocationName)
                    InvalidLocationRegistry[localizedLocationName] = true
                end
            else
                location:AssignRecipe(self, affiliation or true)
            end
        end
	end
	self:AddFilters(private.FILTER_IDS.REPUTATION)
end

function Recipe:Retire()
	self:AddAcquireData(AcquireTypes.Retired, "Retired")
	self:AddFilters(private.FILTER_IDS.RETIRED)
end

do
	local SOFT_FILTERS
	local filter_db
	local player_filters
	local obtain_filters

	local function InitializeFilters()
		filter_db = addon.db.profile.filters
		player_filters = filter_db.player
		obtain_filters = filter_db.obtain

		-- HARD_FILTERS and SOFT_FILTERS are used to determine if a recipe should be shown based on the value of the key compared to the value
		-- of its saved_var.
		private.HARD_FILTERS = {
			------------------------------------------------------------------------------------------------
			-- Player Type flags.
			------------------------------------------------------------------------------------------------
			melee	= { flagName = "DPS",		field = "common1",	sv_root = player_filters },
			tank	= { flagName = "TANK",		field = "common1",	sv_root = player_filters },
			healer	= { flagName = "HEALER",	field = "common1",	sv_root = player_filters },
			caster	= { flagName = "CASTER",	field = "common1",	sv_root = player_filters },
		}

		SOFT_FILTERS = {
			achievement	= { flagName = "ACHIEVEMENT",	field = "common1",	sv_root = obtain_filters },
			discovery	= { flagName = "DISC",			field = "common1",	sv_root = obtain_filters },
			instance	= { flagName = "INSTANCE",		field = "common1",	sv_root = obtain_filters },
			mobdrop		= { flagName = "MOB_DROP",		field = "common1",	sv_root = obtain_filters },
			pvp			= { flagName = "PVP",			field = "common1",	sv_root = obtain_filters },
			quest		= { flagName = "QUEST",			field = "common1",	sv_root = obtain_filters },
			raid		= { flagName = "RAID",			field = "common1",	sv_root = obtain_filters },
			retired		= { flagName = "RETIRED",		field = "common1",	sv_root = obtain_filters },
			reputation	= { flagName = "REPUTATION",	field = "common1",	sv_root = obtain_filters },
			worldevent	= { flagName = "WORLD_EVENT",	field = "common1",	sv_root = obtain_filters },
			trainer		= { flagName = "TRAINER",		field = "common1",	sv_root = obtain_filters },
			vendor		= { flagName = "VENDOR",		field = "common1",	sv_root = obtain_filters },
			worlddrop	= { flagName = "WORLD_DROP",	field = "common1",	sv_root = obtain_filters },
			custom		= { flagName = "CUSTOM",		field = "common1",	sv_root = obtain_filters },
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

	local REPUTATION_BITFLAG_FILTERS = {}
	for index = 1, #private.REP_FLAGS do
		REPUTATION_BITFLAG_FILTERS[index] = {}

		for flag_name, bitflag in pairs(private.REP_FLAGS[index]) do
			REPUTATION_BITFLAG_FILTERS[index][bitflag] = flag_name:lower()
		end

	end

	local CLASS_FLAGS_WORD1 = private.CLASS_FLAGS_WORD1
	local CLASS_BITFLAG_FILTERS = {
		[CLASS_FLAGS_WORD1.DK]			= "deathknight",
		[CLASS_FLAGS_WORD1.DRUID]		= "druid",
		[CLASS_FLAGS_WORD1.HUNTER]		= "hunter",
		[CLASS_FLAGS_WORD1.MAGE]		= "mage",
		[CLASS_FLAGS_WORD1.PALADIN]		= "paladin",
		[CLASS_FLAGS_WORD1.PRIEST]		= "priest",
		[CLASS_FLAGS_WORD1.SHAMAN]		= "shaman",
		[CLASS_FLAGS_WORD1.ROGUE]		= "rogue",
		[CLASS_FLAGS_WORD1.WARLOCK]		= "warlock",
		[CLASS_FLAGS_WORD1.WARRIOR]		= "warrior",
		[CLASS_FLAGS_WORD1.MONK]		= "monk",
	}

	-- Returns true if any of the filter flags are turned on.
	local function HasEnabledFlag(filters, bitfield, name_field)
		if not bitfield then
			return true
		end

		for bitflag, flag_name in pairs(filters) do
			if bit.band(bitfield, bitflag) == bitflag and name_field[flag_name] then
				return true
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

		local itemFilterType = self:ItemFilterType()
        if itemFilterType then
            local professionModule = private.CurrentProfession:Module()
            if not professionModule or not professionModule.db.profile.filters.item[itemFilterType] then
                return false
            end
        end

		-- Assume that recipes without a recipe item are obtained via trainers, and treat them as bind on pickup.
		local _, recipe_item_binding = self:RecipeItem()
		if recipe_item_binding and not addon.db.profile.filters.binding["recipe_" .. recipe_item_binding:lower()] then
			return false
		elseif not recipe_item_binding and not addon.db.profile.filters.binding.recipe_bind_on_pickup then
			return false
		end

		local _, crafted_item_binding = self:CraftedItem()
		if crafted_item_binding and not addon.db.profile.filters.binding["item_" .. crafted_item_binding:lower()] then
			return false
		end

		-- Check the hard filter flags.
		for filterName, filterData in pairs(private.HARD_FILTERS) do
			if self:HasFilter(filterData.field, filterData.flagName) and not filterData.sv_root[filterName] then
				return false
			end
		end

		-- Check the reputation filter flags.
		for index = 1, #REPUTATION_BITFLAG_FILTERS do
			if not HasEnabledFlag(REPUTATION_BITFLAG_FILTERS[index], self.flags[("reputation%d"):format(index)], filter_db.rep) then
				return false
			end
		end

		-- Check the class filter flags
		if not HasEnabledFlag(CLASS_BITFLAG_FILTERS, self.flags.class1, filter_db.classes) then
			return false
		end

		------------------------------------------------------------------------------------------------
		-- Stage 2
		-- loop through nonexclusive (soft filters) flags until one is true
		-- If one of these is true (ie: we want to see trainers and there is a trainer flag) we display the recipe
		------------------------------------------------------------------------------------------------
		for filterName, filterData in pairs(SOFT_FILTERS) do
			if self:HasFilter(filterData.field, filterData.flagName) and filterData.sv_root[filterName] then
				return true
			end
		end
	end
end --do-block

local DUMP_FUNCTION_FORMATS = {
	[ACQUIRE_TYPE_IDS.ACHIEVEMENT] = "recipe:AddAchievement(%s)",
	[ACQUIRE_TYPE_IDS.CUSTOM] = "recipe:AddCustom(%s)",
	[ACQUIRE_TYPE_IDS.DISCOVERY] = "recipe:AddDiscovery(%s)",
	[ACQUIRE_TYPE_IDS.WORLD_EVENT] = "recipe:AddWorldEvent(%s)",
	[ACQUIRE_TYPE_IDS.TRAINER] = "recipe:AddTrainer(%s)",
	[ACQUIRE_TYPE_IDS.MOB_DROP] = "recipe:AddMobDrop(%s)",
	[ACQUIRE_TYPE_IDS.WORLD_DROP] = "recipe:AddWorldDrop(%s)",
	[ACQUIRE_TYPE_IDS.QUEST] = "recipe:AddQuest(%s)",
	[ACQUIRE_TYPE_IDS.RETIRED] = "recipe:Retire()",
}

local sortedData = {}
local reverseMap = {}

-- These are automatically added when assigning the appropriate acquire type; dumping them is redundant.
local IMPLICIT_FLAGS = {
	ACHIEVEMENT = true,
	ALLIANCE = true,
	DISC = true,
	HORDE = true,
	CUSTOM = true,
	MOB_DROP = true,
	QUEST = true,
	REPUTATION = true,
	RETIRED = true,
	TRAINER = true,
	VENDOR = true,
	WORLD_DROP = true,
	WORLD_EVENT = true,
}

-- Reputation flags are automatically added when a reputation vendor is assigned to the recipe.
for reputationIndex = 1, #private.REP_FLAGS do
	for reputationName in pairs(private.REP_FLAGS[reputationIndex]) do
		IMPLICIT_FLAGS[reputationName] = true
	end
end

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
	local previous_rank_recipe = private.Professions[self.profession].Recipes[self:PreviousRankID()]

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
	local filterOutputText

	for flagWordIndex = 1, #private.FLAG_WORDS do
		table.wipe(sortedData)
		table.wipe(reverseMap)

		local bitsTable = private.FLAG_WORDS[flagWordIndex]
		for flagName, flagBit in pairs(bitsTable) do
			if not IMPLICIT_FLAGS[flagName] then
				local bitfield = self.flags[private.FLAG_MEMBERS[flagWordIndex]]

				if bitfield and bit.band(bitfield, flagBit) == flagBit then
					table.insert(sortedData, flagBit)
					reverseMap[flagBit] = flagName
				end
			end
		end
		table.sort(sortedData)

		for flagIndex = 1, #sortedData do
			local flagBit = sortedData[flagIndex]
			local bitfield = self.flags[private.FLAG_MEMBERS[flagWordIndex]]

			if bitfield and bit.band(bitfield, flagBit) == flagBit then
				if filterOutputText then
					filterOutputText = ("%s, F.%s"):format(filterOutputText, private.FILTER_STRINGS[private.FILTER_IDS[reverseMap[flagBit]]])
				else
					filterOutputText = ("F.%s"):format(private.FILTER_STRINGS[private.FILTER_IDS[reverseMap[flagBit]]])
				end
			end
		end
	end

	if filterOutputText then
		output:AddLine(("recipe:AddFilters(%s)"):format(filterOutputText), genesis_val)
	end
	filterOutputText = nil

	for acquireTypeID, acquireInfo in pairs(self.acquire_data) do
		if acquireTypeID == ACQUIRE_TYPE_IDS.REPUTATION then
			for factionID, factionInfo in pairs(acquireInfo) do
				local factionLabel = private.FACTION_LABELS_FROM_ID[factionID]

				if factionLabel then
					factionLabel = ("FAC.%s"):format(factionLabel)
				else
					factionLabel = factionID
					addon:Printf("Recipe %d (%s) - no string for faction %d", self:SpellID(), self.name, factionID)
				end

				for reputationLevel, reputationLevelInfo in pairs(factionInfo) do
					local reputationLevelString = ("REP.%s"):format(private.REP_LEVEL_STRINGS[reputationLevel or 1])
					local values

					table.wipe(sortedData)
					table.wipe(reverseMap)

					for entityID in pairs(reputationLevelInfo) do
						table.insert(sortedData, entityID)
					end
					table.sort(sortedData)

					for entityIDIndex, vendorID in ipairs(sortedData) do
						if values then
							values = ("%s, %d"):format(values, vendorID)
						else
							values = vendorID
						end
					end
					output:AddLine(("recipe:AddRepVendor(%s, %s, %s)"):format(factionLabel, reputationLevelString, values), genesis_val)
				end
			end
		elseif acquireTypeID == ACQUIRE_TYPE_IDS.VENDOR then
			local values
			local limited_values

			table.wipe(sortedData)
			table.wipe(reverseMap)

			for id_num in pairs(acquireInfo) do
				table.insert(sortedData, id_num)
			end
			table.sort(sortedData)

			for index, identifier in ipairs(sortedData) do
				local saved_id

				if type(identifier) == "string" then
					saved_id = ("\"%s\""):format(identifier)
				else
					saved_id = identifier
				end
				local vendor = AcquireTypes.Vendor:GetEntity(identifier)
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
		elseif DUMP_FUNCTION_FORMATS[acquireTypeID] then
			local values

			table.wipe(sortedData)
			table.wipe(reverseMap)

			for id_num in pairs(acquireInfo) do
				table.insert(sortedData, id_num)
			end
			table.sort(sortedData)

			for index, identifier in ipairs(sortedData) do
				local saved_id

				if type(identifier) == "string" then
					if acquireTypeID == ACQUIRE_TYPE_IDS.WORLD_DROP then
						saved_id = ("Z.%s"):format(private.ZONE_LABELS_FROM_NAME[identifier])
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
			output:AddLine((DUMP_FUNCTION_FORMATS[acquireTypeID]):format(values), genesis_val)
		end
	end

	output:AddLine(" ", genesis_val)
end

function Recipe:DumpTrainers(registry)
	local trainer_data = self.acquire_data[ACQUIRE_TYPE_IDS.TRAINER]

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

