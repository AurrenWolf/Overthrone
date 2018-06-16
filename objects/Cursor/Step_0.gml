col = collision_point(x,y,Entity,true,false)
if (col!=noone)
	{
	if (col.team!= global.team)
		{
		color = c_red
		}
	else
		{
		color = c_lime
		}
	}
else
	{
	color = c_white
	}