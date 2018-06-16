//only servers are allowed to create entities. A client must request one be made (scr_net_request_create_entity)
var xx = argument0
var yy = argument1
var obj = argument2
var arg1 = argument3
var arg2 = argument4
var arg3 = argument5
var arg4 = argument6

for (var i = 1; i<ds_grid_width(Game.entity_grid); i++)
	{
	if (ds_grid_get(Game.entity_grid, i, 1)=noone)
		{
		Game.entity_grid_cursor = i
		i = ds_grid_width(Game.entity_grid)
		}
	}

var ent_num = Game.entity_grid_cursor


var buffer = buffer_create(128, buffer_grow, 1)
buffer_write(buffer, buffer_u8, 10)
buffer_write(buffer, buffer_u16, xx)
buffer_write(buffer, buffer_u16, yy)
buffer_write(buffer, buffer_u16, obj)
buffer_write(buffer, buffer_u16, arg1)
buffer_write(buffer, buffer_u16, arg2)
buffer_write(buffer, buffer_u16, arg3)
buffer_write(buffer, buffer_u16, arg4)
buffer_write(buffer, buffer_u16, ent_num)

if (System.mp_type = "server")
	{
	scr_create_entity(xx, yy, obj, arg1, arg2, arg3, arg4, ent_num)
	for (var i = 0; i<ds_list_size(System.mp_socket_list); i++)
		{
		network_send_packet(ds_list_find_value(System.mp_socket_list,i),buffer,buffer_tell(buffer))
		}
	}
	
	
buffer_delete(buffer)