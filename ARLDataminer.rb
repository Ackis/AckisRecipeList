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
$unknownzone = Array.new
$unknownfaction = Array.new
$instancemobs = Array.new
$missingdataacquire = Hash.new

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
		"Horde Expedition" => 130,
		"Frenzyheart Tribe" => 116,
		"Knights of the Ebon Blade" => 117,
		"Kirin Tor" => 118,
		"The Sons of Hodir" => 119,
		"The Kalu'ak" => 120,
		"The Oracles" => 121,
		"The Wyrmrest Accord" => 122,
		"The Silver Convenant" => 123,
		"The Sunreavers" => 124,
		"Explorers' League" => 125,
		"Valiance Expedition" => 126,
		"The Hand of Vengeance" => 127,
		"The Taunka" => 128,
		"Warsong Offensive" => 129,
		"Alliance Vanguard" => 131,
	}

	# Get the list of reputations 	 
	factions = WoWDBFactions.new

	$reps = factions.get_faction_list
	#$reps["Horde Expedition"] = {:id => 1052}
	#$reps["Alliance Vanguard"] = {:id => 1037}

	# Parse the list and add the info to the file and a reputations look up file
	$reps.keys.sort_by {|key|	

		if flags.has_key?(key)
			$reps[key]={:id => $reps[key][:id], :flag => flags[key]}	
		else	
			$reps[key] = {:id => $reps[key][:id]} 
		end

		$reps[key][:id]}.each do |k|

			if $reps[k][:flag]

				replua.puts "\tself:addLookupList(RepDB, #{$reps[k][:id]},BFAC[\"#{k}\"]) -- Acquire Flag: #{$reps[k][:flag]}"

			end

	end

	# File footer
	replua.puts "\nend"
	replua.close

end

# Creates the faction database

def create_custom_db()

	puts "Generating Custom file..."

	# Open the reputation file
	customlua = File.open("./RecipeDB/ARL-Custom.lua", "w:utf-8")

	# Faction file header
	header=<<EOF
--[[

************************************************************************

ARL-Custom.lua

Custom acquire data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb	
Entries to this file will be overwritten

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(CustomDB, Rep ID, Rep Name)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

function addon:InitCustom(CustomDB)

	self:addLookupList(CustomDB, 1, "Discovered by making elxiris or flasks using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 2, "Discovered by making potions using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 3, "Discovered by doing transmutes using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 4, "Discovered by Major Protection Potions using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 5, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the meat crate.")
	self:addLookupList(CustomDB, 6, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the fish barrel.")
	self:addLookupList(CustomDB, 7, "Randomly obtained by completing the fishing daily quest in Shattrath.")
	self:addLookupList(CustomDB, 8, "Learnt by default when learning the profession.")

end

EOF

	customlua.puts(header)
	customlua.close

end

# Creates a database file for the specific recipe
# TODO: Optimize the code for this function

def create_profession_db(file,profession,db,maps,funcstub,recipes,ignorerecipe,specialcase,manual)

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

	proflua = File.open(file, "w:utf-8")

	profheader =<<EOF
--[[

************************************************************************

#{file[11..-1]}

#{profession} data for all of AckisRecipeList

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
#{recipes.length} found from data mining.
#{ignorerecipe.length} ignored.

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
		proflua.print("\t-- #{name} -- #{details[:spellid]}")

		details[:method].split(",").each do |method|

			case method

			# trainers
			when 'taught-by'

				data = details[:method_trainers]

				flags << 3

				if details[:learned] == 1

					flags << 1 << 2

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

			# vendors
			when 'sold-by'

				flags << 4
				data = details[:method_vendors]
			
				# Reputation vendor
				unless details[:faction].nil?

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
									end

									if $raids[loc]
										flags << 6
									end

								end

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
									end

									if $raids[loc]
										flags << 6
									end

								end

							end

						end

					end

				end

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

							# The NPC has a location mined
							if npc[:locs]
								npc[:locs].each do |loc|
									if $dungeons[loc]
										flags << 5
										$instancemobs << npc[:name]
									elsif $raids[loc]
										flags << 6
										$instancemobs << npc[:name]
									else
										flags << 11
									end
								end
							# There was no NPC location mined
							else
								# The NPC has been manually added to our list
								if $bosszonemap[npc[:name]]
									found = false
									# Go through all the dungeons
									$dungeons.each_pair do |id,dname|
										if dname == $bosszonemap[npc[:name]]
											flags << 5
											found = true
											$instancemobs << npc[:name]
										end
									end
									if not found
										# Go through all the raids
										$raids.each_pair do |id,dname|
											if dname == $bosszonemap[npc[:name]]
												flags << 6
												found = true
												$instancemobs << npc[:name]
											end
										end
									end
									if not found
										flags << 11
									end
								end
							end
						end
					end
				# World drop
				else

					# Cheat and say that it's both horde/alliance
					flags << 1 << 2
					flags << 10
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
							end
							if $raids[loc]
								flags << 6
							end

						end

					end

				end

			end

		end

		# Add class flags

		if details[:classes].nil?

			flags << 21 << 22 << 23 << 24 << 25 << 26 << 27 << 28 << 29 << 30

		else

			details[:classes].split(",").each do |ctype|

				if classes.has_key?(ctype)

					flags << classes[ctype]

				end

			end

		end

		# Add item and recipe BoE/BoP/BoA flags
		if details[:item_binds] == "BOE"
			flags << 36
		end
		if details[:item_binds] == "BOP"
			flags << 37
		end
		if details[:item_binds] == "BOA"
			flags << 38
		end
		if details[:recipe_binds] == "BOE"
			flags << 40
		end
		if details[:recipe_binds] == "BOP"
			flags << 41
		end
		if details[:recipe_binds] == "BOA"
			flags << 42
		end

		# Add weapon flags
		if details[:is_weapon]
			flags << 46
			unless details[:weapon_hands].nil?
				flags << weapons[details[:weapon_hands]]
			end
			unless details[:weapon_slot].nil?
				flags << weapons[details[:weapon_slot]]
			end
		end

		# Add armor flags
		if details[:is_armor]
			flags << 47
			unless details[:armor_type].nil?
				flags << armors[details[:armor_type]]
			end
		end

		# Handle special cases
		if specialcase[details[:spellid]]

			case specialcase[details[:spellid]][:id]

			when 7

				flags << 7
				acquire << {"type" => 5, "id" => specialcase[details[:spellid]][:type]}

			when 9

				flags << 9

			when 12

				flags << 1 << 2 << 12
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => 8, "id" => i}
				end
				flags.delete(3)
				flags.delete(4)
				flags.delete(5)
				flags.delete(6)

			when "Trainer"

				acquire << {"type" => 8, "id" => 8}

			when "meleedps"

				flags << 51

			when "Alliance"

				flags << 1

			when "Horde"

				flags << 2

			when "Daily"

				flags.delete(3)
				flags.delete(4)
				flags.delete(5)
				flags.delete(6)
				flags.delete(7)
				flags.delete(8)
				flags.delete(9)
				flags.delete(10)
				flags.delete(11)
				flags << 1 << 2
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => 8, "id" => i}
				end

			when "class"

				# Remove all the other class flags
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

			when "ADNaxx40H"

				# Remove all the acquire flags
				flags.delete(3)
				flags.delete(4)
				flags.delete(5)
				flags.delete(6)
				flags.delete(7)
				flags.delete(8)
				flags.delete(9)
				flags.delete(10)
				flags.delete(11)
				flags.delete(12)
				# Add Horde, Alliance, Vendor, Reputation, Argent Dawn flags
				flags << 1 << 2 << 4 << 6 << 96
				acquire << {"type" => 6, "id" => 16365, "faction" => 529,"factionlevel" => 2}
				$vendors[16365] = {:name => "Master Craftsman Omarion"}
				$vendors[16365][:faction] = 0

			when "ADNaxx40R"

				# Remove all the acquire flags
				flags.delete(3)
				flags.delete(4)
				flags.delete(5)
				flags.delete(6)
				flags.delete(7)
				flags.delete(8)
				flags.delete(9)
				flags.delete(10)
				flags.delete(11)
				flags.delete(12)
				# Add Horde, Alliance, Vendor, Reputation, Argent Dawn flags
				flags << 1 << 2 << 4 << 6 << 96
				acquire << {"type" => 6, "id" => 16365, "faction" => 529,"factionlevel" => 3}
				$vendors[16365] = {:name => "Master Craftsman Omarion"}
				$vendors[16365][:faction] = 0

			when "ADNaxx40E"

				# Remove all the acquire flags
				flags.delete(3)
				flags.delete(4)
				flags.delete(5)
				flags.delete(6)
				flags.delete(7)
				flags.delete(8)
				flags.delete(9)
				flags.delete(10)
				flags.delete(11)
				flags.delete(12)
				# Add Horde, Alliance, Vendor, Reputation, Argent Dawn flags
				flags << 1 << 2 << 4 << 6 << 96
				acquire << {"type" => 6, "id" => 16365, "faction" => 529,"factionlevel" => 4}
				$vendors[16365] = {:name => "Master Craftsman Omarion"}
				$vendors[16365][:faction] = 0

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

		if ignorerecipe.include?(details[:spellid])

			proflua.print("\t--")

		else

			proflua.print("\t")

		end

		proflua.puts "recipecount = recipecount + 1"

		if ignorerecipe.include?(details[:spellid])

			proflua.print("\t--")

		else

			proflua.print("\t")

		end

		proflua.print("self:addTradeSkill(RecipeDB,#{details[:spellid]},")

		# If we have a skill which it's learned at, we'll use it, if not use 1
		if details[:learned]

			proflua.print("#{details[:learned]},")

		else

			proflua.print("1, ")

		end

		if details[:produces]

			proflua.print("#{details[:produces].first},")

		else

			proflua.print("nil, ")

		end

		if details[:rarity]

			proflua.print("#{details[:rarity]},")

		else

			proflua.print("1, ")

		end

		proflua.print("#{$proftable[profession]}")

		if details[:specialty]

			proflua.print(",#{details[:specialty]})")

		else

			proflua.print(")\n")

		end

		# Compress, remove duplicates and sort the list of flags
		flags.compact!
		flags.uniq!
		flags.sort!

		if flags.length == 0
			proflua.puts "\t-- No filter flags"
		else

			if ignorerecipe.include?(details[:spellid])
				proflua.print("\t--")
			else
				proflua.print("\t")
			end

			proflua.puts "self:addTradeFlags(RecipeDB,#{details[:spellid]},#{flags.join(",")})"

		end

		flags.clear

        # acquire info  
		if acquire.length == 0 

			proflua.puts "\t-- No acquire information"
			$missingdataacquire[details[:spellid]] = {:sname => name, :data => details, :sprof => profession}

		else

			acquiredordered = acquire.sort_by { |entry| entry["id"] }

			temp = []

			for id in %w(5 7 3 4 1 2 6 8)

				for entry in acquiredordered.select { |entry| entry["type"] == id.to_i }

					temp << [entry["type"],entry["faction"],entry["factionlevel"],entry["id"]].compact

				end

			end 

			temp.flatten!

			if ignorerecipe.include?(details[:spellid])
				proflua.print("\t--")
			else
				proflua.print("\t")
			end


			proflua.puts "self:addTradeAcquire(RecipeDB,#{details[:spellid]},#{temp.join(",")})"

		end
	 
		acquire.clear  

		proflua.puts ""

	end

	puts "Processing #{profession} data complete..."

	proflua.puts(manual)
	proflua.puts "\treturn recipecount\n\nend"
	proflua.close

end

# Creates the lookup table for trainer/vendor/quest/mobs

def create_lookup_db(file,type,db,funcstub,list,maps,ignorelist)

	puts "Generating #{type} file .. #{list.length} entries to process"
	lookup_lua = File.open(file, "w:utf-8")

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

	self:addLookupList(#{db},NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

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
				lookup_lua.print("self:addLookupList(#{db},#{k},")

				if $bosslist.include?(v[:name])

					lookup_lua.print("BBOSS[\"#{v[:name]}\"],")
					$localstring.delete(v[:name])

				else

					lookup_lua.print("L[\"#{v[:name]}\"],")
					# Add the name to the list of localization strings
					$localstring << v[:name]

				end

				if locs.keys[0]

					lookup_lua.print("BZONE[\"#{locs.keys[0]}\"],")

				else

					if $bosszonemap[v[:name]]

						lookup_lua.print("BZONE[\"#{$bosszonemap[v[:name]]}\"],")

					else

						lookup_lua.print("L[\"Unknown Zone\"],")
						$unknownzone << v[:name]

					end

				end

				if x and y

					lookup_lua.print("#{x},#{y})")

				else

					lookup_lua.print("0,0)")

				end

				lookup_lua.print("\n")

			else

				# Assumption that ID and Name will always be around
				lookup_lua.print("self:addLookupList(#{db},#{k},L[\"#{v[:name]}\"],")

				if locs.keys[0]

					lookup_lua.print("BZONE[\"#{locs.keys[0]}\"],")

				else

					if $bosszonemap[v[:name]]

						lookup_lua.print("BZONE[\"#{$bosszonemap[v[:name]]}\"],")
						locs.keys[0] = $bosszonemap[v[:name]]

					else

						lookup_lua.print("L[\"Unknown Zone\"],")
						locs.keys[0] = "Unknown Zone"
						$unknownzone << v[:name]

					end

				end

				if x and y

					lookup_lua.print("#{x},#{y},")

				else

					lookup_lua.print("0,0,")

				end

				# If not faction assume it's neutral
				if v[:faction]

					lookup_lua.print("#{v[:faction]})")

				else

					# hack because not all factions have both info detected
					if $hordefactionlist.include?(locs.keys[0])

						lookup_lua.print("2)")

					elsif $alliancefactionlist.include?(locs.keys[0])

						lookup_lua.print("1)")

					elsif $factionmap[v[:name]]

						lookup_lua.print("#{$factionmap[v[:name]]})")

					else

						lookup_lua.print("0)")
						$unknownfaction << "#{v[:name]} - #{locs.keys[0]}"

					end

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

# Creates the enUS localization file.

def create_localization_db()

	puts "\nGenerating Local file .. #{$localstring.length} strings to process"

	$localstring.compact!
	$localstring.uniq!
	$localstring.sort!

	local_lua = File.open("./Locals/ARLLocals-enUS.lua", "w:utf-8")

	localization=<<EOF
--[[
****************************************************************************************

ARLLocals-enUS.lua

enUS localization strings for Ackis Recipe List

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

Original translated by: Ackis
Currently maintaince by: Ackis

Please make sure you update the ToC file with any translations.

The enUS file is autogenerated from the dataminer.  If you need to make changes,
please update the dataminer file otherwise they will be overwritten.

****************************************************************************************
]]--

--[[
Locale schema
	* single and double words are just fine, anything longer should have a tag
	* tag name rules:
		* tags should be ALL_CAPITAL_LETTERS with words separated with _'s
		* descriptions are typically used in tooltips and header in sections
		* short descriptions will end in _DESC
		* long descriptions will end in _LONG
	* don't include the object being described in the name (no _TOGGLE or _TT) since it
	  can be used several times to describe different objects (in theory)
	* group related elements together, either by their location in the GUI/config,
	  or by purpose (Weapon categories, etc)
]]--

local L = LibStub("AceLocale-3.0"):NewLocale("Ackis Recipe List", "enUS", true)

if not L then return end

-- General strings
L["Filters"]				= true
L["All"]					= true
L["None"]					= true
L["Ok"]						= true

-- Config Options
L["About"]					= true
L["Main Options"]			= true
L["General Settings"]		= true
L["Display Settings"]		= true
L["Sorting Settings"]		= true
L["Profile Options"]		= true
L["ARL Documentation"]		= true

-- Config UI Elements and their associated descriptions
L["MAIN_OPTIONS_DESC"]		= "Main configuration options"
L["Scan"]					= true
L["SCAN_RECIPES_DESC"]		= "Scans an open tradeskill for missing recipes."
L["Text Dump"]				= true
L["TEXT_DUMP_DESC"]			= "Displays all recipes in a comma seperated value format which can be copied and pasted into another client."
L["View Exclusion List"]	= true
L["VIEW_EXCLUSION_LIST_DESC"] = "Prints out a list of all recipes on the exclusion list."
L["DISPLAY_SETTINGS_DESC"]	= "Allows you to customize how the GUI behaves."
L["SORTING_SETTINGS_DESC"]	= "Allows you to customize the way displayed recipes are sorted."
L["ARL_DOC_DESC"]			= "Documentation for Ackis Recipe List"

-- UI Documentation
L["Using Filters"]			= true
L["USING_FILTERS_DESC"]		= "Filters may be toggled on or off.  There are two types of filters: one which will prevent the recipe from showing up at all, and one which will prevent a specific type of acquire information from showing up.\\nWith the first type of filter, these match the properities of the recipe (ie: binding).  If you toggle ARL to not show BoP recipes, no recipes that are BoP will show up in the scan.  The second type of filter deals with acquire information.  If a recipe is availible as a mob drop, or from a vendor and you toggle to not show vendor recipes, the recipe will still show up but vendor information will be hidden for it.  The reason is that there is still another way to acquire this recipe (mob drop) so it should still be included in the scan."
L["Reporting Bugs"]			= true
L["REPORTING_BUGS_DESC"]	= "When reporting a bug, please make sure you do the following:\\n1) Download the latest version, availible from http://www.wowace.com/projects/arl/files/\\n2) Make sure there is not a bug report filed for your issue already.  You can check these at http://www.wowace.com/projects/arl/tickets/\\n2a) Disable addons such as Skillet or ATSW.\\n3) If your problem is not listed and you are using the latest version verify your addon settings.  Verify filters, profiles, etc.\\n4) You have found a bug that no one has reported before.  Create a new ticket at http://www.wowace.com/projects/arl/tickets/ with a descriptive heading about the problem.  In the ticket make sure you include the error message that you received (just the error message, I don't need a listing of the addons you use), the recipe/profession you were working with, and any other info that you think may help."

-- Config UI Elements and their associated descriptions
L["Include Filtered"]		= true
L["FILTERCOUNT_DESC"]		= "Include filtered recipes in the count of total recipes."
L["Include Excluded"]		= true
L["EXCLUDECOUNT_DESC"]		= "Include excluded recipes in the count of total recipes."
L["Close GUI"]				= "Close with Tradeskill UI"
L["CLOSEGUI_DESC"]			= "Close the ARL window when the crafting window is closed."
L["Display Exclusions"]		= true
L["DISPLAY_EXCLUSION_DESC"]	= "Display recipes that are in the exclusion list."
L["UI Scale"]				= true
L["UI_SCALE_DESC"]			= "Changes the scale of the UI. Ranges from .5 to 1.5 (1 is default)"
L["Tooltip Scale"]			= true
L["TOOLTIP_SCALE_DESC"]		= "Changes the scale of the ARL Tooltip. Ranges from .5 to 1.5 (.9 is default)"
L["Sorting"]				= true
L["Sort"]					= true
L["Display"]				= true
L["SORTING_DESC"]			= "Change the way in which displayed recipes are sorted."
L["Version"]				= "Version: "
L["Name"]					= true
L["Skill"]					= true
L["Location"]				= true
L["Acquisition"]			= true

-- Filter Config Options
L["Filtering Options"]		= true
L["General"]				= true
L["Obtain"]					= true
L["Binding"]				= true
L["Item"]					= true
L["Armor"]					= true
L["Weapon"]					= true
L["Player Type"]			= true
L["Reputation"]				= true
L["Old World"]				= true
L["Burning Crusade"]		= true
L["Wrath of the Lich King"]	= true

-- Filter Configuration Descriptions
L["FILTERING_OPTIONS_DESC"]					= "Allows you to customize which recipes are filtered."
L["General Filtering Options"]				= true
L["FILTERING_GENERAL_DESC"]					= "Configuration for several more general filter types."
L["Obtain Filtering Options"]				= true
L["FILTERING_OBTAIN_DESC"]					= "Configuration for which methods of obtaining recipes are included in the scan."
L["Binding Filtering Options"]				= true
L["FILTERING_BINDING_DESC"]					= "Configuration for which types of binding are included in the scan."
L["Item Filtering Options"]					= true
L["FILTERING_ITEM_DESC"]					= "Configuration for which item types are included in the scan."
L["Armor Filtering Options"]				= true
L["FILTERING_Armor_DESC"]					= "Configuration for which types of armor are included in the scan."
L["Weapon Filtering Options"]				= true
L["FILTERING_WEAPONS_DESC"]					= "Configuration for which types of weapons are included in the scan."
L["Player Type Filtering Options"]			= true
L["FILTERING_PLAYERTYPE_DESC"]				= "Configuration for items matching which player types are included in the scan."
L["Reputation Filtering Options"]			= true
L["FILTERING_REP_DESC"]						= "Configuration for which reputation reward recipes are included in the scan."
L["Old World Rep. Filtering Options"]		= true
L["FILTERING_OLDWORLD_DESC"]				= "Configuration for which Old World Reputation reward recipes are included in the scan."
L["Burning Crusade Rep. Filtering Options"]	= true
L["FILTERING_BC_DESC"]						= "Configuration for which Burning Crusade Reputation reward recipes are included in the scan."
L["Lich King Rep. Filtering Options"]		= true
L["FILTERING_WOTLK_DESC"]					= "Configuration for which Wrath of the Lich King Reputation reward recipes are included in the scan."

-- General Filter UI Elements and their associated descriptions
L["Faction"]				= true
L["FACTION_DESC"]			= "Include both horde and alliance faction recipes in the scan."
L["Classes"]				= true
L["CLASS_DESC"]				= "Include all class specific recipes in the scan."
L["Specialties"]			= true
L["SPECIALTY_DESC"]			= "Include all trade-skill specialties in the scan."
L["Skill"]					= true
L["SKILL_DESC"]				= "Include all recipes in the scan, regardless of your current skill level."
L["Known"]					= true
L["KNOWN_DESC"]				= "Include all known recipes in the scan."
L["Unknown"]				= true
L["UNKNOWN_DESC"]			= "Include all unknown recipes in the scan."

-- Obtain Filter UI Elements and their associated descriptions
L["Instance"]				= true
L["INSTANCE_DESC"]			= "Recipes obtained from (5 man) instances should be included in the scan."
L["Raid"]					= true
L["RAID_DESC"]				= "Recipes obtained in raids (ie: Molten Core, Serpent Shrine Cavern, etc.) should be included in the scan."
L["Quest"]					= true
L["QUEST_DESC"]				= "Recipes obtained as quest rewards should be included in the scan."
L["Seasonal"]				= true
L["SEASONAL_DESC"]			= "Recipes obtained in seasonal events should be included in the scan."
L["Trainer"]				= true
L["TRAINER_DESC"]			= "Recipes learned from trainers should be included in the scan."
L["Vendor"]					= true
L["VENDOR_DESC"]			= "Recipes purchased from vendors should be included in the scan."
L["PVP"]					= true
L["PVP_DESC"]				= "Recipes obtained through PVP should be included in the scan."
L["Discovery"]				= true
L["DISCOVERY_DESC"]			= "Recipes obtained through Discovery should be included in the scan."
L["World Drop"]				= true
L["WORLD_DROP_DESC"]		= "Recipes that are World Drops should be included in the scan."
L["Mob Drop"]				= true
L["MOB_DROP_DESC"]			= "Recipes that are Mob Drops should be included in the scan."

-- Binding Filter UI Elements and their associated descriptions
L["BOEFilter"]				= "Item Bind on Equip"
L["BOE_DESC"]				= "Recipes that make Bind on Equip items should be included in the scan."
L["BOPFilter"]				= "Item Bind on Pickup"
L["BOP_DESC"]				= "Recipes that make Bind on Pickup items should be included in the scan."
L["BOAFilter"]				= "Item Bind to Account"
L["BOA_DESC"]				= "Recipes that make Bind to Account items should be included in the scan."
L["RecipeBOEFilter"]		= "Recipe Bind on Equip"
L["RECIPE_BOE_DESC"]		= "Recipes that are Bind on Equip should be included in the scan."
L["RecipeBOPFilter"]		= "Recipe Bind on Pickup"
L["RECIPE_BOP_DESC"]		= "Recipes that are Bind on Pickup should be included in the scan."
L["RecipeBOAFilter"]		= "Recipe Bind to Account"
L["RECIPE_BOA_DESC"]		= "Recipes that are Bind to Account should be included in the scan."

-- Item - Armor UI Elements and their associated descriptions
L["Cloth"]					= true
L["CLOTH_DESC"]				= "Recipes that make cloth items should be included in the scan."
L["Leather"]				= true
L["LEATHER_DESC"]			= "Recipes that make leather items should be included in the scan."
L["Mail"]					= true
L["MAIL_DESC"]				= "Recipes that make mail items should be included in the scan."
L["Plate"]					= true
L["PLATE_DESC"]				= "Recipes that make plate items should be included in the scan."
L["Cloak"]					= true
L["CLOAK_DESC"]				= "Recipes that make cloaks should be included in the scan."
L["Ring"]					= true
L["RING_DESC"]				= "Recipes that make rings should be included in the scan."
L["Trinket"]				= true
L["TRINKET_DESC"]			= "Recipes that make trinkets should be included in the scan."
L["Necklace"]				= true
L["NECKLACE_DESC"]			= "Recipes that make necklaces should be included in the scan."
L["Shield"]					= true
L["SHIELD_DESC"]			= "Recipes that make shields should be included in the scan."

-- Item - Weapon UI Elements and their associated descriptions
L["One Hand"]				= true
L["ONEHAND_DESC"]			= "Recipes that make one handed items should be included in the scan."
L["Two Hand"]				= true
L["TWOHAND_DESC"]			= "Recipes that make two handed items should be included in the scan."
L["Axe"]					= true
L["AXE_DESC"]				= "Recipes that make axes should be included in the scan."
L["Sword"]					= true
L["SWORD_DESC"]				= "Recipes that make swords should be included in the scan."
L["Mace"]					= true
L["MACE_DESC"]				= "Recipes that make maces should be included in the scan."
L["Polearm"]				= true
L["POLEARM_DESC"]			= "Recipes that make polearms should be included in the scan."
L["Dagger"]					= true
L["DAGGER_DESC"]			= "Recipes that make daggers should be included in the scan."
L["Fist"]					= true
L["FIST_DESC"]				= "Recipes that make fist weapons should be included in the scan."
L["Staff"]					= true
L["STAFF_DESC"]				= "Recipes that make staves should be included in the scan."
L["Wand"]					= true
L["WAND_DESC"]				= "Recipes that make wands should be included in the scan."
L["Thrown"]					= true
L["THROWN_DESC"]			= "Recipes that make thrown weapons should be included in the scan."
L["Bow"]					= true
L["BOW_DESC"]				= "Recipes that make bows should be included in the scan."
L["Crossbow"]				= true
L["CROSSBOW_DESC"]			= "Recipes that make crossbows should be included in the scan."
L["Ammo"]					= true
L["AMMO_DESC"]				= "Recipes that make ammunition should be included in the scan."

-- Player Type Filtering UI Elements and their associated descriptions
L["Melee DPS"]				= true
L["MELEE_DPS_DESC"]			= "Recipes that are used by melee dps players should be included in the scan."
L["Tanks"]					= true
L["TANKS_DESC"]				= "Recipes that are used by tank players should be included in the scan."
L["Caster DPS"]				= true
L["CASTER_DPS_DESC"]		= "Recipes that are used by casting dps players should be included in the scan."
L["Healers"]				= true
L["HEALERS_DESC"]			= "Recipes that are used by healer players should be included in the scan."

-- Reputation Filtering UI Elements and their associated description
L["SPECIFIC_REP_DESC"]		= "Include %s faction."

-- ZJUI UI Elements (when different from the above ones) and their associated descriptions
L["FILTER_OPEN"]			= "Filter >>>"
L["FILTER_OPEN_DESC"]		= "Open filter option panel."
L["FILTER_CLOSE"]			= "<<< Filter"
L["FILTER_CLOSE_DESC"]		= "Close filter option panel."
L["EXPANDALL"]				= "+ All"
L["EXPANDALL_DESC"]			= "Expand all recipes listed below."
L["CONTRACTALL"]			= "- All"
L["CONTRACTALL_DESC"]		= "Minimize all recipes listed below."
L["Search"]					= true
L["SEARCH_DESC"]			= "Filter to recipes that contain text at left."
L["SEARCH_BOX_DESC"]		= "Enter text to search"
L["CLEAR_DESC"]				= "Clear the search textbox."
L["Close"]					= "Exit"
L["CLOSE_DESC"]				= "Close the Ackis Recipe List Window."
L["Reset"]					= true
L["RESET_DESC"]				= "Reset All Filters to default values."
L["Apply"]					= true
L["APPLY_DESC"]				= "Apply the above selected filters to the recipe list"
L["ARMOR_ALL_DESC"]			= "Recipes that make ANY armor item should be included in the scan."
L["ARMOR_NONE_DESC"]		= "Do NOT include any recipes that make armor items in the scan."
L["WEAPON_ALL_DESC"]		= "Recipes that make ANY weapon item should be included in the scan."
L["WEAPON_NONE_DESC"]		= "Do NOT include any recipes that make weapon items in the scan."

-- Common Tooltip Strings (where different from above)
L["CTRL_CLICK"]			= "Ctrl-Click to add this recipe's link to your chat"
L["ALT_CLICK"]			= "Alt-Click to add/remove this recipe to your ignore list"
L["SHIFT_CLICK"]		= "Shift-Click to add the item crafted by this recipe's link to your chat"
L["Obtained From"]		= true
L["RECIPE_EXCLUDED"]	= "Recipe is in Exclusion list"
L["Required Skill"]		= true

-- Popup Strings
L["NOTSCANNED"]		= "You have not yet scanned this profession. Please open this profession and click on Scan Skills."
L["ALL_FILTERED"]	= "Although you have already scanned this profession, your filters are currently preventing any recipes from being displayed. Please change your filters and try again."
L["ARL_ALLKNOWN"]	= "You know all the recipes for this profession."
L["ARL_ALLEXCLUDED"] = "Although you have already scanned this profession, your exclusions are currently preventing any recipes from being displayed. Please change your exclusions and try again."
L["NO_DISPLAY"] 	= "No recipes to display.  If you get this message please submit a ticket at http://www.wowace.com/projects/arl/tickets listing what filters you have, what is in your exclusion list, which profession, and the number of known/unknown recipes."

-- Error/warning Text
L["MissingFromDB"] = ": is missing from the database. \\nPlease inform the author of the add-on about this recipe."
L["UnknownTradeSkill"] = "You have opened up a trade skill window which is not supported by this add-on.  The trade skill is %s.  Please provide the author of the add-on with this information."
L["OpenTradeSkillWindow"] = "Please open trade skill window to scan."
L["SpellIDCache"] = "Spell ID: %s is not in your local cache.  Please submit a ticket at http://wow.curseforge.com/projects/ackis-recipe-list/tickets/ and include the spell ID and the profession in which you were scanning."
L["NoItemLink"] = "This item does not have an item link or it was not in your cache."

-- Drop Obtain Info
L["Unknown Zone"] = true

-- Special Event information
L["Midsummer Fire Festival"] = true
L["Feast of Winters Veil"] = true
L["Lunar Festival"] = true
L["Darkmoon Faire"] = true
L["Seasonal"] = true

-- Monster/Quest/Trainer/Vendor (autogeneratored) strings:

-- Do not translate anything below this line without talking to Ackis first please.

EOF

	local_lua.puts localization

	$localstring.each do |k|

		local_lua.puts "L[\"#{k}\"] = true"

	end

	local_lua.puts "\n"
	local_lua.close

end

# Provides a document containing statistics

def create_stats_list()

	puts "\nGenerating stats file..."

	$unknownzone.compact!
	$unknownzone.uniq!
	$unknownzone.sort!

	stats_lua = File.open("RecipeStats.txt", "w:utf-8")

	stats_lua.puts("Unknown zones:")

	$unknownzone.each do |k|

		stats_lua.puts "\t\"#{k}\" => \"\","

	end

	stats_lua.puts "\n"

	stats_lua.puts("Unknown faction:")

	$unknownfaction.each do |k|

		stats_lua.puts "#{k},"

	end

	stats_lua.puts "\n"

	stats_lua.puts("Instance mobs:")

	$instancemobs.compact!
	$instancemobs.uniq!
	$instancemobs.sort!

	$instancemobs.each do |k|

		stats_lua.puts "\t\"#{k}\","

	end

	stats_lua.puts "\n"	

	stats_lua.puts("No acquire information:")

	$missingdataacquire.each_pair do |k,l|

		stats_lua.puts "#{k} - #{l[:sname]} - #{l[:sprof]}"

	end

	stats_lua.puts "\n"	

	stats_lua.close

end

recipes = WoWDBRecipes.new
maps = WoWDBMaps.new

$dungeons = maps.get_dungeon_maps
$raids = maps.get_raid_maps

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

$bosslist = [
	"Sjonnir the Ironshaper",
	"Akil'zon",
	"Anetheron",
	"Anub'arak",
	"Archimonde",
	"Attumen the Huntsman",
	"Azgalor",
	"Bannok Grimaxe",
	"Baron Geddon",
	"Battleguard Sartura",
	"Blackheart the Inciter",
	"Captain Skarloc",
	"Chrono Lord Deja",
	"Commander Sarannis",
	"Dalliah the Doomsayer",
	"Darkmaster Gandling",
	"Emperor Vek'lor",
	"Emperor Vek'nilash",
	"Epoch Hunter",
	"Exarch Maladaar",
	"Fankriss the Unyielding",
	"Garr",
	"Gehennas",
	"General Drakkisath",
	"Ghaz'an",
	"Golem Lord Argelmach",
	"Golemagg the Incinerator",
	"Goraluk Anvilcrack",
	"Grand Warlock Nethekurse",
	"Grizzle",
	"Gyth",
	"Halazzi",
	"Herald Volazj",
	"Hex Lord Malacrass",
	"High Botanist Freywinn",
	"Hydromancer Thespia",
	"Jan'alai",
	"Kaz'rogal",
	"Keristrasza",
	"Lord Kri",
	"Lord Roccor",
	"Loro",
	"Lucifron",
	"Magmadar",
	"Mechano-Lord Capacitus",
	"Mekgineer Steamrigger",
	"Mekgineer Thermaplugg",
	"Mennu the Betrayer",
	"Midnight",
	"Mijan",
	"Moroes",
	"Murmur",
	"Nalorakk",
	"Nethermancer Sepethrea",
	"Nexus-Prince Shaffar",
	"Nightbane",
	"Onyxia",
	"Ouro",
	"Overmaster Pyron",
	"Pathaleon the Calculator",
	"Plugger Spazzring",
	"Princess Huhuran",
	"Princess Yauj",
	"Pyromancer Loregrain",
	"Quartermaster Zigris",
	"Rage Winterchill",
	"Ras Frostwhisper",
	"Ribbly Screwspigot",
	"Shade of Aran",
	"Shazzrah",
	"Solakar Flamewreath",
	"Terestian Illhoof",
	"The Crone",
	"The Prophet Skeram",
	"Thorngrin the Tender",
	"Vem",
	"Viscidus",
	"Warlord Kalithresh",
	"Warp Splinter",
	"Zul'jin",
	"Lord Kazzak",
]

$bosszonemap = {
	"40 Tickets - Schematic: Steam Tonk Controller" => "Darkmoon Faire",
	"Master Craftsman Omarion" => "Naxxramas",
	"Azure Ley-Whelp" => "The Oculus",
	"Bloodaxe Raider" => "Blackrock Spire",
	"Forgotten One" => "Ahn'kahet: The Old Kingdom",
	"Gorgolon the All-seeing" => "",
	"Great-father Winter" => "Orgrimmar",
	"Illidari Defiler" => "Black Temple",
	"Lightning Construct" => "Halls of Stone",
	"Ravaged Cadaver" => "Stratholme",
	"Sjonnir the Ironshaper" => "Halls of Stone",
	"Skeletal Fiend (Enraged Form)" => "Duskwood",
	"Storm Fury" => "Black Temple",
	"Gorgolon the All-seeing" => "Blade's Edge Mountains",
	"A Binding Contract" => "Blackrock Depths",
	"Aged Dalaran Wizard" => "Old Hillsbrad Foothills",
	"Amani'shi Flame Caster" => "Zul'Aman",
	"Annora" => "Uldaman",
	"Anub'arak" => "Azjol-Nerub",
	"Cluster Launcher" => "Moonglade",
	"Cyanigosa" => "The Violet Hold",
	"Drakkari Bat" => "Drak'Tharon Keep",
	"Drakkari Earthshaker" => "Gundrak",
	"Enchanted Thorium Platemail: Volume I" => "Dire Maul",
	"Enchanted Thorium Platemail: Volume II" => "Dire Maul",
	"Enchanted Thorium Platemail: Volume III" => "Dire Maul",
	"Festive Recipes" => "Moonglade",
	"Firework Launcher" => "Moonglade",
	"Flash Bomb Recipe" => "Badlands",
	"Flesheating Ghoul" => "Drak'Tharon Keep",
	"Gyth" => "Blackrock Spire",
	"Herald Volazj" => "Ahn'kahet: The Old Kingdom",
	"Imperial Plate Belt" => "Tanaris",
	"Imperial Plate Boots" => "Tanaris",
	"Imperial Plate Bracer" => "Tanaris",
	"Imperial Plate Chest" => "Tanaris",
	"Imperial Plate Helm" => "Tanaris",
	"Imperial Plate Leggings" => "Tanaris",
	"Imperial Plate Shoulders" => "Tanaris",
	"Indormi" => "Hyjal Summit",
	"Ingvar the Plunderer" => "Howling Fjord",
	"Keristrasza" => "Borean Tundra",
	"King Ymiron" => "Howling Fjord",
	"Koren" => "Karazhan",
	"Lieutenant General Andorov" => "Ruins of Ahn'Qiraj",
	"Loken" => "The Storm Peaks",
	"Lokhtos Darkbargainer" => "Blackrock Depths",
	"Okuno" => "Black Temple",
	"Ras Frostwhisper" => "Scholomance",
	"Risen Drakkari Soulmage" => "Drak'Tharon Keep",
	"Risen Drakkari Warrior" => "Drak'Tharon Keep",
	"Shen'dralar Provisioner" => "Dire Maul",
	"Sister of Torment" => "Magisters' Terrace",
	"The Prophet Tharon'ja" => "Grizzly Hills",
	"Thomas Yance" => "Old Hillsbrad Foothills",
	"Twilight Worshipper" => "Ahn'kahet: The Old Kingdom",
	"Ythyar" => "Karazhan",
	"Abomination" => "Hyjal Summit",
	"Akil'zon" => "Zul'Aman",
	"Amani Dragonhawk" => "Zul'Aman",
	"Amani Elder Lynx" => "Zul'Aman",
	"Amani'shi Axe Thrower" => "Zul'Aman",
	"Amani'shi Beast Tamer" => "Zul'Aman",
	"Amani'shi Guardian" => "Zul'Aman",
	"Amani'shi Handler" => "Zul'Aman",
	"Amani'shi Scout" => "Zul'Aman",
	"Amani'shi Tribesman" => "Zul'Aman",
	"Amani'shi Warbringer" => "Zul'Aman",
	"Amani'shi Wind Walker" => "Zul'Aman",
	"Anetheron" => "Hyjal Summit",
	"Anguished Dead" => "Scarlet Monastery",
	"Anvilrage Captain" => "Blackrock Depths",
	"Anvilrage Marshal" => "Blackrock Depths",
	"Anvilrage Overseer" => "Blackrock Depths",
	"Anvilrage Soldier" => "Blackrock Depths",
	"Apocalypse Guard" => "Sunwell Plateau",
	"Arcane Anomaly" => "Karazhan",
	"Arcane Protector" => "Karazhan",
	"Arcatraz Sentinel" => "The Arcatraz",
	"Archimonde" => "Hyjal Summit",
	"Atal'ai Deathwalker" => "Sunken Temple",
	"Atal'ai Warrior" => "Sunken Temple",
	"Atal'ai Witch Doctor" => "Sunken Temple",
	"Attumen the Huntsman" => "Karazhan",
	"Auchenai Monk" => "Auchenai Crypts",
	"Ayamiss the Hunter" => "Ruins of Ahn'Qiraj",
	"Azgalor" => "Hyjal Summit",
	"Bannok Grimaxe" => "Blackrock Spire",
	"Banshee" => "Hyjal Summit",
	"Baron Geddon" => "Molten Core",
	"Battleguard Sartura" => "Temple of Ahn'Qiraj",
	"Blackhand Elite" => "Blackrock Spire",
	"Blackheart the Inciter" => "Shadow Labyrinth",
	"Bleeding Hollow Darkcaster" => "Hellfire Ramparts",
	"Bloodhound" => "Blackrock Depths",
	"Bloodwarder Legionnaire" => "The Eye",
	"Bloodwarder Vindicator" => "The Eye",
	"Bog Giant" => "The Underbog",
	"Bonechewer Destroyer" => "Hellfire Ramparts",
	"Burrowing Thundersnout" => "Blackrock Depths",
	"Buru the Gorger" => "Ruins of Ahn'Qiraj",
	"Cabal Acolyte" => "Shadow Labyrinth",
	"Cabal Cultist" => "Shadow Labyrinth",
	"Cabal Fanatic" => "Shadow Labyrinth",
	"Cabal Spellbinder" => "Shadow Labyrinth",
	"Cannon Master Willey" => "Stratholme",
	"Captain Skarloc" => "Old Hillsbrad Foothills",
	"Cataclysm Hound" => "Sunwell Plateau",
	"Chrono Lord Deja" => "The Black Morass",
	"Cobalt Serpent" => "Sethekk Halls",
	"Coilfang Champion" => "The Slave Pens",
	"Coilfang Hate-Screamer" => "Serpentshrine Cavern",
	"Coilfang Myrmidon" => "The Steamvault",
	"Coilfang Oracle" => "The Steamvault",
	"Coilfang Serpentguard" => "Serpentshrine Cavern",
	"Coilfang Shatterer" => "Serpentshrine Cavern",
	"Coilfang Siren" => "The Steamvault",
	"Coilfang Sorceress" => "The Steamvault",
	"Coilfang Technician" => "The Slave Pens",
	"Coilfang Warrior" => "The Steamvault",
	"Coilskar Sea-Caller" => "Black Temple",
	"Commander Sarannis" => "The Botanica",
	"Crimson Inquisitor" => "Stratholme",
	"Crimson Sorcerer" => "Stratholme",
	"Crypt Fiend" => "Hyjal Summit",
	"Crystalcore Mechanic" => "The Eye",
	"Dalliah the Doomsayer" => "The Arcatraz",
	"Dark Screecher" => "Blackrock Depths",
	"Darkmaster Gandling" => "Scholomance",
	"Darkwater Crocolisk" => "Tanaris",
	"Darkweaver Syth" => "Sethekk Halls",
	"Deep Stinger" => "Blackrock Depths",
	"Defias Pirate" => "The Deadmines",
	"Defias Squallshaper" => "The Deadmines",
	"Don Carlos" => "Old Hillsbrad Foothills",
	"Doomfire Destroyer" => "Sunwell Plateau",
	"Doomforge Craftsman" => "Blackrock Depths",
	"Doomforge Dragoon" => "Blackrock Depths",
	"Dragonmaw Wind Reaver" => "Black Temple",
	"Durnholde Lookout" => "Old Hillsbrad Foothills",
	"Durnholde Rifleman" => "Old Hillsbrad Foothills",
	"Durnholde Tracking Hound" => "Old Hillsbrad Foothills",
	"Emperor Vek'lor" => "Temple of Ahn'Qiraj",
	"Emperor Vek'nilash" => "Temple of Ahn'Qiraj",
	"Epoch Hunter" => "Old Hillsbrad Foothills",
	"Eredar Deathbringer" => "The Arcatraz",
	"Ethereal Priest" => "Mana-Tombs",
	"Ethereal Scavenger" => "Mana-Tombs",
	"Ethereal Spellbinder" => "Mana-Tombs",
	"Ethereal Thief" => "Karazhan",
	"Ethereum Smuggler" => "Magisters' Terrace",
	"Exarch Maladaar" => "Auchenai Crypts",
	"Fankriss the Unyielding" => "Temple of Ahn'Qiraj",
	"Fel Orc Convert" => "The Shattered Halls",
	"Fel Rager" => "Blade's Edge Mountains",
	"Fel Stalker" => "Hyjal Summit",
	"Felguard Annihilator" => "The Blood Furnace",
	"Firebrand Grunt" => "Blackrock Spire",
	"Firebrand Invoker" => "Blackrock Spire",
	"Firebrand Legionnaire" => "Blackrock Spire",
	"Firebrand Pyromancer" => "Blackrock Spire",
	"Fleshbeast" => "Karazhan",
	"Frost Wyrm" => "Hyjal Summit",
	"Gargantuan Abyssal" => "The Arcatraz",
	"Gargoyle" => "Hyjal Summit",
	"Garr" => "Molten Core",
	"Gehennas" => "Molten Core",
	"General Drakkisath" => "Blackrock Spire",
	"General Rajaxx" => "Ruins of Ahn'Qiraj",
	"Ghaz'an" => "The Underbog",
	"Ghostly Philanthropist" => "Karazhan",
	"Ghostly Steward" => "Karazhan",
	"Ghoul" => "Hyjal Summit",
	"Giant Infernal" => "Hyjal Summit",
	"Golem Lord Argelmach" => "Blackrock Depths",
	"Golemagg the Incinerator" => "Molten Core",
	"Goraluk Anvilcrack" => "Blackrock Spire",
	"Grand Warlock Nethekurse" => "The Shattered Halls",
	"Greater Bogstrok" => "The Slave Pens",
	"Greater Fleshbeast" => "Karazhan",
	"Grizzle" => "Blackrock Depths",
	"Gronn-Priest" => "Gruul's Lair",
	"Halazzi" => "Zul'Aman",
	"Hammered Patron" => "Blackrock Depths",
	"Hex Lord Malacrass" => "Zul'Aman",
	"High Botanist Freywinn" => "The Botanica",
	"Homunculus" => "Karazhan",
	"Hydromancer Thespia" => "The Steamvault",
	"Ironbark Protector" => "Dire Maul",
	"Jan'alai" => "Zul'Aman",
	"Kaz'rogal" => "Hyjal Summit",
	"Kurinnaxx" => "Ruins of Ahn'Qiraj",
	"Lord Kazzak" => "Blasted Lands",
	"Lord Kri" => "Temple of Ahn'Qiraj",
	"Lord Roccor" => "Blackrock Depths",
	"Loro" => "Sunken Temple",
	"Lucifron" => "Molten Core",
	"Magical Horror" => "Karazhan",
	"Magister Kalendris" => "Dire Maul",
	"Magmadar" => "Molten Core",
	"Maleki the Pallid" => "Stratholme",
	"Mana Warp" => "Karazhan",
	"Mechano-Lord Capacitus" => "The Mechanar",
	"Mekgineer Steamrigger" => "The Steamvault",
	"Mekgineer Thermaplugg" => "Gnomeregan",
	"Mennu the Betrayer" => "The Slave Pens",
	"Midnight" => "Karazhan",
	"Mijan" => "Sunken Temple",
	"Moam" => "Ruins of Ahn'Qiraj",
	"Moroes" => "Karazhan",
	"Murk Worm" => "Sunken Temple",
	"Murmur" => "Shadow Labyrinth",
	"Nalorakk" => "Zul'Aman",
	"Nethermancer Sepethrea" => "The Mechanar",
	"Nethervine Inciter" => "The Botanica",
	"Nexus Stalker" => "Mana-Tombs",
	"Nexus-Prince Shaffar" => "Mana-Tombs",
	"Nightbane" => "Karazhan",
	"Oblivion Mage" => "Sunwell Plateau",
	"Onyxia" => "Onyxia's Lair",
	"Ossirian the Unscarred" => "Ruins of Ahn'Qiraj",
	"Ouro" => "Temple of Ahn'Qiraj",
	"Painbringer" => "Sunwell Plateau",
	"Pathaleon the Calculator" => "The Mechanar",
	"Phantom Attendant" => "Karazhan",
	"Phantom Guardsman" => "Karazhan",
	"Phantom Guest" => "Karazhan",
	"Phantom Stagehand" => "Karazhan",
	"Phantom Valet" => "Karazhan",
	"Phoenix-Hawk" => "The Eye",
	"Phoenix-Hawk Hatchling" => "The Eye",
	"Plugger Spazzring" => "Blackrock Depths",
	"Priestess Delrissa" => "Magisters' Terrace",
	"Priestess of Torment" => "Sunwell Plateau",
	"Princess Huhuran" => "Temple of Ahn'Qiraj",
	"Princess Yauj" => "Temple of Ahn'Qiraj",
	"Pusillin" => "Dire Maul",
	"Pyromancer Loregrain" => "Blackrock Depths",
	"Quartermaster Zigris" => "Blackrock Spire",
	"Rabid Warhound" => "The Shattered Halls",
	"Rage Talon Dragon Guard" => "Blackrock Spire",
	"Rage Winterchill" => "Hyjal Summit",
	"Raging Skeleton" => "Auchenai Crypts",
	"Ribbly Screwspigot" => "Blackrock Depths",
	"Ribbly's Crony" => "Blackrock Depths",
	"Rift Keeper" => "The Black Morass",
	"Rift Lord" => "The Black Morass",
	"Risen Bonewarder" => "Scholomance",
	"Risen Construct" => "Scholomance",
	"Sable Jaguar" => "The Black Morass",
	"Sandfury Blood Drinker" => "Zul'Farrak",
	"Sandfury Shadowcaster" => "Zul'Farrak",
	"Scarlet Adept" => "Scarlet Monastery",
	"Scarlet Centurion" => "Scarlet Monastery",
	"Scarlet Gallant" => "Scarlet Monastery",
	"Scarlet Monk" => "Scarlet Monastery",
	"Scarlet Protector" => "Scarlet Monastery",
	"Scholomance Adept" => "Scholomance",
	"Scholomance Necromancer" => "Scholomance",
	"Serpentshrine Sporebat" => "Serpentshrine Cavern",
	"Sethekk Initiate" => "Sethekk Halls",
	"Sethekk Prophet" => "Sethekk Halls",
	"Sethekk Ravenguard" => "Sethekk Halls",
	"Shade of Aran" => "Karazhan",
	"Shadow Pillager" => "Karazhan",
	"Shadowforge Peasant" => "Blackrock Depths",
	"Shadowmoon Reaver" => "Black Temple",
	"Shadowsword Assassin" => "Sunwell Plateau",
	"Shadowsword Guardian" => "Sunwell Plateau",
	"Shadowsword Vanquisher" => "Sunwell Plateau",
	"Shadowy Necromancer" => "Hyjal Summit",
	"Shattered Hand Centurion" => "The Shattered Halls",
	"Shattered Hand Reaver" => "The Shattered Halls",
	"Shazzrah" => "Molten Core",
	"Shrike Bat" => "Uldaman",
	"Skeletal Usher" => "Karazhan",
	"Solakar Flamewreath" => "Blackrock Spire",
	"Sorcerous Shade" => "Karazhan",
	"Spawn of Hakkar" => "Sunken Temple",
	"Spectral Charger" => "Karazhan",
	"Spectral Performer" => "Karazhan",
	"Spectral Researcher" => "Scholomance",
	"Spectral Servant" => "Karazhan",
	"Spectral Stable Hand" => "Karazhan",
	"Spectral Stallion" => "Karazhan",
	"Spell Shade" => "Karazhan",
	"Spirestone Warlord" => "Blackrock Spire",
	"Splinterbone Centurion" => "Razorfen Downs",
	"Stonevault Oracle" => "Uldaman",
	"Stonevault Pillager" => "Uldaman",
	"Sunblade Arch Mage" => "Sunwell Plateau",
	"Sunblade Blood Knight" => "Magisters' Terrace",
	"Sunblade Cabalist" => "Sunwell Plateau",
	"Sunblade Dawn Priest" => "Sunwell Plateau",
	"Sunblade Dusk Priest" => "Sunwell Plateau",
	"Sunblade Mage Guard" => "Magisters' Terrace",
	"Sunblade Protector" => "Sunwell Plateau",
	"Sunblade Slayer" => "Sunwell Plateau",
	"Sunblade Vindicator" => "Sunwell Plateau",
	"Sunseeker Astromage" => "The Mechanar",
	"Sunseeker Botanist" => "The Botanica",
	"Sunseeker Harvester" => "The Botanica",
	"Syphoner" => "Karazhan",
	"Terestian Illhoof" => "Karazhan",
	"The Crone" => "Karazhan",
	"The Prophet Skeram" => "Temple of Ahn'Qiraj",
	"Thorngrin the Tender" => "The Botanica",
	"Thuzadin Shadowcaster" => "Stratholme",
	"Time-Lost Shadowmage" => "Sethekk Halls",
	"Twilight Darkcaster" => "Ahn'kahet: The Old Kingdom",
	"Twilight Emissary" => "Blackrock Depths",
	"Unchained Doombringer" => "The Arcatraz",
	"Underbat" => "The Underbog",
	"Unliving Atal'ai" => "Sunken Temple",
	"Vashj'ir Honor Guard" => "Serpentshrine Cavern",
	"Vem" => "Temple of Ahn'Qiraj",
	"Viscidus" => "Temple of Ahn'Qiraj",
	"Warlord Kalithresh" => "The Steamvault",
	"Warp Splinter" => "The Botanica",
	"Weapon Technician" => "Blackrock Depths",
	"Wrath Hammer Construct" => "Blackrock Depths",
	"Zul'jin" => "Zul'Aman",
	"Zulian Tiger" => "Zul'Gurub",
}

# Neutral = 0
# Alliance = 1
# Horde = 2
$factionmap = {
	"Wild Hearts" => "2",
	"Flash Bomb Recipe" => "0",
	"Imperial Plate Belt" => "0",
	"Imperial Plate Boots" => "0",
	"Imperial Plate Bracer" => "0",
	"Imperial Plate Chest" => "0",
	"Imperial Plate Helm" => "0",
	"Imperial Plate Leggings" => "0",
	"Imperial Plate Shoulders" => "0",
	"Firework Launcher" => "0",
	"Festive Recipes" => "0",
	"Cluster Launcher" => "0",
	"40 Tickets - Schematic: Steam Tonk Controller" => "0",
	"Great-father Winter" => "0",
}

$hordefactionlist = ["Thunder Bluff","Orgrimmar","Durotar","Undercity","Mulgore"]

$alliancefactionlist = ["Stormwind City","Darnassus","Ironforge","Westfall"]

$debug = false

if $debug

	#create_stats_list()

	#create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

else

	create_custom_db()
	create_faction_db()

	alchemy = recipes.get_alchemy_list
	alchspeciallist = {
		2329 => {:id => "Trainer"},
		2330 => {:id => "Trainer"},
		2333 => {:id => "Trainer"},
		28580 => {:id => 12, :type => [3]},
		28581 => {:id => 12, :type => [3]},
		28582 => {:id => 12, :type => [3]},
		28583 => {:id => 12, :type => [3]},
		28584 => {:id => 12, :type => [3]},
		28585 => {:id => 12, :type => [3]},
		28586 => {:id => 12, :type => [2]},
		28587 => {:id => 12, :type => [1]},
		28588 => {:id => 12, :type => [1]},
		28589 => {:id => 12, :type => [1]},
		28590 => {:id => 12, :type => [1]},
		28591 => {:id => 12, :type => [1]},
		41458 => {:id => 12, :type => [4]},
		41500 => {:id => 12, :type => [4]},
		41501 => {:id => 12, :type => [4]},
		41502 => {:id => 12, :type => [4]},
		41503 => {:id => 12, :type => [4]},
		21923 => {:id => 7, :type => 1},
		47050 => {:id => "meleedps"},
		}
	alchmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Alchemy.lua","Alchemy",recipes,maps,"InitAlchemy",alchemy,[2336,6619,11447,17579,22430],alchspeciallist,alchmanual)

	blacksmithing = recipes.get_blacksmithing_list
	bsspeciallist = {
		2660 => {:id => "Trainer"},
		2663 => {:id => "Trainer"},
		3115 => {:id => "Trainer"},
		21913 => {:id => 7, :type => 1},
		28242 => {:id => "ADNaxx40E"},
		28243 => {:id => "ADNaxx40R"},
		28244 => {:id => "ADNaxx40R"},
		}
	bsmanual=<<EOF
	-- Orcish War Leggings -- 9957
	-- Quest
	-- Flags: All classes, Item BoE, Recipe BoP, Armor, Mail, 
	-- Item Stats: 
	-- Item Stats: val17id1val208id6
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB, 9957,230,7929,2,2018)
	self:addTradeFlags(RecipeDB, 9957,2,8,21,22,23,24,25,26,27,28,29,30,36,41,47,58)
	self:addTradeAcquire(RecipeDB, 9957,4,2756)
EOF

	# Add the Orcish War Leggings quest
	$quests[2756] = {:name => "The Old Ways"}
	$quests[2756][:faction] = 2

	create_profession_db("./RecipeDB/ARL-Blacksmith.lua","Blacksmithing",recipes,maps,"InitBlacksmithing",blacksmithing,[2671,8366,8368,9942,9957,16960,16965,16967,16980,16986,16987],bsspeciallist,bsmanual)

	cooking = recipes.get_cooking_list
	cookingspeciallist = {
		2538 => {:id => "Trainer"},
		2540 => {:id => "Trainer"},
		8604 => {:id => "Trainer"},
		21143 => {:id => 7, :type => 1},
		21144 => {:id => 7, :type => 1},
		45022 => {:id => 7, :type => 1},
		43772 => {:id => "Daily", :type => [5]},
		43765 => {:id => "Daily", :type => [5]},
		43761 => {:id => "Daily", :type => [6]},
		43707 => {:id => "Daily", :type => [6]},
		43758 => {:id => "Daily", :type => [5,6]},
		43779 => {:id => "Daily", :type => [5,6]},
		45695 => {:id => "Daily", :type => [7]},
		}
	cookmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Cook.lua","Cooking",recipes,maps,"InitCooking",cooking,[30047],cookingspeciallist,cookmanual)

	enchanting = recipes.get_enchanting_list
	enchantingspeciallist = {
		21931 => {:id => 7, :type => 1},
		46578 => {:id => 7, :type => 4}
		}
	enchantmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Enchant.lua","Enchanting",recipes,maps,"InitEnchanting",enchanting,[22434,28021],enchantingspeciallist,enchantmanual)

	eng = recipes.get_engineering_list
	engspecaillist = {
		3918 => {:id => "Trainer"},
		3919 => {:id => "Trainer"},
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
	engmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Engineer.lua","Engineering",recipes,maps,"InitEngineering",eng,[30573,30343,30342,30349,30561,30549,12722,12720,12900,12719,12904],engspecaillist,engmanual)

	firstaid = recipes.get_firstaid_list
	faspecaillist = {
		3275 => {:id => "Trainer"},
		}
	famanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],faspecaillist,famanual)

	inscription = recipes.get_inscription_list
	insspecaillist = {
		}
	inscriptionmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Inscription.lua","Inscription",recipes,maps,"InitInscription",inscription,[],insspecaillist,inscriptionmanual)

	jewelcrafting = recipes.get_jewelcrafting_list
	jcspecaillist = {
		31101 => {:id => 9},
		43493 => {:id => 9}
		}
	jcmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Jewelcraft.lua","Jewelcrafting",recipes,maps,"InitJewelcrafting",jewelcrafting,[25614,26918,26920,32810],jcspecaillist,jcmanual)

	leatherworking = recipes.get_leatherworking_list
	lwspecaillist = {
		2149 => {:id => "Trainer"},
		2152 => {:id => "Trainer"},
		21943 => {:id => 7, :type => 1},
		44953 => {:id => 7, :type => 1},
		28219 => {:id => "ADNaxx40E"},
		28220 => {:id => "ADNaxx40R"},
		28221 => {:id => "ADNaxx40R"},
		28222 => {:id => "ADNaxx40E"},
		28223 => {:id => "ADNaxx40R"},
		28224 => {:id => "ADNaxx40R"},
		}
	lwmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Leatherwork.lua","Leatherworking",recipes,maps,"InitLeatherworking",leatherworking,[8195,15141,10550,19106,40000],lwspecaillist,lwmanual)

	smelting = recipes.get_mining_list
	smeltingspecaillist = {
		2657 => {:id => "Trainer"},
		}
	smeltmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Smelt.lua","Smelting",recipes,maps,"InitSmelting",smelting,[],smeltingspecaillist,smeltmanual)

	tailoring = recipes.get_tailoring_list
	tailoringspecaillist = {
		2385 => {:id => "Trainer"},
		2387 => {:id => "Trainer"},
		28207 => {:id => "ADNaxx40E"},
		28209 => {:id => "ADNaxx40R"},
		28205 => {:id => "ADNaxx40R"},
		28208 => {:id => "ADNaxx40H"},
		}
	tailoringmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Tailor.lua","Tailoring",recipes,maps,"InitTailoring",tailoring,[7636,12062,12063,12068,12083,12087,12090],tailoringspecaillist,tailoringmanual)

	runeforging = recipes.get_runeforging_list
	runeforgingspecaillist = {
		}
	runeforgingmanual=<<EOF
	-- Rune of the Fallen Crusader - 53344
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Swordshattering - 53323
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Swordbreaking - 54446
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Spellshattering - 53342
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Spellbreaking - 54447
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Razorice - 53343
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Lichbane - 53331
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)

	-- Rune of Cinderglacier - 53341
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28474,1,29194,1,31084,1,28471,1,29195,1,28472,1,29196)
EOF
	create_profession_db("./RecipeDB/ARL-Runeforge.lua","Runeforging",recipes,maps,"InitRuneforging",runeforging,[],runeforgingspecaillist,runeforgingmanual)

	create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])

	create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])

	create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])

	create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

	create_localization_db()

	create_stats_list()

end

puts ""
puts "Finished processing run time was #{((Time.now).to_i-generator_start.to_i)} seconds"
