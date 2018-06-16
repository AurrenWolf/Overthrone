#macro dt ((delta_time/1000000))

time = 0


//networking
mp_type = "none"
mp_lobby_type = "none"
mp_socket_list = ds_list_create()
mp_server = 0
mp_socket = 0
mp_default_port = 6510
mp_team_list_blue = ds_list_create()
mp_team_list_red = ds_list_create()
mp_client_socket_number = -1

//weapon stats
weapon_stats_grid = ds_grid_create(512,64)
//1 = name
//2 = range
//3 = accuracy
//4 = tick time
//5 = damage
ds_grid_add(weapon_stats_grid, 1, 1, "Handgun")
ds_grid_add(weapon_stats_grid, 1, 2, 256)
ds_grid_add(weapon_stats_grid, 1, 3, 10)
ds_grid_add(weapon_stats_grid, 1, 4, 0.4)
ds_grid_add(weapon_stats_grid, 1, 5, 32)

ds_grid_add(weapon_stats_grid, 2, 1, "Dagger")
ds_grid_add(weapon_stats_grid, 2, 2, 48)
ds_grid_add(weapon_stats_grid, 2, 3, 100)
ds_grid_add(weapon_stats_grid, 2, 4, 0.4)
ds_grid_add(weapon_stats_grid, 2, 5, 50)

ds_grid_add(weapon_stats_grid, 3, 1, "Rocket Launcher")
ds_grid_add(weapon_stats_grid, 3, 2, 450)
ds_grid_add(weapon_stats_grid, 3, 3, 10)
ds_grid_add(weapon_stats_grid, 3, 4, 2)
ds_grid_add(weapon_stats_grid, 3, 5, 80)