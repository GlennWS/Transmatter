/// Basic Player Movement

event_inherited();

if (keyboard_check(vk_escape)) {
	game_end();
}

/// Arrow Key ///
// Move Right
if (keyboard_check(vk_right)) 
{
	phy_position_x += player_speed;
}

// Move Left
if (keyboard_check(vk_left)) 
{
	phy_position_x -= player_speed;
}

// Move Up
if (keyboard_check(vk_up)) 
{
	phy_position_y -= player_speed;
}

// Move Down
if (keyboard_check(vk_down)) 
{
	phy_position_y += player_speed;
}
////////////////////////////////

/// WASD ///
// Move Right
if (keyboard_check(ord("D"))) 
{
	phy_position_x += player_speed;
}

// Move Left
if (keyboard_check(ord("A"))) 
{
	phy_position_x -= player_speed;
}

// Move Up
if (keyboard_check(ord("W"))) 
{
	phy_position_y -= player_speed;
}

// Move Down
if (keyboard_check(ord("S"))) 
{
	phy_position_y += player_speed;
}
var padcount;
with(obj_player)
{
	padcount = maxpads;
}

var temp_pos_y = phy_position_y;
var temp_pos_x = phy_position_x;

    if (gamepad_is_connected(0))
    {
        // do stuff with pad "i"
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