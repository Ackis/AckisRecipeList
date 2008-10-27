=begin

****************************************************************************************

ARLDataminer.rb

Datamining for all of AckisRecipeList

File $Date$
File Revision: $Rev$
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

\$Date: \$
\$Rev: \$

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

def create_profession_db(file,profession,db,maps,funcstub,recipes,ignorerecipe,pvplist,discoverylist,seasonallist,wrathignore,specialhandling)

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

\$Date: \$
\$Rev: \$

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

		if details[:is_armor]

			proflua.print("Armor, ")
			flags << 47

			unless details[:armor_type].nil?

				proflua.print("#{details[:armor_type]}, ")
				flags << armors[details[:armor_type]]

			end

		end

		if pvplist.include?(details[:spellid])

			proflua.print("PVP, ")
			flags << 9

		end

		if discoverylist.include?(details[:spellid])

			proflua.print("Discovery, ")
			flags << 12

		end

		if seasonallist[details[:spellid]] then

			proflua.print("Seasonal, ")
			flags << 7
			acquire << {"type" => 5, "id" => seasonallist[details[:spellid]]}

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

\$Date: \$
\$Rev: \$

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

				end

				if locs.keys[0]

					lookup_lua.print("BZONE[\"#{locs.keys[0]}\"], ")

				else

					lookup_lua.print("L[\"Unknown Zone\"], ")

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

			end

			# Add the name to the list of localization strings
			$localstring << v[:name]

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

$bosslist = ["Ras Frostwhisper","Onyxia","Gyth","General Drakkisath","Balnazzar","Goraluk Anvilcrack","Cannon Master Willey","Magmadar","Garr","Golemagg the Incinerator","Gehennas","Shazzrah","Lord Kazzak","Pusillin","Darkmaster Gandling","Mijan","Azuregos","Golem Lord Argelmach","Pyromancer Loregrain","Lord Roccor","Overmaster Pyron","Grizzle","Ribbly Screwspigot","Attumen the Huntsman"]

#TODO: for these functions, how can I do it so I can set a debug parameter which would only cause First Aid to run?

$debug = false

if $debug

	firstaid = recipes.get_firstaid_list
	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],[],[],{},[45545, 45546, 51801],{})

	create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])

	create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])

	create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])

	create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

else

	# Discovery: 28583, 28580, 28584, 28585, 28582, 28581, 28587, 28588, 28589, 28590, 28591, 28586, 41458, 41500, 41501, 41502, 41503
	# Seasonal: 21923 - 1
	alchemy = recipes.get_alchemy_list
	create_profession_db("./RecipeDB/ARL-Alchemy.lua","Alchemy",recipes,maps,"InitAlchemy",alchemy,[2336,6619,11447,17579,22430],[],[28583, 28580, 28584, 28585, 28582, 28581, 28587, 28588, 28589, 28590, 28591, 28586, 41458, 41500, 41501, 41502, 41503],{21923 => 1},[53771,53773,53774,53775,53776,53777,53779,53780,53781,53782,53783,53784,53812,53836,53837,53838,53839,53840,53841,53842,53847,53895,53899,53905],{})

	# Seasonal: 21913 - 1
	blacksmithing = recipes.get_blacksmithing_list
	create_profession_db("./RecipeDB/ARL-BlackSmith.lua","Blacksmithing",recipes,maps,"InitBlacksmithing",blacksmithing,[],[],[],{21913 => 1},[52567,52568,52569,52570,52571,52572],{})

	# Seasonal: 21143 - 1, 21144 - 1, 45022 - 1
	cooking = recipes.get_cooking_list
	create_profession_db("./RecipeDB/ARL-Cook.lua","Cooking",recipes,maps,"InitCooking",cooking,[30047],[],[],{21143 => 1,21144 => 1,45022 => 1},[44438, 45547, 45559,45571, 53056],{})

	# Seasonal: 21931 - 1, 46578 - 4
	enchanting = recipes.get_enchanting_list
	create_profession_db("./RecipeDB/ARL-Enchant.lua","Enchanting",recipes,maps,"InitEnchanting",enchanting,[22434,28021],[],[],{21931 => 1, 46578 => 4},[27958,47672,44558,44613,44632,44633,44634,44635,44636,44637,44638,44645,47898,47899,47901,44582,44584,44588,44589,44590,44591,44592,44595,44596,44597,44598,44612,44613,44616,44621,44623,44625,44629,44630,44631,44529,44555,44556,44528,44524,44513,44483,44484,44488,44489,44492,44494,44496,44497,44500,44506,44508,44509,44510,44575],{})

	# Seasonal: 21940 - 1, 26416, 26417, 26418, 26420, 26421, 26422, 26423, 26424, 26425, 26442, 26426, 26427, 26428, 26443 - 2
	eng = recipes.get_engineering_list
	create_profession_db("./RecipeDB/ARL-Engineer.lua","Engineering",recipes,maps,"InitEngineering",eng,[],[],[],{21940 => 1,26416 => 2,26417 => 2,26418 => 2,26420 => 2,26421 => 2,26422 => 2,26423 => 2,26424 => 2,26425 => 2,26426 => 2,26427 => 2,26428 => 2,26442 => 2,26443 => 2},[53280,53281],{})

	firstaid = recipes.get_firstaid_list
	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],[],[],{},[45545, 45546, 51801],{})

	inscription = recipes.get_inscription_list
	create_profession_db("./RecipeDB/ARL-Inscription.lua","Inscription",recipes,maps,"InitInscription",inscription,[50598,50599,50600,50601,50602,50605,50606,50607,50608,50609,50612,50614,50616,50617,50618],[],[],{},[],{})

	# PVP: 31101, 43493
	jewelcrafting = recipes.get_jewelcrafting_list
	create_profession_db("./RecipeDB/ARL-Jewelcraft.lua","Jewelcrafting",recipes,maps,"InitJewelcrafting",jewelcrafting,[53844],[31101, 43493],[],{},(53830..54023).to_a,{})

	# Seasonal: 21943 - 1, 44953 - 1
	leatherworking = recipes.get_leatherworking_list
	create_profession_db("./RecipeDB/ARL-LeatherWork.lua","Leatherworking",recipes,maps,"InitLeatherworking",leatherworking,[8195,15141],[],[],{21943 => 1,44953 => 1},(50935..53690).to_a,{})

	smelting = recipes.get_mining_list
	create_profession_db("./RecipeDB/ARL-Smelt.lua","Smelting",recipes,maps,"InitSmelting",smelting,[],[],[],{},[49252, 49258, 53417],{})

	# Seasonal: 21945 - 1, 44958 - 1, 44950 - 1, 26407 - 1, 26403 - 2
	tailoring = recipes.get_tailoring_list
	create_profession_db("./RecipeDB/ARL-Tailor.lua","Tailoring",recipes,maps,"InitTailoring",tailoring,[7636,12062,12063,12068,12083,12087,12090],[],[],{21945 => 1, 44958 => 1, 44950 => 1, 26407 => 1, 26403 => 2},[],{})

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

$localstring.each do |k|

	local_lua.puts "L[\"#{k}\"] = true"

end

local_lua.puts "\n"
local_lua.close

puts ""
puts "Finished processing run time was #{((Time.now).to_i-generator_start.to_i)} seconds"