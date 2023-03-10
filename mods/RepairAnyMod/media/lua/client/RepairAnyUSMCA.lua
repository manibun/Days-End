if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end

-- Adjust items to be repairable
TweakItem("Base.Interceptor_Armor", "FabricType", "Leather");
TweakItem("Base.Interceptor_Armor_s", "FabricType", "Leather");
TweakItem("Base.Interceptor_Armor_v", "FabricType", "Leather");