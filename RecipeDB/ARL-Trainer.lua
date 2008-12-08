--[[

************************************************************************

ARL-Trainer.lua

Trainer data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten

307 found from data mining.  0 ignored.

************************************************************************

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

************************************************************************

Format:

	self:addLookupList(TrainerDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)

************************************************************************

]]--

local MODNAME			= "Ackis Recipe List"
local addon				= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local L					= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC				= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BZONE				= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS				= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitTrainer(TrainerDB)

	self:addLookupList(TrainerDB,223,L["Dan Golthas"],BZONE["Undercity"],71.24,60.402)
	self:addLookupList(TrainerDB,514,L["Smith Argus"],BZONE["Elwynn Forest"],41.94,65.831)
	self:addLookupList(TrainerDB,957,L["Dane Lindgren"],BZONE["Stormwind City"],64.33,37.311)
	self:addLookupList(TrainerDB,1103,L["Eldrin"],BZONE["Elwynn Forest"],79.63,65.991)
	self:addLookupList(TrainerDB,1215,L["Alchemist Mallory"],BZONE["Elwynn Forest"],40.08,49.391)
	self:addLookupList(TrainerDB,1241,L["Tognus Flintfire"],BZONE["Dun Morogh"],46.06,51.940)
	self:addLookupList(TrainerDB,1246,L["Vosur Brakthel"],BZONE["Ironforge"],67.77,54.251)
	self:addLookupList(TrainerDB,1300,L["Lawrence Schneider"],BZONE["Stormwind City"],53.27,80.971)
	self:addLookupList(TrainerDB,1317,L["Lucan Cordell"],BZONE["Stormwind City"],52.93,73.921)
	self:addLookupList(TrainerDB,1346,L["Georgio Bolero"],BZONE["Stormwind City"],52.99,81.171)
	self:addLookupList(TrainerDB,1355,L["Cook Ghilm"],BZONE["Dun Morogh"],68.36,54.441)
	self:addLookupList(TrainerDB,1382,L["Mudduk"],BZONE["Stranglethorn Vale"],31.98,28.772)
	self:addLookupList(TrainerDB,1383,L["Snarl"],BZONE["Orgrimmar"],79.79,23.442)
	self:addLookupList(TrainerDB,1385,L["Brawn"],BZONE["Stranglethorn Vale"],31.69,29.172)
	self:addLookupList(TrainerDB,1386,L["Rogvar"],BZONE["Swamp of Sorrows"],48.41,55.960)
	self:addLookupList(TrainerDB,1430,L["Tomas"],BZONE["Elwynn Forest"],43.92,65.961)
	self:addLookupList(TrainerDB,1466,L["Gretta Finespindle"],BZONE["Ironforge"],39.90,33.191)
	self:addLookupList(TrainerDB,1470,L["Ghak Healtouch"],BZONE["Loch Modan"],37.17,48.950)
	self:addLookupList(TrainerDB,1632,L["Adele Fielder"],BZONE["Elwynn Forest"],46.69,63.081)
	self:addLookupList(TrainerDB,1676,L["Finbus Geargrind"],BZONE["Duskwood"],77.96,48.061)
	self:addLookupList(TrainerDB,1681,L["Brock Stoneseeker"],BZONE["Loch Modan"],36.93,47.771)
	self:addLookupList(TrainerDB,1699,L["Gremlock Pilsnor"],BZONE["Dun Morogh"],47.64,53.070)
	self:addLookupList(TrainerDB,1701,L["Dank Drizzlecut"],BZONE["Dun Morogh"],69.24,56.761)
	self:addLookupList(TrainerDB,1702,L["Bronk Guzzlegear"],BZONE["Dun Morogh"],49.93,50.640)
	self:addLookupList(TrainerDB,1703,L["Uthrar Threx"],BZONE["Ironforge"],44.05,28.831)
	self:addLookupList(TrainerDB,2132,L["Carolai Anise"],BZONE["Tirisfal Glades"],60.19,53.152)
	self:addLookupList(TrainerDB,2326,L["Thamner Pol"],BZONE["Dun Morogh"],47.24,51.980)
	self:addLookupList(TrainerDB,2327,L["Shaina Fuller"],BZONE["Stormwind City"],52.49,45.281)
	self:addLookupList(TrainerDB,2329,L["Michelle Belle"],BZONE["Elwynn Forest"],42.95,65.851)
	self:addLookupList(TrainerDB,2391,L["Serge Hinott"],BZONE["Hillsbrad Foothills"],61.61,19.142)
	self:addLookupList(TrainerDB,2399,L["Daryl Stack"],BZONE["Hillsbrad Foothills"],63.56,22.122)
	self:addLookupList(TrainerDB,2454,L["Skeletal Fiend (Enraged Form)"],BZONE["Duskwood"],0,00)
	self:addLookupList(TrainerDB,2627,L["Grarnik Goodstitch"],BZONE["Stranglethorn Vale"],28.71,76.830)
	self:addLookupList(TrainerDB,2798,L["Pand Stonebinder"],BZONE["Thunder Bluff"],28.62,22.542)
	self:addLookupList(TrainerDB,2818,L["Slagg"],BZONE["Arathi Highlands"],74.04,32.812)
	self:addLookupList(TrainerDB,2836,L["Brikk Keencraft"],BZONE["Stranglethorn Vale"],29.04,74.970)
	self:addLookupList(TrainerDB,2837,L["Jaxin Chong"],BZONE["Stranglethorn Vale"],27.57,77.710)
	self:addLookupList(TrainerDB,2855,L["Snang"],BZONE["Orgrimmar"],62.86,49.592)
	self:addLookupList(TrainerDB,2857,L["Thund"],BZONE["Orgrimmar"],76.24,24.002)
	self:addLookupList(TrainerDB,2998,L["Karn Stonehoof"],BZONE["Thunder Bluff"],40.20,55.492)
	self:addLookupList(TrainerDB,3001,L["Brek Stonehoof"],BZONE["Thunder Bluff"],35.57,57.522)
	self:addLookupList(TrainerDB,3004,L["Tepa"],BZONE["Thunder Bluff"],43.87,44.942)
	self:addLookupList(TrainerDB,3007,L["Una"],BZONE["Thunder Bluff"],42.37,43.592)
	self:addLookupList(TrainerDB,3008,L["Mak"],BZONE["Thunder Bluff"],43.41,43.172)
	self:addLookupList(TrainerDB,3009,L["Bena Winterhoof"],BZONE["Thunder Bluff"],47.12,34.112)
	self:addLookupList(TrainerDB,3011,L["Teg Dawnstrider"],BZONE["Thunder Bluff"],45.57,40.832)
	self:addLookupList(TrainerDB,3026,L["Aska Mistrunner"],BZONE["Thunder Bluff"],52.05,52.322)
	self:addLookupList(TrainerDB,3067,L["Pyall Silentstride"],BZONE["Mulgore"],46.17,58.512)
	self:addLookupList(TrainerDB,3069,L["Chaw Stronghide"],BZONE["Mulgore"],45.96,58.352)
	self:addLookupList(TrainerDB,3087,L["Crystal Boughman"],BZONE["Redridge Mountains"],22.81,44.341)
	self:addLookupList(TrainerDB,3136,L["Clarise Gnarltree"],BZONE["Duskwood"],73.75,49.821)
	self:addLookupList(TrainerDB,3137,L["Matt Johnson"],BZONE["Duskwood"],74.72,50.081)
	self:addLookupList(TrainerDB,3174,L["Dwukk"],BZONE["Durotar"],52.93,40.752)
	self:addLookupList(TrainerDB,3175,L["Krunn"],BZONE["Durotar"],52.14,41.632)
	self:addLookupList(TrainerDB,3181,L["Fremal Doohickey"],BZONE["Wetlands"],10.83,60.971)
	self:addLookupList(TrainerDB,3184,L["Miao'zan"],BZONE["Durotar"],55.94,74.672)
	self:addLookupList(TrainerDB,3290,L["Deek Fizzlebizz"],BZONE["Loch Modan"],45.69,13.821)
	self:addLookupList(TrainerDB,3345,L["Godan"],BZONE["Orgrimmar"],53.77,37.972)
	self:addLookupList(TrainerDB,3347,L["Yelmak"],BZONE["Orgrimmar"],56.90,33.572)
	self:addLookupList(TrainerDB,3355,L["Saru Steelfury"],BZONE["Orgrimmar"],81.68,23.452)
	self:addLookupList(TrainerDB,3357,L["Makaru"],BZONE["Orgrimmar"],72.96,27.662)
	self:addLookupList(TrainerDB,3363,L["Magar"],BZONE["Orgrimmar"],63.08,50.582)
	self:addLookupList(TrainerDB,3365,L["Karolek"],BZONE["Orgrimmar"],62.85,44.762)
	self:addLookupList(TrainerDB,3373,L["Arnok"],BZONE["Orgrimmar"],34.80,83.612)
	self:addLookupList(TrainerDB,3390,L["Apothecary Helbrim"],BZONE["The Barrens"],52.13,29.952)
	self:addLookupList(TrainerDB,3391,L["Gazlowe"],BZONE["The Barrens"],62.62,35.660)
	self:addLookupList(TrainerDB,3399,L["Zamja"],BZONE["Orgrimmar"],57.88,53.712)
	self:addLookupList(TrainerDB,3412,L["Nogg"],BZONE["Orgrimmar"],76.17,26.262)
	self:addLookupList(TrainerDB,3478,L["Traugh"],BZONE["The Barrens"],51.54,29.412)
	self:addLookupList(TrainerDB,3484,L["Kil'hala"],BZONE["The Barrens"],51.98,31.902)
	self:addLookupList(TrainerDB,3494,L["Tinkerwiz"],BZONE["The Barrens"],63.09,37.120)
	self:addLookupList(TrainerDB,3523,L["Bowen Brisboise"],BZONE["Tirisfal Glades"],52.96,55.260)
	self:addLookupList(TrainerDB,3549,L["Shelene Rhobart"],BZONE["Tirisfal Glades"],65.35,60.492)
	self:addLookupList(TrainerDB,3555,L["Johan Focht"],BZONE["Silverpine Forest"],42.98,41.400)
	self:addLookupList(TrainerDB,3557,L["Guillaume Sorouy"],BZONE["Silverpine Forest"],42.70,41.050)
	self:addLookupList(TrainerDB,3603,L["Cyndra Kindwhisper"],BZONE["Teldrassil"],57.07,59.940)
	self:addLookupList(TrainerDB,3605,L["Nadyia Maneweaver"],BZONE["Teldrassil"],42.06,49.970)
	self:addLookupList(TrainerDB,3606,L["Alanna Raveneye"],BZONE["Teldrassil"],37.39,34.540)
	self:addLookupList(TrainerDB,3703,L["Krulmoo Fullmoon"],BZONE["The Barrens"],44.90,60.052)
	self:addLookupList(TrainerDB,3704,L["Mahani"],BZONE["The Barrens"],45.36,58.982)
	self:addLookupList(TrainerDB,3964,L["Kylanna"],BZONE["Ashenvale"],51.16,66.811)
	self:addLookupList(TrainerDB,3967,L["Aayndia Floralwind"],BZONE["Ashenvale"],36.45,51.931)
	self:addLookupList(TrainerDB,4159,L["Me'lynn"],BZONE["Darnassus"],63.01,23.121)
	self:addLookupList(TrainerDB,4160,L["Ainethil"],BZONE["Darnassus"],55.16,23.621)
	self:addLookupList(TrainerDB,4193,L["Grondal Moonbreeze"],BZONE["Darkshore"],37.78,40.871)
	self:addLookupList(TrainerDB,4210,L["Alegorn"],BZONE["Darnassus"],49.43,20.811)
	self:addLookupList(TrainerDB,4211,L["Dannelor"],BZONE["Darnassus"],52.04,13.321)
	self:addLookupList(TrainerDB,4212,L["Telonis"],BZONE["Darnassus"],64.30,21.941)
	self:addLookupList(TrainerDB,4213,L["Taladan"],BZONE["Darnassus"],59.35,13.501)
	self:addLookupList(TrainerDB,4254,L["Geofram Bouldertoe"],BZONE["Ironforge"],51.03,26.871)
	self:addLookupList(TrainerDB,4258,L["Bengus Deepforge"],BZONE["Ironforge"],52.84,41.841)
	self:addLookupList(TrainerDB,4552,L["Eunice Burch"],BZONE["Undercity"],63.45,43.802)
	self:addLookupList(TrainerDB,4576,L["Josef Gregorian"],BZONE["Undercity"],70.95,30.552)
	self:addLookupList(TrainerDB,4578,L["Josephine Lister"],BZONE["Undercity"],85.48,26.402)
	self:addLookupList(TrainerDB,4586,L["Graham Van Talen"],BZONE["Undercity"],76.41,73.262)
	self:addLookupList(TrainerDB,4588,L["Arthur Moore"],BZONE["Undercity"],70.95,59.282)
	self:addLookupList(TrainerDB,4591,L["Mary Edras"],BZONE["Undercity"],74.04,58.072)
	self:addLookupList(TrainerDB,4596,L["James Van Brunt"],BZONE["Undercity"],61.75,29.822)
	self:addLookupList(TrainerDB,4598,L["Brom Killian"],BZONE["Undercity"],56.04,36.012)
	self:addLookupList(TrainerDB,4605,L["Basil Frye"],BZONE["Undercity"],59.91,28.822)
	self:addLookupList(TrainerDB,4609,L["Doctor Marsh"],BZONE["Undercity"],53.00,73.932)
	self:addLookupList(TrainerDB,4611,L["Doctor Herbert Halsey"],BZONE["Undercity"],47.92,72.832)
	self:addLookupList(TrainerDB,4616,L["Lavinia Crowe"],BZONE["Undercity"],61.53,61.532)
	self:addLookupList(TrainerDB,5127,L["Fimble Finespindle"],BZONE["Ironforge"],40.14,34.131)
	self:addLookupList(TrainerDB,5150,L["Nissa Firestone"],BZONE["Ironforge"],54.81,59.761)
	self:addLookupList(TrainerDB,5153,L["Jormund Stonebrow"],BZONE["Ironforge"],43.00,29.341)
	self:addLookupList(TrainerDB,5157,L["Gimble Thistlefuzz"],BZONE["Ironforge"],60.51,44.991)
	self:addLookupList(TrainerDB,5159,L["Daryl Riknussun"],BZONE["Ironforge"],60.73,37.921)
	self:addLookupList(TrainerDB,5164,L["Grumnus Steelshaper"],BZONE["Ironforge"],50.88,43.111)
	self:addLookupList(TrainerDB,5174,L["Springspindle Fizzlegear"],BZONE["Ironforge"],68.80,45.461)
	self:addLookupList(TrainerDB,5177,L["Tally Berryfizz"],BZONE["Ironforge"],67.43,53.531)
	self:addLookupList(TrainerDB,5392,L["Yarr Hammerstone"],BZONE["Dun Morogh"],50.64,49.970)
	self:addLookupList(TrainerDB,5482,L["Stephen Ryback"],BZONE["Stormwind City"],78.02,52.901)
	self:addLookupList(TrainerDB,5499,L["Lilyssia Nightbreeze"],BZONE["Stormwind City"],55.64,85.951)
	self:addLookupList(TrainerDB,5500,L["Tel'Athir"],BZONE["Stormwind City"],55.97,85.371)
	self:addLookupList(TrainerDB,5511,L["Therum Deepforge"],BZONE["Stormwind City"],63.94,38.121)
	self:addLookupList(TrainerDB,5513,L["Gelman Stonehand"],BZONE["Stormwind City"],59.15,38.211)
	self:addLookupList(TrainerDB,5518,L["Lilliam Sparkspindle"],BZONE["Stormwind City"],62.63,31.051)
	self:addLookupList(TrainerDB,5564,L["Simon Tanner"],BZONE["Stormwind City"],71.84,62.401)
	self:addLookupList(TrainerDB,5567,L["Sellandus"],BZONE["Stormwind City"],52.12,82.951)
	self:addLookupList(TrainerDB,5695,L["Vance Undergloom"],BZONE["Tirisfal Glades"],62.01,52.170)
	self:addLookupList(TrainerDB,5759,L["Nurse Neela"],BZONE["Tirisfal Glades"],62.18,51.910)
	self:addLookupList(TrainerDB,5784,L["Waldor"],BZONE["The Barrens"],46.10,36.170)
	self:addLookupList(TrainerDB,5811,L["Kamari"],BZONE["Orgrimmar"],63.24,45.012)
	self:addLookupList(TrainerDB,5939,L["Vira Younghoof"],BZONE["Mulgore"],46.73,60.832)
	self:addLookupList(TrainerDB,5943,L["Rawrk"],BZONE["Durotar"],53.90,42.992)
	self:addLookupList(TrainerDB,5997,L["Nethergarde Engineer"],BZONE["Blasted Lands"],61.50,7.4621)
	self:addLookupList(TrainerDB,6094,L["Byancie"],BZONE["Teldrassil"],55.63,57.200)
	self:addLookupList(TrainerDB,6286,L["Zarrin"],BZONE["Teldrassil"],57.74,61.640)
	self:addLookupList(TrainerDB,6297,L["Kurdram Stonehammer"],BZONE["Darkshore"],37.82,41.041)
	self:addLookupList(TrainerDB,6299,L["Delfrum Flintbeard"],BZONE["Darkshore"],37.93,41.061)
	self:addLookupList(TrainerDB,7230,L["Shayis Steelfury"],BZONE["Orgrimmar"],80.56,24.612)
	self:addLookupList(TrainerDB,7231,L["Kelgruk Bloodaxe"],BZONE["Orgrimmar"],81.54,20.262)
	self:addLookupList(TrainerDB,7232,L["Borgus Steelhand"],BZONE["Stormwind City"],59.93,35.051)
	self:addLookupList(TrainerDB,7406,L["Oglethorpe Obnoticus"],BZONE["Stranglethorn Vale"],28.36,76.342)
	self:addLookupList(TrainerDB,7866,L["Peter Galen"],BZONE["Azshara"],36.94,66.151)
	self:addLookupList(TrainerDB,7867,L["Thorkaf Dragoneye"],BZONE["Badlands"],62.19,57.742)
	self:addLookupList(TrainerDB,7868,L["Sarah Tanner"],BZONE["Searing Gorge"],63.38,75.291)
	self:addLookupList(TrainerDB,7869,L["Brumn Winterhoof"],BZONE["Arathi Highlands"],28.48,44.312)
	self:addLookupList(TrainerDB,7870,L["Caryssia Moonhunter"],BZONE["Thousand Needles"],9.016,18.781)
	self:addLookupList(TrainerDB,7871,L["Se'Jib"],BZONE["Stranglethorn Vale"],37.20,34.742)
	self:addLookupList(TrainerDB,7944,L["Tinkmaster Overspark"],BZONE["Ironforge"],70.57,50.311)
	self:addLookupList(TrainerDB,7948,L["Kylanna Windwhisper"],BZONE["Feralas"],32.03,44.100)
	self:addLookupList(TrainerDB,7949,L["Xylinnia Starshine"],BZONE["Feralas"],31.73,44.610)
	self:addLookupList(TrainerDB,8126,L["Nixx Sprocketspring"],BZONE["Tanaris"],52.03,27.000)
	self:addLookupList(TrainerDB,8128,L["Pikkle"],BZONE["Tanaris"],50.82,28.750)
	self:addLookupList(TrainerDB,8153,L["Narv Hidecrafter"],BZONE["Desolace"],55.61,55.622)
	self:addLookupList(TrainerDB,8306,L["Duhng"],BZONE["The Barrens"],54.89,31.912)
	self:addLookupList(TrainerDB,8736,L["Buzzek Bracketswing"],BZONE["Tanaris"],52.27,27.250)
	self:addLookupList(TrainerDB,8738,L["Vazario Linkgrease"],BZONE["The Barrens"],63.32,35.980)
	self:addLookupList(TrainerDB,9264,L["Firebrand Pyromancer"],BZONE["Blackrock Spire"],0,00)
	self:addLookupList(TrainerDB,9584,L["Jalane Ayrole"],BZONE["Stormwind City"],40.05,84.761)
	self:addLookupList(TrainerDB,10266,L["Ug'thok"],BZONE["Orgrimmar"],80.25,23.742)
	self:addLookupList(TrainerDB,10276,L["Rotgath Stonebeard"],BZONE["Ironforge"],51.86,43.051)
	self:addLookupList(TrainerDB,10277,L["Groum Stonebeard"],BZONE["Ironforge"],51.94,42.291)
	self:addLookupList(TrainerDB,10278,L["Thrag Stonehoof"],BZONE["Thunder Bluff"],40.21,57.082)
	self:addLookupList(TrainerDB,11017,L["Roxxik"],BZONE["Orgrimmar"],75.85,22.682)
	self:addLookupList(TrainerDB,11025,L["Mukdrak"],BZONE["Durotar"],52.32,41.272)
	self:addLookupList(TrainerDB,11026,L["Sprite Jumpsprocket"],BZONE["Stormwind City"],62.38,31.371)
	self:addLookupList(TrainerDB,11028,L["Jemma Quikswitch"],BZONE["Ironforge"],68.79,44.381)
	self:addLookupList(TrainerDB,11029,L["Trixie Quikswitch"],BZONE["Ironforge"],68.85,45.251)
	self:addLookupList(TrainerDB,11031,L["Franklin Lloyd"],BZONE["Undercity"],76.82,73.892)
	self:addLookupList(TrainerDB,11037,L["Jenna Lemkenilli"],BZONE["Darkshore"],37.87,41.111)
	self:addLookupList(TrainerDB,11041,L["Milla Fairancora"],BZONE["Darnassus"],54.64,22.081)
	self:addLookupList(TrainerDB,11042,L["Sylvanna Forestmoon"],BZONE["Darnassus"],55.84,24.731)
	self:addLookupList(TrainerDB,11044,L["Doctor Martin Felben"],BZONE["Undercity"],47.03,74.652)
	self:addLookupList(TrainerDB,11046,L["Whuut"],BZONE["Orgrimmar"],56.39,34.512)
	self:addLookupList(TrainerDB,11047,L["Kray"],BZONE["Thunder Bluff"],47.73,34.752)
	self:addLookupList(TrainerDB,11048,L["Victor Ward"],BZONE["Undercity"],71.39,29.920)
	self:addLookupList(TrainerDB,11049,L["Rhiannon Davis"],BZONE["Undercity"],71.16,30.092)
	self:addLookupList(TrainerDB,11050,L["Trianna"],BZONE["Darnassus"],63.22,23.051)
	self:addLookupList(TrainerDB,11051,L["Vhan"],BZONE["Thunder Bluff"],43.91,44.512)
	self:addLookupList(TrainerDB,11052,L["Timothy Worthington"],BZONE["Dustwallow Marsh"],65.85,51.271)
	self:addLookupList(TrainerDB,11065,L["Thonys Pillarstone"],BZONE["Ironforge"],60.64,44.861)
	self:addLookupList(TrainerDB,11066,L["Jhag"],BZONE["Orgrimmar"],53.88,38.752)
	self:addLookupList(TrainerDB,11067,L["Malcomb Wynn"],BZONE["Undercity"],61.51,61.282)
	self:addLookupList(TrainerDB,11068,L["Betty Quin"],BZONE["Stormwind City"],52.93,73.881)
	self:addLookupList(TrainerDB,11070,L["Lalina Summermoon"],BZONE["Darnassus"],59.72,13.571)
	self:addLookupList(TrainerDB,11071,L["Mot Dawnstrider"],BZONE["Thunder Bluff"],45.62,40.642)
	self:addLookupList(TrainerDB,11072,L["Kitta Firewind"],BZONE["Elwynn Forest"],65.28,69.981)
	self:addLookupList(TrainerDB,11073,L["Annora"],BZONE["Uldaman"],0,00)
	self:addLookupList(TrainerDB,11074,L["Hgarth"],BZONE["Stonetalon Mountains"],49.04,56.662)
	self:addLookupList(TrainerDB,11081,L["Faldron"],BZONE["Darnassus"],64.59,21.471)
	self:addLookupList(TrainerDB,11083,L["Darianna"],BZONE["Darnassus"],64.93,22.261)
	self:addLookupList(TrainerDB,11084,L["Tarn"],BZONE["Thunder Bluff"],43.22,43.242)
	self:addLookupList(TrainerDB,11096,L["Randal Worth"],BZONE["Stormwind City"],72.11,60.711)
	self:addLookupList(TrainerDB,11097,L["Drakk Stonehand"],BZONE["The Hinterlands"],13.51,43.350)
	self:addLookupList(TrainerDB,11098,L["Hahrana Ironhide"],BZONE["Feralas"],75.03,42.870)
	self:addLookupList(TrainerDB,11146,L["Ironus Coldsteel"],BZONE["Ironforge"],50.96,43.561)
	self:addLookupList(TrainerDB,11177,L["Okothos Ironrager"],BZONE["Orgrimmar"],80.40,23.282)
	self:addLookupList(TrainerDB,11178,L["Borgosh Corebender"],BZONE["Orgrimmar"],80.16,24.532)
	self:addLookupList(TrainerDB,11557,L["Meilosh"],BZONE["Felwood"],66.25,2.9600)
	self:addLookupList(TrainerDB,13445,L["Great-father Winter"],BZONE["Orgrimmar"],0,00)
	self:addLookupList(TrainerDB,15400,L["Arathel Sunforge"],BZONE["Eversong Woods"],59.79,63.232)
	self:addLookupList(TrainerDB,15501,L["Aleinia"],BZONE["Eversong Woods"],47.86,48.022)
	self:addLookupList(TrainerDB,16160,L["Magistrix Eredania"],BZONE["Eversong Woods"],38.73,72.562)
	self:addLookupList(TrainerDB,16161,L["Arcanist Sheynathren"],BZONE["Eversong Woods"],38.11,71.962)
	self:addLookupList(TrainerDB,16253,L["Master Chef Mouldier"],BZONE["Ghostlands"],47.88,31.212)
	self:addLookupList(TrainerDB,16272,L["Kanaria"],BZONE["Eversong Woods"],48.99,46.982)
	self:addLookupList(TrainerDB,16277,L["Quarelestra"],BZONE["Eversong Woods"],49.03,46.932)
	self:addLookupList(TrainerDB,16278,L["Sathein"],BZONE["Eversong Woods"],53.73,52.022)
	self:addLookupList(TrainerDB,16366,L["Sempstress Ambershine"],BZONE["Eversong Woods"],37.33,72.352)
	self:addLookupList(TrainerDB,16583,L["Rohok"],BZONE["Hellfire Peninsula"],53.04,38.260)
	self:addLookupList(TrainerDB,16588,L["Apothecary Antonivich"],BZONE["Hellfire Peninsula"],52.41,35.830)
	self:addLookupList(TrainerDB,16633,L["Sedana"],BZONE["Silvermoon City"],69.83,25.572)
	self:addLookupList(TrainerDB,16634,L["Dolothos"],BZONE["Silvermoon City"],68.62,25.592)
	self:addLookupList(TrainerDB,16639,L["Galana"],BZONE["Silvermoon City"],57.26,50.322)
	self:addLookupList(TrainerDB,16640,L["Keelen Sheets"],BZONE["Silvermoon City"],56.84,50.212)
	self:addLookupList(TrainerDB,16642,L["Camberon"],BZONE["Silvermoon City"],66.87,17.082)
	self:addLookupList(TrainerDB,16643,L["Razia"],BZONE["Silvermoon City"],67.00,18.322)
	self:addLookupList(TrainerDB,16662,L["Alestus"],BZONE["Silvermoon City"],77.78,73.202)
	self:addLookupList(TrainerDB,16663,L["Belil"],BZONE["Silvermoon City"],79.25,41.502)
	self:addLookupList(TrainerDB,16667,L["Danwe"],BZONE["Silvermoon City"],76.69,40.632)
	self:addLookupList(TrainerDB,16668,L["Gloresse"],BZONE["Silvermoon City"],76.18,38.382)
	self:addLookupList(TrainerDB,16669,L["Bemarrin"],BZONE["Silvermoon City"],79.74,39.702)
	self:addLookupList(TrainerDB,16671,L["Mirvedon"],BZONE["Silvermoon City"],80.06,36.822)
	self:addLookupList(TrainerDB,16676,L["Sylann"],BZONE["Silvermoon City"],69.42,70.972)
	self:addLookupList(TrainerDB,16687,L["Talmar"],BZONE["Silvermoon City"],83.06,80.452)
	self:addLookupList(TrainerDB,16688,L["Lynalis"],BZONE["Silvermoon City"],83.77,79.152)
	self:addLookupList(TrainerDB,16703,L["Amin"],BZONE["Silvermoon City"],90.38,74.952)
	self:addLookupList(TrainerDB,16719,L["Mumman"],BZONE["The Exodar"],56.72,28.591)
	self:addLookupList(TrainerDB,16723,L["Lucc"],BZONE["The Exodar"],28.59,61.971)
	self:addLookupList(TrainerDB,16724,L["Miall"],BZONE["The Exodar"],60.71,89.351)
	self:addLookupList(TrainerDB,16725,L["Nahogg"],BZONE["The Exodar"],41.11,39.451)
	self:addLookupList(TrainerDB,16726,L["Ockil"],BZONE["The Exodar"],55.13,91.831)
	self:addLookupList(TrainerDB,16727,L["Padaar"],BZONE["The Exodar"],44.58,25.481)
	self:addLookupList(TrainerDB,16728,L["Akham"],BZONE["The Exodar"],66.53,74.661)
	self:addLookupList(TrainerDB,16729,L["Refik"],BZONE["The Exodar"],63.24,67.871)
	self:addLookupList(TrainerDB,16731,L["Nus"],BZONE["The Exodar"],40.39,24.241)
	self:addLookupList(TrainerDB,16740,L["Edrem"],BZONE["The Exodar"],60.88,87.771)
	self:addLookupList(TrainerDB,16741,L["Deriz"],BZONE["The Exodar"],28.83,61.641)
	self:addLookupList(TrainerDB,16742,L["Kudrii"],BZONE["The Exodar"],39.73,39.201)
	self:addLookupList(TrainerDB,16743,L["Ghermas"],BZONE["The Exodar"],55.99,90.531)
	self:addLookupList(TrainerDB,16745,L["Feruul"],BZONE["The Exodar"],66.36,74.541)
	self:addLookupList(TrainerDB,16746,L["Kayaart"],BZONE["The Exodar"],63.26,69.141)
	self:addLookupList(TrainerDB,16752,L["Muaat"],BZONE["The Exodar"],60.41,87.951)
	self:addLookupList(TrainerDB,16823,L["Humphry"],BZONE["Hellfire Peninsula"],57.20,64.441)
	self:addLookupList(TrainerDB,17214,L["Anchorite Fateema"],BZONE["Bloodmyst Isle"],53.83,55.021)
	self:addLookupList(TrainerDB,17215,L["Daedal"],BZONE["Bloodmyst Isle"],53.82,55.141)
	self:addLookupList(TrainerDB,17222,L["Artificer Daelo"],BZONE["Azuremyst Isle"],49.14,51.110)
	self:addLookupList(TrainerDB,17245,L["Blacksmith Calypso"],BZONE["Azuremyst Isle"],46.72,70.591)
	self:addLookupList(TrainerDB,17246,L["\"Cookie\" McWeaksauce"],BZONE["Bloodmyst Isle"],53.90,56.071)
	self:addLookupList(TrainerDB,17424,L["Anchorite Paetheus"],BZONE["Bloodmyst Isle"],55.11,54.781)
	self:addLookupList(TrainerDB,17442,L["Moordo"],BZONE["Azuremyst Isle"],45.14,23.711)
	self:addLookupList(TrainerDB,17487,L["Erin Kelly"],BZONE["Azuremyst Isle"],46.86,70.091)
	self:addLookupList(TrainerDB,17488,L["Dulvi"],BZONE["Azuremyst Isle"],49.15,51.691)
	self:addLookupList(TrainerDB,17634,L["K. Lee Smallfry"],BZONE["Zangarmarsh"],69.17,49.860)
	self:addLookupList(TrainerDB,17637,L["Mack Diver"],BZONE["Zangarmarsh"],34.38,51.472)
	self:addLookupList(TrainerDB,18747,L["Krugosh"],BZONE["Hellfire Peninsula"],55.29,38.020)
	self:addLookupList(TrainerDB,18749,L["Dalinna"],BZONE["Undercity"],44.60,36.260)
	self:addLookupList(TrainerDB,18751,L["Kalaen"],BZONE["Undercity"],55.74,45.330)
	self:addLookupList(TrainerDB,18752,L["Zebig"],BZONE["Hellfire Peninsula"],55.17,38.082)
	self:addLookupList(TrainerDB,18753,L["Felannia"],BZONE["Hellfire Peninsula"],52.38,35.990)
	self:addLookupList(TrainerDB,18754,L["Barim Spilthoof"],BZONE["Hellfire Peninsula"],56.35,38.390)
	self:addLookupList(TrainerDB,18771,L["Brumman"],BZONE["Hellfire Peninsula"],54.61,64.931)
	self:addLookupList(TrainerDB,18772,L["Hama"],BZONE["Hellfire Peninsula"],53.99,63.580)
	self:addLookupList(TrainerDB,18773,L["Johan Barnes"],BZONE["Hellfire Peninsula"],53.69,65.771)
	self:addLookupList(TrainerDB,18774,L["Tatiana"],BZONE["Ironforge"],39.16,37.380)
	self:addLookupList(TrainerDB,18775,L["Lebowski"],BZONE["Hellfire Peninsula"],56.06,64.901)
	self:addLookupList(TrainerDB,18779,L["Hurnak Grimmord"],BZONE["Hellfire Peninsula"],57.16,63.730)
	self:addLookupList(TrainerDB,18802,L["Alchemist Gribble"],BZONE["Hellfire Peninsula"],53.97,66.020)
	self:addLookupList(TrainerDB,18804,L["Prospector Nachlan"],BZONE["Bloodmyst Isle"],55.98,55.071)
	self:addLookupList(TrainerDB,18987,L["Gaston"],BZONE["Eastern Plaguelands"],50.35,48.060)
	self:addLookupList(TrainerDB,18988,L["Baxter"],BZONE["Silvermoon City"],44.59,36.270)
	self:addLookupList(TrainerDB,18993,L["Naka"],BZONE["Silvermoon City"],28.52,34.340)
	self:addLookupList(TrainerDB,19052,L["Lorokeem"],BZONE["Shattrath City"],46.13,21.650)
	self:addLookupList(TrainerDB,19063,L["Hamanar"],BZONE["Shattrath City"],36.09,20.040)
	self:addLookupList(TrainerDB,19184,L["Mildred Fletcher"],BZONE["Shattrath City"],65.98,14.620)
	self:addLookupList(TrainerDB,19185,L["Jack Trapper"],BZONE["Shattrath City"],63.49,69.370)
	self:addLookupList(TrainerDB,19186,L["Kylene"],BZONE["Shattrath City"],75.84,32.840)
	self:addLookupList(TrainerDB,19187,L["Darmari"],BZONE["Shattrath City"],67.24,66.660)
	self:addLookupList(TrainerDB,19248,L["Enchanter Salias"],BZONE["Shattrath City"],44.28,90.770)
	self:addLookupList(TrainerDB,19249,L["Enchantress Metura"],BZONE["Shattrath City"],43.90,90.390)
	self:addLookupList(TrainerDB,19250,L["Enchanter Aeldron"],BZONE["Shattrath City"],43.98,90.340)
	self:addLookupList(TrainerDB,19251,L["Enchantress Volali"],BZONE["Shattrath City"],43.45,91.950)
	self:addLookupList(TrainerDB,19252,L["High Enchanter Bardolan"],BZONE["Shattrath City"],43.64,92.010)
	self:addLookupList(TrainerDB,19341,L["Grutah"],BZONE["Shadowmoon Valley"],30.30,31.000)
	self:addLookupList(TrainerDB,19369,L["Celie Steelwing"],BZONE["Shadowmoon Valley"],37.20,57.980)
	self:addLookupList(TrainerDB,19478,L["Fera Palerunner"],BZONE["Blade's Edge Mountains"],53.90,55.182)
	self:addLookupList(TrainerDB,19539,L["Jazdalaad"],BZONE["Netherstorm"],44.08,34.780)
	self:addLookupList(TrainerDB,19540,L["Asarnan"],BZONE["Netherstorm"],44.75,34.420)
	self:addLookupList(TrainerDB,19576,L["Xyrol"],BZONE["Netherstorm"],33.12,66.780)
	self:addLookupList(TrainerDB,19775,L["Kalinda"],BZONE["Silvermoon City"],90.52,67.992)
	self:addLookupList(TrainerDB,19778,L["Farii"],BZONE["The Exodar"],44.73,25.531)
	self:addLookupList(TrainerDB,20124,L["Kradu Grimblade"],BZONE["Shattrath City"],70.24,43.220)
	self:addLookupList(TrainerDB,20125,L["Zula Slagfury"],BZONE["Shattrath City"],70.36,43.760)
	self:addLookupList(TrainerDB,21087,L["Grikka"],BZONE["Blade's Edge Mountains"],77.02,65.632)
	self:addLookupList(TrainerDB,22477,L["Anchorite Ensham"],BZONE["Terokkar Forest"],31.07,75.960)
	self:addLookupList(TrainerDB,22823,L["Hch'uu"],BZONE["Zangarmarsh"],19.78,52.030)
	self:addLookupList(TrainerDB,22827,L["Gorgolon the All-seeing"],BZONE["Blade's Edge Mountains"],0,00)
	self:addLookupList(TrainerDB,22834,L["Clintar Dreamwalker"],BZONE["Moonglade"],75.27,66.730)
	self:addLookupList(TrainerDB,22835,L["Cenarion Dreamwarden"],BZONE["Moonglade"],71.51,61.670)
	self:addLookupList(TrainerDB,22848,L["Storm Fury"],BZONE["Black Temple"],0,00)
	self:addLookupList(TrainerDB,22853,L["Illidari Defiler"],BZONE["Black Temple"],0,00)
	self:addLookupList(TrainerDB,22861,L["Lightsworn Vindicator"],BZONE["Ironforge"],53.31,60.430)
	self:addLookupList(TrainerDB,24315,L["Ancient Female Vrykul"],BZONE["Howling Fjord"],60.42,49.800)
	self:addLookupList(TrainerDB,26907,L["Tisha Longbridge"],BZONE["Howling Fjord"],60.19,64.071)
	self:addLookupList(TrainerDB,26955,L["Jamesina Watterly"],BZONE["Howling Fjord"],78.23,31.972)
	self:addLookupList(TrainerDB,26991,L["Sock Brightbolt"],BZONE["Borean Tundra"],57.99,71.981)
	self:addLookupList(TrainerDB,28471,L["Lady Alistra"],L["Unknown Zone"],0,01)
	self:addLookupList(TrainerDB,28472,L["Lord Thorval"],L["Unknown Zone"],0,01)
	self:addLookupList(TrainerDB,28474,L["Amal'thazad"],L["Unknown Zone"],0,00)
	self:addLookupList(TrainerDB,28697,L["Justin Oshenko"],BZONE["Dalaran"],39.19,26.170)
	self:addLookupList(TrainerDB,29194,L["Amal'thazad"],BZONE["Eastern Plaguelands"],80.60,46.171)
	self:addLookupList(TrainerDB,29195,L["Lady Alistra"],BZONE["Eastern Plaguelands"],83.69,43.891)
	self:addLookupList(TrainerDB,29196,L["Lord Thorval"],BZONE["Eastern Plaguelands"],81.02,42.791)
	self:addLookupList(TrainerDB,31084,L["Highlord Darion Mograine"],BZONE["Eastern Plaguelands"],83.16,44.791)

end
