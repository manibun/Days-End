---------------------------------------- Variables ----------------------------------------

local labTestMode = false;

local lastX = -1;
local lastY = -1;

local labEqupmentSquares = {}

-- Radius of blood aging
local bloodRadius = 14;

-- Blood Life in game minutes x 10
local bloodLife = {
	MatInfectedBlood = { Target = "MatTaintedBlood", Time = 3 },
	CmpSyringeWithBlood = { Target = "CmpSyringeWithTaintedBlood", Time = 12 },
	CmpSyringeReusableWithBlood = { Target = "CmpSyringeReusableWithTaintedBlood", Time = 12 },
	CmpTestTubeWithInfectedBlood = { Target = "CmpTestTubeWithTaintedBlood", Time = 12960 },
};

-- Vaciine effectiveness
local vaccineEffect = {
	CmpSyringeWithPlainVaccine = { Min = 0.15, Max = 0.86, CureChance = 5, InfectChance = 40, Time = 0, Strength = 0, AlbuminMin = 3, AlbuminDelta = 4, Recess = 0, },
	CmpSyringeWithQualityVaccine = { Min = 0.10, Max = 0.91, CureChance = 10, InfectChance = 10, Time = 168, Strength = 20, AlbuminMin = 5, AlbuminDelta = 5, Recess = 1, },
	CmpSyringeWithAdvancedVaccine = { Min = 0.05, Max = 0.96, CureChance = 15, InfectChance = 1, Time = 504, Strength = 65, AlbuminMin = 8, AlbuminDelta = 6, Recess = 2, },
	CmpSyringeWithCure = { Min = -1, Max = 0.99, CureChance = 105, InfectChance = 0, Time = 0, Strength = 0, AlbuminMin = 0, AlbuminDelta = 0, Recess = 0, },

	CmpSyringeReusableWithPlainVaccine = { Min = 0.15, Max = 0.86, CureChance = 5, InfectChance = 40, Time = 0, Strength = 0, AlbuminMin = 3, AlbuminDelta = 4, Recess = 0, },
	CmpSyringeReusableWithQualityVaccine = { Min = 0.10, Max = 0.91, CureChance = 10, InfectChance = 10, Time = 168, Strength = 20, AlbuminMin = 5, AlbuminDelta = 5, Recess = 1, },
	CmpSyringeReusableWithAdvancedVaccine = { Min = 0.05, Max = 0.96, CureChance = 15, InfectChance = 1, Time = 504, Strength = 65, AlbuminMin = 8, AlbuminDelta = 6, Recess = 2, },
	CmpSyringeReusableWithCure = { Min = -1, Max = 0.99, CureChance = 105, InfectChance = 0, Time = 0, Strength = 0, AlbuminMin = 0, AlbuminDelta = 0, Recess = 0, },

}

-- Chlorine tablets per water container
local chlorineDose = {
	Default = 3,
	LabFlaskWater = 1,
	WaterMug = 1,
	WaterBowl = 1,
	BeerWaterFull = 2,
	WaterBottleFull = 2,
	WaterPopBottle = 2,
	MayonnaiseWaterFull = 2,
	RemouladeWaterFull = 2,
	WhiskeyWaterFull = 2,
	WineWaterFull = 2,
	WaterBleachBottle = 3,
	WaterSaucepan = 3,
	FullKettle = 3,
	WaterPot = 3,
	WateredCanFull = 5,
	BucketWaterFull = 5,
	WaterPaintbucket = 5,
}

-- Morgue Table transmutations
local morgueTable = {
	location_community_medical_01_76 = { Top = true, East = true, Adj = "location_community_medical_01_77", Swap = "demonius_vaccine_01_72", Status = "Empty", },
	location_community_medical_01_77 = { Top = false, East = true, Adj = "location_community_medical_01_76", Swap = "demonius_vaccine_01_73", Status = "Empty", },
	location_community_medical_01_79 = { Top = true, East = false, Adj = "location_community_medical_01_78", Swap = "demonius_vaccine_01_75", Status = "Empty", },
	location_community_medical_01_78 = { Top = false, East = false, Adj = "location_community_medical_01_79", Swap = "demonius_vaccine_01_74", Status = "Empty", },
	demonius_vaccine_01_72 = { Top = true, East = true, Adj = "demonius_vaccine_01_73", Swap = "demonius_vaccine_01_76", Status = "Corpse", },
	demonius_vaccine_01_73 = { Top = false, East = true, Adj = "demonius_vaccine_01_72", Swap = "demonius_vaccine_01_77", Status = "Corpse", },
	demonius_vaccine_01_75 = { Top = true, East = false, Adj = "demonius_vaccine_01_74", Swap = "demonius_vaccine_01_79", Status = "Corpse", },
	demonius_vaccine_01_74 = { Top = false, East = false, Adj = "demonius_vaccine_01_75", Swap = "demonius_vaccine_01_78", Status = "Corpse", },
	demonius_vaccine_01_76 = { Top = true, East = true, Adj = "demonius_vaccine_01_77", Swap = "demonius_vaccine_01_80", Status = "Remains", },
	demonius_vaccine_01_77 = { Top = false, East = true, Adj = "demonius_vaccine_01_76", Swap = "demonius_vaccine_01_81", Status = "Remains", },
	demonius_vaccine_01_79 = { Top = true, East = false, Adj = "demonius_vaccine_01_78", Swap = "demonius_vaccine_01_83", Status = "Remains", },
	demonius_vaccine_01_78 = { Top = false, East = false, Adj = "demonius_vaccine_01_79", Swap = "demonius_vaccine_01_82", Status = "Remains", },
	demonius_vaccine_01_80 = { Top = true, East = true, Adj = "demonius_vaccine_01_81", Swap = "location_community_medical_01_76", Status = "Dirty", },
	demonius_vaccine_01_81 = { Top = false, East = true, Adj = "demonius_vaccine_01_80", Swap = "location_community_medical_01_77", Status = "Dirty", },
	demonius_vaccine_01_83 = { Top = true, East = false, Adj = "demonius_vaccine_01_82", Swap = "location_community_medical_01_79", Status = "Dirty", },
	demonius_vaccine_01_82 = { Top = false, East = false, Adj = "demonius_vaccine_01_83", Swap = "location_community_medical_01_78", Status = "Dirty", },
};

local morgueTableClear = {
	demonius_vaccine_01_72 = { Swap = "location_community_medical_01_76", },
	demonius_vaccine_01_73 = { Swap = "location_community_medical_01_77", },
	demonius_vaccine_01_75 = { Swap = "location_community_medical_01_79", },
	demonius_vaccine_01_74 = { Swap = "location_community_medical_01_78", },
}

---------------------------------------- Test ----------------------------------------

-- Print some test information
function LabRecipes_PrintTestInfo(player, obj)
	if not(labTestMode) then
		return;
	end--if
	if player then
		local body = player:getBodyDamage();
		local xp = player:getXp();
		print(string.format("--------- Player (%d) ---------",player:getPlayerNum()));
		print(string.format("Infected: %s",body:isInfected() and "True" or "False"));
		if body:isInfected() then
			print(string.format("Infection rate: %d",math.floor(LabRecipes_InfectionRate(player)*100)));
		end--if
		print(string.format("Doctor level: %d - %d ( x %1.1f )",player:getPerkLevel(Perks.Doctor),xp:getXP(Perks.Doctor),xp:getMultiplier(Perks.Doctor)));
		print("Albumnin doses left: ",not(player:getModData().AlbuminDoses) and "N/A" or player:getModData().AlbuminDoses);
		print("Vaccine recess: ",not(player:getModData().VaccineRecess) and "N/A" or player:getModData().VaccineRecess);
		print("Vaccine time: ",not(player:getModData().VaccineTime) and "N/A" or player:getModData().VaccineTime);
		print("Vaccine strength: ",not(player:getModData().VaccineStrength) and "N/A" or player:getModData().VaccineStrength);
	end--if
	if obj then
		print("---------- Object ----------");
		if instanceof(obj, "IsoObject") or instanceof(obj, "InventoryItem") or instanceof(obj, "IsoThumpable") then
			print("Mod Data:");
			for i, v in pairs(obj:getModData()) do
				print(string.format("--- %s = %s", tostring(i), tostring(v)));
			end--for
			if instanceof(obj, "IsoThumpable") then
				print("Sprite: ",obj:getSprite():getName());
			end--if
		end--if
	end--if
	print("-------------------------------");
end--function

-- Count items of ItemType in cell
function LabRecipes_CountCellItems(itemType)
	local cell = getWorld():getCell();
	local n = 0;
	for y = cell:getMinY(), cell:getMaxY() do
		for x = cell:getMinX(), cell:getMaxX() do
			for z = cell:getMinZ(), cell:getMaxZ() do
				local square = cell:getGridSquare(x,y,z);
				if square then
					local items = square:getObjects();
					for i = 0, items:size()-1 do
						local cnt = items:get(i):getContainer();
						if cnt then
							n = n+cnt:getItemCountRecurse(itemType);
                        end--if
					end--for
				end--if
			end--for
		end--for
	end--for
	return n;
end--function

-- Count Lab items in cell
function LabRecipes_PrintTestInfoItems()
	if not(labTestMode) then
		return;
	end--if
	local items = {
		"LabSyringe",
		"LabSyringereusable",
		"LabSyringePack",
		"ChAmmonia",
		"ChSodiumHydroxideBag",
		"ChHydrochloricAcidCan",
		"ChSulfuricAcidCan",
		"Plasticbag",
		"CottonBalls",
	};
	print("---------- Counting ----------");
	for _, v in ipairs(items) do
		print(v.." = "..LabRecipes_CountCellItems(v));
	end--for
	print("----------------------------------");
end--function

---------------------------------------- Common ----------------------------------------

-- Check if player position changed with accuracy of 1/100 of a square
-- Need this cause game spam OnTest events like hell
function LabRecipes_IsPlayerMoved(player)
	local newX = math.floor(player:getX()*100);
	local newY = math.floor(player:getY()*100);
	if newX == lastX and newY == lastY then
		return false;
	end--if
	lastX = newX;
	lastY = newY;
	return true;
end--function

-- Look if there is Equipment or Custom name object near Square
function LabRecipes_LookForNearEquipment(square, equipment, custom)
	local px = square:getX();
	local py = square:getY();
	local pz = square:getZ();
	for y = py-1, py+1 do
		for x = px-1, px+1 do
			local squareTest = getCell():getGridSquare(x, y, pz);
			if squareTest then
				for i = 0, squareTest:getObjects():size()-1 do
					local sp = squareTest:getObjects():get(i):getSprite():getProperties();
					if equipment and sp:Is("CustomItem") and sp:Val("CustomItem") == equipment then
						return squareTest;
					elseif custom and sp:Is("GroupName") and sp:Is("CustomName") and sp:Val("GroupName").." "..sp:Val("CustomName") == custom then
						return squareTest;
					end--if
				end--for
			end--if
		end--for
	end--for
	return nil;
end--function

-- Check for player movement and look for given equipment
function LabRecipes_IsNearLabEquip(equipment)
	local player = getPlayer();
	labEqupmentSquares.SkipCheck = not(LabRecipes_IsPlayerMoved(player)) and labEqupmentSquares.LastEquipment == equipment;
	if labEqupmentSquares.SkipCheck then
		return labEqupmentSquares[equipment];
	end--if
	labEqupmentSquares.LastEquipment = equipment;
	labEqupmentSquares[equipment] = LabRecipes_LookForNearEquipment(player:getCurrentSquare(), "LabItems."..equipment, nil);
	return labEqupmentSquares[equipment];
end--function

--- Count how many itemType drainable pieces in inventory
function LabRecipes_CountDrainablePieces(container, itemType)
	local items = container:getItems();
	local count = 0;
    if items then
		for i = 0, items:size()-1 do
			local item = items:get(i);
			if item then
				if item:getCategory() == "Container" then
					count = count+LabRecipes_CountDrainablePieces(item:getItemContainer(), itemType);
                elseif item:getType() == itemType then
					count = count+math.floor(item:getUsedDelta()/item:getUseDelta()+0.5);
				end--if
			end--if
		end--for
	end--if
	return count;
end--function

-- Transmutate bed
function LabRecipes_TransformBed(top, bottom, bed)
	top:setSpriteFromName(bed[top:getSprite():getName()].Swap);
	top:transmitUpdatedSpriteToServer();
	bottom:setSpriteFromName(bed[bottom:getSprite():getName()].Swap);
	bottom:transmitUpdatedSpriteToServer();
end--function

-- Normal random distribution
function LabRecipes_RandNorm(min, max, mean, dev)
	local u1 = ZombRandFloat(0.01,0.99);
	local u2 = ZombRandFloat(0.01,0.99);
	local rnd = mean*math.abs(1+math.sqrt(-2*(math.log(u1)))*math.cos(2*math.pi*u2)*dev);
	return min+math.floor(rnd/2*(max-min)+0.5);
end--function

---------------------------------------- Injection ----------------------------------------

-- Return zombie virus infection rate within 0..1 interval
function LabRecipes_InfectionRate(player)
	local body = player:getBodyDamage();
    return (player:getHoursSurvived()-body:getInfectionTime())/body:getInfectionMortalityDuration();
end--functoin

-- Cure player
function LabRecipes_CurePlayer(body)
	body:setInfected(false);
	body:setInfectionLevel(0);
	body:setInfectionMortalityDuration(-1);
	body:setInfectionTime(-1);
	local parts = body:getBodyParts();
	for i = 0, parts:size()-1 do
		parts:get(i):SetInfected(false);
	end--for
end--function

-- Inject a vaccine with a variety of results
function LabRecipes_DoInjection(player, vaccine)
	local body = player:getBodyDamage();
	local pMod = player:getModData();
	pMod.AlbuminDoses = 0;
	pMod.VaccineRecess = 0;
	pMod.VaccineTime = 0;
	pMod.VaccineStrength = 0;
	if body:isInfected() then
		if vaccine.CureChance > ZombRand(100) then
			LabRecipes_CurePlayer(body);
		else
			local rate = LabRecipes_InfectionRate(player);
			if rate > vaccine.Min and rate <= vaccine.Max then
				body:setInfectionTime(player:getHoursSurvived()-vaccine.Min*body:getInfectionMortalityDuration());
				if vaccine.AlbuminMin > 0 then
					player:getModData().AlbuminDoses = vaccine.AlbuminMin+ZombRand(vaccine.AlbuminDelta);
				end--if
				player:getModData().VaccineRecess = vaccine.Recess;
			end--if
		end--if
	elseif vaccine.InfectChance > ZombRand(100) then
		body:setInfected(true);
		body:setInfectionMortalityDuration(body:pickMortalityDuration());
		body:setInfectionTime(player:getHoursSurvived());
	else
		pMod.VaccineTime = vaccine.Time;
		pMod.VaccineStrength = vaccine.Strength;
	end--if
end--function

---------------------------------------- OnTest ----------------------------------------

-- Checks if there is Microscope near by
function LabRecipes_IsNearMicroscope(sourceItem, result)
	return LabRecipes_IsNearLabEquip("LabMicroscope") ~= nil;
end--function

-- Checks if there is Chromatograph with Computer near by
function LabRecipes_IsNearChromatographWithComputer(sourceItem, result)
	local square = LabRecipes_IsNearLabEquip("LabChromatograph");
	if not(square) then
		labEqupmentSquares.DesktopComputer = nil
	elseif square and not(labEqupmentSquares.SkipCheck) then
		labEqupmentSquares.DesktopComputer = LabRecipes_LookForNearEquipment(square, nil, "Desktop Computer");
	end--if
	return labEqupmentSquares.DesktopComputer ~= nil;
end--function

-- Checks if there is Spectrometer near by
function LabRecipes_IsNearSpectrometer(sourceItem, result)
	return LabRecipes_IsNearLabEquip("LabSpectrometer") ~= nil;
end--function

-- Checks if there is ChemistrySet near by, and we are using clear water
function LabRecipes_IsNearChemistrySet(sourceItem, result)
	if sourceItem:isWaterSource() and sourceItem:isTaintedWater() then
		return false;
	end--if
	return LabRecipes_IsNearLabEquip("LabChemistrySet") ~= nil;
end--function

-- Checks if there is Centrifuge near by
function LabRecipes_IsNearCentrifuge(sourceItem, result)
	return LabRecipes_IsNearLabEquip("LabCentrifuge") ~= nil;
end--function

-- Checks if there is Muffle Furnace near by
function LabRecipes_IsNearMuffleFurnace(sourceItem, result)
	return LabRecipes_IsNearLabEquip("LabMuffleFurnace") ~= nil;
end--function

-- Checks if there is Workbench near by
function LabRecipes_IsNearWorkbench(sourceItem, result)
	return LabRecipes_IsNearLabEquip("LabWorkbench") ~= nil;
end--function

-- Checks if there is Easel near by
function LabRecipes_IsNearEasel(sourceItem, result)
	return LabRecipes_IsNearLabEquip("LabEasel") ~= nil;
end--function

---------------------------------------- OnCreate ----------------------------------------

-- Embed infection rate into Syringe With Blood
function LabRecipes_ProcessBloodForAnalysis(items, result, player)
	result:getModData().IsInfected = player:getBodyDamage():isInfected();
	result:getModData().InfectionRate = LabRecipes_InfectionRate(player);
	player:getBodyDamage():ReduceGeneralHealth(5);
	LabRecipes_PrintTestInfo(player,result);
end--function

-- Change test result item if result is positive
function LabRecipes_CreateBloodTestResult(items, result, player)
	for i = 0, items:size()-1 do
		local item = items:get(i);
		if item:getType() == "CmpSyringeWithBlood" then
			if not(item:getModData().IsInfected) then
				player:getInventory():AddItem("LabItems.LabTestResultNegative");
			else
				local testResult = player:getInventory():AddItem("LabItems.LabTestResultPositive");
				testResult:setName(testResult:getName().." ("..math.floor(item:getModData().InfectionRate*100).."%)");
			end--if
		end--if
	end--for
end--function

-- Change test result item if result is positive Syringe Reusable
function LabRecipes_CreateBloodTestResultTwo(items, result, player)
	for i = 0, items:size()-1 do
		local item = items:get(i);
		if item:getType() == "CmpSyringeReusableWithBlood" then
			if not(item:getModData().IsInfected) then
				player:getInventory():AddItem("LabItems.LabTestResultNegative");
			else
				local testResult = player:getInventory():AddItem("LabItems.LabTestResultPositive");
				testResult:setName(testResult:getName().." ("..math.floor(item:getModData().InfectionRate*100).."%)");
			end--if
		end--if
	end--for
end--function

-- Select and inject the vaccine
function LabRecipes_InjectVaccine(items, result, player)
	for i = 0, items:size()-1 do
		local obj = items:get(i);
		if vaccineEffect[obj:getType()] then
			LabRecipes_DoInjection(player, vaccineEffect[obj:getType()]);
			return;
		end--if
	end--for
	LabRecipes_PrintTestInfo(player,result);
end--function

-- Adds dirty Flasks and Test Tubes on use
function LabRecipes_AddDirtyVials(items, result, player)
	local inv = player:getInventory();
	for i = 0, items:size()-1 do
		if string.find(items:get(i):getType(),"CmpTestTubeWith") then
			inv:AddItem("LabItems.LabTestTubeDirty");
		elseif string.find(items:get(i):getType(),"CmpFlaskWith") then
			inv:AddItem("LabItems.LabFlaskDirty");
		end--if
	end--for
end--function

-- Adds more items for centerifuge
function LabRecipes_AddMoreBloodComponents(items, result, player)
	player:getInventory():AddItem("LabItems.CmpFlaskWithBloodPlasma");
	LabRecipes_AddDirtyVials(items, result, player);
end--function

---------------------------------------- OnGiveXp ----------------------------------------

function LabRecipes_GiveXP_Small(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Woodwork, 3);
	player:getXp():AddXP(Perks.Electricity, 5);
end--function

function LabRecipes_GiveXP_Medium(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 6);
	player:getXp():AddXP(Perks.Electricity, 6);
end--function

function LabRecipes_GiveXP_Large(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.MetalWelding, 12);
	player:getXp():AddXP(Perks.Electricity, 12);
end--function

function LabRecipes_GiveXP_Woodwork_5(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Woodwork, 5);
end--function

function LabRecipes_GiveXP_Electricity_8(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Electricity, 8);
end--function

function LabRecipes_GiveXP_Electricity_8(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Electricity, 8);
end--function

function LabRecipes_GiveXP_Doctor_1(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Doctor, 1);
end--function

function LabRecipes_GiveXP_Doctor_2(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Doctor, 2);
end--function

function LabRecipes_GiveXP_Doctor_3(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Doctor, 3);
end--function

function LabRecipes_GiveXP_Doctor_5(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Doctor, 5);
end--function

function LabRecipes_GiveXP_Doctor_10(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Doctor, 10);
end--function

function LabRecipes_GiveXP_Doctor_15(recipe, ingredients, result, player)
	player:getXp():AddXP(Perks.Doctor, 15);
end--function

---------------------------------------- Inventory Context Menus ----------------------------------------

-- Cleaning tainted water
function LabRecipes_CMOnClearTaintedWater(item, player, items, tabletsNeed)
	ISInventoryPaneContextMenu.transferIfNeeded(player, item);
	ISInventoryPaneContextMenu.equipWeapon(item, true, false, player:getPlayerNum());
	ISTimedActionQueue.add(LabActionCleanWater:new(player, item, tabletsNeed));
end--function

-- Taking Albumin pills
function LabRecipes_CMOnTakeAlbuminPills(item, player, items)
	ISInventoryPaneContextMenu.transferIfNeeded(player, item);
	ISTimedActionQueue.add(LabActionTakeAlbumin:new(player, item));
end--function

-- Add some options to items menu
function LabRecipes_BuildInventoryCM(player, context, items)
	local item = nil;
	for _, v in ipairs(items) do
		if instanceof(v, "InventoryItem") then
			item = v
		else
			item = v.items[1];
		end--if
		if item:isWaterSource() then
			if item:isTaintedWater() then
				local tablets = LabRecipes_CountDrainablePieces(getSpecificPlayer(player):getInventory(), "CmpChlorineTablets");
				if tablets > 0 then
					local tabletsNeed = chlorineDose[item:getType()];
					if tabletsNeed == nil then
						tabletsNeed = chlorineDose.Default;
					end--if
					local option = context:addOption(getText("ContextMenu_LabClearWater"), item, LabRecipes_CMOnClearTaintedWater, getSpecificPlayer(player), items, tabletsNeed);
					local tooltip = ISInventoryPaneContextMenu.addToolTip();
					tooltip.description = getText("ContextMenu_LabClearWaterTooltip", string.format(" <%s> %d", tabletsNeed>tablets and "RED" or "GREEN", tabletsNeed), tablets);
					option.toolTip = tooltip;
					option.notAvailable = tabletsNeed>tablets;
				end--if
			end--if
		end--if
		if item:getType() == "CmpAlbuminPills" then
			context:addOption(getText("ContextMenu_Take_pills"), item, LabRecipes_CMOnTakeAlbuminPills, getSpecificPlayer(player), items);
		end--if
	end--if
end--function

---------------------------------------- World Context Menus ----------------------------------------

-- ...
local function predicateNotBroken(item)
	return not item:isBroken();
end--function

-- Put Corpse on table
function LabRecipes_WMOnPutCorpseOnTable(player, top, bottom, bed)
	if luautils.walkAdj(player, bottom:getSquare()) then
		ISTimedActionQueue.add(LabActionPutCorpseOnTable:new(player, top, bottom, bed));
	end--if
end--functoin

--- ...
local function wearIfNeeded(player, clothing)
	if not(player:isEquippedClothing(clothing)) then
		ISInventoryPaneContextMenu.wearItem(clothing, player:getPlayerNum());
	end--if
end--function

-- Make an Autopsy
function LabRecipes_WMOnCorpseAutopsy(player, corpse, square, top, bottom)
	if (corpse and luautils.walkAdj(player, corpse:getSquare())) or luautils.walkAdj(player, bottom:getSquare()) then
		local inv = player:getInventory();
		local mask = inv:getFirstTypeEvalRecurse("Hat_SurgicalMask_Blue", predicateNotBroken) or inv:getFirstTypeEvalRecurse("Hat_SurgicalMask_Green", predicateNotBroken) or inv:getFirstTypeEvalRecurse("Hat_DustMask", predicateNotBroken) or inv:getFirstTypeEvalRecurse("Hat_GasMask", predicateNotBroken) or inv:getFirstTypeEvalRecurse("Hat_BandanaMaskRed", predicateNotBroken) or inv:getFirstTypeEvalRecurse("Hat_BandanaMaskDesert", predicateNotBroken);
		local scalpel = inv:getFirstTypeEvalRecurse("Scalpel", predicateNotBroken);
		wearIfNeeded(player, mask);
		ISInventoryPaneContextMenu.equipWeapon(scalpel, true, false, player:getPlayerNum());
		ISTimedActionQueue.add(LabActionMakeAutopsy:new(player, corpse, square, top, bottom, morgueTable));
	end--if
end--fucntion

-- Grab remains from table
function LabRecipes_WMOnGrabRemainsFromTable(player, top, bottom, bed, target)
	if luautils.walkAdj(player, bottom:getSquare()) then
		ISTimedActionQueue.add(LabActionMorgueTableGetRemains:new(player, top, bottom, bed, target));
	end--if
end--function

-- Clear Morgue table
function LabRecipes_WMOnClearMorgueTable(player, top, bottom)
	if luautils.walkAdj(player, bottom:getSquare()) then
		local inv = player:getInventory();
		local rag = inv:getFirstTypeRecurse("DishCloth") or inv:getFirstTypeRecurse("BathTowel");
		local bleach = inv:getFirstTypeRecurse("Bleach");
		ISInventoryPaneContextMenu.transferIfNeeded(player, rag);
		ISInventoryPaneContextMenu.transferIfNeeded(player, bleach);
		ISInventoryPaneContextMenu.equipWeapon(rag, true, false, player:getPlayerNum());
		ISInventoryPaneContextMenu.equipWeapon(bleach, false, false, player:getPlayerNum());
		ISTimedActionQueue.add(LabActionMorgueTableClear:new(player, top, bottom, morgueTable));
	end--if
end--function

-- I feel... I feel better now... Why is there no hole in this wall?
function LabRecipes_GetObjValue(obj, field)
	local n = getNumClassFields(obj);
	for i = 0, n-1 do
		local meth = getClassField(obj, i);
		if string.find(tostring(meth), field) then
			return getClassFieldVal(obj, meth);
		end--if
	end--for
	return getPlayer():getHoursSurvived();
end--function

-- Get adjacent bed objects
function LabRecipes_GetBedObjects(source, bed)
	local curBed = bed[source:getSprite():getName()];
	local top = curBed.Top and source or nil;
	local bottom = not(curBed.Top) and source or nil;
	local x = curBed.East and (curBed.Top and 1 or -1) or 0;
	local y = curBed.East and 0 or (curBed.Top and 1 or -1);
	local sq = source:getSquare();
    local no = getCell():getGridSquare(sq:getX()+x, sq:getY()+y, sq:getZ()):getObjects();
	for i = 0, no:size()-1 do
		local obj = no:get(i);
		if instanceof(obj, "IsoThumpable") and obj:getSprite():getName() == curBed.Adj then
			if curBed.Top then
				bottom = obj;
			else
				top = obj;
			end--if
			break;
		end--if
	end--for
	return top, bottom, curBed.Status;
end--function

-- Add check line to Option tooltip
function LabRecipes_CreateCheckTooltip(option, inventory, moduleName, itemTypes, count, noBroken)
	local n = 0;
	for _, v in ipairs(itemTypes) do
		if noBroken then
			n = n+inventory:getCountTypeEvalRecurse(v,predicateNotBroken);
		else
			n = n+inventory:getItemCountRecurse(v);
		end--if
	end--for
	local s = moduleName.."."..itemTypes[1];
	if count == 1 then
		option.toolTip.description = option.toolTip.description..string.format(" -  <%s> %s <RGB:1,1,1> <LINE>", (n<count) and "RED" or "GREEN", getItemNameFromFullType(s));
	else
		option.toolTip.description = option.toolTip.description..string.format(" -  <%s> %s ( %d / %d ) <RGB:1,1,1> <LINE>", (n<count) and "RED" or "GREEN", getItemNameFromFullType(s), math.min(n,count), count);
	end--if
	return n >= count;
end--function

-- Create corpse autopsy option tooltip
function LabRecipes_CreateCorpseAutopsyTooltip(option, inventory, notFresh, notZombie, notOrgans)
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	option.toolTip = tooltip;
	tooltip.description = tooltip.description..string.format("%s:  <%s> %s12 %s <LINE> <RGB:1,1,1>", getText("ContextMenu_LabCorpseAge"), notFresh and "RED" or "GREEN", notFresh and ">" or "<", getText("ContextMenu_LabHrs"));
	tooltip.description = tooltip.description..string.format("%s:  <%s> %s <LINE> <RGB:1,1,1>", getText("ContextMenu_LabWasZombie"), notZombie and "RED" or "GREEN", notZombie and getText("ContextMenu_LabNo") or getText("ContextMenu_LabYes"));
	tooltip.description = tooltip.description..string.format("%s:  <%s> %s <LINE> <RGB:1,1,1>", getText("ContextMenu_LabAutopsyDone"), notOrgans and "RED" or "GREEN", notOrgans and getText("ContextMenu_LabYes") or getText("ContextMenu_LabNo"));
	tooltip.description = tooltip.description..getText("ContextMenu_LabMustHaveItems");
	local ok = true;
	ok = LabRecipes_CreateCheckTooltip(option, inventory, "Base", {"Hat_DustMask","Hat_SurgicalMask_Blue", "Hat_SurgicalMask_Green","Hat_BandanaMaskRed","Hat_BandanaMaskDesert","Hat_GasMask"}, 1, true) and ok;
	ok = LabRecipes_CreateCheckTooltip(option, inventory, "Base", {"Scalpel"}, 1, true) and ok;
	ok = LabRecipes_CreateCheckTooltip(option, inventory, "Base", {"Tweezers"}, 1) and ok;
	option.notAvailable = notFresh or notZombie or notOrgans or not(ok);
end--function

--- Create common style tooltip
function LabRecipes_CreateCommonTooltip(option)
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	option.toolTip = tooltip;
	tooltip.description = tooltip.description..getText("ContextMenu_LabMustHaveItems");
end--function

-- Add some options to world menu
function LabRecipes_BuildZombieWM(playerNum, context, worldobjects, test)
	if test and ISWorldObjectContextMenu.Test then
		return true;
	end--if
	local player = getSpecificPlayer(playerNum);
	local inv = player:getInventory();
	local square = player:getCurrentSquare();
	local subMenu = nil;
	if labTestMode then
		context:addOption(getText("ContextMenu_LabTestInfo"), player, LabRecipes_PrintTestInfo, nil);
		context:addOption(getText("ContextMenu_LabTestInfoItems"), nil, LabRecipes_PrintTestInfoItems, nil);
	end--if
	for _, v in ipairs(worldobjects) do
		local sq = v:getSquare();
		if sq then
			for i = 0, sq:getObjects():size()-1 do
				local obj = sq:getObjects():get(i);
				if instanceof(obj, "IsoThumpable") and morgueTable[obj:getSprite():getName()] then
					local top, bottom, stat = LabRecipes_GetBedObjects(obj, morgueTable);
					if top and bottom then
						if stat == "Empty" and (inv:contains("CorpseMale") or inv:contains("CorpseFemale")) then
							context:addOption(getText("ContextMenu_LabPutCorpseOnTable"), player, LabRecipes_WMOnPutCorpseOnTable, top, bottom, morgueTable);
						elseif stat == "Corpse" or stat == "Remains" then
							local whichTable = morgueTable;
							if stat == "Corpse" then
								local notFresh = true;
								if top:getModData().DeathTime then
									notFresh = top:getModData().Skeleton or player:getHoursSurvived()-top:getModData().DeathTime > 12;
								end--if
								local notZombie = not(top:getModData().Zombie);
								local notOrgans = top:getModData().Autopsy;
								local option = context:addOption(getText("ContextMenu_LabCorpseAutopsy"), player, LabRecipes_WMOnCorpseAutopsy, nil, top:getSquare(), top, bottom);
								LabRecipes_CreateCorpseAutopsyTooltip(option, inv, notFresh, notZombie, notOrgans);
								whichTable = morgueTableClear;
							end--if
							local option = context:addOption(getText("ContextMenu_LabPutRemainsIntoSack"), player, LabRecipes_WMOnGrabRemainsFromTable, top, bottom, whichTable, "sack");
							LabRecipes_CreateCommonTooltip(option);
							local ok = LabRecipes_CreateCheckTooltip(option, inv, "Base", {"Garbagebag"}, 1);
							option.toolTip.description = option.toolTip.description..getText("ContextMenu_LabMustHaveItemsOr").." <LINE>";
							ok = LabRecipes_CreateCheckTooltip(option, inv, "Base", {"EmptySandbag"}, 1) or ok;
							option.toolTip.description = option.toolTip.description..getText("ContextMenu_LabMustHaveItemsOr").." <LINE>";
							ok = LabRecipes_CreateCheckTooltip(option, inv, "Base", {"FertilizerEmpty"}, 1) or ok;
							option.notAvailable = not(ok);
							local option = context:addOption(getText("ContextMenu_LabPutRemainsIntoBags"), player, LabRecipes_WMOnGrabRemainsFromTable, top, bottom, whichTable, "bags");
							LabRecipes_CreateCommonTooltip(option);
							option.notAvailable = not(LabRecipes_CreateCheckTooltip(option, inv, "Base", {"Plasticbag"}, 2));
						elseif stat == "Dirty" then
							local option = context:addOption(getText("ContextMenu_LabClearMorgueTable"), player, LabRecipes_WMOnClearMorgueTable, top, bottom, morgueTable);
							LabRecipes_CreateCommonTooltip(option);
							local ok = LabRecipes_CreateCheckTooltip(option, inv, "Base", {"Bleach"}, 1);
							option.toolTip.description = option.toolTip.description..getText("ContextMenu_LabMustHaveItemsAnd").." <LINE>";
							local ok2 = LabRecipes_CreateCheckTooltip(option, inv, "Base", {"DishCloth"}, 1);
							option.toolTip.description = option.toolTip.description..getText("ContextMenu_LabMustHaveItemsOr").." <LINE>";
							ok2 = LabRecipes_CreateCheckTooltip(option, inv, "Base", {"BathTowel"}, 1) or ok2;
							option.notAvailable = not(ok and ok2);
						end--if
					end--if
				end--if
			end--for
			for y = sq:getY()-1, sq:getY()+1 do
				for x = sq:getX()-1, sq:getX()+1 do
					local square = getCell():getGridSquare(x, y, sq:getZ());
					if not(square) then
						break;
					end--if
					for i = 0, square:getStaticMovingObjects():size()-1 do
						local obj = square:getStaticMovingObjects():get(i);
						if instanceof(obj, "IsoDeadBody") then
							if not(subMenu) then
								subMenu = ISContextMenu:getNew(context);
								context:addSubMenu(context:addOption(getText("ContextMenu_LabCorpseAutopsy"), worldobjects, nil), subMenu);
							end--if
							local notFresh = obj:isSkeleton() or player:getHoursSurvived()-LabRecipes_GetObjValue(obj, "deathTime") > 12;
							local notZombie = not(obj:isZombie());
							local notOrgans = obj:getModData().Autopsy;
							local option = subMenu:addOption(getText("ContextMenu_LabCorpse"), player, LabRecipes_WMOnCorpseAutopsy, obj, square, nil, nil);
							LabRecipes_CreateCorpseAutopsyTooltip(option, inv, notFresh, notZombie, notOrgans);
						end--if
					end--for
				end--for
			end--for
		end--if
		break;
	end--for
end--function

---------------------------------------- Blood Aging ----------------------------------------

-- Update Blood age, container could be either "floor" or container object
function LabRecipes_UpdateBloodAge(item, container, square)
	obj = bloodLife[item:getType()];
	if obj then
		if item:getModData().Condition == nil then
			item:getModData().Condition = obj.Time;
		else
			item:getModData().Condition = item:getModData().Condition-1;
			if item:getModData().Condition <= 0 then
				if container == "floor" then
					local temp = item:getWorldItem();
					square:transmitRemoveItemFromSquare(temp);
					temp:removeFromSquare();
					square:AddWorldInventoryItem(InventoryItemFactory.CreateItem("LabItems."..obj.Target), 0.5, 0.5, 0);
				else
					container:DoRemoveItem(item);
					container:removeItemOnServer(item);
					local temp = container:AddItem("LabItems."..obj.Target);
					container:addItemOnServer(temp);
				end--if
			end--if
		end--if
	end--if
end--fucntion

-- Check container for Blood
function LabRecipes_LookForBloodInContainer(container)
	local items = container:getItems();
    if items then
		for i = 0, items:size()-1 do
			local item = items:get(i);
			if item then
				if item:getCategory() == "Container" then
					LabRecipes_LookForBloodInContainer(item:getItemContainer());
                else
					LabRecipes_UpdateBloodAge(item, container, nil);
				end--if
			end--if
		end--for
	end--if
end--funtion

-- Aging blood (missing cars and frige freezers for now)
function LabRecipes_AdjustBloodCondition()
	local cell = getWorld():getCell();
	if getPlayer() ~= nil and getPlayer():getCurrentSquare() ~= nil then
		local square = getPlayer():getCurrentSquare();
		if cell and square then
			local px = square:getX();
			local py = square:getY();
			local pz = square:getZ();
			LabRecipes_LookForBloodInContainer(getPlayer():getInventory());
			for z = math.max(pz-1,cell:getMinZ()), math.min(pz+1,cell:getMaxZ()) do
				for y = py-bloodRadius, py+bloodRadius do
					for x = px-bloodRadius, px+bloodRadius do
						local squareTest = getCell():getGridSquare(x, y, z);
						if squareTest then
							local items = squareTest:getObjects();
							if items and items:size()>0 then
								for i = 0, items:size()-1 do
									if items:get(i):getContainer() then
										LabRecipes_LookForBloodInContainer(items:get(i):getContainer());
									end--if
								end--for
							end--if
													
							items = squareTest:getStaticMovingObjects();
							if items and items:size()>0 then
								for i = 0, items:size()-1 do
									if items:get(i):getContainer() then
										LabRecipes_LookForBloodInContainer(items:get(i):getContainer());
									end--if
								end--for
							end--if
							items = squareTest:getWorldObjects();
							if items and items:size()>0 then
								for i = 0, items:size()-1 do
									local item = items:get(i);
									if item then
										if item:getItem():getCategory() == "Container" then
											LabRecipes_LookForBloodInContainer(item:getItem():getItemContainer());
										else
											LabRecipes_UpdateBloodAge(item:getItem(), "floor", squareTest);
										end--if
									end--if
								end--for
							end--if
						end--if
					end--for
				end--for
			end--for
		end--if
	end--if
end--function

-- Check vaccine effects
function LabRecipes_AdjustPlayerHealth()
	if getPlayer() ~= nil and getPlayer():getBodyDamage() ~= nil and getPlayer():getModData() ~=nil then
		local body = getPlayer():getBodyDamage();
		local pMod = getPlayer():getModData();
		if body:isInfected() then
			if pMod.VaccineRecess and pMod.VaccineRecess > 0 and LabRecipes_InfectionRate(getPlayer())>0.4 then
				pMod.VaccineRecess = pMod.VaccineRecess - 1;
				body:setInfectionTime(body:getInfectionTime()+body:getInfectionMortalityDuration()*LabRecipes_RandNorm(0, 30, 1.1, 0.35)/100);
			end--if
			if pMod.VaccineTime and pMod.VaccineTime > 0 then
				pMod.VaccineTime = 0;
				if pMod.VaccineStrength > ZombRand(100) then
					LabRecipes_CurePlayer(body);
				end--if
			end--if
		end--if
		if pMod.VaccineTime and pMod.VaccineTime > 0 then
			pMod.VaccineTime = pMod.VaccineTime-1;
		end--if
	end --if
end--function

---------------------------------------- Events ----------------------------------------

Events.EveryTenMinutes.Add(LabRecipes_AdjustBloodCondition);
Events.EveryHours.Add(LabRecipes_AdjustPlayerHealth);
Events.OnFillInventoryObjectContextMenu.Add(LabRecipes_BuildInventoryCM);
Events.OnFillWorldObjectContextMenu.Add(LabRecipes_BuildZombieWM);
