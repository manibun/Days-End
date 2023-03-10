require 'Vehicles/VehicleDistributions'

--Fisherman
table.insert(VehicleDistributions["FishermanTruckBed"].items, "filcher.GasLantern");
table.insert(VehicleDistributions["FishermanTruckBed"].items, 0.75);
table.insert(VehicleDistributions["FishermanTruckBed"].items, "filcher.Flare");
table.insert(VehicleDistributions["FishermanTruckBed"].items, 0.75);

--Police
table.insert(VehicleDistributions["Police"]["TruckBed"].items, "filcher.Flare");
table.insert(VehicleDistributions["Police"]["TruckBed"].items, 1);

--Ranger
table.insert(VehicleDistributions["RangerTruckBed"].items, "filcher.GasLantern");
table.insert(VehicleDistributions["RangerTruckBed"].items, 0.75);
table.insert(VehicleDistributions["RangerTruckBed"].items, "filcher.Flare");
table.insert(VehicleDistributions["RangerTruckBed"].items, 1);

--Survivalist
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "filcher.GasLantern");
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 1);
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, "filcher.Flare");
table.insert(VehicleDistributions["SurvivalistTruckBed"].items, 0.75);

--trunk standard
table.insert(VehicleDistributions["TrunkStandard"].items, "filcher.Flare");
table.insert(VehicleDistributions["TrunkStandard"].items, 0.2);

--trunk heavy
table.insert(VehicleDistributions["TrunkHeavy"].items, "filcher.GasLantern");
table.insert(VehicleDistributions["TrunkHeavy"].items, 0.6);
table.insert(VehicleDistributions["TrunkHeavy"].items, "filcher.Flare");
table.insert(VehicleDistributions["TrunkHeavy"].items, 0.4);