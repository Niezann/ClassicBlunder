
/obj/plane_test
    plane = 11
    appearance_flags = PLANE_MASTER | PIXEL_SCALE
    screen_loc = "1,1"
    mouse_opacity = 0
    layer = BACKGROUND_LAYER

/obj/client_plane_master
    plane = FLOAT_PLANE
    appearance_flags = PLANE_MASTER | PIXEL_SCALE
    screen_loc = "LEFT,BOTTOM"
    mouse_opacity = 1
    layer = BACKGROUND_LAYER



/obj/dorkness
    icon = 'blackcutin.dmi'
    alpha = 0
    layer = 999

/obj/lightness
    icon = 'lightcutin.dmi'
    alpha = 0
    layer = 999

/obj/lightness
    icon = 'lightcutin.dmi'
    alpha = 0
    layer = 999

/obj/animationobj
    layer = 4.9
    appearance_flags = PIXEL_SCALE | KEEP_TOGETHER
    New(i, s_loc, a_loc, addto,_px,_py, appear_take, l, appear_flags)
        if(i)
            icon = i
        if(screen_loc)
            screen_loc = s_loc
        if(appear_take)
            appearance = appear_take
        if(l)
            layer = l
        if(appear_flags)
            appearance_flags = appear_flags
        if(_py)
            pixel_y = _py
        if(_px)
            pixel_x = _px
        if(addto)
            addto += src
// prob shouldn't make more objs, but w/e

/mob/verb/testHellSSJ4()
    set category = "Debug"
    HellSSJ4Animation1()

/mob/proc/HellSSJ4Animation1(appearance1, appearance2)
    var/oldview = client.view
    client.eye = locate(99,99,1)
    Quake(30, z)
    // client.perspective = EDGE_PERSPECTIVE
    // client.edge_limit = "SOUTHWEST to NORTHEAST"
    var/obj/blankHolder = new()
    var/obj/dorkness/dorkness = new()
    var/obj/lightness/lightness = new()
    var/obj/animationobj/lightness2 = new(i = 'lightcutin.dmi', s_loc = "LEFT,BOTTOM", addto = blankHolder.vis_contents, l = MOB_LAYER+0.85)
    var/obj/animationobj/background = new(i = 'HellSSJ4AnimationRock.dmi', s_loc = "LEFT,BOTTOM", addto = blankHolder.vis_contents, l = MOB_LAYER+0.5)
    background.icon_state = "Background"
    var/obj/animationobj/i2 = new(i = 'HellSSJ4AnimationRock.dmi', s_loc = "LEFT,BOTTOM",addto = blankHolder.vis_contents,_px = -10, _py = 0, l = MOB_LAYER+0.8)
    i2.icon_state = "HandBack"
    var/obj/animationobj/i3 = new(i = 'HellSSJ4AnimationRock.dmi', s_loc = "LEFT,BOTTOM",addto = blankHolder.vis_contents, _py = 0, l = MOB_LAYER+0.9)
    i3.icon_state = "RockStandard"

    blankHolder.screen_loc = "LEFT,BOTTOM"
    client.screen += blankHolder
    blankHolder.vis_contents+=background
    blankHolder.vis_contents+=dorkness
    blankHolder.vis_contents += lightness


    var/obj/animationobj/bleh = new(s_loc = "CENTER+1,CENTER+1", appear_flags = PIXEL_SCALE | KEEP_TOGETHER, appear_take = appearance1, l = MOB_LAYER+0.7)
    var/obj/animationobj/bleh2 = new(s_loc = "CENTER+1,CENTER+1", appear_flags = PIXEL_SCALE | KEEP_TOGETHER, appear_take = appearance2, l = MOB_LAYER+0.7)

    var/over = bleh.overlays
    world << "overlay is [over]"


    bleh.screen_loc = "CENTER+1,CENTER+1" // ????
    bleh2.screen_loc = "CENTER+1,CENTER+1" // ????
    bleh.dir = SOUTH
    bleh2.dir = SOUTH
    bleh.transform = matrix().Scale(20).Translate(50, -250)
    bleh2.transform = matrix().Scale(20).Translate(50, -250)

    client.screen += bleh2

    animate(lightness2, alpha=0,time = 15)
    animate(i2, pixel_x=10,time = 10, easing = SINE_EASING|EASE_OUT)
    animate(i2, pixel_y=-200,time = 60, easing = SINE_EASING|EASE_OUT)
    animate(i3, pixel_y=-200,time = 50, easing = SINE_EASING|EASE_OUT)
    sleep(20)
    del i2
    i3.icon_state = "RockGrab"
    sleep(10)
    animate(bleh2, transform = matrix().Scale(20).Translate(50, -150), time = 50, easing = SINE_EASING|EASE_OUT)
    sleep(20)
    animate(lightness, alpha = 255, time = 10)
    sleep(10)
    del i3
    bleh2.transform = matrix().Scale(20).Translate(-20, 250)
    animate(bleh2, transform = matrix().Scale(20).Translate(-20, 0), time = 20, easing = SINE_EASING|EASE_OUT)
    animate(lightness, alpha = 0, time = 2)
    sleep(20)
    animate(bleh2, transform = matrix().Scale(4).Translate(-20, 0), time = 2)
    sleep(20)
    client.view = oldview
    del blankHolder
    del dorkness
    del lightness
    del bleh
    del bleh2
    del background
    del lightness2
    client.eye = src