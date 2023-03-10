DTBaseGameCharacterDetails = {}

DTBaseGameCharacterDetails.DoTraits = function()
    local amateurElectrician = TraitFactory.addTrait("AmateurElectrician", getText("UI_trait_AmateurElectrician"), 2, getText("UI_trait_AmateurElectricianDesc"), false);
    amateurElectrician:getFreeRecipes():add("Generator");
    local amateurElectrician2 = TraitFactory.addTrait("AmateurElectrician2", getText("UI_trait_AmateurElectrician"), 0, getText("UI_trait_AmateurElectricianDesc"), true);
    amateurElectrician2:getFreeRecipes():add("Generator");
    TraitFactory.addTrait("Pluviophile", getText("UI_trait_Pluviophile"), 2, getText("UI_trait_PluviophileDesc"), false);
    TraitFactory.addTrait("Pluviophobia", getText("UI_trait_Pluviophobia"), -2, getText("UI_trait_PluviophobiaDesc"), false);
    --TraitFactory.addTrait("Alcoholic", getText("UI_trait_Alcoholic"), -8, getText("UI_trait_AlcoholicDesc"), false);
    TraitFactory.addTrait("Prodigy", getText("UI_trait_Prodigy"), 6, getText("UI_trait_ProdigyDesc"), false);
    TraitFactory.addTrait("PhysicallyActive", getText("UI_trait_PhysicallyActive"), 3, getText("UI_trait_PhysicallyActiveDesc"), false);
    TraitFactory.addTrait("Sedentary", getText("UI_trait_Sedentary"), -6, getText("UI_trait_SedentaryDesc"), false);

    -- NEW TRAITS EXCLUSIONS & NEW EXCLUSIONS
    -- VANILLA EXCLUSIONS

    -- DYNAMIC TRAITS EXCLUSIONS
    -- TRAITS THAT CAN'T BE PICKED WITH "Obese" TRAIT.
    TraitFactory.setMutualExclusive("Obese","Inconspicuous");
    TraitFactory.setMutualExclusive("Obese","Conspicuous");
    TraitFactory.setMutualExclusive("Obese","Graceful");
    TraitFactory.setMutualExclusive("Obese","Clumsy");
    
    -- TRAITS THAT CAN'T BE PICKED WITH "Very Underweight" TRAIT.
    TraitFactory.setMutualExclusive("Very Underweight","Strong");
    TraitFactory.setMutualExclusive("Very Underweight","Stout");
    TraitFactory.setMutualExclusive("Very Underweight","Fit");

    -- TRAITS THAT CAN'T BE PICKED WITH "Underweight" TRAIT.
    TraitFactory.setMutualExclusive("Underweight","Strong");
    TraitFactory.setMutualExclusive("Underweight","Athletic");

    -- TRAITS THAT CAN'T BE PICKED WITH "Brave" TRAIT.
    TraitFactory.setMutualExclusive("Brave","Agoraphobic");
    TraitFactory.setMutualExclusive("Brave","Claustophobic");
    TraitFactory.setMutualExclusive("Brave","Hemophobic");

    -- "Pluviophile" && "Pluviophobia" EXCLUSION.
    TraitFactory.setMutualExclusive("Pluviophile","Pluviophobia");

    -- TRAITS THAT CAN'T BE PICKED WITH "Sedentary" TRAIT.
    TraitFactory.setMutualExclusive("Sedentary","PhysicallyActive");
    TraitFactory.setMutualExclusive("Sedentary","Strong");
    TraitFactory.setMutualExclusive("Sedentary","Athletic");
    TraitFactory.setMutualExclusive("Sedentary","Fit");

    -- "Desensitized" && "Pacifist" EXCLUSION.
    TraitFactory.setMutualExclusive("Desensitized","Pacifist");

    -- "Amateur Electrician" && "Amateur Electrician" EXCLUSION.
    TraitFactory.setMutualExclusive("AmateurElectrician", "AmateurElectrician2");
end
Events.OnGameBoot.Add(DTBaseGameCharacterDetails.DoTraits);