var buffer = buffer_create(32, buffer_grow, 1)

buffer_write(buffer, buffer_u8, 12) //index
buffer_write(buffer, buffer_u8, argument0) //if target is player (0) or entity (1)
buffer_write(buffer, buffer_u16, entity_number) //what minion
buffer_write(buffer, buffer_u16, x) //where they are X
buffer_write(buffer, buffer_u16, y) //where they are Y
buffer_write(buffer, buffer_u16, moveXX) //where they're going X
buffer_write(buffer, buffer_u16, moveYY) //where they're going Y

if (argument0 = 0)&&(target = NET_player){buffer_write(buffer, buffer_u16, target.owner)}
if (argument0 = 0)&&(target = Player)
	{
	if (System.mp_type = "server"){buffer_write(buffer, buffer_u16, 10)}
	if (System.mp_type = "client"){buffer_write(buffer, buffer_u16, System.mp_client_socket_number)}
	}
if (argument0 = 1)
	{
	buffer_write(buffer, buffer_u16, target.entity_number)
	}

buffer_write(buffer, buffer_f32, path_xoffset) //xoffset
buffer_write(buffer, buffer_f32, path_yoffset) //yoffset
buffer_write(buffer, buffer_u16, hp) //hp


if (System.mp_type = "server")
	{
	for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
		{
		network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_tell(buffer))
		}
	}

buffer_delete(buffer)