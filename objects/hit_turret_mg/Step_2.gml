if (instance_exists(owner))
		{
		team = owner.team
		}
	else
		{
		instance_destroy()
		}

if (hit>=numberOfHits)
	{
	instance_destroy()
	}
