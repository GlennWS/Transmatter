/// Transfer
with(obj_player)
{
if (room_exists(obj_two_to_hub.new_room)) {
	scr_upload(obj_player);
	room_goto(obj_two_to_hub.new_room);
	x = obj_two_to_hub.new_x;
	y = obj_two_to_hub.new_y;
	global.level_depth += 1;
	
}}