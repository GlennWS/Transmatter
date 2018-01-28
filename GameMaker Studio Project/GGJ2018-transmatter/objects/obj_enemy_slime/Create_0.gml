/// Enemy Slime

event_inherited();
level = 1;
maxhp = 3 + ceil(level*0.5);
hp = maxhp;
image_speed = 0.1;
spd = 0.50;
state = scr_enemy_idle_state;
alarm[0] = room_speed * irandom_range(2, 5);
sight = 64;
targetx = 0;
targety = 0;
difficulty = 1;
experience_worth = level * (difficulty + 1);
