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