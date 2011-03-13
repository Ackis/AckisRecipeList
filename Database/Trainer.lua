--[[
************************************************************************
Trainer.lua
************************************************************************
File date: @file-date-iso@
File hash: @file-abbreviated-hash@
Project hash: @project-abbreviated-hash@
Project version: @project-version@
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]] --

-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)

-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub

local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()

-----------------------------------------------------------------------
-- Constants.
-----------------------------------------------------------------------
local NEUTRAL = 0
local ALLIANCE = 1
local HORDE = 2

function addon:InitTrainer(DB)
	local function AddTrainer(id_num, name, location, coord_x, coord_y, faction)
		private:AddListEntry(DB, id_num, name, location, coord_x, coord_y, faction)
	end

	AddTrainer(514, L["Smith Argus"], BZ["Elwynn Forest"], 41.7, 65.6, ALLIANCE)
	AddTrainer(1103, L["Eldrin"], BZ["Elwynn Forest"], 79.3, 69.0, ALLIANCE)
	AddTrainer(1215, L["Alchemist Mallory"], BZ["Elwynn Forest"], 39.8, 48.3, ALLIANCE)
	AddTrainer(1241, L["Tognus Flintfire"], BZ["Dun Morogh"], 45.3, 52.0, ALLIANCE)
	AddTrainer(1246, L["Vosur Brakthel"], BZ["Ironforge"], 66.5, 55.2, ALLIANCE)
	AddTrainer(1317, L["Lucan Cordell"], BZ["Stormwind City"], 53.0, 74.3, ALLIANCE)
	AddTrainer(1346, L["Georgio Bolero"], BZ["Stormwind City"], 53.2, 81.5, ALLIANCE)
	AddTrainer(1355, L["Cook Ghilm"], BZ["Dun Morogh"], 68.4, 54.5, ALLIANCE)
	AddTrainer(1382, L["Mudduk"], BZ["Northern Stranglethorn"], 37.2, 49.2, HORDE) -- UPDATED
	AddTrainer(1385, L["Brawn"], BZ["Northern Stranglethorn"], 37.8, 50.4, HORDE) -- UPDATED
	AddTrainer(1386, L["Rogvar"], BZ["Swamp of Sorrows"], 48.4, 55.7, HORDE)
	AddTrainer(1430, L["Tomas"], BZ["Elwynn Forest"], 44.3, 66.0, ALLIANCE) ---confirm
	AddTrainer(1470, L["Ghak Healtouch"], BZ["Loch Modan"], 37.0, 49.2, ALLIANCE)
	AddTrainer(1632, L["Adele Fielder"], BZ["Elwynn Forest"], 46.4, 62.1, ALLIANCE)
	AddTrainer(1676, L["Finbus Geargrind"], BZ["Duskwood"], 77.4, 48.6, ALLIANCE)
	AddTrainer(1681, L["Brock Stoneseeker"], BZ["Loch Modan"], 37.1, 47.8, ALLIANCE)
	AddTrainer(1699, L["Gremlock Pilsnor"], BZ["Dun Morogh"], 47.6, 52.3, ALLIANCE)
	AddTrainer(1701, L["Dank Drizzlecut"], BZ["Dun Morogh"], 69.3, 55.5, ALLIANCE)
	AddTrainer(1702, L["Bronk Guzzlegear"], BZ["Dun Morogh"], 50.2, 50.4, ALLIANCE)
	AddTrainer(2132, L["Carolai Anise"], BZ["Tirisfal Glades"], 59.5, 52.2, HORDE)
	AddTrainer(2326, L["Thamner Pol"], BZ["Dun Morogh"], 47.2, 52.6, ALLIANCE)
	AddTrainer(2327, L["Shaina Fuller"], BZ["Stormwind City"], 52.9, 44.8, ALLIANCE)
	AddTrainer(2329, L["Michelle Belle"], BZ["Elwynn Forest"], 43.4, 65.6, ALLIANCE)
	AddTrainer(2391, L["Serge Hinott"], BZ["Hillsbrad Foothills"], 61.6, 19.2, HORDE)
	AddTrainer(2399, L["Daryl Stack"], BZ["Hillsbrad Foothills"], 63.7, 20.8, HORDE)
	AddTrainer(2627, L["Grarnik Goodstitch"], BZ["The Cape of Stranglethorn"], 43.6, 73.0, NEUTRAL) -- UPDATED
	AddTrainer(2798, L["Pand Stonebinder"], BZ["Thunder Bluff"], 29.4, 21.5, HORDE)
	AddTrainer(2818, L["Slagg"], BZ["Arathi Highlands"], 74.1, 33.8, HORDE)
	AddTrainer(2836, L["Brikk Keencraft"], BZ["The Cape of Stranglethorn"], 44.1, 70.9, NEUTRAL) -- UPDATED
	AddTrainer(2837, L["Jaxin Chong"], BZ["The Cape of Stranglethorn"], 42.6, 74.8, NEUTRAL) -- UPDATED
	AddTrainer(2998, L["Karn Stonehoof"], BZ["Thunder Bluff"], 39.0, 56.5, HORDE)
	AddTrainer(3001, L["Brek Stonehoof"], BZ["Thunder Bluff"], 34.5, 57.6, HORDE)
	AddTrainer(3004, L["Tepa"], BZ["Thunder Bluff"], 44.3, 45.0, HORDE)
	AddTrainer(3007, L["Una"], BZ["Thunder Bluff"], 41.8, 42.7, HORDE)
	AddTrainer(3009, L["Bena Winterhoof"], BZ["Thunder Bluff"], 46.8, 33.5, HORDE)
	AddTrainer(3011, L["Teg Dawnstrider"], BZ["Thunder Bluff"], 45.0, 38.0, HORDE)
	AddTrainer(3026, L["Aska Mistrunner"], BZ["Thunder Bluff"], 51.1, 52.9, HORDE)
	AddTrainer(3067, L["Pyall Silentstride"], BZ["Mulgore"], 45.5, 58.1, HORDE)
	AddTrainer(3069, L["Chaw Stronghide"], BZ["Mulgore"], 45.5, 57.9, HORDE)
	AddTrainer(3087, L["Crystal Boughman"], BZ["Redridge Mountains"], 22.8, 43.6, ALLIANCE)
	AddTrainer(3136, L["Clarise Gnarltree"], BZ["Duskwood"], 74.0, 48.5, ALLIANCE)
	AddTrainer(3137, L["Matt Johnson"], BZ["Duskwood"], 74.0, 49.7, ALLIANCE)
	AddTrainer(3174, L["Dwukk"], BZ["Durotar"], 52.0, 40.7, HORDE)
	AddTrainer(3175, L["Krunn"], BZ["Durotar"], 51.9, 40.9, HORDE)
	AddTrainer(3181, L["Fremal Doohickey"], BZ["Wetlands"], 10.8, 61.3, ALLIANCE)
	AddTrainer(3184, L["Miao'zan"], BZ["Durotar"], 55.5, 74.0, HORDE)
	AddTrainer(3290, L["Deek Fizzlebizz"], BZ["Loch Modan"], 45.9, 13.6, ALLIANCE)
	AddTrainer(3345, L["Godan"], BZ["Orgrimmar"], 53.8, 38.5, HORDE)
	AddTrainer(3347, L["Yelmak"], BZ["Orgrimmar"], 56.7, 33.2, HORDE)
	AddTrainer(3355, L["Saru Steelfury"], BZ["Orgrimmar"], 76.50, 34.53, HORDE) -- UPDATED
	AddTrainer(3357, L["Makaru"], BZ["Orgrimmar"], 72.31, 34.91, HORDE) -- UPDATED
	AddTrainer(3363, L["Magar"], BZ["Orgrimmar"], 63.5, 50.0, HORDE)
	AddTrainer(3365, L["Karolek"], BZ["Orgrimmar"], 62.8, 44.5, HORDE)
	AddTrainer(3373, L["Arnok"], BZ["Orgrimmar"], 34.1, 84.4, HORDE)
	AddTrainer(3399, L["Zamja"], BZ["Orgrimmar"], 57.5, 53.7, HORDE)
	AddTrainer(3478, L["Traugh"], BZ["Northern Barrens"], 48.3, 56.2, HORDE) -- UPDATED
	AddTrainer(3484, L["Kil'hala"], BZ["Northern Barrens"], 49.9, 61.2, HORDE) -- UPDATED
	AddTrainer(3494, L["Tinkerwiz"], BZ["Northern Barrens"], 68.5, 69.2, NEUTRAL) -- UPDATED
	AddTrainer(3523, L["Bowen Brisboise"], BZ["Tirisfal Glades"], 52.6, 55.6, HORDE)
	AddTrainer(3549, L["Shelene Rhobart"], BZ["Tirisfal Glades"], 65.5, 61.0, HORDE)
	AddTrainer(3555, L["Johan Focht"], BZ["Silverpine Forest"], 43.4, 40.5, HORDE)
	AddTrainer(3557, L["Guillaume Sorouy"], BZ["Silverpine Forest"], 43.2, 41.0, HORDE)
	AddTrainer(3603, L["Cyndra Kindwhisper"], BZ["Teldrassil"], 57.6, 60.7, ALLIANCE)
	AddTrainer(3605, L["Nadyia Maneweaver"], BZ["Teldrassil"], 41.8, 49.5, ALLIANCE)
	AddTrainer(3606, L["Alanna Raveneye"], BZ["Teldrassil"], 36.8, 34.2, ALLIANCE)
	AddTrainer(3704, L["Mahani"], BZ["Southern Barrens"], 41.5, 46.9, HORDE) -- UPDATED
	AddTrainer(3964, L["Kylanna"], BZ["Ashenvale"], 50.8, 67.1, ALLIANCE)
	AddTrainer(3967, L["Aayndia Floralwind"], BZ["Ashenvale"], 35.9, 52.1, ALLIANCE)
	AddTrainer(4159, L["Me'lynn"], BZ["Darnassus"], 61.7, 23.0, ALLIANCE)
	AddTrainer(4160, L["Ainethil"], BZ["Darnassus"], 55.0, 23.8, ALLIANCE)
	AddTrainer(4193, L["Grondal Moonbreeze"], BZ["Darkshore"], 38.2, 40.5, ALLIANCE)
	AddTrainer(4210, L["Alegorn"], BZ["Darnassus"], 50.0, 36.6, ALLIANCE) -- UPDATED
	AddTrainer(4211, L["Dannelor"], BZ["Darnassus"], 51.7, 12.6, ALLIANCE)
	AddTrainer(4212, L["Telonis"], BZ["Darnassus"], 64.5, 21.3, ALLIANCE)
	AddTrainer(4213, L["Taladan"], BZ["Darnassus"], 58.6, 13.2, ALLIANCE)
	AddTrainer(4254, L["Geofram Bouldertoe"], BZ["Ironforge"], 50.3, 26.0, ALLIANCE)
	AddTrainer(4258, L["Bengus Deepforge"], BZ["Ironforge"], 51.0, 43.0, ALLIANCE)
	AddTrainer(4552, L["Eunice Burch"], BZ["Undercity"], 62.3, 44.6, HORDE)
	AddTrainer(4576, L["Josef Gregorian"], BZ["Undercity"], 70.7, 30.3, HORDE)
	AddTrainer(4578, L["Josephine Lister"], BZ["Undercity"], 86.5, 22.3, HORDE)
	AddTrainer(4588, L["Arthur Moore"], BZ["Undercity"], 70.3, 58.5, HORDE)
	AddTrainer(4591, L["Mary Edras"], BZ["Undercity"], 73.5, 54.8, HORDE)
	AddTrainer(4596, L["James Van Brunt"], BZ["Undercity"], 61.2, 29.9, HORDE)
	AddTrainer(4598, L["Brom Killian"], BZ["Undercity"], 55.8, 37.0, HORDE)
	AddTrainer(4611, L["Doctor Herbert Halsey"], BZ["Undercity"], 47.7, 73.0, HORDE)
	AddTrainer(4616, L["Lavinia Crowe"], BZ["Undercity"], 62.1, 60.5, HORDE)
	AddTrainer(4900, L["Alchemist Narett"], BZ["Dustwallow Marsh"], 64.0, 47.7, ALLIANCE)
	AddTrainer(5127, L["Fimble Finespindle"], BZ["Ironforge"], 39.8, 33.5, ALLIANCE)
	AddTrainer(5150, L["Nissa Firestone"], BZ["Ironforge"], 54.0, 57.8, ALLIANCE)
	AddTrainer(5153, L["Jormund Stonebrow"], BZ["Ironforge"], 43.2, 29.0, ALLIANCE)
	AddTrainer(5157, L["Gimble Thistlefuzz"], BZ["Ironforge"], 60.0, 45.4, ALLIANCE)
	AddTrainer(5159, L["Daryl Riknussun"], BZ["Ironforge"], 60.1, 36.8, ALLIANCE)
	AddTrainer(5164, L["Grumnus Steelshaper"], BZ["Ironforge"], 50.2, 42.8, ALLIANCE)
	AddTrainer(5174, L["Springspindle Fizzlegear"], BZ["Ironforge"], 68.4, 44.0, ALLIANCE)
	AddTrainer(5177, L["Tally Berryfizz"], BZ["Ironforge"], 66.6, 55.2, ALLIANCE)
	AddTrainer(5392, L["Yarr Hammerstone"], BZ["Dun Morogh"], 50.0, 50.3, ALLIANCE)
	AddTrainer(5482, L["Stephen Ryback"], BZ["Stormwind City"], 78.2, 53.2, ALLIANCE)
	AddTrainer(5499, L["Lilyssia Nightbreeze"], BZ["Stormwind City"], 55.6, 85.9, ALLIANCE)
	AddTrainer(5511, L["Therum Deepforge"], BZ["Stormwind City"], 63.9, 37.8, ALLIANCE)
	AddTrainer(5513, L["Gelman Stonehand"], BZ["Stormwind City"], 59.2, 37.7, ALLIANCE)
	AddTrainer(5518, L["Lilliam Sparkspindle"], BZ["Stormwind City"], 62.2, 30.5, ALLIANCE)
	AddTrainer(5564, L["Simon Tanner"], BZ["Stormwind City"], 71.8, 62.9, ALLIANCE)
	AddTrainer(5695, L["Vance Undergloom"], BZ["Tirisfal Glades"], 61.7, 51.6, HORDE)
	AddTrainer(5759, L["Nurse Neela"], BZ["Tirisfal Glades"], 61.8, 52.8, HORDE)
	AddTrainer(5784, L["Waldor"], BZ["Wailing Caverns"], 32.6, 28.5, NEUTRAL)
	AddTrainer(5939, L["Vira Younghoof"], BZ["Mulgore"], 46.8, 60.8, HORDE)
	AddTrainer(5943, L["Rawrk"], BZ["Durotar"], 54.1, 42.0, HORDE)
	AddTrainer(6094, L["Byancie"], BZ["Teldrassil"], 55.3, 56.8, ALLIANCE)
	AddTrainer(6286, L["Zarrin"], BZ["Teldrassil"], 57.1, 61.3, ALLIANCE)
	AddTrainer(6297, L["Kurdram Stonehammer"], BZ["Darkshore"], 38.2, 41.1, ALLIANCE)
	AddTrainer(6299, L["Delfrum Flintbeard"], BZ["Darkshore"], 38.2, 41.0, ALLIANCE)
	AddTrainer(7230, L["Shayis Steelfury"], BZ["Orgrimmar"], 75.91, 37.10, HORDE) -- UPDATED
	AddTrainer(7231, L["Kelgruk Bloodaxe"], BZ["Orgrimmar"], 76.34, 37.08, HORDE) -- UPDATED
	AddTrainer(7406, L["Oglethorpe Obnoticus"], BZ["The Cape of Stranglethorn"], 43.0, 72.1, NEUTRAL) -- UPDATED
	AddTrainer(7866, L["Peter Galen"], BZ["Azshara"], 37.5, 65.5, ALLIANCE)
	AddTrainer(7867, L["Thorkaf Dragoneye"], BZ["Badlands"], 62.6, 57.6, HORDE)
	AddTrainer(7868, L["Sarah Tanner"], BZ["Searing Gorge"], 63.7, 75.7, ALLIANCE)
	AddTrainer(7869, L["Brumn Winterhoof"], BZ["Arathi Highlands"], 28.2, 45.0, HORDE)
	AddTrainer(7870, L["Caryssia Moonhunter"], BZ["Feralas"], 89.4, 46.5, ALLIANCE) ---confirm
	AddTrainer(7871, L["Se'Jib"], BZ["Northern Stranglethorn"], 45.3, 58.7, HORDE) -- UPDATED
	AddTrainer(7944, L["Tinkmaster Overspark"], BZ["Ironforge"], 69.8, 50.0, ALLIANCE)
	AddTrainer(7948, L["Kylanna Windwhisper"], BZ["Feralas"], 32.6, 43.8, ALLIANCE)
	AddTrainer(7949, L["Xylinnia Starshine"], BZ["Feralas"], 31.6, 44.3, ALLIANCE)
	AddTrainer(8126, L["Nixx Sprocketspring"], BZ["Tanaris"], 52.5, 27.3, NEUTRAL)
	AddTrainer(8128, L["Pikkle"], BZ["Tanaris"], 51.1, 28.1, NEUTRAL)
	AddTrainer(8153, L["Narv Hidecrafter"], BZ["Desolace"], 55.3, 56.3, HORDE)
	AddTrainer(8306, L["Duhng"], BZ["Northern Barrens"], 55.4, 61.3, HORDE) -- UPDATED
	AddTrainer(8736, L["Buzzek Bracketswing"], BZ["Tanaris"], 52.3, 27.7, NEUTRAL)
	AddTrainer(8738, L["Vazario Linkgrease"], BZ["Northern Barrens"], 68.5, 69.2, NEUTRAL) -- UPDATED
	AddTrainer(9584, L["Jalane Ayrole"], BZ["Stormwind City"], 40.6, 83.9, ALLIANCE)
	AddTrainer(11017, L["Roxxik"], BZ["Orgrimmar"], 56.85, 56.54, HORDE) -- UPDATED
	AddTrainer(11025, L["Mukdrak"], BZ["Durotar"], 52.2, 40.8, HORDE)
	AddTrainer(11031, L["Franklin Lloyd"], BZ["Undercity"], 75.9, 73.7, HORDE)
	AddTrainer(11037, L["Jenna Lemkenilli"], BZ["Darkshore"], 38.3, 41.1, ALLIANCE)
	AddTrainer(11052, L["Timothy Worthington"], BZ["Dustwallow Marsh"], 66.22, 51.7, ALLIANCE)
	AddTrainer(11072, L["Kitta Firewind"], BZ["Elwynn Forest"], 64.9, 70.6, ALLIANCE)
	AddTrainer(11073, L["Annora"], BZ["Uldaman"], 0, 0, NEUTRAL)
	AddTrainer(11074, L["Hgarth"], BZ["Stonetalon Mountains"], 49.2, 57.2, HORDE)
	AddTrainer(11097, L["Drakk Stonehand"], BZ["The Hinterlands"], 13.4, 43.4, ALLIANCE)
	AddTrainer(11098, L["Hahrana Ironhide"], BZ["Feralas"], 74.4, 43.1, HORDE)
	AddTrainer(11146, L["Ironus Coldsteel"], BZ["Ironforge"], 50.5, 43.3, ALLIANCE)
	AddTrainer(11177, L["Okothos Ironrager"], BZ["Orgrimmar"], 75.35, 34.04, HORDE) -- UPDATED
	AddTrainer(11178, L["Borgosh Corebender"], BZ["Orgrimmar"], 75.89, 33.61, HORDE) -- UPDATED
	AddTrainer(11557, L["Meilosh"], BZ["Felwood"], 65.7, 2.9, HORDE)
	AddTrainer(12920, L["Doctor Gregory Victor"], BZ["Arathi Highlands"], 73.4, 36.8, HORDE)
	AddTrainer(12939, L["Doctor Gustaf VanHowzen"], BZ["Dustwallow Marsh"], 68.18, 47.94, ALLIANCE)
	AddTrainer(14742, L["Zap Farflinger"], BZ["Winterspring"], 61.2, 37.6, NEUTRAL)
	AddTrainer(14743, L["Jhordy Lapforge"], BZ["Tanaris"], 52.3, 26.9, NEUTRAL)
	AddTrainer(15400, L["Arathel Sunforge"], BZ["Eversong Woods"], 59.6, 62.6, HORDE)
	AddTrainer(15501, L["Aleinia"], BZ["Eversong Woods"], 48.5, 47.5, HORDE)
	AddTrainer(16160, L["Magistrix Eredania"], BZ["Eversong Woods"], 38.2, 72.6, HORDE)
	AddTrainer(16161, L["Arcanist Sheynathren"], BZ["Eversong Woods"], 38.2, 72.5, HORDE)
	AddTrainer(16253, L["Master Chef Mouldier"], BZ["Ghostlands"], 48.3, 30.9, HORDE)
	AddTrainer(16272, L["Kanaria"], BZ["Eversong Woods"], 48.5, 47.6, HORDE)
	AddTrainer(16277, L["Quarelestra"], BZ["Eversong Woods"], 48.6, 47.1, HORDE)
	AddTrainer(16278, L["Sathein"], BZ["Eversong Woods"], 53.5, 51.0, HORDE)
	AddTrainer(16366, L["Sempstress Ambershine"], BZ["Eversong Woods"], 37.4, 71.9, HORDE)
	AddTrainer(16583, L["Rohok"], BZ["Hellfire Peninsula"], 53.2, 38.2, HORDE)
	AddTrainer(16588, L["Apothecary Antonivich"], BZ["Hellfire Peninsula"], 52.4, 36.5, HORDE)
	AddTrainer(16633, L["Sedana"], BZ["Silvermoon City"], 70.0, 24.0, HORDE)
	AddTrainer(16640, L["Keelen Sheets"], BZ["Silvermoon City"], 57.0, 50.1, HORDE)
	AddTrainer(16642, L["Camberon"], BZ["Silvermoon City"], 66.1, 17.4, HORDE)
	AddTrainer(16662, L["Alestus"], BZ["Silvermoon City"], 77.6, 71.3, HORDE)
	AddTrainer(16663, L["Belil"], BZ["Silvermoon City"], 79.1, 42.9, HORDE)
	AddTrainer(16667, L["Danwe"], BZ["Silvermoon City"], 76.5, 40.9, HORDE)
	AddTrainer(16669, L["Bemarrin"], BZ["Silvermoon City"], 79.5, 39.0, HORDE)
	AddTrainer(16676, L["Sylann"], BZ["Silvermoon City"], 69.5, 71.5, HORDE)
	AddTrainer(16688, L["Lynalis"], BZ["Silvermoon City"], 84.0, 80.2, HORDE)
	AddTrainer(16719, L["Mumman"], BZ["The Exodar"], 55.6, 27.1, ALLIANCE)
	AddTrainer(16723, L["Lucc"], BZ["The Exodar"], 27.5, 60.9, ALLIANCE)
	AddTrainer(16724, L["Miall"], BZ["The Exodar"], 60.0, 89.6, ALLIANCE)
	AddTrainer(16725, L["Nahogg"], BZ["The Exodar"], 40.5, 39.2, ALLIANCE)
	AddTrainer(16726, L["Ockil"], BZ["The Exodar"], 54.0, 92.1, ALLIANCE)
	AddTrainer(16728, L["Akham"], BZ["The Exodar"], 66.0, 74.6, ALLIANCE)
	AddTrainer(16729, L["Refik"], BZ["The Exodar"], 63.0, 67.9, ALLIANCE)
	AddTrainer(16731, L["Nus"], BZ["The Exodar"], 39.0, 22.5, ALLIANCE)
	AddTrainer(16752, L["Muaat"], BZ["The Exodar"], 60.0, 87.9, ALLIANCE)
	AddTrainer(16823, L["Humphry"], BZ["Hellfire Peninsula"], 56.8, 63.8, ALLIANCE)
	AddTrainer(17214, L["Anchorite Fateema"], BZ["Azuremyst Isle"], 48.5, 51.8, ALLIANCE) --- confirm
	AddTrainer(17215, L["Daedal"], BZ["Azuremyst Isle"], 48.5, 51.5, ALLIANCE) --- confirm
	AddTrainer(17222, L["Artificer Daelo"], BZ["Azuremyst Isle"], 48.0, 51.0, ALLIANCE)
	AddTrainer(17245, L["Blacksmith Calypso"], BZ["Azuremyst Isle"], 46.4, 71.1, ALLIANCE)
	AddTrainer(17246, L["\"Cookie\" McWeaksauce"], BZ["Azuremyst Isle"], 46.7, 70.5, ALLIANCE) -- confirm
	AddTrainer(17424, L["Anchorite Paetheus"], BZ["Bloodmyst Isle"], 54.7, 54.0, ALLIANCE)
	AddTrainer(17442, L["Moordo"], BZ["Azuremyst Isle"], 44.8, 23.8, ALLIANCE)
	AddTrainer(17487, L["Erin Kelly"], BZ["Azuremyst Isle"], 46.2, 70.5, ALLIANCE)
	AddTrainer(17488, L["Dulvi"], BZ["Azuremyst Isle"], 48.9, 51.1, ALLIANCE)
	AddTrainer(17634, L["K. Lee Smallfry"], BZ["Zangarmarsh"], 68.6, 50.2, ALLIANCE)
	AddTrainer(17637, L["Mack Diver"], BZ["Zangarmarsh"], 33.9, 51.0, HORDE)
	AddTrainer(18747, L["Krugosh"], BZ["Hellfire Peninsula"], 55.5, 37.6, HORDE)
	AddTrainer(18749, L["Dalinna"], BZ["Hellfire Peninsula"], 56.6, 37.1, HORDE) --- confirm
	AddTrainer(18751, L["Kalaen"], BZ["Hellfire Peninsula"], 56.8, 37.7, HORDE)
	AddTrainer(18752, L["Zebig"], BZ["Hellfire Peninsula"], 54.8, 38.5, HORDE)
	AddTrainer(18753, L["Felannia"], BZ["Hellfire Peninsula"], 52.3, 36.1, HORDE)
	AddTrainer(18754, L["Barim Spilthoof"], BZ["Hellfire Peninsula"], 56.2, 38.6, HORDE)
	AddTrainer(18771, L["Brumman"], BZ["Hellfire Peninsula"], 54.1, 64.0, ALLIANCE)
	AddTrainer(18772, L["Hama"], BZ["Hellfire Peninsula"], 54.1, 63.6, ALLIANCE)
	AddTrainer(18773, L["Johan Barnes"], BZ["Hellfire Peninsula"], 53.7, 66.1, ALLIANCE)
	AddTrainer(18774, L["Tatiana"], BZ["Hellfire Peninsula"], 54.6, 63.6, ALLIANCE)
	AddTrainer(18775, L["Lebowski"], BZ["Hellfire Peninsula"], 55.7, 65.5, ALLIANCE)
	AddTrainer(18779, L["Hurnak Grimmord"], BZ["Hellfire Peninsula"], 56.7, 63.8, ALLIANCE)
	AddTrainer(18802, L["Alchemist Gribble"], BZ["Hellfire Peninsula"], 53.8, 65.8, ALLIANCE)
	AddTrainer(18804, L["Prospector Nachlan"], BZ["Bloodmyst Isle"], 56.3, 54.3, ALLIANCE)
	AddTrainer(18987, L["Gaston"], BZ["Hellfire Peninsula"], 54.1, 63.5, ALLIANCE)
	AddTrainer(18988, L["Baxter"], BZ["Hellfire Peninsula"], 56.8, 37.5, HORDE)
	AddTrainer(18990, L["Burko"], BZ["Hellfire Peninsula"], 22.4, 39.3, ALLIANCE)
	AddTrainer(18991, L["Aresella"], BZ["Hellfire Peninsula"], 26.3, 62.0, HORDE)
	AddTrainer(18993, L["Naka"], BZ["Zangarmarsh"], 78.5, 63.0, NEUTRAL)
	AddTrainer(19052, L["Lorokeem"], BZ["Shattrath City"], 45.4, 19.5, NEUTRAL)
	AddTrainer(19063, L["Hamanar"], BZ["Shattrath City"], 35.7, 20.5, NEUTRAL)
	AddTrainer(19184, L["Mildred Fletcher"], BZ["Shattrath City"], 66.5, 13.5, NEUTRAL)
	AddTrainer(19185, L["Jack Trapper"], BZ["Shattrath City"], 63.0, 68.5, NEUTRAL)
	AddTrainer(19186, L["Kylene"], BZ["Shattrath City"], 76.5, 33.0, NEUTRAL)
	AddTrainer(19187, L["Darmari"], BZ["Shattrath City"], 66.8, 67.1, NEUTRAL)
	AddTrainer(19251, L["Enchantress Volali"], BZ["Shattrath City"], 43.2, 92.3, NEUTRAL)
	AddTrainer(19252, L["High Enchanter Bardolan"], BZ["Shattrath City"], 43.2, 92.2, NEUTRAL)
	AddTrainer(19341, L["Grutah"], BZ["Shadowmoon Valley"], 29.7, 31.5, HORDE)
	AddTrainer(19369, L["Celie Steelwing"], BZ["Shadowmoon Valley"], 37.2, 58.5, ALLIANCE)
	AddTrainer(19478, L["Fera Palerunner"], BZ["Blade's Edge Mountains"], 53.7, 55.0, HORDE)
	AddTrainer(19539, L["Jazdalaad"], BZ["Netherstorm"], 44.5, 34.0, NEUTRAL)
	AddTrainer(19540, L["Asarnan"], BZ["Netherstorm"], 44.2, 33.7, NEUTRAL)
	AddTrainer(19576, L["Xyrol"], BZ["Netherstorm"], 32.5, 66.7, NEUTRAL)
	AddTrainer(19775, L["Kalinda"], BZ["Silvermoon City"], 90.5, 74.1, HORDE)
	AddTrainer(19778, L["Farii"], BZ["The Exodar"], 45.0, 24.0, ALLIANCE)
	AddTrainer(20124, L["Kradu Grimblade"], BZ["Shattrath City"], 69.2, 44.8, NEUTRAL)
	AddTrainer(20125, L["Zula Slagfury"], BZ["Shattrath City"], 70.1, 42.0, NEUTRAL)
	AddTrainer(21087, L["Grikka"], BZ["Blade's Edge Mountains"], 76.8, 65.5, HORDE)
	AddTrainer(21493, L["Kablamm Farflinger"], BZ["Netherstorm"], 32.9, 63.7, NEUTRAL)
	AddTrainer(21494, L["Smiles O'Byron"], BZ["Blade's Edge Mountains"], 60.3, 65.2, NEUTRAL)
	AddTrainer(22477, L["Anchorite Ensham"], BZ["Terokkar Forest"], 30.8, 75.9, NEUTRAL)
	AddTrainer(23734, L["Anchorite Yazmina"], BZ["Howling Fjord"], 59.5, 62.3, ALLIANCE)
	AddTrainer(24868, L["Niobe Whizzlespark"], BZ["Shadowmoon Valley"], 36.7, 54.8, ALLIANCE)
	AddTrainer(25099, L["Jonathan Garrett"], BZ["Shadowmoon Valley"], 29.2, 28.5, HORDE)
	AddTrainer(25277, L["Chief Engineer Leveny"], BZ["Borean Tundra"], 42.6, 53.7, HORDE)
	AddTrainer(26564, L["Borus Ironbender"], BZ["Dragonblight"], 36.6, 47.1, HORDE)
	AddTrainer(26903, L["Lanolis Dewdrop"], BZ["Howling Fjord"], 58.4, 62.3, ALLIANCE)
	AddTrainer(26904, L["Rosina Rivet"], BZ["Howling Fjord"], 59.6, 63.7, ALLIANCE)
	AddTrainer(26905, L["Brom Brewbaster"], BZ["Howling Fjord"], 58.2, 62.1, ALLIANCE)
	AddTrainer(26906, L["Elizabeth Jackson"], BZ["Howling Fjord"], 58.6, 62.8, ALLIANCE)
	AddTrainer(26907, L["Tisha Longbridge"], BZ["Howling Fjord"], 59.7, 64.0, ALLIANCE)
	AddTrainer(26911, L["Bernadette Dexter"], BZ["Howling Fjord"], 59.9, 63.6, ALLIANCE)
	AddTrainer(26912, L["Grumbol Stoutpick"], BZ["Howling Fjord"], 59.9, 63.9, ALLIANCE)
	AddTrainer(26914, L["Benjamin Clegg"], BZ["Howling Fjord"], 58.6, 62.8, ALLIANCE)
	AddTrainer(26915, L["Ounhulo"], BZ["Howling Fjord"], 59.9, 63.8, ALLIANCE)
	AddTrainer(26916, L["Mindri Dinkles"], BZ["Howling Fjord"], 58.6, 62.8, ALLIANCE)
	AddTrainer(26951, L["Wilhelmina Renel"], BZ["Howling Fjord"], 78.7, 28.5, HORDE)
	AddTrainer(26952, L["Kristen Smythe"], BZ["Howling Fjord"], 79.2, 29.0, HORDE)
	AddTrainer(26953, L["Thomas Kolichio"], BZ["Howling Fjord"], 78.6, 29.4, HORDE)
	AddTrainer(26954, L["Emil Autumn"], BZ["Howling Fjord"], 78.7, 28.3, HORDE)
	AddTrainer(26955, L["Jamesina Watterly"], BZ["Howling Fjord"], 78.5, 30.0, HORDE)
	AddTrainer(26956, L["Sally Tompkins"], BZ["Howling Fjord"], 79.4, 29.4, HORDE)
	AddTrainer(26959, L["Booker Kells"], BZ["Howling Fjord"], 79.4, 29.3, HORDE)
	AddTrainer(26960, L["Carter Tiffens"], BZ["Howling Fjord"], 79.3, 28.8, HORDE)
	AddTrainer(26961, L["Gunter Hansen"], BZ["Howling Fjord"], 78.3, 28.2, HORDE)
	AddTrainer(26962, L["Jonathan Lewis"], BZ["Howling Fjord"], 79.3, 29.0, HORDE)
	AddTrainer(26964, L["Alexandra McQueen"], BZ["Howling Fjord"], 79.4, 30.7, HORDE)
	AddTrainer(26969, L["Raenah"], BZ["Borean Tundra"], 41.6, 53.5, HORDE)
	AddTrainer(26972, L["Orn Tenderhoof"], BZ["Borean Tundra"], 42.0, 54.2, HORDE) -- confirm
	AddTrainer(26975, L["Arthur Henslowe"], BZ["Borean Tundra"], 41.8, 54.3, HORDE)
	AddTrainer(26976, L["Brunna Ironaxe"], BZ["Borean Tundra"], 42.6, 53.2, HORDE)
	AddTrainer(26977, L["Adelene Sunlance"], BZ["Borean Tundra"], 41.2, 53.9, HORDE)
	AddTrainer(26980, L["Eorain Dawnstrike"], BZ["Borean Tundra"], 41.2, 53.9, HORDE)
	AddTrainer(26981, L["Crog Steelspine"], BZ["Borean Tundra"], 40.8, 55.3, HORDE)
	AddTrainer(26982, L["Geba'li"], BZ["Borean Tundra"], 41.6, 53.4, HORDE)
	AddTrainer(26987, L["Falorn Nightwhisper"], BZ["Borean Tundra"], 57.8, 71.9, ALLIANCE)
	AddTrainer(26988, L["Argo Strongstout"], BZ["Borean Tundra"], 57.2, 66.6, ALLIANCE)
	AddTrainer(26989, L["Rollick MacKreel"], BZ["Borean Tundra"], 57.9, 71.5, ALLIANCE)
	AddTrainer(26990, L["Alexis Marlowe"], BZ["Borean Tundra"], 57.6, 71.6, ALLIANCE)
	AddTrainer(26991, L["Sock Brightbolt"], BZ["Borean Tundra"], 57.7, 72.2, ALLIANCE)
	AddTrainer(26992, L["Brynna Wilson"], BZ["Borean Tundra"], 57.8, 66.5, ALLIANCE)
	AddTrainer(26995, L["Tink Brightbolt"], BZ["Borean Tundra"], 57.6, 71.7, ALLIANCE)
	AddTrainer(26996, L["Awan Iceborn"], BZ["Borean Tundra"], 76.3, 37.0, HORDE) --- confirm
	AddTrainer(26997, L["Alestos"], BZ["Borean Tundra"], 57.5, 72.3, ALLIANCE)
	AddTrainer(26998, L["Rosemary Bovard"], BZ["Borean Tundra"], 57.6, 71.9, ALLIANCE)
	AddTrainer(26999, L["Fendrig Redbeard"], BZ["Borean Tundra"], 57.5, 66.2, ALLIANCE)
	AddTrainer(27001, L["Darin Goodstitch"], BZ["Borean Tundra"], 57.5, 72.3, ALLIANCE)
	AddTrainer(27023, L["Apothecary Bressa"], BZ["Dragonblight"], 36.2, 48.7, HORDE)
	AddTrainer(27029, L["Apothecary Wormwick"], BZ["Dragonblight"], 76.9, 62.2, HORDE)
	AddTrainer(27034, L["Josric Fame"], BZ["Dragonblight"], 75.9, 63.2, HORDE) -- confirm
	AddTrainer(28693, L["Enchanter Nalthanis"], BZ["Dalaran"], 39.1, 40.5, NEUTRAL)
	AddTrainer(28694, L["Alard Schmied"], BZ["Dalaran"], 45.5, 28.5, NEUTRAL)
	AddTrainer(28697, L["Timofey Oshenko"], BZ["Dalaran"], 39.0, 27.5, NEUTRAL)
	AddTrainer(28698, L["Jedidiah Handers"], BZ["Dalaran"], 41.5, 26.0, NEUTRAL)
	AddTrainer(28699, L["Charles Worth"], BZ["Dalaran"], 36.5, 33.5, NEUTRAL)
	AddTrainer(28700, L["Diane Cannings"], BZ["Dalaran"], 35.7, 28.8, NEUTRAL)
	AddTrainer(28701, L["Timothy Jones"], BZ["Dalaran"], 40.5, 35.2, NEUTRAL)
	AddTrainer(28702, L["Professor Pallin"], BZ["Dalaran"], 41.8, 36.9, NEUTRAL)
	AddTrainer(28703, L["Linzy Blackbolt"], BZ["Dalaran"], 42.5, 32.1, NEUTRAL)
	AddTrainer(28705, L["Katherine Lee"], BZ["Dalaran"], 40.8, 65.2, ALLIANCE)
	AddTrainer(28706, L["Olisarra the Kind"], BZ["Dalaran"], 37.5, 36.7, NEUTRAL)
	AddTrainer(29194, L["Amal'thazad"], BZ["Eastern Plaguelands"], 80.5, 48.1, NEUTRAL)
	AddTrainer(29195, L["Lady Alistra"], BZ["Eastern Plaguelands"], 83.7, 44.6, NEUTRAL)
	AddTrainer(29196, L["Lord Thorval"], BZ["Eastern Plaguelands"], 80.9, 43.8, NEUTRAL)
	AddTrainer(29233, L["Nurse Applewood"], BZ["Borean Tundra"], 41.7, 54.5, HORDE)
	AddTrainer(29505, L["Imindril Spearsong"], BZ["Dalaran"], 45.5, 28.6, NEUTRAL)
	AddTrainer(29506, L["Orland Schaeffer"], BZ["Dalaran"], 45.0, 28.4, NEUTRAL)
	AddTrainer(29507, L["Manfred Staller"], BZ["Dalaran"], 34.2, 29.5, NEUTRAL)
	AddTrainer(29508, L["Andellion"], BZ["Dalaran"], 34.5, 27.1, NEUTRAL)
	AddTrainer(29509, L["Namha Moonwater"], BZ["Dalaran"], 36.3, 29.4, NEUTRAL)
	AddTrainer(29513, L["Didi the Wrench"], BZ["Dalaran"], 39.5, 25.5, NEUTRAL)
	AddTrainer(29514, L["Findle Whistlesteam"], BZ["Dalaran"], 39.5, 25.2, NEUTRAL)
	AddTrainer(29631, L["Awilo Lon'gomba"], BZ["Dalaran"], 70.0, 38.6, HORDE)
	AddTrainer(29924, L["Brandig"], BZ["The Storm Peaks"], 28.9, 74.9, ALLIANCE)
	AddTrainer(30706, L["Jo'mah"], BZ["Orgrimmar"], 56.2, 46.5, HORDE)
	AddTrainer(30709, L["Poshken Hardbinder"], BZ["Thunder Bluff"], 29.2, 22.0, HORDE)
	AddTrainer(30710, L["Zantasia"], BZ["Silvermoon City"], 69.5, 24.0, HORDE)
	AddTrainer(30711, L["Margaux Parchley"], BZ["Undercity"], 61.0, 58.5, HORDE)
	AddTrainer(30713, L["Catarina Stanford"], BZ["Stormwind City"], 49.8, 74.7, ALLIANCE)
	AddTrainer(30715, L["Feyden Darkin"], BZ["Darnassus"], 58.9, 14.1, ALLIANCE)
	AddTrainer(30716, L["Thoth"], BZ["The Exodar"], 40.5, 39.1, ALLIANCE)
	AddTrainer(30717, L["Elise Brightletter"], BZ["Ironforge"], 60.7, 44.9, ALLIANCE)
	AddTrainer(30721, L["Michael Schwan"], BZ["Hellfire Peninsula"], 53.9, 65.5, ALLIANCE)
	AddTrainer(30722, L["Neferatti"], BZ["Hellfire Peninsula"], 52.3, 36.1, HORDE)
	AddTrainer(31084, L["Highlord Darion Mograine"], BZ["Eastern Plaguelands"], 83.5, 49.5, NEUTRAL)
	AddTrainer(33580, L["Dustin Vail"], BZ["Icecrown"], 73.0, 20.8, NEUTRAL)
	AddTrainer(33581, L["Kul'de"], BZ["Icecrown"], 71.8, 20.8, NEUTRAL)
	AddTrainer(33583, L["Fael Morningsong"], BZ["Icecrown"], 73.0, 20.6, NEUTRAL)
	AddTrainer(33586, L["Binkie Brightgear"], BZ["Icecrown"], 72.1, 20.9, NEUTRAL)
	AddTrainer(33587, L["Bethany Cromwell"], BZ["Icecrown"], 72.4, 20.8, NEUTRAL)
	AddTrainer(33588, L["Crystal Brightspark"], BZ["Icecrown"], 71.6, 21.0, NEUTRAL)
	AddTrainer(33589, L["Joseph Wilson"], BZ["Icecrown"], 71.5, 22.5, NEUTRAL)
	AddTrainer(33590, L["Oluros"], BZ["Icecrown"], 71.5, 20.8, NEUTRAL)
	AddTrainer(33591, L["Rekka the Hammer"], BZ["Icecrown"], 71.9, 20.9, NEUTRAL)
	AddTrainer(33603, L["Arthur Denny"], BZ["Icecrown"], 71.7, 20.9, NEUTRAL)
	AddTrainer(33608, _G.GetSpellInfo(51304), BZ["Shattrath City"], 44.3, 90.4, NEUTRAL) -- Alchemy
	AddTrainer(33609, _G.GetSpellInfo(51300), BZ["Shattrath City"], 43.9, 90.5, NEUTRAL) -- BS
	AddTrainer(33610, _G.GetSpellInfo(51313), BZ["Shattrath City"], 43.6, 90.4, NEUTRAL) -- Enchanting
	AddTrainer(33611, _G.GetSpellInfo(51306), BZ["Shattrath City"], 43.7, 90.1, NEUTRAL) -- Engineering
	AddTrainer(33612, _G.GetSpellInfo(51302), BZ["Shattrath City"], 43.8, 90.9, NEUTRAL) -- LW
	AddTrainer(33613, _G.GetSpellInfo(51309), BZ["Shattrath City"], 44.0, 91.1, NEUTRAL) -- Tailor
	AddTrainer(33614, _G.GetSpellInfo(51311), BZ["Shattrath City"], 43.6, 90.8, NEUTRAL) -- JC
	AddTrainer(33615, _G.GetSpellInfo(45363), BZ["Shattrath City"], 43.5, 90.7, NEUTRAL) -- Insc
	AddTrainer(33617, _G.GetSpellInfo(32606), BZ["Shattrath City"], 43.6, 90.9, NEUTRAL) -- Mine
	AddTrainer(33619, _G.GetSpellInfo(51296), BZ["Shattrath City"], 43.6, 91.1, NEUTRAL) -- Cooking
	AddTrainer(33621, _G.GetSpellInfo(45542), BZ["Shattrath City"], 43.6, 90.4, NEUTRAL) -- First Aid
	AddTrainer(33631, L["Barien"], BZ["Shattrath City"], 43.5, 65.1, NEUTRAL)
	AddTrainer(33634, L["Engineer Sinbei"], BZ["Shattrath City"], 43.1, 64.9, NEUTRAL)
	AddTrainer(33635, L["Daenril"], BZ["Shattrath City"], 41.9, 63.4, NEUTRAL)
	AddTrainer(33636, L["Miralisse"], BZ["Shattrath City"], 41.6, 63.5, NEUTRAL)
	AddTrainer(33674, L["Alchemist Kanhu"], BZ["Shattrath City"], 38.6, 30.0, NEUTRAL)
	AddTrainer(33675, L["Onodo"], BZ["Shattrath City"], 37.7, 30.3, NEUTRAL)
	AddTrainer(33676, L["Zurii"], BZ["Shattrath City"], 36.4, 44.6, NEUTRAL)
	AddTrainer(33679, L["Recorder Lidio"], BZ["Shattrath City"], 36.2, 44.0, NEUTRAL)
	AddTrainer(33680, L["Nemiha"], BZ["Shattrath City"], 36.1, 47.7, NEUTRAL)
	AddTrainer(33681, L["Korim"], BZ["Shattrath City"], 37.6, 28.0, NEUTRAL)
	AddTrainer(33682, L["Fono"], BZ["Shattrath City"], 36.0, 48.5, NEUTRAL)
	AddTrainer(33684, L["Weaver Aoa"], BZ["Shattrath City"], 37.6, 27.2, NEUTRAL)
	AddTrainer(37072, L["Rogg"], BZ["Orgrimmar"], 44.5, 78.0, HORDE) -- UPDATED
	AddTrainer(44582, L["Theresa Denman"], BZ["Stormwind City"], 63.5, 61.6, ALLIANCE)
	AddTrainer(44781, L["Opuno Ironhorn"], BZ["Orgrimmar"], 40.6, 49.4, HORDE) -- UPDATED
	AddTrainer(44783, L["Hiwahi Three-Feathers"], BZ["Orgrimmar"], 38.8, 50.5, HORDE)
	AddTrainer(45540, L["Krenk Choplimb"], BZ["Orgrimmar"], 37.5, 87.3, HORDE)
	AddTrainer(45548, L["Kark Helmbreaker"], BZ["Orgrimmar"], 36.0, 83.0, HORDE) -- UPDATED
	AddTrainer(45550, L["Zarbo Porkpatty"], BZ["Orgrimmar"], 39.0, 85.8, NEUTRAL)
	AddTrainer(45559, L["Nivi Weavewell"], BZ["Orgrimmar"], 41.1, 79.7, HORDE)
	AddTrainer(46357, L["Gonto"], BZ["Orgrimmar"], 44.57, 78.61, HORDE)
	AddTrainer(46675, L["Lugrah"], BZ["Orgrimmar"], 72.49, 34.31, HORDE) -- UPDATED
	AddTrainer(46709, L["Arugi"], BZ["Orgrimmar"], 56.5, 61.5, HORDE) -- UPDATED
	AddTrainer(46716, L["Nerog"], BZ["Orgrimmar"], 55.2, 56.7, HORDE)
	AddTrainer(47405, L["The Chef"], BZ["Tirisfal Glades"], 61.2, 52.6, HORDE)
	AddTrainer(47418, L["Runda"], BZ["Durotar"], 52.8, 42.0, HORDE)
	AddTrainer(49789, L["Allison"], BZ["Hellfire Peninsula"], 56.8, 37.4, HORDE) -- UPDATED
	AddTrainer(49879, L["Doc Zapnozzle"], BZ["Azshara"], 57.07, 50.71, HORDE) -- UPDATED
	AddTrainer(50574, L["Amelia Atherton"], BZ["Gilneas"], 36.8, 65.7, ALLIANCE)

	self.InitTrainer = nil
end
