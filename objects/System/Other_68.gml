event = async_load[? "type"]

switch (event)
	{
	case network_type_connect:
		{
		if (mp_type = "server")
			{
			ds_list_add(mp_socket_list, async_load[? "socket"])
			//give client their socket number
			var buffer = buffer_create(16, buffer_grow, 1)
			buffer_write(buffer, buffer_u8, 6)
			buffer_write(buffer, buffer_u8, async_load[? "socket"])
			network_send_packet(async_load[? "socket"], buffer, buffer_get_size(buffer))
			buffer_delete(buffer)
			if (System.mp_lobby_type = "custom")
				{
				
				//assign client their team
				var blueSize = ds_list_size(System.mp_team_list_blue)
				var redSize = ds_list_size(System.mp_team_list_red)
				var buffer = buffer_create(16, buffer_grow, 1)
				if (blueSize<=redSize)
					{
					//add to blue list
					ds_list_add(System.mp_team_list_blue, async_load[? "socket"])
					//send packet telling them they are blue team
					buffer_write(buffer, buffer_u8, 3)
					buffer_write(buffer, buffer_u8, 0)
					}
				else
					{
					//add to red list
					ds_list_add(System.mp_team_list_red, async_load[? "socket"])
					//send packet telling them they are red team
					buffer_write(buffer, buffer_u8, 3)
					buffer_write(buffer, buffer_u8, 1)
					}
				network_send_packet(async_load[? "socket"], buffer, buffer_get_size(buffer))
				buffer_delete(buffer)
				
				//update players with team lists
				//blue
				var buffer = buffer_create(128, buffer_grow, 1)
				buffer_write(buffer, buffer_u8, 4)
				for (var i = 0; i<ds_list_size(System.mp_team_list_blue); i++)
					{
					var read = ds_list_find_value(System.mp_team_list_blue, i)
					if (read = "Host"){read = 10}
					buffer_write(buffer, buffer_s8, read)
					}
				buffer_write(buffer, buffer_s8, -1)
				buffer_seek(buffer, buffer_seek_start, 0)
				for (var i = 0; i<ds_list_size(mp_socket_list); i++)
					{
					network_send_packet(ds_list_find_value(mp_socket_list, i), buffer, buffer_get_size(buffer))
					}
				buffer_delete(buffer)
				//red
				var buffer = buffer_create(128, buffer_grow, 1)
				buffer_write(buffer, buffer_u8, 5)
				for (var i = 0; i<ds_list_size(System.mp_team_list_red); i++)
					{
					var read = ds_list_find_value(System.mp_team_list_red, i)
					if (read = "Host"){read = 10}
					buffer_write(buffer, buffer_s8, read)
					}
				buffer_write(buffer, buffer_s8, -1)
				buffer_seek(buffer, buffer_seek_start, 0)
				for (var i = 0; i<ds_list_size(mp_socket_list); i++)
					{
					network_send_packet(ds_list_find_value(mp_socket_list, i), buffer, buffer_get_size(buffer))
					}
				buffer_delete(buffer)
				}
			}
		break
		}
	case network_type_disconnect:
		{
		var pos = ds_list_find_index(mp_socket_list, async_load[? "socket"])
		ds_list_delete(mp_socket_list, pos)
		if (room = Lobby_Custom)&&(mp_type = "server")
			{
			var buffer = buffer_create(16, buffer_grow, 1)
			buffer_write(buffer, buffer_u8,2)
			for (i=0; i<ds_list_size(System.mp_socket_list); i++)
				{
				network_send_packet(ds_list_find_value(System.socket_list,i), buffer, 16)
				}
			buffer_delete(buffer)
			ds_list_clear(mp_socket_list)
			network_destroy(mp_server)
			mp_server = 0
			room_goto(MainMenu)
			}
		break
		}
	case network_type_data:
		{
		//show_debug_message(string(buffer_read(async_load[? "buffer"], buffer_u8)))
		buffer_seek(async_load[? "buffer"], buffer_seek_start, 0)
		scr_net_handle_data(async_load[? "buffer"])
		}
	}