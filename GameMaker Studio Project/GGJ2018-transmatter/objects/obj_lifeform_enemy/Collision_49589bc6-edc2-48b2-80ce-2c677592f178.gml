/// @description Damage Player!
// You can write your code in this editor
with(obj_player)
{
	if(!obj_player.iframed)
	{
		obj_player.hp -= 1;
		obj_player.iframed = true;
		obj_player.alarm[1] = 60;
		show_debug_message("player hp is----");
		show_debug_message(obj_player.hp);
	}
}
