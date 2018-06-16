if (building!=-1)
	{
	build_spr = object_get_sprite(building)
	switch(building)
		{
		case Structure_Wall:
			{
			building_width = 32
			building_height = 32
			break
			}
		case Structure_Drill:
			{
			building_width = 32
			building_height = 32
			break
			}
		case Structure_Turret_mg:
			{
			building_width = 32
			building_height = 32
			break
			}
		case Structure_Turret_rl:
			{
			building_width = 32
			building_height = 32
			break
			}
		}
	if (!collision_rectangle(((Cursor.x div 32)*32)-(building_width/2)+1,((Cursor.y div 32)*32)-(building_height/2)+1,((Cursor.x div 32)*32)+(building_width/2)-1,((Cursor.y div 32)*32)+(building_height/2)-1,Entity,false,true))&&(building_price<=Game.money)
		{
		building_able = true
		if (building = Structure_Drill)
			{
			if (!collision_rectangle(((Cursor.x div 32)*32)-(building_width/2)+1,((Cursor.y div 32)*32)-(building_height/2)+1,((Cursor.x div 32)*32)+(building_width/2)-1,((Cursor.y div 32)*32)+(building_height/2)-1,Resource,false,true))
				{
				building_able = false
				}
			}
		}
	else
		{
		building_able = false
		
		}
	}
