/// @description Fade Out Behind Objects

if(collision_circle(x,y,17, obj_player, true, true))
{
	image_alpha = 0.5;
}
else
{
	image_alpha = 1;
}