require "Definitions/AttachedWeaponDefinitions"

-- additions to existing categories
table.insert(AttachedWeaponDefinitions["knifeLowQualityBack"].weapons, "Base.SmashedBottle");
table.insert(AttachedWeaponDefinitions["knifeLowQualityShoulder"].weapons, "Base.SmashedBottle");
table.insert(AttachedWeaponDefinitions["knifeLowQualityStomach"].weapons, "Base.SmashedBottle");

table.insert(AttachedWeaponDefinitions["bladeInBack"].weapons, "Base.BaseballBat");
table.insert(AttachedWeaponDefinitions["bladeInBack"].weapons, "Base.BaseballBatNails");

--molotov in belt
AttachedWeaponDefinitions.molotovBelt = {
	chance = 15,
	outfit = {"Bandit"},
	weaponLocation = {"MeatCleaver Belt Left, MeatCleaver Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Molotov",
	},
}


-- umbrellas in stomach
AttachedWeaponDefinitions.umbrellaStomach = {
	chance = 1,
	weaponLocation = {"Stomach"},
	bloodLocations = {"Torso_Lower","Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"Base.ClosedUmbrellaBlue",
		"Base.ClosedUmbrellaRed",
		"Base.ClosedUmbrellaBlack",
		"Base.ClosedUmbrellaWhite",
		"filcher.ClosedUmbrellaPink",
		"filcher.WalkingCane",
	},
}

-- Crosses for priests
AttachedWeaponDefinitions.crossBack = {
	chance = 30,
	outfit = {"Priest"},
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	-- ensureItem = "Base.HolsterSimple",
	weapons = {
		"filcher.WoodenCross",
	},
}

AttachedWeaponDefinitions.crossBelt = {
	chance = 30,
	outfit = {"Priest"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	-- ensureItem = "Base.HolsterSimple",
	weapons = {
		"filcher.WoodenCross",
	},
}

-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Priest = {
	chance = 30;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.crossBack,
		AttachedWeaponDefinitions.crossBelt,
	},
}