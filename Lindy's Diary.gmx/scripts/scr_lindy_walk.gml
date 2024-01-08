scr_input()
image_speed = 0.03
sprite_index = spr_Lindy_walk; 

moveX = (pressD - pressA) * spd;

if (pressA + pressD == 0) {
    state = LindyStates.idle;
}
