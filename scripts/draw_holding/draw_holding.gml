var spr = 0
switch(argument0)
	{
	case 1:{spr = s_wep_handgun ;break}
	case 2:{spr = s_wep_dagger ;break}
	case 3:{spr = s_wep_rocketLauncher ;break}
	}
	
if (spr!=0)
	{
	for (var i=0; i<sprite_get_number(spr); i++)
		{
		draw_sprite_ext(spr,i,weaponX,weaponY-i,1,1,dir,c_white,1)
		}
	}