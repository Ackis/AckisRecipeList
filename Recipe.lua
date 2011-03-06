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

local A		= private.acquire_types
local F 	= private.filter_flags
local SF	= private.recipe_state_flags

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
function addon:AddRecipe(spell_id, skill_level, item_id, quality, profession, specialty, genesis, optimal_level, medium_level, easy_level, trivial_level)
	local recipe_list = private.recipe_list

	if recipe_list[spell_id] then
		--@alpha@
		self:Print("Duplicate recipe: "..recipe_list[spell_id].profession.." "..tostring(spell_id).." "..recipe_list[spell_id].name)
		--@end-alpha@
		return
	end

	local recipe = _G.setmetatable({
		spell_id = spell_id,
		skill_level = skill_level,
		item_id = item_id,
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

	if not recipe.name then
		recipe.name = ("%s: %d"):format(_G.UNKNOWN, tonumber(spell_id))
		self:Print(L["SpellIDCache"]:format(spell_id))
	end
	recipe_list[spell_id] = recipe
	return recipe
end

--- Adds filtering flags to a specific tradeskill.
-- @name AckisRecipeList:AddRecipeFlags
-- @usage AckisRecipeList:AddRecipeFlags(28927, F.ALLIANCE, F.VENDOR, F.IBOE, F.RBOP, F.HEALER, F.CASTER, F.ALDOR)
-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which the filter flags are being added to
-- @param ... A listing of filtering flags.  See [[API/database-documentation]] for a listing of filter flags
-- @return None, array is passed as a reference.
function addon:AddRecipeFlags(spell_id, ...)
	private.recipe_list[spell_id]:AddFlags(...)
end

do
	-- Helper function to add all recipe acquire information.  Called via a wrapper function.
	local function GenericAddRecipeAcquire(spell_id, acquire_type, type_string, unit_list, ...)
		local recipe = private.recipe_list[spell_id]

		if not recipe then
			addon:Debug("GenericAddRecipeAcquire(): No recipe found for Spell ID %d.", spell_id)
			return
		end
		local location_list = private.location_list
		local acquire_list = private.acquire_list
		local acquire_data = recipe.acquire_data
		acquire_data[acquire_type] = acquire_data[acquire_type] or {}

		local acquire = acquire_data[acquire_type]

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
				addon:Debug("Spell ID %d: %s ID %d does not exist in the database.", spell_id, type_string, id_num)
			else
				if not unit_list then
					local id_type = type(id_num)

					location = id_type == "string" and BZ[id_num] or nil

					if location then
						affiliation = "world_drop"
					else
						if id_type == "string" then
							addon:Debug("WORLD_DROP with no location: %d %s", spell_id, private.recipe_list[spell_id].name)
						end
					end
				else
					local unit = unit_list[id_num]

					affiliation = unit.faction
					location = unit.location

					unit.item_list = unit.item_list or {}
					unit.item_list[spell_id] = quantity
				end
			end
			acquire_list[acquire_type] = acquire_list[acquire_type] or {}
			acquire_list[acquire_type].recipes = acquire_list[acquire_type].recipes or {}

			acquire_list[acquire_type].name = private.acquire_names[acquire_type]
			acquire_list[acquire_type].recipes[spell_id] = affiliation or true

			if location then
				location_list[location] = location_list[location] or {}
				location_list[location].recipes = location_list[location].recipes or {}

				location_list[location].name = location
				location_list[location].recipes[spell_id] = affiliation or true
			end
		end
	end

	--- Adds mob drop acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeMobDrop
	-- @usage AckisRecipeList::AddRecipeMobDrop(28564, 24664)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of monsters that drop that recipe.
	-- @return None.
	function addon:AddRecipeMobDrop(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.MOB_DROP, "Mob", private.mob_list, ...)
	end

	--- Adds trainer acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeTrainer
	-- @usage AckisRecipeList:AddRecipeTrainer(33732, 18802, 19052, 33674, 27023, 33608, 16588, 27029)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of trainers that teach the recipe.
	-- @return None.
	function addon:AddRecipeTrainer(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.TRAINER, "Trainer", private.trainer_list, ...)
	end

	--- Adds vendor acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeVendor
	-- @usage AckisRecipeList:AddRecipeVendor(39639, 18821, 18822)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of vendors that sell the recipe.
	-- @return None.
	function addon:AddRecipeVendor(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.VENDOR, "Vendor", private.vendor_list, ...)
	end

	--- Adds limited supply vendor acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeLimitedVendor
	-- @usage AckisRecipeList:AddRecipeLimitedVendor(3449, 4878, 1)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of limited supply vendors that sell the recipe followed by the amount they sell.
	-- @return None.
	function addon:AddRecipeLimitedVendor(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.VENDOR, "Limited Vendor", private.vendor_list, ...)
	end

	--- Adds world drop acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeWorldDrop
	-- @usage AckisRecipeList:AddRecipeWorldDrop(3450, "Kalimdor", "Eastern Kingdoms")
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of the zones where the recipe drops from.
	-- @return None.
	function addon:AddRecipeWorldDrop(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.WORLD_DROP, nil, nil, ...)
	end

	--- Adds quest reward acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeQuest
	-- @usage AckisRecipeList:AddRecipeQuest(66659, 14151)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of quests that reward the recipe.
	-- @return None.
	function addon:AddRecipeQuest(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.QUEST, "Quest", private.quest_list, ...)
	end

	--- Adds achievement reward acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeAchievement
	-- @usage AckisRecipeList:AddRecipeAchievement(92688, 5024)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of achievments that reward the recipe.
	-- @return None.
	function addon:AddRecipeAchievement(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.ACHIEVEMENT, "Achievement", nil, ...)
	end

--[[
	function addon:AddRecipeRetired(spell_id, ...)
		local retired_db = {
			[1] = "Retired in Wrath",
			[2] = "Retired in Cata",
		}
		GenericAddRecipeAcquire(spell_id, A.RETIRED, "Retired", retired_db, 1)
	end
]]--

	--- Adds custom acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeCustom
	-- @usage AckisRecipeList:AddRecipeCustom(12086, 48)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of custom entries for that recipe.
	-- @return None.
	function addon:AddRecipeCustom(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.CUSTOM, "Custom", private.custom_list, ...)
	end

	--- Adds seasonal acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeSeason
	-- @usage AckisRecipeList:AddRecipeSeason(21143, 1)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param ... A listing of seasonal events where the recipe can be obtained.
	-- @return None.
	function addon:AddRecipeSeason(spell_id, ...)
		GenericAddRecipeAcquire(spell_id, A.SEASONAL, "Seasonal", private.seasonal_list, ...)
	end

	-- This function can NOT use GenericAddRecipeAcquire() - reputation vendors are more complicated than the other acquire types.
	--- Adds acquire methods to a specific tradeskill.
	-- @name AckisRecipeList:AddRecipeRepVendor
	-- @usage AckisRecipeList:AddRecipeRepVendor(28927, FAC.ALDOR, REP.HONORED, 19321)
	-- @param spell_id The [[http://www.wowpedia.org/SpellLink|Spell ID]] of the recipe which acquire methods are being added to
	-- @param faction_id Reputation faction used.
	-- @param rep_level Level of reputation required.
	-- @param ... A listing of vendors associated with that faction level.
	-- @return None.
	function addon:AddRecipeRepVendor(spell_id, faction_id, rep_level, ...)
		local location_list = private.location_list
		local acquire_list = private.acquire_list

		local num_vars = select('#', ...)
		local cur_var = 1

		local recipe = private.recipe_list[spell_id]
		local vendor_list = private.vendor_list

		local acquire_data = recipe.acquire_data
		acquire_data[A.REPUTATION] = acquire_data[A.REPUTATION] or {}

		local acquire = acquire_data[A.REPUTATION]
		acquire[faction_id] = acquire[faction_id] or {}

		local faction = acquire[faction_id]
		faction[rep_level] = faction[rep_level] or {}

		while cur_var <= num_vars do
			local location, affiliation
			local vendor_id = select(cur_var, ...)
			cur_var = cur_var + 1

			if not private.reputation_list[faction_id] then
				--@alpha@
				self:Printf("Spell ID %d: Faction ID %d does not exist in the database.", spell_id, faction_id)
				--@end-alpha@
			else
				if not vendor_id then
					--@alpha@
					self:Print("Spell ID "..spell_id..": Reputation Vendor ID is nil.")
					--@end-alpha@
				elseif not vendor_list[vendor_id] then
					--@alpha@
					self:Print("Spell ID "..spell_id..": Reputation Vendor ID "..vendor_id.." does not exist in the database.")
					--@end-alpha@
				else
					faction[rep_level][vendor_id] = true

					local rep_vendor = vendor_list[vendor_id]

					affiliation = rep_vendor.faction
					location = rep_vendor.location

					rep_vendor.item_list = rep_vendor.item_list or {}
					rep_vendor.item_list[spell_id] = true
				end
			end
			acquire_list[A.REPUTATION] = acquire_list[A.REPUTATION] or {}
			acquire_list[A.REPUTATION].recipes = acquire_list[A.REPUTATION].recipes or {}

			acquire_list[A.REPUTATION].name = private.acquire_names[A.REPUTATION]
			acquire_list[A.REPUTATION].recipes[spell_id] = affiliation or true

			if location then
				location_list[location] = location_list[location] or {}
				location_list[location].recipes = location_list[location].recipes or {}

				location_list[location].name = location
				location_list[location].recipes[spell_id] = affiliation or true
			end
		end
	end
end	-- do block

-------------------------------------------------------------------------------
-- Recipe methods.
-------------------------------------------------------------------------------
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

	function recipe_prototype:IsFlagged(field_name, flag_name)
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
		local skill_level = private.Player["ProfessionLevel"]
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

function recipe_prototype:AddFlags(...)
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
		self.flags[member_name] = bit.bxor(self.flags[member_name], bitfield[flag_name])
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

