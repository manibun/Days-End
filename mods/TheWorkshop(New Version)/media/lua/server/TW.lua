require "recipecode"


function Recipe.GetItemTypes.MetalArmor(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("MetalArmor"))
	scriptItems:addAll(getScriptManager():getItemsTag("Metal Armor"))
    scriptItems:addAll(getScriptManager():getItemsTag("ArmorMetal"))
end

function Recipe.GetItemTypes.GunMagazine(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("GunMagazine"))
	scriptItems:addAll(getScriptManager():getItemsTag("GunMag"))
    scriptItems:addAll(getScriptManager():getItemsTag("AmmoClip"))
end

function Recipe.GetItemTypes.Gun(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Gun"))
    scriptItems:addAll(getScriptManager():getItemsTag("Firearm"))
end

function Recipe.GetItemTypes.File(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Files"))
    scriptItems:addAll(getScriptManager():getItemsTag("File"))
end

function Recipe.GetItemTypes.Pliers(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Pliers"))
    scriptItems:addAll(getScriptManager():getItemsTag("Plier"))
end

function Recipe.GetItemTypes.Drill(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("Drill"))
    scriptItems:addAll(getScriptManager():getItemsTag("CordlessDrill"))
end

function Recipe.GetItemTypes.WeldingMask(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("WeldingMask"))
    scriptItems:addAll(getScriptManager():getItemsTag("Welding Mask"))
	scriptItems:addAll(getScriptManager():getItemsTag("WelderMask"))
    scriptItems:addAll(getScriptManager():getItemsTag("Welder Mask"))
end

function Recipe.GetItemTypes.MetalCutter(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("MetalCutter"))
    scriptItems:addAll(getScriptManager():getItemsTag("Metal Cutter"))
	scriptItems:addAll(getScriptManager():getItemsTag("BoltCutter"))
    scriptItems:addAll(getScriptManager():getItemsTag("Bolt Cutter"))
end


TheWorkshop = {}
TheWorkshop.AcceptItemFunctionToolbelt = function(inventoryContainer, inventoryItem)
local scriptItem = inventoryItem:getScriptItem()

    local name = scriptItem:getDisplayName()
    if name == "Nails" or name == "Screws" or name == "Lug Wrench" then
        return true
    end

    local category = scriptItem:getDisplayCategory()
    if category == "Tool" or category == "ToolWeapon" then
        return true
    end
end






