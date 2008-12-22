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
$missingdataacquire = Array.new

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

	self:addLookupList(CustomDB, 1, "Discovered by making elixirs or flasks using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 2, "Discovered by making potions using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 3, "Discovered by doing transmutes using Burning Crusade or higher ingredients.")
	self:addLookupList(CustomDB, 4, "Discovered by Major Protection Potions using Burning Crusade or higher ingredients.")
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
	self:addLookupList(CustomDB, 16, "EngineeringRenewalReward.")
	self:addLookupList(CustomDB, 17, "The schematic can be found on the floor near Golem Lord Argelmach in Blackrock Depths. Only engineers with 300 skill may learn the schematic after clicking on it.")
	self:addLookupList(CustomDB, 18, "Northrend Alchemy Research.")
	self:addLookupList(CustomDB, 19, "Northrend Transmute.")
	self:addLookupList(CustomDB, 20, "Goblin transport.")
	self:addLookupList(CustomDB, 21, "Gnome transport.")
	self:addLookupList(CustomDB, 22, "Random BoP drop off of bosses in AQ40.")

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

			if $zonemap[npc[:name]]
				$unknownzone << {:name => npc[:name],
								:loc => $zonemap[npc[:name]]}
			elsif not npc[:locs]
				$unknownzone << {:name => npc[:name],
								:loc => "Unknown Zone (NPC)"}	
			end

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
		elsif $zonemap[quest[:name]]
			$unknownzone << {:name => quest[:name],
							:loc => $zonemap[quest[:name]]}
		else
			$unknownzone << {:name => quest[:name],
							:loc => "Unknown Zone (Quest)"}
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

def create_profession_db(file,profession,db,maps,funcstub,recipes,ignorerecipe,specialcaseflag,manual,specialcaseacquire)

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
	ignorelist = Hash.new

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
		if ignorerecipe.include?(details[:spellid])
			proflua.print("\n\t-- Ignored")
		end

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
								if $zonemap[npc[:name]]
									$unknownzone << {:name => npc[:name],
													:loc => $zonemap[npc[:name]]}
									found = false
									# Go through all the dungeons
									$dungeons.each_pair do |id,dname|
										if dname[:name] == $zonemap[npc[:name]]
											flags << flaglisting["Instance"]
											found = true
										end
									end
									if not found
										# Go through all the raids
										$raids.each_pair do |id,dname|
											if dname[:name] == $zonemap[npc[:name]]
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
													:loc => "Unknown Zone (MOB)"}
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
				if classes.has_key?(ctype.lstrip)
					flags << classes[ctype.lstrip]
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

		flags.flatten!
		flags.compact!
		flags.uniq!
		flags.sort!

		# Handle special cases (acquire)
		if specialcaseacquire[details[:spellid]]
			case specialcaseacquire[details[:spellid]][:id]
			when "GoblinTransport"
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Quest"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 20}
				details[:specialty] = 20222
			when "GnomeTransport"
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Quest"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 21}
				details[:specialty] = 20219
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
			when "BCAlchemyElixir"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 1}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "BCAlchemyPotion"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 2}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "BCAlchemyTransmute"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 3}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "BCAlchemyCauldron"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 4}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "NorthrendAlchemyResearch"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 18}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "NorthrendAlchemyTransmute"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 19}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "MinorInscriptionResearch"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 14}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "NorthrendInscriptionResearch"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 15}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "CustomNeutral"
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => specialcaseacquire[details[:spellid]][:type]}
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
				acquire << add_npc_trainer(18802, "Alchemist Gribble", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(16588, "Apothecary Antonivich", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(27023, "Apothecary Bressa", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(27029, "Apothecary Wormwick", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(19052, "Lorokeem", "Neutral", npcfactions, acquirelisting)
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
			when "EngineeringRenewalReward"
				flags << flaglisting["Alliance"] << flaglisting["Horde"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 16}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
			when "FieldRepairBot"
				flags << flaglisting["Alliance"] << flaglisting["Horde"] <<	flaglisting["Instance"]
				acquire << {"type" => acquirelisting["Custom"],
							"id" => 17}
				flags.delete(flaglisting["Quest"])
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Raid"])
			when "GrandMasterEnchTrainer"
				acquire << add_npc_trainer(26990, "Alexis Marlowe", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26906, "Elizabeth Jackson", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26954, "Emil Autumn", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28693, "Enchanter Nalthanis", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26980, "Eorain Dawnstrike", "Horde", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "MasterEngTrainer"
				#http://www.wowhead.com/?spell=39971
				#acquire << add_npc_trainer(, "", "", npcfactions, acquirelisting)
				#flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterEngTrainer"
				acquire << add_npc_trainer(25277, "Chief Engineer Leveny", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26955, "Jamesina Watterly", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28697, "Juston Oshenko", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26991, "Scoks Brightbolt", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26907, "Tisha Longbridge", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "EngFlightTrainer"
				acquire << add_npc_trainer(25099, "Jonathan Garrett", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(24868, "Niobe Whizzlespark", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "FATrainer"
				acquire << add_npc_trainer(12920, "Doctor Gregory Victor", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(12p39, "Doctor Gustaf VanHowzen", "Alliance", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterFATrainer"
				acquire << add_npc_trainer(23734, "Anchorite Yazmina", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26992, "Brynna Wilson", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(29233, "Nurse Applewood", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28706, "Olisarra the Kind", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26956, "Sally Tompkins", "Horde", npcfactions, acquirelisting)
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
			when "GrandMasterSmeltTrainer"	
				acquire << add_npc_trainer(26976, "Brunna Ironaxe", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26999, "Fendrig Redbeard", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26912, "Grumbol Stoutpick", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28698, "Jedidiah Handers", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26962, "Jonathan Lewis", "Horde", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
			when "GrandMasterTailorTrainer"
				acquire << add_npc_trainer(26964, "Alexandra McQueen", "Horde", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26914, "Benjamin Clegg", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(28699, "Charles Worth", "Neutral", npcfactions, acquirelisting)
				acquire << add_npc_trainer(27001, "Darin Goodstitch", "Alliance", npcfactions, acquirelisting)
				acquire << add_npc_trainer(26969, "Raenah", "Horde", npcfactions, acquirelisting)
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Trainer"]
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
				specialcaseacquire[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Custom"],
							"id" => i}
				end
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
			end
		end

		# Handle special cases (flags)
		if specialcaseflag[details[:spellid]]
			case specialcaseflag[details[:spellid]][:id]
			when "PVP"
				flags << flaglisting["PVP"]
			when 7
				flags << flaglisting["Seasonal"]
				acquire << {"type" => acquirelisting["Seasonal"],
						"id" => specialcaseflag[details[:spellid]][:type]}
			when 12
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Discovery"]
				specialcaseflag[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Custom"],
								"id" => i}
				end
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags.delete(flaglisting["Quest"])
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
				p specialcaseflag[details[:spellid]][:type]
				flags.concat(specialcaseflag[details[:spellid]][:type])
			when "Quest"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags << flaglisting["Alliance"] << flaglisting["Horde"] << flaglisting["Quest"]
				specialcaseflag[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Quest"],
								"id" => i}
				end
			when "HordeQuest"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags << flaglisting["Horde"] << flaglisting["Quest"]
				specialcaseflag[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Quest"],
								"id" => i}
				end
			when "AllyQuest"
				flags.delete(flaglisting["Trainer"])
				flags.delete(flaglisting["Vendor"])
				flags.delete(flaglisting["Instance"])
				flags.delete(flaglisting["Raid"])
				flags << flaglisting["Alliance"] << flaglisting["Quest"]
				specialcaseflag[details[:spellid]][:type].each do |i|
					acquire << {"type" => acquirelisting["Quest"],
								"id" => i}
				end
			when "meleedps"
				flags << playertypeflags["MeleeDPS"]
			when "Alliance"
				flags << flaglisting["Alliance"]
			when "Horde"
				flags << flaglisting["Horde"]
			when "specialty"
				if not details[:specialty]
					details[:specialty] = specialcaseflag[details[:spellid]][:type]
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
			ignorelist[details[:spellid]] = name
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
		if $skilllevelmap[name]
			proflua.print("#{$skilllevelmap[name]},")
		elsif details[:learned]
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
			proflua.print(",#{details[:specialty]})\n")
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
			$missingdataacquire << {:spellid => details[:spellid], :sname => name, :data => details, :sprof => profession}
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

	proflua.puts "\t-- Ignored Recipes:"

	ignorerecipe.each do |k|
		if ignorelist[k]
			proflua.puts "\t-- #{k} - #{ignorelist[k]}"
		else
			proflua.puts "\t-- #{k}"
		end
	end

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
				if $zonemap[v[:name]]
					lookup_lua.print("BZONE[\"#{$zonemap[v[:name]]}\"],")
				# Identify it as an unknown zone
				else
					lookup_lua.print("L[\"Unknown Zone\"],")
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
					lookup_lua.print(",#{v[:faction]})")
				else
					if $factionmap[v[:name]]
						lookup_lua.print(",#{$factionmap[v[:name]]})")
					else
						lookup_lua.print(",0)")
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

-- Command line options
L["Profile"]				= true
L["Filter"]					= true

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
		stats_lua.puts "\t\"#{k[:name]}\" => \"#{k[:loc]}\","
	end

	stats_lua.puts "\n"

	$unknownfaction.uniq!

	stats_lua.puts("\nUnknown faction:")

	$unknownfaction.sort_by { |unknownfaction| unknownfaction[:name] }.each do |k|
		if k[:loc] == "N/A"
			stats_lua.puts "\t\"#{k[:name]}\" => #{k[:react]},"
		else
			stats_lua.puts "\t\"#{k[:name]}\" => #{k[:react]},"
		end
	end

	stats_lua.puts("\n\nNo acquire information (#{$missingdataacquire.length} Recipes):")

	# Sort the output
	sorted_keys = $missingdataacquire.sort_by { |v| [v[:sprof], v[:spellid]] }

	sorted_keys.each do |k|
		stats_lua.puts "#{k[:spellid]} - #{k[:sname]} - #{k[:sprof]}"
	end

	stats_lua.puts "\n"	

	stats_lua.close

end

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
$zonemap = {
	"Aged Dalaran Wizard" => "Old Hillsbrad Foothills",
	"Annora" => "Uldaman",
	"Apocalypse Guard" => "Sunwell Plateau",
	"Ayamiss the Hunter" => "Ruins of Ahn'Qiraj",
	"Buru the Gorger" => "Ruins of Ahn'Qiraj",
	"Cannon Master Willey" => "Stratholme",
	"Cataclysm Hound" => "Sunwell Plateau",
	"Crimson Inquisitor" => "Stratholme",
	"Crimson Sorcerer" => "Stratholme",
	"Doomfire Destroyer" => "Sunwell Plateau",
	"Fel Rager" => "Blade's Edge Mountains",
	"Firebrand Pyromancer" => "Blackrock Spire",
	"General Rajaxx" => "Ruins of Ahn'Qiraj",
	"Gorgolon the All-seeing" => "Blade's Edge Mountains",
	"Grand Crusader Dathrohan" => "Stratholme",
	"Great-father Winter" => "Orgrimmar",
	"Illidari Defiler" => "Black Temple",
	"Indormi" => "Hyjal Summit",
	"Ironbark Protector" => "Dire Maul",
	"Koren" => "Karazhan",
	"Kurinnaxx" => "Ruins of Ahn'Qiraj",
	"Lieutenant General Andorov" => "Ruins of Ahn'Qiraj",
	"Lokhtos Darkbargainer" => "Blackrock Depths",
	"Lord Kazzak" => "Blasted Lands",
	"Magister Kalendris" => "Dire Maul",
	"Maleki the Pallid" => "Stratholme",
	"Moam" => "Ruins of Ahn'Qiraj",
	"Oblivion Mage" => "Sunwell Plateau",
	"Okuno" => "Black Temple",
	"Ossirian the Unscarred" => "Ruins of Ahn'Qiraj",
	"Painbringer" => "Sunwell Plateau",
	"Plugger Spazzring" => "Blackrock Depths",
	"Priestess Delrissa" => "Magisters' Terrace",
	"Priestess of Torment" => "Sunwell Plateau",
	"Pusillin" => "Dire Maul",
	"Shadowsword Assassin" => "Sunwell Plateau",
	"Shadowsword Guardian" => "Sunwell Plateau",
	"Shadowsword Vanquisher" => "Sunwell Plateau",
	"Shen'dralar Provisioner" => "Dire Maul",
	"Shrike Bat" => "Uldaman",
	"Sister of Torment" => "Magisters' Terrace",
	"Splinterbone Centurion" => "Razorfen Downs",
	"Stonevault Oracle" => "Uldaman",
	"Stonevault Pillager" => "Uldaman",
	"Storm Fury" => "Black Temple",
	"Stormforged Giant" => "Halls of Lightning",
	"Sunblade Arch Mage" => "Sunwell Plateau",
	"Sunblade Cabalist" => "Sunwell Plateau",
	"Sunblade Dawn Priest" => "Sunwell Plateau",
	"Sunblade Dusk Priest" => "Sunwell Plateau",
	"Sunblade Slayer" => "Sunwell Plateau",
	"Sunblade Vindicator" => "Sunwell Plateau",
	"Thomas Yance" => "Old Hillsbrad Foothills",
	"Thuzadin Shadowcaster" => "Stratholme",
	"Ythyar" => "Karazhan",
}

# Manual mapping of npc/quests to their factions
$factionmap = {
	"40 Tickets - Schematic: Steam Tonk Controller" => 0, # 
	"Ainethil" => 1,
	"Alanna Raveneye" => 1,
	"Alchemist Gribble" => 1,
	"Alegorn" => 1,
	"Aleinia" => 2,
	"Alexandra Bolero" => 1,
	"Alys Vol'tyr" => 2,
	"Amin" => 2,
	"Amy Davenport" => 1,
	#"Ancient Female Vrykul" => Unknown, # 495
	"Andrew Hilbert" => 2,
	"Apothecary Antonivich" => 2,
	"Arnok" => 2,
	"Arras" => 1,
	"Arred" => 1,
	"Artificer Daelo" => 1,
	"Bale" => 2,
	"Banalash" => 2,
	"Barim Spilthoof" => 2,
	"Baxter" => 2,
	"Belil" => 2,
	"Bemarrin" => 2,
	"Betty Quin" => 1,
	"Borgosh Corebender" => 2,
	"Borgus Steelhand" => 1,
	"Borto" => 1,
	"Borya" => 2,
	"Bowen Brisboise" => 2,
	"Bradley Towns" => 2,
	"Brek Stonehoof" => 2,
	"Bronk Guzzlegear" => 1,
	"Burbik Gearspanner" => 1,
	"Burko" => 1,
	"Byancie" => 1,
	"Camberon" => 2,
	"Captain O'Neal" => 1, # 1519
	"Captured Gnome" => 2,
	"Celie Steelwing" => 1,
	"Cluster Launcher" => 0, # 
	"Cyndra Kindwhisper" => 1,
	"Daga Ramba" => 2,
	"Daggle Ironshaper" => 1,
	"Dalinna" => 2,
	"Dane Lindgren" => 1,
	"Daniel Bartlett" => 2,
	"Dannelor" => 1,
	"Danwe" => 2,
	"Darianna" => 1,
	"Derek Odds" => 1,
	"Deynna" => 2,
	"Doba" => 1,
	"Doctor Herbert Halsey" => 2,
	"Doctor Marsh" => 2,
	"Dolothos" => 2,
	"Drakk Stonehand" => 1,
	"Edrem" => 1,
	"Egomis" => 1,
	"Elynna" => 1,
	"Emrul Riknussun" => 1,
	"Erika Tate" => 1,
	"Faldron" => 1,
	"Farii" => 1,
	"Feera" => 1,
	"Felannia" => 2,
	"Felicia Doan" => 2,
	"Felika" => 2,
	"Feruul" => 1,
	"Festive Recipes" => 0, # 
	"Fimble Finespindle" => 1,
	"Firework Launcher" => 0, # 
	"Flash Bomb Recipe" => 0, # 
	"Franklin Lloyd" => 2,
	"Fyldan" => 1,
	"Gambarinka" => 2,
	"Gara Skullcrush" => 2,
	"Gaston" => 1,
	"Gearcutter Cogspinner" => 1,
	"Gelanthis" => 2,
	"Gelman Stonehand" => 1,
	"Georgio Bolero" => 1,
	"Ghak Healtouch" => 1,
	"Ghermas" => 1,
	"Gimble Thistlefuzz" => 1,
	"Gloresse" => 2,
	"Godan" => 2,
	#"Gorgolon the All-seeing" => None, # Unknown
	"Graham Van Talen" => 2,
	"Great-father Winter" => 0,
	"Gremlock Pilsnor" => 1,
	"Grutah" => 2,
	"Guillaume Sorouy" => 2,
	"Haalrun" => 1,
	"Haferet" => 1,
	"Hagrus" => 2,
	"Hahrana Ironhide" => 2, # 357
	"Hama" => 1,
	"Hotoppik Copperpinch" => 2, # 3487
	"Hurnak Grimmord" => 1,
	"Imperial Plate Belt" => 0, # 
	"Imperial Plate Boots" => 0, # 
	"Imperial Plate Bracer" => 0, # 
	"Imperial Plate Chest" => 0, # 
	"Imperial Plate Helm" => 0, # 
	"Imperial Plate Leggings" => 0, # 
	"Imperial Plate Shoulders" => 0, # 
	"Innkeeper Grilka" => 2,
	"James Van Brunt" => 2,
	"Jessara Cordell" => 1,
	"Jhag" => 2,
	"Johan Focht" => 2,
	"Josef Gregorian" => 2,
	"Joseph Moore" => 2, # 1497
	"Josephine Lister" => 2,
	"K. Lee Smallfry" => 1,
	"Kaita Deepforge" => 1, # 1519
	"Kalaen" => 2,
	"Kalinda" => 2,
	"Kamari" => 2,
	"Karolek" => 2,
	"Kayaart" => 1,
	"Keelen Sheets" => 2,
	"Kelgruk Bloodaxe" => 2,
	"Kendor Kabonka" => 1,
	"Khole Jinglepocket" => 1, # 1519
	"Kithas" => 2,
	"Knight Dameron" => 1,
	"Kor'geld" => 2,
	"Krek Cragcrush" => 2,
	"Krugosh" => 2,
	"Kudrii" => 1,
	"Kylanna Windwhisper" => 1,
	"Lady Palanseer" => 2, # 1637
	"Landraelanis" => 2,
	"Lavinia Crowe" => 2,
	"Lawrence Schneider" => 1,
	"Leeli Longhaggle" => 1,
	"Lilyssia Nightbreeze" => 1,
	"Logannas" => 1,
	"Logistics Officer Brighton" => 1,
	"Logistics Officer Silverstone" => 1,
	"Loolruna" => 1,
	"Lucan Cordell" => 1,
	"Lyna" => 2,
	"Lynalis" => 2,
	"Magar" => 2,
	"Mahu" => 2,
	"Makaru" => 2,
	"Malcomb Wynn" => 2,
	"Mari Stonehand" => 1,
	"Maria Lumere" => 1,
	"Mary Edras" => 2,
	"Master Chef Mouldier" => 2,
	"Me'lynn" => 1,
	"Miall" => 1,
	"Miao'zan" => 2,
	"Milla Fairancora" => 1,
	"Millie Gregorian" => 2,
	"Mirvedon" => 2,
	"Misensi" => 2,
	"Muaat" => 1,
	"Muheru the Weaver" => 1,
	"Mythrin'dir" => 1,
	"Nadyia Maneweaver" => 1,
	"Nahogg" => 1,
	"Nardstrum Copperpinch" => 2, # 1497
	"Neii" => 1,
	"Nissa Firestone" => 1,
	"Nogg" => 2,
	"Nula the Butcher" => 2,
	"Nurse Neela" => 2,
	"Nus" => 1,
	"Nyoma" => 1,
	"Okothos Ironrager" => 2,
	"Outfitter Eric" => 1,
	"Padaar" => 1,
	"Penney Copperpinch" => 2, # 1637
	"Phea" => 1,
	"Pratt McGrubben" => 1, # 357
	"Provisioner Lorkran" => 2,
	"Quartermaster Urgronn" => 2,
	"Randal Worth" => 1,
	"Rartar" => 2,
	"Rawrk" => 2,
	"Razia" => 2,
	"Refik" => 1,
	"Rhiannon Davis" => 2,
	"Rogvar" => 2,
	"Rohok" => 2,
	"Ronald Burch" => 2,
	"Roxxik" => 2,
	"Rungor" => 2,
	"Saenorion" => 1,
	"Saru Steelfury" => 2,
	"Sassa Weldwell" => 1,
	"Sebastian Crane" => 2,
	"Sedana" => 2,
	"Seer Janidi" => 2,
	"Seersa Copperpinch" => 2, # 1638
	"Sellandus" => 1,
	"Sewa Mistrunner" => 2,
	"Shankys" => 2,
	"Shayis Steelfury" => 2,
	"Sid Limbardi" => 1,
	"Simon Tanner" => 1,
	"Snang" => 2,
	"Snarl" => 2,
	"Sovik" => 2,
	"Sprite Jumpsprocket" => 1,
	"Stephen Ryback" => 1,
	"Stone Guard Mukar" => 2,
	"Sylvanna Forestmoon" => 1,
	"Taladan" => 1,
	"Talmar" => 2,
	"Tamar" => 2,
	"Tansy Puddlefizz" => 1,
	"Tarn" => 2,
	"Tatiana" => 1,
	"Tel'Athir" => 1,
	"Telonis" => 1,
	"Thaddeus Webb" => 2,
	"Thamner Pol" => 1,
	"Thonys Pillarstone" => 1,
	"Thund" => 2,
	"Tilli Thistlefuzz" => 1,
	"Tognus Flintfire" => 1,
	"Trianna" => 1,
	"Truk Wildbeard" => 1,
	"Ug'thok" => 2,
	"Ulthir" => 1,
	"Una" => 2,
	"Uthok" => 2,
	"Uthrar Threx" => 1,
	"Vaean" => 1,
	"Vance Undergloom" => 2,
	"Vhan" => 2,
	"Victor Ward" => 2,
	"Vix Chromeblaster" => 2,
	"Wolgren Jinglepocket" => 1, # 3557
	"Wulan" => 2,
	"Wulmort Jinglepocket" => 0, # 1
	"Xen'to" => 2,
	"Xylinnia Starshine" => 1,
	"Yarr Hammerstone" => 1,
	"Yatheon" => 2,
	"Yelmak" => 2,
	"Zamja" => 2,
	"Zaralda" => 2,
	"Zarrin" => 1,
	"Zurai" => 2,
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
	"Midnight",
	"Sunblade Protector",
	"Living Ruby Serpent",
	"Outland Children's Week Dark Portal Trigger",
	"Outland Children's Week Exodar 01 Trigger",
	"Outland Children's Week Silvermoon 01 Trigger",
	"Skeletal Fiend (Enraged Form)",
]

$skilllevelmap = {
	#Alchemy
	"Minor Healing Potion" => 1,
	"Elixir of Lion's Strength" => 1,
	"Elixir of Minor Defense" => 1,
	"Minor Healing Potion" => 1,
	"Weak Troll's Blood Elixir" => 15,
	"Minor Mana Potion" => 25,
	"Minor Rejuvenation Potion" => 40,
	"Discolored Healing Potion" => 50,
	"Elixir of Minor Agility" => 50,
	"Elixir of Minor Fortitude" => 50,
	"Lesser Healing Potion" => 55,
	"Rage Potion" => 60,
	"Swiftness Potion" => 60,
	"Blackmouth Oil" => 80,
	"Elixir of Giant Growth" => 90,
	"Elixir of Water Breathing" => 90,
	"Elixir of Wisdom" => 90,
	"Holy Protection Potion" => 100,
	"Swim Speed Potion" => 100,
	"Healing Potion" => 110,
	"Minor Magic Resistance Potion" => 110,
	"Lesser Mana Potion" => 120,
	"Potion of Curing" => 120,
	"Strong Troll's Blood Elixir" => 125,
	"Fire Oil" => 130,
	"Elixir of Defense" => 130,
	"Shadow Protection Potion" => 135,
	"Elixir of Firepower" => 140,
	"Elixir of Lesser Agility" => 140,
	"Elixir of Ogre's Strength" => 150,
	"Free Action Potion" => 150,
	"Greater Healing Potion" => 155,
	"Mana Potion" => 160,
	"Lesser Invisibility Potion" => 165,
	"Shadow Oil" => 165,
	"Fire Protection Potion" => 165,
	"Elixir of Fortitude6" => 175,
	"Great Rage Potion" => 175,
	"Mighty Troll's Blood Elixir" => 180,
	"Elixir of Agility" => 185,
	"Frost Protection Potion" => 190,
	"Elixir of Frost Power" => 190,
	"Nature Protection Potion" => 190,
	"Elixir of Detect Lesser Invisibility" => 195,
	"Elixir of Greater Defense" => 195,
	"Catseye Elixir" => 200,
	"Frost Oil" => 200,
	"Greater Mana Potion" => 205,
	"Oil of Immolation" => 205,
	"Goblin Rocket Fuel" => 210,
	"Magic Resistance Potion" => 210,
	"Restorative Potion" => 210,
	"Elixir of Greater Water Breathing" => 215,
	"Lesser Stoneshield Potion" => 215,
	"Superior Healing Potion" => 215,
	"Philosopher's Stone" => 225,
	"Transmute Iron to Gold" => 225,
	"Transmute Mithril to Truesilver" => 225,
	"Wildvine Potion" => 225,
	"Dreamless Sleep Potion" => 230,
	"Elixir of Detect Undead" => 230,
	"Arcane Elixir" => 235,
	"Elixir of Greater Intellect" => 235,
	"Invisibility Potion" => 235,
	"Elixir of Dream Vision" => 240,
	"Elixir of Greater Agility" => 240,
	"Gift of Arthas" => 240,
	"Elixir of Giants" => 245,
	"Ghost Dye" => 245,
	"Stonescale Oil" => 250,
	"Elixir of Demonslaying" => 250,
	"Elixir of Detect Demon" => 250,
	"Elixir of Greater Firepower" => 250,
	"Elixir of Shadow Power" => 250,
	"Limited Invulnerability Potion" => 250,
	"Mighty Rage Potion" => 255,
	"Superior Mana Potion6" => 260,
	"Elixir of Superior Defense" => 265,
	"Elixir of the Sages6" => 270,
	"Transmute Air to Fire" => 275,
	"Transmute Arcanite" => 275,
	"Transmute Earth to Life" => 275,
	"Transmute Earth to Water" => 275,
	"Transmute Fire to Earth" => 275,
	"Transmute Life to Earth" => 275,
	"Transmute Undeath to Water" => 275,
	"Transmute Water to Air" => 275,
	"Transmute Water to Undeath" => 275,
	"Elixir of Brute Force" => 275,
	"Greater Dreamless Sleep Potion" => 275,
	"Mageblood Elixir" => 275,
	"Major Healing Potion" => 275,
	"Elixir of the Mongoose" => 280,
	"Greater Stoneshield Potion" => 280,
	"Greater Arcane Elixir6" => 285,
	"Living Action Potion" => 285,
	"Purification Potion6" => 285,
	"Greater Arcane Protection Potion" => 290,
	"Greater Fire Protection Potion" => 290,
	"Greater Frost Protection Potion" => 290,
	"Greater Nature Protection Potion" => 290,
	"Greater Shadow Protection Potion" => 290,
	"Major Troll's Blood Elixir" => 290,
	"Major Mana Potion5" => 295,
	"Transmute Elemental Fire" => 300,
	"Major Rejuvenation Potion" => 300,
	"Gurubashi Mojo Madness" => 300,
	"Adept's Elixir" => 300,
	"Flask of Chromatic Resistance" => 300,
	"Flask of Distilled Wisdom" => 300,
	"Flask of Petrification" => 300,
	"Flask of Supreme Power" => 300,
	"Flask of the Titans" => 300,
	"Onslaught Elixir" => 300,
	"Volatile Healing Potion" => 300,
	"Elixir of Camouflage" => 305,
	"Elixir of Major Strength" => 305,
	"Elixir of Healing Power" => 310,
	"Elixir of Major Fortitude" => 310,
	"Unstable Mana Potion" => 310,
	"Elixir of Mastery" => 315,
	"Sneaking Potion" => 315,
	"Earthen Elixir" => 320,
	"Elixir of Draenic Wisdom" => 320,
	"Elixir of Major Frost Power" => 320,
	"Insane Strength Potion" => 320,
	"Mad Alchemist's Potion" => 325,
	"Mercurial Stone" => 325,
	"Elixir of the Searching Eye" => 325,
	"Super Healing Potion" => 325,
	"Elixir of Ironskin" => 330,
	"Elixir of Major Agility" => 330,
	"Fel Strength Elixir" => 335,
	"Shrouding Potion" => 335,
	"Super Mana Potion" => 340,
	"Elixir of Major Defense" => 345,
	"Elixir of Major Firepower" => 345,
	"Fel Regeneration Potion" => 345,
	"Resurgent Healing Potion" => 350,
	"Alchemist's Stone" => 350,
	"4Transmute Primal Might" => 350,
	"Transmute Primal Air to Fire" => 350,
	"Transmute Primal Earth to Water" => 350,
	"Transmute Primal Fire to Earth" => 350,
	"Transmute Primal Water to Air" => 350,
	"Destruction Potion" => 350,
	"Elixir of Major Shadow Power" => 350,
	"Haste Potion" => 350,
	"Heroic Potion" => 350,
	"Major Dreamless Sleep Potion" => 350,
	"Wrath Elixir" => 355,
	"Elixir of Major Mageblood" => 355,
	"Icy Mana Potion" => 360,
	"Fel Mana Potion" => 360,
	"Major Arcane Protection Potion" => 360,
	"Major Fire Protection Potion" => 360,
	"Major Frost Protection Potion" => 360,
	"Major Holy Protection Potion" => 360,
	"Major Nature Protection Potion" => 360,
	"Major Shadow Protection Potion" => 360,
	"Elixir of Empowerment" => 365,
	"Ironshield Potion" => 365,
	"Spellpower Elixir" => 365,
	"Assassin's Alchemist Stone" => 375,
	"Guardian's Alchemist Stone" => 375,
	"Redeemer's Alchemist Stone" => 375,
	"Sorcerer's Alchemist Stone" => 375,
	"Guru's Elixir" => 375,
	"Lesser Flask of Toughness" => 375,
	"Pygmy Oil" => 375,
	"Potion of Nightmares" => 380,
	"Elixir of Mighty Strength" => 385,
	"Elixir of Spirit" => 385,
	"Elixir of Mighty Fortitude" => 390,
	"Elixir of Mighty Agility" => 395,
	"Elixir of Mighty Thoughts" => 395,
	"Indestructible Potion" => 395,
	"Transmute: Titanium" => 395,
	"Indestructible Alchemist Stone" => 400,
	"Mercurial Alchemist Stone" => 400,
	"Mighty Alchemist Stone" => 400,
	"Northrend Alchemy Research" => 400,
	"Runic Healing Potion" => 405,
	"Endless Healing Potion" => 410,
	"Endless Mana Potion" => 410,
	"Runic Mana Potion" => 410,
	"Transmute: Earthsiege Diamond" => 425,
	"Transmute: Skyflare Diamond" => 430,
	"Flask of Endless Rage" => 435,
	"Flask of Pure Mojo" => 435,
	"Flask of Stoneblood" => 435,
	"Flask of the Frost Wyrm" => 435,
	# Blacksmithing
	"Rough Copper Vest" => 1,
	"Rough Sharpening Stone" => 1,
	"Rough Weightstone" => 1,
	"Copper Bracers" => 1,
	"Copper Chain Pants" => 1,
	"Copper Mace" => 15,
	"Copper Axe" => 20,
	"Copper Chain Boots" => 20,
	"Rough Grinding Stone" => 25,
	"Copper Shortsword" => 25,
	"Copper Claymore" => 30,
	"Copper Dagger" => 30,
	"Copper Battle Axe" => 35,
	"Copper Chain Vest" => 35,
	"Heavy Copper Longsword" => 35,
	"Copper Chain Belt" => 35,
	"Runed Copper Gauntlets" => 40,
	"Runed Copper Pants" => 45,
	"Gemmed Copper Gauntlets" => 60,
	"Coarse Sharpening Stone" => 65,
	"Coarse Weightstone" => 65,
	"Heavy Copper Maul" => 65,
	"Thick War Axe" => 70,
	"Runed Copper Belt" => 70,
	"Coarse Grinding Stone" => 75,
	"Runed Copper Breastplate" => 80,
	"Runed Copper Bracers" => 90,
	"Rough Bronze Boots" => 95,
	"Heavy Copper Broadsword" => 95,
	"Silver Skeleton Key" => 100,
	"Silver Rod" => 100,
	"Thick Bronze Darts" => 100,
	"Ironforge Breastplate" => 100,
	"Big Bronze Knife" => 105,
	"Rough Bronze Leggings" => 105,
	"Rough Bronze Cuirass" => 105,
	"Pearl-handled Dagger" => 110,
	"Bronze Mace" => 110,
	"Rough Bronze Shoulders" => 110,
	"Bronze Axe" => 115,
	"Patterned Bronze Bracers" => 120,
	"Bronze Shortsword" => 120,
	"Heavy Sharpening Stone" => 125,
	"Heavy Weightstone" => 125,
	"Heavy Grinding Stone" => 125,
	"Deadly Bronze Poniard" => 125,
	"Silvered Bronze Shoulders" => 125,
	"Bronze Warhammer" => 125,
	"Heavy Bronze Mace" => 130,
	"Silvered Bronze Boots" => 130,
	"Silvered Bronze Breastplate" => 130,
	"Bronze Greatsword" => 130,
	"Silvered Bronze Gauntlets" => 135,
	"Bronze Battle Axe" => 135,
	"Iridescent Hammer" => 140,
	"Shining Silver Breastplate" => 145,
	"Green Iron Boots" => 145,
	"Mighty Iron Hammer" => 145,
	"Iron Buckle" => 150,
	"Golden Skeleton Key" => 150,
	"Golden Rod" => 150,
	"Green Iron Gauntlets" => 150,
	"Iron Shield Spike" => 150,
	"Green Iron Leggings" => 155,
	"Silvered Bronze Leggings" => 155,
	"Solid Iron Maul" => 155,
	"Barbaric Iron Breastplate" => 160,
	"Barbaric Iron Shoulders" => 160,
	"Green Iron Shoulders" => 160,
	"Hardened Iron Shortsword" => 160,
	"Green Iron Bracers" => 165,
	"Iron Counterweight" => 165,
	"Golden Iron Destroyer" => 170,
	"Golden Scale Leggings" => 170,
	"Green Iron Helm" => 170,
	"Barbaric Iron Helm" => 175,
	"Golden Scale Shoulders" => 175,
	"Jade Serpentblade" => 175,
	"Green Iron Hauberk" => 180,
	"Barbaric Iron Boots" => 180,
	"Glinting Steel Dagger" => 180,
	"Moonsteel Broadsword" => 180,
	"Barbaric Iron Gloves" => 185,
	"Massive Iron Axe" => 185,
	"Polished Steel Boots" => 185,
	"Golden Scale Bracers" => 185,
	"Edge of Winter" => 190,
	"Golden Scale Coif" => 190,
	"Searing Golden Blade" => 190,
	"Steel Weapon Chain" => 190,
	"Golden Scale Cuirass" => 195,
	"Solid Grinding Stone" => 200,
	"Solid Sharpening Stone" => 200,
	"Solid Weightstone" => 200,
	"Truesilver Skeleton Key" => 200,
	"Truesilver Rod" => 200,
	"Whirling Steel Axes" => 200,
	"Frost Tiger Blade" => 200,
	"Golden Scale Boots" => 200,
	"Shadow Crescent Axe" => 200,
	"Steel Breastplate" => 200,
	"Inlaid Mithril Cylinder" => 200,
	"Golden Scale Gauntlets" => 205,
	"Heavy Mithril Gauntlet" => 205,
	"Heavy Mithril Shoulder" => 205,
	"Heavy Mithril Pants" => 210,
	"Mithril Scale Pants" => 210,
	"Heavy Mithril Axe" => 210,
	"Mithril Scale Bracers" => 215,
	"Mithril Shield Spike" => 215,
	"Steel Plate Helm" => 215,
	"Ornate Mithril Gloves" => 220,
	"Ornate Mithril Pants" => 220,
	"Blue Glittering Axe" => 220,
	"Truesilver Gauntlets" => 225,
	"Ornate Mithril Shoulder" => 225,
	"Wicked Mithril Blade" => 225,
	"Heavy Mithril Breastplate" => 230,
	"Mithril Coif" => 230,
	"Big Black Mace" => 230,
	"Heavy Mithril Boots" => 235,
	"Mithril Scale Shoulders" => 235,
	"Mithril Spurs" => 235,
	"The Shatterer" => 235,
	"Dazzling Mithril Rapier" => 240,
	"Heavy Mithril Helm" => 245,
	"Truesilver Breastplate" => 245,
	"Phantom Blade" => 245,
	"Runed Mithril Hammer" => 245,
	"Dense Grinding Stone" => 250,
	"Dense Sharpening Stone" => 250,
	"Dense Weightstone" => 250,
	"Thorium Armor" => 250,
	"Thorium Belt" => 250,
	"Blight" => 250,
	"Thorium Bracers" => 255,
	"Ebon Shiv" => 255,
	"Earthforged Leggings" => 260,
	"Light Earthforged Blade" => 260,
	"Light Emberforged Hammer" => 260,
	"Light Skyforged Axe" => 260,
	"Windforged Leggings" => 260,
	"Radiant Belt" => 260,
	"Truesilver Champion" => 260,
	"Dark Iron Pulverizer" => 265,
	"Imperial Plate Belt" => 265,
	"Imperial Plate Shoulders" => 265,
	"Wildthorn Mail" => 270,
	"Dark Iron Mail" => 270,
	"Imperial Plate Bracers" => 270,
	"Radiant Breastplate" => 270,
	"Arcanite Skeleton Key" => 275,
	"Arcanite Rod" => 275,
	"Dark Iron Sunderer" => 275,
	"Thorium Shield Spike" => 275,
	"Dawn\'s Edge" => 275,
	"Ornate Thorium Handaxe" => 275,
	"Dark Iron Shoulders" => 280,
	"Thorium Boots" => 280,
	"Thorium Helm" => 280,
	"Blazing Rapier" => 280,
	"Enchanted Battlehammer" => 280,
	"Huge Thorium Battleaxe" => 280,
	"Dark Iron Plate" => 285,
	"Demon Forged Breastplate" => 285,
	"Radiant Gloves" => 285,
	"Serenity" => 285,
	"Dawnbringer Shoulders" => 290,
	"Fiery Plate Gauntlets" => 290,
	"Girdle of the Dawn" => 290,
	"Heavy Timbermaw Belt" => 290,
	"Radiant Boots" => 290,
	"Corruption" => 290,
	"Volcanic Hammer" => 290,
	"Dark Iron Bracers" => 295,
	"Fiery Chain Girdle" => 295,
	"Storm Gauntlets" => 295,
	"Imperial Plate Boots" => 295,
	"Imperial Plate Helm" => 295,
	"Radiant Circlet" => 295,
	"Fel Iron Rod" => 300,
	"Fel Sharpening Stone" => 300,
	"Fel Weightstone" => 300,
	"Elemental Sharpening Stone" => 300,
	"Fel Iron Chain Coif" => 300,
	"Fel Iron Plate Gloves" => 300,
	"Black Amnesty" => 300,
	"Black Grasp of the Destroyer" => 300,
	"Blackfury" => 300,
	"Blackguard" => 300,
	"Dark Iron Boots" => 300,
	"Dark Iron Gauntlets" => 300,
	"Dark Iron Helm" => 300,
	"Dark Iron Leggings" => 300,
	"Ebon Hand" => 300,
	"Fiery Chain Shoulders" => 300,
	"Icebane Bracers" => 300,
	"Icebane Breastplate" => 300,
	"Icebane Gauntlets" => 300,
	"Invulnerable Mail" => 300,
	"Jagged Obsidian Shield" => 300,
	"Lionheart Helm" => 300,
	"Nightfall" => 300,
	"Obsidian Mail Tunic" => 300,
	"Persuader" => 300,
	"Sageblade" => 300,
	"Stronghold Gauntlets" => 300,
	"Thick Obsidian Breastplate" => 300,
	"Titanic Leggings" => 300,
	"Annihilator" => 300,
	"Arcanite Champion" => 300,
	"Arcanite Reaper" => 300,
	"Bloodsoul Breastplate" => 300,
	"Bloodsoul Gauntlets" => 300,
	"Bloodsoul Shoulders" => 300,
	"Dark Iron Destroyer" => 300,
	"Dark Iron Reaver" => 300,
	"Darkrune Breastplate" => 300,
	"Darkrune Gauntlets" => 300,
	"Darkrune Helm" => 300,
	"Darksoul Breastplate" => 300,
	"Darksoul Leggings" => 300,
	"Darksoul Shoulders" => 300,
	"Enchanted Thorium Breastplate" => 300,
	"Enchanted Thorium Helm" => 300,
	"Enchanted Thorium Leggings" => 300,
	"Frostguard" => 300,
	"Gloves of the Dawn" => 300,
	"Hammer of the Titans" => 300,
	"Heartseeker" => 300,
	"Heavy Obsidian Belt" => 300,
	"Heavy Timbermaw Boots" => 300,
	"Helm of the Great Chief" => 300,
	"Ironvine Belt" => 300,
	"Ironvine Breastplate" => 300,
	"Ironvine Gloves" => 300,
	"Light Obsidian Belt" => 300,
	"Masterwork Stormhammer" => 300,
	"Whitesoul Helm" => 300,
	"Enchanted Thorium Blades" => 300,
	"Imperial Plate Chest" => 300,
	"Imperial Plate Leggings" => 300,
	"Radiant Leggings" => 300,
	"Runic Plate Boots" => 300,
	"Runic Plate Leggings" => 300,
	"Runic Plate Shoulders" => 300,
	"Thorium Leggings" => 300,
	"Sulfuron Hammer" => 300,
	"Fel Iron Plate Belt" => 305,
	"Fel Iron Chain Gloves" => 310,
	"Fel Iron Hatchet" => 310,
	"Fel Iron Chain Bracers" => 315,
	"Fel Iron Hammer" => 315,
	"Fel Iron Plate Boots" => 315,
	"Fel Iron Plate Pants" => 315,
	"Fel Iron Chain Tunic" => 320,
	"Fel Iron Greatsword" => 320,
	"Lesser Rune of Warding" => 325,
	"Adamantite Maul" => 325,
	"Fel Iron Breastplate" => 325,
	"Great Earthforged Hammer" => 330,
	"Heavy Earthforged Breastplate" => 330,
	"Lavaforged Warhammer" => 330,
	"Skyforged Great Axe" => 330,
	"Stoneforged Claymore" => 330,
	"Stormforged Axe" => 330,
	"Stormforged Hauberk" => 330,
	"Windforged Rapier" => 330,
	"Adamantite Cleaver" => 330,
	"Adamantite Dagger" => 330,
	"Adamantite Weapon Chain" => 335,
	"Adamantite Plate Bracers" => 335,
	"Adamantite Plate Gloves" => 335,
	"Adamantite Rapier" => 335,
	"Lesser Ward of Shielding" => 340,
	"Adamantite Breastplate" => 340,
	"Adamantite Sharpening Stone" => 350,
	"Adamantite Weightstone" => 350,
	"Adamantite Rod" => 350,
	"Greater Rune of Warding" => 350,
	"Cobalt Skeleton Key" => 350,
	"Breastplate of Kings" => 350,
	"Drakefist Hammer" => 350,
	"Fireguard" => 350,
	"Lionheart Blade" => 350,
	"Lunar Crescent" => 350,
	"Nether Chain Shirt" => 350,
	"The Planar Edge" => 350,
	"Thunder" => 350,
	"Felsteel Whisper Knives" => 350,
	"Flamebane Bracers" => 350,
	"Cobalt Belt" => 350,
	"Cobalt Boots" => 350,
	"Enchanted Adamantite Belt" => 355,
	"Enchanted Adamantite Boots" => 355,
	"Flamebane Helm" => 355,
	"Cobalt Bracers" => 360,
	"Cobalt Shoulders" => 360,
	"Cobalt Triangle Shield" => 360,
	"Enchanted Adamantite Breastplate" => 360,
	"Felsteel Gloves" => 360,
	"Felsteel Leggings" => 360,
	"Flamebane Gloves" => 360,
	"Khorium Belt" => 360,
	"Khorium Pants" => 360,
	"Felsteel Shield Spike" => 360,
	"Black Felsteel Bracers" => 365,
	"Blessed Bracers" => 365,
	"Bracers of the Green Fortress" => 365,
	"Dirge" => 365,
	"Eternium Runed Blade" => 365,
	"Fel Edged Battleaxe" => 365,
	"Fel Hardened Maul" => 365,
	"Felfury Gauntlets" => 365,
	"Felsteel Longblade" => 365,
	"Felsteel Reaper" => 365,
	"Gauntlets of the Iron Tower" => 365,
	"Hammer of Righteous Might" => 365,
	"Hand of Eternity" => 365,
	"Helm of the Stalwart Defender" => 365,
	"Khorium Champion" => 365,
	"Oathkeeper\'s Helm" => 365,
	"Runic Hammer" => 365,
	"Steelgrip Gauntlets" => 365,
	"Storm Helm" => 365,
	"Enchanted Adamantite Leggings" => 365,
	"Felsteel Helm" => 365,
	"Flamebane Breastplate" => 365,
	"Khorium Boots" => 365,
	"Ragesteel Gloves" => 365,
	"Ragesteel Helm" => 365,
	"Ragesteel Shoulders" => 365,
	"Hard Khorium Battlefists" => 365,
	"Hard Khorium Battleplate" => 365,
	"Sunblessed Breastplate" => 365,
	"Sunblessed Gauntlets" => 365,
	"Cobalt Helm" => 370,
	"Cobalt Legplates" => 370,
	"Cobalt Gauntlets" => 370,
	"Earthpeace Breastplate" => 370,
	"Ragesteel Breastplate" => 370,
	"Swiftsteel Gloves" => 370,
	"Greater Ward of Shielding" => 375,
	"Eternium Rod" => 375,
	"Cobalt Chestpiece" => 375,
	"Spiked Cobalt Helm" => 375,
	"Belt of the Guardian" => 375,
	"Black Planar Edge" => 375,
	"Blazefury" => 375,
	"Blazeguard" => 375,
	"Bloodmoon" => 375,
	"Boots of the Protector" => 375,
	"Bulwark of Kings" => 375,
	"Bulwark of the Ancient Kings" => 375,
	"Dawnsteel Bracers" => 375,
	"Dawnsteel Shoulders" => 375,
	"Deep Thunder" => 375,
	"Dragonmaw" => 375,
	"Dragonstrike" => 375,
	"Embrace of the Twisting Nether" => 375,
	"Iceguard Breastplate" => 375,
	"Iceguard Helm" => 375,
	"Iceguard Leggings" => 375,
	"Lionheart Champion" => 375,
	"Lionheart Executioner" => 375,
	"Mooncleaver" => 375,
	"Red Belt of Battle" => 375,
	"Red Havoc Boots" => 375,
	"Shadesteel Bracers" => 375,
	"Shadesteel Girdle" => 375,
	"Shadesteel Greaves" => 375,
	"Shadesteel Sabots" => 375,
	"Stormherald" => 375,
	"Swiftsteel Bracers" => 375,
	"Swiftsteel Shoulders" => 375,
	"Twisting Nether Chain Shirt" => 375,
	"Wicked Edge of the Planes" => 375,
	"Wildguard Breastplate" => 375,
	"Wildguard Helm" => 375,
	"Wildguard Leggings" => 375,
	"Reinforced Cobalt Shoulders" => 375,
	"Reinforced Cobalt Helm" => 375,
	"Reinforced Cobalt Legplates" => 375,
	"Reinforced Cobalt Chestpiece" => 375,
	"Cobalt Tenderizer" => 380,
	"Spiked Cobalt Boots" => 380,
	"Sturdy Cobalt Quickblade" => 380,
	"Forged Cobalt Claymore" => 385,
	"Spiked Cobalt Chestpiece" => 385,
	"Spiked Cobalt Shoulders" => 385,
	"Sure-fire Shuriken" => 385,
	"Honed Cobalt Cleaver" => 390,
	"Saronite Defender" => 390,
	"Saronite Protector" => 390,
	"Notched Cobalt War Axe" => 390,
	"Spiked Cobalt Gauntlets" => 390,
	"Brilliant Saronite Belt" => 395,
	"Brilliant Saronite Legplates" => 395,
	"Savage Cobalt Slicer" => 395,
	"Tempered Saronite Belt" => 395,
	"Tempered Saronite Legplates" => 395,
	"Spiked Cobalt Belt" => 395,
	"Spiked Cobalt Legplates" => 395,
	"Brilliant Saronite Bracers" => 400,
	"Brilliant Saronite Gauntlets" => 400,
	"Saronite Ambusher" => 400,
	"Tempered Saronite Boots" => 400,
	"Tempered Saronite Breastplate" => 400,
	"Horned Cobalt Helm" => 400,
	"Spiked Cobalt Bracers" => 400,
	"Brilliant Saronite Boots" => 405,
	"Brilliant Saronite Pauldrons" => 405,
	"Saronite Shiv" => 405,
	"Tempered Saronite Helm" => 405,
	"Tempered Saronite Shoulders" => 405,
	"Deadly Saronite Dirk" => 405,
	"Cudgel of Saronite Justice" => 410,
	"Furious Saronite Beatstick" => 410,
	"Saronite Bulwark" => 410,
	"Saronite Spellblade" => 410,
	"Tempered Saronite Bracers" => 410,
	"Brilliant Saronite Breastplate" => 415,
	"Brilliant Saronite Helm" => 415,
	"Chestplate of Conquest" => 415,
	"Corroded Saronite Edge" => 415,
	"Corroded Saronite Woundbringer" => 415,
	"Eternal Belt Buckle" => 415,
	"Legplates of Conquest" => 415,
	"Saronite Mindcrusher" => 415,
	"Tempered Saronite Gauntlets" => 415,
	"Ornate Saronite Bracers" => 420,
	"Savage Saronite Bracers" => 420,
	"Vengeance Bindings" => 420,
	"Titanium Shield Spike" => 420,
	"Titanium Weapon Chain" => 420,
	"Titanium Rod" => 420,
	"Icebane Girdle" => 420,
	"Icebane Treads" => 420,
	"Daunting Handguards" => 420,
	"Ornate Saronite Gauntlets" => 420,
	"Ornate Saronite Pauldrons" => 420,
	"Ornate Saronite Waistguard" => 420,
	"Ornate Saronite Walkers" => 420,
	"Righteous Gauntlets" => 420,
	"Savage Saronite Gauntlets" => 420,
	"Savage Saronite Pauldrons" => 420,
	"Savage Saronite Waistguard" => 420,
	"Savage Saronite Walkers" => 420,
	"Icebane Chestguard" => 425,
	"Daunting Legplates" => 425,
	"Helm of Command" => 425,
	"Ornate Saronite Hauberk" => 425,
	"Ornate Saronite Legplates" => 425,
	"Ornate Saronite Skullshield" => 425,
	"Righteous Greaves" => 425,
	"Savage Saronite Hauberk" => 425,
	"Savage Saronite Legplates" => 425,
	"Savage Saronite Skullshield" => 425,
	"Titanium Skeleton Key" => 430,
	"Brilliant Titansteel Helm" => 440,
	"Brilliant Titansteel Treads" => 440,
	"Spiked Titansteel Helm" => 440,
	"Spiked Titansteel Treads" => 440,
	"Tempered Titansteel Helm" => 440,
	"Tempered Titansteel Treads" => 440,
	"Titansteel Bonecrusher" => 440,
	"Titansteel Destroyer" => 440,
	"Titansteel Guardian" => 440,
	"Titansteel Shanker" => 440,
	"Titansteel Shield Wall" => 440,
	"Socket Bracer" => 400,
	"Socket Gloves" => 400,
	# Cooking
	"Spice Bread" => 1,
	"Brilliant Smallfish" => 1,
	"Charred Wolf Meat" => 1,
	"Crispy Bat Wing" => 1,
	"Gingerbread Cookie" => 1,
	"Herb Baked Egg" => 1,
	"Lynx Steak" => 1,
	"Roasted Boar Meat" => 1,
	"Roasted Moongraze Tenderloin" => 1,
	"Slitherskin Mackerel" => 1,
	"Delicious Chocolate Cake" => 1,
	"Kaldorei Spider Kabob" => 10,
	"Spiced Wolf Meat" => 10,
	"Beer Basted Boar Ribs" => 10,
	"Scorpid Surprise" => 20,
	"Egg Nog" => 35,
	"Roasted Kodo Meat" => 35,
	"Smoked Bear Meat" => 40,
	"Bat Bites" => 50,
	"Boiled Clams" => 50,
	"Coyote Steak" => 50,
	"Fillet of Frenzy" => 50,
	"Goretusk Liver Pie" => 50,
	"Loch Frenzy Delight" => 50,
	"Longjaw Mud Snapper" => 50,
	"Rainbow Fin Albacore" => 50,
	"Strider Stew" => 50,
	"Blood Sausage" => 60,
	"Crunchy Spider Surprise" => 60,
	"Thistle Tea" => 60,
	"Crab Cake" => 75,
	"Westfall Stew" => 75,
	"Crocolisk Steak" => 80,
	"Dry Pork Ribs" => 80,
	"Smoked Sagefish" => 80,
	"Cooked Crab Claw" => 85,
	"Savory Deviate Delight" => 85,
	"Clam Chowder" => 90,
	"Dig Rat Stew" => 90,
	"Murloc Fin Soup" => 90,
	"Captain Rumsey's Lager" => 100,
	"Redridge Goulash" => 100,
	"Bristle Whisker Catfish" => 100,
	"Crispy Lizard Tail" => 100,
	"Seasoned Wolf Kabob" => 100,
	"Succulent Pork Ribs" => 110,
	"Big Bear Steak" => 110,
	"Gooey Spider Cake" => 110,
	"Lean Venison" => 110,
	"Crocolisk Gumbo" => 120,
	"Goblin Deviled Clams" => 125,
	"Lean Wolf Steak" => 125,
	"Hot Lion Chops" => 125,
	"Curiously Tasty Omelet" => 130,
	"Heavy Crocolisk Stew" => 150,
	"Tasty Lion Steak" => 150,
	"Goldthorn Tea" => 175,
	"Rockscale Cod" => 175,
	"Barbecued Buzzard Wing" => 175,
	"Carrion Surprise" => 175,
	"Giant Clam Scorcho" => 175,
	"Hot Wolf Ribs" => 175,
	"Jungle Stew" => 175,
	"Mithril Head Trout" => 175,
	"Mystery Stew" => 175,
	"Roast Raptor" => 175,
	"Sagefish Delight" => 175,
	"Soothing Turtle Bisque" => 175,
	"Dragonbreath Chili" => 200,
	"Heavy Kodo Stew" => 200,
	"Spider Sausage" => 200,
	"Cooked Glossy Mightfish" => 225,
	"Filet of Redgill" => 225,
	"Monster Omelet" => 225,
	"Spiced Chili Crab" => 225,
	"Spotted Yellowtail" => 225,
	"Tender Wolf Steak" => 225,
	"Undermine Clam Chowder" => 225,
	"Grilled Squid" => 240,
	"Hot Smoked Bass" => 240,
	"Charred Bear Kabobs" => 250,
	"Juicy Bear Burger" => 250,
	"Nightfin Soup" => 250,
	"Poached Sunscale Salmon" => 250,
	"Baked Salmon" => 275,
	"Lobster Stew" => 275,
	"Mightfish Steak" => 275,
	"Runn Tum Tuber Surprise" => 275,
	"Smoked Desert Dumplings" => 285,
	"Blackened Trout" => 300,
	"Broiled Bloodfin" => 300,
	"Buzzard Bites" => 300,
	"Clam Bar" => 300,
	"Feltail Delight" => 300,
	"Ravager Dog" => 300,
	"Stormchops" => 300,
	"Dirge's Kickin' Chimaerok Chops" => 300,
	"Kibler's Bits" => 300,
	"Blackened Sporefish" => 310,
	"Sporeling Snack" => 310,
	"Blackened Basilisk" => 315,
	"Stewed Trout" => 320,
	"Grilled Mudfish" => 320,
	"Poached Bluefish" => 320,
	"Hot Apple Cider" => 325,
	"Skullfish Soup" => 325,
	"Spicy Hot Talbuk" => 325,
	"Golden Fish Sticks" => 325,
	"Roasted Clefthoof" => 325,
	"Talbuk Steak" => 325,
	"Warp Burger" => 325,
	"Crunchy Serpent" => 335,
	"Mok'Nathal Shortribs" => 335,
	"Bad Clams" => 350,
	"Haunted Herring" => 350,
	"Last Week's Mammoth" => 350,
	"Tasty Cupcake" => 350,
	"Grilled Bonescale" => 350,
	"Sauteed Goby" => 350,
	"Smoked Rockfin" => 350,
	"Baked Manta Ray" => 350,
	"Dalaran Clam Chowder" => 350,
	"Grilled Sculpin" => 350,
	"Mammoth Meal" => 350,
	"Pickled Fangtooth" => 350,
	"Poached Nettlefish" => 350,
	"Rhino Dogs" => 350,
	"Roasted Worg" => 350,
	"Shoveltusk Steak" => 350,
	"Smoked Salmon" => 350,
	"Wyrm Delight" => 350,
	"Spicy Crawdad" => 350,
	"Fisherman's Feast" => 350,
	"Hot Buttered Trout" => 350,
	"Kungaloosh" => 375,
	"Feast" => 375,
	"Firecracker Salmon" => 400,
	"Imperial Manta Steak" => 400,
	"Mega Mammoth Meal" => 400,
	"Mighty Rhino Dogs" => 400,
	"Poached Northern Sculpin" => 400,
	"Spiced Wyrm Burger" => 400,
	"Spicy Blue Nettlefish" => 400,
	"Spicy Fried Herring" => 400,
	"Tender Shoveltusk Steak" => 400,
	"Very Burnt Worg" => 400,
	"Blackened Dragonfin" => 400,
	"Blackened Worg Steak" => 400,
	"Critter Bites" => 400,
	"Cuttlesteak" => 400,
	"Dragonfin Filet" => 400,
	"Hearty Rhino" => 400,
	"Rhinolicious Wyrmsteak" => 400,
	"Snapper Extreme" => 400,
	"Spiced Mammoth Treats" => 400,
	"Tracker Snacks" => 400,
	"Gigantic Feast" => 425,
	"Small Feast" => 425,
	"Fish Feast" => 450,
	"Northern Stew" => 9999,
	# Enchanting
	"Runed Copper Rod" => 1,
	"Enchant Bracer - Minor Health" => 1,
	"Enchant Bracer - Minor Deflection" => 1,
	"Lesser Magic Wand" => 10,
	"Enchant Chest - Minor Health" => 15,
	"Enchant Chest - Minor Mana" => 20,
	"Enchant Chest - Minor Absorption" => 40,
	"Minor Wizard Oil" => 45,
	"Enchant Cloak - Minor Resistance" => 45,
	"Enchant Bracer - Minor Stamina" => 50,
	"Enchant Bracer - Minor Spirit" => 60,
	"Enchant Chest - Lesser Health" => 60,
	"Greater Magic Wand" => 70,
	"Enchant Bracer - Minor Agility" => 80,
	"Enchant Bracer - Minor Strength" => 80,
	"Enchant Chest - Lesser Mana" => 80,
	"Enchant Cloak - Minor Protection" => 90,
	"Enchant Weapon - Minor Beastslayer" => 90,
	"Enchant Weapon - Minor Striking" => 90,
	"Runed Silver Rod" => 100,
	"Enchant Shield - Minor Stamina" => 105,
	"Enchant Cloak - Minor Agility" => 110,
	"Enchant Cloak - Lesser Protection" => 115,
	"Enchant Shield - Lesser Protection" => 115,
	"Enchant Bracer - Lesser Spirit" => 120,
	"Enchant Chest - Health" => 120,
	"Enchant Boots - Minor Agility" => 125,
	"Enchant Boots - Minor Stamina" => 125,
	"Enchant Cloak - Lesser Fire Resistance" => 125,
	"Enchant Bracer - Lesser Stamina" => 130,
	"Enchant Shield - Lesser Spirit" => 130,
	"Enchant Cloak - Lesser Shadow Resistance" => 135,
	"Enchant Bracer - Lesser Strength" => 140,
	"Enchant Chest - Lesser Absorption" => 140,
	"Enchant Weapon - Lesser Striking" => 140,
	"Enchant Chest - Mana" => 145,
	"Enchant Gloves - Fishing" => 145,
	"Enchant Gloves - Herbalism" => 145,
	"Enchant Gloves - Mining" => 145,
	"Minor Mana Oil" => 150,
	"Runed Golden Rod" => 150,
	"Enchant Bracer - Lesser Intellect" => 150,
	"Enchant Chest - Minor Stats" => 150,
	"Lesser Mystic Wand" => 155,
	"Enchant Cloak - Defense" => 155,
	"Enchant Shield - Lesser Stamina" => 155,
	"Enchant Boots - Lesser Agility" => 160,
	"Enchant Chest - Greater Health" => 160,
	"Enchant Bracer - Spirit" => 165,
	"Enchant Boots - Lesser Stamina" => 170,
	"Enchant Bracer - Lesser Deflection" => 170,
	"Enchant Bracer - Stamina" => 170,
	"Greater Mystic Wand" => 175,
	"Enchant Cloak - Fire Resistance" => 175,
	"Enchant Weapon - Lesser Beastslayer" => 175,
	"Enchant Weapon - Lesser Elemental Slayer" => 175,
	"Enchant Bracer - Strength" => 180,
	"Enchant Shield - Spirit" => 180,
	"Enchant Chest - Greater Mana" => 185,
	"Enchant Boots - Lesser Spirit" => 190,
	"Enchant Weapon - Winter's Might" => 190,
	"Enchant Shield - Lesser Block" => 195,
	"Enchant Weapon - Striking" => 195,
	"Lesser Wizard Oil" => 200,
	"Runed Truesilver Rod" => 200,
	"Enchant Chest - Lesser Stats" => 200,
	"Enchant Gloves - Skinning" => 200,
	"Enchant Cloak - Greater Defense" => 205,
	"Enchant Cloak - Resistance" => 205,
	"Enchant Bracer - Intellect" => 210,
	"Enchant Gloves - Agility" => 210,
	"Enchant Shield - Stamina" => 210,
	"Enchant Boots - Stamina" => 215,
	"Enchant Gloves - Advanced Mining" => 215,
	"Enchant Bracer - Greater Spirit" => 220,
	"Enchant Chest - Superior Health" => 220,
	"Enchant Boots - Minor Speed" => 225,
	"Enchant Cloak - Lesser Agility" => 225,
	"Enchant Gloves - Advanced Herbalism" => 225,
	"Enchant Gloves - Strength" => 225,
	"Enchant Chest - Superior Mana" => 230,
	"Enchant Shield - Greater Spirit" => 230,
	"Enchant Weapon - Demonslaying" => 230,
	"Enchant Boots - Agility" => 235,
	"Enchant Bracer - Deflection" => 235,
	"Enchant Shield - Frost Resistance" => 235,
	"Enchant Bracer - Greater Strength" => 240,
	"Enchant Bracer - Greater Stamina" => 245,
	"Enchant Chest - Stats" => 245,
	"Enchant Weapon - Greater Striking" => 245,
	"Enchanted Leather" => 250,
	"Enchanted Thorium" => 250,
	"Lesser Mana Oil" => 250,
	"Enchant Gloves - Minor Haste" => 250,
	"Enchant Gloves - Riding Skill" => 250,
	"Enchant Bracer - Greater Intellect" => 255,
	"Enchant Boots - Greater Stamina" => 260,
	"Smoking Heart of the Mountain" => 265,
	"Enchant Cloak - Greater Resistance" => 265,
	"Enchant Shield - Greater Stamina" => 265,
	"Enchant Weapon - Fiery Weapon" => 265,
	"Enchant Bracer - Superior Spirit" => 270,
	"Enchant Gloves - Greater Agility" => 270,
	"Wizard Oil" => 275,
	"Enchant Boots - Spirit" => 275,
	"Enchant Chest - Major Health" => 275,
	"Enchant Shield - Superior Spirit" => 280,
	"Enchant Cloak - Superior Defense" => 285,
	"Enchant Weapon - Icy Chill" => 285,
	"Runed Arcanite Rod" => 290,
	"Enchant Bracer - Mana Regeneration" => 290,
	"Enchant Chest - Major Mana" => 290,
	"Enchant Weapon - Agility" => 290,
	"Enchant Weapon - Strength" => 290,
	"Enchant Boots - Greater Agility" => 295,
	"Enchant Bracer - Superior Strength" => 295,
	"Enchant Gloves - Greater Strength" => 295,
	"Enchant Weapon - Unholy Weapon" => 295,
	"Nexus Transformation" => 300,
	"Brilliant Mana Oil" => 300,
	"Brilliant Wizard Oil" => 300,
	"Runed Fel Iron Rod" => 300,
	"Enchant Bracer - Assault" => 300,
	"Enchant Bracer - Healing Power" => 300,
	"Enchant Bracer - Superior Stamina" => 300,
	"Enchant Chest - Greater Stats" => 300,
	"Enchant Chest - Restore Mana Prime" => 300,
	"Enchant Cloak - Dodge" => 300,
	"Enchant Cloak - Greater Fire Resistance" => 300,
	"Enchant Cloak - Greater Nature Resistance" => 300,
	"Enchant Cloak - Stealth" => 300,
	"Enchant Cloak - Subtlety" => 300,
	"Enchant Gloves - Fire Power" => 300,
	"Enchant Gloves - Frost Power" => 300,
	"Enchant Gloves - Healing Power" => 300,
	"Enchant Gloves - Shadow Power" => 300,
	"Enchant Gloves - Superior Agility" => 300,
	"Enchant Gloves - Threat" => 300,
	"Enchant Weapon - Crusader" => 300,
	"Enchant Weapon - Healing Power" => 300,
	"Enchant Weapon - Lifestealing" => 300,
	"Enchant Weapon - Mighty Intellect" => 300,
	"Enchant Weapon - Mighty Spirit" => 300,
	"Enchant Weapon - Spell Power" => 300,
	"Enchant Weapon - Superior Striking" => 300,
	"Enchant Boots - Vitality" => 305,
	"Enchant Bracer - Brawn" => 305,
	"Enchant Bracer - Major Intellect" => 305,
	"Enchant Gloves - Blasting" => 305,
	"Superior Mana Oil" => 310,
	"Enchant Cloak - Greater Agility" => 310,
	"Enchant Cloak - Major Armor" => 310,
	"Enchant Gloves - Assault" => 310,
	"Enchant Shield - Tough Shield" => 310,
	"Enchant Bracer - Stats" => 315,
	"Enchant Chest - Exceptional Health" => 315,
	"Enchant Boots - Fortitude" => 320,
	"Enchant Bracer - Major Defense" => 320,
	"Enchant Chest - Major Spirit" => 320,
	"Prismatic Sphere" => 325,
	"Enchant Bracer - Superior Healing" => 325,
	"Enchant Cloak - Spell Penetration" => 325,
	"Enchant Shield - Intellect" => 325,
	"Enchant Shield - Major Stamina" => 325,
	"Enchant Cloak - Major Resistance" => 330,
	"Enchant Shield - Resilience" => 330,
	"Large Prismatic Shard" => 335,
	"Small Prismatic Shard" => 335,
	"Enchant Bracer - Restore Mana Prime" => 335,
	"Superior Wizard Oil" => 340,
	"Enchant Boots - Dexterity" => 340,
	"Enchant Gloves - Major Strength" => 340,
	"Enchant Shield - Shield Block" => 340,
	"Enchant Weapon - Major Intellect" => 340,
	"Enchant Weapon - Major Striking" => 340,
	"Enchant Chest - Exceptional Stats" => 345,
	"Enchant Chest - Major Resilience" => 345,
	"Enchant Weapon - Deathfrost" => 350,
	"Enchant Weapon - Greater Agility" => 350,
	"Enchant Cloak - Speed" => 350,
	"Void Sphere" => 350,
	"Runed Adamantite Rod" => 350,
	"Enchant Bracer - Fortitude" => 350,
	"Enchant Cloak - Greater Arcane Resistance" => 350,
	"Enchant Cloak - Greater Shadow Resistance" => 350,
	"Enchant Gloves - Major Healing" => 350,
	"Enchant Weapon - Major Healing" => 350,
	"Enchant Weapon - Major Spellpower" => 350,
	"Enchant Weapon - Potency" => 350,
	"Enchant Boots - Boar's Speed" => 360,
	"Enchant Boots - Cat's Swiftness" => 360,
	"Enchant Gloves - Major Spellpower" => 360,
	"Enchant Gloves - Precise Strikes" => 360,
	"Enchant Ring - Spellpower" => 360,
	"Enchant Ring - Striking" => 360,
	"Enchant Shield - Resistance" => 360,
	"Enchant Weapon - Battlemaster" => 360,
	"Enchant Weapon - Spellsurge" => 360,
	"Enchant Bracers - Striking" => 360,
	"Enchant Gloves - Exceptional Spellpower" => 360,
	"Enchant Bracer - Spellpower" => 360,
	"Enchant Chest - Defense" => 360,
	"Enchant Boots - Surefooted" => 370,
	"Enchant Ring - Healing Power" => 370,
	"Enchant Chest - Super Stats" => 370,
	"Void Shatter" => 375,
	"Enchant Weapon - Sunfire" => 375,
	"Runed Eternium Rod" => 375,
	"Enchant Gloves - Gatherer" => 375,
	"Enchant Cloak - Steelweave" => 375,
	"Enchant Ring - Stats" => 375,
	"Enchant Weapon - Executioner" => 375,
	"Enchant Weapon - Mongoose" => 375,
	"Enchant Weapon - Soulfrost" => 375,
	"Enchant Bracers - Exceptional Intellect" => 375,
	"Enchant Boots - Assault" => 375,
	"Enchant Weapon - Greater Potency" => 380,
	"Enchant Boots - Greater Fortitude" => 385,
	"Enchant Boots - Icewalker" => 385,
	"Enchant Cloak - Spell Piercing" => 395,
	"Enchant Bracers - Greater Spellpower" => 395,
	"Enchant Chest - Mighty Health" => 395,
	"Enchant Cloak - Superior Agility" => 395,
	"Enchant Gloves - Greater Assault" => 395,
	"Enchant Shield - Greater Intellect" => 395,
	"Enchant Weapon - Exceptional Spellpower" => 395,
	"Enchant Ring - Assault" => 400,
	"Enchant Ring - Greater Spellpower" => 400,
	"Enchant Ring - Stamina" => 400,
	"Enchant Bracers - Greater Stats" => 400,
	"Enchant Chest - Greater Defense" => 400,
	"Enchant Cloak - Superior Arcane Resistance" => 400,
	"Enchant Cloak - Superior Fire Resistance" => 400,
	"Enchant Cloak - Superior Frost Resistance" => 400,
	"Enchant Cloak - Superior Nature Resistance" => 400,
	"Enchant Cloak - Superior Shadow Resistance" => 400,
	"Enchant Boots - Greater Vitality" => 405,
	"Enchant Gloves - Expertise" => 405,
	"Enchant Boots - Greater Spirit" => 410,
	"Enchant Gloves - Precision" => 410,
	"Enchant Weapon - Exceptional Agility" => 410,
	"Enchant Weapon - Exceptional Spirit" => 410,
	"Enchant Boots - Superior Agility" => 415,
	"Enchant Bracers - Expertise" => 415,
	"Enchant Gloves - Major Agility" => 415,
	"Enchant Bracers - Major Spirit" => 420,
	"Enchant Chest - Greater Mana Restoration" => 420,
	"Enchant Cloak - Major Agility" => 420,
	"Enchant Shield - Defense" => 420,
	"Runed Titanium Rod" => 425,
	"Enchant Chest - Super Health" => 425,
	"Enchant Gloves - Crusher" => 425,
	"Enchant Weapon - Icebreaker" => 425,
	"Enchant Bracers - Greater Assault" => 430,
	"Enchant Cloak - Greater Speed" => 430,
	"Enchant Cloak - Mighty Armor" => 430,
	"Enchant Weapon - Giant Slayer" => 430,
	"Enchant Cloak - Titanweave" => 435,
	"Enchant Gloves - Armsman" => 435,
	"Enchant Weapon - Mighty Spellpower" => 435,
	"Enchant Weapon - Superior Potency" => 435,
	"Enchant Boots - Greater Assault" => 440,
	"Enchant Boots - Tuskarr's Vitality" => 440,
	"Enchant Bracers - Superior Spellpower" => 440,
	"Enchant Chest - Powerful Stats" => 440,
	"Enchant Cloak - Shadow Armor" => 440,
	"Enchant Cloak - Wisdom" => 440,
	"Enchant Weapon - Accuracy" => 440,
	"Enchant Weapon - Berserking" => 440,
	"Enchant Weapon - Black Magic" => 440,
	"Enchant Weapon - Lifeward" => 440,
	"Enchant Gloves - Greater Blasting" => 9999,
	"Enchant Chest - Exceptional Resilience" => 9999,
	# Engineering
	"Rough Blasting Powder" => 1,
	"Crafted Light Shot" => 1,
	"Rough Dynamite" => 1,
	"Handful of Copper Bolts" => 30,
	"Rough Copper Bomb" => 30,
	"Arclight Spanner" => 50,
	"Rough Boomstick" => 50,
	"Copper Tube" => 50,
	"Crude Scope" => 60,
	"Copper Modulator" => 65,
	"Coarse Blasting Powder" => 75,
	"Crafted Heavy Shot" => 75,
	"Coarse Dynamite" => 75,
	"Mechanical Squirrel" => 75,
	"Target Dummy" => 85,
	"Silver Contact" => 90,
	"EZ-Thro Dynamite" => 100,
	"Practice Lock" => 100,
	"Flying Tiger Goggles" => 100,
	"Small Seaforium Charge" => 100,
	"Bronze Tube" => 105,
	"Large Copper Bomb" => 105,
	"Deadly Blunderbuss" => 105,
	"Standard Scope" => 110,
	"Small Bronze Bomb" => 120,
	"Lovingly Crafted Boomstick" => 120,
	"Shadow Goggles" => 120,
	"Crafted Solid Shot" => 125,
	"Heavy Blasting Powder" => 125,
	"Heavy Dynamite" => 125,
	"Small Blue Rocket" => 125,
	"Small Green Rocket" => 125,
	"Small Red Rocket" => 125,
	"Flame Deflector" => 125,
	"Whirring Bronze Gizmo" => 125,
	"Gnomish Universal Remote" => 125,
	"Silver-plated Shotgun" => 130,
	"Goblin Rocket Boots" => 130,
	"Ornate Spyglass" => 135,
	"Big Bronze Bomb" => 140,
	"Minor Recombobulator" => 140,
	"Bronze Framework" => 145,
	"Moonsight Rifle" => 145,
	"Aquadynamic Fish Attractor" => 150,
	"Blue Firework" => 150,
	"Green Firework" => 150,
	"Red Firework" => 150,
	"Gold Power Core" => 150,
	"Green Tinted Goggles" => 150,
	"Explosive Sheep" => 150,
	"Ice Deflector" => 155,
	"Iron Strut" => 160,
	"Discombobulator Ray" => 160,
	"Goblin Jumper Cables" => 165,
	"Portable Bronze Mortar" => 165,
	"Gyrochronatom" => 170,
	"Solid Blasting Powder" => 175,
	"Solid Dynamite" => 175,
	"Large Blue Rocket" => 175,
	"Large Green Rocket" => 175,
	"Large Red Rocket" => 175,
	"Compact Harvest Reaper Kit" => 175,
	"Gyromatic Micro-Adjustor" => 175,
	"Iron Grenade" => 175,
	"Bright-Eye Goggles" => 175,
	"Accurate Scope" => 180,
	"Advanced Target Dummy" => 185,
	"Flash Bomb" => 185,
	"Craftsman's Monocle" => 185,
	"Big Iron Bomb" => 190,
	"Snowmaster 9000"  => 190,
	"Mithril Tube" => 195,
	"Goblin Land Mine" => 195,
	"EZ-Thro Dynamite II" => 200,
	"Large Seaforium Charge" => 200,
	"Mechanical Repair Kit" => 200,
	"Unstable Trigger" => 200,
	"Gnomish Cloaking Device" => 200,
	"Mechanical Dragonling" => 200,
	"Goblin Rocket Fuel Recipe" => 205,
	"Inlaid Mithril Cylinder Plans" => 205,
	"Lil' Smoky" => 205,
	"Pet Bombling" => 205,
	"The Mortar: Reloaded" => 205,
	"Goblin Sapper Charge" => 205,
	"Fire Goggles" => 205,
	"Goblin Construction Helmet" => 205,
	"Goblin Mining Helmet" => 205,
	"Mithril Blunderbuss" => 205,
	"Gnomish Shrink Ray" => 205,
	"Goblin Mortar" => 205,
	"Hi-Impact Mithril Slugs" => 210,
	"Gnomish Goggles" => 210,
	"Deadly Scope" => 210,
	"Gnomish Net-o-Matic Projector" => 210,
	"Mithril Casing" => 215,
	"Mithril Frag Bomb" => 215,
	"Gnomish Harm Prevention Belt" => 215,
	"Catseye Ultra Goggles" => 220,
	"Mithril Heavy-bore Rifle" => 220,
	"Blue Rocket Cluster" => 225,
	"Green Rocket Cluster" => 225,
	"Red Rocket Cluster" => 225,
	"Gnomish Rocket Boots" => 225,
	"Parachute Cloak" => 225,
	"Spellpower Goggles Xtreme" => 225,
	"Firework Launcher" => 225,
	"Goblin Bomb Dispenser" => 230,
	"Deepdive Helmet" => 230,
	"Rose Colored Goggles" => 230,
	"Gnomish Battle Chicken" => 230,
	"Hi-Explosive Bomb" => 235,
	"The Big One" => 235,
	"Gnomish Mind Control Cap" => 235,
	"Gnomish Death Ray" => 240,
	"Goblin Dragon Gun" => 240,
	"Sniper Scope" => 240,
	"Mithril Gyro-Shot" => 245,
	"Green Lens" => 245,
	"Goblin Rocket Helmet" => 245,
	"Dense Blasting Powder" => 250,
	"Dense Dynamite" => 250,
	"Snake Burst Firework" => 250,
	"Mithril Mechanical Dragonling" => 250,
	"Salt Shaker" => 250,
	"Tranquil Mechanical Yeti" => 250,
	"World Enlarger" => 260,
	"Truesilver Transformer" => 260,
	"Gyrofreeze Ice Reflector" => 260,
	"Thorium Rifle" => 260,
	"Thorium Grenade" => 260,
	"Thorium Widget" => 260,
	"Dimensional Ripper - Everlook" => 260,
	"Ultrasafe Transporter - Gadgetzan" => 260,
	"Alarm-O-Bot" => 265,
	"Goblin Jumper Cables XL" => 265,
	"Lifelike Mechanical Toad" => 265,
	"Spellpower Goggles Xtreme Plus" => 270,
	"Fused Wiring" => 275,
	"Large Blue Rocket Cluster" => 275,
	"Large Green Rocket Cluster" => 275,
	"Large Red Rocket Cluster" => 275,
	"Powerful Seaforium Charge" => 275,
	"Major Recombobulator" => 275,
	"Dark Iron Rifle" => 275,
	"Firework Cluster Launcher" => 275,
	"Masterwork Target Dummy" => 275,
	"Thorium Tube" => 275,
	"Thorium Shells" => 285,
	"Dark Iron Bomb" => 285,
	"Delicate Arcanite Converter" => 285,
	"Hyper-Radiant Flame Reflector" => 290,
	"Master Engineer's Goggles" => 290,
	"Voice Amplification Modulator" => 290,
	"Handful of Fel Iron Bolts" => 300,
	"Elemental Blasting Powder" => 300,
	"Fel Iron Casing" => 300,
	"Core Marksman Rifle" => 300,
	"Force Reactive Disk" => 300,
	"Arcanite Dragonling" => 300,
	"Bloodvine Goggles" => 300,
	"Bloodvine Lens" => 300,
	"Flawless Arcanite Rifle" => 300,
	"Ultra-Flash Shadow Reflector" => 300,
	"Arcane Bomb" => 300,
	"Fel Iron Bomb" => 300,
	#"Field Repair Bot  => 300,
	"Zapthrottle Mote Extractor" => 305,
	"Fel Iron Shells" => 310,
	"Fel Iron Musket" => 320,
	"Adamantite Frame" => 325,
	"Fel Iron Toolbox" => 325,
	"The Bigger One" => 325,
	"Crashin' Thrashin' Robot" => 325,
	"Adamantite Grenade" => 325,
	"Gnomish Flame Turret" => 325,
	"Healing Potion Injector" => 330,
	"Icy Blasting Primers" => 335,
	"Adamantite Arrow Maker" => 335,
	"Adamantite Shell Machine" => 335,
	"Green Smoke Flare" => 335,
	"Purple Smoke Flare" => 335,
	"White Smoke Flare" => 335,
	"Adamantite Scope" => 335,
	"Frost Grenades" => 335,
	"Super Sapper Charge" => 340,
	"Cogspinner Goggles" => 340,
	"Power Amplification Goggles" => 340,
	"Felsteel Stabilizer" => 340,
	"Hardened Adamantite Tube" => 340,
	"Khorium Power Core" => 340,
	"Gnomish Poultryizer" => 340,
	"Mana Potion Injector" => 345,
	"Elemental Seaforium Charge" => 350,
	"Dimensional Ripper - Area 52"  => 350,
	"Ultrasafe Transporter - Toshley's Station" => 350,
	"Goblin Rocket Launcher" => 350,
	"Nigh-Invulnerability Belt" => 350,
	"Ultra-Spectropic Detection Goggles" => 350,
	"Adamantite Rifle" => 350,
	"Handful of Cobalt Bolts" => 350,
	"Volatile Blasting Trigger" => 350,
	"Deathblow X11" => 350,
	"Destruction Holo-gogs" => 350,
	"Furious Gizmatic Goggles" => 350,
	"Gadgetstorm Goggles" => 350,
	#"Justicebringer  => 350,
	"Living Replicator Specs" => 350,
	"Magnified Moon Specs" => 350,
	"Powerheal 9000"  => 350,
	#"Surestrike Goggles v" => 350,
	#"Tankatronic Goggles" => 350,
	#"Wonderheal XT " => 350,
	"Flying Machine" => 350,
	"Cobalt Frag Bomb" => 350,
	"Rocket Boots Xtreme" => 355,
	"Rocket Boots Xtreme Lite" => 355,
	"Felsteel Boomstick" => 360,
	"Hyper-Vision Goggles" => 360,
	"Khorium Scope" => 360,
	#"Field Repair Bot  => 360,
	"Foreman's Enchanted Helmet" => 375,
	"Foreman's Reinforced Helmet" => 375,
	"Gnomish Battle Goggles" => 375,
	"Gnomish Power Goggles" => 375,
	"Gyro-balanced Khorium Destroyer" => 375,
	"Bladed Pickaxe" => 375,
	"Hammer Pick" => 375,
	"Overcharged Capacitor" => 375,
	"Turbo-Charged Flying Machine" => 375,
	"Explosive Decoy" => 375,
	"Ornate Khorium Rifle" => 375,
	"Stabilized Eternium Scope" => 375,
	"Annihilator Holo-Gogs" => 375,
	"Hard Khorium Goggles" => 375,
	"Hyper-Magnified Moon Specs" => 375,
	#"Justicebringer  => 375,
	"Lightning Etched Specs" => 375,
	"Mayhem Projection Goggles" => 375,
	#"Powerheal"  => 375,
	"Primal-Attuned Goggles" => 375,
	#"Quad Deathblow X" => 375,
	#"Surestrike Goggles v" => 375,
	"Belt-Clipped Spynoculars" => 380,
	"Flexweave Underlay" => 380,
	"Personal Electromagnetic Pulse Generator" => 390,
	"Froststeel Tube" => 390,
	"Diamond-cut Refractor Scope" => 390,
	"Hand-Mounted Pyro Rocket" => 400,
	"Hyperspeed Accelerators" => 400,
	"Mark \"S\" Boomstick" => 400,
	"Nitro Boosts" => 405,
	"Saronite Bomb" => 405,
	"Ultrasafe Bullet Machine" => 410,
	"Healing Injector Kit" => 410,
	"Saronite Arrow Maker" => 415,
	"Mana Injector Kit" => 415,
	"Mechanized Snow Goggles" => 420,
	"Noise Machine" => 420,
	"Sonic Booster" => 420,
	"Global Thermal Sapper Charge" => 425,
	"Sun Scope" => 425,
	"MOLL-E" => 425,
	"Gnomish Lightning Generator" => 425,
	"Gnomish X-Ray Specs" => 425,
	"Heartseeker Scope" => 430,
	"Gnomish Army Knife" => 435,
	"Armored Titanium Goggles" => 440,
	"Charged Titanium Specs" => 440,
	"Electroflux Sight Enhancers" => 440,
	"Greensight Gogs" => 440,
	"Truesight Ice Blinders" => 440,
	"Visage Liquification Goggles" => 440,
	"Weakness Spectralizers" => 440,
	"Armor Plated Combat Shotgun" => 450,
	"Nesingwary 4000" => 450,
	"Mechano-hog" => 450,
	"Mekgineer's Chopper" => 450,
	#"Wormhole: Gadgetzan" => 9999
	#"Gnomish Tonk Controller" => 9999,
	#"Goblin Tonk Controller" => 9999,
	#"Critter Enlarger" => 9999,
	#"Red Smoke Flare" => 9999,
	#"Khorium Toolbox" => 9999,
	#"Scrapbot Construction Kit" => 9999,
	# First Aid
	"Linen Bandage" => 1,
	"Heavy Linen Bandage" => 40,
	"Anti-Venom" => 80,
	"Wool Bandage" => 80,
	"Heavy Wool Bandage" => 115,
	"Strong Anti-Venom" => 130,
	"Silk Bandage" => 150,
	"Heavy Silk Bandage" => 180,
	"Mageweave Bandage" => 210,
	"Heavy Mageweave Bandage" => 240,
	"Runecloth Bandage" => 260,
	"Heavy Runecloth Bandage" => 290,
	"Powerful Anti-Venom" => 300,
	"Netherweave Bandage" => 330,
	"Frostweave Bandage" => 350,
	"Heavy Netherweave Bandage" => 360,
	"Heavy Frostweave Bandage" => 400,
	# Inscription
	"Scroll of Agility" => 15,
	"Scroll of Strength" => 15,
	"Armor Vellum" => 35,
	"Moonglow Ink" => 35,
	"Scroll of Recall" => 35,
	"Midnight Ink" => 75,
	"Minor Inscription Research" => 75,
	"Scroll of Intellect II" => 75,
	"Scroll of Spirit II" => 75,
	"Scroll of Stamina II" => 75,
	"Weapon Vellum" => 75,
	"Glyph of Backstab" => 80,
	"Glyph of Frost Nova" => 80,
	"Glyph of Hunter's Mark" => 80,
	"Glyph of Power Word: Shield" => 80,
	"Glyph of Rejuvenation" => 80,
	"Glyph of Spiritual Attunement" => 80,
	"Scroll of Strength II" => 80,
	"Glyph of Corruption" => 85,
	"Glyph of Flame Shock" => 85,
	"Glyph of Rapid Charge" => 85,
	"Glyph of Wrath" => 85,
	"Hunter's Ink" => 85,
	"Mysterious Tarot" => 85,
	"Mystic Tome" => 85,
	"Scroll of Agility II" => 85,
	"Glyph of Hammer of Justice" => 90,
	"Glyph of Ice Armor" => 90,
	"Glyph of Maul" => 90,
	"Glyph of Serpent Sting" => 90,
	"Glyph of Evasion" => 95,
	"Glyph of Healthstone" => 95,
	"Glyph of Heroic Strike" => 95,
	"Glyph of Lightning Shield" => 95,
	"Glyph of Psychic Scream" => 95,
	"Glyph of Arcane Explosion" => 100,
	"Glyph of Arcane Shot" => 100,
	"Glyph of Entangling Roots" => 100,
	"Lion's Ink" => 100,
	"Glyph of Eviscerate" => 105,
	"Glyph of Fade" => 105,
	"Glyph of Holy Light" => 105,
	"Glyph of Fire Nova Totem" => 110,
	"Glyph of Health Funnel" => 110,
	"Glyph of Rending" => 110,
	"Glyph of Arcane Missiles" => 115,
	"Glyph of Aspect of the Monkey" => 115,
	"Glyph of Healing Touch" => 115,
	"Glyph of Expose Armor" => 120,
	"Glyph of Flash Heal" => 120,
	"Glyph of Judgement" => 120,
	"Book of Survival" => 125,
	"Dawnstar Ink" => 125,
	"Glyph of Fear" => 125,
	"Glyph of Flametongue Weapon" => 125,
	"Glyph of Hamstring" => 125,
	"Strange Tarot" => 125,
	"Tome of the Dawn" => 125,
	"Glyph of Blink" => 130,
	"Glyph of Immolation Trap" => 130,
	"Glyph of Moonfire" => 130,
	"Glyph of Divinity" => 135,
	"Glyph of Garrote" => 135,
	"Glyph of Inner Fire" => 135,
	"Glyph of Imp" => 140,
	"Glyph of Lightning Bolt" => 140,
	"Glyph of Sunder Armor" => 140,
	"Glyph of Insect Swarm" => 150,
	"Glyph of Multi-Shot" => 150,
	"Jadefire Ink" => 150,
	"Glyph of Evocation" => 155,
	"Glyph of Righteous Defense" => 155,
	"Scroll of Stamina III" => 155,
	"Glyph of Gouge" => 160,
	"Glyph of Renew" => 160,
	"Scroll of Spirit III" => 160,
	"Glyph of Lava Lash" => 165,
	"Glyph of Shadow Bolt" => 165,
	"Scroll of Intellect III" => 165,
	"Glyph of Overpower" => 170,
	"Glyph of Rebirth" => 170,
	"Scroll of Strength III" => 170,
	"Arcane Tarot" => 175,
	"Glyph of Aimed Shot" => 175,
	"Glyph of Icy Veins" => 175,
	"Royal Guide of Escape Routes" => 175,
	"Royal Ink" => 175,
	"Scroll of Agility III" => 175,
	"Tome of Kings" => 175,
	"Glyph of Cleansing" => 180,
	"Glyph of Shadow Word: Pain" => 180,
	"Glyph of Frost Shock" => 185,
	"Glyph of Sap" => 185,
	"Glyph of Revenge" => 190,
	"Glyph of Voidwalker" => 190,
	"Armor Vellum II" => 200,
	"Celestial Ink" => 200,
	"Certificate of Ownership" => 200,
	"Glyph of Deterrence" => 200,
	"Glyph of Rip" => 200,
	"Scroll of Recall II" => 200,
	"Glyph of Consecration" => 205,
	"Glyph of Improved Scorch" => 205,
	"Scroll of Stamina IV" => 205,
	"Glyph of Sinister Strike" => 210,
	"Glyph of Smite" => 210,
	"Scroll of Spirit IV" => 210,
	"Glyph of Healing Stream Totem" => 215,
	"Glyph of Searing Pain" => 215,
	"Scroll of Intellect IV" => 215,
	"Glyph of Barbaric Insults" => 220,
	"Glyph of Starfire" => 220,
	"Scroll of Strength IV" => 220,
	"Book of Stars" => 225,
	"Fiery Ink" => 225,
	"Fire Eater's Guide" => 225,
	"Glyph of Disengage" => 225,
	"Glyph of Ice Block" => 225,
	"Scroll of Agility IV" => 225,
	"Shadowy Tarot" => 225,
	"Glyph of Crusader Strike" => 230,
	"Glyph of Dispel Magic" => 230,
	"Glyph of Lesser Healing Wave" => 235,
	"Glyph of Slice and Dice" => 235,
	"Weapon Vellum II" => 235,
	"Glyph of Cleaving" => 240,
	"Glyph of Soulstone" => 240,
	"Scroll of Stamina V" => 250,
	"Shimmering Ink" => 250,
	"Scroll of Spirit V" => 255,
	"Glyph of Freezing Trap" => 260,
	"Glyph of Shred" => 260,
	"Scroll of Intellect V" => 260,
	"Glyph of Bone Shield" => 265,
	"Glyph of Exorcism" => 265,
	"Scroll of Strength V" => 265,
	"Glyph of Fear Ward" => 270,
	"Glyph of Frost Strike" => 270,
	"Scroll of Agility V" => 270,
	"Darkmoon Card" => 275,
	"Glyph of Shadowburn" => 275,
	"Glyph of Water Mastery" => 275,
	"Ink of the Sky" => 275,
	"Manual of Clouds" => 275,
	"Stormbound Tome" => 275,
	"Glyph of Icy Touch" => 280,
	"Glyph of Mana Gem" => 280,
	"Glyph of Death Grip" => 285,
	"Glyph of Execution" => 285,
	"Glyph of Sprint" => 285,
	"Ethereal Ink" => 290,
	"Scroll of Stamina VI" => 290,
	"Scroll of Spirit VI" => 295,
	"Glyph of Earthliving Weapon" => 300,
	"Glyph of Flash of Light" => 300,
	"Glyph of Plague Strike" => 300,
	"Scroll of Intellect VI" => 300,
	"Glyph of Feint" => 305,
	"Glyph of Unbreakable Armor" => 305,
	"Scroll of Strength VI" => 305,
	"Glyph of Rake" => 310,
	"Glyph of Rune Tap" => 310,
	"Scroll of Agility VI" => 310,
	"Glyph of Holy Nova" => 315,
	"Glyph of Rapid Fire" => 315,
	"Glyph of Blood Strike" => 320,
	"Glyph of Sweeping Strikes" => 320,
	"Book of Clever Tricks" => 325,
	"Darkflame Ink" => 325,
	"Glyph of Mage Armor" => 325,
	"Glyph of Succubus" => 325,
	"Greater Darkmoon Card" => 325,
	"Hellfire Tome" => 325,
	"Glyph of Scourge Strike" => 330,
	"Glyph of Windfury Weapon" => 330,
	"Glyph of Arcane Power" => 335,
	"Glyph of Seal of Command" => 335,
	"Glyph of Ambush" => 340,
	"Glyph of Death Strike" => 340,
	"Glyph of Vampiric Blood" => 345,
	"Glyph of Whirlwind" => 345,
	"Armor Vellum III" => 350,
	"Glyph of Banish" => 350,
	"Glyph of Frenzied Regeneration" => 350,
	"Glyph of Frost Trap" => 350,
	"Glyph of Mind Flay" => 350,
	"Glyph of the Ghoul" => 350,
	"Ink of the Sea" => 350,
	"Scroll of Recall III" => 350,
	"Scroll of Stamina VII" => 350,
	"Scroll of Spirit VII" => 355,
	"Scroll of Intellect VII" => 360,
	"Scroll of Strength VII" => 365,
	"Scroll of Agility VII" => 370,
	"Glyph of Ice Lance" => 375,
	"Glyph of Improved Aspect of the Hawk" => 375,
	"Glyph of Scourge Imprisonment" => 375,
	"Glyph of Stormstrike" => 375,
	"Glyph of Strangulate" => 375,
	"Glyph of Turn Evil" => 375,
	"Snowfall Ink" => 375,
	"Northrend Inscription Research" => 385,
	"Darkmoon Card of the North" => 400,
	"Faces of Doom" => 400,
	"Glyph of Polymorph" => 400,
	"Iron-bound Tome" => 400,
	"Master's Inscription of the Axe" => 400,
	"Master's Inscription of the Crag" => 400,
	"Master's Inscription of the Pinnacle" => 400,
	"Master's Inscription of the Storm" => 400,
	"Scroll of Stamina VIII" => 400,
	"Weapon Vellum III" => 400,
	"Scroll of Spirit VIII" => 405,
	"Scroll of Intellect VIII" => 410,
	"Scroll of Strength VIII" => 415,
	# Jewelcrafting
	"Delicate Copper Wire" => 1,
	"Rough Stone Statue" => 1,
	"Braided Copper Ring" => 1,
	"Woven Copper Ring" => 1,
	"Heavy Copper Ring" => 5,
	"Malachite Pendant" => 20,
	"Tigerseye Band" => 20,
	"Inlaid Malachite Ring" => 30,
	"Ornate Tigerseye Necklace" => 30,
	"Bronze Setting" => 50,
	"Coarse Stone Statue" => 50,
	"Elegant Silver Ring" => 50,
	"Solid Bronze Ring" => 50,
	"Thick Bronze Necklace" => 50,
	"Simple Pearl Ring" => 60,
	"Bronze Band of Force" => 65,
	"Gloom Band" => 70,
	"Brilliant Necklace" => 75,
	"Bronze Torc" => 80,
	"Ring of Silver Might" => 80,
	"Heavy Silver Ring" => 90,
	"Ring of Twilight Shadows" => 100,
	"Heavy Jade Ring" => 105,
	"Heavy Stone Statue" => 110,
	"Amulet of the Moon" => 110,
	"Barbaric Iron Collar" => 110,
	"Moonsoul Crown" => 120,
	"Pendant of the Agate Shield" => 120,
	"Heavy Iron Knuckles" => 125,
	"Wicked Moonstone Ring" => 125,
	"Golden Dragon Ring" => 135,
	"Mithril Filigree" => 150,
	"Blazing Citrine Ring" => 150,
	"Heavy Golden Necklace of Battle" => 150,
	"Jade Pendant of Blasting" => 160,
	"Engraved Truesilver Ring" => 170,
	"The Jade Eye" => 170,
	"Solid Stone Statue" => 175,
	"Golden Ring of Power" => 180,
	"Citrine Ring of Rapid Healing" => 180,
	"Citrine Pendant of Golden Healing" => 190,
	"Truesilver Commander's Ring" => 200,
	"Figurine - Golden Hare" => 200,
	"Figurine - Jade Owl" => 200,
	"Aquamarine Signet" => 210,
	"Figurine - Black Pearl Panther" => 215,
	"Aquamarine Pendant of the Warrior" => 220,
	"Dense Stone Statue" => 225,
	"Thorium Setting" => 225,
	"Ruby Crown of Restoration" => 225,
	"Figurine - Truesilver Crab" => 225,
	"Red Ring of Destruction" => 230,
	"Figurine - Truesilver Boar" => 235,
	"Ruby Pendant of Fire" => 235,
	"Truesilver Healing Ring" => 240,
	"The Aquamarine Ward" => 245,
	"Gem Studded Band" => 250,
	"Opal Necklace of Impact" => 250,
	"Figurine - Ruby Serpent" => 260,
	"Simple Opal Ring" => 260,
	"Diamond Focus Ring" => 265,
	"Emerald Crown of Destruction" => 275,
	"Sapphire Signet" => 275,
	"Glowing Thorium Band" => 280,
	"Onslaught Ring" => 280,
	"Sapphire Pendant of Winter Night" => 280,
	"Figurine - Emerald Owl" => 285,
	"Ring of Bitter Shadows" => 285,
	"Living Emerald Pendant" => 290,
	"Emerald Lion Ring" => 290,
	"Brilliant Golden Draenite" => 300,
	"Glowing Shadow Draenite" => 300,
	"Inscribed Flame Spessarite" => 300,
	"Radiant Deep Peridot" => 300,
	"Solid Azure Moonstone" => 300,
	"Teardrop Blood Garnet" => 300,
	"Figurine - Black Diamond Crab" => 300,
	"Figurine - Dark Iron Scorpid" => 300,
	"Bold Blood Garnet" => 305,
	"Bright Blood Garnet" => 305,
	"Gleaming Golden Draenite" => 305,
	"Jagged Deep Peridot" => 305,
	"Luminous Flame Spessarite" => 305,
	"Royal Shadow Draenite" => 305,
	"Sparkling Azure Moonstone" => 305,
	"Necklace of the Diamond Tower" => 305,
	"Band of Natural Fire" => 310,
	"Fel Iron Blood Ring" => 310,
	"Golden Draenite Ring" => 310,
	"Enduring Deep Peridot" => 315,
	"Glinting Flame Spessarite" => 315,
	"Runed Blood Garnet" => 315,
	"Shifting Shadow Draenite" => 315,
	"Stormy Azure Moonstone" => 315,
	"Thick Golden Draenite" => 315,
	"Azure Moonstone Ring" => 320,
	"Purified Jaggal Pearl" => 325,
	"Mercurial Adamantite" => 325,
	"Balanced Shadow Draenite" => 325,
	"Dazzling Deep Peridot" => 325,
	"Delicate Blood Garnet" => 325,
	"Great Golden Draenite" => 325,
	"Infused Shadow Draenite" => 325,
	"Lustrous Azure Moonstone" => 325,
	"Potent Flame Spessarite" => 325,
	"Rigid Golden Draenite" => 325,
	"Smooth Golden Draenite" => 325,
	"Sovereign Shadow Draenite" => 325,
	"Veiled Flame Spessarite" => 325,
	"Wicked Flame Spessarite" => 325,
	"Brilliant Pearl Band" => 325,
	"The Black Pearl" => 330,
	"Heavy Adamantite Ring" => 335,
	"Thick Adamantite Necklace" => 335,
	"Necklace of the Deep" => 340,
	"Heavy Felsteel Ring" => 345,
	"Balanced Nightseye" => 350,
	"Bold Living Ruby" => 350,
	"Bright Living Ruby" => 350,
	"Brilliant Dawnstone" => 350,
	"Brilliant Glass" => 350,
	"Dazzling Talasite" => 350,
	"Delicate Living Ruby" => 350,
	"Enduring Talasite" => 350,
	"Flashing Living Ruby" => 350,
	"Forceful Talasite" => 350,
	"Gleaming Dawnstone" => 350,
	"Glinting Noble Topaz" => 350,
	"Glowing Nightseye" => 350,
	"Great Dawnstone" => 350,
	"Infused Nightseye" => 350,
	"Inscribed Noble Topaz" => 350,
	"Jagged Talasite" => 350,
	"Luminous Noble Topaz" => 350,
	"Lustrous Star of Elune" => 350,
	"Mystic Dawnstone" => 350,
	"Potent Noble Topaz" => 350,
	"Purified Shadow Pearl" => 350,
	"Quick Dawnstone" => 350,
	"Radiant Talasite" => 350,
	"Reckless Noble Topaz" => 350,
	"Regal Nightseye" => 350,
	"Rigid Dawnstone" => 350,
	"Royal Nightseye" => 350,
	"Runed Living Ruby" => 350,
	"Shifting Nightseye" => 350,
	"Smooth Dawnstone" => 350,
	"Solid Star of Elune" => 350,
	"Sovereign Nightseye" => 350,
	"Sparkling Star of Elune" => 350,
	"Steady Talasite" => 350,
	"Stormy Star of Elune" => 350,
	"Subtle Living Ruby" => 350,
	"Teardrop Living Ruby" => 350,
	"Thick Dawnstone" => 350,
	"Veiled Noble Topaz" => 350,
	"Wicked Noble Topaz" => 350,
	"Khorium Band of Shadows" => 350,
	"Dark Jade Focusing Lens" => 350,
	"Accurate Huge Citrine" => 350,
	"Balanced Shadow Crystal" => 350,
	"Bold Bloodstone" => 350,
	"Bright Bloodstone" => 350,
	"Brilliant Sun Crystal" => 350,
	"Champion's Huge Citrine" => 350,
	"Dazzling Dark Jade" => 350,
	"Deadly Huge Citrine" => 350,
	"Defender's Shadow Crystal" => 350,
	"Deft Huge Citrine" => 350,
	"Delicate Bloodstone" => 350,
	"Durable Huge Citrine" => 350,
	"Empowered Huge Citrine" => 350,
	"Enduring Dark Jade" => 350,
	"Energized Dark Jade" => 350,
	"Etched Huge Citrine" => 350,
	"Fierce Huge Citrine" => 350,
	"Flashing Bloodstone" => 350,
	"Forceful Dark Jade" => 350,
	"Fractured Bloodstone" => 350,
	"Glinting Huge Citrine" => 350,
	"Glowing Shadow Crystal" => 350,
	"Guardian's Shadow Crystal" => 350,
	"Infused Shadow Crystal" => 350,
	"Inscribed Huge Citrine" => 350,
	"Intricate Dark Jade" => 350,
	"Jagged Dark Jade" => 350,
	"Lambent Dark Jade" => 350,
	"Lucent Huge Citrine" => 350,
	"Luminous Huge Citrine" => 350,
	"Lustrous Chalcedony" => 350,
	"Misty Dark Jade" => 350,
	"Mysterious Shadow Crystal" => 350,
	"Mystic Sun Crystal" => 350,
	"Opaque Dark Jade" => 350,
	"Potent Huge Citrine" => 350,
	"Precise Bloodstone" => 350,
	"Pristine Huge Citrine" => 350,
	"Puissant Shadow Crystal" => 350,
	"Purified Shadow Crystal" => 350,
	"Quick Sun Crystal" => 350,
	"Radiant Dark Jade" => 350,
	"Reckless Huge Citrine" => 350,
	"Resolute Huge Citrine" => 350,
	"Resplendent Huge Citrine" => 350,
	"Rigid Sun Crystal" => 350,
	"Royal Shadow Crystal" => 350,
	"Runed Bloodstone" => 350,
	"Seer's Dark Jade" => 350,
	"Shattered Dark Jade" => 350,
	"Shifting Shadow Crystal" => 350,
	"Shining Dark Jade" => 350,
	"Smooth Sun Crystal" => 350,
	"Solid Chalcedony" => 350,
	"Sovereign Shadow Crystal" => 350,
	"Sparkling Chalcedony" => 350,
	"Stalwart Huge Citrine" => 350,
	"Stark Huge Citrine" => 350,
	"Steady Dark Jade" => 350,
	"Stormy Chalcedony" => 350,
	"Sundered Dark Jade" => 350,
	"Tense Dark Jade" => 350,
	"Tenuous Shadow Crystal" => 350,
	"Thick Sun Crystal" => 350,
	"Timeless Dark Jade" => 350,
	"Turbid Dark Jade" => 350,
	"Veiled Huge Citrine" => 350,
	"Vivid Dark Jade" => 350,
	"Wicked Huge Citrine" => 350,
	"Bloodstone Band" => 350,
	"Crystal Chalcedony Amulet" => 350,
	"Crystal Citrine Necklace" => 350,
	"Sun Rock Ring" => 350,
	"Khorium Band of Frost" => 355,
	"Khorium Inferno Band" => 355,
	"Delicate Eternium Ring" => 355,
	"Living Ruby Pendant" => 355,
	"Thick Felsteel Necklace" => 355,
	"Blood of Amber" => 360,
	"Crimson Sun" => 360,
	"Don Julio's Heart" => 360,
	"Facet of Eternity" => 360,
	"Falling Star" => 360,
	"Kailee's Rose" => 360,
	"Stone of Blades" => 360,
	"Eye of the Night" => 360,
	"Khorium Band of Leaves" => 360,
	"Pendant of Frozen Flame" => 360,
	"Pendant of Shadow's End" => 360,
	"Pendant of Thawing" => 360,
	"Pendant of the Null Rune" => 360,
	"Pendant of Withering" => 360,
	"Ring of Arcane Shielding" => 360,
	"Braided Eternium Chain" => 360,
	"Shadow Crystal Focusing Lens" => 360,
	"Glimmering Huge Citrine" => 360,
	"Regal Shadow Crystal" => 360,
	"Subtle Bloodstone" => 360,
	"Enchanted Pearl" => 360,
	"Arcane Khorium Band" => 365,
	"Blazing Eternium Band" => 365,
	"Bracing Earthstorm Diamond" => 365,
	"Brutal Earthstorm Diamond" => 365,
	"Chaotic Skyfire Diamond" => 365,
	"Destructive Skyfire Diamond" => 365,
	"Enigmatic Skyfire Diamond" => 365,
	"Insightful Earthstorm Diamond" => 365,
	"Mystical Skyfire Diamond" => 365,
	"Powerful Earthstorm Diamond" => 365,
	"Relentless Earthstorm Diamond" => 365,
	"Swift Skyfire Diamond" => 365,
	"Tenacious Earthstorm Diamond" => 365,
	"Thundering Skyfire Diamond" => 365,
	"Amulet of Flowing Life" => 365,
	"Hard Khorium Band" => 365,
	"Hard Khorium Choker" => 365,
	"Loop of Forged Power" => 365,
	"Pendant of Sunfire" => 365,
	"Ring of Flowing Life" => 365,
	"Chain of the Twilight Owl" => 365,
	"Crown of the Sea Witch" => 365,
	"Embrace of the Dawn" => 365,
	"Ember Skyfire Diamond" => 370,
	"Eternal Earthstorm Diamond" => 370,
	"Circlet of Arcane Might" => 370,
	"Coronet of Verdant Flame" => 370,
	"Figurine - Dawnstone Crab" => 370,
	"Figurine - Felsteel Boar" => 370,
	"Figurine - Living Ruby Serpent" => 370,
	"Figurine - Nightseye Panther" => 370,
	"Figurine - Talasite Owl" => 370,
	"Shadow Jade Focusing Lens" => 370,
	"Earthshadow Ring" => 370,
	"Jade Ring of Slaying" => 370,
	"Bold Dragon's Eye" => 370,
	"Bright Dragon's Eye" => 370,
	"Brilliant Dragon's Eye" => 370,
	"Delicate Dragon's Eye" => 370,
	"Flashing Dragon's Eye" => 370,
	"Fractured Dragon's Eye" => 370,
	"Lustrous Dragon's Eye" => 370,
	"Mystic Dragon's Eye" => 370,
	"Precise Dragon's Eye" => 370,
	"Quick Dragon's Eye" => 370,
	"Rigid Dragon's Eye" => 370,
	"Runed Dragon's Eye" => 370,
	"Smooth Dragon's Eye" => 370,
	"Solid Dragon's Eye" => 370,
	"Sparkling Dragon's Eye" => 370,
	"Stormy Dragon's Eye" => 370,
	"Subtle Dragon's Eye" => 370,
	"Thick Dragon's Eye" => 370,
	"Balanced Shadowsong Amethyst" => 375,
	"Bold Crimson Spinel" => 375,
	"Bright Crimson Spinel" => 375,
	"Brilliant Lionseye" => 375,
	"Dazzling Seaspray Emerald" => 375,
	"Delicate Crimson Spinel" => 375,
	"Enduring Seaspray Emerald" => 375,
	"Figurine - Crimson Serpent" => 375,
	"Figurine - Empyrean Tortoise" => 375,
	"Figurine - Khorium Boar" => 375,
	"Figurine - Seaspray Albatross" => 375,
	"Figurine - Shadowsong Panther" => 375,
	"Flashing Crimson Spinel" => 375,
	"Forceful Seaspray Emerald" => 375,
	"Gleaming Lionseye" => 375,
	"Glinting Pyrestone" => 375,
	"Glowing Shadowsong Amethyst" => 375,
	"Great Lionseye" => 375,
	"Infused Shadowsong Amethyst" => 375,
	"Inscribed Pyrestone" => 375,
	"Jagged Seaspray Emerald" => 375,
	"Luminous Pyrestone" => 375,
	"Lustrous Empyrean Sapphire" => 375,
	"Mystic Lionseye" => 375,
	"Potent Pyrestone" => 375,
	"Purified Shadowsong Amethyst" => 375,
	"Quick Lionseye" => 375,
	"Radiant Seaspray Emerald" => 375,
	"Reckless Pyrestone" => 375,
	"Rigid Lionseye" => 375,
	"Royal Shadowsong Amethyst" => 375,
	"Runed Crimson Spinel" => 375,
	"Shifting Shadowsong Amethyst" => 375,
	"Smooth Lionseye" => 375,
	"Solid Empyrean Sapphire" => 375,
	"Sovereign Shadowsong Amethyst" => 375,
	"Sparkling Empyrean Sapphire" => 375,
	"Steady Seaspray Emerald" => 375,
	"Stormy Empyrean Sapphire" => 375,
	"Subtle Crimson Spinel" => 375,
	"Teardrop Crimson Spinel" => 375,
	"The Frozen Eye" => 375,
	"The Natural Ward" => 375,
	"Thick Lionseye" => 375,
	"Veiled Pyrestone" => 375,
	"Wicked Pyrestone" => 375,
	"Blood Sun Necklace" => 380,
	"Jade Dagger Pendant" => 380,
	"Shadowmight Ring" => 390,
	"Stoneguard Band" => 390,
	"Accurate Monarch Topaz" => 390,
	"Balanced Twilight Opal" => 390,
	"Bold Scarlet Ruby" => 390,
	"Bright Scarlet Ruby" => 390,
	"Brilliant Autumn's Glow" => 390,
	"Dazzling Forest Emerald" => 390,
	"Deadly Monarch Topaz" => 390,
	"Defender's Twilight Opal" => 390,
	"Deft Monarch Topaz" => 390,
	"Delicate Scarlet Ruby" => 390,
	"Durable Monarch Topaz" => 390,
	"Empowered Monarch Topaz" => 390,
	"Enchanted Tear" => 390,
	"Enduring Forest Emerald" => 390,
	"Energized Forest Emerald" => 390,
	"Fierce Monarch Topaz" => 390,
	"Flashing Scarlet Ruby" => 390,
	"Forceful Forest Emerald" => 390,
	"Fractured Scarlet Ruby" => 390,
	"Glimmering Monarch Topaz" => 390,
	"Glinting Monarch Topaz" => 390,
	"Glowing Twilight Opal" => 390,
	"Guardian's Twilight Opal" => 390,
	"Infused Twilight Opal" => 390,
	"Inscribed Monarch Topaz" => 390,
	"Intricate Forest Emerald" => 390,
	"Jagged Forest Emerald" => 390,
	"Lambent Forest Emerald" => 390,
	"Lucent Monarch Topaz" => 390,
	"Luminous Monarch Topaz" => 390,
	"Lustrous Sky Sapphire" => 390,
	"Mysterious Twilight Opal" => 390,
	"Mystic Autumn's Glow" => 390,
	"Opaque Forest Emerald" => 390,
	"Potent Monarch Topaz" => 390,
	"Precise Scarlet Ruby" => 390,
	"Pristine Monarch Topaz" => 390,
	"Puissant Twilight Opal" => 390,
	"Quick Autumn's Glow" => 390,
	"Radiant Forest Emerald" => 390,
	"Reckless Monarch Topaz" => 390,
	"Regal Twilight Opal" => 390,
	"Resplendent Monarch Topaz" => 390,
	"Rigid Autumn's Glow" => 390,
	"Royal Twilight Opal" => 390,
	"Runed Scarlet Ruby" => 390,
	"Seer's Forest Emerald" => 390,
	"Shattered Forest Emerald" => 390,
	"Smooth Autumn's Glow" => 390,
	"Solid Sky Sapphire" => 390,
	"Sparkling Sky Sapphire" => 390,
	"Stalwart Monarch Topaz" => 390,
	"Stark Monarch Topaz" => 390,
	"Steady Forest Emerald" => 390,
	"Stormy Sky Sapphire" => 390,
	"Sundered Forest Emerald" => 390,
	"Tense Forest Emerald" => 390,
	"Thick Autumn's Glow" => 390,
	"Timeless Forest Emerald" => 390,
	"Turbid Forest Emerald" => 390,
	"Veiled Monarch Topaz" => 390,
	"Vivid Forest Emerald" => 390,
	"Wicked Monarch Topaz" => 390,
	"Emerald Boar" => 400,
	"Monarch Crab" => 400,
	"Ruby Hare" => 400,
	"Sapphire Owl" => 400,
	"Twilight Serpent" => 400,
	"Titanium Frostguard Ring" => 420,
	"Austere Earthsiege Diamond" => 420,
	"Bracing Earthsiege Diamond" => 420,
	"Chaotic Skyflare Diamond" => 420,
	"Destructive Skyflare Diamond" => 420,
	"Dream Signet" => 420,
	"Effulgent Skyflare Diamond" => 420,
	"Ember Skyflare Diamond" => 420,
	"Enigmatic Skyflare Diamond" => 420,
	"Eternal Earthsiege Diamond" => 420,
	"Forlorn Skyflare Diamond" => 420,
	"Impassive Skyflare Diamond" => 420,
	"Insightful Earthsiege Diamond" => 420,
	"Invigorating Earthsiege Diamond" => 420,
	"Persistent Earthsiege Diamond" => 420,
	"Powerful Earthsiege Diamond" => 420,
	"Relentless Earthsiege Diamond" => 420,
	"Revitalizing Skyflare Diamond" => 420,
	"Ring of Earthen Might" => 420,
	"Ring of Northern Tears" => 420,
	"Ring of Scarlet Shadows" => 420,
	"Savage Titanium Band" => 420,
	"Savage Titanium Ring" => 420,
	"Swift Skyflare Diamond" => 420,
	"Tireless Skyflare Diamond" => 420,
	"Trenchant Earthsiege Diamond" => 420,
	"Windfire Band" => 420,
	"Titanium Earthguard Ring" => 430,
	"Titanium Impact Band" => 430,
	"Titanium Spellshock Ring" => 430,
	"Titanium Earthguard Chain" => 440,
	"Titanium Impact Choker" => 440,
	"Titanium Spellshock Necklace" => 440,
	#"Arcanite Sword Pendant" => 9999,
	#"Blood Crown" => 9999,
	#"Champion's Monarch Topaz" => 9999,
	#"Etched Monarch Topaz" => 9999,
	#"Misty Forest Emerald" => 9999,
	#"Purified Twilight Opal" => 9999,
	#"Resolute Monarch Topaz" => 9999,
	#"Shifting Twilight Opal" => 9999,
	#"Shining Forest Emerald" => 9999,
	#"Sovereign Twilight Opal" => 9999,
	#"Subtle Scarlet Ruby" => 9999,
	#"Tenuous Twilight Opal" => 9999,
	#"Beaming Earthsiege Diamond" => 9999,
	#"Thundering Skyflare Diamond" => 9999,
	# Smelting
	"Smelt Copper" => 1,
	"Smelt Tin" => 65,
	"Smelt Bronze" => 65,
	"Smelt Silver" => 75,
	"Smelt Iron" => 125,
	"Smelt Gold" => 155,
	"Smelt Steel" => 165,
	"Smelt Mithril" => 175,
	"Smelt Truesilver" => 230,
	"Smelt Dark Iron" => 230,
	"Smelt Thorium" => 250,
	"Earth Shatter" => 300,
	"Fire Sunder" => 300,
	"Smelt Fel Iron" => 300,
	"Smelt Elementium" => 300,
	"Smelt Adamantite" => 325,
	"Smelt Eternium" => 350,
	"Smelt Felsteel" => 350,
	"Smelt Cobalt" => 350,
	"Smelt Hardened Khorium" => 375,
	"Smelt Khorium" => 375,
	"Smelt Hardened Adamantite" => 375,
	"Smelt Saronite" => 400,
	"Smelt Titanium" => 450,
	"Smelt Titansteel" => 450,
	# Tailoring
	"Bolt of Linen Cloth" => 1,
	"Brown Linen Shirt" => 1,
	"Linen Cloak" => 1,
	"Simple Linen Pants" => 1,
	"White Linen Shirt" => 1,
	"Brown Linen Vest" => 10,
	"Linen Belt" => 15,
	"Simple Linen Boots" => 20,
	"Brown Linen Robe" => 30,
	"White Linen Robe" => 30,
	"Brown Linen Pants" => 30,
	"Heavy Linen Gloves" => 35,
	"Red Linen Robe" => 40,
	"Blue Linen Shirt" => 40,
	"Red Linen Shirt" => 40,
	"Simple Dress" => 40,
	"Linen Bag" => 45,
	"Blue Linen Vest" => 55,
	"Red Linen Vest" => 55,
	"Green Linen Bracers" => 60,
	"Reinforced Linen Cape" => 60,
	"Linen Boots" => 65,
	"Barbaric Linen Vest" => 70,
	"Blue Linen Robe" => 70,
	"Handstitched Linen Britches" => 70,
	"Green Linen Shirt" => 70,
	"Red Linen Bag" => 70,
	"Bolt of Woolen Cloth" => 75,
	"Simple Kilt" => 75,
	"Woolen Cape" => 75,
	"Soft-soled Linen Boots" => 80,
	"Woolen Bag" => 80,
	"Heavy Woolen Gloves" => 85,
	"Green Woolen Vest" => 85,
	"Pearl-clasped Cloak" => 90,
	"Red Woolen Boots" => 95,
	"Woolen Boots" => 95,
	"Green Woolen Bag" => 95,
	"Gray Woolen Shirt" => 100,
	"Blue Overalls" => 100,
	"Heavy Woolen Cloak" => 100,
	"Gray Woolen Robe" => 105,
	"Heavy Woolen Pants" => 110,
	"Double-stitched Woolen Shoulders" => 110,
	"Stylish Red Shirt" => 110,
	"White Woolen Dress" => 110,
	"Greater Adept's Robe" => 115,
	"Red Woolen Bag" => 115,
	"Colorful Kilt" => 120,
	"Reinforced Woolen Shoulders" => 120,
	"Stylish Blue Shirt" => 120,
	"Stylish Green Shirt" => 120,
	"Bolt of Silk Cloth" => 125,
	"Spidersilk Boots" => 125,
	"Phoenix Gloves" => 125,
	"Phoenix Pants" => 125,
	"Gloves of Meditation" => 130,
	"Bright Yellow Shirt" => 135,
	"Lesser Wizard's Robe" => 135,
	"Azure Silk Pants" => 140,
	"Spider Silk Slippers" => 140,
	"Azure Silk Hood" => 145,
	"Azure Silk Gloves" => 145,
	"Hands of Darkness" => 145,
	"Azure Silk Vest" => 150,
	"Robes of Arcana" => 150,
	"Truefaith Gloves" => 150,
	"Small Silk Pack" => 150,
	"Dark Silk Shirt" => 155,
	"Silk Headband" => 160,
	"White Swashbuckler's Shirt" => 160,
	"Enchanter's Cowl" => 165,
	"Green Silk Armor" => 165,
	"Formal White Shirt" => 170,
	"Earthen Vest" => 170,
	"Shadow Hood" => 170,
	"Bolt of Mageweave" => 175,
	"Red Swashbuckler's Shirt" => 175,
	"Azure Silk Belt" => 175,
	"Azure Silk Cloak" => 175,
	"Boots of the Enchanter" => 175,
	"Crimson Silk Belt" => 175,
	"Green Silk Pack" => 175,
	"Crimson Silk Cloak" => 180,
	"Green Silken Shoulders" => 180,
	"Spider Belt" => 180,
	"Rich Purple Silk Shirt" => 185,
	"Crimson Silk Vest" => 185,
	"Long Silken Cloak" => 185,
	"Black Silk Pack" => 185,
	"Green Holiday Shirt" => 190,
	"Robe of Power" => 190,
	"Azure Shoulders" => 190,
	"Crimson Silk Shoulders" => 190,
	"Crimson Silk Pantaloons" => 195,
	"Earthen Silk Belt" => 195,
	"Black Swashbuckler's Shirt" => 200,
	"Icy Cloak" => 200,
	"Star Belt" => 200,
	"Black Mageweave Leggings" => 205,
	"Black Mageweave Vest" => 205,
	"Crimson Silk Robe" => 205,
	"Black Mageweave Robe" => 210,
	"Crimson Silk Gloves" => 210,
	"Shadoweave Pants" => 210,
	"White Bandit Mask" => 215,
	"Orange Mageweave Shirt" => 215,
	"Black Mageweave Gloves" => 215,
	"Red Mageweave Pants" => 215,
	"Red Mageweave Vest" => 215,
	"Shadoweave Robe" => 215,
	"Orange Martial Shirt" => 220,
	"Dreamweave Gloves" => 225,
	"Dreamweave Vest" => 225,
	"Cindercloth Robe" => 225,
	"Enchanted Mageweave Pouch" => 225,
	"Red Mageweave Gloves" => 225,
	"Shadoweave Gloves" => 225,
	"Mageweave Bag" => 225,
	"Lavender Mageweave Shirt" => 230,
	"Black Mageweave Boots" => 230,
	"Black Mageweave Headband" => 230,
	"Black Mageweave Shoulders" => 230,
	"Pink Mageweave Shirt" => 235,
	"Simple Black Dress" => 235,
	"Red Mageweave Shoulders" => 235,
	"Shadoweave Shoulders" => 235,
	"Red Mageweave Bag" => 235,
	"Tuxedo Shirt" => 240,
	"Admiral's Hat" => 240,
	"Red Mageweave Headband" => 240,
	"Shadoweave Boots" => 240,
	"Haliscan Pantaloons" => 245,
	"Tuxedo Pants" => 245,
	"Cindercloth Boots" => 245,
	"Shadoweave Mask" => 245,
	"Green Winter Clothes" => 250,
	"Red Winter Clothes" => 250,
	"Bolt of Runecloth" => 250,
	"White Wedding Dress" => 250,
	"Dress Shoes" => 250,
	"Dreamweave Circlet" => 250,
	"Festival Dress" => 250,
	"Festive Red Pant Suit" => 250,
	"Haliscan Jacket" => 250,
	"Tuxedo Jacket" => 250,
	"Mooncloth" => 250,
	"Frostweave Robe" => 255,
	"Frostweave Tunic" => 255,
	"Runecloth Belt" => 255,
	"Cindercloth Vest" => 260,
	"Runecloth Robe" => 260,
	"Runecloth Tunic" => 260,
	"Soul Pouch" => 260,
	"Runecloth Bag" => 260,
	"Frostweave Gloves" => 265,
	"Ghostweave Belt" => 265,
	"Runecloth Cloak" => 265,
	"Brightcloth Gloves" => 270,
	"Brightcloth Robe" => 270,
	"Cindercloth Gloves" => 270,
	"Ghostweave Gloves" => 270,
	"Gordok Ogre Suit" => 275,
	"Cloak of Fire" => 275,
	"Brightcloth Cloak" => 275,
	"Cenarion Herb Bag" => 275,
	"Cindercloth Cloak" => 275,
	"Enchanted Runecloth Bag" => 275,
	"Felcloth Pants" => 275,
	"Ghostweave Vest" => 275,
	"Runecloth Gloves" => 275,
	"Wizardweave Leggings" => 275,
	"Cindercloth Pants" => 280,
	"Frostweave Pants" => 280,
	"Runecloth Boots" => 280,
	"Felcloth Bag" => 280,
	"Robe of Winter Night" => 285,
	"Felcloth Boots" => 285,
	"Runecloth Pants" => 285,
	"Mooncloth Boots" => 290,
	"Argent Boots" => 290,
	"Mooncloth Leggings" => 290,
	"Wisdom of the Timbermaw" => 290,
	"Brightcloth Pants" => 290,
	"Felcloth Hood" => 290,
	"Ghostweave Pants" => 290,
	"Runecloth Headband" => 295,
	"Netherweave Net" => 300,
	"Bolt of Netherweave" => 300,
	"Belt of the Archmage" => 300,
	"Core Felcloth Bag" => 300,
	"Flarecore Gloves" => 300,
	"Flarecore Leggings" => 300,
	"Flarecore Mantle" => 300,
	"Flarecore Robe" => 300,
	"Glacial Cloak" => 300,
	"Glacial Gloves" => 300,
	"Glacial Vest" => 300,
	"Glacial Wrists" => 300,
	"Gloves of Spell Mastery" => 300,
	"Robe of the Archmage" => 300,
	"Robe of the Void" => 300,
	"Truefaith Vestments" => 300,
	"Argent Shoulders" => 300,
	"Bloodvine Boots" => 300,
	"Bloodvine Leggings" => 300,
	"Bloodvine Vest" => 300,
	"Bottomless Bag" => 300,
	"Cloak of Warding" => 300,
	"Felcloth Gloves" => 300,
	"Gaea's Embrace" => 300,
	"Inferno Gloves" => 300,
	"Mantle of the Timbermaw" => 300,
	"Mooncloth Circlet" => 300,
	"Mooncloth Gloves" => 300,
	"Mooncloth Robe" => 300,
	"Mooncloth Shoulders" => 300,
	"Mooncloth Vest" => 300,
	"Runed Stygian Belt" => 300,
	"Runed Stygian Boots" => 300,
	"Runed Stygian Leggings" => 300,
	"Sylvan Crown" => 300,
	"Sylvan Shoulders" => 300,
	"Sylvan Vest" => 300,
	"Big Bag of Enchantment" => 300,
	"Felcloth Robe" => 300,
	"Felcloth Shoulders" => 300,
	"Mooncloth Bag" => 300,
	"Runecloth Shoulders" => 300,
	"Satchel of Cenarius" => 300,
	"Wizardweave Robe" => 300,
	"Wizardweave Turban" => 300,
	"Flarecore Wraps" => 300,
	"Netherweave Belt" => 310,
	"Netherweave Bracers" => 310,
	"Netherweave Bag" => 315,
	"Netherweave Gloves" => 320,
	"Bolt of Imbued Netherweave" => 325,
	"Netherweave Pants" => 325,
	"Mystic Spellthread" => 335,
	"Silver Spellthread" => 335,
	"Netherweave Boots" => 335,
	"Imbued Netherweave Bag" => 340,
	"Imbued Netherweave Pants" => 340,
	"Bag of Jewels" => 340,
	"Netherweave Robe" => 340,
	"Bolt of Soulcloth" => 345,
	"Netherweave Tunic" => 345,
	"Primal Mooncloth" => 350,
	"Shadowcloth" => 350,
	"Spellcloth" => 350,
	"Arcanoweave Bracers" => 350,
	"Blackstrike Bracers" => 350,
	"Bracers of Havok" => 350,
	"Cloak of Arcane Evasion" => 350,
	"Cloak of Eternity" => 350,
	"Cloak of the Black Void" => 350,
	"Flameheart Bracers" => 350,
	"Imbued Netherweave Boots" => 350,
	"Unyielding Bracers" => 350,
	"White Remedy Cape" => 350,
	"Frostwoven Shoulders" => 350,
	"Frostwoven Wristwraps" => 350,
	"Bolt of Frostweave" => 350,
	"Frozen Shadoweave Shoulders" => 355,
	"Primal Mooncloth Belt" => 355,
	"Soulcloth Gloves" => 355,
	"Spellfire Belt" => 355,
	"Arcanoweave Boots" => 360,
	"Flameheart Gloves" => 360,
	"Imbued Netherweave Robe" => 360,
	"Imbued Netherweave Tunic" => 360,
	"Frostweave Net" => 360,
	"Frostwoven Gloves" => 360,
	"Frostwoven Robe" => 360,
	"Black Belt of Knowledge" => 365,
	"Frozen Shadoweave Boots" => 365,
	"Girdle of Ruination" => 365,
	"Manaweave Cloak" => 365,
	"Primal Mooncloth Shoulders" => 365,
	"Resolute Cape" => 365,
	"Soulcloth Shoulders" => 365,
	"Spellfire Gloves" => 365,
	"Unyielding Girdle" => 365,
	"Vengeance Wrap" => 365,
	"Hands of Eternal Light" => 365,
	"Robe of Eternal Light" => 365,
	"Sunfire Handwraps" => 365,
	"Sunfire Robe" => 365,
	"Arcanoweave Robe" => 370,
	"Flameheart Vest" => 370,
	"Frostwoven Belt" => 370,
	"Soulcloth Vest" => 375,
	"Battlecast Hood" => 375,
	"Battlecast Pants" => 375,
	"Belt of Blasting" => 375,
	"Belt of the Long Road" => 375,
	"Boots of Blasting" => 375,
	"Boots of the Long Road" => 375,
	"Bracers of Nimble Thought" => 375,
	"Frozen Shadoweave Robe" => 375,
	"Golden Spellthread" => 375,
	"Mantle of Nimble Thought" => 375,
	"Night's End" => 375,
	"Primal Mooncloth Robe" => 375,
	"Runic Spellthread" => 375,
	"Soulguard Bracers" => 375,
	"Soulguard Girdle" => 375,
	"Soulguard Leggings" => 375,
	"Soulguard Slippers" => 375,
	"Spellfire Robe" => 375,
	"Spellstrike Hood" => 375,
	"Spellstrike Pants" => 375,
	"Swiftheal Mantle" => 375,
	"Swiftheal Wraps" => 375,
	"Whitemend Hood" => 375,
	"Whitemend Pants" => 375,
	"Ebon Shadowbag" => 375,
	"Mycah's Botanical Bag" => 375,
	"Primal Mooncloth Bag" => 375,
	"Spellfire Bag" => 375,
	"Frostwoven Boots" => 375,
	"Frostwoven Cowl" => 380,
	"Frostwoven Leggings" => 380,
	"Mystic Frostwoven Shoulders" => 385,
	"Mystic Frostwoven Wristwraps" => 385,
	"Cloak of the Moon" => 390,
	"Mystic Frostwoven Robe" => 390,
	"Cloak of Frozen Spirits" => 395,
	"Duskweave Belt" => 395,
	"Duskweave Cowl" => 395,
	"Duskweave Leggings" => 395,
	"Bolt of Imbued Frostweave" => 400,
	"Azure Spellthread" => 400,
	"Shining Spellthread" => 400,
	"Blue Lumberjack Shirt" => 400,
	"Blue Workman's Shirt" => 400,
	"Green Lumberjack Shirt" => 400,
	"Green Workman's Shirt" => 400,
	"Red Lumberjack Shirt" => 400,
	"Red Workman's Shirt" => 400,
	"Rustic Workman's Shirt" => 400,
	"Yellow Lumberjack Shirt" => 400,
	"Duskweave Wristwraps" => 400,
	"Master's Spellthread" => 405,
	"Sanctified Spellthread" => 405,
	"Duskweave Gloves" => 405,
	"Duskweave Robe" => 405,
	"Duskweave Boots" => 410,
	"Flying Carpet" => 410,
	"Duskweave Shoulders" => 410,
	"Frostweave Bag" => 410,
	"Black Duskweave Leggings" => 415,
	"Black Duskweave Wristwraps" => 415,
	"Ebonweave" => 415,
	"Moonshroud" => 415,
	"Spellweave" => 415,
	"Frostsavage Belt" => 415,
	"Frostsavage Bracers" => 415,
	"Darkglow Embroidery" => 420,
	"Lightweave Embroidery" => 420,
	"Swordguard Embroidery" => 420,
	"Black Duskweave Robe" => 420,
	"Glacial Slippers" => 420,
	"Glacial Waistband" => 420,
	"Aurora Slippers" => 420,
	"Deep Frozen Cord" => 420,
	"Frostsavage Boots" => 420,
	"Frostsavage Cowl" => 420,
	"Frostsavage Gloves" => 420,
	"Frostsavage Leggings" => 420,
	"Frostsavage Robe" => 420,
	"Frostsavage Shoulders" => 420,
	"Light Blessed Mittens" => 420,
	"Silky Iceshard Boots" => 420,
	"Frostmoon Pants" => 425,
	"Hat of Wintry Doom" => 425,
	"Glacial Robe" => 425,
	"Magnificent Flying Carpet" => 425,
	"Brilliant Spellthread" => 430,
	"Sapphire Spellthread" => 430,
	"Abyssal Bag" => 435,
	"Ebonweave Gloves" => 435,
	"Moonshroud Gloves" => 435,
	"Spellweave Gloves" => 435,
	"Mysterious Bag" => 440,
	"Ebonweave Robe" => 440,
	"Moonshroud Robe" => 440,
	"Spellweave Robe" => 440,
	"Glacial Bag" => 445,
	#"Netherflame Belt" => 9999,
	#"Netherflame Boots" => 9999,
	#"Netherflame Robe" => 9999,
	#"Duskweave Boots" => 9999,
	#"Deathchill Cloak" => 9999,
	#"Wispcloak" => 9999,
}

recipes = WoWDBRecipes.new
maps = WoWDBMaps.new

$dungeons = maps.get_dungeon_maps
$raids = maps.get_raid_maps

def get_alchemy_list(recipes, maps)

	alchemy = recipes.get_alchemy_list
alchspeciallist = {
	21923 => {:id => 7, :type => 1},
	47050 => {:id => "meleedps"},
	11452 => {:id => "Quest", :type => [2203,2501]},
}
alchacquire = {
	2329 => {:id => "StartingSkill"},
	2330 => {:id => "StartingSkill"},
	2333 => {:id => "StartingSkill"},
	11456 => {:id => "CustomNeutral", :type => 9},
	25079 => {:id => "CustomNeutral", :type => 22},
	25074 => {:id => "CustomNeutral", :type => 22},
	25078 => {:id => "CustomNeutral", :type => 22},
	25073 => {:id => "CustomNeutral", :type => 22},
	28580 => {:id => "BCAlchemyTransmute"},
	28581 => {:id => "BCAlchemyTransmute"},
	28582 => {:id => "BCAlchemyTransmute"},
	28583 => {:id => "BCAlchemyTransmute"},
	28584 => {:id => "BCAlchemyTransmute"},
	28585 => {:id => "BCAlchemyTransmute"},
	28586 => {:id => "BCAlchemyPotion"},
	28587 => {:id => "BCAlchemyElixir"},
	28588 => {:id => "BCAlchemyElixir"},
	28589 => {:id => "BCAlchemyElixir"},
	28590 => {:id => "BCAlchemyElixir"},
	28591 => {:id => "BCAlchemyElixir"},
	41458 => {:id => "BCAlchemyCauldron"},
	41500 => {:id => "BCAlchemyCauldron"},
	41501 => {:id => "BCAlchemyCauldron"},
	41502 => {:id => "BCAlchemyCauldron"},
	41503 => {:id => "BCAlchemyCauldron"},
	53771 => {:id => "NorthrendAlchemyTransmute"},
	53773 => {:id => "NorthrendAlchemyTransmute"},
	53774 => {:id => "NorthrendAlchemyTransmute"},
	53775 => {:id => "NorthrendAlchemyTransmute"},
	53776 => {:id => "NorthrendAlchemyTransmute"},
	53777 => {:id => "NorthrendAlchemyTransmute"},
	53779 => {:id => "NorthrendAlchemyTransmute"},
	53780 => {:id => "NorthrendAlchemyTransmute"},
	53781 => {:id => "NorthrendAlchemyTransmute"},
	53782 => {:id => "NorthrendAlchemyTransmute"},
	53783 => {:id => "NorthrendAlchemyTransmute"},
	53784 => {:id => "NorthrendAlchemyTransmute"},
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
	53895 => {:id => "NorthrendAlchemyResearch"},
	53898 => {:id => "GrandMasterAlchTrainer"},
	53899 => {:id => "GrandMasterAlchTrainer"},
	53900 => {:id => "GrandMasterAlchTrainer"},
	53901 => {:id => "GrandMasterAlchTrainer"},
	53902 => {:id => "GrandMasterAlchTrainer"},
	53903 => {:id => "GrandMasterAlchTrainer"},
	53904 => {:id => "NorthrendAlchemyResearch"},
	53905 => {:id => "GrandMasterAlchTrainer"},
	54020 => {:id => "GrandMasterAlchTrainer"},
	54213 => {:id => "GrandMasterAlchTrainer"},
	54218 => {:id => "GrandMasterAlchTrainer"},
	54220 => {:id => "NorthrendAlchemyResearch"},
	54221 => {:id => "NorthrendAlchemyResearch"},
	54222 => {:id => "NorthrendAlchemyResearch"},
	56519 => {:id => "NorthrendAlchemyResearch"},
	57425 => {:id => "GrandMasterAlchTrainer"},
	57427 => {:id => "GrandMasterAlchTrainer"},
	58868 => {:id => "GrandMasterAlchTrainer"},
	58871 => {:id => "GrandMasterAlchTrainer"},
	60350 => {:id => "GrandMasterAlchTrainer"},
	60354 => {:id => "NorthrendAlchemyResearch"},
	60355 => {:id => "NorthrendAlchemyResearch"},
	60356 => {:id => "NorthrendAlchemyResearch"},
	60357 => {:id => "NorthrendAlchemyResearch"},
	60365 => {:id => "NorthrendAlchemyResearch"},
	60366 => {:id => "NorthrendAlchemyResearch"},
	60367 => {:id => "GrandMasterAlchTrainer"},
	60396 => {:id => "GrandMasterAlchTrainer"},
	60403 => {:id => "GrandMasterAlchTrainer"},
	60405 => {:id => "GrandMasterAlchTrainer"},
	60893 => {:id => "GrandMasterAlchTrainer"},
}
alchmanual=<<EOF
EOF
	# Add the restoration potion quests
	$quests[2203] = {:name => "Badlands Reagent Run II", :faction => 2}
	$quests[2501] = {:name => "Badlands Reagent Run II", :faction => 1}

	create_profession_db("./RecipeDB/ARL-Alchemy.lua","Alchemy",recipes,maps,"InitAlchemy",alchemy,[2336,6619,11447,17579,22430,54020],alchspeciallist,alchmanual,alchacquire)

end

def get_bs_list(recipes, maps)

	blacksmithing = recipes.get_blacksmithing_list
	bsspeciallist = {
		21913 => {:id => 7, :type => 1},
		2660 => {:id => "StartingSkill"},
		2663 => {:id => "StartingSkill"},
		2671 => {:id => "StartingSkill"},
		3115 => {:id => "StartingSkill"},
	}
	bsacquire = {
		2660 => {:id => "StartingSkill"},
		2663 => {:id => "StartingSkill"},
		3115 => {:id => "StartingSkill"},
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
	# Add the Orcish War Leggings quest
	$quests[2756] = {:name => "The Old Ways", :faction => 2}

	create_profession_db("./RecipeDB/ARL-Blacksmith.lua","Blacksmithing",recipes,maps,"InitBlacksmithing",blacksmithing,[2671,8366,8368,9942,9957,16960,16965,16967,16980,16986,16987],bsspeciallist,bsmanual,bsacquire)

end

def get_cooking_list(recipes, maps)

	cooking = recipes.get_cooking_list
	cookingspeciallist = {
		21143 => {:id => 7, :type => 1},
		21144 => {:id => 7, :type => 1},
		45022 => {:id => 7, :type => 1},
		24801 => {:id => "Quest", :type => [8313]},
	}
	cookacquire = {
		2538 => {:id => "StartingSkill"},
		2540 => {:id => "StartingSkill"},
		8604 => {:id => "StartingSkill"},
		43772 => {:id => "Daily", :type => [5]},
		43765 => {:id => "Daily", :type => [5]},
		43761 => {:id => "Daily", :type => [6]},
		43707 => {:id => "Daily", :type => [6]},
		43758 => {:id => "Daily", :type => [5,6]},
		43779 => {:id => "Daily", :type => [5,6]},
		45695 => {:id => "Daily", :type => [7]},
		9513 => {:id => "ThistleTea"},
		13028 => {:id => "CustomNeutral", :type => 13},
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
		53056 => {:id => "GrandMasterCookTrainer"},
		57421 => {:id => "GrandMasterCookTrainer"},
		57423 => {:id => "GrandMasterCookTrainer"},
		58065 => {:id => "GrandMasterCookTrainer"},
	}
cookmanual=<<EOF
EOF
	$quests[8313] = {:name => "Sharing the Knowledge", :faction => 0}

	create_profession_db("./RecipeDB/ARL-Cook.lua","Cooking",recipes,maps,"InitCooking",cooking,[57423,44438,45547,53056],cookingspeciallist,cookmanual,cookacquire)

end

def get_enchanting_list(recipes, maps)

	enchanting = recipes.get_enchanting_list
	enchantingspeciallist = {
		21931 => {:id => 7, :type => 1},
		46578 => {:id => 7, :type => 4},
	}
	enchantacquire = {
		7418 => {:id => "StartingSkill"},
		7421 => {:id => "StartingSkill"},
		7428 => {:id => "StartingSkill"},
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
	create_profession_db("./RecipeDB/ARL-Enchant.lua","Enchanting",recipes,maps,"InitEnchanting",enchanting,[22434,28021],enchantingspeciallist,enchantmanual,enchantacquire)

end

def get_engineering_list(recipes, maps)

	eng = recipes.get_engineering_list
engspecailflag = {
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
	26011 => {:id => "Quest", :type => [5163]},
}
engspecailacquire = {
	3918 => {:id => "StartingSkill"},
	3919 => {:id => "StartingSkill"},
	3920 => {:id => "StartingSkill"},
	23486 => {:id => "GnomeTransport"},
	23489 => {:id => "GoblinTransport"},
	36954 => {:id => "GoblinTransport"},
	36955 => {:id => "GnomeTransport"},
	53281 => {:id => "GrandMasterEngTrainer"},
	54353 => {:id => "GrandMasterEngTrainer"},
	54736 => {:id => "GrandMasterEngTrainer"},
	54793 => {:id => "GrandMasterEngTrainer"},
	54998 => {:id => "GrandMasterEngTrainer"},
	54999 => {:id => "GrandMasterEngTrainer"},
	55002 => {:id => "GrandMasterEngTrainer"},
	55016 => {:id => "GrandMasterEngTrainer"},
	55252 => {:id => "GrandMasterEngTrainer"},
	56349 => {:id => "GrandMasterEngTrainer"},
	56459 => {:id => "GrandMasterEngTrainer"},
	56460 => {:id => "GrandMasterEngTrainer"},
	56461 => {:id => "GrandMasterEngTrainer"},
	56462 => {:id => "GrandMasterEngTrainer"},
	56463 => {:id => "GrandMasterEngTrainer"},
	56464 => {:id => "GrandMasterEngTrainer"},
	56466 => {:id => "GrandMasterEngTrainer"},
	56467 => {:id => "GrandMasterEngTrainer"},
	56468 => {:id => "GrandMasterEngTrainer"},
	56469 => {:id => "GrandMasterEngTrainer"},
	56470 => {:id => "GrandMasterEngTrainer"},
	56471 => {:id => "GrandMasterEngTrainer"},
	56472 => {:id => "GrandMasterEngTrainer"},
	56473 => {:id => "GrandMasterEngTrainer"},
	56474 => {:id => "GrandMasterEngTrainer"},
	56475 => {:id => "GrandMasterEngTrainer"},
	56476 => {:id => "GrandMasterEngTrainer"},
	56477 => {:id => "GrandMasterEngTrainer"},
	56478 => {:id => "GrandMasterEngTrainer"},
	56479 => {:id => "GrandMasterEngTrainer"},
	56480 => {:id => "GrandMasterEngTrainer"},
	56481 => {:id => "GrandMasterEngTrainer"},
	56483 => {:id => "GrandMasterEngTrainer"},
	56484 => {:id => "GrandMasterEngTrainer"},
	56486 => {:id => "GrandMasterEngTrainer"},
	56487 => {:id => "GrandMasterEngTrainer"},
	56514 => {:id => "GrandMasterEngTrainer"},
	56574 => {:id => "GrandMasterEngTrainer"},
	60874 => {:id => "GrandMasterEngTrainer"},
	61471 => {:id => "GrandMasterEngTrainer"},
	44155 => {:id => "EngFlightTrainer"},
	44157 => {:id => "EngFlightTrainer"},
	41311 => {:id => "GrandMasterEngTrainer"},
	41312 => {:id => "GrandMasterEngTrainer"},
	41314 => {:id => "GrandMasterEngTrainer"},
	41315 => {:id => "GrandMasterEngTrainer"},
	41316 => {:id => "GrandMasterEngTrainer"},
	41317 => {:id => "GrandMasterEngTrainer"},
	41318 => {:id => "GrandMasterEngTrainer"},
	41319 => {:id => "GrandMasterEngTrainer"},
	41320 => {:id => "GrandMasterEngTrainer"},
	41321 => {:id => "GrandMasterEngTrainer"},
	15628 => {:id => "EngineeringRenewalReward"},
	15633 => {:id => "EngineeringRenewalReward"},
	22704 => {:id => "FieldRepairBot"},
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

	$quests[5163] = {:name => "Are We There, Yeti?", :faction => 0}

	create_profession_db("./RecipeDB/ARL-Engineer.lua","Engineering",recipes,maps,"InitEngineering",eng,[61483,30573,30343,30342,30349,30561,30549,12722,12720,12900,12719,12904],engspecailflag,engmanual,engspecailacquire)

end

def get_firstaid_list(recipes, maps)

	firstaid = recipes.get_firstaid_list
	faspecaillist = {
		10841 => {:id => "Quest", :type => [6622,6624]},
	}
	faacquire = {
		3275 => {:id => "StartingSkill"},
		18629 => {:id => "FATrainer"},
		18630 => {:id => "FATrainer"},
		45545 => {:id => "GrandMasterFATrainer"},
	}
famanual=<<EOF
EOF

	$quests[6622] = {:name => "Triage", :faction => 2}
	$quests[6624] = {:name => "Triage", :faction => 1}

	create_profession_db("./RecipeDB/ARL-FirstAid.lua","First Aid",recipes,maps,"InitFirstAid",firstaid,[30021],faspecaillist,famanual,faacquire)

end

def get_inscription_list(recipes, maps)

	inscription = recipes.get_inscription_list
	insspecaillist = {
	}
	insacquire = {
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
		57193 => {:id => "NorthrendInscriptionResearch"},
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
		58313 => {:id => "InscTrainer"},
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
		57228 => {:id => "NorthrendInscriptionResearch"},
	}
inscriptionmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Inscription.lua","Inscription",recipes,maps,"InitInscription",inscription,[],insspecaillist,inscriptionmanual,insacquire)

end

def get_jc_list(recipes, maps)

	jewelcrafting = recipes.get_jewelcrafting_list
	jcspecaillist = {
		31101 => {:id => "PVP"},
		43493 => {:id => "PVP"},
	}
	jcacquire = {
		56987 => {:id => "GrandMasterJCTrainer"},
		53831 => {:id => "GrandMasterJCTrainer"},
		53832 => {:id => "GrandMasterJCTrainer"},
		53834 => {:id => "GrandMasterJCTrainer"},
		53835 => {:id => "GrandMasterJCTrainer"},
		53843 => {:id => "GrandMasterJCTrainer"},
		53844 => {:id => "GrandMasterJCTrainer"},
		53845 => {:id => "GrandMasterJCTrainer"},
		53852 => {:id => "GrandMasterJCTrainer"},
		53853 => {:id => "GrandMasterJCTrainer"},
		53854 => {:id => "GrandMasterJCTrainer"},
		53855 => {:id => "GrandMasterJCTrainer"},
		53856 => {:id => "GrandMasterJCTrainer"},
		53859 => {:id => "GrandMasterJCTrainer"},
		53860 => {:id => "GrandMasterJCTrainer"},
		53861 => {:id => "GrandMasterJCTrainer"},
		53862 => {:id => "GrandMasterJCTrainer"},
		53863 => {:id => "GrandMasterJCTrainer"},
		53864 => {:id => "GrandMasterJCTrainer"},
		53866 => {:id => "GrandMasterJCTrainer"},
		53867 => {:id => "GrandMasterJCTrainer"},
		53868 => {:id => "GrandMasterJCTrainer"},
		53870 => {:id => "GrandMasterJCTrainer"},
		53871 => {:id => "GrandMasterJCTrainer"},
		53872 => {:id => "GrandMasterJCTrainer"},
		53873 => {:id => "GrandMasterJCTrainer"},
		53874 => {:id => "GrandMasterJCTrainer"},
		53876 => {:id => "GrandMasterJCTrainer"},
		53878 => {:id => "GrandMasterJCTrainer"},
		53880 => {:id => "GrandMasterJCTrainer"},
		53881 => {:id => "GrandMasterJCTrainer"},
		53882 => {:id => "GrandMasterJCTrainer"},
		53883 => {:id => "GrandMasterJCTrainer"},
		53886 => {:id => "GrandMasterJCTrainer"},
		53887 => {:id => "GrandMasterJCTrainer"},
		53889 => {:id => "GrandMasterJCTrainer"},
		53890 => {:id => "GrandMasterJCTrainer"},
		53891 => {:id => "GrandMasterJCTrainer"},
		53892 => {:id => "GrandMasterJCTrainer"},
		53893 => {:id => "GrandMasterJCTrainer"},
		53894 => {:id => "GrandMasterJCTrainer"},
		53916 => {:id => "GrandMasterJCTrainer"},
		53918 => {:id => "GrandMasterJCTrainer"},
		53920 => {:id => "GrandMasterJCTrainer"},
		53922 => {:id => "GrandMasterJCTrainer"},
		53923 => {:id => "GrandMasterJCTrainer"},
		53925 => {:id => "GrandMasterJCTrainer"},
		53926 => {:id => "GrandMasterJCTrainer"},
		53927 => {:id => "GrandMasterJCTrainer"},
		53928 => {:id => "GrandMasterJCTrainer"},
		53930 => {:id => "GrandMasterJCTrainer"},
		53931 => {:id => "GrandMasterJCTrainer"},
		53934 => {:id => "GrandMasterJCTrainer"},
		53940 => {:id => "GrandMasterJCTrainer"},
		53941 => {:id => "GrandMasterJCTrainer"},
		53947 => {:id => "GrandMasterJCTrainer"},
		53948 => {:id => "GrandMasterJCTrainer"},
		53953 => {:id => "GrandMasterJCTrainer"},
		53956 => {:id => "GrandMasterJCTrainer"},
		53962 => {:id => "GrandMasterJCTrainer"},
		53963 => {:id => "GrandMasterJCTrainer"},
		53964 => {:id => "GrandMasterJCTrainer"},
		53966 => {:id => "GrandMasterJCTrainer"},
		53969 => {:id => "GrandMasterJCTrainer"},
		53975 => {:id => "GrandMasterJCTrainer"},
		53976 => {:id => "GrandMasterJCTrainer"},
		53977 => {:id => "GrandMasterJCTrainer"},
		53989 => {:id => "GrandMasterJCTrainer"},
		53992 => {:id => "GrandMasterJCTrainer"},
		54003 => {:id => "GrandMasterJCTrainer"},
		54004 => {:id => "GrandMasterJCTrainer"},
		54007 => {:id => "GrandMasterJCTrainer"},
		54017 => {:id => "GrandMasterJCTrainer"},
		54023 => {:id => "GrandMasterJCTrainer"},
		55386 => {:id => "GrandMasterJCTrainer"},
		55390 => {:id => "GrandMasterJCTrainer"},
		55394 => {:id => "GrandMasterJCTrainer"},
		55395 => {:id => "GrandMasterJCTrainer"},
		55397 => {:id => "GrandMasterJCTrainer"},
		55399 => {:id => "GrandMasterJCTrainer"},
		55402 => {:id => "GrandMasterJCTrainer"},
		55405 => {:id => "GrandMasterJCTrainer"},
		56193 => {:id => "GrandMasterJCTrainer"},
		56194 => {:id => "GrandMasterJCTrainer"},
		56195 => {:id => "GrandMasterJCTrainer"},
		56196 => {:id => "GrandMasterJCTrainer"},
		56197 => {:id => "GrandMasterJCTrainer"},
		56199 => {:id => "GrandMasterJCTrainer"},
		56201 => {:id => "GrandMasterJCTrainer"},
		56202 => {:id => "GrandMasterJCTrainer"},
		56203 => {:id => "GrandMasterJCTrainer"},
		56205 => {:id => "GrandMasterJCTrainer"},
		56206 => {:id => "GrandMasterJCTrainer"},
		56208 => {:id => "GrandMasterJCTrainer"},
		56530 => {:id => "GrandMasterJCTrainer"},
		56531 => {:id => "GrandMasterJCTrainer"},
		58141 => {:id => "GrandMasterJCTrainer"},
		58142 => {:id => "GrandMasterJCTrainer"},
		58143 => {:id => "GrandMasterJCTrainer"},
		58144 => {:id => "GrandMasterJCTrainer"},
		58145 => {:id => "GrandMasterJCTrainer"},
		58146 => {:id => "GrandMasterJCTrainer"},
		59759 => {:id => "GrandMasterJCTrainer"},
	}
jcmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Jewelcraft.lua","Jewelcrafting",recipes,maps,"InitJewelcrafting",jewelcrafting,[25614,26918,26920,32810],jcspecaillist,jcmanual,jcacquire)

end

def get_lw_list(recipes, maps)

	leatherworking = recipes.get_leatherworking_list
	lwspecaillist = {
		21943 => {:id => 7, :type => 1},
		44953 => {:id => 7, :type => 1},
	}
	lwacquire = {
		2149 => {:id => "StartingSkill"},
		2152 => {:id => "StartingSkill"},
		2881 => {:id => "StartingSkill"},
		28219 => {:id => "ADNaxx40E"},
		28220 => {:id => "ADNaxx40R"},
		28221 => {:id => "ADNaxx40R"},
		28222 => {:id => "ADNaxx40E"},
		28223 => {:id => "ADNaxx40R"},
		28224 => {:id => "ADNaxx40R"},
		19093 => {:id => "Onyxia"},
		50936 => {:id => "GrandMasterLWTrainer"},
		50938 => {:id => "GrandMasterLWTrainer"},
		50939 => {:id => "GrandMasterLWTrainer"},
		50940 => {:id => "GrandMasterLWTrainer"},
		50941 => {:id => "GrandMasterLWTrainer"},
		50942 => {:id => "GrandMasterLWTrainer"},
		50943 => {:id => "GrandMasterLWTrainer"},
		50944 => {:id => "GrandMasterLWTrainer"},
		50945 => {:id => "GrandMasterLWTrainer"},
		50946 => {:id => "GrandMasterLWTrainer"},
		50947 => {:id => "GrandMasterLWTrainer"},
		50948 => {:id => "GrandMasterLWTrainer"},
		50949 => {:id => "GrandMasterLWTrainer"},
		50950 => {:id => "GrandMasterLWTrainer"},
		50951 => {:id => "GrandMasterLWTrainer"},
		50952 => {:id => "GrandMasterLWTrainer"},
		50953 => {:id => "GrandMasterLWTrainer"},
		50954 => {:id => "GrandMasterLWTrainer"},
		50955 => {:id => "GrandMasterLWTrainer"},
		50956 => {:id => "GrandMasterLWTrainer"},
		50957 => {:id => "GrandMasterLWTrainer"},
		50958 => {:id => "GrandMasterLWTrainer"},
		50959 => {:id => "GrandMasterLWTrainer"},
		50960 => {:id => "GrandMasterLWTrainer"},
		50961 => {:id => "GrandMasterLWTrainer"},
		50962 => {:id => "GrandMasterLWTrainer"},
		50963 => {:id => "GrandMasterLWTrainer"},
		50964 => {:id => "GrandMasterLWTrainer"},
		50965 => {:id => "GrandMasterLWTrainer"},
		50966 => {:id => "GrandMasterLWTrainer"},
		50967 => {:id => "GrandMasterLWTrainer"},
		51568 => {:id => "GrandMasterLWTrainer"},
		51569 => {:id => "GrandMasterLWTrainer"},
		51570 => {:id => "GrandMasterLWTrainer"},
		51571 => {:id => "GrandMasterLWTrainer"},
		51572 => {:id => "GrandMasterLWTrainer"},
		55199 => {:id => "GrandMasterLWTrainer"},
		55243 => {:id => "GrandMasterLWTrainer"},
		57683 => {:id => "GrandMasterLWTrainer"},
		57690 => {:id => "GrandMasterLWTrainer"},
		57691 => {:id => "GrandMasterLWTrainer"},
		60583 => {:id => "GrandMasterLWTrainer"},
		60584 => {:id => "GrandMasterLWTrainer"},
		60599 => {:id => "GrandMasterLWTrainer"},
		60600 => {:id => "GrandMasterLWTrainer"},
		60601 => {:id => "GrandMasterLWTrainer"},
		60604 => {:id => "GrandMasterLWTrainer"},
		60605 => {:id => "GrandMasterLWTrainer"},
		60607 => {:id => "GrandMasterLWTrainer"},
		60608 => {:id => "GrandMasterLWTrainer"},
		60611 => {:id => "GrandMasterLWTrainer"},
		60613 => {:id => "GrandMasterLWTrainer"},
		60620 => {:id => "GrandMasterLWTrainer"},
		60622 => {:id => "GrandMasterLWTrainer"},
		60624 => {:id => "GrandMasterLWTrainer"},
		60627 => {:id => "GrandMasterLWTrainer"},
		60629 => {:id => "GrandMasterLWTrainer"},
		60630 => {:id => "GrandMasterLWTrainer"},
		60631 => {:id => "GrandMasterLWTrainer"},
		60637 => {:id => "GrandMasterLWTrainer"},
		60640 => {:id => "GrandMasterLWTrainer"},
		60643 => {:id => "GrandMasterLWTrainer"},
		60649 => {:id => "GrandMasterLWTrainer"},
		60651 => {:id => "GrandMasterLWTrainer"},
		60652 => {:id => "GrandMasterLWTrainer"},
		60655 => {:id => "GrandMasterLWTrainer"},
		60658 => {:id => "GrandMasterLWTrainer"},
		60660 => {:id => "GrandMasterLWTrainer"},
		60665 => {:id => "GrandMasterLWTrainer"},
		60666 => {:id => "GrandMasterLWTrainer"},
		60669 => {:id => "GrandMasterLWTrainer"},
		60671 => {:id => "GrandMasterLWTrainer"},
	}
lwmanual=<<EOF
EOF
	create_profession_db("./RecipeDB/ARL-Leatherwork.lua","Leatherworking",recipes,maps,"InitLeatherworking",leatherworking,[8195,15141,10550,19106,40000],lwspecaillist,lwmanual,lwacquire)

end

def get_smelt_list(recipes, maps)

	smelting = recipes.get_mining_list
	smeltingspecaillist = {
		}
	smeltacquire = {
		2657 => {:id => "StartingSkill"},
		49252 => {:id => "GrandMasterSmeltTrainer"},
		49258 => {:id => "GrandMasterSmeltTrainer"},
		55208 => {:id => "GrandMasterSmeltTrainer"},
		55211 => {:id => "GrandMasterSmeltTrainer"},
		14891 => {:id => "Quest", :type => [4083]},
	}
smeltmanual=<<EOF
EOF

	$quests[4083] = {:name => "The Spectral Chalice", :faction => 0}

	create_profession_db("./RecipeDB/ARL-Smelt.lua","Smelting",recipes,maps,"InitSmelting",smelting,[],smeltingspecaillist,smeltmanual,smeltacquire)

end

def get_tailoring_list(recipes, maps)

	tailoring = recipes.get_tailoring_list
	tailoringspecaillist = {
	}
	tailoracquire = {
		2385 => {:id => "StartingSkill"},
		2387 => {:id => "StartingSkill"},
		2963 => {:id => "StartingSkill"},
		28207 => {:id => "ADNaxx40E"},
		28209 => {:id => "ADNaxx40R"},
		28205 => {:id => "ADNaxx40R"},
		28208 => {:id => "ADNaxx40H"},
		55642 => {:id => "GrandMasterTailorTrainer"},
		55769 => {:id => "GrandMasterTailorTrainer"},
		55777 => {:id => "GrandMasterTailorTrainer"},
		55898 => {:id => "GrandMasterTailorTrainer"},
		55899 => {:id => "GrandMasterTailorTrainer"},
		55900 => {:id => "GrandMasterTailorTrainer"},
		55901 => {:id => "GrandMasterTailorTrainer"},
		55902 => {:id => "GrandMasterTailorTrainer"},
		55903 => {:id => "GrandMasterTailorTrainer"},
		55904 => {:id => "GrandMasterTailorTrainer"},
		55906 => {:id => "GrandMasterTailorTrainer"},
		55907 => {:id => "GrandMasterTailorTrainer"},
		55908 => {:id => "GrandMasterTailorTrainer"},
		55910 => {:id => "GrandMasterTailorTrainer"},
		55911 => {:id => "GrandMasterTailorTrainer"},
		55913 => {:id => "GrandMasterTailorTrainer"},
		55914 => {:id => "GrandMasterTailorTrainer"},
		55919 => {:id => "GrandMasterTailorTrainer"},
		55920 => {:id => "GrandMasterTailorTrainer"},
		55921 => {:id => "GrandMasterTailorTrainer"},
		55922 => {:id => "GrandMasterTailorTrainer"},
		55923 => {:id => "GrandMasterTailorTrainer"},
		55925 => {:id => "GrandMasterTailorTrainer"},
		55941 => {:id => "GrandMasterTailorTrainer"},
		55943 => {:id => "GrandMasterTailorTrainer"},
		55995 => {:id => "GrandMasterTailorTrainer"},
		56000 => {:id => "GrandMasterTailorTrainer"},
		56001 => {:id => "GrandMasterTailorTrainer"},
		56002 => {:id => "GrandMasterTailorTrainer"},
		56003 => {:id => "GrandMasterTailorTrainer"},
		56007 => {:id => "GrandMasterTailorTrainer"},
		56008 => {:id => "GrandMasterTailorTrainer"},
		56010 => {:id => "GrandMasterTailorTrainer"},
		56014 => {:id => "GrandMasterTailorTrainer"},
		56015 => {:id => "GrandMasterTailorTrainer"},
		56016 => {:id => "GrandMasterTailorTrainer"},
		56017 => {:id => "GrandMasterTailorTrainer"},
		56018 => {:id => "GrandMasterTailorTrainer"},
		56019 => {:id => "GrandMasterTailorTrainer"},
		56020 => {:id => "GrandMasterTailorTrainer"},
		56021 => {:id => "GrandMasterTailorTrainer"},
		56022 => {:id => "GrandMasterTailorTrainer"},
		56023 => {:id => "GrandMasterTailorTrainer"},
		56024 => {:id => "GrandMasterTailorTrainer"},
		56025 => {:id => "GrandMasterTailorTrainer"},
		56026 => {:id => "GrandMasterTailorTrainer"},
		56027 => {:id => "GrandMasterTailorTrainer"},
		56028 => {:id => "GrandMasterTailorTrainer"},
		56029 => {:id => "GrandMasterTailorTrainer"},
		56030 => {:id => "GrandMasterTailorTrainer"},
		56031 => {:id => "GrandMasterTailorTrainer"},
		56034 => {:id => "GrandMasterTailorTrainer"},
		56039 => {:id => "GrandMasterTailorTrainer"},
		56048 => {:id => "GrandMasterTailorTrainer"},
		59582 => {:id => "GrandMasterTailorTrainer"},
		59583 => {:id => "GrandMasterTailorTrainer"},
		59584 => {:id => "GrandMasterTailorTrainer"},
		59585 => {:id => "GrandMasterTailorTrainer"},
		59586 => {:id => "GrandMasterTailorTrainer"},
		59587 => {:id => "GrandMasterTailorTrainer"},
		59588 => {:id => "GrandMasterTailorTrainer"},
		59589 => {:id => "GrandMasterTailorTrainer"},
		60969 => {:id => "GrandMasterTailorTrainer"},
		60971 => {:id => "GrandMasterTailorTrainer"},
		60990 => {:id => "GrandMasterTailorTrainer"},
		60993 => {:id => "GrandMasterTailorTrainer"},
		60994 => {:id => "GrandMasterTailorTrainer"},
	}
tailoringmanual=<<EOF
	-- Duskweave Boots -- 55924
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,55924,380,41544,1, 3908)
	self:addTradeFlags(RecipeDB,55924,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,55924,1,26914,1,26964,1,26969,1,27001,1,28699)
EOF
	create_profession_db("./RecipeDB/ARL-Tailor.lua","Tailoring",recipes,maps,"InitTailoring",tailoring,[7636,8778,12062,12063,12068,12083,12087,12090,56048,31461,36665,36667,36668,36669,36670,36672],tailoringspecaillist,tailoringmanual,tailoracquire)

end

def get_runeforging_list(recipes, maps)

	runeforging = recipes.get_runeforging_list

	runeforgingspecaillist = {
	}
	runeforgeacquire = {
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

	$trainers[28471] = {:name => "Lady Alistra", :faction => 0}
	$trainers[28474] = {:name => "Amal'thazad", :faction => 0}
	$trainers[29194] = {:name => "Amal'thazad", :faction => 0}
	$trainers[29195] = {:name => "Lady Alistra", :faction => 0}
	$trainers[31084] = {:name => "Highlord Darion Mograine", :faction => 0}
	$trainers[28472] = {:name => "Lord Thorval", :faction => 0}
	$trainers[29196] = {:name => "Lord Thorval", :faction => 0}

	create_profession_db("./RecipeDB/ARL-Runeforge.lua","Runeforging",recipes,maps,"InitRuneforging",runeforging,[],runeforgingspecaillist,runeforgingmanual,runeforgeacquire)

end

def get_other_list(recipes, maps)

	create_lookup_db("./RecipeDB/ARL-Trainer.lua","Trainer","TrainerDB","InitTrainer",$trainers,maps,[])
	create_lookup_db("./RecipeDB/ARL-Vendor.lua","Vendor","VendorDB","InitVendor",$vendors,maps,[])
	create_lookup_db("./RecipeDB/ARL-Mob.lua","Monster","MobDB","InitMob",$monsters,maps,[])
	create_lookup_db("./RecipeDB/ARL-Quest.lua","Quest","QuestDB","InitQuest",$quests,maps,[])

	create_localization_db()

end

$debug = false

create_custom_db()
create_faction_db()

if $debug

	get_firstaid_list(recipes, maps)

else

	get_alchemy_list(recipes, maps)
	get_bs_list(recipes, maps)
	get_cooking_list(recipes, maps)
	get_enchanting_list(recipes, maps)
	get_engineering_list(recipes, maps)
	get_firstaid_list(recipes, maps)
	get_inscription_list(recipes, maps)
	get_jc_list(recipes, maps)
	get_lw_list(recipes, maps)
	get_smelt_list(recipes, maps)
	get_tailoring_list(recipes, maps)
	get_runeforging_list(recipes, maps)
	get_other_list(recipes, maps)

end

create_stats_list()

puts ""
puts "Finished processing run time was #{((Time.now).to_i-generator_start.to_i)} seconds"