if (!position_meeting(mouse_x,mouse_y,self))&&(building_able)&&(building!=-1)
{
if (Player.team = "blue"){var tm = 0}
if (Player.team = "red"){var tm = 1}
if (System.mp_type = "server")
	{
	scr_net_create_entity((floor(mouse_x) div 32)*32, (floor(mouse_y) div 32)*32, building, tm, 0,0,0)
	}
if (System.mp_type = "client")
	{
	scr_net_request_create_entity((floor(mouse_x) div 32)*32, (floor(mouse_y) div 32)*32, building, tm, 0,0,0)
	}
Game.money-=building_price
}