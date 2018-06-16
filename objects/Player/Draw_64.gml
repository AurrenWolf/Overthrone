if (hp<=0)
{
draw_set_alpha(0.5)
draw_rectangle_color(0,(1080/2)-48,1920,(1080/2)+48,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1)
draw_set_font(fnt_game_large)
draw_set_color(c_white)
var text = "Respawn in "+string(ceil(reviveTime-revive))+"..."
var strWidth = string_width_ext(text,8,512)
draw_text_ext((1920/2)-(strWidth/2),1080/2,text, 8, 512)
draw_set_font(fnt_game)
}