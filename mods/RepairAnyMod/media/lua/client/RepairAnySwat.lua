if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end

-- Adjust items to be repairable
TweakItem("Base.SWATPad", "FabricType", "Leather");
TweakItem("Base.SwatElbowPads", "FabricType", "Leather");
TweakItem("Base.SwatKneePads", "FabricType", "Leather");
TweakItem("Base.Vest_BulletSwat", "FabricType", "Leather");
TweakItem("Base.AntibombSuit", "FabricType", "Leather");
TweakItem("Base.AntibombSuitP2", "FabricType", "Leather");
