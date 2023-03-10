CSServer = {}

CSServer.PryDoorOpen = function(priableObject, playerObj)

    priableObject:setLockedByKey(false)
    --playerObj:getMapKnowledge():setKnownBlockedDoor(self.priableObject, self.door:isLocked())

    local doubleDoorObjects = buildUtil.getDoubleDoorObjects(priableObject)

    for i=1,#doubleDoorObjects do
        local object = doubleDoorObjects[i]
        object:setLockedByKey(false)
    end

    local garageDoorObjects = buildUtil.getGarageDoorObjects(priableObject)

    for i=1,#garageDoorObjects do
        local object = garageDoorObjects[i]
        object:setLockedByKey(false)
    end

    ISTimedActionQueue.add(ISOpenCloseDoor:new(playerObj, priableObject, 0));
    BravensUtilsO1.TryPlaySoundClip(playerObj, "BreakBarricadePlank") 
end

local function onClientCommand(module, command, playerObj, args)

    if module ~= "Braven" then return end
end

Events.OnClientCommand.Add(onClientCommand);