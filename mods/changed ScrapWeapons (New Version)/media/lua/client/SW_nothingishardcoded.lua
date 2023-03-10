local smashammerList = { "SalvagedSledgehammer", "GearMace" }

local function predicateNotBroken(item)
    return not item:isBroken()
end

-- main hook --

local ISDSA_isValid = ISDestroyStuffAction.isValid
function ISDestroyStuffAction:isValid()
    local result = ISDSA_isValid(self)

    local smashammer
    if not result then
        for _,name in ipairs(smashammerList) do
            smashammer = self.character:getInventory():getBestCondition(name)
            if smashammer and not smashammer:isBroken() then
                print("SMASH!!!")
                break
            end
        end
    end

    if not smashammer then
        print("OMG NO SMASH!!!")
    end

    return self.item:getObjectIndex() ~= -1;
end

-- 

function smashammerActivated(player, smashammer)
    local smash = ISDestroyCursor:new(player, false, smashammer)
    getCell():setDrag(smash, smash.player)
end

function smashammerMenu(playerIdx, context, worldObjects, test)
    print("Smash?")
    if not isClient() or getServerOptions():getBoolean("AllowDestructionBySledgehammer") then
        local player = getSpecificPlayer(playerIdx)
        local smashammer
        for _,name in ipairs(smashammerList) do
            print("Smash with .. " .. name .. "?")
            smashammer = player:getInventory():getFirstTypeEvalRecurse(name, predicateNotBroken)
            if smashammer and not smashammer:isBroken() then
                print("Smash! :>")
                break
            end
            smashammer = nil
        end
        
        if not smashammer then
            print("No smash :<")
            return
        end

        context:addOption("Smash!", player, smashammerActivated, smashammer)
    end
end

Events.OnPreFillWorldObjectContextMenu.Add(smashammerMenu)