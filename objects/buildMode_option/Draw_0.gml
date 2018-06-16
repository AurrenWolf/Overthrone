x = buildMode_menu.x+xx
y = buildMode_menu.y+yy
draw_self()
draw_set_color(c_white)
draw_text_transformed(x+1,y,string(price),0.5,0.5,0)
if (MO)
	{
	draw_text_transformed(mouse_x,mouse_y,name,0.5,0.5,0)
	}