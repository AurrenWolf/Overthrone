draw_self()
if (team = "blue"){draw_set_color(c_aqua)}
if (team = "red"){draw_set_color(c_red)}
if (state = "move")
	{
	if (move){dir = point_direction(xprevious,yprevious,x,y)}
	draw_sprite_ext(s_e_1,0,x,y,0.5,0.5,dir,c_white,1)
	}
if (state = "attack")
	{
	if (instance_exists(target))
		{
		dir = point_direction(x,y,target.x,target.y)
		}
	draw_sprite_ext(s_e_1,0,x,y,0.5,0.5,dir,c_white,1)
	}
	
draw_text(x,y,entity_number)



draw_set_color(c_red)

event_inherited()