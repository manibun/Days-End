local addTrait = ProfessionFramework.addTrait

addTrait("gunspecialist", {
    name = "UI_trait_gunspecialist",
    description = "UI_trait_gunspecialistdesc",
    cost = 4,
    xp = {
        [Perks.Aiming] = 1,
        [Perks.Reloading] = 1,
    },
})

addTrait("swift", {
    name = "UI_trait_swift",
    description = "UI_trait_swiftdesc",
    cost = 2,
    xp = {
        [Perks.Lightfoot] = 2,
    },
})

addTrait("flexible", {
    name = "UI_trait_flexible",
    description = "UI_trait_flexibledesc",
    cost = 2,
    xp = {
        [Perks.Nimble] = 2,
    },
	exclude = {"Obese"},
})

--[[addTrait("generator", {
    name = "UI_trait_generator",
    description = "UI_trait_generatordesc",
    cost = 2,
})]]

addTrait("olympian", {
    name = "UI_trait_olympian",
    description = "UI_trait_olympiandesc",
    cost = 7,
    xp = {
        [Perks.Fitness] = 2,
        [Perks.Sprinting] = 4,
    },
	exclude = {"Unfit", "Jogger"},
})

addTrait("grunt", {
    name = "UI_trait_grunt",
    description = "UI_trait_gruntdesc",
    cost = 4,
    xp = {
        [Perks.SmallBlunt] = 1,
        [Perks.Woodwork] = 1,
        [Perks.Masonry] = 1,
    },
})

addTrait("quiet", {
    name = "UI_trait_quiet",
    description = "UI_trait_quietdesc",
    cost = 3,
    xp = {
        [Perks.Sneak] = 1,
        [Perks.Lightfoot] = 1,
    },
	exclude = {"Clumsy"},
})

addTrait("tinkerer", {
    name = "UI_trait_tinkerer",
    description = "UI_trait_tinkererdesc",
    cost = 5,
    xp = {
        [Perks.Electricity] = 1,
        [Perks.Mechanics] = 1,
        [Perks.Tailoring] = 1,
    },
})

addTrait("scrapper", {
    name = "UI_trait_scrapper",
    description = "UI_trait_scrapperdesc",
    cost = 3,
    xp = {
        [Perks.MetalWelding] = 1,
        [Perks.Maintenance] = 1,
    },
    recipes = { "Make Metal Pipe", "Make Metal Sheet", "Make Small Metal Sheet" },
})

addTrait("wildsman", {
    name = "UI_trait_wildsman",
    description = "UI_trait_wildsmandesc",
    cost = 7,
    xp = {
        [Perks.Spear] = 1,
        [Perks.Fishing] = 1,
        [Perks.Trapping] = 1,
        [Perks.PlantScavenging] = 1,
    },
    recipes = { "Make Stick Trap", "Make Snare Trap", "Make Fishing Rod", "Fix Fishing Rod" },
})

addTrait("natural", {
    name = "UI_trait_natural",
    description = "UI_trait_naturaldesc",
    cost = 3,
    xp = {
        [Perks.Cooking] = 1,
        [Perks.PlantScavenging] = 1,
    },
})

addTrait("bladetwirl", {
    name = "UI_trait_bladetwirl",
    description = "UI_trait_bladetwirldesc",
    cost = 5,
    xp = {
        [Perks.LongBlade] = 1,
        [Perks.SmallBlade] = 1,
    },
})

addTrait("blunttwirl", {
    name = "UI_trait_blunttwirl",
    description = "UI_trait_blunttwirldesc",
    cost = 5,
    xp = {
        [Perks.Blunt] = 1,
        [Perks.SmallBlunt] = 1,
    },
})

addTrait("gymgoer", {
    name = "UI_trait_gymgoer",
    description = "UI_trait_gymgoerdesc",
    cost = 3,
    xp = {
        [Perks.Strength] = 1,
        [Perks.Fitness] = 1,
    },
})

addTrait("anemic", {
    name = "UI_trait_anemic",
    description = "UI_trait_anemicdesc",
    cost = -6,
})

addTrait("badteeth", {
    name = "UI_trait_badteeth",
    description = "UI_trait_badteethdesc",
    cost = -1,
})

addTrait("blissful", {
    name = "UI_trait_blissful",
    description = "UI_trait_blissfuldesc",
    cost = 3,
	exclude = { "depressive", "depressive2", "selfdestructive", "selfdestructive2", "Smoker" },
})

addTrait("broke", {
    name = "UI_trait_broke",
    description = "UI_trait_brokedesc",
    cost = -3,
})

addTrait("burned", {
    name = "UI_trait_burned",
    description = "UI_trait_burneddesc",
    cost = -3,
	exclude = {"broke", "injured" },
})

addTrait("butterfingers", {
    name = "UI_trait_butterfingers",
    description = "UI_trait_butterfingersdesc",
    cost = -13,
})

addTrait("depressive", {
    name = "UI_trait_depressive",
    description = "UI_trait_depressivedesc",
    cost = -4,
	exclude = { "depressive2" }
})

addTrait("depressive2", {
    name = "UI_trait_depressive",
    description = "UI_trait_depressivedesc",
    profession = true,
})

addTrait("immunocompromised", {
    name = "UI_trait_immunocompromised",
    description = "UI_trait_immunocompromiseddesc",
    cost = -3,
	exclude = { "Resilient" },
})

addTrait("injured", {
    name = "UI_trait_injured",
    description = "UI_trait_injureddesc",
    cost = -4,
})

addTrait("paranoia", {
    name = "UI_trait_paranoia",
    description = "UI_trait_paranoiadesc",
    cost = -4,
	exclude = { "paranoia2" }
})

addTrait("paranoia2", {
    name = "UI_trait_paranoia",
    description = "UI_trait_paranoiadesc",
    profession = true,
})

addTrait("selfdestructive", {
    name = "UI_trait_selfdestructive",
    description = "UI_trait_selfdestructivedesc",
    cost = -9,
	exclude = { "selfdestructive2" }
})

addTrait("selfdestructive2", {
    name = "UI_trait_selfdestructive",
    description = "UI_trait_selfdestructivedesc",
    profession = true,
})

addTrait("superimmune", {
    name = "UI_trait_superimmune",
    description = "UI_trait_superimmunedesc",
    cost = 8,
	exclude = { "Resilient", "immunocompromised", "ProneToIllness" },
})

addTrait("thickblood", {
    name = "UI_trait_thickblood",
    description = "UI_trait_thickblooddesc",
    cost = 4,
	exclude = { "anemic" },
})
