x = camera_get_view_x(view_get_camera(view_current))+2
y = camera_get_view_y(view_get_camera(view_current))+(1080/2)-38

draw_set_alpha(0.5)
draw_rectangle_color(x,y-4,x+(36*10)+4,y+36,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1)