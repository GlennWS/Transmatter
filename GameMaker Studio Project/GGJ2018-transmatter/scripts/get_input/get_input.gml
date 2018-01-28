dvc = argument0;
dzn = argument1;









hspd = xx * player_speed;
vspd = yy * player_speed;


// Movement input 



if(act_attack)
{
	script_execute(scr_player_attacking());
}

if(keyboard_check_pressed(vk_nokey))
{
	if(!player_attacking)image_speed = 0;
}
else
{
	image_speed = player_speed / 3;
}