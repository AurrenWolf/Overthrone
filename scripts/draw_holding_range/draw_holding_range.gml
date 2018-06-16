var range = 0

range = holding_range	

var color = c_white
if (point_distance(x,y,Cursor.x, Cursor.y)>range)
	{
	color = c_red
	}
gpu_set_blendmode(bm_add)

draw_set_alpha(0.2)
draw_circle_color(x,y,range,c_black,color,true)
draw_set_alpha(1)
gpu_set_blendmode(bm_normal)