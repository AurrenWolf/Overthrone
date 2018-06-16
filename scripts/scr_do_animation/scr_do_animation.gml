/// @function scr_do_animation(originX, originY, weaponX, weaponY, hitX, hitY, anim_index, sendAnim)
var originX = argument0
var originY = argument1
var weaponX = argument2
var weaponY = argument3
var hitX = argument4
var hitY = argument5
var anim_index = argument6
var sendAnim = argument7 //whether or not the animation should be sent to others to be played too.
var wep_dir = argument8

if (sendAnim)
	{
	var buffer = buffer_create(32, buffer_grow, 1)
	buffer_write(buffer, buffer_u8, 8) //index
	buffer_write(buffer, buffer_u16, originX)
	buffer_write(buffer, buffer_u16, originY)
	buffer_write(buffer, buffer_u16, weaponX)
	buffer_write(buffer, buffer_u16, weaponY)
	buffer_write(buffer, buffer_u16, hitX)
	buffer_write(buffer, buffer_u16, hitY)
	buffer_write(buffer, buffer_u16, anim_index)
	buffer_write(buffer, buffer_u16, wep_dir)
	if (System.mp_type = "client")
		{
		network_send_packet(System.mp_socket, buffer, buffer_tell(buffer))
		}
	if (System.mp_type =  "server")
		{
		for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
			{
			network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_tell(buffer))
			}
		}
	}

switch(anim_index)
	{
	case 1: //handgun animation
		{
		anim = instance_create_layer(weaponX, weaponY-4,"Particles",part_gun_shoot)
		anim.dir = wep_dir
		instance_create_layer(hitX, hitY, "Particles",anim_handgunImpact)
		break
		}
	case 2: //explosion animation
		{
		instance_create_layer(originX+random_range(-16,16),originY+random_range(-16,16),"Particles",part_explosion_small)
		instance_create_layer(originX+random_range(-16,16),originY+random_range(-16,16),"Particles",part_explosion_small)
		instance_create_layer(originX+random_range(-16,16),originY+random_range(-16,16),"Particles",part_explosion_small)

		repeat(32)
			{
			instance_create_layer(originX+random_range(-64,64),originY+random_range(-64,64),"Particles",part_smoke_small)
			}

		break
		}
	}