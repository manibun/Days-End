-- Gain trait "Herbalist" when the "Herbalist" recipe is read.
function traitByRecipe(player)
    local playerRecipes = player:getKnownRecipes();
    if playerRecipes:contains("Herbalist") and not player:HasTrait("Herbalist") then
        player:getTraits():add("Herbalist");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Herbalist"), true, HaloTextHelper.getColorGreen());
    end
    if playerRecipes:contains("Generator") and not player:HasTrait("AmateurElectrician") and not player:HasTrait("AmateurElectrician2") then
        player:getTraits():add("AmateurElectrician");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AmateurElectrician"), true, HaloTextHelper.getColorGreen());
    end
end
Events.OnPlayerUpdate.Add(traitByRecipe);

function recipesByPerksLevel(player, perk, perkLevel)
    local playerRecipes = player:getKnownRecipes();
    if perk == Perks.Woodwork then
        carpentryRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Cooking then
        cookingRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Farming then
        farmingRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Electricity then
        electronicRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.MetalWelding then
        metalweldingRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Mechanics then
        mechanicRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Tailoring then
        tailoringRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Fishing then
        fishingRecipes(player, perkLevel, playerRecipes);
    end
    if perk == Perks.Trapping then
        trappingRecipes(player, perkLevel, playerRecipes);
    end
end
Events.LevelPerk.Add(recipesByPerksLevel);

--------------- RECIPES LEARNED BY LEVELING UP CARPENTRY ---------------
function carpentryRecipes(player, perkLevel, playerRecipes)

    ----- CARPENTRY ONLY RECIPES -----
    if perkLevel >= 2 then
        if not playerRecipes:contains("Make Wooden Cage Trap") then
            playerRecipes:add("Make Wooden Cage Trap");
        end
        if not playerRecipes:contains("Make Stick Trap") then
            playerRecipes:add("Make Stick Trap");
        end
    end

    ----- CARPENTRY AND FISHING RECIPES -----
    if perkLevel >= 3 and player:getPerkLevel(Perks.Fishing) >= 1 then
        if not playerRecipes:contains("Make Fishing Rod") then
            playerRecipes:add("Make Fishing Rod");
        end
        if not playerRecipes:contains("Fix Fishing Rod") then
            playerRecipes:add("Fix Fishing Rod");
        end
    end

    ----- CARPENTRY AND TRAPPING RECIPES -----
    if perkLevel >= 3 and player:getPerkLevel(Perks.Trapping) >= 1 then
        if not playerRecipes:contains("Make Snare Trap") then
            playerRecipes:add("Make Snare Trap");
        end
    end

    if perkLevel >= 4 and player:getPerkLevel(Perks.Trapping) >= 3 then
        if not playerRecipes:contains("Make Trap Box") then
            playerRecipes:add("Make Trap Box");
        end
        if not playerRecipes:contains("Make Cage Trap") then
            playerRecipes:add("Make Cage Trap");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP COOKING ---------------
function cookingRecipes(player, perkLevel, playerRecipes)
    if perkLevel >= 3 then
        if not playerRecipes:contains("Make Cake Batter") then
            playerRecipes:add("Make Cake Batter");
        end
        if not playerRecipes:contains("Make Pie Dough") then
            playerRecipes:add("Make Pie Dough");
        end
    end
    if perkLevel >= 4 then
        if not playerRecipes:contains("Make Bread Dough") then
            playerRecipes:add("Make Bread Dough");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP FARMING ---------------
function farmingRecipes(player, perkLevel, playerRecipes)

    ----- FARMING ONLY RECIPES -----
    if perkLevel >= 5 then
        if not playerRecipes:contains("Make Mildew Cure") then
            playerRecipes:add("Make Mildew Cure");
        end
        if not playerRecipes:contains("Make Flies Cure") then
            playerRecipes:add("Make Flies Cure");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP ELECTRONIC ---------------
function electronicRecipes(player, perkLevel, playerRecipes)

    ----- ELECTRONIC ONLY RECIPES -----
    if perkLevel >= 1 then
        if not playerRecipes:contains("Make Smoke Bomb") then
            playerRecipes:add("Make Smoke Bomb");
        end
    end
    if perkLevel >= 2 then
        if not playerRecipes:contains("Make Noise Maker") then
            playerRecipes:add("Make Noise Maker");
        end
    end
    if perkLevel >= 4 then
        if not playerRecipes:contains("Make Remote Controller V1") then
            playerRecipes:add("Make Remote Controller V1");
        end
        if not playerRecipes:contains("Make Remote Controller V2") then
            playerRecipes:add("Make Remote Controller V2");
        end
        if not playerRecipes:contains("Make Remote Controller V3") then
            playerRecipes:add("Make Remote Controller V3");
        end
        if not playerRecipes:contains("Make Timer") then
            playerRecipes:add("Make Timer");
        end
        if not playerRecipes:contains("Add Timer") then
            playerRecipes:add("Add Timer");
        end
        if not playerRecipes:contains("Add Motion Sensor V1") then
            playerRecipes:add("Add Motion Sensor V1");
        end
        if not playerRecipes:contains("Add Motion Sensor V2") then
            playerRecipes:add("Add Motion Sensor V2");
        end
        if not playerRecipes:contains("Add Motion Sensor V3") then
            playerRecipes:add("Add Motion Sensor V3");
        end
        if not playerRecipes:contains("Make Remote Trigger") then
            playerRecipes:add("Make Remote Trigger");
        end
        if not playerRecipes:contains("Add Crafted Trigger") then
            playerRecipes:add("Add Crafted Trigger");
        end
        if not playerRecipes:contains("Generator") then
            playerRecipes:add("Generator");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP METALWELDING ---------------
function metalweldingRecipes(player, perkLevel, playerRecipes)

    ----- METALWELDING ONLY RECIPES -----
    if perkLevel >= 1 then
        if not playerRecipes:contains("Make Metal Sheet") then
            playerRecipes:add("Make Metal Sheet");
        end
        if not playerRecipes:contains("Make Small Metal Sheet") then
            playerRecipes:add("Make Small Metal Sheet");
        end
    end
    if perkLevel >= 3 then
        if not playerRecipes:contains("Make Metal Containers") then
            playerRecipes:add("Make Metal Containers");
        end
    end
    if perkLevel >= 4 then
        if not playerRecipes:contains("Make Metal Walls") then
            playerRecipes:add("Make Metal Walls");
        end
        if not playerRecipes:contains("Make Metal Roof") then
            playerRecipes:add("Make Metal Roof");
        end
    end
    if perkLevel >= 5 then
        if not playerRecipes:contains("Make Metal Fences") then
            playerRecipes:add("Make Metal Fences");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP MECHANIC ---------------
function mechanicRecipes(player, perkLevel, playerRecipes)

    ----- MECHANIC ONLY RECIPES -----
    if perkLevel >= 2 then
        if not playerRecipes:contains("Basic Mechanics") then
            playerRecipes:add("Basic Mechanics");
        end
    end
    if perkLevel >= 3 then
        if not playerRecipes:contains("Intermediate Mechanics") then
            playerRecipes:add("Intermediate Mechanics");
        end
    end
    if perkLevel >= 4 then
        if not playerRecipes:contains("Advanced Mechanics") then
            playerRecipes:add("Advanced Mechanics");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP TAILORING ---------------
function tailoringRecipes(player, perkLevel, playerRecipes)

    ----- TAILORING AND FISHING RECIPES -----
    if perkLevel >= 1 and player:getPerkLevel(Perks.Fishing) >= 1 then
        if not playerRecipes:contains("Make Fishing Net") then
           playerRecipes:add("Make Fishing Net");
        end
        if not playerRecipes:contains("Get Wire Back") then
           playerRecipes:add("Get Wire Back");
        end
    end
end

--------------- RECIPES LEARNED BY LEVELING UP FISHING ---------------
function fishingRecipes(player, perkLevel, playerRecipes)

    ----- FISHING AND TAILORING RECIPES -----
    if perkLevel >= 1 and player:getPerkLevel(Perks.Tailoring) >= 1 then
        if not playerRecipes:contains("Make Fishing Net") then
           playerRecipes:add("Make Fishing Net");
        end
        if not playerRecipes:contains("Get Wire Back") then
           playerRecipes:add("Get Wire Back");
        end
    end

    ----- FISHING AND CARPENTRY RECIPES -----
    if perkLevel >= 1 and player:getPerkLevel(Perks.Woodwork) >= 3 then
        if not playerRecipes:contains("Make Fishing Rod") then
            playerRecipes:add("Make Fishing Rod");
        end
        if not playerRecipes:contains("Fix Fishing Rod") then
            playerRecipes:add("Fix Fishing Rod");
        end
    end

end

--------------- RECIPES LEARNED BY LEVELING UP TRAPPING ---------------
function trappingRecipes(player, perkLevel, playerRecipes)

    ----- TRAPPING AND CARPENTRY RECIPES -----
    if perkLevel >= 1 and player:getPerkLevel(Perks.Woodwork) >= 3 then
        if not playerRecipes:contains("Make Snare Trap") then
            playerRecipes:add("Make Snare Trap");
        end
    end

    if perkLevel >= 3 and player:getPerkLevel(Perks.Woodwork) >= 4 then
        if not playerRecipes:contains("Make Trap Box") then
            playerRecipes:add("Make Trap Box");
        end
        if not playerRecipes:contains("Make Cage Trap") then
            playerRecipes:add("Make Cage Trap");
        end
    end
end