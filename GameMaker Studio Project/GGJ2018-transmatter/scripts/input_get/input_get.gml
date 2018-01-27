dvc = argument0;
dzn = argument1;

move_up = keyboard_check(ord("W"));
move_left = keyboard_check(ord("A"));
move_down = keyboard_check(ord("S"));
move_right = keyboard_check(ord("D"));
act_attack=keyboard_check_pressed(vk_space);

xx=(move_right-move_left);
yy=(move_down-move_up);

if(gamepad_is_connected(dvc))
{
	xx = gamepad_axis_value(dvc, gp_axislh);
	yy = gamepad_axis_value(dvc, gp_axislv);
	act_attack = gamepad_button_check_pressed(dvc, gp_face1);
}