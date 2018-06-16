ds_grid_destroy(weapon_stats_grid)
ds_list_destroy(mp_socket_list)
if (mp_server!=0)
	{
	network_destroy(mp_server)
	}
if (mp_socket!=0)
	{
	network_destroy(mp_socket)
	}
ds_list_destroy(mp_team_list_blue)
ds_list_destroy(mp_team_list_red)