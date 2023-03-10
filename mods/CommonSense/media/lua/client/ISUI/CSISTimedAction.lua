--***********************************************************
--**                       BitBraven                       **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

CSISTimedAction = ISBaseTimedAction:derive("CSISTimedAction")

CSISTimedAction.isValid = function(self)
    return true
end

CSISTimedAction.update = function(self)

end

CSISTimedAction.start = function(self)

    if self.typeTimeAction == "pryDoor" then

        self:setActionAnim("RemoveBarricade")
        self:setAnimVariable("RemoveBarricade", "CrowbarMid")

        BravensUtilsO1.TryPlaySoundClip(self.character, "BeginRemoveBarricadePlank")
    end

    if self.typeTimeAction == "pryVehicleDoor" then

        self:setActionAnim("RemoveBarricade")
        self:setAnimVariable("RemoveBarricade", "CrowbarMid")

        BravensUtilsO1.DelayFunction(function()
            BravensUtilsO1.TryPlaySoundClip(self.character, "PrisonMetalDoorBlocked")
        end, 35);  
    end
end

CSISTimedAction.stop = function(self)
    ISBaseTimedAction.stop(self)

    if self.typeTimeAction == "pryDoor" then
        BravensUtilsO1.TryStopSoundClip(self.character, "BeginRemoveBarricadePlank")
    end

    if self.typeTimeAction == "pryVehicleDoor" then
        BravensUtilsO1.TryStopSoundClip(self.character, "PrisonMetalDoorBlocked")
    end
end

CSISTimedAction.perform = function(self)

    if self.typeTimeAction == "pryDoor" then

        BravensUtilsO1.TirePlayer(self.character, 0.15)
        BravensUtilsO1.TryStopSoundClip(self.character, "BeginRemoveBarricadePlank")

        if CSUtils.PrySuccessfully(self.character, 0) == true then
            CSServer.PryDoorOpen(self.priableObject, self.character);
        else
            self.character:Say(getText("IGUI_Pry_fail"));
            BravensUtilsO1.TryPlaySoundClip(self.character, "BreakLockOnWindow")
        end
    end

    if self.typeTimeAction == "pryVehicleDoor" then

        BravensUtilsO1.TirePlayer(self.character, 0.2)
        BravensUtilsO1.TryStopSoundClip(self.character, "PrisonMetalDoorBlocked")

        if CSUtils.PrySuccessfully(self.character, 1) == true then

            local args = { vehicle = self.vehicle:getId(), part = self.priableObject:getId(), locked = false, open = true }
            sendClientCommand(self.character, 'vehicle', 'setDoorLocked', args)
	        sendClientCommand(self.character, 'vehicle', 'setDoorOpen', args)

            local isTrunk = self.priableObject:getId() == "TrunkDoor" or self.priableObject:getId() == "DoorRear"
            if not (isTrunk) then
                BravensUtilsO1.TryPlaySoundClip(self.character, "VehicleDoorOpen")
            else
                BravensUtilsO1.TryPlaySoundClip(self.character, "VehicleTrunkOpen")
            end
        else
            self.character:Say(getText("IGUI_Pry_fail"));
            BravensUtilsO1.TryPlaySoundClip(self.character, "BreakLockOnWindow")
        end
    end

    ISBaseTimedAction.perform(self)
end

CSISTimedAction.PryDoor = function(self, worldobjects, priableObject, character, time)
    
    local action = ISBaseTimedAction.new(self, character);
    action.typeTimeAction = "pryDoor"
    action.priableObject = priableObject
    action.character = character
    action.stopOnWalk = true
    action.stopOnRun = true
    action.maxTime = time
    action.fromHotbar = false

    if action.character:isTimedActionInstant() then o.maxTime = 1; end
    return action
end

CSISTimedAction.PryVehicleDoor = function(self, vehicle, priableObject, character, time)
    
    local action = ISBaseTimedAction.new(self, character);
    action.typeTimeAction = "pryVehicleDoor"
    action.vehicle = vehicle
    action.priableObject = priableObject
    action.character = character
    action.stopOnWalk = true
    action.stopOnRun = true
    action.maxTime = time
    action.fromHotbar = false

    if action.character:isTimedActionInstant() then o.maxTime = 1; end
    return action
end

return TimeAction