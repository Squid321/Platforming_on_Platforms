/// @description Player Logic

// Get player inputs
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump = keyboard_check(vk_space)

//Calc movement
var _move = key_right - key_left

hsp = _move * walksp

vsp = vsp + grv

//Horizontal colision
if (place_meeting(x+hsp,y,ObWall)) {
	while not (place_meeting(x+sign(hsp),y,ObWall)) {
		x = x + sign(hsp)
	}
	hsp = 0
}
x = x + hsp

//Vertical colision
if (place_meeting(x,y+vsp,ObWall)) {
	while not (place_meeting(x,y+sign(vsp),ObWall)) {
		y = y + sign(vsp)
	}
	vsp = 0
}
y = y + vsp






