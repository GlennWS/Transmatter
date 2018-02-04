len = player_speed * 4;

horiz_speed = lengthdir_x(len, dir);
vert_speed = lengthdir_y(len, dir);

x += horiz_speed;
y += vert_speed;