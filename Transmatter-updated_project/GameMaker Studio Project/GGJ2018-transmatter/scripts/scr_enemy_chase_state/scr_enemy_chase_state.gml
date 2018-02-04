/// scr_enemy_chase_state()

scr_check_for_player();

x += sign(targetx - x) * spd;
y += sign(targety - y) * spd;