/// @description Damage Player!
// You can write your code in this editor
if(player_dodging == 1) return;

if(!obj_player.iframed)
{
	obj_player.hp -= obj_enemy_slime.slime_damage;
	obj_player.iframed = true;
	obj_player.alarm[1] = 60;
	show_debug_message("player hp is----");
	show_debug_message(obj_player.hp);
}

