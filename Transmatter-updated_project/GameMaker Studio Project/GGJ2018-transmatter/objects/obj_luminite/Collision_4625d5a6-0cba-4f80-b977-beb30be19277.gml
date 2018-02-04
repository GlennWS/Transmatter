/// @description Insert description here
// You can write your code in this editor
with(obj_player)
{
	obj_player.player_luminite += 1;
	show_debug_message(obj_player.player_luminite);
}
	instance_destroy();
	audio_play_sound(snd_pickup_luminite, 10, false);
