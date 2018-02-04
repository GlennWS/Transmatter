/// Transfer
with(obj_player)
{
if (room_exists(obj_one_to_two.new_room)) {
	scr_upload(obj_player);
	room_goto(obj_one_to_two.new_room);
	x = obj_one_to_two.new_x;
	y = obj_one_to_two.new_y;
	global.level_depth += 1;
	
}}