/// @description Insert description here
// You can write your code in this editor
if(hp<=0){
	global.kitty_heart-=1
	if(global.kitty_heart==0){room_goto(room_ed)}
	else {room_goto_next()}
}
//좌우 이동
if(keyboard_check(ord("D")) - keyboard_check(ord("A")) != 0)
     image_xscale = keyboard_check(ord("D")) - keyboard_check(ord("A"))
hspd += keyboard_check(ord("D"))-keyboard_check(ord("A"))

//점프 
if(keyboard_check(ord("W"))){
    if(place_meeting(x, y+1, obj_block1)){
		if(jumpshoes==false)
			vspd = jumpspd
		else
			vspd=jumpspd*1.5
	}
	if(place_meeting(x,y+1,obj_trampoin)){
		vspd=jumpspd*2
		audio_play_sound(sound_trampolin,1,false)		
	}
}
		
event_inherited()


//발톱 
if(claw==true){
	if(keyboard_check(vk_control)) {
		if(delay == 0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_claw)
			obj_effect_claw.image_xscale = image_xscale
		    audio_play_sound(sound_kitty,1,false)			
			delay = 1
			if(book==true)
				alarm[0]=room_speed/4
			else if(dumbbell==true)
				alarm[0]=room_speed
			else
				alarm[0]=room_speed/2
		}
	}
}
if(wool==false&&watergun==false&&watermelon==false&&sword==false){
	claw=true
}

//물총 
if(keyboard_check(ord("S"))){
	if(place_meeting(x,y+1,obj_watergun)){
		instance_destroy(instance_nearest(x, y+1,obj_watergun))
		watergun = true
		claw=false
		watermelon=false
		sword=false
		wool=false
	}
}

if(watergun==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_foot_watergun)
	obj_foot_watergun.x = x+image_xscale*18
	obj_foot_watergun.y = y+4
	obj_foot_watergun.image_xscale = image_xscale
	watergun_time+=1
	if(watergun_time>=600){
		watergun=false
		watergun_time=0
	}
	if(keyboard_check(vk_control)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_watergun2)
			obj_effect_watergun2.image_xscale = image_xscale
			obj_effect_watergun2.hspeed=8*image_xscale
		    audio_play_sound(sound_watergun,0,false)			
			delay = 1
			if(book==true)
				alarm[0]=room_speed/4
			else if(dumbbell==true)
				alarm[0]=room_speed
			else
				alarm[0]=room_speed/2
		}
	}
}

if(watergun == false){
	instance_destroy(obj_foot_watergun)
}

//수박 
if(keyboard_check(ord("S"))){
	if(place_meeting(x,y+1,obj_watermelon)){
		instance_destroy(instance_nearest(x, y+1,obj_watermelon))
		watergun = false
		claw=false
		watermelon=true
		sword=false
		wool=false
	}
}

if(watermelon==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_foot_watermelon)
	obj_foot_watermelon.x = x+image_xscale*18
	obj_foot_watermelon.y = y+4
	obj_foot_watermelon.image_xscale = image_xscale
	watermelon_time+=1
	if(watermelon_time>=600){
		watermelon=false
		watermelon_time=0
	}
	if(keyboard_check(vk_control)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_watermelon2)
			obj_effect_watermelon2.image_xscale = image_xscale
			obj_effect_watermelon2.hspeed=8*image_xscale
		    audio_play_sound(sound_watermelon,0,false)			
			delay = 1
			if(book==true)
				alarm[0]=room_speed/4
			else if(dumbbell==true)
				alarm[0]=room_speed
			else
				alarm[0]=room_speed/2
		}
	}
}

if(watermelon == false){
	instance_destroy(obj_foot_watermelon)
}

//장난감 칼 
if(keyboard_check(ord("S"))){
	if(place_meeting(x,y+1,obj_sword)){
		instance_destroy(instance_nearest(x, y+1,obj_sword))
		watergun = false
		claw=false
		watermelon=false
		sword=true
		wool=false
	}
}

if(sword==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_foot_sword)
	obj_foot_sword.x = x+image_xscale*18
	obj_foot_sword.y = y+4
	obj_foot_sword.image_xscale = image_xscale
	sword_time+=1
	if(sword_time>=600){
		sword=false
		sword_time=0
	}
	if(keyboard_check(vk_control)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_sword2)
			obj_effect_sword2.image_xscale = image_xscale
		    audio_play_sound(sound_sword,0,false)			
			delay = 1
			if(book==true)
				alarm[0]=room_speed/4
			else if(dumbbell==true)
				alarm[0]=room_speed
			else
				alarm[0]=room_speed/2
		}
	}
}

if(sword == false){
	instance_destroy(obj_foot_sword)
}

//털실 
if(keyboard_check(ord("S"))){
	if(place_meeting(x,y+1,obj_wool)){
		instance_destroy(instance_nearest(x, y+1,obj_wool))
		watergun = false
		claw=false
		watermelon=false
		sword=false
		wool=true
	}
}

if(wool==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_foot_wool)
	obj_foot_wool.x = x+image_xscale*18
	obj_foot_wool.y = y+4
	obj_foot_wool.image_xscale = image_xscale
	wool_time+=1
	if(wool_time>=600){
		wool=false
		wool_time=0
	}
	if(keyboard_check(vk_control)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_wool2)
			obj_effect_wool2.image_xscale = image_xscale
		    audio_play_sound(sound_wool,0,false)			
			delay = 1
			if(book==true)
				alarm[0]=room_speed/4
			else if(dumbbell==true)
				alarm[0]=room_speed
			else
				alarm[0]=room_speed/2
		}
	}
}

if(wool == false){
	instance_destroy(obj_foot_wool)
}

//HP


	if(place_meeting(x,y+1,obj_banana)){
		instance_destroy(instance_nearest(x, y+1,obj_banana))
		hp+=7
		if(hp >= 100){hp=100}
	}
	if(place_meeting(x,y+1,obj_grapefruit)){
		instance_destroy(instance_nearest(x, y+1,obj_grapefruit))
		hp+=5
		if(hp >= 100){hp=100}
	}
	if(place_meeting(x,y+1,obj_grapefruit2)){
		instance_destroy(instance_nearest(x, y+1,obj_grapefruit2))
		hp+=10
		if(hp >= 100){hp=100}
	}
	if(place_meeting(x,y+1,obj_carrot)){
		instance_destroy(instance_nearest(x, y+1,obj_carrot))
		hp+=8
		if(hp >= 100){hp=100}
	}
	if(place_meeting(x,y+1,obj_hotdog)){
		instance_destroy(instance_nearest(x, y+1,obj_hotdog))
		hp-=5
	}
	if(place_meeting(x,y+1,obj_hamberger)){
		instance_destroy(instance_nearest(x, y+1,obj_hamberger))
		hp-=10
	}
	if(place_meeting(x,y+1,obj_heart)){
		instance_destroy(instance_nearest(x, y+1,obj_heart))
		hp=100
	}


//book
if(place_meeting(x,y+1,obj_book)){
		instance_destroy(instance_nearest(x, y+1,obj_book))
		book=true
	}
if(book==true){
	book_time+=1
	if(book_time>=600){
		book=false
		book_time=0
	}
}

//jump shoes
if(place_meeting(x,y+1,obj_jumpshoes)){
		instance_destroy(instance_nearest(x, y+1,obj_jumpshoes))
		jumpshoes=true
}
if(jumpshoes==true){
	jumpshoes_time+=1
	if(jumpshoes_time>=600){
		jumpshoes=false
		jumpshoes_time=0
	}
}