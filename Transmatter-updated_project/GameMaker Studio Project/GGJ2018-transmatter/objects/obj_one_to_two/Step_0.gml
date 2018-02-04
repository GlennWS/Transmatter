/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_enemy_slime))
{
	if(!self.exit_opened)
	{
		obj_one_to_two.active_exit = true;
		obj_one_to_two.image_speed = 1;
		audio_play_sound(snd_tele_open, 15, false);
		self.exit_opened = true;
		alarm[0] = 15;
	}
}
