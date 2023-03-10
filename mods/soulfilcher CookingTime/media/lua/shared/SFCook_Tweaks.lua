local manager = ScriptManager.instance

function SFCook_Tweaks()

-- Changes to food type categories
manager:getItem("Base.Chocolate"):DoParam("FoodType".." = ".."Chocolate");

-- Additions to Replace on use
manager:getItem("Base.Honey"):DoParam("ReplaceOnUse".." = ".."filcher.JarAndLid");
manager:getItem("Base.PeanutButter"):DoParam("ReplaceOnUse".." = ".."filcher.JarAndLid");

-- New recipe in magazine
manager:getItem("Base.CookingMag2"):DoParam("TeachedRecipes".." = ".."Make Bread Dough;Make Plain Bread Dough;Make Biscuits;Make Pizza");

-- Additions to evolved recipes
manager:getItem("Base.Apple"):DoParam("EvolvedRecipe".." = ".."Cake:16;FruitSalad:8;Pancakes:8;Waffles:8;Muffin:8;PieSweet:16;Oatmeal:4;Salad:8;Cupcakes:4;Juice:4");
manager:getItem("Base.Avocado"):DoParam("EvolvedRecipe".." = ".."Omelette:8;Soup:16;Stew:16;Pie:16;Stir fry Griddle Pan:16;Stir fry:16;Sandwich:8;Sandwich Baguette:8;Salad:16;Roasted Vegetables:16;RicePot:16;RicePan:16;PastaPot:16;PastaPan:16;Taco:8;Burrito:8;Toast:8;Pancakes:8");
manager:getItem("Base.Banana"):DoParam("EvolvedRecipe".." = ".."Bread:16;Cake:16;FruitSalad:8;Pancakes:8;Waffles:8;Muffin:8;ConeIcecream:4;PieSweet:16;Oatmeal:4;Sandwich:8;Sandwich Baguette:8;Icecream:8;Juice:4");
manager:getItem("Base.BellPepper"):DoParam("EvolvedRecipe".." = ".."Pizza:8;Omelette:4;Soup:8;Stew:8;Pie:8;Stir fry Griddle Pan:8;Stir fry:8;Sandwich:2;Sandwich Baguette:2;Burger:2;Salad:4;Roasted Vegetables:8;RicePot:8;RicePan:8;PastaPot:8;PastaPan:8;Taco:2;Burrito:4;Chili:8;Pickles:4");
manager:getItem("Base.BerryBlack"):DoParam("EvolvedRecipe".." = ".."Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10;ConeIcecream:5;PieSweet:10;Oatmeal:5;Cupcakes:5;Icecream:10;Juice:5");
manager:getItem("Base.BerryBlue"):DoParam("EvolvedRecipe".." = ".."Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10;ConeIcecream:5;PieSweet:10;Oatmeal:5;Cupcakes:5;Icecream:10;Juice:5");
manager:getItem("Base.Carrots"):DoParam("EvolvedRecipe".." = ".."Soup:8;Stew:8;Pie:8;Stir fry Griddle Pan:8;Stir fry:8;Sandwich:4;Sandwich Baguette:4;Salad:4;Roasted Vegetables:8;RicePot:8;RicePan:8;PastaPot:8;PastaPan:8;Pickles:4");
manager:getItem("Base.Cheese"):DoParam("EvolvedRecipe".." = ".."Pizza:15;Soup:10;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;PastaPot:10;PastaPan:10;Taco:5;Burrito:5;Bread:5;Toast:5;Hotdog:5");
manager:getItem("Base.Cherry"):DoParam("EvolvedRecipe".." = ".."Cake:3;FruitSalad:3;Pancakes:3;Waffles:3;Muffin:3;ConeIcecream:3;PieSweet:3;Oatmeal:5;Icecream:3;Juice:3;Cupcakes:3;Drink:3");
manager:getItem("Base.Chicken"):DoParam("EvolvedRecipe".." = ".."Pizza:12;Soup:18;Stew:18;Pie:12;Stir fry Griddle Pan:18;Stir fry:18;Sandwich:6|Cooked;Sandwich Baguette:6|Cooked;Burger:12|Cooked;Salad:6|Cooked;Roasted Vegetables:18;RicePot:18;RicePan:18;PastaPot:18;PastaPan:18;Taco:6|Cooked;Burrito:12|Cooked;Chili:18");
manager:getItem("Base.Chocolate"):DoParam("EvolvedRecipe".." = ".."Cake:20;PieSweet:20;Bread:10;Muffin:10;ConeIcecream:5;Cupcakes:5;Icecream:10;Drink:5");
manager:getItem("Base.CocoaPowder"):DoParam("EvolvedRecipe".." = ".."HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;ConeIcecream:5;Pancakes:5;Waffles:5;Icecream:5;Cake:5;Cupcakes:5;Pancakes:5");
manager:getItem("Base.Coffee2"):DoParam("EvolvedRecipe".." = ".."HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;Muffin:5");
manager:getItem("Base.Corn"):DoParam("EvolvedRecipe".." = ".."Soup:14;Stew:14;Stir fry Griddle Pan:14;Stir fry:14;Burger:7;Salad:7;Roasted Vegetables:14;RicePot:14;RicePan:14;PastaPot:14;PastaPan:14;Burrito:7;Taco:7;Pizza:7;Hotdog:7;Pickles:7");
manager:getItem("Base.Grapes"):DoParam("EvolvedRecipe".." = ".."Cake:15;FruitSalad:15;Pancakes:15;Waffles:15;Muffin:15;Salad:5;Juice:5");
manager:getItem("Base.Honey"):DoParam("EvolvedRecipe".." = ".."Beverage:2;Beverage2:2;Cake:5;Sandwich:2;Sandwich Baguette:2;FruitSalad:2;HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Pancakes:2;Waffles:2;ConeIcecream:2;PieSweet:5;Toast:2;Oatmeal:2;Icecream:2");
manager:getItem("Base.JamFruit"):DoParam("EvolvedRecipe".." = ".."Sandwich:3;Sandwich Baguette:3;Pancakes:5;Waffles:5;ConeIcecream:5;Cake:15;Toast:3;Bread:15;Oatmeal:3;Icecream:5");
manager:getItem("Base.Ketchup"):DoParam("EvolvedRecipe".." = ".."Sandwich:2;Sandwich Baguette:2;Burger:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;Pizza:2;Hotdog:2");
manager:getItem("Base.Lemon"):DoParam("EvolvedRecipe".." = ".."HotDrink:2;HotDrinkRed:2;HotDrinkWhite:2;HotDrinkSpiffo:2;HotDrinkTea:2;Cake:5;FruitSalad:5;Pancakes:5;Waffles:5;Muffin:5;PieSweet:5;Stir fry Griddle Pan:5;Stir fry:5;Soup:10;Beverage:2;Beverage2:2;Beer:2;Beer2:2;Taco:2;Burrito:2;Juice:5;Drink:5");
manager:getItem("Base.Mango"):DoParam("EvolvedRecipe".." = ".."Cake:10;FruitSalad:10;Pancakes:10;Waffles:10;Muffin:10;PieSweet:10;Oatmeal:5;Juice:5;Drink:5");
manager:getItem("Base.MapleSyrup"):DoParam("EvolvedRecipe".." = ".."Pancakes:3;Waffles:3;ConeIcecream:3;Oatmeal:3;Beverage:3;Beverage2:3;Oatmeal:3;Cupcakes:3;Juice:3;Drink:3");
manager:getItem("Base.Mustard"):DoParam("EvolvedRecipe".." = ".."Sandwich:2;Sandwich Baguette:2;Burger:2;Salad:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Hotdog:2;Pizza:2");
manager:getItem("Base.OnionRings"):DoParam("EvolvedRecipe".." = ".."Pizza:5;Omelette:5;Soup:5;Stew:5;Pie:5;Stir fry Griddle Pan:5;Stir fry:5;Sandwich:5;Sandwich Baguette:5;Burger:5;Salad:5;Roasted Vegetables:5;RicePot:5;RicePan:5;PastaPot:5;PastaPan:5;Taco:5;Burrito:5;Hotdog:5;Pickles:5");
manager:getItem("Base.Orange"):DoParam("EvolvedRecipe".." = ".."Cake:12;FruitSalad:6;Pancakes:6;Waffles:6;Muffin:6;PieSweet:12;Salad:6;Juice:6;Drink:6");
manager:getItem("Base.Peach"):DoParam("EvolvedRecipe".." = ".."Cake:12;FruitSalad:6;Pancakes:6;Waffles:6;Muffin:6;PieSweet:12;Oatmeal:5;Juice:5;Drink:5");
manager:getItem("Base.Peanuts"):DoParam("EvolvedRecipe".." = ".."Soup:8;Stir fry Griddle Pan:8;Stir fry:8;Salad:4;RicePot:8;RicePan:8;ConeIcecream:4;Icecream:4");
manager:getItem("Base.PeanutButter"):DoParam("EvolvedRecipe".." = ".."Soup:5;Stir fry Griddle Pan:5;Stir fry:5;Sandwich:5;Sandwich Baguette:5;Toast:5;ConeIcecream:5;Pancakes:5;Waffles:5;Icecream:5");
manager:getItem("Base.Peas"):DoParam("EvolvedRecipe".." = ".."Pie:10;Omelette:5;Soup:10;Stew:10;Stir fry Griddle Pan:10;Stir fry:10;Roasted Vegetables:10;RicePot:10;RicePan:10;Salad:5;Hotdog:5");
manager:getItem("Base.Pepper"):DoParam("EvolvedRecipe".." = ".."Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;Chili:1;Hotdog:1;Pickles:1");
manager:getItem("Base.Pineapple"):DoParam("EvolvedRecipe".." = ".."Pizza:12;Cake:12;FruitSalad:8;Pancakes:8;Waffles:8;Muffin:8;ConeIcecream:4;PieSweet:12;Oatmeal:4;Icecream:4");
manager:getItem("Base.Processedcheese"):DoParam("EvolvedRecipe".." = ".."Sandwich:5;Sandwich Baguette:5;Burger:5;RicePot:5;RicePan:5;PastaPot:5;PastaPan:5;Bread:5;Toast:5;Hotdog:5");
manager:getItem("Base.Pumpkin"):DoParam("EvolvedRecipe".." = ".."PieSweet:20;Soup:20;Stew:20;Pie:20;Stir fry:20;Salad:10;Roasted Vegetables:20;RicePot:20;RicePan:20;PastaPot:20;PastaPan:20");
manager:getItem("Base.Salt"):DoParam("EvolvedRecipe".." = ".."Pizza:1;Soup:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Burger:1;Salad:1;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Sandwich:1;Sandwich Baguette:1;Taco:1;Burrito:1;Beverage:1;Beverage2:1;Beer:1;Beer2:1;Drink:1;Chili:1;Pickles:1");
manager:getItem("Base.Sugar"):DoParam("EvolvedRecipe".." = ".."HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;Chili:1;Juice:1;Drink:1");
manager:getItem("Base.SugarBrown"):DoParam("EvolvedRecipe".." = ".."HotDrink:1;HotDrinkRed:1;HotDrinkWhite:1;HotDrinkSpiffo:1;HotDrinkTea:1;Toast:1;Oatmeal:1;Beverage:1;Beverage2:1;Chili:1;Juice:1;Drink:1");
manager:getItem("Base.WatermelonSliced"):DoParam("EvolvedRecipe".." = ".."Salad:6;FruitSalad:6;Pancakes:6;Waffles:6;Muffin:6;Juice:6;Drink:6");
manager:getItem("Base.WatermelonSmashed"):DoParam("EvolvedRecipe".." = ".."Salad:12;FruitSalad:12;Pancakes:12;Waffles:12;Muffin:12;Juice:6;Drink:6");
manager:getItem("Base.WildEggs"):DoParam("EvolvedRecipe".." = ".."Stir fry Griddle Pan:7;Stir fry:7;Roasted Vegetables:7;RicePot:7;RicePan:7;PastaPot:7;PastaPan:7;Sandwich:7|Cooked;Sandwich Baguette:7|Cooked;Burger:7|Cooked;Salad:7|Cooked;Burrito:7|Cooked;Taco:3|Cooked;Soup:7;Stew:7;Pickles:7|Cooked");
manager:getItem("Base.Yoghurt"):DoParam("EvolvedRecipe".." = ".."Oatmeal:5;FruitSalad:10;Pancakes:10;Cupcakes:5;Waffles:10");

manager:getItem("Base.CannedPeasOpen"):DoParam("EvolvedRecipe".." = ".."Omelette:8;Soup:16;Stew:16;Stir fry Griddle Pan:16;Stir fry:16;Roasted Vegetables:16;RicePot:16;RicePan:16;Hotdog:8");
manager:getItem("Base.CannedPineappleOpen"):DoParam("EvolvedRecipe".." = ".."Pizza:15;Cake:15;FruitSalad:15;Pancakes:5;Waffles:5;Muffin:15;ConeIcecream:5;PieSweet:15;Oatmeal:5;Icecream:5");



manager:getItem("farming.BaconBits"):DoParam("EvolvedRecipe".." = ".."Pizza:1;Omelette:1;Stew:1;Pie:1;Stir fry Griddle Pan:1;Stir fry:1;Sandwich:1|Cooked;Sandwich Baguette:1|Cooked;Burger:1|Cooked;Salad:1|Cooked;Roasted Vegetables:1;RicePot:1;RicePan:1;PastaPot:1;PastaPan:1;Taco:1|Cooked;Burrito:1|Cooked;Toast:1|Cooked;Hotdog:1|Cooked");
manager:getItem("farming.Cabbage"):DoParam("EvolvedRecipe".." = ".."Soup:12;Stew:12;Stir fry Griddle Pan:12;Stir fry:12;Sandwich:6;Sandwich Baguette:6;Burger:6;Salad:12;Roasted Vegetables:12;Taco:6;Burrito:6;Pickles:12");
manager:getItem("farming.MayonnaiseFull"):DoParam("EvolvedRecipe".." = ".."Sandwich:2;Sandwich Baguette:2;Burger:2;Salad:2;RicePot:2;RicePan:2;PastaPot:2;PastaPan:2;Taco:2;Burrito:2;Hotdog:2");
manager:getItem("farming.Potato"):DoParam("EvolvedRecipe".." = ".."Omelette:9;Soup:18;Stew:18;Pie:18;Stir fry Griddle Pan:18;Stir fry:18;Salad:9;Roasted Vegetables:18;Pickles:9");
manager:getItem("farming.RedRadish"):DoParam("EvolvedRecipe".." = ".."Soup:3;Stew:3;Stir fry Griddle Pan:3;Stir fry:3;Burger:3;Salad:3;Roasted Vegetables:3;Pickles:3");
manager:getItem("farming.RemouladeFull"):DoParam("EvolvedRecipe".." = ".."Sandwich:2;Sandwich Baguette:2;Burger:2;Stir fry:2;Hotdog:2;Waffles:2");
manager:getItem("farming.Strewberrie"):DoParam("EvolvedRecipe".." = ".."Cake:5;FruitSalad:5;Pancakes:5;Waffles:5;ConeIcecream:5;Oatmeal:5;PieSweet:5;Salad:5;HotDrink:5;HotDrinkRed:5;HotDrinkWhite:5;HotDrinkSpiffo:5;HotDrinkTea:5;Icecream:5;Juice:5;Drink:5");
manager:getItem("farming.Tomato"):DoParam("EvolvedRecipe".." = ".."Pizza:12;Omelette:6;Soup:12;Stew:12;Pie:12;Stir fry Griddle Pan:12;Stir fry:12;Sandwich:6;Sandwich Baguette:6;Burger:6;Salad:6;Roasted Vegetables:12;RicePot:12;RicePan:12;PastaPot:12;PastaPan:12;Taco:6;Burrito:6;Hotdog:6;Juice:6;Pickles:6");

end

Events.OnGameBoot.Add(SFCook_Tweaks)