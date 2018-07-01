/// @description Insert description here
// You can write your code in this editor
if (playersConnected>= ds_list_size(System.mp_team_list_blue)+ds_list_size(System.mp_team_list_red))
	{
	initGen = true
	}

colGrid_updateTick-=(1*dt)
if (colGrid_updateTick<=0)
	{
	mp_grid_clear_all(Game.colGrid)
	mp_grid_add_instances(Game.colGrid, Structure, false)
	colGrid_updateTick = colGrid_updateTickTime
	}
	
if (entity_grid_cursor >8000)
	{
	entity_grid_cursor = 3
	}