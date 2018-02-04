/// @description Damage Enemy
// You can write your code in this editor
other.hp -= obj_player.damage;

if(other.hp <= 0)
{
	instance_destroy();
}

