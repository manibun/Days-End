require('NPCs/MainCreationMethods');

--Global Variables
internalTick = 0;
--BodyDamagedFromTrait = {};

function initToadTraitsPerks(_player)
    local player = _player;
    local playerdata = player:getModData();
    local damage = 20;
    local bandagestrength = 5;
    local splintstrength = 0.9;
    local fracturetime = 50;
    playerdata.bToadTraitDepressed = false;
    playerdata.fPreviousHealthFromFoodTimer = 1000;
    playerdata.iParanoiaCooldown = 10;

    if player:HasTrait("Lucky") then
        damage = damage - 5;
        bandagestrength = bandagestrength + 2;
        fracturetime = fracturetime - 5;
        splintstrength = splintstrength + 0.1;
    end
    if player:HasTrait("Unlucky") then
        damage = damage + 5;
        bandagestrength = bandagestrength - 2;
        fracturetime = fracturetime + 5;
        splintstrength = splintstrength - 0.1;
    end

    if player:HasTrait("injured") then
        suspendevasive = true;
        local bodydamage = player:getBodyDamage();
        local itterations = ZombRand(1, 4) + 1;
        local doburns = true;
        for i = 0, itterations do
            local randompart = ZombRand(0, 16);
            local b = bodydamage:getBodyPart(BodyPartType.FromIndex(randompart));
            local injury = ZombRand(0, 5);
            local skip = false;
            if b:HasInjury() then
                itterations = itterations - 1;
                skip = true;
            end
            if skip == false then
                if injury <= 1 then
                    b:AddDamage(damage);
                    b:setScratched(true, true);
                    b:setBandaged(true, bandagestrength, true, "Base.Bandage");
                    --table.insert(BodyDamagedFromTrait, b);
                elseif injury == 2 then
                    if doburns == true then
                        b:AddDamage(damage);
                        b:setBurned();
                        b:setBurnTime(ZombRand(50) + damage);
                        b:setNeedBurnWash(false);
                        b:setBandaged(true, bandagestrength, true, "Base.Bandage");
                        --table.insert(BodyDamagedFromTrait, b);
                    else
                        itterations = itterations - 1;
                    end
                elseif injury == 3 then
                    b:AddDamage(damage);
                    b:setCut(true, true);
                    b:setBandaged(true, bandagestrength, true, "Base.Bandage");
                    --table.insert(BodyDamagedFromTrait, b);
                elseif injury >= 4 then
                    b:AddDamage(damage);
                    b:setDeepWounded(true);
                    b:setStitched(true);
                    b:setBandaged(true, bandagestrength, true, "Base.Bandage");
                    --table.insert(BodyDamagedFromTrait, b);
                end
            end
        end
        bodydamage:setInfected(false);
        bodydamage:setInfectionLevel(0);
    end
    if player:HasTrait("broke") then
        suspendevasive = true;
        local bodydamage = player:getBodyDamage();
        bodydamage:getBodyPart(BodyPartType.LowerLeg_R):AddDamage(damage);
        bodydamage:getBodyPart(BodyPartType.LowerLeg_R):setFractureTime(fracturetime);
        bodydamage:getBodyPart(BodyPartType.LowerLeg_R):setSplint(true, splintstrength);
        bodydamage:getBodyPart(BodyPartType.LowerLeg_R):setSplintItem("Base.Splint");
        bodydamage:getBodyPart(BodyPartType.LowerLeg_R):setBandaged(true, bandagestrength, true, "Base.AlcoholBandage");
        bodydamage:setInfected(false);
        bodydamage:setInfectionLevel(0);
        --table.insert(BodyDamagedFromTrait, bodydamage:getBodyPart(BodyPartType.LowerLeg_R));
    end
    if player:HasTrait("burned") then
        local bodydamage = player:getBodyDamage();
        for i = 0, bodydamage:getBodyParts():size() - 1 do
            local b = bodydamage:getBodyParts():get(i);
            b:setBurned();
            b:setBurnTime(ZombRand(10, 100) + damage);
            b:setNeedBurnWash(false);
            b:setBandaged(true, ZombRand(1, 10) + bandagestrength, true, "Base.AlcoholBandage");
            --table.insert(BodyDamagedFromTrait, b); --i forgor to add in the thing for burned, but i think this should work fine
        end
    end
end

function ToadTraitButter(_player)
    local player = _player;
    if player:HasTrait("butterfingers") and player:isPlayerMoving() then
        local basechance = 3;
        local chanceinx = 100;
        if player:HasTrait("AllThumbs") then
            basechance = basechance + 1;
        end
        if player:HasTrait("Dextrous") then
            basechance = basechance - 1;
        end
        if player:HasTrait("Lucky") then
            basechance = basechance - 1;
        end
        if player:HasTrait("Unlucky") then
            basechance = basechance + 1;
        end
        local weight = player:getInventoryWeight();
        local chancemod = 0;
        if weight > 0 then
            chancemod = math.floor(weight / 5);
        end
        if player:isSprinting() == true then
            chancemod = chancemod + 10;
        elseif player:IsRunning() == true then
            chancemod = chancemod + 5;
        end
        local chance = (basechance + chancemod);
        if chance >= ZombRand(chanceinx) then
            if player:getSecondaryHandItem() ~= nil or player:getPrimaryHandItem() ~= nil then
                player:dropHandItems();
                --HaloTextHelper.addTextWithArrow(player, getText("UI_butterfingers_triggered"), false, HaloTextHelper.getColorRed());
            end
        end
    end
end

function ToadTraitParanoia(_player, _playerdata)
    local player = _player;
    local playerdata = _playerdata;
    if player:HasTrait("paranoia") then
        if playerdata.iParanoiaCooldown == nil then
            playerdata.iParanoiaCooldown = 0;
        end
        if playerdata.iParanoiaCooldown <= 0 then
            if player:isPlayerMoving() == true then
                local basechance = 1;
                local randNum = ZombRand(100) + 1;
                local stats = player:getStats();
                local panic = stats:getPanic();
                local stress = stats:getStress();
                randNum = randNum - (randNum * stats:getStress());
                if randNum <= basechance then
                    getSoundManager():PlaySound("ZombieSurprisedPlayer", false, 0):setVolume(0.05);
                    panic = panic + 25;
                    stress = stress + 0.1;
                    stats:setPanic(panic);
                    stats:setStress(stress);
                    playerdata.iParanoiaCooldown = 30;
                    if player:isFemale() then
                        getSoundManager():PlaySound("female_heavybreathpanic", false, 5):setVolume(0.025);
                    else
                        getSoundManager():PlaySound("male_heavybreathpanic", false, 5):setVolume(0.025);
                    end
                end
            end
        else
            playerdata.iParanoiaCooldown = playerdata.iParanoiaCooldown - 1;
        end
    end
end

function ToadTraitDepressive()
    local player = getPlayer();
    if player:HasTrait("depressive") then
        local basechance = 2;
        if player:HasTrait("Lucky") then
            basechance = basechance - 1;
        end
        if player:HasTrait("Unlucky") then
            basechance = basechance + 1;
        end
        if player:HasTrait("selfdestructive") then
            basechance = basechance + 1;
        end
        if ZombRand(100) <= basechance then
            if player:getModData().bToadTraitDepressed == false then
                print("Player is experiencing depression.");
                player:getBodyDamage():setUnhappynessLevel((player:getBodyDamage():getUnhappynessLevel() + 25));
                player:getModData().bToadTraitDepressed = true;
            end
        end
    end
end

function CheckDepress(_player, _playerdata)
    local player = _player;
    local playerdata = _playerdata;
    local depressed = playerdata.bToadTraitDepressed;
    if depressed == nil then
        playerdata.bToadTraitDepressed = false;
    else
        if depressed == true then
            if player:getBodyDamage():getUnhappynessLevel() < 25 then
                playerdata.bToadTraitDepressed = false;
            else
                player:getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.001);
            end
        end
    end
end

function CheckSelfHarm(_player)
    local player = _player;
    local modifier = 2.11;
    if player:HasTrait("depressive") then
        modifier = modifier - 1;
    end
    if player:HasTrait("selfdestructive") then
        if player:getBodyDamage():getUnhappynessLevel() >= 25 then
            if player:getBodyDamage():getOverallBodyHealth() >= (100 - player:getBodyDamage():getUnhappynessLevel() / modifier) then
                for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
                    local b = player:getBodyDamage():getBodyParts():get(i);
                    b:AddDamage(0.005);
                end
            end
        end
    end
end

function Blissful(_player)
    local player = _player;
    local bodydamage = player:getBodyDamage();
    local unhappiness = bodydamage:getUnhappynessLevel();
    local boredom = bodydamage:getBoredomLevel();
    if player:HasTrait("blissful") then
        if unhappiness >= 10 then
            bodydamage:setUnhappynessLevel(unhappiness - 0.01);
        end
        if boredom >= 10 then
            bodydamage:setBoredomLevel(boredom - 0.005);
        end
    end
end

function badteethtrait(_player, _playerdata)
    local player = _player;
    local playerdata = _playerdata;
    local healthtimer = player:getBodyDamage():getHealthFromFoodTimer();
    if player:HasTrait("badteeth") then
        if healthtimer > 1000 then
            if playerdata.fPreviousHealthFromFoodTimer == nil then
                playerdata.fPreviousHealthFromFoodTimer = 1000;
            end
            if healthtimer > playerdata.fPreviousHealthFromFoodTimer then
                local Head = player:getBodyDamage():getBodyPart(BodyPartType.FromString("Head"));
                local pain = (healthtimer - playerdata.fPreviousHealthFromFoodTimer) * 0.01;
                Head:setAdditionalPain(Head:getAdditionalPain() + pain);
                if Head:getAdditionalPain() >= 100 then
                    Head:setAdditionalPain(100);
                end
            end
            playerdata.fPreviousHealthFromFoodTimer = healthtimer;
        end
    end
end

function anemic(_player)
    local player = _player;
    if player:HasTrait("anemic") then
        local bodydamage = player:getBodyDamage();
        local bleeding = bodydamage:getNumPartsBleeding();
        if bleeding > 0 then
            for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
                local b = player:getBodyDamage():getBodyParts():get(i);
                if b:bleeding() and b:IsBleedingStemmed() == false then
                    local adjust = 0.1;
                    --HaloTextHelper.addTextWithArrow(player, getText("UI_trait_anemic"), false, HaloTextHelper.getColorRed());
                    if b:getType() == BodyPartType.Neck then
                        adjust = adjust * 2;
                    end
                    b:ReduceHealth(adjust);
                end
            end
        end

    end
end

function thickblood(_player)
    local player = _player;
    if player:HasTrait("thickblood") then
        local bodydamage = player:getBodyDamage();
        local bleeding = bodydamage:getNumPartsBleeding();
        if bleeding > 0 then
            for i = 0, player:getBodyDamage():getBodyParts():size() - 1 do
                local b = player:getBodyDamage():getBodyParts():get(i);
                if b:bleeding() and b:IsBleedingStemmed() == false then
                    local adjust = 0.005;
                    --HaloTextHelper.addTextWithArrow(player, getText("UI_trait_thickblood"), true, HaloTextHelper.getColorGreen());
                    if b:getType() == BodyPartType.Neck then
                        adjust = adjust * 2;
                    end
                    b:AddHealth(adjust);
                end
            end
        end

    end
end

function SuperImmune(_player, _playerdata)
    local player = _player;
    local playerdata = _playerdata;
    local bodydamage = player:getBodyDamage();
    local chance = 20;
    if player:HasTrait("superimmune") then
        if playerdata.bSuperImmune ~= nil then
            if player:HasTrait("Lucky") then
                chance = chance + 5;
            end
            if player:HasTrait("Unlucky") then
                chance = chance - 5;
            end
            if playerdata.bSuperImmune == true then
                if bodydamage:IsInfected() then
                    if ZombRand(0, 101) <= chance then
                        print("Player's Immune system fought-off zombification.");
                        bodydamage:setInfected(false);
                        bodydamage:setInfectionMortalityDuration(-1);
                        bodydamage:setInfectionTime(-1);
                        bodydamage:setInfectionLevel(0);
                        --HaloTextHelper.addTextWithArrow(player, getText("UI_trait_superimmune"), true, HaloTextHelper.getColorGreen());
                    else
                        print("Immune system failed.");
                        playerdata.bSuperImmune = false;
                    end
                end
            end
        else
            playerdata.bSuperImmune = true;
        end
        if bodydamage:IsInfected() == false and playerdata.bSuperImmune == false then
            playerdata.bSuperImmune = true;
        end
        for i = 0, bodydamage:getBodyParts():size() - 1 do
            local b = bodydamage:getBodyParts():get(i);
            if b:HasInjury() then
                if b:isInfectedWound() then
                    b:SetInfected(false);
                    b:setInfectedWound(false);
                end
            end
        end
    end
end

function Immunocompromised(_player, _playerdata)
    local player = _player;
    local bodydamage = player:getBodyDamage();
    if player:HasTrait("immunocompromised") then
        for i = 0, bodydamage:getBodyParts():size() - 1 do
            local b = bodydamage:getBodyParts():get(i);
            if b:HasInjury() then
                if b:isInfectedWound() and b:getAlcoholLevel() <= 0 then
                    b:setWoundInfectionLevel(b:getWoundInfectionLevel() + 0.005);
                end
            end
        end
    end
end

--[[local function CheckInjuredHeal()
    if #BodyDamagedFromTrait > 0 then
        for i, v in ipairs(BodyDamagedFromTrait) do
            if v:HasInjury() == false then
                table.remove(BodyDamagedFromTrait, i, v);
                i = i - 1;
            end
        end
    end
end]]

function MainPlayerUpdate(_player)
    local player = _player;
    local playerdata = player:getModData();
    SuperImmune(player, playerdata);
    Immunocompromised(player, playerdata);
    anemic(player);
    thickblood(player);
    CheckDepress(player, playerdata);
    CheckSelfHarm(player);
    Blissful(player);
    badteethtrait(player, playerdata);
    internalTick = internalTick + 1;
end

function EveryOneMinute()
    local player = getPlayer();
    local playerdata = player:getModData();
    ToadTraitParanoia(player, playerdata);
    ToadTraitButter(player);
end

--Events.EveryHours.Add(CheckInjuredHeal);
Events.OnPlayerUpdate.Add(MainPlayerUpdate);
Events.EveryOneMinute.Add(EveryOneMinute);
Events.EveryHours.Add(ToadTraitDepressive);
Events.OnNewGame.Add(initToadTraitsPerks);
Events.OnNewGame.Add(initToadTraitsItems);