if (team!=Player.team)
	{
	Game.money+=100
	if (point_distance(x,y,Player.x,Player.y)<room_width/4)
		{
		Game.money+=50
		}
	}
	
event_inherited()