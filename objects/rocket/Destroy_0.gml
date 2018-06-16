if (System.mp_type = "server")
	{
	hit = instance_create_layer(x,y,"Instances",hit_rocketExplosion)
	hit.owner = -1
	hit.team = team
	hit.hit = 0
	hit.numberOfHits = 10
	hit.dmg = dmg

	scr_do_animation(x,y,0,0,0,0,2,true,0)
	}

event_inherited()