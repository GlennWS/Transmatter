with(obj_player)
{	
	audio_play_sound(snd_levelup, 10, false);
	level += 1;
	experience = 0;

	var additional_hp = 1 + random_range(1, 4);
	var additional_strength = 1 + random_range(1, 2)
	var additional_constitution = 1 + random_range(1, 2);
	
	show_debug_message("LEVEL UP!");
	show_debug_message("HP Refreshed!");
	show_debug_message(string(additional_hp) + string(" MaxHP gained!"));
	show_debug_message(string(additional_strength) + string(" Strength gained!"));
	show_debug_message(string(additional_constitution) + string(" Constitution gained!"));
	
	// Increase Constitution Value
	obj_player.constitution += additional_constitution;
	obj_player.defense = constitution + armor;
	
	// Increase MaxHP value
	var newhp = obj_player.maxhp + additional_hp + (additional_constitution / 2)
	obj_player.maxhp = ceil(newhp);
	obj_player.hp = maxhp;
	
	// Increase Strength
	obj_player.strength += additional_strength;
	obj_player.damage = strength + weapon;

}