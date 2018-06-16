//if an entity has been destroyed
var entNum = argument0

var buffer = buffer_create(32, buffer_grow, 1)
buffer_write(buffer, buffer_u8, 15)
buffer_write(buffer, buffer_u16, entNum)

if (System.mp_type = "server")
	{
	for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
		{
		network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_tell(buffer))
		}
	}

buffer_delete(buffer)