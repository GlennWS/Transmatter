/// @description Room Transition

if (room_exists(myroom))
{
	scr_upload(obj_player);
	room_goto(myroom);
	x = 25;
	y = 25;
	global.level_depth += 1;
}