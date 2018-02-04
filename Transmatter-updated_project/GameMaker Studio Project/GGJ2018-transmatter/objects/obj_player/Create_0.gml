/// @description Initializer
// INITIAL VALUES

// MOVEMENT VALUES
walk_speed = 3.5;
collision_speed_me = walk_speed + 2;

// STATES

mystate = states.walking;
mydirection = directions.down;

// COUNTERS
heal_cooldown = 500;
tempx = x;
tempy = y;


// FLAGS
attack_active = false;
aud_lim_sword = false;
aud_lim_dodge = false;
player_attacking = false;
player_dodging = false;
attack_active = false;
moveable = true;
iframed = false;
paused = false;
skip = false;
debug = false;

moved_left = 0;
moved_right = 0;
moved_up = 0;
moved_down = 0;

// RPG VALUES

#region RPGMechanics

level = global.level;
experience = global.experience;
next_level = global.next_level;
global.level_depth = 1;

strength = global.strength;
weapon = global.weapon;
damage = global.damage;

constitution = global.constitution;
armor = global.armor;
defense = global.defense;

maxstamina = 100;
stamina = maxstamina;

basehp = global.basehp;
maxhp = global.maxhp;
hp = global.hp;

player_gold = global.player_gold;
player_luminite = global.player_luminite;

#endregion