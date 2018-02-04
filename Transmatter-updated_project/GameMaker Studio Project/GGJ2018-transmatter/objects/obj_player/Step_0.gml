/// @description All Frame Code

var moved = false;

if(hp <= 0) game_restart();

if (!player_attacking) sprite_index = global.spr_array_walking[mydirection];

switch(mydirection)
{
	case directions.up:
		tempx = x;
		tempy = y - 32;
		break;
	
	case directions.down:
		tempx = x;
		tempy = y + 32;
		break;
	
	case directions.left:
		tempx = x - 28;
		tempy = y;
		break;
	
	case directions.right:
		tempx = x + 28;
		tempy = y;
		break;
}

#region Input Check

if(keyboard_check_pressed(vk_escape))
{
	game_end();
}

if(keyboard_check_pressed(ord("R")))
{
	game_restart();	
}
	
if(moveable)
{
	if(keyboard_check_pressed(vk_backspace))
	{
		show_debug_message("switching debug status");
		show_debug_message("my direction is " + string(mydirection));
	
		if(!debug)
		{
			debug = true;
		}
		else
		{
			debug = false;
		}
	}

	// Move up
	if((keyboard_check(vk_up)) || (keyboard_check(ord("W"))))
	{
		if(!player_attacking)
		{
			// Update the movement flag for this frame - remember to clear it after the movement script
			moved_up = 1;
			mystate = states.walking;
			mydirection = directions.up;
			sprite_index = spr_Sarah_up;
		}
	}

	// Move left
	if((keyboard_check(vk_left)) || (keyboard_check(ord("A"))))
	{
		if(!player_attacking)
		{
			// Update the movement flag for this frame - remember to clear it after the movement script
			moved_left = 1;
			mystate = states.walking;
			mydirection = directions.left;
			sprite_index = spr_Sarah_left;
		}
	}

	// Move down
	if((keyboard_check(vk_down)) || (keyboard_check(ord("S"))))
	{
		if(!player_attacking)
		{
			// Update the movement flag for this frame - remember to clear it after the movement script
			moved_down = 1;
			mystate = states.walking;
			mydirection = directions.down;
			sprite_index = spr_Sarah_down;
		}
	}

	// Move right
	if((keyboard_check(vk_right)) || (keyboard_check(ord("D"))))
	{
		if(!player_attacking)
		{
			// Update the movement flag for this frame - remember to clear it after the movement script
			moved_right = 1;
			mystate = states.walking;
			mydirection = directions.right;
			sprite_index = spr_Sarah_right;
		}
	}

	if(keyboard_check_pressed(ord("F")))
	{
		if(!player_attacking)
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
	}

	if(keyboard_check_pressed(vk_space))
	{
		// tempx and tempy represent collision vector in current facing direction
		var check = instance_place(tempx, tempy, obj_interactable);
	
		if(check != noone)
		{
			show_debug_message(check.id);
		}
		// check if its noone
			// and if it is - we need to read its text
			// if it has loot, we need to read its loot
				// then turn its loot off
		else
		{
			mystate = states.attacking;
				
			if(!aud_lim_sword)
			{
				audio_play_sound(snd_sword, 10, false)
				aud_lim_sword = true;
				alarm[4] = 36;
			}
		
			if(!player_attacking)
			{
				player_attacking = true;
				alarm[3] = 36;
				sprite_index = global.spr_array_attacking[mydirection];
				image_speed = 1;
				image_index = 0;
			}
		}
		// update state to attacking
		// update sprites to match attacking state - reset here could be issue
			// dont want to reset sprite if already attacking - so make sure key_press , instead of key
	
		// if the audio limit for the sword is false, then
			// play sword sound
			// audio limit is true
			// alarm 4 is set for time
		
		// otherwise set the image speed to 1 - regular speed
		// and alarm 3 is set to prevent attacking again until current attack is up
	
		show_debug_message("Working on it.");
	}
}	
#endregion

#region State Update

if(mystate = states.walking)
{
	// If Shift is being pressed this frame, run
	if(keyboard_check(vk_shift))
	{
		walk_speed = 4.5;
		var dash = instance_create_depth(x, y, -1, obj_dash_effect);
		dash.sprite_index = sprite_index;
		dash.image_index = image_index;
	}
	else
	{
		walk_speed = 3.5;
	}
	
	if((moved_right == 1) and place_free(x + collision_speed_me, y))
	{
		x += walk_speed;
		image_speed = walk_speed / 3;
		
		moved = true;
	}

	if((moved_left == 1) and place_free(x - collision_speed_me, y))
	{
		x -= walk_speed;
		image_speed = walk_speed / 3;
		
		moved = true;
	}

	if((moved_up == 1) and place_free(x, y - collision_speed_me))
	{
		y -= walk_speed;
		image_speed = walk_speed / 3;
		
		moved = true;
	}

	if((moved_down == 1) and place_free(x, y + collision_speed_me))
	{
		y += walk_speed;
		image_speed = walk_speed / 3;
		
		moved = true;
	}

	if(keyboard_check(vk_nokey) and (!player_attacking))
	{
		image_speed = 0;
		image_index = 0;
	}
	
	moved_left = 0;
	moved_right = 0;
	moved_up = 0;
	moved_down = 0;
	
}
else if(mystate = states.attacking)
{
	if(image_index >= 5 && image_index < 9)
	{
		if(!attack_active)
		{
			moveable = false;
			attack_active = true;

			with(instance_create_layer(tempx,tempy,"Instances",global.obj_array_attacking[mydirection]))
			{
				with(instance_place(obj_player.tempx,obj_player.tempy,obj_lifeform_enemy))
				{
					show_debug_message("Enemy hit");
					with (other) 
					{
						other.hp -= floor(obj_player.damage);
						show_debug_message("hit " + string(other.id) + " for " + string(obj_player.damage) + " damage");
						if (other.hp <= 0) 
						{
							instance_destroy();
						}
					}
				}
			}
		}
	}
	//show_debug_message(image_index);
	if(image_index >= 8)
	{
		image_speed = 0.0;
		obj_player.player_state = states.walking;
		obj_player.sprite_index = global.spr_array_walking[mydirection];
		image_index = 0;
		moveable = true;
		player_attacking = false;
	}
}

#endregion

#region Counter Status

if(experience >= next_level)
{
	script_execute(scr_levelup());
	instance_create_layer(x,y,"Instances",obj_levelup_back);
	instance_create_layer(x,y,"Instances",obj_levelup_front);
	next_level = script_execute(scr_calculate_exp, level);
}

if(obj_player.heal_cooldown < 500)
{
	obj_player.heal_cooldown += 1; // max command for this +=1, or 500
}
else
{
	obj_player.heal_cooldown = 500;
}

#endregion