/// scr_enemy_wander_state()

scr_check_for_player();
x += sign(obj_player.x - x) * spd;
x += sign(obj_player.y - y) * spd;