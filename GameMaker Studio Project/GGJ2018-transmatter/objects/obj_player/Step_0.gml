/// Basic Player Movement

event_inherited();

image_alpha = 1.0;

// Obtain gamepad counter
var moved = false;
var padcount;
with(obj_player)
{
	padcount = maxpads;
}

// Temp container for x/y axis movement
var temp_pos_y = phy_position_y;
var temp_pos_x = phy_position_x;

// If escape is pressed, exit the game
if (keyboard_check(vk_escape)) 
{
	game_end();
}

// Movement input 

// Move up
if((keyboard_check(vk_up)) || (keyboard_check(ord("W"))))
{
	temp_pos_y -= player_speed;
	sprite_index = spr_Sarah_walk_up;
	image_speed = player_speed / 3;
	
	with(obj_player)
	{
		face_index = 0;
	}
	moved = true;
}

// Move left
if((keyboard_check(vk_left)) || (keyboard_check(ord("A"))))
{
	temp_pos_x -= player_speed;
	sprite_index = spr_Sarah_walk_left;
	image_speed = player_speed / 3;
	
	with(obj_player)
	{
		face_index = 1;
	}
	moved = true;
}

// Move down
if((keyboard_check(vk_down)) || (keyboard_check(ord("S"))))
{
	temp_pos_y += player_speed;
	sprite_index = spr_Sarah_walk_down;
	image_speed = player_speed / 3;
	
	with(obj_player)
	{
		face_index = 2;
	}
	moved = true;
}

// Move right
if((keyboard_check(vk_right)) || (keyboard_check(ord("D"))))
{
	temp_pos_x += player_speed;
	sprite_index = spr_Sarah_walk_right;
	image_speed = player_speed / 3;
	
	with(obj_player)
	{
		face_index = 3;
	}
	moved = true;
}

// Dodge Rolling
/*if (keyboard_check_pressed(vk_control)) {
	player_speed = 7;
	sprite_index = spr_Sarah_dodge_roll;
	image_speed = player_speed / 3;
	
	with(obj_player)
	{
		face_index = 3;
	}
	moved = true;
}*/

// If no movement is pressed, do not cycle animations
// Set index to the first keyframe and reset walk speed
if(keyboard_check(vk_nokey))
{
	image_speed = 0;
	image_index = 0;
	player_speed = 3.5;
}

if(keyboard_check(vk_space))
{
	with(obj_player)
	{
		// 0 -> up 
		// 1 -> left
		// 2 -> down
		// 3 -> right
		if(face_index == 0)
		{
			// instantiate instance of the proper hitbox for each of these cases
			
			// then run the collision test on the enemy there
			
			// https://www.youtube.com/watch?v=vJ6ksNLLFiQ // 9:47
		}
		else if(face_index == 1)
		{
			
		}
		else if(face_index == 2)
		{
			
		}
		else if(face_index == 3)
		{
			
		}
	}
}

// If Shift is being pressed this frame, run
if(keyboard_check(vk_shift))
{
	player_speed = 7;
	var dash = instance_create_depth(x, y, -1, obj_dash_effect);
	dash.sprite_index = sprite_index;
	dash.image_index = image_index;
}

if(!keyboard_check(vk_shift))
{
	player_speed = 3.5;
}

if ((gamepad_is_connected(0)) && (!moved))
{
    // do stuff with pad at index 0
	if(gamepad_button_check(0, gp_face1))
	{
		show_debug_message("A button pressed. Confirm/Attack");
	}
	
	if(gamepad_button_check(0, gp_face4))
	{
		show_debug_message("Y button pressed. Open Menu");
	}
	
	if(gamepad_button_check(0, gp_face3))
	{
		show_debug_message("X button pressed. Dodge Roll");
	}
	
	if(gamepad_axis_value(0, gp_axislh) >= 0.3)
	{
		temp_pos_x += player_speed;
		sprite_index = spr_right;
	}
	
	if(gamepad_axis_value(0, gp_axislh) <= -0.3)
	{
		temp_pos_x -= player_speed;
		sprite_index = spr_left;
	}
	
	if(gamepad_axis_value(0, gp_axislv) >= 0.3)
	{
		temp_pos_y += player_speed;
		sprite_index = spr_front;
	}
	
	if(gamepad_axis_value(0, gp_axislv) <= -0.3)
	{
		temp_pos_y -= player_speed;
		sprite_index = spr_back;
	}
	
	//if(gamepad_button_check(0, gp_padu))
	//{
	//	//show_debug_message("D-Pad UP. Move Character/Menu");
	//	temp_pos_y -= player_speed;
	//}
	//
	//if(gamepad_button_check(0, gp_padd))
	//{
	//	//show_debug_message("D-Pad DOWN. Move Character/Menu");
	//	temp_pos_y += player_speed;
	//}
	//
	//if(gamepad_button_check(0, gp_padl))
	//{
	//	//show_debug_message("D-Pad LEFT. Move Character/Menu");
	//	temp_pos_x -= player_speed;
	//}
	//
	//if(gamepad_button_check(0, gp_padr))
	//{
	//	//show_debug_message("D-Pad RIGHT. Move Character/Menu");
	//	temp_pos_x += player_speed;
	//}
}	

phy_position_x = temp_pos_x;
phy_position_y = temp_pos_y;

//move_up = keyboard_check(vk_up);
//move_down = keyboard_check(vk_down);
//move_left = keyboard_check(vk_left);
//move_right = keyboard_check(vk_right);
//
//xx = move_right - move_left;
//yy = move_down - move_up;
//
//hspd = xx * spd;
//vspd = yy * spd;
//
//if(place_meeting(x+hspd, y, obj_impassable))
//{
//	while(!place_meeting(x+sign(hspd),y,obj_impassable))
//	{
//		x+=sign(hspd);
//	}
//	
//	hspd = 0;
//}
//
//x += hspd;
//
//if(place_meeting(x, y+vspd, obj_impassable))
//{
//	while(!place_meeting(x,y + sign(vspd),obj_impassable))
//	{
//		y+=sign(vspd);
//	}
//	
//	vspd = 0;
//}
//
//y += vspd;