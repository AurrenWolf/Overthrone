event_inherited()

scr_check_for_hits("net_player")

phy_rotation = 0
switch(face)
	{
	case "up":
		{
		spr_base_torso = spr_base_torso_up
		spr_base_head = spr_base_head_up
		spr_base_legs = spr_base_legs_up
		break
		}
	case "down":
		{
		spr_base_torso = spr_base_torso_down
		spr_base_head = spr_base_head_down
		spr_base_legs = spr_base_legs_down
		break
		}
	case "left":
		{
		spr_base_torso = spr_base_torso_left
		spr_base_head = spr_base_head_left
		spr_base_legs = spr_base_legs_left
		break
		}
	case "right":
		{
		spr_base_torso = spr_base_torso_right
		spr_base_head = spr_base_head_right
		spr_base_legs = spr_base_legs_right
		break
		}
	}