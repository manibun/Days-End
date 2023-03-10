local addProfession = ProfessionFramework.addProfession
local addTrait = ProfessionFramework.addTrait

ProfessionFramework.RemoveDefaultProfessions = true
ProfessionFramework.RemoveDefaultTraits = true

--
-- If AmmoMaker gets deleted, remove AM's traits from Repairman, Engineer, Metalworker and Veteran
--

addProfession('unemployed', {
    name = "UI_prof_unemployed",
    icon = "profession_unemployed",
    cost = 7,
    xp = {
    },
})

addProfession('Housewife', {
    name = "Housewife",
    icon = "profession_housewife",
    cost = -7,
    xp = {
    [Perks.Cooking] = 2,
    [Perks.Doctor] = 1,
    [Perks.Tailoring] = 2,
    },
})

addProfession('Househusband', {
    name = "Househusband",
    icon = "profession_househusband",
    cost = -7,
    xp = {
    [Perks.Woodwork] = 1,
    [Perks.Cooking] = 2,
    [Perks.Maintenance] = 1,
    [Perks.Tailoring] = 1,
    },
})

addProfession('Tailor', {
    name = "Tailor",
    icon = "profession_tailor",
    cost = -8,
    xp = {
    [Perks.Tailoring] = 7,
    [Perks.Trapping] = 1,
    [Perks.Maintenance] = 2,
    },
    traits = {
        "Dextrous2"
    },
})

addProfession('fireofficer', {
    name = "UI_prof_fireoff",
    icon = "profession_fireofficer2",
    cost = -8,
    xp = {
        [Perks.Fitness] = 2,
        [Perks.Strength] = 2,
        [Perks.Sprinting] = 3,
        [Perks.Nimble] = 3,
        [Perks.Axe] = 4,

    },
})

addProfession('policeofficer', {
    name = "UI_prof_policeoff",
    icon = "profession_policeofficer2",
    cost = -8,
    xp = {
        [Perks.Fitness] = 1,
        [Perks.Sprinting] = 2,
        [Perks.Nimble] = 3,
        [Perks.Maintenance] = 1,
        [Perks.Aiming] = 2,
        [Perks.Reloading] = 1,
    },
})

addProfession('parkranger', {
    name = "UI_prof_parkranger",
    icon = "profession_parkranger2",
    cost = -6,
    xp = {
        [Perks.Trapping] = 5,
        [Perks.PlantScavenging] = 8,
        [Perks.Aiming] = 1,
        [Perks.Fishing] = 1,
    },
    traits = {
        "Outdoorsman"
    },
    recipes = {
		"Make Stick Trap",
		"Make Snare Trap",
		"Make Wooden Cage Trap",
		"Make Trap Box",
		"Make Cage Trap"
	},
})

addProfession('constructionworker', {
    name = "UI_prof_constructionworker",
    icon = "profession_constructionworker2",
    cost = -14,
    xp = {
        [Perks.Blunt] = 1,
        [Perks.SmallBlunt] = 2,
        [Perks.Maintenance] = 1,
        [Perks.Woodwork] = 4,
        [Perks.Electricity] = 2,
        [Perks.MetalWelding] = 3,
    },
})

addProfession('securityguard', {
    name = "UI_prof_securityguard",
    icon = "profession_securityguard2",
    cost = -6,
    xp = {
        [Perks.Lightfoot] = 2,
        [Perks.Nimble] = 2,
        [Perks.SmallBlunt] = 4,
        [Perks.Aiming] = 1,
        [Perks.Reloading] = 1,
    },
})

addProfession('carpenter', {
    name = "UI_prof_Carpenter",
    icon = "profession_hammer2",
    cost = -6,
    xp = {
		[Perks.SmallBlunt] = 3,
        [Perks.Maintenance] = 2,
        [Perks.Woodwork] = 7,
    },
	recipes = {
		"Make wooden hook",
	},
})

addProfession('burglar', {
    name = "UI_prof_Burglar",
    icon = "profession_burglar2",
    cost = -4,
    xp = {
        [Perks.Lightfoot] = 5,
        [Perks.Nimble] = 4,
        [Perks.Sneak] = 5,
        [Perks.Blunt] = 2,
    },
	traits = {
		"Burglar",
	}
})

addProfession('chef', {
    name = "UI_prof_Chef",
    icon = "profession_chef2",
    cost = -6,
    xp = {
        [Perks.SmallBlade] = 4,
        [Perks.Cooking] = 8,
    },
    traits = {
		"Cook2",
	},
    recipes = {
		"Make Cake Batter",
		"Make Pie Dough",
		"Make Bread Dough",
		"Make Cake Batter",
		"Make Corn Batter",
		"Make Corndog",
		"Make Cupcake Batter",
		"Make Bread Dough",
		"Make Pie Dough",
		"Make Pizza Dough",
		"Make Tomato Sauce"
	},
})

addProfession('repairman', {
    name = "UI_prof_Repairman",
    icon = "profession_repairman2",
    cost = -8,
    xp = {
        [Perks.Maintenance] = 5,
        [Perks.Woodwork] = 2,
        [Perks.MetalWelding] = 2,
        [Perks.Electricity] = 2,
        [Perks.Reloading] = 1,
    },
})

addProfession('farmer', {
    name = "UI_prof_Farmer",
    icon = "profession_farmer2",
    cost = -6,
    xp = {
        [Perks.Strength] = 2,
        [Perks.Maintenance] = 2,
        [Perks.Farming] = 7,
        [Perks.Mechanics] = 1,
        [Perks.Cooking] = 1,
        [Perks.Woodwork] = 1,
    },
    recipes = {
		"Make Mildew Cure",
		"Make Flies Cure"
	},
})

addProfession('fisherman', {
    name = "UI_prof_Fisherman",
    icon = "profession_fisher2",
    cost = -2,
    xp = {
        [Perks.Maintenance] = 2,
        [Perks.Fishing] = 8,
        [Perks.PlantScavenging] = 4,
        [Perks.Trapping] = 1,
        [Perks.Spear] = 1,
    },
    recipes = {
		"Make Fishing Rod",
		"Fix Fishing Rod",
		"Get Wire Back",
		"Make Fishing Net"
	},
})

addProfession('doctor', {
    name = "UI_prof_Doctor",
    icon = "profession_doctor2",
    cost = -6,
    xp = {
        [Perks.Doctor] = 7,
        [Perks.Tailoring] = 2,
    },
	recipes = {
		"Combine real surgeon kit",
		"Combine surgeon kit",
		"Combine improvised surgeon kit"
	},
})

addProfession('veteran', {
    name = "UI_prof_Veteran",
    icon = "profession_veteran2",
    cost = -10,
    xp = {
        [Perks.Maintenance] = 1,
        [Perks.Aiming] = 4,
        [Perks.Reloading] = 4,
    },
    traits = {
		"Desensitized",
		"depressive2",
		"selfdestructive2",
	},
})

addProfession('nurse', {
    name = "UI_prof_Nurse",
    icon = "profession_nurse",
    cost = -2,
    xp = {
        [Perks.Lightfoot] = 3,
        [Perks.Doctor] = 4,
        [Perks.Tailoring] = 1,
    },
    traits = {
		"Dextrous2"
	},
})

addProfession('lumberjack', {
    name = "UI_prof_Lumberjack",
    icon = "profession_lumberjack",
    cost = -5,
    xp = {
        [Perks.Axe] = 6,
        [Perks.Strength] = 2,
        [Perks.Woodwork] = 3,
        [Perks.Maintenance] = 2,
        [Perks.PlantScavenging] = 1,
    },
    traits = {
		"Axeman",
	},
})

addProfession('fitnessInstructor', {
    name = "UI_prof_FitnessInstructor",
    icon = "profession_fitnessinstructor",
    cost = -5,
    xp = {
        [Perks.Strength] = 1,
        [Perks.Fitness] = 4,
        [Perks.Sprinting] = 6,
        [Perks.Nimble] = 2,
        [Perks.Cook] = 3,
    },
    traits = {
		"Nutritionist2",
	},
})

addProfession('burgerflipper', {
    name = "UI_prof_BurgerFlipper",
    icon = "profession_burgerflipper",
    cost = 2,
    xp = {
        [Perks.Cooking] = 4,
        [Perks.SmallBlade] = 2,
        [Perks.Maintenance] = 1,
    },
    traits = {
		"Cook2",
	},
	recipes = {
		"Trim Fresh Cannabis",
		"Trim Dry Cannabis",
		"Roll Cannabis Cigar",
		"Roll Premium Cannabis Cigar",
		"Roll Deluxe Cannabis Cigar",
		"Roll Reserve Cannabis Cigar",
		"Prepare Cannabis Curing Jar",
		"Prepare Half Full Cannabis Curing Jar",
		"Add Cannabis to Curing Jar",
		"Prepare Nearly Full Cannabis Curing Jar",
		"Add More Cannabis to Curing Jar",
		"Add Two More Cannabis to Curing Jar",
		"Prepare Full Cannabis Curing Jar",
		"Fill Cannabis Curing Jar",
		"Add Three More Cannabis to Curing Jar",
		"Add Two Cannabis to Half Full Curing Jar",
		"Sift Shake",
		"Build Hashish Press",
		"Roll Cigar",
		"Roll Cannabis Cigar",
		"Roll Premium Cannabis Cigar",
		"Roll Deluxe Cannabis Cigar",
		"Roll Reserve Cannabis Cigar",
		"Make Blunt Wrap",
	},
})

addProfession('electrician', {
    name = "UI_prof_Electrician",
    icon = "profession_electrician",
    cost = -4,
    xp = {
        [Perks.Maintenance] = 3,
        [Perks.Electricity] = 8,
    },
    recipes = {
        "Generator",
		"Make Remote Controller V1",
		"Make Remote Controller V2",
		"Make Remote Controller V3",
        "Make Remote Trigger",
		"Make Timer",
		"Craft Makeshift Radio",
		"Craft Makeshift HAM Radio",
		"Craft Makeshift Walkie Talkie"
    },
})

addProfession('engineer', {
    name = "UI_prof_Engineer",
    icon = "profession_engineer",
    cost = -11,
    xp = {
        [Perks.Woodwork] = 1,
        [Perks.Electricity] = 2,
        [Perks.MetalWelding] = 2,
        [Perks.Mechanics] = 2,
        [Perks.Maintenance] = 1,
    },
    recipes = {
		"Make Flame bomb",
		"Make Noise generator",
		"Make Smoke Bomb",
	},
})

addProfession('metalworker', {
    name = "UI_prof_MetalWorker",
    icon = "profession_metalworker",
    cost = -6,
    xp = {
        [Perks.Maintenance] = 2,
        [Perks.MetalWelding] = 7,
    },
    recipes = {
		"Make Metal Walls",
		"Make Metal Fences",
		"Make Metal Containers",
		"Make Metal Sheet",
		"Make Small Metal Sheet",
		"Make Metal Roof",
		"Make metal hand",
		"Make metal hook",
		"Make Metal Stairs"
	},
})

addProfession('mechanics', {
    name = "UI_prof_Mechanics",
    icon = "profession_mechanic",
    cost = -8,
    xp = {
        [Perks.Electricity] = 1,
        [Perks.Maintenance] = 2,
        [Perks.Mechanics] = 7,
    },
    traits = {
		"Mechanics2"
	},
    recipes = {
		"Basic Mechanics",
		"Intermediate Mechanics",
		"Advanced Mechanics"
	},
})

addProfession('drone', {
    name = "UI_prof_Drone",
    icon = "profession_drone",
    cost = 4,
    xp = {
        [Perks.Fitness] = -1,
        [Perks.Sneak] = 1,
    },
})

addProfession('guardsman', {
    name = "UI_prof_Guardsman",
    icon = "profession_guardsman",
    cost = -16,
    xp = {
        [Perks.Fitness] = 2,
        [Perks.SmallBlade] = 1,
        [Perks.Maintenance] = 1,
        [Perks.Aiming] = 5,
        [Perks.Reloading] = 5,
    },
    traits = {
		"Cowardly2",
		"paranoia2",
		"Marksman",
	},
	clothing = {
        Tshirt = {"Base.Tshirt_ArmyGreen"},
        Shirt = {"Base.Shirt_CamoGreen"},
        Pants = {"Base.Trousers_CamoGreen"},
        Shoes = {"Base.Shoes_ArmyBoots"},
        TorsoExtra = {"Base.Vest_Hunting_Camo"},
    }
})


addProfession('scientist', {
    name = "UI_prof_scientist",
    icon = "profession_scientist",
    cost = -8,
    xp = {
        [Perks.Doctor] = 6,
        [Perks.Electricity] = 3,
    },
    recipes = {
		"LabAssembleMicroscope",
		"LabAssembleChromatograph",
		"LabAssembleChemistrySet",
		"LabAssembleSpectrometer",
		"LabAssembleCentrifuge",
		"LabAssembleMuffleFurnace",
		"LabAssembleWorkbench",
		"FrnMakeTestTube",
		"FrnMakeFlask",
		"FrnMakeJar",
		"ChmGetBloodTest",
		"ChmGetBloodTestTwo",
		"ChmDivideBloodIntoComponents",
		"ChmExtractLeukocytesFromBloodCells",
		"ChmExtractAntibodiesFromLeukocytes",
		"ChmSynthesizePlainVaccine",
		"ChmSynthesizePlainVaccineTwo",
		"ChmMixFlaskOfSodiumHypochlorite",
		"ChmMixFlaskOfAmmoniumSulfate",
		"ChmMixFlaskOfHydrogenPeroxide",
		"ChmMakeAlbumin",
		"ChmMakeChlorineTablets",
		"ChmMakeBottleOfBleach",
		"ChmMakeBottleOfDisinfectant",
		"ChmMakeSyringe",
		"FrnMakeSyringe",
	},
    spawns = {
        ["Day's End Season 5"] = {
            { worldX=41, worldY=14, posX=195, posY=118 },
        },
    },
	clothing = {
        Jacket = {"Base.JacketLong_Doctor"},
    }
})

addTrait("Axeman", {
    name = "UI_trait_axeman",
    description = "UI_trait_axemandesc",
    profession = true,
})

addTrait("Handy", {
    name = "UI_trait_handy",
    description = "UI_trait_handydesc",
    cost = 8,
    xp = {
        [Perks.SmallBlunt] = 1,
        [Perks.Maintenance] = 1,
        [Perks.Woodwork] = 1,
    },
})

addTrait("SpeedDemon", {
    name = "UI_trait_SpeedDemon",
    description = "UI_trait_SpeedDemonDesc",
    cost = 1,
    exclude = { "SundayDriver" },
})

addTrait("SundayDriver", {
    name = "UI_trait_SundayDriver",
    description = "UI_trait_SundayDriverDesc",
    cost = -1,
})

addTrait("Brave", {
    name = "UI_trait_brave",
    description = "UI_trait_bravedesc",
    cost = 4,
    exclude = { "Cowardly" },
})

addTrait("Cowardly", {
    name = "UI_trait_cowardly",
    description = "UI_trait_cowardlydesc",
    cost = -2,
    exclude = { "Cowardly2" },
})

addTrait("Cowardly2", {
    name = "UI_trait_cowardly",
    description = "UI_trait_cowardlydesc",
    profession = true,
})

addTrait("Clumsy", {
    name = "UI_trait_clumsy",
    description = "UI_trait_clumsydesc",
    cost = -1,
    exclude = { "Graceful" },
})

addTrait("Graceful", {
    name = "UI_trait_graceful",
    description = "UI_trait_gracefuldesc",
    cost = 4,
})

addTrait("ShortSighted", {
    name = "UI_trait_shortsigh",
    description = "UI_trait_shortsighdesc",
    cost = -2,
    exclude = { "EagleEyed" }
})

addTrait("HardOfHearing", {
    name = "UI_trait_hardhear",
    description = "UI_trait_hardheardesc",
    cost = -2,
    exclude = { "KeenHearing" }
})

addTrait("Deaf", {
    name = "UI_trait_deaf",
    description = "UI_trait_deafdesc",
    cost = -12,
    exclude = { "HardOfHearing", "KeenHearing" }
})

addTrait("KeenHearing", {
    name = "UI_trait_keenhearing",
    description = "UI_trait_keenhearingdesc",
    cost = 6,
})

addTrait("EagleEyed", {
    name = "UI_trait_eagleeyed",
    description = "UI_trait_eagleeyeddesc",
    cost = 4,
})

addTrait("HeartyAppitite", {
    name = "UI_trait_heartyappetite",
    description = "UI_trait_heartyappetitedesc",
    cost = -3,
    exclude = { "LightEater" },
})

addTrait("LightEater", {
    name = "UI_trait_lighteater",
    description = "UI_trait_lighteaterdesc",
    cost = 4,
})

addTrait("ThickSkinned", {
    name = "UI_trait_thickskinned",
    description = "UI_trait_thickskinneddesc",
    cost = 6,
    exclude = { "Thinskinned" },
})

addTrait("Unfit", {
    name = "UI_trait_unfit",
    description = "UI_trait_unfitdesc",
    cost = -7,
    xp = {
        [Perks.Fitness] = -4,
    },
    exclude = { "Out of Shape" },
})

addTrait("Out of Shape", {
    name = "UI_trait_outofshape",
    description = "UI_trait_outofshapedesc",
    cost = -6,
    xp = {
        [Perks.Fitness] = -2,
    }
})

addTrait("Fit", {
    name = "UI_trait_fit",
    description = "UI_trait_fitdesc",
    cost = 6,
    xp = {
        [Perks.Fitness] = 2,
    },
    exclude = { "Out of Shape", "Unfit", "Overweight", "Obese"},
})

addTrait("Athletic", {
    name = "UI_trait_athletic",
    description = "UI_trait_athleticdesc",
    cost = 10,
    xp = {
        [Perks.Fitness] = 4,
    },
    exclude = { "Overweight", "Fit", "Obese", "Out of Shape", "Unfit" },
})

addTrait("Nutritionist", {
    name = "UI_trait_nutritionist",
    description = "UI_trait_nutritionistdesc",
    cost = 4,
    exclude = { "Nutritionist2" },
})

addTrait("Nutritionist2", {
    name = "UI_trait_nutritionist",
    description = "UI_trait_nutritionistdesc",
    profession = true,
})

addTrait("Emaciated", {
    name = "UI_trait_emaciated",
    description = "UI_trait_emaciateddesc",
    cost = -5,
    exclude = { "Underweight" },
})

addTrait("Very Underweight", {
    name = "UI_trait_veryunderweight",
    description = "UI_trait_veryunderweightdesc",
    cost = -3,
    exclude = { "Underweight", "Emaciated" },
})

addTrait("Underweight", {
    name = "UI_trait_underweight",
    description = "UI_trait_underweightdesc",
    cost = -2,
})

addTrait("Overweight", {
    name = "UI_trait_overweight",
    description = "UI_trait_overweightdesc",
    cost = -3,
    exclude = { "Obese", "Underweight", "Very Underweight", "Emaciated" },
})

addTrait("Obese", {
    name = "UI_trait_obese",
    description = "UI_trait_obesedesc",
    cost = -5,
    exclude = { "Underweight", "Very Underweight", "Emaciated" },
})

addTrait("Strong", {
    name = "UI_trait_strong",
    description = "UI_trait_strongdesc",
    cost = 10,
    xp = {
        [Perks.Strength] = 4
    },
    exclude = { "Feeble", "Stout" },
})

addTrait("Stout", {
    name = "UI_trait_stout",
    description = "UI_trait_stoutdesc",
    cost = 6,
    xp = {
        [Perks.Strength] = 2
    },
    exclude = { "Feeble" },
})

addTrait("Weak", {
    name = "UI_trait_weak",
    description = "UI_trait_weakdesc",
    cost = -7,
    xp = {
        [Perks.Strength] = -5
    },
    exclude = { "Strong", "Stout", "Feeble" },
})

addTrait("Feeble", {
    name = "UI_trait_feeble",
    description = "UI_trait_feebledesc",
    cost = -5,
    xp = {
        [Perks.Strength] = -2
    },
})

addTrait("Resilient", {
    name = "UI_trait_resilient",
    description = "UI_trait_resilientdesc",
    cost = 4,
    exclude = { "ProneToIllness" },
})

addTrait("ProneToIllness", {
    name = "UI_trait_pronetoillness",
    description = "UI_trait_pronetoillnessdesc",
    cost = -2,
})

addTrait("Agoraphobic", {
    name = "UI_trait_agoraphobic",
    description = "UI_trait_agoraphobicdesc",
    cost = -3,
})

addTrait("Claustophobic", {
    name = "UI_trait_claustro",
    description = "UI_trait_claustrodesc",
    cost = -3,
})

addTrait("Lucky", {
    name = "UI_trait_lucky",
    description = "UI_trait_luckydesc",
    cost = 4,
    exclude = { "Unlucky" },
})

addTrait("Unlucky", {
    name = "UI_trait_unlucky",
    description = "UI_trait_unluckydesc",
    cost = -4,
})

addTrait("Marksman", {
    name = "UI_trait_marksman",
    description = "UI_trait_marksmandesc",
    profession = true,
})

addTrait("NightOwl", {
    name = "UI_trait_nightowl",
    description = "UI_trait_nightowldesc",
    profession = true,
})

addTrait("FastHealer", {
    name = "UI_trait_FastHealer",
    description = "UI_trait_FastHealerDesc",
    cost = 6,
    exclude = { "SlowHealer" },
})

addTrait("FastLearner", {
    name = "UI_trait_FastLearner",
    description = "UI_trait_FastLearnerDesc",
    cost = 6,
    exclude = { "SlowLearner" },
})

addTrait("FastReader", {
    name = "UI_trait_FastReader",
    description = "UI_trait_FastReaderDesc",
    cost = 2,
    exclude = { "SlowReader" },
})

addTrait("AdrenalineJunkie", {
    name = "UI_trait_AdrenalineJunkie",
    description = "UI_trait_AdrenalineJunkieDesc",
    cost = 8,
})

addTrait("Inconspicuous", {
    name = "UI_trait_Inconspicuous",
    description = "UI_trait_InconspicuousDesc",
    cost = 4,
})

--[[addTrait("NeedsLessSleep", {
    name = "UI_trait_LessSleep",
    description = "UI_trait_LessSleepDesc",
    cost = 2,
    requiresSleepEnabled = true,
    exclude = { "NeedsMoreSleep" },
})]]

addTrait("NightVision", {
    name = "UI_trait_NightVision",
    description = "UI_trait_NightVisionDesc",
    cost = 2,
})

addTrait("Organized", {
    name = "UI_trait_Packmule",
    description = "UI_trait_PackmuleDesc",
    cost = 6,
    exclude = { "Disorganized" },
})

addTrait("LowThirst", {
    name = "UI_trait_LowThirst",
    description = "UI_trait_LowThirstDesc",
    cost = 6,
    exclude = { "HighThirst" },
})

addTrait("FirstAid", {
    name = "UI_trait_FirstAid",
    description = "UI_trait_FirstAidDesc",
    cost = 4,
    xp = {
        [Perks.Doctor] = 1
    },
})

addTrait("Fishing", {
    name = "UI_trait_Fishing",
    description = "UI_trait_FishingDesc",
    cost = 4,
    xp = {
        [Perks.Fishing] = 2
    },
    recipes = { "Make Fishing Rod", "Fix Fishing Rod" },
})

addTrait("Gardener", {
    name = "UI_trait_Gardener",
    description = "UI_trait_GardenerDesc",
    cost = 4,
    xp = {
        [Perks.Farming] = 2
    },
    recipes = { "Make Mildew Cure", "Make Flies Cure" },
})

addTrait("Jogger", {
    name = "UI_trait_Jogger",
    description = "UI_trait_JoggerDesc",
    cost = 4,
    xp = {
        [Perks.Sprinting] = 3
    },
})

addTrait("SlowHealer", {
    name = "UI_trait_SlowHealer",
    description = "UI_trait_SlowHealerDesc",
    cost = -2,
})

addTrait("SlowLearner", {
    name = "UI_trait_SlowLearner",
    description = "UI_trait_SlowLearnerDesc",
    cost = -6,
})

addTrait("SlowReader", {
    name = "UI_trait_SlowReader",
    description = "UI_trait_SlowReaderDesc",
    cost = -1,
})

--[[addTrait("NeedsMoreSleep", {
    name = "UI_trait_MoreSleep",
    description = "UI_trait_MoreSleepDesc",
    cost = -4,
    requiresSleepEnabled = true,
})]]

addTrait("Conspicuous", {
    name = "UI_trait_Conspicuous",
    description = "UI_trait_ConspicuousDesc",
    cost = -2,
    exclude = { "Inconspicuous" },
})

addTrait("Disorganized", {
    name = "UI_trait_Disorganized",
    description = "UI_trait_DisorganizedDesc",
    cost = -4,
})

addTrait("HighThirst", {
    name = "UI_trait_HighThirst",
    description = "UI_trait_HighThirstDesc",
    cost = -2,
})

addTrait("Illiterate", {
    name = "UI_trait_Illiterate",
    description = "UI_trait_IlliterateDesc",
    cost = -12,
    exclude = { "SlowReader", "FastReader" },
})

--[[addTrait("Insomniac", {
    name = "UI_trait_Insomniac",
    description = "UI_trait_InsomniacDesc",
    cost = -6,
    requiresSleepEnabled = true,
})]]

addTrait("Pacifist", {
    name = "UI_trait_Pacifist",
    description = "UI_trait_PacifistDesc",
    cost = -2,
})

addTrait("Thinskinned", {
    name = "UI_trait_ThinSkinned",
    description = "UI_trait_ThinSkinnedDesc",
    cost = -2,
})

addTrait("Smoker", {
    name = "UI_trait_Smoker",
    description = "UI_trait_SmokerDesc",
    cost = -2,
})

addTrait("Dextrous", {
    name = "UI_trait_Dexterous",
    description = "UI_trait_DexterousDesc",
    cost = 2,
    exclude = { "AllThumbs", "Dextrous2" },
})

addTrait("Dextrous2", {
    name = "UI_trait_Dexterous",
    description = "UI_trait_DexterousDesc",
    profession = true,
    exclude = { "AllThumbs" },
})

addTrait("AllThumbs", {
    name = "UI_trait_AllThumbs",
    description = "UI_trait_AllThumbsDesc",
    cost = -3,
})

addTrait("Desensitized", {
    name = "UI_trait_Desensitized",
    description = "UI_trait_DesensitizedDesc",
    profession = true,
    exclude = { "Hemophobic", "Cowardly", "Brave", "Agoraphobic", "Claustophobic", "AdrenalineJunkie" },
})

addTrait("WeakStomach", {
    name = "UI_trait_WeakStomach",
    description = "UI_trait_WeakStomachDesc",
    cost = -2,
})

addTrait("IronGut", {
    name = "UI_trait_IronGut",
    description = "UI_trait_IronGutDesc",
    cost = 3,
    exclude = { "WeakStomach" },
})

addTrait("Hemophobic", {
    name = "UI_trait_Hemophobic",
    description = "UI_trait_HemophobicDesc",
    cost = -3,
})

addTrait("Asthmatic", {
    name = "UI_trait_Asthmatic",
    description = "UI_trait_AsthmaticDesc",
    cost = -5,
})

addTrait("Cook", {
    name = "UI_trait_Cook",
    description = "UI_trait_CookDesc",
    cost = 5,
    xp = {
        [Perks.Cooking] = 2,
    },
    recipes = { "Make Cake Batter", "Make Pie Dough", "Make Bread Dough" },
    exclude = { "Cook2" },
})

addTrait("Cook2", {
    name = "UI_trait_Cook",
    description = "UI_trait_Cook2Desc",
    profession = true,
})

addTrait("Herbalist", {
    name = "UI_trait_Herbalist",
    description = "UI_trait_HerbalistDesc",
    cost = 6,
    recipes = { "Herbalist" },
})

addTrait("Brawler", {
    name = "UI_trait_BarFighter",
    description = "UI_trait_BarFighterDesc",
    cost = 8,
    xp = {
        [Perks.SmallBlunt] = 3,
        [Perks.Blunt] = 1,
    },
})

addTrait("Formerscout", {
    name = "UI_trait_Scout",
    description = "UI_trait_ScoutDesc",
    cost = 4,
    xp = {
        [Perks.Doctor] = 1,
        [Perks.PlantScavenging] = 1,
    },
})

addTrait("BaseballPlayer", {
    name = "UI_trait_PlaysBaseball",
    description = "UI_trait_PlaysBaseballDesc",
    cost = 7,
    xp = {
        [Perks.Blunt] = 3,
    },
})

addTrait("Hiker", {
    name = "UI_trait_Hiker",
    description = "UI_trait_HikerDesc",
    cost = 6,
    xp = {
        [Perks.PlantScavenging] = 2,
        [Perks.Trapping] = 1,
    },
    recipes = { "Make Stick Trap", "Make Snare Trap", "Make Wooden Cage Trap" },
})


addTrait("Hunter", {
    name = "UI_trait_Hunter",
    description = "UI_trait_HunterDesc",
    cost = 8,
    xp = {
        [Perks.Aiming] = 1,
        [Perks.Trapping] = 3,
        [Perks.Fishing] = 1,
        [Perks.PlantScavenging] = 1,
        [Perks.Sneak] = 2
    },
    recipes = { "Make Stick Trap", "Make Snare Trap", "Make Wooden Cage Trap", "Make Trap Box", "Make Cage Trap" },
})

addTrait("Gymnast", {
    name = "UI_trait_Gymnast",
    description = "UI_trait_GymnastDesc",
    cost = 6,
    xp = {
        [Perks.Lightfoot] = 2,
        [Perks.Nimble] = 2,
        [Perks.Sneak] = 2,
    },
})

addTrait("Mechanics", {
    name = "UI_trait_Mechanics",
    description = "UI_trait_MechanicsDesc",
    cost = 5,
    xp = {
        [Perks.Mechanics] = 2,
    },
    recipes = { "Basic Mechanics", "Intermediate Mechanics" },
    exclude = { "Mechanics2" },
})

addTrait("Mechanics2", {
    name = "UI_trait_Mechanics",
    description = "UI_trait_Mechanics2Desc",
    profession = true,
})

addTrait("Outdoorsman", {
    name = "UI_trait_outdoorsman",
    description = "UI_trait_outdoorsmandesc",
    profession = true
})

addTrait("Burglar", {
    name = "UI_trait_Burglar",
    description = "UI_trait_Burglar",
    profession = true,
})
