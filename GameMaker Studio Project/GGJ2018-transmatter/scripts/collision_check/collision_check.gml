if(place_meeting(x+hspd, y, obj_impassable))
{
	while(!place_meeting(x+sign(hspd),y,obj_impassable))
	{
		x += sign(hspd);
	}
	
	hspd = 0;
}

x += hspd;

if(place_meeting(x, y+vspd, obj_impassable))
{
	while(!place_meeting(x,y + sign(vspd),obj_impassable))
	{
		y += sign(vspd);
	}
	
	vspd = 0;
}

y += vspd;

//if(place_meeting(x+hspd, y, obj_impassable))
//{
//	while(!place_meeting(x+sign(hspd),y,obj_impassable))
//	{
//		x+=sign(hspd);
//	}
//	
//	hspd = 0;
//}
//
//x += hspd;
//
//if(place_meeting(x, y+vspd, obj_impassable))
//{
//	while(!place_meeting(x,y + sign(vspd),obj_impassable))
//	{
//		y+=sign(vspd);
//	}
//	
//	vspd = 0;
//}
//
//y += vspd;