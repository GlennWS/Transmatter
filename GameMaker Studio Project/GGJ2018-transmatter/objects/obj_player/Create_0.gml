/// Initialisation

event_inherited();
image_speed = 0;
// Face index for attack
var face_index = 2; // DOWN
// 0 -> up 
// 1 -> left
// 2 -> down
// 3 -> right

player_speed = 3.5;
horiz_speed = 0;
vert_speed = 0;
xaxis = 0;
yaxis = 0;
len = 0;
dir = 0;

maxpads = gamepad_get_device_count();
