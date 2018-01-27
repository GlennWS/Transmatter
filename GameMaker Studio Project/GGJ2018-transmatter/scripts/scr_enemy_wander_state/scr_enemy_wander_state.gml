/// scr_enemy_wander_state()

scr_check_for_player();
phy_position_x += sign(obj_player.x - x) * spd;
phy_position_y += sign(obj_player.y - y) * spd;