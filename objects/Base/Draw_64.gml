switch(team)
	{
	case "blue":
		{
		draw_healthbar(256,16,(1920/2)-128,32, (hp/mhp)*100,c_black,c_aqua,c_aqua,0,true,false)
		break
		}
	case "red":
		{
		draw_healthbar(1920-256,16,(1920/2)+128,32, (hp/mhp)*100,c_black,c_red,c_red,0,true,false)
		break
		}
	}