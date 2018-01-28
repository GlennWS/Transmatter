/// @description Insert description here
// You can write your code in this editor
with(obj_player)
{
	player_gold += gold_value;
	show_debug_message(player_gold);
}
	instance_destroy();
	audio_play_sound(snd_pickup_gold, 10, false);
