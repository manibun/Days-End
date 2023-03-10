
ISLightTilesMenu = {};
ISLightTilesMenu.currentSquare = nil;
ISLightTilesMenu.tent = nil;

ISLightTilesMenu.doCampingMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory();
	
	local addTent = false;
	local removeTent = nil
	local tentKit = nil

	local containers = ISInventoryPaneContextMenu.getContainers(playerObj)
	for i=1,containers:size() do
		local container = containers:get(i-1)
		for j=1,container:getItems():size() do
			local item = container:getItems():get(j-1)
			local type = item:getType()
			if type == "BatteryLamp" then
				tentKit = item
			end
		end
	end

	for i,v in ipairs(worldobjects) do
		ISLightTilesMenu.tent = camping.getCurrentTent(v:getSquare());
		-- we have to be outside
--~ 		if (v:getSquare():getProperties():Is(IsoFlagType.exterior)) then
			if tentKit and ISLightTilesMenu.tent == nil then
				addTent = true;
			end
			if ISLightTilesMenu.tent ~= nil then
				removeTent = ISLightTilesMenu.tent
			end
--~ 			break;
--~ 		end
	end

	if addTent then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption("Place Lamp", worldobjects, ISLightTilesMenu.onAddTent, player, tentKit);
	end
	if removeTent then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption("Take Lamp", worldobjects, ISLightTilesMenu.onRemoveTent, player, removeTent);
	end
end

function ISLightTilesMenu.toPlayerInventory(playerObj, item)
    ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
end


ISLightTilesMenu.onAddTent = function(worldobjects, player, tentKit)
    	local sprite = {sprite = "lighting_indoor_01_44", northSprite = "lighting_indoor_01_52", eastSprite = "lighting_indoor_01_12", southSprite = "lighting_indoor_01_36"};
	local playerObj = getSpecificPlayer(player)
	ISLightTilesMenu.toPlayerInventory(playerObj, tentKit)
	local bo = ISLightSource:new(sprite.sprite, sprite.northSprite, playerObj)
    	bo.offsetX = 0;
    	bo.offsetY = 0;
    	bo.fuel = "Base.Battery";
    	bo:setEastSprite(sprite.eastSprite);
    	bo:setSouthSprite(sprite.southSprite);
    	bo.baseItem = "filcher.BatteryLamp";
    	bo.radius = 8;
	bo.player = player
	getCell():setDrag(bo, player);
end

ISLightTilesMenu.onRemoveTent = function(worldobjects, player, tent)
	local playerObj = getSpecificPlayer(player)
	if luautils.walkAdj(playerObj, tent:getSquare()) then
		ISTimedActionQueue.add(ISRemoveTentAction:new(playerObj, tent, 60));
	end
end

Events.OnFillWorldObjectContextMenu.Add(ISLightTilesMenu.doCampingMenu);
