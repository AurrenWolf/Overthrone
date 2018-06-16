if (gen)
	{
	if (team = "blue"){flag = instance_create_depth(x,y,0,StructureFlag_blue);flag.owner = self}
	if (team = "red"){flag = instance_create_depth(x,y,0,StructureFlag_red);flag.owner = self}
	if (team = "neutral"){}
	}
	

event_inherited()