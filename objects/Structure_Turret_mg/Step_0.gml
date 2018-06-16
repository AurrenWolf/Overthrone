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
						hit = instance_create_layer(target.x+random_range(-1,1), target.y+random_range(-1,1),"Instances", hit_turret_mg)
						hit.owner = self
						hit.dmg = atk
						scr_do_animation(turretX,turretY,weaponX,weaponY,hit.x, hit.y, 1, true,dir)
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