/// @description Insert description here
// You can write your code in this editor


//create inventory slots
for (i = 1; i<=10; i++)
	{
	slot = instance_create_layer(x+((i-1)*36),y,"UI",Inventory_slot)
	slot.slot = i
	slot.xx = ((i-1)*36)+4
	}