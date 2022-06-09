/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_set_halign(room)

//kitty
draw_set_color(c_red)
draw_rectangle(100,40,600,80,false)

draw_set_color(c_ltgray)
draw_rectangle(100, 40, 100+(100*obj_player_killerkitty.hp/obj_player_killerkitty.max_hp)*5, 80, false)

draw_set_color(c_black)
draw_rectangle(100, 40, 600, 80, true)

for(i=0; i<global.kitty_heart; i++)
    draw_sprite(spr_heart,0,100+80*i,100)

//baby

draw_set_color(c_red)
draw_rectangle(766,40,1266,80,false)

draw_set_color(c_teal)
draw_rectangle(766+(100-obj_player_babyboss.hp)*5, 40,1266, 80, false)

draw_set_color(c_black)
draw_rectangle(766, 40, 1266, 80, true)

for(i=0; i<global.baby_heart; i++)
    draw_sprite(spr_heart,0,1166-80*i,100)



