/// Draw the stats

draw_text(32, 16, "LEVEL: " + string(obj_player.level));
draw_text(32, 32, "HP: " + string(obj_player.hp) + " / " + string(obj_player.maxhp));
draw_text(32, 48, "STAMINA: " + string(obj_player.stamina) + " / " + string(obj_player.maxstamina));
draw_text(32, 64, "EXPERIENCE: " + string(obj_player.experience) + " / " + string(obj_player.next_level));