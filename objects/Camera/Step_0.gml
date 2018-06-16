if (Player.hp<=0)
	{
	
	}
else{
gotoX = Player.x
gotoY = Player.y
if (aiming)
	{
	gotoX = (Player.x+Cursor.x)/2
	gotoY = (Player.y+Cursor.y)/2
	}

x = (x+gotoX)/2
y = (y+gotoY)/2
}
