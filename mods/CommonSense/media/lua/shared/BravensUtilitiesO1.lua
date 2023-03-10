--***********************************************************
--**                       BitBraven                       **
--***********************************************************

-- OVERRIDE FOR THIS SPECIFIC MOD

BravensUtilsO1 = {}

BravensUtilsO1.TryPlaySoundClip = function(obj, soundName)

	if obj:getEmitter():isPlaying(soundName) then return end
    obj:getEmitter():playSoundImpl(soundName, IsoObject.new())

end

BravensUtilsO1.TryStopSoundClip = function(obj, soundName)

	if not obj:getEmitter():isPlaying(soundName) then return end
	obj:getEmitter():stopSoundByName(soundName)
end

-- Drain the player's stamina for whatever reason
BravensUtilsO1.TirePlayer = function(playerObj, amount)

	local stats = playerObj:getStats()
	if not stats then return end

	if stats:getEndurance() < 0.21 then return end --We don't want to *kill* someone out of exhaustion do we?
	stats:setEndurance(stats:getEndurance() - (amount / (playerObj:getPerkLevel(Perks.Fitness) / 2)))
end

-- Credits for this function: Konijima
BravensUtilsO1.DelayFunction = function(func, delay)

    delay = delay or 1;
    local ticks = 0;
    local canceled = false;

    local function onTick()

        if not canceled and ticks < delay then
            ticks = ticks + 1;
            return;
        end

        Events.OnTick.Remove(onTick);
        if not canceled then func(); end
    end

    Events.OnTick.Add(onTick);
    return function()
        canceled = true;
    end
end

-- Get the distance between two objects
BravensUtilsO1.DistanceBetween = function(firstObj, secondObj)

    local distance = {}

    distance.X = firstObj:getX() - secondObj:getX()
    distance.Y = firstObj:getY() - secondObj:getY()
    distance.Z = firstObj:getZ() - secondObj:getZ()

    return distance
end

BravensUtilsO1.isNumber = function(i)

    if tonumber(i) ~= nil then
        return true
    end

    return false
end