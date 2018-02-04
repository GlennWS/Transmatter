/// @description Draw Healthbar
// You can write your code in this editor
if(hp < maxhp)
draw_healthbar(self.x - (self.sprite_width / 2),self.y - (self.sprite_height / 4) - 16,self.x + (self.sprite_width / 2),self.y - (self.sprite_height / 6)-10, ( self.hp / self.maxhp )  * 100, c_red, c_green, c_lime,0, true, true);