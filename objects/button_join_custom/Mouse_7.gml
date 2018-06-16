if (DEV_MODE)
	{
	System.mp_socket = network_create_socket(network_socket_tcp)
	if (System.mp_socket>=0)
		{
		var con = network_connect(System.mp_socket, "192.168.1.9", System.mp_default_port)
		if (con>=0)
			{
			System.mp_type = "client"
			room_goto(Lobby_Custom)
			}
		}
	}