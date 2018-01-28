/// Transfer
with(obj_player)
{
if (room_exists(obj_hub_to_one.new_room)) 
{
	scr_upload(obj_player);
	room_goto(obj_hub_to_one.new_room);
	x = obj_hub_to_one.new_x;
	y = obj_hub_to_one.new_y;
		global.level_depth += 1;
		
}}