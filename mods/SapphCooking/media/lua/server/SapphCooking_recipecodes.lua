function NoXP_OnGiveXP(recipe, ingredients, result, player)
end

--This is my first mod, so i really don't know what im doing.
--Goodluck.

--Recipes that add on the inventory. 
function recipe_PeelPotato(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.PotatoPeel");
	end 

function recipe_SaucepanBowl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Saucepan");
	end

function recipe_FryingpanBowl(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Pan");
	end

function recipe_FryingpanBowl2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Pan");
	inv:AddItem("Base.Bowl");
	end

function recipe_MREopen1(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.SaltPacket");
	inv:AddItem("SapphCooking.SugarPacket");
	inv:AddItem("SapphCooking.Drinkmix_Lemon");
	inv:AddItem("SapphCooking.PlasticSpork");
	inv:AddItem("SapphCooking.HotsaucePacket");
	inv:AddItem("SapphCooking.MRE_FlamelessRationHeater");
	inv:AddItem("Base.Teabag");
	inv:AddItem("Base.Matches");
	inv:AddItem("Base.Crackers");
	inv:AddItem("Base.Gum");
	end

function recipe_MREopen2(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("SapphCooking.SaltPacket");
	inv:AddItem("SapphCooking.SugarPacket");
	inv:AddItem("SapphCooking.Drinkmix_Orange");
	inv:AddItem("SapphCooking.HotsaucePacket");
	inv:AddItem("SapphCooking.PlasticSpork");
	inv:AddItem("SapphCooking.CoffeePacket");
	inv:AddItem("SapphCooking.MRE_FlamelessRationHeater");
	inv:AddItem("Base.Matches");
	inv:AddItem("Base.GrahamCrackers");
	inv:AddItem("Base.Gum");
	end

function recipe_EmptyBottle(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.WaterBottleEmpty");
	end


function recipe_BowlStack(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Bowl");
	end 

	--Tag Recipes
function Recipe.GetItemTypes.SapphCookingRice(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingRice"));
	scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingRiceBowl"));
	scriptItems:addAll(getScriptManager():getItemsTag("Rice"));
	end


	function Recipe.GetItemTypes.SapphCookingRiceBowl(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingRiceBowl"));
	scriptItems:addAll(getScriptManager():getItemsTag("RiceBowl"));
	end

function Recipe.GetItemTypes.SapphCookingEgg(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingEgg"));
	scriptItems:addAll(getScriptManager():getItemsTag("Egg"));
	end

function Recipe.GetItemTypes.SapphCookingCheese(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingCheese"));
	scriptItems:addAll(getScriptManager():getItemsTag("Cheese"));
	scriptItems:addAll(getScriptManager():getItemsTag("Cheeses"));
	end

	function Recipe.GetItemTypes.SapphCookingMilk(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingMilk"));
	scriptItems:addAll(getScriptManager():getItemsTag("Milk"));
	end

	function Recipe.GetItemTypes.SapphCookingSausages(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSausages"));
	scriptItems:addAll(getScriptManager():getItemsTag("Sausages"));
	scriptItems:addAll(getScriptManager():getItemsTag("Sausage"));
	end

	function Recipe.GetItemTypes.SapphCookingChicken(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingChicken"));
	scriptItems:addAll(getScriptManager():getItemsTag("Chicken"));
	end

	function Recipe.GetItemTypes.SapphCookingSugar(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSugar"));
	scriptItems:addAll(getScriptManager():getItemsTag("Sugar"));
	end

	function Recipe.GetItemTypes.SapphCookingPepper(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingPepper"));
	scriptItems:addAll(getScriptManager():getItemsTag("Pepper"));
	end

	function Recipe.GetItemTypes.SapphCookingSalt(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingSalt"));
	scriptItems:addAll(getScriptManager():getItemsTag("Salt"));
	end

	function Recipe.GetItemTypes.SapphCookingPasta(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("SapphCookingPasta"));
	scriptItems:addAll(getScriptManager():getItemsTag("Pasta"));
	end

	
	function Recipe.GetItemTypes.SapphCookingCoffeeCup(scriptItems)
    scriptItems:addAll(getScriptManager():getItemsTag("CoffeeCup"));
	end
