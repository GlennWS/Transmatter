/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_enemy_slime))
{
	if(!exit_opened)
	{
		obj_two_to_hub.active_exit = true;
		obj_two_to_hub.image_speed = 1;
		audio_play_sound(snd_tele_open, 15, false);
		exit_opened = true;
		alarm[0] = 15;
	}
}
