/// Basic Player Movement

var moved = false;

//alarm -= 1;

//show_debug_message(alarm[1]);

if(hp <= 0) game_restart();

event_inherited();

#region

//if(gamepad_button_check(0, gp_face1))
//{
//	show_debug_message("A button pressed. Confirm/Attack");
//}
//
//if(gamepad_button_check(0, gp_face4))
//{
//	show_debug_message("Y button pressed. Open Menu");
//}
//
//if(gamepad_button_check(0, gp_face3))
//{
//	show_debug_message("X button pressed. Dodge Roll");
//}
//
//if(gamepad_axis_value(0, gp_axislh) >= 0.3)
//{
//	temp_pos_x += player_speed;
//	sprite_index = spr_right;
//}
//
//if(gamepad_axis_value(0, gp_axislh) <= -0.3)
//{
//	temp_pos_x -= player_speed;
//	sprite_index = spr_left;
//}
//
//if(gamepad_axis_value(0, gp_axislv) >= 0.3)
//{
//	temp_pos_y += player_speed;
//	sprite_index = spr_front;
//}
//
//if(gamepad_axis_value(0, gp_axislv) <= -0.3)
//{
//	temp_pos_y -= player_speed;
//	sprite_index = spr_back;
//}

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



if(keyboard_check_pressed(vk_escape))
{
	//if(!obj_player.paused)
	//{
	//	obj_player.paused = true;
	//	instance_deactivate_all(true);
	//}
	//else
	//{
	//	obj_player.paused = false;
	//	instance_activate_all();
	//}
	game_end();
}

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

if(keyboard_check_pressed(vk_space))
{
	//show_debug_message("Should switch to attack.");
	player_state = states.attacking;
	obj_player.sprite_index = spr_array_attacking[player_direction];
	if(!aud_lim_sword)
	{
		audio_play_sound(snd_sword, 10, false);
		aud_lim_sword = true;
		alarm[4] = 34;
	}
	obj_player.image_speed = 1;
	obj_player.alarm[3] = 15;
}

//if (keyboard_check(vk_control)) 
//{
//	player_state = states.dodging;
//	obj_player.sprite_index = spr_array_dodging[player_direction];
//	player_dodging = true;
//	if(!aud_lim_dodge)
//	{
//		audio_play_sound(snd_dodge, 10, false);
//		aud_lim_dodge = true;
//		alarm[5] = 60;
//	}
//	obj_player.image_speed = 1;
//	obj_player.alarm[6] = 60;
//	moved = true;
//}

#endregion

//hspd = xx * player_speed;
//vspd = yy * player_speed;

if(player_state = states.walking)
{
	if(moved_up == 1)
	{
		temp_pos_y -= player_speed;
		sprite_index = spr_array_walking[directions.up];
		player_direction = directions.up;
		image_speed = player_speed / 3;
		
		moved = true;
	}
	
	if(moved_left == 1)
	{
		temp_pos_x -= player_speed;
		sprite_index = spr_array_walking[directions.left];
		player_direction = directions.left;
		image_speed = player_speed / 3;
	
		moved = true;
	}
	
	if(moved_down == 1)
	{
		temp_pos_y += player_speed;
		sprite_index = spr_array_walking[directions.down];
		player_direction = directions.down;
		image_speed = player_speed / 3;
	
		moved = true;
	}
	
	if(moved_right == 1)
	{
		temp_pos_x += player_speed;
		sprite_index = spr_array_walking[directions.right];
		player_direction = directions.right;
		image_speed = player_speed / 3;
		
		moved = true;
	}
	
	if(!moved)
	{
		// switch to idle state
		script_execute(states_array[states.idle]);
	}
	
	// If Shift is being pressed this frame, run
	if(keyboard_check(vk_shift))
	{
		player_speed = 4.5;
		var dash = instance_create_depth(x, y, -1, obj_dash_effect);
		dash.sprite_index = sprite_index;
		dash.image_index = image_index;
	}
	else
	{
		player_speed = 3.5;
	}
	
	if(keyboard_check_pressed(ord("F")))
	{
		// chug potion
		if(obj_player.heal_cooldown >= 500)
		{
			script_execute(scr_health_potion());
			audio_play_sound(snd_potion, 10, false);
		}
		else
		{
			audio_play_sound(snd_nope, 10, false);
		}
	}
	
	
	
	
	if(keyboard_check(vk_nokey))
	{
		image_index = 0;
		image_speed = 0;
	}
	
	
	moved_up = 0;
	moved_down = 0;
	moved_left = 0;
	moved_right = 0;
	
	phy_position_x = temp_pos_x;
	phy_position_y = temp_pos_y;
}
else if(player_state = states.attacking)
{	
	if(image_index >= 5 && image_index < 9)
	{
		if(!attack_active)
		{
			attack_active = true;
			
			var xplace = 0;
			var yplace = 0;
			//show_debug_message("fire, fire fire");
			//show_debug_message("fire, fire fire");
			switch(player_direction)
			{
				case directions.up:
					xplace = x;
					yplace = y - 18;
					break;
				
				case directions.down:
					xplace = x;
					yplace = y + 18;
					break;
				
				case directions.right:
					xplace = x + 18;
					yplace = y;
					break;
				
				case directions.left:
					xplace = x - 18;
					yplace = y;
					break;
			}
			
			with(instance_create_layer(xplace,yplace,"Hitbox",obj_array_attacking[player_direction]))
			{
				with(instance_place(xplace,yplace,obj_lifeform_enemy))
				{
					show_debug_message("Enemy hit");
					with (other) 
					{
						other.hp -= floor(obj_player.damage);
						
						if (other.hp <= 0) 
						{
							instance_destroy();
						}
					}
				}
			}
		}
		else
		{
			show_debug_message("attack is already active");
		}
	}
	//show_debug_message(image_index);
	if(image_index >= 8)
	{
		image_speed = 0.0;
		obj_player.player_state = states.walking;
		obj_player.sprite_index = spr_array_walking[player_direction];
		image_index = 0;
		player_attacking = false;
	}
}
//else if (player_state = states.dodging)
//{
//show_debug_message(string(player_dodging));
//	if(image_index < 13)
//	{
//		switch(player_direction)
//		{
//			case directions.up:
//				temp_pos_x = x;
//				temp_pos_y -= player_speed;
//				break;
//			case directions.down:
//				temp_pos_x = x;
//				temp_pos_y += player_speed;
//				break;
//			case directions.right:
//				temp_pos_x += player_speed;
//				temp_pos_y = y;
//				break;
//			case directions.left:
//				temp_pos_x -= player_speed;
//				temp_pos_y = y;
//				break;
//		}
//		phy_position_x = temp_pos_x;
//		phy_position_y = temp_pos_y;
//		// Immovable - auto move
//		// find the direction looking at, and set the temp_pos_x/y to represent the player
//		// moving at an increased speed in that direction for the duration of the animation
//	}
//	else
//	{
//		// at the end of the animation, set the state back to walking
//		player_state = states.walking;
//		//player_dodging = false;
//	}
//}

if(obj_player.experience >= obj_player.next_level)
{
	script_execute(scr_levelup());
	//instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_levelup);
	obj_player.next_level = script_execute(scr_calculate_exp, obj_player.level);
}

if(obj_player.heal_cooldown < 500)
{
	obj_player.heal_cooldown += 1;
}
else
{
	obj_player.heal_cooldown = 500;
}

//show_debug_message(heal_cooldown);
	//image_alpha = 1.0;

//// Obtain gamepad counter
//var moved = false;
//var padcount;
//with(obj_player)
//{
//	padcount = maxpads;
//}
//
//// Temp container for x/y axis movement
//var temp_pos_y = phy_position_y;
//var temp_pos_x = phy_position_x;
//
//// If escape is pressed, exit the game
//
//
//// Movement input 
//
//// Move up
//if((keyboard_check(vk_up)) || (keyboard_check(ord("W"))))
//{
//	temp_pos_y -= player_speed;
//	sprite_index = spr_Sarah_walk_up;
//	image_speed = player_speed / 3;
//	
//	with(obj_player)
//	{
//		face_index = 0;
//	}
//	moved = true;
//}
//
//// Move left
//if((keyboard_check(vk_left)) || (keyboard_check(ord("A"))))
//{
//	temp_pos_x -= player_speed;
//	sprite_index = spr_Sarah_walk_left;
//	image_speed = player_speed / 3;
//	
//	with(obj_player)
//	{
//		face_index = 1;
//	}
//	moved = true;
//}
//
//// Move down
//if((keyboard_check(vk_down)) || (keyboard_check(ord("S"))))
//{
//	temp_pos_y += player_speed;
//	sprite_index = spr_Sarah_walk_down;
//	image_speed = player_speed / 3;
//	
//	with(obj_player)
//	{
//		face_index = 2;
//	}
//	moved = true;
//}
//
//// Move right
//if((keyboard_check(vk_right)) || (keyboard_check(ord("D"))))
//{
//	temp_pos_x += player_speed;
//	sprite_index = spr_Sarah_walk_right;
//	image_speed = player_speed / 3;
//	
//	with(obj_player)
//	{
//		face_index = 3;
//	}
//	moved = true;
//}
//
//// Dodge Rolling
//// Needs to be keyboard_check_pressed instead of keyboard_check
//// Must do a full animation cycle + movement before executing any other movement
//// Has to account for the axis in which the player is facing.
//if (keyboard_check(vk_control)) {
//	player_speed = 7;
//	sprite_index = spr_Sarah_dodge_roll;
//	image_speed = player_speed / 3;
//	moved = true;
//}
//
//// If no movement is pressed, do not cycle animations
//// Set index to the first keyframe and reset walk speed
//
//if(keyboard_check(vk_space))
//{
//	with(obj_player)
//	{
//		// 0 -> up 
//		// 1 -> left
//		// 2 -> down
//		// 3 -> right
//		/*if(face_index == 0)
//		{
//			sprite_index = spr_swing_up;
//			// instantiate instance of the proper hitbox for each of these cases
//			
//			// then run the collision test on the enemy there
//			
//			// https://www.youtube.com/watch?v=vJ6ksNLLFiQ // 9:47
//		}
//		else if(face_index == 1)
//		{
//			sprite_index = spr_swing_left;
//		}
//		else if(face_index == 2)
//		{
//			sprite_index = spr_swing_down;
//		}
//		else if(face_index == 3)
//		{
//			sprite_index = spr_swing_right;
//		}*/
//		switch (face_index) {
//			case 0:
//				sprite_index = spr_swing_up;
//				break;
//			case 1:
//				sprite_index = spr_swing_left;
//				break;
//			case 2:
//				sprite_index = spr_swing_down;
//				break;
//			case 3:
//				sprite_index = spr_swing_right;
//				break;
//		}
//	}
//}
//

//
//if(!keyboard_check(vk_shift))
//{
//	player_speed = 3.5;
//}
//
//if ((gamepad_is_connected(0)) && (!moved))
//{
//    // do stuff with pad at index 0
//	if(gamepad_button_check(0, gp_face1))
//	{
//		show_debug_message("A button pressed. Confirm/Attack");
//	}
//	
//	if(gamepad_button_check(0, gp_face4))
//	{
//		show_debug_message("Y button pressed. Open Menu");
//	}
//	
//	if(gamepad_button_check(0, gp_face3))
//	{
//		show_debug_message("X button pressed. Dodge Roll");
//	}
//	
//	if(gamepad_axis_value(0, gp_axislh) >= 0.3)
//	{
//		temp_pos_x += player_speed;
//		sprite_index = spr_right;
//	}
//	
//	if(gamepad_axis_value(0, gp_axislh) <= -0.3)
//	{
//		temp_pos_x -= player_speed;
//		sprite_index = spr_left;
//	}
//	
//	if(gamepad_axis_value(0, gp_axislv) >= 0.3)
//	{
//		temp_pos_y += player_speed;
//		sprite_index = spr_front;
//	}
//	
//	if(gamepad_axis_value(0, gp_axislv) <= -0.3)
//	{
//		temp_pos_y -= player_speed;
//		sprite_index = spr_back;
//	}
//	
//	//if(gamepad_button_check(0, gp_padu))
//	//{
//	//	//show_debug_message("D-Pad UP. Move Character/Menu");
//	//	temp_pos_y -= player_speed;
//	//}
//	//
//	//if(gamepad_button_check(0, gp_padd))
//	//{
//	//	//show_debug_message("D-Pad DOWN. Move Character/Menu");
//	//	temp_pos_y += player_speed;
//	//}
//	//
//	//if(gamepad_button_check(0, gp_padl))
//	//{
//	//	//show_debug_message("D-Pad LEFT. Move Character/Menu");
//	//	temp_pos_x -= player_speed;
//	//}
//	//
//	//if(gamepad_button_check(0, gp_padr))
//	//{
//	//	//show_debug_message("D-Pad RIGHT. Move Character/Menu");
//	//	temp_pos_x += player_speed;
//	//}
//}	
//
//phy_position_x = temp_pos_x;
//phy_position_y = temp_pos_y;
//



//



// Old tutorial code


////move_up = keyboard_check(vk_up);
////move_down = keyboard_check(vk_down);
////move_left = keyboard_check(vk_left);
////move_right = keyboard_check(vk_right);
////
////xx = move_right - move_left;
////yy = move_down - move_up;
////
////hspd = xx * spd;
////vspd = yy * spd;
////
////if(place_meeting(x+hspd, y, obj_impassable))
////{
////	while(!place_meeting(x+sign(hspd),y,obj_impassable))
////	{
////		x+=sign(hspd);
////	}
////	
////	hspd = 0;
////}
////
////x += hspd;
////
////if(place_meeting(x, y+vspd, obj_impassable))
////{
////	while(!place_meeting(x,y + sign(vspd),obj_impassable))
////	{
////		y+=sign(vspd);
////	}
////	
////	vspd = 0;
////}
////
////y += vspd;