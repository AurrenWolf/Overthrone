draw_set_alpha(0.5)
draw_rectangle_color((room_width/2)-512,128,(room_width/2)-64,512,c_black,c_black,c_black,c_black,false)
draw_rectangle_color((room_width/2)+512,128,(room_width/2)+64,512,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)

draw_set_color(c_white)
if (System.mp_type = "server"){draw_text(6,6,"Press S to start.")}
for (var i=0; i<ds_list_size(System.mp_team_list_blue); i++)
	{
	draw_text((room_width/2)-500,128+(30*i)+12,"Player ("+string(ds_list_find_value(System.mp_team_list_blue,i))+")")
	}
for (var i=0; i<ds_list_size(System.mp_team_list_red); i++)
	{
	draw_text((room_width/2)+64+12,128+(30*i)+12,"Player ("+string(ds_list_find_value(System.mp_team_list_red,i))+")")
	}
