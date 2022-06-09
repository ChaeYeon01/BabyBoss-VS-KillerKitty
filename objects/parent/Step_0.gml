/// @description Insert description here
// You can write your code in this editor
while(place_meeting(x+hspd, y, obj_block1)){
	hspd -= hspd/2
	if(abs(hspd) < 1)
		hspd = 0
}
x += hspd


//중력,점프
vspd += gravity_
while(place_meeting(x, y+vspd, obj_block1)){
	vspd -= vspd/2
	if(abs(vspd) < 1)
		vspd = 0
}
y += vspd

//룸 밖으로 안 나가게
if (x < 20)
	x = 20
if (x > room_width-20)
	x = room_width-20
if (y < 0)
	y = 0
if (y > room_height)
	y = room_height
	
	
//socks
if(place_meeting(x,y+1,obj_socks)){
	instance_destroy(obj_socks)
	socks=true
	board=false
}

if(socks==true){
	hspd*=0.5
	socks_time+=1
	if(socks_time>=600){
		socks=false
		socks_time=0
	}
}
else
	hspd *= 0.9
	
	
//board
if(place_meeting(x,y+1,obj_board)){
	instance_destroy(obj_board)
	board=true
	socks=false
}

if(board==true){
	hspd*=1.05
	board_time+=1
	if(board_time>=600){
		board=false
		board_time=0
	}
}
else
	hspd *= 0.9



