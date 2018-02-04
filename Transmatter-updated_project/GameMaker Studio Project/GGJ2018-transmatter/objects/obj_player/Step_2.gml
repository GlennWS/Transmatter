/// @description Post-Movement Checks

if(place_meeting(x,y,obj_pickup))
{
	var inst_pickup = instance_place(x,y,obj_pickup);

	switch(inst_pickup.myloot)
	{
		case loot.luminite:
		obj_player.player_luminite += inst_pickup.myluminite_value;
		audio_play_sound(snd_pickup_luminite,10, false);
		show_debug_message("TEXT FOR PICKUP. TBI.");
		instance_destroy(inst_pickup);
		break;
			
		case loot.gold:
		obj_player.player_gold += inst_pickup.mygold_value;
		audio_play_sound(snd_pickup_gold,10, false);
		show_debug_message("TEXT FOR PICKUP. TBI.");
		instance_destroy(inst_pickup);
		break;
			
		case loot.item:
		show_debug_message("Not yet implemented.");
		instance_destroy(inst_pickup);
		break;
	}
	inst_pickup = noone;
}
	
if(place_meeting(x,y,obj_telepad))
{
	var inst_telepad = instance_place(x,y,obj_telepad);
	
	if(inst_telepad.exit_opened)
	{
		if(!inst_telepad.active_exit)
		{
			obj_player.moveable = false;
			x = inst_telepad.x;
			y = inst_telepad.y;
			inst_telepad.alarm[1] = 10;
			inst_telepad.active_exit = true;
			obj_player.mydirection = directions.down;
		}
		
	}
}