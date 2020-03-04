local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")
local variations_util = require(kr_public_lib .. "create-roboport-states")
local empty_sprite =
{
	filename = kr_entities_path .. "empty.png",
	width = 1,
	height = 1,
	frame_count = 1
}

data:extend(
{
	{
		type = "roboport",
		name = "kr-small-roboport",
		icon = kr_entities_icons_path .. "small-roboport.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-small-roboport"},
		max_health = 350,
		corpse = "big-remnants",
		damaged_trigger_effect = hit_effects.entity(),
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1, -1}, {1, 1}},
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 75},
			{type = "impact",percent = 75}
		},
		dying_explosion = "medium-explosion",
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			input_flow_limit = "12MW",
			buffer_capacity = "300MJ"
		},
		recharge_minimum = "50MJ",
		energy_usage = "50kW",
		-- per one charge slot
		charging_energy = "3MW",
		logistics_radius = 18,
		construction_radius = 34,
		charge_approach_distance = 3,
		robot_slots_count = 0,
		material_slots_count = 0,
		stationing_offset = {0, 0},
		charging_offsets =
		{
			{-0.5, -1}, {-1, -0.5}, {-1, 0.5}, {-0.5, 1}, {0.5, 1}, {1, 0.5}, {1, -0.5}, {0.5, -1}
		},
		base =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "small-roboport/small-roboport.png",
					width = 120,
					height = 150,
					shift = {0, -0.1},
					scale = 0.5,
					hr_version =
					{
						filename = kr_entities_path .. "small-roboport/hr-small-roboport.png",
						width = 240,
						height = 300,
						shift = {0, -0.1},
						scale = scale,
						scale = 0.25
					}
				},
				{
					filename = kr_entities_path .. "small-roboport/small-roboport-sh.png",
					width = 163,
					height = 84,
					shift = {0.48, 0.43},
					draw_as_shadow = true,
					scale = 0.5,
					hr_version =
					{
						filename = kr_entities_path .. "small-roboport/hr-small-roboport-sh.png",
						width = 322,
						height = 166,
						shift = {0.48, 0.43},
						draw_as_shadow = true,
						scale = 0.25
					}
				}
			}
		},
		base_patch = empty_sprite,
		base_animation =
		{
			filename = kr_entities_path .. "small-roboport/small-roboport-animation.png",
			priority = "medium",
			width = 55,
			height = 40,
			scale = 0.5,
			frame_count = 8,
			shift = {0, -0.92},
			animation_speed = 0.1,
			hr_version =
			{
				filename = kr_entities_path .. "small-roboport/hr-small-roboport-animation.png",
				priority = "medium",
				width = 110,
				height = 80,
				scale = scale,
				scale = 0.25,
				frame_count = 8,
				shift = {0, -0.92},
				animation_speed = 0.1
			}
		},
		door_animation_up = empty_sprite,
		door_animation_down = empty_sprite,
		recharging_animation =
		{
			filename = kr_entities_path .. "small-roboport/small-roboport-recharging.png",
			priority = "high",
			width = 37,
			height = 35,
			frame_count = 16,
			scale = 1.5,
			animation_speed = 0.5
		},
		vehicle_impact_sound = sounds.generic_impact,
		recharging_light = {intensity = 0.4, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
		request_to_open_door_timeout = 15,
		spawn_and_station_height = 0.33
	}
})

variations_util.createRoboportVariations("kr-small-roboport")