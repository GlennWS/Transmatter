var max_health = obj_player.maxhp;
amount = max_health * 0.4;
obj_player.hp += floor(amount);

if(obj_player.hp > maxhp) obj_player.hp = obj_player.maxhp;

obj_player.heal_cooldown = 0;