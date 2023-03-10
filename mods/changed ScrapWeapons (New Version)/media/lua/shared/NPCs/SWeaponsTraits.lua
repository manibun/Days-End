require('NPCs/MainCreationMethods');

local function initTraits()
    local scrapwarrior = TraitFactory.addTrait("scrapwarrior", getText("UI_trait_scrapwarrior"), 4, getText("UI_trait_scrapwarriordesc"), false, false);
    scrapwarrior:addXPBoost(Perks.MetalWelding, 1);
    scrapwarrior:getFreeRecipes():add("Make Scrap Machete");
    scrapwarrior:getFreeRecipes():add("Make Big Scrap Pickaxe");
	scrapwarrior:getFreeRecipes():add("Make Scrap Shiv");
	scrapwarrior:getFreeRecipes():add("Sharpen Screwdriver");
	scrapwarrior:getFreeRecipes():add("Attach Pipes");
	scrapwarrior:getFreeRecipes():add("Make Tin Can Club");
	scrapwarrior:getFreeRecipes():add("Sharpen Stop Sign");
	scrapwarrior:getFreeRecipes():add("Make Salvaged Shiv");
	scrapwarrior:getFreeRecipes():add("Make Scrap Blade");
	scrapwarrior:getFreeRecipes():add("Make Salvaged Nightstick");
	scrapwarrior:getFreeRecipes():add("Make Scrap Spear");
	
	if TraitFactory.getTrait("scrapper") ~= nil then
        TraitFactory.setMutualExclusive("scrapwarrior", "scrapper");
    end
end

Events.OnCreateSurvivor.Add(initTraits);