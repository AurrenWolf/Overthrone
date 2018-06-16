if (gen)
	{
	if (team = "blue"){flag = instance_create_depth(x,y,0,EntityFlag_blue);flag.owner = self}
	if (team = "red"){flag = instance_create_depth(x,y,0,EntityFlag_red);flag.owner = self}
	if (team = "neutral"){}
	gen = false
	}
	

	
depth = 100-(y/(room_height/512))