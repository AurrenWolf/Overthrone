owner = -1
depth -=1
show_debug_message("Net player created")

entity_number=-1

gen = true

team = "blue"

mhp = 500
hp = mhp

weaponX = x
weaponY = y
dir = 0

holding = 1
holding_range = ds_grid_get(System.weapon_stats_grid,holding,2)
holding_accuracy = ds_grid_get(System.weapon_stats_grid,holding,3)
holding_tickTime = ds_grid_get(System.weapon_stats_grid,holding,4)
holding_tick = holding_tickTime

face = "down"
flip = 1

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