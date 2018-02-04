/// @description Insert description here
// You can write your code in this editor
var maxpads = gamepad_get_device_count();

for (var i = 0; i < maxpads; i++)
{
    if (gamepad_is_connected(i))
    {
        // do stuff with pad "i"
		if(gamepad_button_check(i, gp_face1)) show_debug_message("A button pressed. Confirm/Attack");
		
		if(gamepad_button_check(i, gp_face4)) show_debug_message("Y button pressed. Open Menu");
		
		if(gamepad_button_check(i, gp_face3)) show_debug_message("X button pressed. Dodge Roll");
		
		if(gamepad_button_check(i, gp_padu)) show_debug_message("D-Pad UP. Move Character/Menu");
		
		if(gamepad_button_check(i, gp_padd)) show_debug_message("D-Pad DOWN. Move Character/Menu");
		
		if(gamepad_button_check(i, gp_padl)) show_debug_message("D-Pad LEFT. Move Character/Menu");
		
		if(gamepad_button_check(i, gp_padr)) show_debug_message("D-Pad RIGHT. Move Character/Menu");
	}	
}
	
	