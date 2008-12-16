=begin

****************************************************************************************

ARLDataminer.rb

Data Mining for all of Ackis Recipe List

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

# Creates the custom acquire database

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

	self:addLookupList(CustomDB, 1, "Discovered by making elixirs or flasks using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 2, "Discovered by making potions using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 3, "Discovered by doing transmutes using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 4, "Discovered by Major Protection Potions using Burning Crusade ingredients.")
	self:addLookupList(CustomDB, 5, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the meat crate.")
	self:addLookupList(CustomDB, 6, "Randomly obtained by completing the cooking daily quest in Shattrath and selecting the fish barrel.")
	self:addLookupList(CustomDB, 7, "Randomly obtained by completing the fishing daily quest in Shattrath.")
	self:addLookupList(CustomDB, 8, "Learnt by default when learning the profession.")
	self:addLookupList(CustomDB, 9, "Recipe is created by Engineers.")
	self:addLookupList(CustomDB, 10, "Quest to obtain the recipe opens up after turning in the Head of Onyxia.")
	self:addLookupList(CustomDB, 11, "Obtained by clicking on a tablet in Zul'Gurub in the Edge of Madness.")
	self:addLookupList(CustomDB, 12, "Discovered by doing transmutes using Wrath of the Lich King ingredients.")
	self:addLookupList(CustomDB, 13, "Goldthorn Tea Henry Stern.")
	self:addLookupList(CustomDB, 14, "Minor Inscription Research.")
	self:addLookupList(CustomDB, 15, "Northrend Inscription Research.")

end

EOF

	customlua.puts(header)
	customlua.close

end

def parse_npc_data(npc,details,typenpc,acquirelisting,flaglisting,npcreact,npcfactions,factionlevels)

	acquire = Hash.new
	flags = Array.new

	acquire.clear
	flags.clear

	if typenpc == "Trainer"
		listing = $trainers
	elsif typenpc == "Vendor"
		listing = $vendors
	elsif typenpc == "Reputation"
		listing = $vendors
	end

	unless npc[:id] == 0
		if not $globalignore.include?(npc[:name])
			if typenpc == "Reputation"
				acquire = {"type" => acquirelisting["Reputation"],
							"id" => npc[:id],
							"faction" => $reps[details[:faction]][:id],
							"factionlevel" => (factionlevels.has_key?(details[:faction_level]) ? factionlevels[details[:faction_level]] : details[:faction_level])
						}
			else
				acquire = {"type" => acquirelisting[typenpc],
							"id" => npc[:id]}
			end
			listing[npc[:id]] = {:name => npc[:name]}

			# Has reaction information
			if not npc[:react] == nil
				# Only has information for one faction
				if not npc[:react][1]
					# We've manually mapped this
					if $factionmap[npc[:name]] == 0
						flags << flaglisting["Alliance"] << flaglisting["Horde"]
						npc[:react][0] = npcreact["Friendly"]
						npc[:react][1] = npcreact["Friendly"]
						$unknownfaction << {:name => npc[:name],
											:react => 0,
											:loc => "N/A"}
					elsif $factionmap[npc[:name]] == 1
						flags << flaglisting["Alliance"]
						npc[:react][0] = npcreact["Friendly"]
						npc[:react][1] = npcreact["Hostile"]
						$unknownfaction << {:name => npc[:name],
											:react => 1,
											:loc => "N/A"}
					elsif $factionmap[npc[:name]] == 2
						flags << flaglisting["Horde"]
						npc[:react][0] = npcreact["Hostile"]
						npc[:react][1] = npcreact["Friendly"]
						$unknownfaction << {:name => npc[:name],
											:react => 2,
											:loc => "N/A"}
					# Has location information
					elsif npc[:locs]
						if $hordefactionlist.include?(npc[:locs][0])
							flags << flaglisting["Horde"]
							listing[npc[:id]][:faction] = npcfactions["Horde"]
							npc[:react][0] = npcreact["Hostile"]
							npc[:react][1] = npcreact["Friendly"]
							$unknownfaction << {:name => npc[:name],
												:react => 2,
												:loc => npc[:locs][0]}
						elsif $alliancefactionlist.include?(npc[:locs][0])
							flags << flaglisting["Alliance"]
							listing[npc[:id]][:faction] = npcfactions["Alliance"]
							npc[:react][0] = npcreact["Friendly"]
							npc[:react][1] = npcreact["Hostile"]
							$unknownfaction << {:name => npc[:name],
												:react => 1,
												:loc => npc[:locs][0]}
						else
							$unknownfaction << {:name => npc[:name],
												:react => "Unknown",
												:loc => npc[:locs][0]}
							flags << flaglisting["Alliance"] << flaglisting["Horde"]
							listing[npc[:id]][:faction] = npcfactions["Neutral"]
						end
					# Does not have location information and is not mapped manually
					else
						$unknownzone << {:name => npc[:name],
										:loc => "Unknown"}
						$unknownfaction << {:name => npc[:name],
											:react => "Unknown",
											:loc => "Unknown"}
						flags << flaglisting["Alliance"] << flaglisting["Horde"]
						listing[npc[:id]][:faction] = npcfactions["Neutral"]					
					end
				# Has both factions identified
				else
					react_a = npc[:react][0].nil? ? 0 : npc[:react][0]
					react_h = npc[:react][1].nil? ? 0 : npc[:react][1]
					if react_a < 3
						flags << flaglisting["Alliance"]
					end
					if react_h < 3
						flags << flaglisting["Horde"]
					end
					listing[npc[:id]][:faction] = react_h < 3 && react_a < 3 ? 0 : react_h == 3 && react_a < 3 ? 1 : react_a == 3 && react_h < 3 ? 2 : 0
				end
			# Have we manually mapped this npc?
			elsif $factionmap[npc[:name]] == 0
				npc[:react] = []
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				npc[:react][0] = npcreact["Friendly"]
				npc[:react][1] = npcreact["Friendly"]
				$unknownfaction << {:name => npc[:name],
									:react => 0,
									:loc => "N/A"}
			elsif $factionmap[npc[:name]] == 1
				npc[:react] = []
				flags << flaglisting["Alliance"]
				npc[:react][0] = npcreact["Friendly"]
				npc[:react][1] = npcreact["Hostile"]
				$unknownfaction << {:name => npc[:name],
									:react => 1,
									:loc => "N/A"}
			elsif $factionmap[npc[:name]] == 2
				npc[:react] = []
				flags << flaglisting["Horde"]
				npc[:react][0] = npcreact["Hostile"]
				npc[:react][1] = npcreact["Friendly"]
				$unknownfaction << {:name => npc[:name],
									:react => 2,
									:loc => "N/A"}
			# No reaction information and it's not mapped
			else
				npc[:react] = []
				$unknownfaction << {:name => npc[:name],
									:react => "None",
									:loc => "Unknown"}
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				npc[:react][0] = npcreact["Friendly"]
				npc[:react][1] = npcreact["Friendly"]
			end
		end
	end

	return flags,acquire

end

def parse_quest_data(quest,acquirelisting,flaglisting,npcfactions,maps)

	acquire = Hash.new
	flags = Array.new

	acquire.clear
	flags.clear

	if not $globalignore.include?(quest[:name])
		acquire = {"type" => acquirelisting["Quest"], 
					"id" => quest[:id]}
		$quests[quest[:id]] = {:name => quest[:name]}
		if quest[:side] == 1
			flags << flaglisting["Alliance"] << flaglisting["Horde"]
			$quests[quest[:id]][:faction] = npcfactions["Neutral"]
		elsif quest[:side] == 2
			flags << flaglisting["Alliance"]
			$quests[quest[:id]][:faction] = npcfactions["Alliance"]
		elsif quest[:side] == 4
			flags << flaglisting["Horde"]
			$quests[quest[:id]][:faction] = npcfactions["Horde"]
		elsif $factionmap[quest[:name]] == 0
			flags << flaglisting["Alliance"] << flaglisting["Horde"]
			$quests[quest[:id]][:faction] = npcfactions["Neutral"]
			$unknownfaction << {:name => quest[:name],
								:react => "0"}
		elsif $factionmap[quest[:name]] == 1
			flags << flaglisting["Alliance"]
			$quests[quest[:id]][:faction] = npcfactions["Alliance"]
			$unknownfaction << {:name => quest[:name],
								:react => "1"}
		elsif $factionmap[quest[:name]] == 2
			flags << flaglisting["Horde"]
			$quests[quest[:id]][:faction] = npcfactions["Horde"]
			$unknownfaction << {:name => quest[:name],
								:react => "2"}
		else
			$unknownfaction << {:name => quest[:name],
								:react => "Unknown"}
		end
		quest[:questinfo] = maps.get_quest_map_info(quest[:id])
		if quest[:questinfo]
			quest[:questinfo][:quest_zones].values do |loc|
				if $dungeons[loc]
					flags << flaglisting["Instance"]
				end
				if $raids[loc]
					flags << flaglisting["Raid"]
				end
			end
		else
			$unknownzone << {:name => quest[:name],
							:loc => "Unknown"}
		end
	end

	return flags,acquire

end

def add_npc_trainer(npcid,npcname,npcfac,npcfactions,acquirelisting)

	$trainers[npcid] = {:name => npcname}
	$trainers[npcid][:faction] = npcfactions[npcfac]
	acquire = {"type" => acquirelisting["Trainer"],
				"id" => npcid}
	return acquire

end

# Creates a database file for the specific recipe
# TODO: Optimize the code for this function

def create_profession_db(file,profession,db,maps,funcstub,recipes,ignorerecipe,specialcase,manual)

	factionlevels = {
		"Neutral"	=> 0,
		"Friendly" => 1,
		"Honored" => 2,
		"Revered" => 3,
		"Exalted" => 4
	}
	npcfactions = {
		"Horde" => 2,
		"Alliance" => 1,
		"Neutral" => 0,
	}
	npcreact = {
		"Hostile" => 3,
		"Neutral" => 3,
		"Friendly" => 3,
	}
	# List of all general flags
	flaglisting = {
		"Alliance" => 1,
		"Horde" => 2,
		"Trainer" => 3,
		"Vendor" => 4,
		"Instance" => 5,
		"Raid" => 6,
		"Seasonal" => 7,
		"Quest" => 8,
		"World Drop" => 10,
		"Mob Drop" => 11,
		"Discovery" => 12,
	}
	# Class specific flags
	classes = {
		"Deathknight" => 21,
		"Druid" => 22,
		"Hunter" => 23,
		"Mage"=> 24,
		"Paladin" => 25,
		"Priest" => 26,
		"Shaman" => 27,
		"Rogue" => 28,
		"Warlock" => 29,
		"Warrior" => 30
	}
	# Weapon specific flags
	weapons = {
		"One-Hand" => 66,
		"Two-Handed" => 67,
		"Axe" => 68,
		"Sword" => 69,
		"Mace"=> 70,
		"Polearm" => 71,
		"Dagger" => 72,
		"Staff" => 73,
		"Wand" => 74,
		"Thrown" => 75,
		"Bow" => 76,
		"Crossbow" => 77,
		"Ammo" => 78,
		"Fist" => 79
	}
	# Armor specific flags
	armors = {
		"Cloth" => 56,
		"Leather" => 57,
		"Mail" => 58,
		"Plate" => 59,
		"Cloak" => 60,
		"Neck" => 61,
		"Ring" => 62,
		"Trinket" => 63,
		"Shield" => 64
	}
	# Player type flags
	playertypeflags = {
		"MeleeDPS" => 51,
		"Tanking" => 52,
		"Healing" => 53,
		"Caster" => 54,
	}
	acquirelisting = {
		"Trainer" => 1,
		"Vendor" => 2,
		"Mob" => 3,
		"Quest" => 4,
		"Seasonal" => 5,
		"Reputation" => 6,
		"World Drop" => 7,
		"Custom" => 8,
	}

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

#{profession} data for all of Ackis Recipe List

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
	print "\n"

	flags = Array.new
	acquire = Array.new

	count = 0

	# Parse through all the keys
	ordered_keys.each do |name|

		if count == 50
			print "\n"
			count = 0
		end

		print "."

		count = count + 1
		STDOUT.flush

		details = recipes[name]
		proflua.print("\t-- #{name} -- #{details[:spellid]}")

		details[:method].split(",").each do |method|

			case method

			# trainers
			when 'taught-by'
				data = details[:method_trainers]
				flags << flaglisting["Trainer"]
				if details[:learned] == 1
					flags << flaglisting["Alliance"] << flaglisting["Horde"]
				else
					# Parse all the NPC's
					data.each do |npc|
						foo,bar = parse_npc_data(npc,details,"Trainer",acquirelisting,flaglisting,npcreact,npcfactions,factionlevels)
						flags << foo
						if bar != {} then
							acquire << bar
						end
					end
				end
			# vendors
			when 'sold-by'
				flags << flaglisting["Vendor"]
				data = details[:method_vendors]
				# Reputation vendor
				unless details[:faction].nil?
					flags << $reps[details[:faction]][:flag]
					data.each do |npc|
						foo,bar = parse_npc_data(npc,details,"Reputation",acquirelisting,flaglisting,npcreact,npcfactions,factionlevels)
						flags << foo
						if bar != {} then
							acquire << bar
						end
					end
				# Normal vendor
				else
					data.each do |npc|
						foo,bar = parse_npc_data(npc,details,"Vendor",acquirelisting,flaglisting,npcreact,npcfactions,factionlevels)
						flags << foo
						if bar != {} then
							acquire << bar
						end
					end

				end
			# Mob drops
			when 'dropped-by'
				data = details[:method_drops]
				# Cheat and say that it's both horde/alliance
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				# Instance, mob, or raid drop
				unless data.length > 10
					data.each do |npc|
						unless npc[:id] == 0
							acquire << {"type" => acquirelisting["Mob"],
										"id" => npc[:id]}
							$monsters[npc[:id]] = {:name => npc[:name]}
							# The NPC has a location mined
							if npc[:locs]
								npc[:locs].each do |loc|
									if $dungeons[loc]
										flags << flaglisting["Instance"]
									elsif $raids[loc]
										flags << flaglisting["Raid"]
									else
										flags << flaglisting["Mob Drop"]
									end
								end
							# There was no NPC location mined
							else
								# The NPC has been manually added to our list
								if $bosszonemap[npc[:name]]
									$unknownzone << {:name => npc[:name],
													:loc => $bosszonemap[npc[:name]]}
									found = false
									# Go through all the dungeons
									$dungeons.each_pair do |id,dname|
										if dname[:name] == $bosszonemap[npc[:name]]
											flags << flaglisting["Instance"]
											found = true
										end
									end
									if not found
										# Go through all the raids
										$raids.each_pair do |id,dname|
											if dname[:name] == $bosszonemap[npc[:name]]
												flags << flaglisting["Raid"]
												found = true
											end
										end
									end
									if not found
										flags << flaglisting["Mob Drop"]
									end
								else
									$unknownzone << {:name => npc[:name],
													:loc => "Unknown Zone"}
								end
							end
						end
					end
				# World drop
				else
					flags << flaglisting["World Drop"]
					acquire << {"type" => acquirelisting["World Drop"],
								"id" => details[:rarity]}
				end
			# Quest reward
			when 'rewardfrom'
				data = details[:method_quests]
				flags << flaglisting["Quest"]
				data.each do |quest|
					foo,bar = parse_quest_data(quest,acquirelisting,flaglisting,npcfactions,maps)
					flags << foo
					if bar != {} then
						acquire << bar
					end
				end
			end
		end

		# Add class flags
		# No class flags, add all the classes to it
		if details[:classes].nil?
			flags << classes["Deathknight"] << classes["Druid"] << classes["Hunter"] << classes["Mage"]
			flags << classes["Paladin"] << classes["Priest"] << classes["Shaman"]
			flags << classes["Rogue"] << classes["Warlock"] << classes["Warrior"]
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
			unless details[:weapon_hands].nil?
				flags << weapons[details[:weapon_hands]]
			end
			unless details[:weapon_slot].nil?
				flags << weapons[details[:weapon_slot]]
			end
		end
		# Add armor flags
		if details[:is_armor]
			unless details[:armor_type].nil?
				flags << armors[details[:armor_type]]
			end
		end

		# Handle special cases
		if specialcase[details[:spellid]]

			case specialcase[details[:spellid]][:id]
			when 7
				flags << flaglisting["Seasonal"]
				acquire << {"type" => acquirelisting["Seasonal"],
						"id" => specialcase[details[:spellid]][:type]}
			when 9
				flags << flaglisting["PVP"]
			when 12
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Custom"],
								"id" => i}
				end
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Quest"])
			when "Quest"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Quest"]
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Quest"],
								"id" => i}
				end
			when "HordeQuest"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags << flaglisting["Horde"] << flaglisting["Quest"]
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Quest"],
								"id" => i}
				end
			when "AllyQuest"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags << flaglisting["Alliance"] << flaglisting["Quest"]
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Quest"],
								"id" => i}
				end
			when "ThistleTea"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(classes["Deathknight"])
				flags.delete(classes["Druid"])
				flags.delete(classes["Hunter"])
				flags.delete(classes["Mage"])
				flags.delete(classes["Paladin"])
				flags.delete(classes["Priest"])
				flags.delete(classes["Shaman"])
				flags.delete(classes["Warlock"])
				flags.delete(classes["Warrior"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Quest"] <<	flaglisting["Vendor"] << classes["Rogue"]
				acquire << {"type" => acquirelisting["Quest"],
							"id" => 2359}
				acquire << {"type" => acquirelisting["Quest"],
							"id" => 2478}
				acquire << {"type" => acquirelisting["Vendor"],
							"id" => 6779}
				$quests[2359] = {:name => "Klaven's Tower",
								:faction => npcfactions["Alliance"]}
				$quests[2478] = {:name => "Mission: Possible But Not Probable",
								:faction => npcfactions["Horde"]}
				$vendors[6779] = {:name => "Smudge Thunderwood",
								:faction => npcfactions["Neutral"]}
			when "Onyxia"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Quest"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Quest"] << flaglisting["Raid"]
				$quests[7493] = {:name => "The Journey Has Just Begun",
								:faction => npcfactions["Horde"]}
				$quests[7497] = {:name => "The Journey Has Just Begun",
								:faction => npcfactions["Alliance"]}
				acquire << {"type" => acquirelisting["Quest"],
							"id" => 7493}
				acquire << {"type" => acquirelisting["Quest"],
							"id" => 7497}
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 10}
			when "Edge of Madness"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Quest"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Raid"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 11}
			when "MinorInscriptionResearch"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 13}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "NorthrendInscriptionResearch"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 14}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "CustomNeutral"
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => specialcase[details[:spellid]][:type]}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "StartingSkill"
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 8}
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "MasterAlchTrainer"
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 18802}
				$trainers[18802] = {:name => "Alchemist Gribble"}
				$trainers[18802][:faction] = npcfactions["Alliance"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 16588}
				$trainers[16588] = {:name => "Apothecary Antonivich"}
				$trainers[16588][:faction] = npcfactions["Horde"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 27023}
				$trainers[27023] = {:name => "Apothecary Bressa"}
				$trainers[27023][:faction] = npcfactions["Horde"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 27029}
				$trainers[27029] = {:name => "Apothecary Wormwick"}
				$trainers[27029][:faction] = npcfactions["Horde"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 19052}
				$trainers[19052] = {:name => "Lorokeem"}
				$trainers[19052][:faction] = npcfactions["Neutral"]
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterAlchTrainer"
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26975}
				$trainers[26975] = {:name => "Arthur Henslowe"}
				$trainers[26975][:faction] = npcfactions["Horde"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26987}
				$trainers[26987] = {:name => "Falorn Nightwhisper"}
				$trainers[26987][:faction] = npcfactions["Alliance"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26903}
				$trainers[26903] = {:name => "Lanolis Dewdrop"}
				$trainers[26903][:faction] = npcfactions["Alliance"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 28703}
				$trainers[28703] = {:name => "Linzy Blackbolt"}
				$trainers[28703][:faction] = npcfactions["Neutral"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26951}
				$trainers[26951] = {:name => "Wilhelmina Renel"}
				$trainers[26951][:faction] = npcfactions["Horde"]
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterBSTrainer"
				acquire << add_npc_trainer(28694, "Alard Schmied", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26988, "Argo Strongstout", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26564, "Borus Ironbender", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(29924, "Brandig", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26981, "Crog Steelspine", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(27034, "Josric Fame", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26952, "Kristen Smythe", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26904, "Rosina Rivet", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterCookTrainer"
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 29631}
				$trainers[29631] = {:name => "Awilo Lon'gomba"}
				$trainers[29631][:faction] = npcfactions["Horde"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26905}
				$trainers[26905] = {:name => "Brom Brewbaster"}
				$trainers[26905][:faction] = npcfactions["Alliance"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 28705}
				$trainers[28705] = {:name => "Katherine Lee"}
				$trainers[28705][:faction] = npcfactions["Alliance"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26972}
				$trainers[26972] = {:name => "Orn Tenderhoof"}
				$trainers[26972][:faction] = npcfactions["Horde"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26989}
				$trainers[26989] = {:name => "Rollick MacKreel"}
				$trainers[26989][:faction] = npcfactions["Alliance"]
				acquire << {"type" => acquirelisting["Trainer"],
							"id" => 26953}
				$trainers[26953] = {:name => "Thomas Kolichio"}
				$trainers[26953][:faction] = npcfactions["Horde"]
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterEnchTrainer"
				acquire << add_npc_trainer(26990, "Alexis Marlowe", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26906, "Elizabeth Jackson", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26954, "Emil Autumn", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28693, "Enchanter Nalthanis", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26980, "Eorain Dawnstrike", "Horde", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterEngTrainer"
				acquire << add_npc_trainer(25277, "Chief Engineer Leveny", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26955, "Jamesina Watterly", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28697, "Juston Oshenko", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26991, "Scoks Brightbolt", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26907, "Tisha Longbridge", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "InscTrainer"
				acquire << add_npc_trainer(30713, "Catarina Stanford", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30717, "Elise Brightletter", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30715, "Feyden Darkin", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30706, "Jo'mah", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30711, "Margaux Parchley", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30709, "Poshken Hardbinder", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30716, "Thoth", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30710, "Zantasia", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30721, "Michael Schwan", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30722, "Neferatti", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26977, "Adelene Sunlance", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26959, "Booker Kells", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26916, "Mindri Dinkles", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28702, "Professor Pallin", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26995, "Tink Brightbolt", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "MasterInscTrainer"
				acquire << add_npc_trainer(30721, "Michael Schwan", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(30722, "Neferatti", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26977, "Adelene Sunlance", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26959, "Booker Kells", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26916, "Mindri Dinkles", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28702, "Professor Pallin", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26995, "Tink Brightbolt", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterInscTrainer"
				acquire << add_npc_trainer(26977, "Adelene Sunlance", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26959, "Booker Kells", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26916, "Mindri Dinkles", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28702, "Professor Pallin", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26995, "Tink Brightbolt", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterJCTrainer"
				acquire << add_npc_trainer(26997, "Alestos", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26960, "Carter Tiffens", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26982, "Geba'li", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26915, "Ounhulo", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28701, "Timothy Jones", "Neutral", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterLWTrainer"
				acquire << add_npc_trainer(26996, "Awan Iceborn", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26911, "Bernadette Dexter", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28700, "Diane Cannings", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26961, "Gunter Hansen", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26998, "Rosemary Bovard", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterTailorTrainer"
				acquire << add_npc_trainer(26964, "Alexandra McQueen", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26914, "Benjamin Clegg", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28699, "Charles Worth", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(27001, "Darin Goodstitch", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26969, "Raenah", "Horde", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "meleedps"
				flags << playertypeflags["MeleeDPS"]
			when "Alliance"
				flags << flaglisting["Alliance"]
			when "Horde"
				flags << flaglisting["Horde"]
			when "Daily"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Seasonal"])
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["PVP"])
				flags.delete(flaglisting["World Drop"])
				flags.delete(flaglisting["Mob Drop"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				specialcase[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Custom"],
							"id" => i}
				end
			when "class"
				# Remove all the other class flags
				flags.delete(classes["Deathknight"])
				flags.delete(classes["Druid"])
				flags.delete(classes["Hunter"])
				flags.delete(classes["Mage"])
				flags.delete(classes["Paladin"])
				flags.delete(classes["Priest"])
				flags.delete(classes["Shaman"])
				flags.delete(classes["Rogue"])
				flags.delete(classes["Warlock"])
				flags.delete(classes["Warrior"])
				flags.concat(specialcase[details[:spellid]][:type])
			when "ADNaxx40H"
				# Remove all the acquire flags
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Seasonal"])
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["PVP"])
				flags.delete(flaglisting["World Drop"])
				flags.delete(flaglisting["Mob Drop"])
				flags.delete(flaglisting["Discovery"])
				# Add Horde, Alliance, Vendor, Reputation, Argent Dawn flags
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Vendor"] << flaglisting["Raid"] << flaglisting["Argent Dawn"]
				acquire << {"type" => acquirelisting["Reputation"],
							"id" => 16365,
							"faction" => 529,
							"factionlevel" => factionlevels["Honored"]}
				$vendors[16365] = {:name => "Master Craftsman Omarion"}
				$vendors[16365][:faction] = npcfactions["Neutral"]
			when "ADNaxx40R"
				# Remove all the acquire flags
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Seasonal"])
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["PVP"])
				flags.delete(flaglisting["World Drop"])
				flags.delete(flaglisting["Mob Drop"])
				flags.delete(flaglisting["Discovery"])
				# Add Horde, Alliance, Vendor, Reputation, Argent Dawn flags
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Vendor"] << flaglisting["Raid"] << flaglisting["Argent Dawn"]
				acquire << {"type" => acquirelisting["Reputation"],
							"id" => 16365,
							"faction" => 529,
							"factionlevel" => factionlevels["Revered"]}
				$vendors[16365] = {:name => "Master Craftsman Omarion"}
				$vendors[16365][:faction] = npcfactions["Neutral"]
			when "ADNaxx40E"
				# Remove all the acquire flags
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Seasonal"])
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["PVP"])
				flags.delete(flaglisting["World Drop"])
				flags.delete(flaglisting["Mob Drop"])
				flags.delete(flaglisting["Discovery"])
				# Add Horde, Alliance, Vendor, Reputation, Argent Dawn flags
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Vendor"] << flaglisting["Raid"] << flaglisting["Argent Dawn"]
				acquire << {"type" => acquirelisting["Reputation"],
							"id" => 16365,
							"faction" => 529,
							"factionlevel" => factionlevels["Exalted"]}
				$vendors[16365] = {:name => "Master Craftsman Omarion"}
				$vendors[16365][:faction] = npcfactions["Neutral"]
			when "specialty"
				if not details[:specialty]
					details[:specialty] = specialcase[details[:spellid]][:type]
				else
					proflua.print("\n\t-- Warning: Manually overriding specialty for a recipe that already has one.\n\t--")
				end
			end

		end

		# Player type stats
		unless details[:item_stats] == nil
			stats = {}
			details[:item_stats].each do |s|
				stats[s[:id]] = s[:val]
			end
			# We have tanking type stats
			if stats[26] or stats[27] or stats[28] or stats[31]
				flags << playertypeflags["Tanking"]
			end
			# Spell hit or spell penetration
			if stats[21] or stats[23]
				proflua.print("Caster DPS, ")
				flags << playertypeflags["Caster"]
			end
			# We have a spell damage and healing stat
			if stats[19] and stats[20]
				# If healing is higher than spell damage
				if stats[20] > stats[19]
					if not stats[26] or not stats[27] or not stats[28] or not stats[31]
						flags << playertypeflags["Healing"]
					end
				else
					flags << playertypeflags["Caster"]
				end
			end
		end

		if ignorerecipe.include?(details[:spellid])
			proflua.print("\n\t--")
		else
			proflua.print("\n\t")
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
		flags.flatten!
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
		if not ignorerecipe.include?(details[:spellid]) and acquire.length == 0
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

	puts "\nProcessing #{profession} data complete..."

	proflua.puts(manual)
	proflua.puts "\treturn recipecount\n\nend"
	proflua.close

end

# Creates the lookup table for trainer/vendor/quest/mobs

def create_lookup_db(file,type,db,funcstub,list,maps,ignorelist)

	puts "Generating #{type} file .. #{list.length} entries to process"
	lookup_lua = File.open(file, "w:utf-8")

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

			# Assumption that ID will always be around
			lookup_lua.print("self:addLookupList(#{db},#{k},")

			# Add the name, will assume there always will be one
			# If the name is in babble, remove it from our localizations
			if $bosslist.include?(v[:name])
				lookup_lua.print("BBOSS[\"#{v[:name]}\"],")
				$localstring.delete(v[:name])
			# If the name isn't in babble, add it to localization strings just to be sure
			else
				lookup_lua.print("L[\"#{v[:name]}\"],")
				# Add the name to the list of localization strings
				$localstring << v[:name]
			end

			# See if we have a location
			if locs.keys[0]
				lookup_lua.print("BZONE[\"#{locs.keys[0]}\"],")
			# No location, see if we manually have it mapped
			else
				if $bosszonemap[v[:name]]
					lookup_lua.print("BZONE[\"#{$bosszonemap[v[:name]]}\"],")
				# Identify it as an unknown zone
				else
					lookup_lua.print("L[\"Unknown Zone\"],")
					$unknownzone << {:name => v[:name], :loc => "Unknown Zone"}
				end
			end

			# Add coords if applicable
			if x and y
				lookup_lua.print("#{x},#{y}")
			else
				lookup_lua.print("0,0")
			end

			# Don't care about faction information for Monsters
			if type == "Monster"
				lookup_lua.print(")")
			else
				if v[:faction]
					lookup_lua.print("#{v[:faction]})")
				else
					if $factionmap[v[:name]]
						lookup_lua.print("#{$factionmap[v[:name]]})")
					else
						lookup_lua.print("0)")
					end
				end
				# Add the name to the list of localization strings
				$localstring << v[:name]
			end
			lookup_lua.print("\n")
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
Currently maintained by: Ackis

Please make sure you update the ToC file with any translations.

The enUS file is auto-generated from the data miner.  If you need to make changes,
please update the data miner file otherwise they will be overwritten.

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
L["SCAN_RECIPES_DESC"]		= "Scans an open tradeskill for missing recipes.  Press shift to generate a text dump."
L["Text Dump"]				= true
L["TEXT_DUMP_DESC"]			= "Displays all recipes in a comma separated value format which can be copied and pasted into another client."
L["View Exclusion List"]	= true
L["Scan Button Position"]	= true
L["SCANBUTTONPOSITION_DESC"] = "Allows you to customize where the scan button is placed on the tradeskill frame."
L["VIEW_EXCLUSION_LIST_DESC"] = "Prints out a list of all recipes on the exclusion list."
L["DISPLAY_SETTINGS_DESC"]	= "Allows you to customize how the GUI behaves."
L["SORTING_SETTINGS_DESC"]	= "Allows you to customize the way displayed recipes are sorted."
L["ARL_DOC_DESC"]			= "Documentation for Ackis Recipe List"

-- UI Documentation
L["Using Filters"]			= true
L["USING_FILTERS_DESC"]		= "Filters may be toggled on or off.  There are two types of filters: one which will prevent the recipe from showing up at all, and one which will prevent a specific type of acquire information from showing up.\\nWith the first type of filter, these match the proprieties of the recipe (ie: binding).  If you toggle ARL to not show BoP recipes, no recipes that are BoP will show up in the scan.  The second type of filter deals with acquire information.  If a recipe is available as a mob drop, or from a vendor and you toggle to not show vendor recipes, the recipe will still show up but vendor information will be hidden for it.  The reason is that there is still another way to acquire this recipe (mob drop) so it should still be included in the scan."
L["Reporting Bugs"]			= true
L["REPORTING_BUGS_DESC"]	= "When reporting a bug, please make sure you do the following:\\n1) Download the latest version, available from http://www.wowace.com/projects/arl/files/\\n2) Make sure there is not a bug report filed for your issue already.  You can check these at http://www.wowace.com/projects/arl/tickets/\\n2a) Disable addons such as Skillet or ATSW.\\n3) If your problem is not listed and you are using the latest version verify your addon settings.  Verify filters, profiles, etc.\\n4) You have found a bug that no one has reported before.  Create a new ticket at http://www.wowace.com/projects/arl/tickets/ with a descriptive heading about the problem.  In the ticket make sure you include the error message that you received (just the error message, I don't need a listing of the addons you use), the recipe/profession you were working with, and any other info that you think may help."

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
L["TOOLTIP_SCALE_DESC"]		= "Changes the scale of the ARL tooltip. Ranges from .5 to 1.5 (.9 is default)"
L["Sorting"]				= true
L["Sort"]					= true
L["Display"]				= true
L["SORTING_DESC"]			= "Change the way in which displayed recipes are sorted."
L["Version"]				= "Version: "
L["Right"]					= true
L["Left"]					= true
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
L["STAFF_DESC"]				= "Recipes that make stave's should be included in the scan."
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
L["CLEAR_DESC"]				= "Clear the search text box."
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
L["NOT_YET_SCANNED"]		= "not yet scanned!"

-- Common Tool tip Strings (where different from above)
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

-- Monster/Quest/Trainer/Vendor (auto-generatored) strings:

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

	stats_lua = File.open("RecipeStats.txt", "w:utf-8")

	$unknownzone.uniq!

	stats_lua.puts("Unknown zones:")

	$unknownzone.sort_by { |unknownzone| unknownzone[:name] }.each do |k|
		stats_lua.puts "\t\#\"#{k[:name]}\" => \"#{k[:loc]}\","
	end

	stats_lua.puts "\n"

	$unknownfaction.uniq!

	stats_lua.puts("\nUnknown faction:")

	$unknownfaction.sort_by { |unknownfaction| unknownfaction[:name] }.each do |k|
		if k[:loc] == "N/A"
			stats_lua.puts "\t\#\"#{k[:name]}\" => #{k[:react]},"
		else
			stats_lua.puts "\t\#\"#{k[:name]}\" => #{k[:react]}, \# #{k[:loc]}"
		end
	end

	stats_lua.puts("\n\nNo acquire information:")

	# Sort the output
	sorted_keys = $missingdataacquire.sort { |a,b| a[:sprof] <=> b[:sprof] || a[:id] <=> b[:id] }

	sorted_keys.each do |k|
		v = $missingdataacquire[k]
		stats_lua.puts "#{k} - #{v[:sname]} - #{v[:sprof]}"
	end

	stats_lua.puts "\n"	

	stats_lua.close

end

recipes = WoWDBRecipes.new
maps = WoWDBMaps.new

$dungeons = maps.get_dungeon_maps
$raids = maps.get_raid_maps

# List of professions and their ID's
$proftable = {
	"Alchemy" => 2259,
	"Blacksmithing" => 2018,
	"Cooking" => 2550,
	"Enchanting" => 7411,
	"Engineering" => 4036,
	"First Aid"	=> 746,
	"Leatherworking" => 2108,
	"Smelting" => 2575,
	"Tailoring" => 3908,
	"Jewelcrafting"	=> 25229,
	"Inscription" => 45357,
	"Runeforging" => 28481
	}

# List imported from babble boss
$bosslist = [
	"Anubisath Defender",
	"Battleguard Sartura",
	"C'Thun",
	"Emperor Vek'lor",
	"Emperor Vek'nilash",
	"Eye of C'Thun",
	"Fankriss the Unyielding",
	"Lord Kri",
	"Ouro",
	"Princess Huhuran",
	"Princess Yauj",
	"The Bug Family",
	"The Prophet Skeram",
	"The Twin Emperors",
	"Vem",
	"Viscidus",
	"Exarch Maladaar",
	"Shirrak the Dead Watcher",
	"Nexus-Prince Shaffar",
	"Pandemonius",
	"Tavarok",
	"Ambassador Hellmaw",
	"Blackheart the Inciter",
	"Grandmaster Vorpil",
	"Murmur",
	"Anzu",
	"Darkweaver Syth",
	"Talon King Ikiss",
	"Aku'mai",
	"Baron Aquanis",
	"Gelihast",
	"Ghamoo-ra",
	"Lady Sarevess",
	"Old Serra'kis",
	"Twilight Lord Kelris",
	"Ambassador Flamelash",
	"Anger'rel",
	"Anub'shiah",
	"Bael'Gar",
	"Chest of The Seven",
	"Doom'rel",
	"Dope'rel",
	"Emperor Dagran Thaurissan",
	"Eviscerator",
	"Fineous Darkvire",
	"General Angerforge",
	"Gloom'rel",
	"Golem Lord Argelmach",
	"Gorosh the Dervish",
	"Grizzle",
	"Hate'rel",
	"Hedrum the Creeper",
	"High Interrogator Gerstahn",
	"High Priestess of Thaurissan",
	"Houndmaster Grebmar",
	"Hurley Blackbreath",
	"Lord Incendius",
	"Lord Roccor",
	"Magmus",
	"Ok'thor the Breaker",
	"Overmaster Pyron",
	"Panzor the Invincible",
	"Phalanx",
	"Plugger Spazzring",
	"Princess Moira Bronzebeard",
	"Pyromancer Loregrain",
	"Ribbly Screwspigot",
	"Seeth'rel",
	"The Seven Dwarves",
	"Verek",
	"Vile'rel",
	"Warder Stilgiss",
	"Bannok Grimaxe",
	"Burning Felguard",
	"Crystal Fang",
	"Ghok Bashguud",
	"Gizrul the Slavener",
	"Halycon",
	"Highlord Omokk",
	"Mor Grayhoof",
	"Mother Smolderweb",
	"Overlord Wyrmthalak",
	"Quartermaster Zigris",
	"Shadow Hunter Vosh'gajin",
	"Spirestone Battle Lord",
	"Spirestone Butcher",
	"Spirestone Lord Magus",
	"Urok Doomhowl",
	"War Master Voone",
	"General Drakkisath",
	"Goraluk Anvilcrack",
	"Gyth",
	"Jed Runewatcher",
	"Lord Valthalak",
	"Pyroguard Emberseer",
	"Solakar Flamewreath",
	"The Beast",
	"Warchief Rend Blackhand",
	"Broodlord Lashlayer",
	"Chromaggus",
	"Ebonroc",
	"Firemaw",
	"Flamegor",
	"Grethok the Controller",
	"Lord Victor Nefarius",
	"Nefarian",
	"Razorgore the Untamed",
	"Vaelastrasz the Corrupt",
	"Essence of Anger",
	"Essence of Desire",
	"Essence of Suffering",
	"Gathios the Shatterer",
	"Gurtogg Bloodboil",
	"High Nethermancer Zerevor",
	"High Warlord Naj'entus",
	"Illidan Stormrage",
	"Illidari Council",
	"Lady Malande",
	"Mother Shahraz",
	"Reliquary of Souls",
	"Shade of Akama",
	"Supremus",
	"Teron Gorefiend",
	"The Illidari Council",
	"Veras Darkshadow",
	"Malygos",
	"Anomalus",
	"Grand Magus Telestra",
	"Keristrasza",
	"Ormorok the Tree-Shaper",
	"Drakos the Interrogator",
	"Ley-Guardian Eregos",
	"Mage-Lord Urom",
	"Varos Cloudstrider",
	"Captain Skarloc",
	"Epoch Hunter",
	"Lieutenant Drake",
	"Meathook",
	"Chrono-Lord Epoch",
	"Mal'Ganis",
	"Salramm the Fleshcrafter",
	"Aeonus",
	"Chrono Lord Deja",
	"Medivh",
	"Temporus",
	"Sartharion",
	"Shadron",
	"Tenebron",
	"Vesperon",
	"Coilfang Elite",
	"Coilfang Strider",
	"Fathom-Lord Karathress",
	"Hydross the Unstable",
	"Lady Vashj",
	"Leotheras the Blind",
	"Morogrim Tidewalker",
	"Pure Spawn of Hydross",
	"Shadow of Leotheras",
	"Tainted Spawn of Hydross",
	"The Lurker Below",
	"Tidewalker Lurker",
	"Mennu the Betrayer",
	"Quagmirran",
	"Rokmar the Crackler",
	"Ahune",
	"Hydromancer Thespia",
	"Mekgineer Steamrigger",
	"Warlord Kalithresh",
	"Claw",
	"Ghaz'an",
	"Hungarfen",
	"Overseer Tidewrath",
	"Swamplord Musel'ek",
	"The Black Stalker",
	"Mushgog",
	"Skarr the Unbreakable",
	"The Razza",
	"Alzzin the Wildshaper",
	"Hydrospawn",
	"Isalien",
	"Lethtendris",
	"Pimgib",
	"Pusillin",
	"Zevrim Thornhoof",
	"Captain Kromcrush",
	"Cho'Rush the Observer",
	"Guard Fengus",
	"Guard Mol'dar",
	"Guard Slip'kik",
	"King Gordok",
	"Knot Thimblejack's Cache",
	"Stomper Kreeg",
	"Illyanna Ravenoak",
	"Immol'thar",
	"Lord Hel'nurath",
	"Magister Kalendris",
	"Prince Tortheldrin",
	"Tendris Warpwood",
	"Tsu'zee",
	"Elder Nadox",
	"Herald Volazj",
	"Jedoga Shadowseeker",
	"Prince Taldaram",
	"Anub'arak",
	"Hadronox",
	"Krik'thir the Gatewatcher",
	"Crowd Pummeler 9-60",
	"Dark Iron Ambassador",
	"Electrocutioner 6000",
	"Grubbis",
	"Mekgineer Thermaplugg",
	"Techbot",
	"Viscous Fallout",
	"King Dred",
	"Novos the Summoner",
	"The Prophet Tharon'ja",
	"Trollgore",
	"Blindeye the Seer",
	"Gruul the Dragonkiller",
	"High King Maulgar",
	"Kiggler the Crazed",
	"Krosh Firehand",
	"Olm the Summoner",
	"Nazan",
	"Omor the Unscarred",
	"Vazruden the Herald",
	"Vazruden",
	"Watchkeeper Gargolmar",
	"Hellfire Channeler",
	"Magtheridon",
	"Broggok",
	"Keli'dan the Breaker",
	"The Maker",
	"Blood Guard Porung",
	"Grand Warlock Nethekurse",
	"Warbringer O'mrogg",
	"Warchief Kargath Bladefist",
	"Constructor & Controller",
	"Dalronn the Controller",
	"Ingvar the Plunderer",
	"Prince Keleseth",
	"Skarvald the Constructor",
	"Skadi the Ruthless",
	"King Ymiron",
	"Svala Sorrowgrave",
	"Gortok Palehoof",
	"Anetheron",
	"Archimonde",
	"Azgalor",
	"Kaz'rogal",
	"Rage Winterchill",
	"Arcane Watchman",
	"Attumen the Huntsman",
	"Chess Event",
	"Dorothee",
	"Dust Covered Chest",
	"Grandmother",
	"Hyakiss the Lurker",
	"Julianne",
	"Kil'rek",
	"King Llane Piece",
	"Maiden of Virtue",
	"Midnight",
	"Moroes",
	"Netherspite",
	"Nightbane",
	"Prince Malchezaar",
	"Restless Skeleton",
	"Roar",
	"Rokad the Ravager",
	"Romulo & Julianne",
	"Romulo",
	"Shade of Aran",
	"Shadikith the Glider",
	"Strawman",
	"Terestian Illhoof",
	"The Big Bad Wolf",
	"The Crone",
	"The Curator",
	"Tinhead",
	"Tito",
	"Warchief Blackhand Piece",
	"Priestess Delrissa",
	"Selin Fireheart",
	"Vexallus",
	"Celebras the Cursed",
	"Gelk",
	"Kolk",
	"Landslide",
	"Lord Vyletongue",
	"Magra",
	"Maraudos",
	"Meshlok the Harvester",
	"Noxxion",
	"Princess Theradras",
	"Razorlash",
	"Rotgrip",
	"Tinkerer Gizlock",
	"Veng",
	"Baron Geddon",
	"Cache of the Firelord",
	"Garr",
	"Gehennas",
	"Golemagg the Incinerator",
	"Lucifron",
	"Magmadar",
	"Majordomo Executus",
	"Ragnaros",
	"Shazzrah",
	"Sulfuron Harbinger",
	"Anub'Rekhan",
	"Deathknight Understudy",
	"Feugen",
	"Four Horsemen Chest",
	"Gluth",
	"Gothik the Harvester",
	"Grand Widow Faerlina",
	"Grobbulus",
	"Heigan the Unclean",
	"Highlord Mograine",
	"Instructor Razuvious",
	"Kel'Thuzad",
	"Lady Blaumeux",
	"Loatheb",
	"Maexxna",
	"Noth the Plaguebringer",
	"Patchwerk",
	"Sapphiron",
	"Sir Zeliek",
	"Stalagg",
	"Thaddius",
	"Thane Korth'azz",
	"The Four Horsemen",
	"Onyxia",
	"Bazzalan",
	"Jergosh the Invoker",
	"Maur Grimtotem",
	"Taragaman the Hungerer",
	"Amnennar the Coldbringer",
	"Glutton",
	"Mordresh Fire Eye",
	"Plaguemaw the Rotting",
	"Ragglesnout",
	"Tuten'kash",
	"Agathelos the Raging",
	"Blind Hunter",
	"Charlga Razorflank",
	"Death Speaker Jargba",
	"Earthcaller Halmgar",
	"Overlord Ramtusk",
	"Anubisath Guardian",
	"Ayamiss the Hunter",
	"Buru the Gorger",
	"General Rajaxx",
	"Kurinnaxx",
	"Lieutenant General Andorov",
	"Moam",
	"Ossirian the Unscarred",
	"Herod",
	"High Inquisitor Fairbanks",
	"High Inquisitor Whitemane",
	"Scarlet Commander Mograine",
	"Azshir the Sleepless",
	"Bloodmage Thalnos",
	"Fallen Champion",
	"Interrogator Vishas",
	"Ironspine",
	"Headless Horseman",
	"Arcanist Doan",
	"Houndmaster Loksey",
	"Blood Steward of Kirtonos",
	"Darkmaster Gandling",
	"Death Knight Darkreaver",
	"Doctor Theolen Krastinov",
	"Instructor Malicia",
	"Jandice Barov",
	"Kirtonos the Herald",
	"Kormok",
	"Lady Illucia Barov",
	"Lord Alexei Barov",
	"Lorekeeper Polkelt",
	"Marduk Blackpool",
	"Ras Frostwhisper",
	"Rattlegore",
	"The Ravenian",
	"Vectus",
	"Archmage Arugal",
	"Arugal's Voidwalker",
	"Baron Silverlaine",
	"Commander Springvale",
	"Deathsworn Captain",
	"Fenrus the Devourer",
	"Odo the Blindwatcher",
	"Razorclaw the Butcher",
	"Wolf Master Nandos",
	"Archivist Galford",
	"Balnazzar",
	"Baron Rivendare",
	"Baroness Anastari",
	"Black Guard Swordsmith",
	"Cannon Master Willey",
	"Crimson Hammersmith",
	"Fras Siabi",
	"Hearthsinger Forresten",
	"Magistrate Barthilas",
	"Maleki the Pallid",
	"Nerub'enkan",
	"Postmaster Malown",
	"Ramstein the Gorger",
	"Skul",
	"Stonespine",
	"The Unforgiven",
	"Timmy the Cruel",
	"Kalecgos",
	"Sathrovarr the Corruptor",
	"Brutallus",
	"Felmyst",
	"Kil'jaeden",
	"M'uru",
	"Entropius",
	"The Eredar Twins",
	"Lady Sacrolash",
	"Grand Warlock Alythess",
	"Dalliah the Doomsayer",
	"Harbinger Skyriss",
	"Warden Mellichar",
	"Wrath-Scryer Soccothrates",
	"Zereketh the Unbound",
	"Commander Sarannis",
	"High Botanist Freywinn",
	"Laj",
	"Thorngrin the Tender",
	"Warp Splinter",
	"Al'ar",
	"Cosmic Infuser",
	"Devastation",
	"Grand Astromancer Capernian",
	"High Astromancer Solarian",
	"Infinity Blades",
	"Kael'thas Sunstrider",
	"Lord Sanguinar",
	"Master Engineer Telonicus",
	"Netherstrand Longbow",
	"Phaseshift Bulwark",
	"Solarium Agent",
	"Solarium Priest",
	"Staff of Disintegration",
	"Thaladred the Darkener",
	"Void Reaver",
	"Warp Slicer",
	"Gatewatcher Gyro-Kill",
	"Gatewatcher Iron-Hand",
	"Mechano-Lord Capacitus",
	"Nethermancer Sepethrea",
	"Pathaleon the Calculator",
	"Brainwashed Noble",
	"Captain Greenskin",
	"Cookie",
	"Edwin VanCleef",
	"Foreman Thistlenettle",
	"Gilnid",
	"Marisa du'Paige",
	"Miner Johnson",
	"Mr. Smite",
	"Rhahk'Zor",
	"Sneed",
	"Sneed's Shredder",
	"Bazil Thredd",
	"Bruegal Ironknuckle",
	"Dextren Ward",
	"Hamhock",
	"Kam Deepfury",
	"Targorr the Dread",
	"Atal'alarion",
	"Avatar of Hakkar",
	"Dreamscythe",
	"Gasher",
	"Hazzas",
	"Hukku",
	"Jade",
	"Jammal'an the Prophet",
	"Kazkaz the Unholy",
	"Loro",
	"Mijan",
	"Morphaz",
	"Ogom the Wretched",
	"Shade of Eranikus",
	"Veyzhak the Cannibal",
	"Weaver",
	"Zekkis",
	"Zolo",
	"Zul'Lor",
	"Ancient Stone Keeper",
	"Archaedas",
	"Baelog",
	"Digmaster Shovelphlange",
	"Galgann Firehammer",
	"Grimlok",
	"Ironaya",
	"Obsidian Sentinel",
	"Revelosh",
	"General Bjarngrim",
	"Ionar",
	"Loken",
	"Volkhan",
	"Krystallus",
	"Maiden of Grief",
	"Sjonnir The Ironshaper",
	"The Tribunal of Ages",
	"Cyanigosa",
	"Erekem",
	"Ichoron",
	"Lavanthor",
	"Moragg",
	"Xevozz",
	"Zuramat the Obliterator",
	"Boahn",
	"Deviate Faerie Dragon",
	"Kresh",
	"Lady Anacondra",
	"Lord Cobrahn",
	"Lord Pythas",
	"Lord Serpentis",
	"Mad Magglish",
	"Mutanus the Devourer",
	"Skum",
	"Trigore the Lasher",
	"Verdan the Everliving",
	"Avalanchion",
	"Azuregos",
	"Baron Charr",
	"Baron Kazum",
	"Doom Lord Kazzak",
	"Doomwalker",
	"Emeriss",
	"High Marshal Whirlaxis",
	"Lethon",
	"Lord Kazzak",
	"Lord Skwol",
	"Prince Skaldrenox",
	"Princess Tempestria",
	"Taerar",
	"The Windreaver",
	"Ysondre",
	"Akil'zon",
	"Halazzi",
	"Jan'alai",
	"Malacrass",
	"Nalorakk",
	"Zul'jin",
	"Hex Lord Malacrass",
	"Antu'sul",
	"Chief Ukorz Sandscalp",
	"Dustwraith",
	"Gahz'rilla",
	"Hydromancer Velratha",
	"Murta Grimgut",
	"Nekrum Gutchewer",
	"Oro Eyegouge",
	"Ruuzlu",
	"Sandarr Dunereaver",
	"Sandfury Executioner",
	"Sergeant Bly",
	"Shadowpriest Sezz'ziz",
	"Theka the Martyr",
	"Witch Doctor Zum'rah",
	"Zerillis",
	"Zul'Farrak Dead Hero",
	"Eck the Ferocious",
	"Drakkari Colossus",
	"Gal'darah",
	"Moorabi",
	"Slad'ran",
	"Bloodlord Mandokir",
	"Gahz'ranka",
	"Gri'lek",
	"Hakkar",
	"Hazza'rah",
	"High Priest Thekal",
	"High Priest Venoxis",
	"High Priestess Arlokk",
	"High Priestess Jeklik",
	"High Priestess Mar'li",
	"Jin'do the Hexxer",
	"Renataki",
	"Wushoolay",
	"Brokentoe",
	"Mogor",
	"Murkblood Twin",
	"Murkblood Twins",
	"Rokdar the Sundered Lord",
	"Skra'gath",
	"The Blue Brothers",
	"Warmaul Champion",
]

# Manual mapping of mobs to their zones
$bosszonemap = {
	"Amani'shi Protector" => "Zul'Aman",
	"Apocalypse Guard" => "Sunwell Plateau",
	"Ayamiss the Hunter" => "Ruins of Ahn'Qiraj",
	"Buru the Gorger" => "Ruins of Ahn'Qiraj",
	"Cannon Master Willey" => "Stratholme",
	"Cataclysm Hound" => "Sunwell Plateau",
	"Crimson Inquisitor" => "Stratholme",
	"Crimson Sorcerer" => "Stratholme",
	"Doomfire Destroyer" => "Sunwell Plateau",
	"Fel Rager" => "Blade's Edge Mountains",
	"General Rajaxx" => "Ruins of Ahn'Qiraj",
	"Illidari Heartseeker" => "Black Temple",
	"Ironbark Protector" => "Dire Maul",
	"Kurinnaxx" => "Ruins of Ahn'Qiraj",
	"Lord Kazzak" => "Blasted Lands",
	"Magister Kalendris" => "Dire Maul",
	"Maleki the Pallid" => "Stratholme",
	"Moam" => "Ruins of Ahn'Qiraj",
	"Oblivion Mage" => "Sunwell Plateau",
	"Ossirian the Unscarred" => "Ruins of Ahn'Qiraj",
	"Painbringer" => "Sunwell Plateau",
	"Priestess Delrissa" => "Magisters' Terrace",
	"Priestess of Torment" => "Sunwell Plateau",
	"Pusillin" => "Dire Maul",
	"Shadowsword Assassin" => "Sunwell Plateau",
	"Shadowsword Guardian" => "Sunwell Plateau",
	"Shadowsword Vanquisher" => "Sunwell Plateau",
	"Shrike Bat" => "Uldaman",
	"Sister of Torment" => "Magisters' Terrace",
	"Splinterbone Centurion" => "Razorfen Downs",
	"Stonevault Oracle" => "Uldaman",
	"Stonevault Pillager" => "Uldaman",
	"Stormforged Giant" => "Halls of Lightning",
	"Sunblade Arch Mage" => "Sunwell Plateau",
	"Sunblade Cabalist" => "Sunwell Plateau",
	"Sunblade Dawn Priest" => "Sunwell Plateau",
	"Sunblade Dusk Priest" => "Sunwell Plateau",
	"Sunblade Slayer" => "Sunwell Plateau",
	"Sunblade Vindicator" => "Sunwell Plateau",
	"The Journey Has Just Begun" => "Onyxia's Lair",
	"Thuzadin Shadowcaster" => "Stratholme",
}

# Manual mapping of npc/quests to their factions
$factionmap = {
	"40 Tickets - Schematic: Steam Tonk Controller" => 0, # 
	"Ainethil" => 1, # 1657
	"Alanna Raveneye" => 1, # N/A
	"Alchemist Gribble" => 1, # N/A
	"Alegorn" => 1, # 1657
	"Aleinia" => 2, # 3430
	"Alexandra Bolero" => 1, # 1519
	"Alys Vol'tyr" => 2, # N/A
	"Amin" => 2, # 3487
	"Amy Davenport" => 1, # N/A
	#"Ancient Female Vrykul" => Unknown, # 495
	"Andrew Hilbert" => 2, # N/A
	"Apothecary Antonivich" => 2, # N/A
	"Arnok" => 2, # 1637
	"Arras" => 1, # 3557
	"Arred" => 1, # 3557
	"Artificer Daelo" => 1, # N/A
	"Bale" => 2, # N/A
	"Banalash" => 2, # N/A
	"Barim Spilthoof" => 2, # N/A
	"Baxter" => 2, # N/A
	"Belil" => 2, # 3487
	"Bemarrin" => 2, # 3487
	"Betty Quin" => 1, # 1519
	"Borgosh Corebender" => 2, # 1637
	"Borgus Steelhand" => 1, # 1519
	"Borto" => 1, # N/A
	"Borya" => 2, # 1637
	"Bowen Brisboise" => 2, # N/A
	"Bradley Towns" => 2, # N/A
	"Brek Stonehoof" => 2, # 1638
	"Bronk Guzzlegear" => 1, # N/A
	"Burbik Gearspanner" => 1, # 1537
	"Burko" => 1, # N/A
	"Byancie" => 1, # N/A
	"Camberon" => 2, # 3487
	"Captured Gnome" => 2, # N/A
	"Celie Steelwing" => 1, # N/A
	"Cluster Launcher" => 0, # 
	"Cyndra Kindwhisper" => 1, # N/A
	"Daga Ramba" => 2, # N/A
	"Daggle Ironshaper" => 1, # N/A
	"Dalinna" => 2, # N/A
	"Dane Lindgren" => 1, # 1519
	"Daniel Bartlett" => 2, # 1497
	"Dannelor" => 1, # 1657
	"Danwe" => 2, # 3487
	"Darianna" => 1, # 1657
	"Derek Odds" => 1, # N/A
	"Deynna" => 2, # 3487
	"Doba" => 1, # N/A
	"Doctor Herbert Halsey" => 2, # 1497
	"Doctor Marsh" => 2, # 1497
	"Dolothos" => 2, # 3487
	"Drakk Stonehand" => 1, # N/A
	"Edrem" => 1, # 3557
	"Egomis" => 1, # 3557
	"Elynna" => 1, # 1657
	"Emrul Riknussun" => 1, # 1537
	"Erika Tate" => 1, # 1519
	"Faldron" => 1, # 1657
	"Farii" => 1, # 3557
	"Feera" => 1, # 3557
	"Felannia" => 2, # N/A
	"Felicia Doan" => 2, # 1497
	"Felika" => 2, # 1637
	"Feruul" => 1, # 3557
	"Festive Recipes" => 0, # 
	"Fimble Finespindle" => 1, # 1537
	"Firework Launcher" => 0, # 
	"Flash Bomb Recipe" => 0, # 
	"Franklin Lloyd" => 2, # 1497
	"Fyldan" => 1, # 1657
	"Gambarinka" => 2, # N/A
	"Gara Skullcrush" => 2, # N/A
	"Gaston" => 1, # N/A
	"Gearcutter Cogspinner" => 1, # 1537
	"Gelanthis" => 2, # 3487
	"Gelman Stonehand" => 1, # 1519
	"Georgio Bolero" => 1, # N/A
	"Ghak Healtouch" => 1, # 38
	"Ghermas" => 1, # 3557
	"Gimble Thistlefuzz" => 1, # 1537
	"Gloresse" => 2, # 3487
	"Godan" => 2, # 1637
	#"Gorgolon the All-seeing" => None, # Unknown
	"Graham Van Talen" => 2, # 1497
	"Great-father Winter" => 0, # N/A
	"Gremlock Pilsnor" => 1, # 1
	"Grutah" => 2, # 3520
	"Guillaume Sorouy" => 2, # 130
	"Haalrun" => 1, # 3521
	"Haferet" => 1, # 3557
	"Hagrus" => 2, # 1637
	"Hahrana Ironhide" => 3, # 357
	"Hama" => 1, # 3483
	"Hurnak Grimmord" => 1, # 3483
	"Imperial Plate Belt" => 0, # 
	"Imperial Plate Boots" => 0, # 
	"Imperial Plate Bracer" => 0, # 
	"Imperial Plate Chest" => 0, # 
	"Imperial Plate Helm" => 0, # 
	"Imperial Plate Leggings" => 0, # 
	"Imperial Plate Shoulders" => 0, # 
	"Innkeeper Grilka" => 2, # 14
	"James Van Brunt" => 2, # 1497
	"Jessara Cordell" => 1, # 1519
	"Jhag" => 2, # 1637
	"Johan Focht" => 2, # 130
	"Josef Gregorian" => 2, # 1497
	"Josephine Lister" => 2, # 1497
	"K. Lee Smallfry" => 1, # 3521
	"Kalaen" => 2, # 85
	"Kalinda" => 2, # 3487
	"Kamari" => 2, # 1637
	"Karolek" => 2, # 1637
	"Kayaart" => 1, # 3557
	"Keelen Sheets" => 2, # 3487
	"Kelgruk Bloodaxe" => 2, # 1637
	"Kendor Kabonka" => 1, # 1519
	"Kithas" => 2, # 1637
	"Knight Dameron" => 1, # 4197
	"Kor'geld" => 2, # 1637
	"Krek Cragcrush" => 2, # 3520
	"Krugosh" => 2, # 3483
	"Kudrii" => 1, # 3557
	"Kylanna Windwhisper" => 1, # 357
	"Landraelanis" => 2, # 3430
	"Lavinia Crowe" => 2, # 1497
	"Lawrence Schneider" => 1, # 1519
	"Leeli Longhaggle" => 1, # 3519
	"Lilyssia Nightbreeze" => 1, # 1519
	"Linna Bruder" => 1, # 4395
	"Logannas" => 1, # 357
	"Logistics Officer Brighton" => 1, # N/A
	"Logistics Officer Silverstone" => 1, # N/A
	"Loolruna" => 1, # 3521
	"Lucan Cordell" => 1, # 1519
	"Lyna" => 2, # 3487
	"Lynalis" => 2, # 3487
	"Magar" => 2, # 1637
	"Mahu" => 2, # 1638
	"Makaru" => 2, # 1637
	"Malcomb Wynn" => 2, # 1497
	"Mari Stonehand" => 1, # 3520
	"Maria Lumere" => 1, # 1519
	"Mary Edras" => 2, # 1497
	"Master Chef Mouldier" => 2, # 3433
	"Me'lynn" => 1, # 1657
	"Miall" => 1, # 3557
	"Miao'zan" => 2, # 14
	"Milla Fairancora" => 1, # 1657
	"Millie Gregorian" => 2, # 1497
	"Mirvedon" => 2, # 3487
	"Misensi" => 2, # 65
	"Muaat" => 1, # 3557
	"Muheru the Weaver" => 1, # 3521
	"Mythrin'dir" => 1, # 1657
	"Nadyia Maneweaver" => 1, # 141
	"Nahogg" => 1, # 3557
	"Neii" => 1, # 3557
	"Nissa Firestone" => 1, # 1537
	"Nogg" => 2, # 1637
	"Nula the Butcher" => 2, # 3518
	"Nurse Neela" => 2, # N/A
	"Nus" => 1, # 3557
	"Nyoma" => 1, # 141
	"Okothos Ironrager" => 2, # 1637
	"Outfitter Eric" => 1, # 1537
	"Padaar" => 1, # 3557
	"Phea" => 1, # 3557
	"Provisioner Lorkran" => 2, # 394
	"Quartermaster Urgronn" => 2, # 3483
	"Randal Worth" => 1, # 1519
	"Rartar" => 2, # 8
	"Rawrk" => 2, # 14
	"Razia" => 2, # 3487
	"Refik" => 1, # 3557
	"Rhiannon Davis" => 2, # 1497
	"Rogvar" => 2, # 8
	"Rohok" => 2, # 3483
	"Ronald Burch" => 2, # 1497
	"Roxxik" => 2, # 1637
	"Rungor" => 2, # 3519
	"Saenorion" => 1, # 1657
	"Saru Steelfury" => 2, # 1637
	"Sassa Weldwell" => 1, # 3522
	"Sebastian Crane" => 2, # N/A
	"Sedana" => 2, # 3487
	"Seer Janidi" => 2, # 3521
	"Sellandus" => 1, # 1519
	"Sewa Mistrunner" => 2, # 1638
	"Shankys" => 2, # 1637
	"Shayis Steelfury" => 2, # 1637
	"Sid Limbardi" => 1, # 1
	"Simon Tanner" => 1, # 1519
	"Snang" => 2, # 1637
	"Snarl" => 2, # 1637
	"Sovik" => 2, # 1637
	"Sprite Jumpsprocket" => 1, # 1519
	"Stephen Ryback" => 1, # 1519
	"Stone Guard Mukar" => 2, # 4197
	"Sylvanna Forestmoon" => 1, # 1657
	"Taladan" => 1, # 1657
	"Talmar" => 2, # 3487
	"Tamar" => 2, # 1637
	"Tansy Puddlefizz" => 1, # 1537
	"Tarn" => 2, # 1638
	"Tatiana" => 1, # 139
	"Tel'Athir" => 1, # 1519
	"Telonis" => 1, # 1657
	"Thaddeus Webb" => 2, # 1497
	"Thamner Pol" => 1, # N/A
	"Thonys Pillarstone" => 1, # 1537
	"Thund" => 2, # 1637
	"Tilli Thistlefuzz" => 1, # 1537
	"Tognus Flintfire" => 1, # 1
	"Trianna" => 1, # 1657
	"Truk Wildbeard" => 1, # 47
	"Ug'thok" => 2, # 1637
	"Ulthir" => 1, # 1657
	"Una" => 2, # 1638
	"Uthok" => 2, # 33
	"Uthrar Threx" => 1, # 1537
	"Vaean" => 1, # 1657
	"Vance Undergloom" => 2, # 85
	"Vhan" => 2, # 1638
	"Victor Ward" => 2, # 406
	"Vix Chromeblaster" => 2, # N/A
	"Wulan" => 2, # 405
	"Xen'to" => 2, # 1637
	"Xylinnia Starshine" => 1, # 357
	"Yarr Hammerstone" => 1, # 1
	"Yatheon" => 2, # 3487
	"Yelmak" => 2, # 1637
	"Zamja" => 2, # 1637
	"Zaralda" => 2, # 3487
	"Zarrin" => 1, # 141
	"Zurai" => 2, # 3521
}

$hordefactionlist = [
	215, # "Mulgore",
	1638, # "Thunder Bluff",
	1637, # "Orgrimmar",
	14, # "Durotar",
	1497, # "Undercity",
	3487, # Silvermoon
	3430, # "Eversong Woods",
	3433, # "Ghostlands"
	]

$alliancefactionlist = [
	12, # Elwynn Forrest
	1519, # "Stormwind City",
	1657, # "Darnassus",
	1537, # "Ironforge",
	40, # "Westfall"
	3557, #The Exodar
]

$globalignore = [
	"Living Ruby Serpent",
	"Outland Children's Week Dark Portal Trigger",
	"Outland Children's Week Exodar 01 Trigger",
	"Outland Children's Week Silvermoon 01 Trigger",
	"Skeletal Fiend (Enraged Form)",
]

$debug = false

alchspeciallist = {
	2329 => {:id => "StartingSkill"},
	2330 => {:id => "StartingSkill"},
	2333 => {:id => "StartingSkill"},
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
	53771 => {:id => 12, :type => [12]},
	53773 => {:id => 12, :type => [12]},
	53774 => {:id => 12, :type => [12]},
	53775 => {:id => 12, :type => [12]},
	53776 => {:id => 12, :type => [12]},
	53777 => {:id => 12, :type => [12]},
	53779 => {:id => 12, :type => [12]},
	53780 => {:id => 12, :type => [12]},
	53781 => {:id => 12, :type => [12]},
	53782 => {:id => 12, :type => [12]},
	53783 => {:id => 12, :type => [12]},
	53784 => {:id => 12, :type => [12]},
	21923 => {:id => 7, :type => 1},
	47050 => {:id => "meleedps"},
	11456 => {:id => "CustomNeutral", :type => 9},
	24266 => {:id => "Edge of Madness"},
	45061 => {:id => "MasterAlchTrainer"},
	53812 => {:id => "GrandMasterAlchTrainer"},
	53836 => {:id => "GrandMasterAlchTrainer"},
	53837 => {:id => "GrandMasterAlchTrainer"},
	53838 => {:id => "GrandMasterAlchTrainer"},
	53839 => {:id => "GrandMasterAlchTrainer"},
	53840 => {:id => "GrandMasterAlchTrainer"},
	53841 => {:id => "GrandMasterAlchTrainer"},
	53842 => {:id => "GrandMasterAlchTrainer"},
	53847 => {:id => "GrandMasterAlchTrainer"},
	53848 => {:id => "GrandMasterAlchTrainer"},
	53895 => {:id => "GrandMasterAlchTrainer"},
	53898 => {:id => "GrandMasterAlchTrainer"},
	53899 => {:id => "GrandMasterAlchTrainer"},
	53900 => {:id => "GrandMasterAlchTrainer"},
	53901 => {:id => "GrandMasterAlchTrainer"},
	53902 => {:id => "GrandMasterAlchTrainer"},
	53903 => {:id => "GrandMasterAlchTrainer"},
	53904 => {:id => "GrandMasterAlchTrainer"},
	53905 => {:id => "GrandMasterAlchTrainer"},
	54020 => {:id => "GrandMasterAlchTrainer"},
	54213 => {:id => "GrandMasterAlchTrainer"},
	54218 => {:id => "GrandMasterAlchTrainer"},
	54220 => {:id => "GrandMasterAlchTrainer"},
	54221 => {:id => "GrandMasterAlchTrainer"},
	54222 => {:id => "GrandMasterAlchTrainer"},
	56519 => {:id => "GrandMasterAlchTrainer"},
	57425 => {:id => "GrandMasterAlchTrainer"},
	57427 => {:id => "GrandMasterAlchTrainer"},
	58868 => {:id => "GrandMasterAlchTrainer"},
	58871 => {:id => "GrandMasterAlchTrainer"},
	60350 => {:id => "GrandMasterAlchTrainer"},
	60354 => {:id => "GrandMasterAlchTrainer"},
	60355 => {:id => "GrandMasterAlchTrainer"},
	60356 => {:id => "GrandMasterAlchTrainer"},
	60357 => {:id => "GrandMasterAlchTrainer"},
	60365 => {:id => "GrandMasterAlchTrainer"},
	60366 => {:id => "GrandMasterAlchTrainer"},
	60367 => {:id => "GrandMasterAlchTrainer"},
	60396 => {:id => "GrandMasterAlchTrainer"},
	60403 => {:id => "GrandMasterAlchTrainer"},
	60405 => {:id => "GrandMasterAlchTrainer"},
	60893 => {:id => "GrandMasterAlchTrainer"},
	11452 => {:id => "Quest", :type => [2203,2501]},
	}
alchmanual=<<EOF
EOF

bsspeciallist = {
	2660 => {:id => "StartingSkill"},
	2663 => {:id => "StartingSkill"},
	2671 => {:id => "StartingSkill"},
	3115 => {:id => "StartingSkill"},
	21913 => {:id => 7, :type => 1},
	28242 => {:id => "ADNaxx40E"},
	28243 => {:id => "ADNaxx40R"},
	28244 => {:id => "ADNaxx40R"},
	52567 => {:id => "GrandMasterBSTrainer"},
	52568 => {:id => "GrandMasterBSTrainer"},
	52569 => {:id => "GrandMasterBSTrainer"},
	52570 => {:id => "GrandMasterBSTrainer"},
	52571 => {:id => "GrandMasterBSTrainer"},
	52572 => {:id => "GrandMasterBSTrainer"},
	54550 => {:id => "GrandMasterBSTrainer"},
	54551 => {:id => "GrandMasterBSTrainer"},
	54552 => {:id => "GrandMasterBSTrainer"},
	54553 => {:id => "GrandMasterBSTrainer"},
	54554 => {:id => "GrandMasterBSTrainer"},
	54555 => {:id => "GrandMasterBSTrainer"},
	54556 => {:id => "GrandMasterBSTrainer"},
	54557 => {:id => "GrandMasterBSTrainer"},
	54917 => {:id => "GrandMasterBSTrainer"},
	54918 => {:id => "GrandMasterBSTrainer"},
	54941 => {:id => "GrandMasterBSTrainer"},
	54944 => {:id => "GrandMasterBSTrainer"},
	54945 => {:id => "GrandMasterBSTrainer"},
	54946 => {:id => "GrandMasterBSTrainer"},
	54947 => {:id => "GrandMasterBSTrainer"},
	54948 => {:id => "GrandMasterBSTrainer"},
	54949 => {:id => "GrandMasterBSTrainer"},
	55013 => {:id => "GrandMasterBSTrainer"},
	55014 => {:id => "GrandMasterBSTrainer"},
	55015 => {:id => "GrandMasterBSTrainer"},
	55017 => {:id => "GrandMasterBSTrainer"},
	55055 => {:id => "GrandMasterBSTrainer"},
	55056 => {:id => "GrandMasterBSTrainer"},
	55057 => {:id => "GrandMasterBSTrainer"},
	55058 => {:id => "GrandMasterBSTrainer"},
	55174 => {:id => "GrandMasterBSTrainer"},
	55177 => {:id => "GrandMasterBSTrainer"},
	55179 => {:id => "GrandMasterBSTrainer"},
	55181 => {:id => "GrandMasterBSTrainer"},
	55182 => {:id => "GrandMasterBSTrainer"},
	55183 => {:id => "GrandMasterBSTrainer"},
	55184 => {:id => "GrandMasterBSTrainer"},
	55185 => {:id => "GrandMasterBSTrainer"},
	55186 => {:id => "GrandMasterBSTrainer"},
	55187 => {:id => "GrandMasterBSTrainer"},
	55200 => {:id => "GrandMasterBSTrainer"},
	55201 => {:id => "GrandMasterBSTrainer"},
	55202 => {:id => "GrandMasterBSTrainer"},
	55203 => {:id => "GrandMasterBSTrainer"},
	55204 => {:id => "GrandMasterBSTrainer"},
	55206 => {:id => "GrandMasterBSTrainer"},
	55298 => {:id => "GrandMasterBSTrainer"},
	55300 => {:id => "GrandMasterBSTrainer"},
	55301 => {:id => "GrandMasterBSTrainer"},
	55302 => {:id => "GrandMasterBSTrainer"},
	55303 => {:id => "GrandMasterBSTrainer"},
	55304 => {:id => "GrandMasterBSTrainer"},
	55305 => {:id => "GrandMasterBSTrainer"},
	55306 => {:id => "GrandMasterBSTrainer"},
	55307 => {:id => "GrandMasterBSTrainer"},
	55308 => {:id => "GrandMasterBSTrainer"},
	55309 => {:id => "GrandMasterBSTrainer"},
	55310 => {:id => "GrandMasterBSTrainer"},
	55311 => {:id => "GrandMasterBSTrainer"},
	55312 => {:id => "GrandMasterBSTrainer"},
	55369 => {:id => "GrandMasterBSTrainer"},
	55370 => {:id => "GrandMasterBSTrainer"},
	55371 => {:id => "GrandMasterBSTrainer"},
	55372 => {:id => "GrandMasterBSTrainer"},
	55373 => {:id => "GrandMasterBSTrainer"},
	55374 => {:id => "GrandMasterBSTrainer"},
	55375 => {:id => "GrandMasterBSTrainer"},
	55376 => {:id => "GrandMasterBSTrainer"},
	55377 => {:id => "GrandMasterBSTrainer"},
	55628 => {:id => "GrandMasterBSTrainer"},
	55641 => {:id => "GrandMasterBSTrainer"},
	55656 => {:id => "GrandMasterBSTrainer"},
	55732 => {:id => "GrandMasterBSTrainer"},
	55834 => {:id => "GrandMasterBSTrainer"},
	55835 => {:id => "GrandMasterBSTrainer"},
	55839 => {:id => "GrandMasterBSTrainer"},
	56234 => {:id => "GrandMasterBSTrainer"},
	56280 => {:id => "GrandMasterBSTrainer"},
	56357 => {:id => "GrandMasterBSTrainer"},
	56400 => {:id => "GrandMasterBSTrainer"},
	56549 => {:id => "GrandMasterBSTrainer"},
	56550 => {:id => "GrandMasterBSTrainer"},
	56551 => {:id => "GrandMasterBSTrainer"},
	56552 => {:id => "GrandMasterBSTrainer"},
	56553 => {:id => "GrandMasterBSTrainer"},
	56554 => {:id => "GrandMasterBSTrainer"},
	56555 => {:id => "GrandMasterBSTrainer"},
	56556 => {:id => "GrandMasterBSTrainer"},
	59405 => {:id => "GrandMasterBSTrainer"},
	59406 => {:id => "GrandMasterBSTrainer"},
	59436 => {:id => "GrandMasterBSTrainer"},
	59438 => {:id => "GrandMasterBSTrainer"},
	59440 => {:id => "GrandMasterBSTrainer"},
	59441 => {:id => "GrandMasterBSTrainer"},
	59442 => {:id => "GrandMasterBSTrainer"},
	61008 => {:id => "GrandMasterBSTrainer"},
	61009 => {:id => "GrandMasterBSTrainer"},
	61010 => {:id => "GrandMasterBSTrainer"},
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

cookingspeciallist = {
	2538 => {:id => "StartingSkill"},
	2540 => {:id => "StartingSkill"},
	8604 => {:id => "StartingSkill"},
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
	9513 => {:id => "ThistleTea"},
	13028 => {:id => "CustomNeutral", :type => 13},
	24801 => {:id => "Quest", :type => [8313]},
	45549 => {:id => "GrandMasterCookTrainer"},
	45550 => {:id => "GrandMasterCookTrainer"},
	45551 => {:id => "GrandMasterCookTrainer"},
	45552 => {:id => "GrandMasterCookTrainer"},
	45553 => {:id => "GrandMasterCookTrainer"},
	45554 => {:id => "GrandMasterCookTrainer"},
	45560 => {:id => "GrandMasterCookTrainer"},
	45561 => {:id => "GrandMasterCookTrainer"},
	45562 => {:id => "GrandMasterCookTrainer"},
	45563 => {:id => "GrandMasterCookTrainer"},
	45564 => {:id => "GrandMasterCookTrainer"},
	45565 => {:id => "GrandMasterCookTrainer"},
	45566 => {:id => "GrandMasterCookTrainer"},
	45569 => {:id => "GrandMasterCookTrainer"},
	#53056 => {:id => "GrandMasterCookTrainer"},
	57421 => {:id => "GrandMasterCookTrainer"},
	#57423 => {:id => "GrandMasterCookTrainer"},
	58065 => {:id => "GrandMasterCookTrainer"},
	}
cookmanual=<<EOF
EOF

enchantingspeciallist = {
	7418 => {:id => "StartingSkill"},
	7421 => {:id => "StartingSkill"},
	7428 => {:id => "StartingSkill"},
	21931 => {:id => 7, :type => 1},
	46578 => {:id => 7, :type => 4},
	60619 => {:id => "GrandMasterEnchTrainer"},
	44630 => {:id => "GrandMasterEnchTrainer"},
	60606 => {:id => "GrandMasterEnchTrainer"},
	44528 => {:id => "GrandMasterEnchTrainer"},
	44508 => {:id => "GrandMasterEnchTrainer"},
	44584 => {:id => "GrandMasterEnchTrainer"},
	60623 => {:id => "GrandMasterEnchTrainer"},
	44589 => {:id => "GrandMasterEnchTrainer"},
	44555 => {:id => "GrandMasterEnchTrainer"},
	44598 => {:id => "GrandMasterEnchTrainer"},
	44635 => {:id => "GrandMasterEnchTrainer"},
	44616 => {:id => "GrandMasterEnchTrainer"},
	44593 => {:id => "GrandMasterEnchTrainer"},
	60616 => {:id => "GrandMasterEnchTrainer"},
	60767 => {:id => "GrandMasterEnchTrainer"},
	47766 => {:id => "GrandMasterEnchTrainer"},
	44509 => {:id => "GrandMasterEnchTrainer"},
	44492 => {:id => "GrandMasterEnchTrainer"},
	47900 => {:id => "GrandMasterEnchTrainer"},
	44623 => {:id => "GrandMasterEnchTrainer"},
	60663 => {:id => "GrandMasterEnchTrainer"},
	60609 => {:id => "GrandMasterEnchTrainer"},
	44582 => {:id => "GrandMasterEnchTrainer"},
	44500 => {:id => "GrandMasterEnchTrainer"},
	60668 => {:id => "GrandMasterEnchTrainer"},
	44592 => {:id => "GrandMasterEnchTrainer"},
	44484 => {:id => "GrandMasterEnchTrainer"},
	44506 => {:id => "GrandMasterEnchTrainer"},
	44513 => {:id => "GrandMasterEnchTrainer"},
	44529 => {:id => "GrandMasterEnchTrainer"},
	44488 => {:id => "GrandMasterEnchTrainer"},
	44645 => {:id => "GrandMasterEnchTrainer"},
	44636 => {:id => "GrandMasterEnchTrainer"},
	59636 => {:id => "GrandMasterEnchTrainer"},
	44489 => {:id => "GrandMasterEnchTrainer"},
	60653 => {:id => "GrandMasterEnchTrainer"},
	44633 => {:id => "GrandMasterEnchTrainer"},
	44629 => {:id => "GrandMasterEnchTrainer"},
	44510 => {:id => "GrandMasterEnchTrainer"},
	60621 => {:id => "GrandMasterEnchTrainer"},
}
	enchantmanual=<<EOF
EOF

engspecaillist = {
	3918 => {:id => "StartingSkill"},
	3919 => {:id => "StartingSkill"},
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
	56465 => {:id => "class", :type => [24, 26, 29]},
	56480 => {:id => "class", :type => [21, 25, 30]},
	56481 => {:id => "class", :type => [22]},
	56483 => {:id => "class", :type => [21, 25, 30]},
	56484 => {:id => "class", :type => [24, 26, 29]},
	56486 => {:id => "class", :type => [22]},
	56487 => {:id => "class", :type => [27]},
	56574 => {:id => "class", :type => [23, 27]},
	61481 => {:id => "class", :type => [22, 28]},
	61482 => {:id => "class", :type => [23, 27]},
	61483 => {:id => "class", :type => [21, 25, 30]},
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
	-- Mechanized Snow Goggles (Cloth) -- 56465
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56465,400,41112,3,4036)
	self:addTradeFlags(RecipeDB,56465,1,2,3,24,26,29,36,41,56)
	self:addTradeAcquire(RecipeDB,56465,1,25277,1,26907,1,26955,1,26991,1,28697)

	-- Mechanized Snow Goggles (Leather) -- 61481
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,61481,400,44742,3,4036)
	self:addTradeFlags(RecipeDB,61481,1,2,3,22,28,36,41,57)
	self:addTradeAcquire(RecipeDB,61481,1,25277,1,26907,1,26955,1,26991,1,28697)

	-- Mechanized Snow Goggles (Mail) -- 61482
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,61482,400,44742,3,4036)
	self:addTradeFlags(RecipeDB,61482,1,2,3,23,27,36,41,58)
	self:addTradeAcquire(RecipeDB,61482,1,25277,1,26907,1,26955,1,26991,1,28697)	

	-- Mechanized Snow Goggles (Plate) -- 61483
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,61483,400,44742,3,4036)
	self:addTradeFlags(RecipeDB,61483,1,2,3,21,25,30,36,41,59)
	self:addTradeAcquire(RecipeDB,61483,1,25277,1,26907,1,26955,1,26991,1,28697)
EOF

faspecaillist = {
	3275 => {:id => "StartingSkill"},
}
famanual=<<EOF
EOF

insspecaillist = {
	45382 => {:id => "StartingSkill"},
	48114 => {:id => "StartingSkill"},
	48116 => {:id => "StartingSkill"},
	52738 => {:id => "StartingSkill"},
	48121 => {:id => "InscTrainer"},
	48247 => {:id => "InscTrainer"},
	48248 => {:id => "InscTrainer"},
	50598 => {:id => "InscTrainer"},
	50599 => {:id => "InscTrainer"},
	50600 => {:id => "InscTrainer"},
	50601 => {:id => "InscTrainer"},
	50602 => {:id => "InscTrainer"},
	50603 => {:id => "GrandMasterInscTrainer"},
	50604 => {:id => "GrandMasterInscTrainer"},
	50605 => {:id => "InscTrainer"},
	50606 => {:id => "InscTrainer"},
	50607 => {:id => "InscTrainer"},
	50608 => {:id => "InscTrainer"},
	50609 => {:id => "InscTrainer"},
	50610 => {:id => "GrandMasterInscTrainer"},
	50611 => {:id => "GrandMasterInscTrainer"},
	50612 => {:id => "InscTrainer"},
	50614 => {:id => "InscTrainer"},
	50616 => {:id => "InscTrainer"},
	50617 => {:id => "InscTrainer"},
	50618 => {:id => "InscTrainer"},
	50619 => {:id => "GrandMasterInscTrainer"},
	50620 => {:id => "GrandMasterInscTrainer"},
	52739 => {:id => "InscTrainer"},
	52840 => {:id => "InscTrainer"},
	52843 => {:id => "InscTrainer"},
	53462 => {:id => "InscTrainer"},
	56943 => {:id => "MasterInscTrainer"},
	56944 => {:id => "NorthrendInscriptionResearch"},
	56945 => {:id => "InscTrainer"},
	56946 => {:id => "NorthrendInscriptionResearch"},
	56947 => {:id => "NorthrendInscriptionResearch"},
	56948 => {:id => "InscTrainer"},
	56949 => {:id => "NorthrendInscriptionResearch"},
	56950 => {:id => "NorthrendInscriptionResearch"},
	56951 => {:id => "InscTrainer"},
	56952 => {:id => "MasterInscTrainer"},
	56953 => {:id => "InscTrainer"},
	56954 => {:id => "NorthrendInscriptionResearch"},
	56955 => {:id => "InscTrainer"},
	56956 => {:id => "InscTrainer"},
	56957 => {:id => "InscTrainer"},
	56958 => {:id => "NorthrendInscriptionResearch"},
	56959 => {:id => "InscTrainer"},
	56960 => {:id => "NorthrendInscriptionResearch"},
	56961 => {:id => "InscTrainer"},
	56963 => {:id => "InscTrainer"},
	56968 => {:id => "InscTrainer"},
	56971 => {:id => "InscTrainer"},
	56972 => {:id => "MasterInscTrainer"},
	56973 => {:id => "InscTrainer"},
	56974 => {:id => "InscTrainer"},
	56975 => {:id => "NorthrendInscriptionResearch"},
	56976 => {:id => "InscTrainer"},
	56977 => {:id => "NorthrendInscriptionResearch"},
	56978 => {:id => "InscTrainer"},
	56979 => {:id => "MasterInscTrainer"},
	56980 => {:id => "GrandMasterInscTrainer"},
	56981 => {:id => "InscTrainer"},
	56982 => {:id => "InscTrainer"},
	56983 => {:id => "NorthrendInscriptionResearch"},
	56984 => {:id => "MasterInscTrainer"},
	56985 => {:id => "InscTrainer"},
	56986 => {:id => "NorthrendInscriptionResearch"},
	56987 => {:id => "GrandMasterInscTrainer"},
	56988 => {:id => "NorthrendInscriptionResearch"},
	56989 => {:id => "NorthrendInscriptionResearch"},
	56994 => {:id => "InscTrainer"},
	56995 => {:id => "InscTrainer"},
	56996 => {:id => "NorthrendInscriptionResearch"},
	56997 => {:id => "InscTrainer"},
	56998 => {:id => "NorthrendInscriptionResearch"},
	56999 => {:id => "NorthrendInscriptionResearch"},
	57000 => {:id => "InscTrainer"},
	57001 => {:id => "InscTrainer"},
	57002 => {:id => "InscTrainer"},
	57003 => {:id => "MasterInscTrainer"},
	57004 => {:id => "InscTrainer"},
	57005 => {:id => "InscTrainer"},
	57006 => {:id => "GrandMasterInscTrainer"},
	57007 => {:id => "MasterInscTrainer"},
	57008 => {:id => "MasterInscTrainer"},
	57009 => {:id => "InscTrainer"},
	57010 => {:id => "NorthrendInscriptionResearch"},
	57011 => {:id => "NorthrendInscriptionResearch"},
	57012 => {:id => "NorthrendInscriptionResearch"},
	57013 => {:id => "NorthrendInscriptionResearch"},
	57014 => {:id => "NorthrendInscriptionResearch"},
	57019 => {:id => "NorthrendInscriptionResearch"},
	57020 => {:id => "InscTrainer"},
	57021 => {:id => "NorthrendInscriptionResearch"},
	57022 => {:id => "InscTrainer"},
	57023 => {:id => "InscTrainer"},
	57024 => {:id => "InscTrainer"},
	57025 => {:id => "InscTrainer"},
	57026 => {:id => "MasterInscTrainer"},
	57027 => {:id => "InscTrainer"},
	57028 => {:id => "NorthrendInscriptionResearch"},
	57029 => {:id => "InscTrainer"},
	57030 => {:id => "InscTrainer"},
	57031 => {:id => "InscTrainer"},
	57032 => {:id => "InscTrainer"},
	57033 => {:id => "MasterInscTrainer"},
	57034 => {:id => "NorthrendInscriptionResearch"},
	57035 => {:id => "NorthrendInscriptionResearch"},
	57036 => {:id => "GrandMasterInscTrainer"},
	57112 => {:id => "NorthrendInscriptionResearch"},
	57113 => {:id => "MasterInscTrainer"},
	57114 => {:id => "InscTrainer"},
	57115 => {:id => "NorthrendInscriptionResearch"},
	57116 => {:id => "NorthrendInscriptionResearch"},
	57117 => {:id => "NorthrendInscriptionResearch"},
	57119 => {:id => "InscTrainer"},
	57120 => {:id => "InscTrainer"},
	57121 => {:id => "InscTrainer"},
	57122 => {:id => "MasterInscTrainer"},
	57123 => {:id => "InscTrainer"},
	57124 => {:id => "NorthrendInscriptionResearch"},
	57125 => {:id => "InscTrainer"},
	57126 => {:id => "NorthrendInscriptionResearch"},
	57127 => {:id => "NorthrendInscriptionResearch"},
	57128 => {:id => "NorthrendInscriptionResearch"},
	57129 => {:id => "InscTrainer"},
	57130 => {:id => "NorthrendInscriptionResearch"},
	57131 => {:id => "InscTrainer"},
	57132 => {:id => "InscTrainer"},
	57133 => {:id => "InscTrainer"},
	57151 => {:id => "InscTrainer"},
	57152 => {:id => "NorthrendInscriptionResearch"},
	57153 => {:id => "NorthrendInscriptionResearch"},
	57154 => {:id => "InscTrainer"},
	57155 => {:id => "NorthrendInscriptionResearch"},
	57156 => {:id => "InscTrainer"},
	57157 => {:id => "InscTrainer"},
	57158 => {:id => "InscTrainer"},
	57159 => {:id => "NorthrendInscriptionResearch"},
	57160 => {:id => "NorthrendInscriptionResearch"},
	57161 => {:id => "InscTrainer"},
	57162 => {:id => "InscTrainer"},
	57163 => {:id => "InscTrainer"},
	57164 => {:id => "NorthrendInscriptionResearch"},
	57165 => {:id => "InscTrainer"},
	57166 => {:id => "NorthrendInscriptionResearch"},
	57167 => {:id => "InscTrainer"},
	57168 => {:id => "MasterInscTrainer"},
	57169 => {:id => "NorthrendInscriptionResearch"},
	57170 => {:id => "NorthrendInscriptionResearch"},
	57172 => {:id => "MasterInscTrainer"},
	57181 => {:id => "NorthrendInscriptionResearch"},
	57183 => {:id => "InscTrainer"},
	57184 => {:id => "InscTrainer"},
	57185 => {:id => "InscTrainer"},
	57186 => {:id => "InscTrainer"},
	57187 => {:id => "MasterInscTrainer"},
	57188 => {:id => "InscTrainer"},
	57189 => {:id => "NorthrendInscriptionResearch"},
	57190 => {:id => "NorthrendInscriptionResearch"},
	57191 => {:id => "NorthrendInscriptionResearch"},
	57192 => {:id => "MasterInscTrainer"},
	57194 => {:id => "InscTrainer"},
	57195 => {:id => "NorthrendInscriptionResearch"},
	57196 => {:id => "MasterInscTrainer"},
	57197 => {:id => "InscTrainer"},
	57198 => {:id => "GrandMasterInscTrainer"},
	57199 => {:id => "NorthrendInscriptionResearch"},
	57200 => {:id => "InscTrainer"},
	57201 => {:id => "InscTrainer"},
	57202 => {:id => "NorthrendInscriptionResearch"},
	57207 => {:id => "NorthrendInscriptionResearch"},
	57208 => {:id => "NorthrendInscriptionResearch"},
	57209 => {:id => "MinorInscriptionResearch"},
	57210 => {:id => "InscTrainer"},
	57211 => {:id => "NorthrendInscriptionResearch"},
	57212 => {:id => "NorthrendInscriptionResearch"},
	57213 => {:id => "InscTrainer"},
	57214 => {:id => "NorthrendInscriptionResearch"},
	57215 => {:id => "MinorInscriptionResearch"},
	57216 => {:id => "InscTrainer"},
	57217 => {:id => "MinorInscriptionResearch"},
	57218 => {:id => "NorthrendInscriptionResearch"},
	57219 => {:id => "MasterInscTrainer"},
	57220 => {:id => "NorthrendInscriptionResearch"},
	57221 => {:id => "MasterInscTrainer"},
	57222 => {:id => "MasterInscTrainer"},
	57223 => {:id => "NorthrendInscriptionResearch"},
	57224 => {:id => "MasterInscTrainer"},
	57225 => {:id => "GrandMasterInscTrainer"},
	57226 => {:id => "MasterInscTrainer"},
	57227 => {:id => "MasterInscTrainer"},
	57229 => {:id => "MinorInscriptionResearch"},
	57230 => {:id => "MinorInscriptionResearch"},
	57232 => {:id => "NorthrendInscriptionResearch"},
	57233 => {:id => "NorthrendInscriptionResearch"},
	57234 => {:id => "NorthrendInscriptionResearch"},
	57235 => {:id => "NorthrendInscriptionResearch"},
	57236 => {:id => "MasterInscTrainer"},
	57237 => {:id => "NorthrendInscriptionResearch"},
	57238 => {:id => "InscTrainer"},
	57239 => {:id => "InscTrainer"},
	57240 => {:id => "InscTrainer"},
	57241 => {:id => "InscTrainer"},
	57242 => {:id => "InscTrainer"},
	57243 => {:id => "NorthrendInscriptionResearch"},
	57244 => {:id => "InscTrainer"},
	57245 => {:id => "InscTrainer"},
	57246 => {:id => "InscTrainer"},
	57247 => {:id => "NorthrendInscriptionResearch"},
	57248 => {:id => "GrandMasterInscTrainer"},
	57249 => {:id => "InscTrainer"},
	57250 => {:id => "NorthrendInscriptionResearch"},
	57251 => {:id => "InscTrainer"},
	57252 => {:id => "MasterInscTrainer"},
	57257 => {:id => "MasterInscTrainer"},
	57258 => {:id => "NorthrendInscriptionResearch"},
	57259 => {:id => "InscTrainer"},
	57260 => {:id => "NorthrendInscriptionResearch"},
	57261 => {:id => "NorthrendInscriptionResearch"},
	57262 => {:id => "InscTrainer"},
	57263 => {:id => "NorthrendInscriptionResearch"},
	57264 => {:id => "NorthrendInscriptionResearch"},
	57265 => {:id => "InscTrainer"},
	57266 => {:id => "InscTrainer"},
	57267 => {:id => "NorthrendInscriptionResearch"},
	57268 => {:id => "NorthrendInscriptionResearch"},
	57269 => {:id => "MasterInscTrainer"},
	57270 => {:id => "MasterInscTrainer"},
	57271 => {:id => "InscTrainer"},
	57272 => {:id => "InscTrainer"},
	57273 => {:id => "NorthrendInscriptionResearch"},
	57274 => {:id => "InscTrainer"},
	57275 => {:id => "MasterInscTrainer"},
	57276 => {:id => "NorthrendInscriptionResearch"},
	57277 => {:id => "InscTrainer"},
	57703 => {:id => "InscTrainer"},
	57704 => {:id => "InscTrainer"},
	57706 => {:id => "InscTrainer"},
	57707 => {:id => "InscTrainer"},
	57708 => {:id => "InscTrainer"},
	57709 => {:id => "MasterInscTrainer"},
	57710 => {:id => "InscTrainer"},
	57711 => {:id => "InscTrainer"},
	57712 => {:id => "InscTrainer"},
	57713 => {:id => "InscTrainer"},
	57714 => {:id => "GrandMasterInscTrainer"},
	57715 => {:id => "GrandMasterInscTrainer"},
	57716 => {:id => "GrandMasterInscTrainer"},
	57719 => {:id => "MinorInscriptionResearch"},
	58286 => {:id => "MinorInscriptionResearch"},
	58287 => {:id => "MinorInscriptionResearch"},
	58288 => {:id => "MinorInscriptionResearch"},
	58289 => {:id => "MinorInscriptionResearch"},
	58296 => {:id => "MinorInscriptionResearch"},
	58297 => {:id => "MinorInscriptionResearch"},
	58298 => {:id => "MinorInscriptionResearch"},
	58299 => {:id => "MinorInscriptionResearch"},
	58300 => {:id => "MinorInscriptionResearch"},
	58301 => {:id => "MinorInscriptionResearch"},
	58302 => {:id => "MinorInscriptionResearch"},
	58303 => {:id => "MinorInscriptionResearch"},
	58305 => {:id => "MinorInscriptionResearch"},
	58306 => {:id => "MinorInscriptionResearch"},
	58307 => {:id => "MinorInscriptionResearch"},
	58308 => {:id => "MinorInscriptionResearch"},
	58310 => {:id => "MinorInscriptionResearch"},
	58311 => {:id => "MinorInscriptionResearch"},
	58312 => {:id => "MinorInscriptionResearch"},
	58313  => {:id => "InscTrainer"},
	58314 => {:id => "MinorInscriptionResearch"},
	58315 => {:id => "MinorInscriptionResearch"},
	58316 => {:id => "MinorInscriptionResearch"},
	58317 => {:id => "MinorInscriptionResearch"},
	58318 => {:id => "MinorInscriptionResearch"},
	58319 => {:id => "MinorInscriptionResearch"},
	58320 => {:id => "MinorInscriptionResearch"},
	58321 => {:id => "MinorInscriptionResearch"},
	58322 => {:id => "MinorInscriptionResearch"},
	58323 => {:id => "MinorInscriptionResearch"},
	58324 => {:id => "MinorInscriptionResearch"},
	58325 => {:id => "MinorInscriptionResearch"},
	58326 => {:id => "MinorInscriptionResearch"},
	58327 => {:id => "MinorInscriptionResearch"},
	58328 => {:id => "MinorInscriptionResearch"},
	58329 => {:id => "MinorInscriptionResearch"},
	58330 => {:id => "MinorInscriptionResearch"},
	58331 => {:id => "MinorInscriptionResearch"},
	58332 => {:id => "MinorInscriptionResearch"},
	58333 => {:id => "MinorInscriptionResearch"},
	58336 => {:id => "MinorInscriptionResearch"},
	58337 => {:id => "MinorInscriptionResearch"},
	58338 => {:id => "MinorInscriptionResearch"},
	58339 => {:id => "MinorInscriptionResearch"},
	58340 => {:id => "MinorInscriptionResearch"},
	58341 => {:id => "MinorInscriptionResearch"},
	58342 => {:id => "MinorInscriptionResearch"},
	58343 => {:id => "MinorInscriptionResearch"},
	58344 => {:id => "MinorInscriptionResearch"},
	58345 => {:id => "MinorInscriptionResearch"},
	58346 => {:id => "MinorInscriptionResearch"},
	58347 => {:id => "MinorInscriptionResearch"},
	58472 => {:id => "InscTrainer"},
	58473 => {:id => "InscTrainer"},
	58476 => {:id => "InscTrainer"},
	58478 => {:id => "InscTrainer"},
	58480 => {:id => "InscTrainer"},
	58481 => {:id => "InscTrainer"},
	58482 => {:id => "GrandMasterInscTrainer"},
	58483 => {:id => "GrandMasterInscTrainer"},
	58484 => {:id => "InscTrainer"},
	58485 => {:id => "InscTrainer"},
	58486 => {:id => "InscTrainer"},
	58487 => {:id => "InscTrainer"},
	58488 => {:id => "InscTrainer"},
	58489 => {:id => "InscTrainer"},
	58490 => {:id => "GrandMasterInscTrainer"},
	58491 => {:id => "GrandMasterInscTrainer"},
	58565 => {:id => "InscTrainer"},
	59315 => {:id => "MinorInscriptionResearch"},
	59326 => {:id => "MinorInscriptionResearch"},
	59338 => {:id => "MinorInscriptionResearch"},
	59339 => {:id => "MinorInscriptionResearch"},
	59340 => {:id => "MinorInscriptionResearch"},
	59387 => {:id => "MasterInscTrainer"},
	59475 => {:id => "InscTrainer"},
	59478 => {:id => "InscTrainer"},
	59480 => {:id => "InscTrainer"},
	59484 => {:id => "InscTrainer"},
	59486 => {:id => "InscTrainer"},
	59487 => {:id => "InscTrainer"},
	59488 => {:id => "InscTrainer"},
	59489 => {:id => "InscTrainer"},
	59490 => {:id => "InscTrainer"},
	59491 => {:id => "InscTrainer"},
	59493 => {:id => "InscTrainer"},
	59494 => {:id => "InscTrainer"},
	59495 => {:id => "MasterInscTrainer"},
	59496 => {:id => "GrandMasterInscTrainer"},
	59497 => {:id => "MasterInscTrainer"},
	59498 => {:id => "GrandMasterInscTrainer"},
	59499 => {:id => "InscTrainer"},
	59500 => {:id => "InscTrainer"},
	59501 => {:id => "GrandMasterInscTrainer"},
	59502 => {:id => "InscTrainer"},
	59503 => {:id => "MasterInscTrainer"},
	59504 => {:id => "GrandMasterInscTrainer"},
	59559 => {:id => "NorthrendInscriptionResearch"},
	59560 => {:id => "NorthrendInscriptionResearch"},
	59561 => {:id => "NorthrendInscriptionResearch"},
	60336 => {:id => "InscTrainer"},
	60337 => {:id => "GrandMasterInscTrainer"},
	61117 => {:id => "GrandMasterInscTrainer"},
	61118 => {:id => "GrandMasterInscTrainer"},
	61119 => {:id => "GrandMasterInscTrainer"},
	61120 => {:id => "GrandMasterInscTrainer"},
	61177 => {:id => "GrandMasterInscTrainer"},
	61288 => {:id => "InscTrainer"},
	61677 => {:id => "NorthrendInscriptionResearch"},
}
inscriptionmanual=<<EOF
EOF

jcspecaillist = {
	31101 => {:id => 9},
	43493 => {:id => 9}
	}
jcmanual=<<EOF
EOF

lwspecaillist = {
	2149 => {:id => "StartingSkill"},
	2152 => {:id => "StartingSkill"},
	2881 => {:id => "StartingSkill"},
	21943 => {:id => 7, :type => 1},
	44953 => {:id => 7, :type => 1},
	28219 => {:id => "ADNaxx40E"},
	28220 => {:id => "ADNaxx40R"},
	28221 => {:id => "ADNaxx40R"},
	28222 => {:id => "ADNaxx40E"},
	28223 => {:id => "ADNaxx40R"},
	28224 => {:id => "ADNaxx40R"},
	19093 => {:id => "Onyxia"},
}
lwmanual=<<EOF
EOF

smeltingspecaillist = {
	2657 => {:id => "StartingSkill"},
	}
smeltmanual=<<EOF
EOF

tailoringspecaillist = {
	2385 => {:id => "StartingSkill"},
	2387 => {:id => "StartingSkill"},
	2963 => {:id => "StartingSkill"},
	28207 => {:id => "ADNaxx40E"},
	28209 => {:id => "ADNaxx40R"},
	28205 => {:id => "ADNaxx40R"},
	28208 => {:id => "ADNaxx40H"},
}
tailoringmanual=<<EOF
EOF

runeforgingspecaillist = {
}
	runeforgingmanual=<<EOF
	-- Rune of the Fallen Crusader - 53344
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Swordshattering - 53323
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53323,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53323,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53323,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Swordbreaking - 54446
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54446,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,54446,1,2,3,21)
	self:addTradeAcquire(RecipeDB,54446,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Spellshattering - 53342
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53342,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53342,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53342,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Spellbreaking - 54447
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54447,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,54447,1,2,3,21)
	self:addTradeAcquire(RecipeDB,54447,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Razorice - 53343
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53343,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53343,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53343,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Lichbane - 53331
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53331,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53331,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53331,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Cinderglacier - 53341
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53341,1,nil,1,53428)
	self:addTradeFlags(RecipeDB,53341,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53341,1,28471,1,28472,1,28474,1,29194,1,29196,1,29195,1,31084)
EOF

if $debug

	create_custom_db()
	create_faction_db()

	create_stats_list()

	#create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])

	#create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

else

	create_custom_db()
	create_faction_db()

	alchemy = recipes.get_alchemy_list

	# Add the restoration potion quests
	$quests[2203] = {:name => "Badlands Reagent Run II", :faction => 2}
	$quests[2501] = {:name => "Badlands Reagent Run II", :faction => 1}

	create_profession_db("./RecipeDB/ARL-Alchemy.lua","Alchemy",recipes,maps,"InitAlchemy",alchemy,[2336,6619,11447,17579,22430],alchspeciallist,alchmanual)

	blacksmithing = recipes.get_blacksmithing_list

	# Add the Orcish War Leggings quest
	$quests[2756] = {:name => "The Old Ways", :faction => 2}

	create_profession_db("./RecipeDB/ARL-Blacksmith.lua","Blacksmithing",recipes,maps,"InitBlacksmithing",blacksmithing,[2671,8366,8368,9942,9957,16960,16965,16967,16980,16986,16987],bsspeciallist,bsmanual)

	cooking = recipes.get_cooking_list

	$quests[8313] = {:name => "Sharing the Knowledge", :faction => 0}

	create_profession_db("./RecipeDB/ARL-Cook.lua","Cooking",recipes,maps,"InitCooking",cooking,[30047,57423,44438,45547,53056],cookingspeciallist,cookmanual)

	enchanting = recipes.get_enchanting_list

	create_profession_db("./RecipeDB/ARL-Enchant.lua","Enchanting",recipes,maps,"InitEnchanting",enchanting,[22434,28021],enchantingspeciallist,enchantmanual)

	eng = recipes.get_engineering_list

	create_profession_db("./RecipeDB/ARL-Engineer.lua","Engineering",recipes,maps,"InitEngineering",eng,[61483,30573,30343,30342,30349,30561,30549,12722,12720,12900,12719,12904],engspecaillist,engmanual)

	firstaid = recipes.get_firstaid_list

	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],faspecaillist,famanual)

	inscription = recipes.get_inscription_list

	create_profession_db("./RecipeDB/ARL-Inscription.lua","Inscription",recipes,maps,"InitInscription",inscription,[571933],insspecaillist,inscriptionmanual)

	jewelcrafting = recipes.get_jewelcrafting_list

	create_profession_db("./RecipeDB/ARL-Jewelcraft.lua","Jewelcrafting",recipes,maps,"InitJewelcrafting",jewelcrafting,[25614,26918,26920,32810],jcspecaillist,jcmanual)

	leatherworking = recipes.get_leatherworking_list

	create_profession_db("./RecipeDB/ARL-Leatherwork.lua","Leatherworking",recipes,maps,"InitLeatherworking",leatherworking,[8195,15141,10550,19106,40000],lwspecaillist,lwmanual)

	smelting = recipes.get_mining_list

	create_profession_db("./RecipeDB/ARL-Smelt.lua","Smelting",recipes,maps,"InitSmelting",smelting,[],smeltingspecaillist,smeltmanual)

	tailoring = recipes.get_tailoring_list

	create_profession_db("./RecipeDB/ARL-Tailor.lua","Tailoring",recipes,maps,"InitTailoring",tailoring,[7636,8778,12062,12063,12068,12083,12087,12090],tailoringspecaillist,tailoringmanual)

	runeforging = recipes.get_runeforging_list

	$trainers[28471] = {:name => "Lady Alistra", :faction => 0}
	$trainers[28474] = {:name => "Amal'thazad", :faction => 0}
	$trainers[29194] = {:name => "Amal'thazad", :faction => 0}
	$trainers[29195] = {:name => "Lady Alistra", :faction => 0}
	$trainers[31084] = {:name => "Highlord Darion Mograine", :faction => 0}
	$trainers[28472] = {:name => "Lord Thorval", :faction => 0}
	$trainers[29196] = {:name => "Lord Thorval", :faction => 0}

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
