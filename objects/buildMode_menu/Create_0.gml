buildmode = false

image_xscale = 0.5
image_yscale = 0.5

building = -1
building_price = 0
building_able = false

posX = camera_get_view_x(view_get_camera(view_current))+camera_get_view_width(view_get_camera(view_current))
posY = camera_get_view_y(view_get_camera(view_current))

posX_off_offset = 0

posX_on_offset = sprite_width+(32/4)

buildGrid = ds_grid_create(512, 5)
buildOptions = 4 //number of build options

//wall
ds_grid_add(buildGrid,1,1,Structure_Wall)//object
ds_grid_add(buildGrid,1,2,"Wall")//name
ds_grid_add(buildGrid,1,3,s_icon_str_wall)//icon
ds_grid_add(buildGrid,1,4,50)//price

//Drill
ds_grid_add(buildGrid,2,1,Structure_Drill)//object
ds_grid_add(buildGrid,2,2,"Drill")//name
ds_grid_add(buildGrid,2,3,s_icon_str_drill)//icon
ds_grid_add(buildGrid,2,4,250)//price

//turret (machine gun)
ds_grid_add(buildGrid,3,1,Structure_Turret_mg)//object
ds_grid_add(buildGrid,3,2,"Turret (MG)")//name
ds_grid_add(buildGrid,3,3,s_icon_str_turret_mg)//icon
ds_grid_add(buildGrid,3,4,400)//price

//turret (rocket launcher)
ds_grid_add(buildGrid,4,1,Structure_Turret_rl)//object
ds_grid_add(buildGrid,4,2,"Turret (RL)")//name
ds_grid_add(buildGrid,4,3,s_icon_str_turret_rl)//icon
ds_grid_add(buildGrid,4,4,1000)//price

//create buildmode options
xx = 0
yy = 0
for (var i=1; i<=buildOptions; i++)
	{
	if (xx>5){xx=0;yy++}
	opt = instance_create_layer(x,y,"UI",buildMode_option)
	opt.xx = xx*32+(xx*4)+4
	opt.yy = yy*32+(yy*4)+48
	opt.object = ds_grid_get(buildGrid, i,1)
	opt.name = ds_grid_get(buildGrid, i,2)
	opt.sprite_index = ds_grid_get(buildGrid, i,3)
	opt.price = ds_grid_get(buildGrid, i,4)
	xx++
	}