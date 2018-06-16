x = Inventory_main.x+xx
y = Inventory_main.y

draw_self()
draw_healthbar(x,y+32,x+32,y+35, (Player.inventory_cooldown[slot]/Player.inventory_cooldownMax[slot])*100,c_black,c_yellow,c_red,0,true,false)

if (Player.holding_invSlot = slot)
	{
	draw_rectangle_color(x,y,x+sprite_width,y+sprite_height,c_white,c_white,c_white,c_white,true)
	}