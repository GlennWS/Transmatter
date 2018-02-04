/// @description Insert description here
// You can write your code in this editor
if(self.exit_opened)
{
	show_debug_message("exit check success");
	audio_stop_sound(snd_tele_loop);
	audio_play_sound(snd_tele_end, 15, false);
	image_speed = 0;
	image_index = 0;
}

// exit level