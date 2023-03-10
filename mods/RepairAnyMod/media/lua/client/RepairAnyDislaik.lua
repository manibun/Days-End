if getActivatedMods():contains("ItemTweakerAPI") then
	require("ItemTweaker_Core");
else return end

-- Adjust items to be repairable
TweakItem("Dislaik.Gloves_Tactical", "FabricType", "Leather");
TweakItem("Dislaik.LowerArms_ElbowPads", "FabricType", "Leather");
TweakItem("Dislaik.LowerLegs_KneePads", "FabricType", "Leather");
TweakItem("Dislaik.LowerLegs_BallisticKneePads", "FabricType", "Leather");
TweakItem("Dislaik.UpperArms_BallisticShoulderPads", "FabricType", "Leather");
TweakItem("Dislaik.UpperLegs_BallisticThighPads", "FabricType", "Leather");
TweakItem("Dislaik.Vest_LightweightBallistic", "FabricType", "Leather");
TweakItem("Dislaik.Vest_Ballistic", "FabricType", "Leather");
TweakItem("Dislaik.Vest_SWATBulletproofVest", "FabricType", "Leather");
