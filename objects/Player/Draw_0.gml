draw_set_alpha(0.4)
draw_rectangle_color(x-4,y+8,x+3,y+10,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)
weaponX = x + 10 * cos(degtorad(-dir))
weaponY = y + 10 * sin(degtorad(-dir))
if (dir<180){draw_holding(holding)}

switch(face)
	{
	case "up":{flip = 1; break}
	case "down":{flip = 1; break}
	case "right":{flip = 1; break}
	case "left":{flip = -1; break}
	}
runOffset = 0
if (floor(image_index) = 0)||(floor(image_index) = 2)
	{
	runOffset = 0
	}
else{runOffset = 1}

draw_sprite_ext(spr_base_torso, 0, x, y-runOffset, flip,1,0,skin_color,1)
draw_sprite_ext(spr_base_head, 0, x, y-7-runOffset, flip,1,0,skin_color,1)
draw_sprite_ext(spr_base_legs, image_index, x, y+5-runOffset, 1,1,0,skin_color,1)

if (dir>=180){draw_holding(holding)}

draw_holding_range(holding)
if (hp>0){draw_player_healthbar(global.team)}
