if (team = "blue"){var tm = 0}
if (team = "red"){var tm = 1}
if (System.mp_type = "server")
	{
	scr_net_create_entity(floor(mouse_x), floor(mouse_y), Troop, tm, 0,0,0)
	}
if (System.mp_type = "client")
	{
	scr_net_request_create_entity(floor(mouse_x), floor(mouse_y), Troop, tm, 0,0,0)
	}