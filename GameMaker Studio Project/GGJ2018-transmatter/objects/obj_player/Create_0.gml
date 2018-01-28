/// Initialisation
enum states
{
	idle = 0, walking = 1, dodging = 2, attacking = 3
}

enum directions
{
	down = 0, left = 1, right = 2, up = 3
}

spr_array_walking[directions.down]	= spr_Sarah_walk_down;
spr_array_walking[directions.up]	= spr_Sarah_walk_up;
spr_array_walking[directions.left]	= spr_Sarah_walk_left;
spr_array_walking[directions.right] = spr_Sarah_walk_right;

spr_array_attacking[0]	= spr_swing_down;
spr_array_attacking[1]	= spr_swing_left;
spr_array_attacking[2]	= spr_swing_right;
spr_array_attacking[3]	= spr_swing_up;

states_array[states.idle]		= scr_player_idle;
states_array[states.walking]	= scr_player_walking;
states_array[states.dodging]	= scr_player_dodging;
states_array[states.attacking]	= scr_player_attacking;

obj_array_attacking[0]	= obj_hit_down;
obj_array_attacking[1]	= obj_hit_left;
obj_array_attacking[2]	= obj_hit_right;
obj_array_attacking[3]	= obj_hit_up;

event_inherited();
image_speed = 0;
depth = -1;

// Face index for attack
var face_index = 2; // DOWN
// 0 -> up 
// 1 -> left
// 2 -> down
// 3 -> right



player_state = states.walking;
player_direction = directions.down;
player_speed = 3.5;

temp_pos_x = phy_position_x;
temp_pos_y = phy_position_y;

player_attacking = false;
attack_active = false;
moveable = true;
iframed = false;

horiz_speed = 0;
vert_speed = 0;
xaxis = 0;
yaxis = 0;
len = 0;
dir = 0;

// Flags for the frame's movement
moved_up = 0;
moved_down = 0;
moved_left = 0;
moved_right = 0;

maxpads = gamepad_get_device_count();


#region RPGMechanics

level = 1;
experience = 0;
next_level = script_execute(scr_calculate_exp, level);

strength = 1;
weapon = 0;
damage = strength + weapon;

constitution = 1;
armor = 0;
defense = constitution + armor;

maxstamina = 100;
stamina = maxstamina;

basehp = 7;
maxhp = basehp + ceil(constitution / 2);
hp = maxhp;

#endregion