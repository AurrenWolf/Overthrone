stat_speed = 100

team = global.team
entity_number = -1

mhp = 500
hp = mhp

gen = true

move_x = x
move_y = y

face = "down"

move = false

move_up = false
move_down = false
move_left = false
move_right = false

net_update_tick = 0
net_update_time = 1/60
net_buffer = buffer_create(128, buffer_grow, 1)

depth-=1

dir = 0

img_spd = 150

for (var i = 1; i<=10; i++)
	{
	inventory[i] = 0
	inventory_cooldown[i] = 0
	inventory_cooldownMax[i] = 0
	}
	
inventory[1] = 1
inventory[2] = 3

holding_invSlot = 1
holding = 3
holding_range = ds_grid_get(System.weapon_stats_grid,holding,2)
holding_accuracy = ds_grid_get(System.weapon_stats_grid,holding,3)
holding_tickTime = ds_grid_get(System.weapon_stats_grid,holding,4)
holding_tick = holding_tickTime
holding_damage = ds_grid_get(System.weapon_stats_grid,holding,5)

skin_color = make_color_rgb(248, 228, 211)

spr_base_torso_right = s_player_base_torso_side
spr_base_torso_left = s_player_base_torso_side
spr_base_torso_down = s_player_base_torso_down
spr_base_torso_up = s_player_base_torso_down

spr_base_head_right = s_player_base_head_side
spr_base_head_left = s_player_base_head_side
spr_base_head_down = s_player_base_head_down
spr_base_head_up = s_player_base_head_up

spr_base_legs_right = s_player_base_legs
spr_base_legs_left = s_player_base_legs
spr_base_legs_down = s_player_base_legs
spr_base_legs_up = s_player_base_legs

spr_base_torso = spr_base_torso_down
spr_base_head = spr_base_head_down
spr_base_legs = spr_base_legs_down

revive = 0
reviveTime = 10