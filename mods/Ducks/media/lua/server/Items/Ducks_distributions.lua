Distributions = Distributions or {};

-- Function made by star -- 
local function AddProcLoot(proc_name, item_name, chance)
	local data = ProceduralDistributions.list
	if not data then
		 return print('Ducks ERROR: procedure distributions not found!')
	end
	local c = data[proc_name];
	if not c then
		 return print('Ducks ERROR: cant add '..item_name..' to procedure '..proc_name)
	end
	table.insert(c.items, item_name);
	table.insert(c.items, chance);

end

local function AddDistLoot(dist_name, item_name, chance)
	local data = SuburbsDistributions
	if not data then
		 return print('Ducks ERROR: SuburbsDistributions not found!')
	end
	local d = data["all"][dist_name];
	if not d then
		 return print('Ducks ERROR: cant add '..item_name..' to SuburbsDistributions '..dist_name)
	end
	table.insert(d.items, item_name);
	table.insert(d.items, chance);
end

-- Distributions

--						------- Container Loot -------

--						------- Ducks -------
--						------- Black Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Black", 0.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Black", 0.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Black", 0.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Black", 0.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Black", 0.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Black", 0.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Black", 0.1);

--						------- Blue Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Blue", 1.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Blue", 1.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Blue", 1.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Blue", 1.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Blue", 1.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Blue", 1.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Blue", 0.2);

--						------- Gold Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Gold", 0.1);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Gold", 0.1);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Gold", 0.1);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Gold", 0.1);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Gold", 0.1);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Gold", 0.1);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Gold", 0.1);

--						------- Green Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Green", 1.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Green", 1.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Green", 1.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Green", 1.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Green", 1.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Green", 1.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Green", 0.2);

--						------- Orange Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Orange", 1.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Orange", 1.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Orange", 1.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Orange", 1.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Orange", 1.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Orange", 1.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Orange", 0.2);

--						------- Pink Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Pink", 1.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Pink", 1.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Pink", 1.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Pink", 1.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Pink", 1.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Pink", 1.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Pink", 0.2);

--						------- Purple Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Purple", 1.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Purple", 1.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Purple", 1.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Purple", 1.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Purple", 1.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Purple", 1.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Purple", 0.2);

--						------- Rainbow Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Rainbow", 0.01);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Rainbow", 0.01);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Rainbow", 0.01);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Rainbow", 0.01);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Rainbow", 0.01);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Rainbow", 0.01);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Rainbow", 0.01);

--						------- Red Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_Red", 1.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_Red", 1.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_Red", 1.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_Red", 1.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_Red", 1.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_Red", 1.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_Red", 0.2);

--						------- White Rubber Duck -------

AddProcLoot("BathroomCounter", 				"Ducks.Rubberducky_White", 0.5);
AddProcLoot("BathroomCounterNoMeds", 		"Ducks.Rubberducky_White", 0.5);
AddProcLoot("BathroomCabinet", 				"Ducks.Rubberducky_White", 0.5);
AddProcLoot("BathroomShelf", 				"Ducks.Rubberducky_White", 0.5);
AddProcLoot("PetShopShelf", 				"Ducks.Rubberducky_White", 0.5);
AddProcLoot("CratePetSupplies", 			"Ducks.Rubberducky_White", 0.5);
AddProcLoot("CrateRandomJunk", 				"Ducks.Rubberducky_White", 0.1);

--						------- Clothing -------
--						------- Duck Tshirt -------

AddProcLoot("BedroomDresser", 				"Ducks.Tshirt_DuckDECAL", 2.5);
AddProcLoot("DresserGeneric", 				"Ducks.Tshirt_DuckDECAL", 3);
AddProcLoot("WardrobeWoman", 				"Ducks.Tshirt_DuckDECAL", 2.5);
AddProcLoot("CrateClothesRandom", 			"Ducks.Tshirt_DuckDECAL", 2.5);
AddProcLoot("GymLockers", 					"Ducks.Tshirt_DuckDECAL", 0.5);
AddProcLoot("LaundryLoad1", 				"Ducks.Tshirt_DuckDECAL", 3);
AddProcLoot("LaundryLoad7", 				"Ducks.Tshirt_DuckDECAL", 3);
AddProcLoot("LaundryLoad8", 				"Ducks.Tshirt_DuckDECAL", 3);
AddProcLoot("Locker", 						"Ducks.Tshirt_DuckDECAL", 0.2);

--						------- Zed Loot -------

--						------- Ducks -------
--						------- Zed Rubber Duck -------

AddDistLoot("inventoryfemale",				"Ducks.Rubberducky_Zed", 0.01);
AddDistLoot("inventorymale",				"Ducks.Rubberducky_Zed", 0.01);