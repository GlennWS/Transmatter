/// Draw the stats
draw_text(200, 16, "DAMAGE: " + string(floor(obj_player.damage)));
draw_text(200, 32, "ARMOR: " + string(floor(obj_player.defense)));

draw_text(200, 48, "GOLD: " + string(floor(obj_player.player_gold)));
draw_text(200, 64, "LUMINITE: " + string(floor(obj_player.player_luminite)));
