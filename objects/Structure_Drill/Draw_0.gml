if (built)
	{
	draw_self()
	if (team = "blue"){draw_sprite_ext(decalSprite, 0,x,y,image_xscale,image_yscale,0,c_aqua,1)}
	if (team = "red"){draw_sprite_ext(decalSprite, 0,x,y,image_xscale,image_yscale,0,c_red,1)}
	}
else
	{
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,0.5)
	}
event_inherited()