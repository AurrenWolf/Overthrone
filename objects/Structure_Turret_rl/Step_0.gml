event_inherited()

if (hp<=0)
	{
	instance_destroy()
	}
	
if (team = "blue"){enemyFlag = EntityFlag_red}
if (team = "red"){enemyFlag = EntityFlag_blue}

weaponX = turretX + 8 * cos(degtorad(-dir))
weaponY = turretY + 8 * sin(degtorad(-dir))
	
if (built)
{
switch(state)
	{
	case "idle":
		{
		target = instance_nearest(x,y,enemyFlag).owner
		if (instance_exists(target))
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
		if (instance_exists(target))
			{
			if (point_distance(x,y,target.x,target.y)<=attack_range)
				{
				dir = point_direction(x,y,target.x,target.y)
				atkTick-=1*dt
				if (atkTick<=0)
					{
					atkTick = atkTime
					if (System.mp_type = "server")
						{
						launchX = weaponX + 16 * cos(degtorad(-dir))
						launchY = weaponY + 32 * sin(degtorad(-dir))
						var hitX = target.x+(random_range(-16,16))
						var hitY = target.y+(random_range(-16,16))
						if (Player.team = "blue"){var tm = 0}
						if (Player.team = "red"){var tm = 1}
						scr_net_create_entity(launchX, launchY+4, rocket, tm, hitX,hitY,atk)
						}
					}
				}
			else
				{
				state = "idle"
				}
			}
		else
			{
			state = "idle"
			}
		break
		}
	}
}
	
building+=1*dt
if (building>=buildTime)
	{
	built = true
	}