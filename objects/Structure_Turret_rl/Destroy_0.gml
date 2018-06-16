if (team!=Player.team)
	{
	Game.money+=10
	if (point_distance(x,y,Player.x,Player.y)<room_width/4)
		{
		Game.money+=10
		}
	}
event_inherited()