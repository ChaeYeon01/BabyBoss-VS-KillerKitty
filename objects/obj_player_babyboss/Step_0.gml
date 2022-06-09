/// @description Insert description here
// You can write your code in this editor
if(hp<=0){
	global.baby_heart-=1
	if(global.baby_heart==0){room_goto(room_ed2)}
	else {room_goto_next()}
}
//좌우 이동
if(keyboard_check(vk_right) - keyboard_check(vk_left) != 0)
     image_xscale = keyboard_check(vk_right) - keyboard_check(vk_left)

hspd += keyboard_check(vk_right)-keyboard_check(vk_left)

//점프 
if(keyboard_check(vk_up)){
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


//우유 
if(milk==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_hand_milk)
	obj_hand_milk.x = x+image_xscale*18
	obj_hand_milk.y = y+4
	obj_hand_milk.image_xscale =image_xscale	
	if(keyboard_check(vk_space)) {
		if(delay == 0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_milk)
			obj_effect_milk.image_xscale = image_xscale
			obj_effect_milk.hspeed=8*image_xscale
			audio_play_sound(sound_baby,1,false)			
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

if(milk == false){
	instance_destroy(obj_hand_milk)
}

if(wool==false&&watergun==false&&watermelon==false&&sword==false){
	milk=true
}

//물총 
if(keyboard_check(vk_down)){
	if(place_meeting(x,y+1,obj_watergun)){
		instance_destroy(instance_nearest(x, y+1,obj_watergun))
		watergun = true
		milk=false
		watermelon=false
		sword=false
		wool=false
	}
}

if(watergun==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_hand_watergun)
	obj_hand_watergun.x = x+image_xscale*18
	obj_hand_watergun.y = y+4
	obj_hand_watergun.image_xscale = image_xscale

	watergun_time+=1
	if(watergun_time>=600){
		watergun=false
		watergun_time=0
	}
	if(keyboard_check(vk_space)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_watergun)
			obj_effect_watergun.image_xscale = image_xscale
			obj_effect_watergun.hspeed=8*image_xscale
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
	instance_destroy(obj_hand_watergun)
}


//수박 
if(keyboard_check(vk_down)){
	if(place_meeting(x,y+1,obj_watermelon)){
		instance_destroy(instance_nearest(x, y+1,obj_watermelon))
		watergun = false
		milk=false
		watermelon=true
		sword=false
		wool=false
	}
}

if(watermelon==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_hand_watermelon)
	obj_hand_watermelon.x = x+image_xscale*18
	obj_hand_watermelon.y = y+4
	obj_hand_watermelon.image_xscale = image_xscale	
	watermelon_time+=1
	if(watermelon_time>=600){
		watermelon=false
		watermelon_time=0
	}
	if(keyboard_check(vk_space)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_watermelon)
			obj_effect_watermelon.image_xscale = image_xscale
			obj_effect_watermelon.hspeed=8*image_xscale
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
	instance_destroy(obj_hand_watermelon)
}
//장난감 칼 
if(keyboard_check(vk_down)){
	if(place_meeting(x,y+1,obj_sword)){
		instance_destroy(instance_nearest(x, y+1,obj_sword))
		watergun = false
		milk=false
		watermelon=false
		sword=true
		wool=false
	}
}

if(sword==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_hand_sword)
	obj_hand_sword.x =x+image_xscale*18
	obj_hand_sword.y =y+4
	obj_hand_sword.image_xscale = image_xscale
	sword_time+=1
	if(sword_time>=600){
		sword=false
		sword_time=0
	}
	if(keyboard_check(vk_space)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_sword)
			obj_effect_sword.image_xscale = image_xscale
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
	instance_destroy(obj_hand_sword)
}

//털실 
if(keyboard_check(vk_down)){
	if(place_meeting(x,y+1,obj_wool)){
		instance_destroy(instance_nearest(x, y+1,obj_wool))
		watergun = false
		milk=false
		watermelon=false
		sword=false
		wool=true
	}
}

if(wool==true){
	instance_create_depth(x+image_xscale*18,y+4,depth-1,obj_hand_wool)
	obj_hand_wool.x = x+image_xscale*18
	obj_hand_wool.y = y+4
	obj_hand_wool.image_xscale = image_xscale
	wool_time+=1
	if(wool_time>=600){
		wool=false
		wool_time=0
	}
	if(keyboard_check(vk_space)){
		if(delay==0){
			instance_create_depth(x+image_xscale*64, y, depth-1, obj_effect_wool)
			obj_effect_wool.image_xscale = image_xscale
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
	instance_destroy(obj_hand_wool)
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
		dumbbell=false
	}
if(book==true){
	book_time+=1
	if(book_time>=600){
		book=false
		book_time=0
	}
}

//dumbbell
if(place_meeting(x,y+1,obj_dumbbell)){
		instance_destroy(instance_nearest(x, y+1,obj_dumbbell))
		dumbbell=true
		book=false
	}
if(dumbbell==true){
	dumbbell_time+=1
	if(dumbbell_time>=600){
		dumbbell=false
		dumbbell_time=0
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