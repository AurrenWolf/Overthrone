if (gen)
	{
	switch(team)
		{
		case "blue":
			{
			spawn_x = x+96
			spawn_y = y
			entity_number = 1
			ds_grid_add(Game.entity_grid,entity_number,1,self)
			break}
		case "red":
			{
			spawn_x = x-96
			spawn_y = y
			entity_number = 2
			ds_grid_add(Game.entity_grid,entity_number,1,self)
			break}
		}
	}
	
event_inherited()

if (System.mp_type = "server")
	{
	if (Game.initGen)
		{
		spawnTick-=1*dt
		}
	if (spawnTick<=0)
		{
		spawnTick = spawnTickTime
		repeat(squadSize)
			{
			if (team = "blue"){var tm = 0}
			if (team = "red"){var tm = 1}
			scr_net_create_entity(spawn_x+random_range(-16,16),spawn_y+random_range(-16,16),Troop,tm,0,0,0)
			}
		}
	}

