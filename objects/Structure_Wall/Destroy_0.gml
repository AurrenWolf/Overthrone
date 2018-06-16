if (team!=Player.team)
	{
	Game.money+=5
	if (point_distance(x,y,Player.x,Player.y)<room_width/4)
		{
		Game.money+=5
		}
	}
event_inherited()