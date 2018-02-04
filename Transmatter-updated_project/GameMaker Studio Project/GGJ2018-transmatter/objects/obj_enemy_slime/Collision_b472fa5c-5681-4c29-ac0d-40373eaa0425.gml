/// @description Damage Player!
event_inherited();

if (state != scr_enemy_stall_state) 
{
	var dir = point_direction(other.x, other.y, x, y);
	var xdir = lengthdir_x(1, dir);
	var ydir = lengthdir_y(1, dir);
}
