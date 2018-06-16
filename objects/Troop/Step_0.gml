phy_rotation = 0

if (gen)
	{
	//give primary orders
	if (team = "blue")
		{
		target = instance_nearest(x,y,StructureFlag_red).owner
		}
	if (team = "red")
		{
		target = instance_nearest(x,y,StructureFlag_blue).owner
		}
	if (target!=noone){state = "move"}
	}
event_inherited()



enemyCheck_tick-=1*dt
networkTick-=1*dt

if (!instance_exists(target))
	{
	target = noone
	}

if (target = noone)
	{
	switch(team)
		{
		case "blue":
			{
			nearEntity = instance_nearest(x,y,EntityFlag_red).owner
			break
			}
		case "red":
			{
			nearEntity = instance_nearest(x,y,EntityFlag_blue).owner
			break
			}
		}
	target = nearEntity
	}
	
if (!instance_exists(target))
	{
	exit
	}

switch(state)
	{
	case "move":
		{
		pathFinding_tick-=1*dt
		if (pathFinding_tick<=0)
			{
			pathFinding_tick = pathFinding_time
			if (pathSuccess = false)
				{
				path_xoffset = random_range(-1.2,1.2)
				path_yoffset = random_range(-1.2,1.2)
				}
			moveXX = floor(target.x+((target.sprite_width/2)*path_xoffset)+path_xoffset)
			moveYY = floor(target.y+((target.sprite_height/2)*path_yoffset)+path_yoffset)
			if (mp_grid_path(Game.colGrid,pathFinding,(x div 16)*16,(y div 16)*16,moveXX,moveYY,true))
				{
				pathSuccess = true
				pathPoint_x = path_get_point_x(pathFinding,1)
				pathPoint_y = path_get_point_y(pathFinding,1)
				}
			else
				{
				pathSuccess = false
				pathPoint_x = -1
				pathPoint_y = -1
				}
			}
		if (enemyCheck_tick<=0)
			{
			enemyCheck_tick = enemyCheck_time
			switch(team)
				{
				case "blue":
					{
					nearEntity = instance_nearest(x,y,EntityFlag_red).owner
					break
					}
				case "red":
					{
					nearEntity = instance_nearest(x,y,EntityFlag_blue).owner
					break
					}
				}
			if (instance_exists(nearEntity))
				{
				if (point_distance(x,y,nearEntity.x,nearEntity.y)<=attack_range)
					{
					target = nearEntity
					}
				}
			else
				{
				target = noone
				}
			
			}
		if (pathPoint_x!=-1)
			{
			moveX = pathPoint_x
			moveY = pathPoint_y
			}
		else
			{
			moveX = target.x
			moveY = target.y
			}
			
		if (x<moveX)
			{
			if (point_distance(x,y,moveX,y)>2)
				{
				phy_speed_x=(stat_speed*dt)
				}
			}
		if (x>moveX)
			{
			if (point_distance(x,y,moveX,y)>2)
				{
				phy_speed_x=-(stat_speed*dt)
				}
			}
		if (y<moveY)
			{
			if (point_distance(x,y,x,moveY)>2)
				{
				phy_speed_y=(stat_speed*dt)
				}
			}
		if (y>moveY)
			{
			if (point_distance(x,y,x,moveY)>2)
				{
				phy_speed_y=-(stat_speed*dt)
				}
			}
		if (target!=noone)
			{
			if (point_distance(x,y,target.x,target.y)<=attack_range)
				{
				state = "attack"
				}
			}
		break
		}
	case "attack":
		{
		atkTick-=1*dt
		if (atkTick<=0)
			{
			atkTick = atkTime
			if (instance_exists(target))
			{
			if (point_distance(x,y,target.x,target.y)<= attack_range)
				{
				if (System.mp_type = "server")
					{
					hit = instance_create_layer(target.x+random_range(-1,1), target.y+random_range(-1,1),"Instances", hit_troop)
					hit.owner = self
					hit.dmg = atk
					scr_do_animation(x,y,x,y,hit.x, hit.y, 1, true,dir)
					}
				}
			else{state = "move"}
			}
			else
				{
				target = noone
				state = "move"
				}
			}
		break
		}
	}
	
if (networkTick<=0)
	{
	networkTick = networkTime
	if (System.mp_type = "server")
		{
		if (target!=noone)
			{
			if (target = NET_player)||(target = Player)
				{
				scr_net_send_minion_data(0)
				}
			else{scr_net_send_minion_data(1)}
			}
		
		}
	}
	
	
if (hp<=0)
	{
	instance_destroy()
	}
	