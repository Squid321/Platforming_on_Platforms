/// @description Player Logic
idle = 0;
// Get player inputs
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump = keyboard_check(vk_up)

//Calc movement
var _move = key_right - key_left

hsp = _move * walksp

if (hsp > 0) {
	dir = 1;
}
if (hsp < 0) {
	dir = 0;
}

vsp = vsp + grv

if (place_meeting(x,y+1,Obj_Wall)) and (key_jump) {
	vsp = -jumpsp
}

//Horizontal colision
if (place_meeting(x+hsp,y,Obj_Wall)) {
	while not (place_meeting(x+sign(hsp),y,Obj_Wall)) {
		x = x + sign(hsp)
	}
	hsp = 0
}
x = x + hsp

//Vertical colision
if (place_meeting(x,y+vsp,Obj_Wall)) {
	while not (place_meeting(x,y+sign(vsp),Obj_Wall)) {
		y = y + sign(vsp)
	}
	vsp = 0
}
y = y + vsp

//Animation
if not (place_meeting(x,y+1,Obj_Wall)) {
	if (hsp > 0) {
		sprite_index = Spr_PlayerJumpRight;
		image_xscale = 2
	}
	if (hsp < 0) {
		sprite_index = Spr_PlayerJumpLeft;
		image_xscale = -2
	}
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else {
	if (hsp == 0) {
		if (dir = 0) {
			sprite_index = Spr_PlayerIdleLeft
			idle = 1;
		}
		if (dir = 1) {
			sprite_index = Spr_PlayerIdleRight
			idle= 1;
		}
	}
	else {
		if (hsp > 0) {
			sprite_index = Spr_PlayerWalkRight
			image_xscale = 2;
			image_speed = 1;
		}
		if (hsp < 0) {
			sprite_index = Spr_PlayerWalkLeft
			image_xscale = -2;
			image_speed = 1;
		}
	}
}
			