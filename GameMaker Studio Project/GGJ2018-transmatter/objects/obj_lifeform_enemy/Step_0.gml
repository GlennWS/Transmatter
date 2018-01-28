/// @description Insert description here
// You can write your code in this editor

if(hp <= 0)
{
	instance_destroy();
	var loot_drop = random(100);
	if(loot_drop >= 25)
	{
		//instance_create_layer(x,y,"Instances", obj_item);
	}
	obj_player.experience += self.experience_worth;
}