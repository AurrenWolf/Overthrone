draw_set_alpha(0.5)
draw_sprite(s_hud_healthbar_back,0,x-48,y-64)
if (argument0!=global.team)
	{
	var color = c_red
	}
else{var color = c_lime}
draw_healthbar(x-48,y-64,x-48+93,y-64+13,(hp/mhp)*100,c_black,color,color,0,false,false)
draw_set_alpha(1)