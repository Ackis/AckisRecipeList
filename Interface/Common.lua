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

-- Set up the private intra-file namespace.
local private	= select(2, ...)

-------------------------------------------------------------------------------
-- Table cache mechanism
-------------------------------------------------------------------------------
do
	local table_cache = {}

	-- Returns a table
	function private.AcquireTable()
		local tbl = table.remove(table_cache) or {}
		return tbl
	end

	-- Cleans the table and stores it in the cache
	function private.ReleaseTable(tbl)
		if not tbl then return end
		table.wipe(tbl)
		table.insert(table_cache, tbl)
	end
end	-- do block

-------------------------------------------------------------------------------
-- Sort functions
-------------------------------------------------------------------------------
do
	addon.sorted_recipes = {}

	local recipe_list = private.recipe_list
	local sorted_recipes = addon.sorted_recipes

	local function Sort_SkillAsc(a, b)
		local reca, recb = recipe_list[a], recipe_list[b]

		if reca.skill_level == recb.skill_level then
			return reca.name < recb.name
		else
			return reca.skill_level < recb.skill_level
		end
	end

	local function Sort_SkillDesc(a, b)
		local reca, recb = recipe_list[a], recipe_list[b]

		if reca.skill_level == recb.skill_level then
			return reca.name < recb.name
		else
			return recb.skill_level < reca.skill_level
		end
	end

	local function Sort_NameAsc(a, b)
		return recipe_list[a].name < recipe_list[b].name
	end

	local function Sort_NameDesc(a, b)
		return recipe_list[a].name > recipe_list[b].name
	end

	local RECIPE_SORT_FUNCS = {
		["SkillAscending"]	= Sort_SkillAsc,
		["SkillDescending"]	= Sort_SkillDesc,
		["NameAscending"]	= Sort_NameAsc,
		["NameDescending"]	= Sort_NameDesc,
	}

	-- Sorts the recipe_list according to configuration settings.
	function private.SortRecipeList(recipe_list)
		local sort_type = addon.db.profile.sorting
		local skill_view = addon.db.profile.skill_view

		local sort_func = RECIPE_SORT_FUNCS[(skill_view and "Skill" or "Name")..sort_type] or Sort_NameAsc

		table.wipe(sorted_recipes)

		for n, v in pairs(recipe_list) do
			table.insert(sorted_recipes, n)
		end
		table.sort(sorted_recipes, sort_func)
	end
end	-- do

