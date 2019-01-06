
require "core"
require "wowdb_recipes"

list = WoWDBRecipes.new

$alch = false
$bs = false
$cook = false
$eng = false
$ench = true
$insc = false
$jc = false
$lw = false
$mine = false
$tailor = false

if $alch

	puts("\t--Alchemy")

	recipe = list.get_alchemy_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $bs

	puts("\t--Blacksmithing")

	recipe = list.get_blacksmithing_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $cook

	puts("\t--Cooking")

	recipe = list.get_cooking_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $ench

	puts("\t--Enchanting")

	recipe = list.get_enchanting_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $eng

	puts("\t--Engineering")

	recipe = list.get_engineering_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $insc

	puts("\t--Inscription")

	recipe = list.get_inscription_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $jc

	puts("\t--Jewelcrafting")

	recipe = list.get_jewelcrafting_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $lw

	puts("\t--Leatherworking")

	recipe = list.get_leatherworking_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $mine

	puts("\t--Smelting")

	recipe = list.get_mining_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end

if $tailor

	puts("\t--Tailoring")

	recipe = list.get_tailoring_list
	ordered = Hash.new

	recipe.each_pair do |name,data|
	  list.add_recipe_details(data)
	  if data[:spellid] != data[:id]
		ordered[data[:spellid]] = data[:id]
	  end
	end

	ordered.sort.each do |id|
	  puts("\t[#{id[0]}] = #{id[1]},")
	end

end