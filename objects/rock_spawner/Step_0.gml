/// @description Insert description here
// You can write your code in this editor
if (Game.initGen)
	{
	if (System.mp_type = "server")
		{
		scr_net_create_entity(x, y, Structure_Rock, 0, 0,0,0)
		}
	instance_destroy()
	}