--[[

************************************************************************

ARL-Alchemy.lua

Alchemy data for all of Ackis Recipe List

Auto-generated using ARLDataminer.rb
Entries to this file will be overwritten
243 found from data mining.
5 ignored.

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

function addon:InitAlchemy(RecipeDB)

	local recipecount = 0

	-- Elixir of Lion's Strength -- 2329
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2329,15,2454,1,2259)
	self:addTradeFlags(RecipeDB,2329,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2329,1,2454,8,8)

	-- Minor Healing Potion -- 2330
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2330,15,118,1,2259)
	self:addTradeFlags(RecipeDB,2330,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2330,8,8)

	-- Minor Mana Potion -- 2331
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2331,25,2455,1,2259)
	self:addTradeFlags(RecipeDB,2331,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2331,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052)

	-- Minor Rejuvenation Potion -- 2332
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2332,30,2456,1,2259)
	self:addTradeFlags(RecipeDB,2332,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2332,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052)

	-- Elixir of Lesser Agility -- 2333
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2333,140,3390,2,2259)
	self:addTradeFlags(RecipeDB,2333,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2333,7,2,1,3390,8,8)

	-- Elixir of Minor Fortitude -- 2334
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2334,40,2458,1,2259)
	self:addTradeFlags(RecipeDB,2334,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2334,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052)

	-- Swiftness Potion -- 2335
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2335,60,2459,2,2259)
	self:addTradeFlags(RecipeDB,2335,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2335,7,2)

	-- Elixir of Tongues -- 2336
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,2336,60,2460,1,2259)
	--self:addTradeFlags(RecipeDB,2336,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lesser Healing Potion -- 2337
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,2337,45,858,1,2259)
	self:addTradeFlags(RecipeDB,2337,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2337,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052)

	-- Weak Troll's Blood Elixir -- 3170
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3170,20,3382,1,2259)
	self:addTradeFlags(RecipeDB,3170,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3170,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052)

	-- Elixir of Wisdom -- 3171
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3171,80,3383,1,2259)
	self:addTradeFlags(RecipeDB,3171,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3171,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Minor Magic Resistance Potion -- 3172
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3172,110,3384,1,2259)
	self:addTradeFlags(RecipeDB,3172,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3172,7,1)

	-- Lesser Mana Potion -- 3173
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3173,105,3385,1,2259)
	self:addTradeFlags(RecipeDB,3173,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3173,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Potion of Curing -- 3174
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3174,120,3386,1,2259)
	self:addTradeFlags(RecipeDB,3174,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3174,7,1)

	-- Limited Invulnerability Potion -- 3175
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3175,250,3387,2,2259)
	self:addTradeFlags(RecipeDB,3175,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3175,7,2)

	-- Strong Troll's Blood Elixir -- 3176
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3176,110,3388,1,2259)
	self:addTradeFlags(RecipeDB,3176,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3176,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Elixir of Defense -- 3177
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3177,115,3389,1,2259)
	self:addTradeFlags(RecipeDB,3177,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3177,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Elixir of Ogre's Strength -- 3188
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3188,150,3391,1,2259)
	self:addTradeFlags(RecipeDB,3188,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3188,7,1,1,3391)

	-- Elixir of Minor Agility -- 3230
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3230,50,2457,2,2259)
	self:addTradeFlags(RecipeDB,3230,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3230,7,2)

	-- Healing Potion -- 3447
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3447,95,929,1,2259)
	self:addTradeFlags(RecipeDB,3447,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3447,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Lesser Invisibility Potion -- 3448
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3448,145,3823,1,2259)
	self:addTradeFlags(RecipeDB,3448,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3448,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Shadow Oil -- 3449
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3449,165,3824,1,2259)
	self:addTradeFlags(RecipeDB,3449,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3449,2,2481,2,4878)

	-- Elixir of Fortitude -- 3450
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3450,175,3825,1,2259)
	self:addTradeFlags(RecipeDB,3450,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3450,7,1,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Mighty Troll's Blood Elixir -- 3451
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3451,180,3826,1,2259)
	self:addTradeFlags(RecipeDB,3451,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3451,7,1)

	-- Mana Potion -- 3452
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3452,140,3827,1,2259)
	self:addTradeFlags(RecipeDB,3452,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3452,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Detect Lesser Invisibility -- 3453
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3453,195,3828,2,2259)
	self:addTradeFlags(RecipeDB,3453,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3453,7,2)

	-- Frost Oil -- 3454
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,3454,200,3829,2,2259)
	self:addTradeFlags(RecipeDB,3454,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3454,2,2480)

	-- Discolored Healing Potion -- 4508
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,4508,50,4596,2,2259)
	self:addTradeFlags(RecipeDB,4508,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,4508,4,429)

	-- Lesser Stoneshield Potion -- 4942
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,4942,215,4623,1,2259)
	self:addTradeFlags(RecipeDB,4942,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,4942,4,715)

	-- Rage Potion -- 6617
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6617,60,5631,1,2259)
	self:addTradeFlags(RecipeDB,6617,1,2,4,30,36,40)
	self:addTradeAcquire(RecipeDB,6617,2,1669,2,1685,2,3335,2,3499)

	-- Great Rage Potion -- 6618
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6618,175,5633,1,2259)
	self:addTradeFlags(RecipeDB,6618,1,2,4,30,36,40)
	self:addTradeAcquire(RecipeDB,6618,2,3335,2,4226)

	-- Free Action Potion -- 6624
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,6624,150,5634,1,2259)
	self:addTradeFlags(RecipeDB,6624,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6624,2,3348,2,4226)

	-- Elixir of Water Breathing -- 7179
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7179,80,5996,1,2259)
	self:addTradeFlags(RecipeDB,7179,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7179,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Greater Healing Potion -- 7181
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7181,135,1710,1,2259)
	self:addTradeFlags(RecipeDB,7181,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7181,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Minor Defense -- 7183
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7183,15,5997,1,2259)
	self:addTradeFlags(RecipeDB,7183,1,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7183,1,5997)

	-- Holy Protection Potion -- 7255
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7255,100,6051,1,2259)
	self:addTradeFlags(RecipeDB,7255,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7255,2,3490)

	-- Shadow Protection Potion -- 7256
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7256,135,6048,1,2259)
	self:addTradeFlags(RecipeDB,7256,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7256,2,3956)

	-- Fire Protection Potion -- 7257
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7257,165,6049,1,2259)
	self:addTradeFlags(RecipeDB,7257,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7257,2,2380)

	-- Frost Protection Potion -- 7258
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7258,190,6050,1,2259)
	self:addTradeFlags(RecipeDB,7258,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Nature Protection Potion -- 7259
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7259,190,6052,1,2259)
	self:addTradeFlags(RecipeDB,7259,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7259,2,8157)

	-- Blackmouth Oil -- 7836
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7836,60,6370,1,2259)
	self:addTradeFlags(RecipeDB,7836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7836,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Fire Oil -- 7837
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7837,130,6371,1,2259)
	self:addTradeFlags(RecipeDB,7837,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7837,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Swim Speed Potion -- 7841
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7841,90,6372,1,2259)
	self:addTradeFlags(RecipeDB,7841,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7841,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Elixir of Firepower -- 7845
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,7845,125,6373,1,2259)
	self:addTradeFlags(RecipeDB,7845,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7845,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052)

	-- Elixir of Giant Growth -- 8240
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,8240,90,6662,2,2259)
	self:addTradeFlags(RecipeDB,8240,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8240,7,2)

	-- Greater Mana Potion -- 11448
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11448,180,6149,1,2259)
	self:addTradeFlags(RecipeDB,11448,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11448,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Agility -- 11449
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11449,165,8949,1,2259)
	self:addTradeFlags(RecipeDB,11449,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11449,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Greater Defense -- 11450
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11450,175,8951,1,2259)
	self:addTradeFlags(RecipeDB,11450,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11450,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Oil of Immolation -- 11451
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11451,180,8956,1,2259)
	self:addTradeFlags(RecipeDB,11451,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11451,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Restorative Potion -- 11452
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11452,185,9030,1,2259)
	self:addTradeFlags(RecipeDB,11452,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Magic Resistance Potion -- 11453
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11453,210,9036,2,2259)
	self:addTradeFlags(RecipeDB,11453,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11453,7,2)

	-- Goblin Rocket Fuel -- 11456
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11456,210,9061,1,2259)
	self:addTradeFlags(RecipeDB,11456,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Superior Healing Potion -- 11457
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11457,190,3928,1,2259)
	self:addTradeFlags(RecipeDB,11457,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11457,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Wildvine Potion -- 11458
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11458,225,9144,2,2259)
	self:addTradeFlags(RecipeDB,11458,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11458,7,2)

	-- Philosopher's Stone -- 11459
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11459,225,9149,1,2259)
	self:addTradeFlags(RecipeDB,11459,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,11459,2,5594)

	-- Elixir of Detect Undead -- 11460
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11460,205,9154,1,2259)
	self:addTradeFlags(RecipeDB,11460,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11460,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Arcane Elixir -- 11461
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11461,210,9155,1,2259)
	self:addTradeFlags(RecipeDB,11461,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11461,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Invisibility Potion -- 11464
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11464,235,9172,2,2259)
	self:addTradeFlags(RecipeDB,11464,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11464,7,2)

	-- Elixir of Greater Intellect -- 11465
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11465,210,9179,1,2259)
	self:addTradeFlags(RecipeDB,11465,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11465,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Gift of Arthas -- 11466
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11466,240,9088,2,2259)
	self:addTradeFlags(RecipeDB,11466,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11466,3,1783,3,1791,3,1815)

	-- Elixir of Greater Agility -- 11467
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11467,215,9187,1,2259)
	self:addTradeFlags(RecipeDB,11467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11467,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Dream Vision -- 11468
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11468,240,9197,2,2259)
	self:addTradeFlags(RecipeDB,11468,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11468,3,1822,3,4467,3,5474,3,5481,3,5714,3,10184,3,12397)

	-- Elixir of Giants -- 11472
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11472,245,9206,2,2259)
	self:addTradeFlags(RecipeDB,11472,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11472,7,2)

	-- Ghost Dye -- 11473
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11473,245,9210,1,2259)
	self:addTradeFlags(RecipeDB,11473,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11473,2,8157,2,8158)

	-- Elixir of Shadow Power -- 11476
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11476,250,9264,2,2259)
	self:addTradeFlags(RecipeDB,11476,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11476,1,9264)

	-- Elixir of Demonslaying -- 11477
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11477,250,9224,1,2259)
	self:addTradeFlags(RecipeDB,11477,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Detect Demon -- 11478
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11478,225,9233,1,2259)
	self:addTradeFlags(RecipeDB,11478,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11478,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Transmute: Iron to Gold -- 11479
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11479,225,3577,1,2259)
	self:addTradeFlags(RecipeDB,11479,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11479,2,5594)

	-- Transmute: Mithril to Truesilver -- 11480
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,11480,225,6037,1,2259)
	self:addTradeFlags(RecipeDB,11480,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11480,2,5594)

	-- Catseye Elixir -- 12609
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,12609,180,10592,1,2259)
	self:addTradeFlags(RecipeDB,12609,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12609,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Dreamless Sleep Potion -- 15833
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,15833,205,12190,1,2259)
	self:addTradeFlags(RecipeDB,15833,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,15833,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Transmute: Arcanite -- 17187
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17187,275,12360,1,2259)
	self:addTradeFlags(RecipeDB,17187,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17187,2,5594)

	-- Stonescale Oil -- 17551
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17551,240,13423,1,2259)
	self:addTradeFlags(RecipeDB,17551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17551,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Mighty Rage Potion -- 17552
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17552,255,13442,2,2259)
	self:addTradeFlags(RecipeDB,17552,1,2,3,30,36,40)
	self:addTradeAcquire(RecipeDB,17552,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Superior Mana Potion -- 17553
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17553,260,13443,1,2259)
	self:addTradeFlags(RecipeDB,17553,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17553,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Superior Defense -- 17554
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17554,265,13445,1,2259)
	self:addTradeFlags(RecipeDB,17554,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17554,1,13445,2,3348)

	-- Elixir of the Sages -- 17555
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17555,270,13447,2,2259)
	self:addTradeFlags(RecipeDB,17555,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17555,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Major Healing Potion -- 17556
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17556,275,13446,1,2259)
	self:addTradeFlags(RecipeDB,17556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17556,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Elixir of Brute Force -- 17557
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17557,275,13453,2,2259)
	self:addTradeFlags(RecipeDB,17557,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17557,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Transmute: Air to Fire -- 17559
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17559,275,7078,2,2259)
	self:addTradeFlags(RecipeDB,17559,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB,17559,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Transmute: Fire to Earth -- 17560
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17560,275,7076,2,2259)
	self:addTradeFlags(RecipeDB,17560,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17560,2,9499)

	-- Transmute: Earth to Water -- 17561
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17561,275,7080,2,2259)
	self:addTradeFlags(RecipeDB,17561,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB,17561,6,576,1,11557)

	-- Transmute: Water to Air -- 17562
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17562,275,7082,2,2259)
	self:addTradeFlags(RecipeDB,17562,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17562,2,11278)

	-- Transmute: Undeath to Water -- 17563
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17563,275,7080,2,2259)
	self:addTradeFlags(RecipeDB,17563,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17563,3,9543,3,10184)

	-- Transmute: Water to Undeath -- 17564
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17564,275,12808,2,2259)
	self:addTradeFlags(RecipeDB,17564,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17564,3,6518,3,10184,3,10264)

	-- Transmute: Life to Earth -- 17565
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17565,275,7076,2,2259)
	self:addTradeFlags(RecipeDB,17565,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17565,3,8896,3,10184)

	-- Transmute: Earth to Life -- 17566
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17566,275,12803,2,2259)
	self:addTradeFlags(RecipeDB,17566,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17566,3,10184)

	-- Greater Stoneshield Potion -- 17570
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17570,280,13455,2,2259)
	self:addTradeFlags(RecipeDB,17570,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17570,7,2)

	-- Elixir of the Mongoose -- 17571
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17571,280,13452,2,2259)
	self:addTradeFlags(RecipeDB,17571,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17571,3,6201,3,7106,3,8959)

	-- Purification Potion -- 17572
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17572,285,13462,2,2259)
	self:addTradeFlags(RecipeDB,17572,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17572,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Greater Arcane Elixir -- 17573
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17573,285,13454,2,2259)
	self:addTradeFlags(RecipeDB,17573,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17573,1,1386,1,7948,1,16588,1,18802,1,19052)

	-- Greater Fire Protection Potion -- 17574
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17574,290,13457,2,2259)
	self:addTradeFlags(RecipeDB,17574,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17574,3,9262,3,9264)

	-- Greater Frost Protection Potion -- 17575
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17575,290,13456,2,2259)
	self:addTradeFlags(RecipeDB,17575,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17575,3,7428,3,7445,3,7446,3,7448,3,7458)

	-- Greater Nature Protection Potion -- 17576
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17576,290,13458,2,2259)
	self:addTradeFlags(RecipeDB,17576,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17576,3,1812,3,1813)

	-- Greater Arcane Protection Potion -- 17577
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17577,290,13461,2,2259)
	self:addTradeFlags(RecipeDB,17577,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17577,3,7435,3,7436,3,7437,3,7443,3,10659,3,10660,3,10661,3,10662)

	-- Greater Shadow Protection Potion -- 17578
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17578,290,13459,2,2259)
	self:addTradeFlags(RecipeDB,17578,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17578,3,8546,3,8550)

	-- Greater Holy Protection Potion -- 17579
	--recipecount = recipecount + 1
	--self:addTradeSkill(RecipeDB,17579,265,13460,1,2259)
	--self:addTradeFlags(RecipeDB,17579,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Major Mana Potion -- 17580
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17580,295,13444,2,2259)
	self:addTradeFlags(RecipeDB,17580,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17580,3,1853,2,11278)

	-- Alchemist's Stone -- 17632
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17632,350,13503,1,2259)
	self:addTradeFlags(RecipeDB,17632,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63,111)
	self:addTradeAcquire(RecipeDB,17632,6,935,3,21432)

	-- Flask of Petrification -- 17634
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17634,300,13506,2,2259)
	self:addTradeFlags(RecipeDB,17634,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17634,3,9692,3,10184,3,10381)

	-- Flask of the Titans -- 17635
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17635,300,13510,2,2259)
	self:addTradeFlags(RecipeDB,17635,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17635,3,10363)

	-- Flask of Distilled Wisdom -- 17636
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17636,300,13511,2,2259)
	self:addTradeFlags(RecipeDB,17636,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of Supreme Power -- 17637
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17637,300,13512,2,2259)
	self:addTradeFlags(RecipeDB,17637,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17637,3,10508)

	-- Flask of Chromatic Resistance -- 17638
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,17638,300,13513,2,2259)
	self:addTradeFlags(RecipeDB,17638,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17638,3,10339)

	-- Elixir of Frost Power -- 21923
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,21923,190,17708,1,2259)
	self:addTradeFlags(RecipeDB,21923,3,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21923,5,1)

	-- Major Rejuvenation Potion -- 22732
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22732,300,18253,3,2259)
	self:addTradeFlags(RecipeDB,22732,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22732,3,11982,3,11988,3,12056,3,12057,3,12118,3,12259)

	-- Elixir of Greater Water Breathing -- 22808
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,22808,190,18294,1,2259)
	self:addTradeFlags(RecipeDB,22808,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22808,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052)

	-- Gurubashi Mojo Madness -- 24266
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24266,300,19931,3,2259)
	self:addTradeFlags(RecipeDB,24266,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mageblood Elixir -- 24365
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24365,275,20007,1,2259)
	self:addTradeFlags(RecipeDB,24365,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24365,6,270,3,14921)

	-- Greater Dreamless Sleep Potion -- 24366
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24366,275,20002,1,2259)
	self:addTradeFlags(RecipeDB,24366,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24366,6,270,1,14921)

	-- Living Action Potion -- 24367
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24367,285,20008,1,2259)
	self:addTradeFlags(RecipeDB,24367,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24367,6,270,4,14921)

	-- Major Troll's Blood Elixir -- 24368
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,24368,290,20004,1,2259)
	self:addTradeFlags(RecipeDB,24368,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24368,6,270,2,14921)

	-- Transmute: Elemental Fire -- 25146
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,25146,300,7068,1,2259)
	self:addTradeFlags(RecipeDB,25146,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,98)
	self:addTradeAcquire(RecipeDB,25146,6,59,1,12944)

	-- Elixir of Greater Firepower -- 26277
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,26277,250,21546,2,2259)
	self:addTradeFlags(RecipeDB,26277,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26277,3,5843,3,5844,3,5846,3,8637,3,9318)

	-- Elixir of Camouflage -- 28543
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28543,305,22823,1,2259)
	self:addTradeFlags(RecipeDB,28543,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28543,1,22823,2,16588,2,16641,2,16705,2,18802)

	-- Elixir of Major Strength -- 28544
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28544,305,22824,1,2259)
	self:addTradeFlags(RecipeDB,28544,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28544,1,16588,1,18802,1,19052)

	-- Elixir of Healing Power -- 28545
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28545,310,22825,1,2259)
	self:addTradeFlags(RecipeDB,28545,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28545,1,16588,1,18802,1,19052)

	-- Sneaking Potion -- 28546
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28546,315,22826,1,2259)
	self:addTradeFlags(RecipeDB,28546,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28546,2,18017,2,19042)

	-- Elixir of Major Frost Power -- 28549
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28549,320,22827,1,2259)
	self:addTradeFlags(RecipeDB,28549,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28549,1,22827,2,18005,2,18017)

	-- Insane Strength Potion -- 28550
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28550,320,22828,2,2259)
	self:addTradeFlags(RecipeDB,28550,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28550,7,2)

	-- Super Healing Potion -- 28551
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28551,325,22829,1,2259)
	self:addTradeFlags(RecipeDB,28551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28551,1,16588,1,18802,1,19052)

	-- Elixir of the Searching Eye -- 28552
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28552,325,22830,2,2259)
	self:addTradeFlags(RecipeDB,28552,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28552,7,2)

	-- Elixir of Major Agility -- 28553
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28553,330,22831,1,2259)
	self:addTradeFlags(RecipeDB,28553,1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,28553,6,946,2,17657)

	-- Shrouding Potion -- 28554
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28554,335,22871,2,2259)
	self:addTradeFlags(RecipeDB,28554,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB,28554,6,970,4,18382)

	-- Super Mana Potion -- 28555
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28555,340,22832,1,2259)
	self:addTradeFlags(RecipeDB,28555,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28555,2,18005,2,19837)

	-- Elixir of Major Firepower -- 28556
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28556,345,22833,2,2259)
	self:addTradeFlags(RecipeDB,28556,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB,28556,6,934,3,19331)

	-- Elixir of Major Defense -- 28557
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28557,345,22834,1,2259)
	self:addTradeFlags(RecipeDB,28557,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28557,1,22834,2,18005,2,19837)

	-- Elixir of Major Shadow Power -- 28558
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28558,350,22835,2,2259)
	self:addTradeFlags(RecipeDB,28558,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,107)
	self:addTradeAcquire(RecipeDB,28558,1,22835,6,1011,3,21655)

	-- Major Dreamless Sleep Potion -- 28562
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28562,350,22836,1,2259)
	self:addTradeFlags(RecipeDB,28562,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28562,2,19042,2,19837)

	-- Heroic Potion -- 28563
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28563,350,22837,2,2259)
	self:addTradeFlags(RecipeDB,28563,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28563,7,2)

	-- Haste Potion -- 28564
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28564,350,22838,2,2259)
	self:addTradeFlags(RecipeDB,28564,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28564,7,2)

	-- Destruction Potion -- 28565
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28565,350,22839,2,2259)
	self:addTradeFlags(RecipeDB,28565,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28565,7,2)

	-- Transmute: Primal Air to Fire -- 28566
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28566,350,21884,2,2259)
	self:addTradeFlags(RecipeDB,28566,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB,28566,6,935,3,21432)

	-- Transmute: Primal Earth to Water -- 28567
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28567,350,21885,2,2259)
	self:addTradeFlags(RecipeDB,28567,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB,28567,6,970,3,18382)

	-- Transmute: Primal Fire to Earth -- 28568
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28568,350,22452,2,2259)
	self:addTradeFlags(RecipeDB,28568,2,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB,28568,6,941,3,20241)

	-- Transmute: Primal Water to Air -- 28569
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28569,350,22451,2,2259)
	self:addTradeFlags(RecipeDB,28569,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,28569,6,942,3,17904)

	-- Elixir of Major Mageblood -- 28570
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28570,355,22840,2,2259)
	self:addTradeFlags(RecipeDB,28570,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28570,7,2)

	-- Major Fire Protection Potion -- 28571
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28571,360,22841,2,2259)
	self:addTradeFlags(RecipeDB,28571,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28571,3,19168,3,19221)

	-- Major Frost Protection Potion -- 28572
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28572,360,22842,2,2259)
	self:addTradeFlags(RecipeDB,28572,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28572,3,18344)

	-- Major Nature Protection Potion -- 28573
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28573,360,22844,1,2259)
	self:addTradeFlags(RecipeDB,28573,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,28573,6,942,4,17904)

	-- Major Arcane Protection Potion -- 28575
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28575,360,22845,2,2259)
	self:addTradeFlags(RecipeDB,28575,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28575,3,17150)

	-- Major Shadow Protection Potion -- 28576
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28576,360,22846,2,2259)
	self:addTradeFlags(RecipeDB,28576,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28576,3,21302)

	-- Major Holy Protection Potion -- 28577
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28577,360,22847,2,2259)
	self:addTradeFlags(RecipeDB,28577,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28577,3,19973)

	-- Elixir of Empowerment -- 28578
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28578,365,22848,2,2259)
	self:addTradeFlags(RecipeDB,28578,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28578,7,2,1,22848)

	-- Ironshield Potion -- 28579
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28579,365,22849,2,2259)
	self:addTradeFlags(RecipeDB,28579,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28579,3,17862)

	-- Transmute: Primal Shadow to Water -- 28580
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28580,370,21885,2,2259)
	self:addTradeFlags(RecipeDB,28580,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28580,8,3)

	-- Transmute: Primal Water to Shadow -- 28581
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28581,370,22456,2,2259)
	self:addTradeFlags(RecipeDB,28581,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28581,8,3)

	-- Transmute: Primal Mana to Fire -- 28582
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28582,370,21884,2,2259)
	self:addTradeFlags(RecipeDB,28582,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28582,8,3)

	-- Transmute: Primal Fire to Mana -- 28583
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28583,370,22457,2,2259)
	self:addTradeFlags(RecipeDB,28583,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28583,8,3)

	-- Transmute: Primal Life to Earth -- 28584
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28584,370,22452,2,2259)
	self:addTradeFlags(RecipeDB,28584,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28584,8,3)

	-- Transmute: Primal Earth to Life -- 28585
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28585,370,21886,2,2259)
	self:addTradeFlags(RecipeDB,28585,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28585,8,3)

	-- Super Rejuvenation Potion -- 28586
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28586,370,22850,1,2259)
	self:addTradeFlags(RecipeDB,28586,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28586,8,2)

	-- Flask of Fortification -- 28587
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28587,370,22851,1,2259)
	self:addTradeFlags(RecipeDB,28587,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28587,8,1)

	-- Flask of Mighty Restoration -- 28588
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28588,370,22853,1,2259)
	self:addTradeFlags(RecipeDB,28588,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28588,1,22853,8,1)

	-- Flask of Relentless Assault -- 28589
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28589,370,22854,1,2259)
	self:addTradeFlags(RecipeDB,28589,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28589,8,1)

	-- Flask of Blinding Light -- 28590
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28590,370,22861,1,2259)
	self:addTradeFlags(RecipeDB,28590,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28590,1,22861,8,1)

	-- Flask of Pure Death -- 28591
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,28591,370,22866,1,2259)
	self:addTradeFlags(RecipeDB,28591,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28591,8,1)

	-- Transmute: Primal Might -- 29688
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,29688,350,23571,2,2259)
	self:addTradeFlags(RecipeDB,29688,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,29688,2,16641,2,16705,2,19074)

	-- Transmute: Earthstorm Diamond -- 32765
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32765,350,25867,1,2259)
	self:addTradeFlags(RecipeDB,32765,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,32765,6,942,2,17904)

	-- Transmute: Skyfire Diamond -- 32766
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,32766,350,25868,1,2259)
	self:addTradeFlags(RecipeDB,32766,1,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,32766,6,946,2,17657)

	-- Volatile Healing Potion -- 33732
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33732,300,28100,1,2259)
	self:addTradeFlags(RecipeDB,33732,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33732,1,16588,1,18802,1,19052)

	-- Unstable Mana Potion -- 33733
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33733,310,28101,1,2259)
	self:addTradeFlags(RecipeDB,33733,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33733,1,16588,1,18802,1,19052)

	-- Onslaught Elixir -- 33738
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33738,300,28102,1,2259)
	self:addTradeFlags(RecipeDB,33738,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33738,1,16588,1,18802,1,19052)

	-- Adept's Elixir -- 33740
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33740,300,28103,1,2259)
	self:addTradeFlags(RecipeDB,33740,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33740,1,16588,1,18802,1,19052)

	-- Elixir of Mastery -- 33741
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,33741,315,28104,1,2259)
	self:addTradeFlags(RecipeDB,33741,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33741,1,16588,1,18802,1,19052)

	-- Mercurial Stone -- 38070
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38070,325,31080,1,2259)
	self:addTradeFlags(RecipeDB,38070,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38070,1,16588,1,18802,1,19052)

	-- Fel Strength Elixir -- 38960
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38960,335,31679,3,2259)
	self:addTradeFlags(RecipeDB,38960,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38960,3,19740,3,19755,3,21302,3,21314)

	-- Fel Mana Potion -- 38961
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38961,360,31677,3,2259)
	self:addTradeFlags(RecipeDB,38961,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38961,3,19792,3,19795,3,19796,3,19806,3,20502,3,22016,3,22017,3,22018,3,22076,3,22093)

	-- Fel Regeneration Potion -- 38962
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,38962,345,31676,3,2259)
	self:addTradeFlags(RecipeDB,38962,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38962,3,19754,3,19756,3,20878,3,20887)

	-- Elixir of Major Fortitude -- 39636
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39636,310,32062,1,2259)
	self:addTradeFlags(RecipeDB,39636,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39636,1,16588,1,18802,1,19052)

	-- Earthen Elixir -- 39637
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39637,320,32063,1,2259)
	self:addTradeFlags(RecipeDB,39637,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,39637,6,942,2,17904)

	-- Elixir of Draenic Wisdom -- 39638
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39638,320,32067,1,2259)
	self:addTradeFlags(RecipeDB,39638,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39638,1,16588,1,18802,1,19052)

	-- Elixir of Ironskin -- 39639
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,39639,330,32068,1,2259)
	self:addTradeFlags(RecipeDB,39639,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39639,2,18821,2,18822)

	-- Cauldron of Major Arcane Protection -- 41458
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41458,340,32839,1,2259)
	self:addTradeFlags(RecipeDB,41458,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41458,8,4)

	-- Cauldron of Major Fire Protection -- 41500
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41500,340,32849,1,2259)
	self:addTradeFlags(RecipeDB,41500,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41500,8,4)

	-- Cauldron of Major Frost Protection -- 41501
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41501,340,32850,1,2259)
	self:addTradeFlags(RecipeDB,41501,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41501,8,4)

	-- Cauldron of Major Nature Protection -- 41502
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41502,340,32851,1,2259)
	self:addTradeFlags(RecipeDB,41502,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41502,8,4)

	-- Cauldron of Major Shadow Protection -- 41503
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,41503,340,32852,1,2259)
	self:addTradeFlags(RecipeDB,41503,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41503,8,4)

	-- Flask of Chromatic Wonder -- 42736
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,42736,375,33208,2,2259)
	self:addTradeFlags(RecipeDB,42736,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,114)
	self:addTradeAcquire(RecipeDB,42736,6,967,2,18255)

	-- Mad Alchemist's Potion -- 45061
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,45061,315,34440,1,2259)
	self:addTradeFlags(RecipeDB,45061,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Guardian's Alchemist Stone -- 47046
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47046,375,35748,1,2259)
	self:addTradeFlags(RecipeDB,47046,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,52,63,112)
	self:addTradeAcquire(RecipeDB,47046,6,1077,4,25032)

	-- Sorcerer's Alchemist Stone -- 47048
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47048,375,35749,1,2259)
	self:addTradeFlags(RecipeDB,47048,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63,112)
	self:addTradeAcquire(RecipeDB,47048,6,1077,4,25032)

	-- Redeemer's Alchemist Stone -- 47049
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47049,375,35750,1,2259)
	self:addTradeFlags(RecipeDB,47049,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63,112)
	self:addTradeAcquire(RecipeDB,47049,6,1077,4,25032)

	-- Assassin's Alchemist Stone -- 47050
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,47050,375,35751,1,2259)
	self:addTradeFlags(RecipeDB,47050,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,51,63,112)
	self:addTradeAcquire(RecipeDB,47050,6,1077,4,25032)

	-- Transmute: Eternal Life to Shadow -- 53771
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53771,385,35627,2,2259)
	self:addTradeFlags(RecipeDB,53771,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Life to Fire -- 53773
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53773,385,36860,2,2259)
	self:addTradeFlags(RecipeDB,53773,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Fire to Water -- 53774
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53774,385,35622,2,2259)
	self:addTradeFlags(RecipeDB,53774,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Fire to Life -- 53775
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53775,385,35625,2,2259)
	self:addTradeFlags(RecipeDB,53775,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Air to Water -- 53776
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53776,385,35622,2,2259)
	self:addTradeFlags(RecipeDB,53776,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Air to Earth -- 53777
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53777,385,35624,2,2259)
	self:addTradeFlags(RecipeDB,53777,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Shadow to Earth -- 53779
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53779,385,35624,2,2259)
	self:addTradeFlags(RecipeDB,53779,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Shadow to Life -- 53780
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53780,385,35625,2,2259)
	self:addTradeFlags(RecipeDB,53780,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Earth to Air -- 53781
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53781,385,35623,2,2259)
	self:addTradeFlags(RecipeDB,53781,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Earth to Shadow -- 53782
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53782,385,35627,2,2259)
	self:addTradeFlags(RecipeDB,53782,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Water to Air -- 53783
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53783,385,35623,2,2259)
	self:addTradeFlags(RecipeDB,53783,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Eternal Water to Fire -- 53784
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53784,385,36860,2,2259)
	self:addTradeFlags(RecipeDB,53784,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Pygmy Oil -- 53812
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53812,370,40195,1,2259)
	self:addTradeFlags(RecipeDB,53812,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runic Healing Potion -- 53836
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53836,395,33447,1,2259)
	self:addTradeFlags(RecipeDB,53836,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Runic Mana Potion -- 53837
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53837,400,33448,1,2259)
	self:addTradeFlags(RecipeDB,53837,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Resurgent Healing Potion -- 53838
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53838,340,39671,1,2259)
	self:addTradeFlags(RecipeDB,53838,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Icy Mana Potion -- 53839
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53839,345,40067,1,2259)
	self:addTradeFlags(RecipeDB,53839,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Agility -- 53840
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53840,385,39666,1,2259)
	self:addTradeFlags(RecipeDB,53840,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Wrath Elixir -- 53841
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53841,345,40068,1,2259)
	self:addTradeFlags(RecipeDB,53841,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Spellpower Elixir -- 53842
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53842,360,40070,1,2259)
	self:addTradeFlags(RecipeDB,53842,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Spirit -- 53847
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53847,380,40072,1,2259)
	self:addTradeFlags(RecipeDB,53847,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Guru's Elixir -- 53848
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53848,370,40076,1, 2259)
	self:addTradeFlags(RecipeDB,53848,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Crazy Alchemist's Potion -- 53895
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53895,400,40077,1,2259)
	self:addTradeFlags(RecipeDB,53895,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Fortitude -- 53898
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53898,385,40078,1, 2259)
	self:addTradeFlags(RecipeDB,53898,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Lesser Flask of Toughness -- 53899
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53899,370,40079,1,2259)
	self:addTradeFlags(RecipeDB,53899,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Potion of Nightmares -- 53900
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53900,375,40081,1, 2259)
	self:addTradeFlags(RecipeDB,53900,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of the Frost Wyrm -- 53901
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53901,435,40082,1,2259)
	self:addTradeFlags(RecipeDB,53901,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of Stoneblood -- 53902
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53902,435,40083,1,2259)
	self:addTradeFlags(RecipeDB,53902,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of Endless Rage -- 53903
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53903,435,40084,1,2259)
	self:addTradeFlags(RecipeDB,53903,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Powerful Rejuvenation Potion -- 53904
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53904,400,40087,1, 2259)
	self:addTradeFlags(RecipeDB,53904,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Indestructible Potion -- 53905
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53905,400,40093,1,2259)
	self:addTradeFlags(RecipeDB,53905,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mighty Arcane Protection Potion -- 53936
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53936,400,40213,2,2259)
	self:addTradeFlags(RecipeDB,53936,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53936,3,31702)

	-- Mighty Frost Protection Potion -- 53937
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53937,400,40215,2,2259)
	self:addTradeFlags(RecipeDB,53937,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53937,3,32289)

	-- Mighty Shadow Protection Potion -- 53938
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53938,400,40217,2,2259)
	self:addTradeFlags(RecipeDB,53938,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53938,3,32349)

	-- Mighty Fire Protection Potion -- 53939
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53939,400,40214,2,2259)
	self:addTradeFlags(RecipeDB,53939,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53939,3,30921,3,31321)

	-- Mighty Nature Protection Potion -- 53942
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,53942,400,40216,2,2259)
	self:addTradeFlags(RecipeDB,53942,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53942,3,32290)

	-- Transmute: Eternal Might -- 54020
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54020,430,40248,1, 2259)
	self:addTradeFlags(RecipeDB,54020,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Flask of Pure Mojo -- 54213
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54213,435,40404,1,2259)
	self:addTradeFlags(RecipeDB,54213,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Strength -- 54218
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54218,380,40073,1, 2259)
	self:addTradeFlags(RecipeDB,54218,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Protection -- 54220
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54220,400,40097,1, 2259)
	self:addTradeFlags(RecipeDB,54220,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Potion of Speed -- 54221
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54221,400,40211,1,2259)
	self:addTradeFlags(RecipeDB,54221,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Potion of Wild Magic -- 54222
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,54222,400,40212,1, 2259)
	self:addTradeFlags(RecipeDB,54222,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Mageblood -- 56519
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,56519,400,40109,1, 2259)
	self:addTradeFlags(RecipeDB,56519,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Skyflare Diamond -- 57425
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,57425,430,41266,3,2259)
	self:addTradeFlags(RecipeDB,57425,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Transmute: Earthsiege Diamond -- 57427
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,57427,425,41334,3,2259)
	self:addTradeFlags(RecipeDB,57427,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Endless Mana Potion -- 58868
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,58868,410,43570,1,2259)
	self:addTradeFlags(RecipeDB,58868,3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Endless Healing Potion -- 58871
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,58871,405,43569,1, 2259)
	self:addTradeFlags(RecipeDB,58871,3,21,22,23,24,25,26,27,28,29,30,41)
	-- No acquire information

	-- Transmute: Titanium -- 60350
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60350,400,41163,2,2259)
	self:addTradeFlags(RecipeDB,60350,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Accuracy -- 60354
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60354,400,44325,1, 2259)
	self:addTradeFlags(RecipeDB,60354,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Deadly Strikes -- 60355
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60355,400,44327,1, 2259)
	self:addTradeFlags(RecipeDB,60355,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Defense -- 60356
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60356,400,44328,1, 2259)
	self:addTradeFlags(RecipeDB,60356,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Expertise -- 60357
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60357,400,44329,1, 2259)
	self:addTradeFlags(RecipeDB,60357,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Armor Piercing -- 60365
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60365,400,44330,1, 2259)
	self:addTradeFlags(RecipeDB,60365,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	-- No acquire information

	-- Elixir of Lightning Speed -- 60366
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60366,400,44331,1,2259)
	self:addTradeFlags(RecipeDB,60366,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Elixir of Mighty Thoughts -- 60367
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60367,385,44332,1, 2259)
	self:addTradeFlags(RecipeDB,60367,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information

	-- Mercurial Alchemist Stone -- 60396
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60396,400,44322,3,2259)
	self:addTradeFlags(RecipeDB,60396,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	-- No acquire information

	-- Indestructible Alchemist Stone -- 60403
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60403,400,44323,3,2259)
	self:addTradeFlags(RecipeDB,60403,3,21,22,23,24,25,26,27,28,29,30,37,41,52,63)
	-- No acquire information

	-- Mighty Alchemist Stone -- 60405
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60405,400,44324,3,2259)
	self:addTradeFlags(RecipeDB,60405,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	-- No acquire information

	-- Northrend Alchemy Research -- 60893
	recipecount = recipecount + 1
	self:addTradeSkill(RecipeDB,60893,400,nil, 1, 2259)
	self:addTradeFlags(RecipeDB,60893,3,21,22,23,24,25,26,27,28,29,30,36,41)
	-- No acquire information


	return recipecount

end
