switch (buildmode)
	{
	case true:
		{
		y = camera_get_view_y(view_get_camera(view_current))
		x = camera_get_view_x(view_get_camera(view_current))+camera_get_view_width(view_get_camera(view_current))-sprite_width+(32/2)
		break
		}
	case false:
		{
		building = -1
		building_price = 0
		y = camera_get_view_y(view_get_camera(view_current))
		x = camera_get_view_x(view_get_camera(view_current))+camera_get_view_width(view_get_camera(view_current))
		break
		}
	}


if (building!=-1)
	{
	if (building_able){var col = c_lime}
	if (building_able=false){var col = c_red}

	draw_sprite_ext(build_spr,0,(mouse_x div 32)*32,(mouse_y div 32)*32,1,1,0,col,0.8)

	}

	
draw_self()
draw_set_color(c_white)
draw_text_transformed(x,y+(sprite_height/2)-70,"Press (B) to toggle Build Mode",0.5,0.5,-90)