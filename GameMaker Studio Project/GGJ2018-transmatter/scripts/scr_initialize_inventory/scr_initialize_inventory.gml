var v_cells = argument0;
var h_cells = argument1;
var xx = argument2;
var yy = argument3;
var SlotSize = sprite_get_width(spr_item_block);

global.inventory = ds_list_create();

for(var i = 0; i < v_cells; i++)
{

	for(var j = 0; j < h_cells; j++)
	{
		var CellMap = ds_map_create();
		var xxx = xx + (j * SlotSize);
		var yyy = yy + (i * SlotSize);
		ds_map_add(CellMap, "x", xxx);
		ds_map_add(CellMap, "y", yyy);
		ds_map_add(CellMap, "id", ds_list_size(global.inventory));
		
		ds_map_add(CellMap, "item_id", -1);
		ds_list_add(global.inventory, CellMap);
	}
	
}