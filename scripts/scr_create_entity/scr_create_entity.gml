ent = noone

var arg1 = argument3
var arg2 = argument4
var arg3 = argument5
var arg4 = argument6

ent = instance_create_layer(argument0, argument1, "Instances", argument2)
switch (argument2)
	{
	case Troop:
		{
		if (arg1 = 0){ent.team = "blue"}
		if (arg1 = 1){ent.team = "red"}
		break
		}
	case Structure_Wall:
		{
		if (arg1 = 0){ent.team = "blue"}
		if (arg1 = 1){ent.team = "red"}
		break
		}
	case Structure_Turret_mg:
		{
		if (arg1 = 0){ent.team = "blue"}
		if (arg1 = 1){ent.team = "red"}
		break
		}
	case Structure_Turret_rl:
		{
		if (arg1 = 0){ent.team = "blue"}
		if (arg1 = 1){ent.team = "red"}
		break
		}
	case Structure_Drill:
		{
		if (arg1 = 0){ent.team = "blue"}
		if (arg1 = 1){ent.team = "red"}
		break
		}
	case rocket:
		{
		if (arg1 = 0){ent.team = "blue"}
		if (arg1 = 1){ent.team = "red"}
		ent.hitX = arg2
		ent.hitY = arg3
		ent.dmg = arg4
		break
		}
	case Structure_Rock:
		{
		team = "neutral"
		break
		}
	}
ent.entity_number = argument7
ds_grid_add(Game.entity_grid,ent.entity_number,1,ent)


return ent