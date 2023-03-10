require "recipecode"


-------------------------------------------------------------------------------------------------
-- refilling blowtorch on large propane
-------------------------------------------------------------------------------------------------
function Recipe.OnTest.RefillBlowTorchLarge(item)
    if item:getType() == "BlowTorch" then
        if item:getUsedDelta() == 1 then return false; end
    elseif item:getType() == "LargePropaneTank" then
        if item:getUsedDelta() == 0 then return false; end
    end
    return true;
end

-- Fill entirely the blowtorch with the remaining propane
function Recipe.OnCreate.RefillBlowTorchLarge(items, result, player)
    local previousBT = nil;
    local propaneTank = nil;
    for i=0, items:size()-1 do
       if items:get(i):getType() == "BlowTorch" then
           previousBT = items:get(i);
       elseif items:get(i):getType() == "LargePropaneTank" then
           propaneTank = items:get(i);
       end
    end
    result:setUsedDelta(previousBT:getUsedDelta() + result:getUseDelta() * 30);

    while result:getUsedDelta() < 1 and propaneTank:getUsedDelta() > 0 do
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta() * 30);
        propaneTank:Use();
    end

    if result:getUsedDelta() > 1 then
        result:setUsedDelta(1);
    end
end
-------------------------------------------------------------------------------------------------
-- refilling blowtorch on Huge propane
-------------------------------------------------------------------------------------------------
function Recipe.OnTest.RefillBlowTorchHuge(item)
    if item:getType() == "BlowTorch" then
        if item:getUsedDelta() == 1 then return false; end
    elseif item:getType() == "HugePropaneTank" then
        if item:getUsedDelta() == 0 then return false; end
    end
    return true;
end

-- Fill entirely the blowtorch with the remaining propane
function Recipe.OnCreate.RefillBlowTorchHuge(items, result, player)
    local previousBT = nil;
    local propaneTank = nil;
    for i=0, items:size()-1 do
       if items:get(i):getType() == "BlowTorch" then
           previousBT = items:get(i);
       elseif items:get(i):getType() == "HugePropaneTank" then
           propaneTank = items:get(i);
       end
    end
    result:setUsedDelta(previousBT:getUsedDelta() + result:getUseDelta() * 30);

    while result:getUsedDelta() < 1 and propaneTank:getUsedDelta() > 0 do
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta() * 30);
        propaneTank:Use();
    end

    if result:getUsedDelta() > 1 then
        result:setUsedDelta(1);
    end
end
-------------------------------------------------------------------------------------------------
-- Refilling Large Propane on Huge propane
-------------------------------------------------------------------------------------------------
function Recipe.OnTest.RefillLargePropaneTank(item)
    if item:getType() == "LargePropaneTank" then
        if item:getUsedDelta() == 1 then return false; end
    elseif item:getType() == "HugePropaneTank" then
        if item:getUsedDelta() == 0 then return false; end
    end
    return true;
end

-- Fill entirely the blowtorch with the remaining propane
function Recipe.OnCreate.RefillLargePropaneTank(items, result, player)
    local previousBT = nil;
    local propaneTank = nil;
    for i=0, items:size()-1 do
       if items:get(i):getType() == "LargePropaneTank" then
           previousBT = items:get(i);
       elseif items:get(i):getType() == "HugePropaneTank" then
           propaneTank = items:get(i);
       end
    end
    result:setUsedDelta(previousBT:getUsedDelta() + result:getUseDelta() * 1);

    while result:getUsedDelta() < 1 and propaneTank:getUsedDelta() > 0 do
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta() * 1);
        propaneTank:Use();
    end

    if result:getUsedDelta() > 1 then
        result:setUsedDelta(1);
    end
end
-------------------------------------------------------------------------------------------------
-- Refilling Propane on Huge propane
-------------------------------------------------------------------------------------------------
function Recipe.OnTest.RefillPropaneTank(item)
    if item:getType() == "PropaneTank" then
        if item:getUsedDelta() == 1 then return false; end
    elseif item:getType() == "HugePropaneTank" then
        if item:getUsedDelta() == 0 then return false; end
    end
    return true;
end

-- Fill entirely the blowtorch with the remaining propane
function Recipe.OnCreate.RefillPropaneTank(items, result, player)
    local previousBT = nil;
    local propaneTank = nil;
    for i=0, items:size()-1 do
       if items:get(i):getType() == "PropaneTank" then
           previousBT = items:get(i);
       elseif items:get(i):getType() == "HugePropaneTank" then
           propaneTank = items:get(i);
       end
    end
    result:setUsedDelta(previousBT:getUsedDelta() + result:getUseDelta() * 1);

    while result:getUsedDelta() < 1 and propaneTank:getUsedDelta() > 0 do
        result:setUsedDelta(result:getUsedDelta() + result:getUseDelta() * 1);
        propaneTank:Use();
    end

    if result:getUsedDelta() > 1 then
        result:setUsedDelta(1);
    end
end