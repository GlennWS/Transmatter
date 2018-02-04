/*
	item_id = argument0
*/

var _item_id = argument0;

for ( var i =0; i<ds_list_size(global.inventory); i++)
{
	var map = ds_list_find_value(global.inventory, i);
	var slot_free = ds_map_find_value(map, "item_id");
	
	if(slot_free == -1)
	{
		ds_map_replace(map, "item_id", _item_id);
		exit;
	}
}