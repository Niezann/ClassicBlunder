/mob/var/tmp/list/distortions=list();

/mob/proc/AddDistortion()
    var/labelName = "distortions[distortions.len]";
    var/mapControlSize = winget(src, "map", "size")
    var/xLoc = findtext(mapControlSize, "x");
    var/mapControlWidth = text2num(copytext(mapControlSize, 1, xLoc));
    var/mapControlHeight = text2num(copytext(mapControlSize, xLoc+1, 0));
    var/dx=rand(1, mapControlWidth);
    var/dy=rand(1, mapControlHeight);
    var/dw=rand(max(round(mapControlWidth/100), 25), round(mapControlWidth/5));
    var/dh=rand(max(round(mapControlHeight/100), 25), round(mapControlHeight/5));
    var/list/genericDist = list()
    genericDist["parent"] = "mapwindow";
    genericDist["type"] = "label";
    genericDist["pos"] = "[dx],[dy]"
    genericDist["size"] = "[dw],[dh]"
    genericDist["anchor1"] = "none"
    genericDist["anchor2"] = "none"
    genericDist["background-color"] = "#000"
    winset(src, labelName, list2params(genericDist));
    distortions.Add(labelName);

mob/proc/RunDistortionTwitches()
    var/twitches=round(distortions.len)
    while(twitches)
        src.DistortionTwitch("distortions[twitches-1]");
        twitches--;
        CHECK_TICK

mob/proc/DistortionTwitch(labelName)
    var/list/twitch = list()
    var/currentPos = winget(src, labelName, "pos")
    var/xLoc = findtext(currentPos, ",");
    var/currentX = text2num(copytext(currentPos, 1, xLoc));
    var/currentY = text2num(copytext(currentPos, xLoc+1, 0));
    currentX = rand(currentX-5, currentX+5);
    currentY = rand(currentY-5, currentY+5);
    twitch["pos"] = "[currentX],[currentY]";
    winset(src, labelName, list2params(twitch));
    

mob/proc/ClearDistortion()
    for(var/n in src.distortions)
        winset(src, n, "is-visible='false'");//hide
    winset(src, null, "reset=true");
    src.distortions=list();
    