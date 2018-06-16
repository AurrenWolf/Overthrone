if (entity_number!=-1)
	{
	//draw_healthbar
	if (global.team = team){var col = c_lime}
	if (global.team != team){var col = c_red}
	if (hp< mhp){draw_healthbar(x-sprite_width/2, y-sprite_height/1.8, x+sprite_width/2, y-sprite_height/1.9,(hp/mhp)*100, c_black, col, col, 0, true, false)}
	}