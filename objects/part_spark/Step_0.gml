life-=1*dt

x+=xx*dt
y+=yy*dt

if (life<=0)
	{
	image_alpha-=10*dt
	}
if (image_alpha<=0)
	{
	instance_destroy()
	}