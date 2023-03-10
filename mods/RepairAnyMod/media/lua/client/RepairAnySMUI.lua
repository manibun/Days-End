if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end

-- Adjust items to be repairable
TweakItem("SMUIClothing.NBCSuit", "FabricType", "Leather");
TweakItem("SMUIClothing.NBCSuitHood", "FabricType", "Leather");
TweakItem("SMUIClothing.Trousers_NBCPants", "FabricType", "Leather");
TweakItem("SMUIClothing.Gloves_HazmatGloves", "FabricType", "Leather");
TweakItem("SMUIClothing.Shoes_HazmatBoots", "FabricType", "Leather");
TweakItem("SMUIClothing.Vest_ODGreen", "FabricType", "Leather");
TweakItem("SMUIClothing.Vest_RangerBodyArmorWoodland", "FabricType", "Leather");
TweakItem("SMUIClothing.Vest_RangerBodyArmorDesert", "FabricType", "Leather");
TweakItem("SMUIClothing.Vest_MilitaryTacticalVest", "FabricType", "Leather");
TweakItem("SMUIClothing.Vest_MilitaryTankerVest", "FabricType", "Leather");