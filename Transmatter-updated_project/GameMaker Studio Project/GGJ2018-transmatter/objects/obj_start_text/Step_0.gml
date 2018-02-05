/// @description Text Fade Out/In

if(obj_start_text.fadeout)
{
	myalpha = max(myalpha-0.005, 0.25);	
	if(myalpha = 0.25) fadeout = false;
}
else
{
	myalpha = min(myalpha+0.005, 1);	
	if(myalpha = 1) fadeout = true;
}
