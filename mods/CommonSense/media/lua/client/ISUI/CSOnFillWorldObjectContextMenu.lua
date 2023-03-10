--***********************************************************
--**                       BitBraven                       **
--***********************************************************

OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)

    if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end

    if test then return ISWorldObjectContextMenu.setTest() end
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    local crowbar = playerInv:getFirstTypeEvalRecurse("Base.Crowbar", CSUtils.predicateNotBroken)

    if playerObj:getVehicle() then return end
    if not crowbar then return end

    local priableObject = nil

    for i,v in ipairs(worldobjects) do

        if ISWorldObjectContextMenu.isThumpDoor(v) == true then
            priableObject = v
        end
    end

    -- door interaction
	if priableObject ~= nil then

        -- Prevent prying open reinforced doors.
        -- Code snipped by "UnCheat", I've been too busy to add this myself.
        local spriteName = priableObject:getSprite():getName()

        if spriteName and
        spriteName == "fixtures_doors_01_32" or
        spriteName == "fixtures_doors_01_33" or
        spriteName == "location_community_police_01_4" or
        spriteName == "location_community_police_01_5" then
        return
        end
        -- End of credit

		local text = getText("ContextMenu_Pry_open");

		if not (priableObject:isLocked() == false or priableObject:isBarricaded()) then
            if instanceof(priableObject, "IsoDoor") then
                context:addOptionOnTop(text, worldobjects, CSUtils.PryDoorOpen, priableObject, player, playerObj, crowbar);
            end
		end
	end

end

Events.OnFillWorldObjectContextMenu.Add(OnFillWorldObjectContextMenu);