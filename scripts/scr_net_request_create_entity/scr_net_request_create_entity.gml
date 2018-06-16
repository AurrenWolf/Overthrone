//for clients to request an entity be made.
var xx = argument0
var yy = argument1
var obj = argument2
var arg1 = argument3
var arg2 = argument4
var arg3 = argument5
var arg4 = argument6

var buffer = buffer_create(128, buffer_grow, 1)
buffer_write(buffer, buffer_u8, 11)
buffer_write(buffer, buffer_u16, xx)
buffer_write(buffer, buffer_u16, yy)
buffer_write(buffer, buffer_u16, obj)
buffer_write(buffer, buffer_u16, arg1)
buffer_write(buffer, buffer_u16, arg2)
buffer_write(buffer, buffer_u16, arg3)
buffer_write(buffer, buffer_u16, arg4)

network_send_packet(System.mp_socket, buffer, buffer_tell(buffer))

buffer_delete(buffer)