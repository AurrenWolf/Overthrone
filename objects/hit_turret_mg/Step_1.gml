

if (gen)
	{
	if (instance_exists(owner))
		{
		team = owner.team
		}
	else
		{
		instance_destroy()
		}
	gen = false
	}