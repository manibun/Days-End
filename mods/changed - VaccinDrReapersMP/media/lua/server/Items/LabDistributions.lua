--------------------------------  PATCH -------------------------------------
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	


------------------------------ Books ------------------------------

-- All (General)
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "LabBooks.BkLaboratoryEquipment1");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 1);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "LabBooks.BkVirologyCourses1");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 1);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "LabBooks.BkChemistryCourse");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.1);

-- Bookstore
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "LabBooks.BkLaboratoryEquipment1");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 3);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "LabBooks.BkVirologyCourses1");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 3);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "LabBooks.BkChemistryCourse");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 1);

-- Post Office Storage
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, "LabBooks.BkLaboratoryEquipment1");
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, 1);
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, "LabBooks.BkVirologyCourses1");
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, 1);
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, "LabBooks.BkChemistryCourse");
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, 0.4);

------------------------------ Chemicals ------------------------------

---------- Ammonia

-- Medical Facilities

table.insert(ProceduralDistributions.list["BathroomCounter"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["BathroomCounter"].items, 10);
table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, 10);
table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, 15);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 10);
table.insert(ProceduralDistributions.list["ArmyStorageMedical"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["ArmyStorageMedical"].items, 20);
table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 20);
table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 10);
table.insert(ProceduralDistributions.list["CrateFertilizer"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["CrateFertilizer"].items, 10);
table.insert(ProceduralDistributions.list["CrateFertilizer"].items, "LabItems.ChAmmonia");
table.insert(ProceduralDistributions.list["CrateFertilizer"].items, 10);

-- Vehicles
table.insert(VehicleDistributions.DoctorTruckBed.items, "LabItems.ChAmmonia");
table.insert(VehicleDistributions.DoctorTruckBed.items, 20);

---------- Can of Hydrochloric Acid

table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 10);
table.insert(ProceduralDistributions.list["GarageTools"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["GarageTools"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 10);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 10);
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 10);
table.insert(ProceduralDistributions.list["JanitorMisc"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["JanitorMisc"].items, 8);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 8);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 8);

---------- Bag of Sodium Hydroxide

table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 10);
table.insert(ProceduralDistributions.list["GarageTools"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["GarageTools"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 10);
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 10);
table.insert(ProceduralDistributions.list["JanitorMisc"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["JanitorMisc"].items, 8);
table.insert(ProceduralDistributions.list["KitchenRandom"]["junk"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["KitchenRandom"]["junk"].items, 8);
table.insert(ProceduralDistributions.list["StoreCounterCleaning"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["StoreCounterCleaning"].items, 8);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 10);

---------- Can of Sulfuric Acid

table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 10);
table.insert(ProceduralDistributions.list["GarageTools"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["GarageTools"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 10);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorChemicals"].items, 10);
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 10);
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 10);
table.insert(ProceduralDistributions.list["JanitorMisc"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["JanitorMisc"].items, 8);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 8);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "LabItems.ChSulfuricAcidCan");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 8);

------------------------------ Items ------------------------------

---------- Syringe

-- Medical Facilities

table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, "LabItems.LabSyringe");
table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, 10);
table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, "LabItems.LabSyringe");
table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, 15);

-- Other Places

-- Procedural SuburbsDistributions
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.LabSyringe");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 30);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.LabSyringe");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 30);

-- Vehicles
table.insert(VehicleDistributions.SurvivalistTruckBed.items, "LabItems.LabSyringe");
table.insert(VehicleDistributions.SurvivalistTruckBed.items, 5);
table.insert(VehicleDistributions.DoctorTruckBed.items, "LabItems.LabSyringe");
table.insert(VehicleDistributions.DoctorTruckBed.items, 25);
table.insert(VehicleDistributions.DoctorTruckBed.items, "LabItems.LabSyringe");
table.insert(VehicleDistributions.DoctorTruckBed.items, 25);

---------- Syringe Pack

-- Medical Facilities
table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, "LabItems.LabSyringePack");
table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, 4);
table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, "LabItems.LabSyringePack");
table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, 10);

-- Procedural SuburbsDistributions
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "LabItems.LabSyringePack");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 10);

-- Vehicles
table.insert(VehicleDistributions.DoctorTruckBed.items, "LabItems.LabSyringePack");
table.insert(VehicleDistributions.DoctorTruckBed.items, 15);

---------- More Cotton Balls

table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Base.CottonBalls");
table.insert(ProceduralDistributions.list["BathroomCounter"].items, 7);
table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Base.CottonBalls");
table.insert(ProceduralDistributions.list["BathroomCounter"].items, 7);

table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "Base.CottonBalls");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "Base.CottonBalls");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, "Base.CottonBalls");
table.insert(ProceduralDistributions.list["StoreShelfMedical"].items, 20);

---------- More Safety Goggles

table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "Base.Glasses_SafetyGoggles");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 3);
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "Base.Glasses_SafetyGoggles");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 5);

---------- More Surgical Masks

table.insert(ProceduralDistributions.list["MedicalClinicOutfit"].items, "Base.Hat_SurgicalMask_Green");
table.insert(ProceduralDistributions.list["MedicalClinicOutfit"].items, 3);
table.insert(ProceduralDistributions.list["MedicalStorageOutfit"].items, "Base.Hat_SurgicalMask_Green");
table.insert(ProceduralDistributions.list["MedicalStorageOutfit"].items, 3);




-------------------------------- SuburbsDistributions -----------------------------------------------




------------------------------ Infected Blood ------------------------------
-- Zombies (36)
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "LabItems.MatInfectedBlood");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 32);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "LabItems.MatInfectedBlood");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 32);

-- Zombies (18)
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "LabItems.MatTaintedBlood");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 16);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "LabItems.MatTaintedBlood");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 16);

------------------------------ Books ------------------------------

-- All (General)
table.insert(SuburbsDistributions["all"]["sidetable"].items, "LabBooks.BkLaboratoryEquipment1");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "LabBooks.BkLaboratoryEquipment2");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.2);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "LabBooks.BkLaboratoryEquipment3");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "LabBooks.BkVirologyCourses1");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "LabBooks.BkVirologyCourses2");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.2);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "LabBooks.BkChemistryCourse");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);

------------------------------ Chemicals ------------------------------

---------- Ammonia

-- Medical Facilities
table.insert(SuburbsDistributions["all"]["medicine"].items, "LabItems.ChAmmonia");
table.insert(SuburbsDistributions["all"]["medicine"].items, 7);

-- Other Places
table.insert(SuburbsDistributions["FirstAidKit"].items, "LabItems.LabSyringe");
table.insert(SuburbsDistributions["FirstAidKit"].items, 20);

---------- Can of Hydrochloric Acid

table.insert(SuburbsDistributions["all"]["crate"].items, "LabItems.ChHydrochloricAcidCan");
table.insert(SuburbsDistributions["all"]["crate"].items, 4);

---------- Bag of Sodium Hydroxide

table.insert(SuburbsDistributions["all"]["crate"].items, "LabItems.ChSodiumHydroxideBag");
table.insert(SuburbsDistributions["all"]["crate"].items, 4);

---------- Can of Sulfuric Acid

table.insert(SuburbsDistributions["all"]["crate"].items, "LabItems.ChSulfuricAcidCan");
table.insert(SuburbsDistributions["all"]["crate"].items, 4);

------------------------------ Items ------------------------------

---------- Syringe

-- Medical Facilities
table.insert(SuburbsDistributions["all"]["medicine"].items, "LabItems.LabSyringe");
table.insert(SuburbsDistributions["all"]["medicine"].items, 6);
table.insert(SuburbsDistributions["all"]["medicine"].items, "LabItems.LabSyringe");
table.insert(SuburbsDistributions["all"]["medicine"].items, 6);

-- Other Places
table.insert(SuburbsDistributions["FirstAidKit"].items, "LabItems.LabSyringe");
table.insert(SuburbsDistributions["FirstAidKit"].items, 10);
table.insert(SuburbsDistributions["FirstAidKit"].items, "LabItems.LabSyringe");
table.insert(SuburbsDistributions["FirstAidKit"].items, 10);

---------- More Cotton Balls

table.insert(SuburbsDistributions["all"]["medicine"].items, "Base.CottonBalls");
table.insert(SuburbsDistributions["all"]["medicine"].items, 25);
table.insert(SuburbsDistributions["all"]["medicine"].items, "Base.CottonBalls");
table.insert(SuburbsDistributions["all"]["medicine"].items, 25);
