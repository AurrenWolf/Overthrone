if (System.mp_type = "server")
	{
	var buffer = buffer_create(16, buffer_u8, 1)
	buffer_write(buffer, buffer_u8, 1)
	for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
		{
		network_send_packet(ds_list_find_value(System.mp_socket_list, i), buffer, 16)
		}
	buffer_delete(buffer)
	room_goto(Arena)
	}
