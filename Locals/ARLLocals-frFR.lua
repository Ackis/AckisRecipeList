--[[
****************************************************************************************

ARLLocals-frFR.lua

frFR localization strings for Ackis Recipe List

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

Original translated by: Pettigrow
Currently maintaince by: Pettigrow

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

local L = LibStub("AceLocale-3.0"):NewLocale("Ackis Recipe List", "frFR")

if not L then return end

-- General strings
L["Filters"]				= "Filtres"
L["All"]					= "Tous"
L["None"]					= "Aucun"
L["Ok"]						= "Ok"

-- Config Options
L["About"]					= "À propos"
L["Main Options"]			= "Options principales"
L["General Settings"]		= "Paramètres généraux"
L["Display Settings"]		= "Paramètres d'affichage"
L["Sorting Settings"]		= "Paramètre de tri"
L["Profile Options"]		= "Options du profil"
L["ARL Documentation"]		= "Documentation d'ARL"

-- Config UI Elements and their associated descriptions
L["MAIN_OPTIONS_DESC"]		= "Configuration des options principales"
L["Scan"]					= "Analyser"
L["SCAN_RECIPES_DESC"]		= "Analyse une fenêtre de métier ouverte à la recherche de recettes manquantes. Appuyez sur MAJ pour générer un Text Dump."
L["Text Dump"]				= "Texte brut"
L["TEXT_DUMP_DESC"]			= "Affiche toutes les recettes dans un format de valeurs séparées par des virgules permettant d'être copié/collé dans un autre client."
L["View Exclusion List"]	= "Voir liste des exclus"
--L["Scan Button Position"]	= true
--L["SCANBUTTONPOSITION_DESC"] = "Allows you to customize where the scan button is placed on the tradeskill frame."
L["VIEW_EXCLUSION_LIST_DESC"] = "Affiche la liste de toutes les recettes exclues."
L["DISPLAY_SETTINGS_DESC"]	= "Vous permet de personnaliser le comportement de l'IUG."
L["SORTING_SETTINGS_DESC"]	= "Vous permet de personnaliser la façon dont les recettes affichées sont triées."
L["ARL_DOC_DESC"]			= "Documentation pour Ackis Recipe List"

-- UI Documentation
L["Using Filters"]			= "Utiliser les filtres"
--L["USING_FILTERS_DESC"]		= "Filters may be toggled on or off.  There are two types of filters: one which will prevent the recipe from showing up at all, and one which will prevent a specific type of acquire information from showing up.With the first type of filter, these match the proprieties of the recipe (ie: binding).  If you toggle ARL to not show BoP recipes, no recipes that are BoP will show up in the scan.  The second type of filter deals with acquire information.  If a recipe is available as a mob drop, or from a vendor and you toggle to not show vendor recipes, the recipe will still show up but vendor information will be hidden for it.  The reason is that there is still another way to acquire this recipe (mob drop) so it should still be included in the scan."
--L["Reporting Bugs"]			= true
--L["REPORTING_BUGS_DESC"]	= "When reporting a bug, please make sure you do the following:\n1) Download the latest version, available from http://www.wowace.com/projects/arl/files/\n2) Make sure there is not a bug report filed for your issue already.  You can check these at http://www.wowace.com/projects/arl/tickets/\n2a) Disable addons such as Skillet or ATSW.\n3) If your problem is not listed and you are using the latest version verify your addon settings.  Verify filters, profiles, etc.\n4) You have found a bug that no one has reported before.  Create a new ticket at http://www.wowace.com/projects/arl/tickets/ with a descriptive heading about the problem.  In the ticket make sure you include the error message that you received (just the error message, I don't need a listing of the addons you use), the recipe/profession you were working with, and any other info that you think may help."

-- Config UI Elements and their associated descriptions
L["Include Filtered"]		= "Compter les filtrées"
L["FILTERCOUNT_DESC"]		= "Intègre ou non les recettes filtrées dans le nombre total de recettes."
L["Include Excluded"]		= "Inclure les exclus"
L["EXCLUDECOUNT_DESC"]		= "Intègre ou non les recettes exclues dans le compte du total des recettes."
L["Close GUI"]				= "Fermer l'IUG"
L["CLOSEGUI_DESC"]			= "Ferme la fenêtre d'ARL quand la fenêtre de métier est fermée."
L["Display Exclusions"]		= "Montrer les exclus"
L["DISPLAY_EXCLUSION_DESC"]	= "Affiche les recettes qui sont dans la liste des exclus."
L["UI Scale"]				= "Échelle de l'IU"
L["UI_SCALE_DESC"]			= "Change l'échelle de l'IU. La portée va de .5 à 1.5 (1 par défaut)"
L["Tooltip Scale"]			= "Échelle de la bulle d'aide"
L["TOOLTIP_SCALE_DESC"]		= "Change l'échelle de la bulle d'aide d'ARL. La portée va de .5 à 1.5 (.9 par défaut)"
L["Sorting"]				= "Triage"
L["Sort"]					= "Tri"
L["Display"]				= "Affichage"
L["SORTING_DESC"]			= "Change la façon dont les recettes affichées sont triées."
L["Version"]				= "Version : "
L["Right"]					= "Droite"
L["Left"]					= "Gauche"
L["Name"]					= "Nom"
L["Skill"]					= "Compétence"
L["Location"]				= "Emplacement"
L["Acquisition"]			= "Acquisition"

-- Filter Config Options
L["Filtering Options"]		= "Options de filtrage"
L["General"]				= "Général"
L["Obtain"]					= "Obtention"
L["Binding"]				= "Lien"
L["Item"]					= "Objet"
L["Armor"]					= "Armure"
L["Weapon"]					= "Arme"
L["Player Type"]			= "Type de joueur"
L["Reputation"]				= "Réputation"
L["Old World"]				= "Ancien monde"
L["Burning Crusade"]		= "Burning Crusade"
L["Wrath of the Lich King"]	= "Wrath of the Lich King"

-- Filter Configuration Descriptions
L["FILTERING_OPTIONS_DESC"]					= "Vous permet de personnaliser les recettes qui sont filtrées."
L["General Filtering Options"]				= "Filtrage général"
L["FILTERING_GENERAL_DESC"]					= "Configuration de quelques autres types de filtre."
L["Obtain Filtering Options"]				= "Filtrage des obtentions"
L["FILTERING_OBTAIN_DESC"]					= "Configuration des moyens d'obtention à intégrer dans l'analyse."
L["Binding Filtering Options"]				= "Filtrage des liens"
L["FILTERING_BINDING_DESC"]					= "Configuration des types de lien à intégrer dans l'analyse."
L["Item Filtering Options"]					= "Filtrage des objets"
L["FILTERING_ITEM_DESC"]					= "Configuration des types d'objet à intégrer dans l'analyse."
L["Armor Filtering Options"]				= "Filtrage des armures"
L["FILTERING_Armor_DESC"]					= "Configuration des types d'armure à intégrer dans l'analyse."
L["Weapon Filtering Options"]				= "Filtrage des armes"
L["FILTERING_WEAPONS_DESC"]					= "Configuration des types d'arme à intégrer dans l'analyse."
L["Player Type Filtering Options"]			= "Filtrage des types de joueur"
L["FILTERING_PLAYERTYPE_DESC"]				= "Configuration des types de joueur et leurs objets correspondants à intégrer dans l'analyse."
L["Reputation Filtering Options"]			= "Filtrage des réputations"
L["FILTERING_REP_DESC"]						= "Configuration des factions offrant des recettes à intégrer dans l'analyse."
L["Old World Rep. Filtering Options"]		= "Filtrage des réput de WoW classique"
L["FILTERING_OLDWORLD_DESC"]				= "Configuration des factions de WoW classique offrant des recettes à intégrer dans l'analyse."
L["Burning Crusade Rep. Filtering Options"]	= "Filtrage des réput. de BC"
L["FILTERING_BC_DESC"]						= "Configuration des factions de Burning Crusade offrant des recettes à intégrer dans l'analyse."
L["Lich King Rep. Filtering Options"]		= "Filtrage des réput. de WotLK"
L["FILTERING_WOTLK_DESC"]					= "Configuration des factions de Wrath of the Lich King offrant des recettes à intégrer dans l'analyse."

-- General Filter UI Elements and their associated descriptions
L["Faction"]				= "Faction"
L["FACTION_DESC"]			= "Intègre ou non les recettes des deux factions (Horde et Alliance) dans l'analyse."
L["Classes"]				= "Classes"
L["CLASS_DESC"]				= "Intègre ou non les recettes spécifiques à certaines classes dans l'analyse."
L["Specialties"]			= "Spécialités"
L["SPECIALTY_DESC"]			= "Intègre ou non toutes les spécialités des métiers dans l'analyse."
L["Skill"]					= "Compétence"
L["SKILL_DESC"]				= "Intègre ou non toutes les recettes dans l'analyse, quelque soit votre niveau de compétence actuel."
L["Known"]					= "Connues"
L["KNOWN_DESC"]				= "Intègre ou non les recettes connues dans l'analyse."
L["Unknown"]				= "Inconnues"
L["UNKNOWN_DESC"]			= "Intègre ou non toutes les recettes inconnues dans l'analyse."

-- Obtain Filter UI Elements and their associated descriptions
L["Instance"]				= "Instance"
L["INSTANCE_DESC"]			= "Intègre ou non les recettes obtenues dans les instances à 5 dans l'analyse."
L["Raid"]					= "Raid"
L["RAID_DESC"]				= "Intègre ou non les recettes obtenues en raid (Coeur du Magma, Caverne du sanctuaire du Serpent, etc.) dans l'analyse."
L["Quest"]					= "Quête"
L["QUEST_DESC"]				= "Intègre ou non les recettes obtenues comme récompenses de quête dans l'analyse."
L["Seasonal"]				= "Saisonnier"
L["SEASONAL_DESC"]			= "Intègre ou non les recettes obtenues pendant les évènements saisonniers dans l'analyse."
L["Trainer"]				= "Entraîneur"
L["TRAINER_DESC"]			= "Intègre ou non les recettes apprises chez les maîtres de métier dans l'analyse."
L["Vendor"]					= "Marchand"
L["VENDOR_DESC"]			= "Intègre ou non les recettes achetées aux marchands dans l'analyse."
L["PVP"]					= "JcJ"
L["PVP_DESC"]				= "Intègre ou non les recettes obtenues via le système JcJ dans l'analyse."
L["Discovery"]				= "Découverte"
L["DISCOVERY_DESC"]			= "Intègre ou non les recettes obtenues par découverte dans l'analyse."
L["World Drop"]				= "Butin mondial"
L["WORLD_DROP_DESC"]		= "Intègre ou non les recettes pouvant être trouvées n'importe où dans l'analyse."
L["Mob Drop"]				= "Butin de monstre"
L["MOB_DROP_DESC"]			= "Intègre ou non les recettes trouvées sur des monstres bien déterminés dans l'analyse."

-- Binding Filter UI Elements and their associated descriptions
L["BOEFilter"]				= "Objet lié quand équipé"
L["BOE_DESC"]				= "Intègre ou non les recettes permettant la fabrication d'objets liés quand équipés dans l'analyse."
L["BOPFilter"]				= "Objet lié quand ramassé"
L["BOP_DESC"]				= "Intègre ou non les recettes permettant la fabrication d'objets liés quand ramassés dans l'analyse."
L["BOAFilter"]				= "Objet lié au compte"
L["BOA_DESC"]				= "Intègre ou non les recettes permettant la fabrication d'objets liés au compte dans l'analyse."
L["RecipeBOEFilter"]		= "Recette liée quand équipée"
L["RECIPE_BOE_DESC"]		= "Intègre ou non les recettes liées quand équipées dans l'analyse."
L["RecipeBOPFilter"]		= "Recette liée quand ramassée"
L["RECIPE_BOP_DESC"]		= "Intègre ou non les recettes liées quand ramassées dans l'analyse."
L["RecipeBOAFilter"]		= "Recette liée au compte"
L["RECIPE_BOA_DESC"]		= "Intègre ou non les recettes liées au compte dans l'analyse."

-- Item - Armor UI Elements and their associated descriptions
L["Cloth"]					= "Tissu"
L["CLOTH_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des objets en tissu dans l'analyse."
L["Leather"]				= "Cuir"
L["LEATHER_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des objets en cuir dans l'analyse."
L["Mail"]					= "Mailles"
L["MAIL_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des objets en mailles dans l'analyse."
L["Plate"]					= "Plaques"
L["PLATE_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des objets en plaques dans l'analyse."
L["Cloak"]					= "Cape"
L["CLOAK_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des capes dans l'analyse."
L["Ring"]					= "Anneau"
L["RING_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des anneaux dans l'analyse."
L["Trinket"]				= "Bijou"
L["TRINKET_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des bijoux dans l'analyse."
L["Necklace"]				= "Collier"
L["NECKLACE_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des colliers dans l'analyse."
L["Shield"]					= "Bouclier"
L["SHIELD_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des boucliers dans l'analyse."

-- Item - Weapon UI Elements and their associated descriptions
L["One Hand"]				= "Arme 1M"
L["ONEHAND_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des armes à une main dans l'analyse."
L["Two Hand"]				= "Arme 2M"
L["TWOHAND_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des armes à deux mains dans l'analyse."
L["Axe"]					= "Hache"
L["AXE_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des haches dans l'analyse."
L["Sword"]					= "Épée"
L["SWORD_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des épées dans l'analyse."
L["Mace"]					= "Masse"
L["MACE_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des masses dans l'analyse."
L["Polearm"]				= "Arme d'hast"
L["POLEARM_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des armes d'hast dans l'analyse."
L["Dagger"]					= "Dague"
L["DAGGER_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des dagues dans l'analyse."
L["Fist"]					= "Arme de pugilat"
L["FIST_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des armes de pugilat dans l'analyse."
L["Staff"]					= "Bâton"
L["STAFF_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des bâtons dans l'analyse."
L["Wand"]					= "Baguette"
L["WAND_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des baguettes dans l'analyse."
L["Thrown"]					= "Arme de jet"
L["THROWN_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des armes de jet dans l'analyse."
L["Bow"]					= "Arc"
L["BOW_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des arcs dans l'analyse."
L["Crossbow"]				= "Arbalète"
L["CROSSBOW_DESC"]			= "Intègre ou non les recettes permettant de fabriquer des arbalètes dans l'analyse."
L["Ammo"]					= "Munitions"
L["AMMO_DESC"]				= "Intègre ou non les recettes permettant de fabriquer des munitions dans l'analyse."

-- Player Type Filtering UI Elements and their associated descriptions
L["Melee DPS"]				= "DPS de mêlée"
L["MELEE_DPS_DESC"]			= "Intègre ou non les recettes utiles aux DPS de mêlée dans l'analyse."
L["Tanks"]					= "Tank"
L["TANKS_DESC"]				= "Intègre ou non les recettes utiles aux tanks dans l'analyse."
L["Caster DPS"]				= "DPS magique"
L["CASTER_DPS_DESC"]		= "Intègre ou non les recettes utiles aux DPS magiques dans l'analyse."
L["Healers"]				= "Soigneurs"
L["HEALERS_DESC"]			= "Intègre ou non les recettes utiles aux soigneurs dans l'analyse."

-- Reputation Filtering UI Elements and their associated description
L["SPECIFIC_REP_DESC"]		= "Intègre ou non la faction %s."

-- ZJUI UI Elements (when different from the above ones) and their associated descriptions
L["FILTER_OPEN"]			= "Filtre >>>"
L["FILTER_OPEN_DESC"]		= "Ouvre le panneau des options de filtration."
L["FILTER_CLOSE"]			= "<<< Filtre"
L["FILTER_CLOSE_DESC"]		= "Ferme le panneau des options de filtration."
L["EXPANDALL"]				= "+Ts"
L["EXPANDALL_DESC"]			= "Étend toutes les recettes listées ci-dessous."
L["CONTRACTALL"]			= "-Ts"
L["CONTRACTALL_DESC"]		= "Minimise toutes les recettes listées ci-dessous."
L["Search"]					= "Rechercher"
L["SEARCH_DESC"]			= "Affiche uniquement les recettes contenant le texte de gauche."
L["SEARCH_BOX_DESC"]		= "Texte à rechercher"
L["CLEAR_DESC"]				= "Efface le contenu de la boîte de recherche."
L["Close"]					= "Fermer"
L["CLOSE_DESC"]				= "Ferme la fenêtre d'Ackis Recipe List."
L["Reset"]					= "RàZ"
L["RESET_DESC"]				= "Réinitialise toutes les valeurs des filtres."
L["Apply"]					= "Appliquer"
L["APPLY_DESC"]				= "Applique les filtres sélectionnés ci-dessus à la liste des recettes."
L["ARMOR_ALL_DESC"]			= "Intègre les recettes permettant de fabriquer N'IMPORTE QUELLE pièce d'armure dans l'analyse."
L["ARMOR_NONE_DESC"]		= "Intègre AUCUNE des recettes permettant de fabriquer des pièces d'armure dans l'analyse."
L["WEAPON_ALL_DESC"]		= "Intègre les recettes permettant de fabriquer N'IMPORTE QUELLE arme dans l'analyse."
L["WEAPON_NONE_DESC"]		= "Intègre AUCUNE des recettes permettant de fabriquer des armes dans l'analyse."
L["NOT_YET_SCANNED"]		= "n'est pas encore scanné !"

-- Common Tooltip Strings (where different from above)
L["CTRL_CLICK"]			= "Ctrl-Clic pour créer un lien vers cette recette."
L["ALT_CLICK"]			= "Alt-Clic pour ajouter cette recette à la liste des exclus."
L["SHIFT_CLICK"]		= "Shift-Clic pour créer un lien vers l'objet de la recette."
L["Obtained From"]		= "Moyen d'obtention"
L["RECIPE_EXCLUDED"]	= "La recette est dans la liste des exclus."
L["Required Skill"]		= "Compétence requise"

-- Popup Strings
L["NOTSCANNED"]		= "Vous n'avez pas encore analysé ce métier. Veuillez ouvrir ce métier et cliquer sur Analyser."
L["ALL_FILTERED"]	= "Même si vous avez déjà analysé ce métier, vos filtres empêchent actuellement toute recette d'être affichée. Veuillez changer vos filtres et essayez à nouveau."
L["ARL_ALLKNOWN"]	= "Vous connaissez toutes les recettes de ce métier."
--L["ARL_ALLEXCLUDED"] = "Although you have already scanned this profession, your exclusions are currently preventing any recipes from being displayed. Please change your exclusions and try again."
--L["NO_DISPLAY"] 	= "No recipes to display.  If you get this message please submit a ticket at http://www.wowace.com/projects/arl/tickets listing what filters you have, what is in your exclusion list, which profession, and the number of known/unknown recipes."

-- Error/warning Text
L["MissingFromDB"] = ": n'est pas présent dans la base de données. \nVeuillez en informer l'auteur de cet addon."
L["UnknownTradeSkill"] = "Vous avez ouvert une fenêtre de métier qui n'est pas supporté par cet addon. Le métier en question est %s. Veuillez en informer l'auteur de cet addon."
L["OpenTradeSkillWindow"] = "Veuillez ouvrir la fenêtre de métier à analyser."
L["SpellIDCache"] = "L'ID du sort %s n'est pas dans votre cache local. Veuillez soumettre un ticket (en anglais) sur http://wow.curseforge.com/projects/ackis-recipe-list/tickets/ en indiquant l'ID du sort et la profession que vous analysiez."
L["NoItemLink"] = "Cet objet n'a pas de lien ou n'était pas dans votre cache."

-- Drop Obtain Info
L["Unknown Zone"] = "Zone inconnue"

-- Special Event information
L["Midsummer Fire Festival"] = "Fête du Feu"
L["Feast of Winters Veil"] = "Fête du Voile d'hiver"
L["Lunar Festival"] = "Fête lunaire"
L["Darkmoon Faire"] = "Foire de Sombrelune"
L["Seasonal"] = "Saisonnier"
