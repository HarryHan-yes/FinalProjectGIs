scr_input()
image_speed = 0.03
sprite_index = spr_Lindy_idle;

if (pressA or pressD) {
    state = LindyStates.walk;
} 

moveX = 0;
