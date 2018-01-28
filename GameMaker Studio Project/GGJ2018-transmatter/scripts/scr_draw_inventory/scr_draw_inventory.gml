for(var i = 0; i < ds_list_size(global.inventory); i++)
{
	var map = ds_list_find_value((global.inventory), i);
	
	var xx = ds_map_find_value(map, "x");
	var yy = ds_map_find_value(map, "y");
	
	draw_sprite(spr_item_block, 0, xx, yy);
	
	var item_id = ds_map_find_value(map, "item_id");
	
	if(item_id > -1)
	{
		draw_sprite(spr_swords, item_id, xx, yy);
	}
}