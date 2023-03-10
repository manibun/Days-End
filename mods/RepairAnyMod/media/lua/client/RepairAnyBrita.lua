if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end

-- Adjust items to be repairable
TweakItem("Base.Armor_Defender", "FabricType", "Leather");
TweakItem("Base.Bag_Plate_Carrier", "FabricType", "Leather");
TweakItem("Base.Armor_6B13", "FabricType", "Leather");
TweakItem("Base.Suit_Chempak", "FabricType", "Leather");