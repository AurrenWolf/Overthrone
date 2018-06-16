

if (inventory_cooldown[holding_invSlot]<0)&&(buildMode_menu.buildmode = false)
{
switch(argument0)
	{
	case 1:
		{
		var dist = point_distance(x,y,Cursor.x,Cursor.y)
		if (dist<holding_range)
			{
			inventory_cooldown[holding_invSlot] = holding_tickTime
			inventory_cooldownMax[holding_invSlot] = holding_tickTime
			var hitX = Cursor.x+(random_range(-dist,dist)/holding_accuracy)
			var hitY = Cursor.y+(random_range(-dist,dist)/holding_accuracy)
			scr_do_animation(x,y,weaponX,weaponY,hitX, hitY, 1, true,dir)
			hit = instance_create_layer(hitX, hitY,"Instances", hit_handgun)
			hit.owner = self
			hit.dmg = holding_damage
			}
		break
		}
	case 2:
		{
		var dist = point_distance(x,y,Cursor.x,Cursor.y)
		if (dist<holding_range)
			{
			inventory_cooldown[holding_invSlot] = holding_tickTime
			inventory_cooldownMax[holding_invSlot] = holding_tickTime
			anim = instance_create_layer(weaponX, weaponY,"Particles",part_melee_strike)
			anim.dir = dir
			}
		break
		}
	case 3:
		{
		var dist = point_distance(x,y,Cursor.x,Cursor.y)
		if (dist<holding_range)
			{
			inventory_cooldown[holding_invSlot] = holding_tickTime
			inventory_cooldownMax[holding_invSlot] = holding_tickTime
			var hitX = Cursor.x+(random_range(-dist,dist)/holding_accuracy)
			var hitY = Cursor.y+(random_range(-dist,dist)/holding_accuracy)
			if (Player.team = "blue"){var tm = 0}
			if (Player.team = "red"){var tm = 1}
			if (System.mp_type = "server")
				{
				scr_net_create_entity(weaponX, weaponY+4, rocket, tm, hitX,hitY,holding_damage)
				}
			if (System.mp_type = "client")
				{
				scr_net_request_create_entity(weaponX, weaponY+4, rocket, tm, hitX,hitY,holding_damage)
				}
			}
		break
		}
	}
}