dofile_once("mods/tales_of_kupoli/files/scripts/utils.lua")
dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")

local a = {
	{
		id          = "REAPING_SHOT", -- the basis of the whole mod or something
		name 		= "$action_kupoli_reaping_shot",
		description = "$actiondesc_kupoli_reaping_shot",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reaping_shot.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/reaping_shot/reaping_shot.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6",
		spawn_probability                 = "1,1,1,1,1,1,1",
		price = 120,
		mana = 20,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/reaping_shot/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 5
			draw_actions( 1, true )
		end,
	},
	{
		id          = "REAPING_FIELD",
		name 		= "$action_kupoli_reaping_field",
		description = "$actiondesc_kupoli_reaping_field",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reaping_field.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/reaping_field/reaping_field.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5,6",
		spawn_probability                 = "0.3,0.1,0.2,0.5,0.4",
		price = 140,
		mana = 60,
		max_uses = 15,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/reaping_field/reaping_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
		end,
	},
	{
		id          = "SOULS_TO_POWER",
		name 		= "$action_kupoli_souls_to_power",
		description = "$actiondesc_kupoli_souls_to_power",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/souls_to_power.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/souls_to_power/souls_to_power.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4,5,6,10",
		spawn_probability                 = "1,0.9,0.9,0.9,0.8,0.8",
		price = 120,
		mana = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/souls_to_power/souls_to_power.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
	--[[{
		id          = "SOLAR_GLUTTONY", 
		name 		= "Solar Gluttony",
		description = "Eat the Sun.",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/solar_gluttony.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/solar_gluttony/solar_gluttony.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "",
		spawn_probability                 = "",
		price = 0,
		mana = 275,
		max_uses = 30,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/solar_gluttony/solar_gluttony.xml")
			c.fire_rate_wait = c.fire_rate_wait + 50
		end,
	},]]--
	{
		id          = "REAPING_HALO",
		name 		= "$action_kupoli_reaping_halo",
		description = "$actiondesc_kupoli_reaping_halo",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reaping_halo.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/reaping_halo/projectile.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "5,6,10",
		spawn_probability                 = "0.3,0.5,0.5",
		price = 200,
		mana = 150,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/reaping_halo/projectile.xml")
			c.fire_rate_wait = c.fire_rate_wait + 80
		end,
	},
	{
		id = "HIISI_SHOTGUN",
		name = "$action_kupoli_hiisi_shotgun",
		description = "$actiondesc_kupoli_hiisi_shotgun",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_shotgun.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml", 3},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70, -- does this even need to be set?
		mana = 30, -- make this the same as buckshot + 25%
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisishotgun/projectile.xml")
			c.spread_degrees = c.spread_degrees + 13.0
		end,
	},
	{
		id = "HIISI_SNIPER",
		name = "$action_kupoli_hiisi_sniper",
		description = "$actiondesc_kupoli_hiisi_sniper",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_sniper.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisisniper/projectile.xml"},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70,
		mana = 40,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisisniper/projectile.xml")
		end,
	},
	{
		id = "HIISI_PISTOL",
		name = "$action_kupoli_hiisi_pistol",
		description = "$actiondesc_kupoli_hiisi_pistol",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_pistol.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisipistol/projectile.xml"},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70,
		mana = 30,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisipistol/projectile.xml")
		end,
	},
	--[[{
		id = "DIAHEART_LENSE", -- riven mod
		name = "Diamond Lense",
		sprite = "mods/tales_of_kupoli/files/spell_icons/rivenmod.png",
		type = ACTION_TYPE_UTILITY,
		spawn_level = "",
		spawn_probability = "",
		price = 0,
		mana = 50,
		custom_xml_file = "mods/tales_of_kupoli/files/entities/misc/dhl.xml",
		action = function()

			local target = "LIGHT_BULLET"
			

			if (#deck > 0) then
				if deck[1].id == target then
					-- add stats
					c.fire_rate_wait = 100
					c.speed_multiplier = c.speed_multiplier * 10
					GamePrint("hi")
				end
			end
			GamePrint("riven action function ran")

			draw_actions( 1, true )
		end,
	},]]--
	{
		id          = "SOUL_BLAST",
		name 		= "$action_kupoli_soul_blast",
		description = "$actiondesc_kupoli_soul_blast",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_blast.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/soul_blast/soul_blast.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6",
		spawn_probability                 = "0.8,1,1,1,1",
		price = 120,
		mana = 40,
		max_uses = 20,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/soul_blast/soul_blast.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
		end,
	},
	{
		id          = "SOUL_SPEED",
		name 		= "$action_kupoli_soul_speed",
		description = "$actiondesc_kupoli_soul_speed",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_speed.png",
		--related_extra_entities = { "mods/tales_of_kupoli/files/entities/misc/soul_speed.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5,6",
		spawn_probability                 = "0.7,1,1,0.7,0.7,0.7",
		price = 120,
		mana = 15,
		action 		= function()
			dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")
			
			if GetSoulsCount("all") > 0 then
				c.speed_multiplier = c.speed_multiplier * 3
				c.damage_projectile_add = c.damage_projectile_add + 0.5

				c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/misc/soul_speed_fx.xml,"

				RemoveSouls(1)
			elseif GetSoulsCount("all") <= 0 then
				GamePrint("You have no souls!")
			end
			draw_actions( 1, true )
		end,
	},
	{
		id			= "REAPER_BLADE",
		name		= "$action_kupoli_reaper_blade",
		description = "$actiondesc_kupoli_reaper_blade",
		sprite     	= "mods/tales_of_kupoli/files/spell_icons/reaper_blade.png",
		type        = ACTION_TYPE_PASSIVE,
		spawn_level      	= "2,3,4,5",
		spawn_probability	= "0.3,0.3,0.3,0.3",
		price				= 80,
		mana				= 0,
		custom_xml_file = "mods/tales_of_kupoli/files/entities/misc/reaper_blade.xml",
		action = function()
		end,
	},
	{
		id = "ROCKET_ROLL",
		name = "$action_kupoli_rocket_roll",
		description = "$actiondesc_kupoli_rocket_roll",
        sprite = "mods/tales_of_kupoli/files/spell_icons/rocket_roll.png",
		related_projectiles	= { "mods/tales_of_kupoli/files/entities/items/mechakolmiwand/rocket_roll.xml", 5},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 100,
		mana = 100,
		max_uses = 10,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/mechakolmiwand/rocket_roll.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/mechakolmiwand/rocket_roll.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/mechakolmiwand/rocket_roll.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/mechakolmiwand/rocket_roll.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/items/mechakolmiwand/rocket_roll.xml")
		end,
	},
	{
		id          = "SOUL_EXPLOSION",
		name 		= "$action_kupoli_soul_explosion",
		description = "$actiondesc_kupoli_soul_explosion",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_detonation.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/soul_detonation/soul_detonation.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5",
		spawn_probability                 = "0.5,0.5,0.5,0.5",
		price = 120,
		mana = 20,
		max_uses = 30,
		custom_xml_file = "mods/tales_of_kupoli/files/entities/misc/soul_detonation.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/soul_detonation/soul_detonation.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
			c.screenshake = c.screenshake + 0.5
		end,
	},
	{
		id = "HIISI_GLUE_SHOT",
		name = "$action_kupoli_hiisi_glue_shot",
		description = "$actiondesc_kupoli_hiisi_glue_shot",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_glue_shot.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisigluegun/projectile.xml"},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70,
		mana = 35,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisigluegun/projectile.xml")
		end,
	},
	{
		id = "HIISI_POISON_SHOT",
		name = "$action_kupoli_hiisi_poison_shot",
		description = "$actiondesc_kupoli_hiisi_poison_shot",
        sprite = "mods/tales_of_kupoli/files/spell_icons/hiisi_poison_shot.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/hiisipoisongun/projectile.xml"},
		type = ACTION_TYPE_PROJECTILE,
		spawn_level = "",
		spawn_probability = "",
		price = 70,
		mana = 30,
		action = function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/hiisipoisongun/projectile.xml")
		end,
	},
	{
		id = "SNIPER_BEAM",
		name = "$action_kupoli_sniper_beam",
		description = "$actiondesc_kupoli_sniper_beam",
        sprite = "mods/tales_of_kupoli/files/spell_icons/sniper_beam.png",
		type = ACTION_TYPE_PASSIVE,
		spawn_level                       = "1,2,3",
		spawn_probability                 = "0.7,0.7,0.7",
		price = 0,
		mana = 0,
		custom_xml_file = "mods/tales_of_kupoli/files/entities/misc/sniper_sight.xml",
		action = function()
			draw_actions( 1, true )
		end,
	},
	{
		id          = "WORM_ENHANCER",
		name 		= "$action_kupoli_worm_enhancer",
		description = "$actiondesc_kupoli_worm_enhancer",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/worm_enhancer.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/worm_enhancer/projectile.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "", 
		spawn_probability                 = "",
		price = 0,
		mana = 100,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/worm_enhancer/projectile.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
			shot_effects.recoil_knockback = 40.0
		end,
	},
	{
		id          = "SUMMON_RAINWORM",
		name 		= "$action_kupoli_summon_rainworm",
		description = "$actiondesc_kupoli_summon_rainworm",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/summon_rainworm.png",
		related_projectiles	= {"data/entities/animals/boss_pit/boss_pit.xml"},
		never_unlimited		= true,
		type 		= ACTION_TYPE_OTHER,
		spawn_level                       = "",
		spawn_probability                 = "",
		price = 0,
		mana = 700,
		max_uses    = 1,
		--custom_xml_file = "mods/tales_of_kupoli/files/entities/animals/boss_rainworm/spell/card.xml",
		action 		= function()
			--add_projectile("mods/tales_of_kupoli/files/entities/animals/boss_rainworm/spell/spell.xml")
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/tuntija_hoard/spell.xml")
			c.fire_rate_wait = c.fire_rate_wait + 100
			current_reload_time = current_reload_time + 60
		end,
	},
	{
		id          = "RANDOM_HOMING",
		name 		= "$action_kupoli_random_homing",
		description = "$actiondesc_kupoli_random_homing",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/random_homing.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
		spawn_requires_flag = "card_unlocked_pyramid",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "4,5,6,10",
		spawn_probability                 = "0.3,0.1,0.1,0.5",
		price = 130,
		mana = 45,
		action 		= function( recursion_level, iteration )
			SetRandomSeed( GameGetFrameNum() + #deck, GameGetFrameNum() + 133 )
			
			local homingspell = ""
			local pool = {
				"data/entities/misc/homing_rotate.xml,",
				"data/entities/misc/homing_accelerating.xml,",
				"data/entities/misc/homing_short.xml,",
				"data/entities/misc/homing.xml,",
			}

			homingspell = pool[math.random(1, #pool)]

			c.extra_entities = c.extra_entities .. homingspell .. "data/entities/particles/tinyspark_white.xml,"
		end,
	},
	{
		id          = "LIGHT_BULLET_TIER_2",
		name 		= "$action_kupoli_big_sparkbolt",
		description = "$actiondesc_kupoli_big_sparkbolt",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/large_sparkbolt.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/light_bullet_unidentified.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/large_sparkbolt/proj.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5",
		spawn_probability                 = "1,1,1,0.5",
		price = 180,
		mana = 15,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/large_sparkbolt/proj.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.screenshake = c.screenshake + 2
			c.spread_degrees = c.spread_degrees - 1.0
			c.damage_critical_chance = c.damage_critical_chance + 5
		end,
	},
	{
		id          = "WATER_ESSENCE_PROJ",
		name 		= "$action_kupoli_wateressence",
		description = "$actiondesc_kupoli_wateressence",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/water_essence_proj.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/light_bullet_unidentified.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/items/essencewand_water/proj.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "",
		spawn_probability                 = "",
		price = 250,
		mana = 20,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/items/essencewand_water/proj.xml")
			c.fire_rate_wait = c.fire_rate_wait + 60
		end,
	},
	{
		id          = "BLOOD_TO_STEAM",
		name 		= "$action_kupoli_blood_to_steam",
		description = "$actiondesc_kupoli_blood_to_steam",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/blood_to_steam.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/explosive_projectile_unidentified.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/misc/blood_to_steam.xml", "data/entities/particles/tinyspark_red.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4",
		spawn_probability                 = "0.3,0.3,0.3",
		price = 80,
		mana = 30,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/misc/blood_to_steam.xml,data/entities/particles/tinyspark_red.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "SPELLERIOPHAGE",
		name 		= "$action_kupoli_spelleriophage",
		description = "$actiondesc_kupoli_spelleriophage",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/spelleriophage.png",
		--sprite_unidentified = "data/ui_gfx/gun_actions/damage_unidentified.png",
		--spawn_requires_flag = "card_unlocked_mestari",
		type 		= ACTION_TYPE_OTHER,
		spawn_level                       = "2,3,4,5,10",
		spawn_probability                 = "0.7,0.7,0.8,0.9,0.2",
		price = 100,
		mana = 40,
		action = function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/add_mortem_trigger/add.xml,"
			draw_actions( 1, true )
		end
	},
	{
		id          = "SOUL_IS_MANA",
		name 		= "$action_kupoli_soul_is_mana",
		description = "$actiondesc_kupoli_soul_is_mana",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_is_mana.png",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "0,1,2,3,4,5,6,10",
		spawn_probability                 = "0.7,0.7,1,1,0.7,0.7,0.7,0.2",
		price = 140,
		mana = 0,
		action 		= function()
			dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")
			
			if GetSoulsCount("all") > 0 then
				local data = {}

				if #deck > 0 then
					data = deck[1]
				else
					data = nil
				end

				if data ~= nil then
					if GetSoulsCount("all") <= 0 then
						GamePrint("You have no souls!")
						return
					end
					data.mana = 0
					RemoveSouls(1)
				end

				c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/misc/soul_speed_fx.xml,"
			elseif GetSoulsCount("all") <= 0 then
				GamePrint("You have no souls!")
			end
			draw_actions( 1, true )
		end,
	},
	{
		id          = "REAP_MANY",
		name 		= "$action_kupoli_reap_many",
		description = "$actiondesc_kupoli_reap_many",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/reap_many.png",
		related_extra_entities	= {"mods/tales_of_kupoli/files/entities/projectiles/reap_many/reap_many.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "2,3,4,5,6,10",
		spawn_probability                 = "0.1,0.1,0.2,0.5,0.4,0.1",
		price = 250,
		max_uses = 5,
		mana = 130,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/reap_many/reap_many.xml")
			c.fire_rate_wait = c.fire_rate_wait + 30
		end,
	},
	{
		id          = "GILDED_SOULS_TO_GOLD",
		name 		= "$action_kupoli_gilded_souls_to_gold",
		description = "$actiondesc_kupoli_gilded_souls_to_gold",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/gilded_souls_to_gold.png",
		--related_extra_entities	= {"mods/tales_of_kupoli/files/entities/projectiles/reap_many/reap_many.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "4,5,6",
		spawn_probability                 = "0.7,0.7,0.7",
		price = 200,
		mana = 100,
		action 		= function()
			dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")
			
			if GetSoulsCount("gilded") == nil then return end

			if GetSoulsCount("gilded") > 0 then

				local player = GetPlayer()

				if player == nil then return end

				local comp_wallet = EntityGetFirstComponentIncludingDisabled( player, "WalletComponent" )

				local money_to_give = 0

				if comp_wallet ~= nil and player ~= nil then
					local money = ComponentGetValue2( comp_wallet, "money" )

					money_to_give = 100 * GetSoulsCount("gilded") * math.ceil(money / 400)
					-- if you have 1000 gold, each soul will give you 250

					if money_to_give < 100 then
						money_to_give = 100
					end

					for i=1,GetSoulsCount("gilded") do
						RemoveSoul("gilded")
					end

					money = money + money_to_give

					ComponentSetValue2(comp_wallet, "money", money)
				end

			elseif GetSoulsCount("gilded") <= 0 then
				GamePrint("You have no gilded souls!")
			end
		end,
	},
	{
		id          = "SOUL_BATTERY",
		name 		= "$action_kupoli_soul_battery",
		description = "$actiondesc_kupoli_soul_battery",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_battery.png",
		type 		= ACTION_TYPE_OTHER,
		spawn_level                       = "4,5,6,10",
		spawn_probability                 = "0.3,0.7,0.7,0.5",
		price = 160,
		mana = 0,
		action 		= function()
			dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")

			local amount = 0
			local souls_to_use = 0
			
			if GetSoulsCount("all") > 0 then
				local this = {}

				if #deck > 0 then
					this = deck[1]
				else
					this = nil
				end

				for i,data in ipairs(deck) do
					amount = amount + data.mana
				end

				souls_to_use = math.ceil(amount / 200)

				if GetSoulsCount("all") > souls_to_use then
					RemoveSouls(souls_to_use)
					for i,data in ipairs(deck) do
						data.mana = 0
						c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/misc/soul_speed_fx.xml,"
					end
				else
					GamePrint("You do not have enough souls!")
				end
			elseif GetSoulsCount("all") <= 0 then
				GamePrint("You do not have enough souls!")
			end
			draw_actions( 1, true )
		end,
	},
	{
		id          = "SOUL_GUARD",
		name 		= "$action_kupoli_soul_guard",
		description = "$actiondesc_kupoli_soul_guard",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_guard.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/soul_guard/start.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5,6",
		spawn_probability                 = "0.8,1,1,1,1",
		price = 130,
		mana = 60,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/soul_guard/start.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "SUMMON_SUN",
		name 		= "$action_kupoli_summon_sun",
		description = "$actiondesc_kupoli_summon_sun",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/summon_sun.png",
		related_projectiles	= {"data/entities/items/pickup/sun/newsun.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "",
		spawn_probability                 = "",
		price = 1000,
		mana = 1000,
		max_uses = 1,
		is_dangerous_blast = true,
		never_unlimited = true,
		action 		= function()
			local suns = {
				"mods/tales_of_kupoli/files/entities/sun/newsun_green.xml",
				"mods/tales_of_kupoli/files/entities/sun/newsun_red.xml",
				"data/entities/items/pickup/sun/newsun_dark.xml",
				"data/entities/items/pickup/sun/newsun.xml",
			}
			local x, y = EntityGetTransform(GetUpdatedEntityID())
			if x ~= nil then
				SetRandomSeed(x, y+GameGetFrameNum())
			end
			add_projectile(suns[math.random(1,#suns)])
			--EntityLoad(suns[math.random(1,#suns)], x, y)
			c.fire_rate_wait = c.fire_rate_wait + 100
			c.screenshake = c.screenshake + 10
		end,
	},
	{
		id          = "TRIGGER_RETURN",
		name 		= "$action_kupoli_trigger_return",
		description = "$actiondesc_kupoli_trigger_return",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/triggerable_return.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/triggerable_return/projectile.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "4,5,6",
		spawn_probability                 = "0.6,0.6,0.7",
		price = 110,
		mana = 50,
		action 		= function()
			local state = 1
			local shooter = GetUpdatedEntityID()

			if #EntityGetWithTag("kupoli_trigger_return") > 0 then
				local targets = EntityGetWithTag("kupoli_trigger_return")
				for i=1,#targets do
					local x, y = EntityGetTransform(targets[i])
					EntityKill(targets[i])
					EntitySetTransform(shooter, x, y)
				end
				state = 1
			else
				add_projectile("mods/tales_of_kupoli/files/entities/projectiles/triggerable_return/projectile.xml")
				state = 2
			end

			c.fire_rate_wait = c.fire_rate_wait + 6
			c.spread_degrees = c.spread_degrees - 2.0
		end,
	},
	--[[{
		id          = "MOLDOS_INFERNO",
		name 		= "Moldos Inferno",
		description = "It is all fire",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_speed.png", -- did you know? icon
		related_extra_entities	= {"mods/tales_of_kupoli/files/entities/misc/moldos_inferno.xml"},
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "4,5,6",
		spawn_probability                 = "0.7,0.7,0.7",
		price = 180,
		mana = 30,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/misc/moldos_inferno.xml,"
		end,
	},]]
	{
		id          = "RANDOM_REAP",
		name 		= "$action_kupoli_random_reap",
		description = "$actiondesc_kupoli_random_reap",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/random_reap.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/random_reap/reaping_shot.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "3,4,5,6",
		spawn_probability                 = "0.4,0.5,0.5,0.6",
		price = 130,
		mana = 25,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/random_reap/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 7
			draw_actions( 1, true )
		end,
	},

	{
		id          = "ALL_REAP_GILDED",
		name 		= "$action_kupoli_all_reap_gilded",
		description = "$actiondesc_kupoli_all_reap_gilded",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_gilded.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/all_reap_gilded/reaping_shot.xml" },
		spawn_requires_flag = "card_unlocked_alchemy",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "6,10",
		spawn_probability                 = "0.05,1",
		never_unlimited = true,
		max_uses = 5,
		price = 200,
		mana = 100,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/all_reap_gilded/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 40
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ALL_REAP_MAGE",
		name 		= "$action_kupoli_all_reap_mage",
		description = "$actiondesc_kupoli_all_reap_mage",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_mage.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/all_reap_mage/reaping_shot.xml" },
		spawn_requires_flag = "card_unlocked_alchemy",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "6,10",
		spawn_probability                 = "0.05,1",
		price = 200,
		mana = 70,
		never_unlimited = true,
		max_uses = 30,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/all_reap_mage/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ALL_REAP_FLY",
		name 		= "$action_kupoli_all_reap_fly",
		description = "$actiondesc_kupoli_all_reap_fly",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_fly.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/all_reap_fly/reaping_shot.xml" },
		spawn_requires_flag = "card_unlocked_alchemy",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "6,10",
		spawn_probability                 = "0.05,1",
		price = 200,
		mana = 70,
		never_unlimited = true,
		max_uses = 30,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/all_reap_fly/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
	{
		id          = "ALL_REAP_SPIDER",
		name 		= "$action_kupoli_all_reap_spider",
		description = "$actiondesc_kupoli_all_reap_spider",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_spider.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/all_reap_spider/reaping_shot.xml" },
		spawn_requires_flag = "card_unlocked_alchemy",
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "6,10",
		spawn_probability                 = "0.05,1",
		price = 200,
		mana = 70,
		never_unlimited = true,
		max_uses = 30,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/all_reap_spider/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
	{
		id          = "SOULDOS",
		name 		= "$action_kupoli_souldos",
		description = "$actiondesc_kupoli_souldos",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/souldos.png",
		related_extra_entities = { "mods/tales_of_kupoli/files/entities/projectiles/souldos/reaping_shot.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "6,10",
		spawn_probability                 = "0.05,1",
		price = 160,
		mana = 40,
		max_uses = 50,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/tales_of_kupoli/files/entities/projectiles/souldos/reaping_shot.xml,"
			c.fire_rate_wait = c.fire_rate_wait + 15
			draw_actions( 1, true )
		end,
	},
	{
		id          = "SOUL_BALL",
		name 		= "$action_kupoli_soul_ball",
		description = "$actiondesc_kupoli_soul_ball",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_ball.png",
		related_projectiles	= {"mods/tales_of_kupoli/files/entities/projectiles/soul_ball/soul_ball.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "5,6,10",
		spawn_probability                 = "0.3,0.3,0.1",
		price = 120,
		mana = 80,
		max_uses = 10,
		action 		= function()
			add_projectile("mods/tales_of_kupoli/files/entities/projectiles/soul_ball/soul_ball.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	{
		id          = "EAT_WAND_FOR_SOULS",
		name 		= "$action_kupoli_eat_wand_for_souls",
		description = "$actiondesc_kupoli_eat_wand_for_souls",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/eat_wand_for_souls.png",
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "5,6,10",
		spawn_probability                 = "0.6,0.7,0.5",
		price = 300,
		mana = 100,
		action 		= function()
			dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")
			
			local card = GetUpdatedEntityID()
			local x, y = EntityGetTransform(GetPlayer())
			local wand = 0
			local souls_earned = 1
			local inv_comp = EntityGetFirstComponentIncludingDisabled(card, "Inventory2Component")
			if inv_comp then
				wand = ComponentGetValue2(inv_comp, "mActiveItem")
			end

			local possible_types = {
				"bat",
				"fly",
				"mage",
				"orcs",
				"slimes",
				"spider",
				"worm",
				"ghost",
			}

			if wand ~= 0 then
				local acs = EntityGetComponentIncludingDisabled( wand, "AbilityComponent" )

				if acs == nil then return end
				for i,ac in ipairs(acs) do
					local rt = tonumber( ComponentObjectGetValue( ac, "gun_config", "reload_time" ) ) -- reload time
					local frw = tonumber( ComponentObjectGetValue( ac, "gunaction_config", "fire_rate_wait" ) ) -- fire rate wait
					local mcs = tonumber( ComponentGetValue2( ac, "mana_charge_speed" ) ) -- mana charge speed
					local mm = tonumber( ComponentGetValue2( ac, "mana_max" ) ) -- mana max
					local cp = tonumber( ComponentObjectGetValue( ac, "gun_config", "deck_capacity" ) ) -- capacity

					rt = rt / 50
					frw = frw / 50
					mcs = mcs / 300
					mm = mm / 300
					cp = cp / 2

					souls_earned = rt + frw + mcs + mm + cp
					souls_earned = math.ceil(souls_earned)
				end

				local children = EntityGetAllChildren(wand) or {}

				for i,v in ipairs(children) do
					if EntityHasTag(v, "card_action") then
						local comp_itemaction = EntityGetFirstComponentIncludingDisabled(v, "ItemActionComponent") or 0
            			local action_id = ComponentGetValue(comp_itemaction, "action_id") or ""
            			if action_id ~= "KUPOLI_EAT_WAND_FOR_SOULS" then
							souls_earned = souls_earned + 1
						end
					end
				end

				if souls_earned > 20 then
					souls_earned = 20 + ((souls_earned - 20) * 0.5)
				end

				souls_earned = math.floor(souls_earned)

				for i=1,souls_earned do
					local which = possible_types[math.random(1,#possible_types)]
					AddSoul(which)
					if ModSettingGet("tales_of_kupoli.say_soul") == true then
						GamePrint("You have acquired a " .. SoulNameCheck(which) .. " soul!")
					end
				end
				GamePrint("The wand was eaten and you have received " .. souls_earned .. " souls!")
				CreateItemActionEntity( "KUPOLI_EAT_WAND_FOR_SOULS", x, y )
				EntityKill(wand)
			end
		end,
	},
	{
		id          = "SOUL_NECROMANCY",
		name 		= "$action_kupoli_soul_necromancy",
		description = "$actiondesc_kupoli_soul_necromancy",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_necromancy.png",
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "4,5,6",
		spawn_probability                 = "0.7,0.7,0.8",
		price = 100,
		mana = 40,
		max_uses = 7,
		never_unlimited = true,
		action 		= function()
			dofile_once("mods/tales_of_kupoli/files/scripts/souls.lua")

			local souls_count = GetSoulsCount("all")
			local number_to_spawn = 0
			local x, y = EntityGetTransform(GetUpdatedEntityID())

			number_to_spawn = math.ceil(souls_count * 0.3)

			if number_to_spawn == 0 then
				GamePrint("You do not have enough souls!")
			else
				for i=1,number_to_spawn do
					local eid = EntityLoad("mods/tales_of_kupoli/files/entities/animals/soul_minion/soul_minion.xml", x+math.random(-5,5), y+math.random(-5,0))

					RemoveSouls(1)

					-- stolen egg hatching code <3
					local charm_component = GetGameEffectLoadTo( eid, "CHARM", true )
					if charm_component ~= nil and charm_component ~= 0 then
						---@diagnostic disable-next-line: param-type-mismatch
						ComponentSetValue( charm_component, "frames", -1 )
					end

					--[[local lua_components = EntityGetComponent( eid, "LuaComponent")
					if( lua_components ~= nil ) then
						for i,lua_comp in ipairs(lua_components) do
							if( ComponentGetValue( lua_comp, "script_death") == "data/scripts/items/drop_money.lua" ) then
								ComponentSetValue( lua_comp, "script_death", "" )
							end
						end
					end]]
				end

				if number_to_spawn == 1 then
					GamePrint(tostring(number_to_spawn) .. " soul consumed to spawn 1 minion!")
				else
					GamePrint(tostring(number_to_spawn) .. " souls consumed to spawn " .. tostring(number_to_spawn) .. " minions!")
				end
			end
		end,
	},
	{
		id          = "SOUL_MINIONS_TO_HEALING",
		name 		= "$action_kupoli_soul_minions_to_healing",
		description = "$actiondesc_kupoli_soul_minions_to_healing",
		sprite 		= "mods/tales_of_kupoli/files/spell_icons/soul_minions_to_healing.png",
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "4,5,6",
		spawn_probability                 = "0.1,0.3,0.4",
		price = 130,
		mana = 50,
		max_uses = 2,
		never_unlimited = true,
		action 		= function()
			local x, y = EntityGetTransform(GetUpdatedEntityID())
			local targets = EntityGetInRadiusWithTag(x, y, 130, "kupoli_soul_minion")
			for i=1,#targets do
				local tx, ty = EntityGetTransform(targets[i])
				EntityLoad("data/entities/projectiles/deck/regeneration_aura.xml", tx, ty)
				EntityKill(targets[i])
			end
			c.fire_rate_wait = c.fire_rate_wait + 30
		end,
	},
}

for i,v in ipairs(a) do
	v.id = "KUPOLI_" .. v.id
    table.insert(actions, v)
end