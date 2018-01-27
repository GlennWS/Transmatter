len = player_speed * 4;

horiz_speed = lengthdir_x(len, dir);
vert_speed = lengthdir_y(len, dir);

phy_position_x += horiz_speed;
phy_position_y += vert_speed;