if (DEV_MODE)
	{
	System.mp_server = network_create_server(network_socket_tcp, System.mp_default_port, 5)
	if (System.mp_server>=0)
		{
		ds_list_add(System.mp_team_list_blue, "Host")
		global.team = "blue"
		System.mp_type = "server"
		room_goto(Lobby_Custom)
		}
	}