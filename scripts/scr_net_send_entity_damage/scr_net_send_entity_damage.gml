var entityNum = argument0
var dmg = argument1

var buffer = buffer_create(32, buffer_grow, 1)
buffer_write(buffer, buffer_u8, 13)
buffer_write(buffer, buffer_u16, entityNum)
buffer_write(buffer, buffer_u16, dmg)

if (System.mp_type = "client")
	{
	network_send_packet(System.mp_socket, buffer, buffer_tell(buffer))
	}
if (System.mp_type = "server")
	{
	for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
		{
		network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_get_size(buffer))
		}
	}