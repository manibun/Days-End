require "Definitions/AttachedWeaponDefinitions"

-- Gas Lantern on farmers and fishermen
AttachedWeaponDefinitions.gasLanternBelt = {
	chance = 30,
	outfit = {"Farmer", "Fisherman", "Hunter"},
	weaponLocation = {"Walkie Belt Left", "Walkie Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	-- ensureItem = "Base.HolsterSimple",
	weapons = {
		"filcher.GasLantern",
		"filcher.GasLanternEmpty",
	},
}

AttachedWeaponDefinitions.headTorch = {
	chance = 15,
	outfit = {"Bandit", "Fisherman", "Hunter"},
	weaponLocation = {"JawStab"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"filcher.HeadTorch",
	},
}

-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Farmer = {
	chance = 30;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.gasLanternBelt,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Fisherman = {
	chance = 30;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.gasLanternBelt,
		AttachedWeaponDefinitions.headTorch,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Hunter = {
	chance = 30;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.gasLanternBelt,
		AttachedWeaponDefinitions.headTorch,
		AttachedWeaponDefinitions.huntingRifleOnBack,
	},
}