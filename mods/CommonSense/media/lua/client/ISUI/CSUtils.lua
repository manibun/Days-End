--***********************************************************
--**                       BitBraven                       **
--***********************************************************

CSUtils = {}

CSUtils.predicateNotBroken = function(item)
	return not item:isBroken()
end

-- This function is the most shameful, spaghetti code I've ever written. And I blame TIS and LUA equally for this
CSUtils.Loop = function(worldobjects, playerObj, priableObject, actionType)

    if not playerObj:hasEquipped("Base.Crowbar") then

        BravensUtilsO1.DelayFunction(function()

            if not playerObj:hasEquipped("Base.Crowbar") then
                CSUtils.Loop(worldobjects, playerObj, priableObject, actionType)
            else
                if(actionType == "PryDoor") then
                    luautils.walkAdjWindowOrDoor(playerObj, priableObject:getSquare(), priableObject)
                    ISTimedActionQueue.add(CSISTimedAction:PryDoor(worldobjects, priableObject, playerObj, 190))
                elseif(actionType == "PryVehicleDoor") then
                    ISTimedActionQueue.add(CSISTimedAction:PryVehicleDoor(worldobjects, priableObject, playerObj, 190))
                end
            end
        end, 10);
    end
end

CSUtils.PryDoorOpen = function(worldobjects, priableObject, player, playerObj, crowbar)

    ISInventoryPaneContextMenu.transferIfNeeded(playerObj, crowbar)

    if not playerObj:hasEquipped("Base.Crowbar") then
        ISInventoryPaneContextMenu.equipWeapon(crowbar, true, true, player)
    end

    if not playerObj:hasEquipped("Base.Crowbar") then
        CSUtils.Loop(worldobjects, playerObj, priableObject, "PryDoor")
    else
        luautils.walkAdjWindowOrDoor(playerObj, priableObject:getSquare(), priableObject)
        ISTimedActionQueue.add(CSISTimedAction:PryDoor(worldobjects, priableObject, playerObj, 190))
    end
end

CSUtils.PryVehicleDoorOpen = function(vehicle, doorPart, player, playerObj, crowbar)

    ISInventoryPaneContextMenu.transferIfNeeded(playerObj, crowbar)

    if not playerObj:hasEquipped("Base.Crowbar") then
        ISInventoryPaneContextMenu.equipWeapon(crowbar, true, true, player)
    end

    if not playerObj:hasEquipped("Base.Crowbar") then
        CSUtils.Loop(nil, playerObj, doorPart, "PryVehicleDoor")
    else
        ISTimedActionQueue.add(CSISTimedAction:PryVehicleDoor(vehicle, doorPart, playerObj, 190))
    end
end

CSUtils.PrySuccessfully = function(playerObj, failBoost)

    if playerObj:HasTrait("Burglar") then

        if ZombRand(10) > 1 then
            return true
        else
            return false
        end
    end

    local strengthLevel = playerObj:getPerkLevel(Perks.Strength)
    local failChance = (15 / strengthLevel) + failBoost

    if ZombRand(10) > failChance then
        return true
    else
        return false
    end
end