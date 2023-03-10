require 'Items/SuburbsDistributions'
require 'Items/ProceduralDistributions'

--[[
--Bag_SurvivorBag
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, "filcher.Flare");
table.insert(SuburbsDistributions["Bag_SurvivorBag"].items, 1);
]]--

--Bag_BigHikingBag
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "filcher.GasLantern");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 0.2);

--Camping Store Gear
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "filcher.GasLanternEmpty");
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 2);
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "filcher.GasLanternEmpty");
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 2);
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, "filcher.HeadTorch");
table.insert(ProceduralDistributions.list["CampingStoreGear"].items, 0.5);

--Crate
table.insert(SuburbsDistributions["all"]["crate"].items, "filcher.GasLanternEmpty");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.05);

--Crate Camping
table.insert(ProceduralDistributions.list["CrateCamping"].items, "filcher.GasLanternEmpty");
table.insert(ProceduralDistributions.list["CrateCamping"].items, 2);
table.insert(ProceduralDistributions.list["CrateCamping"].items, "filcher.HeadTorch");
table.insert(ProceduralDistributions.list["CrateCamping"].items, 0.25);

--CrateTools
table.insert(ProceduralDistributions.list["CrateTools"].items, "filcher.GasLanternEmpty");
table.insert(ProceduralDistributions.list["CrateTools"].items, 0.5);

--GigamartTools
table.insert(ProceduralDistributions.list["GigamartTools"].items, "filcher.GasLanternEmpty");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 0.1);

--Metal Shelves
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "filcher.GasLanternEmpty");
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 0.2);