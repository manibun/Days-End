function GlassBeer_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "SFBeer" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getBaseHunger() / 2);
            result:setBoredomChange(item:getBoredomChange() / 2)
            result:setUnhappyChange(item:getUnhappyChange() / 2)
            result:setCalories(item:getCalories() / 2)
            result:setCarbohydrates(item:getCarbohydrates() / 2)
            result:setLipids(item:getLipids() / 2)
            result:setProteins(item:getProteins() / 2)
            result:setName(getText("ContextMenu_Glass_of_Beer"))
        end
    end
end

function GlassWine_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Wine" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getBaseHunger() / 2);
            result:setBoredomChange(item:getBoredomChange() / 2)
            result:setUnhappyChange(item:getUnhappyChange() / 2)
            result:setCalories(item:getCalories() / 2)
            result:setCarbohydrates(item:getCarbohydrates() / 2)
            result:setLipids(item:getLipids() / 2)
            result:setProteins(item:getProteins() / 2)
            result:setName(getText("ContextMenu_Glass_of_Wine"))
        end
    end
end

function GlassWine2_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "Wine2" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getBaseHunger() / 2);
            result:setBoredomChange(item:getBoredomChange() / 2)
            result:setUnhappyChange(item:getUnhappyChange() / 2)
            result:setCalories(item:getCalories() / 2)
            result:setCarbohydrates(item:getCarbohydrates() / 2)
            result:setLipids(item:getLipids() / 2)
            result:setProteins(item:getProteins() / 2)
            result:setName(getText("ContextMenu_Glass_of_Wine2"))
        end
    end
end

function GlassWhiskey_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "WhiskeyFull" then
            result:setBaseHunger(item:getBaseHunger() / 2);
            result:setHungChange(item:getBaseHunger() / 2);
            result:setBoredomChange(item:getBoredomChange() / 2)
            result:setUnhappyChange(item:getUnhappyChange() / 2)
            result:setCalories(item:getCalories() / 2)
            result:setCarbohydrates(item:getCarbohydrates() / 2)
            result:setLipids(item:getLipids() / 2)
            result:setProteins(item:getProteins() / 2)
            result:setName(getText("ContextMenu_Glass_of_Whiskey"))
        end
    end
end

function MakeBowlOfBeans4_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "SFWaterPotBeans" then
            result:setBaseHunger(items:get(i):getBaseHunger() / 4);
            result:setHungChange(items:get(i):getBaseHunger() / 4);
            result:setThirstChange(items:get(i):getThirstChange() / 4);
            result:setBoredomChange(items:get(i):getBoredomChange() / 4);
            result:setUnhappyChange(items:get(i):getUnhappyChange() / 4);
            result:setCarbohydrates(items:get(i):getCarbohydrates() / 4);
            result:setLipids(items:get(i):getLipids() / 4);
            result:setProteins(items:get(i):getProteins() / 4);
            result:setCalories(items:get(i):getCalories() / 4);
            result:setTaintedWater(items:get(i):isTaintedWater())
        end
    end
    player:getInventory():AddItem("Base.Pot");
end

function MakeBowlOfBeans2_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "SFWaterPotBeans" then
            result:setBaseHunger(items:get(i):getBaseHunger() / 2);
            result:setHungChange(items:get(i):getBaseHunger() / 2);
            result:setThirstChange(items:get(i):getThirstChange() / 2);
            result:setBoredomChange(items:get(i):getBoredomChange() / 2);
            result:setUnhappyChange(items:get(i):getUnhappyChange() / 2);
            result:setCarbohydrates(items:get(i):getCarbohydrates() / 2);
            result:setLipids(items:get(i):getLipids() / 2);
            result:setProteins(items:get(i):getProteins() / 2);
            result:setCalories(items:get(i):getCalories() / 2);
            result:setTaintedWater(items:get(i):isTaintedWater())
        end
    end
    player:getInventory():AddItem("Base.Pot");
end

function RemoveCupcakes_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "filcher.SFCupcakes" then
        return sourceItem:isCooked()
    end
    return true
end

function RemoveCupcakes_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "SFCupcakes" then
            result:setBaseHunger(item:getBaseHunger() / 6);
            result:setHungChange(item:getBaseHunger() / 6);
            result:setBoredomChange(item:getBoredomChange() / 6)
            result:setUnhappyChange(item:getUnhappyChange() / 6)
            result:setCalories(item:getCalories() / 6)
            result:setCarbohydrates(item:getCarbohydrates() / 6)
            result:setLipids(item:getLipids() / 6)
            result:setProteins(item:getProteins() / 6)
        end
    end
    player:getInventory():AddItem("filcher.SFCupcakeTray");
end

function ReturnEmptyJar(items, result, player)
    player:getInventory():AddItem("Base.EmptyJar");
end

function SlicePizza_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "filcher.SFPizzaRaw" then
        return sourceItem:isCooked()
    end
    return true
end

function SlicePizza_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "SFPizzaRaw" then
            result:setBaseHunger(item:getBaseHunger() / 6);
            result:setHungChange(item:getBaseHunger() / 6);
            result:setBoredomChange(item:getBoredomChange() / 6)
            result:setUnhappyChange(item:getUnhappyChange() / 6)
            result:setCalories(item:getCalories() / 6)
            result:setCarbohydrates(item:getCarbohydrates() / 6)
            result:setLipids(item:getLipids() / 6)
            result:setProteins(item:getProteins() / 6)
        end
    end
    player:getInventory():AddItem("Base.BakingPan");
end

function SlicePumpkinPie_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "PumpkinPieWholeRaw" then
            result:setBaseHunger(item:getBaseHunger() / 5);
            result:setHungChange(item:getBaseHunger() / 5);
            result:setBoredomChange(item:getBoredomChange() / 5)
            result:setUnhappyChange(item:getUnhappyChange() / 5)
            result:setCalories(item:getCalories() / 5)
            result:setCarbohydrates(item:getCarbohydrates() / 5)
            result:setLipids(item:getLipids() / 5)
            result:setProteins(item:getProteins() / 5)
        end
    end
    player:getInventory():AddItem("Base.BakingPan");
end

function TakeFries_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "filcher.SaucepanFries" then
        return sourceItem:isCooked()
    end
    return true
end

function Recipe.OnCreate.TakeFries(items, result, player)
    result:setAge(items:get(0):getAge());
    result:setBaseHunger(items:get(0):getBaseHunger());
    result:setHungChange(items:get(0):getBaseHunger());
    result:setBoredomChange(items:get(0):getBoredomChange());
    result:setUnhappyChange(items:get(0):getUnhappyChange());
    result:setCalories(items:get(0):getCalories());
    result:setCarbohydrates(items:get(0):getCarbohydrates());
    result:setLipids(items:get(0):getLipids());
    result:setProteins(items:get(0):getProteins());

    player:getInventory():AddItem("Base.Saucepan");
end

function Recipe.OnCreate.SetAgeZero(items, result, player)
    result:setAge(0);
end

function Recipe.GetItemTypes.Beans(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Beans"))
	--addExistingItemType(scriptItems, "OpenBeans")
	--addExistingItemType(scriptItems, "Blackbeans")
	--addExistingItemType(scriptItems, "DriedBlackBeans")
	--addExistingItemType(scriptItems, "DriedKidneyBeans")
end

function Recipe.GetItemTypes.Pasta(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Pasta"))
	--addExistingItemType(scriptItems, "Macaroni")
end
