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
local string = _G.string

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local MODNAME	= "Ackis Recipe List"
local addon = LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L		= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BZ	= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BFAC 	= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

local A		= private.acquire_types
local SF	= private.recipe_state_flags

private.num_recipes = {}

-----------------------------------------------------------------------
-- Local constants.
-----------------------------------------------------------------------
local recipe_prototype = {}
local recipe_meta = {
    __index = recipe_prototype
}

---Adds a tradeskill recipe into the specified recipe database
-- @name AckisRecipeList:AddRecipe
-- @usage AckisRecipeList:AddRecipe(28927, 305, 23109, Q.UNCOMMON, V.TBC, 305, 305, 325, 345)
-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe being added to the database
-- @param skill_level The skill level at which the recipe can be initially learned
-- @param item_id The [[http://www.wowpedia.org/ItemLink|Item ID]] that is created by the recipe, or nil
-- @param quality The quality/rarity of the recipe
-- @param profession The profession ID that uses the recipe.  See [[API/database-documentation]] for a listing of profession IDs
-- @param specialty The specialty that uses the recipe (ie: goblin engineering) or nil or blank
-- @param genesis Game version that the recipe was first introduced in, for example, Original, BC, WoTLK, or Cata
-- @param optimal_level Level at which recipe is considered orange
-- @param medium_level Level at which recipe is considered yellow
-- @param easy_level Level at which recipe is considered green
-- @param trivial_level Level at which recipe is considered grey
-- @return Resultant recipe table.
function addon:AddRecipe(spell_id, skill_level, crafted_item_id, quality, profession, specialty, genesis, optimal_level, medium_level, easy_level, trivial_level, required_faction)
	local recipe_list = private.recipe_list

	if recipe_list[spell_id] then
		--@alpha@
		self:Debug("Duplicate recipe: %d - %s (%s)", spell_id, recipe_list[spell_id].name, recipe_list[spell_id].profession)
		--@end-alpha@
		return
	end

	local recipe = _G.setmetatable({
		spell_id = spell_id,
		skill_level = skill_level,
		crafted_item_id = crafted_item_id,
		quality = quality,
		profession = _G.GetSpellInfo(profession),
		name = _G.GetSpellInfo(spell_id),
		flags = {},
		acquire_data = {},
		specialty = specialty, -- Assumption: there will only be 1 speciality for a trade skill
		genesis = private.game_version_names[genesis],
		optimal_level = optimal_level or skill_level,
		medium_level = medium_level or skill_level + 10,
		easy_level = easy_level or skill_level + 15,
		trivial_level = trivial_level or skill_level + 20,
	}, recipe_meta)

	if not recipe.name or recipe.name == "" then
		recipe.name = ("%s: %d"):format(_G.UNKNOWN, tonumber(spell_id))
		self:Print(L["SpellIDCache"]:format(spell_id))
	end
	recipe_list[spell_id] = recipe
	private.num_recipes[recipe.profession] = (private.num_recipes[recipe.profession] or 0) + 1

	recipe.required_faction = required_faction

	if required_faction and private.Player.faction ~= BFAC[required_faction] then
		recipe.is_ignored = true
	end
	return recipe
end

-------------------------------------------------------------------------------
-- Recipe methods.
-------------------------------------------------------------------------------
function recipe_prototype:SetRecipeItemID(item_id)
	self.recipe_item_id = item_id
end

function recipe_prototype:RecipeItemID()
	return self.recipe_item_id
end

function recipe_prototype:SetCraftedItemID(item_id)
	self.crafted_item_id = item_id
end

function recipe_prototype:CraftedItemID()
	return self.crafted_item_id
end

function recipe_prototype:SetSkillLevels(skill_level, optimal_level, medium_level, easy_level, trivial_level)
	self.skill_level = skill_level
	self.optimal_level = optimal_level or skill_level
	self.medium_level = medium_level or skill_level + 10
	self.easy_level = easy_level or skill_level + 15
	self.trivial_level = trivial_level or skill_level + 20
end

function recipe_prototype:SkillLevels()
	return self.skill_level, self.optimal_level, self.medium_level, self.easy_level, self.trivial_level
end

function recipe_prototype:SetSpecialty(spell_id)
	self.specialty = spell_id
end

function recipe_prototype:Specialty()
	return self.specialty
end

function recipe_prototype:SetRequiredFaction(faction_name)
	self.required_faction = faction_name

	if faction_name and private.Player.faction ~= BFAC[faction_name] then
		self.is_ignored = true
	end

	if self.is_ignored then
		private.num_recipes[self.profession] = (private.num_recipes[self.profession] or 0) - 1
	end
end

function recipe_prototype:RequiredFaction()
	return self.required_faction
end

function recipe_prototype:HasState(state_name)
	return self.state and (bit.band(self.state, SF[state_name]) == SF[state_name]) or false
end

function recipe_prototype:AddState(state_name)
	if not self.state then
		self.state = 0
	end

	if bit.band(self.state, SF[state_name]) == SF[state_name] then
		return
	end
	self.state = bit.bxor(self.state, SF[state_name])
end

function recipe_prototype:RemoveState(state_name)
	if not self.state then
		return
	end

	if bit.band(self.state, SF[state_name]) ~= SF[state_name] then
		return
	end
	self.state = bit.bxor(self.state, SF[state_name])

	if self.state == 0 then
		self.state = nil
	end
end

do
	local BITFIELD_MAP = {
		common1 = private.common_flags_word1,
		class1 = private.class_flags_word1,
		reputation1 = private.rep_flags_word1,
		reputation2 = private.rep_flags_word2,
		item1 = private.item_flags_word1,
	}

	function recipe_prototype:HasFilter(field_name, flag_name)
		local bitfield = self.flags[field_name]
		local bitset = BITFIELD_MAP[field_name]
		local value = bitset[flag_name]

		return bitfield and (bit.band(bitfield, value) == value) or false
	end
end -- do-block

do
	local SKILL_LEVEL_FORMAT = "[%d]"
	local SPELL_ENCHANTING = _G.GetSpellInfo(51313)

	function recipe_prototype:GetDisplayName()
		local _, _, _, quality_color = _G.GetItemQualityColor(self.quality)
		local recipe_name = self.name

		if private.ordered_professions[addon.Frame.profession] == SPELL_ENCHANTING then
			recipe_name = string.gsub(recipe_name, _G.ENSCRIBE .. " ", "")
		end
		local has_faction = private.Player:HasProperRepLevel(self.acquire_data[A.REPUTATION])
		local skill_level = private.current_profession_scanlevel
		local recipe_level = self.skill_level

		local diff_color

		if not has_faction or recipe_level > skill_level then
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
		local display_name = ("%s%s|r"):format(quality_color, recipe_name)
		local level_text = private.SetTextColor(private.difficulty_colors[diff_color], SKILL_LEVEL_FORMAT):format(recipe_level)

		if addon.db.profile.skill_view then
			display_name = ("%s - %s"):format(level_text, display_name)
		else
			display_name = ("%s - %s"):format(display_name, level_text)
		end

		if addon.db.profile.exclusionlist[self.spell_id] then
			display_name = ("** %s **"):format(display_name)
		end
		return display_name
	end
end -- do-block

function recipe_prototype:AddFilters(...)
	local num_flags = select('#',...)

	for index = 1, num_flags, 1 do
		local flag = select(index, ...)
		local flag_name = private.filter_strings[flag]

		local bitfield
		local member_name

		for table_index, bits in ipairs(private.bit_flags) do
			if bits[flag_name] then
				bitfield = bits
				member_name = private.flag_members[table_index]
			end
		end

		if not bitfield or not member_name then
			return
		end

		if not self.flags[member_name] then
			self.flags[member_name] = 0
		end

		if bit.band(self.flags[member_name], bitfield[flag_name]) == bitfield[flag_name] then
			return
		end
		self.flags[member_name] = bit.bxor(self.flags[member_name], bitfield[flag_name])
	end
end

function recipe_prototype:AddAcquireData(acquire_type, type_string, unit_list, ...)
	local location_list = private.location_list
	local acquire_list = private.acquire_list
	self.acquire_data[acquire_type] = self.acquire_data[acquire_type] or {}

	local acquire = self.acquire_data[acquire_type]

	local num_vars = select('#', ...)
	local cur_var = 1

	while cur_var <= num_vars do
		local location, affiliation
		local id_num = select(cur_var, ...)
		cur_var = cur_var + 1

		-- A quantity of true means unlimited - normal vendor item.
		local quantity = true

		if type_string == "Limited Vendor" then
			quantity = select(cur_var, ...)
			cur_var = cur_var + 1
		end
		acquire[id_num] = true

		if unit_list and not unit_list[id_num] then
			addon:Debug("Spell ID %d: %s ID %d does not exist in the database.", self.spell_id, type_string, id_num)
		else
			if not unit_list then
				local id_type = type(id_num)

				location = id_type == "string" and BZ[id_num] or nil

				if location then
					affiliation = "world_drop"
				else
					if id_type == "string" then
						addon:Debug("WORLD_DROP with no location: %d %s", self.spell_id, self.name)
					end
				end
			else
				local unit = unit_list[id_num]

				affiliation = unit.faction
				location = unit.location

				unit.item_list = unit.item_list or {}
				unit.item_list[self.spell_id] = quantity
			end
		end
		acquire_list[acquire_type] = acquire_list[acquire_type] or {}
		acquire_list[acquire_type].recipes = acquire_list[acquire_type].recipes or {}

		acquire_list[acquire_type].name = private.acquire_names[acquire_type]
		acquire_list[acquire_type].recipes[self.spell_id] = affiliation or true

		if location then
			location_list[location] = location_list[location] or {}
			location_list[location].recipes = location_list[location].recipes or {}

			location_list[location].name = location
			location_list[location].recipes[self.spell_id] = affiliation or true
		end
	end
end

function recipe_prototype:AddMobDrop(...)
	self:AddAcquireData(A.MOB_DROP, "Mob", private.mob_list, ...)
end

function recipe_prototype:AddTrainer(...)
	self:AddAcquireData(A.TRAINER, "Trainer", private.trainer_list, ...)
end

function recipe_prototype:AddVendor(...)
	self:AddAcquireData(A.VENDOR, "Vendor", private.vendor_list, ...)
end

function recipe_prototype:AddLimitedVendor(...)
	self:AddAcquireData(A.VENDOR, "Limited Vendor", private.vendor_list, ...)
end

function recipe_prototype:AddWorldDrop(...)
	self:AddAcquireData(A.WORLD_DROP, nil, nil, ...)
end

function recipe_prototype:AddQuest(...)
	self:AddAcquireData(A.QUEST, "Quest", private.quest_list, ...)
end

function recipe_prototype:AddAchievement(...)
	self:AddAcquireData(A.ACHIEVEMENT, "Achievement", nil, ...)
end

function recipe_prototype:AddCustom(...)
	self:AddAcquireData(A.CUSTOM, "Custom", private.custom_list, ...)
end

function recipe_prototype:AddSeason(...)
	self:AddAcquireData(A.SEASONAL, "Seasonal", private.seasonal_list, ...)
end

function recipe_prototype:AddRepVendor(faction_id, rep_level, ...)
	local location_list = private.location_list
	local acquire_list = private.acquire_list
	local vendor_list = private.vendor_list

	self.acquire_data[A.REPUTATION] = self.acquire_data[A.REPUTATION] or {}

	local acquire = self.acquire_data[A.REPUTATION]
	acquire[faction_id] = acquire[faction_id] or {}

	local faction = acquire[faction_id]
	faction[rep_level] = faction[rep_level] or {}

	local num_vars = select('#', ...)
	local cur_var = 1

	while cur_var <= num_vars do
		local location, affiliation
		local vendor_id = select(cur_var, ...)
		cur_var = cur_var + 1

		if not private.reputation_list[faction_id] then
			--@alpha@
			self:Printf("Spell ID %d: Faction ID %d does not exist in the database.", self.spell_id, faction_id)
			--@end-alpha@
		else
			if not vendor_id then
				--@alpha@
				self:Printf("Spell ID %d: Reputation Vendor ID is nil.", self.spell_id)
				--@end-alpha@
			elseif not vendor_list[vendor_id] then
				--@alpha@
				self:Printf("Spell ID %d: Reputation Vendor ID %d does not exist in the database.", self.spell_id, vendor_id)
				--@end-alpha@
			else
				faction[rep_level][vendor_id] = true

				local rep_vendor = vendor_list[vendor_id]

				affiliation = rep_vendor.faction
				location = rep_vendor.location

				rep_vendor.item_list = rep_vendor.item_list or {}
				rep_vendor.item_list[self.spell_id] = true
			end
		end
		acquire_list[A.REPUTATION] = acquire_list[A.REPUTATION] or {}
		acquire_list[A.REPUTATION].recipes = acquire_list[A.REPUTATION].recipes or {}

		acquire_list[A.REPUTATION].name = private.acquire_names[A.REPUTATION]
		acquire_list[A.REPUTATION].recipes[self.spell_id] = affiliation or true

		if location then
			location_list[location] = location_list[location] or {}
			location_list[location].recipes = location_list[location].recipes or {}

			location_list[location].name = location
			location_list[location].recipes[self.spell_id] = affiliation or true
		end
	end
end

local DUMP_FUNCTION_FORMATS = {
	[A.ACHIEVEMENT] = "recipe:AddAchievement(%s)",
	[A.CUSTOM] = "recipe:AddCustom(%s)",
	[A.SEASONAL] = "recipe:AddSeason(%s)",
	[A.TRAINER] = "recipe:AddTrainer(%s)",
	[A.MOB_DROP] = "recipe:AddMobDrop(%s)",
	[A.WORLD_DROP] = "recipe:AddWorldDrop(%s)",
	[A.QUEST] = "recipe:AddQuest(%s)",
}

local sorted_data = {}
local reverse_map = {}

function recipe_prototype:Dump(output)
	local genesis = private.game_versions[self.genesis]

	table.insert(output, ("-- %s -- %d"):format(self.name, self.spell_id))
	table.insert(output, ("recipe = AddRecipe(%d, V.%s, Q.%s)"):format(self.spell_id, private.game_version_names[genesis], private.item_quality_names[self.quality]))

	local recipe_item_id = private.spell_to_recipe_map[self.spell_id] or self.recipe_item_id

	if recipe_item_id then
		table.insert(output, ("recipe:SetRecipeItemID(%d)"):format(recipe_item_id))
	end

	if self.crafted_item_id then
		table.insert(output, ("recipe:SetCraftedItemID(%d)"):format(self.crafted_item_id))
	end
	local skill_level = self.skill_level
	local optimal_level = self.optimal_level
	local medium_level = self.medium_level
	local easy_level = self.easy_level
	local trivial_level = self.trivial_level

	table.insert(output, ("recipe:SetSkillLevels(%d, %d, %d, %d, %d)"):format(skill_level, optimal_level, medium_level, easy_level, trivial_level))

	if self.specialty then
		table.insert(output, ("recipe:SetSpecialty(%d)"):format(self.specialty))
	end

	if self.required_faction then
		table.insert(output, ("recipe:SetRequiredFaction(\"%s\")"):format(self.required_faction))
	end
	local flag_string

	for table_index, bits in ipairs(private.bit_flags) do
		table.wipe(sorted_data)
		table.wipe(reverse_map)

		for flag_name, flag in pairs(bits) do
			local bitfield = self.flags[private.flag_members[table_index]]

			if bitfield and bit.band(bitfield, flag) == flag then
				table.insert(sorted_data, flag)
				reverse_map[flag] = flag_name
			end
		end
		table.sort(sorted_data)

		for index, flag in ipairs(sorted_data) do
			local bitfield = self.flags[private.flag_members[table_index]]

			if bitfield and bit.band(bitfield, flag) == flag then
				if not flag_string then
					flag_string = ("F.%s"):format(private.filter_strings[private.filter_flags[reverse_map[flag]]])
				else
					flag_string = ("%s, F.%s"):format(flag_string, private.filter_strings[private.filter_flags[reverse_map[flag]]])
				end
			end
		end
	end
	table.insert(output, ("recipe:AddFilters(%s)"):format(flag_string))

	flag_string = nil

	for acquire_type, acquire_info in pairs(self.acquire_data) do
		if acquire_type == A.REPUTATION then
			for rep_id, rep_info in pairs(acquire_info) do
				local faction_string = private.faction_strings[rep_id]

				if not faction_string then
					faction_string = rep_id
					addon:Printf("Recipe %d (%s) - no string for faction %d", self.spell_id, self.name, rep_id)
				else
					faction_string = ("FAC.%s"):format(faction_string)
				end

				for rep_level, level_info in pairs(rep_info) do
					local rep_string = ("REP.%s"):format(private.rep_level_strings[rep_level or 1])
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
					table.insert(output, ("recipe:AddRepVendor(%s, %s, %s)"):format(faction_string, rep_string, values))
				end
			end
		elseif acquire_type == A.VENDOR then
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
				local vendor = private.vendor_list[identifier]
				local quantity = vendor.item_list[self.spell_id]

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
				table.insert(output, ("recipe:AddVendor(%s)"):format(values))
			end

			if limited_values then
				table.insert(output, ("recipe:AddLimitedVendor(%s)"):format(limited_values))
			end
		elseif DUMP_FUNCTION_FORMATS[acquire_type] then
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
					saved_id = ("\"%s\""):format(identifier)
				else
					saved_id = identifier
				end

				if values then
					values = ("%s, %s"):format(values, saved_id)
				else
					values = saved_id
				end
			end
			table.insert(output, (DUMP_FUNCTION_FORMATS[acquire_type]):format(values))
		else
			for identifier in pairs(acquire_info) do
				local saved_id

				if type(identifier) == "string" then
					saved_id = ("\"%s\""):format(identifier)
				else
					saved_id = identifier
				end

				if flag_string then
					flag_string = ("%s, A.%s, %s"):format(flag_string, private.acquire_strings[acquire_type], saved_id)
				else
					flag_string = ("A.%s, %s"):format(private.acquire_strings[acquire_type], saved_id)
				end
			end
		end
	end

	if flag_string then
		table.insert(output, ("recipe:AddAcquireData(%s)"):format(flag_string))
	end
	table.insert(output, "")
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

