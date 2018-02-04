player = argument0

with(player)
{
global.level = level;
global.experience = experience;
global.next_level = script_execute(scr_calculate_exp, global.level);

global.strength = strength;
global.weapon = weapon;
global.damage = global.strength + global.weapon;

global.constitution = constitution;
global.armor = armor;
global.defense = global.constitution + global.armor;

maxstamina = 100;
stamina = maxstamina;

global.basehp = basehp;
global.maxhp = global.basehp + ceil(global.constitution / 2);
global.hp = global.maxhp;

global.player_gold = player_gold;
global.player_luminite = player_luminite;
	
}
