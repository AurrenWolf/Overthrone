phy_rotation = 0

event_inherited()

if (keyboard_check(ord("W")))
	{
	move_up = true
	}
if (keyboard_check(ord("S")))
	{
	move_down = true
	}
if (keyboard_check(ord("A")))
	{
	move_left = true
	}
if (keyboard_check(ord("D")))
	{
	move_right = true
	}
if (keyboard_check_released(ord("W")))
	{
	move_up = false
	}
if (keyboard_check_released(ord("S")))
	{
	move_down = false
	}
if (keyboard_check_released(ord("A")))
	{
	move_left = false
	}
if (keyboard_check_released(ord("D")))
	{
	move_right = false
	}
if ((move_right = true)||(move_left = true)||(move_up = true)||(move_down = true))
	{
	move = true
	}
else{move = false}
	
spd = stat_speed*dt
	
if (move_up = true)
	{
	phy_speed_y=-spd
	spd/=2
	}
if (move_down = true)
	{
	phy_speed_y=spd
	spd/=2
	}
if (move_left = true)
	{
	phy_speed_x=-spd
	spd/=2
	}
if (move_right = true)
	{
	phy_speed_x=spd
	spd/=2
	}
dir = point_direction(x,y,mouse_x,mouse_y)
if (dir<=45)
	{
	face = "right"
	}
if (dir>45)
	{
	face = "up"
	}
if (dir>135)
	{
	face = "left"
	}
if (dir>225)
	{
	face = "down"
	}
if (dir>315)
	{
	face = "right"
	}
	
for (var i = 1; i<=10; i++)
	{
	inventory_cooldown[i] -=1*dt
	}
	
image_speed = img_spd*dt

switch(face)
	{
	case "up":
		{
		spr_base_torso = spr_base_torso_up
		spr_base_head = spr_base_head_up
		spr_base_legs = spr_base_legs_up
		break
		}
	case "down":
		{
		spr_base_torso = spr_base_torso_down
		spr_base_head = spr_base_head_down
		spr_base_legs = spr_base_legs_down
		break
		}
	case "left":
		{
		spr_base_torso = spr_base_torso_left
		spr_base_head = spr_base_head_left
		spr_base_legs = spr_base_legs_left
		break
		}
	case "right":
		{
		spr_base_torso = spr_base_torso_right
		spr_base_head = spr_base_head_right
		spr_base_legs = spr_base_legs_right
		break
		}
	}
if (move = false){img_speed = 0; image_index = 0}else{img_speed = 100}

scr_check_for_hits("player")

holding_tick-=1*dt

//networking
net_update_tick-=1*dt
if (net_update_tick<=0)
	{
	net_update_tick = net_update_time
	buffer_seek(net_buffer, buffer_seek_start,0)
	buffer_write(net_buffer, buffer_u8, 7)
	if (System.mp_type = "client"){buffer_write(net_buffer, buffer_u8, System.mp_client_socket_number)}
	else{buffer_write(net_buffer, buffer_u8, 10)}
	buffer_write(net_buffer, buffer_u16, x) //x
	buffer_write(net_buffer, buffer_u16, y) //y
	switch(face)//facing: 0=right, 1=down, 2=left, 3=up
		{
		case "right":{buffer_write(net_buffer, buffer_u8, 0);break}
		case "down":{buffer_write(net_buffer, buffer_u8, 1);break}
		case "left":{buffer_write(net_buffer, buffer_u8, 2);break}
		case "up":{buffer_write(net_buffer, buffer_u8, 3);break}
		}
	buffer_write(net_buffer, buffer_u8, floor(image_index)) //image_index
	buffer_write(net_buffer, buffer_u16, dir) //holding dir
	if (System.mp_type = "client")
		{
		network_send_packet(System.mp_socket, net_buffer, buffer_tell(net_buffer))
		}
	if (System.mp_type = "server")
		{
		for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
			{
			network_send_packet(ds_list_find_value(System.mp_socket_list,i),net_buffer,buffer_tell(net_buffer))
			}
		}
	}

if (hp<=0)
	{
	phy_position_x = -9999
	phy_position_y = -9999
	revive+=1*dt
	if (revive>=reviveTime)
		{
		revive = 0
		hp = mhp
		if (team = "blue"){phy_position_x = spawn_blue.x;phy_position_y = spawn_blue.y;}
		if (team = "red"){phy_position_x = spawn_red.x;phy_position_y = spawn_red.y;}
		if (System.mp_type= "server"){scr_net_update_player_health(10, hp)}
		if (System.mp_type= "client"){scr_net_update_player_health(System.mp_client_socket_number, hp)}
		}
	}

if (keyboard_check_released(ord("1")))
	{
	Player.holding_invSlot = 1
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("2")))
	{
	Player.holding_invSlot = 2
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("3")))
	{
	Player.holding_invSlot = 3
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("4")))
	{
	Player.holding_invSlot = 4
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("5")))
	{
	Player.holding_invSlot = 5
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("6")))
	{
	Player.holding_invSlot = 6
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("7")))
	{
	Player.holding_invSlot = 7
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("8")))
	{
	Player.holding_invSlot = 8
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("9")))
	{
	Player.holding_invSlot = 9
	scr_swap_inventory()
	}
if (keyboard_check_released(ord("0")))
	{
	Player.holding_invSlot = 10
	scr_swap_inventory()
	}