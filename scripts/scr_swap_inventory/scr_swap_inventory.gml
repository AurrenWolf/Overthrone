holding = inventory[holding_invSlot]
holding_range = ds_grid_get(System.weapon_stats_grid,holding,2)
holding_accuracy = ds_grid_get(System.weapon_stats_grid,holding,3)
holding_tickTime = ds_grid_get(System.weapon_stats_grid,holding,4)
holding_tick = holding_tickTime
holding_damage = ds_grid_get(System.weapon_stats_grid,holding,5)