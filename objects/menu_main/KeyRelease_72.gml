System.mp_server = network_create_server(network_socket_tcp, System.mp_default_port, 5)
if (System.mp_server>0)
	{
	System.mp_type = "server"
	room_goto(Lobby)
	}