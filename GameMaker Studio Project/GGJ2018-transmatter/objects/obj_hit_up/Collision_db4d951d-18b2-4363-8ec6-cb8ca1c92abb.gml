/// @description Insert description here
// You can write your code in this editor
other.hp -= 1;
show_debug_message(other.hp);

if(other.hp <= 0)
{
	instance_destroy();
}

