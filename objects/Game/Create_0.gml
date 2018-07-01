team = noone

playersConnected = 0
initGen = false

if (mp_type = "server")
	{
	playersConnected++
	}

instance_create_layer(0,0,"UI",Camera)
instance_create_layer(0,0,"UI",buildMode_menu)
instance_create_layer(0,0,"UI",Inventory_main)

//pathfinding
colGrid_cell_width = 16
colGrid_cell_height = 16

colGrid_cells_h = room_width div colGrid_cell_width
colGrid_cells_v = room_height div colGrid_cell_height

colGrid = mp_grid_create(0,0,colGrid_cells_h,colGrid_cells_v,colGrid_cell_width,colGrid_cell_height)

colGrid_updateTick = 0
colGrid_updateTickTime = 1

//entity grid
entity_grid = ds_grid_create(8192, 8)
entity_grid_cursor = 3
ds_grid_set_region(entity_grid, 0, 0, ds_grid_width(entity_grid), ds_grid_height(entity_grid), noone)

money = 1000


//create your player
switch(global.team)
	{
	case "blue":{instance_create_layer(spawn_blue.x,spawn_blue.y,"Instances", Player);break}
	case "red":{instance_create_layer(spawn_red.x,spawn_red.y,"Instances", Player);break}
	}
	
//create player representations
for (var i=0; i<ds_list_size(System.mp_team_list_blue); i++)
	{
	var read = ds_list_find_value(System.mp_team_list_blue, i)
	if (read != System.mp_client_socket_number)&&(read != "Host")
		{
		ply = instance_create_layer(-64,-64,"Instances", NET_player)
		ply.owner = read
		ply.team = "blue"
		}
	}
for (var i=0; i<ds_list_size(System.mp_team_list_red); i++)
	{
	var read = ds_list_find_value(System.mp_team_list_red, i)
	if (read != System.mp_client_socket_number)&&(read != "Host")
		{
		ply = instance_create_layer(-64,-64,"Instances", NET_player)
		ply.owner = read
		ply.team = "red"
		}
	}
	
display_set_gui_size(1920, 1080);