--***********************************************************
--**                       BitBraven                       **
--***********************************************************

LMFServer = {}

local festivalPlaying = false
local mainStagesq

local everyOneMinute = function()

    local playerObj = getPlayer(); if not playerObj then return end

    if(festivalPlaying) then
        addSound(playerObj, mainStagesq:getX(), mainStagesq:getY(), mainStagesq:getZ(), 200, 200)
    else
        Events.EveryOneMinute.Remove(everyOneMinute)
    end
end

LMFServer.StartFestival = function(playerObj, square, musicName)

    if festivalPlaying then
        playerObj:Say(getText("IGUI_PlayerText_FestivalAlreadyPlaying"));
        return
    end

    if not mainStagesq then
        mainStagesq = square
    end

    festivalPlaying = true

    getSoundManager():PlayWorldSound(musicName, mainStagesq, 0, 200, 1.0, false);
    addSound(playerObj, mainStagesq:getX(), mainStagesq:getY(), mainStagesq:getZ(), 200, 200)
    Events.EveryOneMinute.Add(everyOneMinute)
    print("STARTED FESTIVAL!")

    BravensUtils.DelayFunction(function()
        festivalPlaying = false
        print("ENDED FESTIVAL!")
    end, 5000);
end