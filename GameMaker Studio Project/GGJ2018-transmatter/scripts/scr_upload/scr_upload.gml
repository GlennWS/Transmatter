player = argument0

with(player)
{
global.level = player.level;
global.experience = player.experience;
global.next_level = script_execute(scr_calculate_exp, global.level);

global.strength = player.strength;
global.weapon = player.weapon;
global.damage = global.strength + global.weapon;

global.constitution = player.constitution;
global.armor = player.armor;
global.defense = global.constitution + global.armor;

maxstamina = 100;
stamina = maxstamina;

global.basehp = player.basehp;
global.maxhp = global.basehp + ceil(global.constitution / 2);
global.hp = global.maxhp;

global.player_gold = player.player_gold;
//global.player_luminite = player.player_luminite;
	
}
