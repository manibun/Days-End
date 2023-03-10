-- DarkSlayerEX's Item Tweaker Core: an API for tweaking existing items without redefining them entirely.
--Initializes the tables needed for the code to run
if not ItemTweaker then  ItemTweaker = {} end
if not TweakItem then  TweakItem = {} end
if not TweakItemData then  TweakItemData = {} end
if not ItemTweaker.ItemTweaker_applied then ItemTweaker.ItemTweaker_applied = false end

function ItemTweaker.callIfCallable(f)
    return function(...)
        error, result = pcall(f, ...)
        if error then -- f exists and is callable
            print('ok')
            return result
        end
        -- nothing to do, as though not called, or print('error', result)
    end
end

function ItemTweaker.printJavaArray(javaArray)
    for index=0, javaArray:size()-1 do
        print(index, javaArray:get(index))
    end
end

function ItemTweaker.convertArrayToString(array,sep)
    --ItemTweaker.printJavaArray(array);
    --return table.concat(array,sep);
    
    local arraySize = array:size();
    local result = "";
    if arraySize > 0 then
        result = tostring(array:get(0));
    end
    
    for index=1, arraySize-1 do
        --print("ItemTweaker.convertArrayToString[".. index.. "] " .. result .. " + " .. sep);
        result = result .. sep .. tostring(array:get(index));
    end
    return result;
end

local categoriesofitemwithoutcategories = nil;
function getEmptyJavaArrayString()
    if categoriesofitemwithoutcategories == nil then
        categoriesofitemwithoutcategories = ScriptManager.instance:getItem("ItemTweaker.ItemTweakerDefaultItem"):getCategories();--use an object unlikely to become a weapon soon
    end
    return categoriesofitemwithoutcategories;
end

--Prep code to make the changes to all item in the TweakItemData table.
function ItemTweaker.tweakItems()
    if ItemTweaker.OPTIONS.Verbose then print("ItemTweaker.tweakItems") end
    for itemName,propertyTable in pairs(TweakItemData) do 
        for property,value in pairs(propertyTable) do 
            local item = ScriptManager.instance:getItem(itemName);
            if item ~= nil then
                if (property=="categories") then
                    item:setCategories(getEmptyJavaArrayString());--DoParam does not clear categories array before adding so we need to call setCategories with empty array first
                end
                item:DoParam(property.." = "..value); -- do it
            end
        end
    end
end

function TweakItem(itemName, itemProperty, propertyValue)
    local itemPropertyLower = string.lower(itemProperty);
    if not TweakItemData[itemName] then
        TweakItemData[itemName] = {};
    end
    TweakItemData[itemName][itemPropertyLower] = propertyValue;
end

Events.OnGameBoot.Add(ItemTweaker.tweakItems)
Events.OnLoad.Add(ItemTweaker.tweakItems)
--[[
-------------------------------------------------
--------------------IMPORTANT--------------------
-------------------------------------------------
You should be able to modify any aspect of an item such as: DisplayName, DisplayCategory, Weight, Icon, StressReduction, HungerChange
        HOWEVER
DO NOT MODIFY AN ITEM'S TYPE UNLESS YOU WANT PLAYERS TO START A NEW WORLD. ITEMS WITH THEIR TYPES CHANGED ARE DELETED.
If you have a workaround for this in place however, then it should be okay.

You can make compatibility patches, allowing tweaks to only be applied under the proper circumstances.
Examples:


        TweakItemData["MyMod.MyItem"] = { ["DisplayCategory"] = "Weapon" };
        
        if getActivatedMods():contains("CustomCategories") then 
            TweakItemData["MyMod.MyItem"] = { ["DisplayCategory"] = "BluntWeapon" };
        end
        
and
        
        TweakItemData["MyMod.Book"] = { ["Weight"] = "0.8" };
        
        if getActivatedMods():contains("WeightlessBooks") then 
            TweakItemData["MyMod.Book"] = { ["Weight"] = "0" };
        end

]]
