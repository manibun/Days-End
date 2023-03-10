--***********************************************************
--**                       BitBraven                       **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISLMFTimeAction = ISBaseTimedAction:derive("ISLMFTimeAction")

ISLMFTimeAction.isValid = function(self)
    return true
end

ISLMFTimeAction.update = function(self)

end

ISLMFTimeAction.start = function(self)

    self:setActionAnim("Loot")
    self:setAnimVariable("LootPosition", "Mid")

    if self.typeTimeAction == "usePC" then
        BravensUtils.TryPlaySoundClip(self.character, "LMF_UsePC")
    end
end

ISLMFTimeAction.stop = function(self)
    ISBaseTimedAction.stop(self)

    if self.typeTimeAction == "usePC" then
        BravensUtils.TryStopSoundClip(self.character, "LMF_UsePC")
    end
end

ISLMFTimeAction.perform = function(self)

    if self.typeTimeAction == "usePC" then
        LMFServer.StartFestival(self.character, self.square, self.musicName)
        BravensUtils.TryStopSoundClip(self.character, "LMF_UsePC")
    end

    ISBaseTimedAction.perform(self)
end

ISLMFTimeAction.UsePC = function(self, character, square, musicName, time)

    local action = ISBaseTimedAction.new(self, character)
    action.typeTimeAction = "usePC"
    action.square = square
    action.musicName = musicName
    action.stopOnWalk = true
    action.stopOnRun = true
    action.maxTime = time
    action.fromHotbar = false

    if action.character:isTimedActionInstant() then o.maxTime = 1; end
    return action
end

return ISLMFTimeAction