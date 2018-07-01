buffer = argument0

var index = buffer_read(buffer, buffer_u8)
switch(index)
	{
	case 1://go in to game
		{
		room_goto(Arena)
		break
		}
	case 2://return to main menu
		{
		room_goto(MainMenu)
		break
		}
	case 3://get given team
		{
		var team = buffer_read(buffer, buffer_u8)
		if (team = 0){global.team = "blue"}
		if (team = 1){global.team = "red"}
		show_debug_message("Assigned to "+global.team+" team.")
		break
		}
	case 4://update blue team list
		{
		ds_list_clear(System.mp_team_list_blue)
		for (var i=0; i<3; i++)
			{
			var read = buffer_read(buffer, buffer_s8)
			if (read != -1)
				{
				ds_list_add(System.mp_team_list_blue, read)
				}
			else{i = 3}
			}
		break
		}
	case 5://update red team list
		{
		ds_list_clear(System.mp_team_list_red)
		for (var i=0; i<3; i++)
			{
			var read = buffer_read(buffer, buffer_s8)
			if (read != -1)
				{
				ds_list_add(System.mp_team_list_red, read)
				}
			else{i = 3}
			}
		break
		}
	case 6: //given socket number asigned by server (used to be given to server to tell server what socket they are)
		{
		System.mp_client_socket_number = buffer_read(buffer, buffer_u8)
		break
		}
	case 7: //update Player info
		{
		from = buffer_read(buffer, buffer_u8)
		with (NET_player)
			{
			if (other.from = owner)
				{
				//show_debug_message("net_player receiving data for owner: "+string(other.from))
				phy_position_x = buffer_read(other.buffer, buffer_u16)
				phy_position_y = buffer_read(other.buffer, buffer_u16)
				var faceIndex = buffer_read(other.buffer, buffer_u8)
				switch (faceIndex)
					{
					case 0:{face = "right";break}
					case 1:{face = "down";break}
					case 2:{face = "left";break}
					case 3:{face = "up";break}
					}
				image_index = buffer_read(other.buffer, buffer_u8)
				dir = buffer_read(other.buffer, buffer_u16)
				}
			}
		if (mp_type = "server")//if server send this info out to other players
			{
			buffer_seek(buffer, buffer_seek_start, 0)
			for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
				}
			}

		break
		}
	case 8://do an animation
		{
		show_debug_message("Do Net Animation")
		var originX = buffer_read(buffer,buffer_u16)
		var originY = buffer_read(buffer,buffer_u16)
		var weaponX = buffer_read(buffer,buffer_u16)
		var weaponY = buffer_read(buffer,buffer_u16)
		var hitX = buffer_read(buffer,buffer_u16)
		var hitY = buffer_read(buffer,buffer_u16)
		var anim_index = buffer_read(buffer,buffer_u16)
		var wep_dir = buffer_read(buffer,buffer_u16)
		show_debug_message("Doing Net Animation: "+string(anim_index))
		scr_do_animation(originX,originY,weaponX,weaponY,hitX,hitY,anim_index,false, wep_dir)
		if (mp_type = "server")
			{
			buffer_seek(buffer, buffer_seek_start, 0)
			for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
				}
			}
		break
		}
	case 9://damage a player
		{
		read_ply = buffer_read(buffer, buffer_u8)
		read_dmg = buffer_read(buffer, buffer_u16)
		with (NET_player)
			{
			if (other.read_ply = owner)
				{
				hp-=other.read_dmg
				}
			}
		if (System.mp_type = "client")
			{
			if (read_ply = System.mp_client_socket_number)
				{
				Player.hp-=read_dmg
				}
			}
		if (System.mp_type = "server")
			{
			if (read_ply = 10)
				{
				Player.hp-=read_dmg
				}
			buffer_seek(buffer, buffer_seek_start, 0)
			for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
				}
			}
		break
		}
	case 10: //create entity
		{
		var xx = buffer_read(buffer, buffer_u16)
		var yy = buffer_read(buffer, buffer_u16)
		var obj = buffer_read(buffer, buffer_u16)
		var arg1 = buffer_read(buffer, buffer_u16)
		var arg2 = buffer_read(buffer, buffer_u16)
		var arg3 = buffer_read(buffer, buffer_u16)
		var arg4 = buffer_read(buffer, buffer_u16)
		var ent_num = buffer_read(buffer, buffer_u16)
		
		scr_create_entity(xx, yy, obj, arg1, arg2, arg3, arg4, ent_num)
		
		if (System.mp_type = "server")
			{
			for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
				}
			}
		
		break
		}
	case 11: //request from client for an entity to be created
		{
		var xx = buffer_read(buffer, buffer_u16)
		var yy = buffer_read(buffer, buffer_u16)
		var obj = buffer_read(buffer, buffer_u16)
		var arg1 = buffer_read(buffer, buffer_u16)
		var arg2 = buffer_read(buffer, buffer_u16)
		var arg3 = buffer_read(buffer, buffer_u16)
		var arg4 = buffer_read(buffer, buffer_u16)
		
		scr_net_create_entity(xx,yy,obj,arg1,arg2,arg3,arg4)
		break	
		}
	case 12: //minion data to keep minions in relatively the same place.
		{
		targetType = buffer_read(buffer, buffer_u8)
		entityNum = buffer_read(buffer, buffer_u16)
		read_x = buffer_read(buffer, buffer_u16)
		read_y = buffer_read(buffer, buffer_u16)
		read_moveX = buffer_read(buffer, buffer_u16)
		read_moveY = buffer_read(buffer, buffer_u16)
		read_target = buffer_read(buffer, buffer_u16)
		read_xoffset = buffer_read(buffer, buffer_f32)
		read_yoffset = buffer_read(buffer, buffer_f32)
		read_hp = buffer_read(buffer, buffer_u16)
		
		with (Entity)
			{
			if (entity_number = other.entityNum)
				{
				hp = other.read_hp
				path_xoffset = other.read_xoffset
				path_yoffset = other.read_yoffset
				pathSuccess = true
				if (point_distance(other.read_x, other.read_y, x,y)>8)
					{
					phy_position_x = other.read_x
					phy_position_y = other.read_y
					}
				x = phy_position_x
				y = phy_position_y
				target = self
				targetEntityNumber = other.read_target
				if (other.targetType = 1)
				{
				with (Entity)
					{
					if (entity_number = other.targetEntityNumber)
						{
						other.target = self
						}
					}
				}
				if (other.targetType = 0)
					{
					target = Player
					with (NET_player)
						{
						if (other.targetEntityNumber = owner)
							{
							other.target = self
							}
						}
					if (System.mp_type = "server")
						{
						if (targetEntityNumber = 10){target = Player}
						}
					if (System.mp_type = "client")
						{
						if (targetEntityNumber = System.mp_client_socket_number){target = Player}
						}
					}
				if (instance_exists(target))
				{
				moveXX = floor(target.x+((target.sprite_width/2)*path_xoffset)+path_xoffset)
				moveYY = floor(target.y+((target.sprite_height/2)*path_yoffset)+path_yoffset)
				if (mp_grid_path(Game.colGrid,pathFinding,(x div 16)*16,(y div 16)*16,moveXX,moveYY,true))
					{
					pathSuccess = true
					pathPoint_x = path_get_point_x(pathFinding,1)
					pathPoint_y = path_get_point_y(pathFinding,1)
					}
				else
					{
					pathSuccess = false
					pathPoint_x = -1
					pathPoint_y = -1
					}
				}
				else{target = self}
				}
			}
		
		break
		}
	case 13://damage an entity
		{
		read_ent = buffer_read(buffer, buffer_u16)
		read_dmg = buffer_read(buffer, buffer_u16)
		with (Entity)
			{
			if (other.read_ent = entity_number)
				{
				hp-=other.read_dmg
				}
			}
		
		if (System.mp_type = "server")
			{
			buffer_seek(buffer, buffer_seek_start, 0)
			for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
				}
			}
		break
		}
	case 14://update player health
		{
		read_ply = buffer_read(buffer, buffer_u8)
		read_hp = buffer_read(buffer, buffer_u16)
		with (NET_player)
			{
			if (other.read_ply = owner)
				{
				hp=other.read_hp
				}
			}
		if (System.mp_type = "client")
			{
			if (read_ply = System.mp_client_socket_number)
				{
				Player.hp=read_hp
				}
			}
		if (System.mp_type = "server")
			{
			if (read_ply = 10)
				{
				Player.hp=read_hp
				}
			buffer_seek(buffer, buffer_seek_start, 0)
			for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
				}
			}
		break
		}
	case 15:
		{
		read_num = buffer_read(buffer, buffer_u16)
		with (Entity)
			{
			if (other.read_num = entity_number)
				{
				instance_destroy()
				}
			}
		break
		}
	case 16://client telling host they are in game
		{
		if (instance_exists(Game))
			{
			Game.playersConnected++
			}
		break
		}
	}
buffer_delete(buffer)