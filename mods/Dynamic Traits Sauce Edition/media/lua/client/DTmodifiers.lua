function DTincreaseStress(player, stress)
    local currentStress = player:getStats():getStress();
    player:getStats():setStress(math.min(currentStress + stress, 1));
end

function DTdecreaseStress(player, stress)
    local currentStress = player:getStats():getStress();
    player:getStats():setStress(math.max(currentStress - stress, 0));
end

function DTdecreaseStressFromCigarettes(player, stress)
    local currentStressByCigarettes = player:getStats():getStressFromCigarettes();
    player:getStats():setStressFromCigarettes(math.max(currentStressByCigarettes - stress,0));
end

function DTincreaseUnhappyness(player, unhappyness)
    local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
    player:getBodyDamage():setUnhappynessLevel(math.min(currentUnhappyness + unhappyness, 100));
end

function DTdecreaseUnhappyness(player, unhappyness)
    local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
    player:getBodyDamage():setUnhappynessLevel(math.max(currentUnhappyness - unhappyness, 0));
end

function DTapplyPain(player, chance, bodyPart, pain)
    if chance == 0 then
        local bodyPartAux = BodyPartType.FromString(bodyPart);
        local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPartAux);
        local currentPain = playerBodyPart:getPain();
        playerBodyPart:setAdditionalPain(math.min(currentPain + pain, 100));
    end
end