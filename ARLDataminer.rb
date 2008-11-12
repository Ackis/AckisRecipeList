=begin

****************************************************************************************

ARLDataminer.rb

Datamining for all of AckisRecipeList

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

****************************************************************************************

=end

include Enumerable

$LOAD_PATH << './DataMiner'
require "core.rb"
require "wowdb_maps.rb"
require "wowdb_recipes.rb"
require "wowdb_factions.rb"

generator_start = Time.now

# Some globals for use within the scraper
$trainers = Hash.new
$quests = Hash.new
$monsters = Hash.new
$vendors = Hash.new
$localstring = Array.new

# Creates the faction database

def create_faction_db()

	puts "Generating Reputation file..."

	# Open the reputation file
	replua = File.open("./RecipeDB/ARL-Reputation.lua", "w:utf-8")

	# Faction file header
	header=<<EOF
--[[

************************************************************************

ARL-Reputation.lua

Reputation data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb	
Entries to this file will be overwritten

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(RepDB, Rep ID, Rep Name)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

function addon:InitReputation(RepDB)

EOF

	replua.puts(header)

	flags = {
		"Argent Dawn" => 96,
		"Cenarion Circle" => 97,
		"Thorium Brotherhood" => 98,
		"Timbermaw Hold" =>99,
		"Zandalar Tribe" => 100,
		"The Aldor" => 101,
		"Ashtongue Deathsworn" => 102,
		"Cenarion Expedition" => 103,
		"Thrallmar" => 104,
		"Honor Hold" => 104,
		"The Consortium" => 105,
		"Keepers of Time" => 106,
		"Lower City" => 107,
		"The Mag'har" => 108,
		"Kurenai" => 108,
		"The Scale of the Sands" => 109,
		"The Scryers" => 110,
		"The Sha'tar" => 111,
		"Shattered Sun Offensive" => 112,
		"Sporeggar" => 113,
		"The Violet Eye" => 114,
		"Argent Crusade" => 115,
		"Frenzyheart Tribe" => 116,
		"Knights of the Ebon Blade" => 117,
		"Kirin Tor" => 118,
		"The Sons of Hodir" => 119,
		"The Kalu'ak" => 120,
		"The Oracles" => 121,
		"The Wyrmrest Accord" => 122,
		"The Silver Convenant" => 123,
		"The Sunreavers" => 124,
		"Explorer's League" => 125,
		"Valiance Expedition" => 126,
		"The Hand of Vengeance" => 127,
		"The Taunka" => 128,
		"Warsong Offensive" => 129,
	}

	# Get the list of reputations 	 
	factions = WoWDBFactions.new

	$reps = factions.get_faction_list 

	# Parse the list and add the info to the file and a reputations look up file
	$reps.keys.sort_by {|key|	

		if flags.has_key?(key)
			$reps[key]={:id => $reps[key][:id], :flag => flags[key]}	
		else	
			$reps[key] = {:id => $reps[key][:id]} 
		end

		$reps[key][:id]}.each do |k|
			replua.puts "\tself:addLookupList(RepDB, #{$reps[k][:id]}, BFAC[\"#{k}\"]) -- Acquire Flag: #{$reps[k][:flag]}"

	end

	# File footer
	replua.puts "\nend"
	replua.close

end

# Creates a database file for the specific recipe
# TODO: Optimize the code for this function

def create_profession_db(file,profession,db,maps,funcstub,recipes,ignorerecipe,specialcase,wrathignore)

	factionlevels = {"Neutral"	=> 0,"Friendly" => 1,"Honored"	=> 2,"Revered"	=> 3,"Exalted"	=> 4}
	classes = {"Deathknight" => 21,"Druid" => 22,"Hunter" => 23,"Mage"=> 24,"Paladin"=>25,"Priest"=>26,"Shaman"=>27,"Rogue"=> 28,"Warlock"=>29,"Warrior"=>30}
	weapons = {"One-Hand" =>66, "Two-Handed" =>67,"Axe" => 68,"Sword" => 69,"Mace"=> 70, "Polearm" => 71, "Dagger"=> 72,"Staff"=> 73,"Wand"=> 74, "Thown"=>75, "Bow"=> 76,"Crossbow"=>77,"Ammo"=>78,"Fist"=>79}
	armors = {"Cloth"=>56,"Leather"=>57,"Mail"=> 58,"Plate"=>59,"Cloak"=>60,"Neck"=>61,"Ring"=>62,"Trinket"=>63,"Shield"=> 64}

	puts "Generating #{profession} database -- #{recipes.length} recipes found."

	puts "Obtaining #{profession} data.  This may take a while..."

	count = 0

	#sort the keys and populate each recipe details
	ordered_keys = recipes.keys.sort_by do |name|

		if count == 50

			print "\n"
			count = 0

		end

		print "."

		count = count + 1
		STDOUT.flush
		db.add_recipe_details(recipes[name])
		recipes[name][:spellid]

	end

	proflua = File.open(file, "w")

	profheader =<<EOF
--[[

************************************************************************

#{file[11..-1]}

#{profession} data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
#{recipes.length} found from data mining.
#{ignorerecipe.length} ignored.
#{wrathignore.length} WotLK ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addTradeSkill(RecipeDB, Spell ID, Skill Level, Item ID, Rarity, Specialty)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:#{funcstub}(RecipeDB)

	local recipecount = 0

EOF

	proflua.puts profheader
	print "\n"
	STDOUT.flush
	puts "Processing #{profession} data..."

	flags = Array.new
	acquire = Array.new

	# Parse through all the keys
	ordered_keys.each do |name|

		details = recipes[name]
		proflua.puts "\t-- #{name} -- #{details[:spellid]}"

		details[:method].split(",").each do |method|

			case method

			# trainers
			when 'taught-by'

				data = details[:method_trainers]

				flags << 3

				if details[:learned] == 1

					flags << 1 << 2
					proflua.puts("\t-- Default profession that you learn when picking up a profession, no reason to get acquire information for it.")

				else

					# Parse all the NPC's
					data.each do |npc|

						unless npc[:id] == 0

							acquire << { "type" => 1, "id" => npc[:id] }
							$trainers[npc[:id]] = {:name => npc[:name]}

							unless npc[:react].nil?

								# NPC React Flags:
								# 1 = friendly
								# 2 = neutral
								# 3 = hostile

								# ARL Flags:
								# 0 = neutral
								#  1 = Alliance
								# 2 = Horde

								react_a = npc[:react][0].nil? ? 0 : npc[:react][0]
								react_h = npc[:react][1].nil? ? 0 : npc[:react][1]

								if react_a < 3
									flags << 1
								end

								if react_h < 3
									flags << 2
								end

								$trainers[npc[:id]][:faction] = react_h < 3 && react_a < 3 ? 0 : react_h == 3 && react_a < 3 ? 1 : react_a == 3 && react_h < 3 ? 2 : 0

							else

								flags << 1 << 2

							end

						end

					end

				end

				proflua.puts "\t-- Trainer"

			# vendors
			when 'sold-by'

				flags << 4
				data = details[:method_vendors]
			
				# Reputation vendor
				unless details[:faction].nil?

					proflua.puts "\t-- #{details[:faction]} - #{details[:faction_level]}"
					flags << $reps[details[:faction]][:flag]

					data.each do |npc|

						unless npc[:id] == 0

							acquire << {"type" => 6, "id" => npc[:id], "faction" => $reps[details[:faction]][:id],"factionlevel" => (factionlevels.has_key?(details[:faction_level]) ? factionlevels[details[:faction_level]] : details[:faction_level])}
							$vendors[npc[:id]] = {:name => npc[:name]}

							unless npc[:react].nil?

								react_a = npc[:react][0].nil? ? 0 : npc[:react][0]
								react_h = npc[:react][1].nil? ? 0 : npc[:react][1]

								if react_a < 3
									flags << 1
								end

								if react_h < 3
									flags << 2
								end

								$vendors[npc[:id]][:faction] = react_h < 3 && react_a < 3 ? 0 : react_h == 3 && react_a < 3 ? 1 : react_a == 3 && react_h < 3 ? 2 : 0

							else

								flags << 1 << 2

							end

							if npc[:locs]

								npc[:locs].each do |loc|

									if $dungeons[loc]

										flags << 5
										proflua.puts "\t-- Instance: #{loc} - #{$dungeons[loc]}"

									end

									if $raids[loc]

										flags << 6
										proflua.puts "\t-- Raid: #{loc} - #{$raids[loc][:name]}"

									end

								end

							else

								proflua.puts "\t-- No location information"

							end

						end

					end

				# Normal vendor
				else

					data.each do |npc|

						unless npc[:id] == 0

							acquire << {"type" => 2, "id" => npc[:id]}
							$vendors[npc[:id]] = {:name => npc[:name]}

							unless npc[:react].nil?

								react_a = npc[:react][0].nil? ? 0 : npc[:react][0]
								react_h = npc[:react][1].nil? ? 0 : npc[:react][1]

								if react_a < 3
									flags << 1
								end

								if react_h < 3
									flags << 2
								end

								$vendors[npc[:id]][:faction] = react_h < 3 && react_a < 3 ? 0 : react_h == 3 && react_a < 3 ? 1 : react_a == 3 && react_h < 3 ? 2 : 0

							else

								flags << 1 << 2

							end

							if npc[:locs]

								npc[:locs].each do |loc|

									if $dungeons[loc]

										flags << 5
										proflua.puts "\t-- Instance: #{loc} - #{$dungeons[loc]}"

									end

									if $raids[loc]

										flags << 6
										proflua.puts "\t-- Raid: #{loc} - #{$raids[loc][:name]}"

									end

								end

							else

								proflua.puts "\t-- No location information"

							end

						end

					end

				end

				proflua.puts "\t-- Vendor"

			# Mob drops
			when 'dropped-by'

				data = details[:method_drops]
				# Cheat and say that it's both horde/alliance
				flags << 1 << 2

				# Instance, mob, or raid drop
				unless data.length > 10

					data.each do |npc|

						unless npc[:id] == 0

							acquire << {"type" => 3, "id" => npc[:id]}
							$monsters[npc[:id]] = {:name => npc[:name]}

							if npc[:locs]

								npc[:locs].each do |loc|

									if $dungeons[loc]

										flags << 5
										proflua.puts "\t-- Instance: #{loc} - #{$dungeons[loc]}"

									elsif $raids[loc]

										flags << 6
										proflua.puts "\t-- Raid: #{loc} - #{$raids[loc][:name]}"

									else

										flags << 11

									end

								end

							else

								proflua.puts "\t-- No location information"

							end

						end

					end

					proflua.puts "\t-- Mob Drop"

				# World drop
				else

					# Cheat and say that it's both horde/alliance
					flags << 1 << 2
					flags << 10
					proflua.puts "\t-- World Drop"
					acquire << {"type" => 7, "id" => details[:rarity]}

				end

			# Quest reward
			when 'rewardfrom'

				data = details[:method_quests]
				flags << 8

				data.each do |quest|

					acquire << {"type" => 4, "id" => quest[:id]}
					$quests[quest[:id]] = {:name => quest[:name]}

					if quest[:side] == 1

						flags << 1 << 2
						$quests[quest[:id]][:faction] = 0

					elsif quest[:side] == 2

						flags << 1
						$quests[quest[:id]][:faction] = 1

					elsif quest[:side] == 4

						flags << 2
						$quests[quest[:id]][:faction] = 2

					end

					quest[:questinfo] = maps.get_quest_map_info(quest[:id])

					if quest[:questinfo]

						quest[:questinfo][:quest_zones].values do |loc|

							if $dungeons[loc]

								flags << 5
								proflua.puts "\t-- Instance: #{loc} - #{$dungeons[loc][:name]}"

							end

							if $raids[loc]

								flags << 6
								proflua.puts "\t-- Raid: #{loc} - #{$raids[loc][:name]}"

							end

						end

					else

						proflua.puts "\t-- No location information"

					end

				end

				proflua.puts "\t-- Quest Reward"

			end

		end

		proflua.print("\t-- Flags: ")

		# Add class flags

		if details[:classes].nil?

			flags << 21 << 22 << 23 << 24 << 25 << 26 << 27 << 28 << 29 << 30
			proflua.print("All classes, ")

		else

			details[:classes].split(",").each do |ctype|

				if classes.has_key?(ctype)

					flags << classes[ctype]
					proflua.print("#{ctype}, ")

				end

			end

		end

		# Add item and recipe BoE/BoP/BoA flags

		if details[:item_binds] == "BOE"

			proflua.print("Item BoE, ")
			flags << 36

		end

		if details[:item_binds] == "BOP"

			proflua.print("Item BoP, ")
			flags << 37

		end

		if details[:item_binds] == "BOA"

			proflua.print("Item BoA, ")
			flags << 38

		end

		if details[:recipe_binds] == "BOE"

			proflua.print("Recipe BoE, ")
			flags << 40

		end

		if details[:recipe_binds] == "BOP"

			proflua.print("Recipe BoP, ")
			flags << 41

		end

		if details[:recipe_binds] == "BOA"

			proflua.print("Recipe BoA, ")
			flags << 42

		end

		# Add weapon flags

		if details[:is_weapon]

			proflua.print("Weapon, ")
			flags << 46

			unless details[:weapon_hands].nil?

				proflua.print("#{details[:weapon_hands]}, ")
				flags << weapons[details[:weapon_hands]]

			end

			unless details[:weapon_slot].nil?

				proflua.print("#{details[:weapon_slot]}, ")
				flags << weapons[details[:weapon_slot]]

			end

		end

		# Add armor flags

		if details[:is_armor]

			proflua.print("Armor, ")
			flags << 47

			unless details[:armor_type].nil?

				proflua.print("#{details[:armor_type]}, ")
				flags << armors[details[:armor_type]]

			end

		end

		if specialcase[details[:spellid]]

			case specialcase[details[:spellid]][:id]

			when 7

				proflua.print("Seasonal, ")
				flags << 7
				acquire << {"type" => 5, "id" => specialcase[details[:spellid]][:type]}

			when 9

				proflua.print("PVP, ")
				flags << 9

			when 12

				proflua.print("Discovery, ")
				flags << 1 << 2 << 12
				flags.delete(3)
				flags.delete(4)
				flags.delete(5)
				flags.delete(6)

			when "meleedps"

				flags << 51

			when "Alliance"

				flags << 1

			when "Horde"

				flags << 2

			when "class"

				proflua.print("SC Class, ")
				flags.delete(21)
				flags.delete(22)
				flags.delete(23)
				flags.delete(24)
				flags.delete(25)
				flags.delete(26)
				flags.delete(27)
				flags.delete(28)
				flags.delete(29)
				flags.delete(30)
				flags.concat(specialcase[details[:spellid]][:type])

			when "specialty"

				if not details[:specialty]

					details[:specialty] = specialcase[details[:spellid]][:type]

				else

					proflua.print("\n\t-- Warning: Manually overriding specialty for a recipe that already has one.\n\t--")

				end

			end

		end

		# Item Stats:
		# :item_stats => [{:val=>x, id=> y}]

		unless details[:item_stats] == nil

			proflua.print("\n\t-- Item Stats: ")

			stats = {}

			details[:item_stats].each do |s|

				stats[s[:id]] = s[:val]

			end

			# 51 = Physical DPS (melee/hunters)
			# 52 = Tanking
			# 53 = Healing
			# 54 = Caster DPS

			# We have tanking type stats
			if stats[26] or stats[27] or stats[28] or stats[31]

				proflua.print("Tanking, ")
				flags << 52

			end

			# Spell hit or spell penetration
			if stats[21] or stats[23]

				proflua.print("Caster DPS, ")
				flags << 54

			end

			# We have a spell damage and healing stat
			if stats[19] and stats[20]

				# If healing is higher than spell damage
				if stats[20] > stats[19]

					if not stats[26] or not stats[27] or not stats[28] or not stats[31]

						proflua.print("Healing, ")
						flags << 53

					end

				else

					proflua.print("Caster DPS, ")
					flags << 54

				end

			end

		end

		proflua.puts "\n\t-- Item Stats: #{details[:item_stats]}\n"

		if ignorerecipe.include?(details[:spellid]) or wrathignore.include?(details[:spellid])

			proflua.print("\t--")

		else

			proflua.print("\t")

		end

		proflua.puts "recipecount = recipecount + 1"

		if ignorerecipe.include?(details[:spellid]) or wrathignore.include?(details[:spellid])

			proflua.print("\t--")

		else

			proflua.print("\t")

		end

# TODO: Make it so that if a certain parameter is blank, add a default value of nil into it and a comment so that it compiles properly
		if details[:specialty]

			proflua.puts "-- Recipe Specialty of #{details[:specialty]}"
			proflua.print("\t")

			if details[:produces]

				proflua.puts "self:addTradeSkill(RecipeDB, #{details[:spellid]}, #{details[:learned]}, #{details[:produces].first}, #{details[:rarity]}, #{$proftable[profession]}, #{details[:specialty]})"

			else

				# This trade skill entry does not produce anything (ie: enchanting) so we nil the item ID and set the rarity to be 1 (common).
				proflua.puts "self:addTradeSkill(RecipeDB, #{details[:spellid]}, #{details[:learned]}, nil, 1, #{$proftable[profession]}, #{details[:specialty]})"

			end

		else

			if details[:produces]

				proflua.puts "self:addTradeSkill(RecipeDB, #{details[:spellid]}, #{details[:learned]}, #{details[:produces].first}, #{details[:rarity]}, #{$proftable[profession]})"

			else

				# This trade skill entry does not produce anything (ie: enchanting) so we nil the item ID and set the rarity to be 1 (common).
				proflua.puts "self:addTradeSkill(RecipeDB, #{details[:spellid]}, #{details[:learned]}, nil, 1, #{$proftable[profession]})"

			end

		end

		# Compress, remove duplicates and sort the list of flags
		flags.compact!
		flags.uniq!
		flags.sort!

		if flags.length == 0

			proflua.puts "\t-- No filter flags"

		else

			if ignorerecipe.include?(details[:spellid]) or wrathignore.include?(details[:spellid])

				proflua.print("\t--")

			else

				proflua.print("\t")

			end

			proflua.puts "self:addTradeFlags(RecipeDB, #{details[:spellid]}, #{flags.join(",")})"

		end

		flags.clear

        # acquire info  
		if acquire.length == 0 

			proflua.puts "\t-- No acquire information"

		else

			acquiredordered = acquire.sort_by { |entry| entry["id"] }

			temp = []

			for id in %w(5 7 3 4 1 2 6)

				for entry in acquiredordered.select { |entry| entry["type"] == id.to_i }

					temp << [entry["type"],entry["faction"],entry["factionlevel"],entry["id"]].compact

				end

			end 

			temp.flatten!

			if ignorerecipe.include?(details[:spellid]) or wrathignore.include?(details[:spellid])

				proflua.print("\t--")

			else

				proflua.print("\t")

			end


			proflua.puts "self:addTradeAcquire(RecipeDB, #{details[:spellid]}, #{temp.join(", ")})"

		end
	 
		acquire.clear  

		proflua.puts ""

	end

	puts "Processing #{profession} data complete..."

	proflua.puts "\treturn recipecount\n\nend"
	proflua.close

end

# Creates the lookup table for trainer/vendor/quest/mobs

def create_lookup_db(file,type,db,funcstub,list,maps,ignorelist)

	puts "Generating #{type} file .. #{list.length} entries to process"
	lookup_lua = File.open(file, "w")

# TODO: Different headers depending on type (ie: trainer would not have the line BFAC in it for example)
	header =<<EOF
--[[

************************************************************************

#{file[11..-1]}

#{type} data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

#{list.length} found from data mining.  #{ignorelist.length} ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(#{db}, NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:#{funcstub}(#{db})

EOF

	lookup_lua.puts header

	count = 0

	puts "Obtaining #{type} data.  This may take a while..."

	# Sort the output
	sorted_keys = list.keys.sort_by do |k| k end

	sorted_keys.each do |k|
		v = list[k]

		if count == 50

			print "\n"
			count = 0

		end

		if type == "Quest"

			locs = maps.get_npc_locations(maps.get_quest_map_info(k)[:quest_starter])

		else

			locs = maps.get_npc_locations(k)

		end

		first_map = locs.values.first

		if first_map.nil?

			first_map = [[0,0]]

		end

		print "."
		count = count + 1
		STDOUT.flush

		# Ignore any ID with a value of 0 as it's invalid
		if k != 0

			if ignorelist.include?(k)

				lookup_lua.print("\t--")

			else

				lookup_lua.print("\t")

			end

			x,y = maps.average_location(first_map)
			# just grab the first 4 digits
			x = x.to_s[0..4]
			y = y.to_s[0..4]

			# Don't care about faction information for Monsters
			if type == "Monster"

				# Assumption that ID and Name will always be around
				lookup_lua.print("self:addLookupList(#{db}, #{k}, ")

				if $bosslist.include?(v[:name])

					lookup_lua.print("BBOSS[\"#{v[:name]}\"], ")
					$localstring.delete(v[:name])

				else

					lookup_lua.print("L[\"#{v[:name]}\"], ")
					# Add the name to the list of localization strings
					$localstring << v[:name]

				end

				if locs.keys[0]

					lookup_lua.print("BZONE[\"#{locs.keys[0]}\"], ")

				else

					if $bosszonemap[v[:name]]

						lookup_lua.print("BZONE[\"#{$bosszonemap[v[:name]]}\"], ")

					else

						lookup_lua.print("L[\"Unknown Zone\"], ")

					end

				end

				if x and y

					lookup_lua.print("#{x}, #{y})")

				else

					lookup_lua.print("0, 0)")

				end

				lookup_lua.print("\n")

			else

				# Assumption that ID and Name will always be around
				lookup_lua.print("self:addLookupList(#{db}, #{k}, L[\"#{v[:name]}\"], ")

				if locs.keys[0]

					lookup_lua.print("BZONE[\"#{locs.keys[0]}\"], ")

				else

					lookup_lua.print("L[\"Unknown Zone\"], ")

				end

				if x and y

					lookup_lua.print("#{x}, #{y}, ")

				else

					lookup_lua.print("0, 0, ")

				end

				# If not faction assume it's neutral
				if v[:faction]

					lookup_lua.print("#{v[:faction]})")

				else

					lookup_lua.print("0)")

				end
				lookup_lua.print("\n")

				# Add the name to the list of localization strings
				$localstring << v[:name]

			end

		end

	end

	puts "\nProcessing #{type} data complete..."

	lookup_lua.puts "\nend"
	lookup_lua.close
	print "\n"
	STDOUT.flush

end

recipes = WoWDBRecipes.new
maps = WoWDBMaps.new

$dungeons = maps.get_dungeon_maps
$raids = maps.get_raid_maps

create_faction_db()

$proftable = {"Alchemy" 			=> 2259,
				"Blacksmithing" 	=> 2018,
				"Cooking"			=> 2550,
				"Enchanting"		=> 7411,
				"Engineering"		=> 4036,
				"First Aid"			=> 746,
				"Leatherworking"	=> 2108,
				"Smelting"			=> 2575,
				"Tailoring"			=> 3908,
				"Jewelcrafting"		=> 25229,
				"Inscription"		=> 45357,
				"Runeforging"		=> 28481
				}

$bosslist = ["Anetheron","Archimonde","Azuregos","Baron Geddon","Baron Rivendare",
	"Chrono Lord Deja","Emeriss","Emperor Vek\'nilash","Garr","Gehennas","Golem Lord Argelmach",
	"Golemagg the Incinerator","Goraluk Anvilcrack","Gyth","Hex Lord Malacrass","High Botanist Freywinn",
	"Hydromancer Thespia","Ras Frostwhisper","Onyxia","General Drakkisath","Balnazzar","Cannon Master Willey",
	"Magmadar","Shazzrah","Lord Kazzak","Pusillin","Darkmaster Gandling","Mijan","Pyromancer Loregrain",
	"Lord Roccor","Overmaster Pyron","Grizzle","Ribbly Screwspigot","Attumen the Huntsman","Halazzi","Akil'zon",
	"Nalorakk","Jan'alai","Zul'jin","Theka the Martyr","Plugger Spazzring","Bannok Grimaxe","Quartermaster Zigris",
	"Solakar Flamewreath","Maleki the Pallid","Mekgineer Thermaplugg","Magister Kalendris","Attumen the Huntsman",
	"Moroes","Terestian Illhoof","Shade of Aran","Rage Winterchill","Mekgineer Steamrigger","Warlord Kalithresh",
	"Anetheron","Azgalor","Captain Skarloc","Kaz'rogal","Mennu the Betrayer","Thorngrin the Tender","Warp Splinter",
	"Epoch Hunter","Blackheart the Inciter","Pathaleon the Calculator","Mechano-Lord Capacitus","Nethermancer Sepethrea",
	"Dalliah the Doomsayer"]

$bosszonemap = {
	"Magmadar" => "Molten Core",
	"Golemagg the Incinerator" => "Molten Core",
	"Baron Geddon" => "Molten Core",
	"Garr" => "Molten Core",
	"Shazzrah" => "Molten Core",
	"Lucifron" => "Molten Core",
	"Lord Kazzak" => "Hellfire Peninsula",
	"Rift Keeper" => "The Black Morass",
	"Halazzi" => "Zul'Aman",
	"Akil'zon" => "Zul'Aman",
	"Nalorakk" => "Zul'Aman",
	"Jan'alai" => "Zul'Aman",
	"Zul'jin" => "Zul'Aman",
	"Hex Lord Malacrass" => "Zul'Aman",
	"Shadowsword Lifeshaper" => "Sunwell Plateau",
	"Scarlet Sorcerer" => "Scarlet Monestary",
	"Scarlet Defender" => "Scarlet Monestary",
	"Scarlet Monastery" => "Scarlet Monestary",
	"Scarlet Myrmidon" => "Scarlet Monestary",
	"Scarlet Chaplain" => "Scarlet Monestary",
	"Scarlet Wizard" => "Scarlet Monestary",
	"Mekgineer Thermaplugg" => "Gnomergan",
	"Scarab" => "Zul'Farrak",
	"Theka the Martyr" => "Zul'Farrak",
	"Sul'lithuz Broodling" => "Zul'Farrak",
	"Overmaster Pyron" => "Searing Gorge",
	"Spirestone Battle Mage" => "Blackrock Spire",
	"Spirestone Warlord" => "Blackrock Spire",
	"Firebrand Grunt" => "Blackrock Spire",
	"Blackhand Assassin" => "Blackrock Spire",
	"Firebrand Invoker" => "Blackrock Spire",
	"Plugger Spazzring" => "Blackrock Depths",
	"Ribbly Screwspigot" => "Blackrock Depths",
	"Bannok Grimaxe" => "Blackrock Spire",
	"Quartermaster Zigris" => "Blackrock Spire",
	"Solakar Flamewreath" => "Blackrock Spire",
	"Gyth" => "Blackrock Spire",
	"General Drakkisath" => "Blackrock Spire",
	"Ghoul Ravener" => "Stratholme",
	"Crypt Crawler" => "Stratholme",
	"Crimson Battle Mage" => "Stratholme",
	"Crimson Inquisitor" => "Stratholme",
	"Baron Rivendare" => "Stratholme",
	"Scholomance Adept" => "Scholomance",
	"Balnazzar" => "Stratholme",
	"Goraluk Anvilcrack" => "Blackrock Spire",
	"Gurubashi Champion" => "Zul'Gurub",
	"Razzashi Broodwidow" => "Zul'Gurub",
	"Arcane Aberration" => "Dire Maul",
	"Magister Kalendris" => "Dire Maul",
	"Cruelfin" => "Bloodmyst Isle",
	"Attumen the Huntsman" => "Karazhan",
	"Moroes" => "Karazhan",
	"Terestian Illhoof" => "Karazhan",
	"Coldmist Widow" => "Karazhan",
	"Phantom Attendant" => "Karazhan",
	"Phantom Valet" => "Karazhan",
	"Phantom Guest" => "Karazhan",
	"Night Mistress" => "Karazhan",
	"Phantom Stagehand" => "Karazhan",
	"Syphoner" => "Karazhan",
	"Arcane Protector" => "Karazhan",
	"Shade of Aran" => "Karazhan",
	"Spell Shade" => "Karazhan",
	"Fleshbeast" => "Karazhan",
	"Rage Winterchill" => "Mount Hyjal",
	"Kaz'rogal" => "Mount Hyjal",
	"Anetheron" => "Mount Hyjal",
	"Azgalor" => "Mount Hyjal",
	"Archimonde" => "Mount Hyjal",
	"Durnholde Sentry" => "Old Hillsbrad Foothills",
	"Durnholde Rifleman" => "Old Hillsbrad Foothills",
	"Rift Lord" => "The Black Morass",
	"Captain Skarloc" => "Old Hillsbrad Foothills",
	"Blackheart the Inciter" => "Shadow Labrynth",
	"Pathaleon the Calculator" => "The Mechanar",
	"Mechano-Lord Capacitus" => "The Mechanar",
	"Bloodwarder Squire" => "Tempest Keep",
	"Arcatraz Sentinel" => "The Arcatraz",
	"Eredar Deathbringer" => "The Arcatraz",
	"Dalliah the Doomsayer" => "The Arcatraz",
	"Gargantuan Abyssal" => "The Arcatraz",
	"Unchained Doombringer" => "The Arcatraz",
	"Twilight Drakonaar" => "The Arcatraz",
	"Greyheart Tidecaller" => "Serpentshrine Cavern",
	"Coilfang Serpentguard" => "Serpentshrine Cavern",
	"Bonechewer Blade Fury" => "Black Temple",
}

# Manual entries to the vendor, etc list
$vendors[15165] = {:name => "Haughty Modiste"}
$vendors[15165][:faction] = 3
$quests[2756] = {:name => "The Old Ways"}
$quests[2756][:faction] = 2

$debug = false

if $debug

	firstaid = recipes.get_firstaid_list
	faspecaillist = {
		27033 => {:id => 12},
		27032 => {:id => 7, :type => 1}
		}
	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],faspecaillist,[45545, 45546, 51801])

	#create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

else

	alchemy = recipes.get_alchemy_list
	alchspeciallist = {
		28583 => {:id => 12},
		28580 => {:id => 12},
		28584 => {:id => 12},
		28585 => {:id => 12},
		28582 => {:id => 12},
		28581 => {:id => 12},
		28587 => {:id => 12},
		28588 => {:id => 12},
		28589 => {:id => 12},
		28590 => {:id => 12},
		28591 => {:id => 12},
		28586 => {:id => 12},
		41458 => {:id => 12},
		41500 => {:id => 12},
		41501 => {:id => 12},
		41502 => {:id => 12},
		41503 => {:id => 12},
		21923 => {:id => 7, :type => 1},
		47050 => {:id => "meleedps"},
		}
	create_profession_db("./RecipeDB/ARL-Alchemy.lua","Alchemy",recipes,maps,"InitAlchemy",alchemy,[2336,6619,11447,17579,22430],alchspeciallist,[53771,53773,53774,53775,53776,53777,53779,53780,53781,53782,53783,53784,53812,53836,53837,53838,53839,53840,53841,53842,53847,53895,53899,53905])

	blacksmithing = recipes.get_blacksmithing_list
	bsspeciallist = {
		21913 => {:id => 7, :type => 1},
		}
	# Special reps: Icebane Bracers (28244), Icebane Gauntlets (226700, Icebane Breastplate (28242) <-- unobtainable (AD Naxx)
	create_profession_db("./RecipeDB/ARL-BlackSmith.lua","Blacksmithing",recipes,maps,"InitBlacksmithing",blacksmithing,[2671,8366,8368,9942,9957,16960,16965,16967,16980,16986,16987],bsspeciallist,[52567,52568,52569,52570,52571,52572])

	cooking = recipes.get_cooking_list
	cookingspeciallist = {
		21143 => {:id => 7, :type => 1},
		21144 => {:id => 7, :type => 1},
		45022 => {:id => 7, :type => 1}
		}
	create_profession_db("./RecipeDB/ARL-Cook.lua","Cooking",recipes,maps,"InitCooking",cooking,[30047],cookingspeciallist,[44438, 45547, 45559,45571, 53056])

	enchanting = recipes.get_enchanting_list
	enchantingspeciallist = {
		21931 => {:id => 7, :type => 1},
		46578 => {:id => 7, :type => 4}
		}
	create_profession_db("./RecipeDB/ARL-Enchant.lua","Enchanting",recipes,maps,"InitEnchanting",enchanting,[22434,28021],enchantingspeciallist,[27958,47672,44558,44613,44632,44633,44634,44635,44636,44637,44638,44645,47898,47899,47901,44582,44584,44588,44589,44590,44591,44592,44595,44596,44597,44598,44612,44613,44616,44621,44623,44625,44629,44630,44631,44529,44555,44556,44528,44524,44513,44483,44484,44488,44489,44492,44494,44496,44497,44500,44506,44508,44509,44510,44575])

	eng = recipes.get_engineering_list
	engspecaillist = {
		21940 => {:id => 7, :type => 1},
		26416 => {:id => 7, :type => 2},
		26417 => {:id => 7, :type => 2},
		26418 => {:id => 7, :type => 2},
		26420 => {:id => 7, :type => 2},
		26421 => {:id => 7, :type => 2},
		26422 => {:id => 7, :type => 2},
		26423 => {:id => 7, :type => 2},
		26424 => {:id => 7, :type => 2},
		26425 => {:id => 7, :type => 2},
		26426 => {:id => 7, :type => 2},
		26427 => {:id => 7, :type => 2},
		26428 => {:id => 7, :type => 2},
		26442 => {:id => 7, :type => 2},
		26443 => {:id => 7, :type => 2},
		40274 => {:id => "class", :type => [25, 30]},
		41311 => {:id => "class", :type => [25]},
		41312 => {:id => "class", :type => [25, 30]},
		41314 => {:id => "class", :type => [23, 27]},
		41315 => {:id => "class", :type => [27]},
		41316 => {:id => "class", :type => [27]},
		41317 => {:id => "class", :type => [22, 28]},
		41318 => {:id => "class", :type => [22]},
		41319 => {:id => "class", :type => [22]},
		41320 => {:id => "class", :type => [24, 26, 29]},
		41321 => {:id => "class", :type => [26]},
		8895 => {:id => "specialty", :type => 20222},
		12715 => {:id => "specialty", :type => 20222},
		12716 => {:id => "specialty", :type => 20222},
		12717 => {:id => "specialty", :type => 20222},
		12718 => {:id => "specialty", :type => 20222},
		12754 => {:id => "specialty", :type => 20222},
		12755 => {:id => "specialty", :type => 20222},
		12758 => {:id => "specialty", :type => 20222},
		12759 => {:id => "specialty", :type => 20219},
		12760 => {:id => "specialty", :type => 20222},
		12895 => {:id => "specialty", :type => 20219},
		12897 => {:id => "specialty", :type => 20219},
		12899 => {:id => "specialty", :type => 20219},
		12902 => {:id => "specialty", :type => 20219},
		12903 => {:id => "specialty", :type => 20219},
		12905 => {:id => "specialty", :type => 20219},
		12906 => {:id => "specialty", :type => 20219},
		12907 => {:id => "specialty", :type => 20219},
		12908 => {:id => "specialty", :type => 20222},
		13240 => {:id => "specialty", :type => 20222},
		15633 => {:id => "specialty", :type => 20219},
		15628 => {:id => "specialty", :type => 20222},
		30558 => {:id => "specialty", :type => 20222},
		30560 => {:id => "specialty", :type => 20222},
		30568 => {:id => "specialty", :type => 20219},
		30570 => {:id => "specialty", :type => 20219},
		}
	create_profession_db("./RecipeDB/ARL-Engineer.lua","Engineering",recipes,maps,"InitEngineering",eng,[30343,30342,30349,30561,30549,12722,12720,12900,12719,12904],engspecaillist,[53280,53281])

	firstaid = recipes.get_firstaid_list
	faspecaillist = {
		}
	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],faspecaillist,[45545, 45546, 51801])

	inscription = recipes.get_inscription_list
	insspecaillist = {
		}
	create_profession_db("./RecipeDB/ARL-Inscription.lua","Inscription",recipes,maps,"InitInscription",inscription,[50598,50599,50600,50601,50602,50605,50606,50607,50608,50609,50612,50614,50616,50617,50618],insspecaillist,[])

	jewelcrafting = recipes.get_jewelcrafting_list
	jcspecaillist = {
		31101 => {:id => 9},
		43493 => {:id => 9}
		}
	create_profession_db("./RecipeDB/ARL-Jewelcraft.lua","Jewelcrafting",recipes,maps,"InitJewelcrafting",jewelcrafting,[25614,26918,26920,32810],jcspecaillist,(53830..54023).to_a)

	leatherworking = recipes.get_leatherworking_list
	lwspecaillist = {
		21943 => {:id => 7, :type => 1},
		44953 => {:id => 7, :type => 1}
		}
	create_profession_db("./RecipeDB/ARL-LeatherWork.lua","Leatherworking",recipes,maps,"InitLeatherworking",leatherworking,[8195,15141,10550,19106,40000],lwspecaillist,(50935..53690).to_a)

	smelting = recipes.get_mining_list
	smeltingspecaillist = {
		}
	create_profession_db("./RecipeDB/ARL-Smelt.lua","Smelting",recipes,maps,"InitSmelting",smelting,[],smeltingspecaillist,[49252, 49258, 53417])

	tailoring = recipes.get_tailoring_list
	tailoringspecaillist = {
		}
	create_profession_db("./RecipeDB/ARL-Tailor.lua","Tailoring",recipes,maps,"InitTailoring",tailoring,[7636,12062,12063,12068,12083,12087,12090],tailoringspecaillist,[])

	create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])

	create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])

	create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])

	create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

end

puts "\nGenerating Local file .. #{$localstring.length} strings to process"

$localstring.compact!
$localstring.uniq!
$localstring.sort!

# TODO: Can I open the current file and just remove some text and append this to it?
local_lua = File.open("./Locals/LocalStrings-enUS.lua", "w")

local_lua.puts "\t-- Do not translate anything below this line without talking to Ackis first please."

$localstring.each do |k|

	local_lua.puts "L[\"#{k}\"] = true"

end

local_lua.puts "\n"
local_lua.close

puts ""
puts "Finished processing run time was #{((Time.now).to_i-generator_start.to_i)} seconds"