/mob/proc/GetBlurringStrikes()
    var/b = passive_handler.Get("BlurringStrikes") //This stores stuff from sources of BlurringStrikes... yay.
    b += GetMangLevel()
    if(b) return b
    return 0