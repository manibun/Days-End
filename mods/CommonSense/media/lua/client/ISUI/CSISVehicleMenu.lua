--***********************************************************
--**                       BitBraven                       **
--***********************************************************

local OnShowRadialMenuOutside = ISVehicleMenu.showRadialMenuOutside

ISVehicleMenu.showRadialMenuOutside = function(playerObj)

	if playerObj:getVehicle() then return end

	OnShowRadialMenuOutside(playerObj)

	local vehicle = playerObj:getNearVehicle() if not vehicle then return end

	local playerIndex = playerObj:getPlayerNum()
	local menu = getPlayerRadialMenu(playerIndex)

    local playerInv = playerObj:getInventory()
    local crowbar = playerInv:getFirstTypeEvalRecurse("Base.Crowbar", CSUtils.predicateNotBroken)
    if not crowbar then return end

    local doorPart = vehicle:getUseablePart(playerObj)

    if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() then

        if not doorPart:getDoor():isLocked() then return end

        local isHood = doorPart:getId() == "EngineDoor"

        if not (isHood) then
            menu:addSlice(getText("ContextMenu_Pry_open"), getTexture("media/ui/Traits/trait_burglar.png"), CSUtils.PryVehicleDoorOpen, vehicle, doorPart, playerIndex, playerObj, crowbar)
        end

    end

end