require "ExpandedHelicopter_Flares"

EHE_Recipe = {}

function EHE_Recipe.CanOpenBoxes(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("CanOpenBoxes"))
end

--recipe, result
function EHE_Recipe.FOOD(_, _, player)
	player:getInventory():AddItems("EHE.EmergencyWaterRation", 5)
	player:getInventory():AddItems("EHE.MealReadytoEat", 5)
end

---@param player IsoGameCharacter | IsoMovingObject
function EHE_Recipe.MEDICAL(_, _, player)
	player:getInventory():AddItems("Hat_SurgicalMask_Blue", 6)
	player:getInventory():AddItems("Gloves_Surgical", 6)
	local items = player:getInventory():AddItems("Base.FirstAidKit", 1)

	for i=0, items:size()-1 do
		rollInventoryContainer(items:get(i), player)
	end
end

function EHE_Recipe.SURVIVAL(_, _, player)
	player:getInventory():AddItems("Base.Torch", 2)
	player:getInventory():AddItems("Base.Battery", 12)
	player:getInventory():AddItems("Radio.RadioBlack", 2)
	player:getInventory():AddItems("EHE.HandFlare", 2)
end

function EHE_Recipe.STASHBOX(_, _, player)
	player:getInventory():AddItems("WhiskeyFull", 1)
	player:getInventory():AddItems("Cigarettes", 4)
	player:getInventory():AddItems("Lighter", 2)
	player:getInventory():AddItems("HottieZ", 13)
	player:getInventory():AddItems("EHE.ProteinBar", 5)
end

function EHE_Recipe.SURVIVORMEDICAL(_, _, player)
	player:getInventory():AddItems("EHE.HandFlare", 2)
	player:getInventory():AddItems("Hat_SurgicalMask_Blue", 2)
	player:getInventory():AddItems("Gloves_Surgical", 2)
	local items = player:getInventory():AddItems("Base.FirstAidKit", 1)

	for i=0, items:size()-1 do
		rollInventoryContainer(items:get(i), player)
	end
end

function EHE_Recipe.SURVIVORFOOD(_, _, player)
	player:getInventory():AddItems("CannedPotato", 2)
	player:getInventory():AddItems("CannedCarrots", 2)
	player:getInventory():AddItems("CannedCabbage", 2)
	player:getInventory():AddItems("CannedTomato", 2)
	player:getInventory():AddItems("CannedBroccoli", 2)
end

function EHE_Recipe.SURVIVORSEEDS(_, _, player)
	player:getInventory():AddItems("Fertilizer", 3)
	player:getInventory():AddItems("farming.CabbageBagSeed", 3)
	player:getInventory():AddItems("farming.PotatoBagSeed", 3)
	player:getInventory():AddItems("farming.BroccoliBagSeed", 3)
	player:getInventory():AddItems("farming.TomatoBagSeed", 3)
	player:getInventory():AddItems("farming.CarrotBagSeed", 3)
end

function EHE_Recipe.SURVIVORTOILET(_, _, player)
	player:getInventory():AddItems("ToiletPaper", 10)
end

function EHE_Recipe.SURVIVORFISHING(_, _, player)
	player:getInventory():AddItems("FishingRod", 3)
	player:getInventory():AddItems("FishingLine", 3)
	player:getInventory():AddItems("FishingTackle", 3)
	player:getInventory():AddItems("FishingNet", 4)
end

function EHE_Recipe.SURVIVORCANNING(_, _, player)
	player:getInventory():AddItems("BoxOfJars", 2)
	player:getInventory():AddItems("Sugar", 1)
	player:getInventory():AddItems("Vinegar", 1)
end


---Forces a numerically keyed list into a type=true table, Allows for: 'if list[key] == true' checks.
---@param list table of type paths
function EHE_Recipe.convertNumericListToKeyedTable(list,table) for _,value in pairs(list) do table[value]=true end end

EHE_Recipe.typesThatCanOpenBoxes = EHE_Recipe.typesThatCanOpenBoxes or {}
---Sub-mod authors will have to use the following function to add more types
EHE_Recipe.convertNumericListToKeyedTable(
	{"Base.IcePick","Base.HandScythe","Base.MeatCleaver","Base.LetterOpener","Base.Katana","Base.Scalpel","Base.GardenFork",}
	,EHE_Recipe.typesThatCanOpenBoxes)

EHE_Recipe.additionalTagChecks = EHE_Recipe.additionalTagChecks or {}
EHE_Recipe.convertNumericListToKeyedTable(
	{"Screwdriver","DullKnife","SharpKnife","Write","ChopTree","CutPlant","Scissors","Fork","Spoon"}
	, EHE_Recipe.additionalTagChecks)


local ran = false
---Scans through every item, checks for types listed above as well as additional tag checks - avoids redundant tags
function EHE_Recipe.addCanOpenBoxesTagToTypesThatCan()
	if ran then return else ran = true end
	---Adds "CanOpenBoxes" tag to scripts for type
	local allItems = ScriptManager.instance:getAllItems()
	local debugText = "EHE: Added Tag 'CanOpenBoxes' to: "

	for i=0, allItems:size()-1 do
		---@type Item
		local itemScript = allItems:get(i)
		local itemFullName = itemScript:getFullName()
		local tags = itemScript:getTags()
		local addCanOpenBoxesTag = EHE_Recipe.typesThatCanOpenBoxes[itemFullName]
		local tagString = ""

		if tags:contains("EHESignalFlare") then
			eheFlares.addFlareType(itemFullName, "EHESignalFlare")
		elseif tags:contains("EHEFlare") then
			eheFlares.addFlareType(itemFullName, "EHEFlare")
		end

		for ii=0, tags:size()-1 do
			---@type string
			local tag = tags:get(ii)

			if EHE_Recipe.additionalTagChecks[tag] then
				addCanOpenBoxesTag = true
			end
			tagString = tagString..tag..";"
		end

		if addCanOpenBoxesTag then
			debugText = debugText..itemFullName..", "
			itemScript:DoParam("Tags = "..tagString..";CanOpenBoxes")
		end
	end
	print(debugText)
end

Events.OnGameBoot.Add(EHE_Recipe.addCanOpenBoxesTagToTypesThatCan)
