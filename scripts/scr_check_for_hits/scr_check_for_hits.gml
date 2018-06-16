hitCol = collision_circle(x,y,sprite_width/2,Hit,false,true)
var checkType = argument0


if (hitCol!=noone)&&(instance_exists(hitCol))
	{
	if (hitCol.team != "none")
	{
	if (hitCol.team!=team)&&(hitCol.hit<hitCol.numberOfHits)
		{
		hitCol.hit++
		var dmg = hitCol.dmg
		if (checkType = "net_player")
			{
			if (System.mp_type="server")
				{
				hp-=dmg
				}
			scr_net_send_player_damage(owner, dmg)
			}
		if (checkType = "player")
			{
			if (System.mp_type = "server"){var playIndex = 10}
			if (System.mp_type = "client"){var playIndex = System.mp_client_socket_number}
			if (System.mp_type="server")
				{
				hp-=dmg
				}
			scr_net_send_player_damage(playIndex, dmg)
			
			}
		if (checkType = "entity")
			{
			if (System.mp_type="server")
				{
				hp-=dmg
				}
			scr_net_send_entity_damage(entity_number, dmg)
			
			}
		}
	}
	}