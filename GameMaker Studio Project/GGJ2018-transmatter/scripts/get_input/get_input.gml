dvc = argument0;
dzn = argument1;

// Returns 0 to variable if not pressed, 1 if being pressed
move_up =		keyboard_check(ord("W")); 
move_left =		keyboard_check(ord("A"));
move_down =		keyboard_check(ord("S"));
move_right =	keyboard_check(ord("D"));
act_attack =	keyboard_check_pressed(vk_space);

xx=(move_right-move_left);
yy=(move_down-move_up);

if(gamepad_is_connected(dvc))
{
	xx = gamepad_axis_value(dvc, gp_axislh);
	yy = gamepad_axis_value(dvc, gp_axislv);
	act_attack = gamepad_button_check_pressed(dvc, gp_face1);
}

if(keyboard_check(vk_escape))
{
	game_end();
}

hspd = xx * player_speed;
vspd = yy * player_speed;


// Movement input 

// Move up
if((keyboard_check(vk_up)) || (keyboard_check(ord("W"))))
{
	// Update the movement flag for this frame - remember to clear it after the movement script
	obj_player.moved_up = 1;
	obj_player.player_state = states.walking;
	
	// Update the player direction as the most recent, in executed order
	obj_player.player_direction = directions.up;
}

// Move left
if((keyboard_check(vk_left)) || (keyboard_check(ord("A"))))
{
	// Update the movement flag for this frame - remember to clear it after the movement script
	obj_player.moved_left = 1;
	obj_player.player_state = states.walking;
	
	// Update the player direction as the most recent, in executed order
	obj_player.player_direction = directions.left;
}

// Move down
if((keyboard_check(vk_down)) || (keyboard_check(ord("S"))))
{
	// Update the movement flag for this frame - remember to clear it after the movement script
	obj_player.moved_down = 1;
	obj_player.player_state = states.walking;
		
	// Update the player direction as the most recent, in executed order
	obj_player.player_direction = directions.down;
}

// Move right
if((keyboard_check(vk_right)) || (keyboard_check(ord("D"))))
{
	// Update the movement flag for this frame - remember to clear it after the movement script
	obj_player.moved_right = 1;
	obj_player.player_state = states.walking;
	
	// Update the player direction as the most recent, in executed order
	obj_player.player_direction = directions.right;
}