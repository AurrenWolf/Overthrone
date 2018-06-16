event_inherited()

if (hp<=0)
	{
	instance_destroy()
	}
	
building+=1*dt
if (building>=buildTime)
	{
	built = true
	}

if (built)
{
drillTick-=1*dt
if (drillTick<=0)
	{
	drillTick = drillTime
	if (team = Player.team)
		{
		Game.money+=3
		}
	}
}