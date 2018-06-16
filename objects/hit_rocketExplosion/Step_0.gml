if (instance_exists(owner))
		{
		team = owner.team
		}
	else
		{
		instance_destroy()
		}

if (life<=0)
	{
	instance_destroy()
	}
life--