if (building<buildTime)
	{
	draw_healthbar(x-sprite_width/2, y+sprite_height/1.8, x+sprite_width/2, y+sprite_height/1.9,(building/buildTime)*100, c_black, c_yellow, c_yellow, 0, true, false)
	}
event_inherited()