/// @description Insert description here
// You can write your code in this editor
with(other)
{
	other.hp -= obj_player.damage;
	show_debug_message(other.hp);

	if(other.hp <= 0)
	{
		instance_destroy();
	}
}

instance_destroy(self);