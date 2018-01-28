/// @description Initialisation
enum states
{
	idle = 0, walking = 1, dodging = 2, attacking = 3
}

enum directions
{
	down = 0, left = 1, right = 2, up = 3
}
global.spr_array_dodging[directions.down] = spr_Sarah_dodge_roll_left;
global.spr_array_dodging[directions.left] = spr_Sarah_dodge_roll_left;
global.spr_array_dodging[directions.right] = spr_Sarah_dodge_roll_right;
global.spr_array_dodging[directions.up] = spr_Sarah_dodge_roll_right;

global.spr_array_walking[directions.down]	= spr_Sarah_walk_down;
global.spr_array_walking[directions.up]	= spr_Sarah_walk_up;
global.spr_array_walking[directions.left]	= spr_Sarah_walk_left;
global.spr_array_walking[directions.right] = spr_Sarah_walk_right;

global.spr_array_attacking[0]	= spr_swing_down;
global.spr_array_attacking[1]	= spr_swing_left;
global.spr_array_attacking[2]	= spr_swing_right;
global.spr_array_attacking[3]	= spr_swing_up;

global.states_array[states.idle]		= scr_player_idle;
global.states_array[states.walking]	= scr_player_walking;
global.states_array[states.dodging]	= scr_player_dodging;
global.states_array[states.attacking]	= scr_player_attacking;

global.obj_array_attacking[0]	= obj_hit_down;
global.obj_array_attacking[1]	= obj_hit_left;
global.obj_array_attacking[2]	= obj_hit_right;
global.obj_array_attacking[3]	= obj_hit_up;


#region RPGMechanics

global.level = 1;
global.experience = 0;
global.next_level = script_execute(scr_calculate_exp, global.level);
global.level_depth = 1;

global.strength = 1;
global.weapon = 0;
global.damage = global.strength + global.weapon;

global.constitution = 1;
global.armor = 0;
global.defense = global.constitution + global.armor;

maxstamina = 100;
stamina = maxstamina;

global.basehp = 7;
global.maxhp = global.basehp + ceil(global.constitution / 2);
global.hp = global.maxhp;

global.player_gold = 0;
global.player_luminite = 0;

#endregion