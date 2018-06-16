if (gen)
	{
	dir = -point_direction(x,y,hitX,hitY)
	phy_rotation = dir
	physics_apply_local_force(0,0,1000,0)
	owner = self
	}
	
//physics_apply_local_force(0,1,10,0)
	
phy_rotation = dir

height-=4*dt

instance_create_layer(x,y-height,"Particles",part_smoke_small)

life-=1*dt
if (life<=0)||(point_distance(x,y,originX,originY)>450)||(height = 0)||(point_distance(x,y,hitX,hitY)<4)
	{
	instance_destroy()
	}

	
event_inherited()