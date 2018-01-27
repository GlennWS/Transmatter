var moved = false;

with(obj_player)
{
	if(moved_up == 1)
	{
		temp_pos_y -= player_speed;
		sprite_index = spr_array_walking[directions.up];
		image_speed = player_speed / 3;
		
		moved = true;
	}
	
	if(moved_left == 1)
	{
		temp_pos_x -= player_speed;
		sprite_index = spr_array_walking[directions.left];
		image_speed = player_speed / 3;
	
		moved = true;
	}
	
	if(moved_down == 1)
	{
		temp_pos_y += player_speed;
		sprite_index = spr_array_walking[directions.down];
		image_speed = player_speed / 3;
	
		moved = true;
	}
	
	if(moved_right == 1)
	{
		temp_pos_x += player_speed;
		sprite_index = spr_array_walking[directions.right];
		image_speed = player_speed / 3;
		
		moved = true;
	}
	
	if(!moved)
	{
		// switch to idle state
		script_execute(states_array[states.idle]);
	}
	
	moved_up = 0;
	moved_down = 0;
	moved_left = 0;
	moved_right = 0;
	
	phy_position_x = temp_pos_x;
	phy_position_y = temp_pos_y;
}