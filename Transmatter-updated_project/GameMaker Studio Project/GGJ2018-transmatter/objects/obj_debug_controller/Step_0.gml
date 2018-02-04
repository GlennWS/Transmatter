/// @description Insert description here
// You can write your code in this editor


if(keyboard_check_pressed(ord("L")))
{
	// levelup
	instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_levelup_back);
	instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_levelup_front);
}